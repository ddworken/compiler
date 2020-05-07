section .text
extern error
extern native#print
extern print_stack
extern try_gc
extern STACK_BOTTOM
extern STACK_SIZE
extern native#string_len
extern native#char_at
extern native#input
extern native#equal
extern HEAP_END
global our_code_starts_here

our_code_starts_here:
  enter 192, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-2434 {
  jmp near lambda_end_2434
lambda_2434:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+24] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  call native#print
  leave
  ret
  ;; } define lambda-2434
lambda_end_2434:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_2434
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_2434:
  ;; Store lambda-2434 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_2434 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-2434
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-2431 {
  jmp near lambda_end_2431
lambda_2431:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  call native#input
  leave
  ret
  ;; } define lambda-2431
lambda_end_2431:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_2431
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_2431:
  ;; Store lambda-2431 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_2431 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-2431
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-2426 {
  jmp near lambda_end_2426
lambda_2426:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  mov RSI, [RBP+24]
  call native#equal
  leave
  ret
  ;; } define lambda-2426
lambda_end_2426:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_2426
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_2426:
  ;; Store lambda-2426 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_2426 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-2426
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-2422 {
  jmp near lambda_end_2422
lambda_2422:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+24] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  call native#string_len
  leave
  ret
  ;; } define lambda-2422
lambda_end_2422:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_2422
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_2422:
  ;; Store lambda-2422 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_2422 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-2422
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-2417 {
  jmp near lambda_end_2417
lambda_2417:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  mov RSI, [RBP+24]
  call native#char_at
  leave
  ret
  ;; } define lambda-2417
lambda_end_2417:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_2417
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_2417:
  ;; Store lambda-2417 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_2417 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-2417
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; Define lambda-2253 {
  jmp near lambda_end_2253
lambda_2253:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 224
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 224, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-224], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+56] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: print_4
  ;; } Copy the free variables off the heap onto the stack
  ;; and_lhs {
  ;; or_lhs {
  mov RAX, [RBP+40]
  mov R11, RAX
  mov RAX, [RBP+40]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2414
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2414
_cmp_fail_2414:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2414:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2410
  ;; or_rhs {
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2411
  ;; and_rhs {
  mov RAX, [RBP+32]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2411
  mov RAX, 0xffffffffffffffff
and_done_2411:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2410
  mov RAX, 0x7fffffffffffffff
or_done_2410:
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_and_or_59
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2387
  mov RAX, -6
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -4
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_67
  mov RAX, [RBP+40]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-40], RAX ; [RBP-40] holds the variable unary_70
  mov RAX, [RBP-32]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-40]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_2387
if_false_2387:
  mov RAX, [RBP+16]
  mov R11, RAX
  mov RAX, -18
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2396
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2396
_cmp_fail_2396:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2396:
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_73
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2389
  mov RAX, [RBP+32]
  mov R11, RAX
  mov RAX, -6
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2392
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2392
_cmp_fail_2392:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2392:
  jmp near done_2389
if_false_2389:
  mov RAX, -14
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_2389:
done_2387:
  mov [RBP-24], RAX ; [RBP-24] holds the variable if_58
  mov RAX, [RBP+40]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP+40]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_83
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-32] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-32])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-40], RAX ; [RBP-40] holds the variable app_82
  mov RAX, [RBP-40]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-48], RAX ; [RBP-48] holds the variable unary_81
  mov RAX, [RBP-24]
  mov R11, RAX
  mov RAX, [RBP-48]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2376
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2376
_cmp_fail_2376:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2376:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2254
  ;; and_rhs {
  mov RAX, [RBP+40]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP+40]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_90
  mov RAX, [RBP-16]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-24], RAX ; [RBP-24] holds the variable unary_89
  mov RAX, [RBP-24]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-32], RAX ; [RBP-32] holds the variable unary_88
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2258
  mov RAX, [RBP+40]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-40], RAX ; [RBP-40] holds the variable unary_98
  mov RAX, [RBP-40]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-48], RAX ; [RBP-48] holds the variable elfaetvsvv_95
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+32] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+32])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-56], RAX ; [RBP-56] holds the variable app_104
  mov RAX, [RBP-56]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_2354
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_2354
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_2354
_is_bool_found_bool_2354:
  mov RAX, 0xffffffffffffffff
_is_bool_done_2354:
  mov [RBP-64], RAX ; [RBP-64] holds the variable meizfavnsm_101
  mov RAX, [RBP+40]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-72], RAX ; [RBP-72] holds the variable unary_111
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2348
  mov RAX, -2
  jmp near done_2348
if_false_2348:
  mov RAX, [RBP+40]
done_2348:
  mov [RBP-80], RAX ; [RBP-80] holds the variable if_113
  mov RAX, [RBP-72]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-80]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-88], RAX ; [RBP-88] holds the variable oitownzuys_108
  mov RAX, [RBP-88]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-88]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-96], RAX ; [RBP-96] holds the variable binop_121
  mov RAX, [RBP-96]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-104], RAX ; [RBP-104] holds the variable bntsktmtpa_118
  ;; and_lhs {
  mov RAX, [RBP+32]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_2338
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_2338
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_2338
_is_bool_found_bool_2338:
  mov RAX, 0xffffffffffffffff
_is_bool_done_2338:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2334
  ;; and_rhs {
  ;; or_lhs {
  mov RAX, [RBP+16]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2335
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2335
  mov RAX, 0x7fffffffffffffff
or_done_2335:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2334
  mov RAX, 0xffffffffffffffff
and_done_2334:
  mov [RBP-112], RAX ; [RBP-112] holds the variable jpovhpnjts_125
  ;; and_lhs {
  ;; or_lhs {
  mov RAX, [RBP+32]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2331
  ;; or_rhs {
  mov RAX, [RBP+16]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2331
  mov RAX, 0x7fffffffffffffff
or_done_2331:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2327
  ;; and_rhs {
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2328
  ;; and_rhs {
  mov RAX, [RBP-112]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2328
  mov RAX, 0xffffffffffffffff
and_done_2328:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2327
  mov RAX, 0xffffffffffffffff
and_done_2327:
  jmp near done_2258
if_false_2258:
  mov RAX, [RBP+40]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-40], RAX ; [RBP-40] holds the variable unary_142
  mov RAX, [RBP+24]
  mov [RBP-48], RAX ; [RBP-48] holds the variable feoiiwslpf_146
  mov RAX, [RBP+40]
  mov [RBP-56], RAX ; [RBP-56] holds the variable guegtadjvf_150
  mov RAX, -14
  mov [RBP-64], RAX ; [RBP-64] holds the variable xifxshljgw_154
  mov RAX, [RBP+48]
  mov [RBP-72], RAX ; [RBP-72] holds the variable omftnutvev_158
  mov RAX, [RBP+32]
  mov [RBP-80], RAX ; [RBP-80] holds the variable xoihukgtje_162
  mov RAX, [RBP-80]
  mov [RBP-88], RAX ; [RBP-88] holds the variable ivfoivrekj_166
  mov RAX, [RBP+40]
  mov [RBP-96], RAX ; [RBP-96] holds the variable fbporboljo_170
  mov RAX, 6
  mov [RBP-104], RAX ; [RBP-104] holds the variable tmgnsltsfg_174
  mov RAX, [RBP+32]
  mov [RBP-112], RAX ; [RBP-112] holds the variable odkmdugvvy_178
  mov RAX, [RBP-80]
  mov [RBP-120], RAX ; [RBP-120] holds the variable eqemqrhziu_182
  mov RAX, [RBP-40]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-56]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-128], RAX ; [RBP-128] holds the variable binop_141
  mov RAX, [RBP+40]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -12
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-136], RAX ; [RBP-136] holds the variable binop_187
  mov RAX, [RBP+16]
  mov [RBP-144], RAX ; [RBP-144] holds the variable ghcrzynqji_192
  mov RAX, [RBP+40]
  mov [RBP-152], RAX ; [RBP-152] holds the variable nivjydshso_196
  mov RAX, [RBP-144]
  mov [RBP-160], RAX ; [RBP-160] holds the variable nfbhycdpol_200
  mov RAX, -6
  mov [RBP-168], RAX ; [RBP-168] holds the variable ciaytxgisv_204
  mov RAX, [RBP-168]
  mov [RBP-176], RAX ; [RBP-176] holds the variable jupmrsbofm_208
  mov RAX, [RBP+16]
  mov [RBP-184], RAX ; [RBP-184] holds the variable fwdcpjviyl_212
  mov RAX, 20
  mov [RBP-192], RAX ; [RBP-192] holds the variable xsdokfwqvs_216
  mov RAX, [RBP-144]
  mov [RBP-200], RAX ; [RBP-200] holds the variable crvauwtmoc_220
  mov RAX, 16
  mov [RBP-208], RAX ; [RBP-208] holds the variable ycuegfvagf_224
  mov RAX, 0x7fffffffffffffff
  mov [RBP-216], RAX ; [RBP-216] holds the variable omkmmqfykq_228
  mov RAX, [RBP-136]
  mov R11, RAX
  mov RAX, -12
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2286
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2286
_cmp_fail_2286:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2286:
  mov [RBP-224], RAX ; [RBP-224] holds the variable binop_186
  mov RAX, [RBP-128]
  mov R11, RAX
  mov RAX, [RBP-224]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2283
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2283
_cmp_fail_2283:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2283:
done_2258:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2254
  mov RAX, 0xffffffffffffffff
and_done_2254:
  leave
  ret
  ;; } define lambda-2253
lambda_end_2253:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_2253
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_2253:
  ;; Store lambda-2253 on the heap {
  mov QWORD [R15+0], 10 ; Store the arity
  mov QWORD [R15+8], lambda_2253 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-2253
  mov [RBP-48], RAX ; Store letrec-ed function ceyyxthupa_53
  ;; Define lambda-1452 {
  jmp near lambda_end_1452
lambda_1452:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 1328
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 1328, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-304], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-312], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-320], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-328], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-336], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-344], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-352], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-360], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-368], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-376], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-384], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-392], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-400], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-408], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-416], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-424], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-432], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-440], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-448], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-456], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-464], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-472], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-480], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-488], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-496], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-504], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-512], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-520], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-528], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-536], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-544], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-552], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-560], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-568], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-576], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-584], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-592], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-600], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-608], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-616], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-624], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-632], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-640], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-648], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-656], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-664], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-672], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-680], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-688], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-696], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-704], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-712], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-720], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-728], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-736], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-744], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-752], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-760], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-768], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-776], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-784], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-792], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-800], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-808], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-816], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-824], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-832], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-840], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-848], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-856], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-864], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-872], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-880], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-888], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-896], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-904], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-912], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-920], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-928], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-936], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-944], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-952], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-960], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-968], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-976], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-984], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-992], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1000], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1008], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1016], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1024], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1032], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1040], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1048], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1056], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1064], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1072], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1080], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1088], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1096], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1304], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1312], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1320], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1328], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: ceyyxthupa_53
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: print_4
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 18 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+24] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP+16], [RBP+24], 18, [RBP+24])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-24], RAX ; [RBP-24] holds the variable app_256
  ;; or_lhs {
  mov RAX, [RBP+16]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2243
  ;; or_rhs {
  mov RAX, [RBP+24]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2243
  mov RAX, 0x7fffffffffffffff
or_done_2243:
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_and_or_263
  ;; and_lhs {
  mov RAX, [RBP+16]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2240
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2240
  mov RAX, 0xffffffffffffffff
and_done_2240:
  mov [RBP-40], RAX ; [RBP-40] holds the variable binop_and_or_266
  mov RAX, -18
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 20
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-48], RAX ; [RBP-48] holds the variable binop_269
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+16])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-56], RAX ; [RBP-56] holds the variable app_272
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-32] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-40] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-48] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-56] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-24], [RBP-32], [RBP-40], [RBP-48], [RBP-56])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-64], RAX ; [RBP-64] holds the variable yuojojrjfh_253
  mov RAX, [RBP+24]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-72], RAX ; [RBP-72] holds the variable unary_281
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -8 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, [RBP+16], [RBP+16], -8, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-80], RAX ; [RBP-80] holds the variable app_283
  mov RAX, [RBP-72]
  mov R11, RAX
  mov RAX, [RBP-80]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2215
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2215
_cmp_fail_2215:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2215:
  mov [RBP-88], RAX ; [RBP-88] holds the variable binop_280
  mov RAX, [RBP-88]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2201
  mov RAX, 0
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 6
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-104], RAX ; [RBP-104] holds the variable binop_291
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-104] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-104])
  add RSP, 16 ; Increment RSP after calling the closure
  jmp near done_2201
