#pragma once 
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#define DEBUG false

const uint64_t NUM_TAG_MASK;
const uint64_t BOOL_TAG_MASK;
const uint64_t TUPLE_TAG_MASK;
const uint64_t CLOSURE_TAG_MASK;
const uint64_t NUM_TAG;
const uint64_t BOOL_TAG;
const uint64_t TUPLE_TAG;
const uint64_t CLOSURE_TAG;
const uint64_t FORWARDING_TAG;
const uint64_t STRING_TAG;
const uint64_t BOOL_TRUE;
const uint64_t BOOL_FALSE;
const uint64_t NIL;

typedef uint64_t SNAKEVAL;

bool is_snake_int(SNAKEVAL val);

bool is_snake_bool(SNAKEVAL val);

bool is_snake_tuple(SNAKEVAL val);

bool is_snake_closure(SNAKEVAL val);

bool is_forwarding_ptr(SNAKEVAL val);

bool is_snake_string(SNAKEVAL val);

uint64_t untag(SNAKEVAL val);

uint64_t get_tag(SNAKEVAL val);