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
	call NS_E_29087
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
NS_E_20374:
NS_E_RDI_20374:
NS_E_20374_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_20375
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_20375:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_20377:
NS_E_RDI_20377:
NS_E_20377_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_20377_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_20377_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_20378:
NS_E_RDI_20378:
NS_E_20378_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_20378_LB_0
	cmp r11,57
	ja NS_E_20378_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_20378_LB_0:
	mov rax,0
	ret
NS_E_20380:
NS_E_RDI_20380:
NS_E_20380_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_20380_LB_0
	cmp r11,122
	ja NS_E_20380_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_20380_LB_0:
	mov rax,0
	ret
NS_E_20379:
NS_E_RDI_20379:
NS_E_20379_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_20379_LB_0
	cmp r11,90
	ja NS_E_20379_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_20379_LB_0:
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
	jc LB_20386
	bt QWORD [rdi],17
	jnc LB_20386
	bt QWORD [rdi],0
	jc LB_20388
	btr r12,2
	clc
	jmp LB_20389
LB_20388:
	bts r12,2
	stc
LB_20389:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_20387
LB_20386:
	btr r12,2
	clc
	call dcp
LB_20387:
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
	jc LB_20382
	bt QWORD [rdi],17
	jnc LB_20382
	bt QWORD [rdi],0
	jc LB_20384
	btr r12,2
	clc
	jmp LB_20385
LB_20384:
	bts r12,2
	stc
LB_20385:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_20383
LB_20382:
	btr r12,2
	clc
	call dcp
LB_20383:
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
	jc LB_20381
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_20381:
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
NS_E_20376:
NS_E_RDI_20376:
NS_E_20376_ETR_TBL:
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
	jz NS_E_20376_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_20376_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_20396:
; 	|» { 0' 1' }
NS_E_RDI_20396:
MTC_LB_20397:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_20398
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
	jnc LB_20399
	bt QWORD [rdi],0
	jc LB_20400
	btr r12,2
	clc
	jmp LB_20401
LB_20400:
	bts r12,2
	stc
LB_20401:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_20399:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_20402:
	cmp r15,0
	jz LB_20403
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20402
LB_20403:
; ∎ %_20390
 ; {>  %_20390~0':(_lst)◂(t10176'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_20398:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_20404
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
	jnc LB_20405
	bt QWORD [rdi],0
	jc LB_20406
	btr r12,4
	clc
	jmp LB_20407
LB_20406:
	bts r12,4
	stc
LB_20407:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_20405:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_20410
	btr r12,5
	clc
	jmp LB_20411
LB_20410:
	bts r12,5
	stc
LB_20411:
	mov r8,r11
	bt r12,5
	jc LB_20408
	btr r12,2
	jmp LB_20409
LB_20408:
	bts r12,2
LB_20409:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_20414
	btr r12,5
	clc
	jmp LB_20415
LB_20414:
	bts r12,5
	stc
LB_20415:
	mov r9,r11
	bt r12,5
	jc LB_20412
	btr r12,3
	jmp LB_20413
LB_20412:
	bts r12,3
LB_20413:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_20416:
	cmp r15,0
	jz LB_20417
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20416
LB_20417:
; _cns { %_20392 %_20390 } ⊢ %_20394 : %_20394
 ; {>  %_20392~2':t10176'(-1) %_20393~3':(_lst)◂(t10176'(-1)) %_20390~0':(_lst)◂(t10176'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f20396 { %_20394 %_20393 } ⊢ %_20395 : %_20395
 ; {>  %_20393~3':(_lst)◂(t10176'(-1)) %_20394~°0◂{ 2' 0' }:(_lst)◂(t10176'(-1)) }
; _f20396 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_20418
	btr r12,1
	jmp LB_20419
LB_20418:
	bts r12,1
LB_20419:
	mov r9,r13
	bt r12,0
	jc LB_20420
	btr r12,3
	jmp LB_20421
LB_20420:
	bts r12,3
LB_20421:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_20426
	btr r12,4
	jmp LB_20427
LB_20426:
	bts r12,4
LB_20427:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_20424
	btr QWORD [rdi],0
	jmp LB_20425
LB_20424:
	bts QWORD [rdi],0
LB_20425:
	mov r10,r9
	bt r12,3
	jc LB_20430
	btr r12,4
	jmp LB_20431
LB_20430:
	bts r12,4
LB_20431:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_20428
	btr QWORD [rdi],1
	jmp LB_20429
LB_20428:
	bts QWORD [rdi],1
LB_20429:
	mov rsi,1
	bt r12,0
	jc LB_20422
	mov rsi,0
	bt r13,0
	jc LB_20422
	jmp LB_20423
LB_20422:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_20423:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_20396
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_20395
 ; {>  %_20395~0':(_lst)◂(t10176'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_20404:
NS_E_20435:
; 	|» 0'
NS_E_RDI_20435:
; _nil {  } ⊢ %_20433 : %_20433
 ; {>  %_20432~0':(_lst)◂(t10197'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f20396 { %_20433 %_20432 } ⊢ %_20434 : %_20434
 ; {>  %_20432~0':(_lst)◂(t10197'(-1)) %_20433~°1◂{  }:(_lst)◂(t10194'(0)) }
; _f20396 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_20436
	btr r12,1
	jmp LB_20437
LB_20436:
	bts r12,1
LB_20437:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_20438
	mov rsi,0
	bt r13,0
	jc LB_20438
	jmp LB_20439
LB_20438:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_20439:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_20396
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_20434
 ; {>  %_20434~0':(_lst)◂(t10197'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_20453:
; 	|» { 0' 1' }
NS_E_RDI_20453:
MTC_LB_20454:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_20455
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
	jnc LB_20456
	bt QWORD [rdi],0
	jc LB_20457
	btr r12,4
	clc
	jmp LB_20458
LB_20457:
	bts r12,4
	stc
LB_20458:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_20456:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_20461
	btr r12,5
	clc
	jmp LB_20462
LB_20461:
	bts r12,5
	stc
LB_20462:
	mov r8,r11
	bt r12,5
	jc LB_20459
	btr r12,2
	jmp LB_20460
LB_20459:
	bts r12,2
LB_20460:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_20465
	btr r12,5
	clc
	jmp LB_20466
LB_20465:
	bts r12,5
	stc
LB_20466:
	mov r9,r11
	bt r12,5
	jc LB_20463
	btr r12,3
	jmp LB_20464
LB_20463:
	bts r12,3
LB_20464:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_20467:
	cmp r15,0
	jz LB_20468
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20467
LB_20468:
; _f56 %_20440 ⊢ %_20444 : %_20444
 ; {>  %_20442~2':_r64 %_20440~0':_r64 %_20443~3':(_lst)◂(_r64) }
	add r13,1
; _f20453 { %_20444 %_20443 } ⊢ { %_20445 %_20446 } : { %_20445 %_20446 }
 ; {>  %_20444~0':_r64 %_20442~2':_r64 %_20443~3':(_lst)◂(_r64) }
; _f20453 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_20471
	btr r12,1
	jmp LB_20472
LB_20471:
	bts r12,1
LB_20472:
	call NS_E_20453
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_20469
	btr r12,2
	clc
	jmp LB_20470
LB_20469:
	bts r12,2
	stc
LB_20470:
	add rsp,16
; _f55 %_20445 ⊢ %_20447 : %_20447
 ; {>  %_20446~1':_stg %_20442~2':_r64 %_20445~0':_r64 }
	sub r13,1
; _f33 { %_20446 %_20447 %_20442 } ⊢ { %_20448 %_20449 %_20450 } : { %_20448 %_20449 %_20450 }
 ; {>  %_20446~1':_stg %_20442~2':_r64 %_20447~0':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_20473
	btr r12,3
	jmp LB_20474
LB_20473:
	bts r12,3
LB_20474:
	mov r14,r13
	bt r12,0
	jc LB_20475
	btr r12,1
	jmp LB_20476
LB_20475:
	bts r12,1
LB_20476:
	mov r13,r9
	bt r12,3
	jc LB_20477
	btr r12,0
	jmp LB_20478
LB_20477:
	bts r12,0
LB_20478:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_20449 %_20448 }
 ; {>  %_20448~0':_stg %_20449~1':_r64 %_20450~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_20479
	mov rdi,r8
	call dlt
LB_20479:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_20480
	btr r12,2
	jmp LB_20481
LB_20480:
	bts r12,2
LB_20481:
	mov r14,r13
	bt r12,0
	jc LB_20482
	btr r12,1
	jmp LB_20483
LB_20482:
	bts r12,1
LB_20483:
	mov r13,r8
	bt r12,2
	jc LB_20484
	btr r12,0
	jmp LB_20485
LB_20484:
	bts r12,0
LB_20485:
	ret
MTC_LB_20455:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_20486
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
	jnc LB_20487
	bt QWORD [rdi],0
	jc LB_20488
	btr r12,2
	clc
	jmp LB_20489
LB_20488:
	bts r12,2
	stc
LB_20489:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_20487:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_20490:
	cmp r15,0
	jz LB_20491
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20490
LB_20491:
; _f31 %_20440 ⊢ { %_20451 %_20452 } : { %_20451 %_20452 }
 ; {>  %_20440~0':_r64 }
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
; ∎ { %_20451 %_20452 }
 ; {>  %_20452~1':_stg %_20451~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_20486:
NS_E_20496:
; 	|» 0'
NS_E_RDI_20496:
; » 0xr0 |~ {  } ⊢ %_20493 : %_20493
 ; {>  %_20492~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_20493
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f20453 { %_20493 %_20492 } ⊢ { %_20494 %_20495 } : { %_20494 %_20495 }
 ; {>  %_20493~1':_r64 %_20492~0':(_lst)◂(_r64) }
; _f20453 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_20497
	btr r12,2
	jmp LB_20498
LB_20497:
	bts r12,2
LB_20498:
	mov r14,r13
	bt r12,0
	jc LB_20499
	btr r12,1
	jmp LB_20500
LB_20499:
	bts r12,1
LB_20500:
	mov r13,r8
	bt r12,2
	jc LB_20501
	btr r12,0
	jmp LB_20502
LB_20501:
	bts r12,0
LB_20502:
	call NS_E_20453
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_20495
 ; {>  %_20495~1':_stg %_20494~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_20503
	mov rdi,r13
	call dlt
LB_20503:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_20504
	btr r12,0
	jmp LB_20505
LB_20504:
	bts r12,0
LB_20505:
	ret
NS_E_20524:
; 	|» { 0' 1' }
NS_E_RDI_20524:
MTC_LB_20525:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_20526
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
	jnc LB_20527
	bt QWORD [rdi],0
	jc LB_20528
	btr r12,5
	clc
	jmp LB_20529
LB_20528:
	bts r12,5
	stc
LB_20529:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_20527:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_20538
	btr r12,6
	clc
	jmp LB_20539
LB_20538:
	bts r12,6
	stc
LB_20539:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_20532
	btr r12,4
	clc
	jmp LB_20533
LB_20532:
	bts r12,4
	stc
LB_20533:
	mov r8,r10
	bt r12,4
	jc LB_20530
	btr r12,2
	jmp LB_20531
LB_20530:
	bts r12,2
LB_20531:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_20536
	btr r12,4
	clc
	jmp LB_20537
LB_20536:
	bts r12,4
	stc
LB_20537:
	mov r9,r10
	bt r12,4
	jc LB_20534
	btr r12,3
	jmp LB_20535
LB_20534:
	bts r12,3
LB_20535:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_20542
	btr r12,6
	clc
	jmp LB_20543
LB_20542:
	bts r12,6
	stc
LB_20543:
	mov r10,rcx
	bt r12,6
	jc LB_20540
	btr r12,4
	jmp LB_20541
LB_20540:
	bts r12,4
LB_20541:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_20544:
	cmp r15,0
	jz LB_20545
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20544
LB_20545:
MTC_LB_20546:
	mov r15,0
	mov rdi,r14
	mov rsi,r8
	bt r12,1
	call eq
	jnz MTC_LB_20547
LB_20548:
	cmp r15,0
	jz LB_20549
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20548
LB_20549:
MTC_LB_20550:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_20551
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
	jnc LB_20552
	bt QWORD [rdi],0
	jc LB_20553
	btr r12,5
	clc
	jmp LB_20554
LB_20553:
	bts r12,5
	stc
LB_20554:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_20552:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_20555
	btr r12,0
	jmp LB_20556
LB_20555:
	bts r12,0
LB_20556:
LB_20557:
	cmp r15,0
	jz LB_20558
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20557
LB_20558:
; _emt_mov_ptn_to_ptn:{| 111010.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_20559
	btr r12,3
	jmp LB_20560
LB_20559:
	bts r12,3
LB_20560:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_20569
	btr r12,5
	clc
	jmp LB_20570
LB_20569:
	bts r12,5
	stc
LB_20570:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_20567
	btr r12,4
	clc
	jmp LB_20568
LB_20567:
	bts r12,4
	stc
LB_20568:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_20565
	btr r12,3
	clc
	jmp LB_20566
LB_20565:
	bts r12,3
	stc
LB_20566:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_20563
	btr r12,2
	clc
	jmp LB_20564
LB_20563:
	bts r12,2
	stc
LB_20564:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_20561
	btr r12,1
	clc
	jmp LB_20562
LB_20561:
	bts r12,1
	stc
LB_20562:
	add rsp,40
; _some %_20512 ⊢ %_20514 : %_20514
 ; {>  %_20513~5':t10278'(-1) %_20510~4':(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) %_20512~3':t10278'(-1) %_20507~1':t10270'(-1) %_20508~2':t10270'(-1) }
; _some 3' ⊢ °0◂3'
; _cns { { %_20508 %_20514 } %_20510 } ⊢ %_20515 : %_20515
 ; {>  %_20513~5':t10278'(-1) %_20510~4':(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) %_20507~1':t10270'(-1) %_20508~2':t10270'(-1) %_20514~°0◂3':(_opn)◂(t10278'(-1)) }
; _cns { { 2' °0◂3' } 4' } ⊢ °0◂{ { 2' °0◂3' } 4' }
; _some %_20513 ⊢ %_20516 : %_20516
 ; {>  %_20513~5':t10278'(-1) %_20507~1':t10270'(-1) %_20515~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) }
; _some 5' ⊢ °0◂5'
; ∎ { %_20515 %_20507 %_20516 }
 ; {>  %_20507~1':t10270'(-1) %_20516~°0◂5':(_opn)◂(t10278'(-1)) %_20515~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) }
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
	jc LB_20577
	btr r12,7
	jmp LB_20578
LB_20577:
	bts r12,7
LB_20578:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_20575
	btr QWORD [rdi],0
	jmp LB_20576
LB_20575:
	bts QWORD [rdi],0
LB_20576:
	mov rdx,r9
	bt r12,3
	jc LB_20583
	btr r12,7
	jmp LB_20584
LB_20583:
	bts r12,7
LB_20584:
	mov rsi,1
	bt r12,7
	jc LB_20581
	mov rsi,0
	bt rdx,0
	jc LB_20581
	jmp LB_20582
LB_20581:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_20582:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_20579
	btr QWORD [rdi],1
	jmp LB_20580
LB_20579:
	bts QWORD [rdi],1
LB_20580:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_20573
	btr QWORD [rdi],0
	jmp LB_20574
LB_20573:
	bts QWORD [rdi],0
LB_20574:
	mov rcx,r10
	bt r12,4
	jc LB_20587
	btr r12,6
	jmp LB_20588
LB_20587:
	bts r12,6
LB_20588:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_20585
	btr QWORD [rdi],1
	jmp LB_20586
LB_20585:
	bts QWORD [rdi],1
LB_20586:
	mov rsi,1
	bt r12,0
	jc LB_20571
	mov rsi,0
	bt r13,0
	jc LB_20571
	jmp LB_20572
LB_20571:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_20572:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov r8,r11
	bt r12,5
	jc LB_20591
	btr r12,2
	jmp LB_20592
LB_20591:
	bts r12,2
LB_20592:
	mov rsi,1
	bt r12,2
	jc LB_20589
	mov rsi,0
	bt r8,0
	jc LB_20589
	jmp LB_20590
LB_20589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_20590:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_20551:
	mov r15,0
LB_20594:
	cmp r15,0
	jz LB_20595
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20594
LB_20595:
; _cns { { %_20508 %_20509 } %_20510 } ⊢ %_20517 : %_20517
 ; {>  %_20509~3':(_opn)◂(t10278'(-1)) %_20510~4':(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) %_20507~1':t10270'(-1) %_20508~2':t10270'(-1) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _none {  } ⊢ %_20518 : %_20518
 ; {>  %_20507~1':t10270'(-1) %_20517~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_20517 %_20507 %_20518 }
 ; {>  %_20518~°1◂{  }:(_opn)◂(t10264'(0)) %_20507~1':t10270'(-1) %_20517~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) }
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
	jc LB_20602
	btr r12,6
	jmp LB_20603
LB_20602:
	bts r12,6
LB_20603:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_20600
	btr QWORD [rdi],0
	jmp LB_20601
LB_20600:
	bts QWORD [rdi],0
LB_20601:
	mov rcx,r9
	bt r12,3
	jc LB_20606
	btr r12,6
	jmp LB_20607
LB_20606:
	bts r12,6
LB_20607:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_20604
	btr QWORD [rdi],1
	jmp LB_20605
LB_20604:
	bts QWORD [rdi],1
LB_20605:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_20598
	btr QWORD [rdi],0
	jmp LB_20599
LB_20598:
	bts QWORD [rdi],0
LB_20599:
	mov r11,r10
	bt r12,4
	jc LB_20610
	btr r12,5
	jmp LB_20611
LB_20610:
	bts r12,5
LB_20611:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_20608
	btr QWORD [rdi],1
	jmp LB_20609
LB_20608:
	bts QWORD [rdi],1
LB_20609:
	mov rsi,1
	bt r12,0
	jc LB_20596
	mov rsi,0
	bt r13,0
	jc LB_20596
	jmp LB_20597
LB_20596:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_20597:
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
	jc LB_20612
	mov rsi,0
	bt r8,0
	jc LB_20612
	jmp LB_20613
LB_20612:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_20613:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_20593:
MTC_LB_20547:
	mov r15,0
LB_20615:
	cmp r15,0
	jz LB_20616
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20615
LB_20616:
; _f20524 { %_20510 %_20507 } ⊢ { %_20519 %_20520 %_20521 } : { %_20519 %_20520 %_20521 }
 ; {>  %_20509~3':(_opn)◂(t10278'(-1)) %_20510~4':(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) %_20507~1':t10270'(-1) %_20508~2':t10270'(-1) }
; _f20524 { 4' 1' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010010.. |},{ 4' 1' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,4
	jc LB_20621
	btr r12,0
	jmp LB_20622
LB_20621:
	bts r12,0
LB_20622:
	call NS_E_20524
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_20623
	btr r12,4
	jmp LB_20624
LB_20623:
	bts r12,4
LB_20624:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_20619
	btr r12,3
	clc
	jmp LB_20620
LB_20619:
	bts r12,3
	stc
LB_20620:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_20617
	btr r12,2
	clc
	jmp LB_20618
LB_20617:
	bts r12,2
	stc
LB_20618:
	add rsp,24
; _cns { { %_20508 %_20509 } %_20519 } ⊢ %_20522 : %_20522
 ; {>  %_20519~0':(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) %_20520~1':t10270'(-1) %_20509~3':(_opn)◂(t10278'(-1)) %_20508~2':t10270'(-1) %_20521~4':(_opn)◂(t10278'(-1)) }
; _cns { { 2' 3' } 0' } ⊢ °0◂{ { 2' 3' } 0' }
; ∎ { %_20522 %_20520 %_20521 }
 ; {>  %_20520~1':t10270'(-1) %_20522~°0◂{ { 2' 3' } 0' }:(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) %_20521~4':(_opn)◂(t10278'(-1)) }
; 	∎ { °0◂{ { 2' 3' } 0' } 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ °0◂{ { 2' 3' } 0' } 1' 4' } ⊢ { 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_20625
	btr r12,5
	jmp LB_20626
LB_20625:
	bts r12,5
LB_20626:
	mov r8,r10
	bt r12,4
	jc LB_20627
	btr r12,2
	jmp LB_20628
LB_20627:
	bts r12,2
LB_20628:
	mov r10,r13
	bt r12,0
	jc LB_20629
	btr r12,4
	jmp LB_20630
LB_20629:
	bts r12,4
LB_20630:
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
	jc LB_20637
	btr r12,7
	jmp LB_20638
LB_20637:
	bts r12,7
LB_20638:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_20635
	btr QWORD [rdi],0
	jmp LB_20636
LB_20635:
	bts QWORD [rdi],0
LB_20636:
	mov rdx,r9
	bt r12,3
	jc LB_20641
	btr r12,7
	jmp LB_20642
LB_20641:
	bts r12,7
LB_20642:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_20639
	btr QWORD [rdi],1
	jmp LB_20640
LB_20639:
	bts QWORD [rdi],1
LB_20640:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_20633
	btr QWORD [rdi],0
	jmp LB_20634
LB_20633:
	bts QWORD [rdi],0
LB_20634:
	mov rcx,r10
	bt r12,4
	jc LB_20645
	btr r12,6
	jmp LB_20646
LB_20645:
	bts r12,6
LB_20646:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_20643
	btr QWORD [rdi],1
	jmp LB_20644
LB_20643:
	bts QWORD [rdi],1
LB_20644:
	mov rsi,1
	bt r12,0
	jc LB_20631
	mov rsi,0
	bt r13,0
	jc LB_20631
	jmp LB_20632
LB_20631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_20632:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_20614:
MTC_LB_20526:
	mov r15,0
LB_20648:
	cmp r15,0
	jz LB_20649
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20648
LB_20649:
; _none {  } ⊢ %_20523 : %_20523
 ; {>  %_20507~1':t10270'(-1) %_20506~0':(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_20506 %_20507 %_20523 }
 ; {>  %_20507~1':t10270'(-1) %_20506~0':(_lst)◂({ t10270'(-1) (_opn)◂(t10278'(-1)) }) %_20523~°1◂{  }:(_opn)◂(t10275'(0)) }
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
	jc LB_20650
	mov rsi,0
	bt r8,0
	jc LB_20650
	jmp LB_20651
LB_20650:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_20651:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_20647:
NS_E_20652:
NS_E_RDI_20652:
NS_E_20652_ETR_TBL:
NS_E_20652_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_20693
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_20693
	jmp LB_20694
LB_20693:
	jmp LB_20683
LB_20694:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_20653_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20698
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20699
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20699:
	jmp LB_20683
LB_20698:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20686
	btr r12,1
	clc
	jmp LB_20687
LB_20686:
	bts r12,1
	stc
LB_20687:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20684
	btr r12,0
	clc
	jmp LB_20685
LB_20684:
	bts r12,0
	stc
LB_20685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20680
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_20701
	btr r12,2
	jmp LB_20702
LB_20701:
	bts r12,2
LB_20702:
	mov r13,r14
	bt r12,1
	jc LB_20703
	btr r12,0
	jmp LB_20704
LB_20703:
	bts r12,0
LB_20704:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f20496 %_20655 ⊢ %_20656 : %_20656
 ; {>  %_20655~0':(_lst)◂(_r64) }
; _f20496 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20496
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_20656 ⊢ %_20657 : %_20657
 ; {>  %_20656~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_20657
 ; {>  %_20657~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20678
	btr r12,3
	jmp LB_20679
LB_20678:
	bts r12,3
LB_20679:
	mov r8,0
	bts r12,2
	ret
LB_20680:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20682
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20681
LB_20682:
	add rsp,8
	ret
LB_20683:
	add rsp,32
	pop r14
LB_20681:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20653:
NS_E_RDI_20653:
NS_E_20653_ETR_TBL:
NS_E_20653_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_20730
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_20730
	jmp LB_20731
LB_20730:
	jmp LB_20718
LB_20731:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_20654_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20735
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20736
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20736:
	jmp LB_20718
LB_20735:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_20653_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20741
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_20742
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_20742:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20743:
	jmp LB_20718
LB_20741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_20723
	btr r12,2
	clc
	jmp LB_20724
LB_20723:
	bts r12,2
	stc
LB_20724:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20721
	btr r12,1
	clc
	jmp LB_20722
LB_20721:
	bts r12,1
	stc
LB_20722:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20719
	btr r12,0
	clc
	jmp LB_20720
LB_20719:
	bts r12,0
	stc
LB_20720:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_20715
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_20745
	btr r12,3
	jmp LB_20746
LB_20745:
	bts r12,3
LB_20746:
	mov r14,r8
	bt r12,2
	jc LB_20747
	btr r12,1
	jmp LB_20748
LB_20747:
	bts r12,1
LB_20748:
	mov r8,r13
	bt r12,0
	jc LB_20749
	btr r12,2
	jmp LB_20750
LB_20749:
	bts r12,2
LB_20750:
	mov r13,r9
	bt r12,3
	jc LB_20751
	btr r12,0
	jmp LB_20752
LB_20751:
	bts r12,0
LB_20752:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_20658 %_20659 } ⊢ %_20660 : %_20660
 ; {>  %_20658~0':_r64 %_20659~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_20660 ⊢ %_20661 : %_20661
 ; {>  %_20660~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_20661
 ; {>  %_20661~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_20709
	btr r12,2
	jmp LB_20710
LB_20709:
	bts r12,2
LB_20710:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_20707
	btr QWORD [rdi],0
	jmp LB_20708
LB_20707:
	bts QWORD [rdi],0
LB_20708:
	mov r8,r14
	bt r12,1
	jc LB_20713
	btr r12,2
	jmp LB_20714
LB_20713:
	bts r12,2
LB_20714:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_20711
	btr QWORD [rdi],1
	jmp LB_20712
LB_20711:
	bts QWORD [rdi],1
LB_20712:
	mov rsi,1
	bt r12,3
	jc LB_20705
	mov rsi,0
	bt r9,0
	jc LB_20705
	jmp LB_20706
LB_20705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20706:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20715:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20717
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20716
LB_20717:
	add rsp,8
	ret
LB_20718:
	add rsp,48
	pop r14
LB_20716:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_20766
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_20766
	jmp LB_20767
LB_20766:
	jmp LB_20758
LB_20767:
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
	jc LB_20759
	btr r12,0
	clc
	jmp LB_20760
LB_20759:
	bts r12,0
	stc
LB_20760:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20755
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_20662 : %_20662
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_20662 ⊢ %_20663 : %_20663
 ; {>  %_20662~°1◂{  }:(_lst)◂(t10327'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_20663
 ; {>  %_20663~°0◂°1◂{  }:(_opn)◂((_lst)◂(t10330'(0))) }
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
	jc LB_20753
	mov rsi,0
	bt r9,0
	jc LB_20753
	jmp LB_20754
LB_20753:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20754:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20755:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20757
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20756
LB_20757:
	add rsp,8
	ret
LB_20758:
	add rsp,16
	pop r14
LB_20756:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_20374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20789
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20781
LB_20789:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_20653_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20794
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20795
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20795:
	jmp LB_20781
LB_20794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20784
	btr r12,1
	clc
	jmp LB_20785
LB_20784:
	bts r12,1
	stc
LB_20785:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20782
	btr r12,0
	clc
	jmp LB_20783
LB_20782:
	bts r12,0
	stc
LB_20783:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20778
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_20664 %_20665 } ⊢ %_20666 : %_20666
 ; {>  %_20664~0':_r64 %_20665~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_20666 ⊢ %_20667 : %_20667
 ; {>  %_20666~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_20667
 ; {>  %_20667~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_20772
	btr r12,2
	jmp LB_20773
LB_20772:
	bts r12,2
LB_20773:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_20770
	btr QWORD [rdi],0
	jmp LB_20771
LB_20770:
	bts QWORD [rdi],0
LB_20771:
	mov r8,r14
	bt r12,1
	jc LB_20776
	btr r12,2
	jmp LB_20777
LB_20776:
	bts r12,2
LB_20777:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_20774
	btr QWORD [rdi],1
	jmp LB_20775
LB_20774:
	bts QWORD [rdi],1
LB_20775:
	mov rsi,1
	bt r12,3
	jc LB_20768
	mov rsi,0
	bt r9,0
	jc LB_20768
	jmp LB_20769
LB_20768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20769:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20778:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20780
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20779
LB_20780:
	add rsp,8
	ret
LB_20781:
	add rsp,32
	pop r14
LB_20779:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20654:
NS_E_RDI_20654:
NS_E_20654_ETR_TBL:
NS_E_20654_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_20810
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_20810
	jmp LB_20811
LB_20810:
	jmp LB_20802
LB_20811:
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
	jc LB_20803
	btr r12,0
	clc
	jmp LB_20804
LB_20803:
	bts r12,0
	stc
LB_20804:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20799
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_20668 : %_20668
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_20668
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_20668 ⊢ %_20669 : %_20669
 ; {>  %_20668~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20669
 ; {>  %_20669~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20797
	btr r12,3
	jmp LB_20798
LB_20797:
	bts r12,3
LB_20798:
	mov r8,0
	bts r12,2
	ret
LB_20799:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20801
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20800
LB_20801:
	add rsp,8
	ret
LB_20802:
	add rsp,16
	pop r14
LB_20800:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_20825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_20825
	jmp LB_20826
LB_20825:
	jmp LB_20817
LB_20826:
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
	jc LB_20818
	btr r12,0
	clc
	jmp LB_20819
LB_20818:
	bts r12,0
	stc
LB_20819:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20814
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_20670 : %_20670
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_20670
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_20670 ⊢ %_20671 : %_20671
 ; {>  %_20670~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20671
 ; {>  %_20671~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20812
	btr r12,3
	jmp LB_20813
LB_20812:
	bts r12,3
LB_20813:
	mov r8,0
	bts r12,2
	ret
LB_20814:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20816
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20815
LB_20816:
	add rsp,8
	ret
LB_20817:
	add rsp,16
	pop r14
LB_20815:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_20840
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_20840
	jmp LB_20841
LB_20840:
	jmp LB_20832
LB_20841:
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
	jc LB_20833
	btr r12,0
	clc
	jmp LB_20834
LB_20833:
	bts r12,0
	stc
LB_20834:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20829
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_20672 : %_20672
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_20672
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_20672 ⊢ %_20673 : %_20673
 ; {>  %_20672~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20673
 ; {>  %_20673~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20827
	btr r12,3
	jmp LB_20828
LB_20827:
	bts r12,3
LB_20828:
	mov r8,0
	bts r12,2
	ret
LB_20829:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20831
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20830
LB_20831:
	add rsp,8
	ret
LB_20832:
	add rsp,16
	pop r14
LB_20830:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_20855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_20855
	jmp LB_20856
LB_20855:
	jmp LB_20847
LB_20856:
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
	jc LB_20848
	btr r12,0
	clc
	jmp LB_20849
LB_20848:
	bts r12,0
	stc
LB_20849:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20844
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_20674 : %_20674
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_20674
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_20674 ⊢ %_20675 : %_20675
 ; {>  %_20674~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20675
 ; {>  %_20675~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20842
	btr r12,3
	jmp LB_20843
LB_20842:
	bts r12,3
LB_20843:
	mov r8,0
	bts r12,2
	ret
LB_20844:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20846
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20845
LB_20846:
	add rsp,8
	ret
LB_20847:
	add rsp,16
	pop r14
LB_20845:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_20870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_20870
	jmp LB_20871
LB_20870:
	jmp LB_20862
LB_20871:
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
	jc LB_20863
	btr r12,0
	clc
	jmp LB_20864
LB_20863:
	bts r12,0
	stc
LB_20864:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20859
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_20676 : %_20676
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_20676
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_20676 ⊢ %_20677 : %_20677
 ; {>  %_20676~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20677
 ; {>  %_20677~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20857
	btr r12,3
	jmp LB_20858
LB_20857:
	bts r12,3
LB_20858:
	mov r8,0
	bts r12,2
	ret
LB_20859:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20861
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20860
LB_20861:
	add rsp,8
	ret
LB_20862:
	add rsp,16
	pop r14
LB_20860:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20872:
NS_E_RDI_20872:
NS_E_20872_ETR_TBL:
NS_E_20872_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_20374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20911
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20905
LB_20911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20906
	btr r12,0
	clc
	jmp LB_20907
LB_20906:
	bts r12,0
	stc
LB_20907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20902
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_20874 : %_20874
 ; {>  %_20873~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_20874
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_20875 : %_20875
 ; {>  %_20874~1':_r64 %_20873~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_20875
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_20873 %_20874 } ⊢ { %_20876 %_20877 %_20878 } : { %_20876 %_20877 %_20878 }
 ; {>  %_20874~1':_r64 %_20873~0':_r64 %_20875~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_20875 %_20876 } ⊢ { %_20879 %_20880 %_20881 } : { %_20879 %_20880 %_20881 }
 ; {>  %_20877~1':_r64 %_20878~3':_r64 %_20876~0':_r64 %_20875~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_20884:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_20885
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_20885
LB_20886:
	cmp r15,0
	jz LB_20887
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20886
LB_20887:
; _some %_20880 ⊢ %_20882 : %_20882
 ; {>  %_20877~1':_r64 %_20881~4':_r64 %_20878~3':_r64 %_20880~0':_r64 %_20879~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20882
 ; {>  %_20877~1':_r64 %_20881~4':_r64 %_20878~3':_r64 %_20882~°0◂0':(_opn)◂(_r64) %_20879~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_20888
	mov rdi,r14
	call dlt
LB_20888:
	bt r12,4
	jc LB_20889
	mov rdi,r10
	call dlt
LB_20889:
	bt r12,3
	jc LB_20890
	mov rdi,r9
	call dlt
LB_20890:
	bt r12,2
	jc LB_20891
	mov rdi,r8
	call dlt
LB_20891:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20892
	btr r12,3
	jmp LB_20893
LB_20892:
	bts r12,3
LB_20893:
	mov r8,0
	bts r12,2
	ret
MTC_LB_20885:
	mov r15,0
LB_20895:
	cmp r15,0
	jz LB_20896
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20895
LB_20896:
; _none {  } ⊢ %_20883 : %_20883
 ; {>  %_20877~1':_r64 %_20881~4':_r64 %_20878~3':_r64 %_20880~0':_r64 %_20879~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_20883
 ; {>  %_20883~°1◂{  }:(_opn)◂(t10406'(0)) %_20877~1':_r64 %_20881~4':_r64 %_20878~3':_r64 %_20880~0':_r64 %_20879~2':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_20897
	mov rdi,r14
	call dlt
LB_20897:
	bt r12,4
	jc LB_20898
	mov rdi,r10
	call dlt
LB_20898:
	bt r12,3
	jc LB_20899
	mov rdi,r9
	call dlt
LB_20899:
	bt r12,0
	jc LB_20900
	mov rdi,r13
	call dlt
LB_20900:
	bt r12,2
	jc LB_20901
	mov rdi,r8
	call dlt
LB_20901:
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
MTC_LB_20894:
LB_20902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20904
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20903
LB_20904:
	add rsp,8
	ret
LB_20905:
	add rsp,16
	pop r14
LB_20903:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20913:
NS_E_RDI_20913:
NS_E_20913_ETR_TBL:
NS_E_20913_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_20374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20952
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20946
LB_20952:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20947
	btr r12,0
	clc
	jmp LB_20948
LB_20947:
	bts r12,0
	stc
LB_20948:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20943
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_20915 : %_20915
 ; {>  %_20914~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_20915
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_20916 : %_20916
 ; {>  %_20915~1':_r64 %_20914~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_20916
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_20914 %_20915 } ⊢ { %_20917 %_20918 %_20919 } : { %_20917 %_20918 %_20919 }
 ; {>  %_20915~1':_r64 %_20916~2':_r64 %_20914~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_20916 %_20917 } ⊢ { %_20920 %_20921 %_20922 } : { %_20920 %_20921 %_20922 }
 ; {>  %_20919~3':_r64 %_20916~2':_r64 %_20918~1':_r64 %_20917~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_20925:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_20926
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_20926
LB_20927:
	cmp r15,0
	jz LB_20928
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20927
LB_20928:
; _some %_20921 ⊢ %_20923 : %_20923
 ; {>  %_20921~0':_r64 %_20919~3':_r64 %_20920~2':_r64 %_20922~4':_r64 %_20918~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20923
 ; {>  %_20919~3':_r64 %_20920~2':_r64 %_20922~4':_r64 %_20923~°0◂0':(_opn)◂(_r64) %_20918~1':_r64 }
; 	∎ °0◂0'
	bt r12,3
	jc LB_20929
	mov rdi,r9
	call dlt
LB_20929:
	bt r12,2
	jc LB_20930
	mov rdi,r8
	call dlt
LB_20930:
	bt r12,4
	jc LB_20931
	mov rdi,r10
	call dlt
LB_20931:
	bt r12,1
	jc LB_20932
	mov rdi,r14
	call dlt
LB_20932:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20933
	btr r12,3
	jmp LB_20934
LB_20933:
	bts r12,3
LB_20934:
	mov r8,0
	bts r12,2
	ret
MTC_LB_20926:
	mov r15,0
LB_20936:
	cmp r15,0
	jz LB_20937
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20936
LB_20937:
; _none {  } ⊢ %_20924 : %_20924
 ; {>  %_20921~0':_r64 %_20919~3':_r64 %_20920~2':_r64 %_20922~4':_r64 %_20918~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_20924
 ; {>  %_20921~0':_r64 %_20919~3':_r64 %_20920~2':_r64 %_20922~4':_r64 %_20924~°1◂{  }:(_opn)◂(t10433'(0)) %_20918~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_20938
	mov rdi,r13
	call dlt
LB_20938:
	bt r12,3
	jc LB_20939
	mov rdi,r9
	call dlt
LB_20939:
	bt r12,2
	jc LB_20940
	mov rdi,r8
	call dlt
LB_20940:
	bt r12,4
	jc LB_20941
	mov rdi,r10
	call dlt
LB_20941:
	bt r12,1
	jc LB_20942
	mov rdi,r14
	call dlt
LB_20942:
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
MTC_LB_20935:
LB_20943:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20945
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20944
LB_20945:
	add rsp,8
	ret
LB_20946:
	add rsp,16
	pop r14
LB_20944:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20954:
NS_E_RDI_20954:
NS_E_20954_ETR_TBL:
NS_E_20954_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_20374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20993
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20987
LB_20993:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20988
	btr r12,0
	clc
	jmp LB_20989
LB_20988:
	bts r12,0
	stc
LB_20989:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20984
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_20956 : %_20956
 ; {>  %_20955~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_20956
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_20957 : %_20957
 ; {>  %_20955~0':_r64 %_20956~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_20957
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_20955 %_20956 } ⊢ { %_20958 %_20959 %_20960 } : { %_20958 %_20959 %_20960 }
 ; {>  %_20955~0':_r64 %_20957~2':_r64 %_20956~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_20957 %_20958 } ⊢ { %_20961 %_20962 %_20963 } : { %_20961 %_20962 %_20963 }
 ; {>  %_20958~0':_r64 %_20957~2':_r64 %_20959~1':_r64 %_20960~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_20966:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_20967
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_20967
LB_20968:
	cmp r15,0
	jz LB_20969
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20968
LB_20969:
; _some %_20962 ⊢ %_20964 : %_20964
 ; {>  %_20962~0':_r64 %_20961~2':_r64 %_20963~4':_r64 %_20959~1':_r64 %_20960~3':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20964
 ; {>  %_20961~2':_r64 %_20963~4':_r64 %_20959~1':_r64 %_20964~°0◂0':(_opn)◂(_r64) %_20960~3':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_20970
	mov rdi,r8
	call dlt
LB_20970:
	bt r12,4
	jc LB_20971
	mov rdi,r10
	call dlt
LB_20971:
	bt r12,1
	jc LB_20972
	mov rdi,r14
	call dlt
LB_20972:
	bt r12,3
	jc LB_20973
	mov rdi,r9
	call dlt
LB_20973:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20974
	btr r12,3
	jmp LB_20975
LB_20974:
	bts r12,3
LB_20975:
	mov r8,0
	bts r12,2
	ret
MTC_LB_20967:
	mov r15,0
LB_20977:
	cmp r15,0
	jz LB_20978
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20977
LB_20978:
; _none {  } ⊢ %_20965 : %_20965
 ; {>  %_20962~0':_r64 %_20961~2':_r64 %_20963~4':_r64 %_20959~1':_r64 %_20960~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_20965
 ; {>  %_20962~0':_r64 %_20961~2':_r64 %_20965~°1◂{  }:(_opn)◂(t10460'(0)) %_20963~4':_r64 %_20959~1':_r64 %_20960~3':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_20979
	mov rdi,r13
	call dlt
LB_20979:
	bt r12,2
	jc LB_20980
	mov rdi,r8
	call dlt
LB_20980:
	bt r12,4
	jc LB_20981
	mov rdi,r10
	call dlt
LB_20981:
	bt r12,1
	jc LB_20982
	mov rdi,r14
	call dlt
LB_20982:
	bt r12,3
	jc LB_20983
	mov rdi,r9
	call dlt
LB_20983:
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
MTC_LB_20976:
LB_20984:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20986
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_20985
LB_20986:
	add rsp,8
	ret
LB_20987:
	add rsp,16
	pop r14
LB_20985:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20995:
NS_E_RDI_20995:
NS_E_20995_ETR_TBL:
NS_E_20995_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_20954_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21011
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21005
LB_21011:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21006
	btr r12,0
	clc
	jmp LB_21007
LB_21006:
	bts r12,0
	stc
LB_21007:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_21002
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_20996 ⊢ %_20997 : %_20997
 ; {>  %_20996~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20997
 ; {>  %_20997~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21000
	btr r12,3
	jmp LB_21001
LB_21000:
	bts r12,3
LB_21001:
	mov r8,0
	bts r12,2
	ret
LB_21002:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21004
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21003
LB_21004:
	add rsp,8
	ret
LB_21005:
	add rsp,16
	pop r14
LB_21003:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_20913_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21024
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21018
LB_21024:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21019
	btr r12,0
	clc
	jmp LB_21020
LB_21019:
	bts r12,0
	stc
LB_21020:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_21015
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_20998 ⊢ %_20999 : %_20999
 ; {>  %_20998~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20999
 ; {>  %_20999~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21013
	btr r12,3
	jmp LB_21014
LB_21013:
	bts r12,3
LB_21014:
	mov r8,0
	bts r12,2
	ret
LB_21015:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21017
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21016
LB_21017:
	add rsp,8
	ret
LB_21018:
	add rsp,16
	pop r14
LB_21016:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21026:
NS_E_RDI_21026:
NS_E_21026_ETR_TBL:
NS_E_21026_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_20995_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21071
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21063
LB_21071:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_21027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21076
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21077
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21077:
	jmp LB_21063
LB_21076:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21066
	btr r12,1
	clc
	jmp LB_21067
LB_21066:
	bts r12,1
	stc
LB_21067:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21064
	btr r12,0
	clc
	jmp LB_21065
LB_21064:
	bts r12,0
	stc
LB_21065:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_21060
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_21029 %_21030 } ⊢ %_21031 : %_21031
 ; {>  %_21029~0':_r64 %_21030~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f20496 %_21031 ⊢ %_21032 : %_21032
 ; {>  %_21031~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f20496 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_21046
	btr r12,2
	jmp LB_21047
LB_21046:
	bts r12,2
LB_21047:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_21052
	btr r12,3
	jmp LB_21053
LB_21052:
	bts r12,3
LB_21053:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_21050
	btr QWORD [rdi],0
	jmp LB_21051
LB_21050:
	bts QWORD [rdi],0
LB_21051:
	mov r9,r14
	bt r12,1
	jc LB_21056
	btr r12,3
	jmp LB_21057
LB_21056:
	bts r12,3
LB_21057:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_21054
	btr QWORD [rdi],1
	jmp LB_21055
LB_21054:
	bts QWORD [rdi],1
LB_21055:
	mov rsi,1
	bt r12,0
	jc LB_21048
	mov rsi,0
	bt r13,0
	jc LB_21048
	jmp LB_21049
LB_21048:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_21049:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_20496
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_21032 ⊢ %_21033 : %_21033
 ; {>  %_21032~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_21033
 ; {>  %_21033~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21058
	btr r12,3
	jmp LB_21059
LB_21058:
	bts r12,3
LB_21059:
	mov r8,0
	bts r12,2
	ret
LB_21060:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21062
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21061
LB_21062:
	add rsp,8
	ret
LB_21063:
	add rsp,32
	pop r14
LB_21061:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21027:
NS_E_RDI_21027:
NS_E_21027_ETR_TBL:
NS_E_21027_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_21028_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21100
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21092
LB_21100:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_21027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21105
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21106
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21106:
	jmp LB_21092
LB_21105:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21095
	btr r12,1
	clc
	jmp LB_21096
LB_21095:
	bts r12,1
	stc
LB_21096:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21093
	btr r12,0
	clc
	jmp LB_21094
LB_21093:
	bts r12,0
	stc
LB_21094:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_21089
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_21034 %_21035 } ⊢ %_21036 : %_21036
 ; {>  %_21035~1':(_lst)◂(_r64) %_21034~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_21036 ⊢ %_21037 : %_21037
 ; {>  %_21036~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_21037
 ; {>  %_21037~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_21083
	btr r12,2
	jmp LB_21084
LB_21083:
	bts r12,2
LB_21084:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_21081
	btr QWORD [rdi],0
	jmp LB_21082
LB_21081:
	bts QWORD [rdi],0
LB_21082:
	mov r8,r14
	bt r12,1
	jc LB_21087
	btr r12,2
	jmp LB_21088
LB_21087:
	bts r12,2
LB_21088:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_21085
	btr QWORD [rdi],1
	jmp LB_21086
LB_21085:
	bts QWORD [rdi],1
LB_21086:
	mov rsi,1
	bt r12,3
	jc LB_21079
	mov rsi,0
	bt r9,0
	jc LB_21079
	jmp LB_21080
LB_21079:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_21080:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_21089:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21091
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21090
LB_21091:
	add rsp,8
	ret
LB_21092:
	add rsp,32
	pop r14
LB_21090:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_21110
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_21038 : %_21038
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_21038 ⊢ %_21039 : %_21039
 ; {>  %_21038~°1◂{  }:(_lst)◂(t10504'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_21039
 ; {>  %_21039~°0◂°1◂{  }:(_opn)◂((_lst)◂(t10507'(0))) }
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
	jc LB_21108
	mov rsi,0
	bt r9,0
	jc LB_21108
	jmp LB_21109
LB_21108:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_21109:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_21110:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21112
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21111
LB_21112:
	add rsp,8
	ret
LB_21113:
	add rsp,0
	pop r14
LB_21111:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21028:
NS_E_RDI_21028:
NS_E_21028_ETR_TBL:
NS_E_21028_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_20995_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21125
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21119
LB_21125:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21120
	btr r12,0
	clc
	jmp LB_21121
LB_21120:
	bts r12,0
	stc
LB_21121:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_21116
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_21040 ⊢ %_21041 : %_21041
 ; {>  %_21040~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_21041
 ; {>  %_21041~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21114
	btr r12,3
	jmp LB_21115
LB_21114:
	bts r12,3
LB_21115:
	mov r8,0
	bts r12,2
	ret
LB_21116:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21118
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21117
LB_21118:
	add rsp,8
	ret
LB_21119:
	add rsp,16
	pop r14
LB_21117:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_20872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21138
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21132
LB_21138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21133
	btr r12,0
	clc
	jmp LB_21134
LB_21133:
	bts r12,0
	stc
LB_21134:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_21129
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_21042 ⊢ %_21043 : %_21043
 ; {>  %_21042~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_21043
 ; {>  %_21043~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21127
	btr r12,3
	jmp LB_21128
LB_21127:
	bts r12,3
LB_21128:
	mov r8,0
	bts r12,2
	ret
LB_21129:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21131
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21130
LB_21131:
	add rsp,8
	ret
LB_21132:
	add rsp,16
	pop r14
LB_21130:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_21153
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_21153
	jmp LB_21154
LB_21153:
	jmp LB_21145
LB_21154:
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
	jc LB_21146
	btr r12,0
	clc
	jmp LB_21147
LB_21146:
	bts r12,0
	stc
LB_21147:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_21142
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_21044 : %_21044
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_21044
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_21044 ⊢ %_21045 : %_21045
 ; {>  %_21044~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_21045
 ; {>  %_21045~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21140
	btr r12,3
	jmp LB_21141
LB_21140:
	bts r12,3
LB_21141:
	mov r8,0
	bts r12,2
	ret
LB_21142:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21144
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21143
LB_21144:
	add rsp,8
	ret
LB_21145:
	add rsp,16
	pop r14
LB_21143:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21155:
NS_E_RDI_21155:
NS_E_21155_ETR_TBL:
NS_E_21155_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_21176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_21176
	jmp LB_21177
LB_21176:
	jmp LB_21166
LB_21177:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_21027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21181
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21182
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21182:
	jmp LB_21166
LB_21181:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21169
	btr r12,1
	clc
	jmp LB_21170
LB_21169:
	bts r12,1
	stc
LB_21170:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21167
	btr r12,0
	clc
	jmp LB_21168
LB_21167:
	bts r12,0
	stc
LB_21168:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_21163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_21184
	btr r12,2
	jmp LB_21185
LB_21184:
	bts r12,2
LB_21185:
	mov r13,r14
	bt r12,1
	jc LB_21186
	btr r12,0
	jmp LB_21187
LB_21186:
	bts r12,0
LB_21187:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f20496 %_21156 ⊢ %_21157 : %_21157
 ; {>  %_21156~0':(_lst)◂(_r64) }
; _f20496 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20496
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_21157 ⊢ %_21158 : %_21158
 ; {>  %_21157~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_21158
 ; {>  %_21158~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21161
	btr r12,3
	jmp LB_21162
LB_21161:
	bts r12,3
LB_21162:
	mov r8,0
	bts r12,2
	ret
LB_21163:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21165
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21164
LB_21165:
	add rsp,8
	ret
LB_21166:
	add rsp,32
	pop r14
LB_21164:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21199
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21193
LB_21199:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21194
	btr r12,0
	clc
	jmp LB_21195
LB_21194:
	bts r12,0
	stc
LB_21195:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_21190
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_21159 ⊢ %_21160 : %_21160
 ; {>  %_21159~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_21160
 ; {>  %_21160~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21188
	btr r12,3
	jmp LB_21189
LB_21188:
	bts r12,3
LB_21189:
	mov r8,0
	bts r12,2
	ret
LB_21190:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21192
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_21191
LB_21192:
	add rsp,8
	ret
LB_21193:
	add rsp,16
	pop r14
LB_21191:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21212:
; 	|» 0'
NS_E_RDI_21212:
MTC_LB_21213:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21214
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
	jnc LB_21215
	bt QWORD [rdi],0
	jc LB_21216
	btr r12,3
	clc
	jmp LB_21217
LB_21216:
	bts r12,3
	stc
LB_21217:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21215:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_21220
	btr r12,4
	clc
	jmp LB_21221
LB_21220:
	bts r12,4
	stc
LB_21221:
	mov r14,r10
	bt r12,4
	jc LB_21218
	btr r12,1
	jmp LB_21219
LB_21218:
	bts r12,1
LB_21219:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_21224
	btr r12,4
	clc
	jmp LB_21225
LB_21224:
	bts r12,4
	stc
LB_21225:
	mov r8,r10
	bt r12,4
	jc LB_21222
	btr r12,2
	jmp LB_21223
LB_21222:
	bts r12,2
LB_21223:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21226:
	cmp r15,0
	jz LB_21227
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21226
LB_21227:
; _f21212 %_21206 ⊢ %_21207 : %_21207
 ; {>  %_21206~2':_p21201 %_21205~1':_stg }
; _f21212 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21230
	btr r12,0
	jmp LB_21231
LB_21230:
	bts r12,0
LB_21231:
	call NS_E_21212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_21228
	btr r12,1
	clc
	jmp LB_21229
LB_21228:
	bts r12,1
	stc
LB_21229:
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
; ∎ %_21210
 ; {>  %_21209~0':_stg %_21208~1':_stg %_21210~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_21232
	mov rdi,r13
	call dlt
LB_21232:
	bt r12,1
	jc LB_21233
	mov rdi,r14
	call dlt
LB_21233:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21234
	btr r12,0
	jmp LB_21235
LB_21234:
	bts r12,0
LB_21235:
	ret
MTC_LB_21214:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21236
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
	jnc LB_21237
	bt QWORD [rdi],0
	jc LB_21238
	btr r12,2
	clc
	jmp LB_21239
LB_21238:
	bts r12,2
	stc
LB_21239:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21237:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21240
	btr r12,1
	jmp LB_21241
LB_21240:
	bts r12,1
LB_21241:
LB_21242:
	cmp r15,0
	jz LB_21243
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21242
LB_21243:
; ∎ %_21211
 ; {>  %_21211~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21244
	btr r12,0
	jmp LB_21245
LB_21244:
	bts r12,0
LB_21245:
	ret
MTC_LB_21236:
NS_E_21347:
; 	|» 0'
NS_E_RDI_21347:
MTC_LB_21348:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21349
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
	jnc LB_21350
	bt QWORD [rdi],0
	jc LB_21351
	btr r12,2
	clc
	jmp LB_21352
LB_21351:
	bts r12,2
	stc
LB_21352:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21350:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21353
	btr r12,1
	jmp LB_21354
LB_21353:
	bts r12,1
LB_21354:
LB_21355:
	cmp r15,0
	jz LB_21356
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21355
LB_21356:
; 	» "??r" _ ⊢ 0' : %_21342
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_21342
 ; {>  %_21341~1':_r64 %_21342~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_21357
	mov rdi,r14
	call dlt
LB_21357:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21349:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21358
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
	jnc LB_21359
	bt QWORD [rdi],0
	jc LB_21360
	btr r12,2
	clc
	jmp LB_21361
LB_21360:
	bts r12,2
	stc
LB_21361:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21359:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21362
	btr r12,1
	jmp LB_21363
LB_21362:
	bts r12,1
LB_21363:
LB_21364:
	cmp r15,0
	jz LB_21365
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21364
LB_21365:
; 	» ".." _ ⊢ 0' : %_21344
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_21344
 ; {>  %_21344~0':_stg %_21343~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_21366
	mov rdi,r14
	call dlt
LB_21366:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21358:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_21367
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
	jnc LB_21368
	bt QWORD [rdi],0
	jc LB_21369
	btr r12,2
	clc
	jmp LB_21370
LB_21369:
	bts r12,2
	stc
LB_21370:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21368:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21371
	btr r12,1
	jmp LB_21372
LB_21371:
	bts r12,1
LB_21372:
LB_21373:
	cmp r15,0
	jz LB_21374
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21373
LB_21374:
; _f21212 %_21345 ⊢ %_21346 : %_21346
 ; {>  %_21345~1':_p21201 }
; _f21212 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21375
	btr r12,0
	jmp LB_21376
LB_21375:
	bts r12,0
LB_21376:
	call NS_E_21212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_21346
 ; {>  %_21346~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21367:
NS_E_21417:
; 	|» 0'
NS_E_RDI_21417:
MTC_LB_21418:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21419
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
	jnc LB_21420
	bt QWORD [rdi],0
	jc LB_21421
	btr r12,3
	clc
	jmp LB_21422
LB_21421:
	bts r12,3
	stc
LB_21422:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21420:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_21425
	btr r12,4
	clc
	jmp LB_21426
LB_21425:
	bts r12,4
	stc
LB_21426:
	mov r14,r10
	bt r12,4
	jc LB_21423
	btr r12,1
	jmp LB_21424
LB_21423:
	bts r12,1
LB_21424:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_21429
	btr r12,4
	clc
	jmp LB_21430
LB_21429:
	bts r12,4
	stc
LB_21430:
	mov r8,r10
	bt r12,4
	jc LB_21427
	btr r12,2
	jmp LB_21428
LB_21427:
	bts r12,2
LB_21428:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21431:
	cmp r15,0
	jz LB_21432
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21431
LB_21432:
; _f21407 %_21409 ⊢ %_21411 : %_21411
 ; {>  %_21410~2':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) %_21409~1':(_p21246)◂((_p21254)◂(_stg)) }
; _f21407 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21435
	btr r12,0
	jmp LB_21436
LB_21435:
	bts r12,0
LB_21436:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_21433
	btr r12,2
	clc
	jmp LB_21434
LB_21433:
	bts r12,2
	stc
LB_21434:
	add rsp,16
; _f21417 %_21410 ⊢ %_21412 : %_21412
 ; {>  %_21410~2':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) %_21411~0':_stg }
; _f21417 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21439
	btr r12,0
	jmp LB_21440
LB_21439:
	bts r12,0
LB_21440:
	call NS_E_21417
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_21441
	btr r12,1
	jmp LB_21442
LB_21441:
	bts r12,1
LB_21442:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21437
	btr r12,0
	clc
	jmp LB_21438
LB_21437:
	bts r12,0
	stc
LB_21438:
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
; ∎ %_21415
 ; {>  %_21413~0':_stg %_21414~1':_stg %_21415~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_21443
	mov rdi,r13
	call dlt
LB_21443:
	bt r12,1
	jc LB_21444
	mov rdi,r14
	call dlt
LB_21444:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21445
	btr r12,0
	jmp LB_21446
LB_21445:
	bts r12,0
LB_21446:
	ret
MTC_LB_21419:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21447
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
	jnc LB_21448
	bt QWORD [rdi],0
	jc LB_21449
	btr r12,1
	clc
	jmp LB_21450
LB_21449:
	bts r12,1
	stc
LB_21450:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21448:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21451:
	cmp r15,0
	jz LB_21452
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21451
LB_21452:
; 	» "" _ ⊢ 0' : %_21416
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_21416
 ; {>  %_21416~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21447:
NS_E_21407:
; 	|» 0'
NS_E_RDI_21407:
MTC_LB_21453:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21454
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
	jnc LB_21455
	bt QWORD [rdi],0
	jc LB_21456
	btr r12,2
	clc
	jmp LB_21457
LB_21456:
	bts r12,2
	stc
LB_21457:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21455:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21458
	btr r12,1
	jmp LB_21459
LB_21458:
	bts r12,1
LB_21459:
LB_21460:
	cmp r15,0
	jz LB_21461
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21460
LB_21461:
; _f21417 %_21400 ⊢ %_21401 : %_21401
 ; {>  %_21400~1':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) }
; _f21417 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21462
	btr r12,0
	jmp LB_21463
LB_21462:
	bts r12,0
LB_21463:
	call NS_E_21417
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
; ∎ %_21403
 ; {>  %_21403~1':_stg %_21402~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_21464
	mov rdi,r13
	call dlt
LB_21464:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21465
	btr r12,0
	jmp LB_21466
LB_21465:
	bts r12,0
LB_21466:
	ret
MTC_LB_21454:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21467
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
	jnc LB_21468
	bt QWORD [rdi],0
	jc LB_21469
	btr r12,2
	clc
	jmp LB_21470
LB_21469:
	bts r12,2
	stc
LB_21470:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21468:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21471
	btr r12,1
	jmp LB_21472
LB_21471:
	bts r12,1
LB_21472:
LB_21473:
	cmp r15,0
	jz LB_21474
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21473
LB_21474:
MTC_LB_21475:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21476
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
	jnc LB_21477
	bt QWORD [rdi],0
	jc LB_21478
	btr r12,0
	clc
	jmp LB_21479
LB_21478:
	bts r12,0
	stc
LB_21479:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21477:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21480:
	cmp r15,0
	jz LB_21481
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21480
LB_21481:
; 	» "_ " _ ⊢ 0' : %_21405
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_21405
 ; {>  %_21405~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21476:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21482
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
	jnc LB_21483
	bt QWORD [rdi],0
	jc LB_21484
	btr r12,2
	clc
	jmp LB_21485
LB_21484:
	bts r12,2
	stc
LB_21485:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21483:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_21486
	btr r12,0
	jmp LB_21487
LB_21486:
	bts r12,0
LB_21487:
LB_21488:
	cmp r15,0
	jz LB_21489
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21488
LB_21489:
; ∎ %_21406
 ; {>  %_21406~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21482:
MTC_LB_21467:
NS_E_21398:
; 	|» 0'
NS_E_RDI_21398:
MTC_LB_21490:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21491
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
	jnc LB_21492
	bt QWORD [rdi],0
	jc LB_21493
	btr r12,3
	clc
	jmp LB_21494
LB_21493:
	bts r12,3
	stc
LB_21494:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21492:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_21497
	btr r12,4
	clc
	jmp LB_21498
LB_21497:
	bts r12,4
	stc
LB_21498:
	mov r14,r10
	bt r12,4
	jc LB_21495
	btr r12,1
	jmp LB_21496
LB_21495:
	bts r12,1
LB_21496:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_21501
	btr r12,4
	clc
	jmp LB_21502
LB_21501:
	bts r12,4
	stc
LB_21502:
	mov r8,r10
	bt r12,4
	jc LB_21499
	btr r12,2
	jmp LB_21500
LB_21499:
	bts r12,2
LB_21500:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21503:
	cmp r15,0
	jz LB_21504
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21503
LB_21504:
; _f21388 %_21390 ⊢ %_21392 : %_21392
 ; {>  %_21390~1':(_p21246)◂((_p21253)◂(_stg)) %_21391~2':(_lst)◂((_p21246)◂((_p21253)◂(_stg))) }
; _f21388 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21507
	btr r12,0
	jmp LB_21508
LB_21507:
	bts r12,0
LB_21508:
	call NS_E_21388
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_21505
	btr r12,2
	clc
	jmp LB_21506
LB_21505:
	bts r12,2
	stc
LB_21506:
	add rsp,16
; _f21398 %_21391 ⊢ %_21393 : %_21393
 ; {>  %_21392~0':_stg %_21391~2':(_lst)◂((_p21246)◂((_p21253)◂(_stg))) }
; _f21398 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21511
	btr r12,0
	jmp LB_21512
LB_21511:
	bts r12,0
LB_21512:
	call NS_E_21398
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_21513
	btr r12,1
	jmp LB_21514
LB_21513:
	bts r12,1
LB_21514:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21509
	btr r12,0
	clc
	jmp LB_21510
LB_21509:
	bts r12,0
	stc
LB_21510:
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
; ∎ %_21396
 ; {>  %_21395~1':_stg %_21394~0':_stg %_21396~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_21515
	mov rdi,r14
	call dlt
LB_21515:
	bt r12,0
	jc LB_21516
	mov rdi,r13
	call dlt
LB_21516:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21517
	btr r12,0
	jmp LB_21518
LB_21517:
	bts r12,0
LB_21518:
	ret
MTC_LB_21491:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21519
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
	jnc LB_21520
	bt QWORD [rdi],0
	jc LB_21521
	btr r12,1
	clc
	jmp LB_21522
LB_21521:
	bts r12,1
	stc
LB_21522:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21520:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21523:
	cmp r15,0
	jz LB_21524
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21523
LB_21524:
; 	» "" _ ⊢ 0' : %_21397
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_21397
 ; {>  %_21397~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21519:
NS_E_21388:
; 	|» 0'
NS_E_RDI_21388:
MTC_LB_21525:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21526
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
	jnc LB_21527
	bt QWORD [rdi],0
	jc LB_21528
	btr r12,2
	clc
	jmp LB_21529
LB_21528:
	bts r12,2
	stc
LB_21529:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21527:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21530
	btr r12,1
	jmp LB_21531
LB_21530:
	bts r12,1
LB_21531:
LB_21532:
	cmp r15,0
	jz LB_21533
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21532
LB_21533:
; _f21398 %_21378 ⊢ %_21379 : %_21379
 ; {>  %_21378~1':(_lst)◂((_p21246)◂((_p21253)◂(_stg))) }
; _f21398 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21534
	btr r12,0
	jmp LB_21535
LB_21534:
	bts r12,0
LB_21535:
	call NS_E_21398
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
; ∎ %_21381
 ; {>  %_21381~1':_stg %_21380~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_21536
	mov rdi,r13
	call dlt
LB_21536:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21537
	btr r12,0
	jmp LB_21538
LB_21537:
	bts r12,0
LB_21538:
	ret
MTC_LB_21526:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21539
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
	jnc LB_21540
	bt QWORD [rdi],0
	jc LB_21541
	btr r12,2
	clc
	jmp LB_21542
LB_21541:
	bts r12,2
	stc
LB_21542:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21540:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_21543
	btr r12,1
	jmp LB_21544
LB_21543:
	bts r12,1
LB_21544:
LB_21545:
	cmp r15,0
	jz LB_21546
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21545
LB_21546:
MTC_LB_21547:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21548
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
	jnc LB_21549
	bt QWORD [rdi],0
	jc LB_21550
	btr r12,2
	clc
	jmp LB_21551
LB_21550:
	bts r12,2
	stc
LB_21551:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21549:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_21552
	btr r12,0
	jmp LB_21553
LB_21552:
	bts r12,0
LB_21553:
LB_21554:
	cmp r15,0
	jz LB_21555
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21554
LB_21555:
; _f21347 %_21383 ⊢ %_21384 : %_21384
 ; {>  %_21383~0':_p21249 }
; _f21347 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21347
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
; ∎ %_21386
 ; {>  %_21385~0':_stg %_21386~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_21556
	mov rdi,r13
	call dlt
LB_21556:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_21557
	btr r12,0
	jmp LB_21558
LB_21557:
	bts r12,0
LB_21558:
	ret
MTC_LB_21548:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21559
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
	jnc LB_21560
	bt QWORD [rdi],0
	jc LB_21561
	btr r12,2
	clc
	jmp LB_21562
LB_21561:
	bts r12,2
	stc
LB_21562:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21560:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_21563
	btr r12,0
	jmp LB_21564
LB_21563:
	bts r12,0
LB_21564:
LB_21565:
	cmp r15,0
	jz LB_21566
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21565
LB_21566:
; ∎ %_21387
 ; {>  %_21387~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_21559:
MTC_LB_21539:
NS_E_21672:
; 	|» { 0' 1' }
NS_E_RDI_21672:
MTC_LB_21673:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21674
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
	jnc LB_21675
	bt QWORD [rdi],0
	jc LB_21676
	btr r12,5
	clc
	jmp LB_21677
LB_21676:
	bts r12,5
	stc
LB_21677:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21675:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21680
	btr r12,6
	clc
	jmp LB_21681
LB_21680:
	bts r12,6
	stc
LB_21681:
	mov r8,rcx
	bt r12,6
	jc LB_21678
	btr r12,2
	jmp LB_21679
LB_21678:
	bts r12,2
LB_21679:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21684
	btr r12,6
	clc
	jmp LB_21685
LB_21684:
	bts r12,6
	stc
LB_21685:
	mov r9,rcx
	bt r12,6
	jc LB_21682
	btr r12,3
	jmp LB_21683
LB_21682:
	bts r12,3
LB_21683:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_21688
	btr r12,6
	clc
	jmp LB_21689
LB_21688:
	bts r12,6
	stc
LB_21689:
	mov r10,rcx
	bt r12,6
	jc LB_21686
	btr r12,4
	jmp LB_21687
LB_21686:
	bts r12,4
LB_21687:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21690:
	cmp r15,0
	jz LB_21691
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21690
LB_21691:
; _f21672 { %_21633 %_21637 } ⊢ { %_21638 %_21639 } : { %_21638 %_21639 }
 ; {>  %_21636~3':(_p21262)◂(_stg) %_21633~0':_r64 %_21635~2':(_lst)◂((_p21263)◂(_stg)) %_21637~4':(_p21261)◂(_stg) }
; _f21672 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21696
	btr r12,1
	jmp LB_21697
LB_21696:
	bts r12,1
LB_21697:
	call NS_E_21672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_21694
	btr r12,3
	clc
	jmp LB_21695
LB_21694:
	bts r12,3
	stc
LB_21695:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_21692
	btr r12,2
	clc
	jmp LB_21693
LB_21692:
	bts r12,2
	stc
LB_21693:
	add rsp,24
MTC_LB_21698:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21699
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
	jnc LB_21700
	bt QWORD [rdi],0
	jc LB_21701
	btr r12,5
	clc
	jmp LB_21702
LB_21701:
	bts r12,5
	stc
LB_21702:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21700:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_21703
	btr r12,4
	jmp LB_21704
LB_21703:
	bts r12,4
LB_21704:
LB_21705:
	cmp r15,0
	jz LB_21706
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21705
LB_21706:
; _f21672 { %_21638 %_21640 } ⊢ { %_21641 %_21642 } : { %_21641 %_21642 }
 ; {>  %_21640~4':(_p21261)◂(_stg) %_21639~1':_stg %_21635~2':(_lst)◂((_p21263)◂(_stg)) %_21638~0':_r64 }
; _f21672 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21711
	btr r12,1
	jmp LB_21712
LB_21711:
	bts r12,1
LB_21712:
	call NS_E_21672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_21713
	btr r12,3
	jmp LB_21714
LB_21713:
	bts r12,3
LB_21714:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_21709
	btr r12,2
	clc
	jmp LB_21710
LB_21709:
	bts r12,2
	stc
LB_21710:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_21707
	btr r12,1
	clc
	jmp LB_21708
LB_21707:
	bts r12,1
	stc
LB_21708:
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
LB_21715:
	cmp rax,0
	jz LB_21716
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21715
LB_21716:
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
; ∎ { %_21643 %_21646 }
 ; {>  %_21643~0':_r64 %_21646~4':_stg %_21635~2':(_lst)◂((_p21263)◂(_stg)) %_21645~3':_stg %_21644~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_21717
	mov rdi,r8
	call dlt
LB_21717:
	bt r12,3
	jc LB_21718
	mov rdi,r9
	call dlt
LB_21718:
	bt r12,1
	jc LB_21719
	mov rdi,r14
	call dlt
LB_21719:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21720
	btr r12,1
	jmp LB_21721
LB_21720:
	bts r12,1
LB_21721:
	ret
MTC_LB_21699:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21722
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
	jnc LB_21723
	bt QWORD [rdi],0
	jc LB_21724
	btr r12,5
	clc
	jmp LB_21725
LB_21724:
	bts r12,5
	stc
LB_21725:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21723:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_21726
	btr r12,4
	jmp LB_21727
LB_21726:
	bts r12,4
LB_21727:
LB_21728:
	cmp r15,0
	jz LB_21729
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21728
LB_21729:
; _f56 %_21638 ⊢ %_21648 : %_21648
 ; {>  %_21647~4':(_p21259)◂(_stg) %_21639~1':_stg %_21635~2':(_lst)◂((_p21263)◂(_stg)) %_21638~0':_r64 }
	add r13,1
; _f21584 { %_21648 %_21647 } ⊢ { %_21649 %_21650 } : { %_21649 %_21650 }
 ; {>  %_21647~4':(_p21259)◂(_stg) %_21639~1':_stg %_21635~2':(_lst)◂((_p21263)◂(_stg)) %_21648~0':_r64 }
; _f21584 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21734
	btr r12,1
	jmp LB_21735
LB_21734:
	bts r12,1
LB_21735:
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_21736
	btr r12,3
	jmp LB_21737
LB_21736:
	bts r12,3
LB_21737:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_21732
	btr r12,2
	clc
	jmp LB_21733
LB_21732:
	bts r12,2
	stc
LB_21733:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_21730
	btr r12,1
	clc
	jmp LB_21731
LB_21730:
	bts r12,1
	stc
LB_21731:
	add rsp,24
; _f55 %_21649 ⊢ %_21651 : %_21651
 ; {>  %_21639~1':_stg %_21635~2':(_lst)◂((_p21263)◂(_stg)) %_21650~3':_stg %_21649~0':_r64 }
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
LB_21738:
	cmp rax,0
	jz LB_21739
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21738
LB_21739:
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
; ∎ { %_21652 %_21655 }
 ; {>  %_21635~2':(_lst)◂((_p21263)◂(_stg)) %_21655~4':_stg %_21653~1':_stg %_21652~0':_r64 %_21654~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_21740
	mov rdi,r8
	call dlt
LB_21740:
	bt r12,1
	jc LB_21741
	mov rdi,r14
	call dlt
LB_21741:
	bt r12,3
	jc LB_21742
	mov rdi,r9
	call dlt
LB_21742:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21743
	btr r12,1
	jmp LB_21744
LB_21743:
	bts r12,1
LB_21744:
	ret
MTC_LB_21722:
MTC_LB_21674:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21745
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
	jnc LB_21746
	bt QWORD [rdi],0
	jc LB_21747
	btr r12,4
	clc
	jmp LB_21748
LB_21747:
	bts r12,4
	stc
LB_21748:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21746:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_21751
	btr r12,5
	clc
	jmp LB_21752
LB_21751:
	bts r12,5
	stc
LB_21752:
	mov r8,r11
	bt r12,5
	jc LB_21749
	btr r12,2
	jmp LB_21750
LB_21749:
	bts r12,2
LB_21750:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_21755
	btr r12,5
	clc
	jmp LB_21756
LB_21755:
	bts r12,5
	stc
LB_21756:
	mov r9,r11
	bt r12,5
	jc LB_21753
	btr r12,3
	jmp LB_21754
LB_21753:
	bts r12,3
LB_21754:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21757:
	cmp r15,0
	jz LB_21758
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21757
LB_21758:
MTC_LB_21759:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21760
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
	jnc LB_21761
	bt QWORD [rdi],0
	jc LB_21762
	btr r12,4
	clc
	jmp LB_21763
LB_21762:
	bts r12,4
	stc
LB_21763:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21761:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_21764
	btr r12,1
	jmp LB_21765
LB_21764:
	bts r12,1
LB_21765:
LB_21766:
	cmp r15,0
	jz LB_21767
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21766
LB_21767:
; _f21672 { %_21633 %_21658 } ⊢ { %_21659 %_21660 } : { %_21659 %_21660 }
 ; {>  %_21658~1':(_p21261)◂(_stg) %_21633~0':_r64 %_21656~2':(_lst)◂((_p21263)◂(_stg)) }
; _f21672 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_21672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_21768
	btr r12,2
	clc
	jmp LB_21769
LB_21768:
	bts r12,2
	stc
LB_21769:
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
LB_21770:
	cmp rax,0
	jz LB_21771
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21770
LB_21771:
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
; ∎ { %_21661 %_21663 }
 ; {>  %_21662~1':_stg %_21661~0':_r64 %_21656~2':(_lst)◂((_p21263)◂(_stg)) %_21663~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_21772
	mov rdi,r14
	call dlt
LB_21772:
	bt r12,2
	jc LB_21773
	mov rdi,r8
	call dlt
LB_21773:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_21774
	btr r12,1
	jmp LB_21775
LB_21774:
	bts r12,1
LB_21775:
	ret
MTC_LB_21760:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21776
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
	jnc LB_21777
	bt QWORD [rdi],0
	jc LB_21778
	btr r12,4
	clc
	jmp LB_21779
LB_21778:
	bts r12,4
	stc
LB_21779:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21777:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_21780
	btr r12,1
	jmp LB_21781
LB_21780:
	bts r12,1
LB_21781:
LB_21782:
	cmp r15,0
	jz LB_21783
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21782
LB_21783:
; _f56 %_21633 ⊢ %_21665 : %_21665
 ; {>  %_21633~0':_r64 %_21656~2':(_lst)◂((_p21263)◂(_stg)) %_21664~1':(_p21259)◂(_stg) }
	add r13,1
; _f21584 { %_21665 %_21664 } ⊢ { %_21666 %_21667 } : { %_21666 %_21667 }
 ; {>  %_21665~0':_r64 %_21656~2':(_lst)◂((_p21263)◂(_stg)) %_21664~1':(_p21259)◂(_stg) }
; _f21584 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_21784
	btr r12,2
	clc
	jmp LB_21785
LB_21784:
	bts r12,2
	stc
LB_21785:
	add rsp,16
; _f55 %_21666 ⊢ %_21668 : %_21668
 ; {>  %_21656~2':(_lst)◂((_p21263)◂(_stg)) %_21667~1':_stg %_21666~0':_r64 }
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
LB_21786:
	cmp rax,0
	jz LB_21787
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21786
LB_21787:
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
; ∎ { %_21669 %_21671 }
 ; {>  %_21671~3':_stg %_21656~2':(_lst)◂((_p21263)◂(_stg)) %_21670~1':_stg %_21669~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_21788
	mov rdi,r8
	call dlt
LB_21788:
	bt r12,1
	jc LB_21789
	mov rdi,r14
	call dlt
LB_21789:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_21790
	btr r12,1
	jmp LB_21791
LB_21790:
	bts r12,1
LB_21791:
	ret
MTC_LB_21776:
MTC_LB_21745:
NS_E_21632:
; 	|» { 0' 1' }
NS_E_RDI_21632:
MTC_LB_21792:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21793
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
	jnc LB_21794
	bt QWORD [rdi],0
	jc LB_21795
	btr r12,5
	clc
	jmp LB_21796
LB_21795:
	bts r12,5
	stc
LB_21796:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21794:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21799
	btr r12,6
	clc
	jmp LB_21800
LB_21799:
	bts r12,6
	stc
LB_21800:
	mov r8,rcx
	bt r12,6
	jc LB_21797
	btr r12,2
	jmp LB_21798
LB_21797:
	bts r12,2
LB_21798:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21803
	btr r12,6
	clc
	jmp LB_21804
LB_21803:
	bts r12,6
	stc
LB_21804:
	mov r9,rcx
	bt r12,6
	jc LB_21801
	btr r12,3
	jmp LB_21802
LB_21801:
	bts r12,3
LB_21802:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_21807
	btr r12,6
	clc
	jmp LB_21808
LB_21807:
	bts r12,6
	stc
LB_21808:
	mov r10,rcx
	bt r12,6
	jc LB_21805
	btr r12,4
	jmp LB_21806
LB_21805:
	bts r12,4
LB_21806:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21809:
	cmp r15,0
	jz LB_21810
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21809
LB_21810:
; _f21388 %_21588 ⊢ %_21590 : %_21590
 ; {>  %_21585~0':_r64 %_21587~2':_p21201 %_21588~3':(_p21246)◂((_p21253)◂(_stg)) %_21589~4':(_p21246)◂((_p21254)◂(_stg)) }
; _f21388 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_21817
	btr r12,0
	jmp LB_21818
LB_21817:
	bts r12,0
LB_21818:
	call NS_E_21388
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_21819
	btr r12,1
	jmp LB_21820
LB_21819:
	bts r12,1
LB_21820:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_21815
	btr r12,4
	clc
	jmp LB_21816
LB_21815:
	bts r12,4
	stc
LB_21816:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_21813
	btr r12,2
	clc
	jmp LB_21814
LB_21813:
	bts r12,2
	stc
LB_21814:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21811
	btr r12,0
	clc
	jmp LB_21812
LB_21811:
	bts r12,0
	stc
LB_21812:
	add rsp,32
; _f21407 %_21589 ⊢ %_21591 : %_21591
 ; {>  %_21585~0':_r64 %_21587~2':_p21201 %_21590~1':_stg %_21589~4':(_p21246)◂((_p21254)◂(_stg)) }
; _f21407 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_21827
	btr r12,0
	jmp LB_21828
LB_21827:
	bts r12,0
LB_21828:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_21829
	btr r12,3
	jmp LB_21830
LB_21829:
	bts r12,3
LB_21830:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_21825
	btr r12,2
	clc
	jmp LB_21826
LB_21825:
	bts r12,2
	stc
LB_21826:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_21823
	btr r12,1
	clc
	jmp LB_21824
LB_21823:
	bts r12,1
	stc
LB_21824:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21821
	btr r12,0
	clc
	jmp LB_21822
LB_21821:
	bts r12,0
	stc
LB_21822:
	add rsp,32
; _f21212 %_21587 ⊢ %_21592 : %_21592
 ; {>  %_21591~3':_stg %_21585~0':_r64 %_21587~2':_p21201 %_21590~1':_stg }
; _f21212 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21837
	btr r12,0
	jmp LB_21838
LB_21837:
	bts r12,0
LB_21838:
	call NS_E_21212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_21839
	btr r12,2
	jmp LB_21840
LB_21839:
	bts r12,2
LB_21840:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_21835
	btr r12,3
	clc
	jmp LB_21836
LB_21835:
	bts r12,3
	stc
LB_21836:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_21833
	btr r12,1
	clc
	jmp LB_21834
LB_21833:
	bts r12,1
	stc
LB_21834:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21831
	btr r12,0
	clc
	jmp LB_21832
LB_21831:
	bts r12,0
	stc
LB_21832:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
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
LB_21841:
	cmp rax,0
	jz LB_21842
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21841
LB_21842:
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
; ∎ { %_21593 %_21597 }
 ; {>  %_21597~4':_stg %_21595~1':_stg %_21593~0':_r64 %_21596~3':_stg %_21594~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_21843
	mov rdi,r14
	call dlt
LB_21843:
	bt r12,3
	jc LB_21844
	mov rdi,r9
	call dlt
LB_21844:
	bt r12,2
	jc LB_21845
	mov rdi,r8
	call dlt
LB_21845:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21846
	btr r12,1
	jmp LB_21847
LB_21846:
	bts r12,1
LB_21847:
	ret
MTC_LB_21793:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21848
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
	jnc LB_21849
	bt QWORD [rdi],0
	jc LB_21850
	btr r12,4
	clc
	jmp LB_21851
LB_21850:
	bts r12,4
	stc
LB_21851:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21849:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_21854
	btr r12,5
	clc
	jmp LB_21855
LB_21854:
	bts r12,5
	stc
LB_21855:
	mov r8,r11
	bt r12,5
	jc LB_21852
	btr r12,2
	jmp LB_21853
LB_21852:
	bts r12,2
LB_21853:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_21858
	btr r12,5
	clc
	jmp LB_21859
LB_21858:
	bts r12,5
	stc
LB_21859:
	mov r9,r11
	bt r12,5
	jc LB_21856
	btr r12,3
	jmp LB_21857
LB_21856:
	bts r12,3
LB_21857:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21860:
	cmp r15,0
	jz LB_21861
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21860
LB_21861:
; _f21388 %_21598 ⊢ %_21600 : %_21600
 ; {>  %_21598~2':(_p21246)◂((_p21253)◂(_stg)) %_21585~0':_r64 %_21599~3':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) }
; _f21388 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21866
	btr r12,0
	jmp LB_21867
LB_21866:
	bts r12,0
LB_21867:
	call NS_E_21388
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_21868
	btr r12,1
	jmp LB_21869
LB_21868:
	bts r12,1
LB_21869:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_21864
	btr r12,3
	clc
	jmp LB_21865
LB_21864:
	bts r12,3
	stc
LB_21865:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21862
	btr r12,0
	clc
	jmp LB_21863
LB_21862:
	bts r12,0
	stc
LB_21863:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_21870:
	cmp rax,0
	jz LB_21871
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21870
LB_21871:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 .."
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
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_21601 %_21603 }
 ; {>  %_21603~2':_stg %_21601~0':_r64 %_21602~1':_stg %_21599~3':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_21872
	mov rdi,r14
	call dlt
LB_21872:
	bt r12,3
	jc LB_21873
	mov rdi,r9
	call dlt
LB_21873:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_21874
	btr r12,1
	jmp LB_21875
LB_21874:
	bts r12,1
LB_21875:
	ret
MTC_LB_21848:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_21876
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' 4' }
; 1' ⊢ °2◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_21877
	bt QWORD [rdi],0
	jc LB_21878
	btr r12,5
	clc
	jmp LB_21879
LB_21878:
	bts r12,5
	stc
LB_21879:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21877:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21882
	btr r12,6
	clc
	jmp LB_21883
LB_21882:
	bts r12,6
	stc
LB_21883:
	mov r8,rcx
	bt r12,6
	jc LB_21880
	btr r12,2
	jmp LB_21881
LB_21880:
	bts r12,2
LB_21881:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21886
	btr r12,6
	clc
	jmp LB_21887
LB_21886:
	bts r12,6
	stc
LB_21887:
	mov r9,rcx
	bt r12,6
	jc LB_21884
	btr r12,3
	jmp LB_21885
LB_21884:
	bts r12,3
LB_21885:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_21890
	btr r12,6
	clc
	jmp LB_21891
LB_21890:
	bts r12,6
	stc
LB_21891:
	mov r10,rcx
	bt r12,6
	jc LB_21888
	btr r12,4
	jmp LB_21889
LB_21888:
	bts r12,4
LB_21889:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21892:
	cmp r15,0
	jz LB_21893
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21892
LB_21893:
; _f21248 %_21604 ⊢ %_21607 : %_21607
 ; {>  %_21606~4':(_p21246)◂((_p21254)◂(_stg)) %_21604~2':(_p21253)◂(_stg) %_21585~0':_r64 %_21605~3':(_p21246)◂((_p21253)◂(_stg)) }
; _f21248 2' ⊢ °1◂2'
; _f21388 %_21607 ⊢ %_21608 : %_21608
 ; {>  %_21607~°1◂2':(_p21246)◂((_p21253)◂(_stg)) %_21606~4':(_p21246)◂((_p21254)◂(_stg)) %_21585~0':_r64 %_21605~3':(_p21246)◂((_p21253)◂(_stg)) }
; _f21388 °1◂2' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},°1◂2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21902
	btr r12,0
	jmp LB_21903
LB_21902:
	bts r12,0
LB_21903:
	mov rsi,1
	bt r12,0
	jc LB_21900
	mov rsi,0
	bt r13,0
	jc LB_21900
	jmp LB_21901
LB_21900:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_21901:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_21388
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_21904
	btr r12,1
	jmp LB_21905
LB_21904:
	bts r12,1
LB_21905:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_21898
	btr r12,4
	clc
	jmp LB_21899
LB_21898:
	bts r12,4
	stc
LB_21899:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_21896
	btr r12,3
	clc
	jmp LB_21897
LB_21896:
	bts r12,3
	stc
LB_21897:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21894
	btr r12,0
	clc
	jmp LB_21895
LB_21894:
	bts r12,0
	stc
LB_21895:
	add rsp,32
; _f21388 %_21605 ⊢ %_21609 : %_21609
 ; {>  %_21606~4':(_p21246)◂((_p21254)◂(_stg)) %_21608~1':_stg %_21585~0':_r64 %_21605~3':(_p21246)◂((_p21253)◂(_stg)) }
; _f21388 3' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_21912
	btr r12,0
	jmp LB_21913
LB_21912:
	bts r12,0
LB_21913:
	call NS_E_21388
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_21914
	btr r12,2
	jmp LB_21915
LB_21914:
	bts r12,2
LB_21915:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_21910
	btr r12,4
	clc
	jmp LB_21911
LB_21910:
	bts r12,4
	stc
LB_21911:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_21908
	btr r12,1
	clc
	jmp LB_21909
LB_21908:
	bts r12,1
	stc
LB_21909:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21906
	btr r12,0
	clc
	jmp LB_21907
LB_21906:
	bts r12,0
	stc
LB_21907:
	add rsp,32
; _f21407 %_21606 ⊢ %_21610 : %_21610
 ; {>  %_21606~4':(_p21246)◂((_p21254)◂(_stg)) %_21609~2':_stg %_21608~1':_stg %_21585~0':_r64 }
; _f21407 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_21922
	btr r12,0
	jmp LB_21923
LB_21922:
	bts r12,0
LB_21923:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_21924
	btr r12,3
	jmp LB_21925
LB_21924:
	bts r12,3
LB_21925:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_21920
	btr r12,2
	clc
	jmp LB_21921
LB_21920:
	bts r12,2
	stc
LB_21921:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_21918
	btr r12,1
	clc
	jmp LB_21919
LB_21918:
	bts r12,1
	stc
LB_21919:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21916
	btr r12,0
	clc
	jmp LB_21917
LB_21916:
	bts r12,0
	stc
LB_21917:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
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
LB_21926:
	cmp rax,0
	jz LB_21927
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21926
LB_21927:
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
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ","
	mov rsi,0x_2c
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
; ∎ { %_21611 %_21615 }
 ; {>  %_21612~1':_stg %_21614~3':_stg %_21613~2':_stg %_21615~4':_stg %_21611~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_21928
	mov rdi,r14
	call dlt
LB_21928:
	bt r12,3
	jc LB_21929
	mov rdi,r9
	call dlt
LB_21929:
	bt r12,2
	jc LB_21930
	mov rdi,r8
	call dlt
LB_21930:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21931
	btr r12,1
	jmp LB_21932
LB_21931:
	bts r12,1
LB_21932:
	ret
MTC_LB_21876:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_21933
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂{ 2' 3' 4' }
; 1' ⊢ °3◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_21934
	bt QWORD [rdi],0
	jc LB_21935
	btr r12,5
	clc
	jmp LB_21936
LB_21935:
	bts r12,5
	stc
LB_21936:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21934:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21939
	btr r12,6
	clc
	jmp LB_21940
LB_21939:
	bts r12,6
	stc
LB_21940:
	mov r8,rcx
	bt r12,6
	jc LB_21937
	btr r12,2
	jmp LB_21938
LB_21937:
	bts r12,2
LB_21938:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21943
	btr r12,6
	clc
	jmp LB_21944
LB_21943:
	bts r12,6
	stc
LB_21944:
	mov r9,rcx
	bt r12,6
	jc LB_21941
	btr r12,3
	jmp LB_21942
LB_21941:
	bts r12,3
LB_21942:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_21947
	btr r12,6
	clc
	jmp LB_21948
LB_21947:
	bts r12,6
	stc
LB_21948:
	mov r10,rcx
	bt r12,6
	jc LB_21945
	btr r12,4
	jmp LB_21946
LB_21945:
	bts r12,4
LB_21946:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21949:
	cmp r15,0
	jz LB_21950
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21949
LB_21950:
; _f21388 %_21617 ⊢ %_21619 : %_21619
 ; {>  %_21618~4':(_p21246)◂((_p21254)◂(_stg)) %_21617~3':(_p21246)◂((_p21253)◂(_stg)) %_21585~0':_r64 %_21616~2':_p21249 }
; _f21388 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_21957
	btr r12,0
	jmp LB_21958
LB_21957:
	bts r12,0
LB_21958:
	call NS_E_21388
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_21959
	btr r12,1
	jmp LB_21960
LB_21959:
	bts r12,1
LB_21960:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_21955
	btr r12,4
	clc
	jmp LB_21956
LB_21955:
	bts r12,4
	stc
LB_21956:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_21953
	btr r12,2
	clc
	jmp LB_21954
LB_21953:
	bts r12,2
	stc
LB_21954:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21951
	btr r12,0
	clc
	jmp LB_21952
LB_21951:
	bts r12,0
	stc
LB_21952:
	add rsp,32
; _f21407 %_21618 ⊢ %_21620 : %_21620
 ; {>  %_21618~4':(_p21246)◂((_p21254)◂(_stg)) %_21585~0':_r64 %_21619~1':_stg %_21616~2':_p21249 }
; _f21407 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_21967
	btr r12,0
	jmp LB_21968
LB_21967:
	bts r12,0
LB_21968:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_21969
	btr r12,3
	jmp LB_21970
LB_21969:
	bts r12,3
LB_21970:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_21965
	btr r12,2
	clc
	jmp LB_21966
LB_21965:
	bts r12,2
	stc
LB_21966:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_21963
	btr r12,1
	clc
	jmp LB_21964
LB_21963:
	bts r12,1
	stc
LB_21964:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21961
	btr r12,0
	clc
	jmp LB_21962
LB_21961:
	bts r12,0
	stc
LB_21962:
	add rsp,32
; _f21347 %_21616 ⊢ %_21621 : %_21621
 ; {>  %_21585~0':_r64 %_21619~1':_stg %_21620~3':_stg %_21616~2':_p21249 }
; _f21347 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_21977
	btr r12,0
	jmp LB_21978
LB_21977:
	bts r12,0
LB_21978:
	call NS_E_21347
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_21979
	btr r12,2
	jmp LB_21980
LB_21979:
	bts r12,2
LB_21980:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_21975
	btr r12,3
	clc
	jmp LB_21976
LB_21975:
	bts r12,3
	stc
LB_21976:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_21973
	btr r12,1
	clc
	jmp LB_21974
LB_21973:
	bts r12,1
	stc
LB_21974:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21971
	btr r12,0
	clc
	jmp LB_21972
LB_21971:
	bts r12,0
	stc
LB_21972:
	add rsp,32
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
LB_21981:
	cmp rax,0
	jz LB_21982
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_21981
LB_21982:
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
; ∎ { %_21622 %_21626 }
 ; {>  %_21625~3':_stg %_21626~4':_stg %_21624~1':_stg %_21623~2':_stg %_21622~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_21983
	mov rdi,r9
	call dlt
LB_21983:
	bt r12,1
	jc LB_21984
	mov rdi,r14
	call dlt
LB_21984:
	bt r12,2
	jc LB_21985
	mov rdi,r8
	call dlt
LB_21985:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_21986
	btr r12,1
	jmp LB_21987
LB_21986:
	bts r12,1
LB_21987:
	ret
MTC_LB_21933:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_21988
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{ 2' 3' 4' }
; 1' ⊢ °4◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_21989
	bt QWORD [rdi],0
	jc LB_21990
	btr r12,5
	clc
	jmp LB_21991
LB_21990:
	bts r12,5
	stc
LB_21991:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_21989:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21994
	btr r12,6
	clc
	jmp LB_21995
LB_21994:
	bts r12,6
	stc
LB_21995:
	mov r8,rcx
	bt r12,6
	jc LB_21992
	btr r12,2
	jmp LB_21993
LB_21992:
	bts r12,2
LB_21993:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21998
	btr r12,6
	clc
	jmp LB_21999
LB_21998:
	bts r12,6
	stc
LB_21999:
	mov r9,rcx
	bt r12,6
	jc LB_21996
	btr r12,3
	jmp LB_21997
LB_21996:
	bts r12,3
LB_21997:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_22002
	btr r12,6
	clc
	jmp LB_22003
LB_22002:
	bts r12,6
	stc
LB_22003:
	mov r10,rcx
	bt r12,6
	jc LB_22000
	btr r12,4
	jmp LB_22001
LB_22000:
	bts r12,4
LB_22001:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22004:
	cmp r15,0
	jz LB_22005
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22004
LB_22005:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,8
	add rax,7
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
LB_22006:
	cmp rax,0
	jz LB_22007
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_22006
LB_22007:
; "\194\187 _^ .."
	mov rsi,0x_2e_2e_20_5e_5f_20_bb_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; " \226\138\162 .."
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
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
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
; ∎ { %_21630 %_21631 }
 ; {>  %_21629~4':(_lst)◂((_p21254)◂(_stg)) %_21627~2':(_lst)◂(_p21265) %_21630~0':_r64 %_21628~3':(_lst)◂((_p21253)◂(_stg)) %_21631~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_22008
	mov rdi,r10
	call dlt
LB_22008:
	bt r12,2
	jc LB_22009
	mov rdi,r8
	call dlt
LB_22009:
	bt r12,3
	jc LB_22010
	mov rdi,r9
	call dlt
LB_22010:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_21988:
NS_E_21584:
; 	|» { 0' 1' }
NS_E_RDI_21584:
MTC_LB_22011:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22012
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
	jnc LB_22013
	bt QWORD [rdi],0
	jc LB_22014
	btr r12,4
	clc
	jmp LB_22015
LB_22014:
	bts r12,4
	stc
LB_22015:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22013:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_22018
	btr r12,5
	clc
	jmp LB_22019
LB_22018:
	bts r12,5
	stc
LB_22019:
	mov r8,r11
	bt r12,5
	jc LB_22016
	btr r12,2
	jmp LB_22017
LB_22016:
	bts r12,2
LB_22017:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_22022
	btr r12,5
	clc
	jmp LB_22023
LB_22022:
	bts r12,5
	stc
LB_22023:
	mov r9,r11
	bt r12,5
	jc LB_22020
	btr r12,3
	jmp LB_22021
LB_22020:
	bts r12,3
LB_22021:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22024:
	cmp r15,0
	jz LB_22025
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22024
LB_22025:
; _f21632 { %_21567 %_21569 } ⊢ { %_21571 %_21572 } : { %_21571 %_21572 }
 ; {>  %_21567~0':_r64 %_21569~2':(_p21260)◂(_stg) %_21570~3':(_p21259)◂(_stg) }
; _f21632 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22028
	btr r12,1
	jmp LB_22029
LB_22028:
	bts r12,1
LB_22029:
	call NS_E_21632
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_22026
	btr r12,3
	clc
	jmp LB_22027
LB_22026:
	bts r12,3
	stc
LB_22027:
	add rsp,16
; _f21584 { %_21571 %_21570 } ⊢ { %_21573 %_21574 } : { %_21573 %_21574 }
 ; {>  %_21571~0':_r64 %_21570~3':(_p21259)◂(_stg) %_21572~1':_stg }
; _f21584 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22032
	btr r12,1
	jmp LB_22033
LB_22032:
	bts r12,1
LB_22033:
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_22034
	btr r12,2
	jmp LB_22035
LB_22034:
	bts r12,2
LB_22035:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22030
	btr r12,1
	clc
	jmp LB_22031
LB_22030:
	bts r12,1
	stc
LB_22031:
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
; ∎ { %_21573 %_21577 }
 ; {>  %_21577~3':_stg %_21576~2':_stg %_21573~0':_r64 %_21575~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_22036
	mov rdi,r8
	call dlt
LB_22036:
	bt r12,1
	jc LB_22037
	mov rdi,r14
	call dlt
LB_22037:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22038
	btr r12,1
	jmp LB_22039
LB_22038:
	bts r12,1
LB_22039:
	ret
MTC_LB_22012:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22040
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
	jnc LB_22041
	bt QWORD [rdi],0
	jc LB_22042
	btr r12,3
	clc
	jmp LB_22043
LB_22042:
	bts r12,3
	stc
LB_22043:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22041:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_22044
	btr r12,2
	jmp LB_22045
LB_22044:
	bts r12,2
LB_22045:
LB_22046:
	cmp r15,0
	jz LB_22047
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22046
LB_22047:
; _f21672 { %_21567 %_21578 } ⊢ { %_21579 %_21580 } : { %_21579 %_21580 }
 ; {>  %_21578~2':(_p21261)◂(_stg) %_21567~0':_r64 }
; _f21672 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22048
	btr r12,1
	jmp LB_22049
LB_22048:
	bts r12,1
LB_22049:
	call NS_E_21672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_21579 %_21580 }
 ; {>  %_21579~0':_r64 %_21580~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22040:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_22050
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
	jnc LB_22051
	bt QWORD [rdi],0
	jc LB_22052
	btr r12,3
	clc
	jmp LB_22053
LB_22052:
	bts r12,3
	stc
LB_22053:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22051:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_22054
	btr r12,2
	jmp LB_22055
LB_22054:
	bts r12,2
LB_22055:
LB_22056:
	cmp r15,0
	jz LB_22057
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22056
LB_22057:
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
LB_22058:
	cmp rax,0
	jz LB_22059
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_22058
LB_22059:
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
; ∎ { %_21582 %_21583 }
 ; {>  %_21583~1':_stg %_21582~0':_r64 %_21581~2':(_p21246)◂((_p21253)◂(_stg)) }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_22060
	mov rdi,r8
	call dlt
LB_22060:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22050:
NS_E_22379:
; 	|» { 0' 1' }
NS_E_RDI_22379:
MTC_LB_22380:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22381
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
	jnc LB_22382
	bt QWORD [rdi],0
	jc LB_22383
	btr r12,6
	clc
	jmp LB_22384
LB_22383:
	bts r12,6
	stc
LB_22384:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22382:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_22397
	btr r12,7
	clc
	jmp LB_22398
LB_22397:
	bts r12,7
	stc
LB_22398:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_22387
	btr r12,5
	clc
	jmp LB_22388
LB_22387:
	bts r12,5
	stc
LB_22388:
	mov r8,r11
	bt r12,5
	jc LB_22385
	btr r12,2
	jmp LB_22386
LB_22385:
	bts r12,2
LB_22386:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_22391
	btr r12,5
	clc
	jmp LB_22392
LB_22391:
	bts r12,5
	stc
LB_22392:
	mov r9,r11
	bt r12,5
	jc LB_22389
	btr r12,3
	jmp LB_22390
LB_22389:
	bts r12,3
LB_22390:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_22395
	btr r12,5
	clc
	jmp LB_22396
LB_22395:
	bts r12,5
	stc
LB_22396:
	mov r10,r11
	bt r12,5
	jc LB_22393
	btr r12,4
	jmp LB_22394
LB_22393:
	bts r12,4
LB_22394:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_22401
	btr r12,7
	clc
	jmp LB_22402
LB_22401:
	bts r12,7
	stc
LB_22402:
	mov r11,rdx
	bt r12,7
	jc LB_22399
	btr r12,5
	jmp LB_22400
LB_22399:
	bts r12,5
LB_22400:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22403:
	cmp r15,0
	jz LB_22404
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22403
LB_22404:
; _f21407 %_22362 ⊢ %_22365 : %_22365
 ; {>  %_22364~5':(_lst)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) %_22361~2':_stg %_22363~4':(_p21259)◂(_stg) %_22362~3':(_p21246)◂((_p21254)◂(_stg)) %_22359~0':_r64 }
; _f21407 3' ⊢ 1'
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
	jc LB_22413
	btr r12,0
	jmp LB_22414
LB_22413:
	bts r12,0
LB_22414:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22415
	btr r12,1
	jmp LB_22416
LB_22415:
	bts r12,1
LB_22416:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_22411
	btr r12,5
	clc
	jmp LB_22412
LB_22411:
	bts r12,5
	stc
LB_22412:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22409
	btr r12,4
	clc
	jmp LB_22410
LB_22409:
	bts r12,4
	stc
LB_22410:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_22407
	btr r12,2
	clc
	jmp LB_22408
LB_22407:
	bts r12,2
	stc
LB_22408:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22405
	btr r12,0
	clc
	jmp LB_22406
LB_22405:
	bts r12,0
	stc
LB_22406:
	add rsp,40
; _f22379 { %_22359 %_22364 } ⊢ { %_22366 %_22367 } : { %_22366 %_22367 }
 ; {>  %_22364~5':(_lst)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) %_22361~2':_stg %_22363~4':(_p21259)◂(_stg) %_22359~0':_r64 %_22365~1':_stg }
; _f22379 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_22423
	btr r12,1
	jmp LB_22424
LB_22423:
	bts r12,1
LB_22424:
	call NS_E_22379
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_22425
	btr r12,3
	jmp LB_22426
LB_22425:
	bts r12,3
LB_22426:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22421
	btr r12,4
	clc
	jmp LB_22422
LB_22421:
	bts r12,4
	stc
LB_22422:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_22419
	btr r12,2
	clc
	jmp LB_22420
LB_22419:
	bts r12,2
	stc
LB_22420:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22417
	btr r12,1
	clc
	jmp LB_22418
LB_22417:
	bts r12,1
	stc
LB_22418:
	add rsp,32
; _f56 %_22366 ⊢ %_22368 : %_22368
 ; {>  %_22361~2':_stg %_22363~4':(_p21259)◂(_stg) %_22367~3':_stg %_22366~0':_r64 %_22365~1':_stg }
	add r13,1
; _f21584 { %_22368 %_22363 } ⊢ { %_22369 %_22370 } : { %_22369 %_22370 }
 ; {>  %_22361~2':_stg %_22363~4':(_p21259)◂(_stg) %_22367~3':_stg %_22368~0':_r64 %_22365~1':_stg }
; _f21584 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_22433
	btr r12,1
	jmp LB_22434
LB_22433:
	bts r12,1
LB_22434:
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_22435
	btr r12,4
	jmp LB_22436
LB_22435:
	bts r12,4
LB_22436:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_22431
	btr r12,3
	clc
	jmp LB_22432
LB_22431:
	bts r12,3
	stc
LB_22432:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_22429
	btr r12,2
	clc
	jmp LB_22430
LB_22429:
	bts r12,2
	stc
LB_22430:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22427
	btr r12,1
	clc
	jmp LB_22428
LB_22427:
	bts r12,1
	stc
LB_22428:
	add rsp,32
; _f55 %_22369 ⊢ %_22371 : %_22371
 ; {>  %_22361~2':_stg %_22369~0':_r64 %_22367~3':_stg %_22365~1':_stg %_22370~4':_stg }
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
LB_22437:
	cmp rax,0
	jz LB_22438
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_22437
LB_22438:
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
; ∎ { %_22372 %_22377 }
 ; {>  %_22374~1':_stg %_22373~2':_stg %_22376~3':_stg %_22372~0':_r64 %_22377~5':_stg %_22375~4':_stg }
; 	∎ { 0' 5' }
	bt r12,1
	jc LB_22439
	mov rdi,r14
	call dlt
LB_22439:
	bt r12,2
	jc LB_22440
	mov rdi,r8
	call dlt
LB_22440:
	bt r12,3
	jc LB_22441
	mov rdi,r9
	call dlt
LB_22441:
	bt r12,4
	jc LB_22442
	mov rdi,r10
	call dlt
LB_22442:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_22443
	btr r12,1
	jmp LB_22444
LB_22443:
	bts r12,1
LB_22444:
	ret
MTC_LB_22381:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22445
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
	jnc LB_22446
	bt QWORD [rdi],0
	jc LB_22447
	btr r12,2
	clc
	jmp LB_22448
LB_22447:
	bts r12,2
	stc
LB_22448:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22446:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22449:
	cmp r15,0
	jz LB_22450
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22449
LB_22450:
; 	» "" _ ⊢ 1' : %_22378
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_22359 %_22378 }
 ; {>  %_22359~0':_r64 %_22378~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22445:
NS_E_22358:
; 	|» { 0' 1' }
NS_E_RDI_22358:
MTC_LB_22451:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22452
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
	jnc LB_22453
	bt QWORD [rdi],0
	jc LB_22454
	btr r12,4
	clc
	jmp LB_22455
LB_22454:
	bts r12,4
	stc
LB_22455:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22453:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_22458
	btr r12,5
	clc
	jmp LB_22459
LB_22458:
	bts r12,5
	stc
LB_22459:
	mov r8,r11
	bt r12,5
	jc LB_22456
	btr r12,2
	jmp LB_22457
LB_22456:
	bts r12,2
LB_22457:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_22462
	btr r12,5
	clc
	jmp LB_22463
LB_22462:
	bts r12,5
	stc
LB_22463:
	mov r9,r11
	bt r12,5
	jc LB_22460
	btr r12,3
	jmp LB_22461
LB_22460:
	bts r12,3
LB_22461:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22464:
	cmp r15,0
	jz LB_22465
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22464
LB_22465:
; _f21407 %_22337 ⊢ %_22339 : %_22339
 ; {>  %_22335~0':_r64 %_22337~2':(_p21246)◂((_p21254)◂(_stg)) %_22338~3':(_p21259)◂(_stg) }
; _f21407 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22470
	btr r12,0
	jmp LB_22471
LB_22470:
	bts r12,0
LB_22471:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22472
	btr r12,1
	jmp LB_22473
LB_22472:
	bts r12,1
LB_22473:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_22468
	btr r12,3
	clc
	jmp LB_22469
LB_22468:
	bts r12,3
	stc
LB_22469:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22466
	btr r12,0
	clc
	jmp LB_22467
LB_22466:
	bts r12,0
	stc
LB_22467:
	add rsp,24
; _f56 %_22335 ⊢ %_22340 : %_22340
 ; {>  %_22335~0':_r64 %_22339~1':_stg %_22338~3':(_p21259)◂(_stg) }
	add r13,1
; _f21584 { %_22340 %_22338 } ⊢ { %_22341 %_22342 } : { %_22341 %_22342 }
 ; {>  %_22340~0':_r64 %_22339~1':_stg %_22338~3':(_p21259)◂(_stg) }
; _f21584 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22476
	btr r12,1
	jmp LB_22477
LB_22476:
	bts r12,1
LB_22477:
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_22478
	btr r12,2
	jmp LB_22479
LB_22478:
	bts r12,2
LB_22479:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22474
	btr r12,1
	clc
	jmp LB_22475
LB_22474:
	bts r12,1
	stc
LB_22475:
	add rsp,16
; _f55 %_22341 ⊢ %_22343 : %_22343
 ; {>  %_22341~0':_r64 %_22339~1':_stg %_22342~2':_stg }
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
; ∎ { %_22343 %_22346 }
 ; {>  %_22344~1':_stg %_22343~0':_r64 %_22346~3':_stg %_22345~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_22480
	mov rdi,r14
	call dlt
LB_22480:
	bt r12,2
	jc LB_22481
	mov rdi,r8
	call dlt
LB_22481:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22482
	btr r12,1
	jmp LB_22483
LB_22482:
	bts r12,1
LB_22483:
	ret
MTC_LB_22452:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22484
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
	jnc LB_22485
	bt QWORD [rdi],0
	jc LB_22486
	btr r12,3
	clc
	jmp LB_22487
LB_22486:
	bts r12,3
	stc
LB_22487:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22485:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_22488
	btr r12,2
	jmp LB_22489
LB_22488:
	bts r12,2
LB_22489:
LB_22490:
	cmp r15,0
	jz LB_22491
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22490
LB_22491:
; _f21347 %_22347 ⊢ %_22348 : %_22348
 ; {>  %_22335~0':_r64 %_22347~2':_p21249 }
; _f21347 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22494
	btr r12,0
	jmp LB_22495
LB_22494:
	bts r12,0
LB_22495:
	call NS_E_21347
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22496
	btr r12,1
	jmp LB_22497
LB_22496:
	bts r12,1
LB_22497:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22492
	btr r12,0
	clc
	jmp LB_22493
LB_22492:
	bts r12,0
	stc
LB_22493:
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
; ∎ { %_22335 %_22350 }
 ; {>  %_22349~1':_stg %_22335~0':_r64 %_22350~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_22498
	mov rdi,r14
	call dlt
LB_22498:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22499
	btr r12,1
	jmp LB_22500
LB_22499:
	bts r12,1
LB_22500:
	ret
MTC_LB_22484:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_22501
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
	jnc LB_22502
	bt QWORD [rdi],0
	jc LB_22503
	btr r12,3
	clc
	jmp LB_22504
LB_22503:
	bts r12,3
	stc
LB_22504:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22502:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_22505
	btr r12,2
	jmp LB_22506
LB_22505:
	bts r12,2
LB_22506:
LB_22507:
	cmp r15,0
	jz LB_22508
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22507
LB_22508:
; _f56 %_22335 ⊢ %_22352 : %_22352
 ; {>  %_22335~0':_r64 %_22351~2':(_p21259)◂(_stg) }
	add r13,1
; _f21584 { %_22352 %_22351 } ⊢ { %_22353 %_22354 } : { %_22353 %_22354 }
 ; {>  %_22351~2':(_p21259)◂(_stg) %_22352~0':_r64 }
; _f21584 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22509
	btr r12,1
	jmp LB_22510
LB_22509:
	bts r12,1
LB_22510:
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_22353 ⊢ %_22355 : %_22355
 ; {>  %_22353~0':_r64 %_22354~1':_stg }
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
; ∎ { %_22355 %_22357 }
 ; {>  %_22357~2':_stg %_22356~1':_stg %_22355~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_22511
	mov rdi,r14
	call dlt
LB_22511:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22512
	btr r12,1
	jmp LB_22513
LB_22512:
	bts r12,1
LB_22513:
	ret
MTC_LB_22501:
NS_E_22334:
; 	|» 0'
NS_E_RDI_22334:
MTC_LB_22514:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22515
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
	jnc LB_22516
	bt QWORD [rdi],0
	jc LB_22517
	btr r12,3
	clc
	jmp LB_22518
LB_22517:
	bts r12,3
	stc
LB_22518:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22516:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_22521
	btr r12,4
	clc
	jmp LB_22522
LB_22521:
	bts r12,4
	stc
LB_22522:
	mov r14,r10
	bt r12,4
	jc LB_22519
	btr r12,1
	jmp LB_22520
LB_22519:
	bts r12,1
LB_22520:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_22525
	btr r12,4
	clc
	jmp LB_22526
LB_22525:
	bts r12,4
	stc
LB_22526:
	mov r8,r10
	bt r12,4
	jc LB_22523
	btr r12,2
	jmp LB_22524
LB_22523:
	bts r12,2
LB_22524:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22527:
	cmp r15,0
	jz LB_22528
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22527
LB_22528:
; _f22324 %_22326 ⊢ %_22328 : %_22328
 ; {>  %_22326~1':_p21303 %_22327~2':(_lst)◂(_p21303) }
; _f22324 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_22531
	btr r12,0
	jmp LB_22532
LB_22531:
	bts r12,0
LB_22532:
	call NS_E_22324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_22529
	btr r12,2
	clc
	jmp LB_22530
LB_22529:
	bts r12,2
	stc
LB_22530:
	add rsp,16
; _f22334 %_22327 ⊢ %_22329 : %_22329
 ; {>  %_22328~0':_stg %_22327~2':(_lst)◂(_p21303) }
; _f22334 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22535
	btr r12,0
	jmp LB_22536
LB_22535:
	bts r12,0
LB_22536:
	call NS_E_22334
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22537
	btr r12,1
	jmp LB_22538
LB_22537:
	bts r12,1
LB_22538:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22533
	btr r12,0
	clc
	jmp LB_22534
LB_22533:
	bts r12,0
	stc
LB_22534:
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
; ∎ %_22332
 ; {>  %_22331~1':_stg %_22332~2':_stg %_22330~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_22539
	mov rdi,r14
	call dlt
LB_22539:
	bt r12,0
	jc LB_22540
	mov rdi,r13
	call dlt
LB_22540:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22541
	btr r12,0
	jmp LB_22542
LB_22541:
	bts r12,0
LB_22542:
	ret
MTC_LB_22515:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22543
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
	jnc LB_22544
	bt QWORD [rdi],0
	jc LB_22545
	btr r12,1
	clc
	jmp LB_22546
LB_22545:
	bts r12,1
	stc
LB_22546:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22544:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22547:
	cmp r15,0
	jz LB_22548
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22547
LB_22548:
; 	» "" _ ⊢ 0' : %_22333
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_22333
 ; {>  %_22333~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_22543:
NS_E_22324:
; 	|» 0'
NS_E_RDI_22324:
MTC_LB_22549:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22550
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
	jnc LB_22551
	bt QWORD [rdi],0
	jc LB_22552
	btr r12,2
	clc
	jmp LB_22553
LB_22552:
	bts r12,2
	stc
LB_22553:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22551:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_22554
	btr r12,1
	jmp LB_22555
LB_22554:
	bts r12,1
LB_22555:
LB_22556:
	cmp r15,0
	jz LB_22557
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22556
LB_22557:
; _f22334 %_22301 ⊢ %_22302 : %_22302
 ; {>  %_22301~1':(_lst)◂(_p21303) }
; _f22334 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_22558
	btr r12,0
	jmp LB_22559
LB_22558:
	bts r12,0
LB_22559:
	call NS_E_22334
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
; ∎ %_22304
 ; {>  %_22304~1':_stg %_22303~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_22560
	mov rdi,r13
	call dlt
LB_22560:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_22561
	btr r12,0
	jmp LB_22562
LB_22561:
	bts r12,0
LB_22562:
	ret
MTC_LB_22550:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22563
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
	jnc LB_22564
	bt QWORD [rdi],0
	jc LB_22565
	btr r12,3
	clc
	jmp LB_22566
LB_22565:
	bts r12,3
	stc
LB_22566:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22564:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_22569
	btr r12,4
	clc
	jmp LB_22570
LB_22569:
	bts r12,4
	stc
LB_22570:
	mov r14,r10
	bt r12,4
	jc LB_22567
	btr r12,1
	jmp LB_22568
LB_22567:
	bts r12,1
LB_22568:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_22573
	btr r12,4
	clc
	jmp LB_22574
LB_22573:
	bts r12,4
	stc
LB_22574:
	mov r8,r10
	bt r12,4
	jc LB_22571
	btr r12,2
	jmp LB_22572
LB_22571:
	bts r12,2
LB_22572:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22575:
	cmp r15,0
	jz LB_22576
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22575
LB_22576:
; _f22324 %_22305 ⊢ %_22307 : %_22307
 ; {>  %_22306~2':_p21303 %_22305~1':_p21303 }
; _f22324 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_22579
	btr r12,0
	jmp LB_22580
LB_22579:
	bts r12,0
LB_22580:
	call NS_E_22324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_22577
	btr r12,2
	clc
	jmp LB_22578
LB_22577:
	bts r12,2
	stc
LB_22578:
	add rsp,16
; _f22324 %_22306 ⊢ %_22308 : %_22308
 ; {>  %_22306~2':_p21303 %_22307~0':_stg }
; _f22324 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22583
	btr r12,0
	jmp LB_22584
LB_22583:
	bts r12,0
LB_22584:
	call NS_E_22324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22585
	btr r12,1
	jmp LB_22586
LB_22585:
	bts r12,1
LB_22586:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22581
	btr r12,0
	clc
	jmp LB_22582
LB_22581:
	bts r12,0
	stc
LB_22582:
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
; ∎ %_22311
 ; {>  %_22310~1':_stg %_22309~0':_stg %_22311~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_22587
	mov rdi,r14
	call dlt
LB_22587:
	bt r12,0
	jc LB_22588
	mov rdi,r13
	call dlt
LB_22588:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22589
	btr r12,0
	jmp LB_22590
LB_22589:
	bts r12,0
LB_22590:
	ret
MTC_LB_22563:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_22591
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
	jnc LB_22592
	bt QWORD [rdi],0
	jc LB_22593
	btr r12,3
	clc
	jmp LB_22594
LB_22593:
	bts r12,3
	stc
LB_22594:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22592:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_22597
	btr r12,4
	clc
	jmp LB_22598
LB_22597:
	bts r12,4
	stc
LB_22598:
	mov r14,r10
	bt r12,4
	jc LB_22595
	btr r12,1
	jmp LB_22596
LB_22595:
	bts r12,1
LB_22596:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_22601
	btr r12,4
	clc
	jmp LB_22602
LB_22601:
	bts r12,4
	stc
LB_22602:
	mov r8,r10
	bt r12,4
	jc LB_22599
	btr r12,2
	jmp LB_22600
LB_22599:
	bts r12,2
LB_22600:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22603:
	cmp r15,0
	jz LB_22604
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22603
LB_22604:
; _f22324 %_22312 ⊢ %_22314 : %_22314
 ; {>  %_22312~1':_p21303 %_22313~2':_p21303 }
; _f22324 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_22607
	btr r12,0
	jmp LB_22608
LB_22607:
	bts r12,0
LB_22608:
	call NS_E_22324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_22605
	btr r12,2
	clc
	jmp LB_22606
LB_22605:
	bts r12,2
	stc
LB_22606:
	add rsp,16
; _f22324 %_22313 ⊢ %_22315 : %_22315
 ; {>  %_22313~2':_p21303 %_22314~0':_stg }
; _f22324 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22611
	btr r12,0
	jmp LB_22612
LB_22611:
	bts r12,0
LB_22612:
	call NS_E_22324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22613
	btr r12,1
	jmp LB_22614
LB_22613:
	bts r12,1
LB_22614:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22609
	btr r12,0
	clc
	jmp LB_22610
LB_22609:
	bts r12,0
	stc
LB_22610:
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
; ∎ %_22318
 ; {>  %_22317~1':_stg %_22316~0':_stg %_22318~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_22615
	mov rdi,r14
	call dlt
LB_22615:
	bt r12,0
	jc LB_22616
	mov rdi,r13
	call dlt
LB_22616:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22617
	btr r12,0
	jmp LB_22618
LB_22617:
	bts r12,0
LB_22618:
	ret
MTC_LB_22591:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_22619
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
	jnc LB_22620
	bt QWORD [rdi],0
	jc LB_22621
	btr r12,2
	clc
	jmp LB_22622
LB_22621:
	bts r12,2
	stc
LB_22622:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22620:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_22623
	btr r12,1
	jmp LB_22624
LB_22623:
	bts r12,1
LB_22624:
LB_22625:
	cmp r15,0
	jz LB_22626
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22625
LB_22626:
; _f21212 %_22319 ⊢ %_22320 : %_22320
 ; {>  %_22319~1':_p21201 }
; _f21212 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_22627
	btr r12,0
	jmp LB_22628
LB_22627:
	bts r12,0
LB_22628:
	call NS_E_21212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_22320
 ; {>  %_22320~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_22619:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_22629
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
	jnc LB_22630
	bt QWORD [rdi],0
	jc LB_22631
	btr r12,2
	clc
	jmp LB_22632
LB_22631:
	bts r12,2
	stc
LB_22632:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22630:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_22633
	btr r12,1
	jmp LB_22634
LB_22633:
	bts r12,1
LB_22634:
LB_22635:
	cmp r15,0
	jz LB_22636
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22635
LB_22636:
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
; ∎ %_22323
 ; {>  %_22323~0':_stg %_22322~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_22637
	mov rdi,r14
	call dlt
LB_22637:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_22629:
NS_E_22299:
; 	|» { 0' 1' }
NS_E_RDI_22299:
MTC_LB_22638:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22639
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
	jnc LB_22640
	bt QWORD [rdi],0
	jc LB_22641
	btr r12,5
	clc
	jmp LB_22642
LB_22641:
	bts r12,5
	stc
LB_22642:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22640:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_22651
	btr r12,6
	clc
	jmp LB_22652
LB_22651:
	bts r12,6
	stc
LB_22652:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_22645
	btr r12,4
	clc
	jmp LB_22646
LB_22645:
	bts r12,4
	stc
LB_22646:
	mov r8,r10
	bt r12,4
	jc LB_22643
	btr r12,2
	jmp LB_22644
LB_22643:
	bts r12,2
LB_22644:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_22649
	btr r12,4
	clc
	jmp LB_22650
LB_22649:
	bts r12,4
	stc
LB_22650:
	mov r9,r10
	bt r12,4
	jc LB_22647
	btr r12,3
	jmp LB_22648
LB_22647:
	bts r12,3
LB_22648:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_22655
	btr r12,6
	clc
	jmp LB_22656
LB_22655:
	bts r12,6
	stc
LB_22656:
	mov r10,rcx
	bt r12,6
	jc LB_22653
	btr r12,4
	jmp LB_22654
LB_22653:
	bts r12,4
LB_22654:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22657:
	cmp r15,0
	jz LB_22658
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22657
LB_22658:
; _f22299 { %_22285 %_22289 } ⊢ { %_22290 %_22291 } : { %_22290 %_22291 }
 ; {>  %_22285~0':_r64 %_22289~4':(_lst)◂({ _stg _p21303 }) %_22288~3':_p21303 %_22287~2':_stg }
; _f22299 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_22663
	btr r12,1
	jmp LB_22664
LB_22663:
	bts r12,1
LB_22664:
	call NS_E_22299
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_22661
	btr r12,3
	clc
	jmp LB_22662
LB_22661:
	bts r12,3
	stc
LB_22662:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_22659
	btr r12,2
	clc
	jmp LB_22660
LB_22659:
	bts r12,2
	stc
LB_22660:
	add rsp,24
; _f22324 %_22288 ⊢ %_22292 : %_22292
 ; {>  %_22291~1':_stg %_22290~0':_r64 %_22288~3':_p21303 %_22287~2':_stg }
; _f22324 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_22671
	btr r12,0
	jmp LB_22672
LB_22671:
	bts r12,0
LB_22672:
	call NS_E_22324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_22673
	btr r12,3
	jmp LB_22674
LB_22673:
	bts r12,3
LB_22674:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_22669
	btr r12,2
	clc
	jmp LB_22670
LB_22669:
	bts r12,2
	stc
LB_22670:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_22667
	btr r12,1
	clc
	jmp LB_22668
LB_22667:
	bts r12,1
	stc
LB_22668:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22665
	btr r12,0
	clc
	jmp LB_22666
LB_22665:
	bts r12,0
	stc
LB_22666:
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
LB_22675:
	cmp rax,0
	jz LB_22676
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_22675
LB_22676:
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
; ∎ { %_22293 %_22297 }
 ; {>  %_22293~0':_r64 %_22296~1':_stg %_22294~2':_stg %_22295~3':_stg %_22297~4':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_22677
	mov rdi,r14
	call dlt
LB_22677:
	bt r12,2
	jc LB_22678
	mov rdi,r8
	call dlt
LB_22678:
	bt r12,3
	jc LB_22679
	mov rdi,r9
	call dlt
LB_22679:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_22680
	btr r12,1
	jmp LB_22681
LB_22680:
	bts r12,1
LB_22681:
	ret
MTC_LB_22639:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22682
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
	jnc LB_22683
	bt QWORD [rdi],0
	jc LB_22684
	btr r12,2
	clc
	jmp LB_22685
LB_22684:
	bts r12,2
	stc
LB_22685:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22683:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22686:
	cmp r15,0
	jz LB_22687
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22686
LB_22687:
; 	» "" _ ⊢ 1' : %_22298
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_22285 %_22298 }
 ; {>  %_22285~0':_r64 %_22298~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22682:
NS_E_22284:
; 	|» { 0' 1' }
NS_E_RDI_22284:
MTC_LB_22688:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22689
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
	jnc LB_22690
	bt QWORD [rdi],0
	jc LB_22691
	btr r12,3
	clc
	jmp LB_22692
LB_22691:
	bts r12,3
	stc
LB_22692:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22690:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_22693
	btr r12,2
	jmp LB_22694
LB_22693:
	bts r12,2
LB_22694:
LB_22695:
	cmp r15,0
	jz LB_22696
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22695
LB_22696:
; _f56 %_22271 ⊢ %_22274 : %_22274
 ; {>  %_22273~2':(_lst)◂({ _stg _p21303 }) %_22271~0':_r64 }
	add r13,1
; _f22299 { %_22274 %_22273 } ⊢ { %_22275 %_22276 } : { %_22275 %_22276 }
 ; {>  %_22273~2':(_lst)◂({ _stg _p21303 }) %_22274~0':_r64 }
; _f22299 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22697
	btr r12,1
	jmp LB_22698
LB_22697:
	bts r12,1
LB_22698:
	call NS_E_22299
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_22275 ⊢ %_22277 : %_22277
 ; {>  %_22275~0':_r64 %_22276~1':_stg }
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
; ∎ { %_22277 %_22278 }
 ; {>  %_22277~0':_r64 %_22278~1':_stg %_22279~2':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_22699
	mov rdi,r8
	call dlt
LB_22699:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22689:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22700
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
	jnc LB_22701
	bt QWORD [rdi],0
	jc LB_22702
	btr r12,3
	clc
	jmp LB_22703
LB_22702:
	bts r12,3
	stc
LB_22703:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22701:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_22704
	btr r12,2
	jmp LB_22705
LB_22704:
	bts r12,2
LB_22705:
LB_22706:
	cmp r15,0
	jz LB_22707
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22706
LB_22707:
; _f22324 %_22280 ⊢ %_22281 : %_22281
 ; {>  %_22280~2':_p21303 %_22271~0':_r64 }
; _f22324 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22710
	btr r12,0
	jmp LB_22711
LB_22710:
	bts r12,0
LB_22711:
	call NS_E_22324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22712
	btr r12,1
	jmp LB_22713
LB_22712:
	bts r12,1
LB_22713:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22708
	btr r12,0
	clc
	jmp LB_22709
LB_22708:
	bts r12,0
	stc
LB_22709:
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
; ∎ { %_22271 %_22283 }
 ; {>  %_22283~2':_stg %_22271~0':_r64 %_22282~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_22714
	mov rdi,r14
	call dlt
LB_22714:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22715
	btr r12,1
	jmp LB_22716
LB_22715:
	bts r12,1
LB_22716:
	ret
MTC_LB_22700:
NS_E_22270:
; 	|» 0'
NS_E_RDI_22270:
MTC_LB_22717:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22718
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
	jnc LB_22719
	bt QWORD [rdi],0
	jc LB_22720
	btr r12,3
	clc
	jmp LB_22721
LB_22720:
	bts r12,3
	stc
LB_22721:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22719:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_22724
	btr r12,4
	clc
	jmp LB_22725
LB_22724:
	bts r12,4
	stc
LB_22725:
	mov r14,r10
	bt r12,4
	jc LB_22722
	btr r12,1
	jmp LB_22723
LB_22722:
	bts r12,1
LB_22723:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_22728
	btr r12,4
	clc
	jmp LB_22729
LB_22728:
	bts r12,4
	stc
LB_22729:
	mov r8,r10
	bt r12,4
	jc LB_22726
	btr r12,2
	jmp LB_22727
LB_22726:
	bts r12,2
LB_22727:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22730:
	cmp r15,0
	jz LB_22731
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22730
LB_22731:
; _f22270 %_22265 ⊢ %_22266 : %_22266
 ; {>  %_22265~2':_p21300 %_22264~1':_p21301 }
; _f22270 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22734
	btr r12,0
	jmp LB_22735
LB_22734:
	bts r12,0
LB_22735:
	call NS_E_22270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22732
	btr r12,1
	clc
	jmp LB_22733
LB_22732:
	bts r12,1
	stc
LB_22733:
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
; ∎ %_22268
 ; {>  %_22268~2':_stg %_22267~0':_stg %_22264~1':_p21301 }
; 	∎ 2'
	bt r12,0
	jc LB_22736
	mov rdi,r13
	call dlt
LB_22736:
	bt r12,1
	jc LB_22737
	mov rdi,r14
	call dlt
LB_22737:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22738
	btr r12,0
	jmp LB_22739
LB_22738:
	bts r12,0
LB_22739:
	ret
MTC_LB_22718:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22740
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
	jnc LB_22741
	bt QWORD [rdi],0
	jc LB_22742
	btr r12,1
	clc
	jmp LB_22743
LB_22742:
	bts r12,1
	stc
LB_22743:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22741:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22744:
	cmp r15,0
	jz LB_22745
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22744
LB_22745:
; 	» "" _ ⊢ 0' : %_22269
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_22269
 ; {>  %_22269~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_22740:
NS_E_22262:
; 	|» { 0' 1' }
NS_E_RDI_22262:
MTC_LB_22746:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22747
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
	jnc LB_22748
	bt QWORD [rdi],0
	jc LB_22749
	btr r12,3
	clc
	jmp LB_22750
LB_22749:
	bts r12,3
	stc
LB_22750:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22748:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_22751
	btr r12,2
	jmp LB_22752
LB_22751:
	bts r12,2
LB_22752:
LB_22753:
	cmp r15,0
	jz LB_22754
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22753
LB_22754:
; _f22270 %_22251 ⊢ %_22252 : %_22252
 ; {>  %_22249~0':t11143'(-1) %_22251~2':_p21300 }
; _f22270 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22757
	btr r12,0
	jmp LB_22758
LB_22757:
	bts r12,0
LB_22758:
	call NS_E_22270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22759
	btr r12,1
	jmp LB_22760
LB_22759:
	bts r12,1
LB_22760:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22755
	btr r12,0
	clc
	jmp LB_22756
LB_22755:
	bts r12,0
	stc
LB_22756:
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
; ∎ { %_22249 %_22254 }
 ; {>  %_22253~1':_stg %_22249~0':t11143'(-1) %_22254~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_22761
	mov rdi,r14
	call dlt
LB_22761:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_22762
	btr r12,1
	jmp LB_22763
LB_22762:
	bts r12,1
LB_22763:
	ret
MTC_LB_22747:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22764
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
	jnc LB_22765
	bt QWORD [rdi],0
	jc LB_22766
	btr r12,4
	clc
	jmp LB_22767
LB_22766:
	bts r12,4
	stc
LB_22767:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22765:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_22770
	btr r12,5
	clc
	jmp LB_22771
LB_22770:
	bts r12,5
	stc
LB_22771:
	mov r8,r11
	bt r12,5
	jc LB_22768
	btr r12,2
	jmp LB_22769
LB_22768:
	bts r12,2
LB_22769:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_22774
	btr r12,5
	clc
	jmp LB_22775
LB_22774:
	bts r12,5
	stc
LB_22775:
	mov r9,r11
	bt r12,5
	jc LB_22772
	btr r12,3
	jmp LB_22773
LB_22772:
	bts r12,3
LB_22773:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22776:
	cmp r15,0
	jz LB_22777
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22776
LB_22777:
; _f22262 { %_22249 %_22256 } ⊢ { %_22257 %_22258 } : { %_22257 %_22258 }
 ; {>  %_22256~3':_p21299 %_22249~0':t11143'(-1) %_22255~2':_p21301 }
; _f22262 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22780
	btr r12,1
	jmp LB_22781
LB_22780:
	bts r12,1
LB_22781:
	call NS_E_22262
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_22778
	btr r12,2
	clc
	jmp LB_22779
LB_22778:
	bts r12,2
	stc
LB_22779:
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
; ∎ { %_22257 %_22260 }
 ; {>  %_22259~1':_stg %_22257~0':t11143'(-1) %_22260~3':_stg %_22255~2':_p21301 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_22782
	mov rdi,r14
	call dlt
LB_22782:
	bt r12,2
	jc LB_22783
	mov rdi,r8
	call dlt
LB_22783:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22784
	btr r12,1
	jmp LB_22785
LB_22784:
	bts r12,1
LB_22785:
	ret
MTC_LB_22764:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_22786
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
	jnc LB_22787
	bt QWORD [rdi],0
	jc LB_22788
	btr r12,2
	clc
	jmp LB_22789
LB_22788:
	bts r12,2
	stc
LB_22789:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22787:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22790:
	cmp r15,0
	jz LB_22791
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22790
LB_22791:
; 	» "" _ ⊢ 1' : %_22261
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_22249 %_22261 }
 ; {>  %_22261~1':_stg %_22249~0':t11143'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22786:
NS_E_22248:
; 	|» { 0' 1' }
NS_E_RDI_22248:
MTC_LB_22792:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22793
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
	jnc LB_22794
	bt QWORD [rdi],0
	jc LB_22795
	btr r12,8
	clc
	jmp LB_22796
LB_22795:
	bts r12,8
	stc
LB_22796:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22794:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_22799
	btr r12,9
	clc
	jmp LB_22800
LB_22799:
	bts r12,9
	stc
LB_22800:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_22797
	btr r12,2
	jmp LB_22798
LB_22797:
	bts r12,2
LB_22798:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_22803
	btr r12,9
	clc
	jmp LB_22804
LB_22803:
	bts r12,9
	stc
LB_22804:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_22801
	btr r12,3
	jmp LB_22802
LB_22801:
	bts r12,3
LB_22802:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_22807
	btr r12,9
	clc
	jmp LB_22808
LB_22807:
	bts r12,9
	stc
LB_22808:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_22805
	btr r12,4
	jmp LB_22806
LB_22805:
	bts r12,4
LB_22806:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_22811
	btr r12,9
	clc
	jmp LB_22812
LB_22811:
	bts r12,9
	stc
LB_22812:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_22809
	btr r12,5
	jmp LB_22810
LB_22809:
	bts r12,5
LB_22810:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_22815
	btr r12,9
	clc
	jmp LB_22816
LB_22815:
	bts r12,9
	stc
LB_22816:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_22813
	btr r12,6
	jmp LB_22814
LB_22813:
	bts r12,6
LB_22814:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_22819
	btr r12,9
	clc
	jmp LB_22820
LB_22819:
	bts r12,9
	stc
LB_22820:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_22817
	btr r12,7
	jmp LB_22818
LB_22817:
	bts r12,7
LB_22818:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22821:
	cmp r15,0
	jz LB_22822
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22821
LB_22822:
; _f21407 %_22216 ⊢ %_22222 : %_22222
 ; {>  %_22218~4':_p21298 %_22220~6':(_opn)◂(_p21297) %_22217~3':(_p21259)◂(_stg) %_22219~5':_p21299 %_22221~7':_p21297 %_22214~0':_r64 %_22216~2':(_p21246)◂((_p21254)◂(_stg)) }
; _f21407 2' ⊢ 1'
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
	jc LB_22835
	btr r12,0
	jmp LB_22836
LB_22835:
	bts r12,0
LB_22836:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22837
	btr r12,1
	jmp LB_22838
LB_22837:
	bts r12,1
LB_22838:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_22833
	btr r12,7
	clc
	jmp LB_22834
LB_22833:
	bts r12,7
	stc
LB_22834:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_22831
	btr r12,6
	clc
	jmp LB_22832
LB_22831:
	bts r12,6
	stc
LB_22832:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_22829
	btr r12,5
	clc
	jmp LB_22830
LB_22829:
	bts r12,5
	stc
LB_22830:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22827
	btr r12,4
	clc
	jmp LB_22828
LB_22827:
	bts r12,4
	stc
LB_22828:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_22825
	btr r12,3
	clc
	jmp LB_22826
LB_22825:
	bts r12,3
	stc
LB_22826:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22823
	btr r12,0
	clc
	jmp LB_22824
LB_22823:
	bts r12,0
	stc
LB_22824:
	add rsp,56
; _f56 %_22214 ⊢ %_22223 : %_22223
 ; {>  %_22222~1':_stg %_22218~4':_p21298 %_22220~6':(_opn)◂(_p21297) %_22217~3':(_p21259)◂(_stg) %_22219~5':_p21299 %_22221~7':_p21297 %_22214~0':_r64 }
	add r13,1
; _f21584 { %_22223 %_22217 } ⊢ { %_22224 %_22225 } : { %_22224 %_22225 }
 ; {>  %_22222~1':_stg %_22218~4':_p21298 %_22220~6':(_opn)◂(_p21297) %_22217~3':(_p21259)◂(_stg) %_22219~5':_p21299 %_22221~7':_p21297 %_22223~0':_r64 }
; _f21584 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_22849
	btr r12,1
	jmp LB_22850
LB_22849:
	bts r12,1
LB_22850:
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_22851
	btr r12,2
	jmp LB_22852
LB_22851:
	bts r12,2
LB_22852:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_22847
	btr r12,7
	clc
	jmp LB_22848
LB_22847:
	bts r12,7
	stc
LB_22848:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_22845
	btr r12,6
	clc
	jmp LB_22846
LB_22845:
	bts r12,6
	stc
LB_22846:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_22843
	btr r12,5
	clc
	jmp LB_22844
LB_22843:
	bts r12,5
	stc
LB_22844:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_22841
	btr r12,4
	clc
	jmp LB_22842
LB_22841:
	bts r12,4
	stc
LB_22842:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22839
	btr r12,1
	clc
	jmp LB_22840
LB_22839:
	bts r12,1
	stc
LB_22840:
	add rsp,48
; _f55 %_22224 ⊢ %_22226 : %_22226
 ; {>  %_22224~0':_r64 %_22225~2':_stg %_22222~1':_stg %_22218~4':_p21298 %_22220~6':(_opn)◂(_p21297) %_22219~5':_p21299 %_22221~7':_p21297 }
	sub r13,1
; _f22248 { %_22226 %_22221 } ⊢ { %_22227 %_22228 } : { %_22227 %_22228 }
 ; {>  %_22225~2':_stg %_22222~1':_stg %_22218~4':_p21298 %_22220~6':(_opn)◂(_p21297) %_22226~0':_r64 %_22219~5':_p21299 %_22221~7':_p21297 }
; _f22248 { 0' 7' } ⊢ { 0' 3' }
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
	jc LB_22863
	btr r12,1
	jmp LB_22864
LB_22863:
	bts r12,1
LB_22864:
	call NS_E_22248
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_22865
	btr r12,3
	jmp LB_22866
LB_22865:
	bts r12,3
LB_22866:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_22861
	btr r12,6
	clc
	jmp LB_22862
LB_22861:
	bts r12,6
	stc
LB_22862:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_22859
	btr r12,5
	clc
	jmp LB_22860
LB_22859:
	bts r12,5
	stc
LB_22860:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22857
	btr r12,4
	clc
	jmp LB_22858
LB_22857:
	bts r12,4
	stc
LB_22858:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_22855
	btr r12,2
	clc
	jmp LB_22856
LB_22855:
	bts r12,2
	stc
LB_22856:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22853
	btr r12,1
	clc
	jmp LB_22854
LB_22853:
	bts r12,1
	stc
LB_22854:
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
LB_22867:
	cmp rax,0
	jz LB_22868
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_22867
LB_22868:
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
; ∎ { %_22229 %_22233 }
 ; {>  %_22231~2':_stg %_22233~7':_stg %_22229~0':_r64 %_22232~3':_stg %_22230~1':_stg %_22218~4':_p21298 %_22220~6':(_opn)◂(_p21297) %_22219~5':_p21299 }
; 	∎ { 0' 7' }
	bt r12,2
	jc LB_22869
	mov rdi,r8
	call dlt
LB_22869:
	bt r12,3
	jc LB_22870
	mov rdi,r9
	call dlt
LB_22870:
	bt r12,1
	jc LB_22871
	mov rdi,r14
	call dlt
LB_22871:
	bt r12,4
	jc LB_22872
	mov rdi,r10
	call dlt
LB_22872:
	bt r12,6
	jc LB_22873
	mov rdi,rcx
	call dlt
LB_22873:
	bt r12,5
	jc LB_22874
	mov rdi,r11
	call dlt
LB_22874:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_22875
	btr r12,1
	jmp LB_22876
LB_22875:
	bts r12,1
LB_22876:
	ret
MTC_LB_22793:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22877
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
	jnc LB_22878
	bt QWORD [rdi],0
	jc LB_22879
	btr r12,7
	clc
	jmp LB_22880
LB_22879:
	bts r12,7
	stc
LB_22880:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22878:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_22883
	btr r12,8
	clc
	jmp LB_22884
LB_22883:
	bts r12,8
	stc
LB_22884:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22881
	btr r12,2
	jmp LB_22882
LB_22881:
	bts r12,2
LB_22882:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_22887
	btr r12,8
	clc
	jmp LB_22888
LB_22887:
	bts r12,8
	stc
LB_22888:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22885
	btr r12,3
	jmp LB_22886
LB_22885:
	bts r12,3
LB_22886:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_22891
	btr r12,8
	clc
	jmp LB_22892
LB_22891:
	bts r12,8
	stc
LB_22892:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22889
	btr r12,4
	jmp LB_22890
LB_22889:
	bts r12,4
LB_22890:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_22895
	btr r12,8
	clc
	jmp LB_22896
LB_22895:
	bts r12,8
	stc
LB_22896:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22893
	btr r12,5
	jmp LB_22894
LB_22893:
	bts r12,5
LB_22894:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_22899
	btr r12,8
	clc
	jmp LB_22900
LB_22899:
	bts r12,8
	stc
LB_22900:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22897
	btr r12,6
	jmp LB_22898
LB_22897:
	bts r12,6
LB_22898:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22901:
	cmp r15,0
	jz LB_22902
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22901
LB_22902:
; _f21407 %_22234 ⊢ %_22239 : %_22239
 ; {>  %_22237~5':_p21299 %_22235~3':(_p21259)◂(_stg) %_22236~4':_p21298 %_22238~6':(_opn)◂(_p21297) %_22214~0':_r64 %_22234~2':(_p21246)◂((_p21254)◂(_stg)) }
; _f21407 2' ⊢ 1'
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
	jc LB_22913
	btr r12,0
	jmp LB_22914
LB_22913:
	bts r12,0
LB_22914:
	call NS_E_21407
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_22915
	btr r12,1
	jmp LB_22916
LB_22915:
	bts r12,1
LB_22916:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_22911
	btr r12,6
	clc
	jmp LB_22912
LB_22911:
	bts r12,6
	stc
LB_22912:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_22909
	btr r12,5
	clc
	jmp LB_22910
LB_22909:
	bts r12,5
	stc
LB_22910:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22907
	btr r12,4
	clc
	jmp LB_22908
LB_22907:
	bts r12,4
	stc
LB_22908:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_22905
	btr r12,3
	clc
	jmp LB_22906
LB_22905:
	bts r12,3
	stc
LB_22906:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22903
	btr r12,0
	clc
	jmp LB_22904
LB_22903:
	bts r12,0
	stc
LB_22904:
	add rsp,48
; _f56 %_22214 ⊢ %_22240 : %_22240
 ; {>  %_22237~5':_p21299 %_22235~3':(_p21259)◂(_stg) %_22236~4':_p21298 %_22239~1':_stg %_22238~6':(_opn)◂(_p21297) %_22214~0':_r64 }
	add r13,1
; _f21584 { %_22240 %_22235 } ⊢ { %_22241 %_22242 } : { %_22241 %_22242 }
 ; {>  %_22237~5':_p21299 %_22235~3':(_p21259)◂(_stg) %_22236~4':_p21298 %_22240~0':_r64 %_22239~1':_stg %_22238~6':(_opn)◂(_p21297) }
; _f21584 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_22925
	btr r12,1
	jmp LB_22926
LB_22925:
	bts r12,1
LB_22926:
	call NS_E_21584
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_22927
	btr r12,2
	jmp LB_22928
LB_22927:
	bts r12,2
LB_22928:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_22923
	btr r12,6
	clc
	jmp LB_22924
LB_22923:
	bts r12,6
	stc
LB_22924:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_22921
	btr r12,5
	clc
	jmp LB_22922
LB_22921:
	bts r12,5
	stc
LB_22922:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_22919
	btr r12,4
	clc
	jmp LB_22920
LB_22919:
	bts r12,4
	stc
LB_22920:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_22917
	btr r12,1
	clc
	jmp LB_22918
LB_22917:
	bts r12,1
	stc
LB_22918:
	add rsp,40
; _f55 %_22241 ⊢ %_22243 : %_22243
 ; {>  %_22242~2':_stg %_22237~5':_p21299 %_22241~0':_r64 %_22236~4':_p21298 %_22239~1':_stg %_22238~6':(_opn)◂(_p21297) }
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
LB_22929:
	cmp rax,0
	jz LB_22930
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_22929
LB_22930:
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
; ∎ { %_22244 %_22247 }
 ; {>  %_22247~3':_stg %_22237~5':_p21299 %_22236~4':_p21298 %_22245~1':_stg %_22244~0':_r64 %_22246~2':_stg %_22238~6':(_opn)◂(_p21297) }
; 	∎ { 0' 3' }
	bt r12,5
	jc LB_22931
	mov rdi,r11
	call dlt
LB_22931:
	bt r12,4
	jc LB_22932
	mov rdi,r10
	call dlt
LB_22932:
	bt r12,1
	jc LB_22933
	mov rdi,r14
	call dlt
LB_22933:
	bt r12,2
	jc LB_22934
	mov rdi,r8
	call dlt
LB_22934:
	bt r12,6
	jc LB_22935
	mov rdi,rcx
	call dlt
LB_22935:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22936
	btr r12,1
	jmp LB_22937
LB_22936:
	bts r12,1
LB_22937:
	ret
MTC_LB_22877:
NS_E_22213:
; 	|» { 0' 1' }
NS_E_RDI_22213:
MTC_LB_22938:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22939
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
	jnc LB_22940
	bt QWORD [rdi],0
	jc LB_22941
	btr r12,7
	clc
	jmp LB_22942
LB_22941:
	bts r12,7
	stc
LB_22942:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22940:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_22945
	btr r12,8
	clc
	jmp LB_22946
LB_22945:
	bts r12,8
	stc
LB_22946:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22943
	btr r12,2
	jmp LB_22944
LB_22943:
	bts r12,2
LB_22944:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_22949
	btr r12,8
	clc
	jmp LB_22950
LB_22949:
	bts r12,8
	stc
LB_22950:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22947
	btr r12,3
	jmp LB_22948
LB_22947:
	bts r12,3
LB_22948:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_22953
	btr r12,8
	clc
	jmp LB_22954
LB_22953:
	bts r12,8
	stc
LB_22954:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22951
	btr r12,4
	jmp LB_22952
LB_22951:
	bts r12,4
LB_22952:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_22957
	btr r12,8
	clc
	jmp LB_22958
LB_22957:
	bts r12,8
	stc
LB_22958:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22955
	btr r12,5
	jmp LB_22956
LB_22955:
	bts r12,5
LB_22956:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_22961
	btr r12,8
	clc
	jmp LB_22962
LB_22961:
	bts r12,8
	stc
LB_22962:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_22959
	btr r12,6
	jmp LB_22960
LB_22959:
	bts r12,6
LB_22960:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22963:
	cmp r15,0
	jz LB_22964
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22963
LB_22964:
; _f22213 { %_22195 %_22201 } ⊢ { %_22202 %_22203 } : { %_22202 %_22203 }
 ; {>  %_22201~6':_p21296 %_22198~3':_p21298 %_22197~2':(_opn)◂(_stg) %_22200~5':(_opn)◂(_p21296) %_22195~0':_r64 %_22199~4':_p21299 }
; _f22213 { 0' 6' } ⊢ { 0' 1' }
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
	jc LB_22973
	btr r12,1
	jmp LB_22974
LB_22973:
	bts r12,1
LB_22974:
	call NS_E_22213
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_22971
	btr r12,5
	clc
	jmp LB_22972
LB_22971:
	bts r12,5
	stc
LB_22972:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22969
	btr r12,4
	clc
	jmp LB_22970
LB_22969:
	bts r12,4
	stc
LB_22970:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_22967
	btr r12,3
	clc
	jmp LB_22968
LB_22967:
	bts r12,3
	stc
LB_22968:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_22965
	btr r12,2
	clc
	jmp LB_22966
LB_22965:
	bts r12,2
	stc
LB_22966:
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
LB_22975:
	cmp rax,0
	jz LB_22976
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_22975
LB_22976:
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
; ∎ { %_22204 %_22206 }
 ; {>  %_22198~3':_p21298 %_22197~2':(_opn)◂(_stg) %_22204~0':_r64 %_22200~5':(_opn)◂(_p21296) %_22206~6':_stg %_22205~1':_stg %_22199~4':_p21299 }
; 	∎ { 0' 6' }
	bt r12,3
	jc LB_22977
	mov rdi,r9
	call dlt
LB_22977:
	bt r12,2
	jc LB_22978
	mov rdi,r8
	call dlt
LB_22978:
	bt r12,5
	jc LB_22979
	mov rdi,r11
	call dlt
LB_22979:
	bt r12,1
	jc LB_22980
	mov rdi,r14
	call dlt
LB_22980:
	bt r12,4
	jc LB_22981
	mov rdi,r10
	call dlt
LB_22981:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_22982
	btr r12,1
	jmp LB_22983
LB_22982:
	bts r12,1
LB_22983:
	ret
MTC_LB_22939:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22984
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
	jnc LB_22985
	bt QWORD [rdi],0
	jc LB_22986
	btr r12,6
	clc
	jmp LB_22987
LB_22986:
	bts r12,6
	stc
LB_22987:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_22985:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_22990
	btr r12,7
	clc
	jmp LB_22991
LB_22990:
	bts r12,7
	stc
LB_22991:
	mov r8,rdx
	bt r12,7
	jc LB_22988
	btr r12,2
	jmp LB_22989
LB_22988:
	bts r12,2
LB_22989:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_22994
	btr r12,7
	clc
	jmp LB_22995
LB_22994:
	bts r12,7
	stc
LB_22995:
	mov r9,rdx
	bt r12,7
	jc LB_22992
	btr r12,3
	jmp LB_22993
LB_22992:
	bts r12,3
LB_22993:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_22998
	btr r12,7
	clc
	jmp LB_22999
LB_22998:
	bts r12,7
	stc
LB_22999:
	mov r10,rdx
	bt r12,7
	jc LB_22996
	btr r12,4
	jmp LB_22997
LB_22996:
	bts r12,4
LB_22997:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_23002
	btr r12,7
	clc
	jmp LB_23003
LB_23002:
	bts r12,7
	stc
LB_23003:
	mov r11,rdx
	bt r12,7
	jc LB_23000
	btr r12,5
	jmp LB_23001
LB_23000:
	bts r12,5
LB_23001:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23004:
	cmp r15,0
	jz LB_23005
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23004
LB_23005:
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
LB_23006:
	cmp rax,0
	jz LB_23007
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23006
LB_23007:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_22211 %_22212 }
 ; {>  %_22211~0':_r64 %_22212~1':_stg %_22210~5':(_opn)◂(_p21296) %_22207~2':(_opn)◂(_stg) %_22208~3':_p21298 %_22209~4':_p21299 }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_23008
	mov rdi,r11
	call dlt
LB_23008:
	bt r12,2
	jc LB_23009
	mov rdi,r8
	call dlt
LB_23009:
	bt r12,3
	jc LB_23010
	mov rdi,r9
	call dlt
LB_23010:
	bt r12,4
	jc LB_23011
	mov rdi,r10
	call dlt
LB_23011:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22984:
NS_E_22194:
; 	|» { 0' 1' }
NS_E_RDI_22194:
MTC_LB_23012:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23013
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
	jnc LB_23014
	bt QWORD [rdi],0
	jc LB_23015
	btr r12,3
	clc
	jmp LB_23016
LB_23015:
	bts r12,3
	stc
LB_23016:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23014:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_23017
	btr r12,2
	jmp LB_23018
LB_23017:
	bts r12,2
LB_23018:
LB_23019:
	cmp r15,0
	jz LB_23020
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23019
LB_23020:
; _f22213 { %_22186 %_22188 } ⊢ { %_22189 %_22190 } : { %_22189 %_22190 }
 ; {>  %_22188~2':_p21296 %_22186~0':_r64 }
; _f22213 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23021
	btr r12,1
	jmp LB_23022
LB_23021:
	bts r12,1
LB_23022:
	call NS_E_22213
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_22189 %_22190 }
 ; {>  %_22189~0':_r64 %_22190~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_23013:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23023
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
	jnc LB_23024
	bt QWORD [rdi],0
	jc LB_23025
	btr r12,3
	clc
	jmp LB_23026
LB_23025:
	bts r12,3
	stc
LB_23026:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23024:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_23027
	btr r12,2
	jmp LB_23028
LB_23027:
	bts r12,2
LB_23028:
LB_23029:
	cmp r15,0
	jz LB_23030
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23029
LB_23030:
; _f22248 { %_22186 %_22191 } ⊢ { %_22192 %_22193 } : { %_22192 %_22193 }
 ; {>  %_22191~2':_p21297 %_22186~0':_r64 }
; _f22248 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23031
	btr r12,1
	jmp LB_23032
LB_23031:
	bts r12,1
LB_23032:
	call NS_E_22248
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_22192 %_22193 }
 ; {>  %_22193~1':_stg %_22192~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_23023:
NS_E_22185:
; 	|» { 0' 1' }
NS_E_RDI_22185:
MTC_LB_23033:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23034
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
	jnc LB_23035
	bt QWORD [rdi],0
	jc LB_23036
	btr r12,5
	clc
	jmp LB_23037
LB_23036:
	bts r12,5
	stc
LB_23037:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23035:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_23046
	btr r12,6
	clc
	jmp LB_23047
LB_23046:
	bts r12,6
	stc
LB_23047:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_23040
	btr r12,4
	clc
	jmp LB_23041
LB_23040:
	bts r12,4
	stc
LB_23041:
	mov r8,r10
	bt r12,4
	jc LB_23038
	btr r12,2
	jmp LB_23039
LB_23038:
	bts r12,2
LB_23039:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_23044
	btr r12,4
	clc
	jmp LB_23045
LB_23044:
	bts r12,4
	stc
LB_23045:
	mov r9,r10
	bt r12,4
	jc LB_23042
	btr r12,3
	jmp LB_23043
LB_23042:
	bts r12,3
LB_23043:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23050
	btr r12,6
	clc
	jmp LB_23051
LB_23050:
	bts r12,6
	stc
LB_23051:
	mov r10,rcx
	bt r12,6
	jc LB_23048
	btr r12,4
	jmp LB_23049
LB_23048:
	bts r12,4
LB_23049:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23052:
	cmp r15,0
	jz LB_23053
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23052
LB_23053:
; _f56 %_22168 ⊢ %_22173 : %_22173
 ; {>  %_22170~2':_stg %_22168~0':_r64 %_22172~4':(_lst)◂({ _stg _p21295 }) %_22171~3':_p21295 }
	add r13,1
; _f22194 { %_22173 %_22171 } ⊢ { %_22174 %_22175 } : { %_22174 %_22175 }
 ; {>  %_22170~2':_stg %_22173~0':_r64 %_22172~4':(_lst)◂({ _stg _p21295 }) %_22171~3':_p21295 }
; _f22194 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23058
	btr r12,1
	jmp LB_23059
LB_23058:
	bts r12,1
LB_23059:
	call NS_E_22194
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_23056
	btr r12,4
	clc
	jmp LB_23057
LB_23056:
	bts r12,4
	stc
LB_23057:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_23054
	btr r12,2
	clc
	jmp LB_23055
LB_23054:
	bts r12,2
	stc
LB_23055:
	add rsp,24
; _f55 %_22174 ⊢ %_22176 : %_22176
 ; {>  %_22174~0':_r64 %_22170~2':_stg %_22175~1':_stg %_22172~4':(_lst)◂({ _stg _p21295 }) }
	sub r13,1
; _f22185 { %_22176 %_22172 } ⊢ { %_22177 %_22178 } : { %_22177 %_22178 }
 ; {>  %_22170~2':_stg %_22175~1':_stg %_22176~0':_r64 %_22172~4':(_lst)◂({ _stg _p21295 }) }
; _f22185 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_23064
	btr r12,1
	jmp LB_23065
LB_23064:
	bts r12,1
LB_23065:
	call NS_E_22185
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_23066
	btr r12,3
	jmp LB_23067
LB_23066:
	bts r12,3
LB_23067:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_23062
	btr r12,2
	clc
	jmp LB_23063
LB_23062:
	bts r12,2
	stc
LB_23063:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_23060
	btr r12,1
	clc
	jmp LB_23061
LB_23060:
	bts r12,1
	stc
LB_23061:
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
LB_23068:
	cmp rax,0
	jz LB_23069
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23068
LB_23069:
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
; ∎ { %_22179 %_22183 }
 ; {>  %_22182~3':_stg %_22183~4':_stg %_22180~2':_stg %_22179~0':_r64 %_22181~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_23070
	mov rdi,r9
	call dlt
LB_23070:
	bt r12,2
	jc LB_23071
	mov rdi,r8
	call dlt
LB_23071:
	bt r12,1
	jc LB_23072
	mov rdi,r14
	call dlt
LB_23072:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_23073
	btr r12,1
	jmp LB_23074
LB_23073:
	bts r12,1
LB_23074:
	ret
MTC_LB_23034:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23075
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
	jnc LB_23076
	bt QWORD [rdi],0
	jc LB_23077
	btr r12,2
	clc
	jmp LB_23078
LB_23077:
	bts r12,2
	stc
LB_23078:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23076:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23079:
	cmp r15,0
	jz LB_23080
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23079
LB_23080:
; 	» "" _ ⊢ 1' : %_22184
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_22168 %_22184 }
 ; {>  %_22184~1':_stg %_22168~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_23075:
NS_E_22167:
; 	|» { 0' 1' }
NS_E_RDI_22167:
MTC_LB_23081:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23082
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
	jnc LB_23083
	bt QWORD [rdi],0
	jc LB_23084
	btr r12,5
	clc
	jmp LB_23085
LB_23084:
	bts r12,5
	stc
LB_23085:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23083:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_23094
	btr r12,6
	clc
	jmp LB_23095
LB_23094:
	bts r12,6
	stc
LB_23095:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_23088
	btr r12,4
	clc
	jmp LB_23089
LB_23088:
	bts r12,4
	stc
LB_23089:
	mov r8,r10
	bt r12,4
	jc LB_23086
	btr r12,2
	jmp LB_23087
LB_23086:
	bts r12,2
LB_23087:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_23092
	btr r12,4
	clc
	jmp LB_23093
LB_23092:
	bts r12,4
	stc
LB_23093:
	mov r9,r10
	bt r12,4
	jc LB_23090
	btr r12,3
	jmp LB_23091
LB_23090:
	bts r12,3
LB_23091:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23098
	btr r12,6
	clc
	jmp LB_23099
LB_23098:
	bts r12,6
	stc
LB_23099:
	mov r10,rcx
	bt r12,6
	jc LB_23096
	btr r12,4
	jmp LB_23097
LB_23096:
	bts r12,4
LB_23097:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23100:
	cmp r15,0
	jz LB_23101
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23100
LB_23101:
; _f38 %_22143 ⊢ %_22148 : %_22148
 ; {>  %_22147~4':(_lst)◂({ _stg _p21294 }) %_22143~0':_r64 %_22145~2':_stg %_22146~3':_p21294 }
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
	jc LB_23106
	btr r12,4
	clc
	jmp LB_23107
LB_23106:
	bts r12,4
	stc
LB_23107:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_23104
	btr r12,3
	clc
	jmp LB_23105
LB_23104:
	bts r12,3
	stc
LB_23105:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_23102
	btr r12,2
	clc
	jmp LB_23103
LB_23102:
	bts r12,2
	stc
LB_23103:
	add rsp,32
; _f22167 { %_22148 %_22147 } ⊢ { %_22149 %_22150 } : { %_22149 %_22150 }
 ; {>  %_22147~4':(_lst)◂({ _stg _p21294 }) %_22145~2':_stg %_22148~0':_r64 %_22146~3':_p21294 }
; _f22167 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_23112
	btr r12,1
	jmp LB_23113
LB_23112:
	bts r12,1
LB_23113:
	call NS_E_22167
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_23110
	btr r12,3
	clc
	jmp LB_23111
LB_23110:
	bts r12,3
	stc
LB_23111:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_23108
	btr r12,2
	clc
	jmp LB_23109
LB_23108:
	bts r12,2
	stc
LB_23109:
	add rsp,24
MTC_LB_23114:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23115
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
	jnc LB_23116
	bt QWORD [rdi],0
	jc LB_23117
	btr r12,5
	clc
	jmp LB_23118
LB_23117:
	bts r12,5
	stc
LB_23118:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23116:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_23119
	btr r12,4
	jmp LB_23120
LB_23119:
	bts r12,4
LB_23120:
LB_23121:
	cmp r15,0
	jz LB_23122
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23121
LB_23122:
; _f56 %_22149 ⊢ %_22152 : %_22152
 ; {>  %_22151~4':(_lst)◂({ _stg _p21303 }) %_22150~1':_stg %_22145~2':_stg %_22149~0':_r64 }
	add r13,1
; _f22299 { %_22152 %_22151 } ⊢ { %_22153 %_22154 } : { %_22153 %_22154 }
 ; {>  %_22151~4':(_lst)◂({ _stg _p21303 }) %_22152~0':_r64 %_22150~1':_stg %_22145~2':_stg }
; _f22299 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_23127
	btr r12,1
	jmp LB_23128
LB_23127:
	bts r12,1
LB_23128:
	call NS_E_22299
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_23129
	btr r12,3
	jmp LB_23130
LB_23129:
	bts r12,3
LB_23130:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_23125
	btr r12,2
	clc
	jmp LB_23126
LB_23125:
	bts r12,2
	stc
LB_23126:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_23123
	btr r12,1
	clc
	jmp LB_23124
LB_23123:
	bts r12,1
	stc
LB_23124:
	add rsp,24
; _f55 %_22153 ⊢ %_22155 : %_22155
 ; {>  %_22153~0':_r64 %_22150~1':_stg %_22145~2':_stg %_22154~3':_stg }
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
LB_23131:
	cmp rax,0
	jz LB_23132
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23131
LB_23132:
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
; ∎ { %_22156 %_22160 }
 ; {>  %_22156~0':_r64 %_22160~4':_stg %_22158~3':_stg %_22157~2':_stg %_22159~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_23133
	mov rdi,r9
	call dlt
LB_23133:
	bt r12,2
	jc LB_23134
	mov rdi,r8
	call dlt
LB_23134:
	bt r12,1
	jc LB_23135
	mov rdi,r14
	call dlt
LB_23135:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_23136
	btr r12,1
	jmp LB_23137
LB_23136:
	bts r12,1
LB_23137:
	ret
MTC_LB_23115:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23138
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
	jnc LB_23139
	bt QWORD [rdi],0
	jc LB_23140
	btr r12,5
	clc
	jmp LB_23141
LB_23140:
	bts r12,5
	stc
LB_23141:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23139:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_23142
	btr r12,4
	jmp LB_23143
LB_23142:
	bts r12,4
LB_23143:
LB_23144:
	cmp r15,0
	jz LB_23145
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23144
LB_23145:
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
LB_23146:
	cmp rax,0
	jz LB_23147
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23146
LB_23147:
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
; ∎ { %_22162 %_22165 }
 ; {>  %_22164~1':_stg %_22165~3':_stg %_22161~4':_p21303 %_22163~2':_stg %_22162~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_23148
	mov rdi,r14
	call dlt
LB_23148:
	bt r12,4
	jc LB_23149
	mov rdi,r10
	call dlt
LB_23149:
	bt r12,2
	jc LB_23150
	mov rdi,r8
	call dlt
LB_23150:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23151
	btr r12,1
	jmp LB_23152
LB_23151:
	bts r12,1
LB_23152:
	ret
MTC_LB_23138:
MTC_LB_23082:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23153
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
	jnc LB_23154
	bt QWORD [rdi],0
	jc LB_23155
	btr r12,2
	clc
	jmp LB_23156
LB_23155:
	bts r12,2
	stc
LB_23156:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23154:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23157:
	cmp r15,0
	jz LB_23158
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23157
LB_23158:
; 	» "" _ ⊢ 1' : %_22166
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_22143 %_22166 }
 ; {>  %_22166~1':_stg %_22143~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_23153:
NS_E_22142:
; 	|» { 0' 1' }
NS_E_RDI_22142:
MTC_LB_23159:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23160
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
	jnc LB_23161
	bt QWORD [rdi],0
	jc LB_23162
	btr r12,4
	clc
	jmp LB_23163
LB_23162:
	bts r12,4
	stc
LB_23163:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23161:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_23166
	btr r12,5
	clc
	jmp LB_23167
LB_23166:
	bts r12,5
	stc
LB_23167:
	mov r8,r11
	bt r12,5
	jc LB_23164
	btr r12,2
	jmp LB_23165
LB_23164:
	bts r12,2
LB_23165:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_23170
	btr r12,5
	clc
	jmp LB_23171
LB_23170:
	bts r12,5
	stc
LB_23171:
	mov r9,r11
	bt r12,5
	jc LB_23168
	btr r12,3
	jmp LB_23169
LB_23168:
	bts r12,3
LB_23169:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23172:
	cmp r15,0
	jz LB_23173
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23172
LB_23173:
MTC_LB_23174:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23175
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
	jnc LB_23176
	bt QWORD [rdi],0
	jc LB_23177
	btr r12,4
	clc
	jmp LB_23178
LB_23177:
	bts r12,4
	stc
LB_23178:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23176:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_23179
	btr r12,1
	jmp LB_23180
LB_23179:
	bts r12,1
LB_23180:
LB_23181:
	cmp r15,0
	jz LB_23182
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23181
LB_23182:
; _f56 %_22074 ⊢ %_22079 : %_22079
 ; {>  %_22078~1':(_lst)◂(_p21291) %_22076~2':_stg %_22074~0':_r64 }
	add r13,1
; _f22073 { %_22079 %_22078 } ⊢ { %_22080 %_22081 } : { %_22080 %_22081 }
 ; {>  %_22078~1':(_lst)◂(_p21291) %_22079~0':_r64 %_22076~2':_stg }
; _f22073 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_22073
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_23183
	btr r12,2
	clc
	jmp LB_23184
LB_23183:
	bts r12,2
	stc
LB_23184:
	add rsp,16
; _f55 %_22080 ⊢ %_22082 : %_22082
 ; {>  %_22076~2':_stg %_22081~1':_stg %_22080~0':_r64 }
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
LB_23185:
	cmp rax,0
	jz LB_23186
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23185
LB_23186:
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
LB_23187:
	cmp rax,0
	jz LB_23188
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23187
LB_23188:
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
; ∎ { %_22083 %_22086 }
 ; {>  %_22085~1':_stg %_22083~0':_r64 %_22086~3':_stg %_22084~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_23189
	mov rdi,r14
	call dlt
LB_23189:
	bt r12,2
	jc LB_23190
	mov rdi,r8
	call dlt
LB_23190:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23191
	btr r12,1
	jmp LB_23192
LB_23191:
	bts r12,1
LB_23192:
	ret
MTC_LB_23175:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23193
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
	jnc LB_23194
	bt QWORD [rdi],0
	jc LB_23195
	btr r12,4
	clc
	jmp LB_23196
LB_23195:
	bts r12,4
	stc
LB_23196:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23194:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_23197
	btr r12,1
	jmp LB_23198
LB_23197:
	bts r12,1
LB_23198:
LB_23199:
	cmp r15,0
	jz LB_23200
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23199
LB_23200:
; _f21212 %_22087 ⊢ %_22088 : %_22088
 ; {>  %_22087~1':_p21201 %_22076~2':_stg %_22074~0':_r64 }
; _f21212 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_23205
	btr r12,0
	jmp LB_23206
LB_23205:
	bts r12,0
LB_23206:
	call NS_E_21212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_23207
	btr r12,1
	jmp LB_23208
LB_23207:
	bts r12,1
LB_23208:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_23203
	btr r12,2
	clc
	jmp LB_23204
LB_23203:
	bts r12,2
	stc
LB_23204:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23201
	btr r12,0
	clc
	jmp LB_23202
LB_23201:
	bts r12,0
	stc
LB_23202:
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
LB_23209:
	cmp rax,0
	jz LB_23210
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23209
LB_23210:
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
; ∎ { %_22089 %_22092 }
 ; {>  %_22091~1':_stg %_22089~0':_r64 %_22092~3':_stg %_22090~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_23211
	mov rdi,r14
	call dlt
LB_23211:
	bt r12,2
	jc LB_23212
	mov rdi,r8
	call dlt
LB_23212:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23213
	btr r12,1
	jmp LB_23214
LB_23213:
	bts r12,1
LB_23214:
	ret
MTC_LB_23193:
MTC_LB_23160:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23215
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
	jnc LB_23216
	bt QWORD [rdi],0
	jc LB_23217
	btr r12,3
	clc
	jmp LB_23218
LB_23217:
	bts r12,3
	stc
LB_23218:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23216:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_23219
	btr r12,2
	jmp LB_23220
LB_23219:
	bts r12,2
LB_23220:
LB_23221:
	cmp r15,0
	jz LB_23222
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23221
LB_23222:
; _f56 %_22074 ⊢ %_22094 : %_22094
 ; {>  %_22093~2':(_lst)◂({ _stg _p21295 }) %_22074~0':_r64 }
	add r13,1
; _f22185 { %_22094 %_22093 } ⊢ { %_22095 %_22096 } : { %_22095 %_22096 }
 ; {>  %_22094~0':_r64 %_22093~2':(_lst)◂({ _stg _p21295 }) }
; _f22185 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23223
	btr r12,1
	jmp LB_23224
LB_23223:
	bts r12,1
LB_23224:
	call NS_E_22185
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_22095 ⊢ %_22097 : %_22097
 ; {>  %_22096~1':_stg %_22095~0':_r64 }
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
LB_23225:
	cmp rax,0
	jz LB_23226
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23225
LB_23226:
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
; ∎ { %_22098 %_22100 }
 ; {>  %_22098~0':_r64 %_22099~1':_stg %_22100~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_23227
	mov rdi,r14
	call dlt
LB_23227:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23228
	btr r12,1
	jmp LB_23229
LB_23228:
	bts r12,1
LB_23229:
	ret
MTC_LB_23215:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_23230
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
	jnc LB_23231
	bt QWORD [rdi],0
	jc LB_23232
	btr r12,4
	clc
	jmp LB_23233
LB_23232:
	bts r12,4
	stc
LB_23233:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23231:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_23236
	btr r12,5
	clc
	jmp LB_23237
LB_23236:
	bts r12,5
	stc
LB_23237:
	mov r8,r11
	bt r12,5
	jc LB_23234
	btr r12,2
	jmp LB_23235
LB_23234:
	bts r12,2
LB_23235:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_23240
	btr r12,5
	clc
	jmp LB_23241
LB_23240:
	bts r12,5
	stc
LB_23241:
	mov r9,r11
	bt r12,5
	jc LB_23238
	btr r12,3
	jmp LB_23239
LB_23238:
	bts r12,3
LB_23239:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23242:
	cmp r15,0
	jz LB_23243
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23242
LB_23243:
; _f56 %_22074 ⊢ %_22103 : %_22103
 ; {>  %_22102~3':_p21293 %_22101~2':_stg %_22074~0':_r64 }
	add r13,1
; _f22358 { %_22103 %_22102 } ⊢ { %_22104 %_22105 } : { %_22104 %_22105 }
 ; {>  %_22103~0':_r64 %_22102~3':_p21293 %_22101~2':_stg }
; _f22358 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23246
	btr r12,1
	jmp LB_23247
LB_23246:
	bts r12,1
LB_23247:
	call NS_E_22358
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_23244
	btr r12,2
	clc
	jmp LB_23245
LB_23244:
	bts r12,2
	stc
LB_23245:
	add rsp,16
; _f55 %_22104 ⊢ %_22106 : %_22106
 ; {>  %_22105~1':_stg %_22101~2':_stg %_22104~0':_r64 }
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
LB_23248:
	cmp rax,0
	jz LB_23249
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23248
LB_23249:
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
; ∎ { %_22107 %_22110 }
 ; {>  %_22108~2':_stg %_22110~3':_stg %_22109~1':_stg %_22107~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_23250
	mov rdi,r8
	call dlt
LB_23250:
	bt r12,1
	jc LB_23251
	mov rdi,r14
	call dlt
LB_23251:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23252
	btr r12,1
	jmp LB_23253
LB_23252:
	bts r12,1
LB_23253:
	ret
MTC_LB_23230:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_23254
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
	jnc LB_23255
	bt QWORD [rdi],0
	jc LB_23256
	btr r12,3
	clc
	jmp LB_23257
LB_23256:
	bts r12,3
	stc
LB_23257:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23255:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_23258
	btr r12,2
	jmp LB_23259
LB_23258:
	bts r12,2
LB_23259:
LB_23260:
	cmp r15,0
	jz LB_23261
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23260
LB_23261:
; _f56 %_22074 ⊢ %_22112 : %_22112
 ; {>  %_22111~2':(_lst)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) %_22074~0':_r64 }
	add r13,1
; _f22379 { %_22112 %_22111 } ⊢ { %_22113 %_22114 } : { %_22113 %_22114 }
 ; {>  %_22111~2':(_lst)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) %_22112~0':_r64 }
; _f22379 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23262
	btr r12,1
	jmp LB_23263
LB_23262:
	bts r12,1
LB_23263:
	call NS_E_22379
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_22113 ⊢ %_22115 : %_22115
 ; {>  %_22113~0':_r64 %_22114~1':_stg }
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
LB_23264:
	cmp rax,0
	jz LB_23265
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23264
LB_23265:
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
; ∎ { %_22116 %_22118 }
 ; {>  %_22117~1':_stg %_22118~2':_stg %_22116~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_23266
	mov rdi,r14
	call dlt
LB_23266:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23267
	btr r12,1
	jmp LB_23268
LB_23267:
	bts r12,1
LB_23268:
	ret
MTC_LB_23254:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_23269
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
	jnc LB_23270
	bt QWORD [rdi],0
	jc LB_23271
	btr r12,4
	clc
	jmp LB_23272
LB_23271:
	bts r12,4
	stc
LB_23272:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23270:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_23275
	btr r12,5
	clc
	jmp LB_23276
LB_23275:
	bts r12,5
	stc
LB_23276:
	mov r8,r11
	bt r12,5
	jc LB_23273
	btr r12,2
	jmp LB_23274
LB_23273:
	bts r12,2
LB_23274:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_23279
	btr r12,5
	clc
	jmp LB_23280
LB_23279:
	bts r12,5
	stc
LB_23280:
	mov r9,r11
	bt r12,5
	jc LB_23277
	btr r12,3
	jmp LB_23278
LB_23277:
	bts r12,3
LB_23278:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23281:
	cmp r15,0
	jz LB_23282
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23281
LB_23282:
MTC_LB_23283:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23284
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
	jnc LB_23285
	bt QWORD [rdi],0
	jc LB_23286
	btr r12,4
	clc
	jmp LB_23287
LB_23286:
	bts r12,4
	stc
LB_23287:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23285:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_23288
	btr r12,1
	jmp LB_23289
LB_23288:
	bts r12,1
LB_23289:
LB_23290:
	cmp r15,0
	jz LB_23291
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23290
LB_23291:
; _f56 %_22074 ⊢ %_22122 : %_22122
 ; {>  %_22121~1':(_lst)◂({ _stg _p21303 }) %_22119~2':_stg %_22074~0':_r64 }
	add r13,1
; _f22299 { %_22122 %_22121 } ⊢ { %_22123 %_22124 } : { %_22123 %_22124 }
 ; {>  %_22121~1':(_lst)◂({ _stg _p21303 }) %_22119~2':_stg %_22122~0':_r64 }
; _f22299 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_22299
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_23292
	btr r12,2
	clc
	jmp LB_23293
LB_23292:
	bts r12,2
	stc
LB_23293:
	add rsp,16
; _f55 %_22123 ⊢ %_22125 : %_22125
 ; {>  %_22124~1':_stg %_22119~2':_stg %_22123~0':_r64 }
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
LB_23294:
	cmp rax,0
	jz LB_23295
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23294
LB_23295:
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
; ∎ { %_22126 %_22129 }
 ; {>  %_22129~3':_stg %_22126~0':_r64 %_22128~1':_stg %_22127~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_23296
	mov rdi,r14
	call dlt
LB_23296:
	bt r12,2
	jc LB_23297
	mov rdi,r8
	call dlt
LB_23297:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23298
	btr r12,1
	jmp LB_23299
LB_23298:
	bts r12,1
LB_23299:
	ret
MTC_LB_23284:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23300
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
	jnc LB_23301
	bt QWORD [rdi],0
	jc LB_23302
	btr r12,4
	clc
	jmp LB_23303
LB_23302:
	bts r12,4
	stc
LB_23303:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23301:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_23304
	btr r12,1
	jmp LB_23305
LB_23304:
	bts r12,1
LB_23305:
LB_23306:
	cmp r15,0
	jz LB_23307
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23306
LB_23307:
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
LB_23308:
	cmp rax,0
	jz LB_23309
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23308
LB_23309:
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
; ∎ { %_22131 %_22133 }
 ; {>  %_22133~3':_stg %_22131~0':_r64 %_22130~1':_p21303 %_22132~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_23310
	mov rdi,r14
	call dlt
LB_23310:
	bt r12,2
	jc LB_23311
	mov rdi,r8
	call dlt
LB_23311:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23312
	btr r12,1
	jmp LB_23313
LB_23312:
	bts r12,1
LB_23313:
	ret
MTC_LB_23300:
MTC_LB_23269:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_23314
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
	jnc LB_23315
	bt QWORD [rdi],0
	jc LB_23316
	btr r12,3
	clc
	jmp LB_23317
LB_23316:
	bts r12,3
	stc
LB_23317:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23315:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_23318
	btr r12,2
	jmp LB_23319
LB_23318:
	bts r12,2
LB_23319:
LB_23320:
	cmp r15,0
	jz LB_23321
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23320
LB_23321:
; _f56 %_22074 ⊢ %_22135 : %_22135
 ; {>  %_22134~2':(_lst)◂({ _stg _p21294 }) %_22074~0':_r64 }
	add r13,1
; _f22167 { %_22135 %_22134 } ⊢ { %_22136 %_22137 } : { %_22136 %_22137 }
 ; {>  %_22134~2':(_lst)◂({ _stg _p21294 }) %_22135~0':_r64 }
; _f22167 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23322
	btr r12,1
	jmp LB_23323
LB_23322:
	bts r12,1
LB_23323:
	call NS_E_22167
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_22136 ⊢ %_22138 : %_22138
 ; {>  %_22136~0':_r64 %_22137~1':_stg }
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
LB_23324:
	cmp rax,0
	jz LB_23325
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_23324
LB_23325:
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
; ∎ { %_22139 %_22141 }
 ; {>  %_22141~2':_stg %_22139~0':_r64 %_22140~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_23326
	mov rdi,r14
	call dlt
LB_23326:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23327
	btr r12,1
	jmp LB_23328
LB_23327:
	bts r12,1
LB_23328:
	ret
MTC_LB_23314:
NS_E_22073:
; 	|» { 0' 1' }
NS_E_RDI_22073:
MTC_LB_23329:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23330
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
	jnc LB_23331
	bt QWORD [rdi],0
	jc LB_23332
	btr r12,2
	clc
	jmp LB_23333
LB_23332:
	bts r12,2
	stc
LB_23333:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23331:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23334:
	cmp r15,0
	jz LB_23335
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23334
LB_23335:
; 	» "" _ ⊢ 1' : %_22063
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_22061 %_22063 }
 ; {>  %_22061~0':_r64 %_22063~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_23330:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23336
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
	jnc LB_23337
	bt QWORD [rdi],0
	jc LB_23338
	btr r12,4
	clc
	jmp LB_23339
LB_23338:
	bts r12,4
	stc
LB_23339:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23337:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_23342
	btr r12,5
	clc
	jmp LB_23343
LB_23342:
	bts r12,5
	stc
LB_23343:
	mov r8,r11
	bt r12,5
	jc LB_23340
	btr r12,2
	jmp LB_23341
LB_23340:
	bts r12,2
LB_23341:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_23346
	btr r12,5
	clc
	jmp LB_23347
LB_23346:
	bts r12,5
	stc
LB_23347:
	mov r9,r11
	bt r12,5
	jc LB_23344
	btr r12,3
	jmp LB_23345
LB_23344:
	bts r12,3
LB_23345:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23348:
	cmp r15,0
	jz LB_23349
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23348
LB_23349:
; _f22142 { %_22061 %_22064 } ⊢ { %_22066 %_22067 } : { %_22066 %_22067 }
 ; {>  %_22065~3':(_lst)◂(_p21291) %_22064~2':_p21291 %_22061~0':_r64 }
; _f22142 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23352
	btr r12,1
	jmp LB_23353
LB_23352:
	bts r12,1
LB_23353:
	call NS_E_22142
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_23350
	btr r12,3
	clc
	jmp LB_23351
LB_23350:
	bts r12,3
	stc
LB_23351:
	add rsp,16
; _f22073 { %_22066 %_22065 } ⊢ { %_22068 %_22069 } : { %_22068 %_22069 }
 ; {>  %_22065~3':(_lst)◂(_p21291) %_22067~1':_stg %_22066~0':_r64 }
; _f22073 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23356
	btr r12,1
	jmp LB_23357
LB_23356:
	bts r12,1
LB_23357:
	call NS_E_22073
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_23358
	btr r12,2
	jmp LB_23359
LB_23358:
	bts r12,2
LB_23359:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_23354
	btr r12,1
	clc
	jmp LB_23355
LB_23354:
	bts r12,1
	stc
LB_23355:
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
; ∎ { %_22068 %_22072 }
 ; {>  %_22071~2':_stg %_22072~3':_stg %_22068~0':_r64 %_22070~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_23360
	mov rdi,r8
	call dlt
LB_23360:
	bt r12,1
	jc LB_23361
	mov rdi,r14
	call dlt
LB_23361:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23362
	btr r12,1
	jmp LB_23363
LB_23362:
	bts r12,1
LB_23363:
	ret
MTC_LB_23336:
NS_E_23367:
NS_E_RDI_23367:
NS_E_23367_ETR_TBL:
NS_E_23367_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23471
	jmp LB_23472
LB_23471:
	jmp LB_23463
LB_23472:
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
	jc LB_23464
	btr r12,0
	clc
	jmp LB_23465
LB_23464:
	bts r12,0
	stc
LB_23465:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_23460
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_23371 : %_23371
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_23371
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_23371 ⊢ %_23372 : %_23372
 ; {>  %_23371~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23372
 ; {>  %_23372~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23458
	btr r12,3
	jmp LB_23459
LB_23458:
	bts r12,3
LB_23459:
	mov r8,0
	bts r12,2
	ret
LB_23460:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23462
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23461
LB_23462:
	add rsp,8
	ret
LB_23463:
	add rsp,16
	pop r14
LB_23461:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_20374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23487
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23479
LB_23487:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_23367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23492
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23493
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23493:
	jmp LB_23479
LB_23492:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23482
	btr r12,1
	clc
	jmp LB_23483
LB_23482:
	bts r12,1
	stc
LB_23483:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23480
	btr r12,0
	clc
	jmp LB_23481
LB_23480:
	bts r12,0
	stc
LB_23481:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23476
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56 %_23374 ⊢ %_23375 : %_23375
 ; {>  %_23373~0':_r64 %_23374~1':_r64 }
	add r14,1
; _some %_23375 ⊢ %_23376 : %_23376
 ; {>  %_23373~0':_r64 %_23375~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_23376
 ; {>  %_23373~0':_r64 %_23376~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_23473
	mov rdi,r13
	call dlt
LB_23473:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_23474
	btr r12,3
	jmp LB_23475
LB_23474:
	bts r12,3
LB_23475:
	mov r8,0
	bts r12,2
	ret
LB_23476:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23478
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23477
LB_23478:
	add rsp,8
	ret
LB_23479:
	add rsp,32
	pop r14
LB_23477:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23368:
NS_E_RDI_23368:
NS_E_23368_ETR_TBL:
NS_E_23368_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_23510
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_23510
	jmp LB_23511
LB_23510:
	jmp LB_23500
LB_23511:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23515
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23516
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23516:
	jmp LB_23500
LB_23515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23503
	btr r12,1
	clc
	jmp LB_23504
LB_23503:
	bts r12,1
	stc
LB_23504:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23501
	btr r12,0
	clc
	jmp LB_23502
LB_23501:
	bts r12,0
	stc
LB_23502:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23497
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_23518
	btr r12,2
	jmp LB_23519
LB_23518:
	bts r12,2
LB_23519:
	mov r13,r14
	bt r12,1
	jc LB_23520
	btr r12,0
	jmp LB_23521
LB_23520:
	bts r12,0
LB_23521:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_23377 ⊢ %_23378 : %_23378
 ; {>  %_23377~0':_r64 }
	add r13,1
; _some %_23378 ⊢ %_23379 : %_23379
 ; {>  %_23378~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23379
 ; {>  %_23379~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23495
	btr r12,3
	jmp LB_23496
LB_23495:
	bts r12,3
LB_23496:
	mov r8,0
	bts r12,2
	ret
LB_23497:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23499
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23498
LB_23499:
	add rsp,8
	ret
LB_23500:
	add rsp,32
	pop r14
LB_23498:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_23537
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_23537
	jmp LB_23538
LB_23537:
	jmp LB_23527
LB_23538:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23542
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23543
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23543:
	jmp LB_23527
LB_23542:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23530
	btr r12,1
	clc
	jmp LB_23531
LB_23530:
	bts r12,1
	stc
LB_23531:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23528
	btr r12,0
	clc
	jmp LB_23529
LB_23528:
	bts r12,0
	stc
LB_23529:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23524
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_23545
	btr r12,2
	jmp LB_23546
LB_23545:
	bts r12,2
LB_23546:
	mov r13,r14
	bt r12,1
	jc LB_23547
	btr r12,0
	jmp LB_23548
LB_23547:
	bts r12,0
LB_23548:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_23380 ⊢ %_23381 : %_23381
 ; {>  %_23380~0':_r64 }
	add r13,1
; _some %_23381 ⊢ %_23382 : %_23382
 ; {>  %_23381~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23382
 ; {>  %_23382~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23522
	btr r12,3
	jmp LB_23523
LB_23522:
	bts r12,3
LB_23523:
	mov r8,0
	bts r12,2
	ret
LB_23524:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23526
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23525
LB_23526:
	add rsp,8
	ret
LB_23527:
	add rsp,32
	pop r14
LB_23525:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_23551
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_23383 : %_23383
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_23383
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_23383 ⊢ %_23384 : %_23384
 ; {>  %_23383~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23384
 ; {>  %_23384~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23549
	btr r12,3
	jmp LB_23550
LB_23549:
	bts r12,3
LB_23550:
	mov r8,0
	bts r12,2
	ret
LB_23551:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23553
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23552
LB_23553:
	add rsp,8
	ret
LB_23554:
	add rsp,0
	pop r14
LB_23552:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23369:
NS_E_RDI_23369:
NS_E_23369_ETR_TBL:
NS_E_23369_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23634
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23581
LB_23634:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_23642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_23642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_23642
	jmp LB_23643
LB_23642:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23640
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23640:
	jmp LB_23581
LB_23643:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23598
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23599
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23599:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23600:
	jmp LB_23582
LB_23598:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23610
	jmp LB_23611
LB_23610:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23606
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23606:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23607
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23607:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23608
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23608:
	jmp LB_23582
LB_23611:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_23370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23615
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23616
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23616:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23617
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23617:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23618
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23618:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23619
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23619:
	jmp LB_23582
LB_23615:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_23369_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23624
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_23625
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_23625:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23626
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23626:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23627
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23627:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23628
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23628:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23629
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23629:
	jmp LB_23582
LB_23624:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_23593
	btr r12,5
	clc
	jmp LB_23594
LB_23593:
	bts r12,5
	stc
LB_23594:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_23591
	btr r12,4
	clc
	jmp LB_23592
LB_23591:
	bts r12,4
	stc
LB_23592:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23589
	btr r12,3
	clc
	jmp LB_23590
LB_23589:
	bts r12,3
	stc
LB_23590:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23587
	btr r12,2
	clc
	jmp LB_23588
LB_23587:
	bts r12,2
	stc
LB_23588:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23585
	btr r12,1
	clc
	jmp LB_23586
LB_23585:
	bts r12,1
	stc
LB_23586:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23583
	btr r12,0
	clc
	jmp LB_23584
LB_23583:
	bts r12,0
	stc
LB_23584:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_23578
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_23644
	btr r12,6
	jmp LB_23645
LB_23644:
	bts r12,6
LB_23645:
	mov r8,r10
	bt r12,4
	jc LB_23646
	btr r12,2
	jmp LB_23647
LB_23646:
	bts r12,2
LB_23647:
	mov rdx,r14
	bt r12,1
	jc LB_23648
	btr r12,7
	jmp LB_23649
LB_23648:
	bts r12,7
LB_23649:
	mov r14,rcx
	bt r12,6
	jc LB_23650
	btr r12,1
	jmp LB_23651
LB_23650:
	bts r12,1
LB_23651:
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
	jc LB_23654
	btr r12,6
	clc
	jmp LB_23655
LB_23654:
	bts r12,6
	stc
LB_23655:
	mov r9,rcx
	bt r12,6
	jc LB_23652
	btr r12,3
	jmp LB_23653
LB_23652:
	bts r12,3
LB_23653:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23658
	btr r12,6
	clc
	jmp LB_23659
LB_23658:
	bts r12,6
	stc
LB_23659:
	mov r10,rcx
	bt r12,6
	jc LB_23656
	btr r12,4
	jmp LB_23657
LB_23656:
	bts r12,4
LB_23657:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_23390 : %_23390
 ; {>  %_23387~2':_r64 %_23389~4':(_lst)◂(_p23364) %_23386~1':_r64 %_23385~0':_r64 %_23388~3':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_23390
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_23390 %_23385 } ⊢ { %_23391 %_23392 } : { %_23391 %_23392 }
 ; {>  %_23390~5':_r64 %_23387~2':_r64 %_23389~4':(_lst)◂(_p23364) %_23386~1':_r64 %_23385~0':_r64 %_23388~3':_r64 }
	add r11,r13
; _f51 { %_23391 %_23386 } ⊢ { %_23393 %_23394 } : { %_23393 %_23394 }
 ; {>  %_23387~2':_r64 %_23389~4':(_lst)◂(_p23364) %_23386~1':_r64 %_23392~0':_r64 %_23388~3':_r64 %_23391~5':_r64 }
	add r11,r14
; _f51 { %_23393 %_23387 } ⊢ { %_23395 %_23396 } : { %_23395 %_23396 }
 ; {>  %_23387~2':_r64 %_23389~4':(_lst)◂(_p23364) %_23392~0':_r64 %_23393~5':_r64 %_23388~3':_r64 %_23394~1':_r64 }
	add r11,r8
; _f23365 %_23395 ⊢ %_23397 : %_23397
 ; {>  %_23389~4':(_lst)◂(_p23364) %_23396~2':_r64 %_23392~0':_r64 %_23395~5':_r64 %_23388~3':_r64 %_23394~1':_r64 }
; _f23365 5' ⊢ °0◂5'
; _cns { %_23397 %_23389 } ⊢ %_23398 : %_23398
 ; {>  %_23389~4':(_lst)◂(_p23364) %_23396~2':_r64 %_23392~0':_r64 %_23397~°0◂5':_p23364 %_23388~3':_r64 %_23394~1':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_23388 %_23398 } ⊢ %_23399 : %_23399
 ; {>  %_23396~2':_r64 %_23392~0':_r64 %_23388~3':_r64 %_23398~°0◂{ °0◂5' 4' }:(_lst)◂(_p23364) %_23394~1':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_23399
 ; {>  %_23396~2':_r64 %_23392~0':_r64 %_23399~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p23364) }) %_23394~1':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,2
	jc LB_23555
	mov rdi,r8
	call dlt
LB_23555:
	bt r12,0
	jc LB_23556
	mov rdi,r13
	call dlt
LB_23556:
	bt r12,1
	jc LB_23557
	mov rdi,r14
	call dlt
LB_23557:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_23558
	btr r12,0
	jmp LB_23559
LB_23558:
	bts r12,0
LB_23559:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_23562
	btr r12,1
	jmp LB_23563
LB_23562:
	bts r12,1
LB_23563:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_23560
	btr QWORD [rdi],0
	jmp LB_23561
LB_23560:
	bts QWORD [rdi],0
LB_23561:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_23572
	btr r12,0
	jmp LB_23573
LB_23572:
	bts r12,0
LB_23573:
	mov rsi,1
	bt r12,0
	jc LB_23570
	mov rsi,0
	bt r13,0
	jc LB_23570
	jmp LB_23571
LB_23570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_23571:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_23568
	btr QWORD [rdi],0
	jmp LB_23569
LB_23568:
	bts QWORD [rdi],0
LB_23569:
	mov r13,r10
	bt r12,4
	jc LB_23576
	btr r12,0
	jmp LB_23577
LB_23576:
	bts r12,0
LB_23577:
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_23574
	btr QWORD [rdi],1
	jmp LB_23575
LB_23574:
	bts QWORD [rdi],1
LB_23575:
	mov rsi,1
	bt r12,1
	jc LB_23566
	mov rsi,0
	bt r14,0
	jc LB_23566
	jmp LB_23567
LB_23566:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_23567:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_23564
	btr QWORD [rdi],1
	jmp LB_23565
LB_23564:
	bts QWORD [rdi],1
LB_23565:
	mov r8,0
	bts r12,2
	ret
LB_23578:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23580
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23579
LB_23580:
	add rsp,8
	ret
LB_23582:
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
LB_23581:
	add rsp,96
	pop r14
LB_23579:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23713
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23685
LB_23713:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_23721
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_23721
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_23721
	jmp LB_23722
LB_23721:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23719
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23719:
	jmp LB_23685
LB_23722:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_23367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23698
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23699
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23699:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23700
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23700:
	jmp LB_23686
LB_23698:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_23369_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23705
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23706
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23706:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23707
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23708:
	jmp LB_23686
LB_23705:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23693
	btr r12,3
	clc
	jmp LB_23694
LB_23693:
	bts r12,3
	stc
LB_23694:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23691
	btr r12,2
	clc
	jmp LB_23692
LB_23691:
	bts r12,2
	stc
LB_23692:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23689
	btr r12,1
	clc
	jmp LB_23690
LB_23689:
	bts r12,1
	stc
LB_23690:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23687
	btr r12,0
	clc
	jmp LB_23688
LB_23687:
	bts r12,0
	stc
LB_23688:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_23682
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_23723
	btr r12,4
	jmp LB_23724
LB_23723:
	bts r12,4
LB_23724:
	mov r14,r8
	bt r12,2
	jc LB_23725
	btr r12,1
	jmp LB_23726
LB_23725:
	bts r12,1
LB_23726:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_23727
	btr r12,4
	jmp LB_23728
LB_23727:
	bts r12,4
LB_23728:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_23731
	btr r12,5
	clc
	jmp LB_23732
LB_23731:
	bts r12,5
	stc
LB_23732:
	mov r8,r11
	bt r12,5
	jc LB_23729
	btr r12,2
	jmp LB_23730
LB_23729:
	bts r12,2
LB_23730:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_23735
	btr r12,5
	clc
	jmp LB_23736
LB_23735:
	bts r12,5
	stc
LB_23736:
	mov r9,r11
	bt r12,5
	jc LB_23733
	btr r12,3
	jmp LB_23734
LB_23733:
	bts r12,3
LB_23734:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_23404 : %_23404
 ; {>  %_23402~2':_r64 %_23403~3':(_lst)◂(_p23364) %_23401~1':_r64 %_23400~0':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_23404
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_23404 %_23400 } ⊢ { %_23405 %_23406 } : { %_23405 %_23406 }
 ; {>  %_23404~4':_r64 %_23402~2':_r64 %_23403~3':(_lst)◂(_p23364) %_23401~1':_r64 %_23400~0':_r64 }
	add r10,r13
; _f51 { %_23405 %_23401 } ⊢ { %_23407 %_23408 } : { %_23407 %_23408 }
 ; {>  %_23406~0':_r64 %_23405~4':_r64 %_23402~2':_r64 %_23403~3':(_lst)◂(_p23364) %_23401~1':_r64 }
	add r10,r14
; _f23365 %_23407 ⊢ %_23409 : %_23409
 ; {>  %_23406~0':_r64 %_23407~4':_r64 %_23402~2':_r64 %_23403~3':(_lst)◂(_p23364) %_23408~1':_r64 }
; _f23365 4' ⊢ °0◂4'
; _cns { %_23409 %_23403 } ⊢ %_23410 : %_23410
 ; {>  %_23406~0':_r64 %_23409~°0◂4':_p23364 %_23402~2':_r64 %_23403~3':(_lst)◂(_p23364) %_23408~1':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_23402 %_23410 } ⊢ %_23411 : %_23411
 ; {>  %_23406~0':_r64 %_23410~°0◂{ °0◂4' 3' }:(_lst)◂(_p23364) %_23402~2':_r64 %_23408~1':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_23411
 ; {>  %_23406~0':_r64 %_23411~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p23364) }) %_23408~1':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_23660
	mov rdi,r13
	call dlt
LB_23660:
	bt r12,1
	jc LB_23661
	mov rdi,r14
	call dlt
LB_23661:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_23662
	btr r12,0
	jmp LB_23663
LB_23662:
	bts r12,0
LB_23663:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_23666
	btr r12,1
	jmp LB_23667
LB_23666:
	bts r12,1
LB_23667:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_23664
	btr QWORD [rdi],0
	jmp LB_23665
LB_23664:
	bts QWORD [rdi],0
LB_23665:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_23676
	btr r12,2
	jmp LB_23677
LB_23676:
	bts r12,2
LB_23677:
	mov rsi,1
	bt r12,2
	jc LB_23674
	mov rsi,0
	bt r8,0
	jc LB_23674
	jmp LB_23675
LB_23674:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_23675:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_23672
	btr QWORD [rdi],0
	jmp LB_23673
LB_23672:
	bts QWORD [rdi],0
LB_23673:
	mov r8,r13
	bt r12,0
	jc LB_23680
	btr r12,2
	jmp LB_23681
LB_23680:
	bts r12,2
LB_23681:
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_23678
	btr QWORD [rdi],1
	jmp LB_23679
LB_23678:
	bts QWORD [rdi],1
LB_23679:
	mov rsi,1
	bt r12,1
	jc LB_23670
	mov rsi,0
	bt r14,0
	jc LB_23670
	jmp LB_23671
LB_23670:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_23671:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_23668
	btr QWORD [rdi],1
	jmp LB_23669
LB_23668:
	bts QWORD [rdi],1
LB_23669:
	mov r8,0
	bts r12,2
	ret
LB_23682:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23684
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23683
LB_23684:
	add rsp,8
	ret
LB_23686:
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
LB_23685:
	add rsp,64
	pop r14
LB_23683:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_23367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23808
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23800
LB_23808:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_23369_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23813
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23814
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23814:
	jmp LB_23800
LB_23813:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23803
	btr r12,1
	clc
	jmp LB_23804
LB_23803:
	bts r12,1
	stc
LB_23804:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23801
	btr r12,0
	clc
	jmp LB_23802
LB_23801:
	bts r12,0
	stc
LB_23802:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23797
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_23816
	btr r12,3
	jmp LB_23817
LB_23816:
	bts r12,3
LB_23817:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_23820
	btr r12,4
	clc
	jmp LB_23821
LB_23820:
	bts r12,4
	stc
LB_23821:
	mov r14,r10
	bt r12,4
	jc LB_23818
	btr r12,1
	jmp LB_23819
LB_23818:
	bts r12,1
LB_23819:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_23824
	btr r12,4
	clc
	jmp LB_23825
LB_23824:
	bts r12,4
	stc
LB_23825:
	mov r8,r10
	bt r12,4
	jc LB_23822
	btr r12,2
	jmp LB_23823
LB_23822:
	bts r12,2
LB_23823:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f51 { %_23413 %_23412 } ⊢ { %_23415 %_23416 } : { %_23415 %_23416 }
 ; {>  %_23414~2':(_lst)◂(_p23364) %_23412~0':_r64 %_23413~1':_r64 }
	add r14,r13
MTC_LB_23737:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23738
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
	jnc LB_23739
	bt QWORD [rdi],0
	jc LB_23740
	btr r12,5
	clc
	jmp LB_23741
LB_23740:
	bts r12,5
	stc
LB_23741:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23739:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_23744
	btr r12,6
	clc
	jmp LB_23745
LB_23744:
	bts r12,6
	stc
LB_23745:
	mov r9,rcx
	bt r12,6
	jc LB_23742
	btr r12,3
	jmp LB_23743
LB_23742:
	bts r12,3
LB_23743:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23748
	btr r12,6
	clc
	jmp LB_23749
LB_23748:
	bts r12,6
	stc
LB_23749:
	mov r10,rcx
	bt r12,6
	jc LB_23746
	btr r12,4
	jmp LB_23747
LB_23746:
	bts r12,4
LB_23747:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23738
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
	jnc LB_23750
	bt QWORD [rdi],0
	jc LB_23751
	btr r12,6
	clc
	jmp LB_23752
LB_23751:
	bts r12,6
	stc
LB_23752:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_23750:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_23753
	btr r12,5
	jmp LB_23754
LB_23753:
	bts r12,5
LB_23754:
LB_23755:
	cmp r15,0
	jz LB_23756
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23755
LB_23756:
; _f51 { %_23419 %_23416 } ⊢ { %_23420 %_23421 } : { %_23420 %_23421 }
 ; {>  %_23415~1':_r64 %_23416~0':_r64 %_23419~5':_r64 %_23418~4':(_lst)◂(_p23364) }
	add r11,r13
; _f23366 %_23420 ⊢ %_23422 : %_23422
 ; {>  %_23415~1':_r64 %_23420~5':_r64 %_23421~0':_r64 %_23418~4':(_lst)◂(_p23364) }
; _f23366 5' ⊢ °1◂5'
; _cns { %_23422 %_23418 } ⊢ %_23423 : %_23423
 ; {>  %_23415~1':_r64 %_23421~0':_r64 %_23422~°1◂5':_p23364 %_23418~4':(_lst)◂(_p23364) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_23415 %_23423 } ⊢ %_23424 : %_23424
 ; {>  %_23423~°0◂{ °1◂5' 4' }:(_lst)◂(_p23364) %_23415~1':_r64 %_23421~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_23424
 ; {>  %_23424~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p23364) }) %_23421~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_23757
	mov rdi,r13
	call dlt
LB_23757:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_23760
	btr r12,0
	jmp LB_23761
LB_23760:
	bts r12,0
LB_23761:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_23758
	btr QWORD [rdi],0
	jmp LB_23759
LB_23758:
	bts QWORD [rdi],0
LB_23759:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_23770
	btr r12,1
	jmp LB_23771
LB_23770:
	bts r12,1
LB_23771:
	mov rsi,1
	bt r12,1
	jc LB_23768
	mov rsi,0
	bt r14,0
	jc LB_23768
	jmp LB_23769
LB_23768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_23769:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_23766
	btr QWORD [rdi],0
	jmp LB_23767
LB_23766:
	bts QWORD [rdi],0
LB_23767:
	mov r14,r10
	bt r12,4
	jc LB_23774
	btr r12,1
	jmp LB_23775
LB_23774:
	bts r12,1
LB_23775:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_23772
	btr QWORD [rdi],1
	jmp LB_23773
LB_23772:
	bts QWORD [rdi],1
LB_23773:
	mov rsi,1
	bt r12,0
	jc LB_23764
	mov rsi,0
	bt r13,0
	jc LB_23764
	jmp LB_23765
LB_23764:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_23765:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_23762
	btr QWORD [rdi],1
	jmp LB_23763
LB_23762:
	bts QWORD [rdi],1
LB_23763:
	mov r8,0
	bts r12,2
	ret
MTC_LB_23738:
	mov r15,0
LB_23777:
	cmp r15,0
	jz LB_23778
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23777
LB_23778:
; _f23366 %_23416 ⊢ %_23425 : %_23425
 ; {>  %_23415~1':_r64 %_23414~2':(_lst)◂(_p23364) %_23416~0':_r64 }
; _f23366 0' ⊢ °1◂0'
; _cns { %_23425 %_23414 } ⊢ %_23426 : %_23426
 ; {>  %_23415~1':_r64 %_23414~2':(_lst)◂(_p23364) %_23425~°1◂0':_p23364 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_23415 %_23426 } ⊢ %_23427 : %_23427
 ; {>  %_23415~1':_r64 %_23426~°0◂{ °1◂0' 2' }:(_lst)◂(_p23364) }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_23427
 ; {>  %_23427~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p23364) }) }
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
	jc LB_23781
	btr r12,4
	jmp LB_23782
LB_23781:
	bts r12,4
LB_23782:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_23779
	btr QWORD [rdi],0
	jmp LB_23780
LB_23779:
	bts QWORD [rdi],0
LB_23780:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_23791
	btr r12,1
	jmp LB_23792
LB_23791:
	bts r12,1
LB_23792:
	mov rsi,1
	bt r12,1
	jc LB_23789
	mov rsi,0
	bt r14,0
	jc LB_23789
	jmp LB_23790
LB_23789:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_23790:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_23787
	btr QWORD [rdi],0
	jmp LB_23788
LB_23787:
	bts QWORD [rdi],0
LB_23788:
	mov r14,r8
	bt r12,2
	jc LB_23795
	btr r12,1
	jmp LB_23796
LB_23795:
	bts r12,1
LB_23796:
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_23793
	btr QWORD [rdi],1
	jmp LB_23794
LB_23793:
	bts QWORD [rdi],1
LB_23794:
	mov rsi,1
	bt r12,4
	jc LB_23785
	mov rsi,0
	bt r10,0
	jc LB_23785
	jmp LB_23786
LB_23785:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_23786:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_23783
	btr QWORD [rdi],1
	jmp LB_23784
LB_23783:
	bts QWORD [rdi],1
LB_23784:
	mov r8,0
	bts r12,2
	ret
MTC_LB_23776:
LB_23797:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23799
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23798
LB_23799:
	add rsp,8
	ret
LB_23800:
	add rsp,32
	pop r14
LB_23798:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_23834
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_23428 : %_23428
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_23429 : %_23429
 ; {>  %_23428~°1◂{  }:(_lst)◂(t11594'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_23429
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_23429 %_23428 } ⊢ %_23430 : %_23430
 ; {>  %_23429~0':_r64 %_23428~°1◂{  }:(_lst)◂(t11594'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_23430
 ; {>  %_23430~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t11598'(0)) }) }
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
	jc LB_23828
	btr r12,1
	jmp LB_23829
LB_23828:
	bts r12,1
LB_23829:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_23826
	btr QWORD [rdi],0
	jmp LB_23827
LB_23826:
	bts QWORD [rdi],0
LB_23827:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_23832
	mov rsi,0
	bt r14,0
	jc LB_23832
	jmp LB_23833
LB_23832:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_23833:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_23830
	btr QWORD [rdi],1
	jmp LB_23831
LB_23830:
	bts QWORD [rdi],1
LB_23831:
	mov r8,0
	bts r12,2
	ret
LB_23834:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23836
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23835
LB_23836:
	add rsp,8
	ret
LB_23837:
	add rsp,0
	pop r14
LB_23835:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23370:
NS_E_RDI_23370:
NS_E_23370_ETR_TBL:
NS_E_23370_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23875
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23845
LB_23875:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_23883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_23883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_23883
	jmp LB_23884
LB_23883:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23881
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23881:
	jmp LB_23845
LB_23884:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23858
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23859
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23859:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23860
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23860:
	jmp LB_23846
LB_23858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23870
	jmp LB_23871
LB_23870:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23866
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23866:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23867
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23867:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23868
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23868:
	jmp LB_23846
LB_23871:
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
	jc LB_23853
	btr r12,3
	clc
	jmp LB_23854
LB_23853:
	bts r12,3
	stc
LB_23854:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23851
	btr r12,2
	clc
	jmp LB_23852
LB_23851:
	bts r12,2
	stc
LB_23852:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23849
	btr r12,1
	clc
	jmp LB_23850
LB_23849:
	bts r12,1
	stc
LB_23850:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23847
	btr r12,0
	clc
	jmp LB_23848
LB_23847:
	bts r12,0
	stc
LB_23848:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_23842
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_23885
	btr r12,4
	jmp LB_23886
LB_23885:
	bts r12,4
LB_23886:
	mov r14,r8
	bt r12,2
	jc LB_23887
	btr r12,1
	jmp LB_23888
LB_23887:
	bts r12,1
LB_23888:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_23433 : %_23433
 ; {>  %_23432~1':_r64 %_23431~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_23433
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_23433 %_23431 } ⊢ { %_23434 %_23435 } : { %_23434 %_23435 }
 ; {>  %_23433~2':_r64 %_23432~1':_r64 %_23431~0':_r64 }
	add r8,r13
; _f51 { %_23434 %_23432 } ⊢ { %_23436 %_23437 } : { %_23436 %_23437 }
 ; {>  %_23434~2':_r64 %_23435~0':_r64 %_23432~1':_r64 }
	add r8,r14
; _some %_23436 ⊢ %_23438 : %_23438
 ; {>  %_23437~1':_r64 %_23435~0':_r64 %_23436~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_23438
 ; {>  %_23437~1':_r64 %_23435~0':_r64 %_23438~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_23838
	mov rdi,r14
	call dlt
LB_23838:
	bt r12,0
	jc LB_23839
	mov rdi,r13
	call dlt
LB_23839:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_23840
	btr r12,3
	jmp LB_23841
LB_23840:
	bts r12,3
LB_23841:
	mov r8,0
	bts r12,2
	ret
LB_23842:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23844
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23843
LB_23844:
	add rsp,8
	ret
LB_23846:
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
LB_23845:
	add rsp,64
	pop r14
LB_23843:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23951
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23898
LB_23951:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_23959
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_23959
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_23959
	jmp LB_23960
LB_23959:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23957
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23957:
	jmp LB_23898
LB_23960:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_23368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23915
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23916
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23916:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23917
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23917:
	jmp LB_23899
LB_23915:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23927
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23927
	jmp LB_23928
LB_23927:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23923
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23923:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23924
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23924:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23925
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23925:
	jmp LB_23899
LB_23928:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_23370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23932
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23933
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23933:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23934
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23934:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23935
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23935:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23936
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23936:
	jmp LB_23899
LB_23932:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_23370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23941
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_23942
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_23942:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23943
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23943:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23944
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23944:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23945
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23945:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23946
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23946:
	jmp LB_23899
LB_23941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_23910
	btr r12,5
	clc
	jmp LB_23911
LB_23910:
	bts r12,5
	stc
LB_23911:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_23908
	btr r12,4
	clc
	jmp LB_23909
LB_23908:
	bts r12,4
	stc
LB_23909:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23906
	btr r12,3
	clc
	jmp LB_23907
LB_23906:
	bts r12,3
	stc
LB_23907:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23904
	btr r12,2
	clc
	jmp LB_23905
LB_23904:
	bts r12,2
	stc
LB_23905:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23902
	btr r12,1
	clc
	jmp LB_23903
LB_23902:
	bts r12,1
	stc
LB_23903:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23900
	btr r12,0
	clc
	jmp LB_23901
LB_23900:
	bts r12,0
	stc
LB_23901:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_23895
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_23961
	btr r12,6
	jmp LB_23962
LB_23961:
	bts r12,6
LB_23962:
	mov r9,r11
	bt r12,5
	jc LB_23963
	btr r12,3
	jmp LB_23964
LB_23963:
	bts r12,3
LB_23964:
	mov r11,r8
	bt r12,2
	jc LB_23965
	btr r12,5
	jmp LB_23966
LB_23965:
	bts r12,5
LB_23966:
	mov r8,r10
	bt r12,4
	jc LB_23967
	btr r12,2
	jmp LB_23968
LB_23967:
	bts r12,2
LB_23968:
	mov r10,r14
	bt r12,1
	jc LB_23969
	btr r12,4
	jmp LB_23970
LB_23969:
	bts r12,4
LB_23970:
	mov r14,r11
	bt r12,5
	jc LB_23971
	btr r12,1
	jmp LB_23972
LB_23971:
	bts r12,1
LB_23972:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_23443 : %_23443
 ; {>  %_23440~1':_r64 %_23439~0':_r64 %_23441~2':_r64 %_23442~3':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_23443
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_23443 %_23439 } ⊢ { %_23444 %_23445 } : { %_23444 %_23445 }
 ; {>  %_23440~1':_r64 %_23439~0':_r64 %_23443~4':_r64 %_23441~2':_r64 %_23442~3':_r64 }
	add r10,r13
; _f51 { %_23444 %_23440 } ⊢ { %_23446 %_23447 } : { %_23446 %_23447 }
 ; {>  %_23440~1':_r64 %_23441~2':_r64 %_23445~0':_r64 %_23442~3':_r64 %_23444~4':_r64 }
	add r10,r14
; _f51 { %_23446 %_23441 } ⊢ { %_23448 %_23449 } : { %_23448 %_23449 }
 ; {>  %_23446~4':_r64 %_23441~2':_r64 %_23445~0':_r64 %_23442~3':_r64 %_23447~1':_r64 }
	add r10,r8
; _f51 { %_23448 %_23442 } ⊢ { %_23450 %_23451 } : { %_23450 %_23451 }
 ; {>  %_23449~2':_r64 %_23445~0':_r64 %_23442~3':_r64 %_23447~1':_r64 %_23448~4':_r64 }
	add r10,r9
; _some %_23450 ⊢ %_23452 : %_23452
 ; {>  %_23450~4':_r64 %_23449~2':_r64 %_23451~3':_r64 %_23445~0':_r64 %_23447~1':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_23452
 ; {>  %_23449~2':_r64 %_23452~°0◂4':(_opn)◂(_r64) %_23451~3':_r64 %_23445~0':_r64 %_23447~1':_r64 }
; 	∎ °0◂4'
	bt r12,2
	jc LB_23889
	mov rdi,r8
	call dlt
LB_23889:
	bt r12,3
	jc LB_23890
	mov rdi,r9
	call dlt
LB_23890:
	bt r12,0
	jc LB_23891
	mov rdi,r13
	call dlt
LB_23891:
	bt r12,1
	jc LB_23892
	mov rdi,r14
	call dlt
LB_23892:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_23893
	btr r12,3
	jmp LB_23894
LB_23893:
	bts r12,3
LB_23894:
	mov r8,0
	bts r12,2
	ret
LB_23895:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23897
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23896
LB_23897:
	add rsp,8
	ret
LB_23899:
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
LB_23898:
	add rsp,96
	pop r14
LB_23896:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_23367_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23987
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23979
LB_23987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_23370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23992
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23993:
	jmp LB_23979
LB_23992:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23982
	btr r12,1
	clc
	jmp LB_23983
LB_23982:
	bts r12,1
	stc
LB_23983:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23980
	btr r12,0
	clc
	jmp LB_23981
LB_23980:
	bts r12,0
	stc
LB_23981:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23976
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f51 { %_23453 %_23454 } ⊢ { %_23455 %_23456 } : { %_23455 %_23456 }
 ; {>  %_23453~0':_r64 %_23454~1':_r64 }
	add r13,r14
; _some %_23455 ⊢ %_23457 : %_23457
 ; {>  %_23456~1':_r64 %_23455~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23457
 ; {>  %_23457~°0◂0':(_opn)◂(_r64) %_23456~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_23973
	mov rdi,r14
	call dlt
LB_23973:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23974
	btr r12,3
	jmp LB_23975
LB_23974:
	bts r12,3
LB_23975:
	mov r8,0
	bts r12,2
	ret
LB_23976:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23978
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_23977
LB_23978:
	add rsp,8
	ret
LB_23979:
	add rsp,32
	pop r14
LB_23977:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24017:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_24017:
MTC_LB_24018:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_24019
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
	jnc LB_24020
	bt QWORD [rdi],0
	jc LB_24021
	btr r12,7
	clc
	jmp LB_24022
LB_24021:
	bts r12,7
	stc
LB_24022:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24020:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_24025
	btr r12,8
	clc
	jmp LB_24026
LB_24025:
	bts r12,8
	stc
LB_24026:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_24023
	btr r12,5
	jmp LB_24024
LB_24023:
	bts r12,5
LB_24024:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_24029
	btr r12,8
	clc
	jmp LB_24030
LB_24029:
	bts r12,8
	stc
LB_24030:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_24027
	btr r12,6
	jmp LB_24028
LB_24027:
	bts r12,6
LB_24028:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_24031:
	cmp r15,0
	jz LB_24032
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24031
LB_24032:
MTC_LB_24033:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_24034
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
	jnc LB_24035
	bt QWORD [rdi],0
	jc LB_24036
	btr r12,7
	clc
	jmp LB_24037
LB_24036:
	bts r12,7
	stc
LB_24037:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24035:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_24038
	btr r12,4
	jmp LB_24039
LB_24038:
	bts r12,4
LB_24039:
LB_24040:
	cmp r15,0
	jz LB_24041
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24040
LB_24041:
; _f53 %_24002 ⊢ { %_24003 %_24004 } : { %_24003 %_24004 }
 ; {>  %_24001~6':(_lst)◂(_p23364) %_23995~0':_stg %_23996~1':_r64 %_23997~2':_stg %_23998~3':_r64 %_24002~4':_r64 }
	mov r11,r10
	bts r12,5
; _f35 { %_24004 %_23995 %_23996 %_23997 %_23998 } ⊢ { %_24005 %_24006 %_24007 %_24008 %_24009 } : { %_24005 %_24006 %_24007 %_24008 %_24009 }
 ; {>  %_24004~5':_r64 %_24001~6':(_lst)◂(_p23364) %_23995~0':_stg %_23996~1':_r64 %_24003~4':_r64 %_23997~2':_stg %_23998~3':_r64 }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_24046
	btr r12,4
	jmp LB_24047
LB_24046:
	bts r12,4
LB_24047:
	mov r9,r8
	bt r12,2
	jc LB_24048
	btr r12,3
	jmp LB_24049
LB_24048:
	bts r12,3
LB_24049:
	mov r8,r14
	bt r12,1
	jc LB_24050
	btr r12,2
	jmp LB_24051
LB_24050:
	bts r12,2
LB_24051:
	mov r14,r13
	bt r12,0
	jc LB_24052
	btr r12,1
	jmp LB_24053
LB_24052:
	bts r12,1
LB_24053:
	mov r13,r11
	bt r12,5
	jc LB_24054
	btr r12,0
	jmp LB_24055
LB_24054:
	bts r12,0
LB_24055:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_24056
	btr r12,5
	jmp LB_24057
LB_24056:
	bts r12,5
LB_24057:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_24044
	btr r12,6
	clc
	jmp LB_24045
LB_24044:
	bts r12,6
	stc
LB_24045:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_24042
	btr r12,4
	clc
	jmp LB_24043
LB_24042:
	bts r12,4
	stc
LB_24043:
	add rsp,24
; _f24017 { %_24006 %_24007 %_24008 %_24009 %_24001 } ⊢ { %_24010 %_24011 } : { %_24010 %_24011 }
 ; {>  %_24006~1':_stg %_24001~6':(_lst)◂(_p23364) %_24009~5':_r64 %_24003~4':_r64 %_24007~2':_r64 %_24008~3':_stg %_24005~0':_r64 }
; _f24017 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_24062
	btr r12,0
	jmp LB_24063
LB_24062:
	bts r12,0
LB_24063:
	mov r14,r8
	bt r12,2
	jc LB_24064
	btr r12,1
	jmp LB_24065
LB_24064:
	bts r12,1
LB_24065:
	mov r8,r9
	bt r12,3
	jc LB_24066
	btr r12,2
	jmp LB_24067
LB_24066:
	bts r12,2
LB_24067:
	mov r9,r11
	bt r12,5
	jc LB_24068
	btr r12,3
	jmp LB_24069
LB_24068:
	bts r12,3
LB_24069:
	mov r10,rcx
	bt r12,6
	jc LB_24070
	btr r12,4
	jmp LB_24071
LB_24070:
	bts r12,4
LB_24071:
	call NS_E_24017
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_24072
	btr r12,2
	jmp LB_24073
LB_24072:
	bts r12,2
LB_24073:
	mov r14,r13
	bt r12,0
	jc LB_24074
	btr r12,1
	jmp LB_24075
LB_24074:
	bts r12,1
LB_24075:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_24060
	btr r12,4
	clc
	jmp LB_24061
LB_24060:
	bts r12,4
	stc
LB_24061:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_24058
	btr r12,0
	clc
	jmp LB_24059
LB_24058:
	bts r12,0
	stc
LB_24059:
	add rsp,24
; ∎ { %_24010 %_24011 }
 ; {>  %_24011~2':_stg %_24010~1':_stg %_24003~4':_r64 %_24005~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_24076
	mov rdi,r10
	call dlt
LB_24076:
	bt r12,0
	jc LB_24077
	mov rdi,r13
	call dlt
LB_24077:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_24078
	btr r12,0
	jmp LB_24079
LB_24078:
	bts r12,0
LB_24079:
	mov r14,r8
	bt r12,2
	jc LB_24080
	btr r12,1
	jmp LB_24081
LB_24080:
	bts r12,1
LB_24081:
	ret
MTC_LB_24034:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_24082
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
	jnc LB_24083
	bt QWORD [rdi],0
	jc LB_24084
	btr r12,7
	clc
	jmp LB_24085
LB_24084:
	bts r12,7
	stc
LB_24085:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24083:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_24086
	btr r12,4
	jmp LB_24087
LB_24086:
	bts r12,4
LB_24087:
LB_24088:
	cmp r15,0
	jz LB_24089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24088
LB_24089:
; _f51 { %_23996 %_24012 } ⊢ { %_24013 %_24014 } : { %_24013 %_24014 }
 ; {>  %_24012~4':_r64 %_24001~6':(_lst)◂(_p23364) %_23995~0':_stg %_23996~1':_r64 %_23997~2':_stg %_23998~3':_r64 }
	add r14,r10
; _f24017 { %_23995 %_24013 %_23997 %_23998 %_24001 } ⊢ { %_24015 %_24016 } : { %_24015 %_24016 }
 ; {>  %_24001~6':(_lst)◂(_p23364) %_23995~0':_stg %_24014~4':_r64 %_24013~1':_r64 %_23997~2':_stg %_23998~3':_r64 }
; _f24017 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_24092
	btr r12,4
	jmp LB_24093
LB_24092:
	bts r12,4
LB_24093:
	call NS_E_24017
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_24090
	btr r12,4
	clc
	jmp LB_24091
LB_24090:
	bts r12,4
	stc
LB_24091:
	add rsp,16
; ∎ { %_24015 %_24016 }
 ; {>  %_24014~4':_r64 %_24016~1':_stg %_24015~0':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_24094
	mov rdi,r10
	call dlt
LB_24094:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_24082:
MTC_LB_24019:
	mov r15,0
LB_24096:
	cmp r15,0
	jz LB_24097
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24096
LB_24097:
; ∎ { %_23995 %_23997 }
 ; {>  %_23995~0':_stg %_23996~1':_r64 %_23997~2':_stg %_23999~4':(_lst)◂(_p23364) %_23998~3':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_24098
	mov rdi,r14
	call dlt
LB_24098:
	bt r12,4
	jc LB_24099
	mov rdi,r10
	call dlt
LB_24099:
	bt r12,3
	jc LB_24100
	mov rdi,r9
	call dlt
LB_24100:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_24101
	btr r12,1
	jmp LB_24102
LB_24101:
	bts r12,1
LB_24102:
	ret
MTC_LB_24095:
NS_E_24118:
; 	|» 0'
NS_E_RDI_24118:
; » 0xr0 |~ {  } ⊢ %_24104 : %_24104
 ; {>  %_24103~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_24104
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f23369 { %_24103 %_24104 } ⊢ { %_24105 %_24106 %_24107 } : { %_24105 %_24106 %_24107 }
 ; {>  %_24104~1':_r64 %_24103~0':_stg }
; _f23369 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_23369
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_24119
	btr r12,4
	jmp LB_24120
LB_24119:
	bts r12,4
LB_24120:
	mov r8,r9
	bt r12,3
	jc LB_24123
	btr r12,2
	jmp LB_24124
LB_24123:
	bts r12,2
LB_24124:
	mov rsi,1
	bt r12,2
	jc LB_24121
	mov rsi,0
	bt r8,0
	jc LB_24121
	jmp LB_24122
LB_24121:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_24122:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_24125:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_24126
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
	jnc LB_24127
	bt QWORD [rdi],0
	jc LB_24128
	btr r12,5
	clc
	jmp LB_24129
LB_24128:
	bts r12,5
	stc
LB_24129:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24127:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_24132
	btr r12,6
	clc
	jmp LB_24133
LB_24132:
	bts r12,6
	stc
LB_24133:
	mov r9,rcx
	bt r12,6
	jc LB_24130
	btr r12,3
	jmp LB_24131
LB_24130:
	bts r12,3
LB_24131:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_24136
	btr r12,6
	clc
	jmp LB_24137
LB_24136:
	bts r12,6
	stc
LB_24137:
	mov r10,rcx
	bt r12,6
	jc LB_24134
	btr r12,4
	jmp LB_24135
LB_24134:
	bts r12,4
LB_24135:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_24138:
	cmp r15,0
	jz LB_24139
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24138
LB_24139:
; _f31 %_24108 ⊢ { %_24110 %_24111 } : { %_24110 %_24111 }
 ; {>  %_24108~3':_r64 %_24106~1':_r64 %_24105~0':_stg %_24109~4':(_lst)◂(_p23364) }
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
	jc LB_24146
	btr r12,0
	jmp LB_24147
LB_24146:
	bts r12,0
LB_24147:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_24148
	btr r12,2
	jmp LB_24149
LB_24148:
	bts r12,2
LB_24149:
	mov r9,r14
	bt r12,1
	jc LB_24150
	btr r12,3
	jmp LB_24151
LB_24150:
	bts r12,3
LB_24151:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_24144
	btr r12,4
	clc
	jmp LB_24145
LB_24144:
	bts r12,4
	stc
LB_24145:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_24142
	btr r12,1
	clc
	jmp LB_24143
LB_24142:
	bts r12,1
	stc
LB_24143:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_24140
	btr r12,0
	clc
	jmp LB_24141
LB_24140:
	bts r12,0
	stc
LB_24141:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_24112 : %_24112
 ; {>  %_24106~1':_r64 %_24105~0':_stg %_24109~4':(_lst)◂(_p23364) %_24110~2':_r64 %_24111~3':_stg }
; 	» 0xr0 _ ⊢ 5' : %_24112
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_24113 : %_24113
 ; {>  %_24106~1':_r64 %_24105~0':_stg %_24112~5':_r64 %_24109~4':(_lst)◂(_p23364) %_24110~2':_r64 %_24111~3':_stg }
; 	» 0xr0 _ ⊢ 6' : %_24113
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f24017 { %_24105 %_24112 %_24111 %_24113 %_24109 } ⊢ { %_24114 %_24115 } : { %_24114 %_24115 }
 ; {>  %_24106~1':_r64 %_24105~0':_stg %_24112~5':_r64 %_24113~6':_r64 %_24109~4':(_lst)◂(_p23364) %_24110~2':_r64 %_24111~3':_stg }
; _f24017 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_24156
	btr r12,1
	jmp LB_24157
LB_24156:
	bts r12,1
LB_24157:
	mov r8,r9
	bt r12,3
	jc LB_24158
	btr r12,2
	jmp LB_24159
LB_24158:
	bts r12,2
LB_24159:
	mov r9,rcx
	bt r12,6
	jc LB_24160
	btr r12,3
	jmp LB_24161
LB_24160:
	bts r12,3
LB_24161:
	call NS_E_24017
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_24162
	btr r12,3
	jmp LB_24163
LB_24162:
	bts r12,3
LB_24163:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_24154
	btr r12,2
	clc
	jmp LB_24155
LB_24154:
	bts r12,2
	stc
LB_24155:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_24152
	btr r12,1
	clc
	jmp LB_24153
LB_24152:
	bts r12,1
	stc
LB_24153:
	add rsp,24
; _some %_24115 ⊢ %_24116 : %_24116
 ; {>  %_24114~0':_stg %_24106~1':_r64 %_24115~3':_stg %_24110~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_24114 %_24116 }
 ; {>  %_24114~0':_stg %_24106~1':_r64 %_24116~°0◂3':(_opn)◂(_stg) %_24110~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_24164
	mov rdi,r14
	call dlt
LB_24164:
	bt r12,2
	jc LB_24165
	mov rdi,r8
	call dlt
LB_24165:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_24168
	btr r12,1
	jmp LB_24169
LB_24168:
	bts r12,1
LB_24169:
	mov rsi,1
	bt r12,1
	jc LB_24166
	mov rsi,0
	bt r14,0
	jc LB_24166
	jmp LB_24167
LB_24166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_24167:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_24126:
	mov r15,0
LB_24171:
	cmp r15,0
	jz LB_24172
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24171
LB_24172:
; _none {  } ⊢ %_24117 : %_24117
 ; {>  %_24106~1':_r64 %_24105~0':_stg %_24107~2':(_opn)◂({ _r64 (_lst)◂(_p23364) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_24105 %_24117 }
 ; {>  %_24106~1':_r64 %_24105~0':_stg %_24117~°1◂{  }:(_opn)◂(t11785'(0)) %_24107~2':(_opn)◂({ _r64 (_lst)◂(_p23364) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_24173
	mov rdi,r14
	call dlt
LB_24173:
	bt r12,2
	jc LB_24174
	mov rdi,r8
	call dlt
LB_24174:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_24175
	mov rsi,0
	bt r14,0
	jc LB_24175
	jmp LB_24176
LB_24175:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_24176:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_24170:
NS_E_24177:
NS_E_RDI_24177:
NS_E_24177_ETR_TBL:
NS_E_24177_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_24206
LB_24205:
	add r14,1
LB_24206:
	cmp r14,r10
	jge LB_24207
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24205
	cmp al,10
	jz LB_24205
	cmp al,32
	jz LB_24205
LB_24207:
	push r10
	call NS_E_21155_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24208
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24198
LB_24208:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_24211
LB_24210:
	add r14,1
LB_24211:
	cmp r14,r10
	jge LB_24212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24210
	cmp al,10
	jz LB_24210
	cmp al,32
	jz LB_24210
LB_24212:
	add r14,1
	cmp r14,r10
	jg LB_24216
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_24216
	jmp LB_24217
LB_24216:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24214
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24214:
	jmp LB_24198
LB_24217:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_24219
LB_24218:
	add r14,1
LB_24219:
	cmp r14,r10
	jge LB_24220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24218
	cmp al,10
	jz LB_24218
	cmp al,32
	jz LB_24218
LB_24220:
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24221
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24222
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24222:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24223
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24223:
	jmp LB_24198
LB_24221:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24203
	btr r12,2
	clc
	jmp LB_24204
LB_24203:
	bts r12,2
	stc
LB_24204:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24201
	btr r12,1
	clc
	jmp LB_24202
LB_24201:
	bts r12,1
	stc
LB_24202:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24199
	btr r12,0
	clc
	jmp LB_24200
LB_24199:
	bts r12,0
	stc
LB_24200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24195
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_24225
	btr r12,3
	jmp LB_24226
LB_24225:
	bts r12,3
LB_24226:
	mov r14,r8
	bt r12,2
	jc LB_24227
	btr r12,1
	jmp LB_24228
LB_24227:
	bts r12,1
LB_24228:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f21202 { %_24178 %_24179 } ⊢ %_24180 : %_24180
 ; {>  %_24178~0':_stg %_24179~1':_p21201 }
; _f21202 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_24180 ⊢ %_24181 : %_24181
 ; {>  %_24180~°0◂{ 0' 1' }:_p21201 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_24181
 ; {>  %_24181~°0◂°0◂{ 0' 1' }:(_opn)◂(_p21201) }
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
	jc LB_24189
	btr r12,2
	jmp LB_24190
LB_24189:
	bts r12,2
LB_24190:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_24187
	btr QWORD [rdi],0
	jmp LB_24188
LB_24187:
	bts QWORD [rdi],0
LB_24188:
	mov r8,r14
	bt r12,1
	jc LB_24193
	btr r12,2
	jmp LB_24194
LB_24193:
	bts r12,2
LB_24194:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_24191
	btr QWORD [rdi],1
	jmp LB_24192
LB_24191:
	bts QWORD [rdi],1
LB_24192:
	mov rsi,1
	bt r12,3
	jc LB_24185
	mov rsi,0
	bt r9,0
	jc LB_24185
	jmp LB_24186
LB_24185:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24186:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24195:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24197
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24196
LB_24197:
	add rsp,8
	ret
LB_24198:
	add rsp,48
	pop r14
LB_24196:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_24240
LB_24239:
	add r14,1
LB_24240:
	cmp r14,r10
	jge LB_24241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24239
	cmp al,32
	jz LB_24239
LB_24241:
	push r10
	call NS_E_21155_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24242
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24236
LB_24242:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24237
	btr r12,0
	clc
	jmp LB_24238
LB_24237:
	bts r12,0
	stc
LB_24238:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24233
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21203 %_24182 ⊢ %_24183 : %_24183
 ; {>  %_24182~0':_stg }
; _f21203 0' ⊢ °1◂0'
; _some %_24183 ⊢ %_24184 : %_24184
 ; {>  %_24183~°1◂0':_p21201 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24184
 ; {>  %_24184~°0◂°1◂0':(_opn)◂(_p21201) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24231
	btr r12,3
	jmp LB_24232
LB_24231:
	bts r12,3
LB_24232:
	mov rsi,1
	bt r12,3
	jc LB_24229
	mov rsi,0
	bt r9,0
	jc LB_24229
	jmp LB_24230
LB_24229:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24230:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24233:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24235
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24234
LB_24235:
	add rsp,8
	ret
LB_24236:
	add rsp,16
	pop r14
LB_24234:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24244:
NS_E_RDI_24244:
NS_E_24244_ETR_TBL:
NS_E_24244_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_20376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24269
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24261
LB_24269:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_24277
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_24277
	jmp LB_24278
LB_24277:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24275
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24275:
	jmp LB_24261
LB_24278:
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
	jc LB_24264
	btr r12,1
	clc
	jmp LB_24265
LB_24264:
	bts r12,1
	stc
LB_24265:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24262
	btr r12,0
	clc
	jmp LB_24263
LB_24262:
	bts r12,0
	stc
LB_24263:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_24258
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f21250 %_24245 ⊢ %_24246 : %_24246
 ; {>  %_24245~0':_r64 }
; _f21250 0' ⊢ °0◂0'
; _some %_24246 ⊢ %_24247 : %_24247
 ; {>  %_24246~°0◂0':_p21249 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_24247
 ; {>  %_24247~°0◂°0◂0':(_opn)◂(_p21249) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24256
	btr r12,3
	jmp LB_24257
LB_24256:
	bts r12,3
LB_24257:
	mov rsi,1
	bt r12,3
	jc LB_24254
	mov rsi,0
	bt r9,0
	jc LB_24254
	jmp LB_24255
LB_24254:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24255:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24258:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24260
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24259
LB_24260:
	add rsp,8
	ret
LB_24261:
	add rsp,32
	pop r14
LB_24259:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_20652_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24292
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24286
LB_24292:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24287
	btr r12,0
	clc
	jmp LB_24288
LB_24287:
	bts r12,0
	stc
LB_24288:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24283
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21251 %_24248 ⊢ %_24249 : %_24249
 ; {>  %_24248~0':_stg }
; _f21251 0' ⊢ °1◂0'
; _some %_24249 ⊢ %_24250 : %_24250
 ; {>  %_24249~°1◂0':_p21249 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24250
 ; {>  %_24250~°0◂°1◂0':(_opn)◂(_p21249) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24281
	btr r12,3
	jmp LB_24282
LB_24281:
	bts r12,3
LB_24282:
	mov rsi,1
	bt r12,3
	jc LB_24279
	mov rsi,0
	bt r9,0
	jc LB_24279
	jmp LB_24280
LB_24279:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24280:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24283:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24285
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24284
LB_24285:
	add rsp,8
	ret
LB_24286:
	add rsp,16
	pop r14
LB_24284:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24307
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24301
LB_24307:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24302
	btr r12,0
	clc
	jmp LB_24303
LB_24302:
	bts r12,0
	stc
LB_24303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24298
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21252 %_24251 ⊢ %_24252 : %_24252
 ; {>  %_24251~0':_p21201 }
; _f21252 0' ⊢ °2◂0'
; _some %_24252 ⊢ %_24253 : %_24253
 ; {>  %_24252~°2◂0':_p21249 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_24253
 ; {>  %_24253~°0◂°2◂0':(_opn)◂(_p21249) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24296
	btr r12,3
	jmp LB_24297
LB_24296:
	bts r12,3
LB_24297:
	mov rsi,1
	bt r12,3
	jc LB_24294
	mov rsi,0
	bt r9,0
	jc LB_24294
	jmp LB_24295
LB_24294:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24295:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24298:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24300
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24299
LB_24300:
	add rsp,8
	ret
LB_24301:
	add rsp,16
	pop r14
LB_24299:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24310:
NS_E_RDI_24310:
NS_E_24310_ETR_TBL:
NS_E_24310_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_24317
LB_24316:
	add r14,1
LB_24317:
	cmp r14,r10
	jge LB_24318
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24316
	cmp al,32
	jz LB_24316
LB_24318:
	add r14,1
	cmp r14,r10
	jg LB_24321
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_24321
	jmp LB_24322
LB_24321:
	jmp LB_24312
LB_24322:
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
LB_24327:
	jmp LB_24324
LB_24323:
	add r14,1
LB_24324:
	cmp r14,r10
	jge LB_24325
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24323
	cmp al,32
	jz LB_24323
LB_24325:
	add r14,1
	cmp r14,r10
	jg LB_24326
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_24326
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
	jmp LB_24327
LB_24326:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24313
	btr QWORD [rdi],1
LB_24313:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24314
	btr QWORD [rdi],0
LB_24314:
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
LB_24312:
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
NS_E_24337:
; 	|» { 0' 1' }
NS_E_RDI_24337:
MTC_LB_24338:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_24339
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
	jnc LB_24340
	bt QWORD [rdi],0
	jc LB_24341
	btr r12,4
	clc
	jmp LB_24342
LB_24341:
	bts r12,4
	stc
LB_24342:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24340:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_24345
	btr r12,5
	clc
	jmp LB_24346
LB_24345:
	bts r12,5
	stc
LB_24346:
	mov r8,r11
	bt r12,5
	jc LB_24343
	btr r12,2
	jmp LB_24344
LB_24343:
	bts r12,2
LB_24344:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_24349
	btr r12,5
	clc
	jmp LB_24350
LB_24349:
	bts r12,5
	stc
LB_24350:
	mov r9,r11
	bt r12,5
	jc LB_24347
	btr r12,3
	jmp LB_24348
LB_24347:
	bts r12,3
LB_24348:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_24351:
	cmp r15,0
	jz LB_24352
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24351
LB_24352:
; _f21337 { %_24331 %_24333 } ⊢ %_24335 : %_24335
 ; {>  %_24334~3':(_lst)◂(_p21303) %_24331~0':_p21303 %_24333~2':_p21303 }
; _f21337 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f24337 { %_24335 %_24334 } ⊢ %_24336 : %_24336
 ; {>  %_24334~3':(_lst)◂(_p21303) %_24335~°2◂{ 0' 2' }:_p21303 }
; _f24337 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_24353
	btr r12,1
	jmp LB_24354
LB_24353:
	bts r12,1
LB_24354:
	mov r9,r13
	bt r12,0
	jc LB_24355
	btr r12,3
	jmp LB_24356
LB_24355:
	bts r12,3
LB_24356:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_24361
	btr r12,4
	jmp LB_24362
LB_24361:
	bts r12,4
LB_24362:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_24359
	btr QWORD [rdi],0
	jmp LB_24360
LB_24359:
	bts QWORD [rdi],0
LB_24360:
	mov r10,r8
	bt r12,2
	jc LB_24365
	btr r12,4
	jmp LB_24366
LB_24365:
	bts r12,4
LB_24366:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_24363
	btr QWORD [rdi],1
	jmp LB_24364
LB_24363:
	bts QWORD [rdi],1
LB_24364:
	mov rsi,1
	bt r12,0
	jc LB_24357
	mov rsi,0
	bt r13,0
	jc LB_24357
	jmp LB_24358
LB_24357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_24358:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_24337
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_24336
 ; {>  %_24336~0':_p21303 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_24339:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_24367
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
	jnc LB_24368
	bt QWORD [rdi],0
	jc LB_24369
	btr r12,2
	clc
	jmp LB_24370
LB_24369:
	bts r12,2
	stc
LB_24370:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24368:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_24371:
	cmp r15,0
	jz LB_24372
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24371
LB_24372:
; ∎ %_24331
 ; {>  %_24331~0':_p21303 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_24367:
NS_E_24373:
NS_E_RDI_24373:
NS_E_24373_ETR_TBL:
NS_E_24373_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_24419
LB_24418:
	add r14,1
LB_24419:
	cmp r14,r10
	jge LB_24420
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24418
	cmp al,10
	jz LB_24418
	cmp al,32
	jz LB_24418
LB_24420:
	add r14,1
	cmp r14,r10
	jg LB_24423
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_24423
	jmp LB_24424
LB_24423:
	jmp LB_24411
LB_24424:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_24426
LB_24425:
	add r14,1
LB_24426:
	cmp r14,r10
	jge LB_24427
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24425
	cmp al,10
	jz LB_24425
	cmp al,32
	jz LB_24425
LB_24427:
	push r10
	call NS_E_24374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24428
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24429
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24429:
	jmp LB_24411
LB_24428:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_24432
LB_24431:
	add r14,1
LB_24432:
	cmp r14,r10
	jge LB_24433
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24431
	cmp al,10
	jz LB_24431
	cmp al,32
	jz LB_24431
LB_24433:
	add r14,1
	cmp r14,r10
	jg LB_24438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_24438
	jmp LB_24439
LB_24438:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24435
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24435:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24436
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24436:
	jmp LB_24411
LB_24439:
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
	jc LB_24416
	btr r12,2
	clc
	jmp LB_24417
LB_24416:
	bts r12,2
	stc
LB_24417:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24414
	btr r12,1
	clc
	jmp LB_24415
LB_24414:
	bts r12,1
	stc
LB_24415:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24412
	btr r12,0
	clc
	jmp LB_24413
LB_24412:
	bts r12,0
	stc
LB_24413:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24408
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_24440
	btr r12,3
	jmp LB_24441
LB_24440:
	bts r12,3
LB_24441:
	mov r13,r14
	bt r12,1
	jc LB_24442
	btr r12,0
	jmp LB_24443
LB_24442:
	bts r12,0
LB_24443:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21247 %_24377 ⊢ %_24378 : %_24378
 ; {>  %_24377~0':(_lst)◂((_p21246)◂((_p21253)◂(_stg))) }
; _f21247 0' ⊢ °0◂0'
; _some %_24378 ⊢ %_24379 : %_24379
 ; {>  %_24378~°0◂0':(_p21246)◂((_p21253)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_24379
 ; {>  %_24379~°0◂°0◂0':(_opn)◂((_p21246)◂((_p21253)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24406
	btr r12,3
	jmp LB_24407
LB_24406:
	bts r12,3
LB_24407:
	mov rsi,1
	bt r12,3
	jc LB_24404
	mov rsi,0
	bt r9,0
	jc LB_24404
	jmp LB_24405
LB_24404:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24405:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24408:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24410
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24409
LB_24410:
	add rsp,8
	ret
LB_24411:
	add rsp,48
	pop r14
LB_24409:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_24455
LB_24454:
	add r14,1
LB_24455:
	cmp r14,r10
	jge LB_24456
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24454
	cmp al,10
	jz LB_24454
	cmp al,32
	jz LB_24454
LB_24456:
	push r10
	call NS_E_24376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24457
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24451
LB_24457:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24452
	btr r12,0
	clc
	jmp LB_24453
LB_24452:
	bts r12,0
	stc
LB_24453:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24448
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21248 %_24380 ⊢ %_24381 : %_24381
 ; {>  %_24380~0':(_p21253)◂(_stg) }
; _f21248 0' ⊢ °1◂0'
; _some %_24381 ⊢ %_24382 : %_24382
 ; {>  %_24381~°1◂0':(_p21246)◂((_p21253)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24382
 ; {>  %_24382~°0◂°1◂0':(_opn)◂((_p21246)◂((_p21253)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24446
	btr r12,3
	jmp LB_24447
LB_24446:
	bts r12,3
LB_24447:
	mov rsi,1
	bt r12,3
	jc LB_24444
	mov rsi,0
	bt r9,0
	jc LB_24444
	jmp LB_24445
LB_24444:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24445:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24448:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24450
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24449
LB_24450:
	add rsp,8
	ret
LB_24451:
	add rsp,16
	pop r14
LB_24449:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24374:
NS_E_RDI_24374:
NS_E_24374_ETR_TBL:
NS_E_24374_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_24478
LB_24477:
	add r14,1
LB_24478:
	cmp r14,r10
	jge LB_24479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24477
	cmp al,10
	jz LB_24477
	cmp al,32
	jz LB_24477
LB_24479:
	push r10
	call NS_E_24373_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24480
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24472
LB_24480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_24483
LB_24482:
	add r14,1
LB_24483:
	cmp r14,r10
	jge LB_24484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24482
	cmp al,10
	jz LB_24482
	cmp al,32
	jz LB_24482
LB_24484:
	push r10
	call NS_E_24374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24485
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24486
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24486:
	jmp LB_24472
LB_24485:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24475
	btr r12,1
	clc
	jmp LB_24476
LB_24475:
	bts r12,1
	stc
LB_24476:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24473
	btr r12,0
	clc
	jmp LB_24474
LB_24473:
	bts r12,0
	stc
LB_24474:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_24469
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_24383 %_24384 } ⊢ %_24385 : %_24385
 ; {>  %_24383~0':(_p21246)◂((_p21253)◂(_stg)) %_24384~1':(_lst)◂((_p21246)◂((_p21253)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_24385 ⊢ %_24386 : %_24386
 ; {>  %_24385~°0◂{ 0' 1' }:(_lst)◂((_p21246)◂((_p21253)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_24386
 ; {>  %_24386~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p21246)◂((_p21253)◂(_stg)))) }
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
	jc LB_24463
	btr r12,2
	jmp LB_24464
LB_24463:
	bts r12,2
LB_24464:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_24461
	btr QWORD [rdi],0
	jmp LB_24462
LB_24461:
	bts QWORD [rdi],0
LB_24462:
	mov r8,r14
	bt r12,1
	jc LB_24467
	btr r12,2
	jmp LB_24468
LB_24467:
	bts r12,2
LB_24468:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_24465
	btr QWORD [rdi],1
	jmp LB_24466
LB_24465:
	bts QWORD [rdi],1
LB_24466:
	mov rsi,1
	bt r12,3
	jc LB_24459
	mov rsi,0
	bt r9,0
	jc LB_24459
	jmp LB_24460
LB_24459:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24460:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24469:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24471
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24470
LB_24471:
	add rsp,8
	ret
LB_24472:
	add rsp,32
	pop r14
LB_24470:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_24490
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_24387 : %_24387
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_24387 ⊢ %_24388 : %_24388
 ; {>  %_24387~°1◂{  }:(_lst)◂(t11888'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_24388
 ; {>  %_24388~°0◂°1◂{  }:(_opn)◂((_lst)◂(t11891'(0))) }
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
	jc LB_24488
	mov rsi,0
	bt r9,0
	jc LB_24488
	jmp LB_24489
LB_24488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24489:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24490:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24492
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24491
LB_24492:
	add rsp,8
	ret
LB_24493:
	add rsp,0
	pop r14
LB_24491:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24375:
NS_E_RDI_24375:
NS_E_24375_ETR_TBL:
NS_E_24375_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_24529
LB_24528:
	add r14,1
LB_24529:
	cmp r14,r10
	jge LB_24530
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24528
	cmp al,10
	jz LB_24528
	cmp al,32
	jz LB_24528
LB_24530:
	add r14,1
	cmp r14,r10
	jg LB_24533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_24533
	jmp LB_24534
LB_24533:
	jmp LB_24507
LB_24534:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_24516
LB_24515:
	add r14,1
LB_24516:
	cmp r14,r10
	jge LB_24517
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24515
	cmp al,10
	jz LB_24515
	cmp al,32
	jz LB_24515
LB_24517:
	push r10
	call NS_E_24376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24518
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24519
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24519:
	jmp LB_24508
LB_24518:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_24522
LB_24521:
	add r14,1
LB_24522:
	cmp r14,r10
	jge LB_24523
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24521
	cmp al,10
	jz LB_24521
	cmp al,32
	jz LB_24521
LB_24523:
	push r10
	call NS_E_24375_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24524
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24525
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24525:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24526
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24526:
	jmp LB_24508
LB_24524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24513
	btr r12,2
	clc
	jmp LB_24514
LB_24513:
	bts r12,2
	stc
LB_24514:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24511
	btr r12,1
	clc
	jmp LB_24512
LB_24511:
	bts r12,1
	stc
LB_24512:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24509
	btr r12,0
	clc
	jmp LB_24510
LB_24509:
	bts r12,0
	stc
LB_24510:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24504
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_24535
	btr r12,3
	jmp LB_24536
LB_24535:
	bts r12,3
LB_24536:
	mov r14,r8
	bt r12,2
	jc LB_24537
	btr r12,1
	jmp LB_24538
LB_24537:
	bts r12,1
LB_24538:
	mov r8,r13
	bt r12,0
	jc LB_24539
	btr r12,2
	jmp LB_24540
LB_24539:
	bts r12,2
LB_24540:
	mov r13,r9
	bt r12,3
	jc LB_24541
	btr r12,0
	jmp LB_24542
LB_24541:
	bts r12,0
LB_24542:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_24389 %_24390 } ⊢ %_24391 : %_24391
 ; {>  %_24389~0':(_p21253)◂(_stg) %_24390~1':(_lst)◂((_p21253)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_24391 ⊢ %_24392 : %_24392
 ; {>  %_24391~°0◂{ 0' 1' }:(_lst)◂((_p21253)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_24392
 ; {>  %_24392~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p21253)◂(_stg))) }
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
	jc LB_24498
	btr r12,2
	jmp LB_24499
LB_24498:
	bts r12,2
LB_24499:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_24496
	btr QWORD [rdi],0
	jmp LB_24497
LB_24496:
	bts QWORD [rdi],0
LB_24497:
	mov r8,r14
	bt r12,1
	jc LB_24502
	btr r12,2
	jmp LB_24503
LB_24502:
	bts r12,2
LB_24503:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_24500
	btr QWORD [rdi],1
	jmp LB_24501
LB_24500:
	bts QWORD [rdi],1
LB_24501:
	mov rsi,1
	bt r12,3
	jc LB_24494
	mov rsi,0
	bt r9,0
	jc LB_24494
	jmp LB_24495
LB_24494:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24495:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24504:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24506
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24505
LB_24506:
	add rsp,8
	ret
LB_24508:
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
LB_24507:
	add rsp,48
	pop r14
LB_24505:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_24545
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_24393 : %_24393
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_24393 ⊢ %_24394 : %_24394
 ; {>  %_24393~°1◂{  }:(_lst)◂(t11901'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_24394
 ; {>  %_24394~°0◂°1◂{  }:(_opn)◂((_lst)◂(t11904'(0))) }
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
	jc LB_24543
	mov rsi,0
	bt r9,0
	jc LB_24543
	jmp LB_24544
LB_24543:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24544:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24545:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24547
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24546
LB_24547:
	add rsp,8
	ret
LB_24548:
	add rsp,0
	pop r14
LB_24546:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24376:
NS_E_RDI_24376:
NS_E_24376_ETR_TBL:
NS_E_24376_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_24564
LB_24563:
	add r14,1
LB_24564:
	cmp r14,r10
	jge LB_24565
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24563
	cmp al,10
	jz LB_24563
	cmp al,32
	jz LB_24563
LB_24565:
	add r14,2
	cmp r14,r10
	jg LB_24568
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_24568
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_24568
	jmp LB_24569
LB_24568:
	jmp LB_24556
LB_24569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_24571
LB_24570:
	add r14,1
LB_24571:
	cmp r14,r10
	jge LB_24572
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24570
	cmp al,10
	jz LB_24570
	cmp al,32
	jz LB_24570
LB_24572:
	push r10
	call NS_E_24244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24573
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24574
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24574:
	jmp LB_24556
LB_24573:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_24577
LB_24576:
	add r14,1
LB_24577:
	cmp r14,r10
	jge LB_24578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24576
	cmp al,10
	jz LB_24576
	cmp al,32
	jz LB_24576
LB_24578:
	add r14,1
	cmp r14,r10
	jg LB_24583
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_24583
	jmp LB_24584
LB_24583:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24580
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24580:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24581
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24581:
	jmp LB_24556
LB_24584:
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
	jc LB_24561
	btr r12,2
	clc
	jmp LB_24562
LB_24561:
	bts r12,2
	stc
LB_24562:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24559
	btr r12,1
	clc
	jmp LB_24560
LB_24559:
	bts r12,1
	stc
LB_24560:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24557
	btr r12,0
	clc
	jmp LB_24558
LB_24557:
	bts r12,0
	stc
LB_24558:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24553
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_24585
	btr r12,3
	jmp LB_24586
LB_24585:
	bts r12,3
LB_24586:
	mov r13,r14
	bt r12,1
	jc LB_24587
	btr r12,0
	jmp LB_24588
LB_24587:
	bts r12,0
LB_24588:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21255 %_24395 ⊢ %_24396 : %_24396
 ; {>  %_24395~0':_p21249 }
; _f21255 0' ⊢ °0◂0'
; _some %_24396 ⊢ %_24397 : %_24397
 ; {>  %_24396~°0◂0':(_p21253)◂(t11909'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_24397
 ; {>  %_24397~°0◂°0◂0':(_opn)◂((_p21253)◂(t11912'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24551
	btr r12,3
	jmp LB_24552
LB_24551:
	bts r12,3
LB_24552:
	mov rsi,1
	bt r12,3
	jc LB_24549
	mov rsi,0
	bt r9,0
	jc LB_24549
	jmp LB_24550
LB_24549:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24550:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24553:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24555
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24554
LB_24555:
	add rsp,8
	ret
LB_24556:
	add rsp,48
	pop r14
LB_24554:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_24613
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_24613
	jmp LB_24614
LB_24613:
	jmp LB_24596
LB_24614:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_21155_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24605
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24606
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24606:
	jmp LB_24597
LB_24605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24600
	btr r12,1
	clc
	jmp LB_24601
LB_24600:
	bts r12,1
	stc
LB_24601:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24598
	btr r12,0
	clc
	jmp LB_24599
LB_24598:
	bts r12,0
	stc
LB_24599:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_24593
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_24615
	btr r12,2
	jmp LB_24616
LB_24615:
	bts r12,2
LB_24616:
	mov r13,r14
	bt r12,1
	jc LB_24617
	btr r12,0
	jmp LB_24618
LB_24617:
	bts r12,0
LB_24618:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21256 %_24398 ⊢ %_24399 : %_24399
 ; {>  %_24398~0':_stg }
; _f21256 0' ⊢ °1◂0'
; _some %_24399 ⊢ %_24400 : %_24400
 ; {>  %_24399~°1◂0':(_p21253)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24400
 ; {>  %_24400~°0◂°1◂0':(_opn)◂((_p21253)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24591
	btr r12,3
	jmp LB_24592
LB_24591:
	bts r12,3
LB_24592:
	mov rsi,1
	bt r12,3
	jc LB_24589
	mov rsi,0
	bt r9,0
	jc LB_24589
	jmp LB_24590
LB_24589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24590:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24593:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24595
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24594
LB_24595:
	add rsp,8
	ret
LB_24597:
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
LB_24596:
	add rsp,32
	pop r14
LB_24594:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_24630
LB_24629:
	add r14,1
LB_24630:
	cmp r14,r10
	jge LB_24631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24629
	cmp al,10
	jz LB_24629
	cmp al,32
	jz LB_24629
LB_24631:
	push r10
	call NS_E_21155_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24632
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24626
LB_24632:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24627
	btr r12,0
	clc
	jmp LB_24628
LB_24627:
	bts r12,0
	stc
LB_24628:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24623
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21256 %_24401 ⊢ %_24402 : %_24402
 ; {>  %_24401~0':_stg }
; _f21256 0' ⊢ °1◂0'
; _some %_24402 ⊢ %_24403 : %_24403
 ; {>  %_24402~°1◂0':(_p21253)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24403
 ; {>  %_24403~°0◂°1◂0':(_opn)◂((_p21253)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24621
	btr r12,3
	jmp LB_24622
LB_24621:
	bts r12,3
LB_24622:
	mov rsi,1
	bt r12,3
	jc LB_24619
	mov rsi,0
	bt r9,0
	jc LB_24619
	jmp LB_24620
LB_24619:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24620:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24623:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24625
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24624
LB_24625:
	add rsp,8
	ret
LB_24626:
	add rsp,16
	pop r14
LB_24624:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24634:
NS_E_RDI_24634:
NS_E_24634_ETR_TBL:
NS_E_24634_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_24686
LB_24685:
	add r14,1
LB_24686:
	cmp r14,r10
	jge LB_24687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24685
	cmp al,10
	jz LB_24685
	cmp al,32
	jz LB_24685
LB_24687:
	add r14,1
	cmp r14,r10
	jg LB_24690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_24690
	jmp LB_24691
LB_24690:
	jmp LB_24678
LB_24691:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_24693
LB_24692:
	add r14,1
LB_24693:
	cmp r14,r10
	jge LB_24694
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24692
	cmp al,10
	jz LB_24692
	cmp al,32
	jz LB_24692
LB_24694:
	push r10
	call NS_E_24635_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24695
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24696
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24696:
	jmp LB_24678
LB_24695:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_24699
LB_24698:
	add r14,1
LB_24699:
	cmp r14,r10
	jge LB_24700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24698
	cmp al,10
	jz LB_24698
	cmp al,32
	jz LB_24698
LB_24700:
	add r14,1
	cmp r14,r10
	jg LB_24705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_24705
	jmp LB_24706
LB_24705:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24702
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24702:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24703
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24703:
	jmp LB_24678
LB_24706:
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
	jc LB_24683
	btr r12,2
	clc
	jmp LB_24684
LB_24683:
	bts r12,2
	stc
LB_24684:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24681
	btr r12,1
	clc
	jmp LB_24682
LB_24681:
	bts r12,1
	stc
LB_24682:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24679
	btr r12,0
	clc
	jmp LB_24680
LB_24679:
	bts r12,0
	stc
LB_24680:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24675
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_24707
	btr r12,3
	jmp LB_24708
LB_24707:
	bts r12,3
LB_24708:
	mov r13,r14
	bt r12,1
	jc LB_24709
	btr r12,0
	jmp LB_24710
LB_24709:
	bts r12,0
LB_24710:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21247 %_24639 ⊢ %_24640 : %_24640
 ; {>  %_24639~0':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) }
; _f21247 0' ⊢ °0◂0'
; _some %_24640 ⊢ %_24641 : %_24641
 ; {>  %_24640~°0◂0':(_p21246)◂((_p21254)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_24641
 ; {>  %_24641~°0◂°0◂0':(_opn)◂((_p21246)◂((_p21254)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24673
	btr r12,3
	jmp LB_24674
LB_24673:
	bts r12,3
LB_24674:
	mov rsi,1
	bt r12,3
	jc LB_24671
	mov rsi,0
	bt r9,0
	jc LB_24671
	jmp LB_24672
LB_24671:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24672:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24675:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24677
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24676
LB_24677:
	add rsp,8
	ret
LB_24678:
	add rsp,48
	pop r14
LB_24676:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_24722
LB_24721:
	add r14,1
LB_24722:
	cmp r14,r10
	jge LB_24723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24721
	cmp al,10
	jz LB_24721
	cmp al,32
	jz LB_24721
LB_24723:
	push r10
	call NS_E_24638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24724
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24718
LB_24724:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24719
	btr r12,0
	clc
	jmp LB_24720
LB_24719:
	bts r12,0
	stc
LB_24720:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24715
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21248 %_24642 ⊢ %_24643 : %_24643
 ; {>  %_24642~0':(_p21254)◂(_stg) }
; _f21248 0' ⊢ °1◂0'
; _some %_24643 ⊢ %_24644 : %_24644
 ; {>  %_24643~°1◂0':(_p21246)◂((_p21254)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24644
 ; {>  %_24644~°0◂°1◂0':(_opn)◂((_p21246)◂((_p21254)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24713
	btr r12,3
	jmp LB_24714
LB_24713:
	bts r12,3
LB_24714:
	mov rsi,1
	bt r12,3
	jc LB_24711
	mov rsi,0
	bt r9,0
	jc LB_24711
	jmp LB_24712
LB_24711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24712:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24715:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24717
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24716
LB_24717:
	add rsp,8
	ret
LB_24718:
	add rsp,16
	pop r14
LB_24716:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24635:
NS_E_RDI_24635:
NS_E_24635_ETR_TBL:
NS_E_24635_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_24745
LB_24744:
	add r14,1
LB_24745:
	cmp r14,r10
	jge LB_24746
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24744
	cmp al,10
	jz LB_24744
	cmp al,32
	jz LB_24744
LB_24746:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24747
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24739
LB_24747:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_24750
LB_24749:
	add r14,1
LB_24750:
	cmp r14,r10
	jge LB_24751
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24749
	cmp al,10
	jz LB_24749
	cmp al,32
	jz LB_24749
LB_24751:
	push r10
	call NS_E_24635_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24752
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24753
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24753:
	jmp LB_24739
LB_24752:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24742
	btr r12,1
	clc
	jmp LB_24743
LB_24742:
	bts r12,1
	stc
LB_24743:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24740
	btr r12,0
	clc
	jmp LB_24741
LB_24740:
	bts r12,0
	stc
LB_24741:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_24736
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_24645 %_24646 } ⊢ %_24647 : %_24647
 ; {>  %_24646~1':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) %_24645~0':(_p21246)◂((_p21254)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_24647 ⊢ %_24648 : %_24648
 ; {>  %_24647~°0◂{ 0' 1' }:(_lst)◂((_p21246)◂((_p21254)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_24648
 ; {>  %_24648~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p21246)◂((_p21254)◂(_stg)))) }
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
	jc LB_24730
	btr r12,2
	jmp LB_24731
LB_24730:
	bts r12,2
LB_24731:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_24728
	btr QWORD [rdi],0
	jmp LB_24729
LB_24728:
	bts QWORD [rdi],0
LB_24729:
	mov r8,r14
	bt r12,1
	jc LB_24734
	btr r12,2
	jmp LB_24735
LB_24734:
	bts r12,2
LB_24735:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_24732
	btr QWORD [rdi],1
	jmp LB_24733
LB_24732:
	bts QWORD [rdi],1
LB_24733:
	mov rsi,1
	bt r12,3
	jc LB_24726
	mov rsi,0
	bt r9,0
	jc LB_24726
	jmp LB_24727
LB_24726:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24727:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24736:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24738
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24737
LB_24738:
	add rsp,8
	ret
LB_24739:
	add rsp,32
	pop r14
LB_24737:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_24757
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_24649 : %_24649
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_24649 ⊢ %_24650 : %_24650
 ; {>  %_24649~°1◂{  }:(_lst)◂(t12001'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_24650
 ; {>  %_24650~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12004'(0))) }
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
	jc LB_24755
	mov rsi,0
	bt r9,0
	jc LB_24755
	jmp LB_24756
LB_24755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24756:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24757:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24759
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24758
LB_24759:
	add rsp,8
	ret
LB_24760:
	add rsp,0
	pop r14
LB_24758:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24636:
NS_E_RDI_24636:
NS_E_24636_ETR_TBL:
NS_E_24636_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_24796
LB_24795:
	add r14,1
LB_24796:
	cmp r14,r10
	jge LB_24797
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24795
	cmp al,10
	jz LB_24795
	cmp al,32
	jz LB_24795
LB_24797:
	add r14,1
	cmp r14,r10
	jg LB_24800
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_24800
	jmp LB_24801
LB_24800:
	jmp LB_24774
LB_24801:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_24783
LB_24782:
	add r14,1
LB_24783:
	cmp r14,r10
	jge LB_24784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24782
	cmp al,10
	jz LB_24782
	cmp al,32
	jz LB_24782
LB_24784:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24785
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24786
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24786:
	jmp LB_24775
LB_24785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_24789
LB_24788:
	add r14,1
LB_24789:
	cmp r14,r10
	jge LB_24790
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24788
	cmp al,10
	jz LB_24788
	cmp al,32
	jz LB_24788
LB_24790:
	push r10
	call NS_E_24636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24791
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24792
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24792:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24793
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24793:
	jmp LB_24775
LB_24791:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24780
	btr r12,2
	clc
	jmp LB_24781
LB_24780:
	bts r12,2
	stc
LB_24781:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24778
	btr r12,1
	clc
	jmp LB_24779
LB_24778:
	bts r12,1
	stc
LB_24779:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24776
	btr r12,0
	clc
	jmp LB_24777
LB_24776:
	bts r12,0
	stc
LB_24777:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24771
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_24802
	btr r12,3
	jmp LB_24803
LB_24802:
	bts r12,3
LB_24803:
	mov r14,r8
	bt r12,2
	jc LB_24804
	btr r12,1
	jmp LB_24805
LB_24804:
	bts r12,1
LB_24805:
	mov r8,r13
	bt r12,0
	jc LB_24806
	btr r12,2
	jmp LB_24807
LB_24806:
	bts r12,2
LB_24807:
	mov r13,r9
	bt r12,3
	jc LB_24808
	btr r12,0
	jmp LB_24809
LB_24808:
	bts r12,0
LB_24809:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_24651 %_24652 } ⊢ %_24653 : %_24653
 ; {>  %_24651~0':(_p21246)◂((_p21254)◂(_stg)) %_24652~1':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_24653 ⊢ %_24654 : %_24654
 ; {>  %_24653~°0◂{ 0' 1' }:(_lst)◂((_p21246)◂((_p21254)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_24654
 ; {>  %_24654~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p21246)◂((_p21254)◂(_stg)))) }
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
	jc LB_24765
	btr r12,2
	jmp LB_24766
LB_24765:
	bts r12,2
LB_24766:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_24763
	btr QWORD [rdi],0
	jmp LB_24764
LB_24763:
	bts QWORD [rdi],0
LB_24764:
	mov r8,r14
	bt r12,1
	jc LB_24769
	btr r12,2
	jmp LB_24770
LB_24769:
	bts r12,2
LB_24770:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_24767
	btr QWORD [rdi],1
	jmp LB_24768
LB_24767:
	bts QWORD [rdi],1
LB_24768:
	mov rsi,1
	bt r12,3
	jc LB_24761
	mov rsi,0
	bt r9,0
	jc LB_24761
	jmp LB_24762
LB_24761:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24762:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24771:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24773
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24772
LB_24773:
	add rsp,8
	ret
LB_24775:
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
LB_24774:
	add rsp,48
	pop r14
LB_24772:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_24812
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_24655 : %_24655
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_24655 ⊢ %_24656 : %_24656
 ; {>  %_24655~°1◂{  }:(_lst)◂(t12014'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_24656
 ; {>  %_24656~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12017'(0))) }
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
	jc LB_24810
	mov rsi,0
	bt r9,0
	jc LB_24810
	jmp LB_24811
LB_24810:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24811:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24812:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24814
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24813
LB_24814:
	add rsp,8
	ret
LB_24815:
	add rsp,0
	pop r14
LB_24813:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24637:
NS_E_RDI_24637:
NS_E_24637_ETR_TBL:
NS_E_24637_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_24851
LB_24850:
	add r14,1
LB_24851:
	cmp r14,r10
	jge LB_24852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24850
	cmp al,10
	jz LB_24850
	cmp al,32
	jz LB_24850
LB_24852:
	add r14,1
	cmp r14,r10
	jg LB_24855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_24855
	jmp LB_24856
LB_24855:
	jmp LB_24829
LB_24856:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_24838
LB_24837:
	add r14,1
LB_24838:
	cmp r14,r10
	jge LB_24839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24837
	cmp al,10
	jz LB_24837
	cmp al,32
	jz LB_24837
LB_24839:
	push r10
	call NS_E_24638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24840
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24841
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24841:
	jmp LB_24830
LB_24840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_24844
LB_24843:
	add r14,1
LB_24844:
	cmp r14,r10
	jge LB_24845
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24843
	cmp al,10
	jz LB_24843
	cmp al,32
	jz LB_24843
LB_24845:
	push r10
	call NS_E_24637_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24846
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24847
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24847:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24848:
	jmp LB_24830
LB_24846:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24835
	btr r12,2
	clc
	jmp LB_24836
LB_24835:
	bts r12,2
	stc
LB_24836:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24833
	btr r12,1
	clc
	jmp LB_24834
LB_24833:
	bts r12,1
	stc
LB_24834:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24831
	btr r12,0
	clc
	jmp LB_24832
LB_24831:
	bts r12,0
	stc
LB_24832:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24826
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_24857
	btr r12,3
	jmp LB_24858
LB_24857:
	bts r12,3
LB_24858:
	mov r14,r8
	bt r12,2
	jc LB_24859
	btr r12,1
	jmp LB_24860
LB_24859:
	bts r12,1
LB_24860:
	mov r8,r13
	bt r12,0
	jc LB_24861
	btr r12,2
	jmp LB_24862
LB_24861:
	bts r12,2
LB_24862:
	mov r13,r9
	bt r12,3
	jc LB_24863
	btr r12,0
	jmp LB_24864
LB_24863:
	bts r12,0
LB_24864:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_24657 %_24658 } ⊢ %_24659 : %_24659
 ; {>  %_24658~1':(_lst)◂((_p21254)◂(_stg)) %_24657~0':(_p21254)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_24659 ⊢ %_24660 : %_24660
 ; {>  %_24659~°0◂{ 0' 1' }:(_lst)◂((_p21254)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_24660
 ; {>  %_24660~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p21254)◂(_stg))) }
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
	jc LB_24820
	btr r12,2
	jmp LB_24821
LB_24820:
	bts r12,2
LB_24821:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_24818
	btr QWORD [rdi],0
	jmp LB_24819
LB_24818:
	bts QWORD [rdi],0
LB_24819:
	mov r8,r14
	bt r12,1
	jc LB_24824
	btr r12,2
	jmp LB_24825
LB_24824:
	bts r12,2
LB_24825:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_24822
	btr QWORD [rdi],1
	jmp LB_24823
LB_24822:
	bts QWORD [rdi],1
LB_24823:
	mov rsi,1
	bt r12,3
	jc LB_24816
	mov rsi,0
	bt r9,0
	jc LB_24816
	jmp LB_24817
LB_24816:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24817:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24826:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24828
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24827
LB_24828:
	add rsp,8
	ret
LB_24830:
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
LB_24829:
	add rsp,48
	pop r14
LB_24827:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_24867
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_24661 : %_24661
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_24661 ⊢ %_24662 : %_24662
 ; {>  %_24661~°1◂{  }:(_lst)◂(t12027'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_24662
 ; {>  %_24662~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12030'(0))) }
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
	jc LB_24865
	mov rsi,0
	bt r9,0
	jc LB_24865
	jmp LB_24866
LB_24865:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24866:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24867:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24869
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24868
LB_24869:
	add rsp,8
	ret
LB_24870:
	add rsp,0
	pop r14
LB_24868:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24638:
NS_E_RDI_24638:
NS_E_24638_ETR_TBL:
NS_E_24638_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_24895
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_24895
	jmp LB_24896
LB_24895:
	jmp LB_24878
LB_24896:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24887
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24888
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24888:
	jmp LB_24879
LB_24887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24882
	btr r12,1
	clc
	jmp LB_24883
LB_24882:
	bts r12,1
	stc
LB_24883:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24880
	btr r12,0
	clc
	jmp LB_24881
LB_24880:
	bts r12,0
	stc
LB_24881:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_24875
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_24897
	btr r12,2
	jmp LB_24898
LB_24897:
	bts r12,2
LB_24898:
	mov r13,r14
	bt r12,1
	jc LB_24899
	btr r12,0
	jmp LB_24900
LB_24899:
	bts r12,0
LB_24900:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21258 %_24663 ⊢ %_24664 : %_24664
 ; {>  %_24663~0':_stg }
; _f21258 0' ⊢ °1◂0'
; _some %_24664 ⊢ %_24665 : %_24665
 ; {>  %_24664~°1◂0':(_p21254)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24665
 ; {>  %_24665~°0◂°1◂0':(_opn)◂((_p21254)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24873
	btr r12,3
	jmp LB_24874
LB_24873:
	bts r12,3
LB_24874:
	mov rsi,1
	bt r12,3
	jc LB_24871
	mov rsi,0
	bt r9,0
	jc LB_24871
	jmp LB_24872
LB_24871:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24872:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24875:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24877
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24876
LB_24877:
	add rsp,8
	ret
LB_24879:
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
LB_24878:
	add rsp,32
	pop r14
LB_24876:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24914
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24908
LB_24914:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24909
	btr r12,0
	clc
	jmp LB_24910
LB_24909:
	bts r12,0
	stc
LB_24910:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24905
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21258 %_24666 ⊢ %_24667 : %_24667
 ; {>  %_24666~0':_stg }
; _f21258 0' ⊢ °1◂0'
; _some %_24667 ⊢ %_24668 : %_24668
 ; {>  %_24667~°1◂0':(_p21254)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_24668
 ; {>  %_24668~°0◂°1◂0':(_opn)◂((_p21254)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24903
	btr r12,3
	jmp LB_24904
LB_24903:
	bts r12,3
LB_24904:
	mov rsi,1
	bt r12,3
	jc LB_24901
	mov rsi,0
	bt r9,0
	jc LB_24901
	jmp LB_24902
LB_24901:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24902:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24905:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24907
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24906
LB_24907:
	add rsp,8
	ret
LB_24908:
	add rsp,16
	pop r14
LB_24906:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_24929
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_24929
	jmp LB_24930
LB_24929:
	jmp LB_24921
LB_24930:
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
	jc LB_24922
	btr r12,0
	clc
	jmp LB_24923
LB_24922:
	bts r12,0
	stc
LB_24923:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_24918
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f21257 {  } ⊢ %_24669 : %_24669
 ; {>  }
; _f21257 {  } ⊢ °0◂{  }
; _some %_24669 ⊢ %_24670 : %_24670
 ; {>  %_24669~°0◂{  }:(_p21254)◂(t12044'(0)) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_24670
 ; {>  %_24670~°0◂°0◂{  }:(_opn)◂((_p21254)◂(t12047'(0))) }
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
	jc LB_24916
	mov rsi,0
	bt r9,0
	jc LB_24916
	jmp LB_24917
LB_24916:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24917:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_24918:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_24920
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24919
LB_24920:
	add rsp,8
	ret
LB_24921:
	add rsp,16
	pop r14
LB_24919:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24931:
NS_E_RDI_24931:
NS_E_24931_ETR_TBL:
NS_E_24931_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_25009
LB_25008:
	add r14,1
LB_25009:
	cmp r14,r10
	jge LB_25010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25008
	cmp al,10
	jz LB_25008
	cmp al,32
	jz LB_25008
LB_25010:
	push r10
	call NS_E_24934_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25011
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25001
LB_25011:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_25014
LB_25013:
	add r14,1
LB_25014:
	cmp r14,r10
	jge LB_25015
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25013
	cmp al,10
	jz LB_25013
	cmp al,32
	jz LB_25013
LB_25015:
	push r10
	call NS_E_24933_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25016
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25017
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25017:
	jmp LB_25001
LB_25016:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_25020
LB_25019:
	add r14,1
LB_25020:
	cmp r14,r10
	jge LB_25021
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25019
	cmp al,10
	jz LB_25019
	cmp al,32
	jz LB_25019
LB_25021:
	push r10
	call NS_E_24932_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25022
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25023
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25023:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25024
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25024:
	jmp LB_25001
LB_25022:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25006
	btr r12,2
	clc
	jmp LB_25007
LB_25006:
	bts r12,2
	stc
LB_25007:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25004
	btr r12,1
	clc
	jmp LB_25005
LB_25004:
	bts r12,1
	stc
LB_25005:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25002
	btr r12,0
	clc
	jmp LB_25003
LB_25002:
	bts r12,0
	stc
LB_25003:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_24998
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f24337 { %_24936 %_24937 } ⊢ %_24939 : %_24939
 ; {>  %_24938~2':(_opn)◂(_p21303) %_24937~1':(_lst)◂(_p21303) %_24936~0':_p21303 }
; _f24337 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_24337
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_24969
	btr r12,2
	clc
	jmp LB_24970
LB_24969:
	bts r12,2
	stc
LB_24970:
	add rsp,16
MTC_LB_24971:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_24972
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
	jnc LB_24973
	bt QWORD [rdi],0
	jc LB_24974
	btr r12,3
	clc
	jmp LB_24975
LB_24974:
	bts r12,3
	stc
LB_24975:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24973:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_24976
	btr r12,1
	jmp LB_24977
LB_24976:
	bts r12,1
LB_24977:
LB_24978:
	cmp r15,0
	jz LB_24979
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24978
LB_24979:
; _f21336 { %_24939 %_24940 } ⊢ %_24941 : %_24941
 ; {>  %_24939~0':_p21303 %_24940~1':_p21303 }
; _f21336 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_24941 ⊢ %_24942 : %_24942
 ; {>  %_24941~°1◂{ 0' 1' }:_p21303 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_24942
 ; {>  %_24942~°0◂°1◂{ 0' 1' }:(_opn)◂(_p21303) }
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
	jc LB_24984
	btr r12,2
	jmp LB_24985
LB_24984:
	bts r12,2
LB_24985:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_24982
	btr QWORD [rdi],0
	jmp LB_24983
LB_24982:
	bts QWORD [rdi],0
LB_24983:
	mov r8,r14
	bt r12,1
	jc LB_24988
	btr r12,2
	jmp LB_24989
LB_24988:
	bts r12,2
LB_24989:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_24986
	btr QWORD [rdi],1
	jmp LB_24987
LB_24986:
	bts QWORD [rdi],1
LB_24987:
	mov rsi,1
	bt r12,3
	jc LB_24980
	mov rsi,0
	bt r9,0
	jc LB_24980
	jmp LB_24981
LB_24980:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_24981:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_24972:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_24990
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
	jnc LB_24991
	bt QWORD [rdi],0
	jc LB_24992
	btr r12,1
	clc
	jmp LB_24993
LB_24992:
	bts r12,1
	stc
LB_24993:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_24991:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_24994:
	cmp r15,0
	jz LB_24995
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_24994
LB_24995:
; _some %_24939 ⊢ %_24943 : %_24943
 ; {>  %_24939~0':_p21303 }
; _some 0' ⊢ °0◂0'
; ∎ %_24943
 ; {>  %_24943~°0◂0':(_opn)◂(_p21303) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_24996
	btr r12,3
	jmp LB_24997
LB_24996:
	bts r12,3
LB_24997:
	mov r8,0
	bts r12,2
	ret
MTC_LB_24990:
LB_24998:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25000
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_24999
LB_25000:
	add rsp,8
	ret
LB_25001:
	add rsp,48
	pop r14
LB_24999:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24932:
NS_E_RDI_24932:
NS_E_24932_ETR_TBL:
NS_E_24932_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_25039
LB_25038:
	add r14,1
LB_25039:
	cmp r14,r10
	jge LB_25040
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25038
	cmp al,10
	jz LB_25038
	cmp al,32
	jz LB_25038
LB_25040:
	add r14,3
	cmp r14,r10
	jg LB_25043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_25043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_25043
	jmp LB_25044
LB_25043:
	jmp LB_25033
LB_25044:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_25046
LB_25045:
	add r14,1
LB_25046:
	cmp r14,r10
	jge LB_25047
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25045
	cmp al,10
	jz LB_25045
	cmp al,32
	jz LB_25045
LB_25047:
	push r10
	call NS_E_24931_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25048
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25049
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25049:
	jmp LB_25033
LB_25048:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25036
	btr r12,1
	clc
	jmp LB_25037
LB_25036:
	bts r12,1
	stc
LB_25037:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25034
	btr r12,0
	clc
	jmp LB_25035
LB_25034:
	bts r12,0
	stc
LB_25035:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25030
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_25051
	btr r12,2
	jmp LB_25052
LB_25051:
	bts r12,2
LB_25052:
	mov r13,r14
	bt r12,1
	jc LB_25053
	btr r12,0
	jmp LB_25054
LB_25053:
	bts r12,0
LB_25054:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_24944 ⊢ %_24945 : %_24945
 ; {>  %_24944~0':_p21303 }
; _some 0' ⊢ °0◂0'
; _some %_24945 ⊢ %_24946 : %_24946
 ; {>  %_24945~°0◂0':(_opn)◂(_p21303) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_24946
 ; {>  %_24946~°0◂°0◂0':(_opn)◂((_opn)◂(_p21303)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25028
	btr r12,3
	jmp LB_25029
LB_25028:
	bts r12,3
LB_25029:
	mov rsi,1
	bt r12,3
	jc LB_25026
	mov rsi,0
	bt r9,0
	jc LB_25026
	jmp LB_25027
LB_25026:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25027:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25030:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25032
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25031
LB_25032:
	add rsp,8
	ret
LB_25033:
	add rsp,32
	pop r14
LB_25031:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25057
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_24947 : %_24947
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_24947 ⊢ %_24948 : %_24948
 ; {>  %_24947~°1◂{  }:(_opn)◂(t12142'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_24948
 ; {>  %_24948~°0◂°1◂{  }:(_opn)◂((_opn)◂(t12145'(0))) }
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
	jc LB_25055
	mov rsi,0
	bt r9,0
	jc LB_25055
	jmp LB_25056
LB_25055:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25056:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25057:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25059
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25058
LB_25059:
	add rsp,8
	ret
LB_25060:
	add rsp,0
	pop r14
LB_25058:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24933:
NS_E_RDI_24933:
NS_E_24933_ETR_TBL:
NS_E_24933_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_25082
LB_25081:
	add r14,1
LB_25082:
	cmp r14,r10
	jge LB_25083
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25081
	cmp al,10
	jz LB_25081
	cmp al,32
	jz LB_25081
LB_25083:
	add r14,3
	cmp r14,r10
	jg LB_25086
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25086
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_25086
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_25086
	jmp LB_25087
LB_25086:
	jmp LB_25074
LB_25087:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_25089
LB_25088:
	add r14,1
LB_25089:
	cmp r14,r10
	jge LB_25090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25088
	cmp al,10
	jz LB_25088
	cmp al,32
	jz LB_25088
LB_25090:
	push r10
	call NS_E_24934_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25091
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25092
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25092:
	jmp LB_25074
LB_25091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_25095
LB_25094:
	add r14,1
LB_25095:
	cmp r14,r10
	jge LB_25096
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25094
	cmp al,10
	jz LB_25094
	cmp al,32
	jz LB_25094
LB_25096:
	push r10
	call NS_E_24933_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25097
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25098
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25098:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25099
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25099:
	jmp LB_25074
LB_25097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25079
	btr r12,2
	clc
	jmp LB_25080
LB_25079:
	bts r12,2
	stc
LB_25080:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25077
	btr r12,1
	clc
	jmp LB_25078
LB_25077:
	bts r12,1
	stc
LB_25078:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25075
	btr r12,0
	clc
	jmp LB_25076
LB_25075:
	bts r12,0
	stc
LB_25076:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_25071
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_25101
	btr r12,3
	jmp LB_25102
LB_25101:
	bts r12,3
LB_25102:
	mov r14,r8
	bt r12,2
	jc LB_25103
	btr r12,1
	jmp LB_25104
LB_25103:
	bts r12,1
LB_25104:
	mov r8,r13
	bt r12,0
	jc LB_25105
	btr r12,2
	jmp LB_25106
LB_25105:
	bts r12,2
LB_25106:
	mov r13,r9
	bt r12,3
	jc LB_25107
	btr r12,0
	jmp LB_25108
LB_25107:
	bts r12,0
LB_25108:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_24949 %_24950 } ⊢ %_24951 : %_24951
 ; {>  %_24949~0':_p21303 %_24950~1':(_lst)◂(_p21303) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_24951 ⊢ %_24952 : %_24952
 ; {>  %_24951~°0◂{ 0' 1' }:(_lst)◂(_p21303) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_24952
 ; {>  %_24952~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p21303)) }
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
	jc LB_25065
	btr r12,2
	jmp LB_25066
LB_25065:
	bts r12,2
LB_25066:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_25063
	btr QWORD [rdi],0
	jmp LB_25064
LB_25063:
	bts QWORD [rdi],0
LB_25064:
	mov r8,r14
	bt r12,1
	jc LB_25069
	btr r12,2
	jmp LB_25070
LB_25069:
	bts r12,2
LB_25070:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_25067
	btr QWORD [rdi],1
	jmp LB_25068
LB_25067:
	bts QWORD [rdi],1
LB_25068:
	mov rsi,1
	bt r12,3
	jc LB_25061
	mov rsi,0
	bt r9,0
	jc LB_25061
	jmp LB_25062
LB_25061:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25062:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25071:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25073
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25072
LB_25073:
	add rsp,8
	ret
LB_25074:
	add rsp,48
	pop r14
LB_25072:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25111
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_24953 : %_24953
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_24953 ⊢ %_24954 : %_24954
 ; {>  %_24953~°1◂{  }:(_lst)◂(t12155'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_24954
 ; {>  %_24954~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12158'(0))) }
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
	jc LB_25109
	mov rsi,0
	bt r9,0
	jc LB_25109
	jmp LB_25110
LB_25109:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25110:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25111:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25113
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25112
LB_25113:
	add rsp,8
	ret
LB_25114:
	add rsp,0
	pop r14
LB_25112:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24934:
NS_E_RDI_24934:
NS_E_24934_ETR_TBL:
NS_E_24934_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_25130
LB_25129:
	add r14,1
LB_25130:
	cmp r14,r10
	jge LB_25131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25129
	cmp al,10
	jz LB_25129
	cmp al,32
	jz LB_25129
LB_25131:
	add r14,1
	cmp r14,r10
	jg LB_25134
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_25134
	jmp LB_25135
LB_25134:
	jmp LB_25122
LB_25135:
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
LB_25140:
	jmp LB_25137
LB_25136:
	add r14,1
LB_25137:
	cmp r14,r10
	jge LB_25138
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25136
	cmp al,10
	jz LB_25136
	cmp al,32
	jz LB_25136
LB_25138:
	push r10
	push rsi
	call NS_E_24931_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25139
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25141
	bts QWORD [rax],0
LB_25141:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25140
LB_25139:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_25143
LB_25142:
	add r14,1
LB_25143:
	cmp r14,r10
	jge LB_25144
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25142
	cmp al,10
	jz LB_25142
	cmp al,32
	jz LB_25142
LB_25144:
	add r14,1
	cmp r14,r10
	jg LB_25149
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_25149
	jmp LB_25150
LB_25149:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25146
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25146:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25147
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25147:
	jmp LB_25122
LB_25150:
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
	jc LB_25127
	btr r12,2
	clc
	jmp LB_25128
LB_25127:
	bts r12,2
	stc
LB_25128:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25125
	btr r12,1
	clc
	jmp LB_25126
LB_25125:
	bts r12,1
	stc
LB_25126:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25123
	btr r12,0
	clc
	jmp LB_25124
LB_25123:
	bts r12,0
	stc
LB_25124:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_25119
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_25151
	btr r12,3
	jmp LB_25152
LB_25151:
	bts r12,3
LB_25152:
	mov r13,r14
	bt r12,1
	jc LB_25153
	btr r12,0
	jmp LB_25154
LB_25153:
	bts r12,0
LB_25154:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f20435 %_24955 ⊢ %_24956 : %_24956
 ; {>  %_24955~0':(_lst)◂(_p21303) }
; _f20435 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20435
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21335 %_24956 ⊢ %_24957 : %_24957
 ; {>  %_24956~0':(_lst)◂(_p21303) }
; _f21335 0' ⊢ °0◂0'
; _some %_24957 ⊢ %_24958 : %_24958
 ; {>  %_24957~°0◂0':_p21303 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_24958
 ; {>  %_24958~°0◂°0◂0':(_opn)◂(_p21303) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25117
	btr r12,3
	jmp LB_25118
LB_25117:
	bts r12,3
LB_25118:
	mov rsi,1
	bt r12,3
	jc LB_25115
	mov rsi,0
	bt r9,0
	jc LB_25115
	jmp LB_25116
LB_25115:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25116:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25119:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25121
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25120
LB_25121:
	add rsp,8
	ret
LB_25122:
	add rsp,48
	pop r14
LB_25120:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_25168
LB_25167:
	add r14,1
LB_25168:
	cmp r14,r10
	jge LB_25169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25167
	cmp al,10
	jz LB_25167
	cmp al,32
	jz LB_25167
LB_25169:
	add r14,1
	cmp r14,r10
	jg LB_25172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_25172
	jmp LB_25173
LB_25172:
	jmp LB_25160
LB_25173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_25175
LB_25174:
	add r14,1
LB_25175:
	cmp r14,r10
	jge LB_25176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25174
	cmp al,10
	jz LB_25174
	cmp al,32
	jz LB_25174
LB_25176:
	push r10
	call NS_E_24931_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25177
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25178
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25178:
	jmp LB_25160
LB_25177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_25181
LB_25180:
	add r14,1
LB_25181:
	cmp r14,r10
	jge LB_25182
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25180
	cmp al,10
	jz LB_25180
	cmp al,32
	jz LB_25180
LB_25182:
	add r14,1
	cmp r14,r10
	jg LB_25187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_25187
	jmp LB_25188
LB_25187:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25184
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25184:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25185
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25185:
	jmp LB_25160
LB_25188:
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
	jc LB_25165
	btr r12,2
	clc
	jmp LB_25166
LB_25165:
	bts r12,2
	stc
LB_25166:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25163
	btr r12,1
	clc
	jmp LB_25164
LB_25163:
	bts r12,1
	stc
LB_25164:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25161
	btr r12,0
	clc
	jmp LB_25162
LB_25161:
	bts r12,0
	stc
LB_25162:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_25157
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_25189
	btr r12,3
	jmp LB_25190
LB_25189:
	bts r12,3
LB_25190:
	mov r13,r14
	bt r12,1
	jc LB_25191
	btr r12,0
	jmp LB_25192
LB_25191:
	bts r12,0
LB_25192:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_24959 ⊢ %_24960 : %_24960
 ; {>  %_24959~0':_p21303 }
; _some 0' ⊢ °0◂0'
; ∎ %_24960
 ; {>  %_24960~°0◂0':(_opn)◂(_p21303) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25155
	btr r12,3
	jmp LB_25156
LB_25155:
	bts r12,3
LB_25156:
	mov r8,0
	bts r12,2
	ret
LB_25157:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25159
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25158
LB_25159:
	add rsp,8
	ret
LB_25160:
	add rsp,48
	pop r14
LB_25158:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_25204
LB_25203:
	add r14,1
LB_25204:
	cmp r14,r10
	jge LB_25205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25203
	cmp al,10
	jz LB_25203
	cmp al,32
	jz LB_25203
LB_25205:
	push r10
	call NS_E_24935_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25206
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25200
LB_25206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25201
	btr r12,0
	clc
	jmp LB_25202
LB_25201:
	bts r12,0
	stc
LB_25202:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_25197
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21339 %_24961 ⊢ %_24962 : %_24962
 ; {>  %_24961~0':_stg }
; _f21339 0' ⊢ °4◂0'
; _some %_24962 ⊢ %_24963 : %_24963
 ; {>  %_24962~°4◂0':_p21303 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_24963
 ; {>  %_24963~°0◂°4◂0':(_opn)◂(_p21303) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25195
	btr r12,3
	jmp LB_25196
LB_25195:
	bts r12,3
LB_25196:
	mov rsi,1
	bt r12,3
	jc LB_25193
	mov rsi,0
	bt r9,0
	jc LB_25193
	jmp LB_25194
LB_25193:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25194:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25197:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25199
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25198
LB_25199:
	add rsp,8
	ret
LB_25200:
	add rsp,16
	pop r14
LB_25198:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_25219
LB_25218:
	add r14,1
LB_25219:
	cmp r14,r10
	jge LB_25220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25218
	cmp al,10
	jz LB_25218
	cmp al,32
	jz LB_25218
LB_25220:
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25221
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25215
LB_25221:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25216
	btr r12,0
	clc
	jmp LB_25217
LB_25216:
	bts r12,0
	stc
LB_25217:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_25212
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21338 %_24964 ⊢ %_24965 : %_24965
 ; {>  %_24964~0':_p21201 }
; _f21338 0' ⊢ °3◂0'
; _some %_24965 ⊢ %_24966 : %_24966
 ; {>  %_24965~°3◂0':_p21303 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_24966
 ; {>  %_24966~°0◂°3◂0':(_opn)◂(_p21303) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25210
	btr r12,3
	jmp LB_25211
LB_25210:
	bts r12,3
LB_25211:
	mov rsi,1
	bt r12,3
	jc LB_25208
	mov rsi,0
	bt r9,0
	jc LB_25208
	jmp LB_25209
LB_25208:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25209:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25212:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25214
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25213
LB_25214:
	add rsp,8
	ret
LB_25215:
	add rsp,16
	pop r14
LB_25213:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_24935:
NS_E_RDI_24935:
NS_E_24935_ETR_TBL:
NS_E_24935_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25236
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25228
LB_25236:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_25244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_25244
	jmp LB_25245
LB_25244:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25242:
	jmp LB_25228
LB_25245:
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
	jc LB_25231
	btr r12,1
	clc
	jmp LB_25232
LB_25231:
	bts r12,1
	stc
LB_25232:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25229
	btr r12,0
	clc
	jmp LB_25230
LB_25229:
	bts r12,0
	stc
LB_25230:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25225
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_24967 ⊢ %_24968 : %_24968
 ; {>  %_24967~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_24968
 ; {>  %_24968~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25223
	btr r12,3
	jmp LB_25224
LB_25223:
	bts r12,3
LB_25224:
	mov r8,0
	bts r12,2
	ret
LB_25225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25227
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25226
LB_25227:
	add rsp,8
	ret
LB_25228:
	add rsp,32
	pop r14
LB_25226:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25246:
NS_E_RDI_25246:
NS_E_25246_ETR_TBL:
NS_E_25246_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_25646
LB_25645:
	add r14,1
LB_25646:
	cmp r14,r10
	jge LB_25647
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25645
	cmp al,10
	jz LB_25645
	cmp al,32
	jz LB_25645
LB_25647:
	push r10
	call NS_E_25247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25648
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25640
LB_25648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_25651
LB_25650:
	add r14,1
LB_25651:
	cmp r14,r10
	jge LB_25652
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25650
	cmp al,10
	jz LB_25650
	cmp al,32
	jz LB_25650
LB_25652:
	push r10
	call NS_E_25246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25653
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25654
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25654:
	jmp LB_25640
LB_25653:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25643
	btr r12,1
	clc
	jmp LB_25644
LB_25643:
	bts r12,1
	stc
LB_25644:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25641
	btr r12,0
	clc
	jmp LB_25642
LB_25641:
	bts r12,0
	stc
LB_25642:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25637
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_25287 %_25288 } ⊢ %_25289 : %_25289
 ; {>  %_25288~1':(_lst)◂(_p21291) %_25287~0':_p21291 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25289 ⊢ %_25290 : %_25290
 ; {>  %_25289~°0◂{ 0' 1' }:(_lst)◂(_p21291) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25290
 ; {>  %_25290~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p21291)) }
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
	jc LB_25631
	btr r12,2
	jmp LB_25632
LB_25631:
	bts r12,2
LB_25632:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_25629
	btr QWORD [rdi],0
	jmp LB_25630
LB_25629:
	bts QWORD [rdi],0
LB_25630:
	mov r8,r14
	bt r12,1
	jc LB_25635
	btr r12,2
	jmp LB_25636
LB_25635:
	bts r12,2
LB_25636:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_25633
	btr QWORD [rdi],1
	jmp LB_25634
LB_25633:
	bts QWORD [rdi],1
LB_25634:
	mov rsi,1
	bt r12,3
	jc LB_25627
	mov rsi,0
	bt r9,0
	jc LB_25627
	jmp LB_25628
LB_25627:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25628:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25637:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25639
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25638
LB_25639:
	add rsp,8
	ret
LB_25640:
	add rsp,32
	pop r14
LB_25638:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25658
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_25291 : %_25291
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_25291 ⊢ %_25292 : %_25292
 ; {>  %_25291~°1◂{  }:(_lst)◂(t12285'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25292
 ; {>  %_25292~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12288'(0))) }
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
	jc LB_25656
	mov rsi,0
	bt r9,0
	jc LB_25656
	jmp LB_25657
LB_25656:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25657:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25658:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25660
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25659
LB_25660:
	add rsp,8
	ret
LB_25661:
	add rsp,0
	pop r14
LB_25659:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25247:
NS_E_RDI_25247:
NS_E_25247_ETR_TBL:
NS_E_25247_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_25680
LB_25679:
	add r14,1
LB_25680:
	cmp r14,r10
	jge LB_25681
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25679
	cmp al,10
	jz LB_25679
	cmp al,32
	jz LB_25679
LB_25681:
	add r14,7
	cmp r14,r10
	jg LB_25684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_25684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_25684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_25684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_25684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_25684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_25684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_25684
	jmp LB_25685
LB_25684:
	jmp LB_25667
LB_25685:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_25674
LB_25673:
	add r14,1
LB_25674:
	cmp r14,r10
	jge LB_25675
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25673
	cmp al,10
	jz LB_25673
	cmp al,32
	jz LB_25673
LB_25675:
	push r10
	call NS_E_25248_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25676
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25677
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25677:
	jmp LB_25668
LB_25676:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25671
	btr r12,1
	clc
	jmp LB_25672
LB_25671:
	bts r12,1
	stc
LB_25672:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25669
	btr r12,0
	clc
	jmp LB_25670
LB_25669:
	bts r12,0
	stc
LB_25670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25664
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_25686
	btr r12,2
	jmp LB_25687
LB_25686:
	bts r12,2
LB_25687:
	mov r13,r14
	bt r12,1
	jc LB_25688
	btr r12,0
	jmp LB_25689
LB_25688:
	bts r12,0
LB_25689:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25293 ⊢ %_25294 : %_25294
 ; {>  %_25293~0':_p21291 }
; _some 0' ⊢ °0◂0'
; ∎ %_25294
 ; {>  %_25294~°0◂0':(_opn)◂(_p21291) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25662
	btr r12,3
	jmp LB_25663
LB_25662:
	bts r12,3
LB_25663:
	mov r8,0
	bts r12,2
	ret
LB_25664:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25666
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25665
LB_25666:
	add rsp,8
	ret
LB_25668:
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
LB_25667:
	add rsp,32
	pop r14
LB_25665:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25691
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_25295
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_25295 ⊢ %_25296 : %_25296
 ; {>  %_25295~0':_stg }
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
; _none {  } ⊢ %_25297 : %_25297
 ; {>  %_25296~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_25297
 ; {>  %_25296~0':_stg %_25297~°1◂{  }:(_opn)◂(t12298'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_25690
	mov rdi,r13
	call dlt
LB_25690:
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
LB_25691:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25693
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25692
LB_25693:
	add rsp,8
	ret
LB_25694:
	add rsp,0
	pop r14
LB_25692:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_25730
LB_25729:
	add r14,1
LB_25730:
	cmp r14,r10
	jge LB_25731
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25729
	cmp al,10
	jz LB_25729
	cmp al,32
	jz LB_25729
LB_25731:
	add r14,4
	cmp r14,r10
	jg LB_25734
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_25734
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_25734
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_25734
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_25734
	jmp LB_25735
LB_25734:
	jmp LB_25708
LB_25735:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_25717
LB_25716:
	add r14,1
LB_25717:
	cmp r14,r10
	jge LB_25718
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25716
	cmp al,10
	jz LB_25716
	cmp al,32
	jz LB_25716
LB_25718:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25719
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25720
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25720:
	jmp LB_25709
LB_25719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_25723
LB_25722:
	add r14,1
LB_25723:
	cmp r14,r10
	jge LB_25724
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25722
	cmp al,10
	jz LB_25722
	cmp al,32
	jz LB_25722
LB_25724:
	push r10
	call NS_E_25249_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25725
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25726
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25726:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25727
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25727:
	jmp LB_25709
LB_25725:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25714
	btr r12,2
	clc
	jmp LB_25715
LB_25714:
	bts r12,2
	stc
LB_25715:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25712
	btr r12,1
	clc
	jmp LB_25713
LB_25712:
	bts r12,1
	stc
LB_25713:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25710
	btr r12,0
	clc
	jmp LB_25711
LB_25710:
	bts r12,0
	stc
LB_25711:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_25705
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_25736
	btr r12,3
	jmp LB_25737
LB_25736:
	bts r12,3
LB_25737:
	mov r14,r8
	bt r12,2
	jc LB_25738
	btr r12,1
	jmp LB_25739
LB_25738:
	bts r12,1
LB_25739:
	mov r8,r13
	bt r12,0
	jc LB_25740
	btr r12,2
	jmp LB_25741
LB_25740:
	bts r12,2
LB_25741:
	mov r13,r9
	bt r12,3
	jc LB_25742
	btr r12,0
	jmp LB_25743
LB_25742:
	bts r12,0
LB_25743:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21304 { %_25298 %_25299 } ⊢ %_25300 : %_25300
 ; {>  %_25299~1':_p21292 %_25298~0':_stg }
; _f21304 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25300 ⊢ %_25301 : %_25301
 ; {>  %_25300~°0◂{ 0' 1' }:_p21291 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25301
 ; {>  %_25301~°0◂°0◂{ 0' 1' }:(_opn)◂(_p21291) }
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
	jc LB_25699
	btr r12,2
	jmp LB_25700
LB_25699:
	bts r12,2
LB_25700:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_25697
	btr QWORD [rdi],0
	jmp LB_25698
LB_25697:
	bts QWORD [rdi],0
LB_25698:
	mov r8,r14
	bt r12,1
	jc LB_25703
	btr r12,2
	jmp LB_25704
LB_25703:
	bts r12,2
LB_25704:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_25701
	btr QWORD [rdi],1
	jmp LB_25702
LB_25701:
	bts QWORD [rdi],1
LB_25702:
	mov rsi,1
	bt r12,3
	jc LB_25695
	mov rsi,0
	bt r9,0
	jc LB_25695
	jmp LB_25696
LB_25695:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25696:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25705:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25707
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25706
LB_25707:
	add rsp,8
	ret
LB_25709:
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
LB_25708:
	add rsp,48
	pop r14
LB_25706:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25745
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_25302
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_25302 ⊢ %_25303 : %_25303
 ; {>  %_25302~0':_stg }
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
; _none {  } ⊢ %_25304 : %_25304
 ; {>  %_25303~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_25304
 ; {>  %_25304~°1◂{  }:(_opn)◂(t12310'(0)) %_25303~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_25744
	mov rdi,r13
	call dlt
LB_25744:
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
LB_25745:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25747
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25746
LB_25747:
	add rsp,8
	ret
LB_25748:
	add rsp,0
	pop r14
LB_25746:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_25767
LB_25766:
	add r14,1
LB_25767:
	cmp r14,r10
	jge LB_25768
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25766
	cmp al,10
	jz LB_25766
	cmp al,32
	jz LB_25766
LB_25768:
	add r14,2
	cmp r14,r10
	jg LB_25771
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_25771
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_25771
	jmp LB_25772
LB_25771:
	jmp LB_25754
LB_25772:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_25761
LB_25760:
	add r14,1
LB_25761:
	cmp r14,r10
	jge LB_25762
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25760
	cmp al,10
	jz LB_25760
	cmp al,32
	jz LB_25760
LB_25762:
	push r10
	call NS_E_25257_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25763
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25764
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25764:
	jmp LB_25755
LB_25763:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25758
	btr r12,1
	clc
	jmp LB_25759
LB_25758:
	bts r12,1
	stc
LB_25759:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25756
	btr r12,0
	clc
	jmp LB_25757
LB_25756:
	bts r12,0
	stc
LB_25757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25751
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_25773
	btr r12,2
	jmp LB_25774
LB_25773:
	bts r12,2
LB_25774:
	mov r13,r14
	bt r12,1
	jc LB_25775
	btr r12,0
	jmp LB_25776
LB_25775:
	bts r12,0
LB_25776:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25305 ⊢ %_25306 : %_25306
 ; {>  %_25305~0':_p21291 }
; _some 0' ⊢ °0◂0'
; ∎ %_25306
 ; {>  %_25306~°0◂0':(_opn)◂(_p21291) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25749
	btr r12,3
	jmp LB_25750
LB_25749:
	bts r12,3
LB_25750:
	mov r8,0
	bts r12,2
	ret
LB_25751:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25753
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25752
LB_25753:
	add rsp,8
	ret
LB_25755:
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
LB_25754:
	add rsp,32
	pop r14
LB_25752:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25778
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_25307
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_25307 ⊢ %_25308 : %_25308
 ; {>  %_25307~0':_stg }
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
; _none {  } ⊢ %_25309 : %_25309
 ; {>  %_25308~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_25309
 ; {>  %_25309~°1◂{  }:(_opn)◂(t12320'(0)) %_25308~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_25777
	mov rdi,r13
	call dlt
LB_25777:
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
LB_25778:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25780
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25779
LB_25780:
	add rsp,8
	ret
LB_25781:
	add rsp,0
	pop r14
LB_25779:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_25800
LB_25799:
	add r14,1
LB_25800:
	cmp r14,r10
	jge LB_25801
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25799
	cmp al,10
	jz LB_25799
	cmp al,32
	jz LB_25799
LB_25801:
	add r14,2
	cmp r14,r10
	jg LB_25804
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_25804
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_25804
	jmp LB_25805
LB_25804:
	jmp LB_25787
LB_25805:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_25794
LB_25793:
	add r14,1
LB_25794:
	cmp r14,r10
	jge LB_25795
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25793
	cmp al,10
	jz LB_25793
	cmp al,32
	jz LB_25793
LB_25795:
	push r10
	call NS_E_25251_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25796
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25797
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25797:
	jmp LB_25788
LB_25796:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25791
	btr r12,1
	clc
	jmp LB_25792
LB_25791:
	bts r12,1
	stc
LB_25792:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25789
	btr r12,0
	clc
	jmp LB_25790
LB_25789:
	bts r12,0
	stc
LB_25790:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25784
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_25806
	btr r12,2
	jmp LB_25807
LB_25806:
	bts r12,2
LB_25807:
	mov r13,r14
	bt r12,1
	jc LB_25808
	btr r12,0
	jmp LB_25809
LB_25808:
	bts r12,0
LB_25809:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25310 ⊢ %_25311 : %_25311
 ; {>  %_25310~0':_p21291 }
; _some 0' ⊢ °0◂0'
; ∎ %_25311
 ; {>  %_25311~°0◂0':(_opn)◂(_p21291) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25782
	btr r12,3
	jmp LB_25783
LB_25782:
	bts r12,3
LB_25783:
	mov r8,0
	bts r12,2
	ret
LB_25784:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25786
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25785
LB_25786:
	add rsp,8
	ret
LB_25788:
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
LB_25787:
	add rsp,32
	pop r14
LB_25785:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25248:
NS_E_RDI_25248:
NS_E_25248_ETR_TBL:
NS_E_25248_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_25845
LB_25844:
	add r14,1
LB_25845:
	cmp r14,r10
	jge LB_25846
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25844
	cmp al,10
	jz LB_25844
	cmp al,32
	jz LB_25844
LB_25846:
	push r10
	call NS_E_25274_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25847
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25839
LB_25847:
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
LB_25853:
	jmp LB_25850
LB_25849:
	add r14,1
LB_25850:
	cmp r14,r10
	jge LB_25851
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25849
	cmp al,10
	jz LB_25849
	cmp al,32
	jz LB_25849
LB_25851:
	push r10
	push rsi
	call NS_E_25274_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25852
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25854
	bts QWORD [rax],0
LB_25854:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25853
LB_25852:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25842
	btr r12,1
	clc
	jmp LB_25843
LB_25842:
	bts r12,1
	stc
LB_25843:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25840
	btr r12,0
	clc
	jmp LB_25841
LB_25840:
	bts r12,0
	stc
LB_25841:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25836
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_25855
	btr r12,2
	jmp LB_25856
LB_25855:
	bts r12,2
LB_25856:
	mov r9,r13
	bt r12,0
	jc LB_25857
	btr r12,3
	jmp LB_25858
LB_25857:
	bts r12,3
LB_25858:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_25861
	btr r12,4
	clc
	jmp LB_25862
LB_25861:
	bts r12,4
	stc
LB_25862:
	mov r13,r10
	bt r12,4
	jc LB_25859
	btr r12,0
	jmp LB_25860
LB_25859:
	bts r12,0
LB_25860:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_25865
	btr r12,4
	clc
	jmp LB_25866
LB_25865:
	bts r12,4
	stc
LB_25866:
	mov r14,r10
	bt r12,4
	jc LB_25863
	btr r12,1
	jmp LB_25864
LB_25863:
	bts r12,1
LB_25864:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f20435 %_25313 ⊢ %_25314 : %_25314
 ; {>  %_25313~2':(_lst)◂({ _stg _p21295 }) %_25312~{ 0' 1' }:{ _stg _p21295 } }
; _f20435 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_25814
	btr r12,0
	jmp LB_25815
LB_25814:
	bts r12,0
LB_25815:
	call NS_E_20435
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_25816
	btr r12,2
	jmp LB_25817
LB_25816:
	bts r12,2
LB_25817:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_25812
	btr r12,1
	clc
	jmp LB_25813
LB_25812:
	bts r12,1
	stc
LB_25813:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_25810
	btr r12,0
	clc
	jmp LB_25811
LB_25810:
	bts r12,0
	stc
LB_25811:
	add rsp,24
; _cns { %_25312 %_25314 } ⊢ %_25315 : %_25315
 ; {>  %_25314~2':(_lst)◂({ _stg _p21295 }) %_25312~{ 0' 1' }:{ _stg _p21295 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f21305 %_25315 ⊢ %_25316 : %_25316
 ; {>  %_25315~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p21295 }) }
; _f21305 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_25316 ⊢ %_25317 : %_25317
 ; {>  %_25316~°1◂°0◂{ { 0' 1' } 2' }:_p21291 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_25317
 ; {>  %_25317~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p21291) }
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
	jc LB_25826
	btr r12,5
	jmp LB_25827
LB_25826:
	bts r12,5
LB_25827:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_25824
	btr QWORD [rdi],0
	jmp LB_25825
LB_25824:
	bts QWORD [rdi],0
LB_25825:
	mov r11,r14
	bt r12,1
	jc LB_25830
	btr r12,5
	jmp LB_25831
LB_25830:
	bts r12,5
LB_25831:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_25828
	btr QWORD [rdi],1
	jmp LB_25829
LB_25828:
	bts QWORD [rdi],1
LB_25829:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_25822
	btr QWORD [rdi],0
	jmp LB_25823
LB_25822:
	bts QWORD [rdi],0
LB_25823:
	mov r10,r8
	bt r12,2
	jc LB_25834
	btr r12,4
	jmp LB_25835
LB_25834:
	bts r12,4
LB_25835:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_25832
	btr QWORD [rdi],1
	jmp LB_25833
LB_25832:
	bts QWORD [rdi],1
LB_25833:
	mov rsi,1
	bt r12,3
	jc LB_25820
	mov rsi,0
	bt r9,0
	jc LB_25820
	jmp LB_25821
LB_25820:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25821:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_25818
	mov rsi,0
	bt r9,0
	jc LB_25818
	jmp LB_25819
LB_25818:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25819:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25836:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25838
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25837
LB_25838:
	add rsp,8
	ret
LB_25839:
	add rsp,32
	pop r14
LB_25837:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25868
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_25318
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_25318 ⊢ %_25319 : %_25319
 ; {>  %_25318~0':_stg }
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
; _none {  } ⊢ %_25320 : %_25320
 ; {>  %_25319~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_25320
 ; {>  %_25320~°1◂{  }:(_opn)◂(t12339'(0)) %_25319~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_25867
	mov rdi,r13
	call dlt
LB_25867:
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
LB_25868:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25870
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25869
LB_25870:
	add rsp,8
	ret
LB_25871:
	add rsp,0
	pop r14
LB_25869:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25249:
NS_E_RDI_25249:
NS_E_25249_ETR_TBL:
NS_E_25249_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_25892
LB_25891:
	add r14,1
LB_25892:
	cmp r14,r10
	jge LB_25893
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25891
	cmp al,10
	jz LB_25891
	cmp al,32
	jz LB_25891
LB_25893:
	add r14,1
	cmp r14,r10
	jg LB_25896
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_25896
	jmp LB_25897
LB_25896:
	jmp LB_25879
LB_25897:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_25886
LB_25885:
	add r14,1
LB_25886:
	cmp r14,r10
	jge LB_25887
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25885
	cmp al,10
	jz LB_25885
	cmp al,32
	jz LB_25885
LB_25887:
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25888
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25889
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25889:
	jmp LB_25880
LB_25888:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25883
	btr r12,1
	clc
	jmp LB_25884
LB_25883:
	bts r12,1
	stc
LB_25884:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25881
	btr r12,0
	clc
	jmp LB_25882
LB_25881:
	bts r12,0
	stc
LB_25882:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25876
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_25898
	btr r12,2
	jmp LB_25899
LB_25898:
	bts r12,2
LB_25899:
	mov r13,r14
	bt r12,1
	jc LB_25900
	btr r12,0
	jmp LB_25901
LB_25900:
	bts r12,0
LB_25901:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21311 %_25321 ⊢ %_25322 : %_25322
 ; {>  %_25321~0':_p21201 }
; _f21311 0' ⊢ °1◂0'
; _some %_25322 ⊢ %_25323 : %_25323
 ; {>  %_25322~°1◂0':_p21292 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25323
 ; {>  %_25323~°0◂°1◂0':(_opn)◂(_p21292) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25874
	btr r12,3
	jmp LB_25875
LB_25874:
	bts r12,3
LB_25875:
	mov rsi,1
	bt r12,3
	jc LB_25872
	mov rsi,0
	bt r9,0
	jc LB_25872
	jmp LB_25873
LB_25872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25873:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25876:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25878
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25877
LB_25878:
	add rsp,8
	ret
LB_25880:
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
LB_25879:
	add rsp,32
	pop r14
LB_25877:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_25913
LB_25912:
	add r14,1
LB_25913:
	cmp r14,r10
	jge LB_25914
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25912
	cmp al,10
	jz LB_25912
	cmp al,32
	jz LB_25912
LB_25914:
	push r10
	call NS_E_25250_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25915
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25909
LB_25915:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25910
	btr r12,0
	clc
	jmp LB_25911
LB_25910:
	bts r12,0
	stc
LB_25911:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_25906
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21310 %_25324 ⊢ %_25325 : %_25325
 ; {>  %_25324~0':(_lst)◂(_p21291) }
; _f21310 0' ⊢ °0◂0'
; _some %_25325 ⊢ %_25326 : %_25326
 ; {>  %_25325~°0◂0':_p21292 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25326
 ; {>  %_25326~°0◂°0◂0':(_opn)◂(_p21292) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_25904
	btr r12,3
	jmp LB_25905
LB_25904:
	bts r12,3
LB_25905:
	mov rsi,1
	bt r12,3
	jc LB_25902
	mov rsi,0
	bt r9,0
	jc LB_25902
	jmp LB_25903
LB_25902:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25903:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25906:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25908
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25907
LB_25908:
	add rsp,8
	ret
LB_25909:
	add rsp,16
	pop r14
LB_25907:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_25918
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_25327
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_25327 ⊢ %_25328 : %_25328
 ; {>  %_25327~0':_stg }
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
; _none {  } ⊢ %_25329 : %_25329
 ; {>  %_25328~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_25329
 ; {>  %_25328~0':_stg %_25329~°1◂{  }:(_opn)◂(t12354'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_25917
	mov rdi,r13
	call dlt
LB_25917:
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
LB_25918:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25920
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25919
LB_25920:
	add rsp,8
	ret
LB_25921:
	add rsp,0
	pop r14
LB_25919:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25250:
NS_E_RDI_25250:
NS_E_25250_ETR_TBL:
NS_E_25250_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_25931
LB_25930:
	add r14,1
LB_25931:
	cmp r14,r10
	jge LB_25932
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25930
	cmp al,10
	jz LB_25930
	cmp al,32
	jz LB_25930
LB_25932:
	add r14,6
	cmp r14,r10
	jg LB_25935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_25935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_25935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_25935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_25935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_25935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_25935
	jmp LB_25936
LB_25935:
	jmp LB_25927
LB_25936:
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
	jc LB_25928
	btr r12,0
	clc
	jmp LB_25929
LB_25928:
	bts r12,0
	stc
LB_25929:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_25924
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_25330 : %_25330
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_25330 ⊢ %_25331 : %_25331
 ; {>  %_25330~°1◂{  }:(_lst)◂(t12358'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25331
 ; {>  %_25331~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12361'(0))) }
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
	jc LB_25922
	mov rsi,0
	bt r9,0
	jc LB_25922
	jmp LB_25923
LB_25922:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25923:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25924:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25926
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25925
LB_25926:
	add rsp,8
	ret
LB_25927:
	add rsp,16
	pop r14
LB_25925:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_25956
LB_25955:
	add r14,1
LB_25956:
	cmp r14,r10
	jge LB_25957
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25955
	cmp al,10
	jz LB_25955
	cmp al,32
	jz LB_25955
LB_25957:
	push r10
	call NS_E_25247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25958
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25950
LB_25958:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_25961
LB_25960:
	add r14,1
LB_25961:
	cmp r14,r10
	jge LB_25962
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25960
	cmp al,10
	jz LB_25960
	cmp al,32
	jz LB_25960
LB_25962:
	push r10
	call NS_E_25250_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25963
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25964
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25964:
	jmp LB_25950
LB_25963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25953
	btr r12,1
	clc
	jmp LB_25954
LB_25953:
	bts r12,1
	stc
LB_25954:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25951
	btr r12,0
	clc
	jmp LB_25952
LB_25951:
	bts r12,0
	stc
LB_25952:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_25947
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_25332 %_25333 } ⊢ %_25334 : %_25334
 ; {>  %_25333~1':(_lst)◂(_p21291) %_25332~0':_p21291 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25334 ⊢ %_25335 : %_25335
 ; {>  %_25334~°0◂{ 0' 1' }:(_lst)◂(_p21291) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25335
 ; {>  %_25335~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p21291)) }
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
	jc LB_25941
	btr r12,2
	jmp LB_25942
LB_25941:
	bts r12,2
LB_25942:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_25939
	btr QWORD [rdi],0
	jmp LB_25940
LB_25939:
	bts QWORD [rdi],0
LB_25940:
	mov r8,r14
	bt r12,1
	jc LB_25945
	btr r12,2
	jmp LB_25946
LB_25945:
	bts r12,2
LB_25946:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_25943
	btr QWORD [rdi],1
	jmp LB_25944
LB_25943:
	bts QWORD [rdi],1
LB_25944:
	mov rsi,1
	bt r12,3
	jc LB_25937
	mov rsi,0
	bt r9,0
	jc LB_25937
	jmp LB_25938
LB_25937:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25938:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25947:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25949
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25948
LB_25949:
	add rsp,8
	ret
LB_25950:
	add rsp,32
	pop r14
LB_25948:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25251:
NS_E_RDI_25251:
NS_E_25251_ETR_TBL:
NS_E_25251_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_26021
LB_26020:
	add r14,1
LB_26021:
	cmp r14,r10
	jge LB_26022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26020
	cmp al,10
	jz LB_26020
	cmp al,32
	jz LB_26020
LB_26022:
	add r14,1
	cmp r14,r10
	jg LB_26025
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_26025
	jmp LB_26026
LB_26025:
	jmp LB_25987
LB_26026:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_25998
LB_25997:
	add r14,1
LB_25998:
	cmp r14,r10
	jge LB_25999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25997
	cmp al,10
	jz LB_25997
	cmp al,32
	jz LB_25997
LB_25999:
	add r14,1
	cmp r14,r10
	jg LB_26003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_26003
	jmp LB_26004
LB_26003:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26001
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26001:
	jmp LB_25988
LB_26004:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_26006
LB_26005:
	add r14,1
LB_26006:
	cmp r14,r10
	jge LB_26007
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26005
	cmp al,10
	jz LB_26005
	cmp al,32
	jz LB_26005
LB_26007:
	push r10
	call NS_E_25252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26008
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26009
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26009:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26010
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26010:
	jmp LB_25988
LB_26008:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_26013
LB_26012:
	add r14,1
LB_26013:
	cmp r14,r10
	jge LB_26014
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26012
	cmp al,10
	jz LB_26012
	cmp al,32
	jz LB_26012
LB_26014:
	push r10
	call NS_E_25255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26015
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26016
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26016:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26017
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26017:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26018:
	jmp LB_25988
LB_26015:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_25995
	btr r12,3
	clc
	jmp LB_25996
LB_25995:
	bts r12,3
	stc
LB_25996:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25993
	btr r12,2
	clc
	jmp LB_25994
LB_25993:
	bts r12,2
	stc
LB_25994:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25991
	btr r12,1
	clc
	jmp LB_25992
LB_25991:
	bts r12,1
	stc
LB_25992:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25989
	btr r12,0
	clc
	jmp LB_25990
LB_25989:
	bts r12,0
	stc
LB_25990:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_25984
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_26027
	btr r12,4
	jmp LB_26028
LB_26027:
	bts r12,4
LB_26028:
	mov r8,r9
	bt r12,3
	jc LB_26029
	btr r12,2
	jmp LB_26030
LB_26029:
	bts r12,2
LB_26030:
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
	jc LB_26033
	btr r12,3
	clc
	jmp LB_26034
LB_26033:
	bts r12,3
	stc
LB_26034:
	mov r13,r9
	bt r12,3
	jc LB_26031
	btr r12,0
	jmp LB_26032
LB_26031:
	bts r12,0
LB_26032:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_26037
	btr r12,3
	clc
	jmp LB_26038
LB_26037:
	bts r12,3
	stc
LB_26038:
	mov r14,r9
	bt r12,3
	jc LB_26035
	btr r12,1
	jmp LB_26036
LB_26035:
	bts r12,1
LB_26036:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_25336 %_25337 } ⊢ %_25338 : %_25338
 ; {>  %_25336~{ 0' 1' }:{ _stg _p21294 } %_25337~2':(_lst)◂({ _stg _p21294 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f21309 %_25338 ⊢ %_25339 : %_25339
 ; {>  %_25338~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p21294 }) }
; _f21309 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_25339 ⊢ %_25340 : %_25340
 ; {>  %_25339~°5◂°0◂{ { 0' 1' } 2' }:_p21291 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_25340
 ; {>  %_25340~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p21291) }
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
	jc LB_25974
	btr r12,5
	jmp LB_25975
LB_25974:
	bts r12,5
LB_25975:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_25972
	btr QWORD [rdi],0
	jmp LB_25973
LB_25972:
	bts QWORD [rdi],0
LB_25973:
	mov r11,r14
	bt r12,1
	jc LB_25978
	btr r12,5
	jmp LB_25979
LB_25978:
	bts r12,5
LB_25979:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_25976
	btr QWORD [rdi],1
	jmp LB_25977
LB_25976:
	bts QWORD [rdi],1
LB_25977:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_25970
	btr QWORD [rdi],0
	jmp LB_25971
LB_25970:
	bts QWORD [rdi],0
LB_25971:
	mov r10,r8
	bt r12,2
	jc LB_25982
	btr r12,4
	jmp LB_25983
LB_25982:
	bts r12,4
LB_25983:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_25980
	btr QWORD [rdi],1
	jmp LB_25981
LB_25980:
	bts QWORD [rdi],1
LB_25981:
	mov rsi,1
	bt r12,3
	jc LB_25968
	mov rsi,0
	bt r9,0
	jc LB_25968
	jmp LB_25969
LB_25968:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25969:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_25966
	mov rsi,0
	bt r9,0
	jc LB_25966
	jmp LB_25967
LB_25966:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_25967:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_25984:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_25986
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_25985
LB_25986:
	add rsp,8
	ret
LB_25988:
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
LB_25987:
	add rsp,64
	pop r14
LB_25985:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_26056
LB_26055:
	add r14,1
LB_26056:
	cmp r14,r10
	jge LB_26057
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26055
	cmp al,10
	jz LB_26055
	cmp al,32
	jz LB_26055
LB_26057:
	push r10
	call NS_E_25252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26058
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26052
LB_26058:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26053
	btr r12,0
	clc
	jmp LB_26054
LB_26053:
	bts r12,0
	stc
LB_26054:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_26049
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_26060
	btr r12,2
	jmp LB_26061
LB_26060:
	bts r12,2
LB_26061:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_26064
	btr r12,3
	clc
	jmp LB_26065
LB_26064:
	bts r12,3
	stc
LB_26065:
	mov r13,r9
	bt r12,3
	jc LB_26062
	btr r12,0
	jmp LB_26063
LB_26062:
	bts r12,0
LB_26063:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_26068
	btr r12,3
	clc
	jmp LB_26069
LB_26068:
	bts r12,3
	stc
LB_26069:
	mov r14,r9
	bt r12,3
	jc LB_26066
	btr r12,1
	jmp LB_26067
LB_26066:
	bts r12,1
LB_26067:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21308 %_25341 ⊢ %_25342 : %_25342
 ; {>  %_25341~{ 0' 1' }:{ _stg _p21294 } }
; _f21308 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_25342 ⊢ %_25343 : %_25343
 ; {>  %_25342~°4◂{ 0' 1' }:_p21291 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_25343
 ; {>  %_25343~°0◂°4◂{ 0' 1' }:(_opn)◂(_p21291) }
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
	jc LB_26043
	btr r12,2
	jmp LB_26044
LB_26043:
	bts r12,2
LB_26044:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_26041
	btr QWORD [rdi],0
	jmp LB_26042
LB_26041:
	bts QWORD [rdi],0
LB_26042:
	mov r8,r14
	bt r12,1
	jc LB_26047
	btr r12,2
	jmp LB_26048
LB_26047:
	bts r12,2
LB_26048:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_26045
	btr QWORD [rdi],1
	jmp LB_26046
LB_26045:
	bts QWORD [rdi],1
LB_26046:
	mov rsi,1
	bt r12,3
	jc LB_26039
	mov rsi,0
	bt r9,0
	jc LB_26039
	jmp LB_26040
LB_26039:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26040:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26049:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26051
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26050
LB_26051:
	add rsp,8
	ret
LB_26052:
	add rsp,16
	pop r14
LB_26050:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_26071
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_25344
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_25344 ⊢ %_25345 : %_25345
 ; {>  %_25344~0':_stg }
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
; _none {  } ⊢ %_25346 : %_25346
 ; {>  %_25345~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_25346
 ; {>  %_25346~°1◂{  }:(_opn)◂(t12385'(0)) %_25345~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_26070
	mov rdi,r13
	call dlt
LB_26070:
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
LB_26071:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26073
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26072
LB_26073:
	add rsp,8
	ret
LB_26074:
	add rsp,0
	pop r14
LB_26072:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25252:
NS_E_RDI_25252:
NS_E_25252_ETR_TBL:
NS_E_25252_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_26108
LB_26107:
	add r14,1
LB_26108:
	cmp r14,r10
	jge LB_26109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26107
	cmp al,10
	jz LB_26107
	cmp al,32
	jz LB_26107
LB_26109:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26110
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26089
LB_26110:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_26113
LB_26112:
	add r14,1
LB_26113:
	cmp r14,r10
	jge LB_26114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26112
	cmp al,10
	jz LB_26112
	cmp al,32
	jz LB_26112
LB_26114:
	push r10
	call NS_E_25254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26115
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26116
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26116:
	jmp LB_26089
LB_26115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_26119
LB_26118:
	add r14,1
LB_26119:
	cmp r14,r10
	jge LB_26120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26118
	cmp al,10
	jz LB_26118
	cmp al,32
	jz LB_26118
LB_26120:
	add r14,1
	cmp r14,r10
	jg LB_26125
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_26125
	jmp LB_26126
LB_26125:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26122
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26123:
	jmp LB_26089
LB_26126:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_26100
LB_26099:
	add r14,1
LB_26100:
	cmp r14,r10
	jge LB_26101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26099
	cmp al,10
	jz LB_26099
	cmp al,32
	jz LB_26099
LB_26101:
	push r10
	call NS_E_24931_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26102
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26103
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26103:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26104
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26104:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26105
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26105:
	jmp LB_26090
LB_26102:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26097
	btr r12,3
	clc
	jmp LB_26098
LB_26097:
	bts r12,3
	stc
LB_26098:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26095
	btr r12,2
	clc
	jmp LB_26096
LB_26095:
	bts r12,2
	stc
LB_26096:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26093
	btr r12,1
	clc
	jmp LB_26094
LB_26093:
	bts r12,1
	stc
LB_26094:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26091
	btr r12,0
	clc
	jmp LB_26092
LB_26091:
	bts r12,0
	stc
LB_26092:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_26086
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_26127
	btr r12,4
	jmp LB_26128
LB_26127:
	bts r12,4
LB_26128:
	mov r8,r9
	bt r12,3
	jc LB_26129
	btr r12,2
	jmp LB_26130
LB_26129:
	bts r12,2
LB_26130:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f21316 %_25349 ⊢ %_25350 : %_25350
 ; {>  %_25347~0':_stg %_25349~2':_p21303 %_25348~1':_p25253 }
; _f21316 2' ⊢ °1◂2'
; _some { %_25347 %_25350 } ⊢ %_25351 : %_25351
 ; {>  %_25350~°1◂2':_p21294 %_25347~0':_stg %_25348~1':_p25253 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_25351
 ; {>  %_25351~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p21294 }) %_25348~1':_p25253 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_26075
	mov rdi,r14
	call dlt
LB_26075:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_26078
	btr r12,1
	jmp LB_26079
LB_26078:
	bts r12,1
LB_26079:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_26076
	btr QWORD [rdi],0
	jmp LB_26077
LB_26076:
	bts QWORD [rdi],0
LB_26077:
	mov r14,r8
	bt r12,2
	jc LB_26084
	btr r12,1
	jmp LB_26085
LB_26084:
	bts r12,1
LB_26085:
	mov rsi,1
	bt r12,1
	jc LB_26082
	mov rsi,0
	bt r14,0
	jc LB_26082
	jmp LB_26083
LB_26082:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_26083:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_26080
	btr QWORD [rdi],1
	jmp LB_26081
LB_26080:
	bts QWORD [rdi],1
LB_26081:
	mov r8,0
	bts r12,2
	ret
LB_26086:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26088
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26087
LB_26088:
	add rsp,8
	ret
LB_26090:
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
LB_26089:
	add rsp,64
	pop r14
LB_26087:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_26177
LB_26176:
	add r14,1
LB_26177:
	cmp r14,r10
	jge LB_26178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26176
	cmp al,10
	jz LB_26176
	cmp al,32
	jz LB_26176
LB_26178:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26179
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26161
LB_26179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_26182
LB_26181:
	add r14,1
LB_26182:
	cmp r14,r10
	jge LB_26183
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26181
	cmp al,10
	jz LB_26181
	cmp al,32
	jz LB_26181
LB_26183:
	push r10
	call NS_E_25254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26184
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26185
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26185:
	jmp LB_26161
LB_26184:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_26188
LB_26187:
	add r14,1
LB_26188:
	cmp r14,r10
	jge LB_26189
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26187
	cmp al,10
	jz LB_26187
	cmp al,32
	jz LB_26187
LB_26189:
	add r14,3
	cmp r14,r10
	jg LB_26194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_26194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_26194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_26194
	jmp LB_26195
LB_26194:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26191
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26191:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26192:
	jmp LB_26161
LB_26195:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_26197
LB_26196:
	add r14,1
LB_26197:
	cmp r14,r10
	jge LB_26198
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26196
	cmp al,10
	jz LB_26196
	cmp al,32
	jz LB_26196
LB_26198:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26199
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26200
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26200:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26201
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26201:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26202
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26202:
	jmp LB_26161
LB_26199:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_26205
LB_26204:
	add r14,1
LB_26205:
	cmp r14,r10
	jge LB_26206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26204
	cmp al,10
	jz LB_26204
	cmp al,32
	jz LB_26204
LB_26206:
	add r14,1
	cmp r14,r10
	jg LB_26213
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_26213
	jmp LB_26214
LB_26213:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26208
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26208:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26209
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26209:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26210
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26210:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26211
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26211:
	jmp LB_26161
LB_26214:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_26216
LB_26215:
	add r14,1
LB_26216:
	cmp r14,r10
	jge LB_26217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26215
	cmp al,10
	jz LB_26215
	cmp al,32
	jz LB_26215
LB_26217:
	push r10
	call NS_E_24931_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26218
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_26219
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_26219:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26220
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26220:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26221
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26221:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26222
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26222:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26223
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26223:
	jmp LB_26161
LB_26218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_26226
LB_26225:
	add r14,1
LB_26226:
	cmp r14,r10
	jge LB_26227
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26225
	cmp al,10
	jz LB_26225
	cmp al,32
	jz LB_26225
LB_26227:
	push r10
	call NS_E_25256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26228
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_26229
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_26229:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_26230
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_26230:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26231
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26231:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26232
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26232:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26233
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26233:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26234
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26234:
	jmp LB_26161
LB_26228:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_26174
	btr r12,6
	clc
	jmp LB_26175
LB_26174:
	bts r12,6
	stc
LB_26175:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_26172
	btr r12,5
	clc
	jmp LB_26173
LB_26172:
	bts r12,5
	stc
LB_26173:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_26170
	btr r12,4
	clc
	jmp LB_26171
LB_26170:
	bts r12,4
	stc
LB_26171:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26168
	btr r12,3
	clc
	jmp LB_26169
LB_26168:
	bts r12,3
	stc
LB_26169:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26166
	btr r12,2
	clc
	jmp LB_26167
LB_26166:
	bts r12,2
	stc
LB_26167:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26164
	btr r12,1
	clc
	jmp LB_26165
LB_26164:
	bts r12,1
	stc
LB_26165:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26162
	btr r12,0
	clc
	jmp LB_26163
LB_26162:
	bts r12,0
	stc
LB_26163:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_26158
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_26236
	btr r12,7
	jmp LB_26237
LB_26236:
	bts r12,7
LB_26237:
	mov r10,rcx
	bt r12,6
	jc LB_26238
	btr r12,4
	jmp LB_26239
LB_26238:
	bts r12,4
LB_26239:
	mov rcx,r9
	bt r12,3
	jc LB_26240
	btr r12,6
	jmp LB_26241
LB_26240:
	bts r12,6
LB_26241:
	mov r9,r11
	bt r12,5
	jc LB_26242
	btr r12,3
	jmp LB_26243
LB_26242:
	bts r12,3
LB_26243:
	mov r11,r8
	bt r12,2
	jc LB_26244
	btr r12,5
	jmp LB_26245
LB_26244:
	bts r12,5
LB_26245:
	mov r8,rcx
	bt r12,6
	jc LB_26246
	btr r12,2
	jmp LB_26247
LB_26246:
	bts r12,2
LB_26247:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_25354 %_25355 } %_25356 } ⊢ %_25357 : %_25357
 ; {>  %_25356~4':(_lst)◂({ _stg _p21303 }) %_25355~3':_p21303 %_25353~1':_p25253 %_25354~2':_stg %_25352~0':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f21315 %_25357 ⊢ %_25358 : %_25358
 ; {>  %_25353~1':_p25253 %_25352~0':_stg %_25357~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p21303 }) }
; _f21315 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_25352 %_25358 } ⊢ %_25359 : %_25359
 ; {>  %_25358~°0◂°0◂{ { 2' 3' } 4' }:_p21294 %_25353~1':_p25253 %_25352~0':_stg }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_25359
 ; {>  %_25359~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p21294 }) %_25353~1':_p25253 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_26131
	mov rdi,r14
	call dlt
LB_26131:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_26132
	btr r12,1
	jmp LB_26133
LB_26132:
	bts r12,1
LB_26133:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_26136
	btr r12,5
	jmp LB_26137
LB_26136:
	bts r12,5
LB_26137:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_26134
	btr QWORD [rdi],0
	jmp LB_26135
LB_26134:
	bts QWORD [rdi],0
LB_26135:
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
	jc LB_26148
	btr r12,6
	jmp LB_26149
LB_26148:
	bts r12,6
LB_26149:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_26146
	btr QWORD [rdi],0
	jmp LB_26147
LB_26146:
	bts QWORD [rdi],0
LB_26147:
	mov rcx,r14
	bt r12,1
	jc LB_26152
	btr r12,6
	jmp LB_26153
LB_26152:
	bts r12,6
LB_26153:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_26150
	btr QWORD [rdi],1
	jmp LB_26151
LB_26150:
	bts QWORD [rdi],1
LB_26151:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_26144
	btr QWORD [rdi],0
	jmp LB_26145
LB_26144:
	bts QWORD [rdi],0
LB_26145:
	mov r13,r10
	bt r12,4
	jc LB_26156
	btr r12,0
	jmp LB_26157
LB_26156:
	bts r12,0
LB_26157:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_26154
	btr QWORD [rdi],1
	jmp LB_26155
LB_26154:
	bts QWORD [rdi],1
LB_26155:
	mov rsi,1
	bt r12,5
	jc LB_26142
	mov rsi,0
	bt r11,0
	jc LB_26142
	jmp LB_26143
LB_26142:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_26143:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_26140
	mov rsi,0
	bt r11,0
	jc LB_26140
	jmp LB_26141
LB_26140:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_26141:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_26138
	btr QWORD [rdi],1
	jmp LB_26139
LB_26138:
	bts QWORD [rdi],1
LB_26139:
	mov r8,0
	bts r12,2
	ret
LB_26158:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26160
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26159
LB_26160:
	add rsp,8
	ret
LB_26161:
	add rsp,112
	pop r14
LB_26159:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25254:
NS_E_RDI_25254:
NS_E_25254_ETR_TBL:
NS_E_25254_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_26262
LB_26261:
	add r14,1
LB_26262:
	cmp r14,r10
	jge LB_26263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26261
	cmp al,10
	jz LB_26261
	cmp al,32
	jz LB_26261
LB_26263:
	add r14,3
	cmp r14,r10
	jg LB_26266
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_26266
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_26266
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_26266
	jmp LB_26267
LB_26266:
	jmp LB_26248
LB_26267:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_26256
LB_26255:
	add r14,1
LB_26256:
	cmp r14,r10
	jge LB_26257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26255
	cmp al,10
	jz LB_26255
	cmp al,32
	jz LB_26255
LB_26257:
	push r10
	call NS_E_24935_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26258
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26259:
	jmp LB_26249
LB_26258:
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
	jc LB_26252
	btr QWORD [rdi],1
LB_26252:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26253
	btr QWORD [rdi],0
LB_26253:
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
LB_26249:
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
LB_26248:
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
LB_26250:
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
NS_E_25255:
NS_E_RDI_25255:
NS_E_25255_ETR_TBL:
NS_E_25255_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_26321
LB_26320:
	add r14,1
LB_26321:
	cmp r14,r10
	jge LB_26322
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26320
	cmp al,10
	jz LB_26320
	cmp al,32
	jz LB_26320
LB_26322:
	add r14,1
	cmp r14,r10
	jg LB_26325
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_26325
	jmp LB_26326
LB_26325:
	jmp LB_26287
LB_26326:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_26298
LB_26297:
	add r14,1
LB_26298:
	cmp r14,r10
	jge LB_26299
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26297
	cmp al,10
	jz LB_26297
	cmp al,32
	jz LB_26297
LB_26299:
	add r14,1
	cmp r14,r10
	jg LB_26303
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_26303
	jmp LB_26304
LB_26303:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26301
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26301:
	jmp LB_26288
LB_26304:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_26306
LB_26305:
	add r14,1
LB_26306:
	cmp r14,r10
	jge LB_26307
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26305
	cmp al,10
	jz LB_26305
	cmp al,32
	jz LB_26305
LB_26307:
	push r10
	call NS_E_25252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26308
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26309
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26309:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26310:
	jmp LB_26288
LB_26308:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_26313
LB_26312:
	add r14,1
LB_26313:
	cmp r14,r10
	jge LB_26314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26312
	cmp al,10
	jz LB_26312
	cmp al,32
	jz LB_26312
LB_26314:
	push r10
	call NS_E_25255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26315
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26316
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26316:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26317
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26317:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26318:
	jmp LB_26288
LB_26315:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26295
	btr r12,3
	clc
	jmp LB_26296
LB_26295:
	bts r12,3
	stc
LB_26296:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26293
	btr r12,2
	clc
	jmp LB_26294
LB_26293:
	bts r12,2
	stc
LB_26294:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26291
	btr r12,1
	clc
	jmp LB_26292
LB_26291:
	bts r12,1
	stc
LB_26292:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26289
	btr r12,0
	clc
	jmp LB_26290
LB_26289:
	bts r12,0
	stc
LB_26290:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_26284
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_26327
	btr r12,4
	jmp LB_26328
LB_26327:
	bts r12,4
LB_26328:
	mov r8,r9
	bt r12,3
	jc LB_26329
	btr r12,2
	jmp LB_26330
LB_26329:
	bts r12,2
LB_26330:
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
	jc LB_26333
	btr r12,3
	clc
	jmp LB_26334
LB_26333:
	bts r12,3
	stc
LB_26334:
	mov r13,r9
	bt r12,3
	jc LB_26331
	btr r12,0
	jmp LB_26332
LB_26331:
	bts r12,0
LB_26332:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_26337
	btr r12,3
	clc
	jmp LB_26338
LB_26337:
	bts r12,3
	stc
LB_26338:
	mov r14,r9
	bt r12,3
	jc LB_26335
	btr r12,1
	jmp LB_26336
LB_26335:
	bts r12,1
LB_26336:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_25362 %_25363 } ⊢ %_25364 : %_25364
 ; {>  %_25363~2':(_lst)◂({ _stg _p21294 }) %_25362~{ 0' 1' }:{ _stg _p21294 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_25364 ⊢ %_25365 : %_25365
 ; {>  %_25364~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p21294 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_25365
 ; {>  %_25365~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p21294 })) }
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
	jc LB_26274
	btr r12,5
	jmp LB_26275
LB_26274:
	bts r12,5
LB_26275:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_26272
	btr QWORD [rdi],0
	jmp LB_26273
LB_26272:
	bts QWORD [rdi],0
LB_26273:
	mov r11,r14
	bt r12,1
	jc LB_26278
	btr r12,5
	jmp LB_26279
LB_26278:
	bts r12,5
LB_26279:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_26276
	btr QWORD [rdi],1
	jmp LB_26277
LB_26276:
	bts QWORD [rdi],1
LB_26277:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_26270
	btr QWORD [rdi],0
	jmp LB_26271
LB_26270:
	bts QWORD [rdi],0
LB_26271:
	mov r10,r8
	bt r12,2
	jc LB_26282
	btr r12,4
	jmp LB_26283
LB_26282:
	bts r12,4
LB_26283:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_26280
	btr QWORD [rdi],1
	jmp LB_26281
LB_26280:
	bts QWORD [rdi],1
LB_26281:
	mov rsi,1
	bt r12,3
	jc LB_26268
	mov rsi,0
	bt r9,0
	jc LB_26268
	jmp LB_26269
LB_26268:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26269:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26284:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26286
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26285
LB_26286:
	add rsp,8
	ret
LB_26288:
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
LB_26287:
	add rsp,64
	pop r14
LB_26285:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_26341
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_25366 : %_25366
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_25366 ⊢ %_25367 : %_25367
 ; {>  %_25366~°1◂{  }:(_lst)◂(t12412'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25367
 ; {>  %_25367~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12415'(0))) }
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
	jc LB_26339
	mov rsi,0
	bt r9,0
	jc LB_26339
	jmp LB_26340
LB_26339:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26340:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26341:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26343
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26342
LB_26343:
	add rsp,8
	ret
LB_26344:
	add rsp,0
	pop r14
LB_26342:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25256:
NS_E_RDI_25256:
NS_E_25256_ETR_TBL:
NS_E_25256_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_26409
LB_26408:
	add r14,1
LB_26409:
	cmp r14,r10
	jge LB_26410
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26408
	cmp al,10
	jz LB_26408
	cmp al,32
	jz LB_26408
LB_26410:
	add r14,3
	cmp r14,r10
	jg LB_26413
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_26413
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_26413
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_26413
	jmp LB_26414
LB_26413:
	jmp LB_26364
LB_26414:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_26377
LB_26376:
	add r14,1
LB_26377:
	cmp r14,r10
	jge LB_26378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26376
	cmp al,10
	jz LB_26376
	cmp al,32
	jz LB_26376
LB_26378:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26379
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26380
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26380:
	jmp LB_26365
LB_26379:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_26383
LB_26382:
	add r14,1
LB_26383:
	cmp r14,r10
	jge LB_26384
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26382
	cmp al,10
	jz LB_26382
	cmp al,32
	jz LB_26382
LB_26384:
	add r14,1
	cmp r14,r10
	jg LB_26389
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_26389
	jmp LB_26390
LB_26389:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26386
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26386:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26387
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26387:
	jmp LB_26365
LB_26390:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_26392
LB_26391:
	add r14,1
LB_26392:
	cmp r14,r10
	jge LB_26393
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26391
	cmp al,10
	jz LB_26391
	cmp al,32
	jz LB_26391
LB_26393:
	push r10
	call NS_E_24931_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26394
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26395
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26395:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26396
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26396:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26397:
	jmp LB_26365
LB_26394:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_26400
LB_26399:
	add r14,1
LB_26400:
	cmp r14,r10
	jge LB_26401
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26399
	cmp al,10
	jz LB_26399
	cmp al,32
	jz LB_26399
LB_26401:
	push r10
	call NS_E_25256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26402
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26403
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26403:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26404
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26404:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26405
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26405:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26406:
	jmp LB_26365
LB_26402:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_26374
	btr r12,4
	clc
	jmp LB_26375
LB_26374:
	bts r12,4
	stc
LB_26375:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26372
	btr r12,3
	clc
	jmp LB_26373
LB_26372:
	bts r12,3
	stc
LB_26373:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26370
	btr r12,2
	clc
	jmp LB_26371
LB_26370:
	bts r12,2
	stc
LB_26371:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26368
	btr r12,1
	clc
	jmp LB_26369
LB_26368:
	bts r12,1
	stc
LB_26369:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26366
	btr r12,0
	clc
	jmp LB_26367
LB_26366:
	bts r12,0
	stc
LB_26367:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_26361
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_26415
	btr r12,5
	jmp LB_26416
LB_26415:
	bts r12,5
LB_26416:
	mov r8,r10
	bt r12,4
	jc LB_26417
	btr r12,2
	jmp LB_26418
LB_26417:
	bts r12,2
LB_26418:
	mov r10,r14
	bt r12,1
	jc LB_26419
	btr r12,4
	jmp LB_26420
LB_26419:
	bts r12,4
LB_26420:
	mov r14,r9
	bt r12,3
	jc LB_26421
	btr r12,1
	jmp LB_26422
LB_26421:
	bts r12,1
LB_26422:
	mov r9,r13
	bt r12,0
	jc LB_26423
	btr r12,3
	jmp LB_26424
LB_26423:
	bts r12,3
LB_26424:
	mov r13,r10
	bt r12,4
	jc LB_26425
	btr r12,0
	jmp LB_26426
LB_26425:
	bts r12,0
LB_26426:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_25368 %_25369 } %_25370 } ⊢ %_25371 : %_25371
 ; {>  %_25370~2':(_lst)◂({ _stg _p21303 }) %_25369~1':_p21303 %_25368~0':_stg }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_25371 ⊢ %_25372 : %_25372
 ; {>  %_25371~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p21303 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_25372
 ; {>  %_25372~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p21303 })) }
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
	jc LB_26351
	btr r12,5
	jmp LB_26352
LB_26351:
	bts r12,5
LB_26352:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_26349
	btr QWORD [rdi],0
	jmp LB_26350
LB_26349:
	bts QWORD [rdi],0
LB_26350:
	mov r11,r14
	bt r12,1
	jc LB_26355
	btr r12,5
	jmp LB_26356
LB_26355:
	bts r12,5
LB_26356:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_26353
	btr QWORD [rdi],1
	jmp LB_26354
LB_26353:
	bts QWORD [rdi],1
LB_26354:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_26347
	btr QWORD [rdi],0
	jmp LB_26348
LB_26347:
	bts QWORD [rdi],0
LB_26348:
	mov r10,r8
	bt r12,2
	jc LB_26359
	btr r12,4
	jmp LB_26360
LB_26359:
	bts r12,4
LB_26360:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_26357
	btr QWORD [rdi],1
	jmp LB_26358
LB_26357:
	bts QWORD [rdi],1
LB_26358:
	mov rsi,1
	bt r12,3
	jc LB_26345
	mov rsi,0
	bt r9,0
	jc LB_26345
	jmp LB_26346
LB_26345:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26346:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26361:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26363
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26362
LB_26363:
	add rsp,8
	ret
LB_26365:
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
LB_26364:
	add rsp,80
	pop r14
LB_26362:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_26429
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_25373 : %_25373
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_25373 ⊢ %_25374 : %_25374
 ; {>  %_25373~°1◂{  }:(_lst)◂(t12426'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25374
 ; {>  %_25374~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12429'(0))) }
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
	jc LB_26427
	mov rsi,0
	bt r9,0
	jc LB_26427
	jmp LB_26428
LB_26427:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26428:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26429:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26431
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26430
LB_26431:
	add rsp,8
	ret
LB_26432:
	add rsp,0
	pop r14
LB_26430:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25257:
NS_E_RDI_25257:
NS_E_25257_ETR_TBL:
NS_E_25257_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_26523
LB_26522:
	add r14,1
LB_26523:
	cmp r14,r10
	jge LB_26524
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26522
	cmp al,10
	jz LB_26522
	cmp al,32
	jz LB_26522
LB_26524:
	add r14,1
	cmp r14,r10
	jg LB_26527
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_26527
	jmp LB_26528
LB_26527:
	jmp LB_26470
LB_26528:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_26485
LB_26484:
	add r14,1
LB_26485:
	cmp r14,r10
	jge LB_26486
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26484
	cmp al,10
	jz LB_26484
	cmp al,32
	jz LB_26484
LB_26486:
	add r14,1
	cmp r14,r10
	jg LB_26490
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_26490
	jmp LB_26491
LB_26490:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26488
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26488:
	jmp LB_26471
LB_26491:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_26493
LB_26492:
	add r14,1
LB_26493:
	cmp r14,r10
	jge LB_26494
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26492
	cmp al,10
	jz LB_26492
	cmp al,32
	jz LB_26492
LB_26494:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26495
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26496
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26496:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26497
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26497:
	jmp LB_26471
LB_26495:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_26500
LB_26499:
	add r14,1
LB_26500:
	cmp r14,r10
	jge LB_26501
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26499
	cmp al,10
	jz LB_26499
	cmp al,32
	jz LB_26499
LB_26501:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26502
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26503
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26503:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26504
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26504:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26505
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26505:
	jmp LB_26471
LB_26502:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_26508
LB_26507:
	add r14,1
LB_26508:
	cmp r14,r10
	jge LB_26509
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26507
	cmp al,10
	jz LB_26507
	cmp al,32
	jz LB_26507
LB_26509:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26510
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26511
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26511:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26512
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26512:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26513
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26513:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26514
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26514:
	jmp LB_26471
LB_26510:
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
LB_26520:
	jmp LB_26517
LB_26516:
	add r14,1
LB_26517:
	cmp r14,r10
	jge LB_26518
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26516
	cmp al,10
	jz LB_26516
	cmp al,32
	jz LB_26516
LB_26518:
	push r10
	push rsi
	call NS_E_25258_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_26519
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_26521
	bts QWORD [rax],0
LB_26521:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_26520
LB_26519:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_26482
	btr r12,5
	clc
	jmp LB_26483
LB_26482:
	bts r12,5
	stc
LB_26483:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_26480
	btr r12,4
	clc
	jmp LB_26481
LB_26480:
	bts r12,4
	stc
LB_26481:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26478
	btr r12,3
	clc
	jmp LB_26479
LB_26478:
	bts r12,3
	stc
LB_26479:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26476
	btr r12,2
	clc
	jmp LB_26477
LB_26476:
	bts r12,2
	stc
LB_26477:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26474
	btr r12,1
	clc
	jmp LB_26475
LB_26474:
	bts r12,1
	stc
LB_26475:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26472
	btr r12,0
	clc
	jmp LB_26473
LB_26472:
	bts r12,0
	stc
LB_26473:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_26467
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_26529
	btr r12,6
	jmp LB_26530
LB_26529:
	bts r12,6
LB_26530:
	mov r9,r11
	bt r12,5
	jc LB_26531
	btr r12,3
	jmp LB_26532
LB_26531:
	bts r12,3
LB_26532:
	mov r11,r8
	bt r12,2
	jc LB_26533
	btr r12,5
	jmp LB_26534
LB_26533:
	bts r12,5
LB_26534:
	mov r8,r10
	bt r12,4
	jc LB_26535
	btr r12,2
	jmp LB_26536
LB_26535:
	bts r12,2
LB_26536:
	mov r10,r14
	bt r12,1
	jc LB_26537
	btr r12,4
	jmp LB_26538
LB_26537:
	bts r12,4
LB_26538:
	mov r14,rcx
	bt r12,6
	jc LB_26539
	btr r12,1
	jmp LB_26540
LB_26539:
	bts r12,1
LB_26540:
	mov rcx,r13
	bt r12,0
	jc LB_26541
	btr r12,6
	jmp LB_26542
LB_26541:
	bts r12,6
LB_26542:
	mov r13,r11
	bt r12,5
	jc LB_26543
	btr r12,0
	jmp LB_26544
LB_26543:
	bts r12,0
LB_26544:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f20435 %_25378 ⊢ %_25379 : %_25379
 ; {>  %_25378~3':(_lst)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) %_25377~2':(_p21259)◂(_stg) %_25376~1':(_p21246)◂((_p21254)◂(_stg)) %_25375~0':_stg }
; _f20435 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_26439
	btr r12,0
	jmp LB_26440
LB_26439:
	bts r12,0
LB_26440:
	call NS_E_20435
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_26441
	btr r12,3
	jmp LB_26442
LB_26441:
	bts r12,3
LB_26442:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_26437
	btr r12,2
	clc
	jmp LB_26438
LB_26437:
	bts r12,2
	stc
LB_26438:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_26435
	btr r12,1
	clc
	jmp LB_26436
LB_26435:
	bts r12,1
	stc
LB_26436:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_26433
	btr r12,0
	clc
	jmp LB_26434
LB_26433:
	bts r12,0
	stc
LB_26434:
	add rsp,32
; _cns { { %_25375 %_25376 %_25377 } %_25379 } ⊢ %_25380 : %_25380
 ; {>  %_25377~2':(_p21259)◂(_stg) %_25376~1':(_p21246)◂((_p21254)◂(_stg)) %_25379~3':(_lst)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) %_25375~0':_stg }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f21307 %_25380 ⊢ %_25381 : %_25381
 ; {>  %_25380~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) }
; _f21307 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_25381 ⊢ %_25382 : %_25382
 ; {>  %_25381~°3◂°0◂{ { 0' 1' 2' } 3' }:_p21291 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_25382
 ; {>  %_25382~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p21291) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_26443
	btr r12,4
	jmp LB_26444
LB_26443:
	bts r12,4
LB_26444:
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
	jc LB_26453
	btr r12,6
	jmp LB_26454
LB_26453:
	bts r12,6
LB_26454:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_26451
	btr QWORD [rdi],0
	jmp LB_26452
LB_26451:
	bts QWORD [rdi],0
LB_26452:
	mov rcx,r14
	bt r12,1
	jc LB_26457
	btr r12,6
	jmp LB_26458
LB_26457:
	bts r12,6
LB_26458:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_26455
	btr QWORD [rdi],1
	jmp LB_26456
LB_26455:
	bts QWORD [rdi],1
LB_26456:
	mov rcx,r8
	bt r12,2
	jc LB_26461
	btr r12,6
	jmp LB_26462
LB_26461:
	bts r12,6
LB_26462:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_26459
	btr QWORD [rdi],2
	jmp LB_26460
LB_26459:
	bts QWORD [rdi],2
LB_26460:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_26449
	btr QWORD [rdi],0
	jmp LB_26450
LB_26449:
	bts QWORD [rdi],0
LB_26450:
	mov r11,r10
	bt r12,4
	jc LB_26465
	btr r12,5
	jmp LB_26466
LB_26465:
	bts r12,5
LB_26466:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_26463
	btr QWORD [rdi],1
	jmp LB_26464
LB_26463:
	bts QWORD [rdi],1
LB_26464:
	mov rsi,1
	bt r12,3
	jc LB_26447
	mov rsi,0
	bt r9,0
	jc LB_26447
	jmp LB_26448
LB_26447:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26448:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_26445
	mov rsi,0
	bt r9,0
	jc LB_26445
	jmp LB_26446
LB_26445:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26446:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26467:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26469
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26468
LB_26469:
	add rsp,8
	ret
LB_26471:
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
LB_26470:
	add rsp,96
	pop r14
LB_26468:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_26564
LB_26563:
	add r14,1
LB_26564:
	cmp r14,r10
	jge LB_26565
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26563
	cmp al,10
	jz LB_26563
	cmp al,32
	jz LB_26563
LB_26565:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26566
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26558
LB_26566:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_26569
LB_26568:
	add r14,1
LB_26569:
	cmp r14,r10
	jge LB_26570
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26568
	cmp al,10
	jz LB_26568
	cmp al,32
	jz LB_26568
LB_26570:
	push r10
	call NS_E_25259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26571
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26572
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26572:
	jmp LB_26558
LB_26571:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26561
	btr r12,1
	clc
	jmp LB_26562
LB_26561:
	bts r12,1
	stc
LB_26562:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26559
	btr r12,0
	clc
	jmp LB_26560
LB_26559:
	bts r12,0
	stc
LB_26560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_26555
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f21306 { %_25383 %_25384 } ⊢ %_25385 : %_25385
 ; {>  %_25384~1':_p21293 %_25383~0':_stg }
; _f21306 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_25385 ⊢ %_25386 : %_25386
 ; {>  %_25385~°2◂{ 0' 1' }:_p21291 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_25386
 ; {>  %_25386~°0◂°2◂{ 0' 1' }:(_opn)◂(_p21291) }
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
	jc LB_26549
	btr r12,2
	jmp LB_26550
LB_26549:
	bts r12,2
LB_26550:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_26547
	btr QWORD [rdi],0
	jmp LB_26548
LB_26547:
	bts QWORD [rdi],0
LB_26548:
	mov r8,r14
	bt r12,1
	jc LB_26553
	btr r12,2
	jmp LB_26554
LB_26553:
	bts r12,2
LB_26554:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_26551
	btr QWORD [rdi],1
	jmp LB_26552
LB_26551:
	bts QWORD [rdi],1
LB_26552:
	mov rsi,1
	bt r12,3
	jc LB_26545
	mov rsi,0
	bt r9,0
	jc LB_26545
	jmp LB_26546
LB_26545:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26546:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26555:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26557
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26556
LB_26557:
	add rsp,8
	ret
LB_26558:
	add rsp,32
	pop r14
LB_26556:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_26575
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_25387
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_25387 ⊢ %_25388 : %_25388
 ; {>  %_25387~0':_stg }
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
; _none {  } ⊢ %_25389 : %_25389
 ; {>  %_25388~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_25389
 ; {>  %_25389~°1◂{  }:(_opn)◂(t12456'(0)) %_25388~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_26574
	mov rdi,r13
	call dlt
LB_26574:
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
LB_26575:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26577
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26576
LB_26577:
	add rsp,8
	ret
LB_26578:
	add rsp,0
	pop r14
LB_26576:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25258:
NS_E_RDI_25258:
NS_E_25258_ETR_TBL:
NS_E_25258_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_26606
LB_26605:
	add r14,1
LB_26606:
	cmp r14,r10
	jge LB_26607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26605
	cmp al,10
	jz LB_26605
	cmp al,32
	jz LB_26605
LB_26607:
	add r14,1
	cmp r14,r10
	jg LB_26610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_26610
	jmp LB_26611
LB_26610:
	jmp LB_26594
LB_26611:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_26613
LB_26612:
	add r14,1
LB_26613:
	cmp r14,r10
	jge LB_26614
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26612
	cmp al,10
	jz LB_26612
	cmp al,32
	jz LB_26612
LB_26614:
	add r14,1
	cmp r14,r10
	jg LB_26618
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_26618
	jmp LB_26619
LB_26618:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26616
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26616:
	jmp LB_26594
LB_26619:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_26621
LB_26620:
	add r14,1
LB_26621:
	cmp r14,r10
	jge LB_26622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26620
	cmp al,10
	jz LB_26620
	cmp al,32
	jz LB_26620
LB_26622:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26623
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26624
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26624:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26625
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26625:
	jmp LB_26594
LB_26623:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_26628
LB_26627:
	add r14,1
LB_26628:
	cmp r14,r10
	jge LB_26629
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26627
	cmp al,10
	jz LB_26627
	cmp al,32
	jz LB_26627
LB_26629:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26630
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26631
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26631:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26632
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26632:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26633:
	jmp LB_26594
LB_26630:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_26636
LB_26635:
	add r14,1
LB_26636:
	cmp r14,r10
	jge LB_26637
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26635
	cmp al,10
	jz LB_26635
	cmp al,32
	jz LB_26635
LB_26637:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26638
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26639
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26639:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26640
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26640:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26641
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26641:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26642
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26642:
	jmp LB_26594
LB_26638:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_26603
	btr r12,4
	clc
	jmp LB_26604
LB_26603:
	bts r12,4
	stc
LB_26604:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26601
	btr r12,3
	clc
	jmp LB_26602
LB_26601:
	bts r12,3
	stc
LB_26602:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26599
	btr r12,2
	clc
	jmp LB_26600
LB_26599:
	bts r12,2
	stc
LB_26600:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26597
	btr r12,1
	clc
	jmp LB_26598
LB_26597:
	bts r12,1
	stc
LB_26598:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26595
	btr r12,0
	clc
	jmp LB_26596
LB_26595:
	bts r12,0
	stc
LB_26596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_26591
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_26644
	btr r12,5
	jmp LB_26645
LB_26644:
	bts r12,5
LB_26645:
	mov r8,r10
	bt r12,4
	jc LB_26646
	btr r12,2
	jmp LB_26647
LB_26646:
	bts r12,2
LB_26647:
	mov r10,r14
	bt r12,1
	jc LB_26648
	btr r12,4
	jmp LB_26649
LB_26648:
	bts r12,4
LB_26649:
	mov r14,r9
	bt r12,3
	jc LB_26650
	btr r12,1
	jmp LB_26651
LB_26650:
	bts r12,1
LB_26651:
	mov r9,r13
	bt r12,0
	jc LB_26652
	btr r12,3
	jmp LB_26653
LB_26652:
	bts r12,3
LB_26653:
	mov r13,r11
	bt r12,5
	jc LB_26654
	btr r12,0
	jmp LB_26655
LB_26654:
	bts r12,0
LB_26655:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_25390 %_25391 %_25392 } ⊢ %_25393 : %_25393
 ; {>  %_25392~2':(_p21259)◂(_stg) %_25391~1':(_p21246)◂((_p21254)◂(_stg)) %_25390~0':_stg }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_25393
 ; {>  %_25393~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) }) }
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
	jc LB_26581
	btr r12,4
	jmp LB_26582
LB_26581:
	bts r12,4
LB_26582:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_26579
	btr QWORD [rdi],0
	jmp LB_26580
LB_26579:
	bts QWORD [rdi],0
LB_26580:
	mov r10,r14
	bt r12,1
	jc LB_26585
	btr r12,4
	jmp LB_26586
LB_26585:
	bts r12,4
LB_26586:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_26583
	btr QWORD [rdi],1
	jmp LB_26584
LB_26583:
	bts QWORD [rdi],1
LB_26584:
	mov r10,r8
	bt r12,2
	jc LB_26589
	btr r12,4
	jmp LB_26590
LB_26589:
	bts r12,4
LB_26590:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_26587
	btr QWORD [rdi],2
	jmp LB_26588
LB_26587:
	bts QWORD [rdi],2
LB_26588:
	mov r8,0
	bts r12,2
	ret
LB_26591:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26593
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26592
LB_26593:
	add rsp,8
	ret
LB_26594:
	add rsp,80
	pop r14
LB_26592:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25259:
NS_E_RDI_25259:
NS_E_25259_ETR_TBL:
NS_E_25259_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_26676
LB_26675:
	add r14,1
LB_26676:
	cmp r14,r10
	jge LB_26677
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26675
	cmp al,10
	jz LB_26675
	cmp al,32
	jz LB_26675
LB_26677:
	add r14,1
	cmp r14,r10
	jg LB_26680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_26680
	jmp LB_26681
LB_26680:
	jmp LB_26663
LB_26681:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_26670
LB_26669:
	add r14,1
LB_26670:
	cmp r14,r10
	jge LB_26671
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26669
	cmp al,10
	jz LB_26669
	cmp al,32
	jz LB_26669
LB_26671:
	push r10
	call NS_E_24244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26672
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26673
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26673:
	jmp LB_26664
LB_26672:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26667
	btr r12,1
	clc
	jmp LB_26668
LB_26667:
	bts r12,1
	stc
LB_26668:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26665
	btr r12,0
	clc
	jmp LB_26666
LB_26665:
	bts r12,0
	stc
LB_26666:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_26660
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_26682
	btr r12,2
	jmp LB_26683
LB_26682:
	bts r12,2
LB_26683:
	mov r13,r14
	bt r12,1
	jc LB_26684
	btr r12,0
	jmp LB_26685
LB_26684:
	bts r12,0
LB_26685:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21313 %_25394 ⊢ %_25395 : %_25395
 ; {>  %_25394~0':_p21249 }
; _f21313 0' ⊢ °1◂0'
; _some %_25395 ⊢ %_25396 : %_25396
 ; {>  %_25395~°1◂0':_p21293 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25396
 ; {>  %_25396~°0◂°1◂0':(_opn)◂(_p21293) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_26658
	btr r12,3
	jmp LB_26659
LB_26658:
	bts r12,3
LB_26659:
	mov rsi,1
	bt r12,3
	jc LB_26656
	mov rsi,0
	bt r9,0
	jc LB_26656
	jmp LB_26657
LB_26656:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26657:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26660:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26662
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26661
LB_26662:
	add rsp,8
	ret
LB_26664:
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
LB_26663:
	add rsp,32
	pop r14
LB_26661:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_26706
LB_26705:
	add r14,1
LB_26706:
	cmp r14,r10
	jge LB_26707
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26705
	cmp al,10
	jz LB_26705
	cmp al,32
	jz LB_26705
LB_26707:
	add r14,2
	cmp r14,r10
	jg LB_26710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_26710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_26710
	jmp LB_26711
LB_26710:
	jmp LB_26693
LB_26711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_26700
LB_26699:
	add r14,1
LB_26700:
	cmp r14,r10
	jge LB_26701
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26699
	cmp al,10
	jz LB_26699
	cmp al,32
	jz LB_26699
LB_26701:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26702
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26703
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26703:
	jmp LB_26694
LB_26702:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26697
	btr r12,1
	clc
	jmp LB_26698
LB_26697:
	bts r12,1
	stc
LB_26698:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26695
	btr r12,0
	clc
	jmp LB_26696
LB_26695:
	bts r12,0
	stc
LB_26696:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_26690
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_26712
	btr r12,2
	jmp LB_26713
LB_26712:
	bts r12,2
LB_26713:
	mov r13,r14
	bt r12,1
	jc LB_26714
	btr r12,0
	jmp LB_26715
LB_26714:
	bts r12,0
LB_26715:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21314 %_25397 ⊢ %_25398 : %_25398
 ; {>  %_25397~0':(_p21259)◂(_stg) }
; _f21314 0' ⊢ °2◂0'
; _some %_25398 ⊢ %_25399 : %_25399
 ; {>  %_25398~°2◂0':_p21293 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_25399
 ; {>  %_25399~°0◂°2◂0':(_opn)◂(_p21293) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_26688
	btr r12,3
	jmp LB_26689
LB_26688:
	bts r12,3
LB_26689:
	mov rsi,1
	bt r12,3
	jc LB_26686
	mov rsi,0
	bt r9,0
	jc LB_26686
	jmp LB_26687
LB_26686:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26687:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26690:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26692
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26691
LB_26692:
	add rsp,8
	ret
LB_26694:
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
LB_26693:
	add rsp,32
	pop r14
LB_26691:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_26735
LB_26734:
	add r14,1
LB_26735:
	cmp r14,r10
	jge LB_26736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26734
	cmp al,10
	jz LB_26734
	cmp al,32
	jz LB_26734
LB_26736:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26737
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26729
LB_26737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_26740
LB_26739:
	add r14,1
LB_26740:
	cmp r14,r10
	jge LB_26741
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26739
	cmp al,10
	jz LB_26739
	cmp al,32
	jz LB_26739
LB_26741:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26742
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26743:
	jmp LB_26729
LB_26742:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26732
	btr r12,1
	clc
	jmp LB_26733
LB_26732:
	bts r12,1
	stc
LB_26733:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26730
	btr r12,0
	clc
	jmp LB_26731
LB_26730:
	bts r12,0
	stc
LB_26731:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_26726
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f21312 { %_25400 %_25401 } ⊢ %_25402 : %_25402
 ; {>  %_25400~0':(_p21246)◂((_p21254)◂(_stg)) %_25401~1':(_p21259)◂(_stg) }
; _f21312 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25402 ⊢ %_25403 : %_25403
 ; {>  %_25402~°0◂{ 0' 1' }:_p21293 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25403
 ; {>  %_25403~°0◂°0◂{ 0' 1' }:(_opn)◂(_p21293) }
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
	jc LB_26720
	btr r12,2
	jmp LB_26721
LB_26720:
	bts r12,2
LB_26721:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_26718
	btr QWORD [rdi],0
	jmp LB_26719
LB_26718:
	bts QWORD [rdi],0
LB_26719:
	mov r8,r14
	bt r12,1
	jc LB_26724
	btr r12,2
	jmp LB_26725
LB_26724:
	bts r12,2
LB_26725:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_26722
	btr QWORD [rdi],1
	jmp LB_26723
LB_26722:
	bts QWORD [rdi],1
LB_26723:
	mov rsi,1
	bt r12,3
	jc LB_26716
	mov rsi,0
	bt r9,0
	jc LB_26716
	jmp LB_26717
LB_26716:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26717:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26726:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26728
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26727
LB_26728:
	add rsp,8
	ret
LB_26729:
	add rsp,32
	pop r14
LB_26727:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25260:
NS_E_RDI_25260:
NS_E_25260_ETR_TBL:
NS_E_25260_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_26765
LB_26764:
	add r14,1
LB_26765:
	cmp r14,r10
	jge LB_26766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26764
	cmp al,10
	jz LB_26764
	cmp al,32
	jz LB_26764
LB_26766:
	add r14,3
	cmp r14,r10
	jg LB_26769
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_26769
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_26769
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_26769
	jmp LB_26770
LB_26769:
	jmp LB_26752
LB_26770:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_26759
LB_26758:
	add r14,1
LB_26759:
	cmp r14,r10
	jge LB_26760
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26758
	cmp al,10
	jz LB_26758
	cmp al,32
	jz LB_26758
LB_26760:
	push r10
	call NS_E_24373_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26761
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26762
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26762:
	jmp LB_26753
LB_26761:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26756
	btr r12,1
	clc
	jmp LB_26757
LB_26756:
	bts r12,1
	stc
LB_26757:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26754
	btr r12,0
	clc
	jmp LB_26755
LB_26754:
	bts r12,0
	stc
LB_26755:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_26749
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_26771
	btr r12,2
	jmp LB_26772
LB_26771:
	bts r12,2
LB_26772:
	mov r13,r14
	bt r12,1
	jc LB_26773
	btr r12,0
	jmp LB_26774
LB_26773:
	bts r12,0
LB_26774:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21269 %_25404 ⊢ %_25405 : %_25405
 ; {>  %_25404~0':(_p21246)◂((_p21253)◂(_stg)) }
; _f21269 0' ⊢ °2◂0'
; _some %_25405 ⊢ %_25406 : %_25406
 ; {>  %_25405~°2◂0':(_p21259)◂(_stg) }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_25406
 ; {>  %_25406~°0◂°2◂0':(_opn)◂((_p21259)◂(_stg)) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_26747
	btr r12,3
	jmp LB_26748
LB_26747:
	bts r12,3
LB_26748:
	mov rsi,1
	bt r12,3
	jc LB_26745
	mov rsi,0
	bt r9,0
	jc LB_26745
	jmp LB_26746
LB_26745:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26746:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26749:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26751
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26750
LB_26751:
	add rsp,8
	ret
LB_26753:
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
LB_26752:
	add rsp,32
	pop r14
LB_26750:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_26786
LB_26785:
	add r14,1
LB_26786:
	cmp r14,r10
	jge LB_26787
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26785
	cmp al,10
	jz LB_26785
	cmp al,32
	jz LB_26785
LB_26787:
	push r10
	call NS_E_25269_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26788
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26782
LB_26788:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26783
	btr r12,0
	clc
	jmp LB_26784
LB_26783:
	bts r12,0
	stc
LB_26784:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_26779
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21268 %_25407 ⊢ %_25408 : %_25408
 ; {>  %_25407~0':(_p21261)◂(_stg) }
; _f21268 0' ⊢ °1◂0'
; _some %_25408 ⊢ %_25409 : %_25409
 ; {>  %_25408~°1◂0':(_p21259)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25409
 ; {>  %_25409~°0◂°1◂0':(_opn)◂((_p21259)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_26777
	btr r12,3
	jmp LB_26778
LB_26777:
	bts r12,3
LB_26778:
	mov rsi,1
	bt r12,3
	jc LB_26775
	mov rsi,0
	bt r9,0
	jc LB_26775
	jmp LB_26776
LB_26775:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26776:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26779:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26781
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26780
LB_26781:
	add rsp,8
	ret
LB_26782:
	add rsp,16
	pop r14
LB_26780:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_26809
LB_26808:
	add r14,1
LB_26809:
	cmp r14,r10
	jge LB_26810
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26808
	cmp al,10
	jz LB_26808
	cmp al,32
	jz LB_26808
LB_26810:
	push r10
	call NS_E_25261_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26811
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26803
LB_26811:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_26814
LB_26813:
	add r14,1
LB_26814:
	cmp r14,r10
	jge LB_26815
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26813
	cmp al,10
	jz LB_26813
	cmp al,32
	jz LB_26813
LB_26815:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26816
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26817:
	jmp LB_26803
LB_26816:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26806
	btr r12,1
	clc
	jmp LB_26807
LB_26806:
	bts r12,1
	stc
LB_26807:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26804
	btr r12,0
	clc
	jmp LB_26805
LB_26804:
	bts r12,0
	stc
LB_26805:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_26800
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f21267 { %_25410 %_25411 } ⊢ %_25412 : %_25412
 ; {>  %_25410~0':(_p21260)◂(_stg) %_25411~1':(_p21259)◂(_stg) }
; _f21267 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25412 ⊢ %_25413 : %_25413
 ; {>  %_25412~°0◂{ 0' 1' }:(_p21259)◂(_stg) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25413
 ; {>  %_25413~°0◂°0◂{ 0' 1' }:(_opn)◂((_p21259)◂(_stg)) }
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
	jc LB_26794
	btr r12,2
	jmp LB_26795
LB_26794:
	bts r12,2
LB_26795:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_26792
	btr QWORD [rdi],0
	jmp LB_26793
LB_26792:
	bts QWORD [rdi],0
LB_26793:
	mov r8,r14
	bt r12,1
	jc LB_26798
	btr r12,2
	jmp LB_26799
LB_26798:
	bts r12,2
LB_26799:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_26796
	btr QWORD [rdi],1
	jmp LB_26797
LB_26796:
	bts QWORD [rdi],1
LB_26797:
	mov rsi,1
	bt r12,3
	jc LB_26790
	mov rsi,0
	bt r9,0
	jc LB_26790
	jmp LB_26791
LB_26790:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26791:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26800:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26802
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26801
LB_26802:
	add rsp,8
	ret
LB_26803:
	add rsp,32
	pop r14
LB_26801:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25261:
NS_E_RDI_25261:
NS_E_25261_ETR_TBL:
NS_E_25261_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_26885
LB_26884:
	add r14,1
LB_26885:
	cmp r14,r10
	jge LB_26886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26884
	cmp al,10
	jz LB_26884
	cmp al,32
	jz LB_26884
LB_26886:
	add r14,1
	cmp r14,r10
	jg LB_26889
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_26889
	jmp LB_26890
LB_26889:
	jmp LB_26840
LB_26890:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_26853
LB_26852:
	add r14,1
LB_26853:
	cmp r14,r10
	jge LB_26854
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26852
	cmp al,10
	jz LB_26852
	cmp al,32
	jz LB_26852
LB_26854:
	push r10
	call NS_E_24373_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26855
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26856
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26856:
	jmp LB_26841
LB_26855:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_26859
LB_26858:
	add r14,1
LB_26859:
	cmp r14,r10
	jge LB_26860
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26858
	cmp al,10
	jz LB_26858
	cmp al,32
	jz LB_26858
LB_26860:
	add r14,3
	cmp r14,r10
	jg LB_26865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_26865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_26865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_26865
	jmp LB_26866
LB_26865:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26862
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26862:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26863
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26863:
	jmp LB_26841
LB_26866:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_26868
LB_26867:
	add r14,1
LB_26868:
	cmp r14,r10
	jge LB_26869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26867
	cmp al,10
	jz LB_26867
	cmp al,32
	jz LB_26867
LB_26869:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26870
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26871
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26871:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26872
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26872:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26873
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26873:
	jmp LB_26841
LB_26870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_26876
LB_26875:
	add r14,1
LB_26876:
	cmp r14,r10
	jge LB_26877
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26875
	cmp al,10
	jz LB_26875
	cmp al,32
	jz LB_26875
LB_26877:
	push r10
	call NS_E_24636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26878
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26879
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26879:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26880
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26880:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26881
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26881:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26882
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26882:
	jmp LB_26841
LB_26878:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_26850
	btr r12,4
	clc
	jmp LB_26851
LB_26850:
	bts r12,4
	stc
LB_26851:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26848
	btr r12,3
	clc
	jmp LB_26849
LB_26848:
	bts r12,3
	stc
LB_26849:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26846
	btr r12,2
	clc
	jmp LB_26847
LB_26846:
	bts r12,2
	stc
LB_26847:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26844
	btr r12,1
	clc
	jmp LB_26845
LB_26844:
	bts r12,1
	stc
LB_26845:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26842
	btr r12,0
	clc
	jmp LB_26843
LB_26842:
	bts r12,0
	stc
LB_26843:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_26837
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_26891
	btr r12,5
	jmp LB_26892
LB_26891:
	bts r12,5
LB_26892:
	mov r8,r10
	bt r12,4
	jc LB_26893
	btr r12,2
	jmp LB_26894
LB_26893:
	bts r12,2
LB_26894:
	mov r10,r14
	bt r12,1
	jc LB_26895
	btr r12,4
	jmp LB_26896
LB_26895:
	bts r12,4
LB_26896:
	mov r14,r9
	bt r12,3
	jc LB_26897
	btr r12,1
	jmp LB_26898
LB_26897:
	bts r12,1
LB_26898:
	mov r9,r13
	bt r12,0
	jc LB_26899
	btr r12,3
	jmp LB_26900
LB_26899:
	bts r12,3
LB_26900:
	mov r13,r10
	bt r12,4
	jc LB_26901
	btr r12,0
	jmp LB_26902
LB_26901:
	bts r12,0
LB_26902:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_25415 %_25416 } ⊢ %_25417 : %_25417
 ; {>  %_25416~2':(_lst)◂((_p21246)◂((_p21254)◂(_stg))) %_25415~1':(_p21246)◂((_p21254)◂(_stg)) %_25414~0':(_p21246)◂((_p21253)◂(_stg)) }
; _cns { 1' 2' } ⊢ °0◂{ 1' 2' }
; _f21271 { %_25414 %_25417 } ⊢ %_25418 : %_25418
 ; {>  %_25417~°0◂{ 1' 2' }:(_lst)◂((_p21246)◂((_p21254)◂(_stg))) %_25414~0':(_p21246)◂((_p21253)◂(_stg)) }
; _f21271 { 0' °0◂{ 1' 2' } } ⊢ °1◂{ 0' °0◂{ 1' 2' } }
; _some %_25418 ⊢ %_25419 : %_25419
 ; {>  %_25418~°1◂{ 0' °0◂{ 1' 2' } }:(_p21260)◂(_stg) }
; _some °1◂{ 0' °0◂{ 1' 2' } } ⊢ °0◂°1◂{ 0' °0◂{ 1' 2' } }
; ∎ %_25419
 ; {>  %_25419~°0◂°1◂{ 0' °0◂{ 1' 2' } }:(_opn)◂((_p21260)◂(_stg)) }
; 	∎ °0◂°1◂{ 0' °0◂{ 1' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂{ 0' °0◂{ 1' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_26823
	btr r12,4
	jmp LB_26824
LB_26823:
	bts r12,4
LB_26824:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_26821
	btr QWORD [rdi],0
	jmp LB_26822
LB_26821:
	bts QWORD [rdi],0
LB_26822:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r13,r14
	bt r12,1
	jc LB_26831
	btr r12,0
	jmp LB_26832
LB_26831:
	bts r12,0
LB_26832:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_26829
	btr QWORD [rdi],0
	jmp LB_26830
LB_26829:
	bts QWORD [rdi],0
LB_26830:
	mov r13,r8
	bt r12,2
	jc LB_26835
	btr r12,0
	jmp LB_26836
LB_26835:
	bts r12,0
LB_26836:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_26833
	btr QWORD [rdi],1
	jmp LB_26834
LB_26833:
	bts QWORD [rdi],1
LB_26834:
	mov rsi,1
	bt r12,4
	jc LB_26827
	mov rsi,0
	bt r10,0
	jc LB_26827
	jmp LB_26828
LB_26827:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_26828:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_26825
	btr QWORD [rdi],1
	jmp LB_26826
LB_26825:
	bts QWORD [rdi],1
LB_26826:
	mov rsi,1
	bt r12,3
	jc LB_26819
	mov rsi,0
	bt r9,0
	jc LB_26819
	jmp LB_26820
LB_26819:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26820:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26837:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26839
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26838
LB_26839:
	add rsp,8
	ret
LB_26841:
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
LB_26840:
	add rsp,80
	pop r14
LB_26838:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_26979
LB_26978:
	add r14,1
LB_26979:
	cmp r14,r10
	jge LB_26980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26978
	cmp al,10
	jz LB_26978
	cmp al,32
	jz LB_26978
LB_26980:
	add r14,3
	cmp r14,r10
	jg LB_26983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_26983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_26983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_26983
	jmp LB_26984
LB_26983:
	jmp LB_26920
LB_26984:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_26935
LB_26934:
	add r14,1
LB_26935:
	cmp r14,r10
	jge LB_26936
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26934
	cmp al,10
	jz LB_26934
	cmp al,32
	jz LB_26934
LB_26936:
	push r10
	call NS_E_24376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26937
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26938
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26938:
	jmp LB_26921
LB_26937:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_26941
LB_26940:
	add r14,1
LB_26941:
	cmp r14,r10
	jge LB_26942
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26940
	cmp al,10
	jz LB_26940
	cmp al,32
	jz LB_26940
LB_26942:
	add r14,1
	cmp r14,r10
	jg LB_26947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_26947
	jmp LB_26948
LB_26947:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26944
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26944:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26945
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26945:
	jmp LB_26921
LB_26948:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_26950
LB_26949:
	add r14,1
LB_26950:
	cmp r14,r10
	jge LB_26951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26949
	cmp al,10
	jz LB_26949
	cmp al,32
	jz LB_26949
LB_26951:
	push r10
	call NS_E_24373_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26952
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26953
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26953:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26954
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26954:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26955
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26955:
	jmp LB_26921
LB_26952:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_26958
LB_26957:
	add r14,1
LB_26958:
	cmp r14,r10
	jge LB_26959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26957
	cmp al,10
	jz LB_26957
	cmp al,32
	jz LB_26957
LB_26959:
	add r14,3
	cmp r14,r10
	jg LB_26966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_26966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_26966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_26966
	jmp LB_26967
LB_26966:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26961
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26961:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26962
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26962:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26963
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26963:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26964
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26964:
	jmp LB_26921
LB_26967:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_26969
LB_26968:
	add r14,1
LB_26969:
	cmp r14,r10
	jge LB_26970
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_26968
	cmp al,10
	jz LB_26968
	cmp al,32
	jz LB_26968
LB_26970:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_26971
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_26972
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_26972:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_26973
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_26973:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_26974
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_26974:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_26975
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_26975:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26976
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26976:
	jmp LB_26921
LB_26971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_26932
	btr r12,5
	clc
	jmp LB_26933
LB_26932:
	bts r12,5
	stc
LB_26933:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_26930
	btr r12,4
	clc
	jmp LB_26931
LB_26930:
	bts r12,4
	stc
LB_26931:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_26928
	btr r12,3
	clc
	jmp LB_26929
LB_26928:
	bts r12,3
	stc
LB_26929:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_26926
	btr r12,2
	clc
	jmp LB_26927
LB_26926:
	bts r12,2
	stc
LB_26927:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_26924
	btr r12,1
	clc
	jmp LB_26925
LB_26924:
	bts r12,1
	stc
LB_26925:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_26922
	btr r12,0
	clc
	jmp LB_26923
LB_26922:
	bts r12,0
	stc
LB_26923:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_26917
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_26985
	btr r12,6
	jmp LB_26986
LB_26985:
	bts r12,6
LB_26986:
	mov r8,r11
	bt r12,5
	jc LB_26987
	btr r12,2
	jmp LB_26988
LB_26987:
	bts r12,2
LB_26988:
	mov r11,r14
	bt r12,1
	jc LB_26989
	btr r12,5
	jmp LB_26990
LB_26989:
	bts r12,5
LB_26990:
	mov r14,r9
	bt r12,3
	jc LB_26991
	btr r12,1
	jmp LB_26992
LB_26991:
	bts r12,1
LB_26992:
	mov r9,r13
	bt r12,0
	jc LB_26993
	btr r12,3
	jmp LB_26994
LB_26993:
	bts r12,3
LB_26994:
	mov r13,r11
	bt r12,5
	jc LB_26995
	btr r12,0
	jmp LB_26996
LB_26995:
	bts r12,0
LB_26996:
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
; _f21272 { %_25420 %_25421 %_25422 } ⊢ %_25423 : %_25423
 ; {>  %_25421~1':(_p21246)◂((_p21253)◂(_stg)) %_25422~2':(_p21246)◂((_p21254)◂(_stg)) %_25420~0':(_p21253)◂(_stg) }
; _f21272 { 0' 1' 2' } ⊢ °2◂{ 0' 1' 2' }
; _some %_25423 ⊢ %_25424 : %_25424
 ; {>  %_25423~°2◂{ 0' 1' 2' }:(_p21260)◂(_stg) }
; _some °2◂{ 0' 1' 2' } ⊢ °0◂°2◂{ 0' 1' 2' }
; ∎ %_25424
 ; {>  %_25424~°0◂°2◂{ 0' 1' 2' }:(_opn)◂((_p21260)◂(_stg)) }
; 	∎ °0◂°2◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°2◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_26907
	btr r12,4
	jmp LB_26908
LB_26907:
	bts r12,4
LB_26908:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_26905
	btr QWORD [rdi],0
	jmp LB_26906
LB_26905:
	bts QWORD [rdi],0
LB_26906:
	mov r10,r14
	bt r12,1
	jc LB_26911
	btr r12,4
	jmp LB_26912
LB_26911:
	bts r12,4
LB_26912:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_26909
	btr QWORD [rdi],1
	jmp LB_26910
LB_26909:
	bts QWORD [rdi],1
LB_26910:
	mov r10,r8
	bt r12,2
	jc LB_26915
	btr r12,4
	jmp LB_26916
LB_26915:
	bts r12,4
LB_26916:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_26913
	btr QWORD [rdi],2
	jmp LB_26914
LB_26913:
	bts QWORD [rdi],2
LB_26914:
	mov rsi,1
	bt r12,3
	jc LB_26903
	mov rsi,0
	bt r9,0
	jc LB_26903
	jmp LB_26904
LB_26903:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_26904:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_26917:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_26919
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_26918
LB_26919:
	add rsp,8
	ret
LB_26921:
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
LB_26920:
	add rsp,96
	pop r14
LB_26918:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_27015
LB_27014:
	add r14,1
LB_27015:
	cmp r14,r10
	jge LB_27016
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27014
	cmp al,10
	jz LB_27014
	cmp al,32
	jz LB_27014
LB_27016:
	add r14,2
	cmp r14,r10
	jg LB_27019
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_27019
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_27019
	jmp LB_27020
LB_27019:
	jmp LB_27002
LB_27020:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_27009
LB_27008:
	add r14,1
LB_27009:
	cmp r14,r10
	jge LB_27010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27008
	cmp al,10
	jz LB_27008
	cmp al,32
	jz LB_27008
LB_27010:
	push r10
	call NS_E_25262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27011
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27012
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27012:
	jmp LB_27003
LB_27011:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27006
	btr r12,1
	clc
	jmp LB_27007
LB_27006:
	bts r12,1
	stc
LB_27007:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27004
	btr r12,0
	clc
	jmp LB_27005
LB_27004:
	bts r12,0
	stc
LB_27005:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_26999
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_27021
	btr r12,2
	jmp LB_27022
LB_27021:
	bts r12,2
LB_27022:
	mov r13,r14
	bt r12,1
	jc LB_27023
	btr r12,0
	jmp LB_27024
LB_27023:
	bts r12,0
LB_27024:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25425 ⊢ %_25426 : %_25426
 ; {>  %_25425~0':(_p21260)◂(_stg) }
; _some 0' ⊢ °0◂0'
; ∎ %_25426
 ; {>  %_25426~°0◂0':(_opn)◂((_p21260)◂(_stg)) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_26997
	btr r12,3
	jmp LB_26998
LB_26997:
	bts r12,3
LB_26998:
	mov r8,0
	bts r12,2
	ret
LB_26999:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27001
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27000
LB_27001:
	add rsp,8
	ret
LB_27003:
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
LB_27002:
	add rsp,32
	pop r14
LB_27000:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_27052
LB_27051:
	add r14,1
LB_27052:
	cmp r14,r10
	jge LB_27053
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27051
	cmp al,10
	jz LB_27051
	cmp al,32
	jz LB_27051
LB_27053:
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27054
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27042
LB_27054:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_27057
LB_27056:
	add r14,1
LB_27057:
	cmp r14,r10
	jge LB_27058
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27056
	cmp al,10
	jz LB_27056
	cmp al,32
	jz LB_27056
LB_27058:
	push r10
	call NS_E_24373_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27059
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27060
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27060:
	jmp LB_27042
LB_27059:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_27063
LB_27062:
	add r14,1
LB_27063:
	cmp r14,r10
	jge LB_27064
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27062
	cmp al,10
	jz LB_27062
	cmp al,32
	jz LB_27062
LB_27064:
	add r14,3
	cmp r14,r10
	jg LB_27069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_27069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_27069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_27069
	jmp LB_27070
LB_27069:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27066
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27066:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27067
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27067:
	jmp LB_27042
LB_27070:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_27072
LB_27071:
	add r14,1
LB_27072:
	cmp r14,r10
	jge LB_27073
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27071
	cmp al,10
	jz LB_27071
	cmp al,32
	jz LB_27071
LB_27073:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27074
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27075
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27075:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27076
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27076:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27077
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27077:
	jmp LB_27042
LB_27074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_27049
	btr r12,3
	clc
	jmp LB_27050
LB_27049:
	bts r12,3
	stc
LB_27050:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27047
	btr r12,2
	clc
	jmp LB_27048
LB_27047:
	bts r12,2
	stc
LB_27048:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27045
	btr r12,1
	clc
	jmp LB_27046
LB_27045:
	bts r12,1
	stc
LB_27046:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27043
	btr r12,0
	clc
	jmp LB_27044
LB_27043:
	bts r12,0
	stc
LB_27044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_27039
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_27079
	btr r12,4
	jmp LB_27080
LB_27079:
	bts r12,4
LB_27080:
	mov r8,r9
	bt r12,3
	jc LB_27081
	btr r12,2
	jmp LB_27082
LB_27081:
	bts r12,2
LB_27082:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f21270 { %_25427 %_25428 %_25429 } ⊢ %_25430 : %_25430
 ; {>  %_25427~0':_p21201 %_25429~2':(_p21246)◂((_p21254)◂(_stg)) %_25428~1':(_p21246)◂((_p21253)◂(_stg)) }
; _f21270 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_25430 ⊢ %_25431 : %_25431
 ; {>  %_25430~°0◂{ 0' 1' 2' }:(_p21260)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_25431
 ; {>  %_25431~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p21260)◂(_stg)) }
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
	jc LB_27029
	btr r12,4
	jmp LB_27030
LB_27029:
	bts r12,4
LB_27030:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_27027
	btr QWORD [rdi],0
	jmp LB_27028
LB_27027:
	bts QWORD [rdi],0
LB_27028:
	mov r10,r14
	bt r12,1
	jc LB_27033
	btr r12,4
	jmp LB_27034
LB_27033:
	bts r12,4
LB_27034:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_27031
	btr QWORD [rdi],1
	jmp LB_27032
LB_27031:
	bts QWORD [rdi],1
LB_27032:
	mov r10,r8
	bt r12,2
	jc LB_27037
	btr r12,4
	jmp LB_27038
LB_27037:
	bts r12,4
LB_27038:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_27035
	btr QWORD [rdi],2
	jmp LB_27036
LB_27035:
	bts QWORD [rdi],2
LB_27036:
	mov rsi,1
	bt r12,3
	jc LB_27025
	mov rsi,0
	bt r9,0
	jc LB_27025
	jmp LB_27026
LB_27025:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27026:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27040
LB_27041:
	add rsp,8
	ret
LB_27042:
	add rsp,64
	pop r14
LB_27040:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25262:
NS_E_RDI_25262:
NS_E_25262_ETR_TBL:
NS_E_25262_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_27133
LB_27132:
	add r14,1
LB_27133:
	cmp r14,r10
	jge LB_27134
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27132
	cmp al,10
	jz LB_27132
	cmp al,32
	jz LB_27132
LB_27134:
	add r14,2
	cmp r14,r10
	jg LB_27137
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_27137
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_27137
	jmp LB_27138
LB_27137:
	jmp LB_27100
LB_27138:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_27111
LB_27110:
	add r14,1
LB_27111:
	cmp r14,r10
	jge LB_27112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27110
	cmp al,10
	jz LB_27110
	cmp al,32
	jz LB_27110
LB_27112:
	push r10
	call NS_E_25263_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27113
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27114:
	jmp LB_27101
LB_27113:
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
LB_27120:
	jmp LB_27117
LB_27116:
	add r14,1
LB_27117:
	cmp r14,r10
	jge LB_27118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27116
	cmp al,10
	jz LB_27116
	cmp al,32
	jz LB_27116
LB_27118:
	push r10
	push rsi
	call NS_E_25264_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_27119
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_27121
	bts QWORD [rax],0
LB_27121:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_27120
LB_27119:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_27123
LB_27122:
	add r14,1
LB_27123:
	cmp r14,r10
	jge LB_27124
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27122
	cmp al,10
	jz LB_27122
	cmp al,32
	jz LB_27122
LB_27124:
	add r14,2
	cmp r14,r10
	jg LB_27130
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_27130
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_27130
	jmp LB_27131
LB_27130:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27126
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27126:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27127
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27127:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27128
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27128:
	jmp LB_27101
LB_27131:
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
	jc LB_27108
	btr r12,3
	clc
	jmp LB_27109
LB_27108:
	bts r12,3
	stc
LB_27109:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27106
	btr r12,2
	clc
	jmp LB_27107
LB_27106:
	bts r12,2
	stc
LB_27107:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27104
	btr r12,1
	clc
	jmp LB_27105
LB_27104:
	bts r12,1
	stc
LB_27105:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27102
	btr r12,0
	clc
	jmp LB_27103
LB_27102:
	bts r12,0
	stc
LB_27103:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_27097
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' } 2' {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_27139
	btr r12,3
	jmp LB_27140
LB_27139:
	bts r12,3
LB_27140:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_27143
	btr r12,4
	clc
	jmp LB_27144
LB_27143:
	bts r12,4
	stc
LB_27144:
	mov r13,r10
	bt r12,4
	jc LB_27141
	btr r12,0
	jmp LB_27142
LB_27141:
	bts r12,0
LB_27142:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_27147
	btr r12,4
	clc
	jmp LB_27148
LB_27147:
	bts r12,4
	stc
LB_27148:
	mov r14,r10
	bt r12,4
	jc LB_27145
	btr r12,1
	jmp LB_27146
LB_27145:
	bts r12,1
LB_27146:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f21274 { %_25434 %_25432 %_25433 } ⊢ %_25435 : %_25435
 ; {>  %_25433~1':(_lst)◂((_p21254)◂(_stg)) %_25434~2':(_lst)◂(_p21265) %_25432~0':(_lst)◂((_p21253)◂(_stg)) }
; _f21274 { 2' 0' 1' } ⊢ °4◂{ 2' 0' 1' }
; _some %_25435 ⊢ %_25436 : %_25436
 ; {>  %_25435~°4◂{ 2' 0' 1' }:(_p21260)◂(_stg) }
; _some °4◂{ 2' 0' 1' } ⊢ °0◂°4◂{ 2' 0' 1' }
; ∎ %_25436
 ; {>  %_25436~°0◂°4◂{ 2' 0' 1' }:(_opn)◂((_p21260)◂(_stg)) }
; 	∎ °0◂°4◂{ 2' 0' 1' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°4◂{ 2' 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r8
	bt r12,2
	jc LB_27087
	btr r12,4
	jmp LB_27088
LB_27087:
	bts r12,4
LB_27088:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_27085
	btr QWORD [rdi],0
	jmp LB_27086
LB_27085:
	bts QWORD [rdi],0
LB_27086:
	mov r10,r13
	bt r12,0
	jc LB_27091
	btr r12,4
	jmp LB_27092
LB_27091:
	bts r12,4
LB_27092:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_27089
	btr QWORD [rdi],1
	jmp LB_27090
LB_27089:
	bts QWORD [rdi],1
LB_27090:
	mov r10,r14
	bt r12,1
	jc LB_27095
	btr r12,4
	jmp LB_27096
LB_27095:
	bts r12,4
LB_27096:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_27093
	btr QWORD [rdi],2
	jmp LB_27094
LB_27093:
	bts QWORD [rdi],2
LB_27094:
	mov rsi,1
	bt r12,3
	jc LB_27083
	mov rsi,0
	bt r9,0
	jc LB_27083
	jmp LB_27084
LB_27083:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27084:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27097:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27099
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27098
LB_27099:
	add rsp,8
	ret
LB_27101:
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
LB_27100:
	add rsp,64
	pop r14
LB_27098:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_27178
LB_27177:
	add r14,1
LB_27178:
	cmp r14,r10
	jge LB_27179
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27177
	cmp al,10
	jz LB_27177
	cmp al,32
	jz LB_27177
LB_27179:
	push r10
	call NS_E_24244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27180
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27168
LB_27180:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_27183
LB_27182:
	add r14,1
LB_27183:
	cmp r14,r10
	jge LB_27184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27182
	cmp al,10
	jz LB_27182
	cmp al,32
	jz LB_27182
LB_27184:
	add r14,1
	cmp r14,r10
	jg LB_27188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_27188
	jmp LB_27189
LB_27188:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27186:
	jmp LB_27168
LB_27189:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_27191
LB_27190:
	add r14,1
LB_27191:
	cmp r14,r10
	jge LB_27192
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27190
	cmp al,10
	jz LB_27190
	cmp al,32
	jz LB_27190
LB_27192:
	add r14,3
	cmp r14,r10
	jg LB_27197
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_27197
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_27197
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_27197
	jmp LB_27198
LB_27197:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27194
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27194:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27195
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27195:
	jmp LB_27168
LB_27198:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_27200
LB_27199:
	add r14,1
LB_27200:
	cmp r14,r10
	jge LB_27201
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27199
	cmp al,10
	jz LB_27199
	cmp al,32
	jz LB_27199
LB_27201:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27202
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27203
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27203:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27204
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27204:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27205
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27205:
	jmp LB_27168
LB_27202:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_27175
	btr r12,3
	clc
	jmp LB_27176
LB_27175:
	bts r12,3
	stc
LB_27176:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27173
	btr r12,2
	clc
	jmp LB_27174
LB_27173:
	bts r12,2
	stc
LB_27174:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27171
	btr r12,1
	clc
	jmp LB_27172
LB_27171:
	bts r12,1
	stc
LB_27172:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27169
	btr r12,0
	clc
	jmp LB_27170
LB_27169:
	bts r12,0
	stc
LB_27170:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_27165
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_27207
	btr r12,4
	jmp LB_27208
LB_27207:
	bts r12,4
LB_27208:
	mov r14,r9
	bt r12,3
	jc LB_27209
	btr r12,1
	jmp LB_27210
LB_27209:
	bts r12,1
LB_27210:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_25439 : %_25439
 ; {>  %_25438~1':(_p21246)◂((_p21254)◂(_stg)) %_25437~0':_p21249 }
; _nil {  } ⊢ °1◂{  }
; _f21247 %_25439 ⊢ %_25440 : %_25440
 ; {>  %_25439~°1◂{  }:(_lst)◂(t12561'(0)) %_25438~1':(_p21246)◂((_p21254)◂(_stg)) %_25437~0':_p21249 }
; _f21247 °1◂{  } ⊢ °0◂°1◂{  }
; _f21273 { %_25437 %_25440 %_25438 } ⊢ %_25441 : %_25441
 ; {>  %_25438~1':(_p21246)◂((_p21254)◂(_stg)) %_25437~0':_p21249 %_25440~°0◂°1◂{  }:(_p21246)◂(t12563'(0)) }
; _f21273 { 0' °0◂°1◂{  } 1' } ⊢ °3◂{ 0' °0◂°1◂{  } 1' }
; _some %_25441 ⊢ %_25442 : %_25442
 ; {>  %_25441~°3◂{ 0' °0◂°1◂{  } 1' }:(_p21260)◂(_stg) }
; _some °3◂{ 0' °0◂°1◂{  } 1' } ⊢ °0◂°3◂{ 0' °0◂°1◂{  } 1' }
; ∎ %_25442
 ; {>  %_25442~°0◂°3◂{ 0' °0◂°1◂{  } 1' }:(_opn)◂((_p21260)◂(_stg)) }
; 	∎ °0◂°3◂{ 0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°3◂{ 0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_27153
	btr r12,2
	jmp LB_27154
LB_27153:
	bts r12,2
LB_27154:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_27151
	btr QWORD [rdi],0
	jmp LB_27152
LB_27151:
	bts QWORD [rdi],0
LB_27152:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_27159
	mov rsi,0
	bt r8,0
	jc LB_27159
	jmp LB_27160
LB_27159:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_27160:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_27157
	mov rsi,0
	bt r8,0
	jc LB_27157
	jmp LB_27158
LB_27157:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_27158:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_27155
	btr QWORD [rdi],1
	jmp LB_27156
LB_27155:
	bts QWORD [rdi],1
LB_27156:
	mov r8,r14
	bt r12,1
	jc LB_27163
	btr r12,2
	jmp LB_27164
LB_27163:
	bts r12,2
LB_27164:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_27161
	btr QWORD [rdi],2
	jmp LB_27162
LB_27161:
	bts QWORD [rdi],2
LB_27162:
	mov rsi,1
	bt r12,3
	jc LB_27149
	mov rsi,0
	bt r9,0
	jc LB_27149
	jmp LB_27150
LB_27149:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27150:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27165:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27167
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27166
LB_27167:
	add rsp,8
	ret
LB_27168:
	add rsp,64
	pop r14
LB_27166:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25263:
NS_E_RDI_25263:
NS_E_25263_ETR_TBL:
NS_E_25263_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_27247
LB_27246:
	add r14,1
LB_27247:
	cmp r14,r10
	jge LB_27248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27246
	cmp al,10
	jz LB_27246
	cmp al,32
	jz LB_27246
LB_27248:
	add r14,1
	cmp r14,r10
	jg LB_27251
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_27251
	jmp LB_27252
LB_27251:
	jmp LB_27223
LB_27252:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_27232
LB_27231:
	add r14,1
LB_27232:
	cmp r14,r10
	jge LB_27233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27231
	cmp al,10
	jz LB_27231
	cmp al,32
	jz LB_27231
LB_27233:
	add r14,3
	cmp r14,r10
	jg LB_27237
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_27237
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_27237
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_27237
	jmp LB_27238
LB_27237:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27235
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27235:
	jmp LB_27224
LB_27238:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_27240
LB_27239:
	add r14,1
LB_27240:
	cmp r14,r10
	jge LB_27241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27239
	cmp al,10
	jz LB_27239
	cmp al,32
	jz LB_27239
LB_27241:
	push r10
	call NS_E_24638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27242
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27243
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27243:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27244
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27244:
	jmp LB_27224
LB_27242:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27229
	btr r12,2
	clc
	jmp LB_27230
LB_27229:
	bts r12,2
	stc
LB_27230:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27227
	btr r12,1
	clc
	jmp LB_27228
LB_27227:
	bts r12,1
	stc
LB_27228:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27225
	btr r12,0
	clc
	jmp LB_27226
LB_27225:
	bts r12,0
	stc
LB_27226:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_27220
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_27253
	btr r12,3
	jmp LB_27254
LB_27253:
	bts r12,3
LB_27254:
	mov r13,r8
	bt r12,2
	jc LB_27255
	btr r12,0
	jmp LB_27256
LB_27255:
	bts r12,0
LB_27256:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_25444 : %_25444
 ; {>  %_25443~0':(_p21254)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _nil {  } ⊢ %_25445 : %_25445
 ; {>  %_25443~0':(_p21254)◂(_stg) %_25444~°1◂{  }:(_lst)◂(t12580'(0)) }
; _nil {  } ⊢ °1◂{  }
; _some { %_25444 %_25445 } ⊢ %_25446 : %_25446
 ; {>  %_25443~0':(_p21254)◂(_stg) %_25445~°1◂{  }:(_lst)◂(t12582'(0)) %_25444~°1◂{  }:(_lst)◂(t12580'(0)) }
; _some { °1◂{  } °1◂{  } } ⊢ °0◂{ °1◂{  } °1◂{  } }
; ∎ %_25446
 ; {>  %_25446~°0◂{ °1◂{  } °1◂{  } }:(_opn)◂({ (_lst)◂(t12585'(0)) (_lst)◂(t12586'(0)) }) %_25443~0':(_p21254)◂(_stg) }
; 	∎ °0◂{ °1◂{  } °1◂{  } }
	bt r12,0
	jc LB_27211
	mov rdi,r13
	call dlt
LB_27211:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{ °1◂{  } °1◂{  } } ⊢ 2'◂3'
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
	jc LB_27214
	mov rsi,0
	bt r13,0
	jc LB_27214
	jmp LB_27215
LB_27214:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_27215:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_27212
	btr QWORD [rdi],0
	jmp LB_27213
LB_27212:
	bts QWORD [rdi],0
LB_27213:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_27218
	mov rsi,0
	bt r13,0
	jc LB_27218
	jmp LB_27219
LB_27218:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_27219:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_27216
	btr QWORD [rdi],1
	jmp LB_27217
LB_27216:
	bts QWORD [rdi],1
LB_27217:
	mov r8,0
	bts r12,2
	ret
LB_27220:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27222
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27221
LB_27222:
	add rsp,8
	ret
LB_27224:
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
LB_27223:
	add rsp,48
	pop r14
LB_27221:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_27298
LB_27297:
	add r14,1
LB_27298:
	cmp r14,r10
	jge LB_27299
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27297
	cmp al,10
	jz LB_27297
	cmp al,32
	jz LB_27297
LB_27299:
	push r10
	call NS_E_24376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27300
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27286
LB_27300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_27303
LB_27302:
	add r14,1
LB_27303:
	cmp r14,r10
	jge LB_27304
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27302
	cmp al,10
	jz LB_27302
	cmp al,32
	jz LB_27302
LB_27304:
	push r10
	call NS_E_24375_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27305
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27306
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27306:
	jmp LB_27286
LB_27305:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_27309
LB_27308:
	add r14,1
LB_27309:
	cmp r14,r10
	jge LB_27310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27308
	cmp al,10
	jz LB_27308
	cmp al,32
	jz LB_27308
LB_27310:
	add r14,3
	cmp r14,r10
	jg LB_27315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_27315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_27315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_27315
	jmp LB_27316
LB_27315:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27312
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27312:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27313
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27313:
	jmp LB_27286
LB_27316:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_27318
LB_27317:
	add r14,1
LB_27318:
	cmp r14,r10
	jge LB_27319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27317
	cmp al,10
	jz LB_27317
	cmp al,32
	jz LB_27317
LB_27319:
	push r10
	call NS_E_24638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27320
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27321
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27321:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27322
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27322:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27323
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27323:
	jmp LB_27286
LB_27320:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_27326
LB_27325:
	add r14,1
LB_27326:
	cmp r14,r10
	jge LB_27327
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27325
	cmp al,10
	jz LB_27325
	cmp al,32
	jz LB_27325
LB_27327:
	push r10
	call NS_E_24637_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27328
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_27329
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_27329:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27330
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27330:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27331
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27331:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27332
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27332:
	jmp LB_27286
LB_27328:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_27295
	btr r12,4
	clc
	jmp LB_27296
LB_27295:
	bts r12,4
	stc
LB_27296:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_27293
	btr r12,3
	clc
	jmp LB_27294
LB_27293:
	bts r12,3
	stc
LB_27294:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27291
	btr r12,2
	clc
	jmp LB_27292
LB_27291:
	bts r12,2
	stc
LB_27292:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27289
	btr r12,1
	clc
	jmp LB_27290
LB_27289:
	bts r12,1
	stc
LB_27290:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27287
	btr r12,0
	clc
	jmp LB_27288
LB_27287:
	bts r12,0
	stc
LB_27288:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_27283
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_27334
	btr r12,5
	jmp LB_27335
LB_27334:
	bts r12,5
LB_27335:
	mov r9,r10
	bt r12,4
	jc LB_27336
	btr r12,3
	jmp LB_27337
LB_27336:
	bts r12,3
LB_27337:
	mov r10,r8
	bt r12,2
	jc LB_27338
	btr r12,4
	jmp LB_27339
LB_27338:
	bts r12,4
LB_27339:
	mov r8,r11
	bt r12,5
	jc LB_27340
	btr r12,2
	jmp LB_27341
LB_27340:
	bts r12,2
LB_27341:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_25447 %_25448 } ⊢ %_25451 : %_25451
 ; {>  %_25450~3':(_lst)◂((_p21254)◂(_stg)) %_25447~0':(_p21253)◂(_stg) %_25449~2':(_p21254)◂(_stg) %_25448~1':(_lst)◂((_p21253)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _cns { %_25449 %_25450 } ⊢ %_25452 : %_25452
 ; {>  %_25450~3':(_lst)◂((_p21254)◂(_stg)) %_25449~2':(_p21254)◂(_stg) %_25451~°0◂{ 0' 1' }:(_lst)◂((_p21253)◂(_stg)) }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; _some { %_25451 %_25452 } ⊢ %_25453 : %_25453
 ; {>  %_25452~°0◂{ 2' 3' }:(_lst)◂((_p21254)◂(_stg)) %_25451~°0◂{ 0' 1' }:(_lst)◂((_p21253)◂(_stg)) }
; _some { °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; ∎ %_25453
 ; {>  %_25453~°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }:(_opn)◂({ (_lst)◂((_p21253)◂(_stg)) (_lst)◂((_p21254)◂(_stg)) }) }
; 	∎ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_27257
	btr r12,4
	jmp LB_27258
LB_27257:
	bts r12,4
LB_27258:
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
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_27265
	btr r12,6
	jmp LB_27266
LB_27265:
	bts r12,6
LB_27266:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_27263
	btr QWORD [rdi],0
	jmp LB_27264
LB_27263:
	bts QWORD [rdi],0
LB_27264:
	mov rcx,r14
	bt r12,1
	jc LB_27269
	btr r12,6
	jmp LB_27270
LB_27269:
	bts r12,6
LB_27270:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_27267
	btr QWORD [rdi],1
	jmp LB_27268
LB_27267:
	bts QWORD [rdi],1
LB_27268:
	mov rsi,1
	bt r12,5
	jc LB_27261
	mov rsi,0
	bt r11,0
	jc LB_27261
	jmp LB_27262
LB_27261:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_27262:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_27259
	btr QWORD [rdi],0
	jmp LB_27260
LB_27259:
	bts QWORD [rdi],0
LB_27260:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r8
	bt r12,2
	jc LB_27277
	btr r12,0
	jmp LB_27278
LB_27277:
	bts r12,0
LB_27278:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_27275
	btr QWORD [rdi],0
	jmp LB_27276
LB_27275:
	bts QWORD [rdi],0
LB_27276:
	mov r13,r10
	bt r12,4
	jc LB_27281
	btr r12,0
	jmp LB_27282
LB_27281:
	bts r12,0
LB_27282:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_27279
	btr QWORD [rdi],1
	jmp LB_27280
LB_27279:
	bts QWORD [rdi],1
LB_27280:
	mov rsi,1
	bt r12,5
	jc LB_27273
	mov rsi,0
	bt r11,0
	jc LB_27273
	jmp LB_27274
LB_27273:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_27274:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_27271
	btr QWORD [rdi],1
	jmp LB_27272
LB_27271:
	bts QWORD [rdi],1
LB_27272:
	mov r8,0
	bts r12,2
	ret
LB_27283:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27285
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27284
LB_27285:
	add rsp,8
	ret
LB_27286:
	add rsp,80
	pop r14
LB_27284:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25264:
NS_E_RDI_25264:
NS_E_25264_ETR_TBL:
NS_E_25264_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_27371
LB_27370:
	add r14,1
LB_27371:
	cmp r14,r10
	jge LB_27372
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27370
	cmp al,10
	jz LB_27370
	cmp al,32
	jz LB_27370
LB_27372:
	push r10
	call NS_E_25265_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27373
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27355
LB_27373:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_27376
LB_27375:
	add r14,1
LB_27376:
	cmp r14,r10
	jge LB_27377
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27375
	cmp al,10
	jz LB_27375
	cmp al,32
	jz LB_27375
LB_27377:
	add r14,1
	cmp r14,r10
	jg LB_27381
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_27381
	jmp LB_27382
LB_27381:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27379
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27379:
	jmp LB_27355
LB_27382:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_27364
LB_27363:
	add r14,1
LB_27364:
	cmp r14,r10
	jge LB_27365
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27363
	cmp al,10
	jz LB_27363
	cmp al,32
	jz LB_27363
LB_27365:
	push r10
	call NS_E_20652_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27366
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27367
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27367:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27368
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27368:
	jmp LB_27356
LB_27366:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27361
	btr r12,2
	clc
	jmp LB_27362
LB_27361:
	bts r12,2
	stc
LB_27362:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27359
	btr r12,1
	clc
	jmp LB_27360
LB_27359:
	bts r12,1
	stc
LB_27360:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27357
	btr r12,0
	clc
	jmp LB_27358
LB_27357:
	bts r12,0
	stc
LB_27358:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_27352
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_27383
	btr r12,3
	jmp LB_27384
LB_27383:
	bts r12,3
LB_27384:
	mov r14,r8
	bt r12,2
	jc LB_27385
	btr r12,1
	jmp LB_27386
LB_27385:
	bts r12,1
LB_27386:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f21286 { %_25454 %_25455 } ⊢ %_25456 : %_25456
 ; {>  %_25454~0':_r64 %_25455~1':_stg }
; _f21286 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_25456 ⊢ %_25457 : %_25457
 ; {>  %_25456~°3◂{ 0' 1' }:_p21265 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_25457
 ; {>  %_25457~°0◂°3◂{ 0' 1' }:(_opn)◂(_p21265) }
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
	jc LB_27346
	btr r12,2
	jmp LB_27347
LB_27346:
	bts r12,2
LB_27347:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_27344
	btr QWORD [rdi],0
	jmp LB_27345
LB_27344:
	bts QWORD [rdi],0
LB_27345:
	mov r8,r14
	bt r12,1
	jc LB_27350
	btr r12,2
	jmp LB_27351
LB_27350:
	bts r12,2
LB_27351:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_27348
	btr QWORD [rdi],1
	jmp LB_27349
LB_27348:
	bts QWORD [rdi],1
LB_27349:
	mov rsi,1
	bt r12,3
	jc LB_27342
	mov rsi,0
	bt r9,0
	jc LB_27342
	jmp LB_27343
LB_27342:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27343:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27352:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27354
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27353
LB_27354:
	add rsp,8
	ret
LB_27356:
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
LB_27355:
	add rsp,48
	pop r14
LB_27353:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_27398
LB_27397:
	add r14,1
LB_27398:
	cmp r14,r10
	jge LB_27399
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27397
	cmp al,10
	jz LB_27397
	cmp al,32
	jz LB_27397
LB_27399:
	push r10
	call NS_E_25267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27400
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27394
LB_27400:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27395
	btr r12,0
	clc
	jmp LB_27396
LB_27395:
	bts r12,0
	stc
LB_27396:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_27391
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21283 %_25458 ⊢ %_25459 : %_25459
 ; {>  %_25458~0':_stg }
; _f21283 0' ⊢ °0◂0'
; _some %_25459 ⊢ %_25460 : %_25460
 ; {>  %_25459~°0◂0':_p21265 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25460
 ; {>  %_25460~°0◂°0◂0':(_opn)◂(_p21265) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_27389
	btr r12,3
	jmp LB_27390
LB_27389:
	bts r12,3
LB_27390:
	mov rsi,1
	bt r12,3
	jc LB_27387
	mov rsi,0
	bt r9,0
	jc LB_27387
	jmp LB_27388
LB_27387:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27388:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27391:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27393
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27392
LB_27393:
	add rsp,8
	ret
LB_27394:
	add rsp,16
	pop r14
LB_27392:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_27413
LB_27412:
	add r14,1
LB_27413:
	cmp r14,r10
	jge LB_27414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27412
	cmp al,10
	jz LB_27412
	cmp al,32
	jz LB_27412
LB_27414:
	push r10
	call NS_E_20652_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27415
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27409
LB_27415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27410
	btr r12,0
	clc
	jmp LB_27411
LB_27410:
	bts r12,0
	stc
LB_27411:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_27406
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21283 %_25461 ⊢ %_25462 : %_25462
 ; {>  %_25461~0':_stg }
; _f21283 0' ⊢ °0◂0'
; _some %_25462 ⊢ %_25463 : %_25463
 ; {>  %_25462~°0◂0':_p21265 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25463
 ; {>  %_25463~°0◂°0◂0':(_opn)◂(_p21265) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_27404
	btr r12,3
	jmp LB_27405
LB_27404:
	bts r12,3
LB_27405:
	mov rsi,1
	bt r12,3
	jc LB_27402
	mov rsi,0
	bt r9,0
	jc LB_27402
	jmp LB_27403
LB_27402:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27403:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27406:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27408
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27407
LB_27408:
	add rsp,8
	ret
LB_27409:
	add rsp,16
	pop r14
LB_27407:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_27428
LB_27427:
	add r14,1
LB_27428:
	cmp r14,r10
	jge LB_27429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27427
	cmp al,10
	jz LB_27427
	cmp al,32
	jz LB_27427
LB_27429:
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27430
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27424
LB_27430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27425
	btr r12,0
	clc
	jmp LB_27426
LB_27425:
	bts r12,0
	stc
LB_27426:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_27421
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21284 %_25464 ⊢ %_25465 : %_25465
 ; {>  %_25464~0':_p21201 }
; _f21284 0' ⊢ °1◂0'
; _some %_25465 ⊢ %_25466 : %_25466
 ; {>  %_25465~°1◂0':_p21265 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25466
 ; {>  %_25466~°0◂°1◂0':(_opn)◂(_p21265) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_27419
	btr r12,3
	jmp LB_27420
LB_27419:
	bts r12,3
LB_27420:
	mov rsi,1
	bt r12,3
	jc LB_27417
	mov rsi,0
	bt r9,0
	jc LB_27417
	jmp LB_27418
LB_27417:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27418:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27421:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27423
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27422
LB_27423:
	add rsp,8
	ret
LB_27424:
	add rsp,16
	pop r14
LB_27422:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_27449
LB_27448:
	add r14,1
LB_27449:
	cmp r14,r10
	jge LB_27450
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27448
	cmp al,10
	jz LB_27448
	cmp al,32
	jz LB_27448
LB_27450:
	push r10
	call NS_E_25266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27451
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27445
LB_27451:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27446
	btr r12,0
	clc
	jmp LB_27447
LB_27446:
	bts r12,0
	stc
LB_27447:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_27442
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_27453
	btr r12,2
	jmp LB_27454
LB_27453:
	bts r12,2
LB_27454:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_27457
	btr r12,3
	clc
	jmp LB_27458
LB_27457:
	bts r12,3
	stc
LB_27458:
	mov r13,r9
	bt r12,3
	jc LB_27455
	btr r12,0
	jmp LB_27456
LB_27455:
	bts r12,0
LB_27456:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_27461
	btr r12,3
	clc
	jmp LB_27462
LB_27461:
	bts r12,3
	stc
LB_27462:
	mov r14,r9
	bt r12,3
	jc LB_27459
	btr r12,1
	jmp LB_27460
LB_27459:
	bts r12,1
LB_27460:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21285 %_25467 ⊢ %_25468 : %_25468
 ; {>  %_25467~{ 0' 1' }:{ _p21266 _r64 } }
; _f21285 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_25468 ⊢ %_25469 : %_25469
 ; {>  %_25468~°2◂{ 0' 1' }:_p21265 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_25469
 ; {>  %_25469~°0◂°2◂{ 0' 1' }:(_opn)◂(_p21265) }
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
	jc LB_27436
	btr r12,2
	jmp LB_27437
LB_27436:
	bts r12,2
LB_27437:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_27434
	btr QWORD [rdi],0
	jmp LB_27435
LB_27434:
	bts QWORD [rdi],0
LB_27435:
	mov r8,r14
	bt r12,1
	jc LB_27440
	btr r12,2
	jmp LB_27441
LB_27440:
	bts r12,2
LB_27441:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_27438
	btr QWORD [rdi],1
	jmp LB_27439
LB_27438:
	bts QWORD [rdi],1
LB_27439:
	mov rsi,1
	bt r12,3
	jc LB_27432
	mov rsi,0
	bt r9,0
	jc LB_27432
	jmp LB_27433
LB_27432:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27433:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27442:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27444
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27443
LB_27444:
	add rsp,8
	ret
LB_27445:
	add rsp,16
	pop r14
LB_27443:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25265:
NS_E_RDI_25265:
NS_E_25265_ETR_TBL:
NS_E_25265_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_20376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27476
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27468
LB_27476:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_27484
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_27484
	jmp LB_27485
LB_27484:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27482
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27482:
	jmp LB_27468
LB_27485:
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
	jc LB_27471
	btr r12,1
	clc
	jmp LB_27472
LB_27471:
	bts r12,1
	stc
LB_27472:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27469
	btr r12,0
	clc
	jmp LB_27470
LB_27469:
	bts r12,0
	stc
LB_27470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27465
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25470 ⊢ %_25471 : %_25471
 ; {>  %_25470~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_25471
 ; {>  %_25471~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_27463
	btr r12,3
	jmp LB_27464
LB_27463:
	bts r12,3
LB_27464:
	mov r8,0
	bts r12,2
	ret
LB_27465:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27467
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27466
LB_27467:
	add rsp,8
	ret
LB_27468:
	add rsp,32
	pop r14
LB_27466:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25266:
NS_E_RDI_25266:
NS_E_25266_ETR_TBL:
NS_E_25266_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_20376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27505
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27497
LB_27505:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_27513
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_27513
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_27513
	jmp LB_27514
LB_27513:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27511
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27511:
	jmp LB_27497
LB_27514:
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
	jc LB_27500
	btr r12,1
	clc
	jmp LB_27501
LB_27500:
	bts r12,1
	stc
LB_27501:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27498
	btr r12,0
	clc
	jmp LB_27499
LB_27498:
	bts r12,0
	stc
LB_27499:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27494
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f21288 {  } ⊢ %_25473 : %_25473
 ; {>  %_25472~0':_r64 }
; _f21288 {  } ⊢ °1◂{  }
; _some { %_25473 %_25472 } ⊢ %_25474 : %_25474
 ; {>  %_25473~°1◂{  }:_p21266 %_25472~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_25474
 ; {>  %_25474~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p21266 _r64 }) }
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
	jc LB_27488
	mov rsi,0
	bt r14,0
	jc LB_27488
	jmp LB_27489
LB_27488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_27489:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_27486
	btr QWORD [rdi],0
	jmp LB_27487
LB_27486:
	bts QWORD [rdi],0
LB_27487:
	mov r14,r13
	bt r12,0
	jc LB_27492
	btr r12,1
	jmp LB_27493
LB_27492:
	bts r12,1
LB_27493:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_27490
	btr QWORD [rdi],1
	jmp LB_27491
LB_27490:
	bts QWORD [rdi],1
LB_27491:
	mov r8,0
	bts r12,2
	ret
LB_27494:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27496
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27495
LB_27496:
	add rsp,8
	ret
LB_27497:
	add rsp,32
	pop r14
LB_27495:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_20376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27534
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27526
LB_27534:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_27542
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_27542
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_27542
	jmp LB_27543
LB_27542:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27540
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27540:
	jmp LB_27526
LB_27543:
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
	jc LB_27529
	btr r12,1
	clc
	jmp LB_27530
LB_27529:
	bts r12,1
	stc
LB_27530:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27527
	btr r12,0
	clc
	jmp LB_27528
LB_27527:
	bts r12,0
	stc
LB_27528:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27523
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f21289 {  } ⊢ %_25476 : %_25476
 ; {>  %_25475~0':_r64 }
; _f21289 {  } ⊢ °2◂{  }
; _some { %_25476 %_25475 } ⊢ %_25477 : %_25477
 ; {>  %_25475~0':_r64 %_25476~°2◂{  }:_p21266 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_25477
 ; {>  %_25477~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p21266 _r64 }) }
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
	jc LB_27517
	mov rsi,0
	bt r14,0
	jc LB_27517
	jmp LB_27518
LB_27517:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_27518:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_27515
	btr QWORD [rdi],0
	jmp LB_27516
LB_27515:
	bts QWORD [rdi],0
LB_27516:
	mov r14,r13
	bt r12,0
	jc LB_27521
	btr r12,1
	jmp LB_27522
LB_27521:
	bts r12,1
LB_27522:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_27519
	btr QWORD [rdi],1
	jmp LB_27520
LB_27519:
	bts QWORD [rdi],1
LB_27520:
	mov r8,0
	bts r12,2
	ret
LB_27523:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27525
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27524
LB_27525:
	add rsp,8
	ret
LB_27526:
	add rsp,32
	pop r14
LB_27524:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_20376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27563
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27555
LB_27563:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_27571
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_27571
	jmp LB_27572
LB_27571:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27569
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27569:
	jmp LB_27555
LB_27572:
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
	jc LB_27558
	btr r12,1
	clc
	jmp LB_27559
LB_27558:
	bts r12,1
	stc
LB_27559:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27556
	btr r12,0
	clc
	jmp LB_27557
LB_27556:
	bts r12,0
	stc
LB_27557:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27552
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f21287 {  } ⊢ %_25479 : %_25479
 ; {>  %_25478~0':_r64 }
; _f21287 {  } ⊢ °0◂{  }
; _some { %_25479 %_25478 } ⊢ %_25480 : %_25480
 ; {>  %_25479~°0◂{  }:_p21266 %_25478~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_25480
 ; {>  %_25480~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p21266 _r64 }) }
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
	jc LB_27546
	mov rsi,0
	bt r14,0
	jc LB_27546
	jmp LB_27547
LB_27546:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_27547:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_27544
	btr QWORD [rdi],0
	jmp LB_27545
LB_27544:
	bts QWORD [rdi],0
LB_27545:
	mov r14,r13
	bt r12,0
	jc LB_27550
	btr r12,1
	jmp LB_27551
LB_27550:
	bts r12,1
LB_27551:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_27548
	btr QWORD [rdi],1
	jmp LB_27549
LB_27548:
	bts QWORD [rdi],1
LB_27549:
	mov r8,0
	bts r12,2
	ret
LB_27552:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27554
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27553
LB_27554:
	add rsp,8
	ret
LB_27555:
	add rsp,32
	pop r14
LB_27553:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25267:
NS_E_RDI_25267:
NS_E_25267_ETR_TBL:
NS_E_25267_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_27588
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_27588
	jmp LB_27589
LB_27588:
	jmp LB_27578
LB_27589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_25268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27593
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27594
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27594:
	jmp LB_27578
LB_27593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27581
	btr r12,1
	clc
	jmp LB_27582
LB_27581:
	bts r12,1
	stc
LB_27582:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27579
	btr r12,0
	clc
	jmp LB_27580
LB_27579:
	bts r12,0
	stc
LB_27580:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27575
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_27596
	btr r12,2
	jmp LB_27597
LB_27596:
	bts r12,2
LB_27597:
	mov r13,r14
	bt r12,1
	jc LB_27598
	btr r12,0
	jmp LB_27599
LB_27598:
	bts r12,0
LB_27599:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f20496 %_25481 ⊢ %_25482 : %_25482
 ; {>  %_25481~0':(_lst)◂(_r64) }
; _f20496 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20496
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_25482 ⊢ %_25483 : %_25483
 ; {>  %_25482~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_25483
 ; {>  %_25483~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_27573
	btr r12,3
	jmp LB_27574
LB_27573:
	bts r12,3
LB_27574:
	mov r8,0
	bts r12,2
	ret
LB_27575:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27577
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27576
LB_27577:
	add rsp,8
	ret
LB_27578:
	add rsp,32
	pop r14
LB_27576:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25268:
NS_E_RDI_25268:
NS_E_25268_ETR_TBL:
NS_E_25268_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_27621
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_27621
	jmp LB_27622
LB_27621:
	jmp LB_27613
LB_27622:
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
	jc LB_27614
	btr r12,0
	clc
	jmp LB_27615
LB_27614:
	bts r12,0
	stc
LB_27615:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_27610
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_25484 : %_25484
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_25484
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_25485 : %_25485
 ; {>  %_25484~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_25484 %_25485 } ⊢ %_25486 : %_25486
 ; {>  %_25484~0':_r64 %_25485~°1◂{  }:(_lst)◂(t12643'(0)) }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_25486 ⊢ %_25487 : %_25487
 ; {>  %_25486~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_25487
 ; {>  %_25487~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_27604
	btr r12,1
	jmp LB_27605
LB_27604:
	bts r12,1
LB_27605:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_27602
	btr QWORD [rdi],0
	jmp LB_27603
LB_27602:
	bts QWORD [rdi],0
LB_27603:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_27608
	mov rsi,0
	bt r14,0
	jc LB_27608
	jmp LB_27609
LB_27608:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_27609:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_27606
	btr QWORD [rdi],1
	jmp LB_27607
LB_27606:
	bts QWORD [rdi],1
LB_27607:
	mov rsi,1
	bt r12,3
	jc LB_27600
	mov rsi,0
	bt r9,0
	jc LB_27600
	jmp LB_27601
LB_27600:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27601:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27610:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27612
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27611
LB_27612:
	add rsp,8
	ret
LB_27613:
	add rsp,16
	pop r14
LB_27611:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_20374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27644
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27636
LB_27644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_25268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27649
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27650
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27650:
	jmp LB_27636
LB_27649:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27639
	btr r12,1
	clc
	jmp LB_27640
LB_27639:
	bts r12,1
	stc
LB_27640:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27637
	btr r12,0
	clc
	jmp LB_27638
LB_27637:
	bts r12,0
	stc
LB_27638:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27633
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_25488 %_25489 } ⊢ %_25490 : %_25490
 ; {>  %_25489~1':(_lst)◂(_r64) %_25488~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25490 ⊢ %_25491 : %_25491
 ; {>  %_25490~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25491
 ; {>  %_25491~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_27627
	btr r12,2
	jmp LB_27628
LB_27627:
	bts r12,2
LB_27628:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_27625
	btr QWORD [rdi],0
	jmp LB_27626
LB_27625:
	bts QWORD [rdi],0
LB_27626:
	mov r8,r14
	bt r12,1
	jc LB_27631
	btr r12,2
	jmp LB_27632
LB_27631:
	bts r12,2
LB_27632:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_27629
	btr QWORD [rdi],1
	jmp LB_27630
LB_27629:
	bts QWORD [rdi],1
LB_27630:
	mov rsi,1
	bt r12,3
	jc LB_27623
	mov rsi,0
	bt r9,0
	jc LB_27623
	jmp LB_27624
LB_27623:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27624:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27633:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27635
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27634
LB_27635:
	add rsp,8
	ret
LB_27636:
	add rsp,32
	pop r14
LB_27634:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25269:
NS_E_RDI_25269:
NS_E_25269_ETR_TBL:
NS_E_25269_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_27690
LB_27689:
	add r14,1
LB_27690:
	cmp r14,r10
	jge LB_27691
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27689
	cmp al,10
	jz LB_27689
	cmp al,32
	jz LB_27689
LB_27691:
	add r14,4
	cmp r14,r10
	jg LB_27694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_27694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_27694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_27694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_27694
	jmp LB_27695
LB_27694:
	jmp LB_27668
LB_27695:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_27677
LB_27676:
	add r14,1
LB_27677:
	cmp r14,r10
	jge LB_27678
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27676
	cmp al,10
	jz LB_27676
	cmp al,32
	jz LB_27676
LB_27678:
	push r10
	call NS_E_25270_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27679
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27680
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27680:
	jmp LB_27669
LB_27679:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_27683
LB_27682:
	add r14,1
LB_27683:
	cmp r14,r10
	jge LB_27684
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27682
	cmp al,10
	jz LB_27682
	cmp al,32
	jz LB_27682
LB_27684:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27685
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27686
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27686:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27687
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27687:
	jmp LB_27669
LB_27685:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27674
	btr r12,2
	clc
	jmp LB_27675
LB_27674:
	bts r12,2
	stc
LB_27675:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27672
	btr r12,1
	clc
	jmp LB_27673
LB_27672:
	bts r12,1
	stc
LB_27673:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27670
	btr r12,0
	clc
	jmp LB_27671
LB_27670:
	bts r12,0
	stc
LB_27671:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_27665
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_27696
	btr r12,3
	jmp LB_27697
LB_27696:
	bts r12,3
LB_27697:
	mov r14,r8
	bt r12,2
	jc LB_27698
	btr r12,1
	jmp LB_27699
LB_27698:
	bts r12,1
LB_27699:
	mov r8,r13
	bt r12,0
	jc LB_27700
	btr r12,2
	jmp LB_27701
LB_27700:
	bts r12,2
LB_27701:
	mov r13,r9
	bt r12,3
	jc LB_27702
	btr r12,0
	jmp LB_27703
LB_27702:
	bts r12,0
LB_27703:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_25494 : %_25494
 ; {>  %_25492~0':(_lst)◂((_p21263)◂(_stg)) %_25493~1':(_p21259)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _f21278 %_25493 ⊢ %_25495 : %_25495
 ; {>  %_25492~0':(_lst)◂((_p21263)◂(_stg)) %_25493~1':(_p21259)◂(_stg) %_25494~°1◂{  }:(_lst)◂(t12658'(0)) }
; _f21278 1' ⊢ °1◂1'
; _f21276 { %_25494 %_25495 } ⊢ %_25496 : %_25496
 ; {>  %_25492~0':(_lst)◂((_p21263)◂(_stg)) %_25495~°1◂1':(_p21262)◂(_stg) %_25494~°1◂{  }:(_lst)◂(t12658'(0)) }
; _f21276 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_25496 ⊢ %_25497 : %_25497
 ; {>  %_25492~0':(_lst)◂((_p21263)◂(_stg)) %_25496~°1◂{ °1◂{  } °1◂1' }:(_p21261)◂(_stg) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_25497
 ; {>  %_25492~0':(_lst)◂((_p21263)◂(_stg)) %_25497~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂((_p21261)◂(_stg)) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_27652
	mov rdi,r13
	call dlt
LB_27652:
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
	jc LB_27657
	mov rsi,0
	bt r13,0
	jc LB_27657
	jmp LB_27658
LB_27657:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_27658:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_27655
	btr QWORD [rdi],0
	jmp LB_27656
LB_27655:
	bts QWORD [rdi],0
LB_27656:
	mov r13,r14
	bt r12,1
	jc LB_27663
	btr r12,0
	jmp LB_27664
LB_27663:
	bts r12,0
LB_27664:
	mov rsi,1
	bt r12,0
	jc LB_27661
	mov rsi,0
	bt r13,0
	jc LB_27661
	jmp LB_27662
LB_27661:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_27662:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_27659
	btr QWORD [rdi],1
	jmp LB_27660
LB_27659:
	bts QWORD [rdi],1
LB_27660:
	mov rsi,1
	bt r12,3
	jc LB_27653
	mov rsi,0
	bt r9,0
	jc LB_27653
	jmp LB_27654
LB_27653:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27654:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27665:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27667
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27666
LB_27667:
	add rsp,8
	ret
LB_27669:
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
LB_27668:
	add rsp,48
	pop r14
LB_27666:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_27734
LB_27733:
	add r14,1
LB_27734:
	cmp r14,r10
	jge LB_27735
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27733
	cmp al,10
	jz LB_27733
	cmp al,32
	jz LB_27733
LB_27735:
	add r14,3
	cmp r14,r10
	jg LB_27738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_27738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_27738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_27738
	jmp LB_27739
LB_27738:
	jmp LB_27724
LB_27739:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_27741
LB_27740:
	add r14,1
LB_27741:
	cmp r14,r10
	jge LB_27742
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27740
	cmp al,10
	jz LB_27740
	cmp al,32
	jz LB_27740
LB_27742:
	push r10
	call NS_E_25270_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27743
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27744
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27744:
	jmp LB_27724
LB_27743:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_27747
LB_27746:
	add r14,1
LB_27747:
	cmp r14,r10
	jge LB_27748
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27746
	cmp al,10
	jz LB_27746
	cmp al,32
	jz LB_27746
LB_27748:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27749
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27750
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27750:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27751
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27751:
	jmp LB_27724
LB_27749:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_27754
LB_27753:
	add r14,1
LB_27754:
	cmp r14,r10
	jge LB_27755
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27753
	cmp al,10
	jz LB_27753
	cmp al,32
	jz LB_27753
LB_27755:
	push r10
	call NS_E_25269_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27756
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27757
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27757:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27758
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27758:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27759
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27759:
	jmp LB_27724
LB_27756:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_27731
	btr r12,3
	clc
	jmp LB_27732
LB_27731:
	bts r12,3
	stc
LB_27732:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27729
	btr r12,2
	clc
	jmp LB_27730
LB_27729:
	bts r12,2
	stc
LB_27730:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27727
	btr r12,1
	clc
	jmp LB_27728
LB_27727:
	bts r12,1
	stc
LB_27728:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27725
	btr r12,0
	clc
	jmp LB_27726
LB_27725:
	bts r12,0
	stc
LB_27726:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_27721
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_27761
	btr r12,4
	jmp LB_27762
LB_27761:
	bts r12,4
LB_27762:
	mov r8,r9
	bt r12,3
	jc LB_27763
	btr r12,2
	jmp LB_27764
LB_27763:
	bts r12,2
LB_27764:
	mov r9,r14
	bt r12,1
	jc LB_27765
	btr r12,3
	jmp LB_27766
LB_27765:
	bts r12,3
LB_27766:
	mov r14,r10
	bt r12,4
	jc LB_27767
	btr r12,1
	jmp LB_27768
LB_27767:
	bts r12,1
LB_27768:
	mov r10,r13
	bt r12,0
	jc LB_27769
	btr r12,4
	jmp LB_27770
LB_27769:
	bts r12,4
LB_27770:
	mov r13,r9
	bt r12,3
	jc LB_27771
	btr r12,0
	jmp LB_27772
LB_27771:
	bts r12,0
LB_27772:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_25501 : %_25501
 ; {>  %_25499~1':(_p21259)◂(_stg) %_25498~0':(_lst)◂((_p21263)◂(_stg)) %_25500~2':(_p21261)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _f21278 %_25499 ⊢ %_25502 : %_25502
 ; {>  %_25499~1':(_p21259)◂(_stg) %_25498~0':(_lst)◂((_p21263)◂(_stg)) %_25501~°1◂{  }:(_lst)◂(t12670'(0)) %_25500~2':(_p21261)◂(_stg) }
; _f21278 1' ⊢ °1◂1'
; _f21275 { %_25501 %_25502 %_25500 } ⊢ %_25503 : %_25503
 ; {>  %_25498~0':(_lst)◂((_p21263)◂(_stg)) %_25501~°1◂{  }:(_lst)◂(t12670'(0)) %_25502~°1◂1':(_p21262)◂(_stg) %_25500~2':(_p21261)◂(_stg) }
; _f21275 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_25503 ⊢ %_25504 : %_25504
 ; {>  %_25498~0':(_lst)◂((_p21263)◂(_stg)) %_25503~°0◂{ °1◂{  } °1◂1' 2' }:(_p21261)◂(_stg) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_25504
 ; {>  %_25498~0':(_lst)◂((_p21263)◂(_stg)) %_25504~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂((_p21261)◂(_stg)) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_27704
	mov rdi,r13
	call dlt
LB_27704:
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
	jc LB_27709
	mov rsi,0
	bt r13,0
	jc LB_27709
	jmp LB_27710
LB_27709:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_27710:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_27707
	btr QWORD [rdi],0
	jmp LB_27708
LB_27707:
	bts QWORD [rdi],0
LB_27708:
	mov r13,r14
	bt r12,1
	jc LB_27715
	btr r12,0
	jmp LB_27716
LB_27715:
	bts r12,0
LB_27716:
	mov rsi,1
	bt r12,0
	jc LB_27713
	mov rsi,0
	bt r13,0
	jc LB_27713
	jmp LB_27714
LB_27713:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_27714:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_27711
	btr QWORD [rdi],1
	jmp LB_27712
LB_27711:
	bts QWORD [rdi],1
LB_27712:
	mov r13,r8
	bt r12,2
	jc LB_27719
	btr r12,0
	jmp LB_27720
LB_27719:
	bts r12,0
LB_27720:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,0
	jc LB_27717
	btr QWORD [rdi],2
	jmp LB_27718
LB_27717:
	bts QWORD [rdi],2
LB_27718:
	mov rsi,1
	bt r12,3
	jc LB_27705
	mov rsi,0
	bt r9,0
	jc LB_27705
	jmp LB_27706
LB_27705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27706:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27721:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27723
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27722
LB_27723:
	add rsp,8
	ret
LB_27724:
	add rsp,64
	pop r14
LB_27722:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25270:
NS_E_RDI_25270:
NS_E_25270_ETR_TBL:
NS_E_25270_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_27792
LB_27791:
	add r14,1
LB_27792:
	cmp r14,r10
	jge LB_27793
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27791
	cmp al,10
	jz LB_27791
	cmp al,32
	jz LB_27791
LB_27793:
	push r10
	call NS_E_25271_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27794
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27786
LB_27794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_27797
LB_27796:
	add r14,1
LB_27797:
	cmp r14,r10
	jge LB_27798
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27796
	cmp al,10
	jz LB_27796
	cmp al,32
	jz LB_27796
LB_27798:
	push r10
	call NS_E_25272_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27799
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27800
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27800:
	jmp LB_27786
LB_27799:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27789
	btr r12,1
	clc
	jmp LB_27790
LB_27789:
	bts r12,1
	stc
LB_27790:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27787
	btr r12,0
	clc
	jmp LB_27788
LB_27787:
	bts r12,0
	stc
LB_27788:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27783
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_25505 %_25506 } ⊢ %_25507 : %_25507
 ; {>  %_25506~1':(_lst)◂((_p21263)◂(_stg)) %_25505~0':(_p21263)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25507 ⊢ %_25508 : %_25508
 ; {>  %_25507~°0◂{ 0' 1' }:(_lst)◂((_p21263)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25508
 ; {>  %_25508~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p21263)◂(_stg))) }
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
	jc LB_27777
	btr r12,2
	jmp LB_27778
LB_27777:
	bts r12,2
LB_27778:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_27775
	btr QWORD [rdi],0
	jmp LB_27776
LB_27775:
	bts QWORD [rdi],0
LB_27776:
	mov r8,r14
	bt r12,1
	jc LB_27781
	btr r12,2
	jmp LB_27782
LB_27781:
	bts r12,2
LB_27782:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_27779
	btr QWORD [rdi],1
	jmp LB_27780
LB_27779:
	bts QWORD [rdi],1
LB_27780:
	mov rsi,1
	bt r12,3
	jc LB_27773
	mov rsi,0
	bt r9,0
	jc LB_27773
	jmp LB_27774
LB_27773:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27774:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27783:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27785
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27784
LB_27785:
	add rsp,8
	ret
LB_27786:
	add rsp,32
	pop r14
LB_27784:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_27813
LB_27812:
	add r14,1
LB_27813:
	cmp r14,r10
	jge LB_27814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27812
	cmp al,32
	jz LB_27812
LB_27814:
	add r14,1
	cmp r14,r10
	jg LB_27817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_27817
	jmp LB_27818
LB_27817:
	jmp LB_27807
LB_27818:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_27820
LB_27819:
	add r14,1
LB_27820:
	cmp r14,r10
	jge LB_27821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27819
	cmp al,32
	jz LB_27819
LB_27821:
	add r14,1
	cmp r14,r10
	jg LB_27825
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_27825
	jmp LB_27826
LB_27825:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27823
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27823:
	jmp LB_27807
LB_27826:
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
	jc LB_27810
	btr r12,1
	clc
	jmp LB_27811
LB_27810:
	bts r12,1
	stc
LB_27811:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27808
	btr r12,0
	clc
	jmp LB_27809
LB_27808:
	bts r12,0
	stc
LB_27809:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27804
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_25509 : %_25509
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_25509 ⊢ %_25510 : %_25510
 ; {>  %_25509~°1◂{  }:(_lst)◂(t12685'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25510
 ; {>  %_25510~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12688'(0))) }
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
	jc LB_27802
	mov rsi,0
	bt r9,0
	jc LB_27802
	jmp LB_27803
LB_27802:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27803:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27804:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27806
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27805
LB_27806:
	add rsp,8
	ret
LB_27807:
	add rsp,32
	pop r14
LB_27805:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25271:
NS_E_RDI_25271:
NS_E_25271_ETR_TBL:
NS_E_25271_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_27883
LB_27882:
	add r14,1
LB_27883:
	cmp r14,r10
	jge LB_27884
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27882
	cmp al,10
	jz LB_27882
	cmp al,32
	jz LB_27882
LB_27884:
	push r10
	call NS_E_24373_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27885
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27844
LB_27885:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_27888
LB_27887:
	add r14,1
LB_27888:
	cmp r14,r10
	jge LB_27889
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27887
	cmp al,10
	jz LB_27887
	cmp al,32
	jz LB_27887
LB_27889:
	add r14,3
	cmp r14,r10
	jg LB_27893
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_27893
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_27893
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_27893
	jmp LB_27894
LB_27893:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27891
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27891:
	jmp LB_27844
LB_27894:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_27857
LB_27856:
	add r14,1
LB_27857:
	cmp r14,r10
	jge LB_27858
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27856
	cmp al,10
	jz LB_27856
	cmp al,32
	jz LB_27856
LB_27858:
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27859
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27860
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27860:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27861
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27861:
	jmp LB_27845
LB_27859:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_27864
LB_27863:
	add r14,1
LB_27864:
	cmp r14,r10
	jge LB_27865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27863
	cmp al,10
	jz LB_27863
	cmp al,32
	jz LB_27863
LB_27865:
	add r14,3
	cmp r14,r10
	jg LB_27871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_27871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_27871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_27871
	jmp LB_27872
LB_27871:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27867
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27867:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27868
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27868:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27869
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27869:
	jmp LB_27845
LB_27872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_27874
LB_27873:
	add r14,1
LB_27874:
	cmp r14,r10
	jge LB_27875
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27873
	cmp al,10
	jz LB_27873
	cmp al,32
	jz LB_27873
LB_27875:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27876
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_27877
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_27877:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_27878
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_27878:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27879
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27879:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27880:
	jmp LB_27845
LB_27876:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_27854
	btr r12,4
	clc
	jmp LB_27855
LB_27854:
	bts r12,4
	stc
LB_27855:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_27852
	btr r12,3
	clc
	jmp LB_27853
LB_27852:
	bts r12,3
	stc
LB_27853:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27850
	btr r12,2
	clc
	jmp LB_27851
LB_27850:
	bts r12,2
	stc
LB_27851:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27848
	btr r12,1
	clc
	jmp LB_27849
LB_27848:
	bts r12,1
	stc
LB_27849:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27846
	btr r12,0
	clc
	jmp LB_27847
LB_27846:
	bts r12,0
	stc
LB_27847:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_27841
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_27895
	btr r12,5
	jmp LB_27896
LB_27895:
	bts r12,5
LB_27896:
	mov r8,r10
	bt r12,4
	jc LB_27897
	btr r12,2
	jmp LB_27898
LB_27897:
	bts r12,2
LB_27898:
	mov r10,r14
	bt r12,1
	jc LB_27899
	btr r12,4
	jmp LB_27900
LB_27899:
	bts r12,4
LB_27900:
	mov r14,r11
	bt r12,5
	jc LB_27901
	btr r12,1
	jmp LB_27902
LB_27901:
	bts r12,1
LB_27902:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f21279 { %_25511 %_25512 %_25513 } ⊢ %_25514 : %_25514
 ; {>  %_25511~0':(_p21246)◂((_p21253)◂(_stg)) %_25513~2':(_p21246)◂((_p21254)◂(_stg)) %_25512~1':_p21201 }
; _f21279 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_25514 ⊢ %_25515 : %_25515
 ; {>  %_25514~°0◂{ 0' 1' 2' }:(_p21263)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_25515
 ; {>  %_25515~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p21263)◂(_stg)) }
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
	jc LB_27831
	btr r12,4
	jmp LB_27832
LB_27831:
	bts r12,4
LB_27832:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_27829
	btr QWORD [rdi],0
	jmp LB_27830
LB_27829:
	bts QWORD [rdi],0
LB_27830:
	mov r10,r14
	bt r12,1
	jc LB_27835
	btr r12,4
	jmp LB_27836
LB_27835:
	bts r12,4
LB_27836:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_27833
	btr QWORD [rdi],1
	jmp LB_27834
LB_27833:
	bts QWORD [rdi],1
LB_27834:
	mov r10,r8
	bt r12,2
	jc LB_27839
	btr r12,4
	jmp LB_27840
LB_27839:
	bts r12,4
LB_27840:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_27837
	btr QWORD [rdi],2
	jmp LB_27838
LB_27837:
	bts QWORD [rdi],2
LB_27838:
	mov rsi,1
	bt r12,3
	jc LB_27827
	mov rsi,0
	bt r9,0
	jc LB_27827
	jmp LB_27828
LB_27827:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27828:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27841:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27843
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27842
LB_27843:
	add rsp,8
	ret
LB_27845:
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
LB_27844:
	add rsp,80
	pop r14
LB_27842:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_27924
LB_27923:
	add r14,1
LB_27924:
	cmp r14,r10
	jge LB_27925
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27923
	cmp al,32
	jz LB_27923
LB_27925:
	push r10
	call NS_E_25273_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27926
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27916
LB_27926:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_27929
LB_27928:
	add r14,1
LB_27929:
	cmp r14,r10
	jge LB_27930
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27928
	cmp al,32
	jz LB_27928
LB_27930:
	add r14,1
	cmp r14,r10
	jg LB_27934
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_27934
	jmp LB_27935
LB_27934:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27932
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27932:
	jmp LB_27916
LB_27935:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_27937
LB_27936:
	add r14,1
LB_27937:
	cmp r14,r10
	jge LB_27938
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27936
	cmp al,32
	jz LB_27936
LB_27938:
	push r10
	call NS_E_25273_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27939
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27940
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27940:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27941
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27941:
	jmp LB_27916
LB_27939:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27921
	btr r12,2
	clc
	jmp LB_27922
LB_27921:
	bts r12,2
	stc
LB_27922:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27919
	btr r12,1
	clc
	jmp LB_27920
LB_27919:
	bts r12,1
	stc
LB_27920:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27917
	btr r12,0
	clc
	jmp LB_27918
LB_27917:
	bts r12,0
	stc
LB_27918:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_27913
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_27943
	btr r12,3
	jmp LB_27944
LB_27943:
	bts r12,3
LB_27944:
	mov r14,r8
	bt r12,2
	jc LB_27945
	btr r12,1
	jmp LB_27946
LB_27945:
	bts r12,1
LB_27946:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f21280 { %_25516 %_25517 } ⊢ %_25518 : %_25518
 ; {>  %_25516~0':(_p21264)◂(_stg) %_25517~1':(_p21264)◂(_stg) }
; _f21280 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_25518 ⊢ %_25519 : %_25519
 ; {>  %_25518~°1◂{ 0' 1' }:(_p21263)◂(_stg) }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_25519
 ; {>  %_25519~°0◂°1◂{ 0' 1' }:(_opn)◂((_p21263)◂(_stg)) }
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
	jc LB_27907
	btr r12,2
	jmp LB_27908
LB_27907:
	bts r12,2
LB_27908:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_27905
	btr QWORD [rdi],0
	jmp LB_27906
LB_27905:
	bts QWORD [rdi],0
LB_27906:
	mov r8,r14
	bt r12,1
	jc LB_27911
	btr r12,2
	jmp LB_27912
LB_27911:
	bts r12,2
LB_27912:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_27909
	btr QWORD [rdi],1
	jmp LB_27910
LB_27909:
	bts QWORD [rdi],1
LB_27910:
	mov rsi,1
	bt r12,3
	jc LB_27903
	mov rsi,0
	bt r9,0
	jc LB_27903
	jmp LB_27904
LB_27903:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27904:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27913:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27915
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27914
LB_27915:
	add rsp,8
	ret
LB_27916:
	add rsp,48
	pop r14
LB_27914:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25272:
NS_E_RDI_25272:
NS_E_25272_ETR_TBL:
NS_E_25272_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_27982
LB_27981:
	add r14,1
LB_27982:
	cmp r14,r10
	jge LB_27983
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27981
	cmp al,10
	jz LB_27981
	cmp al,32
	jz LB_27981
LB_27983:
	add r14,1
	cmp r14,r10
	jg LB_27986
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_27986
	jmp LB_27987
LB_27986:
	jmp LB_27960
LB_27987:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_27969
LB_27968:
	add r14,1
LB_27969:
	cmp r14,r10
	jge LB_27970
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27968
	cmp al,10
	jz LB_27968
	cmp al,32
	jz LB_27968
LB_27970:
	push r10
	call NS_E_25271_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27971
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27972:
	jmp LB_27961
LB_27971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_27975
LB_27974:
	add r14,1
LB_27975:
	cmp r14,r10
	jge LB_27976
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_27974
	cmp al,10
	jz LB_27974
	cmp al,32
	jz LB_27974
LB_27976:
	push r10
	call NS_E_25272_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_27977
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_27978
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_27978:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_27979
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_27979:
	jmp LB_27961
LB_27977:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_27966
	btr r12,2
	clc
	jmp LB_27967
LB_27966:
	bts r12,2
	stc
LB_27967:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_27964
	btr r12,1
	clc
	jmp LB_27965
LB_27964:
	bts r12,1
	stc
LB_27965:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_27962
	btr r12,0
	clc
	jmp LB_27963
LB_27962:
	bts r12,0
	stc
LB_27963:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_27957
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_27988
	btr r12,3
	jmp LB_27989
LB_27988:
	bts r12,3
LB_27989:
	mov r14,r8
	bt r12,2
	jc LB_27990
	btr r12,1
	jmp LB_27991
LB_27990:
	bts r12,1
LB_27991:
	mov r8,r13
	bt r12,0
	jc LB_27992
	btr r12,2
	jmp LB_27993
LB_27992:
	bts r12,2
LB_27993:
	mov r13,r9
	bt r12,3
	jc LB_27994
	btr r12,0
	jmp LB_27995
LB_27994:
	bts r12,0
LB_27995:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_25520 %_25521 } ⊢ %_25522 : %_25522
 ; {>  %_25521~1':(_lst)◂((_p21263)◂(_stg)) %_25520~0':(_p21263)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25522 ⊢ %_25523 : %_25523
 ; {>  %_25522~°0◂{ 0' 1' }:(_lst)◂((_p21263)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25523
 ; {>  %_25523~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p21263)◂(_stg))) }
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
	jc LB_27951
	btr r12,2
	jmp LB_27952
LB_27951:
	bts r12,2
LB_27952:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_27949
	btr QWORD [rdi],0
	jmp LB_27950
LB_27949:
	bts QWORD [rdi],0
LB_27950:
	mov r8,r14
	bt r12,1
	jc LB_27955
	btr r12,2
	jmp LB_27956
LB_27955:
	bts r12,2
LB_27956:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_27953
	btr QWORD [rdi],1
	jmp LB_27954
LB_27953:
	bts QWORD [rdi],1
LB_27954:
	mov rsi,1
	bt r12,3
	jc LB_27947
	mov rsi,0
	bt r9,0
	jc LB_27947
	jmp LB_27948
LB_27947:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27948:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27957:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_27959
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27958
LB_27959:
	add rsp,8
	ret
LB_27961:
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
LB_27960:
	add rsp,48
	pop r14
LB_27958:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_28007
LB_28006:
	add r14,1
LB_28007:
	cmp r14,r10
	jge LB_28008
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28006
	cmp al,32
	jz LB_28006
LB_28008:
	add r14,1
	cmp r14,r10
	jg LB_28011
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_28011
	jmp LB_28012
LB_28011:
	jmp LB_28001
LB_28012:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_28014
LB_28013:
	add r14,1
LB_28014:
	cmp r14,r10
	jge LB_28015
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28013
	cmp al,32
	jz LB_28013
LB_28015:
	add r14,1
	cmp r14,r10
	jg LB_28019
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_28019
	jmp LB_28020
LB_28019:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28017
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28017:
	jmp LB_28001
LB_28020:
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
	jc LB_28004
	btr r12,1
	clc
	jmp LB_28005
LB_28004:
	bts r12,1
	stc
LB_28005:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28002
	btr r12,0
	clc
	jmp LB_28003
LB_28002:
	bts r12,0
	stc
LB_28003:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_27998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_25524 : %_25524
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_25524 ⊢ %_25525 : %_25525
 ; {>  %_25524~°1◂{  }:(_lst)◂(t12719'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25525
 ; {>  %_25525~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12722'(0))) }
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
	jc LB_27996
	mov rsi,0
	bt r9,0
	jc LB_27996
	jmp LB_27997
LB_27996:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_27997:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_27998:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28000
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_27999
LB_28000:
	add rsp,8
	ret
LB_28001:
	add rsp,32
	pop r14
LB_27999:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25273:
NS_E_RDI_25273:
NS_E_25273_ETR_TBL:
NS_E_25273_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28036
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28028
LB_28036:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_28044
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_28044
	jmp LB_28045
LB_28044:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28042
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28042:
	jmp LB_28028
LB_28045:
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
	jc LB_28031
	btr r12,1
	clc
	jmp LB_28032
LB_28031:
	bts r12,1
	stc
LB_28032:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28029
	btr r12,0
	clc
	jmp LB_28030
LB_28029:
	bts r12,0
	stc
LB_28030:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_28025
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f21282 %_25526 ⊢ %_25527 : %_25527
 ; {>  %_25526~0':_stg }
; _f21282 0' ⊢ °1◂0'
; _some %_25527 ⊢ %_25528 : %_25528
 ; {>  %_25527~°1◂0':(_p21264)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25528
 ; {>  %_25528~°0◂°1◂0':(_opn)◂((_p21264)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28023
	btr r12,3
	jmp LB_28024
LB_28023:
	bts r12,3
LB_28024:
	mov rsi,1
	bt r12,3
	jc LB_28021
	mov rsi,0
	bt r9,0
	jc LB_28021
	jmp LB_28022
LB_28021:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28022:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28025:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28027
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28026
LB_28027:
	add rsp,8
	ret
LB_28028:
	add rsp,32
	pop r14
LB_28026:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_24244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28059
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28053
LB_28059:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28054
	btr r12,0
	clc
	jmp LB_28055
LB_28054:
	bts r12,0
	stc
LB_28055:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28050
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21281 %_25529 ⊢ %_25530 : %_25530
 ; {>  %_25529~0':_p21249 }
; _f21281 0' ⊢ °0◂0'
; _some %_25530 ⊢ %_25531 : %_25531
 ; {>  %_25530~°0◂0':(_p21264)◂(t12732'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25531
 ; {>  %_25531~°0◂°0◂0':(_opn)◂((_p21264)◂(t12735'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28048
	btr r12,3
	jmp LB_28049
LB_28048:
	bts r12,3
LB_28049:
	mov rsi,1
	bt r12,3
	jc LB_28046
	mov rsi,0
	bt r9,0
	jc LB_28046
	jmp LB_28047
LB_28046:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28047:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28050:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28052
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28051
LB_28052:
	add rsp,8
	ret
LB_28053:
	add rsp,16
	pop r14
LB_28051:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25274:
NS_E_RDI_25274:
NS_E_25274_ETR_TBL:
NS_E_25274_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_28082
LB_28081:
	add r14,1
LB_28082:
	cmp r14,r10
	jge LB_28083
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28081
	cmp al,10
	jz LB_28081
	cmp al,32
	jz LB_28081
LB_28083:
	add r14,1
	cmp r14,r10
	jg LB_28086
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_28086
	jmp LB_28087
LB_28086:
	jmp LB_28072
LB_28087:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_28089
LB_28088:
	add r14,1
LB_28089:
	cmp r14,r10
	jge LB_28090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28088
	cmp al,10
	jz LB_28088
	cmp al,32
	jz LB_28088
LB_28090:
	add r14,1
	cmp r14,r10
	jg LB_28094
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_28094
	jmp LB_28095
LB_28094:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28092
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28092:
	jmp LB_28072
LB_28095:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_28097
LB_28096:
	add r14,1
LB_28097:
	cmp r14,r10
	jge LB_28098
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28096
	cmp al,10
	jz LB_28096
	cmp al,32
	jz LB_28096
LB_28098:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28099
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28100
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28100:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28101
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28101:
	jmp LB_28072
LB_28099:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_28104
LB_28103:
	add r14,1
LB_28104:
	cmp r14,r10
	jge LB_28105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28103
	cmp al,10
	jz LB_28103
	cmp al,32
	jz LB_28103
LB_28105:
	push r10
	call NS_E_25275_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28106
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_28107
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_28107:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28108
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28108:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28109:
	jmp LB_28072
LB_28106:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_28079
	btr r12,3
	clc
	jmp LB_28080
LB_28079:
	bts r12,3
	stc
LB_28080:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_28077
	btr r12,2
	clc
	jmp LB_28078
LB_28077:
	bts r12,2
	stc
LB_28078:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28075
	btr r12,1
	clc
	jmp LB_28076
LB_28075:
	bts r12,1
	stc
LB_28076:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28073
	btr r12,0
	clc
	jmp LB_28074
LB_28073:
	bts r12,0
	stc
LB_28074:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_28069
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_28111
	btr r12,4
	jmp LB_28112
LB_28111:
	bts r12,4
LB_28112:
	mov r14,r9
	bt r12,3
	jc LB_28113
	btr r12,1
	jmp LB_28114
LB_28113:
	bts r12,1
LB_28114:
	mov r9,r13
	bt r12,0
	jc LB_28115
	btr r12,3
	jmp LB_28116
LB_28115:
	bts r12,3
LB_28116:
	mov r13,r8
	bt r12,2
	jc LB_28117
	btr r12,0
	jmp LB_28118
LB_28117:
	bts r12,0
LB_28118:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_25532 %_25533 } ⊢ %_25534 : %_25534
 ; {>  %_25533~1':_p21295 %_25532~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_25534
 ; {>  %_25534~°0◂{ 0' 1' }:(_opn)◂({ _stg _p21295 }) }
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
	jc LB_28063
	btr r12,2
	jmp LB_28064
LB_28063:
	bts r12,2
LB_28064:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_28061
	btr QWORD [rdi],0
	jmp LB_28062
LB_28061:
	bts QWORD [rdi],0
LB_28062:
	mov r8,r14
	bt r12,1
	jc LB_28067
	btr r12,2
	jmp LB_28068
LB_28067:
	bts r12,2
LB_28068:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_28065
	btr QWORD [rdi],1
	jmp LB_28066
LB_28065:
	bts QWORD [rdi],1
LB_28066:
	mov r8,0
	bts r12,2
	ret
LB_28069:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28071
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28070
LB_28071:
	add rsp,8
	ret
LB_28072:
	add rsp,64
	pop r14
LB_28070:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25275:
NS_E_RDI_25275:
NS_E_25275_ETR_TBL:
NS_E_25275_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_28130
LB_28129:
	add r14,1
LB_28130:
	cmp r14,r10
	jge LB_28131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28129
	cmp al,10
	jz LB_28129
	cmp al,32
	jz LB_28129
LB_28131:
	push r10
	call NS_E_25276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28132
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28126
LB_28132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28127
	btr r12,0
	clc
	jmp LB_28128
LB_28127:
	bts r12,0
	stc
LB_28128:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28123
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21318 %_25535 ⊢ %_25536 : %_25536
 ; {>  %_25535~0':_p21297 }
; _f21318 0' ⊢ °1◂0'
; _some %_25536 ⊢ %_25537 : %_25537
 ; {>  %_25536~°1◂0':_p21295 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25537
 ; {>  %_25537~°0◂°1◂0':(_opn)◂(_p21295) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28121
	btr r12,3
	jmp LB_28122
LB_28121:
	bts r12,3
LB_28122:
	mov rsi,1
	bt r12,3
	jc LB_28119
	mov rsi,0
	bt r9,0
	jc LB_28119
	jmp LB_28120
LB_28119:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28120:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28123:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28125
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28124
LB_28125:
	add rsp,8
	ret
LB_28126:
	add rsp,16
	pop r14
LB_28124:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_28145
LB_28144:
	add r14,1
LB_28145:
	cmp r14,r10
	jge LB_28146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28144
	cmp al,10
	jz LB_28144
	cmp al,32
	jz LB_28144
LB_28146:
	push r10
	call NS_E_25284_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28147
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28141
LB_28147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28142
	btr r12,0
	clc
	jmp LB_28143
LB_28142:
	bts r12,0
	stc
LB_28143:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28138
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21317 %_25538 ⊢ %_25539 : %_25539
 ; {>  %_25538~0':_p21296 }
; _f21317 0' ⊢ °0◂0'
; _some %_25539 ⊢ %_25540 : %_25540
 ; {>  %_25539~°0◂0':_p21295 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25540
 ; {>  %_25540~°0◂°0◂0':(_opn)◂(_p21295) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28136
	btr r12,3
	jmp LB_28137
LB_28136:
	bts r12,3
LB_28137:
	mov rsi,1
	bt r12,3
	jc LB_28134
	mov rsi,0
	bt r9,0
	jc LB_28134
	jmp LB_28135
LB_28134:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28135:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28138:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28140
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28139
LB_28140:
	add rsp,8
	ret
LB_28141:
	add rsp,16
	pop r14
LB_28139:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25276:
NS_E_RDI_25276:
NS_E_25276_ETR_TBL:
NS_E_25276_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_28198
LB_28197:
	add r14,1
LB_28198:
	cmp r14,r10
	jge LB_28199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28197
	cmp al,10
	jz LB_28197
	cmp al,32
	jz LB_28197
LB_28199:
	push r10
	call NS_E_25283_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28200
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28176
LB_28200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_28185
LB_28184:
	add r14,1
LB_28185:
	cmp r14,r10
	jge LB_28186
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28184
	cmp al,10
	jz LB_28184
	cmp al,32
	jz LB_28184
LB_28186:
	push r10
	call NS_E_25278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28187
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28188
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28188:
	jmp LB_28177
LB_28187:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_28191
LB_28190:
	add r14,1
LB_28191:
	cmp r14,r10
	jge LB_28192
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28190
	cmp al,10
	jz LB_28190
	cmp al,32
	jz LB_28190
LB_28192:
	push r10
	call NS_E_25277_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28193
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28194
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28194:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28195
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28195:
	jmp LB_28177
LB_28193:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_28182
	btr r12,2
	clc
	jmp LB_28183
LB_28182:
	bts r12,2
	stc
LB_28183:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28180
	btr r12,1
	clc
	jmp LB_28181
LB_28180:
	bts r12,1
	stc
LB_28181:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28178
	btr r12,0
	clc
	jmp LB_28179
LB_28178:
	bts r12,0
	stc
LB_28179:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_28173
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_28202
	btr r12,5
	jmp LB_28203
LB_28202:
	bts r12,5
LB_28203:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_28206
	btr r12,6
	clc
	jmp LB_28207
LB_28206:
	bts r12,6
	stc
LB_28207:
	mov r8,rcx
	bt r12,6
	jc LB_28204
	btr r12,2
	jmp LB_28205
LB_28204:
	bts r12,2
LB_28205:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_28210
	btr r12,6
	clc
	jmp LB_28211
LB_28210:
	bts r12,6
	stc
LB_28211:
	mov r9,rcx
	bt r12,6
	jc LB_28208
	btr r12,3
	jmp LB_28209
LB_28208:
	bts r12,3
LB_28209:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_28214
	btr r12,6
	clc
	jmp LB_28215
LB_28214:
	bts r12,6
	stc
LB_28215:
	mov r10,rcx
	bt r12,6
	jc LB_28212
	btr r12,4
	jmp LB_28213
LB_28212:
	bts r12,4
LB_28213:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f21322 { %_25543 %_25544 %_25541 %_25542 %_25545 } ⊢ %_25546 : %_25546
 ; {>  %_25541~0':_p21298 %_25543~2':(_p21246)◂((_p21254)◂(_stg)) %_25542~1':_p21299 %_25545~4':(_opn)◂(_p21297) %_25544~3':(_p21259)◂(_stg) }
; _f21322 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_25546 ⊢ %_25547 : %_25547
 ; {>  %_25546~°1◂{ 2' 3' 0' 1' 4' }:_p21297 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_25547
 ; {>  %_25547~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p21297) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_28149
	btr r12,5
	jmp LB_28150
LB_28149:
	bts r12,5
LB_28150:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_28155
	btr r12,6
	jmp LB_28156
LB_28155:
	bts r12,6
LB_28156:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_28153
	btr QWORD [rdi],0
	jmp LB_28154
LB_28153:
	bts QWORD [rdi],0
LB_28154:
	mov rcx,r11
	bt r12,5
	jc LB_28159
	btr r12,6
	jmp LB_28160
LB_28159:
	bts r12,6
LB_28160:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_28157
	btr QWORD [rdi],1
	jmp LB_28158
LB_28157:
	bts QWORD [rdi],1
LB_28158:
	mov rcx,r13
	bt r12,0
	jc LB_28163
	btr r12,6
	jmp LB_28164
LB_28163:
	bts r12,6
LB_28164:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_28161
	btr QWORD [rdi],2
	jmp LB_28162
LB_28161:
	bts QWORD [rdi],2
LB_28162:
	mov rcx,r14
	bt r12,1
	jc LB_28167
	btr r12,6
	jmp LB_28168
LB_28167:
	bts r12,6
LB_28168:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_28165
	btr QWORD [rdi],3
	jmp LB_28166
LB_28165:
	bts QWORD [rdi],3
LB_28166:
	mov rcx,r10
	bt r12,4
	jc LB_28171
	btr r12,6
	jmp LB_28172
LB_28171:
	bts r12,6
LB_28172:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_28169
	btr QWORD [rdi],4
	jmp LB_28170
LB_28169:
	bts QWORD [rdi],4
LB_28170:
	mov rsi,1
	bt r12,3
	jc LB_28151
	mov rsi,0
	bt r9,0
	jc LB_28151
	jmp LB_28152
LB_28151:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28152:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28173:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28175
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28174
LB_28175:
	add rsp,8
	ret
LB_28177:
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
LB_28176:
	add rsp,48
	pop r14
LB_28174:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_28257
LB_28256:
	add r14,1
LB_28257:
	cmp r14,r10
	jge LB_28258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28256
	cmp al,10
	jz LB_28256
	cmp al,32
	jz LB_28256
LB_28258:
	push r10
	call NS_E_25282_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28259
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28247
LB_28259:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_28262
LB_28261:
	add r14,1
LB_28262:
	cmp r14,r10
	jge LB_28263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28261
	cmp al,10
	jz LB_28261
	cmp al,32
	jz LB_28261
LB_28263:
	push r10
	call NS_E_25278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28264
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28265
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28265:
	jmp LB_28247
LB_28264:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_28268
LB_28267:
	add r14,1
LB_28268:
	cmp r14,r10
	jge LB_28269
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28267
	cmp al,10
	jz LB_28267
	cmp al,32
	jz LB_28267
LB_28269:
	push r10
	call NS_E_25277_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28270
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28271
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28271:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28272
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28272:
	jmp LB_28247
LB_28270:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_28275
LB_28274:
	add r14,1
LB_28275:
	cmp r14,r10
	jge LB_28276
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28274
	cmp al,10
	jz LB_28274
	cmp al,32
	jz LB_28274
LB_28276:
	push r10
	call NS_E_25276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28277
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_28278
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_28278:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28279
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28279:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28280
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28280:
	jmp LB_28247
LB_28277:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_28254
	btr r12,3
	clc
	jmp LB_28255
LB_28254:
	bts r12,3
	stc
LB_28255:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_28252
	btr r12,2
	clc
	jmp LB_28253
LB_28252:
	bts r12,2
	stc
LB_28253:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28250
	btr r12,1
	clc
	jmp LB_28251
LB_28250:
	bts r12,1
	stc
LB_28251:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28248
	btr r12,0
	clc
	jmp LB_28249
LB_28248:
	bts r12,0
	stc
LB_28249:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_28244
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_28282
	btr r12,5
	jmp LB_28283
LB_28282:
	bts r12,5
LB_28283:
	mov rcx,r8
	bt r12,2
	jc LB_28284
	btr r12,6
	jmp LB_28285
LB_28284:
	bts r12,6
LB_28285:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_28288
	btr r12,7
	clc
	jmp LB_28289
LB_28288:
	bts r12,7
	stc
LB_28289:
	mov r8,rdx
	bt r12,7
	jc LB_28286
	btr r12,2
	jmp LB_28287
LB_28286:
	bts r12,2
LB_28287:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_28292
	btr r12,7
	clc
	jmp LB_28293
LB_28292:
	bts r12,7
	stc
LB_28293:
	mov r9,rdx
	bt r12,7
	jc LB_28290
	btr r12,3
	jmp LB_28291
LB_28290:
	bts r12,3
LB_28291:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_28296
	btr r12,7
	clc
	jmp LB_28297
LB_28296:
	bts r12,7
	stc
LB_28297:
	mov r10,rdx
	bt r12,7
	jc LB_28294
	btr r12,4
	jmp LB_28295
LB_28294:
	bts r12,4
LB_28295:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f21321 { %_25550 %_25551 %_25548 %_25549 %_25552 %_25553 } ⊢ %_25554 : %_25554
 ; {>  %_25553~5':_p21297 %_25551~3':(_p21259)◂(_stg) %_25549~1':_p21299 %_25550~2':(_p21246)◂((_p21254)◂(_stg)) %_25552~4':(_opn)◂(_p21297) %_25548~0':_p21298 }
; _f21321 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_25554 ⊢ %_25555 : %_25555
 ; {>  %_25554~°0◂{ 2' 3' 0' 1' 4' 5' }:_p21297 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_25555
 ; {>  %_25555~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p21297) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_28216
	btr r12,6
	jmp LB_28217
LB_28216:
	bts r12,6
LB_28217:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_28222
	btr r12,7
	jmp LB_28223
LB_28222:
	bts r12,7
LB_28223:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_28220
	btr QWORD [rdi],0
	jmp LB_28221
LB_28220:
	bts QWORD [rdi],0
LB_28221:
	mov rdx,rcx
	bt r12,6
	jc LB_28226
	btr r12,7
	jmp LB_28227
LB_28226:
	bts r12,7
LB_28227:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_28224
	btr QWORD [rdi],1
	jmp LB_28225
LB_28224:
	bts QWORD [rdi],1
LB_28225:
	mov rdx,r13
	bt r12,0
	jc LB_28230
	btr r12,7
	jmp LB_28231
LB_28230:
	bts r12,7
LB_28231:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,7
	jc LB_28228
	btr QWORD [rdi],2
	jmp LB_28229
LB_28228:
	bts QWORD [rdi],2
LB_28229:
	mov rdx,r14
	bt r12,1
	jc LB_28234
	btr r12,7
	jmp LB_28235
LB_28234:
	bts r12,7
LB_28235:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,7
	jc LB_28232
	btr QWORD [rdi],3
	jmp LB_28233
LB_28232:
	bts QWORD [rdi],3
LB_28233:
	mov rdx,r10
	bt r12,4
	jc LB_28238
	btr r12,7
	jmp LB_28239
LB_28238:
	bts r12,7
LB_28239:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,7
	jc LB_28236
	btr QWORD [rdi],4
	jmp LB_28237
LB_28236:
	bts QWORD [rdi],4
LB_28237:
	mov rdx,r11
	bt r12,5
	jc LB_28242
	btr r12,7
	jmp LB_28243
LB_28242:
	bts r12,7
LB_28243:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*5],rsi
	bt r12,7
	jc LB_28240
	btr QWORD [rdi],5
	jmp LB_28241
LB_28240:
	bts QWORD [rdi],5
LB_28241:
	mov rsi,1
	bt r12,3
	jc LB_28218
	mov rsi,0
	bt r9,0
	jc LB_28218
	jmp LB_28219
LB_28218:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28219:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28244:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28246
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28245
LB_28246:
	add rsp,8
	ret
LB_28247:
	add rsp,64
	pop r14
LB_28245:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25277:
NS_E_RDI_25277:
NS_E_25277_ETR_TBL:
NS_E_25277_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_28352
LB_28351:
	add r14,1
LB_28352:
	cmp r14,r10
	jge LB_28353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28351
	cmp al,10
	jz LB_28351
	cmp al,32
	jz LB_28351
LB_28353:
	add r14,1
	cmp r14,r10
	jg LB_28356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_28356
	jmp LB_28357
LB_28356:
	jmp LB_28315
LB_28357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_28359
LB_28358:
	add r14,1
LB_28359:
	cmp r14,r10
	jge LB_28360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28358
	cmp al,10
	jz LB_28358
	cmp al,32
	jz LB_28358
LB_28360:
	add r14,3
	cmp r14,r10
	jg LB_28364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_28364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_28364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_28364
	jmp LB_28365
LB_28364:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28362:
	jmp LB_28315
LB_28365:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_28328
LB_28327:
	add r14,1
LB_28328:
	cmp r14,r10
	jge LB_28329
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28327
	cmp al,10
	jz LB_28327
	cmp al,32
	jz LB_28327
LB_28329:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28330
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28331
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28331:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28332
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28332:
	jmp LB_28316
LB_28330:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_28335
LB_28334:
	add r14,1
LB_28335:
	cmp r14,r10
	jge LB_28336
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28334
	cmp al,10
	jz LB_28334
	cmp al,32
	jz LB_28334
LB_28336:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28337
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_28338
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_28338:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28339
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28339:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28340
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28340:
	jmp LB_28316
LB_28337:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_28343
LB_28342:
	add r14,1
LB_28343:
	cmp r14,r10
	jge LB_28344
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28342
	cmp al,10
	jz LB_28342
	cmp al,32
	jz LB_28342
LB_28344:
	push r10
	call NS_E_25276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28345
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_28346
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_28346:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_28347
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_28347:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28348
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28348:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28349
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28349:
	jmp LB_28316
LB_28345:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_28325
	btr r12,4
	clc
	jmp LB_28326
LB_28325:
	bts r12,4
	stc
LB_28326:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_28323
	btr r12,3
	clc
	jmp LB_28324
LB_28323:
	bts r12,3
	stc
LB_28324:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_28321
	btr r12,2
	clc
	jmp LB_28322
LB_28321:
	bts r12,2
	stc
LB_28322:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28319
	btr r12,1
	clc
	jmp LB_28320
LB_28319:
	bts r12,1
	stc
LB_28320:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28317
	btr r12,0
	clc
	jmp LB_28318
LB_28317:
	bts r12,0
	stc
LB_28318:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_28312
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_28366
	btr r12,5
	jmp LB_28367
LB_28366:
	bts r12,5
LB_28367:
	mov r8,r10
	bt r12,4
	jc LB_28368
	btr r12,2
	jmp LB_28369
LB_28368:
	bts r12,2
LB_28369:
	mov r10,r14
	bt r12,1
	jc LB_28370
	btr r12,4
	jmp LB_28371
LB_28370:
	bts r12,4
LB_28371:
	mov r14,r9
	bt r12,3
	jc LB_28372
	btr r12,1
	jmp LB_28373
LB_28372:
	bts r12,1
LB_28373:
	mov r9,r13
	bt r12,0
	jc LB_28374
	btr r12,3
	jmp LB_28375
LB_28374:
	bts r12,3
LB_28375:
	mov r13,r11
	bt r12,5
	jc LB_28376
	btr r12,0
	jmp LB_28377
LB_28376:
	bts r12,0
LB_28377:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25558 ⊢ %_25559 : %_25559
 ; {>  %_25556~0':(_p21246)◂((_p21254)◂(_stg)) %_25558~2':_p21297 %_25557~1':(_p21259)◂(_stg) }
; _some 2' ⊢ °0◂2'
; _some { %_25556 %_25557 %_25559 } ⊢ %_25560 : %_25560
 ; {>  %_25556~0':(_p21246)◂((_p21254)◂(_stg)) %_25559~°0◂2':(_opn)◂(_p21297) %_25557~1':(_p21259)◂(_stg) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_25560
 ; {>  %_25560~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) (_opn)◂(_p21297) }) }
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
	jc LB_28300
	btr r12,4
	jmp LB_28301
LB_28300:
	bts r12,4
LB_28301:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_28298
	btr QWORD [rdi],0
	jmp LB_28299
LB_28298:
	bts QWORD [rdi],0
LB_28299:
	mov r10,r14
	bt r12,1
	jc LB_28304
	btr r12,4
	jmp LB_28305
LB_28304:
	bts r12,4
LB_28305:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_28302
	btr QWORD [rdi],1
	jmp LB_28303
LB_28302:
	bts QWORD [rdi],1
LB_28303:
	mov r10,r8
	bt r12,2
	jc LB_28310
	btr r12,4
	jmp LB_28311
LB_28310:
	bts r12,4
LB_28311:
	mov rsi,1
	bt r12,4
	jc LB_28308
	mov rsi,0
	bt r10,0
	jc LB_28308
	jmp LB_28309
LB_28308:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_28309:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_28306
	btr QWORD [rdi],2
	jmp LB_28307
LB_28306:
	bts QWORD [rdi],2
LB_28307:
	mov r8,0
	bts r12,2
	ret
LB_28312:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28314
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28313
LB_28314:
	add rsp,8
	ret
LB_28316:
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
LB_28315:
	add rsp,80
	pop r14
LB_28313:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_28415
LB_28414:
	add r14,1
LB_28415:
	cmp r14,r10
	jge LB_28416
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28414
	cmp al,10
	jz LB_28414
	cmp al,32
	jz LB_28414
LB_28416:
	add r14,3
	cmp r14,r10
	jg LB_28419
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_28419
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_28419
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_28419
	jmp LB_28420
LB_28419:
	jmp LB_28393
LB_28420:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_28402
LB_28401:
	add r14,1
LB_28402:
	cmp r14,r10
	jge LB_28403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28401
	cmp al,10
	jz LB_28401
	cmp al,32
	jz LB_28401
LB_28403:
	push r10
	call NS_E_24634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28404
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28405:
	jmp LB_28394
LB_28404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_28408
LB_28407:
	add r14,1
LB_28408:
	cmp r14,r10
	jge LB_28409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28407
	cmp al,10
	jz LB_28407
	cmp al,32
	jz LB_28407
LB_28409:
	push r10
	call NS_E_25260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28410
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28411
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28411:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28412
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28412:
	jmp LB_28394
LB_28410:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_28399
	btr r12,2
	clc
	jmp LB_28400
LB_28399:
	bts r12,2
	stc
LB_28400:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28397
	btr r12,1
	clc
	jmp LB_28398
LB_28397:
	bts r12,1
	stc
LB_28398:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28395
	btr r12,0
	clc
	jmp LB_28396
LB_28395:
	bts r12,0
	stc
LB_28396:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_28390
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_28421
	btr r12,3
	jmp LB_28422
LB_28421:
	bts r12,3
LB_28422:
	mov r14,r8
	bt r12,2
	jc LB_28423
	btr r12,1
	jmp LB_28424
LB_28423:
	bts r12,1
LB_28424:
	mov r8,r13
	bt r12,0
	jc LB_28425
	btr r12,2
	jmp LB_28426
LB_28425:
	bts r12,2
LB_28426:
	mov r13,r9
	bt r12,3
	jc LB_28427
	btr r12,0
	jmp LB_28428
LB_28427:
	bts r12,0
LB_28428:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_25563 : %_25563
 ; {>  %_25562~1':(_p21259)◂(_stg) %_25561~0':(_p21246)◂((_p21254)◂(_stg)) }
; _none {  } ⊢ °1◂{  }
; _some { %_25561 %_25562 %_25563 } ⊢ %_25564 : %_25564
 ; {>  %_25563~°1◂{  }:(_opn)◂(t12785'(0)) %_25562~1':(_p21259)◂(_stg) %_25561~0':(_p21246)◂((_p21254)◂(_stg)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_25564
 ; {>  %_25564~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ (_p21246)◂((_p21254)◂(_stg)) (_p21259)◂(_stg) (_opn)◂(t12788'(0)) }) }
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
	jc LB_28380
	btr r12,2
	jmp LB_28381
LB_28380:
	bts r12,2
LB_28381:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_28378
	btr QWORD [rdi],0
	jmp LB_28379
LB_28378:
	bts QWORD [rdi],0
LB_28379:
	mov r8,r14
	bt r12,1
	jc LB_28384
	btr r12,2
	jmp LB_28385
LB_28384:
	bts r12,2
LB_28385:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_28382
	btr QWORD [rdi],1
	jmp LB_28383
LB_28382:
	bts QWORD [rdi],1
LB_28383:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_28388
	mov rsi,0
	bt r8,0
	jc LB_28388
	jmp LB_28389
LB_28388:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_28389:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_28386
	btr QWORD [rdi],2
	jmp LB_28387
LB_28386:
	bts QWORD [rdi],2
LB_28387:
	mov r8,0
	bts r12,2
	ret
LB_28390:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28392
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28391
LB_28392:
	add rsp,8
	ret
LB_28394:
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
LB_28393:
	add rsp,48
	pop r14
LB_28391:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25278:
NS_E_RDI_25278:
NS_E_25278_ETR_TBL:
NS_E_25278_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_28449
LB_28448:
	add r14,1
LB_28449:
	cmp r14,r10
	jge LB_28450
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28448
	cmp al,10
	jz LB_28448
	cmp al,32
	jz LB_28448
LB_28450:
	add r14,2
	cmp r14,r10
	jg LB_28453
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_28453
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_28453
	jmp LB_28454
LB_28453:
	jmp LB_28436
LB_28454:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_28443
LB_28442:
	add r14,1
LB_28443:
	cmp r14,r10
	jge LB_28444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28442
	cmp al,10
	jz LB_28442
	cmp al,32
	jz LB_28442
LB_28444:
	push r10
	call NS_E_25279_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28445
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28446
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28446:
	jmp LB_28437
LB_28445:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28440
	btr r12,1
	clc
	jmp LB_28441
LB_28440:
	bts r12,1
	stc
LB_28441:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28438
	btr r12,0
	clc
	jmp LB_28439
LB_28438:
	bts r12,0
	stc
LB_28439:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_28433
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_28455
	btr r12,2
	jmp LB_28456
LB_28455:
	bts r12,2
LB_28456:
	mov r13,r14
	bt r12,1
	jc LB_28457
	btr r12,0
	jmp LB_28458
LB_28457:
	bts r12,0
LB_28458:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21326 %_25565 ⊢ %_25566 : %_25566
 ; {>  %_25565~0':_p21300 }
; _f21326 0' ⊢ °0◂0'
; _some %_25566 ⊢ %_25567 : %_25567
 ; {>  %_25566~°0◂0':_p21299 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25567
 ; {>  %_25567~°0◂°0◂0':(_opn)◂(_p21299) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28431
	btr r12,3
	jmp LB_28432
LB_28431:
	bts r12,3
LB_28432:
	mov rsi,1
	bt r12,3
	jc LB_28429
	mov rsi,0
	bt r9,0
	jc LB_28429
	jmp LB_28430
LB_28429:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28430:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28433:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28435
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28434
LB_28435:
	add rsp,8
	ret
LB_28437:
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
LB_28436:
	add rsp,32
	pop r14
LB_28434:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_28478
LB_28477:
	add r14,1
LB_28478:
	cmp r14,r10
	jge LB_28479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28477
	cmp al,10
	jz LB_28477
	cmp al,32
	jz LB_28477
LB_28479:
	push r10
	call NS_E_25280_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28480
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28472
LB_28480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_28483
LB_28482:
	add r14,1
LB_28483:
	cmp r14,r10
	jge LB_28484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28482
	cmp al,10
	jz LB_28482
	cmp al,32
	jz LB_28482
LB_28484:
	push r10
	call NS_E_25278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28485
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28486
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28486:
	jmp LB_28472
LB_28485:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28475
	btr r12,1
	clc
	jmp LB_28476
LB_28475:
	bts r12,1
	stc
LB_28476:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28473
	btr r12,0
	clc
	jmp LB_28474
LB_28473:
	bts r12,0
	stc
LB_28474:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_28469
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f21327 { %_25568 %_25569 } ⊢ %_25570 : %_25570
 ; {>  %_25568~0':_p21301 %_25569~1':_p21299 }
; _f21327 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_25570 ⊢ %_25571 : %_25571
 ; {>  %_25570~°1◂{ 0' 1' }:_p21299 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_25571
 ; {>  %_25571~°0◂°1◂{ 0' 1' }:(_opn)◂(_p21299) }
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
	jc LB_28463
	btr r12,2
	jmp LB_28464
LB_28463:
	bts r12,2
LB_28464:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_28461
	btr QWORD [rdi],0
	jmp LB_28462
LB_28461:
	bts QWORD [rdi],0
LB_28462:
	mov r8,r14
	bt r12,1
	jc LB_28467
	btr r12,2
	jmp LB_28468
LB_28467:
	bts r12,2
LB_28468:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_28465
	btr QWORD [rdi],1
	jmp LB_28466
LB_28465:
	bts QWORD [rdi],1
LB_28466:
	mov rsi,1
	bt r12,3
	jc LB_28459
	mov rsi,0
	bt r9,0
	jc LB_28459
	jmp LB_28460
LB_28459:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28460:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28469:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28471
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28470
LB_28471:
	add rsp,8
	ret
LB_28472:
	add rsp,32
	pop r14
LB_28470:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_28490
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f21328 {  } ⊢ %_25572 : %_25572
 ; {>  }
; _f21328 {  } ⊢ °2◂{  }
; _some %_25572 ⊢ %_25573 : %_25573
 ; {>  %_25572~°2◂{  }:_p21299 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_25573
 ; {>  %_25573~°0◂°2◂{  }:(_opn)◂(_p21299) }
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
	jc LB_28488
	mov rsi,0
	bt r9,0
	jc LB_28488
	jmp LB_28489
LB_28488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28489:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28490:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28492
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28491
LB_28492:
	add rsp,8
	ret
LB_28493:
	add rsp,0
	pop r14
LB_28491:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25279:
NS_E_RDI_25279:
NS_E_25279_ETR_TBL:
NS_E_25279_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_28513
LB_28512:
	add r14,1
LB_28513:
	cmp r14,r10
	jge LB_28514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28512
	cmp al,10
	jz LB_28512
	cmp al,32
	jz LB_28512
LB_28514:
	push r10
	call NS_E_25280_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28515
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28507
LB_28515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_28518
LB_28517:
	add r14,1
LB_28518:
	cmp r14,r10
	jge LB_28519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28517
	cmp al,10
	jz LB_28517
	cmp al,32
	jz LB_28517
LB_28519:
	push r10
	call NS_E_25279_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28520
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28521
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28521:
	jmp LB_28507
LB_28520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28510
	btr r12,1
	clc
	jmp LB_28511
LB_28510:
	bts r12,1
	stc
LB_28511:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28508
	btr r12,0
	clc
	jmp LB_28509
LB_28508:
	bts r12,0
	stc
LB_28509:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_28504
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f21329 { %_25574 %_25575 } ⊢ %_25576 : %_25576
 ; {>  %_25574~0':_p21301 %_25575~1':_p21300 }
; _f21329 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_25576 ⊢ %_25577 : %_25577
 ; {>  %_25576~°0◂{ 0' 1' }:_p21300 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_25577
 ; {>  %_25577~°0◂°0◂{ 0' 1' }:(_opn)◂(_p21300) }
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
	jc LB_28498
	btr r12,2
	jmp LB_28499
LB_28498:
	bts r12,2
LB_28499:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_28496
	btr QWORD [rdi],0
	jmp LB_28497
LB_28496:
	bts QWORD [rdi],0
LB_28497:
	mov r8,r14
	bt r12,1
	jc LB_28502
	btr r12,2
	jmp LB_28503
LB_28502:
	bts r12,2
LB_28503:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_28500
	btr QWORD [rdi],1
	jmp LB_28501
LB_28500:
	bts QWORD [rdi],1
LB_28501:
	mov rsi,1
	bt r12,3
	jc LB_28494
	mov rsi,0
	bt r9,0
	jc LB_28494
	jmp LB_28495
LB_28494:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28495:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28504:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28506
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28505
LB_28506:
	add rsp,8
	ret
LB_28507:
	add rsp,32
	pop r14
LB_28505:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_28525
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f21330 {  } ⊢ %_25578 : %_25578
 ; {>  }
; _f21330 {  } ⊢ °1◂{  }
; _some %_25578 ⊢ %_25579 : %_25579
 ; {>  %_25578~°1◂{  }:_p21300 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25579
 ; {>  %_25579~°0◂°1◂{  }:(_opn)◂(_p21300) }
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
	jc LB_28523
	mov rsi,0
	bt r9,0
	jc LB_28523
	jmp LB_28524
LB_28523:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28524:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28525:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28527
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28526
LB_28527:
	add rsp,8
	ret
LB_28528:
	add rsp,0
	pop r14
LB_28526:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25280:
NS_E_RDI_25280:
NS_E_25280_ETR_TBL:
NS_E_25280_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_28544
LB_28543:
	add r14,1
LB_28544:
	cmp r14,r10
	jge LB_28545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28543
	cmp al,10
	jz LB_28543
	cmp al,32
	jz LB_28543
LB_28545:
	add r14,3
	cmp r14,r10
	jg LB_28548
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_28548
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_28548
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_28548
	jmp LB_28549
LB_28548:
	jmp LB_28536
LB_28549:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_28551
LB_28550:
	add r14,1
LB_28551:
	cmp r14,r10
	jge LB_28552
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28550
	cmp al,10
	jz LB_28550
	cmp al,32
	jz LB_28550
LB_28552:
	push r10
	call NS_E_25281_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28553
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28554
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28554:
	jmp LB_28536
LB_28553:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_28557
LB_28556:
	add r14,1
LB_28557:
	cmp r14,r10
	jge LB_28558
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28556
	cmp al,10
	jz LB_28556
	cmp al,32
	jz LB_28556
LB_28558:
	add r14,3
	cmp r14,r10
	jg LB_28563
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_28563
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_28563
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_28563
	jmp LB_28564
LB_28563:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28560
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28560:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28561
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28561:
	jmp LB_28536
LB_28564:
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
	jc LB_28541
	btr r12,2
	clc
	jmp LB_28542
LB_28541:
	bts r12,2
	stc
LB_28542:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28539
	btr r12,1
	clc
	jmp LB_28540
LB_28539:
	bts r12,1
	stc
LB_28540:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28537
	btr r12,0
	clc
	jmp LB_28538
LB_28537:
	bts r12,0
	stc
LB_28538:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_28533
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_28565
	btr r12,3
	jmp LB_28566
LB_28565:
	bts r12,3
LB_28566:
	mov r13,r14
	bt r12,1
	jc LB_28567
	btr r12,0
	jmp LB_28568
LB_28567:
	bts r12,0
LB_28568:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f21331 %_25580 ⊢ %_25581 : %_25581
 ; {>  %_25580~0':_p21302 }
; _f21331 0' ⊢ °0◂0'
; _some %_25581 ⊢ %_25582 : %_25582
 ; {>  %_25581~°0◂0':_p21301 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25582
 ; {>  %_25582~°0◂°0◂0':(_opn)◂(_p21301) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28531
	btr r12,3
	jmp LB_28532
LB_28531:
	bts r12,3
LB_28532:
	mov rsi,1
	bt r12,3
	jc LB_28529
	mov rsi,0
	bt r9,0
	jc LB_28529
	jmp LB_28530
LB_28529:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28530:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28533:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28535
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28534
LB_28535:
	add rsp,8
	ret
LB_28536:
	add rsp,48
	pop r14
LB_28534:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_28580
LB_28579:
	add r14,1
LB_28580:
	cmp r14,r10
	jge LB_28581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28579
	cmp al,10
	jz LB_28579
	cmp al,32
	jz LB_28579
LB_28581:
	push r10
	call NS_E_25281_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28582
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28576
LB_28582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28577
	btr r12,0
	clc
	jmp LB_28578
LB_28577:
	bts r12,0
	stc
LB_28578:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28573
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21332 %_25583 ⊢ %_25584 : %_25584
 ; {>  %_25583~0':_p21302 }
; _f21332 0' ⊢ °1◂0'
; _some %_25584 ⊢ %_25585 : %_25585
 ; {>  %_25584~°1◂0':_p21301 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25585
 ; {>  %_25585~°0◂°1◂0':(_opn)◂(_p21301) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28571
	btr r12,3
	jmp LB_28572
LB_28571:
	bts r12,3
LB_28572:
	mov rsi,1
	bt r12,3
	jc LB_28569
	mov rsi,0
	bt r9,0
	jc LB_28569
	jmp LB_28570
LB_28569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28570:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28573:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28575
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28574
LB_28575:
	add rsp,8
	ret
LB_28576:
	add rsp,16
	pop r14
LB_28574:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25281:
NS_E_RDI_25281:
NS_E_25281_ETR_TBL:
NS_E_25281_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_28595
LB_28594:
	add r14,1
LB_28595:
	cmp r14,r10
	jge LB_28596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28594
	cmp al,10
	jz LB_28594
	cmp al,32
	jz LB_28594
LB_28596:
	push r10
	call NS_E_20652_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28597
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28591
LB_28597:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28592
	btr r12,0
	clc
	jmp LB_28593
LB_28592:
	bts r12,0
	stc
LB_28593:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28588
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21334 %_25586 ⊢ %_25587 : %_25587
 ; {>  %_25586~0':_stg }
; _f21334 0' ⊢ °1◂0'
; _some %_25587 ⊢ %_25588 : %_25588
 ; {>  %_25587~°1◂0':_p21302 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_25588
 ; {>  %_25588~°0◂°1◂0':(_opn)◂(_p21302) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28586
	btr r12,3
	jmp LB_28587
LB_28586:
	bts r12,3
LB_28587:
	mov rsi,1
	bt r12,3
	jc LB_28584
	mov rsi,0
	bt r9,0
	jc LB_28584
	jmp LB_28585
LB_28584:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28585:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28588:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28590
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28589
LB_28590:
	add rsp,8
	ret
LB_28591:
	add rsp,16
	pop r14
LB_28589:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_28610
LB_28609:
	add r14,1
LB_28610:
	cmp r14,r10
	jge LB_28611
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28609
	cmp al,10
	jz LB_28609
	cmp al,32
	jz LB_28609
LB_28611:
	push r10
	call NS_E_24177_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28612
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28606
LB_28612:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28607
	btr r12,0
	clc
	jmp LB_28608
LB_28607:
	bts r12,0
	stc
LB_28608:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28603
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f21333 %_25589 ⊢ %_25590 : %_25590
 ; {>  %_25589~0':_p21201 }
; _f21333 0' ⊢ °0◂0'
; _some %_25590 ⊢ %_25591 : %_25591
 ; {>  %_25590~°0◂0':_p21302 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25591
 ; {>  %_25591~°0◂°0◂0':(_opn)◂(_p21302) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28601
	btr r12,3
	jmp LB_28602
LB_28601:
	bts r12,3
LB_28602:
	mov rsi,1
	bt r12,3
	jc LB_28599
	mov rsi,0
	bt r9,0
	jc LB_28599
	jmp LB_28600
LB_28599:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28600:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28603:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28605
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28604
LB_28605:
	add rsp,8
	ret
LB_28606:
	add rsp,16
	pop r14
LB_28604:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25282:
NS_E_RDI_25282:
NS_E_25282_ETR_TBL:
NS_E_25282_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_28623
LB_28622:
	add r14,1
LB_28623:
	cmp r14,r10
	jge LB_28624
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28622
	cmp al,10
	jz LB_28622
	cmp al,32
	jz LB_28622
LB_28624:
	add r14,4
	cmp r14,r10
	jg LB_28627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_28627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_28627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_28627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_28627
	jmp LB_28628
LB_28627:
	jmp LB_28619
LB_28628:
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
	jc LB_28620
	btr r12,0
	clc
	jmp LB_28621
LB_28620:
	bts r12,0
	stc
LB_28621:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28616
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f21324 {  } ⊢ %_25592 : %_25592
 ; {>  }
; _f21324 {  } ⊢ °1◂{  }
; _some %_25592 ⊢ %_25593 : %_25593
 ; {>  %_25592~°1◂{  }:_p21298 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25593
 ; {>  %_25593~°0◂°1◂{  }:(_opn)◂(_p21298) }
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
	jc LB_28614
	mov rsi,0
	bt r9,0
	jc LB_28614
	jmp LB_28615
LB_28614:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28615:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28616:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28618
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28617
LB_28618:
	add rsp,8
	ret
LB_28619:
	add rsp,16
	pop r14
LB_28617:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_28638
LB_28637:
	add r14,1
LB_28638:
	cmp r14,r10
	jge LB_28639
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28637
	cmp al,10
	jz LB_28637
	cmp al,32
	jz LB_28637
LB_28639:
	add r14,4
	cmp r14,r10
	jg LB_28642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_28642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_28642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_28642
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_28642
	jmp LB_28643
LB_28642:
	jmp LB_28634
LB_28643:
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
	jc LB_28635
	btr r12,0
	clc
	jmp LB_28636
LB_28635:
	bts r12,0
	stc
LB_28636:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28631
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f21325 {  } ⊢ %_25594 : %_25594
 ; {>  }
; _f21325 {  } ⊢ °2◂{  }
; _some %_25594 ⊢ %_25595 : %_25595
 ; {>  %_25594~°2◂{  }:_p21298 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_25595
 ; {>  %_25595~°0◂°2◂{  }:(_opn)◂(_p21298) }
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
	jc LB_28629
	mov rsi,0
	bt r9,0
	jc LB_28629
	jmp LB_28630
LB_28629:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28630:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28631:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28633
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28632
LB_28633:
	add rsp,8
	ret
LB_28634:
	add rsp,16
	pop r14
LB_28632:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_28653
LB_28652:
	add r14,1
LB_28653:
	cmp r14,r10
	jge LB_28654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28652
	cmp al,10
	jz LB_28652
	cmp al,32
	jz LB_28652
LB_28654:
	add r14,3
	cmp r14,r10
	jg LB_28657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_28657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_28657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_28657
	jmp LB_28658
LB_28657:
	jmp LB_28649
LB_28658:
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
	jc LB_28650
	btr r12,0
	clc
	jmp LB_28651
LB_28650:
	bts r12,0
	stc
LB_28651:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28646
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f21323 {  } ⊢ %_25596 : %_25596
 ; {>  }
; _f21323 {  } ⊢ °0◂{  }
; _some %_25596 ⊢ %_25597 : %_25597
 ; {>  %_25596~°0◂{  }:_p21298 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_25597
 ; {>  %_25597~°0◂°0◂{  }:(_opn)◂(_p21298) }
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
	jc LB_28644
	mov rsi,0
	bt r9,0
	jc LB_28644
	jmp LB_28645
LB_28644:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28645:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28646:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28648
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28647
LB_28648:
	add rsp,8
	ret
LB_28649:
	add rsp,16
	pop r14
LB_28647:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25283:
NS_E_RDI_25283:
NS_E_25283_ETR_TBL:
NS_E_25283_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_28668
LB_28667:
	add r14,1
LB_28668:
	cmp r14,r10
	jge LB_28669
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28667
	cmp al,10
	jz LB_28667
	cmp al,32
	jz LB_28667
LB_28669:
	add r14,5
	cmp r14,r10
	jg LB_28672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_28672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_28672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_28672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_28672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_28672
	jmp LB_28673
LB_28672:
	jmp LB_28664
LB_28673:
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
	jc LB_28665
	btr r12,0
	clc
	jmp LB_28666
LB_28665:
	bts r12,0
	stc
LB_28666:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28661
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f21324 {  } ⊢ %_25598 : %_25598
 ; {>  }
; _f21324 {  } ⊢ °1◂{  }
; _some %_25598 ⊢ %_25599 : %_25599
 ; {>  %_25598~°1◂{  }:_p21298 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25599
 ; {>  %_25599~°0◂°1◂{  }:(_opn)◂(_p21298) }
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
	jc LB_28659
	mov rsi,0
	bt r9,0
	jc LB_28659
	jmp LB_28660
LB_28659:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28660:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28661:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28663
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28662
LB_28663:
	add rsp,8
	ret
LB_28664:
	add rsp,16
	pop r14
LB_28662:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_28683
LB_28682:
	add r14,1
LB_28683:
	cmp r14,r10
	jge LB_28684
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28682
	cmp al,10
	jz LB_28682
	cmp al,32
	jz LB_28682
LB_28684:
	add r14,5
	cmp r14,r10
	jg LB_28687
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_28687
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_28687
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_28687
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_28687
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_28687
	jmp LB_28688
LB_28687:
	jmp LB_28679
LB_28688:
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
	jc LB_28680
	btr r12,0
	clc
	jmp LB_28681
LB_28680:
	bts r12,0
	stc
LB_28681:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28676
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f21325 {  } ⊢ %_25600 : %_25600
 ; {>  }
; _f21325 {  } ⊢ °2◂{  }
; _some %_25600 ⊢ %_25601 : %_25601
 ; {>  %_25600~°2◂{  }:_p21298 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_25601
 ; {>  %_25601~°0◂°2◂{  }:(_opn)◂(_p21298) }
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
	jc LB_28674
	mov rsi,0
	bt r9,0
	jc LB_28674
	jmp LB_28675
LB_28674:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28675:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28676:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28678
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28677
LB_28678:
	add rsp,8
	ret
LB_28679:
	add rsp,16
	pop r14
LB_28677:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_28698
LB_28697:
	add r14,1
LB_28698:
	cmp r14,r10
	jge LB_28699
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28697
	cmp al,10
	jz LB_28697
	cmp al,32
	jz LB_28697
LB_28699:
	add r14,4
	cmp r14,r10
	jg LB_28702
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_28702
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_28702
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_28702
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_28702
	jmp LB_28703
LB_28702:
	jmp LB_28694
LB_28703:
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
	jc LB_28695
	btr r12,0
	clc
	jmp LB_28696
LB_28695:
	bts r12,0
	stc
LB_28696:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_28691
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f21323 {  } ⊢ %_25602 : %_25602
 ; {>  }
; _f21323 {  } ⊢ °0◂{  }
; _some %_25602 ⊢ %_25603 : %_25603
 ; {>  %_25602~°0◂{  }:_p21298 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_25603
 ; {>  %_25603~°0◂°0◂{  }:(_opn)◂(_p21298) }
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
	jc LB_28689
	mov rsi,0
	bt r9,0
	jc LB_28689
	jmp LB_28690
LB_28689:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28690:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28691:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28693
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28692
LB_28693:
	add rsp,8
	ret
LB_28694:
	add rsp,16
	pop r14
LB_28692:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25284:
NS_E_RDI_25284:
NS_E_25284_ETR_TBL:
NS_E_25284_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_28759
LB_28758:
	add r14,1
LB_28759:
	cmp r14,r10
	jge LB_28760
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28758
	cmp al,10
	jz LB_28758
	cmp al,32
	jz LB_28758
LB_28760:
	push r10
	call NS_E_25283_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28761
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28727
LB_28761:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_28738
LB_28737:
	add r14,1
LB_28738:
	cmp r14,r10
	jge LB_28739
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28737
	cmp al,10
	jz LB_28737
	cmp al,32
	jz LB_28737
LB_28739:
	push r10
	call NS_E_25286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28740
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28741
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28741:
	jmp LB_28728
LB_28740:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_28744
LB_28743:
	add r14,1
LB_28744:
	cmp r14,r10
	jge LB_28745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28743
	cmp al,10
	jz LB_28743
	cmp al,32
	jz LB_28743
LB_28745:
	push r10
	call NS_E_25278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28746
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28747
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28747:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28748
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28748:
	jmp LB_28728
LB_28746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_28751
LB_28750:
	add r14,1
LB_28751:
	cmp r14,r10
	jge LB_28752
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28750
	cmp al,10
	jz LB_28750
	cmp al,32
	jz LB_28750
LB_28752:
	push r10
	call NS_E_25285_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28753
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_28754
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_28754:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28755
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28755:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28756
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28756:
	jmp LB_28728
LB_28753:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_28735
	btr r12,3
	clc
	jmp LB_28736
LB_28735:
	bts r12,3
	stc
LB_28736:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_28733
	btr r12,2
	clc
	jmp LB_28734
LB_28733:
	bts r12,2
	stc
LB_28734:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28731
	btr r12,1
	clc
	jmp LB_28732
LB_28731:
	bts r12,1
	stc
LB_28732:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28729
	btr r12,0
	clc
	jmp LB_28730
LB_28729:
	bts r12,0
	stc
LB_28730:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_28724
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f21320 { %_25605 %_25604 %_25606 %_25607 } ⊢ %_25608 : %_25608
 ; {>  %_25607~3':(_opn)◂(_p21296) %_25606~2':_p21299 %_25605~1':(_opn)◂(_stg) %_25604~0':_p21298 }
; _f21320 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_25608 ⊢ %_25609 : %_25609
 ; {>  %_25608~°1◂{ 1' 0' 2' 3' }:_p21296 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_25609
 ; {>  %_25609~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p21296) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_28704
	btr r12,4
	jmp LB_28705
LB_28704:
	bts r12,4
LB_28705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_28710
	btr r12,5
	jmp LB_28711
LB_28710:
	bts r12,5
LB_28711:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_28708
	btr QWORD [rdi],0
	jmp LB_28709
LB_28708:
	bts QWORD [rdi],0
LB_28709:
	mov r11,r13
	bt r12,0
	jc LB_28714
	btr r12,5
	jmp LB_28715
LB_28714:
	bts r12,5
LB_28715:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_28712
	btr QWORD [rdi],1
	jmp LB_28713
LB_28712:
	bts QWORD [rdi],1
LB_28713:
	mov r11,r8
	bt r12,2
	jc LB_28718
	btr r12,5
	jmp LB_28719
LB_28718:
	bts r12,5
LB_28719:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_28716
	btr QWORD [rdi],2
	jmp LB_28717
LB_28716:
	bts QWORD [rdi],2
LB_28717:
	mov r11,r10
	bt r12,4
	jc LB_28722
	btr r12,5
	jmp LB_28723
LB_28722:
	bts r12,5
LB_28723:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,5
	jc LB_28720
	btr QWORD [rdi],3
	jmp LB_28721
LB_28720:
	bts QWORD [rdi],3
LB_28721:
	mov rsi,1
	bt r12,3
	jc LB_28706
	mov rsi,0
	bt r9,0
	jc LB_28706
	jmp LB_28707
LB_28706:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28707:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28724:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28726
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28725
LB_28726:
	add rsp,8
	ret
LB_28728:
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
LB_28727:
	add rsp,64
	pop r14
LB_28725:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_28802
LB_28801:
	add r14,1
LB_28802:
	cmp r14,r10
	jge LB_28803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28801
	cmp al,10
	jz LB_28801
	cmp al,32
	jz LB_28801
LB_28803:
	push r10
	call NS_E_25282_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28804
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28790
LB_28804:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_28807
LB_28806:
	add r14,1
LB_28807:
	cmp r14,r10
	jge LB_28808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28806
	cmp al,10
	jz LB_28806
	cmp al,32
	jz LB_28806
LB_28808:
	push r10
	call NS_E_25286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28809
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28810
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28810:
	jmp LB_28790
LB_28809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_28813
LB_28812:
	add r14,1
LB_28813:
	cmp r14,r10
	jge LB_28814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28812
	cmp al,10
	jz LB_28812
	cmp al,32
	jz LB_28812
LB_28814:
	push r10
	call NS_E_25278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28815
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28816
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28816:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28817:
	jmp LB_28790
LB_28815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_28820
LB_28819:
	add r14,1
LB_28820:
	cmp r14,r10
	jge LB_28821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28819
	cmp al,10
	jz LB_28819
	cmp al,32
	jz LB_28819
LB_28821:
	push r10
	call NS_E_25285_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28822
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_28823
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_28823:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28824
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28824:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28825
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28825:
	jmp LB_28790
LB_28822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_28828
LB_28827:
	add r14,1
LB_28828:
	cmp r14,r10
	jge LB_28829
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28827
	cmp al,10
	jz LB_28827
	cmp al,32
	jz LB_28827
LB_28829:
	push r10
	call NS_E_25284_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28830
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_28831
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_28831:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_28832
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_28832:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_28833
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_28833:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28834
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28834:
	jmp LB_28790
LB_28830:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_28799
	btr r12,4
	clc
	jmp LB_28800
LB_28799:
	bts r12,4
	stc
LB_28800:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_28797
	btr r12,3
	clc
	jmp LB_28798
LB_28797:
	bts r12,3
	stc
LB_28798:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_28795
	btr r12,2
	clc
	jmp LB_28796
LB_28795:
	bts r12,2
	stc
LB_28796:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28793
	btr r12,1
	clc
	jmp LB_28794
LB_28793:
	bts r12,1
	stc
LB_28794:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28791
	btr r12,0
	clc
	jmp LB_28792
LB_28791:
	bts r12,0
	stc
LB_28792:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_28787
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f21319 { %_25611 %_25610 %_25612 %_25613 %_25614 } ⊢ %_25615 : %_25615
 ; {>  %_25611~1':(_opn)◂(_stg) %_25610~0':_p21298 %_25614~4':_p21296 %_25612~2':_p21299 %_25613~3':(_opn)◂(_p21296) }
; _f21319 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_25615 ⊢ %_25616 : %_25616
 ; {>  %_25615~°0◂{ 1' 0' 2' 3' 4' }:_p21296 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_25616
 ; {>  %_25616~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p21296) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_28763
	btr r12,5
	jmp LB_28764
LB_28763:
	bts r12,5
LB_28764:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_28769
	btr r12,6
	jmp LB_28770
LB_28769:
	bts r12,6
LB_28770:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_28767
	btr QWORD [rdi],0
	jmp LB_28768
LB_28767:
	bts QWORD [rdi],0
LB_28768:
	mov rcx,r13
	bt r12,0
	jc LB_28773
	btr r12,6
	jmp LB_28774
LB_28773:
	bts r12,6
LB_28774:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_28771
	btr QWORD [rdi],1
	jmp LB_28772
LB_28771:
	bts QWORD [rdi],1
LB_28772:
	mov rcx,r8
	bt r12,2
	jc LB_28777
	btr r12,6
	jmp LB_28778
LB_28777:
	bts r12,6
LB_28778:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_28775
	btr QWORD [rdi],2
	jmp LB_28776
LB_28775:
	bts QWORD [rdi],2
LB_28776:
	mov rcx,r11
	bt r12,5
	jc LB_28781
	btr r12,6
	jmp LB_28782
LB_28781:
	bts r12,6
LB_28782:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_28779
	btr QWORD [rdi],3
	jmp LB_28780
LB_28779:
	bts QWORD [rdi],3
LB_28780:
	mov rcx,r10
	bt r12,4
	jc LB_28785
	btr r12,6
	jmp LB_28786
LB_28785:
	bts r12,6
LB_28786:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_28783
	btr QWORD [rdi],4
	jmp LB_28784
LB_28783:
	bts QWORD [rdi],4
LB_28784:
	mov rsi,1
	bt r12,3
	jc LB_28765
	mov rsi,0
	bt r9,0
	jc LB_28765
	jmp LB_28766
LB_28765:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28766:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28787:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28789
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28788
LB_28789:
	add rsp,8
	ret
LB_28790:
	add rsp,80
	pop r14
LB_28788:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25285:
NS_E_RDI_25285:
NS_E_25285_ETR_TBL:
NS_E_25285_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_28849
LB_28848:
	add r14,1
LB_28849:
	cmp r14,r10
	jge LB_28850
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28848
	cmp al,10
	jz LB_28848
	cmp al,32
	jz LB_28848
LB_28850:
	add r14,1
	cmp r14,r10
	jg LB_28853
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_28853
	jmp LB_28854
LB_28853:
	jmp LB_28843
LB_28854:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_28856
LB_28855:
	add r14,1
LB_28856:
	cmp r14,r10
	jge LB_28857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28855
	cmp al,10
	jz LB_28855
	cmp al,32
	jz LB_28855
LB_28857:
	push r10
	call NS_E_25284_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28858
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28859
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28859:
	jmp LB_28843
LB_28858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_28846
	btr r12,1
	clc
	jmp LB_28847
LB_28846:
	bts r12,1
	stc
LB_28847:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28844
	btr r12,0
	clc
	jmp LB_28845
LB_28844:
	bts r12,0
	stc
LB_28845:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_28840
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_28861
	btr r12,2
	jmp LB_28862
LB_28861:
	bts r12,2
LB_28862:
	mov r13,r14
	bt r12,1
	jc LB_28863
	btr r12,0
	jmp LB_28864
LB_28863:
	bts r12,0
LB_28864:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25617 ⊢ %_25618 : %_25618
 ; {>  %_25617~0':_p21296 }
; _some 0' ⊢ °0◂0'
; _some %_25618 ⊢ %_25619 : %_25619
 ; {>  %_25618~°0◂0':(_opn)◂(_p21296) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25619
 ; {>  %_25619~°0◂°0◂0':(_opn)◂((_opn)◂(_p21296)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28838
	btr r12,3
	jmp LB_28839
LB_28838:
	bts r12,3
LB_28839:
	mov rsi,1
	bt r12,3
	jc LB_28836
	mov rsi,0
	bt r9,0
	jc LB_28836
	jmp LB_28837
LB_28836:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28837:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28840:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28842
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28841
LB_28842:
	add rsp,8
	ret
LB_28843:
	add rsp,32
	pop r14
LB_28841:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_28867
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_25620 : %_25620
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_25620 ⊢ %_25621 : %_25621
 ; {>  %_25620~°1◂{  }:(_opn)◂(t12866'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25621
 ; {>  %_25621~°0◂°1◂{  }:(_opn)◂((_opn)◂(t12869'(0))) }
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
	jc LB_28865
	mov rsi,0
	bt r9,0
	jc LB_28865
	jmp LB_28866
LB_28865:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28866:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28867:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28869
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28868
LB_28869:
	add rsp,8
	ret
LB_28870:
	add rsp,0
	pop r14
LB_28868:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_25286:
NS_E_RDI_25286:
NS_E_25286_ETR_TBL:
NS_E_25286_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_28884
LB_28883:
	add r14,1
LB_28884:
	cmp r14,r10
	jge LB_28885
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28883
	cmp al,10
	jz LB_28883
	cmp al,32
	jz LB_28883
LB_28885:
	push r10
	call NS_E_21026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_28886
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28878
LB_28886:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_28889
LB_28888:
	add r14,1
LB_28889:
	cmp r14,r10
	jge LB_28890
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_28888
	cmp al,10
	jz LB_28888
	cmp al,32
	jz LB_28888
LB_28890:
	add r14,1
	cmp r14,r10
	jg LB_28894
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_28894
	jmp LB_28895
LB_28894:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_28892
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_28892:
	jmp LB_28878
LB_28895:
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
	jc LB_28881
	btr r12,1
	clc
	jmp LB_28882
LB_28881:
	bts r12,1
	stc
LB_28882:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_28879
	btr r12,0
	clc
	jmp LB_28880
LB_28879:
	bts r12,0
	stc
LB_28880:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_28875
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_25622 ⊢ %_25623 : %_25623
 ; {>  %_25622~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_25623 ⊢ %_25624 : %_25624
 ; {>  %_25623~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_25624
 ; {>  %_25624~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_28873
	btr r12,3
	jmp LB_28874
LB_28873:
	bts r12,3
LB_28874:
	mov rsi,1
	bt r12,3
	jc LB_28871
	mov rsi,0
	bt r9,0
	jc LB_28871
	jmp LB_28872
LB_28871:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28872:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28875:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28877
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28876
LB_28877:
	add rsp,8
	ret
LB_28878:
	add rsp,32
	pop r14
LB_28876:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_28898
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_25625 : %_25625
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_25625 ⊢ %_25626 : %_25626
 ; {>  %_25625~°1◂{  }:(_opn)◂(t12878'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_25626
 ; {>  %_25626~°0◂°1◂{  }:(_opn)◂((_opn)◂(t12881'(0))) }
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
	jc LB_28896
	mov rsi,0
	bt r9,0
	jc LB_28896
	jmp LB_28897
LB_28896:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_28897:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_28898:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_28900
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_28899
LB_28900:
	add rsp,8
	ret
LB_28901:
	add rsp,0
	pop r14
LB_28899:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_28949:
; 	|» { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
NS_E_RDI_28949:
; ∎ { %_28940 %_28941 %_28942 %_28943 %_28944 %_28945 %_28946 %_28947 }
 ; {>  %_28943~3':_r64 %_28941~1':_r64 %_28946~6':(_p0)◂(t13535'(-1)) %_28948~8':t13501'(-1) %_28944~4':(_p0)◂(t13534'(-1)) %_28940~0':(_p0)◂(t13532'(-1)) %_28942~2':(_p0)◂(t13533'(-1)) %_28945~5':_r64 %_28947~7':_r64 }
; 	∎ { 0' 1' 2' 3' 4' 5' 6' 7' }
	bt r12,8
	jc LB_28950
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_28950:
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	ret
NS_E_28939:
; 	|» 0'
NS_E_RDI_28939:
; » 0xrc8 |~ {  } ⊢ %_28918 : %_28918
 ; {>  %_28917~0':t13501'(-1) }
; 	» 0xrc8 _ ⊢ 1' : %_28918
	mov rdi,0xc8
	mov r14,rdi
	bts r12,1
; _f20 %_28918 ⊢ { %_28919 %_28920 } : { %_28919 %_28920 }
 ; {>  %_28918~1':_r64 %_28917~0':t13501'(-1) }
; _f20 1' ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_28953
	btr r12,0
	jmp LB_28954
LB_28953:
	bts r12,0
LB_28954:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_28955
	btr r12,2
	jmp LB_28956
LB_28955:
	bts r12,2
LB_28956:
	mov r14,r13
	bt r12,0
	jc LB_28957
	btr r12,1
	jmp LB_28958
LB_28957:
	bts r12,1
LB_28958:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_28951
	btr r12,0
	clc
	jmp LB_28952
LB_28951:
	bts r12,0
	stc
LB_28952:
	add rsp,16
; _f20 %_28919 ⊢ { %_28921 %_28922 } : { %_28921 %_28922 }
 ; {>  %_28920~2':(_p0)◂(t13516'(0)) %_28919~1':_r64 %_28917~0':t13501'(-1) }
; _f20 1' ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_28963
	btr r12,0
	jmp LB_28964
LB_28963:
	bts r12,0
LB_28964:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_28965
	btr r12,3
	jmp LB_28966
LB_28965:
	bts r12,3
LB_28966:
	mov r14,r13
	bt r12,0
	jc LB_28967
	btr r12,1
	jmp LB_28968
LB_28967:
	bts r12,1
LB_28968:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_28961
	btr r12,2
	clc
	jmp LB_28962
LB_28961:
	bts r12,2
	stc
LB_28962:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_28959
	btr r12,0
	clc
	jmp LB_28960
LB_28959:
	bts r12,0
	stc
LB_28960:
	add rsp,24
; _f20 %_28921 ⊢ { %_28923 %_28924 } : { %_28923 %_28924 }
 ; {>  %_28920~2':(_p0)◂(t13516'(0)) %_28922~3':(_p0)◂(t13519'(0)) %_28921~1':_r64 %_28917~0':t13501'(-1) }
; _f20 1' ⊢ { 1' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_28975
	btr r12,0
	jmp LB_28976
LB_28975:
	bts r12,0
LB_28976:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 4' }
	mov r10,r14
	bt r12,1
	jc LB_28977
	btr r12,4
	jmp LB_28978
LB_28977:
	bts r12,4
LB_28978:
	mov r14,r13
	bt r12,0
	jc LB_28979
	btr r12,1
	jmp LB_28980
LB_28979:
	bts r12,1
LB_28980:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_28973
	btr r12,3
	clc
	jmp LB_28974
LB_28973:
	bts r12,3
	stc
LB_28974:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_28971
	btr r12,2
	clc
	jmp LB_28972
LB_28971:
	bts r12,2
	stc
LB_28972:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_28969
	btr r12,0
	clc
	jmp LB_28970
LB_28969:
	bts r12,0
	stc
LB_28970:
	add rsp,32
; _f20 %_28923 ⊢ { %_28925 %_28926 } : { %_28925 %_28926 }
 ; {>  %_28924~4':(_p0)◂(t13522'(0)) %_28920~2':(_p0)◂(t13516'(0)) %_28922~3':(_p0)◂(t13519'(0)) %_28923~1':_r64 %_28917~0':t13501'(-1) }
; _f20 1' ⊢ { 1' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_28989
	btr r12,0
	jmp LB_28990
LB_28989:
	bts r12,0
LB_28990:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_28991
	btr r12,5
	jmp LB_28992
LB_28991:
	bts r12,5
LB_28992:
	mov r14,r13
	bt r12,0
	jc LB_28993
	btr r12,1
	jmp LB_28994
LB_28993:
	bts r12,1
LB_28994:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_28987
	btr r12,4
	clc
	jmp LB_28988
LB_28987:
	bts r12,4
	stc
LB_28988:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_28985
	btr r12,3
	clc
	jmp LB_28986
LB_28985:
	bts r12,3
	stc
LB_28986:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_28983
	btr r12,2
	clc
	jmp LB_28984
LB_28983:
	bts r12,2
	stc
LB_28984:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_28981
	btr r12,0
	clc
	jmp LB_28982
LB_28981:
	bts r12,0
	stc
LB_28982:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_28927 : %_28927
 ; {>  %_28925~1':_r64 %_28924~4':(_p0)◂(t13522'(0)) %_28920~2':(_p0)◂(t13516'(0)) %_28922~3':(_p0)◂(t13519'(0)) %_28917~0':t13501'(-1) %_28926~5':(_p0)◂(t13525'(0)) }
; 	» 0xr0 _ ⊢ 6' : %_28927
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; » 0xr0 |~ {  } ⊢ %_28928 : %_28928
 ; {>  %_28925~1':_r64 %_28924~4':(_p0)◂(t13522'(0)) %_28920~2':(_p0)◂(t13516'(0)) %_28922~3':(_p0)◂(t13519'(0)) %_28927~6':_r64 %_28917~0':t13501'(-1) %_28926~5':(_p0)◂(t13525'(0)) }
; 	» 0xr0 _ ⊢ 7' : %_28928
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; » 0xr0 |~ {  } ⊢ %_28929 : %_28929
 ; {>  %_28925~1':_r64 %_28928~7':_r64 %_28924~4':(_p0)◂(t13522'(0)) %_28920~2':(_p0)◂(t13516'(0)) %_28922~3':(_p0)◂(t13519'(0)) %_28927~6':_r64 %_28917~0':t13501'(-1) %_28926~5':(_p0)◂(t13525'(0)) }
; 	» 0xr0 _ ⊢ 8' : %_28929
	mov rdi,0x0
	mov QWORD [st_vct+8*8],rdi
	bts r12,8
; » 0xr0 |~ {  } ⊢ %_28930 : %_28930
 ; {>  %_28925~1':_r64 %_28928~7':_r64 %_28924~4':(_p0)◂(t13522'(0)) %_28920~2':(_p0)◂(t13516'(0)) %_28929~8':_r64 %_28922~3':(_p0)◂(t13519'(0)) %_28927~6':_r64 %_28917~0':t13501'(-1) %_28926~5':(_p0)◂(t13525'(0)) }
; 	» 0xr0 _ ⊢ 9' : %_28930
	mov QWORD [st_vct+8*9],0x0
	bts r12,9
; _f28949 { %_28920 %_28927 %_28922 %_28928 %_28924 %_28929 %_28926 %_28930 %_28917 } ⊢ { %_28931 %_28932 %_28933 %_28934 %_28935 %_28936 %_28937 %_28938 } : { %_28931 %_28932 %_28933 %_28934 %_28935 %_28936 %_28937 %_28938 }
 ; {>  %_28925~1':_r64 %_28930~9':_r64 %_28928~7':_r64 %_28924~4':(_p0)◂(t13522'(0)) %_28920~2':(_p0)◂(t13516'(0)) %_28929~8':_r64 %_28922~3':(_p0)◂(t13519'(0)) %_28927~6':_r64 %_28917~0':t13501'(-1) %_28926~5':(_p0)◂(t13525'(0)) }
; _f28949 { 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10111111110.. |},{ 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
	mov r14,rcx
	bt r12,6
	jc LB_28997
	btr r12,1
	jmp LB_28998
LB_28997:
	bts r12,1
LB_28998:
	mov rcx,r11
	bt r12,5
	jc LB_28999
	btr r12,6
	jmp LB_29000
LB_28999:
	bts r12,6
LB_29000:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_29001
	btr r12,5
	jmp LB_29002
LB_29001:
	bts r12,5
LB_29002:
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_29003
	btr r12,8
	jmp LB_29004
LB_29003:
	bts r12,8
LB_29004:
	mov r13,r8
	bt r12,2
	jc LB_29005
	btr r12,0
	jmp LB_29006
LB_29005:
	bts r12,0
LB_29006:
	mov r8,r9
	bt r12,3
	jc LB_29007
	btr r12,2
	jmp LB_29008
LB_29007:
	bts r12,2
LB_29008:
	mov r9,rdx
	bt r12,7
	jc LB_29009
	btr r12,3
	jmp LB_29010
LB_29009:
	bts r12,3
LB_29010:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_29011
	btr r12,7
	jmp LB_29012
LB_29011:
	bts r12,7
LB_29012:
	call NS_E_28949
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
	mov rdi,rdx
	mov QWORD [st_vct+8*8],rdi
	bt r12,7
	jc LB_29013
	btr r12,8
	jmp LB_29014
LB_29013:
	bts r12,8
LB_29014:
	mov rdx,rcx
	bt r12,6
	jc LB_29015
	btr r12,7
	jmp LB_29016
LB_29015:
	bts r12,7
LB_29016:
	mov rcx,r11
	bt r12,5
	jc LB_29017
	btr r12,6
	jmp LB_29018
LB_29017:
	bts r12,6
LB_29018:
	mov r11,r10
	bt r12,4
	jc LB_29019
	btr r12,5
	jmp LB_29020
LB_29019:
	bts r12,5
LB_29020:
	mov r10,r9
	bt r12,3
	jc LB_29021
	btr r12,4
	jmp LB_29022
LB_29021:
	bts r12,4
LB_29022:
	mov r9,r8
	bt r12,2
	jc LB_29023
	btr r12,3
	jmp LB_29024
LB_29023:
	bts r12,3
LB_29024:
	mov r8,r14
	bt r12,1
	jc LB_29025
	btr r12,2
	jmp LB_29026
LB_29025:
	bts r12,2
LB_29026:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_28995
	btr r12,1
	clc
	jmp LB_28996
LB_28995:
	bts r12,1
	stc
LB_28996:
	add rsp,16
; ∎ { %_28931 %_28932 %_28933 %_28934 %_28935 %_28936 %_28937 %_28938 }
 ; {>  %_28932~2':_r64 %_28935~5':(_p0)◂(t13534'(-1)) %_28925~1':_r64 %_28936~6':_r64 %_28933~3':(_p0)◂(t13533'(-1)) %_28938~8':_r64 %_28931~0':(_p0)◂(t13532'(-1)) %_28937~7':(_p0)◂(t13535'(-1)) %_28934~4':_r64 }
; 	∎ { 0' 2' 3' 4' 5' 6' 7' 8' }
	bt r12,1
	jc LB_29027
	mov rdi,r14
	call dlt
LB_29027:
; _emt_mov_ptn_to_ptn:{| 1011111110.. |},{ 0' 2' 3' 4' 5' 6' 7' 8' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	mov r14,r8
	bt r12,2
	jc LB_29028
	btr r12,1
	jmp LB_29029
LB_29028:
	bts r12,1
LB_29029:
	mov r8,r9
	bt r12,3
	jc LB_29030
	btr r12,2
	jmp LB_29031
LB_29030:
	bts r12,2
LB_29031:
	mov r9,r10
	bt r12,4
	jc LB_29032
	btr r12,3
	jmp LB_29033
LB_29032:
	bts r12,3
LB_29033:
	mov r10,r11
	bt r12,5
	jc LB_29034
	btr r12,4
	jmp LB_29035
LB_29034:
	bts r12,4
LB_29035:
	mov r11,rcx
	bt r12,6
	jc LB_29036
	btr r12,5
	jmp LB_29037
LB_29036:
	bts r12,5
LB_29037:
	mov rcx,rdx
	bt r12,7
	jc LB_29038
	btr r12,6
	jmp LB_29039
LB_29038:
	bts r12,6
LB_29039:
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_29040
	btr r12,7
	jmp LB_29041
LB_29040:
	bts r12,7
LB_29041:
	ret
NS_E_29087:
NS_E_RDI_29087:
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
; » 0xr0 |~ {  } ⊢ %_29043 : %_29043
 ; {>  %_29042~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_29043
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_29044 : %_29044
 ; {>  %_29042~0':_stg %_29043~1':_r64 }
; 	» _args _ ⊢ 2' : %_29044
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
MTC_LB_29088:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29089
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
	jnc LB_29090
	bt QWORD [rdi],0
	jc LB_29091
	btr r12,5
	clc
	jmp LB_29092
LB_29091:
	bts r12,5
	stc
LB_29092:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29090:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_29095
	btr r12,6
	clc
	jmp LB_29096
LB_29095:
	bts r12,6
	stc
LB_29096:
	mov r9,rcx
	bt r12,6
	jc LB_29093
	btr r12,3
	jmp LB_29094
LB_29093:
	bts r12,3
LB_29094:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_29099
	btr r12,6
	clc
	jmp LB_29100
LB_29099:
	bts r12,6
	stc
LB_29100:
	mov r10,rcx
	bt r12,6
	jc LB_29097
	btr r12,4
	jmp LB_29098
LB_29097:
	bts r12,4
LB_29098:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29089
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
	jnc LB_29101
	bt QWORD [rdi],0
	jc LB_29102
	btr r12,7
	clc
	jmp LB_29103
LB_29102:
	bts r12,7
	stc
LB_29103:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29101:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_29106
	btr r12,8
	clc
	jmp LB_29107
LB_29106:
	bts r12,8
	stc
LB_29107:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_29104
	btr r12,5
	jmp LB_29105
LB_29104:
	bts r12,5
LB_29105:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_29110
	btr r12,8
	clc
	jmp LB_29111
LB_29110:
	bts r12,8
	stc
LB_29111:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_29108
	btr r12,6
	jmp LB_29109
LB_29108:
	bts r12,6
LB_29109:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_29089
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
	jnc LB_29112
	bt QWORD [rdi],0
	jc LB_29113
	btr r12,7
	clc
	jmp LB_29114
LB_29113:
	bts r12,7
	stc
LB_29114:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29112:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_29115:
	cmp r15,0
	jz LB_29116
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29115
LB_29116:
; _f37 %_29047 ⊢ { %_29049 %_29050 } : { %_29049 %_29050 }
 ; {>  %_29042~0':_stg %_29047~5':_stg %_29045~3':_stg %_29043~1':_r64 }
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
	jc LB_29123
	btr r12,0
	jmp LB_29124
LB_29123:
	bts r12,0
LB_29124:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_29125
	btr r12,2
	jmp LB_29126
LB_29125:
	bts r12,2
LB_29126:
	mov r10,r14
	bt r12,1
	jc LB_29127
	btr r12,4
	jmp LB_29128
LB_29127:
	bts r12,4
LB_29128:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_29121
	btr r12,3
	clc
	jmp LB_29122
LB_29121:
	bts r12,3
	stc
LB_29122:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29119
	btr r12,1
	clc
	jmp LB_29120
LB_29119:
	bts r12,1
	stc
LB_29120:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29117
	btr r12,0
	clc
	jmp LB_29118
LB_29117:
	bts r12,0
	stc
LB_29118:
	add rsp,32
; _f24118 %_29050 ⊢ { %_29051 %_29052 } : { %_29051 %_29052 }
 ; {>  %_29042~0':_stg %_29050~4':_stg %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; _f24118 4' ⊢ { 4' 5' }
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
	jc LB_29137
	btr r12,0
	jmp LB_29138
LB_29137:
	bts r12,0
LB_29138:
	call NS_E_24118
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_29139
	btr r12,4
	jmp LB_29140
LB_29139:
	bts r12,4
LB_29140:
	mov r11,r14
	bt r12,1
	jc LB_29141
	btr r12,5
	jmp LB_29142
LB_29141:
	bts r12,5
LB_29142:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29135
	btr r12,3
	clc
	jmp LB_29136
LB_29135:
	bts r12,3
	stc
LB_29136:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29133
	btr r12,2
	clc
	jmp LB_29134
LB_29133:
	bts r12,2
	stc
LB_29134:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29131
	btr r12,1
	clc
	jmp LB_29132
LB_29131:
	bts r12,1
	stc
LB_29132:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29129
	btr r12,0
	clc
	jmp LB_29130
LB_29129:
	bts r12,0
	stc
LB_29130:
	add rsp,40
MTC_LB_29143:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29144
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
	jnc LB_29145
	bt QWORD [rdi],0
	jc LB_29146
	btr r12,7
	clc
	jmp LB_29147
LB_29146:
	bts r12,7
	stc
LB_29147:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29145:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_29148
	btr r12,6
	jmp LB_29149
LB_29148:
	bts r12,6
LB_29149:
LB_29150:
	cmp r15,0
	jz LB_29151
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29150
LB_29151:
; » 0xr0 |~ {  } ⊢ %_29054 : %_29054
 ; {>  %_29042~0':_stg %_29051~4':_stg %_29053~6':_stg %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_29054
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f25246 { %_29053 %_29054 } ⊢ { %_29055 %_29056 %_29057 } : { %_29055 %_29056 %_29057 }
 ; {>  %_29042~0':_stg %_29051~4':_stg %_29053~6':_stg %_29054~5':_r64 %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; _f25246 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_29162
	btr r12,0
	jmp LB_29163
LB_29162:
	bts r12,0
LB_29163:
	mov r14,r11
	bt r12,5
	jc LB_29164
	btr r12,1
	jmp LB_29165
LB_29164:
	bts r12,1
LB_29165:
	call NS_E_25246
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_29166
	btr r12,5
	jmp LB_29167
LB_29166:
	bts r12,5
LB_29167:
	mov rcx,r14
	bt r12,1
	jc LB_29168
	btr r12,6
	jmp LB_29169
LB_29168:
	bts r12,6
LB_29169:
	mov rdx,r9
	bt r12,3
	jc LB_29172
	btr r12,7
	jmp LB_29173
LB_29172:
	bts r12,7
LB_29173:
	mov rsi,1
	bt r12,7
	jc LB_29170
	mov rsi,0
	bt rdx,0
	jc LB_29170
	jmp LB_29171
LB_29170:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_29171:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29160
	btr r12,4
	clc
	jmp LB_29161
LB_29160:
	bts r12,4
	stc
LB_29161:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29158
	btr r12,3
	clc
	jmp LB_29159
LB_29158:
	bts r12,3
	stc
LB_29159:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29156
	btr r12,2
	clc
	jmp LB_29157
LB_29156:
	bts r12,2
	stc
LB_29157:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29154
	btr r12,1
	clc
	jmp LB_29155
LB_29154:
	bts r12,1
	stc
LB_29155:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29152
	btr r12,0
	clc
	jmp LB_29153
LB_29152:
	bts r12,0
	stc
LB_29153:
	add rsp,48
MTC_LB_29174:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29175
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
	jnc LB_29176
	bt QWORD [rdi],0
	jc LB_29177
	btr r12,9
	clc
	jmp LB_29178
LB_29177:
	bts r12,9
	stc
LB_29178:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29176:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_29179
	btr r12,8
	jmp LB_29180
LB_29179:
	bts r12,8
LB_29180:
LB_29181:
	cmp r15,0
	jz LB_29182
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29181
LB_29182:
; » 0xr0 |~ {  } ⊢ %_29059 : %_29059
 ; {>  %_29056~6':_r64 %_29042~0':_stg %_29058~8':(_lst)◂(_p21291) %_29051~4':_stg %_29055~5':_stg %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; 	» 0xr0 _ ⊢ 7' : %_29059
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f22073 { %_29059 %_29058 } ⊢ { %_29060 %_29061 } : { %_29060 %_29061 }
 ; {>  %_29056~6':_r64 %_29042~0':_stg %_29059~7':_r64 %_29058~8':(_lst)◂(_p21291) %_29051~4':_stg %_29055~5':_stg %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; _f22073 { 7' 8' } ⊢ { 7' 8' }
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
	jc LB_29197
	btr r12,0
	jmp LB_29198
LB_29197:
	bts r12,0
LB_29198:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_29199
	btr r12,1
	jmp LB_29200
LB_29199:
	bts r12,1
LB_29200:
	call NS_E_22073
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_29201
	btr r12,7
	jmp LB_29202
LB_29201:
	bts r12,7
LB_29202:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_29203
	btr r12,8
	jmp LB_29204
LB_29203:
	bts r12,8
LB_29204:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_29195
	btr r12,6
	clc
	jmp LB_29196
LB_29195:
	bts r12,6
	stc
LB_29196:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_29193
	btr r12,5
	clc
	jmp LB_29194
LB_29193:
	bts r12,5
	stc
LB_29194:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29191
	btr r12,4
	clc
	jmp LB_29192
LB_29191:
	bts r12,4
	stc
LB_29192:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29189
	btr r12,3
	clc
	jmp LB_29190
LB_29189:
	bts r12,3
	stc
LB_29190:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29187
	btr r12,2
	clc
	jmp LB_29188
LB_29187:
	bts r12,2
	stc
LB_29188:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29185
	btr r12,1
	clc
	jmp LB_29186
LB_29185:
	bts r12,1
	stc
LB_29186:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29183
	btr r12,0
	clc
	jmp LB_29184
LB_29183:
	bts r12,0
	stc
LB_29184:
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
; _f38 %_29063 ⊢ %_29064 : %_29064
 ; {>  %_29062~8':_stg %_29056~6':_r64 %_29042~0':_stg %_29063~9':_stg %_29051~4':_stg %_29055~5':_stg %_29060~7':_r64 %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
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
	jc LB_29223
	btr r12,0
	jmp LB_29224
LB_29223:
	bts r12,0
LB_29224:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_29225
	btr r12,9
	jmp LB_29226
LB_29225:
	bts r12,9
LB_29226:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_29221
	btr r12,8
	clc
	jmp LB_29222
LB_29221:
	bts r12,8
	stc
LB_29222:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_29219
	btr r12,7
	clc
	jmp LB_29220
LB_29219:
	bts r12,7
	stc
LB_29220:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_29217
	btr r12,6
	clc
	jmp LB_29218
LB_29217:
	bts r12,6
	stc
LB_29218:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_29215
	btr r12,5
	clc
	jmp LB_29216
LB_29215:
	bts r12,5
	stc
LB_29216:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29213
	btr r12,4
	clc
	jmp LB_29214
LB_29213:
	bts r12,4
	stc
LB_29214:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29211
	btr r12,3
	clc
	jmp LB_29212
LB_29211:
	bts r12,3
	stc
LB_29212:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29209
	btr r12,2
	clc
	jmp LB_29210
LB_29209:
	bts r12,2
	stc
LB_29210:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29207
	btr r12,1
	clc
	jmp LB_29208
LB_29207:
	bts r12,1
	stc
LB_29208:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29205
	btr r12,0
	clc
	jmp LB_29206
LB_29205:
	bts r12,0
	stc
LB_29206:
	add rsp,80
; ∎ {  }
 ; {>  %_29062~8':_stg %_29056~6':_r64 %_29042~0':_stg %_29051~4':_stg %_29064~9':_stg %_29055~5':_stg %_29060~7':_r64 %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; 	∎ {  }
	bt r12,8
	jc LB_29227
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_29227:
	bt r12,6
	jc LB_29228
	mov rdi,rcx
	call dlt
LB_29228:
	bt r12,0
	jc LB_29229
	mov rdi,r13
	call dlt
LB_29229:
	bt r12,4
	jc LB_29230
	mov rdi,r10
	call dlt
LB_29230:
	bt r12,9
	jc LB_29231
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_29231:
	bt r12,5
	jc LB_29232
	mov rdi,r11
	call dlt
LB_29232:
	bt r12,7
	jc LB_29233
	mov rdi,rdx
	call dlt
LB_29233:
	bt r12,2
	jc LB_29234
	mov rdi,r8
	call dlt
LB_29234:
	bt r12,3
	jc LB_29235
	mov rdi,r9
	call dlt
LB_29235:
	bt r12,1
	jc LB_29236
	mov rdi,r14
	call dlt
LB_29236:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_29175:
	mov r15,0
LB_29238:
	cmp r15,0
	jz LB_29239
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29238
LB_29239:
; 	» "H0\n" _ ⊢ 8' : %_29065
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_29065 ⊢ %_29066 : %_29066
 ; {>  %_29056~6':_r64 %_29042~0':_stg %_29057~7':(_opn)◂((_lst)◂(_p21291)) %_29065~8':_stg %_29051~4':_stg %_29055~5':_stg %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
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
	jc LB_29256
	btr r12,0
	jmp LB_29257
LB_29256:
	bts r12,0
LB_29257:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_29258
	btr r12,8
	jmp LB_29259
LB_29258:
	bts r12,8
LB_29259:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_29254
	btr r12,7
	clc
	jmp LB_29255
LB_29254:
	bts r12,7
	stc
LB_29255:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_29252
	btr r12,6
	clc
	jmp LB_29253
LB_29252:
	bts r12,6
	stc
LB_29253:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_29250
	btr r12,5
	clc
	jmp LB_29251
LB_29250:
	bts r12,5
	stc
LB_29251:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29248
	btr r12,4
	clc
	jmp LB_29249
LB_29248:
	bts r12,4
	stc
LB_29249:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29246
	btr r12,3
	clc
	jmp LB_29247
LB_29246:
	bts r12,3
	stc
LB_29247:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29244
	btr r12,2
	clc
	jmp LB_29245
LB_29244:
	bts r12,2
	stc
LB_29245:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29242
	btr r12,1
	clc
	jmp LB_29243
LB_29242:
	bts r12,1
	stc
LB_29243:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29240
	btr r12,0
	clc
	jmp LB_29241
LB_29240:
	bts r12,0
	stc
LB_29241:
	add rsp,72
; ∎ {  }
 ; {>  %_29066~8':_stg %_29056~6':_r64 %_29042~0':_stg %_29057~7':(_opn)◂((_lst)◂(_p21291)) %_29051~4':_stg %_29055~5':_stg %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; 	∎ {  }
	bt r12,8
	jc LB_29260
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_29260:
	bt r12,6
	jc LB_29261
	mov rdi,rcx
	call dlt
LB_29261:
	bt r12,0
	jc LB_29262
	mov rdi,r13
	call dlt
LB_29262:
	bt r12,7
	jc LB_29263
	mov rdi,rdx
	call dlt
LB_29263:
	bt r12,4
	jc LB_29264
	mov rdi,r10
	call dlt
LB_29264:
	bt r12,5
	jc LB_29265
	mov rdi,r11
	call dlt
LB_29265:
	bt r12,2
	jc LB_29266
	mov rdi,r8
	call dlt
LB_29266:
	bt r12,3
	jc LB_29267
	mov rdi,r9
	call dlt
LB_29267:
	bt r12,1
	jc LB_29268
	mov rdi,r14
	call dlt
LB_29268:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_29237:
MTC_LB_29144:
	mov r15,0
LB_29270:
	cmp r15,0
	jz LB_29271
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29270
LB_29271:
; 	» "H1\n" _ ⊢ 6' : %_29067
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_29067 ⊢ %_29068 : %_29068
 ; {>  %_29042~0':_stg %_29067~6':_stg %_29051~4':_stg %_29052~5':(_opn)◂(_stg) %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
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
	jc LB_29284
	btr r12,0
	jmp LB_29285
LB_29284:
	bts r12,0
LB_29285:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_29286
	btr r12,6
	jmp LB_29287
LB_29286:
	bts r12,6
LB_29287:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_29282
	btr r12,5
	clc
	jmp LB_29283
LB_29282:
	bts r12,5
	stc
LB_29283:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29280
	btr r12,4
	clc
	jmp LB_29281
LB_29280:
	bts r12,4
	stc
LB_29281:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29278
	btr r12,3
	clc
	jmp LB_29279
LB_29278:
	bts r12,3
	stc
LB_29279:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29276
	btr r12,2
	clc
	jmp LB_29277
LB_29276:
	bts r12,2
	stc
LB_29277:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29274
	btr r12,1
	clc
	jmp LB_29275
LB_29274:
	bts r12,1
	stc
LB_29275:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29272
	btr r12,0
	clc
	jmp LB_29273
LB_29272:
	bts r12,0
	stc
LB_29273:
	add rsp,56
; ∎ {  }
 ; {>  %_29042~0':_stg %_29051~4':_stg %_29068~6':_stg %_29052~5':(_opn)◂(_stg) %_29049~2':_stg %_29045~3':_stg %_29043~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_29288
	mov rdi,r13
	call dlt
LB_29288:
	bt r12,4
	jc LB_29289
	mov rdi,r10
	call dlt
LB_29289:
	bt r12,6
	jc LB_29290
	mov rdi,rcx
	call dlt
LB_29290:
	bt r12,5
	jc LB_29291
	mov rdi,r11
	call dlt
LB_29291:
	bt r12,2
	jc LB_29292
	mov rdi,r8
	call dlt
LB_29292:
	bt r12,3
	jc LB_29293
	mov rdi,r9
	call dlt
LB_29293:
	bt r12,1
	jc LB_29294
	mov rdi,r14
	call dlt
LB_29294:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_29269:
MTC_LB_29089:
	mov r15,0
LB_29296:
	cmp r15,0
	jz LB_29297
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29296
LB_29297:
; _f25246 { %_29042 %_29043 } ⊢ { %_29069 %_29070 %_29071 } : { %_29069 %_29070 %_29071 }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29042~0':_stg %_29043~1':_r64 }
; _f25246 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_25246
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_29300
	btr r12,4
	jmp LB_29301
LB_29300:
	bts r12,4
LB_29301:
	mov r9,r10
	bt r12,4
	jc LB_29304
	btr r12,3
	jmp LB_29305
LB_29304:
	bts r12,3
LB_29305:
	mov rsi,1
	bt r12,3
	jc LB_29302
	mov rsi,0
	bt r9,0
	jc LB_29302
	jmp LB_29303
LB_29302:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_29303:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_29298
	btr r12,2
	clc
	jmp LB_29299
LB_29298:
	bts r12,2
	stc
LB_29299:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_29072
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_29072 ⊢ { %_29073 %_29074 } : { %_29073 %_29074 }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29069~0':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29072~4':_stg %_29070~1':_r64 }
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
	jc LB_29314
	btr r12,0
	jmp LB_29315
LB_29314:
	bts r12,0
LB_29315:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_29316
	btr r12,4
	jmp LB_29317
LB_29316:
	bts r12,4
LB_29317:
	mov r11,r14
	bt r12,1
	jc LB_29318
	btr r12,5
	jmp LB_29319
LB_29318:
	bts r12,5
LB_29319:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29312
	btr r12,3
	clc
	jmp LB_29313
LB_29312:
	bts r12,3
	stc
LB_29313:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29310
	btr r12,2
	clc
	jmp LB_29311
LB_29310:
	bts r12,2
	stc
LB_29311:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29308
	btr r12,1
	clc
	jmp LB_29309
LB_29308:
	bts r12,1
	stc
LB_29309:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29306
	btr r12,0
	clc
	jmp LB_29307
LB_29306:
	bts r12,0
	stc
LB_29307:
	add rsp,40
; _f38 { %_29073 %_29074 } ⊢ { %_29075 %_29076 } : { %_29075 %_29076 }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29073~4':_stg %_29074~5':_stg %_29069~0':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29070~1':_r64 }
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
	jc LB_29330
	btr r12,1
	jmp LB_29331
LB_29330:
	bts r12,1
LB_29331:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_29328
	btr QWORD [rdi],0
	jmp LB_29329
LB_29328:
	bts QWORD [rdi],0
LB_29329:
	mov r14,r11
	bt r12,5
	jc LB_29334
	btr r12,1
	jmp LB_29335
LB_29334:
	bts r12,1
LB_29335:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_29332
	btr QWORD [rdi],1
	jmp LB_29333
LB_29332:
	bts QWORD [rdi],1
LB_29333:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_29338
	btr r12,1
	clc
	jmp LB_29339
LB_29338:
	bts r12,1
	stc
LB_29339:
	mov r10,r14
	bt r12,1
	jc LB_29336
	btr r12,4
	jmp LB_29337
LB_29336:
	bts r12,4
LB_29337:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_29342
	btr r12,1
	clc
	jmp LB_29343
LB_29342:
	bts r12,1
	stc
LB_29343:
	mov r11,r14
	bt r12,1
	jc LB_29340
	btr r12,5
	jmp LB_29341
LB_29340:
	bts r12,5
LB_29341:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29326
	btr r12,3
	clc
	jmp LB_29327
LB_29326:
	bts r12,3
	stc
LB_29327:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29324
	btr r12,2
	clc
	jmp LB_29325
LB_29324:
	bts r12,2
	stc
LB_29325:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29322
	btr r12,1
	clc
	jmp LB_29323
LB_29322:
	bts r12,1
	stc
LB_29323:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29320
	btr r12,0
	clc
	jmp LB_29321
LB_29320:
	bts r12,0
	stc
LB_29321:
	add rsp,40
; _f24118 %_29076 ⊢ { %_29077 %_29078 } : { %_29077 %_29078 }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29075~4':_stg %_29069~0':_stg %_29076~5':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29070~1':_r64 }
; _f24118 5' ⊢ { 5' 6' }
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
	jc LB_29354
	btr r12,0
	jmp LB_29355
LB_29354:
	bts r12,0
LB_29355:
	call NS_E_24118
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_29356
	btr r12,5
	jmp LB_29357
LB_29356:
	bts r12,5
LB_29357:
	mov rcx,r14
	bt r12,1
	jc LB_29358
	btr r12,6
	jmp LB_29359
LB_29358:
	bts r12,6
LB_29359:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29352
	btr r12,4
	clc
	jmp LB_29353
LB_29352:
	bts r12,4
	stc
LB_29353:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29350
	btr r12,3
	clc
	jmp LB_29351
LB_29350:
	bts r12,3
	stc
LB_29351:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29348
	btr r12,2
	clc
	jmp LB_29349
LB_29348:
	bts r12,2
	stc
LB_29349:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29346
	btr r12,1
	clc
	jmp LB_29347
LB_29346:
	bts r12,1
	stc
LB_29347:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29344
	btr r12,0
	clc
	jmp LB_29345
LB_29344:
	bts r12,0
	stc
LB_29345:
	add rsp,48
MTC_LB_29360:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29361
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
	jnc LB_29362
	bt QWORD [rdi],0
	jc LB_29363
	btr r12,8
	clc
	jmp LB_29364
LB_29363:
	bts r12,8
	stc
LB_29364:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29362:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_29365
	btr r12,7
	jmp LB_29366
LB_29365:
	bts r12,7
LB_29366:
LB_29367:
	cmp r15,0
	jz LB_29368
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29367
LB_29368:
; » 0xr0 |~ {  } ⊢ %_29080 : %_29080
 ; {>  %_29044~2':(_lst)◂(_stg) %_29077~5':_stg %_29075~4':_stg %_29069~0':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29079~7':_stg %_29070~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_29080
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f25246 { %_29079 %_29080 } ⊢ { %_29081 %_29082 %_29083 } : { %_29081 %_29082 %_29083 }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29077~5':_stg %_29080~6':_r64 %_29075~4':_stg %_29069~0':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29079~7':_stg %_29070~1':_r64 }
; _f25246 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_29381
	btr r12,0
	jmp LB_29382
LB_29381:
	bts r12,0
LB_29382:
	mov r14,rcx
	bt r12,6
	jc LB_29383
	btr r12,1
	jmp LB_29384
LB_29383:
	bts r12,1
LB_29384:
	call NS_E_25246
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_29385
	btr r12,6
	jmp LB_29386
LB_29385:
	bts r12,6
LB_29386:
	mov rdx,r14
	bt r12,1
	jc LB_29387
	btr r12,7
	jmp LB_29388
LB_29387:
	bts r12,7
LB_29388:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_29391
	btr r12,8
	jmp LB_29392
LB_29391:
	bts r12,8
LB_29392:
	mov rsi,1
	bt r12,8
	jc LB_29389
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_29389
	jmp LB_29390
LB_29389:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_29390:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_29379
	btr r12,5
	clc
	jmp LB_29380
LB_29379:
	bts r12,5
	stc
LB_29380:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29377
	btr r12,4
	clc
	jmp LB_29378
LB_29377:
	bts r12,4
	stc
LB_29378:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29375
	btr r12,3
	clc
	jmp LB_29376
LB_29375:
	bts r12,3
	stc
LB_29376:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29373
	btr r12,2
	clc
	jmp LB_29374
LB_29373:
	bts r12,2
	stc
LB_29374:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29371
	btr r12,1
	clc
	jmp LB_29372
LB_29371:
	bts r12,1
	stc
LB_29372:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29369
	btr r12,0
	clc
	jmp LB_29370
LB_29369:
	bts r12,0
	stc
LB_29370:
	add rsp,56
; _f38 { %_29081 %_29082 %_29083 } ⊢ { %_29084 %_29085 %_29086 } : { %_29084 %_29085 %_29086 }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29077~5':_stg %_29081~6':_stg %_29075~4':_stg %_29083~8':(_opn)◂((_lst)◂(_p21291)) %_29069~0':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29082~7':_r64 %_29070~1':_r64 }
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
	jc LB_29407
	btr r12,1
	jmp LB_29408
LB_29407:
	bts r12,1
LB_29408:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_29405
	btr QWORD [rdi],0
	jmp LB_29406
LB_29405:
	bts QWORD [rdi],0
LB_29406:
	mov r14,rdx
	bt r12,7
	jc LB_29411
	btr r12,1
	jmp LB_29412
LB_29411:
	bts r12,1
LB_29412:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_29409
	btr QWORD [rdi],1
	jmp LB_29410
LB_29409:
	bts QWORD [rdi],1
LB_29410:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_29415
	btr r12,1
	jmp LB_29416
LB_29415:
	bts r12,1
LB_29416:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,1
	jc LB_29413
	btr QWORD [rdi],2
	jmp LB_29414
LB_29413:
	bts QWORD [rdi],2
LB_29414:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_29419
	btr r12,1
	clc
	jmp LB_29420
LB_29419:
	bts r12,1
	stc
LB_29420:
	mov rcx,r14
	bt r12,1
	jc LB_29417
	btr r12,6
	jmp LB_29418
LB_29417:
	bts r12,6
LB_29418:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_29423
	btr r12,1
	clc
	jmp LB_29424
LB_29423:
	bts r12,1
	stc
LB_29424:
	mov rdx,r14
	bt r12,1
	jc LB_29421
	btr r12,7
	jmp LB_29422
LB_29421:
	bts r12,7
LB_29422:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_29427
	btr r12,1
	clc
	jmp LB_29428
LB_29427:
	bts r12,1
	stc
LB_29428:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_29425
	btr r12,8
	jmp LB_29426
LB_29425:
	bts r12,8
LB_29426:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_29403
	btr r12,5
	clc
	jmp LB_29404
LB_29403:
	bts r12,5
	stc
LB_29404:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_29401
	btr r12,4
	clc
	jmp LB_29402
LB_29401:
	bts r12,4
	stc
LB_29402:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_29399
	btr r12,3
	clc
	jmp LB_29400
LB_29399:
	bts r12,3
	stc
LB_29400:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_29397
	btr r12,2
	clc
	jmp LB_29398
LB_29397:
	bts r12,2
	stc
LB_29398:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_29395
	btr r12,1
	clc
	jmp LB_29396
LB_29395:
	bts r12,1
	stc
LB_29396:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29393
	btr r12,0
	clc
	jmp LB_29394
LB_29393:
	bts r12,0
	stc
LB_29394:
	add rsp,56
; ∎ {  }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29085~7':_r64 %_29077~5':_stg %_29084~6':_stg %_29086~8':(_opn)◂((_lst)◂(_p21291)) %_29075~4':_stg %_29069~0':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29070~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_29429
	mov rdi,r8
	call dlt
LB_29429:
	bt r12,7
	jc LB_29430
	mov rdi,rdx
	call dlt
LB_29430:
	bt r12,5
	jc LB_29431
	mov rdi,r11
	call dlt
LB_29431:
	bt r12,6
	jc LB_29432
	mov rdi,rcx
	call dlt
LB_29432:
	bt r12,8
	jc LB_29433
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_29433:
	bt r12,4
	jc LB_29434
	mov rdi,r10
	call dlt
LB_29434:
	bt r12,0
	jc LB_29435
	mov rdi,r13
	call dlt
LB_29435:
	bt r12,3
	jc LB_29436
	mov rdi,r9
	call dlt
LB_29436:
	bt r12,1
	jc LB_29437
	mov rdi,r14
	call dlt
LB_29437:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_29361:
	mov r15,0
LB_29439:
	cmp r15,0
	jz LB_29440
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29439
LB_29440:
; ∎ {  }
 ; {>  %_29044~2':(_lst)◂(_stg) %_29077~5':_stg %_29075~4':_stg %_29069~0':_stg %_29071~3':(_opn)◂((_lst)◂(_p21291)) %_29078~6':(_opn)◂(_stg) %_29070~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_29441
	mov rdi,r8
	call dlt
LB_29441:
	bt r12,5
	jc LB_29442
	mov rdi,r11
	call dlt
LB_29442:
	bt r12,4
	jc LB_29443
	mov rdi,r10
	call dlt
LB_29443:
	bt r12,0
	jc LB_29444
	mov rdi,r13
	call dlt
LB_29444:
	bt r12,3
	jc LB_29445
	mov rdi,r9
	call dlt
LB_29445:
	bt r12,6
	jc LB_29446
	mov rdi,rcx
	call dlt
LB_29446:
	bt r12,1
	jc LB_29447
	mov rdi,r14
	call dlt
LB_29447:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_29438:
MTC_LB_29295:
section .data
	CST_DYN_29087:
		dq 0x0000_0001_00_82_ffff
		dq 1
