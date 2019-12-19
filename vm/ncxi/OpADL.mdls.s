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
	call NS_E_13045
	call NS_E_17932
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
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
NS_E_9333:
NS_E_RDI_9333:
NS_E_9333_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_9334
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_9334:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9336:
NS_E_RDI_9336:
NS_E_9336_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_9336_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_9336_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9337:
NS_E_RDI_9337:
NS_E_9337_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_9337_LB_0
	cmp r11,57
	ja NS_E_9337_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9337_LB_0:
	mov rax,0
	ret
NS_E_9339:
NS_E_RDI_9339:
NS_E_9339_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_9339_LB_0
	cmp r11,122
	ja NS_E_9339_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9339_LB_0:
	mov rax,0
	ret
NS_E_9338:
NS_E_RDI_9338:
NS_E_9338_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_9338_LB_0
	cmp r11,90
	ja NS_E_9338_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9338_LB_0:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
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
NS_E_ID_59: dq 0
NS_E_59:
NS_E_RDI_59:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_9345
	bt QWORD [rdi],17
	jnc LB_9345
	bt QWORD [rdi],0
	jc LB_9347
	btr r12,2
	clc
	jmp LB_9348
LB_9347:
	bts r12,2
	stc
LB_9348:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_9346
LB_9345:
	btr r12,2
	clc
	call dcp
LB_9346:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_9341
	bt QWORD [rdi],17
	jnc LB_9341
	bt QWORD [rdi],0
	jc LB_9343
	btr r12,2
	clc
	jmp LB_9344
LB_9343:
	bts r12,2
	stc
LB_9344:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_9342
LB_9341:
	btr r12,2
	clc
	call dcp
LB_9342:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_9340
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_9340:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
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
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_9335:
NS_E_RDI_9335:
NS_E_9335_ETR_TBL:
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
	jz NS_E_9335_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_9335_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9355:
; 	|» { 0' 1' }
NS_E_RDI_9355:
MTC_LB_9356:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9357
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
	jnc LB_9358
	bt QWORD [rdi],0
	jc LB_9359
	btr r12,2
	clc
	jmp LB_9360
LB_9359:
	bts r12,2
	stc
LB_9360:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9358:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9361:
	cmp r15,0
	jz LB_9362
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9361
LB_9362:
; ∎ %_9349
 ; {>  %_9349~0':(_lst)◂(t3388'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9357:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9363
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
	jnc LB_9364
	bt QWORD [rdi],0
	jc LB_9365
	btr r12,4
	clc
	jmp LB_9366
LB_9365:
	bts r12,4
	stc
LB_9366:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9364:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_9369
	btr r12,5
	clc
	jmp LB_9370
LB_9369:
	bts r12,5
	stc
LB_9370:
	mov r8,r11
	bt r12,5
	jc LB_9367
	btr r12,2
	jmp LB_9368
LB_9367:
	bts r12,2
LB_9368:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_9373
	btr r12,5
	clc
	jmp LB_9374
LB_9373:
	bts r12,5
	stc
LB_9374:
	mov r9,r11
	bt r12,5
	jc LB_9371
	btr r12,3
	jmp LB_9372
LB_9371:
	bts r12,3
LB_9372:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9375:
	cmp r15,0
	jz LB_9376
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9375
LB_9376:
; _cns { %_9351 %_9349 } ⊢ %_9353 : %_9353
 ; {>  %_9349~0':(_lst)◂(t3388'(-1)) %_9351~2':t3388'(-1) %_9352~3':(_lst)◂(t3388'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f9355 { %_9353 %_9352 } ⊢ %_9354 : %_9354
 ; {>  %_9352~3':(_lst)◂(t3388'(-1)) %_9353~°0◂{ 2' 0' }:(_lst)◂(t3388'(-1)) }
; _f9355 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_9377
	btr r12,1
	jmp LB_9378
LB_9377:
	bts r12,1
LB_9378:
	mov r9,r13
	bt r12,0
	jc LB_9379
	btr r12,3
	jmp LB_9380
LB_9379:
	bts r12,3
LB_9380:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_9385
	btr r12,4
	jmp LB_9386
LB_9385:
	bts r12,4
LB_9386:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9383
	btr QWORD [rdi],0
	jmp LB_9384
LB_9383:
	bts QWORD [rdi],0
LB_9384:
	mov r10,r9
	bt r12,3
	jc LB_9389
	btr r12,4
	jmp LB_9390
LB_9389:
	bts r12,4
LB_9390:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9387
	btr QWORD [rdi],1
	jmp LB_9388
LB_9387:
	bts QWORD [rdi],1
LB_9388:
	mov rsi,1
	bt r12,0
	jc LB_9381
	mov rsi,0
	bt r13,0
	jc LB_9381
	jmp LB_9382
LB_9381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9382:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_9355
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_9354
 ; {>  %_9354~0':(_lst)◂(t3388'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9363:
NS_E_9394:
; 	|» 0'
NS_E_RDI_9394:
; _nil {  } ⊢ %_9392 : %_9392
 ; {>  %_9391~0':(_lst)◂(t3409'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f9355 { %_9392 %_9391 } ⊢ %_9393 : %_9393
 ; {>  %_9391~0':(_lst)◂(t3409'(-1)) %_9392~°1◂{  }:(_lst)◂(t3406'(0)) }
; _f9355 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_9395
	btr r12,1
	jmp LB_9396
LB_9395:
	bts r12,1
LB_9396:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_9397
	mov rsi,0
	bt r13,0
	jc LB_9397
	jmp LB_9398
LB_9397:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9398:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_9355
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_9393
 ; {>  %_9393~0':(_lst)◂(t3409'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_9412:
; 	|» { 0' 1' }
NS_E_RDI_9412:
MTC_LB_9413:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9414
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
	jnc LB_9415
	bt QWORD [rdi],0
	jc LB_9416
	btr r12,4
	clc
	jmp LB_9417
LB_9416:
	bts r12,4
	stc
LB_9417:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9415:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_9420
	btr r12,5
	clc
	jmp LB_9421
LB_9420:
	bts r12,5
	stc
LB_9421:
	mov r8,r11
	bt r12,5
	jc LB_9418
	btr r12,2
	jmp LB_9419
LB_9418:
	bts r12,2
LB_9419:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_9424
	btr r12,5
	clc
	jmp LB_9425
LB_9424:
	bts r12,5
	stc
LB_9425:
	mov r9,r11
	bt r12,5
	jc LB_9422
	btr r12,3
	jmp LB_9423
LB_9422:
	bts r12,3
LB_9423:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9426:
	cmp r15,0
	jz LB_9427
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9426
LB_9427:
; _f56 %_9399 ⊢ %_9403 : %_9403
 ; {>  %_9402~3':(_lst)◂(_r64) %_9399~0':_r64 %_9401~2':_r64 }
	add r13,1
; _f9412 { %_9403 %_9402 } ⊢ { %_9404 %_9405 } : { %_9404 %_9405 }
 ; {>  %_9402~3':(_lst)◂(_r64) %_9401~2':_r64 %_9403~0':_r64 }
; _f9412 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_9430
	btr r12,1
	jmp LB_9431
LB_9430:
	bts r12,1
LB_9431:
	call NS_E_9412
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9428
	btr r12,2
	clc
	jmp LB_9429
LB_9428:
	bts r12,2
	stc
LB_9429:
	add rsp,16
; _f55 %_9404 ⊢ %_9406 : %_9406
 ; {>  %_9404~0':_r64 %_9401~2':_r64 %_9405~1':_stg }
	sub r13,1
; _f33 { %_9405 %_9406 %_9401 } ⊢ { %_9407 %_9408 %_9409 } : { %_9407 %_9408 %_9409 }
 ; {>  %_9401~2':_r64 %_9405~1':_stg %_9406~0':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_9432
	btr r12,3
	jmp LB_9433
LB_9432:
	bts r12,3
LB_9433:
	mov r14,r13
	bt r12,0
	jc LB_9434
	btr r12,1
	jmp LB_9435
LB_9434:
	bts r12,1
LB_9435:
	mov r13,r9
	bt r12,3
	jc LB_9436
	btr r12,0
	jmp LB_9437
LB_9436:
	bts r12,0
LB_9437:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_9408 %_9407 }
 ; {>  %_9408~1':_r64 %_9409~2':_r64 %_9407~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_9438
	mov rdi,r8
	call dlt
LB_9438:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9439
	btr r12,2
	jmp LB_9440
LB_9439:
	bts r12,2
LB_9440:
	mov r14,r13
	bt r12,0
	jc LB_9441
	btr r12,1
	jmp LB_9442
LB_9441:
	bts r12,1
LB_9442:
	mov r13,r8
	bt r12,2
	jc LB_9443
	btr r12,0
	jmp LB_9444
LB_9443:
	bts r12,0
LB_9444:
	ret
MTC_LB_9414:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9445
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
	jnc LB_9446
	bt QWORD [rdi],0
	jc LB_9447
	btr r12,2
	clc
	jmp LB_9448
LB_9447:
	bts r12,2
	stc
LB_9448:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9446:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9449:
	cmp r15,0
	jz LB_9450
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9449
LB_9450:
; _f31 %_9399 ⊢ { %_9410 %_9411 } : { %_9410 %_9411 }
 ; {>  %_9399~0':_r64 }
; _f31 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_9410 %_9411 }
 ; {>  %_9410~0':_r64 %_9411~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_9445:
NS_E_9455:
; 	|» 0'
NS_E_RDI_9455:
; » 0xr0 |~ {  } ⊢ %_9452 : %_9452
 ; {>  %_9451~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_9452
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f9412 { %_9452 %_9451 } ⊢ { %_9453 %_9454 } : { %_9453 %_9454 }
 ; {>  %_9452~1':_r64 %_9451~0':(_lst)◂(_r64) }
; _f9412 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9456
	btr r12,2
	jmp LB_9457
LB_9456:
	bts r12,2
LB_9457:
	mov r14,r13
	bt r12,0
	jc LB_9458
	btr r12,1
	jmp LB_9459
LB_9458:
	bts r12,1
LB_9459:
	mov r13,r8
	bt r12,2
	jc LB_9460
	btr r12,0
	jmp LB_9461
LB_9460:
	bts r12,0
LB_9461:
	call NS_E_9412
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_9454
 ; {>  %_9453~0':_r64 %_9454~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_9462
	mov rdi,r13
	call dlt
LB_9462:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9463
	btr r12,0
	jmp LB_9464
LB_9463:
	bts r12,0
LB_9464:
	ret
NS_E_9483:
; 	|» { 0' 1' }
NS_E_RDI_9483:
MTC_LB_9484:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9485
; _emt_mov_ptn_to_ptn:{| 110.. |},0' ⊢ °0◂{ { 2' 3' } 4' }
; 0' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9486
	bt QWORD [rdi],0
	jc LB_9487
	btr r12,5
	clc
	jmp LB_9488
LB_9487:
	bts r12,5
	stc
LB_9488:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9486:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9497
	btr r12,6
	clc
	jmp LB_9498
LB_9497:
	bts r12,6
	stc
LB_9498:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9491
	btr r12,4
	clc
	jmp LB_9492
LB_9491:
	bts r12,4
	stc
LB_9492:
	mov r8,r10
	bt r12,4
	jc LB_9489
	btr r12,2
	jmp LB_9490
LB_9489:
	bts r12,2
LB_9490:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9495
	btr r12,4
	clc
	jmp LB_9496
LB_9495:
	bts r12,4
	stc
LB_9496:
	mov r9,r10
	bt r12,4
	jc LB_9493
	btr r12,3
	jmp LB_9494
LB_9493:
	bts r12,3
LB_9494:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9501
	btr r12,6
	clc
	jmp LB_9502
LB_9501:
	bts r12,6
	stc
LB_9502:
	mov r10,rcx
	bt r12,6
	jc LB_9499
	btr r12,4
	jmp LB_9500
LB_9499:
	bts r12,4
LB_9500:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9503:
	cmp r15,0
	jz LB_9504
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9503
LB_9504:
MTC_LB_9505:
	mov r15,0
	mov rdi,r14
	mov rsi,r8
	bt r12,1
	call eq
	jnz MTC_LB_9506
LB_9507:
	cmp r15,0
	jz LB_9508
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9507
LB_9508:
MTC_LB_9509:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9510
; _emt_mov_ptn_to_ptn:{| 011110.. |},3' ⊢ °0◂0'
; 3' ⊢ °0◂0'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9511
	bt QWORD [rdi],0
	jc LB_9512
	btr r12,5
	clc
	jmp LB_9513
LB_9512:
	bts r12,5
	stc
LB_9513:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9511:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_9514
	btr r12,0
	jmp LB_9515
LB_9514:
	bts r12,0
LB_9515:
LB_9516:
	cmp r15,0
	jz LB_9517
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9516
LB_9517:
; _emt_mov_ptn_to_ptn:{| 111010.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_9518
	btr r12,3
	jmp LB_9519
LB_9518:
	bts r12,3
LB_9519:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_9528
	btr r12,5
	clc
	jmp LB_9529
LB_9528:
	bts r12,5
	stc
LB_9529:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9526
	btr r12,4
	clc
	jmp LB_9527
LB_9526:
	bts r12,4
	stc
LB_9527:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9524
	btr r12,3
	clc
	jmp LB_9525
LB_9524:
	bts r12,3
	stc
LB_9525:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9522
	btr r12,2
	clc
	jmp LB_9523
LB_9522:
	bts r12,2
	stc
LB_9523:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9520
	btr r12,1
	clc
	jmp LB_9521
LB_9520:
	bts r12,1
	stc
LB_9521:
	add rsp,40
; _some %_9471 ⊢ %_9473 : %_9473
 ; {>  %_9471~3':t3490'(-1) %_9469~4':(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9466~1':t3482'(-1) %_9472~5':t3490'(-1) %_9467~2':t3482'(-1) }
; _some 3' ⊢ °0◂3'
; _cns { { %_9467 %_9473 } %_9469 } ⊢ %_9474 : %_9474
 ; {>  %_9469~4':(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9466~1':t3482'(-1) %_9473~°0◂3':(_opn)◂(t3490'(-1)) %_9472~5':t3490'(-1) %_9467~2':t3482'(-1) }
; _cns { { 2' °0◂3' } 4' } ⊢ °0◂{ { 2' °0◂3' } 4' }
; _some %_9472 ⊢ %_9475 : %_9475
 ; {>  %_9474~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9466~1':t3482'(-1) %_9472~5':t3490'(-1) }
; _some 5' ⊢ °0◂5'
; ∎ { %_9474 %_9466 %_9475 }
 ; {>  %_9474~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9466~1':t3482'(-1) %_9475~°0◂5':(_opn)◂(t3490'(-1)) }
; 	∎ { °0◂{ { 2' °0◂3' } 4' } 1' °0◂5' }
; _emt_mov_ptn_to_ptn:{| 0111110.. |},{ °0◂{ { 2' °0◂3' } 4' } 1' °0◂5' } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdx,r8
	bt r12,2
	jc LB_9536
	btr r12,7
	jmp LB_9537
LB_9536:
	bts r12,7
LB_9537:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_9534
	btr QWORD [rdi],0
	jmp LB_9535
LB_9534:
	bts QWORD [rdi],0
LB_9535:
	mov rdx,r9
	bt r12,3
	jc LB_9542
	btr r12,7
	jmp LB_9543
LB_9542:
	bts r12,7
LB_9543:
	mov rsi,1
	bt r12,7
	jc LB_9540
	mov rsi,0
	bt rdx,0
	jc LB_9540
	jmp LB_9541
LB_9540:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_9541:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_9538
	btr QWORD [rdi],1
	jmp LB_9539
LB_9538:
	bts QWORD [rdi],1
LB_9539:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9532
	btr QWORD [rdi],0
	jmp LB_9533
LB_9532:
	bts QWORD [rdi],0
LB_9533:
	mov rcx,r10
	bt r12,4
	jc LB_9546
	btr r12,6
	jmp LB_9547
LB_9546:
	bts r12,6
LB_9547:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9544
	btr QWORD [rdi],1
	jmp LB_9545
LB_9544:
	bts QWORD [rdi],1
LB_9545:
	mov rsi,1
	bt r12,0
	jc LB_9530
	mov rsi,0
	bt r13,0
	jc LB_9530
	jmp LB_9531
LB_9530:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9531:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov r8,r11
	bt r12,5
	jc LB_9550
	btr r12,2
	jmp LB_9551
LB_9550:
	bts r12,2
LB_9551:
	mov rsi,1
	bt r12,2
	jc LB_9548
	mov rsi,0
	bt r8,0
	jc LB_9548
	jmp LB_9549
LB_9548:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9549:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9510:
	mov r15,0
LB_9553:
	cmp r15,0
	jz LB_9554
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9553
LB_9554:
; _cns { { %_9467 %_9468 } %_9469 } ⊢ %_9476 : %_9476
 ; {>  %_9469~4':(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9466~1':t3482'(-1) %_9468~3':(_opn)◂(t3490'(-1)) %_9467~2':t3482'(-1) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _none {  } ⊢ %_9477 : %_9477
 ; {>  %_9466~1':t3482'(-1) %_9476~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_9476 %_9466 %_9477 }
 ; {>  %_9466~1':t3482'(-1) %_9476~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9477~°1◂{  }:(_opn)◂(t3476'(0)) }
; 	∎ { °0◂{ { 2' 3' } 4' } 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 011110.. |},{ °0◂{ { 2' 3' } 4' } 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r8
	bt r12,2
	jc LB_9561
	btr r12,6
	jmp LB_9562
LB_9561:
	bts r12,6
LB_9562:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9559
	btr QWORD [rdi],0
	jmp LB_9560
LB_9559:
	bts QWORD [rdi],0
LB_9560:
	mov rcx,r9
	bt r12,3
	jc LB_9565
	btr r12,6
	jmp LB_9566
LB_9565:
	bts r12,6
LB_9566:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9563
	btr QWORD [rdi],1
	jmp LB_9564
LB_9563:
	bts QWORD [rdi],1
LB_9564:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9557
	btr QWORD [rdi],0
	jmp LB_9558
LB_9557:
	bts QWORD [rdi],0
LB_9558:
	mov r11,r10
	bt r12,4
	jc LB_9569
	btr r12,5
	jmp LB_9570
LB_9569:
	bts r12,5
LB_9570:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9567
	btr QWORD [rdi],1
	jmp LB_9568
LB_9567:
	bts QWORD [rdi],1
LB_9568:
	mov rsi,1
	bt r12,0
	jc LB_9555
	mov rsi,0
	bt r13,0
	jc LB_9555
	jmp LB_9556
LB_9555:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9556:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_9571
	mov rsi,0
	bt r8,0
	jc LB_9571
	jmp LB_9572
LB_9571:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9572:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9552:
MTC_LB_9506:
	mov r15,0
LB_9574:
	cmp r15,0
	jz LB_9575
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9574
LB_9575:
; _f9483 { %_9469 %_9466 } ⊢ { %_9478 %_9479 %_9480 } : { %_9478 %_9479 %_9480 }
 ; {>  %_9469~4':(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9466~1':t3482'(-1) %_9468~3':(_opn)◂(t3490'(-1)) %_9467~2':t3482'(-1) }
; _f9483 { 4' 1' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010010.. |},{ 4' 1' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,4
	jc LB_9580
	btr r12,0
	jmp LB_9581
LB_9580:
	bts r12,0
LB_9581:
	call NS_E_9483
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_9582
	btr r12,4
	jmp LB_9583
LB_9582:
	bts r12,4
LB_9583:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_9578
	btr r12,3
	clc
	jmp LB_9579
LB_9578:
	bts r12,3
	stc
LB_9579:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9576
	btr r12,2
	clc
	jmp LB_9577
LB_9576:
	bts r12,2
	stc
LB_9577:
	add rsp,24
; _cns { { %_9467 %_9468 } %_9478 } ⊢ %_9481 : %_9481
 ; {>  %_9480~4':(_opn)◂(t3490'(-1)) %_9479~1':t3482'(-1) %_9468~3':(_opn)◂(t3490'(-1)) %_9478~0':(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) %_9467~2':t3482'(-1) }
; _cns { { 2' 3' } 0' } ⊢ °0◂{ { 2' 3' } 0' }
; ∎ { %_9481 %_9479 %_9480 }
 ; {>  %_9480~4':(_opn)◂(t3490'(-1)) %_9479~1':t3482'(-1) %_9481~°0◂{ { 2' 3' } 0' }:(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) }
; 	∎ { °0◂{ { 2' 3' } 0' } 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ °0◂{ { 2' 3' } 0' } 1' 4' } ⊢ { 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_9584
	btr r12,5
	jmp LB_9585
LB_9584:
	bts r12,5
LB_9585:
	mov r8,r10
	bt r12,4
	jc LB_9586
	btr r12,2
	jmp LB_9587
LB_9586:
	bts r12,2
LB_9587:
	mov r10,r13
	bt r12,0
	jc LB_9588
	btr r12,4
	jmp LB_9589
LB_9588:
	bts r12,4
LB_9589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdx,r11
	bt r12,5
	jc LB_9596
	btr r12,7
	jmp LB_9597
LB_9596:
	bts r12,7
LB_9597:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_9594
	btr QWORD [rdi],0
	jmp LB_9595
LB_9594:
	bts QWORD [rdi],0
LB_9595:
	mov rdx,r9
	bt r12,3
	jc LB_9600
	btr r12,7
	jmp LB_9601
LB_9600:
	bts r12,7
LB_9601:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_9598
	btr QWORD [rdi],1
	jmp LB_9599
LB_9598:
	bts QWORD [rdi],1
LB_9599:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9592
	btr QWORD [rdi],0
	jmp LB_9593
LB_9592:
	bts QWORD [rdi],0
LB_9593:
	mov rcx,r10
	bt r12,4
	jc LB_9604
	btr r12,6
	jmp LB_9605
LB_9604:
	bts r12,6
LB_9605:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9602
	btr QWORD [rdi],1
	jmp LB_9603
LB_9602:
	bts QWORD [rdi],1
LB_9603:
	mov rsi,1
	bt r12,0
	jc LB_9590
	mov rsi,0
	bt r13,0
	jc LB_9590
	jmp LB_9591
LB_9590:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9591:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_9573:
MTC_LB_9485:
	mov r15,0
LB_9607:
	cmp r15,0
	jz LB_9608
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9607
LB_9608:
; _none {  } ⊢ %_9482 : %_9482
 ; {>  %_9466~1':t3482'(-1) %_9465~0':(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_9465 %_9466 %_9482 }
 ; {>  %_9466~1':t3482'(-1) %_9482~°1◂{  }:(_opn)◂(t3487'(0)) %_9465~0':(_lst)◂({ t3482'(-1) (_opn)◂(t3490'(-1)) }) }
; 	∎ { 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_9609
	mov rsi,0
	bt r8,0
	jc LB_9609
	jmp LB_9610
LB_9609:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9610:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9606:
NS_E_9611:
NS_E_RDI_9611:
NS_E_9611_ETR_TBL:
NS_E_9611_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_9652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_9652
	jmp LB_9653
LB_9652:
	jmp LB_9642
LB_9653:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_9612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9657
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9658
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9658:
	jmp LB_9642
LB_9657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9645
	btr r12,1
	clc
	jmp LB_9646
LB_9645:
	bts r12,1
	stc
LB_9646:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9643
	btr r12,0
	clc
	jmp LB_9644
LB_9643:
	bts r12,0
	stc
LB_9644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9639
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9660
	btr r12,2
	jmp LB_9661
LB_9660:
	bts r12,2
LB_9661:
	mov r13,r14
	bt r12,1
	jc LB_9662
	btr r12,0
	jmp LB_9663
LB_9662:
	bts r12,0
LB_9663:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9455 %_9614 ⊢ %_9615 : %_9615
 ; {>  %_9614~0':(_lst)◂(_r64) }
; _f9455 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9455
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_9615 ⊢ %_9616 : %_9616
 ; {>  %_9615~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9616
 ; {>  %_9616~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9637
	btr r12,3
	jmp LB_9638
LB_9637:
	bts r12,3
LB_9638:
	mov r8,0
	bts r12,2
	ret
LB_9639:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9641
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9640
LB_9641:
	add rsp,8
	ret
LB_9642:
	add rsp,32
	pop r14
LB_9640:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9612:
NS_E_RDI_9612:
NS_E_9612_ETR_TBL:
NS_E_9612_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_9689
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_9689
	jmp LB_9690
LB_9689:
	jmp LB_9677
LB_9690:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_9613_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9694
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9695
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9695:
	jmp LB_9677
LB_9694:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_9612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9700
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9701
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9701:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9702
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9702:
	jmp LB_9677
LB_9700:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9682
	btr r12,2
	clc
	jmp LB_9683
LB_9682:
	bts r12,2
	stc
LB_9683:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9680
	btr r12,1
	clc
	jmp LB_9681
LB_9680:
	bts r12,1
	stc
LB_9681:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9678
	btr r12,0
	clc
	jmp LB_9679
LB_9678:
	bts r12,0
	stc
LB_9679:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_9674
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_9704
	btr r12,3
	jmp LB_9705
LB_9704:
	bts r12,3
LB_9705:
	mov r14,r8
	bt r12,2
	jc LB_9706
	btr r12,1
	jmp LB_9707
LB_9706:
	bts r12,1
LB_9707:
	mov r8,r13
	bt r12,0
	jc LB_9708
	btr r12,2
	jmp LB_9709
LB_9708:
	bts r12,2
LB_9709:
	mov r13,r9
	bt r12,3
	jc LB_9710
	btr r12,0
	jmp LB_9711
LB_9710:
	bts r12,0
LB_9711:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_9617 %_9618 } ⊢ %_9619 : %_9619
 ; {>  %_9617~0':_r64 %_9618~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_9619 ⊢ %_9620 : %_9620
 ; {>  %_9619~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_9620
 ; {>  %_9620~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_9668
	btr r12,2
	jmp LB_9669
LB_9668:
	bts r12,2
LB_9669:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9666
	btr QWORD [rdi],0
	jmp LB_9667
LB_9666:
	bts QWORD [rdi],0
LB_9667:
	mov r8,r14
	bt r12,1
	jc LB_9672
	btr r12,2
	jmp LB_9673
LB_9672:
	bts r12,2
LB_9673:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9670
	btr QWORD [rdi],1
	jmp LB_9671
LB_9670:
	bts QWORD [rdi],1
LB_9671:
	mov rsi,1
	bt r12,3
	jc LB_9664
	mov rsi,0
	bt r9,0
	jc LB_9664
	jmp LB_9665
LB_9664:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9665:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9674:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9676
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9675
LB_9676:
	add rsp,8
	ret
LB_9677:
	add rsp,48
	pop r14
LB_9675:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_9725
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_9725
	jmp LB_9726
LB_9725:
	jmp LB_9717
LB_9726:
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
	jc LB_9718
	btr r12,0
	clc
	jmp LB_9719
LB_9718:
	bts r12,0
	stc
LB_9719:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9714
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_9621 : %_9621
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_9621 ⊢ %_9622 : %_9622
 ; {>  %_9621~°1◂{  }:(_lst)◂(t3539'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_9622
 ; {>  %_9622~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3542'(0))) }
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
	jc LB_9712
	mov rsi,0
	bt r9,0
	jc LB_9712
	jmp LB_9713
LB_9712:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9713:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9714:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9716
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9715
LB_9716:
	add rsp,8
	ret
LB_9717:
	add rsp,16
	pop r14
LB_9715:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_9333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9748
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9740
LB_9748:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_9612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9753
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9754
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9754:
	jmp LB_9740
LB_9753:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9743
	btr r12,1
	clc
	jmp LB_9744
LB_9743:
	bts r12,1
	stc
LB_9744:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9741
	btr r12,0
	clc
	jmp LB_9742
LB_9741:
	bts r12,0
	stc
LB_9742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9737
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9623 %_9624 } ⊢ %_9625 : %_9625
 ; {>  %_9623~0':_r64 %_9624~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_9625 ⊢ %_9626 : %_9626
 ; {>  %_9625~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_9626
 ; {>  %_9626~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_9731
	btr r12,2
	jmp LB_9732
LB_9731:
	bts r12,2
LB_9732:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9729
	btr QWORD [rdi],0
	jmp LB_9730
LB_9729:
	bts QWORD [rdi],0
LB_9730:
	mov r8,r14
	bt r12,1
	jc LB_9735
	btr r12,2
	jmp LB_9736
LB_9735:
	bts r12,2
LB_9736:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9733
	btr QWORD [rdi],1
	jmp LB_9734
LB_9733:
	bts QWORD [rdi],1
LB_9734:
	mov rsi,1
	bt r12,3
	jc LB_9727
	mov rsi,0
	bt r9,0
	jc LB_9727
	jmp LB_9728
LB_9727:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9728:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
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
	add rsp,32
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
NS_E_9613:
NS_E_RDI_9613:
NS_E_9613_ETR_TBL:
NS_E_9613_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_9769
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_9769
	jmp LB_9770
LB_9769:
	jmp LB_9761
LB_9770:
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
	jc LB_9762
	btr r12,0
	clc
	jmp LB_9763
LB_9762:
	bts r12,0
	stc
LB_9763:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9758
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_9627 : %_9627
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_9627
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_9627 ⊢ %_9628 : %_9628
 ; {>  %_9627~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9628
 ; {>  %_9628~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9756
	btr r12,3
	jmp LB_9757
LB_9756:
	bts r12,3
LB_9757:
	mov r8,0
	bts r12,2
	ret
LB_9758:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9760
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9759
LB_9760:
	add rsp,8
	ret
LB_9761:
	add rsp,16
	pop r14
LB_9759:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_9784
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_9784
	jmp LB_9785
LB_9784:
	jmp LB_9776
LB_9785:
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
	jc LB_9777
	btr r12,0
	clc
	jmp LB_9778
LB_9777:
	bts r12,0
	stc
LB_9778:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9773
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_9629 : %_9629
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_9629
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_9629 ⊢ %_9630 : %_9630
 ; {>  %_9629~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9630
 ; {>  %_9630~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9771
	btr r12,3
	jmp LB_9772
LB_9771:
	bts r12,3
LB_9772:
	mov r8,0
	bts r12,2
	ret
LB_9773:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9775
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9774
LB_9775:
	add rsp,8
	ret
LB_9776:
	add rsp,16
	pop r14
LB_9774:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_9799
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_9799
	jmp LB_9800
LB_9799:
	jmp LB_9791
LB_9800:
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
	jc LB_9792
	btr r12,0
	clc
	jmp LB_9793
LB_9792:
	bts r12,0
	stc
LB_9793:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9788
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_9631 : %_9631
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_9631
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_9631 ⊢ %_9632 : %_9632
 ; {>  %_9631~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9632
 ; {>  %_9632~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9786
	btr r12,3
	jmp LB_9787
LB_9786:
	bts r12,3
LB_9787:
	mov r8,0
	bts r12,2
	ret
LB_9788:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9790
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9789
LB_9790:
	add rsp,8
	ret
LB_9791:
	add rsp,16
	pop r14
LB_9789:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_9814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_9814
	jmp LB_9815
LB_9814:
	jmp LB_9806
LB_9815:
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
	jc LB_9807
	btr r12,0
	clc
	jmp LB_9808
LB_9807:
	bts r12,0
	stc
LB_9808:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9803
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_9633 : %_9633
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_9633
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_9633 ⊢ %_9634 : %_9634
 ; {>  %_9633~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9634
 ; {>  %_9634~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9801
	btr r12,3
	jmp LB_9802
LB_9801:
	bts r12,3
LB_9802:
	mov r8,0
	bts r12,2
	ret
LB_9803:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9805
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9804
LB_9805:
	add rsp,8
	ret
LB_9806:
	add rsp,16
	pop r14
LB_9804:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_9829
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_9829
	jmp LB_9830
LB_9829:
	jmp LB_9821
LB_9830:
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
	jc LB_9822
	btr r12,0
	clc
	jmp LB_9823
LB_9822:
	bts r12,0
	stc
LB_9823:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9818
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_9635 : %_9635
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_9635
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_9635 ⊢ %_9636 : %_9636
 ; {>  %_9635~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9636
 ; {>  %_9636~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9816
	btr r12,3
	jmp LB_9817
LB_9816:
	bts r12,3
LB_9817:
	mov r8,0
	bts r12,2
	ret
LB_9818:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9820
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9819
LB_9820:
	add rsp,8
	ret
LB_9821:
	add rsp,16
	pop r14
LB_9819:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9831:
NS_E_RDI_9831:
NS_E_9831_ETR_TBL:
NS_E_9831_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_9333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9870
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9864
LB_9870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9865
	btr r12,0
	clc
	jmp LB_9866
LB_9865:
	bts r12,0
	stc
LB_9866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9861
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_9833 : %_9833
 ; {>  %_9832~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_9833
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_9834 : %_9834
 ; {>  %_9833~1':_r64 %_9832~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_9834
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_9832 %_9833 } ⊢ { %_9835 %_9836 %_9837 } : { %_9835 %_9836 %_9837 }
 ; {>  %_9834~2':_r64 %_9833~1':_r64 %_9832~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_9834 %_9835 } ⊢ { %_9838 %_9839 %_9840 } : { %_9838 %_9839 %_9840 }
 ; {>  %_9837~3':_r64 %_9834~2':_r64 %_9836~1':_r64 %_9835~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9843:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9844
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9844
LB_9845:
	cmp r15,0
	jz LB_9846
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9845
LB_9846:
; _some %_9839 ⊢ %_9841 : %_9841
 ; {>  %_9840~4':_r64 %_9837~3':_r64 %_9836~1':_r64 %_9839~0':_r64 %_9838~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9841
 ; {>  %_9840~4':_r64 %_9837~3':_r64 %_9841~°0◂0':(_opn)◂(_r64) %_9836~1':_r64 %_9838~2':_r64 }
; 	∎ °0◂0'
	bt r12,4
	jc LB_9847
	mov rdi,r10
	call dlt
LB_9847:
	bt r12,3
	jc LB_9848
	mov rdi,r9
	call dlt
LB_9848:
	bt r12,1
	jc LB_9849
	mov rdi,r14
	call dlt
LB_9849:
	bt r12,2
	jc LB_9850
	mov rdi,r8
	call dlt
LB_9850:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9851
	btr r12,3
	jmp LB_9852
LB_9851:
	bts r12,3
LB_9852:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9844:
	mov r15,0
LB_9854:
	cmp r15,0
	jz LB_9855
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9854
LB_9855:
; _none {  } ⊢ %_9842 : %_9842
 ; {>  %_9840~4':_r64 %_9837~3':_r64 %_9836~1':_r64 %_9839~0':_r64 %_9838~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9842
 ; {>  %_9840~4':_r64 %_9837~3':_r64 %_9842~°1◂{  }:(_opn)◂(t3618'(0)) %_9836~1':_r64 %_9839~0':_r64 %_9838~2':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_9856
	mov rdi,r10
	call dlt
LB_9856:
	bt r12,3
	jc LB_9857
	mov rdi,r9
	call dlt
LB_9857:
	bt r12,1
	jc LB_9858
	mov rdi,r14
	call dlt
LB_9858:
	bt r12,0
	jc LB_9859
	mov rdi,r13
	call dlt
LB_9859:
	bt r12,2
	jc LB_9860
	mov rdi,r8
	call dlt
LB_9860:
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
MTC_LB_9853:
LB_9861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9863
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9862
LB_9863:
	add rsp,8
	ret
LB_9864:
	add rsp,16
	pop r14
LB_9862:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9872:
NS_E_RDI_9872:
NS_E_9872_ETR_TBL:
NS_E_9872_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_9333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9911
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9905
LB_9911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9906
	btr r12,0
	clc
	jmp LB_9907
LB_9906:
	bts r12,0
	stc
LB_9907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9902
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_9874 : %_9874
 ; {>  %_9873~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_9874
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_9875 : %_9875
 ; {>  %_9873~0':_r64 %_9874~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_9875
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_9873 %_9874 } ⊢ { %_9876 %_9877 %_9878 } : { %_9876 %_9877 %_9878 }
 ; {>  %_9873~0':_r64 %_9875~2':_r64 %_9874~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_9875 %_9876 } ⊢ { %_9879 %_9880 %_9881 } : { %_9879 %_9880 %_9881 }
 ; {>  %_9876~0':_r64 %_9878~3':_r64 %_9877~1':_r64 %_9875~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9884:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9885
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9885
LB_9886:
	cmp r15,0
	jz LB_9887
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9886
LB_9887:
; _some %_9880 ⊢ %_9882 : %_9882
 ; {>  %_9880~0':_r64 %_9878~3':_r64 %_9877~1':_r64 %_9881~4':_r64 %_9879~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9882
 ; {>  %_9878~3':_r64 %_9877~1':_r64 %_9881~4':_r64 %_9882~°0◂0':(_opn)◂(_r64) %_9879~2':_r64 }
; 	∎ °0◂0'
	bt r12,3
	jc LB_9888
	mov rdi,r9
	call dlt
LB_9888:
	bt r12,1
	jc LB_9889
	mov rdi,r14
	call dlt
LB_9889:
	bt r12,4
	jc LB_9890
	mov rdi,r10
	call dlt
LB_9890:
	bt r12,2
	jc LB_9891
	mov rdi,r8
	call dlt
LB_9891:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9892
	btr r12,3
	jmp LB_9893
LB_9892:
	bts r12,3
LB_9893:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9885:
	mov r15,0
LB_9895:
	cmp r15,0
	jz LB_9896
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9895
LB_9896:
; _none {  } ⊢ %_9883 : %_9883
 ; {>  %_9880~0':_r64 %_9878~3':_r64 %_9877~1':_r64 %_9881~4':_r64 %_9879~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9883
 ; {>  %_9880~0':_r64 %_9878~3':_r64 %_9877~1':_r64 %_9883~°1◂{  }:(_opn)◂(t3645'(0)) %_9881~4':_r64 %_9879~2':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_9897
	mov rdi,r13
	call dlt
LB_9897:
	bt r12,3
	jc LB_9898
	mov rdi,r9
	call dlt
LB_9898:
	bt r12,1
	jc LB_9899
	mov rdi,r14
	call dlt
LB_9899:
	bt r12,4
	jc LB_9900
	mov rdi,r10
	call dlt
LB_9900:
	bt r12,2
	jc LB_9901
	mov rdi,r8
	call dlt
LB_9901:
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
MTC_LB_9894:
LB_9902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9904
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9903
LB_9904:
	add rsp,8
	ret
LB_9905:
	add rsp,16
	pop r14
LB_9903:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9913:
NS_E_RDI_9913:
NS_E_9913_ETR_TBL:
NS_E_9913_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_9333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9952
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9946
LB_9952:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9947
	btr r12,0
	clc
	jmp LB_9948
LB_9947:
	bts r12,0
	stc
LB_9948:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9943
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_9915 : %_9915
 ; {>  %_9914~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_9915
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_9916 : %_9916
 ; {>  %_9915~1':_r64 %_9914~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_9916
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_9914 %_9915 } ⊢ { %_9917 %_9918 %_9919 } : { %_9917 %_9918 %_9919 }
 ; {>  %_9915~1':_r64 %_9914~0':_r64 %_9916~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_9916 %_9917 } ⊢ { %_9920 %_9921 %_9922 } : { %_9920 %_9921 %_9922 }
 ; {>  %_9919~3':_r64 %_9918~1':_r64 %_9917~0':_r64 %_9916~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9925:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9926
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9926
LB_9927:
	cmp r15,0
	jz LB_9928
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9927
LB_9928:
; _some %_9921 ⊢ %_9923 : %_9923
 ; {>  %_9919~3':_r64 %_9922~4':_r64 %_9920~2':_r64 %_9918~1':_r64 %_9921~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9923
 ; {>  %_9919~3':_r64 %_9922~4':_r64 %_9920~2':_r64 %_9918~1':_r64 %_9923~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,3
	jc LB_9929
	mov rdi,r9
	call dlt
LB_9929:
	bt r12,4
	jc LB_9930
	mov rdi,r10
	call dlt
LB_9930:
	bt r12,2
	jc LB_9931
	mov rdi,r8
	call dlt
LB_9931:
	bt r12,1
	jc LB_9932
	mov rdi,r14
	call dlt
LB_9932:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9933
	btr r12,3
	jmp LB_9934
LB_9933:
	bts r12,3
LB_9934:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9926:
	mov r15,0
LB_9936:
	cmp r15,0
	jz LB_9937
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9936
LB_9937:
; _none {  } ⊢ %_9924 : %_9924
 ; {>  %_9919~3':_r64 %_9922~4':_r64 %_9920~2':_r64 %_9918~1':_r64 %_9921~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9924
 ; {>  %_9919~3':_r64 %_9922~4':_r64 %_9920~2':_r64 %_9918~1':_r64 %_9924~°1◂{  }:(_opn)◂(t3672'(0)) %_9921~0':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_9938
	mov rdi,r9
	call dlt
LB_9938:
	bt r12,4
	jc LB_9939
	mov rdi,r10
	call dlt
LB_9939:
	bt r12,2
	jc LB_9940
	mov rdi,r8
	call dlt
LB_9940:
	bt r12,1
	jc LB_9941
	mov rdi,r14
	call dlt
LB_9941:
	bt r12,0
	jc LB_9942
	mov rdi,r13
	call dlt
LB_9942:
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
MTC_LB_9935:
LB_9943:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9945
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9944
LB_9945:
	add rsp,8
	ret
LB_9946:
	add rsp,16
	pop r14
LB_9944:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9954:
NS_E_RDI_9954:
NS_E_9954_ETR_TBL:
NS_E_9954_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_9913_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9970
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9964
LB_9970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9965
	btr r12,0
	clc
	jmp LB_9966
LB_9965:
	bts r12,0
	stc
LB_9966:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9961
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9955 ⊢ %_9956 : %_9956
 ; {>  %_9955~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9956
 ; {>  %_9956~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9959
	btr r12,3
	jmp LB_9960
LB_9959:
	bts r12,3
LB_9960:
	mov r8,0
	bts r12,2
	ret
LB_9961:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9963
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9962
LB_9963:
	add rsp,8
	ret
LB_9964:
	add rsp,16
	pop r14
LB_9962:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_9872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9983
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9977
LB_9983:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9978
	btr r12,0
	clc
	jmp LB_9979
LB_9978:
	bts r12,0
	stc
LB_9979:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9974
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9957 ⊢ %_9958 : %_9958
 ; {>  %_9957~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9958
 ; {>  %_9958~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9972
	btr r12,3
	jmp LB_9973
LB_9972:
	bts r12,3
LB_9973:
	mov r8,0
	bts r12,2
	ret
LB_9974:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9976
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9975
LB_9976:
	add rsp,8
	ret
LB_9977:
	add rsp,16
	pop r14
LB_9975:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9985:
NS_E_RDI_9985:
NS_E_9985_ETR_TBL:
NS_E_9985_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_9954_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10030
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10022
LB_10030:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_9986_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10035
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10036
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10036:
	jmp LB_10022
LB_10035:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10025
	btr r12,1
	clc
	jmp LB_10026
LB_10025:
	bts r12,1
	stc
LB_10026:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10023
	btr r12,0
	clc
	jmp LB_10024
LB_10023:
	bts r12,0
	stc
LB_10024:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_10019
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9988 %_9989 } ⊢ %_9990 : %_9990
 ; {>  %_9989~1':(_lst)◂(_r64) %_9988~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f9455 %_9990 ⊢ %_9991 : %_9991
 ; {>  %_9990~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f9455 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_10005
	btr r12,2
	jmp LB_10006
LB_10005:
	bts r12,2
LB_10006:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_10011
	btr r12,3
	jmp LB_10012
LB_10011:
	bts r12,3
LB_10012:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_10009
	btr QWORD [rdi],0
	jmp LB_10010
LB_10009:
	bts QWORD [rdi],0
LB_10010:
	mov r9,r14
	bt r12,1
	jc LB_10015
	btr r12,3
	jmp LB_10016
LB_10015:
	bts r12,3
LB_10016:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_10013
	btr QWORD [rdi],1
	jmp LB_10014
LB_10013:
	bts QWORD [rdi],1
LB_10014:
	mov rsi,1
	bt r12,0
	jc LB_10007
	mov rsi,0
	bt r13,0
	jc LB_10007
	jmp LB_10008
LB_10007:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_10008:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_9455
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_9991 ⊢ %_9992 : %_9992
 ; {>  %_9991~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9992
 ; {>  %_9992~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10017
	btr r12,3
	jmp LB_10018
LB_10017:
	bts r12,3
LB_10018:
	mov r8,0
	bts r12,2
	ret
LB_10019:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10021
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10020
LB_10021:
	add rsp,8
	ret
LB_10022:
	add rsp,32
	pop r14
LB_10020:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9986:
NS_E_RDI_9986:
NS_E_9986_ETR_TBL:
NS_E_9986_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_9987_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10059
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10051
LB_10059:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_9986_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10064
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10065
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10065:
	jmp LB_10051
LB_10064:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10054
	btr r12,1
	clc
	jmp LB_10055
LB_10054:
	bts r12,1
	stc
LB_10055:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10052
	btr r12,0
	clc
	jmp LB_10053
LB_10052:
	bts r12,0
	stc
LB_10053:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_10048
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9993 %_9994 } ⊢ %_9995 : %_9995
 ; {>  %_9994~1':(_lst)◂(_r64) %_9993~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_9995 ⊢ %_9996 : %_9996
 ; {>  %_9995~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_9996
 ; {>  %_9996~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_10042
	btr r12,2
	jmp LB_10043
LB_10042:
	bts r12,2
LB_10043:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_10040
	btr QWORD [rdi],0
	jmp LB_10041
LB_10040:
	bts QWORD [rdi],0
LB_10041:
	mov r8,r14
	bt r12,1
	jc LB_10046
	btr r12,2
	jmp LB_10047
LB_10046:
	bts r12,2
LB_10047:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_10044
	btr QWORD [rdi],1
	jmp LB_10045
LB_10044:
	bts QWORD [rdi],1
LB_10045:
	mov rsi,1
	bt r12,3
	jc LB_10038
	mov rsi,0
	bt r9,0
	jc LB_10038
	jmp LB_10039
LB_10038:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10039:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10048:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10050
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10049
LB_10050:
	add rsp,8
	ret
LB_10051:
	add rsp,32
	pop r14
LB_10049:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_10069
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_9997 : %_9997
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_9997 ⊢ %_9998 : %_9998
 ; {>  %_9997~°1◂{  }:(_lst)◂(t3716'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_9998
 ; {>  %_9998~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3719'(0))) }
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
	jc LB_10067
	mov rsi,0
	bt r9,0
	jc LB_10067
	jmp LB_10068
LB_10067:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10068:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10069:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10071
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10070
LB_10071:
	add rsp,8
	ret
LB_10072:
	add rsp,0
	pop r14
LB_10070:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9987:
NS_E_RDI_9987:
NS_E_9987_ETR_TBL:
NS_E_9987_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_9954_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10084
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10078
LB_10084:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10079
	btr r12,0
	clc
	jmp LB_10080
LB_10079:
	bts r12,0
	stc
LB_10080:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10075
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9999 ⊢ %_10000 : %_10000
 ; {>  %_9999~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10000
 ; {>  %_10000~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10073
	btr r12,3
	jmp LB_10074
LB_10073:
	bts r12,3
LB_10074:
	mov r8,0
	bts r12,2
	ret
LB_10075:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10077
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10076
LB_10077:
	add rsp,8
	ret
LB_10078:
	add rsp,16
	pop r14
LB_10076:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_9831_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10097
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10091
LB_10097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10092
	btr r12,0
	clc
	jmp LB_10093
LB_10092:
	bts r12,0
	stc
LB_10093:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10088
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_10001 ⊢ %_10002 : %_10002
 ; {>  %_10001~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10002
 ; {>  %_10002~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10086
	btr r12,3
	jmp LB_10087
LB_10086:
	bts r12,3
LB_10087:
	mov r8,0
	bts r12,2
	ret
LB_10088:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10090
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10089
LB_10090:
	add rsp,8
	ret
LB_10091:
	add rsp,16
	pop r14
LB_10089:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_10112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_10112
	jmp LB_10113
LB_10112:
	jmp LB_10104
LB_10113:
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
	jc LB_10105
	btr r12,0
	clc
	jmp LB_10106
LB_10105:
	bts r12,0
	stc
LB_10106:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10101
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_10003 : %_10003
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_10003
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_10003 ⊢ %_10004 : %_10004
 ; {>  %_10003~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10004
 ; {>  %_10004~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10099
	btr r12,3
	jmp LB_10100
LB_10099:
	bts r12,3
LB_10100:
	mov r8,0
	bts r12,2
	ret
LB_10101:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10103
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10102
LB_10103:
	add rsp,8
	ret
LB_10104:
	add rsp,16
	pop r14
LB_10102:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_10114:
NS_E_RDI_10114:
NS_E_10114_ETR_TBL:
NS_E_10114_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_10135
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_10135
	jmp LB_10136
LB_10135:
	jmp LB_10125
LB_10136:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_9986_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10140
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10141
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10141:
	jmp LB_10125
LB_10140:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10128
	btr r12,1
	clc
	jmp LB_10129
LB_10128:
	bts r12,1
	stc
LB_10129:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10126
	btr r12,0
	clc
	jmp LB_10127
LB_10126:
	bts r12,0
	stc
LB_10127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_10122
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_10143
	btr r12,2
	jmp LB_10144
LB_10143:
	bts r12,2
LB_10144:
	mov r13,r14
	bt r12,1
	jc LB_10145
	btr r12,0
	jmp LB_10146
LB_10145:
	bts r12,0
LB_10146:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9455 %_10115 ⊢ %_10116 : %_10116
 ; {>  %_10115~0':(_lst)◂(_r64) }
; _f9455 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9455
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_10116 ⊢ %_10117 : %_10117
 ; {>  %_10116~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_10117
 ; {>  %_10117~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10120
	btr r12,3
	jmp LB_10121
LB_10120:
	bts r12,3
LB_10121:
	mov r8,0
	bts r12,2
	ret
LB_10122:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10124
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10123
LB_10124:
	add rsp,8
	ret
LB_10125:
	add rsp,32
	pop r14
LB_10123:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10158
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10152
LB_10158:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10153
	btr r12,0
	clc
	jmp LB_10154
LB_10153:
	bts r12,0
	stc
LB_10154:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10149
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_10118 ⊢ %_10119 : %_10119
 ; {>  %_10118~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_10119
 ; {>  %_10119~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10147
	btr r12,3
	jmp LB_10148
LB_10147:
	bts r12,3
LB_10148:
	mov r8,0
	bts r12,2
	ret
LB_10149:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10151
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10150
LB_10151:
	add rsp,8
	ret
LB_10152:
	add rsp,16
	pop r14
LB_10150:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_10171:
; 	|» 0'
NS_E_RDI_10171:
MTC_LB_10172:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10173
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
	jnc LB_10174
	bt QWORD [rdi],0
	jc LB_10175
	btr r12,3
	clc
	jmp LB_10176
LB_10175:
	bts r12,3
	stc
LB_10176:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10174:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10179
	btr r12,4
	clc
	jmp LB_10180
LB_10179:
	bts r12,4
	stc
LB_10180:
	mov r14,r10
	bt r12,4
	jc LB_10177
	btr r12,1
	jmp LB_10178
LB_10177:
	bts r12,1
LB_10178:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10183
	btr r12,4
	clc
	jmp LB_10184
LB_10183:
	bts r12,4
	stc
LB_10184:
	mov r8,r10
	bt r12,4
	jc LB_10181
	btr r12,2
	jmp LB_10182
LB_10181:
	bts r12,2
LB_10182:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10185:
	cmp r15,0
	jz LB_10186
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10185
LB_10186:
; _f10171 %_10165 ⊢ %_10166 : %_10166
 ; {>  %_10164~1':_stg %_10165~2':_p10160 }
; _f10171 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10189
	btr r12,0
	jmp LB_10190
LB_10189:
	bts r12,0
LB_10190:
	call NS_E_10171
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10187
	btr r12,1
	clc
	jmp LB_10188
LB_10187:
	bts r12,1
	stc
LB_10188:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_10169
 ; {>  %_10168~0':_stg %_10167~1':_stg %_10169~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_10191
	mov rdi,r13
	call dlt
LB_10191:
	bt r12,1
	jc LB_10192
	mov rdi,r14
	call dlt
LB_10192:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10193
	btr r12,0
	jmp LB_10194
LB_10193:
	bts r12,0
LB_10194:
	ret
MTC_LB_10173:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10195
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
	jnc LB_10196
	bt QWORD [rdi],0
	jc LB_10197
	btr r12,2
	clc
	jmp LB_10198
LB_10197:
	bts r12,2
	stc
LB_10198:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10196:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10199
	btr r12,1
	jmp LB_10200
LB_10199:
	bts r12,1
LB_10200:
LB_10201:
	cmp r15,0
	jz LB_10202
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10201
LB_10202:
; ∎ %_10170
 ; {>  %_10170~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10203
	btr r12,0
	jmp LB_10204
LB_10203:
	bts r12,0
LB_10204:
	ret
MTC_LB_10195:
NS_E_10315:
; 	|» 0'
NS_E_RDI_10315:
MTC_LB_10316:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10317
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
	jnc LB_10318
	bt QWORD [rdi],0
	jc LB_10319
	btr r12,2
	clc
	jmp LB_10320
LB_10319:
	bts r12,2
	stc
LB_10320:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10318:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10321
	btr r12,1
	jmp LB_10322
LB_10321:
	bts r12,1
LB_10322:
LB_10323:
	cmp r15,0
	jz LB_10324
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10323
LB_10324:
; 	» "??r" _ ⊢ 0' : %_10310
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10310
 ; {>  %_10309~1':_r64 %_10310~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_10325
	mov rdi,r14
	call dlt
LB_10325:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10317:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10326
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
	jnc LB_10327
	bt QWORD [rdi],0
	jc LB_10328
	btr r12,2
	clc
	jmp LB_10329
LB_10328:
	bts r12,2
	stc
LB_10329:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10327:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10330
	btr r12,1
	jmp LB_10331
LB_10330:
	bts r12,1
LB_10331:
LB_10332:
	cmp r15,0
	jz LB_10333
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10332
LB_10333:
; 	» ".." _ ⊢ 0' : %_10312
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10312
 ; {>  %_10311~1':_stg %_10312~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_10334
	mov rdi,r14
	call dlt
LB_10334:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10326:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10335
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
	jnc LB_10336
	bt QWORD [rdi],0
	jc LB_10337
	btr r12,2
	clc
	jmp LB_10338
LB_10337:
	bts r12,2
	stc
LB_10338:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10336:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10339
	btr r12,1
	jmp LB_10340
LB_10339:
	bts r12,1
LB_10340:
LB_10341:
	cmp r15,0
	jz LB_10342
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10341
LB_10342:
; _f10171 %_10313 ⊢ %_10314 : %_10314
 ; {>  %_10313~1':_p10160 }
; _f10171 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10343
	btr r12,0
	jmp LB_10344
LB_10343:
	bts r12,0
LB_10344:
	call NS_E_10171
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_10314
 ; {>  %_10314~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10335:
NS_E_10385:
; 	|» 0'
NS_E_RDI_10385:
MTC_LB_10386:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10387
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
	jnc LB_10388
	bt QWORD [rdi],0
	jc LB_10389
	btr r12,3
	clc
	jmp LB_10390
LB_10389:
	bts r12,3
	stc
LB_10390:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10388:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10393
	btr r12,4
	clc
	jmp LB_10394
LB_10393:
	bts r12,4
	stc
LB_10394:
	mov r14,r10
	bt r12,4
	jc LB_10391
	btr r12,1
	jmp LB_10392
LB_10391:
	bts r12,1
LB_10392:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10397
	btr r12,4
	clc
	jmp LB_10398
LB_10397:
	bts r12,4
	stc
LB_10398:
	mov r8,r10
	bt r12,4
	jc LB_10395
	btr r12,2
	jmp LB_10396
LB_10395:
	bts r12,2
LB_10396:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10399:
	cmp r15,0
	jz LB_10400
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10399
LB_10400:
; _f10375 %_10377 ⊢ %_10379 : %_10379
 ; {>  %_10377~1':_p10224 %_10378~2':(_lst)◂(_p10224) }
; _f10375 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10403
	btr r12,0
	jmp LB_10404
LB_10403:
	bts r12,0
LB_10404:
	call NS_E_10375
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10401
	btr r12,2
	clc
	jmp LB_10402
LB_10401:
	bts r12,2
	stc
LB_10402:
	add rsp,16
; _f10385 %_10378 ⊢ %_10380 : %_10380
 ; {>  %_10379~0':_stg %_10378~2':(_lst)◂(_p10224) }
; _f10385 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10407
	btr r12,0
	jmp LB_10408
LB_10407:
	bts r12,0
LB_10408:
	call NS_E_10385
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10409
	btr r12,1
	jmp LB_10410
LB_10409:
	bts r12,1
LB_10410:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10405
	btr r12,0
	clc
	jmp LB_10406
LB_10405:
	bts r12,0
	stc
LB_10406:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_10383
 ; {>  %_10382~1':_stg %_10383~2':_stg %_10381~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_10411
	mov rdi,r14
	call dlt
LB_10411:
	bt r12,0
	jc LB_10412
	mov rdi,r13
	call dlt
LB_10412:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10413
	btr r12,0
	jmp LB_10414
LB_10413:
	bts r12,0
LB_10414:
	ret
MTC_LB_10387:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10415
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
	jnc LB_10416
	bt QWORD [rdi],0
	jc LB_10417
	btr r12,1
	clc
	jmp LB_10418
LB_10417:
	bts r12,1
	stc
LB_10418:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10416:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10419:
	cmp r15,0
	jz LB_10420
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10419
LB_10420:
; 	» "" _ ⊢ 0' : %_10384
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10384
 ; {>  %_10384~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10415:
NS_E_10375:
; 	|» 0'
NS_E_RDI_10375:
MTC_LB_10421:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10422
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
	jnc LB_10423
	bt QWORD [rdi],0
	jc LB_10424
	btr r12,2
	clc
	jmp LB_10425
LB_10424:
	bts r12,2
	stc
LB_10425:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10423:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10426
	btr r12,1
	jmp LB_10427
LB_10426:
	bts r12,1
LB_10427:
LB_10428:
	cmp r15,0
	jz LB_10429
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10428
LB_10429:
; _f10385 %_10368 ⊢ %_10369 : %_10369
 ; {>  %_10368~1':(_lst)◂(_p10224) }
; _f10385 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10430
	btr r12,0
	jmp LB_10431
LB_10430:
	bts r12,0
LB_10431:
	call NS_E_10385
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_10371
 ; {>  %_10370~0':_stg %_10371~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10432
	mov rdi,r13
	call dlt
LB_10432:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10433
	btr r12,0
	jmp LB_10434
LB_10433:
	bts r12,0
LB_10434:
	ret
MTC_LB_10422:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10435
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
	jnc LB_10436
	bt QWORD [rdi],0
	jc LB_10437
	btr r12,2
	clc
	jmp LB_10438
LB_10437:
	bts r12,2
	stc
LB_10438:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10436:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10439
	btr r12,1
	jmp LB_10440
LB_10439:
	bts r12,1
LB_10440:
LB_10441:
	cmp r15,0
	jz LB_10442
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10441
LB_10442:
MTC_LB_10443:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10444
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
	jnc LB_10445
	bt QWORD [rdi],0
	jc LB_10446
	btr r12,0
	clc
	jmp LB_10447
LB_10446:
	bts r12,0
	stc
LB_10447:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10445:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
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
; 	» "_ " _ ⊢ 0' : %_10373
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10373
 ; {>  %_10373~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10444:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10450
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
	jnc LB_10451
	bt QWORD [rdi],0
	jc LB_10452
	btr r12,2
	clc
	jmp LB_10453
LB_10452:
	bts r12,2
	stc
LB_10453:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10451:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_10454
	btr r12,0
	jmp LB_10455
LB_10454:
	bts r12,0
LB_10455:
LB_10456:
	cmp r15,0
	jz LB_10457
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10456
LB_10457:
; ∎ %_10374
 ; {>  %_10374~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10450:
MTC_LB_10435:
NS_E_10366:
; 	|» 0'
NS_E_RDI_10366:
MTC_LB_10458:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10459
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
	jnc LB_10460
	bt QWORD [rdi],0
	jc LB_10461
	btr r12,3
	clc
	jmp LB_10462
LB_10461:
	bts r12,3
	stc
LB_10462:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10460:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10465
	btr r12,4
	clc
	jmp LB_10466
LB_10465:
	bts r12,4
	stc
LB_10466:
	mov r14,r10
	bt r12,4
	jc LB_10463
	btr r12,1
	jmp LB_10464
LB_10463:
	bts r12,1
LB_10464:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10469
	btr r12,4
	clc
	jmp LB_10470
LB_10469:
	bts r12,4
	stc
LB_10470:
	mov r8,r10
	bt r12,4
	jc LB_10467
	btr r12,2
	jmp LB_10468
LB_10467:
	bts r12,2
LB_10468:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10471:
	cmp r15,0
	jz LB_10472
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10471
LB_10472:
; _f10356 %_10358 ⊢ %_10360 : %_10360
 ; {>  %_10359~2':(_lst)◂(_p10223) %_10358~1':_p10223 }
; _f10356 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10475
	btr r12,0
	jmp LB_10476
LB_10475:
	bts r12,0
LB_10476:
	call NS_E_10356
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10473
	btr r12,2
	clc
	jmp LB_10474
LB_10473:
	bts r12,2
	stc
LB_10474:
	add rsp,16
; _f10366 %_10359 ⊢ %_10361 : %_10361
 ; {>  %_10359~2':(_lst)◂(_p10223) %_10360~0':_stg }
; _f10366 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10479
	btr r12,0
	jmp LB_10480
LB_10479:
	bts r12,0
LB_10480:
	call NS_E_10366
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10481
	btr r12,1
	jmp LB_10482
LB_10481:
	bts r12,1
LB_10482:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10477
	btr r12,0
	clc
	jmp LB_10478
LB_10477:
	bts r12,0
	stc
LB_10478:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_10364
 ; {>  %_10363~1':_stg %_10362~0':_stg %_10364~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_10483
	mov rdi,r14
	call dlt
LB_10483:
	bt r12,0
	jc LB_10484
	mov rdi,r13
	call dlt
LB_10484:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10485
	btr r12,0
	jmp LB_10486
LB_10485:
	bts r12,0
LB_10486:
	ret
MTC_LB_10459:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10487
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
	jnc LB_10488
	bt QWORD [rdi],0
	jc LB_10489
	btr r12,1
	clc
	jmp LB_10490
LB_10489:
	bts r12,1
	stc
LB_10490:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10488:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10491:
	cmp r15,0
	jz LB_10492
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10491
LB_10492:
; 	» "" _ ⊢ 0' : %_10365
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10365
 ; {>  %_10365~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10487:
NS_E_10356:
; 	|» 0'
NS_E_RDI_10356:
MTC_LB_10493:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10494
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
	jnc LB_10495
	bt QWORD [rdi],0
	jc LB_10496
	btr r12,2
	clc
	jmp LB_10497
LB_10496:
	bts r12,2
	stc
LB_10497:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10495:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10498
	btr r12,1
	jmp LB_10499
LB_10498:
	bts r12,1
LB_10499:
LB_10500:
	cmp r15,0
	jz LB_10501
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10500
LB_10501:
; _f10366 %_10346 ⊢ %_10347 : %_10347
 ; {>  %_10346~1':(_lst)◂(_p10223) }
; _f10366 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10502
	btr r12,0
	jmp LB_10503
LB_10502:
	bts r12,0
LB_10503:
	call NS_E_10366
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_10349
 ; {>  %_10348~0':_stg %_10349~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10504
	mov rdi,r13
	call dlt
LB_10504:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10505
	btr r12,0
	jmp LB_10506
LB_10505:
	bts r12,0
LB_10506:
	ret
MTC_LB_10494:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10507
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
	jnc LB_10508
	bt QWORD [rdi],0
	jc LB_10509
	btr r12,2
	clc
	jmp LB_10510
LB_10509:
	bts r12,2
	stc
LB_10510:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10508:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_10511
	btr r12,1
	jmp LB_10512
LB_10511:
	bts r12,1
LB_10512:
LB_10513:
	cmp r15,0
	jz LB_10514
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10513
LB_10514:
MTC_LB_10515:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10516
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
	jnc LB_10517
	bt QWORD [rdi],0
	jc LB_10518
	btr r12,2
	clc
	jmp LB_10519
LB_10518:
	bts r12,2
	stc
LB_10519:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10517:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_10520
	btr r12,0
	jmp LB_10521
LB_10520:
	bts r12,0
LB_10521:
LB_10522:
	cmp r15,0
	jz LB_10523
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10522
LB_10523:
; _f10315 %_10351 ⊢ %_10352 : %_10352
 ; {>  %_10351~0':_p10226 }
; _f10315 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_10315
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; ∎ %_10354
 ; {>  %_10354~1':_stg %_10353~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_10524
	mov rdi,r13
	call dlt
LB_10524:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10525
	btr r12,0
	jmp LB_10526
LB_10525:
	bts r12,0
LB_10526:
	ret
MTC_LB_10516:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10527
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
	jnc LB_10528
	bt QWORD [rdi],0
	jc LB_10529
	btr r12,2
	clc
	jmp LB_10530
LB_10529:
	bts r12,2
	stc
LB_10530:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10528:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_10531
	btr r12,0
	jmp LB_10532
LB_10531:
	bts r12,0
LB_10532:
LB_10533:
	cmp r15,0
	jz LB_10534
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10533
LB_10534:
; ∎ %_10355
 ; {>  %_10355~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_10527:
MTC_LB_10507:
NS_E_10947:
; 	|» { 0' 1' }
NS_E_RDI_10947:
MTC_LB_10948:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10949
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' }
; 1' ⊢ °0◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10950
	bt QWORD [rdi],0
	jc LB_10951
	btr r12,5
	clc
	jmp LB_10952
LB_10951:
	bts r12,5
	stc
LB_10952:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10950:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10955
	btr r12,6
	clc
	jmp LB_10956
LB_10955:
	bts r12,6
	stc
LB_10956:
	mov r8,rcx
	bt r12,6
	jc LB_10953
	btr r12,2
	jmp LB_10954
LB_10953:
	bts r12,2
LB_10954:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10959
	btr r12,6
	clc
	jmp LB_10960
LB_10959:
	bts r12,6
	stc
LB_10960:
	mov r9,rcx
	bt r12,6
	jc LB_10957
	btr r12,3
	jmp LB_10958
LB_10957:
	bts r12,3
LB_10958:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_10963
	btr r12,6
	clc
	jmp LB_10964
LB_10963:
	bts r12,6
	stc
LB_10964:
	mov r10,rcx
	bt r12,6
	jc LB_10961
	btr r12,4
	jmp LB_10962
LB_10961:
	bts r12,4
LB_10962:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10965:
	cmp r15,0
	jz LB_10966
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10965
LB_10966:
; _f10947 { %_10908 %_10912 } ⊢ { %_10913 %_10914 } : { %_10913 %_10914 }
 ; {>  %_10911~3':_p10229 %_10912~4':_p10228 %_10910~2':(_lst)◂(_p10230) %_10908~0':_r64 }
; _f10947 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10971
	btr r12,1
	jmp LB_10972
LB_10971:
	bts r12,1
LB_10972:
	call NS_E_10947
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10969
	btr r12,3
	clc
	jmp LB_10970
LB_10969:
	bts r12,3
	stc
LB_10970:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10967
	btr r12,2
	clc
	jmp LB_10968
LB_10967:
	bts r12,2
	stc
LB_10968:
	add rsp,24
MTC_LB_10973:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10974
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10975
	bt QWORD [rdi],0
	jc LB_10976
	btr r12,5
	clc
	jmp LB_10977
LB_10976:
	bts r12,5
	stc
LB_10977:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10975:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_10978
	btr r12,4
	jmp LB_10979
LB_10978:
	bts r12,4
LB_10979:
LB_10980:
	cmp r15,0
	jz LB_10981
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10980
LB_10981:
; _f10947 { %_10913 %_10915 } ⊢ { %_10916 %_10917 } : { %_10916 %_10917 }
 ; {>  %_10914~1':_stg %_10910~2':(_lst)◂(_p10230) %_10915~4':_p10228 %_10913~0':_r64 }
; _f10947 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10986
	btr r12,1
	jmp LB_10987
LB_10986:
	bts r12,1
LB_10987:
	call NS_E_10947
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_10988
	btr r12,3
	jmp LB_10989
LB_10988:
	bts r12,3
LB_10989:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10984
	btr r12,2
	clc
	jmp LB_10985
LB_10984:
	bts r12,2
	stc
LB_10985:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10982
	btr r12,1
	clc
	jmp LB_10983
LB_10982:
	bts r12,1
	stc
LB_10983:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_10990:
	cmp rax,0
	jz LB_10991
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_10990
LB_10991:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10918 %_10921 }
 ; {>  %_10920~3':_stg %_10919~1':_stg %_10910~2':(_lst)◂(_p10230) %_10918~0':_r64 %_10921~4':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_10992
	mov rdi,r9
	call dlt
LB_10992:
	bt r12,1
	jc LB_10993
	mov rdi,r14
	call dlt
LB_10993:
	bt r12,2
	jc LB_10994
	mov rdi,r8
	call dlt
LB_10994:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10995
	btr r12,1
	jmp LB_10996
LB_10995:
	bts r12,1
LB_10996:
	ret
MTC_LB_10974:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10997
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10998
	bt QWORD [rdi],0
	jc LB_10999
	btr r12,5
	clc
	jmp LB_11000
LB_10999:
	bts r12,5
	stc
LB_11000:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10998:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_11001
	btr r12,4
	jmp LB_11002
LB_11001:
	bts r12,4
LB_11002:
LB_11003:
	cmp r15,0
	jz LB_11004
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11003
LB_11004:
; _f56 %_10913 ⊢ %_10923 : %_10923
 ; {>  %_10914~1':_stg %_10910~2':(_lst)◂(_p10230) %_10913~0':_r64 %_10922~4':_p10227 }
	add r13,1
; _f10871 { %_10923 %_10922 } ⊢ { %_10924 %_10925 } : { %_10924 %_10925 }
 ; {>  %_10914~1':_stg %_10923~0':_r64 %_10910~2':(_lst)◂(_p10230) %_10922~4':_p10227 }
; _f10871 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11009
	btr r12,1
	jmp LB_11010
LB_11009:
	bts r12,1
LB_11010:
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_11011
	btr r12,3
	jmp LB_11012
LB_11011:
	bts r12,3
LB_11012:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11007
	btr r12,2
	clc
	jmp LB_11008
LB_11007:
	bts r12,2
	stc
LB_11008:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11005
	btr r12,1
	clc
	jmp LB_11006
LB_11005:
	bts r12,1
	stc
LB_11006:
	add rsp,24
; _f55 %_10924 ⊢ %_10926 : %_10926
 ; {>  %_10914~1':_stg %_10925~3':_stg %_10910~2':(_lst)◂(_p10230) %_10924~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11013:
	cmp rax,0
	jz LB_11014
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11013
LB_11014:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10927 %_10930 }
 ; {>  %_10927~0':_r64 %_10929~3':_stg %_10910~2':(_lst)◂(_p10230) %_10930~4':_stg %_10928~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_11015
	mov rdi,r9
	call dlt
LB_11015:
	bt r12,2
	jc LB_11016
	mov rdi,r8
	call dlt
LB_11016:
	bt r12,1
	jc LB_11017
	mov rdi,r14
	call dlt
LB_11017:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11018
	btr r12,1
	jmp LB_11019
LB_11018:
	bts r12,1
LB_11019:
	ret
MTC_LB_10997:
MTC_LB_10949:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11020
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11021
	bt QWORD [rdi],0
	jc LB_11022
	btr r12,4
	clc
	jmp LB_11023
LB_11022:
	bts r12,4
	stc
LB_11023:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11021:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11026
	btr r12,5
	clc
	jmp LB_11027
LB_11026:
	bts r12,5
	stc
LB_11027:
	mov r8,r11
	bt r12,5
	jc LB_11024
	btr r12,2
	jmp LB_11025
LB_11024:
	bts r12,2
LB_11025:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11030
	btr r12,5
	clc
	jmp LB_11031
LB_11030:
	bts r12,5
	stc
LB_11031:
	mov r9,r11
	bt r12,5
	jc LB_11028
	btr r12,3
	jmp LB_11029
LB_11028:
	bts r12,3
LB_11029:
	mov rdi,r10
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
MTC_LB_11034:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11035
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_11036
	bt QWORD [rdi],0
	jc LB_11037
	btr r12,4
	clc
	jmp LB_11038
LB_11037:
	bts r12,4
	stc
LB_11038:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11036:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_11039
	btr r12,1
	jmp LB_11040
LB_11039:
	bts r12,1
LB_11040:
LB_11041:
	cmp r15,0
	jz LB_11042
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11041
LB_11042:
; _f10947 { %_10908 %_10933 } ⊢ { %_10934 %_10935 } : { %_10934 %_10935 }
 ; {>  %_10931~2':(_lst)◂(_p10230) %_10933~1':_p10228 %_10908~0':_r64 }
; _f10947 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_10947
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11043
	btr r12,2
	clc
	jmp LB_11044
LB_11043:
	bts r12,2
	stc
LB_11044:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11045:
	cmp rax,0
	jz LB_11046
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11045
LB_11046:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10936 %_10938 }
 ; {>  %_10936~0':_r64 %_10931~2':(_lst)◂(_p10230) %_10938~3':_stg %_10937~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_11047
	mov rdi,r8
	call dlt
LB_11047:
	bt r12,1
	jc LB_11048
	mov rdi,r14
	call dlt
LB_11048:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11049
	btr r12,1
	jmp LB_11050
LB_11049:
	bts r12,1
LB_11050:
	ret
MTC_LB_11035:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11051
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_11052
	bt QWORD [rdi],0
	jc LB_11053
	btr r12,4
	clc
	jmp LB_11054
LB_11053:
	bts r12,4
	stc
LB_11054:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11052:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_11055
	btr r12,1
	jmp LB_11056
LB_11055:
	bts r12,1
LB_11056:
LB_11057:
	cmp r15,0
	jz LB_11058
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11057
LB_11058:
; _f56 %_10908 ⊢ %_10940 : %_10940
 ; {>  %_10931~2':(_lst)◂(_p10230) %_10939~1':_p10227 %_10908~0':_r64 }
	add r13,1
; _f10871 { %_10940 %_10939 } ⊢ { %_10941 %_10942 } : { %_10941 %_10942 }
 ; {>  %_10931~2':(_lst)◂(_p10230) %_10940~0':_r64 %_10939~1':_p10227 }
; _f10871 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11059
	btr r12,2
	clc
	jmp LB_11060
LB_11059:
	bts r12,2
	stc
LB_11060:
	add rsp,16
; _f55 %_10941 ⊢ %_10943 : %_10943
 ; {>  %_10931~2':(_lst)◂(_p10230) %_10942~1':_stg %_10941~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11061:
	cmp rax,0
	jz LB_11062
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11061
LB_11062:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10944 %_10946 }
 ; {>  %_10931~2':(_lst)◂(_p10230) %_10944~0':_r64 %_10946~3':_stg %_10945~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_11063
	mov rdi,r8
	call dlt
LB_11063:
	bt r12,1
	jc LB_11064
	mov rdi,r14
	call dlt
LB_11064:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11065
	btr r12,1
	jmp LB_11066
LB_11065:
	bts r12,1
LB_11066:
	ret
MTC_LB_11051:
MTC_LB_11020:
NS_E_10907:
; 	|» { 0' { 1' 2' 3' } }
NS_E_RDI_10907:
; _f10356 %_10874 ⊢ %_10876 : %_10876
 ; {>  %_10873~1':_p10232 %_10874~2':_p10223 %_10872~0':_r64 %_10875~3':_p10224 }
; _f10356 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11073
	btr r12,0
	jmp LB_11074
LB_11073:
	bts r12,0
LB_11074:
	call NS_E_10356
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_11075
	btr r12,2
	jmp LB_11076
LB_11075:
	bts r12,2
LB_11076:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11071
	btr r12,3
	clc
	jmp LB_11072
LB_11071:
	bts r12,3
	stc
LB_11072:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11069
	btr r12,1
	clc
	jmp LB_11070
LB_11069:
	bts r12,1
	stc
LB_11070:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11067
	btr r12,0
	clc
	jmp LB_11068
LB_11067:
	bts r12,0
	stc
LB_11068:
	add rsp,32
; _f10375 %_10875 ⊢ %_10877 : %_10877
 ; {>  %_10876~2':_stg %_10873~1':_p10232 %_10872~0':_r64 %_10875~3':_p10224 }
; _f10375 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_11083
	btr r12,0
	jmp LB_11084
LB_11083:
	bts r12,0
LB_11084:
	call NS_E_10375
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_11085
	btr r12,3
	jmp LB_11086
LB_11085:
	bts r12,3
LB_11086:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11081
	btr r12,2
	clc
	jmp LB_11082
LB_11081:
	bts r12,2
	stc
LB_11082:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11079
	btr r12,1
	clc
	jmp LB_11080
LB_11079:
	bts r12,1
	stc
LB_11080:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11077
	btr r12,0
	clc
	jmp LB_11078
LB_11077:
	bts r12,0
	stc
LB_11078:
	add rsp,32
MTC_LB_11087:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11088
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11089
	bt QWORD [rdi],0
	jc LB_11090
	btr r12,5
	clc
	jmp LB_11091
LB_11090:
	bts r12,5
	stc
LB_11091:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11089:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_11092
	btr r12,4
	jmp LB_11093
LB_11092:
	bts r12,4
LB_11093:
LB_11094:
	cmp r15,0
	jz LB_11095
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11094
LB_11095:
; _f10171 %_10878 ⊢ %_10879 : %_10879
 ; {>  %_10876~2':_stg %_10878~4':_p10160 %_10877~3':_stg %_10872~0':_r64 }
; _f10171 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_11102
	btr r12,0
	jmp LB_11103
LB_11102:
	bts r12,0
LB_11103:
	call NS_E_10171
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11104
	btr r12,1
	jmp LB_11105
LB_11104:
	bts r12,1
LB_11105:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11100
	btr r12,3
	clc
	jmp LB_11101
LB_11100:
	bts r12,3
	stc
LB_11101:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11098
	btr r12,2
	clc
	jmp LB_11099
LB_11098:
	bts r12,2
	stc
LB_11099:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11096
	btr r12,0
	clc
	jmp LB_11097
LB_11096:
	bts r12,0
	stc
LB_11097:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11106:
	cmp rax,0
	jz LB_11107
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11106
LB_11107:
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_10880 %_10884 }
 ; {>  %_10880~0':_r64 %_10884~4':_stg %_10882~2':_stg %_10881~1':_stg %_10883~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_11108
	mov rdi,r8
	call dlt
LB_11108:
	bt r12,1
	jc LB_11109
	mov rdi,r14
	call dlt
LB_11109:
	bt r12,3
	jc LB_11110
	mov rdi,r9
	call dlt
LB_11110:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11111
	btr r12,1
	jmp LB_11112
LB_11111:
	bts r12,1
LB_11112:
	ret
MTC_LB_11088:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11113
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11114
	bt QWORD [rdi],0
	jc LB_11115
	btr r12,5
	clc
	jmp LB_11116
LB_11115:
	bts r12,5
	stc
LB_11116:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11114:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_11117
	btr r12,4
	jmp LB_11118
LB_11117:
	bts r12,4
LB_11118:
LB_11119:
	cmp r15,0
	jz LB_11120
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11119
LB_11120:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11121:
	cmp rax,0
	jz LB_11122
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11121
LB_11122:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_10886 %_10889 }
 ; {>  %_10885~4':_r64 %_10888~3':_stg %_10886~0':_r64 %_10887~2':_stg %_10889~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_11123
	mov rdi,r10
	call dlt
LB_11123:
	bt r12,3
	jc LB_11124
	mov rdi,r9
	call dlt
LB_11124:
	bt r12,2
	jc LB_11125
	mov rdi,r8
	call dlt
LB_11125:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11113:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_11126
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11127
	bt QWORD [rdi],0
	jc LB_11128
	btr r12,4
	clc
	jmp LB_11129
LB_11128:
	bts r12,4
	stc
LB_11129:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11127:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11130:
	cmp r15,0
	jz LB_11131
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11130
LB_11131:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11132:
	cmp rax,0
	jz LB_11133
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11132
LB_11133:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_10890 %_10893 }
 ; {>  %_10890~0':_r64 %_10893~1':_stg %_10891~2':_stg %_10892~3':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_11134
	mov rdi,r8
	call dlt
LB_11134:
	bt r12,3
	jc LB_11135
	mov rdi,r9
	call dlt
LB_11135:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11126:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_11136
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °3◂4'
; 1' ⊢ °3◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11137
	bt QWORD [rdi],0
	jc LB_11138
	btr r12,5
	clc
	jmp LB_11139
LB_11138:
	bts r12,5
	stc
LB_11139:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11137:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_11140
	btr r12,4
	jmp LB_11141
LB_11140:
	bts r12,4
LB_11141:
LB_11142:
	cmp r15,0
	jz LB_11143
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11142
LB_11143:
; _f10315 %_10894 ⊢ %_10895 : %_10895
 ; {>  %_10876~2':_stg %_10877~3':_stg %_10894~4':_p10226 %_10872~0':_r64 }
; _f10315 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_11150
	btr r12,0
	jmp LB_11151
LB_11150:
	bts r12,0
LB_11151:
	call NS_E_10315
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11152
	btr r12,1
	jmp LB_11153
LB_11152:
	bts r12,1
LB_11153:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11148
	btr r12,3
	clc
	jmp LB_11149
LB_11148:
	bts r12,3
	stc
LB_11149:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11146
	btr r12,2
	clc
	jmp LB_11147
LB_11146:
	bts r12,2
	stc
LB_11147:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11144
	btr r12,0
	clc
	jmp LB_11145
LB_11144:
	bts r12,0
	stc
LB_11145:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11154:
	cmp rax,0
	jz LB_11155
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11154
LB_11155:
; "\194\187 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_10896 %_10900 }
 ; {>  %_10899~3':_stg %_10897~1':_stg %_10900~4':_stg %_10898~2':_stg %_10896~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_11156
	mov rdi,r9
	call dlt
LB_11156:
	bt r12,1
	jc LB_11157
	mov rdi,r14
	call dlt
LB_11157:
	bt r12,2
	jc LB_11158
	mov rdi,r8
	call dlt
LB_11158:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11159
	btr r12,1
	jmp LB_11160
LB_11159:
	bts r12,1
LB_11160:
	ret
MTC_LB_11136:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_11161
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °4◂{ 4' 5' }
; 1' ⊢ °4◂{ 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11162
	bt QWORD [rdi],0
	jc LB_11163
	btr r12,6
	clc
	jmp LB_11164
LB_11163:
	bts r12,6
	stc
LB_11164:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11162:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_11167
	btr r12,7
	clc
	jmp LB_11168
LB_11167:
	bts r12,7
	stc
LB_11168:
	mov r10,rdx
	bt r12,7
	jc LB_11165
	btr r12,4
	jmp LB_11166
LB_11165:
	bts r12,4
LB_11166:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_11171
	btr r12,7
	clc
	jmp LB_11172
LB_11171:
	bts r12,7
	stc
LB_11172:
	mov r11,rdx
	bt r12,7
	jc LB_11169
	btr r12,5
	jmp LB_11170
LB_11169:
	bts r12,5
LB_11170:
	mov rdi,rcx
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
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,6
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11175:
	cmp rax,0
	jz LB_11176
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11175
LB_11176:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; " .. //\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_10903 %_10906 }
 ; {>  %_10901~4':_r64 %_10904~2':_stg %_10905~3':_stg %_10903~0':_r64 %_10902~5':(_lst)◂(_p10233) %_10906~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_11177
	mov rdi,r10
	call dlt
LB_11177:
	bt r12,2
	jc LB_11178
	mov rdi,r8
	call dlt
LB_11178:
	bt r12,3
	jc LB_11179
	mov rdi,r9
	call dlt
LB_11179:
	bt r12,5
	jc LB_11180
	mov rdi,r11
	call dlt
LB_11180:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11161:
NS_E_10871:
; 	|» { 0' 1' }
NS_E_RDI_10871:
MTC_LB_11181:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11182
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11183
	bt QWORD [rdi],0
	jc LB_11184
	btr r12,6
	clc
	jmp LB_11185
LB_11184:
	bts r12,6
	stc
LB_11185:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11183:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_11198
	btr r12,7
	clc
	jmp LB_11199
LB_11198:
	bts r12,7
	stc
LB_11199:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11188
	btr r12,5
	clc
	jmp LB_11189
LB_11188:
	bts r12,5
	stc
LB_11189:
	mov r8,r11
	bt r12,5
	jc LB_11186
	btr r12,2
	jmp LB_11187
LB_11186:
	bts r12,2
LB_11187:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11192
	btr r12,5
	clc
	jmp LB_11193
LB_11192:
	bts r12,5
	stc
LB_11193:
	mov r9,r11
	bt r12,5
	jc LB_11190
	btr r12,3
	jmp LB_11191
LB_11190:
	bts r12,3
LB_11191:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_11196
	btr r12,5
	clc
	jmp LB_11197
LB_11196:
	bts r12,5
	stc
LB_11197:
	mov r10,r11
	bt r12,5
	jc LB_11194
	btr r12,4
	jmp LB_11195
LB_11194:
	bts r12,4
LB_11195:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_11202
	btr r12,7
	clc
	jmp LB_11203
LB_11202:
	bts r12,7
	stc
LB_11203:
	mov r11,rdx
	bt r12,7
	jc LB_11200
	btr r12,5
	jmp LB_11201
LB_11200:
	bts r12,5
LB_11201:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11204:
	cmp r15,0
	jz LB_11205
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11204
LB_11205:
; _f10907 { %_10854 %_10856 } ⊢ { %_10858 %_10859 } : { %_10858 %_10859 }
 ; {>  %_10856~{ 2' 3' 4' }:{ _p10232 _p10223 _p10224 } %_10857~5':_p10227 %_10854~0':_r64 }
; _f10907 { 0' { 2' 3' 4' } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 101110.. |},{ 0' { 2' 3' 4' } } ⊢ { 0' { 1' 2' 3' } }
	mov r14,r8
	bt r12,2
	jc LB_11208
	btr r12,1
	jmp LB_11209
LB_11208:
	bts r12,1
LB_11209:
	mov r8,r9
	bt r12,3
	jc LB_11210
	btr r12,2
	jmp LB_11211
LB_11210:
	bts r12,2
LB_11211:
	mov r9,r10
	bt r12,4
	jc LB_11212
	btr r12,3
	jmp LB_11213
LB_11212:
	bts r12,3
LB_11213:
	call NS_E_10907
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*0]
	bt QWORD rax,5
	jc LB_11206
	btr r12,5
	clc
	jmp LB_11207
LB_11206:
	bts r12,5
	stc
LB_11207:
	add rsp,16
; _f10871 { %_10858 %_10857 } ⊢ { %_10860 %_10861 } : { %_10860 %_10861 }
 ; {>  %_10859~1':_stg %_10858~0':_r64 %_10857~5':_p10227 }
; _f10871 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_11216
	btr r12,1
	jmp LB_11217
LB_11216:
	bts r12,1
LB_11217:
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_11218
	btr r12,2
	jmp LB_11219
LB_11218:
	bts r12,2
LB_11219:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11214
	btr r12,1
	clc
	jmp LB_11215
LB_11214:
	bts r12,1
	stc
LB_11215:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10860 %_10864 }
 ; {>  %_10860~0':_r64 %_10863~2':_stg %_10864~3':_stg %_10862~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_11220
	mov rdi,r8
	call dlt
LB_11220:
	bt r12,1
	jc LB_11221
	mov rdi,r14
	call dlt
LB_11221:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11222
	btr r12,1
	jmp LB_11223
LB_11222:
	bts r12,1
LB_11223:
	ret
MTC_LB_11182:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11224
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11225
	bt QWORD [rdi],0
	jc LB_11226
	btr r12,3
	clc
	jmp LB_11227
LB_11226:
	bts r12,3
	stc
LB_11227:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11225:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11228
	btr r12,2
	jmp LB_11229
LB_11228:
	bts r12,2
LB_11229:
LB_11230:
	cmp r15,0
	jz LB_11231
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11230
LB_11231:
; _f10947 { %_10854 %_10865 } ⊢ { %_10866 %_10867 } : { %_10866 %_10867 }
 ; {>  %_10854~0':_r64 %_10865~2':_p10228 }
; _f10947 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11232
	btr r12,1
	jmp LB_11233
LB_11232:
	bts r12,1
LB_11233:
	call NS_E_10947
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_10866 %_10867 }
 ; {>  %_10866~0':_r64 %_10867~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11224:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_11234
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11235
	bt QWORD [rdi],0
	jc LB_11236
	btr r12,3
	clc
	jmp LB_11237
LB_11236:
	bts r12,3
	stc
LB_11237:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11235:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11238
	btr r12,2
	jmp LB_11239
LB_11238:
	bts r12,2
LB_11239:
LB_11240:
	cmp r15,0
	jz LB_11241
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11240
LB_11241:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11242:
	cmp rax,0
	jz LB_11243
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11242
LB_11243:
; "\226\136\142 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
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
; ∎ { %_10869 %_10870 }
 ; {>  %_10870~1':_stg %_10869~0':_r64 %_10868~2':_p10223 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_11244
	mov rdi,r8
	call dlt
LB_11244:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11234:
NS_E_10853:
; 	|» { 0' 1' }
NS_E_RDI_10853:
MTC_LB_11245:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11246
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11247
	bt QWORD [rdi],0
	jc LB_11248
	btr r12,6
	clc
	jmp LB_11249
LB_11248:
	bts r12,6
	stc
LB_11249:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11247:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_11262
	btr r12,7
	clc
	jmp LB_11263
LB_11262:
	bts r12,7
	stc
LB_11263:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11252
	btr r12,5
	clc
	jmp LB_11253
LB_11252:
	bts r12,5
	stc
LB_11253:
	mov r8,r11
	bt r12,5
	jc LB_11250
	btr r12,2
	jmp LB_11251
LB_11250:
	bts r12,2
LB_11251:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11256
	btr r12,5
	clc
	jmp LB_11257
LB_11256:
	bts r12,5
	stc
LB_11257:
	mov r9,r11
	bt r12,5
	jc LB_11254
	btr r12,3
	jmp LB_11255
LB_11254:
	bts r12,3
LB_11255:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_11260
	btr r12,5
	clc
	jmp LB_11261
LB_11260:
	bts r12,5
	stc
LB_11261:
	mov r10,r11
	bt r12,5
	jc LB_11258
	btr r12,4
	jmp LB_11259
LB_11258:
	bts r12,4
LB_11259:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_11266
	btr r12,7
	clc
	jmp LB_11267
LB_11266:
	bts r12,7
	stc
LB_11267:
	mov r11,rdx
	bt r12,7
	jc LB_11264
	btr r12,5
	jmp LB_11265
LB_11264:
	bts r12,5
LB_11265:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11268:
	cmp r15,0
	jz LB_11269
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11268
LB_11269:
; _f10375 %_10836 ⊢ %_10839 : %_10839
 ; {>  %_10837~4':_p10227 %_10836~3':_p10224 %_10838~5':(_lst)◂({ _stg _p10224 _p10227 }) %_10833~0':_r64 %_10835~2':_stg }
; _f10375 3' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_11278
	btr r12,0
	jmp LB_11279
LB_11278:
	bts r12,0
LB_11279:
	call NS_E_10375
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11280
	btr r12,1
	jmp LB_11281
LB_11280:
	bts r12,1
LB_11281:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_11276
	btr r12,5
	clc
	jmp LB_11277
LB_11276:
	bts r12,5
	stc
LB_11277:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11274
	btr r12,4
	clc
	jmp LB_11275
LB_11274:
	bts r12,4
	stc
LB_11275:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11272
	btr r12,2
	clc
	jmp LB_11273
LB_11272:
	bts r12,2
	stc
LB_11273:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11270
	btr r12,0
	clc
	jmp LB_11271
LB_11270:
	bts r12,0
	stc
LB_11271:
	add rsp,40
; _f10853 { %_10833 %_10838 } ⊢ { %_10840 %_10841 } : { %_10840 %_10841 }
 ; {>  %_10837~4':_p10227 %_10839~1':_stg %_10838~5':(_lst)◂({ _stg _p10224 _p10227 }) %_10833~0':_r64 %_10835~2':_stg }
; _f10853 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_11288
	btr r12,1
	jmp LB_11289
LB_11288:
	bts r12,1
LB_11289:
	call NS_E_10853
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_11290
	btr r12,3
	jmp LB_11291
LB_11290:
	bts r12,3
LB_11291:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11286
	btr r12,4
	clc
	jmp LB_11287
LB_11286:
	bts r12,4
	stc
LB_11287:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11284
	btr r12,2
	clc
	jmp LB_11285
LB_11284:
	bts r12,2
	stc
LB_11285:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11282
	btr r12,1
	clc
	jmp LB_11283
LB_11282:
	bts r12,1
	stc
LB_11283:
	add rsp,32
; _f56 %_10840 ⊢ %_10842 : %_10842
 ; {>  %_10837~4':_p10227 %_10840~0':_r64 %_10841~3':_stg %_10839~1':_stg %_10835~2':_stg }
	add r13,1
; _f10871 { %_10842 %_10837 } ⊢ { %_10843 %_10844 } : { %_10843 %_10844 }
 ; {>  %_10837~4':_p10227 %_10842~0':_r64 %_10841~3':_stg %_10839~1':_stg %_10835~2':_stg }
; _f10871 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11298
	btr r12,1
	jmp LB_11299
LB_11298:
	bts r12,1
LB_11299:
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_11300
	btr r12,4
	jmp LB_11301
LB_11300:
	bts r12,4
LB_11301:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11296
	btr r12,3
	clc
	jmp LB_11297
LB_11296:
	bts r12,3
	stc
LB_11297:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11294
	btr r12,2
	clc
	jmp LB_11295
LB_11294:
	bts r12,2
	stc
LB_11295:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11292
	btr r12,1
	clc
	jmp LB_11293
LB_11292:
	bts r12,1
	stc
LB_11293:
	add rsp,32
; _f55 %_10843 ⊢ %_10845 : %_10845
 ; {>  %_10844~4':_stg %_10841~3':_stg %_10843~0':_r64 %_10839~1':_stg %_10835~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11302:
	cmp rax,0
	jz LB_11303
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11302
LB_11303:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 4'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10846 %_10851 }
 ; {>  %_10848~1':_stg %_10847~2':_stg %_10850~3':_stg %_10851~5':_stg %_10849~4':_stg %_10846~0':_r64 }
; 	∎ { 0' 5' }
	bt r12,1
	jc LB_11304
	mov rdi,r14
	call dlt
LB_11304:
	bt r12,2
	jc LB_11305
	mov rdi,r8
	call dlt
LB_11305:
	bt r12,3
	jc LB_11306
	mov rdi,r9
	call dlt
LB_11306:
	bt r12,4
	jc LB_11307
	mov rdi,r10
	call dlt
LB_11307:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_11308
	btr r12,1
	jmp LB_11309
LB_11308:
	bts r12,1
LB_11309:
	ret
MTC_LB_11246:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11310
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
	jnc LB_11311
	bt QWORD [rdi],0
	jc LB_11312
	btr r12,2
	clc
	jmp LB_11313
LB_11312:
	bts r12,2
	stc
LB_11313:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11311:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11314:
	cmp r15,0
	jz LB_11315
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11314
LB_11315:
; 	» "" _ ⊢ 1' : %_10852
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_10833 %_10852 }
 ; {>  %_10852~1':_stg %_10833~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11310:
NS_E_10832:
; 	|» { 0' 1' }
NS_E_RDI_10832:
MTC_LB_11316:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11317
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
	jnc LB_11318
	bt QWORD [rdi],0
	jc LB_11319
	btr r12,4
	clc
	jmp LB_11320
LB_11319:
	bts r12,4
	stc
LB_11320:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11318:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11323
	btr r12,5
	clc
	jmp LB_11324
LB_11323:
	bts r12,5
	stc
LB_11324:
	mov r8,r11
	bt r12,5
	jc LB_11321
	btr r12,2
	jmp LB_11322
LB_11321:
	bts r12,2
LB_11322:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11327
	btr r12,5
	clc
	jmp LB_11328
LB_11327:
	bts r12,5
	stc
LB_11328:
	mov r9,r11
	bt r12,5
	jc LB_11325
	btr r12,3
	jmp LB_11326
LB_11325:
	bts r12,3
LB_11326:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11329:
	cmp r15,0
	jz LB_11330
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11329
LB_11330:
; _f10375 %_10811 ⊢ %_10813 : %_10813
 ; {>  %_10811~2':_p10224 %_10809~0':_r64 %_10812~3':_p10227 }
; _f10375 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11335
	btr r12,0
	jmp LB_11336
LB_11335:
	bts r12,0
LB_11336:
	call NS_E_10375
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11337
	btr r12,1
	jmp LB_11338
LB_11337:
	bts r12,1
LB_11338:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11333
	btr r12,3
	clc
	jmp LB_11334
LB_11333:
	bts r12,3
	stc
LB_11334:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11331
	btr r12,0
	clc
	jmp LB_11332
LB_11331:
	bts r12,0
	stc
LB_11332:
	add rsp,24
; _f56 %_10809 ⊢ %_10814 : %_10814
 ; {>  %_10809~0':_r64 %_10813~1':_stg %_10812~3':_p10227 }
	add r13,1
; _f10871 { %_10814 %_10812 } ⊢ { %_10815 %_10816 } : { %_10815 %_10816 }
 ; {>  %_10813~1':_stg %_10814~0':_r64 %_10812~3':_p10227 }
; _f10871 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11341
	btr r12,1
	jmp LB_11342
LB_11341:
	bts r12,1
LB_11342:
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_11343
	btr r12,2
	jmp LB_11344
LB_11343:
	bts r12,2
LB_11344:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11339
	btr r12,1
	clc
	jmp LB_11340
LB_11339:
	bts r12,1
	stc
LB_11340:
	add rsp,16
; _f55 %_10815 ⊢ %_10817 : %_10817
 ; {>  %_10813~1':_stg %_10816~2':_stg %_10815~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10817 %_10820 }
 ; {>  %_10820~3':_stg %_10817~0':_r64 %_10818~1':_stg %_10819~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_11345
	mov rdi,r14
	call dlt
LB_11345:
	bt r12,2
	jc LB_11346
	mov rdi,r8
	call dlt
LB_11346:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11347
	btr r12,1
	jmp LB_11348
LB_11347:
	bts r12,1
LB_11348:
	ret
MTC_LB_11317:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11349
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11350
	bt QWORD [rdi],0
	jc LB_11351
	btr r12,3
	clc
	jmp LB_11352
LB_11351:
	bts r12,3
	stc
LB_11352:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11350:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11353
	btr r12,2
	jmp LB_11354
LB_11353:
	bts r12,2
LB_11354:
LB_11355:
	cmp r15,0
	jz LB_11356
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11355
LB_11356:
; _f10315 %_10821 ⊢ %_10822 : %_10822
 ; {>  %_10821~2':_p10226 %_10809~0':_r64 }
; _f10315 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11359
	btr r12,0
	jmp LB_11360
LB_11359:
	bts r12,0
LB_11360:
	call NS_E_10315
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11361
	btr r12,1
	jmp LB_11362
LB_11361:
	bts r12,1
LB_11362:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11357
	btr r12,0
	clc
	jmp LB_11358
LB_11357:
	bts r12,0
	stc
LB_11358:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
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
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_10809 %_10824 }
 ; {>  %_10824~2':_stg %_10809~0':_r64 %_10823~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_11363
	mov rdi,r14
	call dlt
LB_11363:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11364
	btr r12,1
	jmp LB_11365
LB_11364:
	bts r12,1
LB_11365:
	ret
MTC_LB_11349:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_11366
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11367
	bt QWORD [rdi],0
	jc LB_11368
	btr r12,3
	clc
	jmp LB_11369
LB_11368:
	bts r12,3
	stc
LB_11369:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11367:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11370
	btr r12,2
	jmp LB_11371
LB_11370:
	bts r12,2
LB_11371:
LB_11372:
	cmp r15,0
	jz LB_11373
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11372
LB_11373:
; _f56 %_10809 ⊢ %_10826 : %_10826
 ; {>  %_10809~0':_r64 %_10825~2':_p10227 }
	add r13,1
; _f10871 { %_10826 %_10825 } ⊢ { %_10827 %_10828 } : { %_10827 %_10828 }
 ; {>  %_10826~0':_r64 %_10825~2':_p10227 }
; _f10871 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11374
	btr r12,1
	jmp LB_11375
LB_11374:
	bts r12,1
LB_11375:
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_10827 ⊢ %_10829 : %_10829
 ; {>  %_10827~0':_r64 %_10828~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
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
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10829 %_10831 }
 ; {>  %_10829~0':_r64 %_10830~1':_stg %_10831~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_11376
	mov rdi,r14
	call dlt
LB_11376:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11377
	btr r12,1
	jmp LB_11378
LB_11377:
	bts r12,1
LB_11378:
	ret
MTC_LB_11366:
NS_E_10808:
; 	|» 0'
NS_E_RDI_10808:
MTC_LB_11379:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11380
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
	jnc LB_11381
	bt QWORD [rdi],0
	jc LB_11382
	btr r12,3
	clc
	jmp LB_11383
LB_11382:
	bts r12,3
	stc
LB_11383:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11381:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11386
	btr r12,4
	clc
	jmp LB_11387
LB_11386:
	bts r12,4
	stc
LB_11387:
	mov r14,r10
	bt r12,4
	jc LB_11384
	btr r12,1
	jmp LB_11385
LB_11384:
	bts r12,1
LB_11385:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11390
	btr r12,4
	clc
	jmp LB_11391
LB_11390:
	bts r12,4
	stc
LB_11391:
	mov r8,r10
	bt r12,4
	jc LB_11388
	btr r12,2
	jmp LB_11389
LB_11388:
	bts r12,2
LB_11389:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11392:
	cmp r15,0
	jz LB_11393
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11392
LB_11393:
; _f10798 %_10800 ⊢ %_10802 : %_10802
 ; {>  %_10801~2':(_lst)◂(_p10225) %_10800~1':_p10225 }
; _f10798 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11396
	btr r12,0
	jmp LB_11397
LB_11396:
	bts r12,0
LB_11397:
	call NS_E_10798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11394
	btr r12,2
	clc
	jmp LB_11395
LB_11394:
	bts r12,2
	stc
LB_11395:
	add rsp,16
; _f10808 %_10801 ⊢ %_10803 : %_10803
 ; {>  %_10801~2':(_lst)◂(_p10225) %_10802~0':_stg }
; _f10808 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11400
	btr r12,0
	jmp LB_11401
LB_11400:
	bts r12,0
LB_11401:
	call NS_E_10808
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11402
	btr r12,1
	jmp LB_11403
LB_11402:
	bts r12,1
LB_11403:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11398
	btr r12,0
	clc
	jmp LB_11399
LB_11398:
	bts r12,0
	stc
LB_11399:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_10806
 ; {>  %_10806~2':_stg %_10804~0':_stg %_10805~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_11404
	mov rdi,r13
	call dlt
LB_11404:
	bt r12,1
	jc LB_11405
	mov rdi,r14
	call dlt
LB_11405:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11406
	btr r12,0
	jmp LB_11407
LB_11406:
	bts r12,0
LB_11407:
	ret
MTC_LB_11380:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11408
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
	jnc LB_11409
	bt QWORD [rdi],0
	jc LB_11410
	btr r12,1
	clc
	jmp LB_11411
LB_11410:
	bts r12,1
	stc
LB_11411:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11409:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11412:
	cmp r15,0
	jz LB_11413
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11412
LB_11413:
; 	» "" _ ⊢ 0' : %_10807
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10807
 ; {>  %_10807~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11408:
NS_E_10798:
; 	|» 0'
NS_E_RDI_10798:
MTC_LB_11414:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11415
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
	jnc LB_11416
	bt QWORD [rdi],0
	jc LB_11417
	btr r12,2
	clc
	jmp LB_11418
LB_11417:
	bts r12,2
	stc
LB_11418:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11416:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11419
	btr r12,1
	jmp LB_11420
LB_11419:
	bts r12,1
LB_11420:
LB_11421:
	cmp r15,0
	jz LB_11422
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11421
LB_11422:
; _f10808 %_10775 ⊢ %_10776 : %_10776
 ; {>  %_10775~1':(_lst)◂(_p10225) }
; _f10808 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11423
	btr r12,0
	jmp LB_11424
LB_11423:
	bts r12,0
LB_11424:
	call NS_E_10808
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_10778
 ; {>  %_10777~0':_stg %_10778~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_11425
	mov rdi,r13
	call dlt
LB_11425:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11426
	btr r12,0
	jmp LB_11427
LB_11426:
	bts r12,0
LB_11427:
	ret
MTC_LB_11415:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11428
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
	jnc LB_11429
	bt QWORD [rdi],0
	jc LB_11430
	btr r12,3
	clc
	jmp LB_11431
LB_11430:
	bts r12,3
	stc
LB_11431:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11429:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11434
	btr r12,4
	clc
	jmp LB_11435
LB_11434:
	bts r12,4
	stc
LB_11435:
	mov r14,r10
	bt r12,4
	jc LB_11432
	btr r12,1
	jmp LB_11433
LB_11432:
	bts r12,1
LB_11433:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11438
	btr r12,4
	clc
	jmp LB_11439
LB_11438:
	bts r12,4
	stc
LB_11439:
	mov r8,r10
	bt r12,4
	jc LB_11436
	btr r12,2
	jmp LB_11437
LB_11436:
	bts r12,2
LB_11437:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11440:
	cmp r15,0
	jz LB_11441
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11440
LB_11441:
; _f10798 %_10779 ⊢ %_10781 : %_10781
 ; {>  %_10780~2':_p10225 %_10779~1':_p10225 }
; _f10798 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11444
	btr r12,0
	jmp LB_11445
LB_11444:
	bts r12,0
LB_11445:
	call NS_E_10798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11442
	btr r12,2
	clc
	jmp LB_11443
LB_11442:
	bts r12,2
	stc
LB_11443:
	add rsp,16
; _f10798 %_10780 ⊢ %_10782 : %_10782
 ; {>  %_10780~2':_p10225 %_10781~0':_stg }
; _f10798 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11448
	btr r12,0
	jmp LB_11449
LB_11448:
	bts r12,0
LB_11449:
	call NS_E_10798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11450
	btr r12,1
	jmp LB_11451
LB_11450:
	bts r12,1
LB_11451:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11446
	btr r12,0
	clc
	jmp LB_11447
LB_11446:
	bts r12,0
	stc
LB_11447:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\134\146 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_86
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_92
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_10785
 ; {>  %_10785~2':_stg %_10783~0':_stg %_10784~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_11452
	mov rdi,r13
	call dlt
LB_11452:
	bt r12,1
	jc LB_11453
	mov rdi,r14
	call dlt
LB_11453:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11454
	btr r12,0
	jmp LB_11455
LB_11454:
	bts r12,0
LB_11455:
	ret
MTC_LB_11428:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_11456
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
	jnc LB_11457
	bt QWORD [rdi],0
	jc LB_11458
	btr r12,3
	clc
	jmp LB_11459
LB_11458:
	bts r12,3
	stc
LB_11459:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11457:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11462
	btr r12,4
	clc
	jmp LB_11463
LB_11462:
	bts r12,4
	stc
LB_11463:
	mov r14,r10
	bt r12,4
	jc LB_11460
	btr r12,1
	jmp LB_11461
LB_11460:
	bts r12,1
LB_11461:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11466
	btr r12,4
	clc
	jmp LB_11467
LB_11466:
	bts r12,4
	stc
LB_11467:
	mov r8,r10
	bt r12,4
	jc LB_11464
	btr r12,2
	jmp LB_11465
LB_11464:
	bts r12,2
LB_11465:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11468:
	cmp r15,0
	jz LB_11469
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11468
LB_11469:
; _f10798 %_10786 ⊢ %_10788 : %_10788
 ; {>  %_10787~2':_p10225 %_10786~1':_p10225 }
; _f10798 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11472
	btr r12,0
	jmp LB_11473
LB_11472:
	bts r12,0
LB_11473:
	call NS_E_10798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11470
	btr r12,2
	clc
	jmp LB_11471
LB_11470:
	bts r12,2
	stc
LB_11471:
	add rsp,16
; _f10798 %_10787 ⊢ %_10789 : %_10789
 ; {>  %_10788~0':_stg %_10787~2':_p10225 }
; _f10798 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11476
	btr r12,0
	jmp LB_11477
LB_11476:
	bts r12,0
LB_11477:
	call NS_E_10798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11478
	btr r12,1
	jmp LB_11479
LB_11478:
	bts r12,1
LB_11479:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11474
	btr r12,0
	clc
	jmp LB_11475
LB_11474:
	bts r12,0
	stc
LB_11475:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\151\130"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_10792
 ; {>  %_10792~2':_stg %_10790~0':_stg %_10791~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_11480
	mov rdi,r13
	call dlt
LB_11480:
	bt r12,1
	jc LB_11481
	mov rdi,r14
	call dlt
LB_11481:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11482
	btr r12,0
	jmp LB_11483
LB_11482:
	bts r12,0
LB_11483:
	ret
MTC_LB_11456:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_11484
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
	jnc LB_11485
	bt QWORD [rdi],0
	jc LB_11486
	btr r12,2
	clc
	jmp LB_11487
LB_11486:
	bts r12,2
	stc
LB_11487:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11485:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11488
	btr r12,1
	jmp LB_11489
LB_11488:
	bts r12,1
LB_11489:
LB_11490:
	cmp r15,0
	jz LB_11491
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11490
LB_11491:
; _f10171 %_10793 ⊢ %_10794 : %_10794
 ; {>  %_10793~1':_p10160 }
; _f10171 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11492
	btr r12,0
	jmp LB_11493
LB_11492:
	bts r12,0
LB_11493:
	call NS_E_10171
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_10794
 ; {>  %_10794~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11484:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_11494
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂1'
; 0' ⊢ °4◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_11495
	bt QWORD [rdi],0
	jc LB_11496
	btr r12,2
	clc
	jmp LB_11497
LB_11496:
	bts r12,2
	stc
LB_11497:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11495:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_11498
	btr r12,1
	jmp LB_11499
LB_11498:
	bts r12,1
LB_11499:
LB_11500:
	cmp r15,0
	jz LB_11501
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11500
LB_11501:
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "'"
	mov rsi,0x_27
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_10797
 ; {>  %_10796~1':_stg %_10797~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_11502
	mov rdi,r14
	call dlt
LB_11502:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11494:
NS_E_10773:
; 	|» { 0' 1' }
NS_E_RDI_10773:
MTC_LB_11503:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11504
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11505
	bt QWORD [rdi],0
	jc LB_11506
	btr r12,5
	clc
	jmp LB_11507
LB_11506:
	bts r12,5
	stc
LB_11507:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11505:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11516
	btr r12,6
	clc
	jmp LB_11517
LB_11516:
	bts r12,6
	stc
LB_11517:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11510
	btr r12,4
	clc
	jmp LB_11511
LB_11510:
	bts r12,4
	stc
LB_11511:
	mov r8,r10
	bt r12,4
	jc LB_11508
	btr r12,2
	jmp LB_11509
LB_11508:
	bts r12,2
LB_11509:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11514
	btr r12,4
	clc
	jmp LB_11515
LB_11514:
	bts r12,4
	stc
LB_11515:
	mov r9,r10
	bt r12,4
	jc LB_11512
	btr r12,3
	jmp LB_11513
LB_11512:
	bts r12,3
LB_11513:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11520
	btr r12,6
	clc
	jmp LB_11521
LB_11520:
	bts r12,6
	stc
LB_11521:
	mov r10,rcx
	bt r12,6
	jc LB_11518
	btr r12,4
	jmp LB_11519
LB_11518:
	bts r12,4
LB_11519:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11522:
	cmp r15,0
	jz LB_11523
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11522
LB_11523:
; _f10773 { %_10759 %_10763 } ⊢ { %_10764 %_10765 } : { %_10764 %_10765 }
 ; {>  %_10763~4':(_lst)◂({ _stg _p10225 }) %_10762~3':_p10225 %_10761~2':_stg %_10759~0':_r64 }
; _f10773 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11528
	btr r12,1
	jmp LB_11529
LB_11528:
	bts r12,1
LB_11529:
	call NS_E_10773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11526
	btr r12,3
	clc
	jmp LB_11527
LB_11526:
	bts r12,3
	stc
LB_11527:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11524
	btr r12,2
	clc
	jmp LB_11525
LB_11524:
	bts r12,2
	stc
LB_11525:
	add rsp,24
; _f10798 %_10762 ⊢ %_10766 : %_10766
 ; {>  %_10762~3':_p10225 %_10761~2':_stg %_10765~1':_stg %_10764~0':_r64 }
; _f10798 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_11536
	btr r12,0
	jmp LB_11537
LB_11536:
	bts r12,0
LB_11537:
	call NS_E_10798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_11538
	btr r12,3
	jmp LB_11539
LB_11538:
	bts r12,3
LB_11539:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11534
	btr r12,2
	clc
	jmp LB_11535
LB_11534:
	bts r12,2
	stc
LB_11535:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11532
	btr r12,1
	clc
	jmp LB_11533
LB_11532:
	bts r12,1
	stc
LB_11533:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11530
	btr r12,0
	clc
	jmp LB_11531
LB_11530:
	bts r12,0
	stc
LB_11531:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11540:
	cmp rax,0
	jz LB_11541
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11540
LB_11541:
; "\226\136\144 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " : "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10767 %_10771 }
 ; {>  %_10769~3':_stg %_10767~0':_r64 %_10771~4':_stg %_10768~2':_stg %_10770~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_11542
	mov rdi,r9
	call dlt
LB_11542:
	bt r12,2
	jc LB_11543
	mov rdi,r8
	call dlt
LB_11543:
	bt r12,1
	jc LB_11544
	mov rdi,r14
	call dlt
LB_11544:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11545
	btr r12,1
	jmp LB_11546
LB_11545:
	bts r12,1
LB_11546:
	ret
MTC_LB_11504:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11547
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
	jnc LB_11548
	bt QWORD [rdi],0
	jc LB_11549
	btr r12,2
	clc
	jmp LB_11550
LB_11549:
	bts r12,2
	stc
LB_11550:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11548:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11551:
	cmp r15,0
	jz LB_11552
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11551
LB_11552:
; 	» "" _ ⊢ 1' : %_10772
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_10759 %_10772 }
 ; {>  %_10759~0':_r64 %_10772~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11547:
NS_E_10758:
; 	|» { 0' 1' }
NS_E_RDI_10758:
MTC_LB_11553:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11554
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11555
	bt QWORD [rdi],0
	jc LB_11556
	btr r12,3
	clc
	jmp LB_11557
LB_11556:
	bts r12,3
	stc
LB_11557:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11555:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11558
	btr r12,2
	jmp LB_11559
LB_11558:
	bts r12,2
LB_11559:
LB_11560:
	cmp r15,0
	jz LB_11561
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11560
LB_11561:
; _f56 %_10745 ⊢ %_10748 : %_10748
 ; {>  %_10747~2':(_lst)◂({ _stg _p10225 }) %_10745~0':_r64 }
	add r13,1
; _f10773 { %_10748 %_10747 } ⊢ { %_10749 %_10750 } : { %_10749 %_10750 }
 ; {>  %_10747~2':(_lst)◂({ _stg _p10225 }) %_10748~0':_r64 }
; _f10773 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11562
	btr r12,1
	jmp LB_11563
LB_11562:
	bts r12,1
LB_11563:
	call NS_E_10773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_10749 ⊢ %_10751 : %_10751
 ; {>  %_10749~0':_r64 %_10750~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10751 %_10752 }
 ; {>  %_10751~0':_r64 %_10752~1':_stg %_10753~2':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_11564
	mov rdi,r8
	call dlt
LB_11564:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11554:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11565
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11566
	bt QWORD [rdi],0
	jc LB_11567
	btr r12,3
	clc
	jmp LB_11568
LB_11567:
	bts r12,3
	stc
LB_11568:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11566:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11569
	btr r12,2
	jmp LB_11570
LB_11569:
	bts r12,2
LB_11570:
LB_11571:
	cmp r15,0
	jz LB_11572
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11571
LB_11572:
; _f10798 %_10754 ⊢ %_10755 : %_10755
 ; {>  %_10754~2':_p10225 %_10745~0':_r64 }
; _f10798 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11575
	btr r12,0
	jmp LB_11576
LB_11575:
	bts r12,0
LB_11576:
	call NS_E_10798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11577
	btr r12,1
	jmp LB_11578
LB_11577:
	bts r12,1
LB_11578:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11573
	btr r12,0
	clc
	jmp LB_11574
LB_11573:
	bts r12,0
	stc
LB_11574:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
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
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_10745 %_10757 }
 ; {>  %_10757~2':_stg %_10756~1':_stg %_10745~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_11579
	mov rdi,r14
	call dlt
LB_11579:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11580
	btr r12,1
	jmp LB_11581
LB_11580:
	bts r12,1
LB_11581:
	ret
MTC_LB_11565:
NS_E_10744:
; 	|» 0'
NS_E_RDI_10744:
MTC_LB_11582:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11583
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
	jnc LB_11584
	bt QWORD [rdi],0
	jc LB_11585
	btr r12,3
	clc
	jmp LB_11586
LB_11585:
	bts r12,3
	stc
LB_11586:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11584:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11589
	btr r12,4
	clc
	jmp LB_11590
LB_11589:
	bts r12,4
	stc
LB_11590:
	mov r14,r10
	bt r12,4
	jc LB_11587
	btr r12,1
	jmp LB_11588
LB_11587:
	bts r12,1
LB_11588:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11593
	btr r12,4
	clc
	jmp LB_11594
LB_11593:
	bts r12,4
	stc
LB_11594:
	mov r8,r10
	bt r12,4
	jc LB_11591
	btr r12,2
	jmp LB_11592
LB_11591:
	bts r12,2
LB_11592:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11595:
	cmp r15,0
	jz LB_11596
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11595
LB_11596:
; _f10744 %_10739 ⊢ %_10740 : %_10740
 ; {>  %_10739~2':_p10217 %_10738~1':_p10218 }
; _f10744 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11599
	btr r12,0
	jmp LB_11600
LB_11599:
	bts r12,0
LB_11600:
	call NS_E_10744
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11597
	btr r12,1
	clc
	jmp LB_11598
LB_11597:
	bts r12,1
	stc
LB_11598:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_10742
 ; {>  %_10741~0':_stg %_10742~2':_stg %_10738~1':_p10218 }
; 	∎ 2'
	bt r12,0
	jc LB_11601
	mov rdi,r13
	call dlt
LB_11601:
	bt r12,1
	jc LB_11602
	mov rdi,r14
	call dlt
LB_11602:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11603
	btr r12,0
	jmp LB_11604
LB_11603:
	bts r12,0
LB_11604:
	ret
MTC_LB_11583:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11605
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
	jnc LB_11606
	bt QWORD [rdi],0
	jc LB_11607
	btr r12,1
	clc
	jmp LB_11608
LB_11607:
	bts r12,1
	stc
LB_11608:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11606:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11609:
	cmp r15,0
	jz LB_11610
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11609
LB_11610:
; 	» "" _ ⊢ 0' : %_10743
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_10743
 ; {>  %_10743~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11605:
NS_E_10736:
; 	|» { 0' 1' }
NS_E_RDI_10736:
MTC_LB_11611:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11612
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11613
	bt QWORD [rdi],0
	jc LB_11614
	btr r12,3
	clc
	jmp LB_11615
LB_11614:
	bts r12,3
	stc
LB_11615:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11613:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11616
	btr r12,2
	jmp LB_11617
LB_11616:
	bts r12,2
LB_11617:
LB_11618:
	cmp r15,0
	jz LB_11619
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11618
LB_11619:
; _f10744 %_10725 ⊢ %_10726 : %_10726
 ; {>  %_10723~0':t4232'(-1) %_10725~2':_p10217 }
; _f10744 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11622
	btr r12,0
	jmp LB_11623
LB_11622:
	bts r12,0
LB_11623:
	call NS_E_10744
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11624
	btr r12,1
	jmp LB_11625
LB_11624:
	bts r12,1
LB_11625:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11620
	btr r12,0
	clc
	jmp LB_11621
LB_11620:
	bts r12,0
	stc
LB_11621:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " !| "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_21
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_7c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10723 %_10728 }
 ; {>  %_10727~1':_stg %_10728~2':_stg %_10723~0':t4232'(-1) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_11626
	mov rdi,r14
	call dlt
LB_11626:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11627
	btr r12,1
	jmp LB_11628
LB_11627:
	bts r12,1
LB_11628:
	ret
MTC_LB_11612:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11629
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11630
	bt QWORD [rdi],0
	jc LB_11631
	btr r12,4
	clc
	jmp LB_11632
LB_11631:
	bts r12,4
	stc
LB_11632:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11630:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11635
	btr r12,5
	clc
	jmp LB_11636
LB_11635:
	bts r12,5
	stc
LB_11636:
	mov r8,r11
	bt r12,5
	jc LB_11633
	btr r12,2
	jmp LB_11634
LB_11633:
	bts r12,2
LB_11634:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11639
	btr r12,5
	clc
	jmp LB_11640
LB_11639:
	bts r12,5
	stc
LB_11640:
	mov r9,r11
	bt r12,5
	jc LB_11637
	btr r12,3
	jmp LB_11638
LB_11637:
	bts r12,3
LB_11638:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11641:
	cmp r15,0
	jz LB_11642
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11641
LB_11642:
; _f10736 { %_10723 %_10730 } ⊢ { %_10731 %_10732 } : { %_10731 %_10732 }
 ; {>  %_10730~3':_p10216 %_10729~2':_p10218 %_10723~0':t4232'(-1) }
; _f10736 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11645
	btr r12,1
	jmp LB_11646
LB_11645:
	bts r12,1
LB_11646:
	call NS_E_10736
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11643
	btr r12,2
	clc
	jmp LB_11644
LB_11643:
	bts r12,2
	stc
LB_11644:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10731 %_10734 }
 ; {>  %_10734~3':_stg %_10729~2':_p10218 %_10733~1':_stg %_10731~0':t4232'(-1) }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_11647
	mov rdi,r8
	call dlt
LB_11647:
	bt r12,1
	jc LB_11648
	mov rdi,r14
	call dlt
LB_11648:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11649
	btr r12,1
	jmp LB_11650
LB_11649:
	bts r12,1
LB_11650:
	ret
MTC_LB_11629:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_11651
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11652
	bt QWORD [rdi],0
	jc LB_11653
	btr r12,2
	clc
	jmp LB_11654
LB_11653:
	bts r12,2
	stc
LB_11654:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11652:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11655:
	cmp r15,0
	jz LB_11656
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11655
LB_11656:
; 	» "" _ ⊢ 1' : %_10735
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_10723 %_10735 }
 ; {>  %_10735~1':_stg %_10723~0':t4232'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11651:
NS_E_10722:
; 	|» { 0' 1' }
NS_E_RDI_10722:
MTC_LB_11657:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11658
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
	btr r12,8
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11659
	bt QWORD [rdi],0
	jc LB_11660
	btr r12,8
	clc
	jmp LB_11661
LB_11660:
	bts r12,8
	stc
LB_11661:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11659:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_11664
	btr r12,9
	clc
	jmp LB_11665
LB_11664:
	bts r12,9
	stc
LB_11665:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_11662
	btr r12,2
	jmp LB_11663
LB_11662:
	bts r12,2
LB_11663:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_11668
	btr r12,9
	clc
	jmp LB_11669
LB_11668:
	bts r12,9
	stc
LB_11669:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_11666
	btr r12,3
	jmp LB_11667
LB_11666:
	bts r12,3
LB_11667:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_11672
	btr r12,9
	clc
	jmp LB_11673
LB_11672:
	bts r12,9
	stc
LB_11673:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_11670
	btr r12,4
	jmp LB_11671
LB_11670:
	bts r12,4
LB_11671:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_11676
	btr r12,9
	clc
	jmp LB_11677
LB_11676:
	bts r12,9
	stc
LB_11677:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_11674
	btr r12,5
	jmp LB_11675
LB_11674:
	bts r12,5
LB_11675:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_11680
	btr r12,9
	clc
	jmp LB_11681
LB_11680:
	bts r12,9
	stc
LB_11681:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_11678
	btr r12,6
	jmp LB_11679
LB_11678:
	bts r12,6
LB_11679:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_11684
	btr r12,9
	clc
	jmp LB_11685
LB_11684:
	bts r12,9
	stc
LB_11685:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_11682
	btr r12,7
	jmp LB_11683
LB_11682:
	bts r12,7
LB_11683:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11686:
	cmp r15,0
	jz LB_11687
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11686
LB_11687:
; _f10375 %_10690 ⊢ %_10696 : %_10696
 ; {>  %_10688~0':_r64 %_10690~2':_p10224 %_10693~5':_p10216 %_10694~6':(_opn)◂(_p10214) %_10692~4':_p10215 %_10695~7':_p10214 %_10691~3':_p10227 }
; _f10375 2' ⊢ 1'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp+8+8*5],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11700
	btr r12,0
	jmp LB_11701
LB_11700:
	bts r12,0
LB_11701:
	call NS_E_10375
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11702
	btr r12,1
	jmp LB_11703
LB_11702:
	bts r12,1
LB_11703:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_11698
	btr r12,7
	clc
	jmp LB_11699
LB_11698:
	bts r12,7
	stc
LB_11699:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_11696
	btr r12,6
	clc
	jmp LB_11697
LB_11696:
	bts r12,6
	stc
LB_11697:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_11694
	btr r12,5
	clc
	jmp LB_11695
LB_11694:
	bts r12,5
	stc
LB_11695:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11692
	btr r12,4
	clc
	jmp LB_11693
LB_11692:
	bts r12,4
	stc
LB_11693:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11690
	btr r12,3
	clc
	jmp LB_11691
LB_11690:
	bts r12,3
	stc
LB_11691:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11688
	btr r12,0
	clc
	jmp LB_11689
LB_11688:
	bts r12,0
	stc
LB_11689:
	add rsp,56
; _f56 %_10688 ⊢ %_10697 : %_10697
 ; {>  %_10688~0':_r64 %_10693~5':_p10216 %_10696~1':_stg %_10694~6':(_opn)◂(_p10214) %_10692~4':_p10215 %_10695~7':_p10214 %_10691~3':_p10227 }
	add r13,1
; _f10871 { %_10697 %_10691 } ⊢ { %_10698 %_10699 } : { %_10698 %_10699 }
 ; {>  %_10693~5':_p10216 %_10696~1':_stg %_10694~6':(_opn)◂(_p10214) %_10697~0':_r64 %_10692~4':_p10215 %_10695~7':_p10214 %_10691~3':_p10227 }
; _f10871 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp+8+8*4],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11714
	btr r12,1
	jmp LB_11715
LB_11714:
	bts r12,1
LB_11715:
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_11716
	btr r12,2
	jmp LB_11717
LB_11716:
	bts r12,2
LB_11717:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_11712
	btr r12,7
	clc
	jmp LB_11713
LB_11712:
	bts r12,7
	stc
LB_11713:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_11710
	btr r12,6
	clc
	jmp LB_11711
LB_11710:
	bts r12,6
	stc
LB_11711:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_11708
	btr r12,5
	clc
	jmp LB_11709
LB_11708:
	bts r12,5
	stc
LB_11709:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_11706
	btr r12,4
	clc
	jmp LB_11707
LB_11706:
	bts r12,4
	stc
LB_11707:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11704
	btr r12,1
	clc
	jmp LB_11705
LB_11704:
	bts r12,1
	stc
LB_11705:
	add rsp,48
; _f55 %_10698 ⊢ %_10700 : %_10700
 ; {>  %_10693~5':_p10216 %_10696~1':_stg %_10694~6':(_opn)◂(_p10214) %_10698~0':_r64 %_10692~4':_p10215 %_10699~2':_stg %_10695~7':_p10214 }
	sub r13,1
; _f10722 { %_10700 %_10695 } ⊢ { %_10701 %_10702 } : { %_10701 %_10702 }
 ; {>  %_10693~5':_p10216 %_10696~1':_stg %_10694~6':(_opn)◂(_p10214) %_10700~0':_r64 %_10692~4':_p10215 %_10699~2':_stg %_10695~7':_p10214 }
; _f10722 { 0' 7' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_11728
	btr r12,1
	jmp LB_11729
LB_11728:
	bts r12,1
LB_11729:
	call NS_E_10722
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_11730
	btr r12,3
	jmp LB_11731
LB_11730:
	bts r12,3
LB_11731:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_11726
	btr r12,6
	clc
	jmp LB_11727
LB_11726:
	bts r12,6
	stc
LB_11727:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_11724
	btr r12,5
	clc
	jmp LB_11725
LB_11724:
	bts r12,5
	stc
LB_11725:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11722
	btr r12,4
	clc
	jmp LB_11723
LB_11722:
	bts r12,4
	stc
LB_11723:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11720
	btr r12,2
	clc
	jmp LB_11721
LB_11720:
	bts r12,2
	stc
LB_11721:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11718
	btr r12,1
	clc
	jmp LB_11719
LB_11718:
	bts r12,1
	stc
LB_11719:
	add rsp,48
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,11
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rdx,rax
	btr r12,7
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11732:
	cmp rax,0
	jz LB_11733
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11732
LB_11733:
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
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10703 %_10707 }
 ; {>  %_10706~3':_stg %_10693~5':_p10216 %_10694~6':(_opn)◂(_p10214) %_10692~4':_p10215 %_10703~0':_r64 %_10707~7':_stg %_10705~2':_stg %_10704~1':_stg }
; 	∎ { 0' 7' }
	bt r12,3
	jc LB_11734
	mov rdi,r9
	call dlt
LB_11734:
	bt r12,5
	jc LB_11735
	mov rdi,r11
	call dlt
LB_11735:
	bt r12,6
	jc LB_11736
	mov rdi,rcx
	call dlt
LB_11736:
	bt r12,4
	jc LB_11737
	mov rdi,r10
	call dlt
LB_11737:
	bt r12,2
	jc LB_11738
	mov rdi,r8
	call dlt
LB_11738:
	bt r12,1
	jc LB_11739
	mov rdi,r14
	call dlt
LB_11739:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_11740
	btr r12,1
	jmp LB_11741
LB_11740:
	bts r12,1
LB_11741:
	ret
MTC_LB_11658:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11742
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11743
	bt QWORD [rdi],0
	jc LB_11744
	btr r12,7
	clc
	jmp LB_11745
LB_11744:
	bts r12,7
	stc
LB_11745:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11743:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_11748
	btr r12,8
	clc
	jmp LB_11749
LB_11748:
	bts r12,8
	stc
LB_11749:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11746
	btr r12,2
	jmp LB_11747
LB_11746:
	bts r12,2
LB_11747:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_11752
	btr r12,8
	clc
	jmp LB_11753
LB_11752:
	bts r12,8
	stc
LB_11753:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11750
	btr r12,3
	jmp LB_11751
LB_11750:
	bts r12,3
LB_11751:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_11756
	btr r12,8
	clc
	jmp LB_11757
LB_11756:
	bts r12,8
	stc
LB_11757:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11754
	btr r12,4
	jmp LB_11755
LB_11754:
	bts r12,4
LB_11755:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_11760
	btr r12,8
	clc
	jmp LB_11761
LB_11760:
	bts r12,8
	stc
LB_11761:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11758
	btr r12,5
	jmp LB_11759
LB_11758:
	bts r12,5
LB_11759:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_11764
	btr r12,8
	clc
	jmp LB_11765
LB_11764:
	bts r12,8
	stc
LB_11765:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11762
	btr r12,6
	jmp LB_11763
LB_11762:
	bts r12,6
LB_11763:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11766:
	cmp r15,0
	jz LB_11767
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11766
LB_11767:
; _f10375 %_10708 ⊢ %_10713 : %_10713
 ; {>  %_10688~0':_r64 %_10709~3':_p10227 %_10712~6':(_opn)◂(_p10214) %_10710~4':_p10215 %_10711~5':_p10216 %_10708~2':_p10224 }
; _f10375 2' ⊢ 1'
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
	jc LB_11778
	btr r12,0
	jmp LB_11779
LB_11778:
	bts r12,0
LB_11779:
	call NS_E_10375
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_11780
	btr r12,1
	jmp LB_11781
LB_11780:
	bts r12,1
LB_11781:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_11776
	btr r12,6
	clc
	jmp LB_11777
LB_11776:
	bts r12,6
	stc
LB_11777:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_11774
	btr r12,5
	clc
	jmp LB_11775
LB_11774:
	bts r12,5
	stc
LB_11775:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11772
	btr r12,4
	clc
	jmp LB_11773
LB_11772:
	bts r12,4
	stc
LB_11773:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11770
	btr r12,3
	clc
	jmp LB_11771
LB_11770:
	bts r12,3
	stc
LB_11771:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11768
	btr r12,0
	clc
	jmp LB_11769
LB_11768:
	bts r12,0
	stc
LB_11769:
	add rsp,48
; _f56 %_10688 ⊢ %_10714 : %_10714
 ; {>  %_10713~1':_stg %_10688~0':_r64 %_10709~3':_p10227 %_10712~6':(_opn)◂(_p10214) %_10710~4':_p10215 %_10711~5':_p10216 }
	add r13,1
; _f10871 { %_10714 %_10709 } ⊢ { %_10715 %_10716 } : { %_10715 %_10716 }
 ; {>  %_10713~1':_stg %_10709~3':_p10227 %_10712~6':(_opn)◂(_p10214) %_10710~4':_p10215 %_10714~0':_r64 %_10711~5':_p10216 }
; _f10871 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11790
	btr r12,1
	jmp LB_11791
LB_11790:
	bts r12,1
LB_11791:
	call NS_E_10871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_11792
	btr r12,2
	jmp LB_11793
LB_11792:
	bts r12,2
LB_11793:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_11788
	btr r12,6
	clc
	jmp LB_11789
LB_11788:
	bts r12,6
	stc
LB_11789:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_11786
	btr r12,5
	clc
	jmp LB_11787
LB_11786:
	bts r12,5
	stc
LB_11787:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_11784
	btr r12,4
	clc
	jmp LB_11785
LB_11784:
	bts r12,4
	stc
LB_11785:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11782
	btr r12,1
	clc
	jmp LB_11783
LB_11782:
	bts r12,1
	stc
LB_11783:
	add rsp,40
; _f55 %_10715 ⊢ %_10717 : %_10717
 ; {>  %_10713~1':_stg %_10715~0':_r64 %_10712~6':(_opn)◂(_p10214) %_10710~4':_p10215 %_10716~2':_stg %_10711~5':_p10216 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,12
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11794:
	cmp rax,0
	jz LB_11795
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11794
LB_11795:
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
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10718 %_10721 }
 ; {>  %_10721~3':_stg %_10719~1':_stg %_10718~0':_r64 %_10712~6':(_opn)◂(_p10214) %_10710~4':_p10215 %_10711~5':_p10216 %_10720~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_11796
	mov rdi,r14
	call dlt
LB_11796:
	bt r12,6
	jc LB_11797
	mov rdi,rcx
	call dlt
LB_11797:
	bt r12,4
	jc LB_11798
	mov rdi,r10
	call dlt
LB_11798:
	bt r12,5
	jc LB_11799
	mov rdi,r11
	call dlt
LB_11799:
	bt r12,2
	jc LB_11800
	mov rdi,r8
	call dlt
LB_11800:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11801
	btr r12,1
	jmp LB_11802
LB_11801:
	bts r12,1
LB_11802:
	ret
MTC_LB_11742:
NS_E_10687:
; 	|» { 0' 1' }
NS_E_RDI_10687:
MTC_LB_11803:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11804
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11805
	bt QWORD [rdi],0
	jc LB_11806
	btr r12,7
	clc
	jmp LB_11807
LB_11806:
	bts r12,7
	stc
LB_11807:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11805:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_11810
	btr r12,8
	clc
	jmp LB_11811
LB_11810:
	bts r12,8
	stc
LB_11811:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11808
	btr r12,2
	jmp LB_11809
LB_11808:
	bts r12,2
LB_11809:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_11814
	btr r12,8
	clc
	jmp LB_11815
LB_11814:
	bts r12,8
	stc
LB_11815:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11812
	btr r12,3
	jmp LB_11813
LB_11812:
	bts r12,3
LB_11813:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_11818
	btr r12,8
	clc
	jmp LB_11819
LB_11818:
	bts r12,8
	stc
LB_11819:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11816
	btr r12,4
	jmp LB_11817
LB_11816:
	bts r12,4
LB_11817:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_11822
	btr r12,8
	clc
	jmp LB_11823
LB_11822:
	bts r12,8
	stc
LB_11823:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11820
	btr r12,5
	jmp LB_11821
LB_11820:
	bts r12,5
LB_11821:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_11826
	btr r12,8
	clc
	jmp LB_11827
LB_11826:
	bts r12,8
	stc
LB_11827:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11824
	btr r12,6
	jmp LB_11825
LB_11824:
	bts r12,6
LB_11825:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11828:
	cmp r15,0
	jz LB_11829
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11828
LB_11829:
; _f10687 { %_10669 %_10675 } ⊢ { %_10676 %_10677 } : { %_10676 %_10677 }
 ; {>  %_10674~5':(_opn)◂(_p10213) %_10669~0':_r64 %_10675~6':_p10213 %_10672~3':_p10215 %_10673~4':_p10216 %_10671~2':(_opn)◂(_stg) }
; _f10687 { 0' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_11838
	btr r12,1
	jmp LB_11839
LB_11838:
	bts r12,1
LB_11839:
	call NS_E_10687
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_11836
	btr r12,5
	clc
	jmp LB_11837
LB_11836:
	bts r12,5
	stc
LB_11837:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11834
	btr r12,4
	clc
	jmp LB_11835
LB_11834:
	bts r12,4
	stc
LB_11835:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11832
	btr r12,3
	clc
	jmp LB_11833
LB_11832:
	bts r12,3
	stc
LB_11833:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11830
	btr r12,2
	clc
	jmp LB_11831
LB_11830:
	bts r12,2
	stc
LB_11831:
	add rsp,40
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11840:
	cmp rax,0
	jz LB_11841
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11840
LB_11841:
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
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10678 %_10680 }
 ; {>  %_10674~5':(_opn)◂(_p10213) %_10679~1':_stg %_10680~6':_stg %_10672~3':_p10215 %_10678~0':_r64 %_10673~4':_p10216 %_10671~2':(_opn)◂(_stg) }
; 	∎ { 0' 6' }
	bt r12,5
	jc LB_11842
	mov rdi,r11
	call dlt
LB_11842:
	bt r12,1
	jc LB_11843
	mov rdi,r14
	call dlt
LB_11843:
	bt r12,3
	jc LB_11844
	mov rdi,r9
	call dlt
LB_11844:
	bt r12,4
	jc LB_11845
	mov rdi,r10
	call dlt
LB_11845:
	bt r12,2
	jc LB_11846
	mov rdi,r8
	call dlt
LB_11846:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_11847
	btr r12,1
	jmp LB_11848
LB_11847:
	bts r12,1
LB_11848:
	ret
MTC_LB_11804:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11849
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11850
	bt QWORD [rdi],0
	jc LB_11851
	btr r12,6
	clc
	jmp LB_11852
LB_11851:
	bts r12,6
	stc
LB_11852:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11850:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_11855
	btr r12,7
	clc
	jmp LB_11856
LB_11855:
	bts r12,7
	stc
LB_11856:
	mov r8,rdx
	bt r12,7
	jc LB_11853
	btr r12,2
	jmp LB_11854
LB_11853:
	bts r12,2
LB_11854:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_11859
	btr r12,7
	clc
	jmp LB_11860
LB_11859:
	bts r12,7
	stc
LB_11860:
	mov r9,rdx
	bt r12,7
	jc LB_11857
	btr r12,3
	jmp LB_11858
LB_11857:
	bts r12,3
LB_11858:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_11863
	btr r12,7
	clc
	jmp LB_11864
LB_11863:
	bts r12,7
	stc
LB_11864:
	mov r10,rdx
	bt r12,7
	jc LB_11861
	btr r12,4
	jmp LB_11862
LB_11861:
	bts r12,4
LB_11862:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_11867
	btr r12,7
	clc
	jmp LB_11868
LB_11867:
	bts r12,7
	stc
LB_11868:
	mov r11,rdx
	bt r12,7
	jc LB_11865
	btr r12,5
	jmp LB_11866
LB_11865:
	bts r12,5
LB_11866:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11869:
	cmp r15,0
	jz LB_11870
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11869
LB_11870:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11871:
	cmp rax,0
	jz LB_11872
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11871
LB_11872:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_10685 %_10686 }
 ; {>  %_10684~5':(_opn)◂(_p10213) %_10685~0':_r64 %_10686~1':_stg %_10683~4':_p10216 %_10682~3':_p10215 %_10681~2':(_opn)◂(_stg) }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_11873
	mov rdi,r11
	call dlt
LB_11873:
	bt r12,4
	jc LB_11874
	mov rdi,r10
	call dlt
LB_11874:
	bt r12,3
	jc LB_11875
	mov rdi,r9
	call dlt
LB_11875:
	bt r12,2
	jc LB_11876
	mov rdi,r8
	call dlt
LB_11876:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11849:
NS_E_10668:
; 	|» { 0' 1' }
NS_E_RDI_10668:
MTC_LB_11877:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11878
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11879
	bt QWORD [rdi],0
	jc LB_11880
	btr r12,3
	clc
	jmp LB_11881
LB_11880:
	bts r12,3
	stc
LB_11881:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11879:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11882
	btr r12,2
	jmp LB_11883
LB_11882:
	bts r12,2
LB_11883:
LB_11884:
	cmp r15,0
	jz LB_11885
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11884
LB_11885:
; _f10687 { %_10660 %_10662 } ⊢ { %_10663 %_10664 } : { %_10663 %_10664 }
 ; {>  %_10660~0':_r64 %_10662~2':_p10213 }
; _f10687 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11886
	btr r12,1
	jmp LB_11887
LB_11886:
	bts r12,1
LB_11887:
	call NS_E_10687
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_10663 %_10664 }
 ; {>  %_10663~0':_r64 %_10664~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11878:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11888
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11889
	bt QWORD [rdi],0
	jc LB_11890
	btr r12,3
	clc
	jmp LB_11891
LB_11890:
	bts r12,3
	stc
LB_11891:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11889:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_11892
	btr r12,2
	jmp LB_11893
LB_11892:
	bts r12,2
LB_11893:
LB_11894:
	cmp r15,0
	jz LB_11895
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11894
LB_11895:
; _f10722 { %_10660 %_10665 } ⊢ { %_10666 %_10667 } : { %_10666 %_10667 }
 ; {>  %_10665~2':_p10214 %_10660~0':_r64 }
; _f10722 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11896
	btr r12,1
	jmp LB_11897
LB_11896:
	bts r12,1
LB_11897:
	call NS_E_10722
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_10666 %_10667 }
 ; {>  %_10666~0':_r64 %_10667~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11888:
NS_E_10659:
; 	|» { 0' 1' }
NS_E_RDI_10659:
MTC_LB_11898:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11899
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11900
	bt QWORD [rdi],0
	jc LB_11901
	btr r12,5
	clc
	jmp LB_11902
LB_11901:
	bts r12,5
	stc
LB_11902:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11900:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11911
	btr r12,6
	clc
	jmp LB_11912
LB_11911:
	bts r12,6
	stc
LB_11912:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11905
	btr r12,4
	clc
	jmp LB_11906
LB_11905:
	bts r12,4
	stc
LB_11906:
	mov r8,r10
	bt r12,4
	jc LB_11903
	btr r12,2
	jmp LB_11904
LB_11903:
	bts r12,2
LB_11904:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11909
	btr r12,4
	clc
	jmp LB_11910
LB_11909:
	bts r12,4
	stc
LB_11910:
	mov r9,r10
	bt r12,4
	jc LB_11907
	btr r12,3
	jmp LB_11908
LB_11907:
	bts r12,3
LB_11908:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11915
	btr r12,6
	clc
	jmp LB_11916
LB_11915:
	bts r12,6
	stc
LB_11916:
	mov r10,rcx
	bt r12,6
	jc LB_11913
	btr r12,4
	jmp LB_11914
LB_11913:
	bts r12,4
LB_11914:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11917:
	cmp r15,0
	jz LB_11918
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11917
LB_11918:
; _f56 %_10642 ⊢ %_10647 : %_10647
 ; {>  %_10645~3':_p10212 %_10644~2':_stg %_10646~4':(_lst)◂({ _stg _p10212 }) %_10642~0':_r64 }
	add r13,1
; _f10668 { %_10647 %_10645 } ⊢ { %_10648 %_10649 } : { %_10648 %_10649 }
 ; {>  %_10645~3':_p10212 %_10644~2':_stg %_10646~4':(_lst)◂({ _stg _p10212 }) %_10647~0':_r64 }
; _f10668 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11923
	btr r12,1
	jmp LB_11924
LB_11923:
	bts r12,1
LB_11924:
	call NS_E_10668
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_11921
	btr r12,4
	clc
	jmp LB_11922
LB_11921:
	bts r12,4
	stc
LB_11922:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11919
	btr r12,2
	clc
	jmp LB_11920
LB_11919:
	bts r12,2
	stc
LB_11920:
	add rsp,24
; _f55 %_10648 ⊢ %_10650 : %_10650
 ; {>  %_10644~2':_stg %_10646~4':(_lst)◂({ _stg _p10212 }) %_10649~1':_stg %_10648~0':_r64 }
	sub r13,1
; _f10659 { %_10650 %_10646 } ⊢ { %_10651 %_10652 } : { %_10651 %_10652 }
 ; {>  %_10644~2':_stg %_10646~4':(_lst)◂({ _stg _p10212 }) %_10650~0':_r64 %_10649~1':_stg }
; _f10659 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11929
	btr r12,1
	jmp LB_11930
LB_11929:
	bts r12,1
LB_11930:
	call NS_E_10659
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_11931
	btr r12,3
	jmp LB_11932
LB_11931:
	bts r12,3
LB_11932:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11927
	btr r12,2
	clc
	jmp LB_11928
LB_11927:
	bts r12,2
	stc
LB_11928:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11925
	btr r12,1
	clc
	jmp LB_11926
LB_11925:
	bts r12,1
	stc
LB_11926:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11933:
	cmp rax,0
	jz LB_11934
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11933
LB_11934:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10653 %_10657 }
 ; {>  %_10654~2':_stg %_10655~1':_stg %_10656~3':_stg %_10653~0':_r64 %_10657~4':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_11935
	mov rdi,r8
	call dlt
LB_11935:
	bt r12,1
	jc LB_11936
	mov rdi,r14
	call dlt
LB_11936:
	bt r12,3
	jc LB_11937
	mov rdi,r9
	call dlt
LB_11937:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11938
	btr r12,1
	jmp LB_11939
LB_11938:
	bts r12,1
LB_11939:
	ret
MTC_LB_11899:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11940
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
	jnc LB_11941
	bt QWORD [rdi],0
	jc LB_11942
	btr r12,2
	clc
	jmp LB_11943
LB_11942:
	bts r12,2
	stc
LB_11943:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11941:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11944:
	cmp r15,0
	jz LB_11945
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11944
LB_11945:
; 	» "" _ ⊢ 1' : %_10658
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_10642 %_10658 }
 ; {>  %_10658~1':_stg %_10642~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11940:
NS_E_10641:
; 	|» { 0' 1' }
NS_E_RDI_10641:
MTC_LB_11946:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11947
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11948
	bt QWORD [rdi],0
	jc LB_11949
	btr r12,5
	clc
	jmp LB_11950
LB_11949:
	bts r12,5
	stc
LB_11950:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11948:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11959
	btr r12,6
	clc
	jmp LB_11960
LB_11959:
	bts r12,6
	stc
LB_11960:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11953
	btr r12,4
	clc
	jmp LB_11954
LB_11953:
	bts r12,4
	stc
LB_11954:
	mov r8,r10
	bt r12,4
	jc LB_11951
	btr r12,2
	jmp LB_11952
LB_11951:
	bts r12,2
LB_11952:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11957
	btr r12,4
	clc
	jmp LB_11958
LB_11957:
	bts r12,4
	stc
LB_11958:
	mov r9,r10
	bt r12,4
	jc LB_11955
	btr r12,3
	jmp LB_11956
LB_11955:
	bts r12,3
LB_11956:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11963
	btr r12,6
	clc
	jmp LB_11964
LB_11963:
	bts r12,6
	stc
LB_11964:
	mov r10,rcx
	bt r12,6
	jc LB_11961
	btr r12,4
	jmp LB_11962
LB_11961:
	bts r12,4
LB_11962:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11965:
	cmp r15,0
	jz LB_11966
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11965
LB_11966:
; _f38 %_10617 ⊢ %_10622 : %_10622
 ; {>  %_10621~4':(_lst)◂({ _stg _p10211 }) %_10620~3':_p10211 %_10617~0':_r64 %_10619~2':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11971
	btr r12,4
	clc
	jmp LB_11972
LB_11971:
	bts r12,4
	stc
LB_11972:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11969
	btr r12,3
	clc
	jmp LB_11970
LB_11969:
	bts r12,3
	stc
LB_11970:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11967
	btr r12,2
	clc
	jmp LB_11968
LB_11967:
	bts r12,2
	stc
LB_11968:
	add rsp,32
; _f10641 { %_10622 %_10621 } ⊢ { %_10623 %_10624 } : { %_10623 %_10624 }
 ; {>  %_10621~4':(_lst)◂({ _stg _p10211 }) %_10622~0':_r64 %_10620~3':_p10211 %_10619~2':_stg }
; _f10641 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11977
	btr r12,1
	jmp LB_11978
LB_11977:
	bts r12,1
LB_11978:
	call NS_E_10641
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_11975
	btr r12,3
	clc
	jmp LB_11976
LB_11975:
	bts r12,3
	stc
LB_11976:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11973
	btr r12,2
	clc
	jmp LB_11974
LB_11973:
	bts r12,2
	stc
LB_11974:
	add rsp,24
MTC_LB_11979:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11980
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_11981
	bt QWORD [rdi],0
	jc LB_11982
	btr r12,5
	clc
	jmp LB_11983
LB_11982:
	bts r12,5
	stc
LB_11983:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11981:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_11984
	btr r12,4
	jmp LB_11985
LB_11984:
	bts r12,4
LB_11985:
LB_11986:
	cmp r15,0
	jz LB_11987
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11986
LB_11987:
; _f56 %_10623 ⊢ %_10626 : %_10626
 ; {>  %_10624~1':_stg %_10623~0':_r64 %_10625~4':(_lst)◂({ _stg _p10225 }) %_10619~2':_stg }
	add r13,1
; _f10773 { %_10626 %_10625 } ⊢ { %_10627 %_10628 } : { %_10627 %_10628 }
 ; {>  %_10624~1':_stg %_10626~0':_r64 %_10625~4':(_lst)◂({ _stg _p10225 }) %_10619~2':_stg }
; _f10773 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_11992
	btr r12,1
	jmp LB_11993
LB_11992:
	bts r12,1
LB_11993:
	call NS_E_10773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_11994
	btr r12,3
	jmp LB_11995
LB_11994:
	bts r12,3
LB_11995:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11990
	btr r12,2
	clc
	jmp LB_11991
LB_11990:
	bts r12,2
	stc
LB_11991:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11988
	btr r12,1
	clc
	jmp LB_11989
LB_11988:
	bts r12,1
	stc
LB_11989:
	add rsp,24
; _f55 %_10627 ⊢ %_10629 : %_10629
 ; {>  %_10628~3':_stg %_10624~1':_stg %_10627~0':_r64 %_10619~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_11996:
	cmp rax,0
	jz LB_11997
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_11996
LB_11997:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10630 %_10634 }
 ; {>  %_10634~4':_stg %_10632~3':_stg %_10631~2':_stg %_10630~0':_r64 %_10633~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_11998
	mov rdi,r9
	call dlt
LB_11998:
	bt r12,2
	jc LB_11999
	mov rdi,r8
	call dlt
LB_11999:
	bt r12,1
	jc LB_12000
	mov rdi,r14
	call dlt
LB_12000:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_12001
	btr r12,1
	jmp LB_12002
LB_12001:
	bts r12,1
LB_12002:
	ret
MTC_LB_11980:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12003
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_12004
	bt QWORD [rdi],0
	jc LB_12005
	btr r12,5
	clc
	jmp LB_12006
LB_12005:
	bts r12,5
	stc
LB_12006:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12004:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_12007
	btr r12,4
	jmp LB_12008
LB_12007:
	bts r12,4
LB_12008:
LB_12009:
	cmp r15,0
	jz LB_12010
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12009
LB_12010:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12011:
	cmp rax,0
	jz LB_12012
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12011
LB_12012:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10636 %_10639 }
 ; {>  %_10639~3':_stg %_10637~2':_stg %_10638~1':_stg %_10636~0':_r64 %_10635~4':_p10225 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_12013
	mov rdi,r8
	call dlt
LB_12013:
	bt r12,1
	jc LB_12014
	mov rdi,r14
	call dlt
LB_12014:
	bt r12,4
	jc LB_12015
	mov rdi,r10
	call dlt
LB_12015:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12016
	btr r12,1
	jmp LB_12017
LB_12016:
	bts r12,1
LB_12017:
	ret
MTC_LB_12003:
MTC_LB_11947:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12018
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
	jnc LB_12019
	bt QWORD [rdi],0
	jc LB_12020
	btr r12,2
	clc
	jmp LB_12021
LB_12020:
	bts r12,2
	stc
LB_12021:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12019:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12022:
	cmp r15,0
	jz LB_12023
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12022
LB_12023:
; 	» "" _ ⊢ 1' : %_10640
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_10617 %_10640 }
 ; {>  %_10640~1':_stg %_10617~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_12018:
NS_E_10616:
; 	|» { 0' 1' }
NS_E_RDI_10616:
MTC_LB_12024:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12025
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
	jnc LB_12026
	bt QWORD [rdi],0
	jc LB_12027
	btr r12,4
	clc
	jmp LB_12028
LB_12027:
	bts r12,4
	stc
LB_12028:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12026:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_12031
	btr r12,5
	clc
	jmp LB_12032
LB_12031:
	bts r12,5
	stc
LB_12032:
	mov r8,r11
	bt r12,5
	jc LB_12029
	btr r12,2
	jmp LB_12030
LB_12029:
	bts r12,2
LB_12030:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_12035
	btr r12,5
	clc
	jmp LB_12036
LB_12035:
	bts r12,5
	stc
LB_12036:
	mov r9,r11
	bt r12,5
	jc LB_12033
	btr r12,3
	jmp LB_12034
LB_12033:
	bts r12,3
LB_12034:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12037:
	cmp r15,0
	jz LB_12038
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12037
LB_12038:
MTC_LB_12039:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12040
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_12041
	bt QWORD [rdi],0
	jc LB_12042
	btr r12,4
	clc
	jmp LB_12043
LB_12042:
	bts r12,4
	stc
LB_12043:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12041:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_12044
	btr r12,1
	jmp LB_12045
LB_12044:
	bts r12,1
LB_12045:
LB_12046:
	cmp r15,0
	jz LB_12047
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12046
LB_12047:
; _f56 %_10548 ⊢ %_10553 : %_10553
 ; {>  %_10552~1':(_lst)◂(_p10208) %_10548~0':_r64 %_10550~2':_stg }
	add r13,1
; _f10547 { %_10553 %_10552 } ⊢ { %_10554 %_10555 } : { %_10554 %_10555 }
 ; {>  %_10552~1':(_lst)◂(_p10208) %_10550~2':_stg %_10553~0':_r64 }
; _f10547 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_10547
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_12048
	btr r12,2
	clc
	jmp LB_12049
LB_12048:
	bts r12,2
	stc
LB_12049:
	add rsp,16
; _f55 %_10554 ⊢ %_10556 : %_10556
 ; {>  %_10555~1':_stg %_10550~2':_stg %_10554~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12050:
	cmp rax,0
	jz LB_12051
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12050
LB_12051:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0*"\t"
	mov rax,r13
LB_12052:
	cmp rax,0
	jz LB_12053
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12052
LB_12053:
; "\t"
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
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
; ∎ { %_10557 %_10560 }
 ; {>  %_10557~0':_r64 %_10560~3':_stg %_10558~2':_stg %_10559~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_12054
	mov rdi,r8
	call dlt
LB_12054:
	bt r12,1
	jc LB_12055
	mov rdi,r14
	call dlt
LB_12055:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12056
	btr r12,1
	jmp LB_12057
LB_12056:
	bts r12,1
LB_12057:
	ret
MTC_LB_12040:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12058
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_12059
	bt QWORD [rdi],0
	jc LB_12060
	btr r12,4
	clc
	jmp LB_12061
LB_12060:
	bts r12,4
	stc
LB_12061:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12059:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_12062
	btr r12,1
	jmp LB_12063
LB_12062:
	bts r12,1
LB_12063:
LB_12064:
	cmp r15,0
	jz LB_12065
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12064
LB_12065:
; _f10171 %_10561 ⊢ %_10562 : %_10562
 ; {>  %_10548~0':_r64 %_10550~2':_stg %_10561~1':_p10160 }
; _f10171 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_12070
	btr r12,0
	jmp LB_12071
LB_12070:
	bts r12,0
LB_12071:
	call NS_E_10171
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_12072
	btr r12,1
	jmp LB_12073
LB_12072:
	bts r12,1
LB_12073:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_12068
	btr r12,2
	clc
	jmp LB_12069
LB_12068:
	bts r12,2
	stc
LB_12069:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_12066
	btr r12,0
	clc
	jmp LB_12067
LB_12066:
	bts r12,0
	stc
LB_12067:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12074:
	cmp rax,0
	jz LB_12075
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12074
LB_12075:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_10563 %_10566 }
 ; {>  %_10566~3':_stg %_10565~1':_stg %_10564~2':_stg %_10563~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_12076
	mov rdi,r14
	call dlt
LB_12076:
	bt r12,2
	jc LB_12077
	mov rdi,r8
	call dlt
LB_12077:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12078
	btr r12,1
	jmp LB_12079
LB_12078:
	bts r12,1
LB_12079:
	ret
MTC_LB_12058:
MTC_LB_12025:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12080
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_12081
	bt QWORD [rdi],0
	jc LB_12082
	btr r12,3
	clc
	jmp LB_12083
LB_12082:
	bts r12,3
	stc
LB_12083:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12081:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_12084
	btr r12,2
	jmp LB_12085
LB_12084:
	bts r12,2
LB_12085:
LB_12086:
	cmp r15,0
	jz LB_12087
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12086
LB_12087:
; _f56 %_10548 ⊢ %_10568 : %_10568
 ; {>  %_10567~2':(_lst)◂({ _stg _p10212 }) %_10548~0':_r64 }
	add r13,1
; _f10659 { %_10568 %_10567 } ⊢ { %_10569 %_10570 } : { %_10569 %_10570 }
 ; {>  %_10568~0':_r64 %_10567~2':(_lst)◂({ _stg _p10212 }) }
; _f10659 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12088
	btr r12,1
	jmp LB_12089
LB_12088:
	bts r12,1
LB_12089:
	call NS_E_10659
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_10569 ⊢ %_10571 : %_10571
 ; {>  %_10569~0':_r64 %_10570~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,8
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12090:
	cmp rax,0
	jz LB_12091
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12090
LB_12091:
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10572 %_10574 }
 ; {>  %_10572~0':_r64 %_10573~1':_stg %_10574~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_12092
	mov rdi,r14
	call dlt
LB_12092:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12093
	btr r12,1
	jmp LB_12094
LB_12093:
	bts r12,1
LB_12094:
	ret
MTC_LB_12080:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_12095
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' }
; 1' ⊢ °2◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_12096
	bt QWORD [rdi],0
	jc LB_12097
	btr r12,4
	clc
	jmp LB_12098
LB_12097:
	bts r12,4
	stc
LB_12098:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12096:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_12101
	btr r12,5
	clc
	jmp LB_12102
LB_12101:
	bts r12,5
	stc
LB_12102:
	mov r8,r11
	bt r12,5
	jc LB_12099
	btr r12,2
	jmp LB_12100
LB_12099:
	bts r12,2
LB_12100:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_12105
	btr r12,5
	clc
	jmp LB_12106
LB_12105:
	bts r12,5
	stc
LB_12106:
	mov r9,r11
	bt r12,5
	jc LB_12103
	btr r12,3
	jmp LB_12104
LB_12103:
	bts r12,3
LB_12104:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12107:
	cmp r15,0
	jz LB_12108
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12107
LB_12108:
; _f56 %_10548 ⊢ %_10577 : %_10577
 ; {>  %_10575~2':_stg %_10548~0':_r64 %_10576~3':_p10210 }
	add r13,1
; _f10832 { %_10577 %_10576 } ⊢ { %_10578 %_10579 } : { %_10578 %_10579 }
 ; {>  %_10575~2':_stg %_10577~0':_r64 %_10576~3':_p10210 }
; _f10832 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12111
	btr r12,1
	jmp LB_12112
LB_12111:
	bts r12,1
LB_12112:
	call NS_E_10832
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_12109
	btr r12,2
	clc
	jmp LB_12110
LB_12109:
	bts r12,2
	stc
LB_12110:
	add rsp,16
; _f55 %_10578 ⊢ %_10580 : %_10580
 ; {>  %_10579~1':_stg %_10578~0':_r64 %_10575~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12113:
	cmp rax,0
	jz LB_12114
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12113
LB_12114:
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10581 %_10584 }
 ; {>  %_10582~2':_stg %_10584~3':_stg %_10583~1':_stg %_10581~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_12115
	mov rdi,r8
	call dlt
LB_12115:
	bt r12,1
	jc LB_12116
	mov rdi,r14
	call dlt
LB_12116:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12117
	btr r12,1
	jmp LB_12118
LB_12117:
	bts r12,1
LB_12118:
	ret
MTC_LB_12095:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_12119
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂2'
; 1' ⊢ °3◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_12120
	bt QWORD [rdi],0
	jc LB_12121
	btr r12,3
	clc
	jmp LB_12122
LB_12121:
	bts r12,3
	stc
LB_12122:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12120:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_12123
	btr r12,2
	jmp LB_12124
LB_12123:
	bts r12,2
LB_12124:
LB_12125:
	cmp r15,0
	jz LB_12126
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12125
LB_12126:
; _f56 %_10548 ⊢ %_10586 : %_10586
 ; {>  %_10585~2':(_lst)◂({ _stg _p10224 _p10227 }) %_10548~0':_r64 }
	add r13,1
; _f10853 { %_10586 %_10585 } ⊢ { %_10587 %_10588 } : { %_10587 %_10588 }
 ; {>  %_10586~0':_r64 %_10585~2':(_lst)◂({ _stg _p10224 _p10227 }) }
; _f10853 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12127
	btr r12,1
	jmp LB_12128
LB_12127:
	bts r12,1
LB_12128:
	call NS_E_10853
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_10587 ⊢ %_10589 : %_10589
 ; {>  %_10588~1':_stg %_10587~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12129:
	cmp rax,0
	jz LB_12130
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12129
LB_12130:
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
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10590 %_10592 }
 ; {>  %_10592~2':_stg %_10591~1':_stg %_10590~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_12131
	mov rdi,r14
	call dlt
LB_12131:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12132
	btr r12,1
	jmp LB_12133
LB_12132:
	bts r12,1
LB_12133:
	ret
MTC_LB_12119:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_12134
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{ 2' 3' }
; 1' ⊢ °4◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_12135
	bt QWORD [rdi],0
	jc LB_12136
	btr r12,4
	clc
	jmp LB_12137
LB_12136:
	bts r12,4
	stc
LB_12137:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12135:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_12140
	btr r12,5
	clc
	jmp LB_12141
LB_12140:
	bts r12,5
	stc
LB_12141:
	mov r8,r11
	bt r12,5
	jc LB_12138
	btr r12,2
	jmp LB_12139
LB_12138:
	bts r12,2
LB_12139:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_12144
	btr r12,5
	clc
	jmp LB_12145
LB_12144:
	bts r12,5
	stc
LB_12145:
	mov r9,r11
	bt r12,5
	jc LB_12142
	btr r12,3
	jmp LB_12143
LB_12142:
	bts r12,3
LB_12143:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12146:
	cmp r15,0
	jz LB_12147
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12146
LB_12147:
MTC_LB_12148:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12149
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_12150
	bt QWORD [rdi],0
	jc LB_12151
	btr r12,4
	clc
	jmp LB_12152
LB_12151:
	bts r12,4
	stc
LB_12152:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12150:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_12153
	btr r12,1
	jmp LB_12154
LB_12153:
	bts r12,1
LB_12154:
LB_12155:
	cmp r15,0
	jz LB_12156
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12155
LB_12156:
; _f56 %_10548 ⊢ %_10596 : %_10596
 ; {>  %_10595~1':(_lst)◂({ _stg _p10225 }) %_10548~0':_r64 %_10593~2':_stg }
	add r13,1
; _f10773 { %_10596 %_10595 } ⊢ { %_10597 %_10598 } : { %_10597 %_10598 }
 ; {>  %_10596~0':_r64 %_10595~1':(_lst)◂({ _stg _p10225 }) %_10593~2':_stg }
; _f10773 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_10773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_12157
	btr r12,2
	clc
	jmp LB_12158
LB_12157:
	bts r12,2
	stc
LB_12158:
	add rsp,16
; _f55 %_10597 ⊢ %_10599 : %_10599
 ; {>  %_10597~0':_r64 %_10593~2':_stg %_10598~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12159:
	cmp rax,0
	jz LB_12160
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12159
LB_12160:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10600 %_10603 }
 ; {>  %_10603~3':_stg %_10601~2':_stg %_10600~0':_r64 %_10602~1':_stg }
; 	∎ { 0' 3' }
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
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12163
	btr r12,1
	jmp LB_12164
LB_12163:
	bts r12,1
LB_12164:
	ret
MTC_LB_12149:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12165
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_12166
	bt QWORD [rdi],0
	jc LB_12167
	btr r12,4
	clc
	jmp LB_12168
LB_12167:
	bts r12,4
	stc
LB_12168:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12166:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_12169
	btr r12,1
	jmp LB_12170
LB_12169:
	bts r12,1
LB_12170:
LB_12171:
	cmp r15,0
	jz LB_12172
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12171
LB_12172:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12173:
	cmp rax,0
	jz LB_12174
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12173
LB_12174:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_10605 %_10607 }
 ; {>  %_10604~1':_p10225 %_10607~3':_stg %_10606~2':_stg %_10605~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_12175
	mov rdi,r14
	call dlt
LB_12175:
	bt r12,2
	jc LB_12176
	mov rdi,r8
	call dlt
LB_12176:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12177
	btr r12,1
	jmp LB_12178
LB_12177:
	bts r12,1
LB_12178:
	ret
MTC_LB_12165:
MTC_LB_12134:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_12179
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °5◂2'
; 1' ⊢ °5◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_12180
	bt QWORD [rdi],0
	jc LB_12181
	btr r12,3
	clc
	jmp LB_12182
LB_12181:
	bts r12,3
	stc
LB_12182:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12180:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_12183
	btr r12,2
	jmp LB_12184
LB_12183:
	bts r12,2
LB_12184:
LB_12185:
	cmp r15,0
	jz LB_12186
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12185
LB_12186:
; _f56 %_10548 ⊢ %_10609 : %_10609
 ; {>  %_10608~2':(_lst)◂({ _stg _p10211 }) %_10548~0':_r64 }
	add r13,1
; _f10641 { %_10609 %_10608 } ⊢ { %_10610 %_10611 } : { %_10610 %_10611 }
 ; {>  %_10608~2':(_lst)◂({ _stg _p10211 }) %_10609~0':_r64 }
; _f10641 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12187
	btr r12,1
	jmp LB_12188
LB_12187:
	bts r12,1
LB_12188:
	call NS_E_10641
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_10610 ⊢ %_10612 : %_10612
 ; {>  %_10611~1':_stg %_10610~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_12189:
	cmp rax,0
	jz LB_12190
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_12189
LB_12190:
; "\194\182\n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10613 %_10615 }
 ; {>  %_10615~2':_stg %_10613~0':_r64 %_10614~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_12191
	mov rdi,r14
	call dlt
LB_12191:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12192
	btr r12,1
	jmp LB_12193
LB_12192:
	bts r12,1
LB_12193:
	ret
MTC_LB_12179:
NS_E_10547:
; 	|» { 0' 1' }
NS_E_RDI_10547:
MTC_LB_12194:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12195
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
	jnc LB_12196
	bt QWORD [rdi],0
	jc LB_12197
	btr r12,2
	clc
	jmp LB_12198
LB_12197:
	bts r12,2
	stc
LB_12198:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12196:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12199:
	cmp r15,0
	jz LB_12200
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12199
LB_12200:
; 	» "" _ ⊢ 1' : %_10537
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_10535 %_10537 }
 ; {>  %_10535~0':_r64 %_10537~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_12195:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12201
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
	jnc LB_12202
	bt QWORD [rdi],0
	jc LB_12203
	btr r12,4
	clc
	jmp LB_12204
LB_12203:
	bts r12,4
	stc
LB_12204:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12202:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_12207
	btr r12,5
	clc
	jmp LB_12208
LB_12207:
	bts r12,5
	stc
LB_12208:
	mov r8,r11
	bt r12,5
	jc LB_12205
	btr r12,2
	jmp LB_12206
LB_12205:
	bts r12,2
LB_12206:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_12211
	btr r12,5
	clc
	jmp LB_12212
LB_12211:
	bts r12,5
	stc
LB_12212:
	mov r9,r11
	bt r12,5
	jc LB_12209
	btr r12,3
	jmp LB_12210
LB_12209:
	bts r12,3
LB_12210:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12213:
	cmp r15,0
	jz LB_12214
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12213
LB_12214:
; _f10616 { %_10535 %_10538 } ⊢ { %_10540 %_10541 } : { %_10540 %_10541 }
 ; {>  %_10539~3':(_lst)◂(_p10208) %_10535~0':_r64 %_10538~2':_p10208 }
; _f10616 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12217
	btr r12,1
	jmp LB_12218
LB_12217:
	bts r12,1
LB_12218:
	call NS_E_10616
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_12215
	btr r12,3
	clc
	jmp LB_12216
LB_12215:
	bts r12,3
	stc
LB_12216:
	add rsp,16
; _f10547 { %_10540 %_10539 } ⊢ { %_10542 %_10543 } : { %_10542 %_10543 }
 ; {>  %_10539~3':(_lst)◂(_p10208) %_10541~1':_stg %_10540~0':_r64 }
; _f10547 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12221
	btr r12,1
	jmp LB_12222
LB_12221:
	bts r12,1
LB_12222:
	call NS_E_10547
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_12223
	btr r12,2
	jmp LB_12224
LB_12223:
	bts r12,2
LB_12224:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_12219
	btr r12,1
	clc
	jmp LB_12220
LB_12219:
	bts r12,1
	stc
LB_12220:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_10542 %_10546 }
 ; {>  %_10546~3':_stg %_10545~2':_stg %_10544~1':_stg %_10542~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_12225
	mov rdi,r8
	call dlt
LB_12225:
	bt r12,1
	jc LB_12226
	mov rdi,r14
	call dlt
LB_12226:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_12227
	btr r12,1
	jmp LB_12228
LB_12227:
	bts r12,1
LB_12228:
	ret
MTC_LB_12201:
NS_E_12232:
NS_E_RDI_12232:
NS_E_12232_ETR_TBL:
NS_E_12232_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_12336
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_12336
	jmp LB_12337
LB_12336:
	jmp LB_12328
LB_12337:
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
	jc LB_12329
	btr r12,0
	clc
	jmp LB_12330
LB_12329:
	bts r12,0
	stc
LB_12330:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12325
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_12236 : %_12236
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_12236
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_12236 ⊢ %_12237 : %_12237
 ; {>  %_12236~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_12237
 ; {>  %_12237~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12323
	btr r12,3
	jmp LB_12324
LB_12323:
	bts r12,3
LB_12324:
	mov r8,0
	bts r12,2
	ret
LB_12325:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12327
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12326
LB_12327:
	add rsp,8
	ret
LB_12328:
	add rsp,16
	pop r14
LB_12326:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_9333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12352
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12344
LB_12352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_12232_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12357
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12358:
	jmp LB_12344
LB_12357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12347
	btr r12,1
	clc
	jmp LB_12348
LB_12347:
	bts r12,1
	stc
LB_12348:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12345
	btr r12,0
	clc
	jmp LB_12346
LB_12345:
	bts r12,0
	stc
LB_12346:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12341
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56 %_12239 ⊢ %_12240 : %_12240
 ; {>  %_12239~1':_r64 %_12238~0':_r64 }
	add r14,1
; _some %_12240 ⊢ %_12241 : %_12241
 ; {>  %_12240~1':_r64 %_12238~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_12241
 ; {>  %_12241~°0◂1':(_opn)◂(_r64) %_12238~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_12338
	mov rdi,r13
	call dlt
LB_12338:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_12339
	btr r12,3
	jmp LB_12340
LB_12339:
	bts r12,3
LB_12340:
	mov r8,0
	bts r12,2
	ret
LB_12341:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12343
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12342
LB_12343:
	add rsp,8
	ret
LB_12344:
	add rsp,32
	pop r14
LB_12342:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12233:
NS_E_RDI_12233:
NS_E_12233_ETR_TBL:
NS_E_12233_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_12375
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_12375
	jmp LB_12376
LB_12375:
	jmp LB_12365
LB_12376:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12380
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12381
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12381:
	jmp LB_12365
LB_12380:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12368
	btr r12,1
	clc
	jmp LB_12369
LB_12368:
	bts r12,1
	stc
LB_12369:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12366
	btr r12,0
	clc
	jmp LB_12367
LB_12366:
	bts r12,0
	stc
LB_12367:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12362
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_12383
	btr r12,2
	jmp LB_12384
LB_12383:
	bts r12,2
LB_12384:
	mov r13,r14
	bt r12,1
	jc LB_12385
	btr r12,0
	jmp LB_12386
LB_12385:
	bts r12,0
LB_12386:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_12242 ⊢ %_12243 : %_12243
 ; {>  %_12242~0':_r64 }
	add r13,1
; _some %_12243 ⊢ %_12244 : %_12244
 ; {>  %_12243~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_12244
 ; {>  %_12244~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12360
	btr r12,3
	jmp LB_12361
LB_12360:
	bts r12,3
LB_12361:
	mov r8,0
	bts r12,2
	ret
LB_12362:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12364
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12363
LB_12364:
	add rsp,8
	ret
LB_12365:
	add rsp,32
	pop r14
LB_12363:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_12402
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_12402
	jmp LB_12403
LB_12402:
	jmp LB_12392
LB_12403:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12407
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12408
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12408:
	jmp LB_12392
LB_12407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12395
	btr r12,1
	clc
	jmp LB_12396
LB_12395:
	bts r12,1
	stc
LB_12396:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12393
	btr r12,0
	clc
	jmp LB_12394
LB_12393:
	bts r12,0
	stc
LB_12394:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12389
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_12410
	btr r12,2
	jmp LB_12411
LB_12410:
	bts r12,2
LB_12411:
	mov r13,r14
	bt r12,1
	jc LB_12412
	btr r12,0
	jmp LB_12413
LB_12412:
	bts r12,0
LB_12413:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_12245 ⊢ %_12246 : %_12246
 ; {>  %_12245~0':_r64 }
	add r13,1
; _some %_12246 ⊢ %_12247 : %_12247
 ; {>  %_12246~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_12247
 ; {>  %_12247~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12387
	btr r12,3
	jmp LB_12388
LB_12387:
	bts r12,3
LB_12388:
	mov r8,0
	bts r12,2
	ret
LB_12389:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12391
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12390
LB_12391:
	add rsp,8
	ret
LB_12392:
	add rsp,32
	pop r14
LB_12390:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12416
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_12248 : %_12248
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_12248
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_12248 ⊢ %_12249 : %_12249
 ; {>  %_12248~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_12249
 ; {>  %_12249~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12414
	btr r12,3
	jmp LB_12415
LB_12414:
	bts r12,3
LB_12415:
	mov r8,0
	bts r12,2
	ret
LB_12416:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12418
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12417
LB_12418:
	add rsp,8
	ret
LB_12419:
	add rsp,0
	pop r14
LB_12417:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12234:
NS_E_RDI_12234:
NS_E_12234_ETR_TBL:
NS_E_12234_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12499
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12446
LB_12499:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_12507
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_12507
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_12507
	jmp LB_12508
LB_12507:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12505
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12505:
	jmp LB_12446
LB_12508:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12463
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12464
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12464:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12465
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12465:
	jmp LB_12447
LB_12463:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_12475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_12475
	jmp LB_12476
LB_12475:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12471
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12471:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12472
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12472:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12473
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12473:
	jmp LB_12447
LB_12476:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_12235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12480
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_12481
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_12481:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12482
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12482:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12483
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12483:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12484
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12484:
	jmp LB_12447
LB_12480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_12234_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12489
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_12490
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_12490:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_12491
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_12491:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12492
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12492:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12493
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12493:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12494
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12494:
	jmp LB_12447
LB_12489:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_12458
	btr r12,5
	clc
	jmp LB_12459
LB_12458:
	bts r12,5
	stc
LB_12459:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_12456
	btr r12,4
	clc
	jmp LB_12457
LB_12456:
	bts r12,4
	stc
LB_12457:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_12454
	btr r12,3
	clc
	jmp LB_12455
LB_12454:
	bts r12,3
	stc
LB_12455:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12452
	btr r12,2
	clc
	jmp LB_12453
LB_12452:
	bts r12,2
	stc
LB_12453:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12450
	btr r12,1
	clc
	jmp LB_12451
LB_12450:
	bts r12,1
	stc
LB_12451:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12448
	btr r12,0
	clc
	jmp LB_12449
LB_12448:
	bts r12,0
	stc
LB_12449:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_12443
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_12509
	btr r12,6
	jmp LB_12510
LB_12509:
	bts r12,6
LB_12510:
	mov r8,r10
	bt r12,4
	jc LB_12511
	btr r12,2
	jmp LB_12512
LB_12511:
	bts r12,2
LB_12512:
	mov rdx,r14
	bt r12,1
	jc LB_12513
	btr r12,7
	jmp LB_12514
LB_12513:
	bts r12,7
LB_12514:
	mov r14,rcx
	bt r12,6
	jc LB_12515
	btr r12,1
	jmp LB_12516
LB_12515:
	bts r12,1
LB_12516:
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
	jc LB_12519
	btr r12,6
	clc
	jmp LB_12520
LB_12519:
	bts r12,6
	stc
LB_12520:
	mov r9,rcx
	bt r12,6
	jc LB_12517
	btr r12,3
	jmp LB_12518
LB_12517:
	bts r12,3
LB_12518:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_12523
	btr r12,6
	clc
	jmp LB_12524
LB_12523:
	bts r12,6
	stc
LB_12524:
	mov r10,rcx
	bt r12,6
	jc LB_12521
	btr r12,4
	jmp LB_12522
LB_12521:
	bts r12,4
LB_12522:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_12255 : %_12255
 ; {>  %_12253~3':_r64 %_12254~4':(_lst)◂(_p12229) %_12250~0':_r64 %_12252~2':_r64 %_12251~1':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_12255
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_12255 %_12250 } ⊢ { %_12256 %_12257 } : { %_12256 %_12257 }
 ; {>  %_12253~3':_r64 %_12254~4':(_lst)◂(_p12229) %_12250~0':_r64 %_12252~2':_r64 %_12255~5':_r64 %_12251~1':_r64 }
	add r11,r13
; _f51 { %_12256 %_12251 } ⊢ { %_12258 %_12259 } : { %_12258 %_12259 }
 ; {>  %_12253~3':_r64 %_12257~0':_r64 %_12254~4':(_lst)◂(_p12229) %_12256~5':_r64 %_12252~2':_r64 %_12251~1':_r64 }
	add r11,r14
; _f51 { %_12258 %_12252 } ⊢ { %_12260 %_12261 } : { %_12260 %_12261 }
 ; {>  %_12253~3':_r64 %_12257~0':_r64 %_12254~4':(_lst)◂(_p12229) %_12259~1':_r64 %_12252~2':_r64 %_12258~5':_r64 }
	add r11,r8
; _f12230 %_12260 ⊢ %_12262 : %_12262
 ; {>  %_12261~2':_r64 %_12253~3':_r64 %_12257~0':_r64 %_12254~4':(_lst)◂(_p12229) %_12259~1':_r64 %_12260~5':_r64 }
; _f12230 5' ⊢ °0◂5'
; _cns { %_12262 %_12254 } ⊢ %_12263 : %_12263
 ; {>  %_12262~°0◂5':_p12229 %_12261~2':_r64 %_12253~3':_r64 %_12257~0':_r64 %_12254~4':(_lst)◂(_p12229) %_12259~1':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_12253 %_12263 } ⊢ %_12264 : %_12264
 ; {>  %_12261~2':_r64 %_12253~3':_r64 %_12257~0':_r64 %_12259~1':_r64 %_12263~°0◂{ °0◂5' 4' }:(_lst)◂(_p12229) }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_12264
 ; {>  %_12261~2':_r64 %_12257~0':_r64 %_12259~1':_r64 %_12264~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p12229) }) }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,2
	jc LB_12420
	mov rdi,r8
	call dlt
LB_12420:
	bt r12,0
	jc LB_12421
	mov rdi,r13
	call dlt
LB_12421:
	bt r12,1
	jc LB_12422
	mov rdi,r14
	call dlt
LB_12422:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_12423
	btr r12,0
	jmp LB_12424
LB_12423:
	bts r12,0
LB_12424:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_12427
	btr r12,1
	jmp LB_12428
LB_12427:
	bts r12,1
LB_12428:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_12425
	btr QWORD [rdi],0
	jmp LB_12426
LB_12425:
	bts QWORD [rdi],0
LB_12426:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_12437
	btr r12,0
	jmp LB_12438
LB_12437:
	bts r12,0
LB_12438:
	mov rsi,1
	bt r12,0
	jc LB_12435
	mov rsi,0
	bt r13,0
	jc LB_12435
	jmp LB_12436
LB_12435:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_12436:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_12433
	btr QWORD [rdi],0
	jmp LB_12434
LB_12433:
	bts QWORD [rdi],0
LB_12434:
	mov r13,r10
	bt r12,4
	jc LB_12441
	btr r12,0
	jmp LB_12442
LB_12441:
	bts r12,0
LB_12442:
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_12439
	btr QWORD [rdi],1
	jmp LB_12440
LB_12439:
	bts QWORD [rdi],1
LB_12440:
	mov rsi,1
	bt r12,1
	jc LB_12431
	mov rsi,0
	bt r14,0
	jc LB_12431
	jmp LB_12432
LB_12431:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_12432:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_12429
	btr QWORD [rdi],1
	jmp LB_12430
LB_12429:
	bts QWORD [rdi],1
LB_12430:
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
LB_12447:
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
LB_12446:
	add rsp,96
	pop r14
LB_12444:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12578
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12550
LB_12578:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_12586
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_12586
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_12586
	jmp LB_12587
LB_12586:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12584
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12584:
	jmp LB_12550
LB_12587:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_12232_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12563
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12564
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12564:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12565
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12565:
	jmp LB_12551
LB_12563:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_12234_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12570
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12571
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12571:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12572
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12572:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12573
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12573:
	jmp LB_12551
LB_12570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_12558
	btr r12,3
	clc
	jmp LB_12559
LB_12558:
	bts r12,3
	stc
LB_12559:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12556
	btr r12,2
	clc
	jmp LB_12557
LB_12556:
	bts r12,2
	stc
LB_12557:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12554
	btr r12,1
	clc
	jmp LB_12555
LB_12554:
	bts r12,1
	stc
LB_12555:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12552
	btr r12,0
	clc
	jmp LB_12553
LB_12552:
	bts r12,0
	stc
LB_12553:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_12547
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_12588
	btr r12,4
	jmp LB_12589
LB_12588:
	bts r12,4
LB_12589:
	mov r14,r8
	bt r12,2
	jc LB_12590
	btr r12,1
	jmp LB_12591
LB_12590:
	bts r12,1
LB_12591:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_12592
	btr r12,4
	jmp LB_12593
LB_12592:
	bts r12,4
LB_12593:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_12596
	btr r12,5
	clc
	jmp LB_12597
LB_12596:
	bts r12,5
	stc
LB_12597:
	mov r8,r11
	bt r12,5
	jc LB_12594
	btr r12,2
	jmp LB_12595
LB_12594:
	bts r12,2
LB_12595:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_12600
	btr r12,5
	clc
	jmp LB_12601
LB_12600:
	bts r12,5
	stc
LB_12601:
	mov r9,r11
	bt r12,5
	jc LB_12598
	btr r12,3
	jmp LB_12599
LB_12598:
	bts r12,3
LB_12599:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_12269 : %_12269
 ; {>  %_12268~3':(_lst)◂(_p12229) %_12266~1':_r64 %_12267~2':_r64 %_12265~0':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_12269
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_12269 %_12265 } ⊢ { %_12270 %_12271 } : { %_12270 %_12271 }
 ; {>  %_12268~3':(_lst)◂(_p12229) %_12266~1':_r64 %_12267~2':_r64 %_12265~0':_r64 %_12269~4':_r64 }
	add r10,r13
; _f51 { %_12270 %_12266 } ⊢ { %_12272 %_12273 } : { %_12272 %_12273 }
 ; {>  %_12268~3':(_lst)◂(_p12229) %_12266~1':_r64 %_12271~0':_r64 %_12267~2':_r64 %_12270~4':_r64 }
	add r10,r14
; _f12230 %_12272 ⊢ %_12274 : %_12274
 ; {>  %_12268~3':(_lst)◂(_p12229) %_12272~4':_r64 %_12271~0':_r64 %_12273~1':_r64 %_12267~2':_r64 }
; _f12230 4' ⊢ °0◂4'
; _cns { %_12274 %_12268 } ⊢ %_12275 : %_12275
 ; {>  %_12268~3':(_lst)◂(_p12229) %_12271~0':_r64 %_12273~1':_r64 %_12267~2':_r64 %_12274~°0◂4':_p12229 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_12267 %_12275 } ⊢ %_12276 : %_12276
 ; {>  %_12271~0':_r64 %_12273~1':_r64 %_12275~°0◂{ °0◂4' 3' }:(_lst)◂(_p12229) %_12267~2':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_12276
 ; {>  %_12271~0':_r64 %_12276~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p12229) }) %_12273~1':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_12525
	mov rdi,r13
	call dlt
LB_12525:
	bt r12,1
	jc LB_12526
	mov rdi,r14
	call dlt
LB_12526:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_12527
	btr r12,0
	jmp LB_12528
LB_12527:
	bts r12,0
LB_12528:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_12531
	btr r12,1
	jmp LB_12532
LB_12531:
	bts r12,1
LB_12532:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_12529
	btr QWORD [rdi],0
	jmp LB_12530
LB_12529:
	bts QWORD [rdi],0
LB_12530:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_12541
	btr r12,2
	jmp LB_12542
LB_12541:
	bts r12,2
LB_12542:
	mov rsi,1
	bt r12,2
	jc LB_12539
	mov rsi,0
	bt r8,0
	jc LB_12539
	jmp LB_12540
LB_12539:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_12540:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_12537
	btr QWORD [rdi],0
	jmp LB_12538
LB_12537:
	bts QWORD [rdi],0
LB_12538:
	mov r8,r13
	bt r12,0
	jc LB_12545
	btr r12,2
	jmp LB_12546
LB_12545:
	bts r12,2
LB_12546:
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_12543
	btr QWORD [rdi],1
	jmp LB_12544
LB_12543:
	bts QWORD [rdi],1
LB_12544:
	mov rsi,1
	bt r12,1
	jc LB_12535
	mov rsi,0
	bt r14,0
	jc LB_12535
	jmp LB_12536
LB_12535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_12536:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_12533
	btr QWORD [rdi],1
	jmp LB_12534
LB_12533:
	bts QWORD [rdi],1
LB_12534:
	mov r8,0
	bts r12,2
	ret
LB_12547:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12549
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12548
LB_12549:
	add rsp,8
	ret
LB_12551:
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
LB_12550:
	add rsp,64
	pop r14
LB_12548:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_12232_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12673
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12665
LB_12673:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_12234_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12678
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12679
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12679:
	jmp LB_12665
LB_12678:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12668
	btr r12,1
	clc
	jmp LB_12669
LB_12668:
	bts r12,1
	stc
LB_12669:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12666
	btr r12,0
	clc
	jmp LB_12667
LB_12666:
	bts r12,0
	stc
LB_12667:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12662
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_12681
	btr r12,3
	jmp LB_12682
LB_12681:
	bts r12,3
LB_12682:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_12685
	btr r12,4
	clc
	jmp LB_12686
LB_12685:
	bts r12,4
	stc
LB_12686:
	mov r14,r10
	bt r12,4
	jc LB_12683
	btr r12,1
	jmp LB_12684
LB_12683:
	bts r12,1
LB_12684:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_12689
	btr r12,4
	clc
	jmp LB_12690
LB_12689:
	bts r12,4
	stc
LB_12690:
	mov r8,r10
	bt r12,4
	jc LB_12687
	btr r12,2
	jmp LB_12688
LB_12687:
	bts r12,2
LB_12688:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f51 { %_12278 %_12277 } ⊢ { %_12280 %_12281 } : { %_12280 %_12281 }
 ; {>  %_12277~0':_r64 %_12278~1':_r64 %_12279~2':(_lst)◂(_p12229) }
	add r14,r13
MTC_LB_12602:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12603
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
	jnc LB_12604
	bt QWORD [rdi],0
	jc LB_12605
	btr r12,5
	clc
	jmp LB_12606
LB_12605:
	bts r12,5
	stc
LB_12606:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12604:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_12609
	btr r12,6
	clc
	jmp LB_12610
LB_12609:
	bts r12,6
	stc
LB_12610:
	mov r9,rcx
	bt r12,6
	jc LB_12607
	btr r12,3
	jmp LB_12608
LB_12607:
	bts r12,3
LB_12608:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_12613
	btr r12,6
	clc
	jmp LB_12614
LB_12613:
	bts r12,6
	stc
LB_12614:
	mov r10,rcx
	bt r12,6
	jc LB_12611
	btr r12,4
	jmp LB_12612
LB_12611:
	bts r12,4
LB_12612:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12603
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
	jnc LB_12615
	bt QWORD [rdi],0
	jc LB_12616
	btr r12,6
	clc
	jmp LB_12617
LB_12616:
	bts r12,6
	stc
LB_12617:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12615:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_12618
	btr r12,5
	jmp LB_12619
LB_12618:
	bts r12,5
LB_12619:
LB_12620:
	cmp r15,0
	jz LB_12621
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12620
LB_12621:
; _f51 { %_12284 %_12281 } ⊢ { %_12285 %_12286 } : { %_12285 %_12286 }
 ; {>  %_12284~5':_r64 %_12281~0':_r64 %_12280~1':_r64 %_12283~4':(_lst)◂(_p12229) }
	add r11,r13
; _f12231 %_12285 ⊢ %_12287 : %_12287
 ; {>  %_12286~0':_r64 %_12285~5':_r64 %_12280~1':_r64 %_12283~4':(_lst)◂(_p12229) }
; _f12231 5' ⊢ °1◂5'
; _cns { %_12287 %_12283 } ⊢ %_12288 : %_12288
 ; {>  %_12286~0':_r64 %_12280~1':_r64 %_12287~°1◂5':_p12229 %_12283~4':(_lst)◂(_p12229) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_12280 %_12288 } ⊢ %_12289 : %_12289
 ; {>  %_12286~0':_r64 %_12288~°0◂{ °1◂5' 4' }:(_lst)◂(_p12229) %_12280~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_12289
 ; {>  %_12289~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p12229) }) %_12286~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_12622
	mov rdi,r13
	call dlt
LB_12622:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_12625
	btr r12,0
	jmp LB_12626
LB_12625:
	bts r12,0
LB_12626:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_12623
	btr QWORD [rdi],0
	jmp LB_12624
LB_12623:
	bts QWORD [rdi],0
LB_12624:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_12635
	btr r12,1
	jmp LB_12636
LB_12635:
	bts r12,1
LB_12636:
	mov rsi,1
	bt r12,1
	jc LB_12633
	mov rsi,0
	bt r14,0
	jc LB_12633
	jmp LB_12634
LB_12633:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_12634:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_12631
	btr QWORD [rdi],0
	jmp LB_12632
LB_12631:
	bts QWORD [rdi],0
LB_12632:
	mov r14,r10
	bt r12,4
	jc LB_12639
	btr r12,1
	jmp LB_12640
LB_12639:
	bts r12,1
LB_12640:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_12637
	btr QWORD [rdi],1
	jmp LB_12638
LB_12637:
	bts QWORD [rdi],1
LB_12638:
	mov rsi,1
	bt r12,0
	jc LB_12629
	mov rsi,0
	bt r13,0
	jc LB_12629
	jmp LB_12630
LB_12629:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_12630:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_12627
	btr QWORD [rdi],1
	jmp LB_12628
LB_12627:
	bts QWORD [rdi],1
LB_12628:
	mov r8,0
	bts r12,2
	ret
MTC_LB_12603:
	mov r15,0
LB_12642:
	cmp r15,0
	jz LB_12643
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12642
LB_12643:
; _f12231 %_12281 ⊢ %_12290 : %_12290
 ; {>  %_12281~0':_r64 %_12280~1':_r64 %_12279~2':(_lst)◂(_p12229) }
; _f12231 0' ⊢ °1◂0'
; _cns { %_12290 %_12279 } ⊢ %_12291 : %_12291
 ; {>  %_12290~°1◂0':_p12229 %_12280~1':_r64 %_12279~2':(_lst)◂(_p12229) }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_12280 %_12291 } ⊢ %_12292 : %_12292
 ; {>  %_12291~°0◂{ °1◂0' 2' }:(_lst)◂(_p12229) %_12280~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_12292
 ; {>  %_12292~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p12229) }) }
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
	jc LB_12646
	btr r12,4
	jmp LB_12647
LB_12646:
	bts r12,4
LB_12647:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_12644
	btr QWORD [rdi],0
	jmp LB_12645
LB_12644:
	bts QWORD [rdi],0
LB_12645:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_12656
	btr r12,1
	jmp LB_12657
LB_12656:
	bts r12,1
LB_12657:
	mov rsi,1
	bt r12,1
	jc LB_12654
	mov rsi,0
	bt r14,0
	jc LB_12654
	jmp LB_12655
LB_12654:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_12655:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_12652
	btr QWORD [rdi],0
	jmp LB_12653
LB_12652:
	bts QWORD [rdi],0
LB_12653:
	mov r14,r8
	bt r12,2
	jc LB_12660
	btr r12,1
	jmp LB_12661
LB_12660:
	bts r12,1
LB_12661:
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_12658
	btr QWORD [rdi],1
	jmp LB_12659
LB_12658:
	bts QWORD [rdi],1
LB_12659:
	mov rsi,1
	bt r12,4
	jc LB_12650
	mov rsi,0
	bt r10,0
	jc LB_12650
	jmp LB_12651
LB_12650:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_12651:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_12648
	btr QWORD [rdi],1
	jmp LB_12649
LB_12648:
	bts QWORD [rdi],1
LB_12649:
	mov r8,0
	bts r12,2
	ret
MTC_LB_12641:
LB_12662:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12664
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12663
LB_12664:
	add rsp,8
	ret
LB_12665:
	add rsp,32
	pop r14
LB_12663:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12699
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12293 : %_12293
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_12294 : %_12294
 ; {>  %_12293~°1◂{  }:(_lst)◂(t4703'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_12294
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_12294 %_12293 } ⊢ %_12295 : %_12295
 ; {>  %_12293~°1◂{  }:(_lst)◂(t4703'(0)) %_12294~0':_r64 }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_12295
 ; {>  %_12295~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t4707'(0)) }) }
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
	jc LB_12693
	btr r12,1
	jmp LB_12694
LB_12693:
	bts r12,1
LB_12694:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_12691
	btr QWORD [rdi],0
	jmp LB_12692
LB_12691:
	bts QWORD [rdi],0
LB_12692:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_12697
	mov rsi,0
	bt r14,0
	jc LB_12697
	jmp LB_12698
LB_12697:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_12698:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_12695
	btr QWORD [rdi],1
	jmp LB_12696
LB_12695:
	bts QWORD [rdi],1
LB_12696:
	mov r8,0
	bts r12,2
	ret
LB_12699:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12701
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12700
LB_12701:
	add rsp,8
	ret
LB_12702:
	add rsp,0
	pop r14
LB_12700:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12235:
NS_E_RDI_12235:
NS_E_12235_ETR_TBL:
NS_E_12235_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12740
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12710
LB_12740:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_12748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_12748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_12748
	jmp LB_12749
LB_12748:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12746
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12746:
	jmp LB_12710
LB_12749:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12723
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12724
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12724:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12725
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12725:
	jmp LB_12711
LB_12723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_12735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_12735
	jmp LB_12736
LB_12735:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12731
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12731:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12732
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12732:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12733
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12733:
	jmp LB_12711
LB_12736:
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
	jc LB_12718
	btr r12,3
	clc
	jmp LB_12719
LB_12718:
	bts r12,3
	stc
LB_12719:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12716
	btr r12,2
	clc
	jmp LB_12717
LB_12716:
	bts r12,2
	stc
LB_12717:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12714
	btr r12,1
	clc
	jmp LB_12715
LB_12714:
	bts r12,1
	stc
LB_12715:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12712
	btr r12,0
	clc
	jmp LB_12713
LB_12712:
	bts r12,0
	stc
LB_12713:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_12707
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_12750
	btr r12,4
	jmp LB_12751
LB_12750:
	bts r12,4
LB_12751:
	mov r14,r8
	bt r12,2
	jc LB_12752
	btr r12,1
	jmp LB_12753
LB_12752:
	bts r12,1
LB_12753:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_12298 : %_12298
 ; {>  %_12296~0':_r64 %_12297~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_12298
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_12298 %_12296 } ⊢ { %_12299 %_12300 } : { %_12299 %_12300 }
 ; {>  %_12298~2':_r64 %_12296~0':_r64 %_12297~1':_r64 }
	add r8,r13
; _f51 { %_12299 %_12297 } ⊢ { %_12301 %_12302 } : { %_12301 %_12302 }
 ; {>  %_12300~0':_r64 %_12297~1':_r64 %_12299~2':_r64 }
	add r8,r14
; _some %_12301 ⊢ %_12303 : %_12303
 ; {>  %_12300~0':_r64 %_12301~2':_r64 %_12302~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_12303
 ; {>  %_12303~°0◂2':(_opn)◂(_r64) %_12300~0':_r64 %_12302~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_12703
	mov rdi,r13
	call dlt
LB_12703:
	bt r12,1
	jc LB_12704
	mov rdi,r14
	call dlt
LB_12704:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_12705
	btr r12,3
	jmp LB_12706
LB_12705:
	bts r12,3
LB_12706:
	mov r8,0
	bts r12,2
	ret
LB_12707:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12709
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12708
LB_12709:
	add rsp,8
	ret
LB_12711:
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
LB_12710:
	add rsp,64
	pop r14
LB_12708:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12816
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12763
LB_12816:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_12824
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_12824
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_12824
	jmp LB_12825
LB_12824:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12822
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12822:
	jmp LB_12763
LB_12825:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_12233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12780
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12781
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12781:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12782
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12782:
	jmp LB_12764
LB_12780:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_12792
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_12792
	jmp LB_12793
LB_12792:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12788
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12788:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12789
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12789:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12790
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12790:
	jmp LB_12764
LB_12793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_12235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12797
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_12798
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_12798:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12799
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12799:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12800
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12800:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12801
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12801:
	jmp LB_12764
LB_12797:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_12235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12806
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_12807
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_12807:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_12808
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_12808:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_12809
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_12809:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12810
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12810:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12811
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12811:
	jmp LB_12764
LB_12806:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_12775
	btr r12,5
	clc
	jmp LB_12776
LB_12775:
	bts r12,5
	stc
LB_12776:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_12773
	btr r12,4
	clc
	jmp LB_12774
LB_12773:
	bts r12,4
	stc
LB_12774:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_12771
	btr r12,3
	clc
	jmp LB_12772
LB_12771:
	bts r12,3
	stc
LB_12772:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12769
	btr r12,2
	clc
	jmp LB_12770
LB_12769:
	bts r12,2
	stc
LB_12770:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12767
	btr r12,1
	clc
	jmp LB_12768
LB_12767:
	bts r12,1
	stc
LB_12768:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12765
	btr r12,0
	clc
	jmp LB_12766
LB_12765:
	bts r12,0
	stc
LB_12766:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_12760
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_12826
	btr r12,6
	jmp LB_12827
LB_12826:
	bts r12,6
LB_12827:
	mov r9,r11
	bt r12,5
	jc LB_12828
	btr r12,3
	jmp LB_12829
LB_12828:
	bts r12,3
LB_12829:
	mov r11,r8
	bt r12,2
	jc LB_12830
	btr r12,5
	jmp LB_12831
LB_12830:
	bts r12,5
LB_12831:
	mov r8,r10
	bt r12,4
	jc LB_12832
	btr r12,2
	jmp LB_12833
LB_12832:
	bts r12,2
LB_12833:
	mov r10,r14
	bt r12,1
	jc LB_12834
	btr r12,4
	jmp LB_12835
LB_12834:
	bts r12,4
LB_12835:
	mov r14,r11
	bt r12,5
	jc LB_12836
	btr r12,1
	jmp LB_12837
LB_12836:
	bts r12,1
LB_12837:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_12308 : %_12308
 ; {>  %_12307~3':_r64 %_12306~2':_r64 %_12305~1':_r64 %_12304~0':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_12308
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_12308 %_12304 } ⊢ { %_12309 %_12310 } : { %_12309 %_12310 }
 ; {>  %_12307~3':_r64 %_12306~2':_r64 %_12305~1':_r64 %_12308~4':_r64 %_12304~0':_r64 }
	add r10,r13
; _f51 { %_12309 %_12305 } ⊢ { %_12311 %_12312 } : { %_12311 %_12312 }
 ; {>  %_12310~0':_r64 %_12307~3':_r64 %_12306~2':_r64 %_12305~1':_r64 %_12309~4':_r64 }
	add r10,r14
; _f51 { %_12311 %_12306 } ⊢ { %_12313 %_12314 } : { %_12313 %_12314 }
 ; {>  %_12310~0':_r64 %_12307~3':_r64 %_12312~1':_r64 %_12306~2':_r64 %_12311~4':_r64 }
	add r10,r8
; _f51 { %_12313 %_12307 } ⊢ { %_12315 %_12316 } : { %_12315 %_12316 }
 ; {>  %_12310~0':_r64 %_12307~3':_r64 %_12313~4':_r64 %_12314~2':_r64 %_12312~1':_r64 }
	add r10,r9
; _some %_12315 ⊢ %_12317 : %_12317
 ; {>  %_12316~3':_r64 %_12310~0':_r64 %_12315~4':_r64 %_12314~2':_r64 %_12312~1':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_12317
 ; {>  %_12316~3':_r64 %_12310~0':_r64 %_12314~2':_r64 %_12312~1':_r64 %_12317~°0◂4':(_opn)◂(_r64) }
; 	∎ °0◂4'
	bt r12,3
	jc LB_12754
	mov rdi,r9
	call dlt
LB_12754:
	bt r12,0
	jc LB_12755
	mov rdi,r13
	call dlt
LB_12755:
	bt r12,2
	jc LB_12756
	mov rdi,r8
	call dlt
LB_12756:
	bt r12,1
	jc LB_12757
	mov rdi,r14
	call dlt
LB_12757:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_12758
	btr r12,3
	jmp LB_12759
LB_12758:
	bts r12,3
LB_12759:
	mov r8,0
	bts r12,2
	ret
LB_12760:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12762
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12761
LB_12762:
	add rsp,8
	ret
LB_12764:
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
LB_12763:
	add rsp,96
	pop r14
LB_12761:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_12232_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12852
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12844
LB_12852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_12235_ETR_TBL
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
	jmp LB_12844
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
	jc LB_12847
	btr r12,1
	clc
	jmp LB_12848
LB_12847:
	bts r12,1
	stc
LB_12848:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12845
	btr r12,0
	clc
	jmp LB_12846
LB_12845:
	bts r12,0
	stc
LB_12846:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12841
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f51 { %_12318 %_12319 } ⊢ { %_12320 %_12321 } : { %_12320 %_12321 }
 ; {>  %_12319~1':_r64 %_12318~0':_r64 }
	add r13,r14
; _some %_12320 ⊢ %_12322 : %_12322
 ; {>  %_12320~0':_r64 %_12321~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_12322
 ; {>  %_12321~1':_r64 %_12322~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_12838
	mov rdi,r14
	call dlt
LB_12838:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12839
	btr r12,3
	jmp LB_12840
LB_12839:
	bts r12,3
LB_12840:
	mov r8,0
	bts r12,2
	ret
LB_12841:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12843
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12842
LB_12843:
	add rsp,8
	ret
LB_12844:
	add rsp,32
	pop r14
LB_12842:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12882:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_12882:
MTC_LB_12883:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12884
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
	jnc LB_12885
	bt QWORD [rdi],0
	jc LB_12886
	btr r12,7
	clc
	jmp LB_12887
LB_12886:
	bts r12,7
	stc
LB_12887:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12885:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_12890
	btr r12,8
	clc
	jmp LB_12891
LB_12890:
	bts r12,8
	stc
LB_12891:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_12888
	btr r12,5
	jmp LB_12889
LB_12888:
	bts r12,5
LB_12889:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_12894
	btr r12,8
	clc
	jmp LB_12895
LB_12894:
	bts r12,8
	stc
LB_12895:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_12892
	btr r12,6
	jmp LB_12893
LB_12892:
	bts r12,6
LB_12893:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12896:
	cmp r15,0
	jz LB_12897
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12896
LB_12897:
MTC_LB_12898:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12899
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
	jnc LB_12900
	bt QWORD [rdi],0
	jc LB_12901
	btr r12,7
	clc
	jmp LB_12902
LB_12901:
	bts r12,7
	stc
LB_12902:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12900:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_12903
	btr r12,4
	jmp LB_12904
LB_12903:
	bts r12,4
LB_12904:
LB_12905:
	cmp r15,0
	jz LB_12906
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12905
LB_12906:
; _f53 %_12867 ⊢ { %_12868 %_12869 } : { %_12868 %_12869 }
 ; {>  %_12863~3':_r64 %_12860~0':_stg %_12867~4':_r64 %_12861~1':_r64 %_12862~2':_stg %_12866~6':(_lst)◂(_p12229) }
	mov r11,r10
	bts r12,5
; _f35 { %_12869 %_12860 %_12861 %_12862 %_12863 } ⊢ { %_12870 %_12871 %_12872 %_12873 %_12874 } : { %_12870 %_12871 %_12872 %_12873 %_12874 }
 ; {>  %_12863~3':_r64 %_12860~0':_stg %_12868~4':_r64 %_12869~5':_r64 %_12861~1':_r64 %_12862~2':_stg %_12866~6':(_lst)◂(_p12229) }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_12911
	btr r12,4
	jmp LB_12912
LB_12911:
	bts r12,4
LB_12912:
	mov r9,r8
	bt r12,2
	jc LB_12913
	btr r12,3
	jmp LB_12914
LB_12913:
	bts r12,3
LB_12914:
	mov r8,r14
	bt r12,1
	jc LB_12915
	btr r12,2
	jmp LB_12916
LB_12915:
	bts r12,2
LB_12916:
	mov r14,r13
	bt r12,0
	jc LB_12917
	btr r12,1
	jmp LB_12918
LB_12917:
	bts r12,1
LB_12918:
	mov r13,r11
	bt r12,5
	jc LB_12919
	btr r12,0
	jmp LB_12920
LB_12919:
	bts r12,0
LB_12920:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_12921
	btr r12,5
	jmp LB_12922
LB_12921:
	bts r12,5
LB_12922:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_12909
	btr r12,6
	clc
	jmp LB_12910
LB_12909:
	bts r12,6
	stc
LB_12910:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_12907
	btr r12,4
	clc
	jmp LB_12908
LB_12907:
	bts r12,4
	stc
LB_12908:
	add rsp,24
; _f12882 { %_12871 %_12872 %_12873 %_12874 %_12866 } ⊢ { %_12875 %_12876 } : { %_12875 %_12876 }
 ; {>  %_12872~2':_r64 %_12873~3':_stg %_12868~4':_r64 %_12874~5':_r64 %_12870~0':_r64 %_12866~6':(_lst)◂(_p12229) %_12871~1':_stg }
; _f12882 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_12927
	btr r12,0
	jmp LB_12928
LB_12927:
	bts r12,0
LB_12928:
	mov r14,r8
	bt r12,2
	jc LB_12929
	btr r12,1
	jmp LB_12930
LB_12929:
	bts r12,1
LB_12930:
	mov r8,r9
	bt r12,3
	jc LB_12931
	btr r12,2
	jmp LB_12932
LB_12931:
	bts r12,2
LB_12932:
	mov r9,r11
	bt r12,5
	jc LB_12933
	btr r12,3
	jmp LB_12934
LB_12933:
	bts r12,3
LB_12934:
	mov r10,rcx
	bt r12,6
	jc LB_12935
	btr r12,4
	jmp LB_12936
LB_12935:
	bts r12,4
LB_12936:
	call NS_E_12882
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_12937
	btr r12,2
	jmp LB_12938
LB_12937:
	bts r12,2
LB_12938:
	mov r14,r13
	bt r12,0
	jc LB_12939
	btr r12,1
	jmp LB_12940
LB_12939:
	bts r12,1
LB_12940:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_12925
	btr r12,4
	clc
	jmp LB_12926
LB_12925:
	bts r12,4
	stc
LB_12926:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_12923
	btr r12,0
	clc
	jmp LB_12924
LB_12923:
	bts r12,0
	stc
LB_12924:
	add rsp,24
; ∎ { %_12875 %_12876 }
 ; {>  %_12868~4':_r64 %_12870~0':_r64 %_12875~1':_stg %_12876~2':_stg }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_12941
	mov rdi,r10
	call dlt
LB_12941:
	bt r12,0
	jc LB_12942
	mov rdi,r13
	call dlt
LB_12942:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_12943
	btr r12,0
	jmp LB_12944
LB_12943:
	bts r12,0
LB_12944:
	mov r14,r8
	bt r12,2
	jc LB_12945
	btr r12,1
	jmp LB_12946
LB_12945:
	bts r12,1
LB_12946:
	ret
MTC_LB_12899:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12947
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
	jnc LB_12948
	bt QWORD [rdi],0
	jc LB_12949
	btr r12,7
	clc
	jmp LB_12950
LB_12949:
	bts r12,7
	stc
LB_12950:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12948:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_12951
	btr r12,4
	jmp LB_12952
LB_12951:
	bts r12,4
LB_12952:
LB_12953:
	cmp r15,0
	jz LB_12954
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12953
LB_12954:
; _f51 { %_12861 %_12877 } ⊢ { %_12878 %_12879 } : { %_12878 %_12879 }
 ; {>  %_12863~3':_r64 %_12860~0':_stg %_12861~1':_r64 %_12862~2':_stg %_12866~6':(_lst)◂(_p12229) %_12877~4':_r64 }
	add r14,r10
; _f12882 { %_12860 %_12878 %_12862 %_12863 %_12866 } ⊢ { %_12880 %_12881 } : { %_12880 %_12881 }
 ; {>  %_12863~3':_r64 %_12860~0':_stg %_12879~4':_r64 %_12878~1':_r64 %_12862~2':_stg %_12866~6':(_lst)◂(_p12229) }
; _f12882 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_12957
	btr r12,4
	jmp LB_12958
LB_12957:
	bts r12,4
LB_12958:
	call NS_E_12882
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_12955
	btr r12,4
	clc
	jmp LB_12956
LB_12955:
	bts r12,4
	stc
LB_12956:
	add rsp,16
; ∎ { %_12880 %_12881 }
 ; {>  %_12879~4':_r64 %_12880~0':_stg %_12881~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_12959
	mov rdi,r10
	call dlt
LB_12959:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_12947:
MTC_LB_12884:
	mov r15,0
LB_12961:
	cmp r15,0
	jz LB_12962
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12961
LB_12962:
; ∎ { %_12860 %_12862 }
 ; {>  %_12864~4':(_lst)◂(_p12229) %_12863~3':_r64 %_12860~0':_stg %_12861~1':_r64 %_12862~2':_stg }
; 	∎ { 0' 2' }
	bt r12,4
	jc LB_12963
	mov rdi,r10
	call dlt
LB_12963:
	bt r12,3
	jc LB_12964
	mov rdi,r9
	call dlt
LB_12964:
	bt r12,1
	jc LB_12965
	mov rdi,r14
	call dlt
LB_12965:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_12966
	btr r12,1
	jmp LB_12967
LB_12966:
	bts r12,1
LB_12967:
	ret
MTC_LB_12960:
NS_E_12983:
; 	|» 0'
NS_E_RDI_12983:
; » 0xr0 |~ {  } ⊢ %_12969 : %_12969
 ; {>  %_12968~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_12969
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f12234 { %_12968 %_12969 } ⊢ { %_12970 %_12971 %_12972 } : { %_12970 %_12971 %_12972 }
 ; {>  %_12968~0':_stg %_12969~1':_r64 }
; _f12234 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_12234
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_12984
	btr r12,4
	jmp LB_12985
LB_12984:
	bts r12,4
LB_12985:
	mov r8,r9
	bt r12,3
	jc LB_12988
	btr r12,2
	jmp LB_12989
LB_12988:
	bts r12,2
LB_12989:
	mov rsi,1
	bt r12,2
	jc LB_12986
	mov rsi,0
	bt r8,0
	jc LB_12986
	jmp LB_12987
LB_12986:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_12987:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_12990:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12991
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
	jnc LB_12992
	bt QWORD [rdi],0
	jc LB_12993
	btr r12,5
	clc
	jmp LB_12994
LB_12993:
	bts r12,5
	stc
LB_12994:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12992:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_12997
	btr r12,6
	clc
	jmp LB_12998
LB_12997:
	bts r12,6
	stc
LB_12998:
	mov r9,rcx
	bt r12,6
	jc LB_12995
	btr r12,3
	jmp LB_12996
LB_12995:
	bts r12,3
LB_12996:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_13001
	btr r12,6
	clc
	jmp LB_13002
LB_13001:
	bts r12,6
	stc
LB_13002:
	mov r10,rcx
	bt r12,6
	jc LB_12999
	btr r12,4
	jmp LB_13000
LB_12999:
	bts r12,4
LB_13000:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_13003:
	cmp r15,0
	jz LB_13004
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_13003
LB_13004:
; _f31 %_12973 ⊢ { %_12975 %_12976 } : { %_12975 %_12976 }
 ; {>  %_12970~0':_stg %_12974~4':(_lst)◂(_p12229) %_12973~3':_r64 %_12971~1':_r64 }
; _f31 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_13011
	btr r12,0
	jmp LB_13012
LB_13011:
	bts r12,0
LB_13012:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_13013
	btr r12,2
	jmp LB_13014
LB_13013:
	bts r12,2
LB_13014:
	mov r9,r14
	bt r12,1
	jc LB_13015
	btr r12,3
	jmp LB_13016
LB_13015:
	bts r12,3
LB_13016:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_13009
	btr r12,4
	clc
	jmp LB_13010
LB_13009:
	bts r12,4
	stc
LB_13010:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_13007
	btr r12,1
	clc
	jmp LB_13008
LB_13007:
	bts r12,1
	stc
LB_13008:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_13005
	btr r12,0
	clc
	jmp LB_13006
LB_13005:
	bts r12,0
	stc
LB_13006:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_12977 : %_12977
 ; {>  %_12970~0':_stg %_12975~2':_r64 %_12976~3':_stg %_12974~4':(_lst)◂(_p12229) %_12971~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_12977
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_12978 : %_12978
 ; {>  %_12977~5':_r64 %_12970~0':_stg %_12975~2':_r64 %_12976~3':_stg %_12974~4':(_lst)◂(_p12229) %_12971~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_12978
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f12882 { %_12970 %_12977 %_12976 %_12978 %_12974 } ⊢ { %_12979 %_12980 } : { %_12979 %_12980 }
 ; {>  %_12977~5':_r64 %_12970~0':_stg %_12975~2':_r64 %_12976~3':_stg %_12978~6':_r64 %_12974~4':(_lst)◂(_p12229) %_12971~1':_r64 }
; _f12882 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_13021
	btr r12,1
	jmp LB_13022
LB_13021:
	bts r12,1
LB_13022:
	mov r8,r9
	bt r12,3
	jc LB_13023
	btr r12,2
	jmp LB_13024
LB_13023:
	bts r12,2
LB_13024:
	mov r9,rcx
	bt r12,6
	jc LB_13025
	btr r12,3
	jmp LB_13026
LB_13025:
	bts r12,3
LB_13026:
	call NS_E_12882
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_13027
	btr r12,3
	jmp LB_13028
LB_13027:
	bts r12,3
LB_13028:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_13019
	btr r12,2
	clc
	jmp LB_13020
LB_13019:
	bts r12,2
	stc
LB_13020:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_13017
	btr r12,1
	clc
	jmp LB_13018
LB_13017:
	bts r12,1
	stc
LB_13018:
	add rsp,24
; _some %_12980 ⊢ %_12981 : %_12981
 ; {>  %_12975~2':_r64 %_12971~1':_r64 %_12980~3':_stg %_12979~0':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_12979 %_12981 }
 ; {>  %_12975~2':_r64 %_12981~°0◂3':(_opn)◂(_stg) %_12971~1':_r64 %_12979~0':_stg }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_13029
	mov rdi,r8
	call dlt
LB_13029:
	bt r12,1
	jc LB_13030
	mov rdi,r14
	call dlt
LB_13030:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_13033
	btr r12,1
	jmp LB_13034
LB_13033:
	bts r12,1
LB_13034:
	mov rsi,1
	bt r12,1
	jc LB_13031
	mov rsi,0
	bt r14,0
	jc LB_13031
	jmp LB_13032
LB_13031:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_13032:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_12991:
	mov r15,0
LB_13036:
	cmp r15,0
	jz LB_13037
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_13036
LB_13037:
; _none {  } ⊢ %_12982 : %_12982
 ; {>  %_12970~0':_stg %_12972~2':(_opn)◂({ _r64 (_lst)◂(_p12229) }) %_12971~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_12970 %_12982 }
 ; {>  %_12970~0':_stg %_12982~°1◂{  }:(_opn)◂(t4894'(0)) %_12972~2':(_opn)◂({ _r64 (_lst)◂(_p12229) }) %_12971~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_13038
	mov rdi,r8
	call dlt
LB_13038:
	bt r12,1
	jc LB_13039
	mov rdi,r14
	call dlt
LB_13039:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_13040
	mov rsi,0
	bt r14,0
	jc LB_13040
	jmp LB_13041
LB_13040:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_13041:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_13035:
NS_E_13045:
NS_E_RDI_13045:
; » _^ ..
	xor rax,rax
	add rax,10
	add rax,7
	add rax,4
	add rax,6
	add rax,4
	add rax,6
	add rax,4
	add rax,3
	add rax,7
	add rax,19
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; _f12983 %_13042 ⊢ { %_13043 %_13044 } : { %_13043 %_13044 }
 ; {>  %_13042~0':_stg }
; _f12983 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_12983
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_13043~0':_stg %_13044~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_13046
	mov rdi,r13
	call dlt
LB_13046:
	bt r12,1
	jc LB_13047
	mov rdi,r14
	call dlt
LB_13047:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_13048:
NS_E_RDI_13048:
NS_E_13048_ETR_TBL:
NS_E_13048_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_13077
LB_13076:
	add r14,1
LB_13077:
	cmp r14,r10
	jge LB_13078
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13076
	cmp al,10
	jz LB_13076
	cmp al,32
	jz LB_13076
LB_13078:
	push r10
	call NS_E_10114_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13079
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13069
LB_13079:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_13082
LB_13081:
	add r14,1
LB_13082:
	cmp r14,r10
	jge LB_13083
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13081
	cmp al,10
	jz LB_13081
	cmp al,32
	jz LB_13081
LB_13083:
	add r14,1
	cmp r14,r10
	jg LB_13087
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_13087
	jmp LB_13088
LB_13087:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13085
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13085:
	jmp LB_13069
LB_13088:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_13090
LB_13089:
	add r14,1
LB_13090:
	cmp r14,r10
	jge LB_13091
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13089
	cmp al,10
	jz LB_13089
	cmp al,32
	jz LB_13089
LB_13091:
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13092
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13093
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13093:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13094
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13094:
	jmp LB_13069
LB_13092:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13074
	btr r12,2
	clc
	jmp LB_13075
LB_13074:
	bts r12,2
	stc
LB_13075:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13072
	btr r12,1
	clc
	jmp LB_13073
LB_13072:
	bts r12,1
	stc
LB_13073:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13070
	btr r12,0
	clc
	jmp LB_13071
LB_13070:
	bts r12,0
	stc
LB_13071:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13066
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_13096
	btr r12,3
	jmp LB_13097
LB_13096:
	bts r12,3
LB_13097:
	mov r14,r8
	bt r12,2
	jc LB_13098
	btr r12,1
	jmp LB_13099
LB_13098:
	bts r12,1
LB_13099:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f10161 { %_13049 %_13050 } ⊢ %_13051 : %_13051
 ; {>  %_13049~0':_stg %_13050~1':_p10160 }
; _f10161 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13051 ⊢ %_13052 : %_13052
 ; {>  %_13051~°0◂{ 0' 1' }:_p10160 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13052
 ; {>  %_13052~°0◂°0◂{ 0' 1' }:(_opn)◂(_p10160) }
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
	jc LB_13060
	btr r12,2
	jmp LB_13061
LB_13060:
	bts r12,2
LB_13061:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_13058
	btr QWORD [rdi],0
	jmp LB_13059
LB_13058:
	bts QWORD [rdi],0
LB_13059:
	mov r8,r14
	bt r12,1
	jc LB_13064
	btr r12,2
	jmp LB_13065
LB_13064:
	bts r12,2
LB_13065:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_13062
	btr QWORD [rdi],1
	jmp LB_13063
LB_13062:
	bts QWORD [rdi],1
LB_13063:
	mov rsi,1
	bt r12,3
	jc LB_13056
	mov rsi,0
	bt r9,0
	jc LB_13056
	jmp LB_13057
LB_13056:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13057:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13066:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13068
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13067
LB_13068:
	add rsp,8
	ret
LB_13069:
	add rsp,48
	pop r14
LB_13067:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_13111
LB_13110:
	add r14,1
LB_13111:
	cmp r14,r10
	jge LB_13112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13110
	cmp al,32
	jz LB_13110
LB_13112:
	push r10
	call NS_E_10114_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13113
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13107
LB_13113:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13108
	btr r12,0
	clc
	jmp LB_13109
LB_13108:
	bts r12,0
	stc
LB_13109:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13104
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10162 %_13053 ⊢ %_13054 : %_13054
 ; {>  %_13053~0':_stg }
; _f10162 0' ⊢ °1◂0'
; _some %_13054 ⊢ %_13055 : %_13055
 ; {>  %_13054~°1◂0':_p10160 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13055
 ; {>  %_13055~°0◂°1◂0':(_opn)◂(_p10160) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13102
	btr r12,3
	jmp LB_13103
LB_13102:
	bts r12,3
LB_13103:
	mov rsi,1
	bt r12,3
	jc LB_13100
	mov rsi,0
	bt r9,0
	jc LB_13100
	jmp LB_13101
LB_13100:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13101:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13104:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13106
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13105
LB_13106:
	add rsp,8
	ret
LB_13107:
	add rsp,16
	pop r14
LB_13105:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13115:
NS_E_RDI_13115:
NS_E_13115_ETR_TBL:
NS_E_13115_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9335_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13140
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13132
LB_13140:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_13148
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_13148
	jmp LB_13149
LB_13148:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13146
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13146:
	jmp LB_13132
LB_13149:
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
	jc LB_13135
	btr r12,1
	clc
	jmp LB_13136
LB_13135:
	bts r12,1
	stc
LB_13136:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13133
	btr r12,0
	clc
	jmp LB_13134
LB_13133:
	bts r12,0
	stc
LB_13134:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13129
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10281 %_13116 ⊢ %_13117 : %_13117
 ; {>  %_13116~0':_r64 }
; _f10281 0' ⊢ °0◂0'
; _some %_13117 ⊢ %_13118 : %_13118
 ; {>  %_13117~°0◂0':_p10226 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13118
 ; {>  %_13118~°0◂°0◂0':(_opn)◂(_p10226) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13127
	btr r12,3
	jmp LB_13128
LB_13127:
	bts r12,3
LB_13128:
	mov rsi,1
	bt r12,3
	jc LB_13125
	mov rsi,0
	bt r9,0
	jc LB_13125
	jmp LB_13126
LB_13125:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13126:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13129:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13131
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13130
LB_13131:
	add rsp,8
	ret
LB_13132:
	add rsp,32
	pop r14
LB_13130:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_9611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13163
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13157
LB_13163:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13158
	btr r12,0
	clc
	jmp LB_13159
LB_13158:
	bts r12,0
	stc
LB_13159:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13154
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10282 %_13119 ⊢ %_13120 : %_13120
 ; {>  %_13119~0':_stg }
; _f10282 0' ⊢ °1◂0'
; _some %_13120 ⊢ %_13121 : %_13121
 ; {>  %_13120~°1◂0':_p10226 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13121
 ; {>  %_13121~°0◂°1◂0':(_opn)◂(_p10226) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13152
	btr r12,3
	jmp LB_13153
LB_13152:
	bts r12,3
LB_13153:
	mov rsi,1
	bt r12,3
	jc LB_13150
	mov rsi,0
	bt r9,0
	jc LB_13150
	jmp LB_13151
LB_13150:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13151:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13154:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13156
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13155
LB_13156:
	add rsp,8
	ret
LB_13157:
	add rsp,16
	pop r14
LB_13155:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13178
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13172
LB_13178:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13173
	btr r12,0
	clc
	jmp LB_13174
LB_13173:
	bts r12,0
	stc
LB_13174:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13169
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10283 %_13122 ⊢ %_13123 : %_13123
 ; {>  %_13122~0':_p10160 }
; _f10283 0' ⊢ °2◂0'
; _some %_13123 ⊢ %_13124 : %_13124
 ; {>  %_13123~°2◂0':_p10226 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_13124
 ; {>  %_13124~°0◂°2◂0':(_opn)◂(_p10226) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13167
	btr r12,3
	jmp LB_13168
LB_13167:
	bts r12,3
LB_13168:
	mov rsi,1
	bt r12,3
	jc LB_13165
	mov rsi,0
	bt r9,0
	jc LB_13165
	jmp LB_13166
LB_13165:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13166:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13169:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13171
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13170
LB_13171:
	add rsp,8
	ret
LB_13172:
	add rsp,16
	pop r14
LB_13170:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13181:
NS_E_RDI_13181:
NS_E_13181_ETR_TBL:
NS_E_13181_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_13188
LB_13187:
	add r14,1
LB_13188:
	cmp r14,r10
	jge LB_13189
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13187
	cmp al,32
	jz LB_13187
LB_13189:
	add r14,1
	cmp r14,r10
	jg LB_13192
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_13192
	jmp LB_13193
LB_13192:
	jmp LB_13183
LB_13193:
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
LB_13198:
	jmp LB_13195
LB_13194:
	add r14,1
LB_13195:
	cmp r14,r10
	jge LB_13196
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13194
	cmp al,32
	jz LB_13194
LB_13196:
	add r14,1
	cmp r14,r10
	jg LB_13197
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_13197
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
	jmp LB_13198
LB_13197:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13184
	btr QWORD [rdi],1
LB_13184:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13185
	btr QWORD [rdi],0
LB_13185:
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
LB_13183:
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
NS_E_13208:
; 	|» { 0' 1' }
NS_E_RDI_13208:
MTC_LB_13209:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_13210
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
	jnc LB_13211
	bt QWORD [rdi],0
	jc LB_13212
	btr r12,4
	clc
	jmp LB_13213
LB_13212:
	bts r12,4
	stc
LB_13213:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_13211:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_13216
	btr r12,5
	clc
	jmp LB_13217
LB_13216:
	bts r12,5
	stc
LB_13217:
	mov r8,r11
	bt r12,5
	jc LB_13214
	btr r12,2
	jmp LB_13215
LB_13214:
	bts r12,2
LB_13215:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_13220
	btr r12,5
	clc
	jmp LB_13221
LB_13220:
	bts r12,5
	stc
LB_13221:
	mov r9,r11
	bt r12,5
	jc LB_13218
	btr r12,3
	jmp LB_13219
LB_13218:
	bts r12,3
LB_13219:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_13222:
	cmp r15,0
	jz LB_13223
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_13222
LB_13223:
; _f10278 { %_13202 %_13204 } ⊢ %_13206 : %_13206
 ; {>  %_13202~0':_p10225 %_13205~3':(_lst)◂(_p10225) %_13204~2':_p10225 }
; _f10278 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f13208 { %_13206 %_13205 } ⊢ %_13207 : %_13207
 ; {>  %_13206~°2◂{ 0' 2' }:_p10225 %_13205~3':(_lst)◂(_p10225) }
; _f13208 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_13224
	btr r12,1
	jmp LB_13225
LB_13224:
	bts r12,1
LB_13225:
	mov r9,r13
	bt r12,0
	jc LB_13226
	btr r12,3
	jmp LB_13227
LB_13226:
	bts r12,3
LB_13227:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_13232
	btr r12,4
	jmp LB_13233
LB_13232:
	bts r12,4
LB_13233:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_13230
	btr QWORD [rdi],0
	jmp LB_13231
LB_13230:
	bts QWORD [rdi],0
LB_13231:
	mov r10,r8
	bt r12,2
	jc LB_13236
	btr r12,4
	jmp LB_13237
LB_13236:
	bts r12,4
LB_13237:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_13234
	btr QWORD [rdi],1
	jmp LB_13235
LB_13234:
	bts QWORD [rdi],1
LB_13235:
	mov rsi,1
	bt r12,0
	jc LB_13228
	mov rsi,0
	bt r13,0
	jc LB_13228
	jmp LB_13229
LB_13228:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_13229:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_13208
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_13207
 ; {>  %_13207~0':_p10225 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_13210:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_13238
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
	jnc LB_13239
	bt QWORD [rdi],0
	jc LB_13240
	btr r12,2
	clc
	jmp LB_13241
LB_13240:
	bts r12,2
	stc
LB_13241:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_13239:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_13242:
	cmp r15,0
	jz LB_13243
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_13242
LB_13243:
; ∎ %_13202
 ; {>  %_13202~0':_p10225 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_13238:
NS_E_13244:
NS_E_RDI_13244:
NS_E_13244_ETR_TBL:
NS_E_13244_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_13291
LB_13290:
	add r14,1
LB_13291:
	cmp r14,r10
	jge LB_13292
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13290
	cmp al,10
	jz LB_13290
	cmp al,32
	jz LB_13290
LB_13292:
	add r14,1
	cmp r14,r10
	jg LB_13295
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_13295
	jmp LB_13296
LB_13295:
	jmp LB_13283
LB_13296:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_13298
LB_13297:
	add r14,1
LB_13298:
	cmp r14,r10
	jge LB_13299
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13297
	cmp al,10
	jz LB_13297
	cmp al,32
	jz LB_13297
LB_13299:
	push r10
	call NS_E_13245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13300
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13301
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13301:
	jmp LB_13283
LB_13300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_13304
LB_13303:
	add r14,1
LB_13304:
	cmp r14,r10
	jge LB_13305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13303
	cmp al,10
	jz LB_13303
	cmp al,32
	jz LB_13303
LB_13305:
	add r14,1
	cmp r14,r10
	jg LB_13310
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_13310
	jmp LB_13311
LB_13310:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13307
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13307:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13308
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13308:
	jmp LB_13283
LB_13311:
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
	jc LB_13288
	btr r12,2
	clc
	jmp LB_13289
LB_13288:
	bts r12,2
	stc
LB_13289:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13286
	btr r12,1
	clc
	jmp LB_13287
LB_13286:
	bts r12,1
	stc
LB_13287:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13284
	btr r12,0
	clc
	jmp LB_13285
LB_13284:
	bts r12,0
	stc
LB_13285:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13280
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_13312
	btr r12,3
	jmp LB_13313
LB_13312:
	bts r12,3
LB_13313:
	mov r13,r14
	bt r12,1
	jc LB_13314
	btr r12,0
	jmp LB_13315
LB_13314:
	bts r12,0
LB_13315:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10272 %_13248 ⊢ %_13249 : %_13249
 ; {>  %_13248~0':(_lst)◂(_p10223) }
; _f10272 0' ⊢ °0◂0'
; _some %_13249 ⊢ %_13250 : %_13250
 ; {>  %_13249~°0◂0':_p10223 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13250
 ; {>  %_13250~°0◂°0◂0':(_opn)◂(_p10223) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13278
	btr r12,3
	jmp LB_13279
LB_13278:
	bts r12,3
LB_13279:
	mov rsi,1
	bt r12,3
	jc LB_13276
	mov rsi,0
	bt r9,0
	jc LB_13276
	jmp LB_13277
LB_13276:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13277:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13280:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13282
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13281
LB_13282:
	add rsp,8
	ret
LB_13283:
	add rsp,48
	pop r14
LB_13281:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_13327
LB_13326:
	add r14,1
LB_13327:
	cmp r14,r10
	jge LB_13328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13326
	cmp al,10
	jz LB_13326
	cmp al,32
	jz LB_13326
LB_13328:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13329
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13323
LB_13329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13324
	btr r12,0
	clc
	jmp LB_13325
LB_13324:
	bts r12,0
	stc
LB_13325:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13320
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10273 %_13251 ⊢ %_13252 : %_13252
 ; {>  %_13251~0':_p10221 }
; _f10273 0' ⊢ °1◂0'
; _some %_13252 ⊢ %_13253 : %_13253
 ; {>  %_13252~°1◂0':_p10223 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13253
 ; {>  %_13253~°0◂°1◂0':(_opn)◂(_p10223) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13318
	btr r12,3
	jmp LB_13319
LB_13318:
	bts r12,3
LB_13319:
	mov rsi,1
	bt r12,3
	jc LB_13316
	mov rsi,0
	bt r9,0
	jc LB_13316
	jmp LB_13317
LB_13316:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13317:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13320:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13322
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13321
LB_13322:
	add rsp,8
	ret
LB_13323:
	add rsp,16
	pop r14
LB_13321:
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
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_13350
LB_13349:
	add r14,1
LB_13350:
	cmp r14,r10
	jge LB_13351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13349
	cmp al,10
	jz LB_13349
	cmp al,32
	jz LB_13349
LB_13351:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13352
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13344
LB_13352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_13355
LB_13354:
	add r14,1
LB_13355:
	cmp r14,r10
	jge LB_13356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13354
	cmp al,10
	jz LB_13354
	cmp al,32
	jz LB_13354
LB_13356:
	push r10
	call NS_E_13245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13357
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13358:
	jmp LB_13344
LB_13357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13347
	btr r12,1
	clc
	jmp LB_13348
LB_13347:
	bts r12,1
	stc
LB_13348:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13345
	btr r12,0
	clc
	jmp LB_13346
LB_13345:
	bts r12,0
	stc
LB_13346:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13341
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_13254 %_13255 } ⊢ %_13256 : %_13256
 ; {>  %_13254~0':_p10223 %_13255~1':(_lst)◂(_p10223) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13256 ⊢ %_13257 : %_13257
 ; {>  %_13256~°0◂{ 0' 1' }:(_lst)◂(_p10223) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13257
 ; {>  %_13257~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10223)) }
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
	jc LB_13335
	btr r12,2
	jmp LB_13336
LB_13335:
	bts r12,2
LB_13336:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_13333
	btr QWORD [rdi],0
	jmp LB_13334
LB_13333:
	bts QWORD [rdi],0
LB_13334:
	mov r8,r14
	bt r12,1
	jc LB_13339
	btr r12,2
	jmp LB_13340
LB_13339:
	bts r12,2
LB_13340:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_13337
	btr QWORD [rdi],1
	jmp LB_13338
LB_13337:
	bts QWORD [rdi],1
LB_13338:
	mov rsi,1
	bt r12,3
	jc LB_13331
	mov rsi,0
	bt r9,0
	jc LB_13331
	jmp LB_13332
LB_13331:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13332:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13341:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13343
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13342
LB_13343:
	add rsp,8
	ret
LB_13344:
	add rsp,32
	pop r14
LB_13342:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13362
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13258 : %_13258
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13258 ⊢ %_13259 : %_13259
 ; {>  %_13258~°1◂{  }:(_lst)◂(t5000'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13259
 ; {>  %_13259~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5003'(0))) }
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
	jc LB_13360
	mov rsi,0
	bt r9,0
	jc LB_13360
	jmp LB_13361
LB_13360:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13361:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13362:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13364
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13363
LB_13364:
	add rsp,8
	ret
LB_13365:
	add rsp,0
	pop r14
LB_13363:
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
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_13403
LB_13402:
	add r14,1
LB_13403:
	cmp r14,r10
	jge LB_13404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13402
	cmp al,10
	jz LB_13402
	cmp al,32
	jz LB_13402
LB_13404:
	add r14,1
	cmp r14,r10
	jg LB_13407
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_13407
	jmp LB_13408
LB_13407:
	jmp LB_13381
LB_13408:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_13390
LB_13389:
	add r14,1
LB_13390:
	cmp r14,r10
	jge LB_13391
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13389
	cmp al,10
	jz LB_13389
	cmp al,32
	jz LB_13389
LB_13391:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13392
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13393
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13393:
	jmp LB_13382
LB_13392:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_13396
LB_13395:
	add r14,1
LB_13396:
	cmp r14,r10
	jge LB_13397
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13395
	cmp al,10
	jz LB_13395
	cmp al,32
	jz LB_13395
LB_13397:
	push r10
	call NS_E_13246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13398
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13399
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13399:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13400
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13400:
	jmp LB_13382
LB_13398:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13387
	btr r12,2
	clc
	jmp LB_13388
LB_13387:
	bts r12,2
	stc
LB_13388:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13385
	btr r12,1
	clc
	jmp LB_13386
LB_13385:
	bts r12,1
	stc
LB_13386:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13383
	btr r12,0
	clc
	jmp LB_13384
LB_13383:
	bts r12,0
	stc
LB_13384:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13378
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_13409
	btr r12,3
	jmp LB_13410
LB_13409:
	bts r12,3
LB_13410:
	mov r14,r8
	bt r12,2
	jc LB_13411
	btr r12,1
	jmp LB_13412
LB_13411:
	bts r12,1
LB_13412:
	mov r8,r13
	bt r12,0
	jc LB_13413
	btr r12,2
	jmp LB_13414
LB_13413:
	bts r12,2
LB_13414:
	mov r13,r9
	bt r12,3
	jc LB_13415
	btr r12,0
	jmp LB_13416
LB_13415:
	bts r12,0
LB_13416:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10273 %_13260 ⊢ %_13262 : %_13262
 ; {>  %_13260~0':_p10221 %_13261~1':(_lst)◂(_p10223) }
; _f10273 0' ⊢ °1◂0'
; _cns { %_13262 %_13261 } ⊢ %_13263 : %_13263
 ; {>  %_13262~°1◂0':_p10223 %_13261~1':(_lst)◂(_p10223) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_13263 ⊢ %_13264 : %_13264
 ; {>  %_13263~°0◂{ °1◂0' 1' }:(_lst)◂(_p10223) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_13264
 ; {>  %_13264~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p10223)) }
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
	jc LB_13372
	btr r12,2
	jmp LB_13373
LB_13372:
	bts r12,2
LB_13373:
	mov rsi,1
	bt r12,2
	jc LB_13370
	mov rsi,0
	bt r8,0
	jc LB_13370
	jmp LB_13371
LB_13370:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_13371:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_13368
	btr QWORD [rdi],0
	jmp LB_13369
LB_13368:
	bts QWORD [rdi],0
LB_13369:
	mov r8,r14
	bt r12,1
	jc LB_13376
	btr r12,2
	jmp LB_13377
LB_13376:
	bts r12,2
LB_13377:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_13374
	btr QWORD [rdi],1
	jmp LB_13375
LB_13374:
	bts QWORD [rdi],1
LB_13375:
	mov rsi,1
	bt r12,3
	jc LB_13366
	mov rsi,0
	bt r9,0
	jc LB_13366
	jmp LB_13367
LB_13366:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13367:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13378:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13380
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13379
LB_13380:
	add rsp,8
	ret
LB_13382:
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
LB_13381:
	add rsp,48
	pop r14
LB_13379:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13419
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13265 : %_13265
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13265 ⊢ %_13266 : %_13266
 ; {>  %_13265~°1◂{  }:(_lst)◂(t5014'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13266
 ; {>  %_13266~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5017'(0))) }
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
	jc LB_13417
	mov rsi,0
	bt r9,0
	jc LB_13417
	jmp LB_13418
LB_13417:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13418:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13419:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13421
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13420
LB_13421:
	add rsp,8
	ret
LB_13422:
	add rsp,0
	pop r14
LB_13420:
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
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_13438
LB_13437:
	add r14,1
LB_13438:
	cmp r14,r10
	jge LB_13439
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13437
	cmp al,10
	jz LB_13437
	cmp al,32
	jz LB_13437
LB_13439:
	add r14,2
	cmp r14,r10
	jg LB_13442
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_13442
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_13442
	jmp LB_13443
LB_13442:
	jmp LB_13430
LB_13443:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_13445
LB_13444:
	add r14,1
LB_13445:
	cmp r14,r10
	jge LB_13446
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13444
	cmp al,10
	jz LB_13444
	cmp al,32
	jz LB_13444
LB_13446:
	push r10
	call NS_E_13115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13447
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13448
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13448:
	jmp LB_13430
LB_13447:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_13451
LB_13450:
	add r14,1
LB_13451:
	cmp r14,r10
	jge LB_13452
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13450
	cmp al,10
	jz LB_13450
	cmp al,32
	jz LB_13450
LB_13452:
	add r14,1
	cmp r14,r10
	jg LB_13457
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_13457
	jmp LB_13458
LB_13457:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13454
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13455:
	jmp LB_13430
LB_13458:
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
	jc LB_13435
	btr r12,2
	clc
	jmp LB_13436
LB_13435:
	bts r12,2
	stc
LB_13436:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13433
	btr r12,1
	clc
	jmp LB_13434
LB_13433:
	bts r12,1
	stc
LB_13434:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13431
	btr r12,0
	clc
	jmp LB_13432
LB_13431:
	bts r12,0
	stc
LB_13432:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13427
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_13459
	btr r12,3
	jmp LB_13460
LB_13459:
	bts r12,3
LB_13460:
	mov r13,r14
	bt r12,1
	jc LB_13461
	btr r12,0
	jmp LB_13462
LB_13461:
	bts r12,0
LB_13462:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10268 %_13267 ⊢ %_13268 : %_13268
 ; {>  %_13267~0':_p10226 }
; _f10268 0' ⊢ °0◂0'
; _some %_13268 ⊢ %_13269 : %_13269
 ; {>  %_13268~°0◂0':_p10221 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13269
 ; {>  %_13269~°0◂°0◂0':(_opn)◂(_p10221) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13425
	btr r12,3
	jmp LB_13426
LB_13425:
	bts r12,3
LB_13426:
	mov rsi,1
	bt r12,3
	jc LB_13423
	mov rsi,0
	bt r9,0
	jc LB_13423
	jmp LB_13424
LB_13423:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13424:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13427:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13429
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13428
LB_13429:
	add rsp,8
	ret
LB_13430:
	add rsp,48
	pop r14
LB_13428:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_13487
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_13487
	jmp LB_13488
LB_13487:
	jmp LB_13470
LB_13488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_10114_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13479
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13480
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13480:
	jmp LB_13471
LB_13479:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13474
	btr r12,1
	clc
	jmp LB_13475
LB_13474:
	bts r12,1
	stc
LB_13475:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13472
	btr r12,0
	clc
	jmp LB_13473
LB_13472:
	bts r12,0
	stc
LB_13473:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13467
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13489
	btr r12,2
	jmp LB_13490
LB_13489:
	bts r12,2
LB_13490:
	mov r13,r14
	bt r12,1
	jc LB_13491
	btr r12,0
	jmp LB_13492
LB_13491:
	bts r12,0
LB_13492:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10269 %_13270 ⊢ %_13271 : %_13271
 ; {>  %_13270~0':_stg }
; _f10269 0' ⊢ °1◂0'
; _some %_13271 ⊢ %_13272 : %_13272
 ; {>  %_13271~°1◂0':_p10221 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13272
 ; {>  %_13272~°0◂°1◂0':(_opn)◂(_p10221) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13465
	btr r12,3
	jmp LB_13466
LB_13465:
	bts r12,3
LB_13466:
	mov rsi,1
	bt r12,3
	jc LB_13463
	mov rsi,0
	bt r9,0
	jc LB_13463
	jmp LB_13464
LB_13463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13464:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13467:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13469
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13468
LB_13469:
	add rsp,8
	ret
LB_13471:
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
LB_13470:
	add rsp,32
	pop r14
LB_13468:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_13504
LB_13503:
	add r14,1
LB_13504:
	cmp r14,r10
	jge LB_13505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13503
	cmp al,10
	jz LB_13503
	cmp al,32
	jz LB_13503
LB_13505:
	push r10
	call NS_E_10114_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13506
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13500
LB_13506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13501
	btr r12,0
	clc
	jmp LB_13502
LB_13501:
	bts r12,0
	stc
LB_13502:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13497
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10269 %_13273 ⊢ %_13274 : %_13274
 ; {>  %_13273~0':_stg }
; _f10269 0' ⊢ °1◂0'
; _some %_13274 ⊢ %_13275 : %_13275
 ; {>  %_13274~°1◂0':_p10221 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13275
 ; {>  %_13275~°0◂°1◂0':(_opn)◂(_p10221) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13495
	btr r12,3
	jmp LB_13496
LB_13495:
	bts r12,3
LB_13496:
	mov rsi,1
	bt r12,3
	jc LB_13493
	mov rsi,0
	bt r9,0
	jc LB_13493
	jmp LB_13494
LB_13493:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13494:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13497:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13499
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13498
LB_13499:
	add rsp,8
	ret
LB_13500:
	add rsp,16
	pop r14
LB_13498:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13508:
NS_E_RDI_13508:
NS_E_13508_ETR_TBL:
NS_E_13508_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_13558
LB_13557:
	add r14,1
LB_13558:
	cmp r14,r10
	jge LB_13559
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13557
	cmp al,10
	jz LB_13557
	cmp al,32
	jz LB_13557
LB_13559:
	add r14,1
	cmp r14,r10
	jg LB_13562
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_13562
	jmp LB_13563
LB_13562:
	jmp LB_13550
LB_13563:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_13565
LB_13564:
	add r14,1
LB_13565:
	cmp r14,r10
	jge LB_13566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13564
	cmp al,10
	jz LB_13564
	cmp al,32
	jz LB_13564
LB_13566:
	push r10
	call NS_E_13509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13567
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13568
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13568:
	jmp LB_13550
LB_13567:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_13571
LB_13570:
	add r14,1
LB_13571:
	cmp r14,r10
	jge LB_13572
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13570
	cmp al,10
	jz LB_13570
	cmp al,32
	jz LB_13570
LB_13572:
	add r14,1
	cmp r14,r10
	jg LB_13577
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_13577
	jmp LB_13578
LB_13577:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13574
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13574:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13575:
	jmp LB_13550
LB_13578:
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
	jc LB_13555
	btr r12,2
	clc
	jmp LB_13556
LB_13555:
	bts r12,2
	stc
LB_13556:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13553
	btr r12,1
	clc
	jmp LB_13554
LB_13553:
	bts r12,1
	stc
LB_13554:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13551
	btr r12,0
	clc
	jmp LB_13552
LB_13551:
	bts r12,0
	stc
LB_13552:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13547
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_13579
	btr r12,3
	jmp LB_13580
LB_13579:
	bts r12,3
LB_13580:
	mov r13,r14
	bt r12,1
	jc LB_13581
	btr r12,0
	jmp LB_13582
LB_13581:
	bts r12,0
LB_13582:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10274 %_13514 ⊢ %_13515 : %_13515
 ; {>  %_13514~0':(_lst)◂(_p10224) }
; _f10274 0' ⊢ °0◂0'
; _some %_13515 ⊢ %_13516 : %_13516
 ; {>  %_13515~°0◂0':_p10224 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13516
 ; {>  %_13516~°0◂°0◂0':(_opn)◂(_p10224) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13545
	btr r12,3
	jmp LB_13546
LB_13545:
	bts r12,3
LB_13546:
	mov rsi,1
	bt r12,3
	jc LB_13543
	mov rsi,0
	bt r9,0
	jc LB_13543
	jmp LB_13544
LB_13543:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13544:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13547:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13549
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13548
LB_13549:
	add rsp,8
	ret
LB_13550:
	add rsp,48
	pop r14
LB_13548:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_13594
LB_13593:
	add r14,1
LB_13594:
	cmp r14,r10
	jge LB_13595
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13593
	cmp al,10
	jz LB_13593
	cmp al,32
	jz LB_13593
LB_13595:
	push r10
	call NS_E_13513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13596
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13590
LB_13596:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13591
	btr r12,0
	clc
	jmp LB_13592
LB_13591:
	bts r12,0
	stc
LB_13592:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13587
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10275 %_13517 ⊢ %_13518 : %_13518
 ; {>  %_13517~0':_p10222 }
; _f10275 0' ⊢ °1◂0'
; _some %_13518 ⊢ %_13519 : %_13519
 ; {>  %_13518~°1◂0':_p10224 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13519
 ; {>  %_13519~°0◂°1◂0':(_opn)◂(_p10224) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13585
	btr r12,3
	jmp LB_13586
LB_13585:
	bts r12,3
LB_13586:
	mov rsi,1
	bt r12,3
	jc LB_13583
	mov rsi,0
	bt r9,0
	jc LB_13583
	jmp LB_13584
LB_13583:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13584:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13587:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13589
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13588
LB_13589:
	add rsp,8
	ret
LB_13590:
	add rsp,16
	pop r14
LB_13588:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13509:
NS_E_RDI_13509:
NS_E_13509_ETR_TBL:
NS_E_13509_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_13617
LB_13616:
	add r14,1
LB_13617:
	cmp r14,r10
	jge LB_13618
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13616
	cmp al,10
	jz LB_13616
	cmp al,32
	jz LB_13616
LB_13618:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13619
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13611
LB_13619:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_13622
LB_13621:
	add r14,1
LB_13622:
	cmp r14,r10
	jge LB_13623
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13621
	cmp al,10
	jz LB_13621
	cmp al,32
	jz LB_13621
LB_13623:
	push r10
	call NS_E_13509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13624
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13625
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13625:
	jmp LB_13611
LB_13624:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13614
	btr r12,1
	clc
	jmp LB_13615
LB_13614:
	bts r12,1
	stc
LB_13615:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13612
	btr r12,0
	clc
	jmp LB_13613
LB_13612:
	bts r12,0
	stc
LB_13613:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13608
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_13520 %_13521 } ⊢ %_13522 : %_13522
 ; {>  %_13521~1':(_lst)◂(_p10224) %_13520~0':_p10224 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13522 ⊢ %_13523 : %_13523
 ; {>  %_13522~°0◂{ 0' 1' }:(_lst)◂(_p10224) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13523
 ; {>  %_13523~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10224)) }
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
	jc LB_13602
	btr r12,2
	jmp LB_13603
LB_13602:
	bts r12,2
LB_13603:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_13600
	btr QWORD [rdi],0
	jmp LB_13601
LB_13600:
	bts QWORD [rdi],0
LB_13601:
	mov r8,r14
	bt r12,1
	jc LB_13606
	btr r12,2
	jmp LB_13607
LB_13606:
	bts r12,2
LB_13607:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_13604
	btr QWORD [rdi],1
	jmp LB_13605
LB_13604:
	bts QWORD [rdi],1
LB_13605:
	mov rsi,1
	bt r12,3
	jc LB_13598
	mov rsi,0
	bt r9,0
	jc LB_13598
	jmp LB_13599
LB_13598:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13599:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13608:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13610
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13609
LB_13610:
	add rsp,8
	ret
LB_13611:
	add rsp,32
	pop r14
LB_13609:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13629
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13524 : %_13524
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13524 ⊢ %_13525 : %_13525
 ; {>  %_13524~°1◂{  }:(_lst)◂(t5102'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13525
 ; {>  %_13525~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5105'(0))) }
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
	jc LB_13627
	mov rsi,0
	bt r9,0
	jc LB_13627
	jmp LB_13628
LB_13627:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13628:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13629:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13631
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13630
LB_13631:
	add rsp,8
	ret
LB_13632:
	add rsp,0
	pop r14
LB_13630:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13511:
NS_E_RDI_13511:
NS_E_13511_ETR_TBL:
NS_E_13511_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_13655
LB_13654:
	add r14,1
LB_13655:
	cmp r14,r10
	jge LB_13656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13654
	cmp al,10
	jz LB_13654
	cmp al,32
	jz LB_13654
LB_13656:
	add r14,1
	cmp r14,r10
	jg LB_13659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_13659
	jmp LB_13660
LB_13659:
	jmp LB_13633
LB_13660:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_13642
LB_13641:
	add r14,1
LB_13642:
	cmp r14,r10
	jge LB_13643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13641
	cmp al,10
	jz LB_13641
	cmp al,32
	jz LB_13641
LB_13643:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13644
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13645
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13645:
	jmp LB_13634
LB_13644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_13648
LB_13647:
	add r14,1
LB_13648:
	cmp r14,r10
	jge LB_13649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13647
	cmp al,10
	jz LB_13647
	cmp al,32
	jz LB_13647
LB_13649:
	push r10
	call NS_E_13511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13650
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13651
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13651:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13652
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13652:
	jmp LB_13634
LB_13650:
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
	jc LB_13637
	btr QWORD [rdi],2
LB_13637:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13638
	btr QWORD [rdi],1
LB_13638:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13639
	btr QWORD [rdi],0
LB_13639:
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
LB_13634:
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
LB_13633:
	add rsp,48
	pop r14
; _
	mov r10d,DWORD [r13+4]
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
LB_13635:
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
NS_E_13512:
NS_E_RDI_13512:
NS_E_13512_ETR_TBL:
NS_E_13512_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_13698
LB_13697:
	add r14,1
LB_13698:
	cmp r14,r10
	jge LB_13699
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13697
	cmp al,10
	jz LB_13697
	cmp al,32
	jz LB_13697
LB_13699:
	add r14,1
	cmp r14,r10
	jg LB_13702
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_13702
	jmp LB_13703
LB_13702:
	jmp LB_13676
LB_13703:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_13685
LB_13684:
	add r14,1
LB_13685:
	cmp r14,r10
	jge LB_13686
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13684
	cmp al,10
	jz LB_13684
	cmp al,32
	jz LB_13684
LB_13686:
	push r10
	call NS_E_13513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13687
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13688
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13688:
	jmp LB_13677
LB_13687:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_13691
LB_13690:
	add r14,1
LB_13691:
	cmp r14,r10
	jge LB_13692
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13690
	cmp al,10
	jz LB_13690
	cmp al,32
	jz LB_13690
LB_13692:
	push r10
	call NS_E_13512_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13693
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13694
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13694:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13695
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13695:
	jmp LB_13677
LB_13693:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13682
	btr r12,2
	clc
	jmp LB_13683
LB_13682:
	bts r12,2
	stc
LB_13683:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13680
	btr r12,1
	clc
	jmp LB_13681
LB_13680:
	bts r12,1
	stc
LB_13681:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13678
	btr r12,0
	clc
	jmp LB_13679
LB_13678:
	bts r12,0
	stc
LB_13679:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13673
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_13704
	btr r12,3
	jmp LB_13705
LB_13704:
	bts r12,3
LB_13705:
	mov r14,r8
	bt r12,2
	jc LB_13706
	btr r12,1
	jmp LB_13707
LB_13706:
	bts r12,1
LB_13707:
	mov r8,r13
	bt r12,0
	jc LB_13708
	btr r12,2
	jmp LB_13709
LB_13708:
	bts r12,2
LB_13709:
	mov r13,r9
	bt r12,3
	jc LB_13710
	btr r12,0
	jmp LB_13711
LB_13710:
	bts r12,0
LB_13711:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10275 %_13528 ⊢ %_13530 : %_13530
 ; {>  %_13529~1':(_lst)◂(_p10224) %_13528~0':_p10222 }
; _f10275 0' ⊢ °1◂0'
; _cns { %_13530 %_13529 } ⊢ %_13531 : %_13531
 ; {>  %_13529~1':(_lst)◂(_p10224) %_13530~°1◂0':_p10224 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_13531 ⊢ %_13532 : %_13532
 ; {>  %_13531~°0◂{ °1◂0' 1' }:(_lst)◂(_p10224) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_13532
 ; {>  %_13532~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p10224)) }
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
	jc LB_13667
	btr r12,2
	jmp LB_13668
LB_13667:
	bts r12,2
LB_13668:
	mov rsi,1
	bt r12,2
	jc LB_13665
	mov rsi,0
	bt r8,0
	jc LB_13665
	jmp LB_13666
LB_13665:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_13666:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_13663
	btr QWORD [rdi],0
	jmp LB_13664
LB_13663:
	bts QWORD [rdi],0
LB_13664:
	mov r8,r14
	bt r12,1
	jc LB_13671
	btr r12,2
	jmp LB_13672
LB_13671:
	bts r12,2
LB_13672:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_13669
	btr QWORD [rdi],1
	jmp LB_13670
LB_13669:
	bts QWORD [rdi],1
LB_13670:
	mov rsi,1
	bt r12,3
	jc LB_13661
	mov rsi,0
	bt r9,0
	jc LB_13661
	jmp LB_13662
LB_13661:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13662:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13673:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13675
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13674
LB_13675:
	add rsp,8
	ret
LB_13677:
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
LB_13676:
	add rsp,48
	pop r14
LB_13674:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13714
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13533 : %_13533
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13533 ⊢ %_13534 : %_13534
 ; {>  %_13533~°1◂{  }:(_lst)◂(t5116'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13534
 ; {>  %_13534~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5119'(0))) }
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
	jc LB_13712
	mov rsi,0
	bt r9,0
	jc LB_13712
	jmp LB_13713
LB_13712:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13713:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13714:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13716
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13715
LB_13716:
	add rsp,8
	ret
LB_13717:
	add rsp,0
	pop r14
LB_13715:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13513:
NS_E_RDI_13513:
NS_E_13513_ETR_TBL:
NS_E_13513_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_13742
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_13742
	jmp LB_13743
LB_13742:
	jmp LB_13725
LB_13743:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13734
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13735
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13735:
	jmp LB_13726
LB_13734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13729
	btr r12,1
	clc
	jmp LB_13730
LB_13729:
	bts r12,1
	stc
LB_13730:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13727
	btr r12,0
	clc
	jmp LB_13728
LB_13727:
	bts r12,0
	stc
LB_13728:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13722
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13744
	btr r12,2
	jmp LB_13745
LB_13744:
	bts r12,2
LB_13745:
	mov r13,r14
	bt r12,1
	jc LB_13746
	btr r12,0
	jmp LB_13747
LB_13746:
	bts r12,0
LB_13747:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10271 %_13535 ⊢ %_13536 : %_13536
 ; {>  %_13535~0':_stg }
; _f10271 0' ⊢ °1◂0'
; _some %_13536 ⊢ %_13537 : %_13537
 ; {>  %_13536~°1◂0':_p10222 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13537
 ; {>  %_13537~°0◂°1◂0':(_opn)◂(_p10222) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13720
	btr r12,3
	jmp LB_13721
LB_13720:
	bts r12,3
LB_13721:
	mov rsi,1
	bt r12,3
	jc LB_13718
	mov rsi,0
	bt r9,0
	jc LB_13718
	jmp LB_13719
LB_13718:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13719:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13722:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13724
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13723
LB_13724:
	add rsp,8
	ret
LB_13726:
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
LB_13725:
	add rsp,32
	pop r14
LB_13723:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13761
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13755
LB_13761:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13756
	btr r12,0
	clc
	jmp LB_13757
LB_13756:
	bts r12,0
	stc
LB_13757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13752
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10271 %_13538 ⊢ %_13539 : %_13539
 ; {>  %_13538~0':_stg }
; _f10271 0' ⊢ °1◂0'
; _some %_13539 ⊢ %_13540 : %_13540
 ; {>  %_13539~°1◂0':_p10222 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13540
 ; {>  %_13540~°0◂°1◂0':(_opn)◂(_p10222) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13750
	btr r12,3
	jmp LB_13751
LB_13750:
	bts r12,3
LB_13751:
	mov rsi,1
	bt r12,3
	jc LB_13748
	mov rsi,0
	bt r9,0
	jc LB_13748
	jmp LB_13749
LB_13748:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13749:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13752:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13754
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13753
LB_13754:
	add rsp,8
	ret
LB_13755:
	add rsp,16
	pop r14
LB_13753:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_13776
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_13776
	jmp LB_13777
LB_13776:
	jmp LB_13768
LB_13777:
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
	jc LB_13769
	btr r12,0
	clc
	jmp LB_13770
LB_13769:
	bts r12,0
	stc
LB_13770:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13765
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10270 {  } ⊢ %_13541 : %_13541
 ; {>  }
; _f10270 {  } ⊢ °0◂{  }
; _some %_13541 ⊢ %_13542 : %_13542
 ; {>  %_13541~°0◂{  }:_p10222 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_13542
 ; {>  %_13542~°0◂°0◂{  }:(_opn)◂(_p10222) }
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
	jc LB_13763
	mov rsi,0
	bt r9,0
	jc LB_13763
	jmp LB_13764
LB_13763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13764:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13765:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13767
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13766
LB_13767:
	add rsp,8
	ret
LB_13768:
	add rsp,16
	pop r14
LB_13766:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13778:
NS_E_RDI_13778:
NS_E_13778_ETR_TBL:
NS_E_13778_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_13856
LB_13855:
	add r14,1
LB_13856:
	cmp r14,r10
	jge LB_13857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13855
	cmp al,10
	jz LB_13855
	cmp al,32
	jz LB_13855
LB_13857:
	push r10
	call NS_E_13781_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13858
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13848
LB_13858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_13861
LB_13860:
	add r14,1
LB_13861:
	cmp r14,r10
	jge LB_13862
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13860
	cmp al,10
	jz LB_13860
	cmp al,32
	jz LB_13860
LB_13862:
	push r10
	call NS_E_13780_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13863
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13864
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13864:
	jmp LB_13848
LB_13863:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_13867
LB_13866:
	add r14,1
LB_13867:
	cmp r14,r10
	jge LB_13868
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13866
	cmp al,10
	jz LB_13866
	cmp al,32
	jz LB_13866
LB_13868:
	push r10
	call NS_E_13779_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13869
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13870
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13870:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13871
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13871:
	jmp LB_13848
LB_13869:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13853
	btr r12,2
	clc
	jmp LB_13854
LB_13853:
	bts r12,2
	stc
LB_13854:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13851
	btr r12,1
	clc
	jmp LB_13852
LB_13851:
	bts r12,1
	stc
LB_13852:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13849
	btr r12,0
	clc
	jmp LB_13850
LB_13849:
	bts r12,0
	stc
LB_13850:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13845
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f13208 { %_13783 %_13784 } ⊢ %_13786 : %_13786
 ; {>  %_13784~1':(_lst)◂(_p10225) %_13785~2':(_opn)◂(_p10225) %_13783~0':_p10225 }
; _f13208 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_13208
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_13816
	btr r12,2
	clc
	jmp LB_13817
LB_13816:
	bts r12,2
	stc
LB_13817:
	add rsp,16
MTC_LB_13818:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_13819
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
	jnc LB_13820
	bt QWORD [rdi],0
	jc LB_13821
	btr r12,3
	clc
	jmp LB_13822
LB_13821:
	bts r12,3
	stc
LB_13822:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_13820:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_13823
	btr r12,1
	jmp LB_13824
LB_13823:
	bts r12,1
LB_13824:
LB_13825:
	cmp r15,0
	jz LB_13826
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_13825
LB_13826:
; _f10277 { %_13786 %_13787 } ⊢ %_13788 : %_13788
 ; {>  %_13786~0':_p10225 %_13787~1':_p10225 }
; _f10277 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_13788 ⊢ %_13789 : %_13789
 ; {>  %_13788~°1◂{ 0' 1' }:_p10225 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_13789
 ; {>  %_13789~°0◂°1◂{ 0' 1' }:(_opn)◂(_p10225) }
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
	jc LB_13831
	btr r12,2
	jmp LB_13832
LB_13831:
	bts r12,2
LB_13832:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_13829
	btr QWORD [rdi],0
	jmp LB_13830
LB_13829:
	bts QWORD [rdi],0
LB_13830:
	mov r8,r14
	bt r12,1
	jc LB_13835
	btr r12,2
	jmp LB_13836
LB_13835:
	bts r12,2
LB_13836:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_13833
	btr QWORD [rdi],1
	jmp LB_13834
LB_13833:
	bts QWORD [rdi],1
LB_13834:
	mov rsi,1
	bt r12,3
	jc LB_13827
	mov rsi,0
	bt r9,0
	jc LB_13827
	jmp LB_13828
LB_13827:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13828:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_13819:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_13837
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
	jnc LB_13838
	bt QWORD [rdi],0
	jc LB_13839
	btr r12,1
	clc
	jmp LB_13840
LB_13839:
	bts r12,1
	stc
LB_13840:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_13838:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_13841:
	cmp r15,0
	jz LB_13842
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_13841
LB_13842:
; _some %_13786 ⊢ %_13790 : %_13790
 ; {>  %_13786~0':_p10225 }
; _some 0' ⊢ °0◂0'
; ∎ %_13790
 ; {>  %_13790~°0◂0':(_opn)◂(_p10225) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13843
	btr r12,3
	jmp LB_13844
LB_13843:
	bts r12,3
LB_13844:
	mov r8,0
	bts r12,2
	ret
MTC_LB_13837:
LB_13845:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13847
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13846
LB_13847:
	add rsp,8
	ret
LB_13848:
	add rsp,48
	pop r14
LB_13846:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13779:
NS_E_RDI_13779:
NS_E_13779_ETR_TBL:
NS_E_13779_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_13886
LB_13885:
	add r14,1
LB_13886:
	cmp r14,r10
	jge LB_13887
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13885
	cmp al,10
	jz LB_13885
	cmp al,32
	jz LB_13885
LB_13887:
	add r14,3
	cmp r14,r10
	jg LB_13890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_13890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_13890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_13890
	jmp LB_13891
LB_13890:
	jmp LB_13880
LB_13891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_13893
LB_13892:
	add r14,1
LB_13893:
	cmp r14,r10
	jge LB_13894
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13892
	cmp al,10
	jz LB_13892
	cmp al,32
	jz LB_13892
LB_13894:
	push r10
	call NS_E_13778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13895
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13896
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13896:
	jmp LB_13880
LB_13895:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13883
	btr r12,1
	clc
	jmp LB_13884
LB_13883:
	bts r12,1
	stc
LB_13884:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13881
	btr r12,0
	clc
	jmp LB_13882
LB_13881:
	bts r12,0
	stc
LB_13882:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13877
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13898
	btr r12,2
	jmp LB_13899
LB_13898:
	bts r12,2
LB_13899:
	mov r13,r14
	bt r12,1
	jc LB_13900
	btr r12,0
	jmp LB_13901
LB_13900:
	bts r12,0
LB_13901:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13791 ⊢ %_13792 : %_13792
 ; {>  %_13791~0':_p10225 }
; _some 0' ⊢ °0◂0'
; _some %_13792 ⊢ %_13793 : %_13793
 ; {>  %_13792~°0◂0':(_opn)◂(_p10225) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13793
 ; {>  %_13793~°0◂°0◂0':(_opn)◂((_opn)◂(_p10225)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13875
	btr r12,3
	jmp LB_13876
LB_13875:
	bts r12,3
LB_13876:
	mov rsi,1
	bt r12,3
	jc LB_13873
	mov rsi,0
	bt r9,0
	jc LB_13873
	jmp LB_13874
LB_13873:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13874:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13877:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13879
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13878
LB_13879:
	add rsp,8
	ret
LB_13880:
	add rsp,32
	pop r14
LB_13878:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13904
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_13794 : %_13794
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_13794 ⊢ %_13795 : %_13795
 ; {>  %_13794~°1◂{  }:(_opn)◂(t5210'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13795
 ; {>  %_13795~°0◂°1◂{  }:(_opn)◂((_opn)◂(t5213'(0))) }
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
	jc LB_13902
	mov rsi,0
	bt r9,0
	jc LB_13902
	jmp LB_13903
LB_13902:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13903:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13904:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13906
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13905
LB_13906:
	add rsp,8
	ret
LB_13907:
	add rsp,0
	pop r14
LB_13905:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13780:
NS_E_RDI_13780:
NS_E_13780_ETR_TBL:
NS_E_13780_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_13929
LB_13928:
	add r14,1
LB_13929:
	cmp r14,r10
	jge LB_13930
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13928
	cmp al,10
	jz LB_13928
	cmp al,32
	jz LB_13928
LB_13930:
	add r14,3
	cmp r14,r10
	jg LB_13933
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_13933
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_13933
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_13933
	jmp LB_13934
LB_13933:
	jmp LB_13921
LB_13934:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_13936
LB_13935:
	add r14,1
LB_13936:
	cmp r14,r10
	jge LB_13937
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13935
	cmp al,10
	jz LB_13935
	cmp al,32
	jz LB_13935
LB_13937:
	push r10
	call NS_E_13781_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13938
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13939
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13939:
	jmp LB_13921
LB_13938:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_13942
LB_13941:
	add r14,1
LB_13942:
	cmp r14,r10
	jge LB_13943
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13941
	cmp al,10
	jz LB_13941
	cmp al,32
	jz LB_13941
LB_13943:
	push r10
	call NS_E_13780_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13944
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13945
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13945:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13946
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13946:
	jmp LB_13921
LB_13944:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13926
	btr r12,2
	clc
	jmp LB_13927
LB_13926:
	bts r12,2
	stc
LB_13927:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13924
	btr r12,1
	clc
	jmp LB_13925
LB_13924:
	bts r12,1
	stc
LB_13925:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13922
	btr r12,0
	clc
	jmp LB_13923
LB_13922:
	bts r12,0
	stc
LB_13923:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13918
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_13948
	btr r12,3
	jmp LB_13949
LB_13948:
	bts r12,3
LB_13949:
	mov r14,r8
	bt r12,2
	jc LB_13950
	btr r12,1
	jmp LB_13951
LB_13950:
	bts r12,1
LB_13951:
	mov r8,r13
	bt r12,0
	jc LB_13952
	btr r12,2
	jmp LB_13953
LB_13952:
	bts r12,2
LB_13953:
	mov r13,r9
	bt r12,3
	jc LB_13954
	btr r12,0
	jmp LB_13955
LB_13954:
	bts r12,0
LB_13955:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_13796 %_13797 } ⊢ %_13798 : %_13798
 ; {>  %_13797~1':(_lst)◂(_p10225) %_13796~0':_p10225 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13798 ⊢ %_13799 : %_13799
 ; {>  %_13798~°0◂{ 0' 1' }:(_lst)◂(_p10225) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13799
 ; {>  %_13799~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10225)) }
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
	jc LB_13912
	btr r12,2
	jmp LB_13913
LB_13912:
	bts r12,2
LB_13913:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_13910
	btr QWORD [rdi],0
	jmp LB_13911
LB_13910:
	bts QWORD [rdi],0
LB_13911:
	mov r8,r14
	bt r12,1
	jc LB_13916
	btr r12,2
	jmp LB_13917
LB_13916:
	bts r12,2
LB_13917:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_13914
	btr QWORD [rdi],1
	jmp LB_13915
LB_13914:
	bts QWORD [rdi],1
LB_13915:
	mov rsi,1
	bt r12,3
	jc LB_13908
	mov rsi,0
	bt r9,0
	jc LB_13908
	jmp LB_13909
LB_13908:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13909:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13918:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13920
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13919
LB_13920:
	add rsp,8
	ret
LB_13921:
	add rsp,48
	pop r14
LB_13919:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13958
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_13800 : %_13800
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13800 ⊢ %_13801 : %_13801
 ; {>  %_13800~°1◂{  }:(_lst)◂(t5223'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13801
 ; {>  %_13801~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5226'(0))) }
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
	jc LB_13956
	mov rsi,0
	bt r9,0
	jc LB_13956
	jmp LB_13957
LB_13956:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13957:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13958:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13960
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13959
LB_13960:
	add rsp,8
	ret
LB_13961:
	add rsp,0
	pop r14
LB_13959:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13781:
NS_E_RDI_13781:
NS_E_13781_ETR_TBL:
NS_E_13781_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_13977
LB_13976:
	add r14,1
LB_13977:
	cmp r14,r10
	jge LB_13978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13976
	cmp al,10
	jz LB_13976
	cmp al,32
	jz LB_13976
LB_13978:
	add r14,1
	cmp r14,r10
	jg LB_13981
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_13981
	jmp LB_13982
LB_13981:
	jmp LB_13969
LB_13982:
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
LB_13987:
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
	push rsi
	call NS_E_13778_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_13986
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_13988
	bts QWORD [rax],0
LB_13988:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_13987
LB_13986:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_13990
LB_13989:
	add r14,1
LB_13990:
	cmp r14,r10
	jge LB_13991
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13989
	cmp al,10
	jz LB_13989
	cmp al,32
	jz LB_13989
LB_13991:
	add r14,1
	cmp r14,r10
	jg LB_13996
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_13996
	jmp LB_13997
LB_13996:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13993
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13993:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13994
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13994:
	jmp LB_13969
LB_13997:
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
	jc LB_13974
	btr r12,2
	clc
	jmp LB_13975
LB_13974:
	bts r12,2
	stc
LB_13975:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13972
	btr r12,1
	clc
	jmp LB_13973
LB_13972:
	bts r12,1
	stc
LB_13973:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13970
	btr r12,0
	clc
	jmp LB_13971
LB_13970:
	bts r12,0
	stc
LB_13971:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13966
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_13998
	btr r12,3
	jmp LB_13999
LB_13998:
	bts r12,3
LB_13999:
	mov r13,r14
	bt r12,1
	jc LB_14000
	btr r12,0
	jmp LB_14001
LB_14000:
	bts r12,0
LB_14001:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9394 %_13802 ⊢ %_13803 : %_13803
 ; {>  %_13802~0':(_lst)◂(_p10225) }
; _f9394 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9394
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f10276 %_13803 ⊢ %_13804 : %_13804
 ; {>  %_13803~0':(_lst)◂(_p10225) }
; _f10276 0' ⊢ °0◂0'
; _some %_13804 ⊢ %_13805 : %_13805
 ; {>  %_13804~°0◂0':_p10225 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13805
 ; {>  %_13805~°0◂°0◂0':(_opn)◂(_p10225) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13964
	btr r12,3
	jmp LB_13965
LB_13964:
	bts r12,3
LB_13965:
	mov rsi,1
	bt r12,3
	jc LB_13962
	mov rsi,0
	bt r9,0
	jc LB_13962
	jmp LB_13963
LB_13962:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13963:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13966:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13968
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13967
LB_13968:
	add rsp,8
	ret
LB_13969:
	add rsp,48
	pop r14
LB_13967:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_14015
LB_14014:
	add r14,1
LB_14015:
	cmp r14,r10
	jge LB_14016
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14014
	cmp al,10
	jz LB_14014
	cmp al,32
	jz LB_14014
LB_14016:
	add r14,1
	cmp r14,r10
	jg LB_14019
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_14019
	jmp LB_14020
LB_14019:
	jmp LB_14007
LB_14020:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_14022
LB_14021:
	add r14,1
LB_14022:
	cmp r14,r10
	jge LB_14023
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14021
	cmp al,10
	jz LB_14021
	cmp al,32
	jz LB_14021
LB_14023:
	push r10
	call NS_E_13778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14024
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14025
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14025:
	jmp LB_14007
LB_14024:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_14028
LB_14027:
	add r14,1
LB_14028:
	cmp r14,r10
	jge LB_14029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14027
	cmp al,10
	jz LB_14027
	cmp al,32
	jz LB_14027
LB_14029:
	add r14,1
	cmp r14,r10
	jg LB_14034
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_14034
	jmp LB_14035
LB_14034:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14031
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14031:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14032
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14032:
	jmp LB_14007
LB_14035:
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
	jc LB_14012
	btr r12,2
	clc
	jmp LB_14013
LB_14012:
	bts r12,2
	stc
LB_14013:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14010
	btr r12,1
	clc
	jmp LB_14011
LB_14010:
	bts r12,1
	stc
LB_14011:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14008
	btr r12,0
	clc
	jmp LB_14009
LB_14008:
	bts r12,0
	stc
LB_14009:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_14004
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_14036
	btr r12,3
	jmp LB_14037
LB_14036:
	bts r12,3
LB_14037:
	mov r13,r14
	bt r12,1
	jc LB_14038
	btr r12,0
	jmp LB_14039
LB_14038:
	bts r12,0
LB_14039:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13806 ⊢ %_13807 : %_13807
 ; {>  %_13806~0':_p10225 }
; _some 0' ⊢ °0◂0'
; ∎ %_13807
 ; {>  %_13807~°0◂0':(_opn)◂(_p10225) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14002
	btr r12,3
	jmp LB_14003
LB_14002:
	bts r12,3
LB_14003:
	mov r8,0
	bts r12,2
	ret
LB_14004:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14006
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14005
LB_14006:
	add rsp,8
	ret
LB_14007:
	add rsp,48
	pop r14
LB_14005:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_14051
LB_14050:
	add r14,1
LB_14051:
	cmp r14,r10
	jge LB_14052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14050
	cmp al,10
	jz LB_14050
	cmp al,32
	jz LB_14050
LB_14052:
	push r10
	call NS_E_13782_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14053
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14047
LB_14053:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14048
	btr r12,0
	clc
	jmp LB_14049
LB_14048:
	bts r12,0
	stc
LB_14049:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14044
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10280 %_13808 ⊢ %_13809 : %_13809
 ; {>  %_13808~0':_stg }
; _f10280 0' ⊢ °4◂0'
; _some %_13809 ⊢ %_13810 : %_13810
 ; {>  %_13809~°4◂0':_p10225 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_13810
 ; {>  %_13810~°0◂°4◂0':(_opn)◂(_p10225) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14042
	btr r12,3
	jmp LB_14043
LB_14042:
	bts r12,3
LB_14043:
	mov rsi,1
	bt r12,3
	jc LB_14040
	mov rsi,0
	bt r9,0
	jc LB_14040
	jmp LB_14041
LB_14040:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14041:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14044:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14046
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14045
LB_14046:
	add rsp,8
	ret
LB_14047:
	add rsp,16
	pop r14
LB_14045:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_14066
LB_14065:
	add r14,1
LB_14066:
	cmp r14,r10
	jge LB_14067
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14065
	cmp al,10
	jz LB_14065
	cmp al,32
	jz LB_14065
LB_14067:
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14068
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14062
LB_14068:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14063
	btr r12,0
	clc
	jmp LB_14064
LB_14063:
	bts r12,0
	stc
LB_14064:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14059
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10279 %_13811 ⊢ %_13812 : %_13812
 ; {>  %_13811~0':_p10160 }
; _f10279 0' ⊢ °3◂0'
; _some %_13812 ⊢ %_13813 : %_13813
 ; {>  %_13812~°3◂0':_p10225 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_13813
 ; {>  %_13813~°0◂°3◂0':(_opn)◂(_p10225) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14057
	btr r12,3
	jmp LB_14058
LB_14057:
	bts r12,3
LB_14058:
	mov rsi,1
	bt r12,3
	jc LB_14055
	mov rsi,0
	bt r9,0
	jc LB_14055
	jmp LB_14056
LB_14055:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14056:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14059:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14061
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14060
LB_14061:
	add rsp,8
	ret
LB_14062:
	add rsp,16
	pop r14
LB_14060:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_13782:
NS_E_RDI_13782:
NS_E_13782_ETR_TBL:
NS_E_13782_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14083
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14075
LB_14083:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_14091
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_14091
	jmp LB_14092
LB_14091:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14089
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14089:
	jmp LB_14075
LB_14092:
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
	jc LB_14078
	btr r12,1
	clc
	jmp LB_14079
LB_14078:
	bts r12,1
	stc
LB_14079:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14076
	btr r12,0
	clc
	jmp LB_14077
LB_14076:
	bts r12,0
	stc
LB_14077:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14072
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13814 ⊢ %_13815 : %_13815
 ; {>  %_13814~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_13815
 ; {>  %_13815~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14070
	btr r12,3
	jmp LB_14071
LB_14070:
	bts r12,3
LB_14071:
	mov r8,0
	bts r12,2
	ret
LB_14072:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14074
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14073
LB_14074:
	add rsp,8
	ret
LB_14075:
	add rsp,32
	pop r14
LB_14073:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14093:
NS_E_RDI_14093:
NS_E_14093_ETR_TBL:
NS_E_14093_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_14508
LB_14507:
	add r14,1
LB_14508:
	cmp r14,r10
	jge LB_14509
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14507
	cmp al,10
	jz LB_14507
	cmp al,32
	jz LB_14507
LB_14509:
	push r10
	call NS_E_14094_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14510
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14502
LB_14510:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_14513
LB_14512:
	add r14,1
LB_14513:
	cmp r14,r10
	jge LB_14514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14512
	cmp al,10
	jz LB_14512
	cmp al,32
	jz LB_14512
LB_14514:
	push r10
	call NS_E_14093_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14515
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14516
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14516:
	jmp LB_14502
LB_14515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14505
	btr r12,1
	clc
	jmp LB_14506
LB_14505:
	bts r12,1
	stc
LB_14506:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14503
	btr r12,0
	clc
	jmp LB_14504
LB_14503:
	bts r12,0
	stc
LB_14504:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14499
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_14134 %_14135 } ⊢ %_14136 : %_14136
 ; {>  %_14135~1':(_lst)◂(_p10208) %_14134~0':_p10208 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14136 ⊢ %_14137 : %_14137
 ; {>  %_14136~°0◂{ 0' 1' }:(_lst)◂(_p10208) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14137
 ; {>  %_14137~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10208)) }
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
	jc LB_14493
	btr r12,2
	jmp LB_14494
LB_14493:
	bts r12,2
LB_14494:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_14491
	btr QWORD [rdi],0
	jmp LB_14492
LB_14491:
	bts QWORD [rdi],0
LB_14492:
	mov r8,r14
	bt r12,1
	jc LB_14497
	btr r12,2
	jmp LB_14498
LB_14497:
	bts r12,2
LB_14498:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_14495
	btr QWORD [rdi],1
	jmp LB_14496
LB_14495:
	bts QWORD [rdi],1
LB_14496:
	mov rsi,1
	bt r12,3
	jc LB_14489
	mov rsi,0
	bt r9,0
	jc LB_14489
	jmp LB_14490
LB_14489:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14490:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14499:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14501
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14500
LB_14501:
	add rsp,8
	ret
LB_14502:
	add rsp,32
	pop r14
LB_14500:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14520
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_14138 : %_14138
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_14138 ⊢ %_14139 : %_14139
 ; {>  %_14138~°1◂{  }:(_lst)◂(t5353'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14139
 ; {>  %_14139~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5356'(0))) }
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
	jc LB_14518
	mov rsi,0
	bt r9,0
	jc LB_14518
	jmp LB_14519
LB_14518:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14519:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14520:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14522
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14521
LB_14522:
	add rsp,8
	ret
LB_14523:
	add rsp,0
	pop r14
LB_14521:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14094:
NS_E_RDI_14094:
NS_E_14094_ETR_TBL:
NS_E_14094_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
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
	add r14,7
	cmp r14,r10
	jg LB_14546
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_14546
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_14546
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_14546
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_14546
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_14546
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_14546
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_14546
	jmp LB_14547
LB_14546:
	jmp LB_14529
LB_14547:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_14536
LB_14535:
	add r14,1
LB_14536:
	cmp r14,r10
	jge LB_14537
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14535
	cmp al,10
	jz LB_14535
	cmp al,32
	jz LB_14535
LB_14537:
	push r10
	call NS_E_14095_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14538
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14539:
	jmp LB_14530
LB_14538:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14533
	btr r12,1
	clc
	jmp LB_14534
LB_14533:
	bts r12,1
	stc
LB_14534:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14531
	btr r12,0
	clc
	jmp LB_14532
LB_14531:
	bts r12,0
	stc
LB_14532:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14526
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14548
	btr r12,2
	jmp LB_14549
LB_14548:
	bts r12,2
LB_14549:
	mov r13,r14
	bt r12,1
	jc LB_14550
	btr r12,0
	jmp LB_14551
LB_14550:
	bts r12,0
LB_14551:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14140 ⊢ %_14141 : %_14141
 ; {>  %_14140~0':_p10208 }
; _some 0' ⊢ °0◂0'
; ∎ %_14141
 ; {>  %_14141~°0◂0':(_opn)◂(_p10208) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14524
	btr r12,3
	jmp LB_14525
LB_14524:
	bts r12,3
LB_14525:
	mov r8,0
	bts r12,2
	ret
LB_14526:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14528
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14527
LB_14528:
	add rsp,8
	ret
LB_14530:
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
LB_14529:
	add rsp,32
	pop r14
LB_14527:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14553
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_14142
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_14142 ⊢ %_14143 : %_14143
 ; {>  %_14142~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_14144 : %_14144
 ; {>  %_14143~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_14144
 ; {>  %_14144~°1◂{  }:(_opn)◂(t5366'(0)) %_14143~0':_stg }
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
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_14592
LB_14591:
	add r14,1
LB_14592:
	cmp r14,r10
	jge LB_14593
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14591
	cmp al,10
	jz LB_14591
	cmp al,32
	jz LB_14591
LB_14593:
	add r14,4
	cmp r14,r10
	jg LB_14596
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_14596
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_14596
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_14596
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_14596
	jmp LB_14597
LB_14596:
	jmp LB_14570
LB_14597:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_14579
LB_14578:
	add r14,1
LB_14579:
	cmp r14,r10
	jge LB_14580
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14578
	cmp al,10
	jz LB_14578
	cmp al,32
	jz LB_14578
LB_14580:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14581
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14582:
	jmp LB_14571
LB_14581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_14585
LB_14584:
	add r14,1
LB_14585:
	cmp r14,r10
	jge LB_14586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14584
	cmp al,10
	jz LB_14584
	cmp al,32
	jz LB_14584
LB_14586:
	push r10
	call NS_E_14096_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14587
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14588
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14588:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14589
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14589:
	jmp LB_14571
LB_14587:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14576
	btr r12,2
	clc
	jmp LB_14577
LB_14576:
	bts r12,2
	stc
LB_14577:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14574
	btr r12,1
	clc
	jmp LB_14575
LB_14574:
	bts r12,1
	stc
LB_14575:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14572
	btr r12,0
	clc
	jmp LB_14573
LB_14572:
	bts r12,0
	stc
LB_14573:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_14567
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_14598
	btr r12,3
	jmp LB_14599
LB_14598:
	bts r12,3
LB_14599:
	mov r14,r8
	bt r12,2
	jc LB_14600
	btr r12,1
	jmp LB_14601
LB_14600:
	bts r12,1
LB_14601:
	mov r8,r13
	bt r12,0
	jc LB_14602
	btr r12,2
	jmp LB_14603
LB_14602:
	bts r12,2
LB_14603:
	mov r13,r9
	bt r12,3
	jc LB_14604
	btr r12,0
	jmp LB_14605
LB_14604:
	bts r12,0
LB_14605:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10235 { %_14145 %_14146 } ⊢ %_14147 : %_14147
 ; {>  %_14146~1':_p10209 %_14145~0':_stg }
; _f10235 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14147 ⊢ %_14148 : %_14148
 ; {>  %_14147~°0◂{ 0' 1' }:_p10208 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14148
 ; {>  %_14148~°0◂°0◂{ 0' 1' }:(_opn)◂(_p10208) }
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
	jc LB_14561
	btr r12,2
	jmp LB_14562
LB_14561:
	bts r12,2
LB_14562:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_14559
	btr QWORD [rdi],0
	jmp LB_14560
LB_14559:
	bts QWORD [rdi],0
LB_14560:
	mov r8,r14
	bt r12,1
	jc LB_14565
	btr r12,2
	jmp LB_14566
LB_14565:
	bts r12,2
LB_14566:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_14563
	btr QWORD [rdi],1
	jmp LB_14564
LB_14563:
	bts QWORD [rdi],1
LB_14564:
	mov rsi,1
	bt r12,3
	jc LB_14557
	mov rsi,0
	bt r9,0
	jc LB_14557
	jmp LB_14558
LB_14557:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14558:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14567:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14569
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14568
LB_14569:
	add rsp,8
	ret
LB_14571:
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
LB_14570:
	add rsp,48
	pop r14
LB_14568:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14607
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_14149
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_14149 ⊢ %_14150 : %_14150
 ; {>  %_14149~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_14151 : %_14151
 ; {>  %_14150~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_14151
 ; {>  %_14151~°1◂{  }:(_opn)◂(t5378'(0)) %_14150~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14606
	mov rdi,r13
	call dlt
LB_14606:
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
LB_14607:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14609
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14608
LB_14609:
	add rsp,8
	ret
LB_14610:
	add rsp,0
	pop r14
LB_14608:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_14629
LB_14628:
	add r14,1
LB_14629:
	cmp r14,r10
	jge LB_14630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14628
	cmp al,10
	jz LB_14628
	cmp al,32
	jz LB_14628
LB_14630:
	add r14,2
	cmp r14,r10
	jg LB_14633
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_14633
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_14633
	jmp LB_14634
LB_14633:
	jmp LB_14616
LB_14634:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_14623
LB_14622:
	add r14,1
LB_14623:
	cmp r14,r10
	jge LB_14624
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14622
	cmp al,10
	jz LB_14622
	cmp al,32
	jz LB_14622
LB_14624:
	push r10
	call NS_E_14104_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14625
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14626
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14626:
	jmp LB_14617
LB_14625:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14620
	btr r12,1
	clc
	jmp LB_14621
LB_14620:
	bts r12,1
	stc
LB_14621:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14618
	btr r12,0
	clc
	jmp LB_14619
LB_14618:
	bts r12,0
	stc
LB_14619:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14613
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14635
	btr r12,2
	jmp LB_14636
LB_14635:
	bts r12,2
LB_14636:
	mov r13,r14
	bt r12,1
	jc LB_14637
	btr r12,0
	jmp LB_14638
LB_14637:
	bts r12,0
LB_14638:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14152 ⊢ %_14153 : %_14153
 ; {>  %_14152~0':_p10208 }
; _some 0' ⊢ °0◂0'
; ∎ %_14153
 ; {>  %_14153~°0◂0':(_opn)◂(_p10208) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14611
	btr r12,3
	jmp LB_14612
LB_14611:
	bts r12,3
LB_14612:
	mov r8,0
	bts r12,2
	ret
LB_14613:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14615
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14614
LB_14615:
	add rsp,8
	ret
LB_14617:
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
LB_14616:
	add rsp,32
	pop r14
LB_14614:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14640
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_14154
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_14154 ⊢ %_14155 : %_14155
 ; {>  %_14154~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_14156 : %_14156
 ; {>  %_14155~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_14156
 ; {>  %_14156~°1◂{  }:(_opn)◂(t5388'(0)) %_14155~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14639
	mov rdi,r13
	call dlt
LB_14639:
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
LB_14640:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14642
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14641
LB_14642:
	add rsp,8
	ret
LB_14643:
	add rsp,0
	pop r14
LB_14641:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_14662
LB_14661:
	add r14,1
LB_14662:
	cmp r14,r10
	jge LB_14663
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14661
	cmp al,10
	jz LB_14661
	cmp al,32
	jz LB_14661
LB_14663:
	add r14,2
	cmp r14,r10
	jg LB_14666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_14666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_14666
	jmp LB_14667
LB_14666:
	jmp LB_14649
LB_14667:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_14656
LB_14655:
	add r14,1
LB_14656:
	cmp r14,r10
	jge LB_14657
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14655
	cmp al,10
	jz LB_14655
	cmp al,32
	jz LB_14655
LB_14657:
	push r10
	call NS_E_14098_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14658
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14659
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14659:
	jmp LB_14650
LB_14658:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14653
	btr r12,1
	clc
	jmp LB_14654
LB_14653:
	bts r12,1
	stc
LB_14654:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14651
	btr r12,0
	clc
	jmp LB_14652
LB_14651:
	bts r12,0
	stc
LB_14652:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14646
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14668
	btr r12,2
	jmp LB_14669
LB_14668:
	bts r12,2
LB_14669:
	mov r13,r14
	bt r12,1
	jc LB_14670
	btr r12,0
	jmp LB_14671
LB_14670:
	bts r12,0
LB_14671:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14157 ⊢ %_14158 : %_14158
 ; {>  %_14157~0':_p10208 }
; _some 0' ⊢ °0◂0'
; ∎ %_14158
 ; {>  %_14158~°0◂0':(_opn)◂(_p10208) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14644
	btr r12,3
	jmp LB_14645
LB_14644:
	bts r12,3
LB_14645:
	mov r8,0
	bts r12,2
	ret
LB_14646:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14648
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14647
LB_14648:
	add rsp,8
	ret
LB_14650:
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
LB_14649:
	add rsp,32
	pop r14
LB_14647:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14095:
NS_E_RDI_14095:
NS_E_14095_ETR_TBL:
NS_E_14095_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_14707
LB_14706:
	add r14,1
LB_14707:
	cmp r14,r10
	jge LB_14708
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14706
	cmp al,10
	jz LB_14706
	cmp al,32
	jz LB_14706
LB_14708:
	push r10
	call NS_E_14121_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14709
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14701
LB_14709:
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
LB_14715:
	jmp LB_14712
LB_14711:
	add r14,1
LB_14712:
	cmp r14,r10
	jge LB_14713
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14711
	cmp al,10
	jz LB_14711
	cmp al,32
	jz LB_14711
LB_14713:
	push r10
	push rsi
	call NS_E_14121_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_14714
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_14716
	bts QWORD [rax],0
LB_14716:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_14715
LB_14714:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14704
	btr r12,1
	clc
	jmp LB_14705
LB_14704:
	bts r12,1
	stc
LB_14705:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14702
	btr r12,0
	clc
	jmp LB_14703
LB_14702:
	bts r12,0
	stc
LB_14703:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14698
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_14717
	btr r12,2
	jmp LB_14718
LB_14717:
	bts r12,2
LB_14718:
	mov r9,r13
	bt r12,0
	jc LB_14719
	btr r12,3
	jmp LB_14720
LB_14719:
	bts r12,3
LB_14720:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_14723
	btr r12,4
	clc
	jmp LB_14724
LB_14723:
	bts r12,4
	stc
LB_14724:
	mov r13,r10
	bt r12,4
	jc LB_14721
	btr r12,0
	jmp LB_14722
LB_14721:
	bts r12,0
LB_14722:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_14727
	btr r12,4
	clc
	jmp LB_14728
LB_14727:
	bts r12,4
	stc
LB_14728:
	mov r14,r10
	bt r12,4
	jc LB_14725
	btr r12,1
	jmp LB_14726
LB_14725:
	bts r12,1
LB_14726:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f9394 %_14160 ⊢ %_14161 : %_14161
 ; {>  %_14159~{ 0' 1' }:{ _stg _p10212 } %_14160~2':(_lst)◂({ _stg _p10212 }) }
; _f9394 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_14676
	btr r12,0
	jmp LB_14677
LB_14676:
	bts r12,0
LB_14677:
	call NS_E_9394
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_14678
	btr r12,2
	jmp LB_14679
LB_14678:
	bts r12,2
LB_14679:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_14674
	btr r12,1
	clc
	jmp LB_14675
LB_14674:
	bts r12,1
	stc
LB_14675:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_14672
	btr r12,0
	clc
	jmp LB_14673
LB_14672:
	bts r12,0
	stc
LB_14673:
	add rsp,24
; _cns { %_14159 %_14161 } ⊢ %_14162 : %_14162
 ; {>  %_14159~{ 0' 1' }:{ _stg _p10212 } %_14161~2':(_lst)◂({ _stg _p10212 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f10236 %_14162 ⊢ %_14163 : %_14163
 ; {>  %_14162~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p10212 }) }
; _f10236 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_14163 ⊢ %_14164 : %_14164
 ; {>  %_14163~°1◂°0◂{ { 0' 1' } 2' }:_p10208 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_14164
 ; {>  %_14164~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p10208) }
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
	jc LB_14688
	btr r12,5
	jmp LB_14689
LB_14688:
	bts r12,5
LB_14689:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_14686
	btr QWORD [rdi],0
	jmp LB_14687
LB_14686:
	bts QWORD [rdi],0
LB_14687:
	mov r11,r14
	bt r12,1
	jc LB_14692
	btr r12,5
	jmp LB_14693
LB_14692:
	bts r12,5
LB_14693:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_14690
	btr QWORD [rdi],1
	jmp LB_14691
LB_14690:
	bts QWORD [rdi],1
LB_14691:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_14684
	btr QWORD [rdi],0
	jmp LB_14685
LB_14684:
	bts QWORD [rdi],0
LB_14685:
	mov r10,r8
	bt r12,2
	jc LB_14696
	btr r12,4
	jmp LB_14697
LB_14696:
	bts r12,4
LB_14697:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_14694
	btr QWORD [rdi],1
	jmp LB_14695
LB_14694:
	bts QWORD [rdi],1
LB_14695:
	mov rsi,1
	bt r12,3
	jc LB_14682
	mov rsi,0
	bt r9,0
	jc LB_14682
	jmp LB_14683
LB_14682:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14683:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_14680
	mov rsi,0
	bt r9,0
	jc LB_14680
	jmp LB_14681
LB_14680:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14681:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14698:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14700
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14699
LB_14700:
	add rsp,8
	ret
LB_14701:
	add rsp,32
	pop r14
LB_14699:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14730
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_14165
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_14165 ⊢ %_14166 : %_14166
 ; {>  %_14165~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_14167 : %_14167
 ; {>  %_14166~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_14167
 ; {>  %_14167~°1◂{  }:(_opn)◂(t5407'(0)) %_14166~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14729
	mov rdi,r13
	call dlt
LB_14729:
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
LB_14730:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14732
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14731
LB_14732:
	add rsp,8
	ret
LB_14733:
	add rsp,0
	pop r14
LB_14731:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14096:
NS_E_RDI_14096:
NS_E_14096_ETR_TBL:
NS_E_14096_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_14754
LB_14753:
	add r14,1
LB_14754:
	cmp r14,r10
	jge LB_14755
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14753
	cmp al,10
	jz LB_14753
	cmp al,32
	jz LB_14753
LB_14755:
	add r14,1
	cmp r14,r10
	jg LB_14758
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_14758
	jmp LB_14759
LB_14758:
	jmp LB_14741
LB_14759:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_14748
LB_14747:
	add r14,1
LB_14748:
	cmp r14,r10
	jge LB_14749
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14747
	cmp al,10
	jz LB_14747
	cmp al,32
	jz LB_14747
LB_14749:
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14750
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14751
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14751:
	jmp LB_14742
LB_14750:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14745
	btr r12,1
	clc
	jmp LB_14746
LB_14745:
	bts r12,1
	stc
LB_14746:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14743
	btr r12,0
	clc
	jmp LB_14744
LB_14743:
	bts r12,0
	stc
LB_14744:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14738
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14760
	btr r12,2
	jmp LB_14761
LB_14760:
	bts r12,2
LB_14761:
	mov r13,r14
	bt r12,1
	jc LB_14762
	btr r12,0
	jmp LB_14763
LB_14762:
	bts r12,0
LB_14763:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10242 %_14168 ⊢ %_14169 : %_14169
 ; {>  %_14168~0':_p10160 }
; _f10242 0' ⊢ °1◂0'
; _some %_14169 ⊢ %_14170 : %_14170
 ; {>  %_14169~°1◂0':_p10209 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14170
 ; {>  %_14170~°0◂°1◂0':(_opn)◂(_p10209) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14736
	btr r12,3
	jmp LB_14737
LB_14736:
	bts r12,3
LB_14737:
	mov rsi,1
	bt r12,3
	jc LB_14734
	mov rsi,0
	bt r9,0
	jc LB_14734
	jmp LB_14735
LB_14734:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14735:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14738:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14740
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14739
LB_14740:
	add rsp,8
	ret
LB_14742:
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
LB_14741:
	add rsp,32
	pop r14
LB_14739:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_14775
LB_14774:
	add r14,1
LB_14775:
	cmp r14,r10
	jge LB_14776
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14774
	cmp al,10
	jz LB_14774
	cmp al,32
	jz LB_14774
LB_14776:
	push r10
	call NS_E_14097_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14777
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14771
LB_14777:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14772
	btr r12,0
	clc
	jmp LB_14773
LB_14772:
	bts r12,0
	stc
LB_14773:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14768
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10241 %_14171 ⊢ %_14172 : %_14172
 ; {>  %_14171~0':(_lst)◂(_p10208) }
; _f10241 0' ⊢ °0◂0'
; _some %_14172 ⊢ %_14173 : %_14173
 ; {>  %_14172~°0◂0':_p10209 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14173
 ; {>  %_14173~°0◂°0◂0':(_opn)◂(_p10209) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14766
	btr r12,3
	jmp LB_14767
LB_14766:
	bts r12,3
LB_14767:
	mov rsi,1
	bt r12,3
	jc LB_14764
	mov rsi,0
	bt r9,0
	jc LB_14764
	jmp LB_14765
LB_14764:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14765:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14768:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14770
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14769
LB_14770:
	add rsp,8
	ret
LB_14771:
	add rsp,16
	pop r14
LB_14769:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14780
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_14174
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_14174 ⊢ %_14175 : %_14175
 ; {>  %_14174~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_14176 : %_14176
 ; {>  %_14175~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_14176
 ; {>  %_14175~0':_stg %_14176~°1◂{  }:(_opn)◂(t5422'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14779
	mov rdi,r13
	call dlt
LB_14779:
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
LB_14780:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14782
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14781
LB_14782:
	add rsp,8
	ret
LB_14783:
	add rsp,0
	pop r14
LB_14781:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14097:
NS_E_RDI_14097:
NS_E_14097_ETR_TBL:
NS_E_14097_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_14793
LB_14792:
	add r14,1
LB_14793:
	cmp r14,r10
	jge LB_14794
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14792
	cmp al,10
	jz LB_14792
	cmp al,32
	jz LB_14792
LB_14794:
	add r14,6
	cmp r14,r10
	jg LB_14797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_14797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_14797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_14797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_14797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_14797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_14797
	jmp LB_14798
LB_14797:
	jmp LB_14789
LB_14798:
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
	jc LB_14790
	btr r12,0
	clc
	jmp LB_14791
LB_14790:
	bts r12,0
	stc
LB_14791:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14786
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_14177 : %_14177
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_14177 ⊢ %_14178 : %_14178
 ; {>  %_14177~°1◂{  }:(_lst)◂(t5426'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14178
 ; {>  %_14178~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5429'(0))) }
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
	jc LB_14784
	mov rsi,0
	bt r9,0
	jc LB_14784
	jmp LB_14785
LB_14784:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14785:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14786:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14788
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14787
LB_14788:
	add rsp,8
	ret
LB_14789:
	add rsp,16
	pop r14
LB_14787:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_14818
LB_14817:
	add r14,1
LB_14818:
	cmp r14,r10
	jge LB_14819
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14817
	cmp al,10
	jz LB_14817
	cmp al,32
	jz LB_14817
LB_14819:
	push r10
	call NS_E_14094_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14820
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14812
LB_14820:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_14823
LB_14822:
	add r14,1
LB_14823:
	cmp r14,r10
	jge LB_14824
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14822
	cmp al,10
	jz LB_14822
	cmp al,32
	jz LB_14822
LB_14824:
	push r10
	call NS_E_14097_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14825
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14826
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14826:
	jmp LB_14812
LB_14825:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14815
	btr r12,1
	clc
	jmp LB_14816
LB_14815:
	bts r12,1
	stc
LB_14816:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14813
	btr r12,0
	clc
	jmp LB_14814
LB_14813:
	bts r12,0
	stc
LB_14814:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14809
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_14179 %_14180 } ⊢ %_14181 : %_14181
 ; {>  %_14180~1':(_lst)◂(_p10208) %_14179~0':_p10208 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14181 ⊢ %_14182 : %_14182
 ; {>  %_14181~°0◂{ 0' 1' }:(_lst)◂(_p10208) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14182
 ; {>  %_14182~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10208)) }
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
	jc LB_14803
	btr r12,2
	jmp LB_14804
LB_14803:
	bts r12,2
LB_14804:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_14801
	btr QWORD [rdi],0
	jmp LB_14802
LB_14801:
	bts QWORD [rdi],0
LB_14802:
	mov r8,r14
	bt r12,1
	jc LB_14807
	btr r12,2
	jmp LB_14808
LB_14807:
	bts r12,2
LB_14808:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_14805
	btr QWORD [rdi],1
	jmp LB_14806
LB_14805:
	bts QWORD [rdi],1
LB_14806:
	mov rsi,1
	bt r12,3
	jc LB_14799
	mov rsi,0
	bt r9,0
	jc LB_14799
	jmp LB_14800
LB_14799:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14800:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14809:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14811
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14810
LB_14811:
	add rsp,8
	ret
LB_14812:
	add rsp,32
	pop r14
LB_14810:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14098:
NS_E_RDI_14098:
NS_E_14098_ETR_TBL:
NS_E_14098_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_14883
LB_14882:
	add r14,1
LB_14883:
	cmp r14,r10
	jge LB_14884
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14882
	cmp al,10
	jz LB_14882
	cmp al,32
	jz LB_14882
LB_14884:
	add r14,1
	cmp r14,r10
	jg LB_14887
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_14887
	jmp LB_14888
LB_14887:
	jmp LB_14849
LB_14888:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_14860
LB_14859:
	add r14,1
LB_14860:
	cmp r14,r10
	jge LB_14861
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14859
	cmp al,10
	jz LB_14859
	cmp al,32
	jz LB_14859
LB_14861:
	add r14,1
	cmp r14,r10
	jg LB_14865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_14865
	jmp LB_14866
LB_14865:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14863
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14863:
	jmp LB_14850
LB_14866:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_14868
LB_14867:
	add r14,1
LB_14868:
	cmp r14,r10
	jge LB_14869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14867
	cmp al,10
	jz LB_14867
	cmp al,32
	jz LB_14867
LB_14869:
	push r10
	call NS_E_14099_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14870
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14871
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14871:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14872
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14872:
	jmp LB_14850
LB_14870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_14875
LB_14874:
	add r14,1
LB_14875:
	cmp r14,r10
	jge LB_14876
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14874
	cmp al,10
	jz LB_14874
	cmp al,32
	jz LB_14874
LB_14876:
	push r10
	call NS_E_14102_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14877
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14878
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14878:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14879
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14879:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14880:
	jmp LB_14850
LB_14877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14857
	btr r12,3
	clc
	jmp LB_14858
LB_14857:
	bts r12,3
	stc
LB_14858:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14855
	btr r12,2
	clc
	jmp LB_14856
LB_14855:
	bts r12,2
	stc
LB_14856:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14853
	btr r12,1
	clc
	jmp LB_14854
LB_14853:
	bts r12,1
	stc
LB_14854:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14851
	btr r12,0
	clc
	jmp LB_14852
LB_14851:
	bts r12,0
	stc
LB_14852:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_14846
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_14889
	btr r12,4
	jmp LB_14890
LB_14889:
	bts r12,4
LB_14890:
	mov r8,r9
	bt r12,3
	jc LB_14891
	btr r12,2
	jmp LB_14892
LB_14891:
	bts r12,2
LB_14892:
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
	jc LB_14895
	btr r12,3
	clc
	jmp LB_14896
LB_14895:
	bts r12,3
	stc
LB_14896:
	mov r13,r9
	bt r12,3
	jc LB_14893
	btr r12,0
	jmp LB_14894
LB_14893:
	bts r12,0
LB_14894:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_14899
	btr r12,3
	clc
	jmp LB_14900
LB_14899:
	bts r12,3
	stc
LB_14900:
	mov r14,r9
	bt r12,3
	jc LB_14897
	btr r12,1
	jmp LB_14898
LB_14897:
	bts r12,1
LB_14898:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_14183 %_14184 } ⊢ %_14185 : %_14185
 ; {>  %_14183~{ 0' 1' }:{ _stg _p10211 } %_14184~2':(_lst)◂({ _stg _p10211 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f10240 %_14185 ⊢ %_14186 : %_14186
 ; {>  %_14185~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p10211 }) }
; _f10240 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_14186 ⊢ %_14187 : %_14187
 ; {>  %_14186~°5◂°0◂{ { 0' 1' } 2' }:_p10208 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_14187
 ; {>  %_14187~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p10208) }
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
	jc LB_14836
	btr r12,5
	jmp LB_14837
LB_14836:
	bts r12,5
LB_14837:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_14834
	btr QWORD [rdi],0
	jmp LB_14835
LB_14834:
	bts QWORD [rdi],0
LB_14835:
	mov r11,r14
	bt r12,1
	jc LB_14840
	btr r12,5
	jmp LB_14841
LB_14840:
	bts r12,5
LB_14841:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_14838
	btr QWORD [rdi],1
	jmp LB_14839
LB_14838:
	bts QWORD [rdi],1
LB_14839:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_14832
	btr QWORD [rdi],0
	jmp LB_14833
LB_14832:
	bts QWORD [rdi],0
LB_14833:
	mov r10,r8
	bt r12,2
	jc LB_14844
	btr r12,4
	jmp LB_14845
LB_14844:
	bts r12,4
LB_14845:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_14842
	btr QWORD [rdi],1
	jmp LB_14843
LB_14842:
	bts QWORD [rdi],1
LB_14843:
	mov rsi,1
	bt r12,3
	jc LB_14830
	mov rsi,0
	bt r9,0
	jc LB_14830
	jmp LB_14831
LB_14830:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14831:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_14828
	mov rsi,0
	bt r9,0
	jc LB_14828
	jmp LB_14829
LB_14828:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14829:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14846:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14848
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14847
LB_14848:
	add rsp,8
	ret
LB_14850:
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
LB_14849:
	add rsp,64
	pop r14
LB_14847:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_14918
LB_14917:
	add r14,1
LB_14918:
	cmp r14,r10
	jge LB_14919
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14917
	cmp al,10
	jz LB_14917
	cmp al,32
	jz LB_14917
LB_14919:
	push r10
	call NS_E_14099_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14920
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14914
LB_14920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14915
	btr r12,0
	clc
	jmp LB_14916
LB_14915:
	bts r12,0
	stc
LB_14916:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14911
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_14922
	btr r12,2
	jmp LB_14923
LB_14922:
	bts r12,2
LB_14923:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_14926
	btr r12,3
	clc
	jmp LB_14927
LB_14926:
	bts r12,3
	stc
LB_14927:
	mov r13,r9
	bt r12,3
	jc LB_14924
	btr r12,0
	jmp LB_14925
LB_14924:
	bts r12,0
LB_14925:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_14930
	btr r12,3
	clc
	jmp LB_14931
LB_14930:
	bts r12,3
	stc
LB_14931:
	mov r14,r9
	bt r12,3
	jc LB_14928
	btr r12,1
	jmp LB_14929
LB_14928:
	bts r12,1
LB_14929:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10239 %_14188 ⊢ %_14189 : %_14189
 ; {>  %_14188~{ 0' 1' }:{ _stg _p10211 } }
; _f10239 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_14189 ⊢ %_14190 : %_14190
 ; {>  %_14189~°4◂{ 0' 1' }:_p10208 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_14190
 ; {>  %_14190~°0◂°4◂{ 0' 1' }:(_opn)◂(_p10208) }
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
	jc LB_14905
	btr r12,2
	jmp LB_14906
LB_14905:
	bts r12,2
LB_14906:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_14903
	btr QWORD [rdi],0
	jmp LB_14904
LB_14903:
	bts QWORD [rdi],0
LB_14904:
	mov r8,r14
	bt r12,1
	jc LB_14909
	btr r12,2
	jmp LB_14910
LB_14909:
	bts r12,2
LB_14910:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_14907
	btr QWORD [rdi],1
	jmp LB_14908
LB_14907:
	bts QWORD [rdi],1
LB_14908:
	mov rsi,1
	bt r12,3
	jc LB_14901
	mov rsi,0
	bt r9,0
	jc LB_14901
	jmp LB_14902
LB_14901:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14902:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14911:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14913
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14912
LB_14913:
	add rsp,8
	ret
LB_14914:
	add rsp,16
	pop r14
LB_14912:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14933
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_14191
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_14191 ⊢ %_14192 : %_14192
 ; {>  %_14191~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_14193 : %_14193
 ; {>  %_14192~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_14193
 ; {>  %_14192~0':_stg %_14193~°1◂{  }:(_opn)◂(t5453'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14932
	mov rdi,r13
	call dlt
LB_14932:
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
LB_14933:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14935
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14934
LB_14935:
	add rsp,8
	ret
LB_14936:
	add rsp,0
	pop r14
LB_14934:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14099:
NS_E_RDI_14099:
NS_E_14099_ETR_TBL:
NS_E_14099_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_14970
LB_14969:
	add r14,1
LB_14970:
	cmp r14,r10
	jge LB_14971
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14969
	cmp al,10
	jz LB_14969
	cmp al,32
	jz LB_14969
LB_14971:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14972
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14951
LB_14972:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_14975
LB_14974:
	add r14,1
LB_14975:
	cmp r14,r10
	jge LB_14976
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14974
	cmp al,10
	jz LB_14974
	cmp al,32
	jz LB_14974
LB_14976:
	push r10
	call NS_E_14101_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14977
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14978
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14978:
	jmp LB_14951
LB_14977:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_14981
LB_14980:
	add r14,1
LB_14981:
	cmp r14,r10
	jge LB_14982
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14980
	cmp al,10
	jz LB_14980
	cmp al,32
	jz LB_14980
LB_14982:
	add r14,1
	cmp r14,r10
	jg LB_14987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_14987
	jmp LB_14988
LB_14987:
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
	jmp LB_14951
LB_14988:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
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
	push r10
	call NS_E_13778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14964
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14965
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14965:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14966
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14966:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14967
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14967:
	jmp LB_14952
LB_14964:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14959
	btr r12,3
	clc
	jmp LB_14960
LB_14959:
	bts r12,3
	stc
LB_14960:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14957
	btr r12,2
	clc
	jmp LB_14958
LB_14957:
	bts r12,2
	stc
LB_14958:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14955
	btr r12,1
	clc
	jmp LB_14956
LB_14955:
	bts r12,1
	stc
LB_14956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14953
	btr r12,0
	clc
	jmp LB_14954
LB_14953:
	bts r12,0
	stc
LB_14954:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_14948
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_14989
	btr r12,4
	jmp LB_14990
LB_14989:
	bts r12,4
LB_14990:
	mov r8,r9
	bt r12,3
	jc LB_14991
	btr r12,2
	jmp LB_14992
LB_14991:
	bts r12,2
LB_14992:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10247 %_14196 ⊢ %_14197 : %_14197
 ; {>  %_14195~1':_p14100 %_14196~2':_p10225 %_14194~0':_stg }
; _f10247 2' ⊢ °1◂2'
; _some { %_14194 %_14197 } ⊢ %_14198 : %_14198
 ; {>  %_14195~1':_p14100 %_14197~°1◂2':_p10211 %_14194~0':_stg }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_14198
 ; {>  %_14195~1':_p14100 %_14198~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p10211 }) }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_14937
	mov rdi,r14
	call dlt
LB_14937:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_14940
	btr r12,1
	jmp LB_14941
LB_14940:
	bts r12,1
LB_14941:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_14938
	btr QWORD [rdi],0
	jmp LB_14939
LB_14938:
	bts QWORD [rdi],0
LB_14939:
	mov r14,r8
	bt r12,2
	jc LB_14946
	btr r12,1
	jmp LB_14947
LB_14946:
	bts r12,1
LB_14947:
	mov rsi,1
	bt r12,1
	jc LB_14944
	mov rsi,0
	bt r14,0
	jc LB_14944
	jmp LB_14945
LB_14944:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_14945:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_14942
	btr QWORD [rdi],1
	jmp LB_14943
LB_14942:
	bts QWORD [rdi],1
LB_14943:
	mov r8,0
	bts r12,2
	ret
LB_14948:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14950
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14949
LB_14950:
	add rsp,8
	ret
LB_14952:
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
LB_14951:
	add rsp,64
	pop r14
LB_14949:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_15039
LB_15038:
	add r14,1
LB_15039:
	cmp r14,r10
	jge LB_15040
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15038
	cmp al,10
	jz LB_15038
	cmp al,32
	jz LB_15038
LB_15040:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15041
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15023
LB_15041:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_15044
LB_15043:
	add r14,1
LB_15044:
	cmp r14,r10
	jge LB_15045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15043
	cmp al,10
	jz LB_15043
	cmp al,32
	jz LB_15043
LB_15045:
	push r10
	call NS_E_14101_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15046
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15047:
	jmp LB_15023
LB_15046:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_15050
LB_15049:
	add r14,1
LB_15050:
	cmp r14,r10
	jge LB_15051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15049
	cmp al,10
	jz LB_15049
	cmp al,32
	jz LB_15049
LB_15051:
	add r14,3
	cmp r14,r10
	jg LB_15056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_15056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_15056
	jmp LB_15057
LB_15056:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15053
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15053:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15054
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15054:
	jmp LB_15023
LB_15057:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_15059
LB_15058:
	add r14,1
LB_15059:
	cmp r14,r10
	jge LB_15060
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15058
	cmp al,10
	jz LB_15058
	cmp al,32
	jz LB_15058
LB_15060:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15061
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15062
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15062:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15063
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15063:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15064
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15064:
	jmp LB_15023
LB_15061:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_15067
LB_15066:
	add r14,1
LB_15067:
	cmp r14,r10
	jge LB_15068
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15066
	cmp al,10
	jz LB_15066
	cmp al,32
	jz LB_15066
LB_15068:
	add r14,1
	cmp r14,r10
	jg LB_15075
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_15075
	jmp LB_15076
LB_15075:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15070
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15070:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15071
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15071:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15072
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15072:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15073
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15073:
	jmp LB_15023
LB_15076:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_15078
LB_15077:
	add r14,1
LB_15078:
	cmp r14,r10
	jge LB_15079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15077
	cmp al,10
	jz LB_15077
	cmp al,32
	jz LB_15077
LB_15079:
	push r10
	call NS_E_13778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15080
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_15081
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_15081:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15082
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15082:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15083
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15083:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15084
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15084:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15085
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15085:
	jmp LB_15023
LB_15080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_15088
LB_15087:
	add r14,1
LB_15088:
	cmp r14,r10
	jge LB_15089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15087
	cmp al,10
	jz LB_15087
	cmp al,32
	jz LB_15087
LB_15089:
	push r10
	call NS_E_14103_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15090
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_15091
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_15091:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_15092
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_15092:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15093
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15093:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15094
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15094:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15095
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15095:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15096
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15096:
	jmp LB_15023
LB_15090:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_15036
	btr r12,6
	clc
	jmp LB_15037
LB_15036:
	bts r12,6
	stc
LB_15037:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_15034
	btr r12,5
	clc
	jmp LB_15035
LB_15034:
	bts r12,5
	stc
LB_15035:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15032
	btr r12,4
	clc
	jmp LB_15033
LB_15032:
	bts r12,4
	stc
LB_15033:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15030
	btr r12,3
	clc
	jmp LB_15031
LB_15030:
	bts r12,3
	stc
LB_15031:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15028
	btr r12,2
	clc
	jmp LB_15029
LB_15028:
	bts r12,2
	stc
LB_15029:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15026
	btr r12,1
	clc
	jmp LB_15027
LB_15026:
	bts r12,1
	stc
LB_15027:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15024
	btr r12,0
	clc
	jmp LB_15025
LB_15024:
	bts r12,0
	stc
LB_15025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_15020
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_15098
	btr r12,7
	jmp LB_15099
LB_15098:
	bts r12,7
LB_15099:
	mov r10,rcx
	bt r12,6
	jc LB_15100
	btr r12,4
	jmp LB_15101
LB_15100:
	bts r12,4
LB_15101:
	mov rcx,r9
	bt r12,3
	jc LB_15102
	btr r12,6
	jmp LB_15103
LB_15102:
	bts r12,6
LB_15103:
	mov r9,r11
	bt r12,5
	jc LB_15104
	btr r12,3
	jmp LB_15105
LB_15104:
	bts r12,3
LB_15105:
	mov r11,r8
	bt r12,2
	jc LB_15106
	btr r12,5
	jmp LB_15107
LB_15106:
	bts r12,5
LB_15107:
	mov r8,rcx
	bt r12,6
	jc LB_15108
	btr r12,2
	jmp LB_15109
LB_15108:
	bts r12,2
LB_15109:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_14201 %_14202 } %_14203 } ⊢ %_14204 : %_14204
 ; {>  %_14199~0':_stg %_14202~3':_p10225 %_14201~2':_stg %_14203~4':(_lst)◂({ _stg _p10225 }) %_14200~1':_p14100 }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f10246 %_14204 ⊢ %_14205 : %_14205
 ; {>  %_14199~0':_stg %_14204~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p10225 }) %_14200~1':_p14100 }
; _f10246 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_14199 %_14205 } ⊢ %_14206 : %_14206
 ; {>  %_14199~0':_stg %_14205~°0◂°0◂{ { 2' 3' } 4' }:_p10211 %_14200~1':_p14100 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_14206
 ; {>  %_14206~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p10211 }) %_14200~1':_p14100 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_14993
	mov rdi,r14
	call dlt
LB_14993:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_14994
	btr r12,1
	jmp LB_14995
LB_14994:
	bts r12,1
LB_14995:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_14998
	btr r12,5
	jmp LB_14999
LB_14998:
	bts r12,5
LB_14999:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_14996
	btr QWORD [rdi],0
	jmp LB_14997
LB_14996:
	bts QWORD [rdi],0
LB_14997:
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
	jc LB_15010
	btr r12,6
	jmp LB_15011
LB_15010:
	bts r12,6
LB_15011:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_15008
	btr QWORD [rdi],0
	jmp LB_15009
LB_15008:
	bts QWORD [rdi],0
LB_15009:
	mov rcx,r14
	bt r12,1
	jc LB_15014
	btr r12,6
	jmp LB_15015
LB_15014:
	bts r12,6
LB_15015:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_15012
	btr QWORD [rdi],1
	jmp LB_15013
LB_15012:
	bts QWORD [rdi],1
LB_15013:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_15006
	btr QWORD [rdi],0
	jmp LB_15007
LB_15006:
	bts QWORD [rdi],0
LB_15007:
	mov r13,r10
	bt r12,4
	jc LB_15018
	btr r12,0
	jmp LB_15019
LB_15018:
	bts r12,0
LB_15019:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_15016
	btr QWORD [rdi],1
	jmp LB_15017
LB_15016:
	bts QWORD [rdi],1
LB_15017:
	mov rsi,1
	bt r12,5
	jc LB_15004
	mov rsi,0
	bt r11,0
	jc LB_15004
	jmp LB_15005
LB_15004:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_15005:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_15002
	mov rsi,0
	bt r11,0
	jc LB_15002
	jmp LB_15003
LB_15002:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_15003:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_15000
	btr QWORD [rdi],1
	jmp LB_15001
LB_15000:
	bts QWORD [rdi],1
LB_15001:
	mov r8,0
	bts r12,2
	ret
LB_15020:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15022
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15021
LB_15022:
	add rsp,8
	ret
LB_15023:
	add rsp,112
	pop r14
LB_15021:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14101:
NS_E_RDI_14101:
NS_E_14101_ETR_TBL:
NS_E_14101_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_15124
LB_15123:
	add r14,1
LB_15124:
	cmp r14,r10
	jge LB_15125
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15123
	cmp al,10
	jz LB_15123
	cmp al,32
	jz LB_15123
LB_15125:
	add r14,3
	cmp r14,r10
	jg LB_15128
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15128
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_15128
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_15128
	jmp LB_15129
LB_15128:
	jmp LB_15110
LB_15129:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_15118
LB_15117:
	add r14,1
LB_15118:
	cmp r14,r10
	jge LB_15119
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15117
	cmp al,10
	jz LB_15117
	cmp al,32
	jz LB_15117
LB_15119:
	push r10
	call NS_E_13782_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15120
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15121
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15121:
	jmp LB_15111
LB_15120:
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
	jc LB_15114
	btr QWORD [rdi],1
LB_15114:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15115
	btr QWORD [rdi],0
LB_15115:
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
LB_15111:
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
LB_15110:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
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
LB_15112:
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
NS_E_14102:
NS_E_RDI_14102:
NS_E_14102_ETR_TBL:
NS_E_14102_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_15183
LB_15182:
	add r14,1
LB_15183:
	cmp r14,r10
	jge LB_15184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15182
	cmp al,10
	jz LB_15182
	cmp al,32
	jz LB_15182
LB_15184:
	add r14,1
	cmp r14,r10
	jg LB_15187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_15187
	jmp LB_15188
LB_15187:
	jmp LB_15149
LB_15188:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
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
	add r14,1
	cmp r14,r10
	jg LB_15165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_15165
	jmp LB_15166
LB_15165:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15163:
	jmp LB_15150
LB_15166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_15168
LB_15167:
	add r14,1
LB_15168:
	cmp r14,r10
	jge LB_15169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15167
	cmp al,10
	jz LB_15167
	cmp al,32
	jz LB_15167
LB_15169:
	push r10
	call NS_E_14099_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15170
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15171
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15171:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15172
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15172:
	jmp LB_15150
LB_15170:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_15175
LB_15174:
	add r14,1
LB_15175:
	cmp r14,r10
	jge LB_15176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15174
	cmp al,10
	jz LB_15174
	cmp al,32
	jz LB_15174
LB_15176:
	push r10
	call NS_E_14102_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15177
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15178
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15178:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15179
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15179:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15180
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15180:
	jmp LB_15150
LB_15177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15157
	btr r12,3
	clc
	jmp LB_15158
LB_15157:
	bts r12,3
	stc
LB_15158:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15155
	btr r12,2
	clc
	jmp LB_15156
LB_15155:
	bts r12,2
	stc
LB_15156:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15153
	btr r12,1
	clc
	jmp LB_15154
LB_15153:
	bts r12,1
	stc
LB_15154:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15151
	btr r12,0
	clc
	jmp LB_15152
LB_15151:
	bts r12,0
	stc
LB_15152:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15146
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_15189
	btr r12,4
	jmp LB_15190
LB_15189:
	bts r12,4
LB_15190:
	mov r8,r9
	bt r12,3
	jc LB_15191
	btr r12,2
	jmp LB_15192
LB_15191:
	bts r12,2
LB_15192:
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
	jc LB_15195
	btr r12,3
	clc
	jmp LB_15196
LB_15195:
	bts r12,3
	stc
LB_15196:
	mov r13,r9
	bt r12,3
	jc LB_15193
	btr r12,0
	jmp LB_15194
LB_15193:
	bts r12,0
LB_15194:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_15199
	btr r12,3
	clc
	jmp LB_15200
LB_15199:
	bts r12,3
	stc
LB_15200:
	mov r14,r9
	bt r12,3
	jc LB_15197
	btr r12,1
	jmp LB_15198
LB_15197:
	bts r12,1
LB_15198:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_14209 %_14210 } ⊢ %_14211 : %_14211
 ; {>  %_14210~2':(_lst)◂({ _stg _p10211 }) %_14209~{ 0' 1' }:{ _stg _p10211 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_14211 ⊢ %_14212 : %_14212
 ; {>  %_14211~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p10211 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_14212
 ; {>  %_14212~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p10211 })) }
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
	jc LB_15136
	btr r12,5
	jmp LB_15137
LB_15136:
	bts r12,5
LB_15137:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_15134
	btr QWORD [rdi],0
	jmp LB_15135
LB_15134:
	bts QWORD [rdi],0
LB_15135:
	mov r11,r14
	bt r12,1
	jc LB_15140
	btr r12,5
	jmp LB_15141
LB_15140:
	bts r12,5
LB_15141:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_15138
	btr QWORD [rdi],1
	jmp LB_15139
LB_15138:
	bts QWORD [rdi],1
LB_15139:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_15132
	btr QWORD [rdi],0
	jmp LB_15133
LB_15132:
	bts QWORD [rdi],0
LB_15133:
	mov r10,r8
	bt r12,2
	jc LB_15144
	btr r12,4
	jmp LB_15145
LB_15144:
	bts r12,4
LB_15145:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_15142
	btr QWORD [rdi],1
	jmp LB_15143
LB_15142:
	bts QWORD [rdi],1
LB_15143:
	mov rsi,1
	bt r12,3
	jc LB_15130
	mov rsi,0
	bt r9,0
	jc LB_15130
	jmp LB_15131
LB_15130:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15131:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
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
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_15203
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_14213 : %_14213
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_14213 ⊢ %_14214 : %_14214
 ; {>  %_14213~°1◂{  }:(_lst)◂(t5480'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14214
 ; {>  %_14214~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5483'(0))) }
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
	jc LB_15201
	mov rsi,0
	bt r9,0
	jc LB_15201
	jmp LB_15202
LB_15201:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15202:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15203:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15205
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15204
LB_15205:
	add rsp,8
	ret
LB_15206:
	add rsp,0
	pop r14
LB_15204:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14103:
NS_E_RDI_14103:
NS_E_14103_ETR_TBL:
NS_E_14103_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_15271
LB_15270:
	add r14,1
LB_15271:
	cmp r14,r10
	jge LB_15272
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15270
	cmp al,10
	jz LB_15270
	cmp al,32
	jz LB_15270
LB_15272:
	add r14,3
	cmp r14,r10
	jg LB_15275
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15275
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_15275
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_15275
	jmp LB_15276
LB_15275:
	jmp LB_15226
LB_15276:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_15239
LB_15238:
	add r14,1
LB_15239:
	cmp r14,r10
	jge LB_15240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15238
	cmp al,10
	jz LB_15238
	cmp al,32
	jz LB_15238
LB_15240:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15241
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15242:
	jmp LB_15227
LB_15241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_15245
LB_15244:
	add r14,1
LB_15245:
	cmp r14,r10
	jge LB_15246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15244
	cmp al,10
	jz LB_15244
	cmp al,32
	jz LB_15244
LB_15246:
	add r14,1
	cmp r14,r10
	jg LB_15251
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_15251
	jmp LB_15252
LB_15251:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15248
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15248:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15249
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15249:
	jmp LB_15227
LB_15252:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_15254
LB_15253:
	add r14,1
LB_15254:
	cmp r14,r10
	jge LB_15255
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15253
	cmp al,10
	jz LB_15253
	cmp al,32
	jz LB_15253
LB_15255:
	push r10
	call NS_E_13778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15256
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15257
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15257:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15258
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15258:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15259:
	jmp LB_15227
LB_15256:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_15262
LB_15261:
	add r14,1
LB_15262:
	cmp r14,r10
	jge LB_15263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15261
	cmp al,10
	jz LB_15261
	cmp al,32
	jz LB_15261
LB_15263:
	push r10
	call NS_E_14103_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15264
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15265
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15265:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15266
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15266:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15267
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15267:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15268
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15268:
	jmp LB_15227
LB_15264:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15236
	btr r12,4
	clc
	jmp LB_15237
LB_15236:
	bts r12,4
	stc
LB_15237:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15234
	btr r12,3
	clc
	jmp LB_15235
LB_15234:
	bts r12,3
	stc
LB_15235:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15232
	btr r12,2
	clc
	jmp LB_15233
LB_15232:
	bts r12,2
	stc
LB_15233:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15230
	btr r12,1
	clc
	jmp LB_15231
LB_15230:
	bts r12,1
	stc
LB_15231:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15228
	btr r12,0
	clc
	jmp LB_15229
LB_15228:
	bts r12,0
	stc
LB_15229:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_15223
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_15277
	btr r12,5
	jmp LB_15278
LB_15277:
	bts r12,5
LB_15278:
	mov r8,r10
	bt r12,4
	jc LB_15279
	btr r12,2
	jmp LB_15280
LB_15279:
	bts r12,2
LB_15280:
	mov r10,r14
	bt r12,1
	jc LB_15281
	btr r12,4
	jmp LB_15282
LB_15281:
	bts r12,4
LB_15282:
	mov r14,r9
	bt r12,3
	jc LB_15283
	btr r12,1
	jmp LB_15284
LB_15283:
	bts r12,1
LB_15284:
	mov r9,r13
	bt r12,0
	jc LB_15285
	btr r12,3
	jmp LB_15286
LB_15285:
	bts r12,3
LB_15286:
	mov r13,r10
	bt r12,4
	jc LB_15287
	btr r12,0
	jmp LB_15288
LB_15287:
	bts r12,0
LB_15288:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_14215 %_14216 } %_14217 } ⊢ %_14218 : %_14218
 ; {>  %_14215~0':_stg %_14217~2':(_lst)◂({ _stg _p10225 }) %_14216~1':_p10225 }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_14218 ⊢ %_14219 : %_14219
 ; {>  %_14218~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p10225 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_14219
 ; {>  %_14219~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p10225 })) }
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
	jc LB_15213
	btr r12,5
	jmp LB_15214
LB_15213:
	bts r12,5
LB_15214:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_15211
	btr QWORD [rdi],0
	jmp LB_15212
LB_15211:
	bts QWORD [rdi],0
LB_15212:
	mov r11,r14
	bt r12,1
	jc LB_15217
	btr r12,5
	jmp LB_15218
LB_15217:
	bts r12,5
LB_15218:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_15215
	btr QWORD [rdi],1
	jmp LB_15216
LB_15215:
	bts QWORD [rdi],1
LB_15216:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_15209
	btr QWORD [rdi],0
	jmp LB_15210
LB_15209:
	bts QWORD [rdi],0
LB_15210:
	mov r10,r8
	bt r12,2
	jc LB_15221
	btr r12,4
	jmp LB_15222
LB_15221:
	bts r12,4
LB_15222:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_15219
	btr QWORD [rdi],1
	jmp LB_15220
LB_15219:
	bts QWORD [rdi],1
LB_15220:
	mov rsi,1
	bt r12,3
	jc LB_15207
	mov rsi,0
	bt r9,0
	jc LB_15207
	jmp LB_15208
LB_15207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15208:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15223:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15225
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15224
LB_15225:
	add rsp,8
	ret
LB_15227:
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
LB_15226:
	add rsp,80
	pop r14
LB_15224:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_15291
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_14220 : %_14220
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_14220 ⊢ %_14221 : %_14221
 ; {>  %_14220~°1◂{  }:(_lst)◂(t5494'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14221
 ; {>  %_14221~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5497'(0))) }
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
	jc LB_15289
	mov rsi,0
	bt r9,0
	jc LB_15289
	jmp LB_15290
LB_15289:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15290:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15291:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15293
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15292
LB_15293:
	add rsp,8
	ret
LB_15294:
	add rsp,0
	pop r14
LB_15292:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14104:
NS_E_RDI_14104:
NS_E_14104_ETR_TBL:
NS_E_14104_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_15385
LB_15384:
	add r14,1
LB_15385:
	cmp r14,r10
	jge LB_15386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15384
	cmp al,10
	jz LB_15384
	cmp al,32
	jz LB_15384
LB_15386:
	add r14,1
	cmp r14,r10
	jg LB_15389
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_15389
	jmp LB_15390
LB_15389:
	jmp LB_15332
LB_15390:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_15347
LB_15346:
	add r14,1
LB_15347:
	cmp r14,r10
	jge LB_15348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15346
	cmp al,10
	jz LB_15346
	cmp al,32
	jz LB_15346
LB_15348:
	add r14,1
	cmp r14,r10
	jg LB_15352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_15352
	jmp LB_15353
LB_15352:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15350
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15350:
	jmp LB_15333
LB_15353:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_15355
LB_15354:
	add r14,1
LB_15355:
	cmp r14,r10
	jge LB_15356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15354
	cmp al,10
	jz LB_15354
	cmp al,32
	jz LB_15354
LB_15356:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15357
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15358
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15358:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15359
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15359:
	jmp LB_15333
LB_15357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_15362
LB_15361:
	add r14,1
LB_15362:
	cmp r14,r10
	jge LB_15363
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15361
	cmp al,10
	jz LB_15361
	cmp al,32
	jz LB_15361
LB_15363:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15364
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15365
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15365:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15366
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15366:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15367
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15367:
	jmp LB_15333
LB_15364:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_15370
LB_15369:
	add r14,1
LB_15370:
	cmp r14,r10
	jge LB_15371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15369
	cmp al,10
	jz LB_15369
	cmp al,32
	jz LB_15369
LB_15371:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15372
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15373
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15373:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15374
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15374:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15375
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15375:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15376
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15376:
	jmp LB_15333
LB_15372:
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
LB_15382:
	jmp LB_15379
LB_15378:
	add r14,1
LB_15379:
	cmp r14,r10
	jge LB_15380
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15378
	cmp al,10
	jz LB_15378
	cmp al,32
	jz LB_15378
LB_15380:
	push r10
	push rsi
	call NS_E_14105_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_15381
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_15383
	bts QWORD [rax],0
LB_15383:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_15382
LB_15381:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_15344
	btr r12,5
	clc
	jmp LB_15345
LB_15344:
	bts r12,5
	stc
LB_15345:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15342
	btr r12,4
	clc
	jmp LB_15343
LB_15342:
	bts r12,4
	stc
LB_15343:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15340
	btr r12,3
	clc
	jmp LB_15341
LB_15340:
	bts r12,3
	stc
LB_15341:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15338
	btr r12,2
	clc
	jmp LB_15339
LB_15338:
	bts r12,2
	stc
LB_15339:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15336
	btr r12,1
	clc
	jmp LB_15337
LB_15336:
	bts r12,1
	stc
LB_15337:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15334
	btr r12,0
	clc
	jmp LB_15335
LB_15334:
	bts r12,0
	stc
LB_15335:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_15329
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_15391
	btr r12,6
	jmp LB_15392
LB_15391:
	bts r12,6
LB_15392:
	mov r9,r11
	bt r12,5
	jc LB_15393
	btr r12,3
	jmp LB_15394
LB_15393:
	bts r12,3
LB_15394:
	mov r11,r8
	bt r12,2
	jc LB_15395
	btr r12,5
	jmp LB_15396
LB_15395:
	bts r12,5
LB_15396:
	mov r8,r10
	bt r12,4
	jc LB_15397
	btr r12,2
	jmp LB_15398
LB_15397:
	bts r12,2
LB_15398:
	mov r10,r14
	bt r12,1
	jc LB_15399
	btr r12,4
	jmp LB_15400
LB_15399:
	bts r12,4
LB_15400:
	mov r14,rcx
	bt r12,6
	jc LB_15401
	btr r12,1
	jmp LB_15402
LB_15401:
	bts r12,1
LB_15402:
	mov rcx,r13
	bt r12,0
	jc LB_15403
	btr r12,6
	jmp LB_15404
LB_15403:
	bts r12,6
LB_15404:
	mov r13,r11
	bt r12,5
	jc LB_15405
	btr r12,0
	jmp LB_15406
LB_15405:
	bts r12,0
LB_15406:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9394 %_14225 ⊢ %_14226 : %_14226
 ; {>  %_14225~3':(_lst)◂({ _stg _p10224 _p10227 }) %_14222~0':_stg %_14223~1':_p10224 %_14224~2':_p10227 }
; _f9394 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_15301
	btr r12,0
	jmp LB_15302
LB_15301:
	bts r12,0
LB_15302:
	call NS_E_9394
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_15303
	btr r12,3
	jmp LB_15304
LB_15303:
	bts r12,3
LB_15304:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_15299
	btr r12,2
	clc
	jmp LB_15300
LB_15299:
	bts r12,2
	stc
LB_15300:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_15297
	btr r12,1
	clc
	jmp LB_15298
LB_15297:
	bts r12,1
	stc
LB_15298:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_15295
	btr r12,0
	clc
	jmp LB_15296
LB_15295:
	bts r12,0
	stc
LB_15296:
	add rsp,32
; _cns { { %_14222 %_14223 %_14224 } %_14226 } ⊢ %_14227 : %_14227
 ; {>  %_14222~0':_stg %_14226~3':(_lst)◂({ _stg _p10224 _p10227 }) %_14223~1':_p10224 %_14224~2':_p10227 }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f10238 %_14227 ⊢ %_14228 : %_14228
 ; {>  %_14227~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg _p10224 _p10227 }) }
; _f10238 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_14228 ⊢ %_14229 : %_14229
 ; {>  %_14228~°3◂°0◂{ { 0' 1' 2' } 3' }:_p10208 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_14229
 ; {>  %_14229~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p10208) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_15305
	btr r12,4
	jmp LB_15306
LB_15305:
	bts r12,4
LB_15306:
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
	jc LB_15315
	btr r12,6
	jmp LB_15316
LB_15315:
	bts r12,6
LB_15316:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_15313
	btr QWORD [rdi],0
	jmp LB_15314
LB_15313:
	bts QWORD [rdi],0
LB_15314:
	mov rcx,r14
	bt r12,1
	jc LB_15319
	btr r12,6
	jmp LB_15320
LB_15319:
	bts r12,6
LB_15320:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_15317
	btr QWORD [rdi],1
	jmp LB_15318
LB_15317:
	bts QWORD [rdi],1
LB_15318:
	mov rcx,r8
	bt r12,2
	jc LB_15323
	btr r12,6
	jmp LB_15324
LB_15323:
	bts r12,6
LB_15324:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_15321
	btr QWORD [rdi],2
	jmp LB_15322
LB_15321:
	bts QWORD [rdi],2
LB_15322:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_15311
	btr QWORD [rdi],0
	jmp LB_15312
LB_15311:
	bts QWORD [rdi],0
LB_15312:
	mov r11,r10
	bt r12,4
	jc LB_15327
	btr r12,5
	jmp LB_15328
LB_15327:
	bts r12,5
LB_15328:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_15325
	btr QWORD [rdi],1
	jmp LB_15326
LB_15325:
	bts QWORD [rdi],1
LB_15326:
	mov rsi,1
	bt r12,3
	jc LB_15309
	mov rsi,0
	bt r9,0
	jc LB_15309
	jmp LB_15310
LB_15309:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15310:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_15307
	mov rsi,0
	bt r9,0
	jc LB_15307
	jmp LB_15308
LB_15307:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15308:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15329:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15331
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15330
LB_15331:
	add rsp,8
	ret
LB_15333:
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
LB_15332:
	add rsp,96
	pop r14
LB_15330:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_15426
LB_15425:
	add r14,1
LB_15426:
	cmp r14,r10
	jge LB_15427
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15425
	cmp al,10
	jz LB_15425
	cmp al,32
	jz LB_15425
LB_15427:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15428
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15420
LB_15428:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_15431
LB_15430:
	add r14,1
LB_15431:
	cmp r14,r10
	jge LB_15432
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15430
	cmp al,10
	jz LB_15430
	cmp al,32
	jz LB_15430
LB_15432:
	push r10
	call NS_E_14106_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15433
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15434
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15434:
	jmp LB_15420
LB_15433:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15423
	btr r12,1
	clc
	jmp LB_15424
LB_15423:
	bts r12,1
	stc
LB_15424:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15421
	btr r12,0
	clc
	jmp LB_15422
LB_15421:
	bts r12,0
	stc
LB_15422:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15417
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10237 { %_14230 %_14231 } ⊢ %_14232 : %_14232
 ; {>  %_14230~0':_stg %_14231~1':_p10210 }
; _f10237 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_14232 ⊢ %_14233 : %_14233
 ; {>  %_14232~°2◂{ 0' 1' }:_p10208 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_14233
 ; {>  %_14233~°0◂°2◂{ 0' 1' }:(_opn)◂(_p10208) }
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
	jc LB_15411
	btr r12,2
	jmp LB_15412
LB_15411:
	bts r12,2
LB_15412:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_15409
	btr QWORD [rdi],0
	jmp LB_15410
LB_15409:
	bts QWORD [rdi],0
LB_15410:
	mov r8,r14
	bt r12,1
	jc LB_15415
	btr r12,2
	jmp LB_15416
LB_15415:
	bts r12,2
LB_15416:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_15413
	btr QWORD [rdi],1
	jmp LB_15414
LB_15413:
	bts QWORD [rdi],1
LB_15414:
	mov rsi,1
	bt r12,3
	jc LB_15407
	mov rsi,0
	bt r9,0
	jc LB_15407
	jmp LB_15408
LB_15407:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15408:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15417:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15419
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15418
LB_15419:
	add rsp,8
	ret
LB_15420:
	add rsp,32
	pop r14
LB_15418:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_15437
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_14234
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_14234 ⊢ %_14235 : %_14235
 ; {>  %_14234~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_14236 : %_14236
 ; {>  %_14235~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_14236
 ; {>  %_14236~°1◂{  }:(_opn)◂(t5520'(0)) %_14235~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_15436
	mov rdi,r13
	call dlt
LB_15436:
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
LB_15437:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15439
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15438
LB_15439:
	add rsp,8
	ret
LB_15440:
	add rsp,0
	pop r14
LB_15438:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14105:
NS_E_RDI_14105:
NS_E_14105_ETR_TBL:
NS_E_14105_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_15468
LB_15467:
	add r14,1
LB_15468:
	cmp r14,r10
	jge LB_15469
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15467
	cmp al,10
	jz LB_15467
	cmp al,32
	jz LB_15467
LB_15469:
	add r14,1
	cmp r14,r10
	jg LB_15472
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_15472
	jmp LB_15473
LB_15472:
	jmp LB_15456
LB_15473:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_15475
LB_15474:
	add r14,1
LB_15475:
	cmp r14,r10
	jge LB_15476
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15474
	cmp al,10
	jz LB_15474
	cmp al,32
	jz LB_15474
LB_15476:
	add r14,1
	cmp r14,r10
	jg LB_15480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_15480
	jmp LB_15481
LB_15480:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15478
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15478:
	jmp LB_15456
LB_15481:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_15483
LB_15482:
	add r14,1
LB_15483:
	cmp r14,r10
	jge LB_15484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15482
	cmp al,10
	jz LB_15482
	cmp al,32
	jz LB_15482
LB_15484:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15485
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15486
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15486:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15487
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15487:
	jmp LB_15456
LB_15485:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
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
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15492
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15493
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15493:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15494
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15494:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15495
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15495:
	jmp LB_15456
LB_15492:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_15498
LB_15497:
	add r14,1
LB_15498:
	cmp r14,r10
	jge LB_15499
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15497
	cmp al,10
	jz LB_15497
	cmp al,32
	jz LB_15497
LB_15499:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15500
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15501
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15501:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15502
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15502:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15503
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15503:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15504
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15504:
	jmp LB_15456
LB_15500:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15465
	btr r12,4
	clc
	jmp LB_15466
LB_15465:
	bts r12,4
	stc
LB_15466:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15463
	btr r12,3
	clc
	jmp LB_15464
LB_15463:
	bts r12,3
	stc
LB_15464:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15461
	btr r12,2
	clc
	jmp LB_15462
LB_15461:
	bts r12,2
	stc
LB_15462:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15459
	btr r12,1
	clc
	jmp LB_15460
LB_15459:
	bts r12,1
	stc
LB_15460:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15457
	btr r12,0
	clc
	jmp LB_15458
LB_15457:
	bts r12,0
	stc
LB_15458:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_15453
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_15506
	btr r12,5
	jmp LB_15507
LB_15506:
	bts r12,5
LB_15507:
	mov r8,r10
	bt r12,4
	jc LB_15508
	btr r12,2
	jmp LB_15509
LB_15508:
	bts r12,2
LB_15509:
	mov r10,r14
	bt r12,1
	jc LB_15510
	btr r12,4
	jmp LB_15511
LB_15510:
	bts r12,4
LB_15511:
	mov r14,r9
	bt r12,3
	jc LB_15512
	btr r12,1
	jmp LB_15513
LB_15512:
	bts r12,1
LB_15513:
	mov r9,r13
	bt r12,0
	jc LB_15514
	btr r12,3
	jmp LB_15515
LB_15514:
	bts r12,3
LB_15515:
	mov r13,r11
	bt r12,5
	jc LB_15516
	btr r12,0
	jmp LB_15517
LB_15516:
	bts r12,0
LB_15517:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_14237 %_14238 %_14239 } ⊢ %_14240 : %_14240
 ; {>  %_14237~0':_stg %_14238~1':_p10224 %_14239~2':_p10227 }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_14240
 ; {>  %_14240~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg _p10224 _p10227 }) }
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
	jc LB_15443
	btr r12,4
	jmp LB_15444
LB_15443:
	bts r12,4
LB_15444:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_15441
	btr QWORD [rdi],0
	jmp LB_15442
LB_15441:
	bts QWORD [rdi],0
LB_15442:
	mov r10,r14
	bt r12,1
	jc LB_15447
	btr r12,4
	jmp LB_15448
LB_15447:
	bts r12,4
LB_15448:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_15445
	btr QWORD [rdi],1
	jmp LB_15446
LB_15445:
	bts QWORD [rdi],1
LB_15446:
	mov r10,r8
	bt r12,2
	jc LB_15451
	btr r12,4
	jmp LB_15452
LB_15451:
	bts r12,4
LB_15452:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_15449
	btr QWORD [rdi],2
	jmp LB_15450
LB_15449:
	bts QWORD [rdi],2
LB_15450:
	mov r8,0
	bts r12,2
	ret
LB_15453:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15455
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15454
LB_15455:
	add rsp,8
	ret
LB_15456:
	add rsp,80
	pop r14
LB_15454:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14106:
NS_E_RDI_14106:
NS_E_14106_ETR_TBL:
NS_E_14106_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_15538
LB_15537:
	add r14,1
LB_15538:
	cmp r14,r10
	jge LB_15539
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15537
	cmp al,10
	jz LB_15537
	cmp al,32
	jz LB_15537
LB_15539:
	add r14,1
	cmp r14,r10
	jg LB_15542
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_15542
	jmp LB_15543
LB_15542:
	jmp LB_15525
LB_15543:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_15532
LB_15531:
	add r14,1
LB_15532:
	cmp r14,r10
	jge LB_15533
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15531
	cmp al,10
	jz LB_15531
	cmp al,32
	jz LB_15531
LB_15533:
	push r10
	call NS_E_13115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15534
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15535
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15535:
	jmp LB_15526
LB_15534:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15529
	btr r12,1
	clc
	jmp LB_15530
LB_15529:
	bts r12,1
	stc
LB_15530:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15527
	btr r12,0
	clc
	jmp LB_15528
LB_15527:
	bts r12,0
	stc
LB_15528:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15522
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_15544
	btr r12,2
	jmp LB_15545
LB_15544:
	bts r12,2
LB_15545:
	mov r13,r14
	bt r12,1
	jc LB_15546
	btr r12,0
	jmp LB_15547
LB_15546:
	bts r12,0
LB_15547:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10244 %_14241 ⊢ %_14242 : %_14242
 ; {>  %_14241~0':_p10226 }
; _f10244 0' ⊢ °1◂0'
; _some %_14242 ⊢ %_14243 : %_14243
 ; {>  %_14242~°1◂0':_p10210 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14243
 ; {>  %_14243~°0◂°1◂0':(_opn)◂(_p10210) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15520
	btr r12,3
	jmp LB_15521
LB_15520:
	bts r12,3
LB_15521:
	mov rsi,1
	bt r12,3
	jc LB_15518
	mov rsi,0
	bt r9,0
	jc LB_15518
	jmp LB_15519
LB_15518:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15519:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15522:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15524
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15523
LB_15524:
	add rsp,8
	ret
LB_15526:
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
LB_15525:
	add rsp,32
	pop r14
LB_15523:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_15568
LB_15567:
	add r14,1
LB_15568:
	cmp r14,r10
	jge LB_15569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15567
	cmp al,10
	jz LB_15567
	cmp al,32
	jz LB_15567
LB_15569:
	add r14,2
	cmp r14,r10
	jg LB_15572
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_15572
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_15572
	jmp LB_15573
LB_15572:
	jmp LB_15555
LB_15573:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_15562
LB_15561:
	add r14,1
LB_15562:
	cmp r14,r10
	jge LB_15563
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15561
	cmp al,10
	jz LB_15561
	cmp al,32
	jz LB_15561
LB_15563:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15564
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15565
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15565:
	jmp LB_15556
LB_15564:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15559
	btr r12,1
	clc
	jmp LB_15560
LB_15559:
	bts r12,1
	stc
LB_15560:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15557
	btr r12,0
	clc
	jmp LB_15558
LB_15557:
	bts r12,0
	stc
LB_15558:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15552
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_15574
	btr r12,2
	jmp LB_15575
LB_15574:
	bts r12,2
LB_15575:
	mov r13,r14
	bt r12,1
	jc LB_15576
	btr r12,0
	jmp LB_15577
LB_15576:
	bts r12,0
LB_15577:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10245 %_14244 ⊢ %_14245 : %_14245
 ; {>  %_14244~0':_p10227 }
; _f10245 0' ⊢ °2◂0'
; _some %_14245 ⊢ %_14246 : %_14246
 ; {>  %_14245~°2◂0':_p10210 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_14246
 ; {>  %_14246~°0◂°2◂0':(_opn)◂(_p10210) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15550
	btr r12,3
	jmp LB_15551
LB_15550:
	bts r12,3
LB_15551:
	mov rsi,1
	bt r12,3
	jc LB_15548
	mov rsi,0
	bt r9,0
	jc LB_15548
	jmp LB_15549
LB_15548:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15549:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15552:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15554
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15553
LB_15554:
	add rsp,8
	ret
LB_15556:
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
LB_15555:
	add rsp,32
	pop r14
LB_15553:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_15597
LB_15596:
	add r14,1
LB_15597:
	cmp r14,r10
	jge LB_15598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15596
	cmp al,10
	jz LB_15596
	cmp al,32
	jz LB_15596
LB_15598:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15599
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15591
LB_15599:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_15602
LB_15601:
	add r14,1
LB_15602:
	cmp r14,r10
	jge LB_15603
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15601
	cmp al,10
	jz LB_15601
	cmp al,32
	jz LB_15601
LB_15603:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15604
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15605
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15605:
	jmp LB_15591
LB_15604:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15594
	btr r12,1
	clc
	jmp LB_15595
LB_15594:
	bts r12,1
	stc
LB_15595:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15592
	btr r12,0
	clc
	jmp LB_15593
LB_15592:
	bts r12,0
	stc
LB_15593:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15588
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10243 { %_14247 %_14248 } ⊢ %_14249 : %_14249
 ; {>  %_14247~0':_p10224 %_14248~1':_p10227 }
; _f10243 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14249 ⊢ %_14250 : %_14250
 ; {>  %_14249~°0◂{ 0' 1' }:_p10210 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14250
 ; {>  %_14250~°0◂°0◂{ 0' 1' }:(_opn)◂(_p10210) }
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
	jc LB_15582
	btr r12,2
	jmp LB_15583
LB_15582:
	bts r12,2
LB_15583:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_15580
	btr QWORD [rdi],0
	jmp LB_15581
LB_15580:
	bts QWORD [rdi],0
LB_15581:
	mov r8,r14
	bt r12,1
	jc LB_15586
	btr r12,2
	jmp LB_15587
LB_15586:
	bts r12,2
LB_15587:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_15584
	btr QWORD [rdi],1
	jmp LB_15585
LB_15584:
	bts QWORD [rdi],1
LB_15585:
	mov rsi,1
	bt r12,3
	jc LB_15578
	mov rsi,0
	bt r9,0
	jc LB_15578
	jmp LB_15579
LB_15578:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15579:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15588:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15590
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15589
LB_15590:
	add rsp,8
	ret
LB_15591:
	add rsp,32
	pop r14
LB_15589:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14107:
NS_E_RDI_14107:
NS_E_14107_ETR_TBL:
NS_E_14107_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_15627
LB_15626:
	add r14,1
LB_15627:
	cmp r14,r10
	jge LB_15628
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15626
	cmp al,10
	jz LB_15626
	cmp al,32
	jz LB_15626
LB_15628:
	add r14,3
	cmp r14,r10
	jg LB_15631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_15631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_15631
	jmp LB_15632
LB_15631:
	jmp LB_15614
LB_15632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_15621
LB_15620:
	add r14,1
LB_15621:
	cmp r14,r10
	jge LB_15622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15620
	cmp al,10
	jz LB_15620
	cmp al,32
	jz LB_15620
LB_15622:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15623
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15624
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15624:
	jmp LB_15615
LB_15623:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15618
	btr r12,1
	clc
	jmp LB_15619
LB_15618:
	bts r12,1
	stc
LB_15619:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15616
	btr r12,0
	clc
	jmp LB_15617
LB_15616:
	bts r12,0
	stc
LB_15617:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15611
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_15633
	btr r12,2
	jmp LB_15634
LB_15633:
	bts r12,2
LB_15634:
	mov r13,r14
	bt r12,1
	jc LB_15635
	btr r12,0
	jmp LB_15636
LB_15635:
	bts r12,0
LB_15636:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10286 %_14251 ⊢ %_14252 : %_14252
 ; {>  %_14251~0':_p10223 }
; _f10286 0' ⊢ °2◂0'
; _some %_14252 ⊢ %_14253 : %_14253
 ; {>  %_14252~°2◂0':_p10227 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_14253
 ; {>  %_14253~°0◂°2◂0':(_opn)◂(_p10227) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15609
	btr r12,3
	jmp LB_15610
LB_15609:
	bts r12,3
LB_15610:
	mov rsi,1
	bt r12,3
	jc LB_15607
	mov rsi,0
	bt r9,0
	jc LB_15607
	jmp LB_15608
LB_15607:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15608:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15611:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15613
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15612
LB_15613:
	add rsp,8
	ret
LB_15615:
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
LB_15614:
	add rsp,32
	pop r14
LB_15612:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_15648
LB_15647:
	add r14,1
LB_15648:
	cmp r14,r10
	jge LB_15649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15647
	cmp al,10
	jz LB_15647
	cmp al,32
	jz LB_15647
LB_15649:
	push r10
	call NS_E_14116_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15650
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15644
LB_15650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15645
	btr r12,0
	clc
	jmp LB_15646
LB_15645:
	bts r12,0
	stc
LB_15646:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15641
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10285 %_14254 ⊢ %_14255 : %_14255
 ; {>  %_14254~0':_p10228 }
; _f10285 0' ⊢ °1◂0'
; _some %_14255 ⊢ %_14256 : %_14256
 ; {>  %_14255~°1◂0':_p10227 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14256
 ; {>  %_14256~°0◂°1◂0':(_opn)◂(_p10227) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15639
	btr r12,3
	jmp LB_15640
LB_15639:
	bts r12,3
LB_15640:
	mov rsi,1
	bt r12,3
	jc LB_15637
	mov rsi,0
	bt r9,0
	jc LB_15637
	jmp LB_15638
LB_15637:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15638:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15641:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15643
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15642
LB_15643:
	add rsp,8
	ret
LB_15644:
	add rsp,16
	pop r14
LB_15642:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_15683
LB_15682:
	add r14,1
LB_15683:
	cmp r14,r10
	jge LB_15684
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15682
	cmp al,10
	jz LB_15682
	cmp al,32
	jz LB_15682
LB_15684:
	push r10
	call NS_E_14108_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15685
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15677
LB_15685:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_15688
LB_15687:
	add r14,1
LB_15688:
	cmp r14,r10
	jge LB_15689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15687
	cmp al,10
	jz LB_15687
	cmp al,32
	jz LB_15687
LB_15689:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15690
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15691
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15691:
	jmp LB_15677
LB_15690:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15680
	btr r12,1
	clc
	jmp LB_15681
LB_15680:
	bts r12,1
	stc
LB_15681:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15678
	btr r12,0
	clc
	jmp LB_15679
LB_15678:
	bts r12,0
	stc
LB_15679:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15674
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_15693
	btr r12,3
	jmp LB_15694
LB_15693:
	bts r12,3
LB_15694:
	mov r10,r13
	bt r12,0
	jc LB_15695
	btr r12,4
	jmp LB_15696
LB_15695:
	bts r12,4
LB_15696:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_15699
	btr r12,5
	clc
	jmp LB_15700
LB_15699:
	bts r12,5
	stc
LB_15700:
	mov r13,r11
	bt r12,5
	jc LB_15697
	btr r12,0
	jmp LB_15698
LB_15697:
	bts r12,0
LB_15698:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_15703
	btr r12,5
	clc
	jmp LB_15704
LB_15703:
	bts r12,5
	stc
LB_15704:
	mov r14,r11
	bt r12,5
	jc LB_15701
	btr r12,1
	jmp LB_15702
LB_15701:
	bts r12,1
LB_15702:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_15707
	btr r12,5
	clc
	jmp LB_15708
LB_15707:
	bts r12,5
	stc
LB_15708:
	mov r8,r11
	bt r12,5
	jc LB_15705
	btr r12,2
	jmp LB_15706
LB_15705:
	bts r12,2
LB_15706:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10284 { %_14257 %_14258 } ⊢ %_14259 : %_14259
 ; {>  %_14257~{ 0' 1' 2' }:{ _p10232 _p10223 _p10224 } %_14258~3':_p10227 }
; _f10284 { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _some %_14259 ⊢ %_14260 : %_14260
 ; {>  %_14259~°0◂{ { 0' 1' 2' } 3' }:_p10227 }
; _some °0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_14260
 ; {>  %_14260~°0◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p10227) }
; 	∎ °0◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_15652
	btr r12,4
	jmp LB_15653
LB_15652:
	bts r12,4
LB_15653:
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
	jc LB_15660
	btr r12,6
	jmp LB_15661
LB_15660:
	bts r12,6
LB_15661:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_15658
	btr QWORD [rdi],0
	jmp LB_15659
LB_15658:
	bts QWORD [rdi],0
LB_15659:
	mov rcx,r14
	bt r12,1
	jc LB_15664
	btr r12,6
	jmp LB_15665
LB_15664:
	bts r12,6
LB_15665:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_15662
	btr QWORD [rdi],1
	jmp LB_15663
LB_15662:
	bts QWORD [rdi],1
LB_15663:
	mov rcx,r8
	bt r12,2
	jc LB_15668
	btr r12,6
	jmp LB_15669
LB_15668:
	bts r12,6
LB_15669:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_15666
	btr QWORD [rdi],2
	jmp LB_15667
LB_15666:
	bts QWORD [rdi],2
LB_15667:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_15656
	btr QWORD [rdi],0
	jmp LB_15657
LB_15656:
	bts QWORD [rdi],0
LB_15657:
	mov r11,r10
	bt r12,4
	jc LB_15672
	btr r12,5
	jmp LB_15673
LB_15672:
	bts r12,5
LB_15673:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_15670
	btr QWORD [rdi],1
	jmp LB_15671
LB_15670:
	bts QWORD [rdi],1
LB_15671:
	mov rsi,1
	bt r12,3
	jc LB_15654
	mov rsi,0
	bt r9,0
	jc LB_15654
	jmp LB_15655
LB_15654:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15655:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15674:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15676
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15675
LB_15676:
	add rsp,8
	ret
LB_15677:
	add rsp,32
	pop r14
LB_15675:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14108:
NS_E_RDI_14108:
NS_E_14108_ETR_TBL:
NS_E_14108_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_15774
LB_15773:
	add r14,1
LB_15774:
	cmp r14,r10
	jge LB_15775
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15773
	cmp al,10
	jz LB_15773
	cmp al,32
	jz LB_15773
LB_15775:
	add r14,1
	cmp r14,r10
	jg LB_15778
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_15778
	jmp LB_15779
LB_15778:
	jmp LB_15729
LB_15779:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_15742
LB_15741:
	add r14,1
LB_15742:
	cmp r14,r10
	jge LB_15743
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15741
	cmp al,10
	jz LB_15741
	cmp al,32
	jz LB_15741
LB_15743:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15744
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15745
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15745:
	jmp LB_15730
LB_15744:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_15748
LB_15747:
	add r14,1
LB_15748:
	cmp r14,r10
	jge LB_15749
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15747
	cmp al,10
	jz LB_15747
	cmp al,32
	jz LB_15747
LB_15749:
	add r14,3
	cmp r14,r10
	jg LB_15754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15754
	jmp LB_15755
LB_15754:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15751
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15751:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15752
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15752:
	jmp LB_15730
LB_15755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_15757
LB_15756:
	add r14,1
LB_15757:
	cmp r14,r10
	jge LB_15758
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15756
	cmp al,10
	jz LB_15756
	cmp al,32
	jz LB_15756
LB_15758:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15759
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15760
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15760:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15761
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15761:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15762
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15762:
	jmp LB_15730
LB_15759:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
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
	call NS_E_13511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15767
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15768
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15768:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15769
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15769:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15770
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15770:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15771
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15771:
	jmp LB_15730
LB_15767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15739
	btr r12,4
	clc
	jmp LB_15740
LB_15739:
	bts r12,4
	stc
LB_15740:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15737
	btr r12,3
	clc
	jmp LB_15738
LB_15737:
	bts r12,3
	stc
LB_15738:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15735
	btr r12,2
	clc
	jmp LB_15736
LB_15735:
	bts r12,2
	stc
LB_15736:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15733
	btr r12,1
	clc
	jmp LB_15734
LB_15733:
	bts r12,1
	stc
LB_15734:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15731
	btr r12,0
	clc
	jmp LB_15732
LB_15731:
	bts r12,0
	stc
LB_15732:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_15726
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_15780
	btr r12,5
	jmp LB_15781
LB_15780:
	bts r12,5
LB_15781:
	mov r8,r10
	bt r12,4
	jc LB_15782
	btr r12,2
	jmp LB_15783
LB_15782:
	bts r12,2
LB_15783:
	mov r10,r14
	bt r12,1
	jc LB_15784
	btr r12,4
	jmp LB_15785
LB_15784:
	bts r12,4
LB_15785:
	mov r14,r9
	bt r12,3
	jc LB_15786
	btr r12,1
	jmp LB_15787
LB_15786:
	bts r12,1
LB_15787:
	mov r9,r13
	bt r12,0
	jc LB_15788
	btr r12,3
	jmp LB_15789
LB_15788:
	bts r12,3
LB_15789:
	mov r13,r10
	bt r12,4
	jc LB_15790
	btr r12,0
	jmp LB_15791
LB_15790:
	bts r12,0
LB_15791:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_14264 : %_14264
 ; {>  %_14263~2':_p13510 %_14262~1':_p10224 %_14261~0':_p10223 }
; 	» 0xr1 _ ⊢ 3' : %_14264
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f10296 %_14264 ⊢ %_14265 : %_14265
 ; {>  %_14264~3':_r64 %_14263~2':_p13510 %_14262~1':_p10224 %_14261~0':_p10223 }
; _f10296 3' ⊢ °1◂3'
; _some { %_14265 %_14261 %_14262 } ⊢ %_14266 : %_14266
 ; {>  %_14265~°1◂3':_p10232 %_14263~2':_p13510 %_14262~1':_p10224 %_14261~0':_p10223 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_14266
 ; {>  %_14263~2':_p13510 %_14266~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p10232 _p10223 _p10224 }) }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_15709
	mov rdi,r8
	call dlt
LB_15709:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_15710
	btr r12,4
	jmp LB_15711
LB_15710:
	bts r12,4
LB_15711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_15716
	btr r12,2
	jmp LB_15717
LB_15716:
	bts r12,2
LB_15717:
	mov rsi,1
	bt r12,2
	jc LB_15714
	mov rsi,0
	bt r8,0
	jc LB_15714
	jmp LB_15715
LB_15714:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15715:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_15712
	btr QWORD [rdi],0
	jmp LB_15713
LB_15712:
	bts QWORD [rdi],0
LB_15713:
	mov r8,r13
	bt r12,0
	jc LB_15720
	btr r12,2
	jmp LB_15721
LB_15720:
	bts r12,2
LB_15721:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_15718
	btr QWORD [rdi],1
	jmp LB_15719
LB_15718:
	bts QWORD [rdi],1
LB_15719:
	mov r8,r14
	bt r12,1
	jc LB_15724
	btr r12,2
	jmp LB_15725
LB_15724:
	bts r12,2
LB_15725:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_15722
	btr QWORD [rdi],2
	jmp LB_15723
LB_15722:
	bts QWORD [rdi],2
LB_15723:
	mov r8,0
	bts r12,2
	ret
LB_15726:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15728
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15727
LB_15728:
	add rsp,8
	ret
LB_15730:
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
LB_15729:
	add rsp,80
	pop r14
LB_15727:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_15884
LB_15883:
	add r14,1
LB_15884:
	cmp r14,r10
	jge LB_15885
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15883
	cmp al,10
	jz LB_15883
	cmp al,32
	jz LB_15883
LB_15885:
	add r14,3
	cmp r14,r10
	jg LB_15888
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15888
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_15888
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_15888
	jmp LB_15889
LB_15888:
	jmp LB_15825
LB_15889:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_15840
LB_15839:
	add r14,1
LB_15840:
	cmp r14,r10
	jge LB_15841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15839
	cmp al,10
	jz LB_15839
	cmp al,32
	jz LB_15839
LB_15841:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15842
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15843:
	jmp LB_15826
LB_15842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_15846
LB_15845:
	add r14,1
LB_15846:
	cmp r14,r10
	jge LB_15847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15845
	cmp al,10
	jz LB_15845
	cmp al,32
	jz LB_15845
LB_15847:
	add r14,1
	cmp r14,r10
	jg LB_15852
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_15852
	jmp LB_15853
LB_15852:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15849
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15849:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15850:
	jmp LB_15826
LB_15853:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_15855
LB_15854:
	add r14,1
LB_15855:
	cmp r14,r10
	jge LB_15856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15854
	cmp al,10
	jz LB_15854
	cmp al,32
	jz LB_15854
LB_15856:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15857
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15858
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15858:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15859
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15859:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15860
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15860:
	jmp LB_15826
LB_15857:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_15863
LB_15862:
	add r14,1
LB_15863:
	cmp r14,r10
	jge LB_15864
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15862
	cmp al,10
	jz LB_15862
	cmp al,32
	jz LB_15862
LB_15864:
	add r14,3
	cmp r14,r10
	jg LB_15871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15871
	jmp LB_15872
LB_15871:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15866
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15866:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15867
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15867:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15868
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15868:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15869
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15869:
	jmp LB_15826
LB_15872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_15874
LB_15873:
	add r14,1
LB_15874:
	cmp r14,r10
	jge LB_15875
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15873
	cmp al,10
	jz LB_15873
	cmp al,32
	jz LB_15873
LB_15875:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15876
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_15877
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_15877:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15878
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15878:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15879
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15879:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15880
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15880:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15881
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15881:
	jmp LB_15826
LB_15876:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_15837
	btr r12,5
	clc
	jmp LB_15838
LB_15837:
	bts r12,5
	stc
LB_15838:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15835
	btr r12,4
	clc
	jmp LB_15836
LB_15835:
	bts r12,4
	stc
LB_15836:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15833
	btr r12,3
	clc
	jmp LB_15834
LB_15833:
	bts r12,3
	stc
LB_15834:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15831
	btr r12,2
	clc
	jmp LB_15832
LB_15831:
	bts r12,2
	stc
LB_15832:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15829
	btr r12,1
	clc
	jmp LB_15830
LB_15829:
	bts r12,1
	stc
LB_15830:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15827
	btr r12,0
	clc
	jmp LB_15828
LB_15827:
	bts r12,0
	stc
LB_15828:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_15822
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_15890
	btr r12,6
	jmp LB_15891
LB_15890:
	bts r12,6
LB_15891:
	mov r8,r11
	bt r12,5
	jc LB_15892
	btr r12,2
	jmp LB_15893
LB_15892:
	bts r12,2
LB_15893:
	mov r11,r14
	bt r12,1
	jc LB_15894
	btr r12,5
	jmp LB_15895
LB_15894:
	bts r12,5
LB_15895:
	mov r14,r9
	bt r12,3
	jc LB_15896
	btr r12,1
	jmp LB_15897
LB_15896:
	bts r12,1
LB_15897:
	mov r9,r13
	bt r12,0
	jc LB_15898
	btr r12,3
	jmp LB_15899
LB_15898:
	bts r12,3
LB_15899:
	mov r13,r11
	bt r12,5
	jc LB_15900
	btr r12,0
	jmp LB_15901
LB_15900:
	bts r12,0
LB_15901:
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
; _f10297 {  } ⊢ %_14270 : %_14270
 ; {>  %_14269~2':_p10224 %_14267~0':_p10223 %_14268~1':_p10223 }
; _f10297 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_14271 : %_14271
 ; {>  %_14269~2':_p10224 %_14270~°2◂{  }:_p10232 %_14267~0':_p10223 %_14268~1':_p10223 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_14268 %_14271 } ⊢ %_14272 : %_14272
 ; {>  %_14271~°1◂{  }:(_lst)◂(t5567'(0)) %_14269~2':_p10224 %_14270~°2◂{  }:_p10232 %_14267~0':_p10223 %_14268~1':_p10223 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_14267 %_14272 } ⊢ %_14273 : %_14273
 ; {>  %_14269~2':_p10224 %_14272~°0◂{ 1' °1◂{  } }:(_lst)◂(_p10223) %_14270~°2◂{  }:_p10232 %_14267~0':_p10223 }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f10272 %_14273 ⊢ %_14274 : %_14274
 ; {>  %_14273~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p10223) %_14269~2':_p10224 %_14270~°2◂{  }:_p10232 }
; _f10272 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_14270 %_14274 %_14269 } ⊢ %_14275 : %_14275
 ; {>  %_14274~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p10223 %_14269~2':_p10224 %_14270~°2◂{  }:_p10232 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_14275
 ; {>  %_14275~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p10232 _p10223 _p10224 }) }
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
	jc LB_15794
	mov rsi,0
	bt r10,0
	jc LB_15794
	jmp LB_15795
LB_15794:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_15795:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_15792
	btr QWORD [rdi],0
	jmp LB_15793
LB_15792:
	bts QWORD [rdi],0
LB_15793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_15804
	btr r12,5
	jmp LB_15805
LB_15804:
	bts r12,5
LB_15805:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_15802
	btr QWORD [rdi],0
	jmp LB_15803
LB_15802:
	bts QWORD [rdi],0
LB_15803:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_15812
	btr r12,0
	jmp LB_15813
LB_15812:
	bts r12,0
LB_15813:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_15810
	btr QWORD [rdi],0
	jmp LB_15811
LB_15810:
	bts QWORD [rdi],0
LB_15811:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_15816
	mov rsi,0
	bt r13,0
	jc LB_15816
	jmp LB_15817
LB_15816:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15817:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_15814
	btr QWORD [rdi],1
	jmp LB_15815
LB_15814:
	bts QWORD [rdi],1
LB_15815:
	mov rsi,1
	bt r12,5
	jc LB_15808
	mov rsi,0
	bt r11,0
	jc LB_15808
	jmp LB_15809
LB_15808:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_15809:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_15806
	btr QWORD [rdi],1
	jmp LB_15807
LB_15806:
	bts QWORD [rdi],1
LB_15807:
	mov rsi,1
	bt r12,4
	jc LB_15800
	mov rsi,0
	bt r10,0
	jc LB_15800
	jmp LB_15801
LB_15800:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_15801:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_15798
	mov rsi,0
	bt r10,0
	jc LB_15798
	jmp LB_15799
LB_15798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_15799:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_15796
	btr QWORD [rdi],1
	jmp LB_15797
LB_15796:
	bts QWORD [rdi],1
LB_15797:
	mov r10,r8
	bt r12,2
	jc LB_15820
	btr r12,4
	jmp LB_15821
LB_15820:
	bts r12,4
LB_15821:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_15818
	btr QWORD [rdi],2
	jmp LB_15819
LB_15818:
	bts QWORD [rdi],2
LB_15819:
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
LB_15826:
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
LB_15825:
	add rsp,96
	pop r14
LB_15823:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_15930
LB_15929:
	add r14,1
LB_15930:
	cmp r14,r10
	jge LB_15931
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15929
	cmp al,10
	jz LB_15929
	cmp al,32
	jz LB_15929
LB_15931:
	add r14,2
	cmp r14,r10
	jg LB_15934
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_15934
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_15934
	jmp LB_15935
LB_15934:
	jmp LB_15917
LB_15935:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_15924
LB_15923:
	add r14,1
LB_15924:
	cmp r14,r10
	jge LB_15925
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15923
	cmp al,10
	jz LB_15923
	cmp al,32
	jz LB_15923
LB_15925:
	push r10
	call NS_E_14109_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15926
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15927
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15927:
	jmp LB_15918
LB_15926:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15921
	btr r12,1
	clc
	jmp LB_15922
LB_15921:
	bts r12,1
	stc
LB_15922:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15919
	btr r12,0
	clc
	jmp LB_15920
LB_15919:
	bts r12,0
	stc
LB_15920:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15914
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_15936
	btr r12,3
	jmp LB_15937
LB_15936:
	bts r12,3
LB_15937:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_15940
	btr r12,4
	clc
	jmp LB_15941
LB_15940:
	bts r12,4
	stc
LB_15941:
	mov r13,r10
	bt r12,4
	jc LB_15938
	btr r12,0
	jmp LB_15939
LB_15938:
	bts r12,0
LB_15939:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_15944
	btr r12,4
	clc
	jmp LB_15945
LB_15944:
	bts r12,4
	stc
LB_15945:
	mov r14,r10
	bt r12,4
	jc LB_15942
	btr r12,1
	jmp LB_15943
LB_15942:
	bts r12,1
LB_15943:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_15948
	btr r12,4
	clc
	jmp LB_15949
LB_15948:
	bts r12,4
	stc
LB_15949:
	mov r8,r10
	bt r12,4
	jc LB_15946
	btr r12,2
	jmp LB_15947
LB_15946:
	bts r12,2
LB_15947:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14276 ⊢ %_14277 : %_14277
 ; {>  %_14276~{ 0' 1' 2' }:{ _p10232 _p10223 _p10224 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_14277
 ; {>  %_14277~°0◂{ 0' 1' 2' }:(_opn)◂({ _p10232 _p10223 _p10224 }) }
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
	jc LB_15904
	btr r12,4
	jmp LB_15905
LB_15904:
	bts r12,4
LB_15905:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_15902
	btr QWORD [rdi],0
	jmp LB_15903
LB_15902:
	bts QWORD [rdi],0
LB_15903:
	mov r10,r14
	bt r12,1
	jc LB_15908
	btr r12,4
	jmp LB_15909
LB_15908:
	bts r12,4
LB_15909:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_15906
	btr QWORD [rdi],1
	jmp LB_15907
LB_15906:
	bts QWORD [rdi],1
LB_15907:
	mov r10,r8
	bt r12,2
	jc LB_15912
	btr r12,4
	jmp LB_15913
LB_15912:
	bts r12,4
LB_15913:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_15910
	btr QWORD [rdi],2
	jmp LB_15911
LB_15910:
	bts QWORD [rdi],2
LB_15911:
	mov r8,0
	bts r12,2
	ret
LB_15914:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15916
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15915
LB_15916:
	add rsp,8
	ret
LB_15918:
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
LB_15917:
	add rsp,32
	pop r14
LB_15915:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_15977
LB_15976:
	add r14,1
LB_15977:
	cmp r14,r10
	jge LB_15978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15976
	cmp al,10
	jz LB_15976
	cmp al,32
	jz LB_15976
LB_15978:
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15979
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15967
LB_15979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_15982
LB_15981:
	add r14,1
LB_15982:
	cmp r14,r10
	jge LB_15983
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15981
	cmp al,10
	jz LB_15981
	cmp al,32
	jz LB_15981
LB_15983:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15984
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15985:
	jmp LB_15967
LB_15984:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_15988
LB_15987:
	add r14,1
LB_15988:
	cmp r14,r10
	jge LB_15989
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15987
	cmp al,10
	jz LB_15987
	cmp al,32
	jz LB_15987
LB_15989:
	add r14,3
	cmp r14,r10
	jg LB_15994
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15994
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15994
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15994
	jmp LB_15995
LB_15994:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15991
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15991:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15992
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15992:
	jmp LB_15967
LB_15995:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_15997
LB_15996:
	add r14,1
LB_15997:
	cmp r14,r10
	jge LB_15998
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15996
	cmp al,10
	jz LB_15996
	cmp al,32
	jz LB_15996
LB_15998:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15999
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16000
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16000:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16001
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16001:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16002
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16002:
	jmp LB_15967
LB_15999:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15974
	btr r12,3
	clc
	jmp LB_15975
LB_15974:
	bts r12,3
	stc
LB_15975:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15972
	btr r12,2
	clc
	jmp LB_15973
LB_15972:
	bts r12,2
	stc
LB_15973:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15970
	btr r12,1
	clc
	jmp LB_15971
LB_15970:
	bts r12,1
	stc
LB_15971:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15968
	btr r12,0
	clc
	jmp LB_15969
LB_15968:
	bts r12,0
	stc
LB_15969:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15964
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_16004
	btr r12,4
	jmp LB_16005
LB_16004:
	bts r12,4
LB_16005:
	mov r8,r9
	bt r12,3
	jc LB_16006
	btr r12,2
	jmp LB_16007
LB_16006:
	bts r12,2
LB_16007:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10295 %_14278 ⊢ %_14281 : %_14281
 ; {>  %_14280~2':_p10224 %_14279~1':_p10223 %_14278~0':_p10160 }
; _f10295 0' ⊢ °0◂0'
; _some { %_14281 %_14279 %_14280 } ⊢ %_14282 : %_14282
 ; {>  %_14280~2':_p10224 %_14279~1':_p10223 %_14281~°0◂0':_p10232 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_14282
 ; {>  %_14282~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p10232 _p10223 _p10224 }) }
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
	jc LB_15954
	btr r12,4
	jmp LB_15955
LB_15954:
	bts r12,4
LB_15955:
	mov rsi,1
	bt r12,4
	jc LB_15952
	mov rsi,0
	bt r10,0
	jc LB_15952
	jmp LB_15953
LB_15952:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_15953:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_15950
	btr QWORD [rdi],0
	jmp LB_15951
LB_15950:
	bts QWORD [rdi],0
LB_15951:
	mov r10,r14
	bt r12,1
	jc LB_15958
	btr r12,4
	jmp LB_15959
LB_15958:
	bts r12,4
LB_15959:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_15956
	btr QWORD [rdi],1
	jmp LB_15957
LB_15956:
	bts QWORD [rdi],1
LB_15957:
	mov r10,r8
	bt r12,2
	jc LB_15962
	btr r12,4
	jmp LB_15963
LB_15962:
	bts r12,4
LB_15963:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_15960
	btr QWORD [rdi],2
	jmp LB_15961
LB_15960:
	bts QWORD [rdi],2
LB_15961:
	mov r8,0
	bts r12,2
	ret
LB_15964:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15966
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15965
LB_15966:
	add rsp,8
	ret
LB_15967:
	add rsp,64
	pop r14
LB_15965:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14109:
NS_E_RDI_14109:
NS_E_14109_ETR_TBL:
NS_E_14109_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_16066
LB_16065:
	add r14,1
LB_16066:
	cmp r14,r10
	jge LB_16067
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16065
	cmp al,10
	jz LB_16065
	cmp al,32
	jz LB_16065
LB_16067:
	add r14,2
	cmp r14,r10
	jg LB_16070
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_16070
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_16070
	jmp LB_16071
LB_16070:
	jmp LB_16033
LB_16071:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_16044
LB_16043:
	add r14,1
LB_16044:
	cmp r14,r10
	jge LB_16045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16043
	cmp al,10
	jz LB_16043
	cmp al,32
	jz LB_16043
LB_16045:
	push r10
	call NS_E_14110_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16046
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16047:
	jmp LB_16034
LB_16046:
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
LB_16053:
	jmp LB_16050
LB_16049:
	add r14,1
LB_16050:
	cmp r14,r10
	jge LB_16051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16049
	cmp al,10
	jz LB_16049
	cmp al,32
	jz LB_16049
LB_16051:
	push r10
	push rsi
	call NS_E_14111_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_16052
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_16054
	bts QWORD [rax],0
LB_16054:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_16053
LB_16052:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_16056
LB_16055:
	add r14,1
LB_16056:
	cmp r14,r10
	jge LB_16057
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16055
	cmp al,10
	jz LB_16055
	cmp al,32
	jz LB_16055
LB_16057:
	add r14,2
	cmp r14,r10
	jg LB_16063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_16063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_16063
	jmp LB_16064
LB_16063:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16059
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16059:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16060
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16060:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16061
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16061:
	jmp LB_16034
LB_16064:
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
	jc LB_16041
	btr r12,3
	clc
	jmp LB_16042
LB_16041:
	bts r12,3
	stc
LB_16042:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16039
	btr r12,2
	clc
	jmp LB_16040
LB_16039:
	bts r12,2
	stc
LB_16040:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16037
	btr r12,1
	clc
	jmp LB_16038
LB_16037:
	bts r12,1
	stc
LB_16038:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16035
	btr r12,0
	clc
	jmp LB_16036
LB_16035:
	bts r12,0
	stc
LB_16036:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_16030
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_16072
	btr r12,4
	jmp LB_16073
LB_16072:
	bts r12,4
LB_16073:
	mov r9,r8
	bt r12,2
	jc LB_16074
	btr r12,3
	jmp LB_16075
LB_16074:
	bts r12,3
LB_16075:
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
	jc LB_16076
	btr r12,4
	jmp LB_16077
LB_16076:
	bts r12,4
LB_16077:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_16080
	btr r12,5
	clc
	jmp LB_16081
LB_16080:
	bts r12,5
	stc
LB_16081:
	mov r13,r11
	bt r12,5
	jc LB_16078
	btr r12,0
	jmp LB_16079
LB_16078:
	bts r12,0
LB_16079:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_16084
	btr r12,5
	clc
	jmp LB_16085
LB_16084:
	bts r12,5
	stc
LB_16085:
	mov r14,r11
	bt r12,5
	jc LB_16082
	btr r12,1
	jmp LB_16083
LB_16082:
	bts r12,1
LB_16083:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_16088
	btr r12,5
	clc
	jmp LB_16089
LB_16088:
	bts r12,5
	stc
LB_16089:
	mov r8,r11
	bt r12,5
	jc LB_16086
	btr r12,2
	jmp LB_16087
LB_16086:
	bts r12,2
LB_16087:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10299 { %_14283 %_14286 } ⊢ %_14287 : %_14287
 ; {>  %_14286~3':(_lst)◂(_p10233) %_14284~1':_p10223 %_14285~2':_p10224 %_14283~0':_r64 }
; _f10299 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_14287 %_14284 %_14285 } ⊢ %_14288 : %_14288
 ; {>  %_14287~°4◂{ 0' 3' }:_p10232 %_14284~1':_p10223 %_14285~2':_p10224 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_14288
 ; {>  %_14288~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p10232 _p10223 _p10224 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_16008
	btr r12,4
	jmp LB_16009
LB_16008:
	bts r12,4
LB_16009:
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
	jc LB_16016
	btr r12,6
	jmp LB_16017
LB_16016:
	bts r12,6
LB_16017:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_16014
	btr QWORD [rdi],0
	jmp LB_16015
LB_16014:
	bts QWORD [rdi],0
LB_16015:
	mov rcx,r10
	bt r12,4
	jc LB_16020
	btr r12,6
	jmp LB_16021
LB_16020:
	bts r12,6
LB_16021:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_16018
	btr QWORD [rdi],1
	jmp LB_16019
LB_16018:
	bts QWORD [rdi],1
LB_16019:
	mov rsi,1
	bt r12,5
	jc LB_16012
	mov rsi,0
	bt r11,0
	jc LB_16012
	jmp LB_16013
LB_16012:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_16013:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_16010
	btr QWORD [rdi],0
	jmp LB_16011
LB_16010:
	bts QWORD [rdi],0
LB_16011:
	mov r11,r14
	bt r12,1
	jc LB_16024
	btr r12,5
	jmp LB_16025
LB_16024:
	bts r12,5
LB_16025:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_16022
	btr QWORD [rdi],1
	jmp LB_16023
LB_16022:
	bts QWORD [rdi],1
LB_16023:
	mov r11,r8
	bt r12,2
	jc LB_16028
	btr r12,5
	jmp LB_16029
LB_16028:
	bts r12,5
LB_16029:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_16026
	btr QWORD [rdi],2
	jmp LB_16027
LB_16026:
	bts QWORD [rdi],2
LB_16027:
	mov r8,0
	bts r12,2
	ret
LB_16030:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16032
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16031
LB_16032:
	add rsp,8
	ret
LB_16034:
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
LB_16033:
	add rsp,64
	pop r14
LB_16031:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_16119
LB_16118:
	add r14,1
LB_16119:
	cmp r14,r10
	jge LB_16120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16118
	cmp al,10
	jz LB_16118
	cmp al,32
	jz LB_16118
LB_16120:
	push r10
	call NS_E_13115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16121
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16109
LB_16121:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_16124
LB_16123:
	add r14,1
LB_16124:
	cmp r14,r10
	jge LB_16125
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16123
	cmp al,10
	jz LB_16123
	cmp al,32
	jz LB_16123
LB_16125:
	add r14,1
	cmp r14,r10
	jg LB_16129
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_16129
	jmp LB_16130
LB_16129:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16127
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16127:
	jmp LB_16109
LB_16130:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_16132
LB_16131:
	add r14,1
LB_16132:
	cmp r14,r10
	jge LB_16133
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16131
	cmp al,10
	jz LB_16131
	cmp al,32
	jz LB_16131
LB_16133:
	add r14,3
	cmp r14,r10
	jg LB_16138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_16138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_16138
	jmp LB_16139
LB_16138:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16135
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16135:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16136
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16136:
	jmp LB_16109
LB_16139:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_16141
LB_16140:
	add r14,1
LB_16141:
	cmp r14,r10
	jge LB_16142
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16140
	cmp al,10
	jz LB_16140
	cmp al,32
	jz LB_16140
LB_16142:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16143
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16144
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16144:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16145
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16145:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16146
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16146:
	jmp LB_16109
LB_16143:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16116
	btr r12,3
	clc
	jmp LB_16117
LB_16116:
	bts r12,3
	stc
LB_16117:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16114
	btr r12,2
	clc
	jmp LB_16115
LB_16114:
	bts r12,2
	stc
LB_16115:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16112
	btr r12,1
	clc
	jmp LB_16113
LB_16112:
	bts r12,1
	stc
LB_16113:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16110
	btr r12,0
	clc
	jmp LB_16111
LB_16110:
	bts r12,0
	stc
LB_16111:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_16106
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_16148
	btr r12,4
	jmp LB_16149
LB_16148:
	bts r12,4
LB_16149:
	mov r14,r9
	bt r12,3
	jc LB_16150
	btr r12,1
	jmp LB_16151
LB_16150:
	bts r12,1
LB_16151:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10298 %_14289 ⊢ %_14291 : %_14291
 ; {>  %_14290~1':_p10224 %_14289~0':_p10226 }
; _f10298 0' ⊢ °3◂0'
; _nil {  } ⊢ %_14292 : %_14292
 ; {>  %_14290~1':_p10224 %_14291~°3◂0':_p10232 }
; _nil {  } ⊢ °1◂{  }
; _f10272 %_14292 ⊢ %_14293 : %_14293
 ; {>  %_14290~1':_p10224 %_14292~°1◂{  }:(_lst)◂(t5596'(0)) %_14291~°3◂0':_p10232 }
; _f10272 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_14291 %_14293 %_14290 } ⊢ %_14294 : %_14294
 ; {>  %_14290~1':_p10224 %_14293~°0◂°1◂{  }:_p10223 %_14291~°3◂0':_p10232 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_14294
 ; {>  %_14294~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p10232 _p10223 _p10224 }) }
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
	jc LB_16094
	btr r12,2
	jmp LB_16095
LB_16094:
	bts r12,2
LB_16095:
	mov rsi,1
	bt r12,2
	jc LB_16092
	mov rsi,0
	bt r8,0
	jc LB_16092
	jmp LB_16093
LB_16092:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16093:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16090
	btr QWORD [rdi],0
	jmp LB_16091
LB_16090:
	bts QWORD [rdi],0
LB_16091:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_16100
	mov rsi,0
	bt r8,0
	jc LB_16100
	jmp LB_16101
LB_16100:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16101:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_16098
	mov rsi,0
	bt r8,0
	jc LB_16098
	jmp LB_16099
LB_16098:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16099:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16096
	btr QWORD [rdi],1
	jmp LB_16097
LB_16096:
	bts QWORD [rdi],1
LB_16097:
	mov r8,r14
	bt r12,1
	jc LB_16104
	btr r12,2
	jmp LB_16105
LB_16104:
	bts r12,2
LB_16105:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_16102
	btr QWORD [rdi],2
	jmp LB_16103
LB_16102:
	bts QWORD [rdi],2
LB_16103:
	mov r8,0
	bts r12,2
	ret
LB_16106:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16108
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16107
LB_16108:
	add rsp,8
	ret
LB_16109:
	add rsp,64
	pop r14
LB_16107:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14110:
NS_E_RDI_14110:
NS_E_14110_ETR_TBL:
NS_E_14110_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_16205
LB_16204:
	add r14,1
LB_16205:
	cmp r14,r10
	jge LB_16206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16204
	cmp al,10
	jz LB_16204
	cmp al,32
	jz LB_16204
LB_16206:
	add r14,1
	cmp r14,r10
	jg LB_16209
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_16209
	jmp LB_16210
LB_16209:
	jmp LB_16181
LB_16210:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_16190
LB_16189:
	add r14,1
LB_16190:
	cmp r14,r10
	jge LB_16191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16189
	cmp al,10
	jz LB_16189
	cmp al,32
	jz LB_16189
LB_16191:
	add r14,3
	cmp r14,r10
	jg LB_16195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_16195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_16195
	jmp LB_16196
LB_16195:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16193
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16193:
	jmp LB_16182
LB_16196:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_16198
LB_16197:
	add r14,1
LB_16198:
	cmp r14,r10
	jge LB_16199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16197
	cmp al,10
	jz LB_16197
	cmp al,32
	jz LB_16197
LB_16199:
	push r10
	call NS_E_13513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16200
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16201
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16201:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16202
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16202:
	jmp LB_16182
LB_16200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16187
	btr r12,2
	clc
	jmp LB_16188
LB_16187:
	bts r12,2
	stc
LB_16188:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16185
	btr r12,1
	clc
	jmp LB_16186
LB_16185:
	bts r12,1
	stc
LB_16186:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16183
	btr r12,0
	clc
	jmp LB_16184
LB_16183:
	bts r12,0
	stc
LB_16184:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16178
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_16211
	btr r12,3
	jmp LB_16212
LB_16211:
	bts r12,3
LB_16212:
	mov r13,r8
	bt r12,2
	jc LB_16213
	btr r12,0
	jmp LB_16214
LB_16213:
	bts r12,0
LB_16214:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_14296 : %_14296
 ; {>  %_14295~0':_p10222 }
; 	» 0xr0 _ ⊢ 1' : %_14296
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_14297 : %_14297
 ; {>  %_14295~0':_p10222 %_14296~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f10272 %_14297 ⊢ %_14298 : %_14298
 ; {>  %_14295~0':_p10222 %_14296~1':_r64 %_14297~°1◂{  }:(_lst)◂(t5604'(0)) }
; _f10272 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_14299 : %_14299
 ; {>  %_14295~0':_p10222 %_14296~1':_r64 %_14298~°0◂°1◂{  }:_p10223 }
; _nil {  } ⊢ °1◂{  }
; _f10275 %_14295 ⊢ %_14300 : %_14300
 ; {>  %_14295~0':_p10222 %_14299~°1◂{  }:(_lst)◂(t5608'(0)) %_14296~1':_r64 %_14298~°0◂°1◂{  }:_p10223 }
; _f10275 0' ⊢ °1◂0'
; _cns { %_14300 %_14299 } ⊢ %_14301 : %_14301
 ; {>  %_14300~°1◂0':_p10224 %_14299~°1◂{  }:(_lst)◂(t5608'(0)) %_14296~1':_r64 %_14298~°0◂°1◂{  }:_p10223 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f10274 %_14301 ⊢ %_14302 : %_14302
 ; {>  %_14296~1':_r64 %_14301~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p10224) %_14298~°0◂°1◂{  }:_p10223 }
; _f10274 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_14296 %_14298 %_14302 } ⊢ %_14303 : %_14303
 ; {>  %_14296~1':_r64 %_14298~°0◂°1◂{  }:_p10223 %_14302~°0◂°0◂{ °1◂0' °1◂{  } }:_p10224 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_14303
 ; {>  %_14303~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p10223 _p10224 }) }
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
	jc LB_16154
	btr r12,2
	jmp LB_16155
LB_16154:
	bts r12,2
LB_16155:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16152
	btr QWORD [rdi],0
	jmp LB_16153
LB_16152:
	bts QWORD [rdi],0
LB_16153:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_16160
	mov rsi,0
	bt r8,0
	jc LB_16160
	jmp LB_16161
LB_16160:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16161:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_16158
	mov rsi,0
	bt r8,0
	jc LB_16158
	jmp LB_16159
LB_16158:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16159:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16156
	btr QWORD [rdi],1
	jmp LB_16157
LB_16156:
	bts QWORD [rdi],1
LB_16157:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_16172
	btr r12,1
	jmp LB_16173
LB_16172:
	bts r12,1
LB_16173:
	mov rsi,1
	bt r12,1
	jc LB_16170
	mov rsi,0
	bt r14,0
	jc LB_16170
	jmp LB_16171
LB_16170:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_16171:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_16168
	btr QWORD [rdi],0
	jmp LB_16169
LB_16168:
	bts QWORD [rdi],0
LB_16169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_16176
	mov rsi,0
	bt r14,0
	jc LB_16176
	jmp LB_16177
LB_16176:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_16177:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_16174
	btr QWORD [rdi],1
	jmp LB_16175
LB_16174:
	bts QWORD [rdi],1
LB_16175:
	mov rsi,1
	bt r12,2
	jc LB_16166
	mov rsi,0
	bt r8,0
	jc LB_16166
	jmp LB_16167
LB_16166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16167:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_16164
	mov rsi,0
	bt r8,0
	jc LB_16164
	jmp LB_16165
LB_16164:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_16165:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_16162
	btr QWORD [rdi],2
	jmp LB_16163
LB_16162:
	bts QWORD [rdi],2
LB_16163:
	mov r8,0
	bts r12,2
	ret
LB_16178:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16180
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16179
LB_16180:
	add rsp,8
	ret
LB_16182:
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
LB_16181:
	add rsp,48
	pop r14
LB_16179:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_16268
LB_16267:
	add r14,1
LB_16268:
	cmp r14,r10
	jge LB_16269
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16267
	cmp al,10
	jz LB_16267
	cmp al,32
	jz LB_16267
LB_16269:
	push r10
	call NS_E_13247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16270
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16256
LB_16270:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_16273
LB_16272:
	add r14,1
LB_16273:
	cmp r14,r10
	jge LB_16274
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16272
	cmp al,10
	jz LB_16272
	cmp al,32
	jz LB_16272
LB_16274:
	push r10
	call NS_E_13246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16275
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16276
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16276:
	jmp LB_16256
LB_16275:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_16279
LB_16278:
	add r14,1
LB_16279:
	cmp r14,r10
	jge LB_16280
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16278
	cmp al,10
	jz LB_16278
	cmp al,32
	jz LB_16278
LB_16280:
	add r14,3
	cmp r14,r10
	jg LB_16285
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16285
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_16285
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_16285
	jmp LB_16286
LB_16285:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16282
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16282:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16283
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16283:
	jmp LB_16256
LB_16286:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_16288
LB_16287:
	add r14,1
LB_16288:
	cmp r14,r10
	jge LB_16289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16287
	cmp al,10
	jz LB_16287
	cmp al,32
	jz LB_16287
LB_16289:
	push r10
	call NS_E_13513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16290
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16291
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16291:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16292
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16293:
	jmp LB_16256
LB_16290:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_16296
LB_16295:
	add r14,1
LB_16296:
	cmp r14,r10
	jge LB_16297
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16295
	cmp al,10
	jz LB_16295
	cmp al,32
	jz LB_16295
LB_16297:
	push r10
	call NS_E_13512_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16298
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_16299
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_16299:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16300
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16300:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16301
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16301:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16302
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16302:
	jmp LB_16256
LB_16298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_16265
	btr r12,4
	clc
	jmp LB_16266
LB_16265:
	bts r12,4
	stc
LB_16266:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16263
	btr r12,3
	clc
	jmp LB_16264
LB_16263:
	bts r12,3
	stc
LB_16264:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16261
	btr r12,2
	clc
	jmp LB_16262
LB_16261:
	bts r12,2
	stc
LB_16262:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16259
	btr r12,1
	clc
	jmp LB_16260
LB_16259:
	bts r12,1
	stc
LB_16260:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16257
	btr r12,0
	clc
	jmp LB_16258
LB_16257:
	bts r12,0
	stc
LB_16258:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_16253
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_16304
	btr r12,5
	jmp LB_16305
LB_16304:
	bts r12,5
LB_16305:
	mov r9,r10
	bt r12,4
	jc LB_16306
	btr r12,3
	jmp LB_16307
LB_16306:
	bts r12,3
LB_16307:
	mov r10,r8
	bt r12,2
	jc LB_16308
	btr r12,4
	jmp LB_16309
LB_16308:
	bts r12,4
LB_16309:
	mov r8,r11
	bt r12,5
	jc LB_16310
	btr r12,2
	jmp LB_16311
LB_16310:
	bts r12,2
LB_16311:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f10273 %_14304 ⊢ %_14308 : %_14308
 ; {>  %_14305~1':(_lst)◂(_p10223) %_14304~0':_p10221 %_14306~2':_p10222 %_14307~3':(_lst)◂(_p10224) }
; _f10273 0' ⊢ °1◂0'
; _f10275 %_14306 ⊢ %_14309 : %_14309
 ; {>  %_14305~1':(_lst)◂(_p10223) %_14308~°1◂0':_p10223 %_14306~2':_p10222 %_14307~3':(_lst)◂(_p10224) }
; _f10275 2' ⊢ °1◂2'
; _cns { %_14308 %_14305 } ⊢ %_14310 : %_14310
 ; {>  %_14305~1':(_lst)◂(_p10223) %_14308~°1◂0':_p10223 %_14309~°1◂2':_p10224 %_14307~3':(_lst)◂(_p10224) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_14309 %_14307 } ⊢ %_14311 : %_14311
 ; {>  %_14310~°0◂{ °1◂0' 1' }:(_lst)◂(_p10223) %_14309~°1◂2':_p10224 %_14307~3':(_lst)◂(_p10224) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f10272 %_14310 ⊢ %_14312 : %_14312
 ; {>  %_14311~°0◂{ °1◂2' 3' }:(_lst)◂(_p10224) %_14310~°0◂{ °1◂0' 1' }:(_lst)◂(_p10223) }
; _f10272 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f10274 %_14311 ⊢ %_14313 : %_14313
 ; {>  %_14311~°0◂{ °1◂2' 3' }:(_lst)◂(_p10224) %_14312~°0◂°0◂{ °1◂0' 1' }:_p10223 }
; _f10274 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_14314 : %_14314
 ; {>  %_14313~°0◂°0◂{ °1◂2' 3' }:_p10224 %_14312~°0◂°0◂{ °1◂0' 1' }:_p10223 }
; 	» 0xr1 _ ⊢ 4' : %_14314
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_14314 %_14312 %_14313 } ⊢ %_14315 : %_14315
 ; {>  %_14314~4':_r64 %_14313~°0◂°0◂{ °1◂2' 3' }:_p10224 %_14312~°0◂°0◂{ °1◂0' 1' }:_p10223 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_14315
 ; {>  %_14315~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p10223 _p10224 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_16215
	btr r12,5
	jmp LB_16216
LB_16215:
	bts r12,5
LB_16216:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_16219
	btr r12,6
	jmp LB_16220
LB_16219:
	bts r12,6
LB_16220:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_16217
	btr QWORD [rdi],0
	jmp LB_16218
LB_16217:
	bts QWORD [rdi],0
LB_16218:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_16231
	btr r12,4
	jmp LB_16232
LB_16231:
	bts r12,4
LB_16232:
	mov rsi,1
	bt r12,4
	jc LB_16229
	mov rsi,0
	bt r10,0
	jc LB_16229
	jmp LB_16230
LB_16229:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_16230:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_16227
	btr QWORD [rdi],0
	jmp LB_16228
LB_16227:
	bts QWORD [rdi],0
LB_16228:
	mov r10,r14
	bt r12,1
	jc LB_16235
	btr r12,4
	jmp LB_16236
LB_16235:
	bts r12,4
LB_16236:
	mov rdi,rcx
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_16233
	btr QWORD [rdi],1
	jmp LB_16234
LB_16233:
	bts QWORD [rdi],1
LB_16234:
	mov rsi,1
	bt r12,6
	jc LB_16225
	mov rsi,0
	bt rcx,0
	jc LB_16225
	jmp LB_16226
LB_16225:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_16226:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_16223
	mov rsi,0
	bt rcx,0
	jc LB_16223
	jmp LB_16224
LB_16223:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_16224:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_16221
	btr QWORD [rdi],1
	jmp LB_16222
LB_16221:
	bts QWORD [rdi],1
LB_16222:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_16247
	btr r12,0
	jmp LB_16248
LB_16247:
	bts r12,0
LB_16248:
	mov rsi,1
	bt r12,0
	jc LB_16245
	mov rsi,0
	bt r13,0
	jc LB_16245
	jmp LB_16246
LB_16245:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_16246:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_16243
	btr QWORD [rdi],0
	jmp LB_16244
LB_16243:
	bts QWORD [rdi],0
LB_16244:
	mov r13,r11
	bt r12,5
	jc LB_16251
	btr r12,0
	jmp LB_16252
LB_16251:
	bts r12,0
LB_16252:
	mov rdi,rcx
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_16249
	btr QWORD [rdi],1
	jmp LB_16250
LB_16249:
	bts QWORD [rdi],1
LB_16250:
	mov rsi,1
	bt r12,6
	jc LB_16241
	mov rsi,0
	bt rcx,0
	jc LB_16241
	jmp LB_16242
LB_16241:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_16242:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_16239
	mov rsi,0
	bt rcx,0
	jc LB_16239
	jmp LB_16240
LB_16239:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_16240:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_16237
	btr QWORD [rdi],2
	jmp LB_16238
LB_16237:
	bts QWORD [rdi],2
LB_16238:
	mov r8,0
	bts r12,2
	ret
LB_16253:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16255
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16254
LB_16255:
	add rsp,8
	ret
LB_16256:
	add rsp,80
	pop r14
LB_16254:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14111:
NS_E_RDI_14111:
NS_E_14111_ETR_TBL:
NS_E_14111_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_16341
LB_16340:
	add r14,1
LB_16341:
	cmp r14,r10
	jge LB_16342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16340
	cmp al,10
	jz LB_16340
	cmp al,32
	jz LB_16340
LB_16342:
	push r10
	call NS_E_14112_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16343
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16325
LB_16343:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
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
	add r14,1
	cmp r14,r10
	jg LB_16351
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_16351
	jmp LB_16352
LB_16351:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16349
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16349:
	jmp LB_16325
LB_16352:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_16334
LB_16333:
	add r14,1
LB_16334:
	cmp r14,r10
	jge LB_16335
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16333
	cmp al,10
	jz LB_16333
	cmp al,32
	jz LB_16333
LB_16335:
	push r10
	call NS_E_9611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16336
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16337
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16337:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16338
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16338:
	jmp LB_16326
LB_16336:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16331
	btr r12,2
	clc
	jmp LB_16332
LB_16331:
	bts r12,2
	stc
LB_16332:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16329
	btr r12,1
	clc
	jmp LB_16330
LB_16329:
	bts r12,1
	stc
LB_16330:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16327
	btr r12,0
	clc
	jmp LB_16328
LB_16327:
	bts r12,0
	stc
LB_16328:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16322
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_16353
	btr r12,3
	jmp LB_16354
LB_16353:
	bts r12,3
LB_16354:
	mov r14,r8
	bt r12,2
	jc LB_16355
	btr r12,1
	jmp LB_16356
LB_16355:
	bts r12,1
LB_16356:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f10303 { %_14316 %_14317 } ⊢ %_14318 : %_14318
 ; {>  %_14317~1':_stg %_14316~0':_r64 }
; _f10303 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_14318 ⊢ %_14319 : %_14319
 ; {>  %_14318~°3◂{ 0' 1' }:_p10233 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_14319
 ; {>  %_14319~°0◂°3◂{ 0' 1' }:(_opn)◂(_p10233) }
; 	∎ °0◂°3◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°3◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_16316
	btr r12,2
	jmp LB_16317
LB_16316:
	bts r12,2
LB_16317:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16314
	btr QWORD [rdi],0
	jmp LB_16315
LB_16314:
	bts QWORD [rdi],0
LB_16315:
	mov r8,r14
	bt r12,1
	jc LB_16320
	btr r12,2
	jmp LB_16321
LB_16320:
	bts r12,2
LB_16321:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16318
	btr QWORD [rdi],1
	jmp LB_16319
LB_16318:
	bts QWORD [rdi],1
LB_16319:
	mov rsi,1
	bt r12,3
	jc LB_16312
	mov rsi,0
	bt r9,0
	jc LB_16312
	jmp LB_16313
LB_16312:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16313:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16322:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16324
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16323
LB_16324:
	add rsp,8
	ret
LB_16326:
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
LB_16325:
	add rsp,48
	pop r14
LB_16323:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_16368
LB_16367:
	add r14,1
LB_16368:
	cmp r14,r10
	jge LB_16369
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16367
	cmp al,10
	jz LB_16367
	cmp al,32
	jz LB_16367
LB_16369:
	push r10
	call NS_E_14114_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16370
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16364
LB_16370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16365
	btr r12,0
	clc
	jmp LB_16366
LB_16365:
	bts r12,0
	stc
LB_16366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16361
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10300 %_14320 ⊢ %_14321 : %_14321
 ; {>  %_14320~0':_stg }
; _f10300 0' ⊢ °0◂0'
; _some %_14321 ⊢ %_14322 : %_14322
 ; {>  %_14321~°0◂0':_p10233 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14322
 ; {>  %_14322~°0◂°0◂0':(_opn)◂(_p10233) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16359
	btr r12,3
	jmp LB_16360
LB_16359:
	bts r12,3
LB_16360:
	mov rsi,1
	bt r12,3
	jc LB_16357
	mov rsi,0
	bt r9,0
	jc LB_16357
	jmp LB_16358
LB_16357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16358:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16361:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16363
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16362
LB_16363:
	add rsp,8
	ret
LB_16364:
	add rsp,16
	pop r14
LB_16362:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_16383
LB_16382:
	add r14,1
LB_16383:
	cmp r14,r10
	jge LB_16384
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16382
	cmp al,10
	jz LB_16382
	cmp al,32
	jz LB_16382
LB_16384:
	push r10
	call NS_E_9611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16385
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16379
LB_16385:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16380
	btr r12,0
	clc
	jmp LB_16381
LB_16380:
	bts r12,0
	stc
LB_16381:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16376
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10300 %_14323 ⊢ %_14324 : %_14324
 ; {>  %_14323~0':_stg }
; _f10300 0' ⊢ °0◂0'
; _some %_14324 ⊢ %_14325 : %_14325
 ; {>  %_14324~°0◂0':_p10233 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14325
 ; {>  %_14325~°0◂°0◂0':(_opn)◂(_p10233) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16374
	btr r12,3
	jmp LB_16375
LB_16374:
	bts r12,3
LB_16375:
	mov rsi,1
	bt r12,3
	jc LB_16372
	mov rsi,0
	bt r9,0
	jc LB_16372
	jmp LB_16373
LB_16372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16373:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16376:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16378
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16377
LB_16378:
	add rsp,8
	ret
LB_16379:
	add rsp,16
	pop r14
LB_16377:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_16398
LB_16397:
	add r14,1
LB_16398:
	cmp r14,r10
	jge LB_16399
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16397
	cmp al,10
	jz LB_16397
	cmp al,32
	jz LB_16397
LB_16399:
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16400
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16394
LB_16400:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16395
	btr r12,0
	clc
	jmp LB_16396
LB_16395:
	bts r12,0
	stc
LB_16396:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16391
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10301 %_14326 ⊢ %_14327 : %_14327
 ; {>  %_14326~0':_p10160 }
; _f10301 0' ⊢ °1◂0'
; _some %_14327 ⊢ %_14328 : %_14328
 ; {>  %_14327~°1◂0':_p10233 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14328
 ; {>  %_14328~°0◂°1◂0':(_opn)◂(_p10233) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16389
	btr r12,3
	jmp LB_16390
LB_16389:
	bts r12,3
LB_16390:
	mov rsi,1
	bt r12,3
	jc LB_16387
	mov rsi,0
	bt r9,0
	jc LB_16387
	jmp LB_16388
LB_16387:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16388:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16391:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16393
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16392
LB_16393:
	add rsp,8
	ret
LB_16394:
	add rsp,16
	pop r14
LB_16392:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_16419
LB_16418:
	add r14,1
LB_16419:
	cmp r14,r10
	jge LB_16420
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16418
	cmp al,10
	jz LB_16418
	cmp al,32
	jz LB_16418
LB_16420:
	push r10
	call NS_E_14113_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16421
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16415
LB_16421:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16416
	btr r12,0
	clc
	jmp LB_16417
LB_16416:
	bts r12,0
	stc
LB_16417:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16412
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_16423
	btr r12,2
	jmp LB_16424
LB_16423:
	bts r12,2
LB_16424:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_16427
	btr r12,3
	clc
	jmp LB_16428
LB_16427:
	bts r12,3
	stc
LB_16428:
	mov r13,r9
	bt r12,3
	jc LB_16425
	btr r12,0
	jmp LB_16426
LB_16425:
	bts r12,0
LB_16426:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_16431
	btr r12,3
	clc
	jmp LB_16432
LB_16431:
	bts r12,3
	stc
LB_16432:
	mov r14,r9
	bt r12,3
	jc LB_16429
	btr r12,1
	jmp LB_16430
LB_16429:
	bts r12,1
LB_16430:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10302 %_14329 ⊢ %_14330 : %_14330
 ; {>  %_14329~{ 0' 1' }:{ _p10234 _r64 } }
; _f10302 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_14330 ⊢ %_14331 : %_14331
 ; {>  %_14330~°2◂{ 0' 1' }:_p10233 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_14331
 ; {>  %_14331~°0◂°2◂{ 0' 1' }:(_opn)◂(_p10233) }
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
	jc LB_16406
	btr r12,2
	jmp LB_16407
LB_16406:
	bts r12,2
LB_16407:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16404
	btr QWORD [rdi],0
	jmp LB_16405
LB_16404:
	bts QWORD [rdi],0
LB_16405:
	mov r8,r14
	bt r12,1
	jc LB_16410
	btr r12,2
	jmp LB_16411
LB_16410:
	bts r12,2
LB_16411:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16408
	btr QWORD [rdi],1
	jmp LB_16409
LB_16408:
	bts QWORD [rdi],1
LB_16409:
	mov rsi,1
	bt r12,3
	jc LB_16402
	mov rsi,0
	bt r9,0
	jc LB_16402
	jmp LB_16403
LB_16402:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16403:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16412:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16414
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16413
LB_16414:
	add rsp,8
	ret
LB_16415:
	add rsp,16
	pop r14
LB_16413:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14112:
NS_E_RDI_14112:
NS_E_14112_ETR_TBL:
NS_E_14112_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9335_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16446
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16438
LB_16446:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_16454
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_16454
	jmp LB_16455
LB_16454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16452
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16452:
	jmp LB_16438
LB_16455:
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
	jc LB_16441
	btr r12,1
	clc
	jmp LB_16442
LB_16441:
	bts r12,1
	stc
LB_16442:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16439
	btr r12,0
	clc
	jmp LB_16440
LB_16439:
	bts r12,0
	stc
LB_16440:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16435
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14332 ⊢ %_14333 : %_14333
 ; {>  %_14332~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_14333
 ; {>  %_14333~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16433
	btr r12,3
	jmp LB_16434
LB_16433:
	bts r12,3
LB_16434:
	mov r8,0
	bts r12,2
	ret
LB_16435:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16437
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16436
LB_16437:
	add rsp,8
	ret
LB_16438:
	add rsp,32
	pop r14
LB_16436:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14113:
NS_E_RDI_14113:
NS_E_14113_ETR_TBL:
NS_E_14113_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9335_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16475
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16467
LB_16475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_16483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_16483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_16483
	jmp LB_16484
LB_16483:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16481:
	jmp LB_16467
LB_16484:
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
	jc LB_16470
	btr r12,1
	clc
	jmp LB_16471
LB_16470:
	bts r12,1
	stc
LB_16471:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16468
	btr r12,0
	clc
	jmp LB_16469
LB_16468:
	bts r12,0
	stc
LB_16469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16464
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10305 {  } ⊢ %_14335 : %_14335
 ; {>  %_14334~0':_r64 }
; _f10305 {  } ⊢ °1◂{  }
; _some { %_14335 %_14334 } ⊢ %_14336 : %_14336
 ; {>  %_14335~°1◂{  }:_p10234 %_14334~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_14336
 ; {>  %_14336~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p10234 _r64 }) }
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
	jc LB_16458
	mov rsi,0
	bt r14,0
	jc LB_16458
	jmp LB_16459
LB_16458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_16459:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_16456
	btr QWORD [rdi],0
	jmp LB_16457
LB_16456:
	bts QWORD [rdi],0
LB_16457:
	mov r14,r13
	bt r12,0
	jc LB_16462
	btr r12,1
	jmp LB_16463
LB_16462:
	bts r12,1
LB_16463:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_16460
	btr QWORD [rdi],1
	jmp LB_16461
LB_16460:
	bts QWORD [rdi],1
LB_16461:
	mov r8,0
	bts r12,2
	ret
LB_16464:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16466
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16465
LB_16466:
	add rsp,8
	ret
LB_16467:
	add rsp,32
	pop r14
LB_16465:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9335_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16504
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16496
LB_16504:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_16512
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_16512
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_16512
	jmp LB_16513
LB_16512:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16510
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16510:
	jmp LB_16496
LB_16513:
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
	jc LB_16499
	btr r12,1
	clc
	jmp LB_16500
LB_16499:
	bts r12,1
	stc
LB_16500:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16497
	btr r12,0
	clc
	jmp LB_16498
LB_16497:
	bts r12,0
	stc
LB_16498:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16493
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10306 {  } ⊢ %_14338 : %_14338
 ; {>  %_14337~0':_r64 }
; _f10306 {  } ⊢ °2◂{  }
; _some { %_14338 %_14337 } ⊢ %_14339 : %_14339
 ; {>  %_14337~0':_r64 %_14338~°2◂{  }:_p10234 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_14339
 ; {>  %_14339~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p10234 _r64 }) }
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
	jc LB_16487
	mov rsi,0
	bt r14,0
	jc LB_16487
	jmp LB_16488
LB_16487:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_16488:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_16485
	btr QWORD [rdi],0
	jmp LB_16486
LB_16485:
	bts QWORD [rdi],0
LB_16486:
	mov r14,r13
	bt r12,0
	jc LB_16491
	btr r12,1
	jmp LB_16492
LB_16491:
	bts r12,1
LB_16492:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_16489
	btr QWORD [rdi],1
	jmp LB_16490
LB_16489:
	bts QWORD [rdi],1
LB_16490:
	mov r8,0
	bts r12,2
	ret
LB_16493:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16495
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16494
LB_16495:
	add rsp,8
	ret
LB_16496:
	add rsp,32
	pop r14
LB_16494:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_9335_ETR_TBL
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
; "'"
	add r14,1
	cmp r14,r10
	jg LB_16541
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_16541
	jmp LB_16542
LB_16541:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16539:
	jmp LB_16525
LB_16542:
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
	jc LB_16528
	btr r12,1
	clc
	jmp LB_16529
LB_16528:
	bts r12,1
	stc
LB_16529:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16526
	btr r12,0
	clc
	jmp LB_16527
LB_16526:
	bts r12,0
	stc
LB_16527:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16522
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10304 {  } ⊢ %_14341 : %_14341
 ; {>  %_14340~0':_r64 }
; _f10304 {  } ⊢ °0◂{  }
; _some { %_14341 %_14340 } ⊢ %_14342 : %_14342
 ; {>  %_14340~0':_r64 %_14341~°0◂{  }:_p10234 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_14342
 ; {>  %_14342~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p10234 _r64 }) }
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
	jc LB_16516
	mov rsi,0
	bt r14,0
	jc LB_16516
	jmp LB_16517
LB_16516:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_16517:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_16514
	btr QWORD [rdi],0
	jmp LB_16515
LB_16514:
	bts QWORD [rdi],0
LB_16515:
	mov r14,r13
	bt r12,0
	jc LB_16520
	btr r12,1
	jmp LB_16521
LB_16520:
	bts r12,1
LB_16521:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_16518
	btr QWORD [rdi],1
	jmp LB_16519
LB_16518:
	bts QWORD [rdi],1
LB_16519:
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
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14114:
NS_E_RDI_14114:
NS_E_14114_ETR_TBL:
NS_E_14114_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_16558
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_16558
	jmp LB_16559
LB_16558:
	jmp LB_16548
LB_16559:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_14115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16563
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16564
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16564:
	jmp LB_16548
LB_16563:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16551
	btr r12,1
	clc
	jmp LB_16552
LB_16551:
	bts r12,1
	stc
LB_16552:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16549
	btr r12,0
	clc
	jmp LB_16550
LB_16549:
	bts r12,0
	stc
LB_16550:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16545
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_16566
	btr r12,2
	jmp LB_16567
LB_16566:
	bts r12,2
LB_16567:
	mov r13,r14
	bt r12,1
	jc LB_16568
	btr r12,0
	jmp LB_16569
LB_16568:
	bts r12,0
LB_16569:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9455 %_14343 ⊢ %_14344 : %_14344
 ; {>  %_14343~0':(_lst)◂(_r64) }
; _f9455 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9455
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_14344 ⊢ %_14345 : %_14345
 ; {>  %_14344~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_14345
 ; {>  %_14345~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16543
	btr r12,3
	jmp LB_16544
LB_16543:
	bts r12,3
LB_16544:
	mov r8,0
	bts r12,2
	ret
LB_16545:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16547
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16546
LB_16547:
	add rsp,8
	ret
LB_16548:
	add rsp,32
	pop r14
LB_16546:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14115:
NS_E_RDI_14115:
NS_E_14115_ETR_TBL:
NS_E_14115_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_16591
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_16591
	jmp LB_16592
LB_16591:
	jmp LB_16583
LB_16592:
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
	jc LB_16584
	btr r12,0
	clc
	jmp LB_16585
LB_16584:
	bts r12,0
	stc
LB_16585:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16580
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_14346 : %_14346
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_14346
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_14347 : %_14347
 ; {>  %_14346~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_14346 %_14347 } ⊢ %_14348 : %_14348
 ; {>  %_14347~°1◂{  }:(_lst)◂(t5673'(0)) %_14346~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_14348 ⊢ %_14349 : %_14349
 ; {>  %_14348~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_14349
 ; {>  %_14349~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_16574
	btr r12,1
	jmp LB_16575
LB_16574:
	bts r12,1
LB_16575:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_16572
	btr QWORD [rdi],0
	jmp LB_16573
LB_16572:
	bts QWORD [rdi],0
LB_16573:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_16578
	mov rsi,0
	bt r14,0
	jc LB_16578
	jmp LB_16579
LB_16578:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_16579:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_16576
	btr QWORD [rdi],1
	jmp LB_16577
LB_16576:
	bts QWORD [rdi],1
LB_16577:
	mov rsi,1
	bt r12,3
	jc LB_16570
	mov rsi,0
	bt r9,0
	jc LB_16570
	jmp LB_16571
LB_16570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16571:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16580:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16582
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16581
LB_16582:
	add rsp,8
	ret
LB_16583:
	add rsp,16
	pop r14
LB_16581:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_9333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16614
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16606
LB_16614:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_14115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16619
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16620
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16620:
	jmp LB_16606
LB_16619:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16609
	btr r12,1
	clc
	jmp LB_16610
LB_16609:
	bts r12,1
	stc
LB_16610:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16607
	btr r12,0
	clc
	jmp LB_16608
LB_16607:
	bts r12,0
	stc
LB_16608:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16603
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_14350 %_14351 } ⊢ %_14352 : %_14352
 ; {>  %_14351~1':(_lst)◂(_r64) %_14350~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14352 ⊢ %_14353 : %_14353
 ; {>  %_14352~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14353
 ; {>  %_14353~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_16597
	btr r12,2
	jmp LB_16598
LB_16597:
	bts r12,2
LB_16598:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16595
	btr QWORD [rdi],0
	jmp LB_16596
LB_16595:
	bts QWORD [rdi],0
LB_16596:
	mov r8,r14
	bt r12,1
	jc LB_16601
	btr r12,2
	jmp LB_16602
LB_16601:
	bts r12,2
LB_16602:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16599
	btr QWORD [rdi],1
	jmp LB_16600
LB_16599:
	bts QWORD [rdi],1
LB_16600:
	mov rsi,1
	bt r12,3
	jc LB_16593
	mov rsi,0
	bt r9,0
	jc LB_16593
	jmp LB_16594
LB_16593:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16594:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16603:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16605
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16604
LB_16605:
	add rsp,8
	ret
LB_16606:
	add rsp,32
	pop r14
LB_16604:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14116:
NS_E_RDI_14116:
NS_E_14116_ETR_TBL:
NS_E_14116_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_16660
LB_16659:
	add r14,1
LB_16660:
	cmp r14,r10
	jge LB_16661
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16659
	cmp al,10
	jz LB_16659
	cmp al,32
	jz LB_16659
LB_16661:
	add r14,4
	cmp r14,r10
	jg LB_16664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_16664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_16664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_16664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_16664
	jmp LB_16665
LB_16664:
	jmp LB_16638
LB_16665:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_16647
LB_16646:
	add r14,1
LB_16647:
	cmp r14,r10
	jge LB_16648
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16646
	cmp al,10
	jz LB_16646
	cmp al,32
	jz LB_16646
LB_16648:
	push r10
	call NS_E_14117_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16649
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16650
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16650:
	jmp LB_16639
LB_16649:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_16653
LB_16652:
	add r14,1
LB_16653:
	cmp r14,r10
	jge LB_16654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16652
	cmp al,10
	jz LB_16652
	cmp al,32
	jz LB_16652
LB_16654:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16655
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16656
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16656:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16657
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16657:
	jmp LB_16639
LB_16655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16644
	btr r12,2
	clc
	jmp LB_16645
LB_16644:
	bts r12,2
	stc
LB_16645:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16642
	btr r12,1
	clc
	jmp LB_16643
LB_16642:
	bts r12,1
	stc
LB_16643:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16640
	btr r12,0
	clc
	jmp LB_16641
LB_16640:
	bts r12,0
	stc
LB_16641:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16635
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_16666
	btr r12,3
	jmp LB_16667
LB_16666:
	bts r12,3
LB_16667:
	mov r14,r8
	bt r12,2
	jc LB_16668
	btr r12,1
	jmp LB_16669
LB_16668:
	bts r12,1
LB_16669:
	mov r8,r13
	bt r12,0
	jc LB_16670
	btr r12,2
	jmp LB_16671
LB_16670:
	bts r12,2
LB_16671:
	mov r13,r9
	bt r12,3
	jc LB_16672
	btr r12,0
	jmp LB_16673
LB_16672:
	bts r12,0
LB_16673:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_14356 : %_14356
 ; {>  %_14354~0':(_lst)◂(_p10230) %_14355~1':_p10227 }
; _nil {  } ⊢ °1◂{  }
; _f10290 %_14355 ⊢ %_14357 : %_14357
 ; {>  %_14354~0':(_lst)◂(_p10230) %_14356~°1◂{  }:(_lst)◂(t5688'(0)) %_14355~1':_p10227 }
; _f10290 1' ⊢ °1◂1'
; _f10288 { %_14356 %_14357 } ⊢ %_14358 : %_14358
 ; {>  %_14354~0':(_lst)◂(_p10230) %_14357~°1◂1':_p10229 %_14356~°1◂{  }:(_lst)◂(t5688'(0)) }
; _f10288 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_14358 ⊢ %_14359 : %_14359
 ; {>  %_14358~°1◂{ °1◂{  } °1◂1' }:_p10228 %_14354~0':(_lst)◂(_p10230) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_14359
 ; {>  %_14354~0':(_lst)◂(_p10230) %_14359~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p10228) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_16622
	mov rdi,r13
	call dlt
LB_16622:
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
	jc LB_16627
	mov rsi,0
	bt r13,0
	jc LB_16627
	jmp LB_16628
LB_16627:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_16628:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_16625
	btr QWORD [rdi],0
	jmp LB_16626
LB_16625:
	bts QWORD [rdi],0
LB_16626:
	mov r13,r14
	bt r12,1
	jc LB_16633
	btr r12,0
	jmp LB_16634
LB_16633:
	bts r12,0
LB_16634:
	mov rsi,1
	bt r12,0
	jc LB_16631
	mov rsi,0
	bt r13,0
	jc LB_16631
	jmp LB_16632
LB_16631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_16632:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_16629
	btr QWORD [rdi],1
	jmp LB_16630
LB_16629:
	bts QWORD [rdi],1
LB_16630:
	mov rsi,1
	bt r12,3
	jc LB_16623
	mov rsi,0
	bt r9,0
	jc LB_16623
	jmp LB_16624
LB_16623:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16624:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16635:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16637
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16636
LB_16637:
	add rsp,8
	ret
LB_16639:
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
LB_16638:
	add rsp,48
	pop r14
LB_16636:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_16704
LB_16703:
	add r14,1
LB_16704:
	cmp r14,r10
	jge LB_16705
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16703
	cmp al,10
	jz LB_16703
	cmp al,32
	jz LB_16703
LB_16705:
	add r14,3
	cmp r14,r10
	jg LB_16708
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16708
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_16708
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_16708
	jmp LB_16709
LB_16708:
	jmp LB_16694
LB_16709:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_16711
LB_16710:
	add r14,1
LB_16711:
	cmp r14,r10
	jge LB_16712
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16710
	cmp al,10
	jz LB_16710
	cmp al,32
	jz LB_16710
LB_16712:
	push r10
	call NS_E_14117_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16713
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16714
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16714:
	jmp LB_16694
LB_16713:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_16717
LB_16716:
	add r14,1
LB_16717:
	cmp r14,r10
	jge LB_16718
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16716
	cmp al,10
	jz LB_16716
	cmp al,32
	jz LB_16716
LB_16718:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16719
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16720
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16720:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16721
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16721:
	jmp LB_16694
LB_16719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_16724
LB_16723:
	add r14,1
LB_16724:
	cmp r14,r10
	jge LB_16725
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16723
	cmp al,10
	jz LB_16723
	cmp al,32
	jz LB_16723
LB_16725:
	push r10
	call NS_E_14116_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16726
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16727
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16727:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16728
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16728:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16729
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16729:
	jmp LB_16694
LB_16726:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16701
	btr r12,3
	clc
	jmp LB_16702
LB_16701:
	bts r12,3
	stc
LB_16702:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16699
	btr r12,2
	clc
	jmp LB_16700
LB_16699:
	bts r12,2
	stc
LB_16700:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16697
	btr r12,1
	clc
	jmp LB_16698
LB_16697:
	bts r12,1
	stc
LB_16698:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16695
	btr r12,0
	clc
	jmp LB_16696
LB_16695:
	bts r12,0
	stc
LB_16696:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_16691
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_16731
	btr r12,4
	jmp LB_16732
LB_16731:
	bts r12,4
LB_16732:
	mov r8,r9
	bt r12,3
	jc LB_16733
	btr r12,2
	jmp LB_16734
LB_16733:
	bts r12,2
LB_16734:
	mov r9,r14
	bt r12,1
	jc LB_16735
	btr r12,3
	jmp LB_16736
LB_16735:
	bts r12,3
LB_16736:
	mov r14,r10
	bt r12,4
	jc LB_16737
	btr r12,1
	jmp LB_16738
LB_16737:
	bts r12,1
LB_16738:
	mov r10,r13
	bt r12,0
	jc LB_16739
	btr r12,4
	jmp LB_16740
LB_16739:
	bts r12,4
LB_16740:
	mov r13,r9
	bt r12,3
	jc LB_16741
	btr r12,0
	jmp LB_16742
LB_16741:
	bts r12,0
LB_16742:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_14363 : %_14363
 ; {>  %_14362~2':_p10228 %_14360~0':(_lst)◂(_p10230) %_14361~1':_p10227 }
; _nil {  } ⊢ °1◂{  }
; _f10290 %_14361 ⊢ %_14364 : %_14364
 ; {>  %_14362~2':_p10228 %_14360~0':(_lst)◂(_p10230) %_14361~1':_p10227 %_14363~°1◂{  }:(_lst)◂(t5698'(0)) }
; _f10290 1' ⊢ °1◂1'
; _f10287 { %_14363 %_14364 %_14362 } ⊢ %_14365 : %_14365
 ; {>  %_14362~2':_p10228 %_14360~0':(_lst)◂(_p10230) %_14363~°1◂{  }:(_lst)◂(t5698'(0)) %_14364~°1◂1':_p10229 }
; _f10287 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_14365 ⊢ %_14366 : %_14366
 ; {>  %_14360~0':(_lst)◂(_p10230) %_14365~°0◂{ °1◂{  } °1◂1' 2' }:_p10228 }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_14366
 ; {>  %_14366~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p10228) %_14360~0':(_lst)◂(_p10230) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_16674
	mov rdi,r13
	call dlt
LB_16674:
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
	jc LB_16679
	mov rsi,0
	bt r13,0
	jc LB_16679
	jmp LB_16680
LB_16679:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_16680:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_16677
	btr QWORD [rdi],0
	jmp LB_16678
LB_16677:
	bts QWORD [rdi],0
LB_16678:
	mov r13,r14
	bt r12,1
	jc LB_16685
	btr r12,0
	jmp LB_16686
LB_16685:
	bts r12,0
LB_16686:
	mov rsi,1
	bt r12,0
	jc LB_16683
	mov rsi,0
	bt r13,0
	jc LB_16683
	jmp LB_16684
LB_16683:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_16684:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_16681
	btr QWORD [rdi],1
	jmp LB_16682
LB_16681:
	bts QWORD [rdi],1
LB_16682:
	mov r13,r8
	bt r12,2
	jc LB_16689
	btr r12,0
	jmp LB_16690
LB_16689:
	bts r12,0
LB_16690:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,0
	jc LB_16687
	btr QWORD [rdi],2
	jmp LB_16688
LB_16687:
	bts QWORD [rdi],2
LB_16688:
	mov rsi,1
	bt r12,3
	jc LB_16675
	mov rsi,0
	bt r9,0
	jc LB_16675
	jmp LB_16676
LB_16675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16676:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16691:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16693
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16692
LB_16693:
	add rsp,8
	ret
LB_16694:
	add rsp,64
	pop r14
LB_16692:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14117:
NS_E_RDI_14117:
NS_E_14117_ETR_TBL:
NS_E_14117_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
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
	call NS_E_14118_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16764
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16756
LB_16764:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_16767
LB_16766:
	add r14,1
LB_16767:
	cmp r14,r10
	jge LB_16768
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16766
	cmp al,10
	jz LB_16766
	cmp al,32
	jz LB_16766
LB_16768:
	push r10
	call NS_E_14119_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16769
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16770
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16770:
	jmp LB_16756
LB_16769:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16759
	btr r12,1
	clc
	jmp LB_16760
LB_16759:
	bts r12,1
	stc
LB_16760:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16757
	btr r12,0
	clc
	jmp LB_16758
LB_16757:
	bts r12,0
	stc
LB_16758:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16753
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_14367 %_14368 } ⊢ %_14369 : %_14369
 ; {>  %_14367~0':_p10230 %_14368~1':(_lst)◂(_p10230) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14369 ⊢ %_14370 : %_14370
 ; {>  %_14369~°0◂{ 0' 1' }:(_lst)◂(_p10230) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14370
 ; {>  %_14370~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10230)) }
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
	jc LB_16747
	btr r12,2
	jmp LB_16748
LB_16747:
	bts r12,2
LB_16748:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16745
	btr QWORD [rdi],0
	jmp LB_16746
LB_16745:
	bts QWORD [rdi],0
LB_16746:
	mov r8,r14
	bt r12,1
	jc LB_16751
	btr r12,2
	jmp LB_16752
LB_16751:
	bts r12,2
LB_16752:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16749
	btr QWORD [rdi],1
	jmp LB_16750
LB_16749:
	bts QWORD [rdi],1
LB_16750:
	mov rsi,1
	bt r12,3
	jc LB_16743
	mov rsi,0
	bt r9,0
	jc LB_16743
	jmp LB_16744
LB_16743:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16744:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16753:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16755
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16754
LB_16755:
	add rsp,8
	ret
LB_16756:
	add rsp,32
	pop r14
LB_16754:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_16783
LB_16782:
	add r14,1
LB_16783:
	cmp r14,r10
	jge LB_16784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16782
	cmp al,32
	jz LB_16782
LB_16784:
	add r14,1
	cmp r14,r10
	jg LB_16787
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_16787
	jmp LB_16788
LB_16787:
	jmp LB_16777
LB_16788:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_16790
LB_16789:
	add r14,1
LB_16790:
	cmp r14,r10
	jge LB_16791
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16789
	cmp al,32
	jz LB_16789
LB_16791:
	add r14,1
	cmp r14,r10
	jg LB_16795
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_16795
	jmp LB_16796
LB_16795:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16793
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16793:
	jmp LB_16777
LB_16796:
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
	jc LB_16780
	btr r12,1
	clc
	jmp LB_16781
LB_16780:
	bts r12,1
	stc
LB_16781:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16778
	btr r12,0
	clc
	jmp LB_16779
LB_16778:
	bts r12,0
	stc
LB_16779:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16774
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_14371 : %_14371
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_14371 ⊢ %_14372 : %_14372
 ; {>  %_14371~°1◂{  }:(_lst)◂(t5711'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14372
 ; {>  %_14372~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5714'(0))) }
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
	jc LB_16772
	mov rsi,0
	bt r9,0
	jc LB_16772
	jmp LB_16773
LB_16772:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16773:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16774:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16776
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16775
LB_16776:
	add rsp,8
	ret
LB_16777:
	add rsp,32
	pop r14
LB_16775:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14118:
NS_E_RDI_14118:
NS_E_14118_ETR_TBL:
NS_E_14118_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_16853
LB_16852:
	add r14,1
LB_16853:
	cmp r14,r10
	jge LB_16854
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16852
	cmp al,10
	jz LB_16852
	cmp al,32
	jz LB_16852
LB_16854:
	push r10
	call NS_E_13244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16855
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16814
LB_16855:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_16858
LB_16857:
	add r14,1
LB_16858:
	cmp r14,r10
	jge LB_16859
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16857
	cmp al,10
	jz LB_16857
	cmp al,32
	jz LB_16857
LB_16859:
	add r14,3
	cmp r14,r10
	jg LB_16863
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16863
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_16863
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_16863
	jmp LB_16864
LB_16863:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16861
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16861:
	jmp LB_16814
LB_16864:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_16827
LB_16826:
	add r14,1
LB_16827:
	cmp r14,r10
	jge LB_16828
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16826
	cmp al,10
	jz LB_16826
	cmp al,32
	jz LB_16826
LB_16828:
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16829
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16830
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16830:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16831
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16831:
	jmp LB_16815
LB_16829:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_16834
LB_16833:
	add r14,1
LB_16834:
	cmp r14,r10
	jge LB_16835
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16833
	cmp al,10
	jz LB_16833
	cmp al,32
	jz LB_16833
LB_16835:
	add r14,3
	cmp r14,r10
	jg LB_16841
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16841
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_16841
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_16841
	jmp LB_16842
LB_16841:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16837
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16837:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16838
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16838:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16839
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16839:
	jmp LB_16815
LB_16842:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_16844
LB_16843:
	add r14,1
LB_16844:
	cmp r14,r10
	jge LB_16845
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16843
	cmp al,10
	jz LB_16843
	cmp al,32
	jz LB_16843
LB_16845:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16846
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_16847
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_16847:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16848
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16848:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16849
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16849:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16850:
	jmp LB_16815
LB_16846:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_16824
	btr r12,4
	clc
	jmp LB_16825
LB_16824:
	bts r12,4
	stc
LB_16825:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16822
	btr r12,3
	clc
	jmp LB_16823
LB_16822:
	bts r12,3
	stc
LB_16823:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16820
	btr r12,2
	clc
	jmp LB_16821
LB_16820:
	bts r12,2
	stc
LB_16821:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16818
	btr r12,1
	clc
	jmp LB_16819
LB_16818:
	bts r12,1
	stc
LB_16819:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16816
	btr r12,0
	clc
	jmp LB_16817
LB_16816:
	bts r12,0
	stc
LB_16817:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_16811
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_16865
	btr r12,5
	jmp LB_16866
LB_16865:
	bts r12,5
LB_16866:
	mov r8,r10
	bt r12,4
	jc LB_16867
	btr r12,2
	jmp LB_16868
LB_16867:
	bts r12,2
LB_16868:
	mov r10,r14
	bt r12,1
	jc LB_16869
	btr r12,4
	jmp LB_16870
LB_16869:
	bts r12,4
LB_16870:
	mov r14,r11
	bt r12,5
	jc LB_16871
	btr r12,1
	jmp LB_16872
LB_16871:
	bts r12,1
LB_16872:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f10291 { %_14373 %_14374 %_14375 } ⊢ %_14376 : %_14376
 ; {>  %_14374~1':_p10160 %_14375~2':_p10224 %_14373~0':_p10223 }
; _f10291 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_14376 ⊢ %_14377 : %_14377
 ; {>  %_14376~°0◂{ 0' 1' 2' }:_p10230 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_14377
 ; {>  %_14377~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p10230) }
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
	jc LB_16801
	btr r12,4
	jmp LB_16802
LB_16801:
	bts r12,4
LB_16802:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_16799
	btr QWORD [rdi],0
	jmp LB_16800
LB_16799:
	bts QWORD [rdi],0
LB_16800:
	mov r10,r14
	bt r12,1
	jc LB_16805
	btr r12,4
	jmp LB_16806
LB_16805:
	bts r12,4
LB_16806:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_16803
	btr QWORD [rdi],1
	jmp LB_16804
LB_16803:
	bts QWORD [rdi],1
LB_16804:
	mov r10,r8
	bt r12,2
	jc LB_16809
	btr r12,4
	jmp LB_16810
LB_16809:
	bts r12,4
LB_16810:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_16807
	btr QWORD [rdi],2
	jmp LB_16808
LB_16807:
	bts QWORD [rdi],2
LB_16808:
	mov rsi,1
	bt r12,3
	jc LB_16797
	mov rsi,0
	bt r9,0
	jc LB_16797
	jmp LB_16798
LB_16797:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16798:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16811:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16813
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16812
LB_16813:
	add rsp,8
	ret
LB_16815:
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
LB_16814:
	add rsp,80
	pop r14
LB_16812:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_16894
LB_16893:
	add r14,1
LB_16894:
	cmp r14,r10
	jge LB_16895
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16893
	cmp al,32
	jz LB_16893
LB_16895:
	push r10
	call NS_E_14120_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16896
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16886
LB_16896:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_16899
LB_16898:
	add r14,1
LB_16899:
	cmp r14,r10
	jge LB_16900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16898
	cmp al,32
	jz LB_16898
LB_16900:
	add r14,1
	cmp r14,r10
	jg LB_16904
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_16904
	jmp LB_16905
LB_16904:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16902:
	jmp LB_16886
LB_16905:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_16907
LB_16906:
	add r14,1
LB_16907:
	cmp r14,r10
	jge LB_16908
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16906
	cmp al,32
	jz LB_16906
LB_16908:
	push r10
	call NS_E_14120_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16909
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16910
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16910:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16911
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16911:
	jmp LB_16886
LB_16909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16891
	btr r12,2
	clc
	jmp LB_16892
LB_16891:
	bts r12,2
	stc
LB_16892:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16889
	btr r12,1
	clc
	jmp LB_16890
LB_16889:
	bts r12,1
	stc
LB_16890:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16887
	btr r12,0
	clc
	jmp LB_16888
LB_16887:
	bts r12,0
	stc
LB_16888:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16883
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_16913
	btr r12,3
	jmp LB_16914
LB_16913:
	bts r12,3
LB_16914:
	mov r14,r8
	bt r12,2
	jc LB_16915
	btr r12,1
	jmp LB_16916
LB_16915:
	bts r12,1
LB_16916:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f10292 { %_14378 %_14379 } ⊢ %_14380 : %_14380
 ; {>  %_14379~1':_p10231 %_14378~0':_p10231 }
; _f10292 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_14380 ⊢ %_14381 : %_14381
 ; {>  %_14380~°1◂{ 0' 1' }:_p10230 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_14381
 ; {>  %_14381~°0◂°1◂{ 0' 1' }:(_opn)◂(_p10230) }
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
	jc LB_16877
	btr r12,2
	jmp LB_16878
LB_16877:
	bts r12,2
LB_16878:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16875
	btr QWORD [rdi],0
	jmp LB_16876
LB_16875:
	bts QWORD [rdi],0
LB_16876:
	mov r8,r14
	bt r12,1
	jc LB_16881
	btr r12,2
	jmp LB_16882
LB_16881:
	bts r12,2
LB_16882:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16879
	btr QWORD [rdi],1
	jmp LB_16880
LB_16879:
	bts QWORD [rdi],1
LB_16880:
	mov rsi,1
	bt r12,3
	jc LB_16873
	mov rsi,0
	bt r9,0
	jc LB_16873
	jmp LB_16874
LB_16873:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16874:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16883:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16885
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16884
LB_16885:
	add rsp,8
	ret
LB_16886:
	add rsp,48
	pop r14
LB_16884:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14119:
NS_E_RDI_14119:
NS_E_14119_ETR_TBL:
NS_E_14119_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_16952
LB_16951:
	add r14,1
LB_16952:
	cmp r14,r10
	jge LB_16953
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16951
	cmp al,10
	jz LB_16951
	cmp al,32
	jz LB_16951
LB_16953:
	add r14,1
	cmp r14,r10
	jg LB_16956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_16956
	jmp LB_16957
LB_16956:
	jmp LB_16930
LB_16957:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_16939
LB_16938:
	add r14,1
LB_16939:
	cmp r14,r10
	jge LB_16940
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16938
	cmp al,10
	jz LB_16938
	cmp al,32
	jz LB_16938
LB_16940:
	push r10
	call NS_E_14118_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16941
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16942:
	jmp LB_16931
LB_16941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_16945
LB_16944:
	add r14,1
LB_16945:
	cmp r14,r10
	jge LB_16946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16944
	cmp al,10
	jz LB_16944
	cmp al,32
	jz LB_16944
LB_16946:
	push r10
	call NS_E_14119_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16947
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16948
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16948:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16949
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16949:
	jmp LB_16931
LB_16947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16936
	btr r12,2
	clc
	jmp LB_16937
LB_16936:
	bts r12,2
	stc
LB_16937:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16934
	btr r12,1
	clc
	jmp LB_16935
LB_16934:
	bts r12,1
	stc
LB_16935:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16932
	btr r12,0
	clc
	jmp LB_16933
LB_16932:
	bts r12,0
	stc
LB_16933:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16927
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_16958
	btr r12,3
	jmp LB_16959
LB_16958:
	bts r12,3
LB_16959:
	mov r14,r8
	bt r12,2
	jc LB_16960
	btr r12,1
	jmp LB_16961
LB_16960:
	bts r12,1
LB_16961:
	mov r8,r13
	bt r12,0
	jc LB_16962
	btr r12,2
	jmp LB_16963
LB_16962:
	bts r12,2
LB_16963:
	mov r13,r9
	bt r12,3
	jc LB_16964
	btr r12,0
	jmp LB_16965
LB_16964:
	bts r12,0
LB_16965:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_14382 %_14383 } ⊢ %_14384 : %_14384
 ; {>  %_14382~0':_p10230 %_14383~1':(_lst)◂(_p10230) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14384 ⊢ %_14385 : %_14385
 ; {>  %_14384~°0◂{ 0' 1' }:(_lst)◂(_p10230) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14385
 ; {>  %_14385~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p10230)) }
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
	jc LB_16921
	btr r12,2
	jmp LB_16922
LB_16921:
	bts r12,2
LB_16922:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_16919
	btr QWORD [rdi],0
	jmp LB_16920
LB_16919:
	bts QWORD [rdi],0
LB_16920:
	mov r8,r14
	bt r12,1
	jc LB_16925
	btr r12,2
	jmp LB_16926
LB_16925:
	bts r12,2
LB_16926:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_16923
	btr QWORD [rdi],1
	jmp LB_16924
LB_16923:
	bts QWORD [rdi],1
LB_16924:
	mov rsi,1
	bt r12,3
	jc LB_16917
	mov rsi,0
	bt r9,0
	jc LB_16917
	jmp LB_16918
LB_16917:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16918:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16927:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16929
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16928
LB_16929:
	add rsp,8
	ret
LB_16931:
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
LB_16930:
	add rsp,48
	pop r14
LB_16928:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_16977
LB_16976:
	add r14,1
LB_16977:
	cmp r14,r10
	jge LB_16978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16976
	cmp al,32
	jz LB_16976
LB_16978:
	add r14,1
	cmp r14,r10
	jg LB_16981
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_16981
	jmp LB_16982
LB_16981:
	jmp LB_16971
LB_16982:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_16984
LB_16983:
	add r14,1
LB_16984:
	cmp r14,r10
	jge LB_16985
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16983
	cmp al,32
	jz LB_16983
LB_16985:
	add r14,1
	cmp r14,r10
	jg LB_16989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_16989
	jmp LB_16990
LB_16989:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16987
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16987:
	jmp LB_16971
LB_16990:
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
	jc LB_16974
	btr r12,1
	clc
	jmp LB_16975
LB_16974:
	bts r12,1
	stc
LB_16975:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16972
	btr r12,0
	clc
	jmp LB_16973
LB_16972:
	bts r12,0
	stc
LB_16973:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16968
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_14386 : %_14386
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_14386 ⊢ %_14387 : %_14387
 ; {>  %_14386~°1◂{  }:(_lst)◂(t5735'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14387
 ; {>  %_14387~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5738'(0))) }
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
	jc LB_16966
	mov rsi,0
	bt r9,0
	jc LB_16966
	jmp LB_16967
LB_16966:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16967:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16968:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16970
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16969
LB_16970:
	add rsp,8
	ret
LB_16971:
	add rsp,32
	pop r14
LB_16969:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14120:
NS_E_RDI_14120:
NS_E_14120_ETR_TBL:
NS_E_14120_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17006
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16998
LB_17006:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_17014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_17014
	jmp LB_17015
LB_17014:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17012
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17012:
	jmp LB_16998
LB_17015:
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
	jc LB_17001
	btr r12,1
	clc
	jmp LB_17002
LB_17001:
	bts r12,1
	stc
LB_17002:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16999
	btr r12,0
	clc
	jmp LB_17000
LB_16999:
	bts r12,0
	stc
LB_17000:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16995
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f10294 %_14388 ⊢ %_14389 : %_14389
 ; {>  %_14388~0':_stg }
; _f10294 0' ⊢ °1◂0'
; _some %_14389 ⊢ %_14390 : %_14390
 ; {>  %_14389~°1◂0':_p10231 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14390
 ; {>  %_14390~°0◂°1◂0':(_opn)◂(_p10231) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16993
	btr r12,3
	jmp LB_16994
LB_16993:
	bts r12,3
LB_16994:
	mov rsi,1
	bt r12,3
	jc LB_16991
	mov rsi,0
	bt r9,0
	jc LB_16991
	jmp LB_16992
LB_16991:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16992:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16995:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16997
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16996
LB_16997:
	add rsp,8
	ret
LB_16998:
	add rsp,32
	pop r14
LB_16996:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_13115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17029
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17023
LB_17029:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17024
	btr r12,0
	clc
	jmp LB_17025
LB_17024:
	bts r12,0
	stc
LB_17025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17020
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10293 %_14391 ⊢ %_14392 : %_14392
 ; {>  %_14391~0':_p10226 }
; _f10293 0' ⊢ °0◂0'
; _some %_14392 ⊢ %_14393 : %_14393
 ; {>  %_14392~°0◂0':_p10231 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14393
 ; {>  %_14393~°0◂°0◂0':(_opn)◂(_p10231) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17018
	btr r12,3
	jmp LB_17019
LB_17018:
	bts r12,3
LB_17019:
	mov rsi,1
	bt r12,3
	jc LB_17016
	mov rsi,0
	bt r9,0
	jc LB_17016
	jmp LB_17017
LB_17016:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17017:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17020:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17022
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17021
LB_17022:
	add rsp,8
	ret
LB_17023:
	add rsp,16
	pop r14
LB_17021:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14121:
NS_E_RDI_14121:
NS_E_14121_ETR_TBL:
NS_E_14121_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_17052
LB_17051:
	add r14,1
LB_17052:
	cmp r14,r10
	jge LB_17053
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17051
	cmp al,10
	jz LB_17051
	cmp al,32
	jz LB_17051
LB_17053:
	add r14,1
	cmp r14,r10
	jg LB_17056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_17056
	jmp LB_17057
LB_17056:
	jmp LB_17042
LB_17057:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_17059
LB_17058:
	add r14,1
LB_17059:
	cmp r14,r10
	jge LB_17060
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17058
	cmp al,10
	jz LB_17058
	cmp al,32
	jz LB_17058
LB_17060:
	add r14,1
	cmp r14,r10
	jg LB_17064
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_17064
	jmp LB_17065
LB_17064:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17062:
	jmp LB_17042
LB_17065:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_17067
LB_17066:
	add r14,1
LB_17067:
	cmp r14,r10
	jge LB_17068
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17066
	cmp al,10
	jz LB_17066
	cmp al,32
	jz LB_17066
LB_17068:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17069
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17070
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17070:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17071
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17071:
	jmp LB_17042
LB_17069:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_17074
LB_17073:
	add r14,1
LB_17074:
	cmp r14,r10
	jge LB_17075
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17073
	cmp al,10
	jz LB_17073
	cmp al,32
	jz LB_17073
LB_17075:
	push r10
	call NS_E_14122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17076
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_17077
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_17077:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17078
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17078:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17079:
	jmp LB_17042
LB_17076:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_17049
	btr r12,3
	clc
	jmp LB_17050
LB_17049:
	bts r12,3
	stc
LB_17050:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_17047
	btr r12,2
	clc
	jmp LB_17048
LB_17047:
	bts r12,2
	stc
LB_17048:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17045
	btr r12,1
	clc
	jmp LB_17046
LB_17045:
	bts r12,1
	stc
LB_17046:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17043
	btr r12,0
	clc
	jmp LB_17044
LB_17043:
	bts r12,0
	stc
LB_17044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_17039
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_17081
	btr r12,4
	jmp LB_17082
LB_17081:
	bts r12,4
LB_17082:
	mov r14,r9
	bt r12,3
	jc LB_17083
	btr r12,1
	jmp LB_17084
LB_17083:
	bts r12,1
LB_17084:
	mov r9,r13
	bt r12,0
	jc LB_17085
	btr r12,3
	jmp LB_17086
LB_17085:
	bts r12,3
LB_17086:
	mov r13,r8
	bt r12,2
	jc LB_17087
	btr r12,0
	jmp LB_17088
LB_17087:
	bts r12,0
LB_17088:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_14394 %_14395 } ⊢ %_14396 : %_14396
 ; {>  %_14395~1':_p10212 %_14394~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_14396
 ; {>  %_14396~°0◂{ 0' 1' }:(_opn)◂({ _stg _p10212 }) }
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
	jc LB_17033
	btr r12,2
	jmp LB_17034
LB_17033:
	bts r12,2
LB_17034:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_17031
	btr QWORD [rdi],0
	jmp LB_17032
LB_17031:
	bts QWORD [rdi],0
LB_17032:
	mov r8,r14
	bt r12,1
	jc LB_17037
	btr r12,2
	jmp LB_17038
LB_17037:
	bts r12,2
LB_17038:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_17035
	btr QWORD [rdi],1
	jmp LB_17036
LB_17035:
	bts QWORD [rdi],1
LB_17036:
	mov r8,0
	bts r12,2
	ret
LB_17039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17040
LB_17041:
	add rsp,8
	ret
LB_17042:
	add rsp,64
	pop r14
LB_17040:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14122:
NS_E_RDI_14122:
NS_E_14122_ETR_TBL:
NS_E_14122_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_17100
LB_17099:
	add r14,1
LB_17100:
	cmp r14,r10
	jge LB_17101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17099
	cmp al,10
	jz LB_17099
	cmp al,32
	jz LB_17099
LB_17101:
	push r10
	call NS_E_14123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17102
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17096
LB_17102:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17097
	btr r12,0
	clc
	jmp LB_17098
LB_17097:
	bts r12,0
	stc
LB_17098:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17093
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10249 %_14397 ⊢ %_14398 : %_14398
 ; {>  %_14397~0':_p10214 }
; _f10249 0' ⊢ °1◂0'
; _some %_14398 ⊢ %_14399 : %_14399
 ; {>  %_14398~°1◂0':_p10212 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14399
 ; {>  %_14399~°0◂°1◂0':(_opn)◂(_p10212) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17091
	btr r12,3
	jmp LB_17092
LB_17091:
	bts r12,3
LB_17092:
	mov rsi,1
	bt r12,3
	jc LB_17089
	mov rsi,0
	bt r9,0
	jc LB_17089
	jmp LB_17090
LB_17089:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17090:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17093:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17095
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17094
LB_17095:
	add rsp,8
	ret
LB_17096:
	add rsp,16
	pop r14
LB_17094:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_17115
LB_17114:
	add r14,1
LB_17115:
	cmp r14,r10
	jge LB_17116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17114
	cmp al,10
	jz LB_17114
	cmp al,32
	jz LB_17114
LB_17116:
	push r10
	call NS_E_14131_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17117
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17111
LB_17117:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17112
	btr r12,0
	clc
	jmp LB_17113
LB_17112:
	bts r12,0
	stc
LB_17113:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17108
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10248 %_14400 ⊢ %_14401 : %_14401
 ; {>  %_14400~0':_p10213 }
; _f10248 0' ⊢ °0◂0'
; _some %_14401 ⊢ %_14402 : %_14402
 ; {>  %_14401~°0◂0':_p10212 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14402
 ; {>  %_14402~°0◂°0◂0':(_opn)◂(_p10212) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17106
	btr r12,3
	jmp LB_17107
LB_17106:
	bts r12,3
LB_17107:
	mov rsi,1
	bt r12,3
	jc LB_17104
	mov rsi,0
	bt r9,0
	jc LB_17104
	jmp LB_17105
LB_17104:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17105:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17108:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17110
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17109
LB_17110:
	add rsp,8
	ret
LB_17111:
	add rsp,16
	pop r14
LB_17109:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14123:
NS_E_RDI_14123:
NS_E_14123_ETR_TBL:
NS_E_14123_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_17168
LB_17167:
	add r14,1
LB_17168:
	cmp r14,r10
	jge LB_17169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17167
	cmp al,10
	jz LB_17167
	cmp al,32
	jz LB_17167
LB_17169:
	push r10
	call NS_E_14130_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17170
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17146
LB_17170:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_17155
LB_17154:
	add r14,1
LB_17155:
	cmp r14,r10
	jge LB_17156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17154
	cmp al,10
	jz LB_17154
	cmp al,32
	jz LB_17154
LB_17156:
	push r10
	call NS_E_14125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17157
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17158
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17158:
	jmp LB_17147
LB_17157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_17161
LB_17160:
	add r14,1
LB_17161:
	cmp r14,r10
	jge LB_17162
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17160
	cmp al,10
	jz LB_17160
	cmp al,32
	jz LB_17160
LB_17162:
	push r10
	call NS_E_14124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17163
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17164
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17164:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17165
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17165:
	jmp LB_17147
LB_17163:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_17152
	btr r12,2
	clc
	jmp LB_17153
LB_17152:
	bts r12,2
	stc
LB_17153:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17150
	btr r12,1
	clc
	jmp LB_17151
LB_17150:
	bts r12,1
	stc
LB_17151:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17148
	btr r12,0
	clc
	jmp LB_17149
LB_17148:
	bts r12,0
	stc
LB_17149:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_17143
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_17172
	btr r12,5
	jmp LB_17173
LB_17172:
	bts r12,5
LB_17173:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_17176
	btr r12,6
	clc
	jmp LB_17177
LB_17176:
	bts r12,6
	stc
LB_17177:
	mov r8,rcx
	bt r12,6
	jc LB_17174
	btr r12,2
	jmp LB_17175
LB_17174:
	bts r12,2
LB_17175:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_17180
	btr r12,6
	clc
	jmp LB_17181
LB_17180:
	bts r12,6
	stc
LB_17181:
	mov r9,rcx
	bt r12,6
	jc LB_17178
	btr r12,3
	jmp LB_17179
LB_17178:
	bts r12,3
LB_17179:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_17184
	btr r12,6
	clc
	jmp LB_17185
LB_17184:
	bts r12,6
	stc
LB_17185:
	mov r10,rcx
	bt r12,6
	jc LB_17182
	btr r12,4
	jmp LB_17183
LB_17182:
	bts r12,4
LB_17183:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f10253 { %_14405 %_14406 %_14403 %_14404 %_14407 } ⊢ %_14408 : %_14408
 ; {>  %_14403~0':_p10215 %_14405~2':_p10224 %_14407~4':(_opn)◂(_p10214) %_14406~3':_p10227 %_14404~1':_p10216 }
; _f10253 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_14408 ⊢ %_14409 : %_14409
 ; {>  %_14408~°1◂{ 2' 3' 0' 1' 4' }:_p10214 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_14409
 ; {>  %_14409~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p10214) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_17119
	btr r12,5
	jmp LB_17120
LB_17119:
	bts r12,5
LB_17120:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_17125
	btr r12,6
	jmp LB_17126
LB_17125:
	bts r12,6
LB_17126:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_17123
	btr QWORD [rdi],0
	jmp LB_17124
LB_17123:
	bts QWORD [rdi],0
LB_17124:
	mov rcx,r11
	bt r12,5
	jc LB_17129
	btr r12,6
	jmp LB_17130
LB_17129:
	bts r12,6
LB_17130:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_17127
	btr QWORD [rdi],1
	jmp LB_17128
LB_17127:
	bts QWORD [rdi],1
LB_17128:
	mov rcx,r13
	bt r12,0
	jc LB_17133
	btr r12,6
	jmp LB_17134
LB_17133:
	bts r12,6
LB_17134:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_17131
	btr QWORD [rdi],2
	jmp LB_17132
LB_17131:
	bts QWORD [rdi],2
LB_17132:
	mov rcx,r14
	bt r12,1
	jc LB_17137
	btr r12,6
	jmp LB_17138
LB_17137:
	bts r12,6
LB_17138:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_17135
	btr QWORD [rdi],3
	jmp LB_17136
LB_17135:
	bts QWORD [rdi],3
LB_17136:
	mov rcx,r10
	bt r12,4
	jc LB_17141
	btr r12,6
	jmp LB_17142
LB_17141:
	bts r12,6
LB_17142:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_17139
	btr QWORD [rdi],4
	jmp LB_17140
LB_17139:
	bts QWORD [rdi],4
LB_17140:
	mov rsi,1
	bt r12,3
	jc LB_17121
	mov rsi,0
	bt r9,0
	jc LB_17121
	jmp LB_17122
LB_17121:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17122:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17143:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17145
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17144
LB_17145:
	add rsp,8
	ret
LB_17147:
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
LB_17146:
	add rsp,48
	pop r14
LB_17144:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_17227
LB_17226:
	add r14,1
LB_17227:
	cmp r14,r10
	jge LB_17228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17226
	cmp al,10
	jz LB_17226
	cmp al,32
	jz LB_17226
LB_17228:
	push r10
	call NS_E_14129_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17229
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17217
LB_17229:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_17232
LB_17231:
	add r14,1
LB_17232:
	cmp r14,r10
	jge LB_17233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17231
	cmp al,10
	jz LB_17231
	cmp al,32
	jz LB_17231
LB_17233:
	push r10
	call NS_E_14125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17234
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17235
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17235:
	jmp LB_17217
LB_17234:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_17238
LB_17237:
	add r14,1
LB_17238:
	cmp r14,r10
	jge LB_17239
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17237
	cmp al,10
	jz LB_17237
	cmp al,32
	jz LB_17237
LB_17239:
	push r10
	call NS_E_14124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17240
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17241
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17241:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17242:
	jmp LB_17217
LB_17240:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_17245
LB_17244:
	add r14,1
LB_17245:
	cmp r14,r10
	jge LB_17246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17244
	cmp al,10
	jz LB_17244
	cmp al,32
	jz LB_17244
LB_17246:
	push r10
	call NS_E_14123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17247
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_17248
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_17248:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17249
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17249:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17250
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17250:
	jmp LB_17217
LB_17247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_17224
	btr r12,3
	clc
	jmp LB_17225
LB_17224:
	bts r12,3
	stc
LB_17225:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_17222
	btr r12,2
	clc
	jmp LB_17223
LB_17222:
	bts r12,2
	stc
LB_17223:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17220
	btr r12,1
	clc
	jmp LB_17221
LB_17220:
	bts r12,1
	stc
LB_17221:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17218
	btr r12,0
	clc
	jmp LB_17219
LB_17218:
	bts r12,0
	stc
LB_17219:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_17214
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_17252
	btr r12,5
	jmp LB_17253
LB_17252:
	bts r12,5
LB_17253:
	mov rcx,r8
	bt r12,2
	jc LB_17254
	btr r12,6
	jmp LB_17255
LB_17254:
	bts r12,6
LB_17255:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_17258
	btr r12,7
	clc
	jmp LB_17259
LB_17258:
	bts r12,7
	stc
LB_17259:
	mov r8,rdx
	bt r12,7
	jc LB_17256
	btr r12,2
	jmp LB_17257
LB_17256:
	bts r12,2
LB_17257:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_17262
	btr r12,7
	clc
	jmp LB_17263
LB_17262:
	bts r12,7
	stc
LB_17263:
	mov r9,rdx
	bt r12,7
	jc LB_17260
	btr r12,3
	jmp LB_17261
LB_17260:
	bts r12,3
LB_17261:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_17266
	btr r12,7
	clc
	jmp LB_17267
LB_17266:
	bts r12,7
	stc
LB_17267:
	mov r10,rdx
	bt r12,7
	jc LB_17264
	btr r12,4
	jmp LB_17265
LB_17264:
	bts r12,4
LB_17265:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f10252 { %_14412 %_14413 %_14410 %_14411 %_14414 %_14415 } ⊢ %_14416 : %_14416
 ; {>  %_14411~1':_p10216 %_14415~5':_p10214 %_14412~2':_p10224 %_14410~0':_p10215 %_14414~4':(_opn)◂(_p10214) %_14413~3':_p10227 }
; _f10252 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_14416 ⊢ %_14417 : %_14417
 ; {>  %_14416~°0◂{ 2' 3' 0' 1' 4' 5' }:_p10214 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_14417
 ; {>  %_14417~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p10214) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_17186
	btr r12,6
	jmp LB_17187
LB_17186:
	bts r12,6
LB_17187:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_17192
	btr r12,7
	jmp LB_17193
LB_17192:
	bts r12,7
LB_17193:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_17190
	btr QWORD [rdi],0
	jmp LB_17191
LB_17190:
	bts QWORD [rdi],0
LB_17191:
	mov rdx,rcx
	bt r12,6
	jc LB_17196
	btr r12,7
	jmp LB_17197
LB_17196:
	bts r12,7
LB_17197:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_17194
	btr QWORD [rdi],1
	jmp LB_17195
LB_17194:
	bts QWORD [rdi],1
LB_17195:
	mov rdx,r13
	bt r12,0
	jc LB_17200
	btr r12,7
	jmp LB_17201
LB_17200:
	bts r12,7
LB_17201:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,7
	jc LB_17198
	btr QWORD [rdi],2
	jmp LB_17199
LB_17198:
	bts QWORD [rdi],2
LB_17199:
	mov rdx,r14
	bt r12,1
	jc LB_17204
	btr r12,7
	jmp LB_17205
LB_17204:
	bts r12,7
LB_17205:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,7
	jc LB_17202
	btr QWORD [rdi],3
	jmp LB_17203
LB_17202:
	bts QWORD [rdi],3
LB_17203:
	mov rdx,r10
	bt r12,4
	jc LB_17208
	btr r12,7
	jmp LB_17209
LB_17208:
	bts r12,7
LB_17209:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,7
	jc LB_17206
	btr QWORD [rdi],4
	jmp LB_17207
LB_17206:
	bts QWORD [rdi],4
LB_17207:
	mov rdx,r11
	bt r12,5
	jc LB_17212
	btr r12,7
	jmp LB_17213
LB_17212:
	bts r12,7
LB_17213:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*5],rsi
	bt r12,7
	jc LB_17210
	btr QWORD [rdi],5
	jmp LB_17211
LB_17210:
	bts QWORD [rdi],5
LB_17211:
	mov rsi,1
	bt r12,3
	jc LB_17188
	mov rsi,0
	bt r9,0
	jc LB_17188
	jmp LB_17189
LB_17188:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17189:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17214:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17216
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17215
LB_17216:
	add rsp,8
	ret
LB_17217:
	add rsp,64
	pop r14
LB_17215:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14124:
NS_E_RDI_14124:
NS_E_14124_ETR_TBL:
NS_E_14124_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_17322
LB_17321:
	add r14,1
LB_17322:
	cmp r14,r10
	jge LB_17323
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17321
	cmp al,10
	jz LB_17321
	cmp al,32
	jz LB_17321
LB_17323:
	add r14,1
	cmp r14,r10
	jg LB_17326
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_17326
	jmp LB_17327
LB_17326:
	jmp LB_17285
LB_17327:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_17329
LB_17328:
	add r14,1
LB_17329:
	cmp r14,r10
	jge LB_17330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17328
	cmp al,10
	jz LB_17328
	cmp al,32
	jz LB_17328
LB_17330:
	add r14,3
	cmp r14,r10
	jg LB_17334
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_17334
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_17334
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_17334
	jmp LB_17335
LB_17334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17332
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17332:
	jmp LB_17285
LB_17335:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_17298
LB_17297:
	add r14,1
LB_17298:
	cmp r14,r10
	jge LB_17299
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17297
	cmp al,10
	jz LB_17297
	cmp al,32
	jz LB_17297
LB_17299:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17300
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17301
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17301:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17302
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17302:
	jmp LB_17286
LB_17300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_17305
LB_17304:
	add r14,1
LB_17305:
	cmp r14,r10
	jge LB_17306
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17304
	cmp al,10
	jz LB_17304
	cmp al,32
	jz LB_17304
LB_17306:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17307
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_17308
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_17308:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17309
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17309:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17310:
	jmp LB_17286
LB_17307:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_17313
LB_17312:
	add r14,1
LB_17313:
	cmp r14,r10
	jge LB_17314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17312
	cmp al,10
	jz LB_17312
	cmp al,32
	jz LB_17312
LB_17314:
	push r10
	call NS_E_14123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17315
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_17316
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_17316:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_17317
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_17317:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17318
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17318:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17319
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17319:
	jmp LB_17286
LB_17315:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_17295
	btr r12,4
	clc
	jmp LB_17296
LB_17295:
	bts r12,4
	stc
LB_17296:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_17293
	btr r12,3
	clc
	jmp LB_17294
LB_17293:
	bts r12,3
	stc
LB_17294:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_17291
	btr r12,2
	clc
	jmp LB_17292
LB_17291:
	bts r12,2
	stc
LB_17292:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17289
	btr r12,1
	clc
	jmp LB_17290
LB_17289:
	bts r12,1
	stc
LB_17290:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17287
	btr r12,0
	clc
	jmp LB_17288
LB_17287:
	bts r12,0
	stc
LB_17288:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_17282
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_17336
	btr r12,5
	jmp LB_17337
LB_17336:
	bts r12,5
LB_17337:
	mov r8,r10
	bt r12,4
	jc LB_17338
	btr r12,2
	jmp LB_17339
LB_17338:
	bts r12,2
LB_17339:
	mov r10,r14
	bt r12,1
	jc LB_17340
	btr r12,4
	jmp LB_17341
LB_17340:
	bts r12,4
LB_17341:
	mov r14,r9
	bt r12,3
	jc LB_17342
	btr r12,1
	jmp LB_17343
LB_17342:
	bts r12,1
LB_17343:
	mov r9,r13
	bt r12,0
	jc LB_17344
	btr r12,3
	jmp LB_17345
LB_17344:
	bts r12,3
LB_17345:
	mov r13,r11
	bt r12,5
	jc LB_17346
	btr r12,0
	jmp LB_17347
LB_17346:
	bts r12,0
LB_17347:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14420 ⊢ %_14421 : %_14421
 ; {>  %_14419~1':_p10227 %_14418~0':_p10224 %_14420~2':_p10214 }
; _some 2' ⊢ °0◂2'
; _some { %_14418 %_14419 %_14421 } ⊢ %_14422 : %_14422
 ; {>  %_14419~1':_p10227 %_14418~0':_p10224 %_14421~°0◂2':(_opn)◂(_p10214) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_14422
 ; {>  %_14422~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p10224 _p10227 (_opn)◂(_p10214) }) }
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
	jc LB_17270
	btr r12,4
	jmp LB_17271
LB_17270:
	bts r12,4
LB_17271:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_17268
	btr QWORD [rdi],0
	jmp LB_17269
LB_17268:
	bts QWORD [rdi],0
LB_17269:
	mov r10,r14
	bt r12,1
	jc LB_17274
	btr r12,4
	jmp LB_17275
LB_17274:
	bts r12,4
LB_17275:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_17272
	btr QWORD [rdi],1
	jmp LB_17273
LB_17272:
	bts QWORD [rdi],1
LB_17273:
	mov r10,r8
	bt r12,2
	jc LB_17280
	btr r12,4
	jmp LB_17281
LB_17280:
	bts r12,4
LB_17281:
	mov rsi,1
	bt r12,4
	jc LB_17278
	mov rsi,0
	bt r10,0
	jc LB_17278
	jmp LB_17279
LB_17278:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_17279:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_17276
	btr QWORD [rdi],2
	jmp LB_17277
LB_17276:
	bts QWORD [rdi],2
LB_17277:
	mov r8,0
	bts r12,2
	ret
LB_17282:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17284
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17283
LB_17284:
	add rsp,8
	ret
LB_17286:
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
LB_17285:
	add rsp,80
	pop r14
LB_17283:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_17385
LB_17384:
	add r14,1
LB_17385:
	cmp r14,r10
	jge LB_17386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17384
	cmp al,10
	jz LB_17384
	cmp al,32
	jz LB_17384
LB_17386:
	add r14,3
	cmp r14,r10
	jg LB_17389
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_17389
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_17389
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_17389
	jmp LB_17390
LB_17389:
	jmp LB_17363
LB_17390:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_17372
LB_17371:
	add r14,1
LB_17372:
	cmp r14,r10
	jge LB_17373
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17371
	cmp al,10
	jz LB_17371
	cmp al,32
	jz LB_17371
LB_17373:
	push r10
	call NS_E_13508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17374
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17375
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17375:
	jmp LB_17364
LB_17374:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_17378
LB_17377:
	add r14,1
LB_17378:
	cmp r14,r10
	jge LB_17379
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17377
	cmp al,10
	jz LB_17377
	cmp al,32
	jz LB_17377
LB_17379:
	push r10
	call NS_E_14107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17380
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17381
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17381:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17382
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17382:
	jmp LB_17364
LB_17380:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_17369
	btr r12,2
	clc
	jmp LB_17370
LB_17369:
	bts r12,2
	stc
LB_17370:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17367
	btr r12,1
	clc
	jmp LB_17368
LB_17367:
	bts r12,1
	stc
LB_17368:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17365
	btr r12,0
	clc
	jmp LB_17366
LB_17365:
	bts r12,0
	stc
LB_17366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_17360
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_17391
	btr r12,3
	jmp LB_17392
LB_17391:
	bts r12,3
LB_17392:
	mov r14,r8
	bt r12,2
	jc LB_17393
	btr r12,1
	jmp LB_17394
LB_17393:
	bts r12,1
LB_17394:
	mov r8,r13
	bt r12,0
	jc LB_17395
	btr r12,2
	jmp LB_17396
LB_17395:
	bts r12,2
LB_17396:
	mov r13,r9
	bt r12,3
	jc LB_17397
	btr r12,0
	jmp LB_17398
LB_17397:
	bts r12,0
LB_17398:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_14425 : %_14425
 ; {>  %_14423~0':_p10224 %_14424~1':_p10227 }
; _none {  } ⊢ °1◂{  }
; _some { %_14423 %_14424 %_14425 } ⊢ %_14426 : %_14426
 ; {>  %_14423~0':_p10224 %_14425~°1◂{  }:(_opn)◂(t5788'(0)) %_14424~1':_p10227 }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_14426
 ; {>  %_14426~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p10224 _p10227 (_opn)◂(t5791'(0)) }) }
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
	jc LB_17350
	btr r12,2
	jmp LB_17351
LB_17350:
	bts r12,2
LB_17351:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_17348
	btr QWORD [rdi],0
	jmp LB_17349
LB_17348:
	bts QWORD [rdi],0
LB_17349:
	mov r8,r14
	bt r12,1
	jc LB_17354
	btr r12,2
	jmp LB_17355
LB_17354:
	bts r12,2
LB_17355:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_17352
	btr QWORD [rdi],1
	jmp LB_17353
LB_17352:
	bts QWORD [rdi],1
LB_17353:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_17358
	mov rsi,0
	bt r8,0
	jc LB_17358
	jmp LB_17359
LB_17358:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_17359:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_17356
	btr QWORD [rdi],2
	jmp LB_17357
LB_17356:
	bts QWORD [rdi],2
LB_17357:
	mov r8,0
	bts r12,2
	ret
LB_17360:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17362
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17361
LB_17362:
	add rsp,8
	ret
LB_17364:
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
LB_17363:
	add rsp,48
	pop r14
LB_17361:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14125:
NS_E_RDI_14125:
NS_E_14125_ETR_TBL:
NS_E_14125_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_17419
LB_17418:
	add r14,1
LB_17419:
	cmp r14,r10
	jge LB_17420
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17418
	cmp al,10
	jz LB_17418
	cmp al,32
	jz LB_17418
LB_17420:
	add r14,2
	cmp r14,r10
	jg LB_17423
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_17423
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_17423
	jmp LB_17424
LB_17423:
	jmp LB_17406
LB_17424:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_17413
LB_17412:
	add r14,1
LB_17413:
	cmp r14,r10
	jge LB_17414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17412
	cmp al,10
	jz LB_17412
	cmp al,32
	jz LB_17412
LB_17414:
	push r10
	call NS_E_14126_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17415
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17416:
	jmp LB_17407
LB_17415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17410
	btr r12,1
	clc
	jmp LB_17411
LB_17410:
	bts r12,1
	stc
LB_17411:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17408
	btr r12,0
	clc
	jmp LB_17409
LB_17408:
	bts r12,0
	stc
LB_17409:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_17403
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_17425
	btr r12,2
	jmp LB_17426
LB_17425:
	bts r12,2
LB_17426:
	mov r13,r14
	bt r12,1
	jc LB_17427
	btr r12,0
	jmp LB_17428
LB_17427:
	bts r12,0
LB_17428:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10257 %_14427 ⊢ %_14428 : %_14428
 ; {>  %_14427~0':_p10217 }
; _f10257 0' ⊢ °0◂0'
; _some %_14428 ⊢ %_14429 : %_14429
 ; {>  %_14428~°0◂0':_p10216 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14429
 ; {>  %_14429~°0◂°0◂0':(_opn)◂(_p10216) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17401
	btr r12,3
	jmp LB_17402
LB_17401:
	bts r12,3
LB_17402:
	mov rsi,1
	bt r12,3
	jc LB_17399
	mov rsi,0
	bt r9,0
	jc LB_17399
	jmp LB_17400
LB_17399:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17400:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17403:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17405
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17404
LB_17405:
	add rsp,8
	ret
LB_17407:
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
LB_17406:
	add rsp,32
	pop r14
LB_17404:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_17448
LB_17447:
	add r14,1
LB_17448:
	cmp r14,r10
	jge LB_17449
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17447
	cmp al,10
	jz LB_17447
	cmp al,32
	jz LB_17447
LB_17449:
	push r10
	call NS_E_14127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17450
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17442
LB_17450:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_17453
LB_17452:
	add r14,1
LB_17453:
	cmp r14,r10
	jge LB_17454
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17452
	cmp al,10
	jz LB_17452
	cmp al,32
	jz LB_17452
LB_17454:
	push r10
	call NS_E_14125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17455
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17456
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17456:
	jmp LB_17442
LB_17455:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17445
	btr r12,1
	clc
	jmp LB_17446
LB_17445:
	bts r12,1
	stc
LB_17446:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17443
	btr r12,0
	clc
	jmp LB_17444
LB_17443:
	bts r12,0
	stc
LB_17444:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_17439
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10258 { %_14430 %_14431 } ⊢ %_14432 : %_14432
 ; {>  %_14431~1':_p10216 %_14430~0':_p10218 }
; _f10258 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_14432 ⊢ %_14433 : %_14433
 ; {>  %_14432~°1◂{ 0' 1' }:_p10216 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_14433
 ; {>  %_14433~°0◂°1◂{ 0' 1' }:(_opn)◂(_p10216) }
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
	jc LB_17433
	btr r12,2
	jmp LB_17434
LB_17433:
	bts r12,2
LB_17434:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_17431
	btr QWORD [rdi],0
	jmp LB_17432
LB_17431:
	bts QWORD [rdi],0
LB_17432:
	mov r8,r14
	bt r12,1
	jc LB_17437
	btr r12,2
	jmp LB_17438
LB_17437:
	bts r12,2
LB_17438:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_17435
	btr QWORD [rdi],1
	jmp LB_17436
LB_17435:
	bts QWORD [rdi],1
LB_17436:
	mov rsi,1
	bt r12,3
	jc LB_17429
	mov rsi,0
	bt r9,0
	jc LB_17429
	jmp LB_17430
LB_17429:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17430:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17439:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17441
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17440
LB_17441:
	add rsp,8
	ret
LB_17442:
	add rsp,32
	pop r14
LB_17440:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_17460
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f10259 {  } ⊢ %_14434 : %_14434
 ; {>  }
; _f10259 {  } ⊢ °2◂{  }
; _some %_14434 ⊢ %_14435 : %_14435
 ; {>  %_14434~°2◂{  }:_p10216 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_14435
 ; {>  %_14435~°0◂°2◂{  }:(_opn)◂(_p10216) }
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
	jc LB_17458
	mov rsi,0
	bt r9,0
	jc LB_17458
	jmp LB_17459
LB_17458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17459:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17460:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17462
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17461
LB_17462:
	add rsp,8
	ret
LB_17463:
	add rsp,0
	pop r14
LB_17461:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14126:
NS_E_RDI_14126:
NS_E_14126_ETR_TBL:
NS_E_14126_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_17483
LB_17482:
	add r14,1
LB_17483:
	cmp r14,r10
	jge LB_17484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17482
	cmp al,10
	jz LB_17482
	cmp al,32
	jz LB_17482
LB_17484:
	push r10
	call NS_E_14127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17485
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17477
LB_17485:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_17488
LB_17487:
	add r14,1
LB_17488:
	cmp r14,r10
	jge LB_17489
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17487
	cmp al,10
	jz LB_17487
	cmp al,32
	jz LB_17487
LB_17489:
	push r10
	call NS_E_14126_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17490
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17491
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17491:
	jmp LB_17477
LB_17490:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17480
	btr r12,1
	clc
	jmp LB_17481
LB_17480:
	bts r12,1
	stc
LB_17481:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17478
	btr r12,0
	clc
	jmp LB_17479
LB_17478:
	bts r12,0
	stc
LB_17479:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_17474
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f10260 { %_14436 %_14437 } ⊢ %_14438 : %_14438
 ; {>  %_14436~0':_p10218 %_14437~1':_p10217 }
; _f10260 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_14438 ⊢ %_14439 : %_14439
 ; {>  %_14438~°0◂{ 0' 1' }:_p10217 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_14439
 ; {>  %_14439~°0◂°0◂{ 0' 1' }:(_opn)◂(_p10217) }
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
	jc LB_17468
	btr r12,2
	jmp LB_17469
LB_17468:
	bts r12,2
LB_17469:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_17466
	btr QWORD [rdi],0
	jmp LB_17467
LB_17466:
	bts QWORD [rdi],0
LB_17467:
	mov r8,r14
	bt r12,1
	jc LB_17472
	btr r12,2
	jmp LB_17473
LB_17472:
	bts r12,2
LB_17473:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_17470
	btr QWORD [rdi],1
	jmp LB_17471
LB_17470:
	bts QWORD [rdi],1
LB_17471:
	mov rsi,1
	bt r12,3
	jc LB_17464
	mov rsi,0
	bt r9,0
	jc LB_17464
	jmp LB_17465
LB_17464:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17465:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17474:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17476
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17475
LB_17476:
	add rsp,8
	ret
LB_17477:
	add rsp,32
	pop r14
LB_17475:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_17495
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f10261 {  } ⊢ %_14440 : %_14440
 ; {>  }
; _f10261 {  } ⊢ °1◂{  }
; _some %_14440 ⊢ %_14441 : %_14441
 ; {>  %_14440~°1◂{  }:_p10217 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14441
 ; {>  %_14441~°0◂°1◂{  }:(_opn)◂(_p10217) }
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
	jc LB_17493
	mov rsi,0
	bt r9,0
	jc LB_17493
	jmp LB_17494
LB_17493:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17494:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17495:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17497
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17496
LB_17497:
	add rsp,8
	ret
LB_17498:
	add rsp,0
	pop r14
LB_17496:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14127:
NS_E_RDI_14127:
NS_E_14127_ETR_TBL:
NS_E_14127_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_17514
LB_17513:
	add r14,1
LB_17514:
	cmp r14,r10
	jge LB_17515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17513
	cmp al,10
	jz LB_17513
	cmp al,32
	jz LB_17513
LB_17515:
	add r14,3
	cmp r14,r10
	jg LB_17518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_17518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_17518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_17518
	jmp LB_17519
LB_17518:
	jmp LB_17506
LB_17519:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_17521
LB_17520:
	add r14,1
LB_17521:
	cmp r14,r10
	jge LB_17522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17520
	cmp al,10
	jz LB_17520
	cmp al,32
	jz LB_17520
LB_17522:
	push r10
	call NS_E_14128_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17523
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17524:
	jmp LB_17506
LB_17523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_17527
LB_17526:
	add r14,1
LB_17527:
	cmp r14,r10
	jge LB_17528
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17526
	cmp al,10
	jz LB_17526
	cmp al,32
	jz LB_17526
LB_17528:
	add r14,3
	cmp r14,r10
	jg LB_17533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_17533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_17533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_17533
	jmp LB_17534
LB_17533:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17530
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17530:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17531:
	jmp LB_17506
LB_17534:
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
	jc LB_17511
	btr r12,2
	clc
	jmp LB_17512
LB_17511:
	bts r12,2
	stc
LB_17512:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17509
	btr r12,1
	clc
	jmp LB_17510
LB_17509:
	bts r12,1
	stc
LB_17510:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17507
	btr r12,0
	clc
	jmp LB_17508
LB_17507:
	bts r12,0
	stc
LB_17508:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_17503
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_17535
	btr r12,3
	jmp LB_17536
LB_17535:
	bts r12,3
LB_17536:
	mov r13,r14
	bt r12,1
	jc LB_17537
	btr r12,0
	jmp LB_17538
LB_17537:
	bts r12,0
LB_17538:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f10262 %_14442 ⊢ %_14443 : %_14443
 ; {>  %_14442~0':_p10219 }
; _f10262 0' ⊢ °0◂0'
; _some %_14443 ⊢ %_14444 : %_14444
 ; {>  %_14443~°0◂0':_p10218 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14444
 ; {>  %_14444~°0◂°0◂0':(_opn)◂(_p10218) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17501
	btr r12,3
	jmp LB_17502
LB_17501:
	bts r12,3
LB_17502:
	mov rsi,1
	bt r12,3
	jc LB_17499
	mov rsi,0
	bt r9,0
	jc LB_17499
	jmp LB_17500
LB_17499:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17500:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17503:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17505
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17504
LB_17505:
	add rsp,8
	ret
LB_17506:
	add rsp,48
	pop r14
LB_17504:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_17550
LB_17549:
	add r14,1
LB_17550:
	cmp r14,r10
	jge LB_17551
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17549
	cmp al,10
	jz LB_17549
	cmp al,32
	jz LB_17549
LB_17551:
	push r10
	call NS_E_14128_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17552
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17546
LB_17552:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17547
	btr r12,0
	clc
	jmp LB_17548
LB_17547:
	bts r12,0
	stc
LB_17548:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17543
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10263 %_14445 ⊢ %_14446 : %_14446
 ; {>  %_14445~0':_p10219 }
; _f10263 0' ⊢ °1◂0'
; _some %_14446 ⊢ %_14447 : %_14447
 ; {>  %_14446~°1◂0':_p10218 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14447
 ; {>  %_14447~°0◂°1◂0':(_opn)◂(_p10218) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17541
	btr r12,3
	jmp LB_17542
LB_17541:
	bts r12,3
LB_17542:
	mov rsi,1
	bt r12,3
	jc LB_17539
	mov rsi,0
	bt r9,0
	jc LB_17539
	jmp LB_17540
LB_17539:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17540:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17543:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17545
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17544
LB_17545:
	add rsp,8
	ret
LB_17546:
	add rsp,16
	pop r14
LB_17544:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14128:
NS_E_RDI_14128:
NS_E_14128_ETR_TBL:
NS_E_14128_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_17565
LB_17564:
	add r14,1
LB_17565:
	cmp r14,r10
	jge LB_17566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17564
	cmp al,10
	jz LB_17564
	cmp al,32
	jz LB_17564
LB_17566:
	push r10
	call NS_E_9611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17567
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17561
LB_17567:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17562
	btr r12,0
	clc
	jmp LB_17563
LB_17562:
	bts r12,0
	stc
LB_17563:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17558
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10265 %_14448 ⊢ %_14449 : %_14449
 ; {>  %_14448~0':_stg }
; _f10265 0' ⊢ °1◂0'
; _some %_14449 ⊢ %_14450 : %_14450
 ; {>  %_14449~°1◂0':_p10219 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_14450
 ; {>  %_14450~°0◂°1◂0':(_opn)◂(_p10219) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17556
	btr r12,3
	jmp LB_17557
LB_17556:
	bts r12,3
LB_17557:
	mov rsi,1
	bt r12,3
	jc LB_17554
	mov rsi,0
	bt r9,0
	jc LB_17554
	jmp LB_17555
LB_17554:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17555:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17558:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17560
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17559
LB_17560:
	add rsp,8
	ret
LB_17561:
	add rsp,16
	pop r14
LB_17559:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_17580
LB_17579:
	add r14,1
LB_17580:
	cmp r14,r10
	jge LB_17581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17579
	cmp al,10
	jz LB_17579
	cmp al,32
	jz LB_17579
LB_17581:
	push r10
	call NS_E_13048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17582
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17576
LB_17582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17577
	btr r12,0
	clc
	jmp LB_17578
LB_17577:
	bts r12,0
	stc
LB_17578:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17573
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f10264 %_14451 ⊢ %_14452 : %_14452
 ; {>  %_14451~0':_p10160 }
; _f10264 0' ⊢ °0◂0'
; _some %_14452 ⊢ %_14453 : %_14453
 ; {>  %_14452~°0◂0':_p10219 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14453
 ; {>  %_14453~°0◂°0◂0':(_opn)◂(_p10219) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17571
	btr r12,3
	jmp LB_17572
LB_17571:
	bts r12,3
LB_17572:
	mov rsi,1
	bt r12,3
	jc LB_17569
	mov rsi,0
	bt r9,0
	jc LB_17569
	jmp LB_17570
LB_17569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17570:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17573:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17575
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17574
LB_17575:
	add rsp,8
	ret
LB_17576:
	add rsp,16
	pop r14
LB_17574:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14129:
NS_E_RDI_14129:
NS_E_14129_ETR_TBL:
NS_E_14129_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_17593
LB_17592:
	add r14,1
LB_17593:
	cmp r14,r10
	jge LB_17594
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17592
	cmp al,10
	jz LB_17592
	cmp al,32
	jz LB_17592
LB_17594:
	add r14,4
	cmp r14,r10
	jg LB_17597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_17597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_17597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_17597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_17597
	jmp LB_17598
LB_17597:
	jmp LB_17589
LB_17598:
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
	jc LB_17590
	btr r12,0
	clc
	jmp LB_17591
LB_17590:
	bts r12,0
	stc
LB_17591:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17586
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10255 {  } ⊢ %_14454 : %_14454
 ; {>  }
; _f10255 {  } ⊢ °1◂{  }
; _some %_14454 ⊢ %_14455 : %_14455
 ; {>  %_14454~°1◂{  }:_p10215 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14455
 ; {>  %_14455~°0◂°1◂{  }:(_opn)◂(_p10215) }
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
	jc LB_17584
	mov rsi,0
	bt r9,0
	jc LB_17584
	jmp LB_17585
LB_17584:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17585:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17586:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17588
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17587
LB_17588:
	add rsp,8
	ret
LB_17589:
	add rsp,16
	pop r14
LB_17587:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_17608
LB_17607:
	add r14,1
LB_17608:
	cmp r14,r10
	jge LB_17609
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17607
	cmp al,10
	jz LB_17607
	cmp al,32
	jz LB_17607
LB_17609:
	add r14,4
	cmp r14,r10
	jg LB_17612
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_17612
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_17612
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_17612
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_17612
	jmp LB_17613
LB_17612:
	jmp LB_17604
LB_17613:
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
	jc LB_17605
	btr r12,0
	clc
	jmp LB_17606
LB_17605:
	bts r12,0
	stc
LB_17606:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17601
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10256 {  } ⊢ %_14456 : %_14456
 ; {>  }
; _f10256 {  } ⊢ °2◂{  }
; _some %_14456 ⊢ %_14457 : %_14457
 ; {>  %_14456~°2◂{  }:_p10215 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_14457
 ; {>  %_14457~°0◂°2◂{  }:(_opn)◂(_p10215) }
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
	jc LB_17599
	mov rsi,0
	bt r9,0
	jc LB_17599
	jmp LB_17600
LB_17599:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17600:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17601:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17603
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17602
LB_17603:
	add rsp,8
	ret
LB_17604:
	add rsp,16
	pop r14
LB_17602:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_17623
LB_17622:
	add r14,1
LB_17623:
	cmp r14,r10
	jge LB_17624
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17622
	cmp al,10
	jz LB_17622
	cmp al,32
	jz LB_17622
LB_17624:
	add r14,3
	cmp r14,r10
	jg LB_17627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_17627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_17627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_17627
	jmp LB_17628
LB_17627:
	jmp LB_17619
LB_17628:
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
	jc LB_17620
	btr r12,0
	clc
	jmp LB_17621
LB_17620:
	bts r12,0
	stc
LB_17621:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17616
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10254 {  } ⊢ %_14458 : %_14458
 ; {>  }
; _f10254 {  } ⊢ °0◂{  }
; _some %_14458 ⊢ %_14459 : %_14459
 ; {>  %_14458~°0◂{  }:_p10215 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_14459
 ; {>  %_14459~°0◂°0◂{  }:(_opn)◂(_p10215) }
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
	jc LB_17614
	mov rsi,0
	bt r9,0
	jc LB_17614
	jmp LB_17615
LB_17614:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17615:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17616:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17618
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17617
LB_17618:
	add rsp,8
	ret
LB_17619:
	add rsp,16
	pop r14
LB_17617:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14130:
NS_E_RDI_14130:
NS_E_14130_ETR_TBL:
NS_E_14130_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_17638
LB_17637:
	add r14,1
LB_17638:
	cmp r14,r10
	jge LB_17639
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17637
	cmp al,10
	jz LB_17637
	cmp al,32
	jz LB_17637
LB_17639:
	add r14,5
	cmp r14,r10
	jg LB_17642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_17642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_17642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_17642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_17642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_17642
	jmp LB_17643
LB_17642:
	jmp LB_17634
LB_17643:
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
	jc LB_17635
	btr r12,0
	clc
	jmp LB_17636
LB_17635:
	bts r12,0
	stc
LB_17636:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17631
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10255 {  } ⊢ %_14460 : %_14460
 ; {>  }
; _f10255 {  } ⊢ °1◂{  }
; _some %_14460 ⊢ %_14461 : %_14461
 ; {>  %_14460~°1◂{  }:_p10215 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14461
 ; {>  %_14461~°0◂°1◂{  }:(_opn)◂(_p10215) }
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
	jc LB_17629
	mov rsi,0
	bt r9,0
	jc LB_17629
	jmp LB_17630
LB_17629:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17630:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17631:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17633
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17632
LB_17633:
	add rsp,8
	ret
LB_17634:
	add rsp,16
	pop r14
LB_17632:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_17653
LB_17652:
	add r14,1
LB_17653:
	cmp r14,r10
	jge LB_17654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17652
	cmp al,10
	jz LB_17652
	cmp al,32
	jz LB_17652
LB_17654:
	add r14,5
	cmp r14,r10
	jg LB_17657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_17657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_17657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_17657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_17657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_17657
	jmp LB_17658
LB_17657:
	jmp LB_17649
LB_17658:
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
	jc LB_17650
	btr r12,0
	clc
	jmp LB_17651
LB_17650:
	bts r12,0
	stc
LB_17651:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17646
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10256 {  } ⊢ %_14462 : %_14462
 ; {>  }
; _f10256 {  } ⊢ °2◂{  }
; _some %_14462 ⊢ %_14463 : %_14463
 ; {>  %_14462~°2◂{  }:_p10215 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_14463
 ; {>  %_14463~°0◂°2◂{  }:(_opn)◂(_p10215) }
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
	jc LB_17644
	mov rsi,0
	bt r9,0
	jc LB_17644
	jmp LB_17645
LB_17644:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17645:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17646:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17648
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17647
LB_17648:
	add rsp,8
	ret
LB_17649:
	add rsp,16
	pop r14
LB_17647:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_17668
LB_17667:
	add r14,1
LB_17668:
	cmp r14,r10
	jge LB_17669
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17667
	cmp al,10
	jz LB_17667
	cmp al,32
	jz LB_17667
LB_17669:
	add r14,4
	cmp r14,r10
	jg LB_17672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_17672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_17672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_17672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_17672
	jmp LB_17673
LB_17672:
	jmp LB_17664
LB_17673:
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
	jc LB_17665
	btr r12,0
	clc
	jmp LB_17666
LB_17665:
	bts r12,0
	stc
LB_17666:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_17661
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f10254 {  } ⊢ %_14464 : %_14464
 ; {>  }
; _f10254 {  } ⊢ °0◂{  }
; _some %_14464 ⊢ %_14465 : %_14465
 ; {>  %_14464~°0◂{  }:_p10215 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_14465
 ; {>  %_14465~°0◂°0◂{  }:(_opn)◂(_p10215) }
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
	jc LB_17659
	mov rsi,0
	bt r9,0
	jc LB_17659
	jmp LB_17660
LB_17659:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17660:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17661:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17663
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17662
LB_17663:
	add rsp,8
	ret
LB_17664:
	add rsp,16
	pop r14
LB_17662:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14131:
NS_E_RDI_14131:
NS_E_14131_ETR_TBL:
NS_E_14131_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_17729
LB_17728:
	add r14,1
LB_17729:
	cmp r14,r10
	jge LB_17730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17728
	cmp al,10
	jz LB_17728
	cmp al,32
	jz LB_17728
LB_17730:
	push r10
	call NS_E_14130_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17731
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17697
LB_17731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_17708
LB_17707:
	add r14,1
LB_17708:
	cmp r14,r10
	jge LB_17709
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17707
	cmp al,10
	jz LB_17707
	cmp al,32
	jz LB_17707
LB_17709:
	push r10
	call NS_E_14133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17710
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17711
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17711:
	jmp LB_17698
LB_17710:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_17714
LB_17713:
	add r14,1
LB_17714:
	cmp r14,r10
	jge LB_17715
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17713
	cmp al,10
	jz LB_17713
	cmp al,32
	jz LB_17713
LB_17715:
	push r10
	call NS_E_14125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17716
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17717
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17717:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17718
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17718:
	jmp LB_17698
LB_17716:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_17721
LB_17720:
	add r14,1
LB_17721:
	cmp r14,r10
	jge LB_17722
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17720
	cmp al,10
	jz LB_17720
	cmp al,32
	jz LB_17720
LB_17722:
	push r10
	call NS_E_14132_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17723
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_17724
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_17724:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17725
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17725:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17726
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17726:
	jmp LB_17698
LB_17723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_17705
	btr r12,3
	clc
	jmp LB_17706
LB_17705:
	bts r12,3
	stc
LB_17706:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_17703
	btr r12,2
	clc
	jmp LB_17704
LB_17703:
	bts r12,2
	stc
LB_17704:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17701
	btr r12,1
	clc
	jmp LB_17702
LB_17701:
	bts r12,1
	stc
LB_17702:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17699
	btr r12,0
	clc
	jmp LB_17700
LB_17699:
	bts r12,0
	stc
LB_17700:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_17694
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f10251 { %_14467 %_14466 %_14468 %_14469 } ⊢ %_14470 : %_14470
 ; {>  %_14469~3':(_opn)◂(_p10213) %_14468~2':_p10216 %_14467~1':(_opn)◂(_stg) %_14466~0':_p10215 }
; _f10251 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_14470 ⊢ %_14471 : %_14471
 ; {>  %_14470~°1◂{ 1' 0' 2' 3' }:_p10213 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_14471
 ; {>  %_14471~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p10213) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_17674
	btr r12,4
	jmp LB_17675
LB_17674:
	bts r12,4
LB_17675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_17680
	btr r12,5
	jmp LB_17681
LB_17680:
	bts r12,5
LB_17681:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_17678
	btr QWORD [rdi],0
	jmp LB_17679
LB_17678:
	bts QWORD [rdi],0
LB_17679:
	mov r11,r13
	bt r12,0
	jc LB_17684
	btr r12,5
	jmp LB_17685
LB_17684:
	bts r12,5
LB_17685:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_17682
	btr QWORD [rdi],1
	jmp LB_17683
LB_17682:
	bts QWORD [rdi],1
LB_17683:
	mov r11,r8
	bt r12,2
	jc LB_17688
	btr r12,5
	jmp LB_17689
LB_17688:
	bts r12,5
LB_17689:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_17686
	btr QWORD [rdi],2
	jmp LB_17687
LB_17686:
	bts QWORD [rdi],2
LB_17687:
	mov r11,r10
	bt r12,4
	jc LB_17692
	btr r12,5
	jmp LB_17693
LB_17692:
	bts r12,5
LB_17693:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,5
	jc LB_17690
	btr QWORD [rdi],3
	jmp LB_17691
LB_17690:
	bts QWORD [rdi],3
LB_17691:
	mov rsi,1
	bt r12,3
	jc LB_17676
	mov rsi,0
	bt r9,0
	jc LB_17676
	jmp LB_17677
LB_17676:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17677:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17694:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17696
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17695
LB_17696:
	add rsp,8
	ret
LB_17698:
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
LB_17697:
	add rsp,64
	pop r14
LB_17695:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_17772
LB_17771:
	add r14,1
LB_17772:
	cmp r14,r10
	jge LB_17773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17771
	cmp al,10
	jz LB_17771
	cmp al,32
	jz LB_17771
LB_17773:
	push r10
	call NS_E_14129_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17774
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17760
LB_17774:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_17777
LB_17776:
	add r14,1
LB_17777:
	cmp r14,r10
	jge LB_17778
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17776
	cmp al,10
	jz LB_17776
	cmp al,32
	jz LB_17776
LB_17778:
	push r10
	call NS_E_14133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17779
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17780:
	jmp LB_17760
LB_17779:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_17783
LB_17782:
	add r14,1
LB_17783:
	cmp r14,r10
	jge LB_17784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17782
	cmp al,10
	jz LB_17782
	cmp al,32
	jz LB_17782
LB_17784:
	push r10
	call NS_E_14125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17785
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17786
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17786:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17787
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17787:
	jmp LB_17760
LB_17785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_17790
LB_17789:
	add r14,1
LB_17790:
	cmp r14,r10
	jge LB_17791
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17789
	cmp al,10
	jz LB_17789
	cmp al,32
	jz LB_17789
LB_17791:
	push r10
	call NS_E_14132_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17792
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_17793
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_17793:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17794
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17794:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17795
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17795:
	jmp LB_17760
LB_17792:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_17798
LB_17797:
	add r14,1
LB_17798:
	cmp r14,r10
	jge LB_17799
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17797
	cmp al,10
	jz LB_17797
	cmp al,32
	jz LB_17797
LB_17799:
	push r10
	call NS_E_14131_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17800
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_17801
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_17801:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_17802
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_17802:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_17803
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_17803:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17804
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17804:
	jmp LB_17760
LB_17800:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_17769
	btr r12,4
	clc
	jmp LB_17770
LB_17769:
	bts r12,4
	stc
LB_17770:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_17767
	btr r12,3
	clc
	jmp LB_17768
LB_17767:
	bts r12,3
	stc
LB_17768:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_17765
	btr r12,2
	clc
	jmp LB_17766
LB_17765:
	bts r12,2
	stc
LB_17766:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17763
	btr r12,1
	clc
	jmp LB_17764
LB_17763:
	bts r12,1
	stc
LB_17764:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17761
	btr r12,0
	clc
	jmp LB_17762
LB_17761:
	bts r12,0
	stc
LB_17762:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_17757
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f10250 { %_14473 %_14472 %_14474 %_14475 %_14476 } ⊢ %_14477 : %_14477
 ; {>  %_14474~2':_p10216 %_14473~1':(_opn)◂(_stg) %_14472~0':_p10215 %_14476~4':_p10213 %_14475~3':(_opn)◂(_p10213) }
; _f10250 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_14477 ⊢ %_14478 : %_14478
 ; {>  %_14477~°0◂{ 1' 0' 2' 3' 4' }:_p10213 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_14478
 ; {>  %_14478~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p10213) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_17733
	btr r12,5
	jmp LB_17734
LB_17733:
	bts r12,5
LB_17734:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_17739
	btr r12,6
	jmp LB_17740
LB_17739:
	bts r12,6
LB_17740:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_17737
	btr QWORD [rdi],0
	jmp LB_17738
LB_17737:
	bts QWORD [rdi],0
LB_17738:
	mov rcx,r13
	bt r12,0
	jc LB_17743
	btr r12,6
	jmp LB_17744
LB_17743:
	bts r12,6
LB_17744:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_17741
	btr QWORD [rdi],1
	jmp LB_17742
LB_17741:
	bts QWORD [rdi],1
LB_17742:
	mov rcx,r8
	bt r12,2
	jc LB_17747
	btr r12,6
	jmp LB_17748
LB_17747:
	bts r12,6
LB_17748:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_17745
	btr QWORD [rdi],2
	jmp LB_17746
LB_17745:
	bts QWORD [rdi],2
LB_17746:
	mov rcx,r11
	bt r12,5
	jc LB_17751
	btr r12,6
	jmp LB_17752
LB_17751:
	bts r12,6
LB_17752:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_17749
	btr QWORD [rdi],3
	jmp LB_17750
LB_17749:
	bts QWORD [rdi],3
LB_17750:
	mov rcx,r10
	bt r12,4
	jc LB_17755
	btr r12,6
	jmp LB_17756
LB_17755:
	bts r12,6
LB_17756:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_17753
	btr QWORD [rdi],4
	jmp LB_17754
LB_17753:
	bts QWORD [rdi],4
LB_17754:
	mov rsi,1
	bt r12,3
	jc LB_17735
	mov rsi,0
	bt r9,0
	jc LB_17735
	jmp LB_17736
LB_17735:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17736:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17757:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17759
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17758
LB_17759:
	add rsp,8
	ret
LB_17760:
	add rsp,80
	pop r14
LB_17758:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14132:
NS_E_RDI_14132:
NS_E_14132_ETR_TBL:
NS_E_14132_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_17819
LB_17818:
	add r14,1
LB_17819:
	cmp r14,r10
	jge LB_17820
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17818
	cmp al,10
	jz LB_17818
	cmp al,32
	jz LB_17818
LB_17820:
	add r14,1
	cmp r14,r10
	jg LB_17823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_17823
	jmp LB_17824
LB_17823:
	jmp LB_17813
LB_17824:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_17826
LB_17825:
	add r14,1
LB_17826:
	cmp r14,r10
	jge LB_17827
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17825
	cmp al,10
	jz LB_17825
	cmp al,32
	jz LB_17825
LB_17827:
	push r10
	call NS_E_14131_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17828
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17829
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17829:
	jmp LB_17813
LB_17828:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_17816
	btr r12,1
	clc
	jmp LB_17817
LB_17816:
	bts r12,1
	stc
LB_17817:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17814
	btr r12,0
	clc
	jmp LB_17815
LB_17814:
	bts r12,0
	stc
LB_17815:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_17810
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_17831
	btr r12,2
	jmp LB_17832
LB_17831:
	bts r12,2
LB_17832:
	mov r13,r14
	bt r12,1
	jc LB_17833
	btr r12,0
	jmp LB_17834
LB_17833:
	bts r12,0
LB_17834:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14479 ⊢ %_14480 : %_14480
 ; {>  %_14479~0':_p10213 }
; _some 0' ⊢ °0◂0'
; _some %_14480 ⊢ %_14481 : %_14481
 ; {>  %_14480~°0◂0':(_opn)◂(_p10213) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14481
 ; {>  %_14481~°0◂°0◂0':(_opn)◂((_opn)◂(_p10213)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17808
	btr r12,3
	jmp LB_17809
LB_17808:
	bts r12,3
LB_17809:
	mov rsi,1
	bt r12,3
	jc LB_17806
	mov rsi,0
	bt r9,0
	jc LB_17806
	jmp LB_17807
LB_17806:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17807:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17810:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17812
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17811
LB_17812:
	add rsp,8
	ret
LB_17813:
	add rsp,32
	pop r14
LB_17811:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_17837
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_14482 : %_14482
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_14482 ⊢ %_14483 : %_14483
 ; {>  %_14482~°1◂{  }:(_opn)◂(t5869'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14483
 ; {>  %_14483~°0◂°1◂{  }:(_opn)◂((_opn)◂(t5872'(0))) }
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
	jc LB_17835
	mov rsi,0
	bt r9,0
	jc LB_17835
	jmp LB_17836
LB_17835:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17836:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17837:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17839
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17838
LB_17839:
	add rsp,8
	ret
LB_17840:
	add rsp,0
	pop r14
LB_17838:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_14133:
NS_E_RDI_14133:
NS_E_14133_ETR_TBL:
NS_E_14133_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_17854
LB_17853:
	add r14,1
LB_17854:
	cmp r14,r10
	jge LB_17855
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17853
	cmp al,10
	jz LB_17853
	cmp al,32
	jz LB_17853
LB_17855:
	push r10
	call NS_E_9985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_17856
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17848
LB_17856:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_17859
LB_17858:
	add r14,1
LB_17859:
	cmp r14,r10
	jge LB_17860
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_17858
	cmp al,10
	jz LB_17858
	cmp al,32
	jz LB_17858
LB_17860:
	add r14,1
	cmp r14,r10
	jg LB_17864
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_17864
	jmp LB_17865
LB_17864:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_17862
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_17862:
	jmp LB_17848
LB_17865:
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
	jc LB_17851
	btr r12,1
	clc
	jmp LB_17852
LB_17851:
	bts r12,1
	stc
LB_17852:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_17849
	btr r12,0
	clc
	jmp LB_17850
LB_17849:
	bts r12,0
	stc
LB_17850:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_17845
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_14484 ⊢ %_14485 : %_14485
 ; {>  %_14484~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_14485 ⊢ %_14486 : %_14486
 ; {>  %_14485~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_14486
 ; {>  %_14486~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_17843
	btr r12,3
	jmp LB_17844
LB_17843:
	bts r12,3
LB_17844:
	mov rsi,1
	bt r12,3
	jc LB_17841
	mov rsi,0
	bt r9,0
	jc LB_17841
	jmp LB_17842
LB_17841:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17842:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17845:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17847
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17846
LB_17847:
	add rsp,8
	ret
LB_17848:
	add rsp,32
	pop r14
LB_17846:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_17868
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_14487 : %_14487
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_14487 ⊢ %_14488 : %_14488
 ; {>  %_14487~°1◂{  }:(_opn)◂(t5881'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_14488
 ; {>  %_14488~°0◂°1◂{  }:(_opn)◂((_opn)◂(t5884'(0))) }
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
	jc LB_17866
	mov rsi,0
	bt r9,0
	jc LB_17866
	jmp LB_17867
LB_17866:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_17867:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_17868:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_17870
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_17869
LB_17870:
	add rsp,8
	ret
LB_17871:
	add rsp,0
	pop r14
LB_17869:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_17932:
NS_E_RDI_17932:
; » _^ ..
	xor rax,rax
	add rax,9
	add rax,15
	add rax,13
	add rax,10
	add rax,9
	add rax,7
	add rax,10
	add rax,11
	add rax,10
	add rax,10
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; » 0xr0 |~ {  } ⊢ %_17888 : %_17888
 ; {>  %_17887~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_17888
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_17889 : %_17889
 ; {>  %_17887~0':_stg %_17888~1':_r64 }
; 	» _args _ ⊢ 2' : %_17889
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
MTC_LB_17933:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_17934
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
	jnc LB_17935
	bt QWORD [rdi],0
	jc LB_17936
	btr r12,5
	clc
	jmp LB_17937
LB_17936:
	bts r12,5
	stc
LB_17937:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_17935:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_17940
	btr r12,6
	clc
	jmp LB_17941
LB_17940:
	bts r12,6
	stc
LB_17941:
	mov r9,rcx
	bt r12,6
	jc LB_17938
	btr r12,3
	jmp LB_17939
LB_17938:
	bts r12,3
LB_17939:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_17944
	btr r12,6
	clc
	jmp LB_17945
LB_17944:
	bts r12,6
	stc
LB_17945:
	mov r10,rcx
	bt r12,6
	jc LB_17942
	btr r12,4
	jmp LB_17943
LB_17942:
	bts r12,4
LB_17943:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_17934
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
	jnc LB_17946
	bt QWORD [rdi],0
	jc LB_17947
	btr r12,7
	clc
	jmp LB_17948
LB_17947:
	bts r12,7
	stc
LB_17948:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_17946:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_17951
	btr r12,8
	clc
	jmp LB_17952
LB_17951:
	bts r12,8
	stc
LB_17952:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_17949
	btr r12,5
	jmp LB_17950
LB_17949:
	bts r12,5
LB_17950:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_17955
	btr r12,8
	clc
	jmp LB_17956
LB_17955:
	bts r12,8
	stc
LB_17956:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_17953
	btr r12,6
	jmp LB_17954
LB_17953:
	bts r12,6
LB_17954:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_17934
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
	jnc LB_17957
	bt QWORD [rdi],0
	jc LB_17958
	btr r12,7
	clc
	jmp LB_17959
LB_17958:
	bts r12,7
	stc
LB_17959:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_17957:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_17960:
	cmp r15,0
	jz LB_17961
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17960
LB_17961:
; _f37 %_17892 ⊢ { %_17894 %_17895 } : { %_17894 %_17895 }
 ; {>  %_17892~5':_stg %_17887~0':_stg %_17890~3':_stg %_17888~1':_r64 }
; _f37 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_17968
	btr r12,0
	jmp LB_17969
LB_17968:
	bts r12,0
LB_17969:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_17970
	btr r12,2
	jmp LB_17971
LB_17970:
	bts r12,2
LB_17971:
	mov r10,r14
	bt r12,1
	jc LB_17972
	btr r12,4
	jmp LB_17973
LB_17972:
	bts r12,4
LB_17973:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_17966
	btr r12,3
	clc
	jmp LB_17967
LB_17966:
	bts r12,3
	stc
LB_17967:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17964
	btr r12,1
	clc
	jmp LB_17965
LB_17964:
	bts r12,1
	stc
LB_17965:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17962
	btr r12,0
	clc
	jmp LB_17963
LB_17962:
	bts r12,0
	stc
LB_17963:
	add rsp,32
; _f12983 %_17895 ⊢ { %_17896 %_17897 } : { %_17896 %_17897 }
 ; {>  %_17894~2':_stg %_17895~4':_stg %_17887~0':_stg %_17890~3':_stg %_17888~1':_r64 }
; _f12983 4' ⊢ { 4' 5' }
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
	jc LB_17982
	btr r12,0
	jmp LB_17983
LB_17982:
	bts r12,0
LB_17983:
	call NS_E_12983
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_17984
	btr r12,4
	jmp LB_17985
LB_17984:
	bts r12,4
LB_17985:
	mov r11,r14
	bt r12,1
	jc LB_17986
	btr r12,5
	jmp LB_17987
LB_17986:
	bts r12,5
LB_17987:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_17980
	btr r12,3
	clc
	jmp LB_17981
LB_17980:
	bts r12,3
	stc
LB_17981:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_17978
	btr r12,2
	clc
	jmp LB_17979
LB_17978:
	bts r12,2
	stc
LB_17979:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17976
	btr r12,1
	clc
	jmp LB_17977
LB_17976:
	bts r12,1
	stc
LB_17977:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17974
	btr r12,0
	clc
	jmp LB_17975
LB_17974:
	bts r12,0
	stc
LB_17975:
	add rsp,40
MTC_LB_17988:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_17989
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
	jnc LB_17990
	bt QWORD [rdi],0
	jc LB_17991
	btr r12,7
	clc
	jmp LB_17992
LB_17991:
	bts r12,7
	stc
LB_17992:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_17990:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_17993
	btr r12,6
	jmp LB_17994
LB_17993:
	bts r12,6
LB_17994:
LB_17995:
	cmp r15,0
	jz LB_17996
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_17995
LB_17996:
; » 0xr0 |~ {  } ⊢ %_17899 : %_17899
 ; {>  %_17894~2':_stg %_17887~0':_stg %_17898~6':_stg %_17890~3':_stg %_17888~1':_r64 %_17896~4':_stg }
; 	» 0xr0 _ ⊢ 5' : %_17899
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f14093 { %_17898 %_17899 } ⊢ { %_17900 %_17901 %_17902 } : { %_17900 %_17901 %_17902 }
 ; {>  %_17894~2':_stg %_17887~0':_stg %_17898~6':_stg %_17899~5':_r64 %_17890~3':_stg %_17888~1':_r64 %_17896~4':_stg }
; _f14093 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_18007
	btr r12,0
	jmp LB_18008
LB_18007:
	bts r12,0
LB_18008:
	mov r14,r11
	bt r12,5
	jc LB_18009
	btr r12,1
	jmp LB_18010
LB_18009:
	bts r12,1
LB_18010:
	call NS_E_14093
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_18011
	btr r12,5
	jmp LB_18012
LB_18011:
	bts r12,5
LB_18012:
	mov rcx,r14
	bt r12,1
	jc LB_18013
	btr r12,6
	jmp LB_18014
LB_18013:
	bts r12,6
LB_18014:
	mov rdx,r9
	bt r12,3
	jc LB_18017
	btr r12,7
	jmp LB_18018
LB_18017:
	bts r12,7
LB_18018:
	mov rsi,1
	bt r12,7
	jc LB_18015
	mov rsi,0
	bt rdx,0
	jc LB_18015
	jmp LB_18016
LB_18015:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_18016:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18005
	btr r12,4
	clc
	jmp LB_18006
LB_18005:
	bts r12,4
	stc
LB_18006:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18003
	btr r12,3
	clc
	jmp LB_18004
LB_18003:
	bts r12,3
	stc
LB_18004:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18001
	btr r12,2
	clc
	jmp LB_18002
LB_18001:
	bts r12,2
	stc
LB_18002:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_17999
	btr r12,1
	clc
	jmp LB_18000
LB_17999:
	bts r12,1
	stc
LB_18000:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_17997
	btr r12,0
	clc
	jmp LB_17998
LB_17997:
	bts r12,0
	stc
LB_17998:
	add rsp,48
MTC_LB_18019:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_18020
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
	jnc LB_18021
	bt QWORD [rdi],0
	jc LB_18022
	btr r12,9
	clc
	jmp LB_18023
LB_18022:
	bts r12,9
	stc
LB_18023:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_18021:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_18024
	btr r12,8
	jmp LB_18025
LB_18024:
	bts r12,8
LB_18025:
LB_18026:
	cmp r15,0
	jz LB_18027
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_18026
LB_18027:
; » 0xr0 |~ {  } ⊢ %_17904 : %_17904
 ; {>  %_17894~2':_stg %_17900~5':_stg %_17887~0':_stg %_17903~8':(_lst)◂(_p10208) %_17890~3':_stg %_17888~1':_r64 %_17901~6':_r64 %_17896~4':_stg }
; 	» 0xr0 _ ⊢ 7' : %_17904
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f10547 { %_17904 %_17903 } ⊢ { %_17905 %_17906 } : { %_17905 %_17906 }
 ; {>  %_17894~2':_stg %_17900~5':_stg %_17887~0':_stg %_17903~8':(_lst)◂(_p10208) %_17904~7':_r64 %_17890~3':_stg %_17888~1':_r64 %_17901~6':_r64 %_17896~4':_stg }
; _f10547 { 7' 8' } ⊢ { 7' 8' }
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
; _emt_mov_ptn_to_ptn:{| 0000000110.. |},{ 7' 8' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_18042
	btr r12,0
	jmp LB_18043
LB_18042:
	bts r12,0
LB_18043:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_18044
	btr r12,1
	jmp LB_18045
LB_18044:
	bts r12,1
LB_18045:
	call NS_E_10547
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_18046
	btr r12,7
	jmp LB_18047
LB_18046:
	bts r12,7
LB_18047:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_18048
	btr r12,8
	jmp LB_18049
LB_18048:
	bts r12,8
LB_18049:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_18040
	btr r12,6
	clc
	jmp LB_18041
LB_18040:
	bts r12,6
	stc
LB_18041:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_18038
	btr r12,5
	clc
	jmp LB_18039
LB_18038:
	bts r12,5
	stc
LB_18039:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18036
	btr r12,4
	clc
	jmp LB_18037
LB_18036:
	bts r12,4
	stc
LB_18037:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18034
	btr r12,3
	clc
	jmp LB_18035
LB_18034:
	bts r12,3
	stc
LB_18035:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18032
	btr r12,2
	clc
	jmp LB_18033
LB_18032:
	bts r12,2
	stc
LB_18033:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18030
	btr r12,1
	clc
	jmp LB_18031
LB_18030:
	bts r12,1
	stc
LB_18031:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18028
	btr r12,0
	clc
	jmp LB_18029
LB_18028:
	bts r12,0
	stc
LB_18029:
	add rsp,64
; » _^ ..
	xor rax,rax
	add rax,6
	mov rsi,QWORD [st_vct+8*8]
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,4
	mov rdi,rax
	call mlc_s8
	mov QWORD [st_vct+8*9],rax
	btr r12,9
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
	mov rsi,QWORD [st_vct+8*8]
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; _f38 %_17908 ⊢ %_17909 : %_17909
 ; {>  %_17894~2':_stg %_17900~5':_stg %_17887~0':_stg %_17890~3':_stg %_17888~1':_r64 %_17908~9':_stg %_17905~7':_r64 %_17907~8':_stg %_17901~6':_r64 %_17896~4':_stg }
; _f38 9' ⊢ 9'
; push_iv 
	sub rsp,80
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rsp+8+8*8],rdi
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000000010.. |},9' ⊢ 0'
	mov r13,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_18068
	btr r12,0
	jmp LB_18069
LB_18068:
	bts r12,0
LB_18069:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_18070
	btr r12,9
	jmp LB_18071
LB_18070:
	bts r12,9
LB_18071:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_18066
	btr r12,8
	clc
	jmp LB_18067
LB_18066:
	bts r12,8
	stc
LB_18067:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_18064
	btr r12,7
	clc
	jmp LB_18065
LB_18064:
	bts r12,7
	stc
LB_18065:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_18062
	btr r12,6
	clc
	jmp LB_18063
LB_18062:
	bts r12,6
	stc
LB_18063:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_18060
	btr r12,5
	clc
	jmp LB_18061
LB_18060:
	bts r12,5
	stc
LB_18061:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18058
	btr r12,4
	clc
	jmp LB_18059
LB_18058:
	bts r12,4
	stc
LB_18059:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18056
	btr r12,3
	clc
	jmp LB_18057
LB_18056:
	bts r12,3
	stc
LB_18057:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18054
	btr r12,2
	clc
	jmp LB_18055
LB_18054:
	bts r12,2
	stc
LB_18055:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18052
	btr r12,1
	clc
	jmp LB_18053
LB_18052:
	bts r12,1
	stc
LB_18053:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18050
	btr r12,0
	clc
	jmp LB_18051
LB_18050:
	bts r12,0
	stc
LB_18051:
	add rsp,80
; ∎ {  }
 ; {>  %_17894~2':_stg %_17900~5':_stg %_17887~0':_stg %_17909~9':_stg %_17890~3':_stg %_17888~1':_r64 %_17905~7':_r64 %_17907~8':_stg %_17901~6':_r64 %_17896~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_18072
	mov rdi,r8
	call dlt
LB_18072:
	bt r12,5
	jc LB_18073
	mov rdi,r11
	call dlt
LB_18073:
	bt r12,0
	jc LB_18074
	mov rdi,r13
	call dlt
LB_18074:
	bt r12,9
	jc LB_18075
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_18075:
	bt r12,3
	jc LB_18076
	mov rdi,r9
	call dlt
LB_18076:
	bt r12,1
	jc LB_18077
	mov rdi,r14
	call dlt
LB_18077:
	bt r12,7
	jc LB_18078
	mov rdi,rdx
	call dlt
LB_18078:
	bt r12,8
	jc LB_18079
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_18079:
	bt r12,6
	jc LB_18080
	mov rdi,rcx
	call dlt
LB_18080:
	bt r12,4
	jc LB_18081
	mov rdi,r10
	call dlt
LB_18081:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_18020:
	mov r15,0
LB_18083:
	cmp r15,0
	jz LB_18084
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_18083
LB_18084:
; 	» "H0\n" _ ⊢ 8' : %_17910
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_17910 ⊢ %_17911 : %_17911
 ; {>  %_17894~2':_stg %_17900~5':_stg %_17887~0':_stg %_17902~7':(_opn)◂((_lst)◂(_p10208)) %_17910~8':_stg %_17890~3':_stg %_17888~1':_r64 %_17901~6':_r64 %_17896~4':_stg }
; _f38 8' ⊢ 8'
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
	jc LB_18101
	btr r12,0
	jmp LB_18102
LB_18101:
	bts r12,0
LB_18102:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_18103
	btr r12,8
	jmp LB_18104
LB_18103:
	bts r12,8
LB_18104:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_18099
	btr r12,7
	clc
	jmp LB_18100
LB_18099:
	bts r12,7
	stc
LB_18100:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_18097
	btr r12,6
	clc
	jmp LB_18098
LB_18097:
	bts r12,6
	stc
LB_18098:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_18095
	btr r12,5
	clc
	jmp LB_18096
LB_18095:
	bts r12,5
	stc
LB_18096:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18093
	btr r12,4
	clc
	jmp LB_18094
LB_18093:
	bts r12,4
	stc
LB_18094:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18091
	btr r12,3
	clc
	jmp LB_18092
LB_18091:
	bts r12,3
	stc
LB_18092:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18089
	btr r12,2
	clc
	jmp LB_18090
LB_18089:
	bts r12,2
	stc
LB_18090:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18087
	btr r12,1
	clc
	jmp LB_18088
LB_18087:
	bts r12,1
	stc
LB_18088:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18085
	btr r12,0
	clc
	jmp LB_18086
LB_18085:
	bts r12,0
	stc
LB_18086:
	add rsp,72
; ∎ {  }
 ; {>  %_17894~2':_stg %_17900~5':_stg %_17887~0':_stg %_17902~7':(_opn)◂((_lst)◂(_p10208)) %_17911~8':_stg %_17890~3':_stg %_17888~1':_r64 %_17901~6':_r64 %_17896~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_18105
	mov rdi,r8
	call dlt
LB_18105:
	bt r12,5
	jc LB_18106
	mov rdi,r11
	call dlt
LB_18106:
	bt r12,0
	jc LB_18107
	mov rdi,r13
	call dlt
LB_18107:
	bt r12,7
	jc LB_18108
	mov rdi,rdx
	call dlt
LB_18108:
	bt r12,8
	jc LB_18109
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_18109:
	bt r12,3
	jc LB_18110
	mov rdi,r9
	call dlt
LB_18110:
	bt r12,1
	jc LB_18111
	mov rdi,r14
	call dlt
LB_18111:
	bt r12,6
	jc LB_18112
	mov rdi,rcx
	call dlt
LB_18112:
	bt r12,4
	jc LB_18113
	mov rdi,r10
	call dlt
LB_18113:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_18082:
MTC_LB_17989:
	mov r15,0
LB_18115:
	cmp r15,0
	jz LB_18116
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_18115
LB_18116:
; 	» "H1\n" _ ⊢ 6' : %_17912
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_17912 ⊢ %_17913 : %_17913
 ; {>  %_17912~6':_stg %_17894~2':_stg %_17887~0':_stg %_17897~5':(_opn)◂(_stg) %_17890~3':_stg %_17888~1':_r64 %_17896~4':_stg }
; _f38 6' ⊢ 6'
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
	jc LB_18129
	btr r12,0
	jmp LB_18130
LB_18129:
	bts r12,0
LB_18130:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_18131
	btr r12,6
	jmp LB_18132
LB_18131:
	bts r12,6
LB_18132:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_18127
	btr r12,5
	clc
	jmp LB_18128
LB_18127:
	bts r12,5
	stc
LB_18128:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18125
	btr r12,4
	clc
	jmp LB_18126
LB_18125:
	bts r12,4
	stc
LB_18126:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18123
	btr r12,3
	clc
	jmp LB_18124
LB_18123:
	bts r12,3
	stc
LB_18124:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18121
	btr r12,2
	clc
	jmp LB_18122
LB_18121:
	bts r12,2
	stc
LB_18122:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18119
	btr r12,1
	clc
	jmp LB_18120
LB_18119:
	bts r12,1
	stc
LB_18120:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18117
	btr r12,0
	clc
	jmp LB_18118
LB_18117:
	bts r12,0
	stc
LB_18118:
	add rsp,56
; ∎ {  }
 ; {>  %_17894~2':_stg %_17887~0':_stg %_17897~5':(_opn)◂(_stg) %_17890~3':_stg %_17888~1':_r64 %_17913~6':_stg %_17896~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_18133
	mov rdi,r8
	call dlt
LB_18133:
	bt r12,0
	jc LB_18134
	mov rdi,r13
	call dlt
LB_18134:
	bt r12,5
	jc LB_18135
	mov rdi,r11
	call dlt
LB_18135:
	bt r12,3
	jc LB_18136
	mov rdi,r9
	call dlt
LB_18136:
	bt r12,1
	jc LB_18137
	mov rdi,r14
	call dlt
LB_18137:
	bt r12,6
	jc LB_18138
	mov rdi,rcx
	call dlt
LB_18138:
	bt r12,4
	jc LB_18139
	mov rdi,r10
	call dlt
LB_18139:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_18114:
MTC_LB_17934:
	mov r15,0
LB_18141:
	cmp r15,0
	jz LB_18142
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_18141
LB_18142:
; _f14093 { %_17887 %_17888 } ⊢ { %_17914 %_17915 %_17916 } : { %_17914 %_17915 %_17916 }
 ; {>  %_17887~0':_stg %_17889~2':(_lst)◂(_stg) %_17888~1':_r64 }
; _f14093 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_14093
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_18145
	btr r12,4
	jmp LB_18146
LB_18145:
	bts r12,4
LB_18146:
	mov r9,r10
	bt r12,4
	jc LB_18149
	btr r12,3
	jmp LB_18150
LB_18149:
	bts r12,3
LB_18150:
	mov rsi,1
	bt r12,3
	jc LB_18147
	mov rsi,0
	bt r9,0
	jc LB_18147
	jmp LB_18148
LB_18147:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_18148:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_18143
	btr r12,2
	clc
	jmp LB_18144
LB_18143:
	bts r12,2
	stc
LB_18144:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_17917
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_17917 ⊢ { %_17918 %_17919 } : { %_17918 %_17919 }
 ; {>  %_17914~0':_stg %_17917~4':_stg %_17889~2':(_lst)◂(_stg) %_17915~1':_r64 %_17916~3':(_opn)◂((_lst)◂(_p10208)) }
; _f37 4' ⊢ { 4' 5' }
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
	jc LB_18159
	btr r12,0
	jmp LB_18160
LB_18159:
	bts r12,0
LB_18160:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_18161
	btr r12,4
	jmp LB_18162
LB_18161:
	bts r12,4
LB_18162:
	mov r11,r14
	bt r12,1
	jc LB_18163
	btr r12,5
	jmp LB_18164
LB_18163:
	bts r12,5
LB_18164:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18157
	btr r12,3
	clc
	jmp LB_18158
LB_18157:
	bts r12,3
	stc
LB_18158:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18155
	btr r12,2
	clc
	jmp LB_18156
LB_18155:
	bts r12,2
	stc
LB_18156:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18153
	btr r12,1
	clc
	jmp LB_18154
LB_18153:
	bts r12,1
	stc
LB_18154:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18151
	btr r12,0
	clc
	jmp LB_18152
LB_18151:
	bts r12,0
	stc
LB_18152:
	add rsp,40
; _f38 { %_17918 %_17919 } ⊢ { %_17920 %_17921 } : { %_17920 %_17921 }
 ; {>  %_17914~0':_stg %_17889~2':(_lst)◂(_stg) %_17915~1':_r64 %_17919~5':_stg %_17916~3':(_opn)◂((_lst)◂(_p10208)) %_17918~4':_stg }
; _f38 { 4' 5' } ⊢ { 4' 5' }
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
	jc LB_18175
	btr r12,1
	jmp LB_18176
LB_18175:
	bts r12,1
LB_18176:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_18173
	btr QWORD [rdi],0
	jmp LB_18174
LB_18173:
	bts QWORD [rdi],0
LB_18174:
	mov r14,r11
	bt r12,5
	jc LB_18179
	btr r12,1
	jmp LB_18180
LB_18179:
	bts r12,1
LB_18180:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_18177
	btr QWORD [rdi],1
	jmp LB_18178
LB_18177:
	bts QWORD [rdi],1
LB_18178:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_18183
	btr r12,1
	clc
	jmp LB_18184
LB_18183:
	bts r12,1
	stc
LB_18184:
	mov r10,r14
	bt r12,1
	jc LB_18181
	btr r12,4
	jmp LB_18182
LB_18181:
	bts r12,4
LB_18182:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_18187
	btr r12,1
	clc
	jmp LB_18188
LB_18187:
	bts r12,1
	stc
LB_18188:
	mov r11,r14
	bt r12,1
	jc LB_18185
	btr r12,5
	jmp LB_18186
LB_18185:
	bts r12,5
LB_18186:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18171
	btr r12,3
	clc
	jmp LB_18172
LB_18171:
	bts r12,3
	stc
LB_18172:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18169
	btr r12,2
	clc
	jmp LB_18170
LB_18169:
	bts r12,2
	stc
LB_18170:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18167
	btr r12,1
	clc
	jmp LB_18168
LB_18167:
	bts r12,1
	stc
LB_18168:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18165
	btr r12,0
	clc
	jmp LB_18166
LB_18165:
	bts r12,0
	stc
LB_18166:
	add rsp,40
; _f12983 %_17921 ⊢ { %_17922 %_17923 } : { %_17922 %_17923 }
 ; {>  %_17914~0':_stg %_17921~5':_stg %_17920~4':_stg %_17889~2':(_lst)◂(_stg) %_17915~1':_r64 %_17916~3':(_opn)◂((_lst)◂(_p10208)) }
; _f12983 5' ⊢ { 5' 6' }
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
	jc LB_18199
	btr r12,0
	jmp LB_18200
LB_18199:
	bts r12,0
LB_18200:
	call NS_E_12983
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_18201
	btr r12,5
	jmp LB_18202
LB_18201:
	bts r12,5
LB_18202:
	mov rcx,r14
	bt r12,1
	jc LB_18203
	btr r12,6
	jmp LB_18204
LB_18203:
	bts r12,6
LB_18204:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18197
	btr r12,4
	clc
	jmp LB_18198
LB_18197:
	bts r12,4
	stc
LB_18198:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18195
	btr r12,3
	clc
	jmp LB_18196
LB_18195:
	bts r12,3
	stc
LB_18196:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18193
	btr r12,2
	clc
	jmp LB_18194
LB_18193:
	bts r12,2
	stc
LB_18194:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18191
	btr r12,1
	clc
	jmp LB_18192
LB_18191:
	bts r12,1
	stc
LB_18192:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18189
	btr r12,0
	clc
	jmp LB_18190
LB_18189:
	bts r12,0
	stc
LB_18190:
	add rsp,48
MTC_LB_18205:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_18206
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
	jnc LB_18207
	bt QWORD [rdi],0
	jc LB_18208
	btr r12,8
	clc
	jmp LB_18209
LB_18208:
	bts r12,8
	stc
LB_18209:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_18207:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_18210
	btr r12,7
	jmp LB_18211
LB_18210:
	bts r12,7
LB_18211:
LB_18212:
	cmp r15,0
	jz LB_18213
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_18212
LB_18213:
; » 0xr0 |~ {  } ⊢ %_17925 : %_17925
 ; {>  %_17924~7':_stg %_17914~0':_stg %_17920~4':_stg %_17889~2':(_lst)◂(_stg) %_17915~1':_r64 %_17916~3':(_opn)◂((_lst)◂(_p10208)) %_17922~5':_stg }
; 	» 0xr0 _ ⊢ 6' : %_17925
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f14093 { %_17924 %_17925 } ⊢ { %_17926 %_17927 %_17928 } : { %_17926 %_17927 %_17928 }
 ; {>  %_17924~7':_stg %_17914~0':_stg %_17920~4':_stg %_17889~2':(_lst)◂(_stg) %_17915~1':_r64 %_17916~3':(_opn)◂((_lst)◂(_p10208)) %_17925~6':_r64 %_17922~5':_stg }
; _f14093 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_18226
	btr r12,0
	jmp LB_18227
LB_18226:
	bts r12,0
LB_18227:
	mov r14,rcx
	bt r12,6
	jc LB_18228
	btr r12,1
	jmp LB_18229
LB_18228:
	bts r12,1
LB_18229:
	call NS_E_14093
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_18230
	btr r12,6
	jmp LB_18231
LB_18230:
	bts r12,6
LB_18231:
	mov rdx,r14
	bt r12,1
	jc LB_18232
	btr r12,7
	jmp LB_18233
LB_18232:
	bts r12,7
LB_18233:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_18236
	btr r12,8
	jmp LB_18237
LB_18236:
	bts r12,8
LB_18237:
	mov rsi,1
	bt r12,8
	jc LB_18234
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_18234
	jmp LB_18235
LB_18234:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_18235:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_18224
	btr r12,5
	clc
	jmp LB_18225
LB_18224:
	bts r12,5
	stc
LB_18225:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18222
	btr r12,4
	clc
	jmp LB_18223
LB_18222:
	bts r12,4
	stc
LB_18223:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18220
	btr r12,3
	clc
	jmp LB_18221
LB_18220:
	bts r12,3
	stc
LB_18221:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18218
	btr r12,2
	clc
	jmp LB_18219
LB_18218:
	bts r12,2
	stc
LB_18219:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18216
	btr r12,1
	clc
	jmp LB_18217
LB_18216:
	bts r12,1
	stc
LB_18217:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18214
	btr r12,0
	clc
	jmp LB_18215
LB_18214:
	bts r12,0
	stc
LB_18215:
	add rsp,56
; _f38 { %_17926 %_17927 %_17928 } ⊢ { %_17929 %_17930 %_17931 } : { %_17929 %_17930 %_17931 }
 ; {>  %_17914~0':_stg %_17928~8':(_opn)◂((_lst)◂(_p10208)) %_17927~7':_r64 %_17920~4':_stg %_17926~6':_stg %_17889~2':(_lst)◂(_stg) %_17915~1':_r64 %_17916~3':(_opn)◂((_lst)◂(_p10208)) %_17922~5':_stg }
; _f38 { 6' 7' 8' } ⊢ { 6' 7' 8' }
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
	jc LB_18252
	btr r12,1
	jmp LB_18253
LB_18252:
	bts r12,1
LB_18253:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_18250
	btr QWORD [rdi],0
	jmp LB_18251
LB_18250:
	bts QWORD [rdi],0
LB_18251:
	mov r14,rdx
	bt r12,7
	jc LB_18256
	btr r12,1
	jmp LB_18257
LB_18256:
	bts r12,1
LB_18257:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_18254
	btr QWORD [rdi],1
	jmp LB_18255
LB_18254:
	bts QWORD [rdi],1
LB_18255:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_18260
	btr r12,1
	jmp LB_18261
LB_18260:
	bts r12,1
LB_18261:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,1
	jc LB_18258
	btr QWORD [rdi],2
	jmp LB_18259
LB_18258:
	bts QWORD [rdi],2
LB_18259:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_18264
	btr r12,1
	clc
	jmp LB_18265
LB_18264:
	bts r12,1
	stc
LB_18265:
	mov rcx,r14
	bt r12,1
	jc LB_18262
	btr r12,6
	jmp LB_18263
LB_18262:
	bts r12,6
LB_18263:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_18268
	btr r12,1
	clc
	jmp LB_18269
LB_18268:
	bts r12,1
	stc
LB_18269:
	mov rdx,r14
	bt r12,1
	jc LB_18266
	btr r12,7
	jmp LB_18267
LB_18266:
	bts r12,7
LB_18267:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_18272
	btr r12,1
	clc
	jmp LB_18273
LB_18272:
	bts r12,1
	stc
LB_18273:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_18270
	btr r12,8
	jmp LB_18271
LB_18270:
	bts r12,8
LB_18271:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_18248
	btr r12,5
	clc
	jmp LB_18249
LB_18248:
	bts r12,5
	stc
LB_18249:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_18246
	btr r12,4
	clc
	jmp LB_18247
LB_18246:
	bts r12,4
	stc
LB_18247:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_18244
	btr r12,3
	clc
	jmp LB_18245
LB_18244:
	bts r12,3
	stc
LB_18245:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_18242
	btr r12,2
	clc
	jmp LB_18243
LB_18242:
	bts r12,2
	stc
LB_18243:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_18240
	btr r12,1
	clc
	jmp LB_18241
LB_18240:
	bts r12,1
	stc
LB_18241:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_18238
	btr r12,0
	clc
	jmp LB_18239
LB_18238:
	bts r12,0
	stc
LB_18239:
	add rsp,56
; ∎ {  }
 ; {>  %_17914~0':_stg %_17931~8':(_opn)◂((_lst)◂(_p10208)) %_17920~4':_stg %_17889~2':(_lst)◂(_stg) %_17929~6':_stg %_17915~1':_r64 %_17916~3':(_opn)◂((_lst)◂(_p10208)) %_17930~7':_r64 %_17922~5':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_18274
	mov rdi,r13
	call dlt
LB_18274:
	bt r12,8
	jc LB_18275
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_18275:
	bt r12,4
	jc LB_18276
	mov rdi,r10
	call dlt
LB_18276:
	bt r12,2
	jc LB_18277
	mov rdi,r8
	call dlt
LB_18277:
	bt r12,6
	jc LB_18278
	mov rdi,rcx
	call dlt
LB_18278:
	bt r12,1
	jc LB_18279
	mov rdi,r14
	call dlt
LB_18279:
	bt r12,3
	jc LB_18280
	mov rdi,r9
	call dlt
LB_18280:
	bt r12,7
	jc LB_18281
	mov rdi,rdx
	call dlt
LB_18281:
	bt r12,5
	jc LB_18282
	mov rdi,r11
	call dlt
LB_18282:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_18206:
	mov r15,0
LB_18284:
	cmp r15,0
	jz LB_18285
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_18284
LB_18285:
; ∎ {  }
 ; {>  %_17914~0':_stg %_17923~6':(_opn)◂(_stg) %_17920~4':_stg %_17889~2':(_lst)◂(_stg) %_17915~1':_r64 %_17916~3':(_opn)◂((_lst)◂(_p10208)) %_17922~5':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_18286
	mov rdi,r13
	call dlt
LB_18286:
	bt r12,6
	jc LB_18287
	mov rdi,rcx
	call dlt
LB_18287:
	bt r12,4
	jc LB_18288
	mov rdi,r10
	call dlt
LB_18288:
	bt r12,2
	jc LB_18289
	mov rdi,r8
	call dlt
LB_18289:
	bt r12,1
	jc LB_18290
	mov rdi,r14
	call dlt
LB_18290:
	bt r12,3
	jc LB_18291
	mov rdi,r9
	call dlt
LB_18291:
	bt r12,5
	jc LB_18292
	mov rdi,r11
	call dlt
LB_18292:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_18283:
MTC_LB_18140:
section .data
	CST_DYN_13045:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_17932:
		dq 0x0000_0001_00_82_ffff
		dq 1
