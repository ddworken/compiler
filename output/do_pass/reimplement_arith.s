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
  enter 272, 0
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
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-210 {
  jmp near lambda_end_210
lambda_210:
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
  ;; } define lambda-210
lambda_end_210:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_210
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_210:
  ;; Store lambda-210 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_210 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-210
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-207 {
  jmp near lambda_end_207
lambda_207:
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
  ;; } define lambda-207
lambda_end_207:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_207
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_207:
  ;; Store lambda-207 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_207 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-207
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-202 {
  jmp near lambda_end_202
lambda_202:
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
  ;; } define lambda-202
lambda_end_202:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_202
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_202:
  ;; Store lambda-202 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_202 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-202
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-198 {
  jmp near lambda_end_198
lambda_198:
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
  ;; } define lambda-198
lambda_end_198:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_198
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_198:
  ;; Store lambda-198 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_198 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-198
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-193 {
  jmp near lambda_end_193
lambda_193:
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
  ;; } define lambda-193
lambda_end_193:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_193
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_193:
  ;; Store lambda-193 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_193 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-193
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; Define lambda-159 {
  jmp near lambda_end_159
lambda_159:
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
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, 0
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_190
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_190
_cmp_fail_190:
  mov RAX, 0x7fffffffffffffff
_cmp_done_190:
  mov [RBP-8], RAX ; [RBP-8] holds the variable binop_57
  mov RAX, [RBP-8]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_161
  mov RAX, [RBP+16]
  jmp near done_161
if_false_161:
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, 0
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
  jle near _cmp_fail_185
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_185
_cmp_fail_185:
  mov RAX, 0x7fffffffffffffff
_cmp_done_185:
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_63
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_163
  mov RAX, [RBP+16]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-24], RAX ; [RBP-24] holds the variable unary_67
  mov RAX, [RBP+24]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-32], RAX ; [RBP-32] holds the variable unary_69
  mov RAX, [RBP+32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-32] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-24], [RBP-32])
  add RSP, 32 ; Increment RSP after calling the closure
  jmp near done_163
if_false_163:
  mov RAX, [RBP+16]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-24], RAX ; [RBP-24] holds the variable unary_73
  mov RAX, [RBP+24]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-32], RAX ; [RBP-32] holds the variable unary_75
  mov RAX, [RBP+32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-32] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-24], [RBP-32])
  add RSP, 32 ; Increment RSP after calling the closure
done_163:
done_161:
  leave
  ret
  ;; } define lambda-159
lambda_end_159:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_159
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_159:
  ;; Store lambda-159 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_159 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-159
  mov [RBP-48], RAX ; Store letrec-ed function add_53
  ;; Define lambda-155 {
  jmp near lambda_end_155
lambda_155:
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
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  leave
  ret
  ;; } define lambda-155
lambda_end_155:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_155
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_155:
  ;; Store lambda-155 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_155 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-155
  mov [RBP-56], RAX ; Store letrec-ed function flip_84
  ;; Define lambda-110 {
  jmp near lambda_end_110
lambda_110:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 64
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 64, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: add_53
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: flip_84
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, 2
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_152
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_152
_cmp_fail_152:
  mov RAX, 0x7fffffffffffffff
_cmp_done_152:
  mov [RBP-24], RAX ; [RBP-24] holds the variable binop_98
  mov RAX, [RBP-24]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_112
  mov RAX, [RBP+16]
  jmp near done_112
if_false_112:
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, 2
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
  jle near _cmp_fail_147
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_147
_cmp_fail_147:
  mov RAX, 0x7fffffffffffffff
_cmp_done_147:
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_104
  mov RAX, [RBP-32]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_114
  mov RAX, [RBP+24]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-40], RAX ; [RBP-40] holds the variable unary_111
  mov RAX, [RBP+32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-40] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+16], [RBP-40])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-48], RAX ; [RBP-48] holds the variable app_109
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
  mov R10, QWORD [RBP-48] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+16], [RBP-48])
  add RSP, 32 ; Increment RSP after calling the closure
  jmp near done_114
if_false_114:
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, 0
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_131
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_131
_cmp_fail_131:
  mov RAX, 0x7fffffffffffffff
_cmp_done_131:
  mov [RBP-40], RAX ; [RBP-40] holds the variable binop_116
  mov RAX, [RBP-40]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_116
  mov RAX, 0
  jmp near done_116
