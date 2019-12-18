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
	call NS_E_559
	call NS_E_737
	call NS_E_744
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
NS_E_544:
NS_E_RDI_544:
NS_E_544_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_545
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_545:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_547:
NS_E_RDI_547:
NS_E_547_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_547_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_547_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_548:
NS_E_RDI_548:
NS_E_548_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_548_LB_0
	cmp r11,57
	ja NS_E_548_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_548_LB_0:
	mov rax,0
	ret
NS_E_550:
NS_E_RDI_550:
NS_E_550_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_550_LB_0
	cmp r11,122
	ja NS_E_550_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_550_LB_0:
	mov rax,0
	ret
NS_E_549:
NS_E_RDI_549:
NS_E_549_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_549_LB_0
	cmp r11,90
	ja NS_E_549_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_549_LB_0:
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
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
	mov eax,DWORD [rdi+4]
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
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
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
NS_E_546:
NS_E_RDI_546:
NS_E_546_ETR_TBL:
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
	jz NS_E_546_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_546_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_559:
NS_E_RDI_559:
; 	» "-27686gg" _ ⊢ 0' : %_551
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » _f15 |~ {  } ⊢ %_552 : %_552
 ; {>  %_551~0':_stg }
; 	» _args _ ⊢ 1' : %_552
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
	mov r14,rax
	btr r12,1
; » _f15 |~ {  } ⊢ %_553 : %_553
 ; {>  %_551~0':_stg %_552~1':(_lst)◂(_stg) }
; 	» _args _ ⊢ 2' : %_553
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
; » _f15 |~ {  } ⊢ %_554 : %_554
 ; {>  %_551~0':_stg %_553~2':(_lst)◂(_stg) %_552~1':(_lst)◂(_stg) }
; 	» _args _ ⊢ 3' : %_554
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
	mov r9,rax
	btr r12,3
; _f26 { %_552 %_553 %_554 } ⊢ { %_555 %_556 %_557 } : { %_555 %_556 %_557 }
 ; {>  %_551~0':_stg %_553~2':(_lst)◂(_stg) %_552~1':(_lst)◂(_stg) %_554~3':(_lst)◂(_stg) }
; _f26 { 1' 2' 3' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110.. |},{ 1' 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r14
	bt r12,1
	jc LB_564
	btr r12,4
	jmp LB_565
LB_564:
	bts r12,4
LB_565:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_562
	btr QWORD [rdi],0
	jmp LB_563
LB_562:
	bts QWORD [rdi],0
LB_563:
	mov r10,r8
	bt r12,2
	jc LB_568
	btr r12,4
	jmp LB_569
LB_568:
	bts r12,4
LB_569:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_566
	btr QWORD [rdi],1
	jmp LB_567
LB_566:
	bts QWORD [rdi],1
LB_567:
	mov r10,r9
	bt r12,3
	jc LB_572
	btr r12,4
	jmp LB_573
LB_572:
	bts r12,4
LB_573:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_570
	btr QWORD [rdi],2
	jmp LB_571
LB_570:
	bts QWORD [rdi],2
LB_571:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' 3' }
; 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_576
	btr r12,4
	jmp LB_577
LB_576:
	bts r12,4
LB_577:
	mov r14,r10
	bt r12,4
	jc LB_574
	btr r12,1
	jmp LB_575
LB_574:
	bts r12,1
LB_575:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_580
	btr r12,4
	jmp LB_581
LB_580:
	bts r12,4
LB_581:
	mov r8,r10
	bt r12,4
	jc LB_578
	btr r12,2
	jmp LB_579
LB_578:
	bts r12,2
LB_579:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_584
	btr r12,4
	jmp LB_585
LB_584:
	bts r12,4
LB_585:
	mov r9,r10
	bt r12,4
	jc LB_582
	btr r12,3
	jmp LB_583
LB_582:
	bts r12,3
LB_583:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_560
	btr r12,0
	jmp LB_561
LB_560:
	bts r12,0
LB_561:
	add rsp,16
; _f26 %_551 ⊢ %_558 : %_558
 ; {>  %_551~0':_stg %_556~2':(_lst)◂(_stg) %_557~3':(_lst)◂(_stg) %_555~1':(_lst)◂(_stg) }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_590
	btr r12,3
	jmp LB_591
LB_590:
	bts r12,3
LB_591:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_588
	btr r12,2
	jmp LB_589
LB_588:
	bts r12,2
LB_589:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_586
	btr r12,1
	jmp LB_587
LB_586:
	bts r12,1
LB_587:
	add rsp,32
; ∎ {  }
 ; {>  %_558~0':_stg %_556~2':(_lst)◂(_stg) %_557~3':(_lst)◂(_stg) %_555~1':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_592
	mov rdi,r13
	call dlt
LB_592:
	bt r12,2
	jc LB_593
	mov rdi,r8
	call dlt
LB_593:
	bt r12,3
	jc LB_594
	mov rdi,r9
	call dlt
LB_594:
	bt r12,1
	jc LB_595
	mov rdi,r14
	call dlt
LB_595:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_603:
; 	|» 0'
NS_E_RDI_603:
MTC_LB_604:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_605
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
	jnc LB_606
	bt QWORD [rdi],0
	jc LB_607
	btr r12,3
	jmp LB_608
LB_607:
	bts r12,3
LB_608:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_606:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_611
	btr r12,4
	jmp LB_612
LB_611:
	bts r12,4
LB_612:
	mov r14,r10
	bt r12,4
	jc LB_609
	btr r12,1
	jmp LB_610
LB_609:
	bts r12,1
LB_610:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_615
	btr r12,4
	jmp LB_616
LB_615:
	bts r12,4
LB_616:
	mov r8,r10
	bt r12,4
	jc LB_613
	btr r12,2
	jmp LB_614
LB_613:
	bts r12,2
LB_614:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_605
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
	jnc LB_617
	bt QWORD [rdi],0
	jc LB_618
	btr r12,5
	jmp LB_619
LB_618:
	bts r12,5
LB_619:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_617:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_622
	btr r12,6
	jmp LB_623
LB_622:
	bts r12,6
LB_623:
	mov r9,rcx
	bt r12,6
	jc LB_620
	btr r12,3
	jmp LB_621
LB_620:
	bts r12,3
LB_621:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_626
	btr r12,6
	jmp LB_627
LB_626:
	bts r12,6
LB_627:
	mov r10,rcx
	bt r12,6
	jc LB_624
	btr r12,4
	jmp LB_625
LB_624:
	bts r12,4
LB_625:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_628:
	cmp r15,0
	jz LB_629
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_628
LB_629:
; ∎ {  }
 ; {>  %_600~4':(_lst)◂(t307'(-1)) %_597~1':t307'(-1) %_599~3':t307'(-1) }
; 	∎ {  }
	bt r12,4
	jc LB_630
	mov rdi,r10
	call dlt
LB_630:
	bt r12,1
	jc LB_631
	mov rdi,r14
	call dlt
LB_631:
	bt r12,3
	jc LB_632
	mov rdi,r9
	call dlt
LB_632:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_605:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_633
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
	jnc LB_634
	bt QWORD [rdi],0
	jc LB_635
	btr r12,3
	jmp LB_636
LB_635:
	bts r12,3
LB_636:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_634:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_639
	btr r12,4
	jmp LB_640
LB_639:
	bts r12,4
LB_640:
	mov r14,r10
	bt r12,4
	jc LB_637
	btr r12,1
	jmp LB_638
LB_637:
	bts r12,1
LB_638:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_643
	btr r12,4
	jmp LB_644
LB_643:
	bts r12,4
LB_644:
	mov r8,r10
	bt r12,4
	jc LB_641
	btr r12,2
	jmp LB_642
LB_641:
	bts r12,2
LB_642:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_633
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_645
	bt QWORD [rdi],0
	jc LB_646
	btr r12,3
	jmp LB_647
LB_646:
	bts r12,3
LB_647:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_645:
	mov r9,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_648:
	cmp r15,0
	jz LB_649
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_648
LB_649:
; ∎ {  }
 ; {>  %_601~1':t307'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_650
	mov rdi,r14
	call dlt
LB_650:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_633:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_651
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
	jnc LB_652
	bt QWORD [rdi],0
	jc LB_653
	btr r12,1
	jmp LB_654
LB_653:
	bts r12,1
LB_654:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_652:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_655:
	cmp r15,0
	jz LB_656
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_655
LB_656:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_651:
NS_E_657:
NS_E_RDI_657:
NS_E_657_ETR_TBL:
NS_E_657_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_684
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_684
	jmp LB_685
LB_684:
	jmp LB_667
LB_685:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; g0
	push r10
	call NS_E_657_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_676
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_677
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_677:
	jmp LB_668
LB_676:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_671
	btr r12,1
	jmp LB_672
LB_671:
	bts r12,1
LB_672:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_669
	btr r12,0
	jmp LB_670
LB_669:
	bts r12,0
LB_670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_664
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_686
	btr r12,2
	jmp LB_687
LB_686:
	bts r12,2
LB_687:
	mov r13,r14
	bt r12,1
	jc LB_688
	btr r12,0
	jmp LB_689
LB_688:
	bts r12,0
LB_689:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_658 ⊢ %_659 : %_659
 ; {>  %_658~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_659
 ; {>  %_659~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_662
	btr r12,3
	jmp LB_663
LB_662:
	bts r12,3
LB_663:
	mov r8,0
	bts r12,2
	ret
LB_664:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_666
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_665
LB_666:
	add rsp,8
	ret
LB_668:
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
LB_667:
	add rsp,32
	pop r14
LB_665:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "C"
	add r14,1
	cmp r14,r10
	jg LB_703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_703
	jmp LB_704
LB_703:
	jmp LB_695
LB_704:
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
	jc LB_696
	btr r12,0
	jmp LB_697
LB_696:
	bts r12,0
LB_697:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_692
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_660 : %_660
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_660
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_660 ⊢ %_661 : %_661
 ; {>  %_660~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_661
 ; {>  %_661~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_690
	btr r12,3
	jmp LB_691
LB_690:
	bts r12,3
LB_691:
	mov r8,0
	bts r12,2
	ret
LB_692:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_694
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_693
LB_694:
	add rsp,8
	ret
LB_695:
	add rsp,16
	pop r14
LB_693:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_711:
; 	|» 0'
NS_E_RDI_711:
MTC_LB_712:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_713
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
	jnc LB_714
	bt QWORD [rdi],0
	jc LB_715
	btr r12,2
	jmp LB_716
LB_715:
	bts r12,2
LB_716:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_714:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_717
	btr r12,1
	jmp LB_718
LB_717:
	bts r12,1
LB_718:
LB_719:
	cmp r15,0
	jz LB_720
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_719
LB_720:
; ∎ {  }
 ; {>  %_709~1':(_lst)◂((_p705)◂(t337'(-1))) }
; 	∎ {  }
	bt r12,1
	jc LB_721
	mov rdi,r14
	call dlt
LB_721:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_713:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_722
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
	jnc LB_723
	bt QWORD [rdi],0
	jc LB_724
	btr r12,2
	jmp LB_725
LB_724:
	bts r12,2
LB_725:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_723:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_726
	btr r12,1
	jmp LB_727
LB_726:
	bts r12,1
LB_727:
LB_728:
	cmp r15,0
	jz LB_729
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_728
LB_729:
; ∎ {  }
 ; {>  %_710~1':t337'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_730
	mov rdi,r14
	call dlt
LB_730:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_722:
NS_E_737:
NS_E_RDI_737:
; 	» "A" _ ⊢ 0' : %_731
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr1 |~ {  } ⊢ %_732 : %_732
 ; {>  %_731~0':_stg }
; 	» 0xr1 _ ⊢ 1' : %_732
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_733 : %_733
 ; {>  %_731~0':_stg %_732~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f706 %_733 ⊢ %_734 : %_734
 ; {>  %_731~0':_stg %_732~1':_r64 %_733~°1◂{  }:(_lst)◂(t345'(0)) }
; _f706 °1◂{  } ⊢ °0◂°1◂{  }
; _f707 %_732 ⊢ %_735 : %_735
 ; {>  %_731~0':_stg %_732~1':_r64 %_734~°0◂°1◂{  }:(_p705)◂(t347'(0)) }
; _f707 1' ⊢ °1◂1'
; _f707 %_731 ⊢ %_736 : %_736
 ; {>  %_731~0':_stg %_735~°1◂1':(_p705)◂(_r64) %_734~°0◂°1◂{  }:(_p705)◂(t347'(0)) }
; _f707 0' ⊢ °1◂0'
; ∎ {  }
 ; {>  %_735~°1◂1':(_p705)◂(_r64) %_734~°0◂°1◂{  }:(_p705)◂(t347'(0)) %_736~°1◂0':(_p705)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_738
	mov rdi,r14
	call dlt
LB_738:
	bt r12,0
	jc LB_739
	mov rdi,r13
	call dlt
LB_739:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_744:
NS_E_RDI_744:
; » 0xr9 |~ {  } ⊢ %_740 : %_740
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_740
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,2
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\tX"
	mov rax,r13
LB_745:
	cmp rax,0
	jz LB_746
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_58
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
	sub rax,1
	jmp LB_745
LB_746:
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; _f26 %_742 ⊢ %_743 : %_743
 ; {>  %_741~0':_r64 %_742~1':_stg }
; _f26 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_749
	btr r12,0
	jmp LB_750
LB_749:
	bts r12,0
LB_750:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_751
	btr r12,1
	jmp LB_752
LB_751:
	bts r12,1
LB_752:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_747
	btr r12,0
	jmp LB_748
LB_747:
	bts r12,0
LB_748:
	add rsp,16
; ∎ {  }
 ; {>  %_741~0':_r64 %_743~1':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_753
	mov rdi,r13
	call dlt
LB_753:
	bt r12,1
	jc LB_754
	mov rdi,r14
	call dlt
LB_754:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_768:
; 	|» { 0' 1' }
NS_E_RDI_768:
MTC_LB_769:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_770
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
	jnc LB_771
	bt QWORD [rdi],0
	jc LB_772
	btr r12,4
	jmp LB_773
LB_772:
	bts r12,4
LB_773:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_771:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_776
	btr r12,5
	jmp LB_777
LB_776:
	bts r12,5
LB_777:
	mov r8,r11
	bt r12,5
	jc LB_774
	btr r12,2
	jmp LB_775
LB_774:
	bts r12,2
LB_775:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_780
	btr r12,5
	jmp LB_781
LB_780:
	bts r12,5
LB_781:
	mov r9,r11
	bt r12,5
	jc LB_778
	btr r12,3
	jmp LB_779
LB_778:
	bts r12,3
LB_779:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_782:
	cmp r15,0
	jz LB_783
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_782
LB_783:
; _f41 %_755 ⊢ { %_759 %_760 } : { %_759 %_760 }
 ; {>  %_758~3':(_lst)◂(_r64) %_757~2':_r64 %_755~0':_r64 }
	mov r14,r13
	bts r12,1
; _f44 %_760 ⊢ %_761 : %_761
 ; {>  %_758~3':(_lst)◂(_r64) %_757~2':_r64 %_759~0':_r64 %_760~1':_r64 }
	add r14,1
; _f768 { %_761 %_758 } ⊢ %_762 : %_762
 ; {>  %_758~3':(_lst)◂(_r64) %_757~2':_r64 %_761~1':_r64 %_759~0':_r64 }
; _f768 { 1' 3' } ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 1' 3' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_788
	btr r12,0
	jmp LB_789
LB_788:
	bts r12,0
LB_789:
	mov r14,r9
	bt r12,3
	jc LB_790
	btr r12,1
	jmp LB_791
LB_790:
	bts r12,1
LB_791:
	call NS_E_768
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_792
	btr r12,1
	jmp LB_793
LB_792:
	bts r12,1
LB_793:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_786
	btr r12,2
	jmp LB_787
LB_786:
	bts r12,2
LB_787:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_784
	btr r12,0
	jmp LB_785
LB_784:
	bts r12,0
LB_785:
	add rsp,24
; _f21 { %_762 %_759 %_757 } ⊢ { %_763 %_764 %_765 } : { %_763 %_764 %_765 }
 ; {>  %_757~2':_r64 %_762~1':_stg %_759~0':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_794
	btr r12,3
	jmp LB_795
LB_794:
	bts r12,3
LB_795:
	mov r14,r13
	bt r12,0
	jc LB_796
	btr r12,1
	jmp LB_797
LB_796:
	bts r12,1
LB_797:
	mov r13,r9
	bt r12,3
	jc LB_798
	btr r12,0
	jmp LB_799
LB_798:
	bts r12,0
LB_799:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_763
 ; {>  %_764~1':_r64 %_765~2':_r64 %_763~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_800
	mov rdi,r14
	call dlt
LB_800:
	bt r12,2
	jc LB_801
	mov rdi,r8
	call dlt
LB_801:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_770:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_802
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
	jnc LB_803
	bt QWORD [rdi],0
	jc LB_804
	btr r12,2
	jmp LB_805
LB_804:
	bts r12,2
LB_805:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_803:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_806:
	cmp r15,0
	jz LB_807
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_806
LB_807:
; _f19 %_755 ⊢ { %_766 %_767 } : { %_766 %_767 }
 ; {>  %_755~0':_r64 }
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
; ∎ %_767
 ; {>  %_767~1':_stg %_766~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_808
	mov rdi,r13
	call dlt
LB_808:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_809
	btr r12,0
	jmp LB_810
LB_809:
	bts r12,0
LB_810:
	ret
MTC_LB_802:
section .data
	NS_E_DYN_544:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_544
	NS_E_DYN_547:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_547
	NS_E_DYN_548:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_548
	NS_E_DYN_549:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_549
	NS_E_DYN_550:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_550
	CST_DYN_559:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_603:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_603
	NS_E_DYN_657:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_657
	NS_E_DYN_706:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_707:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_711:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_711
	CST_DYN_737:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_744:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_768:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_768