if_false_2201:
  mov RAX, 12
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-104], RAX ; [RBP-104] holds the variable unary_296
  mov RAX, [RBP-104]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_2201:
  mov [RBP-96], RAX ; [RBP-96] holds the variable nntuapyjok_277
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-96] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-64] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+24], [RBP+24], [RBP+24], [RBP-96], [RBP-64])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-104], RAX ; [RBP-104] holds the variable app_306
  mov RAX, [RBP-104]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_2192
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_2192
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_2192
_is_bool_found_bool_2192:
  mov RAX, 0xffffffffffffffff
_is_bool_done_2192:
  mov [RBP-112], RAX ; [RBP-112] holds the variable cyxyxqxssl_303
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2188
  mov RAX, 10
  jmp near done_2188
if_false_2188:
  mov RAX, [RBP-96]
done_2188:
  mov [RBP-120], RAX ; [RBP-120] holds the variable if_317
  mov RAX, [RBP-120]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-128], RAX ; [RBP-128] holds the variable zaxjotjnnc_314
  mov RAX, [RBP+24]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2182
  mov RAX, [RBP+24]
  jmp near done_2182
if_false_2182:
  mov RAX, [RBP-64]
done_2182:
  mov [RBP-136], RAX ; [RBP-136] holds the variable dqybfvevif_326
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-128] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-128])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-144], RAX ; [RBP-144] holds the variable vsobguyngy_333
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-128] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+24], [RBP+16], [RBP-136], [RBP-128], [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-152], RAX ; [RBP-152] holds the variable mspycoddse_339
  mov RAX, [RBP-96]
  mov R11, RAX
  mov RAX, [RBP-96]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2169
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2169
_cmp_fail_2169:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2169:
  mov [RBP-160], RAX ; [RBP-160] holds the variable ajyadglesn_349
  mov RAX, [RBP-144]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-96]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-168], RAX ; [RBP-168] holds the variable oorkhevjub_322
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-168] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-168])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-176], RAX ; [RBP-176] holds the variable app_361
  mov RAX, [RBP+16]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2159
  mov RAX, 18
  jmp near done_2159
if_false_2159:
  mov RAX, [RBP-96]
done_2159:
  mov [RBP-184], RAX ; [RBP-184] holds the variable if_364
  mov RAX, [RBP-176]
  mov R11, RAX
  mov RAX, [RBP-184]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2156
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2156
_cmp_fail_2156:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2156:
  mov [RBP-192], RAX ; [RBP-192] holds the variable eefsurhsuf_358
  mov RAX, 0
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-168]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-200], RAX ; [RBP-200] holds the variable binop_372
  mov RAX, [RBP+24]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2149
  mov RAX, -8
  jmp near done_2149
if_false_2149:
  mov RAX, [RBP-168]
done_2149:
  mov [RBP-208], RAX ; [RBP-208] holds the variable if_375
  mov RAX, [RBP-200]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-208]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-216], RAX ; [RBP-216] holds the variable bgzirxifyc_369
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-64] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-192] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-128] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-112] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-64], 0x7fffffffffffffff, [RBP-192], [RBP-128], [RBP-112])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-224], RAX ; [RBP-224] holds the variable app_383
  mov RAX, [RBP-224]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-232], RAX ; [RBP-232] holds the variable nbcwmtoswt_380
  mov RAX, 12
  mov [RBP-240], RAX ; [RBP-240] holds the variable tfrbooleht_399
  mov RAX, 0x7fffffffffffffff
  mov [RBP-248], RAX ; [RBP-248] holds the variable qvoaksqqep_403
  mov RAX, 14
  mov [RBP-256], RAX ; [RBP-256] holds the variable mwcefcwnzl_407
  mov RAX, 0x7fffffffffffffff
  mov [RBP-264], RAX ; [RBP-264] holds the variable auzthxklim_411
  mov RAX, [RBP-240]
  mov [RBP-272], RAX ; [RBP-272] holds the variable scvtizmjbi_415
  mov RAX, [RBP-256]
  mov [RBP-280], RAX ; [RBP-280] holds the variable bruavbskbo_395
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2127
  mov RAX, 0xffffffffffffffff
  jmp near done_2127
if_false_2127:
  mov RAX, [RBP-192]
done_2127:
  mov [RBP-288], RAX ; [RBP-288] holds the variable ggmeibxzvl_420
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-232] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-232] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -4 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+24] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP-232], [RBP-232], -4, [RBP+24])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-296], RAX ; [RBP-296] holds the variable pduczttkpg_391
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-64] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-168] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-64], [RBP+16], [RBP+16], [RBP-168], 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-304], RAX ; [RBP-304] holds the variable app_437
  mov RAX, [RBP-192]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-312], RAX ; [RBP-312] holds the variable unary_444
  mov RAX, [RBP-304]
  mov R11, RAX
  mov RAX, [RBP-312]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2108
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2108
_cmp_fail_2108:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2108:
  mov [RBP-320], RAX ; [RBP-320] holds the variable fihxpzyxzd_434
  mov RAX, [RBP-232]
  mov [RBP-328], RAX ; [RBP-328] holds the variable gjitgeckqt_449
  mov RAX, [RBP-328]
  mov [RBP-336], RAX ; [RBP-336] holds the variable miapgofurp_453
  mov RAX, [RBP-128]
  mov [RBP-344], RAX ; [RBP-344] holds the variable mfleqpczin_457
  mov RAX, [RBP-96]
  mov [RBP-352], RAX ; [RBP-352] holds the variable ilhwfknftw_461
  mov RAX, [RBP-168]
  mov [RBP-360], RAX ; [RBP-360] holds the variable rkaqcfstpz_465
  mov RAX, [RBP+24]
  mov [RBP-368], RAX ; [RBP-368] holds the variable irgaepgmmt_469
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-128] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-128])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-376], RAX ; [RBP-376] holds the variable wsafhxenwm_299
  mov RAX, -10
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-384], RAX ; [RBP-384] holds the variable unary_479
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-384] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-384])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-392], RAX ; [RBP-392] holds the variable app_478
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-392] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-392])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-400], RAX ; [RBP-400] holds the variable mawnngpaze_475
  mov RAX, [RBP-376]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -12
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-408], RAX ; [RBP-408] holds the variable binop_488
  mov RAX, [RBP-408]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-416], RAX ; [RBP-416] holds the variable unary_487
  mov RAX, [RBP-96]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-424], RAX ; [RBP-424] holds the variable unary_492
  mov RAX, [RBP-424]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-432], RAX ; [RBP-432] holds the variable unary_491
  mov RAX, [RBP-416]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-432]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-440], RAX ; [RBP-440] holds the variable tybgvkdrux_484
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-440] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-440])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-448], RAX ; [RBP-448] holds the variable app_496
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2072
  mov RAX, 2
  jmp near done_2072
if_false_2072:
  mov RAX, [RBP-376]
done_2072:
  mov [RBP-456], RAX ; [RBP-456] holds the variable if_499
  mov RAX, [RBP-448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-456]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-464], RAX ; [RBP-464] holds the variable binop_495
  mov RAX, 6
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 18
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-472], RAX ; [RBP-472] holds the variable binop_504
  mov RAX, [RBP-472]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-480], RAX ; [RBP-480] holds the variable unary_503
  mov RAX, [RBP-464]
  mov R11, RAX
  mov RAX, [RBP-480]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2061
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2061
_cmp_fail_2061:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2061:
  mov [RBP-488], RAX ; [RBP-488] holds the variable tityzcmmal_249
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-488] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-488] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 4 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-488], [RBP-488], [RBP+24], 4, [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-496], RAX ; [RBP-496] holds the variable app_515
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-488] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -16 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-488], [RBP+16], [RBP+24], -16, [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-504], RAX ; [RBP-504] holds the variable app_522
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -4 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-488] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+24], 0xffffffffffffffff, [RBP+16], -4, [RBP-488])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-512], RAX ; [RBP-512] holds the variable app_529
  mov RAX, -10
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -20
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-520], RAX ; [RBP-520] holds the variable binop_536
  mov RAX, [RBP+16]
  mov R11, RAX
  mov RAX, 12
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2034
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2034
_cmp_fail_2034:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2034:
  mov [RBP-528], RAX ; [RBP-528] holds the variable binop_539
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-496] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-504] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-512] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-520] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-528] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-496], [RBP-504], [RBP-512], [RBP-520], [RBP-528])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-536], RAX ; [RBP-536] holds the variable anlokmoabl_512
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -14 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP+16], [RBP+24], -14, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-544], RAX ; [RBP-544] holds the variable app_547
  mov RAX, [RBP-544]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1996
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-488] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -8 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP-488], [RBP+24], -8, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-560], RAX ; [RBP-560] holds the variable app_555
  mov RAX, [RBP-560]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_2010
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_2010
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_2010
_is_bool_found_bool_2010:
  mov RAX, 0xffffffffffffffff
_is_bool_done_2010:
  jmp near done_1996
if_false_1996:
  mov RAX, 18
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 12
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-560], RAX ; [RBP-560] holds the variable binop_563
  mov RAX, [RBP+16]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2002
  mov RAX, 4
  jmp near done_2002
if_false_2002:
  mov RAX, 14
done_2002:
  mov [RBP-568], RAX ; [RBP-568] holds the variable if_566
  mov RAX, [RBP-560]
  mov R11, RAX
  mov RAX, [RBP-568]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1999
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1999
_cmp_fail_1999:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1999:
done_1996:
  mov [RBP-552], RAX ; [RBP-552] holds the variable thsckdegpt_544
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 8 ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(8)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-560], RAX ; [RBP-560] holds the variable app_575
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1989
  mov RAX, 6
  jmp near done_1989
if_false_1989:
  mov RAX, 18
done_1989:
  mov [RBP-568], RAX ; [RBP-568] holds the variable if_578
  mov RAX, [RBP-560]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-568]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-576], RAX ; [RBP-576] holds the variable binop_574
  mov RAX, 18
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-584], RAX ; [RBP-584] holds the variable unary_583
  mov RAX, 16
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 14
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-592], RAX ; [RBP-592] holds the variable binop_585
  mov RAX, [RBP-584]
  mov R11, RAX
  mov RAX, [RBP-592]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1978
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1978
_cmp_fail_1978:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1978:
  mov [RBP-600], RAX ; [RBP-600] holds the variable binop_582
  mov RAX, [RBP-576]
  mov R11, RAX
  mov RAX, [RBP-600]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_1975
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1975
_cmp_fail_1975:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1975:
  mov [RBP-608], RAX ; [RBP-608] holds the variable iwbobfmjqo_571
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(0x7fffffffffffffff)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-616], RAX ; [RBP-616] holds the variable app_592
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-536] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-536] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-536], [RBP-536], 0xffffffffffffffff, 0, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-624], RAX ; [RBP-624] holds the variable app_595
  mov RAX, [RBP-488]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1963
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1963
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1963
_is_bool_found_bool_1963:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1963:
  mov [RBP-632], RAX ; [RBP-632] holds the variable unary_602
  mov RAX, -12
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-640], RAX ; [RBP-640] holds the variable unary_604
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-536] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-552] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-608] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 18 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-608] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-536], [RBP-552], [RBP-608], 18, [RBP-608])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-648], RAX ; [RBP-648] holds the variable app_606
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-616] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-624] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-632] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-640] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-648] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-616], [RBP-624], [RBP-632], [RBP-640], [RBP-648])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-656], RAX ; [RBP-656] holds the variable qvpqeycefk_589
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-552] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-608] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 18 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-608] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-552], [RBP-608], [RBP+24], 18, [RBP-608])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-664], RAX ; [RBP-664] holds the variable app_618
  mov RAX, [RBP-664]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-672], RAX ; [RBP-672] holds the variable iatccwdfrl_615
  mov RAX, 12
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 8
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-680], RAX ; [RBP-680] holds the variable binop_633
  mov RAX, [RBP-672]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1931
  mov RAX, -8
  jmp near done_1931
if_false_1931:
  mov RAX, 8
