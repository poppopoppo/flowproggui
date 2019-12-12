%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_38955
	call NS_E_41086
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
NS_E_37430:
NS_E_RDI_37430:
NS_E_37430_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_37431
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_37431:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_37433:
NS_E_RDI_37433:
NS_E_37433_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_37433_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_37433_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_37434:
NS_E_RDI_37434:
NS_E_37434_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_37434_LB_0
	cmp r11,57
	ja NS_E_37434_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_37434_LB_0:
	mov rax,0
	ret
NS_E_37436:
NS_E_RDI_37436:
NS_E_37436_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_37436_LB_0
	cmp r11,122
	ja NS_E_37436_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_37436_LB_0:
	mov rax,0
	ret
NS_E_37435:
NS_E_RDI_37435:
NS_E_37435_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_37435_LB_0
	cmp r11,90
	ja NS_E_37435_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_37435_LB_0:
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
NS_E_37432:
NS_E_RDI_37432:
NS_E_37432_ETR_TBL:
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
	jz NS_E_37432_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_37432_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_37450:
; 	|» { 0' 1' }
NS_E_RDI_37450:
MTC_LB_37451:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_37452
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
	jnc LB_37453
	bt QWORD [rax],0
	jc LB_37454
	btr r12,4
	jmp LB_37455
LB_37454:
	bts r12,4
LB_37455:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_37453:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_37458
	btr r12,5
	jmp LB_37459
LB_37458:
	bts r12,5
LB_37459:
	mov r8,r11
	bt r12,5
	jc LB_37456
	btr r12,2
	jmp LB_37457
LB_37456:
	bts r12,2
LB_37457:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_37462
	btr r12,5
	jmp LB_37463
LB_37462:
	bts r12,5
LB_37463:
	mov r9,r11
	bt r12,5
	jc LB_37460
	btr r12,3
	jmp LB_37461
LB_37460:
	bts r12,3
