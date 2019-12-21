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
	call NS_E_9951
	call NS_E_10333
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
NS_E_567:
NS_E_RDI_567:
NS_E_567_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_568
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_568:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_570:
NS_E_RDI_570:
NS_E_570_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_570_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_570_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_571:
NS_E_RDI_571:
NS_E_571_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_571_LB_0
	cmp r11,57
	ja NS_E_571_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_571_LB_0:
	mov rax,0
	ret
NS_E_573:
NS_E_RDI_573:
NS_E_573_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_573_LB_0
	cmp r11,122
	ja NS_E_573_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_573_LB_0:
	mov rax,0
	ret
NS_E_572:
NS_E_RDI_572:
NS_E_572_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_572_LB_0
	cmp r11,90
	ja NS_E_572_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_572_LB_0:
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
	jc LB_579
	bt QWORD [rdi],17
	jnc LB_579
	bt QWORD [rdi],0
	jc LB_581
	btr r12,2
	clc
	jmp LB_582
LB_581:
	bts r12,2
	stc
LB_582:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_580
LB_579:
	btr r12,2
	clc
	call dcp
LB_580:
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
	jc LB_575
	bt QWORD [rdi],17
	jnc LB_575
	bt QWORD [rdi],0
	jc LB_577
	btr r12,2
	clc
	jmp LB_578
LB_577:
	bts r12,2
	stc
LB_578:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_576
LB_575:
	btr r12,2
	clc
	call dcp
LB_576:
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
	jc LB_574
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_574:
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
NS_E_569:
NS_E_RDI_569:
NS_E_569_ETR_TBL:
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
	jz NS_E_569_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_569_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_589:
; 	|» { 0' 1' }
NS_E_RDI_589:
MTC_LB_590:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_591
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
	jnc LB_592
	bt QWORD [rdi],0
	jc LB_593
	btr r12,2
	clc
	jmp LB_594
LB_593:
	bts r12,2
	stc
LB_594:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_592:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_595:
	cmp r15,0
	jz LB_596
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_595
LB_596:
; ∎ %_583
 ; {>  %_583~0':(_lst)◂(t110'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_591:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_597
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
	jnc LB_598
	bt QWORD [rdi],0
	jc LB_599
	btr r12,4
	clc
	jmp LB_600
LB_599:
	bts r12,4
	stc
LB_600:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_598:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_603
	btr r12,5
	clc
	jmp LB_604
LB_603:
	bts r12,5
	stc
LB_604:
	mov r8,r11
	bt r12,5
	jc LB_601
	btr r12,2
	jmp LB_602
LB_601:
	bts r12,2
LB_602:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_607
	btr r12,5
	clc
	jmp LB_608
LB_607:
	bts r12,5
	stc
LB_608:
	mov r9,r11
	bt r12,5
	jc LB_605
	btr r12,3
	jmp LB_606
LB_605:
	bts r12,3
LB_606:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_609:
	cmp r15,0
	jz LB_610
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_609
LB_610:
; _cns { %_585 %_583 } ⊢ %_587 : %_587
 ; {>  %_586~3':(_lst)◂(t110'(-1)) %_585~2':t110'(-1) %_583~0':(_lst)◂(t110'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f589 { %_587 %_586 } ⊢ %_588 : %_588
 ; {>  %_587~°0◂{ 2' 0' }:(_lst)◂(t110'(-1)) %_586~3':(_lst)◂(t110'(-1)) }
; _f589 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_611
	btr r12,1
	jmp LB_612
LB_611:
	bts r12,1
LB_612:
	mov r9,r13
	bt r12,0
	jc LB_613
	btr r12,3
	jmp LB_614
LB_613:
	bts r12,3
LB_614:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_619
	btr r12,4
	jmp LB_620
LB_619:
	bts r12,4
LB_620:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_617
	btr QWORD [rdi],0
	jmp LB_618
LB_617:
	bts QWORD [rdi],0
LB_618:
	mov r10,r9
	bt r12,3
	jc LB_623
	btr r12,4
	jmp LB_624
LB_623:
	bts r12,4
LB_624:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_621
	btr QWORD [rdi],1
	jmp LB_622
LB_621:
	bts QWORD [rdi],1
LB_622:
	mov rsi,1
	bt r12,0
	jc LB_615
	mov rsi,0
	bt r13,0
	jc LB_615
	jmp LB_616
LB_615:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_616:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_589
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_588
 ; {>  %_588~0':(_lst)◂(t110'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_597:
NS_E_628:
; 	|» 0'
NS_E_RDI_628:
; _nil {  } ⊢ %_626 : %_626
 ; {>  %_625~0':(_lst)◂(t131'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f589 { %_626 %_625 } ⊢ %_627 : %_627
 ; {>  %_626~°1◂{  }:(_lst)◂(t128'(0)) %_625~0':(_lst)◂(t131'(-1)) }
; _f589 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_629
	btr r12,1
	jmp LB_630
LB_629:
	bts r12,1
LB_630:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_631
	mov rsi,0
	bt r13,0
	jc LB_631
	jmp LB_632
LB_631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_632:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_589
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_627
 ; {>  %_627~0':(_lst)◂(t131'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_646:
; 	|» { 0' 1' }
NS_E_RDI_646:
MTC_LB_647:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_648
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
	jnc LB_649
	bt QWORD [rdi],0
	jc LB_650
	btr r12,4
	clc
	jmp LB_651
LB_650:
	bts r12,4
	stc
LB_651:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_649:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_654
	btr r12,5
	clc
	jmp LB_655
LB_654:
	bts r12,5
	stc
LB_655:
	mov r8,r11
	bt r12,5
	jc LB_652
	btr r12,2
	jmp LB_653
LB_652:
	bts r12,2
LB_653:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_658
	btr r12,5
	clc
	jmp LB_659
LB_658:
	bts r12,5
	stc
LB_659:
	mov r9,r11
	bt r12,5
	jc LB_656
	btr r12,3
	jmp LB_657
LB_656:
	bts r12,3
LB_657:
	mov rdi,r10
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
; _f56 %_633 ⊢ %_637 : %_637
 ; {>  %_636~3':(_lst)◂(_r64) %_633~0':_r64 %_635~2':_r64 }
	add r13,1
; _f646 { %_637 %_636 } ⊢ { %_638 %_639 } : { %_638 %_639 }
 ; {>  %_636~3':(_lst)◂(_r64) %_637~0':_r64 %_635~2':_r64 }
; _f646 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_664
	btr r12,1
	jmp LB_665
LB_664:
	bts r12,1
LB_665:
	call NS_E_646
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_662
	btr r12,2
	clc
	jmp LB_663
LB_662:
	bts r12,2
	stc
LB_663:
	add rsp,16
; _f55 %_638 ⊢ %_640 : %_640
 ; {>  %_639~1':_stg %_638~0':_r64 %_635~2':_r64 }
	sub r13,1
; _f33 { %_639 %_640 %_635 } ⊢ { %_641 %_642 %_643 } : { %_641 %_642 %_643 }
 ; {>  %_639~1':_stg %_640~0':_r64 %_635~2':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_666
	btr r12,3
	jmp LB_667
LB_666:
	bts r12,3
LB_667:
	mov r14,r13
	bt r12,0
	jc LB_668
	btr r12,1
	jmp LB_669
LB_668:
	bts r12,1
LB_669:
	mov r13,r9
	bt r12,3
	jc LB_670
	btr r12,0
	jmp LB_671
LB_670:
	bts r12,0
LB_671:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_642 %_641 }
 ; {>  %_643~2':_r64 %_642~1':_r64 %_641~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_672
	mov rdi,r8
	call dlt
LB_672:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_673
	btr r12,2
	jmp LB_674
LB_673:
	bts r12,2
LB_674:
	mov r14,r13
	bt r12,0
	jc LB_675
	btr r12,1
	jmp LB_676
LB_675:
	bts r12,1
LB_676:
	mov r13,r8
	bt r12,2
	jc LB_677
	btr r12,0
	jmp LB_678
LB_677:
	bts r12,0
LB_678:
	ret
MTC_LB_648:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_679
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
	jnc LB_680
	bt QWORD [rdi],0
	jc LB_681
	btr r12,2
	clc
	jmp LB_682
LB_681:
	bts r12,2
	stc
LB_682:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_680:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_683:
	cmp r15,0
	jz LB_684
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_683
LB_684:
; _f31 %_633 ⊢ { %_644 %_645 } : { %_644 %_645 }
 ; {>  %_633~0':_r64 }
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
; ∎ { %_644 %_645 }
 ; {>  %_645~1':_stg %_644~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_679:
NS_E_689:
; 	|» 0'
NS_E_RDI_689:
; » 0xr0 |~ {  } ⊢ %_686 : %_686
 ; {>  %_685~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_686
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f646 { %_686 %_685 } ⊢ { %_687 %_688 } : { %_687 %_688 }
 ; {>  %_686~1':_r64 %_685~0':(_lst)◂(_r64) }
; _f646 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_690
	btr r12,2
	jmp LB_691
LB_690:
	bts r12,2
LB_691:
	mov r14,r13
	bt r12,0
	jc LB_692
	btr r12,1
	jmp LB_693
LB_692:
	bts r12,1
LB_693:
	mov r13,r8
	bt r12,2
	jc LB_694
	btr r12,0
	jmp LB_695
LB_694:
	bts r12,0
LB_695:
	call NS_E_646
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_688
 ; {>  %_688~1':_stg %_687~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_696
	mov rdi,r13
	call dlt
LB_696:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_697
	btr r12,0
	jmp LB_698
LB_697:
	bts r12,0
LB_698:
	ret
NS_E_717:
; 	|» { 0' 1' }
NS_E_RDI_717:
MTC_LB_718:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_719
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
	jnc LB_720
	bt QWORD [rdi],0
	jc LB_721
	btr r12,5
	clc
	jmp LB_722
LB_721:
	bts r12,5
	stc
LB_722:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_720:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_731
	btr r12,6
	clc
	jmp LB_732
LB_731:
	bts r12,6
	stc
LB_732:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_725
	btr r12,4
	clc
	jmp LB_726
LB_725:
	bts r12,4
	stc
LB_726:
	mov r8,r10
	bt r12,4
	jc LB_723
	btr r12,2
	jmp LB_724
LB_723:
	bts r12,2
LB_724:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_729
	btr r12,4
	clc
	jmp LB_730
LB_729:
	bts r12,4
	stc
LB_730:
	mov r9,r10
	bt r12,4
	jc LB_727
	btr r12,3
	jmp LB_728
LB_727:
	bts r12,3
LB_728:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_735
	btr r12,6
	clc
	jmp LB_736
LB_735:
	bts r12,6
	stc
LB_736:
	mov r10,rcx
	bt r12,6
	jc LB_733
	btr r12,4
	jmp LB_734
LB_733:
	bts r12,4
LB_734:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_737:
	cmp r15,0
	jz LB_738
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_737
LB_738:
MTC_LB_739:
	mov r15,0
	mov rdi,r14
	mov rsi,r8
	bt r12,1
	call eq
	jnz MTC_LB_740
LB_741:
	cmp r15,0
	jz LB_742
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_741
LB_742:
MTC_LB_743:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_744
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
	jnc LB_745
	bt QWORD [rdi],0
	jc LB_746
	btr r12,5
	clc
	jmp LB_747
LB_746:
	bts r12,5
	stc
LB_747:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_745:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_748
	btr r12,0
	jmp LB_749
LB_748:
	bts r12,0
LB_749:
LB_750:
	cmp r15,0
	jz LB_751
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_750
LB_751:
; _emt_mov_ptn_to_ptn:{| 111010.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_752
	btr r12,3
	jmp LB_753
LB_752:
	bts r12,3
LB_753:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_762
	btr r12,5
	clc
	jmp LB_763
LB_762:
	bts r12,5
	stc
LB_763:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_760
	btr r12,4
	clc
	jmp LB_761
LB_760:
	bts r12,4
	stc
LB_761:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_758
	btr r12,3
	clc
	jmp LB_759
LB_758:
	bts r12,3
	stc
LB_759:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_756
	btr r12,2
	clc
	jmp LB_757
LB_756:
	bts r12,2
	stc
LB_757:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_754
	btr r12,1
	clc
	jmp LB_755
LB_754:
	bts r12,1
	stc
LB_755:
	add rsp,40
; _some %_705 ⊢ %_707 : %_707
 ; {>  %_701~2':t204'(-1) %_706~5':t212'(-1) %_700~1':t204'(-1) %_703~4':(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_705~3':t212'(-1) }
; _some 3' ⊢ °0◂3'
; _cns { { %_701 %_707 } %_703 } ⊢ %_708 : %_708
 ; {>  %_701~2':t204'(-1) %_706~5':t212'(-1) %_700~1':t204'(-1) %_703~4':(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_707~°0◂3':(_opn)◂(t212'(-1)) }
; _cns { { 2' °0◂3' } 4' } ⊢ °0◂{ { 2' °0◂3' } 4' }
; _some %_706 ⊢ %_709 : %_709
 ; {>  %_706~5':t212'(-1) %_700~1':t204'(-1) %_708~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) }
; _some 5' ⊢ °0◂5'
; ∎ { %_708 %_700 %_709 }
 ; {>  %_709~°0◂5':(_opn)◂(t212'(-1)) %_700~1':t204'(-1) %_708~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) }
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
	jc LB_770
	btr r12,7
	jmp LB_771
LB_770:
	bts r12,7
LB_771:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_768
	btr QWORD [rdi],0
	jmp LB_769
LB_768:
	bts QWORD [rdi],0
LB_769:
	mov rdx,r9
	bt r12,3
	jc LB_776
	btr r12,7
	jmp LB_777
LB_776:
	bts r12,7
LB_777:
	mov rsi,1
	bt r12,7
	jc LB_774
	mov rsi,0
	bt rdx,0
	jc LB_774
	jmp LB_775
LB_774:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_775:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_772
	btr QWORD [rdi],1
	jmp LB_773
LB_772:
	bts QWORD [rdi],1
LB_773:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_766
	btr QWORD [rdi],0
	jmp LB_767
LB_766:
	bts QWORD [rdi],0
LB_767:
	mov rcx,r10
	bt r12,4
	jc LB_780
	btr r12,6
	jmp LB_781
LB_780:
	bts r12,6
LB_781:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_778
	btr QWORD [rdi],1
	jmp LB_779
LB_778:
	bts QWORD [rdi],1
LB_779:
	mov rsi,1
	bt r12,0
	jc LB_764
	mov rsi,0
	bt r13,0
	jc LB_764
	jmp LB_765
LB_764:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_765:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov r8,r11
	bt r12,5
	jc LB_784
	btr r12,2
	jmp LB_785
LB_784:
	bts r12,2
LB_785:
	mov rsi,1
	bt r12,2
	jc LB_782
	mov rsi,0
	bt r8,0
	jc LB_782
	jmp LB_783
LB_782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_783:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_744:
	mov r15,0
LB_787:
	cmp r15,0
	jz LB_788
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_787
LB_788:
; _cns { { %_701 %_702 } %_703 } ⊢ %_710 : %_710
 ; {>  %_701~2':t204'(-1) %_700~1':t204'(-1) %_703~4':(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_702~3':(_opn)◂(t212'(-1)) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _none {  } ⊢ %_711 : %_711
 ; {>  %_710~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_700~1':t204'(-1) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_710 %_700 %_711 }
 ; {>  %_710~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_711~°1◂{  }:(_opn)◂(t198'(0)) %_700~1':t204'(-1) }
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
	jc LB_795
	btr r12,6
	jmp LB_796
LB_795:
	bts r12,6
LB_796:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_793
	btr QWORD [rdi],0
	jmp LB_794
LB_793:
	bts QWORD [rdi],0
LB_794:
	mov rcx,r9
	bt r12,3
	jc LB_799
	btr r12,6
	jmp LB_800
LB_799:
	bts r12,6
LB_800:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_797
	btr QWORD [rdi],1
	jmp LB_798
LB_797:
	bts QWORD [rdi],1
LB_798:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_791
	btr QWORD [rdi],0
	jmp LB_792
LB_791:
	bts QWORD [rdi],0
LB_792:
	mov r11,r10
	bt r12,4
	jc LB_803
	btr r12,5
	jmp LB_804
LB_803:
	bts r12,5
LB_804:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_801
	btr QWORD [rdi],1
	jmp LB_802
LB_801:
	bts QWORD [rdi],1
LB_802:
	mov rsi,1
	bt r12,0
	jc LB_789
	mov rsi,0
	bt r13,0
	jc LB_789
	jmp LB_790
LB_789:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_790:
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
	jc LB_805
	mov rsi,0
	bt r8,0
	jc LB_805
	jmp LB_806
LB_805:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_806:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_786:
MTC_LB_740:
	mov r15,0
LB_808:
	cmp r15,0
	jz LB_809
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_808
LB_809:
; _f717 { %_703 %_700 } ⊢ { %_712 %_713 %_714 } : { %_712 %_713 %_714 }
 ; {>  %_701~2':t204'(-1) %_700~1':t204'(-1) %_703~4':(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_702~3':(_opn)◂(t212'(-1)) }
; _f717 { 4' 1' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010010.. |},{ 4' 1' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,4
	jc LB_814
	btr r12,0
	jmp LB_815
LB_814:
	bts r12,0
LB_815:
	call NS_E_717
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_816
	btr r12,4
	jmp LB_817
LB_816:
	bts r12,4
LB_817:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_812
	btr r12,3
	clc
	jmp LB_813
LB_812:
	bts r12,3
	stc
LB_813:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_810
	btr r12,2
	clc
	jmp LB_811
LB_810:
	bts r12,2
	stc
LB_811:
	add rsp,24
; _cns { { %_701 %_702 } %_712 } ⊢ %_715 : %_715
 ; {>  %_701~2':t204'(-1) %_713~1':t204'(-1) %_712~0':(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_714~4':(_opn)◂(t212'(-1)) %_702~3':(_opn)◂(t212'(-1)) }
; _cns { { 2' 3' } 0' } ⊢ °0◂{ { 2' 3' } 0' }
; ∎ { %_715 %_713 %_714 }
 ; {>  %_713~1':t204'(-1) %_715~°0◂{ { 2' 3' } 0' }:(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) %_714~4':(_opn)◂(t212'(-1)) }
; 	∎ { °0◂{ { 2' 3' } 0' } 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ °0◂{ { 2' 3' } 0' } 1' 4' } ⊢ { 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_818
	btr r12,5
	jmp LB_819
LB_818:
	bts r12,5
LB_819:
	mov r8,r10
	bt r12,4
	jc LB_820
	btr r12,2
	jmp LB_821
LB_820:
	bts r12,2
LB_821:
	mov r10,r13
	bt r12,0
	jc LB_822
	btr r12,4
	jmp LB_823
LB_822:
	bts r12,4
LB_823:
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
	jc LB_830
	btr r12,7
	jmp LB_831
LB_830:
	bts r12,7
LB_831:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_828
	btr QWORD [rdi],0
	jmp LB_829
LB_828:
	bts QWORD [rdi],0
LB_829:
	mov rdx,r9
	bt r12,3
	jc LB_834
	btr r12,7
	jmp LB_835
LB_834:
	bts r12,7
LB_835:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_832
	btr QWORD [rdi],1
	jmp LB_833
LB_832:
	bts QWORD [rdi],1
LB_833:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_826
	btr QWORD [rdi],0
	jmp LB_827
LB_826:
	bts QWORD [rdi],0
LB_827:
	mov rcx,r10
	bt r12,4
	jc LB_838
	btr r12,6
	jmp LB_839
LB_838:
	bts r12,6
LB_839:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_836
	btr QWORD [rdi],1
	jmp LB_837
LB_836:
	bts QWORD [rdi],1
LB_837:
	mov rsi,1
	bt r12,0
	jc LB_824
	mov rsi,0
	bt r13,0
	jc LB_824
	jmp LB_825
LB_824:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_825:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_807:
MTC_LB_719:
	mov r15,0
LB_841:
	cmp r15,0
	jz LB_842
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_841
LB_842:
; _none {  } ⊢ %_716 : %_716
 ; {>  %_700~1':t204'(-1) %_699~0':(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_699 %_700 %_716 }
 ; {>  %_716~°1◂{  }:(_opn)◂(t209'(0)) %_700~1':t204'(-1) %_699~0':(_lst)◂({ t204'(-1) (_opn)◂(t212'(-1)) }) }
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
	jc LB_843
	mov rsi,0
	bt r8,0
	jc LB_843
	jmp LB_844
LB_843:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_844:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_840:
NS_E_845:
NS_E_RDI_845:
NS_E_845_ETR_TBL:
NS_E_845_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_886
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_886
	jmp LB_887
LB_886:
	jmp LB_876
LB_887:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_891
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_892
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_892:
	jmp LB_876
LB_891:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_879
	btr r12,1
	clc
	jmp LB_880
LB_879:
	bts r12,1
	stc
LB_880:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_877
	btr r12,0
	clc
	jmp LB_878
LB_877:
	bts r12,0
	stc
LB_878:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_873
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_894
	btr r12,5
	jmp LB_895
LB_894:
	bts r12,5
LB_895:
	mov r13,r14
	bt r12,1
	jc LB_896
	btr r12,0
	jmp LB_897
LB_896:
	bts r12,0
LB_897:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f689 %_848 ⊢ %_849 : %_849
 ; {>  %_848~0':(_lst)◂(_r64) }
; _f689 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_689
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_849 ⊢ %_850 : %_850
 ; {>  %_849~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_850
 ; {>  %_850~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_871
	btr r12,3
	jmp LB_872
LB_871:
	bts r12,3
LB_872:
	mov r8,0
	bts r12,2
	ret
LB_873:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_875
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_874
LB_875:
	add rsp,8
	ret
LB_876:
	add rsp,32
	pop r14
LB_874:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_846:
NS_E_RDI_846:
NS_E_846_ETR_TBL:
NS_E_846_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_923
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_923
	jmp LB_924
LB_923:
	jmp LB_911
LB_924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_847_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_928
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_929
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_929:
	jmp LB_911
LB_928:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_934
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_935
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_935:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_936
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_936:
	jmp LB_911
LB_934:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_916
	btr r12,2
	clc
	jmp LB_917
LB_916:
	bts r12,2
	stc
LB_917:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_914
	btr r12,1
	clc
	jmp LB_915
LB_914:
	bts r12,1
	stc
LB_915:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_912
	btr r12,0
	clc
	jmp LB_913
LB_912:
	bts r12,0
	stc
LB_913:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_908
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov rcx,r14
	bt r12,1
	jc LB_938
	btr r12,6
	jmp LB_939
LB_938:
	bts r12,6
LB_939:
	mov r14,r8
	bt r12,2
	jc LB_940
	btr r12,1
	jmp LB_941
LB_940:
	bts r12,1
LB_941:
	mov r8,r13
	bt r12,0
	jc LB_942
	btr r12,2
	jmp LB_943
LB_942:
	bts r12,2
LB_943:
	mov r13,rcx
	bt r12,6
	jc LB_944
	btr r12,0
	jmp LB_945
LB_944:
	bts r12,0
LB_945:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _cns { %_851 %_852 } ⊢ %_853 : %_853
 ; {>  %_852~1':(_lst)◂(_r64) %_851~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_853 ⊢ %_854 : %_854
 ; {>  %_853~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_854
 ; {>  %_854~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_902
	btr r12,2
	jmp LB_903
LB_902:
	bts r12,2
LB_903:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_900
	btr QWORD [rdi],0
	jmp LB_901
LB_900:
	bts QWORD [rdi],0
LB_901:
	mov r8,r14
	bt r12,1
	jc LB_906
	btr r12,2
	jmp LB_907
LB_906:
	bts r12,2
LB_907:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_904
	btr QWORD [rdi],1
	jmp LB_905
LB_904:
	bts QWORD [rdi],1
LB_905:
	mov rsi,1
	bt r12,3
	jc LB_898
	mov rsi,0
	bt r9,0
	jc LB_898
	jmp LB_899
LB_898:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_899:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_908:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_910
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_909
LB_910:
	add rsp,8
	ret
LB_911:
	add rsp,48
	pop r14
LB_909:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_959
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_959
	jmp LB_960
LB_959:
	jmp LB_951
LB_960:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_952
	btr r12,0
	clc
	jmp LB_953
LB_952:
	bts r12,0
	stc
LB_953:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_948
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_855 : %_855
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_855 ⊢ %_856 : %_856
 ; {>  %_855~°1◂{  }:(_lst)◂(t261'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_856
 ; {>  %_856~°0◂°1◂{  }:(_opn)◂((_lst)◂(t264'(0))) }
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
	jc LB_946
	mov rsi,0
	bt r9,0
	jc LB_946
	jmp LB_947
LB_946:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_947:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_948:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_950
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_949
LB_950:
	add rsp,8
	ret
LB_951:
	add rsp,16
	pop r14
LB_949:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_982
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_974
LB_982:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_987
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_988
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_988:
	jmp LB_974
LB_987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_977
	btr r12,1
	clc
	jmp LB_978
LB_977:
	bts r12,1
	stc
LB_978:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_975
	btr r12,0
	clc
	jmp LB_976
LB_975:
	bts r12,0
	stc
LB_976:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_971
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_857 %_858 } ⊢ %_859 : %_859
 ; {>  %_858~1':(_lst)◂(_r64) %_857~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_859 ⊢ %_860 : %_860
 ; {>  %_859~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_860
 ; {>  %_860~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_965
	btr r12,2
	jmp LB_966
LB_965:
	bts r12,2
LB_966:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_963
	btr QWORD [rdi],0
	jmp LB_964
LB_963:
	bts QWORD [rdi],0
LB_964:
	mov r8,r14
	bt r12,1
	jc LB_969
	btr r12,2
	jmp LB_970
LB_969:
	bts r12,2
LB_970:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_967
	btr QWORD [rdi],1
	jmp LB_968
LB_967:
	bts QWORD [rdi],1
LB_968:
	mov rsi,1
	bt r12,3
	jc LB_961
	mov rsi,0
	bt r9,0
	jc LB_961
	jmp LB_962
LB_961:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_962:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_971:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_973
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_972
LB_973:
	add rsp,8
	ret
LB_974:
	add rsp,32
	pop r14
LB_972:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_847:
NS_E_RDI_847:
NS_E_847_ETR_TBL:
NS_E_847_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_1003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_1003
	jmp LB_1004
LB_1003:
	jmp LB_995
LB_1004:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_996
	btr r12,0
	clc
	jmp LB_997
LB_996:
	bts r12,0
	stc
LB_997:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_992
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr5c |~ {  } ⊢ %_861 : %_861
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_861
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_861 ⊢ %_862 : %_862
 ; {>  %_861~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_862
 ; {>  %_862~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_990
	btr r12,3
	jmp LB_991
LB_990:
	bts r12,3
LB_991:
	mov r8,0
	bts r12,2
	ret
LB_992:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_994
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_993
LB_994:
	add rsp,8
	ret
LB_995:
	add rsp,16
	pop r14
LB_993:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1018
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_1018
	jmp LB_1019
LB_1018:
	jmp LB_1010
LB_1019:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1011
	btr r12,0
	clc
	jmp LB_1012
LB_1011:
	bts r12,0
	stc
LB_1012:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1007
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr22 |~ {  } ⊢ %_863 : %_863
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_863
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_863 ⊢ %_864 : %_864
 ; {>  %_863~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_864
 ; {>  %_864~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1005
	btr r12,3
	jmp LB_1006
LB_1005:
	bts r12,3
LB_1006:
	mov r8,0
	bts r12,2
	ret
LB_1007:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1009
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1008
LB_1009:
	add rsp,8
	ret
LB_1010:
	add rsp,16
	pop r14
LB_1008:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_1033
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_1033
	jmp LB_1034
LB_1033:
	jmp LB_1025
LB_1034:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1026
	btr r12,0
	clc
	jmp LB_1027
LB_1026:
	bts r12,0
	stc
LB_1027:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1022
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xra |~ {  } ⊢ %_865 : %_865
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_865
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_865 ⊢ %_866 : %_866
 ; {>  %_865~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_866
 ; {>  %_866~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1020
	btr r12,3
	jmp LB_1021
LB_1020:
	bts r12,3
LB_1021:
	mov r8,0
	bts r12,2
	ret
LB_1022:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1024
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1023
LB_1024:
	add rsp,8
	ret
LB_1025:
	add rsp,16
	pop r14
LB_1023:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_1048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_1048
	jmp LB_1049
LB_1048:
	jmp LB_1040
LB_1049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1041
	btr r12,0
	clc
	jmp LB_1042
LB_1041:
	bts r12,0
	stc
LB_1042:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1037
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr9 |~ {  } ⊢ %_867 : %_867
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_867
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_867 ⊢ %_868 : %_868
 ; {>  %_867~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_868
 ; {>  %_868~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1035
	btr r12,3
	jmp LB_1036
LB_1035:
	bts r12,3
LB_1036:
	mov r8,0
	bts r12,2
	ret
LB_1037:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1039
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1038
LB_1039:
	add rsp,8
	ret
LB_1040:
	add rsp,16
	pop r14
LB_1038:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_1063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_1063
	jmp LB_1064
LB_1063:
	jmp LB_1055
LB_1064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1056
	btr r12,0
	clc
	jmp LB_1057
LB_1056:
	bts r12,0
	stc
LB_1057:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1052
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_869 : %_869
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_869
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_869 ⊢ %_870 : %_870
 ; {>  %_869~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_870
 ; {>  %_870~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1050
	btr r12,3
	jmp LB_1051
LB_1050:
	bts r12,3
LB_1051:
	mov r8,0
	bts r12,2
	ret
LB_1052:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1054
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1053
LB_1054:
	add rsp,8
	ret
LB_1055:
	add rsp,16
	pop r14
LB_1053:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1065:
NS_E_RDI_1065:
NS_E_1065_ETR_TBL:
NS_E_1065_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1104
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1098
LB_1104:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1099
	btr r12,0
	clc
	jmp LB_1100
LB_1099:
	bts r12,0
	stc
LB_1100:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1095
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr30 |~ {  } ⊢ %_1067 : %_1067
 ; {>  %_1066~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_1067
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_1068 : %_1068
 ; {>  %_1066~0':_r64 %_1067~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_1068
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_1066 %_1067 } ⊢ { %_1069 %_1070 %_1071 } : { %_1069 %_1070 %_1071 }
 ; {>  %_1068~2':_r64 %_1066~0':_r64 %_1067~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1068 %_1069 } ⊢ { %_1072 %_1073 %_1074 } : { %_1072 %_1073 %_1074 }
 ; {>  %_1071~3':_r64 %_1070~1':_r64 %_1068~2':_r64 %_1069~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1077:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1078
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1078
LB_1079:
	cmp r15,0
	jz LB_1080
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1079
LB_1080:
; _some %_1073 ⊢ %_1075 : %_1075
 ; {>  %_1074~4':_r64 %_1071~3':_r64 %_1070~1':_r64 %_1073~0':_r64 %_1072~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1075
 ; {>  %_1074~4':_r64 %_1071~3':_r64 %_1070~1':_r64 %_1072~2':_r64 %_1075~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,4
	jc LB_1081
	mov rdi,r10
	call dlt
LB_1081:
	bt r12,3
	jc LB_1082
	mov rdi,r9
	call dlt
LB_1082:
	bt r12,1
	jc LB_1083
	mov rdi,r14
	call dlt
LB_1083:
	bt r12,2
	jc LB_1084
	mov rdi,r8
	call dlt
LB_1084:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1085
	btr r12,3
	jmp LB_1086
LB_1085:
	bts r12,3
LB_1086:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1078:
	mov r15,0
LB_1088:
	cmp r15,0
	jz LB_1089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1088
LB_1089:
; _none {  } ⊢ %_1076 : %_1076
 ; {>  %_1074~4':_r64 %_1071~3':_r64 %_1070~1':_r64 %_1073~0':_r64 %_1072~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1076
 ; {>  %_1074~4':_r64 %_1071~3':_r64 %_1070~1':_r64 %_1076~°1◂{  }:(_opn)◂(t340'(0)) %_1073~0':_r64 %_1072~2':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_1090
	mov rdi,r10
	call dlt
LB_1090:
	bt r12,3
	jc LB_1091
	mov rdi,r9
	call dlt
LB_1091:
	bt r12,1
	jc LB_1092
	mov rdi,r14
	call dlt
LB_1092:
	bt r12,0
	jc LB_1093
	mov rdi,r13
	call dlt
LB_1093:
	bt r12,2
	jc LB_1094
	mov rdi,r8
	call dlt
LB_1094:
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
MTC_LB_1087:
LB_1095:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1097
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1096
LB_1097:
	add rsp,8
	ret
LB_1098:
	add rsp,16
	pop r14
LB_1096:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1106:
NS_E_RDI_1106:
NS_E_1106_ETR_TBL:
NS_E_1106_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1145
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1139
LB_1145:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1140
	btr r12,0
	clc
	jmp LB_1141
LB_1140:
	bts r12,0
	stc
LB_1141:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1136
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr61 |~ {  } ⊢ %_1108 : %_1108
 ; {>  %_1107~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_1108
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_1109 : %_1109
 ; {>  %_1108~1':_r64 %_1107~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_1109
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_1107 %_1108 } ⊢ { %_1110 %_1111 %_1112 } : { %_1110 %_1111 %_1112 }
 ; {>  %_1109~2':_r64 %_1108~1':_r64 %_1107~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1109 %_1110 } ⊢ { %_1113 %_1114 %_1115 } : { %_1113 %_1114 %_1115 }
 ; {>  %_1109~2':_r64 %_1110~0':_r64 %_1111~1':_r64 %_1112~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1118:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1119
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1119
LB_1120:
	cmp r15,0
	jz LB_1121
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1120
LB_1121:
; _some %_1114 ⊢ %_1116 : %_1116
 ; {>  %_1115~4':_r64 %_1114~0':_r64 %_1113~2':_r64 %_1111~1':_r64 %_1112~3':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1116
 ; {>  %_1116~°0◂0':(_opn)◂(_r64) %_1115~4':_r64 %_1113~2':_r64 %_1111~1':_r64 %_1112~3':_r64 }
; 	∎ °0◂0'
	bt r12,4
	jc LB_1122
	mov rdi,r10
	call dlt
LB_1122:
	bt r12,2
	jc LB_1123
	mov rdi,r8
	call dlt
LB_1123:
	bt r12,1
	jc LB_1124
	mov rdi,r14
	call dlt
LB_1124:
	bt r12,3
	jc LB_1125
	mov rdi,r9
	call dlt
LB_1125:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1126
	btr r12,3
	jmp LB_1127
LB_1126:
	bts r12,3
LB_1127:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1119:
	mov r15,0
LB_1129:
	cmp r15,0
	jz LB_1130
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1129
LB_1130:
; _none {  } ⊢ %_1117 : %_1117
 ; {>  %_1115~4':_r64 %_1114~0':_r64 %_1113~2':_r64 %_1111~1':_r64 %_1112~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1117
 ; {>  %_1117~°1◂{  }:(_opn)◂(t367'(0)) %_1115~4':_r64 %_1114~0':_r64 %_1113~2':_r64 %_1111~1':_r64 %_1112~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_1131
	mov rdi,r10
	call dlt
LB_1131:
	bt r12,0
	jc LB_1132
	mov rdi,r13
	call dlt
LB_1132:
	bt r12,2
	jc LB_1133
	mov rdi,r8
	call dlt
LB_1133:
	bt r12,1
	jc LB_1134
	mov rdi,r14
	call dlt
LB_1134:
	bt r12,3
	jc LB_1135
	mov rdi,r9
	call dlt
LB_1135:
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
MTC_LB_1128:
LB_1136:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1138
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1137
LB_1138:
	add rsp,8
	ret
LB_1139:
	add rsp,16
	pop r14
LB_1137:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1147:
NS_E_RDI_1147:
NS_E_1147_ETR_TBL:
NS_E_1147_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1186
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1180
LB_1186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1181
	btr r12,0
	clc
	jmp LB_1182
LB_1181:
	bts r12,0
	stc
LB_1182:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1177
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr41 |~ {  } ⊢ %_1149 : %_1149
 ; {>  %_1148~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_1149
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_1150 : %_1150
 ; {>  %_1148~0':_r64 %_1149~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_1150
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_1148 %_1149 } ⊢ { %_1151 %_1152 %_1153 } : { %_1151 %_1152 %_1153 }
 ; {>  %_1148~0':_r64 %_1150~2':_r64 %_1149~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1150 %_1151 } ⊢ { %_1154 %_1155 %_1156 } : { %_1154 %_1155 %_1156 }
 ; {>  %_1152~1':_r64 %_1153~3':_r64 %_1150~2':_r64 %_1151~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1159:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1160
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1160
LB_1161:
	cmp r15,0
	jz LB_1162
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1161
LB_1162:
; _some %_1155 ⊢ %_1157 : %_1157
 ; {>  %_1154~2':_r64 %_1152~1':_r64 %_1156~4':_r64 %_1153~3':_r64 %_1155~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1157
 ; {>  %_1154~2':_r64 %_1152~1':_r64 %_1156~4':_r64 %_1153~3':_r64 %_1157~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1163
	mov rdi,r8
	call dlt
LB_1163:
	bt r12,1
	jc LB_1164
	mov rdi,r14
	call dlt
LB_1164:
	bt r12,4
	jc LB_1165
	mov rdi,r10
	call dlt
LB_1165:
	bt r12,3
	jc LB_1166
	mov rdi,r9
	call dlt
LB_1166:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1167
	btr r12,3
	jmp LB_1168
LB_1167:
	bts r12,3
LB_1168:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1160:
	mov r15,0
LB_1170:
	cmp r15,0
	jz LB_1171
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1170
LB_1171:
; _none {  } ⊢ %_1158 : %_1158
 ; {>  %_1154~2':_r64 %_1152~1':_r64 %_1156~4':_r64 %_1153~3':_r64 %_1155~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1158
 ; {>  %_1158~°1◂{  }:(_opn)◂(t394'(0)) %_1154~2':_r64 %_1152~1':_r64 %_1156~4':_r64 %_1153~3':_r64 %_1155~0':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_1172
	mov rdi,r8
	call dlt
LB_1172:
	bt r12,1
	jc LB_1173
	mov rdi,r14
	call dlt
LB_1173:
	bt r12,4
	jc LB_1174
	mov rdi,r10
	call dlt
LB_1174:
	bt r12,3
	jc LB_1175
	mov rdi,r9
	call dlt
LB_1175:
	bt r12,0
	jc LB_1176
	mov rdi,r13
	call dlt
LB_1176:
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
MTC_LB_1169:
LB_1177:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1179
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1178
LB_1179:
	add rsp,8
	ret
LB_1180:
	add rsp,16
	pop r14
LB_1178:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1188:
NS_E_RDI_1188:
NS_E_1188_ETR_TBL:
NS_E_1188_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_1147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1204
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1198
LB_1204:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1199
	btr r12,0
	clc
	jmp LB_1200
LB_1199:
	bts r12,0
	stc
LB_1200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1195
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1189 ⊢ %_1190 : %_1190
 ; {>  %_1189~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1190
 ; {>  %_1190~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1193
	btr r12,3
	jmp LB_1194
LB_1193:
	bts r12,3
LB_1194:
	mov r8,0
	bts r12,2
	ret
LB_1195:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1197
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1196
LB_1197:
	add rsp,8
	ret
LB_1198:
	add rsp,16
	pop r14
LB_1196:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_1106_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1217
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1211
LB_1217:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1212
	btr r12,0
	clc
	jmp LB_1213
LB_1212:
	bts r12,0
	stc
LB_1213:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1208
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1191 ⊢ %_1192 : %_1192
 ; {>  %_1191~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1192
 ; {>  %_1192~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1206
	btr r12,3
	jmp LB_1207
LB_1206:
	bts r12,3
LB_1207:
	mov r8,0
	bts r12,2
	ret
LB_1208:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1210
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1209
LB_1210:
	add rsp,8
	ret
LB_1211:
	add rsp,16
	pop r14
LB_1209:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1219:
NS_E_RDI_1219:
NS_E_1219_ETR_TBL:
NS_E_1219_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_1188_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1264
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1256
LB_1264:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1269
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1270
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1270:
	jmp LB_1256
LB_1269:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1259
	btr r12,1
	clc
	jmp LB_1260
LB_1259:
	bts r12,1
	stc
LB_1260:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1257
	btr r12,0
	clc
	jmp LB_1258
LB_1257:
	bts r12,0
	stc
LB_1258:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1253
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_1222 %_1223 } ⊢ %_1224 : %_1224
 ; {>  %_1222~0':_r64 %_1223~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f689 %_1224 ⊢ %_1225 : %_1225
 ; {>  %_1224~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f689 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1239
	btr r12,2
	jmp LB_1240
LB_1239:
	bts r12,2
LB_1240:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1245
	btr r12,3
	jmp LB_1246
LB_1245:
	bts r12,3
LB_1246:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1243
	btr QWORD [rdi],0
	jmp LB_1244
LB_1243:
	bts QWORD [rdi],0
LB_1244:
	mov r9,r14
	bt r12,1
	jc LB_1249
	btr r12,3
	jmp LB_1250
LB_1249:
	bts r12,3
LB_1250:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1247
	btr QWORD [rdi],1
	jmp LB_1248
LB_1247:
	bts QWORD [rdi],1
LB_1248:
	mov rsi,1
	bt r12,0
	jc LB_1241
	mov rsi,0
	bt r13,0
	jc LB_1241
	jmp LB_1242
LB_1241:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1242:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_689
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1225 ⊢ %_1226 : %_1226
 ; {>  %_1225~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1226
 ; {>  %_1226~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1251
	btr r12,3
	jmp LB_1252
LB_1251:
	bts r12,3
LB_1252:
	mov r8,0
	bts r12,2
	ret
LB_1253:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1255
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1254
LB_1255:
	add rsp,8
	ret
LB_1256:
	add rsp,32
	pop r14
LB_1254:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1220:
NS_E_RDI_1220:
NS_E_1220_ETR_TBL:
NS_E_1220_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_1221_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1293
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1285
LB_1293:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1298
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1299:
	jmp LB_1285
LB_1298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1288
	btr r12,1
	clc
	jmp LB_1289
LB_1288:
	bts r12,1
	stc
LB_1289:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1286
	btr r12,0
	clc
	jmp LB_1287
LB_1286:
	bts r12,0
	stc
LB_1287:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1282
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_1227 %_1228 } ⊢ %_1229 : %_1229
 ; {>  %_1227~0':_r64 %_1228~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_1229 ⊢ %_1230 : %_1230
 ; {>  %_1229~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_1230
 ; {>  %_1230~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_1276
	btr r12,2
	jmp LB_1277
LB_1276:
	bts r12,2
LB_1277:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_1274
	btr QWORD [rdi],0
	jmp LB_1275
LB_1274:
	bts QWORD [rdi],0
LB_1275:
	mov r8,r14
	bt r12,1
	jc LB_1280
	btr r12,2
	jmp LB_1281
LB_1280:
	bts r12,2
LB_1281:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_1278
	btr QWORD [rdi],1
	jmp LB_1279
LB_1278:
	bts QWORD [rdi],1
LB_1279:
	mov rsi,1
	bt r12,3
	jc LB_1272
	mov rsi,0
	bt r9,0
	jc LB_1272
	jmp LB_1273
LB_1272:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1273:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1282:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1284
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1283
LB_1284:
	add rsp,8
	ret
LB_1285:
	add rsp,32
	pop r14
LB_1283:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_1303
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_1231 : %_1231
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_1231 ⊢ %_1232 : %_1232
 ; {>  %_1231~°1◂{  }:(_lst)◂(t438'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_1232
 ; {>  %_1232~°0◂°1◂{  }:(_opn)◂((_lst)◂(t441'(0))) }
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
	jc LB_1301
	mov rsi,0
	bt r9,0
	jc LB_1301
	jmp LB_1302
LB_1301:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1302:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1303:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1305
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1304
LB_1305:
	add rsp,8
	ret
LB_1306:
	add rsp,0
	pop r14
LB_1304:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1221:
NS_E_RDI_1221:
NS_E_1221_ETR_TBL:
NS_E_1221_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_1188_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1318
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1312
LB_1318:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1313
	btr r12,0
	clc
	jmp LB_1314
LB_1313:
	bts r12,0
	stc
LB_1314:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1309
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1233 ⊢ %_1234 : %_1234
 ; {>  %_1233~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1234
 ; {>  %_1234~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1307
	btr r12,3
	jmp LB_1308
LB_1307:
	bts r12,3
LB_1308:
	mov r8,0
	bts r12,2
	ret
LB_1309:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1311
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1310
LB_1311:
	add rsp,8
	ret
LB_1312:
	add rsp,16
	pop r14
LB_1310:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_1065_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1331
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1325
LB_1331:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1326
	btr r12,0
	clc
	jmp LB_1327
LB_1326:
	bts r12,0
	stc
LB_1327:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1322
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1235 ⊢ %_1236 : %_1236
 ; {>  %_1235~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1236
 ; {>  %_1236~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1320
	btr r12,3
	jmp LB_1321
LB_1320:
	bts r12,3
LB_1321:
	mov r8,0
	bts r12,2
	ret
LB_1322:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1324
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1323
LB_1324:
	add rsp,8
	ret
LB_1325:
	add rsp,16
	pop r14
LB_1323:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1346
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1346
	jmp LB_1347
LB_1346:
	jmp LB_1338
LB_1347:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1339
	btr r12,0
	clc
	jmp LB_1340
LB_1339:
	bts r12,0
	stc
LB_1340:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1335
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr5f |~ {  } ⊢ %_1237 : %_1237
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_1237
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_1237 ⊢ %_1238 : %_1238
 ; {>  %_1237~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1238
 ; {>  %_1238~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1333
	btr r12,3
	jmp LB_1334
LB_1333:
	bts r12,3
LB_1334:
	mov r8,0
	bts r12,2
	ret
LB_1335:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1337
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1336
LB_1337:
	add rsp,8
	ret
LB_1338:
	add rsp,16
	pop r14
LB_1336:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1348:
NS_E_RDI_1348:
NS_E_1348_ETR_TBL:
NS_E_1348_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1369
	jmp LB_1370
LB_1369:
	jmp LB_1359
LB_1370:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_1220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1374
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1375
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1375:
	jmp LB_1359
LB_1374:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1362
	btr r12,1
	clc
	jmp LB_1363
LB_1362:
	bts r12,1
	stc
LB_1363:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1360
	btr r12,0
	clc
	jmp LB_1361
LB_1360:
	bts r12,0
	stc
LB_1361:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1356
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_1377
	btr r12,5
	jmp LB_1378
LB_1377:
	bts r12,5
LB_1378:
	mov r13,r14
	bt r12,1
	jc LB_1379
	btr r12,0
	jmp LB_1380
LB_1379:
	bts r12,0
LB_1380:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f689 %_1349 ⊢ %_1350 : %_1350
 ; {>  %_1349~0':(_lst)◂(_r64) }
; _f689 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_689
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1350 ⊢ %_1351 : %_1351
 ; {>  %_1350~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1351
 ; {>  %_1351~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1354
	btr r12,3
	jmp LB_1355
LB_1354:
	bts r12,3
LB_1355:
	mov r8,0
	bts r12,2
	ret
LB_1356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1358
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1357
LB_1358:
	add rsp,8
	ret
LB_1359:
	add rsp,32
	pop r14
LB_1357:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1392
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1386
LB_1392:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1387
	btr r12,0
	clc
	jmp LB_1388
LB_1387:
	bts r12,0
	stc
LB_1388:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1383
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1352 ⊢ %_1353 : %_1353
 ; {>  %_1352~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1353
 ; {>  %_1353~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1381
	btr r12,3
	jmp LB_1382
LB_1381:
	bts r12,3
LB_1382:
	mov r8,0
	bts r12,2
	ret
LB_1383:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1385
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1384
LB_1385:
	add rsp,8
	ret
LB_1386:
	add rsp,16
	pop r14
LB_1384:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1405:
; 	|» 0'
NS_E_RDI_1405:
MTC_LB_1406:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1407
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
	jnc LB_1408
	bt QWORD [rdi],0
	jc LB_1409
	btr r12,3
	clc
	jmp LB_1410
LB_1409:
	bts r12,3
	stc
LB_1410:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1408:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1413
	btr r12,4
	clc
	jmp LB_1414
LB_1413:
	bts r12,4
	stc
LB_1414:
	mov r14,r10
	bt r12,4
	jc LB_1411
	btr r12,1
	jmp LB_1412
LB_1411:
	bts r12,1
LB_1412:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1417
	btr r12,4
	clc
	jmp LB_1418
LB_1417:
	bts r12,4
	stc
LB_1418:
	mov r8,r10
	bt r12,4
	jc LB_1415
	btr r12,2
	jmp LB_1416
LB_1415:
	bts r12,2
LB_1416:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1419:
	cmp r15,0
	jz LB_1420
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1419
LB_1420:
; _f1405 %_1399 ⊢ %_1400 : %_1400
 ; {>  %_1399~2':_p1394 %_1398~1':_stg }
; _f1405 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1423
	btr r12,0
	jmp LB_1424
LB_1423:
	bts r12,0
LB_1424:
	call NS_E_1405
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1421
	btr r12,1
	clc
	jmp LB_1422
LB_1421:
	bts r12,1
	stc
LB_1422:
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
; ∎ %_1403
 ; {>  %_1401~1':_stg %_1403~2':_stg %_1402~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1425
	mov rdi,r14
	call dlt
LB_1425:
	bt r12,0
	jc LB_1426
	mov rdi,r13
	call dlt
LB_1426:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1427
	btr r12,0
	jmp LB_1428
LB_1427:
	bts r12,0
LB_1428:
	ret
MTC_LB_1407:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1429
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
	jnc LB_1430
	bt QWORD [rdi],0
	jc LB_1431
	btr r12,2
	clc
	jmp LB_1432
LB_1431:
	bts r12,2
	stc
LB_1432:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1430:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1433
	btr r12,1
	jmp LB_1434
LB_1433:
	bts r12,1
LB_1434:
LB_1435:
	cmp r15,0
	jz LB_1436
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1435
LB_1436:
; ∎ %_1404
 ; {>  %_1404~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1437
	btr r12,0
	jmp LB_1438
LB_1437:
	bts r12,0
LB_1438:
	ret
MTC_LB_1429:
NS_E_1541:
; 	|» 0'
NS_E_RDI_1541:
MTC_LB_1542:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1543
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
	jnc LB_1544
	bt QWORD [rdi],0
	jc LB_1545
	btr r12,2
	clc
	jmp LB_1546
LB_1545:
	bts r12,2
	stc
LB_1546:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1544:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1547
	btr r12,1
	jmp LB_1548
LB_1547:
	bts r12,1
LB_1548:
LB_1549:
	cmp r15,0
	jz LB_1550
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1549
LB_1550:
; 	» "??r" _ ⊢ 0' : %_1536
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1536
 ; {>  %_1536~0':_stg %_1535~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_1551
	mov rdi,r14
	call dlt
LB_1551:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1543:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1552
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
	jnc LB_1553
	bt QWORD [rdi],0
	jc LB_1554
	btr r12,2
	clc
	jmp LB_1555
LB_1554:
	bts r12,2
	stc
LB_1555:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1553:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1556
	btr r12,1
	jmp LB_1557
LB_1556:
	bts r12,1
LB_1557:
LB_1558:
	cmp r15,0
	jz LB_1559
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1558
LB_1559:
; 	» ".." _ ⊢ 0' : %_1538
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1538
 ; {>  %_1537~1':_stg %_1538~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1560
	mov rdi,r14
	call dlt
LB_1560:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1552:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1561
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
	jnc LB_1562
	bt QWORD [rdi],0
	jc LB_1563
	btr r12,2
	clc
	jmp LB_1564
LB_1563:
	bts r12,2
	stc
LB_1564:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1562:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1565
	btr r12,1
	jmp LB_1566
LB_1565:
	bts r12,1
LB_1566:
LB_1567:
	cmp r15,0
	jz LB_1568
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1567
LB_1568:
; _f1405 %_1539 ⊢ %_1540 : %_1540
 ; {>  %_1539~1':_p1394 }
; _f1405 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1569
	btr r12,0
	jmp LB_1570
LB_1569:
	bts r12,0
LB_1570:
	call NS_E_1405
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1540
 ; {>  %_1540~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1561:
NS_E_1611:
; 	|» 0'
NS_E_RDI_1611:
MTC_LB_1612:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1613
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
	jnc LB_1614
	bt QWORD [rdi],0
	jc LB_1615
	btr r12,3
	clc
	jmp LB_1616
LB_1615:
	bts r12,3
	stc
LB_1616:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1614:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1619
	btr r12,4
	clc
	jmp LB_1620
LB_1619:
	bts r12,4
	stc
LB_1620:
	mov r14,r10
	bt r12,4
	jc LB_1617
	btr r12,1
	jmp LB_1618
LB_1617:
	bts r12,1
LB_1618:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1623
	btr r12,4
	clc
	jmp LB_1624
LB_1623:
	bts r12,4
	stc
LB_1624:
	mov r8,r10
	bt r12,4
	jc LB_1621
	btr r12,2
	jmp LB_1622
LB_1621:
	bts r12,2
LB_1622:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1625:
	cmp r15,0
	jz LB_1626
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1625
LB_1626:
; _f1601 %_1603 ⊢ %_1605 : %_1605
 ; {>  %_1603~1':(_p1439)◂((_p1447)◂(_stg)) %_1604~2':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _f1601 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1629
	btr r12,0
	jmp LB_1630
LB_1629:
	bts r12,0
LB_1630:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1627
	btr r12,2
	clc
	jmp LB_1628
LB_1627:
	bts r12,2
	stc
LB_1628:
	add rsp,16
; _f1611 %_1604 ⊢ %_1606 : %_1606
 ; {>  %_1605~0':_stg %_1604~2':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _f1611 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1633
	btr r12,0
	jmp LB_1634
LB_1633:
	bts r12,0
LB_1634:
	call NS_E_1611
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1635
	btr r12,1
	jmp LB_1636
LB_1635:
	bts r12,1
LB_1636:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1631
	btr r12,0
	clc
	jmp LB_1632
LB_1631:
	bts r12,0
	stc
LB_1632:
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
; ∎ %_1609
 ; {>  %_1609~2':_stg %_1607~0':_stg %_1608~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1637
	mov rdi,r13
	call dlt
LB_1637:
	bt r12,1
	jc LB_1638
	mov rdi,r14
	call dlt
LB_1638:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1639
	btr r12,0
	jmp LB_1640
LB_1639:
	bts r12,0
LB_1640:
	ret
MTC_LB_1613:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1641
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
	jnc LB_1642
	bt QWORD [rdi],0
	jc LB_1643
	btr r12,1
	clc
	jmp LB_1644
LB_1643:
	bts r12,1
	stc
LB_1644:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1642:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1645:
	cmp r15,0
	jz LB_1646
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1645
LB_1646:
; 	» "" _ ⊢ 0' : %_1610
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1610
 ; {>  %_1610~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1641:
NS_E_1601:
; 	|» 0'
NS_E_RDI_1601:
MTC_LB_1647:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1648
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
	jnc LB_1649
	bt QWORD [rdi],0
	jc LB_1650
	btr r12,2
	clc
	jmp LB_1651
LB_1650:
	bts r12,2
	stc
LB_1651:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1649:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1652
	btr r12,1
	jmp LB_1653
LB_1652:
	bts r12,1
LB_1653:
LB_1654:
	cmp r15,0
	jz LB_1655
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1654
LB_1655:
; _f1611 %_1594 ⊢ %_1595 : %_1595
 ; {>  %_1594~1':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _f1611 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1656
	btr r12,0
	jmp LB_1657
LB_1656:
	bts r12,0
LB_1657:
	call NS_E_1611
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
; ∎ %_1597
 ; {>  %_1597~1':_stg %_1596~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1658
	mov rdi,r13
	call dlt
LB_1658:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1659
	btr r12,0
	jmp LB_1660
LB_1659:
	bts r12,0
LB_1660:
	ret
MTC_LB_1648:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1661
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
	jnc LB_1662
	bt QWORD [rdi],0
	jc LB_1663
	btr r12,2
	clc
	jmp LB_1664
LB_1663:
	bts r12,2
	stc
LB_1664:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1662:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1665
	btr r12,1
	jmp LB_1666
LB_1665:
	bts r12,1
LB_1666:
LB_1667:
	cmp r15,0
	jz LB_1668
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1667
LB_1668:
MTC_LB_1669:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1670
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
	jnc LB_1671
	bt QWORD [rdi],0
	jc LB_1672
	btr r12,0
	clc
	jmp LB_1673
LB_1672:
	bts r12,0
	stc
LB_1673:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1671:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1674:
	cmp r15,0
	jz LB_1675
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1674
LB_1675:
; 	» "_ " _ ⊢ 0' : %_1599
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1599
 ; {>  %_1599~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1670:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1676
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
	jnc LB_1677
	bt QWORD [rdi],0
	jc LB_1678
	btr r12,2
	clc
	jmp LB_1679
LB_1678:
	bts r12,2
	stc
LB_1679:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1677:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1680
	btr r12,0
	jmp LB_1681
LB_1680:
	bts r12,0
LB_1681:
LB_1682:
	cmp r15,0
	jz LB_1683
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1682
LB_1683:
; ∎ %_1600
 ; {>  %_1600~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1676:
MTC_LB_1661:
NS_E_1592:
; 	|» 0'
NS_E_RDI_1592:
MTC_LB_1684:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1685
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
	jnc LB_1686
	bt QWORD [rdi],0
	jc LB_1687
	btr r12,3
	clc
	jmp LB_1688
LB_1687:
	bts r12,3
	stc
LB_1688:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1686:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1691
	btr r12,4
	clc
	jmp LB_1692
LB_1691:
	bts r12,4
	stc
LB_1692:
	mov r14,r10
	bt r12,4
	jc LB_1689
	btr r12,1
	jmp LB_1690
LB_1689:
	bts r12,1
LB_1690:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1695
	btr r12,4
	clc
	jmp LB_1696
LB_1695:
	bts r12,4
	stc
LB_1696:
	mov r8,r10
	bt r12,4
	jc LB_1693
	btr r12,2
	jmp LB_1694
LB_1693:
	bts r12,2
LB_1694:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1697:
	cmp r15,0
	jz LB_1698
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1697
LB_1698:
; _f1582 %_1584 ⊢ %_1586 : %_1586
 ; {>  %_1584~1':(_p1439)◂((_p1446)◂(_stg)) %_1585~2':(_lst)◂((_p1439)◂((_p1446)◂(_stg))) }
; _f1582 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1701
	btr r12,0
	jmp LB_1702
LB_1701:
	bts r12,0
LB_1702:
	call NS_E_1582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1699
	btr r12,2
	clc
	jmp LB_1700
LB_1699:
	bts r12,2
	stc
LB_1700:
	add rsp,16
; _f1592 %_1585 ⊢ %_1587 : %_1587
 ; {>  %_1586~0':_stg %_1585~2':(_lst)◂((_p1439)◂((_p1446)◂(_stg))) }
; _f1592 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1705
	btr r12,0
	jmp LB_1706
LB_1705:
	bts r12,0
LB_1706:
	call NS_E_1592
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1707
	btr r12,1
	jmp LB_1708
LB_1707:
	bts r12,1
LB_1708:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1703
	btr r12,0
	clc
	jmp LB_1704
LB_1703:
	bts r12,0
	stc
LB_1704:
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
; ∎ %_1590
 ; {>  %_1590~2':_stg %_1588~0':_stg %_1589~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1709
	mov rdi,r13
	call dlt
LB_1709:
	bt r12,1
	jc LB_1710
	mov rdi,r14
	call dlt
LB_1710:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1711
	btr r12,0
	jmp LB_1712
LB_1711:
	bts r12,0
LB_1712:
	ret
MTC_LB_1685:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1713
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
	jnc LB_1714
	bt QWORD [rdi],0
	jc LB_1715
	btr r12,1
	clc
	jmp LB_1716
LB_1715:
	bts r12,1
	stc
LB_1716:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1714:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1717:
	cmp r15,0
	jz LB_1718
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1717
LB_1718:
; 	» "" _ ⊢ 0' : %_1591
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1591
 ; {>  %_1591~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1713:
NS_E_1582:
; 	|» 0'
NS_E_RDI_1582:
MTC_LB_1719:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1720
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
	jnc LB_1721
	bt QWORD [rdi],0
	jc LB_1722
	btr r12,2
	clc
	jmp LB_1723
LB_1722:
	bts r12,2
	stc
LB_1723:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1721:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1724
	btr r12,1
	jmp LB_1725
LB_1724:
	bts r12,1
LB_1725:
LB_1726:
	cmp r15,0
	jz LB_1727
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1726
LB_1727:
; _f1592 %_1572 ⊢ %_1573 : %_1573
 ; {>  %_1572~1':(_lst)◂((_p1439)◂((_p1446)◂(_stg))) }
; _f1592 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1728
	btr r12,0
	jmp LB_1729
LB_1728:
	bts r12,0
LB_1729:
	call NS_E_1592
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
; ∎ %_1575
 ; {>  %_1574~0':_stg %_1575~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1730
	mov rdi,r13
	call dlt
LB_1730:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1731
	btr r12,0
	jmp LB_1732
LB_1731:
	bts r12,0
LB_1732:
	ret
MTC_LB_1720:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1733
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
	jnc LB_1734
	bt QWORD [rdi],0
	jc LB_1735
	btr r12,2
	clc
	jmp LB_1736
LB_1735:
	bts r12,2
	stc
LB_1736:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1734:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1737
	btr r12,1
	jmp LB_1738
LB_1737:
	bts r12,1
LB_1738:
LB_1739:
	cmp r15,0
	jz LB_1740
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1739
LB_1740:
MTC_LB_1741:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1742
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
	jnc LB_1743
	bt QWORD [rdi],0
	jc LB_1744
	btr r12,2
	clc
	jmp LB_1745
LB_1744:
	bts r12,2
	stc
LB_1745:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1743:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1746
	btr r12,0
	jmp LB_1747
LB_1746:
	bts r12,0
LB_1747:
LB_1748:
	cmp r15,0
	jz LB_1749
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1748
LB_1749:
; _f1541 %_1577 ⊢ %_1578 : %_1578
 ; {>  %_1577~0':_p1442 }
; _f1541 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1541
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
; ∎ %_1580
 ; {>  %_1580~1':_stg %_1579~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1750
	mov rdi,r13
	call dlt
LB_1750:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1751
	btr r12,0
	jmp LB_1752
LB_1751:
	bts r12,0
LB_1752:
	ret
MTC_LB_1742:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1753
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
	jnc LB_1754
	bt QWORD [rdi],0
	jc LB_1755
	btr r12,2
	clc
	jmp LB_1756
LB_1755:
	bts r12,2
	stc
LB_1756:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1754:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1757
	btr r12,0
	jmp LB_1758
LB_1757:
	bts r12,0
LB_1758:
LB_1759:
	cmp r15,0
	jz LB_1760
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1759
LB_1760:
; ∎ %_1581
 ; {>  %_1581~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1753:
MTC_LB_1733:
NS_E_1868:
; 	|» { 0' 1' }
NS_E_RDI_1868:
MTC_LB_1869:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1870
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
	jnc LB_1871
	bt QWORD [rdi],0
	jc LB_1872
	btr r12,5
	clc
	jmp LB_1873
LB_1872:
	bts r12,5
	stc
LB_1873:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1871:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1876
	btr r12,6
	clc
	jmp LB_1877
LB_1876:
	bts r12,6
	stc
LB_1877:
	mov r8,rcx
	bt r12,6
	jc LB_1874
	btr r12,2
	jmp LB_1875
LB_1874:
	bts r12,2
LB_1875:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1880
	btr r12,6
	clc
	jmp LB_1881
LB_1880:
	bts r12,6
	stc
LB_1881:
	mov r9,rcx
	bt r12,6
	jc LB_1878
	btr r12,3
	jmp LB_1879
LB_1878:
	bts r12,3
LB_1879:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_1884
	btr r12,6
	clc
	jmp LB_1885
LB_1884:
	bts r12,6
	stc
LB_1885:
	mov r10,rcx
	bt r12,6
	jc LB_1882
	btr r12,4
	jmp LB_1883
LB_1882:
	bts r12,4
LB_1883:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1886:
	cmp r15,0
	jz LB_1887
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1886
LB_1887:
; _f1868 { %_1829 %_1833 } ⊢ { %_1834 %_1835 } : { %_1834 %_1835 }
 ; {>  %_1832~3':(_p1455)◂(_stg) %_1829~0':_r64 %_1831~2':(_lst)◂((_p1456)◂(_stg)) %_1833~4':(_p1454)◂(_stg) }
; _f1868 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1892
	btr r12,1
	jmp LB_1893
LB_1892:
	bts r12,1
LB_1893:
	call NS_E_1868
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1890
	btr r12,3
	clc
	jmp LB_1891
LB_1890:
	bts r12,3
	stc
LB_1891:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1888
	btr r12,2
	clc
	jmp LB_1889
LB_1888:
	bts r12,2
	stc
LB_1889:
	add rsp,24
MTC_LB_1894:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1895
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
	jnc LB_1896
	bt QWORD [rdi],0
	jc LB_1897
	btr r12,5
	clc
	jmp LB_1898
LB_1897:
	bts r12,5
	stc
LB_1898:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1896:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1899
	btr r12,4
	jmp LB_1900
LB_1899:
	bts r12,4
LB_1900:
LB_1901:
	cmp r15,0
	jz LB_1902
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1901
LB_1902:
; _f1868 { %_1834 %_1836 } ⊢ { %_1837 %_1838 } : { %_1837 %_1838 }
 ; {>  %_1836~4':(_p1454)◂(_stg) %_1835~1':_stg %_1831~2':(_lst)◂((_p1456)◂(_stg)) %_1834~0':_r64 }
; _f1868 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1907
	btr r12,1
	jmp LB_1908
LB_1907:
	bts r12,1
LB_1908:
	call NS_E_1868
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1909
	btr r12,3
	jmp LB_1910
LB_1909:
	bts r12,3
LB_1910:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1905
	btr r12,2
	clc
	jmp LB_1906
LB_1905:
	bts r12,2
	stc
LB_1906:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1903
	btr r12,1
	clc
	jmp LB_1904
LB_1903:
	bts r12,1
	stc
LB_1904:
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
LB_1911:
	cmp rax,0
	jz LB_1912
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1911
LB_1912:
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
; ∎ { %_1839 %_1842 }
 ; {>  %_1842~4':_stg %_1841~3':_stg %_1831~2':(_lst)◂((_p1456)◂(_stg)) %_1840~1':_stg %_1839~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_1913
	mov rdi,r9
	call dlt
LB_1913:
	bt r12,2
	jc LB_1914
	mov rdi,r8
	call dlt
LB_1914:
	bt r12,1
	jc LB_1915
	mov rdi,r14
	call dlt
LB_1915:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1916
	btr r12,1
	jmp LB_1917
LB_1916:
	bts r12,1
LB_1917:
	ret
MTC_LB_1895:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1918
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
	jnc LB_1919
	bt QWORD [rdi],0
	jc LB_1920
	btr r12,5
	clc
	jmp LB_1921
LB_1920:
	bts r12,5
	stc
LB_1921:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1919:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1922
	btr r12,4
	jmp LB_1923
LB_1922:
	bts r12,4
LB_1923:
LB_1924:
	cmp r15,0
	jz LB_1925
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1924
LB_1925:
; _f56 %_1834 ⊢ %_1844 : %_1844
 ; {>  %_1843~4':(_p1452)◂(_stg) %_1835~1':_stg %_1831~2':(_lst)◂((_p1456)◂(_stg)) %_1834~0':_r64 }
	add r13,1
; _f1780 { %_1844 %_1843 } ⊢ { %_1845 %_1846 } : { %_1845 %_1846 }
 ; {>  %_1843~4':(_p1452)◂(_stg) %_1835~1':_stg %_1831~2':(_lst)◂((_p1456)◂(_stg)) %_1844~0':_r64 }
; _f1780 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1930
	btr r12,1
	jmp LB_1931
LB_1930:
	bts r12,1
LB_1931:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1932
	btr r12,3
	jmp LB_1933
LB_1932:
	bts r12,3
LB_1933:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1928
	btr r12,2
	clc
	jmp LB_1929
LB_1928:
	bts r12,2
	stc
LB_1929:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1926
	btr r12,1
	clc
	jmp LB_1927
LB_1926:
	bts r12,1
	stc
LB_1927:
	add rsp,24
; _f55 %_1845 ⊢ %_1847 : %_1847
 ; {>  %_1846~3':_stg %_1835~1':_stg %_1831~2':(_lst)◂((_p1456)◂(_stg)) %_1845~0':_r64 }
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
LB_1934:
	cmp rax,0
	jz LB_1935
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1934
LB_1935:
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
; ∎ { %_1848 %_1851 }
 ; {>  %_1849~1':_stg %_1831~2':(_lst)◂((_p1456)◂(_stg)) %_1850~3':_stg %_1848~0':_r64 %_1851~4':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_1936
	mov rdi,r14
	call dlt
LB_1936:
	bt r12,2
	jc LB_1937
	mov rdi,r8
	call dlt
LB_1937:
	bt r12,3
	jc LB_1938
	mov rdi,r9
	call dlt
LB_1938:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1939
	btr r12,1
	jmp LB_1940
LB_1939:
	bts r12,1
LB_1940:
	ret
MTC_LB_1918:
MTC_LB_1870:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1941
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
	jnc LB_1942
	bt QWORD [rdi],0
	jc LB_1943
	btr r12,4
	clc
	jmp LB_1944
LB_1943:
	bts r12,4
	stc
LB_1944:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1942:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1947
	btr r12,5
	clc
	jmp LB_1948
LB_1947:
	bts r12,5
	stc
LB_1948:
	mov r8,r11
	bt r12,5
	jc LB_1945
	btr r12,2
	jmp LB_1946
LB_1945:
	bts r12,2
LB_1946:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1951
	btr r12,5
	clc
	jmp LB_1952
LB_1951:
	bts r12,5
	stc
LB_1952:
	mov r9,r11
	bt r12,5
	jc LB_1949
	btr r12,3
	jmp LB_1950
LB_1949:
	bts r12,3
LB_1950:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1953:
	cmp r15,0
	jz LB_1954
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1953
LB_1954:
MTC_LB_1955:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1956
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
	jnc LB_1957
	bt QWORD [rdi],0
	jc LB_1958
	btr r12,4
	clc
	jmp LB_1959
LB_1958:
	bts r12,4
	stc
LB_1959:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1957:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_1960
	btr r12,1
	jmp LB_1961
LB_1960:
	bts r12,1
LB_1961:
LB_1962:
	cmp r15,0
	jz LB_1963
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1962
LB_1963:
; _f1868 { %_1829 %_1854 } ⊢ { %_1855 %_1856 } : { %_1855 %_1856 }
 ; {>  %_1829~0':_r64 %_1854~1':(_p1454)◂(_stg) %_1852~2':(_lst)◂((_p1456)◂(_stg)) }
; _f1868 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1868
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1964
	btr r12,2
	clc
	jmp LB_1965
LB_1964:
	bts r12,2
	stc
LB_1965:
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
LB_1966:
	cmp rax,0
	jz LB_1967
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1966
LB_1967:
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
; ∎ { %_1857 %_1859 }
 ; {>  %_1859~3':_stg %_1858~1':_stg %_1852~2':(_lst)◂((_p1456)◂(_stg)) %_1857~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_1968
	mov rdi,r14
	call dlt
LB_1968:
	bt r12,2
	jc LB_1969
	mov rdi,r8
	call dlt
LB_1969:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1970
	btr r12,1
	jmp LB_1971
LB_1970:
	bts r12,1
LB_1971:
	ret
MTC_LB_1956:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1972
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
	jnc LB_1973
	bt QWORD [rdi],0
	jc LB_1974
	btr r12,4
	clc
	jmp LB_1975
LB_1974:
	bts r12,4
	stc
LB_1975:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1973:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_1976
	btr r12,1
	jmp LB_1977
LB_1976:
	bts r12,1
LB_1977:
LB_1978:
	cmp r15,0
	jz LB_1979
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1978
LB_1979:
; _f56 %_1829 ⊢ %_1861 : %_1861
 ; {>  %_1829~0':_r64 %_1860~1':(_p1452)◂(_stg) %_1852~2':(_lst)◂((_p1456)◂(_stg)) }
	add r13,1
; _f1780 { %_1861 %_1860 } ⊢ { %_1862 %_1863 } : { %_1862 %_1863 }
 ; {>  %_1860~1':(_p1452)◂(_stg) %_1861~0':_r64 %_1852~2':(_lst)◂((_p1456)◂(_stg)) }
; _f1780 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1980
	btr r12,2
	clc
	jmp LB_1981
LB_1980:
	bts r12,2
	stc
LB_1981:
	add rsp,16
; _f55 %_1862 ⊢ %_1864 : %_1864
 ; {>  %_1863~1':_stg %_1862~0':_r64 %_1852~2':(_lst)◂((_p1456)◂(_stg)) }
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
LB_1982:
	cmp rax,0
	jz LB_1983
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1982
LB_1983:
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
; ∎ { %_1865 %_1867 }
 ; {>  %_1866~1':_stg %_1867~3':_stg %_1865~0':_r64 %_1852~2':(_lst)◂((_p1456)◂(_stg)) }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_1984
	mov rdi,r14
	call dlt
LB_1984:
	bt r12,2
	jc LB_1985
	mov rdi,r8
	call dlt
LB_1985:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1986
	btr r12,1
	jmp LB_1987
LB_1986:
	bts r12,1
LB_1987:
	ret
MTC_LB_1972:
MTC_LB_1941:
NS_E_1828:
; 	|» { 0' 1' }
NS_E_RDI_1828:
MTC_LB_1988:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1989
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
	jnc LB_1990
	bt QWORD [rdi],0
	jc LB_1991
	btr r12,5
	clc
	jmp LB_1992
LB_1991:
	bts r12,5
	stc
LB_1992:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1990:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1995
	btr r12,6
	clc
	jmp LB_1996
LB_1995:
	bts r12,6
	stc
LB_1996:
	mov r8,rcx
	bt r12,6
	jc LB_1993
	btr r12,2
	jmp LB_1994
LB_1993:
	bts r12,2
LB_1994:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1999
	btr r12,6
	clc
	jmp LB_2000
LB_1999:
	bts r12,6
	stc
LB_2000:
	mov r9,rcx
	bt r12,6
	jc LB_1997
	btr r12,3
	jmp LB_1998
LB_1997:
	bts r12,3
LB_1998:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2003
	btr r12,6
	clc
	jmp LB_2004
LB_2003:
	bts r12,6
	stc
LB_2004:
	mov r10,rcx
	bt r12,6
	jc LB_2001
	btr r12,4
	jmp LB_2002
LB_2001:
	bts r12,4
LB_2002:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2005:
	cmp r15,0
	jz LB_2006
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2005
LB_2006:
; _f1582 %_1784 ⊢ %_1786 : %_1786
 ; {>  %_1784~3':(_p1439)◂((_p1446)◂(_stg)) %_1781~0':_r64 %_1785~4':(_p1439)◂((_p1447)◂(_stg)) %_1783~2':_p1394 }
; _f1582 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2013
	btr r12,0
	jmp LB_2014
LB_2013:
	bts r12,0
LB_2014:
	call NS_E_1582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2015
	btr r12,1
	jmp LB_2016
LB_2015:
	bts r12,1
LB_2016:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2011
	btr r12,4
	clc
	jmp LB_2012
LB_2011:
	bts r12,4
	stc
LB_2012:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2009
	btr r12,2
	clc
	jmp LB_2010
LB_2009:
	bts r12,2
	stc
LB_2010:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2007
	btr r12,0
	clc
	jmp LB_2008
LB_2007:
	bts r12,0
	stc
LB_2008:
	add rsp,32
; _f1601 %_1785 ⊢ %_1787 : %_1787
 ; {>  %_1781~0':_r64 %_1786~1':_stg %_1785~4':(_p1439)◂((_p1447)◂(_stg)) %_1783~2':_p1394 }
; _f1601 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2023
	btr r12,0
	jmp LB_2024
LB_2023:
	bts r12,0
LB_2024:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2025
	btr r12,3
	jmp LB_2026
LB_2025:
	bts r12,3
LB_2026:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2021
	btr r12,2
	clc
	jmp LB_2022
LB_2021:
	bts r12,2
	stc
LB_2022:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2019
	btr r12,1
	clc
	jmp LB_2020
LB_2019:
	bts r12,1
	stc
LB_2020:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2017
	btr r12,0
	clc
	jmp LB_2018
LB_2017:
	bts r12,0
	stc
LB_2018:
	add rsp,32
; _f1405 %_1783 ⊢ %_1788 : %_1788
 ; {>  %_1781~0':_r64 %_1786~1':_stg %_1787~3':_stg %_1783~2':_p1394 }
; _f1405 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2033
	btr r12,0
	jmp LB_2034
LB_2033:
	bts r12,0
LB_2034:
	call NS_E_1405
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2035
	btr r12,2
	jmp LB_2036
LB_2035:
	bts r12,2
LB_2036:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2031
	btr r12,3
	clc
	jmp LB_2032
LB_2031:
	bts r12,3
	stc
LB_2032:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2029
	btr r12,1
	clc
	jmp LB_2030
LB_2029:
	bts r12,1
	stc
LB_2030:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2027
	btr r12,0
	clc
	jmp LB_2028
LB_2027:
	bts r12,0
	stc
LB_2028:
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
LB_2037:
	cmp rax,0
	jz LB_2038
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2037
LB_2038:
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
; ∎ { %_1789 %_1793 }
 ; {>  %_1790~2':_stg %_1792~3':_stg %_1789~0':_r64 %_1793~4':_stg %_1791~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2039
	mov rdi,r8
	call dlt
LB_2039:
	bt r12,3
	jc LB_2040
	mov rdi,r9
	call dlt
LB_2040:
	bt r12,1
	jc LB_2041
	mov rdi,r14
	call dlt
LB_2041:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2042
	btr r12,1
	jmp LB_2043
LB_2042:
	bts r12,1
LB_2043:
	ret
MTC_LB_1989:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2044
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
	jnc LB_2045
	bt QWORD [rdi],0
	jc LB_2046
	btr r12,4
	clc
	jmp LB_2047
LB_2046:
	bts r12,4
	stc
LB_2047:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2045:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2050
	btr r12,5
	clc
	jmp LB_2051
LB_2050:
	bts r12,5
	stc
LB_2051:
	mov r8,r11
	bt r12,5
	jc LB_2048
	btr r12,2
	jmp LB_2049
LB_2048:
	bts r12,2
LB_2049:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2054
	btr r12,5
	clc
	jmp LB_2055
LB_2054:
	bts r12,5
	stc
LB_2055:
	mov r9,r11
	bt r12,5
	jc LB_2052
	btr r12,3
	jmp LB_2053
LB_2052:
	bts r12,3
LB_2053:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2056:
	cmp r15,0
	jz LB_2057
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2056
LB_2057:
; _f1582 %_1794 ⊢ %_1796 : %_1796
 ; {>  %_1795~3':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) %_1781~0':_r64 %_1794~2':(_p1439)◂((_p1446)◂(_stg)) }
; _f1582 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2062
	btr r12,0
	jmp LB_2063
LB_2062:
	bts r12,0
LB_2063:
	call NS_E_1582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2064
	btr r12,1
	jmp LB_2065
LB_2064:
	bts r12,1
LB_2065:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2060
	btr r12,3
	clc
	jmp LB_2061
LB_2060:
	bts r12,3
	stc
LB_2061:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2058
	btr r12,0
	clc
	jmp LB_2059
LB_2058:
	bts r12,0
	stc
LB_2059:
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
LB_2066:
	cmp rax,0
	jz LB_2067
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2066
LB_2067:
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
; ∎ { %_1797 %_1799 }
 ; {>  %_1795~3':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) %_1799~2':_stg %_1797~0':_r64 %_1798~1':_stg }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_2068
	mov rdi,r9
	call dlt
LB_2068:
	bt r12,1
	jc LB_2069
	mov rdi,r14
	call dlt
LB_2069:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2070
	btr r12,1
	jmp LB_2071
LB_2070:
	bts r12,1
LB_2071:
	ret
MTC_LB_2044:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2072
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
	jnc LB_2073
	bt QWORD [rdi],0
	jc LB_2074
	btr r12,5
	clc
	jmp LB_2075
LB_2074:
	bts r12,5
	stc
LB_2075:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2073:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2078
	btr r12,6
	clc
	jmp LB_2079
LB_2078:
	bts r12,6
	stc
LB_2079:
	mov r8,rcx
	bt r12,6
	jc LB_2076
	btr r12,2
	jmp LB_2077
LB_2076:
	bts r12,2
LB_2077:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2082
	btr r12,6
	clc
	jmp LB_2083
LB_2082:
	bts r12,6
	stc
LB_2083:
	mov r9,rcx
	bt r12,6
	jc LB_2080
	btr r12,3
	jmp LB_2081
LB_2080:
	bts r12,3
LB_2081:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2086
	btr r12,6
	clc
	jmp LB_2087
LB_2086:
	bts r12,6
	stc
LB_2087:
	mov r10,rcx
	bt r12,6
	jc LB_2084
	btr r12,4
	jmp LB_2085
LB_2084:
	bts r12,4
LB_2085:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2088:
	cmp r15,0
	jz LB_2089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2088
LB_2089:
; _f1441 %_1800 ⊢ %_1803 : %_1803
 ; {>  %_1781~0':_r64 %_1801~3':(_p1439)◂((_p1446)◂(_stg)) %_1802~4':(_p1439)◂((_p1447)◂(_stg)) %_1800~2':(_p1446)◂(_stg) }
; _f1441 2' ⊢ °1◂2'
; _f1582 %_1803 ⊢ %_1804 : %_1804
 ; {>  %_1781~0':_r64 %_1801~3':(_p1439)◂((_p1446)◂(_stg)) %_1802~4':(_p1439)◂((_p1447)◂(_stg)) %_1803~°1◂2':(_p1439)◂((_p1446)◂(_stg)) }
; _f1582 °1◂2' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},°1◂2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2098
	btr r12,0
	jmp LB_2099
LB_2098:
	bts r12,0
LB_2099:
	mov rsi,1
	bt r12,0
	jc LB_2096
	mov rsi,0
	bt r13,0
	jc LB_2096
	jmp LB_2097
LB_2096:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_2097:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_1582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2100
	btr r12,1
	jmp LB_2101
LB_2100:
	bts r12,1
LB_2101:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2094
	btr r12,4
	clc
	jmp LB_2095
LB_2094:
	bts r12,4
	stc
LB_2095:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2092
	btr r12,3
	clc
	jmp LB_2093
LB_2092:
	bts r12,3
	stc
LB_2093:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2090
	btr r12,0
	clc
	jmp LB_2091
LB_2090:
	bts r12,0
	stc
LB_2091:
	add rsp,32
; _f1582 %_1801 ⊢ %_1805 : %_1805
 ; {>  %_1781~0':_r64 %_1804~1':_stg %_1801~3':(_p1439)◂((_p1446)◂(_stg)) %_1802~4':(_p1439)◂((_p1447)◂(_stg)) }
; _f1582 3' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2108
	btr r12,0
	jmp LB_2109
LB_2108:
	bts r12,0
LB_2109:
	call NS_E_1582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2110
	btr r12,2
	jmp LB_2111
LB_2110:
	bts r12,2
LB_2111:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2106
	btr r12,4
	clc
	jmp LB_2107
LB_2106:
	bts r12,4
	stc
LB_2107:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2104
	btr r12,1
	clc
	jmp LB_2105
LB_2104:
	bts r12,1
	stc
LB_2105:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2102
	btr r12,0
	clc
	jmp LB_2103
LB_2102:
	bts r12,0
	stc
LB_2103:
	add rsp,32
; _f1601 %_1802 ⊢ %_1806 : %_1806
 ; {>  %_1805~2':_stg %_1781~0':_r64 %_1804~1':_stg %_1802~4':(_p1439)◂((_p1447)◂(_stg)) }
; _f1601 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2118
	btr r12,0
	jmp LB_2119
LB_2118:
	bts r12,0
LB_2119:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2120
	btr r12,3
	jmp LB_2121
LB_2120:
	bts r12,3
LB_2121:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2116
	btr r12,2
	clc
	jmp LB_2117
LB_2116:
	bts r12,2
	stc
LB_2117:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2114
	btr r12,1
	clc
	jmp LB_2115
LB_2114:
	bts r12,1
	stc
LB_2115:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2112
	btr r12,0
	clc
	jmp LB_2113
LB_2112:
	bts r12,0
	stc
LB_2113:
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
LB_2122:
	cmp rax,0
	jz LB_2123
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2122
LB_2123:
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
; ∎ { %_1807 %_1811 }
 ; {>  %_1807~0':_r64 %_1811~4':_stg %_1809~2':_stg %_1808~1':_stg %_1810~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2124
	mov rdi,r8
	call dlt
LB_2124:
	bt r12,1
	jc LB_2125
	mov rdi,r14
	call dlt
LB_2125:
	bt r12,3
	jc LB_2126
	mov rdi,r9
	call dlt
LB_2126:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2127
	btr r12,1
	jmp LB_2128
LB_2127:
	bts r12,1
LB_2128:
	ret
MTC_LB_2072:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2129
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
	jnc LB_2130
	bt QWORD [rdi],0
	jc LB_2131
	btr r12,5
	clc
	jmp LB_2132
LB_2131:
	bts r12,5
	stc
LB_2132:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2130:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2135
	btr r12,6
	clc
	jmp LB_2136
LB_2135:
	bts r12,6
	stc
LB_2136:
	mov r8,rcx
	bt r12,6
	jc LB_2133
	btr r12,2
	jmp LB_2134
LB_2133:
	bts r12,2
LB_2134:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2139
	btr r12,6
	clc
	jmp LB_2140
LB_2139:
	bts r12,6
	stc
LB_2140:
	mov r9,rcx
	bt r12,6
	jc LB_2137
	btr r12,3
	jmp LB_2138
LB_2137:
	bts r12,3
LB_2138:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2143
	btr r12,6
	clc
	jmp LB_2144
LB_2143:
	bts r12,6
	stc
LB_2144:
	mov r10,rcx
	bt r12,6
	jc LB_2141
	btr r12,4
	jmp LB_2142
LB_2141:
	bts r12,4
LB_2142:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2145:
	cmp r15,0
	jz LB_2146
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2145
LB_2146:
; _f1582 %_1813 ⊢ %_1815 : %_1815
 ; {>  %_1814~4':(_p1439)◂((_p1447)◂(_stg)) %_1812~2':_p1442 %_1781~0':_r64 %_1813~3':(_p1439)◂((_p1446)◂(_stg)) }
; _f1582 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2153
	btr r12,0
	jmp LB_2154
LB_2153:
	bts r12,0
LB_2154:
	call NS_E_1582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2155
	btr r12,1
	jmp LB_2156
LB_2155:
	bts r12,1
LB_2156:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2151
	btr r12,4
	clc
	jmp LB_2152
LB_2151:
	bts r12,4
	stc
LB_2152:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2149
	btr r12,2
	clc
	jmp LB_2150
LB_2149:
	bts r12,2
	stc
LB_2150:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2147
	btr r12,0
	clc
	jmp LB_2148
LB_2147:
	bts r12,0
	stc
LB_2148:
	add rsp,32
; _f1601 %_1814 ⊢ %_1816 : %_1816
 ; {>  %_1814~4':(_p1439)◂((_p1447)◂(_stg)) %_1812~2':_p1442 %_1781~0':_r64 %_1815~1':_stg }
; _f1601 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2163
	btr r12,0
	jmp LB_2164
LB_2163:
	bts r12,0
LB_2164:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2165
	btr r12,3
	jmp LB_2166
LB_2165:
	bts r12,3
LB_2166:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2161
	btr r12,2
	clc
	jmp LB_2162
LB_2161:
	bts r12,2
	stc
LB_2162:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2159
	btr r12,1
	clc
	jmp LB_2160
LB_2159:
	bts r12,1
	stc
LB_2160:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2157
	btr r12,0
	clc
	jmp LB_2158
LB_2157:
	bts r12,0
	stc
LB_2158:
	add rsp,32
; _f1541 %_1812 ⊢ %_1817 : %_1817
 ; {>  %_1812~2':_p1442 %_1781~0':_r64 %_1815~1':_stg %_1816~3':_stg }
; _f1541 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2173
	btr r12,0
	jmp LB_2174
LB_2173:
	bts r12,0
LB_2174:
	call NS_E_1541
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2175
	btr r12,2
	jmp LB_2176
LB_2175:
	bts r12,2
LB_2176:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2171
	btr r12,3
	clc
	jmp LB_2172
LB_2171:
	bts r12,3
	stc
LB_2172:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2169
	btr r12,1
	clc
	jmp LB_2170
LB_2169:
	bts r12,1
	stc
LB_2170:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2167
	btr r12,0
	clc
	jmp LB_2168
LB_2167:
	bts r12,0
	stc
LB_2168:
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
LB_2177:
	cmp rax,0
	jz LB_2178
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2177
LB_2178:
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
; ∎ { %_1818 %_1822 }
 ; {>  %_1819~2':_stg %_1818~0':_r64 %_1822~4':_stg %_1820~1':_stg %_1821~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2179
	mov rdi,r8
	call dlt
LB_2179:
	bt r12,1
	jc LB_2180
	mov rdi,r14
	call dlt
LB_2180:
	bt r12,3
	jc LB_2181
	mov rdi,r9
	call dlt
LB_2181:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2182
	btr r12,1
	jmp LB_2183
LB_2182:
	bts r12,1
LB_2183:
	ret
MTC_LB_2129:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2184
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
	jnc LB_2185
	bt QWORD [rdi],0
	jc LB_2186
	btr r12,5
	clc
	jmp LB_2187
LB_2186:
	bts r12,5
	stc
LB_2187:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2185:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2190
	btr r12,6
	clc
	jmp LB_2191
LB_2190:
	bts r12,6
	stc
LB_2191:
	mov r8,rcx
	bt r12,6
	jc LB_2188
	btr r12,2
	jmp LB_2189
LB_2188:
	bts r12,2
LB_2189:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2194
	btr r12,6
	clc
	jmp LB_2195
LB_2194:
	bts r12,6
	stc
LB_2195:
	mov r9,rcx
	bt r12,6
	jc LB_2192
	btr r12,3
	jmp LB_2193
LB_2192:
	bts r12,3
LB_2193:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2198
	btr r12,6
	clc
	jmp LB_2199
LB_2198:
	bts r12,6
	stc
LB_2199:
	mov r10,rcx
	bt r12,6
	jc LB_2196
	btr r12,4
	jmp LB_2197
LB_2196:
	bts r12,4
LB_2197:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2200:
	cmp r15,0
	jz LB_2201
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2200
LB_2201:
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
LB_2202:
	cmp rax,0
	jz LB_2203
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2202
LB_2203:
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
; ∎ { %_1826 %_1827 }
 ; {>  %_1825~4':(_lst)◂((_p1447)◂(_stg)) %_1823~2':(_lst)◂(_p1458) %_1827~1':_stg %_1824~3':(_lst)◂((_p1446)◂(_stg)) %_1826~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_2204
	mov rdi,r10
	call dlt
LB_2204:
	bt r12,2
	jc LB_2205
	mov rdi,r8
	call dlt
LB_2205:
	bt r12,3
	jc LB_2206
	mov rdi,r9
	call dlt
LB_2206:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2184:
NS_E_1780:
; 	|» { 0' 1' }
NS_E_RDI_1780:
MTC_LB_2207:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2208
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
	jnc LB_2209
	bt QWORD [rdi],0
	jc LB_2210
	btr r12,4
	clc
	jmp LB_2211
LB_2210:
	bts r12,4
	stc
LB_2211:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2209:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2214
	btr r12,5
	clc
	jmp LB_2215
LB_2214:
	bts r12,5
	stc
LB_2215:
	mov r8,r11
	bt r12,5
	jc LB_2212
	btr r12,2
	jmp LB_2213
LB_2212:
	bts r12,2
LB_2213:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2218
	btr r12,5
	clc
	jmp LB_2219
LB_2218:
	bts r12,5
	stc
LB_2219:
	mov r9,r11
	bt r12,5
	jc LB_2216
	btr r12,3
	jmp LB_2217
LB_2216:
	bts r12,3
LB_2217:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2220:
	cmp r15,0
	jz LB_2221
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2220
LB_2221:
; _f1828 { %_1761 %_1763 } ⊢ { %_1765 %_1766 } : { %_1765 %_1766 }
 ; {>  %_1761~0':_r64 %_1764~3':(_p1452)◂(_stg) %_1763~2':(_p1453)◂(_stg) }
; _f1828 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2224
	btr r12,1
	jmp LB_2225
LB_2224:
	bts r12,1
LB_2225:
	call NS_E_1828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_2222
	btr r12,3
	clc
	jmp LB_2223
LB_2222:
	bts r12,3
	stc
LB_2223:
	add rsp,16
; _f1780 { %_1765 %_1764 } ⊢ { %_1767 %_1768 } : { %_1767 %_1768 }
 ; {>  %_1766~1':_stg %_1765~0':_r64 %_1764~3':(_p1452)◂(_stg) }
; _f1780 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2228
	btr r12,1
	jmp LB_2229
LB_2228:
	bts r12,1
LB_2229:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2230
	btr r12,2
	jmp LB_2231
LB_2230:
	bts r12,2
LB_2231:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2226
	btr r12,1
	clc
	jmp LB_2227
LB_2226:
	bts r12,1
	stc
LB_2227:
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
; ∎ { %_1767 %_1771 }
 ; {>  %_1767~0':_r64 %_1771~3':_stg %_1770~2':_stg %_1769~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2232
	mov rdi,r8
	call dlt
LB_2232:
	bt r12,1
	jc LB_2233
	mov rdi,r14
	call dlt
LB_2233:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2234
	btr r12,1
	jmp LB_2235
LB_2234:
	bts r12,1
LB_2235:
	ret
MTC_LB_2208:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2236
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
	jnc LB_2237
	bt QWORD [rdi],0
	jc LB_2238
	btr r12,3
	clc
	jmp LB_2239
LB_2238:
	bts r12,3
	stc
LB_2239:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2237:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2240
	btr r12,2
	jmp LB_2241
LB_2240:
	bts r12,2
LB_2241:
LB_2242:
	cmp r15,0
	jz LB_2243
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2242
LB_2243:
; _f1868 { %_1761 %_1772 } ⊢ { %_1773 %_1774 } : { %_1773 %_1774 }
 ; {>  %_1761~0':_r64 %_1772~2':(_p1454)◂(_stg) }
; _f1868 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2244
	btr r12,1
	jmp LB_2245
LB_2244:
	bts r12,1
LB_2245:
	call NS_E_1868
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1773 %_1774 }
 ; {>  %_1774~1':_stg %_1773~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2236:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2246
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
	jnc LB_2247
	bt QWORD [rdi],0
	jc LB_2248
	btr r12,3
	clc
	jmp LB_2249
LB_2248:
	bts r12,3
	stc
LB_2249:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2247:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2250
	btr r12,2
	jmp LB_2251
LB_2250:
	bts r12,2
LB_2251:
LB_2252:
	cmp r15,0
	jz LB_2253
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2252
LB_2253:
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
LB_2254:
	cmp rax,0
	jz LB_2255
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2254
LB_2255:
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
; ∎ { %_1776 %_1777 }
 ; {>  %_1776~0':_r64 %_1777~1':_stg %_1775~2':(_p1439)◂((_p1446)◂(_stg)) }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2256
	mov rdi,r8
	call dlt
LB_2256:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2246:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2257
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂{  }
; 1' ⊢ °3◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2258
	bt QWORD [rdi],0
	jc LB_2259
	btr r12,2
	clc
	jmp LB_2260
LB_2259:
	bts r12,2
	stc
LB_2260:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2258:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2261:
	cmp r15,0
	jz LB_2262
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2261
LB_2262:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2263:
	cmp rax,0
	jz LB_2264
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2263
LB_2264:
; "\226\136\142|\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_7c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; ∎ { %_1778 %_1779 }
 ; {>  %_1779~1':_stg %_1778~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2257:
NS_E_2583:
; 	|» { 0' 1' }
NS_E_RDI_2583:
MTC_LB_2584:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2585
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
	jnc LB_2586
	bt QWORD [rdi],0
	jc LB_2587
	btr r12,6
	clc
	jmp LB_2588
LB_2587:
	bts r12,6
	stc
LB_2588:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2586:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2601
	btr r12,7
	clc
	jmp LB_2602
LB_2601:
	bts r12,7
	stc
LB_2602:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2591
	btr r12,5
	clc
	jmp LB_2592
LB_2591:
	bts r12,5
	stc
LB_2592:
	mov r8,r11
	bt r12,5
	jc LB_2589
	btr r12,2
	jmp LB_2590
LB_2589:
	bts r12,2
LB_2590:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2595
	btr r12,5
	clc
	jmp LB_2596
LB_2595:
	bts r12,5
	stc
LB_2596:
	mov r9,r11
	bt r12,5
	jc LB_2593
	btr r12,3
	jmp LB_2594
LB_2593:
	bts r12,3
LB_2594:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_2599
	btr r12,5
	clc
	jmp LB_2600
LB_2599:
	bts r12,5
	stc
LB_2600:
	mov r10,r11
	bt r12,5
	jc LB_2597
	btr r12,4
	jmp LB_2598
LB_2597:
	bts r12,4
LB_2598:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2605
	btr r12,7
	clc
	jmp LB_2606
LB_2605:
	bts r12,7
	stc
LB_2606:
	mov r11,rdx
	bt r12,7
	jc LB_2603
	btr r12,5
	jmp LB_2604
LB_2603:
	bts r12,5
LB_2604:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2607:
	cmp r15,0
	jz LB_2608
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2607
LB_2608:
; _f1601 %_2566 ⊢ %_2569 : %_2569
 ; {>  %_2567~4':(_p1452)◂(_stg) %_2568~5':(_lst)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) %_2563~0':_r64 %_2566~3':(_p1439)◂((_p1447)◂(_stg)) %_2565~2':_stg }
; _f1601 3' ⊢ 1'
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
	jc LB_2617
	btr r12,0
	jmp LB_2618
LB_2617:
	bts r12,0
LB_2618:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2619
	btr r12,1
	jmp LB_2620
LB_2619:
	bts r12,1
LB_2620:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2615
	btr r12,5
	clc
	jmp LB_2616
LB_2615:
	bts r12,5
	stc
LB_2616:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2613
	btr r12,4
	clc
	jmp LB_2614
LB_2613:
	bts r12,4
	stc
LB_2614:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2611
	btr r12,2
	clc
	jmp LB_2612
LB_2611:
	bts r12,2
	stc
LB_2612:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2609
	btr r12,0
	clc
	jmp LB_2610
LB_2609:
	bts r12,0
	stc
LB_2610:
	add rsp,40
; _f2583 { %_2563 %_2568 } ⊢ { %_2570 %_2571 } : { %_2570 %_2571 }
 ; {>  %_2567~4':(_p1452)◂(_stg) %_2568~5':(_lst)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) %_2563~0':_r64 %_2569~1':_stg %_2565~2':_stg }
; _f2583 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2627
	btr r12,1
	jmp LB_2628
LB_2627:
	bts r12,1
LB_2628:
	call NS_E_2583
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2629
	btr r12,3
	jmp LB_2630
LB_2629:
	bts r12,3
LB_2630:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2625
	btr r12,4
	clc
	jmp LB_2626
LB_2625:
	bts r12,4
	stc
LB_2626:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2623
	btr r12,2
	clc
	jmp LB_2624
LB_2623:
	bts r12,2
	stc
LB_2624:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2621
	btr r12,1
	clc
	jmp LB_2622
LB_2621:
	bts r12,1
	stc
LB_2622:
	add rsp,32
; _f56 %_2570 ⊢ %_2572 : %_2572
 ; {>  %_2567~4':(_p1452)◂(_stg) %_2570~0':_r64 %_2571~3':_stg %_2569~1':_stg %_2565~2':_stg }
	add r13,1
; _f1780 { %_2572 %_2567 } ⊢ { %_2573 %_2574 } : { %_2573 %_2574 }
 ; {>  %_2572~0':_r64 %_2567~4':(_p1452)◂(_stg) %_2571~3':_stg %_2569~1':_stg %_2565~2':_stg }
; _f1780 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2637
	btr r12,1
	jmp LB_2638
LB_2637:
	bts r12,1
LB_2638:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2639
	btr r12,4
	jmp LB_2640
LB_2639:
	bts r12,4
LB_2640:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2635
	btr r12,3
	clc
	jmp LB_2636
LB_2635:
	bts r12,3
	stc
LB_2636:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2633
	btr r12,2
	clc
	jmp LB_2634
LB_2633:
	bts r12,2
	stc
LB_2634:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2631
	btr r12,1
	clc
	jmp LB_2632
LB_2631:
	bts r12,1
	stc
LB_2632:
	add rsp,32
; _f55 %_2573 ⊢ %_2575 : %_2575
 ; {>  %_2574~4':_stg %_2573~0':_r64 %_2571~3':_stg %_2569~1':_stg %_2565~2':_stg }
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
LB_2641:
	cmp rax,0
	jz LB_2642
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2641
LB_2642:
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
; ∎ { %_2576 %_2581 }
 ; {>  %_2577~2':_stg %_2580~3':_stg %_2581~5':_stg %_2576~0':_r64 %_2578~1':_stg %_2579~4':_stg }
; 	∎ { 0' 5' }
	bt r12,2
	jc LB_2643
	mov rdi,r8
	call dlt
LB_2643:
	bt r12,3
	jc LB_2644
	mov rdi,r9
	call dlt
LB_2644:
	bt r12,1
	jc LB_2645
	mov rdi,r14
	call dlt
LB_2645:
	bt r12,4
	jc LB_2646
	mov rdi,r10
	call dlt
LB_2646:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2647
	btr r12,1
	jmp LB_2648
LB_2647:
	bts r12,1
LB_2648:
	ret
MTC_LB_2585:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2649
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
	jnc LB_2650
	bt QWORD [rdi],0
	jc LB_2651
	btr r12,2
	clc
	jmp LB_2652
LB_2651:
	bts r12,2
	stc
LB_2652:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2650:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2653:
	cmp r15,0
	jz LB_2654
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2653
LB_2654:
; 	» "" _ ⊢ 1' : %_2582
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2563 %_2582 }
 ; {>  %_2582~1':_stg %_2563~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2649:
NS_E_2562:
; 	|» { 0' 1' }
NS_E_RDI_2562:
MTC_LB_2655:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2656
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
	jnc LB_2657
	bt QWORD [rdi],0
	jc LB_2658
	btr r12,4
	clc
	jmp LB_2659
LB_2658:
	bts r12,4
	stc
LB_2659:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2657:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2662
	btr r12,5
	clc
	jmp LB_2663
LB_2662:
	bts r12,5
	stc
LB_2663:
	mov r8,r11
	bt r12,5
	jc LB_2660
	btr r12,2
	jmp LB_2661
LB_2660:
	bts r12,2
LB_2661:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2666
	btr r12,5
	clc
	jmp LB_2667
LB_2666:
	bts r12,5
	stc
LB_2667:
	mov r9,r11
	bt r12,5
	jc LB_2664
	btr r12,3
	jmp LB_2665
LB_2664:
	bts r12,3
LB_2665:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2668:
	cmp r15,0
	jz LB_2669
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2668
LB_2669:
; _f1601 %_2541 ⊢ %_2543 : %_2543
 ; {>  %_2539~0':_r64 %_2542~3':(_p1452)◂(_stg) %_2541~2':(_p1439)◂((_p1447)◂(_stg)) }
; _f1601 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2674
	btr r12,0
	jmp LB_2675
LB_2674:
	bts r12,0
LB_2675:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2676
	btr r12,1
	jmp LB_2677
LB_2676:
	bts r12,1
LB_2677:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2672
	btr r12,3
	clc
	jmp LB_2673
LB_2672:
	bts r12,3
	stc
LB_2673:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2670
	btr r12,0
	clc
	jmp LB_2671
LB_2670:
	bts r12,0
	stc
LB_2671:
	add rsp,24
; _f56 %_2539 ⊢ %_2544 : %_2544
 ; {>  %_2539~0':_r64 %_2542~3':(_p1452)◂(_stg) %_2543~1':_stg }
	add r13,1
; _f1780 { %_2544 %_2542 } ⊢ { %_2545 %_2546 } : { %_2545 %_2546 }
 ; {>  %_2544~0':_r64 %_2542~3':(_p1452)◂(_stg) %_2543~1':_stg }
; _f1780 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2680
	btr r12,1
	jmp LB_2681
LB_2680:
	bts r12,1
LB_2681:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2682
	btr r12,2
	jmp LB_2683
LB_2682:
	bts r12,2
LB_2683:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2678
	btr r12,1
	clc
	jmp LB_2679
LB_2678:
	bts r12,1
	stc
LB_2679:
	add rsp,16
; _f55 %_2545 ⊢ %_2547 : %_2547
 ; {>  %_2545~0':_r64 %_2546~2':_stg %_2543~1':_stg }
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
; ∎ { %_2547 %_2550 }
 ; {>  %_2547~0':_r64 %_2550~3':_stg %_2549~2':_stg %_2548~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2684
	mov rdi,r8
	call dlt
LB_2684:
	bt r12,1
	jc LB_2685
	mov rdi,r14
	call dlt
LB_2685:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2686
	btr r12,1
	jmp LB_2687
LB_2686:
	bts r12,1
LB_2687:
	ret
MTC_LB_2656:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2688
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
	jnc LB_2689
	bt QWORD [rdi],0
	jc LB_2690
	btr r12,3
	clc
	jmp LB_2691
LB_2690:
	bts r12,3
	stc
LB_2691:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2689:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2692
	btr r12,2
	jmp LB_2693
LB_2692:
	bts r12,2
LB_2693:
LB_2694:
	cmp r15,0
	jz LB_2695
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2694
LB_2695:
; _f1541 %_2551 ⊢ %_2552 : %_2552
 ; {>  %_2551~2':_p1442 %_2539~0':_r64 }
; _f1541 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2698
	btr r12,0
	jmp LB_2699
LB_2698:
	bts r12,0
LB_2699:
	call NS_E_1541
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2700
	btr r12,1
	jmp LB_2701
LB_2700:
	bts r12,1
LB_2701:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2696
	btr r12,0
	clc
	jmp LB_2697
LB_2696:
	bts r12,0
	stc
LB_2697:
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
; ∎ { %_2539 %_2554 }
 ; {>  %_2553~1':_stg %_2539~0':_r64 %_2554~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2702
	mov rdi,r14
	call dlt
LB_2702:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2703
	btr r12,1
	jmp LB_2704
LB_2703:
	bts r12,1
LB_2704:
	ret
MTC_LB_2688:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2705
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
	jnc LB_2706
	bt QWORD [rdi],0
	jc LB_2707
	btr r12,3
	clc
	jmp LB_2708
LB_2707:
	bts r12,3
	stc
LB_2708:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2706:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2709
	btr r12,2
	jmp LB_2710
LB_2709:
	bts r12,2
LB_2710:
LB_2711:
	cmp r15,0
	jz LB_2712
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2711
LB_2712:
; _f56 %_2539 ⊢ %_2556 : %_2556
 ; {>  %_2539~0':_r64 %_2555~2':(_p1452)◂(_stg) }
	add r13,1
; _f1780 { %_2556 %_2555 } ⊢ { %_2557 %_2558 } : { %_2557 %_2558 }
 ; {>  %_2556~0':_r64 %_2555~2':(_p1452)◂(_stg) }
; _f1780 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2713
	btr r12,1
	jmp LB_2714
LB_2713:
	bts r12,1
LB_2714:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2557 ⊢ %_2559 : %_2559
 ; {>  %_2558~1':_stg %_2557~0':_r64 }
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
; ∎ { %_2559 %_2561 }
 ; {>  %_2561~2':_stg %_2560~1':_stg %_2559~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2715
	mov rdi,r14
	call dlt
LB_2715:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2716
	btr r12,1
	jmp LB_2717
LB_2716:
	bts r12,1
LB_2717:
	ret
MTC_LB_2705:
NS_E_2538:
; 	|» 0'
NS_E_RDI_2538:
MTC_LB_2718:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2719
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
	jnc LB_2720
	bt QWORD [rdi],0
	jc LB_2721
	btr r12,3
	clc
	jmp LB_2722
LB_2721:
	bts r12,3
	stc
LB_2722:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2720:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2725
	btr r12,4
	clc
	jmp LB_2726
LB_2725:
	bts r12,4
	stc
LB_2726:
	mov r14,r10
	bt r12,4
	jc LB_2723
	btr r12,1
	jmp LB_2724
LB_2723:
	bts r12,1
LB_2724:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2729
	btr r12,4
	clc
	jmp LB_2730
LB_2729:
	bts r12,4
	stc
LB_2730:
	mov r8,r10
	bt r12,4
	jc LB_2727
	btr r12,2
	jmp LB_2728
LB_2727:
	bts r12,2
LB_2728:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2731:
	cmp r15,0
	jz LB_2732
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2731
LB_2732:
; _f2528 %_2530 ⊢ %_2532 : %_2532
 ; {>  %_2531~2':(_lst)◂(_p1497) %_2530~1':_p1497 }
; _f2528 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2735
	btr r12,0
	jmp LB_2736
LB_2735:
	bts r12,0
LB_2736:
	call NS_E_2528
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2733
	btr r12,2
	clc
	jmp LB_2734
LB_2733:
	bts r12,2
	stc
LB_2734:
	add rsp,16
; _f2538 %_2531 ⊢ %_2533 : %_2533
 ; {>  %_2531~2':(_lst)◂(_p1497) %_2532~0':_stg }
; _f2538 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2739
	btr r12,0
	jmp LB_2740
LB_2739:
	bts r12,0
LB_2740:
	call NS_E_2538
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2741
	btr r12,1
	jmp LB_2742
LB_2741:
	bts r12,1
LB_2742:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2737
	btr r12,0
	clc
	jmp LB_2738
LB_2737:
	bts r12,0
	stc
LB_2738:
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
; ∎ %_2536
 ; {>  %_2536~2':_stg %_2535~1':_stg %_2534~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_2743
	mov rdi,r14
	call dlt
LB_2743:
	bt r12,0
	jc LB_2744
	mov rdi,r13
	call dlt
LB_2744:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2745
	btr r12,0
	jmp LB_2746
LB_2745:
	bts r12,0
LB_2746:
	ret
MTC_LB_2719:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2747
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
	jnc LB_2748
	bt QWORD [rdi],0
	jc LB_2749
	btr r12,1
	clc
	jmp LB_2750
LB_2749:
	bts r12,1
	stc
LB_2750:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2748:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2751:
	cmp r15,0
	jz LB_2752
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2751
LB_2752:
; 	» "" _ ⊢ 0' : %_2537
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2537
 ; {>  %_2537~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2747:
NS_E_2528:
; 	|» 0'
NS_E_RDI_2528:
MTC_LB_2753:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2754
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
	jnc LB_2755
	bt QWORD [rdi],0
	jc LB_2756
	btr r12,2
	clc
	jmp LB_2757
LB_2756:
	bts r12,2
	stc
LB_2757:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2755:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2758
	btr r12,1
	jmp LB_2759
LB_2758:
	bts r12,1
LB_2759:
LB_2760:
	cmp r15,0
	jz LB_2761
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2760
LB_2761:
; _f2538 %_2505 ⊢ %_2506 : %_2506
 ; {>  %_2505~1':(_lst)◂(_p1497) }
; _f2538 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2762
	btr r12,0
	jmp LB_2763
LB_2762:
	bts r12,0
LB_2763:
	call NS_E_2538
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
; ∎ %_2508
 ; {>  %_2507~0':_stg %_2508~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2764
	mov rdi,r13
	call dlt
LB_2764:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2765
	btr r12,0
	jmp LB_2766
LB_2765:
	bts r12,0
LB_2766:
	ret
MTC_LB_2754:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2767
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
	jnc LB_2768
	bt QWORD [rdi],0
	jc LB_2769
	btr r12,3
	clc
	jmp LB_2770
LB_2769:
	bts r12,3
	stc
LB_2770:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2768:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2773
	btr r12,4
	clc
	jmp LB_2774
LB_2773:
	bts r12,4
	stc
LB_2774:
	mov r14,r10
	bt r12,4
	jc LB_2771
	btr r12,1
	jmp LB_2772
LB_2771:
	bts r12,1
LB_2772:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2777
	btr r12,4
	clc
	jmp LB_2778
LB_2777:
	bts r12,4
	stc
LB_2778:
	mov r8,r10
	bt r12,4
	jc LB_2775
	btr r12,2
	jmp LB_2776
LB_2775:
	bts r12,2
LB_2776:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2779:
	cmp r15,0
	jz LB_2780
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2779
LB_2780:
; _f2528 %_2509 ⊢ %_2511 : %_2511
 ; {>  %_2509~1':_p1497 %_2510~2':_p1497 }
; _f2528 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2783
	btr r12,0
	jmp LB_2784
LB_2783:
	bts r12,0
LB_2784:
	call NS_E_2528
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2781
	btr r12,2
	clc
	jmp LB_2782
LB_2781:
	bts r12,2
	stc
LB_2782:
	add rsp,16
; _f2528 %_2510 ⊢ %_2512 : %_2512
 ; {>  %_2511~0':_stg %_2510~2':_p1497 }
; _f2528 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2787
	btr r12,0
	jmp LB_2788
LB_2787:
	bts r12,0
LB_2788:
	call NS_E_2528
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2789
	btr r12,1
	jmp LB_2790
LB_2789:
	bts r12,1
LB_2790:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2785
	btr r12,0
	clc
	jmp LB_2786
LB_2785:
	bts r12,0
	stc
LB_2786:
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
; ∎ %_2515
 ; {>  %_2515~2':_stg %_2513~0':_stg %_2514~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2791
	mov rdi,r13
	call dlt
LB_2791:
	bt r12,1
	jc LB_2792
	mov rdi,r14
	call dlt
LB_2792:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2793
	btr r12,0
	jmp LB_2794
LB_2793:
	bts r12,0
LB_2794:
	ret
MTC_LB_2767:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2795
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
	jnc LB_2796
	bt QWORD [rdi],0
	jc LB_2797
	btr r12,3
	clc
	jmp LB_2798
LB_2797:
	bts r12,3
	stc
LB_2798:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2796:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2801
	btr r12,4
	clc
	jmp LB_2802
LB_2801:
	bts r12,4
	stc
LB_2802:
	mov r14,r10
	bt r12,4
	jc LB_2799
	btr r12,1
	jmp LB_2800
LB_2799:
	bts r12,1
LB_2800:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2805
	btr r12,4
	clc
	jmp LB_2806
LB_2805:
	bts r12,4
	stc
LB_2806:
	mov r8,r10
	bt r12,4
	jc LB_2803
	btr r12,2
	jmp LB_2804
LB_2803:
	bts r12,2
LB_2804:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2807:
	cmp r15,0
	jz LB_2808
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2807
LB_2808:
; _f2528 %_2516 ⊢ %_2518 : %_2518
 ; {>  %_2517~2':_p1497 %_2516~1':_p1497 }
; _f2528 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2811
	btr r12,0
	jmp LB_2812
LB_2811:
	bts r12,0
LB_2812:
	call NS_E_2528
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2809
	btr r12,2
	clc
	jmp LB_2810
LB_2809:
	bts r12,2
	stc
LB_2810:
	add rsp,16
; _f2528 %_2517 ⊢ %_2519 : %_2519
 ; {>  %_2517~2':_p1497 %_2518~0':_stg }
; _f2528 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2815
	btr r12,0
	jmp LB_2816
LB_2815:
	bts r12,0
LB_2816:
	call NS_E_2528
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2817
	btr r12,1
	jmp LB_2818
LB_2817:
	bts r12,1
LB_2818:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2813
	btr r12,0
	clc
	jmp LB_2814
LB_2813:
	bts r12,0
	stc
LB_2814:
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
; ∎ %_2522
 ; {>  %_2520~0':_stg %_2521~1':_stg %_2522~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2819
	mov rdi,r13
	call dlt
LB_2819:
	bt r12,1
	jc LB_2820
	mov rdi,r14
	call dlt
LB_2820:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2821
	btr r12,0
	jmp LB_2822
LB_2821:
	bts r12,0
LB_2822:
	ret
MTC_LB_2795:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2823
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
	jnc LB_2824
	bt QWORD [rdi],0
	jc LB_2825
	btr r12,2
	clc
	jmp LB_2826
LB_2825:
	bts r12,2
	stc
LB_2826:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2824:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2827
	btr r12,1
	jmp LB_2828
LB_2827:
	bts r12,1
LB_2828:
LB_2829:
	cmp r15,0
	jz LB_2830
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2829
LB_2830:
; _f1405 %_2523 ⊢ %_2524 : %_2524
 ; {>  %_2523~1':_p1394 }
; _f1405 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2831
	btr r12,0
	jmp LB_2832
LB_2831:
	bts r12,0
LB_2832:
	call NS_E_1405
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2524
 ; {>  %_2524~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2823:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2833
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
	jnc LB_2834
	bt QWORD [rdi],0
	jc LB_2835
	btr r12,2
	clc
	jmp LB_2836
LB_2835:
	bts r12,2
	stc
LB_2836:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2834:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2837
	btr r12,1
	jmp LB_2838
LB_2837:
	bts r12,1
LB_2838:
LB_2839:
	cmp r15,0
	jz LB_2840
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2839
LB_2840:
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
; ∎ %_2527
 ; {>  %_2526~1':_stg %_2527~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_2841
	mov rdi,r14
	call dlt
LB_2841:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2833:
NS_E_2503:
; 	|» { 0' 1' }
NS_E_RDI_2503:
MTC_LB_2842:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2843
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
	jnc LB_2844
	bt QWORD [rdi],0
	jc LB_2845
	btr r12,5
	clc
	jmp LB_2846
LB_2845:
	bts r12,5
	stc
LB_2846:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2844:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2855
	btr r12,6
	clc
	jmp LB_2856
LB_2855:
	bts r12,6
	stc
LB_2856:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2849
	btr r12,4
	clc
	jmp LB_2850
LB_2849:
	bts r12,4
	stc
LB_2850:
	mov r8,r10
	bt r12,4
	jc LB_2847
	btr r12,2
	jmp LB_2848
LB_2847:
	bts r12,2
LB_2848:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2853
	btr r12,4
	clc
	jmp LB_2854
LB_2853:
	bts r12,4
	stc
LB_2854:
	mov r9,r10
	bt r12,4
	jc LB_2851
	btr r12,3
	jmp LB_2852
LB_2851:
	bts r12,3
LB_2852:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2859
	btr r12,6
	clc
	jmp LB_2860
LB_2859:
	bts r12,6
	stc
LB_2860:
	mov r10,rcx
	bt r12,6
	jc LB_2857
	btr r12,4
	jmp LB_2858
LB_2857:
	bts r12,4
LB_2858:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2861:
	cmp r15,0
	jz LB_2862
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2861
LB_2862:
; _f2503 { %_2489 %_2493 } ⊢ { %_2494 %_2495 } : { %_2494 %_2495 }
 ; {>  %_2492~3':_p1497 %_2489~0':_r64 %_2493~4':(_lst)◂({ _stg _p1497 }) %_2491~2':_stg }
; _f2503 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2867
	btr r12,1
	jmp LB_2868
LB_2867:
	bts r12,1
LB_2868:
	call NS_E_2503
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2865
	btr r12,3
	clc
	jmp LB_2866
LB_2865:
	bts r12,3
	stc
LB_2866:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2863
	btr r12,2
	clc
	jmp LB_2864
LB_2863:
	bts r12,2
	stc
LB_2864:
	add rsp,24
; _f2528 %_2492 ⊢ %_2496 : %_2496
 ; {>  %_2492~3':_p1497 %_2494~0':_r64 %_2495~1':_stg %_2491~2':_stg }
; _f2528 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2875
	btr r12,0
	jmp LB_2876
LB_2875:
	bts r12,0
LB_2876:
	call NS_E_2528
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2877
	btr r12,3
	jmp LB_2878
LB_2877:
	bts r12,3
LB_2878:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2873
	btr r12,2
	clc
	jmp LB_2874
LB_2873:
	bts r12,2
	stc
LB_2874:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2871
	btr r12,1
	clc
	jmp LB_2872
LB_2871:
	bts r12,1
	stc
LB_2872:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2869
	btr r12,0
	clc
	jmp LB_2870
LB_2869:
	bts r12,0
	stc
LB_2870:
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
LB_2879:
	cmp rax,0
	jz LB_2880
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2879
LB_2880:
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
; ∎ { %_2497 %_2501 }
 ; {>  %_2497~0':_r64 %_2500~1':_stg %_2499~3':_stg %_2501~4':_stg %_2498~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2881
	mov rdi,r14
	call dlt
LB_2881:
	bt r12,3
	jc LB_2882
	mov rdi,r9
	call dlt
LB_2882:
	bt r12,2
	jc LB_2883
	mov rdi,r8
	call dlt
LB_2883:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2884
	btr r12,1
	jmp LB_2885
LB_2884:
	bts r12,1
LB_2885:
	ret
MTC_LB_2843:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2886
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
	jnc LB_2887
	bt QWORD [rdi],0
	jc LB_2888
	btr r12,2
	clc
	jmp LB_2889
LB_2888:
	bts r12,2
	stc
LB_2889:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2887:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2890:
	cmp r15,0
	jz LB_2891
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2890
LB_2891:
; 	» "" _ ⊢ 1' : %_2502
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2489 %_2502 }
 ; {>  %_2502~1':_stg %_2489~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2886:
NS_E_2488:
; 	|» { 0' 1' }
NS_E_RDI_2488:
MTC_LB_2892:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2893
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
	jnc LB_2894
	bt QWORD [rdi],0
	jc LB_2895
	btr r12,3
	clc
	jmp LB_2896
LB_2895:
	bts r12,3
	stc
LB_2896:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2894:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2897
	btr r12,2
	jmp LB_2898
LB_2897:
	bts r12,2
LB_2898:
LB_2899:
	cmp r15,0
	jz LB_2900
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2899
LB_2900:
; _f56 %_2475 ⊢ %_2478 : %_2478
 ; {>  %_2475~0':_r64 %_2477~2':(_lst)◂({ _stg _p1497 }) }
	add r13,1
; _f2503 { %_2478 %_2477 } ⊢ { %_2479 %_2480 } : { %_2479 %_2480 }
 ; {>  %_2477~2':(_lst)◂({ _stg _p1497 }) %_2478~0':_r64 }
; _f2503 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2901
	btr r12,1
	jmp LB_2902
LB_2901:
	bts r12,1
LB_2902:
	call NS_E_2503
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2479 ⊢ %_2481 : %_2481
 ; {>  %_2479~0':_r64 %_2480~1':_stg }
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
; ∎ { %_2481 %_2482 }
 ; {>  %_2481~0':_r64 %_2482~1':_stg %_2483~2':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2903
	mov rdi,r8
	call dlt
LB_2903:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2893:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2904
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
	jnc LB_2905
	bt QWORD [rdi],0
	jc LB_2906
	btr r12,3
	clc
	jmp LB_2907
LB_2906:
	bts r12,3
	stc
LB_2907:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2905:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2908
	btr r12,2
	jmp LB_2909
LB_2908:
	bts r12,2
LB_2909:
LB_2910:
	cmp r15,0
	jz LB_2911
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2910
LB_2911:
; _f2528 %_2484 ⊢ %_2485 : %_2485
 ; {>  %_2484~2':_p1497 %_2475~0':_r64 }
; _f2528 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2914
	btr r12,0
	jmp LB_2915
LB_2914:
	bts r12,0
LB_2915:
	call NS_E_2528
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2916
	btr r12,1
	jmp LB_2917
LB_2916:
	bts r12,1
LB_2917:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2912
	btr r12,0
	clc
	jmp LB_2913
LB_2912:
	bts r12,0
	stc
LB_2913:
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
; ∎ { %_2475 %_2487 }
 ; {>  %_2475~0':_r64 %_2486~1':_stg %_2487~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2918
	mov rdi,r14
	call dlt
LB_2918:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2919
	btr r12,1
	jmp LB_2920
LB_2919:
	bts r12,1
LB_2920:
	ret
MTC_LB_2904:
NS_E_2474:
; 	|» 0'
NS_E_RDI_2474:
MTC_LB_2921:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2922
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
	jnc LB_2923
	bt QWORD [rdi],0
	jc LB_2924
	btr r12,3
	clc
	jmp LB_2925
LB_2924:
	bts r12,3
	stc
LB_2925:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2923:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2928
	btr r12,4
	clc
	jmp LB_2929
LB_2928:
	bts r12,4
	stc
LB_2929:
	mov r14,r10
	bt r12,4
	jc LB_2926
	btr r12,1
	jmp LB_2927
LB_2926:
	bts r12,1
LB_2927:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2932
	btr r12,4
	clc
	jmp LB_2933
LB_2932:
	bts r12,4
	stc
LB_2933:
	mov r8,r10
	bt r12,4
	jc LB_2930
	btr r12,2
	jmp LB_2931
LB_2930:
	bts r12,2
LB_2931:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2934:
	cmp r15,0
	jz LB_2935
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2934
LB_2935:
; _f2474 %_2469 ⊢ %_2470 : %_2470
 ; {>  %_2469~2':_p1494 %_2468~1':_p1495 }
; _f2474 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2938
	btr r12,0
	jmp LB_2939
LB_2938:
	bts r12,0
LB_2939:
	call NS_E_2474
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2936
	btr r12,1
	clc
	jmp LB_2937
LB_2936:
	bts r12,1
	stc
LB_2937:
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
; ∎ %_2472
 ; {>  %_2468~1':_p1495 %_2471~0':_stg %_2472~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_2940
	mov rdi,r14
	call dlt
LB_2940:
	bt r12,0
	jc LB_2941
	mov rdi,r13
	call dlt
LB_2941:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2942
	btr r12,0
	jmp LB_2943
LB_2942:
	bts r12,0
LB_2943:
	ret
MTC_LB_2922:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2944
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
	jnc LB_2945
	bt QWORD [rdi],0
	jc LB_2946
	btr r12,1
	clc
	jmp LB_2947
LB_2946:
	bts r12,1
	stc
LB_2947:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2945:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2948:
	cmp r15,0
	jz LB_2949
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2948
LB_2949:
; 	» "" _ ⊢ 0' : %_2473
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2473
 ; {>  %_2473~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2944:
NS_E_2466:
; 	|» { 0' 1' }
NS_E_RDI_2466:
MTC_LB_2950:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2951
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
	jnc LB_2952
	bt QWORD [rdi],0
	jc LB_2953
	btr r12,3
	clc
	jmp LB_2954
LB_2953:
	bts r12,3
	stc
LB_2954:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2952:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2955
	btr r12,2
	jmp LB_2956
LB_2955:
	bts r12,2
LB_2956:
LB_2957:
	cmp r15,0
	jz LB_2958
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2957
LB_2958:
; _f2474 %_2455 ⊢ %_2456 : %_2456
 ; {>  %_2455~2':_p1494 %_2453~0':t1081'(-1) }
; _f2474 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2961
	btr r12,0
	jmp LB_2962
LB_2961:
	bts r12,0
LB_2962:
	call NS_E_2474
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2963
	btr r12,1
	jmp LB_2964
LB_2963:
	bts r12,1
LB_2964:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2959
	btr r12,0
	clc
	jmp LB_2960
LB_2959:
	bts r12,0
	stc
LB_2960:
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
; ∎ { %_2453 %_2458 }
 ; {>  %_2458~2':_stg %_2457~1':_stg %_2453~0':t1081'(-1) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2965
	mov rdi,r14
	call dlt
LB_2965:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2966
	btr r12,1
	jmp LB_2967
LB_2966:
	bts r12,1
LB_2967:
	ret
MTC_LB_2951:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2968
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
	jnc LB_2969
	bt QWORD [rdi],0
	jc LB_2970
	btr r12,4
	clc
	jmp LB_2971
LB_2970:
	bts r12,4
	stc
LB_2971:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2969:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2974
	btr r12,5
	clc
	jmp LB_2975
LB_2974:
	bts r12,5
	stc
LB_2975:
	mov r8,r11
	bt r12,5
	jc LB_2972
	btr r12,2
	jmp LB_2973
LB_2972:
	bts r12,2
LB_2973:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2978
	btr r12,5
	clc
	jmp LB_2979
LB_2978:
	bts r12,5
	stc
LB_2979:
	mov r9,r11
	bt r12,5
	jc LB_2976
	btr r12,3
	jmp LB_2977
LB_2976:
	bts r12,3
LB_2977:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2980:
	cmp r15,0
	jz LB_2981
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2980
LB_2981:
; _f2466 { %_2453 %_2460 } ⊢ { %_2461 %_2462 } : { %_2461 %_2462 }
 ; {>  %_2459~2':_p1495 %_2460~3':_p1493 %_2453~0':t1081'(-1) }
; _f2466 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2984
	btr r12,1
	jmp LB_2985
LB_2984:
	bts r12,1
LB_2985:
	call NS_E_2466
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2982
	btr r12,2
	clc
	jmp LB_2983
LB_2982:
	bts r12,2
	stc
LB_2983:
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
; ∎ { %_2461 %_2464 }
 ; {>  %_2461~0':t1081'(-1) %_2459~2':_p1495 %_2463~1':_stg %_2464~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2986
	mov rdi,r8
	call dlt
LB_2986:
	bt r12,1
	jc LB_2987
	mov rdi,r14
	call dlt
LB_2987:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2988
	btr r12,1
	jmp LB_2989
LB_2988:
	bts r12,1
LB_2989:
	ret
MTC_LB_2968:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2990
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
	jnc LB_2991
	bt QWORD [rdi],0
	jc LB_2992
	btr r12,2
	clc
	jmp LB_2993
LB_2992:
	bts r12,2
	stc
LB_2993:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2991:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2994:
	cmp r15,0
	jz LB_2995
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2994
LB_2995:
; 	» "" _ ⊢ 1' : %_2465
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2453 %_2465 }
 ; {>  %_2453~0':t1081'(-1) %_2465~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2990:
NS_E_2452:
; 	|» { 0' 1' }
NS_E_RDI_2452:
MTC_LB_2996:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2997
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
	jnc LB_2998
	bt QWORD [rdi],0
	jc LB_2999
	btr r12,8
	clc
	jmp LB_3000
LB_2999:
	bts r12,8
	stc
LB_3000:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2998:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_3003
	btr r12,9
	clc
	jmp LB_3004
LB_3003:
	bts r12,9
	stc
LB_3004:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3001
	btr r12,2
	jmp LB_3002
LB_3001:
	bts r12,2
LB_3002:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_3007
	btr r12,9
	clc
	jmp LB_3008
LB_3007:
	bts r12,9
	stc
LB_3008:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3005
	btr r12,3
	jmp LB_3006
LB_3005:
	bts r12,3
LB_3006:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_3011
	btr r12,9
	clc
	jmp LB_3012
LB_3011:
	bts r12,9
	stc
LB_3012:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3009
	btr r12,4
	jmp LB_3010
LB_3009:
	bts r12,4
LB_3010:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_3015
	btr r12,9
	clc
	jmp LB_3016
LB_3015:
	bts r12,9
	stc
LB_3016:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3013
	btr r12,5
	jmp LB_3014
LB_3013:
	bts r12,5
LB_3014:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_3019
	btr r12,9
	clc
	jmp LB_3020
LB_3019:
	bts r12,9
	stc
LB_3020:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3017
	btr r12,6
	jmp LB_3018
LB_3017:
	bts r12,6
LB_3018:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_3023
	btr r12,9
	clc
	jmp LB_3024
LB_3023:
	bts r12,9
	stc
LB_3024:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3021
	btr r12,7
	jmp LB_3022
LB_3021:
	bts r12,7
LB_3022:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3025:
	cmp r15,0
	jz LB_3026
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3025
LB_3026:
; _f1601 %_2420 ⊢ %_2426 : %_2426
 ; {>  %_2424~6':(_opn)◂(_p1491) %_2425~7':_p1491 %_2421~3':(_p1452)◂(_stg) %_2423~5':_p1493 %_2418~0':_r64 %_2420~2':(_p1439)◂((_p1447)◂(_stg)) %_2422~4':_p1492 }
; _f1601 2' ⊢ 1'
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
	jc LB_3039
	btr r12,0
	jmp LB_3040
LB_3039:
	bts r12,0
LB_3040:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3041
	btr r12,1
	jmp LB_3042
LB_3041:
	bts r12,1
LB_3042:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_3037
	btr r12,7
	clc
	jmp LB_3038
LB_3037:
	bts r12,7
	stc
LB_3038:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3035
	btr r12,6
	clc
	jmp LB_3036
LB_3035:
	bts r12,6
	stc
LB_3036:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3033
	btr r12,5
	clc
	jmp LB_3034
LB_3033:
	bts r12,5
	stc
LB_3034:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3031
	btr r12,4
	clc
	jmp LB_3032
LB_3031:
	bts r12,4
	stc
LB_3032:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3029
	btr r12,3
	clc
	jmp LB_3030
LB_3029:
	bts r12,3
	stc
LB_3030:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3027
	btr r12,0
	clc
	jmp LB_3028
LB_3027:
	bts r12,0
	stc
LB_3028:
	add rsp,56
; _f56 %_2418 ⊢ %_2427 : %_2427
 ; {>  %_2424~6':(_opn)◂(_p1491) %_2425~7':_p1491 %_2421~3':(_p1452)◂(_stg) %_2426~1':_stg %_2423~5':_p1493 %_2418~0':_r64 %_2422~4':_p1492 }
	add r13,1
; _f1780 { %_2427 %_2421 } ⊢ { %_2428 %_2429 } : { %_2428 %_2429 }
 ; {>  %_2424~6':(_opn)◂(_p1491) %_2425~7':_p1491 %_2421~3':(_p1452)◂(_stg) %_2426~1':_stg %_2423~5':_p1493 %_2422~4':_p1492 %_2427~0':_r64 }
; _f1780 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_3053
	btr r12,1
	jmp LB_3054
LB_3053:
	bts r12,1
LB_3054:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3055
	btr r12,2
	jmp LB_3056
LB_3055:
	bts r12,2
LB_3056:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_3051
	btr r12,7
	clc
	jmp LB_3052
LB_3051:
	bts r12,7
	stc
LB_3052:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_3049
	btr r12,6
	clc
	jmp LB_3050
LB_3049:
	bts r12,6
	stc
LB_3050:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_3047
	btr r12,5
	clc
	jmp LB_3048
LB_3047:
	bts r12,5
	stc
LB_3048:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3045
	btr r12,4
	clc
	jmp LB_3046
LB_3045:
	bts r12,4
	stc
LB_3046:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3043
	btr r12,1
	clc
	jmp LB_3044
LB_3043:
	bts r12,1
	stc
LB_3044:
	add rsp,48
; _f55 %_2428 ⊢ %_2430 : %_2430
 ; {>  %_2424~6':(_opn)◂(_p1491) %_2425~7':_p1491 %_2426~1':_stg %_2423~5':_p1493 %_2429~2':_stg %_2428~0':_r64 %_2422~4':_p1492 }
	sub r13,1
; _f2452 { %_2430 %_2425 } ⊢ { %_2431 %_2432 } : { %_2431 %_2432 }
 ; {>  %_2424~6':(_opn)◂(_p1491) %_2425~7':_p1491 %_2426~1':_stg %_2423~5':_p1493 %_2429~2':_stg %_2430~0':_r64 %_2422~4':_p1492 }
; _f2452 { 0' 7' } ⊢ { 0' 3' }
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
	jc LB_3067
	btr r12,1
	jmp LB_3068
LB_3067:
	bts r12,1
LB_3068:
	call NS_E_2452
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3069
	btr r12,3
	jmp LB_3070
LB_3069:
	bts r12,3
LB_3070:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3065
	btr r12,6
	clc
	jmp LB_3066
LB_3065:
	bts r12,6
	stc
LB_3066:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3063
	btr r12,5
	clc
	jmp LB_3064
LB_3063:
	bts r12,5
	stc
LB_3064:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3061
	btr r12,4
	clc
	jmp LB_3062
LB_3061:
	bts r12,4
	stc
LB_3062:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3059
	btr r12,2
	clc
	jmp LB_3060
LB_3059:
	bts r12,2
	stc
LB_3060:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3057
	btr r12,1
	clc
	jmp LB_3058
LB_3057:
	bts r12,1
	stc
LB_3058:
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
LB_3071:
	cmp rax,0
	jz LB_3072
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3071
LB_3072:
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
; ∎ { %_2433 %_2437 }
 ; {>  %_2437~7':_stg %_2424~6':(_opn)◂(_p1491) %_2436~3':_stg %_2423~5':_p1493 %_2435~2':_stg %_2433~0':_r64 %_2422~4':_p1492 %_2434~1':_stg }
; 	∎ { 0' 7' }
	bt r12,6
	jc LB_3073
	mov rdi,rcx
	call dlt
LB_3073:
	bt r12,3
	jc LB_3074
	mov rdi,r9
	call dlt
LB_3074:
	bt r12,5
	jc LB_3075
	mov rdi,r11
	call dlt
LB_3075:
	bt r12,2
	jc LB_3076
	mov rdi,r8
	call dlt
LB_3076:
	bt r12,4
	jc LB_3077
	mov rdi,r10
	call dlt
LB_3077:
	bt r12,1
	jc LB_3078
	mov rdi,r14
	call dlt
LB_3078:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_3079
	btr r12,1
	jmp LB_3080
LB_3079:
	bts r12,1
LB_3080:
	ret
MTC_LB_2997:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3081
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
	jnc LB_3082
	bt QWORD [rdi],0
	jc LB_3083
	btr r12,7
	clc
	jmp LB_3084
LB_3083:
	bts r12,7
	stc
LB_3084:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3082:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3087
	btr r12,8
	clc
	jmp LB_3088
LB_3087:
	bts r12,8
	stc
LB_3088:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3085
	btr r12,2
	jmp LB_3086
LB_3085:
	bts r12,2
LB_3086:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3091
	btr r12,8
	clc
	jmp LB_3092
LB_3091:
	bts r12,8
	stc
LB_3092:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3089
	btr r12,3
	jmp LB_3090
LB_3089:
	bts r12,3
LB_3090:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3095
	btr r12,8
	clc
	jmp LB_3096
LB_3095:
	bts r12,8
	stc
LB_3096:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3093
	btr r12,4
	jmp LB_3094
LB_3093:
	bts r12,4
LB_3094:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3099
	btr r12,8
	clc
	jmp LB_3100
LB_3099:
	bts r12,8
	stc
LB_3100:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3097
	btr r12,5
	jmp LB_3098
LB_3097:
	bts r12,5
LB_3098:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3103
	btr r12,8
	clc
	jmp LB_3104
LB_3103:
	bts r12,8
	stc
LB_3104:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3101
	btr r12,6
	jmp LB_3102
LB_3101:
	bts r12,6
LB_3102:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3105:
	cmp r15,0
	jz LB_3106
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3105
LB_3106:
; _f1601 %_2438 ⊢ %_2443 : %_2443
 ; {>  %_2438~2':(_p1439)◂((_p1447)◂(_stg)) %_2418~0':_r64 %_2441~5':_p1493 %_2440~4':_p1492 %_2439~3':(_p1452)◂(_stg) %_2442~6':(_opn)◂(_p1491) }
; _f1601 2' ⊢ 1'
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
	jc LB_3117
	btr r12,0
	jmp LB_3118
LB_3117:
	bts r12,0
LB_3118:
	call NS_E_1601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3119
	btr r12,1
	jmp LB_3120
LB_3119:
	bts r12,1
LB_3120:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3115
	btr r12,6
	clc
	jmp LB_3116
LB_3115:
	bts r12,6
	stc
LB_3116:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3113
	btr r12,5
	clc
	jmp LB_3114
LB_3113:
	bts r12,5
	stc
LB_3114:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3111
	btr r12,4
	clc
	jmp LB_3112
LB_3111:
	bts r12,4
	stc
LB_3112:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3109
	btr r12,3
	clc
	jmp LB_3110
LB_3109:
	bts r12,3
	stc
LB_3110:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3107
	btr r12,0
	clc
	jmp LB_3108
LB_3107:
	bts r12,0
	stc
LB_3108:
	add rsp,48
; _f56 %_2418 ⊢ %_2444 : %_2444
 ; {>  %_2443~1':_stg %_2418~0':_r64 %_2441~5':_p1493 %_2440~4':_p1492 %_2439~3':(_p1452)◂(_stg) %_2442~6':(_opn)◂(_p1491) }
	add r13,1
; _f1780 { %_2444 %_2439 } ⊢ { %_2445 %_2446 } : { %_2445 %_2446 }
 ; {>  %_2444~0':_r64 %_2443~1':_stg %_2441~5':_p1493 %_2440~4':_p1492 %_2439~3':(_p1452)◂(_stg) %_2442~6':(_opn)◂(_p1491) }
; _f1780 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_3129
	btr r12,1
	jmp LB_3130
LB_3129:
	bts r12,1
LB_3130:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3131
	btr r12,2
	jmp LB_3132
LB_3131:
	bts r12,2
LB_3132:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_3127
	btr r12,6
	clc
	jmp LB_3128
LB_3127:
	bts r12,6
	stc
LB_3128:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_3125
	btr r12,5
	clc
	jmp LB_3126
LB_3125:
	bts r12,5
	stc
LB_3126:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3123
	btr r12,4
	clc
	jmp LB_3124
LB_3123:
	bts r12,4
	stc
LB_3124:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3121
	btr r12,1
	clc
	jmp LB_3122
LB_3121:
	bts r12,1
	stc
LB_3122:
	add rsp,40
; _f55 %_2445 ⊢ %_2447 : %_2447
 ; {>  %_2443~1':_stg %_2446~2':_stg %_2441~5':_p1493 %_2440~4':_p1492 %_2442~6':(_opn)◂(_p1491) %_2445~0':_r64 }
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
LB_3133:
	cmp rax,0
	jz LB_3134
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3133
LB_3134:
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
; ∎ { %_2448 %_2451 }
 ; {>  %_2450~2':_stg %_2451~3':_stg %_2441~5':_p1493 %_2440~4':_p1492 %_2448~0':_r64 %_2442~6':(_opn)◂(_p1491) %_2449~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3135
	mov rdi,r8
	call dlt
LB_3135:
	bt r12,5
	jc LB_3136
	mov rdi,r11
	call dlt
LB_3136:
	bt r12,4
	jc LB_3137
	mov rdi,r10
	call dlt
LB_3137:
	bt r12,6
	jc LB_3138
	mov rdi,rcx
	call dlt
LB_3138:
	bt r12,1
	jc LB_3139
	mov rdi,r14
	call dlt
LB_3139:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3140
	btr r12,1
	jmp LB_3141
LB_3140:
	bts r12,1
LB_3141:
	ret
MTC_LB_3081:
NS_E_2417:
; 	|» { 0' 1' }
NS_E_RDI_2417:
MTC_LB_3142:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3143
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
	jnc LB_3144
	bt QWORD [rdi],0
	jc LB_3145
	btr r12,7
	clc
	jmp LB_3146
LB_3145:
	bts r12,7
	stc
LB_3146:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3144:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3149
	btr r12,8
	clc
	jmp LB_3150
LB_3149:
	bts r12,8
	stc
LB_3150:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3147
	btr r12,2
	jmp LB_3148
LB_3147:
	bts r12,2
LB_3148:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3153
	btr r12,8
	clc
	jmp LB_3154
LB_3153:
	bts r12,8
	stc
LB_3154:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3151
	btr r12,3
	jmp LB_3152
LB_3151:
	bts r12,3
LB_3152:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3157
	btr r12,8
	clc
	jmp LB_3158
LB_3157:
	bts r12,8
	stc
LB_3158:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3155
	btr r12,4
	jmp LB_3156
LB_3155:
	bts r12,4
LB_3156:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3161
	btr r12,8
	clc
	jmp LB_3162
LB_3161:
	bts r12,8
	stc
LB_3162:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3159
	btr r12,5
	jmp LB_3160
LB_3159:
	bts r12,5
LB_3160:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3165
	btr r12,8
	clc
	jmp LB_3166
LB_3165:
	bts r12,8
	stc
LB_3166:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3163
	btr r12,6
	jmp LB_3164
LB_3163:
	bts r12,6
LB_3164:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3167:
	cmp r15,0
	jz LB_3168
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3167
LB_3168:
; _f2417 { %_2399 %_2405 } ⊢ { %_2406 %_2407 } : { %_2406 %_2407 }
 ; {>  %_2405~6':_p1490 %_2403~4':_p1493 %_2404~5':(_opn)◂(_p1490) %_2402~3':_p1492 %_2399~0':_r64 %_2401~2':(_opn)◂(_stg) }
; _f2417 { 0' 6' } ⊢ { 0' 1' }
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
	jc LB_3177
	btr r12,1
	jmp LB_3178
LB_3177:
	bts r12,1
LB_3178:
	call NS_E_2417
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3175
	btr r12,5
	clc
	jmp LB_3176
LB_3175:
	bts r12,5
	stc
LB_3176:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3173
	btr r12,4
	clc
	jmp LB_3174
LB_3173:
	bts r12,4
	stc
LB_3174:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3171
	btr r12,3
	clc
	jmp LB_3172
LB_3171:
	bts r12,3
	stc
LB_3172:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3169
	btr r12,2
	clc
	jmp LB_3170
LB_3169:
	bts r12,2
	stc
LB_3170:
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
LB_3179:
	cmp rax,0
	jz LB_3180
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3179
LB_3180:
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
; ∎ { %_2408 %_2410 }
 ; {>  %_2410~6':_stg %_2403~4':_p1493 %_2404~5':(_opn)◂(_p1490) %_2402~3':_p1492 %_2408~0':_r64 %_2401~2':(_opn)◂(_stg) %_2409~1':_stg }
; 	∎ { 0' 6' }
	bt r12,4
	jc LB_3181
	mov rdi,r10
	call dlt
LB_3181:
	bt r12,5
	jc LB_3182
	mov rdi,r11
	call dlt
LB_3182:
	bt r12,3
	jc LB_3183
	mov rdi,r9
	call dlt
LB_3183:
	bt r12,2
	jc LB_3184
	mov rdi,r8
	call dlt
LB_3184:
	bt r12,1
	jc LB_3185
	mov rdi,r14
	call dlt
LB_3185:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_3186
	btr r12,1
	jmp LB_3187
LB_3186:
	bts r12,1
LB_3187:
	ret
MTC_LB_3143:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3188
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
	jnc LB_3189
	bt QWORD [rdi],0
	jc LB_3190
	btr r12,6
	clc
	jmp LB_3191
LB_3190:
	bts r12,6
	stc
LB_3191:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3189:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_3194
	btr r12,7
	clc
	jmp LB_3195
LB_3194:
	bts r12,7
	stc
LB_3195:
	mov r8,rdx
	bt r12,7
	jc LB_3192
	btr r12,2
	jmp LB_3193
LB_3192:
	bts r12,2
LB_3193:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_3198
	btr r12,7
	clc
	jmp LB_3199
LB_3198:
	bts r12,7
	stc
LB_3199:
	mov r9,rdx
	bt r12,7
	jc LB_3196
	btr r12,3
	jmp LB_3197
LB_3196:
	bts r12,3
LB_3197:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_3202
	btr r12,7
	clc
	jmp LB_3203
LB_3202:
	bts r12,7
	stc
LB_3203:
	mov r10,rdx
	bt r12,7
	jc LB_3200
	btr r12,4
	jmp LB_3201
LB_3200:
	bts r12,4
LB_3201:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_3206
	btr r12,7
	clc
	jmp LB_3207
LB_3206:
	bts r12,7
	stc
LB_3207:
	mov r11,rdx
	bt r12,7
	jc LB_3204
	btr r12,5
	jmp LB_3205
LB_3204:
	bts r12,5
LB_3205:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3208:
	cmp r15,0
	jz LB_3209
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3208
LB_3209:
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
LB_3210:
	cmp rax,0
	jz LB_3211
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3210
LB_3211:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_2415 %_2416 }
 ; {>  %_2414~5':(_opn)◂(_p1490) %_2415~0':_r64 %_2413~4':_p1493 %_2412~3':_p1492 %_2411~2':(_opn)◂(_stg) %_2416~1':_stg }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_3212
	mov rdi,r11
	call dlt
LB_3212:
	bt r12,4
	jc LB_3213
	mov rdi,r10
	call dlt
LB_3213:
	bt r12,3
	jc LB_3214
	mov rdi,r9
	call dlt
LB_3214:
	bt r12,2
	jc LB_3215
	mov rdi,r8
	call dlt
LB_3215:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3188:
NS_E_2398:
; 	|» { 0' 1' }
NS_E_RDI_2398:
MTC_LB_3216:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3217
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
	jnc LB_3218
	bt QWORD [rdi],0
	jc LB_3219
	btr r12,3
	clc
	jmp LB_3220
LB_3219:
	bts r12,3
	stc
LB_3220:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3218:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3221
	btr r12,2
	jmp LB_3222
LB_3221:
	bts r12,2
LB_3222:
LB_3223:
	cmp r15,0
	jz LB_3224
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3223
LB_3224:
; _f2417 { %_2390 %_2392 } ⊢ { %_2393 %_2394 } : { %_2393 %_2394 }
 ; {>  %_2390~0':_r64 %_2392~2':_p1490 }
; _f2417 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3225
	btr r12,1
	jmp LB_3226
LB_3225:
	bts r12,1
LB_3226:
	call NS_E_2417
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2393 %_2394 }
 ; {>  %_2394~1':_stg %_2393~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3217:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3227
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
	jnc LB_3228
	bt QWORD [rdi],0
	jc LB_3229
	btr r12,3
	clc
	jmp LB_3230
LB_3229:
	bts r12,3
	stc
LB_3230:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3228:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3231
	btr r12,2
	jmp LB_3232
LB_3231:
	bts r12,2
LB_3232:
LB_3233:
	cmp r15,0
	jz LB_3234
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3233
LB_3234:
; _f2452 { %_2390 %_2395 } ⊢ { %_2396 %_2397 } : { %_2396 %_2397 }
 ; {>  %_2390~0':_r64 %_2395~2':_p1491 }
; _f2452 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3235
	btr r12,1
	jmp LB_3236
LB_3235:
	bts r12,1
LB_3236:
	call NS_E_2452
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2396 %_2397 }
 ; {>  %_2396~0':_r64 %_2397~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3227:
NS_E_2389:
; 	|» { 0' 1' }
NS_E_RDI_2389:
MTC_LB_3237:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3238
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
	jnc LB_3239
	bt QWORD [rdi],0
	jc LB_3240
	btr r12,5
	clc
	jmp LB_3241
LB_3240:
	bts r12,5
	stc
LB_3241:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3239:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3250
	btr r12,6
	clc
	jmp LB_3251
LB_3250:
	bts r12,6
	stc
LB_3251:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3244
	btr r12,4
	clc
	jmp LB_3245
LB_3244:
	bts r12,4
	stc
LB_3245:
	mov r8,r10
	bt r12,4
	jc LB_3242
	btr r12,2
	jmp LB_3243
LB_3242:
	bts r12,2
LB_3243:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3248
	btr r12,4
	clc
	jmp LB_3249
LB_3248:
	bts r12,4
	stc
LB_3249:
	mov r9,r10
	bt r12,4
	jc LB_3246
	btr r12,3
	jmp LB_3247
LB_3246:
	bts r12,3
LB_3247:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3254
	btr r12,6
	clc
	jmp LB_3255
LB_3254:
	bts r12,6
	stc
LB_3255:
	mov r10,rcx
	bt r12,6
	jc LB_3252
	btr r12,4
	jmp LB_3253
LB_3252:
	bts r12,4
LB_3253:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3256:
	cmp r15,0
	jz LB_3257
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3256
LB_3257:
; _f56 %_2372 ⊢ %_2377 : %_2377
 ; {>  %_2372~0':_r64 %_2375~3':_p1489 %_2376~4':(_lst)◂({ _stg _p1489 }) %_2374~2':_stg }
	add r13,1
; _f2398 { %_2377 %_2375 } ⊢ { %_2378 %_2379 } : { %_2378 %_2379 }
 ; {>  %_2377~0':_r64 %_2375~3':_p1489 %_2376~4':(_lst)◂({ _stg _p1489 }) %_2374~2':_stg }
; _f2398 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3262
	btr r12,1
	jmp LB_3263
LB_3262:
	bts r12,1
LB_3263:
	call NS_E_2398
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3260
	btr r12,4
	clc
	jmp LB_3261
LB_3260:
	bts r12,4
	stc
LB_3261:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3258
	btr r12,2
	clc
	jmp LB_3259
LB_3258:
	bts r12,2
	stc
LB_3259:
	add rsp,24
; _f55 %_2378 ⊢ %_2380 : %_2380
 ; {>  %_2378~0':_r64 %_2379~1':_stg %_2376~4':(_lst)◂({ _stg _p1489 }) %_2374~2':_stg }
	sub r13,1
; _f2389 { %_2380 %_2376 } ⊢ { %_2381 %_2382 } : { %_2381 %_2382 }
 ; {>  %_2379~1':_stg %_2380~0':_r64 %_2376~4':(_lst)◂({ _stg _p1489 }) %_2374~2':_stg }
; _f2389 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3268
	btr r12,1
	jmp LB_3269
LB_3268:
	bts r12,1
LB_3269:
	call NS_E_2389
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3270
	btr r12,3
	jmp LB_3271
LB_3270:
	bts r12,3
LB_3271:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3266
	btr r12,2
	clc
	jmp LB_3267
LB_3266:
	bts r12,2
	stc
LB_3267:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3264
	btr r12,1
	clc
	jmp LB_3265
LB_3264:
	bts r12,1
	stc
LB_3265:
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
LB_3272:
	cmp rax,0
	jz LB_3273
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3272
LB_3273:
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
; ∎ { %_2383 %_2387 }
 ; {>  %_2386~3':_stg %_2385~1':_stg %_2383~0':_r64 %_2384~2':_stg %_2387~4':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_3274
	mov rdi,r9
	call dlt
LB_3274:
	bt r12,1
	jc LB_3275
	mov rdi,r14
	call dlt
LB_3275:
	bt r12,2
	jc LB_3276
	mov rdi,r8
	call dlt
LB_3276:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3277
	btr r12,1
	jmp LB_3278
LB_3277:
	bts r12,1
LB_3278:
	ret
MTC_LB_3238:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3279
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
	jnc LB_3280
	bt QWORD [rdi],0
	jc LB_3281
	btr r12,2
	clc
	jmp LB_3282
LB_3281:
	bts r12,2
	stc
LB_3282:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3280:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3283:
	cmp r15,0
	jz LB_3284
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3283
LB_3284:
; 	» "" _ ⊢ 1' : %_2388
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2372 %_2388 }
 ; {>  %_2388~1':_stg %_2372~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3279:
NS_E_2371:
; 	|» { 0' 1' }
NS_E_RDI_2371:
MTC_LB_3285:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3286
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
	jnc LB_3287
	bt QWORD [rdi],0
	jc LB_3288
	btr r12,5
	clc
	jmp LB_3289
LB_3288:
	bts r12,5
	stc
LB_3289:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3287:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3298
	btr r12,6
	clc
	jmp LB_3299
LB_3298:
	bts r12,6
	stc
LB_3299:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3292
	btr r12,4
	clc
	jmp LB_3293
LB_3292:
	bts r12,4
	stc
LB_3293:
	mov r8,r10
	bt r12,4
	jc LB_3290
	btr r12,2
	jmp LB_3291
LB_3290:
	bts r12,2
LB_3291:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3296
	btr r12,4
	clc
	jmp LB_3297
LB_3296:
	bts r12,4
	stc
LB_3297:
	mov r9,r10
	bt r12,4
	jc LB_3294
	btr r12,3
	jmp LB_3295
LB_3294:
	bts r12,3
LB_3295:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3302
	btr r12,6
	clc
	jmp LB_3303
LB_3302:
	bts r12,6
	stc
LB_3303:
	mov r10,rcx
	bt r12,6
	jc LB_3300
	btr r12,4
	jmp LB_3301
LB_3300:
	bts r12,4
LB_3301:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3304:
	cmp r15,0
	jz LB_3305
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3304
LB_3305:
; _f38 %_2347 ⊢ %_2352 : %_2352
 ; {>  %_2350~3':_p1488 %_2347~0':_r64 %_2349~2':_stg %_2351~4':(_lst)◂({ _stg _p1488 }) }
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
	jc LB_3310
	btr r12,4
	clc
	jmp LB_3311
LB_3310:
	bts r12,4
	stc
LB_3311:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3308
	btr r12,3
	clc
	jmp LB_3309
LB_3308:
	bts r12,3
	stc
LB_3309:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3306
	btr r12,2
	clc
	jmp LB_3307
LB_3306:
	bts r12,2
	stc
LB_3307:
	add rsp,32
; _f2371 { %_2352 %_2351 } ⊢ { %_2353 %_2354 } : { %_2353 %_2354 }
 ; {>  %_2350~3':_p1488 %_2349~2':_stg %_2351~4':(_lst)◂({ _stg _p1488 }) %_2352~0':_r64 }
; _f2371 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3316
	btr r12,1
	jmp LB_3317
LB_3316:
	bts r12,1
LB_3317:
	call NS_E_2371
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3314
	btr r12,3
	clc
	jmp LB_3315
LB_3314:
	bts r12,3
	stc
LB_3315:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3312
	btr r12,2
	clc
	jmp LB_3313
LB_3312:
	bts r12,2
	stc
LB_3313:
	add rsp,24
MTC_LB_3318:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3319
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
	jnc LB_3320
	bt QWORD [rdi],0
	jc LB_3321
	btr r12,5
	clc
	jmp LB_3322
LB_3321:
	bts r12,5
	stc
LB_3322:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3320:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_3323
	btr r12,4
	jmp LB_3324
LB_3323:
	bts r12,4
LB_3324:
LB_3325:
	cmp r15,0
	jz LB_3326
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3325
LB_3326:
; _f56 %_2353 ⊢ %_2356 : %_2356
 ; {>  %_2355~4':(_lst)◂({ _stg _p1497 }) %_2353~0':_r64 %_2349~2':_stg %_2354~1':_stg }
	add r13,1
; _f2503 { %_2356 %_2355 } ⊢ { %_2357 %_2358 } : { %_2357 %_2358 }
 ; {>  %_2356~0':_r64 %_2355~4':(_lst)◂({ _stg _p1497 }) %_2349~2':_stg %_2354~1':_stg }
; _f2503 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3331
	btr r12,1
	jmp LB_3332
LB_3331:
	bts r12,1
LB_3332:
	call NS_E_2503
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3333
	btr r12,3
	jmp LB_3334
LB_3333:
	bts r12,3
LB_3334:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3329
	btr r12,2
	clc
	jmp LB_3330
LB_3329:
	bts r12,2
	stc
LB_3330:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3327
	btr r12,1
	clc
	jmp LB_3328
LB_3327:
	bts r12,1
	stc
LB_3328:
	add rsp,24
; _f55 %_2357 ⊢ %_2359 : %_2359
 ; {>  %_2357~0':_r64 %_2358~3':_stg %_2349~2':_stg %_2354~1':_stg }
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
LB_3335:
	cmp rax,0
	jz LB_3336
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3335
LB_3336:
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
; ∎ { %_2360 %_2364 }
 ; {>  %_2364~4':_stg %_2360~0':_r64 %_2361~2':_stg %_2362~3':_stg %_2363~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_3337
	mov rdi,r8
	call dlt
LB_3337:
	bt r12,3
	jc LB_3338
	mov rdi,r9
	call dlt
LB_3338:
	bt r12,1
	jc LB_3339
	mov rdi,r14
	call dlt
LB_3339:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3340
	btr r12,1
	jmp LB_3341
LB_3340:
	bts r12,1
LB_3341:
	ret
MTC_LB_3319:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3342
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
	jnc LB_3343
	bt QWORD [rdi],0
	jc LB_3344
	btr r12,5
	clc
	jmp LB_3345
LB_3344:
	bts r12,5
	stc
LB_3345:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3343:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_3346
	btr r12,4
	jmp LB_3347
LB_3346:
	bts r12,4
LB_3347:
LB_3348:
	cmp r15,0
	jz LB_3349
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3348
LB_3349:
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
LB_3350:
	cmp rax,0
	jz LB_3351
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3350
LB_3351:
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
; ∎ { %_2366 %_2369 }
 ; {>  %_2367~2':_stg %_2365~4':_p1497 %_2366~0':_r64 %_2368~1':_stg %_2369~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3352
	mov rdi,r8
	call dlt
LB_3352:
	bt r12,4
	jc LB_3353
	mov rdi,r10
	call dlt
LB_3353:
	bt r12,1
	jc LB_3354
	mov rdi,r14
	call dlt
LB_3354:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3355
	btr r12,1
	jmp LB_3356
LB_3355:
	bts r12,1
LB_3356:
	ret
MTC_LB_3342:
MTC_LB_3286:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3357
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
	jnc LB_3358
	bt QWORD [rdi],0
	jc LB_3359
	btr r12,2
	clc
	jmp LB_3360
LB_3359:
	bts r12,2
	stc
LB_3360:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3358:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3361:
	cmp r15,0
	jz LB_3362
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3361
LB_3362:
; 	» "" _ ⊢ 1' : %_2370
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2347 %_2370 }
 ; {>  %_2370~1':_stg %_2347~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3357:
NS_E_2346:
; 	|» { 0' 1' }
NS_E_RDI_2346:
MTC_LB_3363:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3364
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
	jnc LB_3365
	bt QWORD [rdi],0
	jc LB_3366
	btr r12,4
	clc
	jmp LB_3367
LB_3366:
	bts r12,4
	stc
LB_3367:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3365:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3370
	btr r12,5
	clc
	jmp LB_3371
LB_3370:
	bts r12,5
	stc
LB_3371:
	mov r8,r11
	bt r12,5
	jc LB_3368
	btr r12,2
	jmp LB_3369
LB_3368:
	bts r12,2
LB_3369:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3374
	btr r12,5
	clc
	jmp LB_3375
LB_3374:
	bts r12,5
	stc
LB_3375:
	mov r9,r11
	bt r12,5
	jc LB_3372
	btr r12,3
	jmp LB_3373
LB_3372:
	bts r12,3
LB_3373:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3376:
	cmp r15,0
	jz LB_3377
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3376
LB_3377:
MTC_LB_3378:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3379
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
	jnc LB_3380
	bt QWORD [rdi],0
	jc LB_3381
	btr r12,4
	clc
	jmp LB_3382
LB_3381:
	bts r12,4
	stc
LB_3382:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3380:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3383
	btr r12,1
	jmp LB_3384
LB_3383:
	bts r12,1
LB_3384:
LB_3385:
	cmp r15,0
	jz LB_3386
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3385
LB_3386:
; _f56 %_2278 ⊢ %_2283 : %_2283
 ; {>  %_2280~2':_stg %_2278~0':_r64 %_2282~1':(_lst)◂(_p1485) }
	add r13,1
; _f2277 { %_2283 %_2282 } ⊢ { %_2284 %_2285 } : { %_2284 %_2285 }
 ; {>  %_2283~0':_r64 %_2280~2':_stg %_2282~1':(_lst)◂(_p1485) }
; _f2277 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2277
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3387
	btr r12,2
	clc
	jmp LB_3388
LB_3387:
	bts r12,2
	stc
LB_3388:
	add rsp,16
; _f55 %_2284 ⊢ %_2286 : %_2286
 ; {>  %_2284~0':_r64 %_2280~2':_stg %_2285~1':_stg }
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
LB_3389:
	cmp rax,0
	jz LB_3390
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3389
LB_3390:
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
LB_3391:
	cmp rax,0
	jz LB_3392
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3391
LB_3392:
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
; ∎ { %_2287 %_2290 }
 ; {>  %_2287~0':_r64 %_2290~3':_stg %_2289~1':_stg %_2288~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3393
	mov rdi,r14
	call dlt
LB_3393:
	bt r12,2
	jc LB_3394
	mov rdi,r8
	call dlt
LB_3394:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3395
	btr r12,1
	jmp LB_3396
LB_3395:
	bts r12,1
LB_3396:
	ret
MTC_LB_3379:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3397
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
	jnc LB_3398
	bt QWORD [rdi],0
	jc LB_3399
	btr r12,4
	clc
	jmp LB_3400
LB_3399:
	bts r12,4
	stc
LB_3400:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3398:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3401
	btr r12,1
	jmp LB_3402
LB_3401:
	bts r12,1
LB_3402:
LB_3403:
	cmp r15,0
	jz LB_3404
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3403
LB_3404:
; _f1405 %_2291 ⊢ %_2292 : %_2292
 ; {>  %_2291~1':_p1394 %_2280~2':_stg %_2278~0':_r64 }
; _f1405 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3409
	btr r12,0
	jmp LB_3410
LB_3409:
	bts r12,0
LB_3410:
	call NS_E_1405
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3411
	btr r12,1
	jmp LB_3412
LB_3411:
	bts r12,1
LB_3412:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3407
	btr r12,2
	clc
	jmp LB_3408
LB_3407:
	bts r12,2
	stc
LB_3408:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3405
	btr r12,0
	clc
	jmp LB_3406
LB_3405:
	bts r12,0
	stc
LB_3406:
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
LB_3413:
	cmp rax,0
	jz LB_3414
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3413
LB_3414:
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
; ∎ { %_2293 %_2296 }
 ; {>  %_2295~1':_stg %_2293~0':_r64 %_2296~3':_stg %_2294~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3415
	mov rdi,r14
	call dlt
LB_3415:
	bt r12,2
	jc LB_3416
	mov rdi,r8
	call dlt
LB_3416:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3417
	btr r12,1
	jmp LB_3418
LB_3417:
	bts r12,1
LB_3418:
	ret
MTC_LB_3397:
MTC_LB_3364:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3419
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
	jnc LB_3420
	bt QWORD [rdi],0
	jc LB_3421
	btr r12,3
	clc
	jmp LB_3422
LB_3421:
	bts r12,3
	stc
LB_3422:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3420:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3423
	btr r12,2
	jmp LB_3424
LB_3423:
	bts r12,2
LB_3424:
LB_3425:
	cmp r15,0
	jz LB_3426
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3425
LB_3426:
; _f56 %_2278 ⊢ %_2298 : %_2298
 ; {>  %_2297~2':(_lst)◂({ _stg _p1489 }) %_2278~0':_r64 }
	add r13,1
; _f2389 { %_2298 %_2297 } ⊢ { %_2299 %_2300 } : { %_2299 %_2300 }
 ; {>  %_2297~2':(_lst)◂({ _stg _p1489 }) %_2298~0':_r64 }
; _f2389 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3427
	btr r12,1
	jmp LB_3428
LB_3427:
	bts r12,1
LB_3428:
	call NS_E_2389
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2299 ⊢ %_2301 : %_2301
 ; {>  %_2300~1':_stg %_2299~0':_r64 }
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
LB_3429:
	cmp rax,0
	jz LB_3430
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3429
LB_3430:
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
; ∎ { %_2302 %_2304 }
 ; {>  %_2303~1':_stg %_2304~2':_stg %_2302~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3431
	mov rdi,r14
	call dlt
LB_3431:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3432
	btr r12,1
	jmp LB_3433
LB_3432:
	bts r12,1
LB_3433:
	ret
MTC_LB_3419:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3434
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
	jnc LB_3435
	bt QWORD [rdi],0
	jc LB_3436
	btr r12,4
	clc
	jmp LB_3437
LB_3436:
	bts r12,4
	stc
LB_3437:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3435:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3440
	btr r12,5
	clc
	jmp LB_3441
LB_3440:
	bts r12,5
	stc
LB_3441:
	mov r8,r11
	bt r12,5
	jc LB_3438
	btr r12,2
	jmp LB_3439
LB_3438:
	bts r12,2
LB_3439:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3444
	btr r12,5
	clc
	jmp LB_3445
LB_3444:
	bts r12,5
	stc
LB_3445:
	mov r9,r11
	bt r12,5
	jc LB_3442
	btr r12,3
	jmp LB_3443
LB_3442:
	bts r12,3
LB_3443:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3446:
	cmp r15,0
	jz LB_3447
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3446
LB_3447:
; _f56 %_2278 ⊢ %_2307 : %_2307
 ; {>  %_2306~3':_p1487 %_2305~2':_stg %_2278~0':_r64 }
	add r13,1
; _f2562 { %_2307 %_2306 } ⊢ { %_2308 %_2309 } : { %_2308 %_2309 }
 ; {>  %_2306~3':_p1487 %_2307~0':_r64 %_2305~2':_stg }
; _f2562 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3450
	btr r12,1
	jmp LB_3451
LB_3450:
	bts r12,1
LB_3451:
	call NS_E_2562
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3448
	btr r12,2
	clc
	jmp LB_3449
LB_3448:
	bts r12,2
	stc
LB_3449:
	add rsp,16
; _f55 %_2308 ⊢ %_2310 : %_2310
 ; {>  %_2309~1':_stg %_2308~0':_r64 %_2305~2':_stg }
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
LB_3452:
	cmp rax,0
	jz LB_3453
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3452
LB_3453:
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
; ∎ { %_2311 %_2314 }
 ; {>  %_2313~1':_stg %_2311~0':_r64 %_2312~2':_stg %_2314~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3454
	mov rdi,r14
	call dlt
LB_3454:
	bt r12,2
	jc LB_3455
	mov rdi,r8
	call dlt
LB_3455:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3456
	btr r12,1
	jmp LB_3457
LB_3456:
	bts r12,1
LB_3457:
	ret
MTC_LB_3434:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_3458
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
	jnc LB_3459
	bt QWORD [rdi],0
	jc LB_3460
	btr r12,3
	clc
	jmp LB_3461
LB_3460:
	bts r12,3
	stc
LB_3461:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3459:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3462
	btr r12,2
	jmp LB_3463
LB_3462:
	bts r12,2
LB_3463:
LB_3464:
	cmp r15,0
	jz LB_3465
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3464
LB_3465:
; _f56 %_2278 ⊢ %_2316 : %_2316
 ; {>  %_2278~0':_r64 %_2315~2':(_lst)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) }
	add r13,1
; _f2583 { %_2316 %_2315 } ⊢ { %_2317 %_2318 } : { %_2317 %_2318 }
 ; {>  %_2316~0':_r64 %_2315~2':(_lst)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) }
; _f2583 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3466
	btr r12,1
	jmp LB_3467
LB_3466:
	bts r12,1
LB_3467:
	call NS_E_2583
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2317 ⊢ %_2319 : %_2319
 ; {>  %_2317~0':_r64 %_2318~1':_stg }
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
LB_3468:
	cmp rax,0
	jz LB_3469
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3468
LB_3469:
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
; ∎ { %_2320 %_2322 }
 ; {>  %_2320~0':_r64 %_2322~2':_stg %_2321~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3470
	mov rdi,r14
	call dlt
LB_3470:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3471
	btr r12,1
	jmp LB_3472
LB_3471:
	bts r12,1
LB_3472:
	ret
MTC_LB_3458:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_3473
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
	jnc LB_3474
	bt QWORD [rdi],0
	jc LB_3475
	btr r12,4
	clc
	jmp LB_3476
LB_3475:
	bts r12,4
	stc
LB_3476:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3474:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3479
	btr r12,5
	clc
	jmp LB_3480
LB_3479:
	bts r12,5
	stc
LB_3480:
	mov r8,r11
	bt r12,5
	jc LB_3477
	btr r12,2
	jmp LB_3478
LB_3477:
	bts r12,2
LB_3478:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3483
	btr r12,5
	clc
	jmp LB_3484
LB_3483:
	bts r12,5
	stc
LB_3484:
	mov r9,r11
	bt r12,5
	jc LB_3481
	btr r12,3
	jmp LB_3482
LB_3481:
	bts r12,3
LB_3482:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3485:
	cmp r15,0
	jz LB_3486
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3485
LB_3486:
MTC_LB_3487:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3488
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
	jnc LB_3489
	bt QWORD [rdi],0
	jc LB_3490
	btr r12,4
	clc
	jmp LB_3491
LB_3490:
	bts r12,4
	stc
LB_3491:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3489:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3492
	btr r12,1
	jmp LB_3493
LB_3492:
	bts r12,1
LB_3493:
LB_3494:
	cmp r15,0
	jz LB_3495
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3494
LB_3495:
; _f56 %_2278 ⊢ %_2326 : %_2326
 ; {>  %_2325~1':(_lst)◂({ _stg _p1497 }) %_2278~0':_r64 %_2323~2':_stg }
	add r13,1
; _f2503 { %_2326 %_2325 } ⊢ { %_2327 %_2328 } : { %_2327 %_2328 }
 ; {>  %_2325~1':(_lst)◂({ _stg _p1497 }) %_2326~0':_r64 %_2323~2':_stg }
; _f2503 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2503
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3496
	btr r12,2
	clc
	jmp LB_3497
LB_3496:
	bts r12,2
	stc
LB_3497:
	add rsp,16
; _f55 %_2327 ⊢ %_2329 : %_2329
 ; {>  %_2327~0':_r64 %_2328~1':_stg %_2323~2':_stg }
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
LB_3498:
	cmp rax,0
	jz LB_3499
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3498
LB_3499:
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
; ∎ { %_2330 %_2333 }
 ; {>  %_2333~3':_stg %_2330~0':_r64 %_2332~1':_stg %_2331~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3500
	mov rdi,r14
	call dlt
LB_3500:
	bt r12,2
	jc LB_3501
	mov rdi,r8
	call dlt
LB_3501:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3502
	btr r12,1
	jmp LB_3503
LB_3502:
	bts r12,1
LB_3503:
	ret
MTC_LB_3488:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3504
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
	jnc LB_3505
	bt QWORD [rdi],0
	jc LB_3506
	btr r12,4
	clc
	jmp LB_3507
LB_3506:
	bts r12,4
	stc
LB_3507:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3505:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3508
	btr r12,1
	jmp LB_3509
LB_3508:
	bts r12,1
LB_3509:
LB_3510:
	cmp r15,0
	jz LB_3511
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3510
LB_3511:
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
LB_3512:
	cmp rax,0
	jz LB_3513
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3512
LB_3513:
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
; ∎ { %_2335 %_2337 }
 ; {>  %_2337~3':_stg %_2334~1':_p1497 %_2336~2':_stg %_2335~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3514
	mov rdi,r14
	call dlt
LB_3514:
	bt r12,2
	jc LB_3515
	mov rdi,r8
	call dlt
LB_3515:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3516
	btr r12,1
	jmp LB_3517
LB_3516:
	bts r12,1
LB_3517:
	ret
MTC_LB_3504:
MTC_LB_3473:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_3518
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
	jnc LB_3519
	bt QWORD [rdi],0
	jc LB_3520
	btr r12,3
	clc
	jmp LB_3521
LB_3520:
	bts r12,3
	stc
LB_3521:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3519:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3522
	btr r12,2
	jmp LB_3523
LB_3522:
	bts r12,2
LB_3523:
LB_3524:
	cmp r15,0
	jz LB_3525
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3524
LB_3525:
; _f56 %_2278 ⊢ %_2339 : %_2339
 ; {>  %_2338~2':(_lst)◂({ _stg _p1488 }) %_2278~0':_r64 }
	add r13,1
; _f2371 { %_2339 %_2338 } ⊢ { %_2340 %_2341 } : { %_2340 %_2341 }
 ; {>  %_2338~2':(_lst)◂({ _stg _p1488 }) %_2339~0':_r64 }
; _f2371 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3526
	btr r12,1
	jmp LB_3527
LB_3526:
	bts r12,1
LB_3527:
	call NS_E_2371
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2340 ⊢ %_2342 : %_2342
 ; {>  %_2341~1':_stg %_2340~0':_r64 }
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
LB_3528:
	cmp rax,0
	jz LB_3529
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3528
LB_3529:
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
; ∎ { %_2343 %_2345 }
 ; {>  %_2345~2':_stg %_2344~1':_stg %_2343~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3530
	mov rdi,r14
	call dlt
LB_3530:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3531
	btr r12,1
	jmp LB_3532
LB_3531:
	bts r12,1
LB_3532:
	ret
MTC_LB_3518:
NS_E_2277:
; 	|» { 0' 1' }
NS_E_RDI_2277:
MTC_LB_3533:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3534
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
	jnc LB_3535
	bt QWORD [rdi],0
	jc LB_3536
	btr r12,2
	clc
	jmp LB_3537
LB_3536:
	bts r12,2
	stc
LB_3537:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3535:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3538:
	cmp r15,0
	jz LB_3539
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3538
LB_3539:
; 	» "" _ ⊢ 1' : %_2267
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2265 %_2267 }
 ; {>  %_2265~0':_r64 %_2267~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3534:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3540
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
	jnc LB_3541
	bt QWORD [rdi],0
	jc LB_3542
	btr r12,4
	clc
	jmp LB_3543
LB_3542:
	bts r12,4
	stc
LB_3543:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3541:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3546
	btr r12,5
	clc
	jmp LB_3547
LB_3546:
	bts r12,5
	stc
LB_3547:
	mov r8,r11
	bt r12,5
	jc LB_3544
	btr r12,2
	jmp LB_3545
LB_3544:
	bts r12,2
LB_3545:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3550
	btr r12,5
	clc
	jmp LB_3551
LB_3550:
	bts r12,5
	stc
LB_3551:
	mov r9,r11
	bt r12,5
	jc LB_3548
	btr r12,3
	jmp LB_3549
LB_3548:
	bts r12,3
LB_3549:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3552:
	cmp r15,0
	jz LB_3553
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3552
LB_3553:
; _f2346 { %_2265 %_2268 } ⊢ { %_2270 %_2271 } : { %_2270 %_2271 }
 ; {>  %_2265~0':_r64 %_2268~2':_p1485 %_2269~3':(_lst)◂(_p1485) }
; _f2346 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3556
	btr r12,1
	jmp LB_3557
LB_3556:
	bts r12,1
LB_3557:
	call NS_E_2346
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_3554
	btr r12,3
	clc
	jmp LB_3555
LB_3554:
	bts r12,3
	stc
LB_3555:
	add rsp,16
; _f2277 { %_2270 %_2269 } ⊢ { %_2272 %_2273 } : { %_2272 %_2273 }
 ; {>  %_2271~1':_stg %_2269~3':(_lst)◂(_p1485) %_2270~0':_r64 }
; _f2277 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3560
	btr r12,1
	jmp LB_3561
LB_3560:
	bts r12,1
LB_3561:
	call NS_E_2277
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3562
	btr r12,2
	jmp LB_3563
LB_3562:
	bts r12,2
LB_3563:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3558
	btr r12,1
	clc
	jmp LB_3559
LB_3558:
	bts r12,1
	stc
LB_3559:
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
; ∎ { %_2272 %_2276 }
 ; {>  %_2274~1':_stg %_2276~3':_stg %_2272~0':_r64 %_2275~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3564
	mov rdi,r14
	call dlt
LB_3564:
	bt r12,2
	jc LB_3565
	mov rdi,r8
	call dlt
LB_3565:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3566
	btr r12,1
	jmp LB_3567
LB_3566:
	bts r12,1
LB_3567:
	ret
MTC_LB_3540:
NS_E_3571:
NS_E_RDI_3571:
NS_E_3571_ETR_TBL:
NS_E_3571_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3675
	jmp LB_3676
LB_3675:
	jmp LB_3667
LB_3676:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3668
	btr r12,0
	clc
	jmp LB_3669
LB_3668:
	bts r12,0
	stc
LB_3669:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3664
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr1 |~ {  } ⊢ %_3575 : %_3575
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_3575
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_3575 ⊢ %_3576 : %_3576
 ; {>  %_3575~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3576
 ; {>  %_3576~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3662
	btr r12,3
	jmp LB_3663
LB_3662:
	bts r12,3
LB_3663:
	mov r8,0
	bts r12,2
	ret
LB_3664:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3666
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3665
LB_3666:
	add rsp,8
	ret
LB_3667:
	add rsp,16
	pop r14
LB_3665:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3691
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3683
LB_3691:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_3571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3696
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3697
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3697:
	jmp LB_3683
LB_3696:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3686
	btr r12,1
	clc
	jmp LB_3687
LB_3686:
	bts r12,1
	stc
LB_3687:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3684
	btr r12,0
	clc
	jmp LB_3685
LB_3684:
	bts r12,0
	stc
LB_3685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3680
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_3578 ⊢ %_3579 : %_3579
 ; {>  %_3578~1':_r64 %_3577~0':_r64 }
	add r14,1
; _some %_3579 ⊢ %_3580 : %_3580
 ; {>  %_3579~1':_r64 %_3577~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_3580
 ; {>  %_3580~°0◂1':(_opn)◂(_r64) %_3577~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_3677
	mov rdi,r13
	call dlt
LB_3677:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_3678
	btr r12,3
	jmp LB_3679
LB_3678:
	bts r12,3
LB_3679:
	mov r8,0
	bts r12,2
	ret
LB_3680:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3682
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3681
LB_3682:
	add rsp,8
	ret
LB_3683:
	add rsp,32
	pop r14
LB_3681:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3572:
NS_E_RDI_3572:
NS_E_3572_ETR_TBL:
NS_E_3572_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_3714
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_3714
	jmp LB_3715
LB_3714:
	jmp LB_3704
LB_3715:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3719
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3720
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3720:
	jmp LB_3704
LB_3719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3707
	btr r12,1
	clc
	jmp LB_3708
LB_3707:
	bts r12,1
	stc
LB_3708:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3705
	btr r12,0
	clc
	jmp LB_3706
LB_3705:
	bts r12,0
	stc
LB_3706:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3701
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_3722
	btr r12,5
	jmp LB_3723
LB_3722:
	bts r12,5
LB_3723:
	mov r13,r14
	bt r12,1
	jc LB_3724
	btr r12,0
	jmp LB_3725
LB_3724:
	bts r12,0
LB_3725:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_3581 ⊢ %_3582 : %_3582
 ; {>  %_3581~0':_r64 }
	add r13,1
; _some %_3582 ⊢ %_3583 : %_3583
 ; {>  %_3582~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3583
 ; {>  %_3583~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3699
	btr r12,3
	jmp LB_3700
LB_3699:
	bts r12,3
LB_3700:
	mov r8,0
	bts r12,2
	ret
LB_3701:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3703
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3702
LB_3703:
	add rsp,8
	ret
LB_3704:
	add rsp,32
	pop r14
LB_3702:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_3741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_3741
	jmp LB_3742
LB_3741:
	jmp LB_3731
LB_3742:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3746
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3747:
	jmp LB_3731
LB_3746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3734
	btr r12,1
	clc
	jmp LB_3735
LB_3734:
	bts r12,1
	stc
LB_3735:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3732
	btr r12,0
	clc
	jmp LB_3733
LB_3732:
	bts r12,0
	stc
LB_3733:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3728
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_3749
	btr r12,5
	jmp LB_3750
LB_3749:
	bts r12,5
LB_3750:
	mov r13,r14
	bt r12,1
	jc LB_3751
	btr r12,0
	jmp LB_3752
LB_3751:
	bts r12,0
LB_3752:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_3584 ⊢ %_3585 : %_3585
 ; {>  %_3584~0':_r64 }
	add r13,1
; _some %_3585 ⊢ %_3586 : %_3586
 ; {>  %_3585~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3586
 ; {>  %_3586~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3726
	btr r12,3
	jmp LB_3727
LB_3726:
	bts r12,3
LB_3727:
	mov r8,0
	bts r12,2
	ret
LB_3728:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3730
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3729
LB_3730:
	add rsp,8
	ret
LB_3731:
	add rsp,32
	pop r14
LB_3729:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_3755
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_3587 : %_3587
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_3587
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_3587 ⊢ %_3588 : %_3588
 ; {>  %_3587~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3588
 ; {>  %_3588~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3753
	btr r12,3
	jmp LB_3754
LB_3753:
	bts r12,3
LB_3754:
	mov r8,0
	bts r12,2
	ret
LB_3755:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3757
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3756
LB_3757:
	add rsp,8
	ret
LB_3758:
	add rsp,0
	pop r14
LB_3756:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3573:
NS_E_RDI_3573:
NS_E_3573_ETR_TBL:
NS_E_3573_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3838
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3785
LB_3838:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_3846
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_3846
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_3846
	jmp LB_3847
LB_3846:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3844
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3844:
	jmp LB_3785
LB_3847:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3802
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3803
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3803:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3804
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3804:
	jmp LB_3786
LB_3802:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3814
	jmp LB_3815
LB_3814:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3810
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3810:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3811
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3811:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3812
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3812:
	jmp LB_3786
LB_3815:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_3574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3819
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3820
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3820:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3821
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3821:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3822
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3822:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3823
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3823:
	jmp LB_3786
LB_3819:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_3573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3828
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_3829
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_3829:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3830
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3830:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3831
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3831:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3832
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3832:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3833
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3833:
	jmp LB_3786
LB_3828:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_3797
	btr r12,5
	clc
	jmp LB_3798
LB_3797:
	bts r12,5
	stc
LB_3798:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3795
	btr r12,4
	clc
	jmp LB_3796
LB_3795:
	bts r12,4
	stc
LB_3796:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3793
	btr r12,3
	clc
	jmp LB_3794
LB_3793:
	bts r12,3
	stc
LB_3794:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3791
	btr r12,2
	clc
	jmp LB_3792
LB_3791:
	bts r12,2
	stc
LB_3792:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3789
	btr r12,1
	clc
	jmp LB_3790
LB_3789:
	bts r12,1
	stc
LB_3790:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3787
	btr r12,0
	clc
	jmp LB_3788
LB_3787:
	bts r12,0
	stc
LB_3788:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_3782
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_3848
	btr r12,6
	jmp LB_3849
LB_3848:
	bts r12,6
LB_3849:
	mov r8,r10
	bt r12,4
	jc LB_3850
	btr r12,2
	jmp LB_3851
LB_3850:
	bts r12,2
LB_3851:
	mov rdx,r14
	bt r12,1
	jc LB_3852
	btr r12,7
	jmp LB_3853
LB_3852:
	bts r12,7
LB_3853:
	mov r14,rcx
	bt r12,6
	jc LB_3854
	btr r12,1
	jmp LB_3855
LB_3854:
	bts r12,1
LB_3855:
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
	jc LB_3858
	btr r12,6
	clc
	jmp LB_3859
LB_3858:
	bts r12,6
	stc
LB_3859:
	mov r9,rcx
	bt r12,6
	jc LB_3856
	btr r12,3
	jmp LB_3857
LB_3856:
	bts r12,3
LB_3857:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3862
	btr r12,6
	clc
	jmp LB_3863
LB_3862:
	bts r12,6
	stc
LB_3863:
	mov r10,rcx
	bt r12,6
	jc LB_3860
	btr r12,4
	jmp LB_3861
LB_3860:
	bts r12,4
LB_3861:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3594 : %_3594
 ; {>  %_3592~3':_r64 %_3590~1':_r64 %_3593~4':(_lst)◂(_p3568) %_3591~2':_r64 %_3589~0':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_3594
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_3594 %_3589 } ⊢ { %_3595 %_3596 } : { %_3595 %_3596 }
 ; {>  %_3592~3':_r64 %_3590~1':_r64 %_3593~4':(_lst)◂(_p3568) %_3594~5':_r64 %_3591~2':_r64 %_3589~0':_r64 }
	add r11,r13
; _f51 { %_3595 %_3590 } ⊢ { %_3597 %_3598 } : { %_3597 %_3598 }
 ; {>  %_3596~0':_r64 %_3592~3':_r64 %_3590~1':_r64 %_3595~5':_r64 %_3593~4':(_lst)◂(_p3568) %_3591~2':_r64 }
	add r11,r14
; _f51 { %_3597 %_3591 } ⊢ { %_3599 %_3600 } : { %_3599 %_3600 }
 ; {>  %_3596~0':_r64 %_3598~1':_r64 %_3597~5':_r64 %_3592~3':_r64 %_3593~4':(_lst)◂(_p3568) %_3591~2':_r64 }
	add r11,r8
; _f3569 %_3599 ⊢ %_3601 : %_3601
 ; {>  %_3596~0':_r64 %_3598~1':_r64 %_3592~3':_r64 %_3593~4':(_lst)◂(_p3568) %_3599~5':_r64 %_3600~2':_r64 }
; _f3569 5' ⊢ °0◂5'
; _cns { %_3601 %_3593 } ⊢ %_3602 : %_3602
 ; {>  %_3596~0':_r64 %_3598~1':_r64 %_3592~3':_r64 %_3593~4':(_lst)◂(_p3568) %_3601~°0◂5':_p3568 %_3600~2':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_3592 %_3602 } ⊢ %_3603 : %_3603
 ; {>  %_3596~0':_r64 %_3598~1':_r64 %_3592~3':_r64 %_3602~°0◂{ °0◂5' 4' }:(_lst)◂(_p3568) %_3600~2':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_3603
 ; {>  %_3603~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p3568) }) %_3596~0':_r64 %_3598~1':_r64 %_3600~2':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,0
	jc LB_3759
	mov rdi,r13
	call dlt
LB_3759:
	bt r12,1
	jc LB_3760
	mov rdi,r14
	call dlt
LB_3760:
	bt r12,2
	jc LB_3761
	mov rdi,r8
	call dlt
LB_3761:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3762
	btr r12,0
	jmp LB_3763
LB_3762:
	bts r12,0
LB_3763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_3766
	btr r12,1
	jmp LB_3767
LB_3766:
	bts r12,1
LB_3767:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3764
	btr QWORD [rdi],0
	jmp LB_3765
LB_3764:
	bts QWORD [rdi],0
LB_3765:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_3776
	btr r12,0
	jmp LB_3777
LB_3776:
	bts r12,0
LB_3777:
	mov rsi,1
	bt r12,0
	jc LB_3774
	mov rsi,0
	bt r13,0
	jc LB_3774
	jmp LB_3775
LB_3774:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3775:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_3772
	btr QWORD [rdi],0
	jmp LB_3773
LB_3772:
	bts QWORD [rdi],0
LB_3773:
	mov r13,r10
	bt r12,4
	jc LB_3780
	btr r12,0
	jmp LB_3781
LB_3780:
	bts r12,0
LB_3781:
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_3778
	btr QWORD [rdi],1
	jmp LB_3779
LB_3778:
	bts QWORD [rdi],1
LB_3779:
	mov rsi,1
	bt r12,1
	jc LB_3770
	mov rsi,0
	bt r14,0
	jc LB_3770
	jmp LB_3771
LB_3770:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3771:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3768
	btr QWORD [rdi],1
	jmp LB_3769
LB_3768:
	bts QWORD [rdi],1
LB_3769:
	mov r8,0
	bts r12,2
	ret
LB_3782:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3784
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3783
LB_3784:
	add rsp,8
	ret
LB_3786:
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
LB_3785:
	add rsp,96
	pop r14
LB_3783:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3917
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3889
LB_3917:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_3925
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_3925
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_3925
	jmp LB_3926
LB_3925:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3923
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3923:
	jmp LB_3889
LB_3926:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_3571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3902
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3903
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3903:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3904
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3904:
	jmp LB_3890
LB_3902:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_3573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3909
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3910
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3910:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3911
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3911:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3912
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3912:
	jmp LB_3890
LB_3909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3897
	btr r12,3
	clc
	jmp LB_3898
LB_3897:
	bts r12,3
	stc
LB_3898:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3895
	btr r12,2
	clc
	jmp LB_3896
LB_3895:
	bts r12,2
	stc
LB_3896:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3893
	btr r12,1
	clc
	jmp LB_3894
LB_3893:
	bts r12,1
	stc
LB_3894:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3891
	btr r12,0
	clc
	jmp LB_3892
LB_3891:
	bts r12,0
	stc
LB_3892:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_3886
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_3927
	btr r12,4
	jmp LB_3928
LB_3927:
	bts r12,4
LB_3928:
	mov r14,r8
	bt r12,2
	jc LB_3929
	btr r12,1
	jmp LB_3930
LB_3929:
	bts r12,1
LB_3930:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_3931
	btr r12,4
	jmp LB_3932
LB_3931:
	bts r12,4
LB_3932:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3935
	btr r12,5
	clc
	jmp LB_3936
LB_3935:
	bts r12,5
	stc
LB_3936:
	mov r8,r11
	bt r12,5
	jc LB_3933
	btr r12,2
	jmp LB_3934
LB_3933:
	bts r12,2
LB_3934:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3939
	btr r12,5
	clc
	jmp LB_3940
LB_3939:
	bts r12,5
	stc
LB_3940:
	mov r9,r11
	bt r12,5
	jc LB_3937
	btr r12,3
	jmp LB_3938
LB_3937:
	bts r12,3
LB_3938:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_3608 : %_3608
 ; {>  %_3605~1':_r64 %_3606~2':_r64 %_3604~0':_r64 %_3607~3':(_lst)◂(_p3568) }
; 	» 0xr2 _ ⊢ 4' : %_3608
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_3608 %_3604 } ⊢ { %_3609 %_3610 } : { %_3609 %_3610 }
 ; {>  %_3605~1':_r64 %_3606~2':_r64 %_3608~4':_r64 %_3604~0':_r64 %_3607~3':(_lst)◂(_p3568) }
	add r10,r13
; _f51 { %_3609 %_3605 } ⊢ { %_3611 %_3612 } : { %_3611 %_3612 }
 ; {>  %_3605~1':_r64 %_3610~0':_r64 %_3606~2':_r64 %_3609~4':_r64 %_3607~3':(_lst)◂(_p3568) }
	add r10,r14
; _f3569 %_3611 ⊢ %_3613 : %_3613
 ; {>  %_3611~4':_r64 %_3610~0':_r64 %_3612~1':_r64 %_3606~2':_r64 %_3607~3':(_lst)◂(_p3568) }
; _f3569 4' ⊢ °0◂4'
; _cns { %_3613 %_3607 } ⊢ %_3614 : %_3614
 ; {>  %_3610~0':_r64 %_3613~°0◂4':_p3568 %_3612~1':_r64 %_3606~2':_r64 %_3607~3':(_lst)◂(_p3568) }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_3606 %_3614 } ⊢ %_3615 : %_3615
 ; {>  %_3614~°0◂{ °0◂4' 3' }:(_lst)◂(_p3568) %_3610~0':_r64 %_3612~1':_r64 %_3606~2':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_3615
 ; {>  %_3610~0':_r64 %_3612~1':_r64 %_3615~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p3568) }) }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_3864
	mov rdi,r13
	call dlt
LB_3864:
	bt r12,1
	jc LB_3865
	mov rdi,r14
	call dlt
LB_3865:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3866
	btr r12,0
	jmp LB_3867
LB_3866:
	bts r12,0
LB_3867:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_3870
	btr r12,1
	jmp LB_3871
LB_3870:
	bts r12,1
LB_3871:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3868
	btr QWORD [rdi],0
	jmp LB_3869
LB_3868:
	bts QWORD [rdi],0
LB_3869:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_3880
	btr r12,2
	jmp LB_3881
LB_3880:
	bts r12,2
LB_3881:
	mov rsi,1
	bt r12,2
	jc LB_3878
	mov rsi,0
	bt r8,0
	jc LB_3878
	jmp LB_3879
LB_3878:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_3879:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_3876
	btr QWORD [rdi],0
	jmp LB_3877
LB_3876:
	bts QWORD [rdi],0
LB_3877:
	mov r8,r13
	bt r12,0
	jc LB_3884
	btr r12,2
	jmp LB_3885
LB_3884:
	bts r12,2
LB_3885:
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_3882
	btr QWORD [rdi],1
	jmp LB_3883
LB_3882:
	bts QWORD [rdi],1
LB_3883:
	mov rsi,1
	bt r12,1
	jc LB_3874
	mov rsi,0
	bt r14,0
	jc LB_3874
	jmp LB_3875
LB_3874:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3875:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3872
	btr QWORD [rdi],1
	jmp LB_3873
LB_3872:
	bts QWORD [rdi],1
LB_3873:
	mov r8,0
	bts r12,2
	ret
LB_3886:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3888
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3887
LB_3888:
	add rsp,8
	ret
LB_3890:
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
LB_3889:
	add rsp,64
	pop r14
LB_3887:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_3571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4012
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4004
LB_4012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_3573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4017
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4018:
	jmp LB_4004
LB_4017:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4007
	btr r12,1
	clc
	jmp LB_4008
LB_4007:
	bts r12,1
	stc
LB_4008:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4005
	btr r12,0
	clc
	jmp LB_4006
LB_4005:
	bts r12,0
	stc
LB_4006:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4001
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov rcx,r8
	bt r12,2
	jc LB_4020
	btr r12,6
	jmp LB_4021
LB_4020:
	bts r12,6
LB_4021:
	mov r11,r14
	bt r12,1
	jc LB_4022
	btr r12,5
	jmp LB_4023
LB_4022:
	bts r12,5
LB_4023:
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_4026
	btr r12,7
	clc
	jmp LB_4027
LB_4026:
	bts r12,7
	stc
LB_4027:
	mov r14,rdx
	bt r12,7
	jc LB_4024
	btr r12,1
	jmp LB_4025
LB_4024:
	bts r12,1
LB_4025:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_4030
	btr r12,7
	clc
	jmp LB_4031
LB_4030:
	bts r12,7
	stc
LB_4031:
	mov r8,rdx
	bt r12,7
	jc LB_4028
	btr r12,2
	jmp LB_4029
LB_4028:
	bts r12,2
LB_4029:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f51 { %_3617 %_3616 } ⊢ { %_3619 %_3620 } : { %_3619 %_3620 }
 ; {>  %_3618~2':(_lst)◂(_p3568) %_3617~1':_r64 %_3616~0':_r64 }
	add r14,r13
MTC_LB_3941:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3942
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
	jnc LB_3943
	bt QWORD [rdi],0
	jc LB_3944
	btr r12,5
	clc
	jmp LB_3945
LB_3944:
	bts r12,5
	stc
LB_3945:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3943:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3948
	btr r12,6
	clc
	jmp LB_3949
LB_3948:
	bts r12,6
	stc
LB_3949:
	mov r9,rcx
	bt r12,6
	jc LB_3946
	btr r12,3
	jmp LB_3947
LB_3946:
	bts r12,3
LB_3947:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3952
	btr r12,6
	clc
	jmp LB_3953
LB_3952:
	bts r12,6
	stc
LB_3953:
	mov r10,rcx
	bt r12,6
	jc LB_3950
	btr r12,4
	jmp LB_3951
LB_3950:
	bts r12,4
LB_3951:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3942
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
	jnc LB_3954
	bt QWORD [rdi],0
	jc LB_3955
	btr r12,6
	clc
	jmp LB_3956
LB_3955:
	bts r12,6
	stc
LB_3956:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3954:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_3957
	btr r12,5
	jmp LB_3958
LB_3957:
	bts r12,5
LB_3958:
LB_3959:
	cmp r15,0
	jz LB_3960
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3959
LB_3960:
; _f51 { %_3623 %_3620 } ⊢ { %_3624 %_3625 } : { %_3624 %_3625 }
 ; {>  %_3619~1':_r64 %_3623~5':_r64 %_3620~0':_r64 %_3622~4':(_lst)◂(_p3568) }
	add r11,r13
; _f3570 %_3624 ⊢ %_3626 : %_3626
 ; {>  %_3619~1':_r64 %_3622~4':(_lst)◂(_p3568) %_3624~5':_r64 %_3625~0':_r64 }
; _f3570 5' ⊢ °1◂5'
; _cns { %_3626 %_3622 } ⊢ %_3627 : %_3627
 ; {>  %_3619~1':_r64 %_3622~4':(_lst)◂(_p3568) %_3625~0':_r64 %_3626~°1◂5':_p3568 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_3619 %_3627 } ⊢ %_3628 : %_3628
 ; {>  %_3619~1':_r64 %_3627~°0◂{ °1◂5' 4' }:(_lst)◂(_p3568) %_3625~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_3628
 ; {>  %_3628~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p3568) }) %_3625~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_3961
	mov rdi,r13
	call dlt
LB_3961:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_3964
	btr r12,0
	jmp LB_3965
LB_3964:
	bts r12,0
LB_3965:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_3962
	btr QWORD [rdi],0
	jmp LB_3963
LB_3962:
	bts QWORD [rdi],0
LB_3963:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_3974
	btr r12,1
	jmp LB_3975
LB_3974:
	bts r12,1
LB_3975:
	mov rsi,1
	bt r12,1
	jc LB_3972
	mov rsi,0
	bt r14,0
	jc LB_3972
	jmp LB_3973
LB_3972:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3973:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3970
	btr QWORD [rdi],0
	jmp LB_3971
LB_3970:
	bts QWORD [rdi],0
LB_3971:
	mov r14,r10
	bt r12,4
	jc LB_3978
	btr r12,1
	jmp LB_3979
LB_3978:
	bts r12,1
LB_3979:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3976
	btr QWORD [rdi],1
	jmp LB_3977
LB_3976:
	bts QWORD [rdi],1
LB_3977:
	mov rsi,1
	bt r12,0
	jc LB_3968
	mov rsi,0
	bt r13,0
	jc LB_3968
	jmp LB_3969
LB_3968:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3969:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_3966
	btr QWORD [rdi],1
	jmp LB_3967
LB_3966:
	bts QWORD [rdi],1
LB_3967:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3942:
	mov r15,0
LB_3981:
	cmp r15,0
	jz LB_3982
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3981
LB_3982:
; _f3570 %_3620 ⊢ %_3629 : %_3629
 ; {>  %_3619~1':_r64 %_3618~2':(_lst)◂(_p3568) %_3620~0':_r64 }
; _f3570 0' ⊢ °1◂0'
; _cns { %_3629 %_3618 } ⊢ %_3630 : %_3630
 ; {>  %_3619~1':_r64 %_3618~2':(_lst)◂(_p3568) %_3629~°1◂0':_p3568 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_3619 %_3630 } ⊢ %_3631 : %_3631
 ; {>  %_3619~1':_r64 %_3630~°0◂{ °1◂0' 2' }:(_lst)◂(_p3568) }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_3631
 ; {>  %_3631~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p3568) }) }
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
	jc LB_3985
	btr r12,4
	jmp LB_3986
LB_3985:
	bts r12,4
LB_3986:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_3983
	btr QWORD [rdi],0
	jmp LB_3984
LB_3983:
	bts QWORD [rdi],0
LB_3984:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_3995
	btr r12,1
	jmp LB_3996
LB_3995:
	bts r12,1
LB_3996:
	mov rsi,1
	bt r12,1
	jc LB_3993
	mov rsi,0
	bt r14,0
	jc LB_3993
	jmp LB_3994
LB_3993:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3994:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3991
	btr QWORD [rdi],0
	jmp LB_3992
LB_3991:
	bts QWORD [rdi],0
LB_3992:
	mov r14,r8
	bt r12,2
	jc LB_3999
	btr r12,1
	jmp LB_4000
LB_3999:
	bts r12,1
LB_4000:
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3997
	btr QWORD [rdi],1
	jmp LB_3998
LB_3997:
	bts QWORD [rdi],1
LB_3998:
	mov rsi,1
	bt r12,4
	jc LB_3989
	mov rsi,0
	bt r10,0
	jc LB_3989
	jmp LB_3990
LB_3989:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_3990:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_3987
	btr QWORD [rdi],1
	jmp LB_3988
LB_3987:
	bts QWORD [rdi],1
LB_3988:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3980:
LB_4001:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4003
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4002
LB_4003:
	add rsp,8
	ret
LB_4004:
	add rsp,32
	pop r14
LB_4002:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4040
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_3632 : %_3632
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_3633 : %_3633
 ; {>  %_3632~°1◂{  }:(_lst)◂(t1532'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_3633
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_3633 %_3632 } ⊢ %_3634 : %_3634
 ; {>  %_3633~0':_r64 %_3632~°1◂{  }:(_lst)◂(t1532'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_3634
 ; {>  %_3634~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t1536'(0)) }) }
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
	jc LB_4034
	btr r12,1
	jmp LB_4035
LB_4034:
	bts r12,1
LB_4035:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_4032
	btr QWORD [rdi],0
	jmp LB_4033
LB_4032:
	bts QWORD [rdi],0
LB_4033:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_4038
	mov rsi,0
	bt r14,0
	jc LB_4038
	jmp LB_4039
LB_4038:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4039:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_4036
	btr QWORD [rdi],1
	jmp LB_4037
LB_4036:
	bts QWORD [rdi],1
LB_4037:
	mov r8,0
	bts r12,2
	ret
LB_4040:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4042
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4041
LB_4042:
	add rsp,8
	ret
LB_4043:
	add rsp,0
	pop r14
LB_4041:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3574:
NS_E_RDI_3574:
NS_E_3574_ETR_TBL:
NS_E_3574_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4081
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4051
LB_4081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_4089
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4089
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_4089
	jmp LB_4090
LB_4089:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4087
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4087:
	jmp LB_4051
LB_4090:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4064
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4065
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4065:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4066
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4066:
	jmp LB_4052
LB_4064:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4076
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4076
	jmp LB_4077
LB_4076:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4072
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4072:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4073
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4073:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4074
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4074:
	jmp LB_4052
LB_4077:
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
	jc LB_4059
	btr r12,3
	clc
	jmp LB_4060
LB_4059:
	bts r12,3
	stc
LB_4060:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4057
	btr r12,2
	clc
	jmp LB_4058
LB_4057:
	bts r12,2
	stc
LB_4058:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4055
	btr r12,1
	clc
	jmp LB_4056
LB_4055:
	bts r12,1
	stc
LB_4056:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4053
	btr r12,0
	clc
	jmp LB_4054
LB_4053:
	bts r12,0
	stc
LB_4054:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_4048
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_4091
	btr r12,4
	jmp LB_4092
LB_4091:
	bts r12,4
LB_4092:
	mov r14,r8
	bt r12,2
	jc LB_4093
	btr r12,1
	jmp LB_4094
LB_4093:
	bts r12,1
LB_4094:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3637 : %_3637
 ; {>  %_3636~1':_r64 %_3635~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_3637
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_3637 %_3635 } ⊢ { %_3638 %_3639 } : { %_3638 %_3639 }
 ; {>  %_3637~2':_r64 %_3636~1':_r64 %_3635~0':_r64 }
	add r8,r13
; _f51 { %_3638 %_3636 } ⊢ { %_3640 %_3641 } : { %_3640 %_3641 }
 ; {>  %_3636~1':_r64 %_3638~2':_r64 %_3639~0':_r64 }
	add r8,r14
; _some %_3640 ⊢ %_3642 : %_3642
 ; {>  %_3641~1':_r64 %_3640~2':_r64 %_3639~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_3642
 ; {>  %_3641~1':_r64 %_3642~°0◂2':(_opn)◂(_r64) %_3639~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_4044
	mov rdi,r14
	call dlt
LB_4044:
	bt r12,0
	jc LB_4045
	mov rdi,r13
	call dlt
LB_4045:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_4046
	btr r12,3
	jmp LB_4047
LB_4046:
	bts r12,3
LB_4047:
	mov r8,0
	bts r12,2
	ret
LB_4048:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4050
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4049
LB_4050:
	add rsp,8
	ret
LB_4052:
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
LB_4051:
	add rsp,64
	pop r14
LB_4049:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4157
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4104
LB_4157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_4165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4165
	jmp LB_4166
LB_4165:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4163:
	jmp LB_4104
LB_4166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4121
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4122
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4123:
	jmp LB_4105
LB_4121:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4133
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4133
	jmp LB_4134
LB_4133:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4129
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4129:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4130
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4130:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4131
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4131:
	jmp LB_4105
LB_4134:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_3574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4138
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4139
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4139:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4140
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4140:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4141
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4141:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4142
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4142:
	jmp LB_4105
LB_4138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_3574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4147
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_4148
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_4148:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4149
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4149:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4150
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4150:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4151
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4151:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4152
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4152:
	jmp LB_4105
LB_4147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_4116
	btr r12,5
	clc
	jmp LB_4117
LB_4116:
	bts r12,5
	stc
LB_4117:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4114
	btr r12,4
	clc
	jmp LB_4115
LB_4114:
	bts r12,4
	stc
LB_4115:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4112
	btr r12,3
	clc
	jmp LB_4113
LB_4112:
	bts r12,3
	stc
LB_4113:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4110
	btr r12,2
	clc
	jmp LB_4111
LB_4110:
	bts r12,2
	stc
LB_4111:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4108
	btr r12,1
	clc
	jmp LB_4109
LB_4108:
	bts r12,1
	stc
LB_4109:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4106
	btr r12,0
	clc
	jmp LB_4107
LB_4106:
	bts r12,0
	stc
LB_4107:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_4101
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_4167
	btr r12,6
	jmp LB_4168
LB_4167:
	bts r12,6
LB_4168:
	mov r9,r11
	bt r12,5
	jc LB_4169
	btr r12,3
	jmp LB_4170
LB_4169:
	bts r12,3
LB_4170:
	mov r11,r8
	bt r12,2
	jc LB_4171
	btr r12,5
	jmp LB_4172
LB_4171:
	bts r12,5
LB_4172:
	mov r8,r10
	bt r12,4
	jc LB_4173
	btr r12,2
	jmp LB_4174
LB_4173:
	bts r12,2
LB_4174:
	mov r10,r14
	bt r12,1
	jc LB_4175
	btr r12,4
	jmp LB_4176
LB_4175:
	bts r12,4
LB_4176:
	mov r14,r11
	bt r12,5
	jc LB_4177
	btr r12,1
	jmp LB_4178
LB_4177:
	bts r12,1
LB_4178:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3647 : %_3647
 ; {>  %_3643~0':_r64 %_3646~3':_r64 %_3644~1':_r64 %_3645~2':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_3647
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_3647 %_3643 } ⊢ { %_3648 %_3649 } : { %_3648 %_3649 }
 ; {>  %_3643~0':_r64 %_3646~3':_r64 %_3644~1':_r64 %_3647~4':_r64 %_3645~2':_r64 }
	add r10,r13
; _f51 { %_3648 %_3644 } ⊢ { %_3650 %_3651 } : { %_3650 %_3651 }
 ; {>  %_3646~3':_r64 %_3649~0':_r64 %_3644~1':_r64 %_3648~4':_r64 %_3645~2':_r64 }
	add r10,r14
; _f51 { %_3650 %_3645 } ⊢ { %_3652 %_3653 } : { %_3652 %_3653 }
 ; {>  %_3646~3':_r64 %_3649~0':_r64 %_3651~1':_r64 %_3645~2':_r64 %_3650~4':_r64 }
	add r10,r8
; _f51 { %_3652 %_3646 } ⊢ { %_3654 %_3655 } : { %_3654 %_3655 }
 ; {>  %_3646~3':_r64 %_3649~0':_r64 %_3651~1':_r64 %_3653~2':_r64 %_3652~4':_r64 }
	add r10,r9
; _some %_3654 ⊢ %_3656 : %_3656
 ; {>  %_3649~0':_r64 %_3651~1':_r64 %_3654~4':_r64 %_3655~3':_r64 %_3653~2':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_3656
 ; {>  %_3649~0':_r64 %_3651~1':_r64 %_3655~3':_r64 %_3653~2':_r64 %_3656~°0◂4':(_opn)◂(_r64) }
; 	∎ °0◂4'
	bt r12,0
	jc LB_4095
	mov rdi,r13
	call dlt
LB_4095:
	bt r12,1
	jc LB_4096
	mov rdi,r14
	call dlt
LB_4096:
	bt r12,3
	jc LB_4097
	mov rdi,r9
	call dlt
LB_4097:
	bt r12,2
	jc LB_4098
	mov rdi,r8
	call dlt
LB_4098:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_4099
	btr r12,3
	jmp LB_4100
LB_4099:
	bts r12,3
LB_4100:
	mov r8,0
	bts r12,2
	ret
LB_4101:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4103
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4102
LB_4103:
	add rsp,8
	ret
LB_4105:
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
LB_4104:
	add rsp,96
	pop r14
LB_4102:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_3571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4193
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4185
LB_4193:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_3574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4198
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4199:
	jmp LB_4185
LB_4198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4188
	btr r12,1
	clc
	jmp LB_4189
LB_4188:
	bts r12,1
	stc
LB_4189:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4186
	btr r12,0
	clc
	jmp LB_4187
LB_4186:
	bts r12,0
	stc
LB_4187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4182
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f51 { %_3657 %_3658 } ⊢ { %_3659 %_3660 } : { %_3659 %_3660 }
 ; {>  %_3658~1':_r64 %_3657~0':_r64 }
	add r13,r14
; _some %_3659 ⊢ %_3661 : %_3661
 ; {>  %_3659~0':_r64 %_3660~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3661
 ; {>  %_3660~1':_r64 %_3661~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_4179
	mov rdi,r14
	call dlt
LB_4179:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4180
	btr r12,3
	jmp LB_4181
LB_4180:
	bts r12,3
LB_4181:
	mov r8,0
	bts r12,2
	ret
LB_4182:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4184
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4183
LB_4184:
	add rsp,8
	ret
LB_4185:
	add rsp,32
	pop r14
LB_4183:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4223:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_4223:
MTC_LB_4224:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4225
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
	jnc LB_4226
	bt QWORD [rdi],0
	jc LB_4227
	btr r12,7
	clc
	jmp LB_4228
LB_4227:
	bts r12,7
	stc
LB_4228:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4226:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_4231
	btr r12,8
	clc
	jmp LB_4232
LB_4231:
	bts r12,8
	stc
LB_4232:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4229
	btr r12,5
	jmp LB_4230
LB_4229:
	bts r12,5
LB_4230:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_4235
	btr r12,8
	clc
	jmp LB_4236
LB_4235:
	bts r12,8
	stc
LB_4236:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4233
	btr r12,6
	jmp LB_4234
LB_4233:
	bts r12,6
LB_4234:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4237:
	cmp r15,0
	jz LB_4238
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4237
LB_4238:
MTC_LB_4239:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4240
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
	jnc LB_4241
	bt QWORD [rdi],0
	jc LB_4242
	btr r12,7
	clc
	jmp LB_4243
LB_4242:
	bts r12,7
	stc
LB_4243:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4241:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4244
	btr r12,4
	jmp LB_4245
LB_4244:
	bts r12,4
LB_4245:
LB_4246:
	cmp r15,0
	jz LB_4247
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4246
LB_4247:
; _f53 %_4208 ⊢ { %_4209 %_4210 } : { %_4209 %_4210 }
 ; {>  %_4201~0':_stg %_4202~1':_r64 %_4207~6':(_lst)◂(_p3568) %_4204~3':_r64 %_4208~4':_r64 %_4203~2':_stg }
	mov r11,r10
	bts r12,5
; _f35 { %_4210 %_4201 %_4202 %_4203 %_4204 } ⊢ { %_4211 %_4212 %_4213 %_4214 %_4215 } : { %_4211 %_4212 %_4213 %_4214 %_4215 }
 ; {>  %_4201~0':_stg %_4210~5':_r64 %_4209~4':_r64 %_4202~1':_r64 %_4207~6':(_lst)◂(_p3568) %_4204~3':_r64 %_4203~2':_stg }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_4252
	btr r12,4
	jmp LB_4253
LB_4252:
	bts r12,4
LB_4253:
	mov r9,r8
	bt r12,2
	jc LB_4254
	btr r12,3
	jmp LB_4255
LB_4254:
	bts r12,3
LB_4255:
	mov r8,r14
	bt r12,1
	jc LB_4256
	btr r12,2
	jmp LB_4257
LB_4256:
	bts r12,2
LB_4257:
	mov r14,r13
	bt r12,0
	jc LB_4258
	btr r12,1
	jmp LB_4259
LB_4258:
	bts r12,1
LB_4259:
	mov r13,r11
	bt r12,5
	jc LB_4260
	btr r12,0
	jmp LB_4261
LB_4260:
	bts r12,0
LB_4261:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_4262
	btr r12,5
	jmp LB_4263
LB_4262:
	bts r12,5
LB_4263:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_4250
	btr r12,6
	clc
	jmp LB_4251
LB_4250:
	bts r12,6
	stc
LB_4251:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4248
	btr r12,4
	clc
	jmp LB_4249
LB_4248:
	bts r12,4
	stc
LB_4249:
	add rsp,24
; _f4223 { %_4212 %_4213 %_4214 %_4215 %_4207 } ⊢ { %_4216 %_4217 } : { %_4216 %_4217 }
 ; {>  %_4213~2':_r64 %_4212~1':_stg %_4209~4':_r64 %_4214~3':_stg %_4207~6':(_lst)◂(_p3568) %_4215~5':_r64 %_4211~0':_r64 }
; _f4223 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_4268
	btr r12,0
	jmp LB_4269
LB_4268:
	bts r12,0
LB_4269:
	mov r14,r8
	bt r12,2
	jc LB_4270
	btr r12,1
	jmp LB_4271
LB_4270:
	bts r12,1
LB_4271:
	mov r8,r9
	bt r12,3
	jc LB_4272
	btr r12,2
	jmp LB_4273
LB_4272:
	bts r12,2
LB_4273:
	mov r9,r11
	bt r12,5
	jc LB_4274
	btr r12,3
	jmp LB_4275
LB_4274:
	bts r12,3
LB_4275:
	mov r10,rcx
	bt r12,6
	jc LB_4276
	btr r12,4
	jmp LB_4277
LB_4276:
	bts r12,4
LB_4277:
	call NS_E_4223
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4278
	btr r12,2
	jmp LB_4279
LB_4278:
	bts r12,2
LB_4279:
	mov r14,r13
	bt r12,0
	jc LB_4280
	btr r12,1
	jmp LB_4281
LB_4280:
	bts r12,1
LB_4281:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4266
	btr r12,4
	clc
	jmp LB_4267
LB_4266:
	bts r12,4
	stc
LB_4267:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4264
	btr r12,0
	clc
	jmp LB_4265
LB_4264:
	bts r12,0
	stc
LB_4265:
	add rsp,24
; ∎ { %_4216 %_4217 }
 ; {>  %_4216~1':_stg %_4217~2':_stg %_4209~4':_r64 %_4211~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_4282
	mov rdi,r10
	call dlt
LB_4282:
	bt r12,0
	jc LB_4283
	mov rdi,r13
	call dlt
LB_4283:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_4284
	btr r12,0
	jmp LB_4285
LB_4284:
	bts r12,0
LB_4285:
	mov r14,r8
	bt r12,2
	jc LB_4286
	btr r12,1
	jmp LB_4287
LB_4286:
	bts r12,1
LB_4287:
	ret
MTC_LB_4240:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4288
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
	jnc LB_4289
	bt QWORD [rdi],0
	jc LB_4290
	btr r12,7
	clc
	jmp LB_4291
LB_4290:
	bts r12,7
	stc
LB_4291:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4289:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4292
	btr r12,4
	jmp LB_4293
LB_4292:
	bts r12,4
LB_4293:
LB_4294:
	cmp r15,0
	jz LB_4295
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4294
LB_4295:
; _f51 { %_4202 %_4218 } ⊢ { %_4219 %_4220 } : { %_4219 %_4220 }
 ; {>  %_4201~0':_stg %_4202~1':_r64 %_4207~6':(_lst)◂(_p3568) %_4218~4':_r64 %_4204~3':_r64 %_4203~2':_stg }
	add r14,r10
; _f4223 { %_4201 %_4219 %_4203 %_4204 %_4207 } ⊢ { %_4221 %_4222 } : { %_4221 %_4222 }
 ; {>  %_4201~0':_stg %_4220~4':_r64 %_4207~6':(_lst)◂(_p3568) %_4204~3':_r64 %_4219~1':_r64 %_4203~2':_stg }
; _f4223 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_4298
	btr r12,4
	jmp LB_4299
LB_4298:
	bts r12,4
LB_4299:
	call NS_E_4223
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4296
	btr r12,4
	clc
	jmp LB_4297
LB_4296:
	bts r12,4
	stc
LB_4297:
	add rsp,16
; ∎ { %_4221 %_4222 }
 ; {>  %_4221~0':_stg %_4220~4':_r64 %_4222~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_4300
	mov rdi,r10
	call dlt
LB_4300:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4288:
MTC_LB_4225:
	mov r15,0
LB_4302:
	cmp r15,0
	jz LB_4303
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4302
LB_4303:
; ∎ { %_4201 %_4203 }
 ; {>  %_4201~0':_stg %_4202~1':_r64 %_4204~3':_r64 %_4205~4':(_lst)◂(_p3568) %_4203~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4304
	mov rdi,r14
	call dlt
LB_4304:
	bt r12,3
	jc LB_4305
	mov rdi,r9
	call dlt
LB_4305:
	bt r12,4
	jc LB_4306
	mov rdi,r10
	call dlt
LB_4306:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4307
	btr r12,1
	jmp LB_4308
LB_4307:
	bts r12,1
LB_4308:
	ret
MTC_LB_4301:
NS_E_4324:
; 	|» 0'
NS_E_RDI_4324:
; » 0xr0 |~ {  } ⊢ %_4310 : %_4310
 ; {>  %_4309~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_4310
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3573 { %_4309 %_4310 } ⊢ { %_4311 %_4312 %_4313 } : { %_4311 %_4312 %_4313 }
 ; {>  %_4310~1':_r64 %_4309~0':_stg }
; _f3573 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3573
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_4325
	btr r12,4
	jmp LB_4326
LB_4325:
	bts r12,4
LB_4326:
	mov r8,r9
	bt r12,3
	jc LB_4329
	btr r12,2
	jmp LB_4330
LB_4329:
	bts r12,2
LB_4330:
	mov rsi,1
	bt r12,2
	jc LB_4327
	mov rsi,0
	bt r8,0
	jc LB_4327
	jmp LB_4328
LB_4327:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_4328:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_4331:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4332
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
	jnc LB_4333
	bt QWORD [rdi],0
	jc LB_4334
	btr r12,5
	clc
	jmp LB_4335
LB_4334:
	bts r12,5
	stc
LB_4335:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4333:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4338
	btr r12,6
	clc
	jmp LB_4339
LB_4338:
	bts r12,6
	stc
LB_4339:
	mov r9,rcx
	bt r12,6
	jc LB_4336
	btr r12,3
	jmp LB_4337
LB_4336:
	bts r12,3
LB_4337:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4342
	btr r12,6
	clc
	jmp LB_4343
LB_4342:
	bts r12,6
	stc
LB_4343:
	mov r10,rcx
	bt r12,6
	jc LB_4340
	btr r12,4
	jmp LB_4341
LB_4340:
	bts r12,4
LB_4341:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4344:
	cmp r15,0
	jz LB_4345
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4344
LB_4345:
; _f31 %_4314 ⊢ { %_4316 %_4317 } : { %_4316 %_4317 }
 ; {>  %_4315~4':(_lst)◂(_p3568) %_4312~1':_r64 %_4311~0':_stg %_4314~3':_r64 }
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
	jc LB_4352
	btr r12,0
	jmp LB_4353
LB_4352:
	bts r12,0
LB_4353:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_4354
	btr r12,2
	jmp LB_4355
LB_4354:
	bts r12,2
LB_4355:
	mov r9,r14
	bt r12,1
	jc LB_4356
	btr r12,3
	jmp LB_4357
LB_4356:
	bts r12,3
LB_4357:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4350
	btr r12,4
	clc
	jmp LB_4351
LB_4350:
	bts r12,4
	stc
LB_4351:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4348
	btr r12,1
	clc
	jmp LB_4349
LB_4348:
	bts r12,1
	stc
LB_4349:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4346
	btr r12,0
	clc
	jmp LB_4347
LB_4346:
	bts r12,0
	stc
LB_4347:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_4318 : %_4318
 ; {>  %_4315~4':(_lst)◂(_p3568) %_4317~3':_stg %_4312~1':_r64 %_4311~0':_stg %_4316~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_4318
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_4319 : %_4319
 ; {>  %_4315~4':(_lst)◂(_p3568) %_4317~3':_stg %_4312~1':_r64 %_4311~0':_stg %_4316~2':_r64 %_4318~5':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_4319
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f4223 { %_4311 %_4318 %_4317 %_4319 %_4315 } ⊢ { %_4320 %_4321 } : { %_4320 %_4321 }
 ; {>  %_4315~4':(_lst)◂(_p3568) %_4317~3':_stg %_4319~6':_r64 %_4312~1':_r64 %_4311~0':_stg %_4316~2':_r64 %_4318~5':_r64 }
; _f4223 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_4362
	btr r12,1
	jmp LB_4363
LB_4362:
	bts r12,1
LB_4363:
	mov r8,r9
	bt r12,3
	jc LB_4364
	btr r12,2
	jmp LB_4365
LB_4364:
	bts r12,2
LB_4365:
	mov r9,rcx
	bt r12,6
	jc LB_4366
	btr r12,3
	jmp LB_4367
LB_4366:
	bts r12,3
LB_4367:
	call NS_E_4223
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4368
	btr r12,3
	jmp LB_4369
LB_4368:
	bts r12,3
LB_4369:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4360
	btr r12,2
	clc
	jmp LB_4361
LB_4360:
	bts r12,2
	stc
LB_4361:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4358
	btr r12,1
	clc
	jmp LB_4359
LB_4358:
	bts r12,1
	stc
LB_4359:
	add rsp,24
; _some %_4321 ⊢ %_4322 : %_4322
 ; {>  %_4321~3':_stg %_4312~1':_r64 %_4320~0':_stg %_4316~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_4320 %_4322 }
 ; {>  %_4322~°0◂3':(_opn)◂(_stg) %_4312~1':_r64 %_4320~0':_stg %_4316~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_4370
	mov rdi,r14
	call dlt
LB_4370:
	bt r12,2
	jc LB_4371
	mov rdi,r8
	call dlt
LB_4371:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4374
	btr r12,1
	jmp LB_4375
LB_4374:
	bts r12,1
LB_4375:
	mov rsi,1
	bt r12,1
	jc LB_4372
	mov rsi,0
	bt r14,0
	jc LB_4372
	jmp LB_4373
LB_4372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4373:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4332:
	mov r15,0
LB_4377:
	cmp r15,0
	jz LB_4378
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4377
LB_4378:
; _none {  } ⊢ %_4323 : %_4323
 ; {>  %_4313~2':(_opn)◂({ _r64 (_lst)◂(_p3568) }) %_4312~1':_r64 %_4311~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_4311 %_4323 }
 ; {>  %_4313~2':(_opn)◂({ _r64 (_lst)◂(_p3568) }) %_4312~1':_r64 %_4311~0':_stg %_4323~°1◂{  }:(_opn)◂(t1723'(0)) }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_4379
	mov rdi,r8
	call dlt
LB_4379:
	bt r12,1
	jc LB_4380
	mov rdi,r14
	call dlt
LB_4380:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_4381
	mov rsi,0
	bt r14,0
	jc LB_4381
	jmp LB_4382
LB_4381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4382:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4376:
NS_E_4383:
NS_E_RDI_4383:
NS_E_4383_ETR_TBL:
NS_E_4383_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_4412
LB_4411:
	add r14,1
LB_4412:
	cmp r14,r10
	jge LB_4413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4411
	cmp al,10
	jz LB_4411
	cmp al,32
	jz LB_4411
LB_4413:
	push r10
	call NS_E_1348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4414
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4404
LB_4414:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_4417
LB_4416:
	add r14,1
LB_4417:
	cmp r14,r10
	jge LB_4418
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4416
	cmp al,10
	jz LB_4416
	cmp al,32
	jz LB_4416
LB_4418:
	add r14,1
	cmp r14,r10
	jg LB_4422
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4422
	jmp LB_4423
LB_4422:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4420
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4420:
	jmp LB_4404
LB_4423:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_4425
LB_4424:
	add r14,1
LB_4425:
	cmp r14,r10
	jge LB_4426
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4424
	cmp al,10
	jz LB_4424
	cmp al,32
	jz LB_4424
LB_4426:
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4427
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4428
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4428:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4429
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4429:
	jmp LB_4404
LB_4427:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4409
	btr r12,2
	clc
	jmp LB_4410
LB_4409:
	bts r12,2
	stc
LB_4410:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4407
	btr r12,1
	clc
	jmp LB_4408
LB_4407:
	bts r12,1
	stc
LB_4408:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4405
	btr r12,0
	clc
	jmp LB_4406
LB_4405:
	bts r12,0
	stc
LB_4406:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4401
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov rcx,r14
	bt r12,1
	jc LB_4431
	btr r12,6
	jmp LB_4432
LB_4431:
	bts r12,6
LB_4432:
	mov r14,r8
	bt r12,2
	jc LB_4433
	btr r12,1
	jmp LB_4434
LB_4433:
	bts r12,1
LB_4434:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1395 { %_4384 %_4385 } ⊢ %_4386 : %_4386
 ; {>  %_4385~1':_p1394 %_4384~0':_stg }
; _f1395 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4386 ⊢ %_4387 : %_4387
 ; {>  %_4386~°0◂{ 0' 1' }:_p1394 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4387
 ; {>  %_4387~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1394) }
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
	jc LB_4395
	btr r12,2
	jmp LB_4396
LB_4395:
	bts r12,2
LB_4396:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4393
	btr QWORD [rdi],0
	jmp LB_4394
LB_4393:
	bts QWORD [rdi],0
LB_4394:
	mov r8,r14
	bt r12,1
	jc LB_4399
	btr r12,2
	jmp LB_4400
LB_4399:
	bts r12,2
LB_4400:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4397
	btr QWORD [rdi],1
	jmp LB_4398
LB_4397:
	bts QWORD [rdi],1
LB_4398:
	mov rsi,1
	bt r12,3
	jc LB_4391
	mov rsi,0
	bt r9,0
	jc LB_4391
	jmp LB_4392
LB_4391:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4392:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4401:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4403
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4402
LB_4403:
	add rsp,8
	ret
LB_4404:
	add rsp,48
	pop r14
LB_4402:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4446
LB_4445:
	add r14,1
LB_4446:
	cmp r14,r10
	jge LB_4447
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4445
	cmp al,32
	jz LB_4445
LB_4447:
	push r10
	call NS_E_1348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4448
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4442
LB_4448:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4443
	btr r12,0
	clc
	jmp LB_4444
LB_4443:
	bts r12,0
	stc
LB_4444:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4439
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1396 %_4388 ⊢ %_4389 : %_4389
 ; {>  %_4388~0':_stg }
; _f1396 0' ⊢ °1◂0'
; _some %_4389 ⊢ %_4390 : %_4390
 ; {>  %_4389~°1◂0':_p1394 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4390
 ; {>  %_4390~°0◂°1◂0':(_opn)◂(_p1394) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4437
	btr r12,3
	jmp LB_4438
LB_4437:
	bts r12,3
LB_4438:
	mov rsi,1
	bt r12,3
	jc LB_4435
	mov rsi,0
	bt r9,0
	jc LB_4435
	jmp LB_4436
LB_4435:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4436:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4439:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4441
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4440
LB_4441:
	add rsp,8
	ret
LB_4442:
	add rsp,16
	pop r14
LB_4440:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4450:
NS_E_RDI_4450:
NS_E_4450_ETR_TBL:
NS_E_4450_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4475
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4467
LB_4475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_4483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_4483
	jmp LB_4484
LB_4483:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4481:
	jmp LB_4467
LB_4484:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4470
	btr r12,1
	clc
	jmp LB_4471
LB_4470:
	bts r12,1
	stc
LB_4471:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4468
	btr r12,0
	clc
	jmp LB_4469
LB_4468:
	bts r12,0
	stc
LB_4469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4464
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1443 %_4451 ⊢ %_4452 : %_4452
 ; {>  %_4451~0':_r64 }
; _f1443 0' ⊢ °0◂0'
; _some %_4452 ⊢ %_4453 : %_4453
 ; {>  %_4452~°0◂0':_p1442 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4453
 ; {>  %_4453~°0◂°0◂0':(_opn)◂(_p1442) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4462
	btr r12,3
	jmp LB_4463
LB_4462:
	bts r12,3
LB_4463:
	mov rsi,1
	bt r12,3
	jc LB_4460
	mov rsi,0
	bt r9,0
	jc LB_4460
	jmp LB_4461
LB_4460:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4461:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4464:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4466
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4465
LB_4466:
	add rsp,8
	ret
LB_4467:
	add rsp,32
	pop r14
LB_4465:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_845_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4498
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4492
LB_4498:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4493
	btr r12,0
	clc
	jmp LB_4494
LB_4493:
	bts r12,0
	stc
LB_4494:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4489
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1444 %_4454 ⊢ %_4455 : %_4455
 ; {>  %_4454~0':_stg }
; _f1444 0' ⊢ °1◂0'
; _some %_4455 ⊢ %_4456 : %_4456
 ; {>  %_4455~°1◂0':_p1442 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4456
 ; {>  %_4456~°0◂°1◂0':(_opn)◂(_p1442) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4487
	btr r12,3
	jmp LB_4488
LB_4487:
	bts r12,3
LB_4488:
	mov rsi,1
	bt r12,3
	jc LB_4485
	mov rsi,0
	bt r9,0
	jc LB_4485
	jmp LB_4486
LB_4485:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4486:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4489:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4491
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4490
LB_4491:
	add rsp,8
	ret
LB_4492:
	add rsp,16
	pop r14
LB_4490:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4513
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4507
LB_4513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4508
	btr r12,0
	clc
	jmp LB_4509
LB_4508:
	bts r12,0
	stc
LB_4509:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4504
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1445 %_4457 ⊢ %_4458 : %_4458
 ; {>  %_4457~0':_p1394 }
; _f1445 0' ⊢ °2◂0'
; _some %_4458 ⊢ %_4459 : %_4459
 ; {>  %_4458~°2◂0':_p1442 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_4459
 ; {>  %_4459~°0◂°2◂0':(_opn)◂(_p1442) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4502
	btr r12,3
	jmp LB_4503
LB_4502:
	bts r12,3
LB_4503:
	mov rsi,1
	bt r12,3
	jc LB_4500
	mov rsi,0
	bt r9,0
	jc LB_4500
	jmp LB_4501
LB_4500:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4501:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4504:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4506
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4505
LB_4506:
	add rsp,8
	ret
LB_4507:
	add rsp,16
	pop r14
LB_4505:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4516:
NS_E_RDI_4516:
NS_E_4516_ETR_TBL:
NS_E_4516_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_4523
LB_4522:
	add r14,1
LB_4523:
	cmp r14,r10
	jge LB_4524
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4522
	cmp al,32
	jz LB_4522
LB_4524:
	add r14,1
	cmp r14,r10
	jg LB_4527
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4527
	jmp LB_4528
LB_4527:
	jmp LB_4518
LB_4528:
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
LB_4533:
	jmp LB_4530
LB_4529:
	add r14,1
LB_4530:
	cmp r14,r10
	jge LB_4531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4529
	cmp al,32
	jz LB_4529
LB_4531:
	add r14,1
	cmp r14,r10
	jg LB_4532
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4532
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
	jmp LB_4533
LB_4532:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4519
	btr QWORD [rdi],1
LB_4519:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4520
	btr QWORD [rdi],0
LB_4520:
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
LB_4518:
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
NS_E_4543:
; 	|» { 0' 1' }
NS_E_RDI_4543:
MTC_LB_4544:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4545
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
	jnc LB_4546
	bt QWORD [rdi],0
	jc LB_4547
	btr r12,4
	clc
	jmp LB_4548
LB_4547:
	bts r12,4
	stc
LB_4548:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4546:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4551
	btr r12,5
	clc
	jmp LB_4552
LB_4551:
	bts r12,5
	stc
LB_4552:
	mov r8,r11
	bt r12,5
	jc LB_4549
	btr r12,2
	jmp LB_4550
LB_4549:
	bts r12,2
LB_4550:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4555
	btr r12,5
	clc
	jmp LB_4556
LB_4555:
	bts r12,5
	stc
LB_4556:
	mov r9,r11
	bt r12,5
	jc LB_4553
	btr r12,3
	jmp LB_4554
LB_4553:
	bts r12,3
LB_4554:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4557:
	cmp r15,0
	jz LB_4558
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4557
LB_4558:
; _f1531 { %_4537 %_4539 } ⊢ %_4541 : %_4541
 ; {>  %_4540~3':(_lst)◂(_p1497) %_4537~0':_p1497 %_4539~2':_p1497 }
; _f1531 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f4543 { %_4541 %_4540 } ⊢ %_4542 : %_4542
 ; {>  %_4541~°2◂{ 0' 2' }:_p1497 %_4540~3':(_lst)◂(_p1497) }
; _f4543 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4559
	btr r12,1
	jmp LB_4560
LB_4559:
	bts r12,1
LB_4560:
	mov r9,r13
	bt r12,0
	jc LB_4561
	btr r12,3
	jmp LB_4562
LB_4561:
	bts r12,3
LB_4562:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_4567
	btr r12,4
	jmp LB_4568
LB_4567:
	bts r12,4
LB_4568:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_4565
	btr QWORD [rdi],0
	jmp LB_4566
LB_4565:
	bts QWORD [rdi],0
LB_4566:
	mov r10,r8
	bt r12,2
	jc LB_4571
	btr r12,4
	jmp LB_4572
LB_4571:
	bts r12,4
LB_4572:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_4569
	btr QWORD [rdi],1
	jmp LB_4570
LB_4569:
	bts QWORD [rdi],1
LB_4570:
	mov rsi,1
	bt r12,0
	jc LB_4563
	mov rsi,0
	bt r13,0
	jc LB_4563
	jmp LB_4564
LB_4563:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_4564:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_4543
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_4542
 ; {>  %_4542~0':_p1497 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4545:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4573
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
	jnc LB_4574
	bt QWORD [rdi],0
	jc LB_4575
	btr r12,2
	clc
	jmp LB_4576
LB_4575:
	bts r12,2
	stc
LB_4576:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4574:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4577:
	cmp r15,0
	jz LB_4578
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4577
LB_4578:
; ∎ %_4537
 ; {>  %_4537~0':_p1497 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4573:
NS_E_4579:
NS_E_RDI_4579:
NS_E_4579_ETR_TBL:
NS_E_4579_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4625
LB_4624:
	add r14,1
LB_4625:
	cmp r14,r10
	jge LB_4626
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4624
	cmp al,10
	jz LB_4624
	cmp al,32
	jz LB_4624
LB_4626:
	add r14,1
	cmp r14,r10
	jg LB_4629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4629
	jmp LB_4630
LB_4629:
	jmp LB_4617
LB_4630:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_4632
LB_4631:
	add r14,1
LB_4632:
	cmp r14,r10
	jge LB_4633
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4631
	cmp al,10
	jz LB_4631
	cmp al,32
	jz LB_4631
LB_4633:
	push r10
	call NS_E_4580_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4634
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4635
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4635:
	jmp LB_4617
LB_4634:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4638
LB_4637:
	add r14,1
LB_4638:
	cmp r14,r10
	jge LB_4639
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4637
	cmp al,10
	jz LB_4637
	cmp al,32
	jz LB_4637
LB_4639:
	add r14,1
	cmp r14,r10
	jg LB_4644
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4644
	jmp LB_4645
LB_4644:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4641
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4641:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4642
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4642:
	jmp LB_4617
LB_4645:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4622
	btr r12,2
	clc
	jmp LB_4623
LB_4622:
	bts r12,2
	stc
LB_4623:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4620
	btr r12,1
	clc
	jmp LB_4621
LB_4620:
	bts r12,1
	stc
LB_4621:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4618
	btr r12,0
	clc
	jmp LB_4619
LB_4618:
	bts r12,0
	stc
LB_4619:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4614
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_4646
	btr r12,6
	jmp LB_4647
LB_4646:
	bts r12,6
LB_4647:
	mov r13,r14
	bt r12,1
	jc LB_4648
	btr r12,0
	jmp LB_4649
LB_4648:
	bts r12,0
LB_4649:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1440 %_4583 ⊢ %_4584 : %_4584
 ; {>  %_4583~0':(_lst)◂((_p1439)◂((_p1446)◂(_stg))) }
; _f1440 0' ⊢ °0◂0'
; _some %_4584 ⊢ %_4585 : %_4585
 ; {>  %_4584~°0◂0':(_p1439)◂((_p1446)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4585
 ; {>  %_4585~°0◂°0◂0':(_opn)◂((_p1439)◂((_p1446)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4612
	btr r12,3
	jmp LB_4613
LB_4612:
	bts r12,3
LB_4613:
	mov rsi,1
	bt r12,3
	jc LB_4610
	mov rsi,0
	bt r9,0
	jc LB_4610
	jmp LB_4611
LB_4610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4611:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4614:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4616
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4615
LB_4616:
	add rsp,8
	ret
LB_4617:
	add rsp,48
	pop r14
LB_4615:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_4661
LB_4660:
	add r14,1
LB_4661:
	cmp r14,r10
	jge LB_4662
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4660
	cmp al,10
	jz LB_4660
	cmp al,32
	jz LB_4660
LB_4662:
	push r10
	call NS_E_4582_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4663
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4657
LB_4663:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4658
	btr r12,0
	clc
	jmp LB_4659
LB_4658:
	bts r12,0
	stc
LB_4659:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4654
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1441 %_4586 ⊢ %_4587 : %_4587
 ; {>  %_4586~0':(_p1446)◂(_stg) }
; _f1441 0' ⊢ °1◂0'
; _some %_4587 ⊢ %_4588 : %_4588
 ; {>  %_4587~°1◂0':(_p1439)◂((_p1446)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4588
 ; {>  %_4588~°0◂°1◂0':(_opn)◂((_p1439)◂((_p1446)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4652
	btr r12,3
	jmp LB_4653
LB_4652:
	bts r12,3
LB_4653:
	mov rsi,1
	bt r12,3
	jc LB_4650
	mov rsi,0
	bt r9,0
	jc LB_4650
	jmp LB_4651
LB_4650:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4651:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4654:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4656
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4655
LB_4656:
	add rsp,8
	ret
LB_4657:
	add rsp,16
	pop r14
LB_4655:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4580:
NS_E_RDI_4580:
NS_E_4580_ETR_TBL:
NS_E_4580_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_4684
LB_4683:
	add r14,1
LB_4684:
	cmp r14,r10
	jge LB_4685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4683
	cmp al,10
	jz LB_4683
	cmp al,32
	jz LB_4683
LB_4685:
	push r10
	call NS_E_4579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4686
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4678
LB_4686:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_4689
LB_4688:
	add r14,1
LB_4689:
	cmp r14,r10
	jge LB_4690
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4688
	cmp al,10
	jz LB_4688
	cmp al,32
	jz LB_4688
LB_4690:
	push r10
	call NS_E_4580_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4691
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4692
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4692:
	jmp LB_4678
LB_4691:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4681
	btr r12,1
	clc
	jmp LB_4682
LB_4681:
	bts r12,1
	stc
LB_4682:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4679
	btr r12,0
	clc
	jmp LB_4680
LB_4679:
	bts r12,0
	stc
LB_4680:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4675
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_4589 %_4590 } ⊢ %_4591 : %_4591
 ; {>  %_4590~1':(_lst)◂((_p1439)◂((_p1446)◂(_stg))) %_4589~0':(_p1439)◂((_p1446)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4591 ⊢ %_4592 : %_4592
 ; {>  %_4591~°0◂{ 0' 1' }:(_lst)◂((_p1439)◂((_p1446)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4592
 ; {>  %_4592~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1439)◂((_p1446)◂(_stg)))) }
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
	jc LB_4669
	btr r12,2
	jmp LB_4670
LB_4669:
	bts r12,2
LB_4670:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4667
	btr QWORD [rdi],0
	jmp LB_4668
LB_4667:
	bts QWORD [rdi],0
LB_4668:
	mov r8,r14
	bt r12,1
	jc LB_4673
	btr r12,2
	jmp LB_4674
LB_4673:
	bts r12,2
LB_4674:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4671
	btr QWORD [rdi],1
	jmp LB_4672
LB_4671:
	bts QWORD [rdi],1
LB_4672:
	mov rsi,1
	bt r12,3
	jc LB_4665
	mov rsi,0
	bt r9,0
	jc LB_4665
	jmp LB_4666
LB_4665:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4666:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4675:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4677
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4676
LB_4677:
	add rsp,8
	ret
LB_4678:
	add rsp,32
	pop r14
LB_4676:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4696
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4593 : %_4593
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4593 ⊢ %_4594 : %_4594
 ; {>  %_4593~°1◂{  }:(_lst)◂(t1826'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4594
 ; {>  %_4594~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1829'(0))) }
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
	jc LB_4694
	mov rsi,0
	bt r9,0
	jc LB_4694
	jmp LB_4695
LB_4694:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4695:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4696:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4698
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4697
LB_4698:
	add rsp,8
	ret
LB_4699:
	add rsp,0
	pop r14
LB_4697:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4581:
NS_E_RDI_4581:
NS_E_4581_ETR_TBL:
NS_E_4581_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_4735
LB_4734:
	add r14,1
LB_4735:
	cmp r14,r10
	jge LB_4736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4734
	cmp al,10
	jz LB_4734
	cmp al,32
	jz LB_4734
LB_4736:
	add r14,1
	cmp r14,r10
	jg LB_4739
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4739
	jmp LB_4740
LB_4739:
	jmp LB_4713
LB_4740:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_4722
LB_4721:
	add r14,1
LB_4722:
	cmp r14,r10
	jge LB_4723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4721
	cmp al,10
	jz LB_4721
	cmp al,32
	jz LB_4721
LB_4723:
	push r10
	call NS_E_4582_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4724
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4725
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4725:
	jmp LB_4714
LB_4724:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_4728
LB_4727:
	add r14,1
LB_4728:
	cmp r14,r10
	jge LB_4729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4727
	cmp al,10
	jz LB_4727
	cmp al,32
	jz LB_4727
LB_4729:
	push r10
	call NS_E_4581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4730
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4731
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4731:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4732
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4732:
	jmp LB_4714
LB_4730:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4719
	btr r12,2
	clc
	jmp LB_4720
LB_4719:
	bts r12,2
	stc
LB_4720:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4717
	btr r12,1
	clc
	jmp LB_4718
LB_4717:
	bts r12,1
	stc
LB_4718:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4715
	btr r12,0
	clc
	jmp LB_4716
LB_4715:
	bts r12,0
	stc
LB_4716:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4710
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4741
	btr r12,3
	jmp LB_4742
LB_4741:
	bts r12,3
LB_4742:
	mov r14,r8
	bt r12,2
	jc LB_4743
	btr r12,1
	jmp LB_4744
LB_4743:
	bts r12,1
LB_4744:
	mov r8,r13
	bt r12,0
	jc LB_4745
	btr r12,2
	jmp LB_4746
LB_4745:
	bts r12,2
LB_4746:
	mov r13,r9
	bt r12,3
	jc LB_4747
	btr r12,0
	jmp LB_4748
LB_4747:
	bts r12,0
LB_4748:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4595 %_4596 } ⊢ %_4597 : %_4597
 ; {>  %_4596~1':(_lst)◂((_p1446)◂(_stg)) %_4595~0':(_p1446)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4597 ⊢ %_4598 : %_4598
 ; {>  %_4597~°0◂{ 0' 1' }:(_lst)◂((_p1446)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4598
 ; {>  %_4598~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1446)◂(_stg))) }
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
	jc LB_4704
	btr r12,2
	jmp LB_4705
LB_4704:
	bts r12,2
LB_4705:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4702
	btr QWORD [rdi],0
	jmp LB_4703
LB_4702:
	bts QWORD [rdi],0
LB_4703:
	mov r8,r14
	bt r12,1
	jc LB_4708
	btr r12,2
	jmp LB_4709
LB_4708:
	bts r12,2
LB_4709:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4706
	btr QWORD [rdi],1
	jmp LB_4707
LB_4706:
	bts QWORD [rdi],1
LB_4707:
	mov rsi,1
	bt r12,3
	jc LB_4700
	mov rsi,0
	bt r9,0
	jc LB_4700
	jmp LB_4701
LB_4700:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4701:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4710:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4712
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4711
LB_4712:
	add rsp,8
	ret
LB_4714:
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
LB_4713:
	add rsp,48
	pop r14
LB_4711:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4751
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4599 : %_4599
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4599 ⊢ %_4600 : %_4600
 ; {>  %_4599~°1◂{  }:(_lst)◂(t1839'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4600
 ; {>  %_4600~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1842'(0))) }
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
	jc LB_4749
	mov rsi,0
	bt r9,0
	jc LB_4749
	jmp LB_4750
LB_4749:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4750:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4751:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4753
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4752
LB_4753:
	add rsp,8
	ret
LB_4754:
	add rsp,0
	pop r14
LB_4752:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4582:
NS_E_RDI_4582:
NS_E_4582_ETR_TBL:
NS_E_4582_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_4770
LB_4769:
	add r14,1
LB_4770:
	cmp r14,r10
	jge LB_4771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4769
	cmp al,10
	jz LB_4769
	cmp al,32
	jz LB_4769
LB_4771:
	add r14,2
	cmp r14,r10
	jg LB_4774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_4774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4774
	jmp LB_4775
LB_4774:
	jmp LB_4762
LB_4775:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_4777
LB_4776:
	add r14,1
LB_4777:
	cmp r14,r10
	jge LB_4778
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4776
	cmp al,10
	jz LB_4776
	cmp al,32
	jz LB_4776
LB_4778:
	push r10
	call NS_E_4450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4779
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4780:
	jmp LB_4762
LB_4779:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_4783
LB_4782:
	add r14,1
LB_4783:
	cmp r14,r10
	jge LB_4784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4782
	cmp al,10
	jz LB_4782
	cmp al,32
	jz LB_4782
LB_4784:
	add r14,1
	cmp r14,r10
	jg LB_4789
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_4789
	jmp LB_4790
LB_4789:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4786
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4786:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4787
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4787:
	jmp LB_4762
LB_4790:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4767
	btr r12,2
	clc
	jmp LB_4768
LB_4767:
	bts r12,2
	stc
LB_4768:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4765
	btr r12,1
	clc
	jmp LB_4766
LB_4765:
	bts r12,1
	stc
LB_4766:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4763
	btr r12,0
	clc
	jmp LB_4764
LB_4763:
	bts r12,0
	stc
LB_4764:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4759
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_4791
	btr r12,6
	jmp LB_4792
LB_4791:
	bts r12,6
LB_4792:
	mov r13,r14
	bt r12,1
	jc LB_4793
	btr r12,0
	jmp LB_4794
LB_4793:
	bts r12,0
LB_4794:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1448 %_4601 ⊢ %_4602 : %_4602
 ; {>  %_4601~0':_p1442 }
; _f1448 0' ⊢ °0◂0'
; _some %_4602 ⊢ %_4603 : %_4603
 ; {>  %_4602~°0◂0':(_p1446)◂(t1847'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4603
 ; {>  %_4603~°0◂°0◂0':(_opn)◂((_p1446)◂(t1850'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4757
	btr r12,3
	jmp LB_4758
LB_4757:
	bts r12,3
LB_4758:
	mov rsi,1
	bt r12,3
	jc LB_4755
	mov rsi,0
	bt r9,0
	jc LB_4755
	jmp LB_4756
LB_4755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4756:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4759:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4761
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4760
LB_4761:
	add rsp,8
	ret
LB_4762:
	add rsp,48
	pop r14
LB_4760:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_4819
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_4819
	jmp LB_4820
LB_4819:
	jmp LB_4802
LB_4820:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_1348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4811
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4812
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4812:
	jmp LB_4803
LB_4811:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4806
	btr r12,1
	clc
	jmp LB_4807
LB_4806:
	bts r12,1
	stc
LB_4807:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4804
	btr r12,0
	clc
	jmp LB_4805
LB_4804:
	bts r12,0
	stc
LB_4805:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4799
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4821
	btr r12,2
	jmp LB_4822
LB_4821:
	bts r12,2
LB_4822:
	mov r13,r14
	bt r12,1
	jc LB_4823
	btr r12,0
	jmp LB_4824
LB_4823:
	bts r12,0
LB_4824:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1449 %_4604 ⊢ %_4605 : %_4605
 ; {>  %_4604~0':_stg }
; _f1449 0' ⊢ °1◂0'
; _some %_4605 ⊢ %_4606 : %_4606
 ; {>  %_4605~°1◂0':(_p1446)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4606
 ; {>  %_4606~°0◂°1◂0':(_opn)◂((_p1446)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4797
	btr r12,3
	jmp LB_4798
LB_4797:
	bts r12,3
LB_4798:
	mov rsi,1
	bt r12,3
	jc LB_4795
	mov rsi,0
	bt r9,0
	jc LB_4795
	jmp LB_4796
LB_4795:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4796:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4799:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4801
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4800
LB_4801:
	add rsp,8
	ret
LB_4803:
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
LB_4802:
	add rsp,32
	pop r14
LB_4800:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4836
LB_4835:
	add r14,1
LB_4836:
	cmp r14,r10
	jge LB_4837
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4835
	cmp al,10
	jz LB_4835
	cmp al,32
	jz LB_4835
LB_4837:
	push r10
	call NS_E_1348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4838
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4832
LB_4838:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4833
	btr r12,0
	clc
	jmp LB_4834
LB_4833:
	bts r12,0
	stc
LB_4834:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4829
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1449 %_4607 ⊢ %_4608 : %_4608
 ; {>  %_4607~0':_stg }
; _f1449 0' ⊢ °1◂0'
; _some %_4608 ⊢ %_4609 : %_4609
 ; {>  %_4608~°1◂0':(_p1446)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4609
 ; {>  %_4609~°0◂°1◂0':(_opn)◂((_p1446)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4827
	btr r12,3
	jmp LB_4828
LB_4827:
	bts r12,3
LB_4828:
	mov rsi,1
	bt r12,3
	jc LB_4825
	mov rsi,0
	bt r9,0
	jc LB_4825
	jmp LB_4826
LB_4825:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4826:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4829:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4831
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4830
LB_4831:
	add rsp,8
	ret
LB_4832:
	add rsp,16
	pop r14
LB_4830:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4840:
NS_E_RDI_4840:
NS_E_4840_ETR_TBL:
NS_E_4840_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4892
LB_4891:
	add r14,1
LB_4892:
	cmp r14,r10
	jge LB_4893
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4891
	cmp al,10
	jz LB_4891
	cmp al,32
	jz LB_4891
LB_4893:
	add r14,1
	cmp r14,r10
	jg LB_4896
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4896
	jmp LB_4897
LB_4896:
	jmp LB_4884
LB_4897:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_4899
LB_4898:
	add r14,1
LB_4899:
	cmp r14,r10
	jge LB_4900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4898
	cmp al,10
	jz LB_4898
	cmp al,32
	jz LB_4898
LB_4900:
	push r10
	call NS_E_4841_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4901
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4902:
	jmp LB_4884
LB_4901:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4905
LB_4904:
	add r14,1
LB_4905:
	cmp r14,r10
	jge LB_4906
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4904
	cmp al,10
	jz LB_4904
	cmp al,32
	jz LB_4904
LB_4906:
	add r14,1
	cmp r14,r10
	jg LB_4911
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4911
	jmp LB_4912
LB_4911:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4908
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4908:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4909
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4909:
	jmp LB_4884
LB_4912:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4889
	btr r12,2
	clc
	jmp LB_4890
LB_4889:
	bts r12,2
	stc
LB_4890:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4887
	btr r12,1
	clc
	jmp LB_4888
LB_4887:
	bts r12,1
	stc
LB_4888:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4885
	btr r12,0
	clc
	jmp LB_4886
LB_4885:
	bts r12,0
	stc
LB_4886:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4881
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_4913
	btr r12,6
	jmp LB_4914
LB_4913:
	bts r12,6
LB_4914:
	mov r13,r14
	bt r12,1
	jc LB_4915
	btr r12,0
	jmp LB_4916
LB_4915:
	bts r12,0
LB_4916:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1440 %_4845 ⊢ %_4846 : %_4846
 ; {>  %_4845~0':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _f1440 0' ⊢ °0◂0'
; _some %_4846 ⊢ %_4847 : %_4847
 ; {>  %_4846~°0◂0':(_p1439)◂((_p1447)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4847
 ; {>  %_4847~°0◂°0◂0':(_opn)◂((_p1439)◂((_p1447)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4879
	btr r12,3
	jmp LB_4880
LB_4879:
	bts r12,3
LB_4880:
	mov rsi,1
	bt r12,3
	jc LB_4877
	mov rsi,0
	bt r9,0
	jc LB_4877
	jmp LB_4878
LB_4877:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4878:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4881:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4883
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4882
LB_4883:
	add rsp,8
	ret
LB_4884:
	add rsp,48
	pop r14
LB_4882:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_4928
LB_4927:
	add r14,1
LB_4928:
	cmp r14,r10
	jge LB_4929
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4927
	cmp al,10
	jz LB_4927
	cmp al,32
	jz LB_4927
LB_4929:
	push r10
	call NS_E_4844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4930
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4924
LB_4930:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4925
	btr r12,0
	clc
	jmp LB_4926
LB_4925:
	bts r12,0
	stc
LB_4926:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4921
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1441 %_4848 ⊢ %_4849 : %_4849
 ; {>  %_4848~0':(_p1447)◂(_stg) }
; _f1441 0' ⊢ °1◂0'
; _some %_4849 ⊢ %_4850 : %_4850
 ; {>  %_4849~°1◂0':(_p1439)◂((_p1447)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4850
 ; {>  %_4850~°0◂°1◂0':(_opn)◂((_p1439)◂((_p1447)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4919
	btr r12,3
	jmp LB_4920
LB_4919:
	bts r12,3
LB_4920:
	mov rsi,1
	bt r12,3
	jc LB_4917
	mov rsi,0
	bt r9,0
	jc LB_4917
	jmp LB_4918
LB_4917:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4918:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4921:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4923
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4922
LB_4923:
	add rsp,8
	ret
LB_4924:
	add rsp,16
	pop r14
LB_4922:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4841:
NS_E_RDI_4841:
NS_E_4841_ETR_TBL:
NS_E_4841_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_4951
LB_4950:
	add r14,1
LB_4951:
	cmp r14,r10
	jge LB_4952
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4950
	cmp al,10
	jz LB_4950
	cmp al,32
	jz LB_4950
LB_4952:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4953
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4945
LB_4953:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_4956
LB_4955:
	add r14,1
LB_4956:
	cmp r14,r10
	jge LB_4957
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4955
	cmp al,10
	jz LB_4955
	cmp al,32
	jz LB_4955
LB_4957:
	push r10
	call NS_E_4841_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4958
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4959
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4959:
	jmp LB_4945
LB_4958:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4948
	btr r12,1
	clc
	jmp LB_4949
LB_4948:
	bts r12,1
	stc
LB_4949:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4946
	btr r12,0
	clc
	jmp LB_4947
LB_4946:
	bts r12,0
	stc
LB_4947:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4942
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_4851 %_4852 } ⊢ %_4853 : %_4853
 ; {>  %_4851~0':(_p1439)◂((_p1447)◂(_stg)) %_4852~1':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4853 ⊢ %_4854 : %_4854
 ; {>  %_4853~°0◂{ 0' 1' }:(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4854
 ; {>  %_4854~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1439)◂((_p1447)◂(_stg)))) }
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
	jc LB_4936
	btr r12,2
	jmp LB_4937
LB_4936:
	bts r12,2
LB_4937:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4934
	btr QWORD [rdi],0
	jmp LB_4935
LB_4934:
	bts QWORD [rdi],0
LB_4935:
	mov r8,r14
	bt r12,1
	jc LB_4940
	btr r12,2
	jmp LB_4941
LB_4940:
	bts r12,2
LB_4941:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4938
	btr QWORD [rdi],1
	jmp LB_4939
LB_4938:
	bts QWORD [rdi],1
LB_4939:
	mov rsi,1
	bt r12,3
	jc LB_4932
	mov rsi,0
	bt r9,0
	jc LB_4932
	jmp LB_4933
LB_4932:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4933:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4942:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4944
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4943
LB_4944:
	add rsp,8
	ret
LB_4945:
	add rsp,32
	pop r14
LB_4943:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4963
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4855 : %_4855
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4855 ⊢ %_4856 : %_4856
 ; {>  %_4855~°1◂{  }:(_lst)◂(t1939'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4856
 ; {>  %_4856~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1942'(0))) }
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
	jc LB_4961
	mov rsi,0
	bt r9,0
	jc LB_4961
	jmp LB_4962
LB_4961:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4962:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4963:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4965
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4964
LB_4965:
	add rsp,8
	ret
LB_4966:
	add rsp,0
	pop r14
LB_4964:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4842:
NS_E_RDI_4842:
NS_E_4842_ETR_TBL:
NS_E_4842_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_5002
LB_5001:
	add r14,1
LB_5002:
	cmp r14,r10
	jge LB_5003
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5001
	cmp al,10
	jz LB_5001
	cmp al,32
	jz LB_5001
LB_5003:
	add r14,1
	cmp r14,r10
	jg LB_5006
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_5006
	jmp LB_5007
LB_5006:
	jmp LB_4980
LB_5007:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_4989
LB_4988:
	add r14,1
LB_4989:
	cmp r14,r10
	jge LB_4990
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4988
	cmp al,10
	jz LB_4988
	cmp al,32
	jz LB_4988
LB_4990:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4991
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4992
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4992:
	jmp LB_4981
LB_4991:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_4995
LB_4994:
	add r14,1
LB_4995:
	cmp r14,r10
	jge LB_4996
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4994
	cmp al,10
	jz LB_4994
	cmp al,32
	jz LB_4994
LB_4996:
	push r10
	call NS_E_4842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4997
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4998
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4998:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4999
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4999:
	jmp LB_4981
LB_4997:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4986
	btr r12,2
	clc
	jmp LB_4987
LB_4986:
	bts r12,2
	stc
LB_4987:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4984
	btr r12,1
	clc
	jmp LB_4985
LB_4984:
	bts r12,1
	stc
LB_4985:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4982
	btr r12,0
	clc
	jmp LB_4983
LB_4982:
	bts r12,0
	stc
LB_4983:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4977
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5008
	btr r12,3
	jmp LB_5009
LB_5008:
	bts r12,3
LB_5009:
	mov r14,r8
	bt r12,2
	jc LB_5010
	btr r12,1
	jmp LB_5011
LB_5010:
	bts r12,1
LB_5011:
	mov r8,r13
	bt r12,0
	jc LB_5012
	btr r12,2
	jmp LB_5013
LB_5012:
	bts r12,2
LB_5013:
	mov r13,r9
	bt r12,3
	jc LB_5014
	btr r12,0
	jmp LB_5015
LB_5014:
	bts r12,0
LB_5015:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4857 %_4858 } ⊢ %_4859 : %_4859
 ; {>  %_4857~0':(_p1439)◂((_p1447)◂(_stg)) %_4858~1':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4859 ⊢ %_4860 : %_4860
 ; {>  %_4859~°0◂{ 0' 1' }:(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4860
 ; {>  %_4860~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1439)◂((_p1447)◂(_stg)))) }
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
	jc LB_4971
	btr r12,2
	jmp LB_4972
LB_4971:
	bts r12,2
LB_4972:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4969
	btr QWORD [rdi],0
	jmp LB_4970
LB_4969:
	bts QWORD [rdi],0
LB_4970:
	mov r8,r14
	bt r12,1
	jc LB_4975
	btr r12,2
	jmp LB_4976
LB_4975:
	bts r12,2
LB_4976:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4973
	btr QWORD [rdi],1
	jmp LB_4974
LB_4973:
	bts QWORD [rdi],1
LB_4974:
	mov rsi,1
	bt r12,3
	jc LB_4967
	mov rsi,0
	bt r9,0
	jc LB_4967
	jmp LB_4968
LB_4967:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4968:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4977:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4979
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4978
LB_4979:
	add rsp,8
	ret
LB_4981:
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
LB_4980:
	add rsp,48
	pop r14
LB_4978:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5018
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4861 : %_4861
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4861 ⊢ %_4862 : %_4862
 ; {>  %_4861~°1◂{  }:(_lst)◂(t1952'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4862
 ; {>  %_4862~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1955'(0))) }
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
	jc LB_5016
	mov rsi,0
	bt r9,0
	jc LB_5016
	jmp LB_5017
LB_5016:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5017:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5018:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5020
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5019
LB_5020:
	add rsp,8
	ret
LB_5021:
	add rsp,0
	pop r14
LB_5019:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4843:
NS_E_RDI_4843:
NS_E_4843_ETR_TBL:
NS_E_4843_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_5057
LB_5056:
	add r14,1
LB_5057:
	cmp r14,r10
	jge LB_5058
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5056
	cmp al,10
	jz LB_5056
	cmp al,32
	jz LB_5056
LB_5058:
	add r14,1
	cmp r14,r10
	jg LB_5061
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_5061
	jmp LB_5062
LB_5061:
	jmp LB_5035
LB_5062:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_5044
LB_5043:
	add r14,1
LB_5044:
	cmp r14,r10
	jge LB_5045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5043
	cmp al,10
	jz LB_5043
	cmp al,32
	jz LB_5043
LB_5045:
	push r10
	call NS_E_4844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5046
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5047:
	jmp LB_5036
LB_5046:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_5050
LB_5049:
	add r14,1
LB_5050:
	cmp r14,r10
	jge LB_5051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5049
	cmp al,10
	jz LB_5049
	cmp al,32
	jz LB_5049
LB_5051:
	push r10
	call NS_E_4843_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5052
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5053
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5053:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5054
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5054:
	jmp LB_5036
LB_5052:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5041
	btr r12,2
	clc
	jmp LB_5042
LB_5041:
	bts r12,2
	stc
LB_5042:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5039
	btr r12,1
	clc
	jmp LB_5040
LB_5039:
	bts r12,1
	stc
LB_5040:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5037
	btr r12,0
	clc
	jmp LB_5038
LB_5037:
	bts r12,0
	stc
LB_5038:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5032
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5063
	btr r12,3
	jmp LB_5064
LB_5063:
	bts r12,3
LB_5064:
	mov r14,r8
	bt r12,2
	jc LB_5065
	btr r12,1
	jmp LB_5066
LB_5065:
	bts r12,1
LB_5066:
	mov r8,r13
	bt r12,0
	jc LB_5067
	btr r12,2
	jmp LB_5068
LB_5067:
	bts r12,2
LB_5068:
	mov r13,r9
	bt r12,3
	jc LB_5069
	btr r12,0
	jmp LB_5070
LB_5069:
	bts r12,0
LB_5070:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4863 %_4864 } ⊢ %_4865 : %_4865
 ; {>  %_4863~0':(_p1447)◂(_stg) %_4864~1':(_lst)◂((_p1447)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4865 ⊢ %_4866 : %_4866
 ; {>  %_4865~°0◂{ 0' 1' }:(_lst)◂((_p1447)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4866
 ; {>  %_4866~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1447)◂(_stg))) }
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
	jc LB_5026
	btr r12,2
	jmp LB_5027
LB_5026:
	bts r12,2
LB_5027:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5024
	btr QWORD [rdi],0
	jmp LB_5025
LB_5024:
	bts QWORD [rdi],0
LB_5025:
	mov r8,r14
	bt r12,1
	jc LB_5030
	btr r12,2
	jmp LB_5031
LB_5030:
	bts r12,2
LB_5031:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5028
	btr QWORD [rdi],1
	jmp LB_5029
LB_5028:
	bts QWORD [rdi],1
LB_5029:
	mov rsi,1
	bt r12,3
	jc LB_5022
	mov rsi,0
	bt r9,0
	jc LB_5022
	jmp LB_5023
LB_5022:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5023:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5032:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5034
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5033
LB_5034:
	add rsp,8
	ret
LB_5036:
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
LB_5035:
	add rsp,48
	pop r14
LB_5033:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5073
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4867 : %_4867
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4867 ⊢ %_4868 : %_4868
 ; {>  %_4867~°1◂{  }:(_lst)◂(t1965'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4868
 ; {>  %_4868~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1968'(0))) }
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
	jc LB_5071
	mov rsi,0
	bt r9,0
	jc LB_5071
	jmp LB_5072
LB_5071:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5072:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5073:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5075
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5074
LB_5075:
	add rsp,8
	ret
LB_5076:
	add rsp,0
	pop r14
LB_5074:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4844:
NS_E_RDI_4844:
NS_E_4844_ETR_TBL:
NS_E_4844_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_5101
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_5101
	jmp LB_5102
LB_5101:
	jmp LB_5084
LB_5102:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5093
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5094
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5094:
	jmp LB_5085
LB_5093:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5088
	btr r12,1
	clc
	jmp LB_5089
LB_5088:
	bts r12,1
	stc
LB_5089:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5086
	btr r12,0
	clc
	jmp LB_5087
LB_5086:
	bts r12,0
	stc
LB_5087:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5081
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5103
	btr r12,2
	jmp LB_5104
LB_5103:
	bts r12,2
LB_5104:
	mov r13,r14
	bt r12,1
	jc LB_5105
	btr r12,0
	jmp LB_5106
LB_5105:
	bts r12,0
LB_5106:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1451 %_4869 ⊢ %_4870 : %_4870
 ; {>  %_4869~0':_stg }
; _f1451 0' ⊢ °1◂0'
; _some %_4870 ⊢ %_4871 : %_4871
 ; {>  %_4870~°1◂0':(_p1447)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4871
 ; {>  %_4871~°0◂°1◂0':(_opn)◂((_p1447)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5079
	btr r12,3
	jmp LB_5080
LB_5079:
	bts r12,3
LB_5080:
	mov rsi,1
	bt r12,3
	jc LB_5077
	mov rsi,0
	bt r9,0
	jc LB_5077
	jmp LB_5078
LB_5077:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5078:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5081:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5083
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5082
LB_5083:
	add rsp,8
	ret
LB_5085:
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
LB_5084:
	add rsp,32
	pop r14
LB_5082:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5120
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5114
LB_5120:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5115
	btr r12,0
	clc
	jmp LB_5116
LB_5115:
	bts r12,0
	stc
LB_5116:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5111
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1451 %_4872 ⊢ %_4873 : %_4873
 ; {>  %_4872~0':_stg }
; _f1451 0' ⊢ °1◂0'
; _some %_4873 ⊢ %_4874 : %_4874
 ; {>  %_4873~°1◂0':(_p1447)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4874
 ; {>  %_4874~°0◂°1◂0':(_opn)◂((_p1447)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5109
	btr r12,3
	jmp LB_5110
LB_5109:
	bts r12,3
LB_5110:
	mov rsi,1
	bt r12,3
	jc LB_5107
	mov rsi,0
	bt r9,0
	jc LB_5107
	jmp LB_5108
LB_5107:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5108:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5111:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5113
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5112
LB_5113:
	add rsp,8
	ret
LB_5114:
	add rsp,16
	pop r14
LB_5112:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_5135
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5135
	jmp LB_5136
LB_5135:
	jmp LB_5127
LB_5136:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5128
	btr r12,0
	clc
	jmp LB_5129
LB_5128:
	bts r12,0
	stc
LB_5129:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5124
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1450 {  } ⊢ %_4875 : %_4875
 ; {>  }
; _f1450 {  } ⊢ °0◂{  }
; _some %_4875 ⊢ %_4876 : %_4876
 ; {>  %_4875~°0◂{  }:(_p1447)◂(t1982'(0)) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_4876
 ; {>  %_4876~°0◂°0◂{  }:(_opn)◂((_p1447)◂(t1985'(0))) }
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
	jc LB_5122
	mov rsi,0
	bt r9,0
	jc LB_5122
	jmp LB_5123
LB_5122:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5123:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5124:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5126
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5125
LB_5126:
	add rsp,8
	ret
LB_5127:
	add rsp,16
	pop r14
LB_5125:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5137:
NS_E_RDI_5137:
NS_E_5137_ETR_TBL:
NS_E_5137_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_5215
LB_5214:
	add r14,1
LB_5215:
	cmp r14,r10
	jge LB_5216
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5214
	cmp al,10
	jz LB_5214
	cmp al,32
	jz LB_5214
LB_5216:
	push r10
	call NS_E_5140_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5217
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5207
LB_5217:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_5220
LB_5219:
	add r14,1
LB_5220:
	cmp r14,r10
	jge LB_5221
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5219
	cmp al,10
	jz LB_5219
	cmp al,32
	jz LB_5219
LB_5221:
	push r10
	call NS_E_5139_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5222
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5223
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5223:
	jmp LB_5207
LB_5222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_5226
LB_5225:
	add r14,1
LB_5226:
	cmp r14,r10
	jge LB_5227
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5225
	cmp al,10
	jz LB_5225
	cmp al,32
	jz LB_5225
LB_5227:
	push r10
	call NS_E_5138_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5228
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5229
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5229:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5230
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5230:
	jmp LB_5207
LB_5228:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5212
	btr r12,2
	clc
	jmp LB_5213
LB_5212:
	bts r12,2
	stc
LB_5213:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5210
	btr r12,1
	clc
	jmp LB_5211
LB_5210:
	bts r12,1
	stc
LB_5211:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5208
	btr r12,0
	clc
	jmp LB_5209
LB_5208:
	bts r12,0
	stc
LB_5209:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5204
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	bts r12,3
	bts r12,4
	bts r12,5
; _f4543 { %_5142 %_5143 } ⊢ %_5145 : %_5145
 ; {>  %_5142~0':_p1497 %_5143~1':(_lst)◂(_p1497) %_5144~2':(_opn)◂(_p1497) }
; _f4543 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4543
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_5175
	btr r12,2
	clc
	jmp LB_5176
LB_5175:
	bts r12,2
	stc
LB_5176:
	add rsp,16
MTC_LB_5177:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5178
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
	jnc LB_5179
	bt QWORD [rdi],0
	jc LB_5180
	btr r12,3
	clc
	jmp LB_5181
LB_5180:
	bts r12,3
	stc
LB_5181:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5179:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_5182
	btr r12,1
	jmp LB_5183
LB_5182:
	bts r12,1
LB_5183:
LB_5184:
	cmp r15,0
	jz LB_5185
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5184
LB_5185:
; _f1530 { %_5145 %_5146 } ⊢ %_5147 : %_5147
 ; {>  %_5146~1':_p1497 %_5145~0':_p1497 }
; _f1530 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5147 ⊢ %_5148 : %_5148
 ; {>  %_5147~°1◂{ 0' 1' }:_p1497 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5148
 ; {>  %_5148~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1497) }
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
	jc LB_5190
	btr r12,2
	jmp LB_5191
LB_5190:
	bts r12,2
LB_5191:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5188
	btr QWORD [rdi],0
	jmp LB_5189
LB_5188:
	bts QWORD [rdi],0
LB_5189:
	mov r8,r14
	bt r12,1
	jc LB_5194
	btr r12,2
	jmp LB_5195
LB_5194:
	bts r12,2
LB_5195:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5192
	btr QWORD [rdi],1
	jmp LB_5193
LB_5192:
	bts QWORD [rdi],1
LB_5193:
	mov rsi,1
	bt r12,3
	jc LB_5186
	mov rsi,0
	bt r9,0
	jc LB_5186
	jmp LB_5187
LB_5186:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5187:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_5178:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_5196
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
	jnc LB_5197
	bt QWORD [rdi],0
	jc LB_5198
	btr r12,1
	clc
	jmp LB_5199
LB_5198:
	bts r12,1
	stc
LB_5199:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5197:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5200:
	cmp r15,0
	jz LB_5201
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5200
LB_5201:
; _some %_5145 ⊢ %_5149 : %_5149
 ; {>  %_5145~0':_p1497 }
; _some 0' ⊢ °0◂0'
; ∎ %_5149
 ; {>  %_5149~°0◂0':(_opn)◂(_p1497) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5202
	btr r12,3
	jmp LB_5203
LB_5202:
	bts r12,3
LB_5203:
	mov r8,0
	bts r12,2
	ret
MTC_LB_5196:
LB_5204:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5206
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5205
LB_5206:
	add rsp,8
	ret
LB_5207:
	add rsp,48
	pop r14
LB_5205:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5138:
NS_E_RDI_5138:
NS_E_5138_ETR_TBL:
NS_E_5138_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_5245
LB_5244:
	add r14,1
LB_5245:
	cmp r14,r10
	jge LB_5246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5244
	cmp al,10
	jz LB_5244
	cmp al,32
	jz LB_5244
LB_5246:
	add r14,3
	cmp r14,r10
	jg LB_5249
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5249
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_5249
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_5249
	jmp LB_5250
LB_5249:
	jmp LB_5239
LB_5250:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_5252
LB_5251:
	add r14,1
LB_5252:
	cmp r14,r10
	jge LB_5253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5251
	cmp al,10
	jz LB_5251
	cmp al,32
	jz LB_5251
LB_5253:
	push r10
	call NS_E_5137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5254
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5255
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5255:
	jmp LB_5239
LB_5254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5242
	btr r12,1
	clc
	jmp LB_5243
LB_5242:
	bts r12,1
	stc
LB_5243:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5240
	btr r12,0
	clc
	jmp LB_5241
LB_5240:
	bts r12,0
	stc
LB_5241:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5236
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_5257
	btr r12,5
	jmp LB_5258
LB_5257:
	bts r12,5
LB_5258:
	mov r13,r14
	bt r12,1
	jc LB_5259
	btr r12,0
	jmp LB_5260
LB_5259:
	bts r12,0
LB_5260:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5150 ⊢ %_5151 : %_5151
 ; {>  %_5150~0':_p1497 }
; _some 0' ⊢ °0◂0'
; _some %_5151 ⊢ %_5152 : %_5152
 ; {>  %_5151~°0◂0':(_opn)◂(_p1497) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5152
 ; {>  %_5152~°0◂°0◂0':(_opn)◂((_opn)◂(_p1497)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5234
	btr r12,3
	jmp LB_5235
LB_5234:
	bts r12,3
LB_5235:
	mov rsi,1
	bt r12,3
	jc LB_5232
	mov rsi,0
	bt r9,0
	jc LB_5232
	jmp LB_5233
LB_5232:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5233:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5236:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5238
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5237
LB_5238:
	add rsp,8
	ret
LB_5239:
	add rsp,32
	pop r14
LB_5237:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5263
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_5153 : %_5153
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5153 ⊢ %_5154 : %_5154
 ; {>  %_5153~°1◂{  }:(_opn)◂(t2080'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5154
 ; {>  %_5154~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2083'(0))) }
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
	jc LB_5261
	mov rsi,0
	bt r9,0
	jc LB_5261
	jmp LB_5262
LB_5261:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5262:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5263:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5265
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5264
LB_5265:
	add rsp,8
	ret
LB_5266:
	add rsp,0
	pop r14
LB_5264:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5139:
NS_E_RDI_5139:
NS_E_5139_ETR_TBL:
NS_E_5139_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_5288
LB_5287:
	add r14,1
LB_5288:
	cmp r14,r10
	jge LB_5289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5287
	cmp al,10
	jz LB_5287
	cmp al,32
	jz LB_5287
LB_5289:
	add r14,3
	cmp r14,r10
	jg LB_5292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_5292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_5292
	jmp LB_5293
LB_5292:
	jmp LB_5280
LB_5293:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_5295
LB_5294:
	add r14,1
LB_5295:
	cmp r14,r10
	jge LB_5296
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5294
	cmp al,10
	jz LB_5294
	cmp al,32
	jz LB_5294
LB_5296:
	push r10
	call NS_E_5140_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5297
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5298
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5298:
	jmp LB_5280
LB_5297:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_5301
LB_5300:
	add r14,1
LB_5301:
	cmp r14,r10
	jge LB_5302
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5300
	cmp al,10
	jz LB_5300
	cmp al,32
	jz LB_5300
LB_5302:
	push r10
	call NS_E_5139_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5303
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5304
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5304:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5305
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5305:
	jmp LB_5280
LB_5303:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5285
	btr r12,2
	clc
	jmp LB_5286
LB_5285:
	bts r12,2
	stc
LB_5286:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5283
	btr r12,1
	clc
	jmp LB_5284
LB_5283:
	bts r12,1
	stc
LB_5284:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5281
	btr r12,0
	clc
	jmp LB_5282
LB_5281:
	bts r12,0
	stc
LB_5282:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5277
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov rcx,r14
	bt r12,1
	jc LB_5307
	btr r12,6
	jmp LB_5308
LB_5307:
	bts r12,6
LB_5308:
	mov r14,r8
	bt r12,2
	jc LB_5309
	btr r12,1
	jmp LB_5310
LB_5309:
	bts r12,1
LB_5310:
	mov r8,r13
	bt r12,0
	jc LB_5311
	btr r12,2
	jmp LB_5312
LB_5311:
	bts r12,2
LB_5312:
	mov r13,rcx
	bt r12,6
	jc LB_5313
	btr r12,0
	jmp LB_5314
LB_5313:
	bts r12,0
LB_5314:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _cns { %_5155 %_5156 } ⊢ %_5157 : %_5157
 ; {>  %_5156~1':(_lst)◂(_p1497) %_5155~0':_p1497 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5157 ⊢ %_5158 : %_5158
 ; {>  %_5157~°0◂{ 0' 1' }:(_lst)◂(_p1497) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5158
 ; {>  %_5158~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1497)) }
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
	jc LB_5271
	btr r12,2
	jmp LB_5272
LB_5271:
	bts r12,2
LB_5272:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5269
	btr QWORD [rdi],0
	jmp LB_5270
LB_5269:
	bts QWORD [rdi],0
LB_5270:
	mov r8,r14
	bt r12,1
	jc LB_5275
	btr r12,2
	jmp LB_5276
LB_5275:
	bts r12,2
LB_5276:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5273
	btr QWORD [rdi],1
	jmp LB_5274
LB_5273:
	bts QWORD [rdi],1
LB_5274:
	mov rsi,1
	bt r12,3
	jc LB_5267
	mov rsi,0
	bt r9,0
	jc LB_5267
	jmp LB_5268
LB_5267:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5268:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5277:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5279
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5278
LB_5279:
	add rsp,8
	ret
LB_5280:
	add rsp,48
	pop r14
LB_5278:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5317
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5159 : %_5159
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5159 ⊢ %_5160 : %_5160
 ; {>  %_5159~°1◂{  }:(_lst)◂(t2093'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5160
 ; {>  %_5160~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2096'(0))) }
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
	jc LB_5315
	mov rsi,0
	bt r9,0
	jc LB_5315
	jmp LB_5316
LB_5315:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5316:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5317:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5319
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5318
LB_5319:
	add rsp,8
	ret
LB_5320:
	add rsp,0
	pop r14
LB_5318:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5140:
NS_E_RDI_5140:
NS_E_5140_ETR_TBL:
NS_E_5140_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5336
LB_5335:
	add r14,1
LB_5336:
	cmp r14,r10
	jge LB_5337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5335
	cmp al,10
	jz LB_5335
	cmp al,32
	jz LB_5335
LB_5337:
	add r14,1
	cmp r14,r10
	jg LB_5340
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_5340
	jmp LB_5341
LB_5340:
	jmp LB_5328
LB_5341:
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
LB_5346:
	jmp LB_5343
LB_5342:
	add r14,1
LB_5343:
	cmp r14,r10
	jge LB_5344
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5342
	cmp al,10
	jz LB_5342
	cmp al,32
	jz LB_5342
LB_5344:
	push r10
	push rsi
	call NS_E_5137_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5345
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5347
	bts QWORD [rax],0
LB_5347:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5346
LB_5345:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_5349
LB_5348:
	add r14,1
LB_5349:
	cmp r14,r10
	jge LB_5350
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5348
	cmp al,10
	jz LB_5348
	cmp al,32
	jz LB_5348
LB_5350:
	add r14,1
	cmp r14,r10
	jg LB_5355
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_5355
	jmp LB_5356
LB_5355:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5352
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5352:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5353
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5353:
	jmp LB_5328
LB_5356:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5333
	btr r12,2
	clc
	jmp LB_5334
LB_5333:
	bts r12,2
	stc
LB_5334:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5331
	btr r12,1
	clc
	jmp LB_5332
LB_5331:
	bts r12,1
	stc
LB_5332:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5329
	btr r12,0
	clc
	jmp LB_5330
LB_5329:
	bts r12,0
	stc
LB_5330:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5325
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5357
	btr r12,6
	jmp LB_5358
LB_5357:
	bts r12,6
LB_5358:
	mov r13,r14
	bt r12,1
	jc LB_5359
	btr r12,0
	jmp LB_5360
LB_5359:
	bts r12,0
LB_5360:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f628 %_5161 ⊢ %_5162 : %_5162
 ; {>  %_5161~0':(_lst)◂(_p1497) }
; _f628 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_628
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1529 %_5162 ⊢ %_5163 : %_5163
 ; {>  %_5162~0':(_lst)◂(_p1497) }
; _f1529 0' ⊢ °0◂0'
; _some %_5163 ⊢ %_5164 : %_5164
 ; {>  %_5163~°0◂0':_p1497 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5164
 ; {>  %_5164~°0◂°0◂0':(_opn)◂(_p1497) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5323
	btr r12,3
	jmp LB_5324
LB_5323:
	bts r12,3
LB_5324:
	mov rsi,1
	bt r12,3
	jc LB_5321
	mov rsi,0
	bt r9,0
	jc LB_5321
	jmp LB_5322
LB_5321:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5322:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5325:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5327
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5326
LB_5327:
	add rsp,8
	ret
LB_5328:
	add rsp,48
	pop r14
LB_5326:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_5374
LB_5373:
	add r14,1
LB_5374:
	cmp r14,r10
	jge LB_5375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5373
	cmp al,10
	jz LB_5373
	cmp al,32
	jz LB_5373
LB_5375:
	add r14,1
	cmp r14,r10
	jg LB_5378
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_5378
	jmp LB_5379
LB_5378:
	jmp LB_5366
LB_5379:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_5381
LB_5380:
	add r14,1
LB_5381:
	cmp r14,r10
	jge LB_5382
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5380
	cmp al,10
	jz LB_5380
	cmp al,32
	jz LB_5380
LB_5382:
	push r10
	call NS_E_5137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5383
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5384
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5384:
	jmp LB_5366
LB_5383:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_5387
LB_5386:
	add r14,1
LB_5387:
	cmp r14,r10
	jge LB_5388
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5386
	cmp al,10
	jz LB_5386
	cmp al,32
	jz LB_5386
LB_5388:
	add r14,1
	cmp r14,r10
	jg LB_5393
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_5393
	jmp LB_5394
LB_5393:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5390
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5390:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5391
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5391:
	jmp LB_5366
LB_5394:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5371
	btr r12,2
	clc
	jmp LB_5372
LB_5371:
	bts r12,2
	stc
LB_5372:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5369
	btr r12,1
	clc
	jmp LB_5370
LB_5369:
	bts r12,1
	stc
LB_5370:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5367
	btr r12,0
	clc
	jmp LB_5368
LB_5367:
	bts r12,0
	stc
LB_5368:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5363
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5395
	btr r12,6
	jmp LB_5396
LB_5395:
	bts r12,6
LB_5396:
	mov r13,r14
	bt r12,1
	jc LB_5397
	btr r12,0
	jmp LB_5398
LB_5397:
	bts r12,0
LB_5398:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _some %_5165 ⊢ %_5166 : %_5166
 ; {>  %_5165~0':_p1497 }
; _some 0' ⊢ °0◂0'
; ∎ %_5166
 ; {>  %_5166~°0◂0':(_opn)◂(_p1497) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5361
	btr r12,3
	jmp LB_5362
LB_5361:
	bts r12,3
LB_5362:
	mov r8,0
	bts r12,2
	ret
LB_5363:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5365
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5364
LB_5365:
	add rsp,8
	ret
LB_5366:
	add rsp,48
	pop r14
LB_5364:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_5410
LB_5409:
	add r14,1
LB_5410:
	cmp r14,r10
	jge LB_5411
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5409
	cmp al,10
	jz LB_5409
	cmp al,32
	jz LB_5409
LB_5411:
	push r10
	call NS_E_5141_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5412
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5406
LB_5412:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5407
	btr r12,0
	clc
	jmp LB_5408
LB_5407:
	bts r12,0
	stc
LB_5408:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5403
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1533 %_5167 ⊢ %_5168 : %_5168
 ; {>  %_5167~0':_stg }
; _f1533 0' ⊢ °4◂0'
; _some %_5168 ⊢ %_5169 : %_5169
 ; {>  %_5168~°4◂0':_p1497 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_5169
 ; {>  %_5169~°0◂°4◂0':(_opn)◂(_p1497) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5401
	btr r12,3
	jmp LB_5402
LB_5401:
	bts r12,3
LB_5402:
	mov rsi,1
	bt r12,3
	jc LB_5399
	mov rsi,0
	bt r9,0
	jc LB_5399
	jmp LB_5400
LB_5399:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5400:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5403:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5405
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5404
LB_5405:
	add rsp,8
	ret
LB_5406:
	add rsp,16
	pop r14
LB_5404:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_5425
LB_5424:
	add r14,1
LB_5425:
	cmp r14,r10
	jge LB_5426
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5424
	cmp al,10
	jz LB_5424
	cmp al,32
	jz LB_5424
LB_5426:
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5427
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5421
LB_5427:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5422
	btr r12,0
	clc
	jmp LB_5423
LB_5422:
	bts r12,0
	stc
LB_5423:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5418
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1532 %_5170 ⊢ %_5171 : %_5171
 ; {>  %_5170~0':_p1394 }
; _f1532 0' ⊢ °3◂0'
; _some %_5171 ⊢ %_5172 : %_5172
 ; {>  %_5171~°3◂0':_p1497 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_5172
 ; {>  %_5172~°0◂°3◂0':(_opn)◂(_p1497) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5416
	btr r12,3
	jmp LB_5417
LB_5416:
	bts r12,3
LB_5417:
	mov rsi,1
	bt r12,3
	jc LB_5414
	mov rsi,0
	bt r9,0
	jc LB_5414
	jmp LB_5415
LB_5414:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5415:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5418:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5420
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5419
LB_5420:
	add rsp,8
	ret
LB_5421:
	add rsp,16
	pop r14
LB_5419:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5141:
NS_E_RDI_5141:
NS_E_5141_ETR_TBL:
NS_E_5141_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5442
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5434
LB_5442:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_5450
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_5450
	jmp LB_5451
LB_5450:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5448
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5448:
	jmp LB_5434
LB_5451:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5437
	btr r12,1
	clc
	jmp LB_5438
LB_5437:
	bts r12,1
	stc
LB_5438:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5435
	btr r12,0
	clc
	jmp LB_5436
LB_5435:
	bts r12,0
	stc
LB_5436:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5431
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5173 ⊢ %_5174 : %_5174
 ; {>  %_5173~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5174
 ; {>  %_5174~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5429
	btr r12,3
	jmp LB_5430
LB_5429:
	bts r12,3
LB_5430:
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5432
LB_5433:
	add rsp,8
	ret
LB_5434:
	add rsp,32
	pop r14
LB_5432:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5452:
NS_E_RDI_5452:
NS_E_5452_ETR_TBL:
NS_E_5452_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_5854
LB_5853:
	add r14,1
LB_5854:
	cmp r14,r10
	jge LB_5855
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5853
	cmp al,10
	jz LB_5853
	cmp al,32
	jz LB_5853
LB_5855:
	push r10
	call NS_E_5453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5856
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5848
LB_5856:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_5859
LB_5858:
	add r14,1
LB_5859:
	cmp r14,r10
	jge LB_5860
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5858
	cmp al,10
	jz LB_5858
	cmp al,32
	jz LB_5858
LB_5860:
	push r10
	call NS_E_5452_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5861
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5862
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5862:
	jmp LB_5848
LB_5861:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5851
	btr r12,1
	clc
	jmp LB_5852
LB_5851:
	bts r12,1
	stc
LB_5852:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5849
	btr r12,0
	clc
	jmp LB_5850
LB_5849:
	bts r12,0
	stc
LB_5850:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5845
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5493 %_5494 } ⊢ %_5495 : %_5495
 ; {>  %_5493~0':_p1485 %_5494~1':(_lst)◂(_p1485) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5495 ⊢ %_5496 : %_5496
 ; {>  %_5495~°0◂{ 0' 1' }:(_lst)◂(_p1485) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5496
 ; {>  %_5496~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1485)) }
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
	jc LB_5839
	btr r12,2
	jmp LB_5840
LB_5839:
	bts r12,2
LB_5840:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5837
	btr QWORD [rdi],0
	jmp LB_5838
LB_5837:
	bts QWORD [rdi],0
LB_5838:
	mov r8,r14
	bt r12,1
	jc LB_5843
	btr r12,2
	jmp LB_5844
LB_5843:
	bts r12,2
LB_5844:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5841
	btr QWORD [rdi],1
	jmp LB_5842
LB_5841:
	bts QWORD [rdi],1
LB_5842:
	mov rsi,1
	bt r12,3
	jc LB_5835
	mov rsi,0
	bt r9,0
	jc LB_5835
	jmp LB_5836
LB_5835:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5836:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5845:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5847
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5846
LB_5847:
	add rsp,8
	ret
LB_5848:
	add rsp,32
	pop r14
LB_5846:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5866
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5497 : %_5497
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5497 ⊢ %_5498 : %_5498
 ; {>  %_5497~°1◂{  }:(_lst)◂(t2223'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5498
 ; {>  %_5498~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2226'(0))) }
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
	jc LB_5864
	mov rsi,0
	bt r9,0
	jc LB_5864
	jmp LB_5865
LB_5864:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5865:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5866:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5868
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5867
LB_5868:
	add rsp,8
	ret
LB_5869:
	add rsp,0
	pop r14
LB_5867:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5453:
NS_E_RDI_5453:
NS_E_5453_ETR_TBL:
NS_E_5453_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_5888
LB_5887:
	add r14,1
LB_5888:
	cmp r14,r10
	jge LB_5889
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5887
	cmp al,10
	jz LB_5887
	cmp al,32
	jz LB_5887
LB_5889:
	add r14,7
	cmp r14,r10
	jg LB_5892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_5892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_5892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_5892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_5892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_5892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_5892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_5892
	jmp LB_5893
LB_5892:
	jmp LB_5875
LB_5893:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_5882
LB_5881:
	add r14,1
LB_5882:
	cmp r14,r10
	jge LB_5883
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5881
	cmp al,10
	jz LB_5881
	cmp al,32
	jz LB_5881
LB_5883:
	push r10
	call NS_E_5454_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5884
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5885
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5885:
	jmp LB_5876
LB_5884:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5879
	btr r12,1
	clc
	jmp LB_5880
LB_5879:
	bts r12,1
	stc
LB_5880:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5877
	btr r12,0
	clc
	jmp LB_5878
LB_5877:
	bts r12,0
	stc
LB_5878:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5872
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5894
	btr r12,2
	jmp LB_5895
LB_5894:
	bts r12,2
LB_5895:
	mov r13,r14
	bt r12,1
	jc LB_5896
	btr r12,0
	jmp LB_5897
LB_5896:
	bts r12,0
LB_5897:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5499 ⊢ %_5500 : %_5500
 ; {>  %_5499~0':_p1485 }
; _some 0' ⊢ °0◂0'
; ∎ %_5500
 ; {>  %_5500~°0◂0':(_opn)◂(_p1485) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5870
	btr r12,3
	jmp LB_5871
LB_5870:
	bts r12,3
LB_5871:
	mov r8,0
	bts r12,2
	ret
LB_5872:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5874
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5873
LB_5874:
	add rsp,8
	ret
LB_5876:
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
LB_5875:
	add rsp,32
	pop r14
LB_5873:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5899
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 0" _ ⊢ 0' : %_5501
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5501 ⊢ %_5502 : %_5502
 ; {>  %_5501~0':_stg }
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
; _none {  } ⊢ %_5503 : %_5503
 ; {>  %_5502~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5503
 ; {>  %_5503~°1◂{  }:(_opn)◂(t2236'(0)) %_5502~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5898
	mov rdi,r13
	call dlt
LB_5898:
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
LB_5899:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5901
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5900
LB_5901:
	add rsp,8
	ret
LB_5902:
	add rsp,0
	pop r14
LB_5900:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_5938
LB_5937:
	add r14,1
LB_5938:
	cmp r14,r10
	jge LB_5939
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5937
	cmp al,10
	jz LB_5937
	cmp al,32
	jz LB_5937
LB_5939:
	add r14,4
	cmp r14,r10
	jg LB_5942
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_5942
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_5942
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_5942
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_5942
	jmp LB_5943
LB_5942:
	jmp LB_5916
LB_5943:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_5925
LB_5924:
	add r14,1
LB_5925:
	cmp r14,r10
	jge LB_5926
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5924
	cmp al,10
	jz LB_5924
	cmp al,32
	jz LB_5924
LB_5926:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5927
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5928
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5928:
	jmp LB_5917
LB_5927:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_5931
LB_5930:
	add r14,1
LB_5931:
	cmp r14,r10
	jge LB_5932
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5930
	cmp al,10
	jz LB_5930
	cmp al,32
	jz LB_5930
LB_5932:
	push r10
	call NS_E_5455_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5933
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5934
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5934:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5935
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5935:
	jmp LB_5917
LB_5933:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5922
	btr r12,2
	clc
	jmp LB_5923
LB_5922:
	bts r12,2
	stc
LB_5923:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5920
	btr r12,1
	clc
	jmp LB_5921
LB_5920:
	bts r12,1
	stc
LB_5921:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5918
	btr r12,0
	clc
	jmp LB_5919
LB_5918:
	bts r12,0
	stc
LB_5919:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5913
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5944
	btr r12,3
	jmp LB_5945
LB_5944:
	bts r12,3
LB_5945:
	mov r14,r8
	bt r12,2
	jc LB_5946
	btr r12,1
	jmp LB_5947
LB_5946:
	bts r12,1
LB_5947:
	mov r8,r13
	bt r12,0
	jc LB_5948
	btr r12,2
	jmp LB_5949
LB_5948:
	bts r12,2
LB_5949:
	mov r13,r9
	bt r12,3
	jc LB_5950
	btr r12,0
	jmp LB_5951
LB_5950:
	bts r12,0
LB_5951:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1498 { %_5504 %_5505 } ⊢ %_5506 : %_5506
 ; {>  %_5505~1':_p1486 %_5504~0':_stg }
; _f1498 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5506 ⊢ %_5507 : %_5507
 ; {>  %_5506~°0◂{ 0' 1' }:_p1485 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5507
 ; {>  %_5507~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1485) }
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
	jc LB_5907
	btr r12,2
	jmp LB_5908
LB_5907:
	bts r12,2
LB_5908:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5905
	btr QWORD [rdi],0
	jmp LB_5906
LB_5905:
	bts QWORD [rdi],0
LB_5906:
	mov r8,r14
	bt r12,1
	jc LB_5911
	btr r12,2
	jmp LB_5912
LB_5911:
	bts r12,2
LB_5912:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5909
	btr QWORD [rdi],1
	jmp LB_5910
LB_5909:
	bts QWORD [rdi],1
LB_5910:
	mov rsi,1
	bt r12,3
	jc LB_5903
	mov rsi,0
	bt r9,0
	jc LB_5903
	jmp LB_5904
LB_5903:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5904:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5913:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5915
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5914
LB_5915:
	add rsp,8
	ret
LB_5917:
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
LB_5916:
	add rsp,48
	pop r14
LB_5914:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5953
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 1" _ ⊢ 0' : %_5508
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5508 ⊢ %_5509 : %_5509
 ; {>  %_5508~0':_stg }
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
; _none {  } ⊢ %_5510 : %_5510
 ; {>  %_5509~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5510
 ; {>  %_5509~0':_stg %_5510~°1◂{  }:(_opn)◂(t2248'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5952
	mov rdi,r13
	call dlt
LB_5952:
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
LB_5953:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5955
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5954
LB_5955:
	add rsp,8
	ret
LB_5956:
	add rsp,0
	pop r14
LB_5954:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_5975
LB_5974:
	add r14,1
LB_5975:
	cmp r14,r10
	jge LB_5976
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5974
	cmp al,10
	jz LB_5974
	cmp al,32
	jz LB_5974
LB_5976:
	add r14,2
	cmp r14,r10
	jg LB_5979
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5979
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_5979
	jmp LB_5980
LB_5979:
	jmp LB_5962
LB_5980:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_5969
LB_5968:
	add r14,1
LB_5969:
	cmp r14,r10
	jge LB_5970
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5968
	cmp al,10
	jz LB_5968
	cmp al,32
	jz LB_5968
LB_5970:
	push r10
	call NS_E_5463_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5971
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5972:
	jmp LB_5963
LB_5971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5966
	btr r12,1
	clc
	jmp LB_5967
LB_5966:
	bts r12,1
	stc
LB_5967:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5964
	btr r12,0
	clc
	jmp LB_5965
LB_5964:
	bts r12,0
	stc
LB_5965:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5959
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5981
	btr r12,2
	jmp LB_5982
LB_5981:
	bts r12,2
LB_5982:
	mov r13,r14
	bt r12,1
	jc LB_5983
	btr r12,0
	jmp LB_5984
LB_5983:
	bts r12,0
LB_5984:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5511 ⊢ %_5512 : %_5512
 ; {>  %_5511~0':_p1485 }
; _some 0' ⊢ °0◂0'
; ∎ %_5512
 ; {>  %_5512~°0◂0':(_opn)◂(_p1485) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5957
	btr r12,3
	jmp LB_5958
LB_5957:
	bts r12,3
LB_5958:
	mov r8,0
	bts r12,2
	ret
LB_5959:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5961
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5960
LB_5961:
	add rsp,8
	ret
LB_5963:
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
LB_5962:
	add rsp,32
	pop r14
LB_5960:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5986
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 2" _ ⊢ 0' : %_5513
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5513 ⊢ %_5514 : %_5514
 ; {>  %_5513~0':_stg }
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
; _none {  } ⊢ %_5515 : %_5515
 ; {>  %_5514~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5515
 ; {>  %_5514~0':_stg %_5515~°1◂{  }:(_opn)◂(t2258'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5985
	mov rdi,r13
	call dlt
LB_5985:
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
LB_5986:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5988
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5987
LB_5988:
	add rsp,8
	ret
LB_5989:
	add rsp,0
	pop r14
LB_5987:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_6008
LB_6007:
	add r14,1
LB_6008:
	cmp r14,r10
	jge LB_6009
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6007
	cmp al,10
	jz LB_6007
	cmp al,32
	jz LB_6007
LB_6009:
	add r14,2
	cmp r14,r10
	jg LB_6012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_6012
	jmp LB_6013
LB_6012:
	jmp LB_5995
LB_6013:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_6002
LB_6001:
	add r14,1
LB_6002:
	cmp r14,r10
	jge LB_6003
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6001
	cmp al,10
	jz LB_6001
	cmp al,32
	jz LB_6001
LB_6003:
	push r10
	call NS_E_5457_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6004
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6005
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6005:
	jmp LB_5996
LB_6004:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5999
	btr r12,1
	clc
	jmp LB_6000
LB_5999:
	bts r12,1
	stc
LB_6000:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5997
	btr r12,0
	clc
	jmp LB_5998
LB_5997:
	bts r12,0
	stc
LB_5998:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5992
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6014
	btr r12,2
	jmp LB_6015
LB_6014:
	bts r12,2
LB_6015:
	mov r13,r14
	bt r12,1
	jc LB_6016
	btr r12,0
	jmp LB_6017
LB_6016:
	bts r12,0
LB_6017:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5516 ⊢ %_5517 : %_5517
 ; {>  %_5516~0':_p1485 }
; _some 0' ⊢ °0◂0'
; ∎ %_5517
 ; {>  %_5517~°0◂0':(_opn)◂(_p1485) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5990
	btr r12,3
	jmp LB_5991
LB_5990:
	bts r12,3
LB_5991:
	mov r8,0
	bts r12,2
	ret
LB_5992:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5994
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5993
LB_5994:
	add rsp,8
	ret
LB_5996:
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
LB_5995:
	add rsp,32
	pop r14
LB_5993:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5454:
NS_E_RDI_5454:
NS_E_5454_ETR_TBL:
NS_E_5454_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_6053
LB_6052:
	add r14,1
LB_6053:
	cmp r14,r10
	jge LB_6054
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6052
	cmp al,10
	jz LB_6052
	cmp al,32
	jz LB_6052
LB_6054:
	push r10
	call NS_E_5480_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6055
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6047
LB_6055:
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
LB_6061:
	jmp LB_6058
LB_6057:
	add r14,1
LB_6058:
	cmp r14,r10
	jge LB_6059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6057
	cmp al,10
	jz LB_6057
	cmp al,32
	jz LB_6057
LB_6059:
	push r10
	push rsi
	call NS_E_5480_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6060
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6062
	bts QWORD [rax],0
LB_6062:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6061
LB_6060:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6050
	btr r12,1
	clc
	jmp LB_6051
LB_6050:
	bts r12,1
	stc
LB_6051:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6048
	btr r12,0
	clc
	jmp LB_6049
LB_6048:
	bts r12,0
	stc
LB_6049:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6044
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r11,r8
	bt r12,2
	jc LB_6063
	btr r12,5
	jmp LB_6064
LB_6063:
	bts r12,5
LB_6064:
	mov r8,r14
	bt r12,1
	jc LB_6065
	btr r12,2
	jmp LB_6066
LB_6065:
	bts r12,2
LB_6066:
	mov rcx,r13
	bt r12,0
	jc LB_6067
	btr r12,6
	jmp LB_6068
LB_6067:
	bts r12,6
LB_6068:
; 6' ⊢ { 0' 1' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_6071
	btr r12,7
	clc
	jmp LB_6072
LB_6071:
	bts r12,7
	stc
LB_6072:
	mov r13,rdx
	bt r12,7
	jc LB_6069
	btr r12,0
	jmp LB_6070
LB_6069:
	bts r12,0
LB_6070:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_6075
	btr r12,7
	clc
	jmp LB_6076
LB_6075:
	bts r12,7
	stc
LB_6076:
	mov r14,rdx
	bt r12,7
	jc LB_6073
	btr r12,1
	jmp LB_6074
LB_6073:
	bts r12,1
LB_6074:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f628 %_5519 ⊢ %_5520 : %_5520
 ; {>  %_5518~{ 0' 1' }:{ _stg _p1489 } %_5519~2':(_lst)◂({ _stg _p1489 }) }
; _f628 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_6022
	btr r12,0
	jmp LB_6023
LB_6022:
	bts r12,0
LB_6023:
	call NS_E_628
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_6024
	btr r12,2
	jmp LB_6025
LB_6024:
	bts r12,2
LB_6025:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6020
	btr r12,1
	clc
	jmp LB_6021
LB_6020:
	bts r12,1
	stc
LB_6021:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6018
	btr r12,0
	clc
	jmp LB_6019
LB_6018:
	bts r12,0
	stc
LB_6019:
	add rsp,24
; _cns { %_5518 %_5520 } ⊢ %_5521 : %_5521
 ; {>  %_5520~2':(_lst)◂({ _stg _p1489 }) %_5518~{ 0' 1' }:{ _stg _p1489 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1499 %_5521 ⊢ %_5522 : %_5522
 ; {>  %_5521~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1489 }) }
; _f1499 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_5522 ⊢ %_5523 : %_5523
 ; {>  %_5522~°1◂°0◂{ { 0' 1' } 2' }:_p1485 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_5523
 ; {>  %_5523~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1485) }
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
	jc LB_6034
	btr r12,5
	jmp LB_6035
LB_6034:
	bts r12,5
LB_6035:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6032
	btr QWORD [rdi],0
	jmp LB_6033
LB_6032:
	bts QWORD [rdi],0
LB_6033:
	mov r11,r14
	bt r12,1
	jc LB_6038
	btr r12,5
	jmp LB_6039
LB_6038:
	bts r12,5
LB_6039:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6036
	btr QWORD [rdi],1
	jmp LB_6037
LB_6036:
	bts QWORD [rdi],1
LB_6037:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6030
	btr QWORD [rdi],0
	jmp LB_6031
LB_6030:
	bts QWORD [rdi],0
LB_6031:
	mov r10,r8
	bt r12,2
	jc LB_6042
	btr r12,4
	jmp LB_6043
LB_6042:
	bts r12,4
LB_6043:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6040
	btr QWORD [rdi],1
	jmp LB_6041
LB_6040:
	bts QWORD [rdi],1
LB_6041:
	mov rsi,1
	bt r12,3
	jc LB_6028
	mov rsi,0
	bt r9,0
	jc LB_6028
	jmp LB_6029
LB_6028:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6029:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6026
	mov rsi,0
	bt r9,0
	jc LB_6026
	jmp LB_6027
LB_6026:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6027:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6044:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6046
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6045
LB_6046:
	add rsp,8
	ret
LB_6047:
	add rsp,32
	pop r14
LB_6045:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6078
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 0" _ ⊢ 0' : %_5524
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5524 ⊢ %_5525 : %_5525
 ; {>  %_5524~0':_stg }
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
; _none {  } ⊢ %_5526 : %_5526
 ; {>  %_5525~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5526
 ; {>  %_5525~0':_stg %_5526~°1◂{  }:(_opn)◂(t2277'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6077
	mov rdi,r13
	call dlt
LB_6077:
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
LB_6078:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6080
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6079
LB_6080:
	add rsp,8
	ret
LB_6081:
	add rsp,0
	pop r14
LB_6079:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5455:
NS_E_RDI_5455:
NS_E_5455_ETR_TBL:
NS_E_5455_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_6102
LB_6101:
	add r14,1
LB_6102:
	cmp r14,r10
	jge LB_6103
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6101
	cmp al,10
	jz LB_6101
	cmp al,32
	jz LB_6101
LB_6103:
	add r14,1
	cmp r14,r10
	jg LB_6106
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6106
	jmp LB_6107
LB_6106:
	jmp LB_6089
LB_6107:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_6096
LB_6095:
	add r14,1
LB_6096:
	cmp r14,r10
	jge LB_6097
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6095
	cmp al,10
	jz LB_6095
	cmp al,32
	jz LB_6095
LB_6097:
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6098
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6099
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6099:
	jmp LB_6090
LB_6098:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6093
	btr r12,1
	clc
	jmp LB_6094
LB_6093:
	bts r12,1
	stc
LB_6094:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6091
	btr r12,0
	clc
	jmp LB_6092
LB_6091:
	bts r12,0
	stc
LB_6092:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6086
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6108
	btr r12,2
	jmp LB_6109
LB_6108:
	bts r12,2
LB_6109:
	mov r13,r14
	bt r12,1
	jc LB_6110
	btr r12,0
	jmp LB_6111
LB_6110:
	bts r12,0
LB_6111:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1505 %_5527 ⊢ %_5528 : %_5528
 ; {>  %_5527~0':_p1394 }
; _f1505 0' ⊢ °1◂0'
; _some %_5528 ⊢ %_5529 : %_5529
 ; {>  %_5528~°1◂0':_p1486 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5529
 ; {>  %_5529~°0◂°1◂0':(_opn)◂(_p1486) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6084
	btr r12,3
	jmp LB_6085
LB_6084:
	bts r12,3
LB_6085:
	mov rsi,1
	bt r12,3
	jc LB_6082
	mov rsi,0
	bt r9,0
	jc LB_6082
	jmp LB_6083
LB_6082:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6083:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6086:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6088
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6087
LB_6088:
	add rsp,8
	ret
LB_6090:
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
LB_6089:
	add rsp,32
	pop r14
LB_6087:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_6123
LB_6122:
	add r14,1
LB_6123:
	cmp r14,r10
	jge LB_6124
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6122
	cmp al,10
	jz LB_6122
	cmp al,32
	jz LB_6122
LB_6124:
	push r10
	call NS_E_5456_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6125
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6119
LB_6125:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6120
	btr r12,0
	clc
	jmp LB_6121
LB_6120:
	bts r12,0
	stc
LB_6121:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6116
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1504 %_5530 ⊢ %_5531 : %_5531
 ; {>  %_5530~0':(_lst)◂(_p1485) }
; _f1504 0' ⊢ °0◂0'
; _some %_5531 ⊢ %_5532 : %_5532
 ; {>  %_5531~°0◂0':_p1486 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5532
 ; {>  %_5532~°0◂°0◂0':(_opn)◂(_p1486) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6114
	btr r12,3
	jmp LB_6115
LB_6114:
	bts r12,3
LB_6115:
	mov rsi,1
	bt r12,3
	jc LB_6112
	mov rsi,0
	bt r9,0
	jc LB_6112
	jmp LB_6113
LB_6112:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6113:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6116:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6118
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6117
LB_6118:
	add rsp,8
	ret
LB_6119:
	add rsp,16
	pop r14
LB_6117:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6128
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_5533
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5533 ⊢ %_5534 : %_5534
 ; {>  %_5533~0':_stg }
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
; _none {  } ⊢ %_5535 : %_5535
 ; {>  %_5534~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5535
 ; {>  %_5535~°1◂{  }:(_opn)◂(t2292'(0)) %_5534~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6127
	mov rdi,r13
	call dlt
LB_6127:
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
LB_6128:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6130
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6129
LB_6130:
	add rsp,8
	ret
LB_6131:
	add rsp,0
	pop r14
LB_6129:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5456:
NS_E_RDI_5456:
NS_E_5456_ETR_TBL:
NS_E_5456_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_6141
LB_6140:
	add r14,1
LB_6141:
	cmp r14,r10
	jge LB_6142
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6140
	cmp al,10
	jz LB_6140
	cmp al,32
	jz LB_6140
LB_6142:
	add r14,6
	cmp r14,r10
	jg LB_6145
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_6145
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_6145
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_6145
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_6145
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_6145
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_6145
	jmp LB_6146
LB_6145:
	jmp LB_6137
LB_6146:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6138
	btr r12,0
	clc
	jmp LB_6139
LB_6138:
	bts r12,0
	stc
LB_6139:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6134
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_5536 : %_5536
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5536 ⊢ %_5537 : %_5537
 ; {>  %_5536~°1◂{  }:(_lst)◂(t2296'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5537
 ; {>  %_5537~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2299'(0))) }
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
	jc LB_6132
	mov rsi,0
	bt r9,0
	jc LB_6132
	jmp LB_6133
LB_6132:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6133:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6134:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6136
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6135
LB_6136:
	add rsp,8
	ret
LB_6137:
	add rsp,16
	pop r14
LB_6135:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_6166
LB_6165:
	add r14,1
LB_6166:
	cmp r14,r10
	jge LB_6167
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6165
	cmp al,10
	jz LB_6165
	cmp al,32
	jz LB_6165
LB_6167:
	push r10
	call NS_E_5453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6168
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6160
LB_6168:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_6171
LB_6170:
	add r14,1
LB_6171:
	cmp r14,r10
	jge LB_6172
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6170
	cmp al,10
	jz LB_6170
	cmp al,32
	jz LB_6170
LB_6172:
	push r10
	call NS_E_5456_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6173
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6174
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6174:
	jmp LB_6160
LB_6173:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6163
	btr r12,1
	clc
	jmp LB_6164
LB_6163:
	bts r12,1
	stc
LB_6164:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6161
	btr r12,0
	clc
	jmp LB_6162
LB_6161:
	bts r12,0
	stc
LB_6162:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6157
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5538 %_5539 } ⊢ %_5540 : %_5540
 ; {>  %_5539~1':(_lst)◂(_p1485) %_5538~0':_p1485 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5540 ⊢ %_5541 : %_5541
 ; {>  %_5540~°0◂{ 0' 1' }:(_lst)◂(_p1485) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5541
 ; {>  %_5541~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1485)) }
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
	jc LB_6151
	btr r12,2
	jmp LB_6152
LB_6151:
	bts r12,2
LB_6152:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6149
	btr QWORD [rdi],0
	jmp LB_6150
LB_6149:
	bts QWORD [rdi],0
LB_6150:
	mov r8,r14
	bt r12,1
	jc LB_6155
	btr r12,2
	jmp LB_6156
LB_6155:
	bts r12,2
LB_6156:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6153
	btr QWORD [rdi],1
	jmp LB_6154
LB_6153:
	bts QWORD [rdi],1
LB_6154:
	mov rsi,1
	bt r12,3
	jc LB_6147
	mov rsi,0
	bt r9,0
	jc LB_6147
	jmp LB_6148
LB_6147:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6148:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6157:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6159
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6158
LB_6159:
	add rsp,8
	ret
LB_6160:
	add rsp,32
	pop r14
LB_6158:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5457:
NS_E_RDI_5457:
NS_E_5457_ETR_TBL:
NS_E_5457_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_6231
LB_6230:
	add r14,1
LB_6231:
	cmp r14,r10
	jge LB_6232
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6230
	cmp al,10
	jz LB_6230
	cmp al,32
	jz LB_6230
LB_6232:
	add r14,1
	cmp r14,r10
	jg LB_6235
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6235
	jmp LB_6236
LB_6235:
	jmp LB_6197
LB_6236:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6208
LB_6207:
	add r14,1
LB_6208:
	cmp r14,r10
	jge LB_6209
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6207
	cmp al,10
	jz LB_6207
	cmp al,32
	jz LB_6207
LB_6209:
	add r14,1
	cmp r14,r10
	jg LB_6213
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6213
	jmp LB_6214
LB_6213:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6211
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6211:
	jmp LB_6198
LB_6214:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_6216
LB_6215:
	add r14,1
LB_6216:
	cmp r14,r10
	jge LB_6217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6215
	cmp al,10
	jz LB_6215
	cmp al,32
	jz LB_6215
LB_6217:
	push r10
	call NS_E_5458_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6218
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6219
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6219:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6220
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6220:
	jmp LB_6198
LB_6218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_6223
LB_6222:
	add r14,1
LB_6223:
	cmp r14,r10
	jge LB_6224
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6222
	cmp al,10
	jz LB_6222
	cmp al,32
	jz LB_6222
LB_6224:
	push r10
	call NS_E_5461_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6225
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6226
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6226:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6227
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6227:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6228
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6228:
	jmp LB_6198
LB_6225:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6205
	btr r12,3
	clc
	jmp LB_6206
LB_6205:
	bts r12,3
	stc
LB_6206:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6203
	btr r12,2
	clc
	jmp LB_6204
LB_6203:
	bts r12,2
	stc
LB_6204:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6201
	btr r12,1
	clc
	jmp LB_6202
LB_6201:
	bts r12,1
	stc
LB_6202:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6199
	btr r12,0
	clc
	jmp LB_6200
LB_6199:
	bts r12,0
	stc
LB_6200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6194
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6237
	btr r12,4
	jmp LB_6238
LB_6237:
	bts r12,4
LB_6238:
	mov r8,r9
	bt r12,3
	jc LB_6239
	btr r12,2
	jmp LB_6240
LB_6239:
	bts r12,2
LB_6240:
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
	jc LB_6243
	btr r12,3
	clc
	jmp LB_6244
LB_6243:
	bts r12,3
	stc
LB_6244:
	mov r13,r9
	bt r12,3
	jc LB_6241
	btr r12,0
	jmp LB_6242
LB_6241:
	bts r12,0
LB_6242:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6247
	btr r12,3
	clc
	jmp LB_6248
LB_6247:
	bts r12,3
	stc
LB_6248:
	mov r14,r9
	bt r12,3
	jc LB_6245
	btr r12,1
	jmp LB_6246
LB_6245:
	bts r12,1
LB_6246:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5542 %_5543 } ⊢ %_5544 : %_5544
 ; {>  %_5543~2':(_lst)◂({ _stg _p1488 }) %_5542~{ 0' 1' }:{ _stg _p1488 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1503 %_5544 ⊢ %_5545 : %_5545
 ; {>  %_5544~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1488 }) }
; _f1503 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_5545 ⊢ %_5546 : %_5546
 ; {>  %_5545~°5◂°0◂{ { 0' 1' } 2' }:_p1485 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_5546
 ; {>  %_5546~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1485) }
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
	jc LB_6184
	btr r12,5
	jmp LB_6185
LB_6184:
	bts r12,5
LB_6185:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6182
	btr QWORD [rdi],0
	jmp LB_6183
LB_6182:
	bts QWORD [rdi],0
LB_6183:
	mov r11,r14
	bt r12,1
	jc LB_6188
	btr r12,5
	jmp LB_6189
LB_6188:
	bts r12,5
LB_6189:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6186
	btr QWORD [rdi],1
	jmp LB_6187
LB_6186:
	bts QWORD [rdi],1
LB_6187:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6180
	btr QWORD [rdi],0
	jmp LB_6181
LB_6180:
	bts QWORD [rdi],0
LB_6181:
	mov r10,r8
	bt r12,2
	jc LB_6192
	btr r12,4
	jmp LB_6193
LB_6192:
	bts r12,4
LB_6193:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6190
	btr QWORD [rdi],1
	jmp LB_6191
LB_6190:
	bts QWORD [rdi],1
LB_6191:
	mov rsi,1
	bt r12,3
	jc LB_6178
	mov rsi,0
	bt r9,0
	jc LB_6178
	jmp LB_6179
LB_6178:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6179:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6176
	mov rsi,0
	bt r9,0
	jc LB_6176
	jmp LB_6177
LB_6176:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6177:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6194:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6196
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6195
LB_6196:
	add rsp,8
	ret
LB_6198:
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
LB_6197:
	add rsp,64
	pop r14
LB_6195:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_6266
LB_6265:
	add r14,1
LB_6266:
	cmp r14,r10
	jge LB_6267
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6265
	cmp al,10
	jz LB_6265
	cmp al,32
	jz LB_6265
LB_6267:
	push r10
	call NS_E_5458_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6268
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6262
LB_6268:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6263
	btr r12,0
	clc
	jmp LB_6264
LB_6263:
	bts r12,0
	stc
LB_6264:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6259
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r11,r14
	bt r12,1
	jc LB_6270
	btr r12,5
	jmp LB_6271
LB_6270:
	bts r12,5
LB_6271:
	mov r10,r13
	bt r12,0
	jc LB_6272
	btr r12,4
	jmp LB_6273
LB_6272:
	bts r12,4
LB_6273:
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_6276
	btr r12,6
	clc
	jmp LB_6277
LB_6276:
	bts r12,6
	stc
LB_6277:
	mov r13,rcx
	bt r12,6
	jc LB_6274
	btr r12,0
	jmp LB_6275
LB_6274:
	bts r12,0
LB_6275:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_6280
	btr r12,6
	clc
	jmp LB_6281
LB_6280:
	bts r12,6
	stc
LB_6281:
	mov r14,rcx
	bt r12,6
	jc LB_6278
	btr r12,1
	jmp LB_6279
LB_6278:
	bts r12,1
LB_6279:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1502 %_5547 ⊢ %_5548 : %_5548
 ; {>  %_5547~{ 0' 1' }:{ _stg _p1488 } }
; _f1502 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_5548 ⊢ %_5549 : %_5549
 ; {>  %_5548~°4◂{ 0' 1' }:_p1485 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_5549
 ; {>  %_5549~°0◂°4◂{ 0' 1' }:(_opn)◂(_p1485) }
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
	jc LB_6253
	btr r12,2
	jmp LB_6254
LB_6253:
	bts r12,2
LB_6254:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6251
	btr QWORD [rdi],0
	jmp LB_6252
LB_6251:
	bts QWORD [rdi],0
LB_6252:
	mov r8,r14
	bt r12,1
	jc LB_6257
	btr r12,2
	jmp LB_6258
LB_6257:
	bts r12,2
LB_6258:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6255
	btr QWORD [rdi],1
	jmp LB_6256
LB_6255:
	bts QWORD [rdi],1
LB_6256:
	mov rsi,1
	bt r12,3
	jc LB_6249
	mov rsi,0
	bt r9,0
	jc LB_6249
	jmp LB_6250
LB_6249:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6250:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6259:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6261
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6260
LB_6261:
	add rsp,8
	ret
LB_6262:
	add rsp,16
	pop r14
LB_6260:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6283
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "dt_etr 0" _ ⊢ 0' : %_5550
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5550 ⊢ %_5551 : %_5551
 ; {>  %_5550~0':_stg }
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
; _none {  } ⊢ %_5552 : %_5552
 ; {>  %_5551~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5552
 ; {>  %_5551~0':_stg %_5552~°1◂{  }:(_opn)◂(t2323'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6282
	mov rdi,r13
	call dlt
LB_6282:
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
LB_6283:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6285
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6284
LB_6285:
	add rsp,8
	ret
LB_6286:
	add rsp,0
	pop r14
LB_6284:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5458:
NS_E_RDI_5458:
NS_E_5458_ETR_TBL:
NS_E_5458_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_6320
LB_6319:
	add r14,1
LB_6320:
	cmp r14,r10
	jge LB_6321
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6319
	cmp al,10
	jz LB_6319
	cmp al,32
	jz LB_6319
LB_6321:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6322
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6301
LB_6322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_6325
LB_6324:
	add r14,1
LB_6325:
	cmp r14,r10
	jge LB_6326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6324
	cmp al,10
	jz LB_6324
	cmp al,32
	jz LB_6324
LB_6326:
	push r10
	call NS_E_5460_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6327
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6328
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6328:
	jmp LB_6301
LB_6327:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_6331
LB_6330:
	add r14,1
LB_6331:
	cmp r14,r10
	jge LB_6332
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6330
	cmp al,10
	jz LB_6330
	cmp al,32
	jz LB_6330
LB_6332:
	add r14,1
	cmp r14,r10
	jg LB_6337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6337
	jmp LB_6338
LB_6337:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6334
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6335:
	jmp LB_6301
LB_6338:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_6312
LB_6311:
	add r14,1
LB_6312:
	cmp r14,r10
	jge LB_6313
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6311
	cmp al,10
	jz LB_6311
	cmp al,32
	jz LB_6311
LB_6313:
	push r10
	call NS_E_5137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6314
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6315
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6315:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6316
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6316:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6317
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6317:
	jmp LB_6302
LB_6314:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6309
	btr r12,3
	clc
	jmp LB_6310
LB_6309:
	bts r12,3
	stc
LB_6310:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6307
	btr r12,2
	clc
	jmp LB_6308
LB_6307:
	bts r12,2
	stc
LB_6308:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6305
	btr r12,1
	clc
	jmp LB_6306
LB_6305:
	bts r12,1
	stc
LB_6306:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6303
	btr r12,0
	clc
	jmp LB_6304
LB_6303:
	bts r12,0
	stc
LB_6304:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6298
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6339
	btr r12,4
	jmp LB_6340
LB_6339:
	bts r12,4
LB_6340:
	mov r8,r9
	bt r12,3
	jc LB_6341
	btr r12,2
	jmp LB_6342
LB_6341:
	bts r12,2
LB_6342:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1510 %_5555 ⊢ %_5556 : %_5556
 ; {>  %_5555~2':_p1497 %_5554~1':_p5459 %_5553~0':_stg }
; _f1510 2' ⊢ °1◂2'
; _some { %_5553 %_5556 } ⊢ %_5557 : %_5557
 ; {>  %_5554~1':_p5459 %_5556~°1◂2':_p1488 %_5553~0':_stg }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_5557
 ; {>  %_5554~1':_p5459 %_5557~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p1488 }) }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_6287
	mov rdi,r14
	call dlt
LB_6287:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_6290
	btr r12,1
	jmp LB_6291
LB_6290:
	bts r12,1
LB_6291:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_6288
	btr QWORD [rdi],0
	jmp LB_6289
LB_6288:
	bts QWORD [rdi],0
LB_6289:
	mov r14,r8
	bt r12,2
	jc LB_6296
	btr r12,1
	jmp LB_6297
LB_6296:
	bts r12,1
LB_6297:
	mov rsi,1
	bt r12,1
	jc LB_6294
	mov rsi,0
	bt r14,0
	jc LB_6294
	jmp LB_6295
LB_6294:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_6295:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_6292
	btr QWORD [rdi],1
	jmp LB_6293
LB_6292:
	bts QWORD [rdi],1
LB_6293:
	mov r8,0
	bts r12,2
	ret
LB_6298:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6300
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6299
LB_6300:
	add rsp,8
	ret
LB_6302:
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
LB_6301:
	add rsp,64
	pop r14
LB_6299:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_6389
LB_6388:
	add r14,1
LB_6389:
	cmp r14,r10
	jge LB_6390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6388
	cmp al,10
	jz LB_6388
	cmp al,32
	jz LB_6388
LB_6390:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6391
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6373
LB_6391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_6394
LB_6393:
	add r14,1
LB_6394:
	cmp r14,r10
	jge LB_6395
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6393
	cmp al,10
	jz LB_6393
	cmp al,32
	jz LB_6393
LB_6395:
	push r10
	call NS_E_5460_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6396
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6397:
	jmp LB_6373
LB_6396:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_6400
LB_6399:
	add r14,1
LB_6400:
	cmp r14,r10
	jge LB_6401
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6399
	cmp al,10
	jz LB_6399
	cmp al,32
	jz LB_6399
LB_6401:
	add r14,3
	cmp r14,r10
	jg LB_6406
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6406
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6406
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6406
	jmp LB_6407
LB_6406:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6403
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6403:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6404
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6404:
	jmp LB_6373
LB_6407:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_6409
LB_6408:
	add r14,1
LB_6409:
	cmp r14,r10
	jge LB_6410
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6408
	cmp al,10
	jz LB_6408
	cmp al,32
	jz LB_6408
LB_6410:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6411
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6412
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6412:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6413
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6413:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6414
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6414:
	jmp LB_6373
LB_6411:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_6417
LB_6416:
	add r14,1
LB_6417:
	cmp r14,r10
	jge LB_6418
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6416
	cmp al,10
	jz LB_6416
	cmp al,32
	jz LB_6416
LB_6418:
	add r14,1
	cmp r14,r10
	jg LB_6425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6425
	jmp LB_6426
LB_6425:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6420
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6420:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6421
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6421:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6422
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6422:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6423
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6423:
	jmp LB_6373
LB_6426:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_6428
LB_6427:
	add r14,1
LB_6428:
	cmp r14,r10
	jge LB_6429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6427
	cmp al,10
	jz LB_6427
	cmp al,32
	jz LB_6427
LB_6429:
	push r10
	call NS_E_5137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6430
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_6431
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_6431:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6432
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6432:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6433
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6433:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6434
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6434:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6435
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6435:
	jmp LB_6373
LB_6430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_6438
LB_6437:
	add r14,1
LB_6438:
	cmp r14,r10
	jge LB_6439
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6437
	cmp al,10
	jz LB_6437
	cmp al,32
	jz LB_6437
LB_6439:
	push r10
	call NS_E_5462_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6440
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_6441
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_6441:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_6442
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_6442:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6443
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6443:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6444
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6444:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6445
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6445:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6446
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6446:
	jmp LB_6373
LB_6440:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rdx,rsi
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_6386
	btr r12,6
	clc
	jmp LB_6387
LB_6386:
	bts r12,6
	stc
LB_6387:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6384
	btr r12,5
	clc
	jmp LB_6385
LB_6384:
	bts r12,5
	stc
LB_6385:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6382
	btr r12,4
	clc
	jmp LB_6383
LB_6382:
	bts r12,4
	stc
LB_6383:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6380
	btr r12,3
	clc
	jmp LB_6381
LB_6380:
	bts r12,3
	stc
LB_6381:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6378
	btr r12,2
	clc
	jmp LB_6379
LB_6378:
	bts r12,2
	stc
LB_6379:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6376
	btr r12,1
	clc
	jmp LB_6377
LB_6376:
	bts r12,1
	stc
LB_6377:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6374
	btr r12,0
	clc
	jmp LB_6375
LB_6374:
	bts r12,0
	stc
LB_6375:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_6370
; _emt_mov_ptn_to_ptn:{| 11111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdi,r10
	mov QWORD [st_vct+8*10],rdi
	bt r12,4
	jc LB_6448
	btr r12,10
	jmp LB_6449
LB_6448:
	bts r12,10
LB_6449:
	mov r10,rcx
	bt r12,6
	jc LB_6450
	btr r12,4
	jmp LB_6451
LB_6450:
	bts r12,4
LB_6451:
	mov rcx,r9
	bt r12,3
	jc LB_6452
	btr r12,6
	jmp LB_6453
LB_6452:
	bts r12,6
LB_6453:
	mov r9,r11
	bt r12,5
	jc LB_6454
	btr r12,3
	jmp LB_6455
LB_6454:
	bts r12,3
LB_6455:
	mov r11,r8
	bt r12,2
	jc LB_6456
	btr r12,5
	jmp LB_6457
LB_6456:
	bts r12,5
LB_6457:
	mov r8,rcx
	bt r12,6
	jc LB_6458
	btr r12,2
	jmp LB_6459
LB_6458:
	bts r12,2
LB_6459:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 10' ⊢ {  }
	mov rdi,QWORD [st_vct+8*10]
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,7
	bts r12,8
	bts r12,9
; _cns { { %_5560 %_5561 } %_5562 } ⊢ %_5563 : %_5563
 ; {>  %_5559~1':_p5459 %_5560~2':_stg %_5562~4':(_lst)◂({ _stg _p1497 }) %_5558~0':_stg %_5561~3':_p1497 }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f1509 %_5563 ⊢ %_5564 : %_5564
 ; {>  %_5563~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p1497 }) %_5559~1':_p5459 %_5558~0':_stg }
; _f1509 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_5558 %_5564 } ⊢ %_5565 : %_5565
 ; {>  %_5559~1':_p5459 %_5558~0':_stg %_5564~°0◂°0◂{ { 2' 3' } 4' }:_p1488 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_5565
 ; {>  %_5565~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p1488 }) %_5559~1':_p5459 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_6343
	mov rdi,r14
	call dlt
LB_6343:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_6344
	btr r12,1
	jmp LB_6345
LB_6344:
	bts r12,1
LB_6345:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_6348
	btr r12,5
	jmp LB_6349
LB_6348:
	bts r12,5
LB_6349:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6346
	btr QWORD [rdi],0
	jmp LB_6347
LB_6346:
	bts QWORD [rdi],0
LB_6347:
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
	jc LB_6360
	btr r12,6
	jmp LB_6361
LB_6360:
	bts r12,6
LB_6361:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_6358
	btr QWORD [rdi],0
	jmp LB_6359
LB_6358:
	bts QWORD [rdi],0
LB_6359:
	mov rcx,r14
	bt r12,1
	jc LB_6364
	btr r12,6
	jmp LB_6365
LB_6364:
	bts r12,6
LB_6365:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_6362
	btr QWORD [rdi],1
	jmp LB_6363
LB_6362:
	bts QWORD [rdi],1
LB_6363:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_6356
	btr QWORD [rdi],0
	jmp LB_6357
LB_6356:
	bts QWORD [rdi],0
LB_6357:
	mov r13,r10
	bt r12,4
	jc LB_6368
	btr r12,0
	jmp LB_6369
LB_6368:
	bts r12,0
LB_6369:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_6366
	btr QWORD [rdi],1
	jmp LB_6367
LB_6366:
	bts QWORD [rdi],1
LB_6367:
	mov rsi,1
	bt r12,5
	jc LB_6354
	mov rsi,0
	bt r11,0
	jc LB_6354
	jmp LB_6355
LB_6354:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6355:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_6352
	mov rsi,0
	bt r11,0
	jc LB_6352
	jmp LB_6353
LB_6352:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6353:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6350
	btr QWORD [rdi],1
	jmp LB_6351
LB_6350:
	bts QWORD [rdi],1
LB_6351:
	mov r8,0
	bts r12,2
	ret
LB_6370:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6372
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6371
LB_6372:
	add rsp,8
	ret
LB_6373:
	add rsp,112
	pop r14
LB_6371:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5460:
NS_E_RDI_5460:
NS_E_5460_ETR_TBL:
NS_E_5460_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_6474
LB_6473:
	add r14,1
LB_6474:
	cmp r14,r10
	jge LB_6475
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6473
	cmp al,10
	jz LB_6473
	cmp al,32
	jz LB_6473
LB_6475:
	add r14,3
	cmp r14,r10
	jg LB_6478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6478
	jmp LB_6479
LB_6478:
	jmp LB_6460
LB_6479:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_6468
LB_6467:
	add r14,1
LB_6468:
	cmp r14,r10
	jge LB_6469
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6467
	cmp al,10
	jz LB_6467
	cmp al,32
	jz LB_6467
LB_6469:
	push r10
	call NS_E_5141_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6470
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6471:
	jmp LB_6461
LB_6470:
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
	jc LB_6464
	btr QWORD [rdi],1
LB_6464:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6465
	btr QWORD [rdi],0
LB_6465:
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
LB_6461:
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
LB_6460:
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
LB_6462:
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
NS_E_5461:
NS_E_RDI_5461:
NS_E_5461_ETR_TBL:
NS_E_5461_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_6533
LB_6532:
	add r14,1
LB_6533:
	cmp r14,r10
	jge LB_6534
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6532
	cmp al,10
	jz LB_6532
	cmp al,32
	jz LB_6532
LB_6534:
	add r14,1
	cmp r14,r10
	jg LB_6537
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6537
	jmp LB_6538
LB_6537:
	jmp LB_6499
LB_6538:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6510
LB_6509:
	add r14,1
LB_6510:
	cmp r14,r10
	jge LB_6511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6509
	cmp al,10
	jz LB_6509
	cmp al,32
	jz LB_6509
LB_6511:
	add r14,1
	cmp r14,r10
	jg LB_6515
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6515
	jmp LB_6516
LB_6515:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6513
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6513:
	jmp LB_6500
LB_6516:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_6518
LB_6517:
	add r14,1
LB_6518:
	cmp r14,r10
	jge LB_6519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6517
	cmp al,10
	jz LB_6517
	cmp al,32
	jz LB_6517
LB_6519:
	push r10
	call NS_E_5458_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6520
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6521
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6521:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6522
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6522:
	jmp LB_6500
LB_6520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_6525
LB_6524:
	add r14,1
LB_6525:
	cmp r14,r10
	jge LB_6526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6524
	cmp al,10
	jz LB_6524
	cmp al,32
	jz LB_6524
LB_6526:
	push r10
	call NS_E_5461_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6527
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6528
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6528:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6529
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6529:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6530
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6530:
	jmp LB_6500
LB_6527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6507
	btr r12,3
	clc
	jmp LB_6508
LB_6507:
	bts r12,3
	stc
LB_6508:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6505
	btr r12,2
	clc
	jmp LB_6506
LB_6505:
	bts r12,2
	stc
LB_6506:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6503
	btr r12,1
	clc
	jmp LB_6504
LB_6503:
	bts r12,1
	stc
LB_6504:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6501
	btr r12,0
	clc
	jmp LB_6502
LB_6501:
	bts r12,0
	stc
LB_6502:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6496
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6539
	btr r12,4
	jmp LB_6540
LB_6539:
	bts r12,4
LB_6540:
	mov r8,r9
	bt r12,3
	jc LB_6541
	btr r12,2
	jmp LB_6542
LB_6541:
	bts r12,2
LB_6542:
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
	jc LB_6545
	btr r12,3
	clc
	jmp LB_6546
LB_6545:
	bts r12,3
	stc
LB_6546:
	mov r13,r9
	bt r12,3
	jc LB_6543
	btr r12,0
	jmp LB_6544
LB_6543:
	bts r12,0
LB_6544:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6549
	btr r12,3
	clc
	jmp LB_6550
LB_6549:
	bts r12,3
	stc
LB_6550:
	mov r14,r9
	bt r12,3
	jc LB_6547
	btr r12,1
	jmp LB_6548
LB_6547:
	bts r12,1
LB_6548:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5568 %_5569 } ⊢ %_5570 : %_5570
 ; {>  %_5569~2':(_lst)◂({ _stg _p1488 }) %_5568~{ 0' 1' }:{ _stg _p1488 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_5570 ⊢ %_5571 : %_5571
 ; {>  %_5570~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1488 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_5571
 ; {>  %_5571~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1488 })) }
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
	jc LB_6486
	btr r12,5
	jmp LB_6487
LB_6486:
	bts r12,5
LB_6487:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6484
	btr QWORD [rdi],0
	jmp LB_6485
LB_6484:
	bts QWORD [rdi],0
LB_6485:
	mov r11,r14
	bt r12,1
	jc LB_6490
	btr r12,5
	jmp LB_6491
LB_6490:
	bts r12,5
LB_6491:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6488
	btr QWORD [rdi],1
	jmp LB_6489
LB_6488:
	bts QWORD [rdi],1
LB_6489:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6482
	btr QWORD [rdi],0
	jmp LB_6483
LB_6482:
	bts QWORD [rdi],0
LB_6483:
	mov r10,r8
	bt r12,2
	jc LB_6494
	btr r12,4
	jmp LB_6495
LB_6494:
	bts r12,4
LB_6495:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6492
	btr QWORD [rdi],1
	jmp LB_6493
LB_6492:
	bts QWORD [rdi],1
LB_6493:
	mov rsi,1
	bt r12,3
	jc LB_6480
	mov rsi,0
	bt r9,0
	jc LB_6480
	jmp LB_6481
LB_6480:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6481:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6496:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6498
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6497
LB_6498:
	add rsp,8
	ret
LB_6500:
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
LB_6499:
	add rsp,64
	pop r14
LB_6497:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6553
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5572 : %_5572
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5572 ⊢ %_5573 : %_5573
 ; {>  %_5572~°1◂{  }:(_lst)◂(t2350'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5573
 ; {>  %_5573~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2353'(0))) }
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
	jc LB_6551
	mov rsi,0
	bt r9,0
	jc LB_6551
	jmp LB_6552
LB_6551:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6552:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6553:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6555
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6554
LB_6555:
	add rsp,8
	ret
LB_6556:
	add rsp,0
	pop r14
LB_6554:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5462:
NS_E_RDI_5462:
NS_E_5462_ETR_TBL:
NS_E_5462_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_6621
LB_6620:
	add r14,1
LB_6621:
	cmp r14,r10
	jge LB_6622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6620
	cmp al,10
	jz LB_6620
	cmp al,32
	jz LB_6620
LB_6622:
	add r14,3
	cmp r14,r10
	jg LB_6625
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6625
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6625
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6625
	jmp LB_6626
LB_6625:
	jmp LB_6576
LB_6626:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6589
LB_6588:
	add r14,1
LB_6589:
	cmp r14,r10
	jge LB_6590
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6588
	cmp al,10
	jz LB_6588
	cmp al,32
	jz LB_6588
LB_6590:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6591
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6592
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6592:
	jmp LB_6577
LB_6591:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_6595
LB_6594:
	add r14,1
LB_6595:
	cmp r14,r10
	jge LB_6596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6594
	cmp al,10
	jz LB_6594
	cmp al,32
	jz LB_6594
LB_6596:
	add r14,1
	cmp r14,r10
	jg LB_6601
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6601
	jmp LB_6602
LB_6601:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6598
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6598:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6599
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6599:
	jmp LB_6577
LB_6602:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_6604
LB_6603:
	add r14,1
LB_6604:
	cmp r14,r10
	jge LB_6605
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6603
	cmp al,10
	jz LB_6603
	cmp al,32
	jz LB_6603
LB_6605:
	push r10
	call NS_E_5137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6606
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6607
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6607:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6608
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6608:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6609
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6609:
	jmp LB_6577
LB_6606:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_6612
LB_6611:
	add r14,1
LB_6612:
	cmp r14,r10
	jge LB_6613
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6611
	cmp al,10
	jz LB_6611
	cmp al,32
	jz LB_6611
LB_6613:
	push r10
	call NS_E_5462_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6614
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6615
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6615:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6616
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6616:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6617
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6617:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6618
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6618:
	jmp LB_6577
LB_6614:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6586
	btr r12,4
	clc
	jmp LB_6587
LB_6586:
	bts r12,4
	stc
LB_6587:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6584
	btr r12,3
	clc
	jmp LB_6585
LB_6584:
	bts r12,3
	stc
LB_6585:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6582
	btr r12,2
	clc
	jmp LB_6583
LB_6582:
	bts r12,2
	stc
LB_6583:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6580
	btr r12,1
	clc
	jmp LB_6581
LB_6580:
	bts r12,1
	stc
LB_6581:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6578
	btr r12,0
	clc
	jmp LB_6579
LB_6578:
	bts r12,0
	stc
LB_6579:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6573
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_6627
	btr r12,5
	jmp LB_6628
LB_6627:
	bts r12,5
LB_6628:
	mov r8,r10
	bt r12,4
	jc LB_6629
	btr r12,2
	jmp LB_6630
LB_6629:
	bts r12,2
LB_6630:
	mov r10,r14
	bt r12,1
	jc LB_6631
	btr r12,4
	jmp LB_6632
LB_6631:
	bts r12,4
LB_6632:
	mov r14,r9
	bt r12,3
	jc LB_6633
	btr r12,1
	jmp LB_6634
LB_6633:
	bts r12,1
LB_6634:
	mov r9,r13
	bt r12,0
	jc LB_6635
	btr r12,3
	jmp LB_6636
LB_6635:
	bts r12,3
LB_6636:
	mov r13,r10
	bt r12,4
	jc LB_6637
	btr r12,0
	jmp LB_6638
LB_6637:
	bts r12,0
LB_6638:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_5574 %_5575 } %_5576 } ⊢ %_5577 : %_5577
 ; {>  %_5575~1':_p1497 %_5574~0':_stg %_5576~2':(_lst)◂({ _stg _p1497 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_5577 ⊢ %_5578 : %_5578
 ; {>  %_5577~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1497 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_5578
 ; {>  %_5578~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1497 })) }
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
	jc LB_6563
	btr r12,5
	jmp LB_6564
LB_6563:
	bts r12,5
LB_6564:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6561
	btr QWORD [rdi],0
	jmp LB_6562
LB_6561:
	bts QWORD [rdi],0
LB_6562:
	mov r11,r14
	bt r12,1
	jc LB_6567
	btr r12,5
	jmp LB_6568
LB_6567:
	bts r12,5
LB_6568:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6565
	btr QWORD [rdi],1
	jmp LB_6566
LB_6565:
	bts QWORD [rdi],1
LB_6566:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6559
	btr QWORD [rdi],0
	jmp LB_6560
LB_6559:
	bts QWORD [rdi],0
LB_6560:
	mov r10,r8
	bt r12,2
	jc LB_6571
	btr r12,4
	jmp LB_6572
LB_6571:
	bts r12,4
LB_6572:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6569
	btr QWORD [rdi],1
	jmp LB_6570
LB_6569:
	bts QWORD [rdi],1
LB_6570:
	mov rsi,1
	bt r12,3
	jc LB_6557
	mov rsi,0
	bt r9,0
	jc LB_6557
	jmp LB_6558
LB_6557:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6558:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6573:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6575
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6574
LB_6575:
	add rsp,8
	ret
LB_6577:
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
LB_6576:
	add rsp,80
	pop r14
LB_6574:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6641
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5579 : %_5579
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5579 ⊢ %_5580 : %_5580
 ; {>  %_5579~°1◂{  }:(_lst)◂(t2364'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5580
 ; {>  %_5580~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2367'(0))) }
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
	jc LB_6639
	mov rsi,0
	bt r9,0
	jc LB_6639
	jmp LB_6640
LB_6639:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6640:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6641:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6643
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6642
LB_6643:
	add rsp,8
	ret
LB_6644:
	add rsp,0
	pop r14
LB_6642:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5463:
NS_E_RDI_5463:
NS_E_5463_ETR_TBL:
NS_E_5463_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
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
	add r14,1
	cmp r14,r10
	jg LB_6739
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6739
	jmp LB_6740
LB_6739:
	jmp LB_6682
LB_6740:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6697
LB_6696:
	add r14,1
LB_6697:
	cmp r14,r10
	jge LB_6698
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6696
	cmp al,10
	jz LB_6696
	cmp al,32
	jz LB_6696
LB_6698:
	add r14,1
	cmp r14,r10
	jg LB_6702
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6702
	jmp LB_6703
LB_6702:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6700
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6700:
	jmp LB_6683
LB_6703:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6705
LB_6704:
	add r14,1
LB_6705:
	cmp r14,r10
	jge LB_6706
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6704
	cmp al,10
	jz LB_6704
	cmp al,32
	jz LB_6704
LB_6706:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6707
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6708
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6708:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6709
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6709:
	jmp LB_6683
LB_6707:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_6712
LB_6711:
	add r14,1
LB_6712:
	cmp r14,r10
	jge LB_6713
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6711
	cmp al,10
	jz LB_6711
	cmp al,32
	jz LB_6711
LB_6713:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6714
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6715
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6715:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6716
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6716:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6717
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6717:
	jmp LB_6683
LB_6714:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_6720
LB_6719:
	add r14,1
LB_6720:
	cmp r14,r10
	jge LB_6721
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6719
	cmp al,10
	jz LB_6719
	cmp al,32
	jz LB_6719
LB_6721:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6722
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6723
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6723:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6724
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6724:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6725
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6725:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6726
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6726:
	jmp LB_6683
LB_6722:
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
LB_6732:
	jmp LB_6729
LB_6728:
	add r14,1
LB_6729:
	cmp r14,r10
	jge LB_6730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6728
	cmp al,10
	jz LB_6728
	cmp al,32
	jz LB_6728
LB_6730:
	push r10
	push rsi
	call NS_E_5464_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6731
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6733
	bts QWORD [rax],0
LB_6733:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6732
LB_6731:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6694
	btr r12,5
	clc
	jmp LB_6695
LB_6694:
	bts r12,5
	stc
LB_6695:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6692
	btr r12,4
	clc
	jmp LB_6693
LB_6692:
	bts r12,4
	stc
LB_6693:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6690
	btr r12,3
	clc
	jmp LB_6691
LB_6690:
	bts r12,3
	stc
LB_6691:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6688
	btr r12,2
	clc
	jmp LB_6689
LB_6688:
	bts r12,2
	stc
LB_6689:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6686
	btr r12,1
	clc
	jmp LB_6687
LB_6686:
	bts r12,1
	stc
LB_6687:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6684
	btr r12,0
	clc
	jmp LB_6685
LB_6684:
	bts r12,0
	stc
LB_6685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_6679
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_6741
	btr r12,6
	jmp LB_6742
LB_6741:
	bts r12,6
LB_6742:
	mov r9,r11
	bt r12,5
	jc LB_6743
	btr r12,3
	jmp LB_6744
LB_6743:
	bts r12,3
LB_6744:
	mov r11,r8
	bt r12,2
	jc LB_6745
	btr r12,5
	jmp LB_6746
LB_6745:
	bts r12,5
LB_6746:
	mov r8,r10
	bt r12,4
	jc LB_6747
	btr r12,2
	jmp LB_6748
LB_6747:
	bts r12,2
LB_6748:
	mov r10,r14
	bt r12,1
	jc LB_6749
	btr r12,4
	jmp LB_6750
LB_6749:
	bts r12,4
LB_6750:
	mov r14,rcx
	bt r12,6
	jc LB_6751
	btr r12,1
	jmp LB_6752
LB_6751:
	bts r12,1
LB_6752:
	mov rcx,r13
	bt r12,0
	jc LB_6753
	btr r12,6
	jmp LB_6754
LB_6753:
	bts r12,6
LB_6754:
	mov r13,r11
	bt r12,5
	jc LB_6755
	btr r12,0
	jmp LB_6756
LB_6755:
	bts r12,0
LB_6756:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f628 %_5584 ⊢ %_5585 : %_5585
 ; {>  %_5583~2':(_p1452)◂(_stg) %_5584~3':(_lst)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) %_5582~1':(_p1439)◂((_p1447)◂(_stg)) %_5581~0':_stg }
; _f628 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_6651
	btr r12,0
	jmp LB_6652
LB_6651:
	bts r12,0
LB_6652:
	call NS_E_628
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_6653
	btr r12,3
	jmp LB_6654
LB_6653:
	bts r12,3
LB_6654:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_6649
	btr r12,2
	clc
	jmp LB_6650
LB_6649:
	bts r12,2
	stc
LB_6650:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6647
	btr r12,1
	clc
	jmp LB_6648
LB_6647:
	bts r12,1
	stc
LB_6648:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6645
	btr r12,0
	clc
	jmp LB_6646
LB_6645:
	bts r12,0
	stc
LB_6646:
	add rsp,32
; _cns { { %_5581 %_5582 %_5583 } %_5585 } ⊢ %_5586 : %_5586
 ; {>  %_5585~3':(_lst)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) %_5583~2':(_p1452)◂(_stg) %_5582~1':(_p1439)◂((_p1447)◂(_stg)) %_5581~0':_stg }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f1501 %_5586 ⊢ %_5587 : %_5587
 ; {>  %_5586~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) }
; _f1501 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_5587 ⊢ %_5588 : %_5588
 ; {>  %_5587~°3◂°0◂{ { 0' 1' 2' } 3' }:_p1485 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_5588
 ; {>  %_5588~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p1485) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6655
	btr r12,4
	jmp LB_6656
LB_6655:
	bts r12,4
LB_6656:
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
	jc LB_6665
	btr r12,6
	jmp LB_6666
LB_6665:
	bts r12,6
LB_6666:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_6663
	btr QWORD [rdi],0
	jmp LB_6664
LB_6663:
	bts QWORD [rdi],0
LB_6664:
	mov rcx,r14
	bt r12,1
	jc LB_6669
	btr r12,6
	jmp LB_6670
LB_6669:
	bts r12,6
LB_6670:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_6667
	btr QWORD [rdi],1
	jmp LB_6668
LB_6667:
	bts QWORD [rdi],1
LB_6668:
	mov rcx,r8
	bt r12,2
	jc LB_6673
	btr r12,6
	jmp LB_6674
LB_6673:
	bts r12,6
LB_6674:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_6671
	btr QWORD [rdi],2
	jmp LB_6672
LB_6671:
	bts QWORD [rdi],2
LB_6672:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6661
	btr QWORD [rdi],0
	jmp LB_6662
LB_6661:
	bts QWORD [rdi],0
LB_6662:
	mov r11,r10
	bt r12,4
	jc LB_6677
	btr r12,5
	jmp LB_6678
LB_6677:
	bts r12,5
LB_6678:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6675
	btr QWORD [rdi],1
	jmp LB_6676
LB_6675:
	bts QWORD [rdi],1
LB_6676:
	mov rsi,1
	bt r12,3
	jc LB_6659
	mov rsi,0
	bt r9,0
	jc LB_6659
	jmp LB_6660
LB_6659:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6660:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6657
	mov rsi,0
	bt r9,0
	jc LB_6657
	jmp LB_6658
LB_6657:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6658:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6679:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6681
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6680
LB_6681:
	add rsp,8
	ret
LB_6683:
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
LB_6682:
	add rsp,96
	pop r14
LB_6680:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
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
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6778
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6770
LB_6778:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_6781
LB_6780:
	add r14,1
LB_6781:
	cmp r14,r10
	jge LB_6782
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6780
	cmp al,10
	jz LB_6780
	cmp al,32
	jz LB_6780
LB_6782:
	push r10
	call NS_E_5465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6783
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6784
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6784:
	jmp LB_6770
LB_6783:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6773
	btr r12,1
	clc
	jmp LB_6774
LB_6773:
	bts r12,1
	stc
LB_6774:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6771
	btr r12,0
	clc
	jmp LB_6772
LB_6771:
	bts r12,0
	stc
LB_6772:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6767
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1500 { %_5589 %_5590 } ⊢ %_5591 : %_5591
 ; {>  %_5589~0':_stg %_5590~1':_p1487 }
; _f1500 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_5591 ⊢ %_5592 : %_5592
 ; {>  %_5591~°2◂{ 0' 1' }:_p1485 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_5592
 ; {>  %_5592~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1485) }
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
	jc LB_6761
	btr r12,2
	jmp LB_6762
LB_6761:
	bts r12,2
LB_6762:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6759
	btr QWORD [rdi],0
	jmp LB_6760
LB_6759:
	bts QWORD [rdi],0
LB_6760:
	mov r8,r14
	bt r12,1
	jc LB_6765
	btr r12,2
	jmp LB_6766
LB_6765:
	bts r12,2
LB_6766:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6763
	btr QWORD [rdi],1
	jmp LB_6764
LB_6763:
	bts QWORD [rdi],1
LB_6764:
	mov rsi,1
	bt r12,3
	jc LB_6757
	mov rsi,0
	bt r9,0
	jc LB_6757
	jmp LB_6758
LB_6757:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6758:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6767:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6769
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6768
LB_6769:
	add rsp,8
	ret
LB_6770:
	add rsp,32
	pop r14
LB_6768:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6787
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "lc_etr_body 0" _ ⊢ 0' : %_5593
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5593 ⊢ %_5594 : %_5594
 ; {>  %_5593~0':_stg }
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
; _none {  } ⊢ %_5595 : %_5595
 ; {>  %_5594~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5595
 ; {>  %_5594~0':_stg %_5595~°1◂{  }:(_opn)◂(t2394'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6786
	mov rdi,r13
	call dlt
LB_6786:
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
LB_6787:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6789
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6788
LB_6789:
	add rsp,8
	ret
LB_6790:
	add rsp,0
	pop r14
LB_6788:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5464:
NS_E_RDI_5464:
NS_E_5464_ETR_TBL:
NS_E_5464_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
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
	add r14,1
	cmp r14,r10
	jg LB_6822
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6822
	jmp LB_6823
LB_6822:
	jmp LB_6806
LB_6823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6825
LB_6824:
	add r14,1
LB_6825:
	cmp r14,r10
	jge LB_6826
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6824
	cmp al,10
	jz LB_6824
	cmp al,32
	jz LB_6824
LB_6826:
	add r14,1
	cmp r14,r10
	jg LB_6830
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6830
	jmp LB_6831
LB_6830:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6828
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6828:
	jmp LB_6806
LB_6831:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
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
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6835
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6836
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6836:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6837
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6837:
	jmp LB_6806
LB_6835:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
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
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6842
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6843
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6843:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6844
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6844:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6845
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6845:
	jmp LB_6806
LB_6842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_6848
LB_6847:
	add r14,1
LB_6848:
	cmp r14,r10
	jge LB_6849
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6847
	cmp al,10
	jz LB_6847
	cmp al,32
	jz LB_6847
LB_6849:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6850
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6851
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6851:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6852
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6852:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6853
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6853:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6854
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6854:
	jmp LB_6806
LB_6850:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov r11,rsi
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6815
	btr r12,4
	clc
	jmp LB_6816
LB_6815:
	bts r12,4
	stc
LB_6816:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6813
	btr r12,3
	clc
	jmp LB_6814
LB_6813:
	bts r12,3
	stc
LB_6814:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6811
	btr r12,2
	clc
	jmp LB_6812
LB_6811:
	bts r12,2
	stc
LB_6812:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6809
	btr r12,1
	clc
	jmp LB_6810
LB_6809:
	bts r12,1
	stc
LB_6810:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6807
	btr r12,0
	clc
	jmp LB_6808
LB_6807:
	bts r12,0
	stc
LB_6808:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6803
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov rdi,r8
	mov QWORD [st_vct+8*8],rdi
	bt r12,2
	jc LB_6856
	btr r12,8
	jmp LB_6857
LB_6856:
	bts r12,8
LB_6857:
	mov r8,r10
	bt r12,4
	jc LB_6858
	btr r12,2
	jmp LB_6859
LB_6858:
	bts r12,2
LB_6859:
	mov r10,r14
	bt r12,1
	jc LB_6860
	btr r12,4
	jmp LB_6861
LB_6860:
	bts r12,4
LB_6861:
	mov r14,r9
	bt r12,3
	jc LB_6862
	btr r12,1
	jmp LB_6863
LB_6862:
	bts r12,1
LB_6863:
	mov r9,r13
	bt r12,0
	jc LB_6864
	btr r12,3
	jmp LB_6865
LB_6864:
	bts r12,3
LB_6865:
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_6866
	btr r12,0
	jmp LB_6867
LB_6866:
	bts r12,0
LB_6867:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,5
	bts r12,6
	bts r12,7
; _some { %_5596 %_5597 %_5598 } ⊢ %_5599 : %_5599
 ; {>  %_5596~0':_stg %_5597~1':(_p1439)◂((_p1447)◂(_stg)) %_5598~2':(_p1452)◂(_stg) }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_5599
 ; {>  %_5599~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) }) }
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
	jc LB_6793
	btr r12,4
	jmp LB_6794
LB_6793:
	bts r12,4
LB_6794:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6791
	btr QWORD [rdi],0
	jmp LB_6792
LB_6791:
	bts QWORD [rdi],0
LB_6792:
	mov r10,r14
	bt r12,1
	jc LB_6797
	btr r12,4
	jmp LB_6798
LB_6797:
	bts r12,4
LB_6798:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6795
	btr QWORD [rdi],1
	jmp LB_6796
LB_6795:
	bts QWORD [rdi],1
LB_6796:
	mov r10,r8
	bt r12,2
	jc LB_6801
	btr r12,4
	jmp LB_6802
LB_6801:
	bts r12,4
LB_6802:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_6799
	btr QWORD [rdi],2
	jmp LB_6800
LB_6799:
	bts QWORD [rdi],2
LB_6800:
	mov r8,0
	bts r12,2
	ret
LB_6803:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6805
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6804
LB_6805:
	add rsp,8
	ret
LB_6806:
	add rsp,80
	pop r14
LB_6804:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5465:
NS_E_RDI_5465:
NS_E_5465_ETR_TBL:
NS_E_5465_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_6888
LB_6887:
	add r14,1
LB_6888:
	cmp r14,r10
	jge LB_6889
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6887
	cmp al,10
	jz LB_6887
	cmp al,32
	jz LB_6887
LB_6889:
	add r14,1
	cmp r14,r10
	jg LB_6892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6892
	jmp LB_6893
LB_6892:
	jmp LB_6875
LB_6893:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_6882
LB_6881:
	add r14,1
LB_6882:
	cmp r14,r10
	jge LB_6883
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6881
	cmp al,10
	jz LB_6881
	cmp al,32
	jz LB_6881
LB_6883:
	push r10
	call NS_E_4450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6884
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6885
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6885:
	jmp LB_6876
LB_6884:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6879
	btr r12,1
	clc
	jmp LB_6880
LB_6879:
	bts r12,1
	stc
LB_6880:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6877
	btr r12,0
	clc
	jmp LB_6878
LB_6877:
	bts r12,0
	stc
LB_6878:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6872
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6894
	btr r12,2
	jmp LB_6895
LB_6894:
	bts r12,2
LB_6895:
	mov r13,r14
	bt r12,1
	jc LB_6896
	btr r12,0
	jmp LB_6897
LB_6896:
	bts r12,0
LB_6897:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1507 %_5600 ⊢ %_5601 : %_5601
 ; {>  %_5600~0':_p1442 }
; _f1507 0' ⊢ °1◂0'
; _some %_5601 ⊢ %_5602 : %_5602
 ; {>  %_5601~°1◂0':_p1487 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5602
 ; {>  %_5602~°0◂°1◂0':(_opn)◂(_p1487) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6870
	btr r12,3
	jmp LB_6871
LB_6870:
	bts r12,3
LB_6871:
	mov rsi,1
	bt r12,3
	jc LB_6868
	mov rsi,0
	bt r9,0
	jc LB_6868
	jmp LB_6869
LB_6868:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6869:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6872:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6874
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6873
LB_6874:
	add rsp,8
	ret
LB_6876:
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
LB_6875:
	add rsp,32
	pop r14
LB_6873:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_6918
LB_6917:
	add r14,1
LB_6918:
	cmp r14,r10
	jge LB_6919
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6917
	cmp al,10
	jz LB_6917
	cmp al,32
	jz LB_6917
LB_6919:
	add r14,2
	cmp r14,r10
	jg LB_6922
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6922
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_6922
	jmp LB_6923
LB_6922:
	jmp LB_6905
LB_6923:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_6912
LB_6911:
	add r14,1
LB_6912:
	cmp r14,r10
	jge LB_6913
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6911
	cmp al,10
	jz LB_6911
	cmp al,32
	jz LB_6911
LB_6913:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6914
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6915
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6915:
	jmp LB_6906
LB_6914:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6909
	btr r12,1
	clc
	jmp LB_6910
LB_6909:
	bts r12,1
	stc
LB_6910:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6907
	btr r12,0
	clc
	jmp LB_6908
LB_6907:
	bts r12,0
	stc
LB_6908:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6902
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6924
	btr r12,2
	jmp LB_6925
LB_6924:
	bts r12,2
LB_6925:
	mov r13,r14
	bt r12,1
	jc LB_6926
	btr r12,0
	jmp LB_6927
LB_6926:
	bts r12,0
LB_6927:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1508 %_5603 ⊢ %_5604 : %_5604
 ; {>  %_5603~0':(_p1452)◂(_stg) }
; _f1508 0' ⊢ °2◂0'
; _some %_5604 ⊢ %_5605 : %_5605
 ; {>  %_5604~°2◂0':_p1487 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_5605
 ; {>  %_5605~°0◂°2◂0':(_opn)◂(_p1487) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6900
	btr r12,3
	jmp LB_6901
LB_6900:
	bts r12,3
LB_6901:
	mov rsi,1
	bt r12,3
	jc LB_6898
	mov rsi,0
	bt r9,0
	jc LB_6898
	jmp LB_6899
LB_6898:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6899:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6904
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6903
LB_6904:
	add rsp,8
	ret
LB_6906:
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
LB_6905:
	add rsp,32
	pop r14
LB_6903:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_6947
LB_6946:
	add r14,1
LB_6947:
	cmp r14,r10
	jge LB_6948
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6946
	cmp al,10
	jz LB_6946
	cmp al,32
	jz LB_6946
LB_6948:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6949
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6941
LB_6949:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_6952
LB_6951:
	add r14,1
LB_6952:
	cmp r14,r10
	jge LB_6953
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6951
	cmp al,10
	jz LB_6951
	cmp al,32
	jz LB_6951
LB_6953:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6954
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6955
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6955:
	jmp LB_6941
LB_6954:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6944
	btr r12,1
	clc
	jmp LB_6945
LB_6944:
	bts r12,1
	stc
LB_6945:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6942
	btr r12,0
	clc
	jmp LB_6943
LB_6942:
	bts r12,0
	stc
LB_6943:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6938
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1506 { %_5606 %_5607 } ⊢ %_5608 : %_5608
 ; {>  %_5607~1':(_p1452)◂(_stg) %_5606~0':(_p1439)◂((_p1447)◂(_stg)) }
; _f1506 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5608 ⊢ %_5609 : %_5609
 ; {>  %_5608~°0◂{ 0' 1' }:_p1487 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5609
 ; {>  %_5609~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1487) }
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
	jc LB_6932
	btr r12,2
	jmp LB_6933
LB_6932:
	bts r12,2
LB_6933:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6930
	btr QWORD [rdi],0
	jmp LB_6931
LB_6930:
	bts QWORD [rdi],0
LB_6931:
	mov r8,r14
	bt r12,1
	jc LB_6936
	btr r12,2
	jmp LB_6937
LB_6936:
	bts r12,2
LB_6937:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6934
	btr QWORD [rdi],1
	jmp LB_6935
LB_6934:
	bts QWORD [rdi],1
LB_6935:
	mov rsi,1
	bt r12,3
	jc LB_6928
	mov rsi,0
	bt r9,0
	jc LB_6928
	jmp LB_6929
LB_6928:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6929:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6938:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6940
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6939
LB_6940:
	add rsp,8
	ret
LB_6941:
	add rsp,32
	pop r14
LB_6939:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5466:
NS_E_RDI_5466:
NS_E_5466_ETR_TBL:
NS_E_5466_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142|"
	jmp LB_6966
LB_6965:
	add r14,1
LB_6966:
	cmp r14,r10
	jge LB_6967
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6965
	cmp al,10
	jz LB_6965
	cmp al,32
	jz LB_6965
LB_6967:
	add r14,4
	cmp r14,r10
	jg LB_6970
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6970
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6970
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,142
	jnz LB_6970
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,124
	jnz LB_6970
	jmp LB_6971
LB_6970:
	jmp LB_6962
LB_6971:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6963
	btr r12,0
	clc
	jmp LB_6964
LB_6963:
	bts r12,0
	stc
LB_6964:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6959
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1463 {  } ⊢ %_5610 : %_5610
 ; {>  }
; _f1463 {  } ⊢ °3◂{  }
; _some %_5610 ⊢ %_5611 : %_5611
 ; {>  %_5610~°3◂{  }:(_p1452)◂(t2420'(0)) }
; _some °3◂{  } ⊢ °0◂°3◂{  }
; ∎ %_5611
 ; {>  %_5611~°0◂°3◂{  }:(_opn)◂((_p1452)◂(t2423'(0))) }
; 	∎ °0◂°3◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°3◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6957
	mov rsi,0
	bt r9,0
	jc LB_6957
	jmp LB_6958
LB_6957:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6958:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6959:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6961
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6960
LB_6961:
	add rsp,8
	ret
LB_6962:
	add rsp,16
	pop r14
LB_6960:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_6992
LB_6991:
	add r14,1
LB_6992:
	cmp r14,r10
	jge LB_6993
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6991
	cmp al,10
	jz LB_6991
	cmp al,32
	jz LB_6991
LB_6993:
	add r14,3
	cmp r14,r10
	jg LB_6996
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6996
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6996
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_6996
	jmp LB_6997
LB_6996:
	jmp LB_6979
LB_6997:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_6986
LB_6985:
	add r14,1
LB_6986:
	cmp r14,r10
	jge LB_6987
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6985
	cmp al,10
	jz LB_6985
	cmp al,32
	jz LB_6985
LB_6987:
	push r10
	call NS_E_4579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6988
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6989:
	jmp LB_6980
LB_6988:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6983
	btr r12,1
	clc
	jmp LB_6984
LB_6983:
	bts r12,1
	stc
LB_6984:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6981
	btr r12,0
	clc
	jmp LB_6982
LB_6981:
	bts r12,0
	stc
LB_6982:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6976
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6998
	btr r12,2
	jmp LB_6999
LB_6998:
	bts r12,2
LB_6999:
	mov r13,r14
	bt r12,1
	jc LB_7000
	btr r12,0
	jmp LB_7001
LB_7000:
	bts r12,0
LB_7001:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1462 %_5612 ⊢ %_5613 : %_5613
 ; {>  %_5612~0':(_p1439)◂((_p1446)◂(_stg)) }
; _f1462 0' ⊢ °2◂0'
; _some %_5613 ⊢ %_5614 : %_5614
 ; {>  %_5613~°2◂0':(_p1452)◂(_stg) }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_5614
 ; {>  %_5614~°0◂°2◂0':(_opn)◂((_p1452)◂(_stg)) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6974
	btr r12,3
	jmp LB_6975
LB_6974:
	bts r12,3
LB_6975:
	mov rsi,1
	bt r12,3
	jc LB_6972
	mov rsi,0
	bt r9,0
	jc LB_6972
	jmp LB_6973
LB_6972:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6973:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6976:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6978
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6977
LB_6978:
	add rsp,8
	ret
LB_6980:
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
LB_6979:
	add rsp,32
	pop r14
LB_6977:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_7013
LB_7012:
	add r14,1
LB_7013:
	cmp r14,r10
	jge LB_7014
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7012
	cmp al,10
	jz LB_7012
	cmp al,32
	jz LB_7012
LB_7014:
	push r10
	call NS_E_5475_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7015
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7009
LB_7015:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7010
	btr r12,0
	clc
	jmp LB_7011
LB_7010:
	bts r12,0
	stc
LB_7011:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7006
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1461 %_5615 ⊢ %_5616 : %_5616
 ; {>  %_5615~0':(_p1454)◂(_stg) }
; _f1461 0' ⊢ °1◂0'
; _some %_5616 ⊢ %_5617 : %_5617
 ; {>  %_5616~°1◂0':(_p1452)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5617
 ; {>  %_5617~°0◂°1◂0':(_opn)◂((_p1452)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7004
	btr r12,3
	jmp LB_7005
LB_7004:
	bts r12,3
LB_7005:
	mov rsi,1
	bt r12,3
	jc LB_7002
	mov rsi,0
	bt r9,0
	jc LB_7002
	jmp LB_7003
LB_7002:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7003:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7006:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7008
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7007
LB_7008:
	add rsp,8
	ret
LB_7009:
	add rsp,16
	pop r14
LB_7007:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_7036
LB_7035:
	add r14,1
LB_7036:
	cmp r14,r10
	jge LB_7037
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7035
	cmp al,10
	jz LB_7035
	cmp al,32
	jz LB_7035
LB_7037:
	push r10
	call NS_E_5467_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7038
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7030
LB_7038:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_7041
LB_7040:
	add r14,1
LB_7041:
	cmp r14,r10
	jge LB_7042
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7040
	cmp al,10
	jz LB_7040
	cmp al,32
	jz LB_7040
LB_7042:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7043
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7044
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7044:
	jmp LB_7030
LB_7043:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7033
	btr r12,1
	clc
	jmp LB_7034
LB_7033:
	bts r12,1
	stc
LB_7034:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7031
	btr r12,0
	clc
	jmp LB_7032
LB_7031:
	bts r12,0
	stc
LB_7032:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7027
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1460 { %_5618 %_5619 } ⊢ %_5620 : %_5620
 ; {>  %_5618~0':(_p1453)◂(_stg) %_5619~1':(_p1452)◂(_stg) }
; _f1460 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5620 ⊢ %_5621 : %_5621
 ; {>  %_5620~°0◂{ 0' 1' }:(_p1452)◂(_stg) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5621
 ; {>  %_5621~°0◂°0◂{ 0' 1' }:(_opn)◂((_p1452)◂(_stg)) }
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
	jc LB_7021
	btr r12,2
	jmp LB_7022
LB_7021:
	bts r12,2
LB_7022:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7019
	btr QWORD [rdi],0
	jmp LB_7020
LB_7019:
	bts QWORD [rdi],0
LB_7020:
	mov r8,r14
	bt r12,1
	jc LB_7025
	btr r12,2
	jmp LB_7026
LB_7025:
	bts r12,2
LB_7026:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7023
	btr QWORD [rdi],1
	jmp LB_7024
LB_7023:
	bts QWORD [rdi],1
LB_7024:
	mov rsi,1
	bt r12,3
	jc LB_7017
	mov rsi,0
	bt r9,0
	jc LB_7017
	jmp LB_7018
LB_7017:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7018:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7027:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7029
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7028
LB_7029:
	add rsp,8
	ret
LB_7030:
	add rsp,32
	pop r14
LB_7028:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5467:
NS_E_RDI_5467:
NS_E_5467_ETR_TBL:
NS_E_5467_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_7112
LB_7111:
	add r14,1
LB_7112:
	cmp r14,r10
	jge LB_7113
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7111
	cmp al,10
	jz LB_7111
	cmp al,32
	jz LB_7111
LB_7113:
	add r14,1
	cmp r14,r10
	jg LB_7116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_7116
	jmp LB_7117
LB_7116:
	jmp LB_7067
LB_7117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_7080
LB_7079:
	add r14,1
LB_7080:
	cmp r14,r10
	jge LB_7081
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7079
	cmp al,10
	jz LB_7079
	cmp al,32
	jz LB_7079
LB_7081:
	push r10
	call NS_E_4579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7082
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7083
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7083:
	jmp LB_7068
LB_7082:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
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
	add r14,3
	cmp r14,r10
	jg LB_7092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7092
	jmp LB_7093
LB_7092:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7089
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7089:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7090
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7090:
	jmp LB_7068
LB_7093:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7095
LB_7094:
	add r14,1
LB_7095:
	cmp r14,r10
	jge LB_7096
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7094
	cmp al,10
	jz LB_7094
	cmp al,32
	jz LB_7094
LB_7096:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7097
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7098
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7098:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7099
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7099:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7100
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7100:
	jmp LB_7068
LB_7097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_7103
LB_7102:
	add r14,1
LB_7103:
	cmp r14,r10
	jge LB_7104
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7102
	cmp al,10
	jz LB_7102
	cmp al,32
	jz LB_7102
LB_7104:
	push r10
	call NS_E_4842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7105
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7106
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7106:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7107
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7107:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7108
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7108:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7109:
	jmp LB_7068
LB_7105:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7077
	btr r12,4
	clc
	jmp LB_7078
LB_7077:
	bts r12,4
	stc
LB_7078:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7075
	btr r12,3
	clc
	jmp LB_7076
LB_7075:
	bts r12,3
	stc
LB_7076:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7073
	btr r12,2
	clc
	jmp LB_7074
LB_7073:
	bts r12,2
	stc
LB_7074:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7071
	btr r12,1
	clc
	jmp LB_7072
LB_7071:
	bts r12,1
	stc
LB_7072:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7069
	btr r12,0
	clc
	jmp LB_7070
LB_7069:
	bts r12,0
	stc
LB_7070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7064
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_7118
	btr r12,5
	jmp LB_7119
LB_7118:
	bts r12,5
LB_7119:
	mov r8,r10
	bt r12,4
	jc LB_7120
	btr r12,2
	jmp LB_7121
LB_7120:
	bts r12,2
LB_7121:
	mov r10,r14
	bt r12,1
	jc LB_7122
	btr r12,4
	jmp LB_7123
LB_7122:
	bts r12,4
LB_7123:
	mov r14,r9
	bt r12,3
	jc LB_7124
	btr r12,1
	jmp LB_7125
LB_7124:
	bts r12,1
LB_7125:
	mov r9,r13
	bt r12,0
	jc LB_7126
	btr r12,3
	jmp LB_7127
LB_7126:
	bts r12,3
LB_7127:
	mov r13,r10
	bt r12,4
	jc LB_7128
	btr r12,0
	jmp LB_7129
LB_7128:
	bts r12,0
LB_7129:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5623 %_5624 } ⊢ %_5625 : %_5625
 ; {>  %_5622~0':(_p1439)◂((_p1446)◂(_stg)) %_5624~2':(_lst)◂((_p1439)◂((_p1447)◂(_stg))) %_5623~1':(_p1439)◂((_p1447)◂(_stg)) }
; _cns { 1' 2' } ⊢ °0◂{ 1' 2' }
; _f1465 { %_5622 %_5625 } ⊢ %_5626 : %_5626
 ; {>  %_5622~0':(_p1439)◂((_p1446)◂(_stg)) %_5625~°0◂{ 1' 2' }:(_lst)◂((_p1439)◂((_p1447)◂(_stg))) }
; _f1465 { 0' °0◂{ 1' 2' } } ⊢ °1◂{ 0' °0◂{ 1' 2' } }
; _some %_5626 ⊢ %_5627 : %_5627
 ; {>  %_5626~°1◂{ 0' °0◂{ 1' 2' } }:(_p1453)◂(_stg) }
; _some °1◂{ 0' °0◂{ 1' 2' } } ⊢ °0◂°1◂{ 0' °0◂{ 1' 2' } }
; ∎ %_5627
 ; {>  %_5627~°0◂°1◂{ 0' °0◂{ 1' 2' } }:(_opn)◂((_p1453)◂(_stg)) }
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
	jc LB_7050
	btr r12,4
	jmp LB_7051
LB_7050:
	bts r12,4
LB_7051:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7048
	btr QWORD [rdi],0
	jmp LB_7049
LB_7048:
	bts QWORD [rdi],0
LB_7049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r13,r14
	bt r12,1
	jc LB_7058
	btr r12,0
	jmp LB_7059
LB_7058:
	bts r12,0
LB_7059:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7056
	btr QWORD [rdi],0
	jmp LB_7057
LB_7056:
	bts QWORD [rdi],0
LB_7057:
	mov r13,r8
	bt r12,2
	jc LB_7062
	btr r12,0
	jmp LB_7063
LB_7062:
	bts r12,0
LB_7063:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7060
	btr QWORD [rdi],1
	jmp LB_7061
LB_7060:
	bts QWORD [rdi],1
LB_7061:
	mov rsi,1
	bt r12,4
	jc LB_7054
	mov rsi,0
	bt r10,0
	jc LB_7054
	jmp LB_7055
LB_7054:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7055:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7052
	btr QWORD [rdi],1
	jmp LB_7053
LB_7052:
	bts QWORD [rdi],1
LB_7053:
	mov rsi,1
	bt r12,3
	jc LB_7046
	mov rsi,0
	bt r9,0
	jc LB_7046
	jmp LB_7047
LB_7046:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7047:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7064:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7066
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7065
LB_7066:
	add rsp,8
	ret
LB_7068:
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
LB_7067:
	add rsp,80
	pop r14
LB_7065:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_7206
LB_7205:
	add r14,1
LB_7206:
	cmp r14,r10
	jge LB_7207
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7205
	cmp al,10
	jz LB_7205
	cmp al,32
	jz LB_7205
LB_7207:
	add r14,3
	cmp r14,r10
	jg LB_7210
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7210
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_7210
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_7210
	jmp LB_7211
LB_7210:
	jmp LB_7147
LB_7211:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_7162
LB_7161:
	add r14,1
LB_7162:
	cmp r14,r10
	jge LB_7163
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7161
	cmp al,10
	jz LB_7161
	cmp al,32
	jz LB_7161
LB_7163:
	push r10
	call NS_E_4582_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7164
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7165
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7165:
	jmp LB_7148
LB_7164:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_7168
LB_7167:
	add r14,1
LB_7168:
	cmp r14,r10
	jge LB_7169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7167
	cmp al,10
	jz LB_7167
	cmp al,32
	jz LB_7167
LB_7169:
	add r14,1
	cmp r14,r10
	jg LB_7174
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_7174
	jmp LB_7175
LB_7174:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7171
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7171:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7172
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7172:
	jmp LB_7148
LB_7175:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_7177
LB_7176:
	add r14,1
LB_7177:
	cmp r14,r10
	jge LB_7178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7176
	cmp al,10
	jz LB_7176
	cmp al,32
	jz LB_7176
LB_7178:
	push r10
	call NS_E_4579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7179
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7180
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7180:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7181
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7181:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7182
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7182:
	jmp LB_7148
LB_7179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
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
	add r14,3
	cmp r14,r10
	jg LB_7193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7193
	jmp LB_7194
LB_7193:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7188
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7188:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7189
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7189:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7190
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7190:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7191
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7191:
	jmp LB_7148
LB_7194:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_7196
LB_7195:
	add r14,1
LB_7196:
	cmp r14,r10
	jge LB_7197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7195
	cmp al,10
	jz LB_7195
	cmp al,32
	jz LB_7195
LB_7197:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7198
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_7199
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_7199:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7200
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7200:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7201
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7201:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7202
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7202:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7203
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7203:
	jmp LB_7148
LB_7198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_7159
	btr r12,5
	clc
	jmp LB_7160
LB_7159:
	bts r12,5
	stc
LB_7160:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7157
	btr r12,4
	clc
	jmp LB_7158
LB_7157:
	bts r12,4
	stc
LB_7158:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7155
	btr r12,3
	clc
	jmp LB_7156
LB_7155:
	bts r12,3
	stc
LB_7156:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7153
	btr r12,2
	clc
	jmp LB_7154
LB_7153:
	bts r12,2
	stc
LB_7154:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7151
	btr r12,1
	clc
	jmp LB_7152
LB_7151:
	bts r12,1
	stc
LB_7152:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7149
	btr r12,0
	clc
	jmp LB_7150
LB_7149:
	bts r12,0
	stc
LB_7150:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_7144
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_7212
	btr r12,6
	jmp LB_7213
LB_7212:
	bts r12,6
LB_7213:
	mov r8,r11
	bt r12,5
	jc LB_7214
	btr r12,2
	jmp LB_7215
LB_7214:
	bts r12,2
LB_7215:
	mov r11,r14
	bt r12,1
	jc LB_7216
	btr r12,5
	jmp LB_7217
LB_7216:
	bts r12,5
LB_7217:
	mov r14,r9
	bt r12,3
	jc LB_7218
	btr r12,1
	jmp LB_7219
LB_7218:
	bts r12,1
LB_7219:
	mov r9,r13
	bt r12,0
	jc LB_7220
	btr r12,3
	jmp LB_7221
LB_7220:
	bts r12,3
LB_7221:
	mov r13,r11
	bt r12,5
	jc LB_7222
	btr r12,0
	jmp LB_7223
LB_7222:
	bts r12,0
LB_7223:
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
; _f1466 { %_5628 %_5629 %_5630 } ⊢ %_5631 : %_5631
 ; {>  %_5630~2':(_p1439)◂((_p1447)◂(_stg)) %_5629~1':(_p1439)◂((_p1446)◂(_stg)) %_5628~0':(_p1446)◂(_stg) }
; _f1466 { 0' 1' 2' } ⊢ °2◂{ 0' 1' 2' }
; _some %_5631 ⊢ %_5632 : %_5632
 ; {>  %_5631~°2◂{ 0' 1' 2' }:(_p1453)◂(_stg) }
; _some °2◂{ 0' 1' 2' } ⊢ °0◂°2◂{ 0' 1' 2' }
; ∎ %_5632
 ; {>  %_5632~°0◂°2◂{ 0' 1' 2' }:(_opn)◂((_p1453)◂(_stg)) }
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
	jc LB_7134
	btr r12,4
	jmp LB_7135
LB_7134:
	bts r12,4
LB_7135:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7132
	btr QWORD [rdi],0
	jmp LB_7133
LB_7132:
	bts QWORD [rdi],0
LB_7133:
	mov r10,r14
	bt r12,1
	jc LB_7138
	btr r12,4
	jmp LB_7139
LB_7138:
	bts r12,4
LB_7139:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7136
	btr QWORD [rdi],1
	jmp LB_7137
LB_7136:
	bts QWORD [rdi],1
LB_7137:
	mov r10,r8
	bt r12,2
	jc LB_7142
	btr r12,4
	jmp LB_7143
LB_7142:
	bts r12,4
LB_7143:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_7140
	btr QWORD [rdi],2
	jmp LB_7141
LB_7140:
	bts QWORD [rdi],2
LB_7141:
	mov rsi,1
	bt r12,3
	jc LB_7130
	mov rsi,0
	bt r9,0
	jc LB_7130
	jmp LB_7131
LB_7130:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7131:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7144:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7146
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7145
LB_7146:
	add rsp,8
	ret
LB_7148:
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
LB_7147:
	add rsp,96
	pop r14
LB_7145:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_7242
LB_7241:
	add r14,1
LB_7242:
	cmp r14,r10
	jge LB_7243
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7241
	cmp al,10
	jz LB_7241
	cmp al,32
	jz LB_7241
LB_7243:
	add r14,2
	cmp r14,r10
	jg LB_7246
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_7246
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_7246
	jmp LB_7247
LB_7246:
	jmp LB_7229
LB_7247:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_7236
LB_7235:
	add r14,1
LB_7236:
	cmp r14,r10
	jge LB_7237
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7235
	cmp al,10
	jz LB_7235
	cmp al,32
	jz LB_7235
LB_7237:
	push r10
	call NS_E_5468_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7238
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7239
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7239:
	jmp LB_7230
LB_7238:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7233
	btr r12,1
	clc
	jmp LB_7234
LB_7233:
	bts r12,1
	stc
LB_7234:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7231
	btr r12,0
	clc
	jmp LB_7232
LB_7231:
	bts r12,0
	stc
LB_7232:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7226
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7248
	btr r12,2
	jmp LB_7249
LB_7248:
	bts r12,2
LB_7249:
	mov r13,r14
	bt r12,1
	jc LB_7250
	btr r12,0
	jmp LB_7251
LB_7250:
	bts r12,0
LB_7251:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5633 ⊢ %_5634 : %_5634
 ; {>  %_5633~0':(_p1453)◂(_stg) }
; _some 0' ⊢ °0◂0'
; ∎ %_5634
 ; {>  %_5634~°0◂0':(_opn)◂((_p1453)◂(_stg)) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7224
	btr r12,3
	jmp LB_7225
LB_7224:
	bts r12,3
LB_7225:
	mov r8,0
	bts r12,2
	ret
LB_7226:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7228
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7227
LB_7228:
	add rsp,8
	ret
LB_7230:
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
LB_7229:
	add rsp,32
	pop r14
LB_7227:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_7279
LB_7278:
	add r14,1
LB_7279:
	cmp r14,r10
	jge LB_7280
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7278
	cmp al,10
	jz LB_7278
	cmp al,32
	jz LB_7278
LB_7280:
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7281
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7269
LB_7281:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_7284
LB_7283:
	add r14,1
LB_7284:
	cmp r14,r10
	jge LB_7285
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7283
	cmp al,10
	jz LB_7283
	cmp al,32
	jz LB_7283
LB_7285:
	push r10
	call NS_E_4579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7286
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7287
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7287:
	jmp LB_7269
LB_7286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7290
LB_7289:
	add r14,1
LB_7290:
	cmp r14,r10
	jge LB_7291
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7289
	cmp al,10
	jz LB_7289
	cmp al,32
	jz LB_7289
LB_7291:
	add r14,3
	cmp r14,r10
	jg LB_7296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7296
	jmp LB_7297
LB_7296:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7293
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7293:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7294
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7294:
	jmp LB_7269
LB_7297:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7299
LB_7298:
	add r14,1
LB_7299:
	cmp r14,r10
	jge LB_7300
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7298
	cmp al,10
	jz LB_7298
	cmp al,32
	jz LB_7298
LB_7300:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7301
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7302
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7302:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7303
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7303:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7304
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7304:
	jmp LB_7269
LB_7301:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov r10,rsi
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7276
	btr r12,3
	clc
	jmp LB_7277
LB_7276:
	bts r12,3
	stc
LB_7277:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7274
	btr r12,2
	clc
	jmp LB_7275
LB_7274:
	bts r12,2
	stc
LB_7275:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7272
	btr r12,1
	clc
	jmp LB_7273
LB_7272:
	bts r12,1
	stc
LB_7273:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7270
	btr r12,0
	clc
	jmp LB_7271
LB_7270:
	bts r12,0
	stc
LB_7271:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7266
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov rdx,r8
	bt r12,2
	jc LB_7306
	btr r12,7
	jmp LB_7307
LB_7306:
	bts r12,7
LB_7307:
	mov r8,r9
	bt r12,3
	jc LB_7308
	btr r12,2
	jmp LB_7309
LB_7308:
	bts r12,2
LB_7309:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _f1464 { %_5635 %_5636 %_5637 } ⊢ %_5638 : %_5638
 ; {>  %_5637~2':(_p1439)◂((_p1447)◂(_stg)) %_5636~1':(_p1439)◂((_p1446)◂(_stg)) %_5635~0':_p1394 }
; _f1464 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_5638 ⊢ %_5639 : %_5639
 ; {>  %_5638~°0◂{ 0' 1' 2' }:(_p1453)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_5639
 ; {>  %_5639~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p1453)◂(_stg)) }
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
	jc LB_7256
	btr r12,4
	jmp LB_7257
LB_7256:
	bts r12,4
LB_7257:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7254
	btr QWORD [rdi],0
	jmp LB_7255
LB_7254:
	bts QWORD [rdi],0
LB_7255:
	mov r10,r14
	bt r12,1
	jc LB_7260
	btr r12,4
	jmp LB_7261
LB_7260:
	bts r12,4
LB_7261:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7258
	btr QWORD [rdi],1
	jmp LB_7259
LB_7258:
	bts QWORD [rdi],1
LB_7259:
	mov r10,r8
	bt r12,2
	jc LB_7264
	btr r12,4
	jmp LB_7265
LB_7264:
	bts r12,4
LB_7265:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_7262
	btr QWORD [rdi],2
	jmp LB_7263
LB_7262:
	bts QWORD [rdi],2
LB_7263:
	mov rsi,1
	bt r12,3
	jc LB_7252
	mov rsi,0
	bt r9,0
	jc LB_7252
	jmp LB_7253
LB_7252:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7253:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7266:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7268
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7267
LB_7268:
	add rsp,8
	ret
LB_7269:
	add rsp,64
	pop r14
LB_7267:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5468:
NS_E_RDI_5468:
NS_E_5468_ETR_TBL:
NS_E_5468_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_7360
LB_7359:
	add r14,1
LB_7360:
	cmp r14,r10
	jge LB_7361
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7359
	cmp al,10
	jz LB_7359
	cmp al,32
	jz LB_7359
LB_7361:
	add r14,2
	cmp r14,r10
	jg LB_7364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_7364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_7364
	jmp LB_7365
LB_7364:
	jmp LB_7327
LB_7365:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_7338
LB_7337:
	add r14,1
LB_7338:
	cmp r14,r10
	jge LB_7339
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7337
	cmp al,10
	jz LB_7337
	cmp al,32
	jz LB_7337
LB_7339:
	push r10
	call NS_E_5469_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7340
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7341
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7341:
	jmp LB_7328
LB_7340:
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
LB_7347:
	jmp LB_7344
LB_7343:
	add r14,1
LB_7344:
	cmp r14,r10
	jge LB_7345
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7343
	cmp al,10
	jz LB_7343
	cmp al,32
	jz LB_7343
LB_7345:
	push r10
	push rsi
	call NS_E_5470_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_7346
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_7348
	bts QWORD [rax],0
LB_7348:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_7347
LB_7346:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_7350
LB_7349:
	add r14,1
LB_7350:
	cmp r14,r10
	jge LB_7351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7349
	cmp al,10
	jz LB_7349
	cmp al,32
	jz LB_7349
LB_7351:
	add r14,2
	cmp r14,r10
	jg LB_7357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_7357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_7357
	jmp LB_7358
LB_7357:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7353
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7353:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7354
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7354:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7355
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7355:
	jmp LB_7328
LB_7358:
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
	jc LB_7335
	btr r12,3
	clc
	jmp LB_7336
LB_7335:
	bts r12,3
	stc
LB_7336:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7333
	btr r12,2
	clc
	jmp LB_7334
LB_7333:
	bts r12,2
	stc
LB_7334:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7331
	btr r12,1
	clc
	jmp LB_7332
LB_7331:
	bts r12,1
	stc
LB_7332:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7329
	btr r12,0
	clc
	jmp LB_7330
LB_7329:
	bts r12,0
	stc
LB_7330:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7324
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
	jc LB_7366
	btr r12,3
	jmp LB_7367
LB_7366:
	bts r12,3
LB_7367:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_7370
	btr r12,4
	clc
	jmp LB_7371
LB_7370:
	bts r12,4
	stc
LB_7371:
	mov r13,r10
	bt r12,4
	jc LB_7368
	btr r12,0
	jmp LB_7369
LB_7368:
	bts r12,0
LB_7369:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_7374
	btr r12,4
	clc
	jmp LB_7375
LB_7374:
	bts r12,4
	stc
LB_7375:
	mov r14,r10
	bt r12,4
	jc LB_7372
	btr r12,1
	jmp LB_7373
LB_7372:
	bts r12,1
LB_7373:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1468 { %_5642 %_5640 %_5641 } ⊢ %_5643 : %_5643
 ; {>  %_5641~1':(_lst)◂((_p1447)◂(_stg)) %_5642~2':(_lst)◂(_p1458) %_5640~0':(_lst)◂((_p1446)◂(_stg)) }
; _f1468 { 2' 0' 1' } ⊢ °4◂{ 2' 0' 1' }
; _some %_5643 ⊢ %_5644 : %_5644
 ; {>  %_5643~°4◂{ 2' 0' 1' }:(_p1453)◂(_stg) }
; _some °4◂{ 2' 0' 1' } ⊢ °0◂°4◂{ 2' 0' 1' }
; ∎ %_5644
 ; {>  %_5644~°0◂°4◂{ 2' 0' 1' }:(_opn)◂((_p1453)◂(_stg)) }
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
	jc LB_7314
	btr r12,4
	jmp LB_7315
LB_7314:
	bts r12,4
LB_7315:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7312
	btr QWORD [rdi],0
	jmp LB_7313
LB_7312:
	bts QWORD [rdi],0
LB_7313:
	mov r10,r13
	bt r12,0
	jc LB_7318
	btr r12,4
	jmp LB_7319
LB_7318:
	bts r12,4
LB_7319:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7316
	btr QWORD [rdi],1
	jmp LB_7317
LB_7316:
	bts QWORD [rdi],1
LB_7317:
	mov r10,r14
	bt r12,1
	jc LB_7322
	btr r12,4
	jmp LB_7323
LB_7322:
	bts r12,4
LB_7323:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_7320
	btr QWORD [rdi],2
	jmp LB_7321
LB_7320:
	bts QWORD [rdi],2
LB_7321:
	mov rsi,1
	bt r12,3
	jc LB_7310
	mov rsi,0
	bt r9,0
	jc LB_7310
	jmp LB_7311
LB_7310:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7311:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7324:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7326
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7325
LB_7326:
	add rsp,8
	ret
LB_7328:
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
LB_7327:
	add rsp,64
	pop r14
LB_7325:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_7405
LB_7404:
	add r14,1
LB_7405:
	cmp r14,r10
	jge LB_7406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7404
	cmp al,10
	jz LB_7404
	cmp al,32
	jz LB_7404
LB_7406:
	push r10
	call NS_E_4450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7407
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7395
LB_7407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_7410
LB_7409:
	add r14,1
LB_7410:
	cmp r14,r10
	jge LB_7411
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7409
	cmp al,10
	jz LB_7409
	cmp al,32
	jz LB_7409
LB_7411:
	add r14,1
	cmp r14,r10
	jg LB_7415
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_7415
	jmp LB_7416
LB_7415:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7413
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7413:
	jmp LB_7395
LB_7416:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_7418
LB_7417:
	add r14,1
LB_7418:
	cmp r14,r10
	jge LB_7419
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7417
	cmp al,10
	jz LB_7417
	cmp al,32
	jz LB_7417
LB_7419:
	add r14,3
	cmp r14,r10
	jg LB_7424
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7424
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7424
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7424
	jmp LB_7425
LB_7424:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7421
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7421:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7422
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7422:
	jmp LB_7395
LB_7425:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7427
LB_7426:
	add r14,1
LB_7427:
	cmp r14,r10
	jge LB_7428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7426
	cmp al,10
	jz LB_7426
	cmp al,32
	jz LB_7426
LB_7428:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7429
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7430
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7430:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7431
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7432
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7432:
	jmp LB_7395
LB_7429:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov r10,rsi
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7402
	btr r12,3
	clc
	jmp LB_7403
LB_7402:
	bts r12,3
	stc
LB_7403:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7400
	btr r12,2
	clc
	jmp LB_7401
LB_7400:
	bts r12,2
	stc
LB_7401:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7398
	btr r12,1
	clc
	jmp LB_7399
LB_7398:
	bts r12,1
	stc
LB_7399:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7396
	btr r12,0
	clc
	jmp LB_7397
LB_7396:
	bts r12,0
	stc
LB_7397:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7392
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov rdx,r14
	bt r12,1
	jc LB_7434
	btr r12,7
	jmp LB_7435
LB_7434:
	bts r12,7
LB_7435:
	mov r14,r9
	bt r12,3
	jc LB_7436
	btr r12,1
	jmp LB_7437
LB_7436:
	bts r12,1
LB_7437:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _nil {  } ⊢ %_5647 : %_5647
 ; {>  %_5646~1':(_p1439)◂((_p1447)◂(_stg)) %_5645~0':_p1442 }
; _nil {  } ⊢ °1◂{  }
; _f1440 %_5647 ⊢ %_5648 : %_5648
 ; {>  %_5646~1':(_p1439)◂((_p1447)◂(_stg)) %_5647~°1◂{  }:(_lst)◂(t2506'(0)) %_5645~0':_p1442 }
; _f1440 °1◂{  } ⊢ °0◂°1◂{  }
; _f1467 { %_5645 %_5648 %_5646 } ⊢ %_5649 : %_5649
 ; {>  %_5646~1':(_p1439)◂((_p1447)◂(_stg)) %_5645~0':_p1442 %_5648~°0◂°1◂{  }:(_p1439)◂(t2508'(0)) }
; _f1467 { 0' °0◂°1◂{  } 1' } ⊢ °3◂{ 0' °0◂°1◂{  } 1' }
; _some %_5649 ⊢ %_5650 : %_5650
 ; {>  %_5649~°3◂{ 0' °0◂°1◂{  } 1' }:(_p1453)◂(_stg) }
; _some °3◂{ 0' °0◂°1◂{  } 1' } ⊢ °0◂°3◂{ 0' °0◂°1◂{  } 1' }
; ∎ %_5650
 ; {>  %_5650~°0◂°3◂{ 0' °0◂°1◂{  } 1' }:(_opn)◂((_p1453)◂(_stg)) }
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
	jc LB_7380
	btr r12,2
	jmp LB_7381
LB_7380:
	bts r12,2
LB_7381:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7378
	btr QWORD [rdi],0
	jmp LB_7379
LB_7378:
	bts QWORD [rdi],0
LB_7379:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_7386
	mov rsi,0
	bt r8,0
	jc LB_7386
	jmp LB_7387
LB_7386:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7387:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_7384
	mov rsi,0
	bt r8,0
	jc LB_7384
	jmp LB_7385
LB_7384:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7385:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7382
	btr QWORD [rdi],1
	jmp LB_7383
LB_7382:
	bts QWORD [rdi],1
LB_7383:
	mov r8,r14
	bt r12,1
	jc LB_7390
	btr r12,2
	jmp LB_7391
LB_7390:
	bts r12,2
LB_7391:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_7388
	btr QWORD [rdi],2
	jmp LB_7389
LB_7388:
	bts QWORD [rdi],2
LB_7389:
	mov rsi,1
	bt r12,3
	jc LB_7376
	mov rsi,0
	bt r9,0
	jc LB_7376
	jmp LB_7377
LB_7376:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7377:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7392:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7394
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7393
LB_7394:
	add rsp,8
	ret
LB_7395:
	add rsp,64
	pop r14
LB_7393:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5469:
NS_E_RDI_5469:
NS_E_5469_ETR_TBL:
NS_E_5469_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_7474
LB_7473:
	add r14,1
LB_7474:
	cmp r14,r10
	jge LB_7475
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7473
	cmp al,10
	jz LB_7473
	cmp al,32
	jz LB_7473
LB_7475:
	add r14,1
	cmp r14,r10
	jg LB_7478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_7478
	jmp LB_7479
LB_7478:
	jmp LB_7450
LB_7479:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_7459
LB_7458:
	add r14,1
LB_7459:
	cmp r14,r10
	jge LB_7460
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7458
	cmp al,10
	jz LB_7458
	cmp al,32
	jz LB_7458
LB_7460:
	add r14,3
	cmp r14,r10
	jg LB_7464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7464
	jmp LB_7465
LB_7464:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7462
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7462:
	jmp LB_7451
LB_7465:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_7467
LB_7466:
	add r14,1
LB_7467:
	cmp r14,r10
	jge LB_7468
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7466
	cmp al,10
	jz LB_7466
	cmp al,32
	jz LB_7466
LB_7468:
	push r10
	call NS_E_4844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7469
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7470
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7470:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7471:
	jmp LB_7451
LB_7469:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7456
	btr r12,2
	clc
	jmp LB_7457
LB_7456:
	bts r12,2
	stc
LB_7457:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7454
	btr r12,1
	clc
	jmp LB_7455
LB_7454:
	bts r12,1
	stc
LB_7455:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7452
	btr r12,0
	clc
	jmp LB_7453
LB_7452:
	bts r12,0
	stc
LB_7453:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7447
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_7480
	btr r12,3
	jmp LB_7481
LB_7480:
	bts r12,3
LB_7481:
	mov r13,r8
	bt r12,2
	jc LB_7482
	btr r12,0
	jmp LB_7483
LB_7482:
	bts r12,0
LB_7483:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5652 : %_5652
 ; {>  %_5651~0':(_p1447)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _nil {  } ⊢ %_5653 : %_5653
 ; {>  %_5652~°1◂{  }:(_lst)◂(t2525'(0)) %_5651~0':(_p1447)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _some { %_5652 %_5653 } ⊢ %_5654 : %_5654
 ; {>  %_5652~°1◂{  }:(_lst)◂(t2525'(0)) %_5651~0':(_p1447)◂(_stg) %_5653~°1◂{  }:(_lst)◂(t2527'(0)) }
; _some { °1◂{  } °1◂{  } } ⊢ °0◂{ °1◂{  } °1◂{  } }
; ∎ %_5654
 ; {>  %_5654~°0◂{ °1◂{  } °1◂{  } }:(_opn)◂({ (_lst)◂(t2530'(0)) (_lst)◂(t2531'(0)) }) %_5651~0':(_p1447)◂(_stg) }
; 	∎ °0◂{ °1◂{  } °1◂{  } }
	bt r12,0
	jc LB_7438
	mov rdi,r13
	call dlt
LB_7438:
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
	jc LB_7441
	mov rsi,0
	bt r13,0
	jc LB_7441
	jmp LB_7442
LB_7441:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7442:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7439
	btr QWORD [rdi],0
	jmp LB_7440
LB_7439:
	bts QWORD [rdi],0
LB_7440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_7445
	mov rsi,0
	bt r13,0
	jc LB_7445
	jmp LB_7446
LB_7445:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7446:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7443
	btr QWORD [rdi],1
	jmp LB_7444
LB_7443:
	bts QWORD [rdi],1
LB_7444:
	mov r8,0
	bts r12,2
	ret
LB_7447:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7449
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7448
LB_7449:
	add rsp,8
	ret
LB_7451:
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
LB_7450:
	add rsp,48
	pop r14
LB_7448:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_7525
LB_7524:
	add r14,1
LB_7525:
	cmp r14,r10
	jge LB_7526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7524
	cmp al,10
	jz LB_7524
	cmp al,32
	jz LB_7524
LB_7526:
	push r10
	call NS_E_4582_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7527
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7513
LB_7527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_7530
LB_7529:
	add r14,1
LB_7530:
	cmp r14,r10
	jge LB_7531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7529
	cmp al,10
	jz LB_7529
	cmp al,32
	jz LB_7529
LB_7531:
	push r10
	call NS_E_4581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7532
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7533
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7533:
	jmp LB_7513
LB_7532:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7536
LB_7535:
	add r14,1
LB_7536:
	cmp r14,r10
	jge LB_7537
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7535
	cmp al,10
	jz LB_7535
	cmp al,32
	jz LB_7535
LB_7537:
	add r14,3
	cmp r14,r10
	jg LB_7542
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7542
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7542
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7542
	jmp LB_7543
LB_7542:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7539
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7539:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7540
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7540:
	jmp LB_7513
LB_7543:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_7545
LB_7544:
	add r14,1
LB_7545:
	cmp r14,r10
	jge LB_7546
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7544
	cmp al,10
	jz LB_7544
	cmp al,32
	jz LB_7544
LB_7546:
	push r10
	call NS_E_4844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7547
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7548
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7548:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7549
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7549:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7550
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7550:
	jmp LB_7513
LB_7547:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_7553
LB_7552:
	add r14,1
LB_7553:
	cmp r14,r10
	jge LB_7554
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7552
	cmp al,10
	jz LB_7552
	cmp al,32
	jz LB_7552
LB_7554:
	push r10
	call NS_E_4843_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7555
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7556
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7556:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7557
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7557:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7558
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7558:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7559
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7559:
	jmp LB_7513
LB_7555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov r11,rsi
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7522
	btr r12,4
	clc
	jmp LB_7523
LB_7522:
	bts r12,4
	stc
LB_7523:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7520
	btr r12,3
	clc
	jmp LB_7521
LB_7520:
	bts r12,3
	stc
LB_7521:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7518
	btr r12,2
	clc
	jmp LB_7519
LB_7518:
	bts r12,2
	stc
LB_7519:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7516
	btr r12,1
	clc
	jmp LB_7517
LB_7516:
	bts r12,1
	stc
LB_7517:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7514
	btr r12,0
	clc
	jmp LB_7515
LB_7514:
	bts r12,0
	stc
LB_7515:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7510
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_7561
	btr r12,8
	jmp LB_7562
LB_7561:
	bts r12,8
LB_7562:
	mov r9,r10
	bt r12,4
	jc LB_7563
	btr r12,3
	jmp LB_7564
LB_7563:
	bts r12,3
LB_7564:
	mov r10,r8
	bt r12,2
	jc LB_7565
	btr r12,4
	jmp LB_7566
LB_7565:
	bts r12,4
LB_7566:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7567
	btr r12,2
	jmp LB_7568
LB_7567:
	bts r12,2
LB_7568:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,5
	bts r12,6
	bts r12,7
; _cns { %_5655 %_5656 } ⊢ %_5659 : %_5659
 ; {>  %_5655~0':(_p1446)◂(_stg) %_5656~1':(_lst)◂((_p1446)◂(_stg)) %_5657~2':(_p1447)◂(_stg) %_5658~3':(_lst)◂((_p1447)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _cns { %_5657 %_5658 } ⊢ %_5660 : %_5660
 ; {>  %_5657~2':(_p1447)◂(_stg) %_5659~°0◂{ 0' 1' }:(_lst)◂((_p1446)◂(_stg)) %_5658~3':(_lst)◂((_p1447)◂(_stg)) }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; _some { %_5659 %_5660 } ⊢ %_5661 : %_5661
 ; {>  %_5660~°0◂{ 2' 3' }:(_lst)◂((_p1447)◂(_stg)) %_5659~°0◂{ 0' 1' }:(_lst)◂((_p1446)◂(_stg)) }
; _some { °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; ∎ %_5661
 ; {>  %_5661~°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }:(_opn)◂({ (_lst)◂((_p1446)◂(_stg)) (_lst)◂((_p1447)◂(_stg)) }) }
; 	∎ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_7484
	btr r12,4
	jmp LB_7485
LB_7484:
	bts r12,4
LB_7485:
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
	jc LB_7492
	btr r12,6
	jmp LB_7493
LB_7492:
	bts r12,6
LB_7493:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_7490
	btr QWORD [rdi],0
	jmp LB_7491
LB_7490:
	bts QWORD [rdi],0
LB_7491:
	mov rcx,r14
	bt r12,1
	jc LB_7496
	btr r12,6
	jmp LB_7497
LB_7496:
	bts r12,6
LB_7497:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_7494
	btr QWORD [rdi],1
	jmp LB_7495
LB_7494:
	bts QWORD [rdi],1
LB_7495:
	mov rsi,1
	bt r12,5
	jc LB_7488
	mov rsi,0
	bt r11,0
	jc LB_7488
	jmp LB_7489
LB_7488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7489:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7486
	btr QWORD [rdi],0
	jmp LB_7487
LB_7486:
	bts QWORD [rdi],0
LB_7487:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r8
	bt r12,2
	jc LB_7504
	btr r12,0
	jmp LB_7505
LB_7504:
	bts r12,0
LB_7505:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7502
	btr QWORD [rdi],0
	jmp LB_7503
LB_7502:
	bts QWORD [rdi],0
LB_7503:
	mov r13,r10
	bt r12,4
	jc LB_7508
	btr r12,0
	jmp LB_7509
LB_7508:
	bts r12,0
LB_7509:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7506
	btr QWORD [rdi],1
	jmp LB_7507
LB_7506:
	bts QWORD [rdi],1
LB_7507:
	mov rsi,1
	bt r12,5
	jc LB_7500
	mov rsi,0
	bt r11,0
	jc LB_7500
	jmp LB_7501
LB_7500:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7501:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7498
	btr QWORD [rdi],1
	jmp LB_7499
LB_7498:
	bts QWORD [rdi],1
LB_7499:
	mov r8,0
	bts r12,2
	ret
LB_7510:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7512
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7511
LB_7512:
	add rsp,8
	ret
LB_7513:
	add rsp,80
	pop r14
LB_7511:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5470:
NS_E_RDI_5470:
NS_E_5470_ETR_TBL:
NS_E_5470_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_7598
LB_7597:
	add r14,1
LB_7598:
	cmp r14,r10
	jge LB_7599
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7597
	cmp al,10
	jz LB_7597
	cmp al,32
	jz LB_7597
LB_7599:
	push r10
	call NS_E_5471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7600
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7582
LB_7600:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_7603
LB_7602:
	add r14,1
LB_7603:
	cmp r14,r10
	jge LB_7604
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7602
	cmp al,10
	jz LB_7602
	cmp al,32
	jz LB_7602
LB_7604:
	add r14,1
	cmp r14,r10
	jg LB_7608
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_7608
	jmp LB_7609
LB_7608:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7606
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7606:
	jmp LB_7582
LB_7609:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_7591
LB_7590:
	add r14,1
LB_7591:
	cmp r14,r10
	jge LB_7592
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7590
	cmp al,10
	jz LB_7590
	cmp al,32
	jz LB_7590
LB_7592:
	push r10
	call NS_E_845_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7593
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7594
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7594:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7595
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7595:
	jmp LB_7583
LB_7593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7588
	btr r12,2
	clc
	jmp LB_7589
LB_7588:
	bts r12,2
	stc
LB_7589:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7586
	btr r12,1
	clc
	jmp LB_7587
LB_7586:
	bts r12,1
	stc
LB_7587:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7584
	btr r12,0
	clc
	jmp LB_7585
LB_7584:
	bts r12,0
	stc
LB_7585:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7579
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_7610
	btr r12,3
	jmp LB_7611
LB_7610:
	bts r12,3
LB_7611:
	mov r14,r8
	bt r12,2
	jc LB_7612
	btr r12,1
	jmp LB_7613
LB_7612:
	bts r12,1
LB_7613:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1480 { %_5662 %_5663 } ⊢ %_5664 : %_5664
 ; {>  %_5663~1':_stg %_5662~0':_r64 }
; _f1480 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_5664 ⊢ %_5665 : %_5665
 ; {>  %_5664~°3◂{ 0' 1' }:_p1458 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_5665
 ; {>  %_5665~°0◂°3◂{ 0' 1' }:(_opn)◂(_p1458) }
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
	jc LB_7573
	btr r12,2
	jmp LB_7574
LB_7573:
	bts r12,2
LB_7574:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7571
	btr QWORD [rdi],0
	jmp LB_7572
LB_7571:
	bts QWORD [rdi],0
LB_7572:
	mov r8,r14
	bt r12,1
	jc LB_7577
	btr r12,2
	jmp LB_7578
LB_7577:
	bts r12,2
LB_7578:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7575
	btr QWORD [rdi],1
	jmp LB_7576
LB_7575:
	bts QWORD [rdi],1
LB_7576:
	mov rsi,1
	bt r12,3
	jc LB_7569
	mov rsi,0
	bt r9,0
	jc LB_7569
	jmp LB_7570
LB_7569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7570:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7579:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7581
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7580
LB_7581:
	add rsp,8
	ret
LB_7583:
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
LB_7582:
	add rsp,48
	pop r14
LB_7580:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_7625
LB_7624:
	add r14,1
LB_7625:
	cmp r14,r10
	jge LB_7626
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7624
	cmp al,10
	jz LB_7624
	cmp al,32
	jz LB_7624
LB_7626:
	push r10
	call NS_E_5473_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7627
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7621
LB_7627:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7622
	btr r12,0
	clc
	jmp LB_7623
LB_7622:
	bts r12,0
	stc
LB_7623:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7618
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1477 %_5666 ⊢ %_5667 : %_5667
 ; {>  %_5666~0':_stg }
; _f1477 0' ⊢ °0◂0'
; _some %_5667 ⊢ %_5668 : %_5668
 ; {>  %_5667~°0◂0':_p1458 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5668
 ; {>  %_5668~°0◂°0◂0':(_opn)◂(_p1458) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7616
	btr r12,3
	jmp LB_7617
LB_7616:
	bts r12,3
LB_7617:
	mov rsi,1
	bt r12,3
	jc LB_7614
	mov rsi,0
	bt r9,0
	jc LB_7614
	jmp LB_7615
LB_7614:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7615:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7618:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7620
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7619
LB_7620:
	add rsp,8
	ret
LB_7621:
	add rsp,16
	pop r14
LB_7619:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_7640
LB_7639:
	add r14,1
LB_7640:
	cmp r14,r10
	jge LB_7641
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7639
	cmp al,10
	jz LB_7639
	cmp al,32
	jz LB_7639
LB_7641:
	push r10
	call NS_E_845_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7642
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7636
LB_7642:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7637
	btr r12,0
	clc
	jmp LB_7638
LB_7637:
	bts r12,0
	stc
LB_7638:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7633
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1477 %_5669 ⊢ %_5670 : %_5670
 ; {>  %_5669~0':_stg }
; _f1477 0' ⊢ °0◂0'
; _some %_5670 ⊢ %_5671 : %_5671
 ; {>  %_5670~°0◂0':_p1458 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5671
 ; {>  %_5671~°0◂°0◂0':(_opn)◂(_p1458) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7631
	btr r12,3
	jmp LB_7632
LB_7631:
	bts r12,3
LB_7632:
	mov rsi,1
	bt r12,3
	jc LB_7629
	mov rsi,0
	bt r9,0
	jc LB_7629
	jmp LB_7630
LB_7629:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7630:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7633:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7635
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7634
LB_7635:
	add rsp,8
	ret
LB_7636:
	add rsp,16
	pop r14
LB_7634:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_7655
LB_7654:
	add r14,1
LB_7655:
	cmp r14,r10
	jge LB_7656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7654
	cmp al,10
	jz LB_7654
	cmp al,32
	jz LB_7654
LB_7656:
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7657
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7651
LB_7657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7652
	btr r12,0
	clc
	jmp LB_7653
LB_7652:
	bts r12,0
	stc
LB_7653:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7648
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1478 %_5672 ⊢ %_5673 : %_5673
 ; {>  %_5672~0':_p1394 }
; _f1478 0' ⊢ °1◂0'
; _some %_5673 ⊢ %_5674 : %_5674
 ; {>  %_5673~°1◂0':_p1458 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5674
 ; {>  %_5674~°0◂°1◂0':(_opn)◂(_p1458) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7646
	btr r12,3
	jmp LB_7647
LB_7646:
	bts r12,3
LB_7647:
	mov rsi,1
	bt r12,3
	jc LB_7644
	mov rsi,0
	bt r9,0
	jc LB_7644
	jmp LB_7645
LB_7644:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7645:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7648:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7650
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7649
LB_7650:
	add rsp,8
	ret
LB_7651:
	add rsp,16
	pop r14
LB_7649:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_7676
LB_7675:
	add r14,1
LB_7676:
	cmp r14,r10
	jge LB_7677
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7675
	cmp al,10
	jz LB_7675
	cmp al,32
	jz LB_7675
LB_7677:
	push r10
	call NS_E_5472_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7678
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7672
LB_7678:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7673
	btr r12,0
	clc
	jmp LB_7674
LB_7673:
	bts r12,0
	stc
LB_7674:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7669
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r11,r14
	bt r12,1
	jc LB_7680
	btr r12,5
	jmp LB_7681
LB_7680:
	bts r12,5
LB_7681:
	mov r10,r13
	bt r12,0
	jc LB_7682
	btr r12,4
	jmp LB_7683
LB_7682:
	bts r12,4
LB_7683:
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_7686
	btr r12,6
	clc
	jmp LB_7687
LB_7686:
	bts r12,6
	stc
LB_7687:
	mov r13,rcx
	bt r12,6
	jc LB_7684
	btr r12,0
	jmp LB_7685
LB_7684:
	bts r12,0
LB_7685:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_7690
	btr r12,6
	clc
	jmp LB_7691
LB_7690:
	bts r12,6
	stc
LB_7691:
	mov r14,rcx
	bt r12,6
	jc LB_7688
	btr r12,1
	jmp LB_7689
LB_7688:
	bts r12,1
LB_7689:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1479 %_5675 ⊢ %_5676 : %_5676
 ; {>  %_5675~{ 0' 1' }:{ _p1459 _r64 } }
; _f1479 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_5676 ⊢ %_5677 : %_5677
 ; {>  %_5676~°2◂{ 0' 1' }:_p1458 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_5677
 ; {>  %_5677~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1458) }
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
	jc LB_7663
	btr r12,2
	jmp LB_7664
LB_7663:
	bts r12,2
LB_7664:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7661
	btr QWORD [rdi],0
	jmp LB_7662
LB_7661:
	bts QWORD [rdi],0
LB_7662:
	mov r8,r14
	bt r12,1
	jc LB_7667
	btr r12,2
	jmp LB_7668
LB_7667:
	bts r12,2
LB_7668:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7665
	btr QWORD [rdi],1
	jmp LB_7666
LB_7665:
	bts QWORD [rdi],1
LB_7666:
	mov rsi,1
	bt r12,3
	jc LB_7659
	mov rsi,0
	bt r9,0
	jc LB_7659
	jmp LB_7660
LB_7659:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7660:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7669:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7671
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7670
LB_7671:
	add rsp,8
	ret
LB_7672:
	add rsp,16
	pop r14
LB_7670:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5471:
NS_E_RDI_5471:
NS_E_5471_ETR_TBL:
NS_E_5471_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7705
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7697
LB_7705:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7713
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7713
	jmp LB_7714
LB_7713:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7711
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7711:
	jmp LB_7697
LB_7714:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7700
	btr r12,1
	clc
	jmp LB_7701
LB_7700:
	bts r12,1
	stc
LB_7701:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7698
	btr r12,0
	clc
	jmp LB_7699
LB_7698:
	bts r12,0
	stc
LB_7699:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7694
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5678 ⊢ %_5679 : %_5679
 ; {>  %_5678~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5679
 ; {>  %_5679~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7692
	btr r12,3
	jmp LB_7693
LB_7692:
	bts r12,3
LB_7693:
	mov r8,0
	bts r12,2
	ret
LB_7694:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7696
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7695
LB_7696:
	add rsp,8
	ret
LB_7697:
	add rsp,32
	pop r14
LB_7695:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5472:
NS_E_RDI_5472:
NS_E_5472_ETR_TBL:
NS_E_5472_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7734
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7726
LB_7734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_7742
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_7742
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7742
	jmp LB_7743
LB_7742:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7740:
	jmp LB_7726
LB_7743:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7729
	btr r12,1
	clc
	jmp LB_7730
LB_7729:
	bts r12,1
	stc
LB_7730:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7727
	btr r12,0
	clc
	jmp LB_7728
LB_7727:
	bts r12,0
	stc
LB_7728:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7723
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1482 {  } ⊢ %_5681 : %_5681
 ; {>  %_5680~0':_r64 }
; _f1482 {  } ⊢ °1◂{  }
; _some { %_5681 %_5680 } ⊢ %_5682 : %_5682
 ; {>  %_5680~0':_r64 %_5681~°1◂{  }:_p1459 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_5682
 ; {>  %_5682~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p1459 _r64 }) }
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
	jc LB_7717
	mov rsi,0
	bt r14,0
	jc LB_7717
	jmp LB_7718
LB_7717:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7718:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7715
	btr QWORD [rdi],0
	jmp LB_7716
LB_7715:
	bts QWORD [rdi],0
LB_7716:
	mov r14,r13
	bt r12,0
	jc LB_7721
	btr r12,1
	jmp LB_7722
LB_7721:
	bts r12,1
LB_7722:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7719
	btr QWORD [rdi],1
	jmp LB_7720
LB_7719:
	bts QWORD [rdi],1
LB_7720:
	mov r8,0
	bts r12,2
	ret
LB_7723:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7725
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7724
LB_7725:
	add rsp,8
	ret
LB_7726:
	add rsp,32
	pop r14
LB_7724:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7763
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7755
LB_7763:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_7771
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_7771
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7771
	jmp LB_7772
LB_7771:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7769
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7769:
	jmp LB_7755
LB_7772:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7758
	btr r12,1
	clc
	jmp LB_7759
LB_7758:
	bts r12,1
	stc
LB_7759:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7756
	btr r12,0
	clc
	jmp LB_7757
LB_7756:
	bts r12,0
	stc
LB_7757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7752
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1483 {  } ⊢ %_5684 : %_5684
 ; {>  %_5683~0':_r64 }
; _f1483 {  } ⊢ °2◂{  }
; _some { %_5684 %_5683 } ⊢ %_5685 : %_5685
 ; {>  %_5684~°2◂{  }:_p1459 %_5683~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_5685
 ; {>  %_5685~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p1459 _r64 }) }
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
	jc LB_7746
	mov rsi,0
	bt r14,0
	jc LB_7746
	jmp LB_7747
LB_7746:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7747:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7744
	btr QWORD [rdi],0
	jmp LB_7745
LB_7744:
	bts QWORD [rdi],0
LB_7745:
	mov r14,r13
	bt r12,0
	jc LB_7750
	btr r12,1
	jmp LB_7751
LB_7750:
	bts r12,1
LB_7751:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7748
	btr QWORD [rdi],1
	jmp LB_7749
LB_7748:
	bts QWORD [rdi],1
LB_7749:
	mov r8,0
	bts r12,2
	ret
LB_7752:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7754
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7753
LB_7754:
	add rsp,8
	ret
LB_7755:
	add rsp,32
	pop r14
LB_7753:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7792
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7784
LB_7792:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7800
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7800
	jmp LB_7801
LB_7800:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7798
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7798:
	jmp LB_7784
LB_7801:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7787
	btr r12,1
	clc
	jmp LB_7788
LB_7787:
	bts r12,1
	stc
LB_7788:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7785
	btr r12,0
	clc
	jmp LB_7786
LB_7785:
	bts r12,0
	stc
LB_7786:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7781
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1481 {  } ⊢ %_5687 : %_5687
 ; {>  %_5686~0':_r64 }
; _f1481 {  } ⊢ °0◂{  }
; _some { %_5687 %_5686 } ⊢ %_5688 : %_5688
 ; {>  %_5687~°0◂{  }:_p1459 %_5686~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_5688
 ; {>  %_5688~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p1459 _r64 }) }
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
	jc LB_7775
	mov rsi,0
	bt r14,0
	jc LB_7775
	jmp LB_7776
LB_7775:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7776:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7773
	btr QWORD [rdi],0
	jmp LB_7774
LB_7773:
	bts QWORD [rdi],0
LB_7774:
	mov r14,r13
	bt r12,0
	jc LB_7779
	btr r12,1
	jmp LB_7780
LB_7779:
	bts r12,1
LB_7780:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7777
	btr QWORD [rdi],1
	jmp LB_7778
LB_7777:
	bts QWORD [rdi],1
LB_7778:
	mov r8,0
	bts r12,2
	ret
LB_7781:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7783
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7782
LB_7783:
	add rsp,8
	ret
LB_7784:
	add rsp,32
	pop r14
LB_7782:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5473:
NS_E_RDI_5473:
NS_E_5473_ETR_TBL:
NS_E_5473_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_7817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_7817
	jmp LB_7818
LB_7817:
	jmp LB_7807
LB_7818:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_5474_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7822
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7823
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7823:
	jmp LB_7807
LB_7822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7810
	btr r12,1
	clc
	jmp LB_7811
LB_7810:
	bts r12,1
	stc
LB_7811:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7808
	btr r12,0
	clc
	jmp LB_7809
LB_7808:
	bts r12,0
	stc
LB_7809:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7804
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_7825
	btr r12,5
	jmp LB_7826
LB_7825:
	bts r12,5
LB_7826:
	mov r13,r14
	bt r12,1
	jc LB_7827
	btr r12,0
	jmp LB_7828
LB_7827:
	bts r12,0
LB_7828:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f689 %_5689 ⊢ %_5690 : %_5690
 ; {>  %_5689~0':(_lst)◂(_r64) }
; _f689 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_689
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_5690 ⊢ %_5691 : %_5691
 ; {>  %_5690~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5691
 ; {>  %_5691~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7802
	btr r12,3
	jmp LB_7803
LB_7802:
	bts r12,3
LB_7803:
	mov r8,0
	bts r12,2
	ret
LB_7804:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7806
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7805
LB_7806:
	add rsp,8
	ret
LB_7807:
	add rsp,32
	pop r14
LB_7805:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5474:
NS_E_RDI_5474:
NS_E_5474_ETR_TBL:
NS_E_5474_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_7850
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_7850
	jmp LB_7851
LB_7850:
	jmp LB_7842
LB_7851:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7843
	btr r12,0
	clc
	jmp LB_7844
LB_7843:
	bts r12,0
	stc
LB_7844:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7839
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xra |~ {  } ⊢ %_5692 : %_5692
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_5692
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_5693 : %_5693
 ; {>  %_5692~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_5692 %_5693 } ⊢ %_5694 : %_5694
 ; {>  %_5693~°1◂{  }:(_lst)◂(t2588'(0)) %_5692~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_5694 ⊢ %_5695 : %_5695
 ; {>  %_5694~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_5695
 ; {>  %_5695~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_7833
	btr r12,1
	jmp LB_7834
LB_7833:
	bts r12,1
LB_7834:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7831
	btr QWORD [rdi],0
	jmp LB_7832
LB_7831:
	bts QWORD [rdi],0
LB_7832:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7837
	mov rsi,0
	bt r14,0
	jc LB_7837
	jmp LB_7838
LB_7837:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7838:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7835
	btr QWORD [rdi],1
	jmp LB_7836
LB_7835:
	bts QWORD [rdi],1
LB_7836:
	mov rsi,1
	bt r12,3
	jc LB_7829
	mov rsi,0
	bt r9,0
	jc LB_7829
	jmp LB_7830
LB_7829:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7830:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7839:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7841
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7840
LB_7841:
	add rsp,8
	ret
LB_7842:
	add rsp,16
	pop r14
LB_7840:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7873
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7865
LB_7873:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_5474_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7878
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7879
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7879:
	jmp LB_7865
LB_7878:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7868
	btr r12,1
	clc
	jmp LB_7869
LB_7868:
	bts r12,1
	stc
LB_7869:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7866
	btr r12,0
	clc
	jmp LB_7867
LB_7866:
	bts r12,0
	stc
LB_7867:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7862
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5696 %_5697 } ⊢ %_5698 : %_5698
 ; {>  %_5697~1':(_lst)◂(_r64) %_5696~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5698 ⊢ %_5699 : %_5699
 ; {>  %_5698~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5699
 ; {>  %_5699~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_7856
	btr r12,2
	jmp LB_7857
LB_7856:
	bts r12,2
LB_7857:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7854
	btr QWORD [rdi],0
	jmp LB_7855
LB_7854:
	bts QWORD [rdi],0
LB_7855:
	mov r8,r14
	bt r12,1
	jc LB_7860
	btr r12,2
	jmp LB_7861
LB_7860:
	bts r12,2
LB_7861:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7858
	btr QWORD [rdi],1
	jmp LB_7859
LB_7858:
	bts QWORD [rdi],1
LB_7859:
	mov rsi,1
	bt r12,3
	jc LB_7852
	mov rsi,0
	bt r9,0
	jc LB_7852
	jmp LB_7853
LB_7852:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7853:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7862:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7864
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7863
LB_7864:
	add rsp,8
	ret
LB_7865:
	add rsp,32
	pop r14
LB_7863:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5475:
NS_E_RDI_5475:
NS_E_5475_ETR_TBL:
NS_E_5475_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_7919
LB_7918:
	add r14,1
LB_7919:
	cmp r14,r10
	jge LB_7920
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7918
	cmp al,10
	jz LB_7918
	cmp al,32
	jz LB_7918
LB_7920:
	add r14,4
	cmp r14,r10
	jg LB_7923
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_7923
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_7923
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_7923
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_7923
	jmp LB_7924
LB_7923:
	jmp LB_7897
LB_7924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_7906
LB_7905:
	add r14,1
LB_7906:
	cmp r14,r10
	jge LB_7907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7905
	cmp al,10
	jz LB_7905
	cmp al,32
	jz LB_7905
LB_7907:
	push r10
	call NS_E_5476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7908
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7909
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7909:
	jmp LB_7898
LB_7908:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7912
LB_7911:
	add r14,1
LB_7912:
	cmp r14,r10
	jge LB_7913
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7911
	cmp al,10
	jz LB_7911
	cmp al,32
	jz LB_7911
LB_7913:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7914
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7915
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7915:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7916:
	jmp LB_7898
LB_7914:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7903
	btr r12,2
	clc
	jmp LB_7904
LB_7903:
	bts r12,2
	stc
LB_7904:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7901
	btr r12,1
	clc
	jmp LB_7902
LB_7901:
	bts r12,1
	stc
LB_7902:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7899
	btr r12,0
	clc
	jmp LB_7900
LB_7899:
	bts r12,0
	stc
LB_7900:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7894
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_7925
	btr r12,3
	jmp LB_7926
LB_7925:
	bts r12,3
LB_7926:
	mov r14,r8
	bt r12,2
	jc LB_7927
	btr r12,1
	jmp LB_7928
LB_7927:
	bts r12,1
LB_7928:
	mov r8,r13
	bt r12,0
	jc LB_7929
	btr r12,2
	jmp LB_7930
LB_7929:
	bts r12,2
LB_7930:
	mov r13,r9
	bt r12,3
	jc LB_7931
	btr r12,0
	jmp LB_7932
LB_7931:
	bts r12,0
LB_7932:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5702 : %_5702
 ; {>  %_5701~1':(_p1452)◂(_stg) %_5700~0':(_lst)◂((_p1456)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _f1472 %_5701 ⊢ %_5703 : %_5703
 ; {>  %_5701~1':(_p1452)◂(_stg) %_5700~0':(_lst)◂((_p1456)◂(_stg)) %_5702~°1◂{  }:(_lst)◂(t2603'(0)) }
; _f1472 1' ⊢ °1◂1'
; _f1470 { %_5702 %_5703 } ⊢ %_5704 : %_5704
 ; {>  %_5703~°1◂1':(_p1455)◂(_stg) %_5700~0':(_lst)◂((_p1456)◂(_stg)) %_5702~°1◂{  }:(_lst)◂(t2603'(0)) }
; _f1470 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_5704 ⊢ %_5705 : %_5705
 ; {>  %_5700~0':(_lst)◂((_p1456)◂(_stg)) %_5704~°1◂{ °1◂{  } °1◂1' }:(_p1454)◂(_stg) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_5705
 ; {>  %_5700~0':(_lst)◂((_p1456)◂(_stg)) %_5705~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂((_p1454)◂(_stg)) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_7881
	mov rdi,r13
	call dlt
LB_7881:
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
	jc LB_7886
	mov rsi,0
	bt r13,0
	jc LB_7886
	jmp LB_7887
LB_7886:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7887:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7884
	btr QWORD [rdi],0
	jmp LB_7885
LB_7884:
	bts QWORD [rdi],0
LB_7885:
	mov r13,r14
	bt r12,1
	jc LB_7892
	btr r12,0
	jmp LB_7893
LB_7892:
	bts r12,0
LB_7893:
	mov rsi,1
	bt r12,0
	jc LB_7890
	mov rsi,0
	bt r13,0
	jc LB_7890
	jmp LB_7891
LB_7890:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7891:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7888
	btr QWORD [rdi],1
	jmp LB_7889
LB_7888:
	bts QWORD [rdi],1
LB_7889:
	mov rsi,1
	bt r12,3
	jc LB_7882
	mov rsi,0
	bt r9,0
	jc LB_7882
	jmp LB_7883
LB_7882:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7883:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7894:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7896
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7895
LB_7896:
	add rsp,8
	ret
LB_7898:
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
LB_7897:
	add rsp,48
	pop r14
LB_7895:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_7963
LB_7962:
	add r14,1
LB_7963:
	cmp r14,r10
	jge LB_7964
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7962
	cmp al,10
	jz LB_7962
	cmp al,32
	jz LB_7962
LB_7964:
	add r14,3
	cmp r14,r10
	jg LB_7967
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7967
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7967
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_7967
	jmp LB_7968
LB_7967:
	jmp LB_7953
LB_7968:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_7970
LB_7969:
	add r14,1
LB_7970:
	cmp r14,r10
	jge LB_7971
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7969
	cmp al,10
	jz LB_7969
	cmp al,32
	jz LB_7969
LB_7971:
	push r10
	call NS_E_5476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7972
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7973
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7973:
	jmp LB_7953
LB_7972:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7976
LB_7975:
	add r14,1
LB_7976:
	cmp r14,r10
	jge LB_7977
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7975
	cmp al,10
	jz LB_7975
	cmp al,32
	jz LB_7975
LB_7977:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7978
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7979
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7979:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7980
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7980:
	jmp LB_7953
LB_7978:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_7983
LB_7982:
	add r14,1
LB_7983:
	cmp r14,r10
	jge LB_7984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7982
	cmp al,10
	jz LB_7982
	cmp al,32
	jz LB_7982
LB_7984:
	push r10
	call NS_E_5475_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7985
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7986
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7986:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7987
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7987:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7988
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7988:
	jmp LB_7953
LB_7985:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov r10,rsi
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7960
	btr r12,3
	clc
	jmp LB_7961
LB_7960:
	bts r12,3
	stc
LB_7961:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7958
	btr r12,2
	clc
	jmp LB_7959
LB_7958:
	bts r12,2
	stc
LB_7959:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7956
	btr r12,1
	clc
	jmp LB_7957
LB_7956:
	bts r12,1
	stc
LB_7957:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7954
	btr r12,0
	clc
	jmp LB_7955
LB_7954:
	bts r12,0
	stc
LB_7955:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7950
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov rdx,r8
	bt r12,2
	jc LB_7990
	btr r12,7
	jmp LB_7991
LB_7990:
	bts r12,7
LB_7991:
	mov r8,r9
	bt r12,3
	jc LB_7992
	btr r12,2
	jmp LB_7993
LB_7992:
	bts r12,2
LB_7993:
	mov r9,r14
	bt r12,1
	jc LB_7994
	btr r12,3
	jmp LB_7995
LB_7994:
	bts r12,3
LB_7995:
	mov r14,rdx
	bt r12,7
	jc LB_7996
	btr r12,1
	jmp LB_7997
LB_7996:
	bts r12,1
LB_7997:
	mov rdx,r13
	bt r12,0
	jc LB_7998
	btr r12,7
	jmp LB_7999
LB_7998:
	bts r12,7
LB_7999:
	mov r13,r9
	bt r12,3
	jc LB_8000
	btr r12,0
	jmp LB_8001
LB_8000:
	bts r12,0
LB_8001:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _nil {  } ⊢ %_5709 : %_5709
 ; {>  %_5708~2':(_p1454)◂(_stg) %_5706~0':(_lst)◂((_p1456)◂(_stg)) %_5707~1':(_p1452)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _f1472 %_5707 ⊢ %_5710 : %_5710
 ; {>  %_5709~°1◂{  }:(_lst)◂(t2615'(0)) %_5708~2':(_p1454)◂(_stg) %_5706~0':(_lst)◂((_p1456)◂(_stg)) %_5707~1':(_p1452)◂(_stg) }
; _f1472 1' ⊢ °1◂1'
; _f1469 { %_5709 %_5710 %_5708 } ⊢ %_5711 : %_5711
 ; {>  %_5710~°1◂1':(_p1455)◂(_stg) %_5709~°1◂{  }:(_lst)◂(t2615'(0)) %_5708~2':(_p1454)◂(_stg) %_5706~0':(_lst)◂((_p1456)◂(_stg)) }
; _f1469 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_5711 ⊢ %_5712 : %_5712
 ; {>  %_5711~°0◂{ °1◂{  } °1◂1' 2' }:(_p1454)◂(_stg) %_5706~0':(_lst)◂((_p1456)◂(_stg)) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_5712
 ; {>  %_5712~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂((_p1454)◂(_stg)) %_5706~0':(_lst)◂((_p1456)◂(_stg)) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_7933
	mov rdi,r13
	call dlt
LB_7933:
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
	jc LB_7938
	mov rsi,0
	bt r13,0
	jc LB_7938
	jmp LB_7939
LB_7938:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7939:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7936
	btr QWORD [rdi],0
	jmp LB_7937
LB_7936:
	bts QWORD [rdi],0
LB_7937:
	mov r13,r14
	bt r12,1
	jc LB_7944
	btr r12,0
	jmp LB_7945
LB_7944:
	bts r12,0
LB_7945:
	mov rsi,1
	bt r12,0
	jc LB_7942
	mov rsi,0
	bt r13,0
	jc LB_7942
	jmp LB_7943
LB_7942:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7943:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7940
	btr QWORD [rdi],1
	jmp LB_7941
LB_7940:
	bts QWORD [rdi],1
LB_7941:
	mov r13,r8
	bt r12,2
	jc LB_7948
	btr r12,0
	jmp LB_7949
LB_7948:
	bts r12,0
LB_7949:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,0
	jc LB_7946
	btr QWORD [rdi],2
	jmp LB_7947
LB_7946:
	bts QWORD [rdi],2
LB_7947:
	mov rsi,1
	bt r12,3
	jc LB_7934
	mov rsi,0
	bt r9,0
	jc LB_7934
	jmp LB_7935
LB_7934:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7935:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7950:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7952
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7951
LB_7952:
	add rsp,8
	ret
LB_7953:
	add rsp,64
	pop r14
LB_7951:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5476:
NS_E_RDI_5476:
NS_E_5476_ETR_TBL:
NS_E_5476_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_8021
LB_8020:
	add r14,1
LB_8021:
	cmp r14,r10
	jge LB_8022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8020
	cmp al,10
	jz LB_8020
	cmp al,32
	jz LB_8020
LB_8022:
	push r10
	call NS_E_5477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8023
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8015
LB_8023:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_8026
LB_8025:
	add r14,1
LB_8026:
	cmp r14,r10
	jge LB_8027
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8025
	cmp al,10
	jz LB_8025
	cmp al,32
	jz LB_8025
LB_8027:
	push r10
	call NS_E_5478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8028
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8029
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8029:
	jmp LB_8015
LB_8028:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8018
	btr r12,1
	clc
	jmp LB_8019
LB_8018:
	bts r12,1
	stc
LB_8019:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8016
	btr r12,0
	clc
	jmp LB_8017
LB_8016:
	bts r12,0
	stc
LB_8017:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8012
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5713 %_5714 } ⊢ %_5715 : %_5715
 ; {>  %_5714~1':(_lst)◂((_p1456)◂(_stg)) %_5713~0':(_p1456)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5715 ⊢ %_5716 : %_5716
 ; {>  %_5715~°0◂{ 0' 1' }:(_lst)◂((_p1456)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5716
 ; {>  %_5716~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1456)◂(_stg))) }
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
	jc LB_8006
	btr r12,2
	jmp LB_8007
LB_8006:
	bts r12,2
LB_8007:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8004
	btr QWORD [rdi],0
	jmp LB_8005
LB_8004:
	bts QWORD [rdi],0
LB_8005:
	mov r8,r14
	bt r12,1
	jc LB_8010
	btr r12,2
	jmp LB_8011
LB_8010:
	bts r12,2
LB_8011:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8008
	btr QWORD [rdi],1
	jmp LB_8009
LB_8008:
	bts QWORD [rdi],1
LB_8009:
	mov rsi,1
	bt r12,3
	jc LB_8002
	mov rsi,0
	bt r9,0
	jc LB_8002
	jmp LB_8003
LB_8002:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8003:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8012:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8014
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8013
LB_8014:
	add rsp,8
	ret
LB_8015:
	add rsp,32
	pop r14
LB_8013:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_8042
LB_8041:
	add r14,1
LB_8042:
	cmp r14,r10
	jge LB_8043
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8041
	cmp al,32
	jz LB_8041
LB_8043:
	add r14,1
	cmp r14,r10
	jg LB_8046
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8046
	jmp LB_8047
LB_8046:
	jmp LB_8036
LB_8047:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_8049
LB_8048:
	add r14,1
LB_8049:
	cmp r14,r10
	jge LB_8050
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8048
	cmp al,32
	jz LB_8048
LB_8050:
	add r14,1
	cmp r14,r10
	jg LB_8054
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_8054
	jmp LB_8055
LB_8054:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8052
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8052:
	jmp LB_8036
LB_8055:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8039
	btr r12,1
	clc
	jmp LB_8040
LB_8039:
	bts r12,1
	stc
LB_8040:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8037
	btr r12,0
	clc
	jmp LB_8038
LB_8037:
	bts r12,0
	stc
LB_8038:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8033
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _nil {  } ⊢ %_5717 : %_5717
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5717 ⊢ %_5718 : %_5718
 ; {>  %_5717~°1◂{  }:(_lst)◂(t2630'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5718
 ; {>  %_5718~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2633'(0))) }
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
	jc LB_8031
	mov rsi,0
	bt r9,0
	jc LB_8031
	jmp LB_8032
LB_8031:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8032:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8033:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8035
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8034
LB_8035:
	add rsp,8
	ret
LB_8036:
	add rsp,32
	pop r14
LB_8034:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5477:
NS_E_RDI_5477:
NS_E_5477_ETR_TBL:
NS_E_5477_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_8112
LB_8111:
	add r14,1
LB_8112:
	cmp r14,r10
	jge LB_8113
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8111
	cmp al,10
	jz LB_8111
	cmp al,32
	jz LB_8111
LB_8113:
	push r10
	call NS_E_4579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8114
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8073
LB_8114:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_8117
LB_8116:
	add r14,1
LB_8117:
	cmp r14,r10
	jge LB_8118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8116
	cmp al,10
	jz LB_8116
	cmp al,32
	jz LB_8116
LB_8118:
	add r14,3
	cmp r14,r10
	jg LB_8122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8122
	jmp LB_8123
LB_8122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8120
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8120:
	jmp LB_8073
LB_8123:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_8086
LB_8085:
	add r14,1
LB_8086:
	cmp r14,r10
	jge LB_8087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8085
	cmp al,10
	jz LB_8085
	cmp al,32
	jz LB_8085
LB_8087:
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8088
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8089
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8089:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8090
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8090:
	jmp LB_8074
LB_8088:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_8093
LB_8092:
	add r14,1
LB_8093:
	cmp r14,r10
	jge LB_8094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8092
	cmp al,10
	jz LB_8092
	cmp al,32
	jz LB_8092
LB_8094:
	add r14,3
	cmp r14,r10
	jg LB_8100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_8100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_8100
	jmp LB_8101
LB_8100:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8096
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8096:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8097
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8097:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8098
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8098:
	jmp LB_8074
LB_8101:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_8103
LB_8102:
	add r14,1
LB_8103:
	cmp r14,r10
	jge LB_8104
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8102
	cmp al,10
	jz LB_8102
	cmp al,32
	jz LB_8102
LB_8104:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8105
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8106
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8106:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8107
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8107:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8108
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8108:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8109:
	jmp LB_8074
LB_8105:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8083
	btr r12,4
	clc
	jmp LB_8084
LB_8083:
	bts r12,4
	stc
LB_8084:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8081
	btr r12,3
	clc
	jmp LB_8082
LB_8081:
	bts r12,3
	stc
LB_8082:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8079
	btr r12,2
	clc
	jmp LB_8080
LB_8079:
	bts r12,2
	stc
LB_8080:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8077
	btr r12,1
	clc
	jmp LB_8078
LB_8077:
	bts r12,1
	stc
LB_8078:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8075
	btr r12,0
	clc
	jmp LB_8076
LB_8075:
	bts r12,0
	stc
LB_8076:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8070
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_8124
	btr r12,5
	jmp LB_8125
LB_8124:
	bts r12,5
LB_8125:
	mov r8,r10
	bt r12,4
	jc LB_8126
	btr r12,2
	jmp LB_8127
LB_8126:
	bts r12,2
LB_8127:
	mov r10,r14
	bt r12,1
	jc LB_8128
	btr r12,4
	jmp LB_8129
LB_8128:
	bts r12,4
LB_8129:
	mov r14,r11
	bt r12,5
	jc LB_8130
	btr r12,1
	jmp LB_8131
LB_8130:
	bts r12,1
LB_8131:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1473 { %_5719 %_5720 %_5721 } ⊢ %_5722 : %_5722
 ; {>  %_5719~0':(_p1439)◂((_p1446)◂(_stg)) %_5721~2':(_p1439)◂((_p1447)◂(_stg)) %_5720~1':_p1394 }
; _f1473 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_5722 ⊢ %_5723 : %_5723
 ; {>  %_5722~°0◂{ 0' 1' 2' }:(_p1456)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_5723
 ; {>  %_5723~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p1456)◂(_stg)) }
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
	jc LB_8060
	btr r12,4
	jmp LB_8061
LB_8060:
	bts r12,4
LB_8061:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8058
	btr QWORD [rdi],0
	jmp LB_8059
LB_8058:
	bts QWORD [rdi],0
LB_8059:
	mov r10,r14
	bt r12,1
	jc LB_8064
	btr r12,4
	jmp LB_8065
LB_8064:
	bts r12,4
LB_8065:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8062
	btr QWORD [rdi],1
	jmp LB_8063
LB_8062:
	bts QWORD [rdi],1
LB_8063:
	mov r10,r8
	bt r12,2
	jc LB_8068
	btr r12,4
	jmp LB_8069
LB_8068:
	bts r12,4
LB_8069:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_8066
	btr QWORD [rdi],2
	jmp LB_8067
LB_8066:
	bts QWORD [rdi],2
LB_8067:
	mov rsi,1
	bt r12,3
	jc LB_8056
	mov rsi,0
	bt r9,0
	jc LB_8056
	jmp LB_8057
LB_8056:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8057:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8070:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8072
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8071
LB_8072:
	add rsp,8
	ret
LB_8074:
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
LB_8073:
	add rsp,80
	pop r14
LB_8071:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_8153
LB_8152:
	add r14,1
LB_8153:
	cmp r14,r10
	jge LB_8154
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8152
	cmp al,32
	jz LB_8152
LB_8154:
	push r10
	call NS_E_5479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8155
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8145
LB_8155:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_8158
LB_8157:
	add r14,1
LB_8158:
	cmp r14,r10
	jge LB_8159
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8157
	cmp al,32
	jz LB_8157
LB_8159:
	add r14,1
	cmp r14,r10
	jg LB_8163
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_8163
	jmp LB_8164
LB_8163:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8161
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8161:
	jmp LB_8145
LB_8164:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_8166
LB_8165:
	add r14,1
LB_8166:
	cmp r14,r10
	jge LB_8167
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8165
	cmp al,32
	jz LB_8165
LB_8167:
	push r10
	call NS_E_5479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8168
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8169
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8169:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8170
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8170:
	jmp LB_8145
LB_8168:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8150
	btr r12,2
	clc
	jmp LB_8151
LB_8150:
	bts r12,2
	stc
LB_8151:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8148
	btr r12,1
	clc
	jmp LB_8149
LB_8148:
	bts r12,1
	stc
LB_8149:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8146
	btr r12,0
	clc
	jmp LB_8147
LB_8146:
	bts r12,0
	stc
LB_8147:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8142
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov rcx,r14
	bt r12,1
	jc LB_8172
	btr r12,6
	jmp LB_8173
LB_8172:
	bts r12,6
LB_8173:
	mov r14,r8
	bt r12,2
	jc LB_8174
	btr r12,1
	jmp LB_8175
LB_8174:
	bts r12,1
LB_8175:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1474 { %_5724 %_5725 } ⊢ %_5726 : %_5726
 ; {>  %_5725~1':(_p1457)◂(_stg) %_5724~0':(_p1457)◂(_stg) }
; _f1474 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5726 ⊢ %_5727 : %_5727
 ; {>  %_5726~°1◂{ 0' 1' }:(_p1456)◂(_stg) }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5727
 ; {>  %_5727~°0◂°1◂{ 0' 1' }:(_opn)◂((_p1456)◂(_stg)) }
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
	jc LB_8136
	btr r12,2
	jmp LB_8137
LB_8136:
	bts r12,2
LB_8137:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8134
	btr QWORD [rdi],0
	jmp LB_8135
LB_8134:
	bts QWORD [rdi],0
LB_8135:
	mov r8,r14
	bt r12,1
	jc LB_8140
	btr r12,2
	jmp LB_8141
LB_8140:
	bts r12,2
LB_8141:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8138
	btr QWORD [rdi],1
	jmp LB_8139
LB_8138:
	bts QWORD [rdi],1
LB_8139:
	mov rsi,1
	bt r12,3
	jc LB_8132
	mov rsi,0
	bt r9,0
	jc LB_8132
	jmp LB_8133
LB_8132:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8133:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8142:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8144
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8143
LB_8144:
	add rsp,8
	ret
LB_8145:
	add rsp,48
	pop r14
LB_8143:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5478:
NS_E_RDI_5478:
NS_E_5478_ETR_TBL:
NS_E_5478_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_8211
LB_8210:
	add r14,1
LB_8211:
	cmp r14,r10
	jge LB_8212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8210
	cmp al,10
	jz LB_8210
	cmp al,32
	jz LB_8210
LB_8212:
	add r14,1
	cmp r14,r10
	jg LB_8215
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_8215
	jmp LB_8216
LB_8215:
	jmp LB_8189
LB_8216:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_8198
LB_8197:
	add r14,1
LB_8198:
	cmp r14,r10
	jge LB_8199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8197
	cmp al,10
	jz LB_8197
	cmp al,32
	jz LB_8197
LB_8199:
	push r10
	call NS_E_5477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8200
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8201:
	jmp LB_8190
LB_8200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_8204
LB_8203:
	add r14,1
LB_8204:
	cmp r14,r10
	jge LB_8205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8203
	cmp al,10
	jz LB_8203
	cmp al,32
	jz LB_8203
LB_8205:
	push r10
	call NS_E_5478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8206
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8207
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8207:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8208:
	jmp LB_8190
LB_8206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8195
	btr r12,2
	clc
	jmp LB_8196
LB_8195:
	bts r12,2
	stc
LB_8196:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8193
	btr r12,1
	clc
	jmp LB_8194
LB_8193:
	bts r12,1
	stc
LB_8194:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8191
	btr r12,0
	clc
	jmp LB_8192
LB_8191:
	bts r12,0
	stc
LB_8192:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8186
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8217
	btr r12,3
	jmp LB_8218
LB_8217:
	bts r12,3
LB_8218:
	mov r14,r8
	bt r12,2
	jc LB_8219
	btr r12,1
	jmp LB_8220
LB_8219:
	bts r12,1
LB_8220:
	mov r8,r13
	bt r12,0
	jc LB_8221
	btr r12,2
	jmp LB_8222
LB_8221:
	bts r12,2
LB_8222:
	mov r13,r9
	bt r12,3
	jc LB_8223
	btr r12,0
	jmp LB_8224
LB_8223:
	bts r12,0
LB_8224:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5728 %_5729 } ⊢ %_5730 : %_5730
 ; {>  %_5729~1':(_lst)◂((_p1456)◂(_stg)) %_5728~0':(_p1456)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5730 ⊢ %_5731 : %_5731
 ; {>  %_5730~°0◂{ 0' 1' }:(_lst)◂((_p1456)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5731
 ; {>  %_5731~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1456)◂(_stg))) }
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
	jc LB_8180
	btr r12,2
	jmp LB_8181
LB_8180:
	bts r12,2
LB_8181:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8178
	btr QWORD [rdi],0
	jmp LB_8179
LB_8178:
	bts QWORD [rdi],0
LB_8179:
	mov r8,r14
	bt r12,1
	jc LB_8184
	btr r12,2
	jmp LB_8185
LB_8184:
	bts r12,2
LB_8185:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8182
	btr QWORD [rdi],1
	jmp LB_8183
LB_8182:
	bts QWORD [rdi],1
LB_8183:
	mov rsi,1
	bt r12,3
	jc LB_8176
	mov rsi,0
	bt r9,0
	jc LB_8176
	jmp LB_8177
LB_8176:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8177:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8186:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8188
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8187
LB_8188:
	add rsp,8
	ret
LB_8190:
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
LB_8189:
	add rsp,48
	pop r14
LB_8187:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_8236
LB_8235:
	add r14,1
LB_8236:
	cmp r14,r10
	jge LB_8237
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8235
	cmp al,32
	jz LB_8235
LB_8237:
	add r14,1
	cmp r14,r10
	jg LB_8240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8240
	jmp LB_8241
LB_8240:
	jmp LB_8230
LB_8241:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_8243
LB_8242:
	add r14,1
LB_8243:
	cmp r14,r10
	jge LB_8244
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8242
	cmp al,32
	jz LB_8242
LB_8244:
	add r14,1
	cmp r14,r10
	jg LB_8248
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_8248
	jmp LB_8249
LB_8248:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8246
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8246:
	jmp LB_8230
LB_8249:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8233
	btr r12,1
	clc
	jmp LB_8234
LB_8233:
	bts r12,1
	stc
LB_8234:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8231
	btr r12,0
	clc
	jmp LB_8232
LB_8231:
	bts r12,0
	stc
LB_8232:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8227
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _nil {  } ⊢ %_5732 : %_5732
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5732 ⊢ %_5733 : %_5733
 ; {>  %_5732~°1◂{  }:(_lst)◂(t2664'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5733
 ; {>  %_5733~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2667'(0))) }
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
	jc LB_8225
	mov rsi,0
	bt r9,0
	jc LB_8225
	jmp LB_8226
LB_8225:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8226:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8227:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8229
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8228
LB_8229:
	add rsp,8
	ret
LB_8230:
	add rsp,32
	pop r14
LB_8228:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5479:
NS_E_RDI_5479:
NS_E_5479_ETR_TBL:
NS_E_5479_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8265
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8257
LB_8265:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_8273
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_8273
	jmp LB_8274
LB_8273:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8271
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8271:
	jmp LB_8257
LB_8274:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8260
	btr r12,1
	clc
	jmp LB_8261
LB_8260:
	bts r12,1
	stc
LB_8261:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8258
	btr r12,0
	clc
	jmp LB_8259
LB_8258:
	bts r12,0
	stc
LB_8259:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8254
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1476 %_5734 ⊢ %_5735 : %_5735
 ; {>  %_5734~0':_stg }
; _f1476 0' ⊢ °1◂0'
; _some %_5735 ⊢ %_5736 : %_5736
 ; {>  %_5735~°1◂0':(_p1457)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5736
 ; {>  %_5736~°0◂°1◂0':(_opn)◂((_p1457)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8252
	btr r12,3
	jmp LB_8253
LB_8252:
	bts r12,3
LB_8253:
	mov rsi,1
	bt r12,3
	jc LB_8250
	mov rsi,0
	bt r9,0
	jc LB_8250
	jmp LB_8251
LB_8250:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8251:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8254:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8256
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8255
LB_8256:
	add rsp,8
	ret
LB_8257:
	add rsp,32
	pop r14
LB_8255:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_4450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8288
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8282
LB_8288:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8283
	btr r12,0
	clc
	jmp LB_8284
LB_8283:
	bts r12,0
	stc
LB_8284:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8279
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1475 %_5737 ⊢ %_5738 : %_5738
 ; {>  %_5737~0':_p1442 }
; _f1475 0' ⊢ °0◂0'
; _some %_5738 ⊢ %_5739 : %_5739
 ; {>  %_5738~°0◂0':(_p1457)◂(t2677'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5739
 ; {>  %_5739~°0◂°0◂0':(_opn)◂((_p1457)◂(t2680'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8277
	btr r12,3
	jmp LB_8278
LB_8277:
	bts r12,3
LB_8278:
	mov rsi,1
	bt r12,3
	jc LB_8275
	mov rsi,0
	bt r9,0
	jc LB_8275
	jmp LB_8276
LB_8275:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8276:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8279:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8281
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8280
LB_8281:
	add rsp,8
	ret
LB_8282:
	add rsp,16
	pop r14
LB_8280:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5480:
NS_E_RDI_5480:
NS_E_5480_ETR_TBL:
NS_E_5480_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_8311
LB_8310:
	add r14,1
LB_8311:
	cmp r14,r10
	jge LB_8312
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8310
	cmp al,10
	jz LB_8310
	cmp al,32
	jz LB_8310
LB_8312:
	add r14,1
	cmp r14,r10
	jg LB_8315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_8315
	jmp LB_8316
LB_8315:
	jmp LB_8301
LB_8316:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_8318
LB_8317:
	add r14,1
LB_8318:
	cmp r14,r10
	jge LB_8319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8317
	cmp al,10
	jz LB_8317
	cmp al,32
	jz LB_8317
LB_8319:
	add r14,1
	cmp r14,r10
	jg LB_8323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8323
	jmp LB_8324
LB_8323:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8321
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8321:
	jmp LB_8301
LB_8324:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_8326
LB_8325:
	add r14,1
LB_8326:
	cmp r14,r10
	jge LB_8327
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8325
	cmp al,10
	jz LB_8325
	cmp al,32
	jz LB_8325
LB_8327:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8328
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8329
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8329:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8330
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8330:
	jmp LB_8301
LB_8328:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_8333
LB_8332:
	add r14,1
LB_8333:
	cmp r14,r10
	jge LB_8334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8332
	cmp al,10
	jz LB_8332
	cmp al,32
	jz LB_8332
LB_8334:
	push r10
	call NS_E_5481_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8335
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8336
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8336:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8337
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8337:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8338
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8338:
	jmp LB_8301
LB_8335:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov r10,rsi
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8308
	btr r12,3
	clc
	jmp LB_8309
LB_8308:
	bts r12,3
	stc
LB_8309:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8306
	btr r12,2
	clc
	jmp LB_8307
LB_8306:
	bts r12,2
	stc
LB_8307:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8304
	btr r12,1
	clc
	jmp LB_8305
LB_8304:
	bts r12,1
	stc
LB_8305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8302
	btr r12,0
	clc
	jmp LB_8303
LB_8302:
	bts r12,0
	stc
LB_8303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8298
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov rdx,r14
	bt r12,1
	jc LB_8340
	btr r12,7
	jmp LB_8341
LB_8340:
	bts r12,7
LB_8341:
	mov r14,r9
	bt r12,3
	jc LB_8342
	btr r12,1
	jmp LB_8343
LB_8342:
	bts r12,1
LB_8343:
	mov r9,r13
	bt r12,0
	jc LB_8344
	btr r12,3
	jmp LB_8345
LB_8344:
	bts r12,3
LB_8345:
	mov r13,r8
	bt r12,2
	jc LB_8346
	btr r12,0
	jmp LB_8347
LB_8346:
	bts r12,0
LB_8347:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _some { %_5740 %_5741 } ⊢ %_5742 : %_5742
 ; {>  %_5741~1':_p1489 %_5740~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_5742
 ; {>  %_5742~°0◂{ 0' 1' }:(_opn)◂({ _stg _p1489 }) }
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
	jc LB_8292
	btr r12,2
	jmp LB_8293
LB_8292:
	bts r12,2
LB_8293:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8290
	btr QWORD [rdi],0
	jmp LB_8291
LB_8290:
	bts QWORD [rdi],0
LB_8291:
	mov r8,r14
	bt r12,1
	jc LB_8296
	btr r12,2
	jmp LB_8297
LB_8296:
	bts r12,2
LB_8297:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8294
	btr QWORD [rdi],1
	jmp LB_8295
LB_8294:
	bts QWORD [rdi],1
LB_8295:
	mov r8,0
	bts r12,2
	ret
LB_8298:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8300
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8299
LB_8300:
	add rsp,8
	ret
LB_8301:
	add rsp,64
	pop r14
LB_8299:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5481:
NS_E_RDI_5481:
NS_E_5481_ETR_TBL:
NS_E_5481_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_8359
LB_8358:
	add r14,1
LB_8359:
	cmp r14,r10
	jge LB_8360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8358
	cmp al,10
	jz LB_8358
	cmp al,32
	jz LB_8358
LB_8360:
	push r10
	call NS_E_5482_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8361
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8355
LB_8361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8356
	btr r12,0
	clc
	jmp LB_8357
LB_8356:
	bts r12,0
	stc
LB_8357:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8352
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1512 %_5743 ⊢ %_5744 : %_5744
 ; {>  %_5743~0':_p1491 }
; _f1512 0' ⊢ °1◂0'
; _some %_5744 ⊢ %_5745 : %_5745
 ; {>  %_5744~°1◂0':_p1489 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5745
 ; {>  %_5745~°0◂°1◂0':(_opn)◂(_p1489) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8350
	btr r12,3
	jmp LB_8351
LB_8350:
	bts r12,3
LB_8351:
	mov rsi,1
	bt r12,3
	jc LB_8348
	mov rsi,0
	bt r9,0
	jc LB_8348
	jmp LB_8349
LB_8348:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8349:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8352:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8354
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8353
LB_8354:
	add rsp,8
	ret
LB_8355:
	add rsp,16
	pop r14
LB_8353:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_8374
LB_8373:
	add r14,1
LB_8374:
	cmp r14,r10
	jge LB_8375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8373
	cmp al,10
	jz LB_8373
	cmp al,32
	jz LB_8373
LB_8375:
	push r10
	call NS_E_5490_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8376
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8370
LB_8376:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8371
	btr r12,0
	clc
	jmp LB_8372
LB_8371:
	bts r12,0
	stc
LB_8372:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8367
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1511 %_5746 ⊢ %_5747 : %_5747
 ; {>  %_5746~0':_p1490 }
; _f1511 0' ⊢ °0◂0'
; _some %_5747 ⊢ %_5748 : %_5748
 ; {>  %_5747~°0◂0':_p1489 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5748
 ; {>  %_5748~°0◂°0◂0':(_opn)◂(_p1489) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8365
	btr r12,3
	jmp LB_8366
LB_8365:
	bts r12,3
LB_8366:
	mov rsi,1
	bt r12,3
	jc LB_8363
	mov rsi,0
	bt r9,0
	jc LB_8363
	jmp LB_8364
LB_8363:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8364:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8367:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8369
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8368
LB_8369:
	add rsp,8
	ret
LB_8370:
	add rsp,16
	pop r14
LB_8368:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5482:
NS_E_RDI_5482:
NS_E_5482_ETR_TBL:
NS_E_5482_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_8427
LB_8426:
	add r14,1
LB_8427:
	cmp r14,r10
	jge LB_8428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8426
	cmp al,10
	jz LB_8426
	cmp al,32
	jz LB_8426
LB_8428:
	push r10
	call NS_E_5489_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8429
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8405
LB_8429:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8414
LB_8413:
	add r14,1
LB_8414:
	cmp r14,r10
	jge LB_8415
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8413
	cmp al,10
	jz LB_8413
	cmp al,32
	jz LB_8413
LB_8415:
	push r10
	call NS_E_5484_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8416
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8417
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8417:
	jmp LB_8406
LB_8416:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_8420
LB_8419:
	add r14,1
LB_8420:
	cmp r14,r10
	jge LB_8421
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8419
	cmp al,10
	jz LB_8419
	cmp al,32
	jz LB_8419
LB_8421:
	push r10
	call NS_E_5483_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8422
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8423
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8423:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8424
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8424:
	jmp LB_8406
LB_8422:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8411
	btr r12,2
	clc
	jmp LB_8412
LB_8411:
	bts r12,2
	stc
LB_8412:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8409
	btr r12,1
	clc
	jmp LB_8410
LB_8409:
	bts r12,1
	stc
LB_8410:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8407
	btr r12,0
	clc
	jmp LB_8408
LB_8407:
	bts r12,0
	stc
LB_8408:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8402
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_8431
	btr r12,5
	jmp LB_8432
LB_8431:
	bts r12,5
LB_8432:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_8435
	btr r12,6
	clc
	jmp LB_8436
LB_8435:
	bts r12,6
	stc
LB_8436:
	mov r8,rcx
	bt r12,6
	jc LB_8433
	btr r12,2
	jmp LB_8434
LB_8433:
	bts r12,2
LB_8434:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_8439
	btr r12,6
	clc
	jmp LB_8440
LB_8439:
	bts r12,6
	stc
LB_8440:
	mov r9,rcx
	bt r12,6
	jc LB_8437
	btr r12,3
	jmp LB_8438
LB_8437:
	bts r12,3
LB_8438:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_8443
	btr r12,6
	clc
	jmp LB_8444
LB_8443:
	bts r12,6
	stc
LB_8444:
	mov r10,rcx
	bt r12,6
	jc LB_8441
	btr r12,4
	jmp LB_8442
LB_8441:
	bts r12,4
LB_8442:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f1516 { %_5751 %_5752 %_5749 %_5750 %_5753 } ⊢ %_5754 : %_5754
 ; {>  %_5753~4':(_opn)◂(_p1491) %_5751~2':(_p1439)◂((_p1447)◂(_stg)) %_5750~1':_p1493 %_5749~0':_p1492 %_5752~3':(_p1452)◂(_stg) }
; _f1516 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_5754 ⊢ %_5755 : %_5755
 ; {>  %_5754~°1◂{ 2' 3' 0' 1' 4' }:_p1491 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_5755
 ; {>  %_5755~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p1491) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_8378
	btr r12,5
	jmp LB_8379
LB_8378:
	bts r12,5
LB_8379:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_8384
	btr r12,6
	jmp LB_8385
LB_8384:
	bts r12,6
LB_8385:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_8382
	btr QWORD [rdi],0
	jmp LB_8383
LB_8382:
	bts QWORD [rdi],0
LB_8383:
	mov rcx,r11
	bt r12,5
	jc LB_8388
	btr r12,6
	jmp LB_8389
LB_8388:
	bts r12,6
LB_8389:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_8386
	btr QWORD [rdi],1
	jmp LB_8387
LB_8386:
	bts QWORD [rdi],1
LB_8387:
	mov rcx,r13
	bt r12,0
	jc LB_8392
	btr r12,6
	jmp LB_8393
LB_8392:
	bts r12,6
LB_8393:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_8390
	btr QWORD [rdi],2
	jmp LB_8391
LB_8390:
	bts QWORD [rdi],2
LB_8391:
	mov rcx,r14
	bt r12,1
	jc LB_8396
	btr r12,6
	jmp LB_8397
LB_8396:
	bts r12,6
LB_8397:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_8394
	btr QWORD [rdi],3
	jmp LB_8395
LB_8394:
	bts QWORD [rdi],3
LB_8395:
	mov rcx,r10
	bt r12,4
	jc LB_8400
	btr r12,6
	jmp LB_8401
LB_8400:
	bts r12,6
LB_8401:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_8398
	btr QWORD [rdi],4
	jmp LB_8399
LB_8398:
	bts QWORD [rdi],4
LB_8399:
	mov rsi,1
	bt r12,3
	jc LB_8380
	mov rsi,0
	bt r9,0
	jc LB_8380
	jmp LB_8381
LB_8380:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8381:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8402:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8404
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8403
LB_8404:
	add rsp,8
	ret
LB_8406:
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
LB_8405:
	add rsp,48
	pop r14
LB_8403:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_8486
LB_8485:
	add r14,1
LB_8486:
	cmp r14,r10
	jge LB_8487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8485
	cmp al,10
	jz LB_8485
	cmp al,32
	jz LB_8485
LB_8487:
	push r10
	call NS_E_5488_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8488
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8476
LB_8488:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8491
LB_8490:
	add r14,1
LB_8491:
	cmp r14,r10
	jge LB_8492
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8490
	cmp al,10
	jz LB_8490
	cmp al,32
	jz LB_8490
LB_8492:
	push r10
	call NS_E_5484_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8493
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8494
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8494:
	jmp LB_8476
LB_8493:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_8497
LB_8496:
	add r14,1
LB_8497:
	cmp r14,r10
	jge LB_8498
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8496
	cmp al,10
	jz LB_8496
	cmp al,32
	jz LB_8496
LB_8498:
	push r10
	call NS_E_5483_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8499
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8500
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8500:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8501
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8501:
	jmp LB_8476
LB_8499:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_8504
LB_8503:
	add r14,1
LB_8504:
	cmp r14,r10
	jge LB_8505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8503
	cmp al,10
	jz LB_8503
	cmp al,32
	jz LB_8503
LB_8505:
	push r10
	call NS_E_5482_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8506
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8507
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8507:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8508
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8508:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8509
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8509:
	jmp LB_8476
LB_8506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov r10,rsi
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8483
	btr r12,3
	clc
	jmp LB_8484
LB_8483:
	bts r12,3
	stc
LB_8484:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8481
	btr r12,2
	clc
	jmp LB_8482
LB_8481:
	bts r12,2
	stc
LB_8482:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8479
	btr r12,1
	clc
	jmp LB_8480
LB_8479:
	bts r12,1
	stc
LB_8480:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8477
	btr r12,0
	clc
	jmp LB_8478
LB_8477:
	bts r12,0
	stc
LB_8478:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8473
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov rdx,r11
	bt r12,5
	jc LB_8511
	btr r12,7
	jmp LB_8512
LB_8511:
	bts r12,7
LB_8512:
	mov r11,r9
	bt r12,3
	jc LB_8513
	btr r12,5
	jmp LB_8514
LB_8513:
	bts r12,5
LB_8514:
	mov rdi,r10
	mov QWORD [st_vct+8*9],rdi
	bt r12,4
	jc LB_8515
	btr r12,9
	jmp LB_8516
LB_8515:
	bts r12,9
LB_8516:
	mov rdi,r8
	mov QWORD [st_vct+8*8],rdi
	bt r12,2
	jc LB_8517
	btr r12,8
	jmp LB_8518
LB_8517:
	bts r12,8
LB_8518:
; 8' ⊢ { 2' 3' 4' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],0
	jc LB_8521
	btr r12,10
	clc
	jmp LB_8522
LB_8521:
	bts r12,10
	stc
LB_8522:
	mov r8,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_8519
	btr r12,2
	jmp LB_8520
LB_8519:
	bts r12,2
LB_8520:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],1
	jc LB_8525
	btr r12,10
	clc
	jmp LB_8526
LB_8525:
	bts r12,10
	stc
LB_8526:
	mov r9,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_8523
	btr r12,3
	jmp LB_8524
LB_8523:
	bts r12,3
LB_8524:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],2
	jc LB_8529
	btr r12,10
	clc
	jmp LB_8530
LB_8529:
	bts r12,10
	stc
LB_8530:
	mov r10,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_8527
	btr r12,4
	jmp LB_8528
LB_8527:
	bts r12,4
LB_8528:
	mov rdi,QWORD [st_vct+8*8]
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _f1515 { %_5758 %_5759 %_5756 %_5757 %_5760 %_5761 } ⊢ %_5762 : %_5762
 ; {>  %_5756~0':_p1492 %_5759~3':(_p1452)◂(_stg) %_5758~2':(_p1439)◂((_p1447)◂(_stg)) %_5761~5':_p1491 %_5757~1':_p1493 %_5760~4':(_opn)◂(_p1491) }
; _f1515 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_5762 ⊢ %_5763 : %_5763
 ; {>  %_5762~°0◂{ 2' 3' 0' 1' 4' 5' }:_p1491 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_5763
 ; {>  %_5763~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p1491) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_8445
	btr r12,6
	jmp LB_8446
LB_8445:
	bts r12,6
LB_8446:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_8451
	btr r12,7
	jmp LB_8452
LB_8451:
	bts r12,7
LB_8452:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_8449
	btr QWORD [rdi],0
	jmp LB_8450
LB_8449:
	bts QWORD [rdi],0
LB_8450:
	mov rdx,rcx
	bt r12,6
	jc LB_8455
	btr r12,7
	jmp LB_8456
LB_8455:
	bts r12,7
LB_8456:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_8453
	btr QWORD [rdi],1
	jmp LB_8454
LB_8453:
	bts QWORD [rdi],1
LB_8454:
	mov rdx,r13
	bt r12,0
	jc LB_8459
	btr r12,7
	jmp LB_8460
LB_8459:
	bts r12,7
LB_8460:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,7
	jc LB_8457
	btr QWORD [rdi],2
	jmp LB_8458
LB_8457:
	bts QWORD [rdi],2
LB_8458:
	mov rdx,r14
	bt r12,1
	jc LB_8463
	btr r12,7
	jmp LB_8464
LB_8463:
	bts r12,7
LB_8464:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,7
	jc LB_8461
	btr QWORD [rdi],3
	jmp LB_8462
LB_8461:
	bts QWORD [rdi],3
LB_8462:
	mov rdx,r10
	bt r12,4
	jc LB_8467
	btr r12,7
	jmp LB_8468
LB_8467:
	bts r12,7
LB_8468:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,7
	jc LB_8465
	btr QWORD [rdi],4
	jmp LB_8466
LB_8465:
	bts QWORD [rdi],4
LB_8466:
	mov rdx,r11
	bt r12,5
	jc LB_8471
	btr r12,7
	jmp LB_8472
LB_8471:
	bts r12,7
LB_8472:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*5],rsi
	bt r12,7
	jc LB_8469
	btr QWORD [rdi],5
	jmp LB_8470
LB_8469:
	bts QWORD [rdi],5
LB_8470:
	mov rsi,1
	bt r12,3
	jc LB_8447
	mov rsi,0
	bt r9,0
	jc LB_8447
	jmp LB_8448
LB_8447:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8448:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8473:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8475
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8474
LB_8475:
	add rsp,8
	ret
LB_8476:
	add rsp,64
	pop r14
LB_8474:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5483:
NS_E_RDI_5483:
NS_E_5483_ETR_TBL:
NS_E_5483_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_8585
LB_8584:
	add r14,1
LB_8585:
	cmp r14,r10
	jge LB_8586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8584
	cmp al,10
	jz LB_8584
	cmp al,32
	jz LB_8584
LB_8586:
	add r14,1
	cmp r14,r10
	jg LB_8589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_8589
	jmp LB_8590
LB_8589:
	jmp LB_8548
LB_8590:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_8592
LB_8591:
	add r14,1
LB_8592:
	cmp r14,r10
	jge LB_8593
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8591
	cmp al,10
	jz LB_8591
	cmp al,32
	jz LB_8591
LB_8593:
	add r14,3
	cmp r14,r10
	jg LB_8597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8597
	jmp LB_8598
LB_8597:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8595
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8595:
	jmp LB_8548
LB_8598:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_8561
LB_8560:
	add r14,1
LB_8561:
	cmp r14,r10
	jge LB_8562
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8560
	cmp al,10
	jz LB_8560
	cmp al,32
	jz LB_8560
LB_8562:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8563
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8564
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8564:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8565
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8565:
	jmp LB_8549
LB_8563:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_8568
LB_8567:
	add r14,1
LB_8568:
	cmp r14,r10
	jge LB_8569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8567
	cmp al,10
	jz LB_8567
	cmp al,32
	jz LB_8567
LB_8569:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8570
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8571
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8571:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8572
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8572:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8573
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8573:
	jmp LB_8549
LB_8570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_8576
LB_8575:
	add r14,1
LB_8576:
	cmp r14,r10
	jge LB_8577
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8575
	cmp al,10
	jz LB_8575
	cmp al,32
	jz LB_8575
LB_8577:
	push r10
	call NS_E_5482_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8578
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8579
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8579:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8580
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8580:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8581
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8581:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8582:
	jmp LB_8549
LB_8578:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8558
	btr r12,4
	clc
	jmp LB_8559
LB_8558:
	bts r12,4
	stc
LB_8559:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8556
	btr r12,3
	clc
	jmp LB_8557
LB_8556:
	bts r12,3
	stc
LB_8557:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8554
	btr r12,2
	clc
	jmp LB_8555
LB_8554:
	bts r12,2
	stc
LB_8555:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8552
	btr r12,1
	clc
	jmp LB_8553
LB_8552:
	bts r12,1
	stc
LB_8553:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8550
	btr r12,0
	clc
	jmp LB_8551
LB_8550:
	bts r12,0
	stc
LB_8551:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8545
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_8599
	btr r12,5
	jmp LB_8600
LB_8599:
	bts r12,5
LB_8600:
	mov r8,r10
	bt r12,4
	jc LB_8601
	btr r12,2
	jmp LB_8602
LB_8601:
	bts r12,2
LB_8602:
	mov r10,r14
	bt r12,1
	jc LB_8603
	btr r12,4
	jmp LB_8604
LB_8603:
	bts r12,4
LB_8604:
	mov r14,r9
	bt r12,3
	jc LB_8605
	btr r12,1
	jmp LB_8606
LB_8605:
	bts r12,1
LB_8606:
	mov r9,r13
	bt r12,0
	jc LB_8607
	btr r12,3
	jmp LB_8608
LB_8607:
	bts r12,3
LB_8608:
	mov r13,r11
	bt r12,5
	jc LB_8609
	btr r12,0
	jmp LB_8610
LB_8609:
	bts r12,0
LB_8610:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5766 ⊢ %_5767 : %_5767
 ; {>  %_5764~0':(_p1439)◂((_p1447)◂(_stg)) %_5766~2':_p1491 %_5765~1':(_p1452)◂(_stg) }
; _some 2' ⊢ °0◂2'
; _some { %_5764 %_5765 %_5767 } ⊢ %_5768 : %_5768
 ; {>  %_5764~0':(_p1439)◂((_p1447)◂(_stg)) %_5767~°0◂2':(_opn)◂(_p1491) %_5765~1':(_p1452)◂(_stg) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_5768
 ; {>  %_5768~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) (_opn)◂(_p1491) }) }
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
	jc LB_8533
	btr r12,4
	jmp LB_8534
LB_8533:
	bts r12,4
LB_8534:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8531
	btr QWORD [rdi],0
	jmp LB_8532
LB_8531:
	bts QWORD [rdi],0
LB_8532:
	mov r10,r14
	bt r12,1
	jc LB_8537
	btr r12,4
	jmp LB_8538
LB_8537:
	bts r12,4
LB_8538:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8535
	btr QWORD [rdi],1
	jmp LB_8536
LB_8535:
	bts QWORD [rdi],1
LB_8536:
	mov r10,r8
	bt r12,2
	jc LB_8543
	btr r12,4
	jmp LB_8544
LB_8543:
	bts r12,4
LB_8544:
	mov rsi,1
	bt r12,4
	jc LB_8541
	mov rsi,0
	bt r10,0
	jc LB_8541
	jmp LB_8542
LB_8541:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_8542:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_8539
	btr QWORD [rdi],2
	jmp LB_8540
LB_8539:
	bts QWORD [rdi],2
LB_8540:
	mov r8,0
	bts r12,2
	ret
LB_8545:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8547
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8546
LB_8547:
	add rsp,8
	ret
LB_8549:
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
LB_8548:
	add rsp,80
	pop r14
LB_8546:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_8648
LB_8647:
	add r14,1
LB_8648:
	cmp r14,r10
	jge LB_8649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8647
	cmp al,10
	jz LB_8647
	cmp al,32
	jz LB_8647
LB_8649:
	add r14,3
	cmp r14,r10
	jg LB_8652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8652
	jmp LB_8653
LB_8652:
	jmp LB_8626
LB_8653:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_8635
LB_8634:
	add r14,1
LB_8635:
	cmp r14,r10
	jge LB_8636
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8634
	cmp al,10
	jz LB_8634
	cmp al,32
	jz LB_8634
LB_8636:
	push r10
	call NS_E_4840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8637
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8638
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8638:
	jmp LB_8627
LB_8637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_8641
LB_8640:
	add r14,1
LB_8641:
	cmp r14,r10
	jge LB_8642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8640
	cmp al,10
	jz LB_8640
	cmp al,32
	jz LB_8640
LB_8642:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8643
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8644
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8644:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8645
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8645:
	jmp LB_8627
LB_8643:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8632
	btr r12,2
	clc
	jmp LB_8633
LB_8632:
	bts r12,2
	stc
LB_8633:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8630
	btr r12,1
	clc
	jmp LB_8631
LB_8630:
	bts r12,1
	stc
LB_8631:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8628
	btr r12,0
	clc
	jmp LB_8629
LB_8628:
	bts r12,0
	stc
LB_8629:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8623
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8654
	btr r12,3
	jmp LB_8655
LB_8654:
	bts r12,3
LB_8655:
	mov r14,r8
	bt r12,2
	jc LB_8656
	btr r12,1
	jmp LB_8657
LB_8656:
	bts r12,1
LB_8657:
	mov r8,r13
	bt r12,0
	jc LB_8658
	btr r12,2
	jmp LB_8659
LB_8658:
	bts r12,2
LB_8659:
	mov r13,r9
	bt r12,3
	jc LB_8660
	btr r12,0
	jmp LB_8661
LB_8660:
	bts r12,0
LB_8661:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_5771 : %_5771
 ; {>  %_5770~1':(_p1452)◂(_stg) %_5769~0':(_p1439)◂((_p1447)◂(_stg)) }
; _none {  } ⊢ °1◂{  }
; _some { %_5769 %_5770 %_5771 } ⊢ %_5772 : %_5772
 ; {>  %_5770~1':(_p1452)◂(_stg) %_5769~0':(_p1439)◂((_p1447)◂(_stg)) %_5771~°1◂{  }:(_opn)◂(t2730'(0)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_5772
 ; {>  %_5772~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ (_p1439)◂((_p1447)◂(_stg)) (_p1452)◂(_stg) (_opn)◂(t2733'(0)) }) }
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
	jc LB_8613
	btr r12,2
	jmp LB_8614
LB_8613:
	bts r12,2
LB_8614:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8611
	btr QWORD [rdi],0
	jmp LB_8612
LB_8611:
	bts QWORD [rdi],0
LB_8612:
	mov r8,r14
	bt r12,1
	jc LB_8617
	btr r12,2
	jmp LB_8618
LB_8617:
	bts r12,2
LB_8618:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8615
	btr QWORD [rdi],1
	jmp LB_8616
LB_8615:
	bts QWORD [rdi],1
LB_8616:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_8621
	mov rsi,0
	bt r8,0
	jc LB_8621
	jmp LB_8622
LB_8621:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_8622:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_8619
	btr QWORD [rdi],2
	jmp LB_8620
LB_8619:
	bts QWORD [rdi],2
LB_8620:
	mov r8,0
	bts r12,2
	ret
LB_8623:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8625
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8624
LB_8625:
	add rsp,8
	ret
LB_8627:
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
LB_8626:
	add rsp,48
	pop r14
LB_8624:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5484:
NS_E_RDI_5484:
NS_E_5484_ETR_TBL:
NS_E_5484_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_8682
LB_8681:
	add r14,1
LB_8682:
	cmp r14,r10
	jge LB_8683
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8681
	cmp al,10
	jz LB_8681
	cmp al,32
	jz LB_8681
LB_8683:
	add r14,2
	cmp r14,r10
	jg LB_8686
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_8686
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_8686
	jmp LB_8687
LB_8686:
	jmp LB_8669
LB_8687:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_8676
LB_8675:
	add r14,1
LB_8676:
	cmp r14,r10
	jge LB_8677
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8675
	cmp al,10
	jz LB_8675
	cmp al,32
	jz LB_8675
LB_8677:
	push r10
	call NS_E_5485_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8678
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8679
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8679:
	jmp LB_8670
LB_8678:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8673
	btr r12,1
	clc
	jmp LB_8674
LB_8673:
	bts r12,1
	stc
LB_8674:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8671
	btr r12,0
	clc
	jmp LB_8672
LB_8671:
	bts r12,0
	stc
LB_8672:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8666
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8688
	btr r12,2
	jmp LB_8689
LB_8688:
	bts r12,2
LB_8689:
	mov r13,r14
	bt r12,1
	jc LB_8690
	btr r12,0
	jmp LB_8691
LB_8690:
	bts r12,0
LB_8691:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1520 %_5773 ⊢ %_5774 : %_5774
 ; {>  %_5773~0':_p1494 }
; _f1520 0' ⊢ °0◂0'
; _some %_5774 ⊢ %_5775 : %_5775
 ; {>  %_5774~°0◂0':_p1493 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5775
 ; {>  %_5775~°0◂°0◂0':(_opn)◂(_p1493) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8664
	btr r12,3
	jmp LB_8665
LB_8664:
	bts r12,3
LB_8665:
	mov rsi,1
	bt r12,3
	jc LB_8662
	mov rsi,0
	bt r9,0
	jc LB_8662
	jmp LB_8663
LB_8662:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8663:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8666:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8668
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8667
LB_8668:
	add rsp,8
	ret
LB_8670:
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
LB_8669:
	add rsp,32
	pop r14
LB_8667:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_8711
LB_8710:
	add r14,1
LB_8711:
	cmp r14,r10
	jge LB_8712
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8710
	cmp al,10
	jz LB_8710
	cmp al,32
	jz LB_8710
LB_8712:
	push r10
	call NS_E_5486_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8713
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8705
LB_8713:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8716
LB_8715:
	add r14,1
LB_8716:
	cmp r14,r10
	jge LB_8717
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8715
	cmp al,10
	jz LB_8715
	cmp al,32
	jz LB_8715
LB_8717:
	push r10
	call NS_E_5484_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8718
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8719
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8719:
	jmp LB_8705
LB_8718:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8708
	btr r12,1
	clc
	jmp LB_8709
LB_8708:
	bts r12,1
	stc
LB_8709:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8706
	btr r12,0
	clc
	jmp LB_8707
LB_8706:
	bts r12,0
	stc
LB_8707:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8702
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1521 { %_5776 %_5777 } ⊢ %_5778 : %_5778
 ; {>  %_5777~1':_p1493 %_5776~0':_p1495 }
; _f1521 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5778 ⊢ %_5779 : %_5779
 ; {>  %_5778~°1◂{ 0' 1' }:_p1493 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5779
 ; {>  %_5779~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1493) }
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
	jc LB_8696
	btr r12,2
	jmp LB_8697
LB_8696:
	bts r12,2
LB_8697:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8694
	btr QWORD [rdi],0
	jmp LB_8695
LB_8694:
	bts QWORD [rdi],0
LB_8695:
	mov r8,r14
	bt r12,1
	jc LB_8700
	btr r12,2
	jmp LB_8701
LB_8700:
	bts r12,2
LB_8701:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8698
	btr QWORD [rdi],1
	jmp LB_8699
LB_8698:
	bts QWORD [rdi],1
LB_8699:
	mov rsi,1
	bt r12,3
	jc LB_8692
	mov rsi,0
	bt r9,0
	jc LB_8692
	jmp LB_8693
LB_8692:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8693:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8702:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8704
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8703
LB_8704:
	add rsp,8
	ret
LB_8705:
	add rsp,32
	pop r14
LB_8703:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_8723
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _f1522 {  } ⊢ %_5780 : %_5780
 ; {>  }
; _f1522 {  } ⊢ °2◂{  }
; _some %_5780 ⊢ %_5781 : %_5781
 ; {>  %_5780~°2◂{  }:_p1493 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5781
 ; {>  %_5781~°0◂°2◂{  }:(_opn)◂(_p1493) }
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
	jc LB_8721
	mov rsi,0
	bt r9,0
	jc LB_8721
	jmp LB_8722
LB_8721:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8722:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8723:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8725
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8724
LB_8725:
	add rsp,8
	ret
LB_8726:
	add rsp,0
	pop r14
LB_8724:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5485:
NS_E_RDI_5485:
NS_E_5485_ETR_TBL:
NS_E_5485_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_8746
LB_8745:
	add r14,1
LB_8746:
	cmp r14,r10
	jge LB_8747
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8745
	cmp al,10
	jz LB_8745
	cmp al,32
	jz LB_8745
LB_8747:
	push r10
	call NS_E_5486_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8748
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8740
LB_8748:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_8751
LB_8750:
	add r14,1
LB_8751:
	cmp r14,r10
	jge LB_8752
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8750
	cmp al,10
	jz LB_8750
	cmp al,32
	jz LB_8750
LB_8752:
	push r10
	call NS_E_5485_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8753
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8754
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8754:
	jmp LB_8740
LB_8753:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8743
	btr r12,1
	clc
	jmp LB_8744
LB_8743:
	bts r12,1
	stc
LB_8744:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8741
	btr r12,0
	clc
	jmp LB_8742
LB_8741:
	bts r12,0
	stc
LB_8742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8737
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1523 { %_5782 %_5783 } ⊢ %_5784 : %_5784
 ; {>  %_5782~0':_p1495 %_5783~1':_p1494 }
; _f1523 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5784 ⊢ %_5785 : %_5785
 ; {>  %_5784~°0◂{ 0' 1' }:_p1494 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5785
 ; {>  %_5785~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1494) }
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
	jc LB_8731
	btr r12,2
	jmp LB_8732
LB_8731:
	bts r12,2
LB_8732:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8729
	btr QWORD [rdi],0
	jmp LB_8730
LB_8729:
	bts QWORD [rdi],0
LB_8730:
	mov r8,r14
	bt r12,1
	jc LB_8735
	btr r12,2
	jmp LB_8736
LB_8735:
	bts r12,2
LB_8736:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8733
	btr QWORD [rdi],1
	jmp LB_8734
LB_8733:
	bts QWORD [rdi],1
LB_8734:
	mov rsi,1
	bt r12,3
	jc LB_8727
	mov rsi,0
	bt r9,0
	jc LB_8727
	jmp LB_8728
LB_8727:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8728:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8737:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8739
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8738
LB_8739:
	add rsp,8
	ret
LB_8740:
	add rsp,32
	pop r14
LB_8738:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_8758
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _f1524 {  } ⊢ %_5786 : %_5786
 ; {>  }
; _f1524 {  } ⊢ °1◂{  }
; _some %_5786 ⊢ %_5787 : %_5787
 ; {>  %_5786~°1◂{  }:_p1494 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5787
 ; {>  %_5787~°0◂°1◂{  }:(_opn)◂(_p1494) }
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
	jc LB_8756
	mov rsi,0
	bt r9,0
	jc LB_8756
	jmp LB_8757
LB_8756:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8757:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8758:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8760
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8759
LB_8760:
	add rsp,8
	ret
LB_8761:
	add rsp,0
	pop r14
LB_8759:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5486:
NS_E_RDI_5486:
NS_E_5486_ETR_TBL:
NS_E_5486_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_8777
LB_8776:
	add r14,1
LB_8777:
	cmp r14,r10
	jge LB_8778
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8776
	cmp al,10
	jz LB_8776
	cmp al,32
	jz LB_8776
LB_8778:
	add r14,3
	cmp r14,r10
	jg LB_8781
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8781
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8781
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_8781
	jmp LB_8782
LB_8781:
	jmp LB_8769
LB_8782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_8784
LB_8783:
	add r14,1
LB_8784:
	cmp r14,r10
	jge LB_8785
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8783
	cmp al,10
	jz LB_8783
	cmp al,32
	jz LB_8783
LB_8785:
	push r10
	call NS_E_5487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8786
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8787
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8787:
	jmp LB_8769
LB_8786:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_8790
LB_8789:
	add r14,1
LB_8790:
	cmp r14,r10
	jge LB_8791
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8789
	cmp al,10
	jz LB_8789
	cmp al,32
	jz LB_8789
LB_8791:
	add r14,3
	cmp r14,r10
	jg LB_8796
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8796
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8796
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_8796
	jmp LB_8797
LB_8796:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8793
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8793:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8794
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8794:
	jmp LB_8769
LB_8797:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov r9,rsi
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8774
	btr r12,2
	clc
	jmp LB_8775
LB_8774:
	bts r12,2
	stc
LB_8775:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8772
	btr r12,1
	clc
	jmp LB_8773
LB_8772:
	bts r12,1
	stc
LB_8773:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8770
	btr r12,0
	clc
	jmp LB_8771
LB_8770:
	bts r12,0
	stc
LB_8771:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8766
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_8798
	btr r12,6
	jmp LB_8799
LB_8798:
	bts r12,6
LB_8799:
	mov r13,r14
	bt r12,1
	jc LB_8800
	btr r12,0
	jmp LB_8801
LB_8800:
	bts r12,0
LB_8801:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1525 %_5788 ⊢ %_5789 : %_5789
 ; {>  %_5788~0':_p1496 }
; _f1525 0' ⊢ °0◂0'
; _some %_5789 ⊢ %_5790 : %_5790
 ; {>  %_5789~°0◂0':_p1495 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5790
 ; {>  %_5790~°0◂°0◂0':(_opn)◂(_p1495) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8764
	btr r12,3
	jmp LB_8765
LB_8764:
	bts r12,3
LB_8765:
	mov rsi,1
	bt r12,3
	jc LB_8762
	mov rsi,0
	bt r9,0
	jc LB_8762
	jmp LB_8763
LB_8762:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8763:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8766:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8768
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8767
LB_8768:
	add rsp,8
	ret
LB_8769:
	add rsp,48
	pop r14
LB_8767:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_8813
LB_8812:
	add r14,1
LB_8813:
	cmp r14,r10
	jge LB_8814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8812
	cmp al,10
	jz LB_8812
	cmp al,32
	jz LB_8812
LB_8814:
	push r10
	call NS_E_5487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8815
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8809
LB_8815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8810
	btr r12,0
	clc
	jmp LB_8811
LB_8810:
	bts r12,0
	stc
LB_8811:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8806
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1526 %_5791 ⊢ %_5792 : %_5792
 ; {>  %_5791~0':_p1496 }
; _f1526 0' ⊢ °1◂0'
; _some %_5792 ⊢ %_5793 : %_5793
 ; {>  %_5792~°1◂0':_p1495 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5793
 ; {>  %_5793~°0◂°1◂0':(_opn)◂(_p1495) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8804
	btr r12,3
	jmp LB_8805
LB_8804:
	bts r12,3
LB_8805:
	mov rsi,1
	bt r12,3
	jc LB_8802
	mov rsi,0
	bt r9,0
	jc LB_8802
	jmp LB_8803
LB_8802:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8803:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8806:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8808
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8807
LB_8808:
	add rsp,8
	ret
LB_8809:
	add rsp,16
	pop r14
LB_8807:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5487:
NS_E_RDI_5487:
NS_E_5487_ETR_TBL:
NS_E_5487_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_8828
LB_8827:
	add r14,1
LB_8828:
	cmp r14,r10
	jge LB_8829
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8827
	cmp al,10
	jz LB_8827
	cmp al,32
	jz LB_8827
LB_8829:
	push r10
	call NS_E_845_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8830
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8824
LB_8830:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8825
	btr r12,0
	clc
	jmp LB_8826
LB_8825:
	bts r12,0
	stc
LB_8826:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8821
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1528 %_5794 ⊢ %_5795 : %_5795
 ; {>  %_5794~0':_stg }
; _f1528 0' ⊢ °1◂0'
; _some %_5795 ⊢ %_5796 : %_5796
 ; {>  %_5795~°1◂0':_p1496 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5796
 ; {>  %_5796~°0◂°1◂0':(_opn)◂(_p1496) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8819
	btr r12,3
	jmp LB_8820
LB_8819:
	bts r12,3
LB_8820:
	mov rsi,1
	bt r12,3
	jc LB_8817
	mov rsi,0
	bt r9,0
	jc LB_8817
	jmp LB_8818
LB_8817:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8818:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8821:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8823
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8822
LB_8823:
	add rsp,8
	ret
LB_8824:
	add rsp,16
	pop r14
LB_8822:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_8843
LB_8842:
	add r14,1
LB_8843:
	cmp r14,r10
	jge LB_8844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8842
	cmp al,10
	jz LB_8842
	cmp al,32
	jz LB_8842
LB_8844:
	push r10
	call NS_E_4383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8845
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8839
LB_8845:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8840
	btr r12,0
	clc
	jmp LB_8841
LB_8840:
	bts r12,0
	stc
LB_8841:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8836
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1527 %_5797 ⊢ %_5798 : %_5798
 ; {>  %_5797~0':_p1394 }
; _f1527 0' ⊢ °0◂0'
; _some %_5798 ⊢ %_5799 : %_5799
 ; {>  %_5798~°0◂0':_p1496 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5799
 ; {>  %_5799~°0◂°0◂0':(_opn)◂(_p1496) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8834
	btr r12,3
	jmp LB_8835
LB_8834:
	bts r12,3
LB_8835:
	mov rsi,1
	bt r12,3
	jc LB_8832
	mov rsi,0
	bt r9,0
	jc LB_8832
	jmp LB_8833
LB_8832:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8833:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8836:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8838
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8837
LB_8838:
	add rsp,8
	ret
LB_8839:
	add rsp,16
	pop r14
LB_8837:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5488:
NS_E_RDI_5488:
NS_E_5488_ETR_TBL:
NS_E_5488_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_8856
LB_8855:
	add r14,1
LB_8856:
	cmp r14,r10
	jge LB_8857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8855
	cmp al,10
	jz LB_8855
	cmp al,32
	jz LB_8855
LB_8857:
	add r14,4
	cmp r14,r10
	jg LB_8860
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8860
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8860
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8860
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_8860
	jmp LB_8861
LB_8860:
	jmp LB_8852
LB_8861:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8853
	btr r12,0
	clc
	jmp LB_8854
LB_8853:
	bts r12,0
	stc
LB_8854:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8849
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1518 {  } ⊢ %_5800 : %_5800
 ; {>  }
; _f1518 {  } ⊢ °1◂{  }
; _some %_5800 ⊢ %_5801 : %_5801
 ; {>  %_5800~°1◂{  }:_p1492 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5801
 ; {>  %_5801~°0◂°1◂{  }:(_opn)◂(_p1492) }
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
	jc LB_8847
	mov rsi,0
	bt r9,0
	jc LB_8847
	jmp LB_8848
LB_8847:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8848:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8849:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8851
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8850
LB_8851:
	add rsp,8
	ret
LB_8852:
	add rsp,16
	pop r14
LB_8850:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_8871
LB_8870:
	add r14,1
LB_8871:
	cmp r14,r10
	jge LB_8872
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8870
	cmp al,10
	jz LB_8870
	cmp al,32
	jz LB_8870
LB_8872:
	add r14,4
	cmp r14,r10
	jg LB_8875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_8875
	jmp LB_8876
LB_8875:
	jmp LB_8867
LB_8876:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8868
	btr r12,0
	clc
	jmp LB_8869
LB_8868:
	bts r12,0
	stc
LB_8869:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8864
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1519 {  } ⊢ %_5802 : %_5802
 ; {>  }
; _f1519 {  } ⊢ °2◂{  }
; _some %_5802 ⊢ %_5803 : %_5803
 ; {>  %_5802~°2◂{  }:_p1492 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5803
 ; {>  %_5803~°0◂°2◂{  }:(_opn)◂(_p1492) }
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
	jc LB_8862
	mov rsi,0
	bt r9,0
	jc LB_8862
	jmp LB_8863
LB_8862:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8863:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8864:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8866
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8865
LB_8866:
	add rsp,8
	ret
LB_8867:
	add rsp,16
	pop r14
LB_8865:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_8886
LB_8885:
	add r14,1
LB_8886:
	cmp r14,r10
	jge LB_8887
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8885
	cmp al,10
	jz LB_8885
	cmp al,32
	jz LB_8885
LB_8887:
	add r14,3
	cmp r14,r10
	jg LB_8890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_8890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_8890
	jmp LB_8891
LB_8890:
	jmp LB_8882
LB_8891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8883
	btr r12,0
	clc
	jmp LB_8884
LB_8883:
	bts r12,0
	stc
LB_8884:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8879
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1517 {  } ⊢ %_5804 : %_5804
 ; {>  }
; _f1517 {  } ⊢ °0◂{  }
; _some %_5804 ⊢ %_5805 : %_5805
 ; {>  %_5804~°0◂{  }:_p1492 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5805
 ; {>  %_5805~°0◂°0◂{  }:(_opn)◂(_p1492) }
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
	jc LB_8877
	mov rsi,0
	bt r9,0
	jc LB_8877
	jmp LB_8878
LB_8877:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8878:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8879:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8881
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8880
LB_8881:
	add rsp,8
	ret
LB_8882:
	add rsp,16
	pop r14
LB_8880:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5489:
NS_E_RDI_5489:
NS_E_5489_ETR_TBL:
NS_E_5489_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_8901
LB_8900:
	add r14,1
LB_8901:
	cmp r14,r10
	jge LB_8902
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8900
	cmp al,10
	jz LB_8900
	cmp al,32
	jz LB_8900
LB_8902:
	add r14,5
	cmp r14,r10
	jg LB_8905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_8905
	jmp LB_8906
LB_8905:
	jmp LB_8897
LB_8906:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8898
	btr r12,0
	clc
	jmp LB_8899
LB_8898:
	bts r12,0
	stc
LB_8899:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8894
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1518 {  } ⊢ %_5806 : %_5806
 ; {>  }
; _f1518 {  } ⊢ °1◂{  }
; _some %_5806 ⊢ %_5807 : %_5807
 ; {>  %_5806~°1◂{  }:_p1492 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5807
 ; {>  %_5807~°0◂°1◂{  }:(_opn)◂(_p1492) }
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
	jc LB_8892
	mov rsi,0
	bt r9,0
	jc LB_8892
	jmp LB_8893
LB_8892:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8893:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8894:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8896
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8895
LB_8896:
	add rsp,8
	ret
LB_8897:
	add rsp,16
	pop r14
LB_8895:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_8916
LB_8915:
	add r14,1
LB_8916:
	cmp r14,r10
	jge LB_8917
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8915
	cmp al,10
	jz LB_8915
	cmp al,32
	jz LB_8915
LB_8917:
	add r14,5
	cmp r14,r10
	jg LB_8920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_8920
	jmp LB_8921
LB_8920:
	jmp LB_8912
LB_8921:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8913
	btr r12,0
	clc
	jmp LB_8914
LB_8913:
	bts r12,0
	stc
LB_8914:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8909
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1519 {  } ⊢ %_5808 : %_5808
 ; {>  }
; _f1519 {  } ⊢ °2◂{  }
; _some %_5808 ⊢ %_5809 : %_5809
 ; {>  %_5808~°2◂{  }:_p1492 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5809
 ; {>  %_5809~°0◂°2◂{  }:(_opn)◂(_p1492) }
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
	jc LB_8907
	mov rsi,0
	bt r9,0
	jc LB_8907
	jmp LB_8908
LB_8907:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8908:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8909:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8911
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8910
LB_8911:
	add rsp,8
	ret
LB_8912:
	add rsp,16
	pop r14
LB_8910:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_8931
LB_8930:
	add r14,1
LB_8931:
	cmp r14,r10
	jge LB_8932
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8930
	cmp al,10
	jz LB_8930
	cmp al,32
	jz LB_8930
LB_8932:
	add r14,4
	cmp r14,r10
	jg LB_8935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_8935
	jmp LB_8936
LB_8935:
	jmp LB_8927
LB_8936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov r14,rsi
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8928
	btr r12,0
	clc
	jmp LB_8929
LB_8928:
	bts r12,0
	stc
LB_8929:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8924
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1517 {  } ⊢ %_5810 : %_5810
 ; {>  }
; _f1517 {  } ⊢ °0◂{  }
; _some %_5810 ⊢ %_5811 : %_5811
 ; {>  %_5810~°0◂{  }:_p1492 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5811
 ; {>  %_5811~°0◂°0◂{  }:(_opn)◂(_p1492) }
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
	jc LB_8922
	mov rsi,0
	bt r9,0
	jc LB_8922
	jmp LB_8923
LB_8922:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8923:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8924:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8926
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8925
LB_8926:
	add rsp,8
	ret
LB_8927:
	add rsp,16
	pop r14
LB_8925:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5490:
NS_E_RDI_5490:
NS_E_5490_ETR_TBL:
NS_E_5490_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_8992
LB_8991:
	add r14,1
LB_8992:
	cmp r14,r10
	jge LB_8993
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8991
	cmp al,10
	jz LB_8991
	cmp al,32
	jz LB_8991
LB_8993:
	push r10
	call NS_E_5489_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8994
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8960
LB_8994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_8971
LB_8970:
	add r14,1
LB_8971:
	cmp r14,r10
	jge LB_8972
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8970
	cmp al,10
	jz LB_8970
	cmp al,32
	jz LB_8970
LB_8972:
	push r10
	call NS_E_5492_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8973
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8974
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8974:
	jmp LB_8961
LB_8973:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_8977
LB_8976:
	add r14,1
LB_8977:
	cmp r14,r10
	jge LB_8978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8976
	cmp al,10
	jz LB_8976
	cmp al,32
	jz LB_8976
LB_8978:
	push r10
	call NS_E_5484_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8979
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8980
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8980:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8981
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8981:
	jmp LB_8961
LB_8979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_8984
LB_8983:
	add r14,1
LB_8984:
	cmp r14,r10
	jge LB_8985
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8983
	cmp al,10
	jz LB_8983
	cmp al,32
	jz LB_8983
LB_8985:
	push r10
	call NS_E_5491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8986
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8987
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8987:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8988
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8988:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8989:
	jmp LB_8961
LB_8986:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8968
	btr r12,3
	clc
	jmp LB_8969
LB_8968:
	bts r12,3
	stc
LB_8969:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8966
	btr r12,2
	clc
	jmp LB_8967
LB_8966:
	bts r12,2
	stc
LB_8967:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8964
	btr r12,1
	clc
	jmp LB_8965
LB_8964:
	bts r12,1
	stc
LB_8965:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8962
	btr r12,0
	clc
	jmp LB_8963
LB_8962:
	bts r12,0
	stc
LB_8963:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8957
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f1514 { %_5813 %_5812 %_5814 %_5815 } ⊢ %_5816 : %_5816
 ; {>  %_5814~2':_p1493 %_5812~0':_p1492 %_5815~3':(_opn)◂(_p1490) %_5813~1':(_opn)◂(_stg) }
; _f1514 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_5816 ⊢ %_5817 : %_5817
 ; {>  %_5816~°1◂{ 1' 0' 2' 3' }:_p1490 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_5817
 ; {>  %_5817~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p1490) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_8937
	btr r12,4
	jmp LB_8938
LB_8937:
	bts r12,4
LB_8938:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_8943
	btr r12,5
	jmp LB_8944
LB_8943:
	bts r12,5
LB_8944:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8941
	btr QWORD [rdi],0
	jmp LB_8942
LB_8941:
	bts QWORD [rdi],0
LB_8942:
	mov r11,r13
	bt r12,0
	jc LB_8947
	btr r12,5
	jmp LB_8948
LB_8947:
	bts r12,5
LB_8948:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8945
	btr QWORD [rdi],1
	jmp LB_8946
LB_8945:
	bts QWORD [rdi],1
LB_8946:
	mov r11,r8
	bt r12,2
	jc LB_8951
	btr r12,5
	jmp LB_8952
LB_8951:
	bts r12,5
LB_8952:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_8949
	btr QWORD [rdi],2
	jmp LB_8950
LB_8949:
	bts QWORD [rdi],2
LB_8950:
	mov r11,r10
	bt r12,4
	jc LB_8955
	btr r12,5
	jmp LB_8956
LB_8955:
	bts r12,5
LB_8956:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,5
	jc LB_8953
	btr QWORD [rdi],3
	jmp LB_8954
LB_8953:
	bts QWORD [rdi],3
LB_8954:
	mov rsi,1
	bt r12,3
	jc LB_8939
	mov rsi,0
	bt r9,0
	jc LB_8939
	jmp LB_8940
LB_8939:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8940:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8957:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8959
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8958
LB_8959:
	add rsp,8
	ret
LB_8961:
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
LB_8960:
	add rsp,64
	pop r14
LB_8958:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_9035
LB_9034:
	add r14,1
LB_9035:
	cmp r14,r10
	jge LB_9036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9034
	cmp al,10
	jz LB_9034
	cmp al,32
	jz LB_9034
LB_9036:
	push r10
	call NS_E_5488_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9037
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9023
LB_9037:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_9040
LB_9039:
	add r14,1
LB_9040:
	cmp r14,r10
	jge LB_9041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9039
	cmp al,10
	jz LB_9039
	cmp al,32
	jz LB_9039
LB_9041:
	push r10
	call NS_E_5492_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9042
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9043
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9043:
	jmp LB_9023
LB_9042:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_9046
LB_9045:
	add r14,1
LB_9046:
	cmp r14,r10
	jge LB_9047
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9045
	cmp al,10
	jz LB_9045
	cmp al,32
	jz LB_9045
LB_9047:
	push r10
	call NS_E_5484_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9048
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9049
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9049:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9050
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9050:
	jmp LB_9023
LB_9048:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_9053
LB_9052:
	add r14,1
LB_9053:
	cmp r14,r10
	jge LB_9054
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9052
	cmp al,10
	jz LB_9052
	cmp al,32
	jz LB_9052
LB_9054:
	push r10
	call NS_E_5491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9055
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9056
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9056:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9057
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9057:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9058
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9058:
	jmp LB_9023
LB_9055:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_9061
LB_9060:
	add r14,1
LB_9061:
	cmp r14,r10
	jge LB_9062
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9060
	cmp al,10
	jz LB_9060
	cmp al,32
	jz LB_9060
LB_9062:
	push r10
	call NS_E_5490_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9063
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9064
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9064:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9065
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9065:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9066
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9066:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9067
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9067:
	jmp LB_9023
LB_9063:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov r11,rsi
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9032
	btr r12,4
	clc
	jmp LB_9033
LB_9032:
	bts r12,4
	stc
LB_9033:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9030
	btr r12,3
	clc
	jmp LB_9031
LB_9030:
	bts r12,3
	stc
LB_9031:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9028
	btr r12,2
	clc
	jmp LB_9029
LB_9028:
	bts r12,2
	stc
LB_9029:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9026
	btr r12,1
	clc
	jmp LB_9027
LB_9026:
	bts r12,1
	stc
LB_9027:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9024
	btr r12,0
	clc
	jmp LB_9025
LB_9024:
	bts r12,0
	stc
LB_9025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_9020
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
	bts r12,5
	bts r12,6
	bts r12,7
; _f1513 { %_5819 %_5818 %_5820 %_5821 %_5822 } ⊢ %_5823 : %_5823
 ; {>  %_5820~2':_p1493 %_5822~4':_p1490 %_5821~3':(_opn)◂(_p1490) %_5819~1':(_opn)◂(_stg) %_5818~0':_p1492 }
; _f1513 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_5823 ⊢ %_5824 : %_5824
 ; {>  %_5823~°0◂{ 1' 0' 2' 3' 4' }:_p1490 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_5824
 ; {>  %_5824~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p1490) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_8996
	btr r12,5
	jmp LB_8997
LB_8996:
	bts r12,5
LB_8997:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_9002
	btr r12,6
	jmp LB_9003
LB_9002:
	bts r12,6
LB_9003:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9000
	btr QWORD [rdi],0
	jmp LB_9001
LB_9000:
	bts QWORD [rdi],0
LB_9001:
	mov rcx,r13
	bt r12,0
	jc LB_9006
	btr r12,6
	jmp LB_9007
LB_9006:
	bts r12,6
LB_9007:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9004
	btr QWORD [rdi],1
	jmp LB_9005
LB_9004:
	bts QWORD [rdi],1
LB_9005:
	mov rcx,r8
	bt r12,2
	jc LB_9010
	btr r12,6
	jmp LB_9011
LB_9010:
	bts r12,6
LB_9011:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_9008
	btr QWORD [rdi],2
	jmp LB_9009
LB_9008:
	bts QWORD [rdi],2
LB_9009:
	mov rcx,r11
	bt r12,5
	jc LB_9014
	btr r12,6
	jmp LB_9015
LB_9014:
	bts r12,6
LB_9015:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_9012
	btr QWORD [rdi],3
	jmp LB_9013
LB_9012:
	bts QWORD [rdi],3
LB_9013:
	mov rcx,r10
	bt r12,4
	jc LB_9018
	btr r12,6
	jmp LB_9019
LB_9018:
	bts r12,6
LB_9019:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_9016
	btr QWORD [rdi],4
	jmp LB_9017
LB_9016:
	bts QWORD [rdi],4
LB_9017:
	mov rsi,1
	bt r12,3
	jc LB_8998
	mov rsi,0
	bt r9,0
	jc LB_8998
	jmp LB_8999
LB_8998:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8999:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9020:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9022
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9021
LB_9022:
	add rsp,8
	ret
LB_9023:
	add rsp,80
	pop r14
LB_9021:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5491:
NS_E_RDI_5491:
NS_E_5491_ETR_TBL:
NS_E_5491_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_9082
LB_9081:
	add r14,1
LB_9082:
	cmp r14,r10
	jge LB_9083
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9081
	cmp al,10
	jz LB_9081
	cmp al,32
	jz LB_9081
LB_9083:
	add r14,1
	cmp r14,r10
	jg LB_9086
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_9086
	jmp LB_9087
LB_9086:
	jmp LB_9076
LB_9087:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_9089
LB_9088:
	add r14,1
LB_9089:
	cmp r14,r10
	jge LB_9090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9088
	cmp al,10
	jz LB_9088
	cmp al,32
	jz LB_9088
LB_9090:
	push r10
	call NS_E_5490_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9091
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9092
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9092:
	jmp LB_9076
LB_9091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9079
	btr r12,1
	clc
	jmp LB_9080
LB_9079:
	bts r12,1
	stc
LB_9080:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9077
	btr r12,0
	clc
	jmp LB_9078
LB_9077:
	bts r12,0
	stc
LB_9078:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9073
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_9094
	btr r12,5
	jmp LB_9095
LB_9094:
	bts r12,5
LB_9095:
	mov r13,r14
	bt r12,1
	jc LB_9096
	btr r12,0
	jmp LB_9097
LB_9096:
	bts r12,0
LB_9097:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5825 ⊢ %_5826 : %_5826
 ; {>  %_5825~0':_p1490 }
; _some 0' ⊢ °0◂0'
; _some %_5826 ⊢ %_5827 : %_5827
 ; {>  %_5826~°0◂0':(_opn)◂(_p1490) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5827
 ; {>  %_5827~°0◂°0◂0':(_opn)◂((_opn)◂(_p1490)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9071
	btr r12,3
	jmp LB_9072
LB_9071:
	bts r12,3
LB_9072:
	mov rsi,1
	bt r12,3
	jc LB_9069
	mov rsi,0
	bt r9,0
	jc LB_9069
	jmp LB_9070
LB_9069:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9070:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9073:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9075
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9074
LB_9075:
	add rsp,8
	ret
LB_9076:
	add rsp,32
	pop r14
LB_9074:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_9100
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_5828 : %_5828
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5828 ⊢ %_5829 : %_5829
 ; {>  %_5828~°1◂{  }:(_opn)◂(t2811'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5829
 ; {>  %_5829~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2814'(0))) }
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
	jc LB_9098
	mov rsi,0
	bt r9,0
	jc LB_9098
	jmp LB_9099
LB_9098:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9099:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9100:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9102
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9101
LB_9102:
	add rsp,8
	ret
LB_9103:
	add rsp,0
	pop r14
LB_9101:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5492:
NS_E_RDI_5492:
NS_E_5492_ETR_TBL:
NS_E_5492_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_9117
LB_9116:
	add r14,1
LB_9117:
	cmp r14,r10
	jge LB_9118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9116
	cmp al,10
	jz LB_9116
	cmp al,32
	jz LB_9116
LB_9118:
	push r10
	call NS_E_1219_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9119
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9111
LB_9119:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_9122
LB_9121:
	add r14,1
LB_9122:
	cmp r14,r10
	jge LB_9123
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9121
	cmp al,10
	jz LB_9121
	cmp al,32
	jz LB_9121
LB_9123:
	add r14,1
	cmp r14,r10
	jg LB_9127
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_9127
	jmp LB_9128
LB_9127:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9125
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9125:
	jmp LB_9111
LB_9128:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov r8,rsi
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9114
	btr r12,1
	clc
	jmp LB_9115
LB_9114:
	bts r12,1
	stc
LB_9115:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9112
	btr r12,0
	clc
	jmp LB_9113
LB_9112:
	bts r12,0
	stc
LB_9113:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9108
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5830 ⊢ %_5831 : %_5831
 ; {>  %_5830~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_5831 ⊢ %_5832 : %_5832
 ; {>  %_5831~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5832
 ; {>  %_5832~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9106
	btr r12,3
	jmp LB_9107
LB_9106:
	bts r12,3
LB_9107:
	mov rsi,1
	bt r12,3
	jc LB_9104
	mov rsi,0
	bt r9,0
	jc LB_9104
	jmp LB_9105
LB_9104:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9105:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9108:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9110
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9109
LB_9110:
	add rsp,8
	ret
LB_9111:
	add rsp,32
	pop r14
LB_9109:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_9131
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_5833 : %_5833
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5833 ⊢ %_5834 : %_5834
 ; {>  %_5833~°1◂{  }:(_opn)◂(t2823'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5834
 ; {>  %_5834~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2826'(0))) }
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
	jc LB_9129
	mov rsi,0
	bt r9,0
	jc LB_9129
	jmp LB_9130
LB_9129:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9130:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9131:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9133
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9132
LB_9133:
	add rsp,8
	ret
LB_9134:
	add rsp,0
	pop r14
LB_9132:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9193:
; 	|» { 0' 1' 2' }
NS_E_RDI_9193:
MTC_LB_9194:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9195
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
	jnc LB_9196
	bt QWORD [rdi],0
	jc LB_9197
	btr r12,5
	clc
	jmp LB_9198
LB_9197:
	bts r12,5
	stc
LB_9198:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9196:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9201
	btr r12,6
	clc
	jmp LB_9202
LB_9201:
	bts r12,6
	stc
LB_9202:
	mov r9,rcx
	bt r12,6
	jc LB_9199
	btr r12,3
	jmp LB_9200
LB_9199:
	bts r12,3
LB_9200:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9205
	btr r12,6
	clc
	jmp LB_9206
LB_9205:
	bts r12,6
	stc
LB_9206:
	mov r10,rcx
	bt r12,6
	jc LB_9203
	btr r12,4
	jmp LB_9204
LB_9203:
	bts r12,4
LB_9204:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9207:
	cmp r15,0
	jz LB_9208
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9207
LB_9208:
; _f9179 { %_9180 %_9181 %_9183 } ⊢ { %_9185 %_9186 %_9187 } : { %_9185 %_9186 %_9187 }
 ; {>  %_9181~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9183~3':(_p1439)◂((_p1447)◂(t3496'(-1))) %_9180~0':_r64 %_9184~4':(_lst)◂((_p1439)◂((_p1447)◂(t3496'(-1)))) }
; _f9179 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_9211
	btr r12,2
	jmp LB_9212
LB_9211:
	bts r12,2
LB_9212:
	call NS_E_9179
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_9209
	btr r12,4
	clc
	jmp LB_9210
LB_9209:
	bts r12,4
	stc
LB_9210:
	add rsp,16
; _f9193 { %_9185 %_9186 %_9184 } ⊢ { %_9188 %_9189 %_9190 } : { %_9188 %_9189 %_9190 }
 ; {>  %_9187~2':(_p1439)◂((_p1447)◂(_r64)) %_9184~4':(_lst)◂((_p1439)◂((_p1447)◂(t3496'(-1)))) %_9185~0':_r64 %_9186~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) }
; _f9193 { 0' 1' 4' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110010.. |},{ 0' 1' 4' } ⊢ { 0' 1' 2' }
	mov r8,r10
	bt r12,4
	jc LB_9215
	btr r12,2
	jmp LB_9216
LB_9215:
	bts r12,2
LB_9216:
	call NS_E_9193
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 3' }
	mov r9,r8
	bt r12,2
	jc LB_9217
	btr r12,3
	jmp LB_9218
LB_9217:
	bts r12,3
LB_9218:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9213
	btr r12,2
	clc
	jmp LB_9214
LB_9213:
	bts r12,2
	stc
LB_9214:
	add rsp,16
; _cns { %_9187 %_9190 } ⊢ %_9191 : %_9191
 ; {>  %_9190~3':(_lst)◂((_p1439)◂((_p1447)◂(_r64))) %_9189~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9187~2':(_p1439)◂((_p1447)◂(_r64)) %_9188~0':_r64 }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; ∎ { %_9188 %_9189 %_9191 }
 ; {>  %_9189~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9191~°0◂{ 2' 3' }:(_lst)◂((_p1439)◂((_p1447)◂(_r64))) %_9188~0':_r64 }
; 	∎ { 0' 1' °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' °0◂{ 2' 3' } } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_9219
	btr r12,4
	jmp LB_9220
LB_9219:
	bts r12,4
LB_9220:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r10
	bt r12,4
	jc LB_9225
	btr r12,5
	jmp LB_9226
LB_9225:
	bts r12,5
LB_9226:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9223
	btr QWORD [rdi],0
	jmp LB_9224
LB_9223:
	bts QWORD [rdi],0
LB_9224:
	mov r11,r9
	bt r12,3
	jc LB_9229
	btr r12,5
	jmp LB_9230
LB_9229:
	bts r12,5
LB_9230:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9227
	btr QWORD [rdi],1
	jmp LB_9228
LB_9227:
	bts QWORD [rdi],1
LB_9228:
	mov rsi,1
	bt r12,2
	jc LB_9221
	mov rsi,0
	bt r8,0
	jc LB_9221
	jmp LB_9222
LB_9221:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9222:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9195:
	mov r15,0
LB_9232:
	cmp r15,0
	jz LB_9233
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9232
LB_9233:
; _nil {  } ⊢ %_9192 : %_9192
 ; {>  %_9181~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9182~2':(_lst)◂((_p1439)◂((_p1447)◂(t3496'(-1)))) %_9180~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; ∎ { %_9180 %_9181 %_9192 }
 ; {>  %_9181~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9182~2':(_lst)◂((_p1439)◂((_p1447)◂(t3496'(-1)))) %_9192~°1◂{  }:(_lst)◂(t3473'(0)) %_9180~0':_r64 }
; 	∎ { 0' 1' °1◂{  } }
	bt r12,2
	jc LB_9234
	mov rdi,r8
	call dlt
LB_9234:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_9235
	mov rsi,0
	bt r8,0
	jc LB_9235
	jmp LB_9236
LB_9235:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9236:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9231:
NS_E_9179:
; 	|» { 0' 1' 2' }
NS_E_RDI_9179:
; _f38 { %_9150 %_9151 %_9152 } ⊢ { %_9153 %_9154 %_9155 } : { %_9153 %_9154 %_9155 }
 ; {>  %_9151~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9152~2':(_p1439)◂((_p1447)◂(t3496'(-1))) %_9150~0':_r64 }
; _f38 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_9237
	btr r12,3
	jmp LB_9238
LB_9237:
	bts r12,3
LB_9238:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_9241
	btr r12,4
	jmp LB_9242
LB_9241:
	bts r12,4
LB_9242:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9239
	btr QWORD [rdi],0
	jmp LB_9240
LB_9239:
	bts QWORD [rdi],0
LB_9240:
	mov r10,r14
	bt r12,1
	jc LB_9245
	btr r12,4
	jmp LB_9246
LB_9245:
	bts r12,4
LB_9246:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9243
	btr QWORD [rdi],1
	jmp LB_9244
LB_9243:
	bts QWORD [rdi],1
LB_9244:
	mov r10,r8
	bt r12,2
	jc LB_9249
	btr r12,4
	jmp LB_9250
LB_9249:
	bts r12,4
LB_9250:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_9247
	btr QWORD [rdi],2
	jmp LB_9248
LB_9247:
	bts QWORD [rdi],2
LB_9248:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_9251
	btr r12,3
	jmp LB_9252
LB_9251:
	bts r12,3
LB_9252:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9255
	btr r12,4
	clc
	jmp LB_9256
LB_9255:
	bts r12,4
	stc
LB_9256:
	mov r13,r10
	bt r12,4
	jc LB_9253
	btr r12,0
	jmp LB_9254
LB_9253:
	bts r12,0
LB_9254:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9259
	btr r12,4
	clc
	jmp LB_9260
LB_9259:
	bts r12,4
	stc
LB_9260:
	mov r14,r10
	bt r12,4
	jc LB_9257
	btr r12,1
	jmp LB_9258
LB_9257:
	bts r12,1
LB_9258:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_9263
	btr r12,4
	clc
	jmp LB_9264
LB_9263:
	bts r12,4
	stc
LB_9264:
	mov r8,r10
	bt r12,4
	jc LB_9261
	btr r12,2
	jmp LB_9262
LB_9261:
	bts r12,2
LB_9262:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_9265:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9266
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
	jnc LB_9267
	bt QWORD [rdi],0
	jc LB_9268
	btr r12,4
	clc
	jmp LB_9269
LB_9268:
	bts r12,4
	stc
LB_9269:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9267:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9270
	btr r12,3
	jmp LB_9271
LB_9270:
	bts r12,3
LB_9271:
LB_9272:
	cmp r15,0
	jz LB_9273
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9272
LB_9273:
; _f9193 { %_9153 %_9154 %_9156 } ⊢ { %_9157 %_9158 %_9159 } : { %_9157 %_9158 %_9159 }
 ; {>  %_9154~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9156~3':(_lst)◂((_p1439)◂((_p1447)◂(t3496'(-1)))) %_9153~0':_r64 }
; _f9193 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_9274
	btr r12,2
	jmp LB_9275
LB_9274:
	bts r12,2
LB_9275:
	call NS_E_9193
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1440 %_9159 ⊢ %_9160 : %_9160
 ; {>  %_9159~2':(_lst)◂((_p1439)◂((_p1447)◂(_r64))) %_9158~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9157~0':_r64 }
; _f1440 2' ⊢ °0◂2'
; ∎ { %_9157 %_9158 %_9160 }
 ; {>  %_9160~°0◂2':(_p1439)◂((_p1447)◂(_r64)) %_9158~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9157~0':_r64 }
; 	∎ { 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' °0◂2' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_9276
	btr r12,3
	jmp LB_9277
LB_9276:
	bts r12,3
LB_9277:
	mov r8,r9
	bt r12,3
	jc LB_9280
	btr r12,2
	jmp LB_9281
LB_9280:
	bts r12,2
LB_9281:
	mov rsi,1
	bt r12,2
	jc LB_9278
	mov rsi,0
	bt r8,0
	jc LB_9278
	jmp LB_9279
LB_9278:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9279:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9266:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9282
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
	jnc LB_9283
	bt QWORD [rdi],0
	jc LB_9284
	btr r12,4
	clc
	jmp LB_9285
LB_9284:
	bts r12,4
	stc
LB_9285:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9283:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9286
	btr r12,3
	jmp LB_9287
LB_9286:
	bts r12,3
LB_9287:
LB_9288:
	cmp r15,0
	jz LB_9289
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9288
LB_9289:
MTC_LB_9290:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9291
; _emt_mov_ptn_to_ptn:{| 11010.. |},3' ⊢ °1◂2'
; 3' ⊢ °1◂2'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9292
	bt QWORD [rdi],0
	jc LB_9293
	btr r12,4
	clc
	jmp LB_9294
LB_9293:
	bts r12,4
	stc
LB_9294:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9292:
	mov r10,rdi
	mov r8,r10
	bt r12,4
	jc LB_9295
	btr r12,2
	jmp LB_9296
LB_9295:
	bts r12,2
LB_9296:
LB_9297:
	cmp r15,0
	jz LB_9298
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9297
LB_9298:
; _f38 { %_9162 %_9153 } ⊢ { %_9163 %_9164 } : { %_9163 %_9164 }
 ; {>  %_9154~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9162~2':t3496'(-1) %_9153~0':_r64 }
; _f38 { 2' 0' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 2' 0' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_9301
	btr r12,1
	jmp LB_9302
LB_9301:
	bts r12,1
LB_9302:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_9305
	btr r12,3
	jmp LB_9306
LB_9305:
	bts r12,3
LB_9306:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_9303
	btr QWORD [rdi],0
	jmp LB_9304
LB_9303:
	bts QWORD [rdi],0
LB_9304:
	mov r9,r14
	bt r12,1
	jc LB_9309
	btr r12,3
	jmp LB_9310
LB_9309:
	bts r12,3
LB_9310:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_9307
	btr QWORD [rdi],1
	jmp LB_9308
LB_9307:
	bts QWORD [rdi],1
LB_9308:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 2' }
	mov r14,r13
	bt r12,0
	jc LB_9311
	btr r12,1
	jmp LB_9312
LB_9311:
	bts r12,1
LB_9312:
; 1' ⊢ { 0' 2' }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_9315
	btr r12,3
	clc
	jmp LB_9316
LB_9315:
	bts r12,3
	stc
LB_9316:
	mov r13,r9
	bt r12,3
	jc LB_9313
	btr r12,0
	jmp LB_9314
LB_9313:
	bts r12,0
LB_9314:
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_9319
	btr r12,3
	clc
	jmp LB_9320
LB_9319:
	bts r12,3
	stc
LB_9320:
	mov r8,r9
	bt r12,3
	jc LB_9317
	btr r12,2
	jmp LB_9318
LB_9317:
	bts r12,2
LB_9318:
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9299
	btr r12,1
	clc
	jmp LB_9300
LB_9299:
	bts r12,1
	stc
LB_9300:
	add rsp,16
; _f717 { %_9154 %_9163 } ⊢ { %_9165 %_9166 %_9167 } : { %_9165 %_9166 %_9167 }
 ; {>  %_9154~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9163~0':t3496'(-1) %_9164~2':_r64 }
; _f717 { 1' 0' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9323
	btr r12,2
	jmp LB_9324
LB_9323:
	bts r12,2
LB_9324:
	mov r14,r13
	bt r12,0
	jc LB_9325
	btr r12,1
	jmp LB_9326
LB_9325:
	bts r12,1
LB_9326:
	mov r13,r8
	bt r12,2
	jc LB_9327
	btr r12,0
	jmp LB_9328
LB_9327:
	bts r12,0
LB_9328:
	call NS_E_717
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 3' }
	mov r9,r8
	bt r12,2
	jc LB_9329
	btr r12,3
	jmp LB_9330
LB_9329:
	bts r12,3
LB_9330:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9321
	btr r12,2
	clc
	jmp LB_9322
LB_9321:
	bts r12,2
	stc
LB_9322:
	add rsp,16
MTC_LB_9331:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9332
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂{  }
; 3' ⊢ °1◂{  }
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9333
	bt QWORD [rdi],0
	jc LB_9334
	btr r12,4
	clc
	jmp LB_9335
LB_9334:
	bts r12,4
	stc
LB_9335:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9333:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9336:
	cmp r15,0
	jz LB_9337
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9336
LB_9337:
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ 3'
	mov r9,r8
	bt r12,2
	jc LB_9338
	btr r12,3
	jmp LB_9339
LB_9338:
	bts r12,3
LB_9339:
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_9346
	btr r12,4
	clc
	jmp LB_9347
LB_9346:
	bts r12,4
	stc
LB_9347:
	call dcp
	mov r10,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9344
	btr r12,3
	clc
	jmp LB_9345
LB_9344:
	bts r12,3
	stc
LB_9345:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9342
	btr r12,1
	clc
	jmp LB_9343
LB_9342:
	bts r12,1
	stc
LB_9343:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9340
	btr r12,0
	clc
	jmp LB_9341
LB_9340:
	bts r12,0
	stc
LB_9341:
	add rsp,32
; _some %_9169 ⊢ %_9170 : %_9170
 ; {>  %_9166~1':t3496'(-1) %_9165~0':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9168~3':_r64 %_9169~4':_r64 }
; _some 4' ⊢ °0◂4'
; _cns { { %_9166 %_9170 } %_9165 } ⊢ %_9171 : %_9171
 ; {>  %_9170~°0◂4':(_opn)◂(_r64) %_9166~1':t3496'(-1) %_9165~0':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9168~3':_r64 }
; _cns { { 1' °0◂4' } 0' } ⊢ °0◂{ { 1' °0◂4' } 0' }
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ 2'
	mov r8,r9
	bt r12,3
	jc LB_9348
	btr r12,2
	jmp LB_9349
LB_9348:
	bts r12,2
LB_9349:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r8
	bt r12,2
	jc LB_9358
	btr r12,5
	clc
	jmp LB_9359
LB_9358:
	bts r12,5
	stc
LB_9359:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9356
	btr r12,4
	clc
	jmp LB_9357
LB_9356:
	bts r12,4
	stc
LB_9357:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9354
	btr r12,2
	clc
	jmp LB_9355
LB_9354:
	bts r12,2
	stc
LB_9355:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9352
	btr r12,1
	clc
	jmp LB_9353
LB_9352:
	bts r12,1
	stc
LB_9353:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9350
	btr r12,0
	clc
	jmp LB_9351
LB_9350:
	bts r12,0
	stc
LB_9351:
	add rsp,40
; _f1451 %_9173 ⊢ %_9174 : %_9174
 ; {>  %_9173~5':_r64 %_9171~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9172~2':_r64 }
; _f1451 5' ⊢ °1◂5'
; _f56 %_9172 ⊢ %_9175 : %_9175
 ; {>  %_9171~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9174~°1◂5':(_p1447)◂(_r64) %_9172~2':_r64 }
	add r8,1
; _f1441 %_9174 ⊢ %_9176 : %_9176
 ; {>  %_9175~2':_r64 %_9171~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9174~°1◂5':(_p1447)◂(_r64) }
; _f1441 °1◂5' ⊢ °1◂°1◂5'
; ∎ { %_9175 %_9171 %_9176 }
 ; {>  %_9175~2':_r64 %_9176~°1◂°1◂5':(_p1439)◂((_p1447)◂(_r64)) %_9171~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) }
; 	∎ { 2' °0◂{ { 1' °0◂4' } 0' } °1◂°1◂5' }
; _emt_mov_ptn_to_ptn:{| 1110110.. |},{ 2' °0◂{ { 1' °0◂4' } 0' } °1◂°1◂5' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_9360
	btr r12,3
	jmp LB_9361
LB_9360:
	bts r12,3
LB_9361:
	mov r8,r11
	bt r12,5
	jc LB_9366
	btr r12,2
	jmp LB_9367
LB_9366:
	bts r12,2
LB_9367:
	mov rsi,1
	bt r12,2
	jc LB_9364
	mov rsi,0
	bt r8,0
	jc LB_9364
	jmp LB_9365
LB_9364:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9365:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_9362
	mov rsi,0
	bt r8,0
	jc LB_9362
	jmp LB_9363
LB_9362:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9363:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov r11,r14
	bt r12,1
	jc LB_9368
	btr r12,5
	jmp LB_9369
LB_9368:
	bts r12,5
LB_9369:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdx,r11
	bt r12,5
	jc LB_9376
	btr r12,7
	jmp LB_9377
LB_9376:
	bts r12,7
LB_9377:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_9374
	btr QWORD [rdi],0
	jmp LB_9375
LB_9374:
	bts QWORD [rdi],0
LB_9375:
	mov rdx,r10
	bt r12,4
	jc LB_9382
	btr r12,7
	jmp LB_9383
LB_9382:
	bts r12,7
LB_9383:
	mov rsi,1
	bt r12,7
	jc LB_9380
	mov rsi,0
	bt rdx,0
	jc LB_9380
	jmp LB_9381
LB_9380:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_9381:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_9378
	btr QWORD [rdi],1
	jmp LB_9379
LB_9378:
	bts QWORD [rdi],1
LB_9379:
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9372
	btr QWORD [rdi],0
	jmp LB_9373
LB_9372:
	bts QWORD [rdi],0
LB_9373:
	mov rcx,r13
	bt r12,0
	jc LB_9386
	btr r12,6
	jmp LB_9387
LB_9386:
	bts r12,6
LB_9387:
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9384
	btr QWORD [rdi],1
	jmp LB_9385
LB_9384:
	bts QWORD [rdi],1
LB_9385:
	mov rsi,1
	bt r12,1
	jc LB_9370
	mov rsi,0
	bt r14,0
	jc LB_9370
	jmp LB_9371
LB_9370:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9371:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r9
	bt r12,3
	jc LB_9388
	btr r12,0
	jmp LB_9389
LB_9388:
	bts r12,0
LB_9389:
	ret
MTC_LB_9332:
	mov r15,0
LB_9391:
	cmp r15,0
	jz LB_9392
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9391
LB_9392:
	jmp err
MTC_LB_9390:
MTC_LB_9291:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9393
; _emt_mov_ptn_to_ptn:{| 11010.. |},3' ⊢ °0◂{  }
; 3' ⊢ °0◂{  }
	btr r12,2
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9394
	bt QWORD [rdi],0
	jc LB_9395
	btr r12,2
	clc
	jmp LB_9396
LB_9395:
	bts r12,2
	stc
LB_9396:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9394:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9397:
	cmp r15,0
	jz LB_9398
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9397
LB_9398:
; _f1450 {  } ⊢ %_9177 : %_9177
 ; {>  %_9154~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9153~0':_r64 }
; _f1450 {  } ⊢ °0◂{  }
; _f1441 %_9177 ⊢ %_9178 : %_9178
 ; {>  %_9154~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9177~°0◂{  }:(_p1447)◂(t3524'(0)) %_9153~0':_r64 }
; _f1441 °0◂{  } ⊢ °1◂°0◂{  }
; ∎ { %_9153 %_9154 %_9178 }
 ; {>  %_9178~°1◂°0◂{  }:(_p1439)◂((_p1447)◂(t3527'(0))) %_9154~1':(_lst)◂({ t3496'(-1) (_opn)◂(_r64) }) %_9153~0':_r64 }
; 	∎ { 0' 1' °1◂°0◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂°0◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_9401
	mov rsi,0
	bt r8,0
	jc LB_9401
	jmp LB_9402
LB_9401:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9402:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_9399
	mov rsi,0
	bt r8,0
	jc LB_9399
	jmp LB_9400
LB_9399:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9400:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9393:
MTC_LB_9282:
NS_E_9433:
; 	|» { 0' 1' }
NS_E_RDI_9433:
MTC_LB_9434:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9435
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
	jnc LB_9436
	bt QWORD [rdi],0
	jc LB_9437
	btr r12,4
	clc
	jmp LB_9438
LB_9437:
	bts r12,4
	stc
LB_9438:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9436:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_9441
	btr r12,5
	clc
	jmp LB_9442
LB_9441:
	bts r12,5
	stc
LB_9442:
	mov r8,r11
	bt r12,5
	jc LB_9439
	btr r12,2
	jmp LB_9440
LB_9439:
	bts r12,2
LB_9440:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_9445
	btr r12,5
	clc
	jmp LB_9446
LB_9445:
	bts r12,5
	stc
LB_9446:
	mov r9,r11
	bt r12,5
	jc LB_9443
	btr r12,3
	jmp LB_9444
LB_9443:
	bts r12,3
LB_9444:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9447:
	cmp r15,0
	jz LB_9448
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9447
LB_9448:
; _f9422 { %_9423 %_9425 } ⊢ { %_9427 %_9428 } : { %_9427 %_9428 }
 ; {>  %_9425~2':(_p1439)◂((_p1446)◂(t3632'(-1))) %_9423~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) %_9426~3':(_lst)◂((_p1439)◂((_p1446)◂(t3632'(-1)))) }
; _f9422 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_9451
	btr r12,1
	jmp LB_9452
LB_9451:
	bts r12,1
LB_9452:
	call NS_E_9422
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_9449
	btr r12,3
	clc
	jmp LB_9450
LB_9449:
	bts r12,3
	stc
LB_9450:
	add rsp,16
; _f9433 { %_9427 %_9426 } ⊢ { %_9429 %_9430 } : { %_9429 %_9430 }
 ; {>  %_9428~1':(_p1439)◂((_p1446)◂(t3661'(-1))) %_9427~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) %_9426~3':(_lst)◂((_p1439)◂((_p1446)◂(t3632'(-1)))) }
; _f9433 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_9455
	btr r12,1
	jmp LB_9456
LB_9455:
	bts r12,1
LB_9456:
	call NS_E_9433
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_9457
	btr r12,2
	jmp LB_9458
LB_9457:
	bts r12,2
LB_9458:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9453
	btr r12,1
	clc
	jmp LB_9454
LB_9453:
	bts r12,1
	stc
LB_9454:
	add rsp,16
; _cns { %_9428 %_9430 } ⊢ %_9431 : %_9431
 ; {>  %_9429~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) %_9430~2':(_lst)◂((_p1439)◂((_p1446)◂(t3661'(-1)))) %_9428~1':(_p1439)◂((_p1446)◂(t3661'(-1))) }
; _cns { 1' 2' } ⊢ °0◂{ 1' 2' }
; ∎ { %_9429 %_9431 }
 ; {>  %_9429~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) %_9431~°0◂{ 1' 2' }:(_lst)◂((_p1439)◂((_p1446)◂(t3661'(-1)))) }
; 	∎ { 0' °0◂{ 1' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' °0◂{ 1' 2' } } ⊢ { 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_9459
	btr r12,3
	jmp LB_9460
LB_9459:
	bts r12,3
LB_9460:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r10,r9
	bt r12,3
	jc LB_9465
	btr r12,4
	jmp LB_9466
LB_9465:
	bts r12,4
LB_9466:
	mov rdi,r14
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9463
	btr QWORD [rdi],0
	jmp LB_9464
LB_9463:
	bts QWORD [rdi],0
LB_9464:
	mov r10,r8
	bt r12,2
	jc LB_9469
	btr r12,4
	jmp LB_9470
LB_9469:
	bts r12,4
LB_9470:
	mov rdi,r14
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9467
	btr QWORD [rdi],1
	jmp LB_9468
LB_9467:
	bts QWORD [rdi],1
LB_9468:
	mov rsi,1
	bt r12,1
	jc LB_9461
	mov rsi,0
	bt r14,0
	jc LB_9461
	jmp LB_9462
LB_9461:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9462:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_9435:
	mov r15,0
LB_9472:
	cmp r15,0
	jz LB_9473
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9472
LB_9473:
; _nil {  } ⊢ %_9432 : %_9432
 ; {>  %_9424~1':(_lst)◂((_p1439)◂((_p1446)◂(t3632'(-1)))) %_9423~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _nil {  } ⊢ °1◂{  }
; ∎ { %_9423 %_9432 }
 ; {>  %_9432~°1◂{  }:(_lst)◂(t3614'(0)) %_9424~1':(_lst)◂((_p1439)◂((_p1446)◂(t3632'(-1)))) %_9423~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_9474
	mov rdi,r14
	call dlt
LB_9474:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_9475
	mov rsi,0
	bt r14,0
	jc LB_9475
	jmp LB_9476
LB_9475:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9476:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_9471:
NS_E_9422:
; 	|» { 0' 1' }
NS_E_RDI_9422:
MTC_LB_9477:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9478
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
	jnc LB_9479
	bt QWORD [rdi],0
	jc LB_9480
	btr r12,3
	clc
	jmp LB_9481
LB_9480:
	bts r12,3
	stc
LB_9481:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9479:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_9482
	btr r12,2
	jmp LB_9483
LB_9482:
	bts r12,2
LB_9483:
LB_9484:
	cmp r15,0
	jz LB_9485
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9484
LB_9485:
; _f9433 { %_9403 %_9405 } ⊢ { %_9406 %_9407 } : { %_9406 %_9407 }
 ; {>  %_9405~2':(_lst)◂((_p1439)◂((_p1446)◂(t3632'(-1)))) %_9403~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _f9433 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_9486
	btr r12,1
	jmp LB_9487
LB_9486:
	bts r12,1
LB_9487:
	call NS_E_9433
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1440 %_9407 ⊢ %_9408 : %_9408
 ; {>  %_9406~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) %_9407~1':(_lst)◂((_p1439)◂((_p1446)◂(t3661'(-1)))) }
; _f1440 1' ⊢ °0◂1'
; ∎ { %_9406 %_9408 }
 ; {>  %_9408~°0◂1':(_p1439)◂((_p1446)◂(t3661'(-1))) %_9406~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; 	∎ { 0' °0◂1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' °0◂1' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9488
	btr r12,2
	jmp LB_9489
LB_9488:
	bts r12,2
LB_9489:
	mov r14,r8
	bt r12,2
	jc LB_9492
	btr r12,1
	jmp LB_9493
LB_9492:
	bts r12,1
LB_9493:
	mov rsi,1
	bt r12,1
	jc LB_9490
	mov rsi,0
	bt r14,0
	jc LB_9490
	jmp LB_9491
LB_9490:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9491:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_9478:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9494
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
	jnc LB_9495
	bt QWORD [rdi],0
	jc LB_9496
	btr r12,3
	clc
	jmp LB_9497
LB_9496:
	bts r12,3
	stc
LB_9497:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9495:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_9498
	btr r12,2
	jmp LB_9499
LB_9498:
	bts r12,2
LB_9499:
LB_9500:
	cmp r15,0
	jz LB_9501
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9500
LB_9501:
MTC_LB_9502:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9503
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂1'
; 2' ⊢ °1◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_9504
	bt QWORD [rdi],0
	jc LB_9505
	btr r12,3
	clc
	jmp LB_9506
LB_9505:
	bts r12,3
	stc
LB_9506:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9504:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_9507
	btr r12,1
	jmp LB_9508
LB_9507:
	bts r12,1
LB_9508:
LB_9509:
	cmp r15,0
	jz LB_9510
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9509
LB_9510:
; _f717 { %_9403 %_9410 } ⊢ { %_9411 %_9412 %_9413 } : { %_9411 %_9412 %_9413 }
 ; {>  %_9410~1':t3632'(-1) %_9403~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _f717 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_717
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_9511:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9512
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
	jnc LB_9513
	bt QWORD [rdi],0
	jc LB_9514
	btr r12,4
	clc
	jmp LB_9515
LB_9514:
	bts r12,4
	stc
LB_9515:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9513:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9516
	btr r12,3
	jmp LB_9517
LB_9516:
	bts r12,3
LB_9517:
LB_9518:
	cmp r15,0
	jz LB_9519
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9518
LB_9519:
; _f1449 %_9414 ⊢ %_9415 : %_9415
 ; {>  %_9412~1':t3632'(-1) %_9414~3':t3661'(-1) %_9411~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _f1449 3' ⊢ °1◂3'
; _f1441 %_9415 ⊢ %_9416 : %_9416
 ; {>  %_9412~1':t3632'(-1) %_9415~°1◂3':(_p1446)◂(t3661'(-1)) %_9411~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _f1441 °1◂3' ⊢ °1◂°1◂3'
; _none {  } ⊢ %_9417 : %_9417
 ; {>  %_9412~1':t3632'(-1) %_9416~°1◂°1◂3':(_p1439)◂((_p1446)◂(t3661'(-1))) %_9411~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; _cns { { %_9412 %_9417 } %_9411 } ⊢ %_9418 : %_9418
 ; {>  %_9412~1':t3632'(-1) %_9416~°1◂°1◂3':(_p1439)◂((_p1446)◂(t3661'(-1))) %_9417~°1◂{  }:(_opn)◂(t3647'(0)) %_9411~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _cns { { 1' °1◂{  } } 0' } ⊢ °0◂{ { 1' °1◂{  } } 0' }
; ∎ { %_9418 %_9416 }
 ; {>  %_9418~°0◂{ { 1' °1◂{  } } 0' }:(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) %_9416~°1◂°1◂3':(_p1439)◂((_p1446)◂(t3661'(-1))) }
; 	∎ { °0◂{ { 1' °1◂{  } } 0' } °1◂°1◂3' }
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ °0◂{ { 1' °1◂{  } } 0' } °1◂°1◂3' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9520
	btr r12,2
	jmp LB_9521
LB_9520:
	bts r12,2
LB_9521:
	mov r14,r9
	bt r12,3
	jc LB_9526
	btr r12,1
	jmp LB_9527
LB_9526:
	bts r12,1
LB_9527:
	mov rsi,1
	bt r12,1
	jc LB_9524
	mov rsi,0
	bt r14,0
	jc LB_9524
	jmp LB_9525
LB_9524:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9525:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rsi,1
	bt r12,1
	jc LB_9522
	mov rsi,0
	bt r14,0
	jc LB_9522
	jmp LB_9523
LB_9522:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9523:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov r9,r13
	bt r12,0
	jc LB_9528
	btr r12,3
	jmp LB_9529
LB_9528:
	bts r12,3
LB_9529:
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
	mov r10,rax
	btr r12,4
	mov r11,r8
	bt r12,2
	jc LB_9536
	btr r12,5
	jmp LB_9537
LB_9536:
	bts r12,5
LB_9537:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9534
	btr QWORD [rdi],0
	jmp LB_9535
LB_9534:
	bts QWORD [rdi],0
LB_9535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rsi,1
	bt r12,5
	jc LB_9540
	mov rsi,0
	bt r11,0
	jc LB_9540
	jmp LB_9541
LB_9540:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_9541:
	mov rax,0x0100_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9538
	btr QWORD [rdi],1
	jmp LB_9539
LB_9538:
	bts QWORD [rdi],1
LB_9539:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9532
	btr QWORD [rdi],0
	jmp LB_9533
LB_9532:
	bts QWORD [rdi],0
LB_9533:
	mov r10,r9
	bt r12,3
	jc LB_9544
	btr r12,4
	jmp LB_9545
LB_9544:
	bts r12,4
LB_9545:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9542
	btr QWORD [rdi],1
	jmp LB_9543
LB_9542:
	bts QWORD [rdi],1
LB_9543:
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
	ret
MTC_LB_9512:
	mov r15,0
LB_9547:
	cmp r15,0
	jz LB_9548
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9547
LB_9548:
	jmp err
MTC_LB_9546:
MTC_LB_9503:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9549
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
	jnc LB_9550
	bt QWORD [rdi],0
	jc LB_9551
	btr r12,3
	clc
	jmp LB_9552
LB_9551:
	bts r12,3
	stc
LB_9552:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9550:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_9553
	btr r12,1
	jmp LB_9554
LB_9553:
	bts r12,1
LB_9554:
LB_9555:
	cmp r15,0
	jz LB_9556
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9555
LB_9556:
; _f1448 %_9419 ⊢ %_9420 : %_9420
 ; {>  %_9419~1':_p1442 %_9403~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _f1448 1' ⊢ °0◂1'
; _f1441 %_9420 ⊢ %_9421 : %_9421
 ; {>  %_9420~°0◂1':(_p1446)◂(t3655'(0)) %_9403~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; _f1441 °0◂1' ⊢ °1◂°0◂1'
; ∎ { %_9403 %_9421 }
 ; {>  %_9421~°1◂°0◂1':(_p1439)◂((_p1446)◂(t3658'(0))) %_9403~0':(_lst)◂({ t3632'(-1) (_opn)◂(t3661'(-1)) }) }
; 	∎ { 0' °1◂°0◂1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' °1◂°0◂1' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9557
	btr r12,2
	jmp LB_9558
LB_9557:
	bts r12,2
LB_9558:
	mov r14,r8
	bt r12,2
	jc LB_9563
	btr r12,1
	jmp LB_9564
LB_9563:
	bts r12,1
LB_9564:
	mov rsi,1
	bt r12,1
	jc LB_9561
	mov rsi,0
	bt r14,0
	jc LB_9561
	jmp LB_9562
LB_9561:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9562:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rsi,1
	bt r12,1
	jc LB_9559
	mov rsi,0
	bt r14,0
	jc LB_9559
	jmp LB_9560
LB_9559:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9560:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_9549:
MTC_LB_9494:
NS_E_9596:
; 	|» { 0' 1' 2' }
NS_E_RDI_9596:
MTC_LB_9597:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9598
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
	jnc LB_9599
	bt QWORD [rdi],0
	jc LB_9600
	btr r12,5
	clc
	jmp LB_9601
LB_9600:
	bts r12,5
	stc
LB_9601:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9599:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9604
	btr r12,6
	clc
	jmp LB_9605
LB_9604:
	bts r12,6
	stc
LB_9605:
	mov r9,rcx
	bt r12,6
	jc LB_9602
	btr r12,3
	jmp LB_9603
LB_9602:
	bts r12,3
LB_9603:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9608
	btr r12,6
	clc
	jmp LB_9609
LB_9608:
	bts r12,6
	stc
LB_9609:
	mov r10,rcx
	bt r12,6
	jc LB_9606
	btr r12,4
	jmp LB_9607
LB_9606:
	bts r12,4
LB_9607:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9610:
	cmp r15,0
	jz LB_9611
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9610
LB_9611:
MTC_LB_9612:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9613
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ °0◂{ 2' 5' 6' }
; 3' ⊢ °0◂{ 2' 5' 6' }
	btr r12,7
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9614
	bt QWORD [rdi],0
	jc LB_9615
	btr r12,7
	clc
	jmp LB_9616
LB_9615:
	bts r12,7
	stc
LB_9616:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9614:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_9619
	btr r12,8
	clc
	jmp LB_9620
LB_9619:
	bts r12,8
	stc
LB_9620:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9617
	btr r12,2
	jmp LB_9618
LB_9617:
	bts r12,2
LB_9618:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_9623
	btr r12,8
	clc
	jmp LB_9624
LB_9623:
	bts r12,8
	stc
LB_9624:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9621
	btr r12,5
	jmp LB_9622
LB_9621:
	bts r12,5
LB_9622:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_9627
	btr r12,8
	clc
	jmp LB_9628
LB_9627:
	bts r12,8
	stc
LB_9628:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9625
	btr r12,6
	jmp LB_9626
LB_9625:
	bts r12,6
LB_9626:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9629:
	cmp r15,0
	jz LB_9630
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9629
LB_9630:
; _f9422 { %_9566 %_9571 } ⊢ { %_9573 %_9574 } : { %_9573 %_9574 }
 ; {>  %_9572~6':(_p1439)◂((_p1447)◂(t3802'(-1))) %_9571~5':(_p1439)◂((_p1446)◂(t3802'(-1))) %_9570~2':_p1394 %_9566~1':(_lst)◂({ t3802'(-1) (_opn)◂(_r64) }) %_9569~4':(_p1452)◂(t3802'(-1)) %_9565~0':_r64 }
; _f9422 { 1' 5' } ⊢ { 1' 3' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0100010.. |},{ 1' 5' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_9639
	btr r12,0
	jmp LB_9640
LB_9639:
	bts r12,0
LB_9640:
	mov r14,r11
	bt r12,5
	jc LB_9641
	btr r12,1
	jmp LB_9642
LB_9641:
	bts r12,1
LB_9642:
	call NS_E_9422
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_9643
	btr r12,3
	jmp LB_9644
LB_9643:
	bts r12,3
LB_9644:
	mov r14,r13
	bt r12,0
	jc LB_9645
	btr r12,1
	jmp LB_9646
LB_9645:
	bts r12,1
LB_9646:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_9637
	btr r12,6
	clc
	jmp LB_9638
LB_9637:
	bts r12,6
	stc
LB_9638:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_9635
	btr r12,4
	clc
	jmp LB_9636
LB_9635:
	bts r12,4
	stc
LB_9636:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9633
	btr r12,2
	clc
	jmp LB_9634
LB_9633:
	bts r12,2
	stc
LB_9634:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9631
	btr r12,0
	clc
	jmp LB_9632
LB_9631:
	bts r12,0
	stc
LB_9632:
	add rsp,40
; _f9179 { %_9565 %_9573 %_9572 } ⊢ { %_9575 %_9576 %_9577 } : { %_9575 %_9576 %_9577 }
 ; {>  %_9572~6':(_p1439)◂((_p1447)◂(t3802'(-1))) %_9570~2':_p1394 %_9569~4':(_p1452)◂(t3802'(-1)) %_9565~0':_r64 %_9573~1':(_lst)◂({ t3802'(-1) (_opn)◂(_r64) }) %_9574~3':(_p1439)◂((_p1446)◂(_r64)) }
; _f9179 { 0' 1' 6' } ⊢ { 0' 1' 5' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11000010.. |},{ 0' 1' 6' } ⊢ { 0' 1' 2' }
	mov r8,rcx
	bt r12,6
	jc LB_9653
	btr r12,2
	jmp LB_9654
LB_9653:
	bts r12,2
LB_9654:
	call NS_E_9179
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 5' }
	mov r11,r8
	bt r12,2
	jc LB_9655
	btr r12,5
	jmp LB_9656
LB_9655:
	bts r12,5
LB_9656:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_9651
	btr r12,4
	clc
	jmp LB_9652
LB_9651:
	bts r12,4
	stc
LB_9652:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_9649
	btr r12,3
	clc
	jmp LB_9650
LB_9649:
	bts r12,3
	stc
LB_9650:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9647
	btr r12,2
	clc
	jmp LB_9648
LB_9647:
	bts r12,2
	stc
LB_9648:
	add rsp,32
; _f9596 { %_9575 %_9576 %_9569 } ⊢ { %_9578 %_9579 %_9580 } : { %_9578 %_9579 %_9580 }
 ; {>  %_9570~2':_p1394 %_9577~5':(_p1439)◂((_p1447)◂(_r64)) %_9575~0':_r64 %_9569~4':(_p1452)◂(t3802'(-1)) %_9576~1':(_lst)◂({ t3802'(-1) (_opn)◂(_r64) }) %_9574~3':(_p1439)◂((_p1446)◂(_r64)) }
; _f9596 { 0' 1' 4' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110010.. |},{ 0' 1' 4' } ⊢ { 0' 1' 2' }
	mov r8,r10
	bt r12,4
	jc LB_9663
	btr r12,2
	jmp LB_9664
LB_9663:
	bts r12,2
LB_9664:
	call NS_E_9596
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_9665
	btr r12,4
	jmp LB_9666
LB_9665:
	bts r12,4
LB_9666:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_9661
	btr r12,5
	clc
	jmp LB_9662
LB_9661:
	bts r12,5
	stc
LB_9662:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_9659
	btr r12,3
	clc
	jmp LB_9660
LB_9659:
	bts r12,3
	stc
LB_9660:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9657
	btr r12,2
	clc
	jmp LB_9658
LB_9657:
	bts r12,2
	stc
LB_9658:
	add rsp,32
; _f1464 { %_9570 %_9574 %_9577 } ⊢ %_9581 : %_9581
 ; {>  %_9570~2':_p1394 %_9577~5':(_p1439)◂((_p1447)◂(_r64)) %_9579~1':t3816'(-1) %_9580~4':(_p1452)◂(_r64) %_9578~0':t3815'(-1) %_9574~3':(_p1439)◂((_p1446)◂(_r64)) }
; _f1464 { 2' 3' 5' } ⊢ °0◂{ 2' 3' 5' }
; _f1460 { %_9581 %_9580 } ⊢ %_9582 : %_9582
 ; {>  %_9581~°0◂{ 2' 3' 5' }:(_p1453)◂(_r64) %_9579~1':t3816'(-1) %_9580~4':(_p1452)◂(_r64) %_9578~0':t3815'(-1) }
; _f1460 { °0◂{ 2' 3' 5' } 4' } ⊢ °0◂{ °0◂{ 2' 3' 5' } 4' }
; ∎ { %_9578 %_9579 %_9582 }
 ; {>  %_9582~°0◂{ °0◂{ 2' 3' 5' } 4' }:(_p1452)◂(_r64) %_9579~1':t3816'(-1) %_9578~0':t3815'(-1) }
; 	∎ { 0' 1' °0◂{ °0◂{ 2' 3' 5' } 4' } }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' °0◂{ °0◂{ 2' 3' 5' } 4' } } ⊢ { 0' 1' 2' }
	mov rcx,r8
	bt r12,2
	jc LB_9667
	btr r12,6
	jmp LB_9668
LB_9667:
	bts r12,6
LB_9668:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov rdx,rax
	btr r12,7
	mov rdi,rcx
	mov QWORD [st_vct+8*8],rdi
	bt r12,6
	jc LB_9677
	btr r12,8
	jmp LB_9678
LB_9677:
	bts r12,8
LB_9678:
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,8
	jc LB_9675
	btr QWORD [rdi],0
	jmp LB_9676
LB_9675:
	bts QWORD [rdi],0
LB_9676:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_9681
	btr r12,8
	jmp LB_9682
LB_9681:
	bts r12,8
LB_9682:
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,8
	jc LB_9679
	btr QWORD [rdi],1
	jmp LB_9680
LB_9679:
	bts QWORD [rdi],1
LB_9680:
	mov rdi,r11
	mov QWORD [st_vct+8*8],rdi
	bt r12,5
	jc LB_9685
	btr r12,8
	jmp LB_9686
LB_9685:
	bts r12,8
LB_9686:
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,8
	jc LB_9683
	btr QWORD [rdi],2
	jmp LB_9684
LB_9683:
	bts QWORD [rdi],2
LB_9684:
	mov rsi,1
	bt r12,7
	jc LB_9673
	mov rsi,0
	bt rdx,0
	jc LB_9673
	jmp LB_9674
LB_9673:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_9674:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,r8
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_9671
	btr QWORD [rdi],0
	jmp LB_9672
LB_9671:
	bts QWORD [rdi],0
LB_9672:
	mov rdx,r10
	bt r12,4
	jc LB_9689
	btr r12,7
	jmp LB_9690
LB_9689:
	bts r12,7
LB_9690:
	mov rdi,r8
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_9687
	btr QWORD [rdi],1
	jmp LB_9688
LB_9687:
	bts QWORD [rdi],1
LB_9688:
	mov rsi,1
	bt r12,2
	jc LB_9669
	mov rsi,0
	bt r8,0
	jc LB_9669
	jmp LB_9670
LB_9669:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9670:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9613:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9691
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ °1◂{ 2' 5' }
; 3' ⊢ °1◂{ 2' 5' }
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9692
	bt QWORD [rdi],0
	jc LB_9693
	btr r12,6
	clc
	jmp LB_9694
LB_9693:
	bts r12,6
	stc
LB_9694:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9692:
	mov rcx,rdi
; 6' ⊢ { 2' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_9697
	btr r12,7
	clc
	jmp LB_9698
LB_9697:
	bts r12,7
	stc
LB_9698:
	mov r8,rdx
	bt r12,7
	jc LB_9695
	btr r12,2
	jmp LB_9696
LB_9695:
	bts r12,2
LB_9696:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_9701
	btr r12,7
	clc
	jmp LB_9702
LB_9701:
	bts r12,7
	stc
LB_9702:
	mov r11,rdx
	bt r12,7
	jc LB_9699
	btr r12,5
	jmp LB_9700
LB_9699:
	bts r12,5
LB_9700:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9703:
	cmp r15,0
	jz LB_9704
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9703
LB_9704:
	jmp err
MTC_LB_9691:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz MTC_LB_9705
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ °2◂{ 2' 5' 6' }
; 3' ⊢ °2◂{ 2' 5' 6' }
	btr r12,7
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9706
	bt QWORD [rdi],0
	jc LB_9707
	btr r12,7
	clc
	jmp LB_9708
LB_9707:
	bts r12,7
	stc
LB_9708:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9706:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_9711
	btr r12,8
	clc
	jmp LB_9712
LB_9711:
	bts r12,8
	stc
LB_9712:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9709
	btr r12,2
	jmp LB_9710
LB_9709:
	bts r12,2
LB_9710:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_9715
	btr r12,8
	clc
	jmp LB_9716
LB_9715:
	bts r12,8
	stc
LB_9716:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9713
	btr r12,5
	jmp LB_9714
LB_9713:
	bts r12,5
LB_9714:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_9719
	btr r12,8
	clc
	jmp LB_9720
LB_9719:
	bts r12,8
	stc
LB_9720:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9717
	btr r12,6
	jmp LB_9718
LB_9717:
	bts r12,6
LB_9718:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9721:
	cmp r15,0
	jz LB_9722
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9721
LB_9722:
	jmp err
MTC_LB_9705:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,3
	jnz MTC_LB_9723
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ °3◂{ 2' 5' 6' }
; 3' ⊢ °3◂{ 2' 5' 6' }
	btr r12,7
	mov rax,r9
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9724
	bt QWORD [rdi],0
	jc LB_9725
	btr r12,7
	clc
	jmp LB_9726
LB_9725:
	bts r12,7
	stc
LB_9726:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9724:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_9729
	btr r12,8
	clc
	jmp LB_9730
LB_9729:
	bts r12,8
	stc
LB_9730:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9727
	btr r12,2
	jmp LB_9728
LB_9727:
	bts r12,2
LB_9728:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_9733
	btr r12,8
	clc
	jmp LB_9734
LB_9733:
	bts r12,8
	stc
LB_9734:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9731
	btr r12,5
	jmp LB_9732
LB_9731:
	bts r12,5
LB_9732:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_9737
	btr r12,8
	clc
	jmp LB_9738
LB_9737:
	bts r12,8
	stc
LB_9738:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9735
	btr r12,6
	jmp LB_9736
LB_9735:
	bts r12,6
LB_9736:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9739:
	cmp r15,0
	jz LB_9740
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9739
LB_9740:
	jmp err
MTC_LB_9723:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,4
	jnz MTC_LB_9741
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ °4◂{ 2' 5' 6' }
; 3' ⊢ °4◂{ 2' 5' 6' }
	btr r12,7
	mov rax,r9
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9742
	bt QWORD [rdi],0
	jc LB_9743
	btr r12,7
	clc
	jmp LB_9744
LB_9743:
	bts r12,7
	stc
LB_9744:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9742:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_9747
	btr r12,8
	clc
	jmp LB_9748
LB_9747:
	bts r12,8
	stc
LB_9748:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9745
	btr r12,2
	jmp LB_9746
LB_9745:
	bts r12,2
LB_9746:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_9751
	btr r12,8
	clc
	jmp LB_9752
LB_9751:
	bts r12,8
	stc
LB_9752:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9749
	btr r12,5
	jmp LB_9750
LB_9749:
	bts r12,5
LB_9750:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_9755
	btr r12,8
	clc
	jmp LB_9756
LB_9755:
	bts r12,8
	stc
LB_9756:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9753
	btr r12,6
	jmp LB_9754
LB_9753:
	bts r12,6
LB_9754:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9757:
	cmp r15,0
	jz LB_9758
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9757
LB_9758:
	jmp err
MTC_LB_9741:
MTC_LB_9598:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9759
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
	jnc LB_9760
	bt QWORD [rdi],0
	jc LB_9761
	btr r12,4
	clc
	jmp LB_9762
LB_9761:
	bts r12,4
	stc
LB_9762:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9760:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9763
	btr r12,3
	jmp LB_9764
LB_9763:
	bts r12,3
LB_9764:
LB_9765:
	cmp r15,0
	jz LB_9766
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9765
LB_9766:
	jmp err
MTC_LB_9759:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,2
	jnz MTC_LB_9767
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °2◂3'
; 2' ⊢ °2◂3'
	btr r12,4
	mov rax,r8
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_9768
	bt QWORD [rdi],0
	jc LB_9769
	btr r12,4
	clc
	jmp LB_9770
LB_9769:
	bts r12,4
	stc
LB_9770:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9768:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9771
	btr r12,3
	jmp LB_9772
LB_9771:
	bts r12,3
LB_9772:
LB_9773:
	cmp r15,0
	jz LB_9774
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9773
LB_9774:
	jmp err
MTC_LB_9767:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,3
	jnz MTC_LB_9775
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °3◂{  }
; 2' ⊢ °3◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_9776
	bt QWORD [rdi],0
	jc LB_9777
	btr r12,3
	clc
	jmp LB_9778
LB_9777:
	bts r12,3
	stc
LB_9778:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9776:
	mov r9,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9779:
	cmp r15,0
	jz LB_9780
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9779
LB_9780:
	jmp err
MTC_LB_9775:
NS_E_9813:
; 	|» { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
NS_E_RDI_9813:
; ∎ { %_9804 %_9805 %_9806 %_9807 %_9808 %_9809 %_9810 %_9811 }
 ; {>  %_9804~0':(_p0)◂(t3922'(-1)) %_9805~1':_r64 %_9812~8':t3891'(-1) %_9810~6':(_p0)◂(t3925'(-1)) %_9808~4':(_p0)◂(t3924'(-1)) %_9811~7':_r64 %_9809~5':_r64 %_9807~3':_r64 %_9806~2':(_p0)◂(t3923'(-1)) }
; 	∎ { 0' 1' 2' 3' 4' 5' 6' 7' }
	bt r12,8
	jc LB_9814
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_9814:
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	ret
NS_E_9803:
; 	|» 0'
NS_E_RDI_9803:
; » 0xrc8 |~ {  } ⊢ %_9782 : %_9782
 ; {>  %_9781~0':t3891'(-1) }
; 	» 0xrc8 _ ⊢ 1' : %_9782
	mov rdi,0xc8
	mov r14,rdi
	bts r12,1
; _f20 %_9782 ⊢ { %_9783 %_9784 } : { %_9783 %_9784 }
 ; {>  %_9782~1':_r64 %_9781~0':t3891'(-1) }
; _f20 1' ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9817
	btr r12,0
	jmp LB_9818
LB_9817:
	bts r12,0
LB_9818:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_9819
	btr r12,2
	jmp LB_9820
LB_9819:
	bts r12,2
LB_9820:
	mov r14,r13
	bt r12,0
	jc LB_9821
	btr r12,1
	jmp LB_9822
LB_9821:
	bts r12,1
LB_9822:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9815
	btr r12,0
	clc
	jmp LB_9816
LB_9815:
	bts r12,0
	stc
LB_9816:
	add rsp,16
; _f20 %_9783 ⊢ { %_9785 %_9786 } : { %_9785 %_9786 }
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9783~1':_r64 %_9781~0':t3891'(-1) }
; _f20 1' ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9827
	btr r12,0
	jmp LB_9828
LB_9827:
	bts r12,0
LB_9828:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_9829
	btr r12,3
	jmp LB_9830
LB_9829:
	bts r12,3
LB_9830:
	mov r14,r13
	bt r12,0
	jc LB_9831
	btr r12,1
	jmp LB_9832
LB_9831:
	bts r12,1
LB_9832:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9825
	btr r12,2
	clc
	jmp LB_9826
LB_9825:
	bts r12,2
	stc
LB_9826:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9823
	btr r12,0
	clc
	jmp LB_9824
LB_9823:
	bts r12,0
	stc
LB_9824:
	add rsp,24
; _f20 %_9785 ⊢ { %_9787 %_9788 } : { %_9787 %_9788 }
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9786~3':(_p0)◂(t3909'(0)) %_9781~0':t3891'(-1) %_9785~1':_r64 }
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
	jc LB_9839
	btr r12,0
	jmp LB_9840
LB_9839:
	bts r12,0
LB_9840:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 4' }
	mov r10,r14
	bt r12,1
	jc LB_9841
	btr r12,4
	jmp LB_9842
LB_9841:
	bts r12,4
LB_9842:
	mov r14,r13
	bt r12,0
	jc LB_9843
	btr r12,1
	jmp LB_9844
LB_9843:
	bts r12,1
LB_9844:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9837
	btr r12,3
	clc
	jmp LB_9838
LB_9837:
	bts r12,3
	stc
LB_9838:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9835
	btr r12,2
	clc
	jmp LB_9836
LB_9835:
	bts r12,2
	stc
LB_9836:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9833
	btr r12,0
	clc
	jmp LB_9834
LB_9833:
	bts r12,0
	stc
LB_9834:
	add rsp,32
; _f20 %_9787 ⊢ { %_9789 %_9790 } : { %_9789 %_9790 }
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9787~1':_r64 %_9786~3':(_p0)◂(t3909'(0)) %_9788~4':(_p0)◂(t3912'(0)) %_9781~0':t3891'(-1) }
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
	jc LB_9853
	btr r12,0
	jmp LB_9854
LB_9853:
	bts r12,0
LB_9854:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_9855
	btr r12,5
	jmp LB_9856
LB_9855:
	bts r12,5
LB_9856:
	mov r14,r13
	bt r12,0
	jc LB_9857
	btr r12,1
	jmp LB_9858
LB_9857:
	bts r12,1
LB_9858:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9851
	btr r12,4
	clc
	jmp LB_9852
LB_9851:
	bts r12,4
	stc
LB_9852:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9849
	btr r12,3
	clc
	jmp LB_9850
LB_9849:
	bts r12,3
	stc
LB_9850:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9847
	btr r12,2
	clc
	jmp LB_9848
LB_9847:
	bts r12,2
	stc
LB_9848:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9845
	btr r12,0
	clc
	jmp LB_9846
LB_9845:
	bts r12,0
	stc
LB_9846:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_9791 : %_9791
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9789~1':_r64 %_9790~5':(_p0)◂(t3915'(0)) %_9786~3':(_p0)◂(t3909'(0)) %_9788~4':(_p0)◂(t3912'(0)) %_9781~0':t3891'(-1) }
; 	» 0xr0 _ ⊢ 6' : %_9791
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; » 0xr0 |~ {  } ⊢ %_9792 : %_9792
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9789~1':_r64 %_9790~5':(_p0)◂(t3915'(0)) %_9786~3':(_p0)◂(t3909'(0)) %_9788~4':(_p0)◂(t3912'(0)) %_9781~0':t3891'(-1) %_9791~6':_r64 }
; 	» 0xr0 _ ⊢ 7' : %_9792
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; » 0xr0 |~ {  } ⊢ %_9793 : %_9793
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9789~1':_r64 %_9790~5':(_p0)◂(t3915'(0)) %_9792~7':_r64 %_9786~3':(_p0)◂(t3909'(0)) %_9788~4':(_p0)◂(t3912'(0)) %_9781~0':t3891'(-1) %_9791~6':_r64 }
; 	» 0xr0 _ ⊢ 8' : %_9793
	mov QWORD [st_vct+8*8],0x0
	bts r12,8
; » 0xr0 |~ {  } ⊢ %_9794 : %_9794
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9789~1':_r64 %_9790~5':(_p0)◂(t3915'(0)) %_9792~7':_r64 %_9786~3':(_p0)◂(t3909'(0)) %_9788~4':(_p0)◂(t3912'(0)) %_9793~8':_r64 %_9781~0':t3891'(-1) %_9791~6':_r64 }
; 	» 0xr0 _ ⊢ 9' : %_9794
	mov QWORD [st_vct+8*9],0x0
	bts r12,9
; _f9813 { %_9784 %_9791 %_9786 %_9792 %_9788 %_9793 %_9790 %_9794 %_9781 } ⊢ { %_9795 %_9796 %_9797 %_9798 %_9799 %_9800 %_9801 %_9802 } : { %_9795 %_9796 %_9797 %_9798 %_9799 %_9800 %_9801 %_9802 }
 ; {>  %_9784~2':(_p0)◂(t3906'(0)) %_9789~1':_r64 %_9790~5':(_p0)◂(t3915'(0)) %_9792~7':_r64 %_9786~3':(_p0)◂(t3909'(0)) %_9794~9':_r64 %_9788~4':(_p0)◂(t3912'(0)) %_9793~8':_r64 %_9781~0':t3891'(-1) %_9791~6':_r64 }
; _f9813 { 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10111111110.. |},{ 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
	mov r14,rcx
	bt r12,6
	jc LB_9861
	btr r12,1
	jmp LB_9862
LB_9861:
	bts r12,1
LB_9862:
	mov rcx,r11
	bt r12,5
	jc LB_9863
	btr r12,6
	jmp LB_9864
LB_9863:
	bts r12,6
LB_9864:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9865
	btr r12,5
	jmp LB_9866
LB_9865:
	bts r12,5
LB_9866:
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_9867
	btr r12,8
	jmp LB_9868
LB_9867:
	bts r12,8
LB_9868:
	mov r13,r8
	bt r12,2
	jc LB_9869
	btr r12,0
	jmp LB_9870
LB_9869:
	bts r12,0
LB_9870:
	mov r8,r9
	bt r12,3
	jc LB_9871
	btr r12,2
	jmp LB_9872
LB_9871:
	bts r12,2
LB_9872:
	mov r9,rdx
	bt r12,7
	jc LB_9873
	btr r12,3
	jmp LB_9874
LB_9873:
	bts r12,3
LB_9874:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_9875
	btr r12,7
	jmp LB_9876
LB_9875:
	bts r12,7
LB_9876:
	call NS_E_9813
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
	mov rdi,rdx
	mov QWORD [st_vct+8*8],rdi
	bt r12,7
	jc LB_9877
	btr r12,8
	jmp LB_9878
LB_9877:
	bts r12,8
LB_9878:
	mov rdx,rcx
	bt r12,6
	jc LB_9879
	btr r12,7
	jmp LB_9880
LB_9879:
	bts r12,7
LB_9880:
	mov rcx,r11
	bt r12,5
	jc LB_9881
	btr r12,6
	jmp LB_9882
LB_9881:
	bts r12,6
LB_9882:
	mov r11,r10
	bt r12,4
	jc LB_9883
	btr r12,5
	jmp LB_9884
LB_9883:
	bts r12,5
LB_9884:
	mov r10,r9
	bt r12,3
	jc LB_9885
	btr r12,4
	jmp LB_9886
LB_9885:
	bts r12,4
LB_9886:
	mov r9,r8
	bt r12,2
	jc LB_9887
	btr r12,3
	jmp LB_9888
LB_9887:
	bts r12,3
LB_9888:
	mov r8,r14
	bt r12,1
	jc LB_9889
	btr r12,2
	jmp LB_9890
LB_9889:
	bts r12,2
LB_9890:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9859
	btr r12,1
	clc
	jmp LB_9860
LB_9859:
	bts r12,1
	stc
LB_9860:
	add rsp,16
; ∎ { %_9795 %_9796 %_9797 %_9798 %_9799 %_9800 %_9801 %_9802 }
 ; {>  %_9795~0':t3926'(-1) %_9789~1':_r64 %_9800~6':t3931'(-1) %_9798~4':t3929'(-1) %_9799~5':t3930'(-1) %_9797~3':t3928'(-1) %_9802~8':t3933'(-1) %_9801~7':t3932'(-1) %_9796~2':t3927'(-1) }
; 	∎ { 0' 2' 3' 4' 5' 6' 7' 8' }
	bt r12,1
	jc LB_9891
	mov rdi,r14
	call dlt
LB_9891:
; _emt_mov_ptn_to_ptn:{| 1011111110.. |},{ 0' 2' 3' 4' 5' 6' 7' 8' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	mov r14,r8
	bt r12,2
	jc LB_9892
	btr r12,1
	jmp LB_9893
LB_9892:
	bts r12,1
LB_9893:
	mov r8,r9
	bt r12,3
	jc LB_9894
	btr r12,2
	jmp LB_9895
LB_9894:
	bts r12,2
LB_9895:
	mov r9,r10
	bt r12,4
	jc LB_9896
	btr r12,3
	jmp LB_9897
LB_9896:
	bts r12,3
LB_9897:
	mov r10,r11
	bt r12,5
	jc LB_9898
	btr r12,4
	jmp LB_9899
LB_9898:
	bts r12,4
LB_9899:
	mov r11,rcx
	bt r12,6
	jc LB_9900
	btr r12,5
	jmp LB_9901
LB_9900:
	bts r12,5
LB_9901:
	mov rcx,rdx
	bt r12,7
	jc LB_9902
	btr r12,6
	jmp LB_9903
LB_9902:
	bts r12,6
LB_9903:
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9904
	btr r12,7
	jmp LB_9905
LB_9904:
	bts r12,7
LB_9905:
	ret
NS_E_9951:
NS_E_RDI_9951:
; » _^ ..
	xor rax,rax
	add rax,8
	add rax,14
	add rax,12
	add rax,9
	add rax,8
	add rax,7
	add rax,9
	add rax,10
	add rax,9
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0\n"
	mov rsi,0x_0a_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; " \194\167\194\167 m1 = m2\n"
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
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+5],sil
	add rdi,14
; " \194\167 f0 = f1\n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; " \194\167\194\167 m3\n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \226\136\142\226\136\142\n"
	mov rsi,0x_0a_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	add rdi,8
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
; "\194\167\194\167 In0\n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167 C1 \194\171\n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\t\t\226\136\142 {}\n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
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
; » 0xr0 |~ {  } ⊢ %_9907 : %_9907
 ; {>  %_9906~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_9907
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_9908 : %_9908
 ; {>  %_9906~0':_stg %_9907~1':_r64 }
; 	» _args _ ⊢ 2' : %_9908
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
MTC_LB_9952:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9953
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
	jnc LB_9954
	bt QWORD [rdi],0
	jc LB_9955
	btr r12,5
	clc
	jmp LB_9956
LB_9955:
	bts r12,5
	stc
LB_9956:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9954:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9959
	btr r12,6
	clc
	jmp LB_9960
LB_9959:
	bts r12,6
	stc
LB_9960:
	mov r9,rcx
	bt r12,6
	jc LB_9957
	btr r12,3
	jmp LB_9958
LB_9957:
	bts r12,3
LB_9958:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9963
	btr r12,6
	clc
	jmp LB_9964
LB_9963:
	bts r12,6
	stc
LB_9964:
	mov r10,rcx
	bt r12,6
	jc LB_9961
	btr r12,4
	jmp LB_9962
LB_9961:
	bts r12,4
LB_9962:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9953
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
	jnc LB_9965
	bt QWORD [rdi],0
	jc LB_9966
	btr r12,7
	clc
	jmp LB_9967
LB_9966:
	bts r12,7
	stc
LB_9967:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9965:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_9970
	btr r12,8
	clc
	jmp LB_9971
LB_9970:
	bts r12,8
	stc
LB_9971:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9968
	btr r12,5
	jmp LB_9969
LB_9968:
	bts r12,5
LB_9969:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_9974
	btr r12,8
	clc
	jmp LB_9975
LB_9974:
	bts r12,8
	stc
LB_9975:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9972
	btr r12,6
	jmp LB_9973
LB_9972:
	bts r12,6
LB_9973:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9953
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
	jnc LB_9976
	bt QWORD [rdi],0
	jc LB_9977
	btr r12,7
	clc
	jmp LB_9978
LB_9977:
	bts r12,7
	stc
LB_9978:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9976:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9979:
	cmp r15,0
	jz LB_9980
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9979
LB_9980:
; _f37 %_9911 ⊢ { %_9913 %_9914 } : { %_9913 %_9914 }
 ; {>  %_9911~5':_stg %_9906~0':_stg %_9907~1':_r64 %_9909~3':_stg }
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
	jc LB_9987
	btr r12,0
	jmp LB_9988
LB_9987:
	bts r12,0
LB_9988:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_9989
	btr r12,2
	jmp LB_9990
LB_9989:
	bts r12,2
LB_9990:
	mov r10,r14
	bt r12,1
	jc LB_9991
	btr r12,4
	jmp LB_9992
LB_9991:
	bts r12,4
LB_9992:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9985
	btr r12,3
	clc
	jmp LB_9986
LB_9985:
	bts r12,3
	stc
LB_9986:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9983
	btr r12,1
	clc
	jmp LB_9984
LB_9983:
	bts r12,1
	stc
LB_9984:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9981
	btr r12,0
	clc
	jmp LB_9982
LB_9981:
	bts r12,0
	stc
LB_9982:
	add rsp,32
; _f4324 %_9914 ⊢ { %_9915 %_9916 } : { %_9915 %_9916 }
 ; {>  %_9914~4':_stg %_9906~0':_stg %_9913~2':_stg %_9907~1':_r64 %_9909~3':_stg }
; _f4324 4' ⊢ { 4' 5' }
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
	jc LB_10001
	btr r12,0
	jmp LB_10002
LB_10001:
	bts r12,0
LB_10002:
	call NS_E_4324
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_10003
	btr r12,4
	jmp LB_10004
LB_10003:
	bts r12,4
LB_10004:
	mov r11,r14
	bt r12,1
	jc LB_10005
	btr r12,5
	jmp LB_10006
LB_10005:
	bts r12,5
LB_10006:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9999
	btr r12,3
	clc
	jmp LB_10000
LB_9999:
	bts r12,3
	stc
LB_10000:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9997
	btr r12,2
	clc
	jmp LB_9998
LB_9997:
	bts r12,2
	stc
LB_9998:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9995
	btr r12,1
	clc
	jmp LB_9996
LB_9995:
	bts r12,1
	stc
LB_9996:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9993
	btr r12,0
	clc
	jmp LB_9994
LB_9993:
	bts r12,0
	stc
LB_9994:
	add rsp,40
MTC_LB_10007:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10008
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
	jnc LB_10009
	bt QWORD [rdi],0
	jc LB_10010
	btr r12,7
	clc
	jmp LB_10011
LB_10010:
	bts r12,7
	stc
LB_10011:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10009:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_10012
	btr r12,6
	jmp LB_10013
LB_10012:
	bts r12,6
LB_10013:
LB_10014:
	cmp r15,0
	jz LB_10015
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10014
LB_10015:
; » 0xr0 |~ {  } ⊢ %_9918 : %_9918
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9907~1':_r64 %_9917~6':_stg %_9909~3':_stg }
; 	» 0xr0 _ ⊢ 5' : %_9918
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f5452 { %_9917 %_9918 } ⊢ { %_9919 %_9920 %_9921 } : { %_9919 %_9920 %_9921 }
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9907~1':_r64 %_9918~5':_r64 %_9917~6':_stg %_9909~3':_stg }
; _f5452 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_10026
	btr r12,0
	jmp LB_10027
LB_10026:
	bts r12,0
LB_10027:
	mov r14,r11
	bt r12,5
	jc LB_10028
	btr r12,1
	jmp LB_10029
LB_10028:
	bts r12,1
LB_10029:
	call NS_E_5452
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_10030
	btr r12,5
	jmp LB_10031
LB_10030:
	bts r12,5
LB_10031:
	mov rcx,r14
	bt r12,1
	jc LB_10032
	btr r12,6
	jmp LB_10033
LB_10032:
	bts r12,6
LB_10033:
	mov rdx,r9
	bt r12,3
	jc LB_10036
	btr r12,7
	jmp LB_10037
LB_10036:
	bts r12,7
LB_10037:
	mov rsi,1
	bt r12,7
	jc LB_10034
	mov rsi,0
	bt rdx,0
	jc LB_10034
	jmp LB_10035
LB_10034:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_10035:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10024
	btr r12,4
	clc
	jmp LB_10025
LB_10024:
	bts r12,4
	stc
LB_10025:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10022
	btr r12,3
	clc
	jmp LB_10023
LB_10022:
	bts r12,3
	stc
LB_10023:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10020
	btr r12,2
	clc
	jmp LB_10021
LB_10020:
	bts r12,2
	stc
LB_10021:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10018
	btr r12,1
	clc
	jmp LB_10019
LB_10018:
	bts r12,1
	stc
LB_10019:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10016
	btr r12,0
	clc
	jmp LB_10017
LB_10016:
	bts r12,0
	stc
LB_10017:
	add rsp,48
MTC_LB_10038:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10039
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
	jnc LB_10040
	bt QWORD [rdi],0
	jc LB_10041
	btr r12,9
	clc
	jmp LB_10042
LB_10041:
	bts r12,9
	stc
LB_10042:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10040:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_10043
	btr r12,8
	jmp LB_10044
LB_10043:
	bts r12,8
LB_10044:
LB_10045:
	cmp r15,0
	jz LB_10046
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10045
LB_10046:
; » 0xr0 |~ {  } ⊢ %_9923 : %_9923
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9919~5':_stg %_9907~1':_r64 %_9922~8':(_lst)◂(_p1485) %_9920~6':_r64 %_9909~3':_stg }
; 	» 0xr0 _ ⊢ 7' : %_9923
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f2277 { %_9923 %_9922 } ⊢ { %_9924 %_9925 } : { %_9924 %_9925 }
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9919~5':_stg %_9907~1':_r64 %_9922~8':(_lst)◂(_p1485) %_9920~6':_r64 %_9909~3':_stg %_9923~7':_r64 }
; _f2277 { 7' 8' } ⊢ { 7' 8' }
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
	jc LB_10061
	btr r12,0
	jmp LB_10062
LB_10061:
	bts r12,0
LB_10062:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10063
	btr r12,1
	jmp LB_10064
LB_10063:
	bts r12,1
LB_10064:
	call NS_E_2277
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_10065
	btr r12,7
	jmp LB_10066
LB_10065:
	bts r12,7
LB_10066:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_10067
	btr r12,8
	jmp LB_10068
LB_10067:
	bts r12,8
LB_10068:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_10059
	btr r12,6
	clc
	jmp LB_10060
LB_10059:
	bts r12,6
	stc
LB_10060:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10057
	btr r12,5
	clc
	jmp LB_10058
LB_10057:
	bts r12,5
	stc
LB_10058:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10055
	btr r12,4
	clc
	jmp LB_10056
LB_10055:
	bts r12,4
	stc
LB_10056:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10053
	btr r12,3
	clc
	jmp LB_10054
LB_10053:
	bts r12,3
	stc
LB_10054:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10051
	btr r12,2
	clc
	jmp LB_10052
LB_10051:
	bts r12,2
	stc
LB_10052:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10049
	btr r12,1
	clc
	jmp LB_10050
LB_10049:
	bts r12,1
	stc
LB_10050:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10047
	btr r12,0
	clc
	jmp LB_10048
LB_10047:
	bts r12,0
	stc
LB_10048:
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
; _f38 %_9927 ⊢ %_9928 : %_9928
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9919~5':_stg %_9907~1':_r64 %_9920~6':_r64 %_9909~3':_stg %_9924~7':_r64 %_9927~9':_stg %_9926~8':_stg }
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
	jc LB_10087
	btr r12,0
	jmp LB_10088
LB_10087:
	bts r12,0
LB_10088:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_10089
	btr r12,9
	jmp LB_10090
LB_10089:
	bts r12,9
LB_10090:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_10085
	btr r12,8
	clc
	jmp LB_10086
LB_10085:
	bts r12,8
	stc
LB_10086:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_10083
	btr r12,7
	clc
	jmp LB_10084
LB_10083:
	bts r12,7
	stc
LB_10084:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_10081
	btr r12,6
	clc
	jmp LB_10082
LB_10081:
	bts r12,6
	stc
LB_10082:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10079
	btr r12,5
	clc
	jmp LB_10080
LB_10079:
	bts r12,5
	stc
LB_10080:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10077
	btr r12,4
	clc
	jmp LB_10078
LB_10077:
	bts r12,4
	stc
LB_10078:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10075
	btr r12,3
	clc
	jmp LB_10076
LB_10075:
	bts r12,3
	stc
LB_10076:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10073
	btr r12,2
	clc
	jmp LB_10074
LB_10073:
	bts r12,2
	stc
LB_10074:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10071
	btr r12,1
	clc
	jmp LB_10072
LB_10071:
	bts r12,1
	stc
LB_10072:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10069
	btr r12,0
	clc
	jmp LB_10070
LB_10069:
	bts r12,0
	stc
LB_10070:
	add rsp,80
; ∎ {  }
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9919~5':_stg %_9907~1':_r64 %_9920~6':_r64 %_9909~3':_stg %_9924~7':_r64 %_9926~8':_stg %_9928~9':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_10091
	mov rdi,r10
	call dlt
LB_10091:
	bt r12,0
	jc LB_10092
	mov rdi,r13
	call dlt
LB_10092:
	bt r12,2
	jc LB_10093
	mov rdi,r8
	call dlt
LB_10093:
	bt r12,5
	jc LB_10094
	mov rdi,r11
	call dlt
LB_10094:
	bt r12,1
	jc LB_10095
	mov rdi,r14
	call dlt
LB_10095:
	bt r12,6
	jc LB_10096
	mov rdi,rcx
	call dlt
LB_10096:
	bt r12,3
	jc LB_10097
	mov rdi,r9
	call dlt
LB_10097:
	bt r12,7
	jc LB_10098
	mov rdi,rdx
	call dlt
LB_10098:
	bt r12,8
	jc LB_10099
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_10099:
	bt r12,9
	jc LB_10100
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_10100:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10039:
	mov r15,0
LB_10102:
	cmp r15,0
	jz LB_10103
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10102
LB_10103:
; 	» "H0\n" _ ⊢ 8' : %_9929
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_9929 ⊢ %_9930 : %_9930
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9919~5':_stg %_9907~1':_r64 %_9920~6':_r64 %_9929~8':_stg %_9909~3':_stg %_9921~7':(_opn)◂((_lst)◂(_p1485)) }
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
	jc LB_10120
	btr r12,0
	jmp LB_10121
LB_10120:
	bts r12,0
LB_10121:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_10122
	btr r12,8
	jmp LB_10123
LB_10122:
	bts r12,8
LB_10123:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_10118
	btr r12,7
	clc
	jmp LB_10119
LB_10118:
	bts r12,7
	stc
LB_10119:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_10116
	btr r12,6
	clc
	jmp LB_10117
LB_10116:
	bts r12,6
	stc
LB_10117:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10114
	btr r12,5
	clc
	jmp LB_10115
LB_10114:
	bts r12,5
	stc
LB_10115:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10112
	btr r12,4
	clc
	jmp LB_10113
LB_10112:
	bts r12,4
	stc
LB_10113:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10110
	btr r12,3
	clc
	jmp LB_10111
LB_10110:
	bts r12,3
	stc
LB_10111:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10108
	btr r12,2
	clc
	jmp LB_10109
LB_10108:
	bts r12,2
	stc
LB_10109:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10106
	btr r12,1
	clc
	jmp LB_10107
LB_10106:
	bts r12,1
	stc
LB_10107:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10104
	btr r12,0
	clc
	jmp LB_10105
LB_10104:
	bts r12,0
	stc
LB_10105:
	add rsp,72
; ∎ {  }
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9919~5':_stg %_9907~1':_r64 %_9920~6':_r64 %_9909~3':_stg %_9921~7':(_opn)◂((_lst)◂(_p1485)) %_9930~8':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_10124
	mov rdi,r10
	call dlt
LB_10124:
	bt r12,0
	jc LB_10125
	mov rdi,r13
	call dlt
LB_10125:
	bt r12,2
	jc LB_10126
	mov rdi,r8
	call dlt
LB_10126:
	bt r12,5
	jc LB_10127
	mov rdi,r11
	call dlt
LB_10127:
	bt r12,1
	jc LB_10128
	mov rdi,r14
	call dlt
LB_10128:
	bt r12,6
	jc LB_10129
	mov rdi,rcx
	call dlt
LB_10129:
	bt r12,3
	jc LB_10130
	mov rdi,r9
	call dlt
LB_10130:
	bt r12,7
	jc LB_10131
	mov rdi,rdx
	call dlt
LB_10131:
	bt r12,8
	jc LB_10132
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_10132:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10101:
MTC_LB_10008:
	mov r15,0
LB_10134:
	cmp r15,0
	jz LB_10135
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10134
LB_10135:
; 	» "H1\n" _ ⊢ 6' : %_9931
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_9931 ⊢ %_9932 : %_9932
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9907~1':_r64 %_9931~6':_stg %_9909~3':_stg %_9916~5':(_opn)◂(_stg) }
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
	jc LB_10148
	btr r12,0
	jmp LB_10149
LB_10148:
	bts r12,0
LB_10149:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_10150
	btr r12,6
	jmp LB_10151
LB_10150:
	bts r12,6
LB_10151:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10146
	btr r12,5
	clc
	jmp LB_10147
LB_10146:
	bts r12,5
	stc
LB_10147:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10144
	btr r12,4
	clc
	jmp LB_10145
LB_10144:
	bts r12,4
	stc
LB_10145:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10142
	btr r12,3
	clc
	jmp LB_10143
LB_10142:
	bts r12,3
	stc
LB_10143:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10140
	btr r12,2
	clc
	jmp LB_10141
LB_10140:
	bts r12,2
	stc
LB_10141:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10138
	btr r12,1
	clc
	jmp LB_10139
LB_10138:
	bts r12,1
	stc
LB_10139:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10136
	btr r12,0
	clc
	jmp LB_10137
LB_10136:
	bts r12,0
	stc
LB_10137:
	add rsp,56
; ∎ {  }
 ; {>  %_9915~4':_stg %_9906~0':_stg %_9913~2':_stg %_9907~1':_r64 %_9932~6':_stg %_9909~3':_stg %_9916~5':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,4
	jc LB_10152
	mov rdi,r10
	call dlt
LB_10152:
	bt r12,0
	jc LB_10153
	mov rdi,r13
	call dlt
LB_10153:
	bt r12,2
	jc LB_10154
	mov rdi,r8
	call dlt
LB_10154:
	bt r12,1
	jc LB_10155
	mov rdi,r14
	call dlt
LB_10155:
	bt r12,6
	jc LB_10156
	mov rdi,rcx
	call dlt
LB_10156:
	bt r12,3
	jc LB_10157
	mov rdi,r9
	call dlt
LB_10157:
	bt r12,5
	jc LB_10158
	mov rdi,r11
	call dlt
LB_10158:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10133:
MTC_LB_9953:
	mov r15,0
LB_10160:
	cmp r15,0
	jz LB_10161
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10160
LB_10161:
; _f5452 { %_9906 %_9907 } ⊢ { %_9933 %_9934 %_9935 } : { %_9933 %_9934 %_9935 }
 ; {>  %_9908~2':(_lst)◂(_stg) %_9906~0':_stg %_9907~1':_r64 }
; _f5452 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_5452
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_10164
	btr r12,4
	jmp LB_10165
LB_10164:
	bts r12,4
LB_10165:
	mov r9,r10
	bt r12,4
	jc LB_10168
	btr r12,3
	jmp LB_10169
LB_10168:
	bts r12,3
LB_10169:
	mov rsi,1
	bt r12,3
	jc LB_10166
	mov rsi,0
	bt r9,0
	jc LB_10166
	jmp LB_10167
LB_10166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10167:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10162
	btr r12,2
	clc
	jmp LB_10163
LB_10162:
	bts r12,2
	stc
LB_10163:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_9936
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_9936 ⊢ { %_9937 %_9938 } : { %_9937 %_9938 }
 ; {>  %_9908~2':(_lst)◂(_stg) %_9936~4':_stg %_9934~1':_r64 %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg }
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
	jc LB_10178
	btr r12,0
	jmp LB_10179
LB_10178:
	bts r12,0
LB_10179:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_10180
	btr r12,4
	jmp LB_10181
LB_10180:
	bts r12,4
LB_10181:
	mov r11,r14
	bt r12,1
	jc LB_10182
	btr r12,5
	jmp LB_10183
LB_10182:
	bts r12,5
LB_10183:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10176
	btr r12,3
	clc
	jmp LB_10177
LB_10176:
	bts r12,3
	stc
LB_10177:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10174
	btr r12,2
	clc
	jmp LB_10175
LB_10174:
	bts r12,2
	stc
LB_10175:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10172
	btr r12,1
	clc
	jmp LB_10173
LB_10172:
	bts r12,1
	stc
LB_10173:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10170
	btr r12,0
	clc
	jmp LB_10171
LB_10170:
	bts r12,0
	stc
LB_10171:
	add rsp,40
; _f38 { %_9937 %_9938 } ⊢ { %_9939 %_9940 } : { %_9939 %_9940 }
 ; {>  %_9908~2':(_lst)◂(_stg) %_9938~5':_stg %_9934~1':_r64 %_9937~4':_stg %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg }
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
	jc LB_10194
	btr r12,1
	jmp LB_10195
LB_10194:
	bts r12,1
LB_10195:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_10192
	btr QWORD [rdi],0
	jmp LB_10193
LB_10192:
	bts QWORD [rdi],0
LB_10193:
	mov r14,r11
	bt r12,5
	jc LB_10198
	btr r12,1
	jmp LB_10199
LB_10198:
	bts r12,1
LB_10199:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_10196
	btr QWORD [rdi],1
	jmp LB_10197
LB_10196:
	bts QWORD [rdi],1
LB_10197:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_10202
	btr r12,1
	clc
	jmp LB_10203
LB_10202:
	bts r12,1
	stc
LB_10203:
	mov r10,r14
	bt r12,1
	jc LB_10200
	btr r12,4
	jmp LB_10201
LB_10200:
	bts r12,4
LB_10201:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_10206
	btr r12,1
	clc
	jmp LB_10207
LB_10206:
	bts r12,1
	stc
LB_10207:
	mov r11,r14
	bt r12,1
	jc LB_10204
	btr r12,5
	jmp LB_10205
LB_10204:
	bts r12,5
LB_10205:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10190
	btr r12,3
	clc
	jmp LB_10191
LB_10190:
	bts r12,3
	stc
LB_10191:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10188
	btr r12,2
	clc
	jmp LB_10189
LB_10188:
	bts r12,2
	stc
LB_10189:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10186
	btr r12,1
	clc
	jmp LB_10187
LB_10186:
	bts r12,1
	stc
LB_10187:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10184
	btr r12,0
	clc
	jmp LB_10185
LB_10184:
	bts r12,0
	stc
LB_10185:
	add rsp,40
; _f4324 %_9940 ⊢ { %_9941 %_9942 } : { %_9941 %_9942 }
 ; {>  %_9908~2':(_lst)◂(_stg) %_9934~1':_r64 %_9940~5':_stg %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg %_9939~4':_stg }
; _f4324 5' ⊢ { 5' 6' }
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
	jc LB_10218
	btr r12,0
	jmp LB_10219
LB_10218:
	bts r12,0
LB_10219:
	call NS_E_4324
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_10220
	btr r12,5
	jmp LB_10221
LB_10220:
	bts r12,5
LB_10221:
	mov rcx,r14
	bt r12,1
	jc LB_10222
	btr r12,6
	jmp LB_10223
LB_10222:
	bts r12,6
LB_10223:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10216
	btr r12,4
	clc
	jmp LB_10217
LB_10216:
	bts r12,4
	stc
LB_10217:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10214
	btr r12,3
	clc
	jmp LB_10215
LB_10214:
	bts r12,3
	stc
LB_10215:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10212
	btr r12,2
	clc
	jmp LB_10213
LB_10212:
	bts r12,2
	stc
LB_10213:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10210
	btr r12,1
	clc
	jmp LB_10211
LB_10210:
	bts r12,1
	stc
LB_10211:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10208
	btr r12,0
	clc
	jmp LB_10209
LB_10208:
	bts r12,0
	stc
LB_10209:
	add rsp,48
MTC_LB_10224:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10225
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
	jnc LB_10226
	bt QWORD [rdi],0
	jc LB_10227
	btr r12,8
	clc
	jmp LB_10228
LB_10227:
	bts r12,8
	stc
LB_10228:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10226:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10229
	btr r12,7
	jmp LB_10230
LB_10229:
	bts r12,7
LB_10230:
LB_10231:
	cmp r15,0
	jz LB_10232
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10231
LB_10232:
; » 0xr0 |~ {  } ⊢ %_9944 : %_9944
 ; {>  %_9908~2':(_lst)◂(_stg) %_9934~1':_r64 %_9941~5':_stg %_9943~7':_stg %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg %_9939~4':_stg }
; 	» 0xr0 _ ⊢ 6' : %_9944
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f5452 { %_9943 %_9944 } ⊢ { %_9945 %_9946 %_9947 } : { %_9945 %_9946 %_9947 }
 ; {>  %_9944~6':_r64 %_9908~2':(_lst)◂(_stg) %_9934~1':_r64 %_9941~5':_stg %_9943~7':_stg %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg %_9939~4':_stg }
; _f5452 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_10245
	btr r12,0
	jmp LB_10246
LB_10245:
	bts r12,0
LB_10246:
	mov r14,rcx
	bt r12,6
	jc LB_10247
	btr r12,1
	jmp LB_10248
LB_10247:
	bts r12,1
LB_10248:
	call NS_E_5452
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_10249
	btr r12,6
	jmp LB_10250
LB_10249:
	bts r12,6
LB_10250:
	mov rdx,r14
	bt r12,1
	jc LB_10251
	btr r12,7
	jmp LB_10252
LB_10251:
	bts r12,7
LB_10252:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_10255
	btr r12,8
	jmp LB_10256
LB_10255:
	bts r12,8
LB_10256:
	mov rsi,1
	bt r12,8
	jc LB_10253
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_10253
	jmp LB_10254
LB_10253:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_10254:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10243
	btr r12,5
	clc
	jmp LB_10244
LB_10243:
	bts r12,5
	stc
LB_10244:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10241
	btr r12,4
	clc
	jmp LB_10242
LB_10241:
	bts r12,4
	stc
LB_10242:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10239
	btr r12,3
	clc
	jmp LB_10240
LB_10239:
	bts r12,3
	stc
LB_10240:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10237
	btr r12,2
	clc
	jmp LB_10238
LB_10237:
	bts r12,2
	stc
LB_10238:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10235
	btr r12,1
	clc
	jmp LB_10236
LB_10235:
	bts r12,1
	stc
LB_10236:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10233
	btr r12,0
	clc
	jmp LB_10234
LB_10233:
	bts r12,0
	stc
LB_10234:
	add rsp,56
; _f38 { %_9945 %_9946 %_9947 } ⊢ { %_9948 %_9949 %_9950 } : { %_9948 %_9949 %_9950 }
 ; {>  %_9908~2':(_lst)◂(_stg) %_9947~8':(_opn)◂((_lst)◂(_p1485)) %_9945~6':_stg %_9934~1':_r64 %_9941~5':_stg %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg %_9946~7':_r64 %_9939~4':_stg }
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
	jc LB_10271
	btr r12,1
	jmp LB_10272
LB_10271:
	bts r12,1
LB_10272:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_10269
	btr QWORD [rdi],0
	jmp LB_10270
LB_10269:
	bts QWORD [rdi],0
LB_10270:
	mov r14,rdx
	bt r12,7
	jc LB_10275
	btr r12,1
	jmp LB_10276
LB_10275:
	bts r12,1
LB_10276:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_10273
	btr QWORD [rdi],1
	jmp LB_10274
LB_10273:
	bts QWORD [rdi],1
LB_10274:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10279
	btr r12,1
	jmp LB_10280
LB_10279:
	bts r12,1
LB_10280:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,1
	jc LB_10277
	btr QWORD [rdi],2
	jmp LB_10278
LB_10277:
	bts QWORD [rdi],2
LB_10278:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_10283
	btr r12,1
	clc
	jmp LB_10284
LB_10283:
	bts r12,1
	stc
LB_10284:
	mov rcx,r14
	bt r12,1
	jc LB_10281
	btr r12,6
	jmp LB_10282
LB_10281:
	bts r12,6
LB_10282:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_10287
	btr r12,1
	clc
	jmp LB_10288
LB_10287:
	bts r12,1
	stc
LB_10288:
	mov rdx,r14
	bt r12,1
	jc LB_10285
	btr r12,7
	jmp LB_10286
LB_10285:
	bts r12,7
LB_10286:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_10291
	btr r12,1
	clc
	jmp LB_10292
LB_10291:
	bts r12,1
	stc
LB_10292:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_10289
	btr r12,8
	jmp LB_10290
LB_10289:
	bts r12,8
LB_10290:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10267
	btr r12,5
	clc
	jmp LB_10268
LB_10267:
	bts r12,5
	stc
LB_10268:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10265
	btr r12,4
	clc
	jmp LB_10266
LB_10265:
	bts r12,4
	stc
LB_10266:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10263
	btr r12,3
	clc
	jmp LB_10264
LB_10263:
	bts r12,3
	stc
LB_10264:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10261
	btr r12,2
	clc
	jmp LB_10262
LB_10261:
	bts r12,2
	stc
LB_10262:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10259
	btr r12,1
	clc
	jmp LB_10260
LB_10259:
	bts r12,1
	stc
LB_10260:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10257
	btr r12,0
	clc
	jmp LB_10258
LB_10257:
	bts r12,0
	stc
LB_10258:
	add rsp,56
; ∎ {  }
 ; {>  %_9908~2':(_lst)◂(_stg) %_9934~1':_r64 %_9948~6':_stg %_9941~5':_stg %_9949~7':_r64 %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg %_9950~8':(_opn)◂((_lst)◂(_p1485)) %_9939~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_10293
	mov rdi,r8
	call dlt
LB_10293:
	bt r12,1
	jc LB_10294
	mov rdi,r14
	call dlt
LB_10294:
	bt r12,6
	jc LB_10295
	mov rdi,rcx
	call dlt
LB_10295:
	bt r12,5
	jc LB_10296
	mov rdi,r11
	call dlt
LB_10296:
	bt r12,7
	jc LB_10297
	mov rdi,rdx
	call dlt
LB_10297:
	bt r12,3
	jc LB_10298
	mov rdi,r9
	call dlt
LB_10298:
	bt r12,0
	jc LB_10299
	mov rdi,r13
	call dlt
LB_10299:
	bt r12,8
	jc LB_10300
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_10300:
	bt r12,4
	jc LB_10301
	mov rdi,r10
	call dlt
LB_10301:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10225:
	mov r15,0
LB_10303:
	cmp r15,0
	jz LB_10304
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10303
LB_10304:
; ∎ {  }
 ; {>  %_9908~2':(_lst)◂(_stg) %_9934~1':_r64 %_9941~5':_stg %_9942~6':(_opn)◂(_stg) %_9935~3':(_opn)◂((_lst)◂(_p1485)) %_9933~0':_stg %_9939~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_10305
	mov rdi,r8
	call dlt
LB_10305:
	bt r12,1
	jc LB_10306
	mov rdi,r14
	call dlt
LB_10306:
	bt r12,5
	jc LB_10307
	mov rdi,r11
	call dlt
LB_10307:
	bt r12,6
	jc LB_10308
	mov rdi,rcx
	call dlt
LB_10308:
	bt r12,3
	jc LB_10309
	mov rdi,r9
	call dlt
LB_10309:
	bt r12,0
	jc LB_10310
	mov rdi,r13
	call dlt
LB_10310:
	bt r12,4
	jc LB_10311
	mov rdi,r10
	call dlt
LB_10311:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10302:
MTC_LB_10159:
NS_E_10333:
NS_E_RDI_10333:
; 	» "{ x   y z }" _ ⊢ 0' : %_10312
	mov rdi,11
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_79_20_20_20_78_20_7b
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_7d_20_7a
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_10313 : %_10313
 ; {>  %_10312~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_10313
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f4840 { %_10312 %_10313 } ⊢ { %_10314 %_10315 %_10316 } : { %_10314 %_10315 %_10316 }
 ; {>  %_10313~1':_r64 %_10312~0':_stg }
; _f4840 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4840
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_10334
	btr r12,4
	jmp LB_10335
LB_10334:
	bts r12,4
LB_10335:
	mov r8,r9
	bt r12,3
	jc LB_10338
	btr r12,2
	jmp LB_10339
LB_10338:
	bts r12,2
LB_10339:
	mov rsi,1
	bt r12,2
	jc LB_10336
	mov rsi,0
	bt r8,0
	jc LB_10336
	jmp LB_10337
LB_10336:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10337:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 %_10316 ⊢ %_10317 : %_10317
 ; {>  %_10314~0':_stg %_10316~2':(_opn)◂((_p1439)◂((_p1447)◂(_stg))) %_10315~1':_r64 }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10344
	btr r12,0
	jmp LB_10345
LB_10344:
	bts r12,0
LB_10345:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10346
	btr r12,2
	jmp LB_10347
LB_10346:
	bts r12,2
LB_10347:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10342
	btr r12,1
	clc
	jmp LB_10343
LB_10342:
	bts r12,1
	stc
LB_10343:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10340
	btr r12,0
	clc
	jmp LB_10341
LB_10340:
	bts r12,0
	stc
LB_10341:
	add rsp,24
MTC_LB_10348:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10349
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
	jnc LB_10350
	bt QWORD [rdi],0
	jc LB_10351
	btr r12,4
	clc
	jmp LB_10352
LB_10351:
	bts r12,4
	stc
LB_10352:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10350:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10353
	btr r12,3
	jmp LB_10354
LB_10353:
	bts r12,3
LB_10354:
LB_10355:
	cmp r15,0
	jz LB_10356
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10355
LB_10356:
; » 0xr0 |~ {  } ⊢ %_10319 : %_10319
 ; {>  %_10314~0':_stg %_10315~1':_r64 %_10318~3':(_p1439)◂((_p1447)◂(_stg)) }
; 	» 0xr0 _ ⊢ 2' : %_10319
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _nil {  } ⊢ %_10320 : %_10320
 ; {>  %_10314~0':_stg %_10319~2':_r64 %_10315~1':_r64 %_10318~3':(_p1439)◂((_p1447)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _f9179 { %_10319 %_10320 %_10318 } ⊢ { %_10321 %_10322 %_10323 } : { %_10321 %_10322 %_10323 }
 ; {>  %_10314~0':_stg %_10319~2':_r64 %_10320~°1◂{  }:(_lst)◂(t4089'(0)) %_10315~1':_r64 %_10318~3':(_p1439)◂((_p1447)◂(_stg)) }
; _f9179 { 2' °1◂{  } 3' } ⊢ { 2' 3' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},{ 2' °1◂{  } 3' } ⊢ { 0' 1' 2' }
	mov r13,r8
	bt r12,2
	jc LB_10361
	btr r12,0
	jmp LB_10362
LB_10361:
	bts r12,0
LB_10362:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_10363
	mov rsi,0
	bt r14,0
	jc LB_10363
	jmp LB_10364
LB_10363:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10364:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov r8,r9
	bt r12,3
	jc LB_10365
	btr r12,2
	jmp LB_10366
LB_10365:
	bts r12,2
LB_10366:
	call NS_E_9179
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 3' 4' }
	mov r9,r14
	bt r12,1
	jc LB_10367
	btr r12,3
	jmp LB_10368
LB_10367:
	bts r12,3
LB_10368:
	mov r10,r8
	bt r12,2
	jc LB_10369
	btr r12,4
	jmp LB_10370
LB_10369:
	bts r12,4
LB_10370:
	mov r8,r13
	bt r12,0
	jc LB_10371
	btr r12,2
	jmp LB_10372
LB_10371:
	bts r12,2
LB_10372:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10359
	btr r12,1
	clc
	jmp LB_10360
LB_10359:
	bts r12,1
	stc
LB_10360:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10357
	btr r12,0
	clc
	jmp LB_10358
LB_10357:
	bts r12,0
	stc
LB_10358:
	add rsp,24
; _f38 %_10323 ⊢ %_10324 : %_10324
 ; {>  %_10314~0':_stg %_10323~4':(_p1439)◂((_p1447)◂(_r64)) %_10322~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10321~2':_r64 %_10315~1':_r64 }
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
	jc LB_10381
	btr r12,0
	jmp LB_10382
LB_10381:
	bts r12,0
LB_10382:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_10383
	btr r12,4
	jmp LB_10384
LB_10383:
	bts r12,4
LB_10384:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10379
	btr r12,3
	clc
	jmp LB_10380
LB_10379:
	bts r12,3
	stc
LB_10380:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10377
	btr r12,2
	clc
	jmp LB_10378
LB_10377:
	bts r12,2
	stc
LB_10378:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10375
	btr r12,1
	clc
	jmp LB_10376
LB_10375:
	bts r12,1
	stc
LB_10376:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10373
	btr r12,0
	clc
	jmp LB_10374
LB_10373:
	bts r12,0
	stc
LB_10374:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_10325 : %_10325
 ; {>  %_10314~0':_stg %_10322~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10324~4':(_p1439)◂((_p1447)◂(_r64)) %_10321~2':_r64 %_10315~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_10325
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f4579 { %_10314 %_10325 } ⊢ { %_10326 %_10327 %_10328 } : { %_10326 %_10327 %_10328 }
 ; {>  %_10314~0':_stg %_10322~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10324~4':(_p1439)◂((_p1447)◂(_r64)) %_10321~2':_r64 %_10325~5':_r64 %_10315~1':_r64 }
; _f4579 { 0' 5' } ⊢ { 0' 5' 6' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_10393
	btr r12,1
	jmp LB_10394
LB_10393:
	bts r12,1
LB_10394:
	call NS_E_4579
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 5' 6' }
	mov r11,r14
	bt r12,1
	jc LB_10395
	btr r12,5
	jmp LB_10396
LB_10395:
	bts r12,5
LB_10396:
	mov rcx,r9
	bt r12,3
	jc LB_10399
	btr r12,6
	jmp LB_10400
LB_10399:
	bts r12,6
LB_10400:
	mov rsi,1
	bt r12,6
	jc LB_10397
	mov rsi,0
	bt rcx,0
	jc LB_10397
	jmp LB_10398
LB_10397:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_10398:
	mov rax,r8
	shl rax,56
	or rax,1
	or rcx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_10391
	btr r12,4
	clc
	jmp LB_10392
LB_10391:
	bts r12,4
	stc
LB_10392:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10389
	btr r12,3
	clc
	jmp LB_10390
LB_10389:
	bts r12,3
	stc
LB_10390:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10387
	btr r12,2
	clc
	jmp LB_10388
LB_10387:
	bts r12,2
	stc
LB_10388:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10385
	btr r12,1
	clc
	jmp LB_10386
LB_10385:
	bts r12,1
	stc
LB_10386:
	add rsp,40
MTC_LB_10401:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10402
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
	jnc LB_10403
	bt QWORD [rdi],0
	jc LB_10404
	btr r12,8
	clc
	jmp LB_10405
LB_10404:
	bts r12,8
	stc
LB_10405:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10403:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10406
	btr r12,7
	jmp LB_10407
LB_10406:
	bts r12,7
LB_10407:
LB_10408:
	cmp r15,0
	jz LB_10409
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10408
LB_10409:
; _f9422 { %_10322 %_10329 } ⊢ { %_10330 %_10331 } : { %_10330 %_10331 }
 ; {>  %_10322~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10326~0':_stg %_10324~4':(_p1439)◂((_p1447)◂(_r64)) %_10321~2':_r64 %_10329~7':(_p1439)◂((_p1446)◂(_stg)) %_10327~5':_r64 %_10315~1':_r64 }
; _f9422 { 3' 7' } ⊢ { 3' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000100010.. |},{ 3' 7' } ⊢ { 0' 1' }
	mov r13,r9
	bt r12,3
	jc LB_10420
	btr r12,0
	jmp LB_10421
LB_10420:
	bts r12,0
LB_10421:
	mov r14,rdx
	bt r12,7
	jc LB_10422
	btr r12,1
	jmp LB_10423
LB_10422:
	bts r12,1
LB_10423:
	call NS_E_9422
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 6' }
	mov r9,r13
	bt r12,0
	jc LB_10424
	btr r12,3
	jmp LB_10425
LB_10424:
	bts r12,3
LB_10425:
	mov rcx,r14
	bt r12,1
	jc LB_10426
	btr r12,6
	jmp LB_10427
LB_10426:
	bts r12,6
LB_10427:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_10418
	btr r12,5
	clc
	jmp LB_10419
LB_10418:
	bts r12,5
	stc
LB_10419:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_10416
	btr r12,4
	clc
	jmp LB_10417
LB_10416:
	bts r12,4
	stc
LB_10417:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10414
	btr r12,2
	clc
	jmp LB_10415
LB_10414:
	bts r12,2
	stc
LB_10415:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10412
	btr r12,1
	clc
	jmp LB_10413
LB_10412:
	bts r12,1
	stc
LB_10413:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10410
	btr r12,0
	clc
	jmp LB_10411
LB_10410:
	bts r12,0
	stc
LB_10411:
	add rsp,48
; _f38 %_10331 ⊢ %_10332 : %_10332
 ; {>  %_10331~6':(_p1439)◂((_p1446)◂(_r64)) %_10330~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10326~0':_stg %_10324~4':(_p1439)◂((_p1447)◂(_r64)) %_10321~2':_r64 %_10327~5':_r64 %_10315~1':_r64 }
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
	jc LB_10440
	btr r12,0
	jmp LB_10441
LB_10440:
	bts r12,0
LB_10441:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_10442
	btr r12,6
	jmp LB_10443
LB_10442:
	bts r12,6
LB_10443:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10438
	btr r12,5
	clc
	jmp LB_10439
LB_10438:
	bts r12,5
	stc
LB_10439:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10436
	btr r12,4
	clc
	jmp LB_10437
LB_10436:
	bts r12,4
	stc
LB_10437:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10434
	btr r12,3
	clc
	jmp LB_10435
LB_10434:
	bts r12,3
	stc
LB_10435:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10432
	btr r12,2
	clc
	jmp LB_10433
LB_10432:
	bts r12,2
	stc
LB_10433:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10430
	btr r12,1
	clc
	jmp LB_10431
LB_10430:
	bts r12,1
	stc
LB_10431:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10428
	btr r12,0
	clc
	jmp LB_10429
LB_10428:
	bts r12,0
	stc
LB_10429:
	add rsp,56
; ∎ {  }
 ; {>  %_10330~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10326~0':_stg %_10332~6':(_p1439)◂((_p1446)◂(_r64)) %_10324~4':(_p1439)◂((_p1447)◂(_r64)) %_10321~2':_r64 %_10327~5':_r64 %_10315~1':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_10444
	mov rdi,r9
	call dlt
LB_10444:
	bt r12,0
	jc LB_10445
	mov rdi,r13
	call dlt
LB_10445:
	bt r12,6
	jc LB_10446
	mov rdi,rcx
	call dlt
LB_10446:
	bt r12,4
	jc LB_10447
	mov rdi,r10
	call dlt
LB_10447:
	bt r12,2
	jc LB_10448
	mov rdi,r8
	call dlt
LB_10448:
	bt r12,5
	jc LB_10449
	mov rdi,r11
	call dlt
LB_10449:
	bt r12,1
	jc LB_10450
	mov rdi,r14
	call dlt
LB_10450:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10402:
	mov r15,0
LB_10452:
	cmp r15,0
	jz LB_10453
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10452
LB_10453:
	jmp err
MTC_LB_10451:
MTC_LB_10349:
	mov r15,0
LB_10455:
	cmp r15,0
	jz LB_10456
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10455
LB_10456:
	jmp err
MTC_LB_10454:
section .data
	CST_DYN_9951:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_10333:
		dq 0x0000_0001_00_82_ffff
		dq 1