done_1931:
  mov [RBP-688], RAX ; [RBP-688] holds the variable if_636
  mov RAX, [RBP-680]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-688]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-696], RAX ; [RBP-696] holds the variable mrrzswasjb_630
  mov RAX, [RBP-696]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -2
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-704], RAX ; [RBP-704] holds the variable binop_644
  mov RAX, [RBP-696]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-712], RAX ; [RBP-712] holds the variable unary_647
  mov RAX, [RBP-704]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-712]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-720], RAX ; [RBP-720] holds the variable akfklfeqcb_641
  mov RAX, [RBP-552]
  mov [RBP-728], RAX ; [RBP-728] holds the variable yshefrybcp_655
  mov RAX, -18
  mov [RBP-736], RAX ; [RBP-736] holds the variable ixwlmmpewu_659
  mov RAX, [RBP-552]
  mov [RBP-744], RAX ; [RBP-744] holds the variable qbjerdubkf_663
  mov RAX, [RBP-720]
  mov [RBP-752], RAX ; [RBP-752] holds the variable dyyfoipovs_667
  mov RAX, [RBP-736]
  mov [RBP-760], RAX ; [RBP-760] holds the variable yhlsmwznvc_671
  mov RAX, 20
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-768], RAX ; [RBP-768] holds the variable aikjiuhvpj_650
  mov RAX, [RBP-608]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1911
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1911
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1911
_is_bool_found_bool_1911:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1911:
  mov [RBP-776], RAX ; [RBP-776] holds the variable unary_679
  mov RAX, [RBP-776]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1902
  mov RAX, [RBP-720]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 12
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_1902
if_false_1902:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1903
  mov RAX, [RBP-696]
  jmp near done_1903
if_false_1903:
  mov RAX, -16
done_1903:
done_1902:
  mov [RBP-784], RAX ; [RBP-784] holds the variable rbheuyskpy_676
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-552] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-536] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -18 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-536] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0x7fffffffffffffff, [RBP-552], [RBP-536], -18, [RBP-536])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-792], RAX ; [RBP-792] holds the variable batwskoaqb_693
  mov RAX, [RBP-720]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 12
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-800], RAX ; [RBP-800] holds the variable hchlrinfmt_703
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-552] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-656] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-608] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-784] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-552], [RBP-656], [RBP-608], [RBP-784], 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-808], RAX ; [RBP-808] holds the variable dwyqqyqnms_709
  mov RAX, 16
  mov R11, RAX
  mov RAX, [RBP-720]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_1882
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1882
_cmp_fail_1882:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1882:
  mov [RBP-816], RAX ; [RBP-816] holds the variable awhtlggodk_689
  mov RAX, 4
  mov [RBP-824], RAX ; [RBP-824] holds the variable jcktbinpmm_724
  mov RAX, [RBP-824]
  mov [RBP-832], RAX ; [RBP-832] holds the variable bqojovhhgz_728
  mov RAX, -8
  mov [RBP-840], RAX ; [RBP-840] holds the variable dopzpvymfs_732
  mov RAX, [RBP+24]
  mov [RBP-848], RAX ; [RBP-848] holds the variable qbismrpcyf_736
  mov RAX, [RBP-672]
  mov [RBP-856], RAX ; [RBP-856] holds the variable pugxlluoab_740
  mov RAX, -6
  mov [RBP-864], RAX ; [RBP-864] holds the variable smkhxihiau_744
  mov RAX, [RBP-720]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-872], RAX ; [RBP-872] holds the variable exdeeztpox_626
  mov RAX, [RBP-656]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-880], RAX ; [RBP-880] holds the variable unary_752
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 12 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-608] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP+16], [RBP+16], 12, [RBP-608])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-888], RAX ; [RBP-888] holds the variable app_754
  mov RAX, [RBP+24]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1863
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1863
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1863
_is_bool_found_bool_1863:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1863:
  mov [RBP-896], RAX ; [RBP-896] holds the variable unary_761
  mov RAX, [RBP-872]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-872]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-904], RAX ; [RBP-904] holds the variable binop_763
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+24])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-912], RAX ; [RBP-912] holds the variable app_766
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-880] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-888] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-896] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-904] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-912] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-880], [RBP-888], [RBP-896], [RBP-904], [RBP-912])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-920], RAX ; [RBP-920] holds the variable gcixysvzpc_749
  ;; and_lhs {
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-552] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-920] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-872] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-552] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-552], [RBP+16], [RBP-920], [RBP-872], [RBP-552])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-936], RAX ; [RBP-936] holds the variable app_775
  mov RAX, [RBP-936]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1827
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-656] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-672] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-872] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-656], [RBP-672], 0xffffffffffffffff, [RBP-872], 0x7fffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_1827
if_false_1827:
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-656] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-608] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-552] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-872] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+24] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-656], [RBP-608], [RBP-552], [RBP-872], [RBP+24])
  add RSP, 48 ; Increment RSP after calling the closure
done_1827:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1818
  ;; and_rhs {
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-920] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-920] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-672] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-872] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-920], [RBP-920], [RBP-672], [RBP-872], 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1818
  mov RAX, 0xffffffffffffffff
and_done_1818:
  mov [RBP-928], RAX ; [RBP-928] holds the variable nvtedurbdu_771
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-656] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-656] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-872] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-920] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-656], [RBP+16], [RBP-656], [RBP-872], [RBP-920])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-936], RAX ; [RBP-936] holds the variable app_807
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(0xffffffffffffffff)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-944], RAX ; [RBP-944] holds the variable app_814
  mov RAX, [RBP-872]
  mov R11, RAX
  mov RAX, [RBP-872]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_1805
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1805
_cmp_fail_1805:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1805:
  mov [RBP-952], RAX ; [RBP-952] holds the variable binop_817
  mov RAX, -14
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-872]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-960], RAX ; [RBP-960] holds the variable binop_820
  mov RAX, [RBP-672]
  mov [RBP-968], RAX ; [RBP-968] holds the variable ncwyiapvdr_825
  mov RAX, [RBP-872]
  mov [RBP-976], RAX ; [RBP-976] holds the variable lawwwbhdcu_829
  mov RAX, [RBP-920]
  mov [RBP-984], RAX ; [RBP-984] holds the variable kpjthcyjta_833
  mov RAX, [RBP-872]
  mov [RBP-992], RAX ; [RBP-992] holds the variable ldfwzipqus_837
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable uuzwxluola_841
  mov RAX, [RBP-992]
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable hovenacrkh_845
  mov RAX, -2
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable mwywrymlhk_849
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-936] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-944] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-952] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-960] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-936], [RBP-944], [RBP-952], [RBP-960], 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable xkmqqhtefs_804
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-928] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-608] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-872] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-928], 0xffffffffffffffff, [RBP-608], [RBP-872], 0x7fffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable app_856
  mov RAX, [RBP-1032]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable unary_855
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-536] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-608] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 20 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-488] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-536], [RBP-608], [RBP+24], 20, [RBP-488])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable app_864
  mov RAX, [RBP-1048]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1761
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-872] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, [RBP+16], [RBP+16], [RBP-872], [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_1761
if_false_1761:
  mov RAX, [RBP+24]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
done_1761:
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable if_863
  mov RAX, [RBP-1040]
  mov R11, RAX
  mov RAX, [RBP-1056]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_1758
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1758
_cmp_fail_1758:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1758:
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable bjmfujxeov_508
  ;; or_lhs {
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 6 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], 0x7fffffffffffffff, 0xffffffffffffffff, 6, [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1729
  ;; or_rhs {
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-488] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -10 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+24] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP+16], [RBP-488], -10, [RBP+24])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable app_893
  mov RAX, [RBP-1080]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1731
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-488] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1064] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-1064] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 14 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-488], [RBP-1064], [RBP-1064], 14, [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_1731
if_false_1731:
  mov RAX, [RBP+16]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1732
  mov RAX, [RBP-1064]
  jmp near done_1732
if_false_1732:
  mov RAX, [RBP-1064]
done_1732:
done_1731:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1729
  mov RAX, 0x7fffffffffffffff
or_done_1729:
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable binop_and_or_884
  mov RAX, [RBP-1072]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1727
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1727
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1727
_is_bool_found_bool_1727:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1727:
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable fsrcsndomv_881
  ;; and_lhs {
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1080] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1064] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-1080] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-1080], [RBP-1064], [RBP+16], 0, [RBP-1080])
  add RSP, 48 ; Increment RSP after calling the closure
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1716
  ;; and_rhs {
  ;; and_lhs {
  mov RAX, [RBP-1064]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1717
  ;; and_rhs {
  mov RAX, [RBP+24]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1717
  mov RAX, 0xffffffffffffffff
and_done_1717:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1716
  mov RAX, 0xffffffffffffffff
and_done_1716:
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable binop_and_or_915
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-488] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0x7fffffffffffffff, [RBP-488], [RBP+24], 0, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable app_926
  ;; or_lhs {
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1080] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-488] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 20 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+24] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0x7fffffffffffffff, [RBP-1080], [RBP-488], 20, [RBP+24])
  add RSP, 48 ; Increment RSP after calling the closure
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1694
  ;; or_rhs {
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1064] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1080] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -8 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-1064], [RBP-1080], [RBP+24], -8, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1694
  mov RAX, 0x7fffffffffffffff
or_done_1694:
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable binop_and_or_933
  mov RAX, -20
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable unary_949
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable gbetufdfko_953
  mov RAX, 12
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable bcanuganxl_957
  mov RAX, [RBP-1128]
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable jyffwwxppl_961
  mov RAX, [RBP-1136]
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable sgwfsmhsta_965
  mov RAX, [RBP-1136]
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable csnyytvkrv_969
  mov RAX, [RBP-1064]
  mov [RBP-1160], RAX ; [RBP-1160] holds the variable qwbmemwvxo_973
  mov RAX, [RBP-1120]
  mov [RBP-1168], RAX ; [RBP-1168] holds the variable hvwgialtzx_977
  mov RAX, [RBP-1136]
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable frmhmqbnwj_981
  mov RAX, [RBP-1160]
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable odbjswtzrz_985
  mov RAX, [RBP-1112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1152]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable binop_948
  mov RAX, [RBP+24]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable unary_990
  mov RAX, [RBP-1200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1665
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-1064] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 12 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+24], [RBP+24], [RBP-1064], 12, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_1665
if_false_1665:
  mov RAX, [RBP-1080]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1666
  mov RAX, 0x7fffffffffffffff
  jmp near done_1666
if_false_1666:
  mov RAX, [RBP-488]
done_1666:
done_1665:
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable if_989
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1088] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1096] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-1104] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-1192] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-1208] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-1088], [RBP-1096], [RBP-1104], [RBP-1192], [RBP-1208])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable rhnfxaywqk_912
  mov RAX, [RBP+24]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1654
  mov RAX, 6
  jmp near done_1654
if_false_1654:
  mov RAX, 16
done_1654:
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable if_1010
  mov RAX, [RBP-1224]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable unary_1009
  mov RAX, 10
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 16
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable binop_1015
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1240] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1240])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable app_1014
  mov RAX, [RBP-1232]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1248]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable binop_1008
  mov RAX, [RBP-1256]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable bfmllrcdre_1005
  mov RAX, [RBP-1264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable unary_1025
  mov RAX, [RBP-1264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable unary_1027
  mov RAX, [RBP-1272]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1280]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable binop_1024
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1288] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1288])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable app_1023
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1296] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1296])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1304], RAX ; [RBP-1304] holds the variable rkmxqlyyzl_1020
  mov RAX, [RBP-1264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1312], RAX ; [RBP-1312] holds the variable unary_1034
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1312] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1312])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1320], RAX ; [RBP-1320] holds the variable app_1033
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1320] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1320])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1328], RAX ; [RBP-1328] holds the variable app_1032
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1328] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1328])
  add RSP, 16 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-1452
