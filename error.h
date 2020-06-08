// From main.c
void printHelp(FILE *out, SNAKEVAL val);
extern uint64_t* HEAP_BASE;

// From the generated assembly
extern const char* EXCEPTION_NAMES asm("EXCEPTION_NAMES");

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
const uint64_t ERR_UNHANDLED_EXN = 16;

extern void error(uint64_t err_code, SNAKEVAL val) asm("error");

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
  case ERR_UNHANDLED_EXN:
    fprintf(stderr, "Unhandled exception: %s\n", (&EXCEPTION_NAMES)[val]);
    break;
  default:
    fprintf(stderr, "Error: Unknown error code: %ld, val: ", code);
    printHelp(stderr, val);
  }

  free(HEAP_BASE); 
  exit(code);
}
