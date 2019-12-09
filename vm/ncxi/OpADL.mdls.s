%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_6456
	call NS_E_7322
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
	push r13
	mov rdi,r13
	mov rsi,str_ret
	bt r12,0
	call pp
	mov rdi,fmt_emt_q
	mov rsi,str_ret
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	ret
NS_E_5235:
NS_E_RDI_5235:
NS_E_5235_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_5236
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_5236:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5238:
NS_E_RDI_5238:
NS_E_5238_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_5238_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_5238_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5239:
NS_E_RDI_5239:
NS_E_5239_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_5239_LB_0
	cmp r11,57
	ja NS_E_5239_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_5239_LB_0:
	mov rax,0
	ret
NS_E_5241:
NS_E_RDI_5241:
NS_E_5241_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_5241_LB_0
	cmp r11,122
	ja NS_E_5241_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_5241_LB_0:
	mov rax,0
	ret
NS_E_5240:
NS_E_RDI_5240:
NS_E_5240_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_5240_LB_0
	cmp r11,90
	ja NS_E_5240_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_5240_LB_0:
	mov rax,0
	ret
NS_E_24:
NS_E_RDI_24:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
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
NS_E_5237:
NS_E_RDI_5237:
NS_E_5237_ETR_TBL:
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
	jz NS_E_5237_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_5237_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5255:
; 	|» { 0' 1' }
NS_E_RDI_5255:
MTC_LB_5256:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5257
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_5258
	bt QWORD [rax],0
	jc LB_5259
	btr r12,4
	jmp LB_5260
LB_5259:
	bts r12,4
LB_5260:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_5258:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_5263
	btr r12,5
	jmp LB_5264
LB_5263:
	bts r12,5
LB_5264:
	mov r8,r11
	bt r12,5
	jc LB_5261
	btr r12,2
	jmp LB_5262
LB_5261:
	bts r12,2
LB_5262:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_5267
	btr r12,5
	jmp LB_5268
LB_5267:
	bts r12,5
LB_5268:
	mov r9,r11
	bt r12,5
	jc LB_5265
	btr r12,3
	jmp LB_5266
LB_5265:
	bts r12,3
