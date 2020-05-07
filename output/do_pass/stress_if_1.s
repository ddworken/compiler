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
  enter 208, 0
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
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-164 {
  jmp near lambda_end_164
lambda_164:
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
  ;; } define lambda-164
lambda_end_164:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_164
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_164:
  ;; Store lambda-164 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_164 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-164
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-161 {
  jmp near lambda_end_161
lambda_161:
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
  ;; } define lambda-161
lambda_end_161:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_161
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_161:
  ;; Store lambda-161 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_161 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-161
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-156 {
  jmp near lambda_end_156
lambda_156:
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
  ;; } define lambda-156
lambda_end_156:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_156
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_156:
  ;; Store lambda-156 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_156 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-156
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-152 {
  jmp near lambda_end_152
lambda_152:
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
  ;; } define lambda-152
lambda_end_152:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_152
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_152:
  ;; Store lambda-152 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_152 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-152
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-147 {
  jmp near lambda_end_147
lambda_147:
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
  ;; } define lambda-147
lambda_end_147:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_147
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_147:
  ;; Store lambda-147 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_147 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-147
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  mov RAX, 0
  mov R11, RAX
  mov RAX, 0
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_144
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_144
_cmp_fail_144:
  mov RAX, 0x7fffffffffffffff
_cmp_done_144:
  mov [RBP-48], RAX ; [RBP-48] holds the variable binop_52
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7
  mov RAX, 2
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
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_140
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_140
_cmp_fail_140:
  mov RAX, 0x7fffffffffffffff
_cmp_done_140:
  mov [RBP-56], RAX ; [RBP-56] holds the variable binop_56
  mov RAX, [RBP-56]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_10
  mov RAX, 4
  mov R11, RAX
  mov RAX, 4
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_136
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_136
_cmp_fail_136:
  mov RAX, 0x7fffffffffffffff
_cmp_done_136:
  mov [RBP-64], RAX ; [RBP-64] holds the variable binop_60
  mov RAX, [RBP-64]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_13
  mov RAX, 6
  mov R11, RAX
  mov RAX, 6
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
  jg near _cmp_fail_132
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_132
_cmp_fail_132:
  mov RAX, 0x7fffffffffffffff
_cmp_done_132:
  mov [RBP-72], RAX ; [RBP-72] holds the variable binop_64
  mov RAX, [RBP-72]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_16
  mov RAX, 8
  mov R11, RAX
  mov RAX, 8
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_128
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_128
_cmp_fail_128:
  mov RAX, 0x7fffffffffffffff
_cmp_done_128:
  mov [RBP-80], RAX ; [RBP-80] holds the variable binop_68
  mov RAX, [RBP-80]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_19
  mov RAX, 10
  mov R11, RAX
  mov RAX, 10
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
  jl near _cmp_fail_124
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_124
_cmp_fail_124:
  mov RAX, 0x7fffffffffffffff
_cmp_done_124:
  mov [RBP-88], RAX ; [RBP-88] holds the variable binop_72
  mov RAX, [RBP-88]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_22
  mov RAX, 12
  mov R11, RAX
  mov RAX, 12
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
  jg near _cmp_fail_120
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_120
_cmp_fail_120:
  mov RAX, 0x7fffffffffffffff
_cmp_done_120:
  mov [RBP-96], RAX ; [RBP-96] holds the variable binop_76
  mov RAX, [RBP-96]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_25
  mov RAX, 14
  mov R11, RAX
  mov RAX, 14
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
  jg near _cmp_fail_116
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_116
_cmp_fail_116:
  mov RAX, 0x7fffffffffffffff
_cmp_done_116:
  mov [RBP-104], RAX ; [RBP-104] holds the variable binop_80
  mov RAX, [RBP-104]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_28
  mov RAX, 16
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
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_112
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_112
_cmp_fail_112:
  mov RAX, 0x7fffffffffffffff
_cmp_done_112:
  mov [RBP-112], RAX ; [RBP-112] holds the variable binop_84
  mov RAX, [RBP-112]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_31
  mov RAX, 18
  mov R11, RAX
  mov RAX, 18
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_108
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_108
_cmp_fail_108:
  mov RAX, 0x7fffffffffffffff
_cmp_done_108:
  mov [RBP-120], RAX ; [RBP-120] holds the variable binop_88
  mov RAX, [RBP-120]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_34
  mov RAX, 20
  mov R11, RAX
  mov RAX, 20
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
  jg near _cmp_fail_104
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_104
_cmp_fail_104:
  mov RAX, 0x7fffffffffffffff
