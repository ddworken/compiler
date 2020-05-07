#include "gc.h"
#include <assert.h>
#include <limits.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>

extern SNAKEVAL our_code_starts_here(uint64_t *HEAP) asm("our_code_starts_here");
extern void error(uint64_t err_code, SNAKEVAL val) asm("error");
extern SNAKEVAL print(SNAKEVAL val) asm("native#print");
extern SNAKEVAL input() asm("native#input");
extern SNAKEVAL string_len(SNAKEVAL val) asm("native#string_len");
extern SNAKEVAL equal(SNAKEVAL val1, SNAKEVAL val2) asm("native#equal");
extern SNAKEVAL char_at(SNAKEVAL s_str, SNAKEVAL s_idx) asm("native#char_at");
extern SNAKEVAL print_stack(uint64_t stack[], uint64_t rbp, uint64_t num_args, SNAKEVAL val) asm("print_stack");
extern uint64_t *try_gc(uint64_t *alloc_ptr, uint64_t amount_needed, uint64_t *first_frame,
                        uint64_t *stack_top) asm("try_gc");
extern SNAKEVAL printRaw(SNAKEVAL v) asm("printRaw");
uint64_t HEAP_SIZE;
uint64_t *HEAP_BASE;
uint64_t *HEAP_END;
uint64_t REMAINING_HEAP_SIZE;

const uint64_t ERR_COMP_NOT_NUM = 1;
const uint64_t ERR_ARITH_NOT_NUM = 2;
const uint64_t ERR_LOGIC_NOT_BOOL = 3;
const uint64_t ERR_IF_NOT_BOOL = 4;
const uint64_t ERR_OVERFLOW = 5;
const uint64_t ERR_GET_NOT_TUPLE = 6;
const uint64_t ERR_GET_LOW_INDEX = 7;
const uint64_t ERR_GET_HIGH_INDEX = 8;
const uint64_t ERR_NIL_DEREF = 9;
const uint64_t ERR_OUT_OF_MEMORY = 10;
const uint64_t ERR_CALL_NOT_CLOSURE = 11;
const uint64_t ERR_CALL_ARITY_ERR = 12;
const uint64_t ERR_OUT_OF_STACK_MEMORY = 13;
const uint64_t ERR_EXPECTED_STRING = 14;
const uint64_t ERR_EXPECTED_NUM = 15;


uint64_t STACK_BOTTOM;
// 8MB stack
const uint64_t STACK_SIZE = 8 * 1024 * 1024;

SNAKEVAL printRaw(SNAKEVAL val) {
  printf("%#018lx ==> %ld\n", val, val);
  return val;
}

typedef struct equal_cache {
  SNAKEVAL left;
  SNAKEVAL right;
} equal_cache;

int ensure_cache(equal_cache **p_cache, int last, int size, int needed) {
  int minneeded = last + needed;
  if (minneeded >= size) {
    int doubled = size * 2;
    int newsize = (doubled > minneeded) ? doubled : minneeded;
    equal_cache *newcache = (equal_cache *)realloc(*p_cache, size * 2 * sizeof(equal_cache));
    if (newcache != NULL) {
      *p_cache = newcache;
      return newsize;
    } else {
      fprintf(stderr, "Internal error while trying to compute equality\n");
      return 0;
    }
  }
  return size;
}

SNAKEVAL equal(SNAKEVAL val1, SNAKEVAL val2) {
  int size = 100;
  equal_cache *cache = (equal_cache *)calloc(size, sizeof(equal_cache));
  int cur = 0;
  int last = 1;
  SNAKEVAL ans = BOOL_TRUE;
  cache[cur].left = val1;
  cache[cur].right = val2;
  while (cur < last) {
    val1 = cache[cur].left;
    val2 = cache[cur].right;
    cur++;
    if (val1 == val2) {
      continue;
    }
    if (val1 == NIL || val2 == NIL) {
      ans = BOOL_FALSE;
      break;
    }
    int found_cached = -1;
    for (int i = 0; i < cur - 1; i++) {
      if (cache[i].left == val1 && cache[i].right == val2) {
        found_cached = i;
        break;
      }
    }
    if (found_cached > -1) {
      continue;
    }
    if ((val1 & TUPLE_TAG_MASK) == TUPLE_TAG && (val2 & TUPLE_TAG_MASK) == TUPLE_TAG) {
      uint64_t *tup1 = (uint64_t *)(val1 - TUPLE_TAG);
      uint64_t *tup2 = (uint64_t *)(val2 - TUPLE_TAG);
      if (tup1[0] != tup2[0]) {
        ans = BOOL_FALSE;
        break;
      }
      size = ensure_cache(&cache, last, size, tup1[0]);
      if (size == 0) {
        free(cache);
        return BOOL_FALSE;
      }
      for (int i = 1; i <= tup1[0] / 2; i++) {
        cache[last].left = tup1[i];
        cache[last].right = tup2[i];
        last++;
      }
      continue;
    }
    ans = BOOL_FALSE;
    break;
  }
  free(cache);
  return ans;
}

