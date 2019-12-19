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
	call NS_E_512
	call exec_out
	jmp _end
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
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
NS_E_491:
NS_E_RDI_491:
NS_E_491_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_492
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_492:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_494:
NS_E_RDI_494:
NS_E_494_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_494_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_494_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_495:
NS_E_RDI_495:
NS_E_495_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_495_LB_0
	cmp r11,57
	ja NS_E_495_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_495_LB_0:
	mov rax,0
	ret
NS_E_497:
NS_E_RDI_497:
NS_E_497_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_497_LB_0
	cmp r11,122
	ja NS_E_497_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_497_LB_0:
	mov rax,0
	ret
NS_E_496:
NS_E_RDI_496:
NS_E_496_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_496_LB_0
	cmp r11,90
	ja NS_E_496_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_496_LB_0:
	mov rax,0
	ret
NS_E_44:
	mov rdi,r13
	bt r12,0
NS_E_RDI_44:
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
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
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
	jc LB_498
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_498:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
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
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_30: dq 0
NS_E_30:
NS_E_RDI_30:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_493:
NS_E_RDI_493:
NS_E_493_ETR_TBL:
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
	jz NS_E_493_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_493_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_512:
NS_E_RDI_512:
; » 0xr8 |~ {  } ⊢ %_499 : %_499
 ; {>  }
; 	» 0xr8 _ ⊢ 0' : %_499
	mov rdi,0x8
	mov r13,rdi
	bts r12,0