lambda_end_1452:
  ;; Check if we have space on the heap to store our function of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_1452
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_1452:
  ;; Store lambda-1452 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_1452 ; Store the function pointer
  mov QWORD [R15+16], 4 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-48] ; Store ceyyxthupa_53
  mov QWORD [R15+24], R11
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+32], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 48 ; Bump the heap register
  ;; } store lambda-1452
  mov [RBP-56], RAX ; Store letrec-ed function vhvhsgetnk_244
  ;; Define lambda-1245 {
  jmp near lambda_end_1245
lambda_1245:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 480
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 480, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-304], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-312], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-320], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-328], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-336], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-344], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-352], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-360], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-368], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-376], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-384], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-392], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-400], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-408], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-416], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-424], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-432], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-440], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-448], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-456], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-464], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-472], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-480], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+48] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: vhvhsgetnk_244
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: print_4
  mov R11, [RAX+40]
  mov [RBP-24], R11 ; Holds the closed over variable: ceyyxthupa_53
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, 4
  mov [RBP-32], RAX ; [RBP-32] holds the variable nogjsrntdg_1053
  mov RAX, [RBP+24]
  mov [RBP-40], RAX ; [RBP-40] holds the variable shguefqoay_1057
  mov RAX, 0xffffffffffffffff
  mov [RBP-48], RAX ; [RBP-48] holds the variable vmzjncggqv_1061
  mov RAX, [RBP+16]
  mov [RBP-56], RAX ; [RBP-56] holds the variable ivkdjqifte_1065
  mov RAX, [RBP-32]
  mov [RBP-64], RAX ; [RBP-64] holds the variable qcyoxpgbhp_1069
  mov RAX, 0
  mov [RBP-72], RAX ; [RBP-72] holds the variable yxnmwrsjqv_1073
  mov RAX, 0x7fffffffffffffff
  mov [RBP-80], RAX ; [RBP-80] holds the variable xawglwxobq_1077
  mov RAX, [RBP+40]
  mov [RBP-88], RAX ; [RBP-88] holds the variable ivndqmvswd_1081
  mov RAX, [RBP+40]
  mov [RBP-96], RAX ; [RBP-96] holds the variable gwnjryuxhl_1085
  mov RAX, 16
  mov [RBP-104], RAX ; [RBP-104] holds the variable jzpwhfthsp_1089
  mov RAX, [RBP+40]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 8
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-112], RAX ; [RBP-112] holds the variable binop_1093
  mov RAX, [RBP-96]
  mov R11, RAX
  mov RAX, [RBP-112]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_1436
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1436
_cmp_fail_1436:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1436:
  mov [RBP-120], RAX ; [RBP-120] holds the variable binop_1050
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+32] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+32], [RBP+24])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-128], RAX ; [RBP-128] holds the variable zzxedansmz_1098
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+16], [RBP+16])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-136], RAX ; [RBP-136] holds the variable mugnkprsro_1105
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+32] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+24], 0xffffffffffffffff, [RBP+32], [RBP-136], [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-144], RAX ; [RBP-144] holds the variable fkzuooypcz_1112
  mov RAX, -8
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-152], RAX ; [RBP-152] holds the variable nhaqtsmfjs_1122
  mov RAX, [RBP-128]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-128]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-160], RAX ; [RBP-160] holds the variable binop_1126
  mov RAX, [RBP-120]
  mov R11, RAX
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_1413
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1413
_cmp_fail_1413:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1413:
  mov [RBP-168], RAX ; [RBP-168] holds the variable binop_1049
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD -18 ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(-18)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-176], RAX ; [RBP-176] holds the variable rkvotwzeti_1132
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+16], [RBP+24])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-184], RAX ; [RBP-184] holds the variable wixaeykgfv_1138
  mov RAX, [RBP+16]
  mov [RBP-192], RAX ; [RBP-192] holds the variable laajzqlcar_1149
  mov RAX, [RBP+32]
  mov [RBP-200], RAX ; [RBP-200] holds the variable bnjuuzbeqf_1153
  mov RAX, [RBP+24]
  mov [RBP-208], RAX ; [RBP-208] holds the variable bvivbunjcb_1157
  mov RAX, -6
  mov [RBP-216], RAX ; [RBP-216] holds the variable ssixqlcbih_1161
  mov RAX, [RBP+24]
  mov [RBP-224], RAX ; [RBP-224] holds the variable uaimujexuj_1165
  mov RAX, [RBP-176]
  mov [RBP-232], RAX ; [RBP-232] holds the variable dmijrieymi_1169
  mov RAX, [RBP+40]
  mov [RBP-240], RAX ; [RBP-240] holds the variable mduynvjkwz_1173
  mov RAX, [RBP-176]
  mov [RBP-248], RAX ; [RBP-248] holds the variable emguvzsbcp_1177
  mov RAX, [RBP+16]
  mov [RBP-256], RAX ; [RBP-256] holds the variable jgjgdsccom_1145
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-256] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-256])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-264], RAX ; [RBP-264] holds the variable dtoqgcuhnt_1182
  mov RAX, -4
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-176]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-272], RAX ; [RBP-272] holds the variable ioeeinveir_1188
  mov RAX, [RBP-176]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-280], RAX ; [RBP-280] holds the variable klfvwfxovg_1194
  mov RAX, [RBP+24]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1385
  mov RAX, [RBP-272]
  jmp near done_1385
if_false_1385:
  mov RAX, 10
done_1385:
  mov [RBP-288], RAX ; [RBP-288] holds the variable adpsiwkhpo_1199
  mov RAX, [RBP-176]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-296], RAX ; [RBP-296] holds the variable ixepgkhduq_1206
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-264] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-176] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+32] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-264], 0xffffffffffffffff, [RBP+24], [RBP-176], [RBP+32])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-304], RAX ; [RBP-304] holds the variable rdsplpjfcw_1211
  mov RAX, 0
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-312], RAX ; [RBP-312] holds the variable unary_1220
  mov RAX, [RBP-312]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-320], RAX ; [RBP-320] holds the variable unary_1129
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+32] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP+24], [RBP+16], [RBP+40], [RBP+32])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-328], RAX ; [RBP-328] holds the variable app_1224
  mov RAX, [RBP-328]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1356
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+40])
  add RSP, 16 ; Increment RSP after calling the closure
  jmp near done_1356
if_false_1356:
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+32] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0xffffffffffffffff, [RBP+32])
  add RSP, 32 ; Increment RSP after calling the closure
done_1356:
  mov [RBP-336], RAX ; [RBP-336] holds the variable if_1223
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+32] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+32] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+32], [RBP+32])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-344], RAX ; [RBP-344] holds the variable app_1238
  mov RAX, [RBP-336]
  mov R11, RAX
  mov RAX, [RBP-344]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_1349
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1349
_cmp_fail_1349:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1349:
  mov [RBP-352], RAX ; [RBP-352] holds the variable binop_1222
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0x7fffffffffffffff, [RBP+24], 0x7fffffffffffffff, [RBP+40], [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-360], RAX ; [RBP-360] holds the variable fngoihuvue_1244
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1338
  mov RAX, [RBP+40]
  jmp near done_1338
if_false_1338:
  mov RAX, [RBP+40]
done_1338:
  mov [RBP-368], RAX ; [RBP-368] holds the variable if_1254
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-368] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-368])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-376], RAX ; [RBP-376] holds the variable app_1253
  mov RAX, [RBP+16]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1333
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1333
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1333
_is_bool_found_bool_1333:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1333:
  mov [RBP-384], RAX ; [RBP-384] holds the variable unary_1260
  mov RAX, [RBP+32]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1329
  mov RAX, [RBP+32]
  jmp near done_1329
if_false_1329:
  mov RAX, [RBP+16]
done_1329:
  mov [RBP-392], RAX ; [RBP-392] holds the variable if_1262
  ;; or_lhs {
  mov RAX, [RBP+24]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1326
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1326
  mov RAX, 0x7fffffffffffffff
or_done_1326:
  mov [RBP-400], RAX ; [RBP-400] holds the variable binop_and_or_1266
  mov RAX, [RBP+32]
  mov [RBP-408], RAX ; [RBP-408] holds the variable cdiumuyvvg_1271
  mov RAX, [RBP+16]
  mov [RBP-416], RAX ; [RBP-416] holds the variable gdkkfyvqjg_1275
  mov RAX, 0x7fffffffffffffff
  mov [RBP-424], RAX ; [RBP-424] holds the variable cgmubljbim_1279
  mov RAX, [RBP+40]
  mov [RBP-432], RAX ; [RBP-432] holds the variable kbybojquou_1283
  mov RAX, [RBP+40]
  mov [RBP-440], RAX ; [RBP-440] holds the variable xxdqyoyvvv_1287
  mov RAX, [RBP-416]
  mov [RBP-448], RAX ; [RBP-448] holds the variable ehvfibauov_1291
  mov RAX, [RBP-432]
  mov [RBP-456], RAX ; [RBP-456] holds the variable uhchpzsfko_1295
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(0x7fffffffffffffff)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-464], RAX ; [RBP-464] holds the variable app_1299
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-384] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-392] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-400] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-432] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-464] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-384], [RBP-392], [RBP-400], [RBP-432], [RBP-464])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-472], RAX ; [RBP-472] holds the variable app_1259
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-168] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-320] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-352] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-376] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-472] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-168], [RBP-320], [RBP-352], [RBP-376], [RBP-472])
  add RSP, 48 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-1245
lambda_end_1245:
  ;; Check if we have space on the heap to store our function of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_1245
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_1245:
  ;; Store lambda-1245 on the heap {
  mov QWORD [R15+0], 8 ; Store the arity
  mov QWORD [R15+8], lambda_1245 ; Store the function pointer
  mov QWORD [R15+16], 6 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-56] ; Store vhvhsgetnk_244
  mov QWORD [R15+24], R11
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+32], R11
  mov R11, [RBP-48] ; Store ceyyxthupa_53
  mov QWORD [R15+40], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 48 ; Bump the heap register
  ;; } store lambda-1245
  mov [RBP-64], RAX ; Store letrec-ed function nptaxmgpxg_1045
  ;; Define lambda-1203 {
  jmp near lambda_end_1203
lambda_1203:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 96
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 96, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+48] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: vhvhsgetnk_244
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+40]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1241
  mov RAX, -10
  jmp near done_1241
if_false_1241:
  mov RAX, [RBP+24]
done_1241:
  mov [RBP-16], RAX ; [RBP-16] holds the variable if_1320
  mov RAX, [RBP+32]
  mov [RBP-24], RAX ; [RBP-24] holds the variable snzpfessuy_1326
  mov RAX, [RBP+40]
  mov [RBP-32], RAX ; [RBP-32] holds the variable szpbfjpeuh_1330
  mov RAX, [RBP+16]
  mov [RBP-40], RAX ; [RBP-40] holds the variable gbdmtxriit_1334
  mov RAX, [RBP+24]
  mov [RBP-48], RAX ; [RBP-48] holds the variable fbrgjlhkcw_1338
  mov RAX, [RBP-16]
  mov R11, RAX
  mov RAX, [RBP-48]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1234
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1234
_cmp_fail_1234:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1234:
  mov [RBP-56], RAX ; [RBP-56] holds the variable binop_1319
  mov RAX, [RBP-56]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1232
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1232
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1232
_is_bool_found_bool_1232:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1232:
  mov [RBP-64], RAX ; [RBP-64] holds the variable unary_1318
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+40], 0x7fffffffffffffff)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-72], RAX ; [RBP-72] holds the variable app_1344
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+40], [RBP+16])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-80], RAX ; [RBP-80] holds the variable app_1348
  mov RAX, [RBP-72]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-80]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-88], RAX ; [RBP-88] holds the variable binop_1343
  mov RAX, [RBP-88]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-96], RAX ; [RBP-96] holds the variable unary_1342
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-64] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-96] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-64], [RBP-96])
  add RSP, 32 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-1203
lambda_end_1203:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_1203
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_1203:
  ;; Store lambda-1203 on the heap {
  mov QWORD [R15+0], 8 ; Store the arity
  mov QWORD [R15+8], lambda_1203 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-56] ; Store vhvhsgetnk_244
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-1203
  mov [RBP-72], RAX ; Store letrec-ed function rezkachxsj_1314
  ;; Define lambda-947 {
  jmp near lambda_end_947
lambda_947:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 304
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 304, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-304], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+56] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: vhvhsgetnk_244
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: ceyyxthupa_53
  mov R11, [RAX+40]
  mov [RBP-24], R11 ; Holds the closed over variable: nptaxmgpxg_1045
  mov R11, [RAX+48]
  mov [RBP-32], R11 ; Holds the closed over variable: rezkachxsj_1314
  mov R11, [RAX+56]
  mov [RBP-40], R11 ; Holds the closed over variable: print_4
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+40]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1199
  mov RAX, [RBP+32]
  jmp near done_1199
if_false_1199:
  mov RAX, [RBP+32]
done_1199:
  mov [RBP-48], RAX ; [RBP-48] holds the variable qrjyqiqyso_1370
  mov RAX, [RBP+48]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-56], RAX ; [RBP-56] holds the variable jlwypkpurd_1377
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1193
  mov RAX, -8
  jmp near done_1193
if_false_1193:
  mov RAX, [RBP+16]