LB_37461:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_37464:
	cmp r15,0
	jz LB_37465
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37464
LB_37465:
; _f39 %_37437 ⊢ %_37441 : %_37441
 ; {>  %_37437~0':_r64 %_37439~2':_r64 %_37440~3':(_lst)◂(_r64) }
	add r13,1
; _f37450 { %_37441 %_37440 } ⊢ { %_37442 %_37443 } : { %_37442 %_37443 }
 ; {>  %_37441~0':_r64 %_37439~2':_r64 %_37440~3':(_lst)◂(_r64) }
; _f37450 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_37468
	btr r12,1
	jmp LB_37469
LB_37468:
	bts r12,1
LB_37469:
	call NS_E_37450
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_37466
	btr r12,2
	jmp LB_37467
LB_37466:
	bts r12,2
LB_37467:
	add rsp,16
; _f38 %_37442 ⊢ %_37444 : %_37444
 ; {>  %_37442~0':_r64 %_37439~2':_r64 %_37443~1':_stg }
	sub r13,1
; _f16 { %_37443 %_37444 %_37439 } ⊢ { %_37445 %_37446 %_37447 } : { %_37445 %_37446 %_37447 }
 ; {>  %_37439~2':_r64 %_37444~0':_r64 %_37443~1':_stg }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_37470
	btr r12,3
	jmp LB_37471
LB_37470:
	bts r12,3
LB_37471:
	mov r14,r13
	bt r12,0
	jc LB_37472
	btr r12,1
	jmp LB_37473
LB_37472:
	bts r12,1
LB_37473:
	mov r13,r9
	bt r12,3
	jc LB_37474
	btr r12,0
	jmp LB_37475
LB_37474:
	bts r12,0
LB_37475:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_37446 %_37445 }
 ; {>  %_37446~1':_r64 %_37447~2':_r64 %_37445~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_37476
	mov rdi,r8
	call dlt
LB_37476:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_37477
	btr r12,2
	jmp LB_37478
LB_37477:
	bts r12,2
LB_37478:
	mov r14,r13
	bt r12,0
	jc LB_37479
	btr r12,1
	jmp LB_37480
LB_37479:
	bts r12,1
LB_37480:
	mov r13,r8
	bt r12,2
	jc LB_37481
	btr r12,0
	jmp LB_37482
LB_37481:
	bts r12,0
LB_37482:
	ret
MTC_LB_37452:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_37483
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
	jnc LB_37484
	bt QWORD [rax],0
	jc LB_37485
	btr r12,2
	jmp LB_37486
LB_37485:
	bts r12,2
LB_37486:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_37484:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_37487:
	cmp r15,0
	jz LB_37488
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37487
LB_37488:
; _f14 %_37437 ⊢ { %_37448 %_37449 } : { %_37448 %_37449 }
 ; {>  %_37437~0':_r64 }
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
; ∎ { %_37448 %_37449 }
 ; {>  %_37449~1':_stg %_37448~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_37483:
NS_E_37493:
; 	|» 0'
NS_E_RDI_37493:
; » 0xr0 |~ {  } ⊢ %_37490 : %_37490
 ; {>  %_37489~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_37490
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f37450 { %_37490 %_37489 } ⊢ { %_37491 %_37492 } : { %_37491 %_37492 }
 ; {>  %_37489~0':(_lst)◂(_r64) %_37490~1':_r64 }
; _f37450 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_37494
	btr r12,2
	jmp LB_37495
LB_37494:
	bts r12,2
LB_37495:
	mov r14,r13
	bt r12,0
	jc LB_37496
	btr r12,1
	jmp LB_37497
LB_37496:
	bts r12,1
LB_37497:
	mov r13,r8
	bt r12,2
	jc LB_37498
	btr r12,0
	jmp LB_37499
LB_37498:
	bts r12,0
LB_37499:
	call NS_E_37450
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_37492
 ; {>  %_37491~0':_r64 %_37492~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_37500
	mov rdi,r13
	call dlt
LB_37500:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_37501
	btr r12,0
	jmp LB_37502
LB_37501:
	bts r12,0
LB_37502:
	ret
NS_E_37503:
NS_E_RDI_37503:
NS_E_37503_ETR_TBL:
NS_E_37503_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_37544
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_37544
	jmp LB_37545
LB_37544:
	jmp LB_37534
LB_37545:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_37504_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37549
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37550
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37550:
	jmp LB_37534
LB_37549:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37537
	btr r12,1
	jmp LB_37538
LB_37537:
	bts r12,1
LB_37538:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37535
	btr r12,0
	jmp LB_37536
LB_37535:
	bts r12,0
LB_37536:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37531
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_37552
	btr r12,2
	jmp LB_37553
LB_37552:
	bts r12,2
LB_37553:
	mov r13,r14
	bt r12,1
	jc LB_37554
	btr r12,0
	jmp LB_37555
LB_37554:
	bts r12,0
LB_37555:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f37493 %_37506 ⊢ %_37507 : %_37507
 ; {>  %_37506~0':(_lst)◂(_r64) }
; _f37493 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_37493
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_37507 ⊢ %_37508 : %_37508
 ; {>  %_37507~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_37508
 ; {>  %_37508~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37529
	btr r12,3
	jmp LB_37530
LB_37529:
	bts r12,3
LB_37530:
	mov r8,0
	bts r12,2
	ret
LB_37531:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37533
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37532
LB_37533:
	add rsp,8
	ret
LB_37534:
	add rsp,32
	pop r14
LB_37532:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37504:
NS_E_RDI_37504:
NS_E_37504_ETR_TBL:
NS_E_37504_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_37581
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_37581
	jmp LB_37582
LB_37581:
	jmp LB_37569
LB_37582:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_37505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37586
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37587
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37587:
	jmp LB_37569
LB_37586:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_37504_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37592
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37593
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37593:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37594
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37594:
	jmp LB_37569
LB_37592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37574
	btr r12,2
	jmp LB_37575
LB_37574:
	bts r12,2
LB_37575:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37572
	btr r12,1
	jmp LB_37573
LB_37572:
	bts r12,1
LB_37573:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37570
	btr r12,0
	jmp LB_37571
LB_37570:
	bts r12,0
LB_37571:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_37566
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_37596
	btr r12,3
	jmp LB_37597
LB_37596:
	bts r12,3
LB_37597:
	mov r14,r8
	bt r12,2
	jc LB_37598
	btr r12,1
	jmp LB_37599
LB_37598:
	bts r12,1
LB_37599:
	mov r8,r13
	bt r12,0
	jc LB_37600
	btr r12,2
	jmp LB_37601
LB_37600:
	bts r12,2
LB_37601:
	mov r13,r9
	bt r12,3
	jc LB_37602
	btr r12,0
	jmp LB_37603
LB_37602:
	bts r12,0
LB_37603:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_37509 %_37510 } ⊢ %_37511 : %_37511
 ; {>  %_37509~0':_r64 %_37510~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_37511 ⊢ %_37512 : %_37512
 ; {>  %_37511~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_37512
 ; {>  %_37512~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_37560
	btr r12,2
	jmp LB_37561
LB_37560:
	bts r12,2
LB_37561:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_37558
	btr QWORD [rdi],0
	jmp LB_37559
LB_37558:
	bts QWORD [rdi],0
LB_37559:
	mov r8,r14
	bt r12,1
	jc LB_37564
	btr r12,2
	jmp LB_37565
LB_37564:
	bts r12,2
LB_37565:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_37562
	btr QWORD [rdi],1
	jmp LB_37563
LB_37562:
	bts QWORD [rdi],1
LB_37563:
	mov rsi,1
	bt r12,3
	jc LB_37556
	mov rsi,0
	bt r9,0
	jc LB_37556
	jmp LB_37557
LB_37556:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_37557:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37566:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37568
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37567
LB_37568:
	add rsp,8
	ret
LB_37569:
	add rsp,48
	pop r14
LB_37567:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_37617
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_37617
	jmp LB_37618
LB_37617:
	jmp LB_37609
LB_37618:
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
	jc LB_37610
	btr r12,0
	jmp LB_37611
LB_37610:
	bts r12,0
LB_37611:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37606
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_37513 : %_37513
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_37513 ⊢ %_37514 : %_37514
 ; {>  %_37513~°1◂{  }:(_lst)◂(t9877'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_37514
 ; {>  %_37514~°0◂°1◂{  }:(_opn)◂((_lst)◂(t9880'(0))) }
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
	jc LB_37604
	mov rsi,0
	bt r9,0
	jc LB_37604
	jmp LB_37605
LB_37604:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_37605:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37606:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37608
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37607
LB_37608:
	add rsp,8
	ret
LB_37609:
	add rsp,16
	pop r14
LB_37607:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_37430_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37640
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37632
LB_37640:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_37504_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37645
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37646
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37646:
	jmp LB_37632
LB_37645:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37635
	btr r12,1
	jmp LB_37636
LB_37635:
	bts r12,1
LB_37636:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37633
	btr r12,0
	jmp LB_37634
LB_37633:
	bts r12,0
LB_37634:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37629
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_37515 %_37516 } ⊢ %_37517 : %_37517
 ; {>  %_37515~0':_r64 %_37516~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_37517 ⊢ %_37518 : %_37518
 ; {>  %_37517~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_37518
 ; {>  %_37518~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_37623
	btr r12,2
	jmp LB_37624
LB_37623:
	bts r12,2
LB_37624:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_37621
	btr QWORD [rdi],0
	jmp LB_37622
LB_37621:
	bts QWORD [rdi],0
LB_37622:
	mov r8,r14
	bt r12,1
	jc LB_37627
	btr r12,2
	jmp LB_37628
LB_37627:
	bts r12,2
LB_37628:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_37625
	btr QWORD [rdi],1
	jmp LB_37626
LB_37625:
	bts QWORD [rdi],1
LB_37626:
	mov rsi,1
	bt r12,3
	jc LB_37619
	mov rsi,0
	bt r9,0
	jc LB_37619
	jmp LB_37620
LB_37619:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_37620:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37629:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37631
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37630
LB_37631:
	add rsp,8
	ret
LB_37632:
	add rsp,32
	pop r14
LB_37630:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37505:
NS_E_RDI_37505:
NS_E_37505_ETR_TBL:
NS_E_37505_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_37661
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_37661
	jmp LB_37662
LB_37661:
	jmp LB_37653
LB_37662:
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
	jc LB_37654
	btr r12,0
	jmp LB_37655
LB_37654:
	bts r12,0
LB_37655:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37650
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_37519 : %_37519
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_37519
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_37519 ⊢ %_37520 : %_37520
 ; {>  %_37519~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37520
 ; {>  %_37520~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37648
	btr r12,3
	jmp LB_37649
LB_37648:
	bts r12,3
LB_37649:
	mov r8,0
	bts r12,2
	ret
LB_37650:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37652
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37651
LB_37652:
	add rsp,8
	ret
LB_37653:
	add rsp,16
	pop r14
LB_37651:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_37676
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_37676
	jmp LB_37677
LB_37676:
	jmp LB_37668
LB_37677:
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
	jc LB_37669
	btr r12,0
	jmp LB_37670
LB_37669:
	bts r12,0
LB_37670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37665
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_37521 : %_37521
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_37521
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_37521 ⊢ %_37522 : %_37522
 ; {>  %_37521~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37522
 ; {>  %_37522~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37663
	btr r12,3
	jmp LB_37664
LB_37663:
	bts r12,3
LB_37664:
	mov r8,0
	bts r12,2
	ret
LB_37665:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37667
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37666
LB_37667:
	add rsp,8
	ret
LB_37668:
	add rsp,16
	pop r14
LB_37666:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_37691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_37691
	jmp LB_37692
LB_37691:
	jmp LB_37683
LB_37692:
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
	jc LB_37684
	btr r12,0
	jmp LB_37685
LB_37684:
	bts r12,0
LB_37685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37680
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_37523 : %_37523
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_37523
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_37523 ⊢ %_37524 : %_37524
 ; {>  %_37523~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37524
 ; {>  %_37524~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37678
	btr r12,3
	jmp LB_37679
LB_37678:
	bts r12,3
LB_37679:
	mov r8,0
	bts r12,2
	ret
LB_37680:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37682
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37681
LB_37682:
	add rsp,8
	ret
LB_37683:
	add rsp,16
	pop r14
LB_37681:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_37706
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_37706
	jmp LB_37707
LB_37706:
	jmp LB_37698
LB_37707:
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
	jc LB_37699
	btr r12,0
	jmp LB_37700
LB_37699:
	bts r12,0
LB_37700:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37695
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_37525 : %_37525
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_37525
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_37525 ⊢ %_37526 : %_37526
 ; {>  %_37525~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37526
 ; {>  %_37526~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37693
	btr r12,3
	jmp LB_37694
LB_37693:
	bts r12,3
LB_37694:
	mov r8,0
	bts r12,2
	ret
LB_37695:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37697
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37696
LB_37697:
	add rsp,8
	ret
LB_37698:
	add rsp,16
	pop r14
LB_37696:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_37721
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_37721
	jmp LB_37722
LB_37721:
	jmp LB_37713
LB_37722:
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
	jc LB_37714
	btr r12,0
	jmp LB_37715
LB_37714:
	bts r12,0
LB_37715:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37710
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_37527 : %_37527
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_37527
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_37527 ⊢ %_37528 : %_37528
 ; {>  %_37527~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37528
 ; {>  %_37528~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37708
	btr r12,3
	jmp LB_37709
LB_37708:
	bts r12,3
LB_37709:
	mov r8,0
	bts r12,2
	ret
LB_37710:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37712
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37711
LB_37712:
	add rsp,8
	ret
LB_37713:
	add rsp,16
	pop r14
LB_37711:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37723:
NS_E_RDI_37723:
NS_E_37723_ETR_TBL:
NS_E_37723_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_37430_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37760
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37754
LB_37760:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37755
	btr r12,0
	jmp LB_37756
LB_37755:
	bts r12,0
LB_37756:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37751
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_37725 : %_37725
 ; {>  %_37724~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_37725
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_37726 : %_37726
 ; {>  %_37724~0':_r64 %_37725~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_37726
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_37724 %_37725 } ⊢ { %_37727 %_37728 %_37729 } : { %_37727 %_37728 %_37729 }
 ; {>  %_37724~0':_r64 %_37725~1':_r64 %_37726~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_37726 %_37727 } ⊢ { %_37730 %_37731 %_37732 } : { %_37730 %_37731 %_37732 }
 ; {>  %_37727~0':_r64 %_37726~2':_r64 %_37728~1':_r64 %_37729~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_37735:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_37736
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_37736
LB_37737:
	cmp r15,0
	jz LB_37738
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37737
LB_37738:
; _some %_37731 ⊢ %_37733 : %_37733
 ; {>  %_37731~0':_r64 %_37728~1':_r64 %_37730~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37733
 ; {>  %_37733~°0◂0':(_opn)◂(_r64) %_37728~1':_r64 %_37730~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_37739
	mov rdi,r14
	call dlt
LB_37739:
	bt r12,2
	jc LB_37740
	mov rdi,r8
	call dlt
LB_37740:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37741
	btr r12,3
	jmp LB_37742
LB_37741:
	bts r12,3
LB_37742:
	mov r8,0
	bts r12,2
	ret
MTC_LB_37736:
	mov r15,0
LB_37744:
	cmp r15,0
	jz LB_37745
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37744
LB_37745:
; _none {  } ⊢ %_37734 : %_37734
 ; {>  %_37732~4':_r64 %_37731~0':_r64 %_37728~1':_r64 %_37730~2':_r64 %_37729~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_37734
 ; {>  %_37732~4':_r64 %_37734~°1◂{  }:(_opn)◂(t9955'(0)) %_37731~0':_r64 %_37728~1':_r64 %_37730~2':_r64 %_37729~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_37746
	mov rdi,r10
	call dlt
LB_37746:
	bt r12,0
	jc LB_37747
	mov rdi,r13
	call dlt
LB_37747:
	bt r12,1
	jc LB_37748
	mov rdi,r14
	call dlt
LB_37748:
	bt r12,2
	jc LB_37749
	mov rdi,r8
	call dlt
LB_37749:
	bt r12,3
	jc LB_37750
	mov rdi,r9
	call dlt
LB_37750:
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
MTC_LB_37743:
LB_37751:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37753
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37752
LB_37753:
	add rsp,8
	ret
LB_37754:
	add rsp,16
	pop r14
LB_37752:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37762:
NS_E_RDI_37762:
NS_E_37762_ETR_TBL:
NS_E_37762_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_37430_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37799
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37793
LB_37799:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37794
	btr r12,0
	jmp LB_37795
LB_37794:
	bts r12,0
LB_37795:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37790
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_37764 : %_37764
 ; {>  %_37763~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_37764
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_37765 : %_37765
 ; {>  %_37764~1':_r64 %_37763~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_37765
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_37763 %_37764 } ⊢ { %_37766 %_37767 %_37768 } : { %_37766 %_37767 %_37768 }
 ; {>  %_37765~2':_r64 %_37764~1':_r64 %_37763~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_37765 %_37766 } ⊢ { %_37769 %_37770 %_37771 } : { %_37769 %_37770 %_37771 }
 ; {>  %_37766~0':_r64 %_37765~2':_r64 %_37768~3':_r64 %_37767~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_37774:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_37775
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_37775
LB_37776:
	cmp r15,0
	jz LB_37777
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37776
LB_37777:
; _some %_37770 ⊢ %_37772 : %_37772
 ; {>  %_37770~0':_r64 %_37769~2':_r64 %_37767~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37772
 ; {>  %_37772~°0◂0':(_opn)◂(_r64) %_37769~2':_r64 %_37767~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_37778
	mov rdi,r8
	call dlt
LB_37778:
	bt r12,1
	jc LB_37779
	mov rdi,r14
	call dlt
LB_37779:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37780
	btr r12,3
	jmp LB_37781
LB_37780:
	bts r12,3
LB_37781:
	mov r8,0
	bts r12,2
	ret
MTC_LB_37775:
	mov r15,0
LB_37783:
	cmp r15,0
	jz LB_37784
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37783
LB_37784:
; _none {  } ⊢ %_37773 : %_37773
 ; {>  %_37770~0':_r64 %_37769~2':_r64 %_37771~4':_r64 %_37768~3':_r64 %_37767~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_37773
 ; {>  %_37770~0':_r64 %_37773~°1◂{  }:(_opn)◂(t9982'(0)) %_37769~2':_r64 %_37771~4':_r64 %_37768~3':_r64 %_37767~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_37785
	mov rdi,r13
	call dlt
LB_37785:
	bt r12,2
	jc LB_37786
	mov rdi,r8
	call dlt
LB_37786:
	bt r12,4
	jc LB_37787
	mov rdi,r10
	call dlt
LB_37787:
	bt r12,3
	jc LB_37788
	mov rdi,r9
	call dlt
LB_37788:
	bt r12,1
	jc LB_37789
	mov rdi,r14
	call dlt
LB_37789:
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
MTC_LB_37782:
LB_37790:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37792
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37791
LB_37792:
	add rsp,8
	ret
LB_37793:
	add rsp,16
	pop r14
LB_37791:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37801:
NS_E_RDI_37801:
NS_E_37801_ETR_TBL:
NS_E_37801_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_37430_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37838
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37832
LB_37838:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37833
	btr r12,0
	jmp LB_37834
LB_37833:
	bts r12,0
LB_37834:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37829
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_37803 : %_37803
 ; {>  %_37802~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_37803
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_37804 : %_37804
 ; {>  %_37802~0':_r64 %_37803~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_37804
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_37802 %_37803 } ⊢ { %_37805 %_37806 %_37807 } : { %_37805 %_37806 %_37807 }
 ; {>  %_37802~0':_r64 %_37803~1':_r64 %_37804~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_37804 %_37805 } ⊢ { %_37808 %_37809 %_37810 } : { %_37808 %_37809 %_37810 }
 ; {>  %_37806~1':_r64 %_37807~3':_r64 %_37804~2':_r64 %_37805~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_37813:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_37814
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_37814
LB_37815:
	cmp r15,0
	jz LB_37816
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37815
LB_37816:
; _some %_37809 ⊢ %_37811 : %_37811
 ; {>  %_37808~2':_r64 %_37806~1':_r64 %_37809~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37811
 ; {>  %_37808~2':_r64 %_37806~1':_r64 %_37811~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_37817
	mov rdi,r8
	call dlt
LB_37817:
	bt r12,1
	jc LB_37818
	mov rdi,r14
	call dlt
LB_37818:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37819
	btr r12,3
	jmp LB_37820
LB_37819:
	bts r12,3
LB_37820:
	mov r8,0
	bts r12,2
	ret
MTC_LB_37814:
	mov r15,0
LB_37822:
	cmp r15,0
	jz LB_37823
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_37822
LB_37823:
; _none {  } ⊢ %_37812 : %_37812
 ; {>  %_37808~2':_r64 %_37806~1':_r64 %_37807~3':_r64 %_37810~4':_r64 %_37809~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_37812
 ; {>  %_37808~2':_r64 %_37806~1':_r64 %_37812~°1◂{  }:(_opn)◂(t10009'(0)) %_37807~3':_r64 %_37810~4':_r64 %_37809~0':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_37824
	mov rdi,r8
	call dlt
LB_37824:
	bt r12,1
	jc LB_37825
	mov rdi,r14
	call dlt
LB_37825:
	bt r12,3
	jc LB_37826
	mov rdi,r9
	call dlt
LB_37826:
	bt r12,4
	jc LB_37827
	mov rdi,r10
	call dlt
LB_37827:
	bt r12,0
	jc LB_37828
	mov rdi,r13
	call dlt
LB_37828:
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
MTC_LB_37821:
LB_37829:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37831
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37830
LB_37831:
	add rsp,8
	ret
LB_37832:
	add rsp,16
	pop r14
LB_37830:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37840:
NS_E_RDI_37840:
NS_E_37840_ETR_TBL:
NS_E_37840_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_37801_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37856
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37850
LB_37856:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37851
	btr r12,0
	jmp LB_37852
LB_37851:
	bts r12,0
LB_37852:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37847
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_37841 ⊢ %_37842 : %_37842
 ; {>  %_37841~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37842
 ; {>  %_37842~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37845
	btr r12,3
	jmp LB_37846
LB_37845:
	bts r12,3
LB_37846:
	mov r8,0
	bts r12,2
	ret
LB_37847:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37849
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37848
LB_37849:
	add rsp,8
	ret
LB_37850:
	add rsp,16
	pop r14
LB_37848:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_37762_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37869
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37863
LB_37869:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37864
	btr r12,0
	jmp LB_37865
LB_37864:
	bts r12,0
LB_37865:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37860
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_37843 ⊢ %_37844 : %_37844
 ; {>  %_37843~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37844
 ; {>  %_37844~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37858
	btr r12,3
	jmp LB_37859
LB_37858:
	bts r12,3
LB_37859:
	mov r8,0
	bts r12,2
	ret
LB_37860:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37862
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37861
LB_37862:
	add rsp,8
	ret
LB_37863:
	add rsp,16
	pop r14
LB_37861:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37871:
NS_E_RDI_37871:
NS_E_37871_ETR_TBL:
NS_E_37871_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_37840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37916
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37908
LB_37916:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_37872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37921
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37922
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37922:
	jmp LB_37908
LB_37921:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37911
	btr r12,1
	jmp LB_37912
LB_37911:
	bts r12,1
LB_37912:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37909
	btr r12,0
	jmp LB_37910
LB_37909:
	bts r12,0
LB_37910:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37905
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_37874 %_37875 } ⊢ %_37876 : %_37876
 ; {>  %_37874~0':_r64 %_37875~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f37493 %_37876 ⊢ %_37877 : %_37877
 ; {>  %_37876~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f37493 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_37891
	btr r12,2
	jmp LB_37892
LB_37891:
	bts r12,2
LB_37892:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_37897
	btr r12,3
	jmp LB_37898
LB_37897:
	bts r12,3
LB_37898:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_37895
	btr QWORD [rdi],0
	jmp LB_37896
LB_37895:
	bts QWORD [rdi],0
LB_37896:
	mov r9,r14
	bt r12,1
	jc LB_37901
	btr r12,3
	jmp LB_37902
LB_37901:
	bts r12,3
LB_37902:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_37899
	btr QWORD [rdi],1
	jmp LB_37900
LB_37899:
	bts QWORD [rdi],1
LB_37900:
	mov rsi,1
	bt r12,0
	jc LB_37893
	mov rsi,0
	bt r13,0
	jc LB_37893
	jmp LB_37894
LB_37893:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_37894:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_37493
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_37877 ⊢ %_37878 : %_37878
 ; {>  %_37877~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_37878
 ; {>  %_37878~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37903
	btr r12,3
	jmp LB_37904
LB_37903:
	bts r12,3
LB_37904:
	mov r8,0
	bts r12,2
	ret
LB_37905:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37907
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37906
LB_37907:
	add rsp,8
	ret
LB_37908:
	add rsp,32
	pop r14
LB_37906:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37872:
NS_E_RDI_37872:
NS_E_37872_ETR_TBL:
NS_E_37872_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_37873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37937
LB_37945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_37872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37950
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37951:
	jmp LB_37937
LB_37950:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37940
	btr r12,1
	jmp LB_37941
LB_37940:
	bts r12,1
LB_37941:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37938
	btr r12,0
	jmp LB_37939
LB_37938:
	bts r12,0
LB_37939:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37934
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_37879 %_37880 } ⊢ %_37881 : %_37881
 ; {>  %_37880~1':(_lst)◂(_r64) %_37879~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_37881 ⊢ %_37882 : %_37882
 ; {>  %_37881~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_37882
 ; {>  %_37882~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_37928
	btr r12,2
	jmp LB_37929
LB_37928:
	bts r12,2
LB_37929:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_37926
	btr QWORD [rdi],0
	jmp LB_37927
LB_37926:
	bts QWORD [rdi],0
LB_37927:
	mov r8,r14
	bt r12,1
	jc LB_37932
	btr r12,2
	jmp LB_37933
LB_37932:
	bts r12,2
LB_37933:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_37930
	btr QWORD [rdi],1
	jmp LB_37931
LB_37930:
	bts QWORD [rdi],1
LB_37931:
	mov rsi,1
	bt r12,3
	jc LB_37924
	mov rsi,0
	bt r9,0
	jc LB_37924
	jmp LB_37925
LB_37924:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_37925:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37934:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37936
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37935
LB_37936:
	add rsp,8
	ret
LB_37937:
	add rsp,32
	pop r14
LB_37935:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_37955
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_37883 : %_37883
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_37883 ⊢ %_37884 : %_37884
 ; {>  %_37883~°1◂{  }:(_lst)◂(t10053'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_37884
 ; {>  %_37884~°0◂°1◂{  }:(_opn)◂((_lst)◂(t10056'(0))) }
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
	jc LB_37953
	mov rsi,0
	bt r9,0
	jc LB_37953
	jmp LB_37954
LB_37953:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_37954:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37955:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37957
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37956
LB_37957:
	add rsp,8
	ret
LB_37958:
	add rsp,0
	pop r14
LB_37956:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_37873:
NS_E_RDI_37873:
NS_E_37873_ETR_TBL:
NS_E_37873_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_37840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37970
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37964
LB_37970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37965
	btr r12,0
	jmp LB_37966
LB_37965:
	bts r12,0
LB_37966:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37961
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_37885 ⊢ %_37886 : %_37886
 ; {>  %_37885~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37886
 ; {>  %_37886~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37959
	btr r12,3
	jmp LB_37960
LB_37959:
	bts r12,3
LB_37960:
	mov r8,0
	bts r12,2
	ret
LB_37961:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37963
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37962
LB_37963:
	add rsp,8
	ret
LB_37964:
	add rsp,16
	pop r14
LB_37962:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_37723_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37983
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37977
LB_37983:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37978
	btr r12,0
	jmp LB_37979
LB_37978:
	bts r12,0
LB_37979:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37974
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_37887 ⊢ %_37888 : %_37888
 ; {>  %_37887~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37888
 ; {>  %_37888~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37972
	btr r12,3
	jmp LB_37973
LB_37972:
	bts r12,3
LB_37973:
	mov r8,0
	bts r12,2
	ret
LB_37974:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37976
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37975
LB_37976:
	add rsp,8
	ret
LB_37977:
	add rsp,16
	pop r14
LB_37975:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_37998
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_37998
	jmp LB_37999
LB_37998:
	jmp LB_37990
LB_37999:
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
	jc LB_37991
	btr r12,0
	jmp LB_37992
LB_37991:
	bts r12,0
LB_37992:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37987
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_37889 : %_37889
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_37889
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_37889 ⊢ %_37890 : %_37890
 ; {>  %_37889~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_37890
 ; {>  %_37890~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37985
	btr r12,3
	jmp LB_37986
LB_37985:
	bts r12,3
LB_37986:
	mov r8,0
	bts r12,2
	ret
LB_37987:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37989
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_37988
LB_37989:
	add rsp,8
	ret
LB_37990:
	add rsp,16
	pop r14
LB_37988:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_38000:
NS_E_RDI_38000:
NS_E_38000_ETR_TBL:
NS_E_38000_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_38021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_38021
	jmp LB_38022
LB_38021:
	jmp LB_38011
LB_38022:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_37872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38026
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38027
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38027:
	jmp LB_38011
LB_38026:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38014
	btr r12,1
	jmp LB_38015
LB_38014:
	bts r12,1
LB_38015:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38012
	btr r12,0
	jmp LB_38013
LB_38012:
	bts r12,0
LB_38013:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_38008
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_38029
	btr r12,2
	jmp LB_38030
LB_38029:
	bts r12,2
LB_38030:
	mov r13,r14
	bt r12,1
	jc LB_38031
	btr r12,0
	jmp LB_38032
LB_38031:
	bts r12,0
LB_38032:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f37493 %_38001 ⊢ %_38002 : %_38002
 ; {>  %_38001~0':(_lst)◂(_r64) }
; _f37493 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_37493
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_38002 ⊢ %_38003 : %_38003
 ; {>  %_38002~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_38003
 ; {>  %_38003~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38006
	btr r12,3
	jmp LB_38007
LB_38006:
	bts r12,3
LB_38007:
	mov r8,0
	bts r12,2
	ret
LB_38008:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38010
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38009
LB_38010:
	add rsp,8
	ret
LB_38011:
	add rsp,32
	pop r14
LB_38009:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38044
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38038
LB_38044:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38039
	btr r12,0
	jmp LB_38040
LB_38039:
	bts r12,0
LB_38040:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38035
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_38004 ⊢ %_38005 : %_38005
 ; {>  %_38004~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_38005
 ; {>  %_38005~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38033
	btr r12,3
	jmp LB_38034
LB_38033:
	bts r12,3
LB_38034:
	mov r8,0
	bts r12,2
	ret
LB_38035:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38037
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38036
LB_38037:
	add rsp,8
	ret
LB_38038:
	add rsp,16
	pop r14
LB_38036:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_38047:
NS_E_RDI_38047:
NS_E_38047_ETR_TBL:
NS_E_38047_TBL:
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
LB_38056:
	jmp LB_38053
LB_38052:
	add r14,1
LB_38053:
	cmp r14,r10
	jge LB_38054
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38052
	cmp al,10
	jz LB_38052
	cmp al,32
	jz LB_38052
LB_38054:
	push r10
	push rsi
	call NS_E_37871_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_38055
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_38057
	bts QWORD [rax],0
LB_38057:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_38056
LB_38055:
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
	jc LB_38050
	btr QWORD [rdi],0
LB_38050:
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
LB_38049:
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
NS_E_38144:
NS_E_RDI_38144:
NS_E_38144_ETR_TBL:
NS_E_38144_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_38246
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_38246
	jmp LB_38247
LB_38246:
	jmp LB_38238
LB_38247:
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
	jc LB_38239
	btr r12,0
	jmp LB_38240
LB_38239:
	bts r12,0
LB_38240:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38235
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_38148 : %_38148
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_38148
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_38148 ⊢ %_38149 : %_38149
 ; {>  %_38148~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_38149
 ; {>  %_38149~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38233
	btr r12,3
	jmp LB_38234
LB_38233:
	bts r12,3
LB_38234:
	mov r8,0
	bts r12,2
	ret
LB_38235:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38237
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38236
LB_38237:
	add rsp,8
	ret
LB_38238:
	add rsp,16
	pop r14
LB_38236:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_37430_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38262
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38254
LB_38262:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_38144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38267
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38268
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38268:
	jmp LB_38254
LB_38267:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38257
	btr r12,1
	jmp LB_38258
LB_38257:
	bts r12,1
LB_38258:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38255
	btr r12,0
	jmp LB_38256
LB_38255:
	bts r12,0
LB_38256:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_38251
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 %_38151 ⊢ %_38152 : %_38152
 ; {>  %_38150~0':_r64 %_38151~1':_r64 }
	add r14,1
; _some %_38152 ⊢ %_38153 : %_38153
 ; {>  %_38150~0':_r64 %_38152~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_38153
 ; {>  %_38150~0':_r64 %_38153~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_38248
	mov rdi,r13
	call dlt
LB_38248:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_38249
	btr r12,3
	jmp LB_38250
LB_38249:
	bts r12,3
LB_38250:
	mov r8,0
	bts r12,2
	ret
LB_38251:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38253
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38252
LB_38253:
	add rsp,8
	ret
LB_38254:
	add rsp,32
	pop r14
LB_38252:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_38145:
NS_E_RDI_38145:
NS_E_38145_ETR_TBL:
NS_E_38145_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_38283
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_38283
	jmp LB_38284
LB_38283:
	jmp LB_38275
LB_38284:
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
	jc LB_38276
	btr r12,0
	jmp LB_38277
LB_38276:
	bts r12,0
LB_38277:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38272
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_38154 : %_38154
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_38154
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_38154 ⊢ %_38155 : %_38155
 ; {>  %_38154~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_38155
 ; {>  %_38155~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38270
	btr r12,3
	jmp LB_38271
LB_38270:
	bts r12,3
LB_38271:
	mov r8,0
	bts r12,2
	ret
LB_38272:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38274
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38273
LB_38274:
	add rsp,8
	ret
LB_38275:
	add rsp,16
	pop r14
LB_38273:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_38298
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_38298
	jmp LB_38299
LB_38298:
	jmp LB_38290
LB_38299:
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
	jc LB_38291
	btr r12,0
	jmp LB_38292
LB_38291:
	bts r12,0
LB_38292:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38287
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_38156 : %_38156
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_38156
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_38156 ⊢ %_38157 : %_38157
 ; {>  %_38156~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_38157
 ; {>  %_38157~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38285
	btr r12,3
	jmp LB_38286
LB_38285:
	bts r12,3
LB_38286:
	mov r8,0
	bts r12,2
	ret
LB_38287:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38289
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38288
LB_38289:
	add rsp,8
	ret
LB_38290:
	add rsp,16
	pop r14
LB_38288:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_38302
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_38158 : %_38158
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_38158
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_38158 ⊢ %_38159 : %_38159
 ; {>  %_38158~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_38159
 ; {>  %_38159~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38300
	btr r12,3
	jmp LB_38301
LB_38300:
	bts r12,3
LB_38301:
	mov r8,0
	bts r12,2
	ret
LB_38302:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38304
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38303
LB_38304:
	add rsp,8
	ret
LB_38305:
	add rsp,0
	pop r14
LB_38303:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_38146:
NS_E_RDI_38146:
NS_E_38146_ETR_TBL:
NS_E_38146_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_38145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38348
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38332
LB_38348:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_38356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_38356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_38356
	jmp LB_38357
LB_38356:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38354
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38354:
	jmp LB_38332
LB_38357:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_38145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38361
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38362
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38362:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38363
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38363:
	jmp LB_38332
LB_38361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_38373
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_38373
	jmp LB_38374
LB_38373:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38369
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38369:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38370
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38370:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38371:
	jmp LB_38332
LB_38374:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_38147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38378
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_38379
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_38379:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38380
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38380:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38381
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38381:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38382
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38382:
	jmp LB_38332
LB_38378:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_38146_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38387
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_38388
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_38388:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_38389
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_38389:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38390
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38390:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38391
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38391:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38392
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38392:
	jmp LB_38332
LB_38387:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_38343
	btr r12,5
	jmp LB_38344
LB_38343:
	bts r12,5
LB_38344:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_38341
	btr r12,4
	jmp LB_38342
LB_38341:
	bts r12,4
LB_38342:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_38339
	btr r12,3
	jmp LB_38340
LB_38339:
	bts r12,3
LB_38340:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_38337
	btr r12,2
	jmp LB_38338
LB_38337:
	bts r12,2
LB_38338:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38335
	btr r12,1
	jmp LB_38336
LB_38335:
	bts r12,1
LB_38336:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38333
	btr r12,0
	jmp LB_38334
LB_38333:
	bts r12,0
LB_38334:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_38329
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_38394
	btr r12,6
	jmp LB_38395
LB_38394:
	bts r12,6
LB_38395:
	mov r8,r10
	bt r12,4
	jc LB_38396
	btr r12,2
	jmp LB_38397
LB_38396:
	bts r12,2
LB_38397:
	mov rdx,r14
	bt r12,1
	jc LB_38398
	btr r12,7
	jmp LB_38399
LB_38398:
	bts r12,7
LB_38399:
	mov r14,rcx
	bt r12,6
	jc LB_38400
	btr r12,1
	jmp LB_38401
LB_38400:
	bts r12,1
LB_38401:
	mov rcx,r9
	bt r12,3
	jc LB_38402
	btr r12,6
	jmp LB_38403
LB_38402:
	bts r12,6
LB_38403:
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_38406
	btr r12,8
	jmp LB_38407
LB_38406:
	bts r12,8
LB_38407:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38404
	btr r12,3
	jmp LB_38405
LB_38404:
	bts r12,3
LB_38405:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_38410
	btr r12,8
	jmp LB_38411
LB_38410:
	bts r12,8
LB_38411:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38408
	btr r12,4
	jmp LB_38409
LB_38408:
	bts r12,4
LB_38409:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_38165 : %_38165
 ; {>  %_38160~0':_r64 %_38162~2':_r64 %_38164~4':(_lst)◂(_p38141) %_38163~3':_r64 %_38161~1':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_38165
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f34 { %_38165 %_38160 } ⊢ { %_38166 %_38167 } : { %_38166 %_38167 }
 ; {>  %_38165~5':_r64 %_38160~0':_r64 %_38162~2':_r64 %_38164~4':(_lst)◂(_p38141) %_38163~3':_r64 %_38161~1':_r64 }
	add r11,r13
; _f34 { %_38166 %_38161 } ⊢ { %_38168 %_38169 } : { %_38168 %_38169 }
 ; {>  %_38166~5':_r64 %_38162~2':_r64 %_38164~4':(_lst)◂(_p38141) %_38163~3':_r64 %_38167~0':_r64 %_38161~1':_r64 }
	add r11,r14
; _f34 { %_38168 %_38162 } ⊢ { %_38170 %_38171 } : { %_38170 %_38171 }
 ; {>  %_38162~2':_r64 %_38169~1':_r64 %_38164~4':(_lst)◂(_p38141) %_38163~3':_r64 %_38168~5':_r64 %_38167~0':_r64 }
	add r11,r8
; _f38142 %_38170 ⊢ %_38172 : %_38172
 ; {>  %_38169~1':_r64 %_38164~4':(_lst)◂(_p38141) %_38170~5':_r64 %_38163~3':_r64 %_38167~0':_r64 %_38171~2':_r64 }
; _f38142 5' ⊢ °0◂5'
; _cns { %_38172 %_38164 } ⊢ %_38173 : %_38173
 ; {>  %_38172~°0◂5':_p38141 %_38169~1':_r64 %_38164~4':(_lst)◂(_p38141) %_38163~3':_r64 %_38167~0':_r64 %_38171~2':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_38163 %_38173 } ⊢ %_38174 : %_38174
 ; {>  %_38169~1':_r64 %_38163~3':_r64 %_38173~°0◂{ °0◂5' 4' }:(_lst)◂(_p38141) %_38167~0':_r64 %_38171~2':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_38174
 ; {>  %_38169~1':_r64 %_38174~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p38141) }) %_38167~0':_r64 %_38171~2':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_38306
	mov rdi,r14
	call dlt
LB_38306:
	bt r12,0
	jc LB_38307
	mov rdi,r13
	call dlt
LB_38307:
	bt r12,2
	jc LB_38308
	mov rdi,r8
	call dlt
LB_38308:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_38309
	btr r12,0
	jmp LB_38310
LB_38309:
	bts r12,0
LB_38310:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_38313
	btr r12,1
	jmp LB_38314
LB_38313:
	bts r12,1
LB_38314:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_38311
	btr QWORD [rdi],0
	jmp LB_38312
LB_38311:
	bts QWORD [rdi],0
LB_38312:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_38323
	btr r12,0
	jmp LB_38324
LB_38323:
	bts r12,0
LB_38324:
	mov rsi,1
	bt r12,0
	jc LB_38321
	mov rsi,0
	bt r13,0
	jc LB_38321
	jmp LB_38322
LB_38321:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_38322:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_38319
	btr QWORD [rdi],0
	jmp LB_38320
LB_38319:
	bts QWORD [rdi],0
LB_38320:
	mov r13,r10
	bt r12,4
	jc LB_38327
	btr r12,0
	jmp LB_38328
LB_38327:
	bts r12,0
LB_38328:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_38325
	btr QWORD [rdi],1
	jmp LB_38326
LB_38325:
	bts QWORD [rdi],1
LB_38326:
	mov rsi,1
	bt r12,1
	jc LB_38317
	mov rsi,0
	bt r14,0
	jc LB_38317
	jmp LB_38318
LB_38317:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_38318:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_38315
	btr QWORD [rdi],1
	jmp LB_38316
LB_38315:
	bts QWORD [rdi],1
LB_38316:
	mov r8,0
	bts r12,2
	ret
LB_38329:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38331
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38330
LB_38331:
	add rsp,8
	ret
LB_38332:
	add rsp,96
	pop r14
LB_38330:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_38145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38449
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38437
LB_38449:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_38457
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_38457
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_38457
	jmp LB_38458
LB_38457:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38455:
	jmp LB_38437
LB_38458:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_38144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38462
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38463
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38463:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38464
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38464:
	jmp LB_38437
LB_38462:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_38146_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38469
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38470
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38470:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38471
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38471:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38472:
	jmp LB_38437
LB_38469:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_38444
	btr r12,3
	jmp LB_38445
LB_38444:
	bts r12,3
LB_38445:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_38442
	btr r12,2
	jmp LB_38443
LB_38442:
	bts r12,2
LB_38443:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38440
	btr r12,1
	jmp LB_38441
LB_38440:
	bts r12,1
LB_38441:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38438
	btr r12,0
	jmp LB_38439
LB_38438:
	bts r12,0
LB_38439:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_38434
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_38474
	btr r12,4
	jmp LB_38475
LB_38474:
	bts r12,4
LB_38475:
	mov r14,r8
	bt r12,2
	jc LB_38476
	btr r12,1
	jmp LB_38477
LB_38476:
	bts r12,1
LB_38477:
	mov r11,r9
	bt r12,3
	jc LB_38478
	btr r12,5
	jmp LB_38479
LB_38478:
	bts r12,5
LB_38479:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_38482
	btr r12,6
	jmp LB_38483
LB_38482:
	bts r12,6
LB_38483:
	mov r8,rcx
	bt r12,6
	jc LB_38480
	btr r12,2
	jmp LB_38481
LB_38480:
	bts r12,2
LB_38481:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_38486
	btr r12,6
	jmp LB_38487
LB_38486:
	bts r12,6
LB_38487:
	mov r9,rcx
	bt r12,6
	jc LB_38484
	btr r12,3
	jmp LB_38485
LB_38484:
	bts r12,3
LB_38485:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_38179 : %_38179
 ; {>  %_38176~1':_r64 %_38175~0':_r64 %_38177~2':_r64 %_38178~3':(_lst)◂(_p38141) }
; 	» 0xr2 _ ⊢ 4' : %_38179
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f34 { %_38179 %_38175 } ⊢ { %_38180 %_38181 } : { %_38180 %_38181 }
 ; {>  %_38176~1':_r64 %_38179~4':_r64 %_38175~0':_r64 %_38177~2':_r64 %_38178~3':(_lst)◂(_p38141) }
	add r10,r13
; _f34 { %_38180 %_38176 } ⊢ { %_38182 %_38183 } : { %_38182 %_38183 }
 ; {>  %_38176~1':_r64 %_38177~2':_r64 %_38181~0':_r64 %_38180~4':_r64 %_38178~3':(_lst)◂(_p38141) }
	add r10,r14
; _f38142 %_38182 ⊢ %_38184 : %_38184
 ; {>  %_38182~4':_r64 %_38177~2':_r64 %_38183~1':_r64 %_38181~0':_r64 %_38178~3':(_lst)◂(_p38141) }
; _f38142 4' ⊢ °0◂4'
; _cns { %_38184 %_38178 } ⊢ %_38185 : %_38185
 ; {>  %_38177~2':_r64 %_38184~°0◂4':_p38141 %_38183~1':_r64 %_38181~0':_r64 %_38178~3':(_lst)◂(_p38141) }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_38177 %_38185 } ⊢ %_38186 : %_38186
 ; {>  %_38177~2':_r64 %_38183~1':_r64 %_38185~°0◂{ °0◂4' 3' }:(_lst)◂(_p38141) %_38181~0':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_38186
 ; {>  %_38186~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p38141) }) %_38183~1':_r64 %_38181~0':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_38412
	mov rdi,r14
	call dlt
LB_38412:
	bt r12,0
	jc LB_38413
	mov rdi,r13
	call dlt
LB_38413:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_38414
	btr r12,0
	jmp LB_38415
LB_38414:
	bts r12,0
LB_38415:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_38418
	btr r12,1
	jmp LB_38419
LB_38418:
	bts r12,1
LB_38419:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_38416
	btr QWORD [rdi],0
	jmp LB_38417
LB_38416:
	bts QWORD [rdi],0
LB_38417:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_38428
	btr r12,2
	jmp LB_38429
LB_38428:
	bts r12,2
LB_38429:
	mov rsi,1
	bt r12,2
	jc LB_38426
	mov rsi,0
	bt r8,0
	jc LB_38426
	jmp LB_38427
LB_38426:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_38427:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_38424
	btr QWORD [rdi],0
	jmp LB_38425
LB_38424:
	bts QWORD [rdi],0
LB_38425:
	mov r8,r13
	bt r12,0
	jc LB_38432
	btr r12,2
	jmp LB_38433
LB_38432:
	bts r12,2
LB_38433:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_38430
	btr QWORD [rdi],1
	jmp LB_38431
LB_38430:
	bts QWORD [rdi],1
LB_38431:
	mov rsi,1
	bt r12,1
	jc LB_38422
	mov rsi,0
	bt r14,0
	jc LB_38422
	jmp LB_38423
LB_38422:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_38423:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_38420
	btr QWORD [rdi],1
	jmp LB_38421
LB_38420:
	bts QWORD [rdi],1
LB_38421:
	mov r8,0
	bts r12,2
	ret
LB_38434:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38436
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38435
LB_38436:
	add rsp,8
	ret
LB_38437:
	add rsp,64
	pop r14
LB_38435:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_38144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38559
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38551
LB_38559:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_38146_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38564
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38565
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38565:
	jmp LB_38551
LB_38564:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38554
	btr r12,1
	jmp LB_38555
LB_38554:
	bts r12,1
LB_38555:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38552
	btr r12,0
	jmp LB_38553
LB_38552:
	bts r12,0
LB_38553:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_38548
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_38567
	btr r12,3
	jmp LB_38568
LB_38567:
	bts r12,3
LB_38568:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_38571
	btr r12,4
	jmp LB_38572
LB_38571:
	bts r12,4
LB_38572:
	mov r14,r10
	bt r12,4
	jc LB_38569
	btr r12,1
	jmp LB_38570
LB_38569:
	bts r12,1
LB_38570:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_38575
	btr r12,4
	jmp LB_38576
LB_38575:
	bts r12,4
LB_38576:
	mov r8,r10
	bt r12,4
	jc LB_38573
	btr r12,2
	jmp LB_38574
LB_38573:
	bts r12,2
LB_38574:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f34 { %_38188 %_38187 } ⊢ { %_38190 %_38191 } : { %_38190 %_38191 }
 ; {>  %_38187~0':_r64 %_38189~2':(_lst)◂(_p38141) %_38188~1':_r64 }
	add r14,r13
MTC_LB_38488:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38489
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
	jnc LB_38490
	bt QWORD [rax],0
	jc LB_38491
	btr r12,5
	jmp LB_38492
LB_38491:
	bts r12,5
LB_38492:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_38490:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_38495
	btr r12,6
	jmp LB_38496
LB_38495:
	bts r12,6
LB_38496:
	mov r9,rcx
	bt r12,6
	jc LB_38493
	btr r12,3
	jmp LB_38494
LB_38493:
	bts r12,3
LB_38494:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_38499
	btr r12,6
	jmp LB_38500
LB_38499:
	bts r12,6
LB_38500:
	mov r10,rcx
	bt r12,6
	jc LB_38497
	btr r12,4
	jmp LB_38498
LB_38497:
	bts r12,4
LB_38498:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_38489
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
	jnc LB_38501
	bt QWORD [rax],0
	jc LB_38502
	btr r12,6
	jmp LB_38503
LB_38502:
	bts r12,6
LB_38503:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_38501:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_38504
	btr r12,5
	jmp LB_38505
LB_38504:
	bts r12,5
LB_38505:
LB_38506:
	cmp r15,0
	jz LB_38507
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38506
LB_38507:
; _f34 { %_38194 %_38191 } ⊢ { %_38195 %_38196 } : { %_38195 %_38196 }
 ; {>  %_38193~4':(_lst)◂(_p38141) %_38191~0':_r64 %_38190~1':_r64 %_38194~5':_r64 }
	add r11,r13
; _f38143 %_38195 ⊢ %_38197 : %_38197
 ; {>  %_38193~4':(_lst)◂(_p38141) %_38196~0':_r64 %_38195~5':_r64 %_38190~1':_r64 }
; _f38143 5' ⊢ °1◂5'
; _cns { %_38197 %_38193 } ⊢ %_38198 : %_38198
 ; {>  %_38193~4':(_lst)◂(_p38141) %_38196~0':_r64 %_38190~1':_r64 %_38197~°1◂5':_p38141 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_38190 %_38198 } ⊢ %_38199 : %_38199
 ; {>  %_38196~0':_r64 %_38198~°0◂{ °1◂5' 4' }:(_lst)◂(_p38141) %_38190~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_38199
 ; {>  %_38196~0':_r64 %_38199~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p38141) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_38508
	mov rdi,r13
	call dlt
LB_38508:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_38511
	btr r12,0
	jmp LB_38512
LB_38511:
	bts r12,0
LB_38512:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_38509
	btr QWORD [rdi],0
	jmp LB_38510
LB_38509:
	bts QWORD [rdi],0
LB_38510:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_38521
	btr r12,1
	jmp LB_38522
LB_38521:
	bts r12,1
LB_38522:
	mov rsi,1
	bt r12,1
	jc LB_38519
	mov rsi,0
	bt r14,0
	jc LB_38519
	jmp LB_38520
LB_38519:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_38520:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_38517
	btr QWORD [rdi],0
	jmp LB_38518
LB_38517:
	bts QWORD [rdi],0
LB_38518:
	mov r14,r10
	bt r12,4
	jc LB_38525
	btr r12,1
	jmp LB_38526
LB_38525:
	bts r12,1
LB_38526:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_38523
	btr QWORD [rdi],1
	jmp LB_38524
LB_38523:
	bts QWORD [rdi],1
LB_38524:
	mov rsi,1
	bt r12,0
	jc LB_38515
	mov rsi,0
	bt r13,0
	jc LB_38515
	jmp LB_38516
LB_38515:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_38516:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_38513
	btr QWORD [rdi],1
	jmp LB_38514
LB_38513:
	bts QWORD [rdi],1
LB_38514:
	mov r8,0
	bts r12,2
	ret
MTC_LB_38489:
	mov r15,0
LB_38528:
	cmp r15,0
	jz LB_38529
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38528
LB_38529:
; _f38143 %_38191 ⊢ %_38200 : %_38200
 ; {>  %_38189~2':(_lst)◂(_p38141) %_38191~0':_r64 %_38190~1':_r64 }
; _f38143 0' ⊢ °1◂0'
; _cns { %_38200 %_38189 } ⊢ %_38201 : %_38201
 ; {>  %_38200~°1◂0':_p38141 %_38189~2':(_lst)◂(_p38141) %_38190~1':_r64 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_38190 %_38201 } ⊢ %_38202 : %_38202
 ; {>  %_38201~°0◂{ °1◂0' 2' }:(_lst)◂(_p38141) %_38190~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_38202
 ; {>  %_38202~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p38141) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_38532
	btr r12,4
	jmp LB_38533
LB_38532:
	bts r12,4
LB_38533:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_38530
	btr QWORD [rdi],0
	jmp LB_38531
LB_38530:
	bts QWORD [rdi],0
LB_38531:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_38542
	btr r12,1
	jmp LB_38543
LB_38542:
	bts r12,1
LB_38543:
	mov rsi,1
	bt r12,1
	jc LB_38540
	mov rsi,0
	bt r14,0
	jc LB_38540
	jmp LB_38541
LB_38540:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_38541:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_38538
	btr QWORD [rdi],0
	jmp LB_38539
LB_38538:
	bts QWORD [rdi],0
LB_38539:
	mov r14,r8
	bt r12,2
	jc LB_38546
	btr r12,1
	jmp LB_38547
LB_38546:
	bts r12,1
LB_38547:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_38544
	btr QWORD [rdi],1
	jmp LB_38545
LB_38544:
	bts QWORD [rdi],1
LB_38545:
	mov rsi,1
	bt r12,4
	jc LB_38536
	mov rsi,0
	bt r10,0
	jc LB_38536
	jmp LB_38537
LB_38536:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_38537:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_38534
	btr QWORD [rdi],1
	jmp LB_38535
LB_38534:
	bts QWORD [rdi],1
LB_38535:
	mov r8,0
	bts r12,2
	ret
MTC_LB_38527:
LB_38548:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38550
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38549
LB_38550:
	add rsp,8
	ret
LB_38551:
	add rsp,32
	pop r14
LB_38549:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_38585
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_38203 : %_38203
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_38204 : %_38204
 ; {>  %_38203~°1◂{  }:(_lst)◂(t10214'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_38204
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_38204 %_38203 } ⊢ %_38205 : %_38205
 ; {>  %_38204~0':_r64 %_38203~°1◂{  }:(_lst)◂(t10214'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_38205
 ; {>  %_38205~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t10218'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_38579
	btr r12,1
	jmp LB_38580
LB_38579:
	bts r12,1
LB_38580:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_38577
	btr QWORD [rdi],0
	jmp LB_38578
LB_38577:
	bts QWORD [rdi],0
LB_38578:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_38583
	mov rsi,0
	bt r14,0
	jc LB_38583
	jmp LB_38584
LB_38583:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_38584:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_38581
	btr QWORD [rdi],1
	jmp LB_38582
LB_38581:
	bts QWORD [rdi],1
LB_38582:
	mov r8,0
	bts r12,2
	ret
LB_38585:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38587
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38586
LB_38587:
	add rsp,8
	ret
LB_38588:
	add rsp,0
	pop r14
LB_38586:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_38147:
NS_E_RDI_38147:
NS_E_38147_ETR_TBL:
NS_E_38147_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_38145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38608
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38596
LB_38608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_38616
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_38616
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_38616
	jmp LB_38617
LB_38616:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38614
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38614:
	jmp LB_38596
LB_38617:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_38145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38621
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38622
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38622:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38623
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38623:
	jmp LB_38596
LB_38621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_38633
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_38633
	jmp LB_38634
LB_38633:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38629
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38629:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38630
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38630:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38631
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38631:
	jmp LB_38596
LB_38634:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_38603
	btr r12,3
	jmp LB_38604
LB_38603:
	bts r12,3
LB_38604:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_38601
	btr r12,2
	jmp LB_38602
LB_38601:
	bts r12,2
LB_38602:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38599
	btr r12,1
	jmp LB_38600
LB_38599:
	bts r12,1
LB_38600:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38597
	btr r12,0
	jmp LB_38598
LB_38597:
	bts r12,0
LB_38598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_38593
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_38635
	btr r12,4
	jmp LB_38636
LB_38635:
	bts r12,4
LB_38636:
	mov r14,r8
	bt r12,2
	jc LB_38637
	btr r12,1
	jmp LB_38638
LB_38637:
	bts r12,1
LB_38638:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_38208 : %_38208
 ; {>  %_38207~1':_r64 %_38206~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_38208
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f34 { %_38208 %_38206 } ⊢ { %_38209 %_38210 } : { %_38209 %_38210 }
 ; {>  %_38208~2':_r64 %_38207~1':_r64 %_38206~0':_r64 }
	add r8,r13
; _f34 { %_38209 %_38207 } ⊢ { %_38211 %_38212 } : { %_38211 %_38212 }
 ; {>  %_38210~0':_r64 %_38207~1':_r64 %_38209~2':_r64 }
	add r8,r14
; _some %_38211 ⊢ %_38213 : %_38213
 ; {>  %_38211~2':_r64 %_38210~0':_r64 %_38212~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_38213
 ; {>  %_38210~0':_r64 %_38212~1':_r64 %_38213~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_38589
	mov rdi,r13
	call dlt
LB_38589:
	bt r12,1
	jc LB_38590
	mov rdi,r14
	call dlt
LB_38590:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_38591
	btr r12,3
	jmp LB_38592
LB_38591:
	bts r12,3
LB_38592:
	mov r8,0
	bts r12,2
	ret
LB_38593:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38595
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38594
LB_38595:
	add rsp,8
	ret
LB_38596:
	add rsp,64
	pop r14
LB_38594:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_38145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38664
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38648
LB_38664:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_38672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_38672
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_38672
	jmp LB_38673
LB_38672:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38670
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38670:
	jmp LB_38648
LB_38673:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_38145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38677
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38678
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38678:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38679
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38679:
	jmp LB_38648
LB_38677:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_38689
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_38689
	jmp LB_38690
LB_38689:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38685
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38685:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38686
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38686:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38687
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38687:
	jmp LB_38648
LB_38690:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_38147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38694
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_38695
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_38695:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38696
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38696:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38697
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38697:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38698:
	jmp LB_38648
LB_38694:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_38147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38703
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_38704
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_38704:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_38705
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_38705:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38706
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38706:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38707
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38708:
	jmp LB_38648
LB_38703:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_38659
	btr r12,5
	jmp LB_38660
LB_38659:
	bts r12,5
LB_38660:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_38657
	btr r12,4
	jmp LB_38658
LB_38657:
	bts r12,4
LB_38658:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_38655
	btr r12,3
	jmp LB_38656
LB_38655:
	bts r12,3
LB_38656:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_38653
	btr r12,2
	jmp LB_38654
LB_38653:
	bts r12,2
LB_38654:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38651
	btr r12,1
	jmp LB_38652
LB_38651:
	bts r12,1
LB_38652:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38649
	btr r12,0
	jmp LB_38650
LB_38649:
	bts r12,0
LB_38650:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_38645
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_38710
	btr r12,6
	jmp LB_38711
LB_38710:
	bts r12,6
LB_38711:
	mov r9,r11
	bt r12,5
	jc LB_38712
	btr r12,3
	jmp LB_38713
LB_38712:
	bts r12,3
LB_38713:
	mov r11,r8
	bt r12,2
	jc LB_38714
	btr r12,5
	jmp LB_38715
LB_38714:
	bts r12,5
LB_38715:
	mov r8,r10
	bt r12,4
	jc LB_38716
	btr r12,2
	jmp LB_38717
LB_38716:
	bts r12,2
LB_38717:
	mov r10,r14
	bt r12,1
	jc LB_38718
	btr r12,4
	jmp LB_38719
LB_38718:
	bts r12,4
LB_38719:
	mov r14,r11
	bt r12,5
	jc LB_38720
	btr r12,1
	jmp LB_38721
LB_38720:
	bts r12,1
LB_38721:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_38218 : %_38218
 ; {>  %_38216~2':_r64 %_38214~0':_r64 %_38217~3':_r64 %_38215~1':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_38218
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f34 { %_38218 %_38214 } ⊢ { %_38219 %_38220 } : { %_38219 %_38220 }
 ; {>  %_38216~2':_r64 %_38214~0':_r64 %_38217~3':_r64 %_38215~1':_r64 %_38218~4':_r64 }
	add r10,r13
; _f34 { %_38219 %_38215 } ⊢ { %_38221 %_38222 } : { %_38221 %_38222 }
 ; {>  %_38216~2':_r64 %_38217~3':_r64 %_38220~0':_r64 %_38215~1':_r64 %_38219~4':_r64 }
	add r10,r14
; _f34 { %_38221 %_38216 } ⊢ { %_38223 %_38224 } : { %_38223 %_38224 }
 ; {>  %_38216~2':_r64 %_38217~3':_r64 %_38221~4':_r64 %_38220~0':_r64 %_38222~1':_r64 }
	add r10,r8
; _f34 { %_38223 %_38217 } ⊢ { %_38225 %_38226 } : { %_38225 %_38226 }
 ; {>  %_38217~3':_r64 %_38220~0':_r64 %_38223~4':_r64 %_38222~1':_r64 %_38224~2':_r64 }
	add r10,r9
; _some %_38225 ⊢ %_38227 : %_38227
 ; {>  %_38226~3':_r64 %_38225~4':_r64 %_38220~0':_r64 %_38222~1':_r64 %_38224~2':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_38227
 ; {>  %_38226~3':_r64 %_38220~0':_r64 %_38227~°0◂4':(_opn)◂(_r64) %_38222~1':_r64 %_38224~2':_r64 }
; 	∎ °0◂4'
	bt r12,3
	jc LB_38639
	mov rdi,r9
	call dlt
LB_38639:
	bt r12,0
	jc LB_38640
	mov rdi,r13
	call dlt
LB_38640:
	bt r12,1
	jc LB_38641
	mov rdi,r14
	call dlt
LB_38641:
	bt r12,2
	jc LB_38642
	mov rdi,r8
	call dlt
LB_38642:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_38643
	btr r12,3
	jmp LB_38644
LB_38643:
	bts r12,3
LB_38644:
	mov r8,0
	bts r12,2
	ret
LB_38645:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38647
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38646
LB_38647:
	add rsp,8
	ret
LB_38648:
	add rsp,96
	pop r14
LB_38646:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_38144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38736
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38728
LB_38736:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_38147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38741
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38742
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38742:
	jmp LB_38728
LB_38741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38731
	btr r12,1
	jmp LB_38732
LB_38731:
	bts r12,1
LB_38732:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38729
	btr r12,0
	jmp LB_38730
LB_38729:
	bts r12,0
LB_38730:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_38725
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f34 { %_38228 %_38229 } ⊢ { %_38230 %_38231 } : { %_38230 %_38231 }
 ; {>  %_38228~0':_r64 %_38229~1':_r64 }
	add r13,r14
; _some %_38230 ⊢ %_38232 : %_38232
 ; {>  %_38230~0':_r64 %_38231~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_38232
 ; {>  %_38232~°0◂0':(_opn)◂(_r64) %_38231~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_38722
	mov rdi,r14
	call dlt
LB_38722:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38723
	btr r12,3
	jmp LB_38724
LB_38723:
	bts r12,3
LB_38724:
	mov r8,0
	bts r12,2
	ret
LB_38725:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38727
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38726
LB_38727:
	add rsp,8
	ret
LB_38728:
	add rsp,32
	pop r14
LB_38726:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_38766:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_38766:
MTC_LB_38767:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38768
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
	jnc LB_38769
	bt QWORD [rax],0
	jc LB_38770
	btr r12,7
	jmp LB_38771
LB_38770:
	bts r12,7
LB_38771:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_38769:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_38774
	btr r12,8
	jmp LB_38775
LB_38774:
	bts r12,8
LB_38775:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38772
	btr r12,5
	jmp LB_38773
LB_38772:
	bts r12,5
LB_38773:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_38778
	btr r12,8
	jmp LB_38779
LB_38778:
	bts r12,8
LB_38779:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38776
	btr r12,6
	jmp LB_38777
LB_38776:
	bts r12,6
LB_38777:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_38780:
	cmp r15,0
	jz LB_38781
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38780
LB_38781:
MTC_LB_38782:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_38783
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
	jnc LB_38784
	bt QWORD [rax],0
	jc LB_38785
	btr r12,7
	jmp LB_38786
LB_38785:
	bts r12,7
LB_38786:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_38784:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_38787
	btr r12,4
	jmp LB_38788
LB_38787:
	bts r12,4
LB_38788:
LB_38789:
	cmp r15,0
	jz LB_38790
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38789
LB_38790:
; _f36 %_38751 ⊢ { %_38752 %_38753 } : { %_38752 %_38753 }
 ; {>  %_38745~1':_r64 %_38750~6':(_lst)◂(_p38141) %_38746~2':_stg %_38744~0':_stg %_38751~4':_r64 %_38747~3':_r64 }
	mov r11,r10
	bts r12,5
; _f18 { %_38753 %_38744 %_38745 %_38746 %_38747 } ⊢ { %_38754 %_38755 %_38756 %_38757 %_38758 } : { %_38754 %_38755 %_38756 %_38757 %_38758 }
 ; {>  %_38745~1':_r64 %_38750~6':(_lst)◂(_p38141) %_38746~2':_stg %_38753~5':_r64 %_38744~0':_stg %_38752~4':_r64 %_38747~3':_r64 }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_38795
	btr r12,4
	jmp LB_38796
LB_38795:
	bts r12,4
LB_38796:
	mov r9,r8
	bt r12,2
	jc LB_38797
	btr r12,3
	jmp LB_38798
LB_38797:
	bts r12,3
LB_38798:
	mov r8,r14
	bt r12,1
	jc LB_38799
	btr r12,2
	jmp LB_38800
LB_38799:
	bts r12,2
LB_38800:
	mov r14,r13
	bt r12,0
	jc LB_38801
	btr r12,1
	jmp LB_38802
LB_38801:
	bts r12,1
LB_38802:
	mov r13,r11
	bt r12,5
	jc LB_38803
	btr r12,0
	jmp LB_38804
LB_38803:
	bts r12,0
LB_38804:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_38805
	btr r12,5
	jmp LB_38806
LB_38805:
	bts r12,5
LB_38806:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_38793
	btr r12,6
	jmp LB_38794
LB_38793:
	bts r12,6
LB_38794:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_38791
	btr r12,4
	jmp LB_38792
LB_38791:
	bts r12,4
LB_38792:
	add rsp,24
; _f38766 { %_38755 %_38756 %_38757 %_38758 %_38750 } ⊢ { %_38759 %_38760 } : { %_38759 %_38760 }
 ; {>  %_38758~5':_r64 %_38750~6':(_lst)◂(_p38141) %_38756~2':_r64 %_38754~0':_r64 %_38755~1':_stg %_38752~4':_r64 %_38757~3':_stg }
; _f38766 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_38811
	btr r12,0
	jmp LB_38812
LB_38811:
	bts r12,0
LB_38812:
	mov r14,r8
	bt r12,2
	jc LB_38813
	btr r12,1
	jmp LB_38814
LB_38813:
	bts r12,1
LB_38814:
	mov r8,r9
	bt r12,3
	jc LB_38815
	btr r12,2
	jmp LB_38816
LB_38815:
	bts r12,2
LB_38816:
	mov r9,r11
	bt r12,5
	jc LB_38817
	btr r12,3
	jmp LB_38818
LB_38817:
	bts r12,3
LB_38818:
	mov r10,rcx
	bt r12,6
	jc LB_38819
	btr r12,4
	jmp LB_38820
LB_38819:
	bts r12,4
LB_38820:
	call NS_E_38766
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_38821
	btr r12,2
	jmp LB_38822
LB_38821:
	bts r12,2
LB_38822:
	mov r14,r13
	bt r12,0
	jc LB_38823
	btr r12,1
	jmp LB_38824
LB_38823:
	bts r12,1
LB_38824:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_38809
	btr r12,4
	jmp LB_38810
LB_38809:
	bts r12,4
LB_38810:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38807
	btr r12,0
	jmp LB_38808
LB_38807:
	bts r12,0
LB_38808:
	add rsp,24
; ∎ { %_38759 %_38760 }
 ; {>  %_38759~1':_stg %_38760~2':_stg %_38754~0':_r64 %_38752~4':_r64 }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_38825
	mov rdi,r13
	call dlt
LB_38825:
	bt r12,4
	jc LB_38826
	mov rdi,r10
	call dlt
LB_38826:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_38827
	btr r12,0
	jmp LB_38828
LB_38827:
	bts r12,0
LB_38828:
	mov r14,r8
	bt r12,2
	jc LB_38829
	btr r12,1
	jmp LB_38830
LB_38829:
	bts r12,1
LB_38830:
	ret
MTC_LB_38783:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38831
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
	jnc LB_38832
	bt QWORD [rax],0
	jc LB_38833
	btr r12,7
	jmp LB_38834
LB_38833:
	bts r12,7
LB_38834:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_38832:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_38835
	btr r12,4
	jmp LB_38836
LB_38835:
	bts r12,4
LB_38836:
LB_38837:
	cmp r15,0
	jz LB_38838
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38837
LB_38838:
; _f34 { %_38745 %_38761 } ⊢ { %_38762 %_38763 } : { %_38762 %_38763 }
 ; {>  %_38745~1':_r64 %_38750~6':(_lst)◂(_p38141) %_38746~2':_stg %_38761~4':_r64 %_38744~0':_stg %_38747~3':_r64 }
	add r14,r10
; _f38766 { %_38744 %_38762 %_38746 %_38747 %_38750 } ⊢ { %_38764 %_38765 } : { %_38764 %_38765 }
 ; {>  %_38750~6':(_lst)◂(_p38141) %_38746~2':_stg %_38762~1':_r64 %_38763~4':_r64 %_38744~0':_stg %_38747~3':_r64 }
; _f38766 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_38841
	btr r12,4
	jmp LB_38842
LB_38841:
	bts r12,4
LB_38842:
	call NS_E_38766
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_38839
	btr r12,4
	jmp LB_38840
LB_38839:
	bts r12,4
LB_38840:
	add rsp,16
; ∎ { %_38764 %_38765 }
 ; {>  %_38765~1':_stg %_38763~4':_r64 %_38764~0':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_38843
	mov rdi,r10
	call dlt
LB_38843:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_38831:
MTC_LB_38768:
	mov r15,0
LB_38845:
	cmp r15,0
	jz LB_38846
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38845
LB_38846:
; ∎ { %_38744 %_38746 }
 ; {>  %_38745~1':_r64 %_38746~2':_stg %_38748~4':(_lst)◂(_p38141) %_38744~0':_stg %_38747~3':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_38847
	mov rdi,r14
	call dlt
LB_38847:
	bt r12,4
	jc LB_38848
	mov rdi,r10
	call dlt
LB_38848:
	bt r12,3
	jc LB_38849
	mov rdi,r9
	call dlt
LB_38849:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_38850
	btr r12,1
	jmp LB_38851
LB_38850:
	bts r12,1
LB_38851:
	ret
MTC_LB_38844:
NS_E_38869:
; 	|» 0'
NS_E_RDI_38869:
; » 0xr0 |~ {  } ⊢ %_38853 : %_38853
 ; {>  %_38852~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_38853
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f38146 { %_38852 %_38853 } ⊢ { %_38854 %_38855 %_38856 } : { %_38854 %_38855 %_38856 }
 ; {>  %_38852~0':_stg %_38853~1':_r64 }
; _f38146 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_38146
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_38870
	btr r12,4
	jmp LB_38871
LB_38870:
	bts r12,4
LB_38871:
	mov r8,r9
	bt r12,3
	jc LB_38874
	btr r12,2
	jmp LB_38875
LB_38874:
	bts r12,2
LB_38875:
	mov rsi,1
	bt r12,2
	jc LB_38872
	mov rsi,0
	bt r8,0
	jc LB_38872
	jmp LB_38873
LB_38872:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_38873:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_38876:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38877
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
	jnc LB_38878
	bt QWORD [rax],0
	jc LB_38879
	btr r12,5
	jmp LB_38880
LB_38879:
	bts r12,5
LB_38880:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_38878:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_38883
	btr r12,6
	jmp LB_38884
LB_38883:
	bts r12,6
LB_38884:
	mov r9,rcx
	bt r12,6
	jc LB_38881
	btr r12,3
	jmp LB_38882
LB_38881:
	bts r12,3
LB_38882:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_38887
	btr r12,6
	jmp LB_38888
LB_38887:
	bts r12,6
LB_38888:
	mov r10,rcx
	bt r12,6
	jc LB_38885
	btr r12,4
	jmp LB_38886
LB_38885:
	bts r12,4
LB_38886:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_38889:
	cmp r15,0
	jz LB_38890
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38889
LB_38890:
; _f21 { %_38857 %_38858 } ⊢ { %_38859 %_38860 } : { %_38859 %_38860 }
 ; {>  %_38858~4':(_lst)◂(_p38141) %_38855~1':_r64 %_38857~3':_r64 %_38854~0':_stg }
; _f21 { 3' 4' } ⊢ { 2' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000110.. |},{ 3' 4' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r9
	bt r12,3
	jc LB_38897
	btr r12,1
	jmp LB_38898
LB_38897:
	bts r12,1
LB_38898:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_38895
	btr QWORD [rdi],0
	jmp LB_38896
LB_38895:
	bts QWORD [rdi],0
LB_38896:
	mov r14,r10
	bt r12,4
	jc LB_38901
	btr r12,1
	jmp LB_38902
LB_38901:
	bts r12,1
LB_38902:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_38899
	btr QWORD [rdi],1
	jmp LB_38900
LB_38899:
	bts QWORD [rdi],1
LB_38900:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 2' 3' }
; 0' ⊢ { 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_38905
	btr r12,1
	jmp LB_38906
LB_38905:
	bts r12,1
LB_38906:
	mov r8,r14
	bt r12,1
	jc LB_38903
	btr r12,2
	jmp LB_38904
LB_38903:
	bts r12,2
LB_38904:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_38909
	btr r12,1
	jmp LB_38910
LB_38909:
	bts r12,1
LB_38910:
	mov r9,r14
	bt r12,1
	jc LB_38907
	btr r12,3
	jmp LB_38908
LB_38907:
	bts r12,3
LB_38908:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38893
	btr r12,1
	jmp LB_38894
LB_38893:
	bts r12,1
LB_38894:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38891
	btr r12,0
	jmp LB_38892
LB_38891:
	bts r12,0
LB_38892:
	add rsp,24
; _f14 %_38859 ⊢ { %_38861 %_38862 } : { %_38861 %_38862 }
 ; {>  %_38859~2':_r64 %_38855~1':_r64 %_38854~0':_stg %_38860~3':(_lst)◂(_p38141) }
; _f14 2' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_38917
	btr r12,0
	jmp LB_38918
LB_38917:
	bts r12,0
LB_38918:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_38919
	btr r12,2
	jmp LB_38920
LB_38919:
	bts r12,2
LB_38920:
	mov r10,r14
	bt r12,1
	jc LB_38921
	btr r12,4
	jmp LB_38922
LB_38921:
	bts r12,4
LB_38922:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_38915
	btr r12,3
	jmp LB_38916
LB_38915:
	bts r12,3
LB_38916:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38913
	btr r12,1
	jmp LB_38914
LB_38913:
	bts r12,1
LB_38914:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38911
	btr r12,0
	jmp LB_38912
LB_38911:
	bts r12,0
LB_38912:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_38863 : %_38863
 ; {>  %_38861~2':_r64 %_38862~4':_stg %_38855~1':_r64 %_38854~0':_stg %_38860~3':(_lst)◂(_p38141) }
; 	» 0xr0 _ ⊢ 5' : %_38863
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_38864 : %_38864
 ; {>  %_38861~2':_r64 %_38863~5':_r64 %_38862~4':_stg %_38855~1':_r64 %_38854~0':_stg %_38860~3':(_lst)◂(_p38141) }
; 	» 0xr0 _ ⊢ 6' : %_38864
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f38766 { %_38854 %_38863 %_38862 %_38864 %_38860 } ⊢ { %_38865 %_38866 } : { %_38865 %_38866 }
 ; {>  %_38861~2':_r64 %_38864~6':_r64 %_38863~5':_r64 %_38862~4':_stg %_38855~1':_r64 %_38854~0':_stg %_38860~3':(_lst)◂(_p38141) }
; _f38766 { 0' 5' 4' 6' 3' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 4' 6' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_38927
	btr r12,1
	jmp LB_38928
LB_38927:
	bts r12,1
LB_38928:
	mov r8,r10
	bt r12,4
	jc LB_38929
	btr r12,2
	jmp LB_38930
LB_38929:
	bts r12,2
LB_38930:
	mov r10,r9
	bt r12,3
	jc LB_38931
	btr r12,4
	jmp LB_38932
LB_38931:
	bts r12,4
LB_38932:
	mov r9,rcx
	bt r12,6
	jc LB_38933
	btr r12,3
	jmp LB_38934
LB_38933:
	bts r12,3
LB_38934:
	call NS_E_38766
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_38935
	btr r12,3
	jmp LB_38936
LB_38935:
	bts r12,3
LB_38936:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_38925
	btr r12,2
	jmp LB_38926
LB_38925:
	bts r12,2
LB_38926:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_38923
	btr r12,1
	jmp LB_38924
LB_38923:
	bts r12,1
LB_38924:
	add rsp,24
; _some %_38866 ⊢ %_38867 : %_38867
 ; {>  %_38861~2':_r64 %_38866~3':_stg %_38855~1':_r64 %_38865~0':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_38865 %_38867 }
 ; {>  %_38861~2':_r64 %_38867~°0◂3':(_opn)◂(_stg) %_38855~1':_r64 %_38865~0':_stg }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_38937
	mov rdi,r8
	call dlt
LB_38937:
	bt r12,1
	jc LB_38938
	mov rdi,r14
	call dlt
LB_38938:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_38941
	btr r12,1
	jmp LB_38942
LB_38941:
	bts r12,1
LB_38942:
	mov rsi,1
	bt r12,1
	jc LB_38939
	mov rsi,0
	bt r14,0
	jc LB_38939
	jmp LB_38940
LB_38939:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_38940:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_38877:
	mov r15,0
LB_38944:
	cmp r15,0
	jz LB_38945
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38944
LB_38945:
; _none {  } ⊢ %_38868 : %_38868
 ; {>  %_38855~1':_r64 %_38854~0':_stg %_38856~2':(_opn)◂({ _r64 (_lst)◂(_p38141) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_38854 %_38868 }
 ; {>  %_38855~1':_r64 %_38854~0':_stg %_38868~°1◂{  }:(_opn)◂(t10403'(0)) %_38856~2':(_opn)◂({ _r64 (_lst)◂(_p38141) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_38946
	mov rdi,r14
	call dlt
LB_38946:
	bt r12,2
	jc LB_38947
	mov rdi,r8
	call dlt
LB_38947:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_38948
	mov rsi,0
	bt r14,0
	jc LB_38948
	jmp LB_38949
LB_38948:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_38949:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_38943:
NS_E_38955:
NS_E_RDI_38955:
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
; _f38869 %_38950 ⊢ { %_38951 %_38952 } : { %_38951 %_38952 }
 ; {>  %_38950~0':_stg }
; _f38869 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38869
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_38951 %_38952 } ⊢ { %_38953 %_38954 } : { %_38953 %_38954 }
 ; {>  %_38951~0':_stg %_38952~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_38956
	btr r12,2
	jmp LB_38957
LB_38956:
	bts r12,2
LB_38957:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_38960
	btr r12,3
	jmp LB_38961
LB_38960:
	bts r12,3
LB_38961:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_38958
	btr QWORD [rdi],0
	jmp LB_38959
LB_38958:
	bts QWORD [rdi],0
LB_38959:
	mov r9,r14
	bt r12,1
	jc LB_38964
	btr r12,3
	jmp LB_38965
LB_38964:
	bts r12,3
LB_38965:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_38962
	btr QWORD [rdi],1
	jmp LB_38963
LB_38962:
	bts QWORD [rdi],1
LB_38963:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_38966
	btr r12,2
	jmp LB_38967
LB_38966:
	bts r12,2
LB_38967:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_38970
	btr r12,3
	jmp LB_38971
LB_38970:
	bts r12,3
LB_38971:
	mov r13,r9
	bt r12,3
	jc LB_38968
	btr r12,0
	jmp LB_38969
LB_38968:
	bts r12,0
LB_38969:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_38974
	btr r12,3
	jmp LB_38975
LB_38974:
	bts r12,3
LB_38975:
	mov r14,r9
	bt r12,3
	jc LB_38972
	btr r12,1
	jmp LB_38973
LB_38972:
	bts r12,1
LB_38973:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_38954~1':(_opn)◂(_stg) %_38953~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_38976
	mov rdi,r14
	call dlt
LB_38976:
	bt r12,0
	jc LB_38977
	mov rdi,r13
	call dlt
LB_38977:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_38979:
NS_E_RDI_38979:
NS_E_38979_ETR_TBL:
NS_E_38979_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_38996
LB_38995:
	add r14,1
LB_38996:
	cmp r14,r10
	jge LB_38997
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38995
	cmp al,10
	jz LB_38995
	cmp al,32
	jz LB_38995
LB_38997:
	push r10
	call NS_E_38000_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38998
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38982
LB_38998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_39001
LB_39000:
	add r14,1
LB_39001:
	cmp r14,r10
	jge LB_39002
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39000
	cmp al,10
	jz LB_39000
	cmp al,32
	jz LB_39000
LB_39002:
	add r14,1
	cmp r14,r10
	jg LB_39006
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_39006
	jmp LB_39007
LB_39006:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39004:
	jmp LB_38982
LB_39007:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_39009
LB_39008:
	add r14,1
LB_39009:
	cmp r14,r10
	jge LB_39010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39008
	cmp al,10
	jz LB_39008
	cmp al,32
	jz LB_39008
LB_39010:
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39011
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39012
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39012:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39013
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39013:
	jmp LB_38982
LB_39011:
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
	jc LB_38991
	btr QWORD [rdi],2
LB_38991:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38992
	btr QWORD [rdi],1
LB_38992:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38993
	btr QWORD [rdi],0
LB_38993:
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
LB_38982:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_38987
LB_38986:
	add r14,1
LB_38987:
	cmp r14,r10
	jge LB_38988
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38986
	cmp al,32
	jz LB_38986
LB_38988:
	push r10
	call NS_E_38000_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38989
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_38983
LB_38989:
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
	jc LB_38984
	btr QWORD [rdi],0
LB_38984:
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
LB_38983:
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
NS_E_39016:
NS_E_RDI_39016:
NS_E_39016_ETR_TBL:
NS_E_39016_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_37432_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39043
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39020
LB_39043:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_39051
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_39051
	jmp LB_39052
LB_39051:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39049
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39049:
	jmp LB_39020
LB_39052:
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
	jc LB_39037
	btr QWORD [rdi],1
LB_39037:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39038
	btr QWORD [rdi],0
LB_39038:
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
LB_39020:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_37503_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39035
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39021
LB_39035:
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
	jc LB_39030
	btr QWORD [rdi],0
LB_39030:
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
LB_39021:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39028
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39022
LB_39028:
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
	jc LB_39023
	btr QWORD [rdi],0
LB_39023:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39022:
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
NS_E_39054:
NS_E_RDI_39054:
NS_E_39054_ETR_TBL:
NS_E_39054_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_39061
LB_39060:
	add r14,1
LB_39061:
	cmp r14,r10
	jge LB_39062
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39060
	cmp al,32
	jz LB_39060
LB_39062:
	add r14,1
	cmp r14,r10
	jg LB_39065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_39065
	jmp LB_39066
LB_39065:
	jmp LB_39056
LB_39066:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39071:
	jmp LB_39068
LB_39067:
	add r14,1
LB_39068:
	cmp r14,r10
	jge LB_39069
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39067
	cmp al,32
	jz LB_39067
LB_39069:
	add r14,1
	cmp r14,r10
	jg LB_39070
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_39070
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39071
LB_39070:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39057
	btr QWORD [rdi],1
LB_39057:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39058
	btr QWORD [rdi],0
LB_39058:
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
LB_39056:
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
NS_E_39073:
NS_E_RDI_39073:
NS_E_39073_ETR_TBL:
NS_E_39073_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ glb_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39249:
	jmp LB_39246
LB_39245:
	add r14,1
LB_39246:
	cmp r14,r10
	jge LB_39247
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39245
	cmp al,10
	jz LB_39245
	cmp al,32
	jz LB_39245
LB_39247:
	push r10
	push rsi
	call NS_E_39075_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39248
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39250
	bts QWORD [rax],0
LB_39250:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39249
LB_39248:
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
	jc LB_39243
	btr QWORD [rdi],0
LB_39243:
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
LB_39242:
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
NS_E_39075:
NS_E_RDI_39075:
NS_E_39075_ETR_TBL:
NS_E_39075_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_39560
LB_39559:
	add r14,1
LB_39560:
	cmp r14,r10
	jge LB_39561
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39559
	cmp al,10
	jz LB_39559
	cmp al,32
	jz LB_39559
LB_39561:
	add r14,7
	cmp r14,r10
	jg LB_39564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_39564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_39564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_39564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_39564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_39564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_39564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_39564
	jmp LB_39565
LB_39564:
	jmp LB_39251
LB_39565:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_39548
LB_39547:
	add r14,1
LB_39548:
	cmp r14,r10
	jge LB_39549
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39547
	cmp al,10
	jz LB_39547
	cmp al,32
	jz LB_39547
LB_39549:
	push r10
	call NS_E_39125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39550
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39551
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39551:
	jmp LB_39252
LB_39550:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39557:
	jmp LB_39554
LB_39553:
	add r14,1
LB_39554:
	cmp r14,r10
	jge LB_39555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39553
	cmp al,10
	jz LB_39553
	cmp al,32
	jz LB_39553
LB_39555:
	push r10
	push rsi
	call NS_E_39125_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39556
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39558
	bts QWORD [rax],0
LB_39558:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39557
LB_39556:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39543
	btr QWORD [rdi],2
LB_39543:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39544
	btr QWORD [rdi],1
LB_39544:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39545
	btr QWORD [rdi],0
LB_39545:
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
LB_39252:
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
LB_39251:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_39537
LB_39536:
	add r14,1
LB_39537:
	cmp r14,r10
	jge LB_39538
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39536
	cmp al,10
	jz LB_39536
	cmp al,32
	jz LB_39536
LB_39538:
	add r14,4
	cmp r14,r10
	jg LB_39541
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_39541
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_39541
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_39541
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_39541
	jmp LB_39542
LB_39541:
	jmp LB_39253
LB_39542:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_39531
LB_39530:
	add r14,1
LB_39531:
	cmp r14,r10
	jge LB_39532
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39530
	cmp al,10
	jz LB_39530
	cmp al,32
	jz LB_39530
LB_39532:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39533
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39534
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39534:
	jmp LB_39254
LB_39533:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_39284
LB_39283:
	add r14,1
LB_39284:
	cmp r14,r10
	jge LB_39285
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39283
	cmp al,10
	jz LB_39283
	cmp al,32
	jz LB_39283
LB_39285:
	add r14,1
	cmp r14,r10
	jg LB_39288
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_39288
	jmp LB_39289
LB_39288:
	jmp LB_39255
LB_39289:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_39278
LB_39277:
	add r14,1
LB_39278:
	cmp r14,r10
	jge LB_39279
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39277
	cmp al,10
	jz LB_39277
	cmp al,32
	jz LB_39277
LB_39279:
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39280
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39281
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39281:
	jmp LB_39256
LB_39280:
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
	jc LB_39271
	btr QWORD [rdi],1
LB_39271:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39272
	btr QWORD [rdi],0
LB_39272:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39274
	btr QWORD [rdi],1
LB_39274:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39275
	btr QWORD [rdi],0
LB_39275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39256:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39268
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39268:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39269
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39269:
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
LB_39255:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_39264
LB_39263:
	add r14,1
LB_39264:
	cmp r14,r10
	jge LB_39265
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39263
	cmp al,10
	jz LB_39263
	cmp al,32
	jz LB_39263
LB_39265:
	push r10
	call NS_E_39077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39266
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39257
LB_39266:
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
	jc LB_39258
	btr QWORD [rdi],0
LB_39258:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39260
	btr QWORD [rdi],1
LB_39260:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39261
	btr QWORD [rdi],0
LB_39261:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39257:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39527
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39527:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39528
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39528:
LB_39254:
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
LB_39253:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_39521
LB_39520:
	add r14,1
LB_39521:
	cmp r14,r10
	jge LB_39522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39520
	cmp al,10
	jz LB_39520
	cmp al,32
	jz LB_39520
LB_39522:
	add r14,2
	cmp r14,r10
	jg LB_39525
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_39525
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_39525
	jmp LB_39526
LB_39525:
	jmp LB_39290
LB_39526:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_39423
LB_39422:
	add r14,1
LB_39423:
	cmp r14,r10
	jge LB_39424
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39422
	cmp al,10
	jz LB_39422
	cmp al,32
	jz LB_39422
LB_39424:
	add r14,1
	cmp r14,r10
	jg LB_39427
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_39427
	jmp LB_39428
LB_39427:
	jmp LB_39292
LB_39428:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_39385
LB_39384:
	add r14,1
LB_39385:
	cmp r14,r10
	jge LB_39386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39384
	cmp al,10
	jz LB_39384
	cmp al,32
	jz LB_39384
LB_39386:
	add r14,1
	cmp r14,r10
	jg LB_39390
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_39390
	jmp LB_39391
LB_39390:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39388
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39388:
	jmp LB_39293
LB_39391:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_39393
LB_39392:
	add r14,1
LB_39393:
	cmp r14,r10
	jge LB_39394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39392
	cmp al,10
	jz LB_39392
	cmp al,32
	jz LB_39392
LB_39394:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39395
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39396
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39396:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39397:
	jmp LB_39293
LB_39395:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_39400
LB_39399:
	add r14,1
LB_39400:
	cmp r14,r10
	jge LB_39401
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39399
	cmp al,10
	jz LB_39399
	cmp al,32
	jz LB_39399
LB_39401:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39402
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39403
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39403:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39404
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39404:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39405:
	jmp LB_39293
LB_39402:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_39408
LB_39407:
	add r14,1
LB_39408:
	cmp r14,r10
	jge LB_39409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39407
	cmp al,10
	jz LB_39407
	cmp al,32
	jz LB_39407
LB_39409:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39410
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_39411
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_39411:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39412
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39412:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39413
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39413:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39414
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39414:
	jmp LB_39293
LB_39410:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39420:
	jmp LB_39417
LB_39416:
	add r14,1
LB_39417:
	cmp r14,r10
	jge LB_39418
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39416
	cmp al,10
	jz LB_39416
	cmp al,32
	jz LB_39416
LB_39418:
	push r10
	push rsi
	call NS_E_39079_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39419
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39421
	bts QWORD [rax],0
LB_39421:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39420
LB_39419:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_39375
	btr QWORD [rdi],5
LB_39375:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_39376
	btr QWORD [rdi],4
LB_39376:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_39377
	btr QWORD [rdi],3
LB_39377:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39378
	btr QWORD [rdi],2
LB_39378:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39379
	btr QWORD [rdi],1
LB_39379:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39380
	btr QWORD [rdi],0
LB_39380:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,104
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39382
	btr QWORD [rdi],0
LB_39382:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39293:
	add rsp,96
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39373
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39373:
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
LB_39292:
	add rsp,96
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_39369
LB_39368:
	add r14,1
LB_39369:
	cmp r14,r10
	jge LB_39370
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39368
	cmp al,10
	jz LB_39368
	cmp al,32
	jz LB_39368
LB_39370:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39371
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39294
LB_39371:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_39360
LB_39359:
	add r14,1
LB_39360:
	cmp r14,r10
	jge LB_39361
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39359
	cmp al,10
	jz LB_39359
	cmp al,32
	jz LB_39359
LB_39361:
	add r14,1
	cmp r14,r10
	jg LB_39364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_39364
	jmp LB_39365
LB_39364:
	jmp LB_39295
LB_39365:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_39354
LB_39353:
	add r14,1
LB_39354:
	cmp r14,r10
	jge LB_39355
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39353
	cmp al,10
	jz LB_39353
	cmp al,32
	jz LB_39353
LB_39355:
	push r10
	call NS_E_39016_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39356
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39357
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39357:
	jmp LB_39296
LB_39356:
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
	jc LB_39346
	btr QWORD [rdi],1
LB_39346:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39347
	btr QWORD [rdi],0
LB_39347:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39351
	btr QWORD [rdi],0
LB_39351:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39349
	btr QWORD [rdi],0
LB_39349:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39296:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39344
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39344:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39342
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39342:
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
LB_39295:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_39336
LB_39335:
	add r14,1
LB_39336:
	cmp r14,r10
	jge LB_39337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39335
	cmp al,10
	jz LB_39335
	cmp al,32
	jz LB_39335
LB_39337:
	add r14,2
	cmp r14,r10
	jg LB_39340
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_39340
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_39340
	jmp LB_39341
LB_39340:
	jmp LB_39297
LB_39341:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_39330
LB_39329:
	add r14,1
LB_39330:
	cmp r14,r10
	jge LB_39331
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39329
	cmp al,10
	jz LB_39329
	cmp al,32
	jz LB_39329
LB_39331:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39332
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39333:
	jmp LB_39298
LB_39332:
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
	jc LB_39322
	btr QWORD [rdi],1
LB_39322:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39323
	btr QWORD [rdi],0
LB_39323:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39327
	btr QWORD [rdi],0
LB_39327:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39325
	btr QWORD [rdi],0
LB_39325:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39298:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39320
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39320:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39318:
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
LB_39297:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg_ptn
	jmp LB_39308
LB_39307:
	add r14,1
LB_39308:
	cmp r14,r10
	jge LB_39309
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39307
	cmp al,10
	jz LB_39307
	cmp al,32
	jz LB_39307
LB_39309:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39310
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39299
LB_39310:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_39313
LB_39312:
	add r14,1
LB_39313:
	cmp r14,r10
	jge LB_39314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39312
	cmp al,10
	jz LB_39312
	cmp al,32
	jz LB_39312
LB_39314:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39315
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39316
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39316:
	jmp LB_39299
LB_39315:
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
	jc LB_39300
	btr QWORD [rdi],1
LB_39300:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39301
	btr QWORD [rdi],0
LB_39301:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39305
	btr QWORD [rdi],0
LB_39305:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39303
	btr QWORD [rdi],0
LB_39303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39299:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39366
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39366:
LB_39294:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39518
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39518:
LB_39291:
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
LB_39290:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_39512
LB_39511:
	add r14,1
LB_39512:
	cmp r14,r10
	jge LB_39513
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39511
	cmp al,10
	jz LB_39511
	cmp al,32
	jz LB_39511
LB_39513:
	add r14,2
	cmp r14,r10
	jg LB_39516
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_39516
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_39516
	jmp LB_39517
LB_39516:
	jmp LB_39429
LB_39517:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_39503
LB_39502:
	add r14,1
LB_39503:
	cmp r14,r10
	jge LB_39504
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39502
	cmp al,10
	jz LB_39502
	cmp al,32
	jz LB_39502
LB_39504:
	add r14,1
	cmp r14,r10
	jg LB_39507
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_39507
	jmp LB_39508
LB_39507:
	jmp LB_39430
LB_39508:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_39482
LB_39481:
	add r14,1
LB_39482:
	cmp r14,r10
	jge LB_39483
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39481
	cmp al,10
	jz LB_39481
	cmp al,32
	jz LB_39481
LB_39483:
	add r14,1
	cmp r14,r10
	jg LB_39487
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_39487
	jmp LB_39488
LB_39487:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39485
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39485:
	jmp LB_39431
LB_39488:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_39490
LB_39489:
	add r14,1
LB_39490:
	cmp r14,r10
	jge LB_39491
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39489
	cmp al,10
	jz LB_39489
	cmp al,32
	jz LB_39489
LB_39491:
	push r10
	call NS_E_39111_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39492
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39493
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39493:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39494
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39494:
	jmp LB_39431
LB_39492:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ qlq_dt_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39500:
	jmp LB_39497
LB_39496:
	add r14,1
LB_39497:
	cmp r14,r10
	jge LB_39498
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39496
	cmp al,10
	jz LB_39496
	cmp al,32
	jz LB_39496
LB_39498:
	push r10
	push rsi
	call NS_E_39113_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39499
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39501
	bts QWORD [rax],0
LB_39501:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39500
LB_39499:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_39474
	btr QWORD [rdi],3
LB_39474:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39475
	btr QWORD [rdi],2
LB_39475:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39476
	btr QWORD [rdi],1
LB_39476:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39477
	btr QWORD [rdi],0
LB_39477:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39479
	btr QWORD [rdi],0
LB_39479:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39431:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39472:
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
LB_39430:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_39460
LB_39459:
	add r14,1
LB_39460:
	cmp r14,r10
	jge LB_39461
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39459
	cmp al,10
	jz LB_39459
	cmp al,32
	jz LB_39459
LB_39461:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39462
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39432
LB_39462:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_39465
LB_39464:
	add r14,1
LB_39465:
	cmp r14,r10
	jge LB_39466
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39464
	cmp al,10
	jz LB_39464
	cmp al,32
	jz LB_39464
LB_39466:
	add r14,1
	cmp r14,r10
	jg LB_39470
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_39470
	jmp LB_39471
LB_39470:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39468
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39468:
	jmp LB_39432
LB_39471:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_39453
LB_39452:
	add r14,1
LB_39453:
	cmp r14,r10
	jge LB_39454
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39452
	cmp al,10
	jz LB_39452
	cmp al,32
	jz LB_39452
LB_39454:
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39455
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39456
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39456:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39457
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39457:
	jmp LB_39433
LB_39455:
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
	jc LB_39446
	btr QWORD [rdi],2
LB_39446:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39447
	btr QWORD [rdi],1
LB_39447:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39448
	btr QWORD [rdi],0
LB_39448:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39450
	btr QWORD [rdi],0
LB_39450:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39433:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39444
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39444:
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
LB_39432:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_39440
LB_39439:
	add r14,1
LB_39440:
	cmp r14,r10
	jge LB_39441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39439
	cmp al,10
	jz LB_39439
	cmp al,32
	jz LB_39439
LB_39441:
	push r10
	call NS_E_39111_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39442
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39434
LB_39442:
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
	jc LB_39435
	btr QWORD [rdi],0
LB_39435:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39437
	btr QWORD [rdi],0
LB_39437:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39434:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39509
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39509:
LB_39429:
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
NS_E_39077:
NS_E_RDI_39077:
NS_E_39077_ETR_TBL:
NS_E_39077_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_39585
LB_39584:
	add r14,1
LB_39585:
	cmp r14,r10
	jge LB_39586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39584
	cmp al,10
	jz LB_39584
	cmp al,32
	jz LB_39584
LB_39586:
	add r14,6
	cmp r14,r10
	jg LB_39589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_39589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_39589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_39589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_39589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_39589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_39589
	jmp LB_39590
LB_39589:
	jmp LB_39566
LB_39590:
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
	jc LB_39582
	btr QWORD [rdi],0
LB_39582:
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
LB_39566:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_39572
LB_39571:
	add r14,1
LB_39572:
	cmp r14,r10
	jge LB_39573
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39571
	cmp al,10
	jz LB_39571
	cmp al,32
	jz LB_39571
LB_39573:
	push r10
	call NS_E_39075_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39574
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39567
LB_39574:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_39577
LB_39576:
	add r14,1
LB_39577:
	cmp r14,r10
	jge LB_39578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39576
	cmp al,10
	jz LB_39576
	cmp al,32
	jz LB_39576
LB_39578:
	push r10
	call NS_E_39077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39579
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39580
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39580:
	jmp LB_39567
LB_39579:
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
	jc LB_39568
	btr QWORD [rdi],1
LB_39568:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39569
	btr QWORD [rdi],0
LB_39569:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39567:
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
NS_E_39079:
NS_E_RDI_39079:
NS_E_39079_ETR_TBL:
NS_E_39079_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_39599
LB_39598:
	add r14,1
LB_39599:
	cmp r14,r10
	jge LB_39600
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39598
	cmp al,10
	jz LB_39598
	cmp al,32
	jz LB_39598
LB_39600:
	add r14,1
	cmp r14,r10
	jg LB_39603
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_39603
	jmp LB_39604
LB_39603:
	jmp LB_39591
LB_39604:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_39606
LB_39605:
	add r14,1
LB_39606:
	cmp r14,r10
	jge LB_39607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39605
	cmp al,10
	jz LB_39605
	cmp al,32
	jz LB_39605
LB_39607:
	add r14,1
	cmp r14,r10
	jg LB_39611
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_39611
	jmp LB_39612
LB_39611:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39609
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39609:
	jmp LB_39591
LB_39612:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_39614
LB_39613:
	add r14,1
LB_39614:
	cmp r14,r10
	jge LB_39615
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39613
	cmp al,10
	jz LB_39613
	cmp al,32
	jz LB_39613
LB_39615:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39616
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39617
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39617:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39618
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39618:
	jmp LB_39591
LB_39616:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_39621
LB_39620:
	add r14,1
LB_39621:
	cmp r14,r10
	jge LB_39622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39620
	cmp al,10
	jz LB_39620
	cmp al,32
	jz LB_39620
LB_39622:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39623
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39624
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39624:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39625
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39625:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39626
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39626:
	jmp LB_39591
LB_39623:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_39629
LB_39628:
	add r14,1
LB_39629:
	cmp r14,r10
	jge LB_39630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39628
	cmp al,10
	jz LB_39628
	cmp al,32
	jz LB_39628
LB_39630:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39631
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_39632
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_39632:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39633
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39633:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39634
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39634:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39635
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39635:
	jmp LB_39591
LB_39631:
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
	jc LB_39592
	btr QWORD [rdi],4
LB_39592:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_39593
	btr QWORD [rdi],3
LB_39593:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39594
	btr QWORD [rdi],2
LB_39594:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39595
	btr QWORD [rdi],1
LB_39595:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39596
	btr QWORD [rdi],0
LB_39596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39591:
	add rsp,80
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
NS_E_39081:
NS_E_RDI_39081:
NS_E_39081_ETR_TBL:
NS_E_39081_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_39643
LB_39642:
	add r14,1
LB_39643:
	cmp r14,r10
	jge LB_39644
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39642
	cmp al,10
	jz LB_39642
	cmp al,32
	jz LB_39642
LB_39644:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39645
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39637
LB_39645:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_39648
LB_39647:
	add r14,1
LB_39648:
	cmp r14,r10
	jge LB_39649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39647
	cmp al,10
	jz LB_39647
	cmp al,32
	jz LB_39647
LB_39649:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39650
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39651
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39651:
	jmp LB_39637
LB_39650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_39654
LB_39653:
	add r14,1
LB_39654:
	cmp r14,r10
	jge LB_39655
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39653
	cmp al,10
	jz LB_39653
	cmp al,32
	jz LB_39653
LB_39655:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39656
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39657
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39657:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39658
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39658:
	jmp LB_39637
LB_39656:
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
	jc LB_39638
	btr QWORD [rdi],2
LB_39638:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39639
	btr QWORD [rdi],1
LB_39639:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39640
	btr QWORD [rdi],0
LB_39640:
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
LB_39637:
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
NS_E_39083:
NS_E_RDI_39083:
NS_E_39083_ETR_TBL:
NS_E_39083_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_39688
LB_39687:
	add r14,1
LB_39688:
	cmp r14,r10
	jge LB_39689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39687
	cmp al,10
	jz LB_39687
	cmp al,32
	jz LB_39687
LB_39689:
	add r14,3
	cmp r14,r10
	jg LB_39692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_39692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_39692
	jmp LB_39693
LB_39692:
	jmp LB_39660
LB_39693:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_39695
LB_39694:
	add r14,1
LB_39695:
	cmp r14,r10
	jge LB_39696
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39694
	cmp al,10
	jz LB_39694
	cmp al,32
	jz LB_39694
LB_39696:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39697
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39698:
	jmp LB_39660
LB_39697:
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
	jc LB_39684
	btr QWORD [rdi],1
LB_39684:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39685
	btr QWORD [rdi],0
LB_39685:
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
LB_39660:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_39680
LB_39679:
	add r14,1
LB_39680:
	cmp r14,r10
	jge LB_39681
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39679
	cmp al,10
	jz LB_39679
	cmp al,32
	jz LB_39679
LB_39681:
	push r10
	call NS_E_39095_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39682
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39661
LB_39682:
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
	jc LB_39677
	btr QWORD [rdi],0
LB_39677:
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
LB_39661:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_39667
LB_39666:
	add r14,1
LB_39667:
	cmp r14,r10
	jge LB_39668
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39666
	cmp al,10
	jz LB_39666
	cmp al,32
	jz LB_39666
LB_39668:
	push r10
	call NS_E_39085_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39669
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39662
LB_39669:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_39672
LB_39671:
	add r14,1
LB_39672:
	cmp r14,r10
	jge LB_39673
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39671
	cmp al,10
	jz LB_39671
	cmp al,32
	jz LB_39671
LB_39673:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39674
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39675
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39675:
	jmp LB_39662
LB_39674:
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
	jc LB_39663
	btr QWORD [rdi],1
LB_39663:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39664
	btr QWORD [rdi],0
LB_39664:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39662:
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
NS_E_39085:
NS_E_RDI_39085:
NS_E_39085_ETR_TBL:
NS_E_39085_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "$"
	jmp LB_39985
LB_39984:
	add r14,1
LB_39985:
	cmp r14,r10
	jge LB_39986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39984
	cmp al,10
	jz LB_39984
	cmp al,32
	jz LB_39984
LB_39986:
	add r14,1
	cmp r14,r10
	jg LB_39989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_39989
	jmp LB_39990
LB_39989:
	jmp LB_39700
LB_39990:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_39962
LB_39961:
	add r14,1
LB_39962:
	cmp r14,r10
	jge LB_39963
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39961
	cmp al,10
	jz LB_39961
	cmp al,32
	jz LB_39961
LB_39963:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39964
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39965
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39965:
	jmp LB_39701
LB_39964:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_39968
LB_39967:
	add r14,1
LB_39968:
	cmp r14,r10
	jge LB_39969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39967
	cmp al,10
	jz LB_39967
	cmp al,32
	jz LB_39967
LB_39969:
	add r14,3
	cmp r14,r10
	jg LB_39974
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39974
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_39974
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_39974
	jmp LB_39975
LB_39974:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39971
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39971:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39972:
	jmp LB_39701
LB_39975:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_39977
LB_39976:
	add r14,1
LB_39977:
	cmp r14,r10
	jge LB_39978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39976
	cmp al,10
	jz LB_39976
	cmp al,32
	jz LB_39976
LB_39978:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39979
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39980
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39980:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39981
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39981:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39982
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39982:
	jmp LB_39701
LB_39979:
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
	jc LB_39956
	btr QWORD [rdi],3
LB_39956:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39957
	btr QWORD [rdi],2
LB_39957:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39958
	btr QWORD [rdi],1
LB_39958:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39959
	btr QWORD [rdi],0
LB_39959:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39701:
	add rsp,64
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
LB_39700:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\151\130"
	jmp LB_39950
LB_39949:
	add r14,1
LB_39950:
	cmp r14,r10
	jge LB_39951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39949
	cmp al,10
	jz LB_39949
	cmp al,32
	jz LB_39949
LB_39951:
	add r14,3
	cmp r14,r10
	jg LB_39954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_39954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_39954
	jmp LB_39955
LB_39954:
	jmp LB_39702
LB_39955:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_39927
LB_39926:
	add r14,1
LB_39927:
	cmp r14,r10
	jge LB_39928
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39926
	cmp al,10
	jz LB_39926
	cmp al,32
	jz LB_39926
LB_39928:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39929
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39930
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39930:
	jmp LB_39703
LB_39929:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_39933
LB_39932:
	add r14,1
LB_39933:
	cmp r14,r10
	jge LB_39934
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39932
	cmp al,10
	jz LB_39932
	cmp al,32
	jz LB_39932
LB_39934:
	add r14,3
	cmp r14,r10
	jg LB_39939
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39939
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_39939
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_39939
	jmp LB_39940
LB_39939:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39936
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39936:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39937
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39937:
	jmp LB_39703
LB_39940:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_39942
LB_39941:
	add r14,1
LB_39942:
	cmp r14,r10
	jge LB_39943
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39941
	cmp al,10
	jz LB_39941
	cmp al,32
	jz LB_39941
LB_39943:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39944
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39945
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39945:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39946
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39947:
	jmp LB_39703
LB_39944:
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
	jc LB_39921
	btr QWORD [rdi],3
LB_39921:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39922
	btr QWORD [rdi],2
LB_39922:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39923
	btr QWORD [rdi],1
LB_39923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39924
	btr QWORD [rdi],0
LB_39924:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39703:
	add rsp,64
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
LB_39702:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\187"
	jmp LB_39915
LB_39914:
	add r14,1
LB_39915:
	cmp r14,r10
	jge LB_39916
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39914
	cmp al,10
	jz LB_39914
	cmp al,32
	jz LB_39914
LB_39916:
	add r14,2
	cmp r14,r10
	jg LB_39919
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_39919
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_39919
	jmp LB_39920
LB_39919:
	jmp LB_39704
LB_39920:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_^"
	jmp LB_39872
LB_39871:
	add r14,1
LB_39872:
	cmp r14,r10
	jge LB_39873
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39871
	cmp al,10
	jz LB_39871
	cmp al,32
	jz LB_39871
LB_39873:
	add r14,2
	cmp r14,r10
	jg LB_39876
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_39876
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_39876
	jmp LB_39877
LB_39876:
	jmp LB_39706
LB_39877:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "_"
	jmp LB_39823
LB_39822:
	add r14,1
LB_39823:
	cmp r14,r10
	jge LB_39824
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39822
	cmp al,10
	jz LB_39822
	cmp al,32
	jz LB_39822
LB_39824:
	add r14,1
	cmp r14,r10
	jg LB_39827
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_39827
	jmp LB_39828
LB_39827:
	jmp LB_39708
LB_39828:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_39791
LB_39790:
	add r14,1
LB_39791:
	cmp r14,r10
	jge LB_39792
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39790
	cmp al,10
	jz LB_39790
	cmp al,32
	jz LB_39790
LB_39792:
	add r14,3
	cmp r14,r10
	jg LB_39796
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39796
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_39796
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_39796
	jmp LB_39797
LB_39796:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39794
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39794:
	jmp LB_39709
LB_39797:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg
	jmp LB_39799
LB_39798:
	add r14,1
LB_39799:
	cmp r14,r10
	jge LB_39800
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39798
	cmp al,10
	jz LB_39798
	cmp al,32
	jz LB_39798
LB_39800:
	push r10
	call NS_E_39109_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39801
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39802
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39802:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39803
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39803:
	jmp LB_39709
LB_39801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39809:
	jmp LB_39806
LB_39805:
	add r14,1
LB_39806:
	cmp r14,r10
	jge LB_39807
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39805
	cmp al,10
	jz LB_39805
	cmp al,32
	jz LB_39805
LB_39807:
	push r10
	push rsi
	call NS_E_39087_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39808
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39810
	bts QWORD [rax],0
LB_39810:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39809
LB_39808:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
; "//"
	jmp LB_39812
LB_39811:
	add r14,1
LB_39812:
	cmp r14,r10
	jge LB_39813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39811
	cmp al,10
	jz LB_39811
	cmp al,32
	jz LB_39811
LB_39813:
	add r14,2
	cmp r14,r10
	jg LB_39820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_39820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_39820
	jmp LB_39821
LB_39820:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_39815
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_39815:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39816
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39816:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39817
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39817:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39818
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39818:
	jmp LB_39709
LB_39821:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_39780
	btr QWORD [rdi],4
LB_39780:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_39781
	btr QWORD [rdi],3
LB_39781:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39782
	btr QWORD [rdi],2
LB_39782:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39783
	btr QWORD [rdi],1
LB_39783:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39784
	btr QWORD [rdi],0
LB_39784:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39788
	btr QWORD [rdi],0
LB_39788:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39786
	btr QWORD [rdi],0
LB_39786:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39709:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39778
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39778:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39776
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39776:
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
LB_39708:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; reg
	jmp LB_39724
LB_39723:
	add r14,1
LB_39724:
	cmp r14,r10
	jge LB_39725
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39723
	cmp al,10
	jz LB_39723
	cmp al,32
	jz LB_39723
LB_39725:
	push r10
	call NS_E_39109_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39726
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39710
LB_39726:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39732:
	jmp LB_39729
LB_39728:
	add r14,1
LB_39729:
	cmp r14,r10
	jge LB_39730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39728
	cmp al,10
	jz LB_39728
	cmp al,32
	jz LB_39728
LB_39730:
	push r10
	push rsi
	call NS_E_39093_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39731
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39733
	bts QWORD [rax],0
LB_39733:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39732
LB_39731:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "\226\138\162"
	jmp LB_39735
LB_39734:
	add r14,1
LB_39735:
	cmp r14,r10
	jge LB_39736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39734
	cmp al,10
	jz LB_39734
	cmp al,32
	jz LB_39734
LB_39736:
	add r14,3
	cmp r14,r10
	jg LB_39741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_39741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_39741
	jmp LB_39742
LB_39741:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39738
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39738:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39739
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39739:
	jmp LB_39710
LB_39742:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg
	jmp LB_39744
LB_39743:
	add r14,1
LB_39744:
	cmp r14,r10
	jge LB_39745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39743
	cmp al,10
	jz LB_39743
	cmp al,32
	jz LB_39743
LB_39745:
	push r10
	call NS_E_39109_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39746
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39747
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39747:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39748
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39748:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39749
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39749:
	jmp LB_39710
LB_39746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39755:
	jmp LB_39752
LB_39751:
	add r14,1
LB_39752:
	cmp r14,r10
	jge LB_39753
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39751
	cmp al,10
	jz LB_39751
	cmp al,32
	jz LB_39751
LB_39753:
	push r10
	push rsi
	call NS_E_39093_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39754
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39756
	bts QWORD [rax],0
LB_39756:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39755
LB_39754:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rsi
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_39761:
	jmp LB_39758
LB_39757:
	add r14,1
LB_39758:
	cmp r14,r10
	jge LB_39759
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39757
	cmp al,10
	jz LB_39757
	cmp al,32
	jz LB_39757
LB_39759:
	push r10
	push rsi
	call NS_E_39087_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_39760
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_39762
	bts QWORD [rax],0
LB_39762:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_39761
LB_39760:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
; "//"
	jmp LB_39764
LB_39763:
	add r14,1
LB_39764:
	cmp r14,r10
	jge LB_39765
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39763
	cmp al,10
	jz LB_39763
	cmp al,32
	jz LB_39763
LB_39765:
	add r14,2
	cmp r14,r10
	jg LB_39774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_39774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_39774
	jmp LB_39775
LB_39774:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_39767
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_39767:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_39768
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_39768:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_39769
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_39769:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39770
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39770:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39771
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39771:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39772
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39772:
	jmp LB_39710
LB_39775:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*6],0
	mov QWORD [rsp+8*1+16*6],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0007_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_39711
	btr QWORD [rdi],6
LB_39711:
	mov rax,QWORD [rsp+16*6+8*1]
	mov [rdi+8*1+8*6],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_39712
	btr QWORD [rdi],5
LB_39712:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_39713
	btr QWORD [rdi],4
LB_39713:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_39714
	btr QWORD [rdi],3
LB_39714:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39715
	btr QWORD [rdi],2
LB_39715:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39716
	btr QWORD [rdi],1
LB_39716:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39717
	btr QWORD [rdi],0
LB_39717:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,120
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39721
	btr QWORD [rdi],0
LB_39721:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39719
	btr QWORD [rdi],0
LB_39719:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39710:
	add rsp,112
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39869
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39869:
LB_39707:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39867
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39867:
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
LB_39706:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_39838
LB_39837:
	add r14,1
LB_39838:
	cmp r14,r10
	jge LB_39839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39837
	cmp al,10
	jz LB_39837
	cmp al,32
	jz LB_39837
LB_39839:
	push r10
	call NS_E_39016_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39840
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39829
LB_39840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_39843
LB_39842:
	add r14,1
LB_39843:
	cmp r14,r10
	jge LB_39844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39842
	cmp al,10
	jz LB_39842
	cmp al,32
	jz LB_39842
LB_39844:
	add r14,1
	cmp r14,r10
	jg LB_39848
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_39848
	jmp LB_39849
LB_39848:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39846
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39846:
	jmp LB_39829
LB_39849:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_39851
LB_39850:
	add r14,1
LB_39851:
	cmp r14,r10
	jge LB_39852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39850
	cmp al,10
	jz LB_39850
	cmp al,32
	jz LB_39850
LB_39852:
	add r14,3
	cmp r14,r10
	jg LB_39857
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39857
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_39857
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_39857
	jmp LB_39858
LB_39857:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39854
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39854:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39855
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39855:
	jmp LB_39829
LB_39858:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_39860
LB_39859:
	add r14,1
LB_39860:
	cmp r14,r10
	jge LB_39861
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39859
	cmp al,10
	jz LB_39859
	cmp al,32
	jz LB_39859
LB_39861:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39862
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39863
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39863:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39864
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39864:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39865
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39865:
	jmp LB_39829
LB_39862:
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
	jc LB_39830
	btr QWORD [rdi],3
LB_39830:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39831
	btr QWORD [rdi],2
LB_39831:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39832
	btr QWORD [rdi],1
LB_39832:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39833
	btr QWORD [rdi],0
LB_39833:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39835
	btr QWORD [rdi],0
LB_39835:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39829:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39912
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39912:
LB_39705:
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
LB_39704:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_39885
LB_39884:
	add r14,1
LB_39885:
	cmp r14,r10
	jge LB_39886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39884
	cmp al,10
	jz LB_39884
	cmp al,32
	jz LB_39884
LB_39886:
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39887
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39878
LB_39887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_39890
LB_39889:
	add r14,1
LB_39890:
	cmp r14,r10
	jge LB_39891
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39889
	cmp al,10
	jz LB_39889
	cmp al,32
	jz LB_39889
LB_39891:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39892
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39893
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39893:
	jmp LB_39878
LB_39892:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_39896
LB_39895:
	add r14,1
LB_39896:
	cmp r14,r10
	jge LB_39897
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39895
	cmp al,10
	jz LB_39895
	cmp al,32
	jz LB_39895
LB_39897:
	add r14,3
	cmp r14,r10
	jg LB_39902
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_39902
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_39902
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_39902
	jmp LB_39903
LB_39902:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39899
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39899:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39900
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39900:
	jmp LB_39878
LB_39903:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_39905
LB_39904:
	add r14,1
LB_39905:
	cmp r14,r10
	jge LB_39906
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39904
	cmp al,10
	jz LB_39904
	cmp al,32
	jz LB_39904
LB_39906:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_39907
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_39908
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_39908:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_39909
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_39909:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_39910
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_39910:
	jmp LB_39878
LB_39907:
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
	jc LB_39879
	btr QWORD [rdi],3
LB_39879:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_39880
	btr QWORD [rdi],2
LB_39880:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_39881
	btr QWORD [rdi],1
LB_39881:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39882
	btr QWORD [rdi],0
LB_39882:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39878:
	add rsp,64
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
NS_E_39087:
NS_E_RDI_39087:
NS_E_39087_ETR_TBL:
NS_E_39087_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_40028
LB_40027:
	add r14,1
LB_40028:
	cmp r14,r10
	jge LB_40029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40027
	cmp al,10
	jz LB_40027
	cmp al,32
	jz LB_40027
LB_40029:
	push r10
	call NS_E_39089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40030
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39991
LB_40030:
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
	jc LB_40025
	btr QWORD [rdi],0
LB_40025:
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
LB_39991:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_40021
LB_40020:
	add r14,1
LB_40021:
	cmp r14,r10
	jge LB_40022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40020
	cmp al,10
	jz LB_40020
	cmp al,32
	jz LB_40020
LB_40022:
	push r10
	call NS_E_37503_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40023
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39992
LB_40023:
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
	jc LB_40018
	btr QWORD [rdi],0
LB_40018:
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
LB_39992:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_40014
LB_40013:
	add r14,1
LB_40014:
	cmp r14,r10
	jge LB_40015
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40013
	cmp al,10
	jz LB_40013
	cmp al,32
	jz LB_40013
LB_40015:
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40016
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39993
LB_40016:
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
	jc LB_40011
	btr QWORD [rdi],0
LB_40011:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39993:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	jmp LB_39999
LB_39998:
	add r14,1
LB_39999:
	cmp r14,r10
	jge LB_40000
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_39998
	cmp al,10
	jz LB_39998
	cmp al,32
	jz LB_39998
LB_40000:
	push r10
	call NS_E_37432_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40001
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_39994
LB_40001:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_40004
LB_40003:
	add r14,1
LB_40004:
	cmp r14,r10
	jge LB_40005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40003
	cmp al,10
	jz LB_40003
	cmp al,32
	jz LB_40003
LB_40005:
	add r14,1
	cmp r14,r10
	jg LB_40009
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_40009
	jmp LB_40010
LB_40009:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40007
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40007:
	jmp LB_39994
LB_40010:
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
	jc LB_39995
	btr QWORD [rdi],1
LB_39995:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_39996
	btr QWORD [rdi],0
LB_39996:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_39994:
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
NS_E_39089:
NS_E_RDI_39089:
NS_E_39089_ETR_TBL:
NS_E_39089_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_40041
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_40041
	jmp LB_40042
LB_40041:
	jmp LB_40032
LB_40042:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_39091_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40046
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40047:
	jmp LB_40032
LB_40046:
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
	jc LB_40033
	btr QWORD [rdi],1
LB_40033:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40034
	btr QWORD [rdi],0
LB_40034:
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
LB_40032:
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
NS_E_39091:
NS_E_RDI_39091:
NS_E_39091_ETR_TBL:
NS_E_39091_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_40072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_40072
	jmp LB_40073
LB_40072:
	jmp LB_40049
LB_40073:
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
	jc LB_40065
	btr QWORD [rdi],0
LB_40065:
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
LB_40049:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_37430_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40057
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40050
LB_40057:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_39091_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40062
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40063
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40063:
	jmp LB_40050
LB_40062:
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
	jc LB_40051
	btr QWORD [rdi],1
LB_40051:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40052
	btr QWORD [rdi],0
LB_40052:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40050:
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
NS_E_39093:
NS_E_RDI_39093:
NS_E_39093_ETR_TBL:
NS_E_39093_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	add r14,1
	cmp r14,r10
	jg LB_40083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_40083
	jmp LB_40084
LB_40083:
	jmp LB_40074
LB_40084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg
	push r10
	call NS_E_39109_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40088
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40089
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40089:
	jmp LB_40074
LB_40088:
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
	jc LB_40075
	btr QWORD [rdi],1
LB_40075:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40076
	btr QWORD [rdi],0
LB_40076:
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
LB_40074:
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
NS_E_39095:
NS_E_RDI_39095:
NS_E_39095_ETR_TBL:
NS_E_39095_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_40164
LB_40163:
	add r14,1
LB_40164:
	cmp r14,r10
	jge LB_40165
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40163
	cmp al,10
	jz LB_40163
	cmp al,32
	jz LB_40163
LB_40165:
	add r14,4
	cmp r14,r10
	jg LB_40168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_40168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_40168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_40168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_40168
	jmp LB_40169
LB_40168:
	jmp LB_40091
LB_40169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_40143
LB_40142:
	add r14,1
LB_40143:
	cmp r14,r10
	jge LB_40144
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40142
	cmp al,10
	jz LB_40142
	cmp al,32
	jz LB_40142
LB_40144:
	push r10
	call NS_E_39099_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40145
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40146
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40146:
	jmp LB_40092
LB_40145:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_40149
LB_40148:
	add r14,1
LB_40149:
	cmp r14,r10
	jge LB_40150
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40148
	cmp al,10
	jz LB_40148
	cmp al,32
	jz LB_40148
LB_40150:
	push r10
	call NS_E_39097_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40151
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40152
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40152:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40153
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40153:
	jmp LB_40092
LB_40151:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_40156
LB_40155:
	add r14,1
LB_40156:
	cmp r14,r10
	jge LB_40157
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40155
	cmp al,10
	jz LB_40155
	cmp al,32
	jz LB_40155
LB_40157:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40158
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40159
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40159:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40160
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40160:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40161
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40161:
	jmp LB_40092
LB_40158:
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
	jc LB_40137
	btr QWORD [rdi],3
LB_40137:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40138
	btr QWORD [rdi],2
LB_40138:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40139
	btr QWORD [rdi],1
LB_40139:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40140
	btr QWORD [rdi],0
LB_40140:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40092:
	add rsp,64
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
LB_40091:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_40101
LB_40100:
	add r14,1
LB_40101:
	cmp r14,r10
	jge LB_40102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40100
	cmp al,10
	jz LB_40100
	cmp al,32
	jz LB_40100
LB_40102:
	add r14,3
	cmp r14,r10
	jg LB_40105
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40105
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_40105
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_40105
	jmp LB_40106
LB_40105:
	jmp LB_40093
LB_40106:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_40108
LB_40107:
	add r14,1
LB_40108:
	cmp r14,r10
	jge LB_40109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40107
	cmp al,10
	jz LB_40107
	cmp al,32
	jz LB_40107
LB_40109:
	push r10
	call NS_E_39099_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40110
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40111
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40111:
	jmp LB_40093
LB_40110:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_40114
LB_40113:
	add r14,1
LB_40114:
	cmp r14,r10
	jge LB_40115
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40113
	cmp al,10
	jz LB_40113
	cmp al,32
	jz LB_40113
LB_40115:
	push r10
	call NS_E_39097_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40116
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40117
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40117:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40118
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40118:
	jmp LB_40093
LB_40116:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_40121
LB_40120:
	add r14,1
LB_40121:
	cmp r14,r10
	jge LB_40122
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40120
	cmp al,10
	jz LB_40120
	cmp al,32
	jz LB_40120
LB_40122:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40123
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40124
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40124:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40125
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40125:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40126
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40126:
	jmp LB_40093
LB_40123:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_mtc
	jmp LB_40129
LB_40128:
	add r14,1
LB_40129:
	cmp r14,r10
	jge LB_40130
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40128
	cmp al,10
	jz LB_40128
	cmp al,32
	jz LB_40128
LB_40130:
	push r10
	call NS_E_39095_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40131
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_40132
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_40132:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40133
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40133:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40134
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40134:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40135
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40135:
	jmp LB_40093
LB_40131:
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
	jc LB_40094
	btr QWORD [rdi],4
LB_40094:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_40095
	btr QWORD [rdi],3
LB_40095:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40096
	btr QWORD [rdi],2
LB_40096:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40097
	btr QWORD [rdi],1
LB_40097:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40098
	btr QWORD [rdi],0
LB_40098:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40093:
	add rsp,80
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
NS_E_39097:
NS_E_RDI_39097:
NS_E_39097_ETR_TBL:
NS_E_39097_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_40175
LB_40174:
	add r14,1
LB_40175:
	cmp r14,r10
	jge LB_40176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40174
	cmp al,32
	jz LB_40174
LB_40176:
	add r14,1
	cmp r14,r10
	jg LB_40179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_40179
	jmp LB_40180
LB_40179:
	jmp LB_40170
LB_40180:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_40182
LB_40181:
	add r14,1
LB_40182:
	cmp r14,r10
	jge LB_40183
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40181
	cmp al,32
	jz LB_40181
LB_40183:
	add r14,1
	cmp r14,r10
	jg LB_40187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_40187
	jmp LB_40188
LB_40187:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40185
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40185:
	jmp LB_40170
LB_40188:
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
	jc LB_40171
	btr QWORD [rdi],1
LB_40171:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40172
	btr QWORD [rdi],0
LB_40172:
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
LB_40170:
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
NS_E_39099:
NS_E_RDI_39099:
NS_E_39099_ETR_TBL:
NS_E_39099_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_40196
LB_40195:
	add r14,1
LB_40196:
	cmp r14,r10
	jge LB_40197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40195
	cmp al,10
	jz LB_40195
	cmp al,32
	jz LB_40195
LB_40197:
	push r10
	call NS_E_39101_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40198
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40189
LB_40198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ mtc_test_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_40204:
	jmp LB_40201
LB_40200:
	add r14,1
LB_40201:
	cmp r14,r10
	jge LB_40202
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40200
	cmp al,10
	jz LB_40200
	cmp al,32
	jz LB_40200
LB_40202:
	push r10
	push rsi
	call NS_E_39103_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_40203
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_40205
	bts QWORD [rax],0
LB_40205:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_40204
LB_40203:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40192
	btr QWORD [rdi],1
LB_40192:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40193
	btr QWORD [rdi],0
LB_40193:
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
LB_40189:
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
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40190:
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
NS_E_39101:
NS_E_RDI_39101:
NS_E_39101_ETR_TBL:
NS_E_39101_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; reg_ptn
	jmp LB_40266
LB_40265:
	add r14,1
LB_40266:
	cmp r14,r10
	jge LB_40267
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40265
	cmp al,10
	jz LB_40265
	cmp al,32
	jz LB_40265
LB_40267:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40268
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40206
LB_40268:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_40271
LB_40270:
	add r14,1
LB_40271:
	cmp r14,r10
	jge LB_40272
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40270
	cmp al,10
	jz LB_40270
	cmp al,32
	jz LB_40270
LB_40272:
	add r14,3
	cmp r14,r10
	jg LB_40276
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40276
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_40276
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_40276
	jmp LB_40277
LB_40276:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40274
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40274:
	jmp LB_40206
LB_40277:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_40240
LB_40239:
	add r14,1
LB_40240:
	cmp r14,r10
	jge LB_40241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40239
	cmp al,10
	jz LB_40239
	cmp al,32
	jz LB_40239
LB_40241:
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40242
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40243
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40243:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40244
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40244:
	jmp LB_40207
LB_40242:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_40247
LB_40246:
	add r14,1
LB_40247:
	cmp r14,r10
	jge LB_40248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40246
	cmp al,10
	jz LB_40246
	cmp al,32
	jz LB_40246
LB_40248:
	add r14,3
	cmp r14,r10
	jg LB_40254
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40254
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_40254
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_40254
	jmp LB_40255
LB_40254:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40250
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40250:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40251
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40251:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40252
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40252:
	jmp LB_40207
LB_40255:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; reg_ptn
	jmp LB_40257
LB_40256:
	add r14,1
LB_40257:
	cmp r14,r10
	jge LB_40258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40256
	cmp al,10
	jz LB_40256
	cmp al,32
	jz LB_40256
LB_40258:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40259
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_40260
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_40260:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40261
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40261:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40262
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40262:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40263
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40263:
	jmp LB_40207
LB_40259:
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
	jc LB_40233
	btr QWORD [rdi],4
LB_40233:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_40234
	btr QWORD [rdi],3
LB_40234:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40235
	btr QWORD [rdi],2
LB_40235:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40236
	btr QWORD [rdi],1
LB_40236:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40237
	btr QWORD [rdi],0
LB_40237:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40207:
	add rsp,80
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
LB_40206:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_40214
LB_40213:
	add r14,1
LB_40214:
	cmp r14,r10
	jge LB_40215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40213
	cmp al,10
	jz LB_40213
	cmp al,32
	jz LB_40213
LB_40215:
	push r10
	call NS_E_39105_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40216
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40208
LB_40216:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_40219
LB_40218:
	add r14,1
LB_40219:
	cmp r14,r10
	jge LB_40220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40218
	cmp al,10
	jz LB_40218
	cmp al,32
	jz LB_40218
LB_40220:
	add r14,1
	cmp r14,r10
	jg LB_40224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_40224
	jmp LB_40225
LB_40224:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40222
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40222:
	jmp LB_40208
LB_40225:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_40227
LB_40226:
	add r14,1
LB_40227:
	cmp r14,r10
	jge LB_40228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40226
	cmp al,10
	jz LB_40226
	cmp al,32
	jz LB_40226
LB_40228:
	push r10
	call NS_E_39105_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40229
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40230
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40230:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40231
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40231:
	jmp LB_40208
LB_40229:
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
	jc LB_40209
	btr QWORD [rdi],2
LB_40209:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40210
	btr QWORD [rdi],1
LB_40210:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40211
	btr QWORD [rdi],0
LB_40211:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40208:
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
NS_E_39103:
NS_E_RDI_39103:
NS_E_39103_ETR_TBL:
NS_E_39103_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_40283
LB_40282:
	add r14,1
LB_40283:
	cmp r14,r10
	jge LB_40284
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40282
	cmp al,10
	jz LB_40282
	cmp al,32
	jz LB_40282
LB_40284:
	add r14,1
	cmp r14,r10
	jg LB_40287
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_40287
	jmp LB_40288
LB_40287:
	jmp LB_40278
LB_40288:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_40290
LB_40289:
	add r14,1
LB_40290:
	cmp r14,r10
	jge LB_40291
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40289
	cmp al,10
	jz LB_40289
	cmp al,32
	jz LB_40289
LB_40291:
	push r10
	call NS_E_39101_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40292
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40293:
	jmp LB_40278
LB_40292:
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
	jc LB_40279
	btr QWORD [rdi],1
LB_40279:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40280
	btr QWORD [rdi],0
LB_40280:
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
LB_40278:
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
NS_E_39105:
NS_E_RDI_39105:
NS_E_39105_ETR_TBL:
NS_E_39105_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_40308
LB_40307:
	add r14,1
LB_40308:
	cmp r14,r10
	jge LB_40309
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40307
	cmp al,10
	jz LB_40307
	cmp al,32
	jz LB_40307
LB_40309:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40310
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40295
LB_40310:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_40313
LB_40312:
	add r14,1
LB_40313:
	cmp r14,r10
	jge LB_40314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40312
	cmp al,10
	jz LB_40312
	cmp al,32
	jz LB_40312
LB_40314:
	add r14,1
	cmp r14,r10
	jg LB_40318
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_40318
	jmp LB_40319
LB_40318:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40316
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40316:
	jmp LB_40295
LB_40319:
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
	jc LB_40304
	btr QWORD [rdi],1
LB_40304:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40305
	btr QWORD [rdi],0
LB_40305:
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
LB_40295:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	jmp LB_40300
LB_40299:
	add r14,1
LB_40300:
	cmp r14,r10
	jge LB_40301
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40299
	cmp al,10
	jz LB_40299
	cmp al,32
	jz LB_40299
LB_40301:
	push r10
	call NS_E_39016_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40302
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40296
LB_40302:
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
	jc LB_40297
	btr QWORD [rdi],0
LB_40297:
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
LB_40296:
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
NS_E_39107:
NS_E_RDI_39107:
NS_E_39107_ETR_TBL:
NS_E_39107_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_40334
LB_40333:
	add r14,1
LB_40334:
	cmp r14,r10
	jge LB_40335
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40333
	cmp al,10
	jz LB_40333
	cmp al,32
	jz LB_40333
LB_40335:
	add r14,1
	cmp r14,r10
	jg LB_40338
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_40338
	jmp LB_40339
LB_40338:
	jmp LB_40320
LB_40339:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ reg_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_40344:
	jmp LB_40341
LB_40340:
	add r14,1
LB_40341:
	cmp r14,r10
	jge LB_40342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40340
	cmp al,10
	jz LB_40340
	cmp al,32
	jz LB_40340
LB_40342:
	push r10
	push rsi
	call NS_E_39107_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_40343
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_40345
	bts QWORD [rax],0
LB_40345:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_40344
LB_40343:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_40347
LB_40346:
	add r14,1
LB_40347:
	cmp r14,r10
	jge LB_40348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40346
	cmp al,10
	jz LB_40346
	cmp al,32
	jz LB_40346
LB_40348:
	add r14,1
	cmp r14,r10
	jg LB_40353
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_40353
	jmp LB_40354
LB_40353:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40350
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40350:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40351
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40351:
	jmp LB_40320
LB_40354:
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
	jc LB_40329
	btr QWORD [rdi],2
LB_40329:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40330
	btr QWORD [rdi],1
LB_40330:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40331
	btr QWORD [rdi],0
LB_40331:
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
LB_40320:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_40325
LB_40324:
	add r14,1
LB_40325:
	cmp r14,r10
	jge LB_40326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40324
	cmp al,10
	jz LB_40324
	cmp al,32
	jz LB_40324
LB_40326:
	push r10
	call NS_E_39109_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40327
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40321
LB_40327:
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
	jc LB_40322
	btr QWORD [rdi],0
LB_40322:
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
LB_40321:
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
NS_E_39109:
NS_E_RDI_39109:
NS_E_39109_ETR_TBL:
NS_E_39109_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_40382
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_40382
	jmp LB_40383
LB_40382:
	jmp LB_40355
LB_40383:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40387
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40388
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40388:
	jmp LB_40355
LB_40387:
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
	jc LB_40374
	btr QWORD [rdi],1
LB_40374:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40375
	btr QWORD [rdi],0
LB_40375:
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
LB_40355:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40372
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40356
LB_40372:
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
	jc LB_40367
	btr QWORD [rdi],0
LB_40367:
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
LB_40356:
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
	jg LB_40365
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_40365
	jmp LB_40366
LB_40365:
	jmp LB_40357
LB_40366:
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
	jc LB_40358
	btr QWORD [rdi],0
LB_40358:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40357:
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
NS_E_39111:
NS_E_RDI_39111:
NS_E_39111_ETR_TBL:
NS_E_39111_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_40396
LB_40395:
	add r14,1
LB_40396:
	cmp r14,r10
	jge LB_40397
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40395
	cmp al,10
	jz LB_40395
	cmp al,32
	jz LB_40395
LB_40397:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40398
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40390
LB_40398:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_etr_coprd
	jmp LB_40401
LB_40400:
	add r14,1
LB_40401:
	cmp r14,r10
	jge LB_40402
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40400
	cmp al,10
	jz LB_40400
	cmp al,32
	jz LB_40400
LB_40402:
	push r10
	call NS_E_39115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40403
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40404
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40404:
	jmp LB_40390
LB_40403:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ dt_etr_coprd ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_40410:
	jmp LB_40407
LB_40406:
	add r14,1
LB_40407:
	cmp r14,r10
	jge LB_40408
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40406
	cmp al,10
	jz LB_40406
	cmp al,32
	jz LB_40406
LB_40408:
	push r10
	push rsi
	call NS_E_39115_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_40409
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_40411
	bts QWORD [rax],0
LB_40411:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_40410
LB_40409:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40391
	btr QWORD [rdi],2
LB_40391:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40392
	btr QWORD [rdi],1
LB_40392:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40393
	btr QWORD [rdi],0
LB_40393:
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
LB_40390:
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
NS_E_39113:
NS_E_RDI_39113:
NS_E_39113_ETR_TBL:
NS_E_39113_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_40419
LB_40418:
	add r14,1
LB_40419:
	cmp r14,r10
	jge LB_40420
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40418
	cmp al,10
	jz LB_40418
	cmp al,32
	jz LB_40418
LB_40420:
	add r14,1
	cmp r14,r10
	jg LB_40423
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_40423
	jmp LB_40424
LB_40423:
	jmp LB_40412
LB_40424:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_40426
LB_40425:
	add r14,1
LB_40426:
	cmp r14,r10
	jge LB_40427
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40425
	cmp al,10
	jz LB_40425
	cmp al,32
	jz LB_40425
LB_40427:
	add r14,1
	cmp r14,r10
	jg LB_40431
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_40431
	jmp LB_40432
LB_40431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40429
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40429:
	jmp LB_40412
LB_40432:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_40434
LB_40433:
	add r14,1
LB_40434:
	cmp r14,r10
	jge LB_40435
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40433
	cmp al,10
	jz LB_40433
	cmp al,32
	jz LB_40433
LB_40435:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40436
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40437
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40437:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40438:
	jmp LB_40412
LB_40436:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dt_etr_coprd
	jmp LB_40441
LB_40440:
	add r14,1
LB_40441:
	cmp r14,r10
	jge LB_40442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40440
	cmp al,10
	jz LB_40440
	cmp al,32
	jz LB_40440
LB_40442:
	push r10
	call NS_E_39115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40443
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40444
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40444:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40445
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40445:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40446
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40446:
	jmp LB_40412
LB_40443:
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
	jc LB_40413
	btr QWORD [rdi],3
LB_40413:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40414
	btr QWORD [rdi],2
LB_40414:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40415
	btr QWORD [rdi],1
LB_40415:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40416
	btr QWORD [rdi],0
LB_40416:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40412:
	add rsp,64
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
NS_E_39115:
NS_E_RDI_39115:
NS_E_39115_ETR_TBL:
NS_E_39115_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_40455
LB_40454:
	add r14,1
LB_40455:
	cmp r14,r10
	jge LB_40456
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40454
	cmp al,10
	jz LB_40454
	cmp al,32
	jz LB_40454
LB_40456:
	add r14,3
	cmp r14,r10
	jg LB_40459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_40459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_40459
	jmp LB_40460
LB_40459:
	jmp LB_40448
LB_40460:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_40462
LB_40461:
	add r14,1
LB_40462:
	cmp r14,r10
	jge LB_40463
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40461
	cmp al,10
	jz LB_40461
	cmp al,32
	jz LB_40461
LB_40463:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40464
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40465
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40465:
	jmp LB_40448
LB_40464:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_40468
LB_40467:
	add r14,1
LB_40468:
	cmp r14,r10
	jge LB_40469
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40467
	cmp al,10
	jz LB_40467
	cmp al,32
	jz LB_40467
LB_40469:
	add r14,1
	cmp r14,r10
	jg LB_40474
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_40474
	jmp LB_40475
LB_40474:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40471
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40471:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40472:
	jmp LB_40448
LB_40475:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_40477
LB_40476:
	add r14,1
LB_40477:
	cmp r14,r10
	jge LB_40478
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40476
	cmp al,10
	jz LB_40476
	cmp al,32
	jz LB_40476
LB_40478:
	push r10
	call NS_E_39117_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40479
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40480
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40480:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40481
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40481:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40482
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40482:
	jmp LB_40448
LB_40479:
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
	jc LB_40449
	btr QWORD [rdi],3
LB_40449:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40450
	btr QWORD [rdi],2
LB_40450:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40451
	btr QWORD [rdi],1
LB_40451:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40452
	btr QWORD [rdi],0
LB_40452:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40448:
	add rsp,64
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
NS_E_39117:
NS_E_RDI_39117:
NS_E_39117_ETR_TBL:
NS_E_39117_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_40511
LB_40510:
	add r14,1
LB_40511:
	cmp r14,r10
	jge LB_40512
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40510
	cmp al,10
	jz LB_40510
	cmp al,32
	jz LB_40510
LB_40512:
	push r10
	call NS_E_39119_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40513
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40484
LB_40513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_40496
LB_40495:
	add r14,1
LB_40496:
	cmp r14,r10
	jge LB_40497
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40495
	cmp al,10
	jz LB_40495
	cmp al,32
	jz LB_40495
LB_40497:
	add r14,3
	cmp r14,r10
	jg LB_40500
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40500
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_40500
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_40500
	jmp LB_40501
LB_40500:
	jmp LB_40485
LB_40501:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_40503
LB_40502:
	add r14,1
LB_40503:
	cmp r14,r10
	jge LB_40504
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40502
	cmp al,10
	jz LB_40502
	cmp al,32
	jz LB_40502
LB_40504:
	push r10
	call NS_E_39117_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40505
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40506
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40506:
	jmp LB_40485
LB_40505:
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
	jc LB_40490
	btr QWORD [rdi],1
LB_40490:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40491
	btr QWORD [rdi],0
LB_40491:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40493
	btr QWORD [rdi],0
LB_40493:
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
LB_40485:
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
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40488
	btr QWORD [rdi],0
LB_40488:
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
LB_40486:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40508
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40508:
LB_40484:
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
NS_E_39119:
NS_E_RDI_39119:
NS_E_39119_ETR_TBL:
NS_E_39119_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_40542
LB_40541:
	add r14,1
LB_40542:
	cmp r14,r10
	jge LB_40543
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40541
	cmp al,10
	jz LB_40541
	cmp al,32
	jz LB_40541
LB_40543:
	push r10
	call NS_E_39121_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40544
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40515
LB_40544:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_40527
LB_40526:
	add r14,1
LB_40527:
	cmp r14,r10
	jge LB_40528
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40526
	cmp al,10
	jz LB_40526
	cmp al,32
	jz LB_40526
LB_40528:
	add r14,3
	cmp r14,r10
	jg LB_40531
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40531
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_40531
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_40531
	jmp LB_40532
LB_40531:
	jmp LB_40516
LB_40532:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_40534
LB_40533:
	add r14,1
LB_40534:
	cmp r14,r10
	jge LB_40535
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40533
	cmp al,10
	jz LB_40533
	cmp al,32
	jz LB_40533
LB_40535:
	push r10
	call NS_E_39121_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40536
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40537
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40537:
	jmp LB_40516
LB_40536:
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
	jc LB_40521
	btr QWORD [rdi],1
LB_40521:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40522
	btr QWORD [rdi],0
LB_40522:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40524
	btr QWORD [rdi],0
LB_40524:
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
LB_40516:
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
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40519
	btr QWORD [rdi],0
LB_40519:
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
LB_40517:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40539:
LB_40515:
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
NS_E_39121:
NS_E_RDI_39121:
NS_E_39121_ETR_TBL:
NS_E_39121_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_40558
LB_40557:
	add r14,1
LB_40558:
	cmp r14,r10
	jge LB_40559
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40557
	cmp al,10
	jz LB_40557
	cmp al,32
	jz LB_40557
LB_40559:
	push r10
	call NS_E_39123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40560
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40546
LB_40560:
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
	jc LB_40555
	btr QWORD [rdi],0
LB_40555:
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
LB_40546:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_40551
LB_40550:
	add r14,1
LB_40551:
	cmp r14,r10
	jge LB_40552
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40550
	cmp al,10
	jz LB_40550
	cmp al,32
	jz LB_40550
LB_40552:
	push r10
	call NS_E_38000_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40553
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40547
LB_40553:
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
	jc LB_40548
	btr QWORD [rdi],0
LB_40548:
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
LB_40547:
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
NS_E_39123:
NS_E_RDI_39123:
NS_E_39123_ETR_TBL:
NS_E_39123_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40569
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40562
LB_40569:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_40577
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_40577
	jmp LB_40578
LB_40577:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40575:
	jmp LB_40562
LB_40578:
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
	jc LB_40563
	btr QWORD [rdi],1
LB_40563:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40564
	btr QWORD [rdi],0
LB_40564:
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
LB_40562:
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
NS_E_39125:
NS_E_RDI_39125:
NS_E_39125_ETR_TBL:
NS_E_39125_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "@"
	jmp LB_40609
LB_40608:
	add r14,1
LB_40609:
	cmp r14,r10
	jge LB_40610
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40608
	cmp al,10
	jz LB_40608
	cmp al,32
	jz LB_40608
LB_40610:
	add r14,1
	cmp r14,r10
	jg LB_40613
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_40613
	jmp LB_40614
LB_40613:
	jmp LB_40579
LB_40614:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_40616
LB_40615:
	add r14,1
LB_40616:
	cmp r14,r10
	jge LB_40617
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40615
	cmp al,10
	jz LB_40615
	cmp al,32
	jz LB_40615
LB_40617:
	add r14,1
	cmp r14,r10
	jg LB_40621
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_40621
	jmp LB_40622
LB_40621:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40619
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40619:
	jmp LB_40579
LB_40622:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_40624
LB_40623:
	add r14,1
LB_40624:
	cmp r14,r10
	jge LB_40625
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40623
	cmp al,10
	jz LB_40623
	cmp al,32
	jz LB_40623
LB_40625:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40626
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40627
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40627:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40628
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40628:
	jmp LB_40579
LB_40626:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_40600
LB_40599:
	add r14,1
LB_40600:
	cmp r14,r10
	jge LB_40601
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40599
	cmp al,10
	jz LB_40599
	cmp al,32
	jz LB_40599
LB_40601:
	push r10
	call NS_E_39127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40602
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40580
LB_40602:
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
	jc LB_40593
	btr QWORD [rdi],0
LB_40593:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40595
	btr QWORD [rdi],2
LB_40595:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40596
	btr QWORD [rdi],1
LB_40596:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40597
	btr QWORD [rdi],0
LB_40597:
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
LB_40580:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_40589
LB_40588:
	add r14,1
LB_40589:
	cmp r14,r10
	jge LB_40590
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40588
	cmp al,10
	jz LB_40588
	cmp al,32
	jz LB_40588
LB_40590:
	push r10
	call NS_E_39135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40591
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40581
LB_40591:
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
	jc LB_40582
	btr QWORD [rdi],0
LB_40582:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40584
	btr QWORD [rdi],2
LB_40584:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40585
	btr QWORD [rdi],1
LB_40585:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40586
	btr QWORD [rdi],0
LB_40586:
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
LB_40581:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40604
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40604:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40605
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40605:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40606
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40606:
LB_40579:
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
NS_E_39127:
NS_E_RDI_39127:
NS_E_39127_ETR_TBL:
NS_E_39127_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord_end
	jmp LB_40819
LB_40818:
	add r14,1
LB_40819:
	cmp r14,r10
	jge LB_40820
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40818
	cmp al,10
	jz LB_40818
	cmp al,32
	jz LB_40818
LB_40820:
	push r10
	call NS_E_39133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40821
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40630
LB_40821:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_40827:
	jmp LB_40824
LB_40823:
	add r14,1
LB_40824:
	cmp r14,r10
	jge LB_40825
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40823
	cmp al,10
	jz LB_40823
	cmp al,32
	jz LB_40823
LB_40825:
	push r10
	push rsi
	call NS_E_39129_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_40826
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_40828
	bts QWORD [rax],0
LB_40828:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_40827
LB_40826:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; ";"
	jmp LB_40692
LB_40691:
	add r14,1
LB_40692:
	cmp r14,r10
	jge LB_40693
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40691
	cmp al,10
	jz LB_40691
	cmp al,32
	jz LB_40691
LB_40693:
	add r14,1
	cmp r14,r10
	jg LB_40696
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_40696
	jmp LB_40697
LB_40696:
	jmp LB_40631
LB_40697:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_40699
LB_40698:
	add r14,1
LB_40699:
	cmp r14,r10
	jge LB_40700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40698
	cmp al,10
	jz LB_40698
	cmp al,32
	jz LB_40698
LB_40700:
	add r14,3
	cmp r14,r10
	jg LB_40704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_40704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_40704
	jmp LB_40705
LB_40704:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40702
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40702:
	jmp LB_40631
LB_40705:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_40677
LB_40676:
	add r14,1
LB_40677:
	cmp r14,r10
	jge LB_40678
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40676
	cmp al,10
	jz LB_40676
	cmp al,32
	jz LB_40676
LB_40678:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40679
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40680
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40680:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40681
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40681:
	jmp LB_40632
LB_40679:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_40684
LB_40683:
	add r14,1
LB_40684:
	cmp r14,r10
	jge LB_40685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40683
	cmp al,10
	jz LB_40683
	cmp al,32
	jz LB_40683
LB_40685:
	push r10
	call NS_E_39127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40686
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40687
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40687:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40688
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40688:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40689
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40689:
	jmp LB_40632
LB_40686:
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
	jc LB_40668
	btr QWORD [rdi],3
LB_40668:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40669
	btr QWORD [rdi],2
LB_40669:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40670
	btr QWORD [rdi],1
LB_40670:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40671
	btr QWORD [rdi],0
LB_40671:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40673
	btr QWORD [rdi],1
LB_40673:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40674
	btr QWORD [rdi],0
LB_40674:
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
LB_40632:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40665
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40665:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40666
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40666:
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
LB_40631:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_40659
LB_40658:
	add r14,1
LB_40659:
	cmp r14,r10
	jge LB_40660
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40658
	cmp al,10
	jz LB_40658
	cmp al,32
	jz LB_40658
LB_40660:
	add r14,3
	cmp r14,r10
	jg LB_40663
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40663
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_40663
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_40663
	jmp LB_40664
LB_40663:
	jmp LB_40633
LB_40664:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_40646
LB_40645:
	add r14,1
LB_40646:
	cmp r14,r10
	jge LB_40647
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40645
	cmp al,10
	jz LB_40645
	cmp al,32
	jz LB_40645
LB_40647:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40648
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40649
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40649:
	jmp LB_40634
LB_40648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_40652
LB_40651:
	add r14,1
LB_40652:
	cmp r14,r10
	jge LB_40653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40651
	cmp al,10
	jz LB_40651
	cmp al,32
	jz LB_40651
LB_40653:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40654
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40655
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40655:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40656
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40656:
	jmp LB_40634
LB_40654:
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
	jc LB_40638
	btr QWORD [rdi],2
LB_40638:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40639
	btr QWORD [rdi],1
LB_40639:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40640
	btr QWORD [rdi],0
LB_40640:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40642
	btr QWORD [rdi],1
LB_40642:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40643
	btr QWORD [rdi],0
LB_40643:
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
LB_40634:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40635
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40635:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40636
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40636:
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
LB_40633:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40815
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40815:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40816:
LB_40630:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord
	jmp LB_40805
LB_40804:
	add r14,1
LB_40805:
	cmp r14,r10
	jge LB_40806
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40804
	cmp al,10
	jz LB_40804
	cmp al,32
	jz LB_40804
LB_40806:
	push r10
	call NS_E_39131_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40807
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40706
LB_40807:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_40813:
	jmp LB_40810
LB_40809:
	add r14,1
LB_40810:
	cmp r14,r10
	jge LB_40811
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40809
	cmp al,10
	jz LB_40809
	cmp al,32
	jz LB_40809
LB_40811:
	push r10
	push rsi
	call NS_E_39129_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_40812
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_40814
	bts QWORD [rax],0
LB_40814:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_40813
LB_40812:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_40787
LB_40786:
	add r14,1
LB_40787:
	cmp r14,r10
	jge LB_40788
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40786
	cmp al,10
	jz LB_40786
	cmp al,32
	jz LB_40786
LB_40788:
	add r14,1
	cmp r14,r10
	jg LB_40791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_40791
	jmp LB_40792
LB_40791:
	jmp LB_40707
LB_40792:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_40794
LB_40793:
	add r14,1
LB_40794:
	cmp r14,r10
	jge LB_40795
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40793
	cmp al,10
	jz LB_40793
	cmp al,32
	jz LB_40793
LB_40795:
	add r14,3
	cmp r14,r10
	jg LB_40799
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40799
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_40799
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_40799
	jmp LB_40800
LB_40799:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40797
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40797:
	jmp LB_40707
LB_40800:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_40763
LB_40762:
	add r14,1
LB_40763:
	cmp r14,r10
	jge LB_40764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40762
	cmp al,10
	jz LB_40762
	cmp al,32
	jz LB_40762
LB_40764:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40765
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40766
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40766:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40767
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40767:
	jmp LB_40708
LB_40765:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_40770
LB_40769:
	add r14,1
LB_40770:
	cmp r14,r10
	jge LB_40771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40769
	cmp al,10
	jz LB_40769
	cmp al,32
	jz LB_40769
LB_40771:
	push r10
	call NS_E_39127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40772
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40773
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40773:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40774
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40774:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40775
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40775:
	jmp LB_40708
LB_40772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_40778
LB_40777:
	add r14,1
LB_40778:
	cmp r14,r10
	jge LB_40779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40777
	cmp al,10
	jz LB_40777
	cmp al,32
	jz LB_40777
LB_40779:
	push r10
	call NS_E_39127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40780
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_40781
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_40781:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40782
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40782:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40783
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40783:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40784
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40784:
	jmp LB_40708
LB_40780:
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
	jc LB_40753
	btr QWORD [rdi],4
LB_40753:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_40754
	btr QWORD [rdi],3
LB_40754:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40755
	btr QWORD [rdi],2
LB_40755:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40756
	btr QWORD [rdi],1
LB_40756:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40757
	btr QWORD [rdi],0
LB_40757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40759
	btr QWORD [rdi],1
LB_40759:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40760
	btr QWORD [rdi],0
LB_40760:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40708:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40750
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40750:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40751
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40751:
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
LB_40707:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\138\162"
	jmp LB_40744
LB_40743:
	add r14,1
LB_40744:
	cmp r14,r10
	jge LB_40745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40743
	cmp al,10
	jz LB_40743
	cmp al,32
	jz LB_40743
LB_40745:
	add r14,3
	cmp r14,r10
	jg LB_40748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_40748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_40748
	jmp LB_40749
LB_40748:
	jmp LB_40709
LB_40749:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_40723
LB_40722:
	add r14,1
LB_40723:
	cmp r14,r10
	jge LB_40724
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40722
	cmp al,10
	jz LB_40722
	cmp al,32
	jz LB_40722
LB_40724:
	push r10
	call NS_E_39107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40725
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40726
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40726:
	jmp LB_40710
LB_40725:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_40729
LB_40728:
	add r14,1
LB_40729:
	cmp r14,r10
	jge LB_40730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40728
	cmp al,10
	jz LB_40728
	cmp al,32
	jz LB_40728
LB_40730:
	push r10
	call NS_E_39083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40731
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40732
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40732:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40733
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40733:
	jmp LB_40710
LB_40731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_40736
LB_40735:
	add r14,1
LB_40736:
	cmp r14,r10
	jge LB_40737
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40735
	cmp al,10
	jz LB_40735
	cmp al,32
	jz LB_40735
LB_40737:
	push r10
	call NS_E_39127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40738
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_40739
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_40739:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40740
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40740:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40741
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40741:
	jmp LB_40710
LB_40738:
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
	jc LB_40714
	btr QWORD [rdi],3
LB_40714:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40715
	btr QWORD [rdi],2
LB_40715:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40716
	btr QWORD [rdi],1
LB_40716:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40717
	btr QWORD [rdi],0
LB_40717:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40719
	btr QWORD [rdi],1
LB_40719:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40720
	btr QWORD [rdi],0
LB_40720:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40710:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40711
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40711:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40712
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40712:
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
LB_40709:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40801
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40801:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40802
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40802:
LB_40706:
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
NS_E_39129:
NS_E_RDI_39129:
NS_E_39129_ETR_TBL:
NS_E_39129_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_40851
LB_40850:
	add r14,1
LB_40851:
	cmp r14,r10
	jge LB_40852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40850
	cmp al,10
	jz LB_40850
	cmp al,32
	jz LB_40850
LB_40852:
	add r14,3
	cmp r14,r10
	jg LB_40855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_40855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_40855
	jmp LB_40856
LB_40855:
	jmp LB_40829
LB_40856:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn
	jmp LB_40858
LB_40857:
	add r14,1
LB_40858:
	cmp r14,r10
	jge LB_40859
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40857
	cmp al,10
	jz LB_40857
	cmp al,32
	jz LB_40857
LB_40859:
	push r10
	call NS_E_39129_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40860
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40861
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40861:
	jmp LB_40829
LB_40860:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_40864
LB_40863:
	add r14,1
LB_40864:
	cmp r14,r10
	jge LB_40865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40863
	cmp al,10
	jz LB_40863
	cmp al,32
	jz LB_40863
LB_40865:
	add r14,3
	cmp r14,r10
	jg LB_40870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_40870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_40870
	jmp LB_40871
LB_40870:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40867
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40867:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40868
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40868:
	jmp LB_40829
LB_40871:
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
	jc LB_40846
	btr QWORD [rdi],2
LB_40846:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40847
	btr QWORD [rdi],1
LB_40847:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40848
	btr QWORD [rdi],0
LB_40848:
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
LB_40829:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_40842
LB_40841:
	add r14,1
LB_40842:
	cmp r14,r10
	jge LB_40843
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40841
	cmp al,10
	jz LB_40841
	cmp al,32
	jz LB_40841
LB_40843:
	push r10
	call NS_E_37503_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40844
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40830
LB_40844:
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
	jc LB_40839
	btr QWORD [rdi],0
LB_40839:
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
LB_40830:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_40835
LB_40834:
	add r14,1
LB_40835:
	cmp r14,r10
	jge LB_40836
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40834
	cmp al,10
	jz LB_40834
	cmp al,32
	jz LB_40834
LB_40836:
	push r10
	call NS_E_38979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40837
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40831
LB_40837:
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
	jc LB_40832
	btr QWORD [rdi],0
LB_40832:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40831:
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
NS_E_39131:
NS_E_RDI_39131:
NS_E_39131_ETR_TBL:
NS_E_39131_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_40896
LB_40895:
	add r14,1
LB_40896:
	cmp r14,r10
	jge LB_40897
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40895
	cmp al,10
	jz LB_40895
	cmp al,32
	jz LB_40895
LB_40897:
	add r14,4
	cmp r14,r10
	jg LB_40900
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_40900
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_40900
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_40900
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_40900
	jmp LB_40901
LB_40900:
	jmp LB_40872
LB_40901:
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
	jc LB_40893
	btr QWORD [rdi],0
LB_40893:
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
LB_40872:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_40887
LB_40886:
	add r14,1
LB_40887:
	cmp r14,r10
	jge LB_40888
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40886
	cmp al,10
	jz LB_40886
	cmp al,32
	jz LB_40886
LB_40888:
	add r14,4
	cmp r14,r10
	jg LB_40891
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_40891
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_40891
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_40891
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_40891
	jmp LB_40892
LB_40891:
	jmp LB_40873
LB_40892:
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
	jc LB_40884
	btr QWORD [rdi],0
LB_40884:
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
LB_40873:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_40878
LB_40877:
	add r14,1
LB_40878:
	cmp r14,r10
	jge LB_40879
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40877
	cmp al,10
	jz LB_40877
	cmp al,32
	jz LB_40877
LB_40879:
	add r14,3
	cmp r14,r10
	jg LB_40882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_40882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_40882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_40882
	jmp LB_40883
LB_40882:
	jmp LB_40874
LB_40883:
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
	jc LB_40875
	btr QWORD [rdi],0
LB_40875:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40874:
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
NS_E_39133:
NS_E_RDI_39133:
NS_E_39133_ETR_TBL:
NS_E_39133_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_40926
LB_40925:
	add r14,1
LB_40926:
	cmp r14,r10
	jge LB_40927
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40925
	cmp al,10
	jz LB_40925
	cmp al,32
	jz LB_40925
LB_40927:
	add r14,5
	cmp r14,r10
	jg LB_40930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_40930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_40930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_40930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_40930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_40930
	jmp LB_40931
LB_40930:
	jmp LB_40902
LB_40931:
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
	jc LB_40923
	btr QWORD [rdi],0
LB_40923:
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
LB_40902:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_40917
LB_40916:
	add r14,1
LB_40917:
	cmp r14,r10
	jge LB_40918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40916
	cmp al,10
	jz LB_40916
	cmp al,32
	jz LB_40916
LB_40918:
	add r14,5
	cmp r14,r10
	jg LB_40921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_40921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_40921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_40921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_40921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_40921
	jmp LB_40922
LB_40921:
	jmp LB_40903
LB_40922:
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
	jc LB_40914
	btr QWORD [rdi],0
LB_40914:
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
LB_40903:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_40908
LB_40907:
	add r14,1
LB_40908:
	cmp r14,r10
	jge LB_40909
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40907
	cmp al,10
	jz LB_40907
	cmp al,32
	jz LB_40907
LB_40909:
	add r14,4
	cmp r14,r10
	jg LB_40912
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_40912
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_40912
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_40912
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_40912
	jmp LB_40913
LB_40912:
	jmp LB_40904
LB_40913:
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
	jc LB_40905
	btr QWORD [rdi],0
LB_40905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40904:
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
NS_E_39135:
NS_E_RDI_39135:
NS_E_39135_ETR_TBL:
NS_E_39135_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_41028
LB_41027:
	add r14,1
LB_41028:
	cmp r14,r10
	jge LB_41029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41027
	cmp al,10
	jz LB_41027
	cmp al,32
	jz LB_41027
LB_41029:
	push r10
	call NS_E_39133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41030
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40932
LB_41030:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_41033
LB_41032:
	add r14,1
LB_41033:
	cmp r14,r10
	jge LB_41034
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41032
	cmp al,10
	jz LB_41032
	cmp al,32
	jz LB_41032
LB_41034:
	push r10
	call NS_E_39137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41035
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41036
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41036:
	jmp LB_40932
LB_41035:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_41042:
	jmp LB_41039
LB_41038:
	add r14,1
LB_41039:
	cmp r14,r10
	jge LB_41040
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41038
	cmp al,10
	jz LB_41038
	cmp al,32
	jz LB_41038
LB_41040:
	push r10
	push rsi
	call NS_E_39129_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_41041
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_41043
	bts QWORD [rax],0
LB_41043:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_41042
LB_41041:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_40948
LB_40947:
	add r14,1
LB_40948:
	cmp r14,r10
	jge LB_40949
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40947
	cmp al,10
	jz LB_40947
	cmp al,32
	jz LB_40947
LB_40949:
	add r14,1
	cmp r14,r10
	jg LB_40952
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_40952
	jmp LB_40953
LB_40952:
	jmp LB_40933
LB_40953:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_40955
LB_40954:
	add r14,1
LB_40955:
	cmp r14,r10
	jge LB_40956
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40954
	cmp al,10
	jz LB_40954
	cmp al,32
	jz LB_40954
LB_40956:
	push r10
	call NS_E_39135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40957
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40958
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40958:
	jmp LB_40933
LB_40957:
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
	jc LB_40940
	btr QWORD [rdi],1
LB_40940:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40941
	btr QWORD [rdi],0
LB_40941:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40943
	btr QWORD [rdi],2
LB_40943:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40944
	btr QWORD [rdi],1
LB_40944:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40945
	btr QWORD [rdi],0
LB_40945:
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
LB_40933:
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
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40936
	btr QWORD [rdi],2
LB_40936:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40937
	btr QWORD [rdi],1
LB_40937:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40938
	btr QWORD [rdi],0
LB_40938:
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
LB_40934:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_41023
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_41023:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_41024
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_41024:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41025
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41025:
LB_40932:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord
	jmp LB_41007
LB_41006:
	add r14,1
LB_41007:
	cmp r14,r10
	jge LB_41008
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41006
	cmp al,10
	jz LB_41006
	cmp al,32
	jz LB_41006
LB_41008:
	push r10
	call NS_E_39131_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41009
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40960
LB_41009:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_41012
LB_41011:
	add r14,1
LB_41012:
	cmp r14,r10
	jge LB_41013
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41011
	cmp al,10
	jz LB_41011
	cmp al,32
	jz LB_41011
LB_41013:
	push r10
	call NS_E_39137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41014
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41015
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41015:
	jmp LB_40960
LB_41014:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_41021:
	jmp LB_41018
LB_41017:
	add r14,1
LB_41018:
	cmp r14,r10
	jge LB_41019
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41017
	cmp al,10
	jz LB_41017
	cmp al,32
	jz LB_41017
LB_41019:
	push r10
	push rsi
	call NS_E_39129_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_41020
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_41022
	bts QWORD [rax],0
LB_41022:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_41021
LB_41020:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_40983
LB_40982:
	add r14,1
LB_40983:
	cmp r14,r10
	jge LB_40984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40982
	cmp al,10
	jz LB_40982
	cmp al,32
	jz LB_40982
LB_40984:
	add r14,1
	cmp r14,r10
	jg LB_40987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_40987
	jmp LB_40988
LB_40987:
	jmp LB_40961
LB_40988:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_40990
LB_40989:
	add r14,1
LB_40990:
	cmp r14,r10
	jge LB_40991
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40989
	cmp al,10
	jz LB_40989
	cmp al,32
	jz LB_40989
LB_40991:
	push r10
	call NS_E_39135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40992
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40993:
	jmp LB_40961
LB_40992:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_cnc
	jmp LB_40996
LB_40995:
	add r14,1
LB_40996:
	cmp r14,r10
	jge LB_40997
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40995
	cmp al,10
	jz LB_40995
	cmp al,32
	jz LB_40995
LB_40997:
	push r10
	call NS_E_39135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40998
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40999
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40999:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41000
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41000:
	jmp LB_40961
LB_40998:
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
	jc LB_40974
	btr QWORD [rdi],2
LB_40974:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40975
	btr QWORD [rdi],1
LB_40975:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40976
	btr QWORD [rdi],0
LB_40976:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40978
	btr QWORD [rdi],2
LB_40978:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40979
	btr QWORD [rdi],1
LB_40979:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40980
	btr QWORD [rdi],0
LB_40980:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40961:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_40970
LB_40969:
	add r14,1
LB_40970:
	cmp r14,r10
	jge LB_40971
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_40969
	cmp al,10
	jz LB_40969
	cmp al,32
	jz LB_40969
LB_40971:
	push r10
	call NS_E_39135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40972
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_40962
LB_40972:
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
	jc LB_40963
	btr QWORD [rdi],0
LB_40963:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40965
	btr QWORD [rdi],2
LB_40965:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40966
	btr QWORD [rdi],1
LB_40966:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40967
	btr QWORD [rdi],0
LB_40967:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_40962:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_41002
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_41002:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_41003
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_41003:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41004:
LB_40960:
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
NS_E_39137:
NS_E_RDI_39137:
NS_E_39137_ETR_TBL:
NS_E_39137_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_41051
LB_41050:
	add r14,1
LB_41051:
	cmp r14,r10
	jge LB_41052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41050
	cmp al,10
	jz LB_41050
	cmp al,32
	jz LB_41050
LB_41052:
	push r10
	call NS_E_37871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41053
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_41044
LB_41053:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_41056
LB_41055:
	add r14,1
LB_41056:
	cmp r14,r10
	jge LB_41057
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_41055
	cmp al,10
	jz LB_41055
	cmp al,32
	jz LB_41055
LB_41057:
	add r14,1
	cmp r14,r10
	jg LB_41061
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_41061
	jmp LB_41062
LB_41061:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41059
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41059:
	jmp LB_41044
LB_41062:
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
	jc LB_41047
	btr QWORD [rdi],1
LB_41047:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_41048
	btr QWORD [rdi],0
LB_41048:
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
LB_41044:
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
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_41045:
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
NS_E_41086:
NS_E_RDI_41086:
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
; » 0xr0 |~ {  } ⊢ %_41064 : %_41064
 ; {>  %_41063~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_41064
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f39073 { %_41063 %_41064 } ⊢ { %_41065 %_41066 %_41067 } : { %_41065 %_41066 %_41067 }
 ; {>  %_41064~1':_r64 %_41063~0':_stg }
; _f39073 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_39073
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_41087
	btr r12,4
	jmp LB_41088
LB_41087:
	bts r12,4
LB_41088:
	mov r8,r9
	bt r12,3
	jc LB_41091
	btr r12,2
	jmp LB_41092
LB_41091:
	bts r12,2
LB_41092:
	mov rsi,1
	bt r12,2
	jc LB_41089
	mov rsi,0
	bt r8,0
	jc LB_41089
	jmp LB_41090
LB_41089:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_41090:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_41065 %_41066 %_41067 } ⊢ { %_41068 %_41069 %_41070 } : { %_41068 %_41069 %_41070 }
 ; {>  %_41066~1':_r64 %_41067~2':(_opn)◂(_p39072) %_41065~0':_stg }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_41093
	btr r12,3
	jmp LB_41094
LB_41093:
	bts r12,3
LB_41094:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_41097
	btr r12,4
	jmp LB_41098
LB_41097:
	bts r12,4
LB_41098:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_41095
	btr QWORD [rdi],0
	jmp LB_41096
LB_41095:
	bts QWORD [rdi],0
LB_41096:
	mov r10,r14
	bt r12,1
	jc LB_41101
	btr r12,4
	jmp LB_41102
LB_41101:
	bts r12,4
LB_41102:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_41099
	btr QWORD [rdi],1
	jmp LB_41100
LB_41099:
	bts QWORD [rdi],1
LB_41100:
	mov r10,r8
	bt r12,2
	jc LB_41105
	btr r12,4
	jmp LB_41106
LB_41105:
	bts r12,4
LB_41106:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_41103
	btr QWORD [rdi],2
	jmp LB_41104
LB_41103:
	bts QWORD [rdi],2
LB_41104:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_41107
	btr r12,3
	jmp LB_41108
LB_41107:
	bts r12,3
LB_41108:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_41111
	btr r12,4
	jmp LB_41112
LB_41111:
	bts r12,4
LB_41112:
	mov r13,r10
	bt r12,4
	jc LB_41109
	btr r12,0
	jmp LB_41110
LB_41109:
	bts r12,0
LB_41110:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_41115
	btr r12,4
	jmp LB_41116
LB_41115:
	bts r12,4
LB_41116:
	mov r14,r10
	bt r12,4
	jc LB_41113
	btr r12,1
	jmp LB_41114
LB_41113:
	bts r12,1
LB_41114:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_41119
	btr r12,4
	jmp LB_41120
LB_41119:
	bts r12,4
LB_41120:
	mov r8,r10
	bt r12,4
	jc LB_41117
	btr r12,2
	jmp LB_41118
LB_41117:
	bts r12,2
LB_41118:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; 	» "OpADL.mdls" _ ⊢ 3' : %_41071
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,3
; _f20 %_41071 ⊢ { %_41072 %_41073 } : { %_41072 %_41073 }
 ; {>  %_41069~1':_r64 %_41068~0':_stg %_41070~2':(_opn)◂(_p39072) %_41071~3':_stg }
; _f20 3' ⊢ { 3' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_41127
	btr r12,0
	jmp LB_41128
LB_41127:
	bts r12,0
LB_41128:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 4' }
	mov r9,r13
	bt r12,0
	jc LB_41129
	btr r12,3
	jmp LB_41130
LB_41129:
	bts r12,3
LB_41130:
	mov r10,r14
	bt r12,1
	jc LB_41131
	btr r12,4
	jmp LB_41132
LB_41131:
	bts r12,4
LB_41132:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_41125
	btr r12,2
	jmp LB_41126
LB_41125:
	bts r12,2
LB_41126:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_41123
	btr r12,1
	jmp LB_41124
LB_41123:
	bts r12,1
LB_41124:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_41121
	btr r12,0
	jmp LB_41122
LB_41121:
	bts r12,0
LB_41122:
	add rsp,32
; _f21 { %_41072 %_41073 } ⊢ { %_41074 %_41075 } : { %_41074 %_41075 }
 ; {>  %_41069~1':_r64 %_41073~4':_stg %_41068~0':_stg %_41072~3':_stg %_41070~2':(_opn)◂(_p39072) }
; _f21 { 3' 4' } ⊢ { 3' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000110.. |},{ 3' 4' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r9
	bt r12,3
	jc LB_41141
	btr r12,1
	jmp LB_41142
LB_41141:
	bts r12,1
LB_41142:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_41139
	btr QWORD [rdi],0
	jmp LB_41140
LB_41139:
	bts QWORD [rdi],0
LB_41140:
	mov r14,r10
	bt r12,4
	jc LB_41145
	btr r12,1
	jmp LB_41146
LB_41145:
	bts r12,1
LB_41146:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_41143
	btr QWORD [rdi],1
	jmp LB_41144
LB_41143:
	bts QWORD [rdi],1
LB_41144:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 3' 4' }
; 0' ⊢ { 3' 4' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_41149
	btr r12,1
	jmp LB_41150
LB_41149:
	bts r12,1
LB_41150:
	mov r9,r14
	bt r12,1
	jc LB_41147
	btr r12,3
	jmp LB_41148
LB_41147:
	bts r12,3
LB_41148:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_41153
	btr r12,1
	jmp LB_41154
LB_41153:
	bts r12,1
LB_41154:
	mov r10,r14
	bt r12,1
	jc LB_41151
	btr r12,4
	jmp LB_41152
LB_41151:
	bts r12,4
LB_41152:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_41137
	btr r12,2
	jmp LB_41138
LB_41137:
	bts r12,2
LB_41138:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_41135
	btr r12,1
	jmp LB_41136
LB_41135:
	bts r12,1
LB_41136:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_41133
	btr r12,0
	jmp LB_41134
LB_41133:
	bts r12,0
LB_41134:
	add rsp,32
; _f38869 %_41075 ⊢ { %_41076 %_41077 } : { %_41076 %_41077 }
 ; {>  %_41069~1':_r64 %_41068~0':_stg %_41070~2':(_opn)◂(_p39072) %_41075~4':_stg %_41074~3':_stg }
; _f38869 4' ⊢ { 4' 5' }
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
	jc LB_41163
	btr r12,0
	jmp LB_41164
LB_41163:
	bts r12,0
LB_41164:
	call NS_E_38869
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_41165
	btr r12,4
	jmp LB_41166
LB_41165:
	bts r12,4
LB_41166:
	mov r11,r14
	bt r12,1
	jc LB_41167
	btr r12,5
	jmp LB_41168
LB_41167:
	bts r12,5
LB_41168:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_41161
	btr r12,3
	jmp LB_41162
LB_41161:
	bts r12,3
LB_41162:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_41159
	btr r12,2
	jmp LB_41160
LB_41159:
	bts r12,2
LB_41160:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_41157
	btr r12,1
	jmp LB_41158
LB_41157:
	bts r12,1
LB_41158:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_41155
	btr r12,0
	jmp LB_41156
LB_41155:
	bts r12,0
LB_41156:
	add rsp,40
MTC_LB_41169:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41170
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_41171
	bt QWORD [rax],0
	jc LB_41172
	btr r12,7
	jmp LB_41173
LB_41172:
	bts r12,7
LB_41173:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_41171:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_41174
	btr r12,6
	jmp LB_41175
LB_41174:
	bts r12,6
LB_41175:
LB_41176:
	cmp r15,0
	jz LB_41177
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41176
LB_41177:
; » 0xr0 |~ {  } ⊢ %_41079 : %_41079
 ; {>  %_41069~1':_r64 %_41076~4':_stg %_41068~0':_stg %_41070~2':(_opn)◂(_p39072) %_41074~3':_stg %_41078~6':_stg }
; 	» 0xr0 _ ⊢ 5' : %_41079
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f39073 { %_41078 %_41079 } ⊢ { %_41080 %_41081 %_41082 } : { %_41080 %_41081 %_41082 }
 ; {>  %_41069~1':_r64 %_41076~4':_stg %_41079~5':_r64 %_41068~0':_stg %_41070~2':(_opn)◂(_p39072) %_41074~3':_stg %_41078~6':_stg }
; _f39073 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_41188
	btr r12,0
	jmp LB_41189
LB_41188:
	bts r12,0
LB_41189:
	mov r14,r11
	bt r12,5
	jc LB_41190
	btr r12,1
	jmp LB_41191
LB_41190:
	bts r12,1
LB_41191:
	call NS_E_39073
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_41192
	btr r12,5
	jmp LB_41193
LB_41192:
	bts r12,5
LB_41193:
	mov rcx,r14
	bt r12,1
	jc LB_41194
	btr r12,6
	jmp LB_41195
LB_41194:
	bts r12,6
LB_41195:
	mov rdx,r9
	bt r12,3
	jc LB_41198
	btr r12,7
	jmp LB_41199
LB_41198:
	bts r12,7
LB_41199:
	mov rsi,1
	bt r12,7
	jc LB_41196
	mov rsi,0
	bt rdx,0
	jc LB_41196
	jmp LB_41197
LB_41196:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rdx
	mov rdx,rax
	btr r12,7
LB_41197:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_41186
	btr r12,4
	jmp LB_41187
LB_41186:
	bts r12,4
LB_41187:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_41184
	btr r12,3
	jmp LB_41185
LB_41184:
	bts r12,3
LB_41185:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_41182
	btr r12,2
	jmp LB_41183
LB_41182:
	bts r12,2
LB_41183:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_41180
	btr r12,1
	jmp LB_41181
LB_41180:
	bts r12,1
LB_41181:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_41178
	btr r12,0
	jmp LB_41179
LB_41178:
	bts r12,0
LB_41179:
	add rsp,48
; _f21 { %_41080 %_41081 %_41082 } ⊢ { %_41083 %_41084 %_41085 } : { %_41083 %_41084 %_41085 }
 ; {>  %_41069~1':_r64 %_41076~4':_stg %_41081~6':_r64 %_41082~7':(_opn)◂(_p39072) %_41068~0':_stg %_41070~2':(_opn)◂(_p39072) %_41074~3':_stg %_41080~5':_stg }
; _f21 { 5' 6' 7' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000001110.. |},{ 5' 6' 7' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_41212
	btr r12,1
	jmp LB_41213
LB_41212:
	bts r12,1
LB_41213:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_41210
	btr QWORD [rdi],0
	jmp LB_41211
LB_41210:
	bts QWORD [rdi],0
LB_41211:
	mov r14,rcx
	bt r12,6
	jc LB_41216
	btr r12,1
	jmp LB_41217
LB_41216:
	bts r12,1
LB_41217:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_41214
	btr QWORD [rdi],1
	jmp LB_41215
LB_41214:
	bts QWORD [rdi],1
LB_41215:
	mov r14,rdx
	bt r12,7
	jc LB_41220
	btr r12,1
	jmp LB_41221
LB_41220:
	bts r12,1
LB_41221:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_41218
	btr QWORD [rdi],2
	jmp LB_41219
LB_41218:
	bts QWORD [rdi],2
LB_41219:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_41224
	btr r12,1
	jmp LB_41225
LB_41224:
	bts r12,1
LB_41225:
	mov r11,r14
	bt r12,1
	jc LB_41222
	btr r12,5
	jmp LB_41223
LB_41222:
	bts r12,5
LB_41223:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_41228
	btr r12,1
	jmp LB_41229
LB_41228:
	bts r12,1
LB_41229:
	mov rcx,r14
	bt r12,1
	jc LB_41226
	btr r12,6
	jmp LB_41227
LB_41226:
	bts r12,6
LB_41227:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_41232
	btr r12,1
	jmp LB_41233
LB_41232:
	bts r12,1
LB_41233:
	mov rdx,r14
	bt r12,1
	jc LB_41230
	btr r12,7
	jmp LB_41231
LB_41230:
	bts r12,7
LB_41231:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_41208
	btr r12,4
	jmp LB_41209
LB_41208:
	bts r12,4
LB_41209:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_41206
	btr r12,3
	jmp LB_41207
LB_41206:
	bts r12,3
LB_41207:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_41204
	btr r12,2
	jmp LB_41205
LB_41204:
	bts r12,2
LB_41205:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_41202
	btr r12,1
	jmp LB_41203
LB_41202:
	bts r12,1
LB_41203:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_41200
	btr r12,0
	jmp LB_41201
LB_41200:
	bts r12,0
LB_41201:
	add rsp,48
; ∎ {  }
 ; {>  %_41069~1':_r64 %_41076~4':_stg %_41084~6':_r64 %_41068~0':_stg %_41085~7':(_opn)◂(_p39072) %_41070~2':(_opn)◂(_p39072) %_41074~3':_stg %_41083~5':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_41234
	mov rdi,r14
	call dlt
LB_41234:
	bt r12,4
	jc LB_41235
	mov rdi,r10
	call dlt
LB_41235:
	bt r12,6
	jc LB_41236
	mov rdi,rcx
	call dlt
LB_41236:
	bt r12,0
	jc LB_41237
	mov rdi,r13
	call dlt
LB_41237:
	bt r12,7
	jc LB_41238
	mov rdi,rdx
	call dlt
LB_41238:
	bt r12,2
	jc LB_41239
	mov rdi,r8
	call dlt
LB_41239:
	bt r12,3
	jc LB_41240
	mov rdi,r9
	call dlt
LB_41240:
	bt r12,5
	jc LB_41241
	mov rdi,r11
	call dlt
LB_41241:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_41170:
	mov r15,0
LB_41243:
	cmp r15,0
	jz LB_41244
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41243
LB_41244:
; ∎ {  }
 ; {>  %_41069~1':_r64 %_41077~5':(_opn)◂(_stg) %_41076~4':_stg %_41068~0':_stg %_41070~2':(_opn)◂(_p39072) %_41074~3':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_41245
	mov rdi,r14
	call dlt
LB_41245:
	bt r12,5
	jc LB_41246
	mov rdi,r11
	call dlt
LB_41246:
	bt r12,4
	jc LB_41247
	mov rdi,r10
	call dlt
LB_41247:
	bt r12,0
	jc LB_41248
	mov rdi,r13
	call dlt
LB_41248:
	bt r12,2
	jc LB_41249
	mov rdi,r8
	call dlt
LB_41249:
	bt r12,3
	jc LB_41250
	mov rdi,r9
	call dlt
LB_41250:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_41242:
section .data
	NS_E_DYN_37430:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37430
	NS_E_DYN_37433:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37433
	NS_E_DYN_37434:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37434
	NS_E_DYN_37435:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37435
	NS_E_DYN_37436:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37436
	NS_E_DYN_37450:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37450
	NS_E_DYN_37493:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37493
	NS_E_DYN_37503:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37503
	NS_E_DYN_37504:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37504
	NS_E_DYN_37505:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37505
	NS_E_DYN_37723:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37723
	NS_E_DYN_37762:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37762
	NS_E_DYN_37801:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37801
	NS_E_DYN_37840:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37840
	NS_E_DYN_37871:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37871
	NS_E_DYN_37872:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37872
	NS_E_DYN_37873:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_37873
	NS_E_DYN_38000:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38000
	NS_E_DYN_38059:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38060:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38081:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38082:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38083:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38084:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_38085:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_38086:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_38087:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_38088:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 7
	NS_E_DYN_38089:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 8
	NS_E_DYN_38090:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 9
	NS_E_DYN_38091:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38092:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38093:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38094:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38095:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38096:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38097:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38098:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38099:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38100:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38101:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38102:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38103:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38104:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38105:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38106:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38107:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38108:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38109:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38110:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38111:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38112:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38113:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38114:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_38115:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38116:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38117:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38118:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38119:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38120:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38121:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38122:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38123:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38124:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38125:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38126:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38127:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38128:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38129:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38130:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38131:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38132:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_38133:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_38134:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38135:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38136:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38137:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38138:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38139:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_38140:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_38142:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_38143:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_38144:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38144
	NS_E_DYN_38145:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38145
	NS_E_DYN_38146:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38146
	NS_E_DYN_38147:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38147
	NS_E_DYN_38766:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38766
	NS_E_DYN_38869:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38869
	CST_DYN_38955:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_41086:
		dq 0x0000_0001_00_82_ffff
		dq 1
