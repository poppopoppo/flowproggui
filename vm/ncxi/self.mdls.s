%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_238
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,r13
	mov rsi,0
	bt r12,0
	setc sil
	call pp_v
	push rax
	mov rdi,rax
	mov rax,0
	add rdi,8
	mov rsi,rdi
	mov rdi,fmt_emt_q
	call printf
	pop rdi
	mov rax,0
	call free
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	ret
NS_E_198:
NS_E_RDI_198:
NS_E_198_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_198_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_198_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_199:
NS_E_RDI_199:
NS_E_199_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_199_LB_0
	cmp r11,57
	ja NS_E_199_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_199_LB_0:
	mov rax,0
	ret
NS_E_201:
NS_E_RDI_201:
NS_E_201_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_201_LB_0
	cmp r11,122
	ja NS_E_201_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_201_LB_0:
	mov rax,0
	ret
NS_E_200:
NS_E_RDI_200:
NS_E_200_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_200_LB_0
	cmp r11,90
	ja NS_E_200_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_200_LB_0:
	mov rax,0
	ret
NS_E_17:
NS_E_RDI_17:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_21:
	mov rdi,r8
	bt r12,0
NS_E_RDI_21:
	mov rsi,0
	setc sil
	push rsi
	call pp_v
	push rax
	push rdi
	mov rdi,2
	call mlc
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	pop rsi
	btr QWORD [rax],0
	btr QWORD [rax],1
	or QWORD [rax],rsi
	clc
	ret
NS_E_203:
NS_E_RDI_203:
NS_E_203_ETR_TBL:
NS_E_203_TBL:
	push r14
; "A"
	jmp LB_212
LB_211:
	add r14,1
LB_212:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_211
	cmp rax,10
	jz LB_211
	cmp rax,32
	jz LB_211
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,65
	jz LB_214
	jmp NS_E_203_MTC_0_failed
LB_214:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; g0
	jmp LB_218
LB_217:
	add r14,1
LB_218:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_217
	cmp rax,10
	jz LB_217
	cmp rax,32
	jz LB_217
	call NS_E_203_ETR_TBL
	cmp r15,0
	jz LB_219
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_220
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_220:
	jmp NS_E_203_MTC_0_failed
LB_219:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "B"
	jmp LB_223
LB_222:
	add r14,1
LB_223:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_222
	cmp rax,10
	jz LB_222
	cmp rax,32
	jz LB_222
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,66
	jz LB_225
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_227
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_227:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_228
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_228:
	jmp NS_E_203_MTC_0_failed
LB_225:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_207
	btr QWORD [rdi],2
LB_207:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_208
	btr QWORD [rdi],1
LB_208:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_209
	btr QWORD [rdi],0
LB_209:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_203_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_203_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_238:
NS_E_RDI_238:
; 	» "A B" _ ⊢ 0' : %_230
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_42_20_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_231 : %_231
 ; {>  %_230~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_231
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f203 { %_230 %_231 } ⊢ { %_232 %_233 %_234 } : { %_232 %_233 %_234 }
 ; {>  %_230~0':_stg %_231~1':_r64 }
; _f203 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_203
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_239
	btr r12,4
	jmp LB_240
LB_239:
	bts r12,4
LB_240:
	mov r15,r8
	bt r12,3
	jc LB_243
	btr r12,2
	jmp LB_244
LB_243:
	bts r12,2
LB_244:
	mov rsi,0
	bt r12,2
	jc LB_241
	bts rsi,17
	bt r15,0
	jc LB_241
	jmp LB_242
LB_241:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_242:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f14 { %_232 %_233 %_234 } ⊢ { %_235 %_236 %_237 } : { %_235 %_236 %_237 }
 ; {>  %_233~1':_r64 %_232~0':_stg %_234~2':(_opn)◂(_p202) }
; _f14 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_245
	btr r12,3
	jmp LB_246
LB_245:
	bts r12,3
LB_246:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,3
	jc LB_249
	btr r12,4
	jmp LB_250
LB_249:
	bts r12,4
LB_250:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_247
	btr QWORD [rdi],0
	jmp LB_248
LB_247:
	bts QWORD [rdi],0
LB_248:
	mov r9,r14
	bt r12,1
	jc LB_253
	btr r12,4
	jmp LB_254
LB_253:
	bts r12,4
LB_254:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_251
	btr QWORD [rdi],1
	jmp LB_252
LB_251:
	bts QWORD [rdi],1
LB_252:
	mov r9,r15
	bt r12,2
	jc LB_257
	btr r12,4
	jmp LB_258
LB_257:
	bts r12,4
LB_258:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_255
	btr QWORD [rdi],2
	jmp LB_256
LB_255:
	bts QWORD [rdi],2
LB_256:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 2' }
	mov r8,r13
	bt r12,0
	jc LB_259
	btr r12,3
	jmp LB_260
LB_259:
	bts r12,3
LB_260:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_263
	btr r12,4
	jmp LB_264
LB_263:
	bts r12,4
LB_264:
	mov r13,r9
	bt r12,4
	jc LB_261
	btr r12,0
	jmp LB_262
LB_261:
	bts r12,0
LB_262:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_267
	btr r12,4
	jmp LB_268
LB_267:
	bts r12,4
LB_268:
	mov r14,r9
	bt r12,4
	jc LB_265
	btr r12,1
	jmp LB_266
LB_265:
	bts r12,1
LB_266:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_271
	btr r12,4
	jmp LB_272
LB_271:
	bts r12,4
LB_272:
	mov r15,r9
	bt r12,4
	jc LB_269
	btr r12,2
	jmp LB_270
LB_269:
	bts r12,2
LB_270:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_237~2':(_opn)◂(_p202) %_236~1':_r64 %_235~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_273
	mov rdi,r15
	call dlt
LB_273:
	bt r12,1
	jc LB_274
	mov rdi,r14
	call dlt
LB_274:
	bt r12,0
	jc LB_275
	mov rdi,r13
	call dlt
LB_275:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_198:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_198
	NS_E_DYN_199:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_199
	NS_E_DYN_200:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_200
	NS_E_DYN_201:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_201
	NS_E_DYN_204:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_205:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_203:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_203
	CST_DYN_238:
		dq 0x0001_0001_00_82_ffff
		dq 1
