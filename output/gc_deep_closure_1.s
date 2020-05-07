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
  ;; Define lambda-99 {
  jmp near lambda_end_99
lambda_99:
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
  ;; } define lambda-99
lambda_end_99:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_99
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_99:
  ;; Store lambda-99 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_99 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-99
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-96 {
  jmp near lambda_end_96
lambda_96:
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
  ;; } define lambda-96
lambda_end_96:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_96
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_96:
  ;; Store lambda-96 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_96 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-96
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-91 {
  jmp near lambda_end_91
lambda_91:
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
  ;; } define lambda-91
lambda_end_91:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_91
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_91:
  ;; Store lambda-91 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_91 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-91
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-87 {
  jmp near lambda_end_87
lambda_87:
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
  ;; } define lambda-87
lambda_end_87:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_87
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_87:
  ;; Store lambda-87 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_87 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-87
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-82 {
  jmp near lambda_end_82
lambda_82:
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
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_82 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-82
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; Define lambda-62 {
  jmp near lambda_end_62
lambda_62:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+24] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP+16]
  mov R11, RAX
  mov RAX, 0
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
  jne near if_false_64
  mov RAX, 0
  jmp near done_64
if_false_64:
  ;; Check if we have space on the heap to store our tuple of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_73
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_73:
  ;; Creating a tuple: 
  mov QWORD [R15+0], 6 ; tuple size
  mov QWORD RAX, QWORD 2
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD 4
  mov QWORD [R15+16], QWORD RAX
  mov QWORD RAX, QWORD 6
  mov QWORD [R15+24], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 32
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
  mov [RBP-16], RAX ; [RBP-16] holds the variable binop_70
  mov RAX, [RBP+24]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP+24]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 2
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov R10, QWORD [RBP-16] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP+24] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-16])
  add RSP, 16 ; Increment RSP after calling the closure
done_64:
  leave
  ret
  ;; } define lambda-62
lambda_end_62:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_62
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_62:
  ;; Store lambda-62 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_62 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-62
  mov [RBP-48], RAX ; Store letrec-ed function pollute_53
  ;; Check if we have space on the heap to store our tuple of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_58
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_58:
  ;; Creating a tuple: 
  mov QWORD [R15+0], 6 ; tuple size
  mov QWORD RAX, QWORD 2
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD 4
  mov QWORD [R15+16], QWORD RAX
  mov QWORD RAX, QWORD 6
  mov QWORD [R15+24], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 32
  mov [RBP-56], RAX ; [RBP-56] holds the variable a_78
  ;; Define lambda-56 {
  jmp near lambda_end_56
lambda_56:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: a_78
  ;; } Copy the free variables off the heap onto the stack
  mov RAX, [RBP-8]
  leave
  ret
  ;; } define lambda-56
lambda_end_56:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_56
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_56:
  ;; Store lambda-56 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_56 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-56] ; Store a_78
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-56
  mov [RBP-64], RAX ; [RBP-64] holds the variable f1_85
  ;; Define lambda-53 {
  jmp near lambda_end_53
lambda_53:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f1_85
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
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-53
lambda_end_53:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_53
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_53:
  ;; Store lambda-53 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_53 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-64] ; Store f1_85
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-53
  mov [RBP-72], RAX ; [RBP-72] holds the variable f2_90
  ;; Define lambda-50 {
  jmp near lambda_end_50
lambda_50:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f2_90
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
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-50
lambda_end_50:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_50
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_50:
  ;; Store lambda-50 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_50 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-72] ; Store f2_90
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-50
  mov [RBP-80], RAX ; [RBP-80] holds the variable f3_96
  ;; Define lambda-47 {
  jmp near lambda_end_47
lambda_47:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f3_96
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
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-47
lambda_end_47:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_47
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_47:
  ;; Store lambda-47 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_47 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-80] ; Store f3_96
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-47
  mov [RBP-88], RAX ; [RBP-88] holds the variable f4_102
  ;; Define lambda-44 {
  jmp near lambda_end_44
lambda_44:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f4_102
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
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-44
lambda_end_44:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_44
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_44:
  ;; Store lambda-44 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_44 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-88] ; Store f4_102
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-44
  mov [RBP-96], RAX ; [RBP-96] holds the variable f5_108
  ;; Define lambda-41 {
  jmp near lambda_end_41
lambda_41:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f5_108
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
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-41
lambda_end_41:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_41
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_41:
  ;; Store lambda-41 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_41 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-96] ; Store f5_108
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-41
  mov [RBP-104], RAX ; [RBP-104] holds the variable f6_114
  ;; Define lambda-38 {
  jmp near lambda_end_38
lambda_38:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 16
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 16, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  mov R11, [RAX+24]
  mov [RBP-8], R11 ; Holds the closed over variable: f6_114
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
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  leave
  ret
  ;; } define lambda-38