int tupleCounter = 0;
int functionCounter = 0;
void printHelp(FILE *out, SNAKEVAL val) {
  if (val == NIL) {
    fprintf(out, "nil");
  } else if ((val & NUM_TAG_MASK) == NUM_TAG) {
    fprintf(out, "%ld", ((int64_t)val) >> 1);
  } else if (val == BOOL_TRUE) {
    fprintf(out, "true");
  } else if (val == BOOL_FALSE) {
    fprintf(out, "false");
  } else if ((val & CLOSURE_TAG_MASK) == CLOSURE_TAG) {
    uint64_t *fun_ptr = (uint64_t *)(val - CLOSURE_TAG);
    if ((*fun_ptr & 0x8000000000000000) != 0) {
      fprintf(out, "<cyclic function %d>", (int)(*fun_ptr & 0x7FFFFFFFFFFFFFFF));
      return;
    }
    uint64_t arity = *(fun_ptr) / 2;
    *(fun_ptr) = 0x8000000000000000 | (++functionCounter);
    uint64_t num_closed = *(fun_ptr + 2) / 2;
    fprintf(out, "<function arity=%ld num_closed=%ld ", arity, num_closed);
    // For debugging purposes, comment out the below lines in order to
    // recursively print out the closed over values
    // for (int i = 0; i < num_closed; i++) {
    //   fprintf(out, "closed_%d='", i);
    //   printHelp(out, *(fun_ptr + 3 + i));
    //   fprintf(out, "' ");
    // }
    *(fun_ptr) = arity * 2;
    fprintf(out, ">");
  } else if ((val & TUPLE_TAG_MASK) == TUPLE_TAG) {
    uint64_t *addr = (uint64_t *)(val - TUPLE_TAG);
    if ((*addr & 0x8000000000000000) != 0) {
      fprintf(out, "<cyclic tuple %d>", (int)(*addr & 0x7FFFFFFFFFFFFFFF));
      return;
    }
    int len = (int)addr[0];
    if (len & 0x1) {
      fprintf(out, "tuple at %p forwarding to %p", addr, (uint64_t *)(uint64_t)(len - 0x1));
      return;
    } else {
      len /= 2;
    }
    *(addr) = 0x8000000000000000 | (++tupleCounter);
    fprintf(out, "(");
    for (int i = 1; i <= len; i++) {
      if (i > 1)
        fprintf(out, ", ");
      printHelp(out, addr[i]);
    }
    if (len == 1)
      fprintf(out, ", ");
    fprintf(out, ")");
    // Unmark this tuple: restore its length
    *(addr) = len << 1; // length is encoded
  } else if (is_snake_string(val)) {
    fprintf(out, "\"%s\"", (char *)(val - STRING_TAG));
  } else {
    fprintf(out, "Unknown value: %#018lx", val);
  }
  fflush(out);
}

SNAKEVAL print_stack(uint64_t stack[], uint64_t rbp, uint64_t num_args, SNAKEVAL val) {
  printf("RSP: 0x%016lx ==> %ld\n", (uint64_t)stack, stack[0]);
  printf("RBP: 0x%016lx ==> %ld\n", rbp, *((uint64_t *)(long)rbp));
  printf("(difference: %ld)\n", ((long)stack - ((long)rbp)) / 8);
  printf("Requested return val: %016lx	==> ", val);
  printHelp(stdout, val);
  printf("\n");
  printf("Num args: %ld\n", num_args);
  int i = 0;
  uint64_t next_rbp = 0;
  bool current_is_rbp = false;
  bool prev_was_rbp = false;
  while (true) {
    if (stack[i] == STACK_BOTTOM) {
      printf("BOT ");
      current_is_rbp = true;
    } else if (&stack[i] == (uint64_t *)rbp || &stack[i] == (uint64_t *)next_rbp) {
      printf("RBP(%lu, %lu) ", stack[i] - next_rbp, stack[i] - rbp);
      next_rbp = stack[i];
      current_is_rbp = true;
    } else {
      printf("    ");
    }

    printf("0x%016lx: 0x%016lx\t==>  ", (uint64_t)&stack[i], stack[i]);
    if (i == 0) {
      printf("old rbp");
    } else if (prev_was_rbp) {
      printf("saved ret");
      prev_was_rbp = false;
    } else if (current_is_rbp) {
      printf("old rbp");
    } else if (is_snake_bool(stack[i]) || is_snake_int(stack[i]) ||
               is_snake_tuple(stack[i] || is_snake_closure(stack[i]))) {
      printHelp(stdout, stack[i]);
    } else {
      printf("?????");
    }

    printf("\n");
    if (stack[i] == STACK_BOTTOM) {
      break;
    }
    i++;
    if (current_is_rbp) {
      prev_was_rbp = true;
    }
    current_is_rbp = false;
  }

  return val;
}