done_1193:
  mov [RBP-64], RAX ; [RBP-64] holds the variable ggxepngxug_1382
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-56] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0x7fffffffffffffff, [RBP-56])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-72], RAX ; [RBP-72] holds the variable jobyykqdwo_1389
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-56] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+48] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-56], [RBP+48])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-80], RAX ; [RBP-80] holds the variable beoyhnbqio_1396
  mov RAX, [RBP-72]
  mov [RBP-88], RAX ; [RBP-88] holds the variable lilkwretxb_1407
  mov RAX, [RBP+48]
  mov [RBP-96], RAX ; [RBP-96] holds the variable pkbmcctmld_1411
  mov RAX, 0xffffffffffffffff
  mov [RBP-104], RAX ; [RBP-104] holds the variable vdnbxwdkqk_1415
  mov RAX, [RBP+24]
  mov [RBP-112], RAX ; [RBP-112] holds the variable rojyyjziwz_1419
  mov RAX, [RBP+48]
  mov [RBP-120], RAX ; [RBP-120] holds the variable gdsatpifgl_1423
  mov RAX, 0x7fffffffffffffff
  mov [RBP-128], RAX ; [RBP-128] holds the variable riuhlmslvs_1427
  mov RAX, [RBP-80]
  mov [RBP-136], RAX ; [RBP-136] holds the variable cycqeciqmh_1403
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-64] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-56] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+40], [RBP-64], [RBP-56], 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-144], RAX ; [RBP-144] holds the variable cdlknqfgkk_1432
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+48] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-80] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+48] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+48], 0x7fffffffffffffff, [RBP+48], [RBP-80], [RBP+48])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-152], RAX ; [RBP-152] holds the variable app_1440
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+40] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+32] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+40], [RBP+40], 0x7fffffffffffffff, [RBP+32])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-160], RAX ; [RBP-160] holds the variable app_1447
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+48] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+40] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+16] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+48] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+48], [RBP+48], [RBP+40], [RBP+16], [RBP+48])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-168], RAX ; [RBP-168] holds the variable app_1453
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+32] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+48] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+48] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+48], [RBP+32], [RBP+48], [RBP+48])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-176], RAX ; [RBP-176] holds the variable app_1460
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+48] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+48] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 4 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, [RBP+48], [RBP+48], 4, 0x7fffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-184], RAX ; [RBP-184] holds the variable app_1466
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-152] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-160] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-168] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-176] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-184] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-152], [RBP-160], [RBP-168], [RBP-176], [RBP-184])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-192], RAX ; [RBP-192] holds the variable app_1367
  mov RAX, [RBP-192]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_967
  mov RAX, [RBP+16]
  mov R11, RAX
  mov RAX, [RBP+24]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1128
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1128
_cmp_fail_1128:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1128:
  mov [RBP-200], RAX ; [RBP-200] holds the variable binop_1477
  mov RAX, [RBP-200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1120
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, [RBP+32]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_1124
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1124
_cmp_fail_1124:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1124:
  jmp near done_1120
if_false_1120:
  ;; and_lhs {
  mov RAX, [RBP+40]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1121
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1121
  mov RAX, 0xffffffffffffffff
and_done_1121:
done_1120:
  mov [RBP-208], RAX ; [RBP-208] holds the variable if_1476
  mov RAX, [RBP-208]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1104
  mov RAX, [RBP+48]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1115
  mov RAX, [RBP+48]
  jmp near done_1115
if_false_1115:
  mov RAX, -4
done_1115:
  mov [RBP-224], RAX ; [RBP-224] holds the variable if_1487
  mov RAX, [RBP-224]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1113
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1113
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1113
_is_bool_found_bool_1113:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1113:
  jmp near done_1104
if_false_1104:
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+48])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-224], RAX ; [RBP-224] holds the variable app_1492
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-224] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-224])
  add RSP, 16 ; Increment RSP after calling the closure
done_1104:
  mov [RBP-216], RAX ; [RBP-216] holds the variable if_1475
  mov RAX, [RBP-216]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1054
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+48] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+40] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+16] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+40], [RBP+48], [RBP+40], [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-224], RAX ; [RBP-224] holds the variable app_1497
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD -2 ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+48] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+48], -2, [RBP+48], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-232], RAX ; [RBP-232] holds the variable app_1503
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+40] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+48] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -16 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, [RBP+40], [RBP+48], -16, 0x7fffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-240], RAX ; [RBP-240] holds the variable app_1509
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1081
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1081
  mov RAX, 0xffffffffffffffff
and_done_1081:
  mov [RBP-248], RAX ; [RBP-248] holds the variable binop_and_or_1516
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-224] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-232] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-240] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-248] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-224], [RBP-232], [RBP-240], [RBP-248])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_1054
if_false_1054:
  mov RAX, [RBP+32]
  mov R11, RAX
  mov RAX, 18
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_1068
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1068
_cmp_fail_1068:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1068:
  mov [RBP-224], RAX ; [RBP-224] holds the variable binop_1521
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+48] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+48] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+24] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+48] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+40], [RBP+48], [RBP+48], [RBP+24], [RBP+48])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-232], RAX ; [RBP-232] holds the variable app_1524
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-224] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-232] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-224], [RBP-232])
  add RSP, 32 ; Increment RSP after calling the closure
done_1054:
  jmp near done_967
if_false_967:
  mov RAX, 8
  mov [RBP-200], RAX ; [RBP-200] holds the variable wchosuomja_1537
  mov RAX, [RBP+48]
  mov [RBP-208], RAX ; [RBP-208] holds the variable wbkjcishgf_1541
  mov RAX, [RBP+40]
  mov [RBP-216], RAX ; [RBP-216] holds the variable rokipusexn_1545
  mov RAX, [RBP-200]
  mov [RBP-224], RAX ; [RBP-224] holds the variable vjqlxpobru_1549
  mov RAX, [RBP-208]
  mov [RBP-232], RAX ; [RBP-232] holds the variable bspzsvuzre_1553
  mov RAX, [RBP+48]
  mov [RBP-240], RAX ; [RBP-240] holds the variable wsgsfzzorv_1557
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD -20 ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(-20)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-248], RAX ; [RBP-248] holds the variable app_1561
  mov RAX, [RBP+32]
  mov R11, RAX
  mov RAX, [RBP-248]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1039
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1039
_cmp_fail_1039:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1039:
  mov [RBP-256], RAX ; [RBP-256] holds the variable binop_1534
  mov RAX, [RBP-256]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1023
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+40] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+40] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+32] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+40] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, [RBP+40], [RBP+40], [RBP+32], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_1023
if_false_1023:
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -4 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+40] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+48], 0xffffffffffffffff, 0x7fffffffffffffff, -4, [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
done_1023:
  mov [RBP-264], RAX ; [RBP-264] holds the variable if_1533
  mov RAX, [RBP-264]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_977
  mov RAX, [RBP+40]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_1020
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_1020
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_1020
_is_bool_found_bool_1020:
  mov RAX, 0xffffffffffffffff
_is_bool_done_1020:
  mov [RBP-272], RAX ; [RBP-272] holds the variable unary_1579
  mov RAX, [RBP+48]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1016
  mov RAX, [RBP+16]
  jmp near done_1016
if_false_1016:
  mov RAX, [RBP+24]
done_1016:
  mov [RBP-280], RAX ; [RBP-280] holds the variable if_1581
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+40] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+48] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+16] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+48] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+48], [RBP+40], [RBP+48], [RBP+16], [RBP+48])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-288], RAX ; [RBP-288] holds the variable app_1585
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+40] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+40] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -20 ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0xffffffffffffffff, [RBP+40], [RBP+40], -20)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-296], RAX ; [RBP-296] holds the variable app_1592
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-272] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-280] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-288] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-296] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-272], [RBP-280], [RBP-288], [RBP-296])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_977
if_false_977:
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+32] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+32])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-272], RAX ; [RBP-272] holds the variable app_1601
  mov RAX, [RBP+48]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_986
  mov RAX, [RBP+32]
  jmp near done_986
if_false_986:
  mov RAX, -8
done_986:
  mov [RBP-280], RAX ; [RBP-280] holds the variable if_1604
  mov RAX, [RBP-272]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-288], RAX ; [RBP-288] holds the variable binop_1600
  mov RAX, [RBP-288]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_977:
done_967:
  leave
  ret
  ;; } define lambda-947
lambda_end_947:
  ;; Check if we have space on the heap to store our function of size 64: 
  mov RAX, [HEAP_END] ; Reserving 8 words
  sub RAX, 64
  cmp RAX, R15
  jge near memcheck_ok_947
  mov RDI, QWORD R15
  mov RSI, QWORD 64
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_947:
  ;; Store lambda-947 on the heap {
  mov QWORD [R15+0], 10 ; Store the arity
  mov QWORD [R15+8], lambda_947 ; Store the function pointer
  mov QWORD [R15+16], 10 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-56] ; Store vhvhsgetnk_244
  mov QWORD [R15+24], R11
  mov R11, [RBP-48] ; Store ceyyxthupa_53
  mov QWORD [R15+32], R11
  mov R11, [RBP-64] ; Store nptaxmgpxg_1045
  mov QWORD [R15+40], R11
  mov R11, [RBP-72] ; Store rezkachxsj_1314
  mov QWORD [R15+48], R11
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+56], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 64 ; Bump the heap register
  ;; } store lambda-947
  mov [RBP-80], RAX ; Store letrec-ed function fzvrvmjjaf_1363
  ;; Define lambda-818 {
  jmp near lambda_end_818
lambda_818:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 288
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 288, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-288], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: fzvrvmjjaf_1363
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: rezkachxsj_1314
  mov R11, [RAX+40]
  mov [RBP-24], R11 ; Holds the closed over variable: ceyyxthupa_53
  mov R11, [RAX+48]
  mov [RBP-32], R11 ; Holds the closed over variable: print_4
  mov R11, [RAX+56]
  mov [RBP-40], R11 ; Holds the closed over variable: nptaxmgpxg_1045
  mov R11, [RAX+64]
  mov [RBP-48], R11 ; Holds the closed over variable: vhvhsgetnk_244
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+16] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+24], [RBP+24], [RBP+24], 0x7fffffffffffffff, [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-56], RAX ; [RBP-56] holds the variable wpxslzbiui_1627
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0xffffffffffffffff, 0xffffffffffffffff)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-64], RAX ; [RBP-64] holds the variable app_1640
  mov RAX, [RBP-64]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_934
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_934
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_934
_is_bool_found_bool_934:
  mov RAX, 0xffffffffffffffff
_is_bool_done_934:
  mov [RBP-72], RAX ; [RBP-72] holds the variable laixbehjfr_1637
  mov RAX, [RBP-72]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_930
  mov RAX, [RBP+16]
  jmp near done_930
if_false_930:
  mov RAX, [RBP-72]
done_930:
  mov [RBP-80], RAX ; [RBP-80] holds the variable if_1648
  mov RAX, [RBP-80]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_919
  mov RAX, [RBP-72]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  jmp near done_919
if_false_919:
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-72] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-72] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-72] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+24] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-72] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-72], [RBP-72], [RBP-72], [RBP+24], [RBP-72])
  add RSP, 48 ; Increment RSP after calling the closure
done_919:
  mov [RBP-88], RAX ; [RBP-88] holds the variable zblpcxeoth_1645
  mov RAX, [RBP+24]
  mov [RBP-96], RAX ; [RBP-96] holds the variable lisrrwakjg_1667
  mov RAX, [RBP+16]
  mov [RBP-104], RAX ; [RBP-104] holds the variable igcjymonjt_1671
  mov RAX, [RBP+24]
  mov [RBP-112], RAX ; [RBP-112] holds the variable gkxzksqcdj_1675
  mov RAX, 12
  mov [RBP-120], RAX ; [RBP-120] holds the variable trmqlzqjxf_1679
  mov RAX, 2
  mov [RBP-128], RAX ; [RBP-128] holds the variable amovynehei_1683
  mov RAX, [RBP-104]
  mov [RBP-136], RAX ; [RBP-136] holds the variable vnruwdurip_1687
  mov RAX, [RBP+24]
  mov [RBP-144], RAX ; [RBP-144] holds the variable uihymfsxhi_1691
  mov RAX, 0xffffffffffffffff
  mov [RBP-152], RAX ; [RBP-152] holds the variable xadywvykxl_1695
  mov RAX, [RBP-96]
  mov [RBP-160], RAX ; [RBP-160] holds the variable ioxonfyrni_1699
  mov RAX, 0xffffffffffffffff
  mov [RBP-168], RAX ; [RBP-168] holds the variable amiplbxqfp_1703
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-152] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-152])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-176], RAX ; [RBP-176] holds the variable zoggzvlhsa_1662
  mov RAX, [RBP-56]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_904
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_904
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_904
_is_bool_found_bool_904:
  mov RAX, 0xffffffffffffffff