; 	» "H" _ ⊢ 1' : %_500
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_48
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; 	» "E" _ ⊢ 2' : %_501
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_45
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,2
; » 0xr4 |~ {  } ⊢ %_502 : %_502
 ; {>  %_501~2':_stg %_500~1':_stg %_499~0':_r64 }
; 	» 0xr4 _ ⊢ 3' : %_502
	mov rdi,0x4
	mov r9,rdi
	bts r12,3
; » 0xr5 |~ {  } ⊢ %_503 : %_503
 ; {>  %_501~2':_stg %_500~1':_stg %_502~3':_r64 %_499~0':_r64 }
; 	» 0xr5 _ ⊢ 4' : %_503
	mov rdi,0x5
	mov r10,rdi
	bts r12,4
; _f19 %_499 ⊢ { %_504 %_505 } : { %_504 %_505 }
 ; {>  %_501~2':_stg %_500~1':_stg %_502~3':_r64 %_499~0':_r64 %_503~4':_r64 }
; _f19 0' ⊢ { 0' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 5' }
	mov r11,r14
	bt r12,1
	jc LB_521
	btr r12,5
	jmp LB_522
LB_521:
	bts r12,5
LB_522:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_519
	btr r12,4
	jmp LB_520
LB_519:
	bts r12,4
LB_520:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_517
	btr r12,3
	jmp LB_518
LB_517:
	bts r12,3
LB_518:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_515
	btr r12,2
	jmp LB_516
LB_515:
	bts r12,2
LB_516:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_513
	btr r12,1
	jmp LB_514
LB_513:
	bts r12,1
LB_514:
	add rsp,40
; _f37 %_505 ⊢ %_506 : %_506
 ; {>  %_504~0':_r64 %_501~2':_stg %_500~1':_stg %_502~3':_r64 %_505~5':(_p0)◂(t289'(0)) %_503~4':_r64 }
; _f37 5' ⊢ 5'
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
	jc LB_533
	btr r12,0
	jmp LB_534
LB_533:
	bts r12,0
LB_534:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_535
	btr r12,5
	jmp LB_536
LB_535:
	bts r12,5
LB_536:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_531
	btr r12,4
	jmp LB_532
LB_531:
	bts r12,4
LB_532:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_529
	btr r12,3
	jmp LB_530
LB_529:
	bts r12,3
LB_530:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_527
	btr r12,2
	jmp LB_528
LB_527:
	bts r12,2
LB_528:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_525
	btr r12,1
	jmp LB_526
LB_525:
	bts r12,1
LB_526:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_523
	btr r12,0
	jmp LB_524
LB_523:
	bts r12,0
LB_524:
	add rsp,48
; _f21 { %_506 %_502 %_500 } ⊢ { %_507 %_508 } : { %_507 %_508 }
 ; {>  %_504~0':_r64 %_506~5':(_p0)◂(t293'(0)) %_501~2':_stg %_500~1':_stg %_502~3':_r64 %_503~4':_r64 }
; _f21 { 5' 3' 1' } ⊢ { 1' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0101010.. |},{ 5' 3' 1' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_543
	btr r12,0
	jmp LB_544
LB_543:
	bts r12,0
LB_544:
	mov r8,r14
	bt r12,1
	jc LB_545
	btr r12,2
	jmp LB_546
LB_545:
	bts r12,2
LB_546:
	mov r14,r9
	bt r12,3
	jc LB_547
	btr r12,1
	jmp LB_548
LB_547:
	bts r12,1
LB_548:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_549
	btr r12,3
	jmp LB_550
LB_549:
	bts r12,3
LB_550:
	mov r14,r13
	bt r12,0
	jc LB_551
	btr r12,1
	jmp LB_552
LB_551:
	bts r12,1
LB_552:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_541
	btr r12,4
	jmp LB_542
LB_541:
	bts r12,4
LB_542:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_539
	btr r12,2
	jmp LB_540
LB_539:
	bts r12,2
LB_540:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_537
	btr r12,0
	jmp LB_538
LB_537:
	bts r12,0
LB_538:
	add rsp,32
; _f21 { %_507 %_504 %_501 } ⊢ { %_509 %_510 } : { %_509 %_510 }
 ; {>  %_504~0':_r64 %_501~2':_stg %_507~1':(_p0)◂(_stg) %_508~3':_r64 %_503~4':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_557
	btr r12,3
	jmp LB_558
LB_557:
	bts r12,3
LB_558:
	mov r14,r13
	bt r12,0
	jc LB_559
	btr r12,1
	jmp LB_560
LB_559:
	bts r12,1
LB_560:
	mov r13,r9
	bt r12,3
	jc LB_561
	btr r12,0
	jmp LB_562
LB_561:
	bts r12,0
LB_562:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_555
	btr r12,4
	jmp LB_556
LB_555:
	bts r12,4
LB_556:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_553
	btr r12,3
	jmp LB_554
LB_553:
	bts r12,3
LB_554:
	add rsp,24
; _f37 %_509 ⊢ %_511 : %_511
 ; {>  %_509~0':(_p0)◂(_stg) %_510~1':_r64 %_508~3':_r64 %_503~4':_r64 }
; _f37 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_567
	btr r12,4
	jmp LB_568
LB_567:
	bts r12,4
LB_568:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_565
	btr r12,3
	jmp LB_566
LB_565:
	bts r12,3
LB_566:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_563
	btr r12,1
	jmp LB_564
LB_563:
	bts r12,1
LB_564:
	add rsp,32
; ∎ {  }
 ; {>  %_511~0':(_p0)◂(_stg) %_510~1':_r64 %_508~3':_r64 %_503~4':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_569
	mov rdi,r13
	call dlt
LB_569:
	bt r12,1
	jc LB_570
	mov rdi,r14
	call dlt
LB_570:
	bt r12,3
	jc LB_571
	mov rdi,r9
	call dlt
LB_571:
	bt r12,4
	jc LB_572
	mov rdi,r10
	call dlt
LB_572:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_491:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_491
	NS_E_DYN_494:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_494
	NS_E_DYN_495:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_495
	NS_E_DYN_496:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_496
	NS_E_DYN_497:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_497
	CST_DYN_512:
		dq 0x0000_0001_00_82_ffff
		dq 1
