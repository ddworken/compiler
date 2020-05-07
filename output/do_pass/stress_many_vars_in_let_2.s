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
  enter 848, 0
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
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-224 {
  jmp near lambda_end_224
lambda_224:
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
  ;; } define lambda-224
lambda_end_224:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_224
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_224:
  ;; Store lambda-224 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_224 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-224
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-221 {
  jmp near lambda_end_221
lambda_221:
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
  ;; } define lambda-221
lambda_end_221:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_221
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_221:
  ;; Store lambda-221 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_221 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-221
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-216 {
  jmp near lambda_end_216
lambda_216:
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
  ;; } define lambda-216
lambda_end_216:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_216
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_216:
  ;; Store lambda-216 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_216 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-216
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-212 {
  jmp near lambda_end_212
lambda_212:
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
  ;; } define lambda-212
lambda_end_212:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_212
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_212:
  ;; Store lambda-212 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_212 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-212
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
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
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  mov RSI, [RBP+24]
  call native#char_at
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
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_207 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-207
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  mov RAX, 2
  mov [RBP-48], RAX ; [RBP-48] holds the variable ab_53
  mov RAX, [RBP-48]
  mov [RBP-56], RAX ; [RBP-56] holds the variable ac_57
  mov RAX, [RBP-56]
  mov [RBP-64], RAX ; [RBP-64] holds the variable ad_61
  mov RAX, [RBP-64]
  mov [RBP-72], RAX ; [RBP-72] holds the variable ae_65
  mov RAX, [RBP-72]
  mov [RBP-80], RAX ; [RBP-80] holds the variable af_69
  mov RAX, [RBP-80]
  mov [RBP-88], RAX ; [RBP-88] holds the variable ag_73
  mov RAX, [RBP-88]
  mov [RBP-96], RAX ; [RBP-96] holds the variable ah_77
  mov RAX, [RBP-96]
  mov [RBP-104], RAX ; [RBP-104] holds the variable ai_81
  mov RAX, [RBP-104]
  mov [RBP-112], RAX ; [RBP-112] holds the variable aj_85
  mov RAX, [RBP-112]
  mov [RBP-120], RAX ; [RBP-120] holds the variable ak_89
  mov RAX, [RBP-120]
  mov [RBP-128], RAX ; [RBP-128] holds the variable al_93
  mov RAX, [RBP-128]
  mov [RBP-136], RAX ; [RBP-136] holds the variable am_97
  mov RAX, [RBP-136]
  mov [RBP-144], RAX ; [RBP-144] holds the variable an_101
  mov RAX, [RBP-144]
  mov [RBP-152], RAX ; [RBP-152] holds the variable ao_105
  mov RAX, [RBP-152]
  mov [RBP-160], RAX ; [RBP-160] holds the variable ap_109
  mov RAX, [RBP-160]
  mov [RBP-168], RAX ; [RBP-168] holds the variable aq_113
  mov RAX, [RBP-168]
  mov [RBP-176], RAX ; [RBP-176] holds the variable ar_117
  mov RAX, [RBP-176]
  mov [RBP-184], RAX ; [RBP-184] holds the variable as_121
  mov RAX, [RBP-184]
  mov [RBP-192], RAX ; [RBP-192] holds the variable at_125
  mov RAX, [RBP-192]
  mov [RBP-200], RAX ; [RBP-200] holds the variable au_129
  mov RAX, [RBP-200]
  mov [RBP-208], RAX ; [RBP-208] holds the variable av_133
  mov RAX, [RBP-208]
  mov [RBP-216], RAX ; [RBP-216] holds the variable aw_137
  mov RAX, [RBP-216]
  mov [RBP-224], RAX ; [RBP-224] holds the variable ax_141
  mov RAX, [RBP-224]
  mov [RBP-232], RAX ; [RBP-232] holds the variable ay_145
  mov RAX, [RBP-232]
  mov [RBP-240], RAX ; [RBP-240] holds the variable az_149
  mov RAX, [RBP-240]
  mov [RBP-248], RAX ; [RBP-248] holds the variable bc_153
  mov RAX, [RBP-248]
  mov [RBP-256], RAX ; [RBP-256] holds the variable bd_157
  mov RAX, [RBP-256]
  mov [RBP-264], RAX ; [RBP-264] holds the variable be_161
  mov RAX, [RBP-264]
  mov [RBP-272], RAX ; [RBP-272] holds the variable bf_165
  mov RAX, [RBP-272]
  mov [RBP-280], RAX ; [RBP-280] holds the variable bg_169
  mov RAX, [RBP-280]
  mov [RBP-288], RAX ; [RBP-288] holds the variable bh_173
  mov RAX, [RBP-288]
  mov [RBP-296], RAX ; [RBP-296] holds the variable bi_177
  mov RAX, [RBP-296]
  mov [RBP-304], RAX ; [RBP-304] holds the variable bj_181
  mov RAX, [RBP-304]
  mov [RBP-312], RAX ; [RBP-312] holds the variable bk_185
  mov RAX, [RBP-312]
  mov [RBP-320], RAX ; [RBP-320] holds the variable bl_189
  mov RAX, [RBP-320]
  mov [RBP-328], RAX ; [RBP-328] holds the variable bm_193
  mov RAX, [RBP-328]
  mov [RBP-336], RAX ; [RBP-336] holds the variable bn_197
  mov RAX, [RBP-336]
  mov [RBP-344], RAX ; [RBP-344] holds the variable bo_201
  mov RAX, [RBP-344]
  mov [RBP-352], RAX ; [RBP-352] holds the variable bp_205
  mov RAX, [RBP-352]
  mov [RBP-360], RAX ; [RBP-360] holds the variable bq_209
  mov RAX, [RBP-360]
  mov [RBP-368], RAX ; [RBP-368] holds the variable br_213
  mov RAX, [RBP-368]
  mov [RBP-376], RAX ; [RBP-376] holds the variable bs_217
  mov RAX, [RBP-376]
  mov [RBP-384], RAX ; [RBP-384] holds the variable bt_221
  mov RAX, [RBP-384]
  mov [RBP-392], RAX ; [RBP-392] holds the variable bu_225
  mov RAX, [RBP-392]
  mov [RBP-400], RAX ; [RBP-400] holds the variable bv_229
  mov RAX, [RBP-400]
  mov [RBP-408], RAX ; [RBP-408] holds the variable bw_233
  mov RAX, [RBP-408]
  mov [RBP-416], RAX ; [RBP-416] holds the variable bx_237
  mov RAX, [RBP-416]
  mov [RBP-424], RAX ; [RBP-424] holds the variable by_241
  mov RAX, [RBP-424]
  mov [RBP-432], RAX ; [RBP-432] holds the variable bz_245
  mov RAX, [RBP-432]
  mov [RBP-440], RAX ; [RBP-440] holds the variable cd_249
  mov RAX, [RBP-440]
  mov [RBP-448], RAX ; [RBP-448] holds the variable ce_253
  mov RAX, [RBP-448]
  mov [RBP-456], RAX ; [RBP-456] holds the variable cf_257
  mov RAX, [RBP-456]
  mov [RBP-464], RAX ; [RBP-464] holds the variable cg_261
  mov RAX, [RBP-464]
  mov [RBP-472], RAX ; [RBP-472] holds the variable ch_265
  mov RAX, [RBP-472]
  mov [RBP-480], RAX ; [RBP-480] holds the variable ci_269
  mov RAX, [RBP-480]
  mov [RBP-488], RAX ; [RBP-488] holds the variable cj_273
  mov RAX, [RBP-488]
  mov [RBP-496], RAX ; [RBP-496] holds the variable ck_277
  mov RAX, [RBP-496]
  mov [RBP-504], RAX ; [RBP-504] holds the variable cl_281
  mov RAX, [RBP-504]
  mov [RBP-512], RAX ; [RBP-512] holds the variable cm_285
  mov RAX, [RBP-512]
  mov [RBP-520], RAX ; [RBP-520] holds the variable cn_289
  mov RAX, [RBP-520]
  mov [RBP-528], RAX ; [RBP-528] holds the variable co_293
  mov RAX, [RBP-528]
  mov [RBP-536], RAX ; [RBP-536] holds the variable cp_297
  mov RAX, [RBP-536]
  mov [RBP-544], RAX ; [RBP-544] holds the variable cq_301
  mov RAX, [RBP-544]
  mov [RBP-552], RAX ; [RBP-552] holds the variable cr_305
  mov RAX, [RBP-552]
  mov [RBP-560], RAX ; [RBP-560] holds the variable cs_309
  mov RAX, [RBP-560]
  mov [RBP-568], RAX ; [RBP-568] holds the variable ct_313
  mov RAX, [RBP-568]
  mov [RBP-576], RAX ; [RBP-576] holds the variable cu_317
  mov RAX, [RBP-576]
  mov [RBP-584], RAX ; [RBP-584] holds the variable cv_321
  mov RAX, [RBP-584]
  mov [RBP-592], RAX ; [RBP-592] holds the variable cw_325
  mov RAX, [RBP-592]
  mov [RBP-600], RAX ; [RBP-600] holds the variable cx_329
  mov RAX, [RBP-600]
  mov [RBP-608], RAX ; [RBP-608] holds the variable cy_333
  mov RAX, [RBP-608]
  mov [RBP-616], RAX ; [RBP-616] holds the variable cz_337
  mov RAX, [RBP-616]
  mov [RBP-624], RAX ; [RBP-624] holds the variable de_341
  mov RAX, [RBP-624]
  mov [RBP-632], RAX ; [RBP-632] holds the variable df_345
  mov RAX, [RBP-632]
  mov [RBP-640], RAX ; [RBP-640] holds the variable dg_349
  mov RAX, [RBP-640]
  mov [RBP-648], RAX ; [RBP-648] holds the variable dh_353
  mov RAX, [RBP-648]
  mov [RBP-656], RAX ; [RBP-656] holds the variable di_357
  mov RAX, [RBP-656]
  mov [RBP-664], RAX ; [RBP-664] holds the variable dj_361
  mov RAX, [RBP-664]
  mov [RBP-672], RAX ; [RBP-672] holds the variable dk_365
  mov RAX, [RBP-672]
  mov [RBP-680], RAX ; [RBP-680] holds the variable dl_369
  mov RAX, [RBP-680]
  mov [RBP-688], RAX ; [RBP-688] holds the variable dm_373
  mov RAX, [RBP-688]
  mov [RBP-696], RAX ; [RBP-696] holds the variable dn_377
  mov RAX, [RBP-696]
  mov [RBP-704], RAX ; [RBP-704] holds the variable do_381
  mov RAX, [RBP-704]
  mov [RBP-712], RAX ; [RBP-712] holds the variable dp_385
  mov RAX, [RBP-712]
  mov [RBP-720], RAX ; [RBP-720] holds the variable dq_389
  mov RAX, [RBP-720]
  mov [RBP-728], RAX ; [RBP-728] holds the variable dr_393
  mov RAX, [RBP-728]
  mov [RBP-736], RAX ; [RBP-736] holds the variable ds_397
  mov RAX, [RBP-736]
  mov [RBP-744], RAX ; [RBP-744] holds the variable dt_401
  mov RAX, [RBP-744]
  mov [RBP-752], RAX ; [RBP-752] holds the variable du_405
  mov RAX, [RBP-752]
  mov [RBP-760], RAX ; [RBP-760] holds the variable dv_409
  mov RAX, [RBP-760]
  mov [RBP-768], RAX ; [RBP-768] holds the variable dw_413
  mov RAX, [RBP-768]
  mov [RBP-776], RAX ; [RBP-776] holds the variable dx_417
  mov RAX, [RBP-776]
  mov [RBP-784], RAX ; [RBP-784] holds the variable dy_421
  mov RAX, [RBP-784]
  mov [RBP-792], RAX ; [RBP-792] holds the variable dz_425
  mov RAX, [RBP-792]
  mov [RBP-800], RAX ; [RBP-800] holds the variable ef_429
  mov RAX, [RBP-800]
  mov [RBP-808], RAX ; [RBP-808] holds the variable eg_433
  mov RAX, [RBP-808]
  mov [RBP-816], RAX ; [RBP-816] holds the variable eh_437
  mov RAX, [RBP-816]
  mov [RBP-824], RAX ; [RBP-824] holds the variable ei_441
  mov RAX, [RBP-824]
  mov [RBP-832], RAX ; [RBP-832] holds the variable ej_445
  mov RAX, [RBP-832]
  mov [RBP-840], RAX ; [RBP-840] holds the variable ek_449
  mov RAX, [RBP-840]
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