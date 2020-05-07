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
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-93 {
  jmp near lambda_end_93
lambda_93:
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
  ;; } define lambda-93
lambda_end_93:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_93
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_93:
  ;; Store lambda-93 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_93 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-93
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-90 {
  jmp near lambda_end_90
lambda_90:
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
  ;; } define lambda-90
lambda_end_90:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_90
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_90:
  ;; Store lambda-90 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_90 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-90
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-85 {
  jmp near lambda_end_85
lambda_85:
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
  ;; } define lambda-85
lambda_end_85:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_85
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_85:
  ;; Store lambda-85 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_85 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-85
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-81 {
  jmp near lambda_end_81
lambda_81:
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
  ;; } define lambda-81
lambda_end_81:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_81
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_81:
  ;; Store lambda-81 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_81 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-81
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-76 {
  jmp near lambda_end_76
lambda_76:
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
  ;; } define lambda-76
lambda_end_76:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_76
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_76:
  ;; Store lambda-76 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_76 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-76
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
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
  jne near _cmp_fail_73
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_73
_cmp_fail_73:
  mov RAX, 0x7fffffffffffffff
_cmp_done_73:
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
  jne near if_false_58
  mov RAX, 246
  jmp near done_58
if_false_58:
  ;; Check if we have space on the heap to store our tuple of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_67
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_67:
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
done_58:
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
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_56 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-56
  mov [RBP-48], RAX ; Store letrec-ed function pollute_53
  ;; Check if we have space on the heap to store our tuple of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_52
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_52:
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
  mov [RBP-56], RAX ; [RBP-56] holds the variable app_93
  ;; Check if we have space on the heap to store our tuple of size 48: 
  mov RAX, [HEAP_END] ; Reserving 6 words
  sub RAX, 48
  cmp RAX, R15
  jge near memcheck_ok_43
  mov RDI, QWORD R15
  mov RSI, QWORD 48
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_43:
  ;; Creating a tuple: 
  mov QWORD [R15+0], 10 ; tuple size
  mov QWORD RAX, QWORD 2
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD 4
  mov QWORD [R15+16], QWORD RAX
  mov QWORD RAX, QWORD 6
  mov QWORD [R15+24], QWORD RAX
  mov QWORD RAX, QWORD 8
  mov QWORD [R15+32], QWORD RAX
  mov QWORD RAX, QWORD [RBP-56]
  mov QWORD [R15+40], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 48
  mov [RBP-64], RAX ; [RBP-64] holds the variable x_86
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
  mov [RBP-72], RAX ; [RBP-72] holds the variable app_101
  mov RAX, [RBP-64]
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
  ;; Check if the idx 0 is too large:
  cmp QWORD [RAX+0], 0
  mov R10, 0
  cmovle RSI, R10
  jle near _global_assertion_failed_index_too_large
  ;; Set the 0-th item from the tuple: 
  mov R11, [RBP-72]
  mov [RAX+8], R11
  mov RAX, [RBP-64]
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
  mov [RBP-80], RAX ; [RBP-80] holds the variable app_110
  mov RAX, [RBP-64]
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
  mov R11, [RBP-80]
  mov [RAX+16], R11
  mov RAX, [RBP-64]
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
  mov [RBP-88], RAX ; [RBP-88] holds the variable app_119
  mov RAX, [RBP-64]
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
  ;; Check if the idx 2 is too large:
  cmp QWORD [RAX+0], 4
  mov R10, 2
  cmovle RSI, R10
  jle near _global_assertion_failed_index_too_large
  ;; Set the 2-th item from the tuple: 
  mov R11, [RBP-88]
  mov [RAX+24], R11
  mov RAX, [RBP-64]
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
  mov [RBP-96], RAX ; [RBP-96] holds the variable app_128
  mov RAX, [RBP-64]
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
  ;; Check if the idx 3 is too large:
  cmp QWORD [RAX+0], 6
  mov R10, 3
  cmovle RSI, R10
  jle near _global_assertion_failed_index_too_large
  ;; Set the 3-th item from the tuple: 
  mov R11, [RBP-96]
  mov [RAX+32], R11
  mov RAX, [RBP-64]
  mov RAX, [RBP-64]
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