SNAKEVAL input() {
  // Malloc enough space for an int or a bool and read it in
  int max_input_length = 40;
  char *input_str = calloc(max_input_length, 1);
  assert(fgets(input_str, max_input_length, stdin) >= 0);

  // Check if it is true or false
  if (strcmp(input_str, "true\n") == 0) {
    return BOOL_TRUE;
  }
  if (strcmp(input_str, "false\n") == 0) {
    return BOOL_FALSE;
  }

  // Check if it is an int (not using atoi so we can crash if it is a non-int)
  char *end_ptr;
  int64_t c_int = strtol(input_str, &end_ptr, 10);
  // Assert that strtol parsed the entire input
  if (end_ptr != input_str + strlen(input_str) - 1) {
    fprintf(stderr, "input() received invalid data: %s", input_str);
    free(HEAP_BASE);
    exit(1);
  }
  uint64_t ret = ((uint64_t)c_int) << 1;
  if (c_int > (LONG_MAX / 2) || c_int < (LONG_MIN / 2)) {
    error(ERR_OVERFLOW, 0);
  }
  return ret;
}

SNAKEVAL print(SNAKEVAL val) {
  printHelp(stdout, val);
  printf("\n");
  fflush(stdout);
  return val;
}

SNAKEVAL string_len(SNAKEVAL val) {
  if (!is_snake_string(val)) {
    error(ERR_EXPECTED_STRING, val);
  }
  char* c_string = ((char*)(untag(val)));
  return strlen(c_string)<<1;
}

uint64_t* get_next_avail_heap_slot() {
      uint64_t* x;
    asm("\t movq %%r15,%0" : "=r"(x));
    return x;
}

uint64_t* try_gc_runtime(uint64_t bytes_needed) {
  if (get_next_avail_heap_slot() + bytes_needed < HEAP_END) {
    return get_next_avail_heap_slot();
  }
  // alloc_ptr is just R15
  uint64_t* alloc_ptr = get_next_avail_heap_slot();
  // Get RBP which includes the stack frame for this function
  uint64_t*** rbp = 0;
  asm("\t movq %%rbp,%0" : "=r"(rbp));
  // And then dereference it twice to go down to the last snake stackframe. This 
  // works because it RBP holds the pointer to the previous RBP. So each time we 
  // dereference it, we get a previous stack frame's RBP. We do it twice. Once for
  // this function's stack frame and once for the parent function's stackframe. 
  uint64_t* cur_frame = **rbp;
  // Get the top of the last snake stackframe by dereferencing it once to get to the
  // previous RBP and then subtracting two to go past RBP and the saved return location
  uint64_t* cur_stack_top = (uint64_t*)(((uint64_t)(*rbp)) - 2);

  printf("HEAP_BASE=%p\n", HEAP_BASE);
  printf("DEBUG: alloc_ptr=%p, bytes_needed=%ld, cur_frame=%p, cur_stack_top=%p\n", alloc_ptr, bytes_needed, cur_frame, cur_stack_top);
  printf("used heap space=%ld\n", ((uint64_t)alloc_ptr) - ((uint64_t)HEAP_BASE));

  return try_gc(alloc_ptr, bytes_needed, cur_frame, cur_stack_top);
}

void bump_heap_pointer(uint64_t amt) {
  volatile uint64_t temp = ((uint64_t)get_next_avail_heap_slot()) + amt;
asm("movq %0,%%r15"
  : 
  : "rm" (temp)
);

}

