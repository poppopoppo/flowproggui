%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
    mov r13,rbx
    mov rbx,[rbx]
    mov rsi,r13
    or rsi,1
    mov [args],rsi
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r8,rbx
    mov rbx,[rbx]
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
    sub r14,1
    jmp args_lp
  args_end:
    mov r8,rbx
    mov rbx,[rbx]
    mov rcx,0x0000_0000_0000_ffff
    mov [r8],rcx
    mov rcx,0x0100_0000_0000_0001
    or r8,rcx
    mov [r13+16],r8
	call NS_E_12168
	call NS_E_16963
	call exec_out
	jmp _end
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_26: dq 0
NS_E_26:
NS_E_RDI_26:
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
NS_E_9257:
NS_E_RDI_9257:
NS_E_9257_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_9258
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_9258:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9260:
NS_E_RDI_9260:
NS_E_9260_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_9260_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_9260_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9261:
NS_E_RDI_9261:
NS_E_9261_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_9261_LB_0
	cmp r11,57
	ja NS_E_9261_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9261_LB_0:
	mov rax,0
	ret
NS_E_9263:
NS_E_RDI_9263:
NS_E_9263_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_9263_LB_0
	cmp r11,122
	ja NS_E_9263_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9263_LB_0:
	mov rax,0
	ret
NS_E_9262:
NS_E_RDI_9262:
NS_E_9262_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_9262_LB_0
	cmp r11,90
	ja NS_E_9262_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9262_LB_0:
	mov rax,0
	ret
NS_E_33:
	mov rdi,r13
	bt r12,0
NS_E_RDI_33:
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
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
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
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_25: dq 0
NS_E_25:
NS_E_RDI_25:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_9259:
NS_E_RDI_9259:
NS_E_9259_ETR_TBL:
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
	jz NS_E_9259_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_9259_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9270:
; 	|» { 0' 1' }
NS_E_RDI_9270:
MTC_LB_9271:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9272
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9273
	bt QWORD [rdi],0
	jc LB_9274
	btr r12,2
	jmp LB_9275
LB_9274:
	bts r12,2
LB_9275:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9273:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9276:
	cmp r15,0
	jz LB_9277
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9276
LB_9277:
; ∎ %_9264
 ; {>  %_9264~0':(_lst)◂(t3429'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9272:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9278
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9279
	bt QWORD [rdi],0
	jc LB_9280
	btr r12,4
	jmp LB_9281
LB_9280:
	bts r12,4
LB_9281:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9279:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_9284
	btr r12,5
	jmp LB_9285
LB_9284:
	bts r12,5
LB_9285:
	mov r8,r11
	bt r12,5
	jc LB_9282
	btr r12,2
	jmp LB_9283
LB_9282:
	bts r12,2
LB_9283:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_9288
	btr r12,5
	jmp LB_9289
LB_9288:
	bts r12,5
LB_9289:
	mov r9,r11
	bt r12,5
	jc LB_9286
	btr r12,3
	jmp LB_9287
LB_9286:
	bts r12,3
LB_9287:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9290:
	cmp r15,0
	jz LB_9291
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9290
LB_9291:
; _cns { %_9266 %_9264 } ⊢ %_9268 : %_9268
 ; {>  %_9264~0':(_lst)◂(t3429'(-1)) %_9267~3':(_lst)◂(t3429'(-1)) %_9266~2':t3429'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f9270 { %_9268 %_9267 } ⊢ %_9269 : %_9269
 ; {>  %_9268~°0◂{ 2' 0' }:(_lst)◂(t3429'(-1)) %_9267~3':(_lst)◂(t3429'(-1)) }
; _f9270 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_9292
	btr r12,1
	jmp LB_9293
LB_9292:
	bts r12,1
LB_9293:
	mov r9,r13
	bt r12,0
	jc LB_9294
	btr r12,3
	jmp LB_9295
LB_9294:
	bts r12,3
LB_9295:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_9300
	btr r12,4
	jmp LB_9301
LB_9300:
	bts r12,4
LB_9301:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_9298
	btr QWORD [rdi],0
	jmp LB_9299
LB_9298:
	bts QWORD [rdi],0
LB_9299:
	mov r10,r9
	bt r12,3
	jc LB_9304
	btr r12,4
	jmp LB_9305
LB_9304:
	bts r12,4
LB_9305:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_9302
	btr QWORD [rdi],1
	jmp LB_9303
LB_9302:
	bts QWORD [rdi],1
LB_9303:
	mov rsi,1
	bt r12,0
	jc LB_9296
	mov rsi,0
	bt r13,0
	jc LB_9296
	jmp LB_9297
LB_9296:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9297:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_9270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_9269
 ; {>  %_9269~0':(_lst)◂(t3429'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9278:
NS_E_9309:
; 	|» 0'
NS_E_RDI_9309:
; _nil {  } ⊢ %_9307 : %_9307
 ; {>  %_9306~0':(_lst)◂(t3450'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f9270 { %_9307 %_9306 } ⊢ %_9308 : %_9308
 ; {>  %_9307~°1◂{  }:(_lst)◂(t3447'(0)) %_9306~0':(_lst)◂(t3450'(-1)) }
; _f9270 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_9310
	btr r12,1
	jmp LB_9311
LB_9310:
	bts r12,1
LB_9311:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_9312
	mov rsi,0
	bt r13,0
	jc LB_9312
	jmp LB_9313
LB_9312:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9313:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_9270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_9308
 ; {>  %_9308~0':(_lst)◂(t3450'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_9327:
; 	|» { 0' 1' }
NS_E_RDI_9327:
MTC_LB_9328:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9329
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9330
	bt QWORD [rdi],0
	jc LB_9331
	btr r12,4
	jmp LB_9332
LB_9331:
	bts r12,4
LB_9332:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9330:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_9335
	btr r12,5
	jmp LB_9336
LB_9335:
	bts r12,5
LB_9336:
	mov r8,r11
	bt r12,5
	jc LB_9333
	btr r12,2
	jmp LB_9334
LB_9333:
	bts r12,2
LB_9334:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_9339
	btr r12,5
	jmp LB_9340
LB_9339:
	bts r12,5
LB_9340:
	mov r9,r11
	bt r12,5
	jc LB_9337
	btr r12,3
	jmp LB_9338
LB_9337:
	bts r12,3
LB_9338:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9341:
	cmp r15,0
	jz LB_9342
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9341
LB_9342:
; _f44 %_9314 ⊢ %_9318 : %_9318
 ; {>  %_9317~3':(_lst)◂(_r64) %_9314~0':_r64 %_9316~2':_r64 }
	add r13,1
; _f9327 { %_9318 %_9317 } ⊢ { %_9319 %_9320 } : { %_9319 %_9320 }
 ; {>  %_9317~3':(_lst)◂(_r64) %_9318~0':_r64 %_9316~2':_r64 }
; _f9327 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_9345
	btr r12,1
	jmp LB_9346
LB_9345:
	bts r12,1
LB_9346:
	call NS_E_9327
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9343
	btr r12,2
	jmp LB_9344
LB_9343:
	bts r12,2
LB_9344:
	add rsp,16
; _f43 %_9319 ⊢ %_9321 : %_9321
 ; {>  %_9319~0':_r64 %_9316~2':_r64 %_9320~1':_stg }
	sub r13,1
; _f21 { %_9320 %_9321 %_9316 } ⊢ { %_9322 %_9323 %_9324 } : { %_9322 %_9323 %_9324 }
 ; {>  %_9321~0':_r64 %_9316~2':_r64 %_9320~1':_stg }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_9347
	btr r12,3
	jmp LB_9348
LB_9347:
	bts r12,3
LB_9348:
	mov r14,r13
	bt r12,0
	jc LB_9349
	btr r12,1
	jmp LB_9350
LB_9349:
	bts r12,1
LB_9350:
	mov r13,r9
	bt r12,3
	jc LB_9351
	btr r12,0
	jmp LB_9352
LB_9351:
	bts r12,0
LB_9352:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_9323 %_9322 }
 ; {>  %_9323~1':_r64 %_9322~0':_stg %_9324~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_9353
	mov rdi,r8
	call dlt
LB_9353:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9354
	btr r12,2
	jmp LB_9355
LB_9354:
	bts r12,2
LB_9355:
	mov r14,r13
	bt r12,0
	jc LB_9356
	btr r12,1
	jmp LB_9357
LB_9356:
	bts r12,1
LB_9357:
	mov r13,r8
	bt r12,2
	jc LB_9358
	btr r12,0
	jmp LB_9359
LB_9358:
	bts r12,0
LB_9359:
	ret
MTC_LB_9329:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9360
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9361
	bt QWORD [rdi],0
	jc LB_9362
	btr r12,2
	jmp LB_9363
LB_9362:
	bts r12,2
LB_9363:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9361:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9364:
	cmp r15,0
	jz LB_9365
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9364
LB_9365:
; _f19 %_9314 ⊢ { %_9325 %_9326 } : { %_9325 %_9326 }
 ; {>  %_9314~0':_r64 }
; _f19 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_9325 %_9326 }
 ; {>  %_9325~0':_r64 %_9326~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_9360:
NS_E_9370:
; 	|» 0'
NS_E_RDI_9370:
; » 0xr0 |~ {  } ⊢ %_9367 : %_9367
 ; {>  %_9366~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_9367
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f9327 { %_9367 %_9366 } ⊢ { %_9368 %_9369 } : { %_9368 %_9369 }
 ; {>  %_9366~0':(_lst)◂(_r64) %_9367~1':_r64 }
; _f9327 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9371
	btr r12,2
	jmp LB_9372
LB_9371:
	bts r12,2
LB_9372:
	mov r14,r13
	bt r12,0
	jc LB_9373
	btr r12,1
	jmp LB_9374
LB_9373:
	bts r12,1
LB_9374:
	mov r13,r8
	bt r12,2
	jc LB_9375
	btr r12,0
	jmp LB_9376
LB_9375:
	bts r12,0
LB_9376:
	call NS_E_9327
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_9369
 ; {>  %_9369~1':_stg %_9368~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_9377
	mov rdi,r13
	call dlt
LB_9377:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9378
	btr r12,0
	jmp LB_9379
LB_9378:
	bts r12,0
LB_9379:
	ret
NS_E_9380:
NS_E_RDI_9380:
NS_E_9380_ETR_TBL:
NS_E_9380_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_9421
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_9421
	jmp LB_9422
LB_9421:
	jmp LB_9411
LB_9422:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_9381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9426
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9427
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9427:
	jmp LB_9411
LB_9426:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9414
	btr r12,1
	jmp LB_9415
LB_9414:
	bts r12,1
LB_9415:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9412
	btr r12,0
	jmp LB_9413
LB_9412:
	bts r12,0
LB_9413:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9408
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9429
	btr r12,2
	jmp LB_9430
LB_9429:
	bts r12,2
LB_9430:
	mov r13,r14
	bt r12,1
	jc LB_9431
	btr r12,0
	jmp LB_9432
LB_9431:
	bts r12,0
LB_9432:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9370 %_9383 ⊢ %_9384 : %_9384
 ; {>  %_9383~0':(_lst)◂(_r64) }
; _f9370 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9370
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_9384 ⊢ %_9385 : %_9385
 ; {>  %_9384~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9385
 ; {>  %_9385~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9406
	btr r12,3
	jmp LB_9407
LB_9406:
	bts r12,3
LB_9407:
	mov r8,0
	bts r12,2
	ret
LB_9408:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9410
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9409
LB_9410:
	add rsp,8
	ret
LB_9411:
	add rsp,32
	pop r14
LB_9409:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9381:
NS_E_RDI_9381:
NS_E_9381_ETR_TBL:
NS_E_9381_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_9458
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_9458
	jmp LB_9459
LB_9458:
	jmp LB_9446
LB_9459:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_9382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9463
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9464
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9464:
	jmp LB_9446
LB_9463:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_9381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9469
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9470
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9470:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9471:
	jmp LB_9446
LB_9469:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9451
	btr r12,2
	jmp LB_9452
LB_9451:
	bts r12,2
LB_9452:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9449
	btr r12,1
	jmp LB_9450
LB_9449:
	bts r12,1
LB_9450:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9447
	btr r12,0
	jmp LB_9448
LB_9447:
	bts r12,0
LB_9448:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_9443
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_9473
	btr r12,3
	jmp LB_9474
LB_9473:
	bts r12,3
LB_9474:
	mov r14,r8
	bt r12,2
	jc LB_9475
	btr r12,1
	jmp LB_9476
LB_9475:
	bts r12,1
LB_9476:
	mov r8,r13
	bt r12,0
	jc LB_9477
	btr r12,2
	jmp LB_9478
LB_9477:
	bts r12,2
LB_9478:
	mov r13,r9
	bt r12,3
	jc LB_9479
	btr r12,0
	jmp LB_9480
LB_9479:
	bts r12,0
LB_9480:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_9386 %_9387 } ⊢ %_9388 : %_9388
 ; {>  %_9387~1':(_lst)◂(_r64) %_9386~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_9388 ⊢ %_9389 : %_9389
 ; {>  %_9388~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_9389
 ; {>  %_9389~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_9437
	btr r12,2
	jmp LB_9438
LB_9437:
	bts r12,2
LB_9438:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_9435
	btr QWORD [rdi],0
	jmp LB_9436
LB_9435:
	bts QWORD [rdi],0
LB_9436:
	mov r8,r14
	bt r12,1
	jc LB_9441
	btr r12,2
	jmp LB_9442
LB_9441:
	bts r12,2
LB_9442:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_9439
	btr QWORD [rdi],1
	jmp LB_9440
LB_9439:
	bts QWORD [rdi],1
LB_9440:
	mov rsi,1
	bt r12,3
	jc LB_9433
	mov rsi,0
	bt r9,0
	jc LB_9433
	jmp LB_9434
LB_9433:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9434:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9443:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9445
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9444
LB_9445:
	add rsp,8
	ret
LB_9446:
	add rsp,48
	pop r14
LB_9444:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_9494
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_9494
	jmp LB_9495
LB_9494:
	jmp LB_9486
LB_9495:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9487
	btr r12,0
	jmp LB_9488
LB_9487:
	bts r12,0
LB_9488:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9483
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_9390 : %_9390
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_9390 ⊢ %_9391 : %_9391
 ; {>  %_9390~°1◂{  }:(_lst)◂(t3508'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_9391
 ; {>  %_9391~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3511'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_9481
	mov rsi,0
	bt r9,0
	jc LB_9481
	jmp LB_9482
LB_9481:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9482:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9483:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9485
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9484
LB_9485:
	add rsp,8
	ret
LB_9486:
	add rsp,16
	pop r14
LB_9484:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_9257_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9517
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9509
LB_9517:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_9381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9522
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9523
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9523:
	jmp LB_9509
LB_9522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9512
	btr r12,1
	jmp LB_9513
LB_9512:
	bts r12,1
LB_9513:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9510
	btr r12,0
	jmp LB_9511
LB_9510:
	bts r12,0
LB_9511:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9506
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9392 %_9393 } ⊢ %_9394 : %_9394
 ; {>  %_9393~1':(_lst)◂(_r64) %_9392~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_9394 ⊢ %_9395 : %_9395
 ; {>  %_9394~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_9395
 ; {>  %_9395~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_9500
	btr r12,2
	jmp LB_9501
LB_9500:
	bts r12,2
LB_9501:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_9498
	btr QWORD [rdi],0
	jmp LB_9499
LB_9498:
	bts QWORD [rdi],0
LB_9499:
	mov r8,r14
	bt r12,1
	jc LB_9504
	btr r12,2
	jmp LB_9505
LB_9504:
	bts r12,2
LB_9505:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_9502
	btr QWORD [rdi],1
	jmp LB_9503
LB_9502:
	bts QWORD [rdi],1
LB_9503:
	mov rsi,1
	bt r12,3
	jc LB_9496
	mov rsi,0
	bt r9,0
	jc LB_9496
	jmp LB_9497
LB_9496:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9497:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9506:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9508
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9507
LB_9508:
	add rsp,8
	ret
LB_9509:
	add rsp,32
	pop r14
LB_9507:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9382:
NS_E_RDI_9382:
NS_E_9382_ETR_TBL:
NS_E_9382_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_9538
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_9538
	jmp LB_9539
LB_9538:
	jmp LB_9530
LB_9539:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9531
	btr r12,0
	jmp LB_9532
LB_9531:
	bts r12,0
LB_9532:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9527
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_9396 : %_9396
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_9396
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_9396 ⊢ %_9397 : %_9397
 ; {>  %_9396~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9397
 ; {>  %_9397~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9525
	btr r12,3
	jmp LB_9526
LB_9525:
	bts r12,3
LB_9526:
	mov r8,0
	bts r12,2
	ret
LB_9527:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9529
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9528
LB_9529:
	add rsp,8
	ret
LB_9530:
	add rsp,16
	pop r14
LB_9528:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_9553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_9553
	jmp LB_9554
LB_9553:
	jmp LB_9545
LB_9554:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9546
	btr r12,0
	jmp LB_9547
LB_9546:
	bts r12,0
LB_9547:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9542
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_9398 : %_9398
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_9398
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_9398 ⊢ %_9399 : %_9399
 ; {>  %_9398~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9399
 ; {>  %_9399~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9540
	btr r12,3
	jmp LB_9541
LB_9540:
	bts r12,3
LB_9541:
	mov r8,0
	bts r12,2
	ret
LB_9542:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9544
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9543
LB_9544:
	add rsp,8
	ret
LB_9545:
	add rsp,16
	pop r14
LB_9543:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_9568
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_9568
	jmp LB_9569
LB_9568:
	jmp LB_9560
LB_9569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9561
	btr r12,0
	jmp LB_9562
LB_9561:
	bts r12,0
LB_9562:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9557
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_9400 : %_9400
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_9400
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_9400 ⊢ %_9401 : %_9401
 ; {>  %_9400~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9401
 ; {>  %_9401~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9555
	btr r12,3
	jmp LB_9556
LB_9555:
	bts r12,3
LB_9556:
	mov r8,0
	bts r12,2
	ret
LB_9557:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9559
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9558
LB_9559:
	add rsp,8
	ret
LB_9560:
	add rsp,16
	pop r14
LB_9558:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_9583
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_9583
	jmp LB_9584
LB_9583:
	jmp LB_9575
LB_9584:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9576
	btr r12,0
	jmp LB_9577
LB_9576:
	bts r12,0
LB_9577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9572
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_9402 : %_9402
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_9402
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_9402 ⊢ %_9403 : %_9403
 ; {>  %_9402~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9403
 ; {>  %_9403~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9570
	btr r12,3
	jmp LB_9571
LB_9570:
	bts r12,3
LB_9571:
	mov r8,0
	bts r12,2
	ret
LB_9572:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9574
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9573
LB_9574:
	add rsp,8
	ret
LB_9575:
	add rsp,16
	pop r14
LB_9573:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_9598
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_9598
	jmp LB_9599
LB_9598:
	jmp LB_9590
LB_9599:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9591
	btr r12,0
	jmp LB_9592
LB_9591:
	bts r12,0
LB_9592:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9587
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_9404 : %_9404
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_9404
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_9404 ⊢ %_9405 : %_9405
 ; {>  %_9404~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9405
 ; {>  %_9405~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9585
	btr r12,3
	jmp LB_9586
LB_9585:
	bts r12,3
LB_9586:
	mov r8,0
	bts r12,2
	ret
LB_9587:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9589
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9588
LB_9589:
	add rsp,8
	ret
LB_9590:
	add rsp,16
	pop r14
LB_9588:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9600:
NS_E_RDI_9600:
NS_E_9600_ETR_TBL:
NS_E_9600_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_9257_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9637
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9631
LB_9637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9632
	btr r12,0
	jmp LB_9633
LB_9632:
	bts r12,0
LB_9633:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9628
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_9602 : %_9602
 ; {>  %_9601~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_9602
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_9603 : %_9603
 ; {>  %_9601~0':_r64 %_9602~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_9603
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_9601 %_9602 } ⊢ { %_9604 %_9605 %_9606 } : { %_9604 %_9605 %_9606 }
 ; {>  %_9601~0':_r64 %_9602~1':_r64 %_9603~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_9603 %_9604 } ⊢ { %_9607 %_9608 %_9609 } : { %_9607 %_9608 %_9609 }
 ; {>  %_9606~3':_r64 %_9605~1':_r64 %_9604~0':_r64 %_9603~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9612:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9613
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9613
LB_9614:
	cmp r15,0
	jz LB_9615
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9614
LB_9615:
; _some %_9608 ⊢ %_9610 : %_9610
 ; {>  %_9605~1':_r64 %_9607~2':_r64 %_9608~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9610
 ; {>  %_9605~1':_r64 %_9607~2':_r64 %_9610~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_9616
	mov rdi,r14
	call dlt
LB_9616:
	bt r12,2
	jc LB_9617
	mov rdi,r8
	call dlt
LB_9617:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9618
	btr r12,3
	jmp LB_9619
LB_9618:
	bts r12,3
LB_9619:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9613:
	mov r15,0
LB_9621:
	cmp r15,0
	jz LB_9622
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9621
LB_9622:
; _none {  } ⊢ %_9611 : %_9611
 ; {>  %_9606~3':_r64 %_9605~1':_r64 %_9609~4':_r64 %_9607~2':_r64 %_9608~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9611
 ; {>  %_9606~3':_r64 %_9605~1':_r64 %_9609~4':_r64 %_9607~2':_r64 %_9608~0':_r64 %_9611~°1◂{  }:(_opn)◂(t3587'(0)) }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_9623
	mov rdi,r9
	call dlt
LB_9623:
	bt r12,1
	jc LB_9624
	mov rdi,r14
	call dlt
LB_9624:
	bt r12,4
	jc LB_9625
	mov rdi,r10
	call dlt
LB_9625:
	bt r12,2
	jc LB_9626
	mov rdi,r8
	call dlt
LB_9626:
	bt r12,0
	jc LB_9627
	mov rdi,r13
	call dlt
LB_9627:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_9620:
LB_9628:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9630
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9629
LB_9630:
	add rsp,8
	ret
LB_9631:
	add rsp,16
	pop r14
LB_9629:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9639:
NS_E_RDI_9639:
NS_E_9639_ETR_TBL:
NS_E_9639_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_9257_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9676
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9670
LB_9676:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9671
	btr r12,0
	jmp LB_9672
LB_9671:
	bts r12,0
LB_9672:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9667
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_9641 : %_9641
 ; {>  %_9640~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_9641
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_9642 : %_9642
 ; {>  %_9641~1':_r64 %_9640~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_9642
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_9640 %_9641 } ⊢ { %_9643 %_9644 %_9645 } : { %_9643 %_9644 %_9645 }
 ; {>  %_9641~1':_r64 %_9642~2':_r64 %_9640~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_9642 %_9643 } ⊢ { %_9646 %_9647 %_9648 } : { %_9646 %_9647 %_9648 }
 ; {>  %_9644~1':_r64 %_9643~0':_r64 %_9645~3':_r64 %_9642~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9651:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9652
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9652
LB_9653:
	cmp r15,0
	jz LB_9654
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9653
LB_9654:
; _some %_9647 ⊢ %_9649 : %_9649
 ; {>  %_9644~1':_r64 %_9647~0':_r64 %_9646~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9649
 ; {>  %_9644~1':_r64 %_9646~2':_r64 %_9649~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_9655
	mov rdi,r14
	call dlt
LB_9655:
	bt r12,2
	jc LB_9656
	mov rdi,r8
	call dlt
LB_9656:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9657
	btr r12,3
	jmp LB_9658
LB_9657:
	bts r12,3
LB_9658:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9652:
	mov r15,0
LB_9660:
	cmp r15,0
	jz LB_9661
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9660
LB_9661:
; _none {  } ⊢ %_9650 : %_9650
 ; {>  %_9644~1':_r64 %_9647~0':_r64 %_9646~2':_r64 %_9648~4':_r64 %_9645~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9650
 ; {>  %_9644~1':_r64 %_9647~0':_r64 %_9646~2':_r64 %_9648~4':_r64 %_9645~3':_r64 %_9650~°1◂{  }:(_opn)◂(t3614'(0)) }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_9662
	mov rdi,r14
	call dlt
LB_9662:
	bt r12,0
	jc LB_9663
	mov rdi,r13
	call dlt
LB_9663:
	bt r12,2
	jc LB_9664
	mov rdi,r8
	call dlt
LB_9664:
	bt r12,4
	jc LB_9665
	mov rdi,r10
	call dlt
LB_9665:
	bt r12,3
	jc LB_9666
	mov rdi,r9
	call dlt
LB_9666:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_9659:
LB_9667:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9669
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9668
LB_9669:
	add rsp,8
	ret
LB_9670:
	add rsp,16
	pop r14
LB_9668:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9678:
NS_E_RDI_9678:
NS_E_9678_ETR_TBL:
NS_E_9678_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_9257_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9715
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9709
LB_9715:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9710
	btr r12,0
	jmp LB_9711
LB_9710:
	bts r12,0
LB_9711:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9706
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_9680 : %_9680
 ; {>  %_9679~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_9680
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_9681 : %_9681
 ; {>  %_9679~0':_r64 %_9680~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_9681
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_9679 %_9680 } ⊢ { %_9682 %_9683 %_9684 } : { %_9682 %_9683 %_9684 }
 ; {>  %_9681~2':_r64 %_9679~0':_r64 %_9680~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_9681 %_9682 } ⊢ { %_9685 %_9686 %_9687 } : { %_9685 %_9686 %_9687 }
 ; {>  %_9681~2':_r64 %_9683~1':_r64 %_9682~0':_r64 %_9684~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9690:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9691
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9691
LB_9692:
	cmp r15,0
	jz LB_9693
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9692
LB_9693:
; _some %_9686 ⊢ %_9688 : %_9688
 ; {>  %_9683~1':_r64 %_9686~0':_r64 %_9685~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9688
 ; {>  %_9683~1':_r64 %_9688~°0◂0':(_opn)◂(_r64) %_9685~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_9694
	mov rdi,r14
	call dlt
LB_9694:
	bt r12,2
	jc LB_9695
	mov rdi,r8
	call dlt
LB_9695:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9696
	btr r12,3
	jmp LB_9697
LB_9696:
	bts r12,3
LB_9697:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9691:
	mov r15,0
LB_9699:
	cmp r15,0
	jz LB_9700
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9699
LB_9700:
; _none {  } ⊢ %_9689 : %_9689
 ; {>  %_9683~1':_r64 %_9687~4':_r64 %_9686~0':_r64 %_9685~2':_r64 %_9684~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9689
 ; {>  %_9683~1':_r64 %_9687~4':_r64 %_9686~0':_r64 %_9685~2':_r64 %_9689~°1◂{  }:(_opn)◂(t3641'(0)) %_9684~3':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_9701
	mov rdi,r14
	call dlt
LB_9701:
	bt r12,4
	jc LB_9702
	mov rdi,r10
	call dlt
LB_9702:
	bt r12,0
	jc LB_9703
	mov rdi,r13
	call dlt
LB_9703:
	bt r12,2
	jc LB_9704
	mov rdi,r8
	call dlt
LB_9704:
	bt r12,3
	jc LB_9705
	mov rdi,r9
	call dlt
LB_9705:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_9698:
LB_9706:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9708
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9707
LB_9708:
	add rsp,8
	ret
LB_9709:
	add rsp,16
	pop r14
LB_9707:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9717:
NS_E_RDI_9717:
NS_E_9717_ETR_TBL:
NS_E_9717_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_9678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9733
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9727
LB_9733:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9728
	btr r12,0
	jmp LB_9729
LB_9728:
	bts r12,0
LB_9729:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9724
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9718 ⊢ %_9719 : %_9719
 ; {>  %_9718~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9719
 ; {>  %_9719~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9722
	btr r12,3
	jmp LB_9723
LB_9722:
	bts r12,3
LB_9723:
	mov r8,0
	bts r12,2
	ret
LB_9724:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9726
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9725
LB_9726:
	add rsp,8
	ret
LB_9727:
	add rsp,16
	pop r14
LB_9725:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_9639_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9746
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9740
LB_9746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9741
	btr r12,0
	jmp LB_9742
LB_9741:
	bts r12,0
LB_9742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9737
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9720 ⊢ %_9721 : %_9721
 ; {>  %_9720~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9721
 ; {>  %_9721~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9735
	btr r12,3
	jmp LB_9736
LB_9735:
	bts r12,3
LB_9736:
	mov r8,0
	bts r12,2
	ret
LB_9737:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9739
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9738
LB_9739:
	add rsp,8
	ret
LB_9740:
	add rsp,16
	pop r14
LB_9738:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9748:
NS_E_RDI_9748:
NS_E_9748_ETR_TBL:
NS_E_9748_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_9717_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9793
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9785
LB_9793:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_9749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9798
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9799:
	jmp LB_9785
LB_9798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9788
	btr r12,1
	jmp LB_9789
LB_9788:
	bts r12,1
LB_9789:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9786
	btr r12,0
	jmp LB_9787
LB_9786:
	bts r12,0
LB_9787:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9782
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9751 %_9752 } ⊢ %_9753 : %_9753
 ; {>  %_9751~0':_r64 %_9752~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f9370 %_9753 ⊢ %_9754 : %_9754
 ; {>  %_9753~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f9370 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_9768
	btr r12,2
	jmp LB_9769
LB_9768:
	bts r12,2
LB_9769:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_9774
	btr r12,3
	jmp LB_9775
LB_9774:
	bts r12,3
LB_9775:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_9772
	btr QWORD [rdi],0
	jmp LB_9773
LB_9772:
	bts QWORD [rdi],0
LB_9773:
	mov r9,r14
	bt r12,1
	jc LB_9778
	btr r12,3
	jmp LB_9779
LB_9778:
	bts r12,3
LB_9779:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_9776
	btr QWORD [rdi],1
	jmp LB_9777
LB_9776:
	bts QWORD [rdi],1
LB_9777:
	mov rsi,1
	bt r12,0
	jc LB_9770
	mov rsi,0
	bt r13,0
	jc LB_9770
	jmp LB_9771
LB_9770:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9771:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_9370
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_9754 ⊢ %_9755 : %_9755
 ; {>  %_9754~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9755
 ; {>  %_9755~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9780
	btr r12,3
	jmp LB_9781
LB_9780:
	bts r12,3
LB_9781:
	mov r8,0
	bts r12,2
	ret
LB_9782:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9784
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9783
LB_9784:
	add rsp,8
	ret
LB_9785:
	add rsp,32
	pop r14
LB_9783:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9749:
NS_E_RDI_9749:
NS_E_9749_ETR_TBL:
NS_E_9749_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_9750_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9822
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9814
LB_9822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_9749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9827
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9828
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9828:
	jmp LB_9814
LB_9827:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9817
	btr r12,1
	jmp LB_9818
LB_9817:
	bts r12,1
LB_9818:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9815
	btr r12,0
	jmp LB_9816
LB_9815:
	bts r12,0
LB_9816:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9811
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9756 %_9757 } ⊢ %_9758 : %_9758
 ; {>  %_9756~0':_r64 %_9757~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_9758 ⊢ %_9759 : %_9759
 ; {>  %_9758~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_9759
 ; {>  %_9759~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_9805
	btr r12,2
	jmp LB_9806
LB_9805:
	bts r12,2
LB_9806:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_9803
	btr QWORD [rdi],0
	jmp LB_9804
LB_9803:
	bts QWORD [rdi],0
LB_9804:
	mov r8,r14
	bt r12,1
	jc LB_9809
	btr r12,2
	jmp LB_9810
LB_9809:
	bts r12,2
LB_9810:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_9807
	btr QWORD [rdi],1
	jmp LB_9808
LB_9807:
	bts QWORD [rdi],1
LB_9808:
	mov rsi,1
	bt r12,3
	jc LB_9801
	mov rsi,0
	bt r9,0
	jc LB_9801
	jmp LB_9802
LB_9801:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9802:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9811:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9813
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9812
LB_9813:
	add rsp,8
	ret
LB_9814:
	add rsp,32
	pop r14
LB_9812:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_9832
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_9760 : %_9760
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_9760 ⊢ %_9761 : %_9761
 ; {>  %_9760~°1◂{  }:(_lst)◂(t3685'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_9761
 ; {>  %_9761~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3688'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_9830
	mov rsi,0
	bt r9,0
	jc LB_9830
	jmp LB_9831
LB_9830:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9831:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9832:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9834
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9833
LB_9834:
	add rsp,8
	ret
LB_9835:
	add rsp,0
	pop r14
LB_9833:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9750:
NS_E_RDI_9750:
NS_E_9750_ETR_TBL:
NS_E_9750_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_9717_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9847
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9841
LB_9847:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9842
	btr r12,0
	jmp LB_9843
LB_9842:
	bts r12,0
LB_9843:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9838
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9762 ⊢ %_9763 : %_9763
 ; {>  %_9762~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9763
 ; {>  %_9763~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9836
	btr r12,3
	jmp LB_9837
LB_9836:
	bts r12,3
LB_9837:
	mov r8,0
	bts r12,2
	ret
LB_9838:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9840
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9839
LB_9840:
	add rsp,8
	ret
LB_9841:
	add rsp,16
	pop r14
LB_9839:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_9600_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9860
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9854
LB_9860:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9855
	btr r12,0
	jmp LB_9856
LB_9855:
	bts r12,0
LB_9856:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9851
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9764 ⊢ %_9765 : %_9765
 ; {>  %_9764~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9765
 ; {>  %_9765~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9849
	btr r12,3
	jmp LB_9850
LB_9849:
	bts r12,3
LB_9850:
	mov r8,0
	bts r12,2
	ret
LB_9851:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9853
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9852
LB_9853:
	add rsp,8
	ret
LB_9854:
	add rsp,16
	pop r14
LB_9852:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_9875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_9875
	jmp LB_9876
LB_9875:
	jmp LB_9867
LB_9876:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9868
	btr r12,0
	jmp LB_9869
LB_9868:
	bts r12,0
LB_9869:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9864
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_9766 : %_9766
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_9766
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_9766 ⊢ %_9767 : %_9767
 ; {>  %_9766~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9767
 ; {>  %_9767~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9862
	btr r12,3
	jmp LB_9863
LB_9862:
	bts r12,3
LB_9863:
	mov r8,0
	bts r12,2
	ret
LB_9864:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9866
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9865
LB_9866:
	add rsp,8
	ret
LB_9867:
	add rsp,16
	pop r14
LB_9865:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9877:
NS_E_RDI_9877:
NS_E_9877_ETR_TBL:
NS_E_9877_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_9898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_9898
	jmp LB_9899
LB_9898:
	jmp LB_9888
LB_9899:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_9749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9903
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9904
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9904:
	jmp LB_9888
LB_9903:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9891
	btr r12,1
	jmp LB_9892
LB_9891:
	bts r12,1
LB_9892:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9889
	btr r12,0
	jmp LB_9890
LB_9889:
	bts r12,0
LB_9890:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9885
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9906
	btr r12,2
	jmp LB_9907
LB_9906:
	bts r12,2
LB_9907:
	mov r13,r14
	bt r12,1
	jc LB_9908
	btr r12,0
	jmp LB_9909
LB_9908:
	bts r12,0
LB_9909:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9370 %_9878 ⊢ %_9879 : %_9879
 ; {>  %_9878~0':(_lst)◂(_r64) }
; _f9370 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9370
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_9879 ⊢ %_9880 : %_9880
 ; {>  %_9879~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9880
 ; {>  %_9880~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9883
	btr r12,3
	jmp LB_9884
LB_9883:
	bts r12,3
LB_9884:
	mov r8,0
	bts r12,2
	ret
LB_9885:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9887
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9886
LB_9887:
	add rsp,8
	ret
LB_9888:
	add rsp,32
	pop r14
LB_9886:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9921
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9915
LB_9921:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9916
	btr r12,0
	jmp LB_9917
LB_9916:
	bts r12,0
LB_9917:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9912
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9881 ⊢ %_9882 : %_9882
 ; {>  %_9881~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9882
 ; {>  %_9882~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9910
	btr r12,3
	jmp LB_9911
LB_9910:
	bts r12,3
LB_9911:
	mov r8,0
	bts r12,2
	ret
LB_9912:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9914
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9913
LB_9914:
	add rsp,8
	ret
LB_9915:
	add rsp,16
	pop r14
LB_9913:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9924:
NS_E_RDI_9924:
NS_E_9924_ETR_TBL:
NS_E_9924_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_9933:
	jmp LB_9930
LB_9929:
	add r14,1
LB_9930:
	cmp r14,r10
	jge LB_9931
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9929
	cmp al,10
	jz LB_9929
	cmp al,32
	jz LB_9929
LB_9931:
	push r10
	push rsi
	call NS_E_9748_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_9932
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_9934
	bts QWORD [rax],0
LB_9934:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_9933
LB_9932:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9927
	btr QWORD [rdi],0
LB_9927:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_9926:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9946:
; 	|» 0'
NS_E_RDI_9946:
MTC_LB_9947:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9948
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9949
	bt QWORD [rdi],0
	jc LB_9950
	btr r12,3
	jmp LB_9951
LB_9950:
	bts r12,3
LB_9951:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9949:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9954
	btr r12,4
	jmp LB_9955
LB_9954:
	bts r12,4
LB_9955:
	mov r14,r10
	bt r12,4
	jc LB_9952
	btr r12,1
	jmp LB_9953
LB_9952:
	bts r12,1
LB_9953:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9958
	btr r12,4
	jmp LB_9959
LB_9958:
	bts r12,4
LB_9959:
	mov r8,r10
	bt r12,4
	jc LB_9956
	btr r12,2
	jmp LB_9957
LB_9956:
	bts r12,2
LB_9957:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9960:
	cmp r15,0
	jz LB_9961
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9960
LB_9961:
; _f9946 %_9940 ⊢ %_9941 : %_9941
 ; {>  %_9940~2':_p9935 %_9939~1':_stg }
; _f9946 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_9964
	btr r12,0
	jmp LB_9965
LB_9964:
	bts r12,0
LB_9965:
	call NS_E_9946
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9962
	btr r12,1
	jmp LB_9963
LB_9962:
	bts r12,1
LB_9963:
	add rsp,16
; » _^ ..
	mov rax,1
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "."
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_9944
 ; {>  %_9944~2':_stg %_9943~0':_stg %_9942~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_9966
	mov rdi,r13
	call dlt
LB_9966:
	bt r12,1
	jc LB_9967
	mov rdi,r14
	call dlt
LB_9967:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_9968
	btr r12,0
	jmp LB_9969
LB_9968:
	bts r12,0
LB_9969:
	ret
MTC_LB_9948:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9970
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9971
	bt QWORD [rdi],0
	jc LB_9972
	btr r12,2
	jmp LB_9973
LB_9972:
	bts r12,2
LB_9973:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9971:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9974
	btr r12,1
	jmp LB_9975
LB_9974:
	bts r12,1
LB_9975:
LB_9976:
	cmp r15,0
	jz LB_9977
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9976
LB_9977:
; ∎ %_9945
 ; {>  %_9945~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9978
	btr r12,0
	jmp LB_9979
LB_9978:
	bts r12,0
LB_9979:
	ret
MTC_LB_9970:
NS_E_10089:
; 	|» 0'
NS_E_RDI_10089:
MTC_LB_10090:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10091
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10092
	bt QWORD [rdi],0
	jc LB_10093
	btr r12,2
	jmp LB_10094
LB_10093:
	bts r12,2
LB_10094:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10092:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10095
	btr r12,1
	jmp LB_10096
LB_10095:
	bts r12,1
LB_10096:
LB_10097:
	cmp r15,0
	jz LB_10098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10097
LB_10098:
; 	» "??r" _ ⊢ 0' : %_10084
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10084
 ; {>  %_10084~0':_stg %_10083~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_10099
	mov rdi,r14
	call dlt
LB_10099:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10091:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10100
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10101
	bt QWORD [rdi],0
	jc LB_10102
	btr r12,2
	jmp LB_10103
LB_10102:
	bts r12,2
LB_10103:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10101:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10104
	btr r12,1
	jmp LB_10105
LB_10104:
	bts r12,1
LB_10105:
LB_10106:
	cmp r15,0
	jz LB_10107
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10106
LB_10107:
; 	» ".." _ ⊢ 0' : %_10086
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10086
 ; {>  %_10086~0':_stg %_10085~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_10108
	mov rdi,r14
	call dlt
LB_10108:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10100:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10109
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10110
	bt QWORD [rdi],0
	jc LB_10111
	btr r12,2
	jmp LB_10112
LB_10111:
	bts r12,2
LB_10112:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10110:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10113
	btr r12,1
	jmp LB_10114
LB_10113:
	bts r12,1
LB_10114:
LB_10115:
	cmp r15,0
	jz LB_10116
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10115
LB_10116:
; _f9946 %_10087 ⊢ %_10088 : %_10088
 ; {>  %_10087~1':_p9935 }
; _f9946 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10117
	btr r12,0
	jmp LB_10118
LB_10117:
	bts r12,0
LB_10118:
	call NS_E_9946
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_10088
 ; {>  %_10088~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10109:
NS_E_10368:
; 	|» 0'
NS_E_RDI_10368:
MTC_LB_10369:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10370
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10371
	bt QWORD [rdi],0
	jc LB_10372
	btr r12,3
	jmp LB_10373
LB_10372:
	bts r12,3
LB_10373:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10371:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10376
	btr r12,4
	jmp LB_10377
LB_10376:
	bts r12,4
LB_10377:
	mov r14,r10
	bt r12,4
	jc LB_10374
	btr r12,1
	jmp LB_10375
LB_10374:
	bts r12,1
LB_10375:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10380
	btr r12,4
	jmp LB_10381
LB_10380:
	bts r12,4
LB_10381:
	mov r8,r10
	bt r12,4
	jc LB_10378
	btr r12,2
	jmp LB_10379
LB_10378:
	bts r12,2
LB_10379:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10382:
	cmp r15,0
	jz LB_10383
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10382
LB_10383:
; _f10360 %_10362 ⊢ %_10364 : %_10364
 ; {>  %_10363~2':(_lst)◂(_p9999) %_10362~1':_p9999 }
; _f10360 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10386
	btr r12,0
	jmp LB_10387
LB_10386:
	bts r12,0
LB_10387:
	call NS_E_10360
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10384
	btr r12,2
	jmp LB_10385
LB_10384:
	bts r12,2
LB_10385:
	add rsp,16
; » _^ ..
	mov rax,1
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r14,rax
	btr r12,1
; ∎ %_10366
 ; {>  %_10365~0':_stg %_10363~2':(_lst)◂(_p9999) %_10366~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10388
	mov rdi,r13
	call dlt
LB_10388:
	bt r12,2
	jc LB_10389
	mov rdi,r8
	call dlt
LB_10389:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10390
	btr r12,0
	jmp LB_10391
LB_10390:
	bts r12,0
LB_10391:
	ret
MTC_LB_10370:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10392
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10393
	bt QWORD [rdi],0
	jc LB_10394
	btr r12,1
	jmp LB_10395
LB_10394:
	bts r12,1
LB_10395:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10393:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10396:
	cmp r15,0
	jz LB_10397
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10396
LB_10397:
; 	» "" _ ⊢ 0' : %_10367
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10367
 ; {>  %_10367~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10392:
NS_E_10360:
; 	|» 0'
NS_E_RDI_10360:
MTC_LB_10398:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10399
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10400
	bt QWORD [rdi],0
	jc LB_10401
	btr r12,2
	jmp LB_10402
LB_10401:
	bts r12,2
LB_10402:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10400:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10403
	btr r12,1
	jmp LB_10404
LB_10403:
	bts r12,1
LB_10404:
LB_10405:
	cmp r15,0
	jz LB_10406
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10405
LB_10406:
; _f10368 %_10353 ⊢ %_10354 : %_10354
 ; {>  %_10353~1':(_lst)◂(_p9999) }
; _f10368 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10407
	btr r12,0
	jmp LB_10408
LB_10407:
	bts r12,0
LB_10408:
	call NS_E_10368
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,3
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r14,rax
	btr r12,1
; ∎ %_10356
 ; {>  %_10356~1':_stg %_10355~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10409
	mov rdi,r13
	call dlt
LB_10409:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10410
	btr r12,0
	jmp LB_10411
LB_10410:
	bts r12,0
LB_10411:
	ret
MTC_LB_10399:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10412
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10413
	bt QWORD [rdi],0
	jc LB_10414
	btr r12,2
	jmp LB_10415
LB_10414:
	bts r12,2
LB_10415:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10413:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10416
	btr r12,1
	jmp LB_10417
LB_10416:
	bts r12,1
LB_10417:
LB_10418:
	cmp r15,0
	jz LB_10419
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10418
LB_10419:
MTC_LB_10420:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10421
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10422
	bt QWORD [rdi],0
	jc LB_10423
	btr r12,0
	jmp LB_10424
LB_10423:
	bts r12,0
LB_10424:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10422:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10425:
	cmp r15,0
	jz LB_10426
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10425
LB_10426:
; 	» "_ " _ ⊢ 0' : %_10358
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10358
 ; {>  %_10358~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10421:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10427
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10428
	bt QWORD [rdi],0
	jc LB_10429
	btr r12,2
	jmp LB_10430
LB_10429:
	bts r12,2
LB_10430:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10428:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_10431
	btr r12,0
	jmp LB_10432
LB_10431:
	bts r12,0
LB_10432:
LB_10433:
	cmp r15,0
	jz LB_10434
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10433
LB_10434:
; ∎ %_10359
 ; {>  %_10359~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10427:
MTC_LB_10412:
NS_E_10351:
; 	|» 0'
NS_E_RDI_10351:
MTC_LB_10435:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10436
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10437
	bt QWORD [rdi],0
	jc LB_10438
	btr r12,3
	jmp LB_10439
LB_10438:
	bts r12,3
LB_10439:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10437:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10442
	btr r12,4
	jmp LB_10443
LB_10442:
	bts r12,4
LB_10443:
	mov r14,r10
	bt r12,4
	jc LB_10440
	btr r12,1
	jmp LB_10441
LB_10440:
	bts r12,1
LB_10441:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10446
	btr r12,4
	jmp LB_10447
LB_10446:
	bts r12,4
LB_10447:
	mov r8,r10
	bt r12,4
	jc LB_10444
	btr r12,2
	jmp LB_10445
LB_10444:
	bts r12,2
LB_10445:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10448:
	cmp r15,0
	jz LB_10449
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10448
LB_10449:
; _f10343 %_10345 ⊢ %_10347 : %_10347
 ; {>  %_10345~1':_p9998 %_10346~2':(_lst)◂(_p9998) }
; _f10343 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10452
	btr r12,0
	jmp LB_10453
LB_10452:
	bts r12,0
LB_10453:
	call NS_E_10343
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10450
	btr r12,2
	jmp LB_10451
LB_10450:
	bts r12,2
LB_10451:
	add rsp,16
; » _^ ..
	mov rax,1
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r14,rax
	btr r12,1
; ∎ %_10349
 ; {>  %_10348~0':_stg %_10346~2':(_lst)◂(_p9998) %_10349~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10454
	mov rdi,r13
	call dlt
LB_10454:
	bt r12,2
	jc LB_10455
	mov rdi,r8
	call dlt
LB_10455:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10456
	btr r12,0
	jmp LB_10457
LB_10456:
	bts r12,0
LB_10457:
	ret
MTC_LB_10436:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10458
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10459
	bt QWORD [rdi],0
	jc LB_10460
	btr r12,1
	jmp LB_10461
LB_10460:
	bts r12,1
LB_10461:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10459:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10462:
	cmp r15,0
	jz LB_10463
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10462
LB_10463:
; 	» "" _ ⊢ 0' : %_10350
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10350
 ; {>  %_10350~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10458:
NS_E_10343:
; 	|» 0'
NS_E_RDI_10343:
MTC_LB_10464:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10465
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10466
	bt QWORD [rdi],0
	jc LB_10467
	btr r12,2
	jmp LB_10468
LB_10467:
	bts r12,2
LB_10468:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10466:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10469
	btr r12,1
	jmp LB_10470
LB_10469:
	bts r12,1
LB_10470:
LB_10471:
	cmp r15,0
	jz LB_10472
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10471
LB_10472:
; _f10351 %_10333 ⊢ %_10334 : %_10334
 ; {>  %_10333~1':(_lst)◂(_p9998) }
; _f10351 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10473
	btr r12,0
	jmp LB_10474
LB_10473:
	bts r12,0
LB_10474:
	call NS_E_10351
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,3
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r14,rax
	btr r12,1
; ∎ %_10336
 ; {>  %_10336~1':_stg %_10335~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10475
	mov rdi,r13
	call dlt
LB_10475:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10476
	btr r12,0
	jmp LB_10477
LB_10476:
	bts r12,0
LB_10477:
	ret
MTC_LB_10465:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10478
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10479
	bt QWORD [rdi],0
	jc LB_10480
	btr r12,2
	jmp LB_10481
LB_10480:
	bts r12,2
LB_10481:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10479:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10482
	btr r12,1
	jmp LB_10483
LB_10482:
	bts r12,1
LB_10483:
LB_10484:
	cmp r15,0
	jz LB_10485
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10484
LB_10485:
MTC_LB_10486:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10487
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂0'
; 1' ⊢ °0◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10488
	bt QWORD [rdi],0
	jc LB_10489
	btr r12,2
	jmp LB_10490
LB_10489:
	bts r12,2
LB_10490:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10488:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_10491
	btr r12,0
	jmp LB_10492
LB_10491:
	bts r12,0
LB_10492:
LB_10493:
	cmp r15,0
	jz LB_10494
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10493
LB_10494:
; _f10089 %_10338 ⊢ %_10339 : %_10339
 ; {>  %_10338~0':_p10001 }
; _f10089 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_10089
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,6
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "%[ "
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " ] "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r14,rax
	btr r12,1
; ∎ %_10341
 ; {>  %_10341~1':_stg %_10340~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10495
	mov rdi,r13
	call dlt
LB_10495:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10496
	btr r12,0
	jmp LB_10497
LB_10496:
	bts r12,0
LB_10497:
	ret
MTC_LB_10487:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10498
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10499
	bt QWORD [rdi],0
	jc LB_10500
	btr r12,2
	jmp LB_10501
LB_10500:
	bts r12,2
LB_10501:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10499:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_10502
	btr r12,0
	jmp LB_10503
LB_10502:
	bts r12,0
LB_10503:
LB_10504:
	cmp r15,0
	jz LB_10505
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10504
LB_10505:
; ∎ %_10342
 ; {>  %_10342~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10498:
MTC_LB_10478:
NS_E_10331:
; 	|» 0'
NS_E_RDI_10331:
MTC_LB_10506:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10507
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' 3' }
; 0' ⊢ °0◂{ 1' 2' 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10508
	bt QWORD [rdi],0
	jc LB_10509
	btr r12,4
	jmp LB_10510
LB_10509:
	bts r12,4
LB_10510:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10508:
	mov r10,rdi
; 4' ⊢ { 1' 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10513
	btr r12,5
	jmp LB_10514
LB_10513:
	bts r12,5
LB_10514:
	mov r14,r11
	bt r12,5
	jc LB_10511
	btr r12,1
	jmp LB_10512
LB_10511:
	bts r12,1
LB_10512:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10517
	btr r12,5
	jmp LB_10518
LB_10517:
	bts r12,5
LB_10518:
	mov r8,r11
	bt r12,5
	jc LB_10515
	btr r12,2
	jmp LB_10516
LB_10515:
	bts r12,2
LB_10516:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_10521
	btr r12,5
	jmp LB_10522
LB_10521:
	bts r12,5
LB_10522:
	mov r9,r11
	bt r12,5
	jc LB_10519
	btr r12,3
	jmp LB_10520
LB_10519:
	bts r12,3
LB_10520:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10523:
	cmp r15,0
	jz LB_10524
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10523
LB_10524:
; _f10331 %_10309 ⊢ %_10310 : %_10310
 ; {>  %_10308~2':_p10004 %_10307~1':(_lst)◂(_p10005) %_10309~3':_p10003 }
; _f10331 3' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10529
	btr r12,0
	jmp LB_10530
LB_10529:
	bts r12,0
LB_10530:
	call NS_E_10331
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10527
	btr r12,2
	jmp LB_10528
LB_10527:
	bts r12,2
LB_10528:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10525
	btr r12,1
	jmp LB_10526
LB_10525:
	bts r12,1
LB_10526:
	add rsp,24
MTC_LB_10531:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10532
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂3'
; 2' ⊢ °0◂3'
	btr r12,4
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_10533
	bt QWORD [rdi],0
	jc LB_10534
	btr r12,4
	jmp LB_10535
LB_10534:
	bts r12,4
LB_10535:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10533:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10536
	btr r12,3
	jmp LB_10537
LB_10536:
	bts r12,3
LB_10537:
LB_10538:
	cmp r15,0
	jz LB_10539
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10538
LB_10539:
; _f10331 %_10311 ⊢ %_10312 : %_10312
 ; {>  %_10311~3':_p10003 %_10307~1':(_lst)◂(_p10005) %_10310~0':_stg }
; _f10331 3' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10544
	btr r12,0
	jmp LB_10545
LB_10544:
	bts r12,0
LB_10545:
	call NS_E_10331
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10546
	btr r12,2
	jmp LB_10547
LB_10546:
	bts r12,2
LB_10547:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10542
	btr r12,1
	jmp LB_10543
LB_10542:
	bts r12,1
LB_10543:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10540
	btr r12,0
	jmp LB_10541
LB_10540:
	bts r12,0
LB_10541:
	add rsp,24
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_10315
 ; {>  %_10314~2':_stg %_10313~0':_stg %_10307~1':(_lst)◂(_p10005) %_10315~3':_stg }
; 	∎ 3'
	bt r12,2
	jc LB_10548
	mov rdi,r8
	call dlt
LB_10548:
	bt r12,0
	jc LB_10549
	mov rdi,r13
	call dlt
LB_10549:
	bt r12,1
	jc LB_10550
	mov rdi,r14
	call dlt
LB_10550:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10551
	btr r12,0
	jmp LB_10552
LB_10551:
	bts r12,0
LB_10552:
	ret
MTC_LB_10532:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10553
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂3'
; 2' ⊢ °1◂3'
	btr r12,4
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_10554
	bt QWORD [rdi],0
	jc LB_10555
	btr r12,4
	jmp LB_10556
LB_10555:
	bts r12,4
LB_10556:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10554:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10557
	btr r12,3
	jmp LB_10558
LB_10557:
	bts r12,3
LB_10558:
LB_10559:
	cmp r15,0
	jz LB_10560
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10559
LB_10560:
; _f10275 %_10316 ⊢ %_10317 : %_10317
 ; {>  %_10307~1':(_lst)◂(_p10005) %_10316~3':_p10002 %_10310~0':_stg }
; _f10275 3' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10565
	btr r12,0
	jmp LB_10566
LB_10565:
	bts r12,0
LB_10566:
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10567
	btr r12,2
	jmp LB_10568
LB_10567:
	bts r12,2
LB_10568:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10563
	btr r12,1
	jmp LB_10564
LB_10563:
	bts r12,1
LB_10564:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10561
	btr r12,0
	jmp LB_10562
LB_10561:
	bts r12,0
LB_10562:
	add rsp,24
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_10320
 ; {>  %_10319~2':_stg %_10307~1':(_lst)◂(_p10005) %_10320~3':_stg %_10318~0':_stg }
; 	∎ 3'
	bt r12,2
	jc LB_10569
	mov rdi,r8
	call dlt
LB_10569:
	bt r12,1
	jc LB_10570
	mov rdi,r14
	call dlt
LB_10570:
	bt r12,0
	jc LB_10571
	mov rdi,r13
	call dlt
LB_10571:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10572
	btr r12,0
	jmp LB_10573
LB_10572:
	bts r12,0
LB_10573:
	ret
MTC_LB_10553:
MTC_LB_10507:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10574
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' }
; 0' ⊢ °1◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10575
	bt QWORD [rdi],0
	jc LB_10576
	btr r12,3
	jmp LB_10577
LB_10576:
	bts r12,3
LB_10577:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10575:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10580
	btr r12,4
	jmp LB_10581
LB_10580:
	bts r12,4
LB_10581:
	mov r14,r10
	bt r12,4
	jc LB_10578
	btr r12,1
	jmp LB_10579
LB_10578:
	bts r12,1
LB_10579:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10584
	btr r12,4
	jmp LB_10585
LB_10584:
	bts r12,4
LB_10585:
	mov r8,r10
	bt r12,4
	jc LB_10582
	btr r12,2
	jmp LB_10583
LB_10582:
	bts r12,2
LB_10583:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10586:
	cmp r15,0
	jz LB_10587
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10586
LB_10587:
MTC_LB_10588:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10589
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °0◂0'
; 2' ⊢ °0◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_10590
	bt QWORD [rdi],0
	jc LB_10591
	btr r12,3
	jmp LB_10592
LB_10591:
	bts r12,3
LB_10592:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10590:
	mov r9,rdi
	mov r13,r9
	bt r12,3
	jc LB_10593
	btr r12,0
	jmp LB_10594
LB_10593:
	bts r12,0
LB_10594:
LB_10595:
	cmp r15,0
	jz LB_10596
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10595
LB_10596:
; _f10331 %_10323 ⊢ %_10324 : %_10324
 ; {>  %_10323~0':_p10003 %_10321~1':(_lst)◂(_p10005) }
; _f10331 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_10331
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10597
	btr r12,1
	jmp LB_10598
LB_10597:
	bts r12,1
LB_10598:
	add rsp,16
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_10326
 ; {>  %_10326~2':_stg %_10321~1':(_lst)◂(_p10005) %_10325~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_10599
	mov rdi,r14
	call dlt
LB_10599:
	bt r12,0
	jc LB_10600
	mov rdi,r13
	call dlt
LB_10600:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10601
	btr r12,0
	jmp LB_10602
LB_10601:
	bts r12,0
LB_10602:
	ret
MTC_LB_10589:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10603
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °1◂0'
; 2' ⊢ °1◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_10604
	bt QWORD [rdi],0
	jc LB_10605
	btr r12,3
	jmp LB_10606
LB_10605:
	bts r12,3
LB_10606:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10604:
	mov r9,rdi
	mov r13,r9
	bt r12,3
	jc LB_10607
	btr r12,0
	jmp LB_10608
LB_10607:
	bts r12,0
LB_10608:
LB_10609:
	cmp r15,0
	jz LB_10610
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10609
LB_10610:
; _f10275 %_10327 ⊢ %_10328 : %_10328
 ; {>  %_10321~1':(_lst)◂(_p10005) %_10327~0':_p10002 }
; _f10275 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10611
	btr r12,1
	jmp LB_10612
LB_10611:
	bts r12,1
LB_10612:
	add rsp,16
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_10330
 ; {>  %_10330~2':_stg %_10321~1':(_lst)◂(_p10005) %_10329~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_10613
	mov rdi,r14
	call dlt
LB_10613:
	bt r12,0
	jc LB_10614
	mov rdi,r13
	call dlt
LB_10614:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10615
	btr r12,0
	jmp LB_10616
LB_10615:
	bts r12,0
LB_10616:
	ret
MTC_LB_10603:
MTC_LB_10574:
NS_E_10305:
; 	|» { 0' 1' 2' }
NS_E_RDI_10305:
; _f10343 %_10277 ⊢ %_10279 : %_10279
 ; {>  %_10278~2':_p9999 %_10276~0':_p10007 %_10277~1':_p9998 }
; _f10343 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10621
	btr r12,0
	jmp LB_10622
LB_10621:
	bts r12,0
LB_10622:
	call NS_E_10343
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10623
	btr r12,1
	jmp LB_10624
LB_10623:
	bts r12,1
LB_10624:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10619
	btr r12,2
	jmp LB_10620
LB_10619:
	bts r12,2
LB_10620:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10617
	btr r12,0
	jmp LB_10618
LB_10617:
	bts r12,0
LB_10618:
	add rsp,24
; _f10360 %_10278 ⊢ %_10280 : %_10280
 ; {>  %_10278~2':_p9999 %_10276~0':_p10007 %_10279~1':_stg }
; _f10360 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10629
	btr r12,0
	jmp LB_10630
LB_10629:
	bts r12,0
LB_10630:
	call NS_E_10360
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10631
	btr r12,2
	jmp LB_10632
LB_10631:
	bts r12,2
LB_10632:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10627
	btr r12,1
	jmp LB_10628
LB_10627:
	bts r12,1
LB_10628:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10625
	btr r12,0
	jmp LB_10626
LB_10625:
	bts r12,0
LB_10626:
	add rsp,24
MTC_LB_10633:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10634
; _emt_mov_ptn_to_ptn:{| 1110.. |},0' ⊢ °0◂3'
; 0' ⊢ °0◂3'
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10635
	bt QWORD [rdi],0
	jc LB_10636
	btr r12,4
	jmp LB_10637
LB_10636:
	bts r12,4
LB_10637:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10635:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10638
	btr r12,3
	jmp LB_10639
LB_10638:
	bts r12,3
LB_10639:
LB_10640:
	cmp r15,0
	jz LB_10641
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10640
LB_10641:
; _f9946 %_10281 ⊢ %_10282 : %_10282
 ; {>  %_10280~2':_stg %_10279~1':_stg %_10281~3':_p9935 }
; _f9946 3' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10646
	btr r12,0
	jmp LB_10647
LB_10646:
	bts r12,0
LB_10647:
	call NS_E_9946
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10644
	btr r12,2
	jmp LB_10645
LB_10644:
	bts r12,2
LB_10645:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10642
	btr r12,1
	jmp LB_10643
LB_10642:
	bts r12,1
LB_10643:
	add rsp,24
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r9,rax
	btr r12,3
; ∎ %_10286
 ; {>  %_10284~1':_stg %_10285~2':_stg %_10283~0':_stg %_10286~3':_stg }
; 	∎ 3'
	bt r12,1
	jc LB_10648
	mov rdi,r14
	call dlt
LB_10648:
	bt r12,2
	jc LB_10649
	mov rdi,r8
	call dlt
LB_10649:
	bt r12,0
	jc LB_10650
	mov rdi,r13
	call dlt
LB_10650:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10651
	btr r12,0
	jmp LB_10652
LB_10651:
	bts r12,0
LB_10652:
	ret
MTC_LB_10634:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10653
; _emt_mov_ptn_to_ptn:{| 1110.. |},0' ⊢ °1◂3'
; 0' ⊢ °1◂3'
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10654
	bt QWORD [rdi],0
	jc LB_10655
	btr r12,4
	jmp LB_10656
LB_10655:
	bts r12,4
LB_10656:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10654:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10657
	btr r12,3
	jmp LB_10658
LB_10657:
	bts r12,3
LB_10658:
LB_10659:
	cmp r15,0
	jz LB_10660
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10659
LB_10660:
; » _^ ..
	mov rax,8
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r13,rax
	btr r12,0
; ∎ %_10290
 ; {>  %_10290~0':_stg %_10288~1':_stg %_10287~3':_r64 %_10289~2':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_10661
	mov rdi,r14
	call dlt
LB_10661:
	bt r12,3
	jc LB_10662
	mov rdi,r9
	call dlt
LB_10662:
	bt r12,2
	jc LB_10663
	mov rdi,r8
	call dlt
LB_10663:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10653:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10664
; _emt_mov_ptn_to_ptn:{| 1110.. |},0' ⊢ °2◂{  }
; 0' ⊢ °2◂{  }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10665
	bt QWORD [rdi],0
	jc LB_10666
	btr r12,3
	jmp LB_10667
LB_10666:
	bts r12,3
LB_10667:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10665:
	mov r9,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10668:
	cmp r15,0
	jz LB_10669
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10668
LB_10669:
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\151\130 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r13,rax
	btr r12,0
; ∎ %_10293
 ; {>  %_10293~0':_stg %_10292~2':_stg %_10291~1':_stg }
; 	∎ 0'
	bt r12,2
	jc LB_10670
	mov rdi,r8
	call dlt
LB_10670:
	bt r12,1
	jc LB_10671
	mov rdi,r14
	call dlt
LB_10671:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10664:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_10672
; _emt_mov_ptn_to_ptn:{| 1110.. |},0' ⊢ °3◂3'
; 0' ⊢ °3◂3'
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10673
	bt QWORD [rdi],0
	jc LB_10674
	btr r12,4
	jmp LB_10675
LB_10674:
	bts r12,4
LB_10675:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10673:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10676
	btr r12,3
	jmp LB_10677
LB_10676:
	bts r12,3
LB_10677:
LB_10678:
	cmp r15,0
	jz LB_10679
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10678
LB_10679:
; _f10089 %_10294 ⊢ %_10295 : %_10295
 ; {>  %_10294~3':_p10001 %_10280~2':_stg %_10279~1':_stg }
; _f10089 3' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10684
	btr r12,0
	jmp LB_10685
LB_10684:
	bts r12,0
LB_10685:
	call NS_E_10089
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10682
	btr r12,2
	jmp LB_10683
LB_10682:
	bts r12,2
LB_10683:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10680
	btr r12,1
	jmp LB_10681
LB_10680:
	bts r12,1
LB_10681:
	add rsp,24
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\187 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r9,rax
	btr r12,3
; ∎ %_10299
 ; {>  %_10299~3':_stg %_10297~1':_stg %_10296~0':_stg %_10298~2':_stg }
; 	∎ 3'
	bt r12,1
	jc LB_10686
	mov rdi,r14
	call dlt
LB_10686:
	bt r12,0
	jc LB_10687
	mov rdi,r13
	call dlt
LB_10687:
	bt r12,2
	jc LB_10688
	mov rdi,r8
	call dlt
LB_10688:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10689
	btr r12,0
	jmp LB_10690
LB_10689:
	bts r12,0
LB_10690:
	ret
MTC_LB_10672:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_10691
; _emt_mov_ptn_to_ptn:{| 1110.. |},0' ⊢ °4◂{ 3' 4' }
; 0' ⊢ °4◂{ 3' 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10692
	bt QWORD [rdi],0
	jc LB_10693
	btr r12,5
	jmp LB_10694
LB_10693:
	bts r12,5
LB_10694:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10692:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10697
	btr r12,6
	jmp LB_10698
LB_10697:
	bts r12,6
LB_10698:
	mov r9,rcx
	bt r12,6
	jc LB_10695
	btr r12,3
	jmp LB_10696
LB_10695:
	bts r12,3
LB_10696:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10701
	btr r12,6
	jmp LB_10702
LB_10701:
	bts r12,6
LB_10702:
	mov r10,rcx
	bt r12,6
	jc LB_10699
	btr r12,4
	jmp LB_10700
LB_10699:
	bts r12,4
LB_10700:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10703:
	cmp r15,0
	jz LB_10704
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10703
LB_10704:
; » _^ ..
	mov rax,15
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\187 _^ "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5f
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_5e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "//\n"
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_10304
 ; {>  %_10304~0':_stg %_10302~1':_stg %_10303~2':_stg %_10301~4':(_lst)◂(_p10008) %_10300~3':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_10705
	mov rdi,r14
	call dlt
LB_10705:
	bt r12,2
	jc LB_10706
	mov rdi,r8
	call dlt
LB_10706:
	bt r12,4
	jc LB_10707
	mov rdi,r10
	call dlt
LB_10707:
	bt r12,3
	jc LB_10708
	mov rdi,r9
	call dlt
LB_10708:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10691:
NS_E_10275:
; 	|» 0'
NS_E_RDI_10275:
MTC_LB_10709:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10710
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' 3' } 4' }
; 0' ⊢ °0◂{ { 1' 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10711
	bt QWORD [rdi],0
	jc LB_10712
	btr r12,5
	jmp LB_10713
LB_10712:
	bts r12,5
LB_10713:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10711:
	mov r11,rdi
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10726
	btr r12,6
	jmp LB_10727
LB_10726:
	bts r12,6
LB_10727:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10716
	btr r12,4
	jmp LB_10717
LB_10716:
	bts r12,4
LB_10717:
	mov r14,r10
	bt r12,4
	jc LB_10714
	btr r12,1
	jmp LB_10715
LB_10714:
	bts r12,1
LB_10715:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10720
	btr r12,4
	jmp LB_10721
LB_10720:
	bts r12,4
LB_10721:
	mov r8,r10
	bt r12,4
	jc LB_10718
	btr r12,2
	jmp LB_10719
LB_10718:
	bts r12,2
LB_10719:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_10724
	btr r12,4
	jmp LB_10725
LB_10724:
	bts r12,4
LB_10725:
	mov r9,r10
	bt r12,4
	jc LB_10722
	btr r12,3
	jmp LB_10723
LB_10722:
	bts r12,3
LB_10723:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10730
	btr r12,6
	jmp LB_10731
LB_10730:
	bts r12,6
LB_10731:
	mov r10,rcx
	bt r12,6
	jc LB_10728
	btr r12,4
	jmp LB_10729
LB_10728:
	bts r12,4
LB_10729:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10732:
	cmp r15,0
	jz LB_10733
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10732
LB_10733:
; _f10305 %_10264 ⊢ %_10266 : %_10266
 ; {>  %_10264~{ 1' 2' 3' }:{ _p10007 _p9998 _p9999 } %_10265~4':_p10002 }
; _f10305 { 1' 2' 3' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110.. |},{ 1' 2' 3' } ⊢ { 0' 1' 2' }
	mov r13,r14
	bt r12,1
	jc LB_10736
	btr r12,0
	jmp LB_10737
LB_10736:
	bts r12,0
LB_10737:
	mov r14,r8
	bt r12,2
	jc LB_10738
	btr r12,1
	jmp LB_10739
LB_10738:
	bts r12,1
LB_10739:
	mov r8,r9
	bt r12,3
	jc LB_10740
	btr r12,2
	jmp LB_10741
LB_10740:
	bts r12,2
LB_10741:
	call NS_E_10305
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_10734
	btr r12,4
	jmp LB_10735
LB_10734:
	bts r12,4
LB_10735:
	add rsp,16
; _f10275 %_10265 ⊢ %_10267 : %_10267
 ; {>  %_10266~0':_stg %_10265~4':_p10002 }
; _f10275 4' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_10744
	btr r12,0
	jmp LB_10745
LB_10744:
	bts r12,0
LB_10745:
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10746
	btr r12,1
	jmp LB_10747
LB_10746:
	bts r12,1
LB_10747:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10742
	btr r12,0
	jmp LB_10743
LB_10742:
	bts r12,0
LB_10743:
	add rsp,16
; » _^ ..
	mov rax,0
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_10270
 ; {>  %_10269~1':_stg %_10270~2':_stg %_10268~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_10748
	mov rdi,r14
	call dlt
LB_10748:
	bt r12,0
	jc LB_10749
	mov rdi,r13
	call dlt
LB_10749:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10750
	btr r12,0
	jmp LB_10751
LB_10750:
	bts r12,0
LB_10751:
	ret
MTC_LB_10710:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10752
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10753
	bt QWORD [rdi],0
	jc LB_10754
	btr r12,2
	jmp LB_10755
LB_10754:
	bts r12,2
LB_10755:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10753:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10756
	btr r12,1
	jmp LB_10757
LB_10756:
	bts r12,1
LB_10757:
LB_10758:
	cmp r15,0
	jz LB_10759
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10758
LB_10759:
; _f10331 %_10271 ⊢ %_10272 : %_10272
 ; {>  %_10271~1':_p10003 }
; _f10331 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10760
	btr r12,0
	jmp LB_10761
LB_10760:
	bts r12,0
LB_10761:
	call NS_E_10331
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_10272
 ; {>  %_10272~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10752:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10762
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10763
	bt QWORD [rdi],0
	jc LB_10764
	btr r12,2
	jmp LB_10765
LB_10764:
	bts r12,2
LB_10765:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10763:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10766
	btr r12,1
	jmp LB_10767
LB_10766:
	bts r12,1
LB_10767:
LB_10768:
	cmp r15,0
	jz LB_10769
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10768
LB_10769:
; 	» "\226\136\142 ..\n" _ ⊢ 0' : %_10274
	mov rdi,7
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_0a_2e_2e_20_8e_88_e2
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10274
 ; {>  %_10273~1':_p9998 %_10274~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_10770
	mov rdi,r14
	call dlt
LB_10770:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10762:
NS_E_10262:
; 	|» 0'
NS_E_RDI_10262:
MTC_LB_10771:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10772
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' } 3' }
; 0' ⊢ °0◂{ { 1' 2' } 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10773
	bt QWORD [rdi],0
	jc LB_10774
	btr r12,4
	jmp LB_10775
LB_10774:
	bts r12,4
LB_10775:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10773:
	mov r10,rdi
; 4' ⊢ { { 1' 2' } 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10784
	btr r12,5
	jmp LB_10785
LB_10784:
	bts r12,5
LB_10785:
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_10778
	btr r12,3
	jmp LB_10779
LB_10778:
	bts r12,3
LB_10779:
	mov r14,r9
	bt r12,3
	jc LB_10776
	btr r12,1
	jmp LB_10777
LB_10776:
	bts r12,1
LB_10777:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_10782
	btr r12,3
	jmp LB_10783
LB_10782:
	bts r12,3
LB_10783:
	mov r8,r9
	bt r12,3
	jc LB_10780
	btr r12,2
	jmp LB_10781
LB_10780:
	bts r12,2
LB_10781:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10788
	btr r12,5
	jmp LB_10789
LB_10788:
	bts r12,5
LB_10789:
	mov r9,r11
	bt r12,5
	jc LB_10786
	btr r12,3
	jmp LB_10787
LB_10786:
	bts r12,3
LB_10787:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10790:
	cmp r15,0
	jz LB_10791
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10790
LB_10791:
; _f10262 %_10256 ⊢ %_10257 : %_10257
 ; {>  %_10255~2':t3991'(-1) %_10256~3':(_lst)◂({ _stg t3991'(-1) }) %_10254~1':_stg }
; _f10262 3' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10796
	btr r12,0
	jmp LB_10797
LB_10796:
	bts r12,0
LB_10797:
	call NS_E_10262
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10794
	btr r12,2
	jmp LB_10795
LB_10794:
	bts r12,2
LB_10795:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10792
	btr r12,1
	jmp LB_10793
LB_10792:
	bts r12,1
LB_10793:
	add rsp,24
; » _^ ..
	mov rax,5
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_10260
 ; {>  %_10259~0':_stg %_10255~2':t3991'(-1) %_10258~1':_stg %_10260~3':_stg }
; 	∎ 3'
	bt r12,0
	jc LB_10798
	mov rdi,r13
	call dlt
LB_10798:
	bt r12,2
	jc LB_10799
	mov rdi,r8
	call dlt
LB_10799:
	bt r12,1
	jc LB_10800
	mov rdi,r14
	call dlt
LB_10800:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10801
	btr r12,0
	jmp LB_10802
LB_10801:
	bts r12,0
LB_10802:
	ret
MTC_LB_10772:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10803
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10804
	bt QWORD [rdi],0
	jc LB_10805
	btr r12,1
	jmp LB_10806
LB_10805:
	bts r12,1
LB_10806:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10804:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10807:
	cmp r15,0
	jz LB_10808
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10807
LB_10808:
; 	» "" _ ⊢ 0' : %_10261
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10261
 ; {>  %_10261~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10803:
NS_E_10252:
; 	|» 0'
NS_E_RDI_10252:
MTC_LB_10809:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10810
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' 3' } 4' }
; 0' ⊢ °0◂{ { 1' 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10811
	bt QWORD [rdi],0
	jc LB_10812
	btr r12,5
	jmp LB_10813
LB_10812:
	bts r12,5
LB_10813:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10811:
	mov r11,rdi
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10826
	btr r12,6
	jmp LB_10827
LB_10826:
	bts r12,6
LB_10827:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10816
	btr r12,4
	jmp LB_10817
LB_10816:
	bts r12,4
LB_10817:
	mov r14,r10
	bt r12,4
	jc LB_10814
	btr r12,1
	jmp LB_10815
LB_10814:
	bts r12,1
LB_10815:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10820
	btr r12,4
	jmp LB_10821
LB_10820:
	bts r12,4
LB_10821:
	mov r8,r10
	bt r12,4
	jc LB_10818
	btr r12,2
	jmp LB_10819
LB_10818:
	bts r12,2
LB_10819:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_10824
	btr r12,4
	jmp LB_10825
LB_10824:
	bts r12,4
LB_10825:
	mov r9,r10
	bt r12,4
	jc LB_10822
	btr r12,3
	jmp LB_10823
LB_10822:
	bts r12,3
LB_10823:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10830
	btr r12,6
	jmp LB_10831
LB_10830:
	bts r12,6
LB_10831:
	mov r10,rcx
	bt r12,6
	jc LB_10828
	btr r12,4
	jmp LB_10829
LB_10828:
	bts r12,4
LB_10829:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10832:
	cmp r15,0
	jz LB_10833
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10832
LB_10833:
; _f10360 %_10240 ⊢ %_10243 : %_10243
 ; {>  %_10240~2':_p9999 %_10239~1':_stg %_10242~4':(_lst)◂({ _stg _p9999 _p10002 }) %_10241~3':_p10002 }
; _f10360 2' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10840
	btr r12,0
	jmp LB_10841
LB_10840:
	bts r12,0
LB_10841:
	call NS_E_10360
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10838
	btr r12,4
	jmp LB_10839
LB_10838:
	bts r12,4
LB_10839:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10836
	btr r12,3
	jmp LB_10837
LB_10836:
	bts r12,3
LB_10837:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10834
	btr r12,1
	jmp LB_10835
LB_10834:
	bts r12,1
LB_10835:
	add rsp,32
; _f10252 %_10242 ⊢ %_10244 : %_10244
 ; {>  %_10243~0':_stg %_10239~1':_stg %_10242~4':(_lst)◂({ _stg _p9999 _p10002 }) %_10241~3':_p10002 }
; _f10252 4' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_10848
	btr r12,0
	jmp LB_10849
LB_10848:
	bts r12,0
LB_10849:
	call NS_E_10252
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10850
	btr r12,2
	jmp LB_10851
LB_10850:
	bts r12,2
LB_10851:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10846
	btr r12,3
	jmp LB_10847
LB_10846:
	bts r12,3
LB_10847:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10844
	btr r12,1
	jmp LB_10845
LB_10844:
	bts r12,1
LB_10845:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10842
	btr r12,0
	jmp LB_10843
LB_10842:
	bts r12,0
LB_10843:
	add rsp,32
; _f10275 %_10241 ⊢ %_10245 : %_10245
 ; {>  %_10243~0':_stg %_10239~1':_stg %_10244~2':_stg %_10241~3':_p10002 }
; _f10275 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10858
	btr r12,0
	jmp LB_10859
LB_10858:
	bts r12,0
LB_10859:
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_10860
	btr r12,3
	jmp LB_10861
LB_10860:
	bts r12,3
LB_10861:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10856
	btr r12,2
	jmp LB_10857
LB_10856:
	bts r12,2
LB_10857:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10854
	btr r12,1
	jmp LB_10855
LB_10854:
	bts r12,1
LB_10855:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10852
	btr r12,0
	jmp LB_10853
LB_10852:
	bts r12,0
LB_10853:
	add rsp,32
; » _^ ..
	mov rax,4
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r9
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*3],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r9
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*3]
	cld
	rep movsb
	pop rcx
; //
	mov r10,rax
	btr r12,4
; ∎ %_10250
 ; {>  %_10249~2':_stg %_10247~0':_stg %_10246~1':_stg %_10250~4':_stg %_10248~3':_stg }
; 	∎ 4'
	bt r12,2
	jc LB_10862
	mov rdi,r8
	call dlt
LB_10862:
	bt r12,0
	jc LB_10863
	mov rdi,r13
	call dlt
LB_10863:
	bt r12,1
	jc LB_10864
	mov rdi,r14
	call dlt
LB_10864:
	bt r12,3
	jc LB_10865
	mov rdi,r9
	call dlt
LB_10865:
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_10866
	btr r12,0
	jmp LB_10867
LB_10866:
	bts r12,0
LB_10867:
	ret
MTC_LB_10810:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10868
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10869
	bt QWORD [rdi],0
	jc LB_10870
	btr r12,1
	jmp LB_10871
LB_10870:
	bts r12,1
LB_10871:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10869:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10872:
	cmp r15,0
	jz LB_10873
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10872
LB_10873:
; 	» "" _ ⊢ 0' : %_10251
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10251
 ; {>  %_10251~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10868:
NS_E_10237:
; 	|» 0'
NS_E_RDI_10237:
MTC_LB_10874:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10875
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10876
	bt QWORD [rdi],0
	jc LB_10877
	btr r12,3
	jmp LB_10878
LB_10877:
	bts r12,3
LB_10878:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10876:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10881
	btr r12,4
	jmp LB_10882
LB_10881:
	bts r12,4
LB_10882:
	mov r14,r10
	bt r12,4
	jc LB_10879
	btr r12,1
	jmp LB_10880
LB_10879:
	bts r12,1
LB_10880:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10885
	btr r12,4
	jmp LB_10886
LB_10885:
	bts r12,4
LB_10886:
	mov r8,r10
	bt r12,4
	jc LB_10883
	btr r12,2
	jmp LB_10884
LB_10883:
	bts r12,2
LB_10884:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10887:
	cmp r15,0
	jz LB_10888
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10887
LB_10888:
; _f10360 %_10222 ⊢ %_10224 : %_10224
 ; {>  %_10222~1':_p9999 %_10223~2':_p10002 }
; _f10360 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10891
	btr r12,0
	jmp LB_10892
LB_10891:
	bts r12,0
LB_10892:
	call NS_E_10360
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10889
	btr r12,2
	jmp LB_10890
LB_10889:
	bts r12,2
LB_10890:
	add rsp,16
; _f10275 %_10223 ⊢ %_10225 : %_10225
 ; {>  %_10224~0':_stg %_10223~2':_p10002 }
; _f10275 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10895
	btr r12,0
	jmp LB_10896
LB_10895:
	bts r12,0
LB_10896:
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10897
	btr r12,1
	jmp LB_10898
LB_10897:
	bts r12,1
LB_10898:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10893
	btr r12,0
	jmp LB_10894
LB_10893:
	bts r12,0
LB_10894:
	add rsp,16
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_10228
 ; {>  %_10226~0':_stg %_10227~1':_stg %_10228~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_10899
	mov rdi,r13
	call dlt
LB_10899:
	bt r12,1
	jc LB_10900
	mov rdi,r14
	call dlt
LB_10900:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10901
	btr r12,0
	jmp LB_10902
LB_10901:
	bts r12,0
LB_10902:
	ret
MTC_LB_10875:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10903
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10904
	bt QWORD [rdi],0
	jc LB_10905
	btr r12,2
	jmp LB_10906
LB_10905:
	bts r12,2
LB_10906:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10904:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10907
	btr r12,1
	jmp LB_10908
LB_10907:
	bts r12,1
LB_10908:
LB_10909:
	cmp r15,0
	jz LB_10910
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10909
LB_10910:
; _f10089 %_10229 ⊢ %_10230 : %_10230
 ; {>  %_10229~1':_p10001 }
; _f10089 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10911
	btr r12,0
	jmp LB_10912
LB_10911:
	bts r12,0
LB_10912:
	call NS_E_10089
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,4
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r14,rax
	btr r12,1
; ∎ %_10232
 ; {>  %_10231~0':_stg %_10232~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10913
	mov rdi,r13
	call dlt
LB_10913:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10914
	btr r12,0
	jmp LB_10915
LB_10914:
	bts r12,0
LB_10915:
	ret
MTC_LB_10903:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10916
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10917
	bt QWORD [rdi],0
	jc LB_10918
	btr r12,2
	jmp LB_10919
LB_10918:
	bts r12,2
LB_10919:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10917:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10920
	btr r12,1
	jmp LB_10921
LB_10920:
	bts r12,1
LB_10921:
LB_10922:
	cmp r15,0
	jz LB_10923
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10922
LB_10923:
; _f10275 %_10233 ⊢ %_10234 : %_10234
 ; {>  %_10233~1':_p10002 }
; _f10275 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10924
	btr r12,0
	jmp LB_10925
LB_10924:
	bts r12,0
LB_10925:
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,5
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; " \194\171 \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_ab
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r14,rax
	btr r12,1
; ∎ %_10236
 ; {>  %_10235~0':_stg %_10236~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10926
	mov rdi,r13
	call dlt
LB_10926:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10927
	btr r12,0
	jmp LB_10928
LB_10927:
	bts r12,0
LB_10928:
	ret
MTC_LB_10916:
NS_E_10220:
; 	|» 0'
NS_E_RDI_10220:
MTC_LB_10929:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10930
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' 3' 4' 5' 6' }
; 0' ⊢ °0◂{ 1' 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_10931
	bt QWORD [rdi],0
	jc LB_10932
	btr r12,7
	jmp LB_10933
LB_10932:
	bts r12,7
LB_10933:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10931:
	mov rdx,rdi
; 7' ⊢ { 1' 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_10936
	btr r12,8
	jmp LB_10937
LB_10936:
	bts r12,8
LB_10937:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10934
	btr r12,1
	jmp LB_10935
LB_10934:
	bts r12,1
LB_10935:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_10940
	btr r12,8
	jmp LB_10941
LB_10940:
	bts r12,8
LB_10941:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10938
	btr r12,2
	jmp LB_10939
LB_10938:
	bts r12,2
LB_10939:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_10944
	btr r12,8
	jmp LB_10945
LB_10944:
	bts r12,8
LB_10945:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10942
	btr r12,3
	jmp LB_10943
LB_10942:
	bts r12,3
LB_10943:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_10948
	btr r12,8
	jmp LB_10949
LB_10948:
	bts r12,8
LB_10949:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10946
	btr r12,4
	jmp LB_10947
LB_10946:
	bts r12,4
LB_10947:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_10952
	btr r12,8
	jmp LB_10953
LB_10952:
	bts r12,8
LB_10953:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10950
	btr r12,5
	jmp LB_10951
LB_10950:
	bts r12,5
LB_10951:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],5
	jc LB_10956
	btr r12,8
	jmp LB_10957
LB_10956:
	bts r12,8
LB_10957:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10954
	btr r12,6
	jmp LB_10955
LB_10954:
	bts r12,6
LB_10955:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10958:
	cmp r15,0
	jz LB_10959
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10958
LB_10959:
; _f10360 %_10197 ⊢ %_10203 : %_10203
 ; {>  %_10200~4':_p9991 %_10202~6':_p9989 %_10201~5':(_opn)◂(_p9989) %_10199~3':_p9990 %_10198~2':_p10002 %_10197~1':_p9999 }
; _f10360 1' ⊢ 0'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10970
	btr r12,0
	jmp LB_10971
LB_10970:
	bts r12,0
LB_10971:
	call NS_E_10360
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_10968
	btr r12,6
	jmp LB_10969
LB_10968:
	bts r12,6
LB_10969:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10966
	btr r12,5
	jmp LB_10967
LB_10966:
	bts r12,5
LB_10967:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10964
	btr r12,4
	jmp LB_10965
LB_10964:
	bts r12,4
LB_10965:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10962
	btr r12,3
	jmp LB_10963
LB_10962:
	bts r12,3
LB_10963:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10960
	btr r12,2
	jmp LB_10961
LB_10960:
	bts r12,2
LB_10961:
	add rsp,48
; _f10275 %_10198 ⊢ %_10204 : %_10204
 ; {>  %_10200~4':_p9991 %_10202~6':_p9989 %_10201~5':(_opn)◂(_p9989) %_10199~3':_p9990 %_10198~2':_p10002 %_10203~0':_stg }
; _f10275 2' ⊢ 1'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10982
	btr r12,0
	jmp LB_10983
LB_10982:
	bts r12,0
LB_10983:
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10984
	btr r12,1
	jmp LB_10985
LB_10984:
	bts r12,1
LB_10985:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_10980
	btr r12,6
	jmp LB_10981
LB_10980:
	bts r12,6
LB_10981:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10978
	btr r12,5
	jmp LB_10979
LB_10978:
	bts r12,5
LB_10979:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10976
	btr r12,4
	jmp LB_10977
LB_10976:
	bts r12,4
LB_10977:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10974
	btr r12,3
	jmp LB_10975
LB_10974:
	bts r12,3
LB_10975:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10972
	btr r12,0
	jmp LB_10973
LB_10972:
	bts r12,0
LB_10973:
	add rsp,48
; _f10220 %_10202 ⊢ %_10205 : %_10205
 ; {>  %_10204~1':_stg %_10200~4':_p9991 %_10202~6':_p9989 %_10201~5':(_opn)◂(_p9989) %_10199~3':_p9990 %_10203~0':_stg }
; _f10220 6' ⊢ 2'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_10996
	btr r12,0
	jmp LB_10997
LB_10996:
	bts r12,0
LB_10997:
	call NS_E_10220
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10998
	btr r12,2
	jmp LB_10999
LB_10998:
	bts r12,2
LB_10999:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_10994
	btr r12,5
	jmp LB_10995
LB_10994:
	bts r12,5
LB_10995:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_10992
	btr r12,4
	jmp LB_10993
LB_10992:
	bts r12,4
LB_10993:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10990
	btr r12,3
	jmp LB_10991
LB_10990:
	bts r12,3
LB_10991:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10988
	btr r12,1
	jmp LB_10989
LB_10988:
	bts r12,1
LB_10989:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10986
	btr r12,0
	jmp LB_10987
LB_10986:
	bts r12,0
LB_10987:
	add rsp,48
; » _^ ..
	mov rax,12
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. \226\138\162 "
	mov rsi,0x_e2_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
; //
	mov rcx,rax
	btr r12,6
; ∎ %_10209
 ; {>  %_10206~0':_stg %_10200~4':_p9991 %_10201~5':(_opn)◂(_p9989) %_10199~3':_p9990 %_10208~2':_stg %_10209~6':_stg %_10207~1':_stg }
; 	∎ 6'
	bt r12,0
	jc LB_11000
	mov rdi,r13
	call dlt
LB_11000:
	bt r12,4
	jc LB_11001
	mov rdi,r10
	call dlt
LB_11001:
	bt r12,5
	jc LB_11002
	mov rdi,r11
	call dlt
LB_11002:
	bt r12,3
	jc LB_11003
	mov rdi,r9
	call dlt
LB_11003:
	bt r12,2
	jc LB_11004
	mov rdi,r8
	call dlt
LB_11004:
	bt r12,1
	jc LB_11005
	mov rdi,r14
	call dlt
LB_11005:
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_11006
	btr r12,0
	jmp LB_11007
LB_11006:
	bts r12,0
LB_11007:
	ret
MTC_LB_10930:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11008
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' 3' 4' 5' }
; 0' ⊢ °1◂{ 1' 2' 3' 4' 5' }
	btr r12,6
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11009
	bt QWORD [rdi],0
	jc LB_11010
	btr r12,6
	jmp LB_11011
LB_11010:
	bts r12,6
LB_11011:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11009:
	mov rcx,rdi
; 6' ⊢ { 1' 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_11014
	btr r12,7
	jmp LB_11015
LB_11014:
	bts r12,7
LB_11015:
	mov r14,rdx
	bt r12,7
	jc LB_11012
	btr r12,1
	jmp LB_11013
LB_11012:
	bts r12,1
LB_11013:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_11018
	btr r12,7
	jmp LB_11019
LB_11018:
	bts r12,7
LB_11019:
	mov r8,rdx
	bt r12,7
	jc LB_11016
	btr r12,2
	jmp LB_11017
LB_11016:
	bts r12,2
LB_11017:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_11022
	btr r12,7
	jmp LB_11023
LB_11022:
	bts r12,7
LB_11023:
	mov r9,rdx
	bt r12,7
	jc LB_11020
	btr r12,3
	jmp LB_11021
LB_11020:
	bts r12,3
LB_11021:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_11026
	btr r12,7
	jmp LB_11027
LB_11026:
	bts r12,7
LB_11027:
	mov r10,rdx
	bt r12,7
	jc LB_11024
	btr r12,4
	jmp LB_11025
LB_11024:
	bts r12,4
LB_11025:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*4]
	mov rdx,rax
	bt QWORD [rdi],4
	jc LB_11030
	btr r12,7
	jmp LB_11031
LB_11030:
	bts r12,7
LB_11031:
	mov r11,rdx
	bt r12,7
	jc LB_11028
	btr r12,5
	jmp LB_11029
LB_11028:
	bts r12,5
LB_11029:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11032:
	cmp r15,0
	jz LB_11033
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11032
LB_11033:
; _f10360 %_10210 ⊢ %_10215 : %_10215
 ; {>  %_10213~4':_p9991 %_10211~2':_p10002 %_10210~1':_p9999 %_10212~3':_p9990 %_10214~5':(_opn)◂(_p9989) }
; _f10360 1' ⊢ 0'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11042
	btr r12,0
	jmp LB_11043
LB_11042:
	bts r12,0
LB_11043:
	call NS_E_10360
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_11040
	btr r12,5
	jmp LB_11041
LB_11040:
	bts r12,5
LB_11041:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11038
	btr r12,4
	jmp LB_11039
LB_11038:
	bts r12,4
LB_11039:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11036
	btr r12,3
	jmp LB_11037
LB_11036:
	bts r12,3
LB_11037:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11034
	btr r12,2
	jmp LB_11035
LB_11034:
	bts r12,2
LB_11035:
	add rsp,40
; _f10275 %_10211 ⊢ %_10216 : %_10216
 ; {>  %_10213~4':_p9991 %_10215~0':_stg %_10211~2':_p10002 %_10212~3':_p9990 %_10214~5':(_opn)◂(_p9989) }
; _f10275 2' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11052
	btr r12,0
	jmp LB_11053
LB_11052:
	bts r12,0
LB_11053:
	call NS_E_10275
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11054
	btr r12,1
	jmp LB_11055
LB_11054:
	bts r12,1
LB_11055:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_11050
	btr r12,5
	jmp LB_11051
LB_11050:
	bts r12,5
LB_11051:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11048
	btr r12,4
	jmp LB_11049
LB_11048:
	bts r12,4
LB_11049:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11046
	btr r12,3
	jmp LB_11047
LB_11046:
	bts r12,3
LB_11047:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11044
	btr r12,0
	jmp LB_11045
LB_11044:
	bts r12,0
LB_11045:
	add rsp,40
; » _^ ..
	mov rax,13
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. \226\138\162 "
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_e2
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_10219
 ; {>  %_10213~4':_p9991 %_10219~2':_stg %_10212~3':_p9990 %_10217~0':_stg %_10214~5':(_opn)◂(_p9989) %_10218~1':_stg }
; 	∎ 2'
	bt r12,4
	jc LB_11056
	mov rdi,r10
	call dlt
LB_11056:
	bt r12,3
	jc LB_11057
	mov rdi,r9
	call dlt
LB_11057:
	bt r12,0
	jc LB_11058
	mov rdi,r13
	call dlt
LB_11058:
	bt r12,5
	jc LB_11059
	mov rdi,r11
	call dlt
LB_11059:
	bt r12,1
	jc LB_11060
	mov rdi,r14
	call dlt
LB_11060:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11061
	btr r12,0
	jmp LB_11062
LB_11061:
	bts r12,0
LB_11062:
	ret
MTC_LB_11008:
NS_E_10195:
; 	|» 0'
NS_E_RDI_10195:
MTC_LB_11063:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11064
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' 3' 4' 5' }
; 0' ⊢ °0◂{ 1' 2' 3' 4' 5' }
	btr r12,6
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11065
	bt QWORD [rdi],0
	jc LB_11066
	btr r12,6
	jmp LB_11067
LB_11066:
	bts r12,6
LB_11067:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11065:
	mov rcx,rdi
; 6' ⊢ { 1' 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_11070
	btr r12,7
	jmp LB_11071
LB_11070:
	bts r12,7
LB_11071:
	mov r14,rdx
	bt r12,7
	jc LB_11068
	btr r12,1
	jmp LB_11069
LB_11068:
	bts r12,1
LB_11069:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_11074
	btr r12,7
	jmp LB_11075
LB_11074:
	bts r12,7
LB_11075:
	mov r8,rdx
	bt r12,7
	jc LB_11072
	btr r12,2
	jmp LB_11073
LB_11072:
	bts r12,2
LB_11073:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_11078
	btr r12,7
	jmp LB_11079
LB_11078:
	bts r12,7
LB_11079:
	mov r9,rdx
	bt r12,7
	jc LB_11076
	btr r12,3
	jmp LB_11077
LB_11076:
	bts r12,3
LB_11077:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_11082
	btr r12,7
	jmp LB_11083
LB_11082:
	bts r12,7
LB_11083:
	mov r10,rdx
	bt r12,7
	jc LB_11080
	btr r12,4
	jmp LB_11081
LB_11080:
	bts r12,4
LB_11081:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*4]
	mov rdx,rax
	bt QWORD [rdi],4
	jc LB_11086
	btr r12,7
	jmp LB_11087
LB_11086:
	bts r12,7
LB_11087:
	mov r11,rdx
	bt r12,7
	jc LB_11084
	btr r12,5
	jmp LB_11085
LB_11084:
	bts r12,5
LB_11085:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11088:
	cmp r15,0
	jz LB_11089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11088
LB_11089:
; _f10195 %_10186 ⊢ %_10187 : %_10187
 ; {>  %_10186~5':_p9988 %_10182~1':(_opn)◂(_stg) %_10184~3':_p9991 %_10185~4':(_opn)◂(_p9988) %_10183~2':_p9990 }
; _f10195 5' ⊢ 0'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_11098
	btr r12,0
	jmp LB_11099
LB_11098:
	bts r12,0
LB_11099:
	call NS_E_10195
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_11096
	btr r12,4
	jmp LB_11097
LB_11096:
	bts r12,4
LB_11097:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11094
	btr r12,3
	jmp LB_11095
LB_11094:
	bts r12,3
LB_11095:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11092
	btr r12,2
	jmp LB_11093
LB_11092:
	bts r12,2
LB_11093:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11090
	btr r12,1
	jmp LB_11091
LB_11090:
	bts r12,1
LB_11091:
	add rsp,40
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r11,rax
	btr r12,5
; ∎ %_10189
 ; {>  %_10188~0':_stg %_10182~1':(_opn)◂(_stg) %_10189~5':_stg %_10184~3':_p9991 %_10185~4':(_opn)◂(_p9988) %_10183~2':_p9990 }
; 	∎ 5'
	bt r12,0
	jc LB_11100
	mov rdi,r13
	call dlt
LB_11100:
	bt r12,1
	jc LB_11101
	mov rdi,r14
	call dlt
LB_11101:
	bt r12,3
	jc LB_11102
	mov rdi,r9
	call dlt
LB_11102:
	bt r12,4
	jc LB_11103
	mov rdi,r10
	call dlt
LB_11103:
	bt r12,2
	jc LB_11104
	mov rdi,r8
	call dlt
LB_11104:
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_11105
	btr r12,0
	jmp LB_11106
LB_11105:
	bts r12,0
LB_11106:
	ret
MTC_LB_11064:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11107
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' 3' 4' }
; 0' ⊢ °1◂{ 1' 2' 3' 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11108
	bt QWORD [rdi],0
	jc LB_11109
	btr r12,5
	jmp LB_11110
LB_11109:
	bts r12,5
LB_11110:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11108:
	mov r11,rdi
; 5' ⊢ { 1' 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11113
	btr r12,6
	jmp LB_11114
LB_11113:
	bts r12,6
LB_11114:
	mov r14,rcx
	bt r12,6
	jc LB_11111
	btr r12,1
	jmp LB_11112
LB_11111:
	bts r12,1
LB_11112:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11117
	btr r12,6
	jmp LB_11118
LB_11117:
	bts r12,6
LB_11118:
	mov r8,rcx
	bt r12,6
	jc LB_11115
	btr r12,2
	jmp LB_11116
LB_11115:
	bts r12,2
LB_11116:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_11121
	btr r12,6
	jmp LB_11122
LB_11121:
	bts r12,6
LB_11122:
	mov r9,rcx
	bt r12,6
	jc LB_11119
	btr r12,3
	jmp LB_11120
LB_11119:
	bts r12,3
LB_11120:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*3]
	mov rcx,rax
	bt QWORD [rdi],3
	jc LB_11125
	btr r12,6
	jmp LB_11126
LB_11125:
	bts r12,6
LB_11126:
	mov r10,rcx
	bt r12,6
	jc LB_11123
	btr r12,4
	jmp LB_11124
LB_11123:
	bts r12,4
LB_11124:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11127:
	cmp r15,0
	jz LB_11128
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11127
LB_11128:
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; //
	mov r13,rax
	btr r12,0
; ∎ %_10194
 ; {>  %_10190~1':(_opn)◂(_stg) %_10193~4':(_opn)◂(_p9988) %_10192~3':_p9991 %_10191~2':_p9990 %_10194~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_11129
	mov rdi,r14
	call dlt
LB_11129:
	bt r12,4
	jc LB_11130
	mov rdi,r10
	call dlt
LB_11130:
	bt r12,3
	jc LB_11131
	mov rdi,r9
	call dlt
LB_11131:
	bt r12,2
	jc LB_11132
	mov rdi,r8
	call dlt
LB_11132:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11107:
NS_E_10180:
; 	|» 0'
NS_E_RDI_10180:
MTC_LB_11133:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11134
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11135
	bt QWORD [rdi],0
	jc LB_11136
	btr r12,2
	jmp LB_11137
LB_11136:
	bts r12,2
LB_11137:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11135:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11138
	btr r12,1
	jmp LB_11139
LB_11138:
	bts r12,1
LB_11139:
LB_11140:
	cmp r15,0
	jz LB_11141
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11140
LB_11141:
; _f10195 %_10176 ⊢ %_10177 : %_10177
 ; {>  %_10176~1':_p9988 }
; _f10195 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11142
	btr r12,0
	jmp LB_11143
LB_11142:
	bts r12,0
LB_11143:
	call NS_E_10195
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_10177
 ; {>  %_10177~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11134:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11144
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11145
	bt QWORD [rdi],0
	jc LB_11146
	btr r12,2
	jmp LB_11147
LB_11146:
	bts r12,2
LB_11147:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11145:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11148
	btr r12,1
	jmp LB_11149
LB_11148:
	bts r12,1
LB_11149:
LB_11150:
	cmp r15,0
	jz LB_11151
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11150
LB_11151:
; _f10220 %_10178 ⊢ %_10179 : %_10179
 ; {>  %_10178~1':_p9989 }
; _f10220 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11152
	btr r12,0
	jmp LB_11153
LB_11152:
	bts r12,0
LB_11153:
	call NS_E_10220
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_10179
 ; {>  %_10179~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11144:
NS_E_10174:
; 	|» 0'
NS_E_RDI_10174:
MTC_LB_11154:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11155
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' } 3' }
; 0' ⊢ °0◂{ { 1' 2' } 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11156
	bt QWORD [rdi],0
	jc LB_11157
	btr r12,4
	jmp LB_11158
LB_11157:
	bts r12,4
LB_11158:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11156:
	mov r10,rdi
; 4' ⊢ { { 1' 2' } 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11167
	btr r12,5
	jmp LB_11168
LB_11167:
	bts r12,5
LB_11168:
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_11161
	btr r12,3
	jmp LB_11162
LB_11161:
	bts r12,3
LB_11162:
	mov r14,r9
	bt r12,3
	jc LB_11159
	btr r12,1
	jmp LB_11160
LB_11159:
	bts r12,1
LB_11160:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_11165
	btr r12,3
	jmp LB_11166
LB_11165:
	bts r12,3
LB_11166:
	mov r8,r9
	bt r12,3
	jc LB_11163
	btr r12,2
	jmp LB_11164
LB_11163:
	bts r12,2
LB_11164:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11171
	btr r12,5
	jmp LB_11172
LB_11171:
	bts r12,5
LB_11172:
	mov r9,r11
	bt r12,5
	jc LB_11169
	btr r12,3
	jmp LB_11170
LB_11169:
	bts r12,3
LB_11170:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11173:
	cmp r15,0
	jz LB_11174
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11173
LB_11174:
; _f10180 %_10165 ⊢ %_10167 : %_10167
 ; {>  %_10166~3':(_lst)◂({ _stg _p9987 }) %_10164~1':_stg %_10165~2':_p9987 }
; _f10180 2' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11179
	btr r12,0
	jmp LB_11180
LB_11179:
	bts r12,0
LB_11180:
	call NS_E_10180
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11177
	btr r12,3
	jmp LB_11178
LB_11177:
	bts r12,3
LB_11178:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11175
	btr r12,1
	jmp LB_11176
LB_11175:
	bts r12,1
LB_11176:
	add rsp,24
; _f10174 %_10166 ⊢ %_10168 : %_10168
 ; {>  %_10166~3':(_lst)◂({ _stg _p9987 }) %_10164~1':_stg %_10167~0':_stg }
; _f10174 3' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_11185
	btr r12,0
	jmp LB_11186
LB_11185:
	bts r12,0
LB_11186:
	call NS_E_10174
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_11187
	btr r12,2
	jmp LB_11188
LB_11187:
	bts r12,2
LB_11188:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11183
	btr r12,1
	jmp LB_11184
LB_11183:
	bts r12,1
LB_11184:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11181
	btr r12,0
	jmp LB_11182
LB_11181:
	bts r12,0
LB_11182:
	add rsp,24
; » _^ ..
	mov rax,3
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_10172
 ; {>  %_10170~0':_stg %_10169~1':_stg %_10172~3':_stg %_10171~2':_stg }
; 	∎ 3'
	bt r12,0
	jc LB_11189
	mov rdi,r13
	call dlt
LB_11189:
	bt r12,1
	jc LB_11190
	mov rdi,r14
	call dlt
LB_11190:
	bt r12,2
	jc LB_11191
	mov rdi,r8
	call dlt
LB_11191:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_11192
	btr r12,0
	jmp LB_11193
LB_11192:
	bts r12,0
LB_11193:
	ret
MTC_LB_11155:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11194
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11195
	bt QWORD [rdi],0
	jc LB_11196
	btr r12,1
	jmp LB_11197
LB_11196:
	bts r12,1
LB_11197:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11195:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11198:
	cmp r15,0
	jz LB_11199
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11198
LB_11199:
; 	» "" _ ⊢ 0' : %_10173
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10173
 ; {>  %_10173~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11194:
NS_E_10162:
; 	|» 0'
NS_E_RDI_10162:
MTC_LB_11200:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11201
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11202
	bt QWORD [rdi],0
	jc LB_11203
	btr r12,3
	jmp LB_11204
LB_11203:
	bts r12,3
LB_11204:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11202:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11207
	btr r12,4
	jmp LB_11208
LB_11207:
	bts r12,4
LB_11208:
	mov r14,r10
	bt r12,4
	jc LB_11205
	btr r12,1
	jmp LB_11206
LB_11205:
	bts r12,1
LB_11206:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11211
	btr r12,4
	jmp LB_11212
LB_11211:
	bts r12,4
LB_11212:
	mov r8,r10
	bt r12,4
	jc LB_11209
	btr r12,2
	jmp LB_11210
LB_11209:
	bts r12,2
LB_11210:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11213:
	cmp r15,0
	jz LB_11214
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11213
LB_11214:
MTC_LB_11215:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11216
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °0◂0'
; 2' ⊢ °0◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11217
	bt QWORD [rdi],0
	jc LB_11218
	btr r12,3
	jmp LB_11219
LB_11218:
	bts r12,3
LB_11219:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11217:
	mov r9,rdi
	mov r13,r9
	bt r12,3
	jc LB_11220
	btr r12,0
	jmp LB_11221
LB_11220:
	bts r12,0
LB_11221:
LB_11222:
	cmp r15,0
	jz LB_11223
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11222
LB_11223:
; _f10128 %_10132 ⊢ %_10133 : %_10133
 ; {>  %_10130~1':_stg %_10132~0':(_lst)◂(_p9983) }
; _f10128 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_10128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11224
	btr r12,1
	jmp LB_11225
LB_11224:
	bts r12,1
LB_11225:
	add rsp,16
; » _^ ..
	mov rax,13
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; //
	mov r8,rax
	btr r12,2
; ∎ %_10136
 ; {>  %_10135~0':_stg %_10134~1':_stg %_10136~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_11226
	mov rdi,r13
	call dlt
LB_11226:
	bt r12,1
	jc LB_11227
	mov rdi,r14
	call dlt
LB_11227:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11228
	btr r12,0
	jmp LB_11229
LB_11228:
	bts r12,0
LB_11229:
	ret
MTC_LB_11216:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11230
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °1◂0'
; 2' ⊢ °1◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11231
	bt QWORD [rdi],0
	jc LB_11232
	btr r12,3
	jmp LB_11233
LB_11232:
	bts r12,3
LB_11233:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11231:
	mov r9,rdi
	mov r13,r9
	bt r12,3
	jc LB_11234
	btr r12,0
	jmp LB_11235
LB_11234:
	bts r12,0
LB_11235:
LB_11236:
	cmp r15,0
	jz LB_11237
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11236
LB_11237:
; _f9946 %_10137 ⊢ %_10138 : %_10138
 ; {>  %_10137~0':_p9935 %_10130~1':_stg }
; _f9946 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9946
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11238
	btr r12,1
	jmp LB_11239
LB_11238:
	bts r12,1
LB_11239:
	add rsp,16
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r8,rax
	btr r12,2
; ∎ %_10141
 ; {>  %_10139~1':_stg %_10141~2':_stg %_10140~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_11240
	mov rdi,r14
	call dlt
LB_11240:
	bt r12,0
	jc LB_11241
	mov rdi,r13
	call dlt
LB_11241:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11242
	btr r12,0
	jmp LB_11243
LB_11242:
	bts r12,0
LB_11243:
	ret
MTC_LB_11230:
MTC_LB_11201:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11244
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11245
	bt QWORD [rdi],0
	jc LB_11246
	btr r12,2
	jmp LB_11247
LB_11246:
	bts r12,2
LB_11247:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11245:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11248
	btr r12,1
	jmp LB_11249
LB_11248:
	bts r12,1
LB_11249:
LB_11250:
	cmp r15,0
	jz LB_11251
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11250
LB_11251:
; _f10174 %_10142 ⊢ %_10143 : %_10143
 ; {>  %_10142~1':(_lst)◂({ _stg _p9987 }) }
; _f10174 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11252
	btr r12,0
	jmp LB_11253
LB_11252:
	bts r12,0
LB_11253:
	call NS_E_10174
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,8
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r14,rax
	btr r12,1
; ∎ %_10145
 ; {>  %_10145~1':_stg %_10144~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_11254
	mov rdi,r13
	call dlt
LB_11254:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11255
	btr r12,0
	jmp LB_11256
LB_11255:
	bts r12,0
LB_11256:
	ret
MTC_LB_11244:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_11257
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11258
	bt QWORD [rdi],0
	jc LB_11259
	btr r12,3
	jmp LB_11260
LB_11259:
	bts r12,3
LB_11260:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11258:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11263
	btr r12,4
	jmp LB_11264
LB_11263:
	bts r12,4
LB_11264:
	mov r14,r10
	bt r12,4
	jc LB_11261
	btr r12,1
	jmp LB_11262
LB_11261:
	bts r12,1
LB_11262:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11267
	btr r12,4
	jmp LB_11268
LB_11267:
	bts r12,4
LB_11268:
	mov r8,r10
	bt r12,4
	jc LB_11265
	btr r12,2
	jmp LB_11266
LB_11265:
	bts r12,2
LB_11266:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11269:
	cmp r15,0
	jz LB_11270
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11269
LB_11270:
; _f10237 %_10147 ⊢ %_10148 : %_10148
 ; {>  %_10147~2':_p9985 %_10146~1':_stg }
; _f10237 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11273
	btr r12,0
	jmp LB_11274
LB_11273:
	bts r12,0
LB_11274:
	call NS_E_10237
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11271
	btr r12,1
	jmp LB_11272
LB_11271:
	bts r12,1
LB_11272:
	add rsp,16
; » _^ ..
	mov rax,3
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_10151
 ; {>  %_10149~1':_stg %_10150~0':_stg %_10151~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_11275
	mov rdi,r14
	call dlt
LB_11275:
	bt r12,0
	jc LB_11276
	mov rdi,r13
	call dlt
LB_11276:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11277
	btr r12,0
	jmp LB_11278
LB_11277:
	bts r12,0
LB_11278:
	ret
MTC_LB_11257:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_11279
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11280
	bt QWORD [rdi],0
	jc LB_11281
	btr r12,2
	jmp LB_11282
LB_11281:
	bts r12,2
LB_11282:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11280:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11283
	btr r12,1
	jmp LB_11284
LB_11283:
	bts r12,1
LB_11284:
LB_11285:
	cmp r15,0
	jz LB_11286
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11285
LB_11286:
; _f10252 %_10152 ⊢ %_10153 : %_10153
 ; {>  %_10152~1':(_lst)◂({ _stg _p9999 _p10002 }) }
; _f10252 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11287
	btr r12,0
	jmp LB_11288
LB_11287:
	bts r12,0
LB_11288:
	call NS_E_10252
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,4
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 \n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r14,rax
	btr r12,1
; ∎ %_10155
 ; {>  %_10155~1':_stg %_10154~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_11289
	mov rdi,r13
	call dlt
LB_11289:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11290
	btr r12,0
	jmp LB_11291
LB_11290:
	bts r12,0
LB_11291:
	ret
MTC_LB_11279:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_11292
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂{ 1' 2' }
; 0' ⊢ °4◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11293
	bt QWORD [rdi],0
	jc LB_11294
	btr r12,3
	jmp LB_11295
LB_11294:
	bts r12,3
LB_11295:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11293:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11298
	btr r12,4
	jmp LB_11299
LB_11298:
	bts r12,4
LB_11299:
	mov r14,r10
	bt r12,4
	jc LB_11296
	btr r12,1
	jmp LB_11297
LB_11296:
	bts r12,1
LB_11297:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11302
	btr r12,4
	jmp LB_11303
LB_11302:
	bts r12,4
LB_11303:
	mov r8,r10
	bt r12,4
	jc LB_11300
	btr r12,2
	jmp LB_11301
LB_11300:
	bts r12,2
LB_11301:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11304:
	cmp r15,0
	jz LB_11305
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11304
LB_11305:
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_10159
 ; {>  %_10158~1':_stg %_10157~2':_p9986 %_10159~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_11306
	mov rdi,r14
	call dlt
LB_11306:
	bt r12,2
	jc LB_11307
	mov rdi,r8
	call dlt
LB_11307:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11292:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz MTC_LB_11308
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °5◂1'
; 0' ⊢ °5◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11309
	bt QWORD [rdi],0
	jc LB_11310
	btr r12,2
	jmp LB_11311
LB_11310:
	bts r12,2
LB_11311:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11309:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11312
	btr r12,1
	jmp LB_11313
LB_11312:
	bts r12,1
LB_11313:
LB_11314:
	cmp r15,0
	jz LB_11315
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11314
LB_11315:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 @..."
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_40
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_10161
 ; {>  %_10160~1':(_lst)◂({ _stg _p9986 }) %_10161~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_11316
	mov rdi,r14
	call dlt
LB_11316:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11308:
NS_E_10128:
; 	|» 0'
NS_E_RDI_10128:
MTC_LB_11317:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11318
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11319
	bt QWORD [rdi],0
	jc LB_11320
	btr r12,1
	jmp LB_11321
LB_11320:
	bts r12,1
LB_11321:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11319:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11322:
	cmp r15,0
	jz LB_11323
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11322
LB_11323:
; 	» "" _ ⊢ 0' : %_10120
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10120
 ; {>  %_10120~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11318:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11325
	bt QWORD [rdi],0
	jc LB_11326
	btr r12,3
	jmp LB_11327
LB_11326:
	bts r12,3
LB_11327:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11325:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11330
	btr r12,4
	jmp LB_11331
LB_11330:
	bts r12,4
LB_11331:
	mov r14,r10
	bt r12,4
	jc LB_11328
	btr r12,1
	jmp LB_11329
LB_11328:
	bts r12,1
LB_11329:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11334
	btr r12,4
	jmp LB_11335
LB_11334:
	bts r12,4
LB_11335:
	mov r8,r10
	bt r12,4
	jc LB_11332
	btr r12,2
	jmp LB_11333
LB_11332:
	bts r12,2
LB_11333:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11336:
	cmp r15,0
	jz LB_11337
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11336
LB_11337:
; _f10162 %_10121 ⊢ %_10123 : %_10123
 ; {>  %_10122~2':(_lst)◂(_p9983) %_10121~1':_p9983 }
; _f10162 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11340
	btr r12,0
	jmp LB_11341
LB_11340:
	bts r12,0
LB_11341:
	call NS_E_10162
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11338
	btr r12,2
	jmp LB_11339
LB_11338:
	bts r12,2
LB_11339:
	add rsp,16
; _f10128 %_10122 ⊢ %_10124 : %_10124
 ; {>  %_10122~2':(_lst)◂(_p9983) %_10123~0':_stg }
; _f10128 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11344
	btr r12,0
	jmp LB_11345
LB_11344:
	bts r12,0
LB_11345:
	call NS_E_10128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11346
	btr r12,1
	jmp LB_11347
LB_11346:
	bts r12,1
LB_11347:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11342
	btr r12,0
	jmp LB_11343
LB_11342:
	bts r12,0
LB_11343:
	add rsp,16
; » _^ ..
	mov rax,0
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_10127
 ; {>  %_10127~2':_stg %_10125~0':_stg %_10126~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_11348
	mov rdi,r13
	call dlt
LB_11348:
	bt r12,1
	jc LB_11349
	mov rdi,r14
	call dlt
LB_11349:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11350
	btr r12,0
	jmp LB_11351
LB_11350:
	bts r12,0
LB_11351:
	ret
MTC_LB_11324:
NS_E_11355:
NS_E_RDI_11355:
NS_E_11355_ETR_TBL:
NS_E_11355_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_11459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11459
	jmp LB_11460
LB_11459:
	jmp LB_11451
LB_11460:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11452
	btr r12,0
	jmp LB_11453
LB_11452:
	bts r12,0
LB_11453:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_11448
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_11359 : %_11359
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_11359
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_11359 ⊢ %_11360 : %_11360
 ; {>  %_11359~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_11360
 ; {>  %_11360~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11446
	btr r12,3
	jmp LB_11447
LB_11446:
	bts r12,3
LB_11447:
	mov r8,0
	bts r12,2
	ret
LB_11448:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11450
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11449
LB_11450:
	add rsp,8
	ret
LB_11451:
	add rsp,16
	pop r14
LB_11449:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_9257_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11475
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11467
LB_11475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_11355_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11480
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11481:
	jmp LB_11467
LB_11480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11470
	btr r12,1
	jmp LB_11471
LB_11470:
	bts r12,1
LB_11471:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11468
	btr r12,0
	jmp LB_11469
LB_11468:
	bts r12,0
LB_11469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11464
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f44 %_11362 ⊢ %_11363 : %_11363
 ; {>  %_11361~0':_r64 %_11362~1':_r64 }
	add r14,1
; _some %_11363 ⊢ %_11364 : %_11364
 ; {>  %_11361~0':_r64 %_11363~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_11364
 ; {>  %_11361~0':_r64 %_11364~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_11461
	mov rdi,r13
	call dlt
LB_11461:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_11462
	btr r12,3
	jmp LB_11463
LB_11462:
	bts r12,3
LB_11463:
	mov r8,0
	bts r12,2
	ret
LB_11464:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11466
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11465
LB_11466:
	add rsp,8
	ret
LB_11467:
	add rsp,32
	pop r14
LB_11465:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11356:
NS_E_RDI_11356:
NS_E_11356_ETR_TBL:
NS_E_11356_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_11498
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_11498
	jmp LB_11499
LB_11498:
	jmp LB_11488
LB_11499:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11503
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11504
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11504:
	jmp LB_11488
LB_11503:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11491
	btr r12,1
	jmp LB_11492
LB_11491:
	bts r12,1
LB_11492:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11489
	btr r12,0
	jmp LB_11490
LB_11489:
	bts r12,0
LB_11490:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11485
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_11506
	btr r12,2
	jmp LB_11507
LB_11506:
	bts r12,2
LB_11507:
	mov r13,r14
	bt r12,1
	jc LB_11508
	btr r12,0
	jmp LB_11509
LB_11508:
	bts r12,0
LB_11509:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f44 %_11365 ⊢ %_11366 : %_11366
 ; {>  %_11365~0':_r64 }
	add r13,1
; _some %_11366 ⊢ %_11367 : %_11367
 ; {>  %_11366~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_11367
 ; {>  %_11367~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11483
	btr r12,3
	jmp LB_11484
LB_11483:
	bts r12,3
LB_11484:
	mov r8,0
	bts r12,2
	ret
LB_11485:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11487
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11486
LB_11487:
	add rsp,8
	ret
LB_11488:
	add rsp,32
	pop r14
LB_11486:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_11525
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_11525
	jmp LB_11526
LB_11525:
	jmp LB_11515
LB_11526:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11530
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11531:
	jmp LB_11515
LB_11530:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11518
	btr r12,1
	jmp LB_11519
LB_11518:
	bts r12,1
LB_11519:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11516
	btr r12,0
	jmp LB_11517
LB_11516:
	bts r12,0
LB_11517:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11512
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_11533
	btr r12,2
	jmp LB_11534
LB_11533:
	bts r12,2
LB_11534:
	mov r13,r14
	bt r12,1
	jc LB_11535
	btr r12,0
	jmp LB_11536
LB_11535:
	bts r12,0
LB_11536:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f44 %_11368 ⊢ %_11369 : %_11369
 ; {>  %_11368~0':_r64 }
	add r13,1
; _some %_11369 ⊢ %_11370 : %_11370
 ; {>  %_11369~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_11370
 ; {>  %_11370~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11510
	btr r12,3
	jmp LB_11511
LB_11510:
	bts r12,3
LB_11511:
	mov r8,0
	bts r12,2
	ret
LB_11512:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11514
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11513
LB_11514:
	add rsp,8
	ret
LB_11515:
	add rsp,32
	pop r14
LB_11513:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_11539
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_11371 : %_11371
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_11371
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_11371 ⊢ %_11372 : %_11372
 ; {>  %_11371~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_11372
 ; {>  %_11372~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11537
	btr r12,3
	jmp LB_11538
LB_11537:
	bts r12,3
LB_11538:
	mov r8,0
	bts r12,2
	ret
LB_11539:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11541
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11540
LB_11541:
	add rsp,8
	ret
LB_11542:
	add rsp,0
	pop r14
LB_11540:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11357:
NS_E_RDI_11357:
NS_E_11357_ETR_TBL:
NS_E_11357_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11622
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11569
LB_11622:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_11630
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_11630
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_11630
	jmp LB_11631
LB_11630:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11628
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11628:
	jmp LB_11569
LB_11631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11586
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11587
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11587:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11588:
	jmp LB_11570
LB_11586:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_11598
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11598
	jmp LB_11599
LB_11598:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11594
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11594:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11595
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11595:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11596
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11596:
	jmp LB_11570
LB_11599:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_11358_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11603
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11604
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11604:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11605
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11605:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11606
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11606:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11607
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11607:
	jmp LB_11570
LB_11603:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_11357_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11612
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_11613
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_11613:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11614
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11614:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11615
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11615:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11616
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11616:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11617
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11617:
	jmp LB_11570
LB_11612:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_11581
	btr r12,5
	jmp LB_11582
LB_11581:
	bts r12,5
LB_11582:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_11579
	btr r12,4
	jmp LB_11580
LB_11579:
	bts r12,4
LB_11580:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11577
	btr r12,3
	jmp LB_11578
LB_11577:
	bts r12,3
LB_11578:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11575
	btr r12,2
	jmp LB_11576
LB_11575:
	bts r12,2
LB_11576:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11573
	btr r12,1
	jmp LB_11574
LB_11573:
	bts r12,1
LB_11574:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11571
	btr r12,0
	jmp LB_11572
LB_11571:
	bts r12,0
LB_11572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_11566
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_11632
	btr r12,6
	jmp LB_11633
LB_11632:
	bts r12,6
LB_11633:
	mov r8,r10
	bt r12,4
	jc LB_11634
	btr r12,2
	jmp LB_11635
LB_11634:
	bts r12,2
LB_11635:
	mov rdx,r14
	bt r12,1
	jc LB_11636
	btr r12,7
	jmp LB_11637
LB_11636:
	bts r12,7
LB_11637:
	mov r14,rcx
	bt r12,6
	jc LB_11638
	btr r12,1
	jmp LB_11639
LB_11638:
	bts r12,1
LB_11639:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11642
	btr r12,6
	jmp LB_11643
LB_11642:
	bts r12,6
LB_11643:
	mov r9,rcx
	bt r12,6
	jc LB_11640
	btr r12,3
	jmp LB_11641
LB_11640:
	bts r12,3
LB_11641:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11646
	btr r12,6
	jmp LB_11647
LB_11646:
	bts r12,6
LB_11647:
	mov r10,rcx
	bt r12,6
	jc LB_11644
	btr r12,4
	jmp LB_11645
LB_11644:
	bts r12,4
LB_11645:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_11378 : %_11378
 ; {>  %_11373~0':_r64 %_11377~4':(_lst)◂(_p11352) %_11376~3':_r64 %_11375~2':_r64 %_11374~1':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_11378
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f39 { %_11378 %_11373 } ⊢ { %_11379 %_11380 } : { %_11379 %_11380 }
 ; {>  %_11373~0':_r64 %_11378~5':_r64 %_11377~4':(_lst)◂(_p11352) %_11376~3':_r64 %_11375~2':_r64 %_11374~1':_r64 }
	add r11,r13
; _f39 { %_11379 %_11374 } ⊢ { %_11381 %_11382 } : { %_11381 %_11382 }
 ; {>  %_11380~0':_r64 %_11379~5':_r64 %_11377~4':(_lst)◂(_p11352) %_11376~3':_r64 %_11375~2':_r64 %_11374~1':_r64 }
	add r11,r14
; _f39 { %_11381 %_11375 } ⊢ { %_11383 %_11384 } : { %_11383 %_11384 }
 ; {>  %_11382~1':_r64 %_11380~0':_r64 %_11381~5':_r64 %_11377~4':(_lst)◂(_p11352) %_11376~3':_r64 %_11375~2':_r64 }
	add r11,r8
; _f11353 %_11383 ⊢ %_11385 : %_11385
 ; {>  %_11383~5':_r64 %_11382~1':_r64 %_11380~0':_r64 %_11384~2':_r64 %_11377~4':(_lst)◂(_p11352) %_11376~3':_r64 }
; _f11353 5' ⊢ °0◂5'
; _cns { %_11385 %_11377 } ⊢ %_11386 : %_11386
 ; {>  %_11382~1':_r64 %_11380~0':_r64 %_11384~2':_r64 %_11377~4':(_lst)◂(_p11352) %_11376~3':_r64 %_11385~°0◂5':_p11352 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_11376 %_11386 } ⊢ %_11387 : %_11387
 ; {>  %_11382~1':_r64 %_11380~0':_r64 %_11384~2':_r64 %_11386~°0◂{ °0◂5' 4' }:(_lst)◂(_p11352) %_11376~3':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_11387
 ; {>  %_11382~1':_r64 %_11387~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p11352) }) %_11380~0':_r64 %_11384~2':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_11543
	mov rdi,r14
	call dlt
LB_11543:
	bt r12,0
	jc LB_11544
	mov rdi,r13
	call dlt
LB_11544:
	bt r12,2
	jc LB_11545
	mov rdi,r8
	call dlt
LB_11545:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_11546
	btr r12,0
	jmp LB_11547
LB_11546:
	bts r12,0
LB_11547:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_11550
	btr r12,1
	jmp LB_11551
LB_11550:
	bts r12,1
LB_11551:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11548
	btr QWORD [rdi],0
	jmp LB_11549
LB_11548:
	bts QWORD [rdi],0
LB_11549:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_11560
	btr r12,0
	jmp LB_11561
LB_11560:
	bts r12,0
LB_11561:
	mov rsi,1
	bt r12,0
	jc LB_11558
	mov rsi,0
	bt r13,0
	jc LB_11558
	jmp LB_11559
LB_11558:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_11559:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_11556
	btr QWORD [rdi],0
	jmp LB_11557
LB_11556:
	bts QWORD [rdi],0
LB_11557:
	mov r13,r10
	bt r12,4
	jc LB_11564
	btr r12,0
	jmp LB_11565
LB_11564:
	bts r12,0
LB_11565:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_11562
	btr QWORD [rdi],1
	jmp LB_11563
LB_11562:
	bts QWORD [rdi],1
LB_11563:
	mov rsi,1
	bt r12,1
	jc LB_11554
	mov rsi,0
	bt r14,0
	jc LB_11554
	jmp LB_11555
LB_11554:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11555:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11552
	btr QWORD [rdi],1
	jmp LB_11553
LB_11552:
	bts QWORD [rdi],1
LB_11553:
	mov r8,0
	bts r12,2
	ret
LB_11566:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11568
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11567
LB_11568:
	add rsp,8
	ret
LB_11570:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11569:
	add rsp,96
	pop r14
LB_11567:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11701
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11673
LB_11701:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_11709
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_11709
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_11709
	jmp LB_11710
LB_11709:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11707
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11707:
	jmp LB_11673
LB_11710:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_11355_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11686
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11687
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11687:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11688
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11688:
	jmp LB_11674
LB_11686:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_11357_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11693
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11694
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11694:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11695
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11695:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11696
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11696:
	jmp LB_11674
LB_11693:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11681
	btr r12,3
	jmp LB_11682
LB_11681:
	bts r12,3
LB_11682:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11679
	btr r12,2
	jmp LB_11680
LB_11679:
	bts r12,2
LB_11680:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11677
	btr r12,1
	jmp LB_11678
LB_11677:
	bts r12,1
LB_11678:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11675
	btr r12,0
	jmp LB_11676
LB_11675:
	bts r12,0
LB_11676:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_11670
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_11711
	btr r12,4
	jmp LB_11712
LB_11711:
	bts r12,4
LB_11712:
	mov r14,r8
	bt r12,2
	jc LB_11713
	btr r12,1
	jmp LB_11714
LB_11713:
	bts r12,1
LB_11714:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_11715
	btr r12,4
	jmp LB_11716
LB_11715:
	bts r12,4
LB_11716:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11719
	btr r12,5
	jmp LB_11720
LB_11719:
	bts r12,5
LB_11720:
	mov r8,r11
	bt r12,5
	jc LB_11717
	btr r12,2
	jmp LB_11718
LB_11717:
	bts r12,2
LB_11718:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11723
	btr r12,5
	jmp LB_11724
LB_11723:
	bts r12,5
LB_11724:
	mov r9,r11
	bt r12,5
	jc LB_11721
	btr r12,3
	jmp LB_11722
LB_11721:
	bts r12,3
LB_11722:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_11392 : %_11392
 ; {>  %_11389~1':_r64 %_11388~0':_r64 %_11391~3':(_lst)◂(_p11352) %_11390~2':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_11392
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f39 { %_11392 %_11388 } ⊢ { %_11393 %_11394 } : { %_11393 %_11394 }
 ; {>  %_11389~1':_r64 %_11392~4':_r64 %_11388~0':_r64 %_11391~3':(_lst)◂(_p11352) %_11390~2':_r64 }
	add r10,r13
; _f39 { %_11393 %_11389 } ⊢ { %_11395 %_11396 } : { %_11395 %_11396 }
 ; {>  %_11389~1':_r64 %_11391~3':(_lst)◂(_p11352) %_11390~2':_r64 %_11394~0':_r64 %_11393~4':_r64 }
	add r10,r14
; _f11353 %_11395 ⊢ %_11397 : %_11397
 ; {>  %_11391~3':(_lst)◂(_p11352) %_11395~4':_r64 %_11390~2':_r64 %_11396~1':_r64 %_11394~0':_r64 }
; _f11353 4' ⊢ °0◂4'
; _cns { %_11397 %_11391 } ⊢ %_11398 : %_11398
 ; {>  %_11391~3':(_lst)◂(_p11352) %_11390~2':_r64 %_11396~1':_r64 %_11394~0':_r64 %_11397~°0◂4':_p11352 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_11390 %_11398 } ⊢ %_11399 : %_11399
 ; {>  %_11398~°0◂{ °0◂4' 3' }:(_lst)◂(_p11352) %_11390~2':_r64 %_11396~1':_r64 %_11394~0':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_11399
 ; {>  %_11399~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p11352) }) %_11396~1':_r64 %_11394~0':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_11648
	mov rdi,r14
	call dlt
LB_11648:
	bt r12,0
	jc LB_11649
	mov rdi,r13
	call dlt
LB_11649:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_11650
	btr r12,0
	jmp LB_11651
LB_11650:
	bts r12,0
LB_11651:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_11654
	btr r12,1
	jmp LB_11655
LB_11654:
	bts r12,1
LB_11655:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11652
	btr QWORD [rdi],0
	jmp LB_11653
LB_11652:
	bts QWORD [rdi],0
LB_11653:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_11664
	btr r12,2
	jmp LB_11665
LB_11664:
	bts r12,2
LB_11665:
	mov rsi,1
	bt r12,2
	jc LB_11662
	mov rsi,0
	bt r8,0
	jc LB_11662
	jmp LB_11663
LB_11662:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_11663:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_11660
	btr QWORD [rdi],0
	jmp LB_11661
LB_11660:
	bts QWORD [rdi],0
LB_11661:
	mov r8,r13
	bt r12,0
	jc LB_11668
	btr r12,2
	jmp LB_11669
LB_11668:
	bts r12,2
LB_11669:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_11666
	btr QWORD [rdi],1
	jmp LB_11667
LB_11666:
	bts QWORD [rdi],1
LB_11667:
	mov rsi,1
	bt r12,1
	jc LB_11658
	mov rsi,0
	bt r14,0
	jc LB_11658
	jmp LB_11659
LB_11658:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11659:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11656
	btr QWORD [rdi],1
	jmp LB_11657
LB_11656:
	bts QWORD [rdi],1
LB_11657:
	mov r8,0
	bts r12,2
	ret
LB_11670:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11672
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11671
LB_11672:
	add rsp,8
	ret
LB_11674:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11673:
	add rsp,64
	pop r14
LB_11671:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_11355_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11796
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11788
LB_11796:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_11357_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11801
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11802
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11802:
	jmp LB_11788
LB_11801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11791
	btr r12,1
	jmp LB_11792
LB_11791:
	bts r12,1
LB_11792:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11789
	btr r12,0
	jmp LB_11790
LB_11789:
	bts r12,0
LB_11790:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11785
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_11804
	btr r12,3
	jmp LB_11805
LB_11804:
	bts r12,3
LB_11805:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11808
	btr r12,4
	jmp LB_11809
LB_11808:
	bts r12,4
LB_11809:
	mov r14,r10
	bt r12,4
	jc LB_11806
	btr r12,1
	jmp LB_11807
LB_11806:
	bts r12,1
LB_11807:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11812
	btr r12,4
	jmp LB_11813
LB_11812:
	bts r12,4
LB_11813:
	mov r8,r10
	bt r12,4
	jc LB_11810
	btr r12,2
	jmp LB_11811
LB_11810:
	bts r12,2
LB_11811:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f39 { %_11401 %_11400 } ⊢ { %_11403 %_11404 } : { %_11403 %_11404 }
 ; {>  %_11402~2':(_lst)◂(_p11352) %_11401~1':_r64 %_11400~0':_r64 }
	add r14,r13
MTC_LB_11725:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11726
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11727
	bt QWORD [rdi],0
	jc LB_11728
	btr r12,5
	jmp LB_11729
LB_11728:
	bts r12,5
LB_11729:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11727:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11732
	btr r12,6
	jmp LB_11733
LB_11732:
	bts r12,6
LB_11733:
	mov r9,rcx
	bt r12,6
	jc LB_11730
	btr r12,3
	jmp LB_11731
LB_11730:
	bts r12,3
LB_11731:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11736
	btr r12,6
	jmp LB_11737
LB_11736:
	bts r12,6
LB_11737:
	mov r10,rcx
	bt r12,6
	jc LB_11734
	btr r12,4
	jmp LB_11735
LB_11734:
	bts r12,4
LB_11735:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11726
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_11738
	bt QWORD [rdi],0
	jc LB_11739
	btr r12,6
	jmp LB_11740
LB_11739:
	bts r12,6
LB_11740:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11738:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_11741
	btr r12,5
	jmp LB_11742
LB_11741:
	bts r12,5
LB_11742:
LB_11743:
	cmp r15,0
	jz LB_11744
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11743
LB_11744:
; _f39 { %_11407 %_11404 } ⊢ { %_11408 %_11409 } : { %_11408 %_11409 }
 ; {>  %_11404~0':_r64 %_11407~5':_r64 %_11403~1':_r64 %_11406~4':(_lst)◂(_p11352) }
	add r11,r13
; _f11354 %_11408 ⊢ %_11410 : %_11410
 ; {>  %_11408~5':_r64 %_11403~1':_r64 %_11406~4':(_lst)◂(_p11352) %_11409~0':_r64 }
; _f11354 5' ⊢ °1◂5'
; _cns { %_11410 %_11406 } ⊢ %_11411 : %_11411
 ; {>  %_11410~°1◂5':_p11352 %_11403~1':_r64 %_11406~4':(_lst)◂(_p11352) %_11409~0':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_11403 %_11411 } ⊢ %_11412 : %_11412
 ; {>  %_11411~°0◂{ °1◂5' 4' }:(_lst)◂(_p11352) %_11403~1':_r64 %_11409~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_11412
 ; {>  %_11412~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p11352) }) %_11409~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_11745
	mov rdi,r13
	call dlt
LB_11745:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_11748
	btr r12,0
	jmp LB_11749
LB_11748:
	bts r12,0
LB_11749:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_11746
	btr QWORD [rdi],0
	jmp LB_11747
LB_11746:
	bts QWORD [rdi],0
LB_11747:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_11758
	btr r12,1
	jmp LB_11759
LB_11758:
	bts r12,1
LB_11759:
	mov rsi,1
	bt r12,1
	jc LB_11756
	mov rsi,0
	bt r14,0
	jc LB_11756
	jmp LB_11757
LB_11756:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11757:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11754
	btr QWORD [rdi],0
	jmp LB_11755
LB_11754:
	bts QWORD [rdi],0
LB_11755:
	mov r14,r10
	bt r12,4
	jc LB_11762
	btr r12,1
	jmp LB_11763
LB_11762:
	bts r12,1
LB_11763:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11760
	btr QWORD [rdi],1
	jmp LB_11761
LB_11760:
	bts QWORD [rdi],1
LB_11761:
	mov rsi,1
	bt r12,0
	jc LB_11752
	mov rsi,0
	bt r13,0
	jc LB_11752
	jmp LB_11753
LB_11752:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_11753:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_11750
	btr QWORD [rdi],1
	jmp LB_11751
LB_11750:
	bts QWORD [rdi],1
LB_11751:
	mov r8,0
	bts r12,2
	ret
MTC_LB_11726:
	mov r15,0
LB_11765:
	cmp r15,0
	jz LB_11766
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11765
LB_11766:
; _f11354 %_11404 ⊢ %_11413 : %_11413
 ; {>  %_11404~0':_r64 %_11403~1':_r64 %_11402~2':(_lst)◂(_p11352) }
; _f11354 0' ⊢ °1◂0'
; _cns { %_11413 %_11402 } ⊢ %_11414 : %_11414
 ; {>  %_11403~1':_r64 %_11402~2':(_lst)◂(_p11352) %_11413~°1◂0':_p11352 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_11403 %_11414 } ⊢ %_11415 : %_11415
 ; {>  %_11414~°0◂{ °1◂0' 2' }:(_lst)◂(_p11352) %_11403~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_11415
 ; {>  %_11415~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p11352) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_11769
	btr r12,4
	jmp LB_11770
LB_11769:
	bts r12,4
LB_11770:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_11767
	btr QWORD [rdi],0
	jmp LB_11768
LB_11767:
	bts QWORD [rdi],0
LB_11768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_11779
	btr r12,1
	jmp LB_11780
LB_11779:
	bts r12,1
LB_11780:
	mov rsi,1
	bt r12,1
	jc LB_11777
	mov rsi,0
	bt r14,0
	jc LB_11777
	jmp LB_11778
LB_11777:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11778:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11775
	btr QWORD [rdi],0
	jmp LB_11776
LB_11775:
	bts QWORD [rdi],0
LB_11776:
	mov r14,r8
	bt r12,2
	jc LB_11783
	btr r12,1
	jmp LB_11784
LB_11783:
	bts r12,1
LB_11784:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11781
	btr QWORD [rdi],1
	jmp LB_11782
LB_11781:
	bts QWORD [rdi],1
LB_11782:
	mov rsi,1
	bt r12,4
	jc LB_11773
	mov rsi,0
	bt r10,0
	jc LB_11773
	jmp LB_11774
LB_11773:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_11774:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_11771
	btr QWORD [rdi],1
	jmp LB_11772
LB_11771:
	bts QWORD [rdi],1
LB_11772:
	mov r8,0
	bts r12,2
	ret
MTC_LB_11764:
LB_11785:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11787
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11786
LB_11787:
	add rsp,8
	ret
LB_11788:
	add rsp,32
	pop r14
LB_11786:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_11822
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_11416 : %_11416
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_11417 : %_11417
 ; {>  %_11416~°1◂{  }:(_lst)◂(t4323'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_11417
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_11417 %_11416 } ⊢ %_11418 : %_11418
 ; {>  %_11417~0':_r64 %_11416~°1◂{  }:(_lst)◂(t4323'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_11418
 ; {>  %_11418~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t4327'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_11816
	btr r12,1
	jmp LB_11817
LB_11816:
	bts r12,1
LB_11817:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11814
	btr QWORD [rdi],0
	jmp LB_11815
LB_11814:
	bts QWORD [rdi],0
LB_11815:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_11820
	mov rsi,0
	bt r14,0
	jc LB_11820
	jmp LB_11821
LB_11820:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11821:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11818
	btr QWORD [rdi],1
	jmp LB_11819
LB_11818:
	bts QWORD [rdi],1
LB_11819:
	mov r8,0
	bts r12,2
	ret
LB_11822:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11824
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11823
LB_11824:
	add rsp,8
	ret
LB_11825:
	add rsp,0
	pop r14
LB_11823:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11358:
NS_E_RDI_11358:
NS_E_11358_ETR_TBL:
NS_E_11358_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11863
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11833
LB_11863:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_11871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_11871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_11871
	jmp LB_11872
LB_11871:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11869
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11869:
	jmp LB_11833
LB_11872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11846
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11847
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11847:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11848:
	jmp LB_11834
LB_11846:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_11858
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11858
	jmp LB_11859
LB_11858:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11854
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11854:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11855
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11855:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11856
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11856:
	jmp LB_11834
LB_11859:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11841
	btr r12,3
	jmp LB_11842
LB_11841:
	bts r12,3
LB_11842:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11839
	btr r12,2
	jmp LB_11840
LB_11839:
	bts r12,2
LB_11840:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11837
	btr r12,1
	jmp LB_11838
LB_11837:
	bts r12,1
LB_11838:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11835
	btr r12,0
	jmp LB_11836
LB_11835:
	bts r12,0
LB_11836:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_11830
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_11873
	btr r12,4
	jmp LB_11874
LB_11873:
	bts r12,4
LB_11874:
	mov r14,r8
	bt r12,2
	jc LB_11875
	btr r12,1
	jmp LB_11876
LB_11875:
	bts r12,1
LB_11876:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_11421 : %_11421
 ; {>  %_11419~0':_r64 %_11420~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_11421
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f39 { %_11421 %_11419 } ⊢ { %_11422 %_11423 } : { %_11422 %_11423 }
 ; {>  %_11421~2':_r64 %_11419~0':_r64 %_11420~1':_r64 }
	add r8,r13
; _f39 { %_11422 %_11420 } ⊢ { %_11424 %_11425 } : { %_11424 %_11425 }
 ; {>  %_11423~0':_r64 %_11422~2':_r64 %_11420~1':_r64 }
	add r8,r14
; _some %_11424 ⊢ %_11426 : %_11426
 ; {>  %_11423~0':_r64 %_11425~1':_r64 %_11424~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_11426
 ; {>  %_11423~0':_r64 %_11425~1':_r64 %_11426~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_11826
	mov rdi,r13
	call dlt
LB_11826:
	bt r12,1
	jc LB_11827
	mov rdi,r14
	call dlt
LB_11827:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_11828
	btr r12,3
	jmp LB_11829
LB_11828:
	bts r12,3
LB_11829:
	mov r8,0
	bts r12,2
	ret
LB_11830:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11832
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11831
LB_11832:
	add rsp,8
	ret
LB_11834:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11833:
	add rsp,64
	pop r14
LB_11831:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11939
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11886
LB_11939:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_11947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_11947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_11947
	jmp LB_11948
LB_11947:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11945
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11945:
	jmp LB_11886
LB_11948:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_11356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11903
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11904
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11904:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11905
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11905:
	jmp LB_11887
LB_11903:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_11915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11915
	jmp LB_11916
LB_11915:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11911
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11911:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11912
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11912:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11913
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11913:
	jmp LB_11887
LB_11916:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_11358_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11920
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11921
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11921:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11922
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11922:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11923
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11923:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11924
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11924:
	jmp LB_11887
LB_11920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_11358_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11929
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_11930
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_11930:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11931
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11931:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11932
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11932:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11933
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11933:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11934
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11934:
	jmp LB_11887
LB_11929:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_11898
	btr r12,5
	jmp LB_11899
LB_11898:
	bts r12,5
LB_11899:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_11896
	btr r12,4
	jmp LB_11897
LB_11896:
	bts r12,4
LB_11897:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11894
	btr r12,3
	jmp LB_11895
LB_11894:
	bts r12,3
LB_11895:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11892
	btr r12,2
	jmp LB_11893
LB_11892:
	bts r12,2
LB_11893:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11890
	btr r12,1
	jmp LB_11891
LB_11890:
	bts r12,1
LB_11891:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11888
	btr r12,0
	jmp LB_11889
LB_11888:
	bts r12,0
LB_11889:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_11883
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_11949
	btr r12,6
	jmp LB_11950
LB_11949:
	bts r12,6
LB_11950:
	mov r9,r11
	bt r12,5
	jc LB_11951
	btr r12,3
	jmp LB_11952
LB_11951:
	bts r12,3
LB_11952:
	mov r11,r8
	bt r12,2
	jc LB_11953
	btr r12,5
	jmp LB_11954
LB_11953:
	bts r12,5
LB_11954:
	mov r8,r10
	bt r12,4
	jc LB_11955
	btr r12,2
	jmp LB_11956
LB_11955:
	bts r12,2
LB_11956:
	mov r10,r14
	bt r12,1
	jc LB_11957
	btr r12,4
	jmp LB_11958
LB_11957:
	bts r12,4
LB_11958:
	mov r14,r11
	bt r12,5
	jc LB_11959
	btr r12,1
	jmp LB_11960
LB_11959:
	bts r12,1
LB_11960:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_11431 : %_11431
 ; {>  %_11430~3':_r64 %_11429~2':_r64 %_11428~1':_r64 %_11427~0':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_11431
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f39 { %_11431 %_11427 } ⊢ { %_11432 %_11433 } : { %_11432 %_11433 }
 ; {>  %_11430~3':_r64 %_11429~2':_r64 %_11431~4':_r64 %_11428~1':_r64 %_11427~0':_r64 }
	add r10,r13
; _f39 { %_11432 %_11428 } ⊢ { %_11434 %_11435 } : { %_11434 %_11435 }
 ; {>  %_11430~3':_r64 %_11429~2':_r64 %_11432~4':_r64 %_11433~0':_r64 %_11428~1':_r64 }
	add r10,r14
; _f39 { %_11434 %_11429 } ⊢ { %_11436 %_11437 } : { %_11436 %_11437 }
 ; {>  %_11430~3':_r64 %_11429~2':_r64 %_11435~1':_r64 %_11434~4':_r64 %_11433~0':_r64 }
	add r10,r8
; _f39 { %_11436 %_11430 } ⊢ { %_11438 %_11439 } : { %_11438 %_11439 }
 ; {>  %_11430~3':_r64 %_11436~4':_r64 %_11437~2':_r64 %_11435~1':_r64 %_11433~0':_r64 }
	add r10,r9
; _some %_11438 ⊢ %_11440 : %_11440
 ; {>  %_11438~4':_r64 %_11439~3':_r64 %_11437~2':_r64 %_11435~1':_r64 %_11433~0':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_11440
 ; {>  %_11439~3':_r64 %_11437~2':_r64 %_11435~1':_r64 %_11440~°0◂4':(_opn)◂(_r64) %_11433~0':_r64 }
; 	∎ °0◂4'
	bt r12,3
	jc LB_11877
	mov rdi,r9
	call dlt
LB_11877:
	bt r12,2
	jc LB_11878
	mov rdi,r8
	call dlt
LB_11878:
	bt r12,1
	jc LB_11879
	mov rdi,r14
	call dlt
LB_11879:
	bt r12,0
	jc LB_11880
	mov rdi,r13
	call dlt
LB_11880:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_11881
	btr r12,3
	jmp LB_11882
LB_11881:
	bts r12,3
LB_11882:
	mov r8,0
	bts r12,2
	ret
LB_11883:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11885
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11884
LB_11885:
	add rsp,8
	ret
LB_11887:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11886:
	add rsp,96
	pop r14
LB_11884:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_11355_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11975
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11967
LB_11975:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_11358_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11980
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11981
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11981:
	jmp LB_11967
LB_11980:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11970
	btr r12,1
	jmp LB_11971
LB_11970:
	bts r12,1
LB_11971:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11968
	btr r12,0
	jmp LB_11969
LB_11968:
	bts r12,0
LB_11969:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11964
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 { %_11441 %_11442 } ⊢ { %_11443 %_11444 } : { %_11443 %_11444 }
 ; {>  %_11442~1':_r64 %_11441~0':_r64 }
	add r13,r14
; _some %_11443 ⊢ %_11445 : %_11445
 ; {>  %_11443~0':_r64 %_11444~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_11445
 ; {>  %_11445~°0◂0':(_opn)◂(_r64) %_11444~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_11961
	mov rdi,r14
	call dlt
LB_11961:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11962
	btr r12,3
	jmp LB_11963
LB_11962:
	bts r12,3
LB_11963:
	mov r8,0
	bts r12,2
	ret
LB_11964:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11966
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11965
LB_11966:
	add rsp,8
	ret
LB_11967:
	add rsp,32
	pop r14
LB_11965:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12005:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_12005:
MTC_LB_12006:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12007
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_12008
	bt QWORD [rdi],0
	jc LB_12009
	btr r12,7
	jmp LB_12010
LB_12009:
	bts r12,7
LB_12010:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12008:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_12013
	btr r12,8
	jmp LB_12014
LB_12013:
	bts r12,8
LB_12014:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_12011
	btr r12,5
	jmp LB_12012
LB_12011:
	bts r12,5
LB_12012:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_12017
	btr r12,8
	jmp LB_12018
LB_12017:
	bts r12,8
LB_12018:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_12015
	btr r12,6
	jmp LB_12016
LB_12015:
	bts r12,6
LB_12016:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12019:
	cmp r15,0
	jz LB_12020
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12019
LB_12020:
MTC_LB_12021:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12022
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_12023
	bt QWORD [rdi],0
	jc LB_12024
	btr r12,7
	jmp LB_12025
LB_12024:
	bts r12,7
LB_12025:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12023:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_12026
	btr r12,4
	jmp LB_12027
LB_12026:
	bts r12,4
LB_12027:
LB_12028:
	cmp r15,0
	jz LB_12029
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12028
LB_12029:
; _f41 %_11990 ⊢ { %_11991 %_11992 } : { %_11991 %_11992 }
 ; {>  %_11983~0':_stg %_11986~3':_r64 %_11990~4':_r64 %_11985~2':_stg %_11989~6':(_lst)◂(_p11352) %_11984~1':_r64 }
	mov r11,r10
	bts r12,5
; _f23 { %_11992 %_11983 %_11984 %_11985 %_11986 } ⊢ { %_11993 %_11994 %_11995 %_11996 %_11997 } : { %_11993 %_11994 %_11995 %_11996 %_11997 }
 ; {>  %_11983~0':_stg %_11986~3':_r64 %_11992~5':_r64 %_11991~4':_r64 %_11985~2':_stg %_11989~6':(_lst)◂(_p11352) %_11984~1':_r64 }
; _f23 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_12034
	btr r12,4
	jmp LB_12035
LB_12034:
	bts r12,4
LB_12035:
	mov r9,r8
	bt r12,2
	jc LB_12036
	btr r12,3
	jmp LB_12037
LB_12036:
	bts r12,3
LB_12037:
	mov r8,r14
	bt r12,1
	jc LB_12038
	btr r12,2
	jmp LB_12039
LB_12038:
	bts r12,2
LB_12039:
	mov r14,r13
	bt r12,0
	jc LB_12040
	btr r12,1
	jmp LB_12041
LB_12040:
	bts r12,1
LB_12041:
	mov r13,r11
	bt r12,5
	jc LB_12042
	btr r12,0
	jmp LB_12043
LB_12042:
	bts r12,0
LB_12043:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_12044
	btr r12,5
	jmp LB_12045
LB_12044:
	bts r12,5
LB_12045:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_12032
	btr r12,6
	jmp LB_12033
LB_12032:
	bts r12,6
LB_12033:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_12030
	btr r12,4
	jmp LB_12031
LB_12030:
	bts r12,4
LB_12031:
	add rsp,24
; _f12005 { %_11994 %_11995 %_11996 %_11997 %_11989 } ⊢ { %_11998 %_11999 } : { %_11998 %_11999 }
 ; {>  %_11997~5':_r64 %_11995~2':_r64 %_11996~3':_stg %_11991~4':_r64 %_11993~0':_r64 %_11989~6':(_lst)◂(_p11352) %_11994~1':_stg }
; _f12005 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_12050
	btr r12,0
	jmp LB_12051
LB_12050:
	bts r12,0
LB_12051:
	mov r14,r8
	bt r12,2
	jc LB_12052
	btr r12,1
	jmp LB_12053
LB_12052:
	bts r12,1
LB_12053:
	mov r8,r9
	bt r12,3
	jc LB_12054
	btr r12,2
	jmp LB_12055
LB_12054:
	bts r12,2
LB_12055:
	mov r9,r11
	bt r12,5
	jc LB_12056
	btr r12,3
	jmp LB_12057
LB_12056:
	bts r12,3
LB_12057:
	mov r10,rcx
	bt r12,6
	jc LB_12058
	btr r12,4
	jmp LB_12059
LB_12058:
	bts r12,4
LB_12059:
	call NS_E_12005
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_12060
	btr r12,2
	jmp LB_12061
LB_12060:
	bts r12,2
LB_12061:
	mov r14,r13
	bt r12,0
	jc LB_12062
	btr r12,1
	jmp LB_12063
LB_12062:
	bts r12,1
LB_12063:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_12048
	btr r12,4
	jmp LB_12049
LB_12048:
	bts r12,4
LB_12049:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_12046
	btr r12,0
	jmp LB_12047
LB_12046:
	bts r12,0
LB_12047:
	add rsp,24
; ∎ { %_11998 %_11999 }
 ; {>  %_11999~2':_stg %_11998~1':_stg %_11991~4':_r64 %_11993~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_12064
	mov rdi,r10
	call dlt
LB_12064:
	bt r12,0
	jc LB_12065
	mov rdi,r13
	call dlt
LB_12065:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_12066
	btr r12,0
	jmp LB_12067
LB_12066:
	bts r12,0
LB_12067:
	mov r14,r8
	bt r12,2
	jc LB_12068
	btr r12,1
	jmp LB_12069
LB_12068:
	bts r12,1
LB_12069:
	ret
MTC_LB_12022:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12070
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_12071
	bt QWORD [rdi],0
	jc LB_12072
	btr r12,7
	jmp LB_12073
LB_12072:
	bts r12,7
LB_12073:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12071:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_12074
	btr r12,4
	jmp LB_12075
LB_12074:
	bts r12,4
LB_12075:
LB_12076:
	cmp r15,0
	jz LB_12077
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12076
LB_12077:
; _f39 { %_11984 %_12000 } ⊢ { %_12001 %_12002 } : { %_12001 %_12002 }
 ; {>  %_11983~0':_stg %_11986~3':_r64 %_11985~2':_stg %_11989~6':(_lst)◂(_p11352) %_12000~4':_r64 %_11984~1':_r64 }
	add r14,r10
; _f12005 { %_11983 %_12001 %_11985 %_11986 %_11989 } ⊢ { %_12003 %_12004 } : { %_12003 %_12004 }
 ; {>  %_11983~0':_stg %_11986~3':_r64 %_11985~2':_stg %_11989~6':(_lst)◂(_p11352) %_12001~1':_r64 %_12002~4':_r64 }
; _f12005 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_12080
	btr r12,4
	jmp LB_12081
LB_12080:
	bts r12,4
LB_12081:
	call NS_E_12005
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_12078
	btr r12,4
	jmp LB_12079
LB_12078:
	bts r12,4
LB_12079:
	add rsp,16
; ∎ { %_12003 %_12004 }
 ; {>  %_12003~0':_stg %_12004~1':_stg %_12002~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_12082
	mov rdi,r10
	call dlt
LB_12082:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_12070:
MTC_LB_12007:
	mov r15,0
LB_12084:
	cmp r15,0
	jz LB_12085
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12084
LB_12085:
; ∎ { %_11983 %_11985 }
 ; {>  %_11983~0':_stg %_11986~3':_r64 %_11985~2':_stg %_11987~4':(_lst)◂(_p11352) %_11984~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_12086
	mov rdi,r9
	call dlt
LB_12086:
	bt r12,4
	jc LB_12087
	mov rdi,r10
	call dlt
LB_12087:
	bt r12,1
	jc LB_12088
	mov rdi,r14
	call dlt
LB_12088:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12089
	btr r12,1
	jmp LB_12090
LB_12089:
	bts r12,1
LB_12090:
	ret
MTC_LB_12083:
NS_E_12106:
; 	|» 0'
NS_E_RDI_12106:
; » 0xr0 |~ {  } ⊢ %_12092 : %_12092
 ; {>  %_12091~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_12092
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f11357 { %_12091 %_12092 } ⊢ { %_12093 %_12094 %_12095 } : { %_12093 %_12094 %_12095 }
 ; {>  %_12092~1':_r64 %_12091~0':_stg }
; _f11357 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_11357
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_12107
	btr r12,4
	jmp LB_12108
LB_12107:
	bts r12,4
LB_12108:
	mov r8,r9
	bt r12,3
	jc LB_12111
	btr r12,2
	jmp LB_12112
LB_12111:
	bts r12,2
LB_12112:
	mov rsi,1
	bt r12,2
	jc LB_12109
	mov rsi,0
	bt r8,0
	jc LB_12109
	jmp LB_12110
LB_12109:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_12110:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_12113:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12114
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_12115
	bt QWORD [rdi],0
	jc LB_12116
	btr r12,5
	jmp LB_12117
LB_12116:
	bts r12,5
LB_12117:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12115:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_12120
	btr r12,6
	jmp LB_12121
LB_12120:
	bts r12,6
LB_12121:
	mov r9,rcx
	bt r12,6
	jc LB_12118
	btr r12,3
	jmp LB_12119
LB_12118:
	bts r12,3
LB_12119:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_12124
	btr r12,6
	jmp LB_12125
LB_12124:
	bts r12,6
LB_12125:
	mov r10,rcx
	bt r12,6
	jc LB_12122
	btr r12,4
	jmp LB_12123
LB_12122:
	bts r12,4
LB_12123:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12126:
	cmp r15,0
	jz LB_12127
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12126
LB_12127:
; _f19 %_12096 ⊢ { %_12098 %_12099 } : { %_12098 %_12099 }
 ; {>  %_12093~0':_stg %_12097~4':(_lst)◂(_p11352) %_12096~3':_r64 %_12094~1':_r64 }
; _f19 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_12134
	btr r12,0
	jmp LB_12135
LB_12134:
	bts r12,0
LB_12135:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_12136
	btr r12,2
	jmp LB_12137
LB_12136:
	bts r12,2
LB_12137:
	mov r9,r14
	bt r12,1
	jc LB_12138
	btr r12,3
	jmp LB_12139
LB_12138:
	bts r12,3
LB_12139:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_12132
	btr r12,4
	jmp LB_12133
LB_12132:
	bts r12,4
LB_12133:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_12130
	btr r12,1
	jmp LB_12131
LB_12130:
	bts r12,1
LB_12131:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_12128
	btr r12,0
	jmp LB_12129
LB_12128:
	bts r12,0
LB_12129:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_12100 : %_12100
 ; {>  %_12093~0':_stg %_12097~4':(_lst)◂(_p11352) %_12099~3':_stg %_12098~2':_r64 %_12094~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_12100
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_12101 : %_12101
 ; {>  %_12093~0':_stg %_12100~5':_r64 %_12097~4':(_lst)◂(_p11352) %_12099~3':_stg %_12098~2':_r64 %_12094~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_12101
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f12005 { %_12093 %_12100 %_12099 %_12101 %_12097 } ⊢ { %_12102 %_12103 } : { %_12102 %_12103 }
 ; {>  %_12093~0':_stg %_12100~5':_r64 %_12097~4':(_lst)◂(_p11352) %_12101~6':_r64 %_12099~3':_stg %_12098~2':_r64 %_12094~1':_r64 }
; _f12005 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_12144
	btr r12,1
	jmp LB_12145
LB_12144:
	bts r12,1
LB_12145:
	mov r8,r9
	bt r12,3
	jc LB_12146
	btr r12,2
	jmp LB_12147
LB_12146:
	bts r12,2
LB_12147:
	mov r9,rcx
	bt r12,6
	jc LB_12148
	btr r12,3
	jmp LB_12149
LB_12148:
	bts r12,3
LB_12149:
	call NS_E_12005
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_12150
	btr r12,3
	jmp LB_12151
LB_12150:
	bts r12,3
LB_12151:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_12142
	btr r12,2
	jmp LB_12143
LB_12142:
	bts r12,2
LB_12143:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_12140
	btr r12,1
	jmp LB_12141
LB_12140:
	bts r12,1
LB_12141:
	add rsp,24
; _some %_12103 ⊢ %_12104 : %_12104
 ; {>  %_12103~3':_stg %_12102~0':_stg %_12098~2':_r64 %_12094~1':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_12102 %_12104 }
 ; {>  %_12102~0':_stg %_12098~2':_r64 %_12094~1':_r64 %_12104~°0◂3':(_opn)◂(_stg) }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_12152
	mov rdi,r8
	call dlt
LB_12152:
	bt r12,1
	jc LB_12153
	mov rdi,r14
	call dlt
LB_12153:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12156
	btr r12,1
	jmp LB_12157
LB_12156:
	bts r12,1
LB_12157:
	mov rsi,1
	bt r12,1
	jc LB_12154
	mov rsi,0
	bt r14,0
	jc LB_12154
	jmp LB_12155
LB_12154:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_12155:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_12114:
	mov r15,0
LB_12159:
	cmp r15,0
	jz LB_12160
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12159
LB_12160:
; _none {  } ⊢ %_12105 : %_12105
 ; {>  %_12093~0':_stg %_12095~2':(_opn)◂({ _r64 (_lst)◂(_p11352) }) %_12094~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_12093 %_12105 }
 ; {>  %_12093~0':_stg %_12095~2':(_opn)◂({ _r64 (_lst)◂(_p11352) }) %_12105~°1◂{  }:(_opn)◂(t4514'(0)) %_12094~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_12161
	mov rdi,r8
	call dlt
LB_12161:
	bt r12,1
	jc LB_12162
	mov rdi,r14
	call dlt
LB_12162:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_12163
	mov rsi,0
	bt r14,0
	jc LB_12163
	jmp LB_12164
LB_12163:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_12164:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_12158:
NS_E_12168:
NS_E_RDI_12168:
; » _^ ..
	mov rax,70
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "## FEFEF \n"
	mov rsi,0x_46_45_46_45_46_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "HELLO \n"
	mov rsi,0x_48
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "fdEF \n"
	mov rsi,0x_66
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_64
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_46
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "F fe \n"
	mov rsi,0x_46
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_65
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\] \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "\\]\n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "WORlD \n"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_6c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_67_75_75_68_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_09_09_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; _f12106 %_12165 ⊢ { %_12166 %_12167 } : { %_12166 %_12167 }
 ; {>  %_12165~0':_stg }
; _f12106 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_12106
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_12166~0':_stg %_12167~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_12169
	mov rdi,r13
	call dlt
LB_12169:
	bt r12,1
	jc LB_12170
	mov rdi,r14
	call dlt
LB_12170:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_12171:
NS_E_RDI_12171:
NS_E_12171_ETR_TBL:
NS_E_12171_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_12200
LB_12199:
	add r14,1
LB_12200:
	cmp r14,r10
	jge LB_12201
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12199
	cmp al,10
	jz LB_12199
	cmp al,32
	jz LB_12199
LB_12201:
	push r10
	call NS_E_9877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12202
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12192
LB_12202:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_12205
LB_12204:
	add r14,1
LB_12205:
	cmp r14,r10
	jge LB_12206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12204
	cmp al,10
	jz LB_12204
	cmp al,32
	jz LB_12204
LB_12206:
	add r14,1
	cmp r14,r10
	jg LB_12210
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_12210
	jmp LB_12211
LB_12210:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12208:
	jmp LB_12192
LB_12211:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_12213
LB_12212:
	add r14,1
LB_12213:
	cmp r14,r10
	jge LB_12214
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12212
	cmp al,10
	jz LB_12212
	cmp al,32
	jz LB_12212
LB_12214:
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12215
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12216
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12216:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12217
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12217:
	jmp LB_12192
LB_12215:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12197
	btr r12,2
	jmp LB_12198
LB_12197:
	bts r12,2
LB_12198:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12195
	btr r12,1
	jmp LB_12196
LB_12195:
	bts r12,1
LB_12196:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12193
	btr r12,0
	jmp LB_12194
LB_12193:
	bts r12,0
LB_12194:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12189
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_12219
	btr r12,3
	jmp LB_12220
LB_12219:
	bts r12,3
LB_12220:
	mov r14,r8
	bt r12,2
	jc LB_12221
	btr r12,1
	jmp LB_12222
LB_12221:
	bts r12,1
LB_12222:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f9936 { %_12172 %_12173 } ⊢ %_12174 : %_12174
 ; {>  %_12172~0':_stg %_12173~1':_p9935 }
; _f9936 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12174 ⊢ %_12175 : %_12175
 ; {>  %_12174~°0◂{ 0' 1' }:_p9935 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12175
 ; {>  %_12175~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9935) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12183
	btr r12,2
	jmp LB_12184
LB_12183:
	bts r12,2
LB_12184:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12181
	btr QWORD [rdi],0
	jmp LB_12182
LB_12181:
	bts QWORD [rdi],0
LB_12182:
	mov r8,r14
	bt r12,1
	jc LB_12187
	btr r12,2
	jmp LB_12188
LB_12187:
	bts r12,2
LB_12188:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12185
	btr QWORD [rdi],1
	jmp LB_12186
LB_12185:
	bts QWORD [rdi],1
LB_12186:
	mov rsi,1
	bt r12,3
	jc LB_12179
	mov rsi,0
	bt r9,0
	jc LB_12179
	jmp LB_12180
LB_12179:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12180:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12189:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12191
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12190
LB_12191:
	add rsp,8
	ret
LB_12192:
	add rsp,48
	pop r14
LB_12190:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_12234
LB_12233:
	add r14,1
LB_12234:
	cmp r14,r10
	jge LB_12235
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12233
	cmp al,32
	jz LB_12233
LB_12235:
	push r10
	call NS_E_9877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12236
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12230
LB_12236:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12231
	btr r12,0
	jmp LB_12232
LB_12231:
	bts r12,0
LB_12232:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12227
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9937 %_12176 ⊢ %_12177 : %_12177
 ; {>  %_12176~0':_stg }
; _f9937 0' ⊢ °1◂0'
; _some %_12177 ⊢ %_12178 : %_12178
 ; {>  %_12177~°1◂0':_p9935 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12178
 ; {>  %_12178~°0◂°1◂0':(_opn)◂(_p9935) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12225
	btr r12,3
	jmp LB_12226
LB_12225:
	bts r12,3
LB_12226:
	mov rsi,1
	bt r12,3
	jc LB_12223
	mov rsi,0
	bt r9,0
	jc LB_12223
	jmp LB_12224
LB_12223:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12224:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12227:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12229
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12228
LB_12229:
	add rsp,8
	ret
LB_12230:
	add rsp,16
	pop r14
LB_12228:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12238:
NS_E_RDI_12238:
NS_E_12238_ETR_TBL:
NS_E_12238_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12263
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12255
LB_12263:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_12271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_12271
	jmp LB_12272
LB_12271:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12269
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12269:
	jmp LB_12255
LB_12272:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12258
	btr r12,1
	jmp LB_12259
LB_12258:
	bts r12,1
LB_12259:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12256
	btr r12,0
	jmp LB_12257
LB_12256:
	bts r12,0
LB_12257:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12252
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10056 %_12239 ⊢ %_12240 : %_12240
 ; {>  %_12239~0':_r64 }
; _f10056 0' ⊢ °0◂0'
; _some %_12240 ⊢ %_12241 : %_12241
 ; {>  %_12240~°0◂0':_p10001 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12241
 ; {>  %_12241~°0◂°0◂0':(_opn)◂(_p10001) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12250
	btr r12,3
	jmp LB_12251
LB_12250:
	bts r12,3
LB_12251:
	mov rsi,1
	bt r12,3
	jc LB_12248
	mov rsi,0
	bt r9,0
	jc LB_12248
	jmp LB_12249
LB_12248:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12249:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12252:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12254
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12253
LB_12254:
	add rsp,8
	ret
LB_12255:
	add rsp,32
	pop r14
LB_12253:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_9380_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12286
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12280
LB_12286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12281
	btr r12,0
	jmp LB_12282
LB_12281:
	bts r12,0
LB_12282:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12277
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10057 %_12242 ⊢ %_12243 : %_12243
 ; {>  %_12242~0':_stg }
; _f10057 0' ⊢ °1◂0'
; _some %_12243 ⊢ %_12244 : %_12244
 ; {>  %_12243~°1◂0':_p10001 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12244
 ; {>  %_12244~°0◂°1◂0':(_opn)◂(_p10001) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12275
	btr r12,3
	jmp LB_12276
LB_12275:
	bts r12,3
LB_12276:
	mov rsi,1
	bt r12,3
	jc LB_12273
	mov rsi,0
	bt r9,0
	jc LB_12273
	jmp LB_12274
LB_12273:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12274:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12277:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12279
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12278
LB_12279:
	add rsp,8
	ret
LB_12280:
	add rsp,16
	pop r14
LB_12278:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12301
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12295
LB_12301:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12296
	btr r12,0
	jmp LB_12297
LB_12296:
	bts r12,0
LB_12297:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12292
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10058 %_12245 ⊢ %_12246 : %_12246
 ; {>  %_12245~0':_p9935 }
; _f10058 0' ⊢ °2◂0'
; _some %_12246 ⊢ %_12247 : %_12247
 ; {>  %_12246~°2◂0':_p10001 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_12247
 ; {>  %_12247~°0◂°2◂0':(_opn)◂(_p10001) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12290
	btr r12,3
	jmp LB_12291
LB_12290:
	bts r12,3
LB_12291:
	mov rsi,1
	bt r12,3
	jc LB_12288
	mov rsi,0
	bt r9,0
	jc LB_12288
	jmp LB_12289
LB_12288:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12289:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12292:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12294
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12293
LB_12294:
	add rsp,8
	ret
LB_12295:
	add rsp,16
	pop r14
LB_12293:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12304:
NS_E_RDI_12304:
NS_E_12304_ETR_TBL:
NS_E_12304_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_12311
LB_12310:
	add r14,1
LB_12311:
	cmp r14,r10
	jge LB_12312
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12310
	cmp al,32
	jz LB_12310
LB_12312:
	add r14,1
	cmp r14,r10
	jg LB_12315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_12315
	jmp LB_12316
LB_12315:
	jmp LB_12306
LB_12316:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov rsi,0x01_00_0000_0000_0001
	or rdi,rsi
LB_12321:
	jmp LB_12318
LB_12317:
	add r14,1
LB_12318:
	cmp r14,r10
	jge LB_12319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12317
	cmp al,32
	jz LB_12317
LB_12319:
	add r14,1
	cmp r14,r10
	jg LB_12320
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_12320
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_12321
LB_12320:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12307
	btr QWORD [rdi],1
LB_12307:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12308
	btr QWORD [rdi],0
LB_12308:
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
LB_12306:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12331:
; 	|» { 0' 1' }
NS_E_RDI_12331:
MTC_LB_12332:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12333
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_12334
	bt QWORD [rdi],0
	jc LB_12335
	btr r12,4
	jmp LB_12336
LB_12335:
	bts r12,4
LB_12336:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12334:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_12339
	btr r12,5
	jmp LB_12340
LB_12339:
	bts r12,5
LB_12340:
	mov r8,r11
	bt r12,5
	jc LB_12337
	btr r12,2
	jmp LB_12338
LB_12337:
	bts r12,2
LB_12338:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_12343
	btr r12,5
	jmp LB_12344
LB_12343:
	bts r12,5
LB_12344:
	mov r9,r11
	bt r12,5
	jc LB_12341
	btr r12,3
	jmp LB_12342
LB_12341:
	bts r12,3
LB_12342:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12345:
	cmp r15,0
	jz LB_12346
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12345
LB_12346:
; _f10053 { %_12325 %_12327 } ⊢ %_12329 : %_12329
 ; {>  %_12327~2':_p10000 %_12325~0':_p10000 %_12328~3':(_lst)◂(_p10000) }
; _f10053 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f12331 { %_12329 %_12328 } ⊢ %_12330 : %_12330
 ; {>  %_12328~3':(_lst)◂(_p10000) %_12329~°2◂{ 0' 2' }:_p10000 }
; _f12331 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12347
	btr r12,1
	jmp LB_12348
LB_12347:
	bts r12,1
LB_12348:
	mov r9,r13
	bt r12,0
	jc LB_12349
	btr r12,3
	jmp LB_12350
LB_12349:
	bts r12,3
LB_12350:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_12355
	btr r12,4
	jmp LB_12356
LB_12355:
	bts r12,4
LB_12356:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_12353
	btr QWORD [rdi],0
	jmp LB_12354
LB_12353:
	bts QWORD [rdi],0
LB_12354:
	mov r10,r8
	bt r12,2
	jc LB_12359
	btr r12,4
	jmp LB_12360
LB_12359:
	bts r12,4
LB_12360:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_12357
	btr QWORD [rdi],1
	jmp LB_12358
LB_12357:
	bts QWORD [rdi],1
LB_12358:
	mov rsi,1
	bt r12,0
	jc LB_12351
	mov rsi,0
	bt r13,0
	jc LB_12351
	jmp LB_12352
LB_12351:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_12352:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_12331
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_12330
 ; {>  %_12330~0':_p10000 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_12333:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12361
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_12362
	bt QWORD [rdi],0
	jc LB_12363
	btr r12,2
	jmp LB_12364
LB_12363:
	bts r12,2
LB_12364:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12362:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12365:
	cmp r15,0
	jz LB_12366
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12365
LB_12366:
; ∎ %_12325
 ; {>  %_12325~0':_p10000 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_12361:
NS_E_12367:
NS_E_RDI_12367:
NS_E_12367_ETR_TBL:
NS_E_12367_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_12414
LB_12413:
	add r14,1
LB_12414:
	cmp r14,r10
	jge LB_12415
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12413
	cmp al,10
	jz LB_12413
	cmp al,32
	jz LB_12413
LB_12415:
	add r14,1
	cmp r14,r10
	jg LB_12418
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_12418
	jmp LB_12419
LB_12418:
	jmp LB_12406
LB_12419:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_12421
LB_12420:
	add r14,1
LB_12421:
	cmp r14,r10
	jge LB_12422
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12420
	cmp al,10
	jz LB_12420
	cmp al,32
	jz LB_12420
LB_12422:
	push r10
	call NS_E_12368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12423
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12424
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12424:
	jmp LB_12406
LB_12423:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_12427
LB_12426:
	add r14,1
LB_12427:
	cmp r14,r10
	jge LB_12428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12426
	cmp al,10
	jz LB_12426
	cmp al,32
	jz LB_12426
LB_12428:
	add r14,1
	cmp r14,r10
	jg LB_12433
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_12433
	jmp LB_12434
LB_12433:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12430
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12430:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12431
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12431:
	jmp LB_12406
LB_12434:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12411
	btr r12,2
	jmp LB_12412
LB_12411:
	bts r12,2
LB_12412:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12409
	btr r12,1
	jmp LB_12410
LB_12409:
	bts r12,1
LB_12410:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12407
	btr r12,0
	jmp LB_12408
LB_12407:
	bts r12,0
LB_12408:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12403
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_12435
	btr r12,3
	jmp LB_12436
LB_12435:
	bts r12,3
LB_12436:
	mov r13,r14
	bt r12,1
	jc LB_12437
	btr r12,0
	jmp LB_12438
LB_12437:
	bts r12,0
LB_12438:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10047 %_12371 ⊢ %_12372 : %_12372
 ; {>  %_12371~0':(_lst)◂(_p9998) }
; _f10047 0' ⊢ °0◂0'
; _some %_12372 ⊢ %_12373 : %_12373
 ; {>  %_12372~°0◂0':_p9998 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12373
 ; {>  %_12373~°0◂°0◂0':(_opn)◂(_p9998) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12401
	btr r12,3
	jmp LB_12402
LB_12401:
	bts r12,3
LB_12402:
	mov rsi,1
	bt r12,3
	jc LB_12399
	mov rsi,0
	bt r9,0
	jc LB_12399
	jmp LB_12400
LB_12399:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12400:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12403:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12405
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12404
LB_12405:
	add rsp,8
	ret
LB_12406:
	add rsp,48
	pop r14
LB_12404:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; src
	jmp LB_12450
LB_12449:
	add r14,1
LB_12450:
	cmp r14,r10
	jge LB_12451
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12449
	cmp al,10
	jz LB_12449
	cmp al,32
	jz LB_12449
LB_12451:
	push r10
	call NS_E_12370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12452
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12446
LB_12452:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12447
	btr r12,0
	jmp LB_12448
LB_12447:
	bts r12,0
LB_12448:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12443
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10048 %_12374 ⊢ %_12375 : %_12375
 ; {>  %_12374~0':_p9996 }
; _f10048 0' ⊢ °1◂0'
; _some %_12375 ⊢ %_12376 : %_12376
 ; {>  %_12375~°1◂0':_p9998 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12376
 ; {>  %_12376~°0◂°1◂0':(_opn)◂(_p9998) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12441
	btr r12,3
	jmp LB_12442
LB_12441:
	bts r12,3
LB_12442:
	mov rsi,1
	bt r12,3
	jc LB_12439
	mov rsi,0
	bt r9,0
	jc LB_12439
	jmp LB_12440
LB_12439:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12440:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12443:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12445
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12444
LB_12445:
	add rsp,8
	ret
LB_12446:
	add rsp,16
	pop r14
LB_12444:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12368:
NS_E_RDI_12368:
NS_E_12368_ETR_TBL:
NS_E_12368_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; src_ptn
	jmp LB_12473
LB_12472:
	add r14,1
LB_12473:
	cmp r14,r10
	jge LB_12474
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12472
	cmp al,10
	jz LB_12472
	cmp al,32
	jz LB_12472
LB_12474:
	push r10
	call NS_E_12367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12475
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12467
LB_12475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_12478
LB_12477:
	add r14,1
LB_12478:
	cmp r14,r10
	jge LB_12479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12477
	cmp al,10
	jz LB_12477
	cmp al,32
	jz LB_12477
LB_12479:
	push r10
	call NS_E_12368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12480
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12481:
	jmp LB_12467
LB_12480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12470
	btr r12,1
	jmp LB_12471
LB_12470:
	bts r12,1
LB_12471:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12468
	btr r12,0
	jmp LB_12469
LB_12468:
	bts r12,0
LB_12469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12464
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_12377 %_12378 } ⊢ %_12379 : %_12379
 ; {>  %_12377~0':_p9998 %_12378~1':(_lst)◂(_p9998) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12379 ⊢ %_12380 : %_12380
 ; {>  %_12379~°0◂{ 0' 1' }:(_lst)◂(_p9998) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12380
 ; {>  %_12380~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9998)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12458
	btr r12,2
	jmp LB_12459
LB_12458:
	bts r12,2
LB_12459:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12456
	btr QWORD [rdi],0
	jmp LB_12457
LB_12456:
	bts QWORD [rdi],0
LB_12457:
	mov r8,r14
	bt r12,1
	jc LB_12462
	btr r12,2
	jmp LB_12463
LB_12462:
	bts r12,2
LB_12463:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12460
	btr QWORD [rdi],1
	jmp LB_12461
LB_12460:
	bts QWORD [rdi],1
LB_12461:
	mov rsi,1
	bt r12,3
	jc LB_12454
	mov rsi,0
	bt r9,0
	jc LB_12454
	jmp LB_12455
LB_12454:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12455:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12464:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12466
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12465
LB_12466:
	add rsp,8
	ret
LB_12467:
	add rsp,32
	pop r14
LB_12465:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12485
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12381 : %_12381
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12381 ⊢ %_12382 : %_12382
 ; {>  %_12381~°1◂{  }:(_lst)◂(t4620'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12382
 ; {>  %_12382~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4623'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12483
	mov rsi,0
	bt r9,0
	jc LB_12483
	jmp LB_12484
LB_12483:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12484:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12485:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12487
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12486
LB_12487:
	add rsp,8
	ret
LB_12488:
	add rsp,0
	pop r14
LB_12486:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12369:
NS_E_RDI_12369:
NS_E_12369_ETR_TBL:
NS_E_12369_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_12526
LB_12525:
	add r14,1
LB_12526:
	cmp r14,r10
	jge LB_12527
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12525
	cmp al,10
	jz LB_12525
	cmp al,32
	jz LB_12525
LB_12527:
	add r14,1
	cmp r14,r10
	jg LB_12530
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_12530
	jmp LB_12531
LB_12530:
	jmp LB_12504
LB_12531:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_12513
LB_12512:
	add r14,1
LB_12513:
	cmp r14,r10
	jge LB_12514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12512
	cmp al,10
	jz LB_12512
	cmp al,32
	jz LB_12512
LB_12514:
	push r10
	call NS_E_12370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12515
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12516
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12516:
	jmp LB_12505
LB_12515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_12519
LB_12518:
	add r14,1
LB_12519:
	cmp r14,r10
	jge LB_12520
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12518
	cmp al,10
	jz LB_12518
	cmp al,32
	jz LB_12518
LB_12520:
	push r10
	call NS_E_12369_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12521
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12522
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12522:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12523
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12523:
	jmp LB_12505
LB_12521:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12510
	btr r12,2
	jmp LB_12511
LB_12510:
	bts r12,2
LB_12511:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12508
	btr r12,1
	jmp LB_12509
LB_12508:
	bts r12,1
LB_12509:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12506
	btr r12,0
	jmp LB_12507
LB_12506:
	bts r12,0
LB_12507:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12501
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_12532
	btr r12,3
	jmp LB_12533
LB_12532:
	bts r12,3
LB_12533:
	mov r14,r8
	bt r12,2
	jc LB_12534
	btr r12,1
	jmp LB_12535
LB_12534:
	bts r12,1
LB_12535:
	mov r8,r13
	bt r12,0
	jc LB_12536
	btr r12,2
	jmp LB_12537
LB_12536:
	bts r12,2
LB_12537:
	mov r13,r9
	bt r12,3
	jc LB_12538
	btr r12,0
	jmp LB_12539
LB_12538:
	bts r12,0
LB_12539:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10048 %_12383 ⊢ %_12385 : %_12385
 ; {>  %_12384~1':(_lst)◂(_p9998) %_12383~0':_p9996 }
; _f10048 0' ⊢ °1◂0'
; _cns { %_12385 %_12384 } ⊢ %_12386 : %_12386
 ; {>  %_12384~1':(_lst)◂(_p9998) %_12385~°1◂0':_p9998 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_12386 ⊢ %_12387 : %_12387
 ; {>  %_12386~°0◂{ °1◂0' 1' }:(_lst)◂(_p9998) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_12387
 ; {>  %_12387~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p9998)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12495
	btr r12,2
	jmp LB_12496
LB_12495:
	bts r12,2
LB_12496:
	mov rsi,1
	bt r12,2
	jc LB_12493
	mov rsi,0
	bt r8,0
	jc LB_12493
	jmp LB_12494
LB_12493:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_12494:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12491
	btr QWORD [rdi],0
	jmp LB_12492
LB_12491:
	bts QWORD [rdi],0
LB_12492:
	mov r8,r14
	bt r12,1
	jc LB_12499
	btr r12,2
	jmp LB_12500
LB_12499:
	bts r12,2
LB_12500:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12497
	btr QWORD [rdi],1
	jmp LB_12498
LB_12497:
	bts QWORD [rdi],1
LB_12498:
	mov rsi,1
	bt r12,3
	jc LB_12489
	mov rsi,0
	bt r9,0
	jc LB_12489
	jmp LB_12490
LB_12489:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12490:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12501:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12503
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12502
LB_12503:
	add rsp,8
	ret
LB_12505:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12504:
	add rsp,48
	pop r14
LB_12502:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12542
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12388 : %_12388
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12388 ⊢ %_12389 : %_12389
 ; {>  %_12388~°1◂{  }:(_lst)◂(t4634'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12389
 ; {>  %_12389~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4637'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12540
	mov rsi,0
	bt r9,0
	jc LB_12540
	jmp LB_12541
LB_12540:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12541:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12542:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12544
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12543
LB_12544:
	add rsp,8
	ret
LB_12545:
	add rsp,0
	pop r14
LB_12543:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12370:
NS_E_RDI_12370:
NS_E_12370_ETR_TBL:
NS_E_12370_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "%["
	jmp LB_12561
LB_12560:
	add r14,1
LB_12561:
	cmp r14,r10
	jge LB_12562
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12560
	cmp al,10
	jz LB_12560
	cmp al,32
	jz LB_12560
LB_12562:
	add r14,2
	cmp r14,r10
	jg LB_12565
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_12565
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_12565
	jmp LB_12566
LB_12565:
	jmp LB_12553
LB_12566:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_12568
LB_12567:
	add r14,1
LB_12568:
	cmp r14,r10
	jge LB_12569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12567
	cmp al,10
	jz LB_12567
	cmp al,32
	jz LB_12567
LB_12569:
	push r10
	call NS_E_12238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12570
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12571:
	jmp LB_12553
LB_12570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_12574
LB_12573:
	add r14,1
LB_12574:
	cmp r14,r10
	jge LB_12575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12573
	cmp al,10
	jz LB_12573
	cmp al,32
	jz LB_12573
LB_12575:
	add r14,1
	cmp r14,r10
	jg LB_12580
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_12580
	jmp LB_12581
LB_12580:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12577
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12577:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12578
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12578:
	jmp LB_12553
LB_12581:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12558
	btr r12,2
	jmp LB_12559
LB_12558:
	bts r12,2
LB_12559:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12556
	btr r12,1
	jmp LB_12557
LB_12556:
	bts r12,1
LB_12557:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12554
	btr r12,0
	jmp LB_12555
LB_12554:
	bts r12,0
LB_12555:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12550
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_12582
	btr r12,3
	jmp LB_12583
LB_12582:
	bts r12,3
LB_12583:
	mov r13,r14
	bt r12,1
	jc LB_12584
	btr r12,0
	jmp LB_12585
LB_12584:
	bts r12,0
LB_12585:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10043 %_12390 ⊢ %_12391 : %_12391
 ; {>  %_12390~0':_p10001 }
; _f10043 0' ⊢ °0◂0'
; _some %_12391 ⊢ %_12392 : %_12392
 ; {>  %_12391~°0◂0':_p9996 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12392
 ; {>  %_12392~°0◂°0◂0':(_opn)◂(_p9996) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12548
	btr r12,3
	jmp LB_12549
LB_12548:
	bts r12,3
LB_12549:
	mov rsi,1
	bt r12,3
	jc LB_12546
	mov rsi,0
	bt r9,0
	jc LB_12546
	jmp LB_12547
LB_12546:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12547:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12550:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12552
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12551
LB_12552:
	add rsp,8
	ret
LB_12553:
	add rsp,48
	pop r14
LB_12551:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_12610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_12610
	jmp LB_12611
LB_12610:
	jmp LB_12593
LB_12611:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_9877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12602
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12603
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12603:
	jmp LB_12594
LB_12602:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12597
	btr r12,1
	jmp LB_12598
LB_12597:
	bts r12,1
LB_12598:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12595
	btr r12,0
	jmp LB_12596
LB_12595:
	bts r12,0
LB_12596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12590
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_12612
	btr r12,2
	jmp LB_12613
LB_12612:
	bts r12,2
LB_12613:
	mov r13,r14
	bt r12,1
	jc LB_12614
	btr r12,0
	jmp LB_12615
LB_12614:
	bts r12,0
LB_12615:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10044 %_12393 ⊢ %_12394 : %_12394
 ; {>  %_12393~0':_stg }
; _f10044 0' ⊢ °1◂0'
; _some %_12394 ⊢ %_12395 : %_12395
 ; {>  %_12394~°1◂0':_p9996 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12395
 ; {>  %_12395~°0◂°1◂0':(_opn)◂(_p9996) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12588
	btr r12,3
	jmp LB_12589
LB_12588:
	bts r12,3
LB_12589:
	mov rsi,1
	bt r12,3
	jc LB_12586
	mov rsi,0
	bt r9,0
	jc LB_12586
	jmp LB_12587
LB_12586:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12587:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12590:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12592
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12591
LB_12592:
	add rsp,8
	ret
LB_12594:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12593:
	add rsp,32
	pop r14
LB_12591:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_12627
LB_12626:
	add r14,1
LB_12627:
	cmp r14,r10
	jge LB_12628
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12626
	cmp al,10
	jz LB_12626
	cmp al,32
	jz LB_12626
LB_12628:
	push r10
	call NS_E_9877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12629
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12623
LB_12629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12624
	btr r12,0
	jmp LB_12625
LB_12624:
	bts r12,0
LB_12625:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12620
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10044 %_12396 ⊢ %_12397 : %_12397
 ; {>  %_12396~0':_stg }
; _f10044 0' ⊢ °1◂0'
; _some %_12397 ⊢ %_12398 : %_12398
 ; {>  %_12397~°1◂0':_p9996 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12398
 ; {>  %_12398~°0◂°1◂0':(_opn)◂(_p9996) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12618
	btr r12,3
	jmp LB_12619
LB_12618:
	bts r12,3
LB_12619:
	mov rsi,1
	bt r12,3
	jc LB_12616
	mov rsi,0
	bt r9,0
	jc LB_12616
	jmp LB_12617
LB_12616:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12617:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12620:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12622
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12621
LB_12622:
	add rsp,8
	ret
LB_12623:
	add rsp,16
	pop r14
LB_12621:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12631:
NS_E_RDI_12631:
NS_E_12631_ETR_TBL:
NS_E_12631_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_12681
LB_12680:
	add r14,1
LB_12681:
	cmp r14,r10
	jge LB_12682
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12680
	cmp al,10
	jz LB_12680
	cmp al,32
	jz LB_12680
LB_12682:
	add r14,1
	cmp r14,r10
	jg LB_12685
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_12685
	jmp LB_12686
LB_12685:
	jmp LB_12673
LB_12686:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_12688
LB_12687:
	add r14,1
LB_12688:
	cmp r14,r10
	jge LB_12689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12687
	cmp al,10
	jz LB_12687
	cmp al,32
	jz LB_12687
LB_12689:
	push r10
	call NS_E_12632_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12690
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12691
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12691:
	jmp LB_12673
LB_12690:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_12694
LB_12693:
	add r14,1
LB_12694:
	cmp r14,r10
	jge LB_12695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12693
	cmp al,10
	jz LB_12693
	cmp al,32
	jz LB_12693
LB_12695:
	add r14,1
	cmp r14,r10
	jg LB_12700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_12700
	jmp LB_12701
LB_12700:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12697
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12697:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12698:
	jmp LB_12673
LB_12701:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12678
	btr r12,2
	jmp LB_12679
LB_12678:
	bts r12,2
LB_12679:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12676
	btr r12,1
	jmp LB_12677
LB_12676:
	bts r12,1
LB_12677:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12674
	btr r12,0
	jmp LB_12675
LB_12674:
	bts r12,0
LB_12675:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12670
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_12702
	btr r12,3
	jmp LB_12703
LB_12702:
	bts r12,3
LB_12703:
	mov r13,r14
	bt r12,1
	jc LB_12704
	btr r12,0
	jmp LB_12705
LB_12704:
	bts r12,0
LB_12705:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10049 %_12637 ⊢ %_12638 : %_12638
 ; {>  %_12637~0':(_lst)◂(_p9999) }
; _f10049 0' ⊢ °0◂0'
; _some %_12638 ⊢ %_12639 : %_12639
 ; {>  %_12638~°0◂0':_p9999 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12639
 ; {>  %_12639~°0◂°0◂0':(_opn)◂(_p9999) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12668
	btr r12,3
	jmp LB_12669
LB_12668:
	bts r12,3
LB_12669:
	mov rsi,1
	bt r12,3
	jc LB_12666
	mov rsi,0
	bt r9,0
	jc LB_12666
	jmp LB_12667
LB_12666:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12667:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12670:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12672
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12671
LB_12672:
	add rsp,8
	ret
LB_12673:
	add rsp,48
	pop r14
LB_12671:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dst
	jmp LB_12717
LB_12716:
	add r14,1
LB_12717:
	cmp r14,r10
	jge LB_12718
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12716
	cmp al,10
	jz LB_12716
	cmp al,32
	jz LB_12716
LB_12718:
	push r10
	call NS_E_12636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12719
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12713
LB_12719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12714
	btr r12,0
	jmp LB_12715
LB_12714:
	bts r12,0
LB_12715:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12710
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10050 %_12640 ⊢ %_12641 : %_12641
 ; {>  %_12640~0':_p9997 }
; _f10050 0' ⊢ °1◂0'
; _some %_12641 ⊢ %_12642 : %_12642
 ; {>  %_12641~°1◂0':_p9999 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12642
 ; {>  %_12642~°0◂°1◂0':(_opn)◂(_p9999) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12708
	btr r12,3
	jmp LB_12709
LB_12708:
	bts r12,3
LB_12709:
	mov rsi,1
	bt r12,3
	jc LB_12706
	mov rsi,0
	bt r9,0
	jc LB_12706
	jmp LB_12707
LB_12706:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12707:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12710:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12712
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12711
LB_12712:
	add rsp,8
	ret
LB_12713:
	add rsp,16
	pop r14
LB_12711:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12632:
NS_E_RDI_12632:
NS_E_12632_ETR_TBL:
NS_E_12632_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_12740
LB_12739:
	add r14,1
LB_12740:
	cmp r14,r10
	jge LB_12741
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12739
	cmp al,10
	jz LB_12739
	cmp al,32
	jz LB_12739
LB_12741:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12742
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12734
LB_12742:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_12745
LB_12744:
	add r14,1
LB_12745:
	cmp r14,r10
	jge LB_12746
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12744
	cmp al,10
	jz LB_12744
	cmp al,32
	jz LB_12744
LB_12746:
	push r10
	call NS_E_12632_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12747
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12748
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12748:
	jmp LB_12734
LB_12747:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12737
	btr r12,1
	jmp LB_12738
LB_12737:
	bts r12,1
LB_12738:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12735
	btr r12,0
	jmp LB_12736
LB_12735:
	bts r12,0
LB_12736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12731
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_12643 %_12644 } ⊢ %_12645 : %_12645
 ; {>  %_12644~1':(_lst)◂(_p9999) %_12643~0':_p9999 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12645 ⊢ %_12646 : %_12646
 ; {>  %_12645~°0◂{ 0' 1' }:(_lst)◂(_p9999) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12646
 ; {>  %_12646~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9999)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12725
	btr r12,2
	jmp LB_12726
LB_12725:
	bts r12,2
LB_12726:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12723
	btr QWORD [rdi],0
	jmp LB_12724
LB_12723:
	bts QWORD [rdi],0
LB_12724:
	mov r8,r14
	bt r12,1
	jc LB_12729
	btr r12,2
	jmp LB_12730
LB_12729:
	bts r12,2
LB_12730:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12727
	btr QWORD [rdi],1
	jmp LB_12728
LB_12727:
	bts QWORD [rdi],1
LB_12728:
	mov rsi,1
	bt r12,3
	jc LB_12721
	mov rsi,0
	bt r9,0
	jc LB_12721
	jmp LB_12722
LB_12721:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12722:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12731:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12733
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12732
LB_12733:
	add rsp,8
	ret
LB_12734:
	add rsp,32
	pop r14
LB_12732:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12752
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12647 : %_12647
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12647 ⊢ %_12648 : %_12648
 ; {>  %_12647~°1◂{  }:(_lst)◂(t4722'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12648
 ; {>  %_12648~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4725'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12750
	mov rsi,0
	bt r9,0
	jc LB_12750
	jmp LB_12751
LB_12750:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12751:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12752:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12754
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12753
LB_12754:
	add rsp,8
	ret
LB_12755:
	add rsp,0
	pop r14
LB_12753:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12634:
NS_E_RDI_12634:
NS_E_12634_ETR_TBL:
NS_E_12634_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_12778
LB_12777:
	add r14,1
LB_12778:
	cmp r14,r10
	jge LB_12779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12777
	cmp al,10
	jz LB_12777
	cmp al,32
	jz LB_12777
LB_12779:
	add r14,1
	cmp r14,r10
	jg LB_12782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_12782
	jmp LB_12783
LB_12782:
	jmp LB_12756
LB_12783:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_12765
LB_12764:
	add r14,1
LB_12765:
	cmp r14,r10
	jge LB_12766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12764
	cmp al,10
	jz LB_12764
	cmp al,32
	jz LB_12764
LB_12766:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12767
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12768:
	jmp LB_12757
LB_12767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_12771
LB_12770:
	add r14,1
LB_12771:
	cmp r14,r10
	jge LB_12772
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12770
	cmp al,10
	jz LB_12770
	cmp al,32
	jz LB_12770
LB_12772:
	push r10
	call NS_E_12634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12773
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12774
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12774:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12775
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12775:
	jmp LB_12757
LB_12773:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12760
	btr QWORD [rdi],2
LB_12760:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12761
	btr QWORD [rdi],1
LB_12761:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12762
	btr QWORD [rdi],0
LB_12762:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_12757:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12756:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_12758:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12635:
NS_E_RDI_12635:
NS_E_12635_ETR_TBL:
NS_E_12635_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_12821
LB_12820:
	add r14,1
LB_12821:
	cmp r14,r10
	jge LB_12822
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12820
	cmp al,10
	jz LB_12820
	cmp al,32
	jz LB_12820
LB_12822:
	add r14,1
	cmp r14,r10
	jg LB_12825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_12825
	jmp LB_12826
LB_12825:
	jmp LB_12799
LB_12826:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_12808
LB_12807:
	add r14,1
LB_12808:
	cmp r14,r10
	jge LB_12809
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12807
	cmp al,10
	jz LB_12807
	cmp al,32
	jz LB_12807
LB_12809:
	push r10
	call NS_E_12636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12810
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12811
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12811:
	jmp LB_12800
LB_12810:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_12814
LB_12813:
	add r14,1
LB_12814:
	cmp r14,r10
	jge LB_12815
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12813
	cmp al,10
	jz LB_12813
	cmp al,32
	jz LB_12813
LB_12815:
	push r10
	call NS_E_12635_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12816
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12817
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12817:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12818
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12818:
	jmp LB_12800
LB_12816:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12805
	btr r12,2
	jmp LB_12806
LB_12805:
	bts r12,2
LB_12806:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12803
	btr r12,1
	jmp LB_12804
LB_12803:
	bts r12,1
LB_12804:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12801
	btr r12,0
	jmp LB_12802
LB_12801:
	bts r12,0
LB_12802:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12796
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_12827
	btr r12,3
	jmp LB_12828
LB_12827:
	bts r12,3
LB_12828:
	mov r14,r8
	bt r12,2
	jc LB_12829
	btr r12,1
	jmp LB_12830
LB_12829:
	bts r12,1
LB_12830:
	mov r8,r13
	bt r12,0
	jc LB_12831
	btr r12,2
	jmp LB_12832
LB_12831:
	bts r12,2
LB_12832:
	mov r13,r9
	bt r12,3
	jc LB_12833
	btr r12,0
	jmp LB_12834
LB_12833:
	bts r12,0
LB_12834:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10050 %_12651 ⊢ %_12653 : %_12653
 ; {>  %_12652~1':(_lst)◂(_p9999) %_12651~0':_p9997 }
; _f10050 0' ⊢ °1◂0'
; _cns { %_12653 %_12652 } ⊢ %_12654 : %_12654
 ; {>  %_12653~°1◂0':_p9999 %_12652~1':(_lst)◂(_p9999) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_12654 ⊢ %_12655 : %_12655
 ; {>  %_12654~°0◂{ °1◂0' 1' }:(_lst)◂(_p9999) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_12655
 ; {>  %_12655~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p9999)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12790
	btr r12,2
	jmp LB_12791
LB_12790:
	bts r12,2
LB_12791:
	mov rsi,1
	bt r12,2
	jc LB_12788
	mov rsi,0
	bt r8,0
	jc LB_12788
	jmp LB_12789
LB_12788:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_12789:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12786
	btr QWORD [rdi],0
	jmp LB_12787
LB_12786:
	bts QWORD [rdi],0
LB_12787:
	mov r8,r14
	bt r12,1
	jc LB_12794
	btr r12,2
	jmp LB_12795
LB_12794:
	bts r12,2
LB_12795:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12792
	btr QWORD [rdi],1
	jmp LB_12793
LB_12792:
	bts QWORD [rdi],1
LB_12793:
	mov rsi,1
	bt r12,3
	jc LB_12784
	mov rsi,0
	bt r9,0
	jc LB_12784
	jmp LB_12785
LB_12784:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12785:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12796:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12798
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12797
LB_12798:
	add rsp,8
	ret
LB_12800:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12799:
	add rsp,48
	pop r14
LB_12797:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12837
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12656 : %_12656
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12656 ⊢ %_12657 : %_12657
 ; {>  %_12656~°1◂{  }:(_lst)◂(t4736'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12657
 ; {>  %_12657~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4739'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12835
	mov rsi,0
	bt r9,0
	jc LB_12835
	jmp LB_12836
LB_12835:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12836:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12837:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12839
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12838
LB_12839:
	add rsp,8
	ret
LB_12840:
	add rsp,0
	pop r14
LB_12838:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12636:
NS_E_RDI_12636:
NS_E_12636_ETR_TBL:
NS_E_12636_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_12865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_12865
	jmp LB_12866
LB_12865:
	jmp LB_12848
LB_12866:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12857
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12858
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12858:
	jmp LB_12849
LB_12857:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12852
	btr r12,1
	jmp LB_12853
LB_12852:
	bts r12,1
LB_12853:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12850
	btr r12,0
	jmp LB_12851
LB_12850:
	bts r12,0
LB_12851:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12845
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_12867
	btr r12,2
	jmp LB_12868
LB_12867:
	bts r12,2
LB_12868:
	mov r13,r14
	bt r12,1
	jc LB_12869
	btr r12,0
	jmp LB_12870
LB_12869:
	bts r12,0
LB_12870:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10046 %_12658 ⊢ %_12659 : %_12659
 ; {>  %_12658~0':_stg }
; _f10046 0' ⊢ °1◂0'
; _some %_12659 ⊢ %_12660 : %_12660
 ; {>  %_12659~°1◂0':_p9997 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12660
 ; {>  %_12660~°0◂°1◂0':(_opn)◂(_p9997) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12843
	btr r12,3
	jmp LB_12844
LB_12843:
	bts r12,3
LB_12844:
	mov rsi,1
	bt r12,3
	jc LB_12841
	mov rsi,0
	bt r9,0
	jc LB_12841
	jmp LB_12842
LB_12841:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12842:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12845:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12847
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12846
LB_12847:
	add rsp,8
	ret
LB_12849:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12848:
	add rsp,32
	pop r14
LB_12846:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12884
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12878
LB_12884:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12879
	btr r12,0
	jmp LB_12880
LB_12879:
	bts r12,0
LB_12880:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12875
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10046 %_12661 ⊢ %_12662 : %_12662
 ; {>  %_12661~0':_stg }
; _f10046 0' ⊢ °1◂0'
; _some %_12662 ⊢ %_12663 : %_12663
 ; {>  %_12662~°1◂0':_p9997 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12663
 ; {>  %_12663~°0◂°1◂0':(_opn)◂(_p9997) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12873
	btr r12,3
	jmp LB_12874
LB_12873:
	bts r12,3
LB_12874:
	mov rsi,1
	bt r12,3
	jc LB_12871
	mov rsi,0
	bt r9,0
	jc LB_12871
	jmp LB_12872
LB_12871:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12872:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12875:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12877
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12876
LB_12877:
	add rsp,8
	ret
LB_12878:
	add rsp,16
	pop r14
LB_12876:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_12899
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_12899
	jmp LB_12900
LB_12899:
	jmp LB_12891
LB_12900:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12892
	btr r12,0
	jmp LB_12893
LB_12892:
	bts r12,0
LB_12893:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12888
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10045 {  } ⊢ %_12664 : %_12664
 ; {>  }
; _f10045 {  } ⊢ °0◂{  }
; _some %_12664 ⊢ %_12665 : %_12665
 ; {>  %_12664~°0◂{  }:_p9997 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_12665
 ; {>  %_12665~°0◂°0◂{  }:(_opn)◂(_p9997) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12886
	mov rsi,0
	bt r9,0
	jc LB_12886
	jmp LB_12887
LB_12886:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12887:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12888:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12890
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12889
LB_12890:
	add rsp,8
	ret
LB_12891:
	add rsp,16
	pop r14
LB_12889:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12901:
NS_E_RDI_12901:
NS_E_12901_ETR_TBL:
NS_E_12901_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_12979
LB_12978:
	add r14,1
LB_12979:
	cmp r14,r10
	jge LB_12980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12978
	cmp al,10
	jz LB_12978
	cmp al,32
	jz LB_12978
LB_12980:
	push r10
	call NS_E_12904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12981
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12971
LB_12981:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_12984
LB_12983:
	add r14,1
LB_12984:
	cmp r14,r10
	jge LB_12985
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12983
	cmp al,10
	jz LB_12983
	cmp al,32
	jz LB_12983
LB_12985:
	push r10
	call NS_E_12903_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12986
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12987
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12987:
	jmp LB_12971
LB_12986:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_12990
LB_12989:
	add r14,1
LB_12990:
	cmp r14,r10
	jge LB_12991
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12989
	cmp al,10
	jz LB_12989
	cmp al,32
	jz LB_12989
LB_12991:
	push r10
	call NS_E_12902_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12992
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12993
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12993:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12994
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12994:
	jmp LB_12971
LB_12992:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12976
	btr r12,2
	jmp LB_12977
LB_12976:
	bts r12,2
LB_12977:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12974
	btr r12,1
	jmp LB_12975
LB_12974:
	bts r12,1
LB_12975:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12972
	btr r12,0
	jmp LB_12973
LB_12972:
	bts r12,0
LB_12973:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12968
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f12331 { %_12906 %_12907 } ⊢ %_12909 : %_12909
 ; {>  %_12906~0':_p10000 %_12907~1':(_lst)◂(_p10000) %_12908~2':(_opn)◂(_p10000) }
; _f12331 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_12331
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_12939
	btr r12,2
	jmp LB_12940
LB_12939:
	bts r12,2
LB_12940:
	add rsp,16
MTC_LB_12941:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12942
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_12943
	bt QWORD [rdi],0
	jc LB_12944
	btr r12,3
	jmp LB_12945
LB_12944:
	bts r12,3
LB_12945:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12943:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_12946
	btr r12,1
	jmp LB_12947
LB_12946:
	bts r12,1
LB_12947:
LB_12948:
	cmp r15,0
	jz LB_12949
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12948
LB_12949:
; _f10052 { %_12909 %_12910 } ⊢ %_12911 : %_12911
 ; {>  %_12910~1':_p10000 %_12909~0':_p10000 }
; _f10052 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_12911 ⊢ %_12912 : %_12912
 ; {>  %_12911~°1◂{ 0' 1' }:_p10000 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_12912
 ; {>  %_12912~°0◂°1◂{ 0' 1' }:(_opn)◂(_p10000) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12954
	btr r12,2
	jmp LB_12955
LB_12954:
	bts r12,2
LB_12955:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12952
	btr QWORD [rdi],0
	jmp LB_12953
LB_12952:
	bts QWORD [rdi],0
LB_12953:
	mov r8,r14
	bt r12,1
	jc LB_12958
	btr r12,2
	jmp LB_12959
LB_12958:
	bts r12,2
LB_12959:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12956
	btr QWORD [rdi],1
	jmp LB_12957
LB_12956:
	bts QWORD [rdi],1
LB_12957:
	mov rsi,1
	bt r12,3
	jc LB_12950
	mov rsi,0
	bt r9,0
	jc LB_12950
	jmp LB_12951
LB_12950:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12951:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_12942:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12960
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_12961
	bt QWORD [rdi],0
	jc LB_12962
	btr r12,1
	jmp LB_12963
LB_12962:
	bts r12,1
LB_12963:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12961:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12964:
	cmp r15,0
	jz LB_12965
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12964
LB_12965:
; _some %_12909 ⊢ %_12913 : %_12913
 ; {>  %_12909~0':_p10000 }
; _some 0' ⊢ °0◂0'
; ∎ %_12913
 ; {>  %_12913~°0◂0':(_opn)◂(_p10000) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12966
	btr r12,3
	jmp LB_12967
LB_12966:
	bts r12,3
LB_12967:
	mov r8,0
	bts r12,2
	ret
MTC_LB_12960:
LB_12968:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12970
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12969
LB_12970:
	add rsp,8
	ret
LB_12971:
	add rsp,48
	pop r14
LB_12969:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12902:
NS_E_RDI_12902:
NS_E_12902_ETR_TBL:
NS_E_12902_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_13009
LB_13008:
	add r14,1
LB_13009:
	cmp r14,r10
	jge LB_13010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13008
	cmp al,10
	jz LB_13008
	cmp al,32
	jz LB_13008
LB_13010:
	add r14,3
	cmp r14,r10
	jg LB_13013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_13013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_13013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_13013
	jmp LB_13014
LB_13013:
	jmp LB_13003
LB_13014:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_13016
LB_13015:
	add r14,1
LB_13016:
	cmp r14,r10
	jge LB_13017
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13015
	cmp al,10
	jz LB_13015
	cmp al,32
	jz LB_13015
LB_13017:
	push r10
	call NS_E_12901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13018
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13019
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13019:
	jmp LB_13003
LB_13018:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13006
	btr r12,1
	jmp LB_13007
LB_13006:
	bts r12,1
LB_13007:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13004
	btr r12,0
	jmp LB_13005
LB_13004:
	bts r12,0
LB_13005:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13000
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13021
	btr r12,2
	jmp LB_13022
LB_13021:
	bts r12,2
LB_13022:
	mov r13,r14
	bt r12,1
	jc LB_13023
	btr r12,0
	jmp LB_13024
LB_13023:
	bts r12,0
LB_13024:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12914 ⊢ %_12915 : %_12915
 ; {>  %_12914~0':_p10000 }
; _some 0' ⊢ °0◂0'
; _some %_12915 ⊢ %_12916 : %_12916
 ; {>  %_12915~°0◂0':(_opn)◂(_p10000) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12916
 ; {>  %_12916~°0◂°0◂0':(_opn)◂((_opn)◂(_p10000)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12998
	btr r12,3
	jmp LB_12999
LB_12998:
	bts r12,3
LB_12999:
	mov rsi,1
	bt r12,3
	jc LB_12996
	mov rsi,0
	bt r9,0
	jc LB_12996
	jmp LB_12997
LB_12996:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12997:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13000:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13002
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13001
LB_13002:
	add rsp,8
	ret
LB_13003:
	add rsp,32
	pop r14
LB_13001:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13027
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_12917 : %_12917
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_12917 ⊢ %_12918 : %_12918
 ; {>  %_12917~°1◂{  }:(_opn)◂(t4830'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12918
 ; {>  %_12918~°0◂°1◂{  }:(_opn)◂((_opn)◂(t4833'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13025
	mov rsi,0
	bt r9,0
	jc LB_13025
	jmp LB_13026
LB_13025:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13026:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13027:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13029
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13028
LB_13029:
	add rsp,8
	ret
LB_13030:
	add rsp,0
	pop r14
LB_13028:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12903:
NS_E_RDI_12903:
NS_E_12903_ETR_TBL:
NS_E_12903_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_13052
LB_13051:
	add r14,1
LB_13052:
	cmp r14,r10
	jge LB_13053
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13051
	cmp al,10
	jz LB_13051
	cmp al,32
	jz LB_13051
LB_13053:
	add r14,3
	cmp r14,r10
	jg LB_13056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_13056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_13056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_13056
	jmp LB_13057
LB_13056:
	jmp LB_13044
LB_13057:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_13059
LB_13058:
	add r14,1
LB_13059:
	cmp r14,r10
	jge LB_13060
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13058
	cmp al,10
	jz LB_13058
	cmp al,32
	jz LB_13058
LB_13060:
	push r10
	call NS_E_12904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13061
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13062:
	jmp LB_13044
LB_13061:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_13065
LB_13064:
	add r14,1
LB_13065:
	cmp r14,r10
	jge LB_13066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13064
	cmp al,10
	jz LB_13064
	cmp al,32
	jz LB_13064
LB_13066:
	push r10
	call NS_E_12903_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13067
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13068
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13068:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13069
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13069:
	jmp LB_13044
LB_13067:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13049
	btr r12,2
	jmp LB_13050
LB_13049:
	bts r12,2
LB_13050:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13047
	btr r12,1
	jmp LB_13048
LB_13047:
	bts r12,1
LB_13048:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13045
	btr r12,0
	jmp LB_13046
LB_13045:
	bts r12,0
LB_13046:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13041
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_13071
	btr r12,3
	jmp LB_13072
LB_13071:
	bts r12,3
LB_13072:
	mov r14,r8
	bt r12,2
	jc LB_13073
	btr r12,1
	jmp LB_13074
LB_13073:
	bts r12,1
LB_13074:
	mov r8,r13
	bt r12,0
	jc LB_13075
	btr r12,2
	jmp LB_13076
LB_13075:
	bts r12,2
LB_13076:
	mov r13,r9
	bt r12,3
	jc LB_13077
	btr r12,0
	jmp LB_13078
LB_13077:
	bts r12,0
LB_13078:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_12919 %_12920 } ⊢ %_12921 : %_12921
 ; {>  %_12919~0':_p10000 %_12920~1':(_lst)◂(_p10000) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12921 ⊢ %_12922 : %_12922
 ; {>  %_12921~°0◂{ 0' 1' }:(_lst)◂(_p10000) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12922
 ; {>  %_12922~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10000)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13035
	btr r12,2
	jmp LB_13036
LB_13035:
	bts r12,2
LB_13036:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13033
	btr QWORD [rdi],0
	jmp LB_13034
LB_13033:
	bts QWORD [rdi],0
LB_13034:
	mov r8,r14
	bt r12,1
	jc LB_13039
	btr r12,2
	jmp LB_13040
LB_13039:
	bts r12,2
LB_13040:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13037
	btr QWORD [rdi],1
	jmp LB_13038
LB_13037:
	bts QWORD [rdi],1
LB_13038:
	mov rsi,1
	bt r12,3
	jc LB_13031
	mov rsi,0
	bt r9,0
	jc LB_13031
	jmp LB_13032
LB_13031:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13032:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13041:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13043
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13042
LB_13043:
	add rsp,8
	ret
LB_13044:
	add rsp,48
	pop r14
LB_13042:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13081
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12923 : %_12923
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12923 ⊢ %_12924 : %_12924
 ; {>  %_12923~°1◂{  }:(_lst)◂(t4843'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12924
 ; {>  %_12924~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4846'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13079
	mov rsi,0
	bt r9,0
	jc LB_13079
	jmp LB_13080
LB_13079:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13080:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13081:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13083
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13082
LB_13083:
	add rsp,8
	ret
LB_13084:
	add rsp,0
	pop r14
LB_13082:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12904:
NS_E_RDI_12904:
NS_E_12904_ETR_TBL:
NS_E_12904_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_13100
LB_13099:
	add r14,1
LB_13100:
	cmp r14,r10
	jge LB_13101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13099
	cmp al,10
	jz LB_13099
	cmp al,32
	jz LB_13099
LB_13101:
	add r14,1
	cmp r14,r10
	jg LB_13104
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_13104
	jmp LB_13105
LB_13104:
	jmp LB_13092
LB_13105:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ type ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_13110:
	jmp LB_13107
LB_13106:
	add r14,1
LB_13107:
	cmp r14,r10
	jge LB_13108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13106
	cmp al,10
	jz LB_13106
	cmp al,32
	jz LB_13106
LB_13108:
	push r10
	push rsi
	call NS_E_12901_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_13109
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_13111
	bts QWORD [rax],0
LB_13111:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_13110
LB_13109:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_13113
LB_13112:
	add r14,1
LB_13113:
	cmp r14,r10
	jge LB_13114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13112
	cmp al,10
	jz LB_13112
	cmp al,32
	jz LB_13112
LB_13114:
	add r14,1
	cmp r14,r10
	jg LB_13119
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_13119
	jmp LB_13120
LB_13119:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13116
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13116:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13117
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13117:
	jmp LB_13092
LB_13120:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13097
	btr r12,2
	jmp LB_13098
LB_13097:
	bts r12,2
LB_13098:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13095
	btr r12,1
	jmp LB_13096
LB_13095:
	bts r12,1
LB_13096:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13093
	btr r12,0
	jmp LB_13094
LB_13093:
	bts r12,0
LB_13094:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13089
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_13121
	btr r12,3
	jmp LB_13122
LB_13121:
	bts r12,3
LB_13122:
	mov r13,r14
	bt r12,1
	jc LB_13123
	btr r12,0
	jmp LB_13124
LB_13123:
	bts r12,0
LB_13124:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9309 %_12925 ⊢ %_12926 : %_12926
 ; {>  %_12925~0':(_lst)◂(_p10000) }
; _f9309 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9309
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f10051 %_12926 ⊢ %_12927 : %_12927
 ; {>  %_12926~0':(_lst)◂(_p10000) }
; _f10051 0' ⊢ °0◂0'
; _some %_12927 ⊢ %_12928 : %_12928
 ; {>  %_12927~°0◂0':_p10000 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12928
 ; {>  %_12928~°0◂°0◂0':(_opn)◂(_p10000) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13087
	btr r12,3
	jmp LB_13088
LB_13087:
	bts r12,3
LB_13088:
	mov rsi,1
	bt r12,3
	jc LB_13085
	mov rsi,0
	bt r9,0
	jc LB_13085
	jmp LB_13086
LB_13085:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13086:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13089:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13091
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13090
LB_13091:
	add rsp,8
	ret
LB_13092:
	add rsp,48
	pop r14
LB_13090:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "("
	jmp LB_13138
LB_13137:
	add r14,1
LB_13138:
	cmp r14,r10
	jge LB_13139
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13137
	cmp al,10
	jz LB_13137
	cmp al,32
	jz LB_13137
LB_13139:
	add r14,1
	cmp r14,r10
	jg LB_13142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_13142
	jmp LB_13143
LB_13142:
	jmp LB_13130
LB_13143:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_13145
LB_13144:
	add r14,1
LB_13145:
	cmp r14,r10
	jge LB_13146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13144
	cmp al,10
	jz LB_13144
	cmp al,32
	jz LB_13144
LB_13146:
	push r10
	call NS_E_12901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13147
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13148
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13148:
	jmp LB_13130
LB_13147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_13151
LB_13150:
	add r14,1
LB_13151:
	cmp r14,r10
	jge LB_13152
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13150
	cmp al,10
	jz LB_13150
	cmp al,32
	jz LB_13150
LB_13152:
	add r14,1
	cmp r14,r10
	jg LB_13157
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_13157
	jmp LB_13158
LB_13157:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13154
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13154:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13155
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13155:
	jmp LB_13130
LB_13158:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13135
	btr r12,2
	jmp LB_13136
LB_13135:
	bts r12,2
LB_13136:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13133
	btr r12,1
	jmp LB_13134
LB_13133:
	bts r12,1
LB_13134:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13131
	btr r12,0
	jmp LB_13132
LB_13131:
	bts r12,0
LB_13132:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13127
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_13159
	btr r12,3
	jmp LB_13160
LB_13159:
	bts r12,3
LB_13160:
	mov r13,r14
	bt r12,1
	jc LB_13161
	btr r12,0
	jmp LB_13162
LB_13161:
	bts r12,0
LB_13162:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12929 ⊢ %_12930 : %_12930
 ; {>  %_12929~0':_p10000 }
; _some 0' ⊢ °0◂0'
; ∎ %_12930
 ; {>  %_12930~°0◂0':(_opn)◂(_p10000) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13125
	btr r12,3
	jmp LB_13126
LB_13125:
	bts r12,3
LB_13126:
	mov r8,0
	bts r12,2
	ret
LB_13127:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13129
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13128
LB_13129:
	add rsp,8
	ret
LB_13130:
	add rsp,48
	pop r14
LB_13128:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_13174
LB_13173:
	add r14,1
LB_13174:
	cmp r14,r10
	jge LB_13175
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13173
	cmp al,10
	jz LB_13173
	cmp al,32
	jz LB_13173
LB_13175:
	push r10
	call NS_E_12905_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13176
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13170
LB_13176:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13171
	btr r12,0
	jmp LB_13172
LB_13171:
	bts r12,0
LB_13172:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13167
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10055 %_12931 ⊢ %_12932 : %_12932
 ; {>  %_12931~0':_stg }
; _f10055 0' ⊢ °4◂0'
; _some %_12932 ⊢ %_12933 : %_12933
 ; {>  %_12932~°4◂0':_p10000 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_12933
 ; {>  %_12933~°0◂°4◂0':(_opn)◂(_p10000) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13165
	btr r12,3
	jmp LB_13166
LB_13165:
	bts r12,3
LB_13166:
	mov rsi,1
	bt r12,3
	jc LB_13163
	mov rsi,0
	bt r9,0
	jc LB_13163
	jmp LB_13164
LB_13163:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13164:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13167:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13169
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13168
LB_13169:
	add rsp,8
	ret
LB_13170:
	add rsp,16
	pop r14
LB_13168:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_13189
LB_13188:
	add r14,1
LB_13189:
	cmp r14,r10
	jge LB_13190
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13188
	cmp al,10
	jz LB_13188
	cmp al,32
	jz LB_13188
LB_13190:
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13191
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13185
LB_13191:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13186
	btr r12,0
	jmp LB_13187
LB_13186:
	bts r12,0
LB_13187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13182
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10054 %_12934 ⊢ %_12935 : %_12935
 ; {>  %_12934~0':_p9935 }
; _f10054 0' ⊢ °3◂0'
; _some %_12935 ⊢ %_12936 : %_12936
 ; {>  %_12935~°3◂0':_p10000 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_12936
 ; {>  %_12936~°0◂°3◂0':(_opn)◂(_p10000) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13180
	btr r12,3
	jmp LB_13181
LB_13180:
	bts r12,3
LB_13181:
	mov rsi,1
	bt r12,3
	jc LB_13178
	mov rsi,0
	bt r9,0
	jc LB_13178
	jmp LB_13179
LB_13178:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13179:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13182:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13184
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13183
LB_13184:
	add rsp,8
	ret
LB_13185:
	add rsp,16
	pop r14
LB_13183:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12905:
NS_E_RDI_12905:
NS_E_12905_ETR_TBL:
NS_E_12905_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13206
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13198
LB_13206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_13214
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_13214
	jmp LB_13215
LB_13214:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13212
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13212:
	jmp LB_13198
LB_13215:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13201
	btr r12,1
	jmp LB_13202
LB_13201:
	bts r12,1
LB_13202:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13199
	btr r12,0
	jmp LB_13200
LB_13199:
	bts r12,0
LB_13200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13195
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12937 ⊢ %_12938 : %_12938
 ; {>  %_12937~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_12938
 ; {>  %_12938~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13193
	btr r12,3
	jmp LB_13194
LB_13193:
	bts r12,3
LB_13194:
	mov r8,0
	bts r12,2
	ret
LB_13195:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13197
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13196
LB_13197:
	add rsp,8
	ret
LB_13198:
	add rsp,32
	pop r14
LB_13196:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13216:
NS_E_RDI_13216:
NS_E_13216_ETR_TBL:
NS_E_13216_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_13624
LB_13623:
	add r14,1
LB_13624:
	cmp r14,r10
	jge LB_13625
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13623
	cmp al,10
	jz LB_13623
	cmp al,32
	jz LB_13623
LB_13625:
	push r10
	call NS_E_13217_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13626
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13618
LB_13626:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_13629
LB_13628:
	add r14,1
LB_13629:
	cmp r14,r10
	jge LB_13630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13628
	cmp al,10
	jz LB_13628
	cmp al,32
	jz LB_13628
LB_13630:
	push r10
	call NS_E_13216_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13631
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13632
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13632:
	jmp LB_13618
LB_13631:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13621
	btr r12,1
	jmp LB_13622
LB_13621:
	bts r12,1
LB_13622:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13619
	btr r12,0
	jmp LB_13620
LB_13619:
	bts r12,0
LB_13620:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13615
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_13256 %_13257 } ⊢ %_13258 : %_13258
 ; {>  %_13256~0':_p9983 %_13257~1':(_lst)◂(_p9983) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13258 ⊢ %_13259 : %_13259
 ; {>  %_13258~°0◂{ 0' 1' }:(_lst)◂(_p9983) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13259
 ; {>  %_13259~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9983)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13609
	btr r12,2
	jmp LB_13610
LB_13609:
	bts r12,2
LB_13610:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13607
	btr QWORD [rdi],0
	jmp LB_13608
LB_13607:
	bts QWORD [rdi],0
LB_13608:
	mov r8,r14
	bt r12,1
	jc LB_13613
	btr r12,2
	jmp LB_13614
LB_13613:
	bts r12,2
LB_13614:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13611
	btr QWORD [rdi],1
	jmp LB_13612
LB_13611:
	bts QWORD [rdi],1
LB_13612:
	mov rsi,1
	bt r12,3
	jc LB_13605
	mov rsi,0
	bt r9,0
	jc LB_13605
	jmp LB_13606
LB_13605:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13606:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13615:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13617
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13616
LB_13617:
	add rsp,8
	ret
LB_13618:
	add rsp,32
	pop r14
LB_13616:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13636
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13260 : %_13260
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13260 ⊢ %_13261 : %_13261
 ; {>  %_13260~°1◂{  }:(_lst)◂(t4972'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13261
 ; {>  %_13261~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4975'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13634
	mov rsi,0
	bt r9,0
	jc LB_13634
	jmp LB_13635
LB_13634:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13635:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13636:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13638
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13637
LB_13638:
	add rsp,8
	ret
LB_13639:
	add rsp,0
	pop r14
LB_13637:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13217:
NS_E_RDI_13217:
NS_E_13217_ETR_TBL:
NS_E_13217_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_13658
LB_13657:
	add r14,1
LB_13658:
	cmp r14,r10
	jge LB_13659
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13657
	cmp al,10
	jz LB_13657
	cmp al,32
	jz LB_13657
LB_13659:
	add r14,7
	cmp r14,r10
	jg LB_13662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_13662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_13662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_13662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_13662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_13662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_13662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_13662
	jmp LB_13663
LB_13662:
	jmp LB_13645
LB_13663:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_13652
LB_13651:
	add r14,1
LB_13652:
	cmp r14,r10
	jge LB_13653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13651
	cmp al,10
	jz LB_13651
	cmp al,32
	jz LB_13651
LB_13653:
	push r10
	call NS_E_13218_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13654
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13655
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13655:
	jmp LB_13646
LB_13654:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13649
	btr r12,1
	jmp LB_13650
LB_13649:
	bts r12,1
LB_13650:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13647
	btr r12,0
	jmp LB_13648
LB_13647:
	bts r12,0
LB_13648:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13642
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13664
	btr r12,2
	jmp LB_13665
LB_13664:
	bts r12,2
LB_13665:
	mov r13,r14
	bt r12,1
	jc LB_13666
	btr r12,0
	jmp LB_13667
LB_13666:
	bts r12,0
LB_13667:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13262 ⊢ %_13263 : %_13263
 ; {>  %_13262~0':_p9983 }
; _some 0' ⊢ °0◂0'
; ∎ %_13263
 ; {>  %_13263~°0◂0':(_opn)◂(_p9983) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13640
	btr r12,3
	jmp LB_13641
LB_13640:
	bts r12,3
LB_13641:
	mov r8,0
	bts r12,2
	ret
LB_13642:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13644
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13643
LB_13644:
	add rsp,8
	ret
LB_13646:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13645:
	add rsp,32
	pop r14
LB_13643:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13669
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_13264
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_13264 ⊢ %_13265 : %_13265
 ; {>  %_13264~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_13266 : %_13266
 ; {>  %_13265~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_13266
 ; {>  %_13265~0':_stg %_13266~°1◂{  }:(_opn)◂(t4985'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13668
	mov rdi,r13
	call dlt
LB_13668:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13669:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13671
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13670
LB_13671:
	add rsp,8
	ret
LB_13672:
	add rsp,0
	pop r14
LB_13670:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_13708
LB_13707:
	add r14,1
LB_13708:
	cmp r14,r10
	jge LB_13709
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13707
	cmp al,10
	jz LB_13707
	cmp al,32
	jz LB_13707
LB_13709:
	add r14,4
	cmp r14,r10
	jg LB_13712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_13712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_13712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_13712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_13712
	jmp LB_13713
LB_13712:
	jmp LB_13686
LB_13713:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_13695
LB_13694:
	add r14,1
LB_13695:
	cmp r14,r10
	jge LB_13696
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13694
	cmp al,10
	jz LB_13694
	cmp al,32
	jz LB_13694
LB_13696:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13697
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13698:
	jmp LB_13687
LB_13697:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_13701
LB_13700:
	add r14,1
LB_13701:
	cmp r14,r10
	jge LB_13702
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13700
	cmp al,10
	jz LB_13700
	cmp al,32
	jz LB_13700
LB_13702:
	push r10
	call NS_E_13219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13703
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13704
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13704:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13705:
	jmp LB_13687
LB_13703:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13692
	btr r12,2
	jmp LB_13693
LB_13692:
	bts r12,2
LB_13693:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13690
	btr r12,1
	jmp LB_13691
LB_13690:
	bts r12,1
LB_13691:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13688
	btr r12,0
	jmp LB_13689
LB_13688:
	bts r12,0
LB_13689:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13683
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_13714
	btr r12,3
	jmp LB_13715
LB_13714:
	bts r12,3
LB_13715:
	mov r14,r8
	bt r12,2
	jc LB_13716
	btr r12,1
	jmp LB_13717
LB_13716:
	bts r12,1
LB_13717:
	mov r8,r13
	bt r12,0
	jc LB_13718
	btr r12,2
	jmp LB_13719
LB_13718:
	bts r12,2
LB_13719:
	mov r13,r9
	bt r12,3
	jc LB_13720
	btr r12,0
	jmp LB_13721
LB_13720:
	bts r12,0
LB_13721:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10010 { %_13267 %_13268 } ⊢ %_13269 : %_13269
 ; {>  %_13268~1':_p9984 %_13267~0':_stg }
; _f10010 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13269 ⊢ %_13270 : %_13270
 ; {>  %_13269~°0◂{ 0' 1' }:_p9983 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13270
 ; {>  %_13270~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9983) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13677
	btr r12,2
	jmp LB_13678
LB_13677:
	bts r12,2
LB_13678:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13675
	btr QWORD [rdi],0
	jmp LB_13676
LB_13675:
	bts QWORD [rdi],0
LB_13676:
	mov r8,r14
	bt r12,1
	jc LB_13681
	btr r12,2
	jmp LB_13682
LB_13681:
	bts r12,2
LB_13682:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13679
	btr QWORD [rdi],1
	jmp LB_13680
LB_13679:
	bts QWORD [rdi],1
LB_13680:
	mov rsi,1
	bt r12,3
	jc LB_13673
	mov rsi,0
	bt r9,0
	jc LB_13673
	jmp LB_13674
LB_13673:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13674:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13683:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13685
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13684
LB_13685:
	add rsp,8
	ret
LB_13687:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13686:
	add rsp,48
	pop r14
LB_13684:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13723
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_13271
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_13271 ⊢ %_13272 : %_13272
 ; {>  %_13271~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_13273 : %_13273
 ; {>  %_13272~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_13273
 ; {>  %_13272~0':_stg %_13273~°1◂{  }:(_opn)◂(t4997'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13722
	mov rdi,r13
	call dlt
LB_13722:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13723:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13725
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13724
LB_13725:
	add rsp,8
	ret
LB_13726:
	add rsp,0
	pop r14
LB_13724:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_13745
LB_13744:
	add r14,1
LB_13745:
	cmp r14,r10
	jge LB_13746
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13744
	cmp al,10
	jz LB_13744
	cmp al,32
	jz LB_13744
LB_13746:
	add r14,2
	cmp r14,r10
	jg LB_13749
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_13749
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_13749
	jmp LB_13750
LB_13749:
	jmp LB_13732
LB_13750:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_13739
LB_13738:
	add r14,1
LB_13739:
	cmp r14,r10
	jge LB_13740
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13738
	cmp al,10
	jz LB_13738
	cmp al,32
	jz LB_13738
LB_13740:
	push r10
	call NS_E_13227_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13741
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13742
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13742:
	jmp LB_13733
LB_13741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13736
	btr r12,1
	jmp LB_13737
LB_13736:
	bts r12,1
LB_13737:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13734
	btr r12,0
	jmp LB_13735
LB_13734:
	bts r12,0
LB_13735:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13729
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13751
	btr r12,2
	jmp LB_13752
LB_13751:
	bts r12,2
LB_13752:
	mov r13,r14
	bt r12,1
	jc LB_13753
	btr r12,0
	jmp LB_13754
LB_13753:
	bts r12,0
LB_13754:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13274 ⊢ %_13275 : %_13275
 ; {>  %_13274~0':_p9983 }
; _some 0' ⊢ °0◂0'
; ∎ %_13275
 ; {>  %_13275~°0◂0':(_opn)◂(_p9983) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13727
	btr r12,3
	jmp LB_13728
LB_13727:
	bts r12,3
LB_13728:
	mov r8,0
	bts r12,2
	ret
LB_13729:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13731
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13730
LB_13731:
	add rsp,8
	ret
LB_13733:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13732:
	add rsp,32
	pop r14
LB_13730:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13756
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_13276
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_13276 ⊢ %_13277 : %_13277
 ; {>  %_13276~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_13278 : %_13278
 ; {>  %_13277~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_13278
 ; {>  %_13278~°1◂{  }:(_opn)◂(t5007'(0)) %_13277~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13755
	mov rdi,r13
	call dlt
LB_13755:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13756:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13758
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13757
LB_13758:
	add rsp,8
	ret
LB_13759:
	add rsp,0
	pop r14
LB_13757:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_13778
LB_13777:
	add r14,1
LB_13778:
	cmp r14,r10
	jge LB_13779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13777
	cmp al,10
	jz LB_13777
	cmp al,32
	jz LB_13777
LB_13779:
	add r14,2
	cmp r14,r10
	jg LB_13782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_13782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_13782
	jmp LB_13783
LB_13782:
	jmp LB_13765
LB_13783:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_13772
LB_13771:
	add r14,1
LB_13772:
	cmp r14,r10
	jge LB_13773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13771
	cmp al,10
	jz LB_13771
	cmp al,32
	jz LB_13771
LB_13773:
	push r10
	call NS_E_13221_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13774
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13775
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13775:
	jmp LB_13766
LB_13774:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13769
	btr r12,1
	jmp LB_13770
LB_13769:
	bts r12,1
LB_13770:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13767
	btr r12,0
	jmp LB_13768
LB_13767:
	bts r12,0
LB_13768:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13762
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13784
	btr r12,2
	jmp LB_13785
LB_13784:
	bts r12,2
LB_13785:
	mov r13,r14
	bt r12,1
	jc LB_13786
	btr r12,0
	jmp LB_13787
LB_13786:
	bts r12,0
LB_13787:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13279 ⊢ %_13280 : %_13280
 ; {>  %_13279~0':_p9983 }
; _some 0' ⊢ °0◂0'
; ∎ %_13280
 ; {>  %_13280~°0◂0':(_opn)◂(_p9983) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13760
	btr r12,3
	jmp LB_13761
LB_13760:
	bts r12,3
LB_13761:
	mov r8,0
	bts r12,2
	ret
LB_13762:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13764
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13763
LB_13764:
	add rsp,8
	ret
LB_13766:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13765:
	add rsp,32
	pop r14
LB_13763:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13218:
NS_E_RDI_13218:
NS_E_13218_ETR_TBL:
NS_E_13218_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_etr
	jmp LB_13823
LB_13822:
	add r14,1
LB_13823:
	cmp r14,r10
	jge LB_13824
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13822
	cmp al,10
	jz LB_13822
	cmp al,32
	jz LB_13822
LB_13824:
	push r10
	call NS_E_13243_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13825
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13817
LB_13825:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_13831:
	jmp LB_13828
LB_13827:
	add r14,1
LB_13828:
	cmp r14,r10
	jge LB_13829
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13827
	cmp al,10
	jz LB_13827
	cmp al,32
	jz LB_13827
LB_13829:
	push r10
	push rsi
	call NS_E_13243_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_13830
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_13832
	bts QWORD [rax],0
LB_13832:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_13831
LB_13830:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13820
	btr r12,1
	jmp LB_13821
LB_13820:
	bts r12,1
LB_13821:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13818
	btr r12,0
	jmp LB_13819
LB_13818:
	bts r12,0
LB_13819:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13814
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_13833
	btr r12,2
	jmp LB_13834
LB_13833:
	bts r12,2
LB_13834:
	mov r9,r13
	bt r12,0
	jc LB_13835
	btr r12,3
	jmp LB_13836
LB_13835:
	bts r12,3
LB_13836:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_13839
	btr r12,4
	jmp LB_13840
LB_13839:
	bts r12,4
LB_13840:
	mov r13,r10
	bt r12,4
	jc LB_13837
	btr r12,0
	jmp LB_13838
LB_13837:
	bts r12,0
LB_13838:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_13843
	btr r12,4
	jmp LB_13844
LB_13843:
	bts r12,4
LB_13844:
	mov r14,r10
	bt r12,4
	jc LB_13841
	btr r12,1
	jmp LB_13842
LB_13841:
	bts r12,1
LB_13842:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f9309 %_13282 ⊢ %_13283 : %_13283
 ; {>  %_13281~{ 0' 1' }:{ _stg _p9987 } %_13282~2':(_lst)◂({ _stg _p9987 }) }
; _f9309 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_13792
	btr r12,0
	jmp LB_13793
LB_13792:
	bts r12,0
LB_13793:
	call NS_E_9309
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_13794
	btr r12,2
	jmp LB_13795
LB_13794:
	bts r12,2
LB_13795:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_13790
	btr r12,1
	jmp LB_13791
LB_13790:
	bts r12,1
LB_13791:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_13788
	btr r12,0
	jmp LB_13789
LB_13788:
	bts r12,0
LB_13789:
	add rsp,24
; _cns { %_13281 %_13283 } ⊢ %_13284 : %_13284
 ; {>  %_13283~2':(_lst)◂({ _stg _p9987 }) %_13281~{ 0' 1' }:{ _stg _p9987 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f10011 %_13284 ⊢ %_13285 : %_13285
 ; {>  %_13284~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p9987 }) }
; _f10011 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_13285 ⊢ %_13286 : %_13286
 ; {>  %_13285~°1◂°0◂{ { 0' 1' } 2' }:_p9983 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_13286
 ; {>  %_13286~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p9983) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_13804
	btr r12,5
	jmp LB_13805
LB_13804:
	bts r12,5
LB_13805:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13802
	btr QWORD [rdi],0
	jmp LB_13803
LB_13802:
	bts QWORD [rdi],0
LB_13803:
	mov r11,r14
	bt r12,1
	jc LB_13808
	btr r12,5
	jmp LB_13809
LB_13808:
	bts r12,5
LB_13809:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13806
	btr QWORD [rdi],1
	jmp LB_13807
LB_13806:
	bts QWORD [rdi],1
LB_13807:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_13800
	btr QWORD [rdi],0
	jmp LB_13801
LB_13800:
	bts QWORD [rdi],0
LB_13801:
	mov r10,r8
	bt r12,2
	jc LB_13812
	btr r12,4
	jmp LB_13813
LB_13812:
	bts r12,4
LB_13813:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_13810
	btr QWORD [rdi],1
	jmp LB_13811
LB_13810:
	bts QWORD [rdi],1
LB_13811:
	mov rsi,1
	bt r12,3
	jc LB_13798
	mov rsi,0
	bt r9,0
	jc LB_13798
	jmp LB_13799
LB_13798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13799:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_13796
	mov rsi,0
	bt r9,0
	jc LB_13796
	jmp LB_13797
LB_13796:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13797:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13814:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13816
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13815
LB_13816:
	add rsp,8
	ret
LB_13817:
	add rsp,32
	pop r14
LB_13815:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13846
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_13287
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_13287 ⊢ %_13288 : %_13288
 ; {>  %_13287~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_13289 : %_13289
 ; {>  %_13288~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_13289
 ; {>  %_13289~°1◂{  }:(_opn)◂(t5026'(0)) %_13288~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13845
	mov rdi,r13
	call dlt
LB_13845:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13846:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13848
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13847
LB_13848:
	add rsp,8
	ret
LB_13849:
	add rsp,0
	pop r14
LB_13847:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13219:
NS_E_RDI_13219:
NS_E_13219_ETR_TBL:
NS_E_13219_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_13870
LB_13869:
	add r14,1
LB_13870:
	cmp r14,r10
	jge LB_13871
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13869
	cmp al,10
	jz LB_13869
	cmp al,32
	jz LB_13869
LB_13871:
	add r14,1
	cmp r14,r10
	jg LB_13874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_13874
	jmp LB_13875
LB_13874:
	jmp LB_13857
LB_13875:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_13864
LB_13863:
	add r14,1
LB_13864:
	cmp r14,r10
	jge LB_13865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13863
	cmp al,10
	jz LB_13863
	cmp al,32
	jz LB_13863
LB_13865:
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13866
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13867
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13867:
	jmp LB_13858
LB_13866:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13861
	btr r12,1
	jmp LB_13862
LB_13861:
	bts r12,1
LB_13862:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13859
	btr r12,0
	jmp LB_13860
LB_13859:
	bts r12,0
LB_13860:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13854
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13876
	btr r12,2
	jmp LB_13877
LB_13876:
	bts r12,2
LB_13877:
	mov r13,r14
	bt r12,1
	jc LB_13878
	btr r12,0
	jmp LB_13879
LB_13878:
	bts r12,0
LB_13879:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10017 %_13290 ⊢ %_13291 : %_13291
 ; {>  %_13290~0':_p9935 }
; _f10017 0' ⊢ °1◂0'
; _some %_13291 ⊢ %_13292 : %_13292
 ; {>  %_13291~°1◂0':_p9984 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13292
 ; {>  %_13292~°0◂°1◂0':(_opn)◂(_p9984) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13852
	btr r12,3
	jmp LB_13853
LB_13852:
	bts r12,3
LB_13853:
	mov rsi,1
	bt r12,3
	jc LB_13850
	mov rsi,0
	bt r9,0
	jc LB_13850
	jmp LB_13851
LB_13850:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13851:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13854:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13856
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13855
LB_13856:
	add rsp,8
	ret
LB_13858:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13857:
	add rsp,32
	pop r14
LB_13855:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_13891
LB_13890:
	add r14,1
LB_13891:
	cmp r14,r10
	jge LB_13892
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13890
	cmp al,10
	jz LB_13890
	cmp al,32
	jz LB_13890
LB_13892:
	push r10
	call NS_E_13220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13893
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13887
LB_13893:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13888
	btr r12,0
	jmp LB_13889
LB_13888:
	bts r12,0
LB_13889:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13884
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10016 %_13293 ⊢ %_13294 : %_13294
 ; {>  %_13293~0':(_lst)◂(_p9983) }
; _f10016 0' ⊢ °0◂0'
; _some %_13294 ⊢ %_13295 : %_13295
 ; {>  %_13294~°0◂0':_p9984 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13295
 ; {>  %_13295~°0◂°0◂0':(_opn)◂(_p9984) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13882
	btr r12,3
	jmp LB_13883
LB_13882:
	bts r12,3
LB_13883:
	mov rsi,1
	bt r12,3
	jc LB_13880
	mov rsi,0
	bt r9,0
	jc LB_13880
	jmp LB_13881
LB_13880:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13881:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13884:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13886
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13885
LB_13886:
	add rsp,8
	ret
LB_13887:
	add rsp,16
	pop r14
LB_13885:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13896
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_13296
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_13296 ⊢ %_13297 : %_13297
 ; {>  %_13296~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_13298 : %_13298
 ; {>  %_13297~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_13298
 ; {>  %_13298~°1◂{  }:(_opn)◂(t5041'(0)) %_13297~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13895
	mov rdi,r13
	call dlt
LB_13895:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13896:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13898
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13897
LB_13898:
	add rsp,8
	ret
LB_13899:
	add rsp,0
	pop r14
LB_13897:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13220:
NS_E_RDI_13220:
NS_E_13220_ETR_TBL:
NS_E_13220_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_13909
LB_13908:
	add r14,1
LB_13909:
	cmp r14,r10
	jge LB_13910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13908
	cmp al,10
	jz LB_13908
	cmp al,32
	jz LB_13908
LB_13910:
	add r14,6
	cmp r14,r10
	jg LB_13913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_13913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_13913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_13913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_13913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_13913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_13913
	jmp LB_13914
LB_13913:
	jmp LB_13905
LB_13914:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13906
	btr r12,0
	jmp LB_13907
LB_13906:
	bts r12,0
LB_13907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13902
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13299 : %_13299
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13299 ⊢ %_13300 : %_13300
 ; {>  %_13299~°1◂{  }:(_lst)◂(t5045'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13300
 ; {>  %_13300~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5048'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13900
	mov rsi,0
	bt r9,0
	jc LB_13900
	jmp LB_13901
LB_13900:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13901:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13904
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13903
LB_13904:
	add rsp,8
	ret
LB_13905:
	add rsp,16
	pop r14
LB_13903:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_13934
LB_13933:
	add r14,1
LB_13934:
	cmp r14,r10
	jge LB_13935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13933
	cmp al,10
	jz LB_13933
	cmp al,32
	jz LB_13933
LB_13935:
	push r10
	call NS_E_13217_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13936
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13928
LB_13936:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_13939
LB_13938:
	add r14,1
LB_13939:
	cmp r14,r10
	jge LB_13940
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13938
	cmp al,10
	jz LB_13938
	cmp al,32
	jz LB_13938
LB_13940:
	push r10
	call NS_E_13220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13941
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13942:
	jmp LB_13928
LB_13941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13931
	btr r12,1
	jmp LB_13932
LB_13931:
	bts r12,1
LB_13932:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13929
	btr r12,0
	jmp LB_13930
LB_13929:
	bts r12,0
LB_13930:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13925
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_13301 %_13302 } ⊢ %_13303 : %_13303
 ; {>  %_13301~0':_p9983 %_13302~1':(_lst)◂(_p9983) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13303 ⊢ %_13304 : %_13304
 ; {>  %_13303~°0◂{ 0' 1' }:(_lst)◂(_p9983) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13304
 ; {>  %_13304~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9983)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13919
	btr r12,2
	jmp LB_13920
LB_13919:
	bts r12,2
LB_13920:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13917
	btr QWORD [rdi],0
	jmp LB_13918
LB_13917:
	bts QWORD [rdi],0
LB_13918:
	mov r8,r14
	bt r12,1
	jc LB_13923
	btr r12,2
	jmp LB_13924
LB_13923:
	bts r12,2
LB_13924:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13921
	btr QWORD [rdi],1
	jmp LB_13922
LB_13921:
	bts QWORD [rdi],1
LB_13922:
	mov rsi,1
	bt r12,3
	jc LB_13915
	mov rsi,0
	bt r9,0
	jc LB_13915
	jmp LB_13916
LB_13915:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13916:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13925:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13927
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13926
LB_13927:
	add rsp,8
	ret
LB_13928:
	add rsp,32
	pop r14
LB_13926:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13221:
NS_E_RDI_13221:
NS_E_13221_ETR_TBL:
NS_E_13221_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_13999
LB_13998:
	add r14,1
LB_13999:
	cmp r14,r10
	jge LB_14000
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13998
	cmp al,10
	jz LB_13998
	cmp al,32
	jz LB_13998
LB_14000:
	add r14,1
	cmp r14,r10
	jg LB_14003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_14003
	jmp LB_14004
LB_14003:
	jmp LB_13965
LB_14004:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_13976
LB_13975:
	add r14,1
LB_13976:
	cmp r14,r10
	jge LB_13977
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13975
	cmp al,10
	jz LB_13975
	cmp al,32
	jz LB_13975
LB_13977:
	add r14,1
	cmp r14,r10
	jg LB_13981
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_13981
	jmp LB_13982
LB_13981:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13979
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13979:
	jmp LB_13966
LB_13982:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_13984
LB_13983:
	add r14,1
LB_13984:
	cmp r14,r10
	jge LB_13985
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13983
	cmp al,10
	jz LB_13983
	cmp al,32
	jz LB_13983
LB_13985:
	push r10
	call NS_E_13222_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13986
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13987
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13987:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13988
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13988:
	jmp LB_13966
LB_13986:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_13991
LB_13990:
	add r14,1
LB_13991:
	cmp r14,r10
	jge LB_13992
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13990
	cmp al,10
	jz LB_13990
	cmp al,32
	jz LB_13990
LB_13992:
	push r10
	call NS_E_13225_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13993
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13994
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13994:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13995
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13995:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13996
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13996:
	jmp LB_13966
LB_13993:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_13973
	btr r12,3
	jmp LB_13974
LB_13973:
	bts r12,3
LB_13974:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13971
	btr r12,2
	jmp LB_13972
LB_13971:
	bts r12,2
LB_13972:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13969
	btr r12,1
	jmp LB_13970
LB_13969:
	bts r12,1
LB_13970:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13967
	btr r12,0
	jmp LB_13968
LB_13967:
	bts r12,0
LB_13968:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_13962
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_14005
	btr r12,4
	jmp LB_14006
LB_14005:
	bts r12,4
LB_14006:
	mov r8,r9
	bt r12,3
	jc LB_14007
	btr r12,2
	jmp LB_14008
LB_14007:
	bts r12,2
LB_14008:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_14011
	btr r12,3
	jmp LB_14012
LB_14011:
	bts r12,3
LB_14012:
	mov r13,r9
	bt r12,3
	jc LB_14009
	btr r12,0
	jmp LB_14010
LB_14009:
	bts r12,0
LB_14010:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_14015
	btr r12,3
	jmp LB_14016
LB_14015:
	bts r12,3
LB_14016:
	mov r14,r9
	bt r12,3
	jc LB_14013
	btr r12,1
	jmp LB_14014
LB_14013:
	bts r12,1
LB_14014:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_13305 %_13306 } ⊢ %_13307 : %_13307
 ; {>  %_13305~{ 0' 1' }:{ _stg _p9986 } %_13306~2':(_lst)◂({ _stg _p9986 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f10015 %_13307 ⊢ %_13308 : %_13308
 ; {>  %_13307~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p9986 }) }
; _f10015 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_13308 ⊢ %_13309 : %_13309
 ; {>  %_13308~°5◂°0◂{ { 0' 1' } 2' }:_p9983 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_13309
 ; {>  %_13309~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p9983) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_13952
	btr r12,5
	jmp LB_13953
LB_13952:
	bts r12,5
LB_13953:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13950
	btr QWORD [rdi],0
	jmp LB_13951
LB_13950:
	bts QWORD [rdi],0
LB_13951:
	mov r11,r14
	bt r12,1
	jc LB_13956
	btr r12,5
	jmp LB_13957
LB_13956:
	bts r12,5
LB_13957:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13954
	btr QWORD [rdi],1
	jmp LB_13955
LB_13954:
	bts QWORD [rdi],1
LB_13955:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_13948
	btr QWORD [rdi],0
	jmp LB_13949
LB_13948:
	bts QWORD [rdi],0
LB_13949:
	mov r10,r8
	bt r12,2
	jc LB_13960
	btr r12,4
	jmp LB_13961
LB_13960:
	bts r12,4
LB_13961:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_13958
	btr QWORD [rdi],1
	jmp LB_13959
LB_13958:
	bts QWORD [rdi],1
LB_13959:
	mov rsi,1
	bt r12,3
	jc LB_13946
	mov rsi,0
	bt r9,0
	jc LB_13946
	jmp LB_13947
LB_13946:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13947:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_13944
	mov rsi,0
	bt r9,0
	jc LB_13944
	jmp LB_13945
LB_13944:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13945:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13962:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13964
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13963
LB_13964:
	add rsp,8
	ret
LB_13966:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13965:
	add rsp,64
	pop r14
LB_13963:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_14034
LB_14033:
	add r14,1
LB_14034:
	cmp r14,r10
	jge LB_14035
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14033
	cmp al,10
	jz LB_14033
	cmp al,32
	jz LB_14033
LB_14035:
	push r10
	call NS_E_13222_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14036
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14030
LB_14036:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14031
	btr r12,0
	jmp LB_14032
LB_14031:
	bts r12,0
LB_14032:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14027
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_14038
	btr r12,2
	jmp LB_14039
LB_14038:
	bts r12,2
LB_14039:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_14042
	btr r12,3
	jmp LB_14043
LB_14042:
	bts r12,3
LB_14043:
	mov r13,r9
	bt r12,3
	jc LB_14040
	btr r12,0
	jmp LB_14041
LB_14040:
	bts r12,0
LB_14041:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_14046
	btr r12,3
	jmp LB_14047
LB_14046:
	bts r12,3
LB_14047:
	mov r14,r9
	bt r12,3
	jc LB_14044
	btr r12,1
	jmp LB_14045
LB_14044:
	bts r12,1
LB_14045:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10014 %_13310 ⊢ %_13311 : %_13311
 ; {>  %_13310~{ 0' 1' }:{ _stg _p9986 } }
; _f10014 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_13311 ⊢ %_13312 : %_13312
 ; {>  %_13311~°4◂{ 0' 1' }:_p9983 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_13312
 ; {>  %_13312~°0◂°4◂{ 0' 1' }:(_opn)◂(_p9983) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_14021
	btr r12,2
	jmp LB_14022
LB_14021:
	bts r12,2
LB_14022:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14019
	btr QWORD [rdi],0
	jmp LB_14020
LB_14019:
	bts QWORD [rdi],0
LB_14020:
	mov r8,r14
	bt r12,1
	jc LB_14025
	btr r12,2
	jmp LB_14026
LB_14025:
	bts r12,2
LB_14026:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14023
	btr QWORD [rdi],1
	jmp LB_14024
LB_14023:
	bts QWORD [rdi],1
LB_14024:
	mov rsi,1
	bt r12,3
	jc LB_14017
	mov rsi,0
	bt r9,0
	jc LB_14017
	jmp LB_14018
LB_14017:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14018:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14027:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14029
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14028
LB_14029:
	add rsp,8
	ret
LB_14030:
	add rsp,16
	pop r14
LB_14028:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14049
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_13313
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_13313 ⊢ %_13314 : %_13314
 ; {>  %_13313~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_13315 : %_13315
 ; {>  %_13314~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_13315
 ; {>  %_13315~°1◂{  }:(_opn)◂(t5072'(0)) %_13314~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14048
	mov rdi,r13
	call dlt
LB_14048:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_14049:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14051
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14050
LB_14051:
	add rsp,8
	ret
LB_14052:
	add rsp,0
	pop r14
LB_14050:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13222:
NS_E_RDI_13222:
NS_E_13222_ETR_TBL:
NS_E_13222_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; word
	jmp LB_14086
LB_14085:
	add r14,1
LB_14086:
	cmp r14,r10
	jge LB_14087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14085
	cmp al,10
	jz LB_14085
	cmp al,32
	jz LB_14085
LB_14087:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14088
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14067
LB_14088:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_14091
LB_14090:
	add r14,1
LB_14091:
	cmp r14,r10
	jge LB_14092
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14090
	cmp al,10
	jz LB_14090
	cmp al,32
	jz LB_14090
LB_14092:
	push r10
	call NS_E_13224_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14093
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14094
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14094:
	jmp LB_14067
LB_14093:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_14097
LB_14096:
	add r14,1
LB_14097:
	cmp r14,r10
	jge LB_14098
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14096
	cmp al,10
	jz LB_14096
	cmp al,32
	jz LB_14096
LB_14098:
	add r14,1
	cmp r14,r10
	jg LB_14103
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_14103
	jmp LB_14104
LB_14103:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14100
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14100:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14101
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14101:
	jmp LB_14067
LB_14104:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_14078
LB_14077:
	add r14,1
LB_14078:
	cmp r14,r10
	jge LB_14079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14077
	cmp al,10
	jz LB_14077
	cmp al,32
	jz LB_14077
LB_14079:
	push r10
	call NS_E_12901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14080
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14081
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14081:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14082
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14082:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14083
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14083:
	jmp LB_14068
LB_14080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14075
	btr r12,3
	jmp LB_14076
LB_14075:
	bts r12,3
LB_14076:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14073
	btr r12,2
	jmp LB_14074
LB_14073:
	bts r12,2
LB_14074:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14071
	btr r12,1
	jmp LB_14072
LB_14071:
	bts r12,1
LB_14072:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14069
	btr r12,0
	jmp LB_14070
LB_14069:
	bts r12,0
LB_14070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_14064
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_14105
	btr r12,4
	jmp LB_14106
LB_14105:
	bts r12,4
LB_14106:
	mov r8,r9
	bt r12,3
	jc LB_14107
	btr r12,2
	jmp LB_14108
LB_14107:
	bts r12,2
LB_14108:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10022 %_13318 ⊢ %_13319 : %_13319
 ; {>  %_13318~2':_p10000 %_13317~1':_p13223 %_13316~0':_stg }
; _f10022 2' ⊢ °1◂2'
; _some { %_13316 %_13319 } ⊢ %_13320 : %_13320
 ; {>  %_13317~1':_p13223 %_13316~0':_stg %_13319~°1◂2':_p9986 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_13320
 ; {>  %_13320~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p9986 }) %_13317~1':_p13223 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_14053
	mov rdi,r14
	call dlt
LB_14053:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_14056
	btr r12,1
	jmp LB_14057
LB_14056:
	bts r12,1
LB_14057:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_14054
	btr QWORD [rdi],0
	jmp LB_14055
LB_14054:
	bts QWORD [rdi],0
LB_14055:
	mov r14,r8
	bt r12,2
	jc LB_14062
	btr r12,1
	jmp LB_14063
LB_14062:
	bts r12,1
LB_14063:
	mov rsi,1
	bt r12,1
	jc LB_14060
	mov rsi,0
	bt r14,0
	jc LB_14060
	jmp LB_14061
LB_14060:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_14061:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_14058
	btr QWORD [rdi],1
	jmp LB_14059
LB_14058:
	bts QWORD [rdi],1
LB_14059:
	mov r8,0
	bts r12,2
	ret
LB_14064:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14066
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14065
LB_14066:
	add rsp,8
	ret
LB_14068:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14067:
	add rsp,64
	pop r14
LB_14065:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; word
	jmp LB_14155
LB_14154:
	add r14,1
LB_14155:
	cmp r14,r10
	jge LB_14156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14154
	cmp al,10
	jz LB_14154
	cmp al,32
	jz LB_14154
LB_14156:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14157
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14139
LB_14157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_14160
LB_14159:
	add r14,1
LB_14160:
	cmp r14,r10
	jge LB_14161
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14159
	cmp al,10
	jz LB_14159
	cmp al,32
	jz LB_14159
LB_14161:
	push r10
	call NS_E_13224_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14162
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14163:
	jmp LB_14139
LB_14162:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_14166
LB_14165:
	add r14,1
LB_14166:
	cmp r14,r10
	jge LB_14167
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14165
	cmp al,10
	jz LB_14165
	cmp al,32
	jz LB_14165
LB_14167:
	add r14,3
	cmp r14,r10
	jg LB_14172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_14172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_14172
	jmp LB_14173
LB_14172:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14169
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14169:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14170
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14170:
	jmp LB_14139
LB_14173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_14175
LB_14174:
	add r14,1
LB_14175:
	cmp r14,r10
	jge LB_14176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14174
	cmp al,10
	jz LB_14174
	cmp al,32
	jz LB_14174
LB_14176:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14177
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14178
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14178:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14179
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14179:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14180
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14180:
	jmp LB_14139
LB_14177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_14183
LB_14182:
	add r14,1
LB_14183:
	cmp r14,r10
	jge LB_14184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14182
	cmp al,10
	jz LB_14182
	cmp al,32
	jz LB_14182
LB_14184:
	add r14,1
	cmp r14,r10
	jg LB_14191
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_14191
	jmp LB_14192
LB_14191:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14186
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14186:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14187
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14187:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14188
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14188:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14189
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14189:
	jmp LB_14139
LB_14192:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_14194
LB_14193:
	add r14,1
LB_14194:
	cmp r14,r10
	jge LB_14195
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14193
	cmp al,10
	jz LB_14193
	cmp al,32
	jz LB_14193
LB_14195:
	push r10
	call NS_E_12901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14196
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_14197
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_14197:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14198
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14198:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14199
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14199:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14200
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14200:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14201:
	jmp LB_14139
LB_14196:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_14204
LB_14203:
	add r14,1
LB_14204:
	cmp r14,r10
	jge LB_14205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14203
	cmp al,10
	jz LB_14203
	cmp al,32
	jz LB_14203
LB_14205:
	push r10
	call NS_E_13226_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14206
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_14207
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_14207:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_14208
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_14208:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14209
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14209:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14210
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14210:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14211
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14211:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14212
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14212:
	jmp LB_14139
LB_14206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_14152
	btr r12,6
	jmp LB_14153
LB_14152:
	bts r12,6
LB_14153:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_14150
	btr r12,5
	jmp LB_14151
LB_14150:
	bts r12,5
LB_14151:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14148
	btr r12,4
	jmp LB_14149
LB_14148:
	bts r12,4
LB_14149:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14146
	btr r12,3
	jmp LB_14147
LB_14146:
	bts r12,3
LB_14147:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14144
	btr r12,2
	jmp LB_14145
LB_14144:
	bts r12,2
LB_14145:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14142
	btr r12,1
	jmp LB_14143
LB_14142:
	bts r12,1
LB_14143:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14140
	btr r12,0
	jmp LB_14141
LB_14140:
	bts r12,0
LB_14141:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_14136
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_14214
	btr r12,7
	jmp LB_14215
LB_14214:
	bts r12,7
LB_14215:
	mov r10,rcx
	bt r12,6
	jc LB_14216
	btr r12,4
	jmp LB_14217
LB_14216:
	bts r12,4
LB_14217:
	mov rcx,r9
	bt r12,3
	jc LB_14218
	btr r12,6
	jmp LB_14219
LB_14218:
	bts r12,6
LB_14219:
	mov r9,r11
	bt r12,5
	jc LB_14220
	btr r12,3
	jmp LB_14221
LB_14220:
	bts r12,3
LB_14221:
	mov r11,r8
	bt r12,2
	jc LB_14222
	btr r12,5
	jmp LB_14223
LB_14222:
	bts r12,5
LB_14223:
	mov r8,rcx
	bt r12,6
	jc LB_14224
	btr r12,2
	jmp LB_14225
LB_14224:
	bts r12,2
LB_14225:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_13323 %_13324 } %_13325 } ⊢ %_13326 : %_13326
 ; {>  %_13322~1':_p13223 %_13324~3':_p10000 %_13321~0':_stg %_13323~2':_stg %_13325~4':(_lst)◂({ _stg _p10000 }) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f10021 %_13326 ⊢ %_13327 : %_13327
 ; {>  %_13326~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p10000 }) %_13322~1':_p13223 %_13321~0':_stg }
; _f10021 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_13321 %_13327 } ⊢ %_13328 : %_13328
 ; {>  %_13327~°0◂°0◂{ { 2' 3' } 4' }:_p9986 %_13322~1':_p13223 %_13321~0':_stg }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_13328
 ; {>  %_13322~1':_p13223 %_13328~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p9986 }) }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_14109
	mov rdi,r14
	call dlt
LB_14109:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_14110
	btr r12,1
	jmp LB_14111
LB_14110:
	bts r12,1
LB_14111:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_14114
	btr r12,5
	jmp LB_14115
LB_14114:
	bts r12,5
LB_14115:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14112
	btr QWORD [rdi],0
	jmp LB_14113
LB_14112:
	bts QWORD [rdi],0
LB_14113:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_14126
	btr r12,6
	jmp LB_14127
LB_14126:
	bts r12,6
LB_14127:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_14124
	btr QWORD [rdi],0
	jmp LB_14125
LB_14124:
	bts QWORD [rdi],0
LB_14125:
	mov rcx,r14
	bt r12,1
	jc LB_14130
	btr r12,6
	jmp LB_14131
LB_14130:
	bts r12,6
LB_14131:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_14128
	btr QWORD [rdi],1
	jmp LB_14129
LB_14128:
	bts QWORD [rdi],1
LB_14129:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_14122
	btr QWORD [rdi],0
	jmp LB_14123
LB_14122:
	bts QWORD [rdi],0
LB_14123:
	mov r13,r10
	bt r12,4
	jc LB_14134
	btr r12,0
	jmp LB_14135
LB_14134:
	bts r12,0
LB_14135:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_14132
	btr QWORD [rdi],1
	jmp LB_14133
LB_14132:
	bts QWORD [rdi],1
LB_14133:
	mov rsi,1
	bt r12,5
	jc LB_14120
	mov rsi,0
	bt r11,0
	jc LB_14120
	jmp LB_14121
LB_14120:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_14121:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_14118
	mov rsi,0
	bt r11,0
	jc LB_14118
	jmp LB_14119
LB_14118:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_14119:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14116
	btr QWORD [rdi],1
	jmp LB_14117
LB_14116:
	bts QWORD [rdi],1
LB_14117:
	mov r8,0
	bts r12,2
	ret
LB_14136:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14138
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14137
LB_14138:
	add rsp,8
	ret
LB_14139:
	add rsp,112
	pop r14
LB_14137:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13224:
NS_E_RDI_13224:
NS_E_13224_ETR_TBL:
NS_E_13224_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_14240
LB_14239:
	add r14,1
LB_14240:
	cmp r14,r10
	jge LB_14241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14239
	cmp al,10
	jz LB_14239
	cmp al,32
	jz LB_14239
LB_14241:
	add r14,3
	cmp r14,r10
	jg LB_14244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_14244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_14244
	jmp LB_14245
LB_14244:
	jmp LB_14226
LB_14245:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_14234
LB_14233:
	add r14,1
LB_14234:
	cmp r14,r10
	jge LB_14235
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14233
	cmp al,10
	jz LB_14233
	cmp al,32
	jz LB_14233
LB_14235:
	push r10
	call NS_E_12905_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14236
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14237
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14237:
	jmp LB_14227
LB_14236:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14230
	btr QWORD [rdi],1
LB_14230:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14231
	btr QWORD [rdi],0
LB_14231:
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
LB_14227:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14226:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_14228:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13225:
NS_E_RDI_13225:
NS_E_13225_ETR_TBL:
NS_E_13225_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_14299
LB_14298:
	add r14,1
LB_14299:
	cmp r14,r10
	jge LB_14300
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14298
	cmp al,10
	jz LB_14298
	cmp al,32
	jz LB_14298
LB_14300:
	add r14,1
	cmp r14,r10
	jg LB_14303
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_14303
	jmp LB_14304
LB_14303:
	jmp LB_14265
LB_14304:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_14276
LB_14275:
	add r14,1
LB_14276:
	cmp r14,r10
	jge LB_14277
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14275
	cmp al,10
	jz LB_14275
	cmp al,32
	jz LB_14275
LB_14277:
	add r14,1
	cmp r14,r10
	jg LB_14281
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_14281
	jmp LB_14282
LB_14281:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14279
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14279:
	jmp LB_14266
LB_14282:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_14284
LB_14283:
	add r14,1
LB_14284:
	cmp r14,r10
	jge LB_14285
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14283
	cmp al,10
	jz LB_14283
	cmp al,32
	jz LB_14283
LB_14285:
	push r10
	call NS_E_13222_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14286
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14287
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14287:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14288
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14288:
	jmp LB_14266
LB_14286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_14291
LB_14290:
	add r14,1
LB_14291:
	cmp r14,r10
	jge LB_14292
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14290
	cmp al,10
	jz LB_14290
	cmp al,32
	jz LB_14290
LB_14292:
	push r10
	call NS_E_13225_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14293
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14294
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14294:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14295
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14295:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14296
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14296:
	jmp LB_14266
LB_14293:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14273
	btr r12,3
	jmp LB_14274
LB_14273:
	bts r12,3
LB_14274:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14271
	btr r12,2
	jmp LB_14272
LB_14271:
	bts r12,2
LB_14272:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14269
	btr r12,1
	jmp LB_14270
LB_14269:
	bts r12,1
LB_14270:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14267
	btr r12,0
	jmp LB_14268
LB_14267:
	bts r12,0
LB_14268:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_14262
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_14305
	btr r12,4
	jmp LB_14306
LB_14305:
	bts r12,4
LB_14306:
	mov r8,r9
	bt r12,3
	jc LB_14307
	btr r12,2
	jmp LB_14308
LB_14307:
	bts r12,2
LB_14308:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_14311
	btr r12,3
	jmp LB_14312
LB_14311:
	bts r12,3
LB_14312:
	mov r13,r9
	bt r12,3
	jc LB_14309
	btr r12,0
	jmp LB_14310
LB_14309:
	bts r12,0
LB_14310:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_14315
	btr r12,3
	jmp LB_14316
LB_14315:
	bts r12,3
LB_14316:
	mov r14,r9
	bt r12,3
	jc LB_14313
	btr r12,1
	jmp LB_14314
LB_14313:
	bts r12,1
LB_14314:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_13331 %_13332 } ⊢ %_13333 : %_13333
 ; {>  %_13332~2':(_lst)◂({ _stg _p9986 }) %_13331~{ 0' 1' }:{ _stg _p9986 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_13333 ⊢ %_13334 : %_13334
 ; {>  %_13333~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p9986 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_13334
 ; {>  %_13334~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p9986 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_14252
	btr r12,5
	jmp LB_14253
LB_14252:
	bts r12,5
LB_14253:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14250
	btr QWORD [rdi],0
	jmp LB_14251
LB_14250:
	bts QWORD [rdi],0
LB_14251:
	mov r11,r14
	bt r12,1
	jc LB_14256
	btr r12,5
	jmp LB_14257
LB_14256:
	bts r12,5
LB_14257:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14254
	btr QWORD [rdi],1
	jmp LB_14255
LB_14254:
	bts QWORD [rdi],1
LB_14255:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14248
	btr QWORD [rdi],0
	jmp LB_14249
LB_14248:
	bts QWORD [rdi],0
LB_14249:
	mov r10,r8
	bt r12,2
	jc LB_14260
	btr r12,4
	jmp LB_14261
LB_14260:
	bts r12,4
LB_14261:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14258
	btr QWORD [rdi],1
	jmp LB_14259
LB_14258:
	bts QWORD [rdi],1
LB_14259:
	mov rsi,1
	bt r12,3
	jc LB_14246
	mov rsi,0
	bt r9,0
	jc LB_14246
	jmp LB_14247
LB_14246:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14247:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14262:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14264
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14263
LB_14264:
	add rsp,8
	ret
LB_14266:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14265:
	add rsp,64
	pop r14
LB_14263:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14319
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13335 : %_13335
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13335 ⊢ %_13336 : %_13336
 ; {>  %_13335~°1◂{  }:(_lst)◂(t5099'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13336
 ; {>  %_13336~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5102'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_14317
	mov rsi,0
	bt r9,0
	jc LB_14317
	jmp LB_14318
LB_14317:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14318:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14319:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14321
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14320
LB_14321:
	add rsp,8
	ret
LB_14322:
	add rsp,0
	pop r14
LB_14320:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13226:
NS_E_RDI_13226:
NS_E_13226_ETR_TBL:
NS_E_13226_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_14387
LB_14386:
	add r14,1
LB_14387:
	cmp r14,r10
	jge LB_14388
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14386
	cmp al,10
	jz LB_14386
	cmp al,32
	jz LB_14386
LB_14388:
	add r14,3
	cmp r14,r10
	jg LB_14391
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14391
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_14391
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_14391
	jmp LB_14392
LB_14391:
	jmp LB_14342
LB_14392:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_14355
LB_14354:
	add r14,1
LB_14355:
	cmp r14,r10
	jge LB_14356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14354
	cmp al,10
	jz LB_14354
	cmp al,32
	jz LB_14354
LB_14356:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14357
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14358:
	jmp LB_14343
LB_14357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_14361
LB_14360:
	add r14,1
LB_14361:
	cmp r14,r10
	jge LB_14362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14360
	cmp al,10
	jz LB_14360
	cmp al,32
	jz LB_14360
LB_14362:
	add r14,1
	cmp r14,r10
	jg LB_14367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_14367
	jmp LB_14368
LB_14367:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14364
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14364:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14365
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14365:
	jmp LB_14343
LB_14368:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_14370
LB_14369:
	add r14,1
LB_14370:
	cmp r14,r10
	jge LB_14371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14369
	cmp al,10
	jz LB_14369
	cmp al,32
	jz LB_14369
LB_14371:
	push r10
	call NS_E_12901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14372
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14373
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14373:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14374
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14374:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14375
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14375:
	jmp LB_14343
LB_14372:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_14378
LB_14377:
	add r14,1
LB_14378:
	cmp r14,r10
	jge LB_14379
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14377
	cmp al,10
	jz LB_14377
	cmp al,32
	jz LB_14377
LB_14379:
	push r10
	call NS_E_13226_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14380
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14381
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14381:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14382
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14382:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14383
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14383:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14384
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14384:
	jmp LB_14343
LB_14380:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14352
	btr r12,4
	jmp LB_14353
LB_14352:
	bts r12,4
LB_14353:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14350
	btr r12,3
	jmp LB_14351
LB_14350:
	bts r12,3
LB_14351:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14348
	btr r12,2
	jmp LB_14349
LB_14348:
	bts r12,2
LB_14349:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14346
	btr r12,1
	jmp LB_14347
LB_14346:
	bts r12,1
LB_14347:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14344
	btr r12,0
	jmp LB_14345
LB_14344:
	bts r12,0
LB_14345:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_14339
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_14393
	btr r12,5
	jmp LB_14394
LB_14393:
	bts r12,5
LB_14394:
	mov r8,r10
	bt r12,4
	jc LB_14395
	btr r12,2
	jmp LB_14396
LB_14395:
	bts r12,2
LB_14396:
	mov r10,r14
	bt r12,1
	jc LB_14397
	btr r12,4
	jmp LB_14398
LB_14397:
	bts r12,4
LB_14398:
	mov r14,r9
	bt r12,3
	jc LB_14399
	btr r12,1
	jmp LB_14400
LB_14399:
	bts r12,1
LB_14400:
	mov r9,r13
	bt r12,0
	jc LB_14401
	btr r12,3
	jmp LB_14402
LB_14401:
	bts r12,3
LB_14402:
	mov r13,r10
	bt r12,4
	jc LB_14403
	btr r12,0
	jmp LB_14404
LB_14403:
	bts r12,0
LB_14404:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_13337 %_13338 } %_13339 } ⊢ %_13340 : %_13340
 ; {>  %_13337~0':_stg %_13338~1':_p10000 %_13339~2':(_lst)◂({ _stg _p10000 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_13340 ⊢ %_13341 : %_13341
 ; {>  %_13340~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p10000 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_13341
 ; {>  %_13341~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p10000 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_14329
	btr r12,5
	jmp LB_14330
LB_14329:
	bts r12,5
LB_14330:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14327
	btr QWORD [rdi],0
	jmp LB_14328
LB_14327:
	bts QWORD [rdi],0
LB_14328:
	mov r11,r14
	bt r12,1
	jc LB_14333
	btr r12,5
	jmp LB_14334
LB_14333:
	bts r12,5
LB_14334:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14331
	btr QWORD [rdi],1
	jmp LB_14332
LB_14331:
	bts QWORD [rdi],1
LB_14332:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14325
	btr QWORD [rdi],0
	jmp LB_14326
LB_14325:
	bts QWORD [rdi],0
LB_14326:
	mov r10,r8
	bt r12,2
	jc LB_14337
	btr r12,4
	jmp LB_14338
LB_14337:
	bts r12,4
LB_14338:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14335
	btr QWORD [rdi],1
	jmp LB_14336
LB_14335:
	bts QWORD [rdi],1
LB_14336:
	mov rsi,1
	bt r12,3
	jc LB_14323
	mov rsi,0
	bt r9,0
	jc LB_14323
	jmp LB_14324
LB_14323:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14324:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14339:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14341
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14340
LB_14341:
	add rsp,8
	ret
LB_14343:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14342:
	add rsp,80
	pop r14
LB_14340:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14407
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13342 : %_13342
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13342 ⊢ %_13343 : %_13343
 ; {>  %_13342~°1◂{  }:(_lst)◂(t5113'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13343
 ; {>  %_13343~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5116'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_14405
	mov rsi,0
	bt r9,0
	jc LB_14405
	jmp LB_14406
LB_14405:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14406:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14407:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14409
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14408
LB_14409:
	add rsp,8
	ret
LB_14410:
	add rsp,0
	pop r14
LB_14408:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13227:
NS_E_RDI_13227:
NS_E_13227_ETR_TBL:
NS_E_13227_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_14501
LB_14500:
	add r14,1
LB_14501:
	cmp r14,r10
	jge LB_14502
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14500
	cmp al,10
	jz LB_14500
	cmp al,32
	jz LB_14500
LB_14502:
	add r14,1
	cmp r14,r10
	jg LB_14505
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_14505
	jmp LB_14506
LB_14505:
	jmp LB_14448
LB_14506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_14463
LB_14462:
	add r14,1
LB_14463:
	cmp r14,r10
	jge LB_14464
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14462
	cmp al,10
	jz LB_14462
	cmp al,32
	jz LB_14462
LB_14464:
	add r14,1
	cmp r14,r10
	jg LB_14468
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_14468
	jmp LB_14469
LB_14468:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14466
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14466:
	jmp LB_14449
LB_14469:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_14471
LB_14470:
	add r14,1
LB_14471:
	cmp r14,r10
	jge LB_14472
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14470
	cmp al,10
	jz LB_14470
	cmp al,32
	jz LB_14470
LB_14472:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14473
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14474
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14474:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14475
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14475:
	jmp LB_14449
LB_14473:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_14478
LB_14477:
	add r14,1
LB_14478:
	cmp r14,r10
	jge LB_14479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14477
	cmp al,10
	jz LB_14477
	cmp al,32
	jz LB_14477
LB_14479:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14480
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14481
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14481:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14482
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14482:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14483
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14483:
	jmp LB_14449
LB_14480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_14486
LB_14485:
	add r14,1
LB_14486:
	cmp r14,r10
	jge LB_14487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14485
	cmp al,10
	jz LB_14485
	cmp al,32
	jz LB_14485
LB_14487:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14488
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14489
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14489:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14490
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14490:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14491
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14491:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14492
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14492:
	jmp LB_14449
LB_14488:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_14498:
	jmp LB_14495
LB_14494:
	add r14,1
LB_14495:
	cmp r14,r10
	jge LB_14496
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14494
	cmp al,10
	jz LB_14494
	cmp al,32
	jz LB_14494
LB_14496:
	push r10
	push rsi
	call NS_E_13228_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_14497
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_14499
	bts QWORD [rax],0
LB_14499:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_14498
LB_14497:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_14460
	btr r12,5
	jmp LB_14461
LB_14460:
	bts r12,5
LB_14461:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14458
	btr r12,4
	jmp LB_14459
LB_14458:
	bts r12,4
LB_14459:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14456
	btr r12,3
	jmp LB_14457
LB_14456:
	bts r12,3
LB_14457:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14454
	btr r12,2
	jmp LB_14455
LB_14454:
	bts r12,2
LB_14455:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14452
	btr r12,1
	jmp LB_14453
LB_14452:
	bts r12,1
LB_14453:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14450
	btr r12,0
	jmp LB_14451
LB_14450:
	bts r12,0
LB_14451:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_14445
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_14507
	btr r12,6
	jmp LB_14508
LB_14507:
	bts r12,6
LB_14508:
	mov r9,r11
	bt r12,5
	jc LB_14509
	btr r12,3
	jmp LB_14510
LB_14509:
	bts r12,3
LB_14510:
	mov r11,r8
	bt r12,2
	jc LB_14511
	btr r12,5
	jmp LB_14512
LB_14511:
	bts r12,5
LB_14512:
	mov r8,r10
	bt r12,4
	jc LB_14513
	btr r12,2
	jmp LB_14514
LB_14513:
	bts r12,2
LB_14514:
	mov r10,r14
	bt r12,1
	jc LB_14515
	btr r12,4
	jmp LB_14516
LB_14515:
	bts r12,4
LB_14516:
	mov r14,rcx
	bt r12,6
	jc LB_14517
	btr r12,1
	jmp LB_14518
LB_14517:
	bts r12,1
LB_14518:
	mov rcx,r13
	bt r12,0
	jc LB_14519
	btr r12,6
	jmp LB_14520
LB_14519:
	bts r12,6
LB_14520:
	mov r13,r11
	bt r12,5
	jc LB_14521
	btr r12,0
	jmp LB_14522
LB_14521:
	bts r12,0
LB_14522:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9309 %_13347 ⊢ %_13348 : %_13348
 ; {>  %_13345~1':_p9999 %_13346~2':_p10002 %_13347~3':(_lst)◂({ _stg _p9999 _p10002 }) %_13344~0':_stg }
; _f9309 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_14417
	btr r12,0
	jmp LB_14418
LB_14417:
	bts r12,0
LB_14418:
	call NS_E_9309
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_14419
	btr r12,3
	jmp LB_14420
LB_14419:
	bts r12,3
LB_14420:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_14415
	btr r12,2
	jmp LB_14416
LB_14415:
	bts r12,2
LB_14416:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_14413
	btr r12,1
	jmp LB_14414
LB_14413:
	bts r12,1
LB_14414:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_14411
	btr r12,0
	jmp LB_14412
LB_14411:
	bts r12,0
LB_14412:
	add rsp,32
; _cns { { %_13344 %_13345 %_13346 } %_13348 } ⊢ %_13349 : %_13349
 ; {>  %_13348~3':(_lst)◂({ _stg _p9999 _p10002 }) %_13345~1':_p9999 %_13346~2':_p10002 %_13344~0':_stg }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f10013 %_13349 ⊢ %_13350 : %_13350
 ; {>  %_13349~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg _p9999 _p10002 }) }
; _f10013 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_13350 ⊢ %_13351 : %_13351
 ; {>  %_13350~°3◂°0◂{ { 0' 1' 2' } 3' }:_p9983 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_13351
 ; {>  %_13351~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p9983) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_14421
	btr r12,4
	jmp LB_14422
LB_14421:
	bts r12,4
LB_14422:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_14431
	btr r12,6
	jmp LB_14432
LB_14431:
	bts r12,6
LB_14432:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_14429
	btr QWORD [rdi],0
	jmp LB_14430
LB_14429:
	bts QWORD [rdi],0
LB_14430:
	mov rcx,r14
	bt r12,1
	jc LB_14435
	btr r12,6
	jmp LB_14436
LB_14435:
	bts r12,6
LB_14436:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_14433
	btr QWORD [rdi],1
	jmp LB_14434
LB_14433:
	bts QWORD [rdi],1
LB_14434:
	mov rcx,r8
	bt r12,2
	jc LB_14439
	btr r12,6
	jmp LB_14440
LB_14439:
	bts r12,6
LB_14440:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_14437
	btr QWORD [rdi],2
	jmp LB_14438
LB_14437:
	bts QWORD [rdi],2
LB_14438:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14427
	btr QWORD [rdi],0
	jmp LB_14428
LB_14427:
	bts QWORD [rdi],0
LB_14428:
	mov r11,r10
	bt r12,4
	jc LB_14443
	btr r12,5
	jmp LB_14444
LB_14443:
	bts r12,5
LB_14444:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14441
	btr QWORD [rdi],1
	jmp LB_14442
LB_14441:
	bts QWORD [rdi],1
LB_14442:
	mov rsi,1
	bt r12,3
	jc LB_14425
	mov rsi,0
	bt r9,0
	jc LB_14425
	jmp LB_14426
LB_14425:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14426:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_14423
	mov rsi,0
	bt r9,0
	jc LB_14423
	jmp LB_14424
LB_14423:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14424:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14445:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14447
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14446
LB_14447:
	add rsp,8
	ret
LB_14449:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14448:
	add rsp,96
	pop r14
LB_14446:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_14542
LB_14541:
	add r14,1
LB_14542:
	cmp r14,r10
	jge LB_14543
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14541
	cmp al,10
	jz LB_14541
	cmp al,32
	jz LB_14541
LB_14543:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14544
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14536
LB_14544:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_14547
LB_14546:
	add r14,1
LB_14547:
	cmp r14,r10
	jge LB_14548
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14546
	cmp al,10
	jz LB_14546
	cmp al,32
	jz LB_14546
LB_14548:
	push r10
	call NS_E_13229_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14549
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14550
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14550:
	jmp LB_14536
LB_14549:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14539
	btr r12,1
	jmp LB_14540
LB_14539:
	bts r12,1
LB_14540:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14537
	btr r12,0
	jmp LB_14538
LB_14537:
	bts r12,0
LB_14538:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14533
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10012 { %_13352 %_13353 } ⊢ %_13354 : %_13354
 ; {>  %_13352~0':_stg %_13353~1':_p9985 }
; _f10012 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_13354 ⊢ %_13355 : %_13355
 ; {>  %_13354~°2◂{ 0' 1' }:_p9983 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_13355
 ; {>  %_13355~°0◂°2◂{ 0' 1' }:(_opn)◂(_p9983) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_14527
	btr r12,2
	jmp LB_14528
LB_14527:
	bts r12,2
LB_14528:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14525
	btr QWORD [rdi],0
	jmp LB_14526
LB_14525:
	bts QWORD [rdi],0
LB_14526:
	mov r8,r14
	bt r12,1
	jc LB_14531
	btr r12,2
	jmp LB_14532
LB_14531:
	bts r12,2
LB_14532:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14529
	btr QWORD [rdi],1
	jmp LB_14530
LB_14529:
	bts QWORD [rdi],1
LB_14530:
	mov rsi,1
	bt r12,3
	jc LB_14523
	mov rsi,0
	bt r9,0
	jc LB_14523
	jmp LB_14524
LB_14523:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14524:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14533:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14535
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14534
LB_14535:
	add rsp,8
	ret
LB_14536:
	add rsp,32
	pop r14
LB_14534:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14553
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_13356
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_13356 ⊢ %_13357 : %_13357
 ; {>  %_13356~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_13358 : %_13358
 ; {>  %_13357~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_13358
 ; {>  %_13358~°1◂{  }:(_opn)◂(t5139'(0)) %_13357~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14552
	mov rdi,r13
	call dlt
LB_14552:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_14553:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14555
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14554
LB_14555:
	add rsp,8
	ret
LB_14556:
	add rsp,0
	pop r14
LB_14554:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13228:
NS_E_RDI_13228:
NS_E_13228_ETR_TBL:
NS_E_13228_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_14584
LB_14583:
	add r14,1
LB_14584:
	cmp r14,r10
	jge LB_14585
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14583
	cmp al,10
	jz LB_14583
	cmp al,32
	jz LB_14583
LB_14585:
	add r14,1
	cmp r14,r10
	jg LB_14588
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_14588
	jmp LB_14589
LB_14588:
	jmp LB_14572
LB_14589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_14591
LB_14590:
	add r14,1
LB_14591:
	cmp r14,r10
	jge LB_14592
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14590
	cmp al,10
	jz LB_14590
	cmp al,32
	jz LB_14590
LB_14592:
	add r14,1
	cmp r14,r10
	jg LB_14596
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_14596
	jmp LB_14597
LB_14596:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14594
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14594:
	jmp LB_14572
LB_14597:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_14599
LB_14598:
	add r14,1
LB_14599:
	cmp r14,r10
	jge LB_14600
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14598
	cmp al,10
	jz LB_14598
	cmp al,32
	jz LB_14598
LB_14600:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14601
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14602
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14602:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14603
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14603:
	jmp LB_14572
LB_14601:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_14606
LB_14605:
	add r14,1
LB_14606:
	cmp r14,r10
	jge LB_14607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14605
	cmp al,10
	jz LB_14605
	cmp al,32
	jz LB_14605
LB_14607:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14608
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14609
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14609:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14610
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14610:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14611
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14611:
	jmp LB_14572
LB_14608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_14614
LB_14613:
	add r14,1
LB_14614:
	cmp r14,r10
	jge LB_14615
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14613
	cmp al,10
	jz LB_14613
	cmp al,32
	jz LB_14613
LB_14615:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14616
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14617
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14617:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14618
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14618:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14619
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14619:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14620
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14620:
	jmp LB_14572
LB_14616:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14581
	btr r12,4
	jmp LB_14582
LB_14581:
	bts r12,4
LB_14582:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14579
	btr r12,3
	jmp LB_14580
LB_14579:
	bts r12,3
LB_14580:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14577
	btr r12,2
	jmp LB_14578
LB_14577:
	bts r12,2
LB_14578:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14575
	btr r12,1
	jmp LB_14576
LB_14575:
	bts r12,1
LB_14576:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14573
	btr r12,0
	jmp LB_14574
LB_14573:
	bts r12,0
LB_14574:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_14569
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_14622
	btr r12,5
	jmp LB_14623
LB_14622:
	bts r12,5
LB_14623:
	mov r8,r10
	bt r12,4
	jc LB_14624
	btr r12,2
	jmp LB_14625
LB_14624:
	bts r12,2
LB_14625:
	mov r10,r14
	bt r12,1
	jc LB_14626
	btr r12,4
	jmp LB_14627
LB_14626:
	bts r12,4
LB_14627:
	mov r14,r9
	bt r12,3
	jc LB_14628
	btr r12,1
	jmp LB_14629
LB_14628:
	bts r12,1
LB_14629:
	mov r9,r13
	bt r12,0
	jc LB_14630
	btr r12,3
	jmp LB_14631
LB_14630:
	bts r12,3
LB_14631:
	mov r13,r11
	bt r12,5
	jc LB_14632
	btr r12,0
	jmp LB_14633
LB_14632:
	bts r12,0
LB_14633:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_13359 %_13360 %_13361 } ⊢ %_13362 : %_13362
 ; {>  %_13360~1':_p9999 %_13361~2':_p10002 %_13359~0':_stg }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_13362
 ; {>  %_13362~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg _p9999 _p10002 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_14559
	btr r12,4
	jmp LB_14560
LB_14559:
	bts r12,4
LB_14560:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14557
	btr QWORD [rdi],0
	jmp LB_14558
LB_14557:
	bts QWORD [rdi],0
LB_14558:
	mov r10,r14
	bt r12,1
	jc LB_14563
	btr r12,4
	jmp LB_14564
LB_14563:
	bts r12,4
LB_14564:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14561
	btr QWORD [rdi],1
	jmp LB_14562
LB_14561:
	bts QWORD [rdi],1
LB_14562:
	mov r10,r8
	bt r12,2
	jc LB_14567
	btr r12,4
	jmp LB_14568
LB_14567:
	bts r12,4
LB_14568:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_14565
	btr QWORD [rdi],2
	jmp LB_14566
LB_14565:
	bts QWORD [rdi],2
LB_14566:
	mov r8,0
	bts r12,2
	ret
LB_14569:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14571
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14570
LB_14571:
	add rsp,8
	ret
LB_14572:
	add rsp,80
	pop r14
LB_14570:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13229:
NS_E_RDI_13229:
NS_E_13229_ETR_TBL:
NS_E_13229_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_14654
LB_14653:
	add r14,1
LB_14654:
	cmp r14,r10
	jge LB_14655
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14653
	cmp al,10
	jz LB_14653
	cmp al,32
	jz LB_14653
LB_14655:
	add r14,1
	cmp r14,r10
	jg LB_14658
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_14658
	jmp LB_14659
LB_14658:
	jmp LB_14641
LB_14659:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_14648
LB_14647:
	add r14,1
LB_14648:
	cmp r14,r10
	jge LB_14649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14647
	cmp al,10
	jz LB_14647
	cmp al,32
	jz LB_14647
LB_14649:
	push r10
	call NS_E_12238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14650
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14651
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14651:
	jmp LB_14642
LB_14650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14645
	btr r12,1
	jmp LB_14646
LB_14645:
	bts r12,1
LB_14646:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14643
	btr r12,0
	jmp LB_14644
LB_14643:
	bts r12,0
LB_14644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14638
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14660
	btr r12,2
	jmp LB_14661
LB_14660:
	bts r12,2
LB_14661:
	mov r13,r14
	bt r12,1
	jc LB_14662
	btr r12,0
	jmp LB_14663
LB_14662:
	bts r12,0
LB_14663:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10019 %_13363 ⊢ %_13364 : %_13364
 ; {>  %_13363~0':_p10001 }
; _f10019 0' ⊢ °1◂0'
; _some %_13364 ⊢ %_13365 : %_13365
 ; {>  %_13364~°1◂0':_p9985 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13365
 ; {>  %_13365~°0◂°1◂0':(_opn)◂(_p9985) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14636
	btr r12,3
	jmp LB_14637
LB_14636:
	bts r12,3
LB_14637:
	mov rsi,1
	bt r12,3
	jc LB_14634
	mov rsi,0
	bt r9,0
	jc LB_14634
	jmp LB_14635
LB_14634:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14635:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14638:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14640
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14639
LB_14640:
	add rsp,8
	ret
LB_14642:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14641:
	add rsp,32
	pop r14
LB_14639:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_14684
LB_14683:
	add r14,1
LB_14684:
	cmp r14,r10
	jge LB_14685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14683
	cmp al,10
	jz LB_14683
	cmp al,32
	jz LB_14683
LB_14685:
	add r14,2
	cmp r14,r10
	jg LB_14688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_14688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_14688
	jmp LB_14689
LB_14688:
	jmp LB_14671
LB_14689:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_14678
LB_14677:
	add r14,1
LB_14678:
	cmp r14,r10
	jge LB_14679
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14677
	cmp al,10
	jz LB_14677
	cmp al,32
	jz LB_14677
LB_14679:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14680
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14681
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14681:
	jmp LB_14672
LB_14680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14675
	btr r12,1
	jmp LB_14676
LB_14675:
	bts r12,1
LB_14676:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14673
	btr r12,0
	jmp LB_14674
LB_14673:
	bts r12,0
LB_14674:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14668
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14690
	btr r12,2
	jmp LB_14691
LB_14690:
	bts r12,2
LB_14691:
	mov r13,r14
	bt r12,1
	jc LB_14692
	btr r12,0
	jmp LB_14693
LB_14692:
	bts r12,0
LB_14693:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10020 %_13366 ⊢ %_13367 : %_13367
 ; {>  %_13366~0':_p10002 }
; _f10020 0' ⊢ °2◂0'
; _some %_13367 ⊢ %_13368 : %_13368
 ; {>  %_13367~°2◂0':_p9985 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_13368
 ; {>  %_13368~°0◂°2◂0':(_opn)◂(_p9985) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14666
	btr r12,3
	jmp LB_14667
LB_14666:
	bts r12,3
LB_14667:
	mov rsi,1
	bt r12,3
	jc LB_14664
	mov rsi,0
	bt r9,0
	jc LB_14664
	jmp LB_14665
LB_14664:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14665:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14668:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14670
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14669
LB_14670:
	add rsp,8
	ret
LB_14672:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14671:
	add rsp,32
	pop r14
LB_14669:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_14713
LB_14712:
	add r14,1
LB_14713:
	cmp r14,r10
	jge LB_14714
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14712
	cmp al,10
	jz LB_14712
	cmp al,32
	jz LB_14712
LB_14714:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14715
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14707
LB_14715:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_14718
LB_14717:
	add r14,1
LB_14718:
	cmp r14,r10
	jge LB_14719
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14717
	cmp al,10
	jz LB_14717
	cmp al,32
	jz LB_14717
LB_14719:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14720
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14721
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14721:
	jmp LB_14707
LB_14720:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14710
	btr r12,1
	jmp LB_14711
LB_14710:
	bts r12,1
LB_14711:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14708
	btr r12,0
	jmp LB_14709
LB_14708:
	bts r12,0
LB_14709:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14704
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10018 { %_13369 %_13370 } ⊢ %_13371 : %_13371
 ; {>  %_13369~0':_p9999 %_13370~1':_p10002 }
; _f10018 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13371 ⊢ %_13372 : %_13372
 ; {>  %_13371~°0◂{ 0' 1' }:_p9985 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13372
 ; {>  %_13372~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9985) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_14698
	btr r12,2
	jmp LB_14699
LB_14698:
	bts r12,2
LB_14699:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14696
	btr QWORD [rdi],0
	jmp LB_14697
LB_14696:
	bts QWORD [rdi],0
LB_14697:
	mov r8,r14
	bt r12,1
	jc LB_14702
	btr r12,2
	jmp LB_14703
LB_14702:
	bts r12,2
LB_14703:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14700
	btr QWORD [rdi],1
	jmp LB_14701
LB_14700:
	bts QWORD [rdi],1
LB_14701:
	mov rsi,1
	bt r12,3
	jc LB_14694
	mov rsi,0
	bt r9,0
	jc LB_14694
	jmp LB_14695
LB_14694:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14695:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14704:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14706
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14705
LB_14706:
	add rsp,8
	ret
LB_14707:
	add rsp,32
	pop r14
LB_14705:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13230:
NS_E_RDI_13230:
NS_E_13230_ETR_TBL:
NS_E_13230_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_14743
LB_14742:
	add r14,1
LB_14743:
	cmp r14,r10
	jge LB_14744
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14742
	cmp al,10
	jz LB_14742
	cmp al,32
	jz LB_14742
LB_14744:
	add r14,3
	cmp r14,r10
	jg LB_14747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_14747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_14747
	jmp LB_14748
LB_14747:
	jmp LB_14730
LB_14748:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_14737
LB_14736:
	add r14,1
LB_14737:
	cmp r14,r10
	jge LB_14738
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14736
	cmp al,10
	jz LB_14736
	cmp al,32
	jz LB_14736
LB_14738:
	push r10
	call NS_E_12367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14739
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14740:
	jmp LB_14731
LB_14739:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14734
	btr r12,1
	jmp LB_14735
LB_14734:
	bts r12,1
LB_14735:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14732
	btr r12,0
	jmp LB_14733
LB_14732:
	bts r12,0
LB_14733:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14727
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14749
	btr r12,2
	jmp LB_14750
LB_14749:
	bts r12,2
LB_14750:
	mov r13,r14
	bt r12,1
	jc LB_14751
	btr r12,0
	jmp LB_14752
LB_14751:
	bts r12,0
LB_14752:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10061 %_13373 ⊢ %_13374 : %_13374
 ; {>  %_13373~0':_p9998 }
; _f10061 0' ⊢ °2◂0'
; _some %_13374 ⊢ %_13375 : %_13375
 ; {>  %_13374~°2◂0':_p10002 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_13375
 ; {>  %_13375~°0◂°2◂0':(_opn)◂(_p10002) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14725
	btr r12,3
	jmp LB_14726
LB_14725:
	bts r12,3
LB_14726:
	mov rsi,1
	bt r12,3
	jc LB_14723
	mov rsi,0
	bt r9,0
	jc LB_14723
	jmp LB_14724
LB_14723:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14724:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14727:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14729
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14728
LB_14729:
	add rsp,8
	ret
LB_14731:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14730:
	add rsp,32
	pop r14
LB_14728:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_14764
LB_14763:
	add r14,1
LB_14764:
	cmp r14,r10
	jge LB_14765
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14763
	cmp al,10
	jz LB_14763
	cmp al,32
	jz LB_14763
LB_14765:
	push r10
	call NS_E_13238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14766
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14760
LB_14766:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14761
	btr r12,0
	jmp LB_14762
LB_14761:
	bts r12,0
LB_14762:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14757
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10060 %_13376 ⊢ %_13377 : %_13377
 ; {>  %_13376~0':_p10003 }
; _f10060 0' ⊢ °1◂0'
; _some %_13377 ⊢ %_13378 : %_13378
 ; {>  %_13377~°1◂0':_p10002 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13378
 ; {>  %_13378~°0◂°1◂0':(_opn)◂(_p10002) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14755
	btr r12,3
	jmp LB_14756
LB_14755:
	bts r12,3
LB_14756:
	mov rsi,1
	bt r12,3
	jc LB_14753
	mov rsi,0
	bt r9,0
	jc LB_14753
	jmp LB_14754
LB_14753:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14754:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14757:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14759
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14758
LB_14759:
	add rsp,8
	ret
LB_14760:
	add rsp,16
	pop r14
LB_14758:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_14799
LB_14798:
	add r14,1
LB_14799:
	cmp r14,r10
	jge LB_14800
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14798
	cmp al,10
	jz LB_14798
	cmp al,32
	jz LB_14798
LB_14800:
	push r10
	call NS_E_13231_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14801
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14793
LB_14801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_14804
LB_14803:
	add r14,1
LB_14804:
	cmp r14,r10
	jge LB_14805
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14803
	cmp al,10
	jz LB_14803
	cmp al,32
	jz LB_14803
LB_14805:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14806
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14807
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14807:
	jmp LB_14793
LB_14806:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14796
	btr r12,1
	jmp LB_14797
LB_14796:
	bts r12,1
LB_14797:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14794
	btr r12,0
	jmp LB_14795
LB_14794:
	bts r12,0
LB_14795:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14790
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_14809
	btr r12,3
	jmp LB_14810
LB_14809:
	bts r12,3
LB_14810:
	mov r10,r13
	bt r12,0
	jc LB_14811
	btr r12,4
	jmp LB_14812
LB_14811:
	bts r12,4
LB_14812:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_14815
	btr r12,5
	jmp LB_14816
LB_14815:
	bts r12,5
LB_14816:
	mov r13,r11
	bt r12,5
	jc LB_14813
	btr r12,0
	jmp LB_14814
LB_14813:
	bts r12,0
LB_14814:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_14819
	btr r12,5
	jmp LB_14820
LB_14819:
	bts r12,5
LB_14820:
	mov r14,r11
	bt r12,5
	jc LB_14817
	btr r12,1
	jmp LB_14818
LB_14817:
	bts r12,1
LB_14818:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_14823
	btr r12,5
	jmp LB_14824
LB_14823:
	bts r12,5
LB_14824:
	mov r8,r11
	bt r12,5
	jc LB_14821
	btr r12,2
	jmp LB_14822
LB_14821:
	bts r12,2
LB_14822:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10059 { %_13379 %_13380 } ⊢ %_13381 : %_13381
 ; {>  %_13379~{ 0' 1' 2' }:{ _p10007 _p9998 _p9999 } %_13380~3':_p10002 }
; _f10059 { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _some %_13381 ⊢ %_13382 : %_13382
 ; {>  %_13381~°0◂{ { 0' 1' 2' } 3' }:_p10002 }
; _some °0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_13382
 ; {>  %_13382~°0◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p10002) }
; 	∎ °0◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_14768
	btr r12,4
	jmp LB_14769
LB_14768:
	bts r12,4
LB_14769:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_14776
	btr r12,6
	jmp LB_14777
LB_14776:
	bts r12,6
LB_14777:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_14774
	btr QWORD [rdi],0
	jmp LB_14775
LB_14774:
	bts QWORD [rdi],0
LB_14775:
	mov rcx,r14
	bt r12,1
	jc LB_14780
	btr r12,6
	jmp LB_14781
LB_14780:
	bts r12,6
LB_14781:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_14778
	btr QWORD [rdi],1
	jmp LB_14779
LB_14778:
	bts QWORD [rdi],1
LB_14779:
	mov rcx,r8
	bt r12,2
	jc LB_14784
	btr r12,6
	jmp LB_14785
LB_14784:
	bts r12,6
LB_14785:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_14782
	btr QWORD [rdi],2
	jmp LB_14783
LB_14782:
	bts QWORD [rdi],2
LB_14783:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14772
	btr QWORD [rdi],0
	jmp LB_14773
LB_14772:
	bts QWORD [rdi],0
LB_14773:
	mov r11,r10
	bt r12,4
	jc LB_14788
	btr r12,5
	jmp LB_14789
LB_14788:
	bts r12,5
LB_14789:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14786
	btr QWORD [rdi],1
	jmp LB_14787
LB_14786:
	bts QWORD [rdi],1
LB_14787:
	mov rsi,1
	bt r12,3
	jc LB_14770
	mov rsi,0
	bt r9,0
	jc LB_14770
	jmp LB_14771
LB_14770:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14771:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14790:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14792
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14791
LB_14792:
	add rsp,8
	ret
LB_14793:
	add rsp,32
	pop r14
LB_14791:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13231:
NS_E_RDI_13231:
NS_E_13231_ETR_TBL:
NS_E_13231_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_14890
LB_14889:
	add r14,1
LB_14890:
	cmp r14,r10
	jge LB_14891
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14889
	cmp al,10
	jz LB_14889
	cmp al,32
	jz LB_14889
LB_14891:
	add r14,1
	cmp r14,r10
	jg LB_14894
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_14894
	jmp LB_14895
LB_14894:
	jmp LB_14845
LB_14895:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_14858
LB_14857:
	add r14,1
LB_14858:
	cmp r14,r10
	jge LB_14859
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14857
	cmp al,10
	jz LB_14857
	cmp al,32
	jz LB_14857
LB_14859:
	push r10
	call NS_E_12367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14860
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14861
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14861:
	jmp LB_14846
LB_14860:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_14864
LB_14863:
	add r14,1
LB_14864:
	cmp r14,r10
	jge LB_14865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14863
	cmp al,10
	jz LB_14863
	cmp al,32
	jz LB_14863
LB_14865:
	add r14,3
	cmp r14,r10
	jg LB_14870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14870
	jmp LB_14871
LB_14870:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14867
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14867:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14868
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14868:
	jmp LB_14846
LB_14871:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_14873
LB_14872:
	add r14,1
LB_14873:
	cmp r14,r10
	jge LB_14874
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14872
	cmp al,10
	jz LB_14872
	cmp al,32
	jz LB_14872
LB_14874:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14875
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14876
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14876:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14877
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14877:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14878
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14878:
	jmp LB_14846
LB_14875:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_14881
LB_14880:
	add r14,1
LB_14881:
	cmp r14,r10
	jge LB_14882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14880
	cmp al,10
	jz LB_14880
	cmp al,32
	jz LB_14880
LB_14882:
	push r10
	call NS_E_12634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14883
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14884
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14884:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14885
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14885:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14886
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14886:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14887
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14887:
	jmp LB_14846
LB_14883:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14855
	btr r12,4
	jmp LB_14856
LB_14855:
	bts r12,4
LB_14856:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14853
	btr r12,3
	jmp LB_14854
LB_14853:
	bts r12,3
LB_14854:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14851
	btr r12,2
	jmp LB_14852
LB_14851:
	bts r12,2
LB_14852:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14849
	btr r12,1
	jmp LB_14850
LB_14849:
	bts r12,1
LB_14850:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14847
	btr r12,0
	jmp LB_14848
LB_14847:
	bts r12,0
LB_14848:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_14842
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_14896
	btr r12,5
	jmp LB_14897
LB_14896:
	bts r12,5
LB_14897:
	mov r8,r10
	bt r12,4
	jc LB_14898
	btr r12,2
	jmp LB_14899
LB_14898:
	bts r12,2
LB_14899:
	mov r10,r14
	bt r12,1
	jc LB_14900
	btr r12,4
	jmp LB_14901
LB_14900:
	bts r12,4
LB_14901:
	mov r14,r9
	bt r12,3
	jc LB_14902
	btr r12,1
	jmp LB_14903
LB_14902:
	bts r12,1
LB_14903:
	mov r9,r13
	bt r12,0
	jc LB_14904
	btr r12,3
	jmp LB_14905
LB_14904:
	bts r12,3
LB_14905:
	mov r13,r10
	bt r12,4
	jc LB_14906
	btr r12,0
	jmp LB_14907
LB_14906:
	bts r12,0
LB_14907:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_13386 : %_13386
 ; {>  %_13383~0':_p9998 %_13385~2':_p12633 %_13384~1':_p9999 }
; 	» 0xr1 _ ⊢ 3' : %_13386
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f10071 %_13386 ⊢ %_13387 : %_13387
 ; {>  %_13383~0':_p9998 %_13386~3':_r64 %_13385~2':_p12633 %_13384~1':_p9999 }
; _f10071 3' ⊢ °1◂3'
; _some { %_13387 %_13383 %_13384 } ⊢ %_13388 : %_13388
 ; {>  %_13383~0':_p9998 %_13385~2':_p12633 %_13387~°1◂3':_p10007 %_13384~1':_p9999 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_13388
 ; {>  %_13388~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p10007 _p9998 _p9999 }) %_13385~2':_p12633 }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_14825
	mov rdi,r8
	call dlt
LB_14825:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_14826
	btr r12,4
	jmp LB_14827
LB_14826:
	bts r12,4
LB_14827:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_14832
	btr r12,2
	jmp LB_14833
LB_14832:
	bts r12,2
LB_14833:
	mov rsi,1
	bt r12,2
	jc LB_14830
	mov rsi,0
	bt r8,0
	jc LB_14830
	jmp LB_14831
LB_14830:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14831:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14828
	btr QWORD [rdi],0
	jmp LB_14829
LB_14828:
	bts QWORD [rdi],0
LB_14829:
	mov r8,r13
	bt r12,0
	jc LB_14836
	btr r12,2
	jmp LB_14837
LB_14836:
	bts r12,2
LB_14837:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14834
	btr QWORD [rdi],1
	jmp LB_14835
LB_14834:
	bts QWORD [rdi],1
LB_14835:
	mov r8,r14
	bt r12,1
	jc LB_14840
	btr r12,2
	jmp LB_14841
LB_14840:
	bts r12,2
LB_14841:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_14838
	btr QWORD [rdi],2
	jmp LB_14839
LB_14838:
	bts QWORD [rdi],2
LB_14839:
	mov r8,0
	bts r12,2
	ret
LB_14842:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14844
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14843
LB_14844:
	add rsp,8
	ret
LB_14846:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14845:
	add rsp,80
	pop r14
LB_14843:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_15000
LB_14999:
	add r14,1
LB_15000:
	cmp r14,r10
	jge LB_15001
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14999
	cmp al,10
	jz LB_14999
	cmp al,32
	jz LB_14999
LB_15001:
	add r14,3
	cmp r14,r10
	jg LB_15004
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15004
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_15004
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_15004
	jmp LB_15005
LB_15004:
	jmp LB_14941
LB_15005:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_14956
LB_14955:
	add r14,1
LB_14956:
	cmp r14,r10
	jge LB_14957
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14955
	cmp al,10
	jz LB_14955
	cmp al,32
	jz LB_14955
LB_14957:
	push r10
	call NS_E_12367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14958
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14959
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14959:
	jmp LB_14942
LB_14958:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_14962
LB_14961:
	add r14,1
LB_14962:
	cmp r14,r10
	jge LB_14963
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14961
	cmp al,10
	jz LB_14961
	cmp al,32
	jz LB_14961
LB_14963:
	add r14,1
	cmp r14,r10
	jg LB_14968
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_14968
	jmp LB_14969
LB_14968:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14965
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14965:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14966
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14966:
	jmp LB_14942
LB_14969:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_14971
LB_14970:
	add r14,1
LB_14971:
	cmp r14,r10
	jge LB_14972
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14970
	cmp al,10
	jz LB_14970
	cmp al,32
	jz LB_14970
LB_14972:
	push r10
	call NS_E_12367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14973
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14974
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14974:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14975
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14975:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14976
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14976:
	jmp LB_14942
LB_14973:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_14979
LB_14978:
	add r14,1
LB_14979:
	cmp r14,r10
	jge LB_14980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14978
	cmp al,10
	jz LB_14978
	cmp al,32
	jz LB_14978
LB_14980:
	add r14,3
	cmp r14,r10
	jg LB_14987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14987
	jmp LB_14988
LB_14987:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14982
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14982:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14983
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14983:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14984
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14984:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14985:
	jmp LB_14942
LB_14988:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_14990
LB_14989:
	add r14,1
LB_14990:
	cmp r14,r10
	jge LB_14991
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14989
	cmp al,10
	jz LB_14989
	cmp al,32
	jz LB_14989
LB_14991:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14992
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_14993
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_14993:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14994
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14994:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14995
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14995:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14996
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14996:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14997:
	jmp LB_14942
LB_14992:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_14953
	btr r12,5
	jmp LB_14954
LB_14953:
	bts r12,5
LB_14954:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14951
	btr r12,4
	jmp LB_14952
LB_14951:
	bts r12,4
LB_14952:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14949
	btr r12,3
	jmp LB_14950
LB_14949:
	bts r12,3
LB_14950:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14947
	btr r12,2
	jmp LB_14948
LB_14947:
	bts r12,2
LB_14948:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14945
	btr r12,1
	jmp LB_14946
LB_14945:
	bts r12,1
LB_14946:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14943
	btr r12,0
	jmp LB_14944
LB_14943:
	bts r12,0
LB_14944:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_14938
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_15006
	btr r12,6
	jmp LB_15007
LB_15006:
	bts r12,6
LB_15007:
	mov r8,r11
	bt r12,5
	jc LB_15008
	btr r12,2
	jmp LB_15009
LB_15008:
	bts r12,2
LB_15009:
	mov r11,r14
	bt r12,1
	jc LB_15010
	btr r12,5
	jmp LB_15011
LB_15010:
	bts r12,5
LB_15011:
	mov r14,r9
	bt r12,3
	jc LB_15012
	btr r12,1
	jmp LB_15013
LB_15012:
	bts r12,1
LB_15013:
	mov r9,r13
	bt r12,0
	jc LB_15014
	btr r12,3
	jmp LB_15015
LB_15014:
	bts r12,3
LB_15015:
	mov r13,r11
	bt r12,5
	jc LB_15016
	btr r12,0
	jmp LB_15017
LB_15016:
	bts r12,0
LB_15017:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10072 {  } ⊢ %_13392 : %_13392
 ; {>  %_13389~0':_p9998 %_13391~2':_p9999 %_13390~1':_p9998 }
; _f10072 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_13393 : %_13393
 ; {>  %_13389~0':_p9998 %_13392~°2◂{  }:_p10007 %_13391~2':_p9999 %_13390~1':_p9998 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_13390 %_13393 } ⊢ %_13394 : %_13394
 ; {>  %_13389~0':_p9998 %_13392~°2◂{  }:_p10007 %_13391~2':_p9999 %_13390~1':_p9998 %_13393~°1◂{  }:(_lst)◂(t5186'(0)) }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_13389 %_13394 } ⊢ %_13395 : %_13395
 ; {>  %_13389~0':_p9998 %_13392~°2◂{  }:_p10007 %_13394~°0◂{ 1' °1◂{  } }:(_lst)◂(_p9998) %_13391~2':_p9999 }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f10047 %_13395 ⊢ %_13396 : %_13396
 ; {>  %_13395~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p9998) %_13392~°2◂{  }:_p10007 %_13391~2':_p9999 }
; _f10047 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_13392 %_13396 %_13391 } ⊢ %_13397 : %_13397
 ; {>  %_13396~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p9998 %_13392~°2◂{  }:_p10007 %_13391~2':_p9999 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_13397
 ; {>  %_13397~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p10007 _p9998 _p9999 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_14910
	mov rsi,0
	bt r10,0
	jc LB_14910
	jmp LB_14911
LB_14910:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14911:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14908
	btr QWORD [rdi],0
	jmp LB_14909
LB_14908:
	bts QWORD [rdi],0
LB_14909:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_14920
	btr r12,5
	jmp LB_14921
LB_14920:
	bts r12,5
LB_14921:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14918
	btr QWORD [rdi],0
	jmp LB_14919
LB_14918:
	bts QWORD [rdi],0
LB_14919:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_14928
	btr r12,0
	jmp LB_14929
LB_14928:
	bts r12,0
LB_14929:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_14926
	btr QWORD [rdi],0
	jmp LB_14927
LB_14926:
	bts QWORD [rdi],0
LB_14927:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_14932
	mov rsi,0
	bt r13,0
	jc LB_14932
	jmp LB_14933
LB_14932:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_14933:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_14930
	btr QWORD [rdi],1
	jmp LB_14931
LB_14930:
	bts QWORD [rdi],1
LB_14931:
	mov rsi,1
	bt r12,5
	jc LB_14924
	mov rsi,0
	bt r11,0
	jc LB_14924
	jmp LB_14925
LB_14924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_14925:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14922
	btr QWORD [rdi],1
	jmp LB_14923
LB_14922:
	bts QWORD [rdi],1
LB_14923:
	mov rsi,1
	bt r12,4
	jc LB_14916
	mov rsi,0
	bt r10,0
	jc LB_14916
	jmp LB_14917
LB_14916:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14917:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_14914
	mov rsi,0
	bt r10,0
	jc LB_14914
	jmp LB_14915
LB_14914:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14915:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14912
	btr QWORD [rdi],1
	jmp LB_14913
LB_14912:
	bts QWORD [rdi],1
LB_14913:
	mov r10,r8
	bt r12,2
	jc LB_14936
	btr r12,4
	jmp LB_14937
LB_14936:
	bts r12,4
LB_14937:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_14934
	btr QWORD [rdi],2
	jmp LB_14935
LB_14934:
	bts QWORD [rdi],2
LB_14935:
	mov r8,0
	bts r12,2
	ret
LB_14938:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14940
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14939
LB_14940:
	add rsp,8
	ret
LB_14942:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14941:
	add rsp,96
	pop r14
LB_14939:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_15046
LB_15045:
	add r14,1
LB_15046:
	cmp r14,r10
	jge LB_15047
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15045
	cmp al,10
	jz LB_15045
	cmp al,32
	jz LB_15045
LB_15047:
	add r14,2
	cmp r14,r10
	jg LB_15050
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_15050
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_15050
	jmp LB_15051
LB_15050:
	jmp LB_15033
LB_15051:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_15040
LB_15039:
	add r14,1
LB_15040:
	cmp r14,r10
	jge LB_15041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15039
	cmp al,10
	jz LB_15039
	cmp al,32
	jz LB_15039
LB_15041:
	push r10
	call NS_E_13232_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15042
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15043
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15043:
	jmp LB_15034
LB_15042:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15037
	btr r12,1
	jmp LB_15038
LB_15037:
	bts r12,1
LB_15038:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15035
	btr r12,0
	jmp LB_15036
LB_15035:
	bts r12,0
LB_15036:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15030
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_15052
	btr r12,3
	jmp LB_15053
LB_15052:
	bts r12,3
LB_15053:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_15056
	btr r12,4
	jmp LB_15057
LB_15056:
	bts r12,4
LB_15057:
	mov r13,r10
	bt r12,4
	jc LB_15054
	btr r12,0
	jmp LB_15055
LB_15054:
	bts r12,0
LB_15055:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_15060
	btr r12,4
	jmp LB_15061
LB_15060:
	bts r12,4
LB_15061:
	mov r14,r10
	bt r12,4
	jc LB_15058
	btr r12,1
	jmp LB_15059
LB_15058:
	bts r12,1
LB_15059:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_15064
	btr r12,4
	jmp LB_15065
LB_15064:
	bts r12,4
LB_15065:
	mov r8,r10
	bt r12,4
	jc LB_15062
	btr r12,2
	jmp LB_15063
LB_15062:
	bts r12,2
LB_15063:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13398 ⊢ %_13399 : %_13399
 ; {>  %_13398~{ 0' 1' 2' }:{ _p10007 _p9998 _p9999 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_13399
 ; {>  %_13399~°0◂{ 0' 1' 2' }:(_opn)◂({ _p10007 _p9998 _p9999 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_15020
	btr r12,4
	jmp LB_15021
LB_15020:
	bts r12,4
LB_15021:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_15018
	btr QWORD [rdi],0
	jmp LB_15019
LB_15018:
	bts QWORD [rdi],0
LB_15019:
	mov r10,r14
	bt r12,1
	jc LB_15024
	btr r12,4
	jmp LB_15025
LB_15024:
	bts r12,4
LB_15025:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_15022
	btr QWORD [rdi],1
	jmp LB_15023
LB_15022:
	bts QWORD [rdi],1
LB_15023:
	mov r10,r8
	bt r12,2
	jc LB_15028
	btr r12,4
	jmp LB_15029
LB_15028:
	bts r12,4
LB_15029:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_15026
	btr QWORD [rdi],2
	jmp LB_15027
LB_15026:
	bts QWORD [rdi],2
LB_15027:
	mov r8,0
	bts r12,2
	ret
LB_15030:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15032
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15031
LB_15032:
	add rsp,8
	ret
LB_15034:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15033:
	add rsp,32
	pop r14
LB_15031:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_15093
LB_15092:
	add r14,1
LB_15093:
	cmp r14,r10
	jge LB_15094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15092
	cmp al,10
	jz LB_15092
	cmp al,32
	jz LB_15092
LB_15094:
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15095
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15083
LB_15095:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_15098
LB_15097:
	add r14,1
LB_15098:
	cmp r14,r10
	jge LB_15099
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15097
	cmp al,10
	jz LB_15097
	cmp al,32
	jz LB_15097
LB_15099:
	push r10
	call NS_E_12367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15100
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15101
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15101:
	jmp LB_15083
LB_15100:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_15104
LB_15103:
	add r14,1
LB_15104:
	cmp r14,r10
	jge LB_15105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15103
	cmp al,10
	jz LB_15103
	cmp al,32
	jz LB_15103
LB_15105:
	add r14,3
	cmp r14,r10
	jg LB_15110
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15110
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15110
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15110
	jmp LB_15111
LB_15110:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15107
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15107:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15108
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15108:
	jmp LB_15083
LB_15111:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_15113
LB_15112:
	add r14,1
LB_15113:
	cmp r14,r10
	jge LB_15114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15112
	cmp al,10
	jz LB_15112
	cmp al,32
	jz LB_15112
LB_15114:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15115
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15116
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15116:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15117
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15117:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15118
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15118:
	jmp LB_15083
LB_15115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15090
	btr r12,3
	jmp LB_15091
LB_15090:
	bts r12,3
LB_15091:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15088
	btr r12,2
	jmp LB_15089
LB_15088:
	bts r12,2
LB_15089:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15086
	btr r12,1
	jmp LB_15087
LB_15086:
	bts r12,1
LB_15087:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15084
	btr r12,0
	jmp LB_15085
LB_15084:
	bts r12,0
LB_15085:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15080
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_15120
	btr r12,4
	jmp LB_15121
LB_15120:
	bts r12,4
LB_15121:
	mov r8,r9
	bt r12,3
	jc LB_15122
	btr r12,2
	jmp LB_15123
LB_15122:
	bts r12,2
LB_15123:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10070 %_13400 ⊢ %_13403 : %_13403
 ; {>  %_13402~2':_p9999 %_13400~0':_p9935 %_13401~1':_p9998 }
; _f10070 0' ⊢ °0◂0'
; _some { %_13403 %_13401 %_13402 } ⊢ %_13404 : %_13404
 ; {>  %_13403~°0◂0':_p10007 %_13402~2':_p9999 %_13401~1':_p9998 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_13404
 ; {>  %_13404~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p10007 _p9998 _p9999 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_15070
	btr r12,4
	jmp LB_15071
LB_15070:
	bts r12,4
LB_15071:
	mov rsi,1
	bt r12,4
	jc LB_15068
	mov rsi,0
	bt r10,0
	jc LB_15068
	jmp LB_15069
LB_15068:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_15069:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_15066
	btr QWORD [rdi],0
	jmp LB_15067
LB_15066:
	bts QWORD [rdi],0
LB_15067:
	mov r10,r14
	bt r12,1
	jc LB_15074
	btr r12,4
	jmp LB_15075
LB_15074:
	bts r12,4
LB_15075:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_15072
	btr QWORD [rdi],1
	jmp LB_15073
LB_15072:
	bts QWORD [rdi],1
LB_15073:
	mov r10,r8
	bt r12,2
	jc LB_15078
	btr r12,4
	jmp LB_15079
LB_15078:
	bts r12,4
LB_15079:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_15076
	btr QWORD [rdi],2
	jmp LB_15077
LB_15076:
	bts QWORD [rdi],2
LB_15077:
	mov r8,0
	bts r12,2
	ret
LB_15080:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15082
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15081
LB_15082:
	add rsp,8
	ret
LB_15083:
	add rsp,64
	pop r14
LB_15081:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13232:
NS_E_RDI_13232:
NS_E_13232_ETR_TBL:
NS_E_13232_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "_^"
	jmp LB_15182
LB_15181:
	add r14,1
LB_15182:
	cmp r14,r10
	jge LB_15183
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15181
	cmp al,10
	jz LB_15181
	cmp al,32
	jz LB_15181
LB_15183:
	add r14,2
	cmp r14,r10
	jg LB_15186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_15186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_15186
	jmp LB_15187
LB_15186:
	jmp LB_15149
LB_15187:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_15160
LB_15159:
	add r14,1
LB_15160:
	cmp r14,r10
	jge LB_15161
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15159
	cmp al,10
	jz LB_15159
	cmp al,32
	jz LB_15159
LB_15161:
	push r10
	call NS_E_13233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15162
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15163:
	jmp LB_15150
LB_15162:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_15169:
	jmp LB_15166
LB_15165:
	add r14,1
LB_15166:
	cmp r14,r10
	jge LB_15167
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15165
	cmp al,10
	jz LB_15165
	cmp al,32
	jz LB_15165
LB_15167:
	push r10
	push rsi
	call NS_E_13234_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_15168
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_15170
	bts QWORD [rax],0
LB_15170:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_15169
LB_15168:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_15172
LB_15171:
	add r14,1
LB_15172:
	cmp r14,r10
	jge LB_15173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15171
	cmp al,10
	jz LB_15171
	cmp al,32
	jz LB_15171
LB_15173:
	add r14,2
	cmp r14,r10
	jg LB_15179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_15179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_15179
	jmp LB_15180
LB_15179:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15175
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15175:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15176
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15176:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15177
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15177:
	jmp LB_15150
LB_15180:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15157
	btr r12,3
	jmp LB_15158
LB_15157:
	bts r12,3
LB_15158:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15155
	btr r12,2
	jmp LB_15156
LB_15155:
	bts r12,2
LB_15156:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15153
	btr r12,1
	jmp LB_15154
LB_15153:
	bts r12,1
LB_15154:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15151
	btr r12,0
	jmp LB_15152
LB_15151:
	bts r12,0
LB_15152:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15146
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_15188
	btr r12,4
	jmp LB_15189
LB_15188:
	bts r12,4
LB_15189:
	mov r9,r8
	bt r12,2
	jc LB_15190
	btr r12,3
	jmp LB_15191
LB_15190:
	bts r12,3
LB_15191:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_15192
	btr r12,4
	jmp LB_15193
LB_15192:
	bts r12,4
LB_15193:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_15196
	btr r12,5
	jmp LB_15197
LB_15196:
	bts r12,5
LB_15197:
	mov r13,r11
	bt r12,5
	jc LB_15194
	btr r12,0
	jmp LB_15195
LB_15194:
	bts r12,0
LB_15195:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_15200
	btr r12,5
	jmp LB_15201
LB_15200:
	bts r12,5
LB_15201:
	mov r14,r11
	bt r12,5
	jc LB_15198
	btr r12,1
	jmp LB_15199
LB_15198:
	bts r12,1
LB_15199:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_15204
	btr r12,5
	jmp LB_15205
LB_15204:
	bts r12,5
LB_15205:
	mov r8,r11
	bt r12,5
	jc LB_15202
	btr r12,2
	jmp LB_15203
LB_15202:
	bts r12,2
LB_15203:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10074 { %_13405 %_13408 } ⊢ %_13409 : %_13409
 ; {>  %_13408~3':(_lst)◂(_p10008) %_13406~1':_p9998 %_13405~0':_r64 %_13407~2':_p9999 }
; _f10074 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_13409 %_13406 %_13407 } ⊢ %_13410 : %_13410
 ; {>  %_13406~1':_p9998 %_13407~2':_p9999 %_13409~°4◂{ 0' 3' }:_p10007 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_13410
 ; {>  %_13410~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p10007 _p9998 _p9999 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_15124
	btr r12,4
	jmp LB_15125
LB_15124:
	bts r12,4
LB_15125:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_15132
	btr r12,6
	jmp LB_15133
LB_15132:
	bts r12,6
LB_15133:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_15130
	btr QWORD [rdi],0
	jmp LB_15131
LB_15130:
	bts QWORD [rdi],0
LB_15131:
	mov rcx,r10
	bt r12,4
	jc LB_15136
	btr r12,6
	jmp LB_15137
LB_15136:
	bts r12,6
LB_15137:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_15134
	btr QWORD [rdi],1
	jmp LB_15135
LB_15134:
	bts QWORD [rdi],1
LB_15135:
	mov rsi,1
	bt r12,5
	jc LB_15128
	mov rsi,0
	bt r11,0
	jc LB_15128
	jmp LB_15129
LB_15128:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_15129:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_15126
	btr QWORD [rdi],0
	jmp LB_15127
LB_15126:
	bts QWORD [rdi],0
LB_15127:
	mov r11,r14
	bt r12,1
	jc LB_15140
	btr r12,5
	jmp LB_15141
LB_15140:
	bts r12,5
LB_15141:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_15138
	btr QWORD [rdi],1
	jmp LB_15139
LB_15138:
	bts QWORD [rdi],1
LB_15139:
	mov r11,r8
	bt r12,2
	jc LB_15144
	btr r12,5
	jmp LB_15145
LB_15144:
	bts r12,5
LB_15145:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_15142
	btr QWORD [rdi],2
	jmp LB_15143
LB_15142:
	bts QWORD [rdi],2
LB_15143:
	mov r8,0
	bts r12,2
	ret
LB_15146:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15148
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15147
LB_15148:
	add rsp,8
	ret
LB_15150:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15149:
	add rsp,64
	pop r14
LB_15147:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_15235
LB_15234:
	add r14,1
LB_15235:
	cmp r14,r10
	jge LB_15236
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15234
	cmp al,10
	jz LB_15234
	cmp al,32
	jz LB_15234
LB_15236:
	push r10
	call NS_E_12238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15237
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15225
LB_15237:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_15240
LB_15239:
	add r14,1
LB_15240:
	cmp r14,r10
	jge LB_15241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15239
	cmp al,10
	jz LB_15239
	cmp al,32
	jz LB_15239
LB_15241:
	add r14,1
	cmp r14,r10
	jg LB_15245
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_15245
	jmp LB_15246
LB_15245:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15243
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15243:
	jmp LB_15225
LB_15246:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_15248
LB_15247:
	add r14,1
LB_15248:
	cmp r14,r10
	jge LB_15249
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15247
	cmp al,10
	jz LB_15247
	cmp al,32
	jz LB_15247
LB_15249:
	add r14,3
	cmp r14,r10
	jg LB_15254
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15254
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15254
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15254
	jmp LB_15255
LB_15254:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15251
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15251:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15252
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15252:
	jmp LB_15225
LB_15255:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_15257
LB_15256:
	add r14,1
LB_15257:
	cmp r14,r10
	jge LB_15258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15256
	cmp al,10
	jz LB_15256
	cmp al,32
	jz LB_15256
LB_15258:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15259
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15260
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15260:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15261
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15261:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15262
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15262:
	jmp LB_15225
LB_15259:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15232
	btr r12,3
	jmp LB_15233
LB_15232:
	bts r12,3
LB_15233:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15230
	btr r12,2
	jmp LB_15231
LB_15230:
	bts r12,2
LB_15231:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15228
	btr r12,1
	jmp LB_15229
LB_15228:
	bts r12,1
LB_15229:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15226
	btr r12,0
	jmp LB_15227
LB_15226:
	bts r12,0
LB_15227:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15222
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_15264
	btr r12,4
	jmp LB_15265
LB_15264:
	bts r12,4
LB_15265:
	mov r14,r9
	bt r12,3
	jc LB_15266
	btr r12,1
	jmp LB_15267
LB_15266:
	bts r12,1
LB_15267:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10073 %_13411 ⊢ %_13413 : %_13413
 ; {>  %_13411~0':_p10001 %_13412~1':_p9999 }
; _f10073 0' ⊢ °3◂0'
; _nil {  } ⊢ %_13414 : %_13414
 ; {>  %_13412~1':_p9999 %_13413~°3◂0':_p10007 }
; _nil {  } ⊢ °1◂{  }
; _f10047 %_13414 ⊢ %_13415 : %_13415
 ; {>  %_13412~1':_p9999 %_13414~°1◂{  }:(_lst)◂(t5215'(0)) %_13413~°3◂0':_p10007 }
; _f10047 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_13413 %_13415 %_13412 } ⊢ %_13416 : %_13416
 ; {>  %_13415~°0◂°1◂{  }:_p9998 %_13412~1':_p9999 %_13413~°3◂0':_p10007 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_13416
 ; {>  %_13416~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p10007 _p9998 _p9999 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15210
	btr r12,2
	jmp LB_15211
LB_15210:
	bts r12,2
LB_15211:
	mov rsi,1
	bt r12,2
	jc LB_15208
	mov rsi,0
	bt r8,0
	jc LB_15208
	jmp LB_15209
LB_15208:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15209:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15206
	btr QWORD [rdi],0
	jmp LB_15207
LB_15206:
	bts QWORD [rdi],0
LB_15207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_15216
	mov rsi,0
	bt r8,0
	jc LB_15216
	jmp LB_15217
LB_15216:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15217:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_15214
	mov rsi,0
	bt r8,0
	jc LB_15214
	jmp LB_15215
LB_15214:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15215:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15212
	btr QWORD [rdi],1
	jmp LB_15213
LB_15212:
	bts QWORD [rdi],1
LB_15213:
	mov r8,r14
	bt r12,1
	jc LB_15220
	btr r12,2
	jmp LB_15221
LB_15220:
	bts r12,2
LB_15221:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_15218
	btr QWORD [rdi],2
	jmp LB_15219
LB_15218:
	bts QWORD [rdi],2
LB_15219:
	mov r8,0
	bts r12,2
	ret
LB_15222:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15224
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15223
LB_15224:
	add rsp,8
	ret
LB_15225:
	add rsp,64
	pop r14
LB_15223:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13233:
NS_E_RDI_13233:
NS_E_13233_ETR_TBL:
NS_E_13233_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "_"
	jmp LB_15321
LB_15320:
	add r14,1
LB_15321:
	cmp r14,r10
	jge LB_15322
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15320
	cmp al,10
	jz LB_15320
	cmp al,32
	jz LB_15320
LB_15322:
	add r14,1
	cmp r14,r10
	jg LB_15325
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_15325
	jmp LB_15326
LB_15325:
	jmp LB_15297
LB_15326:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_15306
LB_15305:
	add r14,1
LB_15306:
	cmp r14,r10
	jge LB_15307
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15305
	cmp al,10
	jz LB_15305
	cmp al,32
	jz LB_15305
LB_15307:
	add r14,3
	cmp r14,r10
	jg LB_15311
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15311
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15311
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15311
	jmp LB_15312
LB_15311:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15309
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15309:
	jmp LB_15298
LB_15312:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_15314
LB_15313:
	add r14,1
LB_15314:
	cmp r14,r10
	jge LB_15315
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15313
	cmp al,10
	jz LB_15313
	cmp al,32
	jz LB_15313
LB_15315:
	push r10
	call NS_E_12636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15316
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15317
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15317:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15318:
	jmp LB_15298
LB_15316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15303
	btr r12,2
	jmp LB_15304
LB_15303:
	bts r12,2
LB_15304:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15301
	btr r12,1
	jmp LB_15302
LB_15301:
	bts r12,1
LB_15302:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15299
	btr r12,0
	jmp LB_15300
LB_15299:
	bts r12,0
LB_15300:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15294
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_15327
	btr r12,3
	jmp LB_15328
LB_15327:
	bts r12,3
LB_15328:
	mov r13,r8
	bt r12,2
	jc LB_15329
	btr r12,0
	jmp LB_15330
LB_15329:
	bts r12,0
LB_15330:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_13418 : %_13418
 ; {>  %_13417~0':_p9997 }
; 	» 0xr0 _ ⊢ 1' : %_13418
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_13419 : %_13419
 ; {>  %_13418~1':_r64 %_13417~0':_p9997 }
; _nil {  } ⊢ °1◂{  }
; _f10047 %_13419 ⊢ %_13420 : %_13420
 ; {>  %_13418~1':_r64 %_13417~0':_p9997 %_13419~°1◂{  }:(_lst)◂(t5223'(0)) }
; _f10047 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_13421 : %_13421
 ; {>  %_13418~1':_r64 %_13417~0':_p9997 %_13420~°0◂°1◂{  }:_p9998 }
; _nil {  } ⊢ °1◂{  }
; _f10050 %_13417 ⊢ %_13422 : %_13422
 ; {>  %_13418~1':_r64 %_13417~0':_p9997 %_13421~°1◂{  }:(_lst)◂(t5227'(0)) %_13420~°0◂°1◂{  }:_p9998 }
; _f10050 0' ⊢ °1◂0'
; _cns { %_13422 %_13421 } ⊢ %_13423 : %_13423
 ; {>  %_13418~1':_r64 %_13422~°1◂0':_p9999 %_13421~°1◂{  }:(_lst)◂(t5227'(0)) %_13420~°0◂°1◂{  }:_p9998 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f10049 %_13423 ⊢ %_13424 : %_13424
 ; {>  %_13418~1':_r64 %_13423~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p9999) %_13420~°0◂°1◂{  }:_p9998 }
; _f10049 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_13418 %_13420 %_13424 } ⊢ %_13425 : %_13425
 ; {>  %_13418~1':_r64 %_13424~°0◂°0◂{ °1◂0' °1◂{  } }:_p9999 %_13420~°0◂°1◂{  }:_p9998 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_13425
 ; {>  %_13425~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p9998 _p9999 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_15270
	btr r12,2
	jmp LB_15271
LB_15270:
	bts r12,2
LB_15271:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15268
	btr QWORD [rdi],0
	jmp LB_15269
LB_15268:
	bts QWORD [rdi],0
LB_15269:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_15276
	mov rsi,0
	bt r8,0
	jc LB_15276
	jmp LB_15277
LB_15276:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15277:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_15274
	mov rsi,0
	bt r8,0
	jc LB_15274
	jmp LB_15275
LB_15274:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15275:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15272
	btr QWORD [rdi],1
	jmp LB_15273
LB_15272:
	bts QWORD [rdi],1
LB_15273:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_15288
	btr r12,1
	jmp LB_15289
LB_15288:
	bts r12,1
LB_15289:
	mov rsi,1
	bt r12,1
	jc LB_15286
	mov rsi,0
	bt r14,0
	jc LB_15286
	jmp LB_15287
LB_15286:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15287:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15284
	btr QWORD [rdi],0
	jmp LB_15285
LB_15284:
	bts QWORD [rdi],0
LB_15285:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15292
	mov rsi,0
	bt r14,0
	jc LB_15292
	jmp LB_15293
LB_15292:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15293:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15290
	btr QWORD [rdi],1
	jmp LB_15291
LB_15290:
	bts QWORD [rdi],1
LB_15291:
	mov rsi,1
	bt r12,2
	jc LB_15282
	mov rsi,0
	bt r8,0
	jc LB_15282
	jmp LB_15283
LB_15282:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15283:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_15280
	mov rsi,0
	bt r8,0
	jc LB_15280
	jmp LB_15281
LB_15280:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15281:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_15278
	btr QWORD [rdi],2
	jmp LB_15279
LB_15278:
	bts QWORD [rdi],2
LB_15279:
	mov r8,0
	bts r12,2
	ret
LB_15294:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15296
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15295
LB_15296:
	add rsp,8
	ret
LB_15298:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15297:
	add rsp,48
	pop r14
LB_15295:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src
	jmp LB_15384
LB_15383:
	add r14,1
LB_15384:
	cmp r14,r10
	jge LB_15385
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15383
	cmp al,10
	jz LB_15383
	cmp al,32
	jz LB_15383
LB_15385:
	push r10
	call NS_E_12370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15386
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15372
LB_15386:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_15389
LB_15388:
	add r14,1
LB_15389:
	cmp r14,r10
	jge LB_15390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15388
	cmp al,10
	jz LB_15388
	cmp al,32
	jz LB_15388
LB_15390:
	push r10
	call NS_E_12369_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15391
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15392
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15392:
	jmp LB_15372
LB_15391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_15395
LB_15394:
	add r14,1
LB_15395:
	cmp r14,r10
	jge LB_15396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15394
	cmp al,10
	jz LB_15394
	cmp al,32
	jz LB_15394
LB_15396:
	add r14,3
	cmp r14,r10
	jg LB_15401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15401
	jmp LB_15402
LB_15401:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15398
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15398:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15399
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15399:
	jmp LB_15372
LB_15402:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_15404
LB_15403:
	add r14,1
LB_15404:
	cmp r14,r10
	jge LB_15405
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15403
	cmp al,10
	jz LB_15403
	cmp al,32
	jz LB_15403
LB_15405:
	push r10
	call NS_E_12636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15406
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15407
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15407:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15408
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15409:
	jmp LB_15372
LB_15406:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_15412
LB_15411:
	add r14,1
LB_15412:
	cmp r14,r10
	jge LB_15413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15411
	cmp al,10
	jz LB_15411
	cmp al,32
	jz LB_15411
LB_15413:
	push r10
	call NS_E_12635_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15414
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15415
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15415:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15416
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15416:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15417
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15417:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15418
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15418:
	jmp LB_15372
LB_15414:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15381
	btr r12,4
	jmp LB_15382
LB_15381:
	bts r12,4
LB_15382:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15379
	btr r12,3
	jmp LB_15380
LB_15379:
	bts r12,3
LB_15380:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15377
	btr r12,2
	jmp LB_15378
LB_15377:
	bts r12,2
LB_15378:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15375
	btr r12,1
	jmp LB_15376
LB_15375:
	bts r12,1
LB_15376:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15373
	btr r12,0
	jmp LB_15374
LB_15373:
	bts r12,0
LB_15374:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_15369
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_15420
	btr r12,5
	jmp LB_15421
LB_15420:
	bts r12,5
LB_15421:
	mov r9,r10
	bt r12,4
	jc LB_15422
	btr r12,3
	jmp LB_15423
LB_15422:
	bts r12,3
LB_15423:
	mov r10,r8
	bt r12,2
	jc LB_15424
	btr r12,4
	jmp LB_15425
LB_15424:
	bts r12,4
LB_15425:
	mov r8,r11
	bt r12,5
	jc LB_15426
	btr r12,2
	jmp LB_15427
LB_15426:
	bts r12,2
LB_15427:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10048 %_13426 ⊢ %_13430 : %_13430
 ; {>  %_13427~1':(_lst)◂(_p9998) %_13428~2':_p9997 %_13426~0':_p9996 %_13429~3':(_lst)◂(_p9999) }
; _f10048 0' ⊢ °1◂0'
; _f10050 %_13428 ⊢ %_13431 : %_13431
 ; {>  %_13427~1':(_lst)◂(_p9998) %_13428~2':_p9997 %_13430~°1◂0':_p9998 %_13429~3':(_lst)◂(_p9999) }
; _f10050 2' ⊢ °1◂2'
; _cns { %_13430 %_13427 } ⊢ %_13432 : %_13432
 ; {>  %_13427~1':(_lst)◂(_p9998) %_13431~°1◂2':_p9999 %_13430~°1◂0':_p9998 %_13429~3':(_lst)◂(_p9999) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_13431 %_13429 } ⊢ %_13433 : %_13433
 ; {>  %_13432~°0◂{ °1◂0' 1' }:(_lst)◂(_p9998) %_13431~°1◂2':_p9999 %_13429~3':(_lst)◂(_p9999) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f10047 %_13432 ⊢ %_13434 : %_13434
 ; {>  %_13432~°0◂{ °1◂0' 1' }:(_lst)◂(_p9998) %_13433~°0◂{ °1◂2' 3' }:(_lst)◂(_p9999) }
; _f10047 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f10049 %_13433 ⊢ %_13435 : %_13435
 ; {>  %_13434~°0◂°0◂{ °1◂0' 1' }:_p9998 %_13433~°0◂{ °1◂2' 3' }:(_lst)◂(_p9999) }
; _f10049 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_13436 : %_13436
 ; {>  %_13435~°0◂°0◂{ °1◂2' 3' }:_p9999 %_13434~°0◂°0◂{ °1◂0' 1' }:_p9998 }
; 	» 0xr1 _ ⊢ 4' : %_13436
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_13436 %_13434 %_13435 } ⊢ %_13437 : %_13437
 ; {>  %_13435~°0◂°0◂{ °1◂2' 3' }:_p9999 %_13434~°0◂°0◂{ °1◂0' 1' }:_p9998 %_13436~4':_r64 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_13437
 ; {>  %_13437~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p9998 _p9999 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_15331
	btr r12,5
	jmp LB_15332
LB_15331:
	bts r12,5
LB_15332:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_15335
	btr r12,6
	jmp LB_15336
LB_15335:
	bts r12,6
LB_15336:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_15333
	btr QWORD [rdi],0
	jmp LB_15334
LB_15333:
	bts QWORD [rdi],0
LB_15334:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_15347
	btr r12,4
	jmp LB_15348
LB_15347:
	bts r12,4
LB_15348:
	mov rsi,1
	bt r12,4
	jc LB_15345
	mov rsi,0
	bt r10,0
	jc LB_15345
	jmp LB_15346
LB_15345:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_15346:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_15343
	btr QWORD [rdi],0
	jmp LB_15344
LB_15343:
	bts QWORD [rdi],0
LB_15344:
	mov r10,r14
	bt r12,1
	jc LB_15351
	btr r12,4
	jmp LB_15352
LB_15351:
	bts r12,4
LB_15352:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_15349
	btr QWORD [rdi],1
	jmp LB_15350
LB_15349:
	bts QWORD [rdi],1
LB_15350:
	mov rsi,1
	bt r12,6
	jc LB_15341
	mov rsi,0
	bt rcx,0
	jc LB_15341
	jmp LB_15342
LB_15341:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_15342:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_15339
	mov rsi,0
	bt rcx,0
	jc LB_15339
	jmp LB_15340
LB_15339:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_15340:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_15337
	btr QWORD [rdi],1
	jmp LB_15338
LB_15337:
	bts QWORD [rdi],1
LB_15338:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_15363
	btr r12,0
	jmp LB_15364
LB_15363:
	bts r12,0
LB_15364:
	mov rsi,1
	bt r12,0
	jc LB_15361
	mov rsi,0
	bt r13,0
	jc LB_15361
	jmp LB_15362
LB_15361:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15362:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_15359
	btr QWORD [rdi],0
	jmp LB_15360
LB_15359:
	bts QWORD [rdi],0
LB_15360:
	mov r13,r11
	bt r12,5
	jc LB_15367
	btr r12,0
	jmp LB_15368
LB_15367:
	bts r12,0
LB_15368:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_15365
	btr QWORD [rdi],1
	jmp LB_15366
LB_15365:
	bts QWORD [rdi],1
LB_15366:
	mov rsi,1
	bt r12,6
	jc LB_15357
	mov rsi,0
	bt rcx,0
	jc LB_15357
	jmp LB_15358
LB_15357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_15358:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_15355
	mov rsi,0
	bt rcx,0
	jc LB_15355
	jmp LB_15356
LB_15355:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_15356:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_15353
	btr QWORD [rdi],2
	jmp LB_15354
LB_15353:
	bts QWORD [rdi],2
LB_15354:
	mov r8,0
	bts r12,2
	ret
LB_15369:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15371
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15370
LB_15371:
	add rsp,8
	ret
LB_15372:
	add rsp,80
	pop r14
LB_15370:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13234:
NS_E_RDI_13234:
NS_E_13234_ETR_TBL:
NS_E_13234_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_15439
LB_15438:
	add r14,1
LB_15439:
	cmp r14,r10
	jge LB_15440
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15438
	cmp al,10
	jz LB_15438
	cmp al,32
	jz LB_15438
LB_15440:
	push r10
	call NS_E_13236_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15441
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15435
LB_15441:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15436
	btr r12,0
	jmp LB_15437
LB_15436:
	bts r12,0
LB_15437:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15432
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10075 %_13438 ⊢ %_13439 : %_13439
 ; {>  %_13438~0':_stg }
; _f10075 0' ⊢ °0◂0'
; _some %_13439 ⊢ %_13440 : %_13440
 ; {>  %_13439~°0◂0':_p10008 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13440
 ; {>  %_13440~°0◂°0◂0':(_opn)◂(_p10008) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15430
	btr r12,3
	jmp LB_15431
LB_15430:
	bts r12,3
LB_15431:
	mov rsi,1
	bt r12,3
	jc LB_15428
	mov rsi,0
	bt r9,0
	jc LB_15428
	jmp LB_15429
LB_15428:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15429:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15432:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15434
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15433
LB_15434:
	add rsp,8
	ret
LB_15435:
	add rsp,16
	pop r14
LB_15433:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_15454
LB_15453:
	add r14,1
LB_15454:
	cmp r14,r10
	jge LB_15455
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15453
	cmp al,10
	jz LB_15453
	cmp al,32
	jz LB_15453
LB_15455:
	push r10
	call NS_E_9380_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15456
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15450
LB_15456:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15451
	btr r12,0
	jmp LB_15452
LB_15451:
	bts r12,0
LB_15452:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15447
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10075 %_13441 ⊢ %_13442 : %_13442
 ; {>  %_13441~0':_stg }
; _f10075 0' ⊢ °0◂0'
; _some %_13442 ⊢ %_13443 : %_13443
 ; {>  %_13442~°0◂0':_p10008 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13443
 ; {>  %_13443~°0◂°0◂0':(_opn)◂(_p10008) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15445
	btr r12,3
	jmp LB_15446
LB_15445:
	bts r12,3
LB_15446:
	mov rsi,1
	bt r12,3
	jc LB_15443
	mov rsi,0
	bt r9,0
	jc LB_15443
	jmp LB_15444
LB_15443:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15444:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15447:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15449
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15448
LB_15449:
	add rsp,8
	ret
LB_15450:
	add rsp,16
	pop r14
LB_15448:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_15469
LB_15468:
	add r14,1
LB_15469:
	cmp r14,r10
	jge LB_15470
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15468
	cmp al,10
	jz LB_15468
	cmp al,32
	jz LB_15468
LB_15470:
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15471
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15465
LB_15471:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15466
	btr r12,0
	jmp LB_15467
LB_15466:
	bts r12,0
LB_15467:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15462
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10076 %_13444 ⊢ %_13445 : %_13445
 ; {>  %_13444~0':_p9935 }
; _f10076 0' ⊢ °1◂0'
; _some %_13445 ⊢ %_13446 : %_13446
 ; {>  %_13445~°1◂0':_p10008 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13446
 ; {>  %_13446~°0◂°1◂0':(_opn)◂(_p10008) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15460
	btr r12,3
	jmp LB_15461
LB_15460:
	bts r12,3
LB_15461:
	mov rsi,1
	bt r12,3
	jc LB_15458
	mov rsi,0
	bt r9,0
	jc LB_15458
	jmp LB_15459
LB_15458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15459:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15462:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15464
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15463
LB_15464:
	add rsp,8
	ret
LB_15465:
	add rsp,16
	pop r14
LB_15463:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_15490
LB_15489:
	add r14,1
LB_15490:
	cmp r14,r10
	jge LB_15491
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15489
	cmp al,10
	jz LB_15489
	cmp al,32
	jz LB_15489
LB_15491:
	push r10
	call NS_E_13235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15492
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15486
LB_15492:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15487
	btr r12,0
	jmp LB_15488
LB_15487:
	bts r12,0
LB_15488:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15483
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_15494
	btr r12,2
	jmp LB_15495
LB_15494:
	bts r12,2
LB_15495:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_15498
	btr r12,3
	jmp LB_15499
LB_15498:
	bts r12,3
LB_15499:
	mov r13,r9
	bt r12,3
	jc LB_15496
	btr r12,0
	jmp LB_15497
LB_15496:
	bts r12,0
LB_15497:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_15502
	btr r12,3
	jmp LB_15503
LB_15502:
	bts r12,3
LB_15503:
	mov r14,r9
	bt r12,3
	jc LB_15500
	btr r12,1
	jmp LB_15501
LB_15500:
	bts r12,1
LB_15501:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10077 %_13447 ⊢ %_13448 : %_13448
 ; {>  %_13447~{ 0' 1' }:{ _p10009 _r64 } }
; _f10077 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_13448 ⊢ %_13449 : %_13449
 ; {>  %_13448~°2◂{ 0' 1' }:_p10008 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_13449
 ; {>  %_13449~°0◂°2◂{ 0' 1' }:(_opn)◂(_p10008) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15477
	btr r12,2
	jmp LB_15478
LB_15477:
	bts r12,2
LB_15478:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15475
	btr QWORD [rdi],0
	jmp LB_15476
LB_15475:
	bts QWORD [rdi],0
LB_15476:
	mov r8,r14
	bt r12,1
	jc LB_15481
	btr r12,2
	jmp LB_15482
LB_15481:
	bts r12,2
LB_15482:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15479
	btr QWORD [rdi],1
	jmp LB_15480
LB_15479:
	bts QWORD [rdi],1
LB_15480:
	mov rsi,1
	bt r12,3
	jc LB_15473
	mov rsi,0
	bt r9,0
	jc LB_15473
	jmp LB_15474
LB_15473:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15474:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15483:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15485
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15484
LB_15485:
	add rsp,8
	ret
LB_15486:
	add rsp,16
	pop r14
LB_15484:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13235:
NS_E_RDI_13235:
NS_E_13235_ETR_TBL:
NS_E_13235_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15523
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15515
LB_15523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_15531
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_15531
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_15531
	jmp LB_15532
LB_15531:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15529
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15529:
	jmp LB_15515
LB_15532:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15518
	btr r12,1
	jmp LB_15519
LB_15518:
	bts r12,1
LB_15519:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15516
	btr r12,0
	jmp LB_15517
LB_15516:
	bts r12,0
LB_15517:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15512
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10079 {  } ⊢ %_13451 : %_13451
 ; {>  %_13450~0':_r64 }
; _f10079 {  } ⊢ °1◂{  }
; _some { %_13451 %_13450 } ⊢ %_13452 : %_13452
 ; {>  %_13451~°1◂{  }:_p10009 %_13450~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_13452
 ; {>  %_13452~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p10009 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15506
	mov rsi,0
	bt r14,0
	jc LB_15506
	jmp LB_15507
LB_15506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15507:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15504
	btr QWORD [rdi],0
	jmp LB_15505
LB_15504:
	bts QWORD [rdi],0
LB_15505:
	mov r14,r13
	bt r12,0
	jc LB_15510
	btr r12,1
	jmp LB_15511
LB_15510:
	bts r12,1
LB_15511:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15508
	btr QWORD [rdi],1
	jmp LB_15509
LB_15508:
	bts QWORD [rdi],1
LB_15509:
	mov r8,0
	bts r12,2
	ret
LB_15512:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15514
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15513
LB_15514:
	add rsp,8
	ret
LB_15515:
	add rsp,32
	pop r14
LB_15513:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15552
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15544
LB_15552:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_15560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_15560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_15560
	jmp LB_15561
LB_15560:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15558
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15558:
	jmp LB_15544
LB_15561:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15547
	btr r12,1
	jmp LB_15548
LB_15547:
	bts r12,1
LB_15548:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15545
	btr r12,0
	jmp LB_15546
LB_15545:
	bts r12,0
LB_15546:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15541
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10080 {  } ⊢ %_13454 : %_13454
 ; {>  %_13453~0':_r64 }
; _f10080 {  } ⊢ °2◂{  }
; _some { %_13454 %_13453 } ⊢ %_13455 : %_13455
 ; {>  %_13454~°2◂{  }:_p10009 %_13453~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_13455
 ; {>  %_13455~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p10009 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15535
	mov rsi,0
	bt r14,0
	jc LB_15535
	jmp LB_15536
LB_15535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15536:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15533
	btr QWORD [rdi],0
	jmp LB_15534
LB_15533:
	bts QWORD [rdi],0
LB_15534:
	mov r14,r13
	bt r12,0
	jc LB_15539
	btr r12,1
	jmp LB_15540
LB_15539:
	bts r12,1
LB_15540:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15537
	btr QWORD [rdi],1
	jmp LB_15538
LB_15537:
	bts QWORD [rdi],1
LB_15538:
	mov r8,0
	bts r12,2
	ret
LB_15541:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15543
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15542
LB_15543:
	add rsp,8
	ret
LB_15544:
	add rsp,32
	pop r14
LB_15542:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15581
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15573
LB_15581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_15589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_15589
	jmp LB_15590
LB_15589:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15587
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15587:
	jmp LB_15573
LB_15590:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15576
	btr r12,1
	jmp LB_15577
LB_15576:
	bts r12,1
LB_15577:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15574
	btr r12,0
	jmp LB_15575
LB_15574:
	bts r12,0
LB_15575:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15570
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10078 {  } ⊢ %_13457 : %_13457
 ; {>  %_13456~0':_r64 }
; _f10078 {  } ⊢ °0◂{  }
; _some { %_13457 %_13456 } ⊢ %_13458 : %_13458
 ; {>  %_13457~°0◂{  }:_p10009 %_13456~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_13458
 ; {>  %_13458~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p10009 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15564
	mov rsi,0
	bt r14,0
	jc LB_15564
	jmp LB_15565
LB_15564:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15565:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15562
	btr QWORD [rdi],0
	jmp LB_15563
LB_15562:
	bts QWORD [rdi],0
LB_15563:
	mov r14,r13
	bt r12,0
	jc LB_15568
	btr r12,1
	jmp LB_15569
LB_15568:
	bts r12,1
LB_15569:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15566
	btr QWORD [rdi],1
	jmp LB_15567
LB_15566:
	bts QWORD [rdi],1
LB_15567:
	mov r8,0
	bts r12,2
	ret
LB_15570:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15572
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15571
LB_15572:
	add rsp,8
	ret
LB_15573:
	add rsp,32
	pop r14
LB_15571:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13236:
NS_E_RDI_13236:
NS_E_13236_ETR_TBL:
NS_E_13236_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_15606
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_15606
	jmp LB_15607
LB_15606:
	jmp LB_15596
LB_15607:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_13237_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15611
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15612
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15612:
	jmp LB_15596
LB_15611:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15599
	btr r12,1
	jmp LB_15600
LB_15599:
	bts r12,1
LB_15600:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15597
	btr r12,0
	jmp LB_15598
LB_15597:
	bts r12,0
LB_15598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15593
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_15614
	btr r12,2
	jmp LB_15615
LB_15614:
	bts r12,2
LB_15615:
	mov r13,r14
	bt r12,1
	jc LB_15616
	btr r12,0
	jmp LB_15617
LB_15616:
	bts r12,0
LB_15617:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9370 %_13459 ⊢ %_13460 : %_13460
 ; {>  %_13459~0':(_lst)◂(_r64) }
; _f9370 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9370
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_13460 ⊢ %_13461 : %_13461
 ; {>  %_13460~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_13461
 ; {>  %_13461~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15591
	btr r12,3
	jmp LB_15592
LB_15591:
	bts r12,3
LB_15592:
	mov r8,0
	bts r12,2
	ret
LB_15593:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15595
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15594
LB_15595:
	add rsp,8
	ret
LB_15596:
	add rsp,32
	pop r14
LB_15594:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13237:
NS_E_RDI_13237:
NS_E_13237_ETR_TBL:
NS_E_13237_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_15639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_15639
	jmp LB_15640
LB_15639:
	jmp LB_15631
LB_15640:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15632
	btr r12,0
	jmp LB_15633
LB_15632:
	bts r12,0
LB_15633:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15628
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_13462 : %_13462
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_13462
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_13463 : %_13463
 ; {>  %_13462~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_13462 %_13463 } ⊢ %_13464 : %_13464
 ; {>  %_13463~°1◂{  }:(_lst)◂(t5284'(0)) %_13462~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_13464 ⊢ %_13465 : %_13465
 ; {>  %_13464~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_13465
 ; {>  %_13465~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_15622
	btr r12,1
	jmp LB_15623
LB_15622:
	bts r12,1
LB_15623:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15620
	btr QWORD [rdi],0
	jmp LB_15621
LB_15620:
	bts QWORD [rdi],0
LB_15621:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15626
	mov rsi,0
	bt r14,0
	jc LB_15626
	jmp LB_15627
LB_15626:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15627:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15624
	btr QWORD [rdi],1
	jmp LB_15625
LB_15624:
	bts QWORD [rdi],1
LB_15625:
	mov rsi,1
	bt r12,3
	jc LB_15618
	mov rsi,0
	bt r9,0
	jc LB_15618
	jmp LB_15619
LB_15618:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15619:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15628:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15630
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15629
LB_15630:
	add rsp,8
	ret
LB_15631:
	add rsp,16
	pop r14
LB_15629:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_9257_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15662
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15654
LB_15662:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_13237_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15667
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15668
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15668:
	jmp LB_15654
LB_15667:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15657
	btr r12,1
	jmp LB_15658
LB_15657:
	bts r12,1
LB_15658:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15655
	btr r12,0
	jmp LB_15656
LB_15655:
	bts r12,0
LB_15656:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15651
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_13466 %_13467 } ⊢ %_13468 : %_13468
 ; {>  %_13467~1':(_lst)◂(_r64) %_13466~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13468 ⊢ %_13469 : %_13469
 ; {>  %_13468~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13469
 ; {>  %_13469~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15645
	btr r12,2
	jmp LB_15646
LB_15645:
	bts r12,2
LB_15646:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15643
	btr QWORD [rdi],0
	jmp LB_15644
LB_15643:
	bts QWORD [rdi],0
LB_15644:
	mov r8,r14
	bt r12,1
	jc LB_15649
	btr r12,2
	jmp LB_15650
LB_15649:
	bts r12,2
LB_15650:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15647
	btr QWORD [rdi],1
	jmp LB_15648
LB_15647:
	bts QWORD [rdi],1
LB_15648:
	mov rsi,1
	bt r12,3
	jc LB_15641
	mov rsi,0
	bt r9,0
	jc LB_15641
	jmp LB_15642
LB_15641:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15642:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15651:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15653
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15652
LB_15653:
	add rsp,8
	ret
LB_15654:
	add rsp,32
	pop r14
LB_15652:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13238:
NS_E_RDI_13238:
NS_E_13238_ETR_TBL:
NS_E_13238_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_15708
LB_15707:
	add r14,1
LB_15708:
	cmp r14,r10
	jge LB_15709
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15707
	cmp al,10
	jz LB_15707
	cmp al,32
	jz LB_15707
LB_15709:
	add r14,4
	cmp r14,r10
	jg LB_15712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_15712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_15712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_15712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_15712
	jmp LB_15713
LB_15712:
	jmp LB_15686
LB_15713:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_15695
LB_15694:
	add r14,1
LB_15695:
	cmp r14,r10
	jge LB_15696
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15694
	cmp al,10
	jz LB_15694
	cmp al,32
	jz LB_15694
LB_15696:
	push r10
	call NS_E_13239_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15697
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15698:
	jmp LB_15687
LB_15697:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_15701
LB_15700:
	add r14,1
LB_15701:
	cmp r14,r10
	jge LB_15702
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15700
	cmp al,10
	jz LB_15700
	cmp al,32
	jz LB_15700
LB_15702:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15703
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15704
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15704:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15705:
	jmp LB_15687
LB_15703:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15692
	btr r12,2
	jmp LB_15693
LB_15692:
	bts r12,2
LB_15693:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15690
	btr r12,1
	jmp LB_15691
LB_15690:
	bts r12,1
LB_15691:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15688
	btr r12,0
	jmp LB_15689
LB_15688:
	bts r12,0
LB_15689:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15683
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_15714
	btr r12,3
	jmp LB_15715
LB_15714:
	bts r12,3
LB_15715:
	mov r14,r8
	bt r12,2
	jc LB_15716
	btr r12,1
	jmp LB_15717
LB_15716:
	bts r12,1
LB_15717:
	mov r8,r13
	bt r12,0
	jc LB_15718
	btr r12,2
	jmp LB_15719
LB_15718:
	bts r12,2
LB_15719:
	mov r13,r9
	bt r12,3
	jc LB_15720
	btr r12,0
	jmp LB_15721
LB_15720:
	bts r12,0
LB_15721:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13472 : %_13472
 ; {>  %_13470~0':(_lst)◂(_p10005) %_13471~1':_p10002 }
; _nil {  } ⊢ °1◂{  }
; _f10065 %_13471 ⊢ %_13473 : %_13473
 ; {>  %_13470~0':(_lst)◂(_p10005) %_13472~°1◂{  }:(_lst)◂(t5299'(0)) %_13471~1':_p10002 }
; _f10065 1' ⊢ °1◂1'
; _f10063 { %_13472 %_13473 } ⊢ %_13474 : %_13474
 ; {>  %_13470~0':(_lst)◂(_p10005) %_13473~°1◂1':_p10004 %_13472~°1◂{  }:(_lst)◂(t5299'(0)) }
; _f10063 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_13474 ⊢ %_13475 : %_13475
 ; {>  %_13470~0':(_lst)◂(_p10005) %_13474~°1◂{ °1◂{  } °1◂1' }:_p10003 }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_13475
 ; {>  %_13470~0':(_lst)◂(_p10005) %_13475~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p10003) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_15670
	mov rdi,r13
	call dlt
LB_15670:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_15675
	mov rsi,0
	bt r13,0
	jc LB_15675
	jmp LB_15676
LB_15675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15676:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_15673
	btr QWORD [rdi],0
	jmp LB_15674
LB_15673:
	bts QWORD [rdi],0
LB_15674:
	mov r13,r14
	bt r12,1
	jc LB_15681
	btr r12,0
	jmp LB_15682
LB_15681:
	bts r12,0
LB_15682:
	mov rsi,1
	bt r12,0
	jc LB_15679
	mov rsi,0
	bt r13,0
	jc LB_15679
	jmp LB_15680
LB_15679:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15680:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_15677
	btr QWORD [rdi],1
	jmp LB_15678
LB_15677:
	bts QWORD [rdi],1
LB_15678:
	mov rsi,1
	bt r12,3
	jc LB_15671
	mov rsi,0
	bt r9,0
	jc LB_15671
	jmp LB_15672
LB_15671:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15672:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15683:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15685
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15684
LB_15685:
	add rsp,8
	ret
LB_15687:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15686:
	add rsp,48
	pop r14
LB_15684:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_15752
LB_15751:
	add r14,1
LB_15752:
	cmp r14,r10
	jge LB_15753
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15751
	cmp al,10
	jz LB_15751
	cmp al,32
	jz LB_15751
LB_15753:
	add r14,3
	cmp r14,r10
	jg LB_15756
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15756
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_15756
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_15756
	jmp LB_15757
LB_15756:
	jmp LB_15742
LB_15757:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_15759
LB_15758:
	add r14,1
LB_15759:
	cmp r14,r10
	jge LB_15760
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15758
	cmp al,10
	jz LB_15758
	cmp al,32
	jz LB_15758
LB_15760:
	push r10
	call NS_E_13239_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15761
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15762
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15762:
	jmp LB_15742
LB_15761:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_15765
LB_15764:
	add r14,1
LB_15765:
	cmp r14,r10
	jge LB_15766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15764
	cmp al,10
	jz LB_15764
	cmp al,32
	jz LB_15764
LB_15766:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15767
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15768
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15768:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15769
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15769:
	jmp LB_15742
LB_15767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_15772
LB_15771:
	add r14,1
LB_15772:
	cmp r14,r10
	jge LB_15773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15771
	cmp al,10
	jz LB_15771
	cmp al,32
	jz LB_15771
LB_15773:
	push r10
	call NS_E_13238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15774
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15775
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15775:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15776
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15776:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15777
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15777:
	jmp LB_15742
LB_15774:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15749
	btr r12,3
	jmp LB_15750
LB_15749:
	bts r12,3
LB_15750:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15747
	btr r12,2
	jmp LB_15748
LB_15747:
	bts r12,2
LB_15748:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15745
	btr r12,1
	jmp LB_15746
LB_15745:
	bts r12,1
LB_15746:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15743
	btr r12,0
	jmp LB_15744
LB_15743:
	bts r12,0
LB_15744:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15739
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_15779
	btr r12,4
	jmp LB_15780
LB_15779:
	bts r12,4
LB_15780:
	mov r8,r9
	bt r12,3
	jc LB_15781
	btr r12,2
	jmp LB_15782
LB_15781:
	bts r12,2
LB_15782:
	mov r9,r14
	bt r12,1
	jc LB_15783
	btr r12,3
	jmp LB_15784
LB_15783:
	bts r12,3
LB_15784:
	mov r14,r10
	bt r12,4
	jc LB_15785
	btr r12,1
	jmp LB_15786
LB_15785:
	bts r12,1
LB_15786:
	mov r10,r13
	bt r12,0
	jc LB_15787
	btr r12,4
	jmp LB_15788
LB_15787:
	bts r12,4
LB_15788:
	mov r13,r9
	bt r12,3
	jc LB_15789
	btr r12,0
	jmp LB_15790
LB_15789:
	bts r12,0
LB_15790:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13479 : %_13479
 ; {>  %_13478~2':_p10003 %_13476~0':(_lst)◂(_p10005) %_13477~1':_p10002 }
; _nil {  } ⊢ °1◂{  }
; _f10065 %_13477 ⊢ %_13480 : %_13480
 ; {>  %_13479~°1◂{  }:(_lst)◂(t5309'(0)) %_13478~2':_p10003 %_13476~0':(_lst)◂(_p10005) %_13477~1':_p10002 }
; _f10065 1' ⊢ °1◂1'
; _f10062 { %_13479 %_13480 %_13478 } ⊢ %_13481 : %_13481
 ; {>  %_13479~°1◂{  }:(_lst)◂(t5309'(0)) %_13478~2':_p10003 %_13476~0':(_lst)◂(_p10005) %_13480~°1◂1':_p10004 }
; _f10062 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_13481 ⊢ %_13482 : %_13482
 ; {>  %_13476~0':(_lst)◂(_p10005) %_13481~°0◂{ °1◂{  } °1◂1' 2' }:_p10003 }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_13482
 ; {>  %_13476~0':(_lst)◂(_p10005) %_13482~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p10003) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_15722
	mov rdi,r13
	call dlt
LB_15722:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_15727
	mov rsi,0
	bt r13,0
	jc LB_15727
	jmp LB_15728
LB_15727:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15728:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_15725
	btr QWORD [rdi],0
	jmp LB_15726
LB_15725:
	bts QWORD [rdi],0
LB_15726:
	mov r13,r14
	bt r12,1
	jc LB_15733
	btr r12,0
	jmp LB_15734
LB_15733:
	bts r12,0
LB_15734:
	mov rsi,1
	bt r12,0
	jc LB_15731
	mov rsi,0
	bt r13,0
	jc LB_15731
	jmp LB_15732
LB_15731:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15732:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_15729
	btr QWORD [rdi],1
	jmp LB_15730
LB_15729:
	bts QWORD [rdi],1
LB_15730:
	mov r13,r8
	bt r12,2
	jc LB_15737
	btr r12,0
	jmp LB_15738
LB_15737:
	bts r12,0
LB_15738:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_15735
	btr QWORD [rdi],2
	jmp LB_15736
LB_15735:
	bts QWORD [rdi],2
LB_15736:
	mov rsi,1
	bt r12,3
	jc LB_15723
	mov rsi,0
	bt r9,0
	jc LB_15723
	jmp LB_15724
LB_15723:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15724:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15739:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15741
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15740
LB_15741:
	add rsp,8
	ret
LB_15742:
	add rsp,64
	pop r14
LB_15740:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13239:
NS_E_RDI_13239:
NS_E_13239_ETR_TBL:
NS_E_13239_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_15810
LB_15809:
	add r14,1
LB_15810:
	cmp r14,r10
	jge LB_15811
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15809
	cmp al,10
	jz LB_15809
	cmp al,32
	jz LB_15809
LB_15811:
	push r10
	call NS_E_13240_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15812
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15804
LB_15812:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_15815
LB_15814:
	add r14,1
LB_15815:
	cmp r14,r10
	jge LB_15816
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15814
	cmp al,10
	jz LB_15814
	cmp al,32
	jz LB_15814
LB_15816:
	push r10
	call NS_E_13241_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15817
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15818
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15818:
	jmp LB_15804
LB_15817:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15807
	btr r12,1
	jmp LB_15808
LB_15807:
	bts r12,1
LB_15808:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15805
	btr r12,0
	jmp LB_15806
LB_15805:
	bts r12,0
LB_15806:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15801
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_13483 %_13484 } ⊢ %_13485 : %_13485
 ; {>  %_13484~1':(_lst)◂(_p10005) %_13483~0':_p10005 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13485 ⊢ %_13486 : %_13486
 ; {>  %_13485~°0◂{ 0' 1' }:(_lst)◂(_p10005) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13486
 ; {>  %_13486~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10005)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15795
	btr r12,2
	jmp LB_15796
LB_15795:
	bts r12,2
LB_15796:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15793
	btr QWORD [rdi],0
	jmp LB_15794
LB_15793:
	bts QWORD [rdi],0
LB_15794:
	mov r8,r14
	bt r12,1
	jc LB_15799
	btr r12,2
	jmp LB_15800
LB_15799:
	bts r12,2
LB_15800:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15797
	btr QWORD [rdi],1
	jmp LB_15798
LB_15797:
	bts QWORD [rdi],1
LB_15798:
	mov rsi,1
	bt r12,3
	jc LB_15791
	mov rsi,0
	bt r9,0
	jc LB_15791
	jmp LB_15792
LB_15791:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15792:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15801:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15803
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15802
LB_15803:
	add rsp,8
	ret
LB_15804:
	add rsp,32
	pop r14
LB_15802:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_15831
LB_15830:
	add r14,1
LB_15831:
	cmp r14,r10
	jge LB_15832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15830
	cmp al,32
	jz LB_15830
LB_15832:
	add r14,1
	cmp r14,r10
	jg LB_15835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_15835
	jmp LB_15836
LB_15835:
	jmp LB_15825
LB_15836:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_15838
LB_15837:
	add r14,1
LB_15838:
	cmp r14,r10
	jge LB_15839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15837
	cmp al,32
	jz LB_15837
LB_15839:
	add r14,1
	cmp r14,r10
	jg LB_15843
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_15843
	jmp LB_15844
LB_15843:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15841
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15841:
	jmp LB_15825
LB_15844:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15828
	btr r12,1
	jmp LB_15829
LB_15828:
	bts r12,1
LB_15829:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15826
	btr r12,0
	jmp LB_15827
LB_15826:
	bts r12,0
LB_15827:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15822
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13487 : %_13487
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13487 ⊢ %_13488 : %_13488
 ; {>  %_13487~°1◂{  }:(_lst)◂(t5322'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13488
 ; {>  %_13488~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5325'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_15820
	mov rsi,0
	bt r9,0
	jc LB_15820
	jmp LB_15821
LB_15820:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15821:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15822:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15824
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15823
LB_15824:
	add rsp,8
	ret
LB_15825:
	add rsp,32
	pop r14
LB_15823:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13240:
NS_E_RDI_13240:
NS_E_13240_ETR_TBL:
NS_E_13240_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src_ptn
	jmp LB_15901
LB_15900:
	add r14,1
LB_15901:
	cmp r14,r10
	jge LB_15902
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15900
	cmp al,10
	jz LB_15900
	cmp al,32
	jz LB_15900
LB_15902:
	push r10
	call NS_E_12367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15903
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15862
LB_15903:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_15906
LB_15905:
	add r14,1
LB_15906:
	cmp r14,r10
	jge LB_15907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15905
	cmp al,10
	jz LB_15905
	cmp al,32
	jz LB_15905
LB_15907:
	add r14,3
	cmp r14,r10
	jg LB_15911
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15911
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15911
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15911
	jmp LB_15912
LB_15911:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15909
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15909:
	jmp LB_15862
LB_15912:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_15875
LB_15874:
	add r14,1
LB_15875:
	cmp r14,r10
	jge LB_15876
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15874
	cmp al,10
	jz LB_15874
	cmp al,32
	jz LB_15874
LB_15876:
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15877
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15878
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15878:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15879
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15879:
	jmp LB_15863
LB_15877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_15882
LB_15881:
	add r14,1
LB_15882:
	cmp r14,r10
	jge LB_15883
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15881
	cmp al,10
	jz LB_15881
	cmp al,32
	jz LB_15881
LB_15883:
	add r14,3
	cmp r14,r10
	jg LB_15889
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15889
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_15889
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_15889
	jmp LB_15890
LB_15889:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15885
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15885:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15886
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15886:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15887
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15887:
	jmp LB_15863
LB_15890:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_15892
LB_15891:
	add r14,1
LB_15892:
	cmp r14,r10
	jge LB_15893
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15891
	cmp al,10
	jz LB_15891
	cmp al,32
	jz LB_15891
LB_15893:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15894
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15895
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15895:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15896
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15896:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15897
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15897:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15898
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15898:
	jmp LB_15863
LB_15894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15872
	btr r12,4
	jmp LB_15873
LB_15872:
	bts r12,4
LB_15873:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15870
	btr r12,3
	jmp LB_15871
LB_15870:
	bts r12,3
LB_15871:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15868
	btr r12,2
	jmp LB_15869
LB_15868:
	bts r12,2
LB_15869:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15866
	btr r12,1
	jmp LB_15867
LB_15866:
	bts r12,1
LB_15867:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15864
	btr r12,0
	jmp LB_15865
LB_15864:
	bts r12,0
LB_15865:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_15859
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_15913
	btr r12,5
	jmp LB_15914
LB_15913:
	bts r12,5
LB_15914:
	mov r8,r10
	bt r12,4
	jc LB_15915
	btr r12,2
	jmp LB_15916
LB_15915:
	bts r12,2
LB_15916:
	mov r10,r14
	bt r12,1
	jc LB_15917
	btr r12,4
	jmp LB_15918
LB_15917:
	bts r12,4
LB_15918:
	mov r14,r11
	bt r12,5
	jc LB_15919
	btr r12,1
	jmp LB_15920
LB_15919:
	bts r12,1
LB_15920:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f10066 { %_13489 %_13490 %_13491 } ⊢ %_13492 : %_13492
 ; {>  %_13489~0':_p9998 %_13491~2':_p9999 %_13490~1':_p9935 }
; _f10066 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_13492 ⊢ %_13493 : %_13493
 ; {>  %_13492~°0◂{ 0' 1' 2' }:_p10005 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_13493
 ; {>  %_13493~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p10005) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_15849
	btr r12,4
	jmp LB_15850
LB_15849:
	bts r12,4
LB_15850:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_15847
	btr QWORD [rdi],0
	jmp LB_15848
LB_15847:
	bts QWORD [rdi],0
LB_15848:
	mov r10,r14
	bt r12,1
	jc LB_15853
	btr r12,4
	jmp LB_15854
LB_15853:
	bts r12,4
LB_15854:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_15851
	btr QWORD [rdi],1
	jmp LB_15852
LB_15851:
	bts QWORD [rdi],1
LB_15852:
	mov r10,r8
	bt r12,2
	jc LB_15857
	btr r12,4
	jmp LB_15858
LB_15857:
	bts r12,4
LB_15858:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_15855
	btr QWORD [rdi],2
	jmp LB_15856
LB_15855:
	bts QWORD [rdi],2
LB_15856:
	mov rsi,1
	bt r12,3
	jc LB_15845
	mov rsi,0
	bt r9,0
	jc LB_15845
	jmp LB_15846
LB_15845:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15846:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15859:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15861
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15860
LB_15861:
	add rsp,8
	ret
LB_15863:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15862:
	add rsp,80
	pop r14
LB_15860:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_15942
LB_15941:
	add r14,1
LB_15942:
	cmp r14,r10
	jge LB_15943
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15941
	cmp al,32
	jz LB_15941
LB_15943:
	push r10
	call NS_E_13242_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15944
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15934
LB_15944:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_15947
LB_15946:
	add r14,1
LB_15947:
	cmp r14,r10
	jge LB_15948
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15946
	cmp al,32
	jz LB_15946
LB_15948:
	add r14,1
	cmp r14,r10
	jg LB_15952
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_15952
	jmp LB_15953
LB_15952:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15950
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15950:
	jmp LB_15934
LB_15953:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_15955
LB_15954:
	add r14,1
LB_15955:
	cmp r14,r10
	jge LB_15956
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15954
	cmp al,32
	jz LB_15954
LB_15956:
	push r10
	call NS_E_13242_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15957
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15958
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15958:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15959
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15959:
	jmp LB_15934
LB_15957:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15939
	btr r12,2
	jmp LB_15940
LB_15939:
	bts r12,2
LB_15940:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15937
	btr r12,1
	jmp LB_15938
LB_15937:
	bts r12,1
LB_15938:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15935
	btr r12,0
	jmp LB_15936
LB_15935:
	bts r12,0
LB_15936:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15931
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_15961
	btr r12,3
	jmp LB_15962
LB_15961:
	bts r12,3
LB_15962:
	mov r14,r8
	bt r12,2
	jc LB_15963
	btr r12,1
	jmp LB_15964
LB_15963:
	bts r12,1
LB_15964:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f10067 { %_13494 %_13495 } ⊢ %_13496 : %_13496
 ; {>  %_13494~0':_p10006 %_13495~1':_p10006 }
; _f10067 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_13496 ⊢ %_13497 : %_13497
 ; {>  %_13496~°1◂{ 0' 1' }:_p10005 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_13497
 ; {>  %_13497~°0◂°1◂{ 0' 1' }:(_opn)◂(_p10005) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15925
	btr r12,2
	jmp LB_15926
LB_15925:
	bts r12,2
LB_15926:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15923
	btr QWORD [rdi],0
	jmp LB_15924
LB_15923:
	bts QWORD [rdi],0
LB_15924:
	mov r8,r14
	bt r12,1
	jc LB_15929
	btr r12,2
	jmp LB_15930
LB_15929:
	bts r12,2
LB_15930:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15927
	btr QWORD [rdi],1
	jmp LB_15928
LB_15927:
	bts QWORD [rdi],1
LB_15928:
	mov rsi,1
	bt r12,3
	jc LB_15921
	mov rsi,0
	bt r9,0
	jc LB_15921
	jmp LB_15922
LB_15921:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15922:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15931:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15933
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15932
LB_15933:
	add rsp,8
	ret
LB_15934:
	add rsp,48
	pop r14
LB_15932:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13241:
NS_E_RDI_13241:
NS_E_13241_ETR_TBL:
NS_E_13241_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_16000
LB_15999:
	add r14,1
LB_16000:
	cmp r14,r10
	jge LB_16001
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15999
	cmp al,10
	jz LB_15999
	cmp al,32
	jz LB_15999
LB_16001:
	add r14,1
	cmp r14,r10
	jg LB_16004
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_16004
	jmp LB_16005
LB_16004:
	jmp LB_15978
LB_16005:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_15987
LB_15986:
	add r14,1
LB_15987:
	cmp r14,r10
	jge LB_15988
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15986
	cmp al,10
	jz LB_15986
	cmp al,32
	jz LB_15986
LB_15988:
	push r10
	call NS_E_13240_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15989
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15990
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15990:
	jmp LB_15979
LB_15989:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_15993
LB_15992:
	add r14,1
LB_15993:
	cmp r14,r10
	jge LB_15994
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15992
	cmp al,10
	jz LB_15992
	cmp al,32
	jz LB_15992
LB_15994:
	push r10
	call NS_E_13241_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15995
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15996
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15996:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15997:
	jmp LB_15979
LB_15995:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15984
	btr r12,2
	jmp LB_15985
LB_15984:
	bts r12,2
LB_15985:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15982
	btr r12,1
	jmp LB_15983
LB_15982:
	bts r12,1
LB_15983:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15980
	btr r12,0
	jmp LB_15981
LB_15980:
	bts r12,0
LB_15981:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15975
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_16006
	btr r12,3
	jmp LB_16007
LB_16006:
	bts r12,3
LB_16007:
	mov r14,r8
	bt r12,2
	jc LB_16008
	btr r12,1
	jmp LB_16009
LB_16008:
	bts r12,1
LB_16009:
	mov r8,r13
	bt r12,0
	jc LB_16010
	btr r12,2
	jmp LB_16011
LB_16010:
	bts r12,2
LB_16011:
	mov r13,r9
	bt r12,3
	jc LB_16012
	btr r12,0
	jmp LB_16013
LB_16012:
	bts r12,0
LB_16013:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_13498 %_13499 } ⊢ %_13500 : %_13500
 ; {>  %_13498~0':_p10005 %_13499~1':(_lst)◂(_p10005) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13500 ⊢ %_13501 : %_13501
 ; {>  %_13500~°0◂{ 0' 1' }:(_lst)◂(_p10005) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13501
 ; {>  %_13501~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10005)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15969
	btr r12,2
	jmp LB_15970
LB_15969:
	bts r12,2
LB_15970:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15967
	btr QWORD [rdi],0
	jmp LB_15968
LB_15967:
	bts QWORD [rdi],0
LB_15968:
	mov r8,r14
	bt r12,1
	jc LB_15973
	btr r12,2
	jmp LB_15974
LB_15973:
	bts r12,2
LB_15974:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15971
	btr QWORD [rdi],1
	jmp LB_15972
LB_15971:
	bts QWORD [rdi],1
LB_15972:
	mov rsi,1
	bt r12,3
	jc LB_15965
	mov rsi,0
	bt r9,0
	jc LB_15965
	jmp LB_15966
LB_15965:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15966:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15975:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15977
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15976
LB_15977:
	add rsp,8
	ret
LB_15979:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15978:
	add rsp,48
	pop r14
LB_15976:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_16025
LB_16024:
	add r14,1
LB_16025:
	cmp r14,r10
	jge LB_16026
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16024
	cmp al,32
	jz LB_16024
LB_16026:
	add r14,1
	cmp r14,r10
	jg LB_16029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_16029
	jmp LB_16030
LB_16029:
	jmp LB_16019
LB_16030:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_16032
LB_16031:
	add r14,1
LB_16032:
	cmp r14,r10
	jge LB_16033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16031
	cmp al,32
	jz LB_16031
LB_16033:
	add r14,1
	cmp r14,r10
	jg LB_16037
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_16037
	jmp LB_16038
LB_16037:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16035:
	jmp LB_16019
LB_16038:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16022
	btr r12,1
	jmp LB_16023
LB_16022:
	bts r12,1
LB_16023:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16020
	btr r12,0
	jmp LB_16021
LB_16020:
	bts r12,0
LB_16021:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16016
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13502 : %_13502
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13502 ⊢ %_13503 : %_13503
 ; {>  %_13502~°1◂{  }:(_lst)◂(t5346'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13503
 ; {>  %_13503~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5349'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16014
	mov rsi,0
	bt r9,0
	jc LB_16014
	jmp LB_16015
LB_16014:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16015:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16016:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16018
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16017
LB_16018:
	add rsp,8
	ret
LB_16019:
	add rsp,32
	pop r14
LB_16017:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13242:
NS_E_RDI_13242:
NS_E_13242_ETR_TBL:
NS_E_13242_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16054
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16046
LB_16054:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_16062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_16062
	jmp LB_16063
LB_16062:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16060
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16060:
	jmp LB_16046
LB_16063:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16049
	btr r12,1
	jmp LB_16050
LB_16049:
	bts r12,1
LB_16050:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16047
	btr r12,0
	jmp LB_16048
LB_16047:
	bts r12,0
LB_16048:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16043
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10069 %_13504 ⊢ %_13505 : %_13505
 ; {>  %_13504~0':_stg }
; _f10069 0' ⊢ °1◂0'
; _some %_13505 ⊢ %_13506 : %_13506
 ; {>  %_13505~°1◂0':_p10006 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13506
 ; {>  %_13506~°0◂°1◂0':(_opn)◂(_p10006) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16041
	btr r12,3
	jmp LB_16042
LB_16041:
	bts r12,3
LB_16042:
	mov rsi,1
	bt r12,3
	jc LB_16039
	mov rsi,0
	bt r9,0
	jc LB_16039
	jmp LB_16040
LB_16039:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16040:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16043:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16045
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16044
LB_16045:
	add rsp,8
	ret
LB_16046:
	add rsp,32
	pop r14
LB_16044:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_12238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16077
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16071
LB_16077:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16072
	btr r12,0
	jmp LB_16073
LB_16072:
	bts r12,0
LB_16073:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16068
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10068 %_13507 ⊢ %_13508 : %_13508
 ; {>  %_13507~0':_p10001 }
; _f10068 0' ⊢ °0◂0'
; _some %_13508 ⊢ %_13509 : %_13509
 ; {>  %_13508~°0◂0':_p10006 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13509
 ; {>  %_13509~°0◂°0◂0':(_opn)◂(_p10006) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16066
	btr r12,3
	jmp LB_16067
LB_16066:
	bts r12,3
LB_16067:
	mov rsi,1
	bt r12,3
	jc LB_16064
	mov rsi,0
	bt r9,0
	jc LB_16064
	jmp LB_16065
LB_16064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16065:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16068:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16070
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16069
LB_16070:
	add rsp,8
	ret
LB_16071:
	add rsp,16
	pop r14
LB_16069:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13243:
NS_E_RDI_13243:
NS_E_13243_ETR_TBL:
NS_E_13243_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_16100
LB_16099:
	add r14,1
LB_16100:
	cmp r14,r10
	jge LB_16101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16099
	cmp al,10
	jz LB_16099
	cmp al,32
	jz LB_16099
LB_16101:
	add r14,1
	cmp r14,r10
	jg LB_16104
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_16104
	jmp LB_16105
LB_16104:
	jmp LB_16090
LB_16105:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_16107
LB_16106:
	add r14,1
LB_16107:
	cmp r14,r10
	jge LB_16108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16106
	cmp al,10
	jz LB_16106
	cmp al,32
	jz LB_16106
LB_16108:
	add r14,1
	cmp r14,r10
	jg LB_16112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_16112
	jmp LB_16113
LB_16112:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16110
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16110:
	jmp LB_16090
LB_16113:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_16115
LB_16114:
	add r14,1
LB_16115:
	cmp r14,r10
	jge LB_16116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16114
	cmp al,10
	jz LB_16114
	cmp al,32
	jz LB_16114
LB_16116:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16117
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16118
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16118:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16119
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16119:
	jmp LB_16090
LB_16117:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_16122
LB_16121:
	add r14,1
LB_16122:
	cmp r14,r10
	jge LB_16123
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16121
	cmp al,10
	jz LB_16121
	cmp al,32
	jz LB_16121
LB_16123:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16124
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16125
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16125:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16126
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16126:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16127
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16127:
	jmp LB_16090
LB_16124:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16097
	btr r12,3
	jmp LB_16098
LB_16097:
	bts r12,3
LB_16098:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16095
	btr r12,2
	jmp LB_16096
LB_16095:
	bts r12,2
LB_16096:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16093
	btr r12,1
	jmp LB_16094
LB_16093:
	bts r12,1
LB_16094:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16091
	btr r12,0
	jmp LB_16092
LB_16091:
	bts r12,0
LB_16092:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_16087
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_16129
	btr r12,4
	jmp LB_16130
LB_16129:
	bts r12,4
LB_16130:
	mov r14,r9
	bt r12,3
	jc LB_16131
	btr r12,1
	jmp LB_16132
LB_16131:
	bts r12,1
LB_16132:
	mov r9,r13
	bt r12,0
	jc LB_16133
	btr r12,3
	jmp LB_16134
LB_16133:
	bts r12,3
LB_16134:
	mov r13,r8
	bt r12,2
	jc LB_16135
	btr r12,0
	jmp LB_16136
LB_16135:
	bts r12,0
LB_16136:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_13510 %_13511 } ⊢ %_13512 : %_13512
 ; {>  %_13511~1':_p9987 %_13510~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_13512
 ; {>  %_13512~°0◂{ 0' 1' }:(_opn)◂({ _stg _p9987 }) }
; 	∎ °0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_16081
	btr r12,2
	jmp LB_16082
LB_16081:
	bts r12,2
LB_16082:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_16079
	btr QWORD [rdi],0
	jmp LB_16080
LB_16079:
	bts QWORD [rdi],0
LB_16080:
	mov r8,r14
	bt r12,1
	jc LB_16085
	btr r12,2
	jmp LB_16086
LB_16085:
	bts r12,2
LB_16086:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_16083
	btr QWORD [rdi],1
	jmp LB_16084
LB_16083:
	bts QWORD [rdi],1
LB_16084:
	mov r8,0
	bts r12,2
	ret
LB_16087:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16089
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16088
LB_16089:
	add rsp,8
	ret
LB_16090:
	add rsp,64
	pop r14
LB_16088:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13244:
NS_E_RDI_13244:
NS_E_13244_ETR_TBL:
NS_E_13244_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_16148
LB_16147:
	add r14,1
LB_16148:
	cmp r14,r10
	jge LB_16149
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16147
	cmp al,10
	jz LB_16147
	cmp al,32
	jz LB_16147
LB_16149:
	push r10
	call NS_E_13245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16150
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16144
LB_16150:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16145
	btr r12,0
	jmp LB_16146
LB_16145:
	bts r12,0
LB_16146:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16141
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10024 %_13513 ⊢ %_13514 : %_13514
 ; {>  %_13513~0':_p9989 }
; _f10024 0' ⊢ °1◂0'
; _some %_13514 ⊢ %_13515 : %_13515
 ; {>  %_13514~°1◂0':_p9987 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13515
 ; {>  %_13515~°0◂°1◂0':(_opn)◂(_p9987) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16139
	btr r12,3
	jmp LB_16140
LB_16139:
	bts r12,3
LB_16140:
	mov rsi,1
	bt r12,3
	jc LB_16137
	mov rsi,0
	bt r9,0
	jc LB_16137
	jmp LB_16138
LB_16137:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16138:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16141:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16143
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16142
LB_16143:
	add rsp,8
	ret
LB_16144:
	add rsp,16
	pop r14
LB_16142:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_16163
LB_16162:
	add r14,1
LB_16163:
	cmp r14,r10
	jge LB_16164
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16162
	cmp al,10
	jz LB_16162
	cmp al,32
	jz LB_16162
LB_16164:
	push r10
	call NS_E_13253_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16165
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16159
LB_16165:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16160
	btr r12,0
	jmp LB_16161
LB_16160:
	bts r12,0
LB_16161:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16156
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10023 %_13516 ⊢ %_13517 : %_13517
 ; {>  %_13516~0':_p9988 }
; _f10023 0' ⊢ °0◂0'
; _some %_13517 ⊢ %_13518 : %_13518
 ; {>  %_13517~°0◂0':_p9987 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13518
 ; {>  %_13518~°0◂°0◂0':(_opn)◂(_p9987) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16154
	btr r12,3
	jmp LB_16155
LB_16154:
	bts r12,3
LB_16155:
	mov rsi,1
	bt r12,3
	jc LB_16152
	mov rsi,0
	bt r9,0
	jc LB_16152
	jmp LB_16153
LB_16152:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16153:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16156:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16158
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16157
LB_16158:
	add rsp,8
	ret
LB_16159:
	add rsp,16
	pop r14
LB_16157:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13245:
NS_E_RDI_13245:
NS_E_13245_ETR_TBL:
NS_E_13245_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_16216
LB_16215:
	add r14,1
LB_16216:
	cmp r14,r10
	jge LB_16217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16215
	cmp al,10
	jz LB_16215
	cmp al,32
	jz LB_16215
LB_16217:
	push r10
	call NS_E_13252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16218
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16194
LB_16218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_16203
LB_16202:
	add r14,1
LB_16203:
	cmp r14,r10
	jge LB_16204
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16202
	cmp al,10
	jz LB_16202
	cmp al,32
	jz LB_16202
LB_16204:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16205
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16206
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16206:
	jmp LB_16195
LB_16205:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_16209
LB_16208:
	add r14,1
LB_16209:
	cmp r14,r10
	jge LB_16210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16208
	cmp al,10
	jz LB_16208
	cmp al,32
	jz LB_16208
LB_16210:
	push r10
	call NS_E_13246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16211
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16212
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16212:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16213
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16213:
	jmp LB_16195
LB_16211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16200
	btr r12,2
	jmp LB_16201
LB_16200:
	bts r12,2
LB_16201:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16198
	btr r12,1
	jmp LB_16199
LB_16198:
	bts r12,1
LB_16199:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16196
	btr r12,0
	jmp LB_16197
LB_16196:
	bts r12,0
LB_16197:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16191
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_16220
	btr r12,5
	jmp LB_16221
LB_16220:
	bts r12,5
LB_16221:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_16224
	btr r12,6
	jmp LB_16225
LB_16224:
	bts r12,6
LB_16225:
	mov r8,rcx
	bt r12,6
	jc LB_16222
	btr r12,2
	jmp LB_16223
LB_16222:
	bts r12,2
LB_16223:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_16228
	btr r12,6
	jmp LB_16229
LB_16228:
	bts r12,6
LB_16229:
	mov r9,rcx
	bt r12,6
	jc LB_16226
	btr r12,3
	jmp LB_16227
LB_16226:
	bts r12,3
LB_16227:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_16232
	btr r12,6
	jmp LB_16233
LB_16232:
	bts r12,6
LB_16233:
	mov r10,rcx
	bt r12,6
	jc LB_16230
	btr r12,4
	jmp LB_16231
LB_16230:
	bts r12,4
LB_16231:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f10028 { %_13521 %_13522 %_13519 %_13520 %_13523 } ⊢ %_13524 : %_13524
 ; {>  %_13521~2':_p9999 %_13519~0':_p9990 %_13520~1':_p9991 %_13523~4':(_opn)◂(_p9989) %_13522~3':_p10002 }
; _f10028 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_13524 ⊢ %_13525 : %_13525
 ; {>  %_13524~°1◂{ 2' 3' 0' 1' 4' }:_p9989 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_13525
 ; {>  %_13525~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p9989) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_16167
	btr r12,5
	jmp LB_16168
LB_16167:
	bts r12,5
LB_16168:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_16173
	btr r12,6
	jmp LB_16174
LB_16173:
	bts r12,6
LB_16174:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_16171
	btr QWORD [rdi],0
	jmp LB_16172
LB_16171:
	bts QWORD [rdi],0
LB_16172:
	mov rcx,r11
	bt r12,5
	jc LB_16177
	btr r12,6
	jmp LB_16178
LB_16177:
	bts r12,6
LB_16178:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_16175
	btr QWORD [rdi],1
	jmp LB_16176
LB_16175:
	bts QWORD [rdi],1
LB_16176:
	mov rcx,r13
	bt r12,0
	jc LB_16181
	btr r12,6
	jmp LB_16182
LB_16181:
	bts r12,6
LB_16182:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_16179
	btr QWORD [rdi],2
	jmp LB_16180
LB_16179:
	bts QWORD [rdi],2
LB_16180:
	mov rcx,r14
	bt r12,1
	jc LB_16185
	btr r12,6
	jmp LB_16186
LB_16185:
	bts r12,6
LB_16186:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_16183
	btr QWORD [rdi],3
	jmp LB_16184
LB_16183:
	bts QWORD [rdi],3
LB_16184:
	mov rcx,r10
	bt r12,4
	jc LB_16189
	btr r12,6
	jmp LB_16190
LB_16189:
	bts r12,6
LB_16190:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_16187
	btr QWORD [rdi],4
	jmp LB_16188
LB_16187:
	bts QWORD [rdi],4
LB_16188:
	mov rsi,1
	bt r12,3
	jc LB_16169
	mov rsi,0
	bt r9,0
	jc LB_16169
	jmp LB_16170
LB_16169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16170:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16191:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16193
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16192
LB_16193:
	add rsp,8
	ret
LB_16195:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_16194:
	add rsp,48
	pop r14
LB_16192:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord
	jmp LB_16275
LB_16274:
	add r14,1
LB_16275:
	cmp r14,r10
	jge LB_16276
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16274
	cmp al,10
	jz LB_16274
	cmp al,32
	jz LB_16274
LB_16276:
	push r10
	call NS_E_13251_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16277
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16265
LB_16277:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_16280
LB_16279:
	add r14,1
LB_16280:
	cmp r14,r10
	jge LB_16281
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16279
	cmp al,10
	jz LB_16279
	cmp al,32
	jz LB_16279
LB_16281:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16282
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16283
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16283:
	jmp LB_16265
LB_16282:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_16286
LB_16285:
	add r14,1
LB_16286:
	cmp r14,r10
	jge LB_16287
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16285
	cmp al,10
	jz LB_16285
	cmp al,32
	jz LB_16285
LB_16287:
	push r10
	call NS_E_13246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16288
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16289
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16289:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16290
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16290:
	jmp LB_16265
LB_16288:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_16293
LB_16292:
	add r14,1
LB_16293:
	cmp r14,r10
	jge LB_16294
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16292
	cmp al,10
	jz LB_16292
	cmp al,32
	jz LB_16292
LB_16294:
	push r10
	call NS_E_13245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16295
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16296
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16296:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16297
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16297:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16298
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16298:
	jmp LB_16265
LB_16295:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16272
	btr r12,3
	jmp LB_16273
LB_16272:
	bts r12,3
LB_16273:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16270
	btr r12,2
	jmp LB_16271
LB_16270:
	bts r12,2
LB_16271:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16268
	btr r12,1
	jmp LB_16269
LB_16268:
	bts r12,1
LB_16269:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16266
	btr r12,0
	jmp LB_16267
LB_16266:
	bts r12,0
LB_16267:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_16262
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_16300
	btr r12,5
	jmp LB_16301
LB_16300:
	bts r12,5
LB_16301:
	mov rcx,r8
	bt r12,2
	jc LB_16302
	btr r12,6
	jmp LB_16303
LB_16302:
	bts r12,6
LB_16303:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_16306
	btr r12,7
	jmp LB_16307
LB_16306:
	bts r12,7
LB_16307:
	mov r8,rdx
	bt r12,7
	jc LB_16304
	btr r12,2
	jmp LB_16305
LB_16304:
	bts r12,2
LB_16305:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_16310
	btr r12,7
	jmp LB_16311
LB_16310:
	bts r12,7
LB_16311:
	mov r9,rdx
	bt r12,7
	jc LB_16308
	btr r12,3
	jmp LB_16309
LB_16308:
	bts r12,3
LB_16309:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_16314
	btr r12,7
	jmp LB_16315
LB_16314:
	bts r12,7
LB_16315:
	mov r10,rdx
	bt r12,7
	jc LB_16312
	btr r12,4
	jmp LB_16313
LB_16312:
	bts r12,4
LB_16313:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f10027 { %_13528 %_13529 %_13526 %_13527 %_13530 %_13531 } ⊢ %_13532 : %_13532
 ; {>  %_13526~0':_p9990 %_13527~1':_p9991 %_13529~3':_p10002 %_13531~5':_p9989 %_13530~4':(_opn)◂(_p9989) %_13528~2':_p9999 }
; _f10027 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_13532 ⊢ %_13533 : %_13533
 ; {>  %_13532~°0◂{ 2' 3' 0' 1' 4' 5' }:_p9989 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_13533
 ; {>  %_13533~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p9989) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_16234
	btr r12,6
	jmp LB_16235
LB_16234:
	bts r12,6
LB_16235:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_16240
	btr r12,7
	jmp LB_16241
LB_16240:
	bts r12,7
LB_16241:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_16238
	btr QWORD [rdi],0
	jmp LB_16239
LB_16238:
	bts QWORD [rdi],0
LB_16239:
	mov rdx,rcx
	bt r12,6
	jc LB_16244
	btr r12,7
	jmp LB_16245
LB_16244:
	bts r12,7
LB_16245:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_16242
	btr QWORD [rdi],1
	jmp LB_16243
LB_16242:
	bts QWORD [rdi],1
LB_16243:
	mov rdx,r13
	bt r12,0
	jc LB_16248
	btr r12,7
	jmp LB_16249
LB_16248:
	bts r12,7
LB_16249:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_16246
	btr QWORD [rdi],2
	jmp LB_16247
LB_16246:
	bts QWORD [rdi],2
LB_16247:
	mov rdx,r14
	bt r12,1
	jc LB_16252
	btr r12,7
	jmp LB_16253
LB_16252:
	bts r12,7
LB_16253:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_16250
	btr QWORD [rdi],3
	jmp LB_16251
LB_16250:
	bts QWORD [rdi],3
LB_16251:
	mov rdx,r10
	bt r12,4
	jc LB_16256
	btr r12,7
	jmp LB_16257
LB_16256:
	bts r12,7
LB_16257:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_16254
	btr QWORD [rdi],4
	jmp LB_16255
LB_16254:
	bts QWORD [rdi],4
LB_16255:
	mov rdx,r11
	bt r12,5
	jc LB_16260
	btr r12,7
	jmp LB_16261
LB_16260:
	bts r12,7
LB_16261:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_16258
	btr QWORD [rdi],5
	jmp LB_16259
LB_16258:
	bts QWORD [rdi],5
LB_16259:
	mov rsi,1
	bt r12,3
	jc LB_16236
	mov rsi,0
	bt r9,0
	jc LB_16236
	jmp LB_16237
LB_16236:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16237:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16262:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16264
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16263
LB_16264:
	add rsp,8
	ret
LB_16265:
	add rsp,64
	pop r14
LB_16263:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13246:
NS_E_RDI_13246:
NS_E_13246_ETR_TBL:
NS_E_13246_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_16370
LB_16369:
	add r14,1
LB_16370:
	cmp r14,r10
	jge LB_16371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16369
	cmp al,10
	jz LB_16369
	cmp al,32
	jz LB_16369
LB_16371:
	add r14,1
	cmp r14,r10
	jg LB_16374
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_16374
	jmp LB_16375
LB_16374:
	jmp LB_16333
LB_16375:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_16377
LB_16376:
	add r14,1
LB_16377:
	cmp r14,r10
	jge LB_16378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16376
	cmp al,10
	jz LB_16376
	cmp al,32
	jz LB_16376
LB_16378:
	add r14,3
	cmp r14,r10
	jg LB_16382
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16382
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_16382
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_16382
	jmp LB_16383
LB_16382:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16380
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16380:
	jmp LB_16333
LB_16383:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_16346
LB_16345:
	add r14,1
LB_16346:
	cmp r14,r10
	jge LB_16347
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16345
	cmp al,10
	jz LB_16345
	cmp al,32
	jz LB_16345
LB_16347:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16348
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16349
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16349:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16350
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16350:
	jmp LB_16334
LB_16348:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_16353
LB_16352:
	add r14,1
LB_16353:
	cmp r14,r10
	jge LB_16354
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16352
	cmp al,10
	jz LB_16352
	cmp al,32
	jz LB_16352
LB_16354:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16355
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16356
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16356:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16357
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16357:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16358:
	jmp LB_16334
LB_16355:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_16361
LB_16360:
	add r14,1
LB_16361:
	cmp r14,r10
	jge LB_16362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16360
	cmp al,10
	jz LB_16360
	cmp al,32
	jz LB_16360
LB_16362:
	push r10
	call NS_E_13245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16363
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_16364
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_16364:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16365
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16365:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16366
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16366:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16367
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16367:
	jmp LB_16334
LB_16363:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_16343
	btr r12,4
	jmp LB_16344
LB_16343:
	bts r12,4
LB_16344:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16341
	btr r12,3
	jmp LB_16342
LB_16341:
	bts r12,3
LB_16342:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16339
	btr r12,2
	jmp LB_16340
LB_16339:
	bts r12,2
LB_16340:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16337
	btr r12,1
	jmp LB_16338
LB_16337:
	bts r12,1
LB_16338:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16335
	btr r12,0
	jmp LB_16336
LB_16335:
	bts r12,0
LB_16336:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_16330
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_16384
	btr r12,5
	jmp LB_16385
LB_16384:
	bts r12,5
LB_16385:
	mov r8,r10
	bt r12,4
	jc LB_16386
	btr r12,2
	jmp LB_16387
LB_16386:
	bts r12,2
LB_16387:
	mov r10,r14
	bt r12,1
	jc LB_16388
	btr r12,4
	jmp LB_16389
LB_16388:
	bts r12,4
LB_16389:
	mov r14,r9
	bt r12,3
	jc LB_16390
	btr r12,1
	jmp LB_16391
LB_16390:
	bts r12,1
LB_16391:
	mov r9,r13
	bt r12,0
	jc LB_16392
	btr r12,3
	jmp LB_16393
LB_16392:
	bts r12,3
LB_16393:
	mov r13,r11
	bt r12,5
	jc LB_16394
	btr r12,0
	jmp LB_16395
LB_16394:
	bts r12,0
LB_16395:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13536 ⊢ %_13537 : %_13537
 ; {>  %_13534~0':_p9999 %_13535~1':_p10002 %_13536~2':_p9989 }
; _some 2' ⊢ °0◂2'
; _some { %_13534 %_13535 %_13537 } ⊢ %_13538 : %_13538
 ; {>  %_13537~°0◂2':(_opn)◂(_p9989) %_13534~0':_p9999 %_13535~1':_p10002 }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_13538
 ; {>  %_13538~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p9999 _p10002 (_opn)◂(_p9989) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_16318
	btr r12,4
	jmp LB_16319
LB_16318:
	bts r12,4
LB_16319:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_16316
	btr QWORD [rdi],0
	jmp LB_16317
LB_16316:
	bts QWORD [rdi],0
LB_16317:
	mov r10,r14
	bt r12,1
	jc LB_16322
	btr r12,4
	jmp LB_16323
LB_16322:
	bts r12,4
LB_16323:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_16320
	btr QWORD [rdi],1
	jmp LB_16321
LB_16320:
	bts QWORD [rdi],1
LB_16321:
	mov r10,r8
	bt r12,2
	jc LB_16328
	btr r12,4
	jmp LB_16329
LB_16328:
	bts r12,4
LB_16329:
	mov rsi,1
	bt r12,4
	jc LB_16326
	mov rsi,0
	bt r10,0
	jc LB_16326
	jmp LB_16327
LB_16326:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_16327:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_16324
	btr QWORD [rdi],2
	jmp LB_16325
LB_16324:
	bts QWORD [rdi],2
LB_16325:
	mov r8,0
	bts r12,2
	ret
LB_16330:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16332
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16331
LB_16332:
	add rsp,8
	ret
LB_16334:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_16333:
	add rsp,80
	pop r14
LB_16331:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_16433
LB_16432:
	add r14,1
LB_16433:
	cmp r14,r10
	jge LB_16434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16432
	cmp al,10
	jz LB_16432
	cmp al,32
	jz LB_16432
LB_16434:
	add r14,3
	cmp r14,r10
	jg LB_16437
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16437
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_16437
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_16437
	jmp LB_16438
LB_16437:
	jmp LB_16411
LB_16438:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_16420
LB_16419:
	add r14,1
LB_16420:
	cmp r14,r10
	jge LB_16421
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16419
	cmp al,10
	jz LB_16419
	cmp al,32
	jz LB_16419
LB_16421:
	push r10
	call NS_E_12631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16422
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16423
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16423:
	jmp LB_16412
LB_16422:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_16426
LB_16425:
	add r14,1
LB_16426:
	cmp r14,r10
	jge LB_16427
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16425
	cmp al,10
	jz LB_16425
	cmp al,32
	jz LB_16425
LB_16427:
	push r10
	call NS_E_13230_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16428
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16429
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16429:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16430
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16430:
	jmp LB_16412
LB_16428:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16417
	btr r12,2
	jmp LB_16418
LB_16417:
	bts r12,2
LB_16418:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16415
	btr r12,1
	jmp LB_16416
LB_16415:
	bts r12,1
LB_16416:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16413
	btr r12,0
	jmp LB_16414
LB_16413:
	bts r12,0
LB_16414:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16408
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_16439
	btr r12,3
	jmp LB_16440
LB_16439:
	bts r12,3
LB_16440:
	mov r14,r8
	bt r12,2
	jc LB_16441
	btr r12,1
	jmp LB_16442
LB_16441:
	bts r12,1
LB_16442:
	mov r8,r13
	bt r12,0
	jc LB_16443
	btr r12,2
	jmp LB_16444
LB_16443:
	bts r12,2
LB_16444:
	mov r13,r9
	bt r12,3
	jc LB_16445
	btr r12,0
	jmp LB_16446
LB_16445:
	bts r12,0
LB_16446:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_13541 : %_13541
 ; {>  %_13540~1':_p10002 %_13539~0':_p9999 }
; _none {  } ⊢ °1◂{  }
; _some { %_13539 %_13540 %_13541 } ⊢ %_13542 : %_13542
 ; {>  %_13540~1':_p10002 %_13539~0':_p9999 %_13541~°1◂{  }:(_opn)◂(t5399'(0)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_13542
 ; {>  %_13542~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p9999 _p10002 (_opn)◂(t5402'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_16398
	btr r12,2
	jmp LB_16399
LB_16398:
	bts r12,2
LB_16399:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_16396
	btr QWORD [rdi],0
	jmp LB_16397
LB_16396:
	bts QWORD [rdi],0
LB_16397:
	mov r8,r14
	bt r12,1
	jc LB_16402
	btr r12,2
	jmp LB_16403
LB_16402:
	bts r12,2
LB_16403:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_16400
	btr QWORD [rdi],1
	jmp LB_16401
LB_16400:
	bts QWORD [rdi],1
LB_16401:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_16406
	mov rsi,0
	bt r8,0
	jc LB_16406
	jmp LB_16407
LB_16406:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16407:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_16404
	btr QWORD [rdi],2
	jmp LB_16405
LB_16404:
	bts QWORD [rdi],2
LB_16405:
	mov r8,0
	bts r12,2
	ret
LB_16408:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16410
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16409
LB_16410:
	add rsp,8
	ret
LB_16412:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_16411:
	add rsp,48
	pop r14
LB_16409:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13247:
NS_E_RDI_13247:
NS_E_13247_ETR_TBL:
NS_E_13247_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "!|"
	jmp LB_16467
LB_16466:
	add r14,1
LB_16467:
	cmp r14,r10
	jge LB_16468
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16466
	cmp al,10
	jz LB_16466
	cmp al,32
	jz LB_16466
LB_16468:
	add r14,2
	cmp r14,r10
	jg LB_16471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_16471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_16471
	jmp LB_16472
LB_16471:
	jmp LB_16454
LB_16472:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_16461
LB_16460:
	add r14,1
LB_16461:
	cmp r14,r10
	jge LB_16462
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16460
	cmp al,10
	jz LB_16460
	cmp al,32
	jz LB_16460
LB_16462:
	push r10
	call NS_E_13248_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16463
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16464
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16464:
	jmp LB_16455
LB_16463:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16458
	btr r12,1
	jmp LB_16459
LB_16458:
	bts r12,1
LB_16459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16456
	btr r12,0
	jmp LB_16457
LB_16456:
	bts r12,0
LB_16457:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16451
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_16473
	btr r12,2
	jmp LB_16474
LB_16473:
	bts r12,2
LB_16474:
	mov r13,r14
	bt r12,1
	jc LB_16475
	btr r12,0
	jmp LB_16476
LB_16475:
	bts r12,0
LB_16476:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10032 %_13543 ⊢ %_13544 : %_13544
 ; {>  %_13543~0':_p9992 }
; _f10032 0' ⊢ °0◂0'
; _some %_13544 ⊢ %_13545 : %_13545
 ; {>  %_13544~°0◂0':_p9991 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13545
 ; {>  %_13545~°0◂°0◂0':(_opn)◂(_p9991) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16449
	btr r12,3
	jmp LB_16450
LB_16449:
	bts r12,3
LB_16450:
	mov rsi,1
	bt r12,3
	jc LB_16447
	mov rsi,0
	bt r9,0
	jc LB_16447
	jmp LB_16448
LB_16447:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16448:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16451:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16453
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16452
LB_16453:
	add rsp,8
	ret
LB_16455:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_16454:
	add rsp,32
	pop r14
LB_16452:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_16496
LB_16495:
	add r14,1
LB_16496:
	cmp r14,r10
	jge LB_16497
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16495
	cmp al,10
	jz LB_16495
	cmp al,32
	jz LB_16495
LB_16497:
	push r10
	call NS_E_13249_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16498
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16490
LB_16498:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_16501
LB_16500:
	add r14,1
LB_16501:
	cmp r14,r10
	jge LB_16502
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16500
	cmp al,10
	jz LB_16500
	cmp al,32
	jz LB_16500
LB_16502:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16503
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16504
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16504:
	jmp LB_16490
LB_16503:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16493
	btr r12,1
	jmp LB_16494
LB_16493:
	bts r12,1
LB_16494:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16491
	btr r12,0
	jmp LB_16492
LB_16491:
	bts r12,0
LB_16492:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16487
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10033 { %_13546 %_13547 } ⊢ %_13548 : %_13548
 ; {>  %_13547~1':_p9991 %_13546~0':_p9993 }
; _f10033 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_13548 ⊢ %_13549 : %_13549
 ; {>  %_13548~°1◂{ 0' 1' }:_p9991 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_13549
 ; {>  %_13549~°0◂°1◂{ 0' 1' }:(_opn)◂(_p9991) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_16481
	btr r12,2
	jmp LB_16482
LB_16481:
	bts r12,2
LB_16482:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_16479
	btr QWORD [rdi],0
	jmp LB_16480
LB_16479:
	bts QWORD [rdi],0
LB_16480:
	mov r8,r14
	bt r12,1
	jc LB_16485
	btr r12,2
	jmp LB_16486
LB_16485:
	bts r12,2
LB_16486:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_16483
	btr QWORD [rdi],1
	jmp LB_16484
LB_16483:
	bts QWORD [rdi],1
LB_16484:
	mov rsi,1
	bt r12,3
	jc LB_16477
	mov rsi,0
	bt r9,0
	jc LB_16477
	jmp LB_16478
LB_16477:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16478:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16487:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16489
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16488
LB_16489:
	add rsp,8
	ret
LB_16490:
	add rsp,32
	pop r14
LB_16488:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16508
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f10034 {  } ⊢ %_13550 : %_13550
 ; {>  }
; _f10034 {  } ⊢ °2◂{  }
; _some %_13550 ⊢ %_13551 : %_13551
 ; {>  %_13550~°2◂{  }:_p9991 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_13551
 ; {>  %_13551~°0◂°2◂{  }:(_opn)◂(_p9991) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16506
	mov rsi,0
	bt r9,0
	jc LB_16506
	jmp LB_16507
LB_16506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16507:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16508:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16510
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16509
LB_16510:
	add rsp,8
	ret
LB_16511:
	add rsp,0
	pop r14
LB_16509:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13248:
NS_E_RDI_13248:
NS_E_13248_ETR_TBL:
NS_E_13248_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_16531
LB_16530:
	add r14,1
LB_16531:
	cmp r14,r10
	jge LB_16532
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16530
	cmp al,10
	jz LB_16530
	cmp al,32
	jz LB_16530
LB_16532:
	push r10
	call NS_E_13249_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16533
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16525
LB_16533:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_16536
LB_16535:
	add r14,1
LB_16536:
	cmp r14,r10
	jge LB_16537
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16535
	cmp al,10
	jz LB_16535
	cmp al,32
	jz LB_16535
LB_16537:
	push r10
	call NS_E_13248_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16538
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16539:
	jmp LB_16525
LB_16538:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16528
	btr r12,1
	jmp LB_16529
LB_16528:
	bts r12,1
LB_16529:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16526
	btr r12,0
	jmp LB_16527
LB_16526:
	bts r12,0
LB_16527:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16522
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10035 { %_13552 %_13553 } ⊢ %_13554 : %_13554
 ; {>  %_13552~0':_p9993 %_13553~1':_p9992 }
; _f10035 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13554 ⊢ %_13555 : %_13555
 ; {>  %_13554~°0◂{ 0' 1' }:_p9992 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13555
 ; {>  %_13555~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9992) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_16516
	btr r12,2
	jmp LB_16517
LB_16516:
	bts r12,2
LB_16517:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_16514
	btr QWORD [rdi],0
	jmp LB_16515
LB_16514:
	bts QWORD [rdi],0
LB_16515:
	mov r8,r14
	bt r12,1
	jc LB_16520
	btr r12,2
	jmp LB_16521
LB_16520:
	bts r12,2
LB_16521:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_16518
	btr QWORD [rdi],1
	jmp LB_16519
LB_16518:
	bts QWORD [rdi],1
LB_16519:
	mov rsi,1
	bt r12,3
	jc LB_16512
	mov rsi,0
	bt r9,0
	jc LB_16512
	jmp LB_16513
LB_16512:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16513:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16522:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16524
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16523
LB_16524:
	add rsp,8
	ret
LB_16525:
	add rsp,32
	pop r14
LB_16523:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16543
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f10036 {  } ⊢ %_13556 : %_13556
 ; {>  }
; _f10036 {  } ⊢ °1◂{  }
; _some %_13556 ⊢ %_13557 : %_13557
 ; {>  %_13556~°1◂{  }:_p9992 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13557
 ; {>  %_13557~°0◂°1◂{  }:(_opn)◂(_p9992) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16541
	mov rsi,0
	bt r9,0
	jc LB_16541
	jmp LB_16542
LB_16541:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16542:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16543:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16545
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16544
LB_16545:
	add rsp,8
	ret
LB_16546:
	add rsp,0
	pop r14
LB_16544:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13249:
NS_E_RDI_13249:
NS_E_13249_ETR_TBL:
NS_E_13249_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_16562
LB_16561:
	add r14,1
LB_16562:
	cmp r14,r10
	jge LB_16563
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16561
	cmp al,10
	jz LB_16561
	cmp al,32
	jz LB_16561
LB_16563:
	add r14,3
	cmp r14,r10
	jg LB_16566
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16566
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_16566
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_16566
	jmp LB_16567
LB_16566:
	jmp LB_16554
LB_16567:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_16569
LB_16568:
	add r14,1
LB_16569:
	cmp r14,r10
	jge LB_16570
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16568
	cmp al,10
	jz LB_16568
	cmp al,32
	jz LB_16568
LB_16570:
	push r10
	call NS_E_13250_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16571
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16572
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16572:
	jmp LB_16554
LB_16571:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_16575
LB_16574:
	add r14,1
LB_16575:
	cmp r14,r10
	jge LB_16576
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16574
	cmp al,10
	jz LB_16574
	cmp al,32
	jz LB_16574
LB_16576:
	add r14,3
	cmp r14,r10
	jg LB_16581
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16581
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_16581
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_16581
	jmp LB_16582
LB_16581:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16578
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16578:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16579
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16579:
	jmp LB_16554
LB_16582:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16559
	btr r12,2
	jmp LB_16560
LB_16559:
	bts r12,2
LB_16560:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16557
	btr r12,1
	jmp LB_16558
LB_16557:
	bts r12,1
LB_16558:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16555
	btr r12,0
	jmp LB_16556
LB_16555:
	bts r12,0
LB_16556:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16551
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_16583
	btr r12,3
	jmp LB_16584
LB_16583:
	bts r12,3
LB_16584:
	mov r13,r14
	bt r12,1
	jc LB_16585
	btr r12,0
	jmp LB_16586
LB_16585:
	bts r12,0
LB_16586:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10037 %_13558 ⊢ %_13559 : %_13559
 ; {>  %_13558~0':_p9994 }
; _f10037 0' ⊢ °0◂0'
; _some %_13559 ⊢ %_13560 : %_13560
 ; {>  %_13559~°0◂0':_p9993 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13560
 ; {>  %_13560~°0◂°0◂0':(_opn)◂(_p9993) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16549
	btr r12,3
	jmp LB_16550
LB_16549:
	bts r12,3
LB_16550:
	mov rsi,1
	bt r12,3
	jc LB_16547
	mov rsi,0
	bt r9,0
	jc LB_16547
	jmp LB_16548
LB_16547:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16548:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16551:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16553
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16552
LB_16553:
	add rsp,8
	ret
LB_16554:
	add rsp,48
	pop r14
LB_16552:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_16598
LB_16597:
	add r14,1
LB_16598:
	cmp r14,r10
	jge LB_16599
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16597
	cmp al,10
	jz LB_16597
	cmp al,32
	jz LB_16597
LB_16599:
	push r10
	call NS_E_13250_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16600
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16594
LB_16600:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16595
	btr r12,0
	jmp LB_16596
LB_16595:
	bts r12,0
LB_16596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16591
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10038 %_13561 ⊢ %_13562 : %_13562
 ; {>  %_13561~0':_p9994 }
; _f10038 0' ⊢ °1◂0'
; _some %_13562 ⊢ %_13563 : %_13563
 ; {>  %_13562~°1◂0':_p9993 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13563
 ; {>  %_13563~°0◂°1◂0':(_opn)◂(_p9993) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16589
	btr r12,3
	jmp LB_16590
LB_16589:
	bts r12,3
LB_16590:
	mov rsi,1
	bt r12,3
	jc LB_16587
	mov rsi,0
	bt r9,0
	jc LB_16587
	jmp LB_16588
LB_16587:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16588:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16591:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16593
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16592
LB_16593:
	add rsp,8
	ret
LB_16594:
	add rsp,16
	pop r14
LB_16592:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13250:
NS_E_RDI_13250:
NS_E_13250_ETR_TBL:
NS_E_13250_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_16613
LB_16612:
	add r14,1
LB_16613:
	cmp r14,r10
	jge LB_16614
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16612
	cmp al,10
	jz LB_16612
	cmp al,32
	jz LB_16612
LB_16614:
	push r10
	call NS_E_9380_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16615
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16609
LB_16615:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16610
	btr r12,0
	jmp LB_16611
LB_16610:
	bts r12,0
LB_16611:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16606
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10040 %_13564 ⊢ %_13565 : %_13565
 ; {>  %_13564~0':_stg }
; _f10040 0' ⊢ °1◂0'
; _some %_13565 ⊢ %_13566 : %_13566
 ; {>  %_13565~°1◂0':_p9994 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13566
 ; {>  %_13566~°0◂°1◂0':(_opn)◂(_p9994) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16604
	btr r12,3
	jmp LB_16605
LB_16604:
	bts r12,3
LB_16605:
	mov rsi,1
	bt r12,3
	jc LB_16602
	mov rsi,0
	bt r9,0
	jc LB_16602
	jmp LB_16603
LB_16602:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16603:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16606:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16608
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16607
LB_16608:
	add rsp,8
	ret
LB_16609:
	add rsp,16
	pop r14
LB_16607:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_16628
LB_16627:
	add r14,1
LB_16628:
	cmp r14,r10
	jge LB_16629
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16627
	cmp al,10
	jz LB_16627
	cmp al,32
	jz LB_16627
LB_16629:
	push r10
	call NS_E_12171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16630
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16624
LB_16630:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16625
	btr r12,0
	jmp LB_16626
LB_16625:
	bts r12,0
LB_16626:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16621
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10039 %_13567 ⊢ %_13568 : %_13568
 ; {>  %_13567~0':_p9935 }
; _f10039 0' ⊢ °0◂0'
; _some %_13568 ⊢ %_13569 : %_13569
 ; {>  %_13568~°0◂0':_p9994 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13569
 ; {>  %_13569~°0◂°0◂0':(_opn)◂(_p9994) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16619
	btr r12,3
	jmp LB_16620
LB_16619:
	bts r12,3
LB_16620:
	mov rsi,1
	bt r12,3
	jc LB_16617
	mov rsi,0
	bt r9,0
	jc LB_16617
	jmp LB_16618
LB_16617:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16618:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16621:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16623
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16622
LB_16623:
	add rsp,8
	ret
LB_16624:
	add rsp,16
	pop r14
LB_16622:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13251:
NS_E_RDI_13251:
NS_E_13251_ETR_TBL:
NS_E_13251_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_16641
LB_16640:
	add r14,1
LB_16641:
	cmp r14,r10
	jge LB_16642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16640
	cmp al,10
	jz LB_16640
	cmp al,32
	jz LB_16640
LB_16642:
	add r14,4
	cmp r14,r10
	jg LB_16645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_16645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_16645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_16645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_16645
	jmp LB_16646
LB_16645:
	jmp LB_16637
LB_16646:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16638
	btr r12,0
	jmp LB_16639
LB_16638:
	bts r12,0
LB_16639:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16634
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10030 {  } ⊢ %_13570 : %_13570
 ; {>  }
; _f10030 {  } ⊢ °1◂{  }
; _some %_13570 ⊢ %_13571 : %_13571
 ; {>  %_13570~°1◂{  }:_p9990 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13571
 ; {>  %_13571~°0◂°1◂{  }:(_opn)◂(_p9990) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16632
	mov rsi,0
	bt r9,0
	jc LB_16632
	jmp LB_16633
LB_16632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16633:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16634:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16636
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16635
LB_16636:
	add rsp,8
	ret
LB_16637:
	add rsp,16
	pop r14
LB_16635:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_16656
LB_16655:
	add r14,1
LB_16656:
	cmp r14,r10
	jge LB_16657
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16655
	cmp al,10
	jz LB_16655
	cmp al,32
	jz LB_16655
LB_16657:
	add r14,4
	cmp r14,r10
	jg LB_16660
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_16660
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_16660
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_16660
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_16660
	jmp LB_16661
LB_16660:
	jmp LB_16652
LB_16661:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16653
	btr r12,0
	jmp LB_16654
LB_16653:
	bts r12,0
LB_16654:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16649
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10031 {  } ⊢ %_13572 : %_13572
 ; {>  }
; _f10031 {  } ⊢ °2◂{  }
; _some %_13572 ⊢ %_13573 : %_13573
 ; {>  %_13572~°2◂{  }:_p9990 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_13573
 ; {>  %_13573~°0◂°2◂{  }:(_opn)◂(_p9990) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16647
	mov rsi,0
	bt r9,0
	jc LB_16647
	jmp LB_16648
LB_16647:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16648:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16649:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16651
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16650
LB_16651:
	add rsp,8
	ret
LB_16652:
	add rsp,16
	pop r14
LB_16650:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_16671
LB_16670:
	add r14,1
LB_16671:
	cmp r14,r10
	jge LB_16672
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16670
	cmp al,10
	jz LB_16670
	cmp al,32
	jz LB_16670
LB_16672:
	add r14,3
	cmp r14,r10
	jg LB_16675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_16675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_16675
	jmp LB_16676
LB_16675:
	jmp LB_16667
LB_16676:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16668
	btr r12,0
	jmp LB_16669
LB_16668:
	bts r12,0
LB_16669:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16664
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10029 {  } ⊢ %_13574 : %_13574
 ; {>  }
; _f10029 {  } ⊢ °0◂{  }
; _some %_13574 ⊢ %_13575 : %_13575
 ; {>  %_13574~°0◂{  }:_p9990 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_13575
 ; {>  %_13575~°0◂°0◂{  }:(_opn)◂(_p9990) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16662
	mov rsi,0
	bt r9,0
	jc LB_16662
	jmp LB_16663
LB_16662:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16663:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16664:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16666
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16665
LB_16666:
	add rsp,8
	ret
LB_16667:
	add rsp,16
	pop r14
LB_16665:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13252:
NS_E_RDI_13252:
NS_E_13252_ETR_TBL:
NS_E_13252_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_16686
LB_16685:
	add r14,1
LB_16686:
	cmp r14,r10
	jge LB_16687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16685
	cmp al,10
	jz LB_16685
	cmp al,32
	jz LB_16685
LB_16687:
	add r14,5
	cmp r14,r10
	jg LB_16690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_16690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_16690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_16690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_16690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_16690
	jmp LB_16691
LB_16690:
	jmp LB_16682
LB_16691:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16683
	btr r12,0
	jmp LB_16684
LB_16683:
	bts r12,0
LB_16684:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16679
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10030 {  } ⊢ %_13576 : %_13576
 ; {>  }
; _f10030 {  } ⊢ °1◂{  }
; _some %_13576 ⊢ %_13577 : %_13577
 ; {>  %_13576~°1◂{  }:_p9990 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13577
 ; {>  %_13577~°0◂°1◂{  }:(_opn)◂(_p9990) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16677
	mov rsi,0
	bt r9,0
	jc LB_16677
	jmp LB_16678
LB_16677:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16678:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16679:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16681
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16680
LB_16681:
	add rsp,8
	ret
LB_16682:
	add rsp,16
	pop r14
LB_16680:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_16701
LB_16700:
	add r14,1
LB_16701:
	cmp r14,r10
	jge LB_16702
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16700
	cmp al,10
	jz LB_16700
	cmp al,32
	jz LB_16700
LB_16702:
	add r14,5
	cmp r14,r10
	jg LB_16705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_16705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_16705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_16705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_16705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_16705
	jmp LB_16706
LB_16705:
	jmp LB_16697
LB_16706:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16698
	btr r12,0
	jmp LB_16699
LB_16698:
	bts r12,0
LB_16699:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16694
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10031 {  } ⊢ %_13578 : %_13578
 ; {>  }
; _f10031 {  } ⊢ °2◂{  }
; _some %_13578 ⊢ %_13579 : %_13579
 ; {>  %_13578~°2◂{  }:_p9990 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_13579
 ; {>  %_13579~°0◂°2◂{  }:(_opn)◂(_p9990) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16692
	mov rsi,0
	bt r9,0
	jc LB_16692
	jmp LB_16693
LB_16692:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16693:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16694:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16696
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16695
LB_16696:
	add rsp,8
	ret
LB_16697:
	add rsp,16
	pop r14
LB_16695:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_16716
LB_16715:
	add r14,1
LB_16716:
	cmp r14,r10
	jge LB_16717
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16715
	cmp al,10
	jz LB_16715
	cmp al,32
	jz LB_16715
LB_16717:
	add r14,4
	cmp r14,r10
	jg LB_16720
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_16720
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_16720
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_16720
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_16720
	jmp LB_16721
LB_16720:
	jmp LB_16712
LB_16721:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16713
	btr r12,0
	jmp LB_16714
LB_16713:
	bts r12,0
LB_16714:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16709
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10029 {  } ⊢ %_13580 : %_13580
 ; {>  }
; _f10029 {  } ⊢ °0◂{  }
; _some %_13580 ⊢ %_13581 : %_13581
 ; {>  %_13580~°0◂{  }:_p9990 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_13581
 ; {>  %_13581~°0◂°0◂{  }:(_opn)◂(_p9990) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16707
	mov rsi,0
	bt r9,0
	jc LB_16707
	jmp LB_16708
LB_16707:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16708:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16709:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16711
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16710
LB_16711:
	add rsp,8
	ret
LB_16712:
	add rsp,16
	pop r14
LB_16710:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13253:
NS_E_RDI_13253:
NS_E_13253_ETR_TBL:
NS_E_13253_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_16777
LB_16776:
	add r14,1
LB_16777:
	cmp r14,r10
	jge LB_16778
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16776
	cmp al,10
	jz LB_16776
	cmp al,32
	jz LB_16776
LB_16778:
	push r10
	call NS_E_13252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16779
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16745
LB_16779:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_16756
LB_16755:
	add r14,1
LB_16756:
	cmp r14,r10
	jge LB_16757
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16755
	cmp al,10
	jz LB_16755
	cmp al,32
	jz LB_16755
LB_16757:
	push r10
	call NS_E_13255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16758
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16759
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16759:
	jmp LB_16746
LB_16758:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_16762
LB_16761:
	add r14,1
LB_16762:
	cmp r14,r10
	jge LB_16763
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16761
	cmp al,10
	jz LB_16761
	cmp al,32
	jz LB_16761
LB_16763:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16764
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16765
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16765:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16766
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16766:
	jmp LB_16746
LB_16764:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_16769
LB_16768:
	add r14,1
LB_16769:
	cmp r14,r10
	jge LB_16770
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16768
	cmp al,10
	jz LB_16768
	cmp al,32
	jz LB_16768
LB_16770:
	push r10
	call NS_E_13254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16771
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16772
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16772:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16773
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16773:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16774
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16774:
	jmp LB_16746
LB_16771:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16753
	btr r12,3
	jmp LB_16754
LB_16753:
	bts r12,3
LB_16754:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16751
	btr r12,2
	jmp LB_16752
LB_16751:
	bts r12,2
LB_16752:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16749
	btr r12,1
	jmp LB_16750
LB_16749:
	bts r12,1
LB_16750:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16747
	btr r12,0
	jmp LB_16748
LB_16747:
	bts r12,0
LB_16748:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_16742
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f10026 { %_13583 %_13582 %_13584 %_13585 } ⊢ %_13586 : %_13586
 ; {>  %_13583~1':(_opn)◂(_stg) %_13584~2':_p9991 %_13585~3':(_opn)◂(_p9988) %_13582~0':_p9990 }
; _f10026 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_13586 ⊢ %_13587 : %_13587
 ; {>  %_13586~°1◂{ 1' 0' 2' 3' }:_p9988 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_13587
 ; {>  %_13587~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p9988) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_16722
	btr r12,4
	jmp LB_16723
LB_16722:
	bts r12,4
LB_16723:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_16728
	btr r12,5
	jmp LB_16729
LB_16728:
	bts r12,5
LB_16729:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_16726
	btr QWORD [rdi],0
	jmp LB_16727
LB_16726:
	bts QWORD [rdi],0
LB_16727:
	mov r11,r13
	bt r12,0
	jc LB_16732
	btr r12,5
	jmp LB_16733
LB_16732:
	bts r12,5
LB_16733:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_16730
	btr QWORD [rdi],1
	jmp LB_16731
LB_16730:
	bts QWORD [rdi],1
LB_16731:
	mov r11,r8
	bt r12,2
	jc LB_16736
	btr r12,5
	jmp LB_16737
LB_16736:
	bts r12,5
LB_16737:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_16734
	btr QWORD [rdi],2
	jmp LB_16735
LB_16734:
	bts QWORD [rdi],2
LB_16735:
	mov r11,r10
	bt r12,4
	jc LB_16740
	btr r12,5
	jmp LB_16741
LB_16740:
	bts r12,5
LB_16741:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_16738
	btr QWORD [rdi],3
	jmp LB_16739
LB_16738:
	bts QWORD [rdi],3
LB_16739:
	mov rsi,1
	bt r12,3
	jc LB_16724
	mov rsi,0
	bt r9,0
	jc LB_16724
	jmp LB_16725
LB_16724:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16725:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16742:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16744
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16743
LB_16744:
	add rsp,8
	ret
LB_16746:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_16745:
	add rsp,64
	pop r14
LB_16743:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; grm_ord
	jmp LB_16820
LB_16819:
	add r14,1
LB_16820:
	cmp r14,r10
	jge LB_16821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16819
	cmp al,10
	jz LB_16819
	cmp al,32
	jz LB_16819
LB_16821:
	push r10
	call NS_E_13251_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16822
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16808
LB_16822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_16825
LB_16824:
	add r14,1
LB_16825:
	cmp r14,r10
	jge LB_16826
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16824
	cmp al,10
	jz LB_16824
	cmp al,32
	jz LB_16824
LB_16826:
	push r10
	call NS_E_13255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16827
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16828
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16828:
	jmp LB_16808
LB_16827:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_16831
LB_16830:
	add r14,1
LB_16831:
	cmp r14,r10
	jge LB_16832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16830
	cmp al,10
	jz LB_16830
	cmp al,32
	jz LB_16830
LB_16832:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16833
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16834
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16834:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16835
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16835:
	jmp LB_16808
LB_16833:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_16838
LB_16837:
	add r14,1
LB_16838:
	cmp r14,r10
	jge LB_16839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16837
	cmp al,10
	jz LB_16837
	cmp al,32
	jz LB_16837
LB_16839:
	push r10
	call NS_E_13254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16840
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16841
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16841:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16842
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16842:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16843:
	jmp LB_16808
LB_16840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_16846
LB_16845:
	add r14,1
LB_16846:
	cmp r14,r10
	jge LB_16847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16845
	cmp al,10
	jz LB_16845
	cmp al,32
	jz LB_16845
LB_16847:
	push r10
	call NS_E_13253_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16848
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_16849
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_16849:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16850
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16850:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16851
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16851:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16852
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16852:
	jmp LB_16808
LB_16848:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_16817
	btr r12,4
	jmp LB_16818
LB_16817:
	bts r12,4
LB_16818:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16815
	btr r12,3
	jmp LB_16816
LB_16815:
	bts r12,3
LB_16816:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16813
	btr r12,2
	jmp LB_16814
LB_16813:
	bts r12,2
LB_16814:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16811
	btr r12,1
	jmp LB_16812
LB_16811:
	bts r12,1
LB_16812:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16809
	btr r12,0
	jmp LB_16810
LB_16809:
	bts r12,0
LB_16810:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_16805
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f10025 { %_13589 %_13588 %_13590 %_13591 %_13592 } ⊢ %_13593 : %_13593
 ; {>  %_13592~4':_p9988 %_13590~2':_p9991 %_13589~1':(_opn)◂(_stg) %_13588~0':_p9990 %_13591~3':(_opn)◂(_p9988) }
; _f10025 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_13593 ⊢ %_13594 : %_13594
 ; {>  %_13593~°0◂{ 1' 0' 2' 3' 4' }:_p9988 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_13594
 ; {>  %_13594~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p9988) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_16781
	btr r12,5
	jmp LB_16782
LB_16781:
	bts r12,5
LB_16782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_16787
	btr r12,6
	jmp LB_16788
LB_16787:
	bts r12,6
LB_16788:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_16785
	btr QWORD [rdi],0
	jmp LB_16786
LB_16785:
	bts QWORD [rdi],0
LB_16786:
	mov rcx,r13
	bt r12,0
	jc LB_16791
	btr r12,6
	jmp LB_16792
LB_16791:
	bts r12,6
LB_16792:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_16789
	btr QWORD [rdi],1
	jmp LB_16790
LB_16789:
	bts QWORD [rdi],1
LB_16790:
	mov rcx,r8
	bt r12,2
	jc LB_16795
	btr r12,6
	jmp LB_16796
LB_16795:
	bts r12,6
LB_16796:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_16793
	btr QWORD [rdi],2
	jmp LB_16794
LB_16793:
	bts QWORD [rdi],2
LB_16794:
	mov rcx,r11
	bt r12,5
	jc LB_16799
	btr r12,6
	jmp LB_16800
LB_16799:
	bts r12,6
LB_16800:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_16797
	btr QWORD [rdi],3
	jmp LB_16798
LB_16797:
	bts QWORD [rdi],3
LB_16798:
	mov rcx,r10
	bt r12,4
	jc LB_16803
	btr r12,6
	jmp LB_16804
LB_16803:
	bts r12,6
LB_16804:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_16801
	btr QWORD [rdi],4
	jmp LB_16802
LB_16801:
	bts QWORD [rdi],4
LB_16802:
	mov rsi,1
	bt r12,3
	jc LB_16783
	mov rsi,0
	bt r9,0
	jc LB_16783
	jmp LB_16784
LB_16783:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16784:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16805:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16807
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16806
LB_16807:
	add rsp,8
	ret
LB_16808:
	add rsp,80
	pop r14
LB_16806:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13254:
NS_E_RDI_13254:
NS_E_13254_ETR_TBL:
NS_E_13254_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_16867
LB_16866:
	add r14,1
LB_16867:
	cmp r14,r10
	jge LB_16868
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16866
	cmp al,10
	jz LB_16866
	cmp al,32
	jz LB_16866
LB_16868:
	add r14,1
	cmp r14,r10
	jg LB_16871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_16871
	jmp LB_16872
LB_16871:
	jmp LB_16861
LB_16872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_16874
LB_16873:
	add r14,1
LB_16874:
	cmp r14,r10
	jge LB_16875
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16873
	cmp al,10
	jz LB_16873
	cmp al,32
	jz LB_16873
LB_16875:
	push r10
	call NS_E_13253_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16876
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16877
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16877:
	jmp LB_16861
LB_16876:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16864
	btr r12,1
	jmp LB_16865
LB_16864:
	bts r12,1
LB_16865:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16862
	btr r12,0
	jmp LB_16863
LB_16862:
	bts r12,0
LB_16863:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16858
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_16879
	btr r12,2
	jmp LB_16880
LB_16879:
	bts r12,2
LB_16880:
	mov r13,r14
	bt r12,1
	jc LB_16881
	btr r12,0
	jmp LB_16882
LB_16881:
	bts r12,0
LB_16882:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13595 ⊢ %_13596 : %_13596
 ; {>  %_13595~0':_p9988 }
; _some 0' ⊢ °0◂0'
; _some %_13596 ⊢ %_13597 : %_13597
 ; {>  %_13596~°0◂0':(_opn)◂(_p9988) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13597
 ; {>  %_13597~°0◂°0◂0':(_opn)◂((_opn)◂(_p9988)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16856
	btr r12,3
	jmp LB_16857
LB_16856:
	bts r12,3
LB_16857:
	mov rsi,1
	bt r12,3
	jc LB_16854
	mov rsi,0
	bt r9,0
	jc LB_16854
	jmp LB_16855
LB_16854:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16855:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16858:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16860
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16859
LB_16860:
	add rsp,8
	ret
LB_16861:
	add rsp,32
	pop r14
LB_16859:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16885
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_13598 : %_13598
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_13598 ⊢ %_13599 : %_13599
 ; {>  %_13598~°1◂{  }:(_opn)◂(t5480'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13599
 ; {>  %_13599~°0◂°1◂{  }:(_opn)◂((_opn)◂(t5483'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16883
	mov rsi,0
	bt r9,0
	jc LB_16883
	jmp LB_16884
LB_16883:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16884:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16885:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16887
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16886
LB_16887:
	add rsp,8
	ret
LB_16888:
	add rsp,0
	pop r14
LB_16886:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13255:
NS_E_RDI_13255:
NS_E_13255_ETR_TBL:
NS_E_13255_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_16902
LB_16901:
	add r14,1
LB_16902:
	cmp r14,r10
	jge LB_16903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16901
	cmp al,10
	jz LB_16901
	cmp al,32
	jz LB_16901
LB_16903:
	push r10
	call NS_E_9748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16904
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16896
LB_16904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_16907
LB_16906:
	add r14,1
LB_16907:
	cmp r14,r10
	jge LB_16908
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16906
	cmp al,10
	jz LB_16906
	cmp al,32
	jz LB_16906
LB_16908:
	add r14,1
	cmp r14,r10
	jg LB_16912
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_16912
	jmp LB_16913
LB_16912:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16910
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16910:
	jmp LB_16896
LB_16913:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16899
	btr r12,1
	jmp LB_16900
LB_16899:
	bts r12,1
LB_16900:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16897
	btr r12,0
	jmp LB_16898
LB_16897:
	bts r12,0
LB_16898:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16893
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13600 ⊢ %_13601 : %_13601
 ; {>  %_13600~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_13601 ⊢ %_13602 : %_13602
 ; {>  %_13601~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13602
 ; {>  %_13602~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16891
	btr r12,3
	jmp LB_16892
LB_16891:
	bts r12,3
LB_16892:
	mov rsi,1
	bt r12,3
	jc LB_16889
	mov rsi,0
	bt r9,0
	jc LB_16889
	jmp LB_16890
LB_16889:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16890:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16893:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16895
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16894
LB_16895:
	add rsp,8
	ret
LB_16896:
	add rsp,32
	pop r14
LB_16894:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16916
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_13603 : %_13603
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_13603 ⊢ %_13604 : %_13604
 ; {>  %_13603~°1◂{  }:(_opn)◂(t5492'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13604
 ; {>  %_13604~°0◂°1◂{  }:(_opn)◂((_opn)◂(t5495'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16914
	mov rsi,0
	bt r9,0
	jc LB_16914
	jmp LB_16915
LB_16914:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16915:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16916:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16918
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16917
LB_16918:
	add rsp,8
	ret
LB_16919:
	add rsp,0
	pop r14
LB_16917:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_16963:
NS_E_RDI_16963:
; » _^ ..
	mov rax,104
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167\194\167 m1 = m2 \n"
	mov rsi,0x_31_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_32
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; " \194\167 f0 = f1 \n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; " \194\167\194\167 m3 \n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \226\136\142\226\136\142 \n"
	mov rsi,0x_20_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\194\167\194\167 In0 \n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \194\167 C1 \194\171 \n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; "\t\t\226\136\142 {} \n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_16921 : %_16921
 ; {>  %_16920~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_16921
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f15 |~ {  } ⊢ %_16922 : %_16922
 ; {>  %_16920~0':_stg %_16921~1':_r64 }
; 	» _args _ ⊢ 2' : %_16922
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,[args]
	clc
	call dcp
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	mov r8,rax
	btr r12,2
MTC_LB_16964:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_16965
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_16966
	bt QWORD [rdi],0
	jc LB_16967
	btr r12,5
	jmp LB_16968
LB_16967:
	bts r12,5
LB_16968:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16966:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_16971
	btr r12,6
	jmp LB_16972
LB_16971:
	bts r12,6
LB_16972:
	mov r9,rcx
	bt r12,6
	jc LB_16969
	btr r12,3
	jmp LB_16970
LB_16969:
	bts r12,3
LB_16970:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_16975
	btr r12,6
	jmp LB_16976
LB_16975:
	bts r12,6
LB_16976:
	mov r10,rcx
	bt r12,6
	jc LB_16973
	btr r12,4
	jmp LB_16974
LB_16973:
	bts r12,4
LB_16974:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_16965
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_16977
	bt QWORD [rdi],0
	jc LB_16978
	btr r12,7
	jmp LB_16979
LB_16978:
	bts r12,7
LB_16979:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16977:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_16982
	btr r12,8
	jmp LB_16983
LB_16982:
	bts r12,8
LB_16983:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_16980
	btr r12,5
	jmp LB_16981
LB_16980:
	bts r12,5
LB_16981:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_16986
	btr r12,8
	jmp LB_16987
LB_16986:
	bts r12,8
LB_16987:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_16984
	btr r12,6
	jmp LB_16985
LB_16984:
	bts r12,6
LB_16985:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_16965
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_16988
	bt QWORD [rdi],0
	jc LB_16989
	btr r12,7
	jmp LB_16990
LB_16989:
	bts r12,7
LB_16990:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16988:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_16991:
	cmp r15,0
	jz LB_16992
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16991
LB_16992:
; _f25 %_16925 ⊢ { %_16927 %_16928 } : { %_16927 %_16928 }
 ; {>  %_16920~0':_stg %_16925~5':_stg %_16921~1':_r64 %_16923~3':_stg }
; _f25 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_16999
	btr r12,0
	jmp LB_17000
LB_16999:
	bts r12,0
LB_17000:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_17001
	btr r12,2
	jmp LB_17002
LB_17001:
	bts r12,2
LB_17002:
	mov r10,r14
	bt r12,1
	jc LB_17003
	btr r12,4
	jmp LB_17004
LB_17003:
	bts r12,4
LB_17004:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_16997
	btr r12,3
	jmp LB_16998
LB_16997:
	bts r12,3
LB_16998:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16995
	btr r12,1
	jmp LB_16996
LB_16995:
	bts r12,1
LB_16996:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16993
	btr r12,0
	jmp LB_16994
LB_16993:
	bts r12,0
LB_16994:
	add rsp,32
; _f12106 %_16928 ⊢ { %_16929 %_16930 } : { %_16929 %_16930 }
 ; {>  %_16927~2':_stg %_16920~0':_stg %_16928~4':_stg %_16921~1':_r64 %_16923~3':_stg }
; _f12106 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_17013
	btr r12,0
	jmp LB_17014
LB_17013:
	bts r12,0
LB_17014:
	call NS_E_12106
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_17015
	btr r12,4
	jmp LB_17016
LB_17015:
	bts r12,4
LB_17016:
	mov r11,r14
	bt r12,1
	jc LB_17017
	btr r12,5
	jmp LB_17018
LB_17017:
	bts r12,5
LB_17018:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17011
	btr r12,3
	jmp LB_17012
LB_17011:
	bts r12,3
LB_17012:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17009
	btr r12,2
	jmp LB_17010
LB_17009:
	bts r12,2
LB_17010:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17007
	btr r12,1
	jmp LB_17008
LB_17007:
	bts r12,1
LB_17008:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17005
	btr r12,0
	jmp LB_17006
LB_17005:
	bts r12,0
LB_17006:
	add rsp,40
MTC_LB_17019:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_17020
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_17021
	bt QWORD [rdi],0
	jc LB_17022
	btr r12,7
	jmp LB_17023
LB_17022:
	bts r12,7
LB_17023:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_17021:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_17024
	btr r12,6
	jmp LB_17025
LB_17024:
	bts r12,6
LB_17025:
LB_17026:
	cmp r15,0
	jz LB_17027
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17026
LB_17027:
; » 0xr0 |~ {  } ⊢ %_16932 : %_16932
 ; {>  %_16927~2':_stg %_16920~0':_stg %_16929~4':_stg %_16931~6':_stg %_16921~1':_r64 %_16923~3':_stg }
; 	» 0xr0 _ ⊢ 5' : %_16932
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f13216 { %_16931 %_16932 } ⊢ { %_16933 %_16934 %_16935 } : { %_16933 %_16934 %_16935 }
 ; {>  %_16927~2':_stg %_16920~0':_stg %_16932~5':_r64 %_16929~4':_stg %_16931~6':_stg %_16921~1':_r64 %_16923~3':_stg }
; _f13216 { 6' 5' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000110.. |},{ 6' 5' } ⊢ { 0' 1' }
	mov r13,rcx
	bt r12,6
	jc LB_17038
	btr r12,0
	jmp LB_17039
LB_17038:
	bts r12,0
LB_17039:
	mov r14,r11
	bt r12,5
	jc LB_17040
	btr r12,1
	jmp LB_17041
LB_17040:
	bts r12,1
LB_17041:
	call NS_E_13216
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_17042
	btr r12,5
	jmp LB_17043
LB_17042:
	bts r12,5
LB_17043:
	mov rcx,r14
	bt r12,1
	jc LB_17044
	btr r12,6
	jmp LB_17045
LB_17044:
	bts r12,6
LB_17045:
	mov rdx,r9
	bt r12,3
	jc LB_17048
	btr r12,7
	jmp LB_17049
LB_17048:
	bts r12,7
LB_17049:
	mov rsi,1
	bt r12,7
	jc LB_17046
	mov rsi,0
	bt rdx,0
	jc LB_17046
	jmp LB_17047
LB_17046:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_17047:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17036
	btr r12,4
	jmp LB_17037
LB_17036:
	bts r12,4
LB_17037:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17034
	btr r12,3
	jmp LB_17035
LB_17034:
	bts r12,3
LB_17035:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17032
	btr r12,2
	jmp LB_17033
LB_17032:
	bts r12,2
LB_17033:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17030
	btr r12,1
	jmp LB_17031
LB_17030:
	bts r12,1
LB_17031:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17028
	btr r12,0
	jmp LB_17029
LB_17028:
	bts r12,0
LB_17029:
	add rsp,48
MTC_LB_17050:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_17051
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rdx
	bt QWORD [rdi],17
	jnc LB_17052
	bt QWORD [rdi],0
	jc LB_17053
	btr r12,9
	jmp LB_17054
LB_17053:
	bts r12,9
LB_17054:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_17052:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_17055
	btr r12,8
	jmp LB_17056
LB_17055:
	bts r12,8
LB_17056:
LB_17057:
	cmp r15,0
	jz LB_17058
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17057
LB_17058:
; _f10128 %_16936 ⊢ %_16937 : %_16937
 ; {>  %_16933~5':_stg %_16927~2':_stg %_16920~0':_stg %_16929~4':_stg %_16934~6':_r64 %_16921~1':_r64 %_16936~8':(_lst)◂(_p9983) %_16923~3':_stg }
; _f10128 8' ⊢ 7'
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_17073
	btr r12,0
	jmp LB_17074
LB_17073:
	bts r12,0
LB_17074:
	call NS_E_10128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 7'
	mov rdx,r13
	bt r12,0
	jc LB_17075
	btr r12,7
	jmp LB_17076
LB_17075:
	bts r12,7
LB_17076:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_17071
	btr r12,6
	jmp LB_17072
LB_17071:
	bts r12,6
LB_17072:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_17069
	btr r12,5
	jmp LB_17070
LB_17069:
	bts r12,5
LB_17070:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17067
	btr r12,4
	jmp LB_17068
LB_17067:
	bts r12,4
LB_17068:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17065
	btr r12,3
	jmp LB_17066
LB_17065:
	bts r12,3
LB_17066:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17063
	btr r12,2
	jmp LB_17064
LB_17063:
	bts r12,2
LB_17064:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17061
	btr r12,1
	jmp LB_17062
LB_17061:
	bts r12,1
LB_17062:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17059
	btr r12,0
	jmp LB_17060
LB_17059:
	bts r12,0
LB_17060:
	add rsp,64
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,rdx
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "START\n"
	mov rsi,0x_53
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_41
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,rdx
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "END\n"
	mov rsi,0x_45
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; //
	mov QWORD [st_vct+8*8],rax
	btr r12,8
; _f26 %_16939 ⊢ %_16940 : %_16940
 ; {>  %_16933~5':_stg %_16939~8':_stg %_16927~2':_stg %_16920~0':_stg %_16929~4':_stg %_16934~6':_r64 %_16921~1':_r64 %_16938~7':_stg %_16923~3':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_17093
	btr r12,0
	jmp LB_17094
LB_17093:
	bts r12,0
LB_17094:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_17095
	btr r12,8
	jmp LB_17096
LB_17095:
	bts r12,8
LB_17096:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_17091
	btr r12,7
	jmp LB_17092
LB_17091:
	bts r12,7
LB_17092:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_17089
	btr r12,6
	jmp LB_17090
LB_17089:
	bts r12,6
LB_17090:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_17087
	btr r12,5
	jmp LB_17088
LB_17087:
	bts r12,5
LB_17088:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17085
	btr r12,4
	jmp LB_17086
LB_17085:
	bts r12,4
LB_17086:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17083
	btr r12,3
	jmp LB_17084
LB_17083:
	bts r12,3
LB_17084:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17081
	btr r12,2
	jmp LB_17082
LB_17081:
	bts r12,2
LB_17082:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17079
	btr r12,1
	jmp LB_17080
LB_17079:
	bts r12,1
LB_17080:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17077
	btr r12,0
	jmp LB_17078
LB_17077:
	bts r12,0
LB_17078:
	add rsp,72
; ∎ {  }
 ; {>  %_16933~5':_stg %_16927~2':_stg %_16920~0':_stg %_16940~8':_stg %_16929~4':_stg %_16934~6':_r64 %_16921~1':_r64 %_16938~7':_stg %_16923~3':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_17097
	mov rdi,r11
	call dlt
LB_17097:
	bt r12,2
	jc LB_17098
	mov rdi,r8
	call dlt
LB_17098:
	bt r12,0
	jc LB_17099
	mov rdi,r13
	call dlt
LB_17099:
	bt r12,8
	jc LB_17100
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_17100:
	bt r12,4
	jc LB_17101
	mov rdi,r10
	call dlt
LB_17101:
	bt r12,6
	jc LB_17102
	mov rdi,rcx
	call dlt
LB_17102:
	bt r12,1
	jc LB_17103
	mov rdi,r14
	call dlt
LB_17103:
	bt r12,7
	jc LB_17104
	mov rdi,rdx
	call dlt
LB_17104:
	bt r12,3
	jc LB_17105
	mov rdi,r9
	call dlt
LB_17105:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_17051:
	mov r15,0
LB_17107:
	cmp r15,0
	jz LB_17108
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17107
LB_17108:
; 	» "H0\n" _ ⊢ 8' : %_16941
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f26 %_16941 ⊢ %_16942 : %_16942
 ; {>  %_16933~5':_stg %_16927~2':_stg %_16920~0':_stg %_16935~7':(_opn)◂((_lst)◂(_p9983)) %_16929~4':_stg %_16941~8':_stg %_16934~6':_r64 %_16921~1':_r64 %_16923~3':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_17125
	btr r12,0
	jmp LB_17126
LB_17125:
	bts r12,0
LB_17126:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_17127
	btr r12,8
	jmp LB_17128
LB_17127:
	bts r12,8
LB_17128:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_17123
	btr r12,7
	jmp LB_17124
LB_17123:
	bts r12,7
LB_17124:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_17121
	btr r12,6
	jmp LB_17122
LB_17121:
	bts r12,6
LB_17122:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_17119
	btr r12,5
	jmp LB_17120
LB_17119:
	bts r12,5
LB_17120:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17117
	btr r12,4
	jmp LB_17118
LB_17117:
	bts r12,4
LB_17118:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17115
	btr r12,3
	jmp LB_17116
LB_17115:
	bts r12,3
LB_17116:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17113
	btr r12,2
	jmp LB_17114
LB_17113:
	bts r12,2
LB_17114:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17111
	btr r12,1
	jmp LB_17112
LB_17111:
	bts r12,1
LB_17112:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17109
	btr r12,0
	jmp LB_17110
LB_17109:
	bts r12,0
LB_17110:
	add rsp,72
; ∎ {  }
 ; {>  %_16933~5':_stg %_16927~2':_stg %_16920~0':_stg %_16935~7':(_opn)◂((_lst)◂(_p9983)) %_16929~4':_stg %_16942~8':_stg %_16934~6':_r64 %_16921~1':_r64 %_16923~3':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_17129
	mov rdi,r11
	call dlt
LB_17129:
	bt r12,2
	jc LB_17130
	mov rdi,r8
	call dlt
LB_17130:
	bt r12,0
	jc LB_17131
	mov rdi,r13
	call dlt
LB_17131:
	bt r12,7
	jc LB_17132
	mov rdi,rdx
	call dlt
LB_17132:
	bt r12,4
	jc LB_17133
	mov rdi,r10
	call dlt
LB_17133:
	bt r12,8
	jc LB_17134
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_17134:
	bt r12,6
	jc LB_17135
	mov rdi,rcx
	call dlt
LB_17135:
	bt r12,1
	jc LB_17136
	mov rdi,r14
	call dlt
LB_17136:
	bt r12,3
	jc LB_17137
	mov rdi,r9
	call dlt
LB_17137:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_17106:
MTC_LB_17020:
	mov r15,0
LB_17139:
	cmp r15,0
	jz LB_17140
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17139
LB_17140:
; 	» "H1\n" _ ⊢ 6' : %_16943
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f26 %_16943 ⊢ %_16944 : %_16944
 ; {>  %_16927~2':_stg %_16920~0':_stg %_16929~4':_stg %_16930~5':(_opn)◂(_stg) %_16943~6':_stg %_16921~1':_r64 %_16923~3':_stg }
; _f26 6' ⊢ 6'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_17153
	btr r12,0
	jmp LB_17154
LB_17153:
	bts r12,0
LB_17154:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_17155
	btr r12,6
	jmp LB_17156
LB_17155:
	bts r12,6
LB_17156:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_17151
	btr r12,5
	jmp LB_17152
LB_17151:
	bts r12,5
LB_17152:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17149
	btr r12,4
	jmp LB_17150
LB_17149:
	bts r12,4
LB_17150:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17147
	btr r12,3
	jmp LB_17148
LB_17147:
	bts r12,3
LB_17148:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17145
	btr r12,2
	jmp LB_17146
LB_17145:
	bts r12,2
LB_17146:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17143
	btr r12,1
	jmp LB_17144
LB_17143:
	bts r12,1
LB_17144:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17141
	btr r12,0
	jmp LB_17142
LB_17141:
	bts r12,0
LB_17142:
	add rsp,56
; ∎ {  }
 ; {>  %_16927~2':_stg %_16944~6':_stg %_16920~0':_stg %_16929~4':_stg %_16930~5':(_opn)◂(_stg) %_16921~1':_r64 %_16923~3':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_17157
	mov rdi,r8
	call dlt
LB_17157:
	bt r12,6
	jc LB_17158
	mov rdi,rcx
	call dlt
LB_17158:
	bt r12,0
	jc LB_17159
	mov rdi,r13
	call dlt
LB_17159:
	bt r12,4
	jc LB_17160
	mov rdi,r10
	call dlt
LB_17160:
	bt r12,5
	jc LB_17161
	mov rdi,r11
	call dlt
LB_17161:
	bt r12,1
	jc LB_17162
	mov rdi,r14
	call dlt
LB_17162:
	bt r12,3
	jc LB_17163
	mov rdi,r9
	call dlt
LB_17163:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_17138:
MTC_LB_16965:
	mov r15,0
LB_17165:
	cmp r15,0
	jz LB_17166
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17165
LB_17166:
; _f13216 { %_16920 %_16921 } ⊢ { %_16945 %_16946 %_16947 } : { %_16945 %_16946 %_16947 }
 ; {>  %_16922~2':(_lst)◂(_stg) %_16920~0':_stg %_16921~1':_r64 }
; _f13216 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_13216
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_17169
	btr r12,4
	jmp LB_17170
LB_17169:
	bts r12,4
LB_17170:
	mov r9,r10
	bt r12,4
	jc LB_17173
	btr r12,3
	jmp LB_17174
LB_17173:
	bts r12,3
LB_17174:
	mov rsi,1
	bt r12,3
	jc LB_17171
	mov rsi,0
	bt r9,0
	jc LB_17171
	jmp LB_17172
LB_17171:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17172:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_17167
	btr r12,2
	jmp LB_17168
LB_17167:
	bts r12,2
LB_17168:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_16948
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f25 %_16948 ⊢ { %_16949 %_16950 } : { %_16949 %_16950 }
 ; {>  %_16922~2':(_lst)◂(_stg) %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16946~1':_r64 %_16948~4':_stg %_16945~0':_stg }
; _f25 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_17183
	btr r12,0
	jmp LB_17184
LB_17183:
	bts r12,0
LB_17184:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_17185
	btr r12,4
	jmp LB_17186
LB_17185:
	bts r12,4
LB_17186:
	mov r11,r14
	bt r12,1
	jc LB_17187
	btr r12,5
	jmp LB_17188
LB_17187:
	bts r12,5
LB_17188:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17181
	btr r12,3
	jmp LB_17182
LB_17181:
	bts r12,3
LB_17182:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17179
	btr r12,2
	jmp LB_17180
LB_17179:
	bts r12,2
LB_17180:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17177
	btr r12,1
	jmp LB_17178
LB_17177:
	bts r12,1
LB_17178:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17175
	btr r12,0
	jmp LB_17176
LB_17175:
	bts r12,0
LB_17176:
	add rsp,40
; _f26 { %_16949 %_16950 } ⊢ { %_16951 %_16952 } : { %_16951 %_16952 }
 ; {>  %_16922~2':(_lst)◂(_stg) %_16950~5':_stg %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16949~4':_stg %_16946~1':_r64 %_16945~0':_stg }
; _f26 { 4' 5' } ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_17199
	btr r12,1
	jmp LB_17200
LB_17199:
	bts r12,1
LB_17200:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_17197
	btr QWORD [rdi],0
	jmp LB_17198
LB_17197:
	bts QWORD [rdi],0
LB_17198:
	mov r14,r11
	bt r12,5
	jc LB_17203
	btr r12,1
	jmp LB_17204
LB_17203:
	bts r12,1
LB_17204:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_17201
	btr QWORD [rdi],1
	jmp LB_17202
LB_17201:
	bts QWORD [rdi],1
LB_17202:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_17207
	btr r12,1
	jmp LB_17208
LB_17207:
	bts r12,1
LB_17208:
	mov r10,r14
	bt r12,1
	jc LB_17205
	btr r12,4
	jmp LB_17206
LB_17205:
	bts r12,4
LB_17206:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_17211
	btr r12,1
	jmp LB_17212
LB_17211:
	bts r12,1
LB_17212:
	mov r11,r14
	bt r12,1
	jc LB_17209
	btr r12,5
	jmp LB_17210
LB_17209:
	bts r12,5
LB_17210:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17195
	btr r12,3
	jmp LB_17196
LB_17195:
	bts r12,3
LB_17196:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17193
	btr r12,2
	jmp LB_17194
LB_17193:
	bts r12,2
LB_17194:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17191
	btr r12,1
	jmp LB_17192
LB_17191:
	bts r12,1
LB_17192:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17189
	btr r12,0
	jmp LB_17190
LB_17189:
	bts r12,0
LB_17190:
	add rsp,40
; _f12106 %_16952 ⊢ { %_16953 %_16954 } : { %_16953 %_16954 }
 ; {>  %_16952~5':_stg %_16922~2':(_lst)◂(_stg) %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16946~1':_r64 %_16951~4':_stg %_16945~0':_stg }
; _f12106 5' ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_17223
	btr r12,0
	jmp LB_17224
LB_17223:
	bts r12,0
LB_17224:
	call NS_E_12106
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_17225
	btr r12,5
	jmp LB_17226
LB_17225:
	bts r12,5
LB_17226:
	mov rcx,r14
	bt r12,1
	jc LB_17227
	btr r12,6
	jmp LB_17228
LB_17227:
	bts r12,6
LB_17228:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17221
	btr r12,4
	jmp LB_17222
LB_17221:
	bts r12,4
LB_17222:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17219
	btr r12,3
	jmp LB_17220
LB_17219:
	bts r12,3
LB_17220:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17217
	btr r12,2
	jmp LB_17218
LB_17217:
	bts r12,2
LB_17218:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17215
	btr r12,1
	jmp LB_17216
LB_17215:
	bts r12,1
LB_17216:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17213
	btr r12,0
	jmp LB_17214
LB_17213:
	bts r12,0
LB_17214:
	add rsp,48
MTC_LB_17229:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_17230
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_17231
	bt QWORD [rdi],0
	jc LB_17232
	btr r12,8
	jmp LB_17233
LB_17232:
	bts r12,8
LB_17233:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_17231:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_17234
	btr r12,7
	jmp LB_17235
LB_17234:
	bts r12,7
LB_17235:
LB_17236:
	cmp r15,0
	jz LB_17237
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17236
LB_17237:
; » 0xr0 |~ {  } ⊢ %_16956 : %_16956
 ; {>  %_16922~2':(_lst)◂(_stg) %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16946~1':_r64 %_16953~5':_stg %_16951~4':_stg %_16945~0':_stg %_16955~7':_stg }
; 	» 0xr0 _ ⊢ 6' : %_16956
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f13216 { %_16955 %_16956 } ⊢ { %_16957 %_16958 %_16959 } : { %_16957 %_16958 %_16959 }
 ; {>  %_16922~2':(_lst)◂(_stg) %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16946~1':_r64 %_16953~5':_stg %_16951~4':_stg %_16945~0':_stg %_16955~7':_stg %_16956~6':_r64 }
; _f13216 { 7' 6' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000000110.. |},{ 7' 6' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_17250
	btr r12,0
	jmp LB_17251
LB_17250:
	bts r12,0
LB_17251:
	mov r14,rcx
	bt r12,6
	jc LB_17252
	btr r12,1
	jmp LB_17253
LB_17252:
	bts r12,1
LB_17253:
	call NS_E_13216
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_17254
	btr r12,6
	jmp LB_17255
LB_17254:
	bts r12,6
LB_17255:
	mov rdx,r14
	bt r12,1
	jc LB_17256
	btr r12,7
	jmp LB_17257
LB_17256:
	bts r12,7
LB_17257:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_17260
	btr r12,8
	jmp LB_17261
LB_17260:
	bts r12,8
LB_17261:
	mov rsi,1
	bt r12,8
	jc LB_17258
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_17258
	jmp LB_17259
LB_17258:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_17259:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_17248
	btr r12,5
	jmp LB_17249
LB_17248:
	bts r12,5
LB_17249:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17246
	btr r12,4
	jmp LB_17247
LB_17246:
	bts r12,4
LB_17247:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17244
	btr r12,3
	jmp LB_17245
LB_17244:
	bts r12,3
LB_17245:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17242
	btr r12,2
	jmp LB_17243
LB_17242:
	bts r12,2
LB_17243:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17240
	btr r12,1
	jmp LB_17241
LB_17240:
	bts r12,1
LB_17241:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17238
	btr r12,0
	jmp LB_17239
LB_17238:
	bts r12,0
LB_17239:
	add rsp,56
; _f26 { %_16957 %_16958 %_16959 } ⊢ { %_16960 %_16961 %_16962 } : { %_16960 %_16961 %_16962 }
 ; {>  %_16922~2':(_lst)◂(_stg) %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16946~1':_r64 %_16957~6':_stg %_16953~5':_stg %_16951~4':_stg %_16959~8':(_opn)◂((_lst)◂(_p9983)) %_16958~7':_r64 %_16945~0':_stg }
; _f26 { 6' 7' 8' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000001110.. |},{ 6' 7' 8' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_17276
	btr r12,1
	jmp LB_17277
LB_17276:
	bts r12,1
LB_17277:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_17274
	btr QWORD [rdi],0
	jmp LB_17275
LB_17274:
	bts QWORD [rdi],0
LB_17275:
	mov r14,rdx
	bt r12,7
	jc LB_17280
	btr r12,1
	jmp LB_17281
LB_17280:
	bts r12,1
LB_17281:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_17278
	btr QWORD [rdi],1
	jmp LB_17279
LB_17278:
	bts QWORD [rdi],1
LB_17279:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_17284
	btr r12,1
	jmp LB_17285
LB_17284:
	bts r12,1
LB_17285:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_17282
	btr QWORD [rdi],2
	jmp LB_17283
LB_17282:
	bts QWORD [rdi],2
LB_17283:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_17288
	btr r12,1
	jmp LB_17289
LB_17288:
	bts r12,1
LB_17289:
	mov rcx,r14
	bt r12,1
	jc LB_17286
	btr r12,6
	jmp LB_17287
LB_17286:
	bts r12,6
LB_17287:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_17292
	btr r12,1
	jmp LB_17293
LB_17292:
	bts r12,1
LB_17293:
	mov rdx,r14
	bt r12,1
	jc LB_17290
	btr r12,7
	jmp LB_17291
LB_17290:
	bts r12,7
LB_17291:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_17296
	btr r12,1
	jmp LB_17297
LB_17296:
	bts r12,1
LB_17297:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_17294
	btr r12,8
	jmp LB_17295
LB_17294:
	bts r12,8
LB_17295:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_17272
	btr r12,5
	jmp LB_17273
LB_17272:
	bts r12,5
LB_17273:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_17270
	btr r12,4
	jmp LB_17271
LB_17270:
	bts r12,4
LB_17271:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17268
	btr r12,3
	jmp LB_17269
LB_17268:
	bts r12,3
LB_17269:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17266
	btr r12,2
	jmp LB_17267
LB_17266:
	bts r12,2
LB_17267:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17264
	btr r12,1
	jmp LB_17265
LB_17264:
	bts r12,1
LB_17265:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17262
	btr r12,0
	jmp LB_17263
LB_17262:
	bts r12,0
LB_17263:
	add rsp,56
; ∎ {  }
 ; {>  %_16922~2':(_lst)◂(_stg) %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16946~1':_r64 %_16962~8':(_opn)◂((_lst)◂(_p9983)) %_16953~5':_stg %_16951~4':_stg %_16961~7':_r64 %_16960~6':_stg %_16945~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_17298
	mov rdi,r8
	call dlt
LB_17298:
	bt r12,3
	jc LB_17299
	mov rdi,r9
	call dlt
LB_17299:
	bt r12,1
	jc LB_17300
	mov rdi,r14
	call dlt
LB_17300:
	bt r12,8
	jc LB_17301
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_17301:
	bt r12,5
	jc LB_17302
	mov rdi,r11
	call dlt
LB_17302:
	bt r12,4
	jc LB_17303
	mov rdi,r10
	call dlt
LB_17303:
	bt r12,7
	jc LB_17304
	mov rdi,rdx
	call dlt
LB_17304:
	bt r12,6
	jc LB_17305
	mov rdi,rcx
	call dlt
LB_17305:
	bt r12,0
	jc LB_17306
	mov rdi,r13
	call dlt
LB_17306:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_17230:
	mov r15,0
LB_17308:
	cmp r15,0
	jz LB_17309
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17308
LB_17309:
; ∎ {  }
 ; {>  %_16922~2':(_lst)◂(_stg) %_16947~3':(_opn)◂((_lst)◂(_p9983)) %_16946~1':_r64 %_16953~5':_stg %_16951~4':_stg %_16954~6':(_opn)◂(_stg) %_16945~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_17310
	mov rdi,r8
	call dlt
LB_17310:
	bt r12,3
	jc LB_17311
	mov rdi,r9
	call dlt
LB_17311:
	bt r12,1
	jc LB_17312
	mov rdi,r14
	call dlt
LB_17312:
	bt r12,5
	jc LB_17313
	mov rdi,r11
	call dlt
LB_17313:
	bt r12,4
	jc LB_17314
	mov rdi,r10
	call dlt
LB_17314:
	bt r12,6
	jc LB_17315
	mov rdi,rcx
	call dlt
LB_17315:
	bt r12,0
	jc LB_17316
	mov rdi,r13
	call dlt
LB_17316:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_17307:
MTC_LB_17164:
section .data
	NS_E_DYN_9257:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9257
	NS_E_DYN_9260:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9260
	NS_E_DYN_9261:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9261
	NS_E_DYN_9262:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9262
	NS_E_DYN_9263:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9263
	NS_E_DYN_9270:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9270
	NS_E_DYN_9309:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9309
	NS_E_DYN_9327:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9327
	NS_E_DYN_9370:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9370
	NS_E_DYN_9380:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9380
	NS_E_DYN_9381:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9381
	NS_E_DYN_9382:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9382
	NS_E_DYN_9600:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9600
	NS_E_DYN_9639:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9639
	NS_E_DYN_9678:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9678
	NS_E_DYN_9717:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9717
	NS_E_DYN_9748:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9748
	NS_E_DYN_9749:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9749
	NS_E_DYN_9750:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9750
	NS_E_DYN_9877:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9877
	NS_E_DYN_9936:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9937:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9946:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9946
	NS_E_DYN_9981:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9982:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10062:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10063:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10064:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10065:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10066:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10067:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10068:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10069:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10070:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10071:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10072:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_10073:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_10074:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_10075:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10076:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10077:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_10078:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10079:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10080:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_10081:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_10089:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10089
	NS_E_DYN_10368:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10368
	NS_E_DYN_10360:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10360
	NS_E_DYN_10351:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10351
	NS_E_DYN_10343:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10343
	NS_E_DYN_10331:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10331
	NS_E_DYN_10305:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10305
	NS_E_DYN_10275:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10275
	NS_E_DYN_10262:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10262
	NS_E_DYN_10252:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10252
	NS_E_DYN_10237:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10237
	NS_E_DYN_10220:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10220
	NS_E_DYN_10195:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10195
	NS_E_DYN_10180:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10180
	NS_E_DYN_10174:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10174
	NS_E_DYN_10162:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10162
	NS_E_DYN_10128:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10128
	NS_E_DYN_11353:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_11354:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_11355:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11355
	NS_E_DYN_11356:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11356
	NS_E_DYN_11357:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11357
	NS_E_DYN_11358:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11358
	NS_E_DYN_12005:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12005
	NS_E_DYN_12106:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12106
	CST_DYN_12168:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_12171:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12171
	NS_E_DYN_12238:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12238
	NS_E_DYN_12323:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_12324:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_12331:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12331
	NS_E_DYN_12367:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12367
	NS_E_DYN_12368:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12368
	NS_E_DYN_12369:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12369
	NS_E_DYN_12370:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12370
	NS_E_DYN_12631:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12631
	NS_E_DYN_12632:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12632
	NS_E_DYN_12635:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12635
	NS_E_DYN_12636:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12636
	NS_E_DYN_12901:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12901
	NS_E_DYN_12902:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12902
	NS_E_DYN_12903:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12903
	NS_E_DYN_12904:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12904
	NS_E_DYN_12905:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12905
	NS_E_DYN_13216:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13216
	NS_E_DYN_13217:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13217
	NS_E_DYN_13218:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13218
	NS_E_DYN_13219:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13219
	NS_E_DYN_13220:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13220
	NS_E_DYN_13221:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13221
	NS_E_DYN_13222:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13222
	NS_E_DYN_13225:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13225
	NS_E_DYN_13226:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13226
	NS_E_DYN_13227:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13227
	NS_E_DYN_13228:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13228
	NS_E_DYN_13229:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13229
	NS_E_DYN_13230:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13230
	NS_E_DYN_13231:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13231
	NS_E_DYN_13232:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13232
	NS_E_DYN_13233:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13233
	NS_E_DYN_13234:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13234
	NS_E_DYN_13235:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13235
	NS_E_DYN_13236:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13236
	NS_E_DYN_13237:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13237
	NS_E_DYN_13238:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13238
	NS_E_DYN_13239:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13239
	NS_E_DYN_13240:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13240
	NS_E_DYN_13241:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13241
	NS_E_DYN_13242:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13242
	NS_E_DYN_13243:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13243
	NS_E_DYN_13244:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13244
	NS_E_DYN_13245:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13245
	NS_E_DYN_13246:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13246
	NS_E_DYN_13247:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13247
	NS_E_DYN_13248:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13248
	NS_E_DYN_13249:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13249
	NS_E_DYN_13250:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13250
	NS_E_DYN_13251:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13251
	NS_E_DYN_13252:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13252
	NS_E_DYN_13253:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13253
	NS_E_DYN_13254:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13254
	NS_E_DYN_13255:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_13255
	CST_DYN_16963:
		dq 0x0000_0001_00_82_ffff
		dq 1
