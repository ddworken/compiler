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
  enter 80, 0
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
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-127 {
  jmp near lambda_end_127
lambda_127:
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
  ;; } define lambda-127
lambda_end_127:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_127
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_127:
  ;; Store lambda-127 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_127 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-127
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-124 {
  jmp near lambda_end_124
lambda_124:
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
  ;; } define lambda-124
lambda_end_124:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_124
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_124:
  ;; Store lambda-124 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_124 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-124
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-119 {
  jmp near lambda_end_119
lambda_119:
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
  ;; } define lambda-119
lambda_end_119:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_119
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_119:
  ;; Store lambda-119 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_119 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-119
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-115 {
  jmp near lambda_end_115
lambda_115:
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
  ;; } define lambda-115
lambda_end_115:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_115
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_115:
  ;; Store lambda-115 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_115 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-115
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-110 {
  jmp near lambda_end_110
lambda_110:
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
  ;; } define lambda-110
lambda_end_110:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_110
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_110:
  ;; Store lambda-110 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_110 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-110
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; Define lambda-13 {
  jmp near lambda_end_13
lambda_13:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 48
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 48, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+48] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f2_84
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: f3_115
  mov R11, [RAX+40]
  mov [RBP-24], R11 ; Holds the closed over variable: f4_146
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+16]
  mov R11, RAX
  mov RAX, 2
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_33
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_33
_cmp_fail_33:
  mov RAX, 0x7fffffffffffffff
_cmp_done_33:
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_57
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_15
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
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+32] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+16], [RBP+24], [RBP+32], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_15
if_false_15:
  mov RAX, [RBP+16]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 2
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-40], RAX ; [RBP-40] holds the variable binop_68
  mov RAX, [RBP+48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-40] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+32] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+48] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP-40], [RBP+24], [RBP+32], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
done_15:
  leave
  ret
  ;; } define lambda-13
lambda_end_13:
  ;; Check if we have space on the heap to store our function of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_13
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_13:
  ;; Store lambda-13 on the heap {
  mov QWORD [R15+0], 8 ; Store the arity
  mov QWORD [R15+8], lambda_13 ; Store the function pointer
  mov QWORD [R15+16], 6 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov QWORD [R15+24], 24690 ; reserved space, will be filled in with: f2_84
  mov QWORD [R15+32], 24690 ; reserved space, will be filled in with: f3_115
  mov QWORD [R15+40], 24690 ; reserved space, will be filled in with: f4_146
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 48 ; Bump the heap register
  ;; } store lambda-13
  mov [RBP-48], RAX ; Store letrec-ed function f1_53
  ;; Define lambda-36 {
  jmp near lambda_end_36
lambda_36:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 32
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 32, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+48] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f3_115
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: f4_146
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, 4
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_56
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_56
_cmp_fail_56:
  mov RAX, 0x7fffffffffffffff
_cmp_done_56:
  mov [RBP-24], RAX ; [RBP-24] holds the variable binop_88
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_38
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
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+32] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+16], [RBP+24], [RBP+32], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_38
if_false_38:
  mov RAX, [RBP+24]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 2
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_100
  mov RAX, [RBP+48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-32] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+32] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+48] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+16], [RBP-32], [RBP+32], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
done_38:
  leave
  ret
  ;; } define lambda-36
lambda_end_36:
  ;; Check if we have space on the heap to store our function of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_36
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_36:
  ;; Store lambda-36 on the heap {
  mov QWORD [R15+0], 8 ; Store the arity
  mov QWORD [R15+8], lambda_36 ; Store the function pointer
  mov QWORD [R15+16], 4 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov QWORD [R15+24], 24690 ; reserved space, will be filled in with: f3_115
  mov QWORD [R15+32], 24690 ; reserved space, will be filled in with: f4_146
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  mov [R15-24], RAX ; Fill in the gap in a previously defined lambda
  add R15, 48 ; Bump the heap register
  ;; } store lambda-36
  mov [RBP-56], RAX ; Store letrec-ed function f2_84
  ;; Define lambda-59 {
  jmp near lambda_end_59
lambda_59:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 32
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 32, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+48] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f4_146
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+32]
  mov R11, RAX
  mov RAX, 6
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_79
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_79
_cmp_fail_79:
  mov RAX, 0x7fffffffffffffff
_cmp_done_79:
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_119
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_61
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
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+32] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+16], [RBP+24], [RBP+32], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
  jmp near done_61
if_false_61:
  mov RAX, [RBP+32]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 2
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-24], RAX ; [RBP-24] holds the variable binop_132
  mov RAX, [RBP+48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP-24] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP+40] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+48] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+16], [RBP+24], [RBP-24], [RBP+40])
  add RSP, 48 ; Increment RSP after calling the closure
done_61:
  leave
  ret
  ;; } define lambda-59
lambda_end_59:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_59
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_59:
  ;; Store lambda-59 on the heap {
  mov QWORD [R15+0], 8 ; Store the arity
  mov QWORD [R15+8], lambda_59 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov QWORD [R15+24], 24690 ; reserved space, will be filled in with: f4_146
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  mov [R15-64], RAX ; Fill in the gap in a previously defined lambda
  mov [R15-24], RAX ; Fill in the gap in a previously defined lambda
  add R15, 32 ; Bump the heap register
  ;; } store lambda-59
  mov [RBP-64], RAX ; Store letrec-ed function f3_115
  ;; Define lambda-82 {
  jmp near lambda_end_82
lambda_82:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 32
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 32, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+48] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+40]
  mov R11, RAX
  mov RAX, 8
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_107
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_107
_cmp_fail_107:
  mov RAX, 0x7fffffffffffffff
_cmp_done_107:
  mov [RBP-8], RAX ; [RBP-8] holds the variable binop_150
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_84
  mov RAX, [RBP+16]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_156
  mov RAX, [RBP-16]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP+32]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-24], RAX ; [RBP-24] holds the variable binop_155
  mov RAX, [RBP-24]
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
  jmp near done_84
if_false_84:
  mov RAX, [RBP+40]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 2
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_165
  mov RAX, [RBP+48]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+48]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD [RBP+32] ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD [RBP-16] ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+48] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func([RBP+16], [RBP+24], [RBP+32], [RBP-16])
  add RSP, 48 ; Increment RSP after calling the closure
done_84:
  leave
  ret
  ;; } define lambda-82
lambda_end_82:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_82
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_82:
  ;; Store lambda-82 on the heap {
  mov QWORD [R15+0], 8 ; Store the arity
  mov QWORD [R15+8], lambda_82 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  mov [R15-88], RAX ; Fill in the gap in a previously defined lambda
  mov [R15-48], RAX ; Fill in the gap in a previously defined lambda
  mov [R15-8], RAX ; Fill in the gap in a previously defined lambda
  add R15, 32 ; Bump the heap register
  ;; } store lambda-82
  mov [RBP-72], RAX ; Store letrec-ed function f4_146
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
  cmp QWORD [RAX+0], 8
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 48 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 20 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 24 ; arg_1
  mov QWORD [RSP+8], R10
  mov R10, QWORD 18 ; arg_2
  mov QWORD [RSP+16], R10
  mov R10, QWORD 26 ; arg_3
  mov QWORD [RSP+24], R10
  mov QWORD [RSP+40], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+32], R11
  call RAX ; func(20, 24, 18, 26)
  add RSP, 48 ; Increment RSP after calling the closure
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