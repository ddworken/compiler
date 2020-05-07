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
  enter 48, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
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
  call native#print
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
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-71 {
  jmp near lambda_end_71
lambda_71:
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
  ;; } define lambda-71
lambda_end_71:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_71
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_71:
  ;; Store lambda-71 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_71 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-71
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
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
  mov RDI, [RBP+16]
  mov RSI, [RBP+24]
  call native#equal
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
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-62 {
  jmp near lambda_end_62
lambda_62:
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
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-57 {
  jmp near lambda_end_57
lambda_57:
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
  ;; } define lambda-57
lambda_end_57:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_57
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_57:
  ;; Store lambda-57 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_57 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-57
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; Check if we have space on the heap to store our tuple of size 416: 
  mov RAX, [HEAP_END] ; Reserving 52 words
  sub RAX, 416
  cmp RAX, R15
  jge near memcheck_ok_6
  mov RDI, QWORD R15
  mov RSI, QWORD 416
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_6:
  ;; Creating a tuple: 
  mov QWORD [R15+0], 100 ; tuple size
  mov QWORD RAX, QWORD 0
  mov QWORD [R15+8], QWORD RAX
  mov QWORD RAX, QWORD 2
  mov QWORD [R15+16], QWORD RAX
  mov QWORD RAX, QWORD 4
  mov QWORD [R15+24], QWORD RAX
  mov QWORD RAX, QWORD 6
  mov QWORD [R15+32], QWORD RAX
  mov QWORD RAX, QWORD 8
  mov QWORD [R15+40], QWORD RAX
  mov QWORD RAX, QWORD 10
  mov QWORD [R15+48], QWORD RAX
  mov QWORD RAX, QWORD 12
  mov QWORD [R15+56], QWORD RAX
  mov QWORD RAX, QWORD 14
  mov QWORD [R15+64], QWORD RAX
  mov QWORD RAX, QWORD 16
  mov QWORD [R15+72], QWORD RAX
  mov QWORD RAX, QWORD 18
  mov QWORD [R15+80], QWORD RAX
  mov QWORD RAX, QWORD 20
  mov QWORD [R15+88], QWORD RAX
  mov QWORD RAX, QWORD 22
  mov QWORD [R15+96], QWORD RAX
  mov QWORD RAX, QWORD 24
  mov QWORD [R15+104], QWORD RAX
  mov QWORD RAX, QWORD 26
  mov QWORD [R15+112], QWORD RAX
  mov QWORD RAX, QWORD 28
  mov QWORD [R15+120], QWORD RAX
  mov QWORD RAX, QWORD 30
  mov QWORD [R15+128], QWORD RAX
  mov QWORD RAX, QWORD 32
  mov QWORD [R15+136], QWORD RAX
  mov QWORD RAX, QWORD 34
  mov QWORD [R15+144], QWORD RAX
  mov QWORD RAX, QWORD 36
  mov QWORD [R15+152], QWORD RAX
  mov QWORD RAX, QWORD 38
  mov QWORD [R15+160], QWORD RAX
  mov QWORD RAX, QWORD 40
  mov QWORD [R15+168], QWORD RAX
  mov QWORD RAX, QWORD 42
  mov QWORD [R15+176], QWORD RAX
  mov QWORD RAX, QWORD 44
  mov QWORD [R15+184], QWORD RAX
  mov QWORD RAX, QWORD 46
  mov QWORD [R15+192], QWORD RAX
  mov QWORD RAX, QWORD 48
  mov QWORD [R15+200], QWORD RAX
  mov QWORD RAX, QWORD 50
  mov QWORD [R15+208], QWORD RAX
  mov QWORD RAX, QWORD 52
  mov QWORD [R15+216], QWORD RAX
  mov QWORD RAX, QWORD 54
  mov QWORD [R15+224], QWORD RAX
  mov QWORD RAX, QWORD 56
  mov QWORD [R15+232], QWORD RAX
  mov QWORD RAX, QWORD 58
  mov QWORD [R15+240], QWORD RAX
  mov QWORD RAX, QWORD 60
  mov QWORD [R15+248], QWORD RAX
  mov QWORD RAX, QWORD 62
  mov QWORD [R15+256], QWORD RAX
  mov QWORD RAX, QWORD 64
  mov QWORD [R15+264], QWORD RAX
  mov QWORD RAX, QWORD 66
  mov QWORD [R15+272], QWORD RAX
  mov QWORD RAX, QWORD 68
  mov QWORD [R15+280], QWORD RAX
  mov QWORD RAX, QWORD 70
  mov QWORD [R15+288], QWORD RAX
  mov QWORD RAX, QWORD 72
  mov QWORD [R15+296], QWORD RAX
  mov QWORD RAX, QWORD 74
  mov QWORD [R15+304], QWORD RAX
  mov QWORD RAX, QWORD 76
  mov QWORD [R15+312], QWORD RAX
  mov QWORD RAX, QWORD 78
  mov QWORD [R15+320], QWORD RAX
  mov QWORD RAX, QWORD 80
  mov QWORD [R15+328], QWORD RAX
  mov QWORD RAX, QWORD 82
  mov QWORD [R15+336], QWORD RAX
  mov QWORD RAX, QWORD 84
  mov QWORD [R15+344], QWORD RAX
  mov QWORD RAX, QWORD 86
  mov QWORD [R15+352], QWORD RAX
  mov QWORD RAX, QWORD 88
  mov QWORD [R15+360], QWORD RAX
  mov QWORD RAX, QWORD 90
  mov QWORD [R15+368], QWORD RAX
  mov QWORD RAX, QWORD 92
  mov QWORD [R15+376], QWORD RAX
  mov QWORD RAX, QWORD 94
  mov QWORD [R15+384], QWORD RAX
  mov QWORD RAX, QWORD 96
  mov QWORD [R15+392], QWORD RAX
  mov QWORD RAX, QWORD 98
  mov QWORD [R15+400], QWORD RAX
  mov RAX, R15
  add RAX, 0x1
  add R15, 416
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