SNAKEVAL char_at(SNAKEVAL s_str, SNAKEVAL s_idx) {
  if (!is_snake_string(s_str)) {
    error(ERR_EXPECTED_STRING, s_str);
  } 
  if (!is_snake_int(s_idx)) {
    error(ERR_EXPECTED_NUM, s_idx);
  }
  uint64_t new_string_size = 2; // one for the character, one for the null
  uint64_t* loc = try_gc_runtime(new_string_size);

  char* source_string = (char*)untag(s_str);
  int64_t idx = ((int64_t)s_idx) >> 1;

  if (idx >= strlen(source_string) || idx < 0) {
    fprintf(stderr, "Error: char_at(%s, %ld): Index Out Of Bounds", source_string, idx);
      free(HEAP_BASE);
  exit(-1);
  }

  loc[0] = source_string[idx];
  loc[1] = 0;
  bump_heap_pointer(new_string_size);
  return (((uint64_t)loc) + STRING_TAG);
}

SNAKEVAL string_append(SNAKEVAL val) {
  return 0;
}

void error(uint64_t code, SNAKEVAL val) {
  switch (code) {
  case ERR_COMP_NOT_NUM:
    fprintf(stderr, "Type Error: comparison expected a number, found 0x%016lx", val);
    break;
  case ERR_ARITH_NOT_NUM:
    fprintf(stderr, "Type Error: arithmetic expected a number, found 0x%016lx", val);
    break;
  case ERR_LOGIC_NOT_BOOL:
    fprintf(stderr, "Type Error: logic expected a boolean, found 0x%016lx", val);
    break;
  case ERR_IF_NOT_BOOL:
    fprintf(stderr, "Type Error: if expected a boolean, found 0x%016lx", val);
    break;
  case ERR_OVERFLOW:
    fprintf(stderr, "Arithmetic Error: overflow");
    break;
  case ERR_GET_NOT_TUPLE:
    fprintf(stderr, "Type Error: expected tuple, found 0x%016lx", val);
    break;
  case ERR_GET_LOW_INDEX:
    fprintf(stderr, "index too small: %ld", val);
    break;
  case ERR_GET_HIGH_INDEX:
    fprintf(stderr, "index too large: %ld", val);
    break;
  case ERR_NIL_DEREF:
    fprintf(stderr, "Type Error: Attempted to access component of nil");
    break;
  case ERR_OUT_OF_MEMORY:
    fprintf(stderr, "Out of memory: Cannot allocate data of size %ld on the heap", val);
    break;
  case ERR_CALL_NOT_CLOSURE:
    fprintf(stderr, "Error: tried to call a non-function value: ");
    printHelp(stderr, val);
    break;
  case ERR_CALL_ARITY_ERR:
    fprintf(stderr, "Error: arity mismatch in call, actual arity=%ld\n", val / 2);
    break;
  case ERR_OUT_OF_STACK_MEMORY:
    fprintf(stderr, "Error: Out of stack memory!\n");
    break;
  case ERR_EXPECTED_STRING:
    fprintf(stderr, "Type Error: Expected a string, found: ");
    printHelp(stderr, val);
    fprintf(stderr, "\n");
    break;
  case ERR_EXPECTED_NUM:
    fprintf(stderr, "Type Error: Expected a number, found: ");
    printHelp(stderr, val);
    fprintf(stderr, "\n");
    break;
  default:
    fprintf(stderr, "Error: Unknown error code: %ld, val: ", code);
    printHelp(stderr, val);
  }

  free(HEAP_BASE);
  exit(code);
}

