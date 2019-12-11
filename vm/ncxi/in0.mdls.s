%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_203
	call NS_E_306
	call exec_out
	jmp _end
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_194:
NS_E_RDI_194:
NS_E_194_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_195
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_195:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_197:
NS_E_RDI_197:
NS_E_197_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_197_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_197_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_198:
NS_E_RDI_198:
NS_E_198_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_198_LB_0
	cmp r11,57
	ja NS_E_198_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_198_LB_0:
	mov rax,0
	ret
NS_E_200:
NS_E_RDI_200:
NS_E_200_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_200_LB_0
	cmp r11,122
	ja NS_E_200_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_200_LB_0:
	mov rax,0
	ret
NS_E_199:
NS_E_RDI_199:
NS_E_199_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_199_LB_0
	cmp r11,90
	ja NS_E_199_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_199_LB_0:
	mov rax,0
	ret
NS_E_28:
	mov rdi,r13
	bt r12,0
NS_E_RDI_28:
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
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rax,[r14]
	lea r8,[r8-1+r13]
	shr rax,32
	cmp r8,rax
	jge err_s8_ge
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
	cmp r10,rax
	jge err_s8_ge
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
	add r8,1
	add r10,1
	ret
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_196:
NS_E_RDI_196:
NS_E_196_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call scf_d
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	cmp rdi,0
	jz NS_E_196_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_196_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_203:
NS_E_RDI_203:
; 	» "-27686gg" _ ⊢ 0' : %_201
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f21 %_201 ⊢ %_202 : %_202
 ; {>  %_201~0':_stg }
; _f21 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_202~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_204
	mov rdi,r13
	call dlt
LB_204:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_212:
; 	|» 0'
NS_E_RDI_212:
MTC_LB_213:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_214
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_215
	bt QWORD [rax],0
	jc LB_216
	btr r12,3
	jmp LB_217
LB_216:
	bts r12,3
LB_217:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_215:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_220
	btr r12,4
	jmp LB_221
LB_220:
	bts r12,4
LB_221:
	mov r14,r10
	bt r12,4
	jc LB_218
	btr r12,1
	jmp LB_219
LB_218:
	bts r12,1
LB_219:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_224
	btr r12,4
	jmp LB_225
LB_224:
	bts r12,4
LB_225:
	mov r8,r10
	bt r12,4
	jc LB_222
	btr r12,2
	jmp LB_223
LB_222:
	bts r12,2
LB_223:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_214
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_226
	bt QWORD [rax],0
	jc LB_227
	btr r12,5
	jmp LB_228
LB_227:
	bts r12,5
LB_228:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_226:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_231
	btr r12,6
	jmp LB_232
LB_231:
	bts r12,6
LB_232:
	mov r9,rcx
	bt r12,6
	jc LB_229
	btr r12,3
	jmp LB_230
LB_229:
	bts r12,3
LB_230:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_235
	btr r12,6
	jmp LB_236
LB_235:
	bts r12,6
LB_236:
	mov r10,rcx
	bt r12,6
	jc LB_233
	btr r12,4
	jmp LB_234
LB_233:
	bts r12,4
LB_234:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_237:
	cmp r15,0
	jz LB_238
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_237
LB_238:
; ∎ {  }
 ; {>  %_206~1':t81'(-1) %_208~3':t81'(-1) %_209~4':(_lst)◂(t81'(-1)) }
; 	∎ {  }
	bt r12,1
	jc LB_239
	mov rdi,r14
	call dlt
LB_239:
	bt r12,3
	jc LB_240
	mov rdi,r9
	call dlt
LB_240:
	bt r12,4
	jc LB_241
	mov rdi,r10
	call dlt
LB_241:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_214:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_242
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_243
	bt QWORD [rax],0
	jc LB_244
	btr r12,3
	jmp LB_245
LB_244:
	bts r12,3
LB_245:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_243:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_248
	btr r12,4
	jmp LB_249
LB_248:
	bts r12,4
LB_249:
	mov r14,r10
	bt r12,4
	jc LB_246
	btr r12,1
	jmp LB_247
LB_246:
	bts r12,1
LB_247:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_252
	btr r12,4
	jmp LB_253
LB_252:
	bts r12,4
LB_253:
	mov r8,r10
	bt r12,4
	jc LB_250
	btr r12,2
	jmp LB_251
LB_250:
	bts r12,2
LB_251:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_242
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_254
	bt QWORD [rax],0
	jc LB_255
	btr r12,3
	jmp LB_256
LB_255:
	bts r12,3
