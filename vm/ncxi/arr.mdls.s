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
	call NS_E_542
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
NS_E_499:
NS_E_RDI_499:
NS_E_499_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_500
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_500:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_502:
NS_E_RDI_502:
NS_E_502_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_502_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_502_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_503:
NS_E_RDI_503:
NS_E_503_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_503_LB_0
	cmp r11,57
	ja NS_E_503_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_503_LB_0:
	mov rax,0
	ret
NS_E_505:
NS_E_RDI_505:
NS_E_505_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_505_LB_0
	cmp r11,122
	ja NS_E_505_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_505_LB_0:
	mov rax,0
	ret
NS_E_504:
NS_E_RDI_504:
NS_E_504_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_504_LB_0
	cmp r11,90
	ja NS_E_504_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_504_LB_0:
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
	jc LB_507
	bt QWORD [rdi],17
	jnc LB_507
	bt QWORD [rdi],0
	jc LB_509
	btr r12,2
	clc
	jmp LB_510
LB_509:
	bts r12,2
	stc
LB_510:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_508
LB_507:
	btr r12,2
	clc
	call dcp
LB_508:
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
	jc LB_506
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_506:
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
NS_E_501:
NS_E_RDI_501:
NS_E_501_ETR_TBL:
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
	jz NS_E_501_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_501_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_542:
NS_E_RDI_542:
; » 0xr8 |~ {  } ⊢ %_511 : %_511
 ; {>  }
; 	» 0xr8 _ ⊢ 0' : %_511
	mov rdi,0x8
	mov r13,rdi
	bts r12,0
