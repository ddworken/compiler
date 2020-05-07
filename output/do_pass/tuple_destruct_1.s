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
  enter 176, 0
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
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-86 {
  jmp near lambda_end_86
lambda_86:
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
  ;; } define lambda-86
lambda_end_86:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_86
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_86:
  ;; Store lambda-86 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_86 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-86
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-83 {
  jmp near lambda_end_83
lambda_83:
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
  ;; } define lambda-83
lambda_end_83:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_83
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_83:
  ;; Store lambda-83 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_83 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-83
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-78 {
  jmp near lambda_end_78
lambda_78:
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
  ;; } define lambda-78
lambda_end_78:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_78
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_78:
  ;; Store lambda-78 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_78 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-78
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-74 {
  jmp near lambda_end_74
lambda_74:
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
  ;; } define lambda-74
lambda_end_74:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_74
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_74:
  ;; Store lambda-74 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_74 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-74
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-69 {
  jmp near lambda_end_69
lambda_69:
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
  ;; } define lambda-69
lambda_end_69:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_69
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_69:
  ;; Store lambda-69 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_69 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-69
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; Check if we have space on the heap to store our tuple of size 32: 
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
  ;; Creating a tuple: 
  mov QWORD [R15+0], 4 ; tuple size
  mov QWORD RAX, QWORD 4
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD 6
  mov QWORD [R15+16], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 32
  mov [RBP-48], RAX ; [RBP-48] holds the variable tup_57
  ;; Check if we have space on the heap to store our tuple of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_63
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_63:
  ;; Creating a tuple: 
  mov QWORD [R15+0], 4 ; tuple size
  mov QWORD RAX, QWORD 10
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD 12
  mov QWORD [R15+16], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 32
  mov [RBP-56], RAX ; [RBP-56] holds the variable tup_62
  ;; Check if we have space on the heap to store our tuple of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_60
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_60:
  ;; Creating a tuple: 
  mov QWORD [R15+0], 4 ; tuple size
  mov QWORD RAX, QWORD 8
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD [RBP-56]
  mov QWORD [R15+16], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 32
  mov [RBP-64], RAX ; [RBP-64] holds the variable tup_60
  ;; Check if we have space on the heap to store our tuple of size 32: 
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
  ;; Creating a tuple: 
  mov QWORD [R15+0], 6 ; tuple size
  mov QWORD RAX, QWORD 2
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD [RBP-48]
  mov QWORD [R15+16], QWORD RAX
  mov QWORD RAX, QWORD [RBP-64]
  mov QWORD [R15+24], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 32
  mov [RBP-72], RAX ; [RBP-72] holds the variable tup_53
  mov RAX, [RBP-72]
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
  ;; Get the 0-th item from the tuple: 
  mov RAX, [RAX+8]
  mov [RBP-80], RAX ; [RBP-80] holds the variable a_67
  mov RAX, [RBP-72]
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
  mov [RBP-88], RAX ; [RBP-88] holds the variable tup_1_72
  mov RAX, [RBP-88]
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
  ;; Get the 0-th item from the tuple: 
  mov RAX, [RAX+8]
  mov [RBP-96], RAX ; [RBP-96] holds the variable b_79
  mov RAX, [RBP-88]
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
  mov [RBP-104], RAX ; [RBP-104] holds the variable c_84
  mov RAX, [RBP-72]
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
  ;; Get the 2-th item from the tuple: 
  mov RAX, [RAX+24]
  mov [RBP-112], RAX ; [RBP-112] holds the variable tup_2_89
  mov RAX, [RBP-112]
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
  ;; Get the 0-th item from the tuple: 
  mov RAX, [RAX+8]
  mov [RBP-120], RAX ; [RBP-120] holds the variable d_98
  mov RAX, [RBP-112]
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
  mov [RBP-128], RAX ; [RBP-128] holds the variable tup_2_1_103
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
  ;; Check if the idx 0 is too large:
  cmp QWORD [RAX+0], 0
  mov R10, 0
  cmovle RSI, R10
  jle near _global_assertion_failed_index_too_large
  ;; Get the 0-th item from the tuple: 
  mov RAX, [RAX+8]
  mov [RBP-136], RAX ; [RBP-136] holds the variable e_110
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
  mov [RBP-144], RAX ; [RBP-144] holds the variable f_115
  mov RAX, [RBP-80]
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
  mov [RBP-152], RAX ; [RBP-152] holds the variable binop_123
  mov RAX, [RBP-152]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-104]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-160], RAX ; [RBP-160] holds the variable binop_122
  mov RAX, [RBP-160]
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
  mov [RBP-168], RAX ; [RBP-168] holds the variable binop_121
  mov RAX, [RBP-168]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-136]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-176], RAX ; [RBP-176] holds the variable binop_120
  mov RAX, [RBP-176]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-144]
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