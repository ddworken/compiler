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
  enter 1632, 0
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
  mov QWORD [RBP-1336], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1344], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1352], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1360], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1368], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1376], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1384], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1392], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1400], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1408], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1416], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1424], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1432], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1440], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1448], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1456], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1464], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1472], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1480], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1488], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1496], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1504], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1512], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1520], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1528], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1536], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1544], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1552], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1560], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1568], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1576], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1584], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1592], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1600], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1608], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1616], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1624], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1632], QWORD 0 ; Zero out the stack
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-618 {
  jmp near lambda_end_618
lambda_618:
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
  ;; } define lambda-618
lambda_end_618:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_618
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_618:
  ;; Store lambda-618 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_618 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-618
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-615 {
  jmp near lambda_end_615
lambda_615:
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
  ;; } define lambda-615
lambda_end_615:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_615
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_615:
  ;; Store lambda-615 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_615 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-615
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-610 {
  jmp near lambda_end_610
lambda_610:
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
  ;; } define lambda-610
lambda_end_610:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_610
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_610:
  ;; Store lambda-610 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_610 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-610
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-606 {
  jmp near lambda_end_606
lambda_606:
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
  ;; } define lambda-606
lambda_end_606:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_606
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_606:
  ;; Store lambda-606 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_606 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-606
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-601 {
  jmp near lambda_end_601
lambda_601:
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
  ;; } define lambda-601