; 	» "H" _ ⊢ 1' : %_512
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_48
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; 	» "E" _ ⊢ 2' : %_513
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_45
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,2
; » 0xr4 |~ {  } ⊢ %_514 : %_514
 ; {>  %_511~0':_r64 %_513~2':_stg %_512~1':_stg }
; 	» 0xr4 _ ⊢ 3' : %_514
	mov rdi,0x4
	mov r9,rdi
	bts r12,3
; » 0xr5 |~ {  } ⊢ %_515 : %_515
 ; {>  %_511~0':_r64 %_514~3':_r64 %_513~2':_stg %_512~1':_stg }
; 	» 0xr5 _ ⊢ 4' : %_515
	mov rdi,0x5
	mov r10,rdi
	bts r12,4
; _f20 %_511 ⊢ { %_516 %_517 } : { %_516 %_517 }
 ; {>  %_511~0':_r64 %_514~3':_r64 %_513~2':_stg %_515~4':_r64 %_512~1':_stg }
; _f20 0' ⊢ { 0' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 5' }
	mov r11,r14
	bt r12,1
	jc LB_551
	btr r12,5
	jmp LB_552
LB_551:
	bts r12,5
LB_552:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_549
	btr r12,4
	clc
	jmp LB_550
LB_549:
	bts r12,4
	stc
LB_550:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_547
	btr r12,3
	clc
	jmp LB_548
LB_547:
	bts r12,3
	stc
LB_548:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_545
	btr r12,2
	clc
	jmp LB_546
LB_545:
	bts r12,2
	stc
LB_546:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_543
	btr r12,1
	clc
	jmp LB_544
LB_543:
	bts r12,1
	stc
LB_544:
	add rsp,40
; _f38 %_517 ⊢ %_518 : %_518
 ; {>  %_514~3':_r64 %_513~2':_stg %_517~5':(_p0)◂(t210'(0)) %_516~0':_r64 %_515~4':_r64 %_512~1':_stg }
; _f38 5' ⊢ 5'
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
	jc LB_563
	btr r12,0
	jmp LB_564
LB_563:
	bts r12,0
LB_564:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_565
	btr r12,5
	jmp LB_566
LB_565:
	bts r12,5
LB_566:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_561
	btr r12,4
	clc
	jmp LB_562
LB_561:
	bts r12,4
	stc
LB_562:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_559
	btr r12,3
	clc
	jmp LB_560
LB_559:
	bts r12,3
	stc
LB_560:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_557
	btr r12,2
	clc
	jmp LB_558
LB_557:
	bts r12,2
	stc
LB_558:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_555
	btr r12,1
	clc
	jmp LB_556
LB_555:
	bts r12,1
	stc
LB_556:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_553
	btr r12,0
	clc
	jmp LB_554
LB_553:
	bts r12,0
	stc
LB_554:
	add rsp,48
; _f22 { %_518 %_514 %_512 } ⊢ { %_519 %_520 } : { %_519 %_520 }
 ; {>  %_514~3':_r64 %_513~2':_stg %_516~0':_r64 %_515~4':_r64 %_512~1':_stg %_518~5':(_p0)◂(t214'(0)) }
; _f22 { 5' 3' 1' } ⊢ { 1' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0101010.. |},{ 5' 3' 1' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_573
	btr r12,0
	jmp LB_574
LB_573:
	bts r12,0
LB_574:
	mov r8,r14
	bt r12,1
	jc LB_575
	btr r12,2
	jmp LB_576
LB_575:
	bts r12,2
LB_576:
	mov r14,r9
	bt r12,3
	jc LB_577
	btr r12,1
	jmp LB_578
LB_577:
	bts r12,1
LB_578:
	call NS_E_22
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_579
	btr r12,3
	jmp LB_580
LB_579:
	bts r12,3
LB_580:
	mov r14,r13
	bt r12,0
	jc LB_581
	btr r12,1
	jmp LB_582
LB_581:
	bts r12,1
LB_582:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_571
	btr r12,4
	clc
	jmp LB_572
LB_571:
	bts r12,4
	stc
LB_572:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_569
	btr r12,2
	clc
	jmp LB_570
LB_569:
	bts r12,2
	stc
LB_570:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_567
	btr r12,0
	clc
	jmp LB_568
LB_567:
	bts r12,0
	stc
LB_568:
	add rsp,32
; _f22 { %_519 %_515 %_513 } ⊢ { %_521 %_522 } : { %_521 %_522 }
 ; {>  %_513~2':_stg %_516~0':_r64 %_515~4':_r64 %_519~1':(_p0)◂(_stg) %_520~3':_r64 }
; _f22 { 1' 4' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 011010.. |},{ 1' 4' 2' } ⊢ { 0' 1' 2' }
	mov r13,r14
	bt r12,1
	jc LB_587
	btr r12,0
	jmp LB_588
LB_587:
	bts r12,0
LB_588:
	mov r14,r10
	bt r12,4
	jc LB_589
	btr r12,1
	jmp LB_590
LB_589:
	bts r12,1
LB_590:
	call NS_E_22
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_591
	btr r12,2
	jmp LB_592
LB_591:
	bts r12,2
LB_592:
	mov r14,r13
	bt r12,0
	jc LB_593
	btr r12,1
	jmp LB_594
LB_593:
	bts r12,1
LB_594:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_585
	btr r12,3
	clc
	jmp LB_586
LB_585:
	bts r12,3
	stc
LB_586:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_583
	btr r12,0
	clc
	jmp LB_584
LB_583:
	bts r12,0
	stc
LB_584:
	add rsp,24
; _f23 { %_521 %_522 } ⊢ { %_523 %_524 %_525 } : { %_523 %_524 %_525 }
 ; {>  %_516~0':_r64 %_521~1':(_p0)◂(_stg) %_522~2':_r64 %_520~3':_r64 }
; _f23 { 1' 2' } ⊢ { 1' 2' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_599
	btr r12,0
	jmp LB_600
LB_599:
	bts r12,0
LB_600:
	mov r14,r8
	bt r12,2
	jc LB_601
	btr r12,1
	jmp LB_602
LB_601:
	bts r12,1
LB_602:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 1' 2' 4' }
	mov r10,r8
	bt r12,2
	jc LB_603
	btr r12,4
	jmp LB_604
LB_603:
	bts r12,4
LB_604:
	mov r8,r14
	bt r12,1
	jc LB_605
	btr r12,2
	jmp LB_606
LB_605:
	bts r12,2
LB_606:
	mov r14,r13
	bt r12,0
	jc LB_607
	btr r12,1
	jmp LB_608
LB_607:
	bts r12,1
LB_608:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_597
	btr r12,3
	clc
	jmp LB_598
LB_597:
	bts r12,3
	stc
LB_598:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_595
	btr r12,0
	clc
	jmp LB_596
LB_595:
	bts r12,0
	stc
LB_596:
	add rsp,24
; _f38 %_523 ⊢ %_526 : %_526
 ; {>  %_524~2':_r64 %_523~1':(_p0)◂(_stg) %_516~0':_r64 %_525~4':_stg %_520~3':_r64 }
; _f38 1' ⊢ 1'
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
	jc LB_617
	btr r12,0
	jmp LB_618
LB_617:
	bts r12,0
LB_618:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_619
	btr r12,1
	jmp LB_620
LB_619:
	bts r12,1
LB_620:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_615
	btr r12,4
	clc
	jmp LB_616
LB_615:
	bts r12,4
	stc
LB_616:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_613
	btr r12,3
	clc
	jmp LB_614
LB_613:
	bts r12,3
	stc
LB_614:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_611
	btr r12,2
	clc
	jmp LB_612
LB_611:
	bts r12,2
	stc
LB_612:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_609
	btr r12,0
	clc
	jmp LB_610
LB_609:
	bts r12,0
	stc
LB_610:
	add rsp,40
; _f38 %_525 ⊢ %_527 : %_527
 ; {>  %_524~2':_r64 %_526~1':(_p0)◂(_stg) %_516~0':_r64 %_525~4':_stg %_520~3':_r64 }
; _f38 4' ⊢ 4'
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
	jc LB_629
	btr r12,0
	jmp LB_630
LB_629:
	bts r12,0
LB_630:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_631
	btr r12,4
	jmp LB_632
LB_631:
	bts r12,4
LB_632:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_627
	btr r12,3
	clc
	jmp LB_628
LB_627:
	bts r12,3
	stc
LB_628:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_625
	btr r12,2
	clc
	jmp LB_626
LB_625:
	bts r12,2
	stc
LB_626:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_623
	btr r12,1
	clc
	jmp LB_624
LB_623:
	bts r12,1
	stc
LB_624:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_621
	btr r12,0
	clc
	jmp LB_622
LB_621:
	bts r12,0
	stc
LB_622:
	add rsp,40
; _f20 %_516 ⊢ { %_528 %_529 } : { %_528 %_529 }
 ; {>  %_524~2':_r64 %_526~1':(_p0)◂(_stg) %_516~0':_r64 %_527~4':_stg %_520~3':_r64 }
; _f20 0' ⊢ { 0' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 5' }
	mov r11,r14
	bt r12,1
	jc LB_641
	btr r12,5
	jmp LB_642
LB_641:
	bts r12,5
LB_642:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_639
	btr r12,4
	clc
	jmp LB_640
LB_639:
	bts r12,4
	stc
LB_640:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_637
	btr r12,3
	clc
	jmp LB_638
LB_637:
	bts r12,3
	stc
LB_638:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_635
	btr r12,2
	clc
	jmp LB_636
LB_635:
	bts r12,2
	stc
LB_636:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_633
	btr r12,1
	clc
	jmp LB_634
LB_633:
	bts r12,1
	stc
LB_634:
	add rsp,40
; _f22 { %_529 %_520 %_524 } ⊢ { %_530 %_531 } : { %_530 %_531 }
 ; {>  %_529~5':(_p0)◂(t231'(0)) %_524~2':_r64 %_526~1':(_p0)◂(_stg) %_528~0':_r64 %_527~4':_stg %_520~3':_r64 }
; _f22 { 5' 3' 2' } ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0011010.. |},{ 5' 3' 2' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_649
	btr r12,0
	jmp LB_650
LB_649:
	bts r12,0
LB_650:
	mov r14,r9
	bt r12,3
	jc LB_651
	btr r12,1
	jmp LB_652
LB_651:
	bts r12,1
LB_652:
	call NS_E_22
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_653
	btr r12,2
	jmp LB_654
LB_653:
	bts r12,2
LB_654:
	mov r9,r14
	bt r12,1
	jc LB_655
	btr r12,3
	jmp LB_656
LB_655:
	bts r12,3
LB_656:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_647
	btr r12,4
	clc
	jmp LB_648
LB_647:
	bts r12,4
	stc
LB_648:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_645
	btr r12,1
	clc
	jmp LB_646
LB_645:
	bts r12,1
	stc
LB_646:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_643
	btr r12,0
	clc
	jmp LB_644
LB_643:
	bts r12,0
	stc
LB_644:
	add rsp,32
; _f38 %_530 ⊢ %_532 : %_532
 ; {>  %_526~1':(_p0)◂(_stg) %_528~0':_r64 %_527~4':_stg %_531~3':_r64 %_530~2':(_p0)◂(_r64) }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_665
	btr r12,0
	jmp LB_666
LB_665:
	bts r12,0
LB_666:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_667
	btr r12,2
	jmp LB_668
LB_667:
	bts r12,2
LB_668:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_663
	btr r12,4
	clc
	jmp LB_664
LB_663:
	bts r12,4
	stc
LB_664:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_661
	btr r12,3
	clc
	jmp LB_662
LB_661:
	bts r12,3
	stc
LB_662:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_659
	btr r12,1
	clc
	jmp LB_660
LB_659:
	bts r12,1
	stc
LB_660:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_657
	btr r12,0
	clc
	jmp LB_658
LB_657:
	bts r12,0
	stc
LB_658:
	add rsp,40
; _f23 { %_532 %_531 } ⊢ { %_533 %_534 %_535 } : { %_533 %_534 %_535 }
 ; {>  %_526~1':(_p0)◂(_stg) %_528~0':_r64 %_532~2':(_p0)◂(_r64) %_527~4':_stg %_531~3':_r64 }
; _f23 { 2' 3' } ⊢ { 2' 3' 5' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},{ 2' 3' } ⊢ { 0' 1' }
	mov r13,r8
	bt r12,2
	jc LB_675
	btr r12,0
	jmp LB_676
LB_675:
	bts r12,0
LB_676:
	mov r14,r9
	bt r12,3
	jc LB_677
	btr r12,1
	jmp LB_678
LB_677:
	bts r12,1
LB_678:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 3' 5' }
	mov r9,r14
	bt r12,1
	jc LB_679
	btr r12,3
	jmp LB_680
LB_679:
	bts r12,3
LB_680:
	mov r11,r8
	bt r12,2
	jc LB_681
	btr r12,5
	jmp LB_682
LB_681:
	bts r12,5
LB_682:
	mov r8,r13
	bt r12,0
	jc LB_683
	btr r12,2
	jmp LB_684
LB_683:
	bts r12,2
LB_684:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_673
	btr r12,4
	clc
	jmp LB_674
LB_673:
	bts r12,4
	stc
LB_674:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_671
	btr r12,1
	clc
	jmp LB_672
LB_671:
	bts r12,1
	stc
LB_672:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_669
	btr r12,0
	clc
	jmp LB_670
LB_669:
	bts r12,0
	stc
LB_670:
	add rsp,32
; _f38 %_535 ⊢ %_536 : %_536
 ; {>  %_526~1':(_p0)◂(_stg) %_535~5':_r64 %_533~2':(_p0)◂(_r64) %_528~0':_r64 %_534~3':_r64 %_527~4':_stg }
; _f38 5' ⊢ 5'
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
	jc LB_695
	btr r12,0
	jmp LB_696
LB_695:
	bts r12,0
LB_696:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_697
	btr r12,5
	jmp LB_698
LB_697:
	bts r12,5
LB_698:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_693
	btr r12,4
	clc
	jmp LB_694
LB_693:
	bts r12,4
	stc
LB_694:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_691
	btr r12,3
	clc
	jmp LB_692
LB_691:
	bts r12,3
	stc
LB_692:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_689
	btr r12,2
	clc
	jmp LB_690
LB_689:
	bts r12,2
	stc
LB_690:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_687
	btr r12,1
	clc
	jmp LB_688
LB_687:
	bts r12,1
	stc
LB_688:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_685
	btr r12,0
	clc
	jmp LB_686
LB_685:
	bts r12,0
	stc
LB_686:
	add rsp,48
; » 0xr1 |~ {  } ⊢ %_537 : %_537
 ; {>  %_526~1':(_p0)◂(_stg) %_533~2':(_p0)◂(_r64) %_528~0':_r64 %_536~5':_r64 %_534~3':_r64 %_527~4':_stg }
; 	» 0xr1 _ ⊢ 6' : %_537
	mov rdi,0x1
	mov rcx,rdi
	bts r12,6
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ 7'
	mov rdx,rcx
	bt r12,6
	jc LB_699
	btr r12,7
	jmp LB_700
LB_699:
	bts r12,7
LB_700:
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rdx
	mov QWORD [rsp],r12
	mov rdi,rdx
	call dcp
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*6]
	bt QWORD rax,7
	jc LB_713
	btr r12,7
	clc
	jmp LB_714
LB_713:
	bts r12,7
	stc
LB_714:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_711
	btr r12,5
	clc
	jmp LB_712
LB_711:
	bts r12,5
	stc
LB_712:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_709
	btr r12,4
	clc
	jmp LB_710
LB_709:
	bts r12,4
	stc
LB_710:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_707
	btr r12,3
	clc
	jmp LB_708
LB_707:
	bts r12,3
	stc
LB_708:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_705
	btr r12,2
	clc
	jmp LB_706
LB_705:
	bts r12,2
	stc
LB_706:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_703
	btr r12,1
	clc
	jmp LB_704
LB_703:
	bts r12,1
	stc
LB_704:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_701
	btr r12,0
	clc
	jmp LB_702
LB_701:
	bts r12,0
	stc
LB_702:
	add rsp,64
	mov QWORD [st_vct+8*8],rax
	bt r12,7
	jc LB_715
	btr r12,8
	clc
	jmp LB_716
LB_715:
	bts r12,8
	stc
LB_716:
; _f38 { %_538 %_539 } ⊢ { %_540 %_541 } : { %_540 %_541 }
 ; {>  %_526~1':(_p0)◂(_stg) %_533~2':(_p0)◂(_r64) %_528~0':_r64 %_538~7':_r64 %_536~5':_r64 %_534~3':_r64 %_527~4':_stg %_539~8':_r64 }
; _f38 { 7' 8' } ⊢ { 6' 7' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000110.. |},{ 7' 8' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rdx
	bt r12,7
	jc LB_731
	btr r12,1
	jmp LB_732
LB_731:
	bts r12,1
LB_732:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_729
	btr QWORD [rdi],0
	jmp LB_730
LB_729:
	bts QWORD [rdi],0
LB_730:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_735
	btr r12,1
	jmp LB_736
LB_735:
	bts r12,1
LB_736:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_733
	btr QWORD [rdi],1
	jmp LB_734
LB_733:
	bts QWORD [rdi],1
LB_734:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' }
; 0' ⊢ { 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_739
	btr r12,1
	clc
	jmp LB_740
LB_739:
	bts r12,1
	stc
LB_740:
	mov rcx,r14
	bt r12,1
	jc LB_737
	btr r12,6
	jmp LB_738
LB_737:
	bts r12,6
LB_738:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_743
	btr r12,1
	clc
	jmp LB_744
LB_743:
	bts r12,1
	stc
LB_744:
	mov rdx,r14
	bt r12,1
	jc LB_741
	btr r12,7
	jmp LB_742
LB_741:
	bts r12,7
LB_742:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_727
	btr r12,5
	clc
	jmp LB_728
LB_727:
	bts r12,5
	stc
LB_728:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_725
	btr r12,4
	clc
	jmp LB_726
LB_725:
	bts r12,4
	stc
LB_726:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_723
	btr r12,3
	clc
	jmp LB_724
LB_723:
	bts r12,3
	stc
LB_724:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_721
	btr r12,2
	clc
	jmp LB_722
LB_721:
	bts r12,2
	stc
LB_722:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_719
	btr r12,1
	clc
	jmp LB_720
LB_719:
	bts r12,1
	stc
LB_720:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_717
	btr r12,0
	clc
	jmp LB_718
LB_717:
	bts r12,0
	stc
LB_718:
	add rsp,56
; ∎ {  }
 ; {>  %_526~1':(_p0)◂(_stg) %_541~7':_r64 %_533~2':(_p0)◂(_r64) %_528~0':_r64 %_536~5':_r64 %_540~6':_r64 %_534~3':_r64 %_527~4':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_745
	mov rdi,r14
	call dlt
LB_745:
	bt r12,7
	jc LB_746
	mov rdi,rdx
	call dlt
LB_746:
	bt r12,2
	jc LB_747
	mov rdi,r8
	call dlt
LB_747:
	bt r12,0
	jc LB_748
	mov rdi,r13
	call dlt
LB_748:
	bt r12,5
	jc LB_749
	mov rdi,r11
	call dlt
LB_749:
	bt r12,6
	jc LB_750
	mov rdi,rcx
	call dlt
LB_750:
	bt r12,3
	jc LB_751
	mov rdi,r9
	call dlt
LB_751:
	bt r12,4
	jc LB_752
	mov rdi,r10
	call dlt
LB_752:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	CST_DYN_542:
		dq 0x0000_0001_00_82_ffff
		dq 1
