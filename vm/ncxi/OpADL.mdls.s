%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_23899
	call NS_E_26030
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
NS_E_22451:
NS_E_RDI_22451:
NS_E_22451_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_22452
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_22452:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_22454:
NS_E_RDI_22454:
NS_E_22454_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_22454_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_22454_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_22455:
NS_E_RDI_22455:
NS_E_22455_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_22455_LB_0
	cmp r11,57
	ja NS_E_22455_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_22455_LB_0:
	mov rax,0
	ret
NS_E_22457:
NS_E_RDI_22457:
NS_E_22457_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_22457_LB_0
	cmp r11,122
	ja NS_E_22457_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_22457_LB_0:
	mov rax,0
	ret
NS_E_22456:
NS_E_RDI_22456:
NS_E_22456_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_22456_LB_0
	cmp r11,90
	ja NS_E_22456_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_22456_LB_0:
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
NS_E_22453:
NS_E_RDI_22453:
NS_E_22453_ETR_TBL:
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
	jz NS_E_22453_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_22453_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_22471:
; 	|» { 0' 1' }
NS_E_RDI_22471:
MTC_LB_22472:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22473
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
	jnc LB_22474
	bt QWORD [rax],0
	jc LB_22475
	btr r12,4
	jmp LB_22476
LB_22475:
	bts r12,4
LB_22476:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_22474:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_22479
	btr r12,5
	jmp LB_22480
LB_22479:
	bts r12,5
LB_22480:
	mov r8,r11
	bt r12,5
	jc LB_22477
	btr r12,2
	jmp LB_22478
LB_22477:
	bts r12,2
LB_22478:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_22483
	btr r12,5
	jmp LB_22484
LB_22483:
	bts r12,5
LB_22484:
	mov r9,r11
	bt r12,5
	jc LB_22481
	btr r12,3
	jmp LB_22482
LB_22481:
	bts r12,3