LB_5266:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5269:
	cmp r15,0
	jz LB_5270
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5269
LB_5270:
; _f39 %_5242 ⊢ %_5246 : %_5246
 ; {>  %_5244~2':_r64 %_5242~0':_r64 %_5245~3':(_lst)◂(_r64) }
	add r13,1
; _f5255 { %_5246 %_5245 } ⊢ { %_5247 %_5248 } : { %_5247 %_5248 }
 ; {>  %_5244~2':_r64 %_5246~0':_r64 %_5245~3':(_lst)◂(_r64) }
; _f5255 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_5273
	btr r12,1
	jmp LB_5274
LB_5273:
	bts r12,1
LB_5274:
	call NS_E_5255
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_5271
	btr r12,2
	jmp LB_5272
LB_5271:
	bts r12,2
LB_5272:
	add rsp,16
; _f38 %_5247 ⊢ %_5249 : %_5249
 ; {>  %_5244~2':_r64 %_5247~0':_r64 %_5248~1':_stg }
	sub r13,1
; _f16 { %_5248 %_5249 %_5244 } ⊢ { %_5250 %_5251 %_5252 } : { %_5250 %_5251 %_5252 }
 ; {>  %_5244~2':_r64 %_5249~0':_r64 %_5248~1':_stg }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_5275
	btr r12,3
	jmp LB_5276
LB_5275:
	bts r12,3
LB_5276:
	mov r14,r13
	bt r12,0
	jc LB_5277
	btr r12,1
	jmp LB_5278
LB_5277:
	bts r12,1
LB_5278:
	mov r13,r9
	bt r12,3
	jc LB_5279
	btr r12,0
	jmp LB_5280
LB_5279:
	bts r12,0
LB_5280:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_5251 %_5250 }
 ; {>  %_5251~1':_r64 %_5250~0':_stg %_5252~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_5281
	mov rdi,r8
	call dlt
LB_5281:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_5282
	btr r12,2
	jmp LB_5283
LB_5282:
	bts r12,2
LB_5283:
	mov r14,r13
	bt r12,0
	jc LB_5284
	btr r12,1
	jmp LB_5285
LB_5284:
	bts r12,1
LB_5285:
	mov r13,r8
	bt r12,2
	jc LB_5286
	btr r12,0
	jmp LB_5287
LB_5286:
	bts r12,0
LB_5287:
	ret
MTC_LB_5257:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_5288
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_5289
	bt QWORD [rax],0
	jc LB_5290
	btr r12,2
	jmp LB_5291
LB_5290:
	bts r12,2
LB_5291:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_5289:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5292:
	cmp r15,0
	jz LB_5293
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5292
LB_5293:
; _f14 %_5242 ⊢ { %_5253 %_5254 } : { %_5253 %_5254 }
 ; {>  %_5242~0':_r64 }
; _f14 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_5253 %_5254 }
 ; {>  %_5253~0':_r64 %_5254~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_5288:
NS_E_5298:
; 	|» 0'
NS_E_RDI_5298:
; » 0xr0 |~ {  } ⊢ %_5295 : %_5295
 ; {>  %_5294~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_5295
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f5255 { %_5295 %_5294 } ⊢ { %_5296 %_5297 } : { %_5296 %_5297 }
 ; {>  %_5294~0':(_lst)◂(_r64) %_5295~1':_r64 }
; _f5255 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_5299
	btr r12,2
	jmp LB_5300
LB_5299:
	bts r12,2
LB_5300:
	mov r14,r13
	bt r12,0
	jc LB_5301
	btr r12,1
	jmp LB_5302
LB_5301:
	bts r12,1
LB_5302:
	mov r13,r8
	bt r12,2
	jc LB_5303
	btr r12,0
	jmp LB_5304
LB_5303:
	bts r12,0
LB_5304:
	call NS_E_5255
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_5297
 ; {>  %_5297~1':_stg %_5296~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_5305
	mov rdi,r13
	call dlt
LB_5305:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_5306
	btr r12,0
	jmp LB_5307
LB_5306:
	bts r12,0
LB_5307:
	ret
NS_E_5308:
NS_E_RDI_5308:
NS_E_5308_ETR_TBL:
NS_E_5308_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_5348
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_5348
	jmp LB_5349
LB_5348:
	jmp NS_E_5308_MTC_0_failed
LB_5349:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_5309_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5353
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5354
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5354:
	jmp NS_E_5308_MTC_0_failed
LB_5353:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5341
	btr r12,1
	jmp LB_5342
LB_5341:
	bts r12,1
LB_5342:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5339
	btr r12,0
	jmp LB_5340
LB_5339:
	bts r12,0
LB_5340:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5336
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5356
	btr r12,2
	jmp LB_5357
LB_5356:
	bts r12,2
LB_5357:
	mov r13,r14
	bt r12,1
	jc LB_5358
	btr r12,0
	jmp LB_5359
LB_5358:
	bts r12,0
LB_5359:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f5298 %_5311 ⊢ %_5312 : %_5312
 ; {>  %_5311~0':(_lst)◂(_r64) }
; _f5298 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_5298
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_5312 ⊢ %_5313 : %_5313
 ; {>  %_5312~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5313
 ; {>  %_5313~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5334
	btr r12,3
	jmp LB_5335
LB_5334:
	bts r12,3
LB_5335:
	mov r8,0
	bts r12,2
	ret
LB_5336:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5338
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5337
LB_5338:
	add rsp,8
	ret
NS_E_5308_MTC_0_failed:
	add rsp,32
	pop r14
LB_5337:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5309:
NS_E_RDI_5309:
NS_E_5309_ETR_TBL:
NS_E_5309_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_5384
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_5384
	jmp LB_5385
LB_5384:
	jmp NS_E_5309_MTC_0_failed
LB_5385:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_5310_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5389
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5390
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5390:
	jmp NS_E_5309_MTC_0_failed
LB_5389:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_5309_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5395
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5396
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5396:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5397:
	jmp NS_E_5309_MTC_0_failed
LB_5395:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5377
	btr r12,2
	jmp LB_5378
LB_5377:
	bts r12,2
LB_5378:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5375
	btr r12,1
	jmp LB_5376
LB_5375:
	bts r12,1
LB_5376:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5373
	btr r12,0
	jmp LB_5374
LB_5373:
	bts r12,0
LB_5374:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5370
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5399
	btr r12,3
	jmp LB_5400
LB_5399:
	bts r12,3
LB_5400:
	mov r14,r8
	bt r12,2
	jc LB_5401
	btr r12,1
	jmp LB_5402
LB_5401:
	bts r12,1
LB_5402:
	mov r8,r13
	bt r12,0
	jc LB_5403
	btr r12,2
	jmp LB_5404
LB_5403:
	bts r12,2
LB_5404:
	mov r13,r9
	bt r12,3
	jc LB_5405
	btr r12,0
	jmp LB_5406
LB_5405:
	bts r12,0
LB_5406:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_5314 %_5315 } ⊢ %_5316 : %_5316
 ; {>  %_5314~0':_r64 %_5315~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5316 ⊢ %_5317 : %_5317
 ; {>  %_5316~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5317
 ; {>  %_5317~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5364
	btr r12,2
	jmp LB_5365
LB_5364:
	bts r12,2
LB_5365:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5362
	btr QWORD [rdi],0
	jmp LB_5363
LB_5362:
	bts QWORD [rdi],0
LB_5363:
	mov r8,r14
	bt r12,1
	jc LB_5368
	btr r12,2
	jmp LB_5369
LB_5368:
	bts r12,2
LB_5369:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5366
	btr QWORD [rdi],1
	jmp LB_5367
LB_5366:
	bts QWORD [rdi],1
LB_5367:
	mov rsi,1
	bt r12,3
	jc LB_5360
	mov rsi,0
	bt r9,0
	jc LB_5360
	jmp LB_5361
LB_5360:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_5361:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5370:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5372
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5371
LB_5372:
	add rsp,8
	ret
NS_E_5309_MTC_0_failed:
	add rsp,48
	pop r14
LB_5371:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_5419
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_5419
	jmp LB_5420
LB_5419:
	jmp NS_E_5309_MTC_1_failed
LB_5420:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5412
	btr r12,0
	jmp LB_5413
LB_5412:
	bts r12,0
LB_5413:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5409
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5318 : %_5318
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5318 ⊢ %_5319 : %_5319
 ; {>  %_5318~°1◂{  }:(_lst)◂(t2319'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5319
 ; {>  %_5319~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2322'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5407
	mov rsi,0
	bt r9,0
	jc LB_5407
	jmp LB_5408
LB_5407:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_5408:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5409:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5411
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5410
LB_5411:
	add rsp,8
	ret
NS_E_5309_MTC_1_failed:
	add rsp,16
	pop r14
LB_5410:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_5235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5441
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5309_MTC_2_failed
LB_5441:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_5309_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5446
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5447
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5447:
	jmp NS_E_5309_MTC_2_failed
LB_5446:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5436
	btr r12,1
	jmp LB_5437
LB_5436:
	bts r12,1
LB_5437:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5434
	btr r12,0
	jmp LB_5435
LB_5434:
	bts r12,0
LB_5435:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5431
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_5320 %_5321 } ⊢ %_5322 : %_5322
 ; {>  %_5321~1':(_lst)◂(_r64) %_5320~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5322 ⊢ %_5323 : %_5323
 ; {>  %_5322~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5323
 ; {>  %_5323~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5425
	btr r12,2
	jmp LB_5426
LB_5425:
	bts r12,2
LB_5426:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5423
	btr QWORD [rdi],0
	jmp LB_5424
LB_5423:
	bts QWORD [rdi],0
LB_5424:
	mov r8,r14
	bt r12,1
	jc LB_5429
	btr r12,2
	jmp LB_5430
LB_5429:
	bts r12,2
LB_5430:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5427
	btr QWORD [rdi],1
	jmp LB_5428
LB_5427:
	bts QWORD [rdi],1
LB_5428:
	mov rsi,1
	bt r12,3
	jc LB_5421
	mov rsi,0
	bt r9,0
	jc LB_5421
	jmp LB_5422
LB_5421:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_5422:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5431:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5433
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5432
LB_5433:
	add rsp,8
	ret
NS_E_5309_MTC_2_failed:
	add rsp,32
	pop r14
LB_5432:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5310:
NS_E_RDI_5310:
NS_E_5310_ETR_TBL:
NS_E_5310_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_5461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_5461
	jmp LB_5462
LB_5461:
	jmp NS_E_5310_MTC_0_failed
LB_5462:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5454
	btr r12,0
	jmp LB_5455
LB_5454:
	bts r12,0
LB_5455:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5451
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_5324 : %_5324
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_5324
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_5324 ⊢ %_5325 : %_5325
 ; {>  %_5324~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5325
 ; {>  %_5325~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5449
	btr r12,3
	jmp LB_5450
LB_5449:
	bts r12,3
LB_5450:
	mov r8,0
	bts r12,2
	ret
LB_5451:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5453
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5452
LB_5453:
	add rsp,8
	ret
NS_E_5310_MTC_0_failed:
	add rsp,16
	pop r14
LB_5452:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_5475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_5475
	jmp LB_5476
LB_5475:
	jmp NS_E_5310_MTC_1_failed
LB_5476:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5468
	btr r12,0
	jmp LB_5469
LB_5468:
	bts r12,0
LB_5469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5465
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_5326 : %_5326
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_5326
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_5326 ⊢ %_5327 : %_5327
 ; {>  %_5326~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5327
 ; {>  %_5327~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5463
	btr r12,3
	jmp LB_5464
LB_5463:
	bts r12,3
LB_5464:
	mov r8,0
	bts r12,2
	ret
LB_5465:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5467
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5466
LB_5467:
	add rsp,8
	ret
NS_E_5310_MTC_1_failed:
	add rsp,16
	pop r14
LB_5466:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_5489
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_5489
	jmp LB_5490
LB_5489:
	jmp NS_E_5310_MTC_2_failed
LB_5490:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5482
	btr r12,0
	jmp LB_5483
LB_5482:
	bts r12,0
LB_5483:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5479
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_5328 : %_5328
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_5328
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_5328 ⊢ %_5329 : %_5329
 ; {>  %_5328~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5329
 ; {>  %_5329~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5477
	btr r12,3
	jmp LB_5478
LB_5477:
	bts r12,3
LB_5478:
	mov r8,0
	bts r12,2
	ret
LB_5479:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5481
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5480
LB_5481:
	add rsp,8
	ret
NS_E_5310_MTC_2_failed:
	add rsp,16
	pop r14
LB_5480:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_5503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_5503
	jmp LB_5504
LB_5503:
	jmp NS_E_5310_MTC_3_failed
LB_5504:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5496
	btr r12,0
	jmp LB_5497
LB_5496:
	bts r12,0
LB_5497:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5493
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_5330 : %_5330
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_5330
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_5330 ⊢ %_5331 : %_5331
 ; {>  %_5330~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5331
 ; {>  %_5331~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5491
	btr r12,3
	jmp LB_5492
LB_5491:
	bts r12,3
LB_5492:
	mov r8,0
	bts r12,2
	ret
LB_5493:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5495
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5494
LB_5495:
	add rsp,8
	ret
NS_E_5310_MTC_3_failed:
	add rsp,16
	pop r14
LB_5494:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_5517
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_5517
	jmp LB_5518
LB_5517:
	jmp NS_E_5310_MTC_4_failed
LB_5518:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5510
	btr r12,0
	jmp LB_5511
LB_5510:
	bts r12,0
LB_5511:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5507
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_5332 : %_5332
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_5332
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_5332 ⊢ %_5333 : %_5333
 ; {>  %_5332~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5333
 ; {>  %_5333~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5505
	btr r12,3
	jmp LB_5506
LB_5505:
	bts r12,3
LB_5506:
	mov r8,0
	bts r12,2
	ret
LB_5507:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5509
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5508
LB_5509:
	add rsp,8
	ret
NS_E_5310_MTC_4_failed:
	add rsp,16
	pop r14
LB_5508:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5519:
NS_E_RDI_5519:
NS_E_5519_ETR_TBL:
NS_E_5519_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_5235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5555
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5519_MTC_0_failed
LB_5555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5550
	btr r12,0
	jmp LB_5551
LB_5550:
	bts r12,0
LB_5551:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5547
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_5521 : %_5521
 ; {>  %_5520~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_5521
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_5522 : %_5522
 ; {>  %_5520~0':_r64 %_5521~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_5522
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_5520 %_5521 } ⊢ { %_5523 %_5524 %_5525 } : { %_5523 %_5524 %_5525 }
 ; {>  %_5520~0':_r64 %_5521~1':_r64 %_5522~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_5522 %_5523 } ⊢ { %_5526 %_5527 %_5528 } : { %_5526 %_5527 %_5528 }
 ; {>  %_5523~0':_r64 %_5525~3':_r64 %_5524~1':_r64 %_5522~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_5531:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_5532
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_5532
LB_5533:
	cmp r15,0
	jz LB_5534
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5533
LB_5534:
; _some %_5527 ⊢ %_5529 : %_5529
 ; {>  %_5526~2':_r64 %_5524~1':_r64 %_5527~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5529
 ; {>  %_5529~°0◂0':(_opn)◂(_r64) %_5526~2':_r64 %_5524~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_5535
	mov rdi,r8
	call dlt
LB_5535:
	bt r12,1
	jc LB_5536
	mov rdi,r14
	call dlt
LB_5536:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5537
	btr r12,3
	jmp LB_5538
LB_5537:
	bts r12,3
LB_5538:
	mov r8,0
	bts r12,2
	ret
MTC_LB_5532:
	mov r15,0
LB_5540:
	cmp r15,0
	jz LB_5541
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5540
LB_5541:
; _none {  } ⊢ %_5530 : %_5530
 ; {>  %_5528~4':_r64 %_5525~3':_r64 %_5526~2':_r64 %_5524~1':_r64 %_5527~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_5530
 ; {>  %_5528~4':_r64 %_5525~3':_r64 %_5526~2':_r64 %_5524~1':_r64 %_5527~0':_r64 %_5530~°1◂{  }:(_opn)◂(t2397'(0)) }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_5542
	mov rdi,r10
	call dlt
LB_5542:
	bt r12,3
	jc LB_5543
	mov rdi,r9
	call dlt
LB_5543:
	bt r12,2
	jc LB_5544
	mov rdi,r8
	call dlt
LB_5544:
	bt r12,1
	jc LB_5545
	mov rdi,r14
	call dlt
LB_5545:
	bt r12,0
	jc LB_5546
	mov rdi,r13
	call dlt
LB_5546:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_5539:
LB_5547:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5549
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5548
LB_5549:
	add rsp,8
	ret
NS_E_5519_MTC_0_failed:
	add rsp,16
	pop r14
LB_5548:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5557:
NS_E_RDI_5557:
NS_E_5557_ETR_TBL:
NS_E_5557_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_5235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5593
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5557_MTC_0_failed
LB_5593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5588
	btr r12,0
	jmp LB_5589
LB_5588:
	bts r12,0
LB_5589:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5585
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_5559 : %_5559
 ; {>  %_5558~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_5559
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_5560 : %_5560
 ; {>  %_5559~1':_r64 %_5558~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_5560
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_5558 %_5559 } ⊢ { %_5561 %_5562 %_5563 } : { %_5561 %_5562 %_5563 }
 ; {>  %_5559~1':_r64 %_5560~2':_r64 %_5558~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_5560 %_5561 } ⊢ { %_5564 %_5565 %_5566 } : { %_5564 %_5565 %_5566 }
 ; {>  %_5563~3':_r64 %_5560~2':_r64 %_5562~1':_r64 %_5561~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_5569:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_5570
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_5570
LB_5571:
	cmp r15,0
	jz LB_5572
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5571
LB_5572:
; _some %_5565 ⊢ %_5567 : %_5567
 ; {>  %_5565~0':_r64 %_5562~1':_r64 %_5564~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5567
 ; {>  %_5567~°0◂0':(_opn)◂(_r64) %_5562~1':_r64 %_5564~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_5573
	mov rdi,r14
	call dlt
LB_5573:
	bt r12,2
	jc LB_5574
	mov rdi,r8
	call dlt
LB_5574:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5575
	btr r12,3
	jmp LB_5576
LB_5575:
	bts r12,3
LB_5576:
	mov r8,0
	bts r12,2
	ret
MTC_LB_5570:
	mov r15,0
LB_5578:
	cmp r15,0
	jz LB_5579
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5578
LB_5579:
; _none {  } ⊢ %_5568 : %_5568
 ; {>  %_5566~4':_r64 %_5563~3':_r64 %_5565~0':_r64 %_5562~1':_r64 %_5564~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_5568
 ; {>  %_5566~4':_r64 %_5563~3':_r64 %_5565~0':_r64 %_5568~°1◂{  }:(_opn)◂(t2424'(0)) %_5562~1':_r64 %_5564~2':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_5580
	mov rdi,r10
	call dlt
LB_5580:
	bt r12,3
	jc LB_5581
	mov rdi,r9
	call dlt
LB_5581:
	bt r12,0
	jc LB_5582
	mov rdi,r13
	call dlt
LB_5582:
	bt r12,1
	jc LB_5583
	mov rdi,r14
	call dlt
LB_5583:
	bt r12,2
	jc LB_5584
	mov rdi,r8
	call dlt
LB_5584:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_5577:
LB_5585:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5587
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5586
LB_5587:
	add rsp,8
	ret
NS_E_5557_MTC_0_failed:
	add rsp,16
	pop r14
LB_5586:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5595:
NS_E_RDI_5595:
NS_E_5595_ETR_TBL:
NS_E_5595_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_5235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5631
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5595_MTC_0_failed
LB_5631:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5626
	btr r12,0
	jmp LB_5627
LB_5626:
	bts r12,0
LB_5627:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5623
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_5597 : %_5597
 ; {>  %_5596~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_5597
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_5598 : %_5598
 ; {>  %_5596~0':_r64 %_5597~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_5598
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_5596 %_5597 } ⊢ { %_5599 %_5600 %_5601 } : { %_5599 %_5600 %_5601 }
 ; {>  %_5596~0':_r64 %_5597~1':_r64 %_5598~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_5598 %_5599 } ⊢ { %_5602 %_5603 %_5604 } : { %_5602 %_5603 %_5604 }
 ; {>  %_5601~3':_r64 %_5600~1':_r64 %_5599~0':_r64 %_5598~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_5607:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_5608
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_5608
LB_5609:
	cmp r15,0
	jz LB_5610
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5609
LB_5610:
; _some %_5603 ⊢ %_5605 : %_5605
 ; {>  %_5602~2':_r64 %_5600~1':_r64 %_5603~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5605
 ; {>  %_5602~2':_r64 %_5600~1':_r64 %_5605~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_5611
	mov rdi,r8
	call dlt
LB_5611:
	bt r12,1
	jc LB_5612
	mov rdi,r14
	call dlt
LB_5612:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5613
	btr r12,3
	jmp LB_5614
LB_5613:
	bts r12,3
LB_5614:
	mov r8,0
	bts r12,2
	ret
MTC_LB_5608:
	mov r15,0
LB_5616:
	cmp r15,0
	jz LB_5617
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5616
LB_5617:
; _none {  } ⊢ %_5606 : %_5606
 ; {>  %_5602~2':_r64 %_5601~3':_r64 %_5604~4':_r64 %_5600~1':_r64 %_5603~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_5606
 ; {>  %_5602~2':_r64 %_5601~3':_r64 %_5606~°1◂{  }:(_opn)◂(t2451'(0)) %_5604~4':_r64 %_5600~1':_r64 %_5603~0':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_5618
	mov rdi,r8
	call dlt
LB_5618:
	bt r12,3
	jc LB_5619
	mov rdi,r9
	call dlt
LB_5619:
	bt r12,4
	jc LB_5620
	mov rdi,r10
	call dlt
LB_5620:
	bt r12,1
	jc LB_5621
	mov rdi,r14
	call dlt
LB_5621:
	bt r12,0
	jc LB_5622
	mov rdi,r13
	call dlt
LB_5622:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_5615:
LB_5623:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5625
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5624
LB_5625:
	add rsp,8
	ret
NS_E_5595_MTC_0_failed:
	add rsp,16
	pop r14
LB_5624:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5633:
NS_E_RDI_5633:
NS_E_5633_ETR_TBL:
NS_E_5633_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_5595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5648
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5633_MTC_0_failed
LB_5648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5643
	btr r12,0
	jmp LB_5644
LB_5643:
	bts r12,0
LB_5644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5640
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_5634 ⊢ %_5635 : %_5635
 ; {>  %_5634~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5635
 ; {>  %_5635~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5638
	btr r12,3
	jmp LB_5639
LB_5638:
	bts r12,3
LB_5639:
	mov r8,0
	bts r12,2
	ret
LB_5640:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5642
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5641
LB_5642:
	add rsp,8
	ret
NS_E_5633_MTC_0_failed:
	add rsp,16
	pop r14
LB_5641:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_5557_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5660
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5633_MTC_1_failed
LB_5660:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5655
	btr r12,0
	jmp LB_5656
LB_5655:
	bts r12,0
LB_5656:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5652
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_5636 ⊢ %_5637 : %_5637
 ; {>  %_5636~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5637
 ; {>  %_5637~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5650
	btr r12,3
	jmp LB_5651
LB_5650:
	bts r12,3
LB_5651:
	mov r8,0
	bts r12,2
	ret
LB_5652:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5654
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5653
LB_5654:
	add rsp,8
	ret
NS_E_5633_MTC_1_failed:
	add rsp,16
	pop r14
LB_5653:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5662:
NS_E_RDI_5662:
NS_E_5662_ETR_TBL:
NS_E_5662_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_5633_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5710
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5662_MTC_0_failed
LB_5710:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_5663_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5715
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5716
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5716:
	jmp NS_E_5662_MTC_0_failed
LB_5715:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5705
	btr r12,1
	jmp LB_5706
LB_5705:
	bts r12,1
LB_5706:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5703
	btr r12,0
	jmp LB_5704
LB_5703:
	bts r12,0
LB_5704:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5700
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_5665 %_5666 } ⊢ %_5667 : %_5667
 ; {>  %_5666~1':(_lst)◂(_r64) %_5665~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f5298 %_5667 ⊢ %_5668 : %_5668
 ; {>  %_5667~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f5298 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_5686
	btr r12,2
	jmp LB_5687
LB_5686:
	bts r12,2
LB_5687:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_5692
	btr r12,3
	jmp LB_5693
LB_5692:
	bts r12,3
LB_5693:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_5690
	btr QWORD [rdi],0
	jmp LB_5691
LB_5690:
	bts QWORD [rdi],0
LB_5691:
	mov r9,r14
	bt r12,1
	jc LB_5696
	btr r12,3
	jmp LB_5697
LB_5696:
	bts r12,3
LB_5697:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_5694
	btr QWORD [rdi],1
	jmp LB_5695
LB_5694:
	bts QWORD [rdi],1
LB_5695:
	mov rsi,1
	bt r12,0
	jc LB_5688
	mov rsi,0
	bt r13,0
	jc LB_5688
	jmp LB_5689
LB_5688:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_5689:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_5298
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_5668 ⊢ %_5669 : %_5669
 ; {>  %_5668~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5669
 ; {>  %_5669~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5698
	btr r12,3
	jmp LB_5699
LB_5698:
	bts r12,3
LB_5699:
	mov r8,0
	bts r12,2
	ret
LB_5700:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5702
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5701
LB_5702:
	add rsp,8
	ret
NS_E_5662_MTC_0_failed:
	add rsp,32
	pop r14
LB_5701:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5663:
NS_E_RDI_5663:
NS_E_5663_ETR_TBL:
NS_E_5663_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_5664_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5738
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5663_MTC_0_failed
LB_5738:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_5663_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5743
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5744
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5744:
	jmp NS_E_5663_MTC_0_failed
LB_5743:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5733
	btr r12,1
	jmp LB_5734
LB_5733:
	bts r12,1
LB_5734:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5731
	btr r12,0
	jmp LB_5732
LB_5731:
	bts r12,0
LB_5732:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5728
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_5670 %_5671 } ⊢ %_5672 : %_5672
 ; {>  %_5670~0':_r64 %_5671~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5672 ⊢ %_5673 : %_5673
 ; {>  %_5672~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5673
 ; {>  %_5673~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5722
	btr r12,2
	jmp LB_5723
LB_5722:
	bts r12,2
LB_5723:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5720
	btr QWORD [rdi],0
	jmp LB_5721
LB_5720:
	bts QWORD [rdi],0
LB_5721:
	mov r8,r14
	bt r12,1
	jc LB_5726
	btr r12,2
	jmp LB_5727
LB_5726:
	bts r12,2
LB_5727:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5724
	btr QWORD [rdi],1
	jmp LB_5725
LB_5724:
	bts QWORD [rdi],1
LB_5725:
	mov rsi,1
	bt r12,3
	jc LB_5718
	mov rsi,0
	bt r9,0
	jc LB_5718
	jmp LB_5719
LB_5718:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_5719:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5728:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5730
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5729
LB_5730:
	add rsp,8
	ret
NS_E_5663_MTC_0_failed:
	add rsp,32
	pop r14
LB_5729:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5748
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_5674 : %_5674
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5674 ⊢ %_5675 : %_5675
 ; {>  %_5674~°1◂{  }:(_lst)◂(t2495'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5675
 ; {>  %_5675~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2498'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5746
	mov rsi,0
	bt r9,0
	jc LB_5746
	jmp LB_5747
LB_5746:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_5747:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5748:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5750
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5749
LB_5750:
	add rsp,8
	ret
NS_E_5663_MTC_1_failed:
	add rsp,0
	pop r14
LB_5749:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5664:
NS_E_RDI_5664:
NS_E_5664_ETR_TBL:
NS_E_5664_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_5633_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5761
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5664_MTC_0_failed
LB_5761:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5756
	btr r12,0
	jmp LB_5757
LB_5756:
	bts r12,0
LB_5757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5753
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_5676 ⊢ %_5677 : %_5677
 ; {>  %_5676~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5677
 ; {>  %_5677~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5751
	btr r12,3
	jmp LB_5752
LB_5751:
	bts r12,3
LB_5752:
	mov r8,0
	bts r12,2
	ret
LB_5753:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5755
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5754
LB_5755:
	add rsp,8
	ret
NS_E_5664_MTC_0_failed:
	add rsp,16
	pop r14
LB_5754:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_5519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5780
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5664_MTC_1_failed
LB_5780:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5775
	btr r12,0
	jmp LB_5776
LB_5775:
	bts r12,0
LB_5776:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5772
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_5679
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f21 %_5679 ⊢ %_5680 : %_5680
 ; {>  %_5678~0':_r64 %_5679~1':_stg }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_5765
	btr r12,0
	jmp LB_5766
LB_5765:
	bts r12,0
LB_5766:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_5767
	btr r12,1
	jmp LB_5768
LB_5767:
	bts r12,1
LB_5768:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_5763
	btr r12,0
	jmp LB_5764
LB_5763:
	bts r12,0
LB_5764:
	add rsp,16
; _some %_5678 ⊢ %_5681 : %_5681
 ; {>  %_5680~1':_stg %_5678~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5681
 ; {>  %_5680~1':_stg %_5681~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_5769
	mov rdi,r14
	call dlt
LB_5769:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5770
	btr r12,3
	jmp LB_5771
LB_5770:
	bts r12,3
LB_5771:
	mov r8,0
	bts r12,2
	ret
LB_5772:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5774
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5773
LB_5774:
	add rsp,8
	ret
NS_E_5664_MTC_1_failed:
	add rsp,16
	pop r14
LB_5773:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_5795
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5795
	jmp LB_5796
LB_5795:
	jmp NS_E_5664_MTC_2_failed
LB_5796:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5788
	btr r12,0
	jmp LB_5789
LB_5788:
	bts r12,0
LB_5789:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5785
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_5682
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f21 %_5682 ⊢ %_5683 : %_5683
 ; {>  %_5682~0':_stg }
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
; » 0xr5f |~ {  } ⊢ %_5684 : %_5684
 ; {>  %_5683~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_5684
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_5684 ⊢ %_5685 : %_5685
 ; {>  %_5684~1':_r64 %_5683~0':_stg }
; _some 1' ⊢ °0◂1'
; ∎ %_5685
 ; {>  %_5685~°0◂1':(_opn)◂(_r64) %_5683~0':_stg }
; 	∎ °0◂1'
	bt r12,0
	jc LB_5782
	mov rdi,r13
	call dlt
LB_5782:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_5783
	btr r12,3
	jmp LB_5784
LB_5783:
	bts r12,3
LB_5784:
	mov r8,0
	bts r12,2
	ret
LB_5785:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5787
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5786
LB_5787:
	add rsp,8
	ret
NS_E_5664_MTC_2_failed:
	add rsp,16
	pop r14
LB_5786:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5797:
NS_E_RDI_5797:
NS_E_5797_ETR_TBL:
NS_E_5797_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_5817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5817
	jmp LB_5818
LB_5817:
	jmp NS_E_5797_MTC_0_failed
LB_5818:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_5663_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5822
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5823
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5823:
	jmp NS_E_5797_MTC_0_failed
LB_5822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5810
	btr r12,1
	jmp LB_5811
LB_5810:
	bts r12,1
LB_5811:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5808
	btr r12,0
	jmp LB_5809
LB_5808:
	bts r12,0
LB_5809:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5805
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5825
	btr r12,2
	jmp LB_5826
LB_5825:
	bts r12,2
LB_5826:
	mov r13,r14
	bt r12,1
	jc LB_5827
	btr r12,0
	jmp LB_5828
LB_5827:
	bts r12,0
LB_5828:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f5298 %_5798 ⊢ %_5799 : %_5799
 ; {>  %_5798~0':(_lst)◂(_r64) }
; _f5298 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_5298
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_5799 ⊢ %_5800 : %_5800
 ; {>  %_5799~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5800
 ; {>  %_5800~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5803
	btr r12,3
	jmp LB_5804
LB_5803:
	bts r12,3
LB_5804:
	mov r8,0
	bts r12,2
	ret
LB_5805:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5807
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5806
LB_5807:
	add rsp,8
	ret
NS_E_5797_MTC_0_failed:
	add rsp,32
	pop r14
LB_5806:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5839
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5797_MTC_1_failed
LB_5839:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5834
	btr r12,0
	jmp LB_5835
LB_5834:
	bts r12,0
LB_5835:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5831
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_5801 ⊢ %_5802 : %_5802
 ; {>  %_5801~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5802
 ; {>  %_5802~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5829
	btr r12,3
	jmp LB_5830
LB_5829:
	bts r12,3
LB_5830:
	mov r8,0
	bts r12,2
	ret
LB_5831:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5833
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5832
LB_5833:
	add rsp,8
	ret
NS_E_5797_MTC_1_failed:
	add rsp,16
	pop r14
LB_5832:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5842:
NS_E_RDI_5842:
NS_E_5842_ETR_TBL:
NS_E_5842_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5850:
	jmp LB_5847
LB_5846:
	add r14,1
LB_5847:
	cmp r14,r10
	jge LB_5848
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5846
	cmp al,10
	jz LB_5846
	cmp al,32
	jz LB_5846
LB_5848:
	push r10
	push rsi
	call NS_E_5662_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5849
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5851
	bts QWORD [rax],0
LB_5851:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5850
LB_5849:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5844
	btr QWORD [rdi],0
LB_5844:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5842_MTC_0_failed:
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
NS_E_5855:
NS_E_RDI_5855:
NS_E_5855_ETR_TBL:
NS_E_5855_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_5959
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_5959
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_5959
	jmp LB_5960
LB_5959:
	jmp NS_E_5855_MTC_0_failed
LB_5960:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_5856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5964
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5965
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5965:
	jmp NS_E_5855_MTC_0_failed
LB_5964:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_5855_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5970
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5971
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5971:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5972:
	jmp NS_E_5855_MTC_0_failed
LB_5970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5952
	btr r12,2
	jmp LB_5953
LB_5952:
	bts r12,2
LB_5953:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5950
	btr r12,1
	jmp LB_5951
LB_5950:
	bts r12,1
LB_5951:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5948
	btr r12,0
	jmp LB_5949
LB_5948:
	bts r12,0
LB_5949:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5945
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_5974
	btr r12,3
	jmp LB_5975
LB_5974:
	bts r12,3
LB_5975:
	mov r13,r14
	bt r12,1
	jc LB_5976
	btr r12,0
	jmp LB_5977
LB_5976:
	bts r12,0
LB_5977:
	mov r10,r8
	bt r12,2
	jc LB_5978
	btr r12,4
	jmp LB_5979
LB_5978:
	bts r12,4
LB_5979:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_5982
	btr r12,5
	jmp LB_5983
LB_5982:
	bts r12,5
LB_5983:
	mov r14,r11
	bt r12,5
	jc LB_5980
	btr r12,1
	jmp LB_5981
LB_5980:
	bts r12,1
LB_5981:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_5986
	btr r12,5
	jmp LB_5987
LB_5986:
	bts r12,5
LB_5987:
	mov r8,r11
	bt r12,5
	jc LB_5984
	btr r12,2
	jmp LB_5985
LB_5984:
	bts r12,2
LB_5985:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_5861 : %_5861
 ; {>  %_5858~0':_r64 %_5859~1':_r64 %_5860~2':(_lst)◂(_p5852) }
; 	» 0xr2 _ ⊢ 3' : %_5861
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_5861 %_5858 } ⊢ { %_5862 %_5863 } : { %_5862 %_5863 }
 ; {>  %_5858~0':_r64 %_5859~1':_r64 %_5861~3':_r64 %_5860~2':(_lst)◂(_p5852) }
	add r9,r13
; _f5853 %_5862 ⊢ %_5864 : %_5864
 ; {>  %_5862~3':_r64 %_5863~0':_r64 %_5859~1':_r64 %_5860~2':(_lst)◂(_p5852) }
; _f5853 3' ⊢ °0◂3'
; _cns { %_5864 %_5860 } ⊢ %_5865 : %_5865
 ; {>  %_5863~0':_r64 %_5859~1':_r64 %_5864~°0◂3':_p5852 %_5860~2':(_lst)◂(_p5852) }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_5859 %_5865 } ⊢ %_5866 : %_5866
 ; {>  %_5865~°0◂{ °0◂3' 2' }:(_lst)◂(_p5852) %_5863~0':_r64 %_5859~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_5866
 ; {>  %_5863~0':_r64 %_5866~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p5852) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_5924
	mov rdi,r13
	call dlt
LB_5924:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_5925
	btr r12,0
	jmp LB_5926
LB_5925:
	bts r12,0
LB_5926:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_5929
	btr r12,4
	jmp LB_5930
LB_5929:
	bts r12,4
LB_5930:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5927
	btr QWORD [rdi],0
	jmp LB_5928
LB_5927:
	bts QWORD [rdi],0
LB_5928:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_5939
	btr r12,1
	jmp LB_5940
LB_5939:
	bts r12,1
LB_5940:
	mov rsi,1
	bt r12,1
	jc LB_5937
	mov rsi,0
	bt r14,0
	jc LB_5937
	jmp LB_5938
LB_5937:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_5938:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5935
	btr QWORD [rdi],0
	jmp LB_5936
LB_5935:
	bts QWORD [rdi],0
LB_5936:
	mov r14,r8
	bt r12,2
	jc LB_5943
	btr r12,1
	jmp LB_5944
LB_5943:
	bts r12,1
LB_5944:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_5941
	btr QWORD [rdi],1
	jmp LB_5942
LB_5941:
	bts QWORD [rdi],1
LB_5942:
	mov rsi,1
	bt r12,4
	jc LB_5933
	mov rsi,0
	bt r10,0
	jc LB_5933
	jmp LB_5934
LB_5933:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_5934:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5931
	btr QWORD [rdi],1
	jmp LB_5932
LB_5931:
	bts QWORD [rdi],1
LB_5932:
	mov r8,0
	bts r12,2
	ret
LB_5945:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5947
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5946
LB_5947:
	add rsp,8
	ret
NS_E_5855_MTC_0_failed:
	add rsp,48
	pop r14
LB_5946:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_6023
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_6023
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_6023
	jmp LB_6024
LB_6023:
	jmp NS_E_5855_MTC_1_failed
LB_6024:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_5857_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6028
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6029
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6029:
	jmp NS_E_5855_MTC_1_failed
LB_6028:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_5855_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6034
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6035
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6035:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6036
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6036:
	jmp NS_E_5855_MTC_1_failed
LB_6034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6016
	btr r12,2
	jmp LB_6017
LB_6016:
	bts r12,2
LB_6017:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6014
	btr r12,1
	jmp LB_6015
LB_6014:
	bts r12,1
LB_6015:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6012
	btr r12,0
	jmp LB_6013
LB_6012:
	bts r12,0
LB_6013:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6009
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_6038
	btr r12,3
	jmp LB_6039
LB_6038:
	bts r12,3
LB_6039:
	mov r13,r14
	bt r12,1
	jc LB_6040
	btr r12,0
	jmp LB_6041
LB_6040:
	bts r12,0
LB_6041:
	mov r10,r8
	bt r12,2
	jc LB_6042
	btr r12,4
	jmp LB_6043
LB_6042:
	bts r12,4
LB_6043:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_6046
	btr r12,5
	jmp LB_6047
LB_6046:
	bts r12,5
LB_6047:
	mov r14,r11
	bt r12,5
	jc LB_6044
	btr r12,1
	jmp LB_6045
LB_6044:
	bts r12,1
LB_6045:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_6050
	btr r12,5
	jmp LB_6051
LB_6050:
	bts r12,5
LB_6051:
	mov r8,r11
	bt r12,5
	jc LB_6048
	btr r12,2
	jmp LB_6049
LB_6048:
	bts r12,2
LB_6049:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_5870 : %_5870
 ; {>  %_5868~1':_r64 %_5867~0':_r64 %_5869~2':(_lst)◂(_p5852) }
; 	» 0xr2 _ ⊢ 3' : %_5870
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_5870 %_5867 } ⊢ { %_5871 %_5872 } : { %_5871 %_5872 }
 ; {>  %_5868~1':_r64 %_5867~0':_r64 %_5870~3':_r64 %_5869~2':(_lst)◂(_p5852) }
	add r9,r13
; _f5853 %_5871 ⊢ %_5873 : %_5873
 ; {>  %_5872~0':_r64 %_5868~1':_r64 %_5869~2':(_lst)◂(_p5852) %_5871~3':_r64 }
; _f5853 3' ⊢ °0◂3'
; _cns { %_5873 %_5869 } ⊢ %_5874 : %_5874
 ; {>  %_5873~°0◂3':_p5852 %_5872~0':_r64 %_5868~1':_r64 %_5869~2':(_lst)◂(_p5852) }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_5868 %_5874 } ⊢ %_5875 : %_5875
 ; {>  %_5872~0':_r64 %_5868~1':_r64 %_5874~°0◂{ °0◂3' 2' }:(_lst)◂(_p5852) }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_5875
 ; {>  %_5872~0':_r64 %_5875~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p5852) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_5988
	mov rdi,r13
	call dlt
LB_5988:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_5989
	btr r12,0
	jmp LB_5990
LB_5989:
	bts r12,0
LB_5990:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_5993
	btr r12,4
	jmp LB_5994
LB_5993:
	bts r12,4
LB_5994:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5991
	btr QWORD [rdi],0
	jmp LB_5992
LB_5991:
	bts QWORD [rdi],0
LB_5992:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_6003
	btr r12,1
	jmp LB_6004
LB_6003:
	bts r12,1
LB_6004:
	mov rsi,1
	bt r12,1
	jc LB_6001
	mov rsi,0
	bt r14,0
	jc LB_6001
	jmp LB_6002
LB_6001:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_6002:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5999
	btr QWORD [rdi],0
	jmp LB_6000
LB_5999:
	bts QWORD [rdi],0
LB_6000:
	mov r14,r8
	bt r12,2
	jc LB_6007
	btr r12,1
	jmp LB_6008
LB_6007:
	bts r12,1
LB_6008:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_6005
	btr QWORD [rdi],1
	jmp LB_6006
LB_6005:
	bts QWORD [rdi],1
LB_6006:
	mov rsi,1
	bt r12,4
	jc LB_5997
	mov rsi,0
	bt r10,0
	jc LB_5997
	jmp LB_5998
LB_5997:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_5998:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5995
	btr QWORD [rdi],1
	jmp LB_5996
LB_5995:
	bts QWORD [rdi],1
LB_5996:
	mov r8,0
	bts r12,2
	ret
LB_6009:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6011
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6010
LB_6011:
	add rsp,8
	ret
NS_E_5855_MTC_1_failed:
	add rsp,48
	pop r14
LB_6010:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_5235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6126
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5855_MTC_2_failed
LB_6126:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_5855_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6131
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6132
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6132:
	jmp NS_E_5855_MTC_2_failed
LB_6131:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6121
	btr r12,1
	jmp LB_6122
LB_6121:
	bts r12,1
LB_6122:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6119
	btr r12,0
	jmp LB_6120
LB_6119:
	bts r12,0
LB_6120:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6116
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_6134
	btr r12,3
	jmp LB_6135
LB_6134:
	bts r12,3
LB_6135:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_6138
	btr r12,4
	jmp LB_6139
LB_6138:
	bts r12,4
LB_6139:
	mov r14,r10
	bt r12,4
	jc LB_6136
	btr r12,1
	jmp LB_6137
LB_6136:
	bts r12,1
LB_6137:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_6142
	btr r12,4
	jmp LB_6143
LB_6142:
	bts r12,4
LB_6143:
	mov r8,r10
	bt r12,4
	jc LB_6140
	btr r12,2
	jmp LB_6141
LB_6140:
	bts r12,2
LB_6141:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
MTC_LB_6052:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6053
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
	jnc LB_6054
	bt QWORD [rax],0
	jc LB_6055
	btr r12,5
	jmp LB_6056
LB_6055:
	bts r12,5
LB_6056:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_6054:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_6059
	btr r12,6
	jmp LB_6060
LB_6059:
	bts r12,6
LB_6060:
	mov r9,rcx
	bt r12,6
	jc LB_6057
	btr r12,3
	jmp LB_6058
LB_6057:
	bts r12,3
LB_6058:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_6063
	btr r12,6
	jmp LB_6064
LB_6063:
	bts r12,6
LB_6064:
	mov r10,rcx
	bt r12,6
	jc LB_6061
	btr r12,4
	jmp LB_6062
LB_6061:
	bts r12,4
LB_6062:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6053
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_6065
	bt QWORD [rax],0
	jc LB_6066
	btr r12,6
	jmp LB_6067
LB_6066:
	bts r12,6
LB_6067:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_6065:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_6068
	btr r12,5
	jmp LB_6069
LB_6068:
	bts r12,5
LB_6069:
LB_6070:
	cmp r15,0
	jz LB_6071
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6070
LB_6071:
; » 0xr1 |~ {  } ⊢ %_5882 : %_5882
 ; {>  %_5880~4':(_lst)◂(_p5852) %_5877~1':_r64 %_5876~0':_r64 %_5881~5':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_5882
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_5881 %_5882 } ⊢ { %_5883 %_5884 } : { %_5883 %_5884 }
 ; {>  %_5882~2':_r64 %_5880~4':(_lst)◂(_p5852) %_5877~1':_r64 %_5876~0':_r64 %_5881~5':_r64 }
	add r11,r8
; _f34 { %_5877 %_5884 } ⊢ { %_5885 %_5886 } : { %_5885 %_5886 }
 ; {>  %_5880~4':(_lst)◂(_p5852) %_5877~1':_r64 %_5876~0':_r64 %_5883~5':_r64 %_5884~2':_r64 }
	add r14,r8
; _f5854 %_5883 ⊢ %_5887 : %_5887
 ; {>  %_5885~1':_r64 %_5880~4':(_lst)◂(_p5852) %_5876~0':_r64 %_5886~2':_r64 %_5883~5':_r64 }
; _f5854 5' ⊢ °1◂5'
; _cns { %_5887 %_5880 } ⊢ %_5888 : %_5888
 ; {>  %_5885~1':_r64 %_5887~°1◂5':_p5852 %_5880~4':(_lst)◂(_p5852) %_5876~0':_r64 %_5886~2':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_5885 %_5888 } ⊢ %_5889 : %_5889
 ; {>  %_5885~1':_r64 %_5876~0':_r64 %_5886~2':_r64 %_5888~°0◂{ °1◂5' 4' }:(_lst)◂(_p5852) }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_5889
 ; {>  %_5889~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p5852) }) %_5876~0':_r64 %_5886~2':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_6072
	mov rdi,r13
	call dlt
LB_6072:
	bt r12,2
	jc LB_6073
	mov rdi,r8
	call dlt
LB_6073:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_6076
	btr r12,0
	jmp LB_6077
LB_6076:
	bts r12,0
LB_6077:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_6074
	btr QWORD [rdi],0
	jmp LB_6075
LB_6074:
	bts QWORD [rdi],0
LB_6075:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_6086
	btr r12,1
	jmp LB_6087
LB_6086:
	bts r12,1
LB_6087:
	mov rsi,1
	bt r12,1
	jc LB_6084
	mov rsi,0
	bt r14,0
	jc LB_6084
	jmp LB_6085
LB_6084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_6085:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_6082
	btr QWORD [rdi],0
	jmp LB_6083
LB_6082:
	bts QWORD [rdi],0
LB_6083:
	mov r14,r10
	bt r12,4
	jc LB_6090
	btr r12,1
	jmp LB_6091
LB_6090:
	bts r12,1
LB_6091:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_6088
	btr QWORD [rdi],1
	jmp LB_6089
LB_6088:
	bts QWORD [rdi],1
LB_6089:
	mov rsi,1
	bt r12,0
	jc LB_6080
	mov rsi,0
	bt r13,0
	jc LB_6080
	jmp LB_6081
LB_6080:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_6081:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_6078
	btr QWORD [rdi],1
	jmp LB_6079
LB_6078:
	bts QWORD [rdi],1
LB_6079:
	mov r8,0
	bts r12,2
	ret
MTC_LB_6053:
	mov r15,0
LB_6093:
	cmp r15,0
	jz LB_6094
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6093
LB_6094:
; » 0xr1 |~ {  } ⊢ %_5890 : %_5890
 ; {>  %_5877~1':_r64 %_5876~0':_r64 %_5878~2':(_lst)◂(_p5852) }
; 	» 0xr1 _ ⊢ 3' : %_5890
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f34 { %_5877 %_5890 } ⊢ { %_5891 %_5892 } : { %_5891 %_5892 }
 ; {>  %_5877~1':_r64 %_5876~0':_r64 %_5890~3':_r64 %_5878~2':(_lst)◂(_p5852) }
	add r14,r9
; _f5854 %_5892 ⊢ %_5893 : %_5893
 ; {>  %_5891~1':_r64 %_5876~0':_r64 %_5878~2':(_lst)◂(_p5852) %_5892~3':_r64 }
; _f5854 3' ⊢ °1◂3'
; _cns { %_5893 %_5878 } ⊢ %_5894 : %_5894
 ; {>  %_5891~1':_r64 %_5876~0':_r64 %_5878~2':(_lst)◂(_p5852) %_5893~°1◂3':_p5852 }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_5891 %_5894 } ⊢ %_5895 : %_5895
 ; {>  %_5891~1':_r64 %_5876~0':_r64 %_5894~°0◂{ °1◂3' 2' }:(_lst)◂(_p5852) }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_5895
 ; {>  %_5895~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p5852) }) %_5876~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_6095
	mov rdi,r13
	call dlt
LB_6095:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_6096
	btr r12,0
	jmp LB_6097
LB_6096:
	bts r12,0
LB_6097:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_6100
	btr r12,4
	jmp LB_6101
LB_6100:
	bts r12,4
LB_6101:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6098
	btr QWORD [rdi],0
	jmp LB_6099
LB_6098:
	bts QWORD [rdi],0
LB_6099:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_6110
	btr r12,1
	jmp LB_6111
LB_6110:
	bts r12,1
LB_6111:
	mov rsi,1
	bt r12,1
	jc LB_6108
	mov rsi,0
	bt r14,0
	jc LB_6108
	jmp LB_6109
LB_6108:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_6109:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_6106
	btr QWORD [rdi],0
	jmp LB_6107
LB_6106:
	bts QWORD [rdi],0
LB_6107:
	mov r14,r8
	bt r12,2
	jc LB_6114
	btr r12,1
	jmp LB_6115
LB_6114:
	bts r12,1
LB_6115:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_6112
	btr QWORD [rdi],1
	jmp LB_6113
LB_6112:
	bts QWORD [rdi],1
LB_6113:
	mov rsi,1
	bt r12,4
	jc LB_6104
	mov rsi,0
	bt r10,0
	jc LB_6104
	jmp LB_6105
LB_6104:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_6105:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6102
	btr QWORD [rdi],1
	jmp LB_6103
LB_6102:
	bts QWORD [rdi],1
LB_6103:
	mov r8,0
	bts r12,2
	ret
MTC_LB_6092:
LB_6116:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6118
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6117
LB_6118:
	add rsp,8
	ret
NS_E_5855_MTC_2_failed:
	add rsp,32
	pop r14
LB_6117:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6153
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_5896
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _nil {  } ⊢ %_5897 : %_5897
 ; {>  %_5896~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_5898 : %_5898
 ; {>  %_5897~°1◂{  }:(_lst)◂(t2622'(0)) %_5896~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_5898
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_5898 %_5897 } ⊢ %_5899 : %_5899
 ; {>  %_5898~1':_r64 %_5897~°1◂{  }:(_lst)◂(t2622'(0)) %_5896~0':_stg }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_5899
 ; {>  %_5896~0':_stg %_5899~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t2626'(0)) }) }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_6144
	mov rdi,r13
	call dlt
LB_6144:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_6147
	btr r12,0
	jmp LB_6148
LB_6147:
	bts r12,0
LB_6148:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_6145
	btr QWORD [rdi],0
	jmp LB_6146
LB_6145:
	bts QWORD [rdi],0
LB_6146:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_6151
	mov rsi,0
	bt r13,0
	jc LB_6151
	jmp LB_6152
LB_6151:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_6152:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_6149
	btr QWORD [rdi],1
	jmp LB_6150
LB_6149:
	bts QWORD [rdi],1
LB_6150:
	mov r8,0
	bts r12,2
	ret
LB_6153:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6155
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6154
LB_6155:
	add rsp,8
	ret
NS_E_5855_MTC_3_failed:
	add rsp,0
	pop r14
LB_6154:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5856:
NS_E_RDI_5856:
NS_E_5856_ETR_TBL:
NS_E_5856_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_6168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_6168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_6168
	jmp LB_6169
LB_6168:
	jmp NS_E_5856_MTC_0_failed
LB_6169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6161
	btr r12,0
	jmp LB_6162
LB_6161:
	bts r12,0
LB_6162:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6158
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_5900 : %_5900
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_5900
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_5900 ⊢ %_5901 : %_5901
 ; {>  %_5900~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5901
 ; {>  %_5901~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6156
	btr r12,3
	jmp LB_6157
LB_6156:
	bts r12,3
LB_6157:
	mov r8,0
	bts r12,2
	ret
LB_6158:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6160
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6159
LB_6160:
	add rsp,8
	ret
NS_E_5856_MTC_0_failed:
	add rsp,16
	pop r14
LB_6159:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_6188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_6188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_6188
	jmp LB_6189
LB_6188:
	jmp NS_E_5856_MTC_1_failed
LB_6189:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_5856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6193
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6194
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6194:
	jmp NS_E_5856_MTC_1_failed
LB_6193:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_5856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6199
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6200
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6200:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6201:
	jmp NS_E_5856_MTC_1_failed
LB_6199:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6181
	btr r12,2
	jmp LB_6182
LB_6181:
	bts r12,2
LB_6182:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6179
	btr r12,1
	jmp LB_6180
LB_6179:
	bts r12,1
LB_6180:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6177
	btr r12,0
	jmp LB_6178
LB_6177:
	bts r12,0
LB_6178:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6174
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6203
	btr r12,3
	jmp LB_6204
LB_6203:
	bts r12,3
LB_6204:
	mov r14,r8
	bt r12,2
	jc LB_6205
	btr r12,1
	jmp LB_6206
LB_6205:
	bts r12,1
LB_6206:
	mov r8,r13
	bt r12,0
	jc LB_6207
	btr r12,2
	jmp LB_6208
LB_6207:
	bts r12,2
LB_6208:
	mov r13,r9
	bt r12,3
	jc LB_6209
	btr r12,0
	jmp LB_6210
LB_6209:
	bts r12,0
LB_6210:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_5904 : %_5904
 ; {>  %_5902~0':_r64 %_5903~1':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_5904
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_5904 %_5902 } ⊢ { %_5905 %_5906 } : { %_5905 %_5906 }
 ; {>  %_5902~0':_r64 %_5904~2':_r64 %_5903~1':_r64 }
	add r8,r13
; _f34 { %_5905 %_5903 } ⊢ { %_5907 %_5908 } : { %_5907 %_5908 }
 ; {>  %_5905~2':_r64 %_5906~0':_r64 %_5903~1':_r64 }
	add r8,r14
; _some %_5907 ⊢ %_5909 : %_5909
 ; {>  %_5907~2':_r64 %_5906~0':_r64 %_5908~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_5909
 ; {>  %_5909~°0◂2':(_opn)◂(_r64) %_5906~0':_r64 %_5908~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_6170
	mov rdi,r13
	call dlt
LB_6170:
	bt r12,1
	jc LB_6171
	mov rdi,r14
	call dlt
LB_6171:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_6172
	btr r12,3
	jmp LB_6173
LB_6172:
	bts r12,3
LB_6173:
	mov r8,0
	bts r12,2
	ret
LB_6174:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6176
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6175
LB_6176:
	add rsp,8
	ret
NS_E_5856_MTC_1_failed:
	add rsp,48
	pop r14
LB_6175:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_5235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6225
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5856_MTC_2_failed
LB_6225:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_5856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6230
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6231
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6231:
	jmp NS_E_5856_MTC_2_failed
LB_6230:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6220
	btr r12,1
	jmp LB_6221
LB_6220:
	bts r12,1
LB_6221:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6218
	btr r12,0
	jmp LB_6219
LB_6218:
	bts r12,0
LB_6219:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6215
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_5912 : %_5912
 ; {>  %_5911~1':_r64 %_5910~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_5912
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_5912 %_5911 } ⊢ { %_5913 %_5914 } : { %_5913 %_5914 }
 ; {>  %_5911~1':_r64 %_5910~0':_r64 %_5912~2':_r64 }
	add r8,r14
; _some %_5913 ⊢ %_5915 : %_5915
 ; {>  %_5914~1':_r64 %_5910~0':_r64 %_5913~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_5915
 ; {>  %_5914~1':_r64 %_5910~0':_r64 %_5915~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_6211
	mov rdi,r14
	call dlt
LB_6211:
	bt r12,0
	jc LB_6212
	mov rdi,r13
	call dlt
LB_6212:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_6213
	btr r12,3
	jmp LB_6214
LB_6213:
	bts r12,3
LB_6214:
	mov r8,0
	bts r12,2
	ret
LB_6215:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6217
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6216
LB_6217:
	add rsp,8
	ret
NS_E_5856_MTC_2_failed:
	add rsp,32
	pop r14
LB_6216:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5857:
NS_E_RDI_5857:
NS_E_5857_ETR_TBL:
NS_E_5857_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_6245
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_6245
	jmp LB_6246
LB_6245:
	jmp NS_E_5857_MTC_0_failed
LB_6246:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6238
	btr r12,0
	jmp LB_6239
LB_6238:
	bts r12,0
LB_6239:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6235
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_5916 : %_5916
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_5916
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_5916 ⊢ %_5917 : %_5917
 ; {>  %_5916~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5917
 ; {>  %_5917~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6233
	btr r12,3
	jmp LB_6234
LB_6233:
	bts r12,3
LB_6234:
	mov r8,0
	bts r12,2
	ret
LB_6235:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6237
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6236
LB_6237:
	add rsp,8
	ret
NS_E_5857_MTC_0_failed:
	add rsp,16
	pop r14
LB_6236:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_5235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6261
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5857_MTC_1_failed
LB_6261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_5857_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6266
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6267
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6267:
	jmp NS_E_5857_MTC_1_failed
LB_6266:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6256
	btr r12,1
	jmp LB_6257
LB_6256:
	bts r12,1
LB_6257:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6254
	btr r12,0
	jmp LB_6255
LB_6254:
	bts r12,0
LB_6255:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6251
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_5920 : %_5920
 ; {>  %_5919~1':_r64 %_5918~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_5920
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_5920 %_5919 } ⊢ { %_5921 %_5922 } : { %_5921 %_5922 }
 ; {>  %_5919~1':_r64 %_5918~0':_r64 %_5920~2':_r64 }
	add r8,r14
; _some %_5921 ⊢ %_5923 : %_5923
 ; {>  %_5922~1':_r64 %_5921~2':_r64 %_5918~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_5923
 ; {>  %_5922~1':_r64 %_5918~0':_r64 %_5923~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_6247
	mov rdi,r14
	call dlt
LB_6247:
	bt r12,0
	jc LB_6248
	mov rdi,r13
	call dlt
LB_6248:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_6249
	btr r12,3
	jmp LB_6250
LB_6249:
	bts r12,3
LB_6250:
	mov r8,0
	bts r12,2
	ret
LB_6251:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6253
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6252
LB_6253:
	add rsp,8
	ret
NS_E_5857_MTC_1_failed:
	add rsp,32
	pop r14
LB_6252:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6291:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_6291:
MTC_LB_6292:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6293
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_6294
	bt QWORD [rax],0
	jc LB_6295
	btr r12,7
	jmp LB_6296
LB_6295:
	bts r12,7
LB_6296:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_6294:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_6299
	btr r12,8
	jmp LB_6300
LB_6299:
	bts r12,8
LB_6300:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_6297
	btr r12,5
	jmp LB_6298
LB_6297:
	bts r12,5
LB_6298:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_6303
	btr r12,8
	jmp LB_6304
LB_6303:
	bts r12,8
LB_6304:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_6301
	btr r12,6
	jmp LB_6302
LB_6301:
	bts r12,6
LB_6302:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6305:
	cmp r15,0
	jz LB_6306
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6305
LB_6306:
MTC_LB_6307:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6308
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_6309
	bt QWORD [rax],0
	jc LB_6310
	btr r12,7
	jmp LB_6311
LB_6310:
	bts r12,7
LB_6311:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_6309:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_6312
	btr r12,4
	jmp LB_6313
LB_6312:
	bts r12,4
LB_6313:
LB_6314:
	cmp r15,0
	jz LB_6315
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6314
LB_6315:
; _f36 %_6276 ⊢ { %_6277 %_6278 } : { %_6277 %_6278 }
 ; {>  %_6269~0':_stg %_6272~3':_r64 %_6270~1':_r64 %_6275~6':(_lst)◂(_p5852) %_6276~4':_r64 %_6271~2':_stg }
	mov r11,r10
	bts r12,5
; _f18 { %_6278 %_6269 %_6270 %_6271 %_6272 } ⊢ { %_6279 %_6280 %_6281 %_6282 %_6283 } : { %_6279 %_6280 %_6281 %_6282 %_6283 }
 ; {>  %_6269~0':_stg %_6277~4':_r64 %_6272~3':_r64 %_6270~1':_r64 %_6275~6':(_lst)◂(_p5852) %_6278~5':_r64 %_6271~2':_stg }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_6320
	btr r12,4
	jmp LB_6321
LB_6320:
	bts r12,4
LB_6321:
	mov r9,r8
	bt r12,2
	jc LB_6322
	btr r12,3
	jmp LB_6323
LB_6322:
	bts r12,3
LB_6323:
	mov r8,r14
	bt r12,1
	jc LB_6324
	btr r12,2
	jmp LB_6325
LB_6324:
	bts r12,2
LB_6325:
	mov r14,r13
	bt r12,0
	jc LB_6326
	btr r12,1
	jmp LB_6327
LB_6326:
	bts r12,1
LB_6327:
	mov r13,r11
	bt r12,5
	jc LB_6328
	btr r12,0
	jmp LB_6329
LB_6328:
	bts r12,0
LB_6329:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_6330
	btr r12,5
	jmp LB_6331
LB_6330:
	bts r12,5
LB_6331:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_6318
	btr r12,6
	jmp LB_6319
LB_6318:
	bts r12,6
LB_6319:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_6316
	btr r12,4
	jmp LB_6317
LB_6316:
	bts r12,4
LB_6317:
	add rsp,24
; _f6291 { %_6280 %_6281 %_6282 %_6283 %_6275 } ⊢ { %_6284 %_6285 } : { %_6284 %_6285 }
 ; {>  %_6282~3':_stg %_6281~2':_r64 %_6277~4':_r64 %_6275~6':(_lst)◂(_p5852) %_6283~5':_r64 %_6280~1':_stg %_6279~0':_r64 }
; _f6291 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_6336
	btr r12,0
	jmp LB_6337
LB_6336:
	bts r12,0
LB_6337:
	mov r14,r8
	bt r12,2
	jc LB_6338
	btr r12,1
	jmp LB_6339
LB_6338:
	bts r12,1
LB_6339:
	mov r8,r9
	bt r12,3
	jc LB_6340
	btr r12,2
	jmp LB_6341
LB_6340:
	bts r12,2
LB_6341:
	mov r9,r11
	bt r12,5
	jc LB_6342
	btr r12,3
	jmp LB_6343
LB_6342:
	bts r12,3
LB_6343:
	mov r10,rcx
	bt r12,6
	jc LB_6344
	btr r12,4
	jmp LB_6345
LB_6344:
	bts r12,4
LB_6345:
	call NS_E_6291
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_6346
	btr r12,2
	jmp LB_6347
LB_6346:
	bts r12,2
LB_6347:
	mov r14,r13
	bt r12,0
	jc LB_6348
	btr r12,1
	jmp LB_6349
LB_6348:
	bts r12,1
LB_6349:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_6334
	btr r12,4
	jmp LB_6335
LB_6334:
	bts r12,4
LB_6335:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6332
	btr r12,0
	jmp LB_6333
LB_6332:
	bts r12,0
LB_6333:
	add rsp,24
; ∎ { %_6284 %_6285 }
 ; {>  %_6277~4':_r64 %_6285~2':_stg %_6279~0':_r64 %_6284~1':_stg }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_6350
	mov rdi,r10
	call dlt
LB_6350:
	bt r12,0
	jc LB_6351
	mov rdi,r13
	call dlt
LB_6351:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_6352
	btr r12,0
	jmp LB_6353
LB_6352:
	bts r12,0
LB_6353:
	mov r14,r8
	bt r12,2
	jc LB_6354
	btr r12,1
	jmp LB_6355
LB_6354:
	bts r12,1
LB_6355:
	ret
MTC_LB_6308:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6356
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_6357
	bt QWORD [rax],0
	jc LB_6358
	btr r12,7
	jmp LB_6359
LB_6358:
	bts r12,7
LB_6359:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_6357:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_6360
	btr r12,4
	jmp LB_6361
LB_6360:
	bts r12,4
LB_6361:
LB_6362:
	cmp r15,0
	jz LB_6363
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6362
LB_6363:
; _f34 { %_6270 %_6286 } ⊢ { %_6287 %_6288 } : { %_6287 %_6288 }
 ; {>  %_6269~0':_stg %_6272~3':_r64 %_6270~1':_r64 %_6275~6':(_lst)◂(_p5852) %_6286~4':_r64 %_6271~2':_stg }
	add r14,r10
; _f6291 { %_6269 %_6287 %_6271 %_6272 %_6275 } ⊢ { %_6289 %_6290 } : { %_6289 %_6290 }
 ; {>  %_6269~0':_stg %_6272~3':_r64 %_6275~6':(_lst)◂(_p5852) %_6287~1':_r64 %_6288~4':_r64 %_6271~2':_stg }
; _f6291 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_6366
	btr r12,4
	jmp LB_6367
LB_6366:
	bts r12,4
LB_6367:
	call NS_E_6291
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_6364
	btr r12,4
	jmp LB_6365
LB_6364:
	bts r12,4
LB_6365:
	add rsp,16
; ∎ { %_6289 %_6290 }
 ; {>  %_6289~0':_stg %_6290~1':_stg %_6288~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_6368
	mov rdi,r10
	call dlt
LB_6368:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_6356:
MTC_LB_6293:
	mov r15,0
LB_6370:
	cmp r15,0
	jz LB_6371
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6370
LB_6371:
; ∎ { %_6269 %_6271 }
 ; {>  %_6269~0':_stg %_6272~3':_r64 %_6270~1':_r64 %_6273~4':(_lst)◂(_p5852) %_6271~2':_stg }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_6372
	mov rdi,r9
	call dlt
LB_6372:
	bt r12,1
	jc LB_6373
	mov rdi,r14
	call dlt
LB_6373:
	bt r12,4
	jc LB_6374
	mov rdi,r10
	call dlt
LB_6374:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_6375
	btr r12,1
	jmp LB_6376
LB_6375:
	bts r12,1
LB_6376:
	ret
MTC_LB_6369:
NS_E_6392:
; 	|» 0'
NS_E_RDI_6392:
; » 0xr0 |~ {  } ⊢ %_6378 : %_6378
 ; {>  %_6377~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_6378
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f5855 { %_6377 %_6378 } ⊢ { %_6379 %_6380 %_6381 } : { %_6379 %_6380 %_6381 }
 ; {>  %_6378~1':_r64 %_6377~0':_stg }
; _f5855 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_5855
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_6393
	btr r12,4
	jmp LB_6394
LB_6393:
	bts r12,4
LB_6394:
	mov r8,r9
	bt r12,3
	jc LB_6397
	btr r12,2
	jmp LB_6398
LB_6397:
	bts r12,2
LB_6398:
	mov rsi,1
	bt r12,2
	jc LB_6395
	mov rsi,0
	bt r8,0
	jc LB_6395
	jmp LB_6396
LB_6395:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_6396:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_6399:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6400
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
	jnc LB_6401
	bt QWORD [rax],0
	jc LB_6402
	btr r12,5
	jmp LB_6403
LB_6402:
	bts r12,5
LB_6403:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_6401:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_6406
	btr r12,6
	jmp LB_6407
LB_6406:
	bts r12,6
LB_6407:
	mov r9,rcx
	bt r12,6
	jc LB_6404
	btr r12,3
	jmp LB_6405
LB_6404:
	bts r12,3
LB_6405:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_6410
	btr r12,6
	jmp LB_6411
LB_6410:
	bts r12,6
LB_6411:
	mov r10,rcx
	bt r12,6
	jc LB_6408
	btr r12,4
	jmp LB_6409
LB_6408:
	bts r12,4
LB_6409:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6412:
	cmp r15,0
	jz LB_6413
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6412
LB_6413:
; _f14 %_6382 ⊢ { %_6384 %_6385 } : { %_6384 %_6385 }
 ; {>  %_6380~1':_r64 %_6379~0':_stg %_6383~4':(_lst)◂(_p5852) %_6382~3':_r64 }
; _f14 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_6420
	btr r12,0
	jmp LB_6421
LB_6420:
	bts r12,0
LB_6421:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_6422
	btr r12,2
	jmp LB_6423
LB_6422:
	bts r12,2
LB_6423:
	mov r9,r14
	bt r12,1
	jc LB_6424
	btr r12,3
	jmp LB_6425
LB_6424:
	bts r12,3
LB_6425:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_6418
	btr r12,4
	jmp LB_6419
LB_6418:
	bts r12,4
LB_6419:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6416
	btr r12,1
	jmp LB_6417
LB_6416:
	bts r12,1
LB_6417:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6414
	btr r12,0
	jmp LB_6415
LB_6414:
	bts r12,0
LB_6415:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_6386 : %_6386
 ; {>  %_6380~1':_r64 %_6379~0':_stg %_6384~2':_r64 %_6385~3':_stg %_6383~4':(_lst)◂(_p5852) }
; 	» 0xr0 _ ⊢ 5' : %_6386
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_6387 : %_6387
 ; {>  %_6380~1':_r64 %_6379~0':_stg %_6386~5':_r64 %_6384~2':_r64 %_6385~3':_stg %_6383~4':(_lst)◂(_p5852) }
; 	» 0xr0 _ ⊢ 6' : %_6387
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f6291 { %_6379 %_6386 %_6385 %_6387 %_6383 } ⊢ { %_6388 %_6389 } : { %_6388 %_6389 }
 ; {>  %_6380~1':_r64 %_6379~0':_stg %_6386~5':_r64 %_6384~2':_r64 %_6385~3':_stg %_6383~4':(_lst)◂(_p5852) %_6387~6':_r64 }
; _f6291 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_6430
	btr r12,1
	jmp LB_6431
LB_6430:
	bts r12,1
LB_6431:
	mov r8,r9
	bt r12,3
	jc LB_6432
	btr r12,2
	jmp LB_6433
LB_6432:
	bts r12,2
LB_6433:
	mov r9,rcx
	bt r12,6
	jc LB_6434
	btr r12,3
	jmp LB_6435
LB_6434:
	bts r12,3
LB_6435:
	call NS_E_6291
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_6436
	btr r12,3
	jmp LB_6437
LB_6436:
	bts r12,3
LB_6437:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_6428
	btr r12,2
	jmp LB_6429
LB_6428:
	bts r12,2
LB_6429:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_6426
	btr r12,1
	jmp LB_6427
LB_6426:
	bts r12,1
LB_6427:
	add rsp,24
; _some %_6389 ⊢ %_6390 : %_6390
 ; {>  %_6380~1':_r64 %_6384~2':_r64 %_6389~3':_stg %_6388~0':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_6388 %_6390 }
 ; {>  %_6380~1':_r64 %_6390~°0◂3':(_opn)◂(_stg) %_6384~2':_r64 %_6388~0':_stg }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_6438
	mov rdi,r14
	call dlt
LB_6438:
	bt r12,2
	jc LB_6439
	mov rdi,r8
	call dlt
LB_6439:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_6442
	btr r12,1
	jmp LB_6443
LB_6442:
	bts r12,1
LB_6443:
	mov rsi,1
	bt r12,1
	jc LB_6440
	mov rsi,0
	bt r14,0
	jc LB_6440
	jmp LB_6441
LB_6440:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_6441:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_6400:
	mov r15,0
LB_6445:
	cmp r15,0
	jz LB_6446
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6445
LB_6446:
; _none {  } ⊢ %_6391 : %_6391
 ; {>  %_6380~1':_r64 %_6379~0':_stg %_6381~2':(_opn)◂({ _r64 (_lst)◂(_p5852) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_6379 %_6391 }
 ; {>  %_6391~°1◂{  }:(_opn)◂(t2786'(0)) %_6380~1':_r64 %_6379~0':_stg %_6381~2':(_opn)◂({ _r64 (_lst)◂(_p5852) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_6447
	mov rdi,r14
	call dlt
LB_6447:
	bt r12,2
	jc LB_6448
	mov rdi,r8
	call dlt
LB_6448:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_6449
	mov rsi,0
	bt r14,0
	jc LB_6449
	jmp LB_6450
LB_6449:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_6450:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_6444:
NS_E_6456:
NS_E_RDI_6456:
; » _^ ..
	mov rax,51
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "##\n"
	mov rsi,0x_23
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "W"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "[# fdEF [# F #] jfioe 2 #]"
	mov rsi,0x_20_46_45_64_66_20_23_5b
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20_5d_23_20_46_20_23_5b
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_20_32_20_65_6f_69_66_6a
	mov QWORD [rdi+8*2],rsi
	mov rsi,0x_23
	mov BYTE [rdi+8*3+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*3+1],sil
	add rdi,26
; "FF## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_75_68_20_23_23_46_46
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_75_67_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+2],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+4],sil
	add rdi,21
; //
	mov r13,rax
	btr r12,0
; _f6392 %_6451 ⊢ { %_6452 %_6453 } : { %_6452 %_6453 }
 ; {>  %_6451~0':_stg }
; _f6392 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_6392
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_6452 %_6453 } ⊢ { %_6454 %_6455 } : { %_6454 %_6455 }
 ; {>  %_6452~0':_stg %_6453~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_6457
	btr r12,2
	jmp LB_6458
LB_6457:
	bts r12,2
LB_6458:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_6461
	btr r12,3
	jmp LB_6462
LB_6461:
	bts r12,3
LB_6462:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_6459
	btr QWORD [rdi],0
	jmp LB_6460
LB_6459:
	bts QWORD [rdi],0
LB_6460:
	mov r9,r14
	bt r12,1
	jc LB_6465
	btr r12,3
	jmp LB_6466
LB_6465:
	bts r12,3
LB_6466:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_6463
	btr QWORD [rdi],1
	jmp LB_6464
LB_6463:
	bts QWORD [rdi],1
LB_6464:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_6467
	btr r12,2
	jmp LB_6468
LB_6467:
	bts r12,2
LB_6468:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_6471
	btr r12,3
	jmp LB_6472
LB_6471:
	bts r12,3
LB_6472:
	mov r13,r9
	bt r12,3
	jc LB_6469
	btr r12,0
	jmp LB_6470
LB_6469:
	bts r12,0
LB_6470:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6475
	btr r12,3
	jmp LB_6476
LB_6475:
	bts r12,3
LB_6476:
	mov r14,r9
	bt r12,3
	jc LB_6473
	btr r12,1
	jmp LB_6474
LB_6473:
	bts r12,1
LB_6474:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_6454~0':_stg %_6455~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_6477
	mov rdi,r13
	call dlt
LB_6477:
	bt r12,1
	jc LB_6478
	mov rdi,r14
	call dlt
LB_6478:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_6480:
NS_E_RDI_6480:
NS_E_6480_ETR_TBL:
NS_E_6480_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6497
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6480_MTC_0_failed
LB_6497:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_6505
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6505
	jmp LB_6506
LB_6505:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6503
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6503:
	jmp NS_E_6480_MTC_0_failed
LB_6506:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_6480_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6510
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6511
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6511:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6512
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6512:
	jmp NS_E_6480_MTC_0_failed
LB_6510:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6490
	btr QWORD [rdi],2
LB_6490:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6491
	btr QWORD [rdi],1
LB_6491:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6492
	btr QWORD [rdi],0
LB_6492:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6480_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6488
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6480_MTC_1_failed
LB_6488:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6483
	btr QWORD [rdi],0
LB_6483:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6480_MTC_1_failed:
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
NS_E_6515:
NS_E_RDI_6515:
NS_E_6515_ETR_TBL:
NS_E_6515_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_5237_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6539
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6515_MTC_0_failed
LB_6539:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_6547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_6547
	jmp LB_6548
LB_6547:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6545
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6545:
	jmp NS_E_6515_MTC_0_failed
LB_6548:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6533
	btr QWORD [rdi],1
LB_6533:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6534
	btr QWORD [rdi],0
LB_6534:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6515_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_5308_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6531
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6515_MTC_1_failed
LB_6531:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6526
	btr QWORD [rdi],0
LB_6526:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6515_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_6480_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6524
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6515_MTC_2_failed
LB_6524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6519
	btr QWORD [rdi],0
LB_6519:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6515_MTC_2_failed:
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
NS_E_6550:
NS_E_RDI_6550:
NS_E_6550_ETR_TBL:
NS_E_6550_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_6552_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6622
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6550_MTC_0_failed
LB_6622:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_6550_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6627
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6628
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6628:
	jmp NS_E_6550_MTC_0_failed
LB_6627:
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
	jc LB_6616
	btr QWORD [rdi],1
LB_6616:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6617
	btr QWORD [rdi],0
LB_6617:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6550_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6550_MTC_1_failed:
	add rsp,0
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
NS_E_6552:
NS_E_RDI_6552:
NS_E_6552_ETR_TBL:
NS_E_6552_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_6833
LB_6832:
	add r14,1
LB_6833:
	cmp r14,r10
	jge LB_6834
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6832
	cmp al,10
	jz LB_6832
	cmp al,32
	jz LB_6832
LB_6834:
	add r14,4
	cmp r14,r10
	jg LB_6837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_6837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_6837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_6837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_6837
	jmp LB_6838
LB_6837:
	jmp NS_E_6552_MTC_0_failed
LB_6838:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6840
LB_6839:
	add r14,1
LB_6840:
	cmp r14,r10
	jge LB_6841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6839
	cmp al,10
	jz LB_6839
	cmp al,32
	jz LB_6839
LB_6841:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6842
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6843:
	jmp NS_E_6552_MTC_0_failed
LB_6842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_6846
LB_6845:
	add r14,1
LB_6846:
	cmp r14,r10
	jge LB_6847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6845
	cmp al,10
	jz LB_6845
	cmp al,32
	jz LB_6845
LB_6847:
	add r14,1
	cmp r14,r10
	jg LB_6852
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6852
	jmp LB_6853
LB_6852:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6849
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6849:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6850:
	jmp NS_E_6552_MTC_0_failed
LB_6853:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_6855
LB_6854:
	add r14,1
LB_6855:
	cmp r14,r10
	jge LB_6856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6854
	cmp al,10
	jz LB_6854
	cmp al,32
	jz LB_6854
LB_6856:
	push r10
	call NS_E_6556_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6857
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6858
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6858:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6859
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6859:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6860
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6860:
	jmp NS_E_6552_MTC_0_failed
LB_6857:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6827
	btr QWORD [rdi],3
LB_6827:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6828
	btr QWORD [rdi],2
LB_6828:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6829
	btr QWORD [rdi],1
LB_6829:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6830
	btr QWORD [rdi],0
LB_6830:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6552_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_6798
LB_6797:
	add r14,1
LB_6798:
	cmp r14,r10
	jge LB_6799
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6797
	cmp al,10
	jz LB_6797
	cmp al,32
	jz LB_6797
LB_6799:
	add r14,4
	cmp r14,r10
	jg LB_6802
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_6802
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_6802
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_6802
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_6802
	jmp LB_6803
LB_6802:
	jmp NS_E_6552_MTC_1_failed
LB_6803:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6805
LB_6804:
	add r14,1
LB_6805:
	cmp r14,r10
	jge LB_6806
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6804
	cmp al,10
	jz LB_6804
	cmp al,32
	jz LB_6804
LB_6806:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6807
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6808
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6808:
	jmp NS_E_6552_MTC_1_failed
LB_6807:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_6811
LB_6810:
	add r14,1
LB_6811:
	cmp r14,r10
	jge LB_6812
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6810
	cmp al,10
	jz LB_6810
	cmp al,32
	jz LB_6810
LB_6812:
	push r10
	call NS_E_6550_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6813
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6814
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6814:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6815:
	jmp NS_E_6552_MTC_1_failed
LB_6813:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_6818
LB_6817:
	add r14,1
LB_6818:
	cmp r14,r10
	jge LB_6819
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6817
	cmp al,10
	jz LB_6817
	cmp al,32
	jz LB_6817
LB_6819:
	add r14,6
	cmp r14,r10
	jg LB_6825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_6825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_6825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_6825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_6825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_6825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_6825
	jmp LB_6826
LB_6825:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6821
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6821:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6822
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6822:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6823
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6823:
	jmp NS_E_6552_MTC_1_failed
LB_6826:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6792
	btr QWORD [rdi],3
LB_6792:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6793
	btr QWORD [rdi],2
LB_6793:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6794
	btr QWORD [rdi],1
LB_6794:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6795
	btr QWORD [rdi],0
LB_6795:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6552_MTC_1_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_6763
LB_6762:
	add r14,1
LB_6763:
	cmp r14,r10
	jge LB_6764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6762
	cmp al,10
	jz LB_6762
	cmp al,32
	jz LB_6762
LB_6764:
	add r14,2
	cmp r14,r10
	jg LB_6767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_6767
	jmp LB_6768
LB_6767:
	jmp NS_E_6552_MTC_2_failed
LB_6768:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6770
LB_6769:
	add r14,1
LB_6770:
	cmp r14,r10
	jge LB_6771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6769
	cmp al,10
	jz LB_6769
	cmp al,32
	jz LB_6769
LB_6771:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6772
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6773
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6773:
	jmp NS_E_6552_MTC_2_failed
LB_6772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_6776
LB_6775:
	add r14,1
LB_6776:
	cmp r14,r10
	jge LB_6777
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6775
	cmp al,10
	jz LB_6775
	cmp al,32
	jz LB_6775
LB_6777:
	add r14,1
	cmp r14,r10
	jg LB_6782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6782
	jmp LB_6783
LB_6782:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6779
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6779:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6780:
	jmp NS_E_6552_MTC_2_failed
LB_6783:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_6785
LB_6784:
	add r14,1
LB_6785:
	cmp r14,r10
	jge LB_6786
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6784
	cmp al,10
	jz LB_6784
	cmp al,32
	jz LB_6784
LB_6786:
	push r10
	call NS_E_6554_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6787
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6788
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6788:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6789
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6789:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6790
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6790:
	jmp NS_E_6552_MTC_2_failed
LB_6787:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6757
	btr QWORD [rdi],3
LB_6757:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6758
	btr QWORD [rdi],2
LB_6758:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6759
	btr QWORD [rdi],1
LB_6759:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6760
	btr QWORD [rdi],0
LB_6760:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6552_MTC_2_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_6728
LB_6727:
	add r14,1
LB_6728:
	cmp r14,r10
	jge LB_6729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6727
	cmp al,10
	jz LB_6727
	cmp al,32
	jz LB_6727
LB_6729:
	add r14,2
	cmp r14,r10
	jg LB_6732
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6732
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_6732
	jmp LB_6733
LB_6732:
	jmp NS_E_6552_MTC_3_failed
LB_6733:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6735
LB_6734:
	add r14,1
LB_6735:
	cmp r14,r10
	jge LB_6736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6734
	cmp al,10
	jz LB_6734
	cmp al,32
	jz LB_6734
LB_6736:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6737
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6738
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6738:
	jmp NS_E_6552_MTC_3_failed
LB_6737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_6741
LB_6740:
	add r14,1
LB_6741:
	cmp r14,r10
	jge LB_6742
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6740
	cmp al,10
	jz LB_6740
	cmp al,32
	jz LB_6740
LB_6742:
	add r14,2
	cmp r14,r10
	jg LB_6747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_6747
	jmp LB_6748
LB_6747:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6744
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6744:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6745
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6745:
	jmp NS_E_6552_MTC_3_failed
LB_6748:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_6750
LB_6749:
	add r14,1
LB_6750:
	cmp r14,r10
	jge LB_6751
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6749
	cmp al,10
	jz LB_6749
	cmp al,32
	jz LB_6749
LB_6751:
	push r10
	call NS_E_6562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6752
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6753
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6753:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6754
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6754:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6755
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6755:
	jmp NS_E_6552_MTC_3_failed
LB_6752:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6722
	btr QWORD [rdi],3
LB_6722:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6723
	btr QWORD [rdi],2
LB_6723:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6724
	btr QWORD [rdi],1
LB_6724:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6725
	btr QWORD [rdi],0
LB_6725:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6552_MTC_3_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_6695
LB_6694:
	add r14,1
LB_6695:
	cmp r14,r10
	jge LB_6696
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6694
	cmp al,10
	jz LB_6694
	cmp al,32
	jz LB_6694
LB_6696:
	add r14,2
	cmp r14,r10
	jg LB_6699
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6699
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_6699
	jmp LB_6700
LB_6699:
	jmp NS_E_6552_MTC_4_failed
LB_6700:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6702
LB_6701:
	add r14,1
LB_6702:
	cmp r14,r10
	jge LB_6703
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6701
	cmp al,10
	jz LB_6701
	cmp al,32
	jz LB_6701
LB_6703:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6704
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6705:
	jmp NS_E_6552_MTC_4_failed
LB_6704:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_6708
LB_6707:
	add r14,1
LB_6708:
	cmp r14,r10
	jge LB_6709
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6707
	cmp al,10
	jz LB_6707
	cmp al,32
	jz LB_6707
LB_6709:
	push r10
	call NS_E_6574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6710
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6711
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6711:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6712
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6712:
	jmp NS_E_6552_MTC_4_failed
LB_6710:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_6715
LB_6714:
	add r14,1
LB_6715:
	cmp r14,r10
	jge LB_6716
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6714
	cmp al,10
	jz LB_6714
	cmp al,32
	jz LB_6714
LB_6716:
	push r10
	call NS_E_6562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6717
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6718
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6718:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6719
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6719:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6720
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6720:
	jmp NS_E_6552_MTC_4_failed
LB_6717:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6689
	btr QWORD [rdi],3
LB_6689:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6690
	btr QWORD [rdi],2
LB_6690:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6691
	btr QWORD [rdi],1
LB_6691:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6692
	btr QWORD [rdi],0
LB_6692:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0400_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6552_MTC_4_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_6660
LB_6659:
	add r14,1
LB_6660:
	cmp r14,r10
	jge LB_6661
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6659
	cmp al,10
	jz LB_6659
	cmp al,32
	jz LB_6659
LB_6661:
	add r14,2
	cmp r14,r10
	jg LB_6664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_6664
	jmp LB_6665
LB_6664:
	jmp NS_E_6552_MTC_5_failed
LB_6665:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6667
LB_6666:
	add r14,1
LB_6667:
	cmp r14,r10
	jge LB_6668
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6666
	cmp al,10
	jz LB_6666
	cmp al,32
	jz LB_6666
LB_6668:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6669
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6670
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6670:
	jmp NS_E_6552_MTC_5_failed
LB_6669:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_6673
LB_6672:
	add r14,1
LB_6673:
	cmp r14,r10
	jge LB_6674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6672
	cmp al,10
	jz LB_6672
	cmp al,32
	jz LB_6672
LB_6674:
	add r14,1
	cmp r14,r10
	jg LB_6679
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6679
	jmp LB_6680
LB_6679:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6676
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6676:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6677
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6677:
	jmp NS_E_6552_MTC_5_failed
LB_6680:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_6682
LB_6681:
	add r14,1
LB_6682:
	cmp r14,r10
	jge LB_6683
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6681
	cmp al,10
	jz LB_6681
	cmp al,32
	jz LB_6681
LB_6683:
	push r10
	call NS_E_6556_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6684
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6685
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6685:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6686
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6686:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6687
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6687:
	jmp NS_E_6552_MTC_5_failed
LB_6684:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6654
	btr QWORD [rdi],3
LB_6654:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6655
	btr QWORD [rdi],2
LB_6655:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6656
	btr QWORD [rdi],1
LB_6656:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6657
	btr QWORD [rdi],0
LB_6657:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0500_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6552_MTC_5_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_6635
LB_6634:
	add r14,1
LB_6635:
	cmp r14,r10
	jge LB_6636
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6634
	cmp al,10
	jz LB_6634
	cmp al,32
	jz LB_6634
LB_6636:
	add r14,2
	cmp r14,r10
	jg LB_6639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_6639
	jmp LB_6640
LB_6639:
	jmp NS_E_6552_MTC_6_failed
LB_6640:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6642
LB_6641:
	add r14,1
LB_6642:
	cmp r14,r10
	jge LB_6643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6641
	cmp al,10
	jz LB_6641
	cmp al,32
	jz LB_6641
LB_6643:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6644
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6645
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6645:
	jmp NS_E_6552_MTC_6_failed
LB_6644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_6648
LB_6647:
	add r14,1
LB_6648:
	cmp r14,r10
	jge LB_6649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6647
	cmp al,10
	jz LB_6647
	cmp al,32
	jz LB_6647
LB_6649:
	push r10
	call NS_E_6558_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6650
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6651
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6651:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6652
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6652:
	jmp NS_E_6552_MTC_6_failed
LB_6650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6630
	btr QWORD [rdi],2
LB_6630:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6631
	btr QWORD [rdi],1
LB_6631:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6632
	btr QWORD [rdi],0
LB_6632:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0600_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6552_MTC_6_failed:
	add rsp,48
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
NS_E_6554:
NS_E_RDI_6554:
NS_E_6554_ETR_TBL:
NS_E_6554_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_5237_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6882
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6554_MTC_0_failed
LB_6882:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_6890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_6890
	jmp LB_6891
LB_6890:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6888
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6888:
	jmp NS_E_6554_MTC_0_failed
LB_6891:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6876
	btr QWORD [rdi],1
LB_6876:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6877
	btr QWORD [rdi],0
LB_6877:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6554_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_5308_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6874
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6554_MTC_1_failed
LB_6874:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6869
	btr QWORD [rdi],0
LB_6869:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6554_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_6556_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6867
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6554_MTC_2_failed
LB_6867:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6862
	btr QWORD [rdi],0
LB_6862:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6554_MTC_2_failed:
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
NS_E_6556:
NS_E_RDI_6556:
NS_E_6556_ETR_TBL:
NS_E_6556_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	push r10
	call NS_E_5797_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6937
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6556_MTC_0_failed
LB_6937:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_6945
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6945
	jmp LB_6946
LB_6945:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6943
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6943:
	jmp NS_E_6556_MTC_0_failed
LB_6946:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_6556_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6950
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6951
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6951:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6952
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6952:
	jmp NS_E_6556_MTC_0_failed
LB_6950:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6930
	btr QWORD [rdi],2
LB_6930:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6931
	btr QWORD [rdi],1
LB_6931:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6932
	btr QWORD [rdi],0
LB_6932:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6556_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6913
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6556_MTC_1_failed
LB_6913:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_6921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6921
	jmp LB_6922
LB_6921:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6919
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6919:
	jmp NS_E_6556_MTC_1_failed
LB_6922:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_6556_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6926
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6927
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6927:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6928
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6928:
	jmp NS_E_6556_MTC_1_failed
LB_6926:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6906
	btr QWORD [rdi],2
LB_6906:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6907
	btr QWORD [rdi],1
LB_6907:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6908
	btr QWORD [rdi],0
LB_6908:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6556_MTC_1_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6904
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6556_MTC_2_failed
LB_6904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6899
	btr QWORD [rdi],0
LB_6899:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6556_MTC_2_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_5797_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6897
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6556_MTC_3_failed
LB_6897:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6892
	btr QWORD [rdi],0
LB_6892:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6556_MTC_3_failed:
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
NS_E_6558:
NS_E_RDI_6558:
NS_E_6558_ETR_TBL:
NS_E_6558_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_6966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6966
	jmp LB_6967
LB_6966:
	jmp NS_E_6558_MTC_0_failed
LB_6967:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6971
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6972:
	jmp NS_E_6558_MTC_0_failed
LB_6971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_6981
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6981
	jmp LB_6982
LB_6981:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6978
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6978:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6979
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6979:
	jmp NS_E_6558_MTC_0_failed
LB_6982:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_6566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6986
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6987
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6987:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6988
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6988:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6989:
	jmp NS_E_6558_MTC_0_failed
LB_6986:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_6560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6994
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6995
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6995:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6996
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6996:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6997
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6997:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6998
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6998:
	jmp NS_E_6558_MTC_0_failed
LB_6994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_6560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7003
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_7004
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_7004:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7005
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7005:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7006
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7006:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7007
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7007:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7008
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7008:
	jmp NS_E_6558_MTC_0_failed
LB_7003:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6954
	btr QWORD [rdi],5
LB_6954:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6955
	btr QWORD [rdi],4
LB_6955:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6956
	btr QWORD [rdi],3
LB_6956:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6957
	btr QWORD [rdi],2
LB_6957:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6958
	btr QWORD [rdi],1
LB_6958:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6959
	btr QWORD [rdi],0
LB_6959:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,96
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6558_MTC_0_failed:
	add rsp,96
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
NS_E_6560:
NS_E_RDI_6560:
NS_E_6560_ETR_TBL:
NS_E_6560_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_7018
LB_7017:
	add r14,1
LB_7018:
	cmp r14,r10
	jge LB_7019
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7017
	cmp al,10
	jz LB_7017
	cmp al,32
	jz LB_7017
LB_7019:
	add r14,3
	cmp r14,r10
	jg LB_7022
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7022
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7022
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_7022
	jmp LB_7023
LB_7022:
	jmp NS_E_6560_MTC_0_failed
LB_7023:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_7025
LB_7024:
	add r14,1
LB_7025:
	cmp r14,r10
	jge LB_7026
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7024
	cmp al,10
	jz LB_7024
	cmp al,32
	jz LB_7024
LB_7026:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7027
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7028
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7028:
	jmp NS_E_6560_MTC_0_failed
LB_7027:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_7031
LB_7030:
	add r14,1
LB_7031:
	cmp r14,r10
	jge LB_7032
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7030
	cmp al,10
	jz LB_7030
	cmp al,32
	jz LB_7030
LB_7032:
	add r14,1
	cmp r14,r10
	jg LB_7037
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_7037
	jmp LB_7038
LB_7037:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7034
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7034:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7035:
	jmp NS_E_6560_MTC_0_failed
LB_7038:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_7040
LB_7039:
	add r14,1
LB_7040:
	cmp r14,r10
	jge LB_7041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7039
	cmp al,10
	jz LB_7039
	cmp al,32
	jz LB_7039
LB_7041:
	push r10
	call NS_E_6566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7042
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7043
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7043:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7044
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7044:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7045:
	jmp NS_E_6560_MTC_0_failed
LB_7042:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_7048
LB_7047:
	add r14,1
LB_7048:
	cmp r14,r10
	jge LB_7049
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7047
	cmp al,10
	jz LB_7047
	cmp al,32
	jz LB_7047
LB_7049:
	push r10
	call NS_E_6560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7050
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7051
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7051:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7052
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7052:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7053
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7053:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7054
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7054:
	jmp NS_E_6560_MTC_0_failed
LB_7050:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7011
	btr QWORD [rdi],4
LB_7011:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7012
	btr QWORD [rdi],3
LB_7012:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7013
	btr QWORD [rdi],2
LB_7013:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7014
	btr QWORD [rdi],1
LB_7014:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7015
	btr QWORD [rdi],0
LB_7015:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6560_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6560_MTC_1_failed:
	add rsp,0
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
NS_E_6562:
NS_E_RDI_6562:
NS_E_6562_ETR_TBL:
NS_E_6562_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_7123
LB_7122:
	add r14,1
LB_7123:
	cmp r14,r10
	jge LB_7124
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7122
	cmp al,10
	jz LB_7122
	cmp al,32
	jz LB_7122
LB_7124:
	push r10
	call NS_E_6556_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7125
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6562_MTC_0_failed
LB_7125:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_7128
LB_7127:
	add r14,1
LB_7128:
	cmp r14,r10
	jge LB_7129
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7127
	cmp al,10
	jz LB_7127
	cmp al,32
	jz LB_7127
LB_7129:
	push r10
	call NS_E_6574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7130
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7131
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7131:
	jmp NS_E_6562_MTC_0_failed
LB_7130:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7134
LB_7133:
	add r14,1
LB_7134:
	cmp r14,r10
	jge LB_7135
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7133
	cmp al,10
	jz LB_7133
	cmp al,32
	jz LB_7133
LB_7135:
	add r14,3
	cmp r14,r10
	jg LB_7140
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7140
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7140
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7140
	jmp LB_7141
LB_7140:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7137
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7137:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7138
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7138:
	jmp NS_E_6562_MTC_0_failed
LB_7141:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_7143
LB_7142:
	add r14,1
LB_7143:
	cmp r14,r10
	jge LB_7144
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7142
	cmp al,10
	jz LB_7142
	cmp al,32
	jz LB_7142
LB_7144:
	push r10
	call NS_E_6574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7145
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7146
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7146:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7147
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7147:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7148
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7148:
	jmp NS_E_6562_MTC_0_failed
LB_7145:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7117
	btr QWORD [rdi],3
LB_7117:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7118
	btr QWORD [rdi],2
LB_7118:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7119
	btr QWORD [rdi],1
LB_7119:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7120
	btr QWORD [rdi],0
LB_7120:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6562_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_7079
LB_7078:
	add r14,1
LB_7079:
	cmp r14,r10
	jge LB_7080
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7078
	cmp al,10
	jz LB_7078
	cmp al,32
	jz LB_7078
LB_7080:
	add r14,1
	cmp r14,r10
	jg LB_7083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_7083
	jmp LB_7084
LB_7083:
	jmp NS_E_6562_MTC_1_failed
LB_7084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_7086
LB_7085:
	add r14,1
LB_7086:
	cmp r14,r10
	jge LB_7087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7085
	cmp al,10
	jz LB_7085
	cmp al,32
	jz LB_7085
LB_7087:
	push r10
	call NS_E_6574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7088
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7089
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7089:
	jmp NS_E_6562_MTC_1_failed
LB_7088:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7092
LB_7091:
	add r14,1
LB_7092:
	cmp r14,r10
	jge LB_7093
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7091
	cmp al,10
	jz LB_7091
	cmp al,32
	jz LB_7091
LB_7093:
	add r14,3
	cmp r14,r10
	jg LB_7098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7098
	jmp LB_7099
LB_7098:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7095
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7095:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7096
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7096:
	jmp NS_E_6562_MTC_1_failed
LB_7099:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_7101
LB_7100:
	add r14,1
LB_7101:
	cmp r14,r10
	jge LB_7102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7100
	cmp al,10
	jz LB_7100
	cmp al,32
	jz LB_7100
LB_7102:
	push r10
	call NS_E_6574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7103
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7104
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7104:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7105
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7105:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7106
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7106:
	jmp NS_E_6562_MTC_1_failed
LB_7103:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
	jmp LB_7109
LB_7108:
	add r14,1
LB_7109:
	cmp r14,r10
	jge LB_7110
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7108
	cmp al,10
	jz LB_7108
	cmp al,32
	jz LB_7108
LB_7110:
	push r10
	call NS_E_6564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7111
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7112
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7112:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7113
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7113:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7114
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7114:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7115
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7115:
	jmp NS_E_6562_MTC_1_failed
LB_7111:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7072
	btr QWORD [rdi],4
LB_7072:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7073
	btr QWORD [rdi],3
LB_7073:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7074
	btr QWORD [rdi],2
LB_7074:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7075
	btr QWORD [rdi],1
LB_7075:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7076
	btr QWORD [rdi],0
LB_7076:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6562_MTC_1_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_7060
LB_7059:
	add r14,1
LB_7060:
	cmp r14,r10
	jge LB_7061
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7059
	cmp al,10
	jz LB_7059
	cmp al,32
	jz LB_7059
LB_7061:
	add r14,3
	cmp r14,r10
	jg LB_7064
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7064
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7064
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_7064
	jmp LB_7065
LB_7064:
	jmp NS_E_6562_MTC_2_failed
LB_7065:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_7067
LB_7066:
	add r14,1
LB_7067:
	cmp r14,r10
	jge LB_7068
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7066
	cmp al,10
	jz LB_7066
	cmp al,32
	jz LB_7066
LB_7068:
	push r10
	call NS_E_6574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7069
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7070:
	jmp NS_E_6562_MTC_2_failed
LB_7069:
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
	jc LB_7056
	btr QWORD [rdi],1
LB_7056:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7057
	btr QWORD [rdi],0
LB_7057:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6562_MTC_2_failed:
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
NS_E_6564:
NS_E_RDI_6564:
NS_E_6564_ETR_TBL:
NS_E_6564_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_7154
LB_7153:
	add r14,1
LB_7154:
	cmp r14,r10
	jge LB_7155
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7153
	cmp al,10
	jz LB_7153
	cmp al,32
	jz LB_7153
LB_7155:
	add r14,1
	cmp r14,r10
	jg LB_7158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_7158
	jmp LB_7159
LB_7158:
	jmp NS_E_6564_MTC_0_failed
LB_7159:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_7161
LB_7160:
	add r14,1
LB_7161:
	cmp r14,r10
	jge LB_7162
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7160
	cmp al,10
	jz LB_7160
	cmp al,32
	jz LB_7160
LB_7162:
	push r10
	call NS_E_6574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7163
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7164
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7164:
	jmp NS_E_6564_MTC_0_failed
LB_7163:
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
	jc LB_7150
	btr QWORD [rdi],1
LB_7150:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7151
	btr QWORD [rdi],0
LB_7151:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6564_MTC_0_failed:
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
NS_E_6566:
NS_E_RDI_6566:
NS_E_6566_ETR_TBL:
NS_E_6566_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_6568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7171
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6566_MTC_0_failed
LB_7171:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7166
	btr QWORD [rdi],0
LB_7166:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6566_MTC_0_failed:
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
NS_E_6568:
NS_E_RDI_6568:
NS_E_6568_ETR_TBL:
NS_E_6568_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_7185
LB_7184:
	add r14,1
LB_7185:
	cmp r14,r10
	jge LB_7186
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7184
	cmp al,10
	jz LB_7184
	cmp al,32
	jz LB_7184
LB_7186:
	push r10
	call NS_E_6570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7187
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6568_MTC_0_failed
LB_7187:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_7190
LB_7189:
	add r14,1
LB_7190:
	cmp r14,r10
	jge LB_7191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7189
	cmp al,10
	jz LB_7189
	cmp al,32
	jz LB_7189
LB_7191:
	add r14,3
	cmp r14,r10
	jg LB_7195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_7195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_7195
	jmp LB_7196
LB_7195:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7193
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7193:
	jmp NS_E_6568_MTC_0_failed
LB_7196:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_7198
LB_7197:
	add r14,1
LB_7198:
	cmp r14,r10
	jge LB_7199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7197
	cmp al,10
	jz LB_7197
	cmp al,32
	jz LB_7197
LB_7199:
	push r10
	call NS_E_6568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7200
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7201
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7201:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7202
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7202:
	jmp NS_E_6568_MTC_0_failed
LB_7200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7180
	btr QWORD [rdi],2
LB_7180:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7181
	btr QWORD [rdi],1
LB_7181:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7182
	btr QWORD [rdi],0
LB_7182:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6568_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_7176
LB_7175:
	add r14,1
LB_7176:
	cmp r14,r10
	jge LB_7177
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7175
	cmp al,10
	jz LB_7175
	cmp al,32
	jz LB_7175
LB_7177:
	push r10
	call NS_E_6570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7178
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6568_MTC_1_failed
LB_7178:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7173
	btr QWORD [rdi],0
LB_7173:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6568_MTC_1_failed:
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
NS_E_6570:
NS_E_RDI_6570:
NS_E_6570_ETR_TBL:
NS_E_6570_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_7216
LB_7215:
	add r14,1
LB_7216:
	cmp r14,r10
	jge LB_7217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7215
	cmp al,10
	jz LB_7215
	cmp al,32
	jz LB_7215
LB_7217:
	push r10
	call NS_E_6572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7218
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6570_MTC_0_failed
LB_7218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_7221
LB_7220:
	add r14,1
LB_7221:
	cmp r14,r10
	jge LB_7222
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7220
	cmp al,10
	jz LB_7220
	cmp al,32
	jz LB_7220
LB_7222:
	add r14,3
	cmp r14,r10
	jg LB_7226
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7226
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_7226
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_7226
	jmp LB_7227
LB_7226:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7224:
	jmp NS_E_6570_MTC_0_failed
LB_7227:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_7229
LB_7228:
	add r14,1
LB_7229:
	cmp r14,r10
	jge LB_7230
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7228
	cmp al,10
	jz LB_7228
	cmp al,32
	jz LB_7228
LB_7230:
	push r10
	call NS_E_6572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7231
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7232
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7232:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7233
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7233:
	jmp NS_E_6570_MTC_0_failed
LB_7231:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7211
	btr QWORD [rdi],2
LB_7211:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7212
	btr QWORD [rdi],1
LB_7212:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7213
	btr QWORD [rdi],0
LB_7213:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6570_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_7207
LB_7206:
	add r14,1
LB_7207:
	cmp r14,r10
	jge LB_7208
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7206
	cmp al,10
	jz LB_7206
	cmp al,32
	jz LB_7206
LB_7208:
	push r10
	call NS_E_6572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7209
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6570_MTC_1_failed
LB_7209:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7204
	btr QWORD [rdi],0
LB_7204:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6570_MTC_1_failed:
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
NS_E_6572:
NS_E_RDI_6572:
NS_E_6572_ETR_TBL:
NS_E_6572_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7240
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6572_MTC_0_failed
LB_7240:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7235
	btr QWORD [rdi],0
LB_7235:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6572_MTC_0_failed:
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
NS_E_6574:
NS_E_RDI_6574:
NS_E_6574_ETR_TBL:
NS_E_6574_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_7254
LB_7253:
	add r14,1
LB_7254:
	cmp r14,r10
	jge LB_7255
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7253
	cmp al,10
	jz LB_7253
	cmp al,32
	jz LB_7253
LB_7255:
	add r14,1
	cmp r14,r10
	jg LB_7258
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_7258
	jmp LB_7259
LB_7258:
	jmp NS_E_6574_MTC_0_failed
LB_7259:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_7261
LB_7260:
	add r14,1
LB_7261:
	cmp r14,r10
	jge LB_7262
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7260
	cmp al,10
	jz LB_7260
	cmp al,32
	jz LB_7260
LB_7262:
	push r10
	call NS_E_6576_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7263
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7264
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7264:
	jmp NS_E_6574_MTC_0_failed
LB_7263:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_7267
LB_7266:
	add r14,1
LB_7267:
	cmp r14,r10
	jge LB_7268
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7266
	cmp al,10
	jz LB_7266
	cmp al,32
	jz LB_7266
LB_7268:
	add r14,1
	cmp r14,r10
	jg LB_7273
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_7273
	jmp LB_7274
LB_7273:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7270
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7270:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7271
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7271:
	jmp NS_E_6574_MTC_0_failed
LB_7274:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7249
	btr QWORD [rdi],2
LB_7249:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7250
	btr QWORD [rdi],1
LB_7250:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7251
	btr QWORD [rdi],0
LB_7251:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6574_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_7245
LB_7244:
	add r14,1
LB_7245:
	cmp r14,r10
	jge LB_7246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7244
	cmp al,10
	jz LB_7244
	cmp al,32
	jz LB_7244
LB_7246:
	push r10
	call NS_E_6578_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7247
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6574_MTC_1_failed
LB_7247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7242
	btr QWORD [rdi],0
LB_7242:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6574_MTC_1_failed:
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
NS_E_6576:
NS_E_RDI_6576:
NS_E_6576_ETR_TBL:
NS_E_6576_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_7280
LB_7279:
	add r14,1
LB_7280:
	cmp r14,r10
	jge LB_7281
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7279
	cmp al,10
	jz LB_7279
	cmp al,32
	jz LB_7279
LB_7281:
	push r10
	call NS_E_6578_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7282
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6576_MTC_0_failed
LB_7282:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_7285
LB_7284:
	add r14,1
LB_7285:
	cmp r14,r10
	jge LB_7286
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7284
	cmp al,10
	jz LB_7284
	cmp al,32
	jz LB_7284
LB_7286:
	push r10
	call NS_E_6576_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7287
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7288
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7288:
	jmp NS_E_6576_MTC_0_failed
LB_7287:
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
	jc LB_7276
	btr QWORD [rdi],1
LB_7276:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7277
	btr QWORD [rdi],0
LB_7277:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6576_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6576_MTC_1_failed:
	add rsp,0
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
NS_E_6578:
NS_E_RDI_6578:
NS_E_6578_ETR_TBL:
NS_E_6578_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_7314
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_7314
	jmp LB_7315
LB_7314:
	jmp NS_E_6578_MTC_0_failed
LB_7315:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7319
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7320
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7320:
	jmp NS_E_6578_MTC_0_failed
LB_7319:
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
	jc LB_7306
	btr QWORD [rdi],1
LB_7306:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7307
	btr QWORD [rdi],0
LB_7307:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6578_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_7302
LB_7301:
	add r14,1
LB_7302:
	cmp r14,r10
	jge LB_7303
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7301
	cmp al,10
	jz LB_7301
	cmp al,32
	jz LB_7301
LB_7303:
	push r10
	call NS_E_5662_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7304
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6578_MTC_1_failed
LB_7304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7299
	btr QWORD [rdi],0
LB_7299:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6578_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_7297
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_7297
	jmp LB_7298
LB_7297:
	jmp NS_E_6578_MTC_2_failed
LB_7298:
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
	jc LB_7290
	btr QWORD [rdi],0
LB_7290:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6578_MTC_2_failed:
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
NS_E_7322:
NS_E_RDI_7322:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_5235:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5235
	NS_E_DYN_5238:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5238
	NS_E_DYN_5239:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5239
	NS_E_DYN_5240:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5240
	NS_E_DYN_5241:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5241
	NS_E_DYN_5255:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5255
	NS_E_DYN_5298:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5298
	NS_E_DYN_5308:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5308
	NS_E_DYN_5309:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5309
	NS_E_DYN_5310:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5310
	NS_E_DYN_5519:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5519
	NS_E_DYN_5557:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5557
	NS_E_DYN_5595:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5595
	NS_E_DYN_5633:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5633
	NS_E_DYN_5662:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5662
	NS_E_DYN_5663:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5663
	NS_E_DYN_5664:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5664
	NS_E_DYN_5797:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5797
	NS_E_DYN_5853:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_5854:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_5855:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5855
	NS_E_DYN_5856:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5856
	NS_E_DYN_5857:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_5857
	NS_E_DYN_6291:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_6291
	NS_E_DYN_6392:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_6392
	CST_DYN_6456:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_7322:
		dq 0x0000_0001_00_82_ffff
		dq 1