_is_bool_done_904:
  mov [RBP-184], RAX ; [RBP-184] holds the variable qsuckwnebz_1713
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0x7fffffffffffffff, 0x7fffffffffffffff)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-192], RAX ; [RBP-192] holds the variable pdgttkcsvk_1718
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-192] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-192] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-56] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+16] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-72] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-192], [RBP-192], [RBP-56], [RBP+16], [RBP-72])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-200], RAX ; [RBP-200] holds the variable nhiseyrjpo_1725
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-200] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-176] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-184] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0xffffffffffffffff, [RBP-200], [RBP-176], [RBP-184])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-208], RAX ; [RBP-208] holds the variable flqcybdgvh_1735
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+16])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-216], RAX ; [RBP-216] holds the variable gbcshjesfm_1709
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-88] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+24] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-216] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, [RBP-88], 0xffffffffffffffff, [RBP+24], [RBP-216])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-224], RAX ; [RBP-224] holds the variable ylaigjryax_1747
  mov RAX, 0
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP+24]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-232], RAX ; [RBP-232] holds the variable binop_1760
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+24])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-240], RAX ; [RBP-240] holds the variable app_1763
  mov RAX, [RBP-232]
  mov R11, RAX
  mov RAX, [RBP-240]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_868
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_868
_cmp_fail_868:
  mov RAX, 0x7fffffffffffffff
_cmp_done_868:
  mov [RBP-248], RAX ; [RBP-248] holds the variable fzabirwdni_1757
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(0x7fffffffffffffff)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-256], RAX ; [RBP-256] holds the variable csbjtwlcvw_1771
  mov RAX, [RBP-176]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_863
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_863
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_863
_is_bool_found_bool_863:
  mov RAX, 0xffffffffffffffff
_is_bool_done_863:
  mov [RBP-264], RAX ; [RBP-264] holds the variable nxslqmbpfm_1777
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-224] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-224] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+24] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-224], 0xffffffffffffffff, [RBP-224], [RBP+24])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-272], RAX ; [RBP-272] holds the variable gesvtipwrb_1767
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-248] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-88] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-248], [RBP-88])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-280], RAX ; [RBP-280] holds the variable app_1787
  mov RAX, [RBP-280]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-288], RAX ; [RBP-288] holds the variable unary_1624
  mov RAX, [RBP-288]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  leave
  ret
  ;; } define lambda-818
lambda_end_818:
  ;; Check if we have space on the heap to store our function of size 80: 
  mov RAX, [HEAP_END] ; Reserving 10 words
  sub RAX, 80
  cmp RAX, R15
  jge near memcheck_ok_818
  mov RDI, QWORD R15
  mov RSI, QWORD 80
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_818:
  ;; Store lambda-818 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_818 ; Store the function pointer
  mov QWORD [R15+16], 12 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-80] ; Store fzvrvmjjaf_1363
  mov QWORD [R15+24], R11
  mov R11, [RBP-72] ; Store rezkachxsj_1314
  mov QWORD [R15+32], R11
  mov R11, [RBP-48] ; Store ceyyxthupa_53
  mov QWORD [R15+40], R11
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+48], R11
  mov R11, [RBP-64] ; Store nptaxmgpxg_1045
  mov QWORD [R15+56], R11
  mov R11, [RBP-56] ; Store vhvhsgetnk_244
  mov QWORD [R15+64], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 80 ; Bump the heap register
  ;; } store lambda-818
  mov [RBP-88], RAX ; Store letrec-ed function csfijturta_1620
  ;; Define lambda-769 {
  jmp near lambda_end_769
lambda_769:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 112
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 112, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+56] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: vhvhsgetnk_244
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: print_4
  mov R11, [RAX+40]
  mov [RBP-24], R11 ; Holds the closed over variable: ceyyxthupa_53
  mov R11, [RAX+48]
  mov [RBP-32], R11 ; Holds the closed over variable: csfijturta_1620
  mov R11, [RAX+56]
  mov [RBP-40], R11 ; Holds the closed over variable: fzvrvmjjaf_1363
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD -16 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+40], -16)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-48], RAX ; [RBP-48] holds the variable app_1802
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+32] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+48], [RBP+32])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-56], RAX ; [RBP-56] holds the variable app_1807
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-56] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-56])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-64], RAX ; [RBP-64] holds the variable app_1806
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 18 ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+48] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+24], 18, [RBP+24], 0xffffffffffffffff, [RBP+48])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-72], RAX ; [RBP-72] holds the variable app_1812
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+32] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+32] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+24] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP+40] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+32], [RBP+32], 0xffffffffffffffff, [RBP+24], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-80], RAX ; [RBP-80] holds the variable app_1819
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0xffffffffffffffff, [RBP+24])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-88], RAX ; [RBP-88] holds the variable app_1827
  mov RAX, [RBP-88]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_787
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_787
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_787
_is_bool_found_bool_787:
  mov RAX, 0xffffffffffffffff
_is_bool_done_787:
  mov [RBP-96], RAX ; [RBP-96] holds the variable unary_1826
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-48] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-64] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-72] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-80] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-96] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-48], [RBP-64], [RBP-72], [RBP-80], [RBP-96])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-104], RAX ; [RBP-104] holds the variable app_1801
  mov RAX, [RBP-104]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  leave
  ret
  ;; } define lambda-769
lambda_end_769:
  ;; Check if we have space on the heap to store our function of size 64: 
  mov RAX, [HEAP_END] ; Reserving 8 words
  sub RAX, 64
  cmp RAX, R15
  jge near memcheck_ok_769
  mov RDI, QWORD R15
  mov RSI, QWORD 64
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_769:
  ;; Store lambda-769 on the heap {
  mov QWORD [R15+0], 10 ; Store the arity
  mov QWORD [R15+8], lambda_769 ; Store the function pointer
  mov QWORD [R15+16], 10 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-56] ; Store vhvhsgetnk_244
  mov QWORD [R15+24], R11
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+32], R11
  mov R11, [RBP-48] ; Store ceyyxthupa_53
  mov QWORD [R15+40], R11
  mov R11, [RBP-88] ; Store csfijturta_1620
  mov QWORD [R15+48], R11
  mov R11, [RBP-80] ; Store fzvrvmjjaf_1363
  mov QWORD [R15+56], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 64 ; Bump the heap register
  ;; } store lambda-769
  mov [RBP-96], RAX ; Store letrec-ed function kidavtsoie_1797
  ;; Define lambda-62 {
  jmp near lambda_end_62
lambda_62:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 1296
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 1296, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-304], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-312], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-320], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-328], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-336], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-344], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-352], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-360], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-368], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-376], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-384], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-392], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-400], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-408], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-416], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-424], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-432], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-440], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-448], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-456], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-464], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-472], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-480], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-488], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-496], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-504], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-512], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-520], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-528], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-536], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-544], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-552], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-560], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-568], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-576], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-584], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-592], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-600], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-608], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-616], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-624], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-632], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-640], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-648], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-656], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-664], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-672], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-680], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-688], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-696], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-704], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-712], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-720], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-728], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-736], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-744], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-752], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-760], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-768], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-776], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-784], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-792], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-800], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-808], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-816], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-824], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-832], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-840], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-848], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-856], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-864], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-872], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-880], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-888], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-896], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-904], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-912], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-920], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-928], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-936], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-944], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-952], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-960], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-968], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-976], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-984], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-992], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1000], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1008], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1016], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1024], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1032], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1040], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1048], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1056], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1064], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1072], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1080], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1088], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1096], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1296], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: vhvhsgetnk_244
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: nptaxmgpxg_1045
  mov R11, [RAX+40]
  mov [RBP-24], R11 ; Holds the closed over variable: ceyyxthupa_53
  mov R11, [RAX+48]
  mov [RBP-32], R11 ; Holds the closed over variable: kidavtsoie_1797
  mov R11, [RAX+56]
  mov [RBP-40], R11 ; Holds the closed over variable: rezkachxsj_1314
  mov R11, [RAX+64]
  mov [RBP-48], R11 ; Holds the closed over variable: print_4
  mov R11, [RAX+72]
  mov [RBP-56], R11 ; Holds the closed over variable: fzvrvmjjaf_1363
  mov R11, [RAX+80]
  mov [RBP-64], R11 ; Holds the closed over variable: csfijturta_1620
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+16] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0xffffffffffffffff, 0x7fffffffffffffff, 0xffffffffffffffff, [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-72], RAX ; [RBP-72] holds the variable app_1852
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+24] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0x7fffffffffffffff, 0x7fffffffffffffff, 0x7fffffffffffffff, [RBP+24])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-80], RAX ; [RBP-80] holds the variable app_1858
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-64]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0x7fffffffffffffff, [RBP+24])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-88], RAX ; [RBP-88] holds the variable app_1865
  mov RAX, [RBP-88]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_751
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_751
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_751
_is_bool_found_bool_751:
  mov RAX, 0xffffffffffffffff
_is_bool_done_751:
  mov [RBP-96], RAX ; [RBP-96] holds the variable unary_1864
  mov RAX, [RBP+16]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 8
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-104], RAX ; [RBP-104] holds the variable binop_1870
  mov RAX, [RBP+24]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -6
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-112], RAX ; [RBP-112] holds the variable binop_1873
  mov RAX, [RBP-104]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-112]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-120], RAX ; [RBP-120] holds the variable binop_1869
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0x7fffffffffffffff, [RBP+16], 0x7fffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-128], RAX ; [RBP-128] holds the variable app_1876
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-72] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-80] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-96] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-120] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-128] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-72], [RBP-80], [RBP-96], [RBP-120], [RBP-128])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-136], RAX ; [RBP-136] holds the variable qtockidphh_1849
  mov RAX, [RBP+16]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP+16]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-144], RAX ; [RBP-144] holds the variable binop_1893
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-144] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-144])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-152], RAX ; [RBP-152] holds the variable app_1892
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0, [RBP+24], [RBP+16], [RBP-136], 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-160], RAX ; [RBP-160] holds the variable app_1897
  mov RAX, [RBP-152]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-168], RAX ; [RBP-168] holds the variable cqjgfsksin_1889
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-168] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 12 ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-136] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-168], 12, [RBP+16], [RBP-136], [RBP-136])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-176], RAX ; [RBP-176] holds the variable app_1906
  mov RAX, [RBP+24]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-184], RAX ; [RBP-184] holds the variable unary_1913
  mov RAX, [RBP-176]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-184]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-192], RAX ; [RBP-192] holds the variable binop_1905
  mov RAX, [RBP+16]
  mov [RBP-200], RAX ; [RBP-200] holds the variable qkzaopkmzc_1918
  mov RAX, [RBP-136]
  mov [RBP-208], RAX ; [RBP-208] holds the variable abavkzuhvu_1922
  mov RAX, [RBP-136]
  mov [RBP-216], RAX ; [RBP-216] holds the variable rbfnhlqnis_1926
  mov RAX, 0x7fffffffffffffff
  mov [RBP-224], RAX ; [RBP-224] holds the variable eejwrlaquf_1930
  mov RAX, [RBP-136]
  mov [RBP-232], RAX ; [RBP-232] holds the variable cprmonhict_1934
  mov RAX, [RBP-200]
  mov [RBP-240], RAX ; [RBP-240] holds the variable oyqsxylxyz_1938
  mov RAX, [RBP-208]
  mov [RBP-248], RAX ; [RBP-248] holds the variable tnxcqfkjac_1942
  mov RAX, [RBP+16]
  mov [RBP-256], RAX ; [RBP-256] holds the variable jhzswmzkxu_1946
  mov RAX, [RBP-200]
  mov [RBP-264], RAX ; [RBP-264] holds the variable zhkuzyyuei_1950
  mov RAX, [RBP+16]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-272], RAX ; [RBP-272] holds the variable unary_1954
  mov RAX, [RBP-256]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-272]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-280], RAX ; [RBP-280] holds the variable binop_1915
  mov RAX, [RBP-192]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-288], RAX ; [RBP-288] holds the variable nuxsscxmkm_1885
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-136] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -20 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-136] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-136], [RBP-136], [RBP-136], -20, [RBP-136])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-296], RAX ; [RBP-296] holds the variable app_1961
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-64]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-136], [RBP+24])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-304], RAX ; [RBP-304] holds the variable app_1968
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-64]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-296] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-304] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-296], [RBP-304])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-312], RAX ; [RBP-312] holds the variable app_1960
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-64]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0x7fffffffffffffff, [RBP+24])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-320], RAX ; [RBP-320] holds the variable app_1975
  mov RAX, [RBP-320]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-328], RAX ; [RBP-328] holds the variable unary_1974
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-288] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-288])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-336], RAX ; [RBP-336] holds the variable app_1980
  mov RAX, [RBP+16]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -2
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-344], RAX ; [RBP-344] holds the variable binop_1983
  mov RAX, [RBP-336]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-344]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-352], RAX ; [RBP-352] holds the variable binop_1979
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-352]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-360], RAX ; [RBP-360] holds the variable binop_1973
  mov RAX, [RBP-312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-360]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-368], RAX ; [RBP-368] holds the variable joaxrwkfas_1957
  mov RAX, [RBP-136]
  mov [RBP-376], RAX ; [RBP-376] holds the variable kekkawguwf_1996
  mov RAX, [RBP-288]
  mov [RBP-384], RAX ; [RBP-384] holds the variable dfmabwjrfe_2000
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 8 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-288] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD -4 ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(8, [RBP-288], -4, 0x7fffffffffffffff, 0x7fffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-392], RAX ; [RBP-392] holds the variable app_2004
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-288] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-288])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-400], RAX ; [RBP-400] holds the variable app_2011
  mov RAX, [RBP-288]
  mov R11, RAX
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_632
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_632
_cmp_fail_632:
  mov RAX, 0x7fffffffffffffff
