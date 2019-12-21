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
	call NS_E_9745
	call NS_E_10128
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
NS_E_560:
NS_E_RDI_560:
NS_E_560_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_561
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_561:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_563:
NS_E_RDI_563:
NS_E_563_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_563_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_563_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_564:
NS_E_RDI_564:
NS_E_564_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_564_LB_0
	cmp r11,57
	ja NS_E_564_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_564_LB_0:
	mov rax,0
	ret
NS_E_566:
NS_E_RDI_566:
NS_E_566_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_566_LB_0
	cmp r11,122
	ja NS_E_566_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_566_LB_0:
	mov rax,0
	ret
NS_E_565:
NS_E_RDI_565:
NS_E_565_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_565_LB_0
	cmp r11,90
	ja NS_E_565_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_565_LB_0:
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
	jc LB_572
	bt QWORD [rdi],17
	jnc LB_572
	bt QWORD [rdi],0
	jc LB_574
	btr r12,2
	clc
	jmp LB_575
LB_574:
	bts r12,2
	stc
LB_575:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_573
LB_572:
	btr r12,2
	clc
	call dcp
LB_573:
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
	jc LB_568
	bt QWORD [rdi],17
	jnc LB_568
	bt QWORD [rdi],0
	jc LB_570
	btr r12,2
	clc
	jmp LB_571
LB_570:
	bts r12,2
	stc
LB_571:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_569
LB_568:
	btr r12,2
	clc
	call dcp
LB_569:
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
	jc LB_567
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_567:
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
NS_E_562:
NS_E_RDI_562:
NS_E_562_ETR_TBL:
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
	jz NS_E_562_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_562_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_582:
; 	|» { 0' 1' }
NS_E_RDI_582:
MTC_LB_583:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_584
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
	jnc LB_585
	bt QWORD [rdi],0
	jc LB_586
	btr r12,2
	clc
	jmp LB_587
LB_586:
	bts r12,2
	stc
LB_587:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_585:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_588:
	cmp r15,0
	jz LB_589
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_588
LB_589:
; ∎ %_576
 ; {>  %_576~0':(_lst)◂(t108'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_584:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_590
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
	jnc LB_591
	bt QWORD [rdi],0
	jc LB_592
	btr r12,4
	clc
	jmp LB_593
LB_592:
	bts r12,4
	stc
LB_593:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_591:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_596
	btr r12,5
	clc
	jmp LB_597
LB_596:
	bts r12,5
	stc
LB_597:
	mov r8,r11
	bt r12,5
	jc LB_594
	btr r12,2
	jmp LB_595
LB_594:
	bts r12,2
LB_595:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_600
	btr r12,5
	clc
	jmp LB_601
LB_600:
	bts r12,5
	stc
LB_601:
	mov r9,r11
	bt r12,5
	jc LB_598
	btr r12,3
	jmp LB_599
LB_598:
	bts r12,3
LB_599:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_602:
	cmp r15,0
	jz LB_603
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_602
LB_603:
; _cns { %_578 %_576 } ⊢ %_580 : %_580
 ; {>  %_578~2':t108'(-1) %_576~0':(_lst)◂(t108'(-1)) %_579~3':(_lst)◂(t108'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f582 { %_580 %_579 } ⊢ %_581 : %_581
 ; {>  %_580~°0◂{ 2' 0' }:(_lst)◂(t108'(-1)) %_579~3':(_lst)◂(t108'(-1)) }
; _f582 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_604
	btr r12,1
	jmp LB_605
LB_604:
	bts r12,1
LB_605:
	mov r9,r13
	bt r12,0
	jc LB_606
	btr r12,3
	jmp LB_607
LB_606:
	bts r12,3
LB_607:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_612
	btr r12,4
	jmp LB_613
LB_612:
	bts r12,4
LB_613:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_610
	btr QWORD [rdi],0
	jmp LB_611
LB_610:
	bts QWORD [rdi],0
LB_611:
	mov r10,r9
	bt r12,3
	jc LB_616
	btr r12,4
	jmp LB_617
LB_616:
	bts r12,4
LB_617:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_614
	btr QWORD [rdi],1
	jmp LB_615
LB_614:
	bts QWORD [rdi],1
LB_615:
	mov rsi,1
	bt r12,0
	jc LB_608
	mov rsi,0
	bt r13,0
	jc LB_608
	jmp LB_609
LB_608:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_609:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_581
 ; {>  %_581~0':(_lst)◂(t108'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_590:
NS_E_621:
; 	|» 0'
NS_E_RDI_621:
; _nil {  } ⊢ %_619 : %_619
 ; {>  %_618~0':(_lst)◂(t129'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f582 { %_619 %_618 } ⊢ %_620 : %_620
 ; {>  %_619~°1◂{  }:(_lst)◂(t126'(0)) %_618~0':(_lst)◂(t129'(-1)) }
; _f582 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_622
	btr r12,1
	jmp LB_623
LB_622:
	bts r12,1
LB_623:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_624
	mov rsi,0
	bt r13,0
	jc LB_624
	jmp LB_625
LB_624:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_625:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_620
 ; {>  %_620~0':(_lst)◂(t129'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_639:
; 	|» { 0' 1' }
NS_E_RDI_639:
MTC_LB_640:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_641
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
	jnc LB_642
	bt QWORD [rdi],0
	jc LB_643
	btr r12,4
	clc
	jmp LB_644
LB_643:
	bts r12,4
	stc
LB_644:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_642:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_647
	btr r12,5
	clc
	jmp LB_648
LB_647:
	bts r12,5
	stc
LB_648:
	mov r8,r11
	bt r12,5
	jc LB_645
	btr r12,2
	jmp LB_646
LB_645:
	bts r12,2
LB_646:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_651
	btr r12,5
	clc
	jmp LB_652
LB_651:
	bts r12,5
	stc
LB_652:
	mov r9,r11
	bt r12,5
	jc LB_649
	btr r12,3
	jmp LB_650
LB_649:
	bts r12,3
LB_650:
	mov rdi,r10
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
; _f56 %_626 ⊢ %_630 : %_630
 ; {>  %_629~3':(_lst)◂(_r64) %_626~0':_r64 %_628~2':_r64 }
	add r13,1
; _f639 { %_630 %_629 } ⊢ { %_631 %_632 } : { %_631 %_632 }
 ; {>  %_629~3':(_lst)◂(_r64) %_630~0':_r64 %_628~2':_r64 }
; _f639 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_657
	btr r12,1
	jmp LB_658
LB_657:
	bts r12,1
LB_658:
	call NS_E_639
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_655
	btr r12,2
	clc
	jmp LB_656
LB_655:
	bts r12,2
	stc
LB_656:
	add rsp,16
; _f55 %_631 ⊢ %_633 : %_633
 ; {>  %_632~1':_stg %_628~2':_r64 %_631~0':_r64 }
	sub r13,1
; _f33 { %_632 %_633 %_628 } ⊢ { %_634 %_635 %_636 } : { %_634 %_635 %_636 }
 ; {>  %_633~0':_r64 %_632~1':_stg %_628~2':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_659
	btr r12,3
	jmp LB_660
LB_659:
	bts r12,3
LB_660:
	mov r14,r13
	bt r12,0
	jc LB_661
	btr r12,1
	jmp LB_662
LB_661:
	bts r12,1
LB_662:
	mov r13,r9
	bt r12,3
	jc LB_663
	btr r12,0
	jmp LB_664
LB_663:
	bts r12,0
LB_664:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_635 %_634 }
 ; {>  %_636~2':_r64 %_635~1':_r64 %_634~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_665
	mov rdi,r8
	call dlt
LB_665:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_666
	btr r12,2
	jmp LB_667
LB_666:
	bts r12,2
LB_667:
	mov r14,r13
	bt r12,0
	jc LB_668
	btr r12,1
	jmp LB_669
LB_668:
	bts r12,1
LB_669:
	mov r13,r8
	bt r12,2
	jc LB_670
	btr r12,0
	jmp LB_671
LB_670:
	bts r12,0
LB_671:
	ret
MTC_LB_641:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_672
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
	jnc LB_673
	bt QWORD [rdi],0
	jc LB_674
	btr r12,2
	clc
	jmp LB_675
LB_674:
	bts r12,2
	stc
LB_675:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_673:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_676:
	cmp r15,0
	jz LB_677
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_676
LB_677:
; _f31 %_626 ⊢ { %_637 %_638 } : { %_637 %_638 }
 ; {>  %_626~0':_r64 }
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
; ∎ { %_637 %_638 }
 ; {>  %_638~1':_stg %_637~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_672:
NS_E_682:
; 	|» 0'
NS_E_RDI_682:
; » 0xr0 |~ {  } ⊢ %_679 : %_679
 ; {>  %_678~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_679
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f639 { %_679 %_678 } ⊢ { %_680 %_681 } : { %_680 %_681 }
 ; {>  %_678~0':(_lst)◂(_r64) %_679~1':_r64 }
; _f639 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_683
	btr r12,2
	jmp LB_684
LB_683:
	bts r12,2
LB_684:
	mov r14,r13
	bt r12,0
	jc LB_685
	btr r12,1
	jmp LB_686
LB_685:
	bts r12,1
LB_686:
	mov r13,r8
	bt r12,2
	jc LB_687
	btr r12,0
	jmp LB_688
LB_687:
	bts r12,0
LB_688:
	call NS_E_639
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_681
 ; {>  %_681~1':_stg %_680~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_689
	mov rdi,r13
	call dlt
LB_689:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_690
	btr r12,0
	jmp LB_691
LB_690:
	bts r12,0
LB_691:
	ret
NS_E_710:
; 	|» { 0' 1' }
NS_E_RDI_710:
MTC_LB_711:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_712
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
	jnc LB_713
	bt QWORD [rdi],0
	jc LB_714
	btr r12,5
	clc
	jmp LB_715
LB_714:
	bts r12,5
	stc
LB_715:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_713:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_724
	btr r12,6
	clc
	jmp LB_725
LB_724:
	bts r12,6
	stc
LB_725:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_718
	btr r12,4
	clc
	jmp LB_719
LB_718:
	bts r12,4
	stc
LB_719:
	mov r8,r10
	bt r12,4
	jc LB_716
	btr r12,2
	jmp LB_717
LB_716:
	bts r12,2
LB_717:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_722
	btr r12,4
	clc
	jmp LB_723
LB_722:
	bts r12,4
	stc
LB_723:
	mov r9,r10
	bt r12,4
	jc LB_720
	btr r12,3
	jmp LB_721
LB_720:
	bts r12,3
LB_721:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_728
	btr r12,6
	clc
	jmp LB_729
LB_728:
	bts r12,6
	stc
LB_729:
	mov r10,rcx
	bt r12,6
	jc LB_726
	btr r12,4
	jmp LB_727
LB_726:
	bts r12,4
LB_727:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_730:
	cmp r15,0
	jz LB_731
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_730
LB_731:
MTC_LB_732:
	mov r15,0
	mov rdi,r14
	mov rsi,r8
	bt r12,1
	call eq
	jnz MTC_LB_733
LB_734:
	cmp r15,0
	jz LB_735
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_734
LB_735:
MTC_LB_736:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_737
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
	jnc LB_738
	bt QWORD [rdi],0
	jc LB_739
	btr r12,5
	clc
	jmp LB_740
LB_739:
	bts r12,5
	stc
LB_740:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_738:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_741
	btr r12,0
	jmp LB_742
LB_741:
	bts r12,0
LB_742:
LB_743:
	cmp r15,0
	jz LB_744
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_743
LB_744:
; _emt_mov_ptn_to_ptn:{| 111010.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_745
	btr r12,3
	jmp LB_746
LB_745:
	bts r12,3
LB_746:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_755
	btr r12,5
	clc
	jmp LB_756
LB_755:
	bts r12,5
	stc
LB_756:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_753
	btr r12,4
	clc
	jmp LB_754
LB_753:
	bts r12,4
	stc
LB_754:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_751
	btr r12,3
	clc
	jmp LB_752
LB_751:
	bts r12,3
	stc
LB_752:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_749
	btr r12,2
	clc
	jmp LB_750
LB_749:
	bts r12,2
	stc
LB_750:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_747
	btr r12,1
	clc
	jmp LB_748
LB_747:
	bts r12,1
	stc
LB_748:
	add rsp,40
; _some %_698 ⊢ %_700 : %_700
 ; {>  %_694~2':t202'(-1) %_698~3':t210'(-1) %_696~4':(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_699~5':t210'(-1) %_693~1':t202'(-1) }
; _some 3' ⊢ °0◂3'
; _cns { { %_694 %_700 } %_696 } ⊢ %_701 : %_701
 ; {>  %_694~2':t202'(-1) %_696~4':(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_700~°0◂3':(_opn)◂(t210'(-1)) %_699~5':t210'(-1) %_693~1':t202'(-1) }
; _cns { { 2' °0◂3' } 4' } ⊢ °0◂{ { 2' °0◂3' } 4' }
; _some %_699 ⊢ %_702 : %_702
 ; {>  %_701~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_699~5':t210'(-1) %_693~1':t202'(-1) }
; _some 5' ⊢ °0◂5'
; ∎ { %_701 %_693 %_702 }
 ; {>  %_701~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_702~°0◂5':(_opn)◂(t210'(-1)) %_693~1':t202'(-1) }
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
	jc LB_763
	btr r12,7
	jmp LB_764
LB_763:
	bts r12,7
LB_764:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_761
	btr QWORD [rdi],0
	jmp LB_762
LB_761:
	bts QWORD [rdi],0
LB_762:
	mov rdx,r9
	bt r12,3
	jc LB_769
	btr r12,7
	jmp LB_770
LB_769:
	bts r12,7
LB_770:
	mov rsi,1
	bt r12,7
	jc LB_767
	mov rsi,0
	bt rdx,0
	jc LB_767
	jmp LB_768
LB_767:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_768:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_765
	btr QWORD [rdi],1
	jmp LB_766
LB_765:
	bts QWORD [rdi],1
LB_766:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_759
	btr QWORD [rdi],0
	jmp LB_760
LB_759:
	bts QWORD [rdi],0
LB_760:
	mov rcx,r10
	bt r12,4
	jc LB_773
	btr r12,6
	jmp LB_774
LB_773:
	bts r12,6
LB_774:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_771
	btr QWORD [rdi],1
	jmp LB_772
LB_771:
	bts QWORD [rdi],1
LB_772:
	mov rsi,1
	bt r12,0
	jc LB_757
	mov rsi,0
	bt r13,0
	jc LB_757
	jmp LB_758
LB_757:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_758:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov r8,r11
	bt r12,5
	jc LB_777
	btr r12,2
	jmp LB_778
LB_777:
	bts r12,2
LB_778:
	mov rsi,1
	bt r12,2
	jc LB_775
	mov rsi,0
	bt r8,0
	jc LB_775
	jmp LB_776
LB_775:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_776:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_737:
	mov r15,0
LB_780:
	cmp r15,0
	jz LB_781
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_780
LB_781:
; _cns { { %_694 %_695 } %_696 } ⊢ %_703 : %_703
 ; {>  %_694~2':t202'(-1) %_695~3':(_opn)◂(t210'(-1)) %_696~4':(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_693~1':t202'(-1) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _none {  } ⊢ %_704 : %_704
 ; {>  %_703~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_693~1':t202'(-1) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_703 %_693 %_704 }
 ; {>  %_704~°1◂{  }:(_opn)◂(t196'(0)) %_703~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_693~1':t202'(-1) }
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
	jc LB_788
	btr r12,6
	jmp LB_789
LB_788:
	bts r12,6
LB_789:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_786
	btr QWORD [rdi],0
	jmp LB_787
LB_786:
	bts QWORD [rdi],0
LB_787:
	mov rcx,r9
	bt r12,3
	jc LB_792
	btr r12,6
	jmp LB_793
LB_792:
	bts r12,6
LB_793:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_790
	btr QWORD [rdi],1
	jmp LB_791
LB_790:
	bts QWORD [rdi],1
LB_791:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_784
	btr QWORD [rdi],0
	jmp LB_785
LB_784:
	bts QWORD [rdi],0
LB_785:
	mov r11,r10
	bt r12,4
	jc LB_796
	btr r12,5
	jmp LB_797
LB_796:
	bts r12,5
LB_797:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_794
	btr QWORD [rdi],1
	jmp LB_795
LB_794:
	bts QWORD [rdi],1
LB_795:
	mov rsi,1
	bt r12,0
	jc LB_782
	mov rsi,0
	bt r13,0
	jc LB_782
	jmp LB_783
LB_782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_783:
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
	jc LB_798
	mov rsi,0
	bt r8,0
	jc LB_798
	jmp LB_799
LB_798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_799:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_779:
MTC_LB_733:
	mov r15,0
LB_801:
	cmp r15,0
	jz LB_802
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_801
LB_802:
; _f710 { %_696 %_693 } ⊢ { %_705 %_706 %_707 } : { %_705 %_706 %_707 }
 ; {>  %_694~2':t202'(-1) %_695~3':(_opn)◂(t210'(-1)) %_696~4':(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_693~1':t202'(-1) }
; _f710 { 4' 1' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010010.. |},{ 4' 1' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,4
	jc LB_807
	btr r12,0
	jmp LB_808
LB_807:
	bts r12,0
LB_808:
	call NS_E_710
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_809
	btr r12,4
	jmp LB_810
LB_809:
	bts r12,4
LB_810:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_805
	btr r12,3
	clc
	jmp LB_806
LB_805:
	bts r12,3
	stc
LB_806:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_803
	btr r12,2
	clc
	jmp LB_804
LB_803:
	bts r12,2
	stc
LB_804:
	add rsp,24
; _cns { { %_694 %_695 } %_705 } ⊢ %_708 : %_708
 ; {>  %_706~1':t202'(-1) %_694~2':t202'(-1) %_695~3':(_opn)◂(t210'(-1)) %_707~4':(_opn)◂(t210'(-1)) %_705~0':(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) }
; _cns { { 2' 3' } 0' } ⊢ °0◂{ { 2' 3' } 0' }
; ∎ { %_708 %_706 %_707 }
 ; {>  %_706~1':t202'(-1) %_708~°0◂{ { 2' 3' } 0' }:(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_707~4':(_opn)◂(t210'(-1)) }
; 	∎ { °0◂{ { 2' 3' } 0' } 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ °0◂{ { 2' 3' } 0' } 1' 4' } ⊢ { 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_811
	btr r12,5
	jmp LB_812
LB_811:
	bts r12,5
LB_812:
	mov r8,r10
	bt r12,4
	jc LB_813
	btr r12,2
	jmp LB_814
LB_813:
	bts r12,2
LB_814:
	mov r10,r13
	bt r12,0
	jc LB_815
	btr r12,4
	jmp LB_816
LB_815:
	bts r12,4
LB_816:
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
	jc LB_823
	btr r12,7
	jmp LB_824
LB_823:
	bts r12,7
LB_824:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_821
	btr QWORD [rdi],0
	jmp LB_822
LB_821:
	bts QWORD [rdi],0
LB_822:
	mov rdx,r9
	bt r12,3
	jc LB_827
	btr r12,7
	jmp LB_828
LB_827:
	bts r12,7
LB_828:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_825
	btr QWORD [rdi],1
	jmp LB_826
LB_825:
	bts QWORD [rdi],1
LB_826:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_819
	btr QWORD [rdi],0
	jmp LB_820
LB_819:
	bts QWORD [rdi],0
LB_820:
	mov rcx,r10
	bt r12,4
	jc LB_831
	btr r12,6
	jmp LB_832
LB_831:
	bts r12,6
LB_832:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_829
	btr QWORD [rdi],1
	jmp LB_830
LB_829:
	bts QWORD [rdi],1
LB_830:
	mov rsi,1
	bt r12,0
	jc LB_817
	mov rsi,0
	bt r13,0
	jc LB_817
	jmp LB_818
LB_817:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_818:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_800:
MTC_LB_712:
	mov r15,0
LB_834:
	cmp r15,0
	jz LB_835
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_834
LB_835:
; _none {  } ⊢ %_709 : %_709
 ; {>  %_692~0':(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_693~1':t202'(-1) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_692 %_693 %_709 }
 ; {>  %_709~°1◂{  }:(_opn)◂(t207'(0)) %_692~0':(_lst)◂({ t202'(-1) (_opn)◂(t210'(-1)) }) %_693~1':t202'(-1) }
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
	jc LB_836
	mov rsi,0
	bt r8,0
	jc LB_836
	jmp LB_837
LB_836:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_837:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_833:
NS_E_838:
NS_E_RDI_838:
NS_E_838_ETR_TBL:
NS_E_838_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_879
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_879
	jmp LB_880
LB_879:
	jmp LB_869
LB_880:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_839_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_884
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_885
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_885:
	jmp LB_869
LB_884:
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
	jc LB_872
	btr r12,1
	clc
	jmp LB_873
LB_872:
	bts r12,1
	stc
LB_873:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_870
	btr r12,0
	clc
	jmp LB_871
LB_870:
	bts r12,0
	stc
LB_871:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_866
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_887
	btr r12,5
	jmp LB_888
LB_887:
	bts r12,5
LB_888:
	mov r13,r14
	bt r12,1
	jc LB_889
	btr r12,0
	jmp LB_890
LB_889:
	bts r12,0
LB_890:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f682 %_841 ⊢ %_842 : %_842
 ; {>  %_841~0':(_lst)◂(_r64) }
; _f682 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_682
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_842 ⊢ %_843 : %_843
 ; {>  %_842~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_843
 ; {>  %_843~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_864
	btr r12,3
	jmp LB_865
LB_864:
	bts r12,3
LB_865:
	mov r8,0
	bts r12,2
	ret
LB_866:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_868
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_867
LB_868:
	add rsp,8
	ret
LB_869:
	add rsp,32
	pop r14
LB_867:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_839:
NS_E_RDI_839:
NS_E_839_ETR_TBL:
NS_E_839_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_916
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_916
	jmp LB_917
LB_916:
	jmp LB_904
LB_917:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_921
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_922
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_922:
	jmp LB_904
LB_921:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_839_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_927
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_928
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_928:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_929
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_929:
	jmp LB_904
LB_927:
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
	jc LB_909
	btr r12,2
	clc
	jmp LB_910
LB_909:
	bts r12,2
	stc
LB_910:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_907
	btr r12,1
	clc
	jmp LB_908
LB_907:
	bts r12,1
	stc
LB_908:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_905
	btr r12,0
	clc
	jmp LB_906
LB_905:
	bts r12,0
	stc
LB_906:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_901
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov rcx,r14
	bt r12,1
	jc LB_931
	btr r12,6
	jmp LB_932
LB_931:
	bts r12,6
LB_932:
	mov r14,r8
	bt r12,2
	jc LB_933
	btr r12,1
	jmp LB_934
LB_933:
	bts r12,1
LB_934:
	mov r8,r13
	bt r12,0
	jc LB_935
	btr r12,2
	jmp LB_936
LB_935:
	bts r12,2
LB_936:
	mov r13,rcx
	bt r12,6
	jc LB_937
	btr r12,0
	jmp LB_938
LB_937:
	bts r12,0
LB_938:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _cns { %_844 %_845 } ⊢ %_846 : %_846
 ; {>  %_844~0':_r64 %_845~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_846 ⊢ %_847 : %_847
 ; {>  %_846~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_847
 ; {>  %_847~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_895
	btr r12,2
	jmp LB_896
LB_895:
	bts r12,2
LB_896:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_893
	btr QWORD [rdi],0
	jmp LB_894
LB_893:
	bts QWORD [rdi],0
LB_894:
	mov r8,r14
	bt r12,1
	jc LB_899
	btr r12,2
	jmp LB_900
LB_899:
	bts r12,2
LB_900:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_897
	btr QWORD [rdi],1
	jmp LB_898
LB_897:
	bts QWORD [rdi],1
LB_898:
	mov rsi,1
	bt r12,3
	jc LB_891
	mov rsi,0
	bt r9,0
	jc LB_891
	jmp LB_892
LB_891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_892:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_901:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_903
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_902
LB_903:
	add rsp,8
	ret
LB_904:
	add rsp,48
	pop r14
LB_902:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_952
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_952
	jmp LB_953
LB_952:
	jmp LB_944
LB_953:
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
	jc LB_945
	btr r12,0
	clc
	jmp LB_946
LB_945:
	bts r12,0
	stc
LB_946:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_941
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_848 : %_848
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_848 ⊢ %_849 : %_849
 ; {>  %_848~°1◂{  }:(_lst)◂(t259'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_849
 ; {>  %_849~°0◂°1◂{  }:(_opn)◂((_lst)◂(t262'(0))) }
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
	jc LB_939
	mov rsi,0
	bt r9,0
	jc LB_939
	jmp LB_940
LB_939:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_940:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_941:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_943
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_942
LB_943:
	add rsp,8
	ret
LB_944:
	add rsp,16
	pop r14
LB_942:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_975
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_967
LB_975:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_839_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_980
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_981
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_981:
	jmp LB_967
LB_980:
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
	jc LB_970
	btr r12,1
	clc
	jmp LB_971
LB_970:
	bts r12,1
	stc
LB_971:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_968
	btr r12,0
	clc
	jmp LB_969
LB_968:
	bts r12,0
	stc
LB_969:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_964
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_850 %_851 } ⊢ %_852 : %_852
 ; {>  %_850~0':_r64 %_851~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_852 ⊢ %_853 : %_853
 ; {>  %_852~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_853
 ; {>  %_853~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_958
	btr r12,2
	jmp LB_959
LB_958:
	bts r12,2
LB_959:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_956
	btr QWORD [rdi],0
	jmp LB_957
LB_956:
	bts QWORD [rdi],0
LB_957:
	mov r8,r14
	bt r12,1
	jc LB_962
	btr r12,2
	jmp LB_963
LB_962:
	bts r12,2
LB_963:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_960
	btr QWORD [rdi],1
	jmp LB_961
LB_960:
	bts QWORD [rdi],1
LB_961:
	mov rsi,1
	bt r12,3
	jc LB_954
	mov rsi,0
	bt r9,0
	jc LB_954
	jmp LB_955
LB_954:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_955:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_964:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_966
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_965
LB_966:
	add rsp,8
	ret
LB_967:
	add rsp,32
	pop r14
LB_965:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_840:
NS_E_RDI_840:
NS_E_840_ETR_TBL:
NS_E_840_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_996
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_996
	jmp LB_997
LB_996:
	jmp LB_988
LB_997:
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
	jc LB_989
	btr r12,0
	clc
	jmp LB_990
LB_989:
	bts r12,0
	stc
LB_990:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_985
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr5c |~ {  } ⊢ %_854 : %_854
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_854
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_854 ⊢ %_855 : %_855
 ; {>  %_854~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_855
 ; {>  %_855~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_983
	btr r12,3
	jmp LB_984
LB_983:
	bts r12,3
LB_984:
	mov r8,0
	bts r12,2
	ret
LB_985:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_987
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_986
LB_987:
	add rsp,8
	ret
LB_988:
	add rsp,16
	pop r14
LB_986:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1011
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_1011
	jmp LB_1012
LB_1011:
	jmp LB_1003
LB_1012:
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
	jc LB_1004
	btr r12,0
	clc
	jmp LB_1005
LB_1004:
	bts r12,0
	stc
LB_1005:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1000
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr22 |~ {  } ⊢ %_856 : %_856
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_856
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_856 ⊢ %_857 : %_857
 ; {>  %_856~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_857
 ; {>  %_857~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_998
	btr r12,3
	jmp LB_999
LB_998:
	bts r12,3
LB_999:
	mov r8,0
	bts r12,2
	ret
LB_1000:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1002
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1001
LB_1002:
	add rsp,8
	ret
LB_1003:
	add rsp,16
	pop r14
LB_1001:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_1026
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_1026
	jmp LB_1027
LB_1026:
	jmp LB_1018
LB_1027:
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
	jc LB_1019
	btr r12,0
	clc
	jmp LB_1020
LB_1019:
	bts r12,0
	stc
LB_1020:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1015
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xra |~ {  } ⊢ %_858 : %_858
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_858
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_858 ⊢ %_859 : %_859
 ; {>  %_858~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_859
 ; {>  %_859~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1013
	btr r12,3
	jmp LB_1014
LB_1013:
	bts r12,3
LB_1014:
	mov r8,0
	bts r12,2
	ret
LB_1015:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1017
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1016
LB_1017:
	add rsp,8
	ret
LB_1018:
	add rsp,16
	pop r14
LB_1016:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_1041
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_1041
	jmp LB_1042
LB_1041:
	jmp LB_1033
LB_1042:
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
	jc LB_1034
	btr r12,0
	clc
	jmp LB_1035
LB_1034:
	bts r12,0
	stc
LB_1035:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1030
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr9 |~ {  } ⊢ %_860 : %_860
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_860
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_860 ⊢ %_861 : %_861
 ; {>  %_860~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_861
 ; {>  %_861~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1028
	btr r12,3
	jmp LB_1029
LB_1028:
	bts r12,3
LB_1029:
	mov r8,0
	bts r12,2
	ret
LB_1030:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1032
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1031
LB_1032:
	add rsp,8
	ret
LB_1033:
	add rsp,16
	pop r14
LB_1031:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_1056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_1056
	jmp LB_1057
LB_1056:
	jmp LB_1048
LB_1057:
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
	jc LB_1049
	btr r12,0
	clc
	jmp LB_1050
LB_1049:
	bts r12,0
	stc
LB_1050:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1045
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_862 : %_862
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_862
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_862 ⊢ %_863 : %_863
 ; {>  %_862~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_863
 ; {>  %_863~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1043
	btr r12,3
	jmp LB_1044
LB_1043:
	bts r12,3
LB_1044:
	mov r8,0
	bts r12,2
	ret
LB_1045:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1047
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1046
LB_1047:
	add rsp,8
	ret
LB_1048:
	add rsp,16
	pop r14
LB_1046:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1058:
NS_E_RDI_1058:
NS_E_1058_ETR_TBL:
NS_E_1058_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1097
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1091
LB_1097:
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
	jc LB_1092
	btr r12,0
	clc
	jmp LB_1093
LB_1092:
	bts r12,0
	stc
LB_1093:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1088
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr30 |~ {  } ⊢ %_1060 : %_1060
 ; {>  %_1059~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_1060
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_1061 : %_1061
 ; {>  %_1059~0':_r64 %_1060~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_1061
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_1059 %_1060 } ⊢ { %_1062 %_1063 %_1064 } : { %_1062 %_1063 %_1064 }
 ; {>  %_1059~0':_r64 %_1060~1':_r64 %_1061~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1061 %_1062 } ⊢ { %_1065 %_1066 %_1067 } : { %_1065 %_1066 %_1067 }
 ; {>  %_1062~0':_r64 %_1064~3':_r64 %_1063~1':_r64 %_1061~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1070:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1071
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1071
LB_1072:
	cmp r15,0
	jz LB_1073
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1072
LB_1073:
; _some %_1066 ⊢ %_1068 : %_1068
 ; {>  %_1065~2':_r64 %_1066~0':_r64 %_1064~3':_r64 %_1063~1':_r64 %_1067~4':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1068
 ; {>  %_1065~2':_r64 %_1068~°0◂0':(_opn)◂(_r64) %_1064~3':_r64 %_1063~1':_r64 %_1067~4':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1074
	mov rdi,r8
	call dlt
LB_1074:
	bt r12,3
	jc LB_1075
	mov rdi,r9
	call dlt
LB_1075:
	bt r12,1
	jc LB_1076
	mov rdi,r14
	call dlt
LB_1076:
	bt r12,4
	jc LB_1077
	mov rdi,r10
	call dlt
LB_1077:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1078
	btr r12,3
	jmp LB_1079
LB_1078:
	bts r12,3
LB_1079:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1071:
	mov r15,0
LB_1081:
	cmp r15,0
	jz LB_1082
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1081
LB_1082:
; _none {  } ⊢ %_1069 : %_1069
 ; {>  %_1065~2':_r64 %_1066~0':_r64 %_1064~3':_r64 %_1063~1':_r64 %_1067~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1069
 ; {>  %_1065~2':_r64 %_1066~0':_r64 %_1064~3':_r64 %_1063~1':_r64 %_1069~°1◂{  }:(_opn)◂(t338'(0)) %_1067~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_1083
	mov rdi,r8
	call dlt
LB_1083:
	bt r12,0
	jc LB_1084
	mov rdi,r13
	call dlt
LB_1084:
	bt r12,3
	jc LB_1085
	mov rdi,r9
	call dlt
LB_1085:
	bt r12,1
	jc LB_1086
	mov rdi,r14
	call dlt
LB_1086:
	bt r12,4
	jc LB_1087
	mov rdi,r10
	call dlt
LB_1087:
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
MTC_LB_1080:
LB_1088:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1090
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1089
LB_1090:
	add rsp,8
	ret
LB_1091:
	add rsp,16
	pop r14
LB_1089:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1099:
NS_E_RDI_1099:
NS_E_1099_ETR_TBL:
NS_E_1099_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1138
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1132
LB_1138:
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
	jc LB_1133
	btr r12,0
	clc
	jmp LB_1134
LB_1133:
	bts r12,0
	stc
LB_1134:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1129
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr61 |~ {  } ⊢ %_1101 : %_1101
 ; {>  %_1100~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_1101
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_1102 : %_1102
 ; {>  %_1100~0':_r64 %_1101~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_1102
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_1100 %_1101 } ⊢ { %_1103 %_1104 %_1105 } : { %_1103 %_1104 %_1105 }
 ; {>  %_1100~0':_r64 %_1101~1':_r64 %_1102~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1102 %_1103 } ⊢ { %_1106 %_1107 %_1108 } : { %_1106 %_1107 %_1108 }
 ; {>  %_1104~1':_r64 %_1103~0':_r64 %_1102~2':_r64 %_1105~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1111:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1112
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1112
LB_1113:
	cmp r15,0
	jz LB_1114
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1113
LB_1114:
; _some %_1107 ⊢ %_1109 : %_1109
 ; {>  %_1108~4':_r64 %_1106~2':_r64 %_1104~1':_r64 %_1105~3':_r64 %_1107~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1109
 ; {>  %_1109~°0◂0':(_opn)◂(_r64) %_1108~4':_r64 %_1106~2':_r64 %_1104~1':_r64 %_1105~3':_r64 }
; 	∎ °0◂0'
	bt r12,4
	jc LB_1115
	mov rdi,r10
	call dlt
LB_1115:
	bt r12,2
	jc LB_1116
	mov rdi,r8
	call dlt
LB_1116:
	bt r12,1
	jc LB_1117
	mov rdi,r14
	call dlt
LB_1117:
	bt r12,3
	jc LB_1118
	mov rdi,r9
	call dlt
LB_1118:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1119
	btr r12,3
	jmp LB_1120
LB_1119:
	bts r12,3
LB_1120:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1112:
	mov r15,0
LB_1122:
	cmp r15,0
	jz LB_1123
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1122
LB_1123:
; _none {  } ⊢ %_1110 : %_1110
 ; {>  %_1108~4':_r64 %_1106~2':_r64 %_1104~1':_r64 %_1105~3':_r64 %_1107~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1110
 ; {>  %_1108~4':_r64 %_1106~2':_r64 %_1110~°1◂{  }:(_opn)◂(t365'(0)) %_1104~1':_r64 %_1105~3':_r64 %_1107~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_1124
	mov rdi,r10
	call dlt
LB_1124:
	bt r12,2
	jc LB_1125
	mov rdi,r8
	call dlt
LB_1125:
	bt r12,1
	jc LB_1126
	mov rdi,r14
	call dlt
LB_1126:
	bt r12,3
	jc LB_1127
	mov rdi,r9
	call dlt
LB_1127:
	bt r12,0
	jc LB_1128
	mov rdi,r13
	call dlt
LB_1128:
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
MTC_LB_1121:
LB_1129:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1131
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1130
LB_1131:
	add rsp,8
	ret
LB_1132:
	add rsp,16
	pop r14
LB_1130:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1140:
NS_E_RDI_1140:
NS_E_1140_ETR_TBL:
NS_E_1140_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1179
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1173
LB_1179:
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
	jc LB_1174
	btr r12,0
	clc
	jmp LB_1175
LB_1174:
	bts r12,0
	stc
LB_1175:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1170
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr41 |~ {  } ⊢ %_1142 : %_1142
 ; {>  %_1141~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_1142
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_1143 : %_1143
 ; {>  %_1142~1':_r64 %_1141~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_1143
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_1141 %_1142 } ⊢ { %_1144 %_1145 %_1146 } : { %_1144 %_1145 %_1146 }
 ; {>  %_1143~2':_r64 %_1142~1':_r64 %_1141~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1143 %_1144 } ⊢ { %_1147 %_1148 %_1149 } : { %_1147 %_1148 %_1149 }
 ; {>  %_1143~2':_r64 %_1145~1':_r64 %_1146~3':_r64 %_1144~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1152:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1153
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1153
LB_1154:
	cmp r15,0
	jz LB_1155
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1154
LB_1155:
; _some %_1148 ⊢ %_1150 : %_1150
 ; {>  %_1147~2':_r64 %_1145~1':_r64 %_1146~3':_r64 %_1148~0':_r64 %_1149~4':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1150
 ; {>  %_1147~2':_r64 %_1145~1':_r64 %_1146~3':_r64 %_1150~°0◂0':(_opn)◂(_r64) %_1149~4':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1156
	mov rdi,r8
	call dlt
LB_1156:
	bt r12,1
	jc LB_1157
	mov rdi,r14
	call dlt
LB_1157:
	bt r12,3
	jc LB_1158
	mov rdi,r9
	call dlt
LB_1158:
	bt r12,4
	jc LB_1159
	mov rdi,r10
	call dlt
LB_1159:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1160
	btr r12,3
	jmp LB_1161
LB_1160:
	bts r12,3
LB_1161:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1153:
	mov r15,0
LB_1163:
	cmp r15,0
	jz LB_1164
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1163
LB_1164:
; _none {  } ⊢ %_1151 : %_1151
 ; {>  %_1147~2':_r64 %_1145~1':_r64 %_1146~3':_r64 %_1148~0':_r64 %_1149~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1151
 ; {>  %_1147~2':_r64 %_1145~1':_r64 %_1146~3':_r64 %_1148~0':_r64 %_1151~°1◂{  }:(_opn)◂(t392'(0)) %_1149~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_1165
	mov rdi,r8
	call dlt
LB_1165:
	bt r12,1
	jc LB_1166
	mov rdi,r14
	call dlt
LB_1166:
	bt r12,3
	jc LB_1167
	mov rdi,r9
	call dlt
LB_1167:
	bt r12,0
	jc LB_1168
	mov rdi,r13
	call dlt
LB_1168:
	bt r12,4
	jc LB_1169
	mov rdi,r10
	call dlt
LB_1169:
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
MTC_LB_1162:
LB_1170:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1172
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1171
LB_1172:
	add rsp,8
	ret
LB_1173:
	add rsp,16
	pop r14
LB_1171:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1181:
NS_E_RDI_1181:
NS_E_1181_ETR_TBL:
NS_E_1181_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_1140_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1197
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1191
LB_1197:
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
	jc LB_1192
	btr r12,0
	clc
	jmp LB_1193
LB_1192:
	bts r12,0
	stc
LB_1193:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1188
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1182 ⊢ %_1183 : %_1183
 ; {>  %_1182~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1183
 ; {>  %_1183~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1186
	btr r12,3
	jmp LB_1187
LB_1186:
	bts r12,3
LB_1187:
	mov r8,0
	bts r12,2
	ret
LB_1188:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1190
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1189
LB_1190:
	add rsp,8
	ret
LB_1191:
	add rsp,16
	pop r14
LB_1189:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_1099_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1210
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1204
LB_1210:
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
	jc LB_1205
	btr r12,0
	clc
	jmp LB_1206
LB_1205:
	bts r12,0
	stc
LB_1206:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1201
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1184 ⊢ %_1185 : %_1185
 ; {>  %_1184~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1185
 ; {>  %_1185~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1199
	btr r12,3
	jmp LB_1200
LB_1199:
	bts r12,3
LB_1200:
	mov r8,0
	bts r12,2
	ret
LB_1201:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1203
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1202
LB_1203:
	add rsp,8
	ret
LB_1204:
	add rsp,16
	pop r14
LB_1202:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1212:
NS_E_RDI_1212:
NS_E_1212_ETR_TBL:
NS_E_1212_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_1181_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1257
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1249
LB_1257:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1213_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1262
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1263
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1263:
	jmp LB_1249
LB_1262:
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
	jc LB_1252
	btr r12,1
	clc
	jmp LB_1253
LB_1252:
	bts r12,1
	stc
LB_1253:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1250
	btr r12,0
	clc
	jmp LB_1251
LB_1250:
	bts r12,0
	stc
LB_1251:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1246
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_1215 %_1216 } ⊢ %_1217 : %_1217
 ; {>  %_1216~1':(_lst)◂(_r64) %_1215~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f682 %_1217 ⊢ %_1218 : %_1218
 ; {>  %_1217~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f682 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1232
	btr r12,2
	jmp LB_1233
LB_1232:
	bts r12,2
LB_1233:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1238
	btr r12,3
	jmp LB_1239
LB_1238:
	bts r12,3
LB_1239:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1236
	btr QWORD [rdi],0
	jmp LB_1237
LB_1236:
	bts QWORD [rdi],0
LB_1237:
	mov r9,r14
	bt r12,1
	jc LB_1242
	btr r12,3
	jmp LB_1243
LB_1242:
	bts r12,3
LB_1243:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1240
	btr QWORD [rdi],1
	jmp LB_1241
LB_1240:
	bts QWORD [rdi],1
LB_1241:
	mov rsi,1
	bt r12,0
	jc LB_1234
	mov rsi,0
	bt r13,0
	jc LB_1234
	jmp LB_1235
LB_1234:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1235:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_682
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1218 ⊢ %_1219 : %_1219
 ; {>  %_1218~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1219
 ; {>  %_1219~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1244
	btr r12,3
	jmp LB_1245
LB_1244:
	bts r12,3
LB_1245:
	mov r8,0
	bts r12,2
	ret
LB_1246:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1248
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1247
LB_1248:
	add rsp,8
	ret
LB_1249:
	add rsp,32
	pop r14
LB_1247:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1213:
NS_E_RDI_1213:
NS_E_1213_ETR_TBL:
NS_E_1213_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_1214_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1286
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1278
LB_1286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1213_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1291
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1292
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1292:
	jmp LB_1278
LB_1291:
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
	jc LB_1281
	btr r12,1
	clc
	jmp LB_1282
LB_1281:
	bts r12,1
	stc
LB_1282:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1279
	btr r12,0
	clc
	jmp LB_1280
LB_1279:
	bts r12,0
	stc
LB_1280:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1275
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_1220 %_1221 } ⊢ %_1222 : %_1222
 ; {>  %_1221~1':(_lst)◂(_r64) %_1220~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_1222 ⊢ %_1223 : %_1223
 ; {>  %_1222~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_1223
 ; {>  %_1223~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_1269
	btr r12,2
	jmp LB_1270
LB_1269:
	bts r12,2
LB_1270:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_1267
	btr QWORD [rdi],0
	jmp LB_1268
LB_1267:
	bts QWORD [rdi],0
LB_1268:
	mov r8,r14
	bt r12,1
	jc LB_1273
	btr r12,2
	jmp LB_1274
LB_1273:
	bts r12,2
LB_1274:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_1271
	btr QWORD [rdi],1
	jmp LB_1272
LB_1271:
	bts QWORD [rdi],1
LB_1272:
	mov rsi,1
	bt r12,3
	jc LB_1265
	mov rsi,0
	bt r9,0
	jc LB_1265
	jmp LB_1266
LB_1265:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1266:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1275:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1277
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1276
LB_1277:
	add rsp,8
	ret
LB_1278:
	add rsp,32
	pop r14
LB_1276:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_1296
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_1224 : %_1224
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_1224 ⊢ %_1225 : %_1225
 ; {>  %_1224~°1◂{  }:(_lst)◂(t436'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_1225
 ; {>  %_1225~°0◂°1◂{  }:(_opn)◂((_lst)◂(t439'(0))) }
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
	jc LB_1294
	mov rsi,0
	bt r9,0
	jc LB_1294
	jmp LB_1295
LB_1294:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1295:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1296:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1298
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1297
LB_1298:
	add rsp,8
	ret
LB_1299:
	add rsp,0
	pop r14
LB_1297:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1214:
NS_E_RDI_1214:
NS_E_1214_ETR_TBL:
NS_E_1214_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_1181_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1311
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1305
LB_1311:
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
	jc LB_1306
	btr r12,0
	clc
	jmp LB_1307
LB_1306:
	bts r12,0
	stc
LB_1307:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1302
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1226 ⊢ %_1227 : %_1227
 ; {>  %_1226~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1227
 ; {>  %_1227~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1300
	btr r12,3
	jmp LB_1301
LB_1300:
	bts r12,3
LB_1301:
	mov r8,0
	bts r12,2
	ret
LB_1302:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1304
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1303
LB_1304:
	add rsp,8
	ret
LB_1305:
	add rsp,16
	pop r14
LB_1303:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_1058_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1324
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1318
LB_1324:
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
	jc LB_1319
	btr r12,0
	clc
	jmp LB_1320
LB_1319:
	bts r12,0
	stc
LB_1320:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1315
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1228 ⊢ %_1229 : %_1229
 ; {>  %_1228~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1229
 ; {>  %_1229~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1313
	btr r12,3
	jmp LB_1314
LB_1313:
	bts r12,3
LB_1314:
	mov r8,0
	bts r12,2
	ret
LB_1315:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1317
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1316
LB_1317:
	add rsp,8
	ret
LB_1318:
	add rsp,16
	pop r14
LB_1316:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1339
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1339
	jmp LB_1340
LB_1339:
	jmp LB_1331
LB_1340:
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
	jc LB_1332
	btr r12,0
	clc
	jmp LB_1333
LB_1332:
	bts r12,0
	stc
LB_1333:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1328
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr5f |~ {  } ⊢ %_1230 : %_1230
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_1230
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_1230 ⊢ %_1231 : %_1231
 ; {>  %_1230~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1231
 ; {>  %_1231~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1326
	btr r12,3
	jmp LB_1327
LB_1326:
	bts r12,3
LB_1327:
	mov r8,0
	bts r12,2
	ret
LB_1328:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1330
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1329
LB_1330:
	add rsp,8
	ret
LB_1331:
	add rsp,16
	pop r14
LB_1329:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1341:
NS_E_RDI_1341:
NS_E_1341_ETR_TBL:
NS_E_1341_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1362
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1362
	jmp LB_1363
LB_1362:
	jmp LB_1352
LB_1363:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_1213_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1367
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1368
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1368:
	jmp LB_1352
LB_1367:
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
	jc LB_1355
	btr r12,1
	clc
	jmp LB_1356
LB_1355:
	bts r12,1
	stc
LB_1356:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1353
	btr r12,0
	clc
	jmp LB_1354
LB_1353:
	bts r12,0
	stc
LB_1354:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1349
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_1370
	btr r12,5
	jmp LB_1371
LB_1370:
	bts r12,5
LB_1371:
	mov r13,r14
	bt r12,1
	jc LB_1372
	btr r12,0
	jmp LB_1373
LB_1372:
	bts r12,0
LB_1373:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f682 %_1342 ⊢ %_1343 : %_1343
 ; {>  %_1342~0':(_lst)◂(_r64) }
; _f682 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_682
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1343 ⊢ %_1344 : %_1344
 ; {>  %_1343~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1344
 ; {>  %_1344~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1347
	btr r12,3
	jmp LB_1348
LB_1347:
	bts r12,3
LB_1348:
	mov r8,0
	bts r12,2
	ret
LB_1349:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1351
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1350
LB_1351:
	add rsp,8
	ret
LB_1352:
	add rsp,32
	pop r14
LB_1350:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1385
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1379
LB_1385:
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
	jc LB_1380
	btr r12,0
	clc
	jmp LB_1381
LB_1380:
	bts r12,0
	stc
LB_1381:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1376
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1345 ⊢ %_1346 : %_1346
 ; {>  %_1345~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1346
 ; {>  %_1346~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1374
	btr r12,3
	jmp LB_1375
LB_1374:
	bts r12,3
LB_1375:
	mov r8,0
	bts r12,2
	ret
LB_1376:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1378
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1377
LB_1378:
	add rsp,8
	ret
LB_1379:
	add rsp,16
	pop r14
LB_1377:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1398:
; 	|» 0'
NS_E_RDI_1398:
MTC_LB_1399:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1400
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
	jnc LB_1401
	bt QWORD [rdi],0
	jc LB_1402
	btr r12,3
	clc
	jmp LB_1403
LB_1402:
	bts r12,3
	stc
LB_1403:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1401:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1406
	btr r12,4
	clc
	jmp LB_1407
LB_1406:
	bts r12,4
	stc
LB_1407:
	mov r14,r10
	bt r12,4
	jc LB_1404
	btr r12,1
	jmp LB_1405
LB_1404:
	bts r12,1
LB_1405:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1410
	btr r12,4
	clc
	jmp LB_1411
LB_1410:
	bts r12,4
	stc
LB_1411:
	mov r8,r10
	bt r12,4
	jc LB_1408
	btr r12,2
	jmp LB_1409
LB_1408:
	bts r12,2
LB_1409:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1412:
	cmp r15,0
	jz LB_1413
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1412
LB_1413:
; _f1398 %_1392 ⊢ %_1393 : %_1393
 ; {>  %_1392~2':_p1387 %_1391~1':_stg }
; _f1398 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1416
	btr r12,0
	jmp LB_1417
LB_1416:
	bts r12,0
LB_1417:
	call NS_E_1398
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1414
	btr r12,1
	clc
	jmp LB_1415
LB_1414:
	bts r12,1
	stc
LB_1415:
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
; ∎ %_1396
 ; {>  %_1396~2':_stg %_1395~0':_stg %_1394~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1418
	mov rdi,r13
	call dlt
LB_1418:
	bt r12,1
	jc LB_1419
	mov rdi,r14
	call dlt
LB_1419:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1420
	btr r12,0
	jmp LB_1421
LB_1420:
	bts r12,0
LB_1421:
	ret
MTC_LB_1400:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1422
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
	jnc LB_1423
	bt QWORD [rdi],0
	jc LB_1424
	btr r12,2
	clc
	jmp LB_1425
LB_1424:
	bts r12,2
	stc
LB_1425:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1423:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1426
	btr r12,1
	jmp LB_1427
LB_1426:
	bts r12,1
LB_1427:
LB_1428:
	cmp r15,0
	jz LB_1429
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1428
LB_1429:
; ∎ %_1397
 ; {>  %_1397~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1430
	btr r12,0
	jmp LB_1431
LB_1430:
	bts r12,0
LB_1431:
	ret
MTC_LB_1422:
NS_E_1534:
; 	|» 0'
NS_E_RDI_1534:
MTC_LB_1535:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1536
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
	jnc LB_1537
	bt QWORD [rdi],0
	jc LB_1538
	btr r12,2
	clc
	jmp LB_1539
LB_1538:
	bts r12,2
	stc
LB_1539:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1537:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1540
	btr r12,1
	jmp LB_1541
LB_1540:
	bts r12,1
LB_1541:
LB_1542:
	cmp r15,0
	jz LB_1543
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1542
LB_1543:
; 	» "??r" _ ⊢ 0' : %_1529
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1529
 ; {>  %_1529~0':_stg %_1528~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_1544
	mov rdi,r14
	call dlt
LB_1544:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1536:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1545
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
	jnc LB_1546
	bt QWORD [rdi],0
	jc LB_1547
	btr r12,2
	clc
	jmp LB_1548
LB_1547:
	bts r12,2
	stc
LB_1548:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1546:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1549
	btr r12,1
	jmp LB_1550
LB_1549:
	bts r12,1
LB_1550:
LB_1551:
	cmp r15,0
	jz LB_1552
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1551
LB_1552:
; 	» ".." _ ⊢ 0' : %_1531
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1531
 ; {>  %_1530~1':_stg %_1531~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1553
	mov rdi,r14
	call dlt
LB_1553:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1545:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1554
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
	jnc LB_1555
	bt QWORD [rdi],0
	jc LB_1556
	btr r12,2
	clc
	jmp LB_1557
LB_1556:
	bts r12,2
	stc
LB_1557:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1555:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1558
	btr r12,1
	jmp LB_1559
LB_1558:
	bts r12,1
LB_1559:
LB_1560:
	cmp r15,0
	jz LB_1561
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1560
LB_1561:
; _f1398 %_1532 ⊢ %_1533 : %_1533
 ; {>  %_1532~1':_p1387 }
; _f1398 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1562
	btr r12,0
	jmp LB_1563
LB_1562:
	bts r12,0
LB_1563:
	call NS_E_1398
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1533
 ; {>  %_1533~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1554:
NS_E_1604:
; 	|» 0'
NS_E_RDI_1604:
MTC_LB_1605:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1606
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
	jnc LB_1607
	bt QWORD [rdi],0
	jc LB_1608
	btr r12,3
	clc
	jmp LB_1609
LB_1608:
	bts r12,3
	stc
LB_1609:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1607:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1612
	btr r12,4
	clc
	jmp LB_1613
LB_1612:
	bts r12,4
	stc
LB_1613:
	mov r14,r10
	bt r12,4
	jc LB_1610
	btr r12,1
	jmp LB_1611
LB_1610:
	bts r12,1
LB_1611:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1616
	btr r12,4
	clc
	jmp LB_1617
LB_1616:
	bts r12,4
	stc
LB_1617:
	mov r8,r10
	bt r12,4
	jc LB_1614
	btr r12,2
	jmp LB_1615
LB_1614:
	bts r12,2
LB_1615:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1618:
	cmp r15,0
	jz LB_1619
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1618
LB_1619:
; _f1594 %_1596 ⊢ %_1598 : %_1598
 ; {>  %_1597~2':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) %_1596~1':(_p1432)◂((_p1440)◂(_stg)) }
; _f1594 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1622
	btr r12,0
	jmp LB_1623
LB_1622:
	bts r12,0
LB_1623:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1620
	btr r12,2
	clc
	jmp LB_1621
LB_1620:
	bts r12,2
	stc
LB_1621:
	add rsp,16
; _f1604 %_1597 ⊢ %_1599 : %_1599
 ; {>  %_1598~0':_stg %_1597~2':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) }
; _f1604 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1626
	btr r12,0
	jmp LB_1627
LB_1626:
	bts r12,0
LB_1627:
	call NS_E_1604
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1628
	btr r12,1
	jmp LB_1629
LB_1628:
	bts r12,1
LB_1629:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1624
	btr r12,0
	clc
	jmp LB_1625
LB_1624:
	bts r12,0
	stc
LB_1625:
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
; ∎ %_1602
 ; {>  %_1602~2':_stg %_1600~0':_stg %_1601~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1630
	mov rdi,r13
	call dlt
LB_1630:
	bt r12,1
	jc LB_1631
	mov rdi,r14
	call dlt
LB_1631:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1632
	btr r12,0
	jmp LB_1633
LB_1632:
	bts r12,0
LB_1633:
	ret
MTC_LB_1606:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1634
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
	jnc LB_1635
	bt QWORD [rdi],0
	jc LB_1636
	btr r12,1
	clc
	jmp LB_1637
LB_1636:
	bts r12,1
	stc
LB_1637:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1635:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1638:
	cmp r15,0
	jz LB_1639
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1638
LB_1639:
; 	» "" _ ⊢ 0' : %_1603
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1603
 ; {>  %_1603~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1634:
NS_E_1594:
; 	|» 0'
NS_E_RDI_1594:
MTC_LB_1640:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1641
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
	jnc LB_1642
	bt QWORD [rdi],0
	jc LB_1643
	btr r12,2
	clc
	jmp LB_1644
LB_1643:
	bts r12,2
	stc
LB_1644:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1642:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1645
	btr r12,1
	jmp LB_1646
LB_1645:
	bts r12,1
LB_1646:
LB_1647:
	cmp r15,0
	jz LB_1648
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1647
LB_1648:
; _f1604 %_1587 ⊢ %_1588 : %_1588
 ; {>  %_1587~1':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) }
; _f1604 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1649
	btr r12,0
	jmp LB_1650
LB_1649:
	bts r12,0
LB_1650:
	call NS_E_1604
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
; ∎ %_1590
 ; {>  %_1590~1':_stg %_1589~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1651
	mov rdi,r13
	call dlt
LB_1651:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1652
	btr r12,0
	jmp LB_1653
LB_1652:
	bts r12,0
LB_1653:
	ret
MTC_LB_1641:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1654
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
	jnc LB_1655
	bt QWORD [rdi],0
	jc LB_1656
	btr r12,2
	clc
	jmp LB_1657
LB_1656:
	bts r12,2
	stc
LB_1657:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1655:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1658
	btr r12,1
	jmp LB_1659
LB_1658:
	bts r12,1
LB_1659:
LB_1660:
	cmp r15,0
	jz LB_1661
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1660
LB_1661:
MTC_LB_1662:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1663
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
	jnc LB_1664
	bt QWORD [rdi],0
	jc LB_1665
	btr r12,0
	clc
	jmp LB_1666
LB_1665:
	bts r12,0
	stc
LB_1666:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1664:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1667:
	cmp r15,0
	jz LB_1668
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1667
LB_1668:
; 	» "_ " _ ⊢ 0' : %_1592
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1592
 ; {>  %_1592~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1663:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1669
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
	jnc LB_1670
	bt QWORD [rdi],0
	jc LB_1671
	btr r12,2
	clc
	jmp LB_1672
LB_1671:
	bts r12,2
	stc
LB_1672:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1670:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1673
	btr r12,0
	jmp LB_1674
LB_1673:
	bts r12,0
LB_1674:
LB_1675:
	cmp r15,0
	jz LB_1676
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1675
LB_1676:
; ∎ %_1593
 ; {>  %_1593~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1669:
MTC_LB_1654:
NS_E_1585:
; 	|» 0'
NS_E_RDI_1585:
MTC_LB_1677:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1678
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
	jnc LB_1679
	bt QWORD [rdi],0
	jc LB_1680
	btr r12,3
	clc
	jmp LB_1681
LB_1680:
	bts r12,3
	stc
LB_1681:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1679:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1684
	btr r12,4
	clc
	jmp LB_1685
LB_1684:
	bts r12,4
	stc
LB_1685:
	mov r14,r10
	bt r12,4
	jc LB_1682
	btr r12,1
	jmp LB_1683
LB_1682:
	bts r12,1
LB_1683:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1688
	btr r12,4
	clc
	jmp LB_1689
LB_1688:
	bts r12,4
	stc
LB_1689:
	mov r8,r10
	bt r12,4
	jc LB_1686
	btr r12,2
	jmp LB_1687
LB_1686:
	bts r12,2
LB_1687:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1690:
	cmp r15,0
	jz LB_1691
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1690
LB_1691:
; _f1575 %_1577 ⊢ %_1579 : %_1579
 ; {>  %_1577~1':(_p1432)◂((_p1439)◂(_stg)) %_1578~2':(_lst)◂((_p1432)◂((_p1439)◂(_stg))) }
; _f1575 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1694
	btr r12,0
	jmp LB_1695
LB_1694:
	bts r12,0
LB_1695:
	call NS_E_1575
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1692
	btr r12,2
	clc
	jmp LB_1693
LB_1692:
	bts r12,2
	stc
LB_1693:
	add rsp,16
; _f1585 %_1578 ⊢ %_1580 : %_1580
 ; {>  %_1578~2':(_lst)◂((_p1432)◂((_p1439)◂(_stg))) %_1579~0':_stg }
; _f1585 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1698
	btr r12,0
	jmp LB_1699
LB_1698:
	bts r12,0
LB_1699:
	call NS_E_1585
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1700
	btr r12,1
	jmp LB_1701
LB_1700:
	bts r12,1
LB_1701:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1696
	btr r12,0
	clc
	jmp LB_1697
LB_1696:
	bts r12,0
	stc
LB_1697:
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
; ∎ %_1583
 ; {>  %_1582~1':_stg %_1583~2':_stg %_1581~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1702
	mov rdi,r14
	call dlt
LB_1702:
	bt r12,0
	jc LB_1703
	mov rdi,r13
	call dlt
LB_1703:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1704
	btr r12,0
	jmp LB_1705
LB_1704:
	bts r12,0
LB_1705:
	ret
MTC_LB_1678:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1706
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
	jnc LB_1707
	bt QWORD [rdi],0
	jc LB_1708
	btr r12,1
	clc
	jmp LB_1709
LB_1708:
	bts r12,1
	stc
LB_1709:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1707:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1710:
	cmp r15,0
	jz LB_1711
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1710
LB_1711:
; 	» "" _ ⊢ 0' : %_1584
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1584
 ; {>  %_1584~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1706:
NS_E_1575:
; 	|» 0'
NS_E_RDI_1575:
MTC_LB_1712:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1713
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
	jnc LB_1714
	bt QWORD [rdi],0
	jc LB_1715
	btr r12,2
	clc
	jmp LB_1716
LB_1715:
	bts r12,2
	stc
LB_1716:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1714:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1717
	btr r12,1
	jmp LB_1718
LB_1717:
	bts r12,1
LB_1718:
LB_1719:
	cmp r15,0
	jz LB_1720
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1719
LB_1720:
; _f1585 %_1565 ⊢ %_1566 : %_1566
 ; {>  %_1565~1':(_lst)◂((_p1432)◂((_p1439)◂(_stg))) }
; _f1585 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1721
	btr r12,0
	jmp LB_1722
LB_1721:
	bts r12,0
LB_1722:
	call NS_E_1585
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
; ∎ %_1568
 ; {>  %_1567~0':_stg %_1568~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1723
	mov rdi,r13
	call dlt
LB_1723:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1724
	btr r12,0
	jmp LB_1725
LB_1724:
	bts r12,0
LB_1725:
	ret
MTC_LB_1713:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1726
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
	jnc LB_1727
	bt QWORD [rdi],0
	jc LB_1728
	btr r12,2
	clc
	jmp LB_1729
LB_1728:
	bts r12,2
	stc
LB_1729:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1727:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1730
	btr r12,1
	jmp LB_1731
LB_1730:
	bts r12,1
LB_1731:
LB_1732:
	cmp r15,0
	jz LB_1733
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1732
LB_1733:
MTC_LB_1734:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1735
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
	jnc LB_1736
	bt QWORD [rdi],0
	jc LB_1737
	btr r12,2
	clc
	jmp LB_1738
LB_1737:
	bts r12,2
	stc
LB_1738:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1736:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1739
	btr r12,0
	jmp LB_1740
LB_1739:
	bts r12,0
LB_1740:
LB_1741:
	cmp r15,0
	jz LB_1742
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1741
LB_1742:
; _f1534 %_1570 ⊢ %_1571 : %_1571
 ; {>  %_1570~0':_p1435 }
; _f1534 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1534
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
; ∎ %_1573
 ; {>  %_1573~1':_stg %_1572~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1743
	mov rdi,r13
	call dlt
LB_1743:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1744
	btr r12,0
	jmp LB_1745
LB_1744:
	bts r12,0
LB_1745:
	ret
MTC_LB_1735:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1746
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
	jnc LB_1747
	bt QWORD [rdi],0
	jc LB_1748
	btr r12,2
	clc
	jmp LB_1749
LB_1748:
	bts r12,2
	stc
LB_1749:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1747:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1750
	btr r12,0
	jmp LB_1751
LB_1750:
	bts r12,0
LB_1751:
LB_1752:
	cmp r15,0
	jz LB_1753
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1752
LB_1753:
; ∎ %_1574
 ; {>  %_1574~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1746:
MTC_LB_1726:
NS_E_1861:
; 	|» { 0' 1' }
NS_E_RDI_1861:
MTC_LB_1862:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1863
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
	jnc LB_1864
	bt QWORD [rdi],0
	jc LB_1865
	btr r12,5
	clc
	jmp LB_1866
LB_1865:
	bts r12,5
	stc
LB_1866:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1864:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1869
	btr r12,6
	clc
	jmp LB_1870
LB_1869:
	bts r12,6
	stc
LB_1870:
	mov r8,rcx
	bt r12,6
	jc LB_1867
	btr r12,2
	jmp LB_1868
LB_1867:
	bts r12,2
LB_1868:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1873
	btr r12,6
	clc
	jmp LB_1874
LB_1873:
	bts r12,6
	stc
LB_1874:
	mov r9,rcx
	bt r12,6
	jc LB_1871
	btr r12,3
	jmp LB_1872
LB_1871:
	bts r12,3
LB_1872:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_1877
	btr r12,6
	clc
	jmp LB_1878
LB_1877:
	bts r12,6
	stc
LB_1878:
	mov r10,rcx
	bt r12,6
	jc LB_1875
	btr r12,4
	jmp LB_1876
LB_1875:
	bts r12,4
LB_1876:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1879:
	cmp r15,0
	jz LB_1880
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1879
LB_1880:
; _f1861 { %_1822 %_1826 } ⊢ { %_1827 %_1828 } : { %_1827 %_1828 }
 ; {>  %_1825~3':(_p1448)◂(_stg) %_1824~2':(_lst)◂((_p1449)◂(_stg)) %_1822~0':_r64 %_1826~4':(_p1447)◂(_stg) }
; _f1861 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1885
	btr r12,1
	jmp LB_1886
LB_1885:
	bts r12,1
LB_1886:
	call NS_E_1861
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1883
	btr r12,3
	clc
	jmp LB_1884
LB_1883:
	bts r12,3
	stc
LB_1884:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1881
	btr r12,2
	clc
	jmp LB_1882
LB_1881:
	bts r12,2
	stc
LB_1882:
	add rsp,24
MTC_LB_1887:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1888
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
	jnc LB_1889
	bt QWORD [rdi],0
	jc LB_1890
	btr r12,5
	clc
	jmp LB_1891
LB_1890:
	bts r12,5
	stc
LB_1891:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1889:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1892
	btr r12,4
	jmp LB_1893
LB_1892:
	bts r12,4
LB_1893:
LB_1894:
	cmp r15,0
	jz LB_1895
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1894
LB_1895:
; _f1861 { %_1827 %_1829 } ⊢ { %_1830 %_1831 } : { %_1830 %_1831 }
 ; {>  %_1829~4':(_p1447)◂(_stg) %_1827~0':_r64 %_1824~2':(_lst)◂((_p1449)◂(_stg)) %_1828~1':_stg }
; _f1861 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1900
	btr r12,1
	jmp LB_1901
LB_1900:
	bts r12,1
LB_1901:
	call NS_E_1861
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1902
	btr r12,3
	jmp LB_1903
LB_1902:
	bts r12,3
LB_1903:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1898
	btr r12,2
	clc
	jmp LB_1899
LB_1898:
	bts r12,2
	stc
LB_1899:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1896
	btr r12,1
	clc
	jmp LB_1897
LB_1896:
	bts r12,1
	stc
LB_1897:
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
LB_1904:
	cmp rax,0
	jz LB_1905
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1904
LB_1905:
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
; ∎ { %_1832 %_1835 }
 ; {>  %_1832~0':_r64 %_1835~4':_stg %_1824~2':(_lst)◂((_p1449)◂(_stg)) %_1833~1':_stg %_1834~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_1906
	mov rdi,r8
	call dlt
LB_1906:
	bt r12,1
	jc LB_1907
	mov rdi,r14
	call dlt
LB_1907:
	bt r12,3
	jc LB_1908
	mov rdi,r9
	call dlt
LB_1908:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1909
	btr r12,1
	jmp LB_1910
LB_1909:
	bts r12,1
LB_1910:
	ret
MTC_LB_1888:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1911
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
	jnc LB_1912
	bt QWORD [rdi],0
	jc LB_1913
	btr r12,5
	clc
	jmp LB_1914
LB_1913:
	bts r12,5
	stc
LB_1914:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1912:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1915
	btr r12,4
	jmp LB_1916
LB_1915:
	bts r12,4
LB_1916:
LB_1917:
	cmp r15,0
	jz LB_1918
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1917
LB_1918:
; _f56 %_1827 ⊢ %_1837 : %_1837
 ; {>  %_1836~4':(_p1445)◂(_stg) %_1827~0':_r64 %_1824~2':(_lst)◂((_p1449)◂(_stg)) %_1828~1':_stg }
	add r13,1
; _f1773 { %_1837 %_1836 } ⊢ { %_1838 %_1839 } : { %_1838 %_1839 }
 ; {>  %_1836~4':(_p1445)◂(_stg) %_1837~0':_r64 %_1824~2':(_lst)◂((_p1449)◂(_stg)) %_1828~1':_stg }
; _f1773 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1923
	btr r12,1
	jmp LB_1924
LB_1923:
	bts r12,1
LB_1924:
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1925
	btr r12,3
	jmp LB_1926
LB_1925:
	bts r12,3
LB_1926:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1921
	btr r12,2
	clc
	jmp LB_1922
LB_1921:
	bts r12,2
	stc
LB_1922:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1919
	btr r12,1
	clc
	jmp LB_1920
LB_1919:
	bts r12,1
	stc
LB_1920:
	add rsp,24
; _f55 %_1838 ⊢ %_1840 : %_1840
 ; {>  %_1838~0':_r64 %_1824~2':(_lst)◂((_p1449)◂(_stg)) %_1839~3':_stg %_1828~1':_stg }
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
LB_1927:
	cmp rax,0
	jz LB_1928
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1927
LB_1928:
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
; ∎ { %_1841 %_1844 }
 ; {>  %_1843~3':_stg %_1842~1':_stg %_1841~0':_r64 %_1824~2':(_lst)◂((_p1449)◂(_stg)) %_1844~4':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_1929
	mov rdi,r9
	call dlt
LB_1929:
	bt r12,1
	jc LB_1930
	mov rdi,r14
	call dlt
LB_1930:
	bt r12,2
	jc LB_1931
	mov rdi,r8
	call dlt
LB_1931:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1932
	btr r12,1
	jmp LB_1933
LB_1932:
	bts r12,1
LB_1933:
	ret
MTC_LB_1911:
MTC_LB_1863:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1934
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
	jnc LB_1935
	bt QWORD [rdi],0
	jc LB_1936
	btr r12,4
	clc
	jmp LB_1937
LB_1936:
	bts r12,4
	stc
LB_1937:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1935:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1940
	btr r12,5
	clc
	jmp LB_1941
LB_1940:
	bts r12,5
	stc
LB_1941:
	mov r8,r11
	bt r12,5
	jc LB_1938
	btr r12,2
	jmp LB_1939
LB_1938:
	bts r12,2
LB_1939:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1944
	btr r12,5
	clc
	jmp LB_1945
LB_1944:
	bts r12,5
	stc
LB_1945:
	mov r9,r11
	bt r12,5
	jc LB_1942
	btr r12,3
	jmp LB_1943
LB_1942:
	bts r12,3
LB_1943:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1946:
	cmp r15,0
	jz LB_1947
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1946
LB_1947:
MTC_LB_1948:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1949
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
	jnc LB_1950
	bt QWORD [rdi],0
	jc LB_1951
	btr r12,4
	clc
	jmp LB_1952
LB_1951:
	bts r12,4
	stc
LB_1952:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1950:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_1953
	btr r12,1
	jmp LB_1954
LB_1953:
	bts r12,1
LB_1954:
LB_1955:
	cmp r15,0
	jz LB_1956
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1955
LB_1956:
; _f1861 { %_1822 %_1847 } ⊢ { %_1848 %_1849 } : { %_1848 %_1849 }
 ; {>  %_1847~1':(_p1447)◂(_stg) %_1822~0':_r64 %_1845~2':(_lst)◂((_p1449)◂(_stg)) }
; _f1861 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1861
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1957
	btr r12,2
	clc
	jmp LB_1958
LB_1957:
	bts r12,2
	stc
LB_1958:
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
LB_1959:
	cmp rax,0
	jz LB_1960
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1959
LB_1960:
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
; ∎ { %_1850 %_1852 }
 ; {>  %_1850~0':_r64 %_1845~2':(_lst)◂((_p1449)◂(_stg)) %_1852~3':_stg %_1851~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_1961
	mov rdi,r8
	call dlt
LB_1961:
	bt r12,1
	jc LB_1962
	mov rdi,r14
	call dlt
LB_1962:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1963
	btr r12,1
	jmp LB_1964
LB_1963:
	bts r12,1
LB_1964:
	ret
MTC_LB_1949:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1965
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
	jnc LB_1966
	bt QWORD [rdi],0
	jc LB_1967
	btr r12,4
	clc
	jmp LB_1968
LB_1967:
	bts r12,4
	stc
LB_1968:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1966:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_1969
	btr r12,1
	jmp LB_1970
LB_1969:
	bts r12,1
LB_1970:
LB_1971:
	cmp r15,0
	jz LB_1972
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1971
LB_1972:
; _f56 %_1822 ⊢ %_1854 : %_1854
 ; {>  %_1853~1':(_p1445)◂(_stg) %_1822~0':_r64 %_1845~2':(_lst)◂((_p1449)◂(_stg)) }
	add r13,1
; _f1773 { %_1854 %_1853 } ⊢ { %_1855 %_1856 } : { %_1855 %_1856 }
 ; {>  %_1854~0':_r64 %_1853~1':(_p1445)◂(_stg) %_1845~2':(_lst)◂((_p1449)◂(_stg)) }
; _f1773 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1973
	btr r12,2
	clc
	jmp LB_1974
LB_1973:
	bts r12,2
	stc
LB_1974:
	add rsp,16
; _f55 %_1855 ⊢ %_1857 : %_1857
 ; {>  %_1855~0':_r64 %_1856~1':_stg %_1845~2':(_lst)◂((_p1449)◂(_stg)) }
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
LB_1975:
	cmp rax,0
	jz LB_1976
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1975
LB_1976:
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
; ∎ { %_1858 %_1860 }
 ; {>  %_1859~1':_stg %_1860~3':_stg %_1858~0':_r64 %_1845~2':(_lst)◂((_p1449)◂(_stg)) }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_1977
	mov rdi,r14
	call dlt
LB_1977:
	bt r12,2
	jc LB_1978
	mov rdi,r8
	call dlt
LB_1978:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1979
	btr r12,1
	jmp LB_1980
LB_1979:
	bts r12,1
LB_1980:
	ret
MTC_LB_1965:
MTC_LB_1934:
NS_E_1821:
; 	|» { 0' 1' }
NS_E_RDI_1821:
MTC_LB_1981:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1982
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
	jnc LB_1983
	bt QWORD [rdi],0
	jc LB_1984
	btr r12,5
	clc
	jmp LB_1985
LB_1984:
	bts r12,5
	stc
LB_1985:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1983:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1988
	btr r12,6
	clc
	jmp LB_1989
LB_1988:
	bts r12,6
	stc
LB_1989:
	mov r8,rcx
	bt r12,6
	jc LB_1986
	btr r12,2
	jmp LB_1987
LB_1986:
	bts r12,2
LB_1987:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1992
	btr r12,6
	clc
	jmp LB_1993
LB_1992:
	bts r12,6
	stc
LB_1993:
	mov r9,rcx
	bt r12,6
	jc LB_1990
	btr r12,3
	jmp LB_1991
LB_1990:
	bts r12,3
LB_1991:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_1996
	btr r12,6
	clc
	jmp LB_1997
LB_1996:
	bts r12,6
	stc
LB_1997:
	mov r10,rcx
	bt r12,6
	jc LB_1994
	btr r12,4
	jmp LB_1995
LB_1994:
	bts r12,4
LB_1995:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1998:
	cmp r15,0
	jz LB_1999
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1998
LB_1999:
; _f1575 %_1777 ⊢ %_1779 : %_1779
 ; {>  %_1776~2':_p1387 %_1774~0':_r64 %_1778~4':(_p1432)◂((_p1440)◂(_stg)) %_1777~3':(_p1432)◂((_p1439)◂(_stg)) }
; _f1575 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2006
	btr r12,0
	jmp LB_2007
LB_2006:
	bts r12,0
LB_2007:
	call NS_E_1575
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2008
	btr r12,1
	jmp LB_2009
LB_2008:
	bts r12,1
LB_2009:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2004
	btr r12,4
	clc
	jmp LB_2005
LB_2004:
	bts r12,4
	stc
LB_2005:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2002
	btr r12,2
	clc
	jmp LB_2003
LB_2002:
	bts r12,2
	stc
LB_2003:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2000
	btr r12,0
	clc
	jmp LB_2001
LB_2000:
	bts r12,0
	stc
LB_2001:
	add rsp,32
; _f1594 %_1778 ⊢ %_1780 : %_1780
 ; {>  %_1776~2':_p1387 %_1774~0':_r64 %_1779~1':_stg %_1778~4':(_p1432)◂((_p1440)◂(_stg)) }
; _f1594 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2016
	btr r12,0
	jmp LB_2017
LB_2016:
	bts r12,0
LB_2017:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2018
	btr r12,3
	jmp LB_2019
LB_2018:
	bts r12,3
LB_2019:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2014
	btr r12,2
	clc
	jmp LB_2015
LB_2014:
	bts r12,2
	stc
LB_2015:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2012
	btr r12,1
	clc
	jmp LB_2013
LB_2012:
	bts r12,1
	stc
LB_2013:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2010
	btr r12,0
	clc
	jmp LB_2011
LB_2010:
	bts r12,0
	stc
LB_2011:
	add rsp,32
; _f1398 %_1776 ⊢ %_1781 : %_1781
 ; {>  %_1776~2':_p1387 %_1780~3':_stg %_1774~0':_r64 %_1779~1':_stg }
; _f1398 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2026
	btr r12,0
	jmp LB_2027
LB_2026:
	bts r12,0
LB_2027:
	call NS_E_1398
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2028
	btr r12,2
	jmp LB_2029
LB_2028:
	bts r12,2
LB_2029:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2024
	btr r12,3
	clc
	jmp LB_2025
LB_2024:
	bts r12,3
	stc
LB_2025:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2022
	btr r12,1
	clc
	jmp LB_2023
LB_2022:
	bts r12,1
	stc
LB_2023:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2020
	btr r12,0
	clc
	jmp LB_2021
LB_2020:
	bts r12,0
	stc
LB_2021:
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
LB_2030:
	cmp rax,0
	jz LB_2031
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2030
LB_2031:
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
; ∎ { %_1782 %_1786 }
 ; {>  %_1784~1':_stg %_1786~4':_stg %_1782~0':_r64 %_1785~3':_stg %_1783~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2032
	mov rdi,r14
	call dlt
LB_2032:
	bt r12,3
	jc LB_2033
	mov rdi,r9
	call dlt
LB_2033:
	bt r12,2
	jc LB_2034
	mov rdi,r8
	call dlt
LB_2034:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2035
	btr r12,1
	jmp LB_2036
LB_2035:
	bts r12,1
LB_2036:
	ret
MTC_LB_1982:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2037
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
	jnc LB_2038
	bt QWORD [rdi],0
	jc LB_2039
	btr r12,4
	clc
	jmp LB_2040
LB_2039:
	bts r12,4
	stc
LB_2040:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2038:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2043
	btr r12,5
	clc
	jmp LB_2044
LB_2043:
	bts r12,5
	stc
LB_2044:
	mov r8,r11
	bt r12,5
	jc LB_2041
	btr r12,2
	jmp LB_2042
LB_2041:
	bts r12,2
LB_2042:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2047
	btr r12,5
	clc
	jmp LB_2048
LB_2047:
	bts r12,5
	stc
LB_2048:
	mov r9,r11
	bt r12,5
	jc LB_2045
	btr r12,3
	jmp LB_2046
LB_2045:
	bts r12,3
LB_2046:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2049:
	cmp r15,0
	jz LB_2050
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2049
LB_2050:
; _f1575 %_1787 ⊢ %_1789 : %_1789
 ; {>  %_1774~0':_r64 %_1788~3':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) %_1787~2':(_p1432)◂((_p1439)◂(_stg)) }
; _f1575 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2055
	btr r12,0
	jmp LB_2056
LB_2055:
	bts r12,0
LB_2056:
	call NS_E_1575
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2057
	btr r12,1
	jmp LB_2058
LB_2057:
	bts r12,1
LB_2058:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2053
	btr r12,3
	clc
	jmp LB_2054
LB_2053:
	bts r12,3
	stc
LB_2054:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2051
	btr r12,0
	clc
	jmp LB_2052
LB_2051:
	bts r12,0
	stc
LB_2052:
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
LB_2059:
	cmp rax,0
	jz LB_2060
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2059
LB_2060:
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
; ∎ { %_1790 %_1792 }
 ; {>  %_1790~0':_r64 %_1792~2':_stg %_1791~1':_stg %_1788~3':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2061
	mov rdi,r14
	call dlt
LB_2061:
	bt r12,3
	jc LB_2062
	mov rdi,r9
	call dlt
LB_2062:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2063
	btr r12,1
	jmp LB_2064
LB_2063:
	bts r12,1
LB_2064:
	ret
MTC_LB_2037:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2065
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
	jnc LB_2066
	bt QWORD [rdi],0
	jc LB_2067
	btr r12,5
	clc
	jmp LB_2068
LB_2067:
	bts r12,5
	stc
LB_2068:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2066:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2071
	btr r12,6
	clc
	jmp LB_2072
LB_2071:
	bts r12,6
	stc
LB_2072:
	mov r8,rcx
	bt r12,6
	jc LB_2069
	btr r12,2
	jmp LB_2070
LB_2069:
	bts r12,2
LB_2070:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2075
	btr r12,6
	clc
	jmp LB_2076
LB_2075:
	bts r12,6
	stc
LB_2076:
	mov r9,rcx
	bt r12,6
	jc LB_2073
	btr r12,3
	jmp LB_2074
LB_2073:
	bts r12,3
LB_2074:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2079
	btr r12,6
	clc
	jmp LB_2080
LB_2079:
	bts r12,6
	stc
LB_2080:
	mov r10,rcx
	bt r12,6
	jc LB_2077
	btr r12,4
	jmp LB_2078
LB_2077:
	bts r12,4
LB_2078:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2081:
	cmp r15,0
	jz LB_2082
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2081
LB_2082:
; _f1434 %_1793 ⊢ %_1796 : %_1796
 ; {>  %_1795~4':(_p1432)◂((_p1440)◂(_stg)) %_1774~0':_r64 %_1794~3':(_p1432)◂((_p1439)◂(_stg)) %_1793~2':(_p1439)◂(_stg) }
; _f1434 2' ⊢ °1◂2'
; _f1575 %_1796 ⊢ %_1797 : %_1797
 ; {>  %_1795~4':(_p1432)◂((_p1440)◂(_stg)) %_1774~0':_r64 %_1794~3':(_p1432)◂((_p1439)◂(_stg)) %_1796~°1◂2':(_p1432)◂((_p1439)◂(_stg)) }
; _f1575 °1◂2' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},°1◂2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2091
	btr r12,0
	jmp LB_2092
LB_2091:
	bts r12,0
LB_2092:
	mov rsi,1
	bt r12,0
	jc LB_2089
	mov rsi,0
	bt r13,0
	jc LB_2089
	jmp LB_2090
LB_2089:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_2090:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_1575
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2093
	btr r12,1
	jmp LB_2094
LB_2093:
	bts r12,1
LB_2094:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2087
	btr r12,4
	clc
	jmp LB_2088
LB_2087:
	bts r12,4
	stc
LB_2088:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2085
	btr r12,3
	clc
	jmp LB_2086
LB_2085:
	bts r12,3
	stc
LB_2086:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2083
	btr r12,0
	clc
	jmp LB_2084
LB_2083:
	bts r12,0
	stc
LB_2084:
	add rsp,32
; _f1575 %_1794 ⊢ %_1798 : %_1798
 ; {>  %_1795~4':(_p1432)◂((_p1440)◂(_stg)) %_1774~0':_r64 %_1797~1':_stg %_1794~3':(_p1432)◂((_p1439)◂(_stg)) }
; _f1575 3' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2101
	btr r12,0
	jmp LB_2102
LB_2101:
	bts r12,0
LB_2102:
	call NS_E_1575
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2103
	btr r12,2
	jmp LB_2104
LB_2103:
	bts r12,2
LB_2104:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2099
	btr r12,4
	clc
	jmp LB_2100
LB_2099:
	bts r12,4
	stc
LB_2100:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2097
	btr r12,1
	clc
	jmp LB_2098
LB_2097:
	bts r12,1
	stc
LB_2098:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2095
	btr r12,0
	clc
	jmp LB_2096
LB_2095:
	bts r12,0
	stc
LB_2096:
	add rsp,32
; _f1594 %_1795 ⊢ %_1799 : %_1799
 ; {>  %_1795~4':(_p1432)◂((_p1440)◂(_stg)) %_1774~0':_r64 %_1797~1':_stg %_1798~2':_stg }
; _f1594 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2111
	btr r12,0
	jmp LB_2112
LB_2111:
	bts r12,0
LB_2112:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2113
	btr r12,3
	jmp LB_2114
LB_2113:
	bts r12,3
LB_2114:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2109
	btr r12,2
	clc
	jmp LB_2110
LB_2109:
	bts r12,2
	stc
LB_2110:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2107
	btr r12,1
	clc
	jmp LB_2108
LB_2107:
	bts r12,1
	stc
LB_2108:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2105
	btr r12,0
	clc
	jmp LB_2106
LB_2105:
	bts r12,0
	stc
LB_2106:
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
LB_2115:
	cmp rax,0
	jz LB_2116
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2115
LB_2116:
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
; ∎ { %_1800 %_1804 }
 ; {>  %_1804~4':_stg %_1801~1':_stg %_1802~2':_stg %_1803~3':_stg %_1800~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2117
	mov rdi,r14
	call dlt
LB_2117:
	bt r12,2
	jc LB_2118
	mov rdi,r8
	call dlt
LB_2118:
	bt r12,3
	jc LB_2119
	mov rdi,r9
	call dlt
LB_2119:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2120
	btr r12,1
	jmp LB_2121
LB_2120:
	bts r12,1
LB_2121:
	ret
MTC_LB_2065:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2122
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
	jnc LB_2123
	bt QWORD [rdi],0
	jc LB_2124
	btr r12,5
	clc
	jmp LB_2125
LB_2124:
	bts r12,5
	stc
LB_2125:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2123:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2128
	btr r12,6
	clc
	jmp LB_2129
LB_2128:
	bts r12,6
	stc
LB_2129:
	mov r8,rcx
	bt r12,6
	jc LB_2126
	btr r12,2
	jmp LB_2127
LB_2126:
	bts r12,2
LB_2127:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2132
	btr r12,6
	clc
	jmp LB_2133
LB_2132:
	bts r12,6
	stc
LB_2133:
	mov r9,rcx
	bt r12,6
	jc LB_2130
	btr r12,3
	jmp LB_2131
LB_2130:
	bts r12,3
LB_2131:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2136
	btr r12,6
	clc
	jmp LB_2137
LB_2136:
	bts r12,6
	stc
LB_2137:
	mov r10,rcx
	bt r12,6
	jc LB_2134
	btr r12,4
	jmp LB_2135
LB_2134:
	bts r12,4
LB_2135:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2138:
	cmp r15,0
	jz LB_2139
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2138
LB_2139:
; _f1575 %_1806 ⊢ %_1808 : %_1808
 ; {>  %_1807~4':(_p1432)◂((_p1440)◂(_stg)) %_1805~2':_p1435 %_1806~3':(_p1432)◂((_p1439)◂(_stg)) %_1774~0':_r64 }
; _f1575 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2146
	btr r12,0
	jmp LB_2147
LB_2146:
	bts r12,0
LB_2147:
	call NS_E_1575
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2148
	btr r12,1
	jmp LB_2149
LB_2148:
	bts r12,1
LB_2149:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2144
	btr r12,4
	clc
	jmp LB_2145
LB_2144:
	bts r12,4
	stc
LB_2145:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2142
	btr r12,2
	clc
	jmp LB_2143
LB_2142:
	bts r12,2
	stc
LB_2143:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2140
	btr r12,0
	clc
	jmp LB_2141
LB_2140:
	bts r12,0
	stc
LB_2141:
	add rsp,32
; _f1594 %_1807 ⊢ %_1809 : %_1809
 ; {>  %_1807~4':(_p1432)◂((_p1440)◂(_stg)) %_1805~2':_p1435 %_1774~0':_r64 %_1808~1':_stg }
; _f1594 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2156
	btr r12,0
	jmp LB_2157
LB_2156:
	bts r12,0
LB_2157:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2158
	btr r12,3
	jmp LB_2159
LB_2158:
	bts r12,3
LB_2159:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2154
	btr r12,2
	clc
	jmp LB_2155
LB_2154:
	bts r12,2
	stc
LB_2155:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2152
	btr r12,1
	clc
	jmp LB_2153
LB_2152:
	bts r12,1
	stc
LB_2153:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2150
	btr r12,0
	clc
	jmp LB_2151
LB_2150:
	bts r12,0
	stc
LB_2151:
	add rsp,32
; _f1534 %_1805 ⊢ %_1810 : %_1810
 ; {>  %_1805~2':_p1435 %_1809~3':_stg %_1774~0':_r64 %_1808~1':_stg }
; _f1534 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2166
	btr r12,0
	jmp LB_2167
LB_2166:
	bts r12,0
LB_2167:
	call NS_E_1534
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2168
	btr r12,2
	jmp LB_2169
LB_2168:
	bts r12,2
LB_2169:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2164
	btr r12,3
	clc
	jmp LB_2165
LB_2164:
	bts r12,3
	stc
LB_2165:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2162
	btr r12,1
	clc
	jmp LB_2163
LB_2162:
	bts r12,1
	stc
LB_2163:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2160
	btr r12,0
	clc
	jmp LB_2161
LB_2160:
	bts r12,0
	stc
LB_2161:
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
LB_2170:
	cmp rax,0
	jz LB_2171
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2170
LB_2171:
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
; ∎ { %_1811 %_1815 }
 ; {>  %_1814~3':_stg %_1811~0':_r64 %_1812~2':_stg %_1815~4':_stg %_1813~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2172
	mov rdi,r9
	call dlt
LB_2172:
	bt r12,2
	jc LB_2173
	mov rdi,r8
	call dlt
LB_2173:
	bt r12,1
	jc LB_2174
	mov rdi,r14
	call dlt
LB_2174:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2175
	btr r12,1
	jmp LB_2176
LB_2175:
	bts r12,1
LB_2176:
	ret
MTC_LB_2122:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2177
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
	jnc LB_2178
	bt QWORD [rdi],0
	jc LB_2179
	btr r12,5
	clc
	jmp LB_2180
LB_2179:
	bts r12,5
	stc
LB_2180:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2178:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2183
	btr r12,6
	clc
	jmp LB_2184
LB_2183:
	bts r12,6
	stc
LB_2184:
	mov r8,rcx
	bt r12,6
	jc LB_2181
	btr r12,2
	jmp LB_2182
LB_2181:
	bts r12,2
LB_2182:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2187
	btr r12,6
	clc
	jmp LB_2188
LB_2187:
	bts r12,6
	stc
LB_2188:
	mov r9,rcx
	bt r12,6
	jc LB_2185
	btr r12,3
	jmp LB_2186
LB_2185:
	bts r12,3
LB_2186:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2191
	btr r12,6
	clc
	jmp LB_2192
LB_2191:
	bts r12,6
	stc
LB_2192:
	mov r10,rcx
	bt r12,6
	jc LB_2189
	btr r12,4
	jmp LB_2190
LB_2189:
	bts r12,4
LB_2190:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2193:
	cmp r15,0
	jz LB_2194
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2193
LB_2194:
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
LB_2195:
	cmp rax,0
	jz LB_2196
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2195
LB_2196:
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
; ∎ { %_1819 %_1820 }
 ; {>  %_1819~0':_r64 %_1818~4':(_lst)◂((_p1440)◂(_stg)) %_1817~3':(_lst)◂((_p1439)◂(_stg)) %_1816~2':(_lst)◂(_p1451) %_1820~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_2197
	mov rdi,r10
	call dlt
LB_2197:
	bt r12,3
	jc LB_2198
	mov rdi,r9
	call dlt
LB_2198:
	bt r12,2
	jc LB_2199
	mov rdi,r8
	call dlt
LB_2199:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2177:
NS_E_1773:
; 	|» { 0' 1' }
NS_E_RDI_1773:
MTC_LB_2200:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2201
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
	jnc LB_2202
	bt QWORD [rdi],0
	jc LB_2203
	btr r12,4
	clc
	jmp LB_2204
LB_2203:
	bts r12,4
	stc
LB_2204:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2202:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2207
	btr r12,5
	clc
	jmp LB_2208
LB_2207:
	bts r12,5
	stc
LB_2208:
	mov r8,r11
	bt r12,5
	jc LB_2205
	btr r12,2
	jmp LB_2206
LB_2205:
	bts r12,2
LB_2206:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2211
	btr r12,5
	clc
	jmp LB_2212
LB_2211:
	bts r12,5
	stc
LB_2212:
	mov r9,r11
	bt r12,5
	jc LB_2209
	btr r12,3
	jmp LB_2210
LB_2209:
	bts r12,3
LB_2210:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2213:
	cmp r15,0
	jz LB_2214
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2213
LB_2214:
; _f1821 { %_1754 %_1756 } ⊢ { %_1758 %_1759 } : { %_1758 %_1759 }
 ; {>  %_1754~0':_r64 %_1757~3':(_p1445)◂(_stg) %_1756~2':(_p1446)◂(_stg) }
; _f1821 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2217
	btr r12,1
	jmp LB_2218
LB_2217:
	bts r12,1
LB_2218:
	call NS_E_1821
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_2215
	btr r12,3
	clc
	jmp LB_2216
LB_2215:
	bts r12,3
	stc
LB_2216:
	add rsp,16
; _f1773 { %_1758 %_1757 } ⊢ { %_1760 %_1761 } : { %_1760 %_1761 }
 ; {>  %_1758~0':_r64 %_1757~3':(_p1445)◂(_stg) %_1759~1':_stg }
; _f1773 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2221
	btr r12,1
	jmp LB_2222
LB_2221:
	bts r12,1
LB_2222:
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2223
	btr r12,2
	jmp LB_2224
LB_2223:
	bts r12,2
LB_2224:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2219
	btr r12,1
	clc
	jmp LB_2220
LB_2219:
	bts r12,1
	stc
LB_2220:
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
; ∎ { %_1760 %_1764 }
 ; {>  %_1762~1':_stg %_1764~3':_stg %_1763~2':_stg %_1760~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_2225
	mov rdi,r14
	call dlt
LB_2225:
	bt r12,2
	jc LB_2226
	mov rdi,r8
	call dlt
LB_2226:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2227
	btr r12,1
	jmp LB_2228
LB_2227:
	bts r12,1
LB_2228:
	ret
MTC_LB_2201:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2229
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
	jnc LB_2230
	bt QWORD [rdi],0
	jc LB_2231
	btr r12,3
	clc
	jmp LB_2232
LB_2231:
	bts r12,3
	stc
LB_2232:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2230:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2233
	btr r12,2
	jmp LB_2234
LB_2233:
	bts r12,2
LB_2234:
LB_2235:
	cmp r15,0
	jz LB_2236
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2235
LB_2236:
; _f1861 { %_1754 %_1765 } ⊢ { %_1766 %_1767 } : { %_1766 %_1767 }
 ; {>  %_1754~0':_r64 %_1765~2':(_p1447)◂(_stg) }
; _f1861 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2237
	btr r12,1
	jmp LB_2238
LB_2237:
	bts r12,1
LB_2238:
	call NS_E_1861
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1766 %_1767 }
 ; {>  %_1767~1':_stg %_1766~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2229:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2239
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
	jnc LB_2240
	bt QWORD [rdi],0
	jc LB_2241
	btr r12,3
	clc
	jmp LB_2242
LB_2241:
	bts r12,3
	stc
LB_2242:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2240:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2243
	btr r12,2
	jmp LB_2244
LB_2243:
	bts r12,2
LB_2244:
LB_2245:
	cmp r15,0
	jz LB_2246
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2245
LB_2246:
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
LB_2247:
	cmp rax,0
	jz LB_2248
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2247
LB_2248:
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
; ∎ { %_1769 %_1770 }
 ; {>  %_1770~1':_stg %_1769~0':_r64 %_1768~2':(_p1432)◂((_p1439)◂(_stg)) }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2249
	mov rdi,r8
	call dlt
LB_2249:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2239:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2250
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
	jnc LB_2251
	bt QWORD [rdi],0
	jc LB_2252
	btr r12,2
	clc
	jmp LB_2253
LB_2252:
	bts r12,2
	stc
LB_2253:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2251:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2254:
	cmp r15,0
	jz LB_2255
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2254
LB_2255:
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
LB_2256:
	cmp rax,0
	jz LB_2257
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2256
LB_2257:
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
; ∎ { %_1771 %_1772 }
 ; {>  %_1771~0':_r64 %_1772~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2250:
NS_E_2576:
; 	|» { 0' 1' }
NS_E_RDI_2576:
MTC_LB_2577:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2578
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
	jnc LB_2579
	bt QWORD [rdi],0
	jc LB_2580
	btr r12,6
	clc
	jmp LB_2581
LB_2580:
	bts r12,6
	stc
LB_2581:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2579:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2594
	btr r12,7
	clc
	jmp LB_2595
LB_2594:
	bts r12,7
	stc
LB_2595:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2584
	btr r12,5
	clc
	jmp LB_2585
LB_2584:
	bts r12,5
	stc
LB_2585:
	mov r8,r11
	bt r12,5
	jc LB_2582
	btr r12,2
	jmp LB_2583
LB_2582:
	bts r12,2
LB_2583:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2588
	btr r12,5
	clc
	jmp LB_2589
LB_2588:
	bts r12,5
	stc
LB_2589:
	mov r9,r11
	bt r12,5
	jc LB_2586
	btr r12,3
	jmp LB_2587
LB_2586:
	bts r12,3
LB_2587:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_2592
	btr r12,5
	clc
	jmp LB_2593
LB_2592:
	bts r12,5
	stc
LB_2593:
	mov r10,r11
	bt r12,5
	jc LB_2590
	btr r12,4
	jmp LB_2591
LB_2590:
	bts r12,4
LB_2591:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2598
	btr r12,7
	clc
	jmp LB_2599
LB_2598:
	bts r12,7
	stc
LB_2599:
	mov r11,rdx
	bt r12,7
	jc LB_2596
	btr r12,5
	jmp LB_2597
LB_2596:
	bts r12,5
LB_2597:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2600:
	cmp r15,0
	jz LB_2601
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2600
LB_2601:
; _f1594 %_2559 ⊢ %_2562 : %_2562
 ; {>  %_2556~0':_r64 %_2561~5':(_lst)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) %_2560~4':(_p1445)◂(_stg) %_2559~3':(_p1432)◂((_p1440)◂(_stg)) %_2558~2':_stg }
; _f1594 3' ⊢ 1'
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
	jc LB_2610
	btr r12,0
	jmp LB_2611
LB_2610:
	bts r12,0
LB_2611:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2612
	btr r12,1
	jmp LB_2613
LB_2612:
	bts r12,1
LB_2613:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2608
	btr r12,5
	clc
	jmp LB_2609
LB_2608:
	bts r12,5
	stc
LB_2609:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2606
	btr r12,4
	clc
	jmp LB_2607
LB_2606:
	bts r12,4
	stc
LB_2607:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2604
	btr r12,2
	clc
	jmp LB_2605
LB_2604:
	bts r12,2
	stc
LB_2605:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2602
	btr r12,0
	clc
	jmp LB_2603
LB_2602:
	bts r12,0
	stc
LB_2603:
	add rsp,40
; _f2576 { %_2556 %_2561 } ⊢ { %_2563 %_2564 } : { %_2563 %_2564 }
 ; {>  %_2556~0':_r64 %_2561~5':(_lst)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) %_2560~4':(_p1445)◂(_stg) %_2558~2':_stg %_2562~1':_stg }
; _f2576 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2620
	btr r12,1
	jmp LB_2621
LB_2620:
	bts r12,1
LB_2621:
	call NS_E_2576
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2622
	btr r12,3
	jmp LB_2623
LB_2622:
	bts r12,3
LB_2623:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2618
	btr r12,4
	clc
	jmp LB_2619
LB_2618:
	bts r12,4
	stc
LB_2619:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2616
	btr r12,2
	clc
	jmp LB_2617
LB_2616:
	bts r12,2
	stc
LB_2617:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2614
	btr r12,1
	clc
	jmp LB_2615
LB_2614:
	bts r12,1
	stc
LB_2615:
	add rsp,32
; _f56 %_2563 ⊢ %_2565 : %_2565
 ; {>  %_2564~3':_stg %_2560~4':(_p1445)◂(_stg) %_2563~0':_r64 %_2558~2':_stg %_2562~1':_stg }
	add r13,1
; _f1773 { %_2565 %_2560 } ⊢ { %_2566 %_2567 } : { %_2566 %_2567 }
 ; {>  %_2564~3':_stg %_2560~4':(_p1445)◂(_stg) %_2558~2':_stg %_2565~0':_r64 %_2562~1':_stg }
; _f1773 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2630
	btr r12,1
	jmp LB_2631
LB_2630:
	bts r12,1
LB_2631:
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2632
	btr r12,4
	jmp LB_2633
LB_2632:
	bts r12,4
LB_2633:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2628
	btr r12,3
	clc
	jmp LB_2629
LB_2628:
	bts r12,3
	stc
LB_2629:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2626
	btr r12,2
	clc
	jmp LB_2627
LB_2626:
	bts r12,2
	stc
LB_2627:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2624
	btr r12,1
	clc
	jmp LB_2625
LB_2624:
	bts r12,1
	stc
LB_2625:
	add rsp,32
; _f55 %_2566 ⊢ %_2568 : %_2568
 ; {>  %_2567~4':_stg %_2564~3':_stg %_2566~0':_r64 %_2558~2':_stg %_2562~1':_stg }
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
LB_2634:
	cmp rax,0
	jz LB_2635
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2634
LB_2635:
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
; ∎ { %_2569 %_2574 }
 ; {>  %_2572~4':_stg %_2574~5':_stg %_2570~2':_stg %_2573~3':_stg %_2571~1':_stg %_2569~0':_r64 }
; 	∎ { 0' 5' }
	bt r12,4
	jc LB_2636
	mov rdi,r10
	call dlt
LB_2636:
	bt r12,2
	jc LB_2637
	mov rdi,r8
	call dlt
LB_2637:
	bt r12,3
	jc LB_2638
	mov rdi,r9
	call dlt
LB_2638:
	bt r12,1
	jc LB_2639
	mov rdi,r14
	call dlt
LB_2639:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2640
	btr r12,1
	jmp LB_2641
LB_2640:
	bts r12,1
LB_2641:
	ret
MTC_LB_2578:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2642
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
	jnc LB_2643
	bt QWORD [rdi],0
	jc LB_2644
	btr r12,2
	clc
	jmp LB_2645
LB_2644:
	bts r12,2
	stc
LB_2645:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2643:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2646:
	cmp r15,0
	jz LB_2647
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2646
LB_2647:
; 	» "" _ ⊢ 1' : %_2575
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2556 %_2575 }
 ; {>  %_2575~1':_stg %_2556~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2642:
NS_E_2555:
; 	|» { 0' 1' }
NS_E_RDI_2555:
MTC_LB_2648:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2649
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
	jnc LB_2650
	bt QWORD [rdi],0
	jc LB_2651
	btr r12,4
	clc
	jmp LB_2652
LB_2651:
	bts r12,4
	stc
LB_2652:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2650:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2655
	btr r12,5
	clc
	jmp LB_2656
LB_2655:
	bts r12,5
	stc
LB_2656:
	mov r8,r11
	bt r12,5
	jc LB_2653
	btr r12,2
	jmp LB_2654
LB_2653:
	bts r12,2
LB_2654:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2659
	btr r12,5
	clc
	jmp LB_2660
LB_2659:
	bts r12,5
	stc
LB_2660:
	mov r9,r11
	bt r12,5
	jc LB_2657
	btr r12,3
	jmp LB_2658
LB_2657:
	bts r12,3
LB_2658:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2661:
	cmp r15,0
	jz LB_2662
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2661
LB_2662:
; _f1594 %_2534 ⊢ %_2536 : %_2536
 ; {>  %_2535~3':(_p1445)◂(_stg) %_2534~2':(_p1432)◂((_p1440)◂(_stg)) %_2532~0':_r64 }
; _f1594 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2667
	btr r12,0
	jmp LB_2668
LB_2667:
	bts r12,0
LB_2668:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2669
	btr r12,1
	jmp LB_2670
LB_2669:
	bts r12,1
LB_2670:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2665
	btr r12,3
	clc
	jmp LB_2666
LB_2665:
	bts r12,3
	stc
LB_2666:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2663
	btr r12,0
	clc
	jmp LB_2664
LB_2663:
	bts r12,0
	stc
LB_2664:
	add rsp,24
; _f56 %_2532 ⊢ %_2537 : %_2537
 ; {>  %_2536~1':_stg %_2535~3':(_p1445)◂(_stg) %_2532~0':_r64 }
	add r13,1
; _f1773 { %_2537 %_2535 } ⊢ { %_2538 %_2539 } : { %_2538 %_2539 }
 ; {>  %_2536~1':_stg %_2535~3':(_p1445)◂(_stg) %_2537~0':_r64 }
; _f1773 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2673
	btr r12,1
	jmp LB_2674
LB_2673:
	bts r12,1
LB_2674:
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2675
	btr r12,2
	jmp LB_2676
LB_2675:
	bts r12,2
LB_2676:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2671
	btr r12,1
	clc
	jmp LB_2672
LB_2671:
	bts r12,1
	stc
LB_2672:
	add rsp,16
; _f55 %_2538 ⊢ %_2540 : %_2540
 ; {>  %_2536~1':_stg %_2539~2':_stg %_2538~0':_r64 }
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
; ∎ { %_2540 %_2543 }
 ; {>  %_2540~0':_r64 %_2542~2':_stg %_2541~1':_stg %_2543~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2677
	mov rdi,r8
	call dlt
LB_2677:
	bt r12,1
	jc LB_2678
	mov rdi,r14
	call dlt
LB_2678:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2679
	btr r12,1
	jmp LB_2680
LB_2679:
	bts r12,1
LB_2680:
	ret
MTC_LB_2649:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2681
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
	jnc LB_2682
	bt QWORD [rdi],0
	jc LB_2683
	btr r12,3
	clc
	jmp LB_2684
LB_2683:
	bts r12,3
	stc
LB_2684:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2682:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2685
	btr r12,2
	jmp LB_2686
LB_2685:
	bts r12,2
LB_2686:
LB_2687:
	cmp r15,0
	jz LB_2688
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2687
LB_2688:
; _f1534 %_2544 ⊢ %_2545 : %_2545
 ; {>  %_2544~2':_p1435 %_2532~0':_r64 }
; _f1534 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2691
	btr r12,0
	jmp LB_2692
LB_2691:
	bts r12,0
LB_2692:
	call NS_E_1534
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2693
	btr r12,1
	jmp LB_2694
LB_2693:
	bts r12,1
LB_2694:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2689
	btr r12,0
	clc
	jmp LB_2690
LB_2689:
	bts r12,0
	stc
LB_2690:
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
; ∎ { %_2532 %_2547 }
 ; {>  %_2547~2':_stg %_2546~1':_stg %_2532~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2695
	mov rdi,r14
	call dlt
LB_2695:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2696
	btr r12,1
	jmp LB_2697
LB_2696:
	bts r12,1
LB_2697:
	ret
MTC_LB_2681:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2698
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
	jnc LB_2699
	bt QWORD [rdi],0
	jc LB_2700
	btr r12,3
	clc
	jmp LB_2701
LB_2700:
	bts r12,3
	stc
LB_2701:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2699:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2702
	btr r12,2
	jmp LB_2703
LB_2702:
	bts r12,2
LB_2703:
LB_2704:
	cmp r15,0
	jz LB_2705
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2704
LB_2705:
; _f56 %_2532 ⊢ %_2549 : %_2549
 ; {>  %_2532~0':_r64 %_2548~2':(_p1445)◂(_stg) }
	add r13,1
; _f1773 { %_2549 %_2548 } ⊢ { %_2550 %_2551 } : { %_2550 %_2551 }
 ; {>  %_2549~0':_r64 %_2548~2':(_p1445)◂(_stg) }
; _f1773 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2706
	btr r12,1
	jmp LB_2707
LB_2706:
	bts r12,1
LB_2707:
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2550 ⊢ %_2552 : %_2552
 ; {>  %_2551~1':_stg %_2550~0':_r64 }
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
; ∎ { %_2552 %_2554 }
 ; {>  %_2553~1':_stg %_2552~0':_r64 %_2554~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2708
	mov rdi,r14
	call dlt
LB_2708:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2709
	btr r12,1
	jmp LB_2710
LB_2709:
	bts r12,1
LB_2710:
	ret
MTC_LB_2698:
NS_E_2531:
; 	|» 0'
NS_E_RDI_2531:
MTC_LB_2711:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2712
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
	jnc LB_2713
	bt QWORD [rdi],0
	jc LB_2714
	btr r12,3
	clc
	jmp LB_2715
LB_2714:
	bts r12,3
	stc
LB_2715:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2713:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2718
	btr r12,4
	clc
	jmp LB_2719
LB_2718:
	bts r12,4
	stc
LB_2719:
	mov r14,r10
	bt r12,4
	jc LB_2716
	btr r12,1
	jmp LB_2717
LB_2716:
	bts r12,1
LB_2717:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2722
	btr r12,4
	clc
	jmp LB_2723
LB_2722:
	bts r12,4
	stc
LB_2723:
	mov r8,r10
	bt r12,4
	jc LB_2720
	btr r12,2
	jmp LB_2721
LB_2720:
	bts r12,2
LB_2721:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2724:
	cmp r15,0
	jz LB_2725
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2724
LB_2725:
; _f2521 %_2523 ⊢ %_2525 : %_2525
 ; {>  %_2524~2':(_lst)◂(_p1490) %_2523~1':_p1490 }
; _f2521 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2728
	btr r12,0
	jmp LB_2729
LB_2728:
	bts r12,0
LB_2729:
	call NS_E_2521
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2726
	btr r12,2
	clc
	jmp LB_2727
LB_2726:
	bts r12,2
	stc
LB_2727:
	add rsp,16
; _f2531 %_2524 ⊢ %_2526 : %_2526
 ; {>  %_2524~2':(_lst)◂(_p1490) %_2525~0':_stg }
; _f2531 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2732
	btr r12,0
	jmp LB_2733
LB_2732:
	bts r12,0
LB_2733:
	call NS_E_2531
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2734
	btr r12,1
	jmp LB_2735
LB_2734:
	bts r12,1
LB_2735:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2730
	btr r12,0
	clc
	jmp LB_2731
LB_2730:
	bts r12,0
	stc
LB_2731:
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
; ∎ %_2529
 ; {>  %_2529~2':_stg %_2527~0':_stg %_2528~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2736
	mov rdi,r13
	call dlt
LB_2736:
	bt r12,1
	jc LB_2737
	mov rdi,r14
	call dlt
LB_2737:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2738
	btr r12,0
	jmp LB_2739
LB_2738:
	bts r12,0
LB_2739:
	ret
MTC_LB_2712:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2740
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
	jnc LB_2741
	bt QWORD [rdi],0
	jc LB_2742
	btr r12,1
	clc
	jmp LB_2743
LB_2742:
	bts r12,1
	stc
LB_2743:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2741:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2744:
	cmp r15,0
	jz LB_2745
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2744
LB_2745:
; 	» "" _ ⊢ 0' : %_2530
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2530
 ; {>  %_2530~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2740:
NS_E_2521:
; 	|» 0'
NS_E_RDI_2521:
MTC_LB_2746:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2747
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
	jnc LB_2748
	bt QWORD [rdi],0
	jc LB_2749
	btr r12,2
	clc
	jmp LB_2750
LB_2749:
	bts r12,2
	stc
LB_2750:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2748:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2751
	btr r12,1
	jmp LB_2752
LB_2751:
	bts r12,1
LB_2752:
LB_2753:
	cmp r15,0
	jz LB_2754
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2753
LB_2754:
; _f2531 %_2498 ⊢ %_2499 : %_2499
 ; {>  %_2498~1':(_lst)◂(_p1490) }
; _f2531 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2755
	btr r12,0
	jmp LB_2756
LB_2755:
	bts r12,0
LB_2756:
	call NS_E_2531
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
; ∎ %_2501
 ; {>  %_2500~0':_stg %_2501~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2757
	mov rdi,r13
	call dlt
LB_2757:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2758
	btr r12,0
	jmp LB_2759
LB_2758:
	bts r12,0
LB_2759:
	ret
MTC_LB_2747:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2760
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
	jnc LB_2761
	bt QWORD [rdi],0
	jc LB_2762
	btr r12,3
	clc
	jmp LB_2763
LB_2762:
	bts r12,3
	stc
LB_2763:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2761:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2766
	btr r12,4
	clc
	jmp LB_2767
LB_2766:
	bts r12,4
	stc
LB_2767:
	mov r14,r10
	bt r12,4
	jc LB_2764
	btr r12,1
	jmp LB_2765
LB_2764:
	bts r12,1
LB_2765:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2770
	btr r12,4
	clc
	jmp LB_2771
LB_2770:
	bts r12,4
	stc
LB_2771:
	mov r8,r10
	bt r12,4
	jc LB_2768
	btr r12,2
	jmp LB_2769
LB_2768:
	bts r12,2
LB_2769:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2772:
	cmp r15,0
	jz LB_2773
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2772
LB_2773:
; _f2521 %_2502 ⊢ %_2504 : %_2504
 ; {>  %_2502~1':_p1490 %_2503~2':_p1490 }
; _f2521 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2776
	btr r12,0
	jmp LB_2777
LB_2776:
	bts r12,0
LB_2777:
	call NS_E_2521
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2774
	btr r12,2
	clc
	jmp LB_2775
LB_2774:
	bts r12,2
	stc
LB_2775:
	add rsp,16
; _f2521 %_2503 ⊢ %_2505 : %_2505
 ; {>  %_2503~2':_p1490 %_2504~0':_stg }
; _f2521 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2780
	btr r12,0
	jmp LB_2781
LB_2780:
	bts r12,0
LB_2781:
	call NS_E_2521
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2782
	btr r12,1
	jmp LB_2783
LB_2782:
	bts r12,1
LB_2783:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2778
	btr r12,0
	clc
	jmp LB_2779
LB_2778:
	bts r12,0
	stc
LB_2779:
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
; ∎ %_2508
 ; {>  %_2507~1':_stg %_2508~2':_stg %_2506~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_2784
	mov rdi,r14
	call dlt
LB_2784:
	bt r12,0
	jc LB_2785
	mov rdi,r13
	call dlt
LB_2785:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2786
	btr r12,0
	jmp LB_2787
LB_2786:
	bts r12,0
LB_2787:
	ret
MTC_LB_2760:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2788
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
	jnc LB_2789
	bt QWORD [rdi],0
	jc LB_2790
	btr r12,3
	clc
	jmp LB_2791
LB_2790:
	bts r12,3
	stc
LB_2791:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2789:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2794
	btr r12,4
	clc
	jmp LB_2795
LB_2794:
	bts r12,4
	stc
LB_2795:
	mov r14,r10
	bt r12,4
	jc LB_2792
	btr r12,1
	jmp LB_2793
LB_2792:
	bts r12,1
LB_2793:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2798
	btr r12,4
	clc
	jmp LB_2799
LB_2798:
	bts r12,4
	stc
LB_2799:
	mov r8,r10
	bt r12,4
	jc LB_2796
	btr r12,2
	jmp LB_2797
LB_2796:
	bts r12,2
LB_2797:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2800:
	cmp r15,0
	jz LB_2801
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2800
LB_2801:
; _f2521 %_2509 ⊢ %_2511 : %_2511
 ; {>  %_2509~1':_p1490 %_2510~2':_p1490 }
; _f2521 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2804
	btr r12,0
	jmp LB_2805
LB_2804:
	bts r12,0
LB_2805:
	call NS_E_2521
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2802
	btr r12,2
	clc
	jmp LB_2803
LB_2802:
	bts r12,2
	stc
LB_2803:
	add rsp,16
; _f2521 %_2510 ⊢ %_2512 : %_2512
 ; {>  %_2511~0':_stg %_2510~2':_p1490 }
; _f2521 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2808
	btr r12,0
	jmp LB_2809
LB_2808:
	bts r12,0
LB_2809:
	call NS_E_2521
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2810
	btr r12,1
	jmp LB_2811
LB_2810:
	bts r12,1
LB_2811:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2806
	btr r12,0
	clc
	jmp LB_2807
LB_2806:
	bts r12,0
	stc
LB_2807:
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
; ∎ %_2515
 ; {>  %_2515~2':_stg %_2513~0':_stg %_2514~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2812
	mov rdi,r13
	call dlt
LB_2812:
	bt r12,1
	jc LB_2813
	mov rdi,r14
	call dlt
LB_2813:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2814
	btr r12,0
	jmp LB_2815
LB_2814:
	bts r12,0
LB_2815:
	ret
MTC_LB_2788:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2816
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
	jnc LB_2817
	bt QWORD [rdi],0
	jc LB_2818
	btr r12,2
	clc
	jmp LB_2819
LB_2818:
	bts r12,2
	stc
LB_2819:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2817:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2820
	btr r12,1
	jmp LB_2821
LB_2820:
	bts r12,1
LB_2821:
LB_2822:
	cmp r15,0
	jz LB_2823
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2822
LB_2823:
; _f1398 %_2516 ⊢ %_2517 : %_2517
 ; {>  %_2516~1':_p1387 }
; _f1398 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2824
	btr r12,0
	jmp LB_2825
LB_2824:
	bts r12,0
LB_2825:
	call NS_E_1398
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2517
 ; {>  %_2517~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2816:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2826
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
	jnc LB_2827
	bt QWORD [rdi],0
	jc LB_2828
	btr r12,2
	clc
	jmp LB_2829
LB_2828:
	bts r12,2
	stc
LB_2829:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2827:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2830
	btr r12,1
	jmp LB_2831
LB_2830:
	bts r12,1
LB_2831:
LB_2832:
	cmp r15,0
	jz LB_2833
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2832
LB_2833:
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
; ∎ %_2520
 ; {>  %_2520~0':_stg %_2519~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_2834
	mov rdi,r14
	call dlt
LB_2834:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2826:
NS_E_2496:
; 	|» { 0' 1' }
NS_E_RDI_2496:
MTC_LB_2835:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2836
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
	jnc LB_2837
	bt QWORD [rdi],0
	jc LB_2838
	btr r12,5
	clc
	jmp LB_2839
LB_2838:
	bts r12,5
	stc
LB_2839:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2837:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2848
	btr r12,6
	clc
	jmp LB_2849
LB_2848:
	bts r12,6
	stc
LB_2849:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2842
	btr r12,4
	clc
	jmp LB_2843
LB_2842:
	bts r12,4
	stc
LB_2843:
	mov r8,r10
	bt r12,4
	jc LB_2840
	btr r12,2
	jmp LB_2841
LB_2840:
	bts r12,2
LB_2841:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2846
	btr r12,4
	clc
	jmp LB_2847
LB_2846:
	bts r12,4
	stc
LB_2847:
	mov r9,r10
	bt r12,4
	jc LB_2844
	btr r12,3
	jmp LB_2845
LB_2844:
	bts r12,3
LB_2845:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2852
	btr r12,6
	clc
	jmp LB_2853
LB_2852:
	bts r12,6
	stc
LB_2853:
	mov r10,rcx
	bt r12,6
	jc LB_2850
	btr r12,4
	jmp LB_2851
LB_2850:
	bts r12,4
LB_2851:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2854:
	cmp r15,0
	jz LB_2855
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2854
LB_2855:
; _f2496 { %_2482 %_2486 } ⊢ { %_2487 %_2488 } : { %_2487 %_2488 }
 ; {>  %_2485~3':_p1490 %_2484~2':_stg %_2482~0':_r64 %_2486~4':(_lst)◂({ _stg _p1490 }) }
; _f2496 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2860
	btr r12,1
	jmp LB_2861
LB_2860:
	bts r12,1
LB_2861:
	call NS_E_2496
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2858
	btr r12,3
	clc
	jmp LB_2859
LB_2858:
	bts r12,3
	stc
LB_2859:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2856
	btr r12,2
	clc
	jmp LB_2857
LB_2856:
	bts r12,2
	stc
LB_2857:
	add rsp,24
; _f2521 %_2485 ⊢ %_2489 : %_2489
 ; {>  %_2485~3':_p1490 %_2488~1':_stg %_2484~2':_stg %_2487~0':_r64 }
; _f2521 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2868
	btr r12,0
	jmp LB_2869
LB_2868:
	bts r12,0
LB_2869:
	call NS_E_2521
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2870
	btr r12,3
	jmp LB_2871
LB_2870:
	bts r12,3
LB_2871:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2866
	btr r12,2
	clc
	jmp LB_2867
LB_2866:
	bts r12,2
	stc
LB_2867:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2864
	btr r12,1
	clc
	jmp LB_2865
LB_2864:
	bts r12,1
	stc
LB_2865:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2862
	btr r12,0
	clc
	jmp LB_2863
LB_2862:
	bts r12,0
	stc
LB_2863:
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
LB_2872:
	cmp rax,0
	jz LB_2873
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2872
LB_2873:
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
; ∎ { %_2490 %_2494 }
 ; {>  %_2492~3':_stg %_2494~4':_stg %_2490~0':_r64 %_2493~1':_stg %_2491~2':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2874
	mov rdi,r9
	call dlt
LB_2874:
	bt r12,1
	jc LB_2875
	mov rdi,r14
	call dlt
LB_2875:
	bt r12,2
	jc LB_2876
	mov rdi,r8
	call dlt
LB_2876:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2877
	btr r12,1
	jmp LB_2878
LB_2877:
	bts r12,1
LB_2878:
	ret
MTC_LB_2836:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2879
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
	jnc LB_2880
	bt QWORD [rdi],0
	jc LB_2881
	btr r12,2
	clc
	jmp LB_2882
LB_2881:
	bts r12,2
	stc
LB_2882:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2880:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2883:
	cmp r15,0
	jz LB_2884
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2883
LB_2884:
; 	» "" _ ⊢ 1' : %_2495
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2482 %_2495 }
 ; {>  %_2495~1':_stg %_2482~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2879:
NS_E_2481:
; 	|» { 0' 1' }
NS_E_RDI_2481:
MTC_LB_2885:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2886
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
	jnc LB_2887
	bt QWORD [rdi],0
	jc LB_2888
	btr r12,3
	clc
	jmp LB_2889
LB_2888:
	bts r12,3
	stc
LB_2889:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2887:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2890
	btr r12,2
	jmp LB_2891
LB_2890:
	bts r12,2
LB_2891:
LB_2892:
	cmp r15,0
	jz LB_2893
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2892
LB_2893:
; _f56 %_2468 ⊢ %_2471 : %_2471
 ; {>  %_2470~2':(_lst)◂({ _stg _p1490 }) %_2468~0':_r64 }
	add r13,1
; _f2496 { %_2471 %_2470 } ⊢ { %_2472 %_2473 } : { %_2472 %_2473 }
 ; {>  %_2470~2':(_lst)◂({ _stg _p1490 }) %_2471~0':_r64 }
; _f2496 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2894
	btr r12,1
	jmp LB_2895
LB_2894:
	bts r12,1
LB_2895:
	call NS_E_2496
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2472 ⊢ %_2474 : %_2474
 ; {>  %_2473~1':_stg %_2472~0':_r64 }
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
; ∎ { %_2474 %_2475 }
 ; {>  %_2475~1':_stg %_2474~0':_r64 %_2476~2':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2896
	mov rdi,r8
	call dlt
LB_2896:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2886:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2897
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
	jnc LB_2898
	bt QWORD [rdi],0
	jc LB_2899
	btr r12,3
	clc
	jmp LB_2900
LB_2899:
	bts r12,3
	stc
LB_2900:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2898:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2901
	btr r12,2
	jmp LB_2902
LB_2901:
	bts r12,2
LB_2902:
LB_2903:
	cmp r15,0
	jz LB_2904
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2903
LB_2904:
; _f2521 %_2477 ⊢ %_2478 : %_2478
 ; {>  %_2468~0':_r64 %_2477~2':_p1490 }
; _f2521 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2907
	btr r12,0
	jmp LB_2908
LB_2907:
	bts r12,0
LB_2908:
	call NS_E_2521
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2909
	btr r12,1
	jmp LB_2910
LB_2909:
	bts r12,1
LB_2910:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2905
	btr r12,0
	clc
	jmp LB_2906
LB_2905:
	bts r12,0
	stc
LB_2906:
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
; ∎ { %_2468 %_2480 }
 ; {>  %_2479~1':_stg %_2468~0':_r64 %_2480~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2911
	mov rdi,r14
	call dlt
LB_2911:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2912
	btr r12,1
	jmp LB_2913
LB_2912:
	bts r12,1
LB_2913:
	ret
MTC_LB_2897:
NS_E_2467:
; 	|» 0'
NS_E_RDI_2467:
MTC_LB_2914:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2915
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
	jnc LB_2916
	bt QWORD [rdi],0
	jc LB_2917
	btr r12,3
	clc
	jmp LB_2918
LB_2917:
	bts r12,3
	stc
LB_2918:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2916:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2921
	btr r12,4
	clc
	jmp LB_2922
LB_2921:
	bts r12,4
	stc
LB_2922:
	mov r14,r10
	bt r12,4
	jc LB_2919
	btr r12,1
	jmp LB_2920
LB_2919:
	bts r12,1
LB_2920:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2925
	btr r12,4
	clc
	jmp LB_2926
LB_2925:
	bts r12,4
	stc
LB_2926:
	mov r8,r10
	bt r12,4
	jc LB_2923
	btr r12,2
	jmp LB_2924
LB_2923:
	bts r12,2
LB_2924:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2927:
	cmp r15,0
	jz LB_2928
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2927
LB_2928:
; _f2467 %_2462 ⊢ %_2463 : %_2463
 ; {>  %_2461~1':_p1488 %_2462~2':_p1487 }
; _f2467 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2931
	btr r12,0
	jmp LB_2932
LB_2931:
	bts r12,0
LB_2932:
	call NS_E_2467
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2929
	btr r12,1
	clc
	jmp LB_2930
LB_2929:
	bts r12,1
	stc
LB_2930:
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
; ∎ %_2465
 ; {>  %_2461~1':_p1488 %_2464~0':_stg %_2465~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_2933
	mov rdi,r14
	call dlt
LB_2933:
	bt r12,0
	jc LB_2934
	mov rdi,r13
	call dlt
LB_2934:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2935
	btr r12,0
	jmp LB_2936
LB_2935:
	bts r12,0
LB_2936:
	ret
MTC_LB_2915:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2937
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
	jnc LB_2938
	bt QWORD [rdi],0
	jc LB_2939
	btr r12,1
	clc
	jmp LB_2940
LB_2939:
	bts r12,1
	stc
LB_2940:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2938:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2941:
	cmp r15,0
	jz LB_2942
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2941
LB_2942:
; 	» "" _ ⊢ 0' : %_2466
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2466
 ; {>  %_2466~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2937:
NS_E_2459:
; 	|» { 0' 1' }
NS_E_RDI_2459:
MTC_LB_2943:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2944
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
	jnc LB_2945
	bt QWORD [rdi],0
	jc LB_2946
	btr r12,3
	clc
	jmp LB_2947
LB_2946:
	bts r12,3
	stc
LB_2947:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2945:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2948
	btr r12,2
	jmp LB_2949
LB_2948:
	bts r12,2
LB_2949:
LB_2950:
	cmp r15,0
	jz LB_2951
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2950
LB_2951:
; _f2467 %_2448 ⊢ %_2449 : %_2449
 ; {>  %_2446~0':t1079'(-1) %_2448~2':_p1487 }
; _f2467 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2954
	btr r12,0
	jmp LB_2955
LB_2954:
	bts r12,0
LB_2955:
	call NS_E_2467
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2956
	btr r12,1
	jmp LB_2957
LB_2956:
	bts r12,1
LB_2957:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2952
	btr r12,0
	clc
	jmp LB_2953
LB_2952:
	bts r12,0
	stc
LB_2953:
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
; ∎ { %_2446 %_2451 }
 ; {>  %_2450~1':_stg %_2451~2':_stg %_2446~0':t1079'(-1) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2958
	mov rdi,r14
	call dlt
LB_2958:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2959
	btr r12,1
	jmp LB_2960
LB_2959:
	bts r12,1
LB_2960:
	ret
MTC_LB_2944:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2961
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
	jnc LB_2962
	bt QWORD [rdi],0
	jc LB_2963
	btr r12,4
	clc
	jmp LB_2964
LB_2963:
	bts r12,4
	stc
LB_2964:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2962:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2967
	btr r12,5
	clc
	jmp LB_2968
LB_2967:
	bts r12,5
	stc
LB_2968:
	mov r8,r11
	bt r12,5
	jc LB_2965
	btr r12,2
	jmp LB_2966
LB_2965:
	bts r12,2
LB_2966:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2971
	btr r12,5
	clc
	jmp LB_2972
LB_2971:
	bts r12,5
	stc
LB_2972:
	mov r9,r11
	bt r12,5
	jc LB_2969
	btr r12,3
	jmp LB_2970
LB_2969:
	bts r12,3
LB_2970:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2973:
	cmp r15,0
	jz LB_2974
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2973
LB_2974:
; _f2459 { %_2446 %_2453 } ⊢ { %_2454 %_2455 } : { %_2454 %_2455 }
 ; {>  %_2446~0':t1079'(-1) %_2452~2':_p1488 %_2453~3':_p1486 }
; _f2459 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2977
	btr r12,1
	jmp LB_2978
LB_2977:
	bts r12,1
LB_2978:
	call NS_E_2459
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2975
	btr r12,2
	clc
	jmp LB_2976
LB_2975:
	bts r12,2
	stc
LB_2976:
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
; ∎ { %_2454 %_2457 }
 ; {>  %_2457~3':_stg %_2456~1':_stg %_2452~2':_p1488 %_2454~0':t1079'(-1) }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_2979
	mov rdi,r14
	call dlt
LB_2979:
	bt r12,2
	jc LB_2980
	mov rdi,r8
	call dlt
LB_2980:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2981
	btr r12,1
	jmp LB_2982
LB_2981:
	bts r12,1
LB_2982:
	ret
MTC_LB_2961:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2983
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
	jnc LB_2984
	bt QWORD [rdi],0
	jc LB_2985
	btr r12,2
	clc
	jmp LB_2986
LB_2985:
	bts r12,2
	stc
LB_2986:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2984:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2987:
	cmp r15,0
	jz LB_2988
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2987
LB_2988:
; 	» "" _ ⊢ 1' : %_2458
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2446 %_2458 }
 ; {>  %_2458~1':_stg %_2446~0':t1079'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2983:
NS_E_2445:
; 	|» { 0' 1' }
NS_E_RDI_2445:
MTC_LB_2989:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2990
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
	jnc LB_2991
	bt QWORD [rdi],0
	jc LB_2992
	btr r12,8
	clc
	jmp LB_2993
LB_2992:
	bts r12,8
	stc
LB_2993:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2991:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_2996
	btr r12,9
	clc
	jmp LB_2997
LB_2996:
	bts r12,9
	stc
LB_2997:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2994
	btr r12,2
	jmp LB_2995
LB_2994:
	bts r12,2
LB_2995:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_3000
	btr r12,9
	clc
	jmp LB_3001
LB_3000:
	bts r12,9
	stc
LB_3001:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2998
	btr r12,3
	jmp LB_2999
LB_2998:
	bts r12,3
LB_2999:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_3004
	btr r12,9
	clc
	jmp LB_3005
LB_3004:
	bts r12,9
	stc
LB_3005:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3002
	btr r12,4
	jmp LB_3003
LB_3002:
	bts r12,4
LB_3003:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_3008
	btr r12,9
	clc
	jmp LB_3009
LB_3008:
	bts r12,9
	stc
LB_3009:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3006
	btr r12,5
	jmp LB_3007
LB_3006:
	bts r12,5
LB_3007:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_3012
	btr r12,9
	clc
	jmp LB_3013
LB_3012:
	bts r12,9
	stc
LB_3013:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3010
	btr r12,6
	jmp LB_3011
LB_3010:
	bts r12,6
LB_3011:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_3016
	btr r12,9
	clc
	jmp LB_3017
LB_3016:
	bts r12,9
	stc
LB_3017:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3014
	btr r12,7
	jmp LB_3015
LB_3014:
	bts r12,7
LB_3015:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3018:
	cmp r15,0
	jz LB_3019
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3018
LB_3019:
; _f1594 %_2413 ⊢ %_2419 : %_2419
 ; {>  %_2414~3':(_p1445)◂(_stg) %_2415~4':_p1485 %_2413~2':(_p1432)◂((_p1440)◂(_stg)) %_2411~0':_r64 %_2418~7':_p1484 %_2416~5':_p1486 %_2417~6':(_opn)◂(_p1484) }
; _f1594 2' ⊢ 1'
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
	jc LB_3032
	btr r12,0
	jmp LB_3033
LB_3032:
	bts r12,0
LB_3033:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3034
	btr r12,1
	jmp LB_3035
LB_3034:
	bts r12,1
LB_3035:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_3030
	btr r12,7
	clc
	jmp LB_3031
LB_3030:
	bts r12,7
	stc
LB_3031:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3028
	btr r12,6
	clc
	jmp LB_3029
LB_3028:
	bts r12,6
	stc
LB_3029:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3026
	btr r12,5
	clc
	jmp LB_3027
LB_3026:
	bts r12,5
	stc
LB_3027:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3024
	btr r12,4
	clc
	jmp LB_3025
LB_3024:
	bts r12,4
	stc
LB_3025:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3022
	btr r12,3
	clc
	jmp LB_3023
LB_3022:
	bts r12,3
	stc
LB_3023:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3020
	btr r12,0
	clc
	jmp LB_3021
LB_3020:
	bts r12,0
	stc
LB_3021:
	add rsp,56
; _f56 %_2411 ⊢ %_2420 : %_2420
 ; {>  %_2414~3':(_p1445)◂(_stg) %_2419~1':_stg %_2415~4':_p1485 %_2411~0':_r64 %_2418~7':_p1484 %_2416~5':_p1486 %_2417~6':(_opn)◂(_p1484) }
	add r13,1
; _f1773 { %_2420 %_2414 } ⊢ { %_2421 %_2422 } : { %_2421 %_2422 }
 ; {>  %_2414~3':(_p1445)◂(_stg) %_2419~1':_stg %_2415~4':_p1485 %_2418~7':_p1484 %_2416~5':_p1486 %_2420~0':_r64 %_2417~6':(_opn)◂(_p1484) }
; _f1773 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_3046
	btr r12,1
	jmp LB_3047
LB_3046:
	bts r12,1
LB_3047:
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3048
	btr r12,2
	jmp LB_3049
LB_3048:
	bts r12,2
LB_3049:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_3044
	btr r12,7
	clc
	jmp LB_3045
LB_3044:
	bts r12,7
	stc
LB_3045:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_3042
	btr r12,6
	clc
	jmp LB_3043
LB_3042:
	bts r12,6
	stc
LB_3043:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_3040
	btr r12,5
	clc
	jmp LB_3041
LB_3040:
	bts r12,5
	stc
LB_3041:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3038
	btr r12,4
	clc
	jmp LB_3039
LB_3038:
	bts r12,4
	stc
LB_3039:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3036
	btr r12,1
	clc
	jmp LB_3037
LB_3036:
	bts r12,1
	stc
LB_3037:
	add rsp,48
; _f55 %_2421 ⊢ %_2423 : %_2423
 ; {>  %_2421~0':_r64 %_2419~1':_stg %_2415~4':_p1485 %_2418~7':_p1484 %_2416~5':_p1486 %_2422~2':_stg %_2417~6':(_opn)◂(_p1484) }
	sub r13,1
; _f2445 { %_2423 %_2418 } ⊢ { %_2424 %_2425 } : { %_2424 %_2425 }
 ; {>  %_2419~1':_stg %_2415~4':_p1485 %_2423~0':_r64 %_2418~7':_p1484 %_2416~5':_p1486 %_2422~2':_stg %_2417~6':(_opn)◂(_p1484) }
; _f2445 { 0' 7' } ⊢ { 0' 3' }
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
	jc LB_3060
	btr r12,1
	jmp LB_3061
LB_3060:
	bts r12,1
LB_3061:
	call NS_E_2445
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3062
	btr r12,3
	jmp LB_3063
LB_3062:
	bts r12,3
LB_3063:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3058
	btr r12,6
	clc
	jmp LB_3059
LB_3058:
	bts r12,6
	stc
LB_3059:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3056
	btr r12,5
	clc
	jmp LB_3057
LB_3056:
	bts r12,5
	stc
LB_3057:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3054
	btr r12,4
	clc
	jmp LB_3055
LB_3054:
	bts r12,4
	stc
LB_3055:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3052
	btr r12,2
	clc
	jmp LB_3053
LB_3052:
	bts r12,2
	stc
LB_3053:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3050
	btr r12,1
	clc
	jmp LB_3051
LB_3050:
	bts r12,1
	stc
LB_3051:
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
LB_3064:
	cmp rax,0
	jz LB_3065
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3064
LB_3065:
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
; ∎ { %_2426 %_2430 }
 ; {>  %_2415~4':_p1485 %_2426~0':_r64 %_2429~3':_stg %_2416~5':_p1486 %_2430~7':_stg %_2428~2':_stg %_2427~1':_stg %_2417~6':(_opn)◂(_p1484) }
; 	∎ { 0' 7' }
	bt r12,4
	jc LB_3066
	mov rdi,r10
	call dlt
LB_3066:
	bt r12,3
	jc LB_3067
	mov rdi,r9
	call dlt
LB_3067:
	bt r12,5
	jc LB_3068
	mov rdi,r11
	call dlt
LB_3068:
	bt r12,2
	jc LB_3069
	mov rdi,r8
	call dlt
LB_3069:
	bt r12,1
	jc LB_3070
	mov rdi,r14
	call dlt
LB_3070:
	bt r12,6
	jc LB_3071
	mov rdi,rcx
	call dlt
LB_3071:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_3072
	btr r12,1
	jmp LB_3073
LB_3072:
	bts r12,1
LB_3073:
	ret
MTC_LB_2990:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3074
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
	jnc LB_3075
	bt QWORD [rdi],0
	jc LB_3076
	btr r12,7
	clc
	jmp LB_3077
LB_3076:
	bts r12,7
	stc
LB_3077:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3075:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3080
	btr r12,8
	clc
	jmp LB_3081
LB_3080:
	bts r12,8
	stc
LB_3081:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3078
	btr r12,2
	jmp LB_3079
LB_3078:
	bts r12,2
LB_3079:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3084
	btr r12,8
	clc
	jmp LB_3085
LB_3084:
	bts r12,8
	stc
LB_3085:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3082
	btr r12,3
	jmp LB_3083
LB_3082:
	bts r12,3
LB_3083:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3088
	btr r12,8
	clc
	jmp LB_3089
LB_3088:
	bts r12,8
	stc
LB_3089:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3086
	btr r12,4
	jmp LB_3087
LB_3086:
	bts r12,4
LB_3087:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3092
	btr r12,8
	clc
	jmp LB_3093
LB_3092:
	bts r12,8
	stc
LB_3093:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3090
	btr r12,5
	jmp LB_3091
LB_3090:
	bts r12,5
LB_3091:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3096
	btr r12,8
	clc
	jmp LB_3097
LB_3096:
	bts r12,8
	stc
LB_3097:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3094
	btr r12,6
	jmp LB_3095
LB_3094:
	bts r12,6
LB_3095:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3098:
	cmp r15,0
	jz LB_3099
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3098
LB_3099:
; _f1594 %_2431 ⊢ %_2436 : %_2436
 ; {>  %_2435~6':(_opn)◂(_p1484) %_2432~3':(_p1445)◂(_stg) %_2411~0':_r64 %_2433~4':_p1485 %_2431~2':(_p1432)◂((_p1440)◂(_stg)) %_2434~5':_p1486 }
; _f1594 2' ⊢ 1'
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
	jc LB_3110
	btr r12,0
	jmp LB_3111
LB_3110:
	bts r12,0
LB_3111:
	call NS_E_1594
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3112
	btr r12,1
	jmp LB_3113
LB_3112:
	bts r12,1
LB_3113:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3108
	btr r12,6
	clc
	jmp LB_3109
LB_3108:
	bts r12,6
	stc
LB_3109:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3106
	btr r12,5
	clc
	jmp LB_3107
LB_3106:
	bts r12,5
	stc
LB_3107:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3104
	btr r12,4
	clc
	jmp LB_3105
LB_3104:
	bts r12,4
	stc
LB_3105:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3102
	btr r12,3
	clc
	jmp LB_3103
LB_3102:
	bts r12,3
	stc
LB_3103:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3100
	btr r12,0
	clc
	jmp LB_3101
LB_3100:
	bts r12,0
	stc
LB_3101:
	add rsp,48
; _f56 %_2411 ⊢ %_2437 : %_2437
 ; {>  %_2436~1':_stg %_2435~6':(_opn)◂(_p1484) %_2432~3':(_p1445)◂(_stg) %_2411~0':_r64 %_2433~4':_p1485 %_2434~5':_p1486 }
	add r13,1
; _f1773 { %_2437 %_2432 } ⊢ { %_2438 %_2439 } : { %_2438 %_2439 }
 ; {>  %_2437~0':_r64 %_2436~1':_stg %_2435~6':(_opn)◂(_p1484) %_2432~3':(_p1445)◂(_stg) %_2433~4':_p1485 %_2434~5':_p1486 }
; _f1773 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_3122
	btr r12,1
	jmp LB_3123
LB_3122:
	bts r12,1
LB_3123:
	call NS_E_1773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3124
	btr r12,2
	jmp LB_3125
LB_3124:
	bts r12,2
LB_3125:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_3120
	btr r12,6
	clc
	jmp LB_3121
LB_3120:
	bts r12,6
	stc
LB_3121:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_3118
	btr r12,5
	clc
	jmp LB_3119
LB_3118:
	bts r12,5
	stc
LB_3119:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3116
	btr r12,4
	clc
	jmp LB_3117
LB_3116:
	bts r12,4
	stc
LB_3117:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3114
	btr r12,1
	clc
	jmp LB_3115
LB_3114:
	bts r12,1
	stc
LB_3115:
	add rsp,40
; _f55 %_2438 ⊢ %_2440 : %_2440
 ; {>  %_2438~0':_r64 %_2436~1':_stg %_2435~6':(_opn)◂(_p1484) %_2433~4':_p1485 %_2439~2':_stg %_2434~5':_p1486 }
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
LB_3126:
	cmp rax,0
	jz LB_3127
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3126
LB_3127:
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
; ∎ { %_2441 %_2444 }
 ; {>  %_2444~3':_stg %_2443~2':_stg %_2435~6':(_opn)◂(_p1484) %_2433~4':_p1485 %_2441~0':_r64 %_2442~1':_stg %_2434~5':_p1486 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3128
	mov rdi,r8
	call dlt
LB_3128:
	bt r12,6
	jc LB_3129
	mov rdi,rcx
	call dlt
LB_3129:
	bt r12,4
	jc LB_3130
	mov rdi,r10
	call dlt
LB_3130:
	bt r12,1
	jc LB_3131
	mov rdi,r14
	call dlt
LB_3131:
	bt r12,5
	jc LB_3132
	mov rdi,r11
	call dlt
LB_3132:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3133
	btr r12,1
	jmp LB_3134
LB_3133:
	bts r12,1
LB_3134:
	ret
MTC_LB_3074:
NS_E_2410:
; 	|» { 0' 1' }
NS_E_RDI_2410:
MTC_LB_3135:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3136
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
	jnc LB_3137
	bt QWORD [rdi],0
	jc LB_3138
	btr r12,7
	clc
	jmp LB_3139
LB_3138:
	bts r12,7
	stc
LB_3139:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3137:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3142
	btr r12,8
	clc
	jmp LB_3143
LB_3142:
	bts r12,8
	stc
LB_3143:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3140
	btr r12,2
	jmp LB_3141
LB_3140:
	bts r12,2
LB_3141:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3146
	btr r12,8
	clc
	jmp LB_3147
LB_3146:
	bts r12,8
	stc
LB_3147:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3144
	btr r12,3
	jmp LB_3145
LB_3144:
	bts r12,3
LB_3145:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3150
	btr r12,8
	clc
	jmp LB_3151
LB_3150:
	bts r12,8
	stc
LB_3151:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3148
	btr r12,4
	jmp LB_3149
LB_3148:
	bts r12,4
LB_3149:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3154
	btr r12,8
	clc
	jmp LB_3155
LB_3154:
	bts r12,8
	stc
LB_3155:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3152
	btr r12,5
	jmp LB_3153
LB_3152:
	bts r12,5
LB_3153:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3158
	btr r12,8
	clc
	jmp LB_3159
LB_3158:
	bts r12,8
	stc
LB_3159:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3156
	btr r12,6
	jmp LB_3157
LB_3156:
	bts r12,6
LB_3157:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3160:
	cmp r15,0
	jz LB_3161
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3160
LB_3161:
; _f2410 { %_2392 %_2398 } ⊢ { %_2399 %_2400 } : { %_2399 %_2400 }
 ; {>  %_2394~2':(_opn)◂(_stg) %_2396~4':_p1486 %_2395~3':_p1485 %_2392~0':_r64 %_2397~5':(_opn)◂(_p1483) %_2398~6':_p1483 }
; _f2410 { 0' 6' } ⊢ { 0' 1' }
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
	jc LB_3170
	btr r12,1
	jmp LB_3171
LB_3170:
	bts r12,1
LB_3171:
	call NS_E_2410
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3168
	btr r12,5
	clc
	jmp LB_3169
LB_3168:
	bts r12,5
	stc
LB_3169:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3166
	btr r12,4
	clc
	jmp LB_3167
LB_3166:
	bts r12,4
	stc
LB_3167:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3164
	btr r12,3
	clc
	jmp LB_3165
LB_3164:
	bts r12,3
	stc
LB_3165:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3162
	btr r12,2
	clc
	jmp LB_3163
LB_3162:
	bts r12,2
	stc
LB_3163:
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
LB_3172:
	cmp rax,0
	jz LB_3173
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3172
LB_3173:
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
; ∎ { %_2401 %_2403 }
 ; {>  %_2403~6':_stg %_2394~2':(_opn)◂(_stg) %_2396~4':_p1486 %_2395~3':_p1485 %_2402~1':_stg %_2401~0':_r64 %_2397~5':(_opn)◂(_p1483) }
; 	∎ { 0' 6' }
	bt r12,2
	jc LB_3174
	mov rdi,r8
	call dlt
LB_3174:
	bt r12,4
	jc LB_3175
	mov rdi,r10
	call dlt
LB_3175:
	bt r12,3
	jc LB_3176
	mov rdi,r9
	call dlt
LB_3176:
	bt r12,1
	jc LB_3177
	mov rdi,r14
	call dlt
LB_3177:
	bt r12,5
	jc LB_3178
	mov rdi,r11
	call dlt
LB_3178:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_3179
	btr r12,1
	jmp LB_3180
LB_3179:
	bts r12,1
LB_3180:
	ret
MTC_LB_3136:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3181
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
	jnc LB_3182
	bt QWORD [rdi],0
	jc LB_3183
	btr r12,6
	clc
	jmp LB_3184
LB_3183:
	bts r12,6
	stc
LB_3184:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3182:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_3187
	btr r12,7
	clc
	jmp LB_3188
LB_3187:
	bts r12,7
	stc
LB_3188:
	mov r8,rdx
	bt r12,7
	jc LB_3185
	btr r12,2
	jmp LB_3186
LB_3185:
	bts r12,2
LB_3186:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_3191
	btr r12,7
	clc
	jmp LB_3192
LB_3191:
	bts r12,7
	stc
LB_3192:
	mov r9,rdx
	bt r12,7
	jc LB_3189
	btr r12,3
	jmp LB_3190
LB_3189:
	bts r12,3
LB_3190:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_3195
	btr r12,7
	clc
	jmp LB_3196
LB_3195:
	bts r12,7
	stc
LB_3196:
	mov r10,rdx
	bt r12,7
	jc LB_3193
	btr r12,4
	jmp LB_3194
LB_3193:
	bts r12,4
LB_3194:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_3199
	btr r12,7
	clc
	jmp LB_3200
LB_3199:
	bts r12,7
	stc
LB_3200:
	mov r11,rdx
	bt r12,7
	jc LB_3197
	btr r12,5
	jmp LB_3198
LB_3197:
	bts r12,5
LB_3198:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3201:
	cmp r15,0
	jz LB_3202
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3201
LB_3202:
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
LB_3203:
	cmp rax,0
	jz LB_3204
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3203
LB_3204:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_2408 %_2409 }
 ; {>  %_2405~3':_p1485 %_2404~2':(_opn)◂(_stg) %_2406~4':_p1486 %_2408~0':_r64 %_2407~5':(_opn)◂(_p1483) %_2409~1':_stg }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_3205
	mov rdi,r9
	call dlt
LB_3205:
	bt r12,2
	jc LB_3206
	mov rdi,r8
	call dlt
LB_3206:
	bt r12,4
	jc LB_3207
	mov rdi,r10
	call dlt
LB_3207:
	bt r12,5
	jc LB_3208
	mov rdi,r11
	call dlt
LB_3208:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3181:
NS_E_2391:
; 	|» { 0' 1' }
NS_E_RDI_2391:
MTC_LB_3209:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3210
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
	jnc LB_3211
	bt QWORD [rdi],0
	jc LB_3212
	btr r12,3
	clc
	jmp LB_3213
LB_3212:
	bts r12,3
	stc
LB_3213:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3211:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3214
	btr r12,2
	jmp LB_3215
LB_3214:
	bts r12,2
LB_3215:
LB_3216:
	cmp r15,0
	jz LB_3217
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3216
LB_3217:
; _f2410 { %_2383 %_2385 } ⊢ { %_2386 %_2387 } : { %_2386 %_2387 }
 ; {>  %_2385~2':_p1483 %_2383~0':_r64 }
; _f2410 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3218
	btr r12,1
	jmp LB_3219
LB_3218:
	bts r12,1
LB_3219:
	call NS_E_2410
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2386 %_2387 }
 ; {>  %_2386~0':_r64 %_2387~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3210:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3220
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
	jnc LB_3221
	bt QWORD [rdi],0
	jc LB_3222
	btr r12,3
	clc
	jmp LB_3223
LB_3222:
	bts r12,3
	stc
LB_3223:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3221:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3224
	btr r12,2
	jmp LB_3225
LB_3224:
	bts r12,2
LB_3225:
LB_3226:
	cmp r15,0
	jz LB_3227
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3226
LB_3227:
; _f2445 { %_2383 %_2388 } ⊢ { %_2389 %_2390 } : { %_2389 %_2390 }
 ; {>  %_2388~2':_p1484 %_2383~0':_r64 }
; _f2445 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3228
	btr r12,1
	jmp LB_3229
LB_3228:
	bts r12,1
LB_3229:
	call NS_E_2445
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2389 %_2390 }
 ; {>  %_2389~0':_r64 %_2390~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3220:
NS_E_2382:
; 	|» { 0' 1' }
NS_E_RDI_2382:
MTC_LB_3230:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3231
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
	jnc LB_3232
	bt QWORD [rdi],0
	jc LB_3233
	btr r12,5
	clc
	jmp LB_3234
LB_3233:
	bts r12,5
	stc
LB_3234:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3232:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3243
	btr r12,6
	clc
	jmp LB_3244
LB_3243:
	bts r12,6
	stc
LB_3244:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3237
	btr r12,4
	clc
	jmp LB_3238
LB_3237:
	bts r12,4
	stc
LB_3238:
	mov r8,r10
	bt r12,4
	jc LB_3235
	btr r12,2
	jmp LB_3236
LB_3235:
	bts r12,2
LB_3236:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3241
	btr r12,4
	clc
	jmp LB_3242
LB_3241:
	bts r12,4
	stc
LB_3242:
	mov r9,r10
	bt r12,4
	jc LB_3239
	btr r12,3
	jmp LB_3240
LB_3239:
	bts r12,3
LB_3240:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3247
	btr r12,6
	clc
	jmp LB_3248
LB_3247:
	bts r12,6
	stc
LB_3248:
	mov r10,rcx
	bt r12,6
	jc LB_3245
	btr r12,4
	jmp LB_3246
LB_3245:
	bts r12,4
LB_3246:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3249:
	cmp r15,0
	jz LB_3250
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3249
LB_3250:
; _f56 %_2365 ⊢ %_2370 : %_2370
 ; {>  %_2367~2':_stg %_2365~0':_r64 %_2368~3':_p1482 %_2369~4':(_lst)◂({ _stg _p1482 }) }
	add r13,1
; _f2391 { %_2370 %_2368 } ⊢ { %_2371 %_2372 } : { %_2371 %_2372 }
 ; {>  %_2367~2':_stg %_2370~0':_r64 %_2368~3':_p1482 %_2369~4':(_lst)◂({ _stg _p1482 }) }
; _f2391 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3255
	btr r12,1
	jmp LB_3256
LB_3255:
	bts r12,1
LB_3256:
	call NS_E_2391
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3253
	btr r12,4
	clc
	jmp LB_3254
LB_3253:
	bts r12,4
	stc
LB_3254:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3251
	btr r12,2
	clc
	jmp LB_3252
LB_3251:
	bts r12,2
	stc
LB_3252:
	add rsp,24
; _f55 %_2371 ⊢ %_2373 : %_2373
 ; {>  %_2367~2':_stg %_2372~1':_stg %_2371~0':_r64 %_2369~4':(_lst)◂({ _stg _p1482 }) }
	sub r13,1
; _f2382 { %_2373 %_2369 } ⊢ { %_2374 %_2375 } : { %_2374 %_2375 }
 ; {>  %_2367~2':_stg %_2372~1':_stg %_2373~0':_r64 %_2369~4':(_lst)◂({ _stg _p1482 }) }
; _f2382 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3261
	btr r12,1
	jmp LB_3262
LB_3261:
	bts r12,1
LB_3262:
	call NS_E_2382
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3263
	btr r12,3
	jmp LB_3264
LB_3263:
	bts r12,3
LB_3264:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3259
	btr r12,2
	clc
	jmp LB_3260
LB_3259:
	bts r12,2
	stc
LB_3260:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3257
	btr r12,1
	clc
	jmp LB_3258
LB_3257:
	bts r12,1
	stc
LB_3258:
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
LB_3265:
	cmp rax,0
	jz LB_3266
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3265
LB_3266:
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
; ∎ { %_2376 %_2380 }
 ; {>  %_2378~1':_stg %_2379~3':_stg %_2380~4':_stg %_2377~2':_stg %_2376~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_3267
	mov rdi,r14
	call dlt
LB_3267:
	bt r12,3
	jc LB_3268
	mov rdi,r9
	call dlt
LB_3268:
	bt r12,2
	jc LB_3269
	mov rdi,r8
	call dlt
LB_3269:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3270
	btr r12,1
	jmp LB_3271
LB_3270:
	bts r12,1
LB_3271:
	ret
MTC_LB_3231:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3272
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
	jnc LB_3273
	bt QWORD [rdi],0
	jc LB_3274
	btr r12,2
	clc
	jmp LB_3275
LB_3274:
	bts r12,2
	stc
LB_3275:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3273:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3276:
	cmp r15,0
	jz LB_3277
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3276
LB_3277:
; 	» "" _ ⊢ 1' : %_2381
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2365 %_2381 }
 ; {>  %_2381~1':_stg %_2365~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3272:
NS_E_2364:
; 	|» { 0' 1' }
NS_E_RDI_2364:
MTC_LB_3278:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3279
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
	jnc LB_3280
	bt QWORD [rdi],0
	jc LB_3281
	btr r12,5
	clc
	jmp LB_3282
LB_3281:
	bts r12,5
	stc
LB_3282:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3280:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3291
	btr r12,6
	clc
	jmp LB_3292
LB_3291:
	bts r12,6
	stc
LB_3292:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3285
	btr r12,4
	clc
	jmp LB_3286
LB_3285:
	bts r12,4
	stc
LB_3286:
	mov r8,r10
	bt r12,4
	jc LB_3283
	btr r12,2
	jmp LB_3284
LB_3283:
	bts r12,2
LB_3284:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3289
	btr r12,4
	clc
	jmp LB_3290
LB_3289:
	bts r12,4
	stc
LB_3290:
	mov r9,r10
	bt r12,4
	jc LB_3287
	btr r12,3
	jmp LB_3288
LB_3287:
	bts r12,3
LB_3288:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3295
	btr r12,6
	clc
	jmp LB_3296
LB_3295:
	bts r12,6
	stc
LB_3296:
	mov r10,rcx
	bt r12,6
	jc LB_3293
	btr r12,4
	jmp LB_3294
LB_3293:
	bts r12,4
LB_3294:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3297:
	cmp r15,0
	jz LB_3298
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3297
LB_3298:
; _f38 %_2340 ⊢ %_2345 : %_2345
 ; {>  %_2344~4':(_lst)◂({ _stg _p1481 }) %_2342~2':_stg %_2343~3':_p1481 %_2340~0':_r64 }
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
	jc LB_3303
	btr r12,4
	clc
	jmp LB_3304
LB_3303:
	bts r12,4
	stc
LB_3304:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3301
	btr r12,3
	clc
	jmp LB_3302
LB_3301:
	bts r12,3
	stc
LB_3302:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3299
	btr r12,2
	clc
	jmp LB_3300
LB_3299:
	bts r12,2
	stc
LB_3300:
	add rsp,32
; _f2364 { %_2345 %_2344 } ⊢ { %_2346 %_2347 } : { %_2346 %_2347 }
 ; {>  %_2345~0':_r64 %_2344~4':(_lst)◂({ _stg _p1481 }) %_2342~2':_stg %_2343~3':_p1481 }
; _f2364 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3309
	btr r12,1
	jmp LB_3310
LB_3309:
	bts r12,1
LB_3310:
	call NS_E_2364
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3307
	btr r12,3
	clc
	jmp LB_3308
LB_3307:
	bts r12,3
	stc
LB_3308:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3305
	btr r12,2
	clc
	jmp LB_3306
LB_3305:
	bts r12,2
	stc
LB_3306:
	add rsp,24
MTC_LB_3311:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3312
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
	jnc LB_3313
	bt QWORD [rdi],0
	jc LB_3314
	btr r12,5
	clc
	jmp LB_3315
LB_3314:
	bts r12,5
	stc
LB_3315:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3313:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_3316
	btr r12,4
	jmp LB_3317
LB_3316:
	bts r12,4
LB_3317:
LB_3318:
	cmp r15,0
	jz LB_3319
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3318
LB_3319:
; _f56 %_2346 ⊢ %_2349 : %_2349
 ; {>  %_2348~4':(_lst)◂({ _stg _p1490 }) %_2346~0':_r64 %_2347~1':_stg %_2342~2':_stg }
	add r13,1
; _f2496 { %_2349 %_2348 } ⊢ { %_2350 %_2351 } : { %_2350 %_2351 }
 ; {>  %_2348~4':(_lst)◂({ _stg _p1490 }) %_2347~1':_stg %_2349~0':_r64 %_2342~2':_stg }
; _f2496 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3324
	btr r12,1
	jmp LB_3325
LB_3324:
	bts r12,1
LB_3325:
	call NS_E_2496
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3326
	btr r12,3
	jmp LB_3327
LB_3326:
	bts r12,3
LB_3327:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3322
	btr r12,2
	clc
	jmp LB_3323
LB_3322:
	bts r12,2
	stc
LB_3323:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3320
	btr r12,1
	clc
	jmp LB_3321
LB_3320:
	bts r12,1
	stc
LB_3321:
	add rsp,24
; _f55 %_2350 ⊢ %_2352 : %_2352
 ; {>  %_2350~0':_r64 %_2347~1':_stg %_2351~3':_stg %_2342~2':_stg }
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
LB_3328:
	cmp rax,0
	jz LB_3329
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3328
LB_3329:
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
; ∎ { %_2353 %_2357 }
 ; {>  %_2357~4':_stg %_2356~1':_stg %_2355~3':_stg %_2353~0':_r64 %_2354~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_3330
	mov rdi,r14
	call dlt
LB_3330:
	bt r12,3
	jc LB_3331
	mov rdi,r9
	call dlt
LB_3331:
	bt r12,2
	jc LB_3332
	mov rdi,r8
	call dlt
LB_3332:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3333
	btr r12,1
	jmp LB_3334
LB_3333:
	bts r12,1
LB_3334:
	ret
MTC_LB_3312:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3335
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
	jnc LB_3336
	bt QWORD [rdi],0
	jc LB_3337
	btr r12,5
	clc
	jmp LB_3338
LB_3337:
	bts r12,5
	stc
LB_3338:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3336:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_3339
	btr r12,4
	jmp LB_3340
LB_3339:
	bts r12,4
LB_3340:
LB_3341:
	cmp r15,0
	jz LB_3342
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3341
LB_3342:
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
LB_3343:
	cmp rax,0
	jz LB_3344
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3343
LB_3344:
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
; ∎ { %_2359 %_2362 }
 ; {>  %_2358~4':_p1490 %_2360~2':_stg %_2359~0':_r64 %_2361~1':_stg %_2362~3':_stg }
; 	∎ { 0' 3' }
	bt r12,4
	jc LB_3345
	mov rdi,r10
	call dlt
LB_3345:
	bt r12,2
	jc LB_3346
	mov rdi,r8
	call dlt
LB_3346:
	bt r12,1
	jc LB_3347
	mov rdi,r14
	call dlt
LB_3347:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3348
	btr r12,1
	jmp LB_3349
LB_3348:
	bts r12,1
LB_3349:
	ret
MTC_LB_3335:
MTC_LB_3279:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3350
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
	jnc LB_3351
	bt QWORD [rdi],0
	jc LB_3352
	btr r12,2
	clc
	jmp LB_3353
LB_3352:
	bts r12,2
	stc
LB_3353:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3351:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3354:
	cmp r15,0
	jz LB_3355
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3354
LB_3355:
; 	» "" _ ⊢ 1' : %_2363
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2340 %_2363 }
 ; {>  %_2340~0':_r64 %_2363~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3350:
NS_E_2339:
; 	|» { 0' 1' }
NS_E_RDI_2339:
MTC_LB_3356:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3357
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
	jnc LB_3358
	bt QWORD [rdi],0
	jc LB_3359
	btr r12,4
	clc
	jmp LB_3360
LB_3359:
	bts r12,4
	stc
LB_3360:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3358:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3363
	btr r12,5
	clc
	jmp LB_3364
LB_3363:
	bts r12,5
	stc
LB_3364:
	mov r8,r11
	bt r12,5
	jc LB_3361
	btr r12,2
	jmp LB_3362
LB_3361:
	bts r12,2
LB_3362:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3367
	btr r12,5
	clc
	jmp LB_3368
LB_3367:
	bts r12,5
	stc
LB_3368:
	mov r9,r11
	bt r12,5
	jc LB_3365
	btr r12,3
	jmp LB_3366
LB_3365:
	bts r12,3
LB_3366:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3369:
	cmp r15,0
	jz LB_3370
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3369
LB_3370:
MTC_LB_3371:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3372
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
	jnc LB_3373
	bt QWORD [rdi],0
	jc LB_3374
	btr r12,4
	clc
	jmp LB_3375
LB_3374:
	bts r12,4
	stc
LB_3375:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3373:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3376
	btr r12,1
	jmp LB_3377
LB_3376:
	bts r12,1
LB_3377:
LB_3378:
	cmp r15,0
	jz LB_3379
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3378
LB_3379:
; _f56 %_2271 ⊢ %_2276 : %_2276
 ; {>  %_2271~0':_r64 %_2275~1':(_lst)◂(_p1478) %_2273~2':_stg }
	add r13,1
; _f2270 { %_2276 %_2275 } ⊢ { %_2277 %_2278 } : { %_2277 %_2278 }
 ; {>  %_2276~0':_r64 %_2275~1':(_lst)◂(_p1478) %_2273~2':_stg }
; _f2270 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2270
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3380
	btr r12,2
	clc
	jmp LB_3381
LB_3380:
	bts r12,2
	stc
LB_3381:
	add rsp,16
; _f55 %_2277 ⊢ %_2279 : %_2279
 ; {>  %_2277~0':_r64 %_2278~1':_stg %_2273~2':_stg }
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
LB_3382:
	cmp rax,0
	jz LB_3383
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3382
LB_3383:
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
LB_3384:
	cmp rax,0
	jz LB_3385
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3384
LB_3385:
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
; ∎ { %_2280 %_2283 }
 ; {>  %_2283~3':_stg %_2281~2':_stg %_2280~0':_r64 %_2282~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3386
	mov rdi,r8
	call dlt
LB_3386:
	bt r12,1
	jc LB_3387
	mov rdi,r14
	call dlt
LB_3387:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3388
	btr r12,1
	jmp LB_3389
LB_3388:
	bts r12,1
LB_3389:
	ret
MTC_LB_3372:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3390
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
	jnc LB_3391
	bt QWORD [rdi],0
	jc LB_3392
	btr r12,4
	clc
	jmp LB_3393
LB_3392:
	bts r12,4
	stc
LB_3393:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3391:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3394
	btr r12,1
	jmp LB_3395
LB_3394:
	bts r12,1
LB_3395:
LB_3396:
	cmp r15,0
	jz LB_3397
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3396
LB_3397:
; _f1398 %_2284 ⊢ %_2285 : %_2285
 ; {>  %_2284~1':_p1387 %_2271~0':_r64 %_2273~2':_stg }
; _f1398 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3402
	btr r12,0
	jmp LB_3403
LB_3402:
	bts r12,0
LB_3403:
	call NS_E_1398
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3404
	btr r12,1
	jmp LB_3405
LB_3404:
	bts r12,1
LB_3405:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3400
	btr r12,2
	clc
	jmp LB_3401
LB_3400:
	bts r12,2
	stc
LB_3401:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3398
	btr r12,0
	clc
	jmp LB_3399
LB_3398:
	bts r12,0
	stc
LB_3399:
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
LB_3406:
	cmp rax,0
	jz LB_3407
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3406
LB_3407:
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
; ∎ { %_2286 %_2289 }
 ; {>  %_2286~0':_r64 %_2287~2':_stg %_2289~3':_stg %_2288~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3408
	mov rdi,r8
	call dlt
LB_3408:
	bt r12,1
	jc LB_3409
	mov rdi,r14
	call dlt
LB_3409:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3410
	btr r12,1
	jmp LB_3411
LB_3410:
	bts r12,1
LB_3411:
	ret
MTC_LB_3390:
MTC_LB_3357:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3412
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
	jnc LB_3413
	bt QWORD [rdi],0
	jc LB_3414
	btr r12,3
	clc
	jmp LB_3415
LB_3414:
	bts r12,3
	stc
LB_3415:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3413:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3416
	btr r12,2
	jmp LB_3417
LB_3416:
	bts r12,2
LB_3417:
LB_3418:
	cmp r15,0
	jz LB_3419
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3418
LB_3419:
; _f56 %_2271 ⊢ %_2291 : %_2291
 ; {>  %_2271~0':_r64 %_2290~2':(_lst)◂({ _stg _p1482 }) }
	add r13,1
; _f2382 { %_2291 %_2290 } ⊢ { %_2292 %_2293 } : { %_2292 %_2293 }
 ; {>  %_2291~0':_r64 %_2290~2':(_lst)◂({ _stg _p1482 }) }
; _f2382 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3420
	btr r12,1
	jmp LB_3421
LB_3420:
	bts r12,1
LB_3421:
	call NS_E_2382
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2292 ⊢ %_2294 : %_2294
 ; {>  %_2292~0':_r64 %_2293~1':_stg }
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
LB_3422:
	cmp rax,0
	jz LB_3423
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3422
LB_3423:
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
; ∎ { %_2295 %_2297 }
 ; {>  %_2297~2':_stg %_2295~0':_r64 %_2296~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3424
	mov rdi,r14
	call dlt
LB_3424:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3425
	btr r12,1
	jmp LB_3426
LB_3425:
	bts r12,1
LB_3426:
	ret
MTC_LB_3412:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3427
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
	jnc LB_3428
	bt QWORD [rdi],0
	jc LB_3429
	btr r12,4
	clc
	jmp LB_3430
LB_3429:
	bts r12,4
	stc
LB_3430:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3428:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3433
	btr r12,5
	clc
	jmp LB_3434
LB_3433:
	bts r12,5
	stc
LB_3434:
	mov r8,r11
	bt r12,5
	jc LB_3431
	btr r12,2
	jmp LB_3432
LB_3431:
	bts r12,2
LB_3432:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3437
	btr r12,5
	clc
	jmp LB_3438
LB_3437:
	bts r12,5
	stc
LB_3438:
	mov r9,r11
	bt r12,5
	jc LB_3435
	btr r12,3
	jmp LB_3436
LB_3435:
	bts r12,3
LB_3436:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3439:
	cmp r15,0
	jz LB_3440
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3439
LB_3440:
; _f56 %_2271 ⊢ %_2300 : %_2300
 ; {>  %_2298~2':_stg %_2271~0':_r64 %_2299~3':_p1480 }
	add r13,1
; _f2555 { %_2300 %_2299 } ⊢ { %_2301 %_2302 } : { %_2301 %_2302 }
 ; {>  %_2300~0':_r64 %_2298~2':_stg %_2299~3':_p1480 }
; _f2555 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3443
	btr r12,1
	jmp LB_3444
LB_3443:
	bts r12,1
LB_3444:
	call NS_E_2555
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3441
	btr r12,2
	clc
	jmp LB_3442
LB_3441:
	bts r12,2
	stc
LB_3442:
	add rsp,16
; _f55 %_2301 ⊢ %_2303 : %_2303
 ; {>  %_2298~2':_stg %_2302~1':_stg %_2301~0':_r64 }
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
LB_3445:
	cmp rax,0
	jz LB_3446
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3445
LB_3446:
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
; ∎ { %_2304 %_2307 }
 ; {>  %_2304~0':_r64 %_2306~1':_stg %_2307~3':_stg %_2305~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3447
	mov rdi,r14
	call dlt
LB_3447:
	bt r12,2
	jc LB_3448
	mov rdi,r8
	call dlt
LB_3448:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3449
	btr r12,1
	jmp LB_3450
LB_3449:
	bts r12,1
LB_3450:
	ret
MTC_LB_3427:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_3451
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
	jnc LB_3452
	bt QWORD [rdi],0
	jc LB_3453
	btr r12,3
	clc
	jmp LB_3454
LB_3453:
	bts r12,3
	stc
LB_3454:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3452:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3455
	btr r12,2
	jmp LB_3456
LB_3455:
	bts r12,2
LB_3456:
LB_3457:
	cmp r15,0
	jz LB_3458
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3457
LB_3458:
; _f56 %_2271 ⊢ %_2309 : %_2309
 ; {>  %_2271~0':_r64 %_2308~2':(_lst)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) }
	add r13,1
; _f2576 { %_2309 %_2308 } ⊢ { %_2310 %_2311 } : { %_2310 %_2311 }
 ; {>  %_2309~0':_r64 %_2308~2':(_lst)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) }
; _f2576 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3459
	btr r12,1
	jmp LB_3460
LB_3459:
	bts r12,1
LB_3460:
	call NS_E_2576
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2310 ⊢ %_2312 : %_2312
 ; {>  %_2311~1':_stg %_2310~0':_r64 }
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
LB_3461:
	cmp rax,0
	jz LB_3462
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3461
LB_3462:
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
; ∎ { %_2313 %_2315 }
 ; {>  %_2313~0':_r64 %_2315~2':_stg %_2314~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3463
	mov rdi,r14
	call dlt
LB_3463:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3464
	btr r12,1
	jmp LB_3465
LB_3464:
	bts r12,1
LB_3465:
	ret
MTC_LB_3451:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_3466
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
	jnc LB_3467
	bt QWORD [rdi],0
	jc LB_3468
	btr r12,4
	clc
	jmp LB_3469
LB_3468:
	bts r12,4
	stc
LB_3469:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3467:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3472
	btr r12,5
	clc
	jmp LB_3473
LB_3472:
	bts r12,5
	stc
LB_3473:
	mov r8,r11
	bt r12,5
	jc LB_3470
	btr r12,2
	jmp LB_3471
LB_3470:
	bts r12,2
LB_3471:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3476
	btr r12,5
	clc
	jmp LB_3477
LB_3476:
	bts r12,5
	stc
LB_3477:
	mov r9,r11
	bt r12,5
	jc LB_3474
	btr r12,3
	jmp LB_3475
LB_3474:
	bts r12,3
LB_3475:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3478:
	cmp r15,0
	jz LB_3479
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3478
LB_3479:
MTC_LB_3480:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3481
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
	jnc LB_3482
	bt QWORD [rdi],0
	jc LB_3483
	btr r12,4
	clc
	jmp LB_3484
LB_3483:
	bts r12,4
	stc
LB_3484:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3482:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3485
	btr r12,1
	jmp LB_3486
LB_3485:
	bts r12,1
LB_3486:
LB_3487:
	cmp r15,0
	jz LB_3488
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3487
LB_3488:
; _f56 %_2271 ⊢ %_2319 : %_2319
 ; {>  %_2316~2':_stg %_2271~0':_r64 %_2318~1':(_lst)◂({ _stg _p1490 }) }
	add r13,1
; _f2496 { %_2319 %_2318 } ⊢ { %_2320 %_2321 } : { %_2320 %_2321 }
 ; {>  %_2316~2':_stg %_2319~0':_r64 %_2318~1':(_lst)◂({ _stg _p1490 }) }
; _f2496 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2496
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3489
	btr r12,2
	clc
	jmp LB_3490
LB_3489:
	bts r12,2
	stc
LB_3490:
	add rsp,16
; _f55 %_2320 ⊢ %_2322 : %_2322
 ; {>  %_2316~2':_stg %_2320~0':_r64 %_2321~1':_stg }
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
LB_3491:
	cmp rax,0
	jz LB_3492
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3491
LB_3492:
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
; ∎ { %_2323 %_2326 }
 ; {>  %_2325~1':_stg %_2326~3':_stg %_2323~0':_r64 %_2324~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3493
	mov rdi,r14
	call dlt
LB_3493:
	bt r12,2
	jc LB_3494
	mov rdi,r8
	call dlt
LB_3494:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3495
	btr r12,1
	jmp LB_3496
LB_3495:
	bts r12,1
LB_3496:
	ret
MTC_LB_3481:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3497
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
	jnc LB_3498
	bt QWORD [rdi],0
	jc LB_3499
	btr r12,4
	clc
	jmp LB_3500
LB_3499:
	bts r12,4
	stc
LB_3500:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3498:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3501
	btr r12,1
	jmp LB_3502
LB_3501:
	bts r12,1
LB_3502:
LB_3503:
	cmp r15,0
	jz LB_3504
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3503
LB_3504:
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
LB_3505:
	cmp rax,0
	jz LB_3506
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3505
LB_3506:
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
; ∎ { %_2328 %_2330 }
 ; {>  %_2327~1':_p1490 %_2330~3':_stg %_2328~0':_r64 %_2329~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3507
	mov rdi,r14
	call dlt
LB_3507:
	bt r12,2
	jc LB_3508
	mov rdi,r8
	call dlt
LB_3508:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3509
	btr r12,1
	jmp LB_3510
LB_3509:
	bts r12,1
LB_3510:
	ret
MTC_LB_3497:
MTC_LB_3466:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_3511
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
	jnc LB_3512
	bt QWORD [rdi],0
	jc LB_3513
	btr r12,3
	clc
	jmp LB_3514
LB_3513:
	bts r12,3
	stc
LB_3514:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3512:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3515
	btr r12,2
	jmp LB_3516
LB_3515:
	bts r12,2
LB_3516:
LB_3517:
	cmp r15,0
	jz LB_3518
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3517
LB_3518:
; _f56 %_2271 ⊢ %_2332 : %_2332
 ; {>  %_2271~0':_r64 %_2331~2':(_lst)◂({ _stg _p1481 }) }
	add r13,1
; _f2364 { %_2332 %_2331 } ⊢ { %_2333 %_2334 } : { %_2333 %_2334 }
 ; {>  %_2332~0':_r64 %_2331~2':(_lst)◂({ _stg _p1481 }) }
; _f2364 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3519
	btr r12,1
	jmp LB_3520
LB_3519:
	bts r12,1
LB_3520:
	call NS_E_2364
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2333 ⊢ %_2335 : %_2335
 ; {>  %_2333~0':_r64 %_2334~1':_stg }
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
LB_3521:
	cmp rax,0
	jz LB_3522
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3521
LB_3522:
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
; ∎ { %_2336 %_2338 }
 ; {>  %_2338~2':_stg %_2337~1':_stg %_2336~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3523
	mov rdi,r14
	call dlt
LB_3523:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3524
	btr r12,1
	jmp LB_3525
LB_3524:
	bts r12,1
LB_3525:
	ret
MTC_LB_3511:
NS_E_2270:
; 	|» { 0' 1' }
NS_E_RDI_2270:
MTC_LB_3526:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3527
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
	jnc LB_3528
	bt QWORD [rdi],0
	jc LB_3529
	btr r12,2
	clc
	jmp LB_3530
LB_3529:
	bts r12,2
	stc
LB_3530:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3528:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3531:
	cmp r15,0
	jz LB_3532
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3531
LB_3532:
; 	» "" _ ⊢ 1' : %_2260
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2258 %_2260 }
 ; {>  %_2260~1':_stg %_2258~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3527:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3533
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
	jnc LB_3534
	bt QWORD [rdi],0
	jc LB_3535
	btr r12,4
	clc
	jmp LB_3536
LB_3535:
	bts r12,4
	stc
LB_3536:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3534:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3539
	btr r12,5
	clc
	jmp LB_3540
LB_3539:
	bts r12,5
	stc
LB_3540:
	mov r8,r11
	bt r12,5
	jc LB_3537
	btr r12,2
	jmp LB_3538
LB_3537:
	bts r12,2
LB_3538:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3543
	btr r12,5
	clc
	jmp LB_3544
LB_3543:
	bts r12,5
	stc
LB_3544:
	mov r9,r11
	bt r12,5
	jc LB_3541
	btr r12,3
	jmp LB_3542
LB_3541:
	bts r12,3
LB_3542:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3545:
	cmp r15,0
	jz LB_3546
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3545
LB_3546:
; _f2339 { %_2258 %_2261 } ⊢ { %_2263 %_2264 } : { %_2263 %_2264 }
 ; {>  %_2261~2':_p1478 %_2262~3':(_lst)◂(_p1478) %_2258~0':_r64 }
; _f2339 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3549
	btr r12,1
	jmp LB_3550
LB_3549:
	bts r12,1
LB_3550:
	call NS_E_2339
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_3547
	btr r12,3
	clc
	jmp LB_3548
LB_3547:
	bts r12,3
	stc
LB_3548:
	add rsp,16
; _f2270 { %_2263 %_2262 } ⊢ { %_2265 %_2266 } : { %_2265 %_2266 }
 ; {>  %_2264~1':_stg %_2262~3':(_lst)◂(_p1478) %_2263~0':_r64 }
; _f2270 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3553
	btr r12,1
	jmp LB_3554
LB_3553:
	bts r12,1
LB_3554:
	call NS_E_2270
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3555
	btr r12,2
	jmp LB_3556
LB_3555:
	bts r12,2
LB_3556:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3551
	btr r12,1
	clc
	jmp LB_3552
LB_3551:
	bts r12,1
	stc
LB_3552:
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
; ∎ { %_2265 %_2269 }
 ; {>  %_2265~0':_r64 %_2267~1':_stg %_2268~2':_stg %_2269~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3557
	mov rdi,r14
	call dlt
LB_3557:
	bt r12,2
	jc LB_3558
	mov rdi,r8
	call dlt
LB_3558:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3559
	btr r12,1
	jmp LB_3560
LB_3559:
	bts r12,1
LB_3560:
	ret
MTC_LB_3533:
NS_E_3564:
NS_E_RDI_3564:
NS_E_3564_ETR_TBL:
NS_E_3564_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3668
	jmp LB_3669
LB_3668:
	jmp LB_3660
LB_3669:
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
	jc LB_3661
	btr r12,0
	clc
	jmp LB_3662
LB_3661:
	bts r12,0
	stc
LB_3662:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3657
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr1 |~ {  } ⊢ %_3568 : %_3568
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_3568
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_3568 ⊢ %_3569 : %_3569
 ; {>  %_3568~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3569
 ; {>  %_3569~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3655
	btr r12,3
	jmp LB_3656
LB_3655:
	bts r12,3
LB_3656:
	mov r8,0
	bts r12,2
	ret
LB_3657:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3659
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3658
LB_3659:
	add rsp,8
	ret
LB_3660:
	add rsp,16
	pop r14
LB_3658:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3684
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3676
LB_3684:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_3564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3689
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3690
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3690:
	jmp LB_3676
LB_3689:
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
	jc LB_3679
	btr r12,1
	clc
	jmp LB_3680
LB_3679:
	bts r12,1
	stc
LB_3680:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3677
	btr r12,0
	clc
	jmp LB_3678
LB_3677:
	bts r12,0
	stc
LB_3678:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3673
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_3571 ⊢ %_3572 : %_3572
 ; {>  %_3571~1':_r64 %_3570~0':_r64 }
	add r14,1
; _some %_3572 ⊢ %_3573 : %_3573
 ; {>  %_3570~0':_r64 %_3572~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_3573
 ; {>  %_3573~°0◂1':(_opn)◂(_r64) %_3570~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_3670
	mov rdi,r13
	call dlt
LB_3670:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_3671
	btr r12,3
	jmp LB_3672
LB_3671:
	bts r12,3
LB_3672:
	mov r8,0
	bts r12,2
	ret
LB_3673:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3675
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3674
LB_3675:
	add rsp,8
	ret
LB_3676:
	add rsp,32
	pop r14
LB_3674:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3565:
NS_E_RDI_3565:
NS_E_3565_ETR_TBL:
NS_E_3565_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_3707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_3707
	jmp LB_3708
LB_3707:
	jmp LB_3697
LB_3708:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3712
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3713
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3713:
	jmp LB_3697
LB_3712:
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
	jc LB_3700
	btr r12,1
	clc
	jmp LB_3701
LB_3700:
	bts r12,1
	stc
LB_3701:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3698
	btr r12,0
	clc
	jmp LB_3699
LB_3698:
	bts r12,0
	stc
LB_3699:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3694
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_3715
	btr r12,5
	jmp LB_3716
LB_3715:
	bts r12,5
LB_3716:
	mov r13,r14
	bt r12,1
	jc LB_3717
	btr r12,0
	jmp LB_3718
LB_3717:
	bts r12,0
LB_3718:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_3574 ⊢ %_3575 : %_3575
 ; {>  %_3574~0':_r64 }
	add r13,1
; _some %_3575 ⊢ %_3576 : %_3576
 ; {>  %_3575~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3576
 ; {>  %_3576~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3692
	btr r12,3
	jmp LB_3693
LB_3692:
	bts r12,3
LB_3693:
	mov r8,0
	bts r12,2
	ret
LB_3694:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3696
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3695
LB_3696:
	add rsp,8
	ret
LB_3697:
	add rsp,32
	pop r14
LB_3695:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_3734
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_3734
	jmp LB_3735
LB_3734:
	jmp LB_3724
LB_3735:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3739
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3740:
	jmp LB_3724
LB_3739:
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
	jc LB_3727
	btr r12,1
	clc
	jmp LB_3728
LB_3727:
	bts r12,1
	stc
LB_3728:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3725
	btr r12,0
	clc
	jmp LB_3726
LB_3725:
	bts r12,0
	stc
LB_3726:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3721
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_3742
	btr r12,5
	jmp LB_3743
LB_3742:
	bts r12,5
LB_3743:
	mov r13,r14
	bt r12,1
	jc LB_3744
	btr r12,0
	jmp LB_3745
LB_3744:
	bts r12,0
LB_3745:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_3577 ⊢ %_3578 : %_3578
 ; {>  %_3577~0':_r64 }
	add r13,1
; _some %_3578 ⊢ %_3579 : %_3579
 ; {>  %_3578~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3579
 ; {>  %_3579~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3719
	btr r12,3
	jmp LB_3720
LB_3719:
	bts r12,3
LB_3720:
	mov r8,0
	bts r12,2
	ret
LB_3721:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3723
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3722
LB_3723:
	add rsp,8
	ret
LB_3724:
	add rsp,32
	pop r14
LB_3722:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_3748
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_3580 : %_3580
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_3580
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_3580 ⊢ %_3581 : %_3581
 ; {>  %_3580~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3581
 ; {>  %_3581~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3746
	btr r12,3
	jmp LB_3747
LB_3746:
	bts r12,3
LB_3747:
	mov r8,0
	bts r12,2
	ret
LB_3748:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3750
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3749
LB_3750:
	add rsp,8
	ret
LB_3751:
	add rsp,0
	pop r14
LB_3749:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3566:
NS_E_RDI_3566:
NS_E_3566_ETR_TBL:
NS_E_3566_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3831
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3778
LB_3831:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_3839
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_3839
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_3839
	jmp LB_3840
LB_3839:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3837
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3837:
	jmp LB_3778
LB_3840:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3795
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3796
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3796:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3797
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3797:
	jmp LB_3779
LB_3795:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3807
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3807
	jmp LB_3808
LB_3807:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3803
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3803:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3804
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3804:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3805
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3805:
	jmp LB_3779
LB_3808:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_3567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3812
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3813
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3813:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3814
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3814:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3815
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3815:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3816:
	jmp LB_3779
LB_3812:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_3566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3821
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_3822
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_3822:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3823
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3823:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3824
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3824:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3825
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3825:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3826
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3826:
	jmp LB_3779
LB_3821:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_3790
	btr r12,5
	clc
	jmp LB_3791
LB_3790:
	bts r12,5
	stc
LB_3791:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3788
	btr r12,4
	clc
	jmp LB_3789
LB_3788:
	bts r12,4
	stc
LB_3789:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3786
	btr r12,3
	clc
	jmp LB_3787
LB_3786:
	bts r12,3
	stc
LB_3787:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3784
	btr r12,2
	clc
	jmp LB_3785
LB_3784:
	bts r12,2
	stc
LB_3785:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3782
	btr r12,1
	clc
	jmp LB_3783
LB_3782:
	bts r12,1
	stc
LB_3783:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3780
	btr r12,0
	clc
	jmp LB_3781
LB_3780:
	bts r12,0
	stc
LB_3781:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_3775
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_3841
	btr r12,6
	jmp LB_3842
LB_3841:
	bts r12,6
LB_3842:
	mov r8,r10
	bt r12,4
	jc LB_3843
	btr r12,2
	jmp LB_3844
LB_3843:
	bts r12,2
LB_3844:
	mov rdx,r14
	bt r12,1
	jc LB_3845
	btr r12,7
	jmp LB_3846
LB_3845:
	bts r12,7
LB_3846:
	mov r14,rcx
	bt r12,6
	jc LB_3847
	btr r12,1
	jmp LB_3848
LB_3847:
	bts r12,1
LB_3848:
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
	jc LB_3851
	btr r12,6
	clc
	jmp LB_3852
LB_3851:
	bts r12,6
	stc
LB_3852:
	mov r9,rcx
	bt r12,6
	jc LB_3849
	btr r12,3
	jmp LB_3850
LB_3849:
	bts r12,3
LB_3850:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3855
	btr r12,6
	clc
	jmp LB_3856
LB_3855:
	bts r12,6
	stc
LB_3856:
	mov r10,rcx
	bt r12,6
	jc LB_3853
	btr r12,4
	jmp LB_3854
LB_3853:
	bts r12,4
LB_3854:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3587 : %_3587
 ; {>  %_3582~0':_r64 %_3586~4':(_lst)◂(_p3561) %_3584~2':_r64 %_3585~3':_r64 %_3583~1':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_3587
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_3587 %_3582 } ⊢ { %_3588 %_3589 } : { %_3588 %_3589 }
 ; {>  %_3582~0':_r64 %_3587~5':_r64 %_3586~4':(_lst)◂(_p3561) %_3584~2':_r64 %_3585~3':_r64 %_3583~1':_r64 }
	add r11,r13
; _f51 { %_3588 %_3583 } ⊢ { %_3590 %_3591 } : { %_3590 %_3591 }
 ; {>  %_3588~5':_r64 %_3586~4':(_lst)◂(_p3561) %_3584~2':_r64 %_3585~3':_r64 %_3589~0':_r64 %_3583~1':_r64 }
	add r11,r14
; _f51 { %_3590 %_3584 } ⊢ { %_3592 %_3593 } : { %_3592 %_3593 }
 ; {>  %_3590~5':_r64 %_3586~4':(_lst)◂(_p3561) %_3584~2':_r64 %_3585~3':_r64 %_3591~1':_r64 %_3589~0':_r64 }
	add r11,r8
; _f3562 %_3592 ⊢ %_3594 : %_3594
 ; {>  %_3592~5':_r64 %_3593~2':_r64 %_3586~4':(_lst)◂(_p3561) %_3585~3':_r64 %_3591~1':_r64 %_3589~0':_r64 }
; _f3562 5' ⊢ °0◂5'
; _cns { %_3594 %_3586 } ⊢ %_3595 : %_3595
 ; {>  %_3593~2':_r64 %_3586~4':(_lst)◂(_p3561) %_3594~°0◂5':_p3561 %_3585~3':_r64 %_3591~1':_r64 %_3589~0':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_3585 %_3595 } ⊢ %_3596 : %_3596
 ; {>  %_3595~°0◂{ °0◂5' 4' }:(_lst)◂(_p3561) %_3593~2':_r64 %_3585~3':_r64 %_3591~1':_r64 %_3589~0':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_3596
 ; {>  %_3596~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p3561) }) %_3593~2':_r64 %_3591~1':_r64 %_3589~0':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,2
	jc LB_3752
	mov rdi,r8
	call dlt
LB_3752:
	bt r12,1
	jc LB_3753
	mov rdi,r14
	call dlt
LB_3753:
	bt r12,0
	jc LB_3754
	mov rdi,r13
	call dlt
LB_3754:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3755
	btr r12,0
	jmp LB_3756
LB_3755:
	bts r12,0
LB_3756:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_3759
	btr r12,1
	jmp LB_3760
LB_3759:
	bts r12,1
LB_3760:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3757
	btr QWORD [rdi],0
	jmp LB_3758
LB_3757:
	bts QWORD [rdi],0
LB_3758:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_3769
	btr r12,0
	jmp LB_3770
LB_3769:
	bts r12,0
LB_3770:
	mov rsi,1
	bt r12,0
	jc LB_3767
	mov rsi,0
	bt r13,0
	jc LB_3767
	jmp LB_3768
LB_3767:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3768:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_3765
	btr QWORD [rdi],0
	jmp LB_3766
LB_3765:
	bts QWORD [rdi],0
LB_3766:
	mov r13,r10
	bt r12,4
	jc LB_3773
	btr r12,0
	jmp LB_3774
LB_3773:
	bts r12,0
LB_3774:
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_3771
	btr QWORD [rdi],1
	jmp LB_3772
LB_3771:
	bts QWORD [rdi],1
LB_3772:
	mov rsi,1
	bt r12,1
	jc LB_3763
	mov rsi,0
	bt r14,0
	jc LB_3763
	jmp LB_3764
LB_3763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3764:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3761
	btr QWORD [rdi],1
	jmp LB_3762
LB_3761:
	bts QWORD [rdi],1
LB_3762:
	mov r8,0
	bts r12,2
	ret
LB_3775:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3777
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3776
LB_3777:
	add rsp,8
	ret
LB_3779:
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
LB_3778:
	add rsp,96
	pop r14
LB_3776:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3910
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3882
LB_3910:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_3918
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_3918
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_3918
	jmp LB_3919
LB_3918:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3916:
	jmp LB_3882
LB_3919:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_3564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3895
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3896
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3896:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3897
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3897:
	jmp LB_3883
LB_3895:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_3566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3902
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3903
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3903:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3904
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3904:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3905
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3905:
	jmp LB_3883
LB_3902:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3890
	btr r12,3
	clc
	jmp LB_3891
LB_3890:
	bts r12,3
	stc
LB_3891:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3888
	btr r12,2
	clc
	jmp LB_3889
LB_3888:
	bts r12,2
	stc
LB_3889:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3886
	btr r12,1
	clc
	jmp LB_3887
LB_3886:
	bts r12,1
	stc
LB_3887:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3884
	btr r12,0
	clc
	jmp LB_3885
LB_3884:
	bts r12,0
	stc
LB_3885:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_3879
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_3920
	btr r12,4
	jmp LB_3921
LB_3920:
	bts r12,4
LB_3921:
	mov r14,r8
	bt r12,2
	jc LB_3922
	btr r12,1
	jmp LB_3923
LB_3922:
	bts r12,1
LB_3923:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_3924
	btr r12,4
	jmp LB_3925
LB_3924:
	bts r12,4
LB_3925:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3928
	btr r12,5
	clc
	jmp LB_3929
LB_3928:
	bts r12,5
	stc
LB_3929:
	mov r8,r11
	bt r12,5
	jc LB_3926
	btr r12,2
	jmp LB_3927
LB_3926:
	bts r12,2
LB_3927:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3932
	btr r12,5
	clc
	jmp LB_3933
LB_3932:
	bts r12,5
	stc
LB_3933:
	mov r9,r11
	bt r12,5
	jc LB_3930
	btr r12,3
	jmp LB_3931
LB_3930:
	bts r12,3
LB_3931:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_3601 : %_3601
 ; {>  %_3598~1':_r64 %_3597~0':_r64 %_3599~2':_r64 %_3600~3':(_lst)◂(_p3561) }
; 	» 0xr2 _ ⊢ 4' : %_3601
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_3601 %_3597 } ⊢ { %_3602 %_3603 } : { %_3602 %_3603 }
 ; {>  %_3598~1':_r64 %_3597~0':_r64 %_3601~4':_r64 %_3599~2':_r64 %_3600~3':(_lst)◂(_p3561) }
	add r10,r13
; _f51 { %_3602 %_3598 } ⊢ { %_3604 %_3605 } : { %_3604 %_3605 }
 ; {>  %_3603~0':_r64 %_3598~1':_r64 %_3602~4':_r64 %_3599~2':_r64 %_3600~3':(_lst)◂(_p3561) }
	add r10,r14
; _f3562 %_3604 ⊢ %_3606 : %_3606
 ; {>  %_3603~0':_r64 %_3605~1':_r64 %_3599~2':_r64 %_3600~3':(_lst)◂(_p3561) %_3604~4':_r64 }
; _f3562 4' ⊢ °0◂4'
; _cns { %_3606 %_3600 } ⊢ %_3607 : %_3607
 ; {>  %_3603~0':_r64 %_3605~1':_r64 %_3599~2':_r64 %_3600~3':(_lst)◂(_p3561) %_3606~°0◂4':_p3561 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_3599 %_3607 } ⊢ %_3608 : %_3608
 ; {>  %_3603~0':_r64 %_3605~1':_r64 %_3599~2':_r64 %_3607~°0◂{ °0◂4' 3' }:(_lst)◂(_p3561) }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_3608
 ; {>  %_3603~0':_r64 %_3605~1':_r64 %_3608~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p3561) }) }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_3857
	mov rdi,r13
	call dlt
LB_3857:
	bt r12,1
	jc LB_3858
	mov rdi,r14
	call dlt
LB_3858:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3859
	btr r12,0
	jmp LB_3860
LB_3859:
	bts r12,0
LB_3860:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_3863
	btr r12,1
	jmp LB_3864
LB_3863:
	bts r12,1
LB_3864:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3861
	btr QWORD [rdi],0
	jmp LB_3862
LB_3861:
	bts QWORD [rdi],0
LB_3862:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_3873
	btr r12,2
	jmp LB_3874
LB_3873:
	bts r12,2
LB_3874:
	mov rsi,1
	bt r12,2
	jc LB_3871
	mov rsi,0
	bt r8,0
	jc LB_3871
	jmp LB_3872
LB_3871:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_3872:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_3869
	btr QWORD [rdi],0
	jmp LB_3870
LB_3869:
	bts QWORD [rdi],0
LB_3870:
	mov r8,r13
	bt r12,0
	jc LB_3877
	btr r12,2
	jmp LB_3878
LB_3877:
	bts r12,2
LB_3878:
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_3875
	btr QWORD [rdi],1
	jmp LB_3876
LB_3875:
	bts QWORD [rdi],1
LB_3876:
	mov rsi,1
	bt r12,1
	jc LB_3867
	mov rsi,0
	bt r14,0
	jc LB_3867
	jmp LB_3868
LB_3867:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3868:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3865
	btr QWORD [rdi],1
	jmp LB_3866
LB_3865:
	bts QWORD [rdi],1
LB_3866:
	mov r8,0
	bts r12,2
	ret
LB_3879:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3881
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3880
LB_3881:
	add rsp,8
	ret
LB_3883:
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
LB_3882:
	add rsp,64
	pop r14
LB_3880:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_3564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4005
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3997
LB_4005:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_3566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4010
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4011
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4011:
	jmp LB_3997
LB_4010:
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
	jc LB_4000
	btr r12,1
	clc
	jmp LB_4001
LB_4000:
	bts r12,1
	stc
LB_4001:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3998
	btr r12,0
	clc
	jmp LB_3999
LB_3998:
	bts r12,0
	stc
LB_3999:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3994
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov rcx,r8
	bt r12,2
	jc LB_4013
	btr r12,6
	jmp LB_4014
LB_4013:
	bts r12,6
LB_4014:
	mov r11,r14
	bt r12,1
	jc LB_4015
	btr r12,5
	jmp LB_4016
LB_4015:
	bts r12,5
LB_4016:
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_4019
	btr r12,7
	clc
	jmp LB_4020
LB_4019:
	bts r12,7
	stc
LB_4020:
	mov r14,rdx
	bt r12,7
	jc LB_4017
	btr r12,1
	jmp LB_4018
LB_4017:
	bts r12,1
LB_4018:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_4023
	btr r12,7
	clc
	jmp LB_4024
LB_4023:
	bts r12,7
	stc
LB_4024:
	mov r8,rdx
	bt r12,7
	jc LB_4021
	btr r12,2
	jmp LB_4022
LB_4021:
	bts r12,2
LB_4022:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f51 { %_3610 %_3609 } ⊢ { %_3612 %_3613 } : { %_3612 %_3613 }
 ; {>  %_3611~2':(_lst)◂(_p3561) %_3610~1':_r64 %_3609~0':_r64 }
	add r14,r13
MTC_LB_3934:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3935
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
	jnc LB_3936
	bt QWORD [rdi],0
	jc LB_3937
	btr r12,5
	clc
	jmp LB_3938
LB_3937:
	bts r12,5
	stc
LB_3938:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3936:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3941
	btr r12,6
	clc
	jmp LB_3942
LB_3941:
	bts r12,6
	stc
LB_3942:
	mov r9,rcx
	bt r12,6
	jc LB_3939
	btr r12,3
	jmp LB_3940
LB_3939:
	bts r12,3
LB_3940:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3945
	btr r12,6
	clc
	jmp LB_3946
LB_3945:
	bts r12,6
	stc
LB_3946:
	mov r10,rcx
	bt r12,6
	jc LB_3943
	btr r12,4
	jmp LB_3944
LB_3943:
	bts r12,4
LB_3944:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3935
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
	jnc LB_3947
	bt QWORD [rdi],0
	jc LB_3948
	btr r12,6
	clc
	jmp LB_3949
LB_3948:
	bts r12,6
	stc
LB_3949:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3947:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_3950
	btr r12,5
	jmp LB_3951
LB_3950:
	bts r12,5
LB_3951:
LB_3952:
	cmp r15,0
	jz LB_3953
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3952
LB_3953:
; _f51 { %_3616 %_3613 } ⊢ { %_3617 %_3618 } : { %_3617 %_3618 }
 ; {>  %_3613~0':_r64 %_3612~1':_r64 %_3615~4':(_lst)◂(_p3561) %_3616~5':_r64 }
	add r11,r13
; _f3563 %_3617 ⊢ %_3619 : %_3619
 ; {>  %_3618~0':_r64 %_3617~5':_r64 %_3612~1':_r64 %_3615~4':(_lst)◂(_p3561) }
; _f3563 5' ⊢ °1◂5'
; _cns { %_3619 %_3615 } ⊢ %_3620 : %_3620
 ; {>  %_3619~°1◂5':_p3561 %_3618~0':_r64 %_3612~1':_r64 %_3615~4':(_lst)◂(_p3561) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_3612 %_3620 } ⊢ %_3621 : %_3621
 ; {>  %_3618~0':_r64 %_3620~°0◂{ °1◂5' 4' }:(_lst)◂(_p3561) %_3612~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_3621
 ; {>  %_3618~0':_r64 %_3621~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p3561) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_3954
	mov rdi,r13
	call dlt
LB_3954:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_3957
	btr r12,0
	jmp LB_3958
LB_3957:
	bts r12,0
LB_3958:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_3955
	btr QWORD [rdi],0
	jmp LB_3956
LB_3955:
	bts QWORD [rdi],0
LB_3956:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_3967
	btr r12,1
	jmp LB_3968
LB_3967:
	bts r12,1
LB_3968:
	mov rsi,1
	bt r12,1
	jc LB_3965
	mov rsi,0
	bt r14,0
	jc LB_3965
	jmp LB_3966
LB_3965:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3966:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3963
	btr QWORD [rdi],0
	jmp LB_3964
LB_3963:
	bts QWORD [rdi],0
LB_3964:
	mov r14,r10
	bt r12,4
	jc LB_3971
	btr r12,1
	jmp LB_3972
LB_3971:
	bts r12,1
LB_3972:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3969
	btr QWORD [rdi],1
	jmp LB_3970
LB_3969:
	bts QWORD [rdi],1
LB_3970:
	mov rsi,1
	bt r12,0
	jc LB_3961
	mov rsi,0
	bt r13,0
	jc LB_3961
	jmp LB_3962
LB_3961:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3962:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_3959
	btr QWORD [rdi],1
	jmp LB_3960
LB_3959:
	bts QWORD [rdi],1
LB_3960:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3935:
	mov r15,0
LB_3974:
	cmp r15,0
	jz LB_3975
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3974
LB_3975:
; _f3563 %_3613 ⊢ %_3622 : %_3622
 ; {>  %_3611~2':(_lst)◂(_p3561) %_3613~0':_r64 %_3612~1':_r64 }
; _f3563 0' ⊢ °1◂0'
; _cns { %_3622 %_3611 } ⊢ %_3623 : %_3623
 ; {>  %_3611~2':(_lst)◂(_p3561) %_3622~°1◂0':_p3561 %_3612~1':_r64 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_3612 %_3623 } ⊢ %_3624 : %_3624
 ; {>  %_3623~°0◂{ °1◂0' 2' }:(_lst)◂(_p3561) %_3612~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_3624
 ; {>  %_3624~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p3561) }) }
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
	jc LB_3978
	btr r12,4
	jmp LB_3979
LB_3978:
	bts r12,4
LB_3979:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_3976
	btr QWORD [rdi],0
	jmp LB_3977
LB_3976:
	bts QWORD [rdi],0
LB_3977:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_3988
	btr r12,1
	jmp LB_3989
LB_3988:
	bts r12,1
LB_3989:
	mov rsi,1
	bt r12,1
	jc LB_3986
	mov rsi,0
	bt r14,0
	jc LB_3986
	jmp LB_3987
LB_3986:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3987:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_3984
	btr QWORD [rdi],0
	jmp LB_3985
LB_3984:
	bts QWORD [rdi],0
LB_3985:
	mov r14,r8
	bt r12,2
	jc LB_3992
	btr r12,1
	jmp LB_3993
LB_3992:
	bts r12,1
LB_3993:
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_3990
	btr QWORD [rdi],1
	jmp LB_3991
LB_3990:
	bts QWORD [rdi],1
LB_3991:
	mov rsi,1
	bt r12,4
	jc LB_3982
	mov rsi,0
	bt r10,0
	jc LB_3982
	jmp LB_3983
LB_3982:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_3983:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_3980
	btr QWORD [rdi],1
	jmp LB_3981
LB_3980:
	bts QWORD [rdi],1
LB_3981:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3973:
LB_3994:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3996
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3995
LB_3996:
	add rsp,8
	ret
LB_3997:
	add rsp,32
	pop r14
LB_3995:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4033
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_3625 : %_3625
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_3626 : %_3626
 ; {>  %_3625~°1◂{  }:(_lst)◂(t1530'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_3626
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_3626 %_3625 } ⊢ %_3627 : %_3627
 ; {>  %_3625~°1◂{  }:(_lst)◂(t1530'(0)) %_3626~0':_r64 }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_3627
 ; {>  %_3627~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t1534'(0)) }) }
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
	jc LB_4027
	btr r12,1
	jmp LB_4028
LB_4027:
	bts r12,1
LB_4028:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_4025
	btr QWORD [rdi],0
	jmp LB_4026
LB_4025:
	bts QWORD [rdi],0
LB_4026:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_4031
	mov rsi,0
	bt r14,0
	jc LB_4031
	jmp LB_4032
LB_4031:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4032:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_4029
	btr QWORD [rdi],1
	jmp LB_4030
LB_4029:
	bts QWORD [rdi],1
LB_4030:
	mov r8,0
	bts r12,2
	ret
LB_4033:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4035
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4034
LB_4035:
	add rsp,8
	ret
LB_4036:
	add rsp,0
	pop r14
LB_4034:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3567:
NS_E_RDI_3567:
NS_E_3567_ETR_TBL:
NS_E_3567_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4074
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4044
LB_4074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_4082
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4082
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_4082
	jmp LB_4083
LB_4082:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4080
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4080:
	jmp LB_4044
LB_4083:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4057
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4058
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4058:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4059
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4059:
	jmp LB_4045
LB_4057:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4069
	jmp LB_4070
LB_4069:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4065
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4065:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4066
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4066:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4067
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4067:
	jmp LB_4045
LB_4070:
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
	jc LB_4052
	btr r12,3
	clc
	jmp LB_4053
LB_4052:
	bts r12,3
	stc
LB_4053:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4050
	btr r12,2
	clc
	jmp LB_4051
LB_4050:
	bts r12,2
	stc
LB_4051:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4048
	btr r12,1
	clc
	jmp LB_4049
LB_4048:
	bts r12,1
	stc
LB_4049:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4046
	btr r12,0
	clc
	jmp LB_4047
LB_4046:
	bts r12,0
	stc
LB_4047:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_4041
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_4084
	btr r12,4
	jmp LB_4085
LB_4084:
	bts r12,4
LB_4085:
	mov r14,r8
	bt r12,2
	jc LB_4086
	btr r12,1
	jmp LB_4087
LB_4086:
	bts r12,1
LB_4087:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3630 : %_3630
 ; {>  %_3629~1':_r64 %_3628~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_3630
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_3630 %_3628 } ⊢ { %_3631 %_3632 } : { %_3631 %_3632 }
 ; {>  %_3629~1':_r64 %_3628~0':_r64 %_3630~2':_r64 }
	add r8,r13
; _f51 { %_3631 %_3629 } ⊢ { %_3633 %_3634 } : { %_3633 %_3634 }
 ; {>  %_3631~2':_r64 %_3629~1':_r64 %_3632~0':_r64 }
	add r8,r14
; _some %_3633 ⊢ %_3635 : %_3635
 ; {>  %_3634~1':_r64 %_3633~2':_r64 %_3632~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_3635
 ; {>  %_3634~1':_r64 %_3632~0':_r64 %_3635~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_4037
	mov rdi,r14
	call dlt
LB_4037:
	bt r12,0
	jc LB_4038
	mov rdi,r13
	call dlt
LB_4038:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_4039
	btr r12,3
	jmp LB_4040
LB_4039:
	bts r12,3
LB_4040:
	mov r8,0
	bts r12,2
	ret
LB_4041:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4043
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4042
LB_4043:
	add rsp,8
	ret
LB_4045:
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
LB_4044:
	add rsp,64
	pop r14
LB_4042:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4150
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4097
LB_4150:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_4158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4158
	jmp LB_4159
LB_4158:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4156
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4156:
	jmp LB_4097
LB_4159:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4114
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4115
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4115:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4116
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4116:
	jmp LB_4098
LB_4114:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4126
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4126
	jmp LB_4127
LB_4126:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4122
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4122:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4123
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4123:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4124
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4124:
	jmp LB_4098
LB_4127:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_3567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4131
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4132
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4132:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4133
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4133:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4134
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4134:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4135
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4135:
	jmp LB_4098
LB_4131:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_3567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4140
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_4141
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_4141:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4142
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4142:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4143
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4143:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4144
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4144:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4145
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4145:
	jmp LB_4098
LB_4140:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_4109
	btr r12,5
	clc
	jmp LB_4110
LB_4109:
	bts r12,5
	stc
LB_4110:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4107
	btr r12,4
	clc
	jmp LB_4108
LB_4107:
	bts r12,4
	stc
LB_4108:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4105
	btr r12,3
	clc
	jmp LB_4106
LB_4105:
	bts r12,3
	stc
LB_4106:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4103
	btr r12,2
	clc
	jmp LB_4104
LB_4103:
	bts r12,2
	stc
LB_4104:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4101
	btr r12,1
	clc
	jmp LB_4102
LB_4101:
	bts r12,1
	stc
LB_4102:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4099
	btr r12,0
	clc
	jmp LB_4100
LB_4099:
	bts r12,0
	stc
LB_4100:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_4094
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_4160
	btr r12,6
	jmp LB_4161
LB_4160:
	bts r12,6
LB_4161:
	mov r9,r11
	bt r12,5
	jc LB_4162
	btr r12,3
	jmp LB_4163
LB_4162:
	bts r12,3
LB_4163:
	mov r11,r8
	bt r12,2
	jc LB_4164
	btr r12,5
	jmp LB_4165
LB_4164:
	bts r12,5
LB_4165:
	mov r8,r10
	bt r12,4
	jc LB_4166
	btr r12,2
	jmp LB_4167
LB_4166:
	bts r12,2
LB_4167:
	mov r10,r14
	bt r12,1
	jc LB_4168
	btr r12,4
	jmp LB_4169
LB_4168:
	bts r12,4
LB_4169:
	mov r14,r11
	bt r12,5
	jc LB_4170
	btr r12,1
	jmp LB_4171
LB_4170:
	bts r12,1
LB_4171:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3640 : %_3640
 ; {>  %_3637~1':_r64 %_3636~0':_r64 %_3638~2':_r64 %_3639~3':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_3640
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_3640 %_3636 } ⊢ { %_3641 %_3642 } : { %_3641 %_3642 }
 ; {>  %_3637~1':_r64 %_3636~0':_r64 %_3640~4':_r64 %_3638~2':_r64 %_3639~3':_r64 }
	add r10,r13
; _f51 { %_3641 %_3637 } ⊢ { %_3643 %_3644 } : { %_3643 %_3644 }
 ; {>  %_3641~4':_r64 %_3637~1':_r64 %_3642~0':_r64 %_3638~2':_r64 %_3639~3':_r64 }
	add r10,r14
; _f51 { %_3643 %_3638 } ⊢ { %_3645 %_3646 } : { %_3645 %_3646 }
 ; {>  %_3643~4':_r64 %_3644~1':_r64 %_3642~0':_r64 %_3638~2':_r64 %_3639~3':_r64 }
	add r10,r8
; _f51 { %_3645 %_3639 } ⊢ { %_3647 %_3648 } : { %_3647 %_3648 }
 ; {>  %_3646~2':_r64 %_3644~1':_r64 %_3642~0':_r64 %_3645~4':_r64 %_3639~3':_r64 }
	add r10,r9
; _some %_3647 ⊢ %_3649 : %_3649
 ; {>  %_3646~2':_r64 %_3644~1':_r64 %_3642~0':_r64 %_3648~3':_r64 %_3647~4':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_3649
 ; {>  %_3646~2':_r64 %_3649~°0◂4':(_opn)◂(_r64) %_3644~1':_r64 %_3642~0':_r64 %_3648~3':_r64 }
; 	∎ °0◂4'
	bt r12,2
	jc LB_4088
	mov rdi,r8
	call dlt
LB_4088:
	bt r12,1
	jc LB_4089
	mov rdi,r14
	call dlt
LB_4089:
	bt r12,0
	jc LB_4090
	mov rdi,r13
	call dlt
LB_4090:
	bt r12,3
	jc LB_4091
	mov rdi,r9
	call dlt
LB_4091:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_4092
	btr r12,3
	jmp LB_4093
LB_4092:
	bts r12,3
LB_4093:
	mov r8,0
	bts r12,2
	ret
LB_4094:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4096
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4095
LB_4096:
	add rsp,8
	ret
LB_4098:
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
LB_4097:
	add rsp,96
	pop r14
LB_4095:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_3564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4186
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4178
LB_4186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_3567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4191
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4192:
	jmp LB_4178
LB_4191:
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
	jc LB_4181
	btr r12,1
	clc
	jmp LB_4182
LB_4181:
	bts r12,1
	stc
LB_4182:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4179
	btr r12,0
	clc
	jmp LB_4180
LB_4179:
	bts r12,0
	stc
LB_4180:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4175
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f51 { %_3650 %_3651 } ⊢ { %_3652 %_3653 } : { %_3652 %_3653 }
 ; {>  %_3651~1':_r64 %_3650~0':_r64 }
	add r13,r14
; _some %_3652 ⊢ %_3654 : %_3654
 ; {>  %_3653~1':_r64 %_3652~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3654
 ; {>  %_3654~°0◂0':(_opn)◂(_r64) %_3653~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_4172
	mov rdi,r14
	call dlt
LB_4172:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4173
	btr r12,3
	jmp LB_4174
LB_4173:
	bts r12,3
LB_4174:
	mov r8,0
	bts r12,2
	ret
LB_4175:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4177
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4176
LB_4177:
	add rsp,8
	ret
LB_4178:
	add rsp,32
	pop r14
LB_4176:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4216:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_4216:
MTC_LB_4217:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4218
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
	jnc LB_4219
	bt QWORD [rdi],0
	jc LB_4220
	btr r12,7
	clc
	jmp LB_4221
LB_4220:
	bts r12,7
	stc
LB_4221:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4219:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_4224
	btr r12,8
	clc
	jmp LB_4225
LB_4224:
	bts r12,8
	stc
LB_4225:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4222
	btr r12,5
	jmp LB_4223
LB_4222:
	bts r12,5
LB_4223:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_4228
	btr r12,8
	clc
	jmp LB_4229
LB_4228:
	bts r12,8
	stc
LB_4229:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4226
	btr r12,6
	jmp LB_4227
LB_4226:
	bts r12,6
LB_4227:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4230:
	cmp r15,0
	jz LB_4231
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4230
LB_4231:
MTC_LB_4232:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4233
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
	jnc LB_4234
	bt QWORD [rdi],0
	jc LB_4235
	btr r12,7
	clc
	jmp LB_4236
LB_4235:
	bts r12,7
	stc
LB_4236:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4234:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4237
	btr r12,4
	jmp LB_4238
LB_4237:
	bts r12,4
LB_4238:
LB_4239:
	cmp r15,0
	jz LB_4240
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4239
LB_4240:
; _f53 %_4201 ⊢ { %_4202 %_4203 } : { %_4202 %_4203 }
 ; {>  %_4201~4':_r64 %_4197~3':_r64 %_4200~6':(_lst)◂(_p3561) %_4194~0':_stg %_4196~2':_stg %_4195~1':_r64 }
	mov r11,r10
	bts r12,5
; _f35 { %_4203 %_4194 %_4195 %_4196 %_4197 } ⊢ { %_4204 %_4205 %_4206 %_4207 %_4208 } : { %_4204 %_4205 %_4206 %_4207 %_4208 }
 ; {>  %_4202~4':_r64 %_4197~3':_r64 %_4200~6':(_lst)◂(_p3561) %_4194~0':_stg %_4196~2':_stg %_4195~1':_r64 %_4203~5':_r64 }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_4245
	btr r12,4
	jmp LB_4246
LB_4245:
	bts r12,4
LB_4246:
	mov r9,r8
	bt r12,2
	jc LB_4247
	btr r12,3
	jmp LB_4248
LB_4247:
	bts r12,3
LB_4248:
	mov r8,r14
	bt r12,1
	jc LB_4249
	btr r12,2
	jmp LB_4250
LB_4249:
	bts r12,2
LB_4250:
	mov r14,r13
	bt r12,0
	jc LB_4251
	btr r12,1
	jmp LB_4252
LB_4251:
	bts r12,1
LB_4252:
	mov r13,r11
	bt r12,5
	jc LB_4253
	btr r12,0
	jmp LB_4254
LB_4253:
	bts r12,0
LB_4254:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_4255
	btr r12,5
	jmp LB_4256
LB_4255:
	bts r12,5
LB_4256:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_4243
	btr r12,6
	clc
	jmp LB_4244
LB_4243:
	bts r12,6
	stc
LB_4244:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4241
	btr r12,4
	clc
	jmp LB_4242
LB_4241:
	bts r12,4
	stc
LB_4242:
	add rsp,24
; _f4216 { %_4205 %_4206 %_4207 %_4208 %_4200 } ⊢ { %_4209 %_4210 } : { %_4209 %_4210 }
 ; {>  %_4202~4':_r64 %_4207~3':_stg %_4200~6':(_lst)◂(_p3561) %_4204~0':_r64 %_4208~5':_r64 %_4205~1':_stg %_4206~2':_r64 }
; _f4216 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_4261
	btr r12,0
	jmp LB_4262
LB_4261:
	bts r12,0
LB_4262:
	mov r14,r8
	bt r12,2
	jc LB_4263
	btr r12,1
	jmp LB_4264
LB_4263:
	bts r12,1
LB_4264:
	mov r8,r9
	bt r12,3
	jc LB_4265
	btr r12,2
	jmp LB_4266
LB_4265:
	bts r12,2
LB_4266:
	mov r9,r11
	bt r12,5
	jc LB_4267
	btr r12,3
	jmp LB_4268
LB_4267:
	bts r12,3
LB_4268:
	mov r10,rcx
	bt r12,6
	jc LB_4269
	btr r12,4
	jmp LB_4270
LB_4269:
	bts r12,4
LB_4270:
	call NS_E_4216
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4271
	btr r12,2
	jmp LB_4272
LB_4271:
	bts r12,2
LB_4272:
	mov r14,r13
	bt r12,0
	jc LB_4273
	btr r12,1
	jmp LB_4274
LB_4273:
	bts r12,1
LB_4274:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4259
	btr r12,4
	clc
	jmp LB_4260
LB_4259:
	bts r12,4
	stc
LB_4260:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4257
	btr r12,0
	clc
	jmp LB_4258
LB_4257:
	bts r12,0
	stc
LB_4258:
	add rsp,24
; ∎ { %_4209 %_4210 }
 ; {>  %_4210~2':_stg %_4209~1':_stg %_4202~4':_r64 %_4204~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_4275
	mov rdi,r10
	call dlt
LB_4275:
	bt r12,0
	jc LB_4276
	mov rdi,r13
	call dlt
LB_4276:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_4277
	btr r12,0
	jmp LB_4278
LB_4277:
	bts r12,0
LB_4278:
	mov r14,r8
	bt r12,2
	jc LB_4279
	btr r12,1
	jmp LB_4280
LB_4279:
	bts r12,1
LB_4280:
	ret
MTC_LB_4233:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4281
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
	jnc LB_4282
	bt QWORD [rdi],0
	jc LB_4283
	btr r12,7
	clc
	jmp LB_4284
LB_4283:
	bts r12,7
	stc
LB_4284:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4282:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4285
	btr r12,4
	jmp LB_4286
LB_4285:
	bts r12,4
LB_4286:
LB_4287:
	cmp r15,0
	jz LB_4288
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4287
LB_4288:
; _f51 { %_4195 %_4211 } ⊢ { %_4212 %_4213 } : { %_4212 %_4213 }
 ; {>  %_4197~3':_r64 %_4200~6':(_lst)◂(_p3561) %_4194~0':_stg %_4211~4':_r64 %_4196~2':_stg %_4195~1':_r64 }
	add r14,r10
; _f4216 { %_4194 %_4212 %_4196 %_4197 %_4200 } ⊢ { %_4214 %_4215 } : { %_4214 %_4215 }
 ; {>  %_4213~4':_r64 %_4212~1':_r64 %_4197~3':_r64 %_4200~6':(_lst)◂(_p3561) %_4194~0':_stg %_4196~2':_stg }
; _f4216 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_4291
	btr r12,4
	jmp LB_4292
LB_4291:
	bts r12,4
LB_4292:
	call NS_E_4216
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4289
	btr r12,4
	clc
	jmp LB_4290
LB_4289:
	bts r12,4
	stc
LB_4290:
	add rsp,16
; ∎ { %_4214 %_4215 }
 ; {>  %_4213~4':_r64 %_4214~0':_stg %_4215~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_4293
	mov rdi,r10
	call dlt
LB_4293:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4281:
MTC_LB_4218:
	mov r15,0
LB_4295:
	cmp r15,0
	jz LB_4296
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4295
LB_4296:
; ∎ { %_4194 %_4196 }
 ; {>  %_4197~3':_r64 %_4198~4':(_lst)◂(_p3561) %_4194~0':_stg %_4196~2':_stg %_4195~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_4297
	mov rdi,r9
	call dlt
LB_4297:
	bt r12,4
	jc LB_4298
	mov rdi,r10
	call dlt
LB_4298:
	bt r12,1
	jc LB_4299
	mov rdi,r14
	call dlt
LB_4299:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4300
	btr r12,1
	jmp LB_4301
LB_4300:
	bts r12,1
LB_4301:
	ret
MTC_LB_4294:
NS_E_4317:
; 	|» 0'
NS_E_RDI_4317:
; » 0xr0 |~ {  } ⊢ %_4303 : %_4303
 ; {>  %_4302~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_4303
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3566 { %_4302 %_4303 } ⊢ { %_4304 %_4305 %_4306 } : { %_4304 %_4305 %_4306 }
 ; {>  %_4303~1':_r64 %_4302~0':_stg }
; _f3566 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3566
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_4318
	btr r12,4
	jmp LB_4319
LB_4318:
	bts r12,4
LB_4319:
	mov r8,r9
	bt r12,3
	jc LB_4322
	btr r12,2
	jmp LB_4323
LB_4322:
	bts r12,2
LB_4323:
	mov rsi,1
	bt r12,2
	jc LB_4320
	mov rsi,0
	bt r8,0
	jc LB_4320
	jmp LB_4321
LB_4320:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_4321:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_4324:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4325
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
	jnc LB_4326
	bt QWORD [rdi],0
	jc LB_4327
	btr r12,5
	clc
	jmp LB_4328
LB_4327:
	bts r12,5
	stc
LB_4328:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4326:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4331
	btr r12,6
	clc
	jmp LB_4332
LB_4331:
	bts r12,6
	stc
LB_4332:
	mov r9,rcx
	bt r12,6
	jc LB_4329
	btr r12,3
	jmp LB_4330
LB_4329:
	bts r12,3
LB_4330:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4335
	btr r12,6
	clc
	jmp LB_4336
LB_4335:
	bts r12,6
	stc
LB_4336:
	mov r10,rcx
	bt r12,6
	jc LB_4333
	btr r12,4
	jmp LB_4334
LB_4333:
	bts r12,4
LB_4334:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4337:
	cmp r15,0
	jz LB_4338
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4337
LB_4338:
; _f31 %_4307 ⊢ { %_4309 %_4310 } : { %_4309 %_4310 }
 ; {>  %_4307~3':_r64 %_4308~4':(_lst)◂(_p3561) %_4304~0':_stg %_4305~1':_r64 }
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
	jc LB_4345
	btr r12,0
	jmp LB_4346
LB_4345:
	bts r12,0
LB_4346:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_4347
	btr r12,2
	jmp LB_4348
LB_4347:
	bts r12,2
LB_4348:
	mov r9,r14
	bt r12,1
	jc LB_4349
	btr r12,3
	jmp LB_4350
LB_4349:
	bts r12,3
LB_4350:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4343
	btr r12,4
	clc
	jmp LB_4344
LB_4343:
	bts r12,4
	stc
LB_4344:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4341
	btr r12,1
	clc
	jmp LB_4342
LB_4341:
	bts r12,1
	stc
LB_4342:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4339
	btr r12,0
	clc
	jmp LB_4340
LB_4339:
	bts r12,0
	stc
LB_4340:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_4311 : %_4311
 ; {>  %_4310~3':_stg %_4308~4':(_lst)◂(_p3561) %_4309~2':_r64 %_4304~0':_stg %_4305~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_4311
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_4312 : %_4312
 ; {>  %_4310~3':_stg %_4311~5':_r64 %_4308~4':(_lst)◂(_p3561) %_4309~2':_r64 %_4304~0':_stg %_4305~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_4312
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f4216 { %_4304 %_4311 %_4310 %_4312 %_4308 } ⊢ { %_4313 %_4314 } : { %_4313 %_4314 }
 ; {>  %_4310~3':_stg %_4312~6':_r64 %_4311~5':_r64 %_4308~4':(_lst)◂(_p3561) %_4309~2':_r64 %_4304~0':_stg %_4305~1':_r64 }
; _f4216 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_4355
	btr r12,1
	jmp LB_4356
LB_4355:
	bts r12,1
LB_4356:
	mov r8,r9
	bt r12,3
	jc LB_4357
	btr r12,2
	jmp LB_4358
LB_4357:
	bts r12,2
LB_4358:
	mov r9,rcx
	bt r12,6
	jc LB_4359
	btr r12,3
	jmp LB_4360
LB_4359:
	bts r12,3
LB_4360:
	call NS_E_4216
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4361
	btr r12,3
	jmp LB_4362
LB_4361:
	bts r12,3
LB_4362:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4353
	btr r12,2
	clc
	jmp LB_4354
LB_4353:
	bts r12,2
	stc
LB_4354:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4351
	btr r12,1
	clc
	jmp LB_4352
LB_4351:
	bts r12,1
	stc
LB_4352:
	add rsp,24
; _some %_4314 ⊢ %_4315 : %_4315
 ; {>  %_4313~0':_stg %_4309~2':_r64 %_4314~3':_stg %_4305~1':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_4313 %_4315 }
 ; {>  %_4315~°0◂3':(_opn)◂(_stg) %_4313~0':_stg %_4309~2':_r64 %_4305~1':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_4363
	mov rdi,r8
	call dlt
LB_4363:
	bt r12,1
	jc LB_4364
	mov rdi,r14
	call dlt
LB_4364:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4367
	btr r12,1
	jmp LB_4368
LB_4367:
	bts r12,1
LB_4368:
	mov rsi,1
	bt r12,1
	jc LB_4365
	mov rsi,0
	bt r14,0
	jc LB_4365
	jmp LB_4366
LB_4365:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4366:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4325:
	mov r15,0
LB_4370:
	cmp r15,0
	jz LB_4371
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4370
LB_4371:
; _none {  } ⊢ %_4316 : %_4316
 ; {>  %_4306~2':(_opn)◂({ _r64 (_lst)◂(_p3561) }) %_4304~0':_stg %_4305~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_4304 %_4316 }
 ; {>  %_4306~2':(_opn)◂({ _r64 (_lst)◂(_p3561) }) %_4304~0':_stg %_4305~1':_r64 %_4316~°1◂{  }:(_opn)◂(t1721'(0)) }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_4372
	mov rdi,r8
	call dlt
LB_4372:
	bt r12,1
	jc LB_4373
	mov rdi,r14
	call dlt
LB_4373:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_4374
	mov rsi,0
	bt r14,0
	jc LB_4374
	jmp LB_4375
LB_4374:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4375:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4369:
NS_E_4376:
NS_E_RDI_4376:
NS_E_4376_ETR_TBL:
NS_E_4376_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_4405
LB_4404:
	add r14,1
LB_4405:
	cmp r14,r10
	jge LB_4406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4404
	cmp al,10
	jz LB_4404
	cmp al,32
	jz LB_4404
LB_4406:
	push r10
	call NS_E_1341_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4407
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4397
LB_4407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_4410
LB_4409:
	add r14,1
LB_4410:
	cmp r14,r10
	jge LB_4411
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4409
	cmp al,10
	jz LB_4409
	cmp al,32
	jz LB_4409
LB_4411:
	add r14,1
	cmp r14,r10
	jg LB_4415
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4415
	jmp LB_4416
LB_4415:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4413
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4413:
	jmp LB_4397
LB_4416:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_4418
LB_4417:
	add r14,1
LB_4418:
	cmp r14,r10
	jge LB_4419
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4417
	cmp al,10
	jz LB_4417
	cmp al,32
	jz LB_4417
LB_4419:
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4420
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4421
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4421:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4422
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4422:
	jmp LB_4397
LB_4420:
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
	jc LB_4402
	btr r12,2
	clc
	jmp LB_4403
LB_4402:
	bts r12,2
	stc
LB_4403:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4400
	btr r12,1
	clc
	jmp LB_4401
LB_4400:
	bts r12,1
	stc
LB_4401:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4398
	btr r12,0
	clc
	jmp LB_4399
LB_4398:
	bts r12,0
	stc
LB_4399:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4394
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov rcx,r14
	bt r12,1
	jc LB_4424
	btr r12,6
	jmp LB_4425
LB_4424:
	bts r12,6
LB_4425:
	mov r14,r8
	bt r12,2
	jc LB_4426
	btr r12,1
	jmp LB_4427
LB_4426:
	bts r12,1
LB_4427:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1388 { %_4377 %_4378 } ⊢ %_4379 : %_4379
 ; {>  %_4378~1':_p1387 %_4377~0':_stg }
; _f1388 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4379 ⊢ %_4380 : %_4380
 ; {>  %_4379~°0◂{ 0' 1' }:_p1387 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4380
 ; {>  %_4380~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1387) }
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
	jc LB_4388
	btr r12,2
	jmp LB_4389
LB_4388:
	bts r12,2
LB_4389:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4386
	btr QWORD [rdi],0
	jmp LB_4387
LB_4386:
	bts QWORD [rdi],0
LB_4387:
	mov r8,r14
	bt r12,1
	jc LB_4392
	btr r12,2
	jmp LB_4393
LB_4392:
	bts r12,2
LB_4393:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4390
	btr QWORD [rdi],1
	jmp LB_4391
LB_4390:
	bts QWORD [rdi],1
LB_4391:
	mov rsi,1
	bt r12,3
	jc LB_4384
	mov rsi,0
	bt r9,0
	jc LB_4384
	jmp LB_4385
LB_4384:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4385:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4394:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4396
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4395
LB_4396:
	add rsp,8
	ret
LB_4397:
	add rsp,48
	pop r14
LB_4395:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4439
LB_4438:
	add r14,1
LB_4439:
	cmp r14,r10
	jge LB_4440
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4438
	cmp al,32
	jz LB_4438
LB_4440:
	push r10
	call NS_E_1341_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4441
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4435
LB_4441:
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
	jc LB_4436
	btr r12,0
	clc
	jmp LB_4437
LB_4436:
	bts r12,0
	stc
LB_4437:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4432
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1389 %_4381 ⊢ %_4382 : %_4382
 ; {>  %_4381~0':_stg }
; _f1389 0' ⊢ °1◂0'
; _some %_4382 ⊢ %_4383 : %_4383
 ; {>  %_4382~°1◂0':_p1387 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4383
 ; {>  %_4383~°0◂°1◂0':(_opn)◂(_p1387) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4430
	btr r12,3
	jmp LB_4431
LB_4430:
	bts r12,3
LB_4431:
	mov rsi,1
	bt r12,3
	jc LB_4428
	mov rsi,0
	bt r9,0
	jc LB_4428
	jmp LB_4429
LB_4428:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4429:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4432:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4434
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4433
LB_4434:
	add rsp,8
	ret
LB_4435:
	add rsp,16
	pop r14
LB_4433:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4443:
NS_E_RDI_4443:
NS_E_4443_ETR_TBL:
NS_E_4443_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4468
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4460
LB_4468:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_4476
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_4476
	jmp LB_4477
LB_4476:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4474
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4474:
	jmp LB_4460
LB_4477:
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
	jc LB_4463
	btr r12,1
	clc
	jmp LB_4464
LB_4463:
	bts r12,1
	stc
LB_4464:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4461
	btr r12,0
	clc
	jmp LB_4462
LB_4461:
	bts r12,0
	stc
LB_4462:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4457
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1436 %_4444 ⊢ %_4445 : %_4445
 ; {>  %_4444~0':_r64 }
; _f1436 0' ⊢ °0◂0'
; _some %_4445 ⊢ %_4446 : %_4446
 ; {>  %_4445~°0◂0':_p1435 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4446
 ; {>  %_4446~°0◂°0◂0':(_opn)◂(_p1435) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4455
	btr r12,3
	jmp LB_4456
LB_4455:
	bts r12,3
LB_4456:
	mov rsi,1
	bt r12,3
	jc LB_4453
	mov rsi,0
	bt r9,0
	jc LB_4453
	jmp LB_4454
LB_4453:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4454:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4457:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4459
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4458
LB_4459:
	add rsp,8
	ret
LB_4460:
	add rsp,32
	pop r14
LB_4458:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4491
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4485
LB_4491:
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
	jc LB_4486
	btr r12,0
	clc
	jmp LB_4487
LB_4486:
	bts r12,0
	stc
LB_4487:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4482
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1437 %_4447 ⊢ %_4448 : %_4448
 ; {>  %_4447~0':_stg }
; _f1437 0' ⊢ °1◂0'
; _some %_4448 ⊢ %_4449 : %_4449
 ; {>  %_4448~°1◂0':_p1435 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4449
 ; {>  %_4449~°0◂°1◂0':(_opn)◂(_p1435) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4480
	btr r12,3
	jmp LB_4481
LB_4480:
	bts r12,3
LB_4481:
	mov rsi,1
	bt r12,3
	jc LB_4478
	mov rsi,0
	bt r9,0
	jc LB_4478
	jmp LB_4479
LB_4478:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4479:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4482:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4484
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4483
LB_4484:
	add rsp,8
	ret
LB_4485:
	add rsp,16
	pop r14
LB_4483:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4506
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4500
LB_4506:
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
	jc LB_4501
	btr r12,0
	clc
	jmp LB_4502
LB_4501:
	bts r12,0
	stc
LB_4502:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4497
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1438 %_4450 ⊢ %_4451 : %_4451
 ; {>  %_4450~0':_p1387 }
; _f1438 0' ⊢ °2◂0'
; _some %_4451 ⊢ %_4452 : %_4452
 ; {>  %_4451~°2◂0':_p1435 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_4452
 ; {>  %_4452~°0◂°2◂0':(_opn)◂(_p1435) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4495
	btr r12,3
	jmp LB_4496
LB_4495:
	bts r12,3
LB_4496:
	mov rsi,1
	bt r12,3
	jc LB_4493
	mov rsi,0
	bt r9,0
	jc LB_4493
	jmp LB_4494
LB_4493:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4494:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4497:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4499
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4498
LB_4499:
	add rsp,8
	ret
LB_4500:
	add rsp,16
	pop r14
LB_4498:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4509:
NS_E_RDI_4509:
NS_E_4509_ETR_TBL:
NS_E_4509_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_4516
LB_4515:
	add r14,1
LB_4516:
	cmp r14,r10
	jge LB_4517
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4515
	cmp al,32
	jz LB_4515
LB_4517:
	add r14,1
	cmp r14,r10
	jg LB_4520
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4520
	jmp LB_4521
LB_4520:
	jmp LB_4511
LB_4521:
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
LB_4526:
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
	jg LB_4525
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4525
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
	jmp LB_4526
LB_4525:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4512
	btr QWORD [rdi],1
LB_4512:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4513
	btr QWORD [rdi],0
LB_4513:
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
LB_4511:
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
NS_E_4536:
; 	|» { 0' 1' }
NS_E_RDI_4536:
MTC_LB_4537:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4538
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
	jnc LB_4539
	bt QWORD [rdi],0
	jc LB_4540
	btr r12,4
	clc
	jmp LB_4541
LB_4540:
	bts r12,4
	stc
LB_4541:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4539:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4544
	btr r12,5
	clc
	jmp LB_4545
LB_4544:
	bts r12,5
	stc
LB_4545:
	mov r8,r11
	bt r12,5
	jc LB_4542
	btr r12,2
	jmp LB_4543
LB_4542:
	bts r12,2
LB_4543:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4548
	btr r12,5
	clc
	jmp LB_4549
LB_4548:
	bts r12,5
	stc
LB_4549:
	mov r9,r11
	bt r12,5
	jc LB_4546
	btr r12,3
	jmp LB_4547
LB_4546:
	bts r12,3
LB_4547:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4550:
	cmp r15,0
	jz LB_4551
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4550
LB_4551:
; _f1524 { %_4530 %_4532 } ⊢ %_4534 : %_4534
 ; {>  %_4530~0':_p1490 %_4533~3':(_lst)◂(_p1490) %_4532~2':_p1490 }
; _f1524 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f4536 { %_4534 %_4533 } ⊢ %_4535 : %_4535
 ; {>  %_4533~3':(_lst)◂(_p1490) %_4534~°2◂{ 0' 2' }:_p1490 }
; _f4536 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4552
	btr r12,1
	jmp LB_4553
LB_4552:
	bts r12,1
LB_4553:
	mov r9,r13
	bt r12,0
	jc LB_4554
	btr r12,3
	jmp LB_4555
LB_4554:
	bts r12,3
LB_4555:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_4560
	btr r12,4
	jmp LB_4561
LB_4560:
	bts r12,4
LB_4561:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_4558
	btr QWORD [rdi],0
	jmp LB_4559
LB_4558:
	bts QWORD [rdi],0
LB_4559:
	mov r10,r8
	bt r12,2
	jc LB_4564
	btr r12,4
	jmp LB_4565
LB_4564:
	bts r12,4
LB_4565:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_4562
	btr QWORD [rdi],1
	jmp LB_4563
LB_4562:
	bts QWORD [rdi],1
LB_4563:
	mov rsi,1
	bt r12,0
	jc LB_4556
	mov rsi,0
	bt r13,0
	jc LB_4556
	jmp LB_4557
LB_4556:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_4557:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_4536
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_4535
 ; {>  %_4535~0':_p1490 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4538:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4566
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
	jnc LB_4567
	bt QWORD [rdi],0
	jc LB_4568
	btr r12,2
	clc
	jmp LB_4569
LB_4568:
	bts r12,2
	stc
LB_4569:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4567:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4570:
	cmp r15,0
	jz LB_4571
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4570
LB_4571:
; ∎ %_4530
 ; {>  %_4530~0':_p1490 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4566:
NS_E_4572:
NS_E_RDI_4572:
NS_E_4572_ETR_TBL:
NS_E_4572_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4618
LB_4617:
	add r14,1
LB_4618:
	cmp r14,r10
	jge LB_4619
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4617
	cmp al,10
	jz LB_4617
	cmp al,32
	jz LB_4617
LB_4619:
	add r14,1
	cmp r14,r10
	jg LB_4622
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4622
	jmp LB_4623
LB_4622:
	jmp LB_4610
LB_4623:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
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
	push r10
	call NS_E_4573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4627
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4628
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4628:
	jmp LB_4610
LB_4627:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4631
LB_4630:
	add r14,1
LB_4631:
	cmp r14,r10
	jge LB_4632
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4630
	cmp al,10
	jz LB_4630
	cmp al,32
	jz LB_4630
LB_4632:
	add r14,1
	cmp r14,r10
	jg LB_4637
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4637
	jmp LB_4638
LB_4637:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4634
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4634:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4635
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4635:
	jmp LB_4610
LB_4638:
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
	jc LB_4615
	btr r12,2
	clc
	jmp LB_4616
LB_4615:
	bts r12,2
	stc
LB_4616:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4613
	btr r12,1
	clc
	jmp LB_4614
LB_4613:
	bts r12,1
	stc
LB_4614:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4611
	btr r12,0
	clc
	jmp LB_4612
LB_4611:
	bts r12,0
	stc
LB_4612:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4607
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_4639
	btr r12,6
	jmp LB_4640
LB_4639:
	bts r12,6
LB_4640:
	mov r13,r14
	bt r12,1
	jc LB_4641
	btr r12,0
	jmp LB_4642
LB_4641:
	bts r12,0
LB_4642:
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
; _f1433 %_4576 ⊢ %_4577 : %_4577
 ; {>  %_4576~0':(_lst)◂((_p1432)◂((_p1439)◂(_stg))) }
; _f1433 0' ⊢ °0◂0'
; _some %_4577 ⊢ %_4578 : %_4578
 ; {>  %_4577~°0◂0':(_p1432)◂((_p1439)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4578
 ; {>  %_4578~°0◂°0◂0':(_opn)◂((_p1432)◂((_p1439)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4605
	btr r12,3
	jmp LB_4606
LB_4605:
	bts r12,3
LB_4606:
	mov rsi,1
	bt r12,3
	jc LB_4603
	mov rsi,0
	bt r9,0
	jc LB_4603
	jmp LB_4604
LB_4603:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4604:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4607:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4609
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4608
LB_4609:
	add rsp,8
	ret
LB_4610:
	add rsp,48
	pop r14
LB_4608:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_4654
LB_4653:
	add r14,1
LB_4654:
	cmp r14,r10
	jge LB_4655
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4653
	cmp al,10
	jz LB_4653
	cmp al,32
	jz LB_4653
LB_4655:
	push r10
	call NS_E_4575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4656
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4650
LB_4656:
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
	jc LB_4651
	btr r12,0
	clc
	jmp LB_4652
LB_4651:
	bts r12,0
	stc
LB_4652:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4647
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1434 %_4579 ⊢ %_4580 : %_4580
 ; {>  %_4579~0':(_p1439)◂(_stg) }
; _f1434 0' ⊢ °1◂0'
; _some %_4580 ⊢ %_4581 : %_4581
 ; {>  %_4580~°1◂0':(_p1432)◂((_p1439)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4581
 ; {>  %_4581~°0◂°1◂0':(_opn)◂((_p1432)◂((_p1439)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4645
	btr r12,3
	jmp LB_4646
LB_4645:
	bts r12,3
LB_4646:
	mov rsi,1
	bt r12,3
	jc LB_4643
	mov rsi,0
	bt r9,0
	jc LB_4643
	jmp LB_4644
LB_4643:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4644:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4647:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4649
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4648
LB_4649:
	add rsp,8
	ret
LB_4650:
	add rsp,16
	pop r14
LB_4648:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4573:
NS_E_RDI_4573:
NS_E_4573_ETR_TBL:
NS_E_4573_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_4677
LB_4676:
	add r14,1
LB_4677:
	cmp r14,r10
	jge LB_4678
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4676
	cmp al,10
	jz LB_4676
	cmp al,32
	jz LB_4676
LB_4678:
	push r10
	call NS_E_4572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4679
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4671
LB_4679:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_4682
LB_4681:
	add r14,1
LB_4682:
	cmp r14,r10
	jge LB_4683
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4681
	cmp al,10
	jz LB_4681
	cmp al,32
	jz LB_4681
LB_4683:
	push r10
	call NS_E_4573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4684
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4685
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4685:
	jmp LB_4671
LB_4684:
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
	jc LB_4674
	btr r12,1
	clc
	jmp LB_4675
LB_4674:
	bts r12,1
	stc
LB_4675:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4672
	btr r12,0
	clc
	jmp LB_4673
LB_4672:
	bts r12,0
	stc
LB_4673:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4668
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_4582 %_4583 } ⊢ %_4584 : %_4584
 ; {>  %_4582~0':(_p1432)◂((_p1439)◂(_stg)) %_4583~1':(_lst)◂((_p1432)◂((_p1439)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4584 ⊢ %_4585 : %_4585
 ; {>  %_4584~°0◂{ 0' 1' }:(_lst)◂((_p1432)◂((_p1439)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4585
 ; {>  %_4585~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1432)◂((_p1439)◂(_stg)))) }
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
	jc LB_4662
	btr r12,2
	jmp LB_4663
LB_4662:
	bts r12,2
LB_4663:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4660
	btr QWORD [rdi],0
	jmp LB_4661
LB_4660:
	bts QWORD [rdi],0
LB_4661:
	mov r8,r14
	bt r12,1
	jc LB_4666
	btr r12,2
	jmp LB_4667
LB_4666:
	bts r12,2
LB_4667:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4664
	btr QWORD [rdi],1
	jmp LB_4665
LB_4664:
	bts QWORD [rdi],1
LB_4665:
	mov rsi,1
	bt r12,3
	jc LB_4658
	mov rsi,0
	bt r9,0
	jc LB_4658
	jmp LB_4659
LB_4658:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4659:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4668:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4670
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4669
LB_4670:
	add rsp,8
	ret
LB_4671:
	add rsp,32
	pop r14
LB_4669:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4689
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4586 : %_4586
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4586 ⊢ %_4587 : %_4587
 ; {>  %_4586~°1◂{  }:(_lst)◂(t1824'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4587
 ; {>  %_4587~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1827'(0))) }
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
	jc LB_4687
	mov rsi,0
	bt r9,0
	jc LB_4687
	jmp LB_4688
LB_4687:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4688:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4689:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4691
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4690
LB_4691:
	add rsp,8
	ret
LB_4692:
	add rsp,0
	pop r14
LB_4690:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4574:
NS_E_RDI_4574:
NS_E_4574_ETR_TBL:
NS_E_4574_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
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
	add r14,1
	cmp r14,r10
	jg LB_4732
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4732
	jmp LB_4733
LB_4732:
	jmp LB_4706
LB_4733:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_4715
LB_4714:
	add r14,1
LB_4715:
	cmp r14,r10
	jge LB_4716
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4714
	cmp al,10
	jz LB_4714
	cmp al,32
	jz LB_4714
LB_4716:
	push r10
	call NS_E_4575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4717
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4718
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4718:
	jmp LB_4707
LB_4717:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_4721
LB_4720:
	add r14,1
LB_4721:
	cmp r14,r10
	jge LB_4722
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4720
	cmp al,10
	jz LB_4720
	cmp al,32
	jz LB_4720
LB_4722:
	push r10
	call NS_E_4574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4723
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4724
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4724:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4725
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4725:
	jmp LB_4707
LB_4723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4712
	btr r12,2
	clc
	jmp LB_4713
LB_4712:
	bts r12,2
	stc
LB_4713:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4710
	btr r12,1
	clc
	jmp LB_4711
LB_4710:
	bts r12,1
	stc
LB_4711:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4708
	btr r12,0
	clc
	jmp LB_4709
LB_4708:
	bts r12,0
	stc
LB_4709:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4703
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4734
	btr r12,3
	jmp LB_4735
LB_4734:
	bts r12,3
LB_4735:
	mov r14,r8
	bt r12,2
	jc LB_4736
	btr r12,1
	jmp LB_4737
LB_4736:
	bts r12,1
LB_4737:
	mov r8,r13
	bt r12,0
	jc LB_4738
	btr r12,2
	jmp LB_4739
LB_4738:
	bts r12,2
LB_4739:
	mov r13,r9
	bt r12,3
	jc LB_4740
	btr r12,0
	jmp LB_4741
LB_4740:
	bts r12,0
LB_4741:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4588 %_4589 } ⊢ %_4590 : %_4590
 ; {>  %_4588~0':(_p1439)◂(_stg) %_4589~1':(_lst)◂((_p1439)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4590 ⊢ %_4591 : %_4591
 ; {>  %_4590~°0◂{ 0' 1' }:(_lst)◂((_p1439)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4591
 ; {>  %_4591~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1439)◂(_stg))) }
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
	jc LB_4697
	btr r12,2
	jmp LB_4698
LB_4697:
	bts r12,2
LB_4698:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4695
	btr QWORD [rdi],0
	jmp LB_4696
LB_4695:
	bts QWORD [rdi],0
LB_4696:
	mov r8,r14
	bt r12,1
	jc LB_4701
	btr r12,2
	jmp LB_4702
LB_4701:
	bts r12,2
LB_4702:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4699
	btr QWORD [rdi],1
	jmp LB_4700
LB_4699:
	bts QWORD [rdi],1
LB_4700:
	mov rsi,1
	bt r12,3
	jc LB_4693
	mov rsi,0
	bt r9,0
	jc LB_4693
	jmp LB_4694
LB_4693:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4694:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4703:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4705
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4704
LB_4705:
	add rsp,8
	ret
LB_4707:
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
LB_4706:
	add rsp,48
	pop r14
LB_4704:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4744
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4592 : %_4592
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4592 ⊢ %_4593 : %_4593
 ; {>  %_4592~°1◂{  }:(_lst)◂(t1837'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4593
 ; {>  %_4593~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1840'(0))) }
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
	jc LB_4742
	mov rsi,0
	bt r9,0
	jc LB_4742
	jmp LB_4743
LB_4742:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4743:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4744:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4746
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4745
LB_4746:
	add rsp,8
	ret
LB_4747:
	add rsp,0
	pop r14
LB_4745:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4575:
NS_E_RDI_4575:
NS_E_4575_ETR_TBL:
NS_E_4575_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_4763
LB_4762:
	add r14,1
LB_4763:
	cmp r14,r10
	jge LB_4764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4762
	cmp al,10
	jz LB_4762
	cmp al,32
	jz LB_4762
LB_4764:
	add r14,2
	cmp r14,r10
	jg LB_4767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_4767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4767
	jmp LB_4768
LB_4767:
	jmp LB_4755
LB_4768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
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
	push r10
	call NS_E_4443_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4772
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4773
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4773:
	jmp LB_4755
LB_4772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_4776
LB_4775:
	add r14,1
LB_4776:
	cmp r14,r10
	jge LB_4777
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4775
	cmp al,10
	jz LB_4775
	cmp al,32
	jz LB_4775
LB_4777:
	add r14,1
	cmp r14,r10
	jg LB_4782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_4782
	jmp LB_4783
LB_4782:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4779
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4779:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4780:
	jmp LB_4755
LB_4783:
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
	jc LB_4760
	btr r12,2
	clc
	jmp LB_4761
LB_4760:
	bts r12,2
	stc
LB_4761:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4758
	btr r12,1
	clc
	jmp LB_4759
LB_4758:
	bts r12,1
	stc
LB_4759:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4756
	btr r12,0
	clc
	jmp LB_4757
LB_4756:
	bts r12,0
	stc
LB_4757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4752
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_4784
	btr r12,6
	jmp LB_4785
LB_4784:
	bts r12,6
LB_4785:
	mov r13,r14
	bt r12,1
	jc LB_4786
	btr r12,0
	jmp LB_4787
LB_4786:
	bts r12,0
LB_4787:
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
; _f1441 %_4594 ⊢ %_4595 : %_4595
 ; {>  %_4594~0':_p1435 }
; _f1441 0' ⊢ °0◂0'
; _some %_4595 ⊢ %_4596 : %_4596
 ; {>  %_4595~°0◂0':(_p1439)◂(t1845'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4596
 ; {>  %_4596~°0◂°0◂0':(_opn)◂((_p1439)◂(t1848'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4750
	btr r12,3
	jmp LB_4751
LB_4750:
	bts r12,3
LB_4751:
	mov rsi,1
	bt r12,3
	jc LB_4748
	mov rsi,0
	bt r9,0
	jc LB_4748
	jmp LB_4749
LB_4748:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4749:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4752:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4754
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4753
LB_4754:
	add rsp,8
	ret
LB_4755:
	add rsp,48
	pop r14
LB_4753:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_4812
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_4812
	jmp LB_4813
LB_4812:
	jmp LB_4795
LB_4813:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_1341_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4804
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4805
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4805:
	jmp LB_4796
LB_4804:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4799
	btr r12,1
	clc
	jmp LB_4800
LB_4799:
	bts r12,1
	stc
LB_4800:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4797
	btr r12,0
	clc
	jmp LB_4798
LB_4797:
	bts r12,0
	stc
LB_4798:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4792
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4814
	btr r12,2
	jmp LB_4815
LB_4814:
	bts r12,2
LB_4815:
	mov r13,r14
	bt r12,1
	jc LB_4816
	btr r12,0
	jmp LB_4817
LB_4816:
	bts r12,0
LB_4817:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1442 %_4597 ⊢ %_4598 : %_4598
 ; {>  %_4597~0':_stg }
; _f1442 0' ⊢ °1◂0'
; _some %_4598 ⊢ %_4599 : %_4599
 ; {>  %_4598~°1◂0':(_p1439)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4599
 ; {>  %_4599~°0◂°1◂0':(_opn)◂((_p1439)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4790
	btr r12,3
	jmp LB_4791
LB_4790:
	bts r12,3
LB_4791:
	mov rsi,1
	bt r12,3
	jc LB_4788
	mov rsi,0
	bt r9,0
	jc LB_4788
	jmp LB_4789
LB_4788:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4789:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4792:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4794
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4793
LB_4794:
	add rsp,8
	ret
LB_4796:
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
LB_4795:
	add rsp,32
	pop r14
LB_4793:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4829
LB_4828:
	add r14,1
LB_4829:
	cmp r14,r10
	jge LB_4830
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4828
	cmp al,10
	jz LB_4828
	cmp al,32
	jz LB_4828
LB_4830:
	push r10
	call NS_E_1341_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4831
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4825
LB_4831:
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
	jc LB_4826
	btr r12,0
	clc
	jmp LB_4827
LB_4826:
	bts r12,0
	stc
LB_4827:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4822
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1442 %_4600 ⊢ %_4601 : %_4601
 ; {>  %_4600~0':_stg }
; _f1442 0' ⊢ °1◂0'
; _some %_4601 ⊢ %_4602 : %_4602
 ; {>  %_4601~°1◂0':(_p1439)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4602
 ; {>  %_4602~°0◂°1◂0':(_opn)◂((_p1439)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4820
	btr r12,3
	jmp LB_4821
LB_4820:
	bts r12,3
LB_4821:
	mov rsi,1
	bt r12,3
	jc LB_4818
	mov rsi,0
	bt r9,0
	jc LB_4818
	jmp LB_4819
LB_4818:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4819:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4822:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4824
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4823
LB_4824:
	add rsp,8
	ret
LB_4825:
	add rsp,16
	pop r14
LB_4823:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4833:
NS_E_RDI_4833:
NS_E_4833_ETR_TBL:
NS_E_4833_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4885
LB_4884:
	add r14,1
LB_4885:
	cmp r14,r10
	jge LB_4886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4884
	cmp al,10
	jz LB_4884
	cmp al,32
	jz LB_4884
LB_4886:
	add r14,1
	cmp r14,r10
	jg LB_4889
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4889
	jmp LB_4890
LB_4889:
	jmp LB_4877
LB_4890:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
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
	push r10
	call NS_E_4834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4894
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4895
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4895:
	jmp LB_4877
LB_4894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4898
LB_4897:
	add r14,1
LB_4898:
	cmp r14,r10
	jge LB_4899
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4897
	cmp al,10
	jz LB_4897
	cmp al,32
	jz LB_4897
LB_4899:
	add r14,1
	cmp r14,r10
	jg LB_4904
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4904
	jmp LB_4905
LB_4904:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4901
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4901:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4902:
	jmp LB_4877
LB_4905:
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
	jc LB_4882
	btr r12,2
	clc
	jmp LB_4883
LB_4882:
	bts r12,2
	stc
LB_4883:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4880
	btr r12,1
	clc
	jmp LB_4881
LB_4880:
	bts r12,1
	stc
LB_4881:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4878
	btr r12,0
	clc
	jmp LB_4879
LB_4878:
	bts r12,0
	stc
LB_4879:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4874
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_4906
	btr r12,6
	jmp LB_4907
LB_4906:
	bts r12,6
LB_4907:
	mov r13,r14
	bt r12,1
	jc LB_4908
	btr r12,0
	jmp LB_4909
LB_4908:
	bts r12,0
LB_4909:
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
; _f1433 %_4838 ⊢ %_4839 : %_4839
 ; {>  %_4838~0':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) }
; _f1433 0' ⊢ °0◂0'
; _some %_4839 ⊢ %_4840 : %_4840
 ; {>  %_4839~°0◂0':(_p1432)◂((_p1440)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4840
 ; {>  %_4840~°0◂°0◂0':(_opn)◂((_p1432)◂((_p1440)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4872
	btr r12,3
	jmp LB_4873
LB_4872:
	bts r12,3
LB_4873:
	mov rsi,1
	bt r12,3
	jc LB_4870
	mov rsi,0
	bt r9,0
	jc LB_4870
	jmp LB_4871
LB_4870:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4871:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4874:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4876
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4875
LB_4876:
	add rsp,8
	ret
LB_4877:
	add rsp,48
	pop r14
LB_4875:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_4921
LB_4920:
	add r14,1
LB_4921:
	cmp r14,r10
	jge LB_4922
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4920
	cmp al,10
	jz LB_4920
	cmp al,32
	jz LB_4920
LB_4922:
	push r10
	call NS_E_4837_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4923
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4917
LB_4923:
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
	jc LB_4918
	btr r12,0
	clc
	jmp LB_4919
LB_4918:
	bts r12,0
	stc
LB_4919:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4914
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1434 %_4841 ⊢ %_4842 : %_4842
 ; {>  %_4841~0':(_p1440)◂(_stg) }
; _f1434 0' ⊢ °1◂0'
; _some %_4842 ⊢ %_4843 : %_4843
 ; {>  %_4842~°1◂0':(_p1432)◂((_p1440)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4843
 ; {>  %_4843~°0◂°1◂0':(_opn)◂((_p1432)◂((_p1440)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4912
	btr r12,3
	jmp LB_4913
LB_4912:
	bts r12,3
LB_4913:
	mov rsi,1
	bt r12,3
	jc LB_4910
	mov rsi,0
	bt r9,0
	jc LB_4910
	jmp LB_4911
LB_4910:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4911:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4914:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4916
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4915
LB_4916:
	add rsp,8
	ret
LB_4917:
	add rsp,16
	pop r14
LB_4915:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4834:
NS_E_RDI_4834:
NS_E_4834_ETR_TBL:
NS_E_4834_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_4944
LB_4943:
	add r14,1
LB_4944:
	cmp r14,r10
	jge LB_4945
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4943
	cmp al,10
	jz LB_4943
	cmp al,32
	jz LB_4943
LB_4945:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4946
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4938
LB_4946:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_4949
LB_4948:
	add r14,1
LB_4949:
	cmp r14,r10
	jge LB_4950
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4948
	cmp al,10
	jz LB_4948
	cmp al,32
	jz LB_4948
LB_4950:
	push r10
	call NS_E_4834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4951
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4952
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4952:
	jmp LB_4938
LB_4951:
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
	jc LB_4941
	btr r12,1
	clc
	jmp LB_4942
LB_4941:
	bts r12,1
	stc
LB_4942:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4939
	btr r12,0
	clc
	jmp LB_4940
LB_4939:
	bts r12,0
	stc
LB_4940:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4935
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_4844 %_4845 } ⊢ %_4846 : %_4846
 ; {>  %_4845~1':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) %_4844~0':(_p1432)◂((_p1440)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4846 ⊢ %_4847 : %_4847
 ; {>  %_4846~°0◂{ 0' 1' }:(_lst)◂((_p1432)◂((_p1440)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4847
 ; {>  %_4847~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1432)◂((_p1440)◂(_stg)))) }
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
	jc LB_4929
	btr r12,2
	jmp LB_4930
LB_4929:
	bts r12,2
LB_4930:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4927
	btr QWORD [rdi],0
	jmp LB_4928
LB_4927:
	bts QWORD [rdi],0
LB_4928:
	mov r8,r14
	bt r12,1
	jc LB_4933
	btr r12,2
	jmp LB_4934
LB_4933:
	bts r12,2
LB_4934:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4931
	btr QWORD [rdi],1
	jmp LB_4932
LB_4931:
	bts QWORD [rdi],1
LB_4932:
	mov rsi,1
	bt r12,3
	jc LB_4925
	mov rsi,0
	bt r9,0
	jc LB_4925
	jmp LB_4926
LB_4925:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4926:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4935:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4937
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4936
LB_4937:
	add rsp,8
	ret
LB_4938:
	add rsp,32
	pop r14
LB_4936:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4956
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4848 : %_4848
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4848 ⊢ %_4849 : %_4849
 ; {>  %_4848~°1◂{  }:(_lst)◂(t1937'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4849
 ; {>  %_4849~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1940'(0))) }
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
	jc LB_4954
	mov rsi,0
	bt r9,0
	jc LB_4954
	jmp LB_4955
LB_4954:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4955:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4956:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4958
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4957
LB_4958:
	add rsp,8
	ret
LB_4959:
	add rsp,0
	pop r14
LB_4957:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4835:
NS_E_RDI_4835:
NS_E_4835_ETR_TBL:
NS_E_4835_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
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
	add r14,1
	cmp r14,r10
	jg LB_4999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4999
	jmp LB_5000
LB_4999:
	jmp LB_4973
LB_5000:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_4982
LB_4981:
	add r14,1
LB_4982:
	cmp r14,r10
	jge LB_4983
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4981
	cmp al,10
	jz LB_4981
	cmp al,32
	jz LB_4981
LB_4983:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4984
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4985:
	jmp LB_4974
LB_4984:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_4988
LB_4987:
	add r14,1
LB_4988:
	cmp r14,r10
	jge LB_4989
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4987
	cmp al,10
	jz LB_4987
	cmp al,32
	jz LB_4987
LB_4989:
	push r10
	call NS_E_4835_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4990
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4991
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4991:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4992
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4992:
	jmp LB_4974
LB_4990:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4979
	btr r12,2
	clc
	jmp LB_4980
LB_4979:
	bts r12,2
	stc
LB_4980:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4977
	btr r12,1
	clc
	jmp LB_4978
LB_4977:
	bts r12,1
	stc
LB_4978:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4975
	btr r12,0
	clc
	jmp LB_4976
LB_4975:
	bts r12,0
	stc
LB_4976:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4970
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5001
	btr r12,3
	jmp LB_5002
LB_5001:
	bts r12,3
LB_5002:
	mov r14,r8
	bt r12,2
	jc LB_5003
	btr r12,1
	jmp LB_5004
LB_5003:
	bts r12,1
LB_5004:
	mov r8,r13
	bt r12,0
	jc LB_5005
	btr r12,2
	jmp LB_5006
LB_5005:
	bts r12,2
LB_5006:
	mov r13,r9
	bt r12,3
	jc LB_5007
	btr r12,0
	jmp LB_5008
LB_5007:
	bts r12,0
LB_5008:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4850 %_4851 } ⊢ %_4852 : %_4852
 ; {>  %_4851~1':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) %_4850~0':(_p1432)◂((_p1440)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4852 ⊢ %_4853 : %_4853
 ; {>  %_4852~°0◂{ 0' 1' }:(_lst)◂((_p1432)◂((_p1440)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4853
 ; {>  %_4853~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1432)◂((_p1440)◂(_stg)))) }
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
	jc LB_4964
	btr r12,2
	jmp LB_4965
LB_4964:
	bts r12,2
LB_4965:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4962
	btr QWORD [rdi],0
	jmp LB_4963
LB_4962:
	bts QWORD [rdi],0
LB_4963:
	mov r8,r14
	bt r12,1
	jc LB_4968
	btr r12,2
	jmp LB_4969
LB_4968:
	bts r12,2
LB_4969:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4966
	btr QWORD [rdi],1
	jmp LB_4967
LB_4966:
	bts QWORD [rdi],1
LB_4967:
	mov rsi,1
	bt r12,3
	jc LB_4960
	mov rsi,0
	bt r9,0
	jc LB_4960
	jmp LB_4961
LB_4960:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4961:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4970:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4972
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4971
LB_4972:
	add rsp,8
	ret
LB_4974:
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
LB_4973:
	add rsp,48
	pop r14
LB_4971:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5011
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4854 : %_4854
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4854 ⊢ %_4855 : %_4855
 ; {>  %_4854~°1◂{  }:(_lst)◂(t1950'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4855
 ; {>  %_4855~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1953'(0))) }
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
	jc LB_5009
	mov rsi,0
	bt r9,0
	jc LB_5009
	jmp LB_5010
LB_5009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5010:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5011:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5013
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5012
LB_5013:
	add rsp,8
	ret
LB_5014:
	add rsp,0
	pop r14
LB_5012:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4836:
NS_E_RDI_4836:
NS_E_4836_ETR_TBL:
NS_E_4836_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
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
	add r14,1
	cmp r14,r10
	jg LB_5054
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_5054
	jmp LB_5055
LB_5054:
	jmp LB_5028
LB_5055:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_5037
LB_5036:
	add r14,1
LB_5037:
	cmp r14,r10
	jge LB_5038
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5036
	cmp al,10
	jz LB_5036
	cmp al,32
	jz LB_5036
LB_5038:
	push r10
	call NS_E_4837_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5039
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5040
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5040:
	jmp LB_5029
LB_5039:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_5043
LB_5042:
	add r14,1
LB_5043:
	cmp r14,r10
	jge LB_5044
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5042
	cmp al,10
	jz LB_5042
	cmp al,32
	jz LB_5042
LB_5044:
	push r10
	call NS_E_4836_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5045
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5046
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5046:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5047:
	jmp LB_5029
LB_5045:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5034
	btr r12,2
	clc
	jmp LB_5035
LB_5034:
	bts r12,2
	stc
LB_5035:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5032
	btr r12,1
	clc
	jmp LB_5033
LB_5032:
	bts r12,1
	stc
LB_5033:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5030
	btr r12,0
	clc
	jmp LB_5031
LB_5030:
	bts r12,0
	stc
LB_5031:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5025
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5056
	btr r12,3
	jmp LB_5057
LB_5056:
	bts r12,3
LB_5057:
	mov r14,r8
	bt r12,2
	jc LB_5058
	btr r12,1
	jmp LB_5059
LB_5058:
	bts r12,1
LB_5059:
	mov r8,r13
	bt r12,0
	jc LB_5060
	btr r12,2
	jmp LB_5061
LB_5060:
	bts r12,2
LB_5061:
	mov r13,r9
	bt r12,3
	jc LB_5062
	btr r12,0
	jmp LB_5063
LB_5062:
	bts r12,0
LB_5063:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4856 %_4857 } ⊢ %_4858 : %_4858
 ; {>  %_4856~0':(_p1440)◂(_stg) %_4857~1':(_lst)◂((_p1440)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4858 ⊢ %_4859 : %_4859
 ; {>  %_4858~°0◂{ 0' 1' }:(_lst)◂((_p1440)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4859
 ; {>  %_4859~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1440)◂(_stg))) }
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
	jc LB_5019
	btr r12,2
	jmp LB_5020
LB_5019:
	bts r12,2
LB_5020:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5017
	btr QWORD [rdi],0
	jmp LB_5018
LB_5017:
	bts QWORD [rdi],0
LB_5018:
	mov r8,r14
	bt r12,1
	jc LB_5023
	btr r12,2
	jmp LB_5024
LB_5023:
	bts r12,2
LB_5024:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5021
	btr QWORD [rdi],1
	jmp LB_5022
LB_5021:
	bts QWORD [rdi],1
LB_5022:
	mov rsi,1
	bt r12,3
	jc LB_5015
	mov rsi,0
	bt r9,0
	jc LB_5015
	jmp LB_5016
LB_5015:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5016:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5025:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5027
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5026
LB_5027:
	add rsp,8
	ret
LB_5029:
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
LB_5028:
	add rsp,48
	pop r14
LB_5026:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5066
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4860 : %_4860
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4860 ⊢ %_4861 : %_4861
 ; {>  %_4860~°1◂{  }:(_lst)◂(t1963'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4861
 ; {>  %_4861~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1966'(0))) }
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
	jc LB_5064
	mov rsi,0
	bt r9,0
	jc LB_5064
	jmp LB_5065
LB_5064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5065:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5066:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5068
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5067
LB_5068:
	add rsp,8
	ret
LB_5069:
	add rsp,0
	pop r14
LB_5067:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4837:
NS_E_RDI_4837:
NS_E_4837_ETR_TBL:
NS_E_4837_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_5094
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_5094
	jmp LB_5095
LB_5094:
	jmp LB_5077
LB_5095:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5086
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5087
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5087:
	jmp LB_5078
LB_5086:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5081
	btr r12,1
	clc
	jmp LB_5082
LB_5081:
	bts r12,1
	stc
LB_5082:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5079
	btr r12,0
	clc
	jmp LB_5080
LB_5079:
	bts r12,0
	stc
LB_5080:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5074
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5096
	btr r12,2
	jmp LB_5097
LB_5096:
	bts r12,2
LB_5097:
	mov r13,r14
	bt r12,1
	jc LB_5098
	btr r12,0
	jmp LB_5099
LB_5098:
	bts r12,0
LB_5099:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1444 %_4862 ⊢ %_4863 : %_4863
 ; {>  %_4862~0':_stg }
; _f1444 0' ⊢ °1◂0'
; _some %_4863 ⊢ %_4864 : %_4864
 ; {>  %_4863~°1◂0':(_p1440)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4864
 ; {>  %_4864~°0◂°1◂0':(_opn)◂((_p1440)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5072
	btr r12,3
	jmp LB_5073
LB_5072:
	bts r12,3
LB_5073:
	mov rsi,1
	bt r12,3
	jc LB_5070
	mov rsi,0
	bt r9,0
	jc LB_5070
	jmp LB_5071
LB_5070:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5071:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5074:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5076
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5075
LB_5076:
	add rsp,8
	ret
LB_5078:
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
LB_5077:
	add rsp,32
	pop r14
LB_5075:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5113
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5107
LB_5113:
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
	jc LB_5108
	btr r12,0
	clc
	jmp LB_5109
LB_5108:
	bts r12,0
	stc
LB_5109:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5104
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1444 %_4865 ⊢ %_4866 : %_4866
 ; {>  %_4865~0':_stg }
; _f1444 0' ⊢ °1◂0'
; _some %_4866 ⊢ %_4867 : %_4867
 ; {>  %_4866~°1◂0':(_p1440)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4867
 ; {>  %_4867~°0◂°1◂0':(_opn)◂((_p1440)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5102
	btr r12,3
	jmp LB_5103
LB_5102:
	bts r12,3
LB_5103:
	mov rsi,1
	bt r12,3
	jc LB_5100
	mov rsi,0
	bt r9,0
	jc LB_5100
	jmp LB_5101
LB_5100:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5101:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5104:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5106
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5105
LB_5106:
	add rsp,8
	ret
LB_5107:
	add rsp,16
	pop r14
LB_5105:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_5128
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5128
	jmp LB_5129
LB_5128:
	jmp LB_5120
LB_5129:
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
	jc LB_5121
	btr r12,0
	clc
	jmp LB_5122
LB_5121:
	bts r12,0
	stc
LB_5122:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5117
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1443 {  } ⊢ %_4868 : %_4868
 ; {>  }
; _f1443 {  } ⊢ °0◂{  }
; _some %_4868 ⊢ %_4869 : %_4869
 ; {>  %_4868~°0◂{  }:(_p1440)◂(t1980'(0)) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_4869
 ; {>  %_4869~°0◂°0◂{  }:(_opn)◂((_p1440)◂(t1983'(0))) }
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
	jc LB_5115
	mov rsi,0
	bt r9,0
	jc LB_5115
	jmp LB_5116
LB_5115:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5116:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5117:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5119
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5118
LB_5119:
	add rsp,8
	ret
LB_5120:
	add rsp,16
	pop r14
LB_5118:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5130:
NS_E_RDI_5130:
NS_E_5130_ETR_TBL:
NS_E_5130_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_5208
LB_5207:
	add r14,1
LB_5208:
	cmp r14,r10
	jge LB_5209
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5207
	cmp al,10
	jz LB_5207
	cmp al,32
	jz LB_5207
LB_5209:
	push r10
	call NS_E_5133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5210
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5200
LB_5210:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_5213
LB_5212:
	add r14,1
LB_5213:
	cmp r14,r10
	jge LB_5214
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5212
	cmp al,10
	jz LB_5212
	cmp al,32
	jz LB_5212
LB_5214:
	push r10
	call NS_E_5132_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5215
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5216
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5216:
	jmp LB_5200
LB_5215:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_5219
LB_5218:
	add r14,1
LB_5219:
	cmp r14,r10
	jge LB_5220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5218
	cmp al,10
	jz LB_5218
	cmp al,32
	jz LB_5218
LB_5220:
	push r10
	call NS_E_5131_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5221
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5222
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5222:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5223
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5223:
	jmp LB_5200
LB_5221:
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
	jc LB_5205
	btr r12,2
	clc
	jmp LB_5206
LB_5205:
	bts r12,2
	stc
LB_5206:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5203
	btr r12,1
	clc
	jmp LB_5204
LB_5203:
	bts r12,1
	stc
LB_5204:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5201
	btr r12,0
	clc
	jmp LB_5202
LB_5201:
	bts r12,0
	stc
LB_5202:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5197
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	bts r12,3
	bts r12,4
	bts r12,5
; _f4536 { %_5135 %_5136 } ⊢ %_5138 : %_5138
 ; {>  %_5136~1':(_lst)◂(_p1490) %_5137~2':(_opn)◂(_p1490) %_5135~0':_p1490 }
; _f4536 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4536
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_5168
	btr r12,2
	clc
	jmp LB_5169
LB_5168:
	bts r12,2
	stc
LB_5169:
	add rsp,16
MTC_LB_5170:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5171
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
	jnc LB_5172
	bt QWORD [rdi],0
	jc LB_5173
	btr r12,3
	clc
	jmp LB_5174
LB_5173:
	bts r12,3
	stc
LB_5174:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5172:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_5175
	btr r12,1
	jmp LB_5176
LB_5175:
	bts r12,1
LB_5176:
LB_5177:
	cmp r15,0
	jz LB_5178
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5177
LB_5178:
; _f1523 { %_5138 %_5139 } ⊢ %_5140 : %_5140
 ; {>  %_5139~1':_p1490 %_5138~0':_p1490 }
; _f1523 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5140 ⊢ %_5141 : %_5141
 ; {>  %_5140~°1◂{ 0' 1' }:_p1490 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5141
 ; {>  %_5141~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1490) }
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
	jc LB_5183
	btr r12,2
	jmp LB_5184
LB_5183:
	bts r12,2
LB_5184:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5181
	btr QWORD [rdi],0
	jmp LB_5182
LB_5181:
	bts QWORD [rdi],0
LB_5182:
	mov r8,r14
	bt r12,1
	jc LB_5187
	btr r12,2
	jmp LB_5188
LB_5187:
	bts r12,2
LB_5188:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5185
	btr QWORD [rdi],1
	jmp LB_5186
LB_5185:
	bts QWORD [rdi],1
LB_5186:
	mov rsi,1
	bt r12,3
	jc LB_5179
	mov rsi,0
	bt r9,0
	jc LB_5179
	jmp LB_5180
LB_5179:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5180:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_5171:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_5189
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
	jnc LB_5190
	bt QWORD [rdi],0
	jc LB_5191
	btr r12,1
	clc
	jmp LB_5192
LB_5191:
	bts r12,1
	stc
LB_5192:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5190:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5193:
	cmp r15,0
	jz LB_5194
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5193
LB_5194:
; _some %_5138 ⊢ %_5142 : %_5142
 ; {>  %_5138~0':_p1490 }
; _some 0' ⊢ °0◂0'
; ∎ %_5142
 ; {>  %_5142~°0◂0':(_opn)◂(_p1490) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5195
	btr r12,3
	jmp LB_5196
LB_5195:
	bts r12,3
LB_5196:
	mov r8,0
	bts r12,2
	ret
MTC_LB_5189:
LB_5197:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5199
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5198
LB_5199:
	add rsp,8
	ret
LB_5200:
	add rsp,48
	pop r14
LB_5198:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5131:
NS_E_RDI_5131:
NS_E_5131_ETR_TBL:
NS_E_5131_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_5238
LB_5237:
	add r14,1
LB_5238:
	cmp r14,r10
	jge LB_5239
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5237
	cmp al,10
	jz LB_5237
	cmp al,32
	jz LB_5237
LB_5239:
	add r14,3
	cmp r14,r10
	jg LB_5242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_5242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_5242
	jmp LB_5243
LB_5242:
	jmp LB_5232
LB_5243:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
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
	push r10
	call NS_E_5130_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5247
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5248
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5248:
	jmp LB_5232
LB_5247:
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
	jc LB_5235
	btr r12,1
	clc
	jmp LB_5236
LB_5235:
	bts r12,1
	stc
LB_5236:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5233
	btr r12,0
	clc
	jmp LB_5234
LB_5233:
	bts r12,0
	stc
LB_5234:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5229
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_5250
	btr r12,5
	jmp LB_5251
LB_5250:
	bts r12,5
LB_5251:
	mov r13,r14
	bt r12,1
	jc LB_5252
	btr r12,0
	jmp LB_5253
LB_5252:
	bts r12,0
LB_5253:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5143 ⊢ %_5144 : %_5144
 ; {>  %_5143~0':_p1490 }
; _some 0' ⊢ °0◂0'
; _some %_5144 ⊢ %_5145 : %_5145
 ; {>  %_5144~°0◂0':(_opn)◂(_p1490) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5145
 ; {>  %_5145~°0◂°0◂0':(_opn)◂((_opn)◂(_p1490)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5227
	btr r12,3
	jmp LB_5228
LB_5227:
	bts r12,3
LB_5228:
	mov rsi,1
	bt r12,3
	jc LB_5225
	mov rsi,0
	bt r9,0
	jc LB_5225
	jmp LB_5226
LB_5225:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5226:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5229:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5231
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5230
LB_5231:
	add rsp,8
	ret
LB_5232:
	add rsp,32
	pop r14
LB_5230:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5256
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_5146 : %_5146
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5146 ⊢ %_5147 : %_5147
 ; {>  %_5146~°1◂{  }:(_opn)◂(t2078'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5147
 ; {>  %_5147~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2081'(0))) }
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
	jc LB_5254
	mov rsi,0
	bt r9,0
	jc LB_5254
	jmp LB_5255
LB_5254:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5255:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5256:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5258
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5257
LB_5258:
	add rsp,8
	ret
LB_5259:
	add rsp,0
	pop r14
LB_5257:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5132:
NS_E_RDI_5132:
NS_E_5132_ETR_TBL:
NS_E_5132_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_5281
LB_5280:
	add r14,1
LB_5281:
	cmp r14,r10
	jge LB_5282
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5280
	cmp al,10
	jz LB_5280
	cmp al,32
	jz LB_5280
LB_5282:
	add r14,3
	cmp r14,r10
	jg LB_5285
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5285
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_5285
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_5285
	jmp LB_5286
LB_5285:
	jmp LB_5273
LB_5286:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
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
	push r10
	call NS_E_5133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5290
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5291
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5291:
	jmp LB_5273
LB_5290:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_5294
LB_5293:
	add r14,1
LB_5294:
	cmp r14,r10
	jge LB_5295
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5293
	cmp al,10
	jz LB_5293
	cmp al,32
	jz LB_5293
LB_5295:
	push r10
	call NS_E_5132_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5296
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5297
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5297:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5298
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5298:
	jmp LB_5273
LB_5296:
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
	jc LB_5278
	btr r12,2
	clc
	jmp LB_5279
LB_5278:
	bts r12,2
	stc
LB_5279:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5276
	btr r12,1
	clc
	jmp LB_5277
LB_5276:
	bts r12,1
	stc
LB_5277:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5274
	btr r12,0
	clc
	jmp LB_5275
LB_5274:
	bts r12,0
	stc
LB_5275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5270
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov rcx,r14
	bt r12,1
	jc LB_5300
	btr r12,6
	jmp LB_5301
LB_5300:
	bts r12,6
LB_5301:
	mov r14,r8
	bt r12,2
	jc LB_5302
	btr r12,1
	jmp LB_5303
LB_5302:
	bts r12,1
LB_5303:
	mov r8,r13
	bt r12,0
	jc LB_5304
	btr r12,2
	jmp LB_5305
LB_5304:
	bts r12,2
LB_5305:
	mov r13,rcx
	bt r12,6
	jc LB_5306
	btr r12,0
	jmp LB_5307
LB_5306:
	bts r12,0
LB_5307:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _cns { %_5148 %_5149 } ⊢ %_5150 : %_5150
 ; {>  %_5149~1':(_lst)◂(_p1490) %_5148~0':_p1490 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5150 ⊢ %_5151 : %_5151
 ; {>  %_5150~°0◂{ 0' 1' }:(_lst)◂(_p1490) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5151
 ; {>  %_5151~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1490)) }
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
	jc LB_5264
	btr r12,2
	jmp LB_5265
LB_5264:
	bts r12,2
LB_5265:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5262
	btr QWORD [rdi],0
	jmp LB_5263
LB_5262:
	bts QWORD [rdi],0
LB_5263:
	mov r8,r14
	bt r12,1
	jc LB_5268
	btr r12,2
	jmp LB_5269
LB_5268:
	bts r12,2
LB_5269:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5266
	btr QWORD [rdi],1
	jmp LB_5267
LB_5266:
	bts QWORD [rdi],1
LB_5267:
	mov rsi,1
	bt r12,3
	jc LB_5260
	mov rsi,0
	bt r9,0
	jc LB_5260
	jmp LB_5261
LB_5260:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5261:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5270:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5272
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5271
LB_5272:
	add rsp,8
	ret
LB_5273:
	add rsp,48
	pop r14
LB_5271:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5310
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5152 : %_5152
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5152 ⊢ %_5153 : %_5153
 ; {>  %_5152~°1◂{  }:(_lst)◂(t2091'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5153
 ; {>  %_5153~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2094'(0))) }
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
	jc LB_5308
	mov rsi,0
	bt r9,0
	jc LB_5308
	jmp LB_5309
LB_5308:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5309:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5310:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5312
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5311
LB_5312:
	add rsp,8
	ret
LB_5313:
	add rsp,0
	pop r14
LB_5311:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5133:
NS_E_RDI_5133:
NS_E_5133_ETR_TBL:
NS_E_5133_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5329
LB_5328:
	add r14,1
LB_5329:
	cmp r14,r10
	jge LB_5330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5328
	cmp al,10
	jz LB_5328
	cmp al,32
	jz LB_5328
LB_5330:
	add r14,1
	cmp r14,r10
	jg LB_5333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_5333
	jmp LB_5334
LB_5333:
	jmp LB_5321
LB_5334:
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
LB_5339:
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
	push r10
	push rsi
	call NS_E_5130_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5338
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5340
	bts QWORD [rax],0
LB_5340:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5339
LB_5338:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_5342
LB_5341:
	add r14,1
LB_5342:
	cmp r14,r10
	jge LB_5343
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5341
	cmp al,10
	jz LB_5341
	cmp al,32
	jz LB_5341
LB_5343:
	add r14,1
	cmp r14,r10
	jg LB_5348
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_5348
	jmp LB_5349
LB_5348:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5345
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5345:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5346
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5346:
	jmp LB_5321
LB_5349:
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
	jc LB_5326
	btr r12,2
	clc
	jmp LB_5327
LB_5326:
	bts r12,2
	stc
LB_5327:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5324
	btr r12,1
	clc
	jmp LB_5325
LB_5324:
	bts r12,1
	stc
LB_5325:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5322
	btr r12,0
	clc
	jmp LB_5323
LB_5322:
	bts r12,0
	stc
LB_5323:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5318
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5350
	btr r12,6
	jmp LB_5351
LB_5350:
	bts r12,6
LB_5351:
	mov r13,r14
	bt r12,1
	jc LB_5352
	btr r12,0
	jmp LB_5353
LB_5352:
	bts r12,0
LB_5353:
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
; _f621 %_5154 ⊢ %_5155 : %_5155
 ; {>  %_5154~0':(_lst)◂(_p1490) }
; _f621 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_621
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1522 %_5155 ⊢ %_5156 : %_5156
 ; {>  %_5155~0':(_lst)◂(_p1490) }
; _f1522 0' ⊢ °0◂0'
; _some %_5156 ⊢ %_5157 : %_5157
 ; {>  %_5156~°0◂0':_p1490 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5157
 ; {>  %_5157~°0◂°0◂0':(_opn)◂(_p1490) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5316
	btr r12,3
	jmp LB_5317
LB_5316:
	bts r12,3
LB_5317:
	mov rsi,1
	bt r12,3
	jc LB_5314
	mov rsi,0
	bt r9,0
	jc LB_5314
	jmp LB_5315
LB_5314:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5315:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5318:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5320
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5319
LB_5320:
	add rsp,8
	ret
LB_5321:
	add rsp,48
	pop r14
LB_5319:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_5367
LB_5366:
	add r14,1
LB_5367:
	cmp r14,r10
	jge LB_5368
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5366
	cmp al,10
	jz LB_5366
	cmp al,32
	jz LB_5366
LB_5368:
	add r14,1
	cmp r14,r10
	jg LB_5371
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_5371
	jmp LB_5372
LB_5371:
	jmp LB_5359
LB_5372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
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
	push r10
	call NS_E_5130_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5376
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5377
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5377:
	jmp LB_5359
LB_5376:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_5380
LB_5379:
	add r14,1
LB_5380:
	cmp r14,r10
	jge LB_5381
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5379
	cmp al,10
	jz LB_5379
	cmp al,32
	jz LB_5379
LB_5381:
	add r14,1
	cmp r14,r10
	jg LB_5386
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_5386
	jmp LB_5387
LB_5386:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5383
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5383:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5384
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5384:
	jmp LB_5359
LB_5387:
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
	jc LB_5364
	btr r12,2
	clc
	jmp LB_5365
LB_5364:
	bts r12,2
	stc
LB_5365:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5362
	btr r12,1
	clc
	jmp LB_5363
LB_5362:
	bts r12,1
	stc
LB_5363:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5360
	btr r12,0
	clc
	jmp LB_5361
LB_5360:
	bts r12,0
	stc
LB_5361:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5356
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5388
	btr r12,6
	jmp LB_5389
LB_5388:
	bts r12,6
LB_5389:
	mov r13,r14
	bt r12,1
	jc LB_5390
	btr r12,0
	jmp LB_5391
LB_5390:
	bts r12,0
LB_5391:
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
; _some %_5158 ⊢ %_5159 : %_5159
 ; {>  %_5158~0':_p1490 }
; _some 0' ⊢ °0◂0'
; ∎ %_5159
 ; {>  %_5159~°0◂0':(_opn)◂(_p1490) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5354
	btr r12,3
	jmp LB_5355
LB_5354:
	bts r12,3
LB_5355:
	mov r8,0
	bts r12,2
	ret
LB_5356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5358
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5357
LB_5358:
	add rsp,8
	ret
LB_5359:
	add rsp,48
	pop r14
LB_5357:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_5403
LB_5402:
	add r14,1
LB_5403:
	cmp r14,r10
	jge LB_5404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5402
	cmp al,10
	jz LB_5402
	cmp al,32
	jz LB_5402
LB_5404:
	push r10
	call NS_E_5134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5405
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5399
LB_5405:
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
	jc LB_5400
	btr r12,0
	clc
	jmp LB_5401
LB_5400:
	bts r12,0
	stc
LB_5401:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5396
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1526 %_5160 ⊢ %_5161 : %_5161
 ; {>  %_5160~0':_stg }
; _f1526 0' ⊢ °4◂0'
; _some %_5161 ⊢ %_5162 : %_5162
 ; {>  %_5161~°4◂0':_p1490 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_5162
 ; {>  %_5162~°0◂°4◂0':(_opn)◂(_p1490) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5394
	btr r12,3
	jmp LB_5395
LB_5394:
	bts r12,3
LB_5395:
	mov rsi,1
	bt r12,3
	jc LB_5392
	mov rsi,0
	bt r9,0
	jc LB_5392
	jmp LB_5393
LB_5392:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5393:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5396:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5398
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5397
LB_5398:
	add rsp,8
	ret
LB_5399:
	add rsp,16
	pop r14
LB_5397:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_5418
LB_5417:
	add r14,1
LB_5418:
	cmp r14,r10
	jge LB_5419
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5417
	cmp al,10
	jz LB_5417
	cmp al,32
	jz LB_5417
LB_5419:
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5420
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5414
LB_5420:
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
	jc LB_5415
	btr r12,0
	clc
	jmp LB_5416
LB_5415:
	bts r12,0
	stc
LB_5416:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5411
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1525 %_5163 ⊢ %_5164 : %_5164
 ; {>  %_5163~0':_p1387 }
; _f1525 0' ⊢ °3◂0'
; _some %_5164 ⊢ %_5165 : %_5165
 ; {>  %_5164~°3◂0':_p1490 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_5165
 ; {>  %_5165~°0◂°3◂0':(_opn)◂(_p1490) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5409
	btr r12,3
	jmp LB_5410
LB_5409:
	bts r12,3
LB_5410:
	mov rsi,1
	bt r12,3
	jc LB_5407
	mov rsi,0
	bt r9,0
	jc LB_5407
	jmp LB_5408
LB_5407:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5408:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5411:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5413
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5412
LB_5413:
	add rsp,8
	ret
LB_5414:
	add rsp,16
	pop r14
LB_5412:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5134:
NS_E_RDI_5134:
NS_E_5134_ETR_TBL:
NS_E_5134_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5435
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5427
LB_5435:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_5443
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_5443
	jmp LB_5444
LB_5443:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5441
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5441:
	jmp LB_5427
LB_5444:
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
	jc LB_5430
	btr r12,1
	clc
	jmp LB_5431
LB_5430:
	bts r12,1
	stc
LB_5431:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5428
	btr r12,0
	clc
	jmp LB_5429
LB_5428:
	bts r12,0
	stc
LB_5429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5424
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5166 ⊢ %_5167 : %_5167
 ; {>  %_5166~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5167
 ; {>  %_5167~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5422
	btr r12,3
	jmp LB_5423
LB_5422:
	bts r12,3
LB_5423:
	mov r8,0
	bts r12,2
	ret
LB_5424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5426
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5425
LB_5426:
	add rsp,8
	ret
LB_5427:
	add rsp,32
	pop r14
LB_5425:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5445:
NS_E_RDI_5445:
NS_E_5445_ETR_TBL:
NS_E_5445_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_5847
LB_5846:
	add r14,1
LB_5847:
	cmp r14,r10
	jge LB_5848
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5846
	cmp al,10
	jz LB_5846
	cmp al,32
	jz LB_5846
LB_5848:
	push r10
	call NS_E_5446_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5849
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5841
LB_5849:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_5852
LB_5851:
	add r14,1
LB_5852:
	cmp r14,r10
	jge LB_5853
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5851
	cmp al,10
	jz LB_5851
	cmp al,32
	jz LB_5851
LB_5853:
	push r10
	call NS_E_5445_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5854
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5855
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5855:
	jmp LB_5841
LB_5854:
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
	jc LB_5844
	btr r12,1
	clc
	jmp LB_5845
LB_5844:
	bts r12,1
	stc
LB_5845:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5842
	btr r12,0
	clc
	jmp LB_5843
LB_5842:
	bts r12,0
	stc
LB_5843:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5838
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5486 %_5487 } ⊢ %_5488 : %_5488
 ; {>  %_5486~0':_p1478 %_5487~1':(_lst)◂(_p1478) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5488 ⊢ %_5489 : %_5489
 ; {>  %_5488~°0◂{ 0' 1' }:(_lst)◂(_p1478) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5489
 ; {>  %_5489~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1478)) }
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
	jc LB_5832
	btr r12,2
	jmp LB_5833
LB_5832:
	bts r12,2
LB_5833:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5830
	btr QWORD [rdi],0
	jmp LB_5831
LB_5830:
	bts QWORD [rdi],0
LB_5831:
	mov r8,r14
	bt r12,1
	jc LB_5836
	btr r12,2
	jmp LB_5837
LB_5836:
	bts r12,2
LB_5837:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5834
	btr QWORD [rdi],1
	jmp LB_5835
LB_5834:
	bts QWORD [rdi],1
LB_5835:
	mov rsi,1
	bt r12,3
	jc LB_5828
	mov rsi,0
	bt r9,0
	jc LB_5828
	jmp LB_5829
LB_5828:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5829:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5838:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5840
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5839
LB_5840:
	add rsp,8
	ret
LB_5841:
	add rsp,32
	pop r14
LB_5839:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5859
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5490 : %_5490
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5490 ⊢ %_5491 : %_5491
 ; {>  %_5490~°1◂{  }:(_lst)◂(t2221'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5491
 ; {>  %_5491~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2224'(0))) }
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
	jc LB_5857
	mov rsi,0
	bt r9,0
	jc LB_5857
	jmp LB_5858
LB_5857:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5858:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5859:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5861
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5860
LB_5861:
	add rsp,8
	ret
LB_5862:
	add rsp,0
	pop r14
LB_5860:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5446:
NS_E_RDI_5446:
NS_E_5446_ETR_TBL:
NS_E_5446_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_5881
LB_5880:
	add r14,1
LB_5881:
	cmp r14,r10
	jge LB_5882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5880
	cmp al,10
	jz LB_5880
	cmp al,32
	jz LB_5880
LB_5882:
	add r14,7
	cmp r14,r10
	jg LB_5885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_5885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_5885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_5885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_5885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_5885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_5885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_5885
	jmp LB_5886
LB_5885:
	jmp LB_5868
LB_5886:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_5875
LB_5874:
	add r14,1
LB_5875:
	cmp r14,r10
	jge LB_5876
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5874
	cmp al,10
	jz LB_5874
	cmp al,32
	jz LB_5874
LB_5876:
	push r10
	call NS_E_5447_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5877
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5878
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5878:
	jmp LB_5869
LB_5877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5872
	btr r12,1
	clc
	jmp LB_5873
LB_5872:
	bts r12,1
	stc
LB_5873:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5870
	btr r12,0
	clc
	jmp LB_5871
LB_5870:
	bts r12,0
	stc
LB_5871:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5865
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5887
	btr r12,2
	jmp LB_5888
LB_5887:
	bts r12,2
LB_5888:
	mov r13,r14
	bt r12,1
	jc LB_5889
	btr r12,0
	jmp LB_5890
LB_5889:
	bts r12,0
LB_5890:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5492 ⊢ %_5493 : %_5493
 ; {>  %_5492~0':_p1478 }
; _some 0' ⊢ °0◂0'
; ∎ %_5493
 ; {>  %_5493~°0◂0':(_opn)◂(_p1478) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5863
	btr r12,3
	jmp LB_5864
LB_5863:
	bts r12,3
LB_5864:
	mov r8,0
	bts r12,2
	ret
LB_5865:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5867
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5866
LB_5867:
	add rsp,8
	ret
LB_5869:
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
LB_5868:
	add rsp,32
	pop r14
LB_5866:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5892
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 0" _ ⊢ 0' : %_5494
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5494 ⊢ %_5495 : %_5495
 ; {>  %_5494~0':_stg }
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
; _none {  } ⊢ %_5496 : %_5496
 ; {>  %_5495~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5496
 ; {>  %_5495~0':_stg %_5496~°1◂{  }:(_opn)◂(t2234'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5891
	mov rdi,r13
	call dlt
LB_5891:
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
LB_5892:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5894
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5893
LB_5894:
	add rsp,8
	ret
LB_5895:
	add rsp,0
	pop r14
LB_5893:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
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
	add r14,4
	cmp r14,r10
	jg LB_5935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_5935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_5935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_5935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_5935
	jmp LB_5936
LB_5935:
	jmp LB_5909
LB_5936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_5918
LB_5917:
	add r14,1
LB_5918:
	cmp r14,r10
	jge LB_5919
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5917
	cmp al,10
	jz LB_5917
	cmp al,32
	jz LB_5917
LB_5919:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5920
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5921
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5921:
	jmp LB_5910
LB_5920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_5924
LB_5923:
	add r14,1
LB_5924:
	cmp r14,r10
	jge LB_5925
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5923
	cmp al,10
	jz LB_5923
	cmp al,32
	jz LB_5923
LB_5925:
	push r10
	call NS_E_5448_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5926
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5927
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5927:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5928
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5928:
	jmp LB_5910
LB_5926:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5915
	btr r12,2
	clc
	jmp LB_5916
LB_5915:
	bts r12,2
	stc
LB_5916:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5913
	btr r12,1
	clc
	jmp LB_5914
LB_5913:
	bts r12,1
	stc
LB_5914:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5911
	btr r12,0
	clc
	jmp LB_5912
LB_5911:
	bts r12,0
	stc
LB_5912:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5906
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5937
	btr r12,3
	jmp LB_5938
LB_5937:
	bts r12,3
LB_5938:
	mov r14,r8
	bt r12,2
	jc LB_5939
	btr r12,1
	jmp LB_5940
LB_5939:
	bts r12,1
LB_5940:
	mov r8,r13
	bt r12,0
	jc LB_5941
	btr r12,2
	jmp LB_5942
LB_5941:
	bts r12,2
LB_5942:
	mov r13,r9
	bt r12,3
	jc LB_5943
	btr r12,0
	jmp LB_5944
LB_5943:
	bts r12,0
LB_5944:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1491 { %_5497 %_5498 } ⊢ %_5499 : %_5499
 ; {>  %_5498~1':_p1479 %_5497~0':_stg }
; _f1491 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5499 ⊢ %_5500 : %_5500
 ; {>  %_5499~°0◂{ 0' 1' }:_p1478 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5500
 ; {>  %_5500~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1478) }
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
	jc LB_5900
	btr r12,2
	jmp LB_5901
LB_5900:
	bts r12,2
LB_5901:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5898
	btr QWORD [rdi],0
	jmp LB_5899
LB_5898:
	bts QWORD [rdi],0
LB_5899:
	mov r8,r14
	bt r12,1
	jc LB_5904
	btr r12,2
	jmp LB_5905
LB_5904:
	bts r12,2
LB_5905:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5902
	btr QWORD [rdi],1
	jmp LB_5903
LB_5902:
	bts QWORD [rdi],1
LB_5903:
	mov rsi,1
	bt r12,3
	jc LB_5896
	mov rsi,0
	bt r9,0
	jc LB_5896
	jmp LB_5897
LB_5896:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5897:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5906:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5908
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5907
LB_5908:
	add rsp,8
	ret
LB_5910:
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
LB_5909:
	add rsp,48
	pop r14
LB_5907:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5946
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 1" _ ⊢ 0' : %_5501
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
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
 ; {>  %_5503~°1◂{  }:(_opn)◂(t2246'(0)) %_5502~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5945
	mov rdi,r13
	call dlt
LB_5945:
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
LB_5946:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5948
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5947
LB_5948:
	add rsp,8
	ret
LB_5949:
	add rsp,0
	pop r14
LB_5947:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_5968
LB_5967:
	add r14,1
LB_5968:
	cmp r14,r10
	jge LB_5969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5967
	cmp al,10
	jz LB_5967
	cmp al,32
	jz LB_5967
LB_5969:
	add r14,2
	cmp r14,r10
	jg LB_5972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_5972
	jmp LB_5973
LB_5972:
	jmp LB_5955
LB_5973:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_5962
LB_5961:
	add r14,1
LB_5962:
	cmp r14,r10
	jge LB_5963
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5961
	cmp al,10
	jz LB_5961
	cmp al,32
	jz LB_5961
LB_5963:
	push r10
	call NS_E_5456_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5964
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5965
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5965:
	jmp LB_5956
LB_5964:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5959
	btr r12,1
	clc
	jmp LB_5960
LB_5959:
	bts r12,1
	stc
LB_5960:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5957
	btr r12,0
	clc
	jmp LB_5958
LB_5957:
	bts r12,0
	stc
LB_5958:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5952
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5974
	btr r12,2
	jmp LB_5975
LB_5974:
	bts r12,2
LB_5975:
	mov r13,r14
	bt r12,1
	jc LB_5976
	btr r12,0
	jmp LB_5977
LB_5976:
	bts r12,0
LB_5977:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5504 ⊢ %_5505 : %_5505
 ; {>  %_5504~0':_p1478 }
; _some 0' ⊢ °0◂0'
; ∎ %_5505
 ; {>  %_5505~°0◂0':(_opn)◂(_p1478) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5950
	btr r12,3
	jmp LB_5951
LB_5950:
	bts r12,3
LB_5951:
	mov r8,0
	bts r12,2
	ret
LB_5952:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5954
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5953
LB_5954:
	add rsp,8
	ret
LB_5956:
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
LB_5955:
	add rsp,32
	pop r14
LB_5953:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5979
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 2" _ ⊢ 0' : %_5506
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5506 ⊢ %_5507 : %_5507
 ; {>  %_5506~0':_stg }
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
; _none {  } ⊢ %_5508 : %_5508
 ; {>  %_5507~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5508
 ; {>  %_5507~0':_stg %_5508~°1◂{  }:(_opn)◂(t2256'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5978
	mov rdi,r13
	call dlt
LB_5978:
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
LB_5979:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5981
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5980
LB_5981:
	add rsp,8
	ret
LB_5982:
	add rsp,0
	pop r14
LB_5980:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_6001
LB_6000:
	add r14,1
LB_6001:
	cmp r14,r10
	jge LB_6002
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6000
	cmp al,10
	jz LB_6000
	cmp al,32
	jz LB_6000
LB_6002:
	add r14,2
	cmp r14,r10
	jg LB_6005
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6005
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_6005
	jmp LB_6006
LB_6005:
	jmp LB_5988
LB_6006:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_5995
LB_5994:
	add r14,1
LB_5995:
	cmp r14,r10
	jge LB_5996
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5994
	cmp al,10
	jz LB_5994
	cmp al,32
	jz LB_5994
LB_5996:
	push r10
	call NS_E_5450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5997
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5998
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5998:
	jmp LB_5989
LB_5997:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5992
	btr r12,1
	clc
	jmp LB_5993
LB_5992:
	bts r12,1
	stc
LB_5993:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5990
	btr r12,0
	clc
	jmp LB_5991
LB_5990:
	bts r12,0
	stc
LB_5991:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5985
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6007
	btr r12,2
	jmp LB_6008
LB_6007:
	bts r12,2
LB_6008:
	mov r13,r14
	bt r12,1
	jc LB_6009
	btr r12,0
	jmp LB_6010
LB_6009:
	bts r12,0
LB_6010:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5509 ⊢ %_5510 : %_5510
 ; {>  %_5509~0':_p1478 }
; _some 0' ⊢ °0◂0'
; ∎ %_5510
 ; {>  %_5510~°0◂0':(_opn)◂(_p1478) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5983
	btr r12,3
	jmp LB_5984
LB_5983:
	bts r12,3
LB_5984:
	mov r8,0
	bts r12,2
	ret
LB_5985:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5987
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5986
LB_5987:
	add rsp,8
	ret
LB_5989:
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
LB_5988:
	add rsp,32
	pop r14
LB_5986:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5447:
NS_E_RDI_5447:
NS_E_5447_ETR_TBL:
NS_E_5447_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_6046
LB_6045:
	add r14,1
LB_6046:
	cmp r14,r10
	jge LB_6047
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6045
	cmp al,10
	jz LB_6045
	cmp al,32
	jz LB_6045
LB_6047:
	push r10
	call NS_E_5473_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6048
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6040
LB_6048:
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
LB_6054:
	jmp LB_6051
LB_6050:
	add r14,1
LB_6051:
	cmp r14,r10
	jge LB_6052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6050
	cmp al,10
	jz LB_6050
	cmp al,32
	jz LB_6050
LB_6052:
	push r10
	push rsi
	call NS_E_5473_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6053
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6055
	bts QWORD [rax],0
LB_6055:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6054
LB_6053:
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
	jc LB_6043
	btr r12,1
	clc
	jmp LB_6044
LB_6043:
	bts r12,1
	stc
LB_6044:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6041
	btr r12,0
	clc
	jmp LB_6042
LB_6041:
	bts r12,0
	stc
LB_6042:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6037
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r11,r8
	bt r12,2
	jc LB_6056
	btr r12,5
	jmp LB_6057
LB_6056:
	bts r12,5
LB_6057:
	mov r8,r14
	bt r12,1
	jc LB_6058
	btr r12,2
	jmp LB_6059
LB_6058:
	bts r12,2
LB_6059:
	mov rcx,r13
	bt r12,0
	jc LB_6060
	btr r12,6
	jmp LB_6061
LB_6060:
	bts r12,6
LB_6061:
; 6' ⊢ { 0' 1' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_6064
	btr r12,7
	clc
	jmp LB_6065
LB_6064:
	bts r12,7
	stc
LB_6065:
	mov r13,rdx
	bt r12,7
	jc LB_6062
	btr r12,0
	jmp LB_6063
LB_6062:
	bts r12,0
LB_6063:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_6068
	btr r12,7
	clc
	jmp LB_6069
LB_6068:
	bts r12,7
	stc
LB_6069:
	mov r14,rdx
	bt r12,7
	jc LB_6066
	btr r12,1
	jmp LB_6067
LB_6066:
	bts r12,1
LB_6067:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f621 %_5512 ⊢ %_5513 : %_5513
 ; {>  %_5511~{ 0' 1' }:{ _stg _p1482 } %_5512~2':(_lst)◂({ _stg _p1482 }) }
; _f621 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_6015
	btr r12,0
	jmp LB_6016
LB_6015:
	bts r12,0
LB_6016:
	call NS_E_621
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_6017
	btr r12,2
	jmp LB_6018
LB_6017:
	bts r12,2
LB_6018:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6013
	btr r12,1
	clc
	jmp LB_6014
LB_6013:
	bts r12,1
	stc
LB_6014:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6011
	btr r12,0
	clc
	jmp LB_6012
LB_6011:
	bts r12,0
	stc
LB_6012:
	add rsp,24
; _cns { %_5511 %_5513 } ⊢ %_5514 : %_5514
 ; {>  %_5511~{ 0' 1' }:{ _stg _p1482 } %_5513~2':(_lst)◂({ _stg _p1482 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1492 %_5514 ⊢ %_5515 : %_5515
 ; {>  %_5514~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1482 }) }
; _f1492 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_5515 ⊢ %_5516 : %_5516
 ; {>  %_5515~°1◂°0◂{ { 0' 1' } 2' }:_p1478 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_5516
 ; {>  %_5516~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1478) }
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
	jc LB_6027
	btr r12,5
	jmp LB_6028
LB_6027:
	bts r12,5
LB_6028:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6025
	btr QWORD [rdi],0
	jmp LB_6026
LB_6025:
	bts QWORD [rdi],0
LB_6026:
	mov r11,r14
	bt r12,1
	jc LB_6031
	btr r12,5
	jmp LB_6032
LB_6031:
	bts r12,5
LB_6032:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6029
	btr QWORD [rdi],1
	jmp LB_6030
LB_6029:
	bts QWORD [rdi],1
LB_6030:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6023
	btr QWORD [rdi],0
	jmp LB_6024
LB_6023:
	bts QWORD [rdi],0
LB_6024:
	mov r10,r8
	bt r12,2
	jc LB_6035
	btr r12,4
	jmp LB_6036
LB_6035:
	bts r12,4
LB_6036:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6033
	btr QWORD [rdi],1
	jmp LB_6034
LB_6033:
	bts QWORD [rdi],1
LB_6034:
	mov rsi,1
	bt r12,3
	jc LB_6021
	mov rsi,0
	bt r9,0
	jc LB_6021
	jmp LB_6022
LB_6021:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6022:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6019
	mov rsi,0
	bt r9,0
	jc LB_6019
	jmp LB_6020
LB_6019:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6020:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6037:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6039
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6038
LB_6039:
	add rsp,8
	ret
LB_6040:
	add rsp,32
	pop r14
LB_6038:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6071
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 0" _ ⊢ 0' : %_5517
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5517 ⊢ %_5518 : %_5518
 ; {>  %_5517~0':_stg }
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
; _none {  } ⊢ %_5519 : %_5519
 ; {>  %_5518~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5519
 ; {>  %_5518~0':_stg %_5519~°1◂{  }:(_opn)◂(t2275'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6070
	mov rdi,r13
	call dlt
LB_6070:
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
LB_6071:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6073
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6072
LB_6073:
	add rsp,8
	ret
LB_6074:
	add rsp,0
	pop r14
LB_6072:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5448:
NS_E_RDI_5448:
NS_E_5448_ETR_TBL:
NS_E_5448_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_6095
LB_6094:
	add r14,1
LB_6095:
	cmp r14,r10
	jge LB_6096
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6094
	cmp al,10
	jz LB_6094
	cmp al,32
	jz LB_6094
LB_6096:
	add r14,1
	cmp r14,r10
	jg LB_6099
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6099
	jmp LB_6100
LB_6099:
	jmp LB_6082
LB_6100:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_6089
LB_6088:
	add r14,1
LB_6089:
	cmp r14,r10
	jge LB_6090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6088
	cmp al,10
	jz LB_6088
	cmp al,32
	jz LB_6088
LB_6090:
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6091
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6092
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6092:
	jmp LB_6083
LB_6091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6086
	btr r12,1
	clc
	jmp LB_6087
LB_6086:
	bts r12,1
	stc
LB_6087:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6084
	btr r12,0
	clc
	jmp LB_6085
LB_6084:
	bts r12,0
	stc
LB_6085:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6079
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6101
	btr r12,2
	jmp LB_6102
LB_6101:
	bts r12,2
LB_6102:
	mov r13,r14
	bt r12,1
	jc LB_6103
	btr r12,0
	jmp LB_6104
LB_6103:
	bts r12,0
LB_6104:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1498 %_5520 ⊢ %_5521 : %_5521
 ; {>  %_5520~0':_p1387 }
; _f1498 0' ⊢ °1◂0'
; _some %_5521 ⊢ %_5522 : %_5522
 ; {>  %_5521~°1◂0':_p1479 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5522
 ; {>  %_5522~°0◂°1◂0':(_opn)◂(_p1479) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6077
	btr r12,3
	jmp LB_6078
LB_6077:
	bts r12,3
LB_6078:
	mov rsi,1
	bt r12,3
	jc LB_6075
	mov rsi,0
	bt r9,0
	jc LB_6075
	jmp LB_6076
LB_6075:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6076:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6079:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6081
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6080
LB_6081:
	add rsp,8
	ret
LB_6083:
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
LB_6082:
	add rsp,32
	pop r14
LB_6080:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_6116
LB_6115:
	add r14,1
LB_6116:
	cmp r14,r10
	jge LB_6117
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6115
	cmp al,10
	jz LB_6115
	cmp al,32
	jz LB_6115
LB_6117:
	push r10
	call NS_E_5449_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6118
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6112
LB_6118:
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
	jc LB_6113
	btr r12,0
	clc
	jmp LB_6114
LB_6113:
	bts r12,0
	stc
LB_6114:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6109
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1497 %_5523 ⊢ %_5524 : %_5524
 ; {>  %_5523~0':(_lst)◂(_p1478) }
; _f1497 0' ⊢ °0◂0'
; _some %_5524 ⊢ %_5525 : %_5525
 ; {>  %_5524~°0◂0':_p1479 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5525
 ; {>  %_5525~°0◂°0◂0':(_opn)◂(_p1479) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6107
	btr r12,3
	jmp LB_6108
LB_6107:
	bts r12,3
LB_6108:
	mov rsi,1
	bt r12,3
	jc LB_6105
	mov rsi,0
	bt r9,0
	jc LB_6105
	jmp LB_6106
LB_6105:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6106:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6109:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6111
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6110
LB_6111:
	add rsp,8
	ret
LB_6112:
	add rsp,16
	pop r14
LB_6110:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6121
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_5526
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5526 ⊢ %_5527 : %_5527
 ; {>  %_5526~0':_stg }
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
; _none {  } ⊢ %_5528 : %_5528
 ; {>  %_5527~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5528
 ; {>  %_5528~°1◂{  }:(_opn)◂(t2290'(0)) %_5527~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6120
	mov rdi,r13
	call dlt
LB_6120:
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
LB_6121:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6123
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6122
LB_6123:
	add rsp,8
	ret
LB_6124:
	add rsp,0
	pop r14
LB_6122:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5449:
NS_E_RDI_5449:
NS_E_5449_ETR_TBL:
NS_E_5449_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_6134
LB_6133:
	add r14,1
LB_6134:
	cmp r14,r10
	jge LB_6135
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6133
	cmp al,10
	jz LB_6133
	cmp al,32
	jz LB_6133
LB_6135:
	add r14,6
	cmp r14,r10
	jg LB_6138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_6138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_6138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_6138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_6138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_6138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_6138
	jmp LB_6139
LB_6138:
	jmp LB_6130
LB_6139:
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
	jc LB_6131
	btr r12,0
	clc
	jmp LB_6132
LB_6131:
	bts r12,0
	stc
LB_6132:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6127
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_5529 : %_5529
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5529 ⊢ %_5530 : %_5530
 ; {>  %_5529~°1◂{  }:(_lst)◂(t2294'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5530
 ; {>  %_5530~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2297'(0))) }
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
	jc LB_6125
	mov rsi,0
	bt r9,0
	jc LB_6125
	jmp LB_6126
LB_6125:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6126:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6127:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6129
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6128
LB_6129:
	add rsp,8
	ret
LB_6130:
	add rsp,16
	pop r14
LB_6128:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_6159
LB_6158:
	add r14,1
LB_6159:
	cmp r14,r10
	jge LB_6160
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6158
	cmp al,10
	jz LB_6158
	cmp al,32
	jz LB_6158
LB_6160:
	push r10
	call NS_E_5446_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6161
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6153
LB_6161:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_6164
LB_6163:
	add r14,1
LB_6164:
	cmp r14,r10
	jge LB_6165
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6163
	cmp al,10
	jz LB_6163
	cmp al,32
	jz LB_6163
LB_6165:
	push r10
	call NS_E_5449_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6166
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6167
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6167:
	jmp LB_6153
LB_6166:
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
	jc LB_6156
	btr r12,1
	clc
	jmp LB_6157
LB_6156:
	bts r12,1
	stc
LB_6157:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6154
	btr r12,0
	clc
	jmp LB_6155
LB_6154:
	bts r12,0
	stc
LB_6155:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6150
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5531 %_5532 } ⊢ %_5533 : %_5533
 ; {>  %_5531~0':_p1478 %_5532~1':(_lst)◂(_p1478) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5533 ⊢ %_5534 : %_5534
 ; {>  %_5533~°0◂{ 0' 1' }:(_lst)◂(_p1478) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5534
 ; {>  %_5534~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1478)) }
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
	jc LB_6144
	btr r12,2
	jmp LB_6145
LB_6144:
	bts r12,2
LB_6145:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6142
	btr QWORD [rdi],0
	jmp LB_6143
LB_6142:
	bts QWORD [rdi],0
LB_6143:
	mov r8,r14
	bt r12,1
	jc LB_6148
	btr r12,2
	jmp LB_6149
LB_6148:
	bts r12,2
LB_6149:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6146
	btr QWORD [rdi],1
	jmp LB_6147
LB_6146:
	bts QWORD [rdi],1
LB_6147:
	mov rsi,1
	bt r12,3
	jc LB_6140
	mov rsi,0
	bt r9,0
	jc LB_6140
	jmp LB_6141
LB_6140:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6141:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6150:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6152
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6151
LB_6152:
	add rsp,8
	ret
LB_6153:
	add rsp,32
	pop r14
LB_6151:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5450:
NS_E_RDI_5450:
NS_E_5450_ETR_TBL:
NS_E_5450_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_6224
LB_6223:
	add r14,1
LB_6224:
	cmp r14,r10
	jge LB_6225
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6223
	cmp al,10
	jz LB_6223
	cmp al,32
	jz LB_6223
LB_6225:
	add r14,1
	cmp r14,r10
	jg LB_6228
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6228
	jmp LB_6229
LB_6228:
	jmp LB_6190
LB_6229:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6201
LB_6200:
	add r14,1
LB_6201:
	cmp r14,r10
	jge LB_6202
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6200
	cmp al,10
	jz LB_6200
	cmp al,32
	jz LB_6200
LB_6202:
	add r14,1
	cmp r14,r10
	jg LB_6206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6206
	jmp LB_6207
LB_6206:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6204
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6204:
	jmp LB_6191
LB_6207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_6209
LB_6208:
	add r14,1
LB_6209:
	cmp r14,r10
	jge LB_6210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6208
	cmp al,10
	jz LB_6208
	cmp al,32
	jz LB_6208
LB_6210:
	push r10
	call NS_E_5451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6211
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6212
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6212:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6213
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6213:
	jmp LB_6191
LB_6211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
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
	call NS_E_5454_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6218
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6219
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6219:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6220
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6220:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6221
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6221:
	jmp LB_6191
LB_6218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6198
	btr r12,3
	clc
	jmp LB_6199
LB_6198:
	bts r12,3
	stc
LB_6199:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6196
	btr r12,2
	clc
	jmp LB_6197
LB_6196:
	bts r12,2
	stc
LB_6197:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6194
	btr r12,1
	clc
	jmp LB_6195
LB_6194:
	bts r12,1
	stc
LB_6195:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6192
	btr r12,0
	clc
	jmp LB_6193
LB_6192:
	bts r12,0
	stc
LB_6193:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6187
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6230
	btr r12,4
	jmp LB_6231
LB_6230:
	bts r12,4
LB_6231:
	mov r8,r9
	bt r12,3
	jc LB_6232
	btr r12,2
	jmp LB_6233
LB_6232:
	bts r12,2
LB_6233:
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
	jc LB_6236
	btr r12,3
	clc
	jmp LB_6237
LB_6236:
	bts r12,3
	stc
LB_6237:
	mov r13,r9
	bt r12,3
	jc LB_6234
	btr r12,0
	jmp LB_6235
LB_6234:
	bts r12,0
LB_6235:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6240
	btr r12,3
	clc
	jmp LB_6241
LB_6240:
	bts r12,3
	stc
LB_6241:
	mov r14,r9
	bt r12,3
	jc LB_6238
	btr r12,1
	jmp LB_6239
LB_6238:
	bts r12,1
LB_6239:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5535 %_5536 } ⊢ %_5537 : %_5537
 ; {>  %_5536~2':(_lst)◂({ _stg _p1481 }) %_5535~{ 0' 1' }:{ _stg _p1481 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1496 %_5537 ⊢ %_5538 : %_5538
 ; {>  %_5537~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1481 }) }
; _f1496 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_5538 ⊢ %_5539 : %_5539
 ; {>  %_5538~°5◂°0◂{ { 0' 1' } 2' }:_p1478 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_5539
 ; {>  %_5539~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1478) }
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
	jc LB_6177
	btr r12,5
	jmp LB_6178
LB_6177:
	bts r12,5
LB_6178:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6175
	btr QWORD [rdi],0
	jmp LB_6176
LB_6175:
	bts QWORD [rdi],0
LB_6176:
	mov r11,r14
	bt r12,1
	jc LB_6181
	btr r12,5
	jmp LB_6182
LB_6181:
	bts r12,5
LB_6182:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6179
	btr QWORD [rdi],1
	jmp LB_6180
LB_6179:
	bts QWORD [rdi],1
LB_6180:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6173
	btr QWORD [rdi],0
	jmp LB_6174
LB_6173:
	bts QWORD [rdi],0
LB_6174:
	mov r10,r8
	bt r12,2
	jc LB_6185
	btr r12,4
	jmp LB_6186
LB_6185:
	bts r12,4
LB_6186:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6183
	btr QWORD [rdi],1
	jmp LB_6184
LB_6183:
	bts QWORD [rdi],1
LB_6184:
	mov rsi,1
	bt r12,3
	jc LB_6171
	mov rsi,0
	bt r9,0
	jc LB_6171
	jmp LB_6172
LB_6171:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6172:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6169
	mov rsi,0
	bt r9,0
	jc LB_6169
	jmp LB_6170
LB_6169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6170:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6187:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6189
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6188
LB_6189:
	add rsp,8
	ret
LB_6191:
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
LB_6190:
	add rsp,64
	pop r14
LB_6188:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_6259
LB_6258:
	add r14,1
LB_6259:
	cmp r14,r10
	jge LB_6260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6258
	cmp al,10
	jz LB_6258
	cmp al,32
	jz LB_6258
LB_6260:
	push r10
	call NS_E_5451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6261
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6255
LB_6261:
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
	jc LB_6256
	btr r12,0
	clc
	jmp LB_6257
LB_6256:
	bts r12,0
	stc
LB_6257:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6252
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r11,r14
	bt r12,1
	jc LB_6263
	btr r12,5
	jmp LB_6264
LB_6263:
	bts r12,5
LB_6264:
	mov r10,r13
	bt r12,0
	jc LB_6265
	btr r12,4
	jmp LB_6266
LB_6265:
	bts r12,4
LB_6266:
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_6269
	btr r12,6
	clc
	jmp LB_6270
LB_6269:
	bts r12,6
	stc
LB_6270:
	mov r13,rcx
	bt r12,6
	jc LB_6267
	btr r12,0
	jmp LB_6268
LB_6267:
	bts r12,0
LB_6268:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_6273
	btr r12,6
	clc
	jmp LB_6274
LB_6273:
	bts r12,6
	stc
LB_6274:
	mov r14,rcx
	bt r12,6
	jc LB_6271
	btr r12,1
	jmp LB_6272
LB_6271:
	bts r12,1
LB_6272:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1495 %_5540 ⊢ %_5541 : %_5541
 ; {>  %_5540~{ 0' 1' }:{ _stg _p1481 } }
; _f1495 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_5541 ⊢ %_5542 : %_5542
 ; {>  %_5541~°4◂{ 0' 1' }:_p1478 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_5542
 ; {>  %_5542~°0◂°4◂{ 0' 1' }:(_opn)◂(_p1478) }
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
	jc LB_6246
	btr r12,2
	jmp LB_6247
LB_6246:
	bts r12,2
LB_6247:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6244
	btr QWORD [rdi],0
	jmp LB_6245
LB_6244:
	bts QWORD [rdi],0
LB_6245:
	mov r8,r14
	bt r12,1
	jc LB_6250
	btr r12,2
	jmp LB_6251
LB_6250:
	bts r12,2
LB_6251:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6248
	btr QWORD [rdi],1
	jmp LB_6249
LB_6248:
	bts QWORD [rdi],1
LB_6249:
	mov rsi,1
	bt r12,3
	jc LB_6242
	mov rsi,0
	bt r9,0
	jc LB_6242
	jmp LB_6243
LB_6242:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6243:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6252:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6254
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6253
LB_6254:
	add rsp,8
	ret
LB_6255:
	add rsp,16
	pop r14
LB_6253:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6276
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "dt_etr 0" _ ⊢ 0' : %_5543
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5543 ⊢ %_5544 : %_5544
 ; {>  %_5543~0':_stg }
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
; _none {  } ⊢ %_5545 : %_5545
 ; {>  %_5544~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5545
 ; {>  %_5545~°1◂{  }:(_opn)◂(t2321'(0)) %_5544~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6275
	mov rdi,r13
	call dlt
LB_6275:
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
LB_6276:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6278
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6277
LB_6278:
	add rsp,8
	ret
LB_6279:
	add rsp,0
	pop r14
LB_6277:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5451:
NS_E_RDI_5451:
NS_E_5451_ETR_TBL:
NS_E_5451_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_6313
LB_6312:
	add r14,1
LB_6313:
	cmp r14,r10
	jge LB_6314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6312
	cmp al,10
	jz LB_6312
	cmp al,32
	jz LB_6312
LB_6314:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6315
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6294
LB_6315:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_6318
LB_6317:
	add r14,1
LB_6318:
	cmp r14,r10
	jge LB_6319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6317
	cmp al,10
	jz LB_6317
	cmp al,32
	jz LB_6317
LB_6319:
	push r10
	call NS_E_5453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6320
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6321
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6321:
	jmp LB_6294
LB_6320:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_6324
LB_6323:
	add r14,1
LB_6324:
	cmp r14,r10
	jge LB_6325
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6323
	cmp al,10
	jz LB_6323
	cmp al,32
	jz LB_6323
LB_6325:
	add r14,1
	cmp r14,r10
	jg LB_6330
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6330
	jmp LB_6331
LB_6330:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6327
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6327:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6328
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6328:
	jmp LB_6294
LB_6331:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_6305
LB_6304:
	add r14,1
LB_6305:
	cmp r14,r10
	jge LB_6306
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6304
	cmp al,10
	jz LB_6304
	cmp al,32
	jz LB_6304
LB_6306:
	push r10
	call NS_E_5130_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6307
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6308
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6308:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6309
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6309:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6310:
	jmp LB_6295
LB_6307:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6302
	btr r12,3
	clc
	jmp LB_6303
LB_6302:
	bts r12,3
	stc
LB_6303:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6300
	btr r12,2
	clc
	jmp LB_6301
LB_6300:
	bts r12,2
	stc
LB_6301:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6298
	btr r12,1
	clc
	jmp LB_6299
LB_6298:
	bts r12,1
	stc
LB_6299:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6296
	btr r12,0
	clc
	jmp LB_6297
LB_6296:
	bts r12,0
	stc
LB_6297:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6291
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6332
	btr r12,4
	jmp LB_6333
LB_6332:
	bts r12,4
LB_6333:
	mov r8,r9
	bt r12,3
	jc LB_6334
	btr r12,2
	jmp LB_6335
LB_6334:
	bts r12,2
LB_6335:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1503 %_5548 ⊢ %_5549 : %_5549
 ; {>  %_5548~2':_p1490 %_5546~0':_stg %_5547~1':_p5452 }
; _f1503 2' ⊢ °1◂2'
; _some { %_5546 %_5549 } ⊢ %_5550 : %_5550
 ; {>  %_5546~0':_stg %_5549~°1◂2':_p1481 %_5547~1':_p5452 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_5550
 ; {>  %_5550~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p1481 }) %_5547~1':_p5452 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_6280
	mov rdi,r14
	call dlt
LB_6280:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_6283
	btr r12,1
	jmp LB_6284
LB_6283:
	bts r12,1
LB_6284:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_6281
	btr QWORD [rdi],0
	jmp LB_6282
LB_6281:
	bts QWORD [rdi],0
LB_6282:
	mov r14,r8
	bt r12,2
	jc LB_6289
	btr r12,1
	jmp LB_6290
LB_6289:
	bts r12,1
LB_6290:
	mov rsi,1
	bt r12,1
	jc LB_6287
	mov rsi,0
	bt r14,0
	jc LB_6287
	jmp LB_6288
LB_6287:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_6288:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_6285
	btr QWORD [rdi],1
	jmp LB_6286
LB_6285:
	bts QWORD [rdi],1
LB_6286:
	mov r8,0
	bts r12,2
	ret
LB_6291:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6293
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6292
LB_6293:
	add rsp,8
	ret
LB_6295:
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
LB_6294:
	add rsp,64
	pop r14
LB_6292:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_6382
LB_6381:
	add r14,1
LB_6382:
	cmp r14,r10
	jge LB_6383
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6381
	cmp al,10
	jz LB_6381
	cmp al,32
	jz LB_6381
LB_6383:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6384
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6366
LB_6384:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_6387
LB_6386:
	add r14,1
LB_6387:
	cmp r14,r10
	jge LB_6388
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6386
	cmp al,10
	jz LB_6386
	cmp al,32
	jz LB_6386
LB_6388:
	push r10
	call NS_E_5453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6389
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6390
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6390:
	jmp LB_6366
LB_6389:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_6393
LB_6392:
	add r14,1
LB_6393:
	cmp r14,r10
	jge LB_6394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6392
	cmp al,10
	jz LB_6392
	cmp al,32
	jz LB_6392
LB_6394:
	add r14,3
	cmp r14,r10
	jg LB_6399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6399
	jmp LB_6400
LB_6399:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6396
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6396:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6397:
	jmp LB_6366
LB_6400:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_6402
LB_6401:
	add r14,1
LB_6402:
	cmp r14,r10
	jge LB_6403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6401
	cmp al,10
	jz LB_6401
	cmp al,32
	jz LB_6401
LB_6403:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6404
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6405
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6405:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6406
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6406:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6407
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6407:
	jmp LB_6366
LB_6404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_6410
LB_6409:
	add r14,1
LB_6410:
	cmp r14,r10
	jge LB_6411
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6409
	cmp al,10
	jz LB_6409
	cmp al,32
	jz LB_6409
LB_6411:
	add r14,1
	cmp r14,r10
	jg LB_6418
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6418
	jmp LB_6419
LB_6418:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6413
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6413:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6414
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6414:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6415
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6415:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6416:
	jmp LB_6366
LB_6419:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_6421
LB_6420:
	add r14,1
LB_6421:
	cmp r14,r10
	jge LB_6422
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6420
	cmp al,10
	jz LB_6420
	cmp al,32
	jz LB_6420
LB_6422:
	push r10
	call NS_E_5130_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6423
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_6424
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_6424:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6425
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6425:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6426
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6426:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6427
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6427:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6428
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6428:
	jmp LB_6366
LB_6423:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_6431
LB_6430:
	add r14,1
LB_6431:
	cmp r14,r10
	jge LB_6432
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6430
	cmp al,10
	jz LB_6430
	cmp al,32
	jz LB_6430
LB_6432:
	push r10
	call NS_E_5455_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6433
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_6434
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_6434:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_6435
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_6435:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6436
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6436:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6437
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6437:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6438
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6438:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6439
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6439:
	jmp LB_6366
LB_6433:
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
	jc LB_6379
	btr r12,6
	clc
	jmp LB_6380
LB_6379:
	bts r12,6
	stc
LB_6380:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6377
	btr r12,5
	clc
	jmp LB_6378
LB_6377:
	bts r12,5
	stc
LB_6378:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6375
	btr r12,4
	clc
	jmp LB_6376
LB_6375:
	bts r12,4
	stc
LB_6376:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6373
	btr r12,3
	clc
	jmp LB_6374
LB_6373:
	bts r12,3
	stc
LB_6374:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6371
	btr r12,2
	clc
	jmp LB_6372
LB_6371:
	bts r12,2
	stc
LB_6372:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6369
	btr r12,1
	clc
	jmp LB_6370
LB_6369:
	bts r12,1
	stc
LB_6370:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6367
	btr r12,0
	clc
	jmp LB_6368
LB_6367:
	bts r12,0
	stc
LB_6368:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_6363
; _emt_mov_ptn_to_ptn:{| 11111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdi,r10
	mov QWORD [st_vct+8*10],rdi
	bt r12,4
	jc LB_6441
	btr r12,10
	jmp LB_6442
LB_6441:
	bts r12,10
LB_6442:
	mov r10,rcx
	bt r12,6
	jc LB_6443
	btr r12,4
	jmp LB_6444
LB_6443:
	bts r12,4
LB_6444:
	mov rcx,r9
	bt r12,3
	jc LB_6445
	btr r12,6
	jmp LB_6446
LB_6445:
	bts r12,6
LB_6446:
	mov r9,r11
	bt r12,5
	jc LB_6447
	btr r12,3
	jmp LB_6448
LB_6447:
	bts r12,3
LB_6448:
	mov r11,r8
	bt r12,2
	jc LB_6449
	btr r12,5
	jmp LB_6450
LB_6449:
	bts r12,5
LB_6450:
	mov r8,rcx
	bt r12,6
	jc LB_6451
	btr r12,2
	jmp LB_6452
LB_6451:
	bts r12,2
LB_6452:
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
; _cns { { %_5553 %_5554 } %_5555 } ⊢ %_5556 : %_5556
 ; {>  %_5555~4':(_lst)◂({ _stg _p1490 }) %_5551~0':_stg %_5554~3':_p1490 %_5552~1':_p5452 %_5553~2':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f1502 %_5556 ⊢ %_5557 : %_5557
 ; {>  %_5551~0':_stg %_5556~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p1490 }) %_5552~1':_p5452 }
; _f1502 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_5551 %_5557 } ⊢ %_5558 : %_5558
 ; {>  %_5551~0':_stg %_5552~1':_p5452 %_5557~°0◂°0◂{ { 2' 3' } 4' }:_p1481 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_5558
 ; {>  %_5552~1':_p5452 %_5558~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p1481 }) }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_6336
	mov rdi,r14
	call dlt
LB_6336:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_6337
	btr r12,1
	jmp LB_6338
LB_6337:
	bts r12,1
LB_6338:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_6341
	btr r12,5
	jmp LB_6342
LB_6341:
	bts r12,5
LB_6342:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6339
	btr QWORD [rdi],0
	jmp LB_6340
LB_6339:
	bts QWORD [rdi],0
LB_6340:
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
	jc LB_6353
	btr r12,6
	jmp LB_6354
LB_6353:
	bts r12,6
LB_6354:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_6351
	btr QWORD [rdi],0
	jmp LB_6352
LB_6351:
	bts QWORD [rdi],0
LB_6352:
	mov rcx,r14
	bt r12,1
	jc LB_6357
	btr r12,6
	jmp LB_6358
LB_6357:
	bts r12,6
LB_6358:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_6355
	btr QWORD [rdi],1
	jmp LB_6356
LB_6355:
	bts QWORD [rdi],1
LB_6356:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_6349
	btr QWORD [rdi],0
	jmp LB_6350
LB_6349:
	bts QWORD [rdi],0
LB_6350:
	mov r13,r10
	bt r12,4
	jc LB_6361
	btr r12,0
	jmp LB_6362
LB_6361:
	bts r12,0
LB_6362:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_6359
	btr QWORD [rdi],1
	jmp LB_6360
LB_6359:
	bts QWORD [rdi],1
LB_6360:
	mov rsi,1
	bt r12,5
	jc LB_6347
	mov rsi,0
	bt r11,0
	jc LB_6347
	jmp LB_6348
LB_6347:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6348:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_6345
	mov rsi,0
	bt r11,0
	jc LB_6345
	jmp LB_6346
LB_6345:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6346:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6343
	btr QWORD [rdi],1
	jmp LB_6344
LB_6343:
	bts QWORD [rdi],1
LB_6344:
	mov r8,0
	bts r12,2
	ret
LB_6363:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6365
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6364
LB_6365:
	add rsp,8
	ret
LB_6366:
	add rsp,112
	pop r14
LB_6364:
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
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_6467
LB_6466:
	add r14,1
LB_6467:
	cmp r14,r10
	jge LB_6468
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6466
	cmp al,10
	jz LB_6466
	cmp al,32
	jz LB_6466
LB_6468:
	add r14,3
	cmp r14,r10
	jg LB_6471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6471
	jmp LB_6472
LB_6471:
	jmp LB_6453
LB_6472:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_6461
LB_6460:
	add r14,1
LB_6461:
	cmp r14,r10
	jge LB_6462
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6460
	cmp al,10
	jz LB_6460
	cmp al,32
	jz LB_6460
LB_6462:
	push r10
	call NS_E_5134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6463
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6464
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6464:
	jmp LB_6454
LB_6463:
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
	jc LB_6457
	btr QWORD [rdi],1
LB_6457:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6458
	btr QWORD [rdi],0
LB_6458:
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
LB_6454:
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
LB_6453:
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
LB_6455:
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
NS_E_5454:
NS_E_RDI_5454:
NS_E_5454_ETR_TBL:
NS_E_5454_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_6526
LB_6525:
	add r14,1
LB_6526:
	cmp r14,r10
	jge LB_6527
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6525
	cmp al,10
	jz LB_6525
	cmp al,32
	jz LB_6525
LB_6527:
	add r14,1
	cmp r14,r10
	jg LB_6530
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6530
	jmp LB_6531
LB_6530:
	jmp LB_6492
LB_6531:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6503
LB_6502:
	add r14,1
LB_6503:
	cmp r14,r10
	jge LB_6504
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6502
	cmp al,10
	jz LB_6502
	cmp al,32
	jz LB_6502
LB_6504:
	add r14,1
	cmp r14,r10
	jg LB_6508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6508
	jmp LB_6509
LB_6508:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6506
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6506:
	jmp LB_6493
LB_6509:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_6511
LB_6510:
	add r14,1
LB_6511:
	cmp r14,r10
	jge LB_6512
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6510
	cmp al,10
	jz LB_6510
	cmp al,32
	jz LB_6510
LB_6512:
	push r10
	call NS_E_5451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6513
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6514
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6514:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6515
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6515:
	jmp LB_6493
LB_6513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
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
	call NS_E_5454_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6520
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6521
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6521:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6522
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6522:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6523
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6523:
	jmp LB_6493
LB_6520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6500
	btr r12,3
	clc
	jmp LB_6501
LB_6500:
	bts r12,3
	stc
LB_6501:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6498
	btr r12,2
	clc
	jmp LB_6499
LB_6498:
	bts r12,2
	stc
LB_6499:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6496
	btr r12,1
	clc
	jmp LB_6497
LB_6496:
	bts r12,1
	stc
LB_6497:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6494
	btr r12,0
	clc
	jmp LB_6495
LB_6494:
	bts r12,0
	stc
LB_6495:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6489
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6532
	btr r12,4
	jmp LB_6533
LB_6532:
	bts r12,4
LB_6533:
	mov r8,r9
	bt r12,3
	jc LB_6534
	btr r12,2
	jmp LB_6535
LB_6534:
	bts r12,2
LB_6535:
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
	jc LB_6538
	btr r12,3
	clc
	jmp LB_6539
LB_6538:
	bts r12,3
	stc
LB_6539:
	mov r13,r9
	bt r12,3
	jc LB_6536
	btr r12,0
	jmp LB_6537
LB_6536:
	bts r12,0
LB_6537:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6542
	btr r12,3
	clc
	jmp LB_6543
LB_6542:
	bts r12,3
	stc
LB_6543:
	mov r14,r9
	bt r12,3
	jc LB_6540
	btr r12,1
	jmp LB_6541
LB_6540:
	bts r12,1
LB_6541:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5561 %_5562 } ⊢ %_5563 : %_5563
 ; {>  %_5562~2':(_lst)◂({ _stg _p1481 }) %_5561~{ 0' 1' }:{ _stg _p1481 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_5563 ⊢ %_5564 : %_5564
 ; {>  %_5563~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1481 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_5564
 ; {>  %_5564~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1481 })) }
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
	jc LB_6479
	btr r12,5
	jmp LB_6480
LB_6479:
	bts r12,5
LB_6480:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6477
	btr QWORD [rdi],0
	jmp LB_6478
LB_6477:
	bts QWORD [rdi],0
LB_6478:
	mov r11,r14
	bt r12,1
	jc LB_6483
	btr r12,5
	jmp LB_6484
LB_6483:
	bts r12,5
LB_6484:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6481
	btr QWORD [rdi],1
	jmp LB_6482
LB_6481:
	bts QWORD [rdi],1
LB_6482:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6475
	btr QWORD [rdi],0
	jmp LB_6476
LB_6475:
	bts QWORD [rdi],0
LB_6476:
	mov r10,r8
	bt r12,2
	jc LB_6487
	btr r12,4
	jmp LB_6488
LB_6487:
	bts r12,4
LB_6488:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6485
	btr QWORD [rdi],1
	jmp LB_6486
LB_6485:
	bts QWORD [rdi],1
LB_6486:
	mov rsi,1
	bt r12,3
	jc LB_6473
	mov rsi,0
	bt r9,0
	jc LB_6473
	jmp LB_6474
LB_6473:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6474:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6489:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6491
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6490
LB_6491:
	add rsp,8
	ret
LB_6493:
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
LB_6492:
	add rsp,64
	pop r14
LB_6490:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6546
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5565 : %_5565
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5565 ⊢ %_5566 : %_5566
 ; {>  %_5565~°1◂{  }:(_lst)◂(t2348'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5566
 ; {>  %_5566~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2351'(0))) }
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
	jc LB_6544
	mov rsi,0
	bt r9,0
	jc LB_6544
	jmp LB_6545
LB_6544:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6545:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6546:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6548
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6547
LB_6548:
	add rsp,8
	ret
LB_6549:
	add rsp,0
	pop r14
LB_6547:
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
	sub rsp,80
; "\226\136\144"
	jmp LB_6614
LB_6613:
	add r14,1
LB_6614:
	cmp r14,r10
	jge LB_6615
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6613
	cmp al,10
	jz LB_6613
	cmp al,32
	jz LB_6613
LB_6615:
	add r14,3
	cmp r14,r10
	jg LB_6618
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6618
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6618
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6618
	jmp LB_6619
LB_6618:
	jmp LB_6569
LB_6619:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6582
LB_6581:
	add r14,1
LB_6582:
	cmp r14,r10
	jge LB_6583
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6581
	cmp al,10
	jz LB_6581
	cmp al,32
	jz LB_6581
LB_6583:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6584
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6585
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6585:
	jmp LB_6570
LB_6584:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_6588
LB_6587:
	add r14,1
LB_6588:
	cmp r14,r10
	jge LB_6589
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6587
	cmp al,10
	jz LB_6587
	cmp al,32
	jz LB_6587
LB_6589:
	add r14,1
	cmp r14,r10
	jg LB_6594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6594
	jmp LB_6595
LB_6594:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6591
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6591:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6592
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6592:
	jmp LB_6570
LB_6595:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_6597
LB_6596:
	add r14,1
LB_6597:
	cmp r14,r10
	jge LB_6598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6596
	cmp al,10
	jz LB_6596
	cmp al,32
	jz LB_6596
LB_6598:
	push r10
	call NS_E_5130_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6599
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6600
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6600:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6601
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6601:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6602
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6602:
	jmp LB_6570
LB_6599:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_6605
LB_6604:
	add r14,1
LB_6605:
	cmp r14,r10
	jge LB_6606
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6604
	cmp al,10
	jz LB_6604
	cmp al,32
	jz LB_6604
LB_6606:
	push r10
	call NS_E_5455_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6607
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6608
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6608:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6609
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6609:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6610
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6610:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6611
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6611:
	jmp LB_6570
LB_6607:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6579
	btr r12,4
	clc
	jmp LB_6580
LB_6579:
	bts r12,4
	stc
LB_6580:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6577
	btr r12,3
	clc
	jmp LB_6578
LB_6577:
	bts r12,3
	stc
LB_6578:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6575
	btr r12,2
	clc
	jmp LB_6576
LB_6575:
	bts r12,2
	stc
LB_6576:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6573
	btr r12,1
	clc
	jmp LB_6574
LB_6573:
	bts r12,1
	stc
LB_6574:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6571
	btr r12,0
	clc
	jmp LB_6572
LB_6571:
	bts r12,0
	stc
LB_6572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6566
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_6620
	btr r12,5
	jmp LB_6621
LB_6620:
	bts r12,5
LB_6621:
	mov r8,r10
	bt r12,4
	jc LB_6622
	btr r12,2
	jmp LB_6623
LB_6622:
	bts r12,2
LB_6623:
	mov r10,r14
	bt r12,1
	jc LB_6624
	btr r12,4
	jmp LB_6625
LB_6624:
	bts r12,4
LB_6625:
	mov r14,r9
	bt r12,3
	jc LB_6626
	btr r12,1
	jmp LB_6627
LB_6626:
	bts r12,1
LB_6627:
	mov r9,r13
	bt r12,0
	jc LB_6628
	btr r12,3
	jmp LB_6629
LB_6628:
	bts r12,3
LB_6629:
	mov r13,r10
	bt r12,4
	jc LB_6630
	btr r12,0
	jmp LB_6631
LB_6630:
	bts r12,0
LB_6631:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_5567 %_5568 } %_5569 } ⊢ %_5570 : %_5570
 ; {>  %_5567~0':_stg %_5569~2':(_lst)◂({ _stg _p1490 }) %_5568~1':_p1490 }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_5570 ⊢ %_5571 : %_5571
 ; {>  %_5570~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1490 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_5571
 ; {>  %_5571~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1490 })) }
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
	jc LB_6556
	btr r12,5
	jmp LB_6557
LB_6556:
	bts r12,5
LB_6557:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6554
	btr QWORD [rdi],0
	jmp LB_6555
LB_6554:
	bts QWORD [rdi],0
LB_6555:
	mov r11,r14
	bt r12,1
	jc LB_6560
	btr r12,5
	jmp LB_6561
LB_6560:
	bts r12,5
LB_6561:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6558
	btr QWORD [rdi],1
	jmp LB_6559
LB_6558:
	bts QWORD [rdi],1
LB_6559:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6552
	btr QWORD [rdi],0
	jmp LB_6553
LB_6552:
	bts QWORD [rdi],0
LB_6553:
	mov r10,r8
	bt r12,2
	jc LB_6564
	btr r12,4
	jmp LB_6565
LB_6564:
	bts r12,4
LB_6565:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6562
	btr QWORD [rdi],1
	jmp LB_6563
LB_6562:
	bts QWORD [rdi],1
LB_6563:
	mov rsi,1
	bt r12,3
	jc LB_6550
	mov rsi,0
	bt r9,0
	jc LB_6550
	jmp LB_6551
LB_6550:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6551:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6566:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6568
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6567
LB_6568:
	add rsp,8
	ret
LB_6570:
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
LB_6569:
	add rsp,80
	pop r14
LB_6567:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6634
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5572 : %_5572
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5572 ⊢ %_5573 : %_5573
 ; {>  %_5572~°1◂{  }:(_lst)◂(t2362'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5573
 ; {>  %_5573~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2365'(0))) }
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
	jc LB_6632
	mov rsi,0
	bt r9,0
	jc LB_6632
	jmp LB_6633
LB_6632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6633:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6634:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6636
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6635
LB_6636:
	add rsp,8
	ret
LB_6637:
	add rsp,0
	pop r14
LB_6635:
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
	sub rsp,96
; "@"
	jmp LB_6728
LB_6727:
	add r14,1
LB_6728:
	cmp r14,r10
	jge LB_6729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6727
	cmp al,10
	jz LB_6727
	cmp al,32
	jz LB_6727
LB_6729:
	add r14,1
	cmp r14,r10
	jg LB_6732
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6732
	jmp LB_6733
LB_6732:
	jmp LB_6675
LB_6733:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6690
LB_6689:
	add r14,1
LB_6690:
	cmp r14,r10
	jge LB_6691
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6689
	cmp al,10
	jz LB_6689
	cmp al,32
	jz LB_6689
LB_6691:
	add r14,1
	cmp r14,r10
	jg LB_6695
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6695
	jmp LB_6696
LB_6695:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6693
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6693:
	jmp LB_6676
LB_6696:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6698
LB_6697:
	add r14,1
LB_6698:
	cmp r14,r10
	jge LB_6699
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6697
	cmp al,10
	jz LB_6697
	cmp al,32
	jz LB_6697
LB_6699:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6700
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6701
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6701:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6702
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6702:
	jmp LB_6676
LB_6700:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
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
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6707
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6708
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6708:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6709
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6709:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6710
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6710:
	jmp LB_6676
LB_6707:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_6713
LB_6712:
	add r14,1
LB_6713:
	cmp r14,r10
	jge LB_6714
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6712
	cmp al,10
	jz LB_6712
	cmp al,32
	jz LB_6712
LB_6714:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6715
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6716
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6716:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6717
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6717:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6718
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6718:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6719
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6719:
	jmp LB_6676
LB_6715:
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
LB_6725:
	jmp LB_6722
LB_6721:
	add r14,1
LB_6722:
	cmp r14,r10
	jge LB_6723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6721
	cmp al,10
	jz LB_6721
	cmp al,32
	jz LB_6721
LB_6723:
	push r10
	push rsi
	call NS_E_5457_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6724
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6726
	bts QWORD [rax],0
LB_6726:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6725
LB_6724:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6687
	btr r12,5
	clc
	jmp LB_6688
LB_6687:
	bts r12,5
	stc
LB_6688:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6685
	btr r12,4
	clc
	jmp LB_6686
LB_6685:
	bts r12,4
	stc
LB_6686:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6683
	btr r12,3
	clc
	jmp LB_6684
LB_6683:
	bts r12,3
	stc
LB_6684:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6681
	btr r12,2
	clc
	jmp LB_6682
LB_6681:
	bts r12,2
	stc
LB_6682:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6679
	btr r12,1
	clc
	jmp LB_6680
LB_6679:
	bts r12,1
	stc
LB_6680:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6677
	btr r12,0
	clc
	jmp LB_6678
LB_6677:
	bts r12,0
	stc
LB_6678:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_6672
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_6734
	btr r12,6
	jmp LB_6735
LB_6734:
	bts r12,6
LB_6735:
	mov r9,r11
	bt r12,5
	jc LB_6736
	btr r12,3
	jmp LB_6737
LB_6736:
	bts r12,3
LB_6737:
	mov r11,r8
	bt r12,2
	jc LB_6738
	btr r12,5
	jmp LB_6739
LB_6738:
	bts r12,5
LB_6739:
	mov r8,r10
	bt r12,4
	jc LB_6740
	btr r12,2
	jmp LB_6741
LB_6740:
	bts r12,2
LB_6741:
	mov r10,r14
	bt r12,1
	jc LB_6742
	btr r12,4
	jmp LB_6743
LB_6742:
	bts r12,4
LB_6743:
	mov r14,rcx
	bt r12,6
	jc LB_6744
	btr r12,1
	jmp LB_6745
LB_6744:
	bts r12,1
LB_6745:
	mov rcx,r13
	bt r12,0
	jc LB_6746
	btr r12,6
	jmp LB_6747
LB_6746:
	bts r12,6
LB_6747:
	mov r13,r11
	bt r12,5
	jc LB_6748
	btr r12,0
	jmp LB_6749
LB_6748:
	bts r12,0
LB_6749:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f621 %_5577 ⊢ %_5578 : %_5578
 ; {>  %_5575~1':(_p1432)◂((_p1440)◂(_stg)) %_5574~0':_stg %_5576~2':(_p1445)◂(_stg) %_5577~3':(_lst)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) }
; _f621 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_6644
	btr r12,0
	jmp LB_6645
LB_6644:
	bts r12,0
LB_6645:
	call NS_E_621
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_6646
	btr r12,3
	jmp LB_6647
LB_6646:
	bts r12,3
LB_6647:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_6642
	btr r12,2
	clc
	jmp LB_6643
LB_6642:
	bts r12,2
	stc
LB_6643:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6640
	btr r12,1
	clc
	jmp LB_6641
LB_6640:
	bts r12,1
	stc
LB_6641:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6638
	btr r12,0
	clc
	jmp LB_6639
LB_6638:
	bts r12,0
	stc
LB_6639:
	add rsp,32
; _cns { { %_5574 %_5575 %_5576 } %_5578 } ⊢ %_5579 : %_5579
 ; {>  %_5575~1':(_p1432)◂((_p1440)◂(_stg)) %_5578~3':(_lst)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) %_5574~0':_stg %_5576~2':(_p1445)◂(_stg) }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f1494 %_5579 ⊢ %_5580 : %_5580
 ; {>  %_5579~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) }
; _f1494 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_5580 ⊢ %_5581 : %_5581
 ; {>  %_5580~°3◂°0◂{ { 0' 1' 2' } 3' }:_p1478 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_5581
 ; {>  %_5581~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p1478) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6648
	btr r12,4
	jmp LB_6649
LB_6648:
	bts r12,4
LB_6649:
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
	jc LB_6658
	btr r12,6
	jmp LB_6659
LB_6658:
	bts r12,6
LB_6659:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_6656
	btr QWORD [rdi],0
	jmp LB_6657
LB_6656:
	bts QWORD [rdi],0
LB_6657:
	mov rcx,r14
	bt r12,1
	jc LB_6662
	btr r12,6
	jmp LB_6663
LB_6662:
	bts r12,6
LB_6663:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_6660
	btr QWORD [rdi],1
	jmp LB_6661
LB_6660:
	bts QWORD [rdi],1
LB_6661:
	mov rcx,r8
	bt r12,2
	jc LB_6666
	btr r12,6
	jmp LB_6667
LB_6666:
	bts r12,6
LB_6667:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_6664
	btr QWORD [rdi],2
	jmp LB_6665
LB_6664:
	bts QWORD [rdi],2
LB_6665:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6654
	btr QWORD [rdi],0
	jmp LB_6655
LB_6654:
	bts QWORD [rdi],0
LB_6655:
	mov r11,r10
	bt r12,4
	jc LB_6670
	btr r12,5
	jmp LB_6671
LB_6670:
	bts r12,5
LB_6671:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6668
	btr QWORD [rdi],1
	jmp LB_6669
LB_6668:
	bts QWORD [rdi],1
LB_6669:
	mov rsi,1
	bt r12,3
	jc LB_6652
	mov rsi,0
	bt r9,0
	jc LB_6652
	jmp LB_6653
LB_6652:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6653:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6650
	mov rsi,0
	bt r9,0
	jc LB_6650
	jmp LB_6651
LB_6650:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6651:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6672:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6674
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6673
LB_6674:
	add rsp,8
	ret
LB_6676:
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
LB_6675:
	add rsp,96
	pop r14
LB_6673:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_6769
LB_6768:
	add r14,1
LB_6769:
	cmp r14,r10
	jge LB_6770
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6768
	cmp al,10
	jz LB_6768
	cmp al,32
	jz LB_6768
LB_6770:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6771
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6763
LB_6771:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_6774
LB_6773:
	add r14,1
LB_6774:
	cmp r14,r10
	jge LB_6775
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6773
	cmp al,10
	jz LB_6773
	cmp al,32
	jz LB_6773
LB_6775:
	push r10
	call NS_E_5458_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6776
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6777
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6777:
	jmp LB_6763
LB_6776:
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
	jc LB_6766
	btr r12,1
	clc
	jmp LB_6767
LB_6766:
	bts r12,1
	stc
LB_6767:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6764
	btr r12,0
	clc
	jmp LB_6765
LB_6764:
	bts r12,0
	stc
LB_6765:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6760
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1493 { %_5582 %_5583 } ⊢ %_5584 : %_5584
 ; {>  %_5583~1':_p1480 %_5582~0':_stg }
; _f1493 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_5584 ⊢ %_5585 : %_5585
 ; {>  %_5584~°2◂{ 0' 1' }:_p1478 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_5585
 ; {>  %_5585~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1478) }
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
	jc LB_6754
	btr r12,2
	jmp LB_6755
LB_6754:
	bts r12,2
LB_6755:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6752
	btr QWORD [rdi],0
	jmp LB_6753
LB_6752:
	bts QWORD [rdi],0
LB_6753:
	mov r8,r14
	bt r12,1
	jc LB_6758
	btr r12,2
	jmp LB_6759
LB_6758:
	bts r12,2
LB_6759:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6756
	btr QWORD [rdi],1
	jmp LB_6757
LB_6756:
	bts QWORD [rdi],1
LB_6757:
	mov rsi,1
	bt r12,3
	jc LB_6750
	mov rsi,0
	bt r9,0
	jc LB_6750
	jmp LB_6751
LB_6750:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6751:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6760:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6762
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6761
LB_6762:
	add rsp,8
	ret
LB_6763:
	add rsp,32
	pop r14
LB_6761:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6780
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "lc_etr_body 0" _ ⊢ 0' : %_5586
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5586 ⊢ %_5587 : %_5587
 ; {>  %_5586~0':_stg }
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
; _none {  } ⊢ %_5588 : %_5588
 ; {>  %_5587~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5588
 ; {>  %_5587~0':_stg %_5588~°1◂{  }:(_opn)◂(t2392'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6779
	mov rdi,r13
	call dlt
LB_6779:
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
LB_6780:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6782
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6781
LB_6782:
	add rsp,8
	ret
LB_6783:
	add rsp,0
	pop r14
LB_6781:
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
	sub rsp,80
; "@"
	jmp LB_6811
LB_6810:
	add r14,1
LB_6811:
	cmp r14,r10
	jge LB_6812
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6810
	cmp al,10
	jz LB_6810
	cmp al,32
	jz LB_6810
LB_6812:
	add r14,1
	cmp r14,r10
	jg LB_6815
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6815
	jmp LB_6816
LB_6815:
	jmp LB_6799
LB_6816:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
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
	jg LB_6823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6823
	jmp LB_6824
LB_6823:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6821:
	jmp LB_6799
LB_6824:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6826
LB_6825:
	add r14,1
LB_6826:
	cmp r14,r10
	jge LB_6827
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6825
	cmp al,10
	jz LB_6825
	cmp al,32
	jz LB_6825
LB_6827:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6828
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6829
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6829:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6830
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6830:
	jmp LB_6799
LB_6828:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
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
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6835
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6836
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6836:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6837
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6837:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6838
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6838:
	jmp LB_6799
LB_6835:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_6841
LB_6840:
	add r14,1
LB_6841:
	cmp r14,r10
	jge LB_6842
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6840
	cmp al,10
	jz LB_6840
	cmp al,32
	jz LB_6840
LB_6842:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6843
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6844
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6844:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6845
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6845:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6846
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6846:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6847
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6847:
	jmp LB_6799
LB_6843:
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
	jc LB_6808
	btr r12,4
	clc
	jmp LB_6809
LB_6808:
	bts r12,4
	stc
LB_6809:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6806
	btr r12,3
	clc
	jmp LB_6807
LB_6806:
	bts r12,3
	stc
LB_6807:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6804
	btr r12,2
	clc
	jmp LB_6805
LB_6804:
	bts r12,2
	stc
LB_6805:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6802
	btr r12,1
	clc
	jmp LB_6803
LB_6802:
	bts r12,1
	stc
LB_6803:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6800
	btr r12,0
	clc
	jmp LB_6801
LB_6800:
	bts r12,0
	stc
LB_6801:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6796
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov rdi,r8
	mov QWORD [st_vct+8*8],rdi
	bt r12,2
	jc LB_6849
	btr r12,8
	jmp LB_6850
LB_6849:
	bts r12,8
LB_6850:
	mov r8,r10
	bt r12,4
	jc LB_6851
	btr r12,2
	jmp LB_6852
LB_6851:
	bts r12,2
LB_6852:
	mov r10,r14
	bt r12,1
	jc LB_6853
	btr r12,4
	jmp LB_6854
LB_6853:
	bts r12,4
LB_6854:
	mov r14,r9
	bt r12,3
	jc LB_6855
	btr r12,1
	jmp LB_6856
LB_6855:
	bts r12,1
LB_6856:
	mov r9,r13
	bt r12,0
	jc LB_6857
	btr r12,3
	jmp LB_6858
LB_6857:
	bts r12,3
LB_6858:
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_6859
	btr r12,0
	jmp LB_6860
LB_6859:
	bts r12,0
LB_6860:
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
; _some { %_5589 %_5590 %_5591 } ⊢ %_5592 : %_5592
 ; {>  %_5591~2':(_p1445)◂(_stg) %_5589~0':_stg %_5590~1':(_p1432)◂((_p1440)◂(_stg)) }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_5592
 ; {>  %_5592~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) }) }
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
	jc LB_6786
	btr r12,4
	jmp LB_6787
LB_6786:
	bts r12,4
LB_6787:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6784
	btr QWORD [rdi],0
	jmp LB_6785
LB_6784:
	bts QWORD [rdi],0
LB_6785:
	mov r10,r14
	bt r12,1
	jc LB_6790
	btr r12,4
	jmp LB_6791
LB_6790:
	bts r12,4
LB_6791:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6788
	btr QWORD [rdi],1
	jmp LB_6789
LB_6788:
	bts QWORD [rdi],1
LB_6789:
	mov r10,r8
	bt r12,2
	jc LB_6794
	btr r12,4
	jmp LB_6795
LB_6794:
	bts r12,4
LB_6795:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_6792
	btr QWORD [rdi],2
	jmp LB_6793
LB_6792:
	bts QWORD [rdi],2
LB_6793:
	mov r8,0
	bts r12,2
	ret
LB_6796:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6798
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6797
LB_6798:
	add rsp,8
	ret
LB_6799:
	add rsp,80
	pop r14
LB_6797:
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
	sub rsp,32
; "="
	jmp LB_6881
LB_6880:
	add r14,1
LB_6881:
	cmp r14,r10
	jge LB_6882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6880
	cmp al,10
	jz LB_6880
	cmp al,32
	jz LB_6880
LB_6882:
	add r14,1
	cmp r14,r10
	jg LB_6885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6885
	jmp LB_6886
LB_6885:
	jmp LB_6868
LB_6886:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_6875
LB_6874:
	add r14,1
LB_6875:
	cmp r14,r10
	jge LB_6876
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6874
	cmp al,10
	jz LB_6874
	cmp al,32
	jz LB_6874
LB_6876:
	push r10
	call NS_E_4443_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6877
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6878
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6878:
	jmp LB_6869
LB_6877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6872
	btr r12,1
	clc
	jmp LB_6873
LB_6872:
	bts r12,1
	stc
LB_6873:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6870
	btr r12,0
	clc
	jmp LB_6871
LB_6870:
	bts r12,0
	stc
LB_6871:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6865
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6887
	btr r12,2
	jmp LB_6888
LB_6887:
	bts r12,2
LB_6888:
	mov r13,r14
	bt r12,1
	jc LB_6889
	btr r12,0
	jmp LB_6890
LB_6889:
	bts r12,0
LB_6890:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1500 %_5593 ⊢ %_5594 : %_5594
 ; {>  %_5593~0':_p1435 }
; _f1500 0' ⊢ °1◂0'
; _some %_5594 ⊢ %_5595 : %_5595
 ; {>  %_5594~°1◂0':_p1480 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5595
 ; {>  %_5595~°0◂°1◂0':(_opn)◂(_p1480) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6863
	btr r12,3
	jmp LB_6864
LB_6863:
	bts r12,3
LB_6864:
	mov rsi,1
	bt r12,3
	jc LB_6861
	mov rsi,0
	bt r9,0
	jc LB_6861
	jmp LB_6862
LB_6861:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6862:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6865:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6867
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6866
LB_6867:
	add rsp,8
	ret
LB_6869:
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
LB_6868:
	add rsp,32
	pop r14
LB_6866:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_6911
LB_6910:
	add r14,1
LB_6911:
	cmp r14,r10
	jge LB_6912
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6910
	cmp al,10
	jz LB_6910
	cmp al,32
	jz LB_6910
LB_6912:
	add r14,2
	cmp r14,r10
	jg LB_6915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_6915
	jmp LB_6916
LB_6915:
	jmp LB_6898
LB_6916:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_6905
LB_6904:
	add r14,1
LB_6905:
	cmp r14,r10
	jge LB_6906
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6904
	cmp al,10
	jz LB_6904
	cmp al,32
	jz LB_6904
LB_6906:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6907
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6908
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6908:
	jmp LB_6899
LB_6907:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6902
	btr r12,1
	clc
	jmp LB_6903
LB_6902:
	bts r12,1
	stc
LB_6903:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6900
	btr r12,0
	clc
	jmp LB_6901
LB_6900:
	bts r12,0
	stc
LB_6901:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6895
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6917
	btr r12,2
	jmp LB_6918
LB_6917:
	bts r12,2
LB_6918:
	mov r13,r14
	bt r12,1
	jc LB_6919
	btr r12,0
	jmp LB_6920
LB_6919:
	bts r12,0
LB_6920:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1501 %_5596 ⊢ %_5597 : %_5597
 ; {>  %_5596~0':(_p1445)◂(_stg) }
; _f1501 0' ⊢ °2◂0'
; _some %_5597 ⊢ %_5598 : %_5598
 ; {>  %_5597~°2◂0':_p1480 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_5598
 ; {>  %_5598~°0◂°2◂0':(_opn)◂(_p1480) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6893
	btr r12,3
	jmp LB_6894
LB_6893:
	bts r12,3
LB_6894:
	mov rsi,1
	bt r12,3
	jc LB_6891
	mov rsi,0
	bt r9,0
	jc LB_6891
	jmp LB_6892
LB_6891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6892:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6895:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6897
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6896
LB_6897:
	add rsp,8
	ret
LB_6899:
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
LB_6898:
	add rsp,32
	pop r14
LB_6896:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_6940
LB_6939:
	add r14,1
LB_6940:
	cmp r14,r10
	jge LB_6941
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6939
	cmp al,10
	jz LB_6939
	cmp al,32
	jz LB_6939
LB_6941:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6942
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6934
LB_6942:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_6945
LB_6944:
	add r14,1
LB_6945:
	cmp r14,r10
	jge LB_6946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6944
	cmp al,10
	jz LB_6944
	cmp al,32
	jz LB_6944
LB_6946:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6947
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6948
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6948:
	jmp LB_6934
LB_6947:
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
	jc LB_6937
	btr r12,1
	clc
	jmp LB_6938
LB_6937:
	bts r12,1
	stc
LB_6938:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6935
	btr r12,0
	clc
	jmp LB_6936
LB_6935:
	bts r12,0
	stc
LB_6936:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6931
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1499 { %_5599 %_5600 } ⊢ %_5601 : %_5601
 ; {>  %_5600~1':(_p1445)◂(_stg) %_5599~0':(_p1432)◂((_p1440)◂(_stg)) }
; _f1499 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5601 ⊢ %_5602 : %_5602
 ; {>  %_5601~°0◂{ 0' 1' }:_p1480 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5602
 ; {>  %_5602~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1480) }
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
	jc LB_6925
	btr r12,2
	jmp LB_6926
LB_6925:
	bts r12,2
LB_6926:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6923
	btr QWORD [rdi],0
	jmp LB_6924
LB_6923:
	bts QWORD [rdi],0
LB_6924:
	mov r8,r14
	bt r12,1
	jc LB_6929
	btr r12,2
	jmp LB_6930
LB_6929:
	bts r12,2
LB_6930:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6927
	btr QWORD [rdi],1
	jmp LB_6928
LB_6927:
	bts QWORD [rdi],1
LB_6928:
	mov rsi,1
	bt r12,3
	jc LB_6921
	mov rsi,0
	bt r9,0
	jc LB_6921
	jmp LB_6922
LB_6921:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6922:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6931:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6933
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6932
LB_6933:
	add rsp,8
	ret
LB_6934:
	add rsp,32
	pop r14
LB_6932:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5459:
NS_E_RDI_5459:
NS_E_5459_ETR_TBL:
NS_E_5459_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142|"
	jmp LB_6959
LB_6958:
	add r14,1
LB_6959:
	cmp r14,r10
	jge LB_6960
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6958
	cmp al,10
	jz LB_6958
	cmp al,32
	jz LB_6958
LB_6960:
	add r14,4
	cmp r14,r10
	jg LB_6963
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6963
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6963
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,142
	jnz LB_6963
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,124
	jnz LB_6963
	jmp LB_6964
LB_6963:
	jmp LB_6955
LB_6964:
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
	jc LB_6956
	btr r12,0
	clc
	jmp LB_6957
LB_6956:
	bts r12,0
	stc
LB_6957:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6952
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1456 {  } ⊢ %_5603 : %_5603
 ; {>  }
; _f1456 {  } ⊢ °3◂{  }
; _some %_5603 ⊢ %_5604 : %_5604
 ; {>  %_5603~°3◂{  }:(_p1445)◂(t2418'(0)) }
; _some °3◂{  } ⊢ °0◂°3◂{  }
; ∎ %_5604
 ; {>  %_5604~°0◂°3◂{  }:(_opn)◂((_p1445)◂(t2421'(0))) }
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
	jc LB_6950
	mov rsi,0
	bt r9,0
	jc LB_6950
	jmp LB_6951
LB_6950:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6951:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6952:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6954
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6953
LB_6954:
	add rsp,8
	ret
LB_6955:
	add rsp,16
	pop r14
LB_6953:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_6985
LB_6984:
	add r14,1
LB_6985:
	cmp r14,r10
	jge LB_6986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6984
	cmp al,10
	jz LB_6984
	cmp al,32
	jz LB_6984
LB_6986:
	add r14,3
	cmp r14,r10
	jg LB_6989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_6989
	jmp LB_6990
LB_6989:
	jmp LB_6972
LB_6990:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_6979
LB_6978:
	add r14,1
LB_6979:
	cmp r14,r10
	jge LB_6980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6978
	cmp al,10
	jz LB_6978
	cmp al,32
	jz LB_6978
LB_6980:
	push r10
	call NS_E_4572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6981
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6982
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6982:
	jmp LB_6973
LB_6981:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6976
	btr r12,1
	clc
	jmp LB_6977
LB_6976:
	bts r12,1
	stc
LB_6977:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6974
	btr r12,0
	clc
	jmp LB_6975
LB_6974:
	bts r12,0
	stc
LB_6975:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6969
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6991
	btr r12,2
	jmp LB_6992
LB_6991:
	bts r12,2
LB_6992:
	mov r13,r14
	bt r12,1
	jc LB_6993
	btr r12,0
	jmp LB_6994
LB_6993:
	bts r12,0
LB_6994:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1455 %_5605 ⊢ %_5606 : %_5606
 ; {>  %_5605~0':(_p1432)◂((_p1439)◂(_stg)) }
; _f1455 0' ⊢ °2◂0'
; _some %_5606 ⊢ %_5607 : %_5607
 ; {>  %_5606~°2◂0':(_p1445)◂(_stg) }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_5607
 ; {>  %_5607~°0◂°2◂0':(_opn)◂((_p1445)◂(_stg)) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6967
	btr r12,3
	jmp LB_6968
LB_6967:
	bts r12,3
LB_6968:
	mov rsi,1
	bt r12,3
	jc LB_6965
	mov rsi,0
	bt r9,0
	jc LB_6965
	jmp LB_6966
LB_6965:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6966:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6969:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6971
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6970
LB_6971:
	add rsp,8
	ret
LB_6973:
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
LB_6972:
	add rsp,32
	pop r14
LB_6970:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_7006
LB_7005:
	add r14,1
LB_7006:
	cmp r14,r10
	jge LB_7007
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7005
	cmp al,10
	jz LB_7005
	cmp al,32
	jz LB_7005
LB_7007:
	push r10
	call NS_E_5468_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7008
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7002
LB_7008:
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
	jc LB_7003
	btr r12,0
	clc
	jmp LB_7004
LB_7003:
	bts r12,0
	stc
LB_7004:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6999
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1454 %_5608 ⊢ %_5609 : %_5609
 ; {>  %_5608~0':(_p1447)◂(_stg) }
; _f1454 0' ⊢ °1◂0'
; _some %_5609 ⊢ %_5610 : %_5610
 ; {>  %_5609~°1◂0':(_p1445)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5610
 ; {>  %_5610~°0◂°1◂0':(_opn)◂((_p1445)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6997
	btr r12,3
	jmp LB_6998
LB_6997:
	bts r12,3
LB_6998:
	mov rsi,1
	bt r12,3
	jc LB_6995
	mov rsi,0
	bt r9,0
	jc LB_6995
	jmp LB_6996
LB_6995:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6996:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6999:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7001
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7000
LB_7001:
	add rsp,8
	ret
LB_7002:
	add rsp,16
	pop r14
LB_7000:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_7029
LB_7028:
	add r14,1
LB_7029:
	cmp r14,r10
	jge LB_7030
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7028
	cmp al,10
	jz LB_7028
	cmp al,32
	jz LB_7028
LB_7030:
	push r10
	call NS_E_5460_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7031
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7023
LB_7031:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_7034
LB_7033:
	add r14,1
LB_7034:
	cmp r14,r10
	jge LB_7035
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7033
	cmp al,10
	jz LB_7033
	cmp al,32
	jz LB_7033
LB_7035:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7036
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7037
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7037:
	jmp LB_7023
LB_7036:
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
	jc LB_7026
	btr r12,1
	clc
	jmp LB_7027
LB_7026:
	bts r12,1
	stc
LB_7027:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7024
	btr r12,0
	clc
	jmp LB_7025
LB_7024:
	bts r12,0
	stc
LB_7025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7020
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1453 { %_5611 %_5612 } ⊢ %_5613 : %_5613
 ; {>  %_5611~0':(_p1446)◂(_stg) %_5612~1':(_p1445)◂(_stg) }
; _f1453 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5613 ⊢ %_5614 : %_5614
 ; {>  %_5613~°0◂{ 0' 1' }:(_p1445)◂(_stg) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5614
 ; {>  %_5614~°0◂°0◂{ 0' 1' }:(_opn)◂((_p1445)◂(_stg)) }
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
	jc LB_7014
	btr r12,2
	jmp LB_7015
LB_7014:
	bts r12,2
LB_7015:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7012
	btr QWORD [rdi],0
	jmp LB_7013
LB_7012:
	bts QWORD [rdi],0
LB_7013:
	mov r8,r14
	bt r12,1
	jc LB_7018
	btr r12,2
	jmp LB_7019
LB_7018:
	bts r12,2
LB_7019:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7016
	btr QWORD [rdi],1
	jmp LB_7017
LB_7016:
	bts QWORD [rdi],1
LB_7017:
	mov rsi,1
	bt r12,3
	jc LB_7010
	mov rsi,0
	bt r9,0
	jc LB_7010
	jmp LB_7011
LB_7010:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7011:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7020:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7022
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7021
LB_7022:
	add rsp,8
	ret
LB_7023:
	add rsp,32
	pop r14
LB_7021:
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
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_7105
LB_7104:
	add r14,1
LB_7105:
	cmp r14,r10
	jge LB_7106
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7104
	cmp al,10
	jz LB_7104
	cmp al,32
	jz LB_7104
LB_7106:
	add r14,1
	cmp r14,r10
	jg LB_7109
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_7109
	jmp LB_7110
LB_7109:
	jmp LB_7060
LB_7110:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_7073
LB_7072:
	add r14,1
LB_7073:
	cmp r14,r10
	jge LB_7074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7072
	cmp al,10
	jz LB_7072
	cmp al,32
	jz LB_7072
LB_7074:
	push r10
	call NS_E_4572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7075
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7076
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7076:
	jmp LB_7061
LB_7075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7079
LB_7078:
	add r14,1
LB_7079:
	cmp r14,r10
	jge LB_7080
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7078
	cmp al,10
	jz LB_7078
	cmp al,32
	jz LB_7078
LB_7080:
	add r14,3
	cmp r14,r10
	jg LB_7085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7085
	jmp LB_7086
LB_7085:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7082
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7082:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7083
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7083:
	jmp LB_7061
LB_7086:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7088
LB_7087:
	add r14,1
LB_7088:
	cmp r14,r10
	jge LB_7089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7087
	cmp al,10
	jz LB_7087
	cmp al,32
	jz LB_7087
LB_7089:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7090
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7091
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7091:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7092
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7092:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7093
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7093:
	jmp LB_7061
LB_7090:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_7096
LB_7095:
	add r14,1
LB_7096:
	cmp r14,r10
	jge LB_7097
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7095
	cmp al,10
	jz LB_7095
	cmp al,32
	jz LB_7095
LB_7097:
	push r10
	call NS_E_4835_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7098
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7099
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7099:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7100
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7100:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7101
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7101:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7102
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7102:
	jmp LB_7061
LB_7098:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7070
	btr r12,4
	clc
	jmp LB_7071
LB_7070:
	bts r12,4
	stc
LB_7071:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7068
	btr r12,3
	clc
	jmp LB_7069
LB_7068:
	bts r12,3
	stc
LB_7069:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7066
	btr r12,2
	clc
	jmp LB_7067
LB_7066:
	bts r12,2
	stc
LB_7067:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7064
	btr r12,1
	clc
	jmp LB_7065
LB_7064:
	bts r12,1
	stc
LB_7065:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7062
	btr r12,0
	clc
	jmp LB_7063
LB_7062:
	bts r12,0
	stc
LB_7063:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7057
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_7111
	btr r12,5
	jmp LB_7112
LB_7111:
	bts r12,5
LB_7112:
	mov r8,r10
	bt r12,4
	jc LB_7113
	btr r12,2
	jmp LB_7114
LB_7113:
	bts r12,2
LB_7114:
	mov r10,r14
	bt r12,1
	jc LB_7115
	btr r12,4
	jmp LB_7116
LB_7115:
	bts r12,4
LB_7116:
	mov r14,r9
	bt r12,3
	jc LB_7117
	btr r12,1
	jmp LB_7118
LB_7117:
	bts r12,1
LB_7118:
	mov r9,r13
	bt r12,0
	jc LB_7119
	btr r12,3
	jmp LB_7120
LB_7119:
	bts r12,3
LB_7120:
	mov r13,r10
	bt r12,4
	jc LB_7121
	btr r12,0
	jmp LB_7122
LB_7121:
	bts r12,0
LB_7122:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5616 %_5617 } ⊢ %_5618 : %_5618
 ; {>  %_5616~1':(_p1432)◂((_p1440)◂(_stg)) %_5617~2':(_lst)◂((_p1432)◂((_p1440)◂(_stg))) %_5615~0':(_p1432)◂((_p1439)◂(_stg)) }
; _cns { 1' 2' } ⊢ °0◂{ 1' 2' }
; _f1458 { %_5615 %_5618 } ⊢ %_5619 : %_5619
 ; {>  %_5618~°0◂{ 1' 2' }:(_lst)◂((_p1432)◂((_p1440)◂(_stg))) %_5615~0':(_p1432)◂((_p1439)◂(_stg)) }
; _f1458 { 0' °0◂{ 1' 2' } } ⊢ °1◂{ 0' °0◂{ 1' 2' } }
; _some %_5619 ⊢ %_5620 : %_5620
 ; {>  %_5619~°1◂{ 0' °0◂{ 1' 2' } }:(_p1446)◂(_stg) }
; _some °1◂{ 0' °0◂{ 1' 2' } } ⊢ °0◂°1◂{ 0' °0◂{ 1' 2' } }
; ∎ %_5620
 ; {>  %_5620~°0◂°1◂{ 0' °0◂{ 1' 2' } }:(_opn)◂((_p1446)◂(_stg)) }
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
	jc LB_7043
	btr r12,4
	jmp LB_7044
LB_7043:
	bts r12,4
LB_7044:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7041
	btr QWORD [rdi],0
	jmp LB_7042
LB_7041:
	bts QWORD [rdi],0
LB_7042:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r13,r14
	bt r12,1
	jc LB_7051
	btr r12,0
	jmp LB_7052
LB_7051:
	bts r12,0
LB_7052:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7049
	btr QWORD [rdi],0
	jmp LB_7050
LB_7049:
	bts QWORD [rdi],0
LB_7050:
	mov r13,r8
	bt r12,2
	jc LB_7055
	btr r12,0
	jmp LB_7056
LB_7055:
	bts r12,0
LB_7056:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7053
	btr QWORD [rdi],1
	jmp LB_7054
LB_7053:
	bts QWORD [rdi],1
LB_7054:
	mov rsi,1
	bt r12,4
	jc LB_7047
	mov rsi,0
	bt r10,0
	jc LB_7047
	jmp LB_7048
LB_7047:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7048:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7045
	btr QWORD [rdi],1
	jmp LB_7046
LB_7045:
	bts QWORD [rdi],1
LB_7046:
	mov rsi,1
	bt r12,3
	jc LB_7039
	mov rsi,0
	bt r9,0
	jc LB_7039
	jmp LB_7040
LB_7039:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7040:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7057:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7059
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7058
LB_7059:
	add rsp,8
	ret
LB_7061:
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
LB_7060:
	add rsp,80
	pop r14
LB_7058:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_7199
LB_7198:
	add r14,1
LB_7199:
	cmp r14,r10
	jge LB_7200
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7198
	cmp al,10
	jz LB_7198
	cmp al,32
	jz LB_7198
LB_7200:
	add r14,3
	cmp r14,r10
	jg LB_7203
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7203
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_7203
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_7203
	jmp LB_7204
LB_7203:
	jmp LB_7140
LB_7204:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_7155
LB_7154:
	add r14,1
LB_7155:
	cmp r14,r10
	jge LB_7156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7154
	cmp al,10
	jz LB_7154
	cmp al,32
	jz LB_7154
LB_7156:
	push r10
	call NS_E_4575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7157
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7158
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7158:
	jmp LB_7141
LB_7157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_7161
LB_7160:
	add r14,1
LB_7161:
	cmp r14,r10
	jge LB_7162
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7160
	cmp al,10
	jz LB_7160
	cmp al,32
	jz LB_7160
LB_7162:
	add r14,1
	cmp r14,r10
	jg LB_7167
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_7167
	jmp LB_7168
LB_7167:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7164
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7164:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7165
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7165:
	jmp LB_7141
LB_7168:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_7170
LB_7169:
	add r14,1
LB_7170:
	cmp r14,r10
	jge LB_7171
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7169
	cmp al,10
	jz LB_7169
	cmp al,32
	jz LB_7169
LB_7171:
	push r10
	call NS_E_4572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7172
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7173
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7173:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7174
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7174:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7175
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7175:
	jmp LB_7141
LB_7172:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_7178
LB_7177:
	add r14,1
LB_7178:
	cmp r14,r10
	jge LB_7179
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7177
	cmp al,10
	jz LB_7177
	cmp al,32
	jz LB_7177
LB_7179:
	add r14,3
	cmp r14,r10
	jg LB_7186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7186
	jmp LB_7187
LB_7186:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7181
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7181:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7182
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7182:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7183
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7183:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7184
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7184:
	jmp LB_7141
LB_7187:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_7189
LB_7188:
	add r14,1
LB_7189:
	cmp r14,r10
	jge LB_7190
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7188
	cmp al,10
	jz LB_7188
	cmp al,32
	jz LB_7188
LB_7190:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7191
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_7192
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_7192:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7193
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7193:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7194
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7194:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7195
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7195:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7196
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7196:
	jmp LB_7141
LB_7191:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_7152
	btr r12,5
	clc
	jmp LB_7153
LB_7152:
	bts r12,5
	stc
LB_7153:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7150
	btr r12,4
	clc
	jmp LB_7151
LB_7150:
	bts r12,4
	stc
LB_7151:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7148
	btr r12,3
	clc
	jmp LB_7149
LB_7148:
	bts r12,3
	stc
LB_7149:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7146
	btr r12,2
	clc
	jmp LB_7147
LB_7146:
	bts r12,2
	stc
LB_7147:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7144
	btr r12,1
	clc
	jmp LB_7145
LB_7144:
	bts r12,1
	stc
LB_7145:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7142
	btr r12,0
	clc
	jmp LB_7143
LB_7142:
	bts r12,0
	stc
LB_7143:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_7137
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_7205
	btr r12,6
	jmp LB_7206
LB_7205:
	bts r12,6
LB_7206:
	mov r8,r11
	bt r12,5
	jc LB_7207
	btr r12,2
	jmp LB_7208
LB_7207:
	bts r12,2
LB_7208:
	mov r11,r14
	bt r12,1
	jc LB_7209
	btr r12,5
	jmp LB_7210
LB_7209:
	bts r12,5
LB_7210:
	mov r14,r9
	bt r12,3
	jc LB_7211
	btr r12,1
	jmp LB_7212
LB_7211:
	bts r12,1
LB_7212:
	mov r9,r13
	bt r12,0
	jc LB_7213
	btr r12,3
	jmp LB_7214
LB_7213:
	bts r12,3
LB_7214:
	mov r13,r11
	bt r12,5
	jc LB_7215
	btr r12,0
	jmp LB_7216
LB_7215:
	bts r12,0
LB_7216:
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
; _f1459 { %_5621 %_5622 %_5623 } ⊢ %_5624 : %_5624
 ; {>  %_5621~0':(_p1439)◂(_stg) %_5622~1':(_p1432)◂((_p1439)◂(_stg)) %_5623~2':(_p1432)◂((_p1440)◂(_stg)) }
; _f1459 { 0' 1' 2' } ⊢ °2◂{ 0' 1' 2' }
; _some %_5624 ⊢ %_5625 : %_5625
 ; {>  %_5624~°2◂{ 0' 1' 2' }:(_p1446)◂(_stg) }
; _some °2◂{ 0' 1' 2' } ⊢ °0◂°2◂{ 0' 1' 2' }
; ∎ %_5625
 ; {>  %_5625~°0◂°2◂{ 0' 1' 2' }:(_opn)◂((_p1446)◂(_stg)) }
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
	jc LB_7127
	btr r12,4
	jmp LB_7128
LB_7127:
	bts r12,4
LB_7128:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7125
	btr QWORD [rdi],0
	jmp LB_7126
LB_7125:
	bts QWORD [rdi],0
LB_7126:
	mov r10,r14
	bt r12,1
	jc LB_7131
	btr r12,4
	jmp LB_7132
LB_7131:
	bts r12,4
LB_7132:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7129
	btr QWORD [rdi],1
	jmp LB_7130
LB_7129:
	bts QWORD [rdi],1
LB_7130:
	mov r10,r8
	bt r12,2
	jc LB_7135
	btr r12,4
	jmp LB_7136
LB_7135:
	bts r12,4
LB_7136:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_7133
	btr QWORD [rdi],2
	jmp LB_7134
LB_7133:
	bts QWORD [rdi],2
LB_7134:
	mov rsi,1
	bt r12,3
	jc LB_7123
	mov rsi,0
	bt r9,0
	jc LB_7123
	jmp LB_7124
LB_7123:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7124:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7137:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7139
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7138
LB_7139:
	add rsp,8
	ret
LB_7141:
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
LB_7140:
	add rsp,96
	pop r14
LB_7138:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_7235
LB_7234:
	add r14,1
LB_7235:
	cmp r14,r10
	jge LB_7236
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7234
	cmp al,10
	jz LB_7234
	cmp al,32
	jz LB_7234
LB_7236:
	add r14,2
	cmp r14,r10
	jg LB_7239
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_7239
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_7239
	jmp LB_7240
LB_7239:
	jmp LB_7222
LB_7240:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_7229
LB_7228:
	add r14,1
LB_7229:
	cmp r14,r10
	jge LB_7230
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7228
	cmp al,10
	jz LB_7228
	cmp al,32
	jz LB_7228
LB_7230:
	push r10
	call NS_E_5461_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7231
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7232
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7232:
	jmp LB_7223
LB_7231:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7226
	btr r12,1
	clc
	jmp LB_7227
LB_7226:
	bts r12,1
	stc
LB_7227:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7224
	btr r12,0
	clc
	jmp LB_7225
LB_7224:
	bts r12,0
	stc
LB_7225:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7219
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7241
	btr r12,2
	jmp LB_7242
LB_7241:
	bts r12,2
LB_7242:
	mov r13,r14
	bt r12,1
	jc LB_7243
	btr r12,0
	jmp LB_7244
LB_7243:
	bts r12,0
LB_7244:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5626 ⊢ %_5627 : %_5627
 ; {>  %_5626~0':(_p1446)◂(_stg) }
; _some 0' ⊢ °0◂0'
; ∎ %_5627
 ; {>  %_5627~°0◂0':(_opn)◂((_p1446)◂(_stg)) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7217
	btr r12,3
	jmp LB_7218
LB_7217:
	bts r12,3
LB_7218:
	mov r8,0
	bts r12,2
	ret
LB_7219:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7221
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7220
LB_7221:
	add rsp,8
	ret
LB_7223:
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
LB_7222:
	add rsp,32
	pop r14
LB_7220:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_7272
LB_7271:
	add r14,1
LB_7272:
	cmp r14,r10
	jge LB_7273
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7271
	cmp al,10
	jz LB_7271
	cmp al,32
	jz LB_7271
LB_7273:
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7274
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7262
LB_7274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_7277
LB_7276:
	add r14,1
LB_7277:
	cmp r14,r10
	jge LB_7278
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7276
	cmp al,10
	jz LB_7276
	cmp al,32
	jz LB_7276
LB_7278:
	push r10
	call NS_E_4572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7279
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7280
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7280:
	jmp LB_7262
LB_7279:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7283
LB_7282:
	add r14,1
LB_7283:
	cmp r14,r10
	jge LB_7284
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7282
	cmp al,10
	jz LB_7282
	cmp al,32
	jz LB_7282
LB_7284:
	add r14,3
	cmp r14,r10
	jg LB_7289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7289
	jmp LB_7290
LB_7289:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7286
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7286:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7287
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7287:
	jmp LB_7262
LB_7290:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7292
LB_7291:
	add r14,1
LB_7292:
	cmp r14,r10
	jge LB_7293
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7291
	cmp al,10
	jz LB_7291
	cmp al,32
	jz LB_7291
LB_7293:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7294
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7295
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7295:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7296
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7296:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7297
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7297:
	jmp LB_7262
LB_7294:
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
	jc LB_7269
	btr r12,3
	clc
	jmp LB_7270
LB_7269:
	bts r12,3
	stc
LB_7270:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7267
	btr r12,2
	clc
	jmp LB_7268
LB_7267:
	bts r12,2
	stc
LB_7268:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7265
	btr r12,1
	clc
	jmp LB_7266
LB_7265:
	bts r12,1
	stc
LB_7266:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7263
	btr r12,0
	clc
	jmp LB_7264
LB_7263:
	bts r12,0
	stc
LB_7264:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7259
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov rdx,r8
	bt r12,2
	jc LB_7299
	btr r12,7
	jmp LB_7300
LB_7299:
	bts r12,7
LB_7300:
	mov r8,r9
	bt r12,3
	jc LB_7301
	btr r12,2
	jmp LB_7302
LB_7301:
	bts r12,2
LB_7302:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _f1457 { %_5628 %_5629 %_5630 } ⊢ %_5631 : %_5631
 ; {>  %_5630~2':(_p1432)◂((_p1440)◂(_stg)) %_5629~1':(_p1432)◂((_p1439)◂(_stg)) %_5628~0':_p1387 }
; _f1457 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_5631 ⊢ %_5632 : %_5632
 ; {>  %_5631~°0◂{ 0' 1' 2' }:(_p1446)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_5632
 ; {>  %_5632~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p1446)◂(_stg)) }
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
	jc LB_7249
	btr r12,4
	jmp LB_7250
LB_7249:
	bts r12,4
LB_7250:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7247
	btr QWORD [rdi],0
	jmp LB_7248
LB_7247:
	bts QWORD [rdi],0
LB_7248:
	mov r10,r14
	bt r12,1
	jc LB_7253
	btr r12,4
	jmp LB_7254
LB_7253:
	bts r12,4
LB_7254:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7251
	btr QWORD [rdi],1
	jmp LB_7252
LB_7251:
	bts QWORD [rdi],1
LB_7252:
	mov r10,r8
	bt r12,2
	jc LB_7257
	btr r12,4
	jmp LB_7258
LB_7257:
	bts r12,4
LB_7258:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_7255
	btr QWORD [rdi],2
	jmp LB_7256
LB_7255:
	bts QWORD [rdi],2
LB_7256:
	mov rsi,1
	bt r12,3
	jc LB_7245
	mov rsi,0
	bt r9,0
	jc LB_7245
	jmp LB_7246
LB_7245:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7246:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7259:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7261
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7260
LB_7261:
	add rsp,8
	ret
LB_7262:
	add rsp,64
	pop r14
LB_7260:
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
; "_^"
	jmp LB_7353
LB_7352:
	add r14,1
LB_7353:
	cmp r14,r10
	jge LB_7354
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7352
	cmp al,10
	jz LB_7352
	cmp al,32
	jz LB_7352
LB_7354:
	add r14,2
	cmp r14,r10
	jg LB_7357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_7357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_7357
	jmp LB_7358
LB_7357:
	jmp LB_7320
LB_7358:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_7331
LB_7330:
	add r14,1
LB_7331:
	cmp r14,r10
	jge LB_7332
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7330
	cmp al,10
	jz LB_7330
	cmp al,32
	jz LB_7330
LB_7332:
	push r10
	call NS_E_5462_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7333
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7334
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7334:
	jmp LB_7321
LB_7333:
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
LB_7340:
	jmp LB_7337
LB_7336:
	add r14,1
LB_7337:
	cmp r14,r10
	jge LB_7338
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7336
	cmp al,10
	jz LB_7336
	cmp al,32
	jz LB_7336
LB_7338:
	push r10
	push rsi
	call NS_E_5463_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_7339
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_7341
	bts QWORD [rax],0
LB_7341:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_7340
LB_7339:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_7343
LB_7342:
	add r14,1
LB_7343:
	cmp r14,r10
	jge LB_7344
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7342
	cmp al,10
	jz LB_7342
	cmp al,32
	jz LB_7342
LB_7344:
	add r14,2
	cmp r14,r10
	jg LB_7350
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_7350
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_7350
	jmp LB_7351
LB_7350:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7346
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7346:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7347
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7347:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7348:
	jmp LB_7321
LB_7351:
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
	jc LB_7328
	btr r12,3
	clc
	jmp LB_7329
LB_7328:
	bts r12,3
	stc
LB_7329:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7326
	btr r12,2
	clc
	jmp LB_7327
LB_7326:
	bts r12,2
	stc
LB_7327:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7324
	btr r12,1
	clc
	jmp LB_7325
LB_7324:
	bts r12,1
	stc
LB_7325:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7322
	btr r12,0
	clc
	jmp LB_7323
LB_7322:
	bts r12,0
	stc
LB_7323:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7317
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
	jc LB_7359
	btr r12,3
	jmp LB_7360
LB_7359:
	bts r12,3
LB_7360:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_7363
	btr r12,4
	clc
	jmp LB_7364
LB_7363:
	bts r12,4
	stc
LB_7364:
	mov r13,r10
	bt r12,4
	jc LB_7361
	btr r12,0
	jmp LB_7362
LB_7361:
	bts r12,0
LB_7362:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_7367
	btr r12,4
	clc
	jmp LB_7368
LB_7367:
	bts r12,4
	stc
LB_7368:
	mov r14,r10
	bt r12,4
	jc LB_7365
	btr r12,1
	jmp LB_7366
LB_7365:
	bts r12,1
LB_7366:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1461 { %_5635 %_5633 %_5634 } ⊢ %_5636 : %_5636
 ; {>  %_5634~1':(_lst)◂((_p1440)◂(_stg)) %_5633~0':(_lst)◂((_p1439)◂(_stg)) %_5635~2':(_lst)◂(_p1451) }
; _f1461 { 2' 0' 1' } ⊢ °4◂{ 2' 0' 1' }
; _some %_5636 ⊢ %_5637 : %_5637
 ; {>  %_5636~°4◂{ 2' 0' 1' }:(_p1446)◂(_stg) }
; _some °4◂{ 2' 0' 1' } ⊢ °0◂°4◂{ 2' 0' 1' }
; ∎ %_5637
 ; {>  %_5637~°0◂°4◂{ 2' 0' 1' }:(_opn)◂((_p1446)◂(_stg)) }
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
	jc LB_7307
	btr r12,4
	jmp LB_7308
LB_7307:
	bts r12,4
LB_7308:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7305
	btr QWORD [rdi],0
	jmp LB_7306
LB_7305:
	bts QWORD [rdi],0
LB_7306:
	mov r10,r13
	bt r12,0
	jc LB_7311
	btr r12,4
	jmp LB_7312
LB_7311:
	bts r12,4
LB_7312:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7309
	btr QWORD [rdi],1
	jmp LB_7310
LB_7309:
	bts QWORD [rdi],1
LB_7310:
	mov r10,r14
	bt r12,1
	jc LB_7315
	btr r12,4
	jmp LB_7316
LB_7315:
	bts r12,4
LB_7316:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_7313
	btr QWORD [rdi],2
	jmp LB_7314
LB_7313:
	bts QWORD [rdi],2
LB_7314:
	mov rsi,1
	bt r12,3
	jc LB_7303
	mov rsi,0
	bt r9,0
	jc LB_7303
	jmp LB_7304
LB_7303:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7304:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7317:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7319
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7318
LB_7319:
	add rsp,8
	ret
LB_7321:
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
LB_7320:
	add rsp,64
	pop r14
LB_7318:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_7398
LB_7397:
	add r14,1
LB_7398:
	cmp r14,r10
	jge LB_7399
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7397
	cmp al,10
	jz LB_7397
	cmp al,32
	jz LB_7397
LB_7399:
	push r10
	call NS_E_4443_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7400
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7388
LB_7400:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_7403
LB_7402:
	add r14,1
LB_7403:
	cmp r14,r10
	jge LB_7404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7402
	cmp al,10
	jz LB_7402
	cmp al,32
	jz LB_7402
LB_7404:
	add r14,1
	cmp r14,r10
	jg LB_7408
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_7408
	jmp LB_7409
LB_7408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7406:
	jmp LB_7388
LB_7409:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_7411
LB_7410:
	add r14,1
LB_7411:
	cmp r14,r10
	jge LB_7412
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7410
	cmp al,10
	jz LB_7410
	cmp al,32
	jz LB_7410
LB_7412:
	add r14,3
	cmp r14,r10
	jg LB_7417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7417
	jmp LB_7418
LB_7417:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7414
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7414:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7415
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7415:
	jmp LB_7388
LB_7418:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7420
LB_7419:
	add r14,1
LB_7420:
	cmp r14,r10
	jge LB_7421
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7419
	cmp al,10
	jz LB_7419
	cmp al,32
	jz LB_7419
LB_7421:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7422
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7423
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7423:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7424
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7424:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7425
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7425:
	jmp LB_7388
LB_7422:
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
	jc LB_7395
	btr r12,3
	clc
	jmp LB_7396
LB_7395:
	bts r12,3
	stc
LB_7396:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7393
	btr r12,2
	clc
	jmp LB_7394
LB_7393:
	bts r12,2
	stc
LB_7394:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7391
	btr r12,1
	clc
	jmp LB_7392
LB_7391:
	bts r12,1
	stc
LB_7392:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7389
	btr r12,0
	clc
	jmp LB_7390
LB_7389:
	bts r12,0
	stc
LB_7390:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7385
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov rdx,r14
	bt r12,1
	jc LB_7427
	btr r12,7
	jmp LB_7428
LB_7427:
	bts r12,7
LB_7428:
	mov r14,r9
	bt r12,3
	jc LB_7429
	btr r12,1
	jmp LB_7430
LB_7429:
	bts r12,1
LB_7430:
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
; _nil {  } ⊢ %_5640 : %_5640
 ; {>  %_5639~1':(_p1432)◂((_p1440)◂(_stg)) %_5638~0':_p1435 }
; _nil {  } ⊢ °1◂{  }
; _f1433 %_5640 ⊢ %_5641 : %_5641
 ; {>  %_5639~1':(_p1432)◂((_p1440)◂(_stg)) %_5640~°1◂{  }:(_lst)◂(t2504'(0)) %_5638~0':_p1435 }
; _f1433 °1◂{  } ⊢ °0◂°1◂{  }
; _f1460 { %_5638 %_5641 %_5639 } ⊢ %_5642 : %_5642
 ; {>  %_5641~°0◂°1◂{  }:(_p1432)◂(t2506'(0)) %_5639~1':(_p1432)◂((_p1440)◂(_stg)) %_5638~0':_p1435 }
; _f1460 { 0' °0◂°1◂{  } 1' } ⊢ °3◂{ 0' °0◂°1◂{  } 1' }
; _some %_5642 ⊢ %_5643 : %_5643
 ; {>  %_5642~°3◂{ 0' °0◂°1◂{  } 1' }:(_p1446)◂(_stg) }
; _some °3◂{ 0' °0◂°1◂{  } 1' } ⊢ °0◂°3◂{ 0' °0◂°1◂{  } 1' }
; ∎ %_5643
 ; {>  %_5643~°0◂°3◂{ 0' °0◂°1◂{  } 1' }:(_opn)◂((_p1446)◂(_stg)) }
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
	jc LB_7373
	btr r12,2
	jmp LB_7374
LB_7373:
	bts r12,2
LB_7374:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7371
	btr QWORD [rdi],0
	jmp LB_7372
LB_7371:
	bts QWORD [rdi],0
LB_7372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_7379
	mov rsi,0
	bt r8,0
	jc LB_7379
	jmp LB_7380
LB_7379:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7380:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_7377
	mov rsi,0
	bt r8,0
	jc LB_7377
	jmp LB_7378
LB_7377:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7378:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7375
	btr QWORD [rdi],1
	jmp LB_7376
LB_7375:
	bts QWORD [rdi],1
LB_7376:
	mov r8,r14
	bt r12,1
	jc LB_7383
	btr r12,2
	jmp LB_7384
LB_7383:
	bts r12,2
LB_7384:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_7381
	btr QWORD [rdi],2
	jmp LB_7382
LB_7381:
	bts QWORD [rdi],2
LB_7382:
	mov rsi,1
	bt r12,3
	jc LB_7369
	mov rsi,0
	bt r9,0
	jc LB_7369
	jmp LB_7370
LB_7369:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7370:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7385:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7387
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7386
LB_7387:
	add rsp,8
	ret
LB_7388:
	add rsp,64
	pop r14
LB_7386:
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
	sub rsp,48
; "_"
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
	add r14,1
	cmp r14,r10
	jg LB_7471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_7471
	jmp LB_7472
LB_7471:
	jmp LB_7443
LB_7472:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_7452
LB_7451:
	add r14,1
LB_7452:
	cmp r14,r10
	jge LB_7453
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7451
	cmp al,10
	jz LB_7451
	cmp al,32
	jz LB_7451
LB_7453:
	add r14,3
	cmp r14,r10
	jg LB_7457
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7457
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7457
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7457
	jmp LB_7458
LB_7457:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7455:
	jmp LB_7444
LB_7458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_7460
LB_7459:
	add r14,1
LB_7460:
	cmp r14,r10
	jge LB_7461
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7459
	cmp al,10
	jz LB_7459
	cmp al,32
	jz LB_7459
LB_7461:
	push r10
	call NS_E_4837_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7462
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7463
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7463:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7464
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7464:
	jmp LB_7444
LB_7462:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7449
	btr r12,2
	clc
	jmp LB_7450
LB_7449:
	bts r12,2
	stc
LB_7450:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7447
	btr r12,1
	clc
	jmp LB_7448
LB_7447:
	bts r12,1
	stc
LB_7448:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7445
	btr r12,0
	clc
	jmp LB_7446
LB_7445:
	bts r12,0
	stc
LB_7446:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7440
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_7473
	btr r12,3
	jmp LB_7474
LB_7473:
	bts r12,3
LB_7474:
	mov r13,r8
	bt r12,2
	jc LB_7475
	btr r12,0
	jmp LB_7476
LB_7475:
	bts r12,0
LB_7476:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5645 : %_5645
 ; {>  %_5644~0':(_p1440)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _nil {  } ⊢ %_5646 : %_5646
 ; {>  %_5645~°1◂{  }:(_lst)◂(t2523'(0)) %_5644~0':(_p1440)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _some { %_5645 %_5646 } ⊢ %_5647 : %_5647
 ; {>  %_5646~°1◂{  }:(_lst)◂(t2525'(0)) %_5645~°1◂{  }:(_lst)◂(t2523'(0)) %_5644~0':(_p1440)◂(_stg) }
; _some { °1◂{  } °1◂{  } } ⊢ °0◂{ °1◂{  } °1◂{  } }
; ∎ %_5647
 ; {>  %_5647~°0◂{ °1◂{  } °1◂{  } }:(_opn)◂({ (_lst)◂(t2528'(0)) (_lst)◂(t2529'(0)) }) %_5644~0':(_p1440)◂(_stg) }
; 	∎ °0◂{ °1◂{  } °1◂{  } }
	bt r12,0
	jc LB_7431
	mov rdi,r13
	call dlt
LB_7431:
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
	jc LB_7434
	mov rsi,0
	bt r13,0
	jc LB_7434
	jmp LB_7435
LB_7434:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7435:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7432
	btr QWORD [rdi],0
	jmp LB_7433
LB_7432:
	bts QWORD [rdi],0
LB_7433:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_7438
	mov rsi,0
	bt r13,0
	jc LB_7438
	jmp LB_7439
LB_7438:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7439:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7436
	btr QWORD [rdi],1
	jmp LB_7437
LB_7436:
	bts QWORD [rdi],1
LB_7437:
	mov r8,0
	bts r12,2
	ret
LB_7440:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7442
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7441
LB_7442:
	add rsp,8
	ret
LB_7444:
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
LB_7443:
	add rsp,48
	pop r14
LB_7441:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_7518
LB_7517:
	add r14,1
LB_7518:
	cmp r14,r10
	jge LB_7519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7517
	cmp al,10
	jz LB_7517
	cmp al,32
	jz LB_7517
LB_7519:
	push r10
	call NS_E_4575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7520
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7506
LB_7520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_7523
LB_7522:
	add r14,1
LB_7523:
	cmp r14,r10
	jge LB_7524
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7522
	cmp al,10
	jz LB_7522
	cmp al,32
	jz LB_7522
LB_7524:
	push r10
	call NS_E_4574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7525
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7526
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7526:
	jmp LB_7506
LB_7525:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7529
LB_7528:
	add r14,1
LB_7529:
	cmp r14,r10
	jge LB_7530
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7528
	cmp al,10
	jz LB_7528
	cmp al,32
	jz LB_7528
LB_7530:
	add r14,3
	cmp r14,r10
	jg LB_7535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7535
	jmp LB_7536
LB_7535:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7532
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7532:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7533
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7533:
	jmp LB_7506
LB_7536:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_7538
LB_7537:
	add r14,1
LB_7538:
	cmp r14,r10
	jge LB_7539
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7537
	cmp al,10
	jz LB_7537
	cmp al,32
	jz LB_7537
LB_7539:
	push r10
	call NS_E_4837_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7540
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7541
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7541:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7542
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7542:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7543
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7543:
	jmp LB_7506
LB_7540:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_7546
LB_7545:
	add r14,1
LB_7546:
	cmp r14,r10
	jge LB_7547
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7545
	cmp al,10
	jz LB_7545
	cmp al,32
	jz LB_7545
LB_7547:
	push r10
	call NS_E_4836_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7548
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7549
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7549:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7550
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7550:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7551
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7551:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7552
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7552:
	jmp LB_7506
LB_7548:
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
	jc LB_7515
	btr r12,4
	clc
	jmp LB_7516
LB_7515:
	bts r12,4
	stc
LB_7516:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7513
	btr r12,3
	clc
	jmp LB_7514
LB_7513:
	bts r12,3
	stc
LB_7514:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7511
	btr r12,2
	clc
	jmp LB_7512
LB_7511:
	bts r12,2
	stc
LB_7512:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7509
	btr r12,1
	clc
	jmp LB_7510
LB_7509:
	bts r12,1
	stc
LB_7510:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7507
	btr r12,0
	clc
	jmp LB_7508
LB_7507:
	bts r12,0
	stc
LB_7508:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7503
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_7554
	btr r12,8
	jmp LB_7555
LB_7554:
	bts r12,8
LB_7555:
	mov r9,r10
	bt r12,4
	jc LB_7556
	btr r12,3
	jmp LB_7557
LB_7556:
	bts r12,3
LB_7557:
	mov r10,r8
	bt r12,2
	jc LB_7558
	btr r12,4
	jmp LB_7559
LB_7558:
	bts r12,4
LB_7559:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7560
	btr r12,2
	jmp LB_7561
LB_7560:
	bts r12,2
LB_7561:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,5
	bts r12,6
	bts r12,7
; _cns { %_5648 %_5649 } ⊢ %_5652 : %_5652
 ; {>  %_5651~3':(_lst)◂((_p1440)◂(_stg)) %_5650~2':(_p1440)◂(_stg) %_5649~1':(_lst)◂((_p1439)◂(_stg)) %_5648~0':(_p1439)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _cns { %_5650 %_5651 } ⊢ %_5653 : %_5653
 ; {>  %_5652~°0◂{ 0' 1' }:(_lst)◂((_p1439)◂(_stg)) %_5651~3':(_lst)◂((_p1440)◂(_stg)) %_5650~2':(_p1440)◂(_stg) }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; _some { %_5652 %_5653 } ⊢ %_5654 : %_5654
 ; {>  %_5652~°0◂{ 0' 1' }:(_lst)◂((_p1439)◂(_stg)) %_5653~°0◂{ 2' 3' }:(_lst)◂((_p1440)◂(_stg)) }
; _some { °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; ∎ %_5654
 ; {>  %_5654~°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }:(_opn)◂({ (_lst)◂((_p1439)◂(_stg)) (_lst)◂((_p1440)◂(_stg)) }) }
; 	∎ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_7477
	btr r12,4
	jmp LB_7478
LB_7477:
	bts r12,4
LB_7478:
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
	jc LB_7485
	btr r12,6
	jmp LB_7486
LB_7485:
	bts r12,6
LB_7486:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_7483
	btr QWORD [rdi],0
	jmp LB_7484
LB_7483:
	bts QWORD [rdi],0
LB_7484:
	mov rcx,r14
	bt r12,1
	jc LB_7489
	btr r12,6
	jmp LB_7490
LB_7489:
	bts r12,6
LB_7490:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_7487
	btr QWORD [rdi],1
	jmp LB_7488
LB_7487:
	bts QWORD [rdi],1
LB_7488:
	mov rsi,1
	bt r12,5
	jc LB_7481
	mov rsi,0
	bt r11,0
	jc LB_7481
	jmp LB_7482
LB_7481:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7482:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7479
	btr QWORD [rdi],0
	jmp LB_7480
LB_7479:
	bts QWORD [rdi],0
LB_7480:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r8
	bt r12,2
	jc LB_7497
	btr r12,0
	jmp LB_7498
LB_7497:
	bts r12,0
LB_7498:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7495
	btr QWORD [rdi],0
	jmp LB_7496
LB_7495:
	bts QWORD [rdi],0
LB_7496:
	mov r13,r10
	bt r12,4
	jc LB_7501
	btr r12,0
	jmp LB_7502
LB_7501:
	bts r12,0
LB_7502:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7499
	btr QWORD [rdi],1
	jmp LB_7500
LB_7499:
	bts QWORD [rdi],1
LB_7500:
	mov rsi,1
	bt r12,5
	jc LB_7493
	mov rsi,0
	bt r11,0
	jc LB_7493
	jmp LB_7494
LB_7493:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7494:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7491
	btr QWORD [rdi],1
	jmp LB_7492
LB_7491:
	bts QWORD [rdi],1
LB_7492:
	mov r8,0
	bts r12,2
	ret
LB_7503:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7505
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7504
LB_7505:
	add rsp,8
	ret
LB_7506:
	add rsp,80
	pop r14
LB_7504:
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
	sub rsp,48
; var_idx
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
	call NS_E_5464_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7593
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7575
LB_7593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_7596
LB_7595:
	add r14,1
LB_7596:
	cmp r14,r10
	jge LB_7597
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7595
	cmp al,10
	jz LB_7595
	cmp al,32
	jz LB_7595
LB_7597:
	add r14,1
	cmp r14,r10
	jg LB_7601
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_7601
	jmp LB_7602
LB_7601:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7599
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7599:
	jmp LB_7575
LB_7602:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_7584
LB_7583:
	add r14,1
LB_7584:
	cmp r14,r10
	jge LB_7585
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7583
	cmp al,10
	jz LB_7583
	cmp al,32
	jz LB_7583
LB_7585:
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7586
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7587
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7587:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7588:
	jmp LB_7576
LB_7586:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7581
	btr r12,2
	clc
	jmp LB_7582
LB_7581:
	bts r12,2
	stc
LB_7582:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7579
	btr r12,1
	clc
	jmp LB_7580
LB_7579:
	bts r12,1
	stc
LB_7580:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7577
	btr r12,0
	clc
	jmp LB_7578
LB_7577:
	bts r12,0
	stc
LB_7578:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7572
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_7603
	btr r12,3
	jmp LB_7604
LB_7603:
	bts r12,3
LB_7604:
	mov r14,r8
	bt r12,2
	jc LB_7605
	btr r12,1
	jmp LB_7606
LB_7605:
	bts r12,1
LB_7606:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1473 { %_5655 %_5656 } ⊢ %_5657 : %_5657
 ; {>  %_5655~0':_r64 %_5656~1':_stg }
; _f1473 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_5657 ⊢ %_5658 : %_5658
 ; {>  %_5657~°3◂{ 0' 1' }:_p1451 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_5658
 ; {>  %_5658~°0◂°3◂{ 0' 1' }:(_opn)◂(_p1451) }
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
	jc LB_7566
	btr r12,2
	jmp LB_7567
LB_7566:
	bts r12,2
LB_7567:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7564
	btr QWORD [rdi],0
	jmp LB_7565
LB_7564:
	bts QWORD [rdi],0
LB_7565:
	mov r8,r14
	bt r12,1
	jc LB_7570
	btr r12,2
	jmp LB_7571
LB_7570:
	bts r12,2
LB_7571:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7568
	btr QWORD [rdi],1
	jmp LB_7569
LB_7568:
	bts QWORD [rdi],1
LB_7569:
	mov rsi,1
	bt r12,3
	jc LB_7562
	mov rsi,0
	bt r9,0
	jc LB_7562
	jmp LB_7563
LB_7562:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7563:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7572:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7574
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7573
LB_7574:
	add rsp,8
	ret
LB_7576:
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
LB_7575:
	add rsp,48
	pop r14
LB_7573:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_7618
LB_7617:
	add r14,1
LB_7618:
	cmp r14,r10
	jge LB_7619
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7617
	cmp al,10
	jz LB_7617
	cmp al,32
	jz LB_7617
LB_7619:
	push r10
	call NS_E_5466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7620
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7614
LB_7620:
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
	jc LB_7615
	btr r12,0
	clc
	jmp LB_7616
LB_7615:
	bts r12,0
	stc
LB_7616:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7611
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1470 %_5659 ⊢ %_5660 : %_5660
 ; {>  %_5659~0':_stg }
; _f1470 0' ⊢ °0◂0'
; _some %_5660 ⊢ %_5661 : %_5661
 ; {>  %_5660~°0◂0':_p1451 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5661
 ; {>  %_5661~°0◂°0◂0':(_opn)◂(_p1451) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7609
	btr r12,3
	jmp LB_7610
LB_7609:
	bts r12,3
LB_7610:
	mov rsi,1
	bt r12,3
	jc LB_7607
	mov rsi,0
	bt r9,0
	jc LB_7607
	jmp LB_7608
LB_7607:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7608:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7611:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7613
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7612
LB_7613:
	add rsp,8
	ret
LB_7614:
	add rsp,16
	pop r14
LB_7612:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_7633
LB_7632:
	add r14,1
LB_7633:
	cmp r14,r10
	jge LB_7634
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7632
	cmp al,10
	jz LB_7632
	cmp al,32
	jz LB_7632
LB_7634:
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7635
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7629
LB_7635:
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
	jc LB_7630
	btr r12,0
	clc
	jmp LB_7631
LB_7630:
	bts r12,0
	stc
LB_7631:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7626
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1470 %_5662 ⊢ %_5663 : %_5663
 ; {>  %_5662~0':_stg }
; _f1470 0' ⊢ °0◂0'
; _some %_5663 ⊢ %_5664 : %_5664
 ; {>  %_5663~°0◂0':_p1451 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5664
 ; {>  %_5664~°0◂°0◂0':(_opn)◂(_p1451) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7624
	btr r12,3
	jmp LB_7625
LB_7624:
	bts r12,3
LB_7625:
	mov rsi,1
	bt r12,3
	jc LB_7622
	mov rsi,0
	bt r9,0
	jc LB_7622
	jmp LB_7623
LB_7622:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7623:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7626:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7628
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7627
LB_7628:
	add rsp,8
	ret
LB_7629:
	add rsp,16
	pop r14
LB_7627:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_7648
LB_7647:
	add r14,1
LB_7648:
	cmp r14,r10
	jge LB_7649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7647
	cmp al,10
	jz LB_7647
	cmp al,32
	jz LB_7647
LB_7649:
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7650
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7644
LB_7650:
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
	jc LB_7645
	btr r12,0
	clc
	jmp LB_7646
LB_7645:
	bts r12,0
	stc
LB_7646:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7641
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1471 %_5665 ⊢ %_5666 : %_5666
 ; {>  %_5665~0':_p1387 }
; _f1471 0' ⊢ °1◂0'
; _some %_5666 ⊢ %_5667 : %_5667
 ; {>  %_5666~°1◂0':_p1451 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5667
 ; {>  %_5667~°0◂°1◂0':(_opn)◂(_p1451) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7639
	btr r12,3
	jmp LB_7640
LB_7639:
	bts r12,3
LB_7640:
	mov rsi,1
	bt r12,3
	jc LB_7637
	mov rsi,0
	bt r9,0
	jc LB_7637
	jmp LB_7638
LB_7637:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7638:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7641:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7643
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7642
LB_7643:
	add rsp,8
	ret
LB_7644:
	add rsp,16
	pop r14
LB_7642:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_7669
LB_7668:
	add r14,1
LB_7669:
	cmp r14,r10
	jge LB_7670
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7668
	cmp al,10
	jz LB_7668
	cmp al,32
	jz LB_7668
LB_7670:
	push r10
	call NS_E_5465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7671
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7665
LB_7671:
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
	jc LB_7666
	btr r12,0
	clc
	jmp LB_7667
LB_7666:
	bts r12,0
	stc
LB_7667:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7662
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r11,r14
	bt r12,1
	jc LB_7673
	btr r12,5
	jmp LB_7674
LB_7673:
	bts r12,5
LB_7674:
	mov r10,r13
	bt r12,0
	jc LB_7675
	btr r12,4
	jmp LB_7676
LB_7675:
	bts r12,4
LB_7676:
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_7679
	btr r12,6
	clc
	jmp LB_7680
LB_7679:
	bts r12,6
	stc
LB_7680:
	mov r13,rcx
	bt r12,6
	jc LB_7677
	btr r12,0
	jmp LB_7678
LB_7677:
	bts r12,0
LB_7678:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_7683
	btr r12,6
	clc
	jmp LB_7684
LB_7683:
	bts r12,6
	stc
LB_7684:
	mov r14,rcx
	bt r12,6
	jc LB_7681
	btr r12,1
	jmp LB_7682
LB_7681:
	bts r12,1
LB_7682:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1472 %_5668 ⊢ %_5669 : %_5669
 ; {>  %_5668~{ 0' 1' }:{ _p1452 _r64 } }
; _f1472 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_5669 ⊢ %_5670 : %_5670
 ; {>  %_5669~°2◂{ 0' 1' }:_p1451 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_5670
 ; {>  %_5670~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1451) }
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
	jc LB_7656
	btr r12,2
	jmp LB_7657
LB_7656:
	bts r12,2
LB_7657:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7654
	btr QWORD [rdi],0
	jmp LB_7655
LB_7654:
	bts QWORD [rdi],0
LB_7655:
	mov r8,r14
	bt r12,1
	jc LB_7660
	btr r12,2
	jmp LB_7661
LB_7660:
	bts r12,2
LB_7661:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7658
	btr QWORD [rdi],1
	jmp LB_7659
LB_7658:
	bts QWORD [rdi],1
LB_7659:
	mov rsi,1
	bt r12,3
	jc LB_7652
	mov rsi,0
	bt r9,0
	jc LB_7652
	jmp LB_7653
LB_7652:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7653:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7662:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7664
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7663
LB_7664:
	add rsp,8
	ret
LB_7665:
	add rsp,16
	pop r14
LB_7663:
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
	sub rsp,32
; _scf_d
	push r10
	call NS_E_562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7698
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7690
LB_7698:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7706
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7706
	jmp LB_7707
LB_7706:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7704
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7704:
	jmp LB_7690
LB_7707:
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
	jc LB_7693
	btr r12,1
	clc
	jmp LB_7694
LB_7693:
	bts r12,1
	stc
LB_7694:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7691
	btr r12,0
	clc
	jmp LB_7692
LB_7691:
	bts r12,0
	stc
LB_7692:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7687
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5671 ⊢ %_5672 : %_5672
 ; {>  %_5671~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5672
 ; {>  %_5672~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7685
	btr r12,3
	jmp LB_7686
LB_7685:
	bts r12,3
LB_7686:
	mov r8,0
	bts r12,2
	ret
LB_7687:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7689
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7688
LB_7689:
	add rsp,8
	ret
LB_7690:
	add rsp,32
	pop r14
LB_7688:
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
; _scf_d
	push r10
	call NS_E_562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7727
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7719
LB_7727:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_7735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_7735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7735
	jmp LB_7736
LB_7735:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7733
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7733:
	jmp LB_7719
LB_7736:
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
	jc LB_7722
	btr r12,1
	clc
	jmp LB_7723
LB_7722:
	bts r12,1
	stc
LB_7723:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7720
	btr r12,0
	clc
	jmp LB_7721
LB_7720:
	bts r12,0
	stc
LB_7721:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7716
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1475 {  } ⊢ %_5674 : %_5674
 ; {>  %_5673~0':_r64 }
; _f1475 {  } ⊢ °1◂{  }
; _some { %_5674 %_5673 } ⊢ %_5675 : %_5675
 ; {>  %_5674~°1◂{  }:_p1452 %_5673~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_5675
 ; {>  %_5675~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p1452 _r64 }) }
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
	jc LB_7710
	mov rsi,0
	bt r14,0
	jc LB_7710
	jmp LB_7711
LB_7710:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7711:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7708
	btr QWORD [rdi],0
	jmp LB_7709
LB_7708:
	bts QWORD [rdi],0
LB_7709:
	mov r14,r13
	bt r12,0
	jc LB_7714
	btr r12,1
	jmp LB_7715
LB_7714:
	bts r12,1
LB_7715:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7712
	btr QWORD [rdi],1
	jmp LB_7713
LB_7712:
	bts QWORD [rdi],1
LB_7713:
	mov r8,0
	bts r12,2
	ret
LB_7716:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7718
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7717
LB_7718:
	add rsp,8
	ret
LB_7719:
	add rsp,32
	pop r14
LB_7717:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7756
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7748
LB_7756:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_7764
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_7764
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7764
	jmp LB_7765
LB_7764:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7762
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7762:
	jmp LB_7748
LB_7765:
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
	jc LB_7751
	btr r12,1
	clc
	jmp LB_7752
LB_7751:
	bts r12,1
	stc
LB_7752:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7749
	btr r12,0
	clc
	jmp LB_7750
LB_7749:
	bts r12,0
	stc
LB_7750:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7745
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1476 {  } ⊢ %_5677 : %_5677
 ; {>  %_5676~0':_r64 }
; _f1476 {  } ⊢ °2◂{  }
; _some { %_5677 %_5676 } ⊢ %_5678 : %_5678
 ; {>  %_5677~°2◂{  }:_p1452 %_5676~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_5678
 ; {>  %_5678~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p1452 _r64 }) }
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
	jc LB_7739
	mov rsi,0
	bt r14,0
	jc LB_7739
	jmp LB_7740
LB_7739:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7740:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7737
	btr QWORD [rdi],0
	jmp LB_7738
LB_7737:
	bts QWORD [rdi],0
LB_7738:
	mov r14,r13
	bt r12,0
	jc LB_7743
	btr r12,1
	jmp LB_7744
LB_7743:
	bts r12,1
LB_7744:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7741
	btr QWORD [rdi],1
	jmp LB_7742
LB_7741:
	bts QWORD [rdi],1
LB_7742:
	mov r8,0
	bts r12,2
	ret
LB_7745:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7747
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7746
LB_7747:
	add rsp,8
	ret
LB_7748:
	add rsp,32
	pop r14
LB_7746:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7785
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7777
LB_7785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7793
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7793
	jmp LB_7794
LB_7793:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7791
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7791:
	jmp LB_7777
LB_7794:
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
	jc LB_7780
	btr r12,1
	clc
	jmp LB_7781
LB_7780:
	bts r12,1
	stc
LB_7781:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7778
	btr r12,0
	clc
	jmp LB_7779
LB_7778:
	bts r12,0
	stc
LB_7779:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7774
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1474 {  } ⊢ %_5680 : %_5680
 ; {>  %_5679~0':_r64 }
; _f1474 {  } ⊢ °0◂{  }
; _some { %_5680 %_5679 } ⊢ %_5681 : %_5681
 ; {>  %_5680~°0◂{  }:_p1452 %_5679~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_5681
 ; {>  %_5681~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p1452 _r64 }) }
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
	jc LB_7768
	mov rsi,0
	bt r14,0
	jc LB_7768
	jmp LB_7769
LB_7768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7769:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7766
	btr QWORD [rdi],0
	jmp LB_7767
LB_7766:
	bts QWORD [rdi],0
LB_7767:
	mov r14,r13
	bt r12,0
	jc LB_7772
	btr r12,1
	jmp LB_7773
LB_7772:
	bts r12,1
LB_7773:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7770
	btr QWORD [rdi],1
	jmp LB_7771
LB_7770:
	bts QWORD [rdi],1
LB_7771:
	mov r8,0
	bts r12,2
	ret
LB_7774:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7776
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7775
LB_7776:
	add rsp,8
	ret
LB_7777:
	add rsp,32
	pop r14
LB_7775:
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
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_7810
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_7810
	jmp LB_7811
LB_7810:
	jmp LB_7800
LB_7811:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_5467_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7815
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7816:
	jmp LB_7800
LB_7815:
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
	jc LB_7803
	btr r12,1
	clc
	jmp LB_7804
LB_7803:
	bts r12,1
	stc
LB_7804:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7801
	btr r12,0
	clc
	jmp LB_7802
LB_7801:
	bts r12,0
	stc
LB_7802:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7797
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_7818
	btr r12,5
	jmp LB_7819
LB_7818:
	bts r12,5
LB_7819:
	mov r13,r14
	bt r12,1
	jc LB_7820
	btr r12,0
	jmp LB_7821
LB_7820:
	bts r12,0
LB_7821:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f682 %_5682 ⊢ %_5683 : %_5683
 ; {>  %_5682~0':(_lst)◂(_r64) }
; _f682 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_682
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_5683 ⊢ %_5684 : %_5684
 ; {>  %_5683~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5684
 ; {>  %_5684~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7795
	btr r12,3
	jmp LB_7796
LB_7795:
	bts r12,3
LB_7796:
	mov r8,0
	bts r12,2
	ret
LB_7797:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7799
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7798
LB_7799:
	add rsp,8
	ret
LB_7800:
	add rsp,32
	pop r14
LB_7798:
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
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_7843
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_7843
	jmp LB_7844
LB_7843:
	jmp LB_7835
LB_7844:
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
	jc LB_7836
	btr r12,0
	clc
	jmp LB_7837
LB_7836:
	bts r12,0
	stc
LB_7837:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7832
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xra |~ {  } ⊢ %_5685 : %_5685
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_5685
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_5686 : %_5686
 ; {>  %_5685~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_5685 %_5686 } ⊢ %_5687 : %_5687
 ; {>  %_5686~°1◂{  }:(_lst)◂(t2586'(0)) %_5685~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_5687 ⊢ %_5688 : %_5688
 ; {>  %_5687~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_5688
 ; {>  %_5688~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_7826
	btr r12,1
	jmp LB_7827
LB_7826:
	bts r12,1
LB_7827:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7824
	btr QWORD [rdi],0
	jmp LB_7825
LB_7824:
	bts QWORD [rdi],0
LB_7825:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7830
	mov rsi,0
	bt r14,0
	jc LB_7830
	jmp LB_7831
LB_7830:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7831:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7828
	btr QWORD [rdi],1
	jmp LB_7829
LB_7828:
	bts QWORD [rdi],1
LB_7829:
	mov rsi,1
	bt r12,3
	jc LB_7822
	mov rsi,0
	bt r9,0
	jc LB_7822
	jmp LB_7823
LB_7822:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7823:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7832:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7834
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7833
LB_7834:
	add rsp,8
	ret
LB_7835:
	add rsp,16
	pop r14
LB_7833:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7866
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7858
LB_7866:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_5467_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7871
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7872
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7872:
	jmp LB_7858
LB_7871:
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
	jc LB_7861
	btr r12,1
	clc
	jmp LB_7862
LB_7861:
	bts r12,1
	stc
LB_7862:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7859
	btr r12,0
	clc
	jmp LB_7860
LB_7859:
	bts r12,0
	stc
LB_7860:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7855
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5689 %_5690 } ⊢ %_5691 : %_5691
 ; {>  %_5689~0':_r64 %_5690~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5691 ⊢ %_5692 : %_5692
 ; {>  %_5691~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5692
 ; {>  %_5692~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_7849
	btr r12,2
	jmp LB_7850
LB_7849:
	bts r12,2
LB_7850:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7847
	btr QWORD [rdi],0
	jmp LB_7848
LB_7847:
	bts QWORD [rdi],0
LB_7848:
	mov r8,r14
	bt r12,1
	jc LB_7853
	btr r12,2
	jmp LB_7854
LB_7853:
	bts r12,2
LB_7854:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7851
	btr QWORD [rdi],1
	jmp LB_7852
LB_7851:
	bts QWORD [rdi],1
LB_7852:
	mov rsi,1
	bt r12,3
	jc LB_7845
	mov rsi,0
	bt r9,0
	jc LB_7845
	jmp LB_7846
LB_7845:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7846:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7855:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7857
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7856
LB_7857:
	add rsp,8
	ret
LB_7858:
	add rsp,32
	pop r14
LB_7856:
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
	sub rsp,48
; "\226\136\144."
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
	add r14,4
	cmp r14,r10
	jg LB_7916
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_7916
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_7916
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_7916
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_7916
	jmp LB_7917
LB_7916:
	jmp LB_7890
LB_7917:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_7899
LB_7898:
	add r14,1
LB_7899:
	cmp r14,r10
	jge LB_7900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7898
	cmp al,10
	jz LB_7898
	cmp al,32
	jz LB_7898
LB_7900:
	push r10
	call NS_E_5469_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7901
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7902:
	jmp LB_7891
LB_7901:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7905
LB_7904:
	add r14,1
LB_7905:
	cmp r14,r10
	jge LB_7906
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7904
	cmp al,10
	jz LB_7904
	cmp al,32
	jz LB_7904
LB_7906:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7907
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7908
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7908:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7909
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7909:
	jmp LB_7891
LB_7907:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7896
	btr r12,2
	clc
	jmp LB_7897
LB_7896:
	bts r12,2
	stc
LB_7897:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7894
	btr r12,1
	clc
	jmp LB_7895
LB_7894:
	bts r12,1
	stc
LB_7895:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7892
	btr r12,0
	clc
	jmp LB_7893
LB_7892:
	bts r12,0
	stc
LB_7893:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7887
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_7918
	btr r12,3
	jmp LB_7919
LB_7918:
	bts r12,3
LB_7919:
	mov r14,r8
	bt r12,2
	jc LB_7920
	btr r12,1
	jmp LB_7921
LB_7920:
	bts r12,1
LB_7921:
	mov r8,r13
	bt r12,0
	jc LB_7922
	btr r12,2
	jmp LB_7923
LB_7922:
	bts r12,2
LB_7923:
	mov r13,r9
	bt r12,3
	jc LB_7924
	btr r12,0
	jmp LB_7925
LB_7924:
	bts r12,0
LB_7925:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5695 : %_5695
 ; {>  %_5693~0':(_lst)◂((_p1449)◂(_stg)) %_5694~1':(_p1445)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _f1465 %_5694 ⊢ %_5696 : %_5696
 ; {>  %_5693~0':(_lst)◂((_p1449)◂(_stg)) %_5695~°1◂{  }:(_lst)◂(t2601'(0)) %_5694~1':(_p1445)◂(_stg) }
; _f1465 1' ⊢ °1◂1'
; _f1463 { %_5695 %_5696 } ⊢ %_5697 : %_5697
 ; {>  %_5693~0':(_lst)◂((_p1449)◂(_stg)) %_5695~°1◂{  }:(_lst)◂(t2601'(0)) %_5696~°1◂1':(_p1448)◂(_stg) }
; _f1463 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_5697 ⊢ %_5698 : %_5698
 ; {>  %_5697~°1◂{ °1◂{  } °1◂1' }:(_p1447)◂(_stg) %_5693~0':(_lst)◂((_p1449)◂(_stg)) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_5698
 ; {>  %_5698~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂((_p1447)◂(_stg)) %_5693~0':(_lst)◂((_p1449)◂(_stg)) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_7874
	mov rdi,r13
	call dlt
LB_7874:
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
	jc LB_7879
	mov rsi,0
	bt r13,0
	jc LB_7879
	jmp LB_7880
LB_7879:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7880:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7877
	btr QWORD [rdi],0
	jmp LB_7878
LB_7877:
	bts QWORD [rdi],0
LB_7878:
	mov r13,r14
	bt r12,1
	jc LB_7885
	btr r12,0
	jmp LB_7886
LB_7885:
	bts r12,0
LB_7886:
	mov rsi,1
	bt r12,0
	jc LB_7883
	mov rsi,0
	bt r13,0
	jc LB_7883
	jmp LB_7884
LB_7883:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7884:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7881
	btr QWORD [rdi],1
	jmp LB_7882
LB_7881:
	bts QWORD [rdi],1
LB_7882:
	mov rsi,1
	bt r12,3
	jc LB_7875
	mov rsi,0
	bt r9,0
	jc LB_7875
	jmp LB_7876
LB_7875:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7876:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7887:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7889
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7888
LB_7889:
	add rsp,8
	ret
LB_7891:
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
LB_7890:
	add rsp,48
	pop r14
LB_7888:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_7956
LB_7955:
	add r14,1
LB_7956:
	cmp r14,r10
	jge LB_7957
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7955
	cmp al,10
	jz LB_7955
	cmp al,32
	jz LB_7955
LB_7957:
	add r14,3
	cmp r14,r10
	jg LB_7960
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7960
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7960
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_7960
	jmp LB_7961
LB_7960:
	jmp LB_7946
LB_7961:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
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
	push r10
	call NS_E_5469_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7965
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7966
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7966:
	jmp LB_7946
LB_7965:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7969
LB_7968:
	add r14,1
LB_7969:
	cmp r14,r10
	jge LB_7970
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7968
	cmp al,10
	jz LB_7968
	cmp al,32
	jz LB_7968
LB_7970:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7971
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7972
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7972:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7973
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7973:
	jmp LB_7946
LB_7971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
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
	call NS_E_5468_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7978
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7979
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7979:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7980
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7980:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7981
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7981:
	jmp LB_7946
LB_7978:
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
	jc LB_7953
	btr r12,3
	clc
	jmp LB_7954
LB_7953:
	bts r12,3
	stc
LB_7954:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7951
	btr r12,2
	clc
	jmp LB_7952
LB_7951:
	bts r12,2
	stc
LB_7952:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7949
	btr r12,1
	clc
	jmp LB_7950
LB_7949:
	bts r12,1
	stc
LB_7950:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7947
	btr r12,0
	clc
	jmp LB_7948
LB_7947:
	bts r12,0
	stc
LB_7948:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7943
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov rdx,r8
	bt r12,2
	jc LB_7983
	btr r12,7
	jmp LB_7984
LB_7983:
	bts r12,7
LB_7984:
	mov r8,r9
	bt r12,3
	jc LB_7985
	btr r12,2
	jmp LB_7986
LB_7985:
	bts r12,2
LB_7986:
	mov r9,r14
	bt r12,1
	jc LB_7987
	btr r12,3
	jmp LB_7988
LB_7987:
	bts r12,3
LB_7988:
	mov r14,rdx
	bt r12,7
	jc LB_7989
	btr r12,1
	jmp LB_7990
LB_7989:
	bts r12,1
LB_7990:
	mov rdx,r13
	bt r12,0
	jc LB_7991
	btr r12,7
	jmp LB_7992
LB_7991:
	bts r12,7
LB_7992:
	mov r13,r9
	bt r12,3
	jc LB_7993
	btr r12,0
	jmp LB_7994
LB_7993:
	bts r12,0
LB_7994:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _nil {  } ⊢ %_5702 : %_5702
 ; {>  %_5701~2':(_p1447)◂(_stg) %_5700~1':(_p1445)◂(_stg) %_5699~0':(_lst)◂((_p1449)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _f1465 %_5700 ⊢ %_5703 : %_5703
 ; {>  %_5701~2':(_p1447)◂(_stg) %_5700~1':(_p1445)◂(_stg) %_5699~0':(_lst)◂((_p1449)◂(_stg)) %_5702~°1◂{  }:(_lst)◂(t2613'(0)) }
; _f1465 1' ⊢ °1◂1'
; _f1462 { %_5702 %_5703 %_5701 } ⊢ %_5704 : %_5704
 ; {>  %_5703~°1◂1':(_p1448)◂(_stg) %_5701~2':(_p1447)◂(_stg) %_5699~0':(_lst)◂((_p1449)◂(_stg)) %_5702~°1◂{  }:(_lst)◂(t2613'(0)) }
; _f1462 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_5704 ⊢ %_5705 : %_5705
 ; {>  %_5699~0':(_lst)◂((_p1449)◂(_stg)) %_5704~°0◂{ °1◂{  } °1◂1' 2' }:(_p1447)◂(_stg) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_5705
 ; {>  %_5699~0':(_lst)◂((_p1449)◂(_stg)) %_5705~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂((_p1447)◂(_stg)) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_7926
	mov rdi,r13
	call dlt
LB_7926:
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
	jc LB_7931
	mov rsi,0
	bt r13,0
	jc LB_7931
	jmp LB_7932
LB_7931:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7932:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7929
	btr QWORD [rdi],0
	jmp LB_7930
LB_7929:
	bts QWORD [rdi],0
LB_7930:
	mov r13,r14
	bt r12,1
	jc LB_7937
	btr r12,0
	jmp LB_7938
LB_7937:
	bts r12,0
LB_7938:
	mov rsi,1
	bt r12,0
	jc LB_7935
	mov rsi,0
	bt r13,0
	jc LB_7935
	jmp LB_7936
LB_7935:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7936:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7933
	btr QWORD [rdi],1
	jmp LB_7934
LB_7933:
	bts QWORD [rdi],1
LB_7934:
	mov r13,r8
	bt r12,2
	jc LB_7941
	btr r12,0
	jmp LB_7942
LB_7941:
	bts r12,0
LB_7942:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,0
	jc LB_7939
	btr QWORD [rdi],2
	jmp LB_7940
LB_7939:
	bts QWORD [rdi],2
LB_7940:
	mov rsi,1
	bt r12,3
	jc LB_7927
	mov rsi,0
	bt r9,0
	jc LB_7927
	jmp LB_7928
LB_7927:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7928:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7943:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7945
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7944
LB_7945:
	add rsp,8
	ret
LB_7946:
	add rsp,64
	pop r14
LB_7944:
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
	sub rsp,32
; mtc_test
	jmp LB_8014
LB_8013:
	add r14,1
LB_8014:
	cmp r14,r10
	jge LB_8015
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8013
	cmp al,10
	jz LB_8013
	cmp al,32
	jz LB_8013
LB_8015:
	push r10
	call NS_E_5470_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8016
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8008
LB_8016:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_8019
LB_8018:
	add r14,1
LB_8019:
	cmp r14,r10
	jge LB_8020
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8018
	cmp al,10
	jz LB_8018
	cmp al,32
	jz LB_8018
LB_8020:
	push r10
	call NS_E_5471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8021
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8022
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8022:
	jmp LB_8008
LB_8021:
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
	jc LB_8011
	btr r12,1
	clc
	jmp LB_8012
LB_8011:
	bts r12,1
	stc
LB_8012:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8009
	btr r12,0
	clc
	jmp LB_8010
LB_8009:
	bts r12,0
	stc
LB_8010:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8005
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5706 %_5707 } ⊢ %_5708 : %_5708
 ; {>  %_5706~0':(_p1449)◂(_stg) %_5707~1':(_lst)◂((_p1449)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5708 ⊢ %_5709 : %_5709
 ; {>  %_5708~°0◂{ 0' 1' }:(_lst)◂((_p1449)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5709
 ; {>  %_5709~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1449)◂(_stg))) }
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
	jc LB_7999
	btr r12,2
	jmp LB_8000
LB_7999:
	bts r12,2
LB_8000:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7997
	btr QWORD [rdi],0
	jmp LB_7998
LB_7997:
	bts QWORD [rdi],0
LB_7998:
	mov r8,r14
	bt r12,1
	jc LB_8003
	btr r12,2
	jmp LB_8004
LB_8003:
	bts r12,2
LB_8004:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8001
	btr QWORD [rdi],1
	jmp LB_8002
LB_8001:
	bts QWORD [rdi],1
LB_8002:
	mov rsi,1
	bt r12,3
	jc LB_7995
	mov rsi,0
	bt r9,0
	jc LB_7995
	jmp LB_7996
LB_7995:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7996:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8005:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8007
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8006
LB_8007:
	add rsp,8
	ret
LB_8008:
	add rsp,32
	pop r14
LB_8006:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_8035
LB_8034:
	add r14,1
LB_8035:
	cmp r14,r10
	jge LB_8036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8034
	cmp al,32
	jz LB_8034
LB_8036:
	add r14,1
	cmp r14,r10
	jg LB_8039
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8039
	jmp LB_8040
LB_8039:
	jmp LB_8029
LB_8040:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
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
	jg LB_8047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_8047
	jmp LB_8048
LB_8047:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8045:
	jmp LB_8029
LB_8048:
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
	jc LB_8032
	btr r12,1
	clc
	jmp LB_8033
LB_8032:
	bts r12,1
	stc
LB_8033:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8030
	btr r12,0
	clc
	jmp LB_8031
LB_8030:
	bts r12,0
	stc
LB_8031:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8026
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
; _nil {  } ⊢ %_5710 : %_5710
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5710 ⊢ %_5711 : %_5711
 ; {>  %_5710~°1◂{  }:(_lst)◂(t2628'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5711
 ; {>  %_5711~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2631'(0))) }
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
	jc LB_8024
	mov rsi,0
	bt r9,0
	jc LB_8024
	jmp LB_8025
LB_8024:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8025:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8026:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8028
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8027
LB_8028:
	add rsp,8
	ret
LB_8029:
	add rsp,32
	pop r14
LB_8027:
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
	sub rsp,80
; src_ptn
	jmp LB_8105
LB_8104:
	add r14,1
LB_8105:
	cmp r14,r10
	jge LB_8106
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8104
	cmp al,10
	jz LB_8104
	cmp al,32
	jz LB_8104
LB_8106:
	push r10
	call NS_E_4572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8107
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8066
LB_8107:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_8110
LB_8109:
	add r14,1
LB_8110:
	cmp r14,r10
	jge LB_8111
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8109
	cmp al,10
	jz LB_8109
	cmp al,32
	jz LB_8109
LB_8111:
	add r14,3
	cmp r14,r10
	jg LB_8115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8115
	jmp LB_8116
LB_8115:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8113
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8113:
	jmp LB_8066
LB_8116:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_8079
LB_8078:
	add r14,1
LB_8079:
	cmp r14,r10
	jge LB_8080
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8078
	cmp al,10
	jz LB_8078
	cmp al,32
	jz LB_8078
LB_8080:
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8081
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8082
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8082:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8083
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8083:
	jmp LB_8067
LB_8081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
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
	add r14,3
	cmp r14,r10
	jg LB_8093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_8093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_8093
	jmp LB_8094
LB_8093:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8089
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8089:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8090
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8090:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8091
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8091:
	jmp LB_8067
LB_8094:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_8096
LB_8095:
	add r14,1
LB_8096:
	cmp r14,r10
	jge LB_8097
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8095
	cmp al,10
	jz LB_8095
	cmp al,32
	jz LB_8095
LB_8097:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8098
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8099
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8099:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8100
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8100:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8101
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8101:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8102
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8102:
	jmp LB_8067
LB_8098:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8076
	btr r12,4
	clc
	jmp LB_8077
LB_8076:
	bts r12,4
	stc
LB_8077:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8074
	btr r12,3
	clc
	jmp LB_8075
LB_8074:
	bts r12,3
	stc
LB_8075:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8072
	btr r12,2
	clc
	jmp LB_8073
LB_8072:
	bts r12,2
	stc
LB_8073:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8070
	btr r12,1
	clc
	jmp LB_8071
LB_8070:
	bts r12,1
	stc
LB_8071:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8068
	btr r12,0
	clc
	jmp LB_8069
LB_8068:
	bts r12,0
	stc
LB_8069:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8063
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_8117
	btr r12,5
	jmp LB_8118
LB_8117:
	bts r12,5
LB_8118:
	mov r8,r10
	bt r12,4
	jc LB_8119
	btr r12,2
	jmp LB_8120
LB_8119:
	bts r12,2
LB_8120:
	mov r10,r14
	bt r12,1
	jc LB_8121
	btr r12,4
	jmp LB_8122
LB_8121:
	bts r12,4
LB_8122:
	mov r14,r11
	bt r12,5
	jc LB_8123
	btr r12,1
	jmp LB_8124
LB_8123:
	bts r12,1
LB_8124:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1466 { %_5712 %_5713 %_5714 } ⊢ %_5715 : %_5715
 ; {>  %_5714~2':(_p1432)◂((_p1440)◂(_stg)) %_5713~1':_p1387 %_5712~0':(_p1432)◂((_p1439)◂(_stg)) }
; _f1466 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_5715 ⊢ %_5716 : %_5716
 ; {>  %_5715~°0◂{ 0' 1' 2' }:(_p1449)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_5716
 ; {>  %_5716~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p1449)◂(_stg)) }
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
	jc LB_8053
	btr r12,4
	jmp LB_8054
LB_8053:
	bts r12,4
LB_8054:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8051
	btr QWORD [rdi],0
	jmp LB_8052
LB_8051:
	bts QWORD [rdi],0
LB_8052:
	mov r10,r14
	bt r12,1
	jc LB_8057
	btr r12,4
	jmp LB_8058
LB_8057:
	bts r12,4
LB_8058:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8055
	btr QWORD [rdi],1
	jmp LB_8056
LB_8055:
	bts QWORD [rdi],1
LB_8056:
	mov r10,r8
	bt r12,2
	jc LB_8061
	btr r12,4
	jmp LB_8062
LB_8061:
	bts r12,4
LB_8062:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_8059
	btr QWORD [rdi],2
	jmp LB_8060
LB_8059:
	bts QWORD [rdi],2
LB_8060:
	mov rsi,1
	bt r12,3
	jc LB_8049
	mov rsi,0
	bt r9,0
	jc LB_8049
	jmp LB_8050
LB_8049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8050:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8063:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8065
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8064
LB_8065:
	add rsp,8
	ret
LB_8067:
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
LB_8066:
	add rsp,80
	pop r14
LB_8064:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_8146
LB_8145:
	add r14,1
LB_8146:
	cmp r14,r10
	jge LB_8147
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8145
	cmp al,32
	jz LB_8145
LB_8147:
	push r10
	call NS_E_5472_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8148
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8138
LB_8148:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_8151
LB_8150:
	add r14,1
LB_8151:
	cmp r14,r10
	jge LB_8152
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8150
	cmp al,32
	jz LB_8150
LB_8152:
	add r14,1
	cmp r14,r10
	jg LB_8156
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_8156
	jmp LB_8157
LB_8156:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8154
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8154:
	jmp LB_8138
LB_8157:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_8159
LB_8158:
	add r14,1
LB_8159:
	cmp r14,r10
	jge LB_8160
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8158
	cmp al,32
	jz LB_8158
LB_8160:
	push r10
	call NS_E_5472_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8161
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8162
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8162:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8163:
	jmp LB_8138
LB_8161:
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
	jc LB_8143
	btr r12,2
	clc
	jmp LB_8144
LB_8143:
	bts r12,2
	stc
LB_8144:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8141
	btr r12,1
	clc
	jmp LB_8142
LB_8141:
	bts r12,1
	stc
LB_8142:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8139
	btr r12,0
	clc
	jmp LB_8140
LB_8139:
	bts r12,0
	stc
LB_8140:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8135
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov rcx,r14
	bt r12,1
	jc LB_8165
	btr r12,6
	jmp LB_8166
LB_8165:
	bts r12,6
LB_8166:
	mov r14,r8
	bt r12,2
	jc LB_8167
	btr r12,1
	jmp LB_8168
LB_8167:
	bts r12,1
LB_8168:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1467 { %_5717 %_5718 } ⊢ %_5719 : %_5719
 ; {>  %_5717~0':(_p1450)◂(_stg) %_5718~1':(_p1450)◂(_stg) }
; _f1467 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5719 ⊢ %_5720 : %_5720
 ; {>  %_5719~°1◂{ 0' 1' }:(_p1449)◂(_stg) }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5720
 ; {>  %_5720~°0◂°1◂{ 0' 1' }:(_opn)◂((_p1449)◂(_stg)) }
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
	jc LB_8129
	btr r12,2
	jmp LB_8130
LB_8129:
	bts r12,2
LB_8130:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8127
	btr QWORD [rdi],0
	jmp LB_8128
LB_8127:
	bts QWORD [rdi],0
LB_8128:
	mov r8,r14
	bt r12,1
	jc LB_8133
	btr r12,2
	jmp LB_8134
LB_8133:
	bts r12,2
LB_8134:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8131
	btr QWORD [rdi],1
	jmp LB_8132
LB_8131:
	bts QWORD [rdi],1
LB_8132:
	mov rsi,1
	bt r12,3
	jc LB_8125
	mov rsi,0
	bt r9,0
	jc LB_8125
	jmp LB_8126
LB_8125:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8126:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8135:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8137
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8136
LB_8137:
	add rsp,8
	ret
LB_8138:
	add rsp,48
	pop r14
LB_8136:
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
	sub rsp,48
; ";"
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
	add r14,1
	cmp r14,r10
	jg LB_8208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_8208
	jmp LB_8209
LB_8208:
	jmp LB_8182
LB_8209:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_8191
LB_8190:
	add r14,1
LB_8191:
	cmp r14,r10
	jge LB_8192
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8190
	cmp al,10
	jz LB_8190
	cmp al,32
	jz LB_8190
LB_8192:
	push r10
	call NS_E_5470_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8193
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8194
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8194:
	jmp LB_8183
LB_8193:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_8197
LB_8196:
	add r14,1
LB_8197:
	cmp r14,r10
	jge LB_8198
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8196
	cmp al,10
	jz LB_8196
	cmp al,32
	jz LB_8196
LB_8198:
	push r10
	call NS_E_5471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8199
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8200
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8200:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8201:
	jmp LB_8183
LB_8199:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8188
	btr r12,2
	clc
	jmp LB_8189
LB_8188:
	bts r12,2
	stc
LB_8189:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8186
	btr r12,1
	clc
	jmp LB_8187
LB_8186:
	bts r12,1
	stc
LB_8187:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8184
	btr r12,0
	clc
	jmp LB_8185
LB_8184:
	bts r12,0
	stc
LB_8185:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8179
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8210
	btr r12,3
	jmp LB_8211
LB_8210:
	bts r12,3
LB_8211:
	mov r14,r8
	bt r12,2
	jc LB_8212
	btr r12,1
	jmp LB_8213
LB_8212:
	bts r12,1
LB_8213:
	mov r8,r13
	bt r12,0
	jc LB_8214
	btr r12,2
	jmp LB_8215
LB_8214:
	bts r12,2
LB_8215:
	mov r13,r9
	bt r12,3
	jc LB_8216
	btr r12,0
	jmp LB_8217
LB_8216:
	bts r12,0
LB_8217:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5721 %_5722 } ⊢ %_5723 : %_5723
 ; {>  %_5721~0':(_p1449)◂(_stg) %_5722~1':(_lst)◂((_p1449)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5723 ⊢ %_5724 : %_5724
 ; {>  %_5723~°0◂{ 0' 1' }:(_lst)◂((_p1449)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5724
 ; {>  %_5724~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1449)◂(_stg))) }
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
	jc LB_8173
	btr r12,2
	jmp LB_8174
LB_8173:
	bts r12,2
LB_8174:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8171
	btr QWORD [rdi],0
	jmp LB_8172
LB_8171:
	bts QWORD [rdi],0
LB_8172:
	mov r8,r14
	bt r12,1
	jc LB_8177
	btr r12,2
	jmp LB_8178
LB_8177:
	bts r12,2
LB_8178:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8175
	btr QWORD [rdi],1
	jmp LB_8176
LB_8175:
	bts QWORD [rdi],1
LB_8176:
	mov rsi,1
	bt r12,3
	jc LB_8169
	mov rsi,0
	bt r9,0
	jc LB_8169
	jmp LB_8170
LB_8169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8170:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8179:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8181
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8180
LB_8181:
	add rsp,8
	ret
LB_8183:
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
LB_8182:
	add rsp,48
	pop r14
LB_8180:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_8229
LB_8228:
	add r14,1
LB_8229:
	cmp r14,r10
	jge LB_8230
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8228
	cmp al,32
	jz LB_8228
LB_8230:
	add r14,1
	cmp r14,r10
	jg LB_8233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8233
	jmp LB_8234
LB_8233:
	jmp LB_8223
LB_8234:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
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
	jg LB_8241
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_8241
	jmp LB_8242
LB_8241:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8239
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8239:
	jmp LB_8223
LB_8242:
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
	jc LB_8226
	btr r12,1
	clc
	jmp LB_8227
LB_8226:
	bts r12,1
	stc
LB_8227:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8224
	btr r12,0
	clc
	jmp LB_8225
LB_8224:
	bts r12,0
	stc
LB_8225:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8220
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
; _nil {  } ⊢ %_5725 : %_5725
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5725 ⊢ %_5726 : %_5726
 ; {>  %_5725~°1◂{  }:(_lst)◂(t2662'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5726
 ; {>  %_5726~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2665'(0))) }
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
	jc LB_8218
	mov rsi,0
	bt r9,0
	jc LB_8218
	jmp LB_8219
LB_8218:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8219:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8220:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8222
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8221
LB_8222:
	add rsp,8
	ret
LB_8223:
	add rsp,32
	pop r14
LB_8221:
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
; word
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8258
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8250
LB_8258:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_8266
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_8266
	jmp LB_8267
LB_8266:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8264
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8264:
	jmp LB_8250
LB_8267:
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
	jc LB_8253
	btr r12,1
	clc
	jmp LB_8254
LB_8253:
	bts r12,1
	stc
LB_8254:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8251
	btr r12,0
	clc
	jmp LB_8252
LB_8251:
	bts r12,0
	stc
LB_8252:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8247
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1469 %_5727 ⊢ %_5728 : %_5728
 ; {>  %_5727~0':_stg }
; _f1469 0' ⊢ °1◂0'
; _some %_5728 ⊢ %_5729 : %_5729
 ; {>  %_5728~°1◂0':(_p1450)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5729
 ; {>  %_5729~°0◂°1◂0':(_opn)◂((_p1450)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8245
	btr r12,3
	jmp LB_8246
LB_8245:
	bts r12,3
LB_8246:
	mov rsi,1
	bt r12,3
	jc LB_8243
	mov rsi,0
	bt r9,0
	jc LB_8243
	jmp LB_8244
LB_8243:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8244:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8247:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8249
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8248
LB_8249:
	add rsp,8
	ret
LB_8250:
	add rsp,32
	pop r14
LB_8248:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_4443_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8281
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8275
LB_8281:
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
	jc LB_8276
	btr r12,0
	clc
	jmp LB_8277
LB_8276:
	bts r12,0
	stc
LB_8277:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8272
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1468 %_5730 ⊢ %_5731 : %_5731
 ; {>  %_5730~0':_p1435 }
; _f1468 0' ⊢ °0◂0'
; _some %_5731 ⊢ %_5732 : %_5732
 ; {>  %_5731~°0◂0':(_p1450)◂(t2675'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5732
 ; {>  %_5732~°0◂°0◂0':(_opn)◂((_p1450)◂(t2678'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8270
	btr r12,3
	jmp LB_8271
LB_8270:
	bts r12,3
LB_8271:
	mov rsi,1
	bt r12,3
	jc LB_8268
	mov rsi,0
	bt r9,0
	jc LB_8268
	jmp LB_8269
LB_8268:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8269:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8272:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8274
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8273
LB_8274:
	add rsp,8
	ret
LB_8275:
	add rsp,16
	pop r14
LB_8273:
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
	sub rsp,64
; "@"
	jmp LB_8304
LB_8303:
	add r14,1
LB_8304:
	cmp r14,r10
	jge LB_8305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8303
	cmp al,10
	jz LB_8303
	cmp al,32
	jz LB_8303
LB_8305:
	add r14,1
	cmp r14,r10
	jg LB_8308
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_8308
	jmp LB_8309
LB_8308:
	jmp LB_8294
LB_8309:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
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
	jg LB_8316
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8316
	jmp LB_8317
LB_8316:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8314
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8314:
	jmp LB_8294
LB_8317:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_8319
LB_8318:
	add r14,1
LB_8319:
	cmp r14,r10
	jge LB_8320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8318
	cmp al,10
	jz LB_8318
	cmp al,32
	jz LB_8318
LB_8320:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8321
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8322
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8322:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8323
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8323:
	jmp LB_8294
LB_8321:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
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
	call NS_E_5474_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8328
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8329
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8329:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8330
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8330:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8331
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8331:
	jmp LB_8294
LB_8328:
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
	jc LB_8301
	btr r12,3
	clc
	jmp LB_8302
LB_8301:
	bts r12,3
	stc
LB_8302:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8299
	btr r12,2
	clc
	jmp LB_8300
LB_8299:
	bts r12,2
	stc
LB_8300:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8297
	btr r12,1
	clc
	jmp LB_8298
LB_8297:
	bts r12,1
	stc
LB_8298:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8295
	btr r12,0
	clc
	jmp LB_8296
LB_8295:
	bts r12,0
	stc
LB_8296:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8291
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov rdx,r14
	bt r12,1
	jc LB_8333
	btr r12,7
	jmp LB_8334
LB_8333:
	bts r12,7
LB_8334:
	mov r14,r9
	bt r12,3
	jc LB_8335
	btr r12,1
	jmp LB_8336
LB_8335:
	bts r12,1
LB_8336:
	mov r9,r13
	bt r12,0
	jc LB_8337
	btr r12,3
	jmp LB_8338
LB_8337:
	bts r12,3
LB_8338:
	mov r13,r8
	bt r12,2
	jc LB_8339
	btr r12,0
	jmp LB_8340
LB_8339:
	bts r12,0
LB_8340:
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
; _some { %_5733 %_5734 } ⊢ %_5735 : %_5735
 ; {>  %_5734~1':_p1482 %_5733~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_5735
 ; {>  %_5735~°0◂{ 0' 1' }:(_opn)◂({ _stg _p1482 }) }
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
	jc LB_8285
	btr r12,2
	jmp LB_8286
LB_8285:
	bts r12,2
LB_8286:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8283
	btr QWORD [rdi],0
	jmp LB_8284
LB_8283:
	bts QWORD [rdi],0
LB_8284:
	mov r8,r14
	bt r12,1
	jc LB_8289
	btr r12,2
	jmp LB_8290
LB_8289:
	bts r12,2
LB_8290:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8287
	btr QWORD [rdi],1
	jmp LB_8288
LB_8287:
	bts QWORD [rdi],1
LB_8288:
	mov r8,0
	bts r12,2
	ret
LB_8291:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8293
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8292
LB_8293:
	add rsp,8
	ret
LB_8294:
	add rsp,64
	pop r14
LB_8292:
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
; grm_etr_act
	jmp LB_8352
LB_8351:
	add r14,1
LB_8352:
	cmp r14,r10
	jge LB_8353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8351
	cmp al,10
	jz LB_8351
	cmp al,32
	jz LB_8351
LB_8353:
	push r10
	call NS_E_5475_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8354
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8348
LB_8354:
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
	jc LB_8349
	btr r12,0
	clc
	jmp LB_8350
LB_8349:
	bts r12,0
	stc
LB_8350:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8345
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1505 %_5736 ⊢ %_5737 : %_5737
 ; {>  %_5736~0':_p1484 }
; _f1505 0' ⊢ °1◂0'
; _some %_5737 ⊢ %_5738 : %_5738
 ; {>  %_5737~°1◂0':_p1482 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5738
 ; {>  %_5738~°0◂°1◂0':(_opn)◂(_p1482) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8343
	btr r12,3
	jmp LB_8344
LB_8343:
	bts r12,3
LB_8344:
	mov rsi,1
	bt r12,3
	jc LB_8341
	mov rsi,0
	bt r9,0
	jc LB_8341
	jmp LB_8342
LB_8341:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8342:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8345:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8347
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8346
LB_8347:
	add rsp,8
	ret
LB_8348:
	add rsp,16
	pop r14
LB_8346:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_8367
LB_8366:
	add r14,1
LB_8367:
	cmp r14,r10
	jge LB_8368
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8366
	cmp al,10
	jz LB_8366
	cmp al,32
	jz LB_8366
LB_8368:
	push r10
	call NS_E_5483_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8369
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8363
LB_8369:
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
	jc LB_8364
	btr r12,0
	clc
	jmp LB_8365
LB_8364:
	bts r12,0
	stc
LB_8365:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8360
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1504 %_5739 ⊢ %_5740 : %_5740
 ; {>  %_5739~0':_p1483 }
; _f1504 0' ⊢ °0◂0'
; _some %_5740 ⊢ %_5741 : %_5741
 ; {>  %_5740~°0◂0':_p1482 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5741
 ; {>  %_5741~°0◂°0◂0':(_opn)◂(_p1482) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8358
	btr r12,3
	jmp LB_8359
LB_8358:
	bts r12,3
LB_8359:
	mov rsi,1
	bt r12,3
	jc LB_8356
	mov rsi,0
	bt r9,0
	jc LB_8356
	jmp LB_8357
LB_8356:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8357:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8360:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8362
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8361
LB_8362:
	add rsp,8
	ret
LB_8363:
	add rsp,16
	pop r14
LB_8361:
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
; grm_ord_end
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
	call NS_E_5482_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8422
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8398
LB_8422:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8407
LB_8406:
	add r14,1
LB_8407:
	cmp r14,r10
	jge LB_8408
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8406
	cmp al,10
	jz LB_8406
	cmp al,32
	jz LB_8406
LB_8408:
	push r10
	call NS_E_5477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8409
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8410
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8410:
	jmp LB_8399
LB_8409:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_8413
LB_8412:
	add r14,1
LB_8413:
	cmp r14,r10
	jge LB_8414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8412
	cmp al,10
	jz LB_8412
	cmp al,32
	jz LB_8412
LB_8414:
	push r10
	call NS_E_5476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8415
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8416
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8416:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8417
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8417:
	jmp LB_8399
LB_8415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8404
	btr r12,2
	clc
	jmp LB_8405
LB_8404:
	bts r12,2
	stc
LB_8405:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8402
	btr r12,1
	clc
	jmp LB_8403
LB_8402:
	bts r12,1
	stc
LB_8403:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8400
	btr r12,0
	clc
	jmp LB_8401
LB_8400:
	bts r12,0
	stc
LB_8401:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8395
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_8424
	btr r12,5
	jmp LB_8425
LB_8424:
	bts r12,5
LB_8425:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_8428
	btr r12,6
	clc
	jmp LB_8429
LB_8428:
	bts r12,6
	stc
LB_8429:
	mov r8,rcx
	bt r12,6
	jc LB_8426
	btr r12,2
	jmp LB_8427
LB_8426:
	bts r12,2
LB_8427:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_8432
	btr r12,6
	clc
	jmp LB_8433
LB_8432:
	bts r12,6
	stc
LB_8433:
	mov r9,rcx
	bt r12,6
	jc LB_8430
	btr r12,3
	jmp LB_8431
LB_8430:
	bts r12,3
LB_8431:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_8436
	btr r12,6
	clc
	jmp LB_8437
LB_8436:
	bts r12,6
	stc
LB_8437:
	mov r10,rcx
	bt r12,6
	jc LB_8434
	btr r12,4
	jmp LB_8435
LB_8434:
	bts r12,4
LB_8435:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f1509 { %_5744 %_5745 %_5742 %_5743 %_5746 } ⊢ %_5747 : %_5747
 ; {>  %_5743~1':_p1486 %_5746~4':(_opn)◂(_p1484) %_5745~3':(_p1445)◂(_stg) %_5742~0':_p1485 %_5744~2':(_p1432)◂((_p1440)◂(_stg)) }
; _f1509 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_5747 ⊢ %_5748 : %_5748
 ; {>  %_5747~°1◂{ 2' 3' 0' 1' 4' }:_p1484 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_5748
 ; {>  %_5748~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p1484) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_8371
	btr r12,5
	jmp LB_8372
LB_8371:
	bts r12,5
LB_8372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_8377
	btr r12,6
	jmp LB_8378
LB_8377:
	bts r12,6
LB_8378:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_8375
	btr QWORD [rdi],0
	jmp LB_8376
LB_8375:
	bts QWORD [rdi],0
LB_8376:
	mov rcx,r11
	bt r12,5
	jc LB_8381
	btr r12,6
	jmp LB_8382
LB_8381:
	bts r12,6
LB_8382:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_8379
	btr QWORD [rdi],1
	jmp LB_8380
LB_8379:
	bts QWORD [rdi],1
LB_8380:
	mov rcx,r13
	bt r12,0
	jc LB_8385
	btr r12,6
	jmp LB_8386
LB_8385:
	bts r12,6
LB_8386:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_8383
	btr QWORD [rdi],2
	jmp LB_8384
LB_8383:
	bts QWORD [rdi],2
LB_8384:
	mov rcx,r14
	bt r12,1
	jc LB_8389
	btr r12,6
	jmp LB_8390
LB_8389:
	bts r12,6
LB_8390:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_8387
	btr QWORD [rdi],3
	jmp LB_8388
LB_8387:
	bts QWORD [rdi],3
LB_8388:
	mov rcx,r10
	bt r12,4
	jc LB_8393
	btr r12,6
	jmp LB_8394
LB_8393:
	bts r12,6
LB_8394:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_8391
	btr QWORD [rdi],4
	jmp LB_8392
LB_8391:
	bts QWORD [rdi],4
LB_8392:
	mov rsi,1
	bt r12,3
	jc LB_8373
	mov rsi,0
	bt r9,0
	jc LB_8373
	jmp LB_8374
LB_8373:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8374:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8395:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8397
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8396
LB_8397:
	add rsp,8
	ret
LB_8399:
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
LB_8398:
	add rsp,48
	pop r14
LB_8396:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_8479
LB_8478:
	add r14,1
LB_8479:
	cmp r14,r10
	jge LB_8480
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8478
	cmp al,10
	jz LB_8478
	cmp al,32
	jz LB_8478
LB_8480:
	push r10
	call NS_E_5481_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8481
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8469
LB_8481:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8484
LB_8483:
	add r14,1
LB_8484:
	cmp r14,r10
	jge LB_8485
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8483
	cmp al,10
	jz LB_8483
	cmp al,32
	jz LB_8483
LB_8485:
	push r10
	call NS_E_5477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8486
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8487
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8487:
	jmp LB_8469
LB_8486:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_8490
LB_8489:
	add r14,1
LB_8490:
	cmp r14,r10
	jge LB_8491
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8489
	cmp al,10
	jz LB_8489
	cmp al,32
	jz LB_8489
LB_8491:
	push r10
	call NS_E_5476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8492
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8493
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8493:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8494
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8494:
	jmp LB_8469
LB_8492:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
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
	call NS_E_5475_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8499
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8500
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8500:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8501
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8501:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8502
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8502:
	jmp LB_8469
LB_8499:
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
	jc LB_8476
	btr r12,3
	clc
	jmp LB_8477
LB_8476:
	bts r12,3
	stc
LB_8477:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8474
	btr r12,2
	clc
	jmp LB_8475
LB_8474:
	bts r12,2
	stc
LB_8475:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8472
	btr r12,1
	clc
	jmp LB_8473
LB_8472:
	bts r12,1
	stc
LB_8473:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8470
	btr r12,0
	clc
	jmp LB_8471
LB_8470:
	bts r12,0
	stc
LB_8471:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8466
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov rdx,r11
	bt r12,5
	jc LB_8504
	btr r12,7
	jmp LB_8505
LB_8504:
	bts r12,7
LB_8505:
	mov r11,r9
	bt r12,3
	jc LB_8506
	btr r12,5
	jmp LB_8507
LB_8506:
	bts r12,5
LB_8507:
	mov rdi,r10
	mov QWORD [st_vct+8*9],rdi
	bt r12,4
	jc LB_8508
	btr r12,9
	jmp LB_8509
LB_8508:
	bts r12,9
LB_8509:
	mov rdi,r8
	mov QWORD [st_vct+8*8],rdi
	bt r12,2
	jc LB_8510
	btr r12,8
	jmp LB_8511
LB_8510:
	bts r12,8
LB_8511:
; 8' ⊢ { 2' 3' 4' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],0
	jc LB_8514
	btr r12,10
	clc
	jmp LB_8515
LB_8514:
	bts r12,10
	stc
LB_8515:
	mov r8,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_8512
	btr r12,2
	jmp LB_8513
LB_8512:
	bts r12,2
LB_8513:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],1
	jc LB_8518
	btr r12,10
	clc
	jmp LB_8519
LB_8518:
	bts r12,10
	stc
LB_8519:
	mov r9,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_8516
	btr r12,3
	jmp LB_8517
LB_8516:
	bts r12,3
LB_8517:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],2
	jc LB_8522
	btr r12,10
	clc
	jmp LB_8523
LB_8522:
	bts r12,10
	stc
LB_8523:
	mov r10,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_8520
	btr r12,4
	jmp LB_8521
LB_8520:
	bts r12,4
LB_8521:
	mov rdi,QWORD [st_vct+8*8]
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _f1508 { %_5751 %_5752 %_5749 %_5750 %_5753 %_5754 } ⊢ %_5755 : %_5755
 ; {>  %_5753~4':(_opn)◂(_p1484) %_5751~2':(_p1432)◂((_p1440)◂(_stg)) %_5754~5':_p1484 %_5750~1':_p1486 %_5749~0':_p1485 %_5752~3':(_p1445)◂(_stg) }
; _f1508 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_5755 ⊢ %_5756 : %_5756
 ; {>  %_5755~°0◂{ 2' 3' 0' 1' 4' 5' }:_p1484 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_5756
 ; {>  %_5756~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p1484) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_8438
	btr r12,6
	jmp LB_8439
LB_8438:
	bts r12,6
LB_8439:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_8444
	btr r12,7
	jmp LB_8445
LB_8444:
	bts r12,7
LB_8445:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_8442
	btr QWORD [rdi],0
	jmp LB_8443
LB_8442:
	bts QWORD [rdi],0
LB_8443:
	mov rdx,rcx
	bt r12,6
	jc LB_8448
	btr r12,7
	jmp LB_8449
LB_8448:
	bts r12,7
LB_8449:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_8446
	btr QWORD [rdi],1
	jmp LB_8447
LB_8446:
	bts QWORD [rdi],1
LB_8447:
	mov rdx,r13
	bt r12,0
	jc LB_8452
	btr r12,7
	jmp LB_8453
LB_8452:
	bts r12,7
LB_8453:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,7
	jc LB_8450
	btr QWORD [rdi],2
	jmp LB_8451
LB_8450:
	bts QWORD [rdi],2
LB_8451:
	mov rdx,r14
	bt r12,1
	jc LB_8456
	btr r12,7
	jmp LB_8457
LB_8456:
	bts r12,7
LB_8457:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,7
	jc LB_8454
	btr QWORD [rdi],3
	jmp LB_8455
LB_8454:
	bts QWORD [rdi],3
LB_8455:
	mov rdx,r10
	bt r12,4
	jc LB_8460
	btr r12,7
	jmp LB_8461
LB_8460:
	bts r12,7
LB_8461:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,7
	jc LB_8458
	btr QWORD [rdi],4
	jmp LB_8459
LB_8458:
	bts QWORD [rdi],4
LB_8459:
	mov rdx,r11
	bt r12,5
	jc LB_8464
	btr r12,7
	jmp LB_8465
LB_8464:
	bts r12,7
LB_8465:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*5],rsi
	bt r12,7
	jc LB_8462
	btr QWORD [rdi],5
	jmp LB_8463
LB_8462:
	bts QWORD [rdi],5
LB_8463:
	mov rsi,1
	bt r12,3
	jc LB_8440
	mov rsi,0
	bt r9,0
	jc LB_8440
	jmp LB_8441
LB_8440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8441:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8466:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8468
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8467
LB_8468:
	add rsp,8
	ret
LB_8469:
	add rsp,64
	pop r14
LB_8467:
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
	sub rsp,80
; ";"
	jmp LB_8578
LB_8577:
	add r14,1
LB_8578:
	cmp r14,r10
	jge LB_8579
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8577
	cmp al,10
	jz LB_8577
	cmp al,32
	jz LB_8577
LB_8579:
	add r14,1
	cmp r14,r10
	jg LB_8582
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_8582
	jmp LB_8583
LB_8582:
	jmp LB_8541
LB_8583:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
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
	add r14,3
	cmp r14,r10
	jg LB_8590
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8590
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8590
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8590
	jmp LB_8591
LB_8590:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8588:
	jmp LB_8541
LB_8591:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_8554
LB_8553:
	add r14,1
LB_8554:
	cmp r14,r10
	jge LB_8555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8553
	cmp al,10
	jz LB_8553
	cmp al,32
	jz LB_8553
LB_8555:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8556
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8557
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8557:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8558
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8558:
	jmp LB_8542
LB_8556:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
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
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8563
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8564
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8564:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8565
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8565:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8566
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8566:
	jmp LB_8542
LB_8563:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_8569
LB_8568:
	add r14,1
LB_8569:
	cmp r14,r10
	jge LB_8570
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8568
	cmp al,10
	jz LB_8568
	cmp al,32
	jz LB_8568
LB_8570:
	push r10
	call NS_E_5475_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8571
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8572
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8572:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8573
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8573:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8574
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8574:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8575:
	jmp LB_8542
LB_8571:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8551
	btr r12,4
	clc
	jmp LB_8552
LB_8551:
	bts r12,4
	stc
LB_8552:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8549
	btr r12,3
	clc
	jmp LB_8550
LB_8549:
	bts r12,3
	stc
LB_8550:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8547
	btr r12,2
	clc
	jmp LB_8548
LB_8547:
	bts r12,2
	stc
LB_8548:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8545
	btr r12,1
	clc
	jmp LB_8546
LB_8545:
	bts r12,1
	stc
LB_8546:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8543
	btr r12,0
	clc
	jmp LB_8544
LB_8543:
	bts r12,0
	stc
LB_8544:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8538
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_8592
	btr r12,5
	jmp LB_8593
LB_8592:
	bts r12,5
LB_8593:
	mov r8,r10
	bt r12,4
	jc LB_8594
	btr r12,2
	jmp LB_8595
LB_8594:
	bts r12,2
LB_8595:
	mov r10,r14
	bt r12,1
	jc LB_8596
	btr r12,4
	jmp LB_8597
LB_8596:
	bts r12,4
LB_8597:
	mov r14,r9
	bt r12,3
	jc LB_8598
	btr r12,1
	jmp LB_8599
LB_8598:
	bts r12,1
LB_8599:
	mov r9,r13
	bt r12,0
	jc LB_8600
	btr r12,3
	jmp LB_8601
LB_8600:
	bts r12,3
LB_8601:
	mov r13,r11
	bt r12,5
	jc LB_8602
	btr r12,0
	jmp LB_8603
LB_8602:
	bts r12,0
LB_8603:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5759 ⊢ %_5760 : %_5760
 ; {>  %_5759~2':_p1484 %_5758~1':(_p1445)◂(_stg) %_5757~0':(_p1432)◂((_p1440)◂(_stg)) }
; _some 2' ⊢ °0◂2'
; _some { %_5757 %_5758 %_5760 } ⊢ %_5761 : %_5761
 ; {>  %_5758~1':(_p1445)◂(_stg) %_5757~0':(_p1432)◂((_p1440)◂(_stg)) %_5760~°0◂2':(_opn)◂(_p1484) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_5761
 ; {>  %_5761~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) (_opn)◂(_p1484) }) }
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
	jc LB_8526
	btr r12,4
	jmp LB_8527
LB_8526:
	bts r12,4
LB_8527:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8524
	btr QWORD [rdi],0
	jmp LB_8525
LB_8524:
	bts QWORD [rdi],0
LB_8525:
	mov r10,r14
	bt r12,1
	jc LB_8530
	btr r12,4
	jmp LB_8531
LB_8530:
	bts r12,4
LB_8531:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8528
	btr QWORD [rdi],1
	jmp LB_8529
LB_8528:
	bts QWORD [rdi],1
LB_8529:
	mov r10,r8
	bt r12,2
	jc LB_8536
	btr r12,4
	jmp LB_8537
LB_8536:
	bts r12,4
LB_8537:
	mov rsi,1
	bt r12,4
	jc LB_8534
	mov rsi,0
	bt r10,0
	jc LB_8534
	jmp LB_8535
LB_8534:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_8535:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_8532
	btr QWORD [rdi],2
	jmp LB_8533
LB_8532:
	bts QWORD [rdi],2
LB_8533:
	mov r8,0
	bts r12,2
	ret
LB_8538:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8540
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8539
LB_8540:
	add rsp,8
	ret
LB_8542:
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
LB_8541:
	add rsp,80
	pop r14
LB_8539:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
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
	add r14,3
	cmp r14,r10
	jg LB_8645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8645
	jmp LB_8646
LB_8645:
	jmp LB_8619
LB_8646:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_8628
LB_8627:
	add r14,1
LB_8628:
	cmp r14,r10
	jge LB_8629
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8627
	cmp al,10
	jz LB_8627
	cmp al,32
	jz LB_8627
LB_8629:
	push r10
	call NS_E_4833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8630
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8631
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8631:
	jmp LB_8620
LB_8630:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_8634
LB_8633:
	add r14,1
LB_8634:
	cmp r14,r10
	jge LB_8635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8633
	cmp al,10
	jz LB_8633
	cmp al,32
	jz LB_8633
LB_8635:
	push r10
	call NS_E_5459_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8636
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8637
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8637:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8638
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8638:
	jmp LB_8620
LB_8636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8625
	btr r12,2
	clc
	jmp LB_8626
LB_8625:
	bts r12,2
	stc
LB_8626:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8623
	btr r12,1
	clc
	jmp LB_8624
LB_8623:
	bts r12,1
	stc
LB_8624:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8621
	btr r12,0
	clc
	jmp LB_8622
LB_8621:
	bts r12,0
	stc
LB_8622:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8616
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8647
	btr r12,3
	jmp LB_8648
LB_8647:
	bts r12,3
LB_8648:
	mov r14,r8
	bt r12,2
	jc LB_8649
	btr r12,1
	jmp LB_8650
LB_8649:
	bts r12,1
LB_8650:
	mov r8,r13
	bt r12,0
	jc LB_8651
	btr r12,2
	jmp LB_8652
LB_8651:
	bts r12,2
LB_8652:
	mov r13,r9
	bt r12,3
	jc LB_8653
	btr r12,0
	jmp LB_8654
LB_8653:
	bts r12,0
LB_8654:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_5764 : %_5764
 ; {>  %_5763~1':(_p1445)◂(_stg) %_5762~0':(_p1432)◂((_p1440)◂(_stg)) }
; _none {  } ⊢ °1◂{  }
; _some { %_5762 %_5763 %_5764 } ⊢ %_5765 : %_5765
 ; {>  %_5763~1':(_p1445)◂(_stg) %_5762~0':(_p1432)◂((_p1440)◂(_stg)) %_5764~°1◂{  }:(_opn)◂(t2728'(0)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_5765
 ; {>  %_5765~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ (_p1432)◂((_p1440)◂(_stg)) (_p1445)◂(_stg) (_opn)◂(t2731'(0)) }) }
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
	jc LB_8606
	btr r12,2
	jmp LB_8607
LB_8606:
	bts r12,2
LB_8607:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8604
	btr QWORD [rdi],0
	jmp LB_8605
LB_8604:
	bts QWORD [rdi],0
LB_8605:
	mov r8,r14
	bt r12,1
	jc LB_8610
	btr r12,2
	jmp LB_8611
LB_8610:
	bts r12,2
LB_8611:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8608
	btr QWORD [rdi],1
	jmp LB_8609
LB_8608:
	bts QWORD [rdi],1
LB_8609:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_8614
	mov rsi,0
	bt r8,0
	jc LB_8614
	jmp LB_8615
LB_8614:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_8615:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_8612
	btr QWORD [rdi],2
	jmp LB_8613
LB_8612:
	bts QWORD [rdi],2
LB_8613:
	mov r8,0
	bts r12,2
	ret
LB_8616:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8618
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8617
LB_8618:
	add rsp,8
	ret
LB_8620:
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
LB_8619:
	add rsp,48
	pop r14
LB_8617:
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
	sub rsp,32
; "!|"
	jmp LB_8675
LB_8674:
	add r14,1
LB_8675:
	cmp r14,r10
	jge LB_8676
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8674
	cmp al,10
	jz LB_8674
	cmp al,32
	jz LB_8674
LB_8676:
	add r14,2
	cmp r14,r10
	jg LB_8679
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_8679
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_8679
	jmp LB_8680
LB_8679:
	jmp LB_8662
LB_8680:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_8669
LB_8668:
	add r14,1
LB_8669:
	cmp r14,r10
	jge LB_8670
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8668
	cmp al,10
	jz LB_8668
	cmp al,32
	jz LB_8668
LB_8670:
	push r10
	call NS_E_5478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8671
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8672
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8672:
	jmp LB_8663
LB_8671:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8666
	btr r12,1
	clc
	jmp LB_8667
LB_8666:
	bts r12,1
	stc
LB_8667:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8664
	btr r12,0
	clc
	jmp LB_8665
LB_8664:
	bts r12,0
	stc
LB_8665:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8659
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8681
	btr r12,2
	jmp LB_8682
LB_8681:
	bts r12,2
LB_8682:
	mov r13,r14
	bt r12,1
	jc LB_8683
	btr r12,0
	jmp LB_8684
LB_8683:
	bts r12,0
LB_8684:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1513 %_5766 ⊢ %_5767 : %_5767
 ; {>  %_5766~0':_p1487 }
; _f1513 0' ⊢ °0◂0'
; _some %_5767 ⊢ %_5768 : %_5768
 ; {>  %_5767~°0◂0':_p1486 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5768
 ; {>  %_5768~°0◂°0◂0':(_opn)◂(_p1486) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8657
	btr r12,3
	jmp LB_8658
LB_8657:
	bts r12,3
LB_8658:
	mov rsi,1
	bt r12,3
	jc LB_8655
	mov rsi,0
	bt r9,0
	jc LB_8655
	jmp LB_8656
LB_8655:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8656:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8659:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8661
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8660
LB_8661:
	add rsp,8
	ret
LB_8663:
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
LB_8662:
	add rsp,32
	pop r14
LB_8660:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_8704
LB_8703:
	add r14,1
LB_8704:
	cmp r14,r10
	jge LB_8705
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8703
	cmp al,10
	jz LB_8703
	cmp al,32
	jz LB_8703
LB_8705:
	push r10
	call NS_E_5479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8706
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8698
LB_8706:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8709
LB_8708:
	add r14,1
LB_8709:
	cmp r14,r10
	jge LB_8710
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8708
	cmp al,10
	jz LB_8708
	cmp al,32
	jz LB_8708
LB_8710:
	push r10
	call NS_E_5477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8711
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8712
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8712:
	jmp LB_8698
LB_8711:
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
	jc LB_8701
	btr r12,1
	clc
	jmp LB_8702
LB_8701:
	bts r12,1
	stc
LB_8702:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8699
	btr r12,0
	clc
	jmp LB_8700
LB_8699:
	bts r12,0
	stc
LB_8700:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8695
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1514 { %_5769 %_5770 } ⊢ %_5771 : %_5771
 ; {>  %_5770~1':_p1486 %_5769~0':_p1488 }
; _f1514 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5771 ⊢ %_5772 : %_5772
 ; {>  %_5771~°1◂{ 0' 1' }:_p1486 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5772
 ; {>  %_5772~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1486) }
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
	jc LB_8689
	btr r12,2
	jmp LB_8690
LB_8689:
	bts r12,2
LB_8690:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8687
	btr QWORD [rdi],0
	jmp LB_8688
LB_8687:
	bts QWORD [rdi],0
LB_8688:
	mov r8,r14
	bt r12,1
	jc LB_8693
	btr r12,2
	jmp LB_8694
LB_8693:
	bts r12,2
LB_8694:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8691
	btr QWORD [rdi],1
	jmp LB_8692
LB_8691:
	bts QWORD [rdi],1
LB_8692:
	mov rsi,1
	bt r12,3
	jc LB_8685
	mov rsi,0
	bt r9,0
	jc LB_8685
	jmp LB_8686
LB_8685:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8686:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8695:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8697
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8696
LB_8697:
	add rsp,8
	ret
LB_8698:
	add rsp,32
	pop r14
LB_8696:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_8716
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _f1515 {  } ⊢ %_5773 : %_5773
 ; {>  }
; _f1515 {  } ⊢ °2◂{  }
; _some %_5773 ⊢ %_5774 : %_5774
 ; {>  %_5773~°2◂{  }:_p1486 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5774
 ; {>  %_5774~°0◂°2◂{  }:(_opn)◂(_p1486) }
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
	jc LB_8714
	mov rsi,0
	bt r9,0
	jc LB_8714
	jmp LB_8715
LB_8714:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8715:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8716:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8718
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8717
LB_8718:
	add rsp,8
	ret
LB_8719:
	add rsp,0
	pop r14
LB_8717:
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
	sub rsp,32
; grm_ptn
	jmp LB_8739
LB_8738:
	add r14,1
LB_8739:
	cmp r14,r10
	jge LB_8740
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8738
	cmp al,10
	jz LB_8738
	cmp al,32
	jz LB_8738
LB_8740:
	push r10
	call NS_E_5479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8741
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8733
LB_8741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_8744
LB_8743:
	add r14,1
LB_8744:
	cmp r14,r10
	jge LB_8745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8743
	cmp al,10
	jz LB_8743
	cmp al,32
	jz LB_8743
LB_8745:
	push r10
	call NS_E_5478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8746
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8747:
	jmp LB_8733
LB_8746:
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
	jc LB_8736
	btr r12,1
	clc
	jmp LB_8737
LB_8736:
	bts r12,1
	stc
LB_8737:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8734
	btr r12,0
	clc
	jmp LB_8735
LB_8734:
	bts r12,0
	stc
LB_8735:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8730
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1516 { %_5775 %_5776 } ⊢ %_5777 : %_5777
 ; {>  %_5775~0':_p1488 %_5776~1':_p1487 }
; _f1516 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5777 ⊢ %_5778 : %_5778
 ; {>  %_5777~°0◂{ 0' 1' }:_p1487 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5778
 ; {>  %_5778~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1487) }
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
	jc LB_8724
	btr r12,2
	jmp LB_8725
LB_8724:
	bts r12,2
LB_8725:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8722
	btr QWORD [rdi],0
	jmp LB_8723
LB_8722:
	bts QWORD [rdi],0
LB_8723:
	mov r8,r14
	bt r12,1
	jc LB_8728
	btr r12,2
	jmp LB_8729
LB_8728:
	bts r12,2
LB_8729:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8726
	btr QWORD [rdi],1
	jmp LB_8727
LB_8726:
	bts QWORD [rdi],1
LB_8727:
	mov rsi,1
	bt r12,3
	jc LB_8720
	mov rsi,0
	bt r9,0
	jc LB_8720
	jmp LB_8721
LB_8720:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8721:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8730:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8732
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8731
LB_8732:
	add rsp,8
	ret
LB_8733:
	add rsp,32
	pop r14
LB_8731:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_8751
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _f1517 {  } ⊢ %_5779 : %_5779
 ; {>  }
; _f1517 {  } ⊢ °1◂{  }
; _some %_5779 ⊢ %_5780 : %_5780
 ; {>  %_5779~°1◂{  }:_p1487 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5780
 ; {>  %_5780~°0◂°1◂{  }:(_opn)◂(_p1487) }
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
	jc LB_8749
	mov rsi,0
	bt r9,0
	jc LB_8749
	jmp LB_8750
LB_8749:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8750:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8751:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8753
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8752
LB_8753:
	add rsp,8
	ret
LB_8754:
	add rsp,0
	pop r14
LB_8752:
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
	sub rsp,48
; "\226\159\166"
	jmp LB_8770
LB_8769:
	add r14,1
LB_8770:
	cmp r14,r10
	jge LB_8771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8769
	cmp al,10
	jz LB_8769
	cmp al,32
	jz LB_8769
LB_8771:
	add r14,3
	cmp r14,r10
	jg LB_8774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_8774
	jmp LB_8775
LB_8774:
	jmp LB_8762
LB_8775:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
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
	push r10
	call NS_E_5480_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8779
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8780:
	jmp LB_8762
LB_8779:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_8783
LB_8782:
	add r14,1
LB_8783:
	cmp r14,r10
	jge LB_8784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8782
	cmp al,10
	jz LB_8782
	cmp al,32
	jz LB_8782
LB_8784:
	add r14,3
	cmp r14,r10
	jg LB_8789
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8789
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8789
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_8789
	jmp LB_8790
LB_8789:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8786
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8786:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8787
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8787:
	jmp LB_8762
LB_8790:
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
	jc LB_8767
	btr r12,2
	clc
	jmp LB_8768
LB_8767:
	bts r12,2
	stc
LB_8768:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8765
	btr r12,1
	clc
	jmp LB_8766
LB_8765:
	bts r12,1
	stc
LB_8766:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8763
	btr r12,0
	clc
	jmp LB_8764
LB_8763:
	bts r12,0
	stc
LB_8764:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8759
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_8791
	btr r12,6
	jmp LB_8792
LB_8791:
	bts r12,6
LB_8792:
	mov r13,r14
	bt r12,1
	jc LB_8793
	btr r12,0
	jmp LB_8794
LB_8793:
	bts r12,0
LB_8794:
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
; _f1518 %_5781 ⊢ %_5782 : %_5782
 ; {>  %_5781~0':_p1489 }
; _f1518 0' ⊢ °0◂0'
; _some %_5782 ⊢ %_5783 : %_5783
 ; {>  %_5782~°0◂0':_p1488 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5783
 ; {>  %_5783~°0◂°0◂0':(_opn)◂(_p1488) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8757
	btr r12,3
	jmp LB_8758
LB_8757:
	bts r12,3
LB_8758:
	mov rsi,1
	bt r12,3
	jc LB_8755
	mov rsi,0
	bt r9,0
	jc LB_8755
	jmp LB_8756
LB_8755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8756:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8759:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8761
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8760
LB_8761:
	add rsp,8
	ret
LB_8762:
	add rsp,48
	pop r14
LB_8760:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_8806
LB_8805:
	add r14,1
LB_8806:
	cmp r14,r10
	jge LB_8807
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8805
	cmp al,10
	jz LB_8805
	cmp al,32
	jz LB_8805
LB_8807:
	push r10
	call NS_E_5480_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8808
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8802
LB_8808:
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
	jc LB_8803
	btr r12,0
	clc
	jmp LB_8804
LB_8803:
	bts r12,0
	stc
LB_8804:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8799
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1519 %_5784 ⊢ %_5785 : %_5785
 ; {>  %_5784~0':_p1489 }
; _f1519 0' ⊢ °1◂0'
; _some %_5785 ⊢ %_5786 : %_5786
 ; {>  %_5785~°1◂0':_p1488 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5786
 ; {>  %_5786~°0◂°1◂0':(_opn)◂(_p1488) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8797
	btr r12,3
	jmp LB_8798
LB_8797:
	bts r12,3
LB_8798:
	mov rsi,1
	bt r12,3
	jc LB_8795
	mov rsi,0
	bt r9,0
	jc LB_8795
	jmp LB_8796
LB_8795:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8796:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8799:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8801
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8800
LB_8801:
	add rsp,8
	ret
LB_8802:
	add rsp,16
	pop r14
LB_8800:
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
	sub rsp,16
; stg_ltr
	jmp LB_8821
LB_8820:
	add r14,1
LB_8821:
	cmp r14,r10
	jge LB_8822
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8820
	cmp al,10
	jz LB_8820
	cmp al,32
	jz LB_8820
LB_8822:
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8823
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8817
LB_8823:
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
	jc LB_8818
	btr r12,0
	clc
	jmp LB_8819
LB_8818:
	bts r12,0
	stc
LB_8819:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8814
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1521 %_5787 ⊢ %_5788 : %_5788
 ; {>  %_5787~0':_stg }
; _f1521 0' ⊢ °1◂0'
; _some %_5788 ⊢ %_5789 : %_5789
 ; {>  %_5788~°1◂0':_p1489 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5789
 ; {>  %_5789~°0◂°1◂0':(_opn)◂(_p1489) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8812
	btr r12,3
	jmp LB_8813
LB_8812:
	bts r12,3
LB_8813:
	mov rsi,1
	bt r12,3
	jc LB_8810
	mov rsi,0
	bt r9,0
	jc LB_8810
	jmp LB_8811
LB_8810:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8811:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8814:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8816
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8815
LB_8816:
	add rsp,8
	ret
LB_8817:
	add rsp,16
	pop r14
LB_8815:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_8836
LB_8835:
	add r14,1
LB_8836:
	cmp r14,r10
	jge LB_8837
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8835
	cmp al,10
	jz LB_8835
	cmp al,32
	jz LB_8835
LB_8837:
	push r10
	call NS_E_4376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8838
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8832
LB_8838:
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
	jc LB_8833
	btr r12,0
	clc
	jmp LB_8834
LB_8833:
	bts r12,0
	stc
LB_8834:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8829
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1520 %_5790 ⊢ %_5791 : %_5791
 ; {>  %_5790~0':_p1387 }
; _f1520 0' ⊢ °0◂0'
; _some %_5791 ⊢ %_5792 : %_5792
 ; {>  %_5791~°0◂0':_p1489 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5792
 ; {>  %_5792~°0◂°0◂0':(_opn)◂(_p1489) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8827
	btr r12,3
	jmp LB_8828
LB_8827:
	bts r12,3
LB_8828:
	mov rsi,1
	bt r12,3
	jc LB_8825
	mov rsi,0
	bt r9,0
	jc LB_8825
	jmp LB_8826
LB_8825:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8826:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8829:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8831
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8830
LB_8831:
	add rsp,8
	ret
LB_8832:
	add rsp,16
	pop r14
LB_8830:
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
; "\226\136\144*"
	jmp LB_8849
LB_8848:
	add r14,1
LB_8849:
	cmp r14,r10
	jge LB_8850
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8848
	cmp al,10
	jz LB_8848
	cmp al,32
	jz LB_8848
LB_8850:
	add r14,4
	cmp r14,r10
	jg LB_8853
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8853
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8853
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8853
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_8853
	jmp LB_8854
LB_8853:
	jmp LB_8845
LB_8854:
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
	jc LB_8846
	btr r12,0
	clc
	jmp LB_8847
LB_8846:
	bts r12,0
	stc
LB_8847:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8842
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1511 {  } ⊢ %_5793 : %_5793
 ; {>  }
; _f1511 {  } ⊢ °1◂{  }
; _some %_5793 ⊢ %_5794 : %_5794
 ; {>  %_5793~°1◂{  }:_p1485 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5794
 ; {>  %_5794~°0◂°1◂{  }:(_opn)◂(_p1485) }
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
	jc LB_8840
	mov rsi,0
	bt r9,0
	jc LB_8840
	jmp LB_8841
LB_8840:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8841:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8842:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8844
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8843
LB_8844:
	add rsp,8
	ret
LB_8845:
	add rsp,16
	pop r14
LB_8843:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_8864
LB_8863:
	add r14,1
LB_8864:
	cmp r14,r10
	jge LB_8865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8863
	cmp al,10
	jz LB_8863
	cmp al,32
	jz LB_8863
LB_8865:
	add r14,4
	cmp r14,r10
	jg LB_8868
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8868
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8868
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8868
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_8868
	jmp LB_8869
LB_8868:
	jmp LB_8860
LB_8869:
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
	jc LB_8861
	btr r12,0
	clc
	jmp LB_8862
LB_8861:
	bts r12,0
	stc
LB_8862:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8857
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1512 {  } ⊢ %_5795 : %_5795
 ; {>  }
; _f1512 {  } ⊢ °2◂{  }
; _some %_5795 ⊢ %_5796 : %_5796
 ; {>  %_5795~°2◂{  }:_p1485 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5796
 ; {>  %_5796~°0◂°2◂{  }:(_opn)◂(_p1485) }
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
	jc LB_8855
	mov rsi,0
	bt r9,0
	jc LB_8855
	jmp LB_8856
LB_8855:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8856:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8857:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8859
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8858
LB_8859:
	add rsp,8
	ret
LB_8860:
	add rsp,16
	pop r14
LB_8858:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_8879
LB_8878:
	add r14,1
LB_8879:
	cmp r14,r10
	jge LB_8880
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8878
	cmp al,10
	jz LB_8878
	cmp al,32
	jz LB_8878
LB_8880:
	add r14,3
	cmp r14,r10
	jg LB_8883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_8883
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_8883
	jmp LB_8884
LB_8883:
	jmp LB_8875
LB_8884:
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
	jc LB_8876
	btr r12,0
	clc
	jmp LB_8877
LB_8876:
	bts r12,0
	stc
LB_8877:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8872
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1510 {  } ⊢ %_5797 : %_5797
 ; {>  }
; _f1510 {  } ⊢ °0◂{  }
; _some %_5797 ⊢ %_5798 : %_5798
 ; {>  %_5797~°0◂{  }:_p1485 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5798
 ; {>  %_5798~°0◂°0◂{  }:(_opn)◂(_p1485) }
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
	jc LB_8870
	mov rsi,0
	bt r9,0
	jc LB_8870
	jmp LB_8871
LB_8870:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8871:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8872:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8874
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8873
LB_8874:
	add rsp,8
	ret
LB_8875:
	add rsp,16
	pop r14
LB_8873:
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
	sub rsp,16
; "\226\136\144.*"
	jmp LB_8894
LB_8893:
	add r14,1
LB_8894:
	cmp r14,r10
	jge LB_8895
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8893
	cmp al,10
	jz LB_8893
	cmp al,32
	jz LB_8893
LB_8895:
	add r14,5
	cmp r14,r10
	jg LB_8898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_8898
	jmp LB_8899
LB_8898:
	jmp LB_8890
LB_8899:
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
	jc LB_8891
	btr r12,0
	clc
	jmp LB_8892
LB_8891:
	bts r12,0
	stc
LB_8892:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8887
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1511 {  } ⊢ %_5799 : %_5799
 ; {>  }
; _f1511 {  } ⊢ °1◂{  }
; _some %_5799 ⊢ %_5800 : %_5800
 ; {>  %_5799~°1◂{  }:_p1485 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5800
 ; {>  %_5800~°0◂°1◂{  }:(_opn)◂(_p1485) }
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
	jc LB_8885
	mov rsi,0
	bt r9,0
	jc LB_8885
	jmp LB_8886
LB_8885:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8886:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8887:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8889
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8888
LB_8889:
	add rsp,8
	ret
LB_8890:
	add rsp,16
	pop r14
LB_8888:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_8909
LB_8908:
	add r14,1
LB_8909:
	cmp r14,r10
	jge LB_8910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8908
	cmp al,10
	jz LB_8908
	cmp al,32
	jz LB_8908
LB_8910:
	add r14,5
	cmp r14,r10
	jg LB_8913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_8913
	jmp LB_8914
LB_8913:
	jmp LB_8905
LB_8914:
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
	jc LB_8906
	btr r12,0
	clc
	jmp LB_8907
LB_8906:
	bts r12,0
	stc
LB_8907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8902
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1512 {  } ⊢ %_5801 : %_5801
 ; {>  }
; _f1512 {  } ⊢ °2◂{  }
; _some %_5801 ⊢ %_5802 : %_5802
 ; {>  %_5801~°2◂{  }:_p1485 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5802
 ; {>  %_5802~°0◂°2◂{  }:(_opn)◂(_p1485) }
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
	jc LB_8900
	mov rsi,0
	bt r9,0
	jc LB_8900
	jmp LB_8901
LB_8900:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8901:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8904
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8903
LB_8904:
	add rsp,8
	ret
LB_8905:
	add rsp,16
	pop r14
LB_8903:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_8924
LB_8923:
	add r14,1
LB_8924:
	cmp r14,r10
	jge LB_8925
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8923
	cmp al,10
	jz LB_8923
	cmp al,32
	jz LB_8923
LB_8925:
	add r14,4
	cmp r14,r10
	jg LB_8928
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8928
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8928
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8928
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_8928
	jmp LB_8929
LB_8928:
	jmp LB_8920
LB_8929:
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
	jc LB_8921
	btr r12,0
	clc
	jmp LB_8922
LB_8921:
	bts r12,0
	stc
LB_8922:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8917
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1510 {  } ⊢ %_5803 : %_5803
 ; {>  }
; _f1510 {  } ⊢ °0◂{  }
; _some %_5803 ⊢ %_5804 : %_5804
 ; {>  %_5803~°0◂{  }:_p1485 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5804
 ; {>  %_5804~°0◂°0◂{  }:(_opn)◂(_p1485) }
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
	jc LB_8915
	mov rsi,0
	bt r9,0
	jc LB_8915
	jmp LB_8916
LB_8915:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8916:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8917:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8919
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8918
LB_8919:
	add rsp,8
	ret
LB_8920:
	add rsp,16
	pop r14
LB_8918:
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
	sub rsp,64
; grm_ord_end
	jmp LB_8985
LB_8984:
	add r14,1
LB_8985:
	cmp r14,r10
	jge LB_8986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8984
	cmp al,10
	jz LB_8984
	cmp al,32
	jz LB_8984
LB_8986:
	push r10
	call NS_E_5482_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8987
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8953
LB_8987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_8964
LB_8963:
	add r14,1
LB_8964:
	cmp r14,r10
	jge LB_8965
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8963
	cmp al,10
	jz LB_8963
	cmp al,32
	jz LB_8963
LB_8965:
	push r10
	call NS_E_5485_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8966
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8967
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8967:
	jmp LB_8954
LB_8966:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_8970
LB_8969:
	add r14,1
LB_8970:
	cmp r14,r10
	jge LB_8971
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8969
	cmp al,10
	jz LB_8969
	cmp al,32
	jz LB_8969
LB_8971:
	push r10
	call NS_E_5477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8972
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8973
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8973:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8974
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8974:
	jmp LB_8954
LB_8972:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
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
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8980
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8980:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8981
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8981:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8982
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8982:
	jmp LB_8954
LB_8979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8961
	btr r12,3
	clc
	jmp LB_8962
LB_8961:
	bts r12,3
	stc
LB_8962:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8959
	btr r12,2
	clc
	jmp LB_8960
LB_8959:
	bts r12,2
	stc
LB_8960:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8957
	btr r12,1
	clc
	jmp LB_8958
LB_8957:
	bts r12,1
	stc
LB_8958:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8955
	btr r12,0
	clc
	jmp LB_8956
LB_8955:
	bts r12,0
	stc
LB_8956:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8950
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f1507 { %_5806 %_5805 %_5807 %_5808 } ⊢ %_5809 : %_5809
 ; {>  %_5807~2':_p1486 %_5808~3':(_opn)◂(_p1483) %_5805~0':_p1485 %_5806~1':(_opn)◂(_stg) }
; _f1507 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_5809 ⊢ %_5810 : %_5810
 ; {>  %_5809~°1◂{ 1' 0' 2' 3' }:_p1483 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_5810
 ; {>  %_5810~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p1483) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_8930
	btr r12,4
	jmp LB_8931
LB_8930:
	bts r12,4
LB_8931:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_8936
	btr r12,5
	jmp LB_8937
LB_8936:
	bts r12,5
LB_8937:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8934
	btr QWORD [rdi],0
	jmp LB_8935
LB_8934:
	bts QWORD [rdi],0
LB_8935:
	mov r11,r13
	bt r12,0
	jc LB_8940
	btr r12,5
	jmp LB_8941
LB_8940:
	bts r12,5
LB_8941:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8938
	btr QWORD [rdi],1
	jmp LB_8939
LB_8938:
	bts QWORD [rdi],1
LB_8939:
	mov r11,r8
	bt r12,2
	jc LB_8944
	btr r12,5
	jmp LB_8945
LB_8944:
	bts r12,5
LB_8945:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_8942
	btr QWORD [rdi],2
	jmp LB_8943
LB_8942:
	bts QWORD [rdi],2
LB_8943:
	mov r11,r10
	bt r12,4
	jc LB_8948
	btr r12,5
	jmp LB_8949
LB_8948:
	bts r12,5
LB_8949:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,5
	jc LB_8946
	btr QWORD [rdi],3
	jmp LB_8947
LB_8946:
	bts QWORD [rdi],3
LB_8947:
	mov rsi,1
	bt r12,3
	jc LB_8932
	mov rsi,0
	bt r9,0
	jc LB_8932
	jmp LB_8933
LB_8932:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8933:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8950:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8952
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8951
LB_8952:
	add rsp,8
	ret
LB_8954:
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
LB_8953:
	add rsp,64
	pop r14
LB_8951:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_9028
LB_9027:
	add r14,1
LB_9028:
	cmp r14,r10
	jge LB_9029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9027
	cmp al,10
	jz LB_9027
	cmp al,32
	jz LB_9027
LB_9029:
	push r10
	call NS_E_5481_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9030
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9016
LB_9030:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_9033
LB_9032:
	add r14,1
LB_9033:
	cmp r14,r10
	jge LB_9034
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9032
	cmp al,10
	jz LB_9032
	cmp al,32
	jz LB_9032
LB_9034:
	push r10
	call NS_E_5485_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9035
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9036
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9036:
	jmp LB_9016
LB_9035:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_9039
LB_9038:
	add r14,1
LB_9039:
	cmp r14,r10
	jge LB_9040
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9038
	cmp al,10
	jz LB_9038
	cmp al,32
	jz LB_9038
LB_9040:
	push r10
	call NS_E_5477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9041
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9042
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9042:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9043
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9043:
	jmp LB_9016
LB_9041:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
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
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9049
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9049:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9050
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9050:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9051
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9051:
	jmp LB_9016
LB_9048:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_9054
LB_9053:
	add r14,1
LB_9054:
	cmp r14,r10
	jge LB_9055
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9053
	cmp al,10
	jz LB_9053
	cmp al,32
	jz LB_9053
LB_9055:
	push r10
	call NS_E_5483_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9056
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9057
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9057:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9058
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9058:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9059
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9059:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9060
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9060:
	jmp LB_9016
LB_9056:
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
	jc LB_9025
	btr r12,4
	clc
	jmp LB_9026
LB_9025:
	bts r12,4
	stc
LB_9026:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9023
	btr r12,3
	clc
	jmp LB_9024
LB_9023:
	bts r12,3
	stc
LB_9024:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9021
	btr r12,2
	clc
	jmp LB_9022
LB_9021:
	bts r12,2
	stc
LB_9022:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9019
	btr r12,1
	clc
	jmp LB_9020
LB_9019:
	bts r12,1
	stc
LB_9020:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9017
	btr r12,0
	clc
	jmp LB_9018
LB_9017:
	bts r12,0
	stc
LB_9018:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_9013
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
	bts r12,5
	bts r12,6
	bts r12,7
; _f1506 { %_5812 %_5811 %_5813 %_5814 %_5815 } ⊢ %_5816 : %_5816
 ; {>  %_5811~0':_p1485 %_5814~3':(_opn)◂(_p1483) %_5812~1':(_opn)◂(_stg) %_5815~4':_p1483 %_5813~2':_p1486 }
; _f1506 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_5816 ⊢ %_5817 : %_5817
 ; {>  %_5816~°0◂{ 1' 0' 2' 3' 4' }:_p1483 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_5817
 ; {>  %_5817~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p1483) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_8989
	btr r12,5
	jmp LB_8990
LB_8989:
	bts r12,5
LB_8990:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_8995
	btr r12,6
	jmp LB_8996
LB_8995:
	bts r12,6
LB_8996:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_8993
	btr QWORD [rdi],0
	jmp LB_8994
LB_8993:
	bts QWORD [rdi],0
LB_8994:
	mov rcx,r13
	bt r12,0
	jc LB_8999
	btr r12,6
	jmp LB_9000
LB_8999:
	bts r12,6
LB_9000:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_8997
	btr QWORD [rdi],1
	jmp LB_8998
LB_8997:
	bts QWORD [rdi],1
LB_8998:
	mov rcx,r8
	bt r12,2
	jc LB_9003
	btr r12,6
	jmp LB_9004
LB_9003:
	bts r12,6
LB_9004:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_9001
	btr QWORD [rdi],2
	jmp LB_9002
LB_9001:
	bts QWORD [rdi],2
LB_9002:
	mov rcx,r11
	bt r12,5
	jc LB_9007
	btr r12,6
	jmp LB_9008
LB_9007:
	bts r12,6
LB_9008:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_9005
	btr QWORD [rdi],3
	jmp LB_9006
LB_9005:
	bts QWORD [rdi],3
LB_9006:
	mov rcx,r10
	bt r12,4
	jc LB_9011
	btr r12,6
	jmp LB_9012
LB_9011:
	bts r12,6
LB_9012:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_9009
	btr QWORD [rdi],4
	jmp LB_9010
LB_9009:
	bts QWORD [rdi],4
LB_9010:
	mov rsi,1
	bt r12,3
	jc LB_8991
	mov rsi,0
	bt r9,0
	jc LB_8991
	jmp LB_8992
LB_8991:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8992:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9013:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9015
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9014
LB_9015:
	add rsp,8
	ret
LB_9016:
	add rsp,80
	pop r14
LB_9014:
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
; ";"
	jmp LB_9075
LB_9074:
	add r14,1
LB_9075:
	cmp r14,r10
	jge LB_9076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9074
	cmp al,10
	jz LB_9074
	cmp al,32
	jz LB_9074
LB_9076:
	add r14,1
	cmp r14,r10
	jg LB_9079
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_9079
	jmp LB_9080
LB_9079:
	jmp LB_9069
LB_9080:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
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
	push r10
	call NS_E_5483_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9084
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9085
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9085:
	jmp LB_9069
LB_9084:
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
	jc LB_9072
	btr r12,1
	clc
	jmp LB_9073
LB_9072:
	bts r12,1
	stc
LB_9073:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9070
	btr r12,0
	clc
	jmp LB_9071
LB_9070:
	bts r12,0
	stc
LB_9071:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9066
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_9087
	btr r12,5
	jmp LB_9088
LB_9087:
	bts r12,5
LB_9088:
	mov r13,r14
	bt r12,1
	jc LB_9089
	btr r12,0
	jmp LB_9090
LB_9089:
	bts r12,0
LB_9090:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5818 ⊢ %_5819 : %_5819
 ; {>  %_5818~0':_p1483 }
; _some 0' ⊢ °0◂0'
; _some %_5819 ⊢ %_5820 : %_5820
 ; {>  %_5819~°0◂0':(_opn)◂(_p1483) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5820
 ; {>  %_5820~°0◂°0◂0':(_opn)◂((_opn)◂(_p1483)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9064
	btr r12,3
	jmp LB_9065
LB_9064:
	bts r12,3
LB_9065:
	mov rsi,1
	bt r12,3
	jc LB_9062
	mov rsi,0
	bt r9,0
	jc LB_9062
	jmp LB_9063
LB_9062:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9063:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9066:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9068
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9067
LB_9068:
	add rsp,8
	ret
LB_9069:
	add rsp,32
	pop r14
LB_9067:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_9093
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_5821 : %_5821
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5821 ⊢ %_5822 : %_5822
 ; {>  %_5821~°1◂{  }:(_opn)◂(t2809'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5822
 ; {>  %_5822~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2812'(0))) }
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
	jc LB_9091
	mov rsi,0
	bt r9,0
	jc LB_9091
	jmp LB_9092
LB_9091:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9092:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9093:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9095
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9094
LB_9095:
	add rsp,8
	ret
LB_9096:
	add rsp,0
	pop r14
LB_9094:
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
; word
	jmp LB_9110
LB_9109:
	add r14,1
LB_9110:
	cmp r14,r10
	jge LB_9111
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9109
	cmp al,10
	jz LB_9109
	cmp al,32
	jz LB_9109
LB_9111:
	push r10
	call NS_E_1212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9112
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9104
LB_9112:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_9115
LB_9114:
	add r14,1
LB_9115:
	cmp r14,r10
	jge LB_9116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9114
	cmp al,10
	jz LB_9114
	cmp al,32
	jz LB_9114
LB_9116:
	add r14,1
	cmp r14,r10
	jg LB_9120
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_9120
	jmp LB_9121
LB_9120:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9118
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9118:
	jmp LB_9104
LB_9121:
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
	jc LB_9107
	btr r12,1
	clc
	jmp LB_9108
LB_9107:
	bts r12,1
	stc
LB_9108:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9105
	btr r12,0
	clc
	jmp LB_9106
LB_9105:
	bts r12,0
	stc
LB_9106:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9101
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_5823 ⊢ %_5824 : %_5824
 ; {>  %_5823~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_5824 ⊢ %_5825 : %_5825
 ; {>  %_5824~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5825
 ; {>  %_5825~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9099
	btr r12,3
	jmp LB_9100
LB_9099:
	bts r12,3
LB_9100:
	mov rsi,1
	bt r12,3
	jc LB_9097
	mov rsi,0
	bt r9,0
	jc LB_9097
	jmp LB_9098
LB_9097:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9098:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9101:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9103
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9102
LB_9103:
	add rsp,8
	ret
LB_9104:
	add rsp,32
	pop r14
LB_9102:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_9124
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_5826 : %_5826
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5826 ⊢ %_5827 : %_5827
 ; {>  %_5826~°1◂{  }:(_opn)◂(t2821'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5827
 ; {>  %_5827~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2824'(0))) }
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
	jc LB_9122
	mov rsi,0
	bt r9,0
	jc LB_9122
	jmp LB_9123
LB_9122:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9123:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9124:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9126
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9125
LB_9126:
	add rsp,8
	ret
LB_9127:
	add rsp,0
	pop r14
LB_9125:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9186:
; 	|» { 0' 1' 2' }
NS_E_RDI_9186:
MTC_LB_9187:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9188
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
	jnc LB_9189
	bt QWORD [rdi],0
	jc LB_9190
	btr r12,5
	clc
	jmp LB_9191
LB_9190:
	bts r12,5
	stc
LB_9191:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9189:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9194
	btr r12,6
	clc
	jmp LB_9195
LB_9194:
	bts r12,6
	stc
LB_9195:
	mov r9,rcx
	bt r12,6
	jc LB_9192
	btr r12,3
	jmp LB_9193
LB_9192:
	bts r12,3
LB_9193:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9198
	btr r12,6
	clc
	jmp LB_9199
LB_9198:
	bts r12,6
	stc
LB_9199:
	mov r10,rcx
	bt r12,6
	jc LB_9196
	btr r12,4
	jmp LB_9197
LB_9196:
	bts r12,4
LB_9197:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9200:
	cmp r15,0
	jz LB_9201
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9200
LB_9201:
; _f9172 { %_9173 %_9174 %_9176 } ⊢ { %_9178 %_9179 %_9180 } : { %_9178 %_9179 %_9180 }
 ; {>  %_9177~4':(_lst)◂((_p1432)◂((_p1440)◂(t3494'(-1)))) %_9176~3':(_p1432)◂((_p1440)◂(t3494'(-1))) %_9173~0':_r64 %_9174~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _f9172 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_9204
	btr r12,2
	jmp LB_9205
LB_9204:
	bts r12,2
LB_9205:
	call NS_E_9172
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_9202
	btr r12,4
	clc
	jmp LB_9203
LB_9202:
	bts r12,4
	stc
LB_9203:
	add rsp,16
; _f9186 { %_9178 %_9179 %_9177 } ⊢ { %_9181 %_9182 %_9183 } : { %_9181 %_9182 %_9183 }
 ; {>  %_9178~0':_r64 %_9179~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9177~4':(_lst)◂((_p1432)◂((_p1440)◂(t3494'(-1)))) %_9180~2':(_p1432)◂((_p1440)◂(_r64)) }
; _f9186 { 0' 1' 4' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110010.. |},{ 0' 1' 4' } ⊢ { 0' 1' 2' }
	mov r8,r10
	bt r12,4
	jc LB_9208
	btr r12,2
	jmp LB_9209
LB_9208:
	bts r12,2
LB_9209:
	call NS_E_9186
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 3' }
	mov r9,r8
	bt r12,2
	jc LB_9210
	btr r12,3
	jmp LB_9211
LB_9210:
	bts r12,3
LB_9211:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9206
	btr r12,2
	clc
	jmp LB_9207
LB_9206:
	bts r12,2
	stc
LB_9207:
	add rsp,16
; _cns { %_9180 %_9183 } ⊢ %_9184 : %_9184
 ; {>  %_9181~0':_r64 %_9182~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9183~3':(_lst)◂((_p1432)◂((_p1440)◂(_r64))) %_9180~2':(_p1432)◂((_p1440)◂(_r64)) }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; ∎ { %_9181 %_9182 %_9184 }
 ; {>  %_9181~0':_r64 %_9182~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9184~°0◂{ 2' 3' }:(_lst)◂((_p1432)◂((_p1440)◂(_r64))) }
; 	∎ { 0' 1' °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' °0◂{ 2' 3' } } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_9212
	btr r12,4
	jmp LB_9213
LB_9212:
	bts r12,4
LB_9213:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r10
	bt r12,4
	jc LB_9218
	btr r12,5
	jmp LB_9219
LB_9218:
	bts r12,5
LB_9219:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9216
	btr QWORD [rdi],0
	jmp LB_9217
LB_9216:
	bts QWORD [rdi],0
LB_9217:
	mov r11,r9
	bt r12,3
	jc LB_9222
	btr r12,5
	jmp LB_9223
LB_9222:
	bts r12,5
LB_9223:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9220
	btr QWORD [rdi],1
	jmp LB_9221
LB_9220:
	bts QWORD [rdi],1
LB_9221:
	mov rsi,1
	bt r12,2
	jc LB_9214
	mov rsi,0
	bt r8,0
	jc LB_9214
	jmp LB_9215
LB_9214:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9215:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9188:
	mov r15,0
LB_9225:
	cmp r15,0
	jz LB_9226
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9225
LB_9226:
; _nil {  } ⊢ %_9185 : %_9185
 ; {>  %_9175~2':(_lst)◂((_p1432)◂((_p1440)◂(t3494'(-1)))) %_9173~0':_r64 %_9174~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _nil {  } ⊢ °1◂{  }
; ∎ { %_9173 %_9174 %_9185 }
 ; {>  %_9175~2':(_lst)◂((_p1432)◂((_p1440)◂(t3494'(-1)))) %_9173~0':_r64 %_9185~°1◂{  }:(_lst)◂(t3471'(0)) %_9174~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; 	∎ { 0' 1' °1◂{  } }
	bt r12,2
	jc LB_9227
	mov rdi,r8
	call dlt
LB_9227:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_9228
	mov rsi,0
	bt r8,0
	jc LB_9228
	jmp LB_9229
LB_9228:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9229:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9224:
NS_E_9172:
; 	|» { 0' 1' 2' }
NS_E_RDI_9172:
; _f38 { %_9143 %_9144 %_9145 } ⊢ { %_9146 %_9147 %_9148 } : { %_9146 %_9147 %_9148 }
 ; {>  %_9144~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9145~2':(_p1432)◂((_p1440)◂(t3494'(-1))) %_9143~0':_r64 }
; _f38 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_9230
	btr r12,3
	jmp LB_9231
LB_9230:
	bts r12,3
LB_9231:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_9234
	btr r12,4
	jmp LB_9235
LB_9234:
	bts r12,4
LB_9235:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9232
	btr QWORD [rdi],0
	jmp LB_9233
LB_9232:
	bts QWORD [rdi],0
LB_9233:
	mov r10,r14
	bt r12,1
	jc LB_9238
	btr r12,4
	jmp LB_9239
LB_9238:
	bts r12,4
LB_9239:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9236
	btr QWORD [rdi],1
	jmp LB_9237
LB_9236:
	bts QWORD [rdi],1
LB_9237:
	mov r10,r8
	bt r12,2
	jc LB_9242
	btr r12,4
	jmp LB_9243
LB_9242:
	bts r12,4
LB_9243:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_9240
	btr QWORD [rdi],2
	jmp LB_9241
LB_9240:
	bts QWORD [rdi],2
LB_9241:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_9244
	btr r12,3
	jmp LB_9245
LB_9244:
	bts r12,3
LB_9245:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9248
	btr r12,4
	clc
	jmp LB_9249
LB_9248:
	bts r12,4
	stc
LB_9249:
	mov r13,r10
	bt r12,4
	jc LB_9246
	btr r12,0
	jmp LB_9247
LB_9246:
	bts r12,0
LB_9247:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9252
	btr r12,4
	clc
	jmp LB_9253
LB_9252:
	bts r12,4
	stc
LB_9253:
	mov r14,r10
	bt r12,4
	jc LB_9250
	btr r12,1
	jmp LB_9251
LB_9250:
	bts r12,1
LB_9251:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_9256
	btr r12,4
	clc
	jmp LB_9257
LB_9256:
	bts r12,4
	stc
LB_9257:
	mov r8,r10
	bt r12,4
	jc LB_9254
	btr r12,2
	jmp LB_9255
LB_9254:
	bts r12,2
LB_9255:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_9258:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9259
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
	jnc LB_9260
	bt QWORD [rdi],0
	jc LB_9261
	btr r12,4
	clc
	jmp LB_9262
LB_9261:
	bts r12,4
	stc
LB_9262:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9260:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9263
	btr r12,3
	jmp LB_9264
LB_9263:
	bts r12,3
LB_9264:
LB_9265:
	cmp r15,0
	jz LB_9266
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9265
LB_9266:
; _f9186 { %_9146 %_9147 %_9149 } ⊢ { %_9150 %_9151 %_9152 } : { %_9150 %_9151 %_9152 }
 ; {>  %_9146~0':_r64 %_9147~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9149~3':(_lst)◂((_p1432)◂((_p1440)◂(t3494'(-1)))) }
; _f9186 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_9267
	btr r12,2
	jmp LB_9268
LB_9267:
	bts r12,2
LB_9268:
	call NS_E_9186
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1433 %_9152 ⊢ %_9153 : %_9153
 ; {>  %_9151~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9152~2':(_lst)◂((_p1432)◂((_p1440)◂(_r64))) %_9150~0':_r64 }
; _f1433 2' ⊢ °0◂2'
; ∎ { %_9150 %_9151 %_9153 }
 ; {>  %_9151~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9153~°0◂2':(_p1432)◂((_p1440)◂(_r64)) %_9150~0':_r64 }
; 	∎ { 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' °0◂2' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_9269
	btr r12,3
	jmp LB_9270
LB_9269:
	bts r12,3
LB_9270:
	mov r8,r9
	bt r12,3
	jc LB_9273
	btr r12,2
	jmp LB_9274
LB_9273:
	bts r12,2
LB_9274:
	mov rsi,1
	bt r12,2
	jc LB_9271
	mov rsi,0
	bt r8,0
	jc LB_9271
	jmp LB_9272
LB_9271:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9272:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9259:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9275
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
	jnc LB_9276
	bt QWORD [rdi],0
	jc LB_9277
	btr r12,4
	clc
	jmp LB_9278
LB_9277:
	bts r12,4
	stc
LB_9278:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9276:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9279
	btr r12,3
	jmp LB_9280
LB_9279:
	bts r12,3
LB_9280:
LB_9281:
	cmp r15,0
	jz LB_9282
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9281
LB_9282:
MTC_LB_9283:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9284
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
	jnc LB_9285
	bt QWORD [rdi],0
	jc LB_9286
	btr r12,4
	clc
	jmp LB_9287
LB_9286:
	bts r12,4
	stc
LB_9287:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9285:
	mov r10,rdi
	mov r8,r10
	bt r12,4
	jc LB_9288
	btr r12,2
	jmp LB_9289
LB_9288:
	bts r12,2
LB_9289:
LB_9290:
	cmp r15,0
	jz LB_9291
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9290
LB_9291:
; _f38 { %_9155 %_9146 } ⊢ { %_9156 %_9157 } : { %_9156 %_9157 }
 ; {>  %_9146~0':_r64 %_9155~2':t3494'(-1) %_9147~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _f38 { 2' 0' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 2' 0' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_9294
	btr r12,1
	jmp LB_9295
LB_9294:
	bts r12,1
LB_9295:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_9298
	btr r12,3
	jmp LB_9299
LB_9298:
	bts r12,3
LB_9299:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_9296
	btr QWORD [rdi],0
	jmp LB_9297
LB_9296:
	bts QWORD [rdi],0
LB_9297:
	mov r9,r14
	bt r12,1
	jc LB_9302
	btr r12,3
	jmp LB_9303
LB_9302:
	bts r12,3
LB_9303:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_9300
	btr QWORD [rdi],1
	jmp LB_9301
LB_9300:
	bts QWORD [rdi],1
LB_9301:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 2' }
	mov r14,r13
	bt r12,0
	jc LB_9304
	btr r12,1
	jmp LB_9305
LB_9304:
	bts r12,1
LB_9305:
; 1' ⊢ { 0' 2' }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_9308
	btr r12,3
	clc
	jmp LB_9309
LB_9308:
	bts r12,3
	stc
LB_9309:
	mov r13,r9
	bt r12,3
	jc LB_9306
	btr r12,0
	jmp LB_9307
LB_9306:
	bts r12,0
LB_9307:
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_9312
	btr r12,3
	clc
	jmp LB_9313
LB_9312:
	bts r12,3
	stc
LB_9313:
	mov r8,r9
	bt r12,3
	jc LB_9310
	btr r12,2
	jmp LB_9311
LB_9310:
	bts r12,2
LB_9311:
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9292
	btr r12,1
	clc
	jmp LB_9293
LB_9292:
	bts r12,1
	stc
LB_9293:
	add rsp,16
; _f710 { %_9147 %_9156 } ⊢ { %_9158 %_9159 %_9160 } : { %_9158 %_9159 %_9160 }
 ; {>  %_9156~0':t3494'(-1) %_9147~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9157~2':_r64 }
; _f710 { 1' 0' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_9316
	btr r12,2
	jmp LB_9317
LB_9316:
	bts r12,2
LB_9317:
	mov r14,r13
	bt r12,0
	jc LB_9318
	btr r12,1
	jmp LB_9319
LB_9318:
	bts r12,1
LB_9319:
	mov r13,r8
	bt r12,2
	jc LB_9320
	btr r12,0
	jmp LB_9321
LB_9320:
	bts r12,0
LB_9321:
	call NS_E_710
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 3' }
	mov r9,r8
	bt r12,2
	jc LB_9322
	btr r12,3
	jmp LB_9323
LB_9322:
	bts r12,3
LB_9323:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9314
	btr r12,2
	clc
	jmp LB_9315
LB_9314:
	bts r12,2
	stc
LB_9315:
	add rsp,16
MTC_LB_9324:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9325
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
	jnc LB_9326
	bt QWORD [rdi],0
	jc LB_9327
	btr r12,4
	clc
	jmp LB_9328
LB_9327:
	bts r12,4
	stc
LB_9328:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9326:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9329:
	cmp r15,0
	jz LB_9330
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9329
LB_9330:
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ 3'
	mov r9,r8
	bt r12,2
	jc LB_9331
	btr r12,3
	jmp LB_9332
LB_9331:
	bts r12,3
LB_9332:
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_9339
	btr r12,4
	clc
	jmp LB_9340
LB_9339:
	bts r12,4
	stc
LB_9340:
	call dcp
	mov r10,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9337
	btr r12,3
	clc
	jmp LB_9338
LB_9337:
	bts r12,3
	stc
LB_9338:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9335
	btr r12,1
	clc
	jmp LB_9336
LB_9335:
	bts r12,1
	stc
LB_9336:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9333
	btr r12,0
	clc
	jmp LB_9334
LB_9333:
	bts r12,0
	stc
LB_9334:
	add rsp,32
; _some %_9162 ⊢ %_9163 : %_9163
 ; {>  %_9161~3':_r64 %_9162~4':_r64 %_9159~1':t3494'(-1) %_9158~0':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _some 4' ⊢ °0◂4'
; _cns { { %_9159 %_9163 } %_9158 } ⊢ %_9164 : %_9164
 ; {>  %_9161~3':_r64 %_9163~°0◂4':(_opn)◂(_r64) %_9159~1':t3494'(-1) %_9158~0':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _cns { { 1' °0◂4' } 0' } ⊢ °0◂{ { 1' °0◂4' } 0' }
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ 2'
	mov r8,r9
	bt r12,3
	jc LB_9341
	btr r12,2
	jmp LB_9342
LB_9341:
	bts r12,2
LB_9342:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r8
	bt r12,2
	jc LB_9351
	btr r12,5
	clc
	jmp LB_9352
LB_9351:
	bts r12,5
	stc
LB_9352:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9349
	btr r12,4
	clc
	jmp LB_9350
LB_9349:
	bts r12,4
	stc
LB_9350:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9347
	btr r12,2
	clc
	jmp LB_9348
LB_9347:
	bts r12,2
	stc
LB_9348:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9345
	btr r12,1
	clc
	jmp LB_9346
LB_9345:
	bts r12,1
	stc
LB_9346:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9343
	btr r12,0
	clc
	jmp LB_9344
LB_9343:
	bts r12,0
	stc
LB_9344:
	add rsp,40
; _f1444 %_9166 ⊢ %_9167 : %_9167
 ; {>  %_9166~5':_r64 %_9165~2':_r64 %_9164~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _f1444 5' ⊢ °1◂5'
; _f56 %_9165 ⊢ %_9168 : %_9168
 ; {>  %_9165~2':_r64 %_9164~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9167~°1◂5':(_p1440)◂(_r64) }
	add r8,1
; _f1434 %_9167 ⊢ %_9169 : %_9169
 ; {>  %_9168~2':_r64 %_9164~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) %_9167~°1◂5':(_p1440)◂(_r64) }
; _f1434 °1◂5' ⊢ °1◂°1◂5'
; ∎ { %_9168 %_9164 %_9169 }
 ; {>  %_9168~2':_r64 %_9169~°1◂°1◂5':(_p1432)◂((_p1440)◂(_r64)) %_9164~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; 	∎ { 2' °0◂{ { 1' °0◂4' } 0' } °1◂°1◂5' }
; _emt_mov_ptn_to_ptn:{| 1110110.. |},{ 2' °0◂{ { 1' °0◂4' } 0' } °1◂°1◂5' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_9353
	btr r12,3
	jmp LB_9354
LB_9353:
	bts r12,3
LB_9354:
	mov r8,r11
	bt r12,5
	jc LB_9359
	btr r12,2
	jmp LB_9360
LB_9359:
	bts r12,2
LB_9360:
	mov rsi,1
	bt r12,2
	jc LB_9357
	mov rsi,0
	bt r8,0
	jc LB_9357
	jmp LB_9358
LB_9357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9358:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_9355
	mov rsi,0
	bt r8,0
	jc LB_9355
	jmp LB_9356
LB_9355:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9356:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov r11,r14
	bt r12,1
	jc LB_9361
	btr r12,5
	jmp LB_9362
LB_9361:
	bts r12,5
LB_9362:
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
	jc LB_9369
	btr r12,7
	jmp LB_9370
LB_9369:
	bts r12,7
LB_9370:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_9367
	btr QWORD [rdi],0
	jmp LB_9368
LB_9367:
	bts QWORD [rdi],0
LB_9368:
	mov rdx,r10
	bt r12,4
	jc LB_9375
	btr r12,7
	jmp LB_9376
LB_9375:
	bts r12,7
LB_9376:
	mov rsi,1
	bt r12,7
	jc LB_9373
	mov rsi,0
	bt rdx,0
	jc LB_9373
	jmp LB_9374
LB_9373:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_9374:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_9371
	btr QWORD [rdi],1
	jmp LB_9372
LB_9371:
	bts QWORD [rdi],1
LB_9372:
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9365
	btr QWORD [rdi],0
	jmp LB_9366
LB_9365:
	bts QWORD [rdi],0
LB_9366:
	mov rcx,r13
	bt r12,0
	jc LB_9379
	btr r12,6
	jmp LB_9380
LB_9379:
	bts r12,6
LB_9380:
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9377
	btr QWORD [rdi],1
	jmp LB_9378
LB_9377:
	bts QWORD [rdi],1
LB_9378:
	mov rsi,1
	bt r12,1
	jc LB_9363
	mov rsi,0
	bt r14,0
	jc LB_9363
	jmp LB_9364
LB_9363:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9364:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r9
	bt r12,3
	jc LB_9381
	btr r12,0
	jmp LB_9382
LB_9381:
	bts r12,0
LB_9382:
	ret
MTC_LB_9325:
	mov r15,0
LB_9384:
	cmp r15,0
	jz LB_9385
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9384
LB_9385:
	jmp err
MTC_LB_9383:
MTC_LB_9284:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9386
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
	jnc LB_9387
	bt QWORD [rdi],0
	jc LB_9388
	btr r12,2
	clc
	jmp LB_9389
LB_9388:
	bts r12,2
	stc
LB_9389:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9387:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9390:
	cmp r15,0
	jz LB_9391
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9390
LB_9391:
; _f1443 {  } ⊢ %_9170 : %_9170
 ; {>  %_9146~0':_r64 %_9147~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _f1443 {  } ⊢ °0◂{  }
; _f1434 %_9170 ⊢ %_9171 : %_9171
 ; {>  %_9170~°0◂{  }:(_p1440)◂(t3522'(0)) %_9146~0':_r64 %_9147~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
; _f1434 °0◂{  } ⊢ °1◂°0◂{  }
; ∎ { %_9146 %_9147 %_9171 }
 ; {>  %_9146~0':_r64 %_9171~°1◂°0◂{  }:(_p1432)◂((_p1440)◂(t3525'(0))) %_9147~1':(_lst)◂({ t3494'(-1) (_opn)◂(_r64) }) }
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
	jc LB_9394
	mov rsi,0
	bt r8,0
	jc LB_9394
	jmp LB_9395
LB_9394:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9395:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_9392
	mov rsi,0
	bt r8,0
	jc LB_9392
	jmp LB_9393
LB_9392:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9393:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9386:
MTC_LB_9275:
NS_E_9431:
; 	|» { 0' 1' 2' }
NS_E_RDI_9431:
MTC_LB_9432:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9433
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
	jnc LB_9434
	bt QWORD [rdi],0
	jc LB_9435
	btr r12,5
	clc
	jmp LB_9436
LB_9435:
	bts r12,5
	stc
LB_9436:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9434:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9439
	btr r12,6
	clc
	jmp LB_9440
LB_9439:
	bts r12,6
	stc
LB_9440:
	mov r9,rcx
	bt r12,6
	jc LB_9437
	btr r12,3
	jmp LB_9438
LB_9437:
	bts r12,3
LB_9438:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9443
	btr r12,6
	clc
	jmp LB_9444
LB_9443:
	bts r12,6
	stc
LB_9444:
	mov r10,rcx
	bt r12,6
	jc LB_9441
	btr r12,4
	jmp LB_9442
LB_9441:
	bts r12,4
LB_9442:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9445:
	cmp r15,0
	jz LB_9446
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9445
LB_9446:
; _f9417 { %_9418 %_9419 %_9421 } ⊢ { %_9423 %_9424 %_9425 } : { %_9423 %_9424 %_9425 }
 ; {>  %_9421~3':(_p1432)◂((_p1439)◂(t3635'(-1))) %_9419~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9418~0':t3627'(-1) %_9422~4':(_lst)◂((_p1432)◂((_p1439)◂(t3635'(-1)))) }
; _f9417 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_9449
	btr r12,2
	jmp LB_9450
LB_9449:
	bts r12,2
LB_9450:
	call NS_E_9417
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_9447
	btr r12,4
	clc
	jmp LB_9448
LB_9447:
	bts r12,4
	stc
LB_9448:
	add rsp,16
; _f9431 { %_9423 %_9424 %_9422 } ⊢ { %_9426 %_9427 %_9428 } : { %_9426 %_9427 %_9428 }
 ; {>  %_9424~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9425~2':(_p1432)◂((_p1439)◂(t3664'(-1))) %_9423~0':t3627'(-1) %_9422~4':(_lst)◂((_p1432)◂((_p1439)◂(t3635'(-1)))) }
; _f9431 { 0' 1' 4' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110010.. |},{ 0' 1' 4' } ⊢ { 0' 1' 2' }
	mov r8,r10
	bt r12,4
	jc LB_9453
	btr r12,2
	jmp LB_9454
LB_9453:
	bts r12,2
LB_9454:
	call NS_E_9431
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 3' }
	mov r9,r8
	bt r12,2
	jc LB_9455
	btr r12,3
	jmp LB_9456
LB_9455:
	bts r12,3
LB_9456:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9451
	btr r12,2
	clc
	jmp LB_9452
LB_9451:
	bts r12,2
	stc
LB_9452:
	add rsp,16
; _cns { %_9425 %_9428 } ⊢ %_9429 : %_9429
 ; {>  %_9425~2':(_p1432)◂((_p1439)◂(t3664'(-1))) %_9428~3':(_lst)◂((_p1432)◂((_p1439)◂(t3664'(-1)))) %_9427~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9426~0':t3627'(-1) }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; ∎ { %_9426 %_9427 %_9429 }
 ; {>  %_9429~°0◂{ 2' 3' }:(_lst)◂((_p1432)◂((_p1439)◂(t3664'(-1)))) %_9427~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9426~0':t3627'(-1) }
; 	∎ { 0' 1' °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' °0◂{ 2' 3' } } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_9457
	btr r12,4
	jmp LB_9458
LB_9457:
	bts r12,4
LB_9458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r10
	bt r12,4
	jc LB_9463
	btr r12,5
	jmp LB_9464
LB_9463:
	bts r12,5
LB_9464:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9461
	btr QWORD [rdi],0
	jmp LB_9462
LB_9461:
	bts QWORD [rdi],0
LB_9462:
	mov r11,r9
	bt r12,3
	jc LB_9467
	btr r12,5
	jmp LB_9468
LB_9467:
	bts r12,5
LB_9468:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9465
	btr QWORD [rdi],1
	jmp LB_9466
LB_9465:
	bts QWORD [rdi],1
LB_9466:
	mov rsi,1
	bt r12,2
	jc LB_9459
	mov rsi,0
	bt r8,0
	jc LB_9459
	jmp LB_9460
LB_9459:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9460:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9433:
	mov r15,0
LB_9470:
	cmp r15,0
	jz LB_9471
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9470
LB_9471:
; _nil {  } ⊢ %_9430 : %_9430
 ; {>  %_9420~2':(_lst)◂((_p1432)◂((_p1439)◂(t3635'(-1)))) %_9419~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9418~0':t3627'(-1) }
; _nil {  } ⊢ °1◂{  }
; ∎ { %_9418 %_9419 %_9430 }
 ; {>  %_9420~2':(_lst)◂((_p1432)◂((_p1439)◂(t3635'(-1)))) %_9419~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9430~°1◂{  }:(_lst)◂(t3616'(0)) %_9418~0':t3627'(-1) }
; 	∎ { 0' 1' °1◂{  } }
	bt r12,2
	jc LB_9472
	mov rdi,r8
	call dlt
LB_9472:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_9473
	mov rsi,0
	bt r8,0
	jc LB_9473
	jmp LB_9474
LB_9473:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9474:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9469:
NS_E_9417:
; 	|» { 0' 1' 2' }
NS_E_RDI_9417:
MTC_LB_9475:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9476
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
	jnc LB_9477
	bt QWORD [rdi],0
	jc LB_9478
	btr r12,4
	clc
	jmp LB_9479
LB_9478:
	bts r12,4
	stc
LB_9479:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9477:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9480
	btr r12,3
	jmp LB_9481
LB_9480:
	bts r12,3
LB_9481:
LB_9482:
	cmp r15,0
	jz LB_9483
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9482
LB_9483:
; _f9431 { %_9396 %_9397 %_9399 } ⊢ { %_9400 %_9401 %_9402 } : { %_9400 %_9401 %_9402 }
 ; {>  %_9397~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9399~3':(_lst)◂((_p1432)◂((_p1439)◂(t3635'(-1)))) %_9396~0':t3627'(-1) }
; _f9431 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_9484
	btr r12,2
	jmp LB_9485
LB_9484:
	bts r12,2
LB_9485:
	call NS_E_9431
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1433 %_9402 ⊢ %_9403 : %_9403
 ; {>  %_9402~2':(_lst)◂((_p1432)◂((_p1439)◂(t3664'(-1)))) %_9401~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9400~0':t3627'(-1) }
; _f1433 2' ⊢ °0◂2'
; ∎ { %_9400 %_9401 %_9403 }
 ; {>  %_9401~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9400~0':t3627'(-1) %_9403~°0◂2':(_p1432)◂((_p1439)◂(t3664'(-1))) }
; 	∎ { 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' °0◂2' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_9486
	btr r12,3
	jmp LB_9487
LB_9486:
	bts r12,3
LB_9487:
	mov r8,r9
	bt r12,3
	jc LB_9490
	btr r12,2
	jmp LB_9491
LB_9490:
	bts r12,2
LB_9491:
	mov rsi,1
	bt r12,2
	jc LB_9488
	mov rsi,0
	bt r8,0
	jc LB_9488
	jmp LB_9489
LB_9488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9489:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9476:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9492
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
	jnc LB_9493
	bt QWORD [rdi],0
	jc LB_9494
	btr r12,4
	clc
	jmp LB_9495
LB_9494:
	bts r12,4
	stc
LB_9495:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9493:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_9496
	btr r12,3
	jmp LB_9497
LB_9496:
	bts r12,3
LB_9497:
LB_9498:
	cmp r15,0
	jz LB_9499
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9498
LB_9499:
MTC_LB_9500:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9501
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
	jnc LB_9502
	bt QWORD [rdi],0
	jc LB_9503
	btr r12,4
	clc
	jmp LB_9504
LB_9503:
	bts r12,4
	stc
LB_9504:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9502:
	mov r10,rdi
	mov r8,r10
	bt r12,4
	jc LB_9505
	btr r12,2
	jmp LB_9506
LB_9505:
	bts r12,2
LB_9506:
LB_9507:
	cmp r15,0
	jz LB_9508
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9507
LB_9508:
; _f710 { %_9397 %_9405 } ⊢ { %_9406 %_9407 %_9408 } : { %_9406 %_9407 %_9408 }
 ; {>  %_9397~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9396~0':t3627'(-1) %_9405~2':t3635'(-1) }
; _f710 { 1' 2' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_9511
	btr r12,0
	jmp LB_9512
LB_9511:
	bts r12,0
LB_9512:
	mov r14,r8
	bt r12,2
	jc LB_9513
	btr r12,1
	jmp LB_9514
LB_9513:
	bts r12,1
LB_9514:
	call NS_E_710
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 1' 2' 3' }
	mov r9,r8
	bt r12,2
	jc LB_9515
	btr r12,3
	jmp LB_9516
LB_9515:
	bts r12,3
LB_9516:
	mov r8,r14
	bt r12,1
	jc LB_9517
	btr r12,2
	jmp LB_9518
LB_9517:
	bts r12,2
LB_9518:
	mov r14,r13
	bt r12,0
	jc LB_9519
	btr r12,1
	jmp LB_9520
LB_9519:
	bts r12,1
LB_9520:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9509
	btr r12,0
	clc
	jmp LB_9510
LB_9509:
	bts r12,0
	stc
LB_9510:
	add rsp,16
MTC_LB_9521:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9522
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
	jnc LB_9523
	bt QWORD [rdi],0
	jc LB_9524
	btr r12,5
	clc
	jmp LB_9525
LB_9524:
	bts r12,5
	stc
LB_9525:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9523:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_9526
	btr r12,4
	jmp LB_9527
LB_9526:
	bts r12,4
LB_9527:
LB_9528:
	cmp r15,0
	jz LB_9529
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9528
LB_9529:
; _f1442 %_9409 ⊢ %_9410 : %_9410
 ; {>  %_9396~0':t3627'(-1) %_9406~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9409~4':t3664'(-1) %_9407~2':t3635'(-1) }
; _f1442 4' ⊢ °1◂4'
; _f1434 %_9410 ⊢ %_9411 : %_9411
 ; {>  %_9396~0':t3627'(-1) %_9410~°1◂4':(_p1439)◂(t3664'(-1)) %_9406~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9407~2':t3635'(-1) }
; _f1434 °1◂4' ⊢ °1◂°1◂4'
; _none {  } ⊢ %_9412 : %_9412
 ; {>  %_9396~0':t3627'(-1) %_9406~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9411~°1◂°1◂4':(_p1432)◂((_p1439)◂(t3664'(-1))) %_9407~2':t3635'(-1) }
; _none {  } ⊢ °1◂{  }
; _cns { { %_9407 %_9412 } %_9406 } ⊢ %_9413 : %_9413
 ; {>  %_9412~°1◂{  }:(_opn)◂(t3650'(0)) %_9396~0':t3627'(-1) %_9406~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9411~°1◂°1◂4':(_p1432)◂((_p1439)◂(t3664'(-1))) %_9407~2':t3635'(-1) }
; _cns { { 2' °1◂{  } } 1' } ⊢ °0◂{ { 2' °1◂{  } } 1' }
; ∎ { %_9396 %_9413 %_9411 }
 ; {>  %_9396~0':t3627'(-1) %_9413~°0◂{ { 2' °1◂{  } } 1' }:(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9411~°1◂°1◂4':(_p1432)◂((_p1439)◂(t3664'(-1))) }
; 	∎ { 0' °0◂{ { 2' °1◂{  } } 1' } °1◂°1◂4' }
; _emt_mov_ptn_to_ptn:{| 111010.. |},{ 0' °0◂{ { 2' °1◂{  } } 1' } °1◂°1◂4' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_9530
	btr r12,3
	jmp LB_9531
LB_9530:
	bts r12,3
LB_9531:
	mov r8,r10
	bt r12,4
	jc LB_9536
	btr r12,2
	jmp LB_9537
LB_9536:
	bts r12,2
LB_9537:
	mov rsi,1
	bt r12,2
	jc LB_9534
	mov rsi,0
	bt r8,0
	jc LB_9534
	jmp LB_9535
LB_9534:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9535:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_9532
	mov rsi,0
	bt r8,0
	jc LB_9532
	jmp LB_9533
LB_9532:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9533:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov r10,r14
	bt r12,1
	jc LB_9538
	btr r12,4
	jmp LB_9539
LB_9538:
	bts r12,4
LB_9539:
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
	mov r11,rax
	btr r12,5
	mov rcx,r9
	bt r12,3
	jc LB_9546
	btr r12,6
	jmp LB_9547
LB_9546:
	bts r12,6
LB_9547:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9544
	btr QWORD [rdi],0
	jmp LB_9545
LB_9544:
	bts QWORD [rdi],0
LB_9545:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rsi,1
	bt r12,6
	jc LB_9550
	mov rsi,0
	bt rcx,0
	jc LB_9550
	jmp LB_9551
LB_9550:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_9551:
	mov rax,0x0100_0000_0000_0001
	or rcx,rax
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9548
	btr QWORD [rdi],1
	jmp LB_9549
LB_9548:
	bts QWORD [rdi],1
LB_9549:
	mov rdi,r14
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9542
	btr QWORD [rdi],0
	jmp LB_9543
LB_9542:
	bts QWORD [rdi],0
LB_9543:
	mov r11,r10
	bt r12,4
	jc LB_9554
	btr r12,5
	jmp LB_9555
LB_9554:
	bts r12,5
LB_9555:
	mov rdi,r14
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9552
	btr QWORD [rdi],1
	jmp LB_9553
LB_9552:
	bts QWORD [rdi],1
LB_9553:
	mov rsi,1
	bt r12,1
	jc LB_9540
	mov rsi,0
	bt r14,0
	jc LB_9540
	jmp LB_9541
LB_9540:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_9541:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_9522:
	mov r15,0
LB_9557:
	cmp r15,0
	jz LB_9558
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9557
LB_9558:
	jmp err
MTC_LB_9556:
MTC_LB_9501:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9559
; _emt_mov_ptn_to_ptn:{| 11010.. |},3' ⊢ °0◂2'
; 3' ⊢ °0◂2'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_9560
	bt QWORD [rdi],0
	jc LB_9561
	btr r12,4
	clc
	jmp LB_9562
LB_9561:
	bts r12,4
	stc
LB_9562:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9560:
	mov r10,rdi
	mov r8,r10
	bt r12,4
	jc LB_9563
	btr r12,2
	jmp LB_9564
LB_9563:
	bts r12,2
LB_9564:
LB_9565:
	cmp r15,0
	jz LB_9566
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9565
LB_9566:
; _f1441 %_9414 ⊢ %_9415 : %_9415
 ; {>  %_9397~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9396~0':t3627'(-1) %_9414~2':_p1435 }
; _f1441 2' ⊢ °0◂2'
; _f1434 %_9415 ⊢ %_9416 : %_9416
 ; {>  %_9397~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9396~0':t3627'(-1) %_9415~°0◂2':(_p1439)◂(t3658'(0)) }
; _f1434 °0◂2' ⊢ °1◂°0◂2'
; ∎ { %_9396 %_9397 %_9416 }
 ; {>  %_9397~1':(_lst)◂({ t3635'(-1) (_opn)◂(t3664'(-1)) }) %_9396~0':t3627'(-1) %_9416~°1◂°0◂2':(_p1432)◂((_p1439)◂(t3661'(0))) }
; 	∎ { 0' 1' °1◂°0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' °1◂°0◂2' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_9567
	btr r12,3
	jmp LB_9568
LB_9567:
	bts r12,3
LB_9568:
	mov r8,r9
	bt r12,3
	jc LB_9573
	btr r12,2
	jmp LB_9574
LB_9573:
	bts r12,2
LB_9574:
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
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_9569
	mov rsi,0
	bt r8,0
	jc LB_9569
	jmp LB_9570
LB_9569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9570:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_9559:
MTC_LB_9492:
NS_E_9607:
; 	|» { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
NS_E_RDI_9607:
; ∎ { %_9598 %_9599 %_9600 %_9601 %_9602 %_9603 %_9604 %_9605 }
 ; {>  %_9606~8':t3741'(-1) %_9605~7':_r64 %_9601~3':_r64 %_9604~6':(_p0)◂(t3775'(-1)) %_9599~1':_r64 %_9598~0':(_p0)◂(t3772'(-1)) %_9600~2':(_p0)◂(t3773'(-1)) %_9602~4':(_p0)◂(t3774'(-1)) %_9603~5':_r64 }
; 	∎ { 0' 1' 2' 3' 4' 5' 6' 7' }
	bt r12,8
	jc LB_9608
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_9608:
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	ret
NS_E_9597:
; 	|» 0'
NS_E_RDI_9597:
; » 0xrc8 |~ {  } ⊢ %_9576 : %_9576
 ; {>  %_9575~0':t3741'(-1) }
; 	» 0xrc8 _ ⊢ 1' : %_9576
	mov rdi,0xc8
	mov r14,rdi
	bts r12,1
; _f20 %_9576 ⊢ { %_9577 %_9578 } : { %_9577 %_9578 }
 ; {>  %_9575~0':t3741'(-1) %_9576~1':_r64 }
; _f20 1' ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9611
	btr r12,0
	jmp LB_9612
LB_9611:
	bts r12,0
LB_9612:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_9613
	btr r12,2
	jmp LB_9614
LB_9613:
	bts r12,2
LB_9614:
	mov r14,r13
	bt r12,0
	jc LB_9615
	btr r12,1
	jmp LB_9616
LB_9615:
	bts r12,1
LB_9616:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9609
	btr r12,0
	clc
	jmp LB_9610
LB_9609:
	bts r12,0
	stc
LB_9610:
	add rsp,16
; _f20 %_9577 ⊢ { %_9579 %_9580 } : { %_9579 %_9580 }
 ; {>  %_9577~1':_r64 %_9575~0':t3741'(-1) %_9578~2':(_p0)◂(t3756'(0)) }
; _f20 1' ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9621
	btr r12,0
	jmp LB_9622
LB_9621:
	bts r12,0
LB_9622:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_9623
	btr r12,3
	jmp LB_9624
LB_9623:
	bts r12,3
LB_9624:
	mov r14,r13
	bt r12,0
	jc LB_9625
	btr r12,1
	jmp LB_9626
LB_9625:
	bts r12,1
LB_9626:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9619
	btr r12,2
	clc
	jmp LB_9620
LB_9619:
	bts r12,2
	stc
LB_9620:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9617
	btr r12,0
	clc
	jmp LB_9618
LB_9617:
	bts r12,0
	stc
LB_9618:
	add rsp,24
; _f20 %_9579 ⊢ { %_9581 %_9582 } : { %_9581 %_9582 }
 ; {>  %_9575~0':t3741'(-1) %_9579~1':_r64 %_9580~3':(_p0)◂(t3759'(0)) %_9578~2':(_p0)◂(t3756'(0)) }
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
	jc LB_9633
	btr r12,0
	jmp LB_9634
LB_9633:
	bts r12,0
LB_9634:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 4' }
	mov r10,r14
	bt r12,1
	jc LB_9635
	btr r12,4
	jmp LB_9636
LB_9635:
	bts r12,4
LB_9636:
	mov r14,r13
	bt r12,0
	jc LB_9637
	btr r12,1
	jmp LB_9638
LB_9637:
	bts r12,1
LB_9638:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9631
	btr r12,3
	clc
	jmp LB_9632
LB_9631:
	bts r12,3
	stc
LB_9632:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9629
	btr r12,2
	clc
	jmp LB_9630
LB_9629:
	bts r12,2
	stc
LB_9630:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9627
	btr r12,0
	clc
	jmp LB_9628
LB_9627:
	bts r12,0
	stc
LB_9628:
	add rsp,32
; _f20 %_9581 ⊢ { %_9583 %_9584 } : { %_9583 %_9584 }
 ; {>  %_9582~4':(_p0)◂(t3762'(0)) %_9575~0':t3741'(-1) %_9581~1':_r64 %_9580~3':(_p0)◂(t3759'(0)) %_9578~2':(_p0)◂(t3756'(0)) }
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
	jc LB_9647
	btr r12,0
	jmp LB_9648
LB_9647:
	bts r12,0
LB_9648:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_9649
	btr r12,5
	jmp LB_9650
LB_9649:
	bts r12,5
LB_9650:
	mov r14,r13
	bt r12,0
	jc LB_9651
	btr r12,1
	jmp LB_9652
LB_9651:
	bts r12,1
LB_9652:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9645
	btr r12,4
	clc
	jmp LB_9646
LB_9645:
	bts r12,4
	stc
LB_9646:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9643
	btr r12,3
	clc
	jmp LB_9644
LB_9643:
	bts r12,3
	stc
LB_9644:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9641
	btr r12,2
	clc
	jmp LB_9642
LB_9641:
	bts r12,2
	stc
LB_9642:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9639
	btr r12,0
	clc
	jmp LB_9640
LB_9639:
	bts r12,0
	stc
LB_9640:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_9585 : %_9585
 ; {>  %_9582~4':(_p0)◂(t3762'(0)) %_9575~0':t3741'(-1) %_9580~3':(_p0)◂(t3759'(0)) %_9584~5':(_p0)◂(t3765'(0)) %_9583~1':_r64 %_9578~2':(_p0)◂(t3756'(0)) }
; 	» 0xr0 _ ⊢ 6' : %_9585
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; » 0xr0 |~ {  } ⊢ %_9586 : %_9586
 ; {>  %_9582~4':(_p0)◂(t3762'(0)) %_9575~0':t3741'(-1) %_9580~3':(_p0)◂(t3759'(0)) %_9584~5':(_p0)◂(t3765'(0)) %_9585~6':_r64 %_9583~1':_r64 %_9578~2':(_p0)◂(t3756'(0)) }
; 	» 0xr0 _ ⊢ 7' : %_9586
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; » 0xr0 |~ {  } ⊢ %_9587 : %_9587
 ; {>  %_9586~7':_r64 %_9582~4':(_p0)◂(t3762'(0)) %_9575~0':t3741'(-1) %_9580~3':(_p0)◂(t3759'(0)) %_9584~5':(_p0)◂(t3765'(0)) %_9585~6':_r64 %_9583~1':_r64 %_9578~2':(_p0)◂(t3756'(0)) }
; 	» 0xr0 _ ⊢ 8' : %_9587
	mov QWORD [st_vct+8*8],0x0
	bts r12,8
; » 0xr0 |~ {  } ⊢ %_9588 : %_9588
 ; {>  %_9586~7':_r64 %_9582~4':(_p0)◂(t3762'(0)) %_9575~0':t3741'(-1) %_9587~8':_r64 %_9580~3':(_p0)◂(t3759'(0)) %_9584~5':(_p0)◂(t3765'(0)) %_9585~6':_r64 %_9583~1':_r64 %_9578~2':(_p0)◂(t3756'(0)) }
; 	» 0xr0 _ ⊢ 9' : %_9588
	mov QWORD [st_vct+8*9],0x0
	bts r12,9
; _f9607 { %_9578 %_9585 %_9580 %_9586 %_9582 %_9587 %_9584 %_9588 %_9575 } ⊢ { %_9589 %_9590 %_9591 %_9592 %_9593 %_9594 %_9595 %_9596 } : { %_9589 %_9590 %_9591 %_9592 %_9593 %_9594 %_9595 %_9596 }
 ; {>  %_9586~7':_r64 %_9582~4':(_p0)◂(t3762'(0)) %_9575~0':t3741'(-1) %_9587~8':_r64 %_9580~3':(_p0)◂(t3759'(0)) %_9584~5':(_p0)◂(t3765'(0)) %_9585~6':_r64 %_9588~9':_r64 %_9583~1':_r64 %_9578~2':(_p0)◂(t3756'(0)) }
; _f9607 { 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10111111110.. |},{ 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
	mov r14,rcx
	bt r12,6
	jc LB_9655
	btr r12,1
	jmp LB_9656
LB_9655:
	bts r12,1
LB_9656:
	mov rcx,r11
	bt r12,5
	jc LB_9657
	btr r12,6
	jmp LB_9658
LB_9657:
	bts r12,6
LB_9658:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9659
	btr r12,5
	jmp LB_9660
LB_9659:
	bts r12,5
LB_9660:
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_9661
	btr r12,8
	jmp LB_9662
LB_9661:
	bts r12,8
LB_9662:
	mov r13,r8
	bt r12,2
	jc LB_9663
	btr r12,0
	jmp LB_9664
LB_9663:
	bts r12,0
LB_9664:
	mov r8,r9
	bt r12,3
	jc LB_9665
	btr r12,2
	jmp LB_9666
LB_9665:
	bts r12,2
LB_9666:
	mov r9,rdx
	bt r12,7
	jc LB_9667
	btr r12,3
	jmp LB_9668
LB_9667:
	bts r12,3
LB_9668:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_9669
	btr r12,7
	jmp LB_9670
LB_9669:
	bts r12,7
LB_9670:
	call NS_E_9607
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
	mov rdi,rdx
	mov QWORD [st_vct+8*8],rdi
	bt r12,7
	jc LB_9671
	btr r12,8
	jmp LB_9672
LB_9671:
	bts r12,8
LB_9672:
	mov rdx,rcx
	bt r12,6
	jc LB_9673
	btr r12,7
	jmp LB_9674
LB_9673:
	bts r12,7
LB_9674:
	mov rcx,r11
	bt r12,5
	jc LB_9675
	btr r12,6
	jmp LB_9676
LB_9675:
	bts r12,6
LB_9676:
	mov r11,r10
	bt r12,4
	jc LB_9677
	btr r12,5
	jmp LB_9678
LB_9677:
	bts r12,5
LB_9678:
	mov r10,r9
	bt r12,3
	jc LB_9679
	btr r12,4
	jmp LB_9680
LB_9679:
	bts r12,4
LB_9680:
	mov r9,r8
	bt r12,2
	jc LB_9681
	btr r12,3
	jmp LB_9682
LB_9681:
	bts r12,3
LB_9682:
	mov r8,r14
	bt r12,1
	jc LB_9683
	btr r12,2
	jmp LB_9684
LB_9683:
	bts r12,2
LB_9684:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9653
	btr r12,1
	clc
	jmp LB_9654
LB_9653:
	bts r12,1
	stc
LB_9654:
	add rsp,16
; ∎ { %_9589 %_9590 %_9591 %_9592 %_9593 %_9594 %_9595 %_9596 }
 ; {>  %_9591~3':t3778'(-1) %_9592~4':t3779'(-1) %_9590~2':t3777'(-1) %_9595~7':t3782'(-1) %_9593~5':t3780'(-1) %_9589~0':t3776'(-1) %_9596~8':t3783'(-1) %_9594~6':t3781'(-1) %_9583~1':_r64 }
; 	∎ { 0' 2' 3' 4' 5' 6' 7' 8' }
	bt r12,1
	jc LB_9685
	mov rdi,r14
	call dlt
LB_9685:
; _emt_mov_ptn_to_ptn:{| 1011111110.. |},{ 0' 2' 3' 4' 5' 6' 7' 8' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	mov r14,r8
	bt r12,2
	jc LB_9686
	btr r12,1
	jmp LB_9687
LB_9686:
	bts r12,1
LB_9687:
	mov r8,r9
	bt r12,3
	jc LB_9688
	btr r12,2
	jmp LB_9689
LB_9688:
	bts r12,2
LB_9689:
	mov r9,r10
	bt r12,4
	jc LB_9690
	btr r12,3
	jmp LB_9691
LB_9690:
	bts r12,3
LB_9691:
	mov r10,r11
	bt r12,5
	jc LB_9692
	btr r12,4
	jmp LB_9693
LB_9692:
	bts r12,4
LB_9693:
	mov r11,rcx
	bt r12,6
	jc LB_9694
	btr r12,5
	jmp LB_9695
LB_9694:
	bts r12,5
LB_9695:
	mov rcx,rdx
	bt r12,7
	jc LB_9696
	btr r12,6
	jmp LB_9697
LB_9696:
	bts r12,6
LB_9697:
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9698
	btr r12,7
	jmp LB_9699
LB_9698:
	bts r12,7
LB_9699:
	ret
NS_E_9745:
NS_E_RDI_9745:
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
; » 0xr0 |~ {  } ⊢ %_9701 : %_9701
 ; {>  %_9700~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_9701
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_9702 : %_9702
 ; {>  %_9700~0':_stg %_9701~1':_r64 }
; 	» _args _ ⊢ 2' : %_9702
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
MTC_LB_9746:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9747
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
	jnc LB_9748
	bt QWORD [rdi],0
	jc LB_9749
	btr r12,5
	clc
	jmp LB_9750
LB_9749:
	bts r12,5
	stc
LB_9750:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9748:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9753
	btr r12,6
	clc
	jmp LB_9754
LB_9753:
	bts r12,6
	stc
LB_9754:
	mov r9,rcx
	bt r12,6
	jc LB_9751
	btr r12,3
	jmp LB_9752
LB_9751:
	bts r12,3
LB_9752:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9757
	btr r12,6
	clc
	jmp LB_9758
LB_9757:
	bts r12,6
	stc
LB_9758:
	mov r10,rcx
	bt r12,6
	jc LB_9755
	btr r12,4
	jmp LB_9756
LB_9755:
	bts r12,4
LB_9756:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9747
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
	jnc LB_9759
	bt QWORD [rdi],0
	jc LB_9760
	btr r12,7
	clc
	jmp LB_9761
LB_9760:
	bts r12,7
	stc
LB_9761:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9759:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_9764
	btr r12,8
	clc
	jmp LB_9765
LB_9764:
	bts r12,8
	stc
LB_9765:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9762
	btr r12,5
	jmp LB_9763
LB_9762:
	bts r12,5
LB_9763:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_9768
	btr r12,8
	clc
	jmp LB_9769
LB_9768:
	bts r12,8
	stc
LB_9769:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9766
	btr r12,6
	jmp LB_9767
LB_9766:
	bts r12,6
LB_9767:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9747
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
	jnc LB_9770
	bt QWORD [rdi],0
	jc LB_9771
	btr r12,7
	clc
	jmp LB_9772
LB_9771:
	bts r12,7
	stc
LB_9772:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9770:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9773:
	cmp r15,0
	jz LB_9774
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9773
LB_9774:
; _f37 %_9705 ⊢ { %_9707 %_9708 } : { %_9707 %_9708 }
 ; {>  %_9703~3':_stg %_9705~5':_stg %_9700~0':_stg %_9701~1':_r64 }
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
	jc LB_9781
	btr r12,0
	jmp LB_9782
LB_9781:
	bts r12,0
LB_9782:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_9783
	btr r12,2
	jmp LB_9784
LB_9783:
	bts r12,2
LB_9784:
	mov r10,r14
	bt r12,1
	jc LB_9785
	btr r12,4
	jmp LB_9786
LB_9785:
	bts r12,4
LB_9786:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9779
	btr r12,3
	clc
	jmp LB_9780
LB_9779:
	bts r12,3
	stc
LB_9780:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9777
	btr r12,1
	clc
	jmp LB_9778
LB_9777:
	bts r12,1
	stc
LB_9778:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9775
	btr r12,0
	clc
	jmp LB_9776
LB_9775:
	bts r12,0
	stc
LB_9776:
	add rsp,32
; _f4317 %_9708 ⊢ { %_9709 %_9710 } : { %_9709 %_9710 }
 ; {>  %_9708~4':_stg %_9703~3':_stg %_9700~0':_stg %_9707~2':_stg %_9701~1':_r64 }
; _f4317 4' ⊢ { 4' 5' }
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
	jc LB_9795
	btr r12,0
	jmp LB_9796
LB_9795:
	bts r12,0
LB_9796:
	call NS_E_4317
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_9797
	btr r12,4
	jmp LB_9798
LB_9797:
	bts r12,4
LB_9798:
	mov r11,r14
	bt r12,1
	jc LB_9799
	btr r12,5
	jmp LB_9800
LB_9799:
	bts r12,5
LB_9800:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9793
	btr r12,3
	clc
	jmp LB_9794
LB_9793:
	bts r12,3
	stc
LB_9794:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9791
	btr r12,2
	clc
	jmp LB_9792
LB_9791:
	bts r12,2
	stc
LB_9792:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9789
	btr r12,1
	clc
	jmp LB_9790
LB_9789:
	bts r12,1
	stc
LB_9790:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9787
	btr r12,0
	clc
	jmp LB_9788
LB_9787:
	bts r12,0
	stc
LB_9788:
	add rsp,40
MTC_LB_9801:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9802
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
	jnc LB_9803
	bt QWORD [rdi],0
	jc LB_9804
	btr r12,7
	clc
	jmp LB_9805
LB_9804:
	bts r12,7
	stc
LB_9805:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9803:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_9806
	btr r12,6
	jmp LB_9807
LB_9806:
	bts r12,6
LB_9807:
LB_9808:
	cmp r15,0
	jz LB_9809
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9808
LB_9809:
; » 0xr0 |~ {  } ⊢ %_9712 : %_9712
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9700~0':_stg %_9707~2':_stg %_9701~1':_r64 %_9711~6':_stg }
; 	» 0xr0 _ ⊢ 5' : %_9712
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f5445 { %_9711 %_9712 } ⊢ { %_9713 %_9714 %_9715 } : { %_9713 %_9714 %_9715 }
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9712~5':_r64 %_9700~0':_stg %_9707~2':_stg %_9701~1':_r64 %_9711~6':_stg }
; _f5445 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_9820
	btr r12,0
	jmp LB_9821
LB_9820:
	bts r12,0
LB_9821:
	mov r14,r11
	bt r12,5
	jc LB_9822
	btr r12,1
	jmp LB_9823
LB_9822:
	bts r12,1
LB_9823:
	call NS_E_5445
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_9824
	btr r12,5
	jmp LB_9825
LB_9824:
	bts r12,5
LB_9825:
	mov rcx,r14
	bt r12,1
	jc LB_9826
	btr r12,6
	jmp LB_9827
LB_9826:
	bts r12,6
LB_9827:
	mov rdx,r9
	bt r12,3
	jc LB_9830
	btr r12,7
	jmp LB_9831
LB_9830:
	bts r12,7
LB_9831:
	mov rsi,1
	bt r12,7
	jc LB_9828
	mov rsi,0
	bt rdx,0
	jc LB_9828
	jmp LB_9829
LB_9828:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_9829:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9818
	btr r12,4
	clc
	jmp LB_9819
LB_9818:
	bts r12,4
	stc
LB_9819:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9816
	btr r12,3
	clc
	jmp LB_9817
LB_9816:
	bts r12,3
	stc
LB_9817:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9814
	btr r12,2
	clc
	jmp LB_9815
LB_9814:
	bts r12,2
	stc
LB_9815:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9812
	btr r12,1
	clc
	jmp LB_9813
LB_9812:
	bts r12,1
	stc
LB_9813:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9810
	btr r12,0
	clc
	jmp LB_9811
LB_9810:
	bts r12,0
	stc
LB_9811:
	add rsp,48
MTC_LB_9832:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9833
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
	jnc LB_9834
	bt QWORD [rdi],0
	jc LB_9835
	btr r12,9
	clc
	jmp LB_9836
LB_9835:
	bts r12,9
	stc
LB_9836:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9834:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_9837
	btr r12,8
	jmp LB_9838
LB_9837:
	bts r12,8
LB_9838:
LB_9839:
	cmp r15,0
	jz LB_9840
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9839
LB_9840:
; » 0xr0 |~ {  } ⊢ %_9717 : %_9717
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9716~8':(_lst)◂(_p1478) %_9714~6':_r64 %_9700~0':_stg %_9713~5':_stg %_9707~2':_stg %_9701~1':_r64 }
; 	» 0xr0 _ ⊢ 7' : %_9717
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f2270 { %_9717 %_9716 } ⊢ { %_9718 %_9719 } : { %_9718 %_9719 }
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9716~8':(_lst)◂(_p1478) %_9714~6':_r64 %_9700~0':_stg %_9717~7':_r64 %_9713~5':_stg %_9707~2':_stg %_9701~1':_r64 }
; _f2270 { 7' 8' } ⊢ { 7' 8' }
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
	jc LB_9855
	btr r12,0
	jmp LB_9856
LB_9855:
	bts r12,0
LB_9856:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9857
	btr r12,1
	jmp LB_9858
LB_9857:
	bts r12,1
LB_9858:
	call NS_E_2270
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_9859
	btr r12,7
	jmp LB_9860
LB_9859:
	bts r12,7
LB_9860:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_9861
	btr r12,8
	jmp LB_9862
LB_9861:
	bts r12,8
LB_9862:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_9853
	btr r12,6
	clc
	jmp LB_9854
LB_9853:
	bts r12,6
	stc
LB_9854:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9851
	btr r12,5
	clc
	jmp LB_9852
LB_9851:
	bts r12,5
	stc
LB_9852:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9849
	btr r12,4
	clc
	jmp LB_9850
LB_9849:
	bts r12,4
	stc
LB_9850:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9847
	btr r12,3
	clc
	jmp LB_9848
LB_9847:
	bts r12,3
	stc
LB_9848:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9845
	btr r12,2
	clc
	jmp LB_9846
LB_9845:
	bts r12,2
	stc
LB_9846:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9843
	btr r12,1
	clc
	jmp LB_9844
LB_9843:
	bts r12,1
	stc
LB_9844:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9841
	btr r12,0
	clc
	jmp LB_9842
LB_9841:
	bts r12,0
	stc
LB_9842:
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
; _f38 %_9721 ⊢ %_9722 : %_9722
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9721~9':_stg %_9714~6':_r64 %_9700~0':_stg %_9720~8':_stg %_9718~7':_r64 %_9713~5':_stg %_9707~2':_stg %_9701~1':_r64 }
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
	jc LB_9881
	btr r12,0
	jmp LB_9882
LB_9881:
	bts r12,0
LB_9882:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_9883
	btr r12,9
	jmp LB_9884
LB_9883:
	bts r12,9
LB_9884:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_9879
	btr r12,8
	clc
	jmp LB_9880
LB_9879:
	bts r12,8
	stc
LB_9880:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_9877
	btr r12,7
	clc
	jmp LB_9878
LB_9877:
	bts r12,7
	stc
LB_9878:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_9875
	btr r12,6
	clc
	jmp LB_9876
LB_9875:
	bts r12,6
	stc
LB_9876:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9873
	btr r12,5
	clc
	jmp LB_9874
LB_9873:
	bts r12,5
	stc
LB_9874:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9871
	btr r12,4
	clc
	jmp LB_9872
LB_9871:
	bts r12,4
	stc
LB_9872:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9869
	btr r12,3
	clc
	jmp LB_9870
LB_9869:
	bts r12,3
	stc
LB_9870:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9867
	btr r12,2
	clc
	jmp LB_9868
LB_9867:
	bts r12,2
	stc
LB_9868:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9865
	btr r12,1
	clc
	jmp LB_9866
LB_9865:
	bts r12,1
	stc
LB_9866:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9863
	btr r12,0
	clc
	jmp LB_9864
LB_9863:
	bts r12,0
	stc
LB_9864:
	add rsp,80
; ∎ {  }
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9714~6':_r64 %_9700~0':_stg %_9720~8':_stg %_9718~7':_r64 %_9713~5':_stg %_9707~2':_stg %_9701~1':_r64 %_9722~9':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_9885
	mov rdi,r10
	call dlt
LB_9885:
	bt r12,3
	jc LB_9886
	mov rdi,r9
	call dlt
LB_9886:
	bt r12,6
	jc LB_9887
	mov rdi,rcx
	call dlt
LB_9887:
	bt r12,0
	jc LB_9888
	mov rdi,r13
	call dlt
LB_9888:
	bt r12,8
	jc LB_9889
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_9889:
	bt r12,7
	jc LB_9890
	mov rdi,rdx
	call dlt
LB_9890:
	bt r12,5
	jc LB_9891
	mov rdi,r11
	call dlt
LB_9891:
	bt r12,2
	jc LB_9892
	mov rdi,r8
	call dlt
LB_9892:
	bt r12,1
	jc LB_9893
	mov rdi,r14
	call dlt
LB_9893:
	bt r12,9
	jc LB_9894
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_9894:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9833:
	mov r15,0
LB_9896:
	cmp r15,0
	jz LB_9897
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9896
LB_9897:
; 	» "H0\n" _ ⊢ 8' : %_9723
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_9723 ⊢ %_9724 : %_9724
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9723~8':_stg %_9714~6':_r64 %_9700~0':_stg %_9715~7':(_opn)◂((_lst)◂(_p1478)) %_9713~5':_stg %_9707~2':_stg %_9701~1':_r64 }
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
	jc LB_9914
	btr r12,0
	jmp LB_9915
LB_9914:
	bts r12,0
LB_9915:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_9916
	btr r12,8
	jmp LB_9917
LB_9916:
	bts r12,8
LB_9917:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_9912
	btr r12,7
	clc
	jmp LB_9913
LB_9912:
	bts r12,7
	stc
LB_9913:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_9910
	btr r12,6
	clc
	jmp LB_9911
LB_9910:
	bts r12,6
	stc
LB_9911:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9908
	btr r12,5
	clc
	jmp LB_9909
LB_9908:
	bts r12,5
	stc
LB_9909:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9906
	btr r12,4
	clc
	jmp LB_9907
LB_9906:
	bts r12,4
	stc
LB_9907:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9904
	btr r12,3
	clc
	jmp LB_9905
LB_9904:
	bts r12,3
	stc
LB_9905:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9902
	btr r12,2
	clc
	jmp LB_9903
LB_9902:
	bts r12,2
	stc
LB_9903:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9900
	btr r12,1
	clc
	jmp LB_9901
LB_9900:
	bts r12,1
	stc
LB_9901:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9898
	btr r12,0
	clc
	jmp LB_9899
LB_9898:
	bts r12,0
	stc
LB_9899:
	add rsp,72
; ∎ {  }
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9724~8':_stg %_9714~6':_r64 %_9700~0':_stg %_9715~7':(_opn)◂((_lst)◂(_p1478)) %_9713~5':_stg %_9707~2':_stg %_9701~1':_r64 }
; 	∎ {  }
	bt r12,4
	jc LB_9918
	mov rdi,r10
	call dlt
LB_9918:
	bt r12,3
	jc LB_9919
	mov rdi,r9
	call dlt
LB_9919:
	bt r12,8
	jc LB_9920
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_9920:
	bt r12,6
	jc LB_9921
	mov rdi,rcx
	call dlt
LB_9921:
	bt r12,0
	jc LB_9922
	mov rdi,r13
	call dlt
LB_9922:
	bt r12,7
	jc LB_9923
	mov rdi,rdx
	call dlt
LB_9923:
	bt r12,5
	jc LB_9924
	mov rdi,r11
	call dlt
LB_9924:
	bt r12,2
	jc LB_9925
	mov rdi,r8
	call dlt
LB_9925:
	bt r12,1
	jc LB_9926
	mov rdi,r14
	call dlt
LB_9926:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9895:
MTC_LB_9802:
	mov r15,0
LB_9928:
	cmp r15,0
	jz LB_9929
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9928
LB_9929:
; 	» "H1\n" _ ⊢ 6' : %_9725
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_9725 ⊢ %_9726 : %_9726
 ; {>  %_9725~6':_stg %_9709~4':_stg %_9703~3':_stg %_9710~5':(_opn)◂(_stg) %_9700~0':_stg %_9707~2':_stg %_9701~1':_r64 }
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
	jc LB_9942
	btr r12,0
	jmp LB_9943
LB_9942:
	bts r12,0
LB_9943:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_9944
	btr r12,6
	jmp LB_9945
LB_9944:
	bts r12,6
LB_9945:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9940
	btr r12,5
	clc
	jmp LB_9941
LB_9940:
	bts r12,5
	stc
LB_9941:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9938
	btr r12,4
	clc
	jmp LB_9939
LB_9938:
	bts r12,4
	stc
LB_9939:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9936
	btr r12,3
	clc
	jmp LB_9937
LB_9936:
	bts r12,3
	stc
LB_9937:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9934
	btr r12,2
	clc
	jmp LB_9935
LB_9934:
	bts r12,2
	stc
LB_9935:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9932
	btr r12,1
	clc
	jmp LB_9933
LB_9932:
	bts r12,1
	stc
LB_9933:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9930
	btr r12,0
	clc
	jmp LB_9931
LB_9930:
	bts r12,0
	stc
LB_9931:
	add rsp,56
; ∎ {  }
 ; {>  %_9709~4':_stg %_9703~3':_stg %_9710~5':(_opn)◂(_stg) %_9700~0':_stg %_9707~2':_stg %_9701~1':_r64 %_9726~6':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_9946
	mov rdi,r10
	call dlt
LB_9946:
	bt r12,3
	jc LB_9947
	mov rdi,r9
	call dlt
LB_9947:
	bt r12,5
	jc LB_9948
	mov rdi,r11
	call dlt
LB_9948:
	bt r12,0
	jc LB_9949
	mov rdi,r13
	call dlt
LB_9949:
	bt r12,2
	jc LB_9950
	mov rdi,r8
	call dlt
LB_9950:
	bt r12,1
	jc LB_9951
	mov rdi,r14
	call dlt
LB_9951:
	bt r12,6
	jc LB_9952
	mov rdi,rcx
	call dlt
LB_9952:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9927:
MTC_LB_9747:
	mov r15,0
LB_9954:
	cmp r15,0
	jz LB_9955
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9954
LB_9955:
; _f5445 { %_9700 %_9701 } ⊢ { %_9727 %_9728 %_9729 } : { %_9727 %_9728 %_9729 }
 ; {>  %_9700~0':_stg %_9702~2':(_lst)◂(_stg) %_9701~1':_r64 }
; _f5445 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_5445
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_9958
	btr r12,4
	jmp LB_9959
LB_9958:
	bts r12,4
LB_9959:
	mov r9,r10
	bt r12,4
	jc LB_9962
	btr r12,3
	jmp LB_9963
LB_9962:
	bts r12,3
LB_9963:
	mov rsi,1
	bt r12,3
	jc LB_9960
	mov rsi,0
	bt r9,0
	jc LB_9960
	jmp LB_9961
LB_9960:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9961:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9956
	btr r12,2
	clc
	jmp LB_9957
LB_9956:
	bts r12,2
	stc
LB_9957:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_9730
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_9730 ⊢ { %_9731 %_9732 } : { %_9731 %_9732 }
 ; {>  %_9730~4':_stg %_9727~0':_stg %_9728~1':_r64 %_9702~2':(_lst)◂(_stg) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
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
	jc LB_9972
	btr r12,0
	jmp LB_9973
LB_9972:
	bts r12,0
LB_9973:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_9974
	btr r12,4
	jmp LB_9975
LB_9974:
	bts r12,4
LB_9975:
	mov r11,r14
	bt r12,1
	jc LB_9976
	btr r12,5
	jmp LB_9977
LB_9976:
	bts r12,5
LB_9977:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9970
	btr r12,3
	clc
	jmp LB_9971
LB_9970:
	bts r12,3
	stc
LB_9971:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9968
	btr r12,2
	clc
	jmp LB_9969
LB_9968:
	bts r12,2
	stc
LB_9969:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9966
	btr r12,1
	clc
	jmp LB_9967
LB_9966:
	bts r12,1
	stc
LB_9967:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9964
	btr r12,0
	clc
	jmp LB_9965
LB_9964:
	bts r12,0
	stc
LB_9965:
	add rsp,40
; _f38 { %_9731 %_9732 } ⊢ { %_9733 %_9734 } : { %_9733 %_9734 }
 ; {>  %_9732~5':_stg %_9731~4':_stg %_9727~0':_stg %_9728~1':_r64 %_9702~2':(_lst)◂(_stg) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
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
	jc LB_9988
	btr r12,1
	jmp LB_9989
LB_9988:
	bts r12,1
LB_9989:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_9986
	btr QWORD [rdi],0
	jmp LB_9987
LB_9986:
	bts QWORD [rdi],0
LB_9987:
	mov r14,r11
	bt r12,5
	jc LB_9992
	btr r12,1
	jmp LB_9993
LB_9992:
	bts r12,1
LB_9993:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_9990
	btr QWORD [rdi],1
	jmp LB_9991
LB_9990:
	bts QWORD [rdi],1
LB_9991:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_9996
	btr r12,1
	clc
	jmp LB_9997
LB_9996:
	bts r12,1
	stc
LB_9997:
	mov r10,r14
	bt r12,1
	jc LB_9994
	btr r12,4
	jmp LB_9995
LB_9994:
	bts r12,4
LB_9995:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_10000
	btr r12,1
	clc
	jmp LB_10001
LB_10000:
	bts r12,1
	stc
LB_10001:
	mov r11,r14
	bt r12,1
	jc LB_9998
	btr r12,5
	jmp LB_9999
LB_9998:
	bts r12,5
LB_9999:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9984
	btr r12,3
	clc
	jmp LB_9985
LB_9984:
	bts r12,3
	stc
LB_9985:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9982
	btr r12,2
	clc
	jmp LB_9983
LB_9982:
	bts r12,2
	stc
LB_9983:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9980
	btr r12,1
	clc
	jmp LB_9981
LB_9980:
	bts r12,1
	stc
LB_9981:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9978
	btr r12,0
	clc
	jmp LB_9979
LB_9978:
	bts r12,0
	stc
LB_9979:
	add rsp,40
; _f4317 %_9734 ⊢ { %_9735 %_9736 } : { %_9735 %_9736 }
 ; {>  %_9734~5':_stg %_9733~4':_stg %_9727~0':_stg %_9728~1':_r64 %_9702~2':(_lst)◂(_stg) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
; _f4317 5' ⊢ { 5' 6' }
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
	jc LB_10012
	btr r12,0
	jmp LB_10013
LB_10012:
	bts r12,0
LB_10013:
	call NS_E_4317
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_10014
	btr r12,5
	jmp LB_10015
LB_10014:
	bts r12,5
LB_10015:
	mov rcx,r14
	bt r12,1
	jc LB_10016
	btr r12,6
	jmp LB_10017
LB_10016:
	bts r12,6
LB_10017:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10010
	btr r12,4
	clc
	jmp LB_10011
LB_10010:
	bts r12,4
	stc
LB_10011:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10008
	btr r12,3
	clc
	jmp LB_10009
LB_10008:
	bts r12,3
	stc
LB_10009:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10006
	btr r12,2
	clc
	jmp LB_10007
LB_10006:
	bts r12,2
	stc
LB_10007:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10004
	btr r12,1
	clc
	jmp LB_10005
LB_10004:
	bts r12,1
	stc
LB_10005:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10002
	btr r12,0
	clc
	jmp LB_10003
LB_10002:
	bts r12,0
	stc
LB_10003:
	add rsp,48
MTC_LB_10018:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10019
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
	jnc LB_10020
	bt QWORD [rdi],0
	jc LB_10021
	btr r12,8
	clc
	jmp LB_10022
LB_10021:
	bts r12,8
	stc
LB_10022:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10020:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10023
	btr r12,7
	jmp LB_10024
LB_10023:
	bts r12,7
LB_10024:
LB_10025:
	cmp r15,0
	jz LB_10026
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10025
LB_10026:
; » 0xr0 |~ {  } ⊢ %_9738 : %_9738
 ; {>  %_9735~5':_stg %_9733~4':_stg %_9727~0':_stg %_9728~1':_r64 %_9737~7':_stg %_9702~2':(_lst)◂(_stg) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
; 	» 0xr0 _ ⊢ 6' : %_9738
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f5445 { %_9737 %_9738 } ⊢ { %_9739 %_9740 %_9741 } : { %_9739 %_9740 %_9741 }
 ; {>  %_9735~5':_stg %_9738~6':_r64 %_9733~4':_stg %_9727~0':_stg %_9728~1':_r64 %_9737~7':_stg %_9702~2':(_lst)◂(_stg) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
; _f5445 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_10039
	btr r12,0
	jmp LB_10040
LB_10039:
	bts r12,0
LB_10040:
	mov r14,rcx
	bt r12,6
	jc LB_10041
	btr r12,1
	jmp LB_10042
LB_10041:
	bts r12,1
LB_10042:
	call NS_E_5445
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_10043
	btr r12,6
	jmp LB_10044
LB_10043:
	bts r12,6
LB_10044:
	mov rdx,r14
	bt r12,1
	jc LB_10045
	btr r12,7
	jmp LB_10046
LB_10045:
	bts r12,7
LB_10046:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_10049
	btr r12,8
	jmp LB_10050
LB_10049:
	bts r12,8
LB_10050:
	mov rsi,1
	bt r12,8
	jc LB_10047
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_10047
	jmp LB_10048
LB_10047:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_10048:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10037
	btr r12,5
	clc
	jmp LB_10038
LB_10037:
	bts r12,5
	stc
LB_10038:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10035
	btr r12,4
	clc
	jmp LB_10036
LB_10035:
	bts r12,4
	stc
LB_10036:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10033
	btr r12,3
	clc
	jmp LB_10034
LB_10033:
	bts r12,3
	stc
LB_10034:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10031
	btr r12,2
	clc
	jmp LB_10032
LB_10031:
	bts r12,2
	stc
LB_10032:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10029
	btr r12,1
	clc
	jmp LB_10030
LB_10029:
	bts r12,1
	stc
LB_10030:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10027
	btr r12,0
	clc
	jmp LB_10028
LB_10027:
	bts r12,0
	stc
LB_10028:
	add rsp,56
; _f38 { %_9739 %_9740 %_9741 } ⊢ { %_9742 %_9743 %_9744 } : { %_9742 %_9743 %_9744 }
 ; {>  %_9735~5':_stg %_9733~4':_stg %_9727~0':_stg %_9740~7':_r64 %_9739~6':_stg %_9728~1':_r64 %_9702~2':(_lst)◂(_stg) %_9741~8':(_opn)◂((_lst)◂(_p1478)) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
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
	jc LB_10065
	btr r12,1
	jmp LB_10066
LB_10065:
	bts r12,1
LB_10066:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_10063
	btr QWORD [rdi],0
	jmp LB_10064
LB_10063:
	bts QWORD [rdi],0
LB_10064:
	mov r14,rdx
	bt r12,7
	jc LB_10069
	btr r12,1
	jmp LB_10070
LB_10069:
	bts r12,1
LB_10070:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_10067
	btr QWORD [rdi],1
	jmp LB_10068
LB_10067:
	bts QWORD [rdi],1
LB_10068:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10073
	btr r12,1
	jmp LB_10074
LB_10073:
	bts r12,1
LB_10074:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,1
	jc LB_10071
	btr QWORD [rdi],2
	jmp LB_10072
LB_10071:
	bts QWORD [rdi],2
LB_10072:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_10077
	btr r12,1
	clc
	jmp LB_10078
LB_10077:
	bts r12,1
	stc
LB_10078:
	mov rcx,r14
	bt r12,1
	jc LB_10075
	btr r12,6
	jmp LB_10076
LB_10075:
	bts r12,6
LB_10076:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_10081
	btr r12,1
	clc
	jmp LB_10082
LB_10081:
	bts r12,1
	stc
LB_10082:
	mov rdx,r14
	bt r12,1
	jc LB_10079
	btr r12,7
	jmp LB_10080
LB_10079:
	bts r12,7
LB_10080:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_10085
	btr r12,1
	clc
	jmp LB_10086
LB_10085:
	bts r12,1
	stc
LB_10086:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_10083
	btr r12,8
	jmp LB_10084
LB_10083:
	bts r12,8
LB_10084:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10061
	btr r12,5
	clc
	jmp LB_10062
LB_10061:
	bts r12,5
	stc
LB_10062:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10059
	btr r12,4
	clc
	jmp LB_10060
LB_10059:
	bts r12,4
	stc
LB_10060:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10057
	btr r12,3
	clc
	jmp LB_10058
LB_10057:
	bts r12,3
	stc
LB_10058:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10055
	btr r12,2
	clc
	jmp LB_10056
LB_10055:
	bts r12,2
	stc
LB_10056:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10053
	btr r12,1
	clc
	jmp LB_10054
LB_10053:
	bts r12,1
	stc
LB_10054:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10051
	btr r12,0
	clc
	jmp LB_10052
LB_10051:
	bts r12,0
	stc
LB_10052:
	add rsp,56
; ∎ {  }
 ; {>  %_9744~8':(_opn)◂((_lst)◂(_p1478)) %_9743~7':_r64 %_9735~5':_stg %_9742~6':_stg %_9733~4':_stg %_9727~0':_stg %_9728~1':_r64 %_9702~2':(_lst)◂(_stg) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
; 	∎ {  }
	bt r12,8
	jc LB_10087
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_10087:
	bt r12,7
	jc LB_10088
	mov rdi,rdx
	call dlt
LB_10088:
	bt r12,5
	jc LB_10089
	mov rdi,r11
	call dlt
LB_10089:
	bt r12,6
	jc LB_10090
	mov rdi,rcx
	call dlt
LB_10090:
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
	bt r12,1
	jc LB_10093
	mov rdi,r14
	call dlt
LB_10093:
	bt r12,2
	jc LB_10094
	mov rdi,r8
	call dlt
LB_10094:
	bt r12,3
	jc LB_10095
	mov rdi,r9
	call dlt
LB_10095:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10019:
	mov r15,0
LB_10097:
	cmp r15,0
	jz LB_10098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10097
LB_10098:
; ∎ {  }
 ; {>  %_9735~5':_stg %_9736~6':(_opn)◂(_stg) %_9733~4':_stg %_9727~0':_stg %_9728~1':_r64 %_9702~2':(_lst)◂(_stg) %_9729~3':(_opn)◂((_lst)◂(_p1478)) }
; 	∎ {  }
	bt r12,5
	jc LB_10099
	mov rdi,r11
	call dlt
LB_10099:
	bt r12,6
	jc LB_10100
	mov rdi,rcx
	call dlt
LB_10100:
	bt r12,4
	jc LB_10101
	mov rdi,r10
	call dlt
LB_10101:
	bt r12,0
	jc LB_10102
	mov rdi,r13
	call dlt
LB_10102:
	bt r12,1
	jc LB_10103
	mov rdi,r14
	call dlt
LB_10103:
	bt r12,2
	jc LB_10104
	mov rdi,r8
	call dlt
LB_10104:
	bt r12,3
	jc LB_10105
	mov rdi,r9
	call dlt
LB_10105:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10096:
MTC_LB_9953:
NS_E_10128:
NS_E_RDI_10128:
; 	» "{ x   y z }" _ ⊢ 0' : %_10106
	mov rdi,11
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_79_20_20_20_78_20_7b
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_7d_20_7a
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_10107 : %_10107
 ; {>  %_10106~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_10107
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f4833 { %_10106 %_10107 } ⊢ { %_10108 %_10109 %_10110 } : { %_10108 %_10109 %_10110 }
 ; {>  %_10106~0':_stg %_10107~1':_r64 }
; _f4833 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4833
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_10129
	btr r12,4
	jmp LB_10130
LB_10129:
	bts r12,4
LB_10130:
	mov r8,r9
	bt r12,3
	jc LB_10133
	btr r12,2
	jmp LB_10134
LB_10133:
	bts r12,2
LB_10134:
	mov rsi,1
	bt r12,2
	jc LB_10131
	mov rsi,0
	bt r8,0
	jc LB_10131
	jmp LB_10132
LB_10131:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10132:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 %_10110 ⊢ %_10111 : %_10111
 ; {>  %_10109~1':_r64 %_10108~0':_stg %_10110~2':(_opn)◂((_p1432)◂((_p1440)◂(_stg))) }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10139
	btr r12,0
	jmp LB_10140
LB_10139:
	bts r12,0
LB_10140:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10141
	btr r12,2
	jmp LB_10142
LB_10141:
	bts r12,2
LB_10142:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10137
	btr r12,1
	clc
	jmp LB_10138
LB_10137:
	bts r12,1
	stc
LB_10138:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10135
	btr r12,0
	clc
	jmp LB_10136
LB_10135:
	bts r12,0
	stc
LB_10136:
	add rsp,24
MTC_LB_10143:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10144
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
	jnc LB_10145
	bt QWORD [rdi],0
	jc LB_10146
	btr r12,4
	clc
	jmp LB_10147
LB_10146:
	bts r12,4
	stc
LB_10147:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10145:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10148
	btr r12,3
	jmp LB_10149
LB_10148:
	bts r12,3
LB_10149:
LB_10150:
	cmp r15,0
	jz LB_10151
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10150
LB_10151:
; » 0xr0 |~ {  } ⊢ %_10113 : %_10113
 ; {>  %_10109~1':_r64 %_10108~0':_stg %_10112~3':(_p1432)◂((_p1440)◂(_stg)) }
; 	» 0xr0 _ ⊢ 2' : %_10113
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _nil {  } ⊢ %_10114 : %_10114
 ; {>  %_10109~1':_r64 %_10108~0':_stg %_10113~2':_r64 %_10112~3':(_p1432)◂((_p1440)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _f9172 { %_10113 %_10114 %_10112 } ⊢ { %_10115 %_10116 %_10117 } : { %_10115 %_10116 %_10117 }
 ; {>  %_10109~1':_r64 %_10108~0':_stg %_10114~°1◂{  }:(_lst)◂(t3939'(0)) %_10113~2':_r64 %_10112~3':(_p1432)◂((_p1440)◂(_stg)) }
; _f9172 { 2' °1◂{  } 3' } ⊢ { 2' 3' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},{ 2' °1◂{  } 3' } ⊢ { 0' 1' 2' }
	mov r13,r8
	bt r12,2
	jc LB_10156
	btr r12,0
	jmp LB_10157
LB_10156:
	bts r12,0
LB_10157:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_10158
	mov rsi,0
	bt r14,0
	jc LB_10158
	jmp LB_10159
LB_10158:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10159:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov r8,r9
	bt r12,3
	jc LB_10160
	btr r12,2
	jmp LB_10161
LB_10160:
	bts r12,2
LB_10161:
	call NS_E_9172
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 3' 4' }
	mov r9,r14
	bt r12,1
	jc LB_10162
	btr r12,3
	jmp LB_10163
LB_10162:
	bts r12,3
LB_10163:
	mov r10,r8
	bt r12,2
	jc LB_10164
	btr r12,4
	jmp LB_10165
LB_10164:
	bts r12,4
LB_10165:
	mov r8,r13
	bt r12,0
	jc LB_10166
	btr r12,2
	jmp LB_10167
LB_10166:
	bts r12,2
LB_10167:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10154
	btr r12,1
	clc
	jmp LB_10155
LB_10154:
	bts r12,1
	stc
LB_10155:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10152
	btr r12,0
	clc
	jmp LB_10153
LB_10152:
	bts r12,0
	stc
LB_10153:
	add rsp,24
; _f38 %_10117 ⊢ %_10118 : %_10118
 ; {>  %_10117~4':(_p1432)◂((_p1440)◂(_r64)) %_10116~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10109~1':_r64 %_10108~0':_stg %_10115~2':_r64 }
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
	jc LB_10176
	btr r12,0
	jmp LB_10177
LB_10176:
	bts r12,0
LB_10177:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_10178
	btr r12,4
	jmp LB_10179
LB_10178:
	bts r12,4
LB_10179:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10174
	btr r12,3
	clc
	jmp LB_10175
LB_10174:
	bts r12,3
	stc
LB_10175:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10172
	btr r12,2
	clc
	jmp LB_10173
LB_10172:
	bts r12,2
	stc
LB_10173:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10170
	btr r12,1
	clc
	jmp LB_10171
LB_10170:
	bts r12,1
	stc
LB_10171:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10168
	btr r12,0
	clc
	jmp LB_10169
LB_10168:
	bts r12,0
	stc
LB_10169:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_10119 : %_10119
 ; {>  %_10118~4':(_p1432)◂((_p1440)◂(_r64)) %_10116~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10109~1':_r64 %_10108~0':_stg %_10115~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_10119
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f4572 { %_10108 %_10119 } ⊢ { %_10120 %_10121 %_10122 } : { %_10120 %_10121 %_10122 }
 ; {>  %_10118~4':(_p1432)◂((_p1440)◂(_r64)) %_10116~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10109~1':_r64 %_10108~0':_stg %_10119~5':_r64 %_10115~2':_r64 }
; _f4572 { 0' 5' } ⊢ { 0' 5' 6' }
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
	jc LB_10188
	btr r12,1
	jmp LB_10189
LB_10188:
	bts r12,1
LB_10189:
	call NS_E_4572
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 5' 6' }
	mov r11,r14
	bt r12,1
	jc LB_10190
	btr r12,5
	jmp LB_10191
LB_10190:
	bts r12,5
LB_10191:
	mov rcx,r9
	bt r12,3
	jc LB_10194
	btr r12,6
	jmp LB_10195
LB_10194:
	bts r12,6
LB_10195:
	mov rsi,1
	bt r12,6
	jc LB_10192
	mov rsi,0
	bt rcx,0
	jc LB_10192
	jmp LB_10193
LB_10192:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_10193:
	mov rax,r8
	shl rax,56
	or rax,1
	or rcx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_10186
	btr r12,4
	clc
	jmp LB_10187
LB_10186:
	bts r12,4
	stc
LB_10187:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10184
	btr r12,3
	clc
	jmp LB_10185
LB_10184:
	bts r12,3
	stc
LB_10185:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10182
	btr r12,2
	clc
	jmp LB_10183
LB_10182:
	bts r12,2
	stc
LB_10183:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10180
	btr r12,1
	clc
	jmp LB_10181
LB_10180:
	bts r12,1
	stc
LB_10181:
	add rsp,40
MTC_LB_10196:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10197
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
	jnc LB_10198
	bt QWORD [rdi],0
	jc LB_10199
	btr r12,8
	clc
	jmp LB_10200
LB_10199:
	bts r12,8
	stc
LB_10200:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10198:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10201
	btr r12,7
	jmp LB_10202
LB_10201:
	bts r12,7
LB_10202:
LB_10203:
	cmp r15,0
	jz LB_10204
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10203
LB_10204:
; _f9417 { %_10115 %_10116 %_10123 } ⊢ { %_10124 %_10125 %_10126 } : { %_10124 %_10125 %_10126 }
 ; {>  %_10118~4':(_p1432)◂((_p1440)◂(_r64)) %_10123~7':(_p1432)◂((_p1439)◂(_stg)) %_10116~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10109~1':_r64 %_10120~0':_stg %_10121~5':_r64 %_10115~2':_r64 }
; _f9417 { 2' 3' 7' } ⊢ { 2' 3' 6' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 001100010.. |},{ 2' 3' 7' } ⊢ { 0' 1' 2' }
	mov r13,r8
	bt r12,2
	jc LB_10213
	btr r12,0
	jmp LB_10214
LB_10213:
	bts r12,0
LB_10214:
	mov r14,r9
	bt r12,3
	jc LB_10215
	btr r12,1
	jmp LB_10216
LB_10215:
	bts r12,1
LB_10216:
	mov r8,rdx
	bt r12,7
	jc LB_10217
	btr r12,2
	jmp LB_10218
LB_10217:
	bts r12,2
LB_10218:
	call NS_E_9417
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 3' 6' }
	mov r9,r14
	bt r12,1
	jc LB_10219
	btr r12,3
	jmp LB_10220
LB_10219:
	bts r12,3
LB_10220:
	mov rcx,r8
	bt r12,2
	jc LB_10221
	btr r12,6
	jmp LB_10222
LB_10221:
	bts r12,6
LB_10222:
	mov r8,r13
	bt r12,0
	jc LB_10223
	btr r12,2
	jmp LB_10224
LB_10223:
	bts r12,2
LB_10224:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10211
	btr r12,5
	clc
	jmp LB_10212
LB_10211:
	bts r12,5
	stc
LB_10212:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10209
	btr r12,4
	clc
	jmp LB_10210
LB_10209:
	bts r12,4
	stc
LB_10210:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10207
	btr r12,1
	clc
	jmp LB_10208
LB_10207:
	bts r12,1
	stc
LB_10208:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10205
	btr r12,0
	clc
	jmp LB_10206
LB_10205:
	bts r12,0
	stc
LB_10206:
	add rsp,40
; _f38 %_10126 ⊢ %_10127 : %_10127
 ; {>  %_10118~4':(_p1432)◂((_p1440)◂(_r64)) %_10125~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10124~2':_r64 %_10109~1':_r64 %_10120~0':_stg %_10121~5':_r64 %_10126~6':(_p1432)◂((_p1439)◂(_r64)) }
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
	jc LB_10237
	btr r12,0
	jmp LB_10238
LB_10237:
	bts r12,0
LB_10238:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_10239
	btr r12,6
	jmp LB_10240
LB_10239:
	bts r12,6
LB_10240:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_10235
	btr r12,5
	clc
	jmp LB_10236
LB_10235:
	bts r12,5
	stc
LB_10236:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_10233
	btr r12,4
	clc
	jmp LB_10234
LB_10233:
	bts r12,4
	stc
LB_10234:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_10231
	btr r12,3
	clc
	jmp LB_10232
LB_10231:
	bts r12,3
	stc
LB_10232:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10229
	btr r12,2
	clc
	jmp LB_10230
LB_10229:
	bts r12,2
	stc
LB_10230:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10227
	btr r12,1
	clc
	jmp LB_10228
LB_10227:
	bts r12,1
	stc
LB_10228:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10225
	btr r12,0
	clc
	jmp LB_10226
LB_10225:
	bts r12,0
	stc
LB_10226:
	add rsp,56
; ∎ {  }
 ; {>  %_10127~6':(_p1432)◂((_p1439)◂(_r64)) %_10118~4':(_p1432)◂((_p1440)◂(_r64)) %_10125~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_10124~2':_r64 %_10109~1':_r64 %_10120~0':_stg %_10121~5':_r64 }
; 	∎ {  }
	bt r12,6
	jc LB_10241
	mov rdi,rcx
	call dlt
LB_10241:
	bt r12,4
	jc LB_10242
	mov rdi,r10
	call dlt
LB_10242:
	bt r12,3
	jc LB_10243
	mov rdi,r9
	call dlt
LB_10243:
	bt r12,2
	jc LB_10244
	mov rdi,r8
	call dlt
LB_10244:
	bt r12,1
	jc LB_10245
	mov rdi,r14
	call dlt
LB_10245:
	bt r12,0
	jc LB_10246
	mov rdi,r13
	call dlt
LB_10246:
	bt r12,5
	jc LB_10247
	mov rdi,r11
	call dlt
LB_10247:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_10197:
	mov r15,0
LB_10249:
	cmp r15,0
	jz LB_10250
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10249
LB_10250:
	jmp err
MTC_LB_10248:
MTC_LB_10144:
	mov r15,0
LB_10252:
	cmp r15,0
	jz LB_10253
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10252
LB_10253:
	jmp err
MTC_LB_10251:
section .data
	CST_DYN_9745:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_10128:
		dq 0x0000_0001_00_82_ffff
		dq 1