LB_256:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_254:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_257:
	cmp r15,0
	jz LB_258
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_257
LB_258:
; ∎ {  }
 ; {>  %_210~1':t81'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_259
	mov rdi,r14
	call dlt
LB_259:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_242:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_260
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_261
	bt QWORD [rax],0
	jc LB_262
	btr r12,1
	jmp LB_263
LB_262:
	bts r12,1
LB_263:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_261:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_264:
	cmp r15,0
	jz LB_265
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_264
LB_265:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_260:
NS_E_267:
NS_E_RDI_267:
NS_E_267_ETR_TBL:
NS_E_267_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_296
	jmp LB_297
LB_296:
	jmp LB_270
LB_297:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; g0
	push r10
	call NS_E_267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_288
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_289
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_289:
	jmp LB_271
LB_288:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_282
	btr QWORD [rdi],1
LB_282:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_283
	btr QWORD [rdi],0
LB_283:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_271:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_270:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "C"
	add r14,1
	cmp r14,r10
	jg LB_280
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_280
	jmp LB_281
LB_280:
	jmp LB_272
LB_281:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_273
	btr QWORD [rdi],0
LB_273:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_272:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_306:
NS_E_RDI_306:
; 	» "AC" _ ⊢ 0' : %_298
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_43_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_299 : %_299
 ; {>  %_298~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_299
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f267 { %_298 %_299 } ⊢ { %_300 %_301 %_302 } : { %_300 %_301 %_302 }
 ; {>  %_299~1':_r64 %_298~0':_stg }
; _f267 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_267
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_307
	btr r12,4
	jmp LB_308
LB_307:
	bts r12,4
LB_308:
	mov r8,r9
	bt r12,3
	jc LB_311
	btr r12,2
	jmp LB_312
LB_311:
	bts r12,2
LB_312:
	mov rsi,1
	bt r12,2
	jc LB_309
	mov rsi,0
	bt r8,0
	jc LB_309
	jmp LB_310
LB_309:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_310:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_300 %_301 %_302 } ⊢ { %_303 %_304 %_305 } : { %_303 %_304 %_305 }
 ; {>  %_301~1':_r64 %_300~0':_stg %_302~2':(_opn)◂(_p266) }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_313
	btr r12,3
	jmp LB_314
LB_313:
	bts r12,3
LB_314:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_317
	btr r12,4
	jmp LB_318
LB_317:
	bts r12,4
LB_318:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_315
	btr QWORD [rdi],0
	jmp LB_316
LB_315:
	bts QWORD [rdi],0
LB_316:
	mov r10,r14
	bt r12,1
	jc LB_321
	btr r12,4
	jmp LB_322
LB_321:
	bts r12,4
LB_322:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_319
	btr QWORD [rdi],1
	jmp LB_320
LB_319:
	bts QWORD [rdi],1
LB_320:
	mov r10,r8
	bt r12,2
	jc LB_325
	btr r12,4
	jmp LB_326
LB_325:
	bts r12,4
LB_326:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_323
	btr QWORD [rdi],2
	jmp LB_324
LB_323:
	bts QWORD [rdi],2
LB_324:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_327
	btr r12,3
	jmp LB_328
LB_327:
	bts r12,3
LB_328:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_331
	btr r12,4
	jmp LB_332
LB_331:
	bts r12,4
LB_332:
	mov r13,r10
	bt r12,4
	jc LB_329
	btr r12,0
	jmp LB_330
LB_329:
	bts r12,0
LB_330:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_335
	btr r12,4
	jmp LB_336
LB_335:
	bts r12,4
LB_336:
	mov r14,r10
	bt r12,4
	jc LB_333
	btr r12,1
	jmp LB_334
LB_333:
	bts r12,1
LB_334:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_339
	btr r12,4
	jmp LB_340
LB_339:
	bts r12,4
LB_340:
	mov r8,r10
	bt r12,4
	jc LB_337
	btr r12,2
	jmp LB_338
LB_337:
	bts r12,2
LB_338:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_304~1':_r64 %_305~2':(_opn)◂(_p266) %_303~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_341
	mov rdi,r14
	call dlt
LB_341:
	bt r12,2
	jc LB_342
	mov rdi,r8
	call dlt
LB_342:
	bt r12,0
	jc LB_343
	mov rdi,r13
	call dlt
LB_343:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_194:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_194
	NS_E_DYN_197:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_197
	NS_E_DYN_198:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_198
	NS_E_DYN_199:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_199
	NS_E_DYN_200:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_200
	CST_DYN_203:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_212:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_212
	CST_DYN_306:
		dq 0x0000_0001_00_82_ffff
		dq 1