_cmp_done_632:
  mov [RBP-408], RAX ; [RBP-408] holds the variable binop_2014
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-136])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-416], RAX ; [RBP-416] holds the variable app_2017
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-368] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-392] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-400] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-408] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-416] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-368], [RBP-392], [RBP-400], [RBP-408], [RBP-416])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-424], RAX ; [RBP-424] holds the variable qgztadmkyj_1991
  mov RAX, [RBP+24]
  mov [RBP-432], RAX ; [RBP-432] holds the variable xmrsobwdmz_2027
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-64]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-288] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-136], [RBP-288])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-440], RAX ; [RBP-440] holds the variable app_2031
  mov RAX, [RBP-368]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-448], RAX ; [RBP-448] holds the variable unary_2035
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-136] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-136], [RBP+16], [RBP-136], 0xffffffffffffffff, [RBP-136])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-456], RAX ; [RBP-456] holds the variable app_2037
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-440] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-448] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-456] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-136], [RBP-440], [RBP-448], [RBP-456])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-464], RAX ; [RBP-464] holds the variable hptclxqxgi_2022
  ;; or_lhs {
  mov RAX, [RBP-136]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_599
  ;; or_rhs {
  mov RAX, [RBP-136]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_599
  mov RAX, 0x7fffffffffffffff
or_done_599:
  mov [RBP-472], RAX ; [RBP-472] holds the variable binop_and_or_2049
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD -12 ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(-12)
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-480], RAX ; [RBP-480] holds the variable app_2052
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-64]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-472] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-480] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-472], [RBP-480])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-488], RAX ; [RBP-488] holds the variable fznbcfcjfj_2046
  ;; or_lhs {
  mov RAX, [RBP-136]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_589
  ;; or_rhs {
  mov RAX, [RBP-136]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_589
  mov RAX, 0x7fffffffffffffff
or_done_589:
  mov [RBP-496], RAX ; [RBP-496] holds the variable binop_and_or_2060
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-136] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+16] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0xffffffffffffffff, [RBP-136], [RBP-136], [RBP+16])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-504], RAX ; [RBP-504] holds the variable app_2063
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-496] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-504] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-496], [RBP-504])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-512], RAX ; [RBP-512] holds the variable zvyhnzolvx_2057
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-136] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0xffffffffffffffff, [RBP-136])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-520], RAX ; [RBP-520] holds the variable app_2074
  mov RAX, 0xffffffffffffffff
  mov [RBP-528], RAX ; [RBP-528] holds the variable zfzolcwgoo_2081
  mov RAX, -18
  mov [RBP-536], RAX ; [RBP-536] holds the variable gqoocphbrc_2085
  mov RAX, 4
  mov [RBP-544], RAX ; [RBP-544] holds the variable gyonqgtuua_2089
  mov RAX, [RBP-544]
  mov [RBP-552], RAX ; [RBP-552] holds the variable rrklhtmwxi_2093
  mov RAX, [RBP-552]
  mov [RBP-560], RAX ; [RBP-560] holds the variable nevcpisekg_2097
  mov RAX, -2
  mov [RBP-568], RAX ; [RBP-568] holds the variable crbwslnkef_2101
  mov RAX, [RBP-528]
  mov [RBP-576], RAX ; [RBP-576] holds the variable slgpwrjaoy_2105
  mov RAX, 0xffffffffffffffff
  mov [RBP-584], RAX ; [RBP-584] holds the variable zylpeetadz_2109
  mov RAX, 0xffffffffffffffff
  mov [RBP-592], RAX ; [RBP-592] holds the variable epwjbhszex_2113
  mov RAX, [RBP-584]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_546
  mov RAX, [RBP-368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-288]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_546
if_false_546:
  mov RAX, [RBP-288]
  mov [RBP-608], RAX ; [RBP-608] holds the variable fsxejlhnpv_2122
  mov RAX, [RBP-136]
  mov [RBP-616], RAX ; [RBP-616] holds the variable tjfmuumlxx_2126
  mov RAX, 2
  mov [RBP-624], RAX ; [RBP-624] holds the variable yhrecdcqzw_2130
  mov RAX, 0
  mov [RBP-632], RAX ; [RBP-632] holds the variable htphtrzhrn_2134
  mov RAX, 0xffffffffffffffff
  mov [RBP-640], RAX ; [RBP-640] holds the variable sawtmpbnlr_2138
  mov RAX, [RBP-136]
  mov [RBP-648], RAX ; [RBP-648] holds the variable iyfivtprsy_2142
  mov RAX, 0x7fffffffffffffff
  mov [RBP-656], RAX ; [RBP-656] holds the variable buiaruqobc_2146
  mov RAX, [RBP-424]
done_546:
  mov [RBP-600], RAX ; [RBP-600] holds the variable if_2078
  mov RAX, [RBP-520]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-600]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-608], RAX ; [RBP-608] holds the variable gcyjofmfkc_2071
  ;; and_lhs {
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-424] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-136], 0xffffffffffffffff, [RBP-136], [RBP-424])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-624], RAX ; [RBP-624] holds the variable app_2155
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-512] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-512])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-632], RAX ; [RBP-632] holds the variable app_2161
  mov RAX, [RBP-624]
  mov R11, RAX
  mov RAX, [RBP-632]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_531
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_531
_cmp_fail_531:
  mov RAX, 0x7fffffffffffffff
_cmp_done_531:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_522
  ;; and_rhs {
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -6 ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-136], 0x7fffffffffffffff, 0x7fffffffffffffff, -6)
  add RSP, 48 ; Increment RSP after calling the closure
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_522
  mov RAX, 0xffffffffffffffff
and_done_522:
  mov [RBP-616], RAX ; [RBP-616] holds the variable zedlnzzlwm_2151
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-368] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-288] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-424] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-368], [RBP-288], [RBP-424], 0x7fffffffffffffff, 0x7fffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-624], RAX ; [RBP-624] holds the variable app_2175
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-288] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 18 ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-424] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-616] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-136] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-288], 18, [RBP-424], [RBP-616], [RBP-136])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-632], RAX ; [RBP-632] holds the variable app_2182
  mov RAX, [RBP-624]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-632]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-640], RAX ; [RBP-640] holds the variable binop_2174
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-640] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-640])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-648], RAX ; [RBP-648] holds the variable ybwslpulwf_2171
  mov RAX, 20
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP+24]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-656], RAX ; [RBP-656] holds the variable binop_2195
  mov RAX, [RBP-656]
  ;; IsNum(...)
  and RAX, 0x1
  xor RAX, 0x1
  shl RAX, 63
  mov R10, 0x7fffffffffffffff
  or RAX, R10
  mov [RBP-664], RAX ; [RBP-664] holds the variable unary_2194
  mov RAX, [RBP-664]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_495
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_495
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_495
_is_bool_found_bool_495:
  mov RAX, 0xffffffffffffffff
_is_bool_done_495:
  mov [RBP-672], RAX ; [RBP-672] holds the variable gmargmmcqq_2191
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-512] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-464] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-648] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-512], [RBP-464], [RBP-648], [RBP-136], 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-680], RAX ; [RBP-680] holds the variable app_2202
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-680] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-680])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-688], RAX ; [RBP-688] holds the variable wbxhlctede_2199
  mov RAX, [RBP-672]
  mov [RBP-696], RAX ; [RBP-696] holds the variable mzxlzjxbix_2216
  mov RAX, [RBP-512]
  mov [RBP-704], RAX ; [RBP-704] holds the variable hfnlvnwzzr_2220
  mov RAX, [RBP-488]
  mov [RBP-712], RAX ; [RBP-712] holds the variable sbomxmxvom_2224
  mov RAX, [RBP-672]
  mov [RBP-720], RAX ; [RBP-720] holds the variable gxzlzshdaf_2228
  mov RAX, 0x7fffffffffffffff
  mov [RBP-728], RAX ; [RBP-728] holds the variable kcjffqdwme_2232
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-616] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-136] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-616] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-288] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-616], [RBP-136], [RBP-616], [RBP-288])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-736], RAX ; [RBP-736] holds the variable app_2236
  ;; and_lhs {
  mov RAX, [RBP-616]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_471
  ;; and_rhs {
  mov RAX, [RBP-672]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_471
  mov RAX, 0xffffffffffffffff
and_done_471:
  mov [RBP-744], RAX ; [RBP-744] holds the variable binop_and_or_2242
  mov RAX, [RBP-136]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_467
  mov RAX, [RBP-424]
  jmp near done_467
if_false_467:
  mov RAX, [RBP-608]
done_467:
  mov [RBP-752], RAX ; [RBP-752] holds the variable if_2245
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-616] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-736] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-744] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-752] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-616], [RBP-736], [RBP-744], [RBP-752])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-760], RAX ; [RBP-760] holds the variable vprbchdlam_2211
  ;; or_lhs {
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-136])
  add RSP, 16 ; Increment RSP after calling the closure
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_451
  ;; or_rhs {
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-616] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-648] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-136], [RBP-616], [RBP-136], [RBP-648])
  add RSP, 48 ; Increment RSP after calling the closure
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_451
  mov RAX, 0x7fffffffffffffff
or_done_451:
  mov [RBP-768], RAX ; [RBP-768] holds the variable binop_and_or_2251
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 10 ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-616] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-616] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, 10, [RBP-616], [RBP-136], [RBP-616])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-776], RAX ; [RBP-776] holds the variable app_2262
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-776] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-776])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-784], RAX ; [RBP-784] holds the variable app_2261
  mov RAX, [RBP-768]
  mov R11, RAX
  mov RAX, [RBP-784]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_438
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_438
_cmp_fail_438:
  mov RAX, 0x7fffffffffffffff
_cmp_done_438:
  mov [RBP-792], RAX ; [RBP-792] holds the variable zvtzhvkhir_1987
  mov RAX, [RBP+24]
  mov [RBP-800], RAX ; [RBP-800] holds the variable dugersauxh_2277
  mov RAX, [RBP-136]
  mov [RBP-808], RAX ; [RBP-808] holds the variable bgfzsggobp_2281
  mov RAX, [RBP-136]
  mov [RBP-816], RAX ; [RBP-816] holds the variable otfjzwezwp_2285
  mov RAX, [RBP-792]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_431
  mov RAX, [RBP+24]
  jmp near done_431
if_false_431:
  mov RAX, [RBP+24]
done_431:
  mov [RBP-824], RAX ; [RBP-824] holds the variable if_2289
  mov RAX, [RBP-368]
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_429
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_429
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_429
_is_bool_found_bool_429:
  mov RAX, 0xffffffffffffffff
_is_bool_done_429:
  mov [RBP-832], RAX ; [RBP-832] holds the variable unary_2293
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-136] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-288] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-792] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-136], [RBP-136], [RBP-136], [RBP-288], [RBP-792])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-840], RAX ; [RBP-840] holds the variable app_2295
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-816] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-824] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-832] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-840] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-816], [RBP-824], [RBP-832], [RBP-840])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-848], RAX ; [RBP-848] holds the variable app_2274
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-848] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-848])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-856], RAX ; [RBP-856] holds the variable hswxznhwke_2271
  mov RAX, [RBP-792]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_409
  mov RAX, 0
  jmp near done_409