lambda_end_38:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_38
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_38:
  ;; Store lambda-38 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_38 ; Store the function pointer
  mov QWORD [R15+16], 2 ; Store the number of closed variables
  ;; Store all the closed over variables {
  mov R11, [RBP-104] ; Store f6_114
  mov QWORD [R15+24], R11
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-38
  mov [RBP-112], RAX ; [RBP-112] holds the variable f7_120
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 1 (aka: 'tuple')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_tuple
  sub RAX, 0x1 ; detag
  ;; Check if the tuple is nil
  cmp RAX, 0x0
  je near _global_assertion_failed_index_nil
  ;; Check if the idx 1 is too large:
  cmp QWORD [RAX+0], 2
  mov R10, 1
  cmovle RSI, R10
  jle near _global_assertion_failed_index_too_large
  ;; Set the 1-th item from the tuple: 
  mov R11, [RBP-112]
  mov [RAX+16], R11
  mov RAX, [RBP-56]
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
  mov R10, QWORD 200 ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-48] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func(200)
  add RSP, 16 ; Increment RSP after calling the closure
  mov RAX, [RBP-112]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-112]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-112] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-120], RAX ; [RBP-120] holds the variable app_144
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
  mov R10, QWORD [RBP-120] ; arg_0
  mov QWORD [RSP+0], R10
  mov R11, [RBP-8] ; Pass the function itself as the final argument
  mov QWORD [RSP+8], R11
  call RAX ; func([RBP-120])
  add RSP, 16 ; Increment RSP after calling the closure
  mov RAX, [RBP-112]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-112]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-112] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
  mov [RBP-128], RAX ; [RBP-128] holds the variable t_149
  mov RAX, [RBP-128]
  ;; Assert that RAX has the tag 1 (aka: 'tuple')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_tuple
  sub RAX, 0x1 ; detag
  ;; Check if the tuple is nil
  cmp RAX, 0x0
  je near _global_assertion_failed_index_nil
  ;; Check if the idx 1 is too large:
  cmp QWORD [RAX+0], 2
  mov R10, 1
  cmovle RSI, R10
  jle near _global_assertion_failed_index_too_large
  ;; Get the 1-th item from the tuple: 
  mov RAX, [RAX+16]
  mov [RBP-136], RAX ; [RBP-136] holds the variable get_154
  mov RAX, [RBP-136]
  ;; Assert that RAX has the tag 5 (aka: 'closure')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x5
  cmovne RSI, RAX
  jne near _global_assertion_failed_not_a_closure
  mov RAX, [RBP-136]
  sub RAX, 0x5
  cmp QWORD [RAX+0], 0
  mov R10, QWORD [RAX+0]
  cmovne RSI, R10
  jne near _global_assertion_failed_arity_error
  mov RAX, [RAX+8]
  sub RSP, 16 ; Decrement RSP to prepare to call the closure
  mov QWORD [RSP+8], 0x0 ; Fill in the padded argument with a zero so all stack memory is padded with zeros
  mov R11, [RBP-136] ; Pass the function itself as the final argument
  mov QWORD [RSP+0], R11
  call RAX ; func()
  add RSP, 16 ; Increment RSP after calling the closure
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