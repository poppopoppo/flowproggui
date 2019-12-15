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
	call NS_E_564
	call NS_E_701
	call NS_E_712
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
NS_E_549:
NS_E_RDI_549:
NS_E_549_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_550
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_550:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_552:
NS_E_RDI_552:
NS_E_552_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_552_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_552_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_553:
NS_E_RDI_553:
NS_E_553_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_553_LB_0
	cmp r11,57
	ja NS_E_553_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_553_LB_0:
	mov rax,0
	ret
NS_E_555:
NS_E_RDI_555:
NS_E_555_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_555_LB_0
	cmp r11,122
	ja NS_E_555_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_555_LB_0:
	mov rax,0
	ret
NS_E_554:
NS_E_RDI_554:
NS_E_554_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_554_LB_0
	cmp r11,90
	ja NS_E_554_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_554_LB_0:
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
NS_E_551:
NS_E_RDI_551:
NS_E_551_ETR_TBL:
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
	jz NS_E_551_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_551_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_564:
NS_E_RDI_564:
; 	» "-27686gg" _ ⊢ 0' : %_556
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » _f15 |~ {  } ⊢ %_557 : %_557
 ; {>  %_556~0':_stg }
; 	» _args _ ⊢ 1' : %_557
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
; » _f15 |~ {  } ⊢ %_558 : %_558
 ; {>  %_556~0':_stg %_557~1':(_lst)◂(_stg) }
; 	» _args _ ⊢ 2' : %_558
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
; » _f15 |~ {  } ⊢ %_559 : %_559
 ; {>  %_558~2':(_lst)◂(_stg) %_556~0':_stg %_557~1':(_lst)◂(_stg) }
; 	» _args _ ⊢ 3' : %_559
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
; _f26 { %_557 %_558 %_559 } ⊢ { %_560 %_561 %_562 } : { %_560 %_561 %_562 }
 ; {>  %_558~2':(_lst)◂(_stg) %_556~0':_stg %_557~1':(_lst)◂(_stg) %_559~3':(_lst)◂(_stg) }
; _f26 { 1' 2' 3' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110.. |},{ 1' 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r14
	bt r12,1
	jc LB_569
	btr r12,4
	jmp LB_570
LB_569:
	bts r12,4
LB_570:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_567
	btr QWORD [rdi],0
	jmp LB_568
LB_567:
	bts QWORD [rdi],0
LB_568:
	mov r10,r8
	bt r12,2
	jc LB_573
	btr r12,4
	jmp LB_574
LB_573:
	bts r12,4
LB_574:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_571
	btr QWORD [rdi],1
	jmp LB_572
LB_571:
	bts QWORD [rdi],1
LB_572:
	mov r10,r9
	bt r12,3
	jc LB_577
	btr r12,4
	jmp LB_578
LB_577:
	bts r12,4
LB_578:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_575
	btr QWORD [rdi],2
	jmp LB_576
LB_575:
	bts QWORD [rdi],2
LB_576:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' 3' }
; 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_581
	btr r12,4
	jmp LB_582
LB_581:
	bts r12,4
LB_582:
	mov r14,r10
	bt r12,4
	jc LB_579
	btr r12,1
	jmp LB_580
LB_579:
	bts r12,1
LB_580:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_585
	btr r12,4
	jmp LB_586
LB_585:
	bts r12,4
LB_586:
	mov r8,r10
	bt r12,4
	jc LB_583
	btr r12,2
	jmp LB_584
LB_583:
	bts r12,2
LB_584:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_589
	btr r12,4
	jmp LB_590
LB_589:
	bts r12,4
LB_590:
	mov r9,r10
	bt r12,4
	jc LB_587
	btr r12,3
	jmp LB_588
LB_587:
	bts r12,3
LB_588:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_565
	btr r12,0
	jmp LB_566
LB_565:
	bts r12,0
LB_566:
	add rsp,16
; _f26 %_556 ⊢ %_563 : %_563
 ; {>  %_561~2':(_lst)◂(_stg) %_556~0':_stg %_560~1':(_lst)◂(_stg) %_562~3':(_lst)◂(_stg) }
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
	jc LB_595
	btr r12,3
	jmp LB_596
LB_595:
	bts r12,3
LB_596:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_593
	btr r12,2
	jmp LB_594
LB_593:
	bts r12,2
LB_594:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_591
	btr r12,1
	jmp LB_592
LB_591:
	bts r12,1
LB_592:
	add rsp,32
; ∎ {  }
 ; {>  %_561~2':(_lst)◂(_stg) %_560~1':(_lst)◂(_stg) %_563~0':_stg %_562~3':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,2
	jc LB_597
	mov rdi,r8
	call dlt
LB_597:
	bt r12,1
	jc LB_598
	mov rdi,r14
	call dlt
LB_598:
	bt r12,0
	jc LB_599
	mov rdi,r13
	call dlt
LB_599:
	bt r12,3
	jc LB_600
	mov rdi,r9
	call dlt
LB_600:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_608:
; 	|» 0'
NS_E_RDI_608:
MTC_LB_609:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_610
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
	jnc LB_611
	bt QWORD [rax],0
	jc LB_612
	btr r12,3
	jmp LB_613
LB_612:
	bts r12,3
LB_613:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_611:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_616
	btr r12,4
	jmp LB_617
LB_616:
	bts r12,4
LB_617:
	mov r14,r10
	bt r12,4
	jc LB_614
	btr r12,1
	jmp LB_615
LB_614:
	bts r12,1
LB_615:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_620
	btr r12,4
	jmp LB_621
LB_620:
	bts r12,4
LB_621:
	mov r8,r10
	bt r12,4
	jc LB_618
	btr r12,2
	jmp LB_619
LB_618:
	bts r12,2
LB_619:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_610
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
	jnc LB_622
	bt QWORD [rax],0
	jc LB_623
	btr r12,5
	jmp LB_624
LB_623:
	bts r12,5
LB_624:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_622:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_627
	btr r12,6
	jmp LB_628
LB_627:
	bts r12,6
LB_628:
	mov r9,rcx
	bt r12,6
	jc LB_625
	btr r12,3
	jmp LB_626
LB_625:
	bts r12,3
LB_626:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_631
	btr r12,6
	jmp LB_632
LB_631:
	bts r12,6
LB_632:
	mov r10,rcx
	bt r12,6
	jc LB_629
	btr r12,4
	jmp LB_630
LB_629:
	bts r12,4
LB_630:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_633:
	cmp r15,0
	jz LB_634
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_633
LB_634:
; ∎ {  }
 ; {>  %_605~4':(_lst)◂(t219'(-1)) %_602~1':t219'(-1) %_604~3':t219'(-1) }
; 	∎ {  }
	bt r12,4
	jc LB_635
	mov rdi,r10
	call dlt
LB_635:
	bt r12,1
	jc LB_636
	mov rdi,r14
	call dlt
LB_636:
	bt r12,3
	jc LB_637
	mov rdi,r9
	call dlt
LB_637:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_610:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_638
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
	jnc LB_639
	bt QWORD [rax],0
	jc LB_640
	btr r12,3
	jmp LB_641
LB_640:
	bts r12,3
LB_641:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_639:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_644
	btr r12,4
	jmp LB_645
LB_644:
	bts r12,4
LB_645:
	mov r14,r10
	bt r12,4
	jc LB_642
	btr r12,1
	jmp LB_643
LB_642:
	bts r12,1
LB_643:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_648
	btr r12,4
	jmp LB_649
LB_648:
	bts r12,4
LB_649:
	mov r8,r10
	bt r12,4
	jc LB_646
	btr r12,2
	jmp LB_647
LB_646:
	bts r12,2
LB_647:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_638
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
	jnc LB_650
	bt QWORD [rax],0
	jc LB_651
	btr r12,3
	jmp LB_652
LB_651:
	bts r12,3
LB_652:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_650:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_653:
	cmp r15,0
	jz LB_654
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_653
LB_654:
; ∎ {  }
 ; {>  %_606~1':t219'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_655
	mov rdi,r14
	call dlt
LB_655:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_638:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_656
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
	jnc LB_657
	bt QWORD [rax],0
	jc LB_658
	btr r12,1
	jmp LB_659
LB_658:
	bts r12,1
LB_659:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_657:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_660:
	cmp r15,0
	jz LB_661
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_660
LB_661:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_656:
NS_E_663:
NS_E_RDI_663:
NS_E_663_ETR_TBL:
NS_E_663_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_692
	jmp LB_693
LB_692:
	jmp LB_666
LB_693:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; g0
	push r10
	call NS_E_663_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_684
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_685
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_685:
	jmp LB_667
LB_684:
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
	jc LB_678
	btr QWORD [rdi],1
LB_678:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_679
	btr QWORD [rdi],0
LB_679:
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
LB_667:
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
LB_666:
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
	jg LB_676
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_676
	jmp LB_677
LB_676:
	jmp LB_668
LB_677:
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
	jc LB_669
	btr QWORD [rdi],0
LB_669:
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
LB_668:
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
NS_E_701:
NS_E_RDI_701:
; 	» "A" _ ⊢ 0' : %_697
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr1 |~ {  } ⊢ %_698 : %_698
 ; {>  %_697~0':_stg }
; 	» 0xr1 _ ⊢ 1' : %_698
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; _f696 %_698 ⊢ %_699 : %_699
 ; {>  %_698~1':_r64 %_697~0':_stg }
; _f696 1' ⊢ °1◂1'
; _f696 %_697 ⊢ %_700 : %_700
 ; {>  %_699~°1◂1':∀[179].(_p694)◂(t179'(-1)) %_697~0':_stg }
; _f696 0' ⊢ °1◂0'
; ∎ {  }
 ; {>  %_700~°1◂0':∀[179].(_p694)◂(t179'(-1)) %_699~°1◂1':∀[179].(_p694)◂(t179'(-1)) }
; 	∎ {  }
	bt r12,0
	jc LB_702
	mov rdi,r13
	call dlt
LB_702:
	bt r12,1
	jc LB_703
	mov rdi,r14
	call dlt
LB_703:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_712:
NS_E_RDI_712:
; 	» "AC" _ ⊢ 0' : %_704
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_43_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_705 : %_705
 ; {>  %_704~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_705
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f663 { %_704 %_705 } ⊢ { %_706 %_707 %_708 } : { %_706 %_707 %_708 }
 ; {>  %_704~0':_stg %_705~1':_r64 }
; _f663 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_663
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_713
	btr r12,4
	jmp LB_714
LB_713:
	bts r12,4
LB_714:
	mov r8,r9
	bt r12,3
	jc LB_717
	btr r12,2
	jmp LB_718
LB_717:
	bts r12,2
LB_718:
	mov rsi,1
	bt r12,2
	jc LB_715
	mov rsi,0
	bt r8,0
	jc LB_715
	jmp LB_716
LB_715:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_716:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f26 { %_706 %_707 %_708 } ⊢ { %_709 %_710 %_711 } : { %_709 %_710 %_711 }
 ; {>  %_706~0':_stg %_708~2':(_opn)◂(_p662) %_707~1':_r64 }
; _f26 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_719
	btr r12,3
	jmp LB_720
LB_719:
	bts r12,3
LB_720:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_723
	btr r12,4
	jmp LB_724
LB_723:
	bts r12,4
LB_724:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_721
	btr QWORD [rdi],0
	jmp LB_722
LB_721:
	bts QWORD [rdi],0
LB_722:
	mov r10,r14
	bt r12,1
	jc LB_727
	btr r12,4
	jmp LB_728
LB_727:
	bts r12,4
LB_728:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_725
	btr QWORD [rdi],1
	jmp LB_726
LB_725:
	bts QWORD [rdi],1
LB_726:
	mov r10,r8
	bt r12,2
	jc LB_731
	btr r12,4
	jmp LB_732
LB_731:
	bts r12,4
LB_732:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_729
	btr QWORD [rdi],2
	jmp LB_730
LB_729:
	bts QWORD [rdi],2
LB_730:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_733
	btr r12,3
	jmp LB_734
LB_733:
	bts r12,3
LB_734:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_737
	btr r12,4
	jmp LB_738
LB_737:
	bts r12,4
LB_738:
	mov r13,r10
	bt r12,4
	jc LB_735
	btr r12,0
	jmp LB_736
LB_735:
	bts r12,0
LB_736:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_741
	btr r12,4
	jmp LB_742
LB_741:
	bts r12,4
LB_742:
	mov r14,r10
	bt r12,4
	jc LB_739
	btr r12,1
	jmp LB_740
LB_739:
	bts r12,1
LB_740:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_745
	btr r12,4
	jmp LB_746
LB_745:
	bts r12,4
LB_746:
	mov r8,r10
	bt r12,4
	jc LB_743
	btr r12,2
	jmp LB_744
LB_743:
	bts r12,2
LB_744:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_710~1':_r64 %_711~2':(_opn)◂(_p662) %_709~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_747
	mov rdi,r14
	call dlt
LB_747:
	bt r12,2
	jc LB_748
	mov rdi,r8
	call dlt
LB_748:
	bt r12,0
	jc LB_749
	mov rdi,r13
	call dlt
LB_749:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_549:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_549
	NS_E_DYN_552:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_552
	NS_E_DYN_553:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_553
	NS_E_DYN_554:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_554
	NS_E_DYN_555:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_555
	CST_DYN_564:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_608:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_608
	NS_E_DYN_695:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_696:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	CST_DYN_701:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_712:
		dq 0x0000_0001_00_82_ffff
		dq 1