if_false_116:
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
  mov [RBP-48], RAX ; [RBP-48] holds the variable app_124
  mov RAX, [RBP+32]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+32]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-48] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+16], [RBP-48])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-56], RAX ; [RBP-56] holds the variable app_122
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
done_116:
done_114:
done_112:
  leave
  ret
  ;; } define lambda-110
lambda_end_110:
  ;; Check if we have space on the heap to store our function of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_110
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_110:
  ;; Store lambda-110 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_110 ; Store the function pointer
  mov QWORD [R15+16], 4 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-48] ; Store add_53
  mov QWORD [R15+24], R11
  mov R11, [RBP-56] ; Store flip_84
  mov QWORD [R15+32], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 48 ; Bump the heap register
  ;; } store lambda-110
  mov [RBP-64], RAX ; Store letrec-ed function mul_94
  ;; Define lambda-101 {
  jmp near lambda_end_101
lambda_101:
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
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: flip_84
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: add_53
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
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+24])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-24], RAX ; [RBP-24] holds the variable app_140
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
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+16], [RBP-24])
  add RSP, 32 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-101
lambda_end_101:
  ;; Check if we have space on the heap to store our function of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_101
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_101:
  ;; Store lambda-101 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_101 ; Store the function pointer
  mov QWORD [R15+16], 4 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-56] ; Store flip_84
  mov QWORD [R15+24], R11
  mov R11, [RBP-48] ; Store add_53
  mov QWORD [R15+32], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 48 ; Bump the heap register
  ;; } store lambda-101
  mov [RBP-72], RAX ; Store letrec-ed function sub_135
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
  mov R10, QWORD 6 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 10 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(6, 10)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-80], RAX ; [RBP-80] holds the variable app_155
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
  mov R10, QWORD [RBP-80] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-80])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-88], RAX ; [RBP-88] holds the variable app_154
  mov RAX, [RBP-88]
  mov [RBP-96], RAX ; [RBP-96] holds the variable a_152
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
  mov R10, QWORD -6 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD -10 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(-6, -10)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-104], RAX ; [RBP-104] holds the variable app_165
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
  mov R10, QWORD [RBP-104] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-104])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-112], RAX ; [RBP-112] holds the variable app_164
  mov RAX, [RBP-112]
  mov [RBP-120], RAX ; [RBP-120] holds the variable b_162
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
  mov R10, QWORD 10 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 6 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(10, 6)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-128], RAX ; [RBP-128] holds the variable app_175
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
  mov R10, QWORD [RBP-128] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-128])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-136], RAX ; [RBP-136] holds the variable app_174
  mov RAX, [RBP-136]
  mov [RBP-144], RAX ; [RBP-144] holds the variable c_172
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
  mov R10, QWORD 10 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(10, 0)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-152], RAX ; [RBP-152] holds the variable app_185
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
  mov R10, QWORD [RBP-152] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-152])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-160], RAX ; [RBP-160] holds the variable app_184
  mov RAX, [RBP-160]
  mov [RBP-168], RAX ; [RBP-168] holds the variable d_182
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
  mov R10, QWORD 10 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD -6 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(10, -6)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-176], RAX ; [RBP-176] holds the variable app_195
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
  mov R10, QWORD [RBP-176] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-176])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-184], RAX ; [RBP-184] holds the variable app_194
  mov RAX, [RBP-184]
  mov [RBP-192], RAX ; [RBP-192] holds the variable e_192
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
  mov R10, QWORD -10 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 6 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(-10, 6)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-200], RAX ; [RBP-200] holds the variable app_205
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
  mov R10, QWORD [RBP-200] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-200])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-208], RAX ; [RBP-208] holds the variable app_204
  mov RAX, [RBP-208]
  mov [RBP-216], RAX ; [RBP-216] holds the variable f_202
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
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 16 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 6 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-72] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(16, 6)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-224], RAX ; [RBP-224] holds the variable app_215
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
  mov R10, QWORD [RBP-224] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-224])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-232], RAX ; [RBP-232] holds the variable app_214
  mov RAX, [RBP-232]
  mov [RBP-240], RAX ; [RBP-240] holds the variable g_212
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
  cmp QWORD [RAX+0], 4
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 32 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD 16 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 22 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-72] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(16, 22)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-248], RAX ; [RBP-248] holds the variable app_225
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
  mov R10, QWORD [RBP-248] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-248])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-256], RAX ; [RBP-256] holds the variable app_224
  mov RAX, [RBP-256]
  mov [RBP-264], RAX ; [RBP-264] holds the variable h_222
  mov RAX, [RBP-96]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-120]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
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