/*
  Try to reserve the desired number of bytes of memory, and free garbage if
  needed.  Fail (and exit the program) if there is insufficient memory.  Does
  not actually allocate the desired number of bytes of memory; the caller
  will do that.
  Arguments:
    uint64_t* alloc_ptr - the current top of the heap (which we store in R15), where
                          the next allocation should occur, if possible
    uint64_t bytes_needed - the number of bytes of memory we want to allocate
                            (including padding)
    uint64_t* cur_frame - the base pointer of the topmost stack frame of our code
                          (i.e., RBP)
    uint64_t* cur_stack_top - the stack pointer of the topmost stack frame of our
                              code (i.e., RSP)
  Returns:
    The new top of the heap (i.e. the new value of R15) after garbage collection.
    Does not actually allocate bytes_needed space.
  Side effect:
    Also updates HEAP_END to point to the new end of the heap, if it's changed
*/
uint64_t *try_gc(uint64_t *alloc_ptr, uint64_t bytes_needed, uint64_t *cur_frame, uint64_t *cur_stack_top) {
  if (DEBUG) {
    printf("Before try_gc(needed=%ld):\n", bytes_needed);
    smarter_print_heap_helper(HEAP_BASE, HEAP_END);
    printf("\n");
  }

  uint64_t *new_heap = (uint64_t *)calloc(HEAP_SIZE + 15, sizeof(uint64_t));
  uint64_t *old_heap = HEAP_BASE;

  uint64_t *new_r15 = (uint64_t *)(((uint64_t)new_heap + 15) & ~0xF);
  uint64_t *new_heap_end = new_r15 + HEAP_SIZE;

  uint64_t* from_start = (uint64_t *)(((uint64_t)HEAP_BASE + 15) & ~0xF);
  uint64_t* from_end = HEAP_END;
  uint64_t* dest_start = new_r15;
  uint64_t* dest_end = new_heap_end;

  // Abort early, if we can't allocate a new to-space
  if (new_heap == NULL) {
    fprintf(stderr, "Out of memory: could not allocate a new semispace for garbage collection\n");
    fflush(stderr);
    if (old_heap != NULL)
      free(old_heap);
    exit(ERR_OUT_OF_MEMORY);
  }

  new_r15 = gc((uint64_t *)STACK_BOTTOM, cur_frame, cur_stack_top, from_start, from_end, dest_start);
  HEAP_BASE = new_heap;
  HEAP_END = new_heap_end;
  free(old_heap);

  if (DEBUG) {
    printf("After try_gc(needed=%ld):\n", bytes_needed);
    smarter_print_heap(from_start, from_end, dest_start, dest_end);
    printf("\n");
  }

  uint64_t words_needed = bytes_needed / sizeof(uint64_t);

  // Note: strict greater-than is correct here: if new_r15 + (bytes_needed / 8) == HEAP_END,
  // that does not mean we're *using* the byte at HEAP_END, but rather that it would be the
  // next free byte, which is still ok and not a heap-overflow.
  if (words_needed > HEAP_SIZE) {
    fprintf(stderr, "Allocation error: needed %ld words, but the heap is only %ld words\n", words_needed, HEAP_SIZE);
    fflush(stderr);
    if (new_heap != NULL)
      free(new_heap);
    exit(ERR_OUT_OF_MEMORY);
  } else if ((new_r15 + words_needed) > HEAP_END) {
    fprintf(stderr, "Out of memory: needed %ld words, but only %ld remain after collection\n", words_needed,
            (HEAP_END - new_r15));
    fflush(stderr);
    if (new_heap != NULL)
      free(new_heap);
    exit(ERR_OUT_OF_MEMORY);
  } else {
    return new_r15;
  }
}

void configure_stack() {
  // Set the stack size
  struct rlimit lim = {STACK_SIZE + 1E6, STACK_SIZE + 1E6};

  if (setrlimit(RLIMIT_STACK, &lim) == -1) {
    printf("Failed to set stack size\n");
    exit(1);
  }
}

int main(int argc, char **argv) {
  configure_stack();
  HEAP_SIZE = 100000;
  if (argc > 1) {
    HEAP_SIZE = atoi(argv[1]);
  }
  if (HEAP_SIZE < 0) {
    HEAP_SIZE = 0;
  }
  HEAP_BASE = calloc(HEAP_SIZE, sizeof(uint64_t));
  REMAINING_HEAP_SIZE = (HEAP_SIZE) * sizeof(uint64_t);
  uint64_t alignment_offset = (16 - ((uint64_t)HEAP_BASE) % 16);
  if ((alignment_offset % 16) != 0) {
    REMAINING_HEAP_SIZE -= alignment_offset;
    HEAP_BASE += alignment_offset;
  }
  HEAP_END = (uint64_t *)((uint64_t)HEAP_BASE + REMAINING_HEAP_SIZE);

  if (DEBUG) {
    printf("Initially: HEAP_BASE= %ld, HEAP_END= %ld, avail= %ld\n", (uint64_t)HEAP_BASE, (uint64_t)HEAP_END,
           (uint64_t)(HEAP_END) - (uint64_t)(HEAP_BASE));
  }

  SNAKEVAL result = our_code_starts_here(HEAP_BASE);
  if (DEBUG) {
    uint64_t *tmp = 0;
    __asm__("\t mov %%r15,%0" : "=r"(tmp));
    printf("After:     HEAP_BASE= %ld, HEAP_END= %ld, avail= %ld, used= %ld\n", (uint64_t)tmp, (uint64_t)HEAP_END,
           (uint64_t)(HEAP_END) - (uint64_t)(tmp), (uint64_t)(tmp) - (uint64_t)(HEAP_BASE));
    smarter_print_heap_helper(HEAP_BASE, HEAP_END);
  }
  print(result);
  free(HEAP_BASE);
  return 0;
}