lambda_end_601:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_601
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_601:
  ;; Store lambda-601 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_601 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-601
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  mov RAX, 2
  mov [RBP-48], RAX ; [RBP-48] holds the variable ab_53
  mov RAX, 4
  mov [RBP-56], RAX ; [RBP-56] holds the variable ac_58
  mov RAX, 6
  mov [RBP-64], RAX ; [RBP-64] holds the variable ad_63
  mov RAX, 8
  mov [RBP-72], RAX ; [RBP-72] holds the variable ae_68
  mov RAX, 10
  mov [RBP-80], RAX ; [RBP-80] holds the variable af_73
  mov RAX, 12
  mov [RBP-88], RAX ; [RBP-88] holds the variable ag_78
  mov RAX, 14
  mov [RBP-96], RAX ; [RBP-96] holds the variable ah_83
  mov RAX, 16
  mov [RBP-104], RAX ; [RBP-104] holds the variable ai_88
  mov RAX, 18
  mov [RBP-112], RAX ; [RBP-112] holds the variable aj_93
  mov RAX, 20
  mov [RBP-120], RAX ; [RBP-120] holds the variable ak_98
  mov RAX, 22
  mov [RBP-128], RAX ; [RBP-128] holds the variable al_103
  mov RAX, 24
  mov [RBP-136], RAX ; [RBP-136] holds the variable am_108
  mov RAX, 26
  mov [RBP-144], RAX ; [RBP-144] holds the variable an_113
  mov RAX, 28
  mov [RBP-152], RAX ; [RBP-152] holds the variable ao_118
  mov RAX, 30
  mov [RBP-160], RAX ; [RBP-160] holds the variable ap_123
  mov RAX, 32
  mov [RBP-168], RAX ; [RBP-168] holds the variable aq_128
  mov RAX, 34
  mov [RBP-176], RAX ; [RBP-176] holds the variable ar_133
  mov RAX, 36
  mov [RBP-184], RAX ; [RBP-184] holds the variable as_138
  mov RAX, 38
  mov [RBP-192], RAX ; [RBP-192] holds the variable at_143
  mov RAX, 40
  mov [RBP-200], RAX ; [RBP-200] holds the variable au_148
  mov RAX, 42
  mov [RBP-208], RAX ; [RBP-208] holds the variable av_153
  mov RAX, 44
  mov [RBP-216], RAX ; [RBP-216] holds the variable aw_158
  mov RAX, 46
  mov [RBP-224], RAX ; [RBP-224] holds the variable ax_163
  mov RAX, 48
  mov [RBP-232], RAX ; [RBP-232] holds the variable ay_168
  mov RAX, 50
  mov [RBP-240], RAX ; [RBP-240] holds the variable az_173
  mov RAX, 52
  mov [RBP-248], RAX ; [RBP-248] holds the variable bc_178
  mov RAX, 54
  mov [RBP-256], RAX ; [RBP-256] holds the variable bd_183
  mov RAX, 56
  mov [RBP-264], RAX ; [RBP-264] holds the variable be_188
  mov RAX, 58
  mov [RBP-272], RAX ; [RBP-272] holds the variable bf_193
  mov RAX, 60
  mov [RBP-280], RAX ; [RBP-280] holds the variable bg_198
  mov RAX, 62
  mov [RBP-288], RAX ; [RBP-288] holds the variable bh_203
  mov RAX, 64
  mov [RBP-296], RAX ; [RBP-296] holds the variable bi_208
  mov RAX, 66
  mov [RBP-304], RAX ; [RBP-304] holds the variable bj_213
  mov RAX, 68
  mov [RBP-312], RAX ; [RBP-312] holds the variable bk_218
  mov RAX, 70
  mov [RBP-320], RAX ; [RBP-320] holds the variable bl_223
  mov RAX, 72
  mov [RBP-328], RAX ; [RBP-328] holds the variable bm_228
  mov RAX, 74
  mov [RBP-336], RAX ; [RBP-336] holds the variable bn_233
  mov RAX, 76
  mov [RBP-344], RAX ; [RBP-344] holds the variable bo_238
  mov RAX, 78
  mov [RBP-352], RAX ; [RBP-352] holds the variable bp_243
  mov RAX, 80
  mov [RBP-360], RAX ; [RBP-360] holds the variable bq_248
  mov RAX, 82
  mov [RBP-368], RAX ; [RBP-368] holds the variable br_253
  mov RAX, 84
  mov [RBP-376], RAX ; [RBP-376] holds the variable bs_258
  mov RAX, 86
  mov [RBP-384], RAX ; [RBP-384] holds the variable bt_263
  mov RAX, 88
  mov [RBP-392], RAX ; [RBP-392] holds the variable bu_268
  mov RAX, 90
  mov [RBP-400], RAX ; [RBP-400] holds the variable bv_273
  mov RAX, 92
  mov [RBP-408], RAX ; [RBP-408] holds the variable bw_278
  mov RAX, 94
  mov [RBP-416], RAX ; [RBP-416] holds the variable bx_283
  mov RAX, 96
  mov [RBP-424], RAX ; [RBP-424] holds the variable by_288
  mov RAX, 98
  mov [RBP-432], RAX ; [RBP-432] holds the variable bz_293
  mov RAX, 100
  mov [RBP-440], RAX ; [RBP-440] holds the variable cd_298
  mov RAX, 102
  mov [RBP-448], RAX ; [RBP-448] holds the variable ce_303
  mov RAX, 104
  mov [RBP-456], RAX ; [RBP-456] holds the variable cf_308
  mov RAX, 106
  mov [RBP-464], RAX ; [RBP-464] holds the variable cg_313
  mov RAX, 108
  mov [RBP-472], RAX ; [RBP-472] holds the variable ch_318
  mov RAX, 110
  mov [RBP-480], RAX ; [RBP-480] holds the variable ci_323
  mov RAX, 112
  mov [RBP-488], RAX ; [RBP-488] holds the variable cj_328
  mov RAX, 114
  mov [RBP-496], RAX ; [RBP-496] holds the variable ck_333
  mov RAX, 116
  mov [RBP-504], RAX ; [RBP-504] holds the variable cl_338
  mov RAX, 118
  mov [RBP-512], RAX ; [RBP-512] holds the variable cm_343
  mov RAX, 120
  mov [RBP-520], RAX ; [RBP-520] holds the variable cn_348
  mov RAX, 122
  mov [RBP-528], RAX ; [RBP-528] holds the variable co_353
  mov RAX, 124
  mov [RBP-536], RAX ; [RBP-536] holds the variable cp_358
  mov RAX, 126
  mov [RBP-544], RAX ; [RBP-544] holds the variable cq_363
  mov RAX, 128
  mov [RBP-552], RAX ; [RBP-552] holds the variable cr_368
  mov RAX, 130
  mov [RBP-560], RAX ; [RBP-560] holds the variable cs_373
  mov RAX, 132
  mov [RBP-568], RAX ; [RBP-568] holds the variable ct_378
  mov RAX, 134
  mov [RBP-576], RAX ; [RBP-576] holds the variable cu_383
  mov RAX, 136
  mov [RBP-584], RAX ; [RBP-584] holds the variable cv_388
  mov RAX, 138
  mov [RBP-592], RAX ; [RBP-592] holds the variable cw_393
  mov RAX, 140
  mov [RBP-600], RAX ; [RBP-600] holds the variable cx_398
  mov RAX, 142
  mov [RBP-608], RAX ; [RBP-608] holds the variable cy_403
  mov RAX, 144
  mov [RBP-616], RAX ; [RBP-616] holds the variable cz_408
  mov RAX, 146
  mov [RBP-624], RAX ; [RBP-624] holds the variable de_413
  mov RAX, 148
  mov [RBP-632], RAX ; [RBP-632] holds the variable df_418
  mov RAX, 150
  mov [RBP-640], RAX ; [RBP-640] holds the variable dg_423
  mov RAX, 152
  mov [RBP-648], RAX ; [RBP-648] holds the variable dh_428
  mov RAX, 154
  mov [RBP-656], RAX ; [RBP-656] holds the variable di_433
  mov RAX, 156
  mov [RBP-664], RAX ; [RBP-664] holds the variable dj_438
  mov RAX, 158
  mov [RBP-672], RAX ; [RBP-672] holds the variable dk_443
  mov RAX, 160
  mov [RBP-680], RAX ; [RBP-680] holds the variable dl_448
  mov RAX, 162
  mov [RBP-688], RAX ; [RBP-688] holds the variable dm_453
  mov RAX, 164
  mov [RBP-696], RAX ; [RBP-696] holds the variable dn_458
  mov RAX, 166
  mov [RBP-704], RAX ; [RBP-704] holds the variable do_463
  mov RAX, 168
  mov [RBP-712], RAX ; [RBP-712] holds the variable dp_468
  mov RAX, 170
  mov [RBP-720], RAX ; [RBP-720] holds the variable dq_473
  mov RAX, 172
  mov [RBP-728], RAX ; [RBP-728] holds the variable dr_478
  mov RAX, 174
  mov [RBP-736], RAX ; [RBP-736] holds the variable ds_483
  mov RAX, 176
  mov [RBP-744], RAX ; [RBP-744] holds the variable dt_488
  mov RAX, 178
  mov [RBP-752], RAX ; [RBP-752] holds the variable du_493
  mov RAX, 180
  mov [RBP-760], RAX ; [RBP-760] holds the variable dv_498
  mov RAX, 182
  mov [RBP-768], RAX ; [RBP-768] holds the variable dw_503
  mov RAX, 184
  mov [RBP-776], RAX ; [RBP-776] holds the variable dx_508
  mov RAX, 186
  mov [RBP-784], RAX ; [RBP-784] holds the variable dy_513
  mov RAX, 188
  mov [RBP-792], RAX ; [RBP-792] holds the variable dz_518
  mov RAX, 190
  mov [RBP-800], RAX ; [RBP-800] holds the variable ef_523
  mov RAX, 192
  mov [RBP-808], RAX ; [RBP-808] holds the variable eg_528
  mov RAX, 194
  mov [RBP-816], RAX ; [RBP-816] holds the variable eh_533
  mov RAX, 196
  mov [RBP-824], RAX ; [RBP-824] holds the variable ei_538
  mov RAX, 198
  mov [RBP-832], RAX ; [RBP-832] holds the variable ej_543
  mov RAX, 200
  mov [RBP-840], RAX ; [RBP-840] holds the variable ek_548
  mov RAX, [RBP-48]
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
  mov [RBP-848], RAX ; [RBP-848] holds the variable binop_649
  mov RAX, [RBP-848]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-64]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-856], RAX ; [RBP-856] holds the variable binop_648
  mov RAX, [RBP-856]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-72]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-864], RAX ; [RBP-864] holds the variable binop_647
  mov RAX, [RBP-864]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-872], RAX ; [RBP-872] holds the variable binop_646
  mov RAX, [RBP-872]
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
  mov [RBP-880], RAX ; [RBP-880] holds the variable binop_645
  mov RAX, [RBP-880]
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
  mov [RBP-888], RAX ; [RBP-888] holds the variable binop_644
  mov RAX, [RBP-888]
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
  mov [RBP-896], RAX ; [RBP-896] holds the variable binop_643
  mov RAX, [RBP-896]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-904], RAX ; [RBP-904] holds the variable binop_642
  mov RAX, [RBP-904]
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
  mov [RBP-912], RAX ; [RBP-912] holds the variable binop_641
  mov RAX, [RBP-912]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-920], RAX ; [RBP-920] holds the variable binop_640
  mov RAX, [RBP-920]
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
  mov [RBP-928], RAX ; [RBP-928] holds the variable binop_639
  mov RAX, [RBP-928]
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
  mov [RBP-936], RAX ; [RBP-936] holds the variable binop_638
  mov RAX, [RBP-936]
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
  mov [RBP-944], RAX ; [RBP-944] holds the variable binop_637
  mov RAX, [RBP-944]
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
  mov [RBP-952], RAX ; [RBP-952] holds the variable binop_636
  mov RAX, [RBP-952]
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
  mov [RBP-960], RAX ; [RBP-960] holds the variable binop_635
  mov RAX, [RBP-960]
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
  mov [RBP-968], RAX ; [RBP-968] holds the variable binop_634
  mov RAX, [RBP-968]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-976], RAX ; [RBP-976] holds the variable binop_633
  mov RAX, [RBP-976]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-192]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-984], RAX ; [RBP-984] holds the variable binop_632
  mov RAX, [RBP-984]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-200]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-992], RAX ; [RBP-992] holds the variable binop_631
  mov RAX, [RBP-992]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable binop_630
  mov RAX, [RBP-1000]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-216]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable binop_629
  mov RAX, [RBP-1008]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-224]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable binop_628
  mov RAX, [RBP-1016]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-232]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable binop_627
  mov RAX, [RBP-1024]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-240]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable binop_626
  mov RAX, [RBP-1032]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-248]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable binop_625
  mov RAX, [RBP-1040]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-256]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable binop_624
  mov RAX, [RBP-1048]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable binop_623
  mov RAX, [RBP-1056]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable binop_622
  mov RAX, [RBP-1064]
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
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable binop_621
  mov RAX, [RBP-1072]
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
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable binop_620
  mov RAX, [RBP-1080]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-296]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable binop_619
  mov RAX, [RBP-1088]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable binop_618
  mov RAX, [RBP-1096]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable binop_617
  mov RAX, [RBP-1104]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-320]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable binop_616
  mov RAX, [RBP-1112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable binop_615
  mov RAX, [RBP-1120]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-336]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable binop_614
  mov RAX, [RBP-1128]
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
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable binop_613
  mov RAX, [RBP-1136]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable binop_612
  mov RAX, [RBP-1144]
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
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable binop_611
  mov RAX, [RBP-1152]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1160], RAX ; [RBP-1160] holds the variable binop_610
  mov RAX, [RBP-1160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-376]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1168], RAX ; [RBP-1168] holds the variable binop_609
  mov RAX, [RBP-1168]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-384]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable binop_608
  mov RAX, [RBP-1176]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-392]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable binop_607
  mov RAX, [RBP-1184]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable binop_606
  mov RAX, [RBP-1192]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-408]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable binop_605
  mov RAX, [RBP-1200]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-416]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable binop_604
  mov RAX, [RBP-1208]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-424]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable binop_603
  mov RAX, [RBP-1216]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable binop_602
  mov RAX, [RBP-1224]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-440]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable binop_601
  mov RAX, [RBP-1232]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-448]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable binop_600
  mov RAX, [RBP-1240]
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
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable binop_599
  mov RAX, [RBP-1248]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-464]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable binop_598
  mov RAX, [RBP-1256]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-472]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable binop_597
  mov RAX, [RBP-1264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-480]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable binop_596
  mov RAX, [RBP-1272]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-488]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable binop_595
  mov RAX, [RBP-1280]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-496]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable binop_594
  mov RAX, [RBP-1288]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable binop_593
  mov RAX, [RBP-1296]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-512]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1304], RAX ; [RBP-1304] holds the variable binop_592
  mov RAX, [RBP-1304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-520]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1312], RAX ; [RBP-1312] holds the variable binop_591
  mov RAX, [RBP-1312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-528]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1320], RAX ; [RBP-1320] holds the variable binop_590
  mov RAX, [RBP-1320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-536]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1328], RAX ; [RBP-1328] holds the variable binop_589
  mov RAX, [RBP-1328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-544]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1336], RAX ; [RBP-1336] holds the variable binop_588
  mov RAX, [RBP-1336]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-552]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1344], RAX ; [RBP-1344] holds the variable binop_587
  mov RAX, [RBP-1344]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-560]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1352], RAX ; [RBP-1352] holds the variable binop_586
  mov RAX, [RBP-1352]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1360], RAX ; [RBP-1360] holds the variable binop_585
  mov RAX, [RBP-1360]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-576]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable binop_584
  mov RAX, [RBP-1368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-584]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable binop_583
  mov RAX, [RBP-1376]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-592]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable binop_582
  mov RAX, [RBP-1384]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable binop_581
  mov RAX, [RBP-1392]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-608]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable binop_580
  mov RAX, [RBP-1400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable binop_579
  mov RAX, [RBP-1408]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-624]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable binop_578
  mov RAX, [RBP-1416]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable binop_577
  mov RAX, [RBP-1424]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-640]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable binop_576
  mov RAX, [RBP-1432]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-648]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable binop_575
  mov RAX, [RBP-1440]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-656]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable binop_574
  mov RAX, [RBP-1448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-664]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable binop_573
  mov RAX, [RBP-1456]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-672]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable binop_572
  mov RAX, [RBP-1464]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1472], RAX ; [RBP-1472] holds the variable binop_571
  mov RAX, [RBP-1472]
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
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable binop_570
  mov RAX, [RBP-1480]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-696]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable binop_569
  mov RAX, [RBP-1488]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-704]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable binop_568
  mov RAX, [RBP-1496]
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
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable binop_567
  mov RAX, [RBP-1504]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-720]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable binop_566
  mov RAX, [RBP-1512]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-728]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable binop_565
  mov RAX, [RBP-1520]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-736]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable binop_564
  mov RAX, [RBP-1528]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-744]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable binop_563
  mov RAX, [RBP-1536]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-752]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable binop_562
  mov RAX, [RBP-1544]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-760]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable binop_561
  mov RAX, [RBP-1552]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-768]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable binop_560
  mov RAX, [RBP-1560]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-776]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1568], RAX ; [RBP-1568] holds the variable binop_559
  mov RAX, [RBP-1568]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-784]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1576], RAX ; [RBP-1576] holds the variable binop_558
  mov RAX, [RBP-1576]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-792]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1584], RAX ; [RBP-1584] holds the variable binop_557
  mov RAX, [RBP-1584]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-800]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1592], RAX ; [RBP-1592] holds the variable binop_556
  mov RAX, [RBP-1592]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-808]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1600], RAX ; [RBP-1600] holds the variable binop_555
  mov RAX, [RBP-1600]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-816]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1608], RAX ; [RBP-1608] holds the variable binop_554
  mov RAX, [RBP-1608]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-824]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1616], RAX ; [RBP-1616] holds the variable binop_553
  mov RAX, [RBP-1616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-832]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1624], RAX ; [RBP-1624] holds the variable binop_552
  mov RAX, [RBP-1624]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-840]
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