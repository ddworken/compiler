#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "utils.h"

const uint64_t NUM_TAG_MASK = 0x0000000000000001;
const uint64_t BOOL_TAG_MASK = 0x0000000000000007;
const uint64_t TUPLE_TAG_MASK = 0x0000000000000007;
const uint64_t CLOSURE_TAG_MASK = 0x0000000000000007;
const uint64_t NUM_TAG = 0x0000000000000000;
const uint64_t BOOL_TAG = 0x0000000000000007;
const uint64_t TUPLE_TAG = 0x0000000000000001;
const uint64_t CLOSURE_TAG = 0x0000000000000005;
const uint64_t FORWARDING_TAG = 0x0000000000000003;
const uint64_t STRING_TAG = 0x0000000000000003;
const uint64_t BOOL_TRUE = 0xFFFFFFFFFFFFFFFF;
const uint64_t BOOL_FALSE = 0x7FFFFFFFFFFFFFFF;
const uint64_t NIL = ((uint64_t)NULL | TUPLE_TAG);

typedef uint64_t SNAKEVAL;

bool is_snake_int(SNAKEVAL val) {
  uint64_t lsb = val & 1;
  return lsb == 0;
}

bool is_snake_bool(SNAKEVAL val) {
  return val == BOOL_TRUE || val == BOOL_FALSE;
}

bool is_snake_tuple(SNAKEVAL val) {
  return get_tag(val) == TUPLE_TAG;
}

bool is_snake_closure(SNAKEVAL val) {
  return get_tag(val) == CLOSURE_TAG;
}

bool is_forwarding_ptr(SNAKEVAL val) {
  return get_tag(val) == FORWARDING_TAG;
}

bool is_snake_string(SNAKEVAL val) {
  return get_tag(val) == STRING_TAG;
}

uint64_t untag(SNAKEVAL val) {
    return (val >> 3) << 3;
}

uint64_t get_tag(SNAKEVAL val) {
    return (val << 61) >> 61;
}