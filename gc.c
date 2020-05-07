#include "utils.h"
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// The end of the text segment (used for smarter printing)
extern uint64_t etext;

// From main.c
void printHelp(FILE *out, SNAKEVAL val);

// Exit with the given message due to an internal compiler error
void ice(char *s) {
  printf("%s", s);
  printf("\n");
  exit(1);
}

void naive_print_heap(uint64_t *heap, uint64_t *heap_end) {
  for (uint64_t i = 0; i < (uint64_t)(heap_end - heap); i += 1) {
    printf("  %ld/%p: %p\t(%ld)\n", i, (heap + i), (uint64_t *)(*(heap + i)), *(heap + i));
  }
}

void printType(SNAKEVAL v) {
  if (is_snake_bool(v)) {
    printf("bool");
  } else if (is_snake_int(v)) {
    printf("int");
  } else if (is_snake_tuple(v)) {
    printf("tuple");
  } else if (is_snake_closure(v)) {
    printf("function");
  } else if (is_forwarding_ptr(v)) {
    printf("forward");
  } else {
    printf("???");
  }
}

bool heuristic_is_function_pointer(uint64_t *ptr) { return (*(ptr) < (uint64_t)&etext && *(ptr) > 1000); }

bool is_all_null(uint64_t *start, uint64_t *end) {
  for (uint64_t *i = start; i < end; i++) {
    if (*i != 0) {
      return false;
    }
  }
  return true;
}

void smarter_print_heap_helper(uint64_t *heap, uint64_t *heap_end) {
  uint64_t i = 0;
  while (i < (uint64_t)(heap_end - heap)) {
    if (heuristic_is_function_pointer(heap + i + 1)) {
      // We're at the start of a lambda
      printf("  %ld/%p:\tFunction Arity:\t%ld\n", i, (heap + i), *(heap + i) / 2);
      printf("  %ld/%p:\tFunction Ptr:\t%p\n", i + 1, (heap + i + 1), (uint64_t *)*(heap + i + 1));
      uint64_t num_closed = *(heap + i + 2) / 2;
      printf("  %ld/%p:\tNum Closed:\t%ld\n", i + 2, (heap + i + 2), num_closed);
      for (int x = 1; x <= num_closed; x++) {
        printf("  %ld/%p:\tClosed #%d:\t", i + 2 + x, (heap + i + 2 + x), x);
        printHelp(stdout, *(heap + i + 2 + x));
        printf("\n");
      }
      uint64_t total_size = 3 + num_closed;
      if (total_size % 2 == 1) {
        printf("  %ld/%p:\tPadding\n", i + 3 + num_closed, (heap + i + 3 + num_closed));
        i += 1;
      }
      i += total_size;
    } else if (is_all_null(heap + i, heap_end)) {
      for (uint64_t *x = heap + i; x < heap_end; x++) {
        printf("  %ld/%p:\tNull\n", x - heap, x);
      }
      break;
    } else {
      // We're at the start of a tuple
      uint64_t tuple_size = *(heap + i) / 2;

      printf("  %ld/%p:\tTuple Size:\t%ld\n", i, (heap + i), *(heap + i) / 2);

      for (int x = 1; x <= tuple_size; x++) {
        printf("  %ld/%p:\tTuple Elem #%d:\t", i + x, (heap + i + x), x);
        fflush(stdout);
        printHelp(stdout, *(heap + i + x));
        printf("\n");
      }

      uint64_t total_size = 1 + tuple_size;
      if (total_size % 2 == 1) {
        printf("  %ld/%p:\tPadding\n", i + 1 + tuple_size, (heap + i + 1 + tuple_size));
        i += 1;
      }
      i += total_size;
    }
    fflush(stdout);
  }
}

// // Naively print out everything on the heap assuming it is a snake tagged value (may segfault)
// void smarter_print_heap_helper(uint64_t *heap, uint64_t *heap_end) {
//   for (uint64_t i = 0; i < (uint64_t)(heap_end - heap); i += 1) {
//     printf("  %ld/%p: ", i, (heap + i));
//     printType(*(heap + i));
//     printf(":\t");
//     printHelp(stdout, *(heap + i));
//     printf("\n");
//   }
// }

void smarter_print_heap(uint64_t *from_start, uint64_t *from_end, uint64_t *to_start, uint64_t *to_end) {
  printf("Source heap: \n");
  naive_print_heap(from_start, from_end);
  printf("Destination heap: \n");
  smarter_print_heap_helper(to_start, to_end);
}

// Align upwards to the nearest integer multiple of 16
uint64_t *align_to_16(uint64_t *ptr) {
  uint64_t alignment_offset = (16 - ((uint64_t)ptr) % 16);
  if ((alignment_offset % 16) != 0) {
    return (uint64_t *)(((uint64_t)ptr) + alignment_offset);
  }
  return ptr;
}

/*
  Copies a Garter value from the given address to the new heap,
  but only if the value is heap-allocated and needs copying.

  Arguments:
    garter_val_addr: the *address* of some Garter value, which contains a Garter value,
                     i.e. a tagged word.
                     It may or may not be a pointer to a heap-allocated value...
    heap_top: the location at which to begin copying, if any copying is needed

  Return value:
    The new top of the heap, at which to continue allocations

  Side effects:
    If the data needed to be copied, then this replaces the value at its old location
    with a forwarding pointer to its new location
 */