_cmp_done_104:
  mov [RBP-128], RAX ; [RBP-128] holds the variable binop_92
  mov RAX, [RBP-128]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_37
  mov RAX, 22
  mov R11, RAX
  mov RAX, 22
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
  jg near _cmp_fail_100
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_100
_cmp_fail_100:
  mov RAX, 0x7fffffffffffffff
_cmp_done_100:
  mov [RBP-136], RAX ; [RBP-136] holds the variable binop_96
  mov RAX, [RBP-136]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_40
  mov RAX, 24
  mov R11, RAX
  mov RAX, 24
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_96
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_96
_cmp_fail_96:
  mov RAX, 0x7fffffffffffffff
_cmp_done_96:
  mov [RBP-144], RAX ; [RBP-144] holds the variable binop_100
  mov RAX, [RBP-144]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_43
  mov RAX, 26
  mov R11, RAX
  mov RAX, 26
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
  jl near _cmp_fail_92
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_92
_cmp_fail_92:
  mov RAX, 0x7fffffffffffffff
_cmp_done_92:
  mov [RBP-152], RAX ; [RBP-152] holds the variable binop_104
  mov RAX, [RBP-152]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_46
  mov RAX, 28
  mov R11, RAX
  mov RAX, 28
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_88
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_88
_cmp_fail_88:
  mov RAX, 0x7fffffffffffffff
_cmp_done_88:
  mov [RBP-160], RAX ; [RBP-160] holds the variable binop_108
  mov RAX, [RBP-160]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_49
  mov RAX, 30
  mov R11, RAX
  mov RAX, 30
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
  jl near _cmp_fail_84
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_84
_cmp_fail_84:
  mov RAX, 0x7fffffffffffffff
_cmp_done_84:
  mov [RBP-168], RAX ; [RBP-168] holds the variable binop_112
  mov RAX, [RBP-168]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_52
  mov RAX, 32
  mov R11, RAX
  mov RAX, 32
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
  jl near _cmp_fail_80
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_80
_cmp_fail_80:
  mov RAX, 0x7fffffffffffffff
_cmp_done_80:
  mov [RBP-176], RAX ; [RBP-176] holds the variable binop_116
  mov RAX, [RBP-176]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_55
  mov RAX, 34
  mov R11, RAX
  mov RAX, 34
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_76
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_76
_cmp_fail_76:
  mov RAX, 0x7fffffffffffffff
_cmp_done_76:
  mov [RBP-184], RAX ; [RBP-184] holds the variable binop_120
  mov RAX, [RBP-184]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_58
  mov RAX, 36
  mov R11, RAX
  mov RAX, 36
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
  jg near _cmp_fail_72
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_72
_cmp_fail_72:
  mov RAX, 0x7fffffffffffffff
_cmp_done_72:
  mov [RBP-192], RAX ; [RBP-192] holds the variable binop_124
  mov RAX, [RBP-192]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_61
  mov RAX, 38
  mov R11, RAX
  mov RAX, 38
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
  jg near _cmp_fail_68
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_68
_cmp_fail_68:
  mov RAX, 0x7fffffffffffffff
_cmp_done_68:
  mov [RBP-200], RAX ; [RBP-200] holds the variable binop_128
  mov RAX, [RBP-200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_64
  mov RAX, 246
  jmp near done_64
if_false_64:
  mov RAX, 38
done_64:
  jmp near done_61
if_false_61:
  mov RAX, 36
done_61:
  jmp near done_58
if_false_58:
  mov RAX, 34
done_58:
  jmp near done_55
if_false_55:
  mov RAX, 32
done_55:
  jmp near done_52
if_false_52:
  mov RAX, 30
done_52:
  jmp near done_49
if_false_49:
  mov RAX, 28
done_49:
  jmp near done_46
if_false_46:
  mov RAX, 26
done_46:
  jmp near done_43
if_false_43:
  mov RAX, 24
done_43:
  jmp near done_40
if_false_40:
  mov RAX, 22
done_40:
  jmp near done_37
if_false_37:
  mov RAX, 20
done_37:
  jmp near done_34
if_false_34:
  mov RAX, 18
done_34:
  jmp near done_31
if_false_31:
  mov RAX, 16
done_31:
  jmp near done_28
if_false_28:
  mov RAX, 14
done_28:
  jmp near done_25
if_false_25:
  mov RAX, 12
done_25:
  jmp near done_22
if_false_22:
  mov RAX, 10
done_22:
  jmp near done_19
if_false_19:
  mov RAX, 8
done_19:
  jmp near done_16
if_false_16:
  mov RAX, 6
done_16:
  jmp near done_13
if_false_13:
  mov RAX, 4
done_13:
  jmp near done_10
if_false_10:
  mov RAX, 2
done_10:
  jmp near done_7
if_false_7:
  mov RAX, 0
done_7:
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