if_false_409:
  mov RAX, [RBP-288]
done_409:
  mov [RBP-864], RAX ; [RBP-864] holds the variable if_2309
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-136] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0xffffffffffffffff, [RBP-136])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-872], RAX ; [RBP-872] holds the variable app_2313
  mov RAX, [RBP-864]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-872]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-880], RAX ; [RBP-880] holds the variable binop_2308
  mov RAX, [RBP-792]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_398
  mov RAX, [RBP-288]
  jmp near done_398
if_false_398:
  mov RAX, [RBP-856]
done_398:
  mov [RBP-888], RAX ; [RBP-888] holds the variable if_2318
  mov RAX, [RBP-856]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 14
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-896], RAX ; [RBP-896] holds the variable binop_2322
  mov RAX, [RBP-888]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-896]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-904], RAX ; [RBP-904] holds the variable binop_2317
  mov RAX, [RBP-368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-856]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-912], RAX ; [RBP-912] holds the variable binop_2326
  mov RAX, 0xffffffffffffffff
  mov [RBP-920], RAX ; [RBP-920] holds the variable zdbslmdlzx_2331
  mov RAX, 0xffffffffffffffff
  mov [RBP-928], RAX ; [RBP-928] holds the variable ybzpwshjpy_2335
  mov RAX, -4
  mov [RBP-936], RAX ; [RBP-936] holds the variable ievrvrqhxp_2339
  mov RAX, [RBP-912]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP+16]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-944], RAX ; [RBP-944] holds the variable binop_2325
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-368] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-136] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0xffffffffffffffff, 0xffffffffffffffff, [RBP-136], [RBP-368], [RBP-136])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-952], RAX ; [RBP-952] holds the variable app_2343
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-792] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-856] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0x7fffffffffffffff, [RBP-792], [RBP-136], [RBP-856])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-960], RAX ; [RBP-960] holds the variable app_2350
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-880] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-904] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-944] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-952] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-960] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-880], [RBP-904], [RBP-944], [RBP-952], [RBP-960])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-968], RAX ; [RBP-968] holds the variable kgfaxqznxv_2305
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-136], 0xffffffffffffffff)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-976], RAX ; [RBP-976] holds the variable app_2361
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-792] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-136] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-792], [RBP-136])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-984], RAX ; [RBP-984] holds the variable app_2366
  mov RAX, [RBP-984]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-992], RAX ; [RBP-992] holds the variable unary_2365
  mov RAX, [RBP-136]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_349
  mov RAX, [RBP-856]
  jmp near done_349
if_false_349:
  mov RAX, -4
done_349:
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable if_2371
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+16] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-792] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-136], [RBP+16], [RBP-792], [RBP-136])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable app_2375
  mov RAX, [RBP-1000]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1008]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable binop_2370
  mov RAX, [RBP-368]
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable odnfkgtepg_2384
  mov RAX, [RBP+16]
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable buehtqxiny_2388
  mov RAX, [RBP-136]
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable kvepkanezt_2392
  mov RAX, [RBP-856]
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable mxljxaaccl_2396
  mov RAX, [RBP-856]
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable cfajhctqqf_2400
  mov RAX, 0xffffffffffffffff
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable ktakiuwouv_2404
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable utfupuqynt_2408
  mov RAX, -6
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable huzpvwvumv_2412
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1040] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1040])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable app_2381
  mov RAX, 16
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 10
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable binop_2418
  mov RAX, [RBP-288]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable binop_2421
  mov RAX, [RBP-1096]
  mov R11, RAX
  mov RAX, [RBP-1104]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_320
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_320
_cmp_fail_320:
  mov RAX, 0x7fffffffffffffff
_cmp_done_320:
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable binop_2417
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-976] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-992] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-1016] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-1088] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-1112] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-976], [RBP-992], [RBP-1016], [RBP-1088], [RBP-1112])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable ugdkgilmuo_2358
  mov RAX, 8
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable unary_2430
  mov RAX, [RBP-136]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_307
  mov RAX, [RBP-792]
  jmp near done_307
if_false_307:
  mov RAX, [RBP-1120]
done_307:
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable if_2432
  mov RAX, [RBP-1128]
  mov R11, RAX
  mov RAX, [RBP-1136]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_304
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_304
_cmp_fail_304:
  mov RAX, 0x7fffffffffffffff
_cmp_done_304:
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable binop_2429
  ;; or_lhs {
  mov RAX, [RBP-136]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_301
  ;; or_rhs {
  mov RAX, [RBP-792]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_301
  mov RAX, 0x7fffffffffffffff
or_done_301:
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable binop_and_or_2437
  mov RAX, [RBP+16]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1160], RAX ; [RBP-1160] holds the variable unary_2440
  mov RAX, [RBP-1152]
  mov R11, RAX
  mov RAX, [RBP-1160]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_296
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_296
_cmp_fail_296:
  mov RAX, 0x7fffffffffffffff
_cmp_done_296:
  mov [RBP-1168], RAX ; [RBP-1168] holds the variable binop_2436
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-8]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1144] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1168] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-1144], [RBP-1168])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable tjaghydguk_2426
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-16]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-792] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-136] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -10 ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-792], 0x7fffffffffffffff, [RBP-136], -10)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable app_2447
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1120] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+16] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-136] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP+16], [RBP-1120], [RBP+16], [RBP-136], [RBP-136])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable app_2454
  mov RAX, [RBP-136]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_275
  mov RAX, 0
  jmp near done_275
if_false_275:
  mov RAX, 18
done_275:
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable if_2461
  mov RAX, [RBP-1192]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1200]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable binop_2453
  mov RAX, 0x7fffffffffffffff
  ;; IsBool(...)
  cmp RAX, 0xffffffffffffffff
  je near _is_bool_found_bool_270
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near _is_bool_found_bool_270
  mov RAX, 0x7fffffffffffffff
  jmp near _is_bool_done_270
_is_bool_found_bool_270:
  mov RAX, 0xffffffffffffffff
_is_bool_done_270:
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable unary_2466
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1216] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1216])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable app_2465
  mov RAX, [RBP-368]
  mov R11, RAX
  mov RAX, 16
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_264
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_264
_cmp_fail_264:
  mov RAX, 0x7fffffffffffffff
_cmp_done_264:
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable binop_2470
  mov RAX, [RBP-1232]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_256
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, [RBP-1120]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_260
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_260
_cmp_fail_260:
  mov RAX, 0x7fffffffffffffff
_cmp_done_260:
  jmp near done_256
if_false_256:
  mov RAX, [RBP+16]
  mov R11, RAX
  mov RAX, 0x7fffffffffffffff
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_257
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_257
_cmp_fail_257:
  mov RAX, 0x7fffffffffffffff
_cmp_done_257:
done_256:
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable if_2469
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0x7fffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-792] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-792] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD -8 ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-792] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-24] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func(0x7fffffffffffffff, [RBP-792], [RBP-792], -8, [RBP-792])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable app_2479
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1184] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1208] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-1224] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-1240] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-1248] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-32] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-1184], [RBP-1208], [RBP-1224], [RBP-1240], [RBP-1248])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable xzemcghgue_2444
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-40]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-968] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-792] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-40] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0xffffffffffffffff, [RBP-968], [RBP-792], 0x7fffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable app_2489
  mov RAX, [RBP-1264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable unary_2488
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1256] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-1256])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable app_2496
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 10
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1176] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-968] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 12 ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-136] ; arg_3
  mov QWORD [RSP+24], R10
  mov R10, QWORD [RBP-792] ; arg_4
  mov QWORD [RSP+32], R10
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+40], R11
  call RAX ; func([RBP-1176], [RBP-968], 12, [RBP-136], [RBP-792])
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable app_2499
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-64]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-1280] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-1288] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-1280], [RBP-1288])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable app_2495
  mov RAX, [RBP-1272]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1296]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  leave
  ret
  ;; } define lambda-62
lambda_end_62:
  ;; Check if we have space on the heap to store our function of size 96: 
  mov RAX, [HEAP_END] ; Reserving 12 words
  sub RAX, 96
  cmp RAX, R15
  jge near memcheck_ok_62
  mov RDI, QWORD R15
  mov RSI, QWORD 96
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_62:
  ;; Store lambda-62 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_62 ; Store the function pointer
  mov QWORD [R15+16], 16 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-56] ; Store vhvhsgetnk_244
  mov QWORD [R15+24], R11
  mov R11, [RBP-64] ; Store nptaxmgpxg_1045
  mov QWORD [R15+32], R11
  mov R11, [RBP-48] ; Store ceyyxthupa_53
  mov QWORD [R15+40], R11
  mov R11, [RBP-96] ; Store kidavtsoie_1797
  mov QWORD [R15+48], R11
  mov R11, [RBP-72] ; Store rezkachxsj_1314
  mov QWORD [R15+56], R11
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+64], R11
  mov R11, [RBP-80] ; Store fzvrvmjjaf_1363
  mov QWORD [R15+72], R11
  mov R11, [RBP-88] ; Store csfijturta_1620
  mov QWORD [R15+80], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 96 ; Bump the heap register
  ;; } store lambda-62
  mov [RBP-104], RAX ; Store letrec-ed function qoumtaqtns_1844
  mov RAX, [RBP-104]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-104]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD -16 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 14 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-104] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(-16, 14)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-112], RAX ; [RBP-112] holds the variable app_2514
  mov RAX, 10
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -10
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-120], RAX ; [RBP-120] holds the variable binop_2519
  mov RAX, [RBP-120]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-128], RAX ; [RBP-128] holds the variable unary_2518
  mov RAX, [RBP-112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-128]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-136], RAX ; [RBP-136] holds the variable binop_2513
  mov RAX, [RBP-104]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-104]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD -2 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD -18 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-104] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(-2, -18)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-144], RAX ; [RBP-144] holds the variable app_2524
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-56]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-56] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0xffffffffffffffff, 0xffffffffffffffff)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-152], RAX ; [RBP-152] holds the variable app_2528
  mov RAX, [RBP-144]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-152]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-160], RAX ; [RBP-160] holds the variable binop_2523
  mov RAX, [RBP-72]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-72]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 0xffffffffffffffff ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD -10 ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 0x7fffffffffffffff ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 0xffffffffffffffff ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-72] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(0xffffffffffffffff, -10, 0x7fffffffffffffff, 0xffffffffffffffff)
  add RSP, 48 ; Increment RSP after calling the closure
  mov [RBP-168], RAX ; [RBP-168] holds the variable app_2532
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-168]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-176], RAX ; [RBP-176] holds the variable binop_2522
  mov RAX, [RBP-104]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-104]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-136] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-176] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-104] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-136], [RBP-176])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-184], RAX ; [RBP-184] holds the variable app_2512
  mov RAX, [RBP-184]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  leave
  ret
  ;; Error labels: 
_global_assertion_failed_arith_not_num: ; Assertion failed, found a not-number when doing arithmetic
  mov RDI, 2
  call error
_global_assertion_failed_comparison_not_num: ; Assertion failed, found a not-number when doing a comparison
  mov RDI, 1
  call error
_global_assertion_failed_if_not_bool: ; Assertion failed, found a not-boolean as a condition in an if
  mov RDI, 4
  call error
_global_assertion_failed_logic_not_bool: ; Assertion failed, found a not-boolean when doing boolean logic
  mov RDI, 3
  call error
_global_overflow_abort: ; Call the error function when an integer overflow is detected
  mov RDI, 5
  call error
_global_assertion_failed_not_tuple: ; Assertion failed, expected a tuple
  mov RDI, 6
  call error
_global_assertion_failed_index_too_large: ; Assertion failed, tuple index too large
  mov RDI, 8
  call error
_global_assertion_failed_index_too_small: ; Assertion failed, tuple index too small
  mov RDI, 7
  call error
_global_assertion_failed_index_nil: ; Assertion failed, indexed into a tuple
  mov RDI, 9
  call error
_global_assertion_failed_no_more_heap_space: ; Assertion failed, out of space on our heap
  mov RDI, 10
  call error
_global_assertion_failed_not_a_closure: ; Assertion failed, tried to call a not-closure
  mov RDI, 11
  call error
_global_assertion_failed_arity_error: ; Assertion failed, tried to call a function with the wrong arity
  mov RDI, 12
  call error
_global_assertion_failed_out_of_stack_memory: ; Assertion failed, tried to call a function with the wrong arity
  mov RDI, 13
  call error