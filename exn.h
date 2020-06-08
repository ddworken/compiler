#include "error.h"
#include <assert.h>
#include <stdint.h>
#include <string.h>

typedef struct exn_handler {
 uint64_t exn;
 void *handler;
 uint64_t depth;
 uint64_t active;
 void *finally;
 uint64_t finally_active;
} exn_handler;

exn_handler *EXN_HANDLERS;
uint64_t NEXT_EXN_HANDLER_SLOT = 0;
// TODO: delete the below const?
uint64_t EXN_HANDLER_SIZE = sizeof(struct exn_handler);
uint64_t MAX_EXN_HANDLERS = 1000000;

void add_to_exn_table(uint64_t exn, void *exn_handler, void *finally) {
 struct exn_handler *x = &(EXN_HANDLERS[NEXT_EXN_HANDLER_SLOT]);
 x->depth = 0;
 x->exn = exn;
 x->handler = exn_handler;
 x->finally = finally;
 x->active = true;
 x->finally_active = true;
 NEXT_EXN_HANDLER_SLOT++;
 assert((void*)NEXT_EXN_HANDLER_SLOT < (void*)MAX_EXN_HANDLERS);
}

exn_handler *get_exn_handler(uint64_t exn) {
 for (int64_t i = NEXT_EXN_HANDLER_SLOT - 1; i >= 0; i--) {
   assert(i >= 0);
   if (EXN_HANDLERS[i].exn == exn && EXN_HANDLERS[i].active) {
     return &EXN_HANDLERS[i];
   }
 }
 error(ERR_UNHANDLED_EXN, 0);
 assert(false);
}

uint64_t get_exn_depth(uint64_t exn) { return get_exn_handler(exn)->depth; }

void *get_exn_location(uint64_t exn) { return get_exn_handler(exn)->handler; }

void clear_from_exn_table(void *handler) {
 for (int64_t i = NEXT_EXN_HANDLER_SLOT - 1; i >= 0; i--) {
   struct exn_handler *x = &(EXN_HANDLERS[i]);
   if (x->handler == handler && x->active) {
     x->active = false;
     return;
   }
 }
}

void increment_exn_depths() {
 for (uint64_t i = 0; i < NEXT_EXN_HANDLER_SLOT; i++) {
   struct exn_handler *x = &(EXN_HANDLERS[i]);
   x->depth++;
 }
}
void decrement_exn_depths() {
 for (uint64_t i = 0; i < NEXT_EXN_HANDLER_SLOT; i++) {
   struct exn_handler *x = &(EXN_HANDLERS[i]);
   x->depth--;
 }
}

void clear_exn_table_before_jmp(uint64_t dest_exn) {
 exn_handler *exn = get_exn_handler(dest_exn);
 for (int64_t i = NEXT_EXN_HANDLER_SLOT - 1; i >= 0; i--) {
   struct exn_handler *x = &(EXN_HANDLERS[i]);
   if (x == exn) {
     break;
   }
   memset(x, 0, sizeof(exn_handler));
   NEXT_EXN_HANDLER_SLOT--;
 }
}

// void disable_finally(void *finally_handler) {
//  for (int64_t i = NEXT_EXN_HANDLER_SLOT - 1; i >= 0; i--) {
//    struct exn_handler *x = &(EXN_HANDLERS[i]);
//    if (x->finally_handler == finally_handler && x->finally_active) {
//      x->finally_active = false;
//      break;
//    }
//  }
// }