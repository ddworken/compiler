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
  enter 144, 0
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
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-130 {
  jmp near lambda_end_130
lambda_130:
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
  ;; } define lambda-130
lambda_end_130:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_130
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_130:
  ;; Store lambda-130 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_130 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-130
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
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
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  call native#input
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
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_127 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-127
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-122 {
  jmp near lambda_end_122
lambda_122:
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
  ;; } define lambda-122
lambda_end_122:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_122
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_122:
  ;; Store lambda-122 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_122 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-122
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-118 {
  jmp near lambda_end_118
lambda_118:
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
  ;; } define lambda-118
lambda_end_118:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_118
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_118:
  ;; Store lambda-118 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_118 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-118
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-113 {
  jmp near lambda_end_113
lambda_113:
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
  ;; } define lambda-113
lambda_end_113:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_113
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_113:
  ;; Store lambda-113 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_113 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-113
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; Define lambda-68 {
  jmp near lambda_end_68
lambda_68:
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
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+16]
  mov R11, RAX
  mov RAX, 0
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_110
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_110
_cmp_fail_110:
  mov RAX, 0x7fffffffffffffff
_cmp_done_110:
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
  jne near if_false_70
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_70
if_false_70:
  ;; and_lhs {
  mov RAX, [RBP+16]
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
  jle near _cmp_fail_103
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_103
_cmp_fail_103:
  mov RAX, 0x7fffffffffffffff
_cmp_done_103:
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
  je near and_done_99
  ;; and_rhs {
  mov RAX, [RBP+24]
  mov R11, RAX
  mov RAX, 0
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_100
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_100
_cmp_fail_100:
  mov RAX, 0x7fffffffffffffff
_cmp_done_100:
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
  je near and_done_99
  mov RAX, 0xffffffffffffffff
and_done_99:
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_and_or_65
  mov RAX, [RBP-16]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_72
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
  mov [RBP-24], RAX ; [RBP-24] holds the variable binop_74
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
  mov R10, QWORD 2 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-24], 2)
  add RSP, 32 ; Increment RSP after calling the closure
  jmp near done_72
if_false_72:
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
  mov [RBP-24], RAX ; [RBP-24] holds the variable binop_80
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
  mov [RBP-32], RAX ; [RBP-32] holds the variable binop_85
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
  mov R10, QWORD [RBP-32] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP+16], [RBP-32])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-40], RAX ; [RBP-40] holds the variable app_83
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
  mov R10, QWORD [RBP-40] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP+32] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-24], [RBP-40])
  add RSP, 32 ; Increment RSP after calling the closure
done_72:
done_70:
  leave
  ret
  ;; } define lambda-68
lambda_end_68:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_68
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_68:
  ;; Store lambda-68 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_68 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-68
  mov [RBP-48], RAX ; Store letrec-ed function ackerman_53
  ;; Define lambda-66 {
  jmp near lambda_end_66
lambda_66:
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
  mov RAX, [RBP+24]
  leave
  ret
  ;; } define lambda-66
lambda_end_66:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_66
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_66:
  ;; Store lambda-66 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_66 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-66
  mov [RBP-56], RAX ; Store letrec-ed function seqH_96
  ;; Define lambda-55 {
  jmp near lambda_end_55
lambda_55:
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
  mov [RBP-8], R11 ; Holds the closed over variable: print_4
  mov R11, [RAX+32]
  mov [RBP-16], R11 ; Holds the closed over variable: seqH_96
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
  mov R10, QWORD [RBP+16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP+16])
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-24], RAX ; [RBP-24] holds the variable app_110
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
  mov R10, QWORD [RBP-24] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP+24] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-16] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-24], [RBP+24])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-32], RAX ; [RBP-32] holds the variable app_109
  mov RAX, [RBP-32]
  leave
  ret
  ;; } define lambda-55
lambda_end_55:
  ;; Check if we have space on the heap to store our function of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_55
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_55:
  ;; Store lambda-55 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_55 ; Store the function pointer
  mov QWORD [R15+16], 4 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-8] ; Store print_4
  mov QWORD [R15+24], R11
  mov R11, [RBP-56] ; Store seqH_96
  mov QWORD [R15+32], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 48 ; Bump the heap register
  ;; } store lambda-55
  mov [RBP-64], RAX ; Store letrec-ed function seq_106
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
  mov R10, QWORD 0 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(0, 0)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-72], RAX ; [RBP-72] holds the variable app_128
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
  mov R10, QWORD 2 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 2 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(2, 2)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-80], RAX ; [RBP-80] holds the variable app_132
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
  mov R10, QWORD [RBP-72] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-80] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-72], [RBP-80])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-88], RAX ; [RBP-88] holds the variable app_127
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
  mov R10, QWORD 4 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 4 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(4, 4)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-96], RAX ; [RBP-96] holds the variable app_139
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
  mov R10, QWORD [RBP-88] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-96] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-88], [RBP-96])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-104], RAX ; [RBP-104] holds the variable app_126
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
  mov R10, QWORD 6 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(6, 6)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-112], RAX ; [RBP-112] holds the variable app_146
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
  mov R10, QWORD [RBP-104] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-112] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-104], [RBP-112])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-120], RAX ; [RBP-120] holds the variable app_125
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
  mov R10, QWORD 8 ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD 0 ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func(8, 0)
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-128], RAX ; [RBP-128] holds the variable app_153
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
  mov R10, QWORD [RBP-120] ; arg_0
  mov QWORD [RSP+0], R10
  mov R10, QWORD [RBP-128] ; arg_1
  mov QWORD [RSP+8], R10
  mov QWORD [RSP+24], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-64] ; Pass the function itself as the final argument
  mov QWORD [RSP+16], R11
  call RAX ; func([RBP-120], [RBP-128])
  add RSP, 32 ; Increment RSP after calling the closure
  mov [RBP-136], RAX ; [RBP-136] holds the variable app_124
  mov RAX, [RBP-136]
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