uint64_t *copy_if_needed(uint64_t *garter_val_addr, uint64_t *heap_top) {
  if (DEBUG) {
    printf("copy_if_needed(");
    // printHelp(stdout, *garter_val_addr);
    printType(*garter_val_addr);
    printf(")\n");
  }
  SNAKEVAL garter_val = *garter_val_addr;

  if (is_snake_int(garter_val) || is_snake_bool(garter_val) || garter_val == NIL) {
    return heap_top;
  }

  assert(is_snake_closure(garter_val) || is_snake_tuple(garter_val) || is_snake_string(garter_val));
  uint64_t *heap_thing_addr = (uint64_t *)untag(garter_val);
  uint64_t thing_tag = get_tag(garter_val);

  if (is_forwarding_ptr(*heap_thing_addr)) {
    uint64_t tag = 0;
    if (is_snake_closure(garter_val)) {
      tag = CLOSURE_TAG;
    } else if (is_snake_tuple(garter_val)) {
      tag = TUPLE_TAG;
    } else {
      // todo: string support
      ice("Found forwarding pointer that pointed to not(closure || tuple)");
    }

    uint64_t forwarded_to_thing = (untag(*heap_thing_addr)) + tag;
    *garter_val_addr = forwarded_to_thing;
    return heap_top;
  }

  uint64_t thing_size = 0;
  if (is_snake_tuple(garter_val)) {
    uint64_t tuple_len = ((*heap_thing_addr) >> 1);
    thing_size = tuple_len + 1;
  } else if (is_snake_closure(garter_val)) {
    uint64_t num_closed_over = *(heap_thing_addr + 2) / 2;
    thing_size = num_closed_over + 3;
  } else {
    // todo: string support
    ice("Found not(closure || tuple) when calculating the size of the thing being garbage collected");
  }

  // (1). Copy heap_thing to the destination heap space
  for (int i = 0; i < thing_size; i++) {
    if (DEBUG) {
      printf("Copying over sub-element %d (at %p) to %p: ", i, (heap_thing_addr + i), (heap_top + i));
      printType(*(heap_thing_addr + i));
      printf("\n");
    }
    *(heap_top + i) = *(heap_thing_addr + i);
  }

  // (2). Calculate our new tagged addr for the copied value and store it
  uint64_t new_addr = (uint64_t)heap_top + thing_tag;
  *garter_val_addr = new_addr;

  // (3). Set up forwarding
  if (DEBUG) {
    printf("Forwarding config: Set *%p --> %p\n", heap_thing_addr, (uint64_t *)(((uint64_t)heap_top)));
  }
  *heap_thing_addr = ((uint64_t)heap_top) + FORWARDING_TAG;

  // (4). Increment heap_top and make sure it is still aligned
  uint64_t *old_heap_top = heap_top;
  heap_top += thing_size;
  heap_top = align_to_16(heap_top);

  // (5). Recursively call copy_if_needed on each sub-item
  uint64_t first_sub_elem = 0;
  if (is_snake_tuple(garter_val)) {
    // The first sub-item of a tuple is at index 1 (after the tuple size)
    first_sub_elem = 1;
  } else if (is_snake_closure(garter_val)) {
    // The first sub-item of a closure is at index 3 (after the arity, function pointer, number of closed over items)
    first_sub_elem = 3;
  } else {
    // todo: string support 
    ice("Found not(tuple || closure) when recursively copying sub-elements!");
  }
  // Recursively call on each sub-item
  for (uint64_t i = first_sub_elem; i <= thing_size; i++) {
    uint64_t *item_addr = old_heap_top + i;
    if (DEBUG && false) {
      printf("Recurring --> ");
      printHelp(stdout, *item_addr);
      printf("\n");
    }
    uint64_t *new_heap_top = copy_if_needed(item_addr, heap_top);
    heap_top = align_to_16(new_heap_top);
  }

  // (6). Return the updated heap_top
  return heap_top;
}

/*
  Implements Cheney's garbage collection algorithm.

  Arguments:
    bottom_frame: the base pointer of our_code_starts_here, i.e. the bottommost Garter frame
    top_frame: the base pointer of the topmost Garter stack frame
    top_stack: the current stack pointer of the topmost Garter stack frame
    from_start and from_end: bookend the from-space of memory that is being compacted
    to_start: the beginning of the to-space of memory

  Returns:
    The new location within to_start at which to allocate new data
 */
uint64_t *gc(uint64_t *bottom_frame, uint64_t *top_frame, uint64_t *top_stack, uint64_t *from_start, uint64_t *from_end,
             uint64_t *to_start) {
  for (uint64_t *cur_word = top_stack; cur_word < top_frame; cur_word++) {
    if (DEBUG) {
      printf("loop:\n");
    }
    to_start = copy_if_needed(cur_word, to_start);
  }
  if (top_frame < bottom_frame) {
    to_start = gc(bottom_frame,
                  (uint64_t *)(*top_frame), // [top_frame] points to the saved RBP, which is the next stack frame
                  top_frame + 2,            // [top_frame+4] points to the return address
                                            // so [top_frame+8] is the next frame's stack-top
                  from_start, from_end,
                  to_start); // to_start has been changed to include any newly copied data
  }
  // after copying the remaining stack frames, return the new allocation starting point
  return to_start;
}