LB_22482:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22485:
	cmp r15,0
	jz LB_22486
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22485
LB_22486:
; _f39 %_22458 ⊢ %_22462 : %_22462
 ; {>  %_22461~3':(_lst)◂(_r64) %_22458~0':_r64 %_22460~2':_r64 }
	add r13,1
; _f22471 { %_22462 %_22461 } ⊢ { %_22463 %_22464 } : { %_22463 %_22464 }
 ; {>  %_22461~3':(_lst)◂(_r64) %_22462~0':_r64 %_22460~2':_r64 }
; _f22471 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_22489
	btr r12,1
	jmp LB_22490
LB_22489:
	bts r12,1
LB_22490:
	call NS_E_22471
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_22487
	btr r12,2
	jmp LB_22488
LB_22487:
	bts r12,2
LB_22488:
	add rsp,16
; _f38 %_22463 ⊢ %_22465 : %_22465
 ; {>  %_22464~1':_stg %_22460~2':_r64 %_22463~0':_r64 }
	sub r13,1
; _f16 { %_22464 %_22465 %_22460 } ⊢ { %_22466 %_22467 %_22468 } : { %_22466 %_22467 %_22468 }
 ; {>  %_22465~0':_r64 %_22464~1':_stg %_22460~2':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_22491
	btr r12,3
	jmp LB_22492
LB_22491:
	bts r12,3
LB_22492:
	mov r14,r13
	bt r12,0
	jc LB_22493
	btr r12,1
	jmp LB_22494
LB_22493:
	bts r12,1
LB_22494:
	mov r13,r9
	bt r12,3
	jc LB_22495
	btr r12,0
	jmp LB_22496
LB_22495:
	bts r12,0
LB_22496:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_22467 %_22466 }
 ; {>  %_22466~0':_stg %_22468~2':_r64 %_22467~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_22497
	mov rdi,r8
	call dlt
LB_22497:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_22498
	btr r12,2
	jmp LB_22499
LB_22498:
	bts r12,2
LB_22499:
	mov r14,r13
	bt r12,0
	jc LB_22500
	btr r12,1
	jmp LB_22501
LB_22500:
	bts r12,1
LB_22501:
	mov r13,r8
	bt r12,2
	jc LB_22502
	btr r12,0
	jmp LB_22503
LB_22502:
	bts r12,0
LB_22503:
	ret
MTC_LB_22473:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22504
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
	jnc LB_22505
	bt QWORD [rax],0
	jc LB_22506
	btr r12,2
	jmp LB_22507
LB_22506:
	bts r12,2
LB_22507:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_22505:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22508:
	cmp r15,0
	jz LB_22509
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22508
LB_22509:
; _f14 %_22458 ⊢ { %_22469 %_22470 } : { %_22469 %_22470 }
 ; {>  %_22458~0':_r64 }
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
; ∎ { %_22469 %_22470 }
 ; {>  %_22470~1':_stg %_22469~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_22504:
NS_E_22514:
; 	|» 0'
NS_E_RDI_22514:
; » 0xr0 |~ {  } ⊢ %_22511 : %_22511
 ; {>  %_22510~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_22511
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f22471 { %_22511 %_22510 } ⊢ { %_22512 %_22513 } : { %_22512 %_22513 }
 ; {>  %_22510~0':(_lst)◂(_r64) %_22511~1':_r64 }
; _f22471 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_22515
	btr r12,2
	jmp LB_22516
LB_22515:
	bts r12,2
LB_22516:
	mov r14,r13
	bt r12,0
	jc LB_22517
	btr r12,1
	jmp LB_22518
LB_22517:
	bts r12,1
LB_22518:
	mov r13,r8
	bt r12,2
	jc LB_22519
	btr r12,0
	jmp LB_22520
LB_22519:
	bts r12,0
LB_22520:
	call NS_E_22471
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_22513
 ; {>  %_22513~1':_stg %_22512~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_22521
	mov rdi,r13
	call dlt
LB_22521:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_22522
	btr r12,0
	jmp LB_22523
LB_22522:
	bts r12,0
LB_22523:
	ret
NS_E_22524:
NS_E_RDI_22524:
NS_E_22524_ETR_TBL:
NS_E_22524_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_22565
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_22565
	jmp LB_22566
LB_22565:
	jmp LB_22555
LB_22566:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_22525_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22570
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22571:
	jmp LB_22555
LB_22570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22558
	btr r12,1
	jmp LB_22559
LB_22558:
	bts r12,1
LB_22559:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22556
	btr r12,0
	jmp LB_22557
LB_22556:
	bts r12,0
LB_22557:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_22552
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_22573
	btr r12,2
	jmp LB_22574
LB_22573:
	bts r12,2
LB_22574:
	mov r13,r14
	bt r12,1
	jc LB_22575
	btr r12,0
	jmp LB_22576
LB_22575:
	bts r12,0
LB_22576:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f22514 %_22527 ⊢ %_22528 : %_22528
 ; {>  %_22527~0':(_lst)◂(_r64) }
; _f22514 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_22514
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_22528 ⊢ %_22529 : %_22529
 ; {>  %_22528~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_22529
 ; {>  %_22529~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22550
	btr r12,3
	jmp LB_22551
LB_22550:
	bts r12,3
LB_22551:
	mov r8,0
	bts r12,2
	ret
LB_22552:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22554
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22553
LB_22554:
	add rsp,8
	ret
LB_22555:
	add rsp,32
	pop r14
LB_22553:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22525:
NS_E_RDI_22525:
NS_E_22525_ETR_TBL:
NS_E_22525_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_22602
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_22602
	jmp LB_22603
LB_22602:
	jmp LB_22590
LB_22603:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_22526_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22607
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22608
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22608:
	jmp LB_22590
LB_22607:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_22525_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22613
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22614
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22614:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22615
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22615:
	jmp LB_22590
LB_22613:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22595
	btr r12,2
	jmp LB_22596
LB_22595:
	bts r12,2
LB_22596:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22593
	btr r12,1
	jmp LB_22594
LB_22593:
	bts r12,1
LB_22594:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22591
	btr r12,0
	jmp LB_22592
LB_22591:
	bts r12,0
LB_22592:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_22587
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_22617
	btr r12,3
	jmp LB_22618
LB_22617:
	bts r12,3
LB_22618:
	mov r14,r8
	bt r12,2
	jc LB_22619
	btr r12,1
	jmp LB_22620
LB_22619:
	bts r12,1
LB_22620:
	mov r8,r13
	bt r12,0
	jc LB_22621
	btr r12,2
	jmp LB_22622
LB_22621:
	bts r12,2
LB_22622:
	mov r13,r9
	bt r12,3
	jc LB_22623
	btr r12,0
	jmp LB_22624
LB_22623:
	bts r12,0
LB_22624:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_22530 %_22531 } ⊢ %_22532 : %_22532
 ; {>  %_22531~1':(_lst)◂(_r64) %_22530~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_22532 ⊢ %_22533 : %_22533
 ; {>  %_22532~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_22533
 ; {>  %_22533~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_22581
	btr r12,2
	jmp LB_22582
LB_22581:
	bts r12,2
LB_22582:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_22579
	btr QWORD [rdi],0
	jmp LB_22580
LB_22579:
	bts QWORD [rdi],0
LB_22580:
	mov r8,r14
	bt r12,1
	jc LB_22585
	btr r12,2
	jmp LB_22586
LB_22585:
	bts r12,2
LB_22586:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_22583
	btr QWORD [rdi],1
	jmp LB_22584
LB_22583:
	bts QWORD [rdi],1
LB_22584:
	mov rsi,1
	bt r12,3
	jc LB_22577
	mov rsi,0
	bt r9,0
	jc LB_22577
	jmp LB_22578
LB_22577:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_22578:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_22587:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22589
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22588
LB_22589:
	add rsp,8
	ret
LB_22590:
	add rsp,48
	pop r14
LB_22588:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_22638
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_22638
	jmp LB_22639
LB_22638:
	jmp LB_22630
LB_22639:
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
	jc LB_22631
	btr r12,0
	jmp LB_22632
LB_22631:
	bts r12,0
LB_22632:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22627
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_22534 : %_22534
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_22534 ⊢ %_22535 : %_22535
 ; {>  %_22534~°1◂{  }:(_lst)◂(t3947'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_22535
 ; {>  %_22535~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3950'(0))) }
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
	jc LB_22625
	mov rsi,0
	bt r9,0
	jc LB_22625
	jmp LB_22626
LB_22625:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_22626:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_22627:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22629
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22628
LB_22629:
	add rsp,8
	ret
LB_22630:
	add rsp,16
	pop r14
LB_22628:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_22451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22661
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22653
LB_22661:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_22525_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22666
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22667
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22667:
	jmp LB_22653
LB_22666:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22656
	btr r12,1
	jmp LB_22657
LB_22656:
	bts r12,1
LB_22657:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22654
	btr r12,0
	jmp LB_22655
LB_22654:
	bts r12,0
LB_22655:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_22650
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_22536 %_22537 } ⊢ %_22538 : %_22538
 ; {>  %_22537~1':(_lst)◂(_r64) %_22536~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_22538 ⊢ %_22539 : %_22539
 ; {>  %_22538~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_22539
 ; {>  %_22539~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_22644
	btr r12,2
	jmp LB_22645
LB_22644:
	bts r12,2
LB_22645:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_22642
	btr QWORD [rdi],0
	jmp LB_22643
LB_22642:
	bts QWORD [rdi],0
LB_22643:
	mov r8,r14
	bt r12,1
	jc LB_22648
	btr r12,2
	jmp LB_22649
LB_22648:
	bts r12,2
LB_22649:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_22646
	btr QWORD [rdi],1
	jmp LB_22647
LB_22646:
	bts QWORD [rdi],1
LB_22647:
	mov rsi,1
	bt r12,3
	jc LB_22640
	mov rsi,0
	bt r9,0
	jc LB_22640
	jmp LB_22641
LB_22640:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_22641:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_22650:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22652
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22651
LB_22652:
	add rsp,8
	ret
LB_22653:
	add rsp,32
	pop r14
LB_22651:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22526:
NS_E_RDI_22526:
NS_E_22526_ETR_TBL:
NS_E_22526_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_22682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_22682
	jmp LB_22683
LB_22682:
	jmp LB_22674
LB_22683:
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
	jc LB_22675
	btr r12,0
	jmp LB_22676
LB_22675:
	bts r12,0
LB_22676:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22671
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_22540 : %_22540
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_22540
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_22540 ⊢ %_22541 : %_22541
 ; {>  %_22540~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22541
 ; {>  %_22541~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22669
	btr r12,3
	jmp LB_22670
LB_22669:
	bts r12,3
LB_22670:
	mov r8,0
	bts r12,2
	ret
LB_22671:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22673
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22672
LB_22673:
	add rsp,8
	ret
LB_22674:
	add rsp,16
	pop r14
LB_22672:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_22697
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_22697
	jmp LB_22698
LB_22697:
	jmp LB_22689
LB_22698:
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
	jc LB_22690
	btr r12,0
	jmp LB_22691
LB_22690:
	bts r12,0
LB_22691:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22686
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_22542 : %_22542
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_22542
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_22542 ⊢ %_22543 : %_22543
 ; {>  %_22542~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22543
 ; {>  %_22543~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22684
	btr r12,3
	jmp LB_22685
LB_22684:
	bts r12,3
LB_22685:
	mov r8,0
	bts r12,2
	ret
LB_22686:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22688
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22687
LB_22688:
	add rsp,8
	ret
LB_22689:
	add rsp,16
	pop r14
LB_22687:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_22712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_22712
	jmp LB_22713
LB_22712:
	jmp LB_22704
LB_22713:
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
	jc LB_22705
	btr r12,0
	jmp LB_22706
LB_22705:
	bts r12,0
LB_22706:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22701
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_22544 : %_22544
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_22544
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_22544 ⊢ %_22545 : %_22545
 ; {>  %_22544~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22545
 ; {>  %_22545~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22699
	btr r12,3
	jmp LB_22700
LB_22699:
	bts r12,3
LB_22700:
	mov r8,0
	bts r12,2
	ret
LB_22701:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22703
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22702
LB_22703:
	add rsp,8
	ret
LB_22704:
	add rsp,16
	pop r14
LB_22702:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_22727
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_22727
	jmp LB_22728
LB_22727:
	jmp LB_22719
LB_22728:
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
	jc LB_22720
	btr r12,0
	jmp LB_22721
LB_22720:
	bts r12,0
LB_22721:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22716
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_22546 : %_22546
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_22546
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_22546 ⊢ %_22547 : %_22547
 ; {>  %_22546~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22547
 ; {>  %_22547~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22714
	btr r12,3
	jmp LB_22715
LB_22714:
	bts r12,3
LB_22715:
	mov r8,0
	bts r12,2
	ret
LB_22716:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22718
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22717
LB_22718:
	add rsp,8
	ret
LB_22719:
	add rsp,16
	pop r14
LB_22717:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_22742
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_22742
	jmp LB_22743
LB_22742:
	jmp LB_22734
LB_22743:
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
	jc LB_22735
	btr r12,0
	jmp LB_22736
LB_22735:
	bts r12,0
LB_22736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22731
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_22548 : %_22548
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_22548
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_22548 ⊢ %_22549 : %_22549
 ; {>  %_22548~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22549
 ; {>  %_22549~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22729
	btr r12,3
	jmp LB_22730
LB_22729:
	bts r12,3
LB_22730:
	mov r8,0
	bts r12,2
	ret
LB_22731:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22733
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22732
LB_22733:
	add rsp,8
	ret
LB_22734:
	add rsp,16
	pop r14
LB_22732:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22744:
NS_E_RDI_22744:
NS_E_22744_ETR_TBL:
NS_E_22744_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_22451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22781
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22775
LB_22781:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22776
	btr r12,0
	jmp LB_22777
LB_22776:
	bts r12,0
LB_22777:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22772
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_22746 : %_22746
 ; {>  %_22745~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_22746
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_22747 : %_22747
 ; {>  %_22746~1':_r64 %_22745~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_22747
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_22745 %_22746 } ⊢ { %_22748 %_22749 %_22750 } : { %_22748 %_22749 %_22750 }
 ; {>  %_22746~1':_r64 %_22747~2':_r64 %_22745~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_22747 %_22748 } ⊢ { %_22751 %_22752 %_22753 } : { %_22751 %_22752 %_22753 }
 ; {>  %_22748~0':_r64 %_22749~1':_r64 %_22747~2':_r64 %_22750~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_22756:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_22757
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_22757
LB_22758:
	cmp r15,0
	jz LB_22759
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22758
LB_22759:
; _some %_22752 ⊢ %_22754 : %_22754
 ; {>  %_22751~2':_r64 %_22749~1':_r64 %_22752~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22754
 ; {>  %_22751~2':_r64 %_22749~1':_r64 %_22754~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_22760
	mov rdi,r8
	call dlt
LB_22760:
	bt r12,1
	jc LB_22761
	mov rdi,r14
	call dlt
LB_22761:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22762
	btr r12,3
	jmp LB_22763
LB_22762:
	bts r12,3
LB_22763:
	mov r8,0
	bts r12,2
	ret
MTC_LB_22757:
	mov r15,0
LB_22765:
	cmp r15,0
	jz LB_22766
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22765
LB_22766:
; _none {  } ⊢ %_22755 : %_22755
 ; {>  %_22751~2':_r64 %_22749~1':_r64 %_22750~3':_r64 %_22752~0':_r64 %_22753~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_22755
 ; {>  %_22751~2':_r64 %_22749~1':_r64 %_22750~3':_r64 %_22755~°1◂{  }:(_opn)◂(t4025'(0)) %_22752~0':_r64 %_22753~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_22767
	mov rdi,r8
	call dlt
LB_22767:
	bt r12,1
	jc LB_22768
	mov rdi,r14
	call dlt
LB_22768:
	bt r12,3
	jc LB_22769
	mov rdi,r9
	call dlt
LB_22769:
	bt r12,0
	jc LB_22770
	mov rdi,r13
	call dlt
LB_22770:
	bt r12,4
	jc LB_22771
	mov rdi,r10
	call dlt
LB_22771:
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
MTC_LB_22764:
LB_22772:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22774
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22773
LB_22774:
	add rsp,8
	ret
LB_22775:
	add rsp,16
	pop r14
LB_22773:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22783:
NS_E_RDI_22783:
NS_E_22783_ETR_TBL:
NS_E_22783_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_22451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22820
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22814
LB_22820:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22815
	btr r12,0
	jmp LB_22816
LB_22815:
	bts r12,0
LB_22816:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22811
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_22785 : %_22785
 ; {>  %_22784~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_22785
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_22786 : %_22786
 ; {>  %_22784~0':_r64 %_22785~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_22786
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_22784 %_22785 } ⊢ { %_22787 %_22788 %_22789 } : { %_22787 %_22788 %_22789 }
 ; {>  %_22784~0':_r64 %_22786~2':_r64 %_22785~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_22786 %_22787 } ⊢ { %_22790 %_22791 %_22792 } : { %_22790 %_22791 %_22792 }
 ; {>  %_22786~2':_r64 %_22788~1':_r64 %_22789~3':_r64 %_22787~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_22795:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_22796
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_22796
LB_22797:
	cmp r15,0
	jz LB_22798
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22797
LB_22798:
; _some %_22791 ⊢ %_22793 : %_22793
 ; {>  %_22791~0':_r64 %_22790~2':_r64 %_22788~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22793
 ; {>  %_22790~2':_r64 %_22793~°0◂0':(_opn)◂(_r64) %_22788~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_22799
	mov rdi,r8
	call dlt
LB_22799:
	bt r12,1
	jc LB_22800
	mov rdi,r14
	call dlt
LB_22800:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22801
	btr r12,3
	jmp LB_22802
LB_22801:
	bts r12,3
LB_22802:
	mov r8,0
	bts r12,2
	ret
MTC_LB_22796:
	mov r15,0
LB_22804:
	cmp r15,0
	jz LB_22805
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22804
LB_22805:
; _none {  } ⊢ %_22794 : %_22794
 ; {>  %_22791~0':_r64 %_22790~2':_r64 %_22792~4':_r64 %_22788~1':_r64 %_22789~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_22794
 ; {>  %_22791~0':_r64 %_22790~2':_r64 %_22792~4':_r64 %_22794~°1◂{  }:(_opn)◂(t4052'(0)) %_22788~1':_r64 %_22789~3':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_22806
	mov rdi,r13
	call dlt
LB_22806:
	bt r12,2
	jc LB_22807
	mov rdi,r8
	call dlt
LB_22807:
	bt r12,4
	jc LB_22808
	mov rdi,r10
	call dlt
LB_22808:
	bt r12,1
	jc LB_22809
	mov rdi,r14
	call dlt
LB_22809:
	bt r12,3
	jc LB_22810
	mov rdi,r9
	call dlt
LB_22810:
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
MTC_LB_22803:
LB_22811:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22813
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22812
LB_22813:
	add rsp,8
	ret
LB_22814:
	add rsp,16
	pop r14
LB_22812:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22822:
NS_E_RDI_22822:
NS_E_22822_ETR_TBL:
NS_E_22822_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_22451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22859
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22853
LB_22859:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22854
	btr r12,0
	jmp LB_22855
LB_22854:
	bts r12,0
LB_22855:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22850
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_22824 : %_22824
 ; {>  %_22823~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_22824
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_22825 : %_22825
 ; {>  %_22824~1':_r64 %_22823~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_22825
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_22823 %_22824 } ⊢ { %_22826 %_22827 %_22828 } : { %_22826 %_22827 %_22828 }
 ; {>  %_22825~2':_r64 %_22824~1':_r64 %_22823~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_22825 %_22826 } ⊢ { %_22829 %_22830 %_22831 } : { %_22829 %_22830 %_22831 }
 ; {>  %_22825~2':_r64 %_22828~3':_r64 %_22826~0':_r64 %_22827~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_22834:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_22835
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_22835
LB_22836:
	cmp r15,0
	jz LB_22837
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22836
LB_22837:
; _some %_22830 ⊢ %_22832 : %_22832
 ; {>  %_22829~2':_r64 %_22830~0':_r64 %_22827~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22832
 ; {>  %_22829~2':_r64 %_22827~1':_r64 %_22832~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_22838
	mov rdi,r8
	call dlt
LB_22838:
	bt r12,1
	jc LB_22839
	mov rdi,r14
	call dlt
LB_22839:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22840
	btr r12,3
	jmp LB_22841
LB_22840:
	bts r12,3
LB_22841:
	mov r8,0
	bts r12,2
	ret
MTC_LB_22835:
	mov r15,0
LB_22843:
	cmp r15,0
	jz LB_22844
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22843
LB_22844:
; _none {  } ⊢ %_22833 : %_22833
 ; {>  %_22829~2':_r64 %_22828~3':_r64 %_22830~0':_r64 %_22827~1':_r64 %_22831~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_22833
 ; {>  %_22833~°1◂{  }:(_opn)◂(t4079'(0)) %_22829~2':_r64 %_22828~3':_r64 %_22830~0':_r64 %_22827~1':_r64 %_22831~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_22845
	mov rdi,r8
	call dlt
LB_22845:
	bt r12,3
	jc LB_22846
	mov rdi,r9
	call dlt
LB_22846:
	bt r12,0
	jc LB_22847
	mov rdi,r13
	call dlt
LB_22847:
	bt r12,1
	jc LB_22848
	mov rdi,r14
	call dlt
LB_22848:
	bt r12,4
	jc LB_22849
	mov rdi,r10
	call dlt
LB_22849:
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
MTC_LB_22842:
LB_22850:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22852
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22851
LB_22852:
	add rsp,8
	ret
LB_22853:
	add rsp,16
	pop r14
LB_22851:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22861:
NS_E_RDI_22861:
NS_E_22861_ETR_TBL:
NS_E_22861_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_22822_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22877
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22871
LB_22877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22872
	btr r12,0
	jmp LB_22873
LB_22872:
	bts r12,0
LB_22873:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22868
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_22862 ⊢ %_22863 : %_22863
 ; {>  %_22862~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22863
 ; {>  %_22863~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22866
	btr r12,3
	jmp LB_22867
LB_22866:
	bts r12,3
LB_22867:
	mov r8,0
	bts r12,2
	ret
LB_22868:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22870
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22869
LB_22870:
	add rsp,8
	ret
LB_22871:
	add rsp,16
	pop r14
LB_22869:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_22783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22890
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22884
LB_22890:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22885
	btr r12,0
	jmp LB_22886
LB_22885:
	bts r12,0
LB_22886:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22881
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_22864 ⊢ %_22865 : %_22865
 ; {>  %_22864~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22865
 ; {>  %_22865~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22879
	btr r12,3
	jmp LB_22880
LB_22879:
	bts r12,3
LB_22880:
	mov r8,0
	bts r12,2
	ret
LB_22881:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22883
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22882
LB_22883:
	add rsp,8
	ret
LB_22884:
	add rsp,16
	pop r14
LB_22882:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22892:
NS_E_RDI_22892:
NS_E_22892_ETR_TBL:
NS_E_22892_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_22861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22937
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22929
LB_22937:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_22893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22942
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22943
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22943:
	jmp LB_22929
LB_22942:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22932
	btr r12,1
	jmp LB_22933
LB_22932:
	bts r12,1
LB_22933:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22930
	btr r12,0
	jmp LB_22931
LB_22930:
	bts r12,0
LB_22931:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_22926
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_22895 %_22896 } ⊢ %_22897 : %_22897
 ; {>  %_22896~1':(_lst)◂(_r64) %_22895~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f22514 %_22897 ⊢ %_22898 : %_22898
 ; {>  %_22897~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f22514 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_22912
	btr r12,2
	jmp LB_22913
LB_22912:
	bts r12,2
LB_22913:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_22918
	btr r12,3
	jmp LB_22919
LB_22918:
	bts r12,3
LB_22919:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_22916
	btr QWORD [rdi],0
	jmp LB_22917
LB_22916:
	bts QWORD [rdi],0
LB_22917:
	mov r9,r14
	bt r12,1
	jc LB_22922
	btr r12,3
	jmp LB_22923
LB_22922:
	bts r12,3
LB_22923:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_22920
	btr QWORD [rdi],1
	jmp LB_22921
LB_22920:
	bts QWORD [rdi],1
LB_22921:
	mov rsi,1
	bt r12,0
	jc LB_22914
	mov rsi,0
	bt r13,0
	jc LB_22914
	jmp LB_22915
LB_22914:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_22915:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_22514
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_22898 ⊢ %_22899 : %_22899
 ; {>  %_22898~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_22899
 ; {>  %_22899~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22924
	btr r12,3
	jmp LB_22925
LB_22924:
	bts r12,3
LB_22925:
	mov r8,0
	bts r12,2
	ret
LB_22926:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22928
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22927
LB_22928:
	add rsp,8
	ret
LB_22929:
	add rsp,32
	pop r14
LB_22927:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22893:
NS_E_RDI_22893:
NS_E_22893_ETR_TBL:
NS_E_22893_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_22894_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22966
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22958
LB_22966:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_22893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22971
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22972:
	jmp LB_22958
LB_22971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22961
	btr r12,1
	jmp LB_22962
LB_22961:
	bts r12,1
LB_22962:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22959
	btr r12,0
	jmp LB_22960
LB_22959:
	bts r12,0
LB_22960:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_22955
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_22900 %_22901 } ⊢ %_22902 : %_22902
 ; {>  %_22900~0':_r64 %_22901~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_22902 ⊢ %_22903 : %_22903
 ; {>  %_22902~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_22903
 ; {>  %_22903~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_22949
	btr r12,2
	jmp LB_22950
LB_22949:
	bts r12,2
LB_22950:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_22947
	btr QWORD [rdi],0
	jmp LB_22948
LB_22947:
	bts QWORD [rdi],0
LB_22948:
	mov r8,r14
	bt r12,1
	jc LB_22953
	btr r12,2
	jmp LB_22954
LB_22953:
	bts r12,2
LB_22954:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_22951
	btr QWORD [rdi],1
	jmp LB_22952
LB_22951:
	bts QWORD [rdi],1
LB_22952:
	mov rsi,1
	bt r12,3
	jc LB_22945
	mov rsi,0
	bt r9,0
	jc LB_22945
	jmp LB_22946
LB_22945:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_22946:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_22955:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22957
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22956
LB_22957:
	add rsp,8
	ret
LB_22958:
	add rsp,32
	pop r14
LB_22956:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_22976
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_22904 : %_22904
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_22904 ⊢ %_22905 : %_22905
 ; {>  %_22904~°1◂{  }:(_lst)◂(t4123'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_22905
 ; {>  %_22905~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4126'(0))) }
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
	jc LB_22974
	mov rsi,0
	bt r9,0
	jc LB_22974
	jmp LB_22975
LB_22974:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_22975:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_22976:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22978
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22977
LB_22978:
	add rsp,8
	ret
LB_22979:
	add rsp,0
	pop r14
LB_22977:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_22894:
NS_E_RDI_22894:
NS_E_22894_ETR_TBL:
NS_E_22894_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_22861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22991
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22985
LB_22991:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22986
	btr r12,0
	jmp LB_22987
LB_22986:
	bts r12,0
LB_22987:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22982
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_22906 ⊢ %_22907 : %_22907
 ; {>  %_22906~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22907
 ; {>  %_22907~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22980
	btr r12,3
	jmp LB_22981
LB_22980:
	bts r12,3
LB_22981:
	mov r8,0
	bts r12,2
	ret
LB_22982:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22984
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22983
LB_22984:
	add rsp,8
	ret
LB_22985:
	add rsp,16
	pop r14
LB_22983:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_22744_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23004
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22998
LB_23004:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22999
	btr r12,0
	jmp LB_23000
LB_22999:
	bts r12,0
LB_23000:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_22995
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_22908 ⊢ %_22909 : %_22909
 ; {>  %_22908~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22909
 ; {>  %_22909~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_22993
	btr r12,3
	jmp LB_22994
LB_22993:
	bts r12,3
LB_22994:
	mov r8,0
	bts r12,2
	ret
LB_22995:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_22997
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22996
LB_22997:
	add rsp,8
	ret
LB_22998:
	add rsp,16
	pop r14
LB_22996:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_23019
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_23019
	jmp LB_23020
LB_23019:
	jmp LB_23011
LB_23020:
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
	jc LB_23012
	btr r12,0
	jmp LB_23013
LB_23012:
	bts r12,0
LB_23013:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_23008
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_22910 : %_22910
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_22910
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_22910 ⊢ %_22911 : %_22911
 ; {>  %_22910~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_22911
 ; {>  %_22911~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23006
	btr r12,3
	jmp LB_23007
LB_23006:
	bts r12,3
LB_23007:
	mov r8,0
	bts r12,2
	ret
LB_23008:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23010
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23009
LB_23010:
	add rsp,8
	ret
LB_23011:
	add rsp,16
	pop r14
LB_23009:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23021:
NS_E_RDI_23021:
NS_E_23021_ETR_TBL:
NS_E_23021_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_23042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_23042
	jmp LB_23043
LB_23042:
	jmp LB_23032
LB_23043:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_22893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23047
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23048
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23048:
	jmp LB_23032
LB_23047:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23035
	btr r12,1
	jmp LB_23036
LB_23035:
	bts r12,1
LB_23036:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23033
	btr r12,0
	jmp LB_23034
LB_23033:
	bts r12,0
LB_23034:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23029
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_23050
	btr r12,2
	jmp LB_23051
LB_23050:
	bts r12,2
LB_23051:
	mov r13,r14
	bt r12,1
	jc LB_23052
	btr r12,0
	jmp LB_23053
LB_23052:
	bts r12,0
LB_23053:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f22514 %_23022 ⊢ %_23023 : %_23023
 ; {>  %_23022~0':(_lst)◂(_r64) }
; _f22514 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_22514
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_23023 ⊢ %_23024 : %_23024
 ; {>  %_23023~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_23024
 ; {>  %_23024~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23027
	btr r12,3
	jmp LB_23028
LB_23027:
	bts r12,3
LB_23028:
	mov r8,0
	bts r12,2
	ret
LB_23029:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23031
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23030
LB_23031:
	add rsp,8
	ret
LB_23032:
	add rsp,32
	pop r14
LB_23030:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23065
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23059
LB_23065:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23060
	btr r12,0
	jmp LB_23061
LB_23060:
	bts r12,0
LB_23061:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_23056
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_23025 ⊢ %_23026 : %_23026
 ; {>  %_23025~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_23026
 ; {>  %_23026~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23054
	btr r12,3
	jmp LB_23055
LB_23054:
	bts r12,3
LB_23055:
	mov r8,0
	bts r12,2
	ret
LB_23056:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23058
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23057
LB_23058:
	add rsp,8
	ret
LB_23059:
	add rsp,16
	pop r14
LB_23057:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23068:
NS_E_RDI_23068:
NS_E_23068_ETR_TBL:
NS_E_23068_TBL:
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
LB_23077:
	jmp LB_23074
LB_23073:
	add r14,1
LB_23074:
	cmp r14,r10
	jge LB_23075
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23073
	cmp al,10
	jz LB_23073
	cmp al,32
	jz LB_23073
LB_23075:
	push r10
	push rsi
	call NS_E_22892_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_23076
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_23078
	bts QWORD [rax],0
LB_23078:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_23077
LB_23076:
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
	jc LB_23071
	btr QWORD [rdi],0
LB_23071:
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
LB_23070:
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
NS_E_23088:
NS_E_RDI_23088:
NS_E_23088_ETR_TBL:
NS_E_23088_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23190
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23190
	jmp LB_23191
LB_23190:
	jmp LB_23182
LB_23191:
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
	jc LB_23183
	btr r12,0
	jmp LB_23184
LB_23183:
	bts r12,0
LB_23184:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_23179
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_23092 : %_23092
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_23092
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_23092 ⊢ %_23093 : %_23093
 ; {>  %_23092~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23093
 ; {>  %_23093~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23177
	btr r12,3
	jmp LB_23178
LB_23177:
	bts r12,3
LB_23178:
	mov r8,0
	bts r12,2
	ret
LB_23179:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23181
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23180
LB_23181:
	add rsp,8
	ret
LB_23182:
	add rsp,16
	pop r14
LB_23180:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_22451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23206
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23198
LB_23206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_23088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23211
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23212
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23212:
	jmp LB_23198
LB_23211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23201
	btr r12,1
	jmp LB_23202
LB_23201:
	bts r12,1
LB_23202:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23199
	btr r12,0
	jmp LB_23200
LB_23199:
	bts r12,0
LB_23200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23195
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 %_23095 ⊢ %_23096 : %_23096
 ; {>  %_23095~1':_r64 %_23094~0':_r64 }
	add r14,1
; _some %_23096 ⊢ %_23097 : %_23097
 ; {>  %_23096~1':_r64 %_23094~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_23097
 ; {>  %_23097~°0◂1':(_opn)◂(_r64) %_23094~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_23192
	mov rdi,r13
	call dlt
LB_23192:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_23193
	btr r12,3
	jmp LB_23194
LB_23193:
	bts r12,3
LB_23194:
	mov r8,0
	bts r12,2
	ret
LB_23195:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23197
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23196
LB_23197:
	add rsp,8
	ret
LB_23198:
	add rsp,32
	pop r14
LB_23196:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23089:
NS_E_RDI_23089:
NS_E_23089_ETR_TBL:
NS_E_23089_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_23227
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_23227
	jmp LB_23228
LB_23227:
	jmp LB_23219
LB_23228:
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
	jc LB_23220
	btr r12,0
	jmp LB_23221
LB_23220:
	bts r12,0
LB_23221:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_23216
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_23098 : %_23098
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_23098
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_23098 ⊢ %_23099 : %_23099
 ; {>  %_23098~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23099
 ; {>  %_23099~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23214
	btr r12,3
	jmp LB_23215
LB_23214:
	bts r12,3
LB_23215:
	mov r8,0
	bts r12,2
	ret
LB_23216:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23218
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23217
LB_23218:
	add rsp,8
	ret
LB_23219:
	add rsp,16
	pop r14
LB_23217:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_23242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_23242
	jmp LB_23243
LB_23242:
	jmp LB_23234
LB_23243:
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
	jc LB_23235
	btr r12,0
	jmp LB_23236
LB_23235:
	bts r12,0
LB_23236:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_23231
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_23100 : %_23100
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_23100
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_23100 ⊢ %_23101 : %_23101
 ; {>  %_23100~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23101
 ; {>  %_23101~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23229
	btr r12,3
	jmp LB_23230
LB_23229:
	bts r12,3
LB_23230:
	mov r8,0
	bts r12,2
	ret
LB_23231:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23233
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23232
LB_23233:
	add rsp,8
	ret
LB_23234:
	add rsp,16
	pop r14
LB_23232:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_23246
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_23102 : %_23102
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_23102
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_23102 ⊢ %_23103 : %_23103
 ; {>  %_23102~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23103
 ; {>  %_23103~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23244
	btr r12,3
	jmp LB_23245
LB_23244:
	bts r12,3
LB_23245:
	mov r8,0
	bts r12,2
	ret
LB_23246:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23248
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23247
LB_23248:
	add rsp,8
	ret
LB_23249:
	add rsp,0
	pop r14
LB_23247:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23090:
NS_E_RDI_23090:
NS_E_23090_ETR_TBL:
NS_E_23090_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_23089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23292
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23276
LB_23292:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_23300
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_23300
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_23300
	jmp LB_23301
LB_23300:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23298
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23298:
	jmp LB_23276
LB_23301:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_23089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23305
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23306
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23306:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23307
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23307:
	jmp LB_23276
LB_23305:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23317
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23317
	jmp LB_23318
LB_23317:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23313
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23313:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23314
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23314:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23315
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23315:
	jmp LB_23276
LB_23318:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_23091_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23322
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23323
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23323:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23324
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23324:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23325
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23325:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23326
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23326:
	jmp LB_23276
LB_23322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_23090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23331
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_23332
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_23332:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23333
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23333:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23334
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23334:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23335
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23335:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23336
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23336:
	jmp LB_23276
LB_23331:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_23287
	btr r12,5
	jmp LB_23288
LB_23287:
	bts r12,5
LB_23288:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_23285
	btr r12,4
	jmp LB_23286
LB_23285:
	bts r12,4
LB_23286:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23283
	btr r12,3
	jmp LB_23284
LB_23283:
	bts r12,3
LB_23284:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23281
	btr r12,2
	jmp LB_23282
LB_23281:
	bts r12,2
LB_23282:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23279
	btr r12,1
	jmp LB_23280
LB_23279:
	bts r12,1
LB_23280:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23277
	btr r12,0
	jmp LB_23278
LB_23277:
	bts r12,0
LB_23278:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_23273
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_23338
	btr r12,6
	jmp LB_23339
LB_23338:
	bts r12,6
LB_23339:
	mov r8,r10
	bt r12,4
	jc LB_23340
	btr r12,2
	jmp LB_23341
LB_23340:
	bts r12,2
LB_23341:
	mov rdx,r14
	bt r12,1
	jc LB_23342
	btr r12,7
	jmp LB_23343
LB_23342:
	bts r12,7
LB_23343:
	mov r14,rcx
	bt r12,6
	jc LB_23344
	btr r12,1
	jmp LB_23345
LB_23344:
	bts r12,1
LB_23345:
	mov rcx,r9
	bt r12,3
	jc LB_23346
	btr r12,6
	jmp LB_23347
LB_23346:
	bts r12,6
LB_23347:
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_23350
	btr r12,8
	jmp LB_23351
LB_23350:
	bts r12,8
LB_23351:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23348
	btr r12,3
	jmp LB_23349
LB_23348:
	bts r12,3
LB_23349:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_23354
	btr r12,8
	jmp LB_23355
LB_23354:
	bts r12,8
LB_23355:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23352
	btr r12,4
	jmp LB_23353
LB_23352:
	bts r12,4
LB_23353:
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
; » 0xr3 |~ {  } ⊢ %_23109 : %_23109
 ; {>  %_23108~4':(_lst)◂(_p23085) %_23107~3':_r64 %_23104~0':_r64 %_23105~1':_r64 %_23106~2':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_23109
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f34 { %_23109 %_23104 } ⊢ { %_23110 %_23111 } : { %_23110 %_23111 }
 ; {>  %_23109~5':_r64 %_23108~4':(_lst)◂(_p23085) %_23107~3':_r64 %_23104~0':_r64 %_23105~1':_r64 %_23106~2':_r64 }
	add r11,r13
; _f34 { %_23110 %_23105 } ⊢ { %_23112 %_23113 } : { %_23112 %_23113 }
 ; {>  %_23110~5':_r64 %_23111~0':_r64 %_23108~4':(_lst)◂(_p23085) %_23107~3':_r64 %_23105~1':_r64 %_23106~2':_r64 }
	add r11,r14
; _f34 { %_23112 %_23106 } ⊢ { %_23114 %_23115 } : { %_23114 %_23115 }
 ; {>  %_23112~5':_r64 %_23111~0':_r64 %_23108~4':(_lst)◂(_p23085) %_23107~3':_r64 %_23106~2':_r64 %_23113~1':_r64 }
	add r11,r8
; _f23086 %_23114 ⊢ %_23116 : %_23116
 ; {>  %_23115~2':_r64 %_23111~0':_r64 %_23108~4':(_lst)◂(_p23085) %_23107~3':_r64 %_23114~5':_r64 %_23113~1':_r64 }
; _f23086 5' ⊢ °0◂5'
; _cns { %_23116 %_23108 } ⊢ %_23117 : %_23117
 ; {>  %_23116~°0◂5':_p23085 %_23115~2':_r64 %_23111~0':_r64 %_23108~4':(_lst)◂(_p23085) %_23107~3':_r64 %_23113~1':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_23107 %_23117 } ⊢ %_23118 : %_23118
 ; {>  %_23117~°0◂{ °0◂5' 4' }:(_lst)◂(_p23085) %_23115~2':_r64 %_23111~0':_r64 %_23107~3':_r64 %_23113~1':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_23118
 ; {>  %_23115~2':_r64 %_23111~0':_r64 %_23118~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p23085) }) %_23113~1':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,2
	jc LB_23250
	mov rdi,r8
	call dlt
LB_23250:
	bt r12,0
	jc LB_23251
	mov rdi,r13
	call dlt
LB_23251:
	bt r12,1
	jc LB_23252
	mov rdi,r14
	call dlt
LB_23252:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_23253
	btr r12,0
	jmp LB_23254
LB_23253:
	bts r12,0
LB_23254:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_23257
	btr r12,1
	jmp LB_23258
LB_23257:
	bts r12,1
LB_23258:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23255
	btr QWORD [rdi],0
	jmp LB_23256
LB_23255:
	bts QWORD [rdi],0
LB_23256:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_23267
	btr r12,0
	jmp LB_23268
LB_23267:
	bts r12,0
LB_23268:
	mov rsi,1
	bt r12,0
	jc LB_23265
	mov rsi,0
	bt r13,0
	jc LB_23265
	jmp LB_23266
LB_23265:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_23266:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_23263
	btr QWORD [rdi],0
	jmp LB_23264
LB_23263:
	bts QWORD [rdi],0
LB_23264:
	mov r13,r10
	bt r12,4
	jc LB_23271
	btr r12,0
	jmp LB_23272
LB_23271:
	bts r12,0
LB_23272:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_23269
	btr QWORD [rdi],1
	jmp LB_23270
LB_23269:
	bts QWORD [rdi],1
LB_23270:
	mov rsi,1
	bt r12,1
	jc LB_23261
	mov rsi,0
	bt r14,0
	jc LB_23261
	jmp LB_23262
LB_23261:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_23262:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23259
	btr QWORD [rdi],1
	jmp LB_23260
LB_23259:
	bts QWORD [rdi],1
LB_23260:
	mov r8,0
	bts r12,2
	ret
LB_23273:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23275
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23274
LB_23275:
	add rsp,8
	ret
LB_23276:
	add rsp,96
	pop r14
LB_23274:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_23089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23393
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23381
LB_23393:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_23401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_23401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_23401
	jmp LB_23402
LB_23401:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23399
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23399:
	jmp LB_23381
LB_23402:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_23088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23406
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23407
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23407:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23408
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23408:
	jmp LB_23381
LB_23406:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_23090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23413
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23414
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23414:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23415
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23415:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23416:
	jmp LB_23381
LB_23413:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23388
	btr r12,3
	jmp LB_23389
LB_23388:
	bts r12,3
LB_23389:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23386
	btr r12,2
	jmp LB_23387
LB_23386:
	bts r12,2
LB_23387:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23384
	btr r12,1
	jmp LB_23385
LB_23384:
	bts r12,1
LB_23385:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23382
	btr r12,0
	jmp LB_23383
LB_23382:
	bts r12,0
LB_23383:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_23378
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_23418
	btr r12,4
	jmp LB_23419
LB_23418:
	bts r12,4
LB_23419:
	mov r14,r8
	bt r12,2
	jc LB_23420
	btr r12,1
	jmp LB_23421
LB_23420:
	bts r12,1
LB_23421:
	mov r11,r9
	bt r12,3
	jc LB_23422
	btr r12,5
	jmp LB_23423
LB_23422:
	bts r12,5
LB_23423:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_23426
	btr r12,6
	jmp LB_23427
LB_23426:
	bts r12,6
LB_23427:
	mov r8,rcx
	bt r12,6
	jc LB_23424
	btr r12,2
	jmp LB_23425
LB_23424:
	bts r12,2
LB_23425:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23430
	btr r12,6
	jmp LB_23431
LB_23430:
	bts r12,6
LB_23431:
	mov r9,rcx
	bt r12,6
	jc LB_23428
	btr r12,3
	jmp LB_23429
LB_23428:
	bts r12,3
LB_23429:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_23123 : %_23123
 ; {>  %_23120~1':_r64 %_23121~2':_r64 %_23119~0':_r64 %_23122~3':(_lst)◂(_p23085) }
; 	» 0xr2 _ ⊢ 4' : %_23123
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f34 { %_23123 %_23119 } ⊢ { %_23124 %_23125 } : { %_23124 %_23125 }
 ; {>  %_23120~1':_r64 %_23123~4':_r64 %_23121~2':_r64 %_23119~0':_r64 %_23122~3':(_lst)◂(_p23085) }
	add r10,r13
; _f34 { %_23124 %_23120 } ⊢ { %_23126 %_23127 } : { %_23126 %_23127 }
 ; {>  %_23120~1':_r64 %_23124~4':_r64 %_23125~0':_r64 %_23121~2':_r64 %_23122~3':(_lst)◂(_p23085) }
	add r10,r14
; _f23086 %_23126 ⊢ %_23128 : %_23128
 ; {>  %_23125~0':_r64 %_23126~4':_r64 %_23121~2':_r64 %_23127~1':_r64 %_23122~3':(_lst)◂(_p23085) }
; _f23086 4' ⊢ °0◂4'
; _cns { %_23128 %_23122 } ⊢ %_23129 : %_23129
 ; {>  %_23125~0':_r64 %_23121~2':_r64 %_23127~1':_r64 %_23128~°0◂4':_p23085 %_23122~3':(_lst)◂(_p23085) }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_23121 %_23129 } ⊢ %_23130 : %_23130
 ; {>  %_23125~0':_r64 %_23129~°0◂{ °0◂4' 3' }:(_lst)◂(_p23085) %_23121~2':_r64 %_23127~1':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_23130
 ; {>  %_23130~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p23085) }) %_23125~0':_r64 %_23127~1':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_23356
	mov rdi,r13
	call dlt
LB_23356:
	bt r12,1
	jc LB_23357
	mov rdi,r14
	call dlt
LB_23357:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_23358
	btr r12,0
	jmp LB_23359
LB_23358:
	bts r12,0
LB_23359:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_23362
	btr r12,1
	jmp LB_23363
LB_23362:
	bts r12,1
LB_23363:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23360
	btr QWORD [rdi],0
	jmp LB_23361
LB_23360:
	bts QWORD [rdi],0
LB_23361:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_23372
	btr r12,2
	jmp LB_23373
LB_23372:
	bts r12,2
LB_23373:
	mov rsi,1
	bt r12,2
	jc LB_23370
	mov rsi,0
	bt r8,0
	jc LB_23370
	jmp LB_23371
LB_23370:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_23371:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_23368
	btr QWORD [rdi],0
	jmp LB_23369
LB_23368:
	bts QWORD [rdi],0
LB_23369:
	mov r8,r13
	bt r12,0
	jc LB_23376
	btr r12,2
	jmp LB_23377
LB_23376:
	bts r12,2
LB_23377:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_23374
	btr QWORD [rdi],1
	jmp LB_23375
LB_23374:
	bts QWORD [rdi],1
LB_23375:
	mov rsi,1
	bt r12,1
	jc LB_23366
	mov rsi,0
	bt r14,0
	jc LB_23366
	jmp LB_23367
LB_23366:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_23367:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23364
	btr QWORD [rdi],1
	jmp LB_23365
LB_23364:
	bts QWORD [rdi],1
LB_23365:
	mov r8,0
	bts r12,2
	ret
LB_23378:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23380
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23379
LB_23380:
	add rsp,8
	ret
LB_23381:
	add rsp,64
	pop r14
LB_23379:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_23088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23503
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23495
LB_23503:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_23090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23508
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23509
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23509:
	jmp LB_23495
LB_23508:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23498
	btr r12,1
	jmp LB_23499
LB_23498:
	bts r12,1
LB_23499:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23496
	btr r12,0
	jmp LB_23497
LB_23496:
	bts r12,0
LB_23497:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23492
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_23511
	btr r12,3
	jmp LB_23512
LB_23511:
	bts r12,3
LB_23512:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_23515
	btr r12,4
	jmp LB_23516
LB_23515:
	bts r12,4
LB_23516:
	mov r14,r10
	bt r12,4
	jc LB_23513
	btr r12,1
	jmp LB_23514
LB_23513:
	bts r12,1
LB_23514:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_23519
	btr r12,4
	jmp LB_23520
LB_23519:
	bts r12,4
LB_23520:
	mov r8,r10
	bt r12,4
	jc LB_23517
	btr r12,2
	jmp LB_23518
LB_23517:
	bts r12,2
LB_23518:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f34 { %_23132 %_23131 } ⊢ { %_23134 %_23135 } : { %_23134 %_23135 }
 ; {>  %_23132~1':_r64 %_23133~2':(_lst)◂(_p23085) %_23131~0':_r64 }
	add r14,r13
MTC_LB_23432:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23433
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
	jnc LB_23434
	bt QWORD [rax],0
	jc LB_23435
	btr r12,5
	jmp LB_23436
LB_23435:
	bts r12,5
LB_23436:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23434:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_23439
	btr r12,6
	jmp LB_23440
LB_23439:
	bts r12,6
LB_23440:
	mov r9,rcx
	bt r12,6
	jc LB_23437
	btr r12,3
	jmp LB_23438
LB_23437:
	bts r12,3
LB_23438:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23443
	btr r12,6
	jmp LB_23444
LB_23443:
	bts r12,6
LB_23444:
	mov r10,rcx
	bt r12,6
	jc LB_23441
	btr r12,4
	jmp LB_23442
LB_23441:
	bts r12,4
LB_23442:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23433
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
	jnc LB_23445
	bt QWORD [rax],0
	jc LB_23446
	btr r12,6
	jmp LB_23447
LB_23446:
	bts r12,6
LB_23447:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23445:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_23448
	btr r12,5
	jmp LB_23449
LB_23448:
	bts r12,5
LB_23449:
LB_23450:
	cmp r15,0
	jz LB_23451
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23450
LB_23451:
; _f34 { %_23138 %_23135 } ⊢ { %_23139 %_23140 } : { %_23139 %_23140 }
 ; {>  %_23138~5':_r64 %_23137~4':(_lst)◂(_p23085) %_23134~1':_r64 %_23135~0':_r64 }
	add r11,r13
; _f23087 %_23139 ⊢ %_23141 : %_23141
 ; {>  %_23139~5':_r64 %_23137~4':(_lst)◂(_p23085) %_23140~0':_r64 %_23134~1':_r64 }
; _f23087 5' ⊢ °1◂5'
; _cns { %_23141 %_23137 } ⊢ %_23142 : %_23142
 ; {>  %_23141~°1◂5':_p23085 %_23137~4':(_lst)◂(_p23085) %_23140~0':_r64 %_23134~1':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_23134 %_23142 } ⊢ %_23143 : %_23143
 ; {>  %_23142~°0◂{ °1◂5' 4' }:(_lst)◂(_p23085) %_23140~0':_r64 %_23134~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_23143
 ; {>  %_23140~0':_r64 %_23143~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p23085) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_23452
	mov rdi,r13
	call dlt
LB_23452:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_23455
	btr r12,0
	jmp LB_23456
LB_23455:
	bts r12,0
LB_23456:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_23453
	btr QWORD [rdi],0
	jmp LB_23454
LB_23453:
	bts QWORD [rdi],0
LB_23454:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_23465
	btr r12,1
	jmp LB_23466
LB_23465:
	bts r12,1
LB_23466:
	mov rsi,1
	bt r12,1
	jc LB_23463
	mov rsi,0
	bt r14,0
	jc LB_23463
	jmp LB_23464
LB_23463:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_23464:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23461
	btr QWORD [rdi],0
	jmp LB_23462
LB_23461:
	bts QWORD [rdi],0
LB_23462:
	mov r14,r10
	bt r12,4
	jc LB_23469
	btr r12,1
	jmp LB_23470
LB_23469:
	bts r12,1
LB_23470:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23467
	btr QWORD [rdi],1
	jmp LB_23468
LB_23467:
	bts QWORD [rdi],1
LB_23468:
	mov rsi,1
	bt r12,0
	jc LB_23459
	mov rsi,0
	bt r13,0
	jc LB_23459
	jmp LB_23460
LB_23459:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_23460:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_23457
	btr QWORD [rdi],1
	jmp LB_23458
LB_23457:
	bts QWORD [rdi],1
LB_23458:
	mov r8,0
	bts r12,2
	ret
MTC_LB_23433:
	mov r15,0
LB_23472:
	cmp r15,0
	jz LB_23473
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23472
LB_23473:
; _f23087 %_23135 ⊢ %_23144 : %_23144
 ; {>  %_23133~2':(_lst)◂(_p23085) %_23134~1':_r64 %_23135~0':_r64 }
; _f23087 0' ⊢ °1◂0'
; _cns { %_23144 %_23133 } ⊢ %_23145 : %_23145
 ; {>  %_23133~2':(_lst)◂(_p23085) %_23134~1':_r64 %_23144~°1◂0':_p23085 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_23134 %_23145 } ⊢ %_23146 : %_23146
 ; {>  %_23145~°0◂{ °1◂0' 2' }:(_lst)◂(_p23085) %_23134~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_23146
 ; {>  %_23146~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p23085) }) }
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
	jc LB_23476
	btr r12,4
	jmp LB_23477
LB_23476:
	bts r12,4
LB_23477:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_23474
	btr QWORD [rdi],0
	jmp LB_23475
LB_23474:
	bts QWORD [rdi],0
LB_23475:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_23486
	btr r12,1
	jmp LB_23487
LB_23486:
	bts r12,1
LB_23487:
	mov rsi,1
	bt r12,1
	jc LB_23484
	mov rsi,0
	bt r14,0
	jc LB_23484
	jmp LB_23485
LB_23484:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_23485:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23482
	btr QWORD [rdi],0
	jmp LB_23483
LB_23482:
	bts QWORD [rdi],0
LB_23483:
	mov r14,r8
	bt r12,2
	jc LB_23490
	btr r12,1
	jmp LB_23491
LB_23490:
	bts r12,1
LB_23491:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23488
	btr QWORD [rdi],1
	jmp LB_23489
LB_23488:
	bts QWORD [rdi],1
LB_23489:
	mov rsi,1
	bt r12,4
	jc LB_23480
	mov rsi,0
	bt r10,0
	jc LB_23480
	jmp LB_23481
LB_23480:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_23481:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_23478
	btr QWORD [rdi],1
	jmp LB_23479
LB_23478:
	bts QWORD [rdi],1
LB_23479:
	mov r8,0
	bts r12,2
	ret
MTC_LB_23471:
LB_23492:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23494
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23493
LB_23494:
	add rsp,8
	ret
LB_23495:
	add rsp,32
	pop r14
LB_23493:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_23529
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_23147 : %_23147
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_23148 : %_23148
 ; {>  %_23147~°1◂{  }:(_lst)◂(t4264'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_23148
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_23148 %_23147 } ⊢ %_23149 : %_23149
 ; {>  %_23148~0':_r64 %_23147~°1◂{  }:(_lst)◂(t4264'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_23149
 ; {>  %_23149~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t4268'(0)) }) }
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
	jc LB_23523
	btr r12,1
	jmp LB_23524
LB_23523:
	bts r12,1
LB_23524:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23521
	btr QWORD [rdi],0
	jmp LB_23522
LB_23521:
	bts QWORD [rdi],0
LB_23522:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_23527
	mov rsi,0
	bt r14,0
	jc LB_23527
	jmp LB_23528
LB_23527:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_23528:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23525
	btr QWORD [rdi],1
	jmp LB_23526
LB_23525:
	bts QWORD [rdi],1
LB_23526:
	mov r8,0
	bts r12,2
	ret
LB_23529:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23531
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23530
LB_23531:
	add rsp,8
	ret
LB_23532:
	add rsp,0
	pop r14
LB_23530:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23091:
NS_E_RDI_23091:
NS_E_23091_ETR_TBL:
NS_E_23091_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_23089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23552
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23540
LB_23552:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_23560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_23560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_23560
	jmp LB_23561
LB_23560:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23558
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23558:
	jmp LB_23540
LB_23561:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_23089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23565
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23566
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23566:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23567
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23567:
	jmp LB_23540
LB_23565:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23577
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23577
	jmp LB_23578
LB_23577:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23573
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23573:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23574
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23574:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23575:
	jmp LB_23540
LB_23578:
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
	jc LB_23547
	btr r12,3
	jmp LB_23548
LB_23547:
	bts r12,3
LB_23548:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23545
	btr r12,2
	jmp LB_23546
LB_23545:
	bts r12,2
LB_23546:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23543
	btr r12,1
	jmp LB_23544
LB_23543:
	bts r12,1
LB_23544:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23541
	btr r12,0
	jmp LB_23542
LB_23541:
	bts r12,0
LB_23542:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_23537
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_23579
	btr r12,4
	jmp LB_23580
LB_23579:
	bts r12,4
LB_23580:
	mov r14,r8
	bt r12,2
	jc LB_23581
	btr r12,1
	jmp LB_23582
LB_23581:
	bts r12,1
LB_23582:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_23152 : %_23152
 ; {>  %_23151~1':_r64 %_23150~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_23152
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f34 { %_23152 %_23150 } ⊢ { %_23153 %_23154 } : { %_23153 %_23154 }
 ; {>  %_23151~1':_r64 %_23152~2':_r64 %_23150~0':_r64 }
	add r8,r13
; _f34 { %_23153 %_23151 } ⊢ { %_23155 %_23156 } : { %_23155 %_23156 }
 ; {>  %_23153~2':_r64 %_23151~1':_r64 %_23154~0':_r64 }
	add r8,r14
; _some %_23155 ⊢ %_23157 : %_23157
 ; {>  %_23155~2':_r64 %_23154~0':_r64 %_23156~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_23157
 ; {>  %_23154~0':_r64 %_23157~°0◂2':(_opn)◂(_r64) %_23156~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_23533
	mov rdi,r13
	call dlt
LB_23533:
	bt r12,1
	jc LB_23534
	mov rdi,r14
	call dlt
LB_23534:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_23535
	btr r12,3
	jmp LB_23536
LB_23535:
	bts r12,3
LB_23536:
	mov r8,0
	bts r12,2
	ret
LB_23537:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23539
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23538
LB_23539:
	add rsp,8
	ret
LB_23540:
	add rsp,64
	pop r14
LB_23538:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_23089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23608
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23592
LB_23608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_23616
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_23616
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_23616
	jmp LB_23617
LB_23616:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23614
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23614:
	jmp LB_23592
LB_23617:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_23089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23621
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23622
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23622:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23623
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23623:
	jmp LB_23592
LB_23621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_23633
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_23633
	jmp LB_23634
LB_23633:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23629
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23629:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23630
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23630:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23631
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23631:
	jmp LB_23592
LB_23634:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_23091_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23638
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23639
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23639:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23640
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23640:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23641
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23641:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23642
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23642:
	jmp LB_23592
LB_23638:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_23091_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23647
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_23648
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_23648:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23649
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23649:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23650
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23650:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23651
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23651:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23652
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23652:
	jmp LB_23592
LB_23647:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_23603
	btr r12,5
	jmp LB_23604
LB_23603:
	bts r12,5
LB_23604:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_23601
	btr r12,4
	jmp LB_23602
LB_23601:
	bts r12,4
LB_23602:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23599
	btr r12,3
	jmp LB_23600
LB_23599:
	bts r12,3
LB_23600:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23597
	btr r12,2
	jmp LB_23598
LB_23597:
	bts r12,2
LB_23598:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23595
	btr r12,1
	jmp LB_23596
LB_23595:
	bts r12,1
LB_23596:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23593
	btr r12,0
	jmp LB_23594
LB_23593:
	bts r12,0
LB_23594:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_23589
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_23654
	btr r12,6
	jmp LB_23655
LB_23654:
	bts r12,6
LB_23655:
	mov r9,r11
	bt r12,5
	jc LB_23656
	btr r12,3
	jmp LB_23657
LB_23656:
	bts r12,3
LB_23657:
	mov r11,r8
	bt r12,2
	jc LB_23658
	btr r12,5
	jmp LB_23659
LB_23658:
	bts r12,5
LB_23659:
	mov r8,r10
	bt r12,4
	jc LB_23660
	btr r12,2
	jmp LB_23661
LB_23660:
	bts r12,2
LB_23661:
	mov r10,r14
	bt r12,1
	jc LB_23662
	btr r12,4
	jmp LB_23663
LB_23662:
	bts r12,4
LB_23663:
	mov r14,r11
	bt r12,5
	jc LB_23664
	btr r12,1
	jmp LB_23665
LB_23664:
	bts r12,1
LB_23665:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_23162 : %_23162
 ; {>  %_23160~2':_r64 %_23158~0':_r64 %_23159~1':_r64 %_23161~3':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_23162
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f34 { %_23162 %_23158 } ⊢ { %_23163 %_23164 } : { %_23163 %_23164 }
 ; {>  %_23160~2':_r64 %_23158~0':_r64 %_23159~1':_r64 %_23162~4':_r64 %_23161~3':_r64 }
	add r10,r13
; _f34 { %_23163 %_23159 } ⊢ { %_23165 %_23166 } : { %_23165 %_23166 }
 ; {>  %_23163~4':_r64 %_23160~2':_r64 %_23164~0':_r64 %_23159~1':_r64 %_23161~3':_r64 }
	add r10,r14
; _f34 { %_23165 %_23160 } ⊢ { %_23167 %_23168 } : { %_23167 %_23168 }
 ; {>  %_23160~2':_r64 %_23165~4':_r64 %_23166~1':_r64 %_23164~0':_r64 %_23161~3':_r64 }
	add r10,r8
; _f34 { %_23167 %_23161 } ⊢ { %_23169 %_23170 } : { %_23169 %_23170 }
 ; {>  %_23167~4':_r64 %_23168~2':_r64 %_23166~1':_r64 %_23164~0':_r64 %_23161~3':_r64 }
	add r10,r9
; _some %_23169 ⊢ %_23171 : %_23171
 ; {>  %_23168~2':_r64 %_23170~3':_r64 %_23166~1':_r64 %_23164~0':_r64 %_23169~4':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_23171
 ; {>  %_23171~°0◂4':(_opn)◂(_r64) %_23168~2':_r64 %_23170~3':_r64 %_23166~1':_r64 %_23164~0':_r64 }
; 	∎ °0◂4'
	bt r12,2
	jc LB_23583
	mov rdi,r8
	call dlt
LB_23583:
	bt r12,3
	jc LB_23584
	mov rdi,r9
	call dlt
LB_23584:
	bt r12,1
	jc LB_23585
	mov rdi,r14
	call dlt
LB_23585:
	bt r12,0
	jc LB_23586
	mov rdi,r13
	call dlt
LB_23586:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_23587
	btr r12,3
	jmp LB_23588
LB_23587:
	bts r12,3
LB_23588:
	mov r8,0
	bts r12,2
	ret
LB_23589:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23591
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23590
LB_23591:
	add rsp,8
	ret
LB_23592:
	add rsp,96
	pop r14
LB_23590:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_23088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23680
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23672
LB_23680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_23091_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23685
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23686
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23686:
	jmp LB_23672
LB_23685:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23675
	btr r12,1
	jmp LB_23676
LB_23675:
	bts r12,1
LB_23676:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23673
	btr r12,0
	jmp LB_23674
LB_23673:
	bts r12,0
LB_23674:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_23669
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f34 { %_23172 %_23173 } ⊢ { %_23174 %_23175 } : { %_23174 %_23175 }
 ; {>  %_23173~1':_r64 %_23172~0':_r64 }
	add r13,r14
; _some %_23174 ⊢ %_23176 : %_23176
 ; {>  %_23175~1':_r64 %_23174~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_23176
 ; {>  %_23176~°0◂0':(_opn)◂(_r64) %_23175~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_23666
	mov rdi,r14
	call dlt
LB_23666:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_23667
	btr r12,3
	jmp LB_23668
LB_23667:
	bts r12,3
LB_23668:
	mov r8,0
	bts r12,2
	ret
LB_23669:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_23671
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23670
LB_23671:
	add rsp,8
	ret
LB_23672:
	add rsp,32
	pop r14
LB_23670:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23710:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_23710:
MTC_LB_23711:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23712
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
	jnc LB_23713
	bt QWORD [rax],0
	jc LB_23714
	btr r12,7
	jmp LB_23715
LB_23714:
	bts r12,7
LB_23715:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23713:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_23718
	btr r12,8
	jmp LB_23719
LB_23718:
	bts r12,8
LB_23719:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23716
	btr r12,5
	jmp LB_23717
LB_23716:
	bts r12,5
LB_23717:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_23722
	btr r12,8
	jmp LB_23723
LB_23722:
	bts r12,8
LB_23723:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23720
	btr r12,6
	jmp LB_23721
LB_23720:
	bts r12,6
LB_23721:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23724:
	cmp r15,0
	jz LB_23725
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23724
LB_23725:
MTC_LB_23726:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23727
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
	jnc LB_23728
	bt QWORD [rax],0
	jc LB_23729
	btr r12,7
	jmp LB_23730
LB_23729:
	bts r12,7
LB_23730:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23728:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_23731
	btr r12,4
	jmp LB_23732
LB_23731:
	bts r12,4
LB_23732:
LB_23733:
	cmp r15,0
	jz LB_23734
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23733
LB_23734:
; _f36 %_23695 ⊢ { %_23696 %_23697 } : { %_23696 %_23697 }
 ; {>  %_23689~1':_r64 %_23688~0':_stg %_23690~2':_stg %_23691~3':_r64 %_23695~4':_r64 %_23694~6':(_lst)◂(_p23085) }
	mov r11,r10
	bts r12,5
; _f18 { %_23697 %_23688 %_23689 %_23690 %_23691 } ⊢ { %_23698 %_23699 %_23700 %_23701 %_23702 } : { %_23698 %_23699 %_23700 %_23701 %_23702 }
 ; {>  %_23689~1':_r64 %_23688~0':_stg %_23690~2':_stg %_23696~4':_r64 %_23697~5':_r64 %_23691~3':_r64 %_23694~6':(_lst)◂(_p23085) }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_23739
	btr r12,4
	jmp LB_23740
LB_23739:
	bts r12,4
LB_23740:
	mov r9,r8
	bt r12,2
	jc LB_23741
	btr r12,3
	jmp LB_23742
LB_23741:
	bts r12,3
LB_23742:
	mov r8,r14
	bt r12,1
	jc LB_23743
	btr r12,2
	jmp LB_23744
LB_23743:
	bts r12,2
LB_23744:
	mov r14,r13
	bt r12,0
	jc LB_23745
	btr r12,1
	jmp LB_23746
LB_23745:
	bts r12,1
LB_23746:
	mov r13,r11
	bt r12,5
	jc LB_23747
	btr r12,0
	jmp LB_23748
LB_23747:
	bts r12,0
LB_23748:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_23749
	btr r12,5
	jmp LB_23750
LB_23749:
	bts r12,5
LB_23750:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_23737
	btr r12,6
	jmp LB_23738
LB_23737:
	bts r12,6
LB_23738:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_23735
	btr r12,4
	jmp LB_23736
LB_23735:
	bts r12,4
LB_23736:
	add rsp,24
; _f23710 { %_23699 %_23700 %_23701 %_23702 %_23694 } ⊢ { %_23703 %_23704 } : { %_23703 %_23704 }
 ; {>  %_23702~5':_r64 %_23700~2':_r64 %_23701~3':_stg %_23699~1':_stg %_23696~4':_r64 %_23698~0':_r64 %_23694~6':(_lst)◂(_p23085) }
; _f23710 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_23755
	btr r12,0
	jmp LB_23756
LB_23755:
	bts r12,0
LB_23756:
	mov r14,r8
	bt r12,2
	jc LB_23757
	btr r12,1
	jmp LB_23758
LB_23757:
	bts r12,1
LB_23758:
	mov r8,r9
	bt r12,3
	jc LB_23759
	btr r12,2
	jmp LB_23760
LB_23759:
	bts r12,2
LB_23760:
	mov r9,r11
	bt r12,5
	jc LB_23761
	btr r12,3
	jmp LB_23762
LB_23761:
	bts r12,3
LB_23762:
	mov r10,rcx
	bt r12,6
	jc LB_23763
	btr r12,4
	jmp LB_23764
LB_23763:
	bts r12,4
LB_23764:
	call NS_E_23710
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_23765
	btr r12,2
	jmp LB_23766
LB_23765:
	bts r12,2
LB_23766:
	mov r14,r13
	bt r12,0
	jc LB_23767
	btr r12,1
	jmp LB_23768
LB_23767:
	bts r12,1
LB_23768:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_23753
	btr r12,4
	jmp LB_23754
LB_23753:
	bts r12,4
LB_23754:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23751
	btr r12,0
	jmp LB_23752
LB_23751:
	bts r12,0
LB_23752:
	add rsp,24
; ∎ { %_23703 %_23704 }
 ; {>  %_23704~2':_stg %_23703~1':_stg %_23696~4':_r64 %_23698~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_23769
	mov rdi,r10
	call dlt
LB_23769:
	bt r12,0
	jc LB_23770
	mov rdi,r13
	call dlt
LB_23770:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_23771
	btr r12,0
	jmp LB_23772
LB_23771:
	bts r12,0
LB_23772:
	mov r14,r8
	bt r12,2
	jc LB_23773
	btr r12,1
	jmp LB_23774
LB_23773:
	bts r12,1
LB_23774:
	ret
MTC_LB_23727:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23775
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
	jnc LB_23776
	bt QWORD [rax],0
	jc LB_23777
	btr r12,7
	jmp LB_23778
LB_23777:
	bts r12,7
LB_23778:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23776:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_23779
	btr r12,4
	jmp LB_23780
LB_23779:
	bts r12,4
LB_23780:
LB_23781:
	cmp r15,0
	jz LB_23782
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23781
LB_23782:
; _f34 { %_23689 %_23705 } ⊢ { %_23706 %_23707 } : { %_23706 %_23707 }
 ; {>  %_23689~1':_r64 %_23688~0':_stg %_23705~4':_r64 %_23690~2':_stg %_23691~3':_r64 %_23694~6':(_lst)◂(_p23085) }
	add r14,r10
; _f23710 { %_23688 %_23706 %_23690 %_23691 %_23694 } ⊢ { %_23708 %_23709 } : { %_23708 %_23709 }
 ; {>  %_23688~0':_stg %_23707~4':_r64 %_23690~2':_stg %_23691~3':_r64 %_23694~6':(_lst)◂(_p23085) %_23706~1':_r64 }
; _f23710 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_23785
	btr r12,4
	jmp LB_23786
LB_23785:
	bts r12,4
LB_23786:
	call NS_E_23710
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_23783
	btr r12,4
	jmp LB_23784
LB_23783:
	bts r12,4
LB_23784:
	add rsp,16
; ∎ { %_23708 %_23709 }
 ; {>  %_23709~1':_stg %_23707~4':_r64 %_23708~0':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_23787
	mov rdi,r10
	call dlt
LB_23787:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_23775:
MTC_LB_23712:
	mov r15,0
LB_23789:
	cmp r15,0
	jz LB_23790
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23789
LB_23790:
; ∎ { %_23688 %_23690 }
 ; {>  %_23689~1':_r64 %_23688~0':_stg %_23690~2':_stg %_23691~3':_r64 %_23692~4':(_lst)◂(_p23085) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_23791
	mov rdi,r14
	call dlt
LB_23791:
	bt r12,3
	jc LB_23792
	mov rdi,r9
	call dlt
LB_23792:
	bt r12,4
	jc LB_23793
	mov rdi,r10
	call dlt
LB_23793:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_23794
	btr r12,1
	jmp LB_23795
LB_23794:
	bts r12,1
LB_23795:
	ret
MTC_LB_23788:
NS_E_23813:
; 	|» 0'
NS_E_RDI_23813:
; » 0xr0 |~ {  } ⊢ %_23797 : %_23797
 ; {>  %_23796~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_23797
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f23090 { %_23796 %_23797 } ⊢ { %_23798 %_23799 %_23800 } : { %_23798 %_23799 %_23800 }
 ; {>  %_23797~1':_r64 %_23796~0':_stg }
; _f23090 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_23090
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_23814
	btr r12,4
	jmp LB_23815
LB_23814:
	bts r12,4
LB_23815:
	mov r8,r9
	bt r12,3
	jc LB_23818
	btr r12,2
	jmp LB_23819
LB_23818:
	bts r12,2
LB_23819:
	mov rsi,1
	bt r12,2
	jc LB_23816
	mov rsi,0
	bt r8,0
	jc LB_23816
	jmp LB_23817
LB_23816:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_23817:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_23820:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23821
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
	jnc LB_23822
	bt QWORD [rax],0
	jc LB_23823
	btr r12,5
	jmp LB_23824
LB_23823:
	bts r12,5
LB_23824:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23822:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_23827
	btr r12,6
	jmp LB_23828
LB_23827:
	bts r12,6
LB_23828:
	mov r9,rcx
	bt r12,6
	jc LB_23825
	btr r12,3
	jmp LB_23826
LB_23825:
	bts r12,3
LB_23826:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23831
	btr r12,6
	jmp LB_23832
LB_23831:
	bts r12,6
LB_23832:
	mov r10,rcx
	bt r12,6
	jc LB_23829
	btr r12,4
	jmp LB_23830
LB_23829:
	bts r12,4
LB_23830:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23833:
	cmp r15,0
	jz LB_23834
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23833
LB_23834:
; _f21 { %_23801 %_23802 } ⊢ { %_23803 %_23804 } : { %_23803 %_23804 }
 ; {>  %_23799~1':_r64 %_23798~0':_stg %_23802~4':(_lst)◂(_p23085) %_23801~3':_r64 }
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
	jc LB_23841
	btr r12,1
	jmp LB_23842
LB_23841:
	bts r12,1
LB_23842:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23839
	btr QWORD [rdi],0
	jmp LB_23840
LB_23839:
	bts QWORD [rdi],0
LB_23840:
	mov r14,r10
	bt r12,4
	jc LB_23845
	btr r12,1
	jmp LB_23846
LB_23845:
	bts r12,1
LB_23846:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23843
	btr QWORD [rdi],1
	jmp LB_23844
LB_23843:
	bts QWORD [rdi],1
LB_23844:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 2' 3' }
; 0' ⊢ { 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_23849
	btr r12,1
	jmp LB_23850
LB_23849:
	bts r12,1
LB_23850:
	mov r8,r14
	bt r12,1
	jc LB_23847
	btr r12,2
	jmp LB_23848
LB_23847:
	bts r12,2
LB_23848:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_23853
	btr r12,1
	jmp LB_23854
LB_23853:
	bts r12,1
LB_23854:
	mov r9,r14
	bt r12,1
	jc LB_23851
	btr r12,3
	jmp LB_23852
LB_23851:
	bts r12,3
LB_23852:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23837
	btr r12,1
	jmp LB_23838
LB_23837:
	bts r12,1
LB_23838:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23835
	btr r12,0
	jmp LB_23836
LB_23835:
	bts r12,0
LB_23836:
	add rsp,24
; _f14 %_23803 ⊢ { %_23805 %_23806 } : { %_23805 %_23806 }
 ; {>  %_23804~3':(_lst)◂(_p23085) %_23803~2':_r64 %_23799~1':_r64 %_23798~0':_stg }
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
	jc LB_23861
	btr r12,0
	jmp LB_23862
LB_23861:
	bts r12,0
LB_23862:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_23863
	btr r12,2
	jmp LB_23864
LB_23863:
	bts r12,2
LB_23864:
	mov r10,r14
	bt r12,1
	jc LB_23865
	btr r12,4
	jmp LB_23866
LB_23865:
	bts r12,4
LB_23866:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_23859
	btr r12,3
	jmp LB_23860
LB_23859:
	bts r12,3
LB_23860:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23857
	btr r12,1
	jmp LB_23858
LB_23857:
	bts r12,1
LB_23858:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23855
	btr r12,0
	jmp LB_23856
LB_23855:
	bts r12,0
LB_23856:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_23807 : %_23807
 ; {>  %_23804~3':(_lst)◂(_p23085) %_23805~2':_r64 %_23799~1':_r64 %_23798~0':_stg %_23806~4':_stg }
; 	» 0xr0 _ ⊢ 5' : %_23807
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_23808 : %_23808
 ; {>  %_23804~3':(_lst)◂(_p23085) %_23807~5':_r64 %_23805~2':_r64 %_23799~1':_r64 %_23798~0':_stg %_23806~4':_stg }
; 	» 0xr0 _ ⊢ 6' : %_23808
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f23710 { %_23798 %_23807 %_23806 %_23808 %_23804 } ⊢ { %_23809 %_23810 } : { %_23809 %_23810 }
 ; {>  %_23804~3':(_lst)◂(_p23085) %_23808~6':_r64 %_23807~5':_r64 %_23805~2':_r64 %_23799~1':_r64 %_23798~0':_stg %_23806~4':_stg }
; _f23710 { 0' 5' 4' 6' 3' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 4' 6' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_23871
	btr r12,1
	jmp LB_23872
LB_23871:
	bts r12,1
LB_23872:
	mov r8,r10
	bt r12,4
	jc LB_23873
	btr r12,2
	jmp LB_23874
LB_23873:
	bts r12,2
LB_23874:
	mov r10,r9
	bt r12,3
	jc LB_23875
	btr r12,4
	jmp LB_23876
LB_23875:
	bts r12,4
LB_23876:
	mov r9,rcx
	bt r12,6
	jc LB_23877
	btr r12,3
	jmp LB_23878
LB_23877:
	bts r12,3
LB_23878:
	call NS_E_23710
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_23879
	btr r12,3
	jmp LB_23880
LB_23879:
	bts r12,3
LB_23880:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_23869
	btr r12,2
	jmp LB_23870
LB_23869:
	bts r12,2
LB_23870:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_23867
	btr r12,1
	jmp LB_23868
LB_23867:
	bts r12,1
LB_23868:
	add rsp,24
; _some %_23810 ⊢ %_23811 : %_23811
 ; {>  %_23810~3':_stg %_23809~0':_stg %_23805~2':_r64 %_23799~1':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_23809 %_23811 }
 ; {>  %_23809~0':_stg %_23805~2':_r64 %_23799~1':_r64 %_23811~°0◂3':(_opn)◂(_stg) }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_23881
	mov rdi,r8
	call dlt
LB_23881:
	bt r12,1
	jc LB_23882
	mov rdi,r14
	call dlt
LB_23882:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_23885
	btr r12,1
	jmp LB_23886
LB_23885:
	bts r12,1
LB_23886:
	mov rsi,1
	bt r12,1
	jc LB_23883
	mov rsi,0
	bt r14,0
	jc LB_23883
	jmp LB_23884
LB_23883:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_23884:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_23821:
	mov r15,0
LB_23888:
	cmp r15,0
	jz LB_23889
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23888
LB_23889:
; _none {  } ⊢ %_23812 : %_23812
 ; {>  %_23799~1':_r64 %_23798~0':_stg %_23800~2':(_opn)◂({ _r64 (_lst)◂(_p23085) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_23798 %_23812 }
 ; {>  %_23812~°1◂{  }:(_opn)◂(t4453'(0)) %_23799~1':_r64 %_23798~0':_stg %_23800~2':(_opn)◂({ _r64 (_lst)◂(_p23085) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_23890
	mov rdi,r14
	call dlt
LB_23890:
	bt r12,2
	jc LB_23891
	mov rdi,r8
	call dlt
LB_23891:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_23892
	mov rsi,0
	bt r14,0
	jc LB_23892
	jmp LB_23893
LB_23892:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_23893:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_23887:
NS_E_23899:
NS_E_RDI_23899:
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
; _f23813 %_23894 ⊢ { %_23895 %_23896 } : { %_23895 %_23896 }
 ; {>  %_23894~0':_stg }
; _f23813 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_23813
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_23895 %_23896 } ⊢ { %_23897 %_23898 } : { %_23897 %_23898 }
 ; {>  %_23895~0':_stg %_23896~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_23900
	btr r12,2
	jmp LB_23901
LB_23900:
	bts r12,2
LB_23901:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_23904
	btr r12,3
	jmp LB_23905
LB_23904:
	bts r12,3
LB_23905:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_23902
	btr QWORD [rdi],0
	jmp LB_23903
LB_23902:
	bts QWORD [rdi],0
LB_23903:
	mov r9,r14
	bt r12,1
	jc LB_23908
	btr r12,3
	jmp LB_23909
LB_23908:
	bts r12,3
LB_23909:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_23906
	btr QWORD [rdi],1
	jmp LB_23907
LB_23906:
	bts QWORD [rdi],1
LB_23907:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_23910
	btr r12,2
	jmp LB_23911
LB_23910:
	bts r12,2
LB_23911:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_23914
	btr r12,3
	jmp LB_23915
LB_23914:
	bts r12,3
LB_23915:
	mov r13,r9
	bt r12,3
	jc LB_23912
	btr r12,0
	jmp LB_23913
LB_23912:
	bts r12,0
LB_23913:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_23918
	btr r12,3
	jmp LB_23919
LB_23918:
	bts r12,3
LB_23919:
	mov r14,r9
	bt r12,3
	jc LB_23916
	btr r12,1
	jmp LB_23917
LB_23916:
	bts r12,1
LB_23917:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_23897~0':_stg %_23898~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_23920
	mov rdi,r13
	call dlt
LB_23920:
	bt r12,1
	jc LB_23921
	mov rdi,r14
	call dlt
LB_23921:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_23923:
NS_E_RDI_23923:
NS_E_23923_ETR_TBL:
NS_E_23923_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_23940
LB_23939:
	add r14,1
LB_23940:
	cmp r14,r10
	jge LB_23941
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23939
	cmp al,10
	jz LB_23939
	cmp al,32
	jz LB_23939
LB_23941:
	push r10
	call NS_E_23021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23942
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23926
LB_23942:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_23945
LB_23944:
	add r14,1
LB_23945:
	cmp r14,r10
	jge LB_23946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23944
	cmp al,10
	jz LB_23944
	cmp al,32
	jz LB_23944
LB_23946:
	add r14,1
	cmp r14,r10
	jg LB_23950
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_23950
	jmp LB_23951
LB_23950:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23948
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23948:
	jmp LB_23926
LB_23951:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_23953
LB_23952:
	add r14,1
LB_23953:
	cmp r14,r10
	jge LB_23954
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23952
	cmp al,10
	jz LB_23952
	cmp al,32
	jz LB_23952
LB_23954:
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23955
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23956
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23956:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23957
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23957:
	jmp LB_23926
LB_23955:
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
	jc LB_23935
	btr QWORD [rdi],2
LB_23935:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23936
	btr QWORD [rdi],1
LB_23936:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23937
	btr QWORD [rdi],0
LB_23937:
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
LB_23926:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_23931
LB_23930:
	add r14,1
LB_23931:
	cmp r14,r10
	jge LB_23932
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23930
	cmp al,32
	jz LB_23930
LB_23932:
	push r10
	call NS_E_23021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23933
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23927
LB_23933:
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
	jc LB_23928
	btr QWORD [rdi],0
LB_23928:
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
LB_23927:
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
NS_E_23960:
NS_E_RDI_23960:
NS_E_23960_ETR_TBL:
NS_E_23960_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_22453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23987
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23964
LB_23987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_23995
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_23995
	jmp LB_23996
LB_23995:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23993:
	jmp LB_23964
LB_23996:
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
	jc LB_23981
	btr QWORD [rdi],1
LB_23981:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23982
	btr QWORD [rdi],0
LB_23982:
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
LB_23964:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_22524_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23979
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23965
LB_23979:
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
	jc LB_23974
	btr QWORD [rdi],0
LB_23974:
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
LB_23965:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23972
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23966
LB_23972:
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
	jc LB_23967
	btr QWORD [rdi],0
LB_23967:
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
LB_23966:
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
NS_E_23998:
NS_E_RDI_23998:
NS_E_23998_ETR_TBL:
NS_E_23998_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_24005
LB_24004:
	add r14,1
LB_24005:
	cmp r14,r10
	jge LB_24006
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24004
	cmp al,32
	jz LB_24004
LB_24006:
	add r14,1
	cmp r14,r10
	jg LB_24009
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_24009
	jmp LB_24010
LB_24009:
	jmp LB_24000
LB_24010:
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
LB_24015:
	jmp LB_24012
LB_24011:
	add r14,1
LB_24012:
	cmp r14,r10
	jge LB_24013
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24011
	cmp al,32
	jz LB_24011
LB_24013:
	add r14,1
	cmp r14,r10
	jg LB_24014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_24014
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
	jmp LB_24015
LB_24014:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24001
	btr QWORD [rdi],1
LB_24001:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24002
	btr QWORD [rdi],0
LB_24002:
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
LB_24000:
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
NS_E_24017:
NS_E_RDI_24017:
NS_E_24017_ETR_TBL:
NS_E_24017_TBL:
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
LB_24193:
	jmp LB_24190
LB_24189:
	add r14,1
LB_24190:
	cmp r14,r10
	jge LB_24191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24189
	cmp al,10
	jz LB_24189
	cmp al,32
	jz LB_24189
LB_24191:
	push r10
	push rsi
	call NS_E_24019_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24192
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24194
	bts QWORD [rax],0
LB_24194:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24193
LB_24192:
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
	jc LB_24187
	btr QWORD [rdi],0
LB_24187:
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
LB_24186:
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
NS_E_24019:
NS_E_RDI_24019:
NS_E_24019_ETR_TBL:
NS_E_24019_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_24504
LB_24503:
	add r14,1
LB_24504:
	cmp r14,r10
	jge LB_24505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24503
	cmp al,10
	jz LB_24503
	cmp al,32
	jz LB_24503
LB_24505:
	add r14,7
	cmp r14,r10
	jg LB_24508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_24508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_24508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_24508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_24508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_24508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_24508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_24508
	jmp LB_24509
LB_24508:
	jmp LB_24195
LB_24509:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_24492
LB_24491:
	add r14,1
LB_24492:
	cmp r14,r10
	jge LB_24493
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24491
	cmp al,10
	jz LB_24491
	cmp al,32
	jz LB_24491
LB_24493:
	push r10
	call NS_E_24069_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24494
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24495
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24495:
	jmp LB_24196
LB_24494:
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
LB_24501:
	jmp LB_24498
LB_24497:
	add r14,1
LB_24498:
	cmp r14,r10
	jge LB_24499
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24497
	cmp al,10
	jz LB_24497
	cmp al,32
	jz LB_24497
LB_24499:
	push r10
	push rsi
	call NS_E_24069_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24500
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24502
	bts QWORD [rax],0
LB_24502:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24501
LB_24500:
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
	jc LB_24487
	btr QWORD [rdi],2
LB_24487:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24488
	btr QWORD [rdi],1
LB_24488:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24489
	btr QWORD [rdi],0
LB_24489:
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
LB_24196:
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
LB_24195:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_24481
LB_24480:
	add r14,1
LB_24481:
	cmp r14,r10
	jge LB_24482
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24480
	cmp al,10
	jz LB_24480
	cmp al,32
	jz LB_24480
LB_24482:
	add r14,4
	cmp r14,r10
	jg LB_24485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_24485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_24485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_24485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_24485
	jmp LB_24486
LB_24485:
	jmp LB_24197
LB_24486:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_24475
LB_24474:
	add r14,1
LB_24475:
	cmp r14,r10
	jge LB_24476
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24474
	cmp al,10
	jz LB_24474
	cmp al,32
	jz LB_24474
LB_24476:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24477
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24478
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24478:
	jmp LB_24198
LB_24477:
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
	jmp LB_24228
LB_24227:
	add r14,1
LB_24228:
	cmp r14,r10
	jge LB_24229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24227
	cmp al,10
	jz LB_24227
	cmp al,32
	jz LB_24227
LB_24229:
	add r14,1
	cmp r14,r10
	jg LB_24232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_24232
	jmp LB_24233
LB_24232:
	jmp LB_24199
LB_24233:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_24222
LB_24221:
	add r14,1
LB_24222:
	cmp r14,r10
	jge LB_24223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24221
	cmp al,10
	jz LB_24221
	cmp al,32
	jz LB_24221
LB_24223:
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24224
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24225
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24225:
	jmp LB_24200
LB_24224:
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
	jc LB_24215
	btr QWORD [rdi],1
LB_24215:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24216
	btr QWORD [rdi],0
LB_24216:
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
	jc LB_24218
	btr QWORD [rdi],1
LB_24218:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24219
	btr QWORD [rdi],0
LB_24219:
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
LB_24200:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24212
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24212:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24213
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24213:
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
LB_24199:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_24208
LB_24207:
	add r14,1
LB_24208:
	cmp r14,r10
	jge LB_24209
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24207
	cmp al,10
	jz LB_24207
	cmp al,32
	jz LB_24207
LB_24209:
	push r10
	call NS_E_24021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24210
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24201
LB_24210:
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
	jc LB_24202
	btr QWORD [rdi],0
LB_24202:
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
	jc LB_24204
	btr QWORD [rdi],1
LB_24204:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24205
	btr QWORD [rdi],0
LB_24205:
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
LB_24201:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24471
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24471:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24472:
LB_24198:
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
LB_24197:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_24465
LB_24464:
	add r14,1
LB_24465:
	cmp r14,r10
	jge LB_24466
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24464
	cmp al,10
	jz LB_24464
	cmp al,32
	jz LB_24464
LB_24466:
	add r14,2
	cmp r14,r10
	jg LB_24469
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_24469
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_24469
	jmp LB_24470
LB_24469:
	jmp LB_24234
LB_24470:
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
	jmp LB_24367
LB_24366:
	add r14,1
LB_24367:
	cmp r14,r10
	jge LB_24368
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24366
	cmp al,10
	jz LB_24366
	cmp al,32
	jz LB_24366
LB_24368:
	add r14,1
	cmp r14,r10
	jg LB_24371
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_24371
	jmp LB_24372
LB_24371:
	jmp LB_24236
LB_24372:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_24329
LB_24328:
	add r14,1
LB_24329:
	cmp r14,r10
	jge LB_24330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24328
	cmp al,10
	jz LB_24328
	cmp al,32
	jz LB_24328
LB_24330:
	add r14,1
	cmp r14,r10
	jg LB_24334
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_24334
	jmp LB_24335
LB_24334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24332
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24332:
	jmp LB_24237
LB_24335:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_24337
LB_24336:
	add r14,1
LB_24337:
	cmp r14,r10
	jge LB_24338
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24336
	cmp al,10
	jz LB_24336
	cmp al,32
	jz LB_24336
LB_24338:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24339
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24340
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24340:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24341
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24341:
	jmp LB_24237
LB_24339:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_24344
LB_24343:
	add r14,1
LB_24344:
	cmp r14,r10
	jge LB_24345
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24343
	cmp al,10
	jz LB_24343
	cmp al,32
	jz LB_24343
LB_24345:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24346
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24347
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24347:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24348
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24348:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24349
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24349:
	jmp LB_24237
LB_24346:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_24352
LB_24351:
	add r14,1
LB_24352:
	cmp r14,r10
	jge LB_24353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24351
	cmp al,10
	jz LB_24351
	cmp al,32
	jz LB_24351
LB_24353:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24354
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_24355
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_24355:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24356
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24356:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24357
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24357:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24358:
	jmp LB_24237
LB_24354:
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
LB_24364:
	jmp LB_24361
LB_24360:
	add r14,1
LB_24361:
	cmp r14,r10
	jge LB_24362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24360
	cmp al,10
	jz LB_24360
	cmp al,32
	jz LB_24360
LB_24362:
	push r10
	push rsi
	call NS_E_24023_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24363
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24365
	bts QWORD [rax],0
LB_24365:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24364
LB_24363:
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
	jc LB_24319
	btr QWORD [rdi],5
LB_24319:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_24320
	btr QWORD [rdi],4
LB_24320:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_24321
	btr QWORD [rdi],3
LB_24321:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24322
	btr QWORD [rdi],2
LB_24322:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24323
	btr QWORD [rdi],1
LB_24323:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24324
	btr QWORD [rdi],0
LB_24324:
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
	jc LB_24326
	btr QWORD [rdi],0
LB_24326:
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
LB_24237:
	add rsp,96
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24317
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24317:
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
LB_24236:
	add rsp,96
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_24313
LB_24312:
	add r14,1
LB_24313:
	cmp r14,r10
	jge LB_24314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24312
	cmp al,10
	jz LB_24312
	cmp al,32
	jz LB_24312
LB_24314:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24315
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24238
LB_24315:
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
	jmp LB_24304
LB_24303:
	add r14,1
LB_24304:
	cmp r14,r10
	jge LB_24305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24303
	cmp al,10
	jz LB_24303
	cmp al,32
	jz LB_24303
LB_24305:
	add r14,1
	cmp r14,r10
	jg LB_24308
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_24308
	jmp LB_24309
LB_24308:
	jmp LB_24239
LB_24309:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_24298
LB_24297:
	add r14,1
LB_24298:
	cmp r14,r10
	jge LB_24299
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24297
	cmp al,10
	jz LB_24297
	cmp al,32
	jz LB_24297
LB_24299:
	push r10
	call NS_E_23960_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24300
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24301
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24301:
	jmp LB_24240
LB_24300:
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
	jc LB_24290
	btr QWORD [rdi],1
LB_24290:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24291
	btr QWORD [rdi],0
LB_24291:
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
	jc LB_24295
	btr QWORD [rdi],0
LB_24295:
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
	jc LB_24293
	btr QWORD [rdi],0
LB_24293:
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
LB_24240:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24288
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24288:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24286
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24286:
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
LB_24239:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_24280
LB_24279:
	add r14,1
LB_24280:
	cmp r14,r10
	jge LB_24281
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24279
	cmp al,10
	jz LB_24279
	cmp al,32
	jz LB_24279
LB_24281:
	add r14,2
	cmp r14,r10
	jg LB_24284
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_24284
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_24284
	jmp LB_24285
LB_24284:
	jmp LB_24241
LB_24285:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_24274
LB_24273:
	add r14,1
LB_24274:
	cmp r14,r10
	jge LB_24275
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24273
	cmp al,10
	jz LB_24273
	cmp al,32
	jz LB_24273
LB_24275:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24276
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24277
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24277:
	jmp LB_24242
LB_24276:
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
	jc LB_24266
	btr QWORD [rdi],1
LB_24266:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24267
	btr QWORD [rdi],0
LB_24267:
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
	jc LB_24271
	btr QWORD [rdi],0
LB_24271:
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
	jc LB_24269
	btr QWORD [rdi],0
LB_24269:
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
LB_24242:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24264
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24264:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24262
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24262:
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
LB_24241:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg_ptn
	jmp LB_24252
LB_24251:
	add r14,1
LB_24252:
	cmp r14,r10
	jge LB_24253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24251
	cmp al,10
	jz LB_24251
	cmp al,32
	jz LB_24251
LB_24253:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24254
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24243
LB_24254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_24257
LB_24256:
	add r14,1
LB_24257:
	cmp r14,r10
	jge LB_24258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24256
	cmp al,10
	jz LB_24256
	cmp al,32
	jz LB_24256
LB_24258:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24259
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24260
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24260:
	jmp LB_24243
LB_24259:
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
	jc LB_24244
	btr QWORD [rdi],1
LB_24244:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24245
	btr QWORD [rdi],0
LB_24245:
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
	jc LB_24249
	btr QWORD [rdi],0
LB_24249:
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
	jc LB_24247
	btr QWORD [rdi],0
LB_24247:
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
LB_24243:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24310:
LB_24238:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24462
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24462:
LB_24235:
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
LB_24234:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_24456
LB_24455:
	add r14,1
LB_24456:
	cmp r14,r10
	jge LB_24457
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24455
	cmp al,10
	jz LB_24455
	cmp al,32
	jz LB_24455
LB_24457:
	add r14,2
	cmp r14,r10
	jg LB_24460
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_24460
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_24460
	jmp LB_24461
LB_24460:
	jmp LB_24373
LB_24461:
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
	jmp LB_24447
LB_24446:
	add r14,1
LB_24447:
	cmp r14,r10
	jge LB_24448
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24446
	cmp al,10
	jz LB_24446
	cmp al,32
	jz LB_24446
LB_24448:
	add r14,1
	cmp r14,r10
	jg LB_24451
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_24451
	jmp LB_24452
LB_24451:
	jmp LB_24374
LB_24452:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
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
	add r14,1
	cmp r14,r10
	jg LB_24431
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_24431
	jmp LB_24432
LB_24431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24429
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24429:
	jmp LB_24375
LB_24432:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_24434
LB_24433:
	add r14,1
LB_24434:
	cmp r14,r10
	jge LB_24435
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24433
	cmp al,10
	jz LB_24433
	cmp al,32
	jz LB_24433
LB_24435:
	push r10
	call NS_E_24055_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24436
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24437
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24437:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24438:
	jmp LB_24375
LB_24436:
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
LB_24444:
	jmp LB_24441
LB_24440:
	add r14,1
LB_24441:
	cmp r14,r10
	jge LB_24442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24440
	cmp al,10
	jz LB_24440
	cmp al,32
	jz LB_24440
LB_24442:
	push r10
	push rsi
	call NS_E_24057_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24443
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24445
	bts QWORD [rax],0
LB_24445:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24444
LB_24443:
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
	jc LB_24418
	btr QWORD [rdi],3
LB_24418:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24419
	btr QWORD [rdi],2
LB_24419:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24420
	btr QWORD [rdi],1
LB_24420:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24421
	btr QWORD [rdi],0
LB_24421:
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
	jc LB_24423
	btr QWORD [rdi],0
LB_24423:
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
LB_24375:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24416:
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
LB_24374:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_24404
LB_24403:
	add r14,1
LB_24404:
	cmp r14,r10
	jge LB_24405
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24403
	cmp al,10
	jz LB_24403
	cmp al,32
	jz LB_24403
LB_24405:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24406
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24376
LB_24406:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_24409
LB_24408:
	add r14,1
LB_24409:
	cmp r14,r10
	jge LB_24410
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24408
	cmp al,10
	jz LB_24408
	cmp al,32
	jz LB_24408
LB_24410:
	add r14,1
	cmp r14,r10
	jg LB_24414
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_24414
	jmp LB_24415
LB_24414:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24412
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24412:
	jmp LB_24376
LB_24415:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_24397
LB_24396:
	add r14,1
LB_24397:
	cmp r14,r10
	jge LB_24398
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24396
	cmp al,10
	jz LB_24396
	cmp al,32
	jz LB_24396
LB_24398:
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24399
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24400
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24400:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24401
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24401:
	jmp LB_24377
LB_24399:
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
	jc LB_24390
	btr QWORD [rdi],2
LB_24390:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24391
	btr QWORD [rdi],1
LB_24391:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24392
	btr QWORD [rdi],0
LB_24392:
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
	jc LB_24394
	btr QWORD [rdi],0
LB_24394:
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
LB_24377:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24388
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24388:
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
LB_24376:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_24384
LB_24383:
	add r14,1
LB_24384:
	cmp r14,r10
	jge LB_24385
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24383
	cmp al,10
	jz LB_24383
	cmp al,32
	jz LB_24383
LB_24385:
	push r10
	call NS_E_24055_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24386
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24378
LB_24386:
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
	jc LB_24379
	btr QWORD [rdi],0
LB_24379:
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
	jc LB_24381
	btr QWORD [rdi],0
LB_24381:
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
LB_24378:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24453
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24453:
LB_24373:
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
NS_E_24021:
NS_E_RDI_24021:
NS_E_24021_ETR_TBL:
NS_E_24021_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
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
	add r14,6
	cmp r14,r10
	jg LB_24533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_24533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_24533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_24533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_24533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_24533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_24533
	jmp LB_24534
LB_24533:
	jmp LB_24510
LB_24534:
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
	jc LB_24526
	btr QWORD [rdi],0
LB_24526:
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
LB_24510:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
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
	call NS_E_24019_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24518
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24511
LB_24518:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_24521
LB_24520:
	add r14,1
LB_24521:
	cmp r14,r10
	jge LB_24522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24520
	cmp al,10
	jz LB_24520
	cmp al,32
	jz LB_24520
LB_24522:
	push r10
	call NS_E_24021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24523
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24524:
	jmp LB_24511
LB_24523:
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
	jc LB_24512
	btr QWORD [rdi],1
LB_24512:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24513
	btr QWORD [rdi],0
LB_24513:
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
LB_24511:
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
NS_E_24023:
NS_E_RDI_24023:
NS_E_24023_ETR_TBL:
NS_E_24023_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_24543
LB_24542:
	add r14,1
LB_24543:
	cmp r14,r10
	jge LB_24544
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24542
	cmp al,10
	jz LB_24542
	cmp al,32
	jz LB_24542
LB_24544:
	add r14,1
	cmp r14,r10
	jg LB_24547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_24547
	jmp LB_24548
LB_24547:
	jmp LB_24535
LB_24548:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_24550
LB_24549:
	add r14,1
LB_24550:
	cmp r14,r10
	jge LB_24551
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24549
	cmp al,10
	jz LB_24549
	cmp al,32
	jz LB_24549
LB_24551:
	add r14,1
	cmp r14,r10
	jg LB_24555
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_24555
	jmp LB_24556
LB_24555:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24553
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24553:
	jmp LB_24535
LB_24556:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_24558
LB_24557:
	add r14,1
LB_24558:
	cmp r14,r10
	jge LB_24559
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24557
	cmp al,10
	jz LB_24557
	cmp al,32
	jz LB_24557
LB_24559:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24560
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24561
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24561:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24562
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24562:
	jmp LB_24535
LB_24560:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_24565
LB_24564:
	add r14,1
LB_24565:
	cmp r14,r10
	jge LB_24566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24564
	cmp al,10
	jz LB_24564
	cmp al,32
	jz LB_24564
LB_24566:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24567
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24568
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24568:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24569
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24569:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24570
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24570:
	jmp LB_24535
LB_24567:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_24573
LB_24572:
	add r14,1
LB_24573:
	cmp r14,r10
	jge LB_24574
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24572
	cmp al,10
	jz LB_24572
	cmp al,32
	jz LB_24572
LB_24574:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24575
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_24576
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_24576:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24577
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24577:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24578
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24578:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24579
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24579:
	jmp LB_24535
LB_24575:
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
	jc LB_24536
	btr QWORD [rdi],4
LB_24536:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_24537
	btr QWORD [rdi],3
LB_24537:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24538
	btr QWORD [rdi],2
LB_24538:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24539
	btr QWORD [rdi],1
LB_24539:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24540
	btr QWORD [rdi],0
LB_24540:
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
LB_24535:
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
NS_E_24025:
NS_E_RDI_24025:
NS_E_24025_ETR_TBL:
NS_E_24025_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_24587
LB_24586:
	add r14,1
LB_24587:
	cmp r14,r10
	jge LB_24588
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24586
	cmp al,10
	jz LB_24586
	cmp al,32
	jz LB_24586
LB_24588:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24589
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24581
LB_24589:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_24592
LB_24591:
	add r14,1
LB_24592:
	cmp r14,r10
	jge LB_24593
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24591
	cmp al,10
	jz LB_24591
	cmp al,32
	jz LB_24591
LB_24593:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24594
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24595
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24595:
	jmp LB_24581
LB_24594:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_24598
LB_24597:
	add r14,1
LB_24598:
	cmp r14,r10
	jge LB_24599
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24597
	cmp al,10
	jz LB_24597
	cmp al,32
	jz LB_24597
LB_24599:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24600
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24601
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24601:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24602
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24602:
	jmp LB_24581
LB_24600:
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
	jc LB_24582
	btr QWORD [rdi],2
LB_24582:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24583
	btr QWORD [rdi],1
LB_24583:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24584
	btr QWORD [rdi],0
LB_24584:
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
LB_24581:
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
NS_E_24027:
NS_E_RDI_24027:
NS_E_24027_ETR_TBL:
NS_E_24027_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_24632
LB_24631:
	add r14,1
LB_24632:
	cmp r14,r10
	jge LB_24633
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24631
	cmp al,10
	jz LB_24631
	cmp al,32
	jz LB_24631
LB_24633:
	add r14,3
	cmp r14,r10
	jg LB_24636
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24636
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_24636
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_24636
	jmp LB_24637
LB_24636:
	jmp LB_24604
LB_24637:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_24639
LB_24638:
	add r14,1
LB_24639:
	cmp r14,r10
	jge LB_24640
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24638
	cmp al,10
	jz LB_24638
	cmp al,32
	jz LB_24638
LB_24640:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24641
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24642
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24642:
	jmp LB_24604
LB_24641:
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
	jc LB_24628
	btr QWORD [rdi],1
LB_24628:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24629
	btr QWORD [rdi],0
LB_24629:
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
LB_24604:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_24624
LB_24623:
	add r14,1
LB_24624:
	cmp r14,r10
	jge LB_24625
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24623
	cmp al,10
	jz LB_24623
	cmp al,32
	jz LB_24623
LB_24625:
	push r10
	call NS_E_24039_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24626
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24605
LB_24626:
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
	jc LB_24621
	btr QWORD [rdi],0
LB_24621:
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
LB_24605:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_24611
LB_24610:
	add r14,1
LB_24611:
	cmp r14,r10
	jge LB_24612
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24610
	cmp al,10
	jz LB_24610
	cmp al,32
	jz LB_24610
LB_24612:
	push r10
	call NS_E_24029_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24613
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24606
LB_24613:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_24616
LB_24615:
	add r14,1
LB_24616:
	cmp r14,r10
	jge LB_24617
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24615
	cmp al,10
	jz LB_24615
	cmp al,32
	jz LB_24615
LB_24617:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24618
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24619
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24619:
	jmp LB_24606
LB_24618:
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
	jc LB_24607
	btr QWORD [rdi],1
LB_24607:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24608
	btr QWORD [rdi],0
LB_24608:
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
LB_24606:
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
NS_E_24029:
NS_E_RDI_24029:
NS_E_24029_ETR_TBL:
NS_E_24029_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "$"
	jmp LB_24929
LB_24928:
	add r14,1
LB_24929:
	cmp r14,r10
	jge LB_24930
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24928
	cmp al,10
	jz LB_24928
	cmp al,32
	jz LB_24928
LB_24930:
	add r14,1
	cmp r14,r10
	jg LB_24933
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_24933
	jmp LB_24934
LB_24933:
	jmp LB_24644
LB_24934:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_24906
LB_24905:
	add r14,1
LB_24906:
	cmp r14,r10
	jge LB_24907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24905
	cmp al,10
	jz LB_24905
	cmp al,32
	jz LB_24905
LB_24907:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24908
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24909
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24909:
	jmp LB_24645
LB_24908:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_24912
LB_24911:
	add r14,1
LB_24912:
	cmp r14,r10
	jge LB_24913
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24911
	cmp al,10
	jz LB_24911
	cmp al,32
	jz LB_24911
LB_24913:
	add r14,3
	cmp r14,r10
	jg LB_24918
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24918
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_24918
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_24918
	jmp LB_24919
LB_24918:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24915
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24915:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24916:
	jmp LB_24645
LB_24919:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_24921
LB_24920:
	add r14,1
LB_24921:
	cmp r14,r10
	jge LB_24922
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24920
	cmp al,10
	jz LB_24920
	cmp al,32
	jz LB_24920
LB_24922:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24923
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24924
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24924:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24925
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24925:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24926
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24926:
	jmp LB_24645
LB_24923:
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
	jc LB_24900
	btr QWORD [rdi],3
LB_24900:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24901
	btr QWORD [rdi],2
LB_24901:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24902
	btr QWORD [rdi],1
LB_24902:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24903
	btr QWORD [rdi],0
LB_24903:
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
LB_24645:
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
LB_24644:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\151\130"
	jmp LB_24894
LB_24893:
	add r14,1
LB_24894:
	cmp r14,r10
	jge LB_24895
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24893
	cmp al,10
	jz LB_24893
	cmp al,32
	jz LB_24893
LB_24895:
	add r14,3
	cmp r14,r10
	jg LB_24898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_24898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_24898
	jmp LB_24899
LB_24898:
	jmp LB_24646
LB_24899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_24871
LB_24870:
	add r14,1
LB_24871:
	cmp r14,r10
	jge LB_24872
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24870
	cmp al,10
	jz LB_24870
	cmp al,32
	jz LB_24870
LB_24872:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24873
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24874
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24874:
	jmp LB_24647
LB_24873:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_24877
LB_24876:
	add r14,1
LB_24877:
	cmp r14,r10
	jge LB_24878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24876
	cmp al,10
	jz LB_24876
	cmp al,32
	jz LB_24876
LB_24878:
	add r14,3
	cmp r14,r10
	jg LB_24883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_24883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_24883
	jmp LB_24884
LB_24883:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24880
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24880:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24881
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24881:
	jmp LB_24647
LB_24884:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_24886
LB_24885:
	add r14,1
LB_24886:
	cmp r14,r10
	jge LB_24887
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24885
	cmp al,10
	jz LB_24885
	cmp al,32
	jz LB_24885
LB_24887:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24888
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24889
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24889:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24890
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24890:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24891
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24891:
	jmp LB_24647
LB_24888:
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
	jc LB_24865
	btr QWORD [rdi],3
LB_24865:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24866
	btr QWORD [rdi],2
LB_24866:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24867
	btr QWORD [rdi],1
LB_24867:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24868
	btr QWORD [rdi],0
LB_24868:
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
LB_24647:
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
LB_24646:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\187"
	jmp LB_24859
LB_24858:
	add r14,1
LB_24859:
	cmp r14,r10
	jge LB_24860
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24858
	cmp al,10
	jz LB_24858
	cmp al,32
	jz LB_24858
LB_24860:
	add r14,2
	cmp r14,r10
	jg LB_24863
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_24863
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_24863
	jmp LB_24864
LB_24863:
	jmp LB_24648
LB_24864:
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
	jmp LB_24816
LB_24815:
	add r14,1
LB_24816:
	cmp r14,r10
	jge LB_24817
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24815
	cmp al,10
	jz LB_24815
	cmp al,32
	jz LB_24815
LB_24817:
	add r14,2
	cmp r14,r10
	jg LB_24820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_24820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_24820
	jmp LB_24821
LB_24820:
	jmp LB_24650
LB_24821:
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
	jmp LB_24767
LB_24766:
	add r14,1
LB_24767:
	cmp r14,r10
	jge LB_24768
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24766
	cmp al,10
	jz LB_24766
	cmp al,32
	jz LB_24766
LB_24768:
	add r14,1
	cmp r14,r10
	jg LB_24771
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_24771
	jmp LB_24772
LB_24771:
	jmp LB_24652
LB_24772:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_24735
LB_24734:
	add r14,1
LB_24735:
	cmp r14,r10
	jge LB_24736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24734
	cmp al,10
	jz LB_24734
	cmp al,32
	jz LB_24734
LB_24736:
	add r14,3
	cmp r14,r10
	jg LB_24740
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24740
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_24740
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_24740
	jmp LB_24741
LB_24740:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24738
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24738:
	jmp LB_24653
LB_24741:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg
	jmp LB_24743
LB_24742:
	add r14,1
LB_24743:
	cmp r14,r10
	jge LB_24744
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24742
	cmp al,10
	jz LB_24742
	cmp al,32
	jz LB_24742
LB_24744:
	push r10
	call NS_E_24053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24745
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24746
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24746:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24747:
	jmp LB_24653
LB_24745:
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
LB_24753:
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
	push rsi
	call NS_E_24031_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24752
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24754
	bts QWORD [rax],0
LB_24754:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24753
LB_24752:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
; "//"
	jmp LB_24756
LB_24755:
	add r14,1
LB_24756:
	cmp r14,r10
	jge LB_24757
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24755
	cmp al,10
	jz LB_24755
	cmp al,32
	jz LB_24755
LB_24757:
	add r14,2
	cmp r14,r10
	jg LB_24764
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_24764
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_24764
	jmp LB_24765
LB_24764:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_24759
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_24759:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24760
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24760:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24761
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24761:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24762
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24762:
	jmp LB_24653
LB_24765:
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
	jc LB_24724
	btr QWORD [rdi],4
LB_24724:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_24725
	btr QWORD [rdi],3
LB_24725:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24726
	btr QWORD [rdi],2
LB_24726:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24727
	btr QWORD [rdi],1
LB_24727:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24728
	btr QWORD [rdi],0
LB_24728:
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
	jc LB_24732
	btr QWORD [rdi],0
LB_24732:
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
	jc LB_24730
	btr QWORD [rdi],0
LB_24730:
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
LB_24653:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24722
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24722:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24720
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24720:
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
LB_24652:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; reg
	jmp LB_24668
LB_24667:
	add r14,1
LB_24668:
	cmp r14,r10
	jge LB_24669
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24667
	cmp al,10
	jz LB_24667
	cmp al,32
	jz LB_24667
LB_24669:
	push r10
	call NS_E_24053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24670
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24654
LB_24670:
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
LB_24676:
	jmp LB_24673
LB_24672:
	add r14,1
LB_24673:
	cmp r14,r10
	jge LB_24674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24672
	cmp al,10
	jz LB_24672
	cmp al,32
	jz LB_24672
LB_24674:
	push r10
	push rsi
	call NS_E_24037_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24675
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24677
	bts QWORD [rax],0
LB_24677:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24676
LB_24675:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "\226\138\162"
	jmp LB_24679
LB_24678:
	add r14,1
LB_24679:
	cmp r14,r10
	jge LB_24680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24678
	cmp al,10
	jz LB_24678
	cmp al,32
	jz LB_24678
LB_24680:
	add r14,3
	cmp r14,r10
	jg LB_24685
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24685
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_24685
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_24685
	jmp LB_24686
LB_24685:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24682
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24682:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24683
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24683:
	jmp LB_24654
LB_24686:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg
	jmp LB_24688
LB_24687:
	add r14,1
LB_24688:
	cmp r14,r10
	jge LB_24689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24687
	cmp al,10
	jz LB_24687
	cmp al,32
	jz LB_24687
LB_24689:
	push r10
	call NS_E_24053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24690
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24691
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24691:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24692
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24692:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24693
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24693:
	jmp LB_24654
LB_24690:
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
LB_24699:
	jmp LB_24696
LB_24695:
	add r14,1
LB_24696:
	cmp r14,r10
	jge LB_24697
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24695
	cmp al,10
	jz LB_24695
	cmp al,32
	jz LB_24695
LB_24697:
	push r10
	push rsi
	call NS_E_24037_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24698
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24700
	bts QWORD [rax],0
LB_24700:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24699
LB_24698:
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
LB_24705:
	jmp LB_24702
LB_24701:
	add r14,1
LB_24702:
	cmp r14,r10
	jge LB_24703
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24701
	cmp al,10
	jz LB_24701
	cmp al,32
	jz LB_24701
LB_24703:
	push r10
	push rsi
	call NS_E_24031_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_24704
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_24706
	bts QWORD [rax],0
LB_24706:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_24705
LB_24704:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
; "//"
	jmp LB_24708
LB_24707:
	add r14,1
LB_24708:
	cmp r14,r10
	jge LB_24709
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24707
	cmp al,10
	jz LB_24707
	cmp al,32
	jz LB_24707
LB_24709:
	add r14,2
	cmp r14,r10
	jg LB_24718
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_24718
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_24718
	jmp LB_24719
LB_24718:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_24711
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_24711:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_24712
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_24712:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_24713
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_24713:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24714
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24714:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24715
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24715:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24716
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24716:
	jmp LB_24654
LB_24719:
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
	jc LB_24655
	btr QWORD [rdi],6
LB_24655:
	mov rax,QWORD [rsp+16*6+8*1]
	mov [rdi+8*1+8*6],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_24656
	btr QWORD [rdi],5
LB_24656:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_24657
	btr QWORD [rdi],4
LB_24657:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_24658
	btr QWORD [rdi],3
LB_24658:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24659
	btr QWORD [rdi],2
LB_24659:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24660
	btr QWORD [rdi],1
LB_24660:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24661
	btr QWORD [rdi],0
LB_24661:
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
	jc LB_24665
	btr QWORD [rdi],0
LB_24665:
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
	jc LB_24663
	btr QWORD [rdi],0
LB_24663:
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
LB_24654:
	add rsp,112
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24813
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24813:
LB_24651:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24811
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24811:
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
LB_24650:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_24782
LB_24781:
	add r14,1
LB_24782:
	cmp r14,r10
	jge LB_24783
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24781
	cmp al,10
	jz LB_24781
	cmp al,32
	jz LB_24781
LB_24783:
	push r10
	call NS_E_23960_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24784
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24773
LB_24784:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_24787
LB_24786:
	add r14,1
LB_24787:
	cmp r14,r10
	jge LB_24788
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24786
	cmp al,10
	jz LB_24786
	cmp al,32
	jz LB_24786
LB_24788:
	add r14,1
	cmp r14,r10
	jg LB_24792
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_24792
	jmp LB_24793
LB_24792:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24790
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24790:
	jmp LB_24773
LB_24793:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_24795
LB_24794:
	add r14,1
LB_24795:
	cmp r14,r10
	jge LB_24796
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24794
	cmp al,10
	jz LB_24794
	cmp al,32
	jz LB_24794
LB_24796:
	add r14,3
	cmp r14,r10
	jg LB_24801
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24801
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_24801
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_24801
	jmp LB_24802
LB_24801:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24798
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24798:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24799:
	jmp LB_24773
LB_24802:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_24804
LB_24803:
	add r14,1
LB_24804:
	cmp r14,r10
	jge LB_24805
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24803
	cmp al,10
	jz LB_24803
	cmp al,32
	jz LB_24803
LB_24805:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24806
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24807
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24807:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24808
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24808:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24809
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24809:
	jmp LB_24773
LB_24806:
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
	jc LB_24774
	btr QWORD [rdi],3
LB_24774:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24775
	btr QWORD [rdi],2
LB_24775:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24776
	btr QWORD [rdi],1
LB_24776:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24777
	btr QWORD [rdi],0
LB_24777:
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
	jc LB_24779
	btr QWORD [rdi],0
LB_24779:
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
LB_24773:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24856
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24856:
LB_24649:
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
LB_24648:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_24829
LB_24828:
	add r14,1
LB_24829:
	cmp r14,r10
	jge LB_24830
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24828
	cmp al,10
	jz LB_24828
	cmp al,32
	jz LB_24828
LB_24830:
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24831
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24822
LB_24831:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_24834
LB_24833:
	add r14,1
LB_24834:
	cmp r14,r10
	jge LB_24835
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24833
	cmp al,10
	jz LB_24833
	cmp al,32
	jz LB_24833
LB_24835:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24836
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24837
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24837:
	jmp LB_24822
LB_24836:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_24840
LB_24839:
	add r14,1
LB_24840:
	cmp r14,r10
	jge LB_24841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24839
	cmp al,10
	jz LB_24839
	cmp al,32
	jz LB_24839
LB_24841:
	add r14,3
	cmp r14,r10
	jg LB_24846
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_24846
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_24846
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_24846
	jmp LB_24847
LB_24846:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24843
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24843:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24844
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24844:
	jmp LB_24822
LB_24847:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_24849
LB_24848:
	add r14,1
LB_24849:
	cmp r14,r10
	jge LB_24850
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24848
	cmp al,10
	jz LB_24848
	cmp al,32
	jz LB_24848
LB_24850:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24851
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_24852
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_24852:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_24853
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_24853:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24854
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24854:
	jmp LB_24822
LB_24851:
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
	jc LB_24823
	btr QWORD [rdi],3
LB_24823:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_24824
	btr QWORD [rdi],2
LB_24824:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_24825
	btr QWORD [rdi],1
LB_24825:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24826
	btr QWORD [rdi],0
LB_24826:
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
LB_24822:
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
NS_E_24031:
NS_E_RDI_24031:
NS_E_24031_ETR_TBL:
NS_E_24031_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_24972
LB_24971:
	add r14,1
LB_24972:
	cmp r14,r10
	jge LB_24973
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24971
	cmp al,10
	jz LB_24971
	cmp al,32
	jz LB_24971
LB_24973:
	push r10
	call NS_E_24033_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24974
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24935
LB_24974:
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
	jc LB_24969
	btr QWORD [rdi],0
LB_24969:
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
LB_24935:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_24965
LB_24964:
	add r14,1
LB_24965:
	cmp r14,r10
	jge LB_24966
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24964
	cmp al,10
	jz LB_24964
	cmp al,32
	jz LB_24964
LB_24966:
	push r10
	call NS_E_22524_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24967
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24936
LB_24967:
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
	jc LB_24962
	btr QWORD [rdi],0
LB_24962:
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
LB_24936:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_24958
LB_24957:
	add r14,1
LB_24958:
	cmp r14,r10
	jge LB_24959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24957
	cmp al,10
	jz LB_24957
	cmp al,32
	jz LB_24957
LB_24959:
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24960
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24937
LB_24960:
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
	jc LB_24955
	btr QWORD [rdi],0
LB_24955:
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
LB_24937:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	jmp LB_24943
LB_24942:
	add r14,1
LB_24943:
	cmp r14,r10
	jge LB_24944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24942
	cmp al,10
	jz LB_24942
	cmp al,32
	jz LB_24942
LB_24944:
	push r10
	call NS_E_22453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24938
LB_24945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_24948
LB_24947:
	add r14,1
LB_24948:
	cmp r14,r10
	jge LB_24949
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_24947
	cmp al,10
	jz LB_24947
	cmp al,32
	jz LB_24947
LB_24949:
	add r14,1
	cmp r14,r10
	jg LB_24953
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_24953
	jmp LB_24954
LB_24953:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24951:
	jmp LB_24938
LB_24954:
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
	jc LB_24939
	btr QWORD [rdi],1
LB_24939:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24940
	btr QWORD [rdi],0
LB_24940:
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
LB_24938:
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
NS_E_24033:
NS_E_RDI_24033:
NS_E_24033_ETR_TBL:
NS_E_24033_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_24985
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_24985
	jmp LB_24986
LB_24985:
	jmp LB_24976
LB_24986:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_24035_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_24990
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_24991
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_24991:
	jmp LB_24976
LB_24990:
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
	jc LB_24977
	btr QWORD [rdi],1
LB_24977:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24978
	btr QWORD [rdi],0
LB_24978:
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
LB_24976:
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
NS_E_24035:
NS_E_RDI_24035:
NS_E_24035_ETR_TBL:
NS_E_24035_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_25016
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_25016
	jmp LB_25017
LB_25016:
	jmp LB_24993
LB_25017:
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
	jc LB_25009
	btr QWORD [rdi],0
LB_25009:
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
LB_24993:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_22451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25001
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_24994
LB_25001:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_24035_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25006
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25007
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25007:
	jmp LB_24994
LB_25006:
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
	jc LB_24995
	btr QWORD [rdi],1
LB_24995:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_24996
	btr QWORD [rdi],0
LB_24996:
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
LB_24994:
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
NS_E_24037:
NS_E_RDI_24037:
NS_E_24037_ETR_TBL:
NS_E_24037_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	add r14,1
	cmp r14,r10
	jg LB_25027
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_25027
	jmp LB_25028
LB_25027:
	jmp LB_25018
LB_25028:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg
	push r10
	call NS_E_24053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25032
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25033
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25033:
	jmp LB_25018
LB_25032:
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
	jc LB_25019
	btr QWORD [rdi],1
LB_25019:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25020
	btr QWORD [rdi],0
LB_25020:
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
LB_25018:
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
NS_E_24039:
NS_E_RDI_24039:
NS_E_24039_ETR_TBL:
NS_E_24039_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_25108
LB_25107:
	add r14,1
LB_25108:
	cmp r14,r10
	jge LB_25109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25107
	cmp al,10
	jz LB_25107
	cmp al,32
	jz LB_25107
LB_25109:
	add r14,4
	cmp r14,r10
	jg LB_25112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_25112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_25112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_25112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_25112
	jmp LB_25113
LB_25112:
	jmp LB_25035
LB_25113:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_25087
LB_25086:
	add r14,1
LB_25087:
	cmp r14,r10
	jge LB_25088
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25086
	cmp al,10
	jz LB_25086
	cmp al,32
	jz LB_25086
LB_25088:
	push r10
	call NS_E_24043_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25089
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25090
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25090:
	jmp LB_25036
LB_25089:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_25093
LB_25092:
	add r14,1
LB_25093:
	cmp r14,r10
	jge LB_25094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25092
	cmp al,10
	jz LB_25092
	cmp al,32
	jz LB_25092
LB_25094:
	push r10
	call NS_E_24041_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25095
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25096
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25096:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25097
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25097:
	jmp LB_25036
LB_25095:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_25100
LB_25099:
	add r14,1
LB_25100:
	cmp r14,r10
	jge LB_25101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25099
	cmp al,10
	jz LB_25099
	cmp al,32
	jz LB_25099
LB_25101:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25102
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25103
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25103:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25104
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25104:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25105
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25105:
	jmp LB_25036
LB_25102:
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
	jc LB_25081
	btr QWORD [rdi],3
LB_25081:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25082
	btr QWORD [rdi],2
LB_25082:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25083
	btr QWORD [rdi],1
LB_25083:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25084
	btr QWORD [rdi],0
LB_25084:
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
LB_25036:
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
LB_25035:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_25045
LB_25044:
	add r14,1
LB_25045:
	cmp r14,r10
	jge LB_25046
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25044
	cmp al,10
	jz LB_25044
	cmp al,32
	jz LB_25044
LB_25046:
	add r14,3
	cmp r14,r10
	jg LB_25049
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25049
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_25049
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_25049
	jmp LB_25050
LB_25049:
	jmp LB_25037
LB_25050:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_25052
LB_25051:
	add r14,1
LB_25052:
	cmp r14,r10
	jge LB_25053
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25051
	cmp al,10
	jz LB_25051
	cmp al,32
	jz LB_25051
LB_25053:
	push r10
	call NS_E_24043_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25054
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25055
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25055:
	jmp LB_25037
LB_25054:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_25058
LB_25057:
	add r14,1
LB_25058:
	cmp r14,r10
	jge LB_25059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25057
	cmp al,10
	jz LB_25057
	cmp al,32
	jz LB_25057
LB_25059:
	push r10
	call NS_E_24041_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25060
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25061
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25061:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25062:
	jmp LB_25037
LB_25060:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_25065
LB_25064:
	add r14,1
LB_25065:
	cmp r14,r10
	jge LB_25066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25064
	cmp al,10
	jz LB_25064
	cmp al,32
	jz LB_25064
LB_25066:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25067
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25068
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25068:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25069
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25069:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25070:
	jmp LB_25037
LB_25067:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_mtc
	jmp LB_25073
LB_25072:
	add r14,1
LB_25073:
	cmp r14,r10
	jge LB_25074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25072
	cmp al,10
	jz LB_25072
	cmp al,32
	jz LB_25072
LB_25074:
	push r10
	call NS_E_24039_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25075
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_25076
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_25076:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25077
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25077:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25078
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25078:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25079:
	jmp LB_25037
LB_25075:
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
	jc LB_25038
	btr QWORD [rdi],4
LB_25038:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_25039
	btr QWORD [rdi],3
LB_25039:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25040
	btr QWORD [rdi],2
LB_25040:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25041
	btr QWORD [rdi],1
LB_25041:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25042
	btr QWORD [rdi],0
LB_25042:
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
LB_25037:
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
NS_E_24041:
NS_E_RDI_24041:
NS_E_24041_ETR_TBL:
NS_E_24041_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_25119
LB_25118:
	add r14,1
LB_25119:
	cmp r14,r10
	jge LB_25120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25118
	cmp al,32
	jz LB_25118
LB_25120:
	add r14,1
	cmp r14,r10
	jg LB_25123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_25123
	jmp LB_25124
LB_25123:
	jmp LB_25114
LB_25124:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_25126
LB_25125:
	add r14,1
LB_25126:
	cmp r14,r10
	jge LB_25127
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25125
	cmp al,32
	jz LB_25125
LB_25127:
	add r14,1
	cmp r14,r10
	jg LB_25131
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_25131
	jmp LB_25132
LB_25131:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25129
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25129:
	jmp LB_25114
LB_25132:
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
	jc LB_25115
	btr QWORD [rdi],1
LB_25115:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25116
	btr QWORD [rdi],0
LB_25116:
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
LB_25114:
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
NS_E_24043:
NS_E_RDI_24043:
NS_E_24043_ETR_TBL:
NS_E_24043_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_25140
LB_25139:
	add r14,1
LB_25140:
	cmp r14,r10
	jge LB_25141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25139
	cmp al,10
	jz LB_25139
	cmp al,32
	jz LB_25139
LB_25141:
	push r10
	call NS_E_24045_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25142
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25133
LB_25142:
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
LB_25148:
	jmp LB_25145
LB_25144:
	add r14,1
LB_25145:
	cmp r14,r10
	jge LB_25146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25144
	cmp al,10
	jz LB_25144
	cmp al,32
	jz LB_25144
LB_25146:
	push r10
	push rsi
	call NS_E_24047_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25147
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25149
	bts QWORD [rax],0
LB_25149:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25148
LB_25147:
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
	jc LB_25136
	btr QWORD [rdi],1
LB_25136:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25137
	btr QWORD [rdi],0
LB_25137:
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
LB_25133:
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
LB_25134:
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
NS_E_24045:
NS_E_RDI_24045:
NS_E_24045_ETR_TBL:
NS_E_24045_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; reg_ptn
	jmp LB_25210
LB_25209:
	add r14,1
LB_25210:
	cmp r14,r10
	jge LB_25211
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25209
	cmp al,10
	jz LB_25209
	cmp al,32
	jz LB_25209
LB_25211:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25212
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25150
LB_25212:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_25215
LB_25214:
	add r14,1
LB_25215:
	cmp r14,r10
	jge LB_25216
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25214
	cmp al,10
	jz LB_25214
	cmp al,32
	jz LB_25214
LB_25216:
	add r14,3
	cmp r14,r10
	jg LB_25220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_25220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_25220
	jmp LB_25221
LB_25220:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25218
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25218:
	jmp LB_25150
LB_25221:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_25184
LB_25183:
	add r14,1
LB_25184:
	cmp r14,r10
	jge LB_25185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25183
	cmp al,10
	jz LB_25183
	cmp al,32
	jz LB_25183
LB_25185:
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25186
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25187
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25187:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25188
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25188:
	jmp LB_25151
LB_25186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_25191
LB_25190:
	add r14,1
LB_25191:
	cmp r14,r10
	jge LB_25192
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25190
	cmp al,10
	jz LB_25190
	cmp al,32
	jz LB_25190
LB_25192:
	add r14,3
	cmp r14,r10
	jg LB_25198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_25198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_25198
	jmp LB_25199
LB_25198:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25194
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25194:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25195
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25195:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25196
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25196:
	jmp LB_25151
LB_25199:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; reg_ptn
	jmp LB_25201
LB_25200:
	add r14,1
LB_25201:
	cmp r14,r10
	jge LB_25202
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25200
	cmp al,10
	jz LB_25200
	cmp al,32
	jz LB_25200
LB_25202:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25203
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_25204
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_25204:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25205
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25205:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25206
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25206:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25207:
	jmp LB_25151
LB_25203:
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
	jc LB_25177
	btr QWORD [rdi],4
LB_25177:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_25178
	btr QWORD [rdi],3
LB_25178:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25179
	btr QWORD [rdi],2
LB_25179:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25180
	btr QWORD [rdi],1
LB_25180:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25181
	btr QWORD [rdi],0
LB_25181:
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
LB_25151:
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
LB_25150:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_25158
LB_25157:
	add r14,1
LB_25158:
	cmp r14,r10
	jge LB_25159
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25157
	cmp al,10
	jz LB_25157
	cmp al,32
	jz LB_25157
LB_25159:
	push r10
	call NS_E_24049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25160
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25152
LB_25160:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_25163
LB_25162:
	add r14,1
LB_25163:
	cmp r14,r10
	jge LB_25164
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25162
	cmp al,10
	jz LB_25162
	cmp al,32
	jz LB_25162
LB_25164:
	add r14,1
	cmp r14,r10
	jg LB_25168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_25168
	jmp LB_25169
LB_25168:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25166
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25166:
	jmp LB_25152
LB_25169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_25171
LB_25170:
	add r14,1
LB_25171:
	cmp r14,r10
	jge LB_25172
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25170
	cmp al,10
	jz LB_25170
	cmp al,32
	jz LB_25170
LB_25172:
	push r10
	call NS_E_24049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25173
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25174
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25174:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25175
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25175:
	jmp LB_25152
LB_25173:
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
	jc LB_25153
	btr QWORD [rdi],2
LB_25153:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25154
	btr QWORD [rdi],1
LB_25154:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25155
	btr QWORD [rdi],0
LB_25155:
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
LB_25152:
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
NS_E_24047:
NS_E_RDI_24047:
NS_E_24047_ETR_TBL:
NS_E_24047_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_25227
LB_25226:
	add r14,1
LB_25227:
	cmp r14,r10
	jge LB_25228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25226
	cmp al,10
	jz LB_25226
	cmp al,32
	jz LB_25226
LB_25228:
	add r14,1
	cmp r14,r10
	jg LB_25231
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_25231
	jmp LB_25232
LB_25231:
	jmp LB_25222
LB_25232:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_25234
LB_25233:
	add r14,1
LB_25234:
	cmp r14,r10
	jge LB_25235
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25233
	cmp al,10
	jz LB_25233
	cmp al,32
	jz LB_25233
LB_25235:
	push r10
	call NS_E_24045_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25236
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25237
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25237:
	jmp LB_25222
LB_25236:
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
	jc LB_25223
	btr QWORD [rdi],1
LB_25223:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25224
	btr QWORD [rdi],0
LB_25224:
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
LB_25222:
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
NS_E_24049:
NS_E_RDI_24049:
NS_E_24049_ETR_TBL:
NS_E_24049_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_25252
LB_25251:
	add r14,1
LB_25252:
	cmp r14,r10
	jge LB_25253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25251
	cmp al,10
	jz LB_25251
	cmp al,32
	jz LB_25251
LB_25253:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25254
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25239
LB_25254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_25257
LB_25256:
	add r14,1
LB_25257:
	cmp r14,r10
	jge LB_25258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25256
	cmp al,10
	jz LB_25256
	cmp al,32
	jz LB_25256
LB_25258:
	add r14,1
	cmp r14,r10
	jg LB_25262
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_25262
	jmp LB_25263
LB_25262:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25260
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25260:
	jmp LB_25239
LB_25263:
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
	jc LB_25248
	btr QWORD [rdi],1
LB_25248:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25249
	btr QWORD [rdi],0
LB_25249:
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
LB_25239:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	jmp LB_25244
LB_25243:
	add r14,1
LB_25244:
	cmp r14,r10
	jge LB_25245
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25243
	cmp al,10
	jz LB_25243
	cmp al,32
	jz LB_25243
LB_25245:
	push r10
	call NS_E_23960_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25246
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25240
LB_25246:
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
	jc LB_25241
	btr QWORD [rdi],0
LB_25241:
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
LB_25240:
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
NS_E_24051:
NS_E_RDI_24051:
NS_E_24051_ETR_TBL:
NS_E_24051_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_25278
LB_25277:
	add r14,1
LB_25278:
	cmp r14,r10
	jge LB_25279
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25277
	cmp al,10
	jz LB_25277
	cmp al,32
	jz LB_25277
LB_25279:
	add r14,1
	cmp r14,r10
	jg LB_25282
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_25282
	jmp LB_25283
LB_25282:
	jmp LB_25264
LB_25283:
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
LB_25288:
	jmp LB_25285
LB_25284:
	add r14,1
LB_25285:
	cmp r14,r10
	jge LB_25286
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25284
	cmp al,10
	jz LB_25284
	cmp al,32
	jz LB_25284
LB_25286:
	push r10
	push rsi
	call NS_E_24051_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25287
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25289
	bts QWORD [rax],0
LB_25289:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25288
LB_25287:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_25291
LB_25290:
	add r14,1
LB_25291:
	cmp r14,r10
	jge LB_25292
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25290
	cmp al,10
	jz LB_25290
	cmp al,32
	jz LB_25290
LB_25292:
	add r14,1
	cmp r14,r10
	jg LB_25297
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_25297
	jmp LB_25298
LB_25297:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25294
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25294:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25295:
	jmp LB_25264
LB_25298:
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
	jc LB_25273
	btr QWORD [rdi],2
LB_25273:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25274
	btr QWORD [rdi],1
LB_25274:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25275
	btr QWORD [rdi],0
LB_25275:
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
LB_25264:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_25269
LB_25268:
	add r14,1
LB_25269:
	cmp r14,r10
	jge LB_25270
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25268
	cmp al,10
	jz LB_25268
	cmp al,32
	jz LB_25268
LB_25270:
	push r10
	call NS_E_24053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25271
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25265
LB_25271:
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
	jc LB_25266
	btr QWORD [rdi],0
LB_25266:
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
LB_25265:
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
NS_E_24053:
NS_E_RDI_24053:
NS_E_24053_ETR_TBL:
NS_E_24053_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_25326
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_25326
	jmp LB_25327
LB_25326:
	jmp LB_25299
LB_25327:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25331
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25332
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25332:
	jmp LB_25299
LB_25331:
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
	jc LB_25318
	btr QWORD [rdi],1
LB_25318:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25319
	btr QWORD [rdi],0
LB_25319:
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
LB_25299:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25316
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25300
LB_25316:
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
	jc LB_25311
	btr QWORD [rdi],0
LB_25311:
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
LB_25300:
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
	jg LB_25309
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_25309
	jmp LB_25310
LB_25309:
	jmp LB_25301
LB_25310:
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
	jc LB_25302
	btr QWORD [rdi],0
LB_25302:
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
LB_25301:
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
NS_E_24055:
NS_E_RDI_24055:
NS_E_24055_ETR_TBL:
NS_E_24055_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_25340
LB_25339:
	add r14,1
LB_25340:
	cmp r14,r10
	jge LB_25341
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25339
	cmp al,10
	jz LB_25339
	cmp al,32
	jz LB_25339
LB_25341:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25342
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25334
LB_25342:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_etr_coprd
	jmp LB_25345
LB_25344:
	add r14,1
LB_25345:
	cmp r14,r10
	jge LB_25346
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25344
	cmp al,10
	jz LB_25344
	cmp al,32
	jz LB_25344
LB_25346:
	push r10
	call NS_E_24059_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25347
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25348:
	jmp LB_25334
LB_25347:
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
LB_25354:
	jmp LB_25351
LB_25350:
	add r14,1
LB_25351:
	cmp r14,r10
	jge LB_25352
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25350
	cmp al,10
	jz LB_25350
	cmp al,32
	jz LB_25350
LB_25352:
	push r10
	push rsi
	call NS_E_24059_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25353
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25355
	bts QWORD [rax],0
LB_25355:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25354
LB_25353:
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
	jc LB_25335
	btr QWORD [rdi],2
LB_25335:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25336
	btr QWORD [rdi],1
LB_25336:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25337
	btr QWORD [rdi],0
LB_25337:
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
LB_25334:
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
NS_E_24057:
NS_E_RDI_24057:
NS_E_24057_ETR_TBL:
NS_E_24057_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_25363
LB_25362:
	add r14,1
LB_25363:
	cmp r14,r10
	jge LB_25364
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25362
	cmp al,10
	jz LB_25362
	cmp al,32
	jz LB_25362
LB_25364:
	add r14,1
	cmp r14,r10
	jg LB_25367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_25367
	jmp LB_25368
LB_25367:
	jmp LB_25356
LB_25368:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_25370
LB_25369:
	add r14,1
LB_25370:
	cmp r14,r10
	jge LB_25371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25369
	cmp al,10
	jz LB_25369
	cmp al,32
	jz LB_25369
LB_25371:
	add r14,1
	cmp r14,r10
	jg LB_25375
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_25375
	jmp LB_25376
LB_25375:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25373
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25373:
	jmp LB_25356
LB_25376:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_25378
LB_25377:
	add r14,1
LB_25378:
	cmp r14,r10
	jge LB_25379
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25377
	cmp al,10
	jz LB_25377
	cmp al,32
	jz LB_25377
LB_25379:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25380
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25381
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25381:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25382
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25382:
	jmp LB_25356
LB_25380:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dt_etr_coprd
	jmp LB_25385
LB_25384:
	add r14,1
LB_25385:
	cmp r14,r10
	jge LB_25386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25384
	cmp al,10
	jz LB_25384
	cmp al,32
	jz LB_25384
LB_25386:
	push r10
	call NS_E_24059_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25387
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25388
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25388:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25389
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25389:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25390
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25390:
	jmp LB_25356
LB_25387:
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
	jc LB_25357
	btr QWORD [rdi],3
LB_25357:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25358
	btr QWORD [rdi],2
LB_25358:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25359
	btr QWORD [rdi],1
LB_25359:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25360
	btr QWORD [rdi],0
LB_25360:
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
LB_25356:
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
NS_E_24059:
NS_E_RDI_24059:
NS_E_24059_ETR_TBL:
NS_E_24059_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_25399
LB_25398:
	add r14,1
LB_25399:
	cmp r14,r10
	jge LB_25400
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25398
	cmp al,10
	jz LB_25398
	cmp al,32
	jz LB_25398
LB_25400:
	add r14,3
	cmp r14,r10
	jg LB_25403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_25403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_25403
	jmp LB_25404
LB_25403:
	jmp LB_25392
LB_25404:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_25406
LB_25405:
	add r14,1
LB_25406:
	cmp r14,r10
	jge LB_25407
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25405
	cmp al,10
	jz LB_25405
	cmp al,32
	jz LB_25405
LB_25407:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25408
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25409:
	jmp LB_25392
LB_25408:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_25412
LB_25411:
	add r14,1
LB_25412:
	cmp r14,r10
	jge LB_25413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25411
	cmp al,10
	jz LB_25411
	cmp al,32
	jz LB_25411
LB_25413:
	add r14,1
	cmp r14,r10
	jg LB_25418
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_25418
	jmp LB_25419
LB_25418:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25415
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25415:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25416:
	jmp LB_25392
LB_25419:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_25421
LB_25420:
	add r14,1
LB_25421:
	cmp r14,r10
	jge LB_25422
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25420
	cmp al,10
	jz LB_25420
	cmp al,32
	jz LB_25420
LB_25422:
	push r10
	call NS_E_24061_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25423
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25424
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25424:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25425
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25425:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25426
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25426:
	jmp LB_25392
LB_25423:
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
	jc LB_25393
	btr QWORD [rdi],3
LB_25393:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25394
	btr QWORD [rdi],2
LB_25394:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25395
	btr QWORD [rdi],1
LB_25395:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25396
	btr QWORD [rdi],0
LB_25396:
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
LB_25392:
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
NS_E_24061:
NS_E_RDI_24061:
NS_E_24061_ETR_TBL:
NS_E_24061_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_25455
LB_25454:
	add r14,1
LB_25455:
	cmp r14,r10
	jge LB_25456
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25454
	cmp al,10
	jz LB_25454
	cmp al,32
	jz LB_25454
LB_25456:
	push r10
	call NS_E_24063_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25457
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25428
LB_25457:
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
	jmp LB_25440
LB_25439:
	add r14,1
LB_25440:
	cmp r14,r10
	jge LB_25441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25439
	cmp al,10
	jz LB_25439
	cmp al,32
	jz LB_25439
LB_25441:
	add r14,3
	cmp r14,r10
	jg LB_25444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_25444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_25444
	jmp LB_25445
LB_25444:
	jmp LB_25429
LB_25445:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_25447
LB_25446:
	add r14,1
LB_25447:
	cmp r14,r10
	jge LB_25448
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25446
	cmp al,10
	jz LB_25446
	cmp al,32
	jz LB_25446
LB_25448:
	push r10
	call NS_E_24061_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25449
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25450
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25450:
	jmp LB_25429
LB_25449:
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
	jc LB_25434
	btr QWORD [rdi],1
LB_25434:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25435
	btr QWORD [rdi],0
LB_25435:
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
	jc LB_25437
	btr QWORD [rdi],0
LB_25437:
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
LB_25429:
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
	jc LB_25432
	btr QWORD [rdi],0
LB_25432:
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
LB_25430:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25452
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25452:
LB_25428:
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
NS_E_24063:
NS_E_RDI_24063:
NS_E_24063_ETR_TBL:
NS_E_24063_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_25486
LB_25485:
	add r14,1
LB_25486:
	cmp r14,r10
	jge LB_25487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25485
	cmp al,10
	jz LB_25485
	cmp al,32
	jz LB_25485
LB_25487:
	push r10
	call NS_E_24065_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25488
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25459
LB_25488:
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
	jmp LB_25471
LB_25470:
	add r14,1
LB_25471:
	cmp r14,r10
	jge LB_25472
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25470
	cmp al,10
	jz LB_25470
	cmp al,32
	jz LB_25470
LB_25472:
	add r14,3
	cmp r14,r10
	jg LB_25475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_25475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_25475
	jmp LB_25476
LB_25475:
	jmp LB_25460
LB_25476:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_25478
LB_25477:
	add r14,1
LB_25478:
	cmp r14,r10
	jge LB_25479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25477
	cmp al,10
	jz LB_25477
	cmp al,32
	jz LB_25477
LB_25479:
	push r10
	call NS_E_24065_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25480
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25481:
	jmp LB_25460
LB_25480:
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
	jc LB_25465
	btr QWORD [rdi],1
LB_25465:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25466
	btr QWORD [rdi],0
LB_25466:
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
	jc LB_25468
	btr QWORD [rdi],0
LB_25468:
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
LB_25460:
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
	jc LB_25463
	btr QWORD [rdi],0
LB_25463:
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
LB_25461:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25483
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25483:
LB_25459:
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
NS_E_24065:
NS_E_RDI_24065:
NS_E_24065_ETR_TBL:
NS_E_24065_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_25502
LB_25501:
	add r14,1
LB_25502:
	cmp r14,r10
	jge LB_25503
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25501
	cmp al,10
	jz LB_25501
	cmp al,32
	jz LB_25501
LB_25503:
	push r10
	call NS_E_24067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25504
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25490
LB_25504:
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
	jc LB_25499
	btr QWORD [rdi],0
LB_25499:
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
LB_25490:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_25495
LB_25494:
	add r14,1
LB_25495:
	cmp r14,r10
	jge LB_25496
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25494
	cmp al,10
	jz LB_25494
	cmp al,32
	jz LB_25494
LB_25496:
	push r10
	call NS_E_23021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25497
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25491
LB_25497:
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
	jc LB_25492
	btr QWORD [rdi],0
LB_25492:
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
LB_25491:
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
NS_E_24067:
NS_E_RDI_24067:
NS_E_24067_ETR_TBL:
NS_E_24067_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25513
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25506
LB_25513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_25521
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_25521
	jmp LB_25522
LB_25521:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25519
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25519:
	jmp LB_25506
LB_25522:
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
	jc LB_25507
	btr QWORD [rdi],1
LB_25507:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25508
	btr QWORD [rdi],0
LB_25508:
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
LB_25506:
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
NS_E_24069:
NS_E_RDI_24069:
NS_E_24069_ETR_TBL:
NS_E_24069_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "@"
	jmp LB_25553
LB_25552:
	add r14,1
LB_25553:
	cmp r14,r10
	jge LB_25554
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25552
	cmp al,10
	jz LB_25552
	cmp al,32
	jz LB_25552
LB_25554:
	add r14,1
	cmp r14,r10
	jg LB_25557
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_25557
	jmp LB_25558
LB_25557:
	jmp LB_25523
LB_25558:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_25560
LB_25559:
	add r14,1
LB_25560:
	cmp r14,r10
	jge LB_25561
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25559
	cmp al,10
	jz LB_25559
	cmp al,32
	jz LB_25559
LB_25561:
	add r14,1
	cmp r14,r10
	jg LB_25565
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_25565
	jmp LB_25566
LB_25565:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25563
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25563:
	jmp LB_25523
LB_25566:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_25568
LB_25567:
	add r14,1
LB_25568:
	cmp r14,r10
	jge LB_25569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25567
	cmp al,10
	jz LB_25567
	cmp al,32
	jz LB_25567
LB_25569:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25570
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25571
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25571:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25572
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25572:
	jmp LB_25523
LB_25570:
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
	jmp LB_25544
LB_25543:
	add r14,1
LB_25544:
	cmp r14,r10
	jge LB_25545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25543
	cmp al,10
	jz LB_25543
	cmp al,32
	jz LB_25543
LB_25545:
	push r10
	call NS_E_24071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25546
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25524
LB_25546:
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
	jc LB_25537
	btr QWORD [rdi],0
LB_25537:
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
	jc LB_25539
	btr QWORD [rdi],2
LB_25539:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25540
	btr QWORD [rdi],1
LB_25540:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25541
	btr QWORD [rdi],0
LB_25541:
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
LB_25524:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_25533
LB_25532:
	add r14,1
LB_25533:
	cmp r14,r10
	jge LB_25534
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25532
	cmp al,10
	jz LB_25532
	cmp al,32
	jz LB_25532
LB_25534:
	push r10
	call NS_E_24079_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25535
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25525
LB_25535:
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
	jc LB_25526
	btr QWORD [rdi],0
LB_25526:
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
	jc LB_25528
	btr QWORD [rdi],2
LB_25528:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25529
	btr QWORD [rdi],1
LB_25529:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25530
	btr QWORD [rdi],0
LB_25530:
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
LB_25525:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25548
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25548:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25549
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25549:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25550
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25550:
LB_25523:
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
NS_E_24071:
NS_E_RDI_24071:
NS_E_24071_ETR_TBL:
NS_E_24071_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord_end
	jmp LB_25763
LB_25762:
	add r14,1
LB_25763:
	cmp r14,r10
	jge LB_25764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25762
	cmp al,10
	jz LB_25762
	cmp al,32
	jz LB_25762
LB_25764:
	push r10
	call NS_E_24077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25765
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25574
LB_25765:
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
LB_25771:
	jmp LB_25768
LB_25767:
	add r14,1
LB_25768:
	cmp r14,r10
	jge LB_25769
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25767
	cmp al,10
	jz LB_25767
	cmp al,32
	jz LB_25767
LB_25769:
	push r10
	push rsi
	call NS_E_24073_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25770
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25772
	bts QWORD [rax],0
LB_25772:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25771
LB_25770:
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
	jmp LB_25636
LB_25635:
	add r14,1
LB_25636:
	cmp r14,r10
	jge LB_25637
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25635
	cmp al,10
	jz LB_25635
	cmp al,32
	jz LB_25635
LB_25637:
	add r14,1
	cmp r14,r10
	jg LB_25640
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_25640
	jmp LB_25641
LB_25640:
	jmp LB_25575
LB_25641:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_25643
LB_25642:
	add r14,1
LB_25643:
	cmp r14,r10
	jge LB_25644
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25642
	cmp al,10
	jz LB_25642
	cmp al,32
	jz LB_25642
LB_25644:
	add r14,3
	cmp r14,r10
	jg LB_25648
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25648
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_25648
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_25648
	jmp LB_25649
LB_25648:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25646
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25646:
	jmp LB_25575
LB_25649:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_25621
LB_25620:
	add r14,1
LB_25621:
	cmp r14,r10
	jge LB_25622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25620
	cmp al,10
	jz LB_25620
	cmp al,32
	jz LB_25620
LB_25622:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25623
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25624
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25624:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25625
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25625:
	jmp LB_25576
LB_25623:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_25628
LB_25627:
	add r14,1
LB_25628:
	cmp r14,r10
	jge LB_25629
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25627
	cmp al,10
	jz LB_25627
	cmp al,32
	jz LB_25627
LB_25629:
	push r10
	call NS_E_24071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25630
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25631
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25631:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25632
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25632:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25633:
	jmp LB_25576
LB_25630:
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
	jc LB_25612
	btr QWORD [rdi],3
LB_25612:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25613
	btr QWORD [rdi],2
LB_25613:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25614
	btr QWORD [rdi],1
LB_25614:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25615
	btr QWORD [rdi],0
LB_25615:
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
	jc LB_25617
	btr QWORD [rdi],1
LB_25617:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25618
	btr QWORD [rdi],0
LB_25618:
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
LB_25576:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25609
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25609:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25610
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25610:
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
LB_25575:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_25603
LB_25602:
	add r14,1
LB_25603:
	cmp r14,r10
	jge LB_25604
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25602
	cmp al,10
	jz LB_25602
	cmp al,32
	jz LB_25602
LB_25604:
	add r14,3
	cmp r14,r10
	jg LB_25607
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25607
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_25607
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_25607
	jmp LB_25608
LB_25607:
	jmp LB_25577
LB_25608:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_25590
LB_25589:
	add r14,1
LB_25590:
	cmp r14,r10
	jge LB_25591
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25589
	cmp al,10
	jz LB_25589
	cmp al,32
	jz LB_25589
LB_25591:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25592
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25593
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25593:
	jmp LB_25578
LB_25592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_25596
LB_25595:
	add r14,1
LB_25596:
	cmp r14,r10
	jge LB_25597
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25595
	cmp al,10
	jz LB_25595
	cmp al,32
	jz LB_25595
LB_25597:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25598
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25599
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25599:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25600:
	jmp LB_25578
LB_25598:
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
	jc LB_25582
	btr QWORD [rdi],2
LB_25582:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25583
	btr QWORD [rdi],1
LB_25583:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25584
	btr QWORD [rdi],0
LB_25584:
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
	jc LB_25586
	btr QWORD [rdi],1
LB_25586:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25587
	btr QWORD [rdi],0
LB_25587:
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
LB_25578:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25579
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25579:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25580
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25580:
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
LB_25577:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25759
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25759:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25760
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25760:
LB_25574:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord
	jmp LB_25749
LB_25748:
	add r14,1
LB_25749:
	cmp r14,r10
	jge LB_25750
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25748
	cmp al,10
	jz LB_25748
	cmp al,32
	jz LB_25748
LB_25750:
	push r10
	call NS_E_24075_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25751
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25650
LB_25751:
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
LB_25757:
	jmp LB_25754
LB_25753:
	add r14,1
LB_25754:
	cmp r14,r10
	jge LB_25755
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25753
	cmp al,10
	jz LB_25753
	cmp al,32
	jz LB_25753
LB_25755:
	push r10
	push rsi
	call NS_E_24073_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25756
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25758
	bts QWORD [rax],0
LB_25758:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25757
LB_25756:
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
	jmp LB_25731
LB_25730:
	add r14,1
LB_25731:
	cmp r14,r10
	jge LB_25732
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25730
	cmp al,10
	jz LB_25730
	cmp al,32
	jz LB_25730
LB_25732:
	add r14,1
	cmp r14,r10
	jg LB_25735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_25735
	jmp LB_25736
LB_25735:
	jmp LB_25651
LB_25736:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_25738
LB_25737:
	add r14,1
LB_25738:
	cmp r14,r10
	jge LB_25739
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25737
	cmp al,10
	jz LB_25737
	cmp al,32
	jz LB_25737
LB_25739:
	add r14,3
	cmp r14,r10
	jg LB_25743
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25743
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_25743
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_25743
	jmp LB_25744
LB_25743:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25741
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25741:
	jmp LB_25651
LB_25744:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_25707
LB_25706:
	add r14,1
LB_25707:
	cmp r14,r10
	jge LB_25708
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25706
	cmp al,10
	jz LB_25706
	cmp al,32
	jz LB_25706
LB_25708:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25709
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25710
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25710:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25711
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25711:
	jmp LB_25652
LB_25709:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_25714
LB_25713:
	add r14,1
LB_25714:
	cmp r14,r10
	jge LB_25715
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25713
	cmp al,10
	jz LB_25713
	cmp al,32
	jz LB_25713
LB_25715:
	push r10
	call NS_E_24071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25716
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25717
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25717:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25718
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25718:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25719
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25719:
	jmp LB_25652
LB_25716:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_25722
LB_25721:
	add r14,1
LB_25722:
	cmp r14,r10
	jge LB_25723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25721
	cmp al,10
	jz LB_25721
	cmp al,32
	jz LB_25721
LB_25723:
	push r10
	call NS_E_24071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25724
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_25725
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_25725:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25726
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25726:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25727
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25727:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25728
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25728:
	jmp LB_25652
LB_25724:
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
	jc LB_25697
	btr QWORD [rdi],4
LB_25697:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_25698
	btr QWORD [rdi],3
LB_25698:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25699
	btr QWORD [rdi],2
LB_25699:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25700
	btr QWORD [rdi],1
LB_25700:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25701
	btr QWORD [rdi],0
LB_25701:
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
	jc LB_25703
	btr QWORD [rdi],1
LB_25703:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25704
	btr QWORD [rdi],0
LB_25704:
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
LB_25652:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25694
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25694:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25695
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25695:
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
LB_25651:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\138\162"
	jmp LB_25688
LB_25687:
	add r14,1
LB_25688:
	cmp r14,r10
	jge LB_25689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25687
	cmp al,10
	jz LB_25687
	cmp al,32
	jz LB_25687
LB_25689:
	add r14,3
	cmp r14,r10
	jg LB_25692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_25692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_25692
	jmp LB_25693
LB_25692:
	jmp LB_25653
LB_25693:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_25667
LB_25666:
	add r14,1
LB_25667:
	cmp r14,r10
	jge LB_25668
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25666
	cmp al,10
	jz LB_25666
	cmp al,32
	jz LB_25666
LB_25668:
	push r10
	call NS_E_24051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25669
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25670
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25670:
	jmp LB_25654
LB_25669:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_25673
LB_25672:
	add r14,1
LB_25673:
	cmp r14,r10
	jge LB_25674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25672
	cmp al,10
	jz LB_25672
	cmp al,32
	jz LB_25672
LB_25674:
	push r10
	call NS_E_24027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25675
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25676
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25676:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25677
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25677:
	jmp LB_25654
LB_25675:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
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
	push r10
	call NS_E_24071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25682
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25683
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25683:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25684
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25684:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25685
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25685:
	jmp LB_25654
LB_25682:
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
	jc LB_25658
	btr QWORD [rdi],3
LB_25658:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_25659
	btr QWORD [rdi],2
LB_25659:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25660
	btr QWORD [rdi],1
LB_25660:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25661
	btr QWORD [rdi],0
LB_25661:
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
	jc LB_25663
	btr QWORD [rdi],1
LB_25663:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25664
	btr QWORD [rdi],0
LB_25664:
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
LB_25654:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25655
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25655:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25656
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25656:
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
LB_25653:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25745
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25745:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25746
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25746:
LB_25650:
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
NS_E_24073:
NS_E_RDI_24073:
NS_E_24073_ETR_TBL:
NS_E_24073_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_25795
LB_25794:
	add r14,1
LB_25795:
	cmp r14,r10
	jge LB_25796
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25794
	cmp al,10
	jz LB_25794
	cmp al,32
	jz LB_25794
LB_25796:
	add r14,3
	cmp r14,r10
	jg LB_25799
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25799
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_25799
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_25799
	jmp LB_25800
LB_25799:
	jmp LB_25773
LB_25800:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn
	jmp LB_25802
LB_25801:
	add r14,1
LB_25802:
	cmp r14,r10
	jge LB_25803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25801
	cmp al,10
	jz LB_25801
	cmp al,32
	jz LB_25801
LB_25803:
	push r10
	call NS_E_24073_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25804
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25805
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25805:
	jmp LB_25773
LB_25804:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_25808
LB_25807:
	add r14,1
LB_25808:
	cmp r14,r10
	jge LB_25809
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25807
	cmp al,10
	jz LB_25807
	cmp al,32
	jz LB_25807
LB_25809:
	add r14,3
	cmp r14,r10
	jg LB_25814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_25814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_25814
	jmp LB_25815
LB_25814:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25811
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25811:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25812
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25812:
	jmp LB_25773
LB_25815:
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
	jc LB_25790
	btr QWORD [rdi],2
LB_25790:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25791
	btr QWORD [rdi],1
LB_25791:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25792
	btr QWORD [rdi],0
LB_25792:
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
LB_25773:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_25786
LB_25785:
	add r14,1
LB_25786:
	cmp r14,r10
	jge LB_25787
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25785
	cmp al,10
	jz LB_25785
	cmp al,32
	jz LB_25785
LB_25787:
	push r10
	call NS_E_22524_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25788
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25774
LB_25788:
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
	jc LB_25783
	btr QWORD [rdi],0
LB_25783:
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
LB_25774:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_25779
LB_25778:
	add r14,1
LB_25779:
	cmp r14,r10
	jge LB_25780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25778
	cmp al,10
	jz LB_25778
	cmp al,32
	jz LB_25778
LB_25780:
	push r10
	call NS_E_23923_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25781
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25775
LB_25781:
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
	jc LB_25776
	btr QWORD [rdi],0
LB_25776:
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
LB_25775:
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
NS_E_24075:
NS_E_RDI_24075:
NS_E_24075_ETR_TBL:
NS_E_24075_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_25840
LB_25839:
	add r14,1
LB_25840:
	cmp r14,r10
	jge LB_25841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25839
	cmp al,10
	jz LB_25839
	cmp al,32
	jz LB_25839
LB_25841:
	add r14,4
	cmp r14,r10
	jg LB_25844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_25844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_25844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_25844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_25844
	jmp LB_25845
LB_25844:
	jmp LB_25816
LB_25845:
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
	jc LB_25837
	btr QWORD [rdi],0
LB_25837:
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
LB_25816:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_25831
LB_25830:
	add r14,1
LB_25831:
	cmp r14,r10
	jge LB_25832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25830
	cmp al,10
	jz LB_25830
	cmp al,32
	jz LB_25830
LB_25832:
	add r14,4
	cmp r14,r10
	jg LB_25835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_25835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_25835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_25835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_25835
	jmp LB_25836
LB_25835:
	jmp LB_25817
LB_25836:
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
	jc LB_25828
	btr QWORD [rdi],0
LB_25828:
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
LB_25817:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_25822
LB_25821:
	add r14,1
LB_25822:
	cmp r14,r10
	jge LB_25823
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25821
	cmp al,10
	jz LB_25821
	cmp al,32
	jz LB_25821
LB_25823:
	add r14,3
	cmp r14,r10
	jg LB_25826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_25826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_25826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_25826
	jmp LB_25827
LB_25826:
	jmp LB_25818
LB_25827:
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
	jc LB_25819
	btr QWORD [rdi],0
LB_25819:
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
LB_25818:
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
NS_E_24077:
NS_E_RDI_24077:
NS_E_24077_ETR_TBL:
NS_E_24077_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_25870
LB_25869:
	add r14,1
LB_25870:
	cmp r14,r10
	jge LB_25871
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25869
	cmp al,10
	jz LB_25869
	cmp al,32
	jz LB_25869
LB_25871:
	add r14,5
	cmp r14,r10
	jg LB_25874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_25874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_25874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_25874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_25874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_25874
	jmp LB_25875
LB_25874:
	jmp LB_25846
LB_25875:
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
	jc LB_25867
	btr QWORD [rdi],0
LB_25867:
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
LB_25846:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_25861
LB_25860:
	add r14,1
LB_25861:
	cmp r14,r10
	jge LB_25862
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25860
	cmp al,10
	jz LB_25860
	cmp al,32
	jz LB_25860
LB_25862:
	add r14,5
	cmp r14,r10
	jg LB_25865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_25865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_25865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_25865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_25865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_25865
	jmp LB_25866
LB_25865:
	jmp LB_25847
LB_25866:
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
	jc LB_25858
	btr QWORD [rdi],0
LB_25858:
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
LB_25847:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_25852
LB_25851:
	add r14,1
LB_25852:
	cmp r14,r10
	jge LB_25853
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25851
	cmp al,10
	jz LB_25851
	cmp al,32
	jz LB_25851
LB_25853:
	add r14,4
	cmp r14,r10
	jg LB_25856
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_25856
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_25856
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_25856
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_25856
	jmp LB_25857
LB_25856:
	jmp LB_25848
LB_25857:
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
	jc LB_25849
	btr QWORD [rdi],0
LB_25849:
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
LB_25848:
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
NS_E_24079:
NS_E_RDI_24079:
NS_E_24079_ETR_TBL:
NS_E_24079_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_25972
LB_25971:
	add r14,1
LB_25972:
	cmp r14,r10
	jge LB_25973
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25971
	cmp al,10
	jz LB_25971
	cmp al,32
	jz LB_25971
LB_25973:
	push r10
	call NS_E_24077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25974
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25876
LB_25974:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_25977
LB_25976:
	add r14,1
LB_25977:
	cmp r14,r10
	jge LB_25978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25976
	cmp al,10
	jz LB_25976
	cmp al,32
	jz LB_25976
LB_25978:
	push r10
	call NS_E_24081_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25979
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25980
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25980:
	jmp LB_25876
LB_25979:
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
LB_25986:
	jmp LB_25983
LB_25982:
	add r14,1
LB_25983:
	cmp r14,r10
	jge LB_25984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25982
	cmp al,10
	jz LB_25982
	cmp al,32
	jz LB_25982
LB_25984:
	push r10
	push rsi
	call NS_E_24073_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25985
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25987
	bts QWORD [rax],0
LB_25987:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25986
LB_25985:
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
	cmp al,59
	jnz LB_25896
	jmp LB_25897
LB_25896:
	jmp LB_25877
LB_25897:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_25899
LB_25898:
	add r14,1
LB_25899:
	cmp r14,r10
	jge LB_25900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25898
	cmp al,10
	jz LB_25898
	cmp al,32
	jz LB_25898
LB_25900:
	push r10
	call NS_E_24079_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25901
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25902:
	jmp LB_25877
LB_25901:
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
	jc LB_25884
	btr QWORD [rdi],1
LB_25884:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25885
	btr QWORD [rdi],0
LB_25885:
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
	jc LB_25887
	btr QWORD [rdi],2
LB_25887:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25888
	btr QWORD [rdi],1
LB_25888:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25889
	btr QWORD [rdi],0
LB_25889:
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
LB_25877:
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
	jc LB_25880
	btr QWORD [rdi],2
LB_25880:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25881
	btr QWORD [rdi],1
LB_25881:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25882
	btr QWORD [rdi],0
LB_25882:
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
LB_25878:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25967
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25967:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25968
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25968:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25969
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25969:
LB_25876:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord
	jmp LB_25951
LB_25950:
	add r14,1
LB_25951:
	cmp r14,r10
	jge LB_25952
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25950
	cmp al,10
	jz LB_25950
	cmp al,32
	jz LB_25950
LB_25952:
	push r10
	call NS_E_24075_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25953
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25904
LB_25953:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
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
	call NS_E_24081_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25958
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25959
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25959:
	jmp LB_25904
LB_25958:
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
LB_25965:
	jmp LB_25962
LB_25961:
	add r14,1
LB_25962:
	cmp r14,r10
	jge LB_25963
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25961
	cmp al,10
	jz LB_25961
	cmp al,32
	jz LB_25961
LB_25963:
	push r10
	push rsi
	call NS_E_24073_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_25964
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_25966
	bts QWORD [rax],0
LB_25966:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_25965
LB_25964:
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
	jmp LB_25927
LB_25926:
	add r14,1
LB_25927:
	cmp r14,r10
	jge LB_25928
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25926
	cmp al,10
	jz LB_25926
	cmp al,32
	jz LB_25926
LB_25928:
	add r14,1
	cmp r14,r10
	jg LB_25931
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_25931
	jmp LB_25932
LB_25931:
	jmp LB_25905
LB_25932:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_25934
LB_25933:
	add r14,1
LB_25934:
	cmp r14,r10
	jge LB_25935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25933
	cmp al,10
	jz LB_25933
	cmp al,32
	jz LB_25933
LB_25935:
	push r10
	call NS_E_24079_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25936
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25937
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25937:
	jmp LB_25905
LB_25936:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_cnc
	jmp LB_25940
LB_25939:
	add r14,1
LB_25940:
	cmp r14,r10
	jge LB_25941
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25939
	cmp al,10
	jz LB_25939
	cmp al,32
	jz LB_25939
LB_25941:
	push r10
	call NS_E_24079_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25942
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25943
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25943:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25944
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25944:
	jmp LB_25905
LB_25942:
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
	jc LB_25918
	btr QWORD [rdi],2
LB_25918:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25919
	btr QWORD [rdi],1
LB_25919:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25920
	btr QWORD [rdi],0
LB_25920:
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
	jc LB_25922
	btr QWORD [rdi],2
LB_25922:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25923
	btr QWORD [rdi],1
LB_25923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25924
	btr QWORD [rdi],0
LB_25924:
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
LB_25905:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_25914
LB_25913:
	add r14,1
LB_25914:
	cmp r14,r10
	jge LB_25915
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25913
	cmp al,10
	jz LB_25913
	cmp al,32
	jz LB_25913
LB_25915:
	push r10
	call NS_E_24079_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25916
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25906
LB_25916:
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
	jc LB_25907
	btr QWORD [rdi],0
LB_25907:
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
	jc LB_25909
	btr QWORD [rdi],2
LB_25909:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_25910
	btr QWORD [rdi],1
LB_25910:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25911
	btr QWORD [rdi],0
LB_25911:
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
LB_25906:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_25946
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_25946:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_25947
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_25947:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_25948
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_25948:
LB_25904:
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
NS_E_24081:
NS_E_RDI_24081:
NS_E_24081_ETR_TBL:
NS_E_24081_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_25995
LB_25994:
	add r14,1
LB_25995:
	cmp r14,r10
	jge LB_25996
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25994
	cmp al,10
	jz LB_25994
	cmp al,32
	jz LB_25994
LB_25996:
	push r10
	call NS_E_22892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_25997
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_25988
LB_25997:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_26000
LB_25999:
	add r14,1
LB_26000:
	cmp r14,r10
	jge LB_26001
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_25999
	cmp al,10
	jz LB_25999
	cmp al,32
	jz LB_25999
LB_26001:
	add r14,1
	cmp r14,r10
	jg LB_26005
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_26005
	jmp LB_26006
LB_26005:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_26003
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_26003:
	jmp LB_25988
LB_26006:
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
	jc LB_25991
	btr QWORD [rdi],1
LB_25991:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_25992
	btr QWORD [rdi],0
LB_25992:
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
LB_25988:
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
LB_25989:
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
NS_E_26030:
NS_E_RDI_26030:
; » _^ ..
	mov rax,102
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
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_26008 : %_26008
 ; {>  %_26007~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_26008
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f24017 { %_26007 %_26008 } ⊢ { %_26009 %_26010 %_26011 } : { %_26009 %_26010 %_26011 }
 ; {>  %_26007~0':_stg %_26008~1':_r64 }
; _f24017 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_24017
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_26031
	btr r12,4
	jmp LB_26032
LB_26031:
	bts r12,4
LB_26032:
	mov r8,r9
	bt r12,3
	jc LB_26035
	btr r12,2
	jmp LB_26036
LB_26035:
	bts r12,2
LB_26036:
	mov rsi,1
	bt r12,2
	jc LB_26033
	mov rsi,0
	bt r8,0
	jc LB_26033
	jmp LB_26034
LB_26033:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_26034:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_26009 %_26010 %_26011 } ⊢ { %_26012 %_26013 %_26014 } : { %_26012 %_26013 %_26014 }
 ; {>  %_26009~0':_stg %_26010~1':_r64 %_26011~2':(_opn)◂(_p24016) }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_26037
	btr r12,3
	jmp LB_26038
LB_26037:
	bts r12,3
LB_26038:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_26041
	btr r12,4
	jmp LB_26042
LB_26041:
	bts r12,4
LB_26042:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_26039
	btr QWORD [rdi],0
	jmp LB_26040
LB_26039:
	bts QWORD [rdi],0
LB_26040:
	mov r10,r14
	bt r12,1
	jc LB_26045
	btr r12,4
	jmp LB_26046
LB_26045:
	bts r12,4
LB_26046:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_26043
	btr QWORD [rdi],1
	jmp LB_26044
LB_26043:
	bts QWORD [rdi],1
LB_26044:
	mov r10,r8
	bt r12,2
	jc LB_26049
	btr r12,4
	jmp LB_26050
LB_26049:
	bts r12,4
LB_26050:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_26047
	btr QWORD [rdi],2
	jmp LB_26048
LB_26047:
	bts QWORD [rdi],2
LB_26048:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_26051
	btr r12,3
	jmp LB_26052
LB_26051:
	bts r12,3
LB_26052:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_26055
	btr r12,4
	jmp LB_26056
LB_26055:
	bts r12,4
LB_26056:
	mov r13,r10
	bt r12,4
	jc LB_26053
	btr r12,0
	jmp LB_26054
LB_26053:
	bts r12,0
LB_26054:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_26059
	btr r12,4
	jmp LB_26060
LB_26059:
	bts r12,4
LB_26060:
	mov r14,r10
	bt r12,4
	jc LB_26057
	btr r12,1
	jmp LB_26058
LB_26057:
	bts r12,1
LB_26058:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_26063
	btr r12,4
	jmp LB_26064
LB_26063:
	bts r12,4
LB_26064:
	mov r8,r10
	bt r12,4
	jc LB_26061
	btr r12,2
	jmp LB_26062
LB_26061:
	bts r12,2
LB_26062:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; 	» "OpADL.mdls" _ ⊢ 3' : %_26015
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,3
; _f20 %_26015 ⊢ { %_26016 %_26017 } : { %_26016 %_26017 }
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26012~0':_stg %_26015~3':_stg }
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
	jc LB_26071
	btr r12,0
	jmp LB_26072
LB_26071:
	bts r12,0
LB_26072:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 4' }
	mov r9,r13
	bt r12,0
	jc LB_26073
	btr r12,3
	jmp LB_26074
LB_26073:
	bts r12,3
LB_26074:
	mov r10,r14
	bt r12,1
	jc LB_26075
	btr r12,4
	jmp LB_26076
LB_26075:
	bts r12,4
LB_26076:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_26069
	btr r12,2
	jmp LB_26070
LB_26069:
	bts r12,2
LB_26070:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_26067
	btr r12,1
	jmp LB_26068
LB_26067:
	bts r12,1
LB_26068:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_26065
	btr r12,0
	jmp LB_26066
LB_26065:
	bts r12,0
LB_26066:
	add rsp,32
; _f21 { %_26016 %_26017 } ⊢ { %_26018 %_26019 } : { %_26018 %_26019 }
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26016~3':_stg %_26012~0':_stg %_26017~4':_stg }
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
	jc LB_26085
	btr r12,1
	jmp LB_26086
LB_26085:
	bts r12,1
LB_26086:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_26083
	btr QWORD [rdi],0
	jmp LB_26084
LB_26083:
	bts QWORD [rdi],0
LB_26084:
	mov r14,r10
	bt r12,4
	jc LB_26089
	btr r12,1
	jmp LB_26090
LB_26089:
	bts r12,1
LB_26090:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_26087
	btr QWORD [rdi],1
	jmp LB_26088
LB_26087:
	bts QWORD [rdi],1
LB_26088:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 3' 4' }
; 0' ⊢ { 3' 4' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_26093
	btr r12,1
	jmp LB_26094
LB_26093:
	bts r12,1
LB_26094:
	mov r9,r14
	bt r12,1
	jc LB_26091
	btr r12,3
	jmp LB_26092
LB_26091:
	bts r12,3
LB_26092:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_26097
	btr r12,1
	jmp LB_26098
LB_26097:
	bts r12,1
LB_26098:
	mov r10,r14
	bt r12,1
	jc LB_26095
	btr r12,4
	jmp LB_26096
LB_26095:
	bts r12,4
LB_26096:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_26081
	btr r12,2
	jmp LB_26082
LB_26081:
	bts r12,2
LB_26082:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_26079
	btr r12,1
	jmp LB_26080
LB_26079:
	bts r12,1
LB_26080:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_26077
	btr r12,0
	jmp LB_26078
LB_26077:
	bts r12,0
LB_26078:
	add rsp,32
; _f23813 %_26019 ⊢ { %_26020 %_26021 } : { %_26020 %_26021 }
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26018~3':_stg %_26012~0':_stg %_26019~4':_stg }
; _f23813 4' ⊢ { 4' 5' }
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
	jc LB_26107
	btr r12,0
	jmp LB_26108
LB_26107:
	bts r12,0
LB_26108:
	call NS_E_23813
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_26109
	btr r12,4
	jmp LB_26110
LB_26109:
	bts r12,4
LB_26110:
	mov r11,r14
	bt r12,1
	jc LB_26111
	btr r12,5
	jmp LB_26112
LB_26111:
	bts r12,5
LB_26112:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_26105
	btr r12,3
	jmp LB_26106
LB_26105:
	bts r12,3
LB_26106:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_26103
	btr r12,2
	jmp LB_26104
LB_26103:
	bts r12,2
LB_26104:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_26101
	btr r12,1
	jmp LB_26102
LB_26101:
	bts r12,1
LB_26102:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_26099
	btr r12,0
	jmp LB_26100
LB_26099:
	bts r12,0
LB_26100:
	add rsp,40
MTC_LB_26113:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_26114
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
	jnc LB_26115
	bt QWORD [rax],0
	jc LB_26116
	btr r12,7
	jmp LB_26117
LB_26116:
	bts r12,7
LB_26117:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_26115:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_26118
	btr r12,6
	jmp LB_26119
LB_26118:
	bts r12,6
LB_26119:
LB_26120:
	cmp r15,0
	jz LB_26121
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_26120
LB_26121:
; » 0xr0 |~ {  } ⊢ %_26023 : %_26023
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26018~3':_stg %_26012~0':_stg %_26022~6':_stg %_26020~4':_stg }
; 	» 0xr0 _ ⊢ 5' : %_26023
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f24017 { %_26022 %_26023 } ⊢ { %_26024 %_26025 %_26026 } : { %_26024 %_26025 %_26026 }
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26018~3':_stg %_26012~0':_stg %_26022~6':_stg %_26020~4':_stg %_26023~5':_r64 }
; _f24017 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_26132
	btr r12,0
	jmp LB_26133
LB_26132:
	bts r12,0
LB_26133:
	mov r14,r11
	bt r12,5
	jc LB_26134
	btr r12,1
	jmp LB_26135
LB_26134:
	bts r12,1
LB_26135:
	call NS_E_24017
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_26136
	btr r12,5
	jmp LB_26137
LB_26136:
	bts r12,5
LB_26137:
	mov rcx,r14
	bt r12,1
	jc LB_26138
	btr r12,6
	jmp LB_26139
LB_26138:
	bts r12,6
LB_26139:
	mov rdx,r9
	bt r12,3
	jc LB_26142
	btr r12,7
	jmp LB_26143
LB_26142:
	bts r12,7
LB_26143:
	mov rsi,1
	bt r12,7
	jc LB_26140
	mov rsi,0
	bt rdx,0
	jc LB_26140
	jmp LB_26141
LB_26140:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rdx
	mov rdx,rax
	btr r12,7
LB_26141:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_26130
	btr r12,4
	jmp LB_26131
LB_26130:
	bts r12,4
LB_26131:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_26128
	btr r12,3
	jmp LB_26129
LB_26128:
	bts r12,3
LB_26129:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_26126
	btr r12,2
	jmp LB_26127
LB_26126:
	bts r12,2
LB_26127:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_26124
	btr r12,1
	jmp LB_26125
LB_26124:
	bts r12,1
LB_26125:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_26122
	btr r12,0
	jmp LB_26123
LB_26122:
	bts r12,0
LB_26123:
	add rsp,48
; _f21 { %_26024 %_26025 %_26026 } ⊢ { %_26027 %_26028 %_26029 } : { %_26027 %_26028 %_26029 }
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26025~6':_r64 %_26018~3':_stg %_26012~0':_stg %_26026~7':(_opn)◂(_p24016) %_26024~5':_stg %_26020~4':_stg }
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
	jc LB_26156
	btr r12,1
	jmp LB_26157
LB_26156:
	bts r12,1
LB_26157:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_26154
	btr QWORD [rdi],0
	jmp LB_26155
LB_26154:
	bts QWORD [rdi],0
LB_26155:
	mov r14,rcx
	bt r12,6
	jc LB_26160
	btr r12,1
	jmp LB_26161
LB_26160:
	bts r12,1
LB_26161:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_26158
	btr QWORD [rdi],1
	jmp LB_26159
LB_26158:
	bts QWORD [rdi],1
LB_26159:
	mov r14,rdx
	bt r12,7
	jc LB_26164
	btr r12,1
	jmp LB_26165
LB_26164:
	bts r12,1
LB_26165:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_26162
	btr QWORD [rdi],2
	jmp LB_26163
LB_26162:
	bts QWORD [rdi],2
LB_26163:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_26168
	btr r12,1
	jmp LB_26169
LB_26168:
	bts r12,1
LB_26169:
	mov r11,r14
	bt r12,1
	jc LB_26166
	btr r12,5
	jmp LB_26167
LB_26166:
	bts r12,5
LB_26167:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_26172
	btr r12,1
	jmp LB_26173
LB_26172:
	bts r12,1
LB_26173:
	mov rcx,r14
	bt r12,1
	jc LB_26170
	btr r12,6
	jmp LB_26171
LB_26170:
	bts r12,6
LB_26171:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_26176
	btr r12,1
	jmp LB_26177
LB_26176:
	bts r12,1
LB_26177:
	mov rdx,r14
	bt r12,1
	jc LB_26174
	btr r12,7
	jmp LB_26175
LB_26174:
	bts r12,7
LB_26175:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_26152
	btr r12,4
	jmp LB_26153
LB_26152:
	bts r12,4
LB_26153:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_26150
	btr r12,3
	jmp LB_26151
LB_26150:
	bts r12,3
LB_26151:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_26148
	btr r12,2
	jmp LB_26149
LB_26148:
	bts r12,2
LB_26149:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_26146
	btr r12,1
	jmp LB_26147
LB_26146:
	bts r12,1
LB_26147:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_26144
	btr r12,0
	jmp LB_26145
LB_26144:
	bts r12,0
LB_26145:
	add rsp,48
; ∎ {  }
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26027~5':_stg %_26018~3':_stg %_26012~0':_stg %_26028~6':_r64 %_26029~7':(_opn)◂(_p24016) %_26020~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_26178
	mov rdi,r8
	call dlt
LB_26178:
	bt r12,1
	jc LB_26179
	mov rdi,r14
	call dlt
LB_26179:
	bt r12,5
	jc LB_26180
	mov rdi,r11
	call dlt
LB_26180:
	bt r12,3
	jc LB_26181
	mov rdi,r9
	call dlt
LB_26181:
	bt r12,0
	jc LB_26182
	mov rdi,r13
	call dlt
LB_26182:
	bt r12,6
	jc LB_26183
	mov rdi,rcx
	call dlt
LB_26183:
	bt r12,7
	jc LB_26184
	mov rdi,rdx
	call dlt
LB_26184:
	bt r12,4
	jc LB_26185
	mov rdi,r10
	call dlt
LB_26185:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_26114:
	mov r15,0
LB_26187:
	cmp r15,0
	jz LB_26188
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_26187
LB_26188:
; ∎ {  }
 ; {>  %_26014~2':(_opn)◂(_p24016) %_26013~1':_r64 %_26018~3':_stg %_26012~0':_stg %_26021~5':(_opn)◂(_stg) %_26020~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_26189
	mov rdi,r8
	call dlt
LB_26189:
	bt r12,1
	jc LB_26190
	mov rdi,r14
	call dlt
LB_26190:
	bt r12,3
	jc LB_26191
	mov rdi,r9
	call dlt
LB_26191:
	bt r12,0
	jc LB_26192
	mov rdi,r13
	call dlt
LB_26192:
	bt r12,5
	jc LB_26193
	mov rdi,r11
	call dlt
LB_26193:
	bt r12,4
	jc LB_26194
	mov rdi,r10
	call dlt
LB_26194:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_26186:
section .data
	NS_E_DYN_22451:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22451
	NS_E_DYN_22454:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22454
	NS_E_DYN_22455:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22455
	NS_E_DYN_22456:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22456
	NS_E_DYN_22457:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22457
	NS_E_DYN_22471:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22471
	NS_E_DYN_22514:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22514
	NS_E_DYN_22524:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22524
	NS_E_DYN_22525:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22525
	NS_E_DYN_22526:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22526
	NS_E_DYN_22744:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22744
	NS_E_DYN_22783:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22783
	NS_E_DYN_22822:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22822
	NS_E_DYN_22861:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22861
	NS_E_DYN_22892:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22892
	NS_E_DYN_22893:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22893
	NS_E_DYN_22894:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22894
	NS_E_DYN_23021:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_23021
	NS_E_DYN_23080:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_23081:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_23083:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_23084:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_23086:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_23087:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_23088:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_23088
	NS_E_DYN_23089:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_23089
	NS_E_DYN_23090:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_23090
	NS_E_DYN_23091:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_23091
	NS_E_DYN_23710:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_23710
	NS_E_DYN_23813:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_23813
	CST_DYN_23899:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_26030:
		dq 0x0000_0001_00_82_ffff
		dq 1
