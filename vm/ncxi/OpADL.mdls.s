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
	call NS_E_11197
	call NS_E_11579
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
NS_E_612:
NS_E_RDI_612:
NS_E_612_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_613
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_613:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_615:
NS_E_RDI_615:
NS_E_615_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_615_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_615_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_616:
NS_E_RDI_616:
NS_E_616_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_616_LB_0
	cmp r11,57
	ja NS_E_616_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_616_LB_0:
	mov rax,0
	ret
NS_E_618:
NS_E_RDI_618:
NS_E_618_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_618_LB_0
	cmp r11,122
	ja NS_E_618_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_618_LB_0:
	mov rax,0
	ret
NS_E_617:
NS_E_RDI_617:
NS_E_617_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_617_LB_0
	cmp r11,90
	ja NS_E_617_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_617_LB_0:
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
	jc LB_624
	bt QWORD [rdi],17
	jnc LB_624
	bt QWORD [rdi],0
	jc LB_626
	btr r12,2
	clc
	jmp LB_627
LB_626:
	bts r12,2
	stc
LB_627:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_625
LB_624:
	btr r12,2
	clc
	call dcp
LB_625:
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
	jc LB_620
	bt QWORD [rdi],17
	jnc LB_620
	bt QWORD [rdi],0
	jc LB_622
	btr r12,2
	clc
	jmp LB_623
LB_622:
	bts r12,2
	stc
LB_623:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_621
LB_620:
	btr r12,2
	clc
	call dcp
LB_621:
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
	jc LB_619
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_619:
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
NS_E_614:
NS_E_RDI_614:
NS_E_614_ETR_TBL:
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
	jz NS_E_614_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_614_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_637:
; 	|» { 0' 1' }
NS_E_RDI_637:
MTC_LB_638:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_639
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
	jnc LB_640
	bt QWORD [rdi],0
	jc LB_641
	btr r12,2
	clc
	jmp LB_642
LB_641:
	bts r12,2
	stc
LB_642:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_640:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_643:
	cmp r15,0
	jz LB_644
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_643
LB_644:
; ∎ %_631
 ; {>  %_631~0':(_lst)◂(t122'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_639:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_645
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
	jnc LB_646
	bt QWORD [rdi],0
	jc LB_647
	btr r12,4
	clc
	jmp LB_648
LB_647:
	bts r12,4
	stc
LB_648:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_646:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_651
	btr r12,5
	clc
	jmp LB_652
LB_651:
	bts r12,5
	stc
LB_652:
	mov r8,r11
	bt r12,5
	jc LB_649
	btr r12,2
	jmp LB_650
LB_649:
	bts r12,2
LB_650:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_655
	btr r12,5
	clc
	jmp LB_656
LB_655:
	bts r12,5
	stc
LB_656:
	mov r9,r11
	bt r12,5
	jc LB_653
	btr r12,3
	jmp LB_654
LB_653:
	bts r12,3
LB_654:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_657:
	cmp r15,0
	jz LB_658
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_657
LB_658:
; _cns { %_633 %_631 } ⊢ %_635 : %_635
 ; {>  %_633~2':t122'(-1) %_634~3':(_lst)◂(t122'(-1)) %_631~0':(_lst)◂(t122'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f637 { %_635 %_634 } ⊢ %_636 : %_636
 ; {>  %_635~°0◂{ 2' 0' }:(_lst)◂(t122'(-1)) %_634~3':(_lst)◂(t122'(-1)) }
; _f637 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_659
	btr r12,1
	jmp LB_660
LB_659:
	bts r12,1
LB_660:
	mov r9,r13
	bt r12,0
	jc LB_661
	btr r12,3
	jmp LB_662
LB_661:
	bts r12,3
LB_662:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_667
	btr r12,4
	jmp LB_668
LB_667:
	bts r12,4
LB_668:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_665
	btr QWORD [rdi],0
	jmp LB_666
LB_665:
	bts QWORD [rdi],0
LB_666:
	mov r10,r9
	bt r12,3
	jc LB_671
	btr r12,4
	jmp LB_672
LB_671:
	bts r12,4
LB_672:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_669
	btr QWORD [rdi],1
	jmp LB_670
LB_669:
	bts QWORD [rdi],1
LB_670:
	mov rsi,1
	bt r12,0
	jc LB_663
	mov rsi,0
	bt r13,0
	jc LB_663
	jmp LB_664
LB_663:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_664:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_637
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_636
 ; {>  %_636~0':(_lst)◂(t122'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_645:
NS_E_676:
; 	|» 0'
NS_E_RDI_676:
; _nil {  } ⊢ %_674 : %_674
 ; {>  %_673~0':(_lst)◂(t143'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f637 { %_674 %_673 } ⊢ %_675 : %_675
 ; {>  %_674~°1◂{  }:(_lst)◂(t140'(0)) %_673~0':(_lst)◂(t143'(-1)) }
; _f637 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_677
	btr r12,1
	jmp LB_678
LB_677:
	bts r12,1
LB_678:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_679
	mov rsi,0
	bt r13,0
	jc LB_679
	jmp LB_680
LB_679:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_680:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_637
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_675
 ; {>  %_675~0':(_lst)◂(t143'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_694:
; 	|» { 0' 1' }
NS_E_RDI_694:
MTC_LB_695:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_696
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
	jnc LB_697
	bt QWORD [rdi],0
	jc LB_698
	btr r12,4
	clc
	jmp LB_699
LB_698:
	bts r12,4
	stc
LB_699:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_697:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_702
	btr r12,5
	clc
	jmp LB_703
LB_702:
	bts r12,5
	stc
LB_703:
	mov r8,r11
	bt r12,5
	jc LB_700
	btr r12,2
	jmp LB_701
LB_700:
	bts r12,2
LB_701:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_706
	btr r12,5
	clc
	jmp LB_707
LB_706:
	bts r12,5
	stc
LB_707:
	mov r9,r11
	bt r12,5
	jc LB_704
	btr r12,3
	jmp LB_705
LB_704:
	bts r12,3
LB_705:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_708:
	cmp r15,0
	jz LB_709
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_708
LB_709:
; _f56 %_681 ⊢ %_685 : %_685
 ; {>  %_681~0':_r64 %_684~3':(_lst)◂(_r64) %_683~2':_r64 }
	add r13,1
; _f694 { %_685 %_684 } ⊢ { %_686 %_687 } : { %_686 %_687 }
 ; {>  %_684~3':(_lst)◂(_r64) %_683~2':_r64 %_685~0':_r64 }
; _f694 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_712
	btr r12,1
	jmp LB_713
LB_712:
	bts r12,1
LB_713:
	call NS_E_694
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_710
	btr r12,2
	clc
	jmp LB_711
LB_710:
	bts r12,2
	stc
LB_711:
	add rsp,16
; _f55 %_686 ⊢ %_688 : %_688
 ; {>  %_686~0':_r64 %_687~1':_stg %_683~2':_r64 }
	sub r13,1
; _f33 { %_687 %_688 %_683 } ⊢ { %_689 %_690 %_691 } : { %_689 %_690 %_691 }
 ; {>  %_688~0':_r64 %_687~1':_stg %_683~2':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_714
	btr r12,3
	jmp LB_715
LB_714:
	bts r12,3
LB_715:
	mov r14,r13
	bt r12,0
	jc LB_716
	btr r12,1
	jmp LB_717
LB_716:
	bts r12,1
LB_717:
	mov r13,r9
	bt r12,3
	jc LB_718
	btr r12,0
	jmp LB_719
LB_718:
	bts r12,0
LB_719:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_690 %_689 }
 ; {>  %_691~2':_r64 %_689~0':_stg %_690~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_720
	mov rdi,r8
	call dlt
LB_720:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_721
	btr r12,2
	jmp LB_722
LB_721:
	bts r12,2
LB_722:
	mov r14,r13
	bt r12,0
	jc LB_723
	btr r12,1
	jmp LB_724
LB_723:
	bts r12,1
LB_724:
	mov r13,r8
	bt r12,2
	jc LB_725
	btr r12,0
	jmp LB_726
LB_725:
	bts r12,0
LB_726:
	ret
MTC_LB_696:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_727
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
	jnc LB_728
	bt QWORD [rdi],0
	jc LB_729
	btr r12,2
	clc
	jmp LB_730
LB_729:
	bts r12,2
	stc
LB_730:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_728:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_731:
	cmp r15,0
	jz LB_732
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_731
LB_732:
; _f31 %_681 ⊢ { %_692 %_693 } : { %_692 %_693 }
 ; {>  %_681~0':_r64 }
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
; ∎ { %_692 %_693 }
 ; {>  %_692~0':_r64 %_693~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_727:
NS_E_737:
; 	|» 0'
NS_E_RDI_737:
; » 0xr0 |~ {  } ⊢ %_734 : %_734
 ; {>  %_733~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_734
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f694 { %_734 %_733 } ⊢ { %_735 %_736 } : { %_735 %_736 }
 ; {>  %_734~1':_r64 %_733~0':(_lst)◂(_r64) }
; _f694 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_738
	btr r12,2
	jmp LB_739
LB_738:
	bts r12,2
LB_739:
	mov r14,r13
	bt r12,0
	jc LB_740
	btr r12,1
	jmp LB_741
LB_740:
	bts r12,1
LB_741:
	mov r13,r8
	bt r12,2
	jc LB_742
	btr r12,0
	jmp LB_743
LB_742:
	bts r12,0
LB_743:
	call NS_E_694
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_736
 ; {>  %_735~0':_r64 %_736~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_744
	mov rdi,r13
	call dlt
LB_744:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_745
	btr r12,0
	jmp LB_746
LB_745:
	bts r12,0
LB_746:
	ret
NS_E_765:
; 	|» { 0' 1' }
NS_E_RDI_765:
MTC_LB_766:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_767
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
	jnc LB_768
	bt QWORD [rdi],0
	jc LB_769
	btr r12,5
	clc
	jmp LB_770
LB_769:
	bts r12,5
	stc
LB_770:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_768:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_779
	btr r12,6
	clc
	jmp LB_780
LB_779:
	bts r12,6
	stc
LB_780:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_773
	btr r12,4
	clc
	jmp LB_774
LB_773:
	bts r12,4
	stc
LB_774:
	mov r8,r10
	bt r12,4
	jc LB_771
	btr r12,2
	jmp LB_772
LB_771:
	bts r12,2
LB_772:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_777
	btr r12,4
	clc
	jmp LB_778
LB_777:
	bts r12,4
	stc
LB_778:
	mov r9,r10
	bt r12,4
	jc LB_775
	btr r12,3
	jmp LB_776
LB_775:
	bts r12,3
LB_776:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_783
	btr r12,6
	clc
	jmp LB_784
LB_783:
	bts r12,6
	stc
LB_784:
	mov r10,rcx
	bt r12,6
	jc LB_781
	btr r12,4
	jmp LB_782
LB_781:
	bts r12,4
LB_782:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_785:
	cmp r15,0
	jz LB_786
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_785
LB_786:
MTC_LB_787:
	mov r15,0
	mov rdi,r14
	mov rsi,r8
	bt r12,1
	call eq
	jnz MTC_LB_788
LB_789:
	cmp r15,0
	jz LB_790
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_789
LB_790:
MTC_LB_791:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_792
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
	jnc LB_793
	bt QWORD [rdi],0
	jc LB_794
	btr r12,5
	clc
	jmp LB_795
LB_794:
	bts r12,5
	stc
LB_795:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_793:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_796
	btr r12,0
	jmp LB_797
LB_796:
	bts r12,0
LB_797:
LB_798:
	cmp r15,0
	jz LB_799
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_798
LB_799:
; _emt_mov_ptn_to_ptn:{| 111010.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_800
	btr r12,3
	jmp LB_801
LB_800:
	bts r12,3
LB_801:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_810
	btr r12,5
	clc
	jmp LB_811
LB_810:
	bts r12,5
	stc
LB_811:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_808
	btr r12,4
	clc
	jmp LB_809
LB_808:
	bts r12,4
	stc
LB_809:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_806
	btr r12,3
	clc
	jmp LB_807
LB_806:
	bts r12,3
	stc
LB_807:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_804
	btr r12,2
	clc
	jmp LB_805
LB_804:
	bts r12,2
	stc
LB_805:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_802
	btr r12,1
	clc
	jmp LB_803
LB_802:
	bts r12,1
	stc
LB_803:
	add rsp,40
; _some %_753 ⊢ %_755 : %_755
 ; {>  %_754~5':t224'(-1) %_749~2':t216'(-1) %_748~1':t216'(-1) %_751~4':(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) %_753~3':t224'(-1) }
; _some 3' ⊢ °0◂3'
; _cns { { %_749 %_755 } %_751 } ⊢ %_756 : %_756
 ; {>  %_754~5':t224'(-1) %_749~2':t216'(-1) %_748~1':t216'(-1) %_751~4':(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) %_755~°0◂3':(_opn)◂(t224'(-1)) }
; _cns { { 2' °0◂3' } 4' } ⊢ °0◂{ { 2' °0◂3' } 4' }
; _some %_754 ⊢ %_757 : %_757
 ; {>  %_754~5':t224'(-1) %_748~1':t216'(-1) %_756~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) }
; _some 5' ⊢ °0◂5'
; ∎ { %_756 %_748 %_757 }
 ; {>  %_757~°0◂5':(_opn)◂(t224'(-1)) %_748~1':t216'(-1) %_756~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) }
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
	jc LB_818
	btr r12,7
	jmp LB_819
LB_818:
	bts r12,7
LB_819:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_816
	btr QWORD [rdi],0
	jmp LB_817
LB_816:
	bts QWORD [rdi],0
LB_817:
	mov rdx,r9
	bt r12,3
	jc LB_824
	btr r12,7
	jmp LB_825
LB_824:
	bts r12,7
LB_825:
	mov rsi,1
	bt r12,7
	jc LB_822
	mov rsi,0
	bt rdx,0
	jc LB_822
	jmp LB_823
LB_822:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_823:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_820
	btr QWORD [rdi],1
	jmp LB_821
LB_820:
	bts QWORD [rdi],1
LB_821:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_814
	btr QWORD [rdi],0
	jmp LB_815
LB_814:
	bts QWORD [rdi],0
LB_815:
	mov rcx,r10
	bt r12,4
	jc LB_828
	btr r12,6
	jmp LB_829
LB_828:
	bts r12,6
LB_829:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_826
	btr QWORD [rdi],1
	jmp LB_827
LB_826:
	bts QWORD [rdi],1
LB_827:
	mov rsi,1
	bt r12,0
	jc LB_812
	mov rsi,0
	bt r13,0
	jc LB_812
	jmp LB_813
LB_812:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_813:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov r8,r11
	bt r12,5
	jc LB_832
	btr r12,2
	jmp LB_833
LB_832:
	bts r12,2
LB_833:
	mov rsi,1
	bt r12,2
	jc LB_830
	mov rsi,0
	bt r8,0
	jc LB_830
	jmp LB_831
LB_830:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_831:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_792:
	mov r15,0
LB_835:
	cmp r15,0
	jz LB_836
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_835
LB_836:
; _cns { { %_749 %_750 } %_751 } ⊢ %_758 : %_758
 ; {>  %_749~2':t216'(-1) %_748~1':t216'(-1) %_751~4':(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) %_750~3':(_opn)◂(t224'(-1)) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _none {  } ⊢ %_759 : %_759
 ; {>  %_758~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) %_748~1':t216'(-1) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_758 %_748 %_759 }
 ; {>  %_758~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) %_748~1':t216'(-1) %_759~°1◂{  }:(_opn)◂(t210'(0)) }
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
	jc LB_843
	btr r12,6
	jmp LB_844
LB_843:
	bts r12,6
LB_844:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_841
	btr QWORD [rdi],0
	jmp LB_842
LB_841:
	bts QWORD [rdi],0
LB_842:
	mov rcx,r9
	bt r12,3
	jc LB_847
	btr r12,6
	jmp LB_848
LB_847:
	bts r12,6
LB_848:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_845
	btr QWORD [rdi],1
	jmp LB_846
LB_845:
	bts QWORD [rdi],1
LB_846:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_839
	btr QWORD [rdi],0
	jmp LB_840
LB_839:
	bts QWORD [rdi],0
LB_840:
	mov r11,r10
	bt r12,4
	jc LB_851
	btr r12,5
	jmp LB_852
LB_851:
	bts r12,5
LB_852:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_849
	btr QWORD [rdi],1
	jmp LB_850
LB_849:
	bts QWORD [rdi],1
LB_850:
	mov rsi,1
	bt r12,0
	jc LB_837
	mov rsi,0
	bt r13,0
	jc LB_837
	jmp LB_838
LB_837:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_838:
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
	jc LB_853
	mov rsi,0
	bt r8,0
	jc LB_853
	jmp LB_854
LB_853:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_854:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_834:
MTC_LB_788:
	mov r15,0
LB_856:
	cmp r15,0
	jz LB_857
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_856
LB_857:
; _f765 { %_751 %_748 } ⊢ { %_760 %_761 %_762 } : { %_760 %_761 %_762 }
 ; {>  %_749~2':t216'(-1) %_748~1':t216'(-1) %_751~4':(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) %_750~3':(_opn)◂(t224'(-1)) }
; _f765 { 4' 1' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010010.. |},{ 4' 1' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,4
	jc LB_862
	btr r12,0
	jmp LB_863
LB_862:
	bts r12,0
LB_863:
	call NS_E_765
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_864
	btr r12,4
	jmp LB_865
LB_864:
	bts r12,4
LB_865:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_860
	btr r12,3
	clc
	jmp LB_861
LB_860:
	bts r12,3
	stc
LB_861:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_858
	btr r12,2
	clc
	jmp LB_859
LB_858:
	bts r12,2
	stc
LB_859:
	add rsp,24
; _cns { { %_749 %_750 } %_760 } ⊢ %_763 : %_763
 ; {>  %_749~2':t216'(-1) %_762~4':(_opn)◂(t224'(-1)) %_761~1':t216'(-1) %_760~0':(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) %_750~3':(_opn)◂(t224'(-1)) }
; _cns { { 2' 3' } 0' } ⊢ °0◂{ { 2' 3' } 0' }
; ∎ { %_763 %_761 %_762 }
 ; {>  %_762~4':(_opn)◂(t224'(-1)) %_761~1':t216'(-1) %_763~°0◂{ { 2' 3' } 0' }:(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) }
; 	∎ { °0◂{ { 2' 3' } 0' } 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ °0◂{ { 2' 3' } 0' } 1' 4' } ⊢ { 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_866
	btr r12,5
	jmp LB_867
LB_866:
	bts r12,5
LB_867:
	mov r8,r10
	bt r12,4
	jc LB_868
	btr r12,2
	jmp LB_869
LB_868:
	bts r12,2
LB_869:
	mov r10,r13
	bt r12,0
	jc LB_870
	btr r12,4
	jmp LB_871
LB_870:
	bts r12,4
LB_871:
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
	jc LB_878
	btr r12,7
	jmp LB_879
LB_878:
	bts r12,7
LB_879:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_876
	btr QWORD [rdi],0
	jmp LB_877
LB_876:
	bts QWORD [rdi],0
LB_877:
	mov rdx,r9
	bt r12,3
	jc LB_882
	btr r12,7
	jmp LB_883
LB_882:
	bts r12,7
LB_883:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_880
	btr QWORD [rdi],1
	jmp LB_881
LB_880:
	bts QWORD [rdi],1
LB_881:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_874
	btr QWORD [rdi],0
	jmp LB_875
LB_874:
	bts QWORD [rdi],0
LB_875:
	mov rcx,r10
	bt r12,4
	jc LB_886
	btr r12,6
	jmp LB_887
LB_886:
	bts r12,6
LB_887:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_884
	btr QWORD [rdi],1
	jmp LB_885
LB_884:
	bts QWORD [rdi],1
LB_885:
	mov rsi,1
	bt r12,0
	jc LB_872
	mov rsi,0
	bt r13,0
	jc LB_872
	jmp LB_873
LB_872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_873:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_855:
MTC_LB_767:
	mov r15,0
LB_889:
	cmp r15,0
	jz LB_890
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_889
LB_890:
; _none {  } ⊢ %_764 : %_764
 ; {>  %_748~1':t216'(-1) %_747~0':(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_747 %_748 %_764 }
 ; {>  %_764~°1◂{  }:(_opn)◂(t221'(0)) %_748~1':t216'(-1) %_747~0':(_lst)◂({ t216'(-1) (_opn)◂(t224'(-1)) }) }
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
	jc LB_891
	mov rsi,0
	bt r8,0
	jc LB_891
	jmp LB_892
LB_891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_892:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_888:
NS_E_893:
NS_E_RDI_893:
NS_E_893_ETR_TBL:
NS_E_893_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_934
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_934
	jmp LB_935
LB_934:
	jmp LB_924
LB_935:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_894_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_939
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_940
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_940:
	jmp LB_924
LB_939:
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
	jc LB_927
	btr r12,1
	clc
	jmp LB_928
LB_927:
	bts r12,1
	stc
LB_928:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_925
	btr r12,0
	clc
	jmp LB_926
LB_925:
	bts r12,0
	stc
LB_926:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_921
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_942
	btr r12,5
	jmp LB_943
LB_942:
	bts r12,5
LB_943:
	mov r13,r14
	bt r12,1
	jc LB_944
	btr r12,0
	jmp LB_945
LB_944:
	bts r12,0
LB_945:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f737 %_896 ⊢ %_897 : %_897
 ; {>  %_896~0':(_lst)◂(_r64) }
; _f737 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_737
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_897 ⊢ %_898 : %_898
 ; {>  %_897~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_898
 ; {>  %_898~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_919
	btr r12,3
	jmp LB_920
LB_919:
	bts r12,3
LB_920:
	mov r8,0
	bts r12,2
	ret
LB_921:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_923
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_922
LB_923:
	add rsp,8
	ret
LB_924:
	add rsp,32
	pop r14
LB_922:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_894:
NS_E_RDI_894:
NS_E_894_ETR_TBL:
NS_E_894_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_971
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_971
	jmp LB_972
LB_971:
	jmp LB_959
LB_972:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_895_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_976
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_977
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_977:
	jmp LB_959
LB_976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_894_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_982
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_983
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_983:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_984
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_984:
	jmp LB_959
LB_982:
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
	jc LB_964
	btr r12,2
	clc
	jmp LB_965
LB_964:
	bts r12,2
	stc
LB_965:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_962
	btr r12,1
	clc
	jmp LB_963
LB_962:
	bts r12,1
	stc
LB_963:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_960
	btr r12,0
	clc
	jmp LB_961
LB_960:
	bts r12,0
	stc
LB_961:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_956
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov rcx,r14
	bt r12,1
	jc LB_986
	btr r12,6
	jmp LB_987
LB_986:
	bts r12,6
LB_987:
	mov r14,r8
	bt r12,2
	jc LB_988
	btr r12,1
	jmp LB_989
LB_988:
	bts r12,1
LB_989:
	mov r8,r13
	bt r12,0
	jc LB_990
	btr r12,2
	jmp LB_991
LB_990:
	bts r12,2
LB_991:
	mov r13,rcx
	bt r12,6
	jc LB_992
	btr r12,0
	jmp LB_993
LB_992:
	bts r12,0
LB_993:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _cns { %_899 %_900 } ⊢ %_901 : %_901
 ; {>  %_899~0':_r64 %_900~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_901 ⊢ %_902 : %_902
 ; {>  %_901~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_902
 ; {>  %_902~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_950
	btr r12,2
	jmp LB_951
LB_950:
	bts r12,2
LB_951:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_948
	btr QWORD [rdi],0
	jmp LB_949
LB_948:
	bts QWORD [rdi],0
LB_949:
	mov r8,r14
	bt r12,1
	jc LB_954
	btr r12,2
	jmp LB_955
LB_954:
	bts r12,2
LB_955:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_952
	btr QWORD [rdi],1
	jmp LB_953
LB_952:
	bts QWORD [rdi],1
LB_953:
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
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_956:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_958
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_957
LB_958:
	add rsp,8
	ret
LB_959:
	add rsp,48
	pop r14
LB_957:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1007
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_1007
	jmp LB_1008
LB_1007:
	jmp LB_999
LB_1008:
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
	jc LB_1000
	btr r12,0
	clc
	jmp LB_1001
LB_1000:
	bts r12,0
	stc
LB_1001:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_996
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_903 : %_903
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_903 ⊢ %_904 : %_904
 ; {>  %_903~°1◂{  }:(_lst)◂(t273'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_904
 ; {>  %_904~°0◂°1◂{  }:(_opn)◂((_lst)◂(t276'(0))) }
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
	jc LB_994
	mov rsi,0
	bt r9,0
	jc LB_994
	jmp LB_995
LB_994:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_995:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_996:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_998
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_997
LB_998:
	add rsp,8
	ret
LB_999:
	add rsp,16
	pop r14
LB_997:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1030
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1022
LB_1030:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_894_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1035
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1036
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1036:
	jmp LB_1022
LB_1035:
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
	jc LB_1025
	btr r12,1
	clc
	jmp LB_1026
LB_1025:
	bts r12,1
	stc
LB_1026:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1023
	btr r12,0
	clc
	jmp LB_1024
LB_1023:
	bts r12,0
	stc
LB_1024:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1019
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_905 %_906 } ⊢ %_907 : %_907
 ; {>  %_905~0':_r64 %_906~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_907 ⊢ %_908 : %_908
 ; {>  %_907~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_908
 ; {>  %_908~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_1013
	btr r12,2
	jmp LB_1014
LB_1013:
	bts r12,2
LB_1014:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_1011
	btr QWORD [rdi],0
	jmp LB_1012
LB_1011:
	bts QWORD [rdi],0
LB_1012:
	mov r8,r14
	bt r12,1
	jc LB_1017
	btr r12,2
	jmp LB_1018
LB_1017:
	bts r12,2
LB_1018:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_1015
	btr QWORD [rdi],1
	jmp LB_1016
LB_1015:
	bts QWORD [rdi],1
LB_1016:
	mov rsi,1
	bt r12,3
	jc LB_1009
	mov rsi,0
	bt r9,0
	jc LB_1009
	jmp LB_1010
LB_1009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1010:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1019:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1021
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1020
LB_1021:
	add rsp,8
	ret
LB_1022:
	add rsp,32
	pop r14
LB_1020:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_895:
NS_E_RDI_895:
NS_E_895_ETR_TBL:
NS_E_895_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_1051
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_1051
	jmp LB_1052
LB_1051:
	jmp LB_1043
LB_1052:
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
	jc LB_1044
	btr r12,0
	clc
	jmp LB_1045
LB_1044:
	bts r12,0
	stc
LB_1045:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1040
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr5c |~ {  } ⊢ %_909 : %_909
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_909
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_909 ⊢ %_910 : %_910
 ; {>  %_909~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_910
 ; {>  %_910~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1038
	btr r12,3
	jmp LB_1039
LB_1038:
	bts r12,3
LB_1039:
	mov r8,0
	bts r12,2
	ret
LB_1040:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1042
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1041
LB_1042:
	add rsp,8
	ret
LB_1043:
	add rsp,16
	pop r14
LB_1041:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_1066
	jmp LB_1067
LB_1066:
	jmp LB_1058
LB_1067:
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
	jc LB_1059
	btr r12,0
	clc
	jmp LB_1060
LB_1059:
	bts r12,0
	stc
LB_1060:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1055
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr22 |~ {  } ⊢ %_911 : %_911
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_911
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_911 ⊢ %_912 : %_912
 ; {>  %_911~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_912
 ; {>  %_912~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1053
	btr r12,3
	jmp LB_1054
LB_1053:
	bts r12,3
LB_1054:
	mov r8,0
	bts r12,2
	ret
LB_1055:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1057
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1056
LB_1057:
	add rsp,8
	ret
LB_1058:
	add rsp,16
	pop r14
LB_1056:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_1081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_1081
	jmp LB_1082
LB_1081:
	jmp LB_1073
LB_1082:
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
	jc LB_1074
	btr r12,0
	clc
	jmp LB_1075
LB_1074:
	bts r12,0
	stc
LB_1075:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1070
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xra |~ {  } ⊢ %_913 : %_913
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_913
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_913 ⊢ %_914 : %_914
 ; {>  %_913~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_914
 ; {>  %_914~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1068
	btr r12,3
	jmp LB_1069
LB_1068:
	bts r12,3
LB_1069:
	mov r8,0
	bts r12,2
	ret
LB_1070:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1072
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1071
LB_1072:
	add rsp,8
	ret
LB_1073:
	add rsp,16
	pop r14
LB_1071:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_1096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_1096
	jmp LB_1097
LB_1096:
	jmp LB_1088
LB_1097:
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
	jc LB_1089
	btr r12,0
	clc
	jmp LB_1090
LB_1089:
	bts r12,0
	stc
LB_1090:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1085
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr9 |~ {  } ⊢ %_915 : %_915
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_915
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_915 ⊢ %_916 : %_916
 ; {>  %_915~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_916
 ; {>  %_916~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1083
	btr r12,3
	jmp LB_1084
LB_1083:
	bts r12,3
LB_1084:
	mov r8,0
	bts r12,2
	ret
LB_1085:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1087
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1086
LB_1087:
	add rsp,8
	ret
LB_1088:
	add rsp,16
	pop r14
LB_1086:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_1111
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_1111
	jmp LB_1112
LB_1111:
	jmp LB_1103
LB_1112:
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
	jc LB_1104
	btr r12,0
	clc
	jmp LB_1105
LB_1104:
	bts r12,0
	stc
LB_1105:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1100
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_917 : %_917
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_917
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_917 ⊢ %_918 : %_918
 ; {>  %_917~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_918
 ; {>  %_918~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1098
	btr r12,3
	jmp LB_1099
LB_1098:
	bts r12,3
LB_1099:
	mov r8,0
	bts r12,2
	ret
LB_1100:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1102
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1101
LB_1102:
	add rsp,8
	ret
LB_1103:
	add rsp,16
	pop r14
LB_1101:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1113:
NS_E_RDI_1113:
NS_E_1113_ETR_TBL:
NS_E_1113_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1152
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1146
LB_1152:
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
	jc LB_1147
	btr r12,0
	clc
	jmp LB_1148
LB_1147:
	bts r12,0
	stc
LB_1148:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1143
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr30 |~ {  } ⊢ %_1115 : %_1115
 ; {>  %_1114~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_1115
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_1116 : %_1116
 ; {>  %_1115~1':_r64 %_1114~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_1116
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_1114 %_1115 } ⊢ { %_1117 %_1118 %_1119 } : { %_1117 %_1118 %_1119 }
 ; {>  %_1116~2':_r64 %_1115~1':_r64 %_1114~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1116 %_1117 } ⊢ { %_1120 %_1121 %_1122 } : { %_1120 %_1121 %_1122 }
 ; {>  %_1116~2':_r64 %_1119~3':_r64 %_1118~1':_r64 %_1117~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1125:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1126
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1126
LB_1127:
	cmp r15,0
	jz LB_1128
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1127
LB_1128:
; _some %_1121 ⊢ %_1123 : %_1123
 ; {>  %_1119~3':_r64 %_1118~1':_r64 %_1120~2':_r64 %_1121~0':_r64 %_1122~4':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1123
 ; {>  %_1123~°0◂0':(_opn)◂(_r64) %_1119~3':_r64 %_1118~1':_r64 %_1120~2':_r64 %_1122~4':_r64 }
; 	∎ °0◂0'
	bt r12,3
	jc LB_1129
	mov rdi,r9
	call dlt
LB_1129:
	bt r12,1
	jc LB_1130
	mov rdi,r14
	call dlt
LB_1130:
	bt r12,2
	jc LB_1131
	mov rdi,r8
	call dlt
LB_1131:
	bt r12,4
	jc LB_1132
	mov rdi,r10
	call dlt
LB_1132:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1133
	btr r12,3
	jmp LB_1134
LB_1133:
	bts r12,3
LB_1134:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1126:
	mov r15,0
LB_1136:
	cmp r15,0
	jz LB_1137
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1136
LB_1137:
; _none {  } ⊢ %_1124 : %_1124
 ; {>  %_1119~3':_r64 %_1118~1':_r64 %_1120~2':_r64 %_1121~0':_r64 %_1122~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1124
 ; {>  %_1124~°1◂{  }:(_opn)◂(t352'(0)) %_1119~3':_r64 %_1118~1':_r64 %_1120~2':_r64 %_1121~0':_r64 %_1122~4':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_1138
	mov rdi,r9
	call dlt
LB_1138:
	bt r12,1
	jc LB_1139
	mov rdi,r14
	call dlt
LB_1139:
	bt r12,2
	jc LB_1140
	mov rdi,r8
	call dlt
LB_1140:
	bt r12,0
	jc LB_1141
	mov rdi,r13
	call dlt
LB_1141:
	bt r12,4
	jc LB_1142
	mov rdi,r10
	call dlt
LB_1142:
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
MTC_LB_1135:
LB_1143:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1145
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1144
LB_1145:
	add rsp,8
	ret
LB_1146:
	add rsp,16
	pop r14
LB_1144:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1154:
NS_E_RDI_1154:
NS_E_1154_ETR_TBL:
NS_E_1154_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1193
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1187
LB_1193:
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
	jc LB_1188
	btr r12,0
	clc
	jmp LB_1189
LB_1188:
	bts r12,0
	stc
LB_1189:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1184
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr61 |~ {  } ⊢ %_1156 : %_1156
 ; {>  %_1155~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_1156
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_1157 : %_1157
 ; {>  %_1156~1':_r64 %_1155~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_1157
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_1155 %_1156 } ⊢ { %_1158 %_1159 %_1160 } : { %_1158 %_1159 %_1160 }
 ; {>  %_1156~1':_r64 %_1155~0':_r64 %_1157~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1157 %_1158 } ⊢ { %_1161 %_1162 %_1163 } : { %_1161 %_1162 %_1163 }
 ; {>  %_1158~0':_r64 %_1160~3':_r64 %_1159~1':_r64 %_1157~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1166:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1167
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1167
LB_1168:
	cmp r15,0
	jz LB_1169
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1168
LB_1169:
; _some %_1162 ⊢ %_1164 : %_1164
 ; {>  %_1163~4':_r64 %_1162~0':_r64 %_1160~3':_r64 %_1161~2':_r64 %_1159~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1164
 ; {>  %_1163~4':_r64 %_1160~3':_r64 %_1161~2':_r64 %_1159~1':_r64 %_1164~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,4
	jc LB_1170
	mov rdi,r10
	call dlt
LB_1170:
	bt r12,3
	jc LB_1171
	mov rdi,r9
	call dlt
LB_1171:
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
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1174
	btr r12,3
	jmp LB_1175
LB_1174:
	bts r12,3
LB_1175:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1167:
	mov r15,0
LB_1177:
	cmp r15,0
	jz LB_1178
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1177
LB_1178:
; _none {  } ⊢ %_1165 : %_1165
 ; {>  %_1163~4':_r64 %_1162~0':_r64 %_1160~3':_r64 %_1161~2':_r64 %_1159~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1165
 ; {>  %_1165~°1◂{  }:(_opn)◂(t379'(0)) %_1163~4':_r64 %_1162~0':_r64 %_1160~3':_r64 %_1161~2':_r64 %_1159~1':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_1179
	mov rdi,r10
	call dlt
LB_1179:
	bt r12,0
	jc LB_1180
	mov rdi,r13
	call dlt
LB_1180:
	bt r12,3
	jc LB_1181
	mov rdi,r9
	call dlt
LB_1181:
	bt r12,2
	jc LB_1182
	mov rdi,r8
	call dlt
LB_1182:
	bt r12,1
	jc LB_1183
	mov rdi,r14
	call dlt
LB_1183:
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
MTC_LB_1176:
LB_1184:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1186
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1185
LB_1186:
	add rsp,8
	ret
LB_1187:
	add rsp,16
	pop r14
LB_1185:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1195:
NS_E_RDI_1195:
NS_E_1195_ETR_TBL:
NS_E_1195_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1234
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1228
LB_1234:
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
	jc LB_1229
	btr r12,0
	clc
	jmp LB_1230
LB_1229:
	bts r12,0
	stc
LB_1230:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1225
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr41 |~ {  } ⊢ %_1197 : %_1197
 ; {>  %_1196~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_1197
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_1198 : %_1198
 ; {>  %_1196~0':_r64 %_1197~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_1198
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_1196 %_1197 } ⊢ { %_1199 %_1200 %_1201 } : { %_1199 %_1200 %_1201 }
 ; {>  %_1196~0':_r64 %_1197~1':_r64 %_1198~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1198 %_1199 } ⊢ { %_1202 %_1203 %_1204 } : { %_1202 %_1203 %_1204 }
 ; {>  %_1199~0':_r64 %_1198~2':_r64 %_1201~3':_r64 %_1200~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1207:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1208
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1208
LB_1209:
	cmp r15,0
	jz LB_1210
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1209
LB_1210:
; _some %_1203 ⊢ %_1205 : %_1205
 ; {>  %_1203~0':_r64 %_1204~4':_r64 %_1201~3':_r64 %_1202~2':_r64 %_1200~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1205
 ; {>  %_1204~4':_r64 %_1201~3':_r64 %_1202~2':_r64 %_1200~1':_r64 %_1205~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,4
	jc LB_1211
	mov rdi,r10
	call dlt
LB_1211:
	bt r12,3
	jc LB_1212
	mov rdi,r9
	call dlt
LB_1212:
	bt r12,2
	jc LB_1213
	mov rdi,r8
	call dlt
LB_1213:
	bt r12,1
	jc LB_1214
	mov rdi,r14
	call dlt
LB_1214:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1215
	btr r12,3
	jmp LB_1216
LB_1215:
	bts r12,3
LB_1216:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1208:
	mov r15,0
LB_1218:
	cmp r15,0
	jz LB_1219
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1218
LB_1219:
; _none {  } ⊢ %_1206 : %_1206
 ; {>  %_1203~0':_r64 %_1204~4':_r64 %_1201~3':_r64 %_1202~2':_r64 %_1200~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1206
 ; {>  %_1206~°1◂{  }:(_opn)◂(t406'(0)) %_1203~0':_r64 %_1204~4':_r64 %_1201~3':_r64 %_1202~2':_r64 %_1200~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_1220
	mov rdi,r13
	call dlt
LB_1220:
	bt r12,4
	jc LB_1221
	mov rdi,r10
	call dlt
LB_1221:
	bt r12,3
	jc LB_1222
	mov rdi,r9
	call dlt
LB_1222:
	bt r12,2
	jc LB_1223
	mov rdi,r8
	call dlt
LB_1223:
	bt r12,1
	jc LB_1224
	mov rdi,r14
	call dlt
LB_1224:
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
MTC_LB_1217:
LB_1225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1227
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1226
LB_1227:
	add rsp,8
	ret
LB_1228:
	add rsp,16
	pop r14
LB_1226:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1236:
NS_E_RDI_1236:
NS_E_1236_ETR_TBL:
NS_E_1236_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_1195_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1252
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1246
LB_1252:
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
	jc LB_1247
	btr r12,0
	clc
	jmp LB_1248
LB_1247:
	bts r12,0
	stc
LB_1248:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1243
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1237 ⊢ %_1238 : %_1238
 ; {>  %_1237~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1238
 ; {>  %_1238~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1241
	btr r12,3
	jmp LB_1242
LB_1241:
	bts r12,3
LB_1242:
	mov r8,0
	bts r12,2
	ret
LB_1243:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1245
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1244
LB_1245:
	add rsp,8
	ret
LB_1246:
	add rsp,16
	pop r14
LB_1244:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_1154_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1265
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1259
LB_1265:
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
	jc LB_1260
	btr r12,0
	clc
	jmp LB_1261
LB_1260:
	bts r12,0
	stc
LB_1261:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1256
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1239 ⊢ %_1240 : %_1240
 ; {>  %_1239~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1240
 ; {>  %_1240~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1254
	btr r12,3
	jmp LB_1255
LB_1254:
	bts r12,3
LB_1255:
	mov r8,0
	bts r12,2
	ret
LB_1256:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1258
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1257
LB_1258:
	add rsp,8
	ret
LB_1259:
	add rsp,16
	pop r14
LB_1257:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1267:
NS_E_RDI_1267:
NS_E_1267_ETR_TBL:
NS_E_1267_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_1236_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1312
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1304
LB_1312:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1317
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1318:
	jmp LB_1304
LB_1317:
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
	jc LB_1307
	btr r12,1
	clc
	jmp LB_1308
LB_1307:
	bts r12,1
	stc
LB_1308:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1305
	btr r12,0
	clc
	jmp LB_1306
LB_1305:
	bts r12,0
	stc
LB_1306:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1301
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_1270 %_1271 } ⊢ %_1272 : %_1272
 ; {>  %_1271~1':(_lst)◂(_r64) %_1270~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f737 %_1272 ⊢ %_1273 : %_1273
 ; {>  %_1272~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f737 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1287
	btr r12,2
	jmp LB_1288
LB_1287:
	bts r12,2
LB_1288:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1293
	btr r12,3
	jmp LB_1294
LB_1293:
	bts r12,3
LB_1294:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1291
	btr QWORD [rdi],0
	jmp LB_1292
LB_1291:
	bts QWORD [rdi],0
LB_1292:
	mov r9,r14
	bt r12,1
	jc LB_1297
	btr r12,3
	jmp LB_1298
LB_1297:
	bts r12,3
LB_1298:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1295
	btr QWORD [rdi],1
	jmp LB_1296
LB_1295:
	bts QWORD [rdi],1
LB_1296:
	mov rsi,1
	bt r12,0
	jc LB_1289
	mov rsi,0
	bt r13,0
	jc LB_1289
	jmp LB_1290
LB_1289:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1290:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_737
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1273 ⊢ %_1274 : %_1274
 ; {>  %_1273~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1274
 ; {>  %_1274~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1299
	btr r12,3
	jmp LB_1300
LB_1299:
	bts r12,3
LB_1300:
	mov r8,0
	bts r12,2
	ret
LB_1301:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1303
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1302
LB_1303:
	add rsp,8
	ret
LB_1304:
	add rsp,32
	pop r14
LB_1302:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1268:
NS_E_RDI_1268:
NS_E_1268_ETR_TBL:
NS_E_1268_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_1269_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1341
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1333
LB_1341:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1346
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1347
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1347:
	jmp LB_1333
LB_1346:
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
	jc LB_1336
	btr r12,1
	clc
	jmp LB_1337
LB_1336:
	bts r12,1
	stc
LB_1337:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1334
	btr r12,0
	clc
	jmp LB_1335
LB_1334:
	bts r12,0
	stc
LB_1335:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1330
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_1275 %_1276 } ⊢ %_1277 : %_1277
 ; {>  %_1275~0':_r64 %_1276~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_1277 ⊢ %_1278 : %_1278
 ; {>  %_1277~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_1278
 ; {>  %_1278~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_1324
	btr r12,2
	jmp LB_1325
LB_1324:
	bts r12,2
LB_1325:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_1322
	btr QWORD [rdi],0
	jmp LB_1323
LB_1322:
	bts QWORD [rdi],0
LB_1323:
	mov r8,r14
	bt r12,1
	jc LB_1328
	btr r12,2
	jmp LB_1329
LB_1328:
	bts r12,2
LB_1329:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_1326
	btr QWORD [rdi],1
	jmp LB_1327
LB_1326:
	bts QWORD [rdi],1
LB_1327:
	mov rsi,1
	bt r12,3
	jc LB_1320
	mov rsi,0
	bt r9,0
	jc LB_1320
	jmp LB_1321
LB_1320:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1321:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1330:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1332
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1331
LB_1332:
	add rsp,8
	ret
LB_1333:
	add rsp,32
	pop r14
LB_1331:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_1351
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_1279 : %_1279
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_1279 ⊢ %_1280 : %_1280
 ; {>  %_1279~°1◂{  }:(_lst)◂(t450'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_1280
 ; {>  %_1280~°0◂°1◂{  }:(_opn)◂((_lst)◂(t453'(0))) }
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
	jc LB_1349
	mov rsi,0
	bt r9,0
	jc LB_1349
	jmp LB_1350
LB_1349:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1350:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1351:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1353
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1352
LB_1353:
	add rsp,8
	ret
LB_1354:
	add rsp,0
	pop r14
LB_1352:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1269:
NS_E_RDI_1269:
NS_E_1269_ETR_TBL:
NS_E_1269_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_1236_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1366
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1360
LB_1366:
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
	jc LB_1361
	btr r12,0
	clc
	jmp LB_1362
LB_1361:
	bts r12,0
	stc
LB_1362:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1357
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1281 ⊢ %_1282 : %_1282
 ; {>  %_1281~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1282
 ; {>  %_1282~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1355
	btr r12,3
	jmp LB_1356
LB_1355:
	bts r12,3
LB_1356:
	mov r8,0
	bts r12,2
	ret
LB_1357:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1359
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1358
LB_1359:
	add rsp,8
	ret
LB_1360:
	add rsp,16
	pop r14
LB_1358:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_1113_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1379
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1373
LB_1379:
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
	jc LB_1374
	btr r12,0
	clc
	jmp LB_1375
LB_1374:
	bts r12,0
	stc
LB_1375:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1370
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1283 ⊢ %_1284 : %_1284
 ; {>  %_1283~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1284
 ; {>  %_1284~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1368
	btr r12,3
	jmp LB_1369
LB_1368:
	bts r12,3
LB_1369:
	mov r8,0
	bts r12,2
	ret
LB_1370:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1372
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1371
LB_1372:
	add rsp,8
	ret
LB_1373:
	add rsp,16
	pop r14
LB_1371:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1394
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1394
	jmp LB_1395
LB_1394:
	jmp LB_1386
LB_1395:
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
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr5f |~ {  } ⊢ %_1285 : %_1285
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_1285
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_1285 ⊢ %_1286 : %_1286
 ; {>  %_1285~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1286
 ; {>  %_1286~°0◂0':(_opn)◂(_r64) }
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
NS_E_1396:
NS_E_RDI_1396:
NS_E_1396_ETR_TBL:
NS_E_1396_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1417
	jmp LB_1418
LB_1417:
	jmp LB_1407
LB_1418:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_1268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1422
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1423
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1423:
	jmp LB_1407
LB_1422:
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
	jc LB_1410
	btr r12,1
	clc
	jmp LB_1411
LB_1410:
	bts r12,1
	stc
LB_1411:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1408
	btr r12,0
	clc
	jmp LB_1409
LB_1408:
	bts r12,0
	stc
LB_1409:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1404
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_1425
	btr r12,5
	jmp LB_1426
LB_1425:
	bts r12,5
LB_1426:
	mov r13,r14
	bt r12,1
	jc LB_1427
	btr r12,0
	jmp LB_1428
LB_1427:
	bts r12,0
LB_1428:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f737 %_1397 ⊢ %_1398 : %_1398
 ; {>  %_1397~0':(_lst)◂(_r64) }
; _f737 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_737
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1398 ⊢ %_1399 : %_1399
 ; {>  %_1398~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1399
 ; {>  %_1399~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1402
	btr r12,3
	jmp LB_1403
LB_1402:
	bts r12,3
LB_1403:
	mov r8,0
	bts r12,2
	ret
LB_1404:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1406
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1405
LB_1406:
	add rsp,8
	ret
LB_1407:
	add rsp,32
	pop r14
LB_1405:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1440
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1434
LB_1440:
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
	jc LB_1435
	btr r12,0
	clc
	jmp LB_1436
LB_1435:
	bts r12,0
	stc
LB_1436:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1431
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _some %_1400 ⊢ %_1401 : %_1401
 ; {>  %_1400~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1401
 ; {>  %_1401~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1429
	btr r12,3
	jmp LB_1430
LB_1429:
	bts r12,3
LB_1430:
	mov r8,0
	bts r12,2
	ret
LB_1431:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1433
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1432
LB_1433:
	add rsp,8
	ret
LB_1434:
	add rsp,16
	pop r14
LB_1432:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1453:
; 	|» 0'
NS_E_RDI_1453:
MTC_LB_1454:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1455
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
	jnc LB_1456
	bt QWORD [rdi],0
	jc LB_1457
	btr r12,3
	clc
	jmp LB_1458
LB_1457:
	bts r12,3
	stc
LB_1458:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1456:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1461
	btr r12,4
	clc
	jmp LB_1462
LB_1461:
	bts r12,4
	stc
LB_1462:
	mov r14,r10
	bt r12,4
	jc LB_1459
	btr r12,1
	jmp LB_1460
LB_1459:
	bts r12,1
LB_1460:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1465
	btr r12,4
	clc
	jmp LB_1466
LB_1465:
	bts r12,4
	stc
LB_1466:
	mov r8,r10
	bt r12,4
	jc LB_1463
	btr r12,2
	jmp LB_1464
LB_1463:
	bts r12,2
LB_1464:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1467:
	cmp r15,0
	jz LB_1468
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1467
LB_1468:
; _f1453 %_1447 ⊢ %_1448 : %_1448
 ; {>  %_1446~1':_stg %_1447~2':_p1442 }
; _f1453 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1471
	btr r12,0
	jmp LB_1472
LB_1471:
	bts r12,0
LB_1472:
	call NS_E_1453
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1469
	btr r12,1
	clc
	jmp LB_1470
LB_1469:
	bts r12,1
	stc
LB_1470:
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
; ∎ %_1451
 ; {>  %_1450~0':_stg %_1449~1':_stg %_1451~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1473
	mov rdi,r13
	call dlt
LB_1473:
	bt r12,1
	jc LB_1474
	mov rdi,r14
	call dlt
LB_1474:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1475
	btr r12,0
	jmp LB_1476
LB_1475:
	bts r12,0
LB_1476:
	ret
MTC_LB_1455:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1477
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
	jnc LB_1478
	bt QWORD [rdi],0
	jc LB_1479
	btr r12,2
	clc
	jmp LB_1480
LB_1479:
	bts r12,2
	stc
LB_1480:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1478:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1481
	btr r12,1
	jmp LB_1482
LB_1481:
	bts r12,1
LB_1482:
LB_1483:
	cmp r15,0
	jz LB_1484
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1483
LB_1484:
; ∎ %_1452
 ; {>  %_1452~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1485
	btr r12,0
	jmp LB_1486
LB_1485:
	bts r12,0
LB_1486:
	ret
MTC_LB_1477:
NS_E_1595:
; 	|» 0'
NS_E_RDI_1595:
MTC_LB_1596:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1597
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
	jnc LB_1598
	bt QWORD [rdi],0
	jc LB_1599
	btr r12,2
	clc
	jmp LB_1600
LB_1599:
	bts r12,2
	stc
LB_1600:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1598:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1601
	btr r12,1
	jmp LB_1602
LB_1601:
	bts r12,1
LB_1602:
LB_1603:
	cmp r15,0
	jz LB_1604
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1603
LB_1604:
; 	» "??r" _ ⊢ 0' : %_1590
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1590
 ; {>  %_1590~0':_stg %_1589~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_1605
	mov rdi,r14
	call dlt
LB_1605:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1597:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1606
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
	jnc LB_1607
	bt QWORD [rdi],0
	jc LB_1608
	btr r12,2
	clc
	jmp LB_1609
LB_1608:
	bts r12,2
	stc
LB_1609:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1607:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1610
	btr r12,1
	jmp LB_1611
LB_1610:
	bts r12,1
LB_1611:
LB_1612:
	cmp r15,0
	jz LB_1613
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1612
LB_1613:
; 	» ".." _ ⊢ 0' : %_1592
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1592
 ; {>  %_1591~1':_stg %_1592~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1614
	mov rdi,r14
	call dlt
LB_1614:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1606:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1615
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
	jnc LB_1616
	bt QWORD [rdi],0
	jc LB_1617
	btr r12,2
	clc
	jmp LB_1618
LB_1617:
	bts r12,2
	stc
LB_1618:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1616:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1619
	btr r12,1
	jmp LB_1620
LB_1619:
	bts r12,1
LB_1620:
LB_1621:
	cmp r15,0
	jz LB_1622
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1621
LB_1622:
; _f1453 %_1593 ⊢ %_1594 : %_1594
 ; {>  %_1593~1':_p1442 }
; _f1453 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1623
	btr r12,0
	jmp LB_1624
LB_1623:
	bts r12,0
LB_1624:
	call NS_E_1453
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1594
 ; {>  %_1594~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1615:
NS_E_1656:
; 	|» 0'
NS_E_RDI_1656:
MTC_LB_1657:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1658
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
	jnc LB_1659
	bt QWORD [rdi],0
	jc LB_1660
	btr r12,3
	clc
	jmp LB_1661
LB_1660:
	bts r12,3
	stc
LB_1661:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1659:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1664
	btr r12,4
	clc
	jmp LB_1665
LB_1664:
	bts r12,4
	stc
LB_1665:
	mov r14,r10
	bt r12,4
	jc LB_1662
	btr r12,1
	jmp LB_1663
LB_1662:
	bts r12,1
LB_1663:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1668
	btr r12,4
	clc
	jmp LB_1669
LB_1668:
	bts r12,4
	stc
LB_1669:
	mov r8,r10
	bt r12,4
	jc LB_1666
	btr r12,2
	jmp LB_1667
LB_1666:
	bts r12,2
LB_1667:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1670:
	cmp r15,0
	jz LB_1671
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1670
LB_1671:
; _f1646 %_1648 ⊢ %_1650 : %_1650
 ; {>  %_1649~2':(_lst)◂((_p1487)◂((_p1500)◂(_stg))) %_1648~1':(_p1487)◂((_p1500)◂(_stg)) }
; _f1646 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1674
	btr r12,0
	jmp LB_1675
LB_1674:
	bts r12,0
LB_1675:
	call NS_E_1646
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1672
	btr r12,2
	clc
	jmp LB_1673
LB_1672:
	bts r12,2
	stc
LB_1673:
	add rsp,16
; _f1656 %_1649 ⊢ %_1651 : %_1651
 ; {>  %_1649~2':(_lst)◂((_p1487)◂((_p1500)◂(_stg))) %_1650~0':_stg }
; _f1656 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1678
	btr r12,0
	jmp LB_1679
LB_1678:
	bts r12,0
LB_1679:
	call NS_E_1656
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1680
	btr r12,1
	jmp LB_1681
LB_1680:
	bts r12,1
LB_1681:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1676
	btr r12,0
	clc
	jmp LB_1677
LB_1676:
	bts r12,0
	stc
LB_1677:
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
; ∎ %_1654
 ; {>  %_1652~0':_stg %_1654~2':_stg %_1653~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1682
	mov rdi,r13
	call dlt
LB_1682:
	bt r12,1
	jc LB_1683
	mov rdi,r14
	call dlt
LB_1683:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1684
	btr r12,0
	jmp LB_1685
LB_1684:
	bts r12,0
LB_1685:
	ret
MTC_LB_1658:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1686
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
	jnc LB_1687
	bt QWORD [rdi],0
	jc LB_1688
	btr r12,1
	clc
	jmp LB_1689
LB_1688:
	bts r12,1
	stc
LB_1689:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1687:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
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
; 	» "" _ ⊢ 0' : %_1655
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1655
 ; {>  %_1655~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1686:
NS_E_1646:
; 	|» 0'
NS_E_RDI_1646:
MTC_LB_1692:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1693
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
	jnc LB_1694
	bt QWORD [rdi],0
	jc LB_1695
	btr r12,2
	clc
	jmp LB_1696
LB_1695:
	bts r12,2
	stc
LB_1696:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1694:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1697
	btr r12,1
	jmp LB_1698
LB_1697:
	bts r12,1
LB_1698:
LB_1699:
	cmp r15,0
	jz LB_1700
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1699
LB_1700:
; _f1656 %_1626 ⊢ %_1627 : %_1627
 ; {>  %_1626~1':(_lst)◂((_p1487)◂((_p1500)◂(_stg))) }
; _f1656 1' ⊢ 0'
; push_iv 
	sub rsp,8
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
	call NS_E_1656
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
; ∎ %_1629
 ; {>  %_1628~0':_stg %_1629~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1703
	mov rdi,r13
	call dlt
LB_1703:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1704
	btr r12,0
	jmp LB_1705
LB_1704:
	bts r12,0
LB_1705:
	ret
MTC_LB_1693:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1706
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
	jnc LB_1707
	bt QWORD [rdi],0
	jc LB_1708
	btr r12,2
	clc
	jmp LB_1709
LB_1708:
	bts r12,2
	stc
LB_1709:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1707:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1710
	btr r12,1
	jmp LB_1711
LB_1710:
	bts r12,1
LB_1711:
LB_1712:
	cmp r15,0
	jz LB_1713
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1712
LB_1713:
MTC_LB_1714:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1715
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
	jnc LB_1716
	bt QWORD [rdi],0
	jc LB_1717
	btr r12,2
	clc
	jmp LB_1718
LB_1717:
	bts r12,2
	stc
LB_1718:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1716:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1719
	btr r12,0
	jmp LB_1720
LB_1719:
	bts r12,0
LB_1720:
LB_1721:
	cmp r15,0
	jz LB_1722
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1721
LB_1722:
; _f1595 %_1631 ⊢ %_1632 : %_1632
 ; {>  %_1631~0':_p1490 }
; _f1595 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1595
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
; ∎ %_1634
 ; {>  %_1634~1':_stg %_1633~0':_stg }
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
MTC_LB_1715:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1726
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{ 0' 2' }
; 1' ⊢ °0◂{ 0' 2' }
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1727
	bt QWORD [rdi],0
	jc LB_1728
	btr r12,3
	clc
	jmp LB_1729
LB_1728:
	bts r12,3
	stc
LB_1729:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1727:
	mov r9,rdi
; 3' ⊢ { 0' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1732
	btr r12,4
	clc
	jmp LB_1733
LB_1732:
	bts r12,4
	stc
LB_1733:
	mov r13,r10
	bt r12,4
	jc LB_1730
	btr r12,0
	jmp LB_1731
LB_1730:
	bts r12,0
LB_1731:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1736
	btr r12,4
	clc
	jmp LB_1737
LB_1736:
	bts r12,4
	stc
LB_1737:
	mov r8,r10
	bt r12,4
	jc LB_1734
	btr r12,2
	jmp LB_1735
LB_1734:
	bts r12,2
LB_1735:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1738:
	cmp r15,0
	jz LB_1739
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1738
LB_1739:
; _f1646 %_1636 ⊢ %_1637 : %_1637
 ; {>  %_1636~2':(_p1487)◂((_p1500)◂(_stg)) %_1635~0':_p1442 }
; _f1646 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1742
	btr r12,0
	jmp LB_1743
LB_1742:
	bts r12,0
LB_1743:
	call NS_E_1646
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1744
	btr r12,1
	jmp LB_1745
LB_1744:
	bts r12,1
LB_1745:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1740
	btr r12,0
	clc
	jmp LB_1741
LB_1740:
	bts r12,0
	stc
LB_1741:
	add rsp,16
; _f1453 %_1635 ⊢ %_1638 : %_1638
 ; {>  %_1635~0':_p1442 %_1637~1':_stg }
; _f1453 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1453
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1746
	btr r12,1
	clc
	jmp LB_1747
LB_1746:
	bts r12,1
	stc
LB_1747:
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
; ∎ %_1641
 ; {>  %_1640~1':_stg %_1641~2':_stg %_1639~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1748
	mov rdi,r14
	call dlt
LB_1748:
	bt r12,0
	jc LB_1749
	mov rdi,r13
	call dlt
LB_1749:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1750
	btr r12,0
	jmp LB_1751
LB_1750:
	bts r12,0
LB_1751:
	ret
MTC_LB_1726:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_1752
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °3◂0'
; 1' ⊢ °3◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1753
	bt QWORD [rdi],0
	jc LB_1754
	btr r12,2
	clc
	jmp LB_1755
LB_1754:
	bts r12,2
	stc
LB_1755:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1753:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1756
	btr r12,0
	jmp LB_1757
LB_1756:
	bts r12,0
LB_1757:
LB_1758:
	cmp r15,0
	jz LB_1759
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1758
LB_1759:
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%"
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_1644
 ; {>  %_1644~1':_stg %_1643~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1760
	mov rdi,r13
	call dlt
LB_1760:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1761
	btr r12,0
	jmp LB_1762
LB_1761:
	bts r12,0
LB_1762:
	ret
MTC_LB_1752:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1763
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1764
	bt QWORD [rdi],0
	jc LB_1765
	btr r12,0
	clc
	jmp LB_1766
LB_1765:
	bts r12,0
	stc
LB_1766:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1764:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1767:
	cmp r15,0
	jz LB_1768
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1767
LB_1768:
; 	» "_" _ ⊢ 0' : %_1645
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1645
 ; {>  %_1645~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1763:
MTC_LB_1706:
NS_E_1809:
; 	|» 0'
NS_E_RDI_1809:
MTC_LB_1810:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1811
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
	jnc LB_1812
	bt QWORD [rdi],0
	jc LB_1813
	btr r12,3
	clc
	jmp LB_1814
LB_1813:
	bts r12,3
	stc
LB_1814:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1812:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1817
	btr r12,4
	clc
	jmp LB_1818
LB_1817:
	bts r12,4
	stc
LB_1818:
	mov r14,r10
	bt r12,4
	jc LB_1815
	btr r12,1
	jmp LB_1816
LB_1815:
	bts r12,1
LB_1816:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1821
	btr r12,4
	clc
	jmp LB_1822
LB_1821:
	bts r12,4
	stc
LB_1822:
	mov r8,r10
	bt r12,4
	jc LB_1819
	btr r12,2
	jmp LB_1820
LB_1819:
	bts r12,2
LB_1820:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1823:
	cmp r15,0
	jz LB_1824
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1823
LB_1824:
; _f1799 %_1801 ⊢ %_1803 : %_1803
 ; {>  %_1801~1':(_p1487)◂((_p1495)◂(_stg)) %_1802~2':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) }
; _f1799 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1827
	btr r12,0
	jmp LB_1828
LB_1827:
	bts r12,0
LB_1828:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1825
	btr r12,2
	clc
	jmp LB_1826
LB_1825:
	bts r12,2
	stc
LB_1826:
	add rsp,16
; _f1809 %_1802 ⊢ %_1804 : %_1804
 ; {>  %_1802~2':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) %_1803~0':_stg }
; _f1809 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1831
	btr r12,0
	jmp LB_1832
LB_1831:
	bts r12,0
LB_1832:
	call NS_E_1809
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1833
	btr r12,1
	jmp LB_1834
LB_1833:
	bts r12,1
LB_1834:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1829
	btr r12,0
	clc
	jmp LB_1830
LB_1829:
	bts r12,0
	stc
LB_1830:
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
; ∎ %_1807
 ; {>  %_1807~2':_stg %_1805~0':_stg %_1806~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1835
	mov rdi,r13
	call dlt
LB_1835:
	bt r12,1
	jc LB_1836
	mov rdi,r14
	call dlt
LB_1836:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1837
	btr r12,0
	jmp LB_1838
LB_1837:
	bts r12,0
LB_1838:
	ret
MTC_LB_1811:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1839
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
	jnc LB_1840
	bt QWORD [rdi],0
	jc LB_1841
	btr r12,1
	clc
	jmp LB_1842
LB_1841:
	bts r12,1
	stc
LB_1842:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1840:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1843:
	cmp r15,0
	jz LB_1844
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1843
LB_1844:
; 	» "" _ ⊢ 0' : %_1808
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1808
 ; {>  %_1808~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1839:
NS_E_1799:
; 	|» 0'
NS_E_RDI_1799:
MTC_LB_1845:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1846
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
	jnc LB_1847
	bt QWORD [rdi],0
	jc LB_1848
	btr r12,2
	clc
	jmp LB_1849
LB_1848:
	bts r12,2
	stc
LB_1849:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1847:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1850
	btr r12,1
	jmp LB_1851
LB_1850:
	bts r12,1
LB_1851:
LB_1852:
	cmp r15,0
	jz LB_1853
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1852
LB_1853:
; _f1809 %_1792 ⊢ %_1793 : %_1793
 ; {>  %_1792~1':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) }
; _f1809 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1854
	btr r12,0
	jmp LB_1855
LB_1854:
	bts r12,0
LB_1855:
	call NS_E_1809
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
; ∎ %_1795
 ; {>  %_1795~1':_stg %_1794~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1856
	mov rdi,r13
	call dlt
LB_1856:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1857
	btr r12,0
	jmp LB_1858
LB_1857:
	bts r12,0
LB_1858:
	ret
MTC_LB_1846:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1859
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
	jnc LB_1860
	bt QWORD [rdi],0
	jc LB_1861
	btr r12,2
	clc
	jmp LB_1862
LB_1861:
	bts r12,2
	stc
LB_1862:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1860:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1863
	btr r12,1
	jmp LB_1864
LB_1863:
	bts r12,1
LB_1864:
LB_1865:
	cmp r15,0
	jz LB_1866
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1865
LB_1866:
MTC_LB_1867:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1868
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
	jnc LB_1869
	bt QWORD [rdi],0
	jc LB_1870
	btr r12,0
	clc
	jmp LB_1871
LB_1870:
	bts r12,0
	stc
LB_1871:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1869:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1872:
	cmp r15,0
	jz LB_1873
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1872
LB_1873:
; 	» "_ " _ ⊢ 0' : %_1797
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1797
 ; {>  %_1797~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1868:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1874
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
	jnc LB_1875
	bt QWORD [rdi],0
	jc LB_1876
	btr r12,2
	clc
	jmp LB_1877
LB_1876:
	bts r12,2
	stc
LB_1877:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1875:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1878
	btr r12,0
	jmp LB_1879
LB_1878:
	bts r12,0
LB_1879:
LB_1880:
	cmp r15,0
	jz LB_1881
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1880
LB_1881:
; ∎ %_1798
 ; {>  %_1798~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1874:
MTC_LB_1859:
NS_E_1790:
; 	|» 0'
NS_E_RDI_1790:
MTC_LB_1882:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1883
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
	jnc LB_1884
	bt QWORD [rdi],0
	jc LB_1885
	btr r12,3
	clc
	jmp LB_1886
LB_1885:
	bts r12,3
	stc
LB_1886:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1884:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1889
	btr r12,4
	clc
	jmp LB_1890
LB_1889:
	bts r12,4
	stc
LB_1890:
	mov r14,r10
	bt r12,4
	jc LB_1887
	btr r12,1
	jmp LB_1888
LB_1887:
	bts r12,1
LB_1888:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1893
	btr r12,4
	clc
	jmp LB_1894
LB_1893:
	bts r12,4
	stc
LB_1894:
	mov r8,r10
	bt r12,4
	jc LB_1891
	btr r12,2
	jmp LB_1892
LB_1891:
	bts r12,2
LB_1892:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1895:
	cmp r15,0
	jz LB_1896
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1895
LB_1896:
; _f1780 %_1782 ⊢ %_1784 : %_1784
 ; {>  %_1782~1':(_p1487)◂((_p1494)◂(_stg)) %_1783~2':(_lst)◂((_p1487)◂((_p1494)◂(_stg))) }
; _f1780 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1899
	btr r12,0
	jmp LB_1900
LB_1899:
	bts r12,0
LB_1900:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1897
	btr r12,2
	clc
	jmp LB_1898
LB_1897:
	bts r12,2
	stc
LB_1898:
	add rsp,16
; _f1790 %_1783 ⊢ %_1785 : %_1785
 ; {>  %_1784~0':_stg %_1783~2':(_lst)◂((_p1487)◂((_p1494)◂(_stg))) }
; _f1790 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1903
	btr r12,0
	jmp LB_1904
LB_1903:
	bts r12,0
LB_1904:
	call NS_E_1790
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1905
	btr r12,1
	jmp LB_1906
LB_1905:
	bts r12,1
LB_1906:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1901
	btr r12,0
	clc
	jmp LB_1902
LB_1901:
	bts r12,0
	stc
LB_1902:
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
; ∎ %_1788
 ; {>  %_1786~0':_stg %_1788~2':_stg %_1787~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1907
	mov rdi,r13
	call dlt
LB_1907:
	bt r12,1
	jc LB_1908
	mov rdi,r14
	call dlt
LB_1908:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1909
	btr r12,0
	jmp LB_1910
LB_1909:
	bts r12,0
LB_1910:
	ret
MTC_LB_1883:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1911
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
	jnc LB_1912
	bt QWORD [rdi],0
	jc LB_1913
	btr r12,1
	clc
	jmp LB_1914
LB_1913:
	bts r12,1
	stc
LB_1914:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1912:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1915:
	cmp r15,0
	jz LB_1916
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1915
LB_1916:
; 	» "" _ ⊢ 0' : %_1789
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1789
 ; {>  %_1789~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1911:
NS_E_1780:
; 	|» 0'
NS_E_RDI_1780:
MTC_LB_1917:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1918
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
	jnc LB_1919
	bt QWORD [rdi],0
	jc LB_1920
	btr r12,2
	clc
	jmp LB_1921
LB_1920:
	bts r12,2
	stc
LB_1921:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1919:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1922
	btr r12,1
	jmp LB_1923
LB_1922:
	bts r12,1
LB_1923:
LB_1924:
	cmp r15,0
	jz LB_1925
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1924
LB_1925:
; _f1790 %_1770 ⊢ %_1771 : %_1771
 ; {>  %_1770~1':(_lst)◂((_p1487)◂((_p1494)◂(_stg))) }
; _f1790 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1926
	btr r12,0
	jmp LB_1927
LB_1926:
	bts r12,0
LB_1927:
	call NS_E_1790
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
; ∎ %_1773
 ; {>  %_1772~0':_stg %_1773~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1928
	mov rdi,r13
	call dlt
LB_1928:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1929
	btr r12,0
	jmp LB_1930
LB_1929:
	bts r12,0
LB_1930:
	ret
MTC_LB_1918:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1931
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
	jnc LB_1932
	bt QWORD [rdi],0
	jc LB_1933
	btr r12,2
	clc
	jmp LB_1934
LB_1933:
	bts r12,2
	stc
LB_1934:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1932:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1935
	btr r12,1
	jmp LB_1936
LB_1935:
	bts r12,1
LB_1936:
LB_1937:
	cmp r15,0
	jz LB_1938
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1937
LB_1938:
MTC_LB_1939:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1940
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
	jnc LB_1941
	bt QWORD [rdi],0
	jc LB_1942
	btr r12,2
	clc
	jmp LB_1943
LB_1942:
	bts r12,2
	stc
LB_1943:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1941:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1944
	btr r12,0
	jmp LB_1945
LB_1944:
	bts r12,0
LB_1945:
LB_1946:
	cmp r15,0
	jz LB_1947
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1946
LB_1947:
; _f1595 %_1775 ⊢ %_1776 : %_1776
 ; {>  %_1775~0':_p1490 }
; _f1595 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1595
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
; ∎ %_1778
 ; {>  %_1778~1':_stg %_1777~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1948
	mov rdi,r13
	call dlt
LB_1948:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1949
	btr r12,0
	jmp LB_1950
LB_1949:
	bts r12,0
LB_1950:
	ret
MTC_LB_1940:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1951
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
	jnc LB_1952
	bt QWORD [rdi],0
	jc LB_1953
	btr r12,2
	clc
	jmp LB_1954
LB_1953:
	bts r12,2
	stc
LB_1954:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1952:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1955
	btr r12,0
	jmp LB_1956
LB_1955:
	bts r12,0
LB_1956:
LB_1957:
	cmp r15,0
	jz LB_1958
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1957
LB_1958:
; ∎ %_1779
 ; {>  %_1779~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1951:
MTC_LB_1931:
NS_E_2163:
; 	|» { 0' 1' }
NS_E_RDI_2163:
MTC_LB_2164:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2165
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
	jnc LB_2166
	bt QWORD [rdi],0
	jc LB_2167
	btr r12,6
	clc
	jmp LB_2168
LB_2167:
	bts r12,6
	stc
LB_2168:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2166:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2181
	btr r12,7
	clc
	jmp LB_2182
LB_2181:
	bts r12,7
	stc
LB_2182:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2171
	btr r12,5
	clc
	jmp LB_2172
LB_2171:
	bts r12,5
	stc
LB_2172:
	mov r8,r11
	bt r12,5
	jc LB_2169
	btr r12,2
	jmp LB_2170
LB_2169:
	bts r12,2
LB_2170:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2175
	btr r12,5
	clc
	jmp LB_2176
LB_2175:
	bts r12,5
	stc
LB_2176:
	mov r9,r11
	bt r12,5
	jc LB_2173
	btr r12,3
	jmp LB_2174
LB_2173:
	bts r12,3
LB_2174:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_2179
	btr r12,5
	clc
	jmp LB_2180
LB_2179:
	bts r12,5
	stc
LB_2180:
	mov r10,r11
	bt r12,5
	jc LB_2177
	btr r12,4
	jmp LB_2178
LB_2177:
	bts r12,4
LB_2178:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2185
	btr r12,7
	clc
	jmp LB_2186
LB_2185:
	bts r12,7
	stc
LB_2186:
	mov r11,rdx
	bt r12,7
	jc LB_2183
	btr r12,5
	jmp LB_2184
LB_2183:
	bts r12,5
LB_2184:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2187:
	cmp r15,0
	jz LB_2188
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2187
LB_2188:
; _f1646 %_2102 ⊢ %_2106 : %_2106
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2102~2':(_p1487)◂((_p1500)◂(_stg)) %_2104~4':(_p1508)◂(_stg) %_2105~5':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2100~0':_r64 }
; _f1646 2' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2197
	btr r12,0
	jmp LB_2198
LB_2197:
	bts r12,0
LB_2198:
	call NS_E_1646
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2199
	btr r12,1
	jmp LB_2200
LB_2199:
	bts r12,1
LB_2200:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2195
	btr r12,5
	clc
	jmp LB_2196
LB_2195:
	bts r12,5
	stc
LB_2196:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2193
	btr r12,4
	clc
	jmp LB_2194
LB_2193:
	bts r12,4
	stc
LB_2194:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2191
	btr r12,3
	clc
	jmp LB_2192
LB_2191:
	bts r12,3
	stc
LB_2192:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2189
	btr r12,0
	clc
	jmp LB_2190
LB_2189:
	bts r12,0
	stc
LB_2190:
	add rsp,40
; _f2163 { %_2100 %_2105 } ⊢ { %_2107 %_2108 } : { %_2107 %_2108 }
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2104~4':(_p1508)◂(_stg) %_2105~5':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2106~1':_stg %_2100~0':_r64 }
; _f2163 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2207
	btr r12,1
	jmp LB_2208
LB_2207:
	bts r12,1
LB_2208:
	call NS_E_2163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2209
	btr r12,2
	jmp LB_2210
LB_2209:
	bts r12,2
LB_2210:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2205
	btr r12,4
	clc
	jmp LB_2206
LB_2205:
	bts r12,4
	stc
LB_2206:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2203
	btr r12,3
	clc
	jmp LB_2204
LB_2203:
	bts r12,3
	stc
LB_2204:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2201
	btr r12,1
	clc
	jmp LB_2202
LB_2201:
	bts r12,1
	stc
LB_2202:
	add rsp,32
MTC_LB_2211:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2212
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂5'
; 4' ⊢ °0◂5'
	btr r12,6
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2213
	bt QWORD [rdi],0
	jc LB_2214
	btr r12,6
	clc
	jmp LB_2215
LB_2214:
	bts r12,6
	stc
LB_2215:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2213:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_2216
	btr r12,5
	jmp LB_2217
LB_2216:
	bts r12,5
LB_2217:
LB_2218:
	cmp r15,0
	jz LB_2219
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2218
LB_2219:
; _f2099 { %_2107 %_2109 } ⊢ { %_2110 %_2111 } : { %_2110 %_2111 }
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2109~5':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2108~2':_stg %_2106~1':_stg %_2107~0':_r64 }
; _f2099 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2226
	btr r12,1
	jmp LB_2227
LB_2226:
	bts r12,1
LB_2227:
	call NS_E_2099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2228
	btr r12,4
	jmp LB_2229
LB_2228:
	bts r12,4
LB_2229:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2224
	btr r12,3
	clc
	jmp LB_2225
LB_2224:
	bts r12,3
	stc
LB_2225:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2222
	btr r12,2
	clc
	jmp LB_2223
LB_2222:
	bts r12,2
	stc
LB_2223:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2220
	btr r12,1
	clc
	jmp LB_2221
LB_2220:
	bts r12,1
	stc
LB_2221:
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
	add rax,5
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
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
LB_2230:
	cmp rax,0
	jz LB_2231
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2230
LB_2231:
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
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ".. ;\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_3b
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_2112 %_2116 }
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2116~5':_stg %_2114~2':_stg %_2113~1':_stg %_2115~4':_stg %_2112~0':_r64 }
; 	∎ { 0' 5' }
	bt r12,3
	jc LB_2232
	mov rdi,r9
	call dlt
LB_2232:
	bt r12,2
	jc LB_2233
	mov rdi,r8
	call dlt
LB_2233:
	bt r12,1
	jc LB_2234
	mov rdi,r14
	call dlt
LB_2234:
	bt r12,4
	jc LB_2235
	mov rdi,r10
	call dlt
LB_2235:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2236
	btr r12,1
	jmp LB_2237
LB_2236:
	bts r12,1
LB_2237:
	ret
MTC_LB_2212:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2238
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °1◂{ 5' 6' }
; 4' ⊢ °1◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2239
	bt QWORD [rdi],0
	jc LB_2240
	btr r12,7
	clc
	jmp LB_2241
LB_2240:
	bts r12,7
	stc
LB_2241:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2239:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_2244
	btr r12,8
	clc
	jmp LB_2245
LB_2244:
	bts r12,8
	stc
LB_2245:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2242
	btr r12,5
	jmp LB_2243
LB_2242:
	bts r12,5
LB_2243:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_2248
	btr r12,8
	clc
	jmp LB_2249
LB_2248:
	bts r12,8
	stc
LB_2249:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2246
	btr r12,6
	jmp LB_2247
LB_2246:
	bts r12,6
LB_2247:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2250:
	cmp r15,0
	jz LB_2251
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2250
LB_2251:
; _f1780 %_2117 ⊢ %_2119 : %_2119
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2118~6':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2117~5':(_p1487)◂((_p1494)◂(_stg)) %_2108~2':_stg %_2106~1':_stg %_2107~0':_r64 }
; _f1780 5' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_2262
	btr r12,0
	jmp LB_2263
LB_2262:
	bts r12,0
LB_2263:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_2264
	btr r12,4
	jmp LB_2265
LB_2264:
	bts r12,4
LB_2265:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_2260
	btr r12,6
	clc
	jmp LB_2261
LB_2260:
	bts r12,6
	stc
LB_2261:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_2258
	btr r12,3
	clc
	jmp LB_2259
LB_2258:
	bts r12,3
	stc
LB_2259:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2256
	btr r12,2
	clc
	jmp LB_2257
LB_2256:
	bts r12,2
	stc
LB_2257:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2254
	btr r12,1
	clc
	jmp LB_2255
LB_2254:
	bts r12,1
	stc
LB_2255:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2252
	btr r12,0
	clc
	jmp LB_2253
LB_2252:
	bts r12,0
	stc
LB_2253:
	add rsp,48
; _f2163 { %_2107 %_2118 } ⊢ { %_2120 %_2121 } : { %_2120 %_2121 }
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2119~4':_stg %_2118~6':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2108~2':_stg %_2106~1':_stg %_2107~0':_r64 }
; _f2163 { 0' 6' } ⊢ { 0' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_2274
	btr r12,1
	jmp LB_2275
LB_2274:
	bts r12,1
LB_2275:
	call NS_E_2163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 5' }
	mov r11,r14
	bt r12,1
	jc LB_2276
	btr r12,5
	jmp LB_2277
LB_2276:
	bts r12,5
LB_2277:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_2272
	btr r12,4
	clc
	jmp LB_2273
LB_2272:
	bts r12,4
	stc
LB_2273:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2270
	btr r12,3
	clc
	jmp LB_2271
LB_2270:
	bts r12,3
	stc
LB_2271:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2268
	btr r12,2
	clc
	jmp LB_2269
LB_2268:
	bts r12,2
	stc
LB_2269:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2266
	btr r12,1
	clc
	jmp LB_2267
LB_2266:
	bts r12,1
	stc
LB_2267:
	add rsp,40
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r11
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
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
LB_2278:
	cmp rax,0
	jz LB_2279
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2278
LB_2279:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r11
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_2122 %_2126 }
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2122~0':_r64 %_2124~2':_stg %_2123~4':_stg %_2106~1':_stg %_2126~6':_stg %_2125~5':_stg }
; 	∎ { 0' 6' }
	bt r12,3
	jc LB_2280
	mov rdi,r9
	call dlt
LB_2280:
	bt r12,2
	jc LB_2281
	mov rdi,r8
	call dlt
LB_2281:
	bt r12,4
	jc LB_2282
	mov rdi,r10
	call dlt
LB_2282:
	bt r12,1
	jc LB_2283
	mov rdi,r14
	call dlt
LB_2283:
	bt r12,5
	jc LB_2284
	mov rdi,r11
	call dlt
LB_2284:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_2285
	btr r12,1
	jmp LB_2286
LB_2285:
	bts r12,1
LB_2286:
	ret
MTC_LB_2238:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2287
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °2◂5'
; 4' ⊢ °2◂5'
	btr r12,6
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2288
	bt QWORD [rdi],0
	jc LB_2289
	btr r12,6
	clc
	jmp LB_2290
LB_2289:
	bts r12,6
	stc
LB_2290:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2288:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_2291
	btr r12,5
	jmp LB_2292
LB_2291:
	bts r12,5
LB_2292:
LB_2293:
	cmp r15,0
	jz LB_2294
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2293
LB_2294:
; _f56 %_2107 ⊢ %_2128 : %_2128
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2127~5':(_p1505)◂(_stg) %_2108~2':_stg %_2106~1':_stg %_2107~0':_r64 }
	add r13,1
; _f1998 { %_2128 %_2127 } ⊢ { %_2129 %_2130 } : { %_2129 %_2130 }
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2127~5':(_p1505)◂(_stg) %_2128~0':_r64 %_2108~2':_stg %_2106~1':_stg }
; _f1998 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2301
	btr r12,1
	jmp LB_2302
LB_2301:
	bts r12,1
LB_2302:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2303
	btr r12,4
	jmp LB_2304
LB_2303:
	bts r12,4
LB_2304:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2299
	btr r12,3
	clc
	jmp LB_2300
LB_2299:
	bts r12,3
	stc
LB_2300:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2297
	btr r12,2
	clc
	jmp LB_2298
LB_2297:
	bts r12,2
	stc
LB_2298:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2295
	btr r12,1
	clc
	jmp LB_2296
LB_2295:
	bts r12,1
	stc
LB_2296:
	add rsp,32
; _f55 %_2129 ⊢ %_2131 : %_2131
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2130~4':_stg %_2108~2':_stg %_2106~1':_stg %_2129~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
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
LB_2305:
	cmp rax,0
	jz LB_2306
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2305
LB_2306:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r10
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
; ∎ { %_2132 %_2135 }
 ; {>  %_2103~3':(_lst)◂((_p1509)◂(_stg)) %_2135~5':_stg %_2132~0':_r64 %_2106~1':_stg %_2133~2':_stg %_2134~4':_stg }
; 	∎ { 0' 5' }
	bt r12,3
	jc LB_2307
	mov rdi,r9
	call dlt
LB_2307:
	bt r12,1
	jc LB_2308
	mov rdi,r14
	call dlt
LB_2308:
	bt r12,2
	jc LB_2309
	mov rdi,r8
	call dlt
LB_2309:
	bt r12,4
	jc LB_2310
	mov rdi,r10
	call dlt
LB_2310:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2311
	btr r12,1
	jmp LB_2312
LB_2311:
	bts r12,1
LB_2312:
	ret
MTC_LB_2287:
MTC_LB_2165:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2313
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' }
; 1' ⊢ °1◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2314
	bt QWORD [rdi],0
	jc LB_2315
	btr r12,5
	clc
	jmp LB_2316
LB_2315:
	bts r12,5
	stc
LB_2316:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2314:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2319
	btr r12,6
	clc
	jmp LB_2320
LB_2319:
	bts r12,6
	stc
LB_2320:
	mov r8,rcx
	bt r12,6
	jc LB_2317
	btr r12,2
	jmp LB_2318
LB_2317:
	bts r12,2
LB_2318:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2323
	btr r12,6
	clc
	jmp LB_2324
LB_2323:
	bts r12,6
	stc
LB_2324:
	mov r9,rcx
	bt r12,6
	jc LB_2321
	btr r12,3
	jmp LB_2322
LB_2321:
	bts r12,3
LB_2322:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2327
	btr r12,6
	clc
	jmp LB_2328
LB_2327:
	bts r12,6
	stc
LB_2328:
	mov r10,rcx
	bt r12,6
	jc LB_2325
	btr r12,4
	jmp LB_2326
LB_2325:
	bts r12,4
LB_2326:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2329:
	cmp r15,0
	jz LB_2330
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2329
LB_2330:
MTC_LB_2331:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2332
; _emt_mov_ptn_to_ptn:{| 101110.. |},4' ⊢ °0◂1'
; 4' ⊢ °0◂1'
	btr r12,5
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2333
	bt QWORD [rdi],0
	jc LB_2334
	btr r12,5
	clc
	jmp LB_2335
LB_2334:
	bts r12,5
	stc
LB_2335:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2333:
	mov r11,rdi
	mov r14,r11
	bt r12,5
	jc LB_2336
	btr r12,1
	jmp LB_2337
LB_2336:
	bts r12,1
LB_2337:
LB_2338:
	cmp r15,0
	jz LB_2339
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2338
LB_2339:
; _f1646 %_2136 ⊢ %_2140 : %_2140
 ; {>  %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2139~1':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2100~0':_r64 }
; _f1646 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2346
	btr r12,0
	jmp LB_2347
LB_2346:
	bts r12,0
LB_2347:
	call NS_E_1646
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2348
	btr r12,2
	jmp LB_2349
LB_2348:
	bts r12,2
LB_2349:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2344
	btr r12,3
	clc
	jmp LB_2345
LB_2344:
	bts r12,3
	stc
LB_2345:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2342
	btr r12,1
	clc
	jmp LB_2343
LB_2342:
	bts r12,1
	stc
LB_2343:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2340
	btr r12,0
	clc
	jmp LB_2341
LB_2340:
	bts r12,0
	stc
LB_2341:
	add rsp,32
; _f2099 { %_2100 %_2139 } ⊢ { %_2141 %_2142 } : { %_2141 %_2142 }
 ; {>  %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2140~2':_stg %_2139~1':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2100~0':_r64 }
; _f2099 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2352
	btr r12,3
	clc
	jmp LB_2353
LB_2352:
	bts r12,3
	stc
LB_2353:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2350
	btr r12,2
	clc
	jmp LB_2351
LB_2350:
	bts r12,2
	stc
LB_2351:
	add rsp,24
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
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2354:
	cmp rax,0
	jz LB_2355
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2354
LB_2355:
; "\226\136\144. .. ;\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_3b
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
; ∎ { %_2143 %_2145 }
 ; {>  %_2145~4':_stg %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2140~2':_stg %_2144~1':_stg %_2143~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2356
	mov rdi,r9
	call dlt
LB_2356:
	bt r12,2
	jc LB_2357
	mov rdi,r8
	call dlt
LB_2357:
	bt r12,1
	jc LB_2358
	mov rdi,r14
	call dlt
LB_2358:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2359
	btr r12,1
	jmp LB_2360
LB_2359:
	bts r12,1
LB_2360:
	ret
MTC_LB_2332:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2361
; _emt_mov_ptn_to_ptn:{| 101110.. |},4' ⊢ °1◂{ 1' 5' }
; 4' ⊢ °1◂{ 1' 5' }
	btr r12,6
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2362
	bt QWORD [rdi],0
	jc LB_2363
	btr r12,6
	clc
	jmp LB_2364
LB_2363:
	bts r12,6
	stc
LB_2364:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2362:
	mov rcx,rdi
; 6' ⊢ { 1' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2367
	btr r12,7
	clc
	jmp LB_2368
LB_2367:
	bts r12,7
	stc
LB_2368:
	mov r14,rdx
	bt r12,7
	jc LB_2365
	btr r12,1
	jmp LB_2366
LB_2365:
	bts r12,1
LB_2366:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2371
	btr r12,7
	clc
	jmp LB_2372
LB_2371:
	bts r12,7
	stc
LB_2372:
	mov r11,rdx
	bt r12,7
	jc LB_2369
	btr r12,5
	jmp LB_2370
LB_2369:
	bts r12,5
LB_2370:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2373:
	cmp r15,0
	jz LB_2374
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2373
LB_2374:
; _f1780 %_2146 ⊢ %_2148 : %_2148
 ; {>  %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2147~5':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2146~1':(_p1487)◂((_p1494)◂(_stg)) %_2100~0':_r64 }
; _f1780 1' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2383
	btr r12,0
	jmp LB_2384
LB_2383:
	bts r12,0
LB_2384:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2385
	btr r12,1
	jmp LB_2386
LB_2385:
	bts r12,1
LB_2386:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2381
	btr r12,5
	clc
	jmp LB_2382
LB_2381:
	bts r12,5
	stc
LB_2382:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2379
	btr r12,3
	clc
	jmp LB_2380
LB_2379:
	bts r12,3
	stc
LB_2380:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2377
	btr r12,2
	clc
	jmp LB_2378
LB_2377:
	bts r12,2
	stc
LB_2378:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2375
	btr r12,0
	clc
	jmp LB_2376
LB_2375:
	bts r12,0
	stc
LB_2376:
	add rsp,40
; _f2163 { %_2100 %_2147 } ⊢ { %_2149 %_2150 } : { %_2149 %_2150 }
 ; {>  %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2147~5':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2148~1':_stg %_2100~0':_r64 }
; _f2163 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2393
	btr r12,1
	jmp LB_2394
LB_2393:
	bts r12,1
LB_2394:
	call NS_E_2163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2395
	btr r12,4
	jmp LB_2396
LB_2395:
	bts r12,4
LB_2396:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2391
	btr r12,3
	clc
	jmp LB_2392
LB_2391:
	bts r12,3
	stc
LB_2392:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2389
	btr r12,2
	clc
	jmp LB_2390
LB_2389:
	bts r12,2
	stc
LB_2390:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2387
	btr r12,1
	clc
	jmp LB_2388
LB_2387:
	bts r12,1
	stc
LB_2388:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r10
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
LB_2397:
	cmp rax,0
	jz LB_2398
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2397
LB_2398:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_2151 %_2154 }
 ; {>  %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2153~4':_stg %_2151~0':_r64 %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2154~5':_stg %_2152~1':_stg }
; 	∎ { 0' 5' }
	bt r12,2
	jc LB_2399
	mov rdi,r8
	call dlt
LB_2399:
	bt r12,4
	jc LB_2400
	mov rdi,r10
	call dlt
LB_2400:
	bt r12,3
	jc LB_2401
	mov rdi,r9
	call dlt
LB_2401:
	bt r12,1
	jc LB_2402
	mov rdi,r14
	call dlt
LB_2402:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2403
	btr r12,1
	jmp LB_2404
LB_2403:
	bts r12,1
LB_2404:
	ret
MTC_LB_2361:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2405
; _emt_mov_ptn_to_ptn:{| 101110.. |},4' ⊢ °2◂1'
; 4' ⊢ °2◂1'
	btr r12,5
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2406
	bt QWORD [rdi],0
	jc LB_2407
	btr r12,5
	clc
	jmp LB_2408
LB_2407:
	bts r12,5
	stc
LB_2408:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2406:
	mov r11,rdi
	mov r14,r11
	bt r12,5
	jc LB_2409
	btr r12,1
	jmp LB_2410
LB_2409:
	bts r12,1
LB_2410:
LB_2411:
	cmp r15,0
	jz LB_2412
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2411
LB_2412:
; _f56 %_2100 ⊢ %_2156 : %_2156
 ; {>  %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2155~1':(_p1505)◂(_stg) %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2100~0':_r64 }
	add r13,1
; _f1998 { %_2156 %_2155 } ⊢ { %_2157 %_2158 } : { %_2157 %_2158 }
 ; {>  %_2156~0':_r64 %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2155~1':(_p1505)◂(_stg) %_2137~3':(_lst)◂((_p1509)◂(_stg)) }
; _f1998 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2415
	btr r12,3
	clc
	jmp LB_2416
LB_2415:
	bts r12,3
	stc
LB_2416:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2413
	btr r12,2
	clc
	jmp LB_2414
LB_2413:
	bts r12,2
	stc
LB_2414:
	add rsp,24
; _f55 %_2157 ⊢ %_2159 : %_2159
 ; {>  %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2158~1':_stg %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2157~0':_r64 }
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
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2417:
	cmp rax,0
	jz LB_2418
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2417
LB_2418:
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
; ∎ { %_2160 %_2162 }
 ; {>  %_2136~2':(_p1487)◂((_p1500)◂(_stg)) %_2162~4':_stg %_2137~3':(_lst)◂((_p1509)◂(_stg)) %_2160~0':_r64 %_2161~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2419
	mov rdi,r8
	call dlt
LB_2419:
	bt r12,3
	jc LB_2420
	mov rdi,r9
	call dlt
LB_2420:
	bt r12,1
	jc LB_2421
	mov rdi,r14
	call dlt
LB_2421:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2422
	btr r12,1
	jmp LB_2423
LB_2422:
	bts r12,1
LB_2423:
	ret
MTC_LB_2405:
MTC_LB_2313:
NS_E_2099:
; 	|» { 0' 1' }
NS_E_RDI_2099:
MTC_LB_2424:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2425
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
	jnc LB_2426
	bt QWORD [rdi],0
	jc LB_2427
	btr r12,5
	clc
	jmp LB_2428
LB_2427:
	bts r12,5
	stc
LB_2428:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2426:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2437
	btr r12,6
	clc
	jmp LB_2438
LB_2437:
	bts r12,6
	stc
LB_2438:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2431
	btr r12,4
	clc
	jmp LB_2432
LB_2431:
	bts r12,4
	stc
LB_2432:
	mov r8,r10
	bt r12,4
	jc LB_2429
	btr r12,2
	jmp LB_2430
LB_2429:
	bts r12,2
LB_2430:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2435
	btr r12,4
	clc
	jmp LB_2436
LB_2435:
	bts r12,4
	stc
LB_2436:
	mov r9,r10
	bt r12,4
	jc LB_2433
	btr r12,3
	jmp LB_2434
LB_2433:
	bts r12,3
LB_2434:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2441
	btr r12,6
	clc
	jmp LB_2442
LB_2441:
	bts r12,6
	stc
LB_2442:
	mov r10,rcx
	bt r12,6
	jc LB_2439
	btr r12,4
	jmp LB_2440
LB_2439:
	bts r12,4
LB_2440:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2443:
	cmp r15,0
	jz LB_2444
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2443
LB_2444:
; _f2099 { %_2041 %_2045 } ⊢ { %_2046 %_2047 } : { %_2046 %_2047 }
 ; {>  %_2044~3':(_p1508)◂(_stg) %_2043~2':(_lst)◂((_p1509)◂(_stg)) %_2041~0':_r64 %_2045~4':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _f2099 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2449
	btr r12,1
	jmp LB_2450
LB_2449:
	bts r12,1
LB_2450:
	call NS_E_2099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2447
	btr r12,3
	clc
	jmp LB_2448
LB_2447:
	bts r12,3
	stc
LB_2448:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2445
	btr r12,2
	clc
	jmp LB_2446
LB_2445:
	bts r12,2
	stc
LB_2446:
	add rsp,24
MTC_LB_2451:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2452
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
	jnc LB_2453
	bt QWORD [rdi],0
	jc LB_2454
	btr r12,5
	clc
	jmp LB_2455
LB_2454:
	bts r12,5
	stc
LB_2455:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2453:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2456
	btr r12,4
	jmp LB_2457
LB_2456:
	bts r12,4
LB_2457:
LB_2458:
	cmp r15,0
	jz LB_2459
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2458
LB_2459:
; _f2099 { %_2046 %_2048 } ⊢ { %_2049 %_2050 } : { %_2049 %_2050 }
 ; {>  %_2047~1':_stg %_2048~4':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2046~0':_r64 %_2043~2':(_lst)◂((_p1509)◂(_stg)) }
; _f2099 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2464
	btr r12,1
	jmp LB_2465
LB_2464:
	bts r12,1
LB_2465:
	call NS_E_2099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2466
	btr r12,3
	jmp LB_2467
LB_2466:
	bts r12,3
LB_2467:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2462
	btr r12,2
	clc
	jmp LB_2463
LB_2462:
	bts r12,2
	stc
LB_2463:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2460
	btr r12,1
	clc
	jmp LB_2461
LB_2460:
	bts r12,1
	stc
LB_2461:
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
LB_2468:
	cmp rax,0
	jz LB_2469
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2468
LB_2469:
; "\226\136\144 .. ;\n"
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
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
; ∎ { %_2051 %_2054 }
 ; {>  %_2043~2':(_lst)◂((_p1509)◂(_stg)) %_2053~3':_stg %_2054~4':_stg %_2052~1':_stg %_2051~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2470
	mov rdi,r8
	call dlt
LB_2470:
	bt r12,3
	jc LB_2471
	mov rdi,r9
	call dlt
LB_2471:
	bt r12,1
	jc LB_2472
	mov rdi,r14
	call dlt
LB_2472:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2473
	btr r12,1
	jmp LB_2474
LB_2473:
	bts r12,1
LB_2474:
	ret
MTC_LB_2452:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2475
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂{ 4' 5' }
; 3' ⊢ °1◂{ 4' 5' }
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2476
	bt QWORD [rdi],0
	jc LB_2477
	btr r12,6
	clc
	jmp LB_2478
LB_2477:
	bts r12,6
	stc
LB_2478:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2476:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2481
	btr r12,7
	clc
	jmp LB_2482
LB_2481:
	bts r12,7
	stc
LB_2482:
	mov r10,rdx
	bt r12,7
	jc LB_2479
	btr r12,4
	jmp LB_2480
LB_2479:
	bts r12,4
LB_2480:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2485
	btr r12,7
	clc
	jmp LB_2486
LB_2485:
	bts r12,7
	stc
LB_2486:
	mov r11,rdx
	bt r12,7
	jc LB_2483
	btr r12,5
	jmp LB_2484
LB_2483:
	bts r12,5
LB_2484:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2487:
	cmp r15,0
	jz LB_2488
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2487
LB_2488:
; _f1780 %_2055 ⊢ %_2057 : %_2057
 ; {>  %_2047~1':_stg %_2055~4':(_p1487)◂((_p1494)◂(_stg)) %_2046~0':_r64 %_2056~5':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2043~2':(_lst)◂((_p1509)◂(_stg)) }
; _f1780 4' ⊢ 3'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2497
	btr r12,0
	jmp LB_2498
LB_2497:
	bts r12,0
LB_2498:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2499
	btr r12,3
	jmp LB_2500
LB_2499:
	bts r12,3
LB_2500:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2495
	btr r12,5
	clc
	jmp LB_2496
LB_2495:
	bts r12,5
	stc
LB_2496:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2493
	btr r12,2
	clc
	jmp LB_2494
LB_2493:
	bts r12,2
	stc
LB_2494:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2491
	btr r12,1
	clc
	jmp LB_2492
LB_2491:
	bts r12,1
	stc
LB_2492:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2489
	btr r12,0
	clc
	jmp LB_2490
LB_2489:
	bts r12,0
	stc
LB_2490:
	add rsp,40
; _f2163 { %_2046 %_2056 } ⊢ { %_2058 %_2059 } : { %_2058 %_2059 }
 ; {>  %_2057~3':_stg %_2047~1':_stg %_2046~0':_r64 %_2056~5':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2043~2':(_lst)◂((_p1509)◂(_stg)) }
; _f2163 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2507
	btr r12,1
	jmp LB_2508
LB_2507:
	bts r12,1
LB_2508:
	call NS_E_2163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2509
	btr r12,4
	jmp LB_2510
LB_2509:
	bts r12,4
LB_2510:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2505
	btr r12,3
	clc
	jmp LB_2506
LB_2505:
	bts r12,3
	stc
LB_2506:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2503
	btr r12,2
	clc
	jmp LB_2504
LB_2503:
	bts r12,2
	stc
LB_2504:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2501
	btr r12,1
	clc
	jmp LB_2502
LB_2501:
	bts r12,1
	stc
LB_2502:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
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
LB_2511:
	cmp rax,0
	jz LB_2512
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2511
LB_2512:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r10
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
; ∎ { %_2060 %_2064 }
 ; {>  %_2043~2':(_lst)◂((_p1509)◂(_stg)) %_2064~5':_stg %_2062~1':_stg %_2063~4':_stg %_2061~3':_stg %_2060~0':_r64 }
; 	∎ { 0' 5' }
	bt r12,2
	jc LB_2513
	mov rdi,r8
	call dlt
LB_2513:
	bt r12,1
	jc LB_2514
	mov rdi,r14
	call dlt
LB_2514:
	bt r12,4
	jc LB_2515
	mov rdi,r10
	call dlt
LB_2515:
	bt r12,3
	jc LB_2516
	mov rdi,r9
	call dlt
LB_2516:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2517
	btr r12,1
	jmp LB_2518
LB_2517:
	bts r12,1
LB_2518:
	ret
MTC_LB_2475:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2519
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °2◂4'
; 3' ⊢ °2◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2520
	bt QWORD [rdi],0
	jc LB_2521
	btr r12,5
	clc
	jmp LB_2522
LB_2521:
	bts r12,5
	stc
LB_2522:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2520:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2523
	btr r12,4
	jmp LB_2524
LB_2523:
	bts r12,4
LB_2524:
LB_2525:
	cmp r15,0
	jz LB_2526
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2525
LB_2526:
; _f56 %_2046 ⊢ %_2066 : %_2066
 ; {>  %_2047~1':_stg %_2046~0':_r64 %_2065~4':(_p1505)◂(_stg) %_2043~2':(_lst)◂((_p1509)◂(_stg)) }
	add r13,1
; _f1998 { %_2066 %_2065 } ⊢ { %_2067 %_2068 } : { %_2067 %_2068 }
 ; {>  %_2047~1':_stg %_2065~4':(_p1505)◂(_stg) %_2043~2':(_lst)◂((_p1509)◂(_stg)) %_2066~0':_r64 }
; _f1998 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2531
	btr r12,1
	jmp LB_2532
LB_2531:
	bts r12,1
LB_2532:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2533
	btr r12,3
	jmp LB_2534
LB_2533:
	bts r12,3
LB_2534:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2529
	btr r12,2
	clc
	jmp LB_2530
LB_2529:
	bts r12,2
	stc
LB_2530:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2527
	btr r12,1
	clc
	jmp LB_2528
LB_2527:
	bts r12,1
	stc
LB_2528:
	add rsp,24
; _f55 %_2067 ⊢ %_2069 : %_2069
 ; {>  %_2047~1':_stg %_2043~2':(_lst)◂((_p1509)◂(_stg)) %_2067~0':_r64 %_2068~3':_stg }
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
LB_2535:
	cmp rax,0
	jz LB_2536
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2535
LB_2536:
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
; ∎ { %_2070 %_2073 }
 ; {>  %_2071~1':_stg %_2073~4':_stg %_2043~2':(_lst)◂((_p1509)◂(_stg)) %_2072~3':_stg %_2070~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2537
	mov rdi,r14
	call dlt
LB_2537:
	bt r12,2
	jc LB_2538
	mov rdi,r8
	call dlt
LB_2538:
	bt r12,3
	jc LB_2539
	mov rdi,r9
	call dlt
LB_2539:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2540
	btr r12,1
	jmp LB_2541
LB_2540:
	bts r12,1
LB_2541:
	ret
MTC_LB_2519:
MTC_LB_2425:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2542
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
	jnc LB_2543
	bt QWORD [rdi],0
	jc LB_2544
	btr r12,4
	clc
	jmp LB_2545
LB_2544:
	bts r12,4
	stc
LB_2545:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2543:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2548
	btr r12,5
	clc
	jmp LB_2549
LB_2548:
	bts r12,5
	stc
LB_2549:
	mov r8,r11
	bt r12,5
	jc LB_2546
	btr r12,2
	jmp LB_2547
LB_2546:
	bts r12,2
LB_2547:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2552
	btr r12,5
	clc
	jmp LB_2553
LB_2552:
	bts r12,5
	stc
LB_2553:
	mov r9,r11
	bt r12,5
	jc LB_2550
	btr r12,3
	jmp LB_2551
LB_2550:
	bts r12,3
LB_2551:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2554:
	cmp r15,0
	jz LB_2555
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2554
LB_2555:
MTC_LB_2556:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2557
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
	jnc LB_2558
	bt QWORD [rdi],0
	jc LB_2559
	btr r12,4
	clc
	jmp LB_2560
LB_2559:
	bts r12,4
	stc
LB_2560:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2558:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2561
	btr r12,1
	jmp LB_2562
LB_2561:
	bts r12,1
LB_2562:
LB_2563:
	cmp r15,0
	jz LB_2564
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2563
LB_2564:
; _f2099 { %_2041 %_2076 } ⊢ { %_2077 %_2078 } : { %_2077 %_2078 }
 ; {>  %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2076~1':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2041~0':_r64 }
; _f2099 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2565
	btr r12,2
	clc
	jmp LB_2566
LB_2565:
	bts r12,2
	stc
LB_2566:
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
LB_2567:
	cmp rax,0
	jz LB_2568
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2567
LB_2568:
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
; ∎ { %_2079 %_2081 }
 ; {>  %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2079~0':_r64 %_2081~3':_stg %_2080~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2569
	mov rdi,r8
	call dlt
LB_2569:
	bt r12,1
	jc LB_2570
	mov rdi,r14
	call dlt
LB_2570:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2571
	btr r12,1
	jmp LB_2572
LB_2571:
	bts r12,1
LB_2572:
	ret
MTC_LB_2557:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2573
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂{ 1' 4' }
; 3' ⊢ °1◂{ 1' 4' }
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2574
	bt QWORD [rdi],0
	jc LB_2575
	btr r12,5
	clc
	jmp LB_2576
LB_2575:
	bts r12,5
	stc
LB_2576:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2574:
	mov r11,rdi
; 5' ⊢ { 1' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2579
	btr r12,6
	clc
	jmp LB_2580
LB_2579:
	bts r12,6
	stc
LB_2580:
	mov r14,rcx
	bt r12,6
	jc LB_2577
	btr r12,1
	jmp LB_2578
LB_2577:
	bts r12,1
LB_2578:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2583
	btr r12,6
	clc
	jmp LB_2584
LB_2583:
	bts r12,6
	stc
LB_2584:
	mov r10,rcx
	bt r12,6
	jc LB_2581
	btr r12,4
	jmp LB_2582
LB_2581:
	bts r12,4
LB_2582:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2585:
	cmp r15,0
	jz LB_2586
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2585
LB_2586:
; _f1780 %_2082 ⊢ %_2084 : %_2084
 ; {>  %_2082~1':(_p1487)◂((_p1494)◂(_stg)) %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2083~4':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2041~0':_r64 }
; _f1780 1' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2593
	btr r12,0
	jmp LB_2594
LB_2593:
	bts r12,0
LB_2594:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2595
	btr r12,1
	jmp LB_2596
LB_2595:
	bts r12,1
LB_2596:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2591
	btr r12,4
	clc
	jmp LB_2592
LB_2591:
	bts r12,4
	stc
LB_2592:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2589
	btr r12,2
	clc
	jmp LB_2590
LB_2589:
	bts r12,2
	stc
LB_2590:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2587
	btr r12,0
	clc
	jmp LB_2588
LB_2587:
	bts r12,0
	stc
LB_2588:
	add rsp,32
; _f2163 { %_2041 %_2083 } ⊢ { %_2085 %_2086 } : { %_2085 %_2086 }
 ; {>  %_2084~1':_stg %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2083~4':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_2041~0':_r64 }
; _f2163 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2601
	btr r12,1
	jmp LB_2602
LB_2601:
	bts r12,1
LB_2602:
	call NS_E_2163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2603
	btr r12,3
	jmp LB_2604
LB_2603:
	bts r12,3
LB_2604:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2599
	btr r12,2
	clc
	jmp LB_2600
LB_2599:
	bts r12,2
	stc
LB_2600:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2597
	btr r12,1
	clc
	jmp LB_2598
LB_2597:
	bts r12,1
	stc
LB_2598:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
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
LB_2605:
	cmp rax,0
	jz LB_2606
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2605
LB_2606:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
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
; ∎ { %_2087 %_2090 }
 ; {>  %_2090~4':_stg %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2089~3':_stg %_2088~1':_stg %_2087~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2607
	mov rdi,r8
	call dlt
LB_2607:
	bt r12,3
	jc LB_2608
	mov rdi,r9
	call dlt
LB_2608:
	bt r12,1
	jc LB_2609
	mov rdi,r14
	call dlt
LB_2609:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2610
	btr r12,1
	jmp LB_2611
LB_2610:
	bts r12,1
LB_2611:
	ret
MTC_LB_2573:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2612
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °2◂1'
; 3' ⊢ °2◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2613
	bt QWORD [rdi],0
	jc LB_2614
	btr r12,4
	clc
	jmp LB_2615
LB_2614:
	bts r12,4
	stc
LB_2615:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2613:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2616
	btr r12,1
	jmp LB_2617
LB_2616:
	bts r12,1
LB_2617:
LB_2618:
	cmp r15,0
	jz LB_2619
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2618
LB_2619:
; _f56 %_2041 ⊢ %_2092 : %_2092
 ; {>  %_2091~1':(_p1505)◂(_stg) %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2041~0':_r64 }
	add r13,1
; _f1998 { %_2092 %_2091 } ⊢ { %_2093 %_2094 } : { %_2093 %_2094 }
 ; {>  %_2091~1':(_p1505)◂(_stg) %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2092~0':_r64 }
; _f1998 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2620
	btr r12,2
	clc
	jmp LB_2621
LB_2620:
	bts r12,2
	stc
LB_2621:
	add rsp,16
; _f55 %_2093 ⊢ %_2095 : %_2095
 ; {>  %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2094~1':_stg %_2093~0':_r64 }
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
LB_2622:
	cmp rax,0
	jz LB_2623
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2622
LB_2623:
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
; ∎ { %_2096 %_2098 }
 ; {>  %_2074~2':(_lst)◂((_p1509)◂(_stg)) %_2098~3':_stg %_2096~0':_r64 %_2097~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2624
	mov rdi,r8
	call dlt
LB_2624:
	bt r12,1
	jc LB_2625
	mov rdi,r14
	call dlt
LB_2625:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2626
	btr r12,1
	jmp LB_2627
LB_2626:
	bts r12,1
LB_2627:
	ret
MTC_LB_2612:
MTC_LB_2542:
NS_E_2040:
; 	|» { 0' 1' }
NS_E_RDI_2040:
MTC_LB_2628:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2629
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
	jnc LB_2630
	bt QWORD [rdi],0
	jc LB_2631
	btr r12,5
	clc
	jmp LB_2632
LB_2631:
	bts r12,5
	stc
LB_2632:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2630:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2635
	btr r12,6
	clc
	jmp LB_2636
LB_2635:
	bts r12,6
	stc
LB_2636:
	mov r8,rcx
	bt r12,6
	jc LB_2633
	btr r12,2
	jmp LB_2634
LB_2633:
	bts r12,2
LB_2634:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2639
	btr r12,6
	clc
	jmp LB_2640
LB_2639:
	bts r12,6
	stc
LB_2640:
	mov r9,rcx
	bt r12,6
	jc LB_2637
	btr r12,3
	jmp LB_2638
LB_2637:
	bts r12,3
LB_2638:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2643
	btr r12,6
	clc
	jmp LB_2644
LB_2643:
	bts r12,6
	stc
LB_2644:
	mov r10,rcx
	bt r12,6
	jc LB_2641
	btr r12,4
	jmp LB_2642
LB_2641:
	bts r12,4
LB_2642:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2645:
	cmp r15,0
	jz LB_2646
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2645
LB_2646:
; _f1780 %_2002 ⊢ %_2004 : %_2004
 ; {>  %_2003~4':(_p1487)◂((_p1495)◂(_stg)) %_1999~0':_r64 %_2002~3':(_p1487)◂((_p1494)◂(_stg)) %_2001~2':_p1442 }
; _f1780 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2653
	btr r12,0
	jmp LB_2654
LB_2653:
	bts r12,0
LB_2654:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2655
	btr r12,1
	jmp LB_2656
LB_2655:
	bts r12,1
LB_2656:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2651
	btr r12,4
	clc
	jmp LB_2652
LB_2651:
	bts r12,4
	stc
LB_2652:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2649
	btr r12,2
	clc
	jmp LB_2650
LB_2649:
	bts r12,2
	stc
LB_2650:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2647
	btr r12,0
	clc
	jmp LB_2648
LB_2647:
	bts r12,0
	stc
LB_2648:
	add rsp,32
; _f1799 %_2003 ⊢ %_2005 : %_2005
 ; {>  %_2003~4':(_p1487)◂((_p1495)◂(_stg)) %_2004~1':_stg %_1999~0':_r64 %_2001~2':_p1442 }
; _f1799 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2663
	btr r12,0
	jmp LB_2664
LB_2663:
	bts r12,0
LB_2664:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2665
	btr r12,3
	jmp LB_2666
LB_2665:
	bts r12,3
LB_2666:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2661
	btr r12,2
	clc
	jmp LB_2662
LB_2661:
	bts r12,2
	stc
LB_2662:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2659
	btr r12,1
	clc
	jmp LB_2660
LB_2659:
	bts r12,1
	stc
LB_2660:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2657
	btr r12,0
	clc
	jmp LB_2658
LB_2657:
	bts r12,0
	stc
LB_2658:
	add rsp,32
; _f1453 %_2001 ⊢ %_2006 : %_2006
 ; {>  %_2004~1':_stg %_1999~0':_r64 %_2005~3':_stg %_2001~2':_p1442 }
; _f1453 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2673
	btr r12,0
	jmp LB_2674
LB_2673:
	bts r12,0
LB_2674:
	call NS_E_1453
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2675
	btr r12,2
	jmp LB_2676
LB_2675:
	bts r12,2
LB_2676:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2671
	btr r12,3
	clc
	jmp LB_2672
LB_2671:
	bts r12,3
	stc
LB_2672:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2669
	btr r12,1
	clc
	jmp LB_2670
LB_2669:
	bts r12,1
	stc
LB_2670:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2667
	btr r12,0
	clc
	jmp LB_2668
LB_2667:
	bts r12,0
	stc
LB_2668:
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
LB_2677:
	cmp rax,0
	jz LB_2678
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2677
LB_2678:
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
; ∎ { %_2007 %_2011 }
 ; {>  %_2009~1':_stg %_2007~0':_r64 %_2010~3':_stg %_2011~4':_stg %_2008~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2679
	mov rdi,r14
	call dlt
LB_2679:
	bt r12,3
	jc LB_2680
	mov rdi,r9
	call dlt
LB_2680:
	bt r12,2
	jc LB_2681
	mov rdi,r8
	call dlt
LB_2681:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2682
	btr r12,1
	jmp LB_2683
LB_2682:
	bts r12,1
LB_2683:
	ret
MTC_LB_2629:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2684
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' }
; 1' ⊢ °1◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2685
	bt QWORD [rdi],0
	jc LB_2686
	btr r12,5
	clc
	jmp LB_2687
LB_2686:
	bts r12,5
	stc
LB_2687:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2685:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2690
	btr r12,6
	clc
	jmp LB_2691
LB_2690:
	bts r12,6
	stc
LB_2691:
	mov r8,rcx
	bt r12,6
	jc LB_2688
	btr r12,2
	jmp LB_2689
LB_2688:
	bts r12,2
LB_2689:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2694
	btr r12,6
	clc
	jmp LB_2695
LB_2694:
	bts r12,6
	stc
LB_2695:
	mov r9,rcx
	bt r12,6
	jc LB_2692
	btr r12,3
	jmp LB_2693
LB_2692:
	bts r12,3
LB_2693:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2698
	btr r12,6
	clc
	jmp LB_2699
LB_2698:
	bts r12,6
	stc
LB_2699:
	mov r10,rcx
	bt r12,6
	jc LB_2696
	btr r12,4
	jmp LB_2697
LB_2696:
	bts r12,4
LB_2697:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2700:
	cmp r15,0
	jz LB_2701
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2700
LB_2701:
; _f1489 %_2012 ⊢ %_2015 : %_2015
 ; {>  %_2014~4':(_p1487)◂((_p1495)◂(_stg)) %_1999~0':_r64 %_2012~2':(_p1494)◂(_stg) %_2013~3':(_p1487)◂((_p1494)◂(_stg)) }
; _f1489 2' ⊢ °1◂2'
; _f1780 %_2015 ⊢ %_2016 : %_2016
 ; {>  %_2015~°1◂2':(_p1487)◂((_p1494)◂(_stg)) %_2014~4':(_p1487)◂((_p1495)◂(_stg)) %_1999~0':_r64 %_2013~3':(_p1487)◂((_p1494)◂(_stg)) }
; _f1780 °1◂2' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},°1◂2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2710
	btr r12,0
	jmp LB_2711
LB_2710:
	bts r12,0
LB_2711:
	mov rsi,1
	bt r12,0
	jc LB_2708
	mov rsi,0
	bt r13,0
	jc LB_2708
	jmp LB_2709
LB_2708:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_2709:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2712
	btr r12,1
	jmp LB_2713
LB_2712:
	bts r12,1
LB_2713:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2706
	btr r12,4
	clc
	jmp LB_2707
LB_2706:
	bts r12,4
	stc
LB_2707:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2704
	btr r12,3
	clc
	jmp LB_2705
LB_2704:
	bts r12,3
	stc
LB_2705:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2702
	btr r12,0
	clc
	jmp LB_2703
LB_2702:
	bts r12,0
	stc
LB_2703:
	add rsp,32
; _f1780 %_2013 ⊢ %_2017 : %_2017
 ; {>  %_2016~1':_stg %_2014~4':(_p1487)◂((_p1495)◂(_stg)) %_1999~0':_r64 %_2013~3':(_p1487)◂((_p1494)◂(_stg)) }
; _f1780 3' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2720
	btr r12,0
	jmp LB_2721
LB_2720:
	bts r12,0
LB_2721:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2722
	btr r12,2
	jmp LB_2723
LB_2722:
	bts r12,2
LB_2723:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2718
	btr r12,4
	clc
	jmp LB_2719
LB_2718:
	bts r12,4
	stc
LB_2719:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2716
	btr r12,1
	clc
	jmp LB_2717
LB_2716:
	bts r12,1
	stc
LB_2717:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2714
	btr r12,0
	clc
	jmp LB_2715
LB_2714:
	bts r12,0
	stc
LB_2715:
	add rsp,32
; _f1799 %_2014 ⊢ %_2018 : %_2018
 ; {>  %_2016~1':_stg %_2014~4':(_p1487)◂((_p1495)◂(_stg)) %_1999~0':_r64 %_2017~2':_stg }
; _f1799 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2730
	btr r12,0
	jmp LB_2731
LB_2730:
	bts r12,0
LB_2731:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2732
	btr r12,3
	jmp LB_2733
LB_2732:
	bts r12,3
LB_2733:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2728
	btr r12,2
	clc
	jmp LB_2729
LB_2728:
	bts r12,2
	stc
LB_2729:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2726
	btr r12,1
	clc
	jmp LB_2727
LB_2726:
	bts r12,1
	stc
LB_2727:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2724
	btr r12,0
	clc
	jmp LB_2725
LB_2724:
	bts r12,0
	stc
LB_2725:
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
LB_2734:
	cmp rax,0
	jz LB_2735
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2734
LB_2735:
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
; ∎ { %_2019 %_2023 }
 ; {>  %_2020~1':_stg %_2022~3':_stg %_2021~2':_stg %_2023~4':_stg %_2019~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2736
	mov rdi,r14
	call dlt
LB_2736:
	bt r12,3
	jc LB_2737
	mov rdi,r9
	call dlt
LB_2737:
	bt r12,2
	jc LB_2738
	mov rdi,r8
	call dlt
LB_2738:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2739
	btr r12,1
	jmp LB_2740
LB_2739:
	bts r12,1
LB_2740:
	ret
MTC_LB_2684:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2741
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
	jnc LB_2742
	bt QWORD [rdi],0
	jc LB_2743
	btr r12,5
	clc
	jmp LB_2744
LB_2743:
	bts r12,5
	stc
LB_2744:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2742:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2747
	btr r12,6
	clc
	jmp LB_2748
LB_2747:
	bts r12,6
	stc
LB_2748:
	mov r8,rcx
	bt r12,6
	jc LB_2745
	btr r12,2
	jmp LB_2746
LB_2745:
	bts r12,2
LB_2746:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2751
	btr r12,6
	clc
	jmp LB_2752
LB_2751:
	bts r12,6
	stc
LB_2752:
	mov r9,rcx
	bt r12,6
	jc LB_2749
	btr r12,3
	jmp LB_2750
LB_2749:
	bts r12,3
LB_2750:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2755
	btr r12,6
	clc
	jmp LB_2756
LB_2755:
	bts r12,6
	stc
LB_2756:
	mov r10,rcx
	bt r12,6
	jc LB_2753
	btr r12,4
	jmp LB_2754
LB_2753:
	bts r12,4
LB_2754:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2757:
	cmp r15,0
	jz LB_2758
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2757
LB_2758:
; _f1780 %_2025 ⊢ %_2027 : %_2027
 ; {>  %_2024~2':_p1490 %_2025~3':(_p1487)◂((_p1494)◂(_stg)) %_1999~0':_r64 %_2026~4':(_p1487)◂((_p1495)◂(_stg)) }
; _f1780 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2765
	btr r12,0
	jmp LB_2766
LB_2765:
	bts r12,0
LB_2766:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2767
	btr r12,1
	jmp LB_2768
LB_2767:
	bts r12,1
LB_2768:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2763
	btr r12,4
	clc
	jmp LB_2764
LB_2763:
	bts r12,4
	stc
LB_2764:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2761
	btr r12,2
	clc
	jmp LB_2762
LB_2761:
	bts r12,2
	stc
LB_2762:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2759
	btr r12,0
	clc
	jmp LB_2760
LB_2759:
	bts r12,0
	stc
LB_2760:
	add rsp,32
; _f1799 %_2026 ⊢ %_2028 : %_2028
 ; {>  %_2024~2':_p1490 %_2027~1':_stg %_1999~0':_r64 %_2026~4':(_p1487)◂((_p1495)◂(_stg)) }
; _f1799 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2775
	btr r12,0
	jmp LB_2776
LB_2775:
	bts r12,0
LB_2776:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2777
	btr r12,3
	jmp LB_2778
LB_2777:
	bts r12,3
LB_2778:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2773
	btr r12,2
	clc
	jmp LB_2774
LB_2773:
	bts r12,2
	stc
LB_2774:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2771
	btr r12,1
	clc
	jmp LB_2772
LB_2771:
	bts r12,1
	stc
LB_2772:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2769
	btr r12,0
	clc
	jmp LB_2770
LB_2769:
	bts r12,0
	stc
LB_2770:
	add rsp,32
; _f1595 %_2024 ⊢ %_2029 : %_2029
 ; {>  %_2028~3':_stg %_2024~2':_p1490 %_2027~1':_stg %_1999~0':_r64 }
; _f1595 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2785
	btr r12,0
	jmp LB_2786
LB_2785:
	bts r12,0
LB_2786:
	call NS_E_1595
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2787
	btr r12,2
	jmp LB_2788
LB_2787:
	bts r12,2
LB_2788:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2783
	btr r12,3
	clc
	jmp LB_2784
LB_2783:
	bts r12,3
	stc
LB_2784:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2781
	btr r12,1
	clc
	jmp LB_2782
LB_2781:
	bts r12,1
	stc
LB_2782:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2779
	btr r12,0
	clc
	jmp LB_2780
LB_2779:
	bts r12,0
	stc
LB_2780:
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
LB_2789:
	cmp rax,0
	jz LB_2790
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2789
LB_2790:
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
; ∎ { %_2030 %_2034 }
 ; {>  %_2033~3':_stg %_2032~1':_stg %_2031~2':_stg %_2030~0':_r64 %_2034~4':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2791
	mov rdi,r9
	call dlt
LB_2791:
	bt r12,1
	jc LB_2792
	mov rdi,r14
	call dlt
LB_2792:
	bt r12,2
	jc LB_2793
	mov rdi,r8
	call dlt
LB_2793:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2794
	btr r12,1
	jmp LB_2795
LB_2794:
	bts r12,1
LB_2795:
	ret
MTC_LB_2741:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2796
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
	jnc LB_2797
	bt QWORD [rdi],0
	jc LB_2798
	btr r12,5
	clc
	jmp LB_2799
LB_2798:
	bts r12,5
	stc
LB_2799:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2797:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2802
	btr r12,6
	clc
	jmp LB_2803
LB_2802:
	bts r12,6
	stc
LB_2803:
	mov r8,rcx
	bt r12,6
	jc LB_2800
	btr r12,2
	jmp LB_2801
LB_2800:
	bts r12,2
LB_2801:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2806
	btr r12,6
	clc
	jmp LB_2807
LB_2806:
	bts r12,6
	stc
LB_2807:
	mov r9,rcx
	bt r12,6
	jc LB_2804
	btr r12,3
	jmp LB_2805
LB_2804:
	bts r12,3
LB_2805:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2810
	btr r12,6
	clc
	jmp LB_2811
LB_2810:
	bts r12,6
	stc
LB_2811:
	mov r10,rcx
	bt r12,6
	jc LB_2808
	btr r12,4
	jmp LB_2809
LB_2808:
	bts r12,4
LB_2809:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2812:
	cmp r15,0
	jz LB_2813
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2812
LB_2813:
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
LB_2814:
	cmp rax,0
	jz LB_2815
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2814
LB_2815:
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
; ∎ { %_2038 %_2039 }
 ; {>  %_2038~0':_r64 %_2036~3':(_lst)◂((_p1494)◂(_stg)) %_2035~2':(_lst)◂(_p1511) %_2039~1':_stg %_2037~4':(_lst)◂((_p1495)◂(_stg)) }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_2816
	mov rdi,r9
	call dlt
LB_2816:
	bt r12,2
	jc LB_2817
	mov rdi,r8
	call dlt
LB_2817:
	bt r12,4
	jc LB_2818
	mov rdi,r10
	call dlt
LB_2818:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2796:
NS_E_1998:
; 	|» { 0' 1' }
NS_E_RDI_1998:
MTC_LB_2819:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2820
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
	jnc LB_2821
	bt QWORD [rdi],0
	jc LB_2822
	btr r12,4
	clc
	jmp LB_2823
LB_2822:
	bts r12,4
	stc
LB_2823:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2821:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2826
	btr r12,5
	clc
	jmp LB_2827
LB_2826:
	bts r12,5
	stc
LB_2827:
	mov r8,r11
	bt r12,5
	jc LB_2824
	btr r12,2
	jmp LB_2825
LB_2824:
	bts r12,2
LB_2825:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2830
	btr r12,5
	clc
	jmp LB_2831
LB_2830:
	bts r12,5
	stc
LB_2831:
	mov r9,r11
	bt r12,5
	jc LB_2828
	btr r12,3
	jmp LB_2829
LB_2828:
	bts r12,3
LB_2829:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2832:
	cmp r15,0
	jz LB_2833
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2832
LB_2833:
; _f2040 { %_1959 %_1961 } ⊢ { %_1963 %_1964 } : { %_1963 %_1964 }
 ; {>  %_1959~0':_r64 %_1961~2':(_p1507)◂(_stg) %_1962~3':(_p1505)◂(_stg) }
; _f2040 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2836
	btr r12,1
	jmp LB_2837
LB_2836:
	bts r12,1
LB_2837:
	call NS_E_2040
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_2834
	btr r12,3
	clc
	jmp LB_2835
LB_2834:
	bts r12,3
	stc
LB_2835:
	add rsp,16
; _f1998 { %_1963 %_1962 } ⊢ { %_1965 %_1966 } : { %_1965 %_1966 }
 ; {>  %_1964~1':_stg %_1963~0':_r64 %_1962~3':(_p1505)◂(_stg) }
; _f1998 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2840
	btr r12,1
	jmp LB_2841
LB_2840:
	bts r12,1
LB_2841:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2842
	btr r12,2
	jmp LB_2843
LB_2842:
	bts r12,2
LB_2843:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2838
	btr r12,1
	clc
	jmp LB_2839
LB_2838:
	bts r12,1
	stc
LB_2839:
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
; ∎ { %_1965 %_1969 }
 ; {>  %_1969~3':_stg %_1967~1':_stg %_1968~2':_stg %_1965~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_2844
	mov rdi,r14
	call dlt
LB_2844:
	bt r12,2
	jc LB_2845
	mov rdi,r8
	call dlt
LB_2845:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2846
	btr r12,1
	jmp LB_2847
LB_2846:
	bts r12,1
LB_2847:
	ret
MTC_LB_2820:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2848
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
	jnc LB_2849
	bt QWORD [rdi],0
	jc LB_2850
	btr r12,3
	clc
	jmp LB_2851
LB_2850:
	bts r12,3
	stc
LB_2851:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2849:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2852
	btr r12,2
	jmp LB_2853
LB_2852:
	bts r12,2
LB_2853:
LB_2854:
	cmp r15,0
	jz LB_2855
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2854
LB_2855:
; _f2099 { %_1959 %_1970 } ⊢ { %_1971 %_1972 } : { %_1971 %_1972 }
 ; {>  %_1959~0':_r64 %_1970~2':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _f2099 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2856
	btr r12,1
	jmp LB_2857
LB_2856:
	bts r12,1
LB_2857:
	call NS_E_2099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1971 %_1972 }
 ; {>  %_1972~1':_stg %_1971~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2848:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2858
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
	jnc LB_2859
	bt QWORD [rdi],0
	jc LB_2860
	btr r12,4
	clc
	jmp LB_2861
LB_2860:
	bts r12,4
	stc
LB_2861:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2859:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2864
	btr r12,5
	clc
	jmp LB_2865
LB_2864:
	bts r12,5
	stc
LB_2865:
	mov r8,r11
	bt r12,5
	jc LB_2862
	btr r12,2
	jmp LB_2863
LB_2862:
	bts r12,2
LB_2863:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2868
	btr r12,5
	clc
	jmp LB_2869
LB_2868:
	bts r12,5
	stc
LB_2869:
	mov r9,r11
	bt r12,5
	jc LB_2866
	btr r12,3
	jmp LB_2867
LB_2866:
	bts r12,3
LB_2867:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2870:
	cmp r15,0
	jz LB_2871
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2870
LB_2871:
; _f1780 %_1973 ⊢ %_1975 : %_1975
 ; {>  %_1974~3':(_p1506)◂(_stg) %_1959~0':_r64 %_1973~2':(_p1487)◂((_p1494)◂(_stg)) }
; _f1780 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2876
	btr r12,0
	jmp LB_2877
LB_2876:
	bts r12,0
LB_2877:
	call NS_E_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2878
	btr r12,1
	jmp LB_2879
LB_2878:
	bts r12,1
LB_2879:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2874
	btr r12,3
	clc
	jmp LB_2875
LB_2874:
	bts r12,3
	stc
LB_2875:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2872
	btr r12,0
	clc
	jmp LB_2873
LB_2872:
	bts r12,0
	stc
LB_2873:
	add rsp,24
MTC_LB_2880:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2881
; _emt_mov_ptn_to_ptn:{| 11010.. |},3' ⊢ °1◂{ 2' 4' }
; 3' ⊢ °1◂{ 2' 4' }
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2882
	bt QWORD [rdi],0
	jc LB_2883
	btr r12,5
	clc
	jmp LB_2884
LB_2883:
	bts r12,5
	stc
LB_2884:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2882:
	mov r11,rdi
; 5' ⊢ { 2' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2887
	btr r12,6
	clc
	jmp LB_2888
LB_2887:
	bts r12,6
	stc
LB_2888:
	mov r8,rcx
	bt r12,6
	jc LB_2885
	btr r12,2
	jmp LB_2886
LB_2885:
	bts r12,2
LB_2886:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2891
	btr r12,6
	clc
	jmp LB_2892
LB_2891:
	bts r12,6
	stc
LB_2892:
	mov r10,rcx
	bt r12,6
	jc LB_2889
	btr r12,4
	jmp LB_2890
LB_2889:
	bts r12,4
LB_2890:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2893:
	cmp r15,0
	jz LB_2894
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2893
LB_2894:
; _f1809 %_1976 ⊢ %_1978 : %_1978
 ; {>  %_1976~2':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) %_1959~0':_r64 %_1977~4':(_p1505)◂(_stg) %_1975~1':_stg }
; _f1809 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2901
	btr r12,0
	jmp LB_2902
LB_2901:
	bts r12,0
LB_2902:
	call NS_E_1809
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2903
	btr r12,2
	jmp LB_2904
LB_2903:
	bts r12,2
LB_2904:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2899
	btr r12,4
	clc
	jmp LB_2900
LB_2899:
	bts r12,4
	stc
LB_2900:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2897
	btr r12,1
	clc
	jmp LB_2898
LB_2897:
	bts r12,1
	stc
LB_2898:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2895
	btr r12,0
	clc
	jmp LB_2896
LB_2895:
	bts r12,0
	stc
LB_2896:
	add rsp,32
; _f1998 { %_1959 %_1977 } ⊢ { %_1979 %_1980 } : { %_1979 %_1980 }
 ; {>  %_1959~0':_r64 %_1977~4':(_p1505)◂(_stg) %_1975~1':_stg %_1978~2':_stg }
; _f1998 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2909
	btr r12,1
	jmp LB_2910
LB_2909:
	bts r12,1
LB_2910:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2911
	btr r12,3
	jmp LB_2912
LB_2911:
	bts r12,3
LB_2912:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2907
	btr r12,2
	clc
	jmp LB_2908
LB_2907:
	bts r12,2
	stc
LB_2908:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2905
	btr r12,1
	clc
	jmp LB_2906
LB_2905:
	bts r12,1
	stc
LB_2906:
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
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
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
LB_2913:
	cmp rax,0
	jz LB_2914
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2913
LB_2914:
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
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1981 %_1985 }
 ; {>  %_1981~0':_r64 %_1984~3':_stg %_1982~1':_stg %_1983~2':_stg %_1985~4':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2915
	mov rdi,r9
	call dlt
LB_2915:
	bt r12,1
	jc LB_2916
	mov rdi,r14
	call dlt
LB_2916:
	bt r12,2
	jc LB_2917
	mov rdi,r8
	call dlt
LB_2917:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2918
	btr r12,1
	jmp LB_2919
LB_2918:
	bts r12,1
LB_2919:
	ret
MTC_LB_2881:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2920
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
	jnc LB_2921
	bt QWORD [rdi],0
	jc LB_2922
	btr r12,4
	clc
	jmp LB_2923
LB_2922:
	bts r12,4
	stc
LB_2923:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2921:
	mov r10,rdi
	mov r8,r10
	bt r12,4
	jc LB_2924
	btr r12,2
	jmp LB_2925
LB_2924:
	bts r12,2
LB_2925:
LB_2926:
	cmp r15,0
	jz LB_2927
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2926
LB_2927:
; _f2163 { %_1959 %_1986 } ⊢ { %_1987 %_1988 } : { %_1987 %_1988 }
 ; {>  %_1986~2':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_1959~0':_r64 %_1975~1':_stg }
; _f2163 { 0' 2' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2930
	btr r12,1
	jmp LB_2931
LB_2930:
	bts r12,1
LB_2931:
	call NS_E_2163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2932
	btr r12,2
	jmp LB_2933
LB_2932:
	bts r12,2
LB_2933:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2928
	btr r12,1
	clc
	jmp LB_2929
LB_2928:
	bts r12,1
	stc
LB_2929:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
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
LB_2934:
	cmp rax,0
	jz LB_2935
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2934
LB_2935:
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
; " \226\138\162\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1989 %_1992 }
 ; {>  %_1991~2':_stg %_1992~3':_stg %_1990~1':_stg %_1989~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2936
	mov rdi,r8
	call dlt
LB_2936:
	bt r12,1
	jc LB_2937
	mov rdi,r14
	call dlt
LB_2937:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2938
	btr r12,1
	jmp LB_2939
LB_2938:
	bts r12,1
LB_2939:
	ret
MTC_LB_2920:
MTC_LB_2858:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2940
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
	jnc LB_2941
	bt QWORD [rdi],0
	jc LB_2942
	btr r12,3
	clc
	jmp LB_2943
LB_2942:
	bts r12,3
	stc
LB_2943:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2941:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2944
	btr r12,2
	jmp LB_2945
LB_2944:
	bts r12,2
LB_2945:
LB_2946:
	cmp r15,0
	jz LB_2947
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2946
LB_2947:
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
LB_2948:
	cmp rax,0
	jz LB_2949
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2948
LB_2949:
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
; ∎ { %_1994 %_1995 }
 ; {>  %_1993~2':(_p1487)◂((_p1494)◂(_stg)) %_1994~0':_r64 %_1995~1':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2950
	mov rdi,r8
	call dlt
LB_2950:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2940:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2951
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{  }
; 1' ⊢ °4◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2952
	bt QWORD [rdi],0
	jc LB_2953
	btr r12,2
	clc
	jmp LB_2954
LB_2953:
	bts r12,2
	stc
LB_2954:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2952:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2955:
	cmp r15,0
	jz LB_2956
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2955
LB_2956:
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
LB_2957:
	cmp rax,0
	jz LB_2958
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2957
LB_2958:
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
; ∎ { %_1996 %_1997 }
 ; {>  %_1997~1':_stg %_1996~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2951:
NS_E_3277:
; 	|» { 0' 1' }
NS_E_RDI_3277:
MTC_LB_3278:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3279
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
	jnc LB_3280
	bt QWORD [rdi],0
	jc LB_3281
	btr r12,6
	clc
	jmp LB_3282
LB_3281:
	bts r12,6
	stc
LB_3282:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3280:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_3295
	btr r12,7
	clc
	jmp LB_3296
LB_3295:
	bts r12,7
	stc
LB_3296:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3285
	btr r12,5
	clc
	jmp LB_3286
LB_3285:
	bts r12,5
	stc
LB_3286:
	mov r8,r11
	bt r12,5
	jc LB_3283
	btr r12,2
	jmp LB_3284
LB_3283:
	bts r12,2
LB_3284:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3289
	btr r12,5
	clc
	jmp LB_3290
LB_3289:
	bts r12,5
	stc
LB_3290:
	mov r9,r11
	bt r12,5
	jc LB_3287
	btr r12,3
	jmp LB_3288
LB_3287:
	bts r12,3
LB_3288:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_3293
	btr r12,5
	clc
	jmp LB_3294
LB_3293:
	bts r12,5
	stc
LB_3294:
	mov r10,r11
	bt r12,5
	jc LB_3291
	btr r12,4
	jmp LB_3292
LB_3291:
	bts r12,4
LB_3292:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_3299
	btr r12,7
	clc
	jmp LB_3300
LB_3299:
	bts r12,7
	stc
LB_3300:
	mov r11,rdx
	bt r12,7
	jc LB_3297
	btr r12,5
	jmp LB_3298
LB_3297:
	bts r12,5
LB_3298:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3301:
	cmp r15,0
	jz LB_3302
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3301
LB_3302:
; _f1799 %_3260 ⊢ %_3263 : %_3263
 ; {>  %_3262~5':(_lst)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) %_3260~3':(_p1487)◂((_p1495)◂(_stg)) %_3259~2':_stg %_3261~4':(_p1505)◂(_stg) %_3257~0':_r64 }
; _f1799 3' ⊢ 1'
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
	jc LB_3311
	btr r12,0
	jmp LB_3312
LB_3311:
	bts r12,0
LB_3312:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3313
	btr r12,1
	jmp LB_3314
LB_3313:
	bts r12,1
LB_3314:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3309
	btr r12,5
	clc
	jmp LB_3310
LB_3309:
	bts r12,5
	stc
LB_3310:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3307
	btr r12,4
	clc
	jmp LB_3308
LB_3307:
	bts r12,4
	stc
LB_3308:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3305
	btr r12,2
	clc
	jmp LB_3306
LB_3305:
	bts r12,2
	stc
LB_3306:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3303
	btr r12,0
	clc
	jmp LB_3304
LB_3303:
	bts r12,0
	stc
LB_3304:
	add rsp,40
; _f3277 { %_3257 %_3262 } ⊢ { %_3264 %_3265 } : { %_3264 %_3265 }
 ; {>  %_3262~5':(_lst)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) %_3259~2':_stg %_3263~1':_stg %_3261~4':(_p1505)◂(_stg) %_3257~0':_r64 }
; _f3277 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_3321
	btr r12,1
	jmp LB_3322
LB_3321:
	bts r12,1
LB_3322:
	call NS_E_3277
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3323
	btr r12,3
	jmp LB_3324
LB_3323:
	bts r12,3
LB_3324:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3319
	btr r12,4
	clc
	jmp LB_3320
LB_3319:
	bts r12,4
	stc
LB_3320:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3317
	btr r12,2
	clc
	jmp LB_3318
LB_3317:
	bts r12,2
	stc
LB_3318:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3315
	btr r12,1
	clc
	jmp LB_3316
LB_3315:
	bts r12,1
	stc
LB_3316:
	add rsp,32
; _f56 %_3264 ⊢ %_3266 : %_3266
 ; {>  %_3264~0':_r64 %_3265~3':_stg %_3259~2':_stg %_3263~1':_stg %_3261~4':(_p1505)◂(_stg) }
	add r13,1
; _f1998 { %_3266 %_3261 } ⊢ { %_3267 %_3268 } : { %_3267 %_3268 }
 ; {>  %_3265~3':_stg %_3266~0':_r64 %_3259~2':_stg %_3263~1':_stg %_3261~4':(_p1505)◂(_stg) }
; _f1998 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
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
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_3333
	btr r12,4
	jmp LB_3334
LB_3333:
	bts r12,4
LB_3334:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_3329
	btr r12,3
	clc
	jmp LB_3330
LB_3329:
	bts r12,3
	stc
LB_3330:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3327
	btr r12,2
	clc
	jmp LB_3328
LB_3327:
	bts r12,2
	stc
LB_3328:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3325
	btr r12,1
	clc
	jmp LB_3326
LB_3325:
	bts r12,1
	stc
LB_3326:
	add rsp,32
; _f55 %_3267 ⊢ %_3269 : %_3269
 ; {>  %_3265~3':_stg %_3259~2':_stg %_3268~4':_stg %_3263~1':_stg %_3267~0':_r64 }
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
; ∎ { %_3270 %_3275 }
 ; {>  %_3271~2':_stg %_3273~4':_stg %_3272~1':_stg %_3274~3':_stg %_3270~0':_r64 %_3275~5':_stg }
; 	∎ { 0' 5' }
	bt r12,2
	jc LB_3337
	mov rdi,r8
	call dlt
LB_3337:
	bt r12,4
	jc LB_3338
	mov rdi,r10
	call dlt
LB_3338:
	bt r12,1
	jc LB_3339
	mov rdi,r14
	call dlt
LB_3339:
	bt r12,3
	jc LB_3340
	mov rdi,r9
	call dlt
LB_3340:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_3341
	btr r12,1
	jmp LB_3342
LB_3341:
	bts r12,1
LB_3342:
	ret
MTC_LB_3279:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3343
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
	jnc LB_3344
	bt QWORD [rdi],0
	jc LB_3345
	btr r12,2
	clc
	jmp LB_3346
LB_3345:
	bts r12,2
	stc
LB_3346:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3344:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3347:
	cmp r15,0
	jz LB_3348
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3347
LB_3348:
; 	» "" _ ⊢ 1' : %_3276
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3257 %_3276 }
 ; {>  %_3276~1':_stg %_3257~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3343:
NS_E_3256:
; 	|» { 0' 1' }
NS_E_RDI_3256:
MTC_LB_3349:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3350
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
	jnc LB_3351
	bt QWORD [rdi],0
	jc LB_3352
	btr r12,4
	clc
	jmp LB_3353
LB_3352:
	bts r12,4
	stc
LB_3353:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3351:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3356
	btr r12,5
	clc
	jmp LB_3357
LB_3356:
	bts r12,5
	stc
LB_3357:
	mov r8,r11
	bt r12,5
	jc LB_3354
	btr r12,2
	jmp LB_3355
LB_3354:
	bts r12,2
LB_3355:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3360
	btr r12,5
	clc
	jmp LB_3361
LB_3360:
	bts r12,5
	stc
LB_3361:
	mov r9,r11
	bt r12,5
	jc LB_3358
	btr r12,3
	jmp LB_3359
LB_3358:
	bts r12,3
LB_3359:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3362:
	cmp r15,0
	jz LB_3363
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3362
LB_3363:
; _f1799 %_3235 ⊢ %_3237 : %_3237
 ; {>  %_3233~0':_r64 %_3236~3':(_p1505)◂(_stg) %_3235~2':(_p1487)◂((_p1495)◂(_stg)) }
; _f1799 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3368
	btr r12,0
	jmp LB_3369
LB_3368:
	bts r12,0
LB_3369:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3370
	btr r12,1
	jmp LB_3371
LB_3370:
	bts r12,1
LB_3371:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3366
	btr r12,3
	clc
	jmp LB_3367
LB_3366:
	bts r12,3
	stc
LB_3367:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3364
	btr r12,0
	clc
	jmp LB_3365
LB_3364:
	bts r12,0
	stc
LB_3365:
	add rsp,24
; _f56 %_3233 ⊢ %_3238 : %_3238
 ; {>  %_3233~0':_r64 %_3236~3':(_p1505)◂(_stg) %_3237~1':_stg }
	add r13,1
; _f1998 { %_3238 %_3236 } ⊢ { %_3239 %_3240 } : { %_3239 %_3240 }
 ; {>  %_3236~3':(_p1505)◂(_stg) %_3237~1':_stg %_3238~0':_r64 }
; _f1998 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3374
	btr r12,1
	jmp LB_3375
LB_3374:
	bts r12,1
LB_3375:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3376
	btr r12,2
	jmp LB_3377
LB_3376:
	bts r12,2
LB_3377:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3372
	btr r12,1
	clc
	jmp LB_3373
LB_3372:
	bts r12,1
	stc
LB_3373:
	add rsp,16
; _f55 %_3239 ⊢ %_3241 : %_3241
 ; {>  %_3237~1':_stg %_3240~2':_stg %_3239~0':_r64 }
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
; ∎ { %_3241 %_3244 }
 ; {>  %_3243~2':_stg %_3241~0':_r64 %_3244~3':_stg %_3242~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3378
	mov rdi,r8
	call dlt
LB_3378:
	bt r12,1
	jc LB_3379
	mov rdi,r14
	call dlt
LB_3379:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3380
	btr r12,1
	jmp LB_3381
LB_3380:
	bts r12,1
LB_3381:
	ret
MTC_LB_3350:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3382
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
	jnc LB_3383
	bt QWORD [rdi],0
	jc LB_3384
	btr r12,3
	clc
	jmp LB_3385
LB_3384:
	bts r12,3
	stc
LB_3385:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3383:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3386
	btr r12,2
	jmp LB_3387
LB_3386:
	bts r12,2
LB_3387:
LB_3388:
	cmp r15,0
	jz LB_3389
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3388
LB_3389:
; _f1595 %_3245 ⊢ %_3246 : %_3246
 ; {>  %_3233~0':_r64 %_3245~2':_p1490 }
; _f1595 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3392
	btr r12,0
	jmp LB_3393
LB_3392:
	bts r12,0
LB_3393:
	call NS_E_1595
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3394
	btr r12,1
	jmp LB_3395
LB_3394:
	bts r12,1
LB_3395:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3390
	btr r12,0
	clc
	jmp LB_3391
LB_3390:
	bts r12,0
	stc
LB_3391:
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
; ∎ { %_3233 %_3248 }
 ; {>  %_3248~2':_stg %_3233~0':_r64 %_3247~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3396
	mov rdi,r14
	call dlt
LB_3396:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3397
	btr r12,1
	jmp LB_3398
LB_3397:
	bts r12,1
LB_3398:
	ret
MTC_LB_3382:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3399
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
	jnc LB_3400
	bt QWORD [rdi],0
	jc LB_3401
	btr r12,3
	clc
	jmp LB_3402
LB_3401:
	bts r12,3
	stc
LB_3402:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3400:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3403
	btr r12,2
	jmp LB_3404
LB_3403:
	bts r12,2
LB_3404:
LB_3405:
	cmp r15,0
	jz LB_3406
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3405
LB_3406:
; _f56 %_3233 ⊢ %_3250 : %_3250
 ; {>  %_3249~2':(_p1505)◂(_stg) %_3233~0':_r64 }
	add r13,1
; _f1998 { %_3250 %_3249 } ⊢ { %_3251 %_3252 } : { %_3251 %_3252 }
 ; {>  %_3249~2':(_p1505)◂(_stg) %_3250~0':_r64 }
; _f1998 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3407
	btr r12,1
	jmp LB_3408
LB_3407:
	bts r12,1
LB_3408:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3251 ⊢ %_3253 : %_3253
 ; {>  %_3252~1':_stg %_3251~0':_r64 }
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
; ∎ { %_3253 %_3255 }
 ; {>  %_3254~1':_stg %_3253~0':_r64 %_3255~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3409
	mov rdi,r14
	call dlt
LB_3409:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3410
	btr r12,1
	jmp LB_3411
LB_3410:
	bts r12,1
LB_3411:
	ret
MTC_LB_3399:
NS_E_3232:
; 	|» 0'
NS_E_RDI_3232:
MTC_LB_3412:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3413
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
	jnc LB_3414
	bt QWORD [rdi],0
	jc LB_3415
	btr r12,3
	clc
	jmp LB_3416
LB_3415:
	bts r12,3
	stc
LB_3416:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3414:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3419
	btr r12,4
	clc
	jmp LB_3420
LB_3419:
	bts r12,4
	stc
LB_3420:
	mov r14,r10
	bt r12,4
	jc LB_3417
	btr r12,1
	jmp LB_3418
LB_3417:
	bts r12,1
LB_3418:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3423
	btr r12,4
	clc
	jmp LB_3424
LB_3423:
	bts r12,4
	stc
LB_3424:
	mov r8,r10
	bt r12,4
	jc LB_3421
	btr r12,2
	jmp LB_3422
LB_3421:
	bts r12,2
LB_3422:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3425:
	cmp r15,0
	jz LB_3426
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3425
LB_3426:
; _f3222 %_3224 ⊢ %_3226 : %_3226
 ; {>  %_3225~2':(_lst)◂(_p1551) %_3224~1':_p1551 }
; _f3222 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3429
	btr r12,0
	jmp LB_3430
LB_3429:
	bts r12,0
LB_3430:
	call NS_E_3222
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3427
	btr r12,2
	clc
	jmp LB_3428
LB_3427:
	bts r12,2
	stc
LB_3428:
	add rsp,16
; _f3232 %_3225 ⊢ %_3227 : %_3227
 ; {>  %_3225~2':(_lst)◂(_p1551) %_3226~0':_stg }
; _f3232 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3433
	btr r12,0
	jmp LB_3434
LB_3433:
	bts r12,0
LB_3434:
	call NS_E_3232
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3435
	btr r12,1
	jmp LB_3436
LB_3435:
	bts r12,1
LB_3436:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3431
	btr r12,0
	clc
	jmp LB_3432
LB_3431:
	bts r12,0
	stc
LB_3432:
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
; ∎ %_3230
 ; {>  %_3230~2':_stg %_3228~0':_stg %_3229~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_3437
	mov rdi,r13
	call dlt
LB_3437:
	bt r12,1
	jc LB_3438
	mov rdi,r14
	call dlt
LB_3438:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3439
	btr r12,0
	jmp LB_3440
LB_3439:
	bts r12,0
LB_3440:
	ret
MTC_LB_3413:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3441
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
	jnc LB_3442
	bt QWORD [rdi],0
	jc LB_3443
	btr r12,1
	clc
	jmp LB_3444
LB_3443:
	bts r12,1
	stc
LB_3444:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3442:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3445:
	cmp r15,0
	jz LB_3446
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3445
LB_3446:
; 	» "" _ ⊢ 0' : %_3231
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_3231
 ; {>  %_3231~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3441:
NS_E_3222:
; 	|» 0'
NS_E_RDI_3222:
MTC_LB_3447:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3448
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
	jnc LB_3449
	bt QWORD [rdi],0
	jc LB_3450
	btr r12,2
	clc
	jmp LB_3451
LB_3450:
	bts r12,2
	stc
LB_3451:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3449:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_3452
	btr r12,1
	jmp LB_3453
LB_3452:
	bts r12,1
LB_3453:
LB_3454:
	cmp r15,0
	jz LB_3455
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3454
LB_3455:
; _f3232 %_3199 ⊢ %_3200 : %_3200
 ; {>  %_3199~1':(_lst)◂(_p1551) }
; _f3232 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3456
	btr r12,0
	jmp LB_3457
LB_3456:
	bts r12,0
LB_3457:
	call NS_E_3232
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
; ∎ %_3202
 ; {>  %_3201~0':_stg %_3202~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_3458
	mov rdi,r13
	call dlt
LB_3458:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3459
	btr r12,0
	jmp LB_3460
LB_3459:
	bts r12,0
LB_3460:
	ret
MTC_LB_3448:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3461
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
	jnc LB_3462
	bt QWORD [rdi],0
	jc LB_3463
	btr r12,3
	clc
	jmp LB_3464
LB_3463:
	bts r12,3
	stc
LB_3464:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3462:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3467
	btr r12,4
	clc
	jmp LB_3468
LB_3467:
	bts r12,4
	stc
LB_3468:
	mov r14,r10
	bt r12,4
	jc LB_3465
	btr r12,1
	jmp LB_3466
LB_3465:
	bts r12,1
LB_3466:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3471
	btr r12,4
	clc
	jmp LB_3472
LB_3471:
	bts r12,4
	stc
LB_3472:
	mov r8,r10
	bt r12,4
	jc LB_3469
	btr r12,2
	jmp LB_3470
LB_3469:
	bts r12,2
LB_3470:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3473:
	cmp r15,0
	jz LB_3474
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3473
LB_3474:
; _f3222 %_3203 ⊢ %_3205 : %_3205
 ; {>  %_3203~1':_p1551 %_3204~2':_p1551 }
; _f3222 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3477
	btr r12,0
	jmp LB_3478
LB_3477:
	bts r12,0
LB_3478:
	call NS_E_3222
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3475
	btr r12,2
	clc
	jmp LB_3476
LB_3475:
	bts r12,2
	stc
LB_3476:
	add rsp,16
; _f3222 %_3204 ⊢ %_3206 : %_3206
 ; {>  %_3204~2':_p1551 %_3205~0':_stg }
; _f3222 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3481
	btr r12,0
	jmp LB_3482
LB_3481:
	bts r12,0
LB_3482:
	call NS_E_3222
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3483
	btr r12,1
	jmp LB_3484
LB_3483:
	bts r12,1
LB_3484:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3479
	btr r12,0
	clc
	jmp LB_3480
LB_3479:
	bts r12,0
	stc
LB_3480:
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
; ∎ %_3209
 ; {>  %_3207~0':_stg %_3209~2':_stg %_3208~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_3485
	mov rdi,r13
	call dlt
LB_3485:
	bt r12,1
	jc LB_3486
	mov rdi,r14
	call dlt
LB_3486:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3487
	btr r12,0
	jmp LB_3488
LB_3487:
	bts r12,0
LB_3488:
	ret
MTC_LB_3461:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3489
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
	jnc LB_3490
	bt QWORD [rdi],0
	jc LB_3491
	btr r12,3
	clc
	jmp LB_3492
LB_3491:
	bts r12,3
	stc
LB_3492:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3490:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3495
	btr r12,4
	clc
	jmp LB_3496
LB_3495:
	bts r12,4
	stc
LB_3496:
	mov r14,r10
	bt r12,4
	jc LB_3493
	btr r12,1
	jmp LB_3494
LB_3493:
	bts r12,1
LB_3494:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3499
	btr r12,4
	clc
	jmp LB_3500
LB_3499:
	bts r12,4
	stc
LB_3500:
	mov r8,r10
	bt r12,4
	jc LB_3497
	btr r12,2
	jmp LB_3498
LB_3497:
	bts r12,2
LB_3498:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3501:
	cmp r15,0
	jz LB_3502
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3501
LB_3502:
; _f3222 %_3210 ⊢ %_3212 : %_3212
 ; {>  %_3211~2':_p1551 %_3210~1':_p1551 }
; _f3222 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3505
	btr r12,0
	jmp LB_3506
LB_3505:
	bts r12,0
LB_3506:
	call NS_E_3222
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3503
	btr r12,2
	clc
	jmp LB_3504
LB_3503:
	bts r12,2
	stc
LB_3504:
	add rsp,16
; _f3222 %_3211 ⊢ %_3213 : %_3213
 ; {>  %_3211~2':_p1551 %_3212~0':_stg }
; _f3222 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3509
	btr r12,0
	jmp LB_3510
LB_3509:
	bts r12,0
LB_3510:
	call NS_E_3222
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3511
	btr r12,1
	jmp LB_3512
LB_3511:
	bts r12,1
LB_3512:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3507
	btr r12,0
	clc
	jmp LB_3508
LB_3507:
	bts r12,0
	stc
LB_3508:
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
; ∎ %_3216
 ; {>  %_3216~2':_stg %_3215~1':_stg %_3214~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_3513
	mov rdi,r14
	call dlt
LB_3513:
	bt r12,0
	jc LB_3514
	mov rdi,r13
	call dlt
LB_3514:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3515
	btr r12,0
	jmp LB_3516
LB_3515:
	bts r12,0
LB_3516:
	ret
MTC_LB_3489:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_3517
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
	jnc LB_3518
	bt QWORD [rdi],0
	jc LB_3519
	btr r12,2
	clc
	jmp LB_3520
LB_3519:
	bts r12,2
	stc
LB_3520:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3518:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_3521
	btr r12,1
	jmp LB_3522
LB_3521:
	bts r12,1
LB_3522:
LB_3523:
	cmp r15,0
	jz LB_3524
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3523
LB_3524:
; _f1453 %_3217 ⊢ %_3218 : %_3218
 ; {>  %_3217~1':_p1442 }
; _f1453 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3525
	btr r12,0
	jmp LB_3526
LB_3525:
	bts r12,0
LB_3526:
	call NS_E_1453
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_3218
 ; {>  %_3218~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3517:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_3527
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
	mov r14,r8
	bt r12,2
	jc LB_3531
	btr r12,1
	jmp LB_3532
LB_3531:
	bts r12,1
LB_3532:
LB_3533:
	cmp r15,0
	jz LB_3534
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3533
LB_3534:
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
; ∎ %_3221
 ; {>  %_3220~1':_stg %_3221~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_3535
	mov rdi,r14
	call dlt
LB_3535:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3527:
NS_E_3197:
; 	|» { 0' 1' }
NS_E_RDI_3197:
MTC_LB_3536:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3537
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
	jnc LB_3538
	bt QWORD [rdi],0
	jc LB_3539
	btr r12,5
	clc
	jmp LB_3540
LB_3539:
	bts r12,5
	stc
LB_3540:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3538:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3549
	btr r12,6
	clc
	jmp LB_3550
LB_3549:
	bts r12,6
	stc
LB_3550:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3543
	btr r12,4
	clc
	jmp LB_3544
LB_3543:
	bts r12,4
	stc
LB_3544:
	mov r8,r10
	bt r12,4
	jc LB_3541
	btr r12,2
	jmp LB_3542
LB_3541:
	bts r12,2
LB_3542:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3547
	btr r12,4
	clc
	jmp LB_3548
LB_3547:
	bts r12,4
	stc
LB_3548:
	mov r9,r10
	bt r12,4
	jc LB_3545
	btr r12,3
	jmp LB_3546
LB_3545:
	bts r12,3
LB_3546:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3553
	btr r12,6
	clc
	jmp LB_3554
LB_3553:
	bts r12,6
	stc
LB_3554:
	mov r10,rcx
	bt r12,6
	jc LB_3551
	btr r12,4
	jmp LB_3552
LB_3551:
	bts r12,4
LB_3552:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3555:
	cmp r15,0
	jz LB_3556
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3555
LB_3556:
; _f3197 { %_3183 %_3187 } ⊢ { %_3188 %_3189 } : { %_3188 %_3189 }
 ; {>  %_3183~0':_r64 %_3186~3':_p1551 %_3187~4':(_lst)◂({ _stg _p1551 }) %_3185~2':_stg }
; _f3197 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3561
	btr r12,1
	jmp LB_3562
LB_3561:
	bts r12,1
LB_3562:
	call NS_E_3197
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3559
	btr r12,3
	clc
	jmp LB_3560
LB_3559:
	bts r12,3
	stc
LB_3560:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3557
	btr r12,2
	clc
	jmp LB_3558
LB_3557:
	bts r12,2
	stc
LB_3558:
	add rsp,24
; _f3222 %_3186 ⊢ %_3190 : %_3190
 ; {>  %_3188~0':_r64 %_3189~1':_stg %_3186~3':_p1551 %_3185~2':_stg }
; _f3222 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3569
	btr r12,0
	jmp LB_3570
LB_3569:
	bts r12,0
LB_3570:
	call NS_E_3222
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_3571
	btr r12,3
	jmp LB_3572
LB_3571:
	bts r12,3
LB_3572:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3567
	btr r12,2
	clc
	jmp LB_3568
LB_3567:
	bts r12,2
	stc
LB_3568:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3565
	btr r12,1
	clc
	jmp LB_3566
LB_3565:
	bts r12,1
	stc
LB_3566:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3563
	btr r12,0
	clc
	jmp LB_3564
LB_3563:
	bts r12,0
	stc
LB_3564:
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
LB_3573:
	cmp rax,0
	jz LB_3574
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3573
LB_3574:
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
; ∎ { %_3191 %_3195 }
 ; {>  %_3191~0':_r64 %_3195~4':_stg %_3192~2':_stg %_3194~1':_stg %_3193~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_3575
	mov rdi,r8
	call dlt
LB_3575:
	bt r12,1
	jc LB_3576
	mov rdi,r14
	call dlt
LB_3576:
	bt r12,3
	jc LB_3577
	mov rdi,r9
	call dlt
LB_3577:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3578
	btr r12,1
	jmp LB_3579
LB_3578:
	bts r12,1
LB_3579:
	ret
MTC_LB_3537:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3580
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
	jnc LB_3581
	bt QWORD [rdi],0
	jc LB_3582
	btr r12,2
	clc
	jmp LB_3583
LB_3582:
	bts r12,2
	stc
LB_3583:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3581:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3584:
	cmp r15,0
	jz LB_3585
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3584
LB_3585:
; 	» "" _ ⊢ 1' : %_3196
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3183 %_3196 }
 ; {>  %_3183~0':_r64 %_3196~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3580:
NS_E_3182:
; 	|» { 0' 1' }
NS_E_RDI_3182:
MTC_LB_3586:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3587
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
	jnc LB_3588
	bt QWORD [rdi],0
	jc LB_3589
	btr r12,3
	clc
	jmp LB_3590
LB_3589:
	bts r12,3
	stc
LB_3590:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3588:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3591
	btr r12,2
	jmp LB_3592
LB_3591:
	bts r12,2
LB_3592:
LB_3593:
	cmp r15,0
	jz LB_3594
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3593
LB_3594:
; _f56 %_3169 ⊢ %_3172 : %_3172
 ; {>  %_3171~2':(_lst)◂({ _stg _p1551 }) %_3169~0':_r64 }
	add r13,1
; _f3197 { %_3172 %_3171 } ⊢ { %_3173 %_3174 } : { %_3173 %_3174 }
 ; {>  %_3171~2':(_lst)◂({ _stg _p1551 }) %_3172~0':_r64 }
; _f3197 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3595
	btr r12,1
	jmp LB_3596
LB_3595:
	bts r12,1
LB_3596:
	call NS_E_3197
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3173 ⊢ %_3175 : %_3175
 ; {>  %_3174~1':_stg %_3173~0':_r64 }
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
; ∎ { %_3175 %_3176 }
 ; {>  %_3176~1':_stg %_3175~0':_r64 %_3177~2':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_3597
	mov rdi,r8
	call dlt
LB_3597:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3587:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3598
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
	jnc LB_3599
	bt QWORD [rdi],0
	jc LB_3600
	btr r12,3
	clc
	jmp LB_3601
LB_3600:
	bts r12,3
	stc
LB_3601:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3599:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3602
	btr r12,2
	jmp LB_3603
LB_3602:
	bts r12,2
LB_3603:
LB_3604:
	cmp r15,0
	jz LB_3605
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3604
LB_3605:
; _f3222 %_3178 ⊢ %_3179 : %_3179
 ; {>  %_3169~0':_r64 %_3178~2':_p1551 }
; _f3222 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3608
	btr r12,0
	jmp LB_3609
LB_3608:
	bts r12,0
LB_3609:
	call NS_E_3222
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3610
	btr r12,1
	jmp LB_3611
LB_3610:
	bts r12,1
LB_3611:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3606
	btr r12,0
	clc
	jmp LB_3607
LB_3606:
	bts r12,0
	stc
LB_3607:
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
; ∎ { %_3169 %_3181 }
 ; {>  %_3180~1':_stg %_3169~0':_r64 %_3181~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3612
	mov rdi,r14
	call dlt
LB_3612:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3613
	btr r12,1
	jmp LB_3614
LB_3613:
	bts r12,1
LB_3614:
	ret
MTC_LB_3598:
NS_E_3168:
; 	|» 0'
NS_E_RDI_3168:
MTC_LB_3615:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3616
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
	jnc LB_3617
	bt QWORD [rdi],0
	jc LB_3618
	btr r12,3
	clc
	jmp LB_3619
LB_3618:
	bts r12,3
	stc
LB_3619:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3617:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3622
	btr r12,4
	clc
	jmp LB_3623
LB_3622:
	bts r12,4
	stc
LB_3623:
	mov r14,r10
	bt r12,4
	jc LB_3620
	btr r12,1
	jmp LB_3621
LB_3620:
	bts r12,1
LB_3621:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3626
	btr r12,4
	clc
	jmp LB_3627
LB_3626:
	bts r12,4
	stc
LB_3627:
	mov r8,r10
	bt r12,4
	jc LB_3624
	btr r12,2
	jmp LB_3625
LB_3624:
	bts r12,2
LB_3625:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3628:
	cmp r15,0
	jz LB_3629
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3628
LB_3629:
; _f3168 %_3163 ⊢ %_3164 : %_3164
 ; {>  %_3163~2':_p1548 %_3162~1':_p1549 }
; _f3168 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3632
	btr r12,0
	jmp LB_3633
LB_3632:
	bts r12,0
LB_3633:
	call NS_E_3168
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3630
	btr r12,1
	clc
	jmp LB_3631
LB_3630:
	bts r12,1
	stc
LB_3631:
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
; ∎ %_3166
 ; {>  %_3165~0':_stg %_3162~1':_p1549 %_3166~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_3634
	mov rdi,r13
	call dlt
LB_3634:
	bt r12,1
	jc LB_3635
	mov rdi,r14
	call dlt
LB_3635:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3636
	btr r12,0
	jmp LB_3637
LB_3636:
	bts r12,0
LB_3637:
	ret
MTC_LB_3616:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3638
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
	jnc LB_3639
	bt QWORD [rdi],0
	jc LB_3640
	btr r12,1
	clc
	jmp LB_3641
LB_3640:
	bts r12,1
	stc
LB_3641:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3639:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3642:
	cmp r15,0
	jz LB_3643
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3642
LB_3643:
; 	» "" _ ⊢ 0' : %_3167
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_3167
 ; {>  %_3167~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3638:
NS_E_3160:
; 	|» { 0' 1' }
NS_E_RDI_3160:
MTC_LB_3644:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3645
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
	jnc LB_3646
	bt QWORD [rdi],0
	jc LB_3647
	btr r12,3
	clc
	jmp LB_3648
LB_3647:
	bts r12,3
	stc
LB_3648:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3646:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3649
	btr r12,2
	jmp LB_3650
LB_3649:
	bts r12,2
LB_3650:
LB_3651:
	cmp r15,0
	jz LB_3652
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3651
LB_3652:
; _f3168 %_3149 ⊢ %_3150 : %_3150
 ; {>  %_3147~0':t1380'(-1) %_3149~2':_p1548 }
; _f3168 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3655
	btr r12,0
	jmp LB_3656
LB_3655:
	bts r12,0
LB_3656:
	call NS_E_3168
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3657
	btr r12,1
	jmp LB_3658
LB_3657:
	bts r12,1
LB_3658:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3653
	btr r12,0
	clc
	jmp LB_3654
LB_3653:
	bts r12,0
	stc
LB_3654:
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
; ∎ { %_3147 %_3152 }
 ; {>  %_3147~0':t1380'(-1) %_3152~2':_stg %_3151~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3659
	mov rdi,r14
	call dlt
LB_3659:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3660
	btr r12,1
	jmp LB_3661
LB_3660:
	bts r12,1
LB_3661:
	ret
MTC_LB_3645:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3662
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
	jnc LB_3663
	bt QWORD [rdi],0
	jc LB_3664
	btr r12,4
	clc
	jmp LB_3665
LB_3664:
	bts r12,4
	stc
LB_3665:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3663:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3668
	btr r12,5
	clc
	jmp LB_3669
LB_3668:
	bts r12,5
	stc
LB_3669:
	mov r8,r11
	bt r12,5
	jc LB_3666
	btr r12,2
	jmp LB_3667
LB_3666:
	bts r12,2
LB_3667:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3672
	btr r12,5
	clc
	jmp LB_3673
LB_3672:
	bts r12,5
	stc
LB_3673:
	mov r9,r11
	bt r12,5
	jc LB_3670
	btr r12,3
	jmp LB_3671
LB_3670:
	bts r12,3
LB_3671:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3674:
	cmp r15,0
	jz LB_3675
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3674
LB_3675:
; _f3160 { %_3147 %_3154 } ⊢ { %_3155 %_3156 } : { %_3155 %_3156 }
 ; {>  %_3147~0':t1380'(-1) %_3153~2':_p1549 %_3154~3':_p1547 }
; _f3160 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3678
	btr r12,1
	jmp LB_3679
LB_3678:
	bts r12,1
LB_3679:
	call NS_E_3160
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3676
	btr r12,2
	clc
	jmp LB_3677
LB_3676:
	bts r12,2
	stc
LB_3677:
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
; ∎ { %_3155 %_3158 }
 ; {>  %_3158~3':_stg %_3153~2':_p1549 %_3155~0':t1380'(-1) %_3157~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3680
	mov rdi,r8
	call dlt
LB_3680:
	bt r12,1
	jc LB_3681
	mov rdi,r14
	call dlt
LB_3681:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3682
	btr r12,1
	jmp LB_3683
LB_3682:
	bts r12,1
LB_3683:
	ret
MTC_LB_3662:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3684
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
	jnc LB_3685
	bt QWORD [rdi],0
	jc LB_3686
	btr r12,2
	clc
	jmp LB_3687
LB_3686:
	bts r12,2
	stc
LB_3687:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3685:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3688:
	cmp r15,0
	jz LB_3689
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3688
LB_3689:
; 	» "" _ ⊢ 1' : %_3159
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3147 %_3159 }
 ; {>  %_3159~1':_stg %_3147~0':t1380'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3684:
NS_E_3146:
; 	|» { 0' 1' }
NS_E_RDI_3146:
MTC_LB_3690:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3691
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
	jnc LB_3692
	bt QWORD [rdi],0
	jc LB_3693
	btr r12,8
	clc
	jmp LB_3694
LB_3693:
	bts r12,8
	stc
LB_3694:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3692:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_3697
	btr r12,9
	clc
	jmp LB_3698
LB_3697:
	bts r12,9
	stc
LB_3698:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3695
	btr r12,2
	jmp LB_3696
LB_3695:
	bts r12,2
LB_3696:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_3701
	btr r12,9
	clc
	jmp LB_3702
LB_3701:
	bts r12,9
	stc
LB_3702:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3699
	btr r12,3
	jmp LB_3700
LB_3699:
	bts r12,3
LB_3700:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_3705
	btr r12,9
	clc
	jmp LB_3706
LB_3705:
	bts r12,9
	stc
LB_3706:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3703
	btr r12,4
	jmp LB_3704
LB_3703:
	bts r12,4
LB_3704:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_3709
	btr r12,9
	clc
	jmp LB_3710
LB_3709:
	bts r12,9
	stc
LB_3710:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3707
	btr r12,5
	jmp LB_3708
LB_3707:
	bts r12,5
LB_3708:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_3713
	btr r12,9
	clc
	jmp LB_3714
LB_3713:
	bts r12,9
	stc
LB_3714:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3711
	btr r12,6
	jmp LB_3712
LB_3711:
	bts r12,6
LB_3712:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_3717
	btr r12,9
	clc
	jmp LB_3718
LB_3717:
	bts r12,9
	stc
LB_3718:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_3715
	btr r12,7
	jmp LB_3716
LB_3715:
	bts r12,7
LB_3716:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3719:
	cmp r15,0
	jz LB_3720
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3719
LB_3720:
; _f1799 %_3114 ⊢ %_3120 : %_3120
 ; {>  %_3119~7':_p1545 %_3114~2':(_p1487)◂((_p1495)◂(_stg)) %_3115~3':(_p1505)◂(_stg) %_3112~0':_r64 %_3116~4':_p1546 %_3118~6':(_opn)◂(_p1545) %_3117~5':_p1547 }
; _f1799 2' ⊢ 1'
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
	jc LB_3733
	btr r12,0
	jmp LB_3734
LB_3733:
	bts r12,0
LB_3734:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3735
	btr r12,1
	jmp LB_3736
LB_3735:
	bts r12,1
LB_3736:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_3731
	btr r12,7
	clc
	jmp LB_3732
LB_3731:
	bts r12,7
	stc
LB_3732:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3729
	btr r12,6
	clc
	jmp LB_3730
LB_3729:
	bts r12,6
	stc
LB_3730:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3727
	btr r12,5
	clc
	jmp LB_3728
LB_3727:
	bts r12,5
	stc
LB_3728:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3725
	btr r12,4
	clc
	jmp LB_3726
LB_3725:
	bts r12,4
	stc
LB_3726:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3723
	btr r12,3
	clc
	jmp LB_3724
LB_3723:
	bts r12,3
	stc
LB_3724:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3721
	btr r12,0
	clc
	jmp LB_3722
LB_3721:
	bts r12,0
	stc
LB_3722:
	add rsp,56
; _f56 %_3112 ⊢ %_3121 : %_3121
 ; {>  %_3119~7':_p1545 %_3120~1':_stg %_3115~3':(_p1505)◂(_stg) %_3112~0':_r64 %_3116~4':_p1546 %_3118~6':(_opn)◂(_p1545) %_3117~5':_p1547 }
	add r13,1
; _f1998 { %_3121 %_3115 } ⊢ { %_3122 %_3123 } : { %_3122 %_3123 }
 ; {>  %_3121~0':_r64 %_3119~7':_p1545 %_3120~1':_stg %_3115~3':(_p1505)◂(_stg) %_3116~4':_p1546 %_3118~6':(_opn)◂(_p1545) %_3117~5':_p1547 }
; _f1998 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_3747
	btr r12,1
	jmp LB_3748
LB_3747:
	bts r12,1
LB_3748:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3749
	btr r12,2
	jmp LB_3750
LB_3749:
	bts r12,2
LB_3750:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_3745
	btr r12,7
	clc
	jmp LB_3746
LB_3745:
	bts r12,7
	stc
LB_3746:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_3743
	btr r12,6
	clc
	jmp LB_3744
LB_3743:
	bts r12,6
	stc
LB_3744:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_3741
	btr r12,5
	clc
	jmp LB_3742
LB_3741:
	bts r12,5
	stc
LB_3742:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3739
	btr r12,4
	clc
	jmp LB_3740
LB_3739:
	bts r12,4
	stc
LB_3740:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3737
	btr r12,1
	clc
	jmp LB_3738
LB_3737:
	bts r12,1
	stc
LB_3738:
	add rsp,48
; _f55 %_3122 ⊢ %_3124 : %_3124
 ; {>  %_3119~7':_p1545 %_3120~1':_stg %_3116~4':_p1546 %_3122~0':_r64 %_3118~6':(_opn)◂(_p1545) %_3117~5':_p1547 %_3123~2':_stg }
	sub r13,1
; _f3146 { %_3124 %_3119 } ⊢ { %_3125 %_3126 } : { %_3125 %_3126 }
 ; {>  %_3119~7':_p1545 %_3124~0':_r64 %_3120~1':_stg %_3116~4':_p1546 %_3118~6':(_opn)◂(_p1545) %_3117~5':_p1547 %_3123~2':_stg }
; _f3146 { 0' 7' } ⊢ { 0' 3' }
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
	jc LB_3761
	btr r12,1
	jmp LB_3762
LB_3761:
	bts r12,1
LB_3762:
	call NS_E_3146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3763
	btr r12,3
	jmp LB_3764
LB_3763:
	bts r12,3
LB_3764:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3759
	btr r12,6
	clc
	jmp LB_3760
LB_3759:
	bts r12,6
	stc
LB_3760:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3757
	btr r12,5
	clc
	jmp LB_3758
LB_3757:
	bts r12,5
	stc
LB_3758:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3755
	btr r12,4
	clc
	jmp LB_3756
LB_3755:
	bts r12,4
	stc
LB_3756:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3753
	btr r12,2
	clc
	jmp LB_3754
LB_3753:
	bts r12,2
	stc
LB_3754:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3751
	btr r12,1
	clc
	jmp LB_3752
LB_3751:
	bts r12,1
	stc
LB_3752:
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
LB_3765:
	cmp rax,0
	jz LB_3766
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3765
LB_3766:
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
; ∎ { %_3127 %_3131 }
 ; {>  %_3128~1':_stg %_3127~0':_r64 %_3129~2':_stg %_3116~4':_p1546 %_3131~7':_stg %_3118~6':(_opn)◂(_p1545) %_3117~5':_p1547 %_3130~3':_stg }
; 	∎ { 0' 7' }
	bt r12,1
	jc LB_3767
	mov rdi,r14
	call dlt
LB_3767:
	bt r12,2
	jc LB_3768
	mov rdi,r8
	call dlt
LB_3768:
	bt r12,4
	jc LB_3769
	mov rdi,r10
	call dlt
LB_3769:
	bt r12,6
	jc LB_3770
	mov rdi,rcx
	call dlt
LB_3770:
	bt r12,5
	jc LB_3771
	mov rdi,r11
	call dlt
LB_3771:
	bt r12,3
	jc LB_3772
	mov rdi,r9
	call dlt
LB_3772:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_3773
	btr r12,1
	jmp LB_3774
LB_3773:
	bts r12,1
LB_3774:
	ret
MTC_LB_3691:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3775
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
	jnc LB_3776
	bt QWORD [rdi],0
	jc LB_3777
	btr r12,7
	clc
	jmp LB_3778
LB_3777:
	bts r12,7
	stc
LB_3778:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3776:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3781
	btr r12,8
	clc
	jmp LB_3782
LB_3781:
	bts r12,8
	stc
LB_3782:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3779
	btr r12,2
	jmp LB_3780
LB_3779:
	bts r12,2
LB_3780:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3785
	btr r12,8
	clc
	jmp LB_3786
LB_3785:
	bts r12,8
	stc
LB_3786:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3783
	btr r12,3
	jmp LB_3784
LB_3783:
	bts r12,3
LB_3784:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3789
	btr r12,8
	clc
	jmp LB_3790
LB_3789:
	bts r12,8
	stc
LB_3790:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3787
	btr r12,4
	jmp LB_3788
LB_3787:
	bts r12,4
LB_3788:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3793
	btr r12,8
	clc
	jmp LB_3794
LB_3793:
	bts r12,8
	stc
LB_3794:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3791
	btr r12,5
	jmp LB_3792
LB_3791:
	bts r12,5
LB_3792:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3797
	btr r12,8
	clc
	jmp LB_3798
LB_3797:
	bts r12,8
	stc
LB_3798:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3795
	btr r12,6
	jmp LB_3796
LB_3795:
	bts r12,6
LB_3796:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3799:
	cmp r15,0
	jz LB_3800
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3799
LB_3800:
; _f1799 %_3132 ⊢ %_3137 : %_3137
 ; {>  %_3134~4':_p1546 %_3132~2':(_p1487)◂((_p1495)◂(_stg)) %_3112~0':_r64 %_3135~5':_p1547 %_3136~6':(_opn)◂(_p1545) %_3133~3':(_p1505)◂(_stg) }
; _f1799 2' ⊢ 1'
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
	jc LB_3811
	btr r12,0
	jmp LB_3812
LB_3811:
	bts r12,0
LB_3812:
	call NS_E_1799
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3813
	btr r12,1
	jmp LB_3814
LB_3813:
	bts r12,1
LB_3814:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3809
	btr r12,6
	clc
	jmp LB_3810
LB_3809:
	bts r12,6
	stc
LB_3810:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3807
	btr r12,5
	clc
	jmp LB_3808
LB_3807:
	bts r12,5
	stc
LB_3808:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3805
	btr r12,4
	clc
	jmp LB_3806
LB_3805:
	bts r12,4
	stc
LB_3806:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3803
	btr r12,3
	clc
	jmp LB_3804
LB_3803:
	bts r12,3
	stc
LB_3804:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3801
	btr r12,0
	clc
	jmp LB_3802
LB_3801:
	bts r12,0
	stc
LB_3802:
	add rsp,48
; _f56 %_3112 ⊢ %_3138 : %_3138
 ; {>  %_3134~4':_p1546 %_3112~0':_r64 %_3135~5':_p1547 %_3137~1':_stg %_3136~6':(_opn)◂(_p1545) %_3133~3':(_p1505)◂(_stg) }
	add r13,1
; _f1998 { %_3138 %_3133 } ⊢ { %_3139 %_3140 } : { %_3139 %_3140 }
 ; {>  %_3134~4':_p1546 %_3135~5':_p1547 %_3138~0':_r64 %_3137~1':_stg %_3136~6':(_opn)◂(_p1545) %_3133~3':(_p1505)◂(_stg) }
; _f1998 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_3823
	btr r12,1
	jmp LB_3824
LB_3823:
	bts r12,1
LB_3824:
	call NS_E_1998
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3825
	btr r12,2
	jmp LB_3826
LB_3825:
	bts r12,2
LB_3826:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_3821
	btr r12,6
	clc
	jmp LB_3822
LB_3821:
	bts r12,6
	stc
LB_3822:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_3819
	btr r12,5
	clc
	jmp LB_3820
LB_3819:
	bts r12,5
	stc
LB_3820:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3817
	btr r12,4
	clc
	jmp LB_3818
LB_3817:
	bts r12,4
	stc
LB_3818:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3815
	btr r12,1
	clc
	jmp LB_3816
LB_3815:
	bts r12,1
	stc
LB_3816:
	add rsp,40
; _f55 %_3139 ⊢ %_3141 : %_3141
 ; {>  %_3134~4':_p1546 %_3140~2':_stg %_3139~0':_r64 %_3135~5':_p1547 %_3137~1':_stg %_3136~6':(_opn)◂(_p1545) }
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
LB_3827:
	cmp rax,0
	jz LB_3828
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3827
LB_3828:
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
; ∎ { %_3142 %_3145 }
 ; {>  %_3134~4':_p1546 %_3143~1':_stg %_3135~5':_p1547 %_3142~0':_r64 %_3145~3':_stg %_3144~2':_stg %_3136~6':(_opn)◂(_p1545) }
; 	∎ { 0' 3' }
	bt r12,4
	jc LB_3829
	mov rdi,r10
	call dlt
LB_3829:
	bt r12,1
	jc LB_3830
	mov rdi,r14
	call dlt
LB_3830:
	bt r12,5
	jc LB_3831
	mov rdi,r11
	call dlt
LB_3831:
	bt r12,2
	jc LB_3832
	mov rdi,r8
	call dlt
LB_3832:
	bt r12,6
	jc LB_3833
	mov rdi,rcx
	call dlt
LB_3833:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3834
	btr r12,1
	jmp LB_3835
LB_3834:
	bts r12,1
LB_3835:
	ret
MTC_LB_3775:
NS_E_3111:
; 	|» { 0' 1' }
NS_E_RDI_3111:
MTC_LB_3836:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3837
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
	jnc LB_3838
	bt QWORD [rdi],0
	jc LB_3839
	btr r12,7
	clc
	jmp LB_3840
LB_3839:
	bts r12,7
	stc
LB_3840:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3838:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3843
	btr r12,8
	clc
	jmp LB_3844
LB_3843:
	bts r12,8
	stc
LB_3844:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3841
	btr r12,2
	jmp LB_3842
LB_3841:
	bts r12,2
LB_3842:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3847
	btr r12,8
	clc
	jmp LB_3848
LB_3847:
	bts r12,8
	stc
LB_3848:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3845
	btr r12,3
	jmp LB_3846
LB_3845:
	bts r12,3
LB_3846:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3851
	btr r12,8
	clc
	jmp LB_3852
LB_3851:
	bts r12,8
	stc
LB_3852:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3849
	btr r12,4
	jmp LB_3850
LB_3849:
	bts r12,4
LB_3850:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3855
	btr r12,8
	clc
	jmp LB_3856
LB_3855:
	bts r12,8
	stc
LB_3856:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3853
	btr r12,5
	jmp LB_3854
LB_3853:
	bts r12,5
LB_3854:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3859
	btr r12,8
	clc
	jmp LB_3860
LB_3859:
	bts r12,8
	stc
LB_3860:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3857
	btr r12,6
	jmp LB_3858
LB_3857:
	bts r12,6
LB_3858:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3861:
	cmp r15,0
	jz LB_3862
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3861
LB_3862:
; _f3111 { %_3093 %_3099 } ⊢ { %_3100 %_3101 } : { %_3100 %_3101 }
 ; {>  %_3096~3':_p1546 %_3095~2':(_opn)◂(_stg) %_3098~5':(_opn)◂(_p1544) %_3093~0':_r64 %_3099~6':_p1544 %_3097~4':_p1547 }
; _f3111 { 0' 6' } ⊢ { 0' 1' }
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
	jc LB_3871
	btr r12,1
	jmp LB_3872
LB_3871:
	bts r12,1
LB_3872:
	call NS_E_3111
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3869
	btr r12,5
	clc
	jmp LB_3870
LB_3869:
	bts r12,5
	stc
LB_3870:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3867
	btr r12,4
	clc
	jmp LB_3868
LB_3867:
	bts r12,4
	stc
LB_3868:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3865
	btr r12,3
	clc
	jmp LB_3866
LB_3865:
	bts r12,3
	stc
LB_3866:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3863
	btr r12,2
	clc
	jmp LB_3864
LB_3863:
	bts r12,2
	stc
LB_3864:
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
LB_3873:
	cmp rax,0
	jz LB_3874
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3873
LB_3874:
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
; ∎ { %_3102 %_3104 }
 ; {>  %_3096~3':_p1546 %_3095~2':(_opn)◂(_stg) %_3098~5':(_opn)◂(_p1544) %_3103~1':_stg %_3104~6':_stg %_3102~0':_r64 %_3097~4':_p1547 }
; 	∎ { 0' 6' }
	bt r12,3
	jc LB_3875
	mov rdi,r9
	call dlt
LB_3875:
	bt r12,2
	jc LB_3876
	mov rdi,r8
	call dlt
LB_3876:
	bt r12,5
	jc LB_3877
	mov rdi,r11
	call dlt
LB_3877:
	bt r12,1
	jc LB_3878
	mov rdi,r14
	call dlt
LB_3878:
	bt r12,4
	jc LB_3879
	mov rdi,r10
	call dlt
LB_3879:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_3880
	btr r12,1
	jmp LB_3881
LB_3880:
	bts r12,1
LB_3881:
	ret
MTC_LB_3837:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3882
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
	jnc LB_3883
	bt QWORD [rdi],0
	jc LB_3884
	btr r12,6
	clc
	jmp LB_3885
LB_3884:
	bts r12,6
	stc
LB_3885:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3883:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_3888
	btr r12,7
	clc
	jmp LB_3889
LB_3888:
	bts r12,7
	stc
LB_3889:
	mov r8,rdx
	bt r12,7
	jc LB_3886
	btr r12,2
	jmp LB_3887
LB_3886:
	bts r12,2
LB_3887:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_3892
	btr r12,7
	clc
	jmp LB_3893
LB_3892:
	bts r12,7
	stc
LB_3893:
	mov r9,rdx
	bt r12,7
	jc LB_3890
	btr r12,3
	jmp LB_3891
LB_3890:
	bts r12,3
LB_3891:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_3896
	btr r12,7
	clc
	jmp LB_3897
LB_3896:
	bts r12,7
	stc
LB_3897:
	mov r10,rdx
	bt r12,7
	jc LB_3894
	btr r12,4
	jmp LB_3895
LB_3894:
	bts r12,4
LB_3895:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_3900
	btr r12,7
	clc
	jmp LB_3901
LB_3900:
	bts r12,7
	stc
LB_3901:
	mov r11,rdx
	bt r12,7
	jc LB_3898
	btr r12,5
	jmp LB_3899
LB_3898:
	bts r12,5
LB_3899:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3902:
	cmp r15,0
	jz LB_3903
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3902
LB_3903:
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
LB_3904:
	cmp rax,0
	jz LB_3905
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3904
LB_3905:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_3109 %_3110 }
 ; {>  %_3108~5':(_opn)◂(_p1544) %_3105~2':(_opn)◂(_stg) %_3110~1':_stg %_3107~4':_p1547 %_3109~0':_r64 %_3106~3':_p1546 }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_3906
	mov rdi,r11
	call dlt
LB_3906:
	bt r12,2
	jc LB_3907
	mov rdi,r8
	call dlt
LB_3907:
	bt r12,4
	jc LB_3908
	mov rdi,r10
	call dlt
LB_3908:
	bt r12,3
	jc LB_3909
	mov rdi,r9
	call dlt
LB_3909:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3882:
NS_E_3092:
; 	|» { 0' 1' }
NS_E_RDI_3092:
MTC_LB_3910:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3911
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
	jnc LB_3912
	bt QWORD [rdi],0
	jc LB_3913
	btr r12,3
	clc
	jmp LB_3914
LB_3913:
	bts r12,3
	stc
LB_3914:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3912:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3915
	btr r12,2
	jmp LB_3916
LB_3915:
	bts r12,2
LB_3916:
LB_3917:
	cmp r15,0
	jz LB_3918
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3917
LB_3918:
; _f3111 { %_3084 %_3086 } ⊢ { %_3087 %_3088 } : { %_3087 %_3088 }
 ; {>  %_3086~2':_p1544 %_3084~0':_r64 }
; _f3111 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3919
	btr r12,1
	jmp LB_3920
LB_3919:
	bts r12,1
LB_3920:
	call NS_E_3111
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3087 %_3088 }
 ; {>  %_3088~1':_stg %_3087~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3911:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3921
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
	jnc LB_3922
	bt QWORD [rdi],0
	jc LB_3923
	btr r12,3
	clc
	jmp LB_3924
LB_3923:
	bts r12,3
	stc
LB_3924:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3922:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3925
	btr r12,2
	jmp LB_3926
LB_3925:
	bts r12,2
LB_3926:
LB_3927:
	cmp r15,0
	jz LB_3928
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3927
LB_3928:
; _f3146 { %_3084 %_3089 } ⊢ { %_3090 %_3091 } : { %_3090 %_3091 }
 ; {>  %_3089~2':_p1545 %_3084~0':_r64 }
; _f3146 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3929
	btr r12,1
	jmp LB_3930
LB_3929:
	bts r12,1
LB_3930:
	call NS_E_3146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3090 %_3091 }
 ; {>  %_3090~0':_r64 %_3091~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3921:
NS_E_3083:
; 	|» { 0' 1' }
NS_E_RDI_3083:
MTC_LB_3931:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3932
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
	jnc LB_3933
	bt QWORD [rdi],0
	jc LB_3934
	btr r12,5
	clc
	jmp LB_3935
LB_3934:
	bts r12,5
	stc
LB_3935:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3933:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3944
	btr r12,6
	clc
	jmp LB_3945
LB_3944:
	bts r12,6
	stc
LB_3945:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3938
	btr r12,4
	clc
	jmp LB_3939
LB_3938:
	bts r12,4
	stc
LB_3939:
	mov r8,r10
	bt r12,4
	jc LB_3936
	btr r12,2
	jmp LB_3937
LB_3936:
	bts r12,2
LB_3937:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3942
	btr r12,4
	clc
	jmp LB_3943
LB_3942:
	bts r12,4
	stc
LB_3943:
	mov r9,r10
	bt r12,4
	jc LB_3940
	btr r12,3
	jmp LB_3941
LB_3940:
	bts r12,3
LB_3941:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3948
	btr r12,6
	clc
	jmp LB_3949
LB_3948:
	bts r12,6
	stc
LB_3949:
	mov r10,rcx
	bt r12,6
	jc LB_3946
	btr r12,4
	jmp LB_3947
LB_3946:
	bts r12,4
LB_3947:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3950:
	cmp r15,0
	jz LB_3951
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3950
LB_3951:
; _f56 %_3066 ⊢ %_3071 : %_3071
 ; {>  %_3069~3':_p1543 %_3068~2':_stg %_3066~0':_r64 %_3070~4':(_lst)◂({ _stg _p1543 }) }
	add r13,1
; _f3092 { %_3071 %_3069 } ⊢ { %_3072 %_3073 } : { %_3072 %_3073 }
 ; {>  %_3071~0':_r64 %_3069~3':_p1543 %_3068~2':_stg %_3070~4':(_lst)◂({ _stg _p1543 }) }
; _f3092 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3956
	btr r12,1
	jmp LB_3957
LB_3956:
	bts r12,1
LB_3957:
	call NS_E_3092
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3954
	btr r12,4
	clc
	jmp LB_3955
LB_3954:
	bts r12,4
	stc
LB_3955:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3952
	btr r12,2
	clc
	jmp LB_3953
LB_3952:
	bts r12,2
	stc
LB_3953:
	add rsp,24
; _f55 %_3072 ⊢ %_3074 : %_3074
 ; {>  %_3072~0':_r64 %_3073~1':_stg %_3068~2':_stg %_3070~4':(_lst)◂({ _stg _p1543 }) }
	sub r13,1
; _f3083 { %_3074 %_3070 } ⊢ { %_3075 %_3076 } : { %_3075 %_3076 }
 ; {>  %_3073~1':_stg %_3068~2':_stg %_3074~0':_r64 %_3070~4':(_lst)◂({ _stg _p1543 }) }
; _f3083 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3962
	btr r12,1
	jmp LB_3963
LB_3962:
	bts r12,1
LB_3963:
	call NS_E_3083
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3964
	btr r12,3
	jmp LB_3965
LB_3964:
	bts r12,3
LB_3965:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3960
	btr r12,2
	clc
	jmp LB_3961
LB_3960:
	bts r12,2
	stc
LB_3961:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3958
	btr r12,1
	clc
	jmp LB_3959
LB_3958:
	bts r12,1
	stc
LB_3959:
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
LB_3966:
	cmp rax,0
	jz LB_3967
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3966
LB_3967:
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
; ∎ { %_3077 %_3081 }
 ; {>  %_3080~3':_stg %_3077~0':_r64 %_3081~4':_stg %_3079~1':_stg %_3078~2':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_3968
	mov rdi,r9
	call dlt
LB_3968:
	bt r12,1
	jc LB_3969
	mov rdi,r14
	call dlt
LB_3969:
	bt r12,2
	jc LB_3970
	mov rdi,r8
	call dlt
LB_3970:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3971
	btr r12,1
	jmp LB_3972
LB_3971:
	bts r12,1
LB_3972:
	ret
MTC_LB_3932:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3973
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
	jnc LB_3974
	bt QWORD [rdi],0
	jc LB_3975
	btr r12,2
	clc
	jmp LB_3976
LB_3975:
	bts r12,2
	stc
LB_3976:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3974:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3977:
	cmp r15,0
	jz LB_3978
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3977
LB_3978:
; 	» "" _ ⊢ 1' : %_3082
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3066 %_3082 }
 ; {>  %_3082~1':_stg %_3066~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3973:
NS_E_3065:
; 	|» { 0' 1' }
NS_E_RDI_3065:
MTC_LB_3979:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3980
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
	jnc LB_3981
	bt QWORD [rdi],0
	jc LB_3982
	btr r12,5
	clc
	jmp LB_3983
LB_3982:
	bts r12,5
	stc
LB_3983:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3981:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3992
	btr r12,6
	clc
	jmp LB_3993
LB_3992:
	bts r12,6
	stc
LB_3993:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3986
	btr r12,4
	clc
	jmp LB_3987
LB_3986:
	bts r12,4
	stc
LB_3987:
	mov r8,r10
	bt r12,4
	jc LB_3984
	btr r12,2
	jmp LB_3985
LB_3984:
	bts r12,2
LB_3985:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3990
	btr r12,4
	clc
	jmp LB_3991
LB_3990:
	bts r12,4
	stc
LB_3991:
	mov r9,r10
	bt r12,4
	jc LB_3988
	btr r12,3
	jmp LB_3989
LB_3988:
	bts r12,3
LB_3989:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3996
	btr r12,6
	clc
	jmp LB_3997
LB_3996:
	bts r12,6
	stc
LB_3997:
	mov r10,rcx
	bt r12,6
	jc LB_3994
	btr r12,4
	jmp LB_3995
LB_3994:
	bts r12,4
LB_3995:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3998:
	cmp r15,0
	jz LB_3999
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3998
LB_3999:
; _f38 %_3041 ⊢ %_3046 : %_3046
 ; {>  %_3045~4':(_lst)◂({ _stg _p1542 }) %_3043~2':_stg %_3044~3':_p1542 %_3041~0':_r64 }
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
	jc LB_4004
	btr r12,4
	clc
	jmp LB_4005
LB_4004:
	bts r12,4
	stc
LB_4005:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4002
	btr r12,3
	clc
	jmp LB_4003
LB_4002:
	bts r12,3
	stc
LB_4003:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4000
	btr r12,2
	clc
	jmp LB_4001
LB_4000:
	bts r12,2
	stc
LB_4001:
	add rsp,32
; _f3065 { %_3046 %_3045 } ⊢ { %_3047 %_3048 } : { %_3047 %_3048 }
 ; {>  %_3045~4':(_lst)◂({ _stg _p1542 }) %_3043~2':_stg %_3046~0':_r64 %_3044~3':_p1542 }
; _f3065 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4010
	btr r12,1
	jmp LB_4011
LB_4010:
	bts r12,1
LB_4011:
	call NS_E_3065
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4008
	btr r12,3
	clc
	jmp LB_4009
LB_4008:
	bts r12,3
	stc
LB_4009:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4006
	btr r12,2
	clc
	jmp LB_4007
LB_4006:
	bts r12,2
	stc
LB_4007:
	add rsp,24
MTC_LB_4012:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4013
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
	jnc LB_4014
	bt QWORD [rdi],0
	jc LB_4015
	btr r12,5
	clc
	jmp LB_4016
LB_4015:
	bts r12,5
	stc
LB_4016:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4014:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_4017
	btr r12,4
	jmp LB_4018
LB_4017:
	bts r12,4
LB_4018:
LB_4019:
	cmp r15,0
	jz LB_4020
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4019
LB_4020:
; _f56 %_3047 ⊢ %_3050 : %_3050
 ; {>  %_3043~2':_stg %_3049~4':(_lst)◂({ _stg _p1551 }) %_3048~1':_stg %_3047~0':_r64 }
	add r13,1
; _f3197 { %_3050 %_3049 } ⊢ { %_3051 %_3052 } : { %_3051 %_3052 }
 ; {>  %_3043~2':_stg %_3050~0':_r64 %_3049~4':(_lst)◂({ _stg _p1551 }) %_3048~1':_stg }
; _f3197 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4025
	btr r12,1
	jmp LB_4026
LB_4025:
	bts r12,1
LB_4026:
	call NS_E_3197
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4027
	btr r12,3
	jmp LB_4028
LB_4027:
	bts r12,3
LB_4028:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4023
	btr r12,2
	clc
	jmp LB_4024
LB_4023:
	bts r12,2
	stc
LB_4024:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4021
	btr r12,1
	clc
	jmp LB_4022
LB_4021:
	bts r12,1
	stc
LB_4022:
	add rsp,24
; _f55 %_3051 ⊢ %_3053 : %_3053
 ; {>  %_3051~0':_r64 %_3043~2':_stg %_3052~3':_stg %_3048~1':_stg }
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
LB_4029:
	cmp rax,0
	jz LB_4030
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4029
LB_4030:
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
; ∎ { %_3054 %_3058 }
 ; {>  %_3057~1':_stg %_3058~4':_stg %_3055~2':_stg %_3054~0':_r64 %_3056~3':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_4031
	mov rdi,r14
	call dlt
LB_4031:
	bt r12,2
	jc LB_4032
	mov rdi,r8
	call dlt
LB_4032:
	bt r12,3
	jc LB_4033
	mov rdi,r9
	call dlt
LB_4033:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4034
	btr r12,1
	jmp LB_4035
LB_4034:
	bts r12,1
LB_4035:
	ret
MTC_LB_4013:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4036
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
	jnc LB_4037
	bt QWORD [rdi],0
	jc LB_4038
	btr r12,5
	clc
	jmp LB_4039
LB_4038:
	bts r12,5
	stc
LB_4039:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4037:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_4040
	btr r12,4
	jmp LB_4041
LB_4040:
	bts r12,4
LB_4041:
LB_4042:
	cmp r15,0
	jz LB_4043
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4042
LB_4043:
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
LB_4044:
	cmp rax,0
	jz LB_4045
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4044
LB_4045:
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
; ∎ { %_3060 %_3063 }
 ; {>  %_3060~0':_r64 %_3061~2':_stg %_3059~4':_p1551 %_3062~1':_stg %_3063~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4046
	mov rdi,r8
	call dlt
LB_4046:
	bt r12,4
	jc LB_4047
	mov rdi,r10
	call dlt
LB_4047:
	bt r12,1
	jc LB_4048
	mov rdi,r14
	call dlt
LB_4048:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4049
	btr r12,1
	jmp LB_4050
LB_4049:
	bts r12,1
LB_4050:
	ret
MTC_LB_4036:
MTC_LB_3980:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4051
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
	jnc LB_4052
	bt QWORD [rdi],0
	jc LB_4053
	btr r12,2
	clc
	jmp LB_4054
LB_4053:
	bts r12,2
	stc
LB_4054:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4052:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4055:
	cmp r15,0
	jz LB_4056
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4055
LB_4056:
; 	» "" _ ⊢ 1' : %_3064
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3041 %_3064 }
 ; {>  %_3064~1':_stg %_3041~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4051:
NS_E_3040:
; 	|» { 0' 1' }
NS_E_RDI_3040:
MTC_LB_4057:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4058
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
	jnc LB_4059
	bt QWORD [rdi],0
	jc LB_4060
	btr r12,4
	clc
	jmp LB_4061
LB_4060:
	bts r12,4
	stc
LB_4061:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4059:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4064
	btr r12,5
	clc
	jmp LB_4065
LB_4064:
	bts r12,5
	stc
LB_4065:
	mov r8,r11
	bt r12,5
	jc LB_4062
	btr r12,2
	jmp LB_4063
LB_4062:
	bts r12,2
LB_4063:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4068
	btr r12,5
	clc
	jmp LB_4069
LB_4068:
	bts r12,5
	stc
LB_4069:
	mov r9,r11
	bt r12,5
	jc LB_4066
	btr r12,3
	jmp LB_4067
LB_4066:
	bts r12,3
LB_4067:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4070:
	cmp r15,0
	jz LB_4071
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4070
LB_4071:
MTC_LB_4072:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4073
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
	jnc LB_4074
	bt QWORD [rdi],0
	jc LB_4075
	btr r12,4
	clc
	jmp LB_4076
LB_4075:
	bts r12,4
	stc
LB_4076:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4074:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4077
	btr r12,1
	jmp LB_4078
LB_4077:
	bts r12,1
LB_4078:
LB_4079:
	cmp r15,0
	jz LB_4080
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4079
LB_4080:
; _f56 %_2972 ⊢ %_2977 : %_2977
 ; {>  %_2974~2':_stg %_2976~1':(_lst)◂(_p1539) %_2972~0':_r64 }
	add r13,1
; _f2971 { %_2977 %_2976 } ⊢ { %_2978 %_2979 } : { %_2978 %_2979 }
 ; {>  %_2977~0':_r64 %_2974~2':_stg %_2976~1':(_lst)◂(_p1539) }
; _f2971 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2971
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4081
	btr r12,2
	clc
	jmp LB_4082
LB_4081:
	bts r12,2
	stc
LB_4082:
	add rsp,16
; _f55 %_2978 ⊢ %_2980 : %_2980
 ; {>  %_2978~0':_r64 %_2974~2':_stg %_2979~1':_stg }
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
LB_4083:
	cmp rax,0
	jz LB_4084
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4083
LB_4084:
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
LB_4085:
	cmp rax,0
	jz LB_4086
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4085
LB_4086:
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
; ∎ { %_2981 %_2984 }
 ; {>  %_2981~0':_r64 %_2984~3':_stg %_2983~1':_stg %_2982~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4087
	mov rdi,r14
	call dlt
LB_4087:
	bt r12,2
	jc LB_4088
	mov rdi,r8
	call dlt
LB_4088:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4089
	btr r12,1
	jmp LB_4090
LB_4089:
	bts r12,1
LB_4090:
	ret
MTC_LB_4073:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4091
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
	jnc LB_4092
	bt QWORD [rdi],0
	jc LB_4093
	btr r12,4
	clc
	jmp LB_4094
LB_4093:
	bts r12,4
	stc
LB_4094:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4092:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4095
	btr r12,1
	jmp LB_4096
LB_4095:
	bts r12,1
LB_4096:
LB_4097:
	cmp r15,0
	jz LB_4098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4097
LB_4098:
; _f1453 %_2985 ⊢ %_2986 : %_2986
 ; {>  %_2985~1':_p1442 %_2974~2':_stg %_2972~0':_r64 }
; _f1453 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4103
	btr r12,0
	jmp LB_4104
LB_4103:
	bts r12,0
LB_4104:
	call NS_E_1453
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4105
	btr r12,1
	jmp LB_4106
LB_4105:
	bts r12,1
LB_4106:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4101
	btr r12,2
	clc
	jmp LB_4102
LB_4101:
	bts r12,2
	stc
LB_4102:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4099
	btr r12,0
	clc
	jmp LB_4100
LB_4099:
	bts r12,0
	stc
LB_4100:
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
LB_4107:
	cmp rax,0
	jz LB_4108
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4107
LB_4108:
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
; ∎ { %_2987 %_2990 }
 ; {>  %_2990~3':_stg %_2988~2':_stg %_2987~0':_r64 %_2989~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4109
	mov rdi,r8
	call dlt
LB_4109:
	bt r12,1
	jc LB_4110
	mov rdi,r14
	call dlt
LB_4110:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4111
	btr r12,1
	jmp LB_4112
LB_4111:
	bts r12,1
LB_4112:
	ret
MTC_LB_4091:
MTC_LB_4058:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4113
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
	jnc LB_4114
	bt QWORD [rdi],0
	jc LB_4115
	btr r12,3
	clc
	jmp LB_4116
LB_4115:
	bts r12,3
	stc
LB_4116:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4114:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4117
	btr r12,2
	jmp LB_4118
LB_4117:
	bts r12,2
LB_4118:
LB_4119:
	cmp r15,0
	jz LB_4120
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4119
LB_4120:
; _f56 %_2972 ⊢ %_2992 : %_2992
 ; {>  %_2991~2':(_lst)◂({ _stg _p1543 }) %_2972~0':_r64 }
	add r13,1
; _f3083 { %_2992 %_2991 } ⊢ { %_2993 %_2994 } : { %_2993 %_2994 }
 ; {>  %_2992~0':_r64 %_2991~2':(_lst)◂({ _stg _p1543 }) }
; _f3083 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4121
	btr r12,1
	jmp LB_4122
LB_4121:
	bts r12,1
LB_4122:
	call NS_E_3083
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2993 ⊢ %_2995 : %_2995
 ; {>  %_2993~0':_r64 %_2994~1':_stg }
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
LB_4123:
	cmp rax,0
	jz LB_4124
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4123
LB_4124:
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
; ∎ { %_2996 %_2998 }
 ; {>  %_2998~2':_stg %_2997~1':_stg %_2996~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4125
	mov rdi,r14
	call dlt
LB_4125:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4126
	btr r12,1
	jmp LB_4127
LB_4126:
	bts r12,1
LB_4127:
	ret
MTC_LB_4113:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_4128
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
	jnc LB_4129
	bt QWORD [rdi],0
	jc LB_4130
	btr r12,4
	clc
	jmp LB_4131
LB_4130:
	bts r12,4
	stc
LB_4131:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4129:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4134
	btr r12,5
	clc
	jmp LB_4135
LB_4134:
	bts r12,5
	stc
LB_4135:
	mov r8,r11
	bt r12,5
	jc LB_4132
	btr r12,2
	jmp LB_4133
LB_4132:
	bts r12,2
LB_4133:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4138
	btr r12,5
	clc
	jmp LB_4139
LB_4138:
	bts r12,5
	stc
LB_4139:
	mov r9,r11
	bt r12,5
	jc LB_4136
	btr r12,3
	jmp LB_4137
LB_4136:
	bts r12,3
LB_4137:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4140:
	cmp r15,0
	jz LB_4141
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4140
LB_4141:
; _f56 %_2972 ⊢ %_3001 : %_3001
 ; {>  %_3000~3':_p1541 %_2999~2':_stg %_2972~0':_r64 }
	add r13,1
; _f3256 { %_3001 %_3000 } ⊢ { %_3002 %_3003 } : { %_3002 %_3003 }
 ; {>  %_3000~3':_p1541 %_2999~2':_stg %_3001~0':_r64 }
; _f3256 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4144
	btr r12,1
	jmp LB_4145
LB_4144:
	bts r12,1
LB_4145:
	call NS_E_3256
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4142
	btr r12,2
	clc
	jmp LB_4143
LB_4142:
	bts r12,2
	stc
LB_4143:
	add rsp,16
; _f55 %_3002 ⊢ %_3004 : %_3004
 ; {>  %_2999~2':_stg %_3002~0':_r64 %_3003~1':_stg }
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
LB_4146:
	cmp rax,0
	jz LB_4147
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4146
LB_4147:
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
; ∎ { %_3005 %_3008 }
 ; {>  %_3008~3':_stg %_3007~1':_stg %_3005~0':_r64 %_3006~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4148
	mov rdi,r14
	call dlt
LB_4148:
	bt r12,2
	jc LB_4149
	mov rdi,r8
	call dlt
LB_4149:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4150
	btr r12,1
	jmp LB_4151
LB_4150:
	bts r12,1
LB_4151:
	ret
MTC_LB_4128:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_4152
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
	jnc LB_4153
	bt QWORD [rdi],0
	jc LB_4154
	btr r12,3
	clc
	jmp LB_4155
LB_4154:
	bts r12,3
	stc
LB_4155:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4153:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4156
	btr r12,2
	jmp LB_4157
LB_4156:
	bts r12,2
LB_4157:
LB_4158:
	cmp r15,0
	jz LB_4159
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4158
LB_4159:
; _f56 %_2972 ⊢ %_3010 : %_3010
 ; {>  %_3009~2':(_lst)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) %_2972~0':_r64 }
	add r13,1
; _f3277 { %_3010 %_3009 } ⊢ { %_3011 %_3012 } : { %_3011 %_3012 }
 ; {>  %_3009~2':(_lst)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) %_3010~0':_r64 }
; _f3277 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4160
	btr r12,1
	jmp LB_4161
LB_4160:
	bts r12,1
LB_4161:
	call NS_E_3277
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3011 ⊢ %_3013 : %_3013
 ; {>  %_3012~1':_stg %_3011~0':_r64 }
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
LB_4162:
	cmp rax,0
	jz LB_4163
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4162
LB_4163:
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
; ∎ { %_3014 %_3016 }
 ; {>  %_3016~2':_stg %_3015~1':_stg %_3014~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4164
	mov rdi,r14
	call dlt
LB_4164:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4165
	btr r12,1
	jmp LB_4166
LB_4165:
	bts r12,1
LB_4166:
	ret
MTC_LB_4152:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_4167
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
	jnc LB_4168
	bt QWORD [rdi],0
	jc LB_4169
	btr r12,4
	clc
	jmp LB_4170
LB_4169:
	bts r12,4
	stc
LB_4170:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4168:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4173
	btr r12,5
	clc
	jmp LB_4174
LB_4173:
	bts r12,5
	stc
LB_4174:
	mov r8,r11
	bt r12,5
	jc LB_4171
	btr r12,2
	jmp LB_4172
LB_4171:
	bts r12,2
LB_4172:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4177
	btr r12,5
	clc
	jmp LB_4178
LB_4177:
	bts r12,5
	stc
LB_4178:
	mov r9,r11
	bt r12,5
	jc LB_4175
	btr r12,3
	jmp LB_4176
LB_4175:
	bts r12,3
LB_4176:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4179:
	cmp r15,0
	jz LB_4180
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4179
LB_4180:
MTC_LB_4181:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4182
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
	jnc LB_4183
	bt QWORD [rdi],0
	jc LB_4184
	btr r12,4
	clc
	jmp LB_4185
LB_4184:
	bts r12,4
	stc
LB_4185:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4183:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4186
	btr r12,1
	jmp LB_4187
LB_4186:
	bts r12,1
LB_4187:
LB_4188:
	cmp r15,0
	jz LB_4189
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4188
LB_4189:
; _f56 %_2972 ⊢ %_3020 : %_3020
 ; {>  %_3019~1':(_lst)◂({ _stg _p1551 }) %_3017~2':_stg %_2972~0':_r64 }
	add r13,1
; _f3197 { %_3020 %_3019 } ⊢ { %_3021 %_3022 } : { %_3021 %_3022 }
 ; {>  %_3019~1':(_lst)◂({ _stg _p1551 }) %_3020~0':_r64 %_3017~2':_stg }
; _f3197 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3197
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4190
	btr r12,2
	clc
	jmp LB_4191
LB_4190:
	bts r12,2
	stc
LB_4191:
	add rsp,16
; _f55 %_3021 ⊢ %_3023 : %_3023
 ; {>  %_3021~0':_r64 %_3022~1':_stg %_3017~2':_stg }
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
LB_4192:
	cmp rax,0
	jz LB_4193
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4192
LB_4193:
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
; ∎ { %_3024 %_3027 }
 ; {>  %_3026~1':_stg %_3024~0':_r64 %_3025~2':_stg %_3027~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4194
	mov rdi,r14
	call dlt
LB_4194:
	bt r12,2
	jc LB_4195
	mov rdi,r8
	call dlt
LB_4195:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4196
	btr r12,1
	jmp LB_4197
LB_4196:
	bts r12,1
LB_4197:
	ret
MTC_LB_4182:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4198
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
	jnc LB_4199
	bt QWORD [rdi],0
	jc LB_4200
	btr r12,4
	clc
	jmp LB_4201
LB_4200:
	bts r12,4
	stc
LB_4201:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4199:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4202
	btr r12,1
	jmp LB_4203
LB_4202:
	bts r12,1
LB_4203:
LB_4204:
	cmp r15,0
	jz LB_4205
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4204
LB_4205:
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
LB_4206:
	cmp rax,0
	jz LB_4207
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4206
LB_4207:
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
; ∎ { %_3029 %_3031 }
 ; {>  %_3031~3':_stg %_3029~0':_r64 %_3028~1':_p1551 %_3030~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4208
	mov rdi,r14
	call dlt
LB_4208:
	bt r12,2
	jc LB_4209
	mov rdi,r8
	call dlt
LB_4209:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4210
	btr r12,1
	jmp LB_4211
LB_4210:
	bts r12,1
LB_4211:
	ret
MTC_LB_4198:
MTC_LB_4167:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_4212
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
	jnc LB_4213
	bt QWORD [rdi],0
	jc LB_4214
	btr r12,3
	clc
	jmp LB_4215
LB_4214:
	bts r12,3
	stc
LB_4215:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4213:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4216
	btr r12,2
	jmp LB_4217
LB_4216:
	bts r12,2
LB_4217:
LB_4218:
	cmp r15,0
	jz LB_4219
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4218
LB_4219:
; _f56 %_2972 ⊢ %_3033 : %_3033
 ; {>  %_3032~2':(_lst)◂({ _stg _p1542 }) %_2972~0':_r64 }
	add r13,1
; _f3065 { %_3033 %_3032 } ⊢ { %_3034 %_3035 } : { %_3034 %_3035 }
 ; {>  %_3033~0':_r64 %_3032~2':(_lst)◂({ _stg _p1542 }) }
; _f3065 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4220
	btr r12,1
	jmp LB_4221
LB_4220:
	bts r12,1
LB_4221:
	call NS_E_3065
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3034 ⊢ %_3036 : %_3036
 ; {>  %_3035~1':_stg %_3034~0':_r64 }
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
LB_4222:
	cmp rax,0
	jz LB_4223
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4222
LB_4223:
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
; ∎ { %_3037 %_3039 }
 ; {>  %_3037~0':_r64 %_3039~2':_stg %_3038~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4224
	mov rdi,r14
	call dlt
LB_4224:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4225
	btr r12,1
	jmp LB_4226
LB_4225:
	bts r12,1
LB_4226:
	ret
MTC_LB_4212:
NS_E_2971:
; 	|» { 0' 1' }
NS_E_RDI_2971:
MTC_LB_4227:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4228
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
	jnc LB_4229
	bt QWORD [rdi],0
	jc LB_4230
	btr r12,2
	clc
	jmp LB_4231
LB_4230:
	bts r12,2
	stc
LB_4231:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4229:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4232:
	cmp r15,0
	jz LB_4233
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4232
LB_4233:
; 	» "" _ ⊢ 1' : %_2961
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2959 %_2961 }
 ; {>  %_2961~1':_stg %_2959~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4228:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4234
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
	jnc LB_4235
	bt QWORD [rdi],0
	jc LB_4236
	btr r12,4
	clc
	jmp LB_4237
LB_4236:
	bts r12,4
	stc
LB_4237:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4235:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4240
	btr r12,5
	clc
	jmp LB_4241
LB_4240:
	bts r12,5
	stc
LB_4241:
	mov r8,r11
	bt r12,5
	jc LB_4238
	btr r12,2
	jmp LB_4239
LB_4238:
	bts r12,2
LB_4239:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4244
	btr r12,5
	clc
	jmp LB_4245
LB_4244:
	bts r12,5
	stc
LB_4245:
	mov r9,r11
	bt r12,5
	jc LB_4242
	btr r12,3
	jmp LB_4243
LB_4242:
	bts r12,3
LB_4243:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4246:
	cmp r15,0
	jz LB_4247
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4246
LB_4247:
; _f3040 { %_2959 %_2962 } ⊢ { %_2964 %_2965 } : { %_2964 %_2965 }
 ; {>  %_2962~2':_p1539 %_2963~3':(_lst)◂(_p1539) %_2959~0':_r64 }
; _f3040 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4250
	btr r12,1
	jmp LB_4251
LB_4250:
	bts r12,1
LB_4251:
	call NS_E_3040
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_4248
	btr r12,3
	clc
	jmp LB_4249
LB_4248:
	bts r12,3
	stc
LB_4249:
	add rsp,16
; _f2971 { %_2964 %_2963 } ⊢ { %_2966 %_2967 } : { %_2966 %_2967 }
 ; {>  %_2963~3':(_lst)◂(_p1539) %_2964~0':_r64 %_2965~1':_stg }
; _f2971 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4254
	btr r12,1
	jmp LB_4255
LB_4254:
	bts r12,1
LB_4255:
	call NS_E_2971
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4256
	btr r12,2
	jmp LB_4257
LB_4256:
	bts r12,2
LB_4257:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4252
	btr r12,1
	clc
	jmp LB_4253
LB_4252:
	bts r12,1
	stc
LB_4253:
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
; ∎ { %_2966 %_2970 }
 ; {>  %_2969~2':_stg %_2966~0':_r64 %_2970~3':_stg %_2968~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4258
	mov rdi,r8
	call dlt
LB_4258:
	bt r12,1
	jc LB_4259
	mov rdi,r14
	call dlt
LB_4259:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4260
	btr r12,1
	jmp LB_4261
LB_4260:
	bts r12,1
LB_4261:
	ret
MTC_LB_4234:
NS_E_4265:
NS_E_RDI_4265:
NS_E_4265_ETR_TBL:
NS_E_4265_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4369
	jmp LB_4370
LB_4369:
	jmp LB_4361
LB_4370:
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
	jc LB_4362
	btr r12,0
	clc
	jmp LB_4363
LB_4362:
	bts r12,0
	stc
LB_4363:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4358
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xr1 |~ {  } ⊢ %_4269 : %_4269
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_4269
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_4269 ⊢ %_4270 : %_4270
 ; {>  %_4269~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4270
 ; {>  %_4270~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4356
	btr r12,3
	jmp LB_4357
LB_4356:
	bts r12,3
LB_4357:
	mov r8,0
	bts r12,2
	ret
LB_4358:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4360
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4359
LB_4360:
	add rsp,8
	ret
LB_4361:
	add rsp,16
	pop r14
LB_4359:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4385
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4377
LB_4385:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_4265_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4390
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4391
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4391:
	jmp LB_4377
LB_4390:
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
	jc LB_4380
	btr r12,1
	clc
	jmp LB_4381
LB_4380:
	bts r12,1
	stc
LB_4381:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4378
	btr r12,0
	clc
	jmp LB_4379
LB_4378:
	bts r12,0
	stc
LB_4379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4374
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_4272 ⊢ %_4273 : %_4273
 ; {>  %_4272~1':_r64 %_4271~0':_r64 }
	add r14,1
; _some %_4273 ⊢ %_4274 : %_4274
 ; {>  %_4271~0':_r64 %_4273~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_4274
 ; {>  %_4271~0':_r64 %_4274~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_4371
	mov rdi,r13
	call dlt
LB_4371:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_4372
	btr r12,3
	jmp LB_4373
LB_4372:
	bts r12,3
LB_4373:
	mov r8,0
	bts r12,2
	ret
LB_4374:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4376
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4375
LB_4376:
	add rsp,8
	ret
LB_4377:
	add rsp,32
	pop r14
LB_4375:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4266:
NS_E_RDI_4266:
NS_E_4266_ETR_TBL:
NS_E_4266_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_4408
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_4408
	jmp LB_4409
LB_4408:
	jmp LB_4398
LB_4409:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4413
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4414
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4414:
	jmp LB_4398
LB_4413:
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
	jc LB_4401
	btr r12,1
	clc
	jmp LB_4402
LB_4401:
	bts r12,1
	stc
LB_4402:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4399
	btr r12,0
	clc
	jmp LB_4400
LB_4399:
	bts r12,0
	stc
LB_4400:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4395
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_4416
	btr r12,5
	jmp LB_4417
LB_4416:
	bts r12,5
LB_4417:
	mov r13,r14
	bt r12,1
	jc LB_4418
	btr r12,0
	jmp LB_4419
LB_4418:
	bts r12,0
LB_4419:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_4275 ⊢ %_4276 : %_4276
 ; {>  %_4275~0':_r64 }
	add r13,1
; _some %_4276 ⊢ %_4277 : %_4277
 ; {>  %_4276~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4277
 ; {>  %_4277~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4393
	btr r12,3
	jmp LB_4394
LB_4393:
	bts r12,3
LB_4394:
	mov r8,0
	bts r12,2
	ret
LB_4395:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4397
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4396
LB_4397:
	add rsp,8
	ret
LB_4398:
	add rsp,32
	pop r14
LB_4396:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_4435
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_4435
	jmp LB_4436
LB_4435:
	jmp LB_4425
LB_4436:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4440
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4441
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4441:
	jmp LB_4425
LB_4440:
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
	jc LB_4428
	btr r12,1
	clc
	jmp LB_4429
LB_4428:
	bts r12,1
	stc
LB_4429:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4426
	btr r12,0
	clc
	jmp LB_4427
LB_4426:
	bts r12,0
	stc
LB_4427:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4422
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_4443
	btr r12,5
	jmp LB_4444
LB_4443:
	bts r12,5
LB_4444:
	mov r13,r14
	bt r12,1
	jc LB_4445
	btr r12,0
	jmp LB_4446
LB_4445:
	bts r12,0
LB_4446:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f56 %_4278 ⊢ %_4279 : %_4279
 ; {>  %_4278~0':_r64 }
	add r13,1
; _some %_4279 ⊢ %_4280 : %_4280
 ; {>  %_4279~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4280
 ; {>  %_4280~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4420
	btr r12,3
	jmp LB_4421
LB_4420:
	bts r12,3
LB_4421:
	mov r8,0
	bts r12,2
	ret
LB_4422:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4424
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4423
LB_4424:
	add rsp,8
	ret
LB_4425:
	add rsp,32
	pop r14
LB_4423:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4449
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_4281 : %_4281
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_4281
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_4281 ⊢ %_4282 : %_4282
 ; {>  %_4281~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4282
 ; {>  %_4282~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4447
	btr r12,3
	jmp LB_4448
LB_4447:
	bts r12,3
LB_4448:
	mov r8,0
	bts r12,2
	ret
LB_4449:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4451
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4450
LB_4451:
	add rsp,8
	ret
LB_4452:
	add rsp,0
	pop r14
LB_4450:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4267:
NS_E_RDI_4267:
NS_E_4267_ETR_TBL:
NS_E_4267_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4532
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4479
LB_4532:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_4540
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4540
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4540
	jmp LB_4541
LB_4540:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4538
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4538:
	jmp LB_4479
LB_4541:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4496
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4497
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4497:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4498
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4498:
	jmp LB_4480
LB_4496:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4508
	jmp LB_4509
LB_4508:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4504
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4504:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4505
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4505:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4506
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4506:
	jmp LB_4480
LB_4509:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_4268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4513
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4514
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4514:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4515
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4515:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4516
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4516:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4517
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4517:
	jmp LB_4480
LB_4513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_4267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4522
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_4523
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_4523:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4524
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4524:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4525
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4525:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4526
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4526:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4527
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4527:
	jmp LB_4480
LB_4522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_4491
	btr r12,5
	clc
	jmp LB_4492
LB_4491:
	bts r12,5
	stc
LB_4492:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4489
	btr r12,4
	clc
	jmp LB_4490
LB_4489:
	bts r12,4
	stc
LB_4490:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4487
	btr r12,3
	clc
	jmp LB_4488
LB_4487:
	bts r12,3
	stc
LB_4488:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4485
	btr r12,2
	clc
	jmp LB_4486
LB_4485:
	bts r12,2
	stc
LB_4486:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4483
	btr r12,1
	clc
	jmp LB_4484
LB_4483:
	bts r12,1
	stc
LB_4484:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4481
	btr r12,0
	clc
	jmp LB_4482
LB_4481:
	bts r12,0
	stc
LB_4482:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_4476
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_4542
	btr r12,6
	jmp LB_4543
LB_4542:
	bts r12,6
LB_4543:
	mov r8,r10
	bt r12,4
	jc LB_4544
	btr r12,2
	jmp LB_4545
LB_4544:
	bts r12,2
LB_4545:
	mov rdx,r14
	bt r12,1
	jc LB_4546
	btr r12,7
	jmp LB_4547
LB_4546:
	bts r12,7
LB_4547:
	mov r14,rcx
	bt r12,6
	jc LB_4548
	btr r12,1
	jmp LB_4549
LB_4548:
	bts r12,1
LB_4549:
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
	jc LB_4552
	btr r12,6
	clc
	jmp LB_4553
LB_4552:
	bts r12,6
	stc
LB_4553:
	mov r9,rcx
	bt r12,6
	jc LB_4550
	btr r12,3
	jmp LB_4551
LB_4550:
	bts r12,3
LB_4551:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4556
	btr r12,6
	clc
	jmp LB_4557
LB_4556:
	bts r12,6
	stc
LB_4557:
	mov r10,rcx
	bt r12,6
	jc LB_4554
	btr r12,4
	jmp LB_4555
LB_4554:
	bts r12,4
LB_4555:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_4288 : %_4288
 ; {>  %_4285~2':_r64 %_4284~1':_r64 %_4287~4':(_lst)◂(_p4262) %_4286~3':_r64 %_4283~0':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_4288
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_4288 %_4283 } ⊢ { %_4289 %_4290 } : { %_4289 %_4290 }
 ; {>  %_4288~5':_r64 %_4285~2':_r64 %_4284~1':_r64 %_4287~4':(_lst)◂(_p4262) %_4286~3':_r64 %_4283~0':_r64 }
	add r11,r13
; _f51 { %_4289 %_4284 } ⊢ { %_4291 %_4292 } : { %_4291 %_4292 }
 ; {>  %_4285~2':_r64 %_4289~5':_r64 %_4290~0':_r64 %_4284~1':_r64 %_4287~4':(_lst)◂(_p4262) %_4286~3':_r64 }
	add r11,r14
; _f51 { %_4291 %_4285 } ⊢ { %_4293 %_4294 } : { %_4293 %_4294 }
 ; {>  %_4285~2':_r64 %_4291~5':_r64 %_4290~0':_r64 %_4287~4':(_lst)◂(_p4262) %_4286~3':_r64 %_4292~1':_r64 }
	add r11,r8
; _f4263 %_4293 ⊢ %_4295 : %_4295
 ; {>  %_4293~5':_r64 %_4290~0':_r64 %_4287~4':(_lst)◂(_p4262) %_4286~3':_r64 %_4294~2':_r64 %_4292~1':_r64 }
; _f4263 5' ⊢ °0◂5'
; _cns { %_4295 %_4287 } ⊢ %_4296 : %_4296
 ; {>  %_4295~°0◂5':_p4262 %_4290~0':_r64 %_4287~4':(_lst)◂(_p4262) %_4286~3':_r64 %_4294~2':_r64 %_4292~1':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_4286 %_4296 } ⊢ %_4297 : %_4297
 ; {>  %_4290~0':_r64 %_4286~3':_r64 %_4294~2':_r64 %_4292~1':_r64 %_4296~°0◂{ °0◂5' 4' }:(_lst)◂(_p4262) }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_4297
 ; {>  %_4290~0':_r64 %_4297~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p4262) }) %_4294~2':_r64 %_4292~1':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,0
	jc LB_4453
	mov rdi,r13
	call dlt
LB_4453:
	bt r12,2
	jc LB_4454
	mov rdi,r8
	call dlt
LB_4454:
	bt r12,1
	jc LB_4455
	mov rdi,r14
	call dlt
LB_4455:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_4456
	btr r12,0
	jmp LB_4457
LB_4456:
	bts r12,0
LB_4457:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_4460
	btr r12,1
	jmp LB_4461
LB_4460:
	bts r12,1
LB_4461:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_4458
	btr QWORD [rdi],0
	jmp LB_4459
LB_4458:
	bts QWORD [rdi],0
LB_4459:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_4470
	btr r12,0
	jmp LB_4471
LB_4470:
	bts r12,0
LB_4471:
	mov rsi,1
	bt r12,0
	jc LB_4468
	mov rsi,0
	bt r13,0
	jc LB_4468
	jmp LB_4469
LB_4468:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_4469:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_4466
	btr QWORD [rdi],0
	jmp LB_4467
LB_4466:
	bts QWORD [rdi],0
LB_4467:
	mov r13,r10
	bt r12,4
	jc LB_4474
	btr r12,0
	jmp LB_4475
LB_4474:
	bts r12,0
LB_4475:
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_4472
	btr QWORD [rdi],1
	jmp LB_4473
LB_4472:
	bts QWORD [rdi],1
LB_4473:
	mov rsi,1
	bt r12,1
	jc LB_4464
	mov rsi,0
	bt r14,0
	jc LB_4464
	jmp LB_4465
LB_4464:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4465:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_4462
	btr QWORD [rdi],1
	jmp LB_4463
LB_4462:
	bts QWORD [rdi],1
LB_4463:
	mov r8,0
	bts r12,2
	ret
LB_4476:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4478
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4477
LB_4478:
	add rsp,8
	ret
LB_4480:
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
LB_4479:
	add rsp,96
	pop r14
LB_4477:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4611
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4583
LB_4611:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_4619
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_4619
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_4619
	jmp LB_4620
LB_4619:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4617
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4617:
	jmp LB_4583
LB_4620:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_4265_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4596
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4597
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4597:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4598
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4598:
	jmp LB_4584
LB_4596:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_4267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4603
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4604
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4604:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4605
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4605:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4606
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4606:
	jmp LB_4584
LB_4603:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4591
	btr r12,3
	clc
	jmp LB_4592
LB_4591:
	bts r12,3
	stc
LB_4592:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4589
	btr r12,2
	clc
	jmp LB_4590
LB_4589:
	bts r12,2
	stc
LB_4590:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4587
	btr r12,1
	clc
	jmp LB_4588
LB_4587:
	bts r12,1
	stc
LB_4588:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4585
	btr r12,0
	clc
	jmp LB_4586
LB_4585:
	bts r12,0
	stc
LB_4586:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_4580
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_4621
	btr r12,4
	jmp LB_4622
LB_4621:
	bts r12,4
LB_4622:
	mov r14,r8
	bt r12,2
	jc LB_4623
	btr r12,1
	jmp LB_4624
LB_4623:
	bts r12,1
LB_4624:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_4625
	btr r12,4
	jmp LB_4626
LB_4625:
	bts r12,4
LB_4626:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4629
	btr r12,5
	clc
	jmp LB_4630
LB_4629:
	bts r12,5
	stc
LB_4630:
	mov r8,r11
	bt r12,5
	jc LB_4627
	btr r12,2
	jmp LB_4628
LB_4627:
	bts r12,2
LB_4628:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4633
	btr r12,5
	clc
	jmp LB_4634
LB_4633:
	bts r12,5
	stc
LB_4634:
	mov r9,r11
	bt r12,5
	jc LB_4631
	btr r12,3
	jmp LB_4632
LB_4631:
	bts r12,3
LB_4632:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_4302 : %_4302
 ; {>  %_4300~2':_r64 %_4298~0':_r64 %_4301~3':(_lst)◂(_p4262) %_4299~1':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_4302
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_4302 %_4298 } ⊢ { %_4303 %_4304 } : { %_4303 %_4304 }
 ; {>  %_4300~2':_r64 %_4302~4':_r64 %_4298~0':_r64 %_4301~3':(_lst)◂(_p4262) %_4299~1':_r64 }
	add r10,r13
; _f51 { %_4303 %_4299 } ⊢ { %_4305 %_4306 } : { %_4305 %_4306 }
 ; {>  %_4300~2':_r64 %_4303~4':_r64 %_4304~0':_r64 %_4301~3':(_lst)◂(_p4262) %_4299~1':_r64 }
	add r10,r14
; _f4263 %_4305 ⊢ %_4307 : %_4307
 ; {>  %_4300~2':_r64 %_4306~1':_r64 %_4304~0':_r64 %_4305~4':_r64 %_4301~3':(_lst)◂(_p4262) }
; _f4263 4' ⊢ °0◂4'
; _cns { %_4307 %_4301 } ⊢ %_4308 : %_4308
 ; {>  %_4300~2':_r64 %_4306~1':_r64 %_4307~°0◂4':_p4262 %_4304~0':_r64 %_4301~3':(_lst)◂(_p4262) }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_4300 %_4308 } ⊢ %_4309 : %_4309
 ; {>  %_4300~2':_r64 %_4306~1':_r64 %_4308~°0◂{ °0◂4' 3' }:(_lst)◂(_p4262) %_4304~0':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_4309
 ; {>  %_4306~1':_r64 %_4309~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p4262) }) %_4304~0':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_4558
	mov rdi,r14
	call dlt
LB_4558:
	bt r12,0
	jc LB_4559
	mov rdi,r13
	call dlt
LB_4559:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_4560
	btr r12,0
	jmp LB_4561
LB_4560:
	bts r12,0
LB_4561:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_4564
	btr r12,1
	jmp LB_4565
LB_4564:
	bts r12,1
LB_4565:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_4562
	btr QWORD [rdi],0
	jmp LB_4563
LB_4562:
	bts QWORD [rdi],0
LB_4563:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_4574
	btr r12,2
	jmp LB_4575
LB_4574:
	bts r12,2
LB_4575:
	mov rsi,1
	bt r12,2
	jc LB_4572
	mov rsi,0
	bt r8,0
	jc LB_4572
	jmp LB_4573
LB_4572:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_4573:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4570
	btr QWORD [rdi],0
	jmp LB_4571
LB_4570:
	bts QWORD [rdi],0
LB_4571:
	mov r8,r13
	bt r12,0
	jc LB_4578
	btr r12,2
	jmp LB_4579
LB_4578:
	bts r12,2
LB_4579:
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4576
	btr QWORD [rdi],1
	jmp LB_4577
LB_4576:
	bts QWORD [rdi],1
LB_4577:
	mov rsi,1
	bt r12,1
	jc LB_4568
	mov rsi,0
	bt r14,0
	jc LB_4568
	jmp LB_4569
LB_4568:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4569:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_4566
	btr QWORD [rdi],1
	jmp LB_4567
LB_4566:
	bts QWORD [rdi],1
LB_4567:
	mov r8,0
	bts r12,2
	ret
LB_4580:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4582
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4581
LB_4582:
	add rsp,8
	ret
LB_4584:
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
LB_4583:
	add rsp,64
	pop r14
LB_4581:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_4265_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4706
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4698
LB_4706:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_4267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4711
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4712
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4712:
	jmp LB_4698
LB_4711:
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
	jc LB_4701
	btr r12,1
	clc
	jmp LB_4702
LB_4701:
	bts r12,1
	stc
LB_4702:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4699
	btr r12,0
	clc
	jmp LB_4700
LB_4699:
	bts r12,0
	stc
LB_4700:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4695
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov rcx,r8
	bt r12,2
	jc LB_4714
	btr r12,6
	jmp LB_4715
LB_4714:
	bts r12,6
LB_4715:
	mov r11,r14
	bt r12,1
	jc LB_4716
	btr r12,5
	jmp LB_4717
LB_4716:
	bts r12,5
LB_4717:
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_4720
	btr r12,7
	clc
	jmp LB_4721
LB_4720:
	bts r12,7
	stc
LB_4721:
	mov r14,rdx
	bt r12,7
	jc LB_4718
	btr r12,1
	jmp LB_4719
LB_4718:
	bts r12,1
LB_4719:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_4724
	btr r12,7
	clc
	jmp LB_4725
LB_4724:
	bts r12,7
	stc
LB_4725:
	mov r8,rdx
	bt r12,7
	jc LB_4722
	btr r12,2
	jmp LB_4723
LB_4722:
	bts r12,2
LB_4723:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f51 { %_4311 %_4310 } ⊢ { %_4313 %_4314 } : { %_4313 %_4314 }
 ; {>  %_4310~0':_r64 %_4312~2':(_lst)◂(_p4262) %_4311~1':_r64 }
	add r14,r13
MTC_LB_4635:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4636
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
	jnc LB_4637
	bt QWORD [rdi],0
	jc LB_4638
	btr r12,5
	clc
	jmp LB_4639
LB_4638:
	bts r12,5
	stc
LB_4639:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4637:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4642
	btr r12,6
	clc
	jmp LB_4643
LB_4642:
	bts r12,6
	stc
LB_4643:
	mov r9,rcx
	bt r12,6
	jc LB_4640
	btr r12,3
	jmp LB_4641
LB_4640:
	bts r12,3
LB_4641:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4646
	btr r12,6
	clc
	jmp LB_4647
LB_4646:
	bts r12,6
	stc
LB_4647:
	mov r10,rcx
	bt r12,6
	jc LB_4644
	btr r12,4
	jmp LB_4645
LB_4644:
	bts r12,4
LB_4645:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4636
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
	jnc LB_4648
	bt QWORD [rdi],0
	jc LB_4649
	btr r12,6
	clc
	jmp LB_4650
LB_4649:
	bts r12,6
	stc
LB_4650:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4648:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_4651
	btr r12,5
	jmp LB_4652
LB_4651:
	bts r12,5
LB_4652:
LB_4653:
	cmp r15,0
	jz LB_4654
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4653
LB_4654:
; _f51 { %_4317 %_4314 } ⊢ { %_4318 %_4319 } : { %_4318 %_4319 }
 ; {>  %_4313~1':_r64 %_4317~5':_r64 %_4314~0':_r64 %_4316~4':(_lst)◂(_p4262) }
	add r11,r13
; _f4264 %_4318 ⊢ %_4320 : %_4320
 ; {>  %_4313~1':_r64 %_4319~0':_r64 %_4316~4':(_lst)◂(_p4262) %_4318~5':_r64 }
; _f4264 5' ⊢ °1◂5'
; _cns { %_4320 %_4316 } ⊢ %_4321 : %_4321
 ; {>  %_4313~1':_r64 %_4319~0':_r64 %_4320~°1◂5':_p4262 %_4316~4':(_lst)◂(_p4262) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_4313 %_4321 } ⊢ %_4322 : %_4322
 ; {>  %_4321~°0◂{ °1◂5' 4' }:(_lst)◂(_p4262) %_4313~1':_r64 %_4319~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_4322
 ; {>  %_4322~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p4262) }) %_4319~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_4655
	mov rdi,r13
	call dlt
LB_4655:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_4658
	btr r12,0
	jmp LB_4659
LB_4658:
	bts r12,0
LB_4659:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_4656
	btr QWORD [rdi],0
	jmp LB_4657
LB_4656:
	bts QWORD [rdi],0
LB_4657:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_4668
	btr r12,1
	jmp LB_4669
LB_4668:
	bts r12,1
LB_4669:
	mov rsi,1
	bt r12,1
	jc LB_4666
	mov rsi,0
	bt r14,0
	jc LB_4666
	jmp LB_4667
LB_4666:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4667:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_4664
	btr QWORD [rdi],0
	jmp LB_4665
LB_4664:
	bts QWORD [rdi],0
LB_4665:
	mov r14,r10
	bt r12,4
	jc LB_4672
	btr r12,1
	jmp LB_4673
LB_4672:
	bts r12,1
LB_4673:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_4670
	btr QWORD [rdi],1
	jmp LB_4671
LB_4670:
	bts QWORD [rdi],1
LB_4671:
	mov rsi,1
	bt r12,0
	jc LB_4662
	mov rsi,0
	bt r13,0
	jc LB_4662
	jmp LB_4663
LB_4662:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_4663:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_4660
	btr QWORD [rdi],1
	jmp LB_4661
LB_4660:
	bts QWORD [rdi],1
LB_4661:
	mov r8,0
	bts r12,2
	ret
MTC_LB_4636:
	mov r15,0
LB_4675:
	cmp r15,0
	jz LB_4676
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4675
LB_4676:
; _f4264 %_4314 ⊢ %_4323 : %_4323
 ; {>  %_4313~1':_r64 %_4312~2':(_lst)◂(_p4262) %_4314~0':_r64 }
; _f4264 0' ⊢ °1◂0'
; _cns { %_4323 %_4312 } ⊢ %_4324 : %_4324
 ; {>  %_4313~1':_r64 %_4312~2':(_lst)◂(_p4262) %_4323~°1◂0':_p4262 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_4313 %_4324 } ⊢ %_4325 : %_4325
 ; {>  %_4313~1':_r64 %_4324~°0◂{ °1◂0' 2' }:(_lst)◂(_p4262) }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_4325
 ; {>  %_4325~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p4262) }) }
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
	jc LB_4679
	btr r12,4
	jmp LB_4680
LB_4679:
	bts r12,4
LB_4680:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_4677
	btr QWORD [rdi],0
	jmp LB_4678
LB_4677:
	bts QWORD [rdi],0
LB_4678:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_4689
	btr r12,1
	jmp LB_4690
LB_4689:
	bts r12,1
LB_4690:
	mov rsi,1
	bt r12,1
	jc LB_4687
	mov rsi,0
	bt r14,0
	jc LB_4687
	jmp LB_4688
LB_4687:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4688:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_4685
	btr QWORD [rdi],0
	jmp LB_4686
LB_4685:
	bts QWORD [rdi],0
LB_4686:
	mov r14,r8
	bt r12,2
	jc LB_4693
	btr r12,1
	jmp LB_4694
LB_4693:
	bts r12,1
LB_4694:
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_4691
	btr QWORD [rdi],1
	jmp LB_4692
LB_4691:
	bts QWORD [rdi],1
LB_4692:
	mov rsi,1
	bt r12,4
	jc LB_4683
	mov rsi,0
	bt r10,0
	jc LB_4683
	jmp LB_4684
LB_4683:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_4684:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_4681
	btr QWORD [rdi],1
	jmp LB_4682
LB_4681:
	bts QWORD [rdi],1
LB_4682:
	mov r8,0
	bts r12,2
	ret
MTC_LB_4674:
LB_4695:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4697
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4696
LB_4697:
	add rsp,8
	ret
LB_4698:
	add rsp,32
	pop r14
LB_4696:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_4734
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_4326 : %_4326
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_4327 : %_4327
 ; {>  %_4326~°1◂{  }:(_lst)◂(t1831'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_4327
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_4327 %_4326 } ⊢ %_4328 : %_4328
 ; {>  %_4326~°1◂{  }:(_lst)◂(t1831'(0)) %_4327~0':_r64 }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_4328
 ; {>  %_4328~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t1835'(0)) }) }
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
	jc LB_4728
	btr r12,1
	jmp LB_4729
LB_4728:
	bts r12,1
LB_4729:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_4726
	btr QWORD [rdi],0
	jmp LB_4727
LB_4726:
	bts QWORD [rdi],0
LB_4727:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_4732
	mov rsi,0
	bt r14,0
	jc LB_4732
	jmp LB_4733
LB_4732:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4733:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_4730
	btr QWORD [rdi],1
	jmp LB_4731
LB_4730:
	bts QWORD [rdi],1
LB_4731:
	mov r8,0
	bts r12,2
	ret
LB_4734:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4736
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4735
LB_4736:
	add rsp,8
	ret
LB_4737:
	add rsp,0
	pop r14
LB_4735:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4268:
NS_E_RDI_4268:
NS_E_4268_ETR_TBL:
NS_E_4268_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4775
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4745
LB_4775:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_4783
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4783
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_4783
	jmp LB_4784
LB_4783:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4781
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4781:
	jmp LB_4745
LB_4784:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4758
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4759
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4759:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4760
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4760:
	jmp LB_4746
LB_4758:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4770
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4770
	jmp LB_4771
LB_4770:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4766
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4766:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4767
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4767:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4768:
	jmp LB_4746
LB_4771:
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
	jc LB_4753
	btr r12,3
	clc
	jmp LB_4754
LB_4753:
	bts r12,3
	stc
LB_4754:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4751
	btr r12,2
	clc
	jmp LB_4752
LB_4751:
	bts r12,2
	stc
LB_4752:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4749
	btr r12,1
	clc
	jmp LB_4750
LB_4749:
	bts r12,1
	stc
LB_4750:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4747
	btr r12,0
	clc
	jmp LB_4748
LB_4747:
	bts r12,0
	stc
LB_4748:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_4742
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_4785
	btr r12,4
	jmp LB_4786
LB_4785:
	bts r12,4
LB_4786:
	mov r14,r8
	bt r12,2
	jc LB_4787
	btr r12,1
	jmp LB_4788
LB_4787:
	bts r12,1
LB_4788:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_4331 : %_4331
 ; {>  %_4329~0':_r64 %_4330~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_4331
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_4331 %_4329 } ⊢ { %_4332 %_4333 } : { %_4332 %_4333 }
 ; {>  %_4329~0':_r64 %_4330~1':_r64 %_4331~2':_r64 }
	add r8,r13
; _f51 { %_4332 %_4330 } ⊢ { %_4334 %_4335 } : { %_4334 %_4335 }
 ; {>  %_4332~2':_r64 %_4333~0':_r64 %_4330~1':_r64 }
	add r8,r14
; _some %_4334 ⊢ %_4336 : %_4336
 ; {>  %_4333~0':_r64 %_4334~2':_r64 %_4335~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_4336
 ; {>  %_4333~0':_r64 %_4336~°0◂2':(_opn)◂(_r64) %_4335~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_4738
	mov rdi,r13
	call dlt
LB_4738:
	bt r12,1
	jc LB_4739
	mov rdi,r14
	call dlt
LB_4739:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_4740
	btr r12,3
	jmp LB_4741
LB_4740:
	bts r12,3
LB_4741:
	mov r8,0
	bts r12,2
	ret
LB_4742:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4744
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4743
LB_4744:
	add rsp,8
	ret
LB_4746:
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
LB_4745:
	add rsp,64
	pop r14
LB_4743:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4851
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4798
LB_4851:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_4859
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4859
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4859
	jmp LB_4860
LB_4859:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4857
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4857:
	jmp LB_4798
LB_4860:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_4266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4815
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4816
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4816:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4817:
	jmp LB_4799
LB_4815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4827
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4827
	jmp LB_4828
LB_4827:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4823
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4823:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4824
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4824:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4825
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4825:
	jmp LB_4799
LB_4828:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_4268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4832
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4833
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4833:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4834
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4834:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4835
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4835:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4836
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4836:
	jmp LB_4799
LB_4832:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_4268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4841
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_4842
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_4842:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4843
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4843:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4844
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4844:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4845
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4845:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4846
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4846:
	jmp LB_4799
LB_4841:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_4810
	btr r12,5
	clc
	jmp LB_4811
LB_4810:
	bts r12,5
	stc
LB_4811:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4808
	btr r12,4
	clc
	jmp LB_4809
LB_4808:
	bts r12,4
	stc
LB_4809:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4806
	btr r12,3
	clc
	jmp LB_4807
LB_4806:
	bts r12,3
	stc
LB_4807:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4804
	btr r12,2
	clc
	jmp LB_4805
LB_4804:
	bts r12,2
	stc
LB_4805:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4802
	btr r12,1
	clc
	jmp LB_4803
LB_4802:
	bts r12,1
	stc
LB_4803:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4800
	btr r12,0
	clc
	jmp LB_4801
LB_4800:
	bts r12,0
	stc
LB_4801:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_4795
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_4861
	btr r12,6
	jmp LB_4862
LB_4861:
	bts r12,6
LB_4862:
	mov r9,r11
	bt r12,5
	jc LB_4863
	btr r12,3
	jmp LB_4864
LB_4863:
	bts r12,3
LB_4864:
	mov r11,r8
	bt r12,2
	jc LB_4865
	btr r12,5
	jmp LB_4866
LB_4865:
	bts r12,5
LB_4866:
	mov r8,r10
	bt r12,4
	jc LB_4867
	btr r12,2
	jmp LB_4868
LB_4867:
	bts r12,2
LB_4868:
	mov r10,r14
	bt r12,1
	jc LB_4869
	btr r12,4
	jmp LB_4870
LB_4869:
	bts r12,4
LB_4870:
	mov r14,r11
	bt r12,5
	jc LB_4871
	btr r12,1
	jmp LB_4872
LB_4871:
	bts r12,1
LB_4872:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_4341 : %_4341
 ; {>  %_4337~0':_r64 %_4340~3':_r64 %_4338~1':_r64 %_4339~2':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_4341
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_4341 %_4337 } ⊢ { %_4342 %_4343 } : { %_4342 %_4343 }
 ; {>  %_4341~4':_r64 %_4337~0':_r64 %_4340~3':_r64 %_4338~1':_r64 %_4339~2':_r64 }
	add r10,r13
; _f51 { %_4342 %_4338 } ⊢ { %_4344 %_4345 } : { %_4344 %_4345 }
 ; {>  %_4340~3':_r64 %_4338~1':_r64 %_4343~0':_r64 %_4342~4':_r64 %_4339~2':_r64 }
	add r10,r14
; _f51 { %_4344 %_4339 } ⊢ { %_4346 %_4347 } : { %_4346 %_4347 }
 ; {>  %_4340~3':_r64 %_4343~0':_r64 %_4344~4':_r64 %_4345~1':_r64 %_4339~2':_r64 }
	add r10,r8
; _f51 { %_4346 %_4340 } ⊢ { %_4348 %_4349 } : { %_4348 %_4349 }
 ; {>  %_4346~4':_r64 %_4347~2':_r64 %_4340~3':_r64 %_4343~0':_r64 %_4345~1':_r64 }
	add r10,r9
; _some %_4348 ⊢ %_4350 : %_4350
 ; {>  %_4349~3':_r64 %_4348~4':_r64 %_4347~2':_r64 %_4343~0':_r64 %_4345~1':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_4350
 ; {>  %_4350~°0◂4':(_opn)◂(_r64) %_4349~3':_r64 %_4347~2':_r64 %_4343~0':_r64 %_4345~1':_r64 }
; 	∎ °0◂4'
	bt r12,3
	jc LB_4789
	mov rdi,r9
	call dlt
LB_4789:
	bt r12,2
	jc LB_4790
	mov rdi,r8
	call dlt
LB_4790:
	bt r12,0
	jc LB_4791
	mov rdi,r13
	call dlt
LB_4791:
	bt r12,1
	jc LB_4792
	mov rdi,r14
	call dlt
LB_4792:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_4793
	btr r12,3
	jmp LB_4794
LB_4793:
	bts r12,3
LB_4794:
	mov r8,0
	bts r12,2
	ret
LB_4795:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4797
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4796
LB_4797:
	add rsp,8
	ret
LB_4799:
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
LB_4798:
	add rsp,96
	pop r14
LB_4796:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_4265_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4887
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4879
LB_4887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_4268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4892
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4893
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4893:
	jmp LB_4879
LB_4892:
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
	jc LB_4882
	btr r12,1
	clc
	jmp LB_4883
LB_4882:
	bts r12,1
	stc
LB_4883:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4880
	btr r12,0
	clc
	jmp LB_4881
LB_4880:
	bts r12,0
	stc
LB_4881:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4876
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f51 { %_4351 %_4352 } ⊢ { %_4353 %_4354 } : { %_4353 %_4354 }
 ; {>  %_4351~0':_r64 %_4352~1':_r64 }
	add r13,r14
; _some %_4353 ⊢ %_4355 : %_4355
 ; {>  %_4353~0':_r64 %_4354~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4355
 ; {>  %_4355~°0◂0':(_opn)◂(_r64) %_4354~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_4873
	mov rdi,r14
	call dlt
LB_4873:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4874
	btr r12,3
	jmp LB_4875
LB_4874:
	bts r12,3
LB_4875:
	mov r8,0
	bts r12,2
	ret
LB_4876:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4878
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4877
LB_4878:
	add rsp,8
	ret
LB_4879:
	add rsp,32
	pop r14
LB_4877:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4917:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_4917:
MTC_LB_4918:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4919
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
	jnc LB_4920
	bt QWORD [rdi],0
	jc LB_4921
	btr r12,7
	clc
	jmp LB_4922
LB_4921:
	bts r12,7
	stc
LB_4922:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4920:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_4925
	btr r12,8
	clc
	jmp LB_4926
LB_4925:
	bts r12,8
	stc
LB_4926:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4923
	btr r12,5
	jmp LB_4924
LB_4923:
	bts r12,5
LB_4924:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_4929
	btr r12,8
	clc
	jmp LB_4930
LB_4929:
	bts r12,8
	stc
LB_4930:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4927
	btr r12,6
	jmp LB_4928
LB_4927:
	bts r12,6
LB_4928:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4931:
	cmp r15,0
	jz LB_4932
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4931
LB_4932:
MTC_LB_4933:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4934
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
	jnc LB_4935
	bt QWORD [rdi],0
	jc LB_4936
	btr r12,7
	clc
	jmp LB_4937
LB_4936:
	bts r12,7
	stc
LB_4937:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4935:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4938
	btr r12,4
	jmp LB_4939
LB_4938:
	bts r12,4
LB_4939:
LB_4940:
	cmp r15,0
	jz LB_4941
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4940
LB_4941:
; _f53 %_4902 ⊢ { %_4903 %_4904 } : { %_4903 %_4904 }
 ; {>  %_4895~0':_stg %_4898~3':_r64 %_4897~2':_stg %_4896~1':_r64 %_4901~6':(_lst)◂(_p4262) %_4902~4':_r64 }
	mov r11,r10
	bts r12,5
; _f35 { %_4904 %_4895 %_4896 %_4897 %_4898 } ⊢ { %_4905 %_4906 %_4907 %_4908 %_4909 } : { %_4905 %_4906 %_4907 %_4908 %_4909 }
 ; {>  %_4895~0':_stg %_4904~5':_r64 %_4903~4':_r64 %_4898~3':_r64 %_4897~2':_stg %_4896~1':_r64 %_4901~6':(_lst)◂(_p4262) }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_4946
	btr r12,4
	jmp LB_4947
LB_4946:
	bts r12,4
LB_4947:
	mov r9,r8
	bt r12,2
	jc LB_4948
	btr r12,3
	jmp LB_4949
LB_4948:
	bts r12,3
LB_4949:
	mov r8,r14
	bt r12,1
	jc LB_4950
	btr r12,2
	jmp LB_4951
LB_4950:
	bts r12,2
LB_4951:
	mov r14,r13
	bt r12,0
	jc LB_4952
	btr r12,1
	jmp LB_4953
LB_4952:
	bts r12,1
LB_4953:
	mov r13,r11
	bt r12,5
	jc LB_4954
	btr r12,0
	jmp LB_4955
LB_4954:
	bts r12,0
LB_4955:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_4956
	btr r12,5
	jmp LB_4957
LB_4956:
	bts r12,5
LB_4957:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_4944
	btr r12,6
	clc
	jmp LB_4945
LB_4944:
	bts r12,6
	stc
LB_4945:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4942
	btr r12,4
	clc
	jmp LB_4943
LB_4942:
	bts r12,4
	stc
LB_4943:
	add rsp,24
; _f4917 { %_4906 %_4907 %_4908 %_4909 %_4901 } ⊢ { %_4910 %_4911 } : { %_4910 %_4911 }
 ; {>  %_4905~0':_r64 %_4903~4':_r64 %_4908~3':_stg %_4901~6':(_lst)◂(_p4262) %_4909~5':_r64 %_4906~1':_stg %_4907~2':_r64 }
; _f4917 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_4962
	btr r12,0
	jmp LB_4963
LB_4962:
	bts r12,0
LB_4963:
	mov r14,r8
	bt r12,2
	jc LB_4964
	btr r12,1
	jmp LB_4965
LB_4964:
	bts r12,1
LB_4965:
	mov r8,r9
	bt r12,3
	jc LB_4966
	btr r12,2
	jmp LB_4967
LB_4966:
	bts r12,2
LB_4967:
	mov r9,r11
	bt r12,5
	jc LB_4968
	btr r12,3
	jmp LB_4969
LB_4968:
	bts r12,3
LB_4969:
	mov r10,rcx
	bt r12,6
	jc LB_4970
	btr r12,4
	jmp LB_4971
LB_4970:
	bts r12,4
LB_4971:
	call NS_E_4917
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4972
	btr r12,2
	jmp LB_4973
LB_4972:
	bts r12,2
LB_4973:
	mov r14,r13
	bt r12,0
	jc LB_4974
	btr r12,1
	jmp LB_4975
LB_4974:
	bts r12,1
LB_4975:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4960
	btr r12,4
	clc
	jmp LB_4961
LB_4960:
	bts r12,4
	stc
LB_4961:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4958
	btr r12,0
	clc
	jmp LB_4959
LB_4958:
	bts r12,0
	stc
LB_4959:
	add rsp,24
; ∎ { %_4910 %_4911 }
 ; {>  %_4905~0':_r64 %_4903~4':_r64 %_4910~1':_stg %_4911~2':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_4976
	mov rdi,r13
	call dlt
LB_4976:
	bt r12,4
	jc LB_4977
	mov rdi,r10
	call dlt
LB_4977:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_4978
	btr r12,0
	jmp LB_4979
LB_4978:
	bts r12,0
LB_4979:
	mov r14,r8
	bt r12,2
	jc LB_4980
	btr r12,1
	jmp LB_4981
LB_4980:
	bts r12,1
LB_4981:
	ret
MTC_LB_4934:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4982
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
	jnc LB_4983
	bt QWORD [rdi],0
	jc LB_4984
	btr r12,7
	clc
	jmp LB_4985
LB_4984:
	bts r12,7
	stc
LB_4985:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4983:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4986
	btr r12,4
	jmp LB_4987
LB_4986:
	bts r12,4
LB_4987:
LB_4988:
	cmp r15,0
	jz LB_4989
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4988
LB_4989:
; _f51 { %_4896 %_4912 } ⊢ { %_4913 %_4914 } : { %_4913 %_4914 }
 ; {>  %_4895~0':_stg %_4912~4':_r64 %_4898~3':_r64 %_4897~2':_stg %_4896~1':_r64 %_4901~6':(_lst)◂(_p4262) }
	add r14,r10
; _f4917 { %_4895 %_4913 %_4897 %_4898 %_4901 } ⊢ { %_4915 %_4916 } : { %_4915 %_4916 }
 ; {>  %_4895~0':_stg %_4914~4':_r64 %_4898~3':_r64 %_4897~2':_stg %_4901~6':(_lst)◂(_p4262) %_4913~1':_r64 }
; _f4917 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_4992
	btr r12,4
	jmp LB_4993
LB_4992:
	bts r12,4
LB_4993:
	call NS_E_4917
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4990
	btr r12,4
	clc
	jmp LB_4991
LB_4990:
	bts r12,4
	stc
LB_4991:
	add rsp,16
; ∎ { %_4915 %_4916 }
 ; {>  %_4915~0':_stg %_4914~4':_r64 %_4916~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_4994
	mov rdi,r10
	call dlt
LB_4994:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4982:
MTC_LB_4919:
	mov r15,0
LB_4996:
	cmp r15,0
	jz LB_4997
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4996
LB_4997:
; ∎ { %_4895 %_4897 }
 ; {>  %_4895~0':_stg %_4898~3':_r64 %_4897~2':_stg %_4896~1':_r64 %_4899~4':(_lst)◂(_p4262) }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_4998
	mov rdi,r9
	call dlt
LB_4998:
	bt r12,1
	jc LB_4999
	mov rdi,r14
	call dlt
LB_4999:
	bt r12,4
	jc LB_5000
	mov rdi,r10
	call dlt
LB_5000:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_5001
	btr r12,1
	jmp LB_5002
LB_5001:
	bts r12,1
LB_5002:
	ret
MTC_LB_4995:
NS_E_5018:
; 	|» 0'
NS_E_RDI_5018:
; » 0xr0 |~ {  } ⊢ %_5004 : %_5004
 ; {>  %_5003~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_5004
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f4267 { %_5003 %_5004 } ⊢ { %_5005 %_5006 %_5007 } : { %_5005 %_5006 %_5007 }
 ; {>  %_5004~1':_r64 %_5003~0':_stg }
; _f4267 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4267
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_5019
	btr r12,4
	jmp LB_5020
LB_5019:
	bts r12,4
LB_5020:
	mov r8,r9
	bt r12,3
	jc LB_5023
	btr r12,2
	jmp LB_5024
LB_5023:
	bts r12,2
LB_5024:
	mov rsi,1
	bt r12,2
	jc LB_5021
	mov rsi,0
	bt r8,0
	jc LB_5021
	jmp LB_5022
LB_5021:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5022:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_5025:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5026
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
	jnc LB_5027
	bt QWORD [rdi],0
	jc LB_5028
	btr r12,5
	clc
	jmp LB_5029
LB_5028:
	bts r12,5
	stc
LB_5029:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5027:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_5032
	btr r12,6
	clc
	jmp LB_5033
LB_5032:
	bts r12,6
	stc
LB_5033:
	mov r9,rcx
	bt r12,6
	jc LB_5030
	btr r12,3
	jmp LB_5031
LB_5030:
	bts r12,3
LB_5031:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_5036
	btr r12,6
	clc
	jmp LB_5037
LB_5036:
	bts r12,6
	stc
LB_5037:
	mov r10,rcx
	bt r12,6
	jc LB_5034
	btr r12,4
	jmp LB_5035
LB_5034:
	bts r12,4
LB_5035:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5038:
	cmp r15,0
	jz LB_5039
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5038
LB_5039:
; _f31 %_5008 ⊢ { %_5010 %_5011 } : { %_5010 %_5011 }
 ; {>  %_5009~4':(_lst)◂(_p4262) %_5005~0':_stg %_5006~1':_r64 %_5008~3':_r64 }
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
	jc LB_5046
	btr r12,0
	jmp LB_5047
LB_5046:
	bts r12,0
LB_5047:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_5048
	btr r12,2
	jmp LB_5049
LB_5048:
	bts r12,2
LB_5049:
	mov r9,r14
	bt r12,1
	jc LB_5050
	btr r12,3
	jmp LB_5051
LB_5050:
	bts r12,3
LB_5051:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_5044
	btr r12,4
	clc
	jmp LB_5045
LB_5044:
	bts r12,4
	stc
LB_5045:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_5042
	btr r12,1
	clc
	jmp LB_5043
LB_5042:
	bts r12,1
	stc
LB_5043:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_5040
	btr r12,0
	clc
	jmp LB_5041
LB_5040:
	bts r12,0
	stc
LB_5041:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_5012 : %_5012
 ; {>  %_5009~4':(_lst)◂(_p4262) %_5005~0':_stg %_5006~1':_r64 %_5011~3':_stg %_5010~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_5012
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_5013 : %_5013
 ; {>  %_5009~4':(_lst)◂(_p4262) %_5005~0':_stg %_5006~1':_r64 %_5011~3':_stg %_5012~5':_r64 %_5010~2':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_5013
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f4917 { %_5005 %_5012 %_5011 %_5013 %_5009 } ⊢ { %_5014 %_5015 } : { %_5014 %_5015 }
 ; {>  %_5009~4':(_lst)◂(_p4262) %_5005~0':_stg %_5013~6':_r64 %_5006~1':_r64 %_5011~3':_stg %_5012~5':_r64 %_5010~2':_r64 }
; _f4917 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_5056
	btr r12,1
	jmp LB_5057
LB_5056:
	bts r12,1
LB_5057:
	mov r8,r9
	bt r12,3
	jc LB_5058
	btr r12,2
	jmp LB_5059
LB_5058:
	bts r12,2
LB_5059:
	mov r9,rcx
	bt r12,6
	jc LB_5060
	btr r12,3
	jmp LB_5061
LB_5060:
	bts r12,3
LB_5061:
	call NS_E_4917
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_5062
	btr r12,3
	jmp LB_5063
LB_5062:
	bts r12,3
LB_5063:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_5054
	btr r12,2
	clc
	jmp LB_5055
LB_5054:
	bts r12,2
	stc
LB_5055:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_5052
	btr r12,1
	clc
	jmp LB_5053
LB_5052:
	bts r12,1
	stc
LB_5053:
	add rsp,24
; _some %_5015 ⊢ %_5016 : %_5016
 ; {>  %_5014~0':_stg %_5006~1':_r64 %_5010~2':_r64 %_5015~3':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_5014 %_5016 }
 ; {>  %_5014~0':_stg %_5006~1':_r64 %_5016~°0◂3':(_opn)◂(_stg) %_5010~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_5064
	mov rdi,r14
	call dlt
LB_5064:
	bt r12,2
	jc LB_5065
	mov rdi,r8
	call dlt
LB_5065:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_5068
	btr r12,1
	jmp LB_5069
LB_5068:
	bts r12,1
LB_5069:
	mov rsi,1
	bt r12,1
	jc LB_5066
	mov rsi,0
	bt r14,0
	jc LB_5066
	jmp LB_5067
LB_5066:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5067:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_5026:
	mov r15,0
LB_5071:
	cmp r15,0
	jz LB_5072
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5071
LB_5072:
; _none {  } ⊢ %_5017 : %_5017
 ; {>  %_5007~2':(_opn)◂({ _r64 (_lst)◂(_p4262) }) %_5005~0':_stg %_5006~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_5005 %_5017 }
 ; {>  %_5007~2':(_opn)◂({ _r64 (_lst)◂(_p4262) }) %_5005~0':_stg %_5017~°1◂{  }:(_opn)◂(t2022'(0)) %_5006~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_5073
	mov rdi,r8
	call dlt
LB_5073:
	bt r12,1
	jc LB_5074
	mov rdi,r14
	call dlt
LB_5074:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_5075
	mov rsi,0
	bt r14,0
	jc LB_5075
	jmp LB_5076
LB_5075:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5076:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_5070:
NS_E_5077:
NS_E_RDI_5077:
NS_E_5077_ETR_TBL:
NS_E_5077_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_5106
LB_5105:
	add r14,1
LB_5106:
	cmp r14,r10
	jge LB_5107
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5105
	cmp al,10
	jz LB_5105
	cmp al,32
	jz LB_5105
LB_5107:
	push r10
	call NS_E_1396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5108
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5098
LB_5108:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_5111
LB_5110:
	add r14,1
LB_5111:
	cmp r14,r10
	jge LB_5112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5110
	cmp al,10
	jz LB_5110
	cmp al,32
	jz LB_5110
LB_5112:
	add r14,1
	cmp r14,r10
	jg LB_5116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_5116
	jmp LB_5117
LB_5116:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5114:
	jmp LB_5098
LB_5117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_5119
LB_5118:
	add r14,1
LB_5119:
	cmp r14,r10
	jge LB_5120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5118
	cmp al,10
	jz LB_5118
	cmp al,32
	jz LB_5118
LB_5120:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5121
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5122
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5123:
	jmp LB_5098
LB_5121:
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
	jc LB_5103
	btr r12,2
	clc
	jmp LB_5104
LB_5103:
	bts r12,2
	stc
LB_5104:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5101
	btr r12,1
	clc
	jmp LB_5102
LB_5101:
	bts r12,1
	stc
LB_5102:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5099
	btr r12,0
	clc
	jmp LB_5100
LB_5099:
	bts r12,0
	stc
LB_5100:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5095
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov rcx,r14
	bt r12,1
	jc LB_5125
	btr r12,6
	jmp LB_5126
LB_5125:
	bts r12,6
LB_5126:
	mov r14,r8
	bt r12,2
	jc LB_5127
	btr r12,1
	jmp LB_5128
LB_5127:
	bts r12,1
LB_5128:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1443 { %_5078 %_5079 } ⊢ %_5080 : %_5080
 ; {>  %_5078~0':_stg %_5079~1':_p1442 }
; _f1443 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5080 ⊢ %_5081 : %_5081
 ; {>  %_5080~°0◂{ 0' 1' }:_p1442 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5081
 ; {>  %_5081~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1442) }
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
	jc LB_5089
	btr r12,2
	jmp LB_5090
LB_5089:
	bts r12,2
LB_5090:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5087
	btr QWORD [rdi],0
	jmp LB_5088
LB_5087:
	bts QWORD [rdi],0
LB_5088:
	mov r8,r14
	bt r12,1
	jc LB_5093
	btr r12,2
	jmp LB_5094
LB_5093:
	bts r12,2
LB_5094:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5091
	btr QWORD [rdi],1
	jmp LB_5092
LB_5091:
	bts QWORD [rdi],1
LB_5092:
	mov rsi,1
	bt r12,3
	jc LB_5085
	mov rsi,0
	bt r9,0
	jc LB_5085
	jmp LB_5086
LB_5085:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5086:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5095:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5097
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5096
LB_5097:
	add rsp,8
	ret
LB_5098:
	add rsp,48
	pop r14
LB_5096:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_5140
LB_5139:
	add r14,1
LB_5140:
	cmp r14,r10
	jge LB_5141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5139
	cmp al,32
	jz LB_5139
LB_5141:
	push r10
	call NS_E_1396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5142
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5136
LB_5142:
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
	jc LB_5137
	btr r12,0
	clc
	jmp LB_5138
LB_5137:
	bts r12,0
	stc
LB_5138:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5133
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1444 %_5082 ⊢ %_5083 : %_5083
 ; {>  %_5082~0':_stg }
; _f1444 0' ⊢ °1◂0'
; _some %_5083 ⊢ %_5084 : %_5084
 ; {>  %_5083~°1◂0':_p1442 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5084
 ; {>  %_5084~°0◂°1◂0':(_opn)◂(_p1442) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5131
	btr r12,3
	jmp LB_5132
LB_5131:
	bts r12,3
LB_5132:
	mov rsi,1
	bt r12,3
	jc LB_5129
	mov rsi,0
	bt r9,0
	jc LB_5129
	jmp LB_5130
LB_5129:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5130:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5133:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5135
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5134
LB_5135:
	add rsp,8
	ret
LB_5136:
	add rsp,16
	pop r14
LB_5134:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5144:
NS_E_RDI_5144:
NS_E_5144_ETR_TBL:
NS_E_5144_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_614_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5169
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5161
LB_5169:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_5177
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_5177
	jmp LB_5178
LB_5177:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5175
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5175:
	jmp LB_5161
LB_5178:
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
	jc LB_5164
	btr r12,1
	clc
	jmp LB_5165
LB_5164:
	bts r12,1
	stc
LB_5165:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5162
	btr r12,0
	clc
	jmp LB_5163
LB_5162:
	bts r12,0
	stc
LB_5163:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5158
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1491 %_5145 ⊢ %_5146 : %_5146
 ; {>  %_5145~0':_r64 }
; _f1491 0' ⊢ °0◂0'
; _some %_5146 ⊢ %_5147 : %_5147
 ; {>  %_5146~°0◂0':_p1490 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5147
 ; {>  %_5147~°0◂°0◂0':(_opn)◂(_p1490) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5156
	btr r12,3
	jmp LB_5157
LB_5156:
	bts r12,3
LB_5157:
	mov rsi,1
	bt r12,3
	jc LB_5154
	mov rsi,0
	bt r9,0
	jc LB_5154
	jmp LB_5155
LB_5154:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5155:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5158:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5160
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5159
LB_5160:
	add rsp,8
	ret
LB_5161:
	add rsp,32
	pop r14
LB_5159:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5192
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5186
LB_5192:
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
	jc LB_5187
	btr r12,0
	clc
	jmp LB_5188
LB_5187:
	bts r12,0
	stc
LB_5188:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5183
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1492 %_5148 ⊢ %_5149 : %_5149
 ; {>  %_5148~0':_stg }
; _f1492 0' ⊢ °1◂0'
; _some %_5149 ⊢ %_5150 : %_5150
 ; {>  %_5149~°1◂0':_p1490 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5150
 ; {>  %_5150~°0◂°1◂0':(_opn)◂(_p1490) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5181
	btr r12,3
	jmp LB_5182
LB_5181:
	bts r12,3
LB_5182:
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
LB_5183:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5185
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5184
LB_5185:
	add rsp,8
	ret
LB_5186:
	add rsp,16
	pop r14
LB_5184:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5207
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5201
LB_5207:
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
	jc LB_5202
	btr r12,0
	clc
	jmp LB_5203
LB_5202:
	bts r12,0
	stc
LB_5203:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5198
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1493 %_5151 ⊢ %_5152 : %_5152
 ; {>  %_5151~0':_p1442 }
; _f1493 0' ⊢ °2◂0'
; _some %_5152 ⊢ %_5153 : %_5153
 ; {>  %_5152~°2◂0':_p1490 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_5153
 ; {>  %_5153~°0◂°2◂0':(_opn)◂(_p1490) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5196
	btr r12,3
	jmp LB_5197
LB_5196:
	bts r12,3
LB_5197:
	mov rsi,1
	bt r12,3
	jc LB_5194
	mov rsi,0
	bt r9,0
	jc LB_5194
	jmp LB_5195
LB_5194:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5195:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5198:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5200
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5199
LB_5200:
	add rsp,8
	ret
LB_5201:
	add rsp,16
	pop r14
LB_5199:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5210:
NS_E_RDI_5210:
NS_E_5210_ETR_TBL:
NS_E_5210_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_5217
LB_5216:
	add r14,1
LB_5217:
	cmp r14,r10
	jge LB_5218
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5216
	cmp al,32
	jz LB_5216
LB_5218:
	add r14,1
	cmp r14,r10
	jg LB_5221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_5221
	jmp LB_5222
LB_5221:
	jmp LB_5212
LB_5222:
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
LB_5227:
	jmp LB_5224
LB_5223:
	add r14,1
LB_5224:
	cmp r14,r10
	jge LB_5225
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5223
	cmp al,32
	jz LB_5223
LB_5225:
	add r14,1
	cmp r14,r10
	jg LB_5226
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_5226
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
	jmp LB_5227
LB_5226:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5213
	btr QWORD [rdi],1
LB_5213:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5214
	btr QWORD [rdi],0
LB_5214:
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
LB_5212:
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
NS_E_5237:
; 	|» { 0' 1' }
NS_E_RDI_5237:
MTC_LB_5238:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5239
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
	jnc LB_5240
	bt QWORD [rdi],0
	jc LB_5241
	btr r12,4
	clc
	jmp LB_5242
LB_5241:
	bts r12,4
	stc
LB_5242:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5240:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_5245
	btr r12,5
	clc
	jmp LB_5246
LB_5245:
	bts r12,5
	stc
LB_5246:
	mov r8,r11
	bt r12,5
	jc LB_5243
	btr r12,2
	jmp LB_5244
LB_5243:
	bts r12,2
LB_5244:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_5249
	btr r12,5
	clc
	jmp LB_5250
LB_5249:
	bts r12,5
	stc
LB_5250:
	mov r9,r11
	bt r12,5
	jc LB_5247
	btr r12,3
	jmp LB_5248
LB_5247:
	bts r12,3
LB_5248:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5251:
	cmp r15,0
	jz LB_5252
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5251
LB_5252:
; _f1585 { %_5231 %_5233 } ⊢ %_5235 : %_5235
 ; {>  %_5234~3':(_lst)◂(_p1551) %_5231~0':_p1551 %_5233~2':_p1551 }
; _f1585 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f5237 { %_5235 %_5234 } ⊢ %_5236 : %_5236
 ; {>  %_5234~3':(_lst)◂(_p1551) %_5235~°2◂{ 0' 2' }:_p1551 }
; _f5237 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_5253
	btr r12,1
	jmp LB_5254
LB_5253:
	bts r12,1
LB_5254:
	mov r9,r13
	bt r12,0
	jc LB_5255
	btr r12,3
	jmp LB_5256
LB_5255:
	bts r12,3
LB_5256:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_5261
	btr r12,4
	jmp LB_5262
LB_5261:
	bts r12,4
LB_5262:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_5259
	btr QWORD [rdi],0
	jmp LB_5260
LB_5259:
	bts QWORD [rdi],0
LB_5260:
	mov r10,r8
	bt r12,2
	jc LB_5265
	btr r12,4
	jmp LB_5266
LB_5265:
	bts r12,4
LB_5266:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_5263
	btr QWORD [rdi],1
	jmp LB_5264
LB_5263:
	bts QWORD [rdi],1
LB_5264:
	mov rsi,1
	bt r12,0
	jc LB_5257
	mov rsi,0
	bt r13,0
	jc LB_5257
	jmp LB_5258
LB_5257:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_5258:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_5237
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_5236
 ; {>  %_5236~0':_p1551 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_5239:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_5267
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
	jnc LB_5268
	bt QWORD [rdi],0
	jc LB_5269
	btr r12,2
	clc
	jmp LB_5270
LB_5269:
	bts r12,2
	stc
LB_5270:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5268:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5271:
	cmp r15,0
	jz LB_5272
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5271
LB_5272:
; ∎ %_5231
 ; {>  %_5231~0':_p1551 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_5267:
NS_E_5273:
NS_E_RDI_5273:
NS_E_5273_ETR_TBL:
NS_E_5273_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5325
LB_5324:
	add r14,1
LB_5325:
	cmp r14,r10
	jge LB_5326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5324
	cmp al,10
	jz LB_5324
	cmp al,32
	jz LB_5324
LB_5326:
	add r14,1
	cmp r14,r10
	jg LB_5329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_5329
	jmp LB_5330
LB_5329:
	jmp LB_5317
LB_5330:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_ptn_lst
	jmp LB_5332
LB_5331:
	add r14,1
LB_5332:
	cmp r14,r10
	jge LB_5333
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5331
	cmp al,10
	jz LB_5331
	cmp al,32
	jz LB_5331
LB_5333:
	push r10
	call NS_E_5274_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5334
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5335:
	jmp LB_5317
LB_5334:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_5338
LB_5337:
	add r14,1
LB_5338:
	cmp r14,r10
	jge LB_5339
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5337
	cmp al,10
	jz LB_5337
	cmp al,32
	jz LB_5337
LB_5339:
	add r14,1
	cmp r14,r10
	jg LB_5344
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_5344
	jmp LB_5345
LB_5344:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5341
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5341:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5342
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5342:
	jmp LB_5317
LB_5345:
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
	jc LB_5322
	btr r12,2
	clc
	jmp LB_5323
LB_5322:
	bts r12,2
	stc
LB_5323:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5320
	btr r12,1
	clc
	jmp LB_5321
LB_5320:
	bts r12,1
	stc
LB_5321:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5318
	btr r12,0
	clc
	jmp LB_5319
LB_5318:
	bts r12,0
	stc
LB_5319:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5314
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5346
	btr r12,6
	jmp LB_5347
LB_5346:
	bts r12,6
LB_5347:
	mov r13,r14
	bt r12,1
	jc LB_5348
	btr r12,0
	jmp LB_5349
LB_5348:
	bts r12,0
LB_5349:
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
; _f1488 %_5277 ⊢ %_5278 : %_5278
 ; {>  %_5277~0':(_lst)◂((_p1487)◂((_p1500)◂(_stg))) }
; _f1488 0' ⊢ °0◂0'
; _some %_5278 ⊢ %_5279 : %_5279
 ; {>  %_5278~°0◂0':(_p1487)◂((_p1500)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5279
 ; {>  %_5279~°0◂°0◂0':(_opn)◂((_p1487)◂((_p1500)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5312
	btr r12,3
	jmp LB_5313
LB_5312:
	bts r12,3
LB_5313:
	mov rsi,1
	bt r12,3
	jc LB_5310
	mov rsi,0
	bt r9,0
	jc LB_5310
	jmp LB_5311
LB_5310:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5311:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5314:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5316
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5315
LB_5316:
	add rsp,8
	ret
LB_5317:
	add rsp,48
	pop r14
LB_5315:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mtc
	jmp LB_5361
LB_5360:
	add r14,1
LB_5361:
	cmp r14,r10
	jge LB_5362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5360
	cmp al,10
	jz LB_5360
	cmp al,32
	jz LB_5360
LB_5362:
	push r10
	call NS_E_5276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5363
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5357
LB_5363:
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
	jc LB_5358
	btr r12,0
	clc
	jmp LB_5359
LB_5358:
	bts r12,0
	stc
LB_5359:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5354
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1489 %_5280 ⊢ %_5281 : %_5281
 ; {>  %_5280~0':(_p1500)◂(_stg) }
; _f1489 0' ⊢ °1◂0'
; _some %_5281 ⊢ %_5282 : %_5282
 ; {>  %_5281~°1◂0':(_p1487)◂((_p1500)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5282
 ; {>  %_5282~°0◂°1◂0':(_opn)◂((_p1487)◂((_p1500)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5352
	btr r12,3
	jmp LB_5353
LB_5352:
	bts r12,3
LB_5353:
	mov rsi,1
	bt r12,3
	jc LB_5350
	mov rsi,0
	bt r9,0
	jc LB_5350
	jmp LB_5351
LB_5350:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5351:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5354:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5356
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5355
LB_5356:
	add rsp,8
	ret
LB_5357:
	add rsp,16
	pop r14
LB_5355:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5274:
NS_E_RDI_5274:
NS_E_5274_ETR_TBL:
NS_E_5274_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_ptn
	jmp LB_5384
LB_5383:
	add r14,1
LB_5384:
	cmp r14,r10
	jge LB_5385
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5383
	cmp al,10
	jz LB_5383
	cmp al,32
	jz LB_5383
LB_5385:
	push r10
	call NS_E_5273_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5386
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5378
LB_5386:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_ptn_lst
	jmp LB_5389
LB_5388:
	add r14,1
LB_5389:
	cmp r14,r10
	jge LB_5390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5388
	cmp al,10
	jz LB_5388
	cmp al,32
	jz LB_5388
LB_5390:
	push r10
	call NS_E_5274_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5391
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5392
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5392:
	jmp LB_5378
LB_5391:
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
	jc LB_5381
	btr r12,1
	clc
	jmp LB_5382
LB_5381:
	bts r12,1
	stc
LB_5382:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5379
	btr r12,0
	clc
	jmp LB_5380
LB_5379:
	bts r12,0
	stc
LB_5380:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5375
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5283 %_5284 } ⊢ %_5285 : %_5285
 ; {>  %_5284~1':(_lst)◂((_p1487)◂((_p1500)◂(_stg))) %_5283~0':(_p1487)◂((_p1500)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5285 ⊢ %_5286 : %_5286
 ; {>  %_5285~°0◂{ 0' 1' }:(_lst)◂((_p1487)◂((_p1500)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5286
 ; {>  %_5286~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1487)◂((_p1500)◂(_stg)))) }
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
	jc LB_5369
	btr r12,2
	jmp LB_5370
LB_5369:
	bts r12,2
LB_5370:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5367
	btr QWORD [rdi],0
	jmp LB_5368
LB_5367:
	bts QWORD [rdi],0
LB_5368:
	mov r8,r14
	bt r12,1
	jc LB_5373
	btr r12,2
	jmp LB_5374
LB_5373:
	bts r12,2
LB_5374:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5371
	btr QWORD [rdi],1
	jmp LB_5372
LB_5371:
	bts QWORD [rdi],1
LB_5372:
	mov rsi,1
	bt r12,3
	jc LB_5365
	mov rsi,0
	bt r9,0
	jc LB_5365
	jmp LB_5366
LB_5365:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5366:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5375:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5377
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5376
LB_5377:
	add rsp,8
	ret
LB_5378:
	add rsp,32
	pop r14
LB_5376:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5396
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5287 : %_5287
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5287 ⊢ %_5288 : %_5288
 ; {>  %_5287~°1◂{  }:(_lst)◂(t2125'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5288
 ; {>  %_5288~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2128'(0))) }
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
	jc LB_5394
	mov rsi,0
	bt r9,0
	jc LB_5394
	jmp LB_5395
LB_5394:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5395:
	mov rax,0x0100_0000_0000_0001
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
	add rsp,0
	pop r14
LB_5397:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5275:
NS_E_RDI_5275:
NS_E_5275_ETR_TBL:
NS_E_5275_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_5435
LB_5434:
	add r14,1
LB_5435:
	cmp r14,r10
	jge LB_5436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5434
	cmp al,10
	jz LB_5434
	cmp al,32
	jz LB_5434
LB_5436:
	add r14,1
	cmp r14,r10
	jg LB_5439
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_5439
	jmp LB_5440
LB_5439:
	jmp LB_5413
LB_5440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc
	jmp LB_5422
LB_5421:
	add r14,1
LB_5422:
	cmp r14,r10
	jge LB_5423
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5421
	cmp al,10
	jz LB_5421
	cmp al,32
	jz LB_5421
LB_5423:
	push r10
	call NS_E_5276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5424
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5425
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5425:
	jmp LB_5414
LB_5424:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_tl
	jmp LB_5428
LB_5427:
	add r14,1
LB_5428:
	cmp r14,r10
	jge LB_5429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5427
	cmp al,10
	jz LB_5427
	cmp al,32
	jz LB_5427
LB_5429:
	push r10
	call NS_E_5275_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5430
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5431
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5432
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5432:
	jmp LB_5414
LB_5430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5419
	btr r12,2
	clc
	jmp LB_5420
LB_5419:
	bts r12,2
	stc
LB_5420:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5417
	btr r12,1
	clc
	jmp LB_5418
LB_5417:
	bts r12,1
	stc
LB_5418:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,48
	push rdi
	push rsi
	push LB_5410
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5441
	btr r12,3
	jmp LB_5442
LB_5441:
	bts r12,3
LB_5442:
	mov r14,r8
	bt r12,2
	jc LB_5443
	btr r12,1
	jmp LB_5444
LB_5443:
	bts r12,1
LB_5444:
	mov r8,r13
	bt r12,0
	jc LB_5445
	btr r12,2
	jmp LB_5446
LB_5445:
	bts r12,2
LB_5446:
	mov r13,r9
	bt r12,3
	jc LB_5447
	btr r12,0
	jmp LB_5448
LB_5447:
	bts r12,0
LB_5448:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5289 %_5290 } ⊢ %_5291 : %_5291
 ; {>  %_5290~1':(_lst)◂((_p1500)◂(_stg)) %_5289~0':(_p1500)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5291 ⊢ %_5292 : %_5292
 ; {>  %_5291~°0◂{ 0' 1' }:(_lst)◂((_p1500)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5292
 ; {>  %_5292~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1500)◂(_stg))) }
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
	jc LB_5404
	btr r12,2
	jmp LB_5405
LB_5404:
	bts r12,2
LB_5405:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5402
	btr QWORD [rdi],0
	jmp LB_5403
LB_5402:
	bts QWORD [rdi],0
LB_5403:
	mov r8,r14
	bt r12,1
	jc LB_5408
	btr r12,2
	jmp LB_5409
LB_5408:
	bts r12,2
LB_5409:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5406
	btr QWORD [rdi],1
	jmp LB_5407
LB_5406:
	bts QWORD [rdi],1
LB_5407:
	mov rsi,1
	bt r12,3
	jc LB_5400
	mov rsi,0
	bt r9,0
	jc LB_5400
	jmp LB_5401
LB_5400:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5401:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5410:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5412
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5411
LB_5412:
	add rsp,8
	ret
LB_5414:
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
LB_5413:
	add rsp,48
	pop r14
LB_5411:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5451
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5293 : %_5293
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5293 ⊢ %_5294 : %_5294
 ; {>  %_5293~°1◂{  }:(_lst)◂(t2138'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5294
 ; {>  %_5294~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2141'(0))) }
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
	jc LB_5449
	mov rsi,0
	bt r9,0
	jc LB_5449
	jmp LB_5450
LB_5449:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5450:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5451:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5453
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5452
LB_5453:
	add rsp,8
	ret
LB_5454:
	add rsp,0
	pop r14
LB_5452:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5276:
NS_E_RDI_5276:
NS_E_5276_ETR_TBL:
NS_E_5276_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; name
	jmp LB_5476
LB_5475:
	add r14,1
LB_5476:
	cmp r14,r10
	jge LB_5477
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5475
	cmp al,10
	jz LB_5475
	cmp al,32
	jz LB_5475
LB_5477:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5478
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5468
LB_5478:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_5481
LB_5480:
	add r14,1
LB_5481:
	cmp r14,r10
	jge LB_5482
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5480
	cmp al,10
	jz LB_5480
	cmp al,32
	jz LB_5480
LB_5482:
	add r14,3
	cmp r14,r10
	jg LB_5486
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5486
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_5486
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_5486
	jmp LB_5487
LB_5486:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5484
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5484:
	jmp LB_5468
LB_5487:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_ptn
	jmp LB_5489
LB_5488:
	add r14,1
LB_5489:
	cmp r14,r10
	jge LB_5490
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5488
	cmp al,10
	jz LB_5488
	cmp al,32
	jz LB_5488
LB_5490:
	push r10
	call NS_E_5273_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5491
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5492
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5492:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5493
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5493:
	jmp LB_5468
LB_5491:
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
	jc LB_5473
	btr r12,2
	clc
	jmp LB_5474
LB_5473:
	bts r12,2
	stc
LB_5474:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5471
	btr r12,1
	clc
	jmp LB_5472
LB_5471:
	bts r12,1
	stc
LB_5472:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5469
	btr r12,0
	clc
	jmp LB_5470
LB_5469:
	bts r12,0
	stc
LB_5470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5465
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov rcx,r14
	bt r12,1
	jc LB_5495
	btr r12,6
	jmp LB_5496
LB_5495:
	bts r12,6
LB_5496:
	mov r14,r8
	bt r12,2
	jc LB_5497
	btr r12,1
	jmp LB_5498
LB_5497:
	bts r12,1
LB_5498:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1501 { %_5295 %_5296 } ⊢ %_5297 : %_5297
 ; {>  %_5295~0':_p1442 %_5296~1':(_p1487)◂((_p1500)◂(_stg)) }
; _f1501 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5297 ⊢ %_5298 : %_5298
 ; {>  %_5297~°0◂{ 0' 1' }:(_p1500)◂(_stg) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5298
 ; {>  %_5298~°0◂°0◂{ 0' 1' }:(_opn)◂((_p1500)◂(_stg)) }
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
	jc LB_5459
	btr r12,2
	jmp LB_5460
LB_5459:
	bts r12,2
LB_5460:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5457
	btr QWORD [rdi],0
	jmp LB_5458
LB_5457:
	bts QWORD [rdi],0
LB_5458:
	mov r8,r14
	bt r12,1
	jc LB_5463
	btr r12,2
	jmp LB_5464
LB_5463:
	bts r12,2
LB_5464:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5461
	btr QWORD [rdi],1
	jmp LB_5462
LB_5461:
	bts QWORD [rdi],1
LB_5462:
	mov rsi,1
	bt r12,3
	jc LB_5455
	mov rsi,0
	bt r9,0
	jc LB_5455
	jmp LB_5456
LB_5455:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5456:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5465:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5467
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5466
LB_5467:
	add rsp,8
	ret
LB_5468:
	add rsp,48
	pop r14
LB_5466:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_5530
LB_5529:
	add r14,1
LB_5530:
	cmp r14,r10
	jge LB_5531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5529
	cmp al,10
	jz LB_5529
	cmp al,32
	jz LB_5529
LB_5531:
	add r14,2
	cmp r14,r10
	jg LB_5534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_5534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_5534
	jmp LB_5535
LB_5534:
	jmp LB_5506
LB_5535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_5515
LB_5514:
	add r14,1
LB_5515:
	cmp r14,r10
	jge LB_5516
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5514
	cmp al,10
	jz LB_5514
	cmp al,32
	jz LB_5514
LB_5516:
	push r10
	call NS_E_5144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5517
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5518
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5518:
	jmp LB_5507
LB_5517:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_5521
LB_5520:
	add r14,1
LB_5521:
	cmp r14,r10
	jge LB_5522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5520
	cmp al,10
	jz LB_5520
	cmp al,32
	jz LB_5520
LB_5522:
	add r14,1
	cmp r14,r10
	jg LB_5527
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_5527
	jmp LB_5528
LB_5527:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5524
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5524:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5525:
	jmp LB_5507
LB_5528:
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
	jc LB_5512
	btr r12,2
	clc
	jmp LB_5513
LB_5512:
	bts r12,2
	stc
LB_5513:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5510
	btr r12,1
	clc
	jmp LB_5511
LB_5510:
	bts r12,1
	stc
LB_5511:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5508
	btr r12,0
	clc
	jmp LB_5509
LB_5508:
	bts r12,0
	stc
LB_5509:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5503
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5536
	btr r12,3
	jmp LB_5537
LB_5536:
	bts r12,3
LB_5537:
	mov r13,r14
	bt r12,1
	jc LB_5538
	btr r12,0
	jmp LB_5539
LB_5538:
	bts r12,0
LB_5539:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1502 %_5299 ⊢ %_5300 : %_5300
 ; {>  %_5299~0':_p1490 }
; _f1502 0' ⊢ °1◂0'
; _some %_5300 ⊢ %_5301 : %_5301
 ; {>  %_5300~°1◂0':(_p1500)◂(t2154'(0)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5301
 ; {>  %_5301~°0◂°1◂0':(_opn)◂((_p1500)◂(t2157'(0))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5501
	btr r12,3
	jmp LB_5502
LB_5501:
	bts r12,3
LB_5502:
	mov rsi,1
	bt r12,3
	jc LB_5499
	mov rsi,0
	bt r9,0
	jc LB_5499
	jmp LB_5500
LB_5499:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5500:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5503:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5505
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5504
LB_5505:
	add rsp,8
	ret
LB_5507:
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
LB_5506:
	add rsp,48
	pop r14
LB_5504:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	jmp LB_5560
LB_5559:
	add r14,1
LB_5560:
	cmp r14,r10
	jge LB_5561
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5559
	cmp al,10
	jz LB_5559
	cmp al,32
	jz LB_5559
LB_5561:
	add r14,1
	cmp r14,r10
	jg LB_5564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_5564
	jmp LB_5565
LB_5564:
	jmp LB_5547
LB_5565:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	jmp LB_5554
LB_5553:
	add r14,1
LB_5554:
	cmp r14,r10
	jge LB_5555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5553
	cmp al,10
	jz LB_5553
	cmp al,32
	jz LB_5553
LB_5555:
	push r10
	call NS_E_1396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5556
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5557
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5557:
	jmp LB_5548
LB_5556:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5551
	btr r12,1
	clc
	jmp LB_5552
LB_5551:
	bts r12,1
	stc
LB_5552:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5549
	btr r12,0
	clc
	jmp LB_5550
LB_5549:
	bts r12,0
	stc
LB_5550:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5544
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5566
	btr r12,2
	jmp LB_5567
LB_5566:
	bts r12,2
LB_5567:
	mov r13,r14
	bt r12,1
	jc LB_5568
	btr r12,0
	jmp LB_5569
LB_5568:
	bts r12,0
LB_5569:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1504 %_5302 ⊢ %_5303 : %_5303
 ; {>  %_5302~0':_stg }
; _f1504 0' ⊢ °3◂0'
; _some %_5303 ⊢ %_5304 : %_5304
 ; {>  %_5303~°3◂0':(_p1500)◂(_stg) }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_5304
 ; {>  %_5304~°0◂°3◂0':(_opn)◂((_p1500)◂(_stg)) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5542
	btr r12,3
	jmp LB_5543
LB_5542:
	bts r12,3
LB_5543:
	mov rsi,1
	bt r12,3
	jc LB_5540
	mov rsi,0
	bt r9,0
	jc LB_5540
	jmp LB_5541
LB_5540:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5541:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5544:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5546
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5545
LB_5546:
	add rsp,8
	ret
LB_5548:
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
LB_5547:
	add rsp,32
	pop r14
LB_5545:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_5581
LB_5580:
	add r14,1
LB_5581:
	cmp r14,r10
	jge LB_5582
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5580
	cmp al,10
	jz LB_5580
	cmp al,32
	jz LB_5580
LB_5582:
	push r10
	call NS_E_1396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5583
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5577
LB_5583:
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
	jc LB_5578
	btr r12,0
	clc
	jmp LB_5579
LB_5578:
	bts r12,0
	stc
LB_5579:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5574
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1504 %_5305 ⊢ %_5306 : %_5306
 ; {>  %_5305~0':_stg }
; _f1504 0' ⊢ °3◂0'
; _some %_5306 ⊢ %_5307 : %_5307
 ; {>  %_5306~°3◂0':(_p1500)◂(_stg) }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_5307
 ; {>  %_5307~°0◂°3◂0':(_opn)◂((_p1500)◂(_stg)) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5572
	btr r12,3
	jmp LB_5573
LB_5572:
	bts r12,3
LB_5573:
	mov rsi,1
	bt r12,3
	jc LB_5570
	mov rsi,0
	bt r9,0
	jc LB_5570
	jmp LB_5571
LB_5570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5571:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5574:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5576
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5575
LB_5576:
	add rsp,8
	ret
LB_5577:
	add rsp,16
	pop r14
LB_5575:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	jmp LB_5594
LB_5593:
	add r14,1
LB_5594:
	cmp r14,r10
	jge LB_5595
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5593
	cmp al,10
	jz LB_5593
	cmp al,32
	jz LB_5593
LB_5595:
	add r14,1
	cmp r14,r10
	jg LB_5598
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5598
	jmp LB_5599
LB_5598:
	jmp LB_5590
LB_5599:
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
	jc LB_5591
	btr r12,0
	clc
	jmp LB_5592
LB_5591:
	bts r12,0
	stc
LB_5592:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5587
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1503 {  } ⊢ %_5308 : %_5308
 ; {>  }
; _f1503 {  } ⊢ °2◂{  }
; _some %_5308 ⊢ %_5309 : %_5309
 ; {>  %_5308~°2◂{  }:(_p1500)◂(t2171'(0)) }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5309
 ; {>  %_5309~°0◂°2◂{  }:(_opn)◂((_p1500)◂(t2174'(0))) }
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
	jc LB_5585
	mov rsi,0
	bt r9,0
	jc LB_5585
	jmp LB_5586
LB_5585:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5586:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5587:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5589
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5588
LB_5589:
	add rsp,8
	ret
LB_5590:
	add rsp,16
	pop r14
LB_5588:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5600:
NS_E_RDI_5600:
NS_E_5600_ETR_TBL:
NS_E_5600_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5646
LB_5645:
	add r14,1
LB_5646:
	cmp r14,r10
	jge LB_5647
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5645
	cmp al,10
	jz LB_5645
	cmp al,32
	jz LB_5645
LB_5647:
	add r14,1
	cmp r14,r10
	jg LB_5650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_5650
	jmp LB_5651
LB_5650:
	jmp LB_5638
LB_5651:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_5653
LB_5652:
	add r14,1
LB_5653:
	cmp r14,r10
	jge LB_5654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5652
	cmp al,10
	jz LB_5652
	cmp al,32
	jz LB_5652
LB_5654:
	push r10
	call NS_E_5601_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5655
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5656
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5656:
	jmp LB_5638
LB_5655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_5659
LB_5658:
	add r14,1
LB_5659:
	cmp r14,r10
	jge LB_5660
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5658
	cmp al,10
	jz LB_5658
	cmp al,32
	jz LB_5658
LB_5660:
	add r14,1
	cmp r14,r10
	jg LB_5665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_5665
	jmp LB_5666
LB_5665:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5662
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5662:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5663
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5663:
	jmp LB_5638
LB_5666:
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
	jc LB_5643
	btr r12,2
	clc
	jmp LB_5644
LB_5643:
	bts r12,2
	stc
LB_5644:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5641
	btr r12,1
	clc
	jmp LB_5642
LB_5641:
	bts r12,1
	stc
LB_5642:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5639
	btr r12,0
	clc
	jmp LB_5640
LB_5639:
	bts r12,0
	stc
LB_5640:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5635
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5667
	btr r12,6
	jmp LB_5668
LB_5667:
	bts r12,6
LB_5668:
	mov r13,r14
	bt r12,1
	jc LB_5669
	btr r12,0
	jmp LB_5670
LB_5669:
	bts r12,0
LB_5670:
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
; _f1488 %_5604 ⊢ %_5605 : %_5605
 ; {>  %_5604~0':(_lst)◂((_p1487)◂((_p1494)◂(_stg))) }
; _f1488 0' ⊢ °0◂0'
; _some %_5605 ⊢ %_5606 : %_5606
 ; {>  %_5605~°0◂0':(_p1487)◂((_p1494)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5606
 ; {>  %_5606~°0◂°0◂0':(_opn)◂((_p1487)◂((_p1494)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5633
	btr r12,3
	jmp LB_5634
LB_5633:
	bts r12,3
LB_5634:
	mov rsi,1
	bt r12,3
	jc LB_5631
	mov rsi,0
	bt r9,0
	jc LB_5631
	jmp LB_5632
LB_5631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5632:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5635:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5637
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5636
LB_5637:
	add rsp,8
	ret
LB_5638:
	add rsp,48
	pop r14
LB_5636:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_5682
LB_5681:
	add r14,1
LB_5682:
	cmp r14,r10
	jge LB_5683
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5681
	cmp al,10
	jz LB_5681
	cmp al,32
	jz LB_5681
LB_5683:
	push r10
	call NS_E_5603_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5684
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5678
LB_5684:
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
	jc LB_5679
	btr r12,0
	clc
	jmp LB_5680
LB_5679:
	bts r12,0
	stc
LB_5680:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5675
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1489 %_5607 ⊢ %_5608 : %_5608
 ; {>  %_5607~0':(_p1494)◂(_stg) }
; _f1489 0' ⊢ °1◂0'
; _some %_5608 ⊢ %_5609 : %_5609
 ; {>  %_5608~°1◂0':(_p1487)◂((_p1494)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5609
 ; {>  %_5609~°0◂°1◂0':(_opn)◂((_p1487)◂((_p1494)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5673
	btr r12,3
	jmp LB_5674
LB_5673:
	bts r12,3
LB_5674:
	mov rsi,1
	bt r12,3
	jc LB_5671
	mov rsi,0
	bt r9,0
	jc LB_5671
	jmp LB_5672
LB_5671:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5672:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5675:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5677
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5676
LB_5677:
	add rsp,8
	ret
LB_5678:
	add rsp,16
	pop r14
LB_5676:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5601:
NS_E_RDI_5601:
NS_E_5601_ETR_TBL:
NS_E_5601_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_5705
LB_5704:
	add r14,1
LB_5705:
	cmp r14,r10
	jge LB_5706
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5704
	cmp al,10
	jz LB_5704
	cmp al,32
	jz LB_5704
LB_5706:
	push r10
	call NS_E_5600_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5707
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5699
LB_5707:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_5710
LB_5709:
	add r14,1
LB_5710:
	cmp r14,r10
	jge LB_5711
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5709
	cmp al,10
	jz LB_5709
	cmp al,32
	jz LB_5709
LB_5711:
	push r10
	call NS_E_5601_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5712
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5713
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5713:
	jmp LB_5699
LB_5712:
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
	jc LB_5702
	btr r12,1
	clc
	jmp LB_5703
LB_5702:
	bts r12,1
	stc
LB_5703:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5700
	btr r12,0
	clc
	jmp LB_5701
LB_5700:
	bts r12,0
	stc
LB_5701:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5696
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5610 %_5611 } ⊢ %_5612 : %_5612
 ; {>  %_5611~1':(_lst)◂((_p1487)◂((_p1494)◂(_stg))) %_5610~0':(_p1487)◂((_p1494)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5612 ⊢ %_5613 : %_5613
 ; {>  %_5612~°0◂{ 0' 1' }:(_lst)◂((_p1487)◂((_p1494)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5613
 ; {>  %_5613~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1487)◂((_p1494)◂(_stg)))) }
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
	jc LB_5690
	btr r12,2
	jmp LB_5691
LB_5690:
	bts r12,2
LB_5691:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5688
	btr QWORD [rdi],0
	jmp LB_5689
LB_5688:
	bts QWORD [rdi],0
LB_5689:
	mov r8,r14
	bt r12,1
	jc LB_5694
	btr r12,2
	jmp LB_5695
LB_5694:
	bts r12,2
LB_5695:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5692
	btr QWORD [rdi],1
	jmp LB_5693
LB_5692:
	bts QWORD [rdi],1
LB_5693:
	mov rsi,1
	bt r12,3
	jc LB_5686
	mov rsi,0
	bt r9,0
	jc LB_5686
	jmp LB_5687
LB_5686:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5687:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5696:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5698
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5697
LB_5698:
	add rsp,8
	ret
LB_5699:
	add rsp,32
	pop r14
LB_5697:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5717
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5614 : %_5614
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5614 ⊢ %_5615 : %_5615
 ; {>  %_5614~°1◂{  }:(_lst)◂(t2266'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5615
 ; {>  %_5615~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2269'(0))) }
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
	jc LB_5715
	mov rsi,0
	bt r9,0
	jc LB_5715
	jmp LB_5716
LB_5715:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5716:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5717:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5719
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5718
LB_5719:
	add rsp,8
	ret
LB_5720:
	add rsp,0
	pop r14
LB_5718:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5602:
NS_E_RDI_5602:
NS_E_5602_ETR_TBL:
NS_E_5602_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_5756
LB_5755:
	add r14,1
LB_5756:
	cmp r14,r10
	jge LB_5757
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5755
	cmp al,10
	jz LB_5755
	cmp al,32
	jz LB_5755
LB_5757:
	add r14,1
	cmp r14,r10
	jg LB_5760
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_5760
	jmp LB_5761
LB_5760:
	jmp LB_5734
LB_5761:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_5743
LB_5742:
	add r14,1
LB_5743:
	cmp r14,r10
	jge LB_5744
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5742
	cmp al,10
	jz LB_5742
	cmp al,32
	jz LB_5742
LB_5744:
	push r10
	call NS_E_5603_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5745
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5746
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5746:
	jmp LB_5735
LB_5745:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_5749
LB_5748:
	add r14,1
LB_5749:
	cmp r14,r10
	jge LB_5750
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5748
	cmp al,10
	jz LB_5748
	cmp al,32
	jz LB_5748
LB_5750:
	push r10
	call NS_E_5602_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5751
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5752
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5752:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5753
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5753:
	jmp LB_5735
LB_5751:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5740
	btr r12,2
	clc
	jmp LB_5741
LB_5740:
	bts r12,2
	stc
LB_5741:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5738
	btr r12,1
	clc
	jmp LB_5739
LB_5738:
	bts r12,1
	stc
LB_5739:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5736
	btr r12,0
	clc
	jmp LB_5737
LB_5736:
	bts r12,0
	stc
LB_5737:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5731
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5762
	btr r12,3
	jmp LB_5763
LB_5762:
	bts r12,3
LB_5763:
	mov r14,r8
	bt r12,2
	jc LB_5764
	btr r12,1
	jmp LB_5765
LB_5764:
	bts r12,1
LB_5765:
	mov r8,r13
	bt r12,0
	jc LB_5766
	btr r12,2
	jmp LB_5767
LB_5766:
	bts r12,2
LB_5767:
	mov r13,r9
	bt r12,3
	jc LB_5768
	btr r12,0
	jmp LB_5769
LB_5768:
	bts r12,0
LB_5769:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5616 %_5617 } ⊢ %_5618 : %_5618
 ; {>  %_5616~0':(_p1494)◂(_stg) %_5617~1':(_lst)◂((_p1494)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5618 ⊢ %_5619 : %_5619
 ; {>  %_5618~°0◂{ 0' 1' }:(_lst)◂((_p1494)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5619
 ; {>  %_5619~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1494)◂(_stg))) }
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
	jc LB_5725
	btr r12,2
	jmp LB_5726
LB_5725:
	bts r12,2
LB_5726:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5723
	btr QWORD [rdi],0
	jmp LB_5724
LB_5723:
	bts QWORD [rdi],0
LB_5724:
	mov r8,r14
	bt r12,1
	jc LB_5729
	btr r12,2
	jmp LB_5730
LB_5729:
	bts r12,2
LB_5730:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5727
	btr QWORD [rdi],1
	jmp LB_5728
LB_5727:
	bts QWORD [rdi],1
LB_5728:
	mov rsi,1
	bt r12,3
	jc LB_5721
	mov rsi,0
	bt r9,0
	jc LB_5721
	jmp LB_5722
LB_5721:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5722:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5731:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5733
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5732
LB_5733:
	add rsp,8
	ret
LB_5735:
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
LB_5734:
	add rsp,48
	pop r14
LB_5732:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5772
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5620 : %_5620
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5620 ⊢ %_5621 : %_5621
 ; {>  %_5620~°1◂{  }:(_lst)◂(t2279'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5621
 ; {>  %_5621~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2282'(0))) }
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
	jc LB_5770
	mov rsi,0
	bt r9,0
	jc LB_5770
	jmp LB_5771
LB_5770:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5771:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5772:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5774
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5773
LB_5774:
	add rsp,8
	ret
LB_5775:
	add rsp,0
	pop r14
LB_5773:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5603:
NS_E_RDI_5603:
NS_E_5603_ETR_TBL:
NS_E_5603_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_5791
LB_5790:
	add r14,1
LB_5791:
	cmp r14,r10
	jge LB_5792
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5790
	cmp al,10
	jz LB_5790
	cmp al,32
	jz LB_5790
LB_5792:
	add r14,2
	cmp r14,r10
	jg LB_5795
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_5795
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_5795
	jmp LB_5796
LB_5795:
	jmp LB_5783
LB_5796:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_5798
LB_5797:
	add r14,1
LB_5798:
	cmp r14,r10
	jge LB_5799
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5797
	cmp al,10
	jz LB_5797
	cmp al,32
	jz LB_5797
LB_5799:
	push r10
	call NS_E_5144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5800
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5801
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5801:
	jmp LB_5783
LB_5800:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_5804
LB_5803:
	add r14,1
LB_5804:
	cmp r14,r10
	jge LB_5805
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5803
	cmp al,10
	jz LB_5803
	cmp al,32
	jz LB_5803
LB_5805:
	add r14,1
	cmp r14,r10
	jg LB_5810
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_5810
	jmp LB_5811
LB_5810:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5807
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5807:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5808
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5808:
	jmp LB_5783
LB_5811:
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
	jc LB_5788
	btr r12,2
	clc
	jmp LB_5789
LB_5788:
	bts r12,2
	stc
LB_5789:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5786
	btr r12,1
	clc
	jmp LB_5787
LB_5786:
	bts r12,1
	stc
LB_5787:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5784
	btr r12,0
	clc
	jmp LB_5785
LB_5784:
	bts r12,0
	stc
LB_5785:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5780
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5812
	btr r12,6
	jmp LB_5813
LB_5812:
	bts r12,6
LB_5813:
	mov r13,r14
	bt r12,1
	jc LB_5814
	btr r12,0
	jmp LB_5815
LB_5814:
	bts r12,0
LB_5815:
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
; _f1496 %_5622 ⊢ %_5623 : %_5623
 ; {>  %_5622~0':_p1490 }
; _f1496 0' ⊢ °0◂0'
; _some %_5623 ⊢ %_5624 : %_5624
 ; {>  %_5623~°0◂0':(_p1494)◂(t2287'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5624
 ; {>  %_5624~°0◂°0◂0':(_opn)◂((_p1494)◂(t2290'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5778
	btr r12,3
	jmp LB_5779
LB_5778:
	bts r12,3
LB_5779:
	mov rsi,1
	bt r12,3
	jc LB_5776
	mov rsi,0
	bt r9,0
	jc LB_5776
	jmp LB_5777
LB_5776:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5777:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5780:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5782
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5781
LB_5782:
	add rsp,8
	ret
LB_5783:
	add rsp,48
	pop r14
LB_5781:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_5840
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_5840
	jmp LB_5841
LB_5840:
	jmp LB_5823
LB_5841:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_1396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5832
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5833
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5833:
	jmp LB_5824
LB_5832:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5827
	btr r12,1
	clc
	jmp LB_5828
LB_5827:
	bts r12,1
	stc
LB_5828:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5825
	btr r12,0
	clc
	jmp LB_5826
LB_5825:
	bts r12,0
	stc
LB_5826:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5820
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5842
	btr r12,2
	jmp LB_5843
LB_5842:
	bts r12,2
LB_5843:
	mov r13,r14
	bt r12,1
	jc LB_5844
	btr r12,0
	jmp LB_5845
LB_5844:
	bts r12,0
LB_5845:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1497 %_5625 ⊢ %_5626 : %_5626
 ; {>  %_5625~0':_stg }
; _f1497 0' ⊢ °1◂0'
; _some %_5626 ⊢ %_5627 : %_5627
 ; {>  %_5626~°1◂0':(_p1494)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5627
 ; {>  %_5627~°0◂°1◂0':(_opn)◂((_p1494)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5818
	btr r12,3
	jmp LB_5819
LB_5818:
	bts r12,3
LB_5819:
	mov rsi,1
	bt r12,3
	jc LB_5816
	mov rsi,0
	bt r9,0
	jc LB_5816
	jmp LB_5817
LB_5816:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5817:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5820:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5822
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5821
LB_5822:
	add rsp,8
	ret
LB_5824:
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
LB_5823:
	add rsp,32
	pop r14
LB_5821:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_5857
LB_5856:
	add r14,1
LB_5857:
	cmp r14,r10
	jge LB_5858
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5856
	cmp al,10
	jz LB_5856
	cmp al,32
	jz LB_5856
LB_5858:
	push r10
	call NS_E_1396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5859
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5853
LB_5859:
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
	jc LB_5854
	btr r12,0
	clc
	jmp LB_5855
LB_5854:
	bts r12,0
	stc
LB_5855:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5850
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1497 %_5628 ⊢ %_5629 : %_5629
 ; {>  %_5628~0':_stg }
; _f1497 0' ⊢ °1◂0'
; _some %_5629 ⊢ %_5630 : %_5630
 ; {>  %_5629~°1◂0':(_p1494)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5630
 ; {>  %_5630~°0◂°1◂0':(_opn)◂((_p1494)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5848
	btr r12,3
	jmp LB_5849
LB_5848:
	bts r12,3
LB_5849:
	mov rsi,1
	bt r12,3
	jc LB_5846
	mov rsi,0
	bt r9,0
	jc LB_5846
	jmp LB_5847
LB_5846:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5847:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5850:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5852
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5851
LB_5852:
	add rsp,8
	ret
LB_5853:
	add rsp,16
	pop r14
LB_5851:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5861:
NS_E_RDI_5861:
NS_E_5861_ETR_TBL:
NS_E_5861_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5913
LB_5912:
	add r14,1
LB_5913:
	cmp r14,r10
	jge LB_5914
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5912
	cmp al,10
	jz LB_5912
	cmp al,32
	jz LB_5912
LB_5914:
	add r14,1
	cmp r14,r10
	jg LB_5917
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_5917
	jmp LB_5918
LB_5917:
	jmp LB_5905
LB_5918:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_5920
LB_5919:
	add r14,1
LB_5920:
	cmp r14,r10
	jge LB_5921
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5919
	cmp al,10
	jz LB_5919
	cmp al,32
	jz LB_5919
LB_5921:
	push r10
	call NS_E_5862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5922
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5923
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5923:
	jmp LB_5905
LB_5922:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_5926
LB_5925:
	add r14,1
LB_5926:
	cmp r14,r10
	jge LB_5927
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5925
	cmp al,10
	jz LB_5925
	cmp al,32
	jz LB_5925
LB_5927:
	add r14,1
	cmp r14,r10
	jg LB_5932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_5932
	jmp LB_5933
LB_5932:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5929
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5929:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5930
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5930:
	jmp LB_5905
LB_5933:
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
	jc LB_5910
	btr r12,2
	clc
	jmp LB_5911
LB_5910:
	bts r12,2
	stc
LB_5911:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5908
	btr r12,1
	clc
	jmp LB_5909
LB_5908:
	bts r12,1
	stc
LB_5909:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5906
	btr r12,0
	clc
	jmp LB_5907
LB_5906:
	bts r12,0
	stc
LB_5907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5902
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_5934
	btr r12,6
	jmp LB_5935
LB_5934:
	bts r12,6
LB_5935:
	mov r13,r14
	bt r12,1
	jc LB_5936
	btr r12,0
	jmp LB_5937
LB_5936:
	bts r12,0
LB_5937:
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
; _f1488 %_5866 ⊢ %_5867 : %_5867
 ; {>  %_5866~0':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) }
; _f1488 0' ⊢ °0◂0'
; _some %_5867 ⊢ %_5868 : %_5868
 ; {>  %_5867~°0◂0':(_p1487)◂((_p1495)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5868
 ; {>  %_5868~°0◂°0◂0':(_opn)◂((_p1487)◂((_p1495)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5900
	btr r12,3
	jmp LB_5901
LB_5900:
	bts r12,3
LB_5901:
	mov rsi,1
	bt r12,3
	jc LB_5898
	mov rsi,0
	bt r9,0
	jc LB_5898
	jmp LB_5899
LB_5898:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5899:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5904
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5903
LB_5904:
	add rsp,8
	ret
LB_5905:
	add rsp,48
	pop r14
LB_5903:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_5949
LB_5948:
	add r14,1
LB_5949:
	cmp r14,r10
	jge LB_5950
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5948
	cmp al,10
	jz LB_5948
	cmp al,32
	jz LB_5948
LB_5950:
	push r10
	call NS_E_5865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5951
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5945
LB_5951:
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
	jc LB_5946
	btr r12,0
	clc
	jmp LB_5947
LB_5946:
	bts r12,0
	stc
LB_5947:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5942
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1489 %_5869 ⊢ %_5870 : %_5870
 ; {>  %_5869~0':(_p1495)◂(_stg) }
; _f1489 0' ⊢ °1◂0'
; _some %_5870 ⊢ %_5871 : %_5871
 ; {>  %_5870~°1◂0':(_p1487)◂((_p1495)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5871
 ; {>  %_5871~°0◂°1◂0':(_opn)◂((_p1487)◂((_p1495)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5940
	btr r12,3
	jmp LB_5941
LB_5940:
	bts r12,3
LB_5941:
	mov rsi,1
	bt r12,3
	jc LB_5938
	mov rsi,0
	bt r9,0
	jc LB_5938
	jmp LB_5939
LB_5938:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5939:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5942:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5944
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5943
LB_5944:
	add rsp,8
	ret
LB_5945:
	add rsp,16
	pop r14
LB_5943:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5862:
NS_E_RDI_5862:
NS_E_5862_ETR_TBL:
NS_E_5862_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_5972
LB_5971:
	add r14,1
LB_5972:
	cmp r14,r10
	jge LB_5973
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5971
	cmp al,10
	jz LB_5971
	cmp al,32
	jz LB_5971
LB_5973:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5974
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5966
LB_5974:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_5977
LB_5976:
	add r14,1
LB_5977:
	cmp r14,r10
	jge LB_5978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5976
	cmp al,10
	jz LB_5976
	cmp al,32
	jz LB_5976
LB_5978:
	push r10
	call NS_E_5862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5979
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5980
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5980:
	jmp LB_5966
LB_5979:
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
	jc LB_5969
	btr r12,1
	clc
	jmp LB_5970
LB_5969:
	bts r12,1
	stc
LB_5970:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5967
	btr r12,0
	clc
	jmp LB_5968
LB_5967:
	bts r12,0
	stc
LB_5968:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5963
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_5872 %_5873 } ⊢ %_5874 : %_5874
 ; {>  %_5873~1':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) %_5872~0':(_p1487)◂((_p1495)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5874 ⊢ %_5875 : %_5875
 ; {>  %_5874~°0◂{ 0' 1' }:(_lst)◂((_p1487)◂((_p1495)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5875
 ; {>  %_5875~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1487)◂((_p1495)◂(_stg)))) }
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
	jc LB_5957
	btr r12,2
	jmp LB_5958
LB_5957:
	bts r12,2
LB_5958:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5955
	btr QWORD [rdi],0
	jmp LB_5956
LB_5955:
	bts QWORD [rdi],0
LB_5956:
	mov r8,r14
	bt r12,1
	jc LB_5961
	btr r12,2
	jmp LB_5962
LB_5961:
	bts r12,2
LB_5962:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5959
	btr QWORD [rdi],1
	jmp LB_5960
LB_5959:
	bts QWORD [rdi],1
LB_5960:
	mov rsi,1
	bt r12,3
	jc LB_5953
	mov rsi,0
	bt r9,0
	jc LB_5953
	jmp LB_5954
LB_5953:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5954:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5963:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5965
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5964
LB_5965:
	add rsp,8
	ret
LB_5966:
	add rsp,32
	pop r14
LB_5964:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_5984
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5876 : %_5876
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5876 ⊢ %_5877 : %_5877
 ; {>  %_5876~°1◂{  }:(_lst)◂(t2379'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5877
 ; {>  %_5877~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2382'(0))) }
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
	jc LB_5982
	mov rsi,0
	bt r9,0
	jc LB_5982
	jmp LB_5983
LB_5982:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5983:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5984:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5986
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5985
LB_5986:
	add rsp,8
	ret
LB_5987:
	add rsp,0
	pop r14
LB_5985:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5863:
NS_E_RDI_5863:
NS_E_5863_ETR_TBL:
NS_E_5863_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_6023
LB_6022:
	add r14,1
LB_6023:
	cmp r14,r10
	jge LB_6024
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6022
	cmp al,10
	jz LB_6022
	cmp al,32
	jz LB_6022
LB_6024:
	add r14,1
	cmp r14,r10
	jg LB_6027
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_6027
	jmp LB_6028
LB_6027:
	jmp LB_6001
LB_6028:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_6010
LB_6009:
	add r14,1
LB_6010:
	cmp r14,r10
	jge LB_6011
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6009
	cmp al,10
	jz LB_6009
	cmp al,32
	jz LB_6009
LB_6011:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6012
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6013
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6013:
	jmp LB_6002
LB_6012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_6016
LB_6015:
	add r14,1
LB_6016:
	cmp r14,r10
	jge LB_6017
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6015
	cmp al,10
	jz LB_6015
	cmp al,32
	jz LB_6015
LB_6017:
	push r10
	call NS_E_5863_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6018
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6019
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6019:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6020
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6020:
	jmp LB_6002
LB_6018:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6007
	btr r12,2
	clc
	jmp LB_6008
LB_6007:
	bts r12,2
	stc
LB_6008:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6005
	btr r12,1
	clc
	jmp LB_6006
LB_6005:
	bts r12,1
	stc
LB_6006:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6003
	btr r12,0
	clc
	jmp LB_6004
LB_6003:
	bts r12,0
	stc
LB_6004:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5998
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6029
	btr r12,3
	jmp LB_6030
LB_6029:
	bts r12,3
LB_6030:
	mov r14,r8
	bt r12,2
	jc LB_6031
	btr r12,1
	jmp LB_6032
LB_6031:
	bts r12,1
LB_6032:
	mov r8,r13
	bt r12,0
	jc LB_6033
	btr r12,2
	jmp LB_6034
LB_6033:
	bts r12,2
LB_6034:
	mov r13,r9
	bt r12,3
	jc LB_6035
	btr r12,0
	jmp LB_6036
LB_6035:
	bts r12,0
LB_6036:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5878 %_5879 } ⊢ %_5880 : %_5880
 ; {>  %_5879~1':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) %_5878~0':(_p1487)◂((_p1495)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5880 ⊢ %_5881 : %_5881
 ; {>  %_5880~°0◂{ 0' 1' }:(_lst)◂((_p1487)◂((_p1495)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5881
 ; {>  %_5881~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1487)◂((_p1495)◂(_stg)))) }
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
	jc LB_5992
	btr r12,2
	jmp LB_5993
LB_5992:
	bts r12,2
LB_5993:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5990
	btr QWORD [rdi],0
	jmp LB_5991
LB_5990:
	bts QWORD [rdi],0
LB_5991:
	mov r8,r14
	bt r12,1
	jc LB_5996
	btr r12,2
	jmp LB_5997
LB_5996:
	bts r12,2
LB_5997:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5994
	btr QWORD [rdi],1
	jmp LB_5995
LB_5994:
	bts QWORD [rdi],1
LB_5995:
	mov rsi,1
	bt r12,3
	jc LB_5988
	mov rsi,0
	bt r9,0
	jc LB_5988
	jmp LB_5989
LB_5988:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5989:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5998:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6000
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5999
LB_6000:
	add rsp,8
	ret
LB_6002:
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
LB_6001:
	add rsp,48
	pop r14
LB_5999:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6039
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5882 : %_5882
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5882 ⊢ %_5883 : %_5883
 ; {>  %_5882~°1◂{  }:(_lst)◂(t2392'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5883
 ; {>  %_5883~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2395'(0))) }
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
	jc LB_6037
	mov rsi,0
	bt r9,0
	jc LB_6037
	jmp LB_6038
LB_6037:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6038:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6040
LB_6041:
	add rsp,8
	ret
LB_6042:
	add rsp,0
	pop r14
LB_6040:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5864:
NS_E_RDI_5864:
NS_E_5864_ETR_TBL:
NS_E_5864_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_6078
LB_6077:
	add r14,1
LB_6078:
	cmp r14,r10
	jge LB_6079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6077
	cmp al,10
	jz LB_6077
	cmp al,32
	jz LB_6077
LB_6079:
	add r14,1
	cmp r14,r10
	jg LB_6082
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_6082
	jmp LB_6083
LB_6082:
	jmp LB_6056
LB_6083:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_6065
LB_6064:
	add r14,1
LB_6065:
	cmp r14,r10
	jge LB_6066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6064
	cmp al,10
	jz LB_6064
	cmp al,32
	jz LB_6064
LB_6066:
	push r10
	call NS_E_5865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6067
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6068
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6068:
	jmp LB_6057
LB_6067:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_6071
LB_6070:
	add r14,1
LB_6071:
	cmp r14,r10
	jge LB_6072
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6070
	cmp al,10
	jz LB_6070
	cmp al,32
	jz LB_6070
LB_6072:
	push r10
	call NS_E_5864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6073
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6074
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6074:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6075
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6075:
	jmp LB_6057
LB_6073:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6062
	btr r12,2
	clc
	jmp LB_6063
LB_6062:
	bts r12,2
	stc
LB_6063:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6060
	btr r12,1
	clc
	jmp LB_6061
LB_6060:
	bts r12,1
	stc
LB_6061:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6058
	btr r12,0
	clc
	jmp LB_6059
LB_6058:
	bts r12,0
	stc
LB_6059:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6053
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6084
	btr r12,3
	jmp LB_6085
LB_6084:
	bts r12,3
LB_6085:
	mov r14,r8
	bt r12,2
	jc LB_6086
	btr r12,1
	jmp LB_6087
LB_6086:
	bts r12,1
LB_6087:
	mov r8,r13
	bt r12,0
	jc LB_6088
	btr r12,2
	jmp LB_6089
LB_6088:
	bts r12,2
LB_6089:
	mov r13,r9
	bt r12,3
	jc LB_6090
	btr r12,0
	jmp LB_6091
LB_6090:
	bts r12,0
LB_6091:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5884 %_5885 } ⊢ %_5886 : %_5886
 ; {>  %_5885~1':(_lst)◂((_p1495)◂(_stg)) %_5884~0':(_p1495)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5886 ⊢ %_5887 : %_5887
 ; {>  %_5886~°0◂{ 0' 1' }:(_lst)◂((_p1495)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5887
 ; {>  %_5887~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1495)◂(_stg))) }
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
	jc LB_6047
	btr r12,2
	jmp LB_6048
LB_6047:
	bts r12,2
LB_6048:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6045
	btr QWORD [rdi],0
	jmp LB_6046
LB_6045:
	bts QWORD [rdi],0
LB_6046:
	mov r8,r14
	bt r12,1
	jc LB_6051
	btr r12,2
	jmp LB_6052
LB_6051:
	bts r12,2
LB_6052:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6049
	btr QWORD [rdi],1
	jmp LB_6050
LB_6049:
	bts QWORD [rdi],1
LB_6050:
	mov rsi,1
	bt r12,3
	jc LB_6043
	mov rsi,0
	bt r9,0
	jc LB_6043
	jmp LB_6044
LB_6043:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6044:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6053:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6055
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6054
LB_6055:
	add rsp,8
	ret
LB_6057:
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
LB_6056:
	add rsp,48
	pop r14
LB_6054:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6094
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_5888 : %_5888
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5888 ⊢ %_5889 : %_5889
 ; {>  %_5888~°1◂{  }:(_lst)◂(t2405'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5889
 ; {>  %_5889~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2408'(0))) }
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
	jc LB_6092
	mov rsi,0
	bt r9,0
	jc LB_6092
	jmp LB_6093
LB_6092:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6093:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6094:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6096
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6095
LB_6096:
	add rsp,8
	ret
LB_6097:
	add rsp,0
	pop r14
LB_6095:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5865:
NS_E_RDI_5865:
NS_E_5865_ETR_TBL:
NS_E_5865_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_6122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_6122
	jmp LB_6123
LB_6122:
	jmp LB_6105
LB_6123:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6114
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6115
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6115:
	jmp LB_6106
LB_6114:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6109
	btr r12,1
	clc
	jmp LB_6110
LB_6109:
	bts r12,1
	stc
LB_6110:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6107
	btr r12,0
	clc
	jmp LB_6108
LB_6107:
	bts r12,0
	stc
LB_6108:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6102
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6124
	btr r12,2
	jmp LB_6125
LB_6124:
	bts r12,2
LB_6125:
	mov r13,r14
	bt r12,1
	jc LB_6126
	btr r12,0
	jmp LB_6127
LB_6126:
	bts r12,0
LB_6127:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1499 %_5890 ⊢ %_5891 : %_5891
 ; {>  %_5890~0':_stg }
; _f1499 0' ⊢ °1◂0'
; _some %_5891 ⊢ %_5892 : %_5892
 ; {>  %_5891~°1◂0':(_p1495)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5892
 ; {>  %_5892~°0◂°1◂0':(_opn)◂((_p1495)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6100
	btr r12,3
	jmp LB_6101
LB_6100:
	bts r12,3
LB_6101:
	mov rsi,1
	bt r12,3
	jc LB_6098
	mov rsi,0
	bt r9,0
	jc LB_6098
	jmp LB_6099
LB_6098:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6099:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6102:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6104
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6103
LB_6104:
	add rsp,8
	ret
LB_6106:
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
LB_6105:
	add rsp,32
	pop r14
LB_6103:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6141
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6135
LB_6141:
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
	jc LB_6136
	btr r12,0
	clc
	jmp LB_6137
LB_6136:
	bts r12,0
	stc
LB_6137:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6132
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1499 %_5893 ⊢ %_5894 : %_5894
 ; {>  %_5893~0':_stg }
; _f1499 0' ⊢ °1◂0'
; _some %_5894 ⊢ %_5895 : %_5895
 ; {>  %_5894~°1◂0':(_p1495)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5895
 ; {>  %_5895~°0◂°1◂0':(_opn)◂((_p1495)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6130
	btr r12,3
	jmp LB_6131
LB_6130:
	bts r12,3
LB_6131:
	mov rsi,1
	bt r12,3
	jc LB_6128
	mov rsi,0
	bt r9,0
	jc LB_6128
	jmp LB_6129
LB_6128:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6129:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6132:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6134
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6133
LB_6134:
	add rsp,8
	ret
LB_6135:
	add rsp,16
	pop r14
LB_6133:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_6156
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_6156
	jmp LB_6157
LB_6156:
	jmp LB_6148
LB_6157:
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
	jc LB_6149
	btr r12,0
	clc
	jmp LB_6150
LB_6149:
	bts r12,0
	stc
LB_6150:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6145
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1498 {  } ⊢ %_5896 : %_5896
 ; {>  }
; _f1498 {  } ⊢ °0◂{  }
; _some %_5896 ⊢ %_5897 : %_5897
 ; {>  %_5896~°0◂{  }:(_p1495)◂(t2422'(0)) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5897
 ; {>  %_5897~°0◂°0◂{  }:(_opn)◂((_p1495)◂(t2425'(0))) }
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
	jc LB_6143
	mov rsi,0
	bt r9,0
	jc LB_6143
	jmp LB_6144
LB_6143:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6144:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6145:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6147
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6146
LB_6147:
	add rsp,8
	ret
LB_6148:
	add rsp,16
	pop r14
LB_6146:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6158:
NS_E_RDI_6158:
NS_E_6158_ETR_TBL:
NS_E_6158_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_6236
LB_6235:
	add r14,1
LB_6236:
	cmp r14,r10
	jge LB_6237
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6235
	cmp al,10
	jz LB_6235
	cmp al,32
	jz LB_6235
LB_6237:
	push r10
	call NS_E_6161_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6238
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6228
LB_6238:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_6241
LB_6240:
	add r14,1
LB_6241:
	cmp r14,r10
	jge LB_6242
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6240
	cmp al,10
	jz LB_6240
	cmp al,32
	jz LB_6240
LB_6242:
	push r10
	call NS_E_6160_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6243
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6244
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6244:
	jmp LB_6228
LB_6243:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_6247
LB_6246:
	add r14,1
LB_6247:
	cmp r14,r10
	jge LB_6248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6246
	cmp al,10
	jz LB_6246
	cmp al,32
	jz LB_6246
LB_6248:
	push r10
	call NS_E_6159_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6249
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6250
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6250:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6251
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6251:
	jmp LB_6228
LB_6249:
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
	jc LB_6233
	btr r12,2
	clc
	jmp LB_6234
LB_6233:
	bts r12,2
	stc
LB_6234:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6231
	btr r12,1
	clc
	jmp LB_6232
LB_6231:
	bts r12,1
	stc
LB_6232:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6229
	btr r12,0
	clc
	jmp LB_6230
LB_6229:
	bts r12,0
	stc
LB_6230:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6225
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	bts r12,3
	bts r12,4
	bts r12,5
; _f5237 { %_6163 %_6164 } ⊢ %_6166 : %_6166
 ; {>  %_6165~2':(_opn)◂(_p1551) %_6164~1':(_lst)◂(_p1551) %_6163~0':_p1551 }
; _f5237 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_5237
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6196
	btr r12,2
	clc
	jmp LB_6197
LB_6196:
	bts r12,2
	stc
LB_6197:
	add rsp,16
MTC_LB_6198:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6199
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
	jnc LB_6200
	bt QWORD [rdi],0
	jc LB_6201
	btr r12,3
	clc
	jmp LB_6202
LB_6201:
	bts r12,3
	stc
LB_6202:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6200:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_6203
	btr r12,1
	jmp LB_6204
LB_6203:
	bts r12,1
LB_6204:
LB_6205:
	cmp r15,0
	jz LB_6206
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6205
LB_6206:
; _f1584 { %_6166 %_6167 } ⊢ %_6168 : %_6168
 ; {>  %_6167~1':_p1551 %_6166~0':_p1551 }
; _f1584 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_6168 ⊢ %_6169 : %_6169
 ; {>  %_6168~°1◂{ 0' 1' }:_p1551 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_6169
 ; {>  %_6169~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1551) }
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
	jc LB_6211
	btr r12,2
	jmp LB_6212
LB_6211:
	bts r12,2
LB_6212:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6209
	btr QWORD [rdi],0
	jmp LB_6210
LB_6209:
	bts QWORD [rdi],0
LB_6210:
	mov r8,r14
	bt r12,1
	jc LB_6215
	btr r12,2
	jmp LB_6216
LB_6215:
	bts r12,2
LB_6216:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6213
	btr QWORD [rdi],1
	jmp LB_6214
LB_6213:
	bts QWORD [rdi],1
LB_6214:
	mov rsi,1
	bt r12,3
	jc LB_6207
	mov rsi,0
	bt r9,0
	jc LB_6207
	jmp LB_6208
LB_6207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6208:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_6199:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6217
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
	jnc LB_6218
	bt QWORD [rdi],0
	jc LB_6219
	btr r12,1
	clc
	jmp LB_6220
LB_6219:
	bts r12,1
	stc
LB_6220:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6218:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6221:
	cmp r15,0
	jz LB_6222
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6221
LB_6222:
; _some %_6166 ⊢ %_6170 : %_6170
 ; {>  %_6166~0':_p1551 }
; _some 0' ⊢ °0◂0'
; ∎ %_6170
 ; {>  %_6170~°0◂0':(_opn)◂(_p1551) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6223
	btr r12,3
	jmp LB_6224
LB_6223:
	bts r12,3
LB_6224:
	mov r8,0
	bts r12,2
	ret
MTC_LB_6217:
LB_6225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6227
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6226
LB_6227:
	add rsp,8
	ret
LB_6228:
	add rsp,48
	pop r14
LB_6226:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6159:
NS_E_RDI_6159:
NS_E_6159_ETR_TBL:
NS_E_6159_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
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
	add r14,3
	cmp r14,r10
	jg LB_6270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_6270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_6270
	jmp LB_6271
LB_6270:
	jmp LB_6260
LB_6271:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_6273
LB_6272:
	add r14,1
LB_6273:
	cmp r14,r10
	jge LB_6274
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6272
	cmp al,10
	jz LB_6272
	cmp al,32
	jz LB_6272
LB_6274:
	push r10
	call NS_E_6158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6275
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6276
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6276:
	jmp LB_6260
LB_6275:
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
	jc LB_6263
	btr r12,1
	clc
	jmp LB_6264
LB_6263:
	bts r12,1
	stc
LB_6264:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6261
	btr r12,0
	clc
	jmp LB_6262
LB_6261:
	bts r12,0
	stc
LB_6262:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6257
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_6278
	btr r12,5
	jmp LB_6279
LB_6278:
	bts r12,5
LB_6279:
	mov r13,r14
	bt r12,1
	jc LB_6280
	btr r12,0
	jmp LB_6281
LB_6280:
	bts r12,0
LB_6281:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_6171 ⊢ %_6172 : %_6172
 ; {>  %_6171~0':_p1551 }
; _some 0' ⊢ °0◂0'
; _some %_6172 ⊢ %_6173 : %_6173
 ; {>  %_6172~°0◂0':(_opn)◂(_p1551) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6173
 ; {>  %_6173~°0◂°0◂0':(_opn)◂((_opn)◂(_p1551)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6255
	btr r12,3
	jmp LB_6256
LB_6255:
	bts r12,3
LB_6256:
	mov rsi,1
	bt r12,3
	jc LB_6253
	mov rsi,0
	bt r9,0
	jc LB_6253
	jmp LB_6254
LB_6253:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6254:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6257:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6259
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6258
LB_6259:
	add rsp,8
	ret
LB_6260:
	add rsp,32
	pop r14
LB_6258:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6284
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_6174 : %_6174
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_6174 ⊢ %_6175 : %_6175
 ; {>  %_6174~°1◂{  }:(_opn)◂(t2520'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6175
 ; {>  %_6175~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2523'(0))) }
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
	jc LB_6282
	mov rsi,0
	bt r9,0
	jc LB_6282
	jmp LB_6283
LB_6282:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6283:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6284:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6286
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6285
LB_6286:
	add rsp,8
	ret
LB_6287:
	add rsp,0
	pop r14
LB_6285:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6160:
NS_E_RDI_6160:
NS_E_6160_ETR_TBL:
NS_E_6160_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_6309
LB_6308:
	add r14,1
LB_6309:
	cmp r14,r10
	jge LB_6310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6308
	cmp al,10
	jz LB_6308
	cmp al,32
	jz LB_6308
LB_6310:
	add r14,3
	cmp r14,r10
	jg LB_6313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6313
	jmp LB_6314
LB_6313:
	jmp LB_6301
LB_6314:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_6316
LB_6315:
	add r14,1
LB_6316:
	cmp r14,r10
	jge LB_6317
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6315
	cmp al,10
	jz LB_6315
	cmp al,32
	jz LB_6315
LB_6317:
	push r10
	call NS_E_6161_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6318
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6319
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6319:
	jmp LB_6301
LB_6318:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_6322
LB_6321:
	add r14,1
LB_6322:
	cmp r14,r10
	jge LB_6323
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6321
	cmp al,10
	jz LB_6321
	cmp al,32
	jz LB_6321
LB_6323:
	push r10
	call NS_E_6160_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6324
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6325
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6325:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6326
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6326:
	jmp LB_6301
LB_6324:
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
	jc LB_6306
	btr r12,2
	clc
	jmp LB_6307
LB_6306:
	bts r12,2
	stc
LB_6307:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6304
	btr r12,1
	clc
	jmp LB_6305
LB_6304:
	bts r12,1
	stc
LB_6305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6302
	btr r12,0
	clc
	jmp LB_6303
LB_6302:
	bts r12,0
	stc
LB_6303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6298
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov rcx,r14
	bt r12,1
	jc LB_6328
	btr r12,6
	jmp LB_6329
LB_6328:
	bts r12,6
LB_6329:
	mov r14,r8
	bt r12,2
	jc LB_6330
	btr r12,1
	jmp LB_6331
LB_6330:
	bts r12,1
LB_6331:
	mov r8,r13
	bt r12,0
	jc LB_6332
	btr r12,2
	jmp LB_6333
LB_6332:
	bts r12,2
LB_6333:
	mov r13,rcx
	bt r12,6
	jc LB_6334
	btr r12,0
	jmp LB_6335
LB_6334:
	bts r12,0
LB_6335:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _cns { %_6176 %_6177 } ⊢ %_6178 : %_6178
 ; {>  %_6176~0':_p1551 %_6177~1':(_lst)◂(_p1551) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6178 ⊢ %_6179 : %_6179
 ; {>  %_6178~°0◂{ 0' 1' }:(_lst)◂(_p1551) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6179
 ; {>  %_6179~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1551)) }
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
	jc LB_6292
	btr r12,2
	jmp LB_6293
LB_6292:
	bts r12,2
LB_6293:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6290
	btr QWORD [rdi],0
	jmp LB_6291
LB_6290:
	bts QWORD [rdi],0
LB_6291:
	mov r8,r14
	bt r12,1
	jc LB_6296
	btr r12,2
	jmp LB_6297
LB_6296:
	bts r12,2
LB_6297:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6294
	btr QWORD [rdi],1
	jmp LB_6295
LB_6294:
	bts QWORD [rdi],1
LB_6295:
	mov rsi,1
	bt r12,3
	jc LB_6288
	mov rsi,0
	bt r9,0
	jc LB_6288
	jmp LB_6289
LB_6288:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6289:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
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
LB_6301:
	add rsp,48
	pop r14
LB_6299:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6338
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_6180 : %_6180
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_6180 ⊢ %_6181 : %_6181
 ; {>  %_6180~°1◂{  }:(_lst)◂(t2533'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6181
 ; {>  %_6181~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2536'(0))) }
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
	jc LB_6336
	mov rsi,0
	bt r9,0
	jc LB_6336
	jmp LB_6337
LB_6336:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6337:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6338:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6340
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6339
LB_6340:
	add rsp,8
	ret
LB_6341:
	add rsp,0
	pop r14
LB_6339:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6161:
NS_E_RDI_6161:
NS_E_6161_ETR_TBL:
NS_E_6161_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_6357
LB_6356:
	add r14,1
LB_6357:
	cmp r14,r10
	jge LB_6358
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6356
	cmp al,10
	jz LB_6356
	cmp al,32
	jz LB_6356
LB_6358:
	add r14,1
	cmp r14,r10
	jg LB_6361
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_6361
	jmp LB_6362
LB_6361:
	jmp LB_6349
LB_6362:
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
LB_6367:
	jmp LB_6364
LB_6363:
	add r14,1
LB_6364:
	cmp r14,r10
	jge LB_6365
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6363
	cmp al,10
	jz LB_6363
	cmp al,32
	jz LB_6363
LB_6365:
	push r10
	push rsi
	call NS_E_6158_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6366
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6368
	bts QWORD [rax],0
LB_6368:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6367
LB_6366:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_6370
LB_6369:
	add r14,1
LB_6370:
	cmp r14,r10
	jge LB_6371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6369
	cmp al,10
	jz LB_6369
	cmp al,32
	jz LB_6369
LB_6371:
	add r14,1
	cmp r14,r10
	jg LB_6376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_6376
	jmp LB_6377
LB_6376:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6373
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6373:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6374
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6374:
	jmp LB_6349
LB_6377:
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
	jc LB_6354
	btr r12,2
	clc
	jmp LB_6355
LB_6354:
	bts r12,2
	stc
LB_6355:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6352
	btr r12,1
	clc
	jmp LB_6353
LB_6352:
	bts r12,1
	stc
LB_6353:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6350
	btr r12,0
	clc
	jmp LB_6351
LB_6350:
	bts r12,0
	stc
LB_6351:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6346
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_6378
	btr r12,6
	jmp LB_6379
LB_6378:
	bts r12,6
LB_6379:
	mov r13,r14
	bt r12,1
	jc LB_6380
	btr r12,0
	jmp LB_6381
LB_6380:
	bts r12,0
LB_6381:
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
; _f676 %_6182 ⊢ %_6183 : %_6183
 ; {>  %_6182~0':(_lst)◂(_p1551) }
; _f676 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_676
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1583 %_6183 ⊢ %_6184 : %_6184
 ; {>  %_6183~0':(_lst)◂(_p1551) }
; _f1583 0' ⊢ °0◂0'
; _some %_6184 ⊢ %_6185 : %_6185
 ; {>  %_6184~°0◂0':_p1551 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6185
 ; {>  %_6185~°0◂°0◂0':(_opn)◂(_p1551) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6344
	btr r12,3
	jmp LB_6345
LB_6344:
	bts r12,3
LB_6345:
	mov rsi,1
	bt r12,3
	jc LB_6342
	mov rsi,0
	bt r9,0
	jc LB_6342
	jmp LB_6343
LB_6342:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6343:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6346:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6348
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6347
LB_6348:
	add rsp,8
	ret
LB_6349:
	add rsp,48
	pop r14
LB_6347:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_6395
LB_6394:
	add r14,1
LB_6395:
	cmp r14,r10
	jge LB_6396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6394
	cmp al,10
	jz LB_6394
	cmp al,32
	jz LB_6394
LB_6396:
	add r14,1
	cmp r14,r10
	jg LB_6399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_6399
	jmp LB_6400
LB_6399:
	jmp LB_6387
LB_6400:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
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
	call NS_E_6158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6404
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6405:
	jmp LB_6387
LB_6404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_6408
LB_6407:
	add r14,1
LB_6408:
	cmp r14,r10
	jge LB_6409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6407
	cmp al,10
	jz LB_6407
	cmp al,32
	jz LB_6407
LB_6409:
	add r14,1
	cmp r14,r10
	jg LB_6414
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_6414
	jmp LB_6415
LB_6414:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6411
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6411:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6412
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6412:
	jmp LB_6387
LB_6415:
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
	jc LB_6392
	btr r12,2
	clc
	jmp LB_6393
LB_6392:
	bts r12,2
	stc
LB_6393:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6390
	btr r12,1
	clc
	jmp LB_6391
LB_6390:
	bts r12,1
	stc
LB_6391:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6388
	btr r12,0
	clc
	jmp LB_6389
LB_6388:
	bts r12,0
	stc
LB_6389:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6384
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_6416
	btr r12,6
	jmp LB_6417
LB_6416:
	bts r12,6
LB_6417:
	mov r13,r14
	bt r12,1
	jc LB_6418
	btr r12,0
	jmp LB_6419
LB_6418:
	bts r12,0
LB_6419:
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
; _some %_6186 ⊢ %_6187 : %_6187
 ; {>  %_6186~0':_p1551 }
; _some 0' ⊢ °0◂0'
; ∎ %_6187
 ; {>  %_6187~°0◂0':(_opn)◂(_p1551) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6382
	btr r12,3
	jmp LB_6383
LB_6382:
	bts r12,3
LB_6383:
	mov r8,0
	bts r12,2
	ret
LB_6384:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6386
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6385
LB_6386:
	add rsp,8
	ret
LB_6387:
	add rsp,48
	pop r14
LB_6385:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
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
	call NS_E_6162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6433
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6427
LB_6433:
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
	jc LB_6428
	btr r12,0
	clc
	jmp LB_6429
LB_6428:
	bts r12,0
	stc
LB_6429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6424
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1587 %_6188 ⊢ %_6189 : %_6189
 ; {>  %_6188~0':_stg }
; _f1587 0' ⊢ °4◂0'
; _some %_6189 ⊢ %_6190 : %_6190
 ; {>  %_6189~°4◂0':_p1551 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_6190
 ; {>  %_6190~°0◂°4◂0':(_opn)◂(_p1551) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6422
	btr r12,3
	jmp LB_6423
LB_6422:
	bts r12,3
LB_6423:
	mov rsi,1
	bt r12,3
	jc LB_6420
	mov rsi,0
	bt r9,0
	jc LB_6420
	jmp LB_6421
LB_6420:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6421:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6426
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6425
LB_6426:
	add rsp,8
	ret
LB_6427:
	add rsp,16
	pop r14
LB_6425:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_6446
LB_6445:
	add r14,1
LB_6446:
	cmp r14,r10
	jge LB_6447
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6445
	cmp al,10
	jz LB_6445
	cmp al,32
	jz LB_6445
LB_6447:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6448
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6442
LB_6448:
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
	jc LB_6443
	btr r12,0
	clc
	jmp LB_6444
LB_6443:
	bts r12,0
	stc
LB_6444:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6439
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1586 %_6191 ⊢ %_6192 : %_6192
 ; {>  %_6191~0':_p1442 }
; _f1586 0' ⊢ °3◂0'
; _some %_6192 ⊢ %_6193 : %_6193
 ; {>  %_6192~°3◂0':_p1551 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_6193
 ; {>  %_6193~°0◂°3◂0':(_opn)◂(_p1551) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6437
	btr r12,3
	jmp LB_6438
LB_6437:
	bts r12,3
LB_6438:
	mov rsi,1
	bt r12,3
	jc LB_6435
	mov rsi,0
	bt r9,0
	jc LB_6435
	jmp LB_6436
LB_6435:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6436:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6439:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6441
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6440
LB_6441:
	add rsp,8
	ret
LB_6442:
	add rsp,16
	pop r14
LB_6440:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6162:
NS_E_RDI_6162:
NS_E_6162_ETR_TBL:
NS_E_6162_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6463
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6455
LB_6463:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_6471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_6471
	jmp LB_6472
LB_6471:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6469
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6469:
	jmp LB_6455
LB_6472:
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
	jc LB_6458
	btr r12,1
	clc
	jmp LB_6459
LB_6458:
	bts r12,1
	stc
LB_6459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6456
	btr r12,0
	clc
	jmp LB_6457
LB_6456:
	bts r12,0
	stc
LB_6457:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6452
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_6194 ⊢ %_6195 : %_6195
 ; {>  %_6194~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_6195
 ; {>  %_6195~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6450
	btr r12,3
	jmp LB_6451
LB_6450:
	bts r12,3
LB_6451:
	mov r8,0
	bts r12,2
	ret
LB_6452:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6454
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6453
LB_6454:
	add rsp,8
	ret
LB_6455:
	add rsp,32
	pop r14
LB_6453:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6473:
NS_E_RDI_6473:
NS_E_6473_ETR_TBL:
NS_E_6473_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_6897
LB_6896:
	add r14,1
LB_6897:
	cmp r14,r10
	jge LB_6898
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6896
	cmp al,10
	jz LB_6896
	cmp al,32
	jz LB_6896
LB_6898:
	push r10
	call NS_E_6474_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6899
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6891
LB_6899:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_6902
LB_6901:
	add r14,1
LB_6902:
	cmp r14,r10
	jge LB_6903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6901
	cmp al,10
	jz LB_6901
	cmp al,32
	jz LB_6901
LB_6903:
	push r10
	call NS_E_6473_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6904
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6905
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6905:
	jmp LB_6891
LB_6904:
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
	jc LB_6894
	btr r12,1
	clc
	jmp LB_6895
LB_6894:
	bts r12,1
	stc
LB_6895:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6892
	btr r12,0
	clc
	jmp LB_6893
LB_6892:
	bts r12,0
	stc
LB_6893:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6888
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_6516 %_6517 } ⊢ %_6518 : %_6518
 ; {>  %_6516~0':_p1539 %_6517~1':(_lst)◂(_p1539) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6518 ⊢ %_6519 : %_6519
 ; {>  %_6518~°0◂{ 0' 1' }:(_lst)◂(_p1539) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6519
 ; {>  %_6519~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1539)) }
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
	jc LB_6882
	btr r12,2
	jmp LB_6883
LB_6882:
	bts r12,2
LB_6883:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6880
	btr QWORD [rdi],0
	jmp LB_6881
LB_6880:
	bts QWORD [rdi],0
LB_6881:
	mov r8,r14
	bt r12,1
	jc LB_6886
	btr r12,2
	jmp LB_6887
LB_6886:
	bts r12,2
LB_6887:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6884
	btr QWORD [rdi],1
	jmp LB_6885
LB_6884:
	bts QWORD [rdi],1
LB_6885:
	mov rsi,1
	bt r12,3
	jc LB_6878
	mov rsi,0
	bt r9,0
	jc LB_6878
	jmp LB_6879
LB_6878:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6879:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6888:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6890
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6889
LB_6890:
	add rsp,8
	ret
LB_6891:
	add rsp,32
	pop r14
LB_6889:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6909
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_6520 : %_6520
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_6520 ⊢ %_6521 : %_6521
 ; {>  %_6520~°1◂{  }:(_lst)◂(t2665'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6521
 ; {>  %_6521~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2668'(0))) }
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
	jc LB_6907
	mov rsi,0
	bt r9,0
	jc LB_6907
	jmp LB_6908
LB_6907:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6908:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6909:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6911
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6910
LB_6911:
	add rsp,8
	ret
LB_6912:
	add rsp,0
	pop r14
LB_6910:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6474:
NS_E_RDI_6474:
NS_E_6474_ETR_TBL:
NS_E_6474_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_6931
LB_6930:
	add r14,1
LB_6931:
	cmp r14,r10
	jge LB_6932
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6930
	cmp al,10
	jz LB_6930
	cmp al,32
	jz LB_6930
LB_6932:
	add r14,7
	cmp r14,r10
	jg LB_6935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_6935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_6935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_6935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_6935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_6935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_6935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_6935
	jmp LB_6936
LB_6935:
	jmp LB_6918
LB_6936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_6925
LB_6924:
	add r14,1
LB_6925:
	cmp r14,r10
	jge LB_6926
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6924
	cmp al,10
	jz LB_6924
	cmp al,32
	jz LB_6924
LB_6926:
	push r10
	call NS_E_6475_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6927
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6928
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6928:
	jmp LB_6919
LB_6927:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6922
	btr r12,1
	clc
	jmp LB_6923
LB_6922:
	bts r12,1
	stc
LB_6923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6920
	btr r12,0
	clc
	jmp LB_6921
LB_6920:
	bts r12,0
	stc
LB_6921:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6915
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6937
	btr r12,2
	jmp LB_6938
LB_6937:
	bts r12,2
LB_6938:
	mov r13,r14
	bt r12,1
	jc LB_6939
	btr r12,0
	jmp LB_6940
LB_6939:
	bts r12,0
LB_6940:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_6522 ⊢ %_6523 : %_6523
 ; {>  %_6522~0':_p1539 }
; _some 0' ⊢ °0◂0'
; ∎ %_6523
 ; {>  %_6523~°0◂0':(_opn)◂(_p1539) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6913
	btr r12,3
	jmp LB_6914
LB_6913:
	bts r12,3
LB_6914:
	mov r8,0
	bts r12,2
	ret
LB_6915:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6917
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6916
LB_6917:
	add rsp,8
	ret
LB_6919:
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
LB_6918:
	add rsp,32
	pop r14
LB_6916:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6942
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 0" _ ⊢ 0' : %_6524
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_6524 ⊢ %_6525 : %_6525
 ; {>  %_6524~0':_stg }
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
; _none {  } ⊢ %_6526 : %_6526
 ; {>  %_6525~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_6526
 ; {>  %_6525~0':_stg %_6526~°1◂{  }:(_opn)◂(t2678'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6941
	mov rdi,r13
	call dlt
LB_6941:
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
LB_6942:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6944
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6943
LB_6944:
	add rsp,8
	ret
LB_6945:
	add rsp,0
	pop r14
LB_6943:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_6981
LB_6980:
	add r14,1
LB_6981:
	cmp r14,r10
	jge LB_6982
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6980
	cmp al,10
	jz LB_6980
	cmp al,32
	jz LB_6980
LB_6982:
	add r14,4
	cmp r14,r10
	jg LB_6985
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_6985
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_6985
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_6985
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_6985
	jmp LB_6986
LB_6985:
	jmp LB_6959
LB_6986:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6968
LB_6967:
	add r14,1
LB_6968:
	cmp r14,r10
	jge LB_6969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6967
	cmp al,10
	jz LB_6967
	cmp al,32
	jz LB_6967
LB_6969:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6970
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6971
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6971:
	jmp LB_6960
LB_6970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_6974
LB_6973:
	add r14,1
LB_6974:
	cmp r14,r10
	jge LB_6975
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6973
	cmp al,10
	jz LB_6973
	cmp al,32
	jz LB_6973
LB_6975:
	push r10
	call NS_E_6476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6976
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6977
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6977:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6978
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6978:
	jmp LB_6960
LB_6976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6965
	btr r12,2
	clc
	jmp LB_6966
LB_6965:
	bts r12,2
	stc
LB_6966:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6963
	btr r12,1
	clc
	jmp LB_6964
LB_6963:
	bts r12,1
	stc
LB_6964:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6961
	btr r12,0
	clc
	jmp LB_6962
LB_6961:
	bts r12,0
	stc
LB_6962:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6956
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6987
	btr r12,3
	jmp LB_6988
LB_6987:
	bts r12,3
LB_6988:
	mov r14,r8
	bt r12,2
	jc LB_6989
	btr r12,1
	jmp LB_6990
LB_6989:
	bts r12,1
LB_6990:
	mov r8,r13
	bt r12,0
	jc LB_6991
	btr r12,2
	jmp LB_6992
LB_6991:
	bts r12,2
LB_6992:
	mov r13,r9
	bt r12,3
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
; _f1552 { %_6527 %_6528 } ⊢ %_6529 : %_6529
 ; {>  %_6528~1':_p1540 %_6527~0':_stg }
; _f1552 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6529 ⊢ %_6530 : %_6530
 ; {>  %_6529~°0◂{ 0' 1' }:_p1539 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6530
 ; {>  %_6530~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1539) }
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
	jc LB_6950
	btr r12,2
	jmp LB_6951
LB_6950:
	bts r12,2
LB_6951:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6948
	btr QWORD [rdi],0
	jmp LB_6949
LB_6948:
	bts QWORD [rdi],0
LB_6949:
	mov r8,r14
	bt r12,1
	jc LB_6954
	btr r12,2
	jmp LB_6955
LB_6954:
	bts r12,2
LB_6955:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6952
	btr QWORD [rdi],1
	jmp LB_6953
LB_6952:
	bts QWORD [rdi],1
LB_6953:
	mov rsi,1
	bt r12,3
	jc LB_6946
	mov rsi,0
	bt r9,0
	jc LB_6946
	jmp LB_6947
LB_6946:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6947:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6956:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6958
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6957
LB_6958:
	add rsp,8
	ret
LB_6960:
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
LB_6959:
	add rsp,48
	pop r14
LB_6957:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_6996
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 1" _ ⊢ 0' : %_6531
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_6531 ⊢ %_6532 : %_6532
 ; {>  %_6531~0':_stg }
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
; _none {  } ⊢ %_6533 : %_6533
 ; {>  %_6532~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_6533
 ; {>  %_6532~0':_stg %_6533~°1◂{  }:(_opn)◂(t2690'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6995
	mov rdi,r13
	call dlt
LB_6995:
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
LB_6996:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6998
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6997
LB_6998:
	add rsp,8
	ret
LB_6999:
	add rsp,0
	pop r14
LB_6997:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_7018
LB_7017:
	add r14,1
LB_7018:
	cmp r14,r10
	jge LB_7019
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7017
	cmp al,10
	jz LB_7017
	cmp al,32
	jz LB_7017
LB_7019:
	add r14,2
	cmp r14,r10
	jg LB_7022
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_7022
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_7022
	jmp LB_7023
LB_7022:
	jmp LB_7005
LB_7023:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_7012
LB_7011:
	add r14,1
LB_7012:
	cmp r14,r10
	jge LB_7013
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7011
	cmp al,10
	jz LB_7011
	cmp al,32
	jz LB_7011
LB_7013:
	push r10
	call NS_E_6484_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7014
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7015
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7015:
	jmp LB_7006
LB_7014:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7009
	btr r12,1
	clc
	jmp LB_7010
LB_7009:
	bts r12,1
	stc
LB_7010:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7007
	btr r12,0
	clc
	jmp LB_7008
LB_7007:
	bts r12,0
	stc
LB_7008:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7002
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7024
	btr r12,2
	jmp LB_7025
LB_7024:
	bts r12,2
LB_7025:
	mov r13,r14
	bt r12,1
	jc LB_7026
	btr r12,0
	jmp LB_7027
LB_7026:
	bts r12,0
LB_7027:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_6534 ⊢ %_6535 : %_6535
 ; {>  %_6534~0':_p1539 }
; _some 0' ⊢ °0◂0'
; ∎ %_6535
 ; {>  %_6535~°0◂0':(_opn)◂(_p1539) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7000
	btr r12,3
	jmp LB_7001
LB_7000:
	bts r12,3
LB_7001:
	mov r8,0
	bts r12,2
	ret
LB_7002:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7004
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7003
LB_7004:
	add rsp,8
	ret
LB_7006:
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
LB_7005:
	add rsp,32
	pop r14
LB_7003:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_7029
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 2" _ ⊢ 0' : %_6536
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_6536 ⊢ %_6537 : %_6537
 ; {>  %_6536~0':_stg }
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
; _none {  } ⊢ %_6538 : %_6538
 ; {>  %_6537~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_6538
 ; {>  %_6538~°1◂{  }:(_opn)◂(t2700'(0)) %_6537~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_7028
	mov rdi,r13
	call dlt
LB_7028:
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
LB_7029:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7031
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7030
LB_7031:
	add rsp,8
	ret
LB_7032:
	add rsp,0
	pop r14
LB_7030:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_7051
LB_7050:
	add r14,1
LB_7051:
	cmp r14,r10
	jge LB_7052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7050
	cmp al,10
	jz LB_7050
	cmp al,32
	jz LB_7050
LB_7052:
	add r14,2
	cmp r14,r10
	jg LB_7055
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_7055
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_7055
	jmp LB_7056
LB_7055:
	jmp LB_7038
LB_7056:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_7045
LB_7044:
	add r14,1
LB_7045:
	cmp r14,r10
	jge LB_7046
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7044
	cmp al,10
	jz LB_7044
	cmp al,32
	jz LB_7044
LB_7046:
	push r10
	call NS_E_6478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7047
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7048
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7048:
	jmp LB_7039
LB_7047:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7042
	btr r12,1
	clc
	jmp LB_7043
LB_7042:
	bts r12,1
	stc
LB_7043:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7040
	btr r12,0
	clc
	jmp LB_7041
LB_7040:
	bts r12,0
	stc
LB_7041:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7035
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7057
	btr r12,2
	jmp LB_7058
LB_7057:
	bts r12,2
LB_7058:
	mov r13,r14
	bt r12,1
	jc LB_7059
	btr r12,0
	jmp LB_7060
LB_7059:
	bts r12,0
LB_7060:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_6539 ⊢ %_6540 : %_6540
 ; {>  %_6539~0':_p1539 }
; _some 0' ⊢ °0◂0'
; ∎ %_6540
 ; {>  %_6540~°0◂0':(_opn)◂(_p1539) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7033
	btr r12,3
	jmp LB_7034
LB_7033:
	bts r12,3
LB_7034:
	mov r8,0
	bts r12,2
	ret
LB_7035:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7037
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7036
LB_7037:
	add rsp,8
	ret
LB_7039:
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
LB_7038:
	add rsp,32
	pop r14
LB_7036:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6475:
NS_E_RDI_6475:
NS_E_6475_ETR_TBL:
NS_E_6475_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
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
	call NS_E_6503_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7098
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7090
LB_7098:
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
LB_7104:
	jmp LB_7101
LB_7100:
	add r14,1
LB_7101:
	cmp r14,r10
	jge LB_7102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7100
	cmp al,10
	jz LB_7100
	cmp al,32
	jz LB_7100
LB_7102:
	push r10
	push rsi
	call NS_E_6503_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_7103
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_7105
	bts QWORD [rax],0
LB_7105:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_7104
LB_7103:
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
	jc LB_7093
	btr r12,1
	clc
	jmp LB_7094
LB_7093:
	bts r12,1
	stc
LB_7094:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7091
	btr r12,0
	clc
	jmp LB_7092
LB_7091:
	bts r12,0
	stc
LB_7092:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7087
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r11,r8
	bt r12,2
	jc LB_7106
	btr r12,5
	jmp LB_7107
LB_7106:
	bts r12,5
LB_7107:
	mov r8,r14
	bt r12,1
	jc LB_7108
	btr r12,2
	jmp LB_7109
LB_7108:
	bts r12,2
LB_7109:
	mov rcx,r13
	bt r12,0
	jc LB_7110
	btr r12,6
	jmp LB_7111
LB_7110:
	bts r12,6
LB_7111:
; 6' ⊢ { 0' 1' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_7114
	btr r12,7
	clc
	jmp LB_7115
LB_7114:
	bts r12,7
	stc
LB_7115:
	mov r13,rdx
	bt r12,7
	jc LB_7112
	btr r12,0
	jmp LB_7113
LB_7112:
	bts r12,0
LB_7113:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_7118
	btr r12,7
	clc
	jmp LB_7119
LB_7118:
	bts r12,7
	stc
LB_7119:
	mov r14,rdx
	bt r12,7
	jc LB_7116
	btr r12,1
	jmp LB_7117
LB_7116:
	bts r12,1
LB_7117:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f676 %_6542 ⊢ %_6543 : %_6543
 ; {>  %_6541~{ 0' 1' }:{ _stg _p1543 } %_6542~2':(_lst)◂({ _stg _p1543 }) }
; _f676 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_7065
	btr r12,0
	jmp LB_7066
LB_7065:
	bts r12,0
LB_7066:
	call NS_E_676
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_7067
	btr r12,2
	jmp LB_7068
LB_7067:
	bts r12,2
LB_7068:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7063
	btr r12,1
	clc
	jmp LB_7064
LB_7063:
	bts r12,1
	stc
LB_7064:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7061
	btr r12,0
	clc
	jmp LB_7062
LB_7061:
	bts r12,0
	stc
LB_7062:
	add rsp,24
; _cns { %_6541 %_6543 } ⊢ %_6544 : %_6544
 ; {>  %_6543~2':(_lst)◂({ _stg _p1543 }) %_6541~{ 0' 1' }:{ _stg _p1543 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1553 %_6544 ⊢ %_6545 : %_6545
 ; {>  %_6544~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1543 }) }
; _f1553 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_6545 ⊢ %_6546 : %_6546
 ; {>  %_6545~°1◂°0◂{ { 0' 1' } 2' }:_p1539 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_6546
 ; {>  %_6546~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1539) }
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
	jc LB_7077
	btr r12,5
	jmp LB_7078
LB_7077:
	bts r12,5
LB_7078:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7075
	btr QWORD [rdi],0
	jmp LB_7076
LB_7075:
	bts QWORD [rdi],0
LB_7076:
	mov r11,r14
	bt r12,1
	jc LB_7081
	btr r12,5
	jmp LB_7082
LB_7081:
	bts r12,5
LB_7082:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7079
	btr QWORD [rdi],1
	jmp LB_7080
LB_7079:
	bts QWORD [rdi],1
LB_7080:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7073
	btr QWORD [rdi],0
	jmp LB_7074
LB_7073:
	bts QWORD [rdi],0
LB_7074:
	mov r10,r8
	bt r12,2
	jc LB_7085
	btr r12,4
	jmp LB_7086
LB_7085:
	bts r12,4
LB_7086:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7083
	btr QWORD [rdi],1
	jmp LB_7084
LB_7083:
	bts QWORD [rdi],1
LB_7084:
	mov rsi,1
	bt r12,3
	jc LB_7071
	mov rsi,0
	bt r9,0
	jc LB_7071
	jmp LB_7072
LB_7071:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7072:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7069
	mov rsi,0
	bt r9,0
	jc LB_7069
	jmp LB_7070
LB_7069:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7070:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7087:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7089
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7088
LB_7089:
	add rsp,8
	ret
LB_7090:
	add rsp,32
	pop r14
LB_7088:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_7121
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "grm_etr 0" _ ⊢ 0' : %_6547
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_6547 ⊢ %_6548 : %_6548
 ; {>  %_6547~0':_stg }
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
; _none {  } ⊢ %_6549 : %_6549
 ; {>  %_6548~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_6549
 ; {>  %_6548~0':_stg %_6549~°1◂{  }:(_opn)◂(t2719'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_7120
	mov rdi,r13
	call dlt
LB_7120:
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
LB_7121:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7123
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7122
LB_7123:
	add rsp,8
	ret
LB_7124:
	add rsp,0
	pop r14
LB_7122:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6476:
NS_E_RDI_6476:
NS_E_6476_ETR_TBL:
NS_E_6476_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_7145
LB_7144:
	add r14,1
LB_7145:
	cmp r14,r10
	jge LB_7146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7144
	cmp al,10
	jz LB_7144
	cmp al,32
	jz LB_7144
LB_7146:
	add r14,1
	cmp r14,r10
	jg LB_7149
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_7149
	jmp LB_7150
LB_7149:
	jmp LB_7132
LB_7150:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_7139
LB_7138:
	add r14,1
LB_7139:
	cmp r14,r10
	jge LB_7140
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7138
	cmp al,10
	jz LB_7138
	cmp al,32
	jz LB_7138
LB_7140:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7141
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7142
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7142:
	jmp LB_7133
LB_7141:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7136
	btr r12,1
	clc
	jmp LB_7137
LB_7136:
	bts r12,1
	stc
LB_7137:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7134
	btr r12,0
	clc
	jmp LB_7135
LB_7134:
	bts r12,0
	stc
LB_7135:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7129
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7151
	btr r12,2
	jmp LB_7152
LB_7151:
	bts r12,2
LB_7152:
	mov r13,r14
	bt r12,1
	jc LB_7153
	btr r12,0
	jmp LB_7154
LB_7153:
	bts r12,0
LB_7154:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1559 %_6550 ⊢ %_6551 : %_6551
 ; {>  %_6550~0':_p1442 }
; _f1559 0' ⊢ °1◂0'
; _some %_6551 ⊢ %_6552 : %_6552
 ; {>  %_6551~°1◂0':_p1540 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6552
 ; {>  %_6552~°0◂°1◂0':(_opn)◂(_p1540) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7127
	btr r12,3
	jmp LB_7128
LB_7127:
	bts r12,3
LB_7128:
	mov rsi,1
	bt r12,3
	jc LB_7125
	mov rsi,0
	bt r9,0
	jc LB_7125
	jmp LB_7126
LB_7125:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7126:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7129:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7131
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7130
LB_7131:
	add rsp,8
	ret
LB_7133:
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
LB_7132:
	add rsp,32
	pop r14
LB_7130:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_7166
LB_7165:
	add r14,1
LB_7166:
	cmp r14,r10
	jge LB_7167
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7165
	cmp al,10
	jz LB_7165
	cmp al,32
	jz LB_7165
LB_7167:
	push r10
	call NS_E_6477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7168
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7162
LB_7168:
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
	jc LB_7163
	btr r12,0
	clc
	jmp LB_7164
LB_7163:
	bts r12,0
	stc
LB_7164:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7159
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1558 %_6553 ⊢ %_6554 : %_6554
 ; {>  %_6553~0':(_lst)◂(_p1539) }
; _f1558 0' ⊢ °0◂0'
; _some %_6554 ⊢ %_6555 : %_6555
 ; {>  %_6554~°0◂0':_p1540 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6555
 ; {>  %_6555~°0◂°0◂0':(_opn)◂(_p1540) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7157
	btr r12,3
	jmp LB_7158
LB_7157:
	bts r12,3
LB_7158:
	mov rsi,1
	bt r12,3
	jc LB_7155
	mov rsi,0
	bt r9,0
	jc LB_7155
	jmp LB_7156
LB_7155:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7156:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7159:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7161
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7160
LB_7161:
	add rsp,8
	ret
LB_7162:
	add rsp,16
	pop r14
LB_7160:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_7171
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_6556
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_6556 ⊢ %_6557 : %_6557
 ; {>  %_6556~0':_stg }
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
; _none {  } ⊢ %_6558 : %_6558
 ; {>  %_6557~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_6558
 ; {>  %_6557~0':_stg %_6558~°1◂{  }:(_opn)◂(t2734'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_7170
	mov rdi,r13
	call dlt
LB_7170:
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
LB_7171:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7173
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7172
LB_7173:
	add rsp,8
	ret
LB_7174:
	add rsp,0
	pop r14
LB_7172:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6477:
NS_E_RDI_6477:
NS_E_6477_ETR_TBL:
NS_E_6477_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_7184
LB_7183:
	add r14,1
LB_7184:
	cmp r14,r10
	jge LB_7185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7183
	cmp al,10
	jz LB_7183
	cmp al,32
	jz LB_7183
LB_7185:
	add r14,6
	cmp r14,r10
	jg LB_7188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_7188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_7188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_7188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_7188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_7188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_7188
	jmp LB_7189
LB_7188:
	jmp LB_7180
LB_7189:
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
	jc LB_7181
	btr r12,0
	clc
	jmp LB_7182
LB_7181:
	bts r12,0
	stc
LB_7182:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7177
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_6559 : %_6559
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_6559 ⊢ %_6560 : %_6560
 ; {>  %_6559~°1◂{  }:(_lst)◂(t2738'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6560
 ; {>  %_6560~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2741'(0))) }
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
	jc LB_7175
	mov rsi,0
	bt r9,0
	jc LB_7175
	jmp LB_7176
LB_7175:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7176:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7177:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7179
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7178
LB_7179:
	add rsp,8
	ret
LB_7180:
	add rsp,16
	pop r14
LB_7178:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_7209
LB_7208:
	add r14,1
LB_7209:
	cmp r14,r10
	jge LB_7210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7208
	cmp al,10
	jz LB_7208
	cmp al,32
	jz LB_7208
LB_7210:
	push r10
	call NS_E_6474_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7211
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7203
LB_7211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_7214
LB_7213:
	add r14,1
LB_7214:
	cmp r14,r10
	jge LB_7215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7213
	cmp al,10
	jz LB_7213
	cmp al,32
	jz LB_7213
LB_7215:
	push r10
	call NS_E_6477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7216
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7217
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7217:
	jmp LB_7203
LB_7216:
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
	jc LB_7206
	btr r12,1
	clc
	jmp LB_7207
LB_7206:
	bts r12,1
	stc
LB_7207:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7204
	btr r12,0
	clc
	jmp LB_7205
LB_7204:
	bts r12,0
	stc
LB_7205:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7200
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_6561 %_6562 } ⊢ %_6563 : %_6563
 ; {>  %_6562~1':(_lst)◂(_p1539) %_6561~0':_p1539 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6563 ⊢ %_6564 : %_6564
 ; {>  %_6563~°0◂{ 0' 1' }:(_lst)◂(_p1539) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6564
 ; {>  %_6564~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1539)) }
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
	jc LB_7194
	btr r12,2
	jmp LB_7195
LB_7194:
	bts r12,2
LB_7195:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7192
	btr QWORD [rdi],0
	jmp LB_7193
LB_7192:
	bts QWORD [rdi],0
LB_7193:
	mov r8,r14
	bt r12,1
	jc LB_7198
	btr r12,2
	jmp LB_7199
LB_7198:
	bts r12,2
LB_7199:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7196
	btr QWORD [rdi],1
	jmp LB_7197
LB_7196:
	bts QWORD [rdi],1
LB_7197:
	mov rsi,1
	bt r12,3
	jc LB_7190
	mov rsi,0
	bt r9,0
	jc LB_7190
	jmp LB_7191
LB_7190:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7191:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7200:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7202
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7201
LB_7202:
	add rsp,8
	ret
LB_7203:
	add rsp,32
	pop r14
LB_7201:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6478:
NS_E_RDI_6478:
NS_E_6478_ETR_TBL:
NS_E_6478_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_7274
LB_7273:
	add r14,1
LB_7274:
	cmp r14,r10
	jge LB_7275
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7273
	cmp al,10
	jz LB_7273
	cmp al,32
	jz LB_7273
LB_7275:
	add r14,1
	cmp r14,r10
	jg LB_7278
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_7278
	jmp LB_7279
LB_7278:
	jmp LB_7240
LB_7279:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_7251
LB_7250:
	add r14,1
LB_7251:
	cmp r14,r10
	jge LB_7252
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7250
	cmp al,10
	jz LB_7250
	cmp al,32
	jz LB_7250
LB_7252:
	add r14,1
	cmp r14,r10
	jg LB_7256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_7256
	jmp LB_7257
LB_7256:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7254
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7254:
	jmp LB_7241
LB_7257:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_7259
LB_7258:
	add r14,1
LB_7259:
	cmp r14,r10
	jge LB_7260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7258
	cmp al,10
	jz LB_7258
	cmp al,32
	jz LB_7258
LB_7260:
	push r10
	call NS_E_6479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7261
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7262
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7262:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7263
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7263:
	jmp LB_7241
LB_7261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_7266
LB_7265:
	add r14,1
LB_7266:
	cmp r14,r10
	jge LB_7267
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7265
	cmp al,10
	jz LB_7265
	cmp al,32
	jz LB_7265
LB_7267:
	push r10
	call NS_E_6482_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7268
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7269
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7269:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7270
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7270:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7271
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7271:
	jmp LB_7241
LB_7268:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7248
	btr r12,3
	clc
	jmp LB_7249
LB_7248:
	bts r12,3
	stc
LB_7249:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7246
	btr r12,2
	clc
	jmp LB_7247
LB_7246:
	bts r12,2
	stc
LB_7247:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7244
	btr r12,1
	clc
	jmp LB_7245
LB_7244:
	bts r12,1
	stc
LB_7245:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7242
	btr r12,0
	clc
	jmp LB_7243
LB_7242:
	bts r12,0
	stc
LB_7243:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7237
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_7280
	btr r12,4
	jmp LB_7281
LB_7280:
	bts r12,4
LB_7281:
	mov r8,r9
	bt r12,3
	jc LB_7282
	btr r12,2
	jmp LB_7283
LB_7282:
	bts r12,2
LB_7283:
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
	jc LB_7286
	btr r12,3
	clc
	jmp LB_7287
LB_7286:
	bts r12,3
	stc
LB_7287:
	mov r13,r9
	bt r12,3
	jc LB_7284
	btr r12,0
	jmp LB_7285
LB_7284:
	bts r12,0
LB_7285:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_7290
	btr r12,3
	clc
	jmp LB_7291
LB_7290:
	bts r12,3
	stc
LB_7291:
	mov r14,r9
	bt r12,3
	jc LB_7288
	btr r12,1
	jmp LB_7289
LB_7288:
	bts r12,1
LB_7289:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_6565 %_6566 } ⊢ %_6567 : %_6567
 ; {>  %_6565~{ 0' 1' }:{ _stg _p1542 } %_6566~2':(_lst)◂({ _stg _p1542 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1557 %_6567 ⊢ %_6568 : %_6568
 ; {>  %_6567~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1542 }) }
; _f1557 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_6568 ⊢ %_6569 : %_6569
 ; {>  %_6568~°5◂°0◂{ { 0' 1' } 2' }:_p1539 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_6569
 ; {>  %_6569~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1539) }
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
	jc LB_7227
	btr r12,5
	jmp LB_7228
LB_7227:
	bts r12,5
LB_7228:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7225
	btr QWORD [rdi],0
	jmp LB_7226
LB_7225:
	bts QWORD [rdi],0
LB_7226:
	mov r11,r14
	bt r12,1
	jc LB_7231
	btr r12,5
	jmp LB_7232
LB_7231:
	bts r12,5
LB_7232:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7229
	btr QWORD [rdi],1
	jmp LB_7230
LB_7229:
	bts QWORD [rdi],1
LB_7230:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7223
	btr QWORD [rdi],0
	jmp LB_7224
LB_7223:
	bts QWORD [rdi],0
LB_7224:
	mov r10,r8
	bt r12,2
	jc LB_7235
	btr r12,4
	jmp LB_7236
LB_7235:
	bts r12,4
LB_7236:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7233
	btr QWORD [rdi],1
	jmp LB_7234
LB_7233:
	bts QWORD [rdi],1
LB_7234:
	mov rsi,1
	bt r12,3
	jc LB_7221
	mov rsi,0
	bt r9,0
	jc LB_7221
	jmp LB_7222
LB_7221:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7222:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7219
	mov rsi,0
	bt r9,0
	jc LB_7219
	jmp LB_7220
LB_7219:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7220:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7237:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7239
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7238
LB_7239:
	add rsp,8
	ret
LB_7241:
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
LB_7240:
	add rsp,64
	pop r14
LB_7238:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_7309
LB_7308:
	add r14,1
LB_7309:
	cmp r14,r10
	jge LB_7310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7308
	cmp al,10
	jz LB_7308
	cmp al,32
	jz LB_7308
LB_7310:
	push r10
	call NS_E_6479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7311
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7305
LB_7311:
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
	jc LB_7306
	btr r12,0
	clc
	jmp LB_7307
LB_7306:
	bts r12,0
	stc
LB_7307:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7302
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r11,r14
	bt r12,1
	jc LB_7313
	btr r12,5
	jmp LB_7314
LB_7313:
	bts r12,5
LB_7314:
	mov r10,r13
	bt r12,0
	jc LB_7315
	btr r12,4
	jmp LB_7316
LB_7315:
	bts r12,4
LB_7316:
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_7319
	btr r12,6
	clc
	jmp LB_7320
LB_7319:
	bts r12,6
	stc
LB_7320:
	mov r13,rcx
	bt r12,6
	jc LB_7317
	btr r12,0
	jmp LB_7318
LB_7317:
	bts r12,0
LB_7318:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_7323
	btr r12,6
	clc
	jmp LB_7324
LB_7323:
	bts r12,6
	stc
LB_7324:
	mov r14,rcx
	bt r12,6
	jc LB_7321
	btr r12,1
	jmp LB_7322
LB_7321:
	bts r12,1
LB_7322:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1556 %_6570 ⊢ %_6571 : %_6571
 ; {>  %_6570~{ 0' 1' }:{ _stg _p1542 } }
; _f1556 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_6571 ⊢ %_6572 : %_6572
 ; {>  %_6571~°4◂{ 0' 1' }:_p1539 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_6572
 ; {>  %_6572~°0◂°4◂{ 0' 1' }:(_opn)◂(_p1539) }
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
	jc LB_7296
	btr r12,2
	jmp LB_7297
LB_7296:
	bts r12,2
LB_7297:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7294
	btr QWORD [rdi],0
	jmp LB_7295
LB_7294:
	bts QWORD [rdi],0
LB_7295:
	mov r8,r14
	bt r12,1
	jc LB_7300
	btr r12,2
	jmp LB_7301
LB_7300:
	bts r12,2
LB_7301:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7298
	btr QWORD [rdi],1
	jmp LB_7299
LB_7298:
	bts QWORD [rdi],1
LB_7299:
	mov rsi,1
	bt r12,3
	jc LB_7292
	mov rsi,0
	bt r9,0
	jc LB_7292
	jmp LB_7293
LB_7292:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7293:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7302:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7304
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7303
LB_7304:
	add rsp,8
	ret
LB_7305:
	add rsp,16
	pop r14
LB_7303:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_7326
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "dt_etr 0" _ ⊢ 0' : %_6573
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_6573 ⊢ %_6574 : %_6574
 ; {>  %_6573~0':_stg }
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
; _none {  } ⊢ %_6575 : %_6575
 ; {>  %_6574~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_6575
 ; {>  %_6574~0':_stg %_6575~°1◂{  }:(_opn)◂(t2765'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_7325
	mov rdi,r13
	call dlt
LB_7325:
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
LB_7326:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7328
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7327
LB_7328:
	add rsp,8
	ret
LB_7329:
	add rsp,0
	pop r14
LB_7327:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6479:
NS_E_RDI_6479:
NS_E_6479_ETR_TBL:
NS_E_6479_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_7363
LB_7362:
	add r14,1
LB_7363:
	cmp r14,r10
	jge LB_7364
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7362
	cmp al,10
	jz LB_7362
	cmp al,32
	jz LB_7362
LB_7364:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7365
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7344
LB_7365:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_7368
LB_7367:
	add r14,1
LB_7368:
	cmp r14,r10
	jge LB_7369
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7367
	cmp al,10
	jz LB_7367
	cmp al,32
	jz LB_7367
LB_7369:
	push r10
	call NS_E_6481_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7370
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7371:
	jmp LB_7344
LB_7370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_7374
LB_7373:
	add r14,1
LB_7374:
	cmp r14,r10
	jge LB_7375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7373
	cmp al,10
	jz LB_7373
	cmp al,32
	jz LB_7373
LB_7375:
	add r14,1
	cmp r14,r10
	jg LB_7380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_7380
	jmp LB_7381
LB_7380:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7377
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7377:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7378
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7378:
	jmp LB_7344
LB_7381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_7355
LB_7354:
	add r14,1
LB_7355:
	cmp r14,r10
	jge LB_7356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7354
	cmp al,10
	jz LB_7354
	cmp al,32
	jz LB_7354
LB_7356:
	push r10
	call NS_E_6158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7357
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7358
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7358:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7359
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7359:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7360:
	jmp LB_7345
LB_7357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7352
	btr r12,3
	clc
	jmp LB_7353
LB_7352:
	bts r12,3
	stc
LB_7353:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7350
	btr r12,2
	clc
	jmp LB_7351
LB_7350:
	bts r12,2
	stc
LB_7351:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7348
	btr r12,1
	clc
	jmp LB_7349
LB_7348:
	bts r12,1
	stc
LB_7349:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7346
	btr r12,0
	clc
	jmp LB_7347
LB_7346:
	bts r12,0
	stc
LB_7347:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7341
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_7382
	btr r12,4
	jmp LB_7383
LB_7382:
	bts r12,4
LB_7383:
	mov r8,r9
	bt r12,3
	jc LB_7384
	btr r12,2
	jmp LB_7385
LB_7384:
	bts r12,2
LB_7385:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1564 %_6578 ⊢ %_6579 : %_6579
 ; {>  %_6578~2':_p1551 %_6576~0':_stg %_6577~1':_p6480 }
; _f1564 2' ⊢ °1◂2'
; _some { %_6576 %_6579 } ⊢ %_6580 : %_6580
 ; {>  %_6579~°1◂2':_p1542 %_6576~0':_stg %_6577~1':_p6480 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_6580
 ; {>  %_6580~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p1542 }) %_6577~1':_p6480 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_7330
	mov rdi,r14
	call dlt
LB_7330:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_7333
	btr r12,1
	jmp LB_7334
LB_7333:
	bts r12,1
LB_7334:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7331
	btr QWORD [rdi],0
	jmp LB_7332
LB_7331:
	bts QWORD [rdi],0
LB_7332:
	mov r14,r8
	bt r12,2
	jc LB_7339
	btr r12,1
	jmp LB_7340
LB_7339:
	bts r12,1
LB_7340:
	mov rsi,1
	bt r12,1
	jc LB_7337
	mov rsi,0
	bt r14,0
	jc LB_7337
	jmp LB_7338
LB_7337:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7338:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7335
	btr QWORD [rdi],1
	jmp LB_7336
LB_7335:
	bts QWORD [rdi],1
LB_7336:
	mov r8,0
	bts r12,2
	ret
LB_7341:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7343
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7342
LB_7343:
	add rsp,8
	ret
LB_7345:
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
LB_7344:
	add rsp,64
	pop r14
LB_7342:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_7432
LB_7431:
	add r14,1
LB_7432:
	cmp r14,r10
	jge LB_7433
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7431
	cmp al,10
	jz LB_7431
	cmp al,32
	jz LB_7431
LB_7433:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7434
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7416
LB_7434:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_7437
LB_7436:
	add r14,1
LB_7437:
	cmp r14,r10
	jge LB_7438
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7436
	cmp al,10
	jz LB_7436
	cmp al,32
	jz LB_7436
LB_7438:
	push r10
	call NS_E_6481_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7439
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7440
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7440:
	jmp LB_7416
LB_7439:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_7443
LB_7442:
	add r14,1
LB_7443:
	cmp r14,r10
	jge LB_7444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7442
	cmp al,10
	jz LB_7442
	cmp al,32
	jz LB_7442
LB_7444:
	add r14,3
	cmp r14,r10
	jg LB_7449
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7449
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7449
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_7449
	jmp LB_7450
LB_7449:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7446
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7446:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7447
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7447:
	jmp LB_7416
LB_7450:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
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
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7454
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7455
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7455:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7456
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7456:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7457
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7457:
	jmp LB_7416
LB_7454:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
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
	add r14,1
	cmp r14,r10
	jg LB_7468
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_7468
	jmp LB_7469
LB_7468:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7463
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7463:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7464
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7464:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7465
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7465:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7466
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7466:
	jmp LB_7416
LB_7469:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_7471
LB_7470:
	add r14,1
LB_7471:
	cmp r14,r10
	jge LB_7472
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7470
	cmp al,10
	jz LB_7470
	cmp al,32
	jz LB_7470
LB_7472:
	push r10
	call NS_E_6158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7473
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_7474
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_7474:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7475
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7475:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7476
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7476:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7477
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7477:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7478
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7478:
	jmp LB_7416
LB_7473:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_7481
LB_7480:
	add r14,1
LB_7481:
	cmp r14,r10
	jge LB_7482
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7480
	cmp al,10
	jz LB_7480
	cmp al,32
	jz LB_7480
LB_7482:
	push r10
	call NS_E_6483_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7483
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_7484
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_7484:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_7485
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_7485:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7486
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7486:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7487
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7487:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7488
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7488:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7489
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7489:
	jmp LB_7416
LB_7483:
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
	jc LB_7429
	btr r12,6
	clc
	jmp LB_7430
LB_7429:
	bts r12,6
	stc
LB_7430:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_7427
	btr r12,5
	clc
	jmp LB_7428
LB_7427:
	bts r12,5
	stc
LB_7428:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7425
	btr r12,4
	clc
	jmp LB_7426
LB_7425:
	bts r12,4
	stc
LB_7426:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7423
	btr r12,3
	clc
	jmp LB_7424
LB_7423:
	bts r12,3
	stc
LB_7424:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7421
	btr r12,2
	clc
	jmp LB_7422
LB_7421:
	bts r12,2
	stc
LB_7422:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7419
	btr r12,1
	clc
	jmp LB_7420
LB_7419:
	bts r12,1
	stc
LB_7420:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7417
	btr r12,0
	clc
	jmp LB_7418
LB_7417:
	bts r12,0
	stc
LB_7418:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_7413
; _emt_mov_ptn_to_ptn:{| 11111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdi,r10
	mov QWORD [st_vct+8*10],rdi
	bt r12,4
	jc LB_7491
	btr r12,10
	jmp LB_7492
LB_7491:
	bts r12,10
LB_7492:
	mov r10,rcx
	bt r12,6
	jc LB_7493
	btr r12,4
	jmp LB_7494
LB_7493:
	bts r12,4
LB_7494:
	mov rcx,r9
	bt r12,3
	jc LB_7495
	btr r12,6
	jmp LB_7496
LB_7495:
	bts r12,6
LB_7496:
	mov r9,r11
	bt r12,5
	jc LB_7497
	btr r12,3
	jmp LB_7498
LB_7497:
	bts r12,3
LB_7498:
	mov r11,r8
	bt r12,2
	jc LB_7499
	btr r12,5
	jmp LB_7500
LB_7499:
	bts r12,5
LB_7500:
	mov r8,rcx
	bt r12,6
	jc LB_7501
	btr r12,2
	jmp LB_7502
LB_7501:
	bts r12,2
LB_7502:
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
; _cns { { %_6583 %_6584 } %_6585 } ⊢ %_6586 : %_6586
 ; {>  %_6582~1':_p6480 %_6585~4':(_lst)◂({ _stg _p1551 }) %_6584~3':_p1551 %_6581~0':_stg %_6583~2':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f1563 %_6586 ⊢ %_6587 : %_6587
 ; {>  %_6582~1':_p6480 %_6581~0':_stg %_6586~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p1551 }) }
; _f1563 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_6581 %_6587 } ⊢ %_6588 : %_6588
 ; {>  %_6582~1':_p6480 %_6581~0':_stg %_6587~°0◂°0◂{ { 2' 3' } 4' }:_p1542 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_6588
 ; {>  %_6582~1':_p6480 %_6588~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p1542 }) }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_7386
	mov rdi,r14
	call dlt
LB_7386:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_7387
	btr r12,1
	jmp LB_7388
LB_7387:
	bts r12,1
LB_7388:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_7391
	btr r12,5
	jmp LB_7392
LB_7391:
	bts r12,5
LB_7392:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7389
	btr QWORD [rdi],0
	jmp LB_7390
LB_7389:
	bts QWORD [rdi],0
LB_7390:
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
	jc LB_7403
	btr r12,6
	jmp LB_7404
LB_7403:
	bts r12,6
LB_7404:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_7401
	btr QWORD [rdi],0
	jmp LB_7402
LB_7401:
	bts QWORD [rdi],0
LB_7402:
	mov rcx,r14
	bt r12,1
	jc LB_7407
	btr r12,6
	jmp LB_7408
LB_7407:
	bts r12,6
LB_7408:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_7405
	btr QWORD [rdi],1
	jmp LB_7406
LB_7405:
	bts QWORD [rdi],1
LB_7406:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7399
	btr QWORD [rdi],0
	jmp LB_7400
LB_7399:
	bts QWORD [rdi],0
LB_7400:
	mov r13,r10
	bt r12,4
	jc LB_7411
	btr r12,0
	jmp LB_7412
LB_7411:
	bts r12,0
LB_7412:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7409
	btr QWORD [rdi],1
	jmp LB_7410
LB_7409:
	bts QWORD [rdi],1
LB_7410:
	mov rsi,1
	bt r12,5
	jc LB_7397
	mov rsi,0
	bt r11,0
	jc LB_7397
	jmp LB_7398
LB_7397:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7398:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_7395
	mov rsi,0
	bt r11,0
	jc LB_7395
	jmp LB_7396
LB_7395:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7396:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7393
	btr QWORD [rdi],1
	jmp LB_7394
LB_7393:
	bts QWORD [rdi],1
LB_7394:
	mov r8,0
	bts r12,2
	ret
LB_7413:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7415
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7414
LB_7415:
	add rsp,8
	ret
LB_7416:
	add rsp,112
	pop r14
LB_7414:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6481:
NS_E_RDI_6481:
NS_E_6481_ETR_TBL:
NS_E_6481_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_7517
LB_7516:
	add r14,1
LB_7517:
	cmp r14,r10
	jge LB_7518
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7516
	cmp al,10
	jz LB_7516
	cmp al,32
	jz LB_7516
LB_7518:
	add r14,3
	cmp r14,r10
	jg LB_7521
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7521
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_7521
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_7521
	jmp LB_7522
LB_7521:
	jmp LB_7503
LB_7522:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_7511
LB_7510:
	add r14,1
LB_7511:
	cmp r14,r10
	jge LB_7512
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7510
	cmp al,10
	jz LB_7510
	cmp al,32
	jz LB_7510
LB_7512:
	push r10
	call NS_E_6162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7513
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7514
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7514:
	jmp LB_7504
LB_7513:
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
	jc LB_7507
	btr QWORD [rdi],1
LB_7507:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7508
	btr QWORD [rdi],0
LB_7508:
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
LB_7504:
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
LB_7503:
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
LB_7505:
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
NS_E_6482:
NS_E_RDI_6482:
NS_E_6482_ETR_TBL:
NS_E_6482_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_7576
LB_7575:
	add r14,1
LB_7576:
	cmp r14,r10
	jge LB_7577
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7575
	cmp al,10
	jz LB_7575
	cmp al,32
	jz LB_7575
LB_7577:
	add r14,1
	cmp r14,r10
	jg LB_7580
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_7580
	jmp LB_7581
LB_7580:
	jmp LB_7542
LB_7581:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
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
	add r14,1
	cmp r14,r10
	jg LB_7558
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_7558
	jmp LB_7559
LB_7558:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7556
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7556:
	jmp LB_7543
LB_7559:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_7561
LB_7560:
	add r14,1
LB_7561:
	cmp r14,r10
	jge LB_7562
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7560
	cmp al,10
	jz LB_7560
	cmp al,32
	jz LB_7560
LB_7562:
	push r10
	call NS_E_6479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7563
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7564
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7564:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7565
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7565:
	jmp LB_7543
LB_7563:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_7568
LB_7567:
	add r14,1
LB_7568:
	cmp r14,r10
	jge LB_7569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7567
	cmp al,10
	jz LB_7567
	cmp al,32
	jz LB_7567
LB_7569:
	push r10
	call NS_E_6482_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7570
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7571
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7571:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7572
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7572:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7573
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7573:
	jmp LB_7543
LB_7570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7550
	btr r12,3
	clc
	jmp LB_7551
LB_7550:
	bts r12,3
	stc
LB_7551:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7548
	btr r12,2
	clc
	jmp LB_7549
LB_7548:
	bts r12,2
	stc
LB_7549:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7546
	btr r12,1
	clc
	jmp LB_7547
LB_7546:
	bts r12,1
	stc
LB_7547:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7544
	btr r12,0
	clc
	jmp LB_7545
LB_7544:
	bts r12,0
	stc
LB_7545:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7539
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_7582
	btr r12,4
	jmp LB_7583
LB_7582:
	bts r12,4
LB_7583:
	mov r8,r9
	bt r12,3
	jc LB_7584
	btr r12,2
	jmp LB_7585
LB_7584:
	bts r12,2
LB_7585:
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
	jc LB_7588
	btr r12,3
	clc
	jmp LB_7589
LB_7588:
	bts r12,3
	stc
LB_7589:
	mov r13,r9
	bt r12,3
	jc LB_7586
	btr r12,0
	jmp LB_7587
LB_7586:
	bts r12,0
LB_7587:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_7592
	btr r12,3
	clc
	jmp LB_7593
LB_7592:
	bts r12,3
	stc
LB_7593:
	mov r14,r9
	bt r12,3
	jc LB_7590
	btr r12,1
	jmp LB_7591
LB_7590:
	bts r12,1
LB_7591:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_6591 %_6592 } ⊢ %_6593 : %_6593
 ; {>  %_6591~{ 0' 1' }:{ _stg _p1542 } %_6592~2':(_lst)◂({ _stg _p1542 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_6593 ⊢ %_6594 : %_6594
 ; {>  %_6593~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1542 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_6594
 ; {>  %_6594~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1542 })) }
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
	jc LB_7529
	btr r12,5
	jmp LB_7530
LB_7529:
	bts r12,5
LB_7530:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7527
	btr QWORD [rdi],0
	jmp LB_7528
LB_7527:
	bts QWORD [rdi],0
LB_7528:
	mov r11,r14
	bt r12,1
	jc LB_7533
	btr r12,5
	jmp LB_7534
LB_7533:
	bts r12,5
LB_7534:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7531
	btr QWORD [rdi],1
	jmp LB_7532
LB_7531:
	bts QWORD [rdi],1
LB_7532:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7525
	btr QWORD [rdi],0
	jmp LB_7526
LB_7525:
	bts QWORD [rdi],0
LB_7526:
	mov r10,r8
	bt r12,2
	jc LB_7537
	btr r12,4
	jmp LB_7538
LB_7537:
	bts r12,4
LB_7538:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7535
	btr QWORD [rdi],1
	jmp LB_7536
LB_7535:
	bts QWORD [rdi],1
LB_7536:
	mov rsi,1
	bt r12,3
	jc LB_7523
	mov rsi,0
	bt r9,0
	jc LB_7523
	jmp LB_7524
LB_7523:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7524:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7539:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7541
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7540
LB_7541:
	add rsp,8
	ret
LB_7543:
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
LB_7542:
	add rsp,64
	pop r14
LB_7540:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_7596
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_6595 : %_6595
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_6595 ⊢ %_6596 : %_6596
 ; {>  %_6595~°1◂{  }:(_lst)◂(t2792'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6596
 ; {>  %_6596~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2795'(0))) }
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
	jc LB_7594
	mov rsi,0
	bt r9,0
	jc LB_7594
	jmp LB_7595
LB_7594:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7595:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7596:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7598
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7597
LB_7598:
	add rsp,8
	ret
LB_7599:
	add rsp,0
	pop r14
LB_7597:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6483:
NS_E_RDI_6483:
NS_E_6483_ETR_TBL:
NS_E_6483_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_7664
LB_7663:
	add r14,1
LB_7664:
	cmp r14,r10
	jge LB_7665
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7663
	cmp al,10
	jz LB_7663
	cmp al,32
	jz LB_7663
LB_7665:
	add r14,3
	cmp r14,r10
	jg LB_7668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_7668
	jmp LB_7669
LB_7668:
	jmp LB_7619
LB_7669:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_7632
LB_7631:
	add r14,1
LB_7632:
	cmp r14,r10
	jge LB_7633
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7631
	cmp al,10
	jz LB_7631
	cmp al,32
	jz LB_7631
LB_7633:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7634
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7635
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7635:
	jmp LB_7620
LB_7634:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_7638
LB_7637:
	add r14,1
LB_7638:
	cmp r14,r10
	jge LB_7639
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7637
	cmp al,10
	jz LB_7637
	cmp al,32
	jz LB_7637
LB_7639:
	add r14,1
	cmp r14,r10
	jg LB_7644
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_7644
	jmp LB_7645
LB_7644:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7641
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7641:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7642
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7642:
	jmp LB_7620
LB_7645:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_7647
LB_7646:
	add r14,1
LB_7647:
	cmp r14,r10
	jge LB_7648
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7646
	cmp al,10
	jz LB_7646
	cmp al,32
	jz LB_7646
LB_7648:
	push r10
	call NS_E_6158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7649
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7650
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7650:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7651
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7651:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7652
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7652:
	jmp LB_7620
LB_7649:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
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
	call NS_E_6483_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7657
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7658
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7658:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7659
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7659:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7660
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7660:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7661
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7661:
	jmp LB_7620
LB_7657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7629
	btr r12,4
	clc
	jmp LB_7630
LB_7629:
	bts r12,4
	stc
LB_7630:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7627
	btr r12,3
	clc
	jmp LB_7628
LB_7627:
	bts r12,3
	stc
LB_7628:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7625
	btr r12,2
	clc
	jmp LB_7626
LB_7625:
	bts r12,2
	stc
LB_7626:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7623
	btr r12,1
	clc
	jmp LB_7624
LB_7623:
	bts r12,1
	stc
LB_7624:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7621
	btr r12,0
	clc
	jmp LB_7622
LB_7621:
	bts r12,0
	stc
LB_7622:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7616
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_7670
	btr r12,5
	jmp LB_7671
LB_7670:
	bts r12,5
LB_7671:
	mov r8,r10
	bt r12,4
	jc LB_7672
	btr r12,2
	jmp LB_7673
LB_7672:
	bts r12,2
LB_7673:
	mov r10,r14
	bt r12,1
	jc LB_7674
	btr r12,4
	jmp LB_7675
LB_7674:
	bts r12,4
LB_7675:
	mov r14,r9
	bt r12,3
	jc LB_7676
	btr r12,1
	jmp LB_7677
LB_7676:
	bts r12,1
LB_7677:
	mov r9,r13
	bt r12,0
	jc LB_7678
	btr r12,3
	jmp LB_7679
LB_7678:
	bts r12,3
LB_7679:
	mov r13,r10
	bt r12,4
	jc LB_7680
	btr r12,0
	jmp LB_7681
LB_7680:
	bts r12,0
LB_7681:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_6597 %_6598 } %_6599 } ⊢ %_6600 : %_6600
 ; {>  %_6598~1':_p1551 %_6599~2':(_lst)◂({ _stg _p1551 }) %_6597~0':_stg }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_6600 ⊢ %_6601 : %_6601
 ; {>  %_6600~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1551 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_6601
 ; {>  %_6601~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1551 })) }
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
	jc LB_7606
	btr r12,5
	jmp LB_7607
LB_7606:
	bts r12,5
LB_7607:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7604
	btr QWORD [rdi],0
	jmp LB_7605
LB_7604:
	bts QWORD [rdi],0
LB_7605:
	mov r11,r14
	bt r12,1
	jc LB_7610
	btr r12,5
	jmp LB_7611
LB_7610:
	bts r12,5
LB_7611:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7608
	btr QWORD [rdi],1
	jmp LB_7609
LB_7608:
	bts QWORD [rdi],1
LB_7609:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7602
	btr QWORD [rdi],0
	jmp LB_7603
LB_7602:
	bts QWORD [rdi],0
LB_7603:
	mov r10,r8
	bt r12,2
	jc LB_7614
	btr r12,4
	jmp LB_7615
LB_7614:
	bts r12,4
LB_7615:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7612
	btr QWORD [rdi],1
	jmp LB_7613
LB_7612:
	bts QWORD [rdi],1
LB_7613:
	mov rsi,1
	bt r12,3
	jc LB_7600
	mov rsi,0
	bt r9,0
	jc LB_7600
	jmp LB_7601
LB_7600:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7601:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7616:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7618
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7617
LB_7618:
	add rsp,8
	ret
LB_7620:
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
LB_7619:
	add rsp,80
	pop r14
LB_7617:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_7684
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_6602 : %_6602
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_6602 ⊢ %_6603 : %_6603
 ; {>  %_6602~°1◂{  }:(_lst)◂(t2806'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6603
 ; {>  %_6603~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2809'(0))) }
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
	jc LB_7682
	mov rsi,0
	bt r9,0
	jc LB_7682
	jmp LB_7683
LB_7682:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7683:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7684:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7686
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7685
LB_7686:
	add rsp,8
	ret
LB_7687:
	add rsp,0
	pop r14
LB_7685:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6484:
NS_E_RDI_6484:
NS_E_6484_ETR_TBL:
NS_E_6484_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_7778
LB_7777:
	add r14,1
LB_7778:
	cmp r14,r10
	jge LB_7779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7777
	cmp al,10
	jz LB_7777
	cmp al,32
	jz LB_7777
LB_7779:
	add r14,1
	cmp r14,r10
	jg LB_7782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_7782
	jmp LB_7783
LB_7782:
	jmp LB_7725
LB_7783:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_7740
LB_7739:
	add r14,1
LB_7740:
	cmp r14,r10
	jge LB_7741
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7739
	cmp al,10
	jz LB_7739
	cmp al,32
	jz LB_7739
LB_7741:
	add r14,1
	cmp r14,r10
	jg LB_7745
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_7745
	jmp LB_7746
LB_7745:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7743:
	jmp LB_7726
LB_7746:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_7748
LB_7747:
	add r14,1
LB_7748:
	cmp r14,r10
	jge LB_7749
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7747
	cmp al,10
	jz LB_7747
	cmp al,32
	jz LB_7747
LB_7749:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7750
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7751
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7751:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7752
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7752:
	jmp LB_7726
LB_7750:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_7755
LB_7754:
	add r14,1
LB_7755:
	cmp r14,r10
	jge LB_7756
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7754
	cmp al,10
	jz LB_7754
	cmp al,32
	jz LB_7754
LB_7756:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7757
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7758
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7758:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7759
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7759:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7760
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7760:
	jmp LB_7726
LB_7757:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_7763
LB_7762:
	add r14,1
LB_7763:
	cmp r14,r10
	jge LB_7764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7762
	cmp al,10
	jz LB_7762
	cmp al,32
	jz LB_7762
LB_7764:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7765
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7766
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7766:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7767
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7767:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7768
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7768:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7769
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7769:
	jmp LB_7726
LB_7765:
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
LB_7775:
	jmp LB_7772
LB_7771:
	add r14,1
LB_7772:
	cmp r14,r10
	jge LB_7773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7771
	cmp al,10
	jz LB_7771
	cmp al,32
	jz LB_7771
LB_7773:
	push r10
	push rsi
	call NS_E_6485_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_7774
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_7776
	bts QWORD [rax],0
LB_7776:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_7775
LB_7774:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_7737
	btr r12,5
	clc
	jmp LB_7738
LB_7737:
	bts r12,5
	stc
LB_7738:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7735
	btr r12,4
	clc
	jmp LB_7736
LB_7735:
	bts r12,4
	stc
LB_7736:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7733
	btr r12,3
	clc
	jmp LB_7734
LB_7733:
	bts r12,3
	stc
LB_7734:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7731
	btr r12,2
	clc
	jmp LB_7732
LB_7731:
	bts r12,2
	stc
LB_7732:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
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
	add rsp,96
	push rdi
	push rsi
	push LB_7722
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_7784
	btr r12,6
	jmp LB_7785
LB_7784:
	bts r12,6
LB_7785:
	mov r9,r11
	bt r12,5
	jc LB_7786
	btr r12,3
	jmp LB_7787
LB_7786:
	bts r12,3
LB_7787:
	mov r11,r8
	bt r12,2
	jc LB_7788
	btr r12,5
	jmp LB_7789
LB_7788:
	bts r12,5
LB_7789:
	mov r8,r10
	bt r12,4
	jc LB_7790
	btr r12,2
	jmp LB_7791
LB_7790:
	bts r12,2
LB_7791:
	mov r10,r14
	bt r12,1
	jc LB_7792
	btr r12,4
	jmp LB_7793
LB_7792:
	bts r12,4
LB_7793:
	mov r14,rcx
	bt r12,6
	jc LB_7794
	btr r12,1
	jmp LB_7795
LB_7794:
	bts r12,1
LB_7795:
	mov rcx,r13
	bt r12,0
	jc LB_7796
	btr r12,6
	jmp LB_7797
LB_7796:
	bts r12,6
LB_7797:
	mov r13,r11
	bt r12,5
	jc LB_7798
	btr r12,0
	jmp LB_7799
LB_7798:
	bts r12,0
LB_7799:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f676 %_6607 ⊢ %_6608 : %_6608
 ; {>  %_6607~3':(_lst)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) %_6605~1':(_p1487)◂((_p1495)◂(_stg)) %_6604~0':_stg %_6606~2':(_p1505)◂(_stg) }
; _f676 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_7694
	btr r12,0
	jmp LB_7695
LB_7694:
	bts r12,0
LB_7695:
	call NS_E_676
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_7696
	btr r12,3
	jmp LB_7697
LB_7696:
	bts r12,3
LB_7697:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7692
	btr r12,2
	clc
	jmp LB_7693
LB_7692:
	bts r12,2
	stc
LB_7693:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7690
	btr r12,1
	clc
	jmp LB_7691
LB_7690:
	bts r12,1
	stc
LB_7691:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7688
	btr r12,0
	clc
	jmp LB_7689
LB_7688:
	bts r12,0
	stc
LB_7689:
	add rsp,32
; _cns { { %_6604 %_6605 %_6606 } %_6608 } ⊢ %_6609 : %_6609
 ; {>  %_6608~3':(_lst)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) %_6605~1':(_p1487)◂((_p1495)◂(_stg)) %_6604~0':_stg %_6606~2':(_p1505)◂(_stg) }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f1555 %_6609 ⊢ %_6610 : %_6610
 ; {>  %_6609~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) }
; _f1555 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_6610 ⊢ %_6611 : %_6611
 ; {>  %_6610~°3◂°0◂{ { 0' 1' 2' } 3' }:_p1539 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_6611
 ; {>  %_6611~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p1539) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_7698
	btr r12,4
	jmp LB_7699
LB_7698:
	bts r12,4
LB_7699:
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
	jc LB_7708
	btr r12,6
	jmp LB_7709
LB_7708:
	bts r12,6
LB_7709:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_7706
	btr QWORD [rdi],0
	jmp LB_7707
LB_7706:
	bts QWORD [rdi],0
LB_7707:
	mov rcx,r14
	bt r12,1
	jc LB_7712
	btr r12,6
	jmp LB_7713
LB_7712:
	bts r12,6
LB_7713:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_7710
	btr QWORD [rdi],1
	jmp LB_7711
LB_7710:
	bts QWORD [rdi],1
LB_7711:
	mov rcx,r8
	bt r12,2
	jc LB_7716
	btr r12,6
	jmp LB_7717
LB_7716:
	bts r12,6
LB_7717:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_7714
	btr QWORD [rdi],2
	jmp LB_7715
LB_7714:
	bts QWORD [rdi],2
LB_7715:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7704
	btr QWORD [rdi],0
	jmp LB_7705
LB_7704:
	bts QWORD [rdi],0
LB_7705:
	mov r11,r10
	bt r12,4
	jc LB_7720
	btr r12,5
	jmp LB_7721
LB_7720:
	bts r12,5
LB_7721:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7718
	btr QWORD [rdi],1
	jmp LB_7719
LB_7718:
	bts QWORD [rdi],1
LB_7719:
	mov rsi,1
	bt r12,3
	jc LB_7702
	mov rsi,0
	bt r9,0
	jc LB_7702
	jmp LB_7703
LB_7702:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7703:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7700
	mov rsi,0
	bt r9,0
	jc LB_7700
	jmp LB_7701
LB_7700:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7701:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7722:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7724
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7723
LB_7724:
	add rsp,8
	ret
LB_7726:
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
LB_7725:
	add rsp,96
	pop r14
LB_7723:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_7819
LB_7818:
	add r14,1
LB_7819:
	cmp r14,r10
	jge LB_7820
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7818
	cmp al,10
	jz LB_7818
	cmp al,32
	jz LB_7818
LB_7820:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7821
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7813
LB_7821:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_7824
LB_7823:
	add r14,1
LB_7824:
	cmp r14,r10
	jge LB_7825
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7823
	cmp al,10
	jz LB_7823
	cmp al,32
	jz LB_7823
LB_7825:
	push r10
	call NS_E_6486_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7826
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7827
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7827:
	jmp LB_7813
LB_7826:
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
	jc LB_7816
	btr r12,1
	clc
	jmp LB_7817
LB_7816:
	bts r12,1
	stc
LB_7817:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7814
	btr r12,0
	clc
	jmp LB_7815
LB_7814:
	bts r12,0
	stc
LB_7815:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7810
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1554 { %_6612 %_6613 } ⊢ %_6614 : %_6614
 ; {>  %_6613~1':_p1541 %_6612~0':_stg }
; _f1554 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_6614 ⊢ %_6615 : %_6615
 ; {>  %_6614~°2◂{ 0' 1' }:_p1539 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_6615
 ; {>  %_6615~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1539) }
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
	jc LB_7804
	btr r12,2
	jmp LB_7805
LB_7804:
	bts r12,2
LB_7805:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7802
	btr QWORD [rdi],0
	jmp LB_7803
LB_7802:
	bts QWORD [rdi],0
LB_7803:
	mov r8,r14
	bt r12,1
	jc LB_7808
	btr r12,2
	jmp LB_7809
LB_7808:
	bts r12,2
LB_7809:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7806
	btr QWORD [rdi],1
	jmp LB_7807
LB_7806:
	bts QWORD [rdi],1
LB_7807:
	mov rsi,1
	bt r12,3
	jc LB_7800
	mov rsi,0
	bt r9,0
	jc LB_7800
	jmp LB_7801
LB_7800:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7801:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7810:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7812
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7811
LB_7812:
	add rsp,8
	ret
LB_7813:
	add rsp,32
	pop r14
LB_7811:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_7830
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; 	» "lc_etr_body 0" _ ⊢ 0' : %_6616
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_6616 ⊢ %_6617 : %_6617
 ; {>  %_6616~0':_stg }
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
; _none {  } ⊢ %_6618 : %_6618
 ; {>  %_6617~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_6618
 ; {>  %_6617~0':_stg %_6618~°1◂{  }:(_opn)◂(t2836'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_7829
	mov rdi,r13
	call dlt
LB_7829:
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
LB_7830:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7832
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7831
LB_7832:
	add rsp,8
	ret
LB_7833:
	add rsp,0
	pop r14
LB_7831:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6485:
NS_E_RDI_6485:
NS_E_6485_ETR_TBL:
NS_E_6485_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_7861
LB_7860:
	add r14,1
LB_7861:
	cmp r14,r10
	jge LB_7862
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7860
	cmp al,10
	jz LB_7860
	cmp al,32
	jz LB_7860
LB_7862:
	add r14,1
	cmp r14,r10
	jg LB_7865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_7865
	jmp LB_7866
LB_7865:
	jmp LB_7849
LB_7866:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_7868
LB_7867:
	add r14,1
LB_7868:
	cmp r14,r10
	jge LB_7869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7867
	cmp al,10
	jz LB_7867
	cmp al,32
	jz LB_7867
LB_7869:
	add r14,1
	cmp r14,r10
	jg LB_7873
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_7873
	jmp LB_7874
LB_7873:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7871
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7871:
	jmp LB_7849
LB_7874:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_7876
LB_7875:
	add r14,1
LB_7876:
	cmp r14,r10
	jge LB_7877
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7875
	cmp al,10
	jz LB_7875
	cmp al,32
	jz LB_7875
LB_7877:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7878
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7879
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7879:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7880:
	jmp LB_7849
LB_7878:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_7883
LB_7882:
	add r14,1
LB_7883:
	cmp r14,r10
	jge LB_7884
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7882
	cmp al,10
	jz LB_7882
	cmp al,32
	jz LB_7882
LB_7884:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7885
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7886
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7886:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7887
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7887:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7888
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7888:
	jmp LB_7849
LB_7885:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_7891
LB_7890:
	add r14,1
LB_7891:
	cmp r14,r10
	jge LB_7892
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7890
	cmp al,10
	jz LB_7890
	cmp al,32
	jz LB_7890
LB_7892:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7893
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7894
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7894:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7895
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7895:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7896
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7896:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7897
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7897:
	jmp LB_7849
LB_7893:
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
	jc LB_7858
	btr r12,4
	clc
	jmp LB_7859
LB_7858:
	bts r12,4
	stc
LB_7859:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7856
	btr r12,3
	clc
	jmp LB_7857
LB_7856:
	bts r12,3
	stc
LB_7857:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7854
	btr r12,2
	clc
	jmp LB_7855
LB_7854:
	bts r12,2
	stc
LB_7855:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7852
	btr r12,1
	clc
	jmp LB_7853
LB_7852:
	bts r12,1
	stc
LB_7853:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7850
	btr r12,0
	clc
	jmp LB_7851
LB_7850:
	bts r12,0
	stc
LB_7851:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7846
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov rdi,r8
	mov QWORD [st_vct+8*8],rdi
	bt r12,2
	jc LB_7899
	btr r12,8
	jmp LB_7900
LB_7899:
	bts r12,8
LB_7900:
	mov r8,r10
	bt r12,4
	jc LB_7901
	btr r12,2
	jmp LB_7902
LB_7901:
	bts r12,2
LB_7902:
	mov r10,r14
	bt r12,1
	jc LB_7903
	btr r12,4
	jmp LB_7904
LB_7903:
	bts r12,4
LB_7904:
	mov r14,r9
	bt r12,3
	jc LB_7905
	btr r12,1
	jmp LB_7906
LB_7905:
	bts r12,1
LB_7906:
	mov r9,r13
	bt r12,0
	jc LB_7907
	btr r12,3
	jmp LB_7908
LB_7907:
	bts r12,3
LB_7908:
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7909
	btr r12,0
	jmp LB_7910
LB_7909:
	bts r12,0
LB_7910:
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
; _some { %_6619 %_6620 %_6621 } ⊢ %_6622 : %_6622
 ; {>  %_6619~0':_stg %_6620~1':(_p1487)◂((_p1495)◂(_stg)) %_6621~2':(_p1505)◂(_stg) }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_6622
 ; {>  %_6622~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) }) }
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
	jc LB_7836
	btr r12,4
	jmp LB_7837
LB_7836:
	bts r12,4
LB_7837:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7834
	btr QWORD [rdi],0
	jmp LB_7835
LB_7834:
	bts QWORD [rdi],0
LB_7835:
	mov r10,r14
	bt r12,1
	jc LB_7840
	btr r12,4
	jmp LB_7841
LB_7840:
	bts r12,4
LB_7841:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7838
	btr QWORD [rdi],1
	jmp LB_7839
LB_7838:
	bts QWORD [rdi],1
LB_7839:
	mov r10,r8
	bt r12,2
	jc LB_7844
	btr r12,4
	jmp LB_7845
LB_7844:
	bts r12,4
LB_7845:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_7842
	btr QWORD [rdi],2
	jmp LB_7843
LB_7842:
	bts QWORD [rdi],2
LB_7843:
	mov r8,0
	bts r12,2
	ret
LB_7846:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7848
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7847
LB_7848:
	add rsp,8
	ret
LB_7849:
	add rsp,80
	pop r14
LB_7847:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6486:
NS_E_RDI_6486:
NS_E_6486_ETR_TBL:
NS_E_6486_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_7931
LB_7930:
	add r14,1
LB_7931:
	cmp r14,r10
	jge LB_7932
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7930
	cmp al,10
	jz LB_7930
	cmp al,32
	jz LB_7930
LB_7932:
	add r14,1
	cmp r14,r10
	jg LB_7935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_7935
	jmp LB_7936
LB_7935:
	jmp LB_7918
LB_7936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_7925
LB_7924:
	add r14,1
LB_7925:
	cmp r14,r10
	jge LB_7926
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7924
	cmp al,10
	jz LB_7924
	cmp al,32
	jz LB_7924
LB_7926:
	push r10
	call NS_E_5144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7927
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7928
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7928:
	jmp LB_7919
LB_7927:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7922
	btr r12,1
	clc
	jmp LB_7923
LB_7922:
	bts r12,1
	stc
LB_7923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7920
	btr r12,0
	clc
	jmp LB_7921
LB_7920:
	bts r12,0
	stc
LB_7921:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7915
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7937
	btr r12,2
	jmp LB_7938
LB_7937:
	bts r12,2
LB_7938:
	mov r13,r14
	bt r12,1
	jc LB_7939
	btr r12,0
	jmp LB_7940
LB_7939:
	bts r12,0
LB_7940:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1561 %_6623 ⊢ %_6624 : %_6624
 ; {>  %_6623~0':_p1490 }
; _f1561 0' ⊢ °1◂0'
; _some %_6624 ⊢ %_6625 : %_6625
 ; {>  %_6624~°1◂0':_p1541 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6625
 ; {>  %_6625~°0◂°1◂0':(_opn)◂(_p1541) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7913
	btr r12,3
	jmp LB_7914
LB_7913:
	bts r12,3
LB_7914:
	mov rsi,1
	bt r12,3
	jc LB_7911
	mov rsi,0
	bt r9,0
	jc LB_7911
	jmp LB_7912
LB_7911:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7912:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7915:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7917
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7916
LB_7917:
	add rsp,8
	ret
LB_7919:
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
LB_7918:
	add rsp,32
	pop r14
LB_7916:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_7961
LB_7960:
	add r14,1
LB_7961:
	cmp r14,r10
	jge LB_7962
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7960
	cmp al,10
	jz LB_7960
	cmp al,32
	jz LB_7960
LB_7962:
	add r14,2
	cmp r14,r10
	jg LB_7965
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_7965
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_7965
	jmp LB_7966
LB_7965:
	jmp LB_7948
LB_7966:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_7955
LB_7954:
	add r14,1
LB_7955:
	cmp r14,r10
	jge LB_7956
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7954
	cmp al,10
	jz LB_7954
	cmp al,32
	jz LB_7954
LB_7956:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7957
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7958
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7958:
	jmp LB_7949
LB_7957:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7952
	btr r12,1
	clc
	jmp LB_7953
LB_7952:
	bts r12,1
	stc
LB_7953:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7950
	btr r12,0
	clc
	jmp LB_7951
LB_7950:
	bts r12,0
	stc
LB_7951:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7945
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7967
	btr r12,2
	jmp LB_7968
LB_7967:
	bts r12,2
LB_7968:
	mov r13,r14
	bt r12,1
	jc LB_7969
	btr r12,0
	jmp LB_7970
LB_7969:
	bts r12,0
LB_7970:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1562 %_6626 ⊢ %_6627 : %_6627
 ; {>  %_6626~0':(_p1505)◂(_stg) }
; _f1562 0' ⊢ °2◂0'
; _some %_6627 ⊢ %_6628 : %_6628
 ; {>  %_6627~°2◂0':_p1541 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_6628
 ; {>  %_6628~°0◂°2◂0':(_opn)◂(_p1541) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7943
	btr r12,3
	jmp LB_7944
LB_7943:
	bts r12,3
LB_7944:
	mov rsi,1
	bt r12,3
	jc LB_7941
	mov rsi,0
	bt r9,0
	jc LB_7941
	jmp LB_7942
LB_7941:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7942:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7945:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7947
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7946
LB_7947:
	add rsp,8
	ret
LB_7949:
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
LB_7948:
	add rsp,32
	pop r14
LB_7946:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_7990
LB_7989:
	add r14,1
LB_7990:
	cmp r14,r10
	jge LB_7991
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7989
	cmp al,10
	jz LB_7989
	cmp al,32
	jz LB_7989
LB_7991:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7992
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7984
LB_7992:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_7995
LB_7994:
	add r14,1
LB_7995:
	cmp r14,r10
	jge LB_7996
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7994
	cmp al,10
	jz LB_7994
	cmp al,32
	jz LB_7994
LB_7996:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7997
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7998
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7998:
	jmp LB_7984
LB_7997:
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
	jc LB_7987
	btr r12,1
	clc
	jmp LB_7988
LB_7987:
	bts r12,1
	stc
LB_7988:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7985
	btr r12,0
	clc
	jmp LB_7986
LB_7985:
	bts r12,0
	stc
LB_7986:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7981
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1560 { %_6629 %_6630 } ⊢ %_6631 : %_6631
 ; {>  %_6630~1':(_p1505)◂(_stg) %_6629~0':(_p1487)◂((_p1495)◂(_stg)) }
; _f1560 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6631 ⊢ %_6632 : %_6632
 ; {>  %_6631~°0◂{ 0' 1' }:_p1541 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6632
 ; {>  %_6632~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1541) }
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
	jc LB_7975
	btr r12,2
	jmp LB_7976
LB_7975:
	bts r12,2
LB_7976:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_7973
	btr QWORD [rdi],0
	jmp LB_7974
LB_7973:
	bts QWORD [rdi],0
LB_7974:
	mov r8,r14
	bt r12,1
	jc LB_7979
	btr r12,2
	jmp LB_7980
LB_7979:
	bts r12,2
LB_7980:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_7977
	btr QWORD [rdi],1
	jmp LB_7978
LB_7977:
	bts QWORD [rdi],1
LB_7978:
	mov rsi,1
	bt r12,3
	jc LB_7971
	mov rsi,0
	bt r9,0
	jc LB_7971
	jmp LB_7972
LB_7971:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7972:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7981:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7983
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7982
LB_7983:
	add rsp,8
	ret
LB_7984:
	add rsp,32
	pop r14
LB_7982:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6487:
NS_E_RDI_6487:
NS_E_6487_ETR_TBL:
NS_E_6487_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142|"
	jmp LB_8009
LB_8008:
	add r14,1
LB_8009:
	cmp r14,r10
	jge LB_8010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8008
	cmp al,10
	jz LB_8008
	cmp al,32
	jz LB_8008
LB_8010:
	add r14,4
	cmp r14,r10
	jg LB_8013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,142
	jnz LB_8013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,124
	jnz LB_8013
	jmp LB_8014
LB_8013:
	jmp LB_8005
LB_8014:
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
	jc LB_8006
	btr r12,0
	clc
	jmp LB_8007
LB_8006:
	bts r12,0
	stc
LB_8007:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8002
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1517 {  } ⊢ %_6633 : %_6633
 ; {>  }
; _f1517 {  } ⊢ °4◂{  }
; _some %_6633 ⊢ %_6634 : %_6634
 ; {>  %_6633~°4◂{  }:(_p1505)◂(t2862'(0)) }
; _some °4◂{  } ⊢ °0◂°4◂{  }
; ∎ %_6634
 ; {>  %_6634~°0◂°4◂{  }:(_opn)◂((_p1505)◂(t2865'(0))) }
; 	∎ °0◂°4◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°4◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8000
	mov rsi,0
	bt r9,0
	jc LB_8000
	jmp LB_8001
LB_8000:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8001:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8002:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8004
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8003
LB_8004:
	add rsp,8
	ret
LB_8005:
	add rsp,16
	pop r14
LB_8003:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_8035
LB_8034:
	add r14,1
LB_8035:
	cmp r14,r10
	jge LB_8036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8034
	cmp al,10
	jz LB_8034
	cmp al,32
	jz LB_8034
LB_8036:
	add r14,3
	cmp r14,r10
	jg LB_8039
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8039
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_8039
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_8039
	jmp LB_8040
LB_8039:
	jmp LB_8022
LB_8040:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_8029
LB_8028:
	add r14,1
LB_8029:
	cmp r14,r10
	jge LB_8030
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8028
	cmp al,10
	jz LB_8028
	cmp al,32
	jz LB_8028
LB_8030:
	push r10
	call NS_E_5600_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8031
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8032
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8032:
	jmp LB_8023
LB_8031:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8026
	btr r12,1
	clc
	jmp LB_8027
LB_8026:
	bts r12,1
	stc
LB_8027:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8024
	btr r12,0
	clc
	jmp LB_8025
LB_8024:
	bts r12,0
	stc
LB_8025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8019
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8041
	btr r12,2
	jmp LB_8042
LB_8041:
	bts r12,2
LB_8042:
	mov r13,r14
	bt r12,1
	jc LB_8043
	btr r12,0
	jmp LB_8044
LB_8043:
	bts r12,0
LB_8044:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1516 %_6635 ⊢ %_6636 : %_6636
 ; {>  %_6635~0':(_p1487)◂((_p1494)◂(_stg)) }
; _f1516 0' ⊢ °3◂0'
; _some %_6636 ⊢ %_6637 : %_6637
 ; {>  %_6636~°3◂0':(_p1505)◂(_stg) }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_6637
 ; {>  %_6637~°0◂°3◂0':(_opn)◂((_p1505)◂(_stg)) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8017
	btr r12,3
	jmp LB_8018
LB_8017:
	bts r12,3
LB_8018:
	mov rsi,1
	bt r12,3
	jc LB_8015
	mov rsi,0
	bt r9,0
	jc LB_8015
	jmp LB_8016
LB_8015:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8016:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8019:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8021
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8020
LB_8021:
	add rsp,8
	ret
LB_8023:
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
LB_8022:
	add rsp,32
	pop r14
LB_8020:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_8056
LB_8055:
	add r14,1
LB_8056:
	cmp r14,r10
	jge LB_8057
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8055
	cmp al,10
	jz LB_8055
	cmp al,32
	jz LB_8055
LB_8057:
	push r10
	call NS_E_6497_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8058
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8052
LB_8058:
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
	jc LB_8053
	btr r12,0
	clc
	jmp LB_8054
LB_8053:
	bts r12,0
	stc
LB_8054:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8049
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1514 %_6638 ⊢ %_6639 : %_6639
 ; {>  %_6638~0':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _f1514 0' ⊢ °1◂0'
; _some %_6639 ⊢ %_6640 : %_6640
 ; {>  %_6639~°1◂0':(_p1505)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6640
 ; {>  %_6640~°0◂°1◂0':(_opn)◂((_p1505)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8047
	btr r12,3
	jmp LB_8048
LB_8047:
	bts r12,3
LB_8048:
	mov rsi,1
	bt r12,3
	jc LB_8045
	mov rsi,0
	bt r9,0
	jc LB_8045
	jmp LB_8046
LB_8045:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8046:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8049:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8051
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8050
LB_8051:
	add rsp,8
	ret
LB_8052:
	add rsp,16
	pop r14
LB_8050:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "$"
	jmp LB_8107
LB_8106:
	add r14,1
LB_8107:
	cmp r14,r10
	jge LB_8108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8106
	cmp al,10
	jz LB_8106
	cmp al,32
	jz LB_8106
LB_8108:
	add r14,1
	cmp r14,r10
	jg LB_8111
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_8111
	jmp LB_8112
LB_8111:
	jmp LB_8073
LB_8112:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_8084
LB_8083:
	add r14,1
LB_8084:
	cmp r14,r10
	jge LB_8085
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8083
	cmp al,10
	jz LB_8083
	cmp al,32
	jz LB_8083
LB_8085:
	push r10
	call NS_E_5600_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8086
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8087
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8087:
	jmp LB_8074
LB_8086:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_8090
LB_8089:
	add r14,1
LB_8090:
	cmp r14,r10
	jge LB_8091
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8089
	cmp al,10
	jz LB_8089
	cmp al,32
	jz LB_8089
LB_8091:
	add r14,3
	cmp r14,r10
	jg LB_8096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8096
	jmp LB_8097
LB_8096:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8093
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8093:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8094
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8094:
	jmp LB_8074
LB_8097:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; id_line
	jmp LB_8099
LB_8098:
	add r14,1
LB_8099:
	cmp r14,r10
	jge LB_8100
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8098
	cmp al,10
	jz LB_8098
	cmp al,32
	jz LB_8098
LB_8100:
	push r10
	call NS_E_6488_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8101
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8102
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8102:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8103
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8103:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8104
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8104:
	jmp LB_8074
LB_8101:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
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
	add rsp,64
	push rdi
	push rsi
	push LB_8070
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_8113
	btr r12,4
	jmp LB_8114
LB_8113:
	bts r12,4
LB_8114:
	mov r14,r9
	bt r12,3
	jc LB_8115
	btr r12,1
	jmp LB_8116
LB_8115:
	bts r12,1
LB_8116:
	mov r9,r13
	bt r12,0
	jc LB_8117
	btr r12,3
	jmp LB_8118
LB_8117:
	bts r12,3
LB_8118:
	mov r13,r10
	bt r12,4
	jc LB_8119
	btr r12,0
	jmp LB_8120
LB_8119:
	bts r12,0
LB_8120:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1515 { %_6641 %_6642 } ⊢ %_6643 : %_6643
 ; {>  %_6642~1':(_p1506)◂(_stg) %_6641~0':(_p1487)◂((_p1494)◂(_stg)) }
; _f1515 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_6643 ⊢ %_6644 : %_6644
 ; {>  %_6643~°2◂{ 0' 1' }:(_p1505)◂(_stg) }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_6644
 ; {>  %_6644~°0◂°2◂{ 0' 1' }:(_opn)◂((_p1505)◂(_stg)) }
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
	jc LB_8064
	btr r12,2
	jmp LB_8065
LB_8064:
	bts r12,2
LB_8065:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8062
	btr QWORD [rdi],0
	jmp LB_8063
LB_8062:
	bts QWORD [rdi],0
LB_8063:
	mov r8,r14
	bt r12,1
	jc LB_8068
	btr r12,2
	jmp LB_8069
LB_8068:
	bts r12,2
LB_8069:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8066
	btr QWORD [rdi],1
	jmp LB_8067
LB_8066:
	bts QWORD [rdi],1
LB_8067:
	mov rsi,1
	bt r12,3
	jc LB_8060
	mov rsi,0
	bt r9,0
	jc LB_8060
	jmp LB_8061
LB_8060:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8061:
	mov rax,0x0200_0000_0000_0001
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
LB_8073:
	add rsp,64
	pop r14
LB_8071:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_8140
LB_8139:
	add r14,1
LB_8140:
	cmp r14,r10
	jge LB_8141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8139
	cmp al,10
	jz LB_8139
	cmp al,32
	jz LB_8139
LB_8141:
	push r10
	call NS_E_6489_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8142
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8134
LB_8142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_8145
LB_8144:
	add r14,1
LB_8145:
	cmp r14,r10
	jge LB_8146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8144
	cmp al,10
	jz LB_8144
	cmp al,32
	jz LB_8144
LB_8146:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8147
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8148
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8148:
	jmp LB_8134
LB_8147:
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
	jc LB_8137
	btr r12,1
	clc
	jmp LB_8138
LB_8137:
	bts r12,1
	stc
LB_8138:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8135
	btr r12,0
	clc
	jmp LB_8136
LB_8135:
	bts r12,0
	stc
LB_8136:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8131
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1513 { %_6645 %_6646 } ⊢ %_6647 : %_6647
 ; {>  %_6645~0':(_p1507)◂(_stg) %_6646~1':(_p1505)◂(_stg) }
; _f1513 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6647 ⊢ %_6648 : %_6648
 ; {>  %_6647~°0◂{ 0' 1' }:(_p1505)◂(_stg) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6648
 ; {>  %_6648~°0◂°0◂{ 0' 1' }:(_opn)◂((_p1505)◂(_stg)) }
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
	jc LB_8125
	btr r12,2
	jmp LB_8126
LB_8125:
	bts r12,2
LB_8126:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8123
	btr QWORD [rdi],0
	jmp LB_8124
LB_8123:
	bts QWORD [rdi],0
LB_8124:
	mov r8,r14
	bt r12,1
	jc LB_8129
	btr r12,2
	jmp LB_8130
LB_8129:
	bts r12,2
LB_8130:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8127
	btr QWORD [rdi],1
	jmp LB_8128
LB_8127:
	bts QWORD [rdi],1
LB_8128:
	mov rsi,1
	bt r12,3
	jc LB_8121
	mov rsi,0
	bt r9,0
	jc LB_8121
	jmp LB_8122
LB_8121:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8122:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8131:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8133
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8132
LB_8133:
	add rsp,8
	ret
LB_8134:
	add rsp,32
	pop r14
LB_8132:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6488:
NS_E_RDI_6488:
NS_E_6488_ETR_TBL:
NS_E_6488_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_id_mtc
	jmp LB_8161
LB_8160:
	add r14,1
LB_8161:
	cmp r14,r10
	jge LB_8162
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8160
	cmp al,10
	jz LB_8160
	cmp al,32
	jz LB_8160
LB_8162:
	push r10
	call NS_E_6498_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8163
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8157
LB_8163:
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
	jc LB_8158
	btr r12,0
	clc
	jmp LB_8159
LB_8158:
	bts r12,0
	stc
LB_8159:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8154
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1518 %_6649 ⊢ %_6650 : %_6650
 ; {>  %_6649~0':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _f1518 0' ⊢ °0◂0'
; _some %_6650 ⊢ %_6651 : %_6651
 ; {>  %_6650~°0◂0':(_p1506)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6651
 ; {>  %_6651~°0◂°0◂0':(_opn)◂((_p1506)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8152
	btr r12,3
	jmp LB_8153
LB_8152:
	bts r12,3
LB_8153:
	mov rsi,1
	bt r12,3
	jc LB_8150
	mov rsi,0
	bt r9,0
	jc LB_8150
	jmp LB_8151
LB_8150:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8151:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8154:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8156
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8155
LB_8156:
	add rsp,8
	ret
LB_8157:
	add rsp,16
	pop r14
LB_8155:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; dst_ptn
	jmp LB_8194
LB_8193:
	add r14,1
LB_8194:
	cmp r14,r10
	jge LB_8195
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8193
	cmp al,10
	jz LB_8193
	cmp al,32
	jz LB_8193
LB_8195:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8196
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8186
LB_8196:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_tl
	jmp LB_8199
LB_8198:
	add r14,1
LB_8199:
	cmp r14,r10
	jge LB_8200
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8198
	cmp al,10
	jz LB_8198
	cmp al,32
	jz LB_8198
LB_8200:
	push r10
	call NS_E_5863_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8201
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8202
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8202:
	jmp LB_8186
LB_8201:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_8205
LB_8204:
	add r14,1
LB_8205:
	cmp r14,r10
	jge LB_8206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8204
	cmp al,10
	jz LB_8204
	cmp al,32
	jz LB_8204
LB_8206:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8207
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8208
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8208:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8209
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8209:
	jmp LB_8186
LB_8207:
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
	jc LB_8191
	btr r12,2
	clc
	jmp LB_8192
LB_8191:
	bts r12,2
	stc
LB_8192:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8189
	btr r12,1
	clc
	jmp LB_8190
LB_8189:
	bts r12,1
	stc
LB_8190:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8187
	btr r12,0
	clc
	jmp LB_8188
LB_8187:
	bts r12,0
	stc
LB_8188:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8183
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	bts r12,3
	bts r12,4
	bts r12,5
; _cns { %_6652 %_6653 } ⊢ %_6655 : %_6655
 ; {>  %_6652~0':(_p1487)◂((_p1495)◂(_stg)) %_6653~1':(_lst)◂((_p1487)◂((_p1495)◂(_stg))) %_6654~2':(_p1505)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f1519 { %_6655 %_6654 } ⊢ %_6656 : %_6656
 ; {>  %_6655~°0◂{ 0' 1' }:(_lst)◂((_p1487)◂((_p1495)◂(_stg))) %_6654~2':(_p1505)◂(_stg) }
; _f1519 { °0◂{ 0' 1' } 2' } ⊢ °1◂{ °0◂{ 0' 1' } 2' }
; _some %_6656 ⊢ %_6657 : %_6657
 ; {>  %_6656~°1◂{ °0◂{ 0' 1' } 2' }:(_p1506)◂(_stg) }
; _some °1◂{ °0◂{ 0' 1' } 2' } ⊢ °0◂°1◂{ °0◂{ 0' 1' } 2' }
; ∎ %_6657
 ; {>  %_6657~°0◂°1◂{ °0◂{ 0' 1' } 2' }:(_opn)◂((_p1506)◂(_stg)) }
; 	∎ °0◂°1◂{ °0◂{ 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂{ °0◂{ 0' 1' } 2' } ⊢ 2'◂3'
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
	jc LB_8173
	btr r12,5
	jmp LB_8174
LB_8173:
	bts r12,5
LB_8174:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8171
	btr QWORD [rdi],0
	jmp LB_8172
LB_8171:
	bts QWORD [rdi],0
LB_8172:
	mov r11,r14
	bt r12,1
	jc LB_8177
	btr r12,5
	jmp LB_8178
LB_8177:
	bts r12,5
LB_8178:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8175
	btr QWORD [rdi],1
	jmp LB_8176
LB_8175:
	bts QWORD [rdi],1
LB_8176:
	mov rsi,1
	bt r12,4
	jc LB_8169
	mov rsi,0
	bt r10,0
	jc LB_8169
	jmp LB_8170
LB_8169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_8170:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8167
	btr QWORD [rdi],0
	jmp LB_8168
LB_8167:
	bts QWORD [rdi],0
LB_8168:
	mov r10,r8
	bt r12,2
	jc LB_8181
	btr r12,4
	jmp LB_8182
LB_8181:
	bts r12,4
LB_8182:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8179
	btr QWORD [rdi],1
	jmp LB_8180
LB_8179:
	bts QWORD [rdi],1
LB_8180:
	mov rsi,1
	bt r12,3
	jc LB_8165
	mov rsi,0
	bt r9,0
	jc LB_8165
	jmp LB_8166
LB_8165:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8166:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8183:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8185
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8184
LB_8185:
	add rsp,8
	ret
LB_8186:
	add rsp,48
	pop r14
LB_8184:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6489:
NS_E_RDI_6489:
NS_E_6489_ETR_TBL:
NS_E_6489_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_8287
LB_8286:
	add r14,1
LB_8287:
	cmp r14,r10
	jge LB_8288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8286
	cmp al,10
	jz LB_8286
	cmp al,32
	jz LB_8286
LB_8288:
	add r14,3
	cmp r14,r10
	jg LB_8291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_8291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_8291
	jmp LB_8292
LB_8291:
	jmp LB_8228
LB_8292:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_8243
LB_8242:
	add r14,1
LB_8243:
	cmp r14,r10
	jge LB_8244
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8242
	cmp al,10
	jz LB_8242
	cmp al,32
	jz LB_8242
LB_8244:
	push r10
	call NS_E_5603_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8245
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8246
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8246:
	jmp LB_8229
LB_8245:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_8249
LB_8248:
	add r14,1
LB_8249:
	cmp r14,r10
	jge LB_8250
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8248
	cmp al,10
	jz LB_8248
	cmp al,32
	jz LB_8248
LB_8250:
	add r14,1
	cmp r14,r10
	jg LB_8255
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_8255
	jmp LB_8256
LB_8255:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8252
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8252:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8253:
	jmp LB_8229
LB_8256:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_8258
LB_8257:
	add r14,1
LB_8258:
	cmp r14,r10
	jge LB_8259
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8257
	cmp al,10
	jz LB_8257
	cmp al,32
	jz LB_8257
LB_8259:
	push r10
	call NS_E_5600_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8260
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8261
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8261:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8262
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8262:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8263
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8263:
	jmp LB_8229
LB_8260:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_8266
LB_8265:
	add r14,1
LB_8266:
	cmp r14,r10
	jge LB_8267
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8265
	cmp al,10
	jz LB_8265
	cmp al,32
	jz LB_8265
LB_8267:
	add r14,3
	cmp r14,r10
	jg LB_8274
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8274
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8274
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8274
	jmp LB_8275
LB_8274:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8269
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8269:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8270
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8270:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8271
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8271:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8272
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8272:
	jmp LB_8229
LB_8275:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_8277
LB_8276:
	add r14,1
LB_8277:
	cmp r14,r10
	jge LB_8278
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8276
	cmp al,10
	jz LB_8276
	cmp al,32
	jz LB_8276
LB_8278:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8279
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_8280
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_8280:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8281
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8281:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8282
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8282:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8283
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8283:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8284
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8284:
	jmp LB_8229
LB_8279:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_8240
	btr r12,5
	clc
	jmp LB_8241
LB_8240:
	bts r12,5
	stc
LB_8241:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8238
	btr r12,4
	clc
	jmp LB_8239
LB_8238:
	bts r12,4
	stc
LB_8239:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8236
	btr r12,3
	clc
	jmp LB_8237
LB_8236:
	bts r12,3
	stc
LB_8237:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8234
	btr r12,2
	clc
	jmp LB_8235
LB_8234:
	bts r12,2
	stc
LB_8235:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8232
	btr r12,1
	clc
	jmp LB_8233
LB_8232:
	bts r12,1
	stc
LB_8233:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8230
	btr r12,0
	clc
	jmp LB_8231
LB_8230:
	bts r12,0
	stc
LB_8231:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_8225
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_8293
	btr r12,6
	jmp LB_8294
LB_8293:
	bts r12,6
LB_8294:
	mov r8,r11
	bt r12,5
	jc LB_8295
	btr r12,2
	jmp LB_8296
LB_8295:
	bts r12,2
LB_8296:
	mov r11,r14
	bt r12,1
	jc LB_8297
	btr r12,5
	jmp LB_8298
LB_8297:
	bts r12,5
LB_8298:
	mov r14,r9
	bt r12,3
	jc LB_8299
	btr r12,1
	jmp LB_8300
LB_8299:
	bts r12,1
LB_8300:
	mov r9,r13
	bt r12,0
	jc LB_8301
	btr r12,3
	jmp LB_8302
LB_8301:
	bts r12,3
LB_8302:
	mov r13,r11
	bt r12,5
	jc LB_8303
	btr r12,0
	jmp LB_8304
LB_8303:
	bts r12,0
LB_8304:
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
; _f1521 { %_6658 %_6659 %_6660 } ⊢ %_6661 : %_6661
 ; {>  %_6660~2':(_p1487)◂((_p1495)◂(_stg)) %_6658~0':(_p1494)◂(_stg) %_6659~1':(_p1487)◂((_p1494)◂(_stg)) }
; _f1521 { 0' 1' 2' } ⊢ °1◂{ 0' 1' 2' }
; _some %_6661 ⊢ %_6662 : %_6662
 ; {>  %_6661~°1◂{ 0' 1' 2' }:(_p1507)◂(_stg) }
; _some °1◂{ 0' 1' 2' } ⊢ °0◂°1◂{ 0' 1' 2' }
; ∎ %_6662
 ; {>  %_6662~°0◂°1◂{ 0' 1' 2' }:(_opn)◂((_p1507)◂(_stg)) }
; 	∎ °0◂°1◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_8215
	btr r12,4
	jmp LB_8216
LB_8215:
	bts r12,4
LB_8216:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8213
	btr QWORD [rdi],0
	jmp LB_8214
LB_8213:
	bts QWORD [rdi],0
LB_8214:
	mov r10,r14
	bt r12,1
	jc LB_8219
	btr r12,4
	jmp LB_8220
LB_8219:
	bts r12,4
LB_8220:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8217
	btr QWORD [rdi],1
	jmp LB_8218
LB_8217:
	bts QWORD [rdi],1
LB_8218:
	mov r10,r8
	bt r12,2
	jc LB_8223
	btr r12,4
	jmp LB_8224
LB_8223:
	bts r12,4
LB_8224:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_8221
	btr QWORD [rdi],2
	jmp LB_8222
LB_8221:
	bts QWORD [rdi],2
LB_8222:
	mov rsi,1
	bt r12,3
	jc LB_8211
	mov rsi,0
	bt r9,0
	jc LB_8211
	jmp LB_8212
LB_8211:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8212:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8227
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8226
LB_8227:
	add rsp,8
	ret
LB_8229:
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
LB_8228:
	add rsp,96
	pop r14
LB_8226:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_8323
LB_8322:
	add r14,1
LB_8323:
	cmp r14,r10
	jge LB_8324
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8322
	cmp al,10
	jz LB_8322
	cmp al,32
	jz LB_8322
LB_8324:
	add r14,2
	cmp r14,r10
	jg LB_8327
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_8327
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_8327
	jmp LB_8328
LB_8327:
	jmp LB_8310
LB_8328:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_8317
LB_8316:
	add r14,1
LB_8317:
	cmp r14,r10
	jge LB_8318
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8316
	cmp al,10
	jz LB_8316
	cmp al,32
	jz LB_8316
LB_8318:
	push r10
	call NS_E_6490_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8319
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8320
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8320:
	jmp LB_8311
LB_8319:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8314
	btr r12,1
	clc
	jmp LB_8315
LB_8314:
	bts r12,1
	stc
LB_8315:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8312
	btr r12,0
	clc
	jmp LB_8313
LB_8312:
	bts r12,0
	stc
LB_8313:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8307
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8329
	btr r12,2
	jmp LB_8330
LB_8329:
	bts r12,2
LB_8330:
	mov r13,r14
	bt r12,1
	jc LB_8331
	btr r12,0
	jmp LB_8332
LB_8331:
	bts r12,0
LB_8332:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_6663 ⊢ %_6664 : %_6664
 ; {>  %_6663~0':(_p1507)◂(_stg) }
; _some 0' ⊢ °0◂0'
; ∎ %_6664
 ; {>  %_6664~°0◂0':(_opn)◂((_p1507)◂(_stg)) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8305
	btr r12,3
	jmp LB_8306
LB_8305:
	bts r12,3
LB_8306:
	mov r8,0
	bts r12,2
	ret
LB_8307:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8309
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8308
LB_8309:
	add rsp,8
	ret
LB_8311:
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
LB_8310:
	add rsp,32
	pop r14
LB_8308:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_8360
LB_8359:
	add r14,1
LB_8360:
	cmp r14,r10
	jge LB_8361
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8359
	cmp al,10
	jz LB_8359
	cmp al,32
	jz LB_8359
LB_8361:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8362
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8350
LB_8362:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_8365
LB_8364:
	add r14,1
LB_8365:
	cmp r14,r10
	jge LB_8366
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8364
	cmp al,10
	jz LB_8364
	cmp al,32
	jz LB_8364
LB_8366:
	push r10
	call NS_E_5600_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8367
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8368
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8368:
	jmp LB_8350
LB_8367:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_8371
LB_8370:
	add r14,1
LB_8371:
	cmp r14,r10
	jge LB_8372
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8370
	cmp al,10
	jz LB_8370
	cmp al,32
	jz LB_8370
LB_8372:
	add r14,3
	cmp r14,r10
	jg LB_8377
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8377
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8377
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8377
	jmp LB_8378
LB_8377:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8374
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8374:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8375
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8375:
	jmp LB_8350
LB_8378:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_8380
LB_8379:
	add r14,1
LB_8380:
	cmp r14,r10
	jge LB_8381
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8379
	cmp al,10
	jz LB_8379
	cmp al,32
	jz LB_8379
LB_8381:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8382
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8383
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8383:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8384
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8384:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8385
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8385:
	jmp LB_8350
LB_8382:
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
	jc LB_8357
	btr r12,3
	clc
	jmp LB_8358
LB_8357:
	bts r12,3
	stc
LB_8358:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8355
	btr r12,2
	clc
	jmp LB_8356
LB_8355:
	bts r12,2
	stc
LB_8356:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8353
	btr r12,1
	clc
	jmp LB_8354
LB_8353:
	bts r12,1
	stc
LB_8354:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8351
	btr r12,0
	clc
	jmp LB_8352
LB_8351:
	bts r12,0
	stc
LB_8352:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8347
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov rdx,r8
	bt r12,2
	jc LB_8387
	btr r12,7
	jmp LB_8388
LB_8387:
	bts r12,7
LB_8388:
	mov r8,r9
	bt r12,3
	jc LB_8389
	btr r12,2
	jmp LB_8390
LB_8389:
	bts r12,2
LB_8390:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _f1520 { %_6665 %_6666 %_6667 } ⊢ %_6668 : %_6668
 ; {>  %_6667~2':(_p1487)◂((_p1495)◂(_stg)) %_6665~0':_p1442 %_6666~1':(_p1487)◂((_p1494)◂(_stg)) }
; _f1520 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_6668 ⊢ %_6669 : %_6669
 ; {>  %_6668~°0◂{ 0' 1' 2' }:(_p1507)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_6669
 ; {>  %_6669~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p1507)◂(_stg)) }
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
	jc LB_8337
	btr r12,4
	jmp LB_8338
LB_8337:
	bts r12,4
LB_8338:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8335
	btr QWORD [rdi],0
	jmp LB_8336
LB_8335:
	bts QWORD [rdi],0
LB_8336:
	mov r10,r14
	bt r12,1
	jc LB_8341
	btr r12,4
	jmp LB_8342
LB_8341:
	bts r12,4
LB_8342:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8339
	btr QWORD [rdi],1
	jmp LB_8340
LB_8339:
	bts QWORD [rdi],1
LB_8340:
	mov r10,r8
	bt r12,2
	jc LB_8345
	btr r12,4
	jmp LB_8346
LB_8345:
	bts r12,4
LB_8346:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_8343
	btr QWORD [rdi],2
	jmp LB_8344
LB_8343:
	bts QWORD [rdi],2
LB_8344:
	mov rsi,1
	bt r12,3
	jc LB_8333
	mov rsi,0
	bt r9,0
	jc LB_8333
	jmp LB_8334
LB_8333:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8334:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8347:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8349
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8348
LB_8349:
	add rsp,8
	ret
LB_8350:
	add rsp,64
	pop r14
LB_8348:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6490:
NS_E_RDI_6490:
NS_E_6490_ETR_TBL:
NS_E_6490_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_8441
LB_8440:
	add r14,1
LB_8441:
	cmp r14,r10
	jge LB_8442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8440
	cmp al,10
	jz LB_8440
	cmp al,32
	jz LB_8440
LB_8442:
	add r14,2
	cmp r14,r10
	jg LB_8445
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_8445
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_8445
	jmp LB_8446
LB_8445:
	jmp LB_8408
LB_8446:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_8419
LB_8418:
	add r14,1
LB_8419:
	cmp r14,r10
	jge LB_8420
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8418
	cmp al,10
	jz LB_8418
	cmp al,32
	jz LB_8418
LB_8420:
	push r10
	call NS_E_6491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8421
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8422
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8422:
	jmp LB_8409
LB_8421:
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
LB_8428:
	jmp LB_8425
LB_8424:
	add r14,1
LB_8425:
	cmp r14,r10
	jge LB_8426
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8424
	cmp al,10
	jz LB_8424
	cmp al,32
	jz LB_8424
LB_8426:
	push r10
	push rsi
	call NS_E_6492_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_8427
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_8429
	bts QWORD [rax],0
LB_8429:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_8428
LB_8427:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_8431
LB_8430:
	add r14,1
LB_8431:
	cmp r14,r10
	jge LB_8432
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8430
	cmp al,10
	jz LB_8430
	cmp al,32
	jz LB_8430
LB_8432:
	add r14,2
	cmp r14,r10
	jg LB_8438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_8438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_8438
	jmp LB_8439
LB_8438:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8434
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8434:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8435
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8435:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8436
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8436:
	jmp LB_8409
LB_8439:
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
	jc LB_8416
	btr r12,3
	clc
	jmp LB_8417
LB_8416:
	bts r12,3
	stc
LB_8417:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8414
	btr r12,2
	clc
	jmp LB_8415
LB_8414:
	bts r12,2
	stc
LB_8415:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8412
	btr r12,1
	clc
	jmp LB_8413
LB_8412:
	bts r12,1
	stc
LB_8413:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8410
	btr r12,0
	clc
	jmp LB_8411
LB_8410:
	bts r12,0
	stc
LB_8411:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8405
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
	jc LB_8447
	btr r12,3
	jmp LB_8448
LB_8447:
	bts r12,3
LB_8448:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_8451
	btr r12,4
	clc
	jmp LB_8452
LB_8451:
	bts r12,4
	stc
LB_8452:
	mov r13,r10
	bt r12,4
	jc LB_8449
	btr r12,0
	jmp LB_8450
LB_8449:
	bts r12,0
LB_8450:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_8455
	btr r12,4
	clc
	jmp LB_8456
LB_8455:
	bts r12,4
	stc
LB_8456:
	mov r14,r10
	bt r12,4
	jc LB_8453
	btr r12,1
	jmp LB_8454
LB_8453:
	bts r12,1
LB_8454:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1523 { %_6672 %_6670 %_6671 } ⊢ %_6673 : %_6673
 ; {>  %_6671~1':(_lst)◂((_p1495)◂(_stg)) %_6670~0':(_lst)◂((_p1494)◂(_stg)) %_6672~2':(_lst)◂(_p1511) }
; _f1523 { 2' 0' 1' } ⊢ °3◂{ 2' 0' 1' }
; _some %_6673 ⊢ %_6674 : %_6674
 ; {>  %_6673~°3◂{ 2' 0' 1' }:(_p1507)◂(_stg) }
; _some °3◂{ 2' 0' 1' } ⊢ °0◂°3◂{ 2' 0' 1' }
; ∎ %_6674
 ; {>  %_6674~°0◂°3◂{ 2' 0' 1' }:(_opn)◂((_p1507)◂(_stg)) }
; 	∎ °0◂°3◂{ 2' 0' 1' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°3◂{ 2' 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r8
	bt r12,2
	jc LB_8395
	btr r12,4
	jmp LB_8396
LB_8395:
	bts r12,4
LB_8396:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8393
	btr QWORD [rdi],0
	jmp LB_8394
LB_8393:
	bts QWORD [rdi],0
LB_8394:
	mov r10,r13
	bt r12,0
	jc LB_8399
	btr r12,4
	jmp LB_8400
LB_8399:
	bts r12,4
LB_8400:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8397
	btr QWORD [rdi],1
	jmp LB_8398
LB_8397:
	bts QWORD [rdi],1
LB_8398:
	mov r10,r14
	bt r12,1
	jc LB_8403
	btr r12,4
	jmp LB_8404
LB_8403:
	bts r12,4
LB_8404:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_8401
	btr QWORD [rdi],2
	jmp LB_8402
LB_8401:
	bts QWORD [rdi],2
LB_8402:
	mov rsi,1
	bt r12,3
	jc LB_8391
	mov rsi,0
	bt r9,0
	jc LB_8391
	jmp LB_8392
LB_8391:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8392:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8405:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8407
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8406
LB_8407:
	add rsp,8
	ret
LB_8409:
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
LB_8408:
	add rsp,64
	pop r14
LB_8406:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
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
	call NS_E_5144_ETR_TBL
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
; "_"
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
	add r14,1
	cmp r14,r10
	jg LB_8496
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_8496
	jmp LB_8497
LB_8496:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8494
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8494:
	jmp LB_8476
LB_8497:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_8499
LB_8498:
	add r14,1
LB_8499:
	cmp r14,r10
	jge LB_8500
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8498
	cmp al,10
	jz LB_8498
	cmp al,32
	jz LB_8498
LB_8500:
	add r14,3
	cmp r14,r10
	jg LB_8505
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8505
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8505
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8505
	jmp LB_8506
LB_8505:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8502
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8502:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8503
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8503:
	jmp LB_8476
LB_8506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_8508
LB_8507:
	add r14,1
LB_8508:
	cmp r14,r10
	jge LB_8509
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8507
	cmp al,10
	jz LB_8507
	cmp al,32
	jz LB_8507
LB_8509:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8510
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8511
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8511:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8512
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8512:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8513
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8513:
	jmp LB_8476
LB_8510:
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
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov rdx,r14
	bt r12,1
	jc LB_8515
	btr r12,7
	jmp LB_8516
LB_8515:
	bts r12,7
LB_8516:
	mov r14,r9
	bt r12,3
	jc LB_8517
	btr r12,1
	jmp LB_8518
LB_8517:
	bts r12,1
LB_8518:
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
; _nil {  } ⊢ %_6677 : %_6677
 ; {>  %_6676~1':(_p1487)◂((_p1495)◂(_stg)) %_6675~0':_p1490 }
; _nil {  } ⊢ °1◂{  }
; _f1488 %_6677 ⊢ %_6678 : %_6678
 ; {>  %_6676~1':(_p1487)◂((_p1495)◂(_stg)) %_6677~°1◂{  }:(_lst)◂(t2965'(0)) %_6675~0':_p1490 }
; _f1488 °1◂{  } ⊢ °0◂°1◂{  }
; _f1522 { %_6675 %_6678 %_6676 } ⊢ %_6679 : %_6679
 ; {>  %_6678~°0◂°1◂{  }:(_p1487)◂(t2967'(0)) %_6676~1':(_p1487)◂((_p1495)◂(_stg)) %_6675~0':_p1490 }
; _f1522 { 0' °0◂°1◂{  } 1' } ⊢ °2◂{ 0' °0◂°1◂{  } 1' }
; _some %_6679 ⊢ %_6680 : %_6680
 ; {>  %_6679~°2◂{ 0' °0◂°1◂{  } 1' }:(_p1507)◂(_stg) }
; _some °2◂{ 0' °0◂°1◂{  } 1' } ⊢ °0◂°2◂{ 0' °0◂°1◂{  } 1' }
; ∎ %_6680
 ; {>  %_6680~°0◂°2◂{ 0' °0◂°1◂{  } 1' }:(_opn)◂((_p1507)◂(_stg)) }
; 	∎ °0◂°2◂{ 0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_8461
	btr r12,2
	jmp LB_8462
LB_8461:
	bts r12,2
LB_8462:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8459
	btr QWORD [rdi],0
	jmp LB_8460
LB_8459:
	bts QWORD [rdi],0
LB_8460:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_8467
	mov rsi,0
	bt r8,0
	jc LB_8467
	jmp LB_8468
LB_8467:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_8468:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_8465
	mov rsi,0
	bt r8,0
	jc LB_8465
	jmp LB_8466
LB_8465:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_8466:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8463
	btr QWORD [rdi],1
	jmp LB_8464
LB_8463:
	bts QWORD [rdi],1
LB_8464:
	mov r8,r14
	bt r12,1
	jc LB_8471
	btr r12,2
	jmp LB_8472
LB_8471:
	bts r12,2
LB_8472:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_8469
	btr QWORD [rdi],2
	jmp LB_8470
LB_8469:
	bts QWORD [rdi],2
LB_8470:
	mov rsi,1
	bt r12,3
	jc LB_8457
	mov rsi,0
	bt r9,0
	jc LB_8457
	jmp LB_8458
LB_8457:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8458:
	mov rax,0x0200_0000_0000_0001
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
NS_E_6491:
NS_E_RDI_6491:
NS_E_6491_ETR_TBL:
NS_E_6491_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_8555
LB_8554:
	add r14,1
LB_8555:
	cmp r14,r10
	jge LB_8556
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8554
	cmp al,10
	jz LB_8554
	cmp al,32
	jz LB_8554
LB_8556:
	add r14,1
	cmp r14,r10
	jg LB_8559
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_8559
	jmp LB_8560
LB_8559:
	jmp LB_8531
LB_8560:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_8540
LB_8539:
	add r14,1
LB_8540:
	cmp r14,r10
	jge LB_8541
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8539
	cmp al,10
	jz LB_8539
	cmp al,32
	jz LB_8539
LB_8541:
	add r14,3
	cmp r14,r10
	jg LB_8545
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8545
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8545
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8545
	jmp LB_8546
LB_8545:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8543
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8543:
	jmp LB_8532
LB_8546:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_8548
LB_8547:
	add r14,1
LB_8548:
	cmp r14,r10
	jge LB_8549
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8547
	cmp al,10
	jz LB_8547
	cmp al,32
	jz LB_8547
LB_8549:
	push r10
	call NS_E_5865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8550
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8551
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8551:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8552
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8552:
	jmp LB_8532
LB_8550:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8537
	btr r12,2
	clc
	jmp LB_8538
LB_8537:
	bts r12,2
	stc
LB_8538:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8535
	btr r12,1
	clc
	jmp LB_8536
LB_8535:
	bts r12,1
	stc
LB_8536:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8533
	btr r12,0
	clc
	jmp LB_8534
LB_8533:
	bts r12,0
	stc
LB_8534:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8528
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_8561
	btr r12,3
	jmp LB_8562
LB_8561:
	bts r12,3
LB_8562:
	mov r13,r8
	bt r12,2
	jc LB_8563
	btr r12,0
	jmp LB_8564
LB_8563:
	bts r12,0
LB_8564:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_6682 : %_6682
 ; {>  %_6681~0':(_p1495)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _nil {  } ⊢ %_6683 : %_6683
 ; {>  %_6681~0':(_p1495)◂(_stg) %_6682~°1◂{  }:(_lst)◂(t2984'(0)) }
; _nil {  } ⊢ °1◂{  }
; _some { %_6682 %_6683 } ⊢ %_6684 : %_6684
 ; {>  %_6681~0':(_p1495)◂(_stg) %_6683~°1◂{  }:(_lst)◂(t2986'(0)) %_6682~°1◂{  }:(_lst)◂(t2984'(0)) }
; _some { °1◂{  } °1◂{  } } ⊢ °0◂{ °1◂{  } °1◂{  } }
; ∎ %_6684
 ; {>  %_6681~0':(_p1495)◂(_stg) %_6684~°0◂{ °1◂{  } °1◂{  } }:(_opn)◂({ (_lst)◂(t2989'(0)) (_lst)◂(t2990'(0)) }) }
; 	∎ °0◂{ °1◂{  } °1◂{  } }
	bt r12,0
	jc LB_8519
	mov rdi,r13
	call dlt
LB_8519:
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
	jc LB_8522
	mov rsi,0
	bt r13,0
	jc LB_8522
	jmp LB_8523
LB_8522:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_8523:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_8520
	btr QWORD [rdi],0
	jmp LB_8521
LB_8520:
	bts QWORD [rdi],0
LB_8521:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_8526
	mov rsi,0
	bt r13,0
	jc LB_8526
	jmp LB_8527
LB_8526:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_8527:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_8524
	btr QWORD [rdi],1
	jmp LB_8525
LB_8524:
	bts QWORD [rdi],1
LB_8525:
	mov r8,0
	bts r12,2
	ret
LB_8528:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8530
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8529
LB_8530:
	add rsp,8
	ret
LB_8532:
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
LB_8531:
	add rsp,48
	pop r14
LB_8529:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_8606
LB_8605:
	add r14,1
LB_8606:
	cmp r14,r10
	jge LB_8607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8605
	cmp al,10
	jz LB_8605
	cmp al,32
	jz LB_8605
LB_8607:
	push r10
	call NS_E_5603_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8608
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8594
LB_8608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_8611
LB_8610:
	add r14,1
LB_8611:
	cmp r14,r10
	jge LB_8612
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8610
	cmp al,10
	jz LB_8610
	cmp al,32
	jz LB_8610
LB_8612:
	push r10
	call NS_E_5602_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8613
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8614
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8614:
	jmp LB_8594
LB_8613:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_8617
LB_8616:
	add r14,1
LB_8617:
	cmp r14,r10
	jge LB_8618
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8616
	cmp al,10
	jz LB_8616
	cmp al,32
	jz LB_8616
LB_8618:
	add r14,3
	cmp r14,r10
	jg LB_8623
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8623
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8623
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8623
	jmp LB_8624
LB_8623:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8620
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8620:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8621
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8621:
	jmp LB_8594
LB_8624:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_8626
LB_8625:
	add r14,1
LB_8626:
	cmp r14,r10
	jge LB_8627
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8625
	cmp al,10
	jz LB_8625
	cmp al,32
	jz LB_8625
LB_8627:
	push r10
	call NS_E_5865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8628
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8629
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8629:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8630
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8630:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8631
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8631:
	jmp LB_8594
LB_8628:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
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
	call NS_E_5864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8636
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8637
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8637:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8638
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8638:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8639
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8639:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8640
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8640:
	jmp LB_8594
LB_8636:
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
	jc LB_8603
	btr r12,4
	clc
	jmp LB_8604
LB_8603:
	bts r12,4
	stc
LB_8604:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8601
	btr r12,3
	clc
	jmp LB_8602
LB_8601:
	bts r12,3
	stc
LB_8602:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8599
	btr r12,2
	clc
	jmp LB_8600
LB_8599:
	bts r12,2
	stc
LB_8600:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8597
	btr r12,1
	clc
	jmp LB_8598
LB_8597:
	bts r12,1
	stc
LB_8598:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8595
	btr r12,0
	clc
	jmp LB_8596
LB_8595:
	bts r12,0
	stc
LB_8596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8591
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_8642
	btr r12,8
	jmp LB_8643
LB_8642:
	bts r12,8
LB_8643:
	mov r9,r10
	bt r12,4
	jc LB_8644
	btr r12,3
	jmp LB_8645
LB_8644:
	bts r12,3
LB_8645:
	mov r10,r8
	bt r12,2
	jc LB_8646
	btr r12,4
	jmp LB_8647
LB_8646:
	bts r12,4
LB_8647:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_8648
	btr r12,2
	jmp LB_8649
LB_8648:
	bts r12,2
LB_8649:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,5
	bts r12,6
	bts r12,7
; _cns { %_6685 %_6686 } ⊢ %_6689 : %_6689
 ; {>  %_6685~0':(_p1494)◂(_stg) %_6688~3':(_lst)◂((_p1495)◂(_stg)) %_6686~1':(_lst)◂((_p1494)◂(_stg)) %_6687~2':(_p1495)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _cns { %_6687 %_6688 } ⊢ %_6690 : %_6690
 ; {>  %_6688~3':(_lst)◂((_p1495)◂(_stg)) %_6689~°0◂{ 0' 1' }:(_lst)◂((_p1494)◂(_stg)) %_6687~2':(_p1495)◂(_stg) }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; _some { %_6689 %_6690 } ⊢ %_6691 : %_6691
 ; {>  %_6690~°0◂{ 2' 3' }:(_lst)◂((_p1495)◂(_stg)) %_6689~°0◂{ 0' 1' }:(_lst)◂((_p1494)◂(_stg)) }
; _some { °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; ∎ %_6691
 ; {>  %_6691~°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }:(_opn)◂({ (_lst)◂((_p1494)◂(_stg)) (_lst)◂((_p1495)◂(_stg)) }) }
; 	∎ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_8565
	btr r12,4
	jmp LB_8566
LB_8565:
	bts r12,4
LB_8566:
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
	jc LB_8573
	btr r12,6
	jmp LB_8574
LB_8573:
	bts r12,6
LB_8574:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_8571
	btr QWORD [rdi],0
	jmp LB_8572
LB_8571:
	bts QWORD [rdi],0
LB_8572:
	mov rcx,r14
	bt r12,1
	jc LB_8577
	btr r12,6
	jmp LB_8578
LB_8577:
	bts r12,6
LB_8578:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_8575
	btr QWORD [rdi],1
	jmp LB_8576
LB_8575:
	bts QWORD [rdi],1
LB_8576:
	mov rsi,1
	bt r12,5
	jc LB_8569
	mov rsi,0
	bt r11,0
	jc LB_8569
	jmp LB_8570
LB_8569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_8570:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8567
	btr QWORD [rdi],0
	jmp LB_8568
LB_8567:
	bts QWORD [rdi],0
LB_8568:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r8
	bt r12,2
	jc LB_8585
	btr r12,0
	jmp LB_8586
LB_8585:
	bts r12,0
LB_8586:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_8583
	btr QWORD [rdi],0
	jmp LB_8584
LB_8583:
	bts QWORD [rdi],0
LB_8584:
	mov r13,r10
	bt r12,4
	jc LB_8589
	btr r12,0
	jmp LB_8590
LB_8589:
	bts r12,0
LB_8590:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_8587
	btr QWORD [rdi],1
	jmp LB_8588
LB_8587:
	bts QWORD [rdi],1
LB_8588:
	mov rsi,1
	bt r12,5
	jc LB_8581
	mov rsi,0
	bt r11,0
	jc LB_8581
	jmp LB_8582
LB_8581:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_8582:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8579
	btr QWORD [rdi],1
	jmp LB_8580
LB_8579:
	bts QWORD [rdi],1
LB_8580:
	mov r8,0
	bts r12,2
	ret
LB_8591:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8593
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8592
LB_8593:
	add rsp,8
	ret
LB_8594:
	add rsp,80
	pop r14
LB_8592:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6492:
NS_E_RDI_6492:
NS_E_6492_ETR_TBL:
NS_E_6492_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_8679
LB_8678:
	add r14,1
LB_8679:
	cmp r14,r10
	jge LB_8680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8678
	cmp al,10
	jz LB_8678
	cmp al,32
	jz LB_8678
LB_8680:
	push r10
	call NS_E_6493_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8681
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8663
LB_8681:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_8684
LB_8683:
	add r14,1
LB_8684:
	cmp r14,r10
	jge LB_8685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8683
	cmp al,10
	jz LB_8683
	cmp al,32
	jz LB_8683
LB_8685:
	add r14,1
	cmp r14,r10
	jg LB_8689
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_8689
	jmp LB_8690
LB_8689:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8687
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8687:
	jmp LB_8663
LB_8690:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_8672
LB_8671:
	add r14,1
LB_8672:
	cmp r14,r10
	jge LB_8673
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8671
	cmp al,10
	jz LB_8671
	cmp al,32
	jz LB_8671
LB_8673:
	push r10
	call NS_E_893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8674
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8675
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8675:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8676
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8676:
	jmp LB_8664
LB_8674:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8669
	btr r12,2
	clc
	jmp LB_8670
LB_8669:
	bts r12,2
	stc
LB_8670:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8667
	btr r12,1
	clc
	jmp LB_8668
LB_8667:
	bts r12,1
	stc
LB_8668:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8665
	btr r12,0
	clc
	jmp LB_8666
LB_8665:
	bts r12,0
	stc
LB_8666:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8660
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_8691
	btr r12,3
	jmp LB_8692
LB_8691:
	bts r12,3
LB_8692:
	mov r14,r8
	bt r12,2
	jc LB_8693
	btr r12,1
	jmp LB_8694
LB_8693:
	bts r12,1
LB_8694:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1534 { %_6692 %_6693 } ⊢ %_6694 : %_6694
 ; {>  %_6693~1':_stg %_6692~0':_r64 }
; _f1534 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_6694 ⊢ %_6695 : %_6695
 ; {>  %_6694~°3◂{ 0' 1' }:_p1511 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_6695
 ; {>  %_6695~°0◂°3◂{ 0' 1' }:(_opn)◂(_p1511) }
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
	jc LB_8654
	btr r12,2
	jmp LB_8655
LB_8654:
	bts r12,2
LB_8655:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8652
	btr QWORD [rdi],0
	jmp LB_8653
LB_8652:
	bts QWORD [rdi],0
LB_8653:
	mov r8,r14
	bt r12,1
	jc LB_8658
	btr r12,2
	jmp LB_8659
LB_8658:
	bts r12,2
LB_8659:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8656
	btr QWORD [rdi],1
	jmp LB_8657
LB_8656:
	bts QWORD [rdi],1
LB_8657:
	mov rsi,1
	bt r12,3
	jc LB_8650
	mov rsi,0
	bt r9,0
	jc LB_8650
	jmp LB_8651
LB_8650:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8651:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8660:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8662
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8661
LB_8662:
	add rsp,8
	ret
LB_8664:
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
LB_8663:
	add rsp,48
	pop r14
LB_8661:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_8706
LB_8705:
	add r14,1
LB_8706:
	cmp r14,r10
	jge LB_8707
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8705
	cmp al,10
	jz LB_8705
	cmp al,32
	jz LB_8705
LB_8707:
	push r10
	call NS_E_6495_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8708
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8702
LB_8708:
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
	jc LB_8703
	btr r12,0
	clc
	jmp LB_8704
LB_8703:
	bts r12,0
	stc
LB_8704:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8699
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1531 %_6696 ⊢ %_6697 : %_6697
 ; {>  %_6696~0':_stg }
; _f1531 0' ⊢ °0◂0'
; _some %_6697 ⊢ %_6698 : %_6698
 ; {>  %_6697~°0◂0':_p1511 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6698
 ; {>  %_6698~°0◂°0◂0':(_opn)◂(_p1511) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8697
	btr r12,3
	jmp LB_8698
LB_8697:
	bts r12,3
LB_8698:
	mov rsi,1
	bt r12,3
	jc LB_8695
	mov rsi,0
	bt r9,0
	jc LB_8695
	jmp LB_8696
LB_8695:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8696:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8699:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8701
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8700
LB_8701:
	add rsp,8
	ret
LB_8702:
	add rsp,16
	pop r14
LB_8700:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_8721
LB_8720:
	add r14,1
LB_8721:
	cmp r14,r10
	jge LB_8722
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8720
	cmp al,10
	jz LB_8720
	cmp al,32
	jz LB_8720
LB_8722:
	push r10
	call NS_E_893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8723
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8717
LB_8723:
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
	jc LB_8718
	btr r12,0
	clc
	jmp LB_8719
LB_8718:
	bts r12,0
	stc
LB_8719:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8714
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1531 %_6699 ⊢ %_6700 : %_6700
 ; {>  %_6699~0':_stg }
; _f1531 0' ⊢ °0◂0'
; _some %_6700 ⊢ %_6701 : %_6701
 ; {>  %_6700~°0◂0':_p1511 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6701
 ; {>  %_6701~°0◂°0◂0':(_opn)◂(_p1511) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8712
	btr r12,3
	jmp LB_8713
LB_8712:
	bts r12,3
LB_8713:
	mov rsi,1
	bt r12,3
	jc LB_8710
	mov rsi,0
	bt r9,0
	jc LB_8710
	jmp LB_8711
LB_8710:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8711:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8714:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8716
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8715
LB_8716:
	add rsp,8
	ret
LB_8717:
	add rsp,16
	pop r14
LB_8715:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_8736
LB_8735:
	add r14,1
LB_8736:
	cmp r14,r10
	jge LB_8737
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8735
	cmp al,10
	jz LB_8735
	cmp al,32
	jz LB_8735
LB_8737:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8738
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8732
LB_8738:
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
	jc LB_8733
	btr r12,0
	clc
	jmp LB_8734
LB_8733:
	bts r12,0
	stc
LB_8734:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8729
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1532 %_6702 ⊢ %_6703 : %_6703
 ; {>  %_6702~0':_p1442 }
; _f1532 0' ⊢ °1◂0'
; _some %_6703 ⊢ %_6704 : %_6704
 ; {>  %_6703~°1◂0':_p1511 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6704
 ; {>  %_6704~°0◂°1◂0':(_opn)◂(_p1511) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8727
	btr r12,3
	jmp LB_8728
LB_8727:
	bts r12,3
LB_8728:
	mov rsi,1
	bt r12,3
	jc LB_8725
	mov rsi,0
	bt r9,0
	jc LB_8725
	jmp LB_8726
LB_8725:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8726:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8729:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8731
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8730
LB_8731:
	add rsp,8
	ret
LB_8732:
	add rsp,16
	pop r14
LB_8730:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_8757
LB_8756:
	add r14,1
LB_8757:
	cmp r14,r10
	jge LB_8758
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8756
	cmp al,10
	jz LB_8756
	cmp al,32
	jz LB_8756
LB_8758:
	push r10
	call NS_E_6494_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8759
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8753
LB_8759:
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
	jc LB_8754
	btr r12,0
	clc
	jmp LB_8755
LB_8754:
	bts r12,0
	stc
LB_8755:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8750
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r11,r14
	bt r12,1
	jc LB_8761
	btr r12,5
	jmp LB_8762
LB_8761:
	bts r12,5
LB_8762:
	mov r10,r13
	bt r12,0
	jc LB_8763
	btr r12,4
	jmp LB_8764
LB_8763:
	bts r12,4
LB_8764:
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_8767
	btr r12,6
	clc
	jmp LB_8768
LB_8767:
	bts r12,6
	stc
LB_8768:
	mov r13,rcx
	bt r12,6
	jc LB_8765
	btr r12,0
	jmp LB_8766
LB_8765:
	bts r12,0
LB_8766:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_8771
	btr r12,6
	clc
	jmp LB_8772
LB_8771:
	bts r12,6
	stc
LB_8772:
	mov r14,rcx
	bt r12,6
	jc LB_8769
	btr r12,1
	jmp LB_8770
LB_8769:
	bts r12,1
LB_8770:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1533 %_6705 ⊢ %_6706 : %_6706
 ; {>  %_6705~{ 0' 1' }:{ _p1512 _r64 } }
; _f1533 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_6706 ⊢ %_6707 : %_6707
 ; {>  %_6706~°2◂{ 0' 1' }:_p1511 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_6707
 ; {>  %_6707~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1511) }
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
	jc LB_8744
	btr r12,2
	jmp LB_8745
LB_8744:
	bts r12,2
LB_8745:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8742
	btr QWORD [rdi],0
	jmp LB_8743
LB_8742:
	bts QWORD [rdi],0
LB_8743:
	mov r8,r14
	bt r12,1
	jc LB_8748
	btr r12,2
	jmp LB_8749
LB_8748:
	bts r12,2
LB_8749:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8746
	btr QWORD [rdi],1
	jmp LB_8747
LB_8746:
	bts QWORD [rdi],1
LB_8747:
	mov rsi,1
	bt r12,3
	jc LB_8740
	mov rsi,0
	bt r9,0
	jc LB_8740
	jmp LB_8741
LB_8740:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8741:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8750:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8752
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8751
LB_8752:
	add rsp,8
	ret
LB_8753:
	add rsp,16
	pop r14
LB_8751:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6493:
NS_E_RDI_6493:
NS_E_6493_ETR_TBL:
NS_E_6493_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_614_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8786
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8778
LB_8786:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_8794
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_8794
	jmp LB_8795
LB_8794:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8792
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8792:
	jmp LB_8778
LB_8795:
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
	jc LB_8781
	btr r12,1
	clc
	jmp LB_8782
LB_8781:
	bts r12,1
	stc
LB_8782:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8779
	btr r12,0
	clc
	jmp LB_8780
LB_8779:
	bts r12,0
	stc
LB_8780:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8775
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_6708 ⊢ %_6709 : %_6709
 ; {>  %_6708~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_6709
 ; {>  %_6709~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8773
	btr r12,3
	jmp LB_8774
LB_8773:
	bts r12,3
LB_8774:
	mov r8,0
	bts r12,2
	ret
LB_8775:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8777
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8776
LB_8777:
	add rsp,8
	ret
LB_8778:
	add rsp,32
	pop r14
LB_8776:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6494:
NS_E_RDI_6494:
NS_E_6494_ETR_TBL:
NS_E_6494_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_614_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8815
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8807
LB_8815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_8823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_8823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_8823
	jmp LB_8824
LB_8823:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8821:
	jmp LB_8807
LB_8824:
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
	jc LB_8810
	btr r12,1
	clc
	jmp LB_8811
LB_8810:
	bts r12,1
	stc
LB_8811:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8808
	btr r12,0
	clc
	jmp LB_8809
LB_8808:
	bts r12,0
	stc
LB_8809:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8804
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1536 {  } ⊢ %_6711 : %_6711
 ; {>  %_6710~0':_r64 }
; _f1536 {  } ⊢ °1◂{  }
; _some { %_6711 %_6710 } ⊢ %_6712 : %_6712
 ; {>  %_6710~0':_r64 %_6711~°1◂{  }:_p1512 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_6712
 ; {>  %_6712~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p1512 _r64 }) }
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
	jc LB_8798
	mov rsi,0
	bt r14,0
	jc LB_8798
	jmp LB_8799
LB_8798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_8799:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_8796
	btr QWORD [rdi],0
	jmp LB_8797
LB_8796:
	bts QWORD [rdi],0
LB_8797:
	mov r14,r13
	bt r12,0
	jc LB_8802
	btr r12,1
	jmp LB_8803
LB_8802:
	bts r12,1
LB_8803:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_8800
	btr QWORD [rdi],1
	jmp LB_8801
LB_8800:
	bts QWORD [rdi],1
LB_8801:
	mov r8,0
	bts r12,2
	ret
LB_8804:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8806
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8805
LB_8806:
	add rsp,8
	ret
LB_8807:
	add rsp,32
	pop r14
LB_8805:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_614_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8844
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8836
LB_8844:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_8852
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_8852
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_8852
	jmp LB_8853
LB_8852:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8850:
	jmp LB_8836
LB_8853:
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
	jc LB_8839
	btr r12,1
	clc
	jmp LB_8840
LB_8839:
	bts r12,1
	stc
LB_8840:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8837
	btr r12,0
	clc
	jmp LB_8838
LB_8837:
	bts r12,0
	stc
LB_8838:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8833
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1537 {  } ⊢ %_6714 : %_6714
 ; {>  %_6713~0':_r64 }
; _f1537 {  } ⊢ °2◂{  }
; _some { %_6714 %_6713 } ⊢ %_6715 : %_6715
 ; {>  %_6714~°2◂{  }:_p1512 %_6713~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_6715
 ; {>  %_6715~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p1512 _r64 }) }
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
	jc LB_8827
	mov rsi,0
	bt r14,0
	jc LB_8827
	jmp LB_8828
LB_8827:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_8828:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_8825
	btr QWORD [rdi],0
	jmp LB_8826
LB_8825:
	bts QWORD [rdi],0
LB_8826:
	mov r14,r13
	bt r12,0
	jc LB_8831
	btr r12,1
	jmp LB_8832
LB_8831:
	bts r12,1
LB_8832:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_8829
	btr QWORD [rdi],1
	jmp LB_8830
LB_8829:
	bts QWORD [rdi],1
LB_8830:
	mov r8,0
	bts r12,2
	ret
LB_8833:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8835
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8834
LB_8835:
	add rsp,8
	ret
LB_8836:
	add rsp,32
	pop r14
LB_8834:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_614_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8873
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8865
LB_8873:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_8881
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_8881
	jmp LB_8882
LB_8881:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8879
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8879:
	jmp LB_8865
LB_8882:
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
	jc LB_8868
	btr r12,1
	clc
	jmp LB_8869
LB_8868:
	bts r12,1
	stc
LB_8869:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8866
	btr r12,0
	clc
	jmp LB_8867
LB_8866:
	bts r12,0
	stc
LB_8867:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8862
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1535 {  } ⊢ %_6717 : %_6717
 ; {>  %_6716~0':_r64 }
; _f1535 {  } ⊢ °0◂{  }
; _some { %_6717 %_6716 } ⊢ %_6718 : %_6718
 ; {>  %_6716~0':_r64 %_6717~°0◂{  }:_p1512 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_6718
 ; {>  %_6718~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p1512 _r64 }) }
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
	jc LB_8856
	mov rsi,0
	bt r14,0
	jc LB_8856
	jmp LB_8857
LB_8856:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_8857:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_8854
	btr QWORD [rdi],0
	jmp LB_8855
LB_8854:
	bts QWORD [rdi],0
LB_8855:
	mov r14,r13
	bt r12,0
	jc LB_8860
	btr r12,1
	jmp LB_8861
LB_8860:
	bts r12,1
LB_8861:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_8858
	btr QWORD [rdi],1
	jmp LB_8859
LB_8858:
	bts QWORD [rdi],1
LB_8859:
	mov r8,0
	bts r12,2
	ret
LB_8862:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8864
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8863
LB_8864:
	add rsp,8
	ret
LB_8865:
	add rsp,32
	pop r14
LB_8863:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6495:
NS_E_RDI_6495:
NS_E_6495_ETR_TBL:
NS_E_6495_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_8898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_8898
	jmp LB_8899
LB_8898:
	jmp LB_8888
LB_8899:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_6496_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8903
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8904
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8904:
	jmp LB_8888
LB_8903:
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
	jc LB_8891
	btr r12,1
	clc
	jmp LB_8892
LB_8891:
	bts r12,1
	stc
LB_8892:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8889
	btr r12,0
	clc
	jmp LB_8890
LB_8889:
	bts r12,0
	stc
LB_8890:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8885
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_8906
	btr r12,5
	jmp LB_8907
LB_8906:
	bts r12,5
LB_8907:
	mov r13,r14
	bt r12,1
	jc LB_8908
	btr r12,0
	jmp LB_8909
LB_8908:
	bts r12,0
LB_8909:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f737 %_6719 ⊢ %_6720 : %_6720
 ; {>  %_6719~0':(_lst)◂(_r64) }
; _f737 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_737
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_6720 ⊢ %_6721 : %_6721
 ; {>  %_6720~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_6721
 ; {>  %_6721~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8883
	btr r12,3
	jmp LB_8884
LB_8883:
	bts r12,3
LB_8884:
	mov r8,0
	bts r12,2
	ret
LB_8885:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8887
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8886
LB_8887:
	add rsp,8
	ret
LB_8888:
	add rsp,32
	pop r14
LB_8886:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6496:
NS_E_RDI_6496:
NS_E_6496_ETR_TBL:
NS_E_6496_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_8931
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_8931
	jmp LB_8932
LB_8931:
	jmp LB_8923
LB_8932:
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
	jc LB_8924
	btr r12,0
	clc
	jmp LB_8925
LB_8924:
	bts r12,0
	stc
LB_8925:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8920
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; » 0xra |~ {  } ⊢ %_6722 : %_6722
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_6722
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_6723 : %_6723
 ; {>  %_6722~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_6722 %_6723 } ⊢ %_6724 : %_6724
 ; {>  %_6722~0':_r64 %_6723~°1◂{  }:(_lst)◂(t3047'(0)) }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_6724 ⊢ %_6725 : %_6725
 ; {>  %_6724~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_6725
 ; {>  %_6725~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_8914
	btr r12,1
	jmp LB_8915
LB_8914:
	bts r12,1
LB_8915:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_8912
	btr QWORD [rdi],0
	jmp LB_8913
LB_8912:
	bts QWORD [rdi],0
LB_8913:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_8918
	mov rsi,0
	bt r14,0
	jc LB_8918
	jmp LB_8919
LB_8918:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_8919:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_8916
	btr QWORD [rdi],1
	jmp LB_8917
LB_8916:
	bts QWORD [rdi],1
LB_8917:
	mov rsi,1
	bt r12,3
	jc LB_8910
	mov rsi,0
	bt r9,0
	jc LB_8910
	jmp LB_8911
LB_8910:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8911:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8920:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8922
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8921
LB_8922:
	add rsp,8
	ret
LB_8923:
	add rsp,16
	pop r14
LB_8921:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8954
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8946
LB_8954:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_6496_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8959
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8960
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8960:
	jmp LB_8946
LB_8959:
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
	jc LB_8949
	btr r12,1
	clc
	jmp LB_8950
LB_8949:
	bts r12,1
	stc
LB_8950:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8947
	btr r12,0
	clc
	jmp LB_8948
LB_8947:
	bts r12,0
	stc
LB_8948:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8943
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_6726 %_6727 } ⊢ %_6728 : %_6728
 ; {>  %_6726~0':_r64 %_6727~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6728 ⊢ %_6729 : %_6729
 ; {>  %_6728~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6729
 ; {>  %_6729~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_8937
	btr r12,2
	jmp LB_8938
LB_8937:
	bts r12,2
LB_8938:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8935
	btr QWORD [rdi],0
	jmp LB_8936
LB_8935:
	bts QWORD [rdi],0
LB_8936:
	mov r8,r14
	bt r12,1
	jc LB_8941
	btr r12,2
	jmp LB_8942
LB_8941:
	bts r12,2
LB_8942:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8939
	btr QWORD [rdi],1
	jmp LB_8940
LB_8939:
	bts QWORD [rdi],1
LB_8940:
	mov rsi,1
	bt r12,3
	jc LB_8933
	mov rsi,0
	bt r9,0
	jc LB_8933
	jmp LB_8934
LB_8933:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8934:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8943:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8945
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8944
LB_8945:
	add rsp,8
	ret
LB_8946:
	add rsp,32
	pop r14
LB_8944:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6497:
NS_E_RDI_6497:
NS_E_6497_ETR_TBL:
NS_E_6497_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_8999
LB_8998:
	add r14,1
LB_8999:
	cmp r14,r10
	jge LB_9000
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8998
	cmp al,10
	jz LB_8998
	cmp al,32
	jz LB_8998
LB_9000:
	add r14,4
	cmp r14,r10
	jg LB_9003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_9003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_9003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_9003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_9003
	jmp LB_9004
LB_9003:
	jmp LB_8977
LB_9004:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_8986
LB_8985:
	add r14,1
LB_8986:
	cmp r14,r10
	jge LB_8987
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8985
	cmp al,10
	jz LB_8985
	cmp al,32
	jz LB_8985
LB_8987:
	push r10
	call NS_E_6499_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8988
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8989:
	jmp LB_8978
LB_8988:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
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
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8994
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8995
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8995:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8996
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8996:
	jmp LB_8978
LB_8994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8983
	btr r12,2
	clc
	jmp LB_8984
LB_8983:
	bts r12,2
	stc
LB_8984:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8981
	btr r12,1
	clc
	jmp LB_8982
LB_8981:
	bts r12,1
	stc
LB_8982:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8979
	btr r12,0
	clc
	jmp LB_8980
LB_8979:
	bts r12,0
	stc
LB_8980:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8974
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_9005
	btr r12,3
	jmp LB_9006
LB_9005:
	bts r12,3
LB_9006:
	mov r14,r8
	bt r12,2
	jc LB_9007
	btr r12,1
	jmp LB_9008
LB_9007:
	bts r12,1
LB_9008:
	mov r8,r13
	bt r12,0
	jc LB_9009
	btr r12,2
	jmp LB_9010
LB_9009:
	bts r12,2
LB_9010:
	mov r13,r9
	bt r12,3
	jc LB_9011
	btr r12,0
	jmp LB_9012
LB_9011:
	bts r12,0
LB_9012:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1526 %_6731 ⊢ %_6732 : %_6732
 ; {>  %_6731~1':(_p1505)◂(_stg) %_6730~0':(_lst)◂((_p1509)◂(_stg)) }
; _f1526 1' ⊢ °2◂1'
; _f630 { %_6730 %_6732 } ⊢ %_6733 : %_6733
 ; {>  %_6732~°2◂1':(_p1508)◂(_stg) %_6730~0':(_lst)◂((_p1509)◂(_stg)) }
; _f630 { 0' °2◂1' } ⊢ °1◂{ 0' °2◂1' }
; _some %_6733 ⊢ %_6734 : %_6734
 ; {>  %_6733~°1◂{ 0' °2◂1' }:(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _some °1◂{ 0' °2◂1' } ⊢ °0◂°1◂{ 0' °2◂1' }
; ∎ %_6734
 ; {>  %_6734~°0◂°1◂{ 0' °2◂1' }:(_opn)◂((_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) })) }
; 	∎ °0◂°1◂{ 0' °2◂1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' °2◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_8966
	btr r12,2
	jmp LB_8967
LB_8966:
	bts r12,2
LB_8967:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8964
	btr QWORD [rdi],0
	jmp LB_8965
LB_8964:
	bts QWORD [rdi],0
LB_8965:
	mov r8,r14
	bt r12,1
	jc LB_8972
	btr r12,2
	jmp LB_8973
LB_8972:
	bts r12,2
LB_8973:
	mov rsi,1
	bt r12,2
	jc LB_8970
	mov rsi,0
	bt r8,0
	jc LB_8970
	jmp LB_8971
LB_8970:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_8971:
	mov rax,0x0200_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8968
	btr QWORD [rdi],1
	jmp LB_8969
LB_8968:
	bts QWORD [rdi],1
LB_8969:
	mov rsi,1
	bt r12,3
	jc LB_8962
	mov rsi,0
	bt r9,0
	jc LB_8962
	jmp LB_8963
LB_8962:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8963:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8974:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8976
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8975
LB_8976:
	add rsp,8
	ret
LB_8978:
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
LB_8977:
	add rsp,48
	pop r14
LB_8975:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_9044
LB_9043:
	add r14,1
LB_9044:
	cmp r14,r10
	jge LB_9045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9043
	cmp al,10
	jz LB_9043
	cmp al,32
	jz LB_9043
LB_9045:
	add r14,3
	cmp r14,r10
	jg LB_9048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_9048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_9048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_9048
	jmp LB_9049
LB_9048:
	jmp LB_9034
LB_9049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_9051
LB_9050:
	add r14,1
LB_9051:
	cmp r14,r10
	jge LB_9052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9050
	cmp al,10
	jz LB_9050
	cmp al,32
	jz LB_9050
LB_9052:
	push r10
	call NS_E_6499_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9053
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9054
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9054:
	jmp LB_9034
LB_9053:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_9057
LB_9056:
	add r14,1
LB_9057:
	cmp r14,r10
	jge LB_9058
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9056
	cmp al,10
	jz LB_9056
	cmp al,32
	jz LB_9056
LB_9058:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9059
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9060
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9060:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9061
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9061:
	jmp LB_9034
LB_9059:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_9064
LB_9063:
	add r14,1
LB_9064:
	cmp r14,r10
	jge LB_9065
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9063
	cmp al,10
	jz LB_9063
	cmp al,32
	jz LB_9063
LB_9065:
	push r10
	call NS_E_6497_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9066
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9067
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9067:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9068
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9068:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9069
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9069:
	jmp LB_9034
LB_9066:
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
	jc LB_9041
	btr r12,3
	clc
	jmp LB_9042
LB_9041:
	bts r12,3
	stc
LB_9042:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9039
	btr r12,2
	clc
	jmp LB_9040
LB_9039:
	bts r12,2
	stc
LB_9040:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9037
	btr r12,1
	clc
	jmp LB_9038
LB_9037:
	bts r12,1
	stc
LB_9038:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9035
	btr r12,0
	clc
	jmp LB_9036
LB_9035:
	bts r12,0
	stc
LB_9036:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_9031
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov rdx,r8
	bt r12,2
	jc LB_9071
	btr r12,7
	jmp LB_9072
LB_9071:
	bts r12,7
LB_9072:
	mov r8,r9
	bt r12,3
	jc LB_9073
	btr r12,2
	jmp LB_9074
LB_9073:
	bts r12,2
LB_9074:
	mov r9,r14
	bt r12,1
	jc LB_9075
	btr r12,3
	jmp LB_9076
LB_9075:
	bts r12,3
LB_9076:
	mov r14,rdx
	bt r12,7
	jc LB_9077
	btr r12,1
	jmp LB_9078
LB_9077:
	bts r12,1
LB_9078:
	mov rdx,r13
	bt r12,0
	jc LB_9079
	btr r12,7
	jmp LB_9080
LB_9079:
	bts r12,7
LB_9080:
	mov r13,r9
	bt r12,3
	jc LB_9081
	btr r12,0
	jmp LB_9082
LB_9081:
	bts r12,0
LB_9082:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _f1526 %_6736 ⊢ %_6738 : %_6738
 ; {>  %_6737~2':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_6736~1':(_p1505)◂(_stg) %_6735~0':(_lst)◂((_p1509)◂(_stg)) }
; _f1526 1' ⊢ °2◂1'
; _f629 { { %_6735 %_6738 } %_6737 } ⊢ %_6739 : %_6739
 ; {>  %_6737~2':(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_6735~0':(_lst)◂((_p1509)◂(_stg)) %_6738~°2◂1':(_p1508)◂(_stg) }
; _f629 { { 0' °2◂1' } 2' } ⊢ °0◂{ { 0' °2◂1' } 2' }
; _some %_6739 ⊢ %_6740 : %_6740
 ; {>  %_6739~°0◂{ { 0' °2◂1' } 2' }:(_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _some °0◂{ { 0' °2◂1' } 2' } ⊢ °0◂°0◂{ { 0' °2◂1' } 2' }
; ∎ %_6740
 ; {>  %_6740~°0◂°0◂{ { 0' °2◂1' } 2' }:(_opn)◂((_p628)◂({ (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) })) }
; 	∎ °0◂°0◂{ { 0' °2◂1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' °2◂1' } 2' } ⊢ 2'◂3'
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
	jc LB_9019
	btr r12,5
	jmp LB_9020
LB_9019:
	bts r12,5
LB_9020:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9017
	btr QWORD [rdi],0
	jmp LB_9018
LB_9017:
	bts QWORD [rdi],0
LB_9018:
	mov r11,r14
	bt r12,1
	jc LB_9025
	btr r12,5
	jmp LB_9026
LB_9025:
	bts r12,5
LB_9026:
	mov rsi,1
	bt r12,5
	jc LB_9023
	mov rsi,0
	bt r11,0
	jc LB_9023
	jmp LB_9024
LB_9023:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_9024:
	mov rax,0x0200_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9021
	btr QWORD [rdi],1
	jmp LB_9022
LB_9021:
	bts QWORD [rdi],1
LB_9022:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9015
	btr QWORD [rdi],0
	jmp LB_9016
LB_9015:
	bts QWORD [rdi],0
LB_9016:
	mov r10,r8
	bt r12,2
	jc LB_9029
	btr r12,4
	jmp LB_9030
LB_9029:
	bts r12,4
LB_9030:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9027
	btr QWORD [rdi],1
	jmp LB_9028
LB_9027:
	bts QWORD [rdi],1
LB_9028:
	mov rsi,1
	bt r12,3
	jc LB_9013
	mov rsi,0
	bt r9,0
	jc LB_9013
	jmp LB_9014
LB_9013:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9014:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9031:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9033
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9032
LB_9033:
	add rsp,8
	ret
LB_9034:
	add rsp,64
	pop r14
LB_9032:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6498:
NS_E_RDI_6498:
NS_E_6498_ETR_TBL:
NS_E_6498_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_9134
LB_9133:
	add r14,1
LB_9134:
	cmp r14,r10
	jge LB_9135
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9133
	cmp al,10
	jz LB_9133
	cmp al,32
	jz LB_9133
LB_9135:
	add r14,4
	cmp r14,r10
	jg LB_9138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_9138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_9138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_9138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_9138
	jmp LB_9139
LB_9138:
	jmp LB_9102
LB_9139:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_ptn
	jmp LB_9113
LB_9112:
	add r14,1
LB_9113:
	cmp r14,r10
	jge LB_9114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9112
	cmp al,10
	jz LB_9112
	cmp al,32
	jz LB_9112
LB_9114:
	push r10
	call NS_E_5273_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9115
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9116
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9116:
	jmp LB_9103
LB_9115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_line
	jmp LB_9119
LB_9118:
	add r14,1
LB_9119:
	cmp r14,r10
	jge LB_9120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9118
	cmp al,10
	jz LB_9118
	cmp al,32
	jz LB_9118
LB_9120:
	push r10
	call NS_E_6499_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9121
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9122
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9123:
	jmp LB_9103
LB_9121:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_9126
LB_9125:
	add r14,1
LB_9126:
	cmp r14,r10
	jge LB_9127
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9125
	cmp al,10
	jz LB_9125
	cmp al,32
	jz LB_9125
LB_9127:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9128
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9129
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9129:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9130
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9130:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9131
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9131:
	jmp LB_9103
LB_9128:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9110
	btr r12,3
	clc
	jmp LB_9111
LB_9110:
	bts r12,3
	stc
LB_9111:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9108
	btr r12,2
	clc
	jmp LB_9109
LB_9108:
	bts r12,2
	stc
LB_9109:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9106
	btr r12,1
	clc
	jmp LB_9107
LB_9106:
	bts r12,1
	stc
LB_9107:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9104
	btr r12,0
	clc
	jmp LB_9105
LB_9104:
	bts r12,0
	stc
LB_9105:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_9099
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_9140
	btr r12,4
	jmp LB_9141
LB_9140:
	bts r12,4
LB_9141:
	mov r8,r9
	bt r12,3
	jc LB_9142
	btr r12,2
	jmp LB_9143
LB_9142:
	bts r12,2
LB_9143:
	mov r9,r14
	bt r12,1
	jc LB_9144
	btr r12,3
	jmp LB_9145
LB_9144:
	bts r12,3
LB_9145:
	mov r14,r10
	bt r12,4
	jc LB_9146
	btr r12,1
	jmp LB_9147
LB_9146:
	bts r12,1
LB_9147:
	mov r10,r13
	bt r12,0
	jc LB_9148
	btr r12,4
	jmp LB_9149
LB_9148:
	bts r12,4
LB_9149:
	mov r13,r9
	bt r12,3
	jc LB_9150
	btr r12,0
	jmp LB_9151
LB_9150:
	bts r12,0
LB_9151:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1526 %_6743 ⊢ %_6744 : %_6744
 ; {>  %_6741~0':(_p1487)◂((_p1500)◂(_stg)) %_6742~1':(_lst)◂((_p1509)◂(_stg)) %_6743~2':(_p1505)◂(_stg) }
; _f1526 2' ⊢ °2◂2'
; _f630 { %_6741 %_6742 %_6744 } ⊢ %_6745 : %_6745
 ; {>  %_6741~0':(_p1487)◂((_p1500)◂(_stg)) %_6744~°2◂2':(_p1508)◂(_stg) %_6742~1':(_lst)◂((_p1509)◂(_stg)) }
; _f630 { 0' 1' °2◂2' } ⊢ °1◂{ 0' 1' °2◂2' }
; _some %_6745 ⊢ %_6746 : %_6746
 ; {>  %_6745~°1◂{ 0' 1' °2◂2' }:(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _some °1◂{ 0' 1' °2◂2' } ⊢ °0◂°1◂{ 0' 1' °2◂2' }
; ∎ %_6746
 ; {>  %_6746~°0◂°1◂{ 0' 1' °2◂2' }:(_opn)◂((_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) })) }
; 	∎ °0◂°1◂{ 0' 1' °2◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂{ 0' 1' °2◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_9087
	btr r12,4
	jmp LB_9088
LB_9087:
	bts r12,4
LB_9088:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9085
	btr QWORD [rdi],0
	jmp LB_9086
LB_9085:
	bts QWORD [rdi],0
LB_9086:
	mov r10,r14
	bt r12,1
	jc LB_9091
	btr r12,4
	jmp LB_9092
LB_9091:
	bts r12,4
LB_9092:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9089
	btr QWORD [rdi],1
	jmp LB_9090
LB_9089:
	bts QWORD [rdi],1
LB_9090:
	mov r10,r8
	bt r12,2
	jc LB_9097
	btr r12,4
	jmp LB_9098
LB_9097:
	bts r12,4
LB_9098:
	mov rsi,1
	bt r12,4
	jc LB_9095
	mov rsi,0
	bt r10,0
	jc LB_9095
	jmp LB_9096
LB_9095:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_9096:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_9093
	btr QWORD [rdi],2
	jmp LB_9094
LB_9093:
	bts QWORD [rdi],2
LB_9094:
	mov rsi,1
	bt r12,3
	jc LB_9083
	mov rsi,0
	bt r9,0
	jc LB_9083
	jmp LB_9084
LB_9083:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9084:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9099:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9101
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9100
LB_9101:
	add rsp,8
	ret
LB_9103:
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
LB_9102:
	add rsp,64
	pop r14
LB_9100:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_9191
LB_9190:
	add r14,1
LB_9191:
	cmp r14,r10
	jge LB_9192
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9190
	cmp al,10
	jz LB_9190
	cmp al,32
	jz LB_9190
LB_9192:
	add r14,3
	cmp r14,r10
	jg LB_9195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_9195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_9195
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_9195
	jmp LB_9196
LB_9195:
	jmp LB_9179
LB_9196:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_ptn
	jmp LB_9198
LB_9197:
	add r14,1
LB_9198:
	cmp r14,r10
	jge LB_9199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9197
	cmp al,10
	jz LB_9197
	cmp al,32
	jz LB_9197
LB_9199:
	push r10
	call NS_E_5273_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9200
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9201:
	jmp LB_9179
LB_9200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_line
	jmp LB_9204
LB_9203:
	add r14,1
LB_9204:
	cmp r14,r10
	jge LB_9205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9203
	cmp al,10
	jz LB_9203
	cmp al,32
	jz LB_9203
LB_9205:
	push r10
	call NS_E_6499_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9206
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9207
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9207:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9208:
	jmp LB_9179
LB_9206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_9211
LB_9210:
	add r14,1
LB_9211:
	cmp r14,r10
	jge LB_9212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9210
	cmp al,10
	jz LB_9210
	cmp al,32
	jz LB_9210
LB_9212:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9213
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9214
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9214:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9215
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9215:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9216
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9216:
	jmp LB_9179
LB_9213:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_id_mtc
	jmp LB_9219
LB_9218:
	add r14,1
LB_9219:
	cmp r14,r10
	jge LB_9220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9218
	cmp al,10
	jz LB_9218
	cmp al,32
	jz LB_9218
LB_9220:
	push r10
	call NS_E_6498_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9221
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9222
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9222:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9223
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9223:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9224
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9224:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9225
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9225:
	jmp LB_9179
LB_9221:
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
	jc LB_9188
	btr r12,4
	clc
	jmp LB_9189
LB_9188:
	bts r12,4
	stc
LB_9189:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9186
	btr r12,3
	clc
	jmp LB_9187
LB_9186:
	bts r12,3
	stc
LB_9187:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9184
	btr r12,2
	clc
	jmp LB_9185
LB_9184:
	bts r12,2
	stc
LB_9185:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9182
	btr r12,1
	clc
	jmp LB_9183
LB_9182:
	bts r12,1
	stc
LB_9183:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9180
	btr r12,0
	clc
	jmp LB_9181
LB_9180:
	bts r12,0
	stc
LB_9181:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_9176
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' 1' 2' 3' }
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_9227
	btr r12,8
	jmp LB_9228
LB_9227:
	bts r12,8
LB_9228:
	mov r9,r10
	bt r12,4
	jc LB_9229
	btr r12,3
	jmp LB_9230
LB_9229:
	bts r12,3
LB_9230:
	mov r10,r8
	bt r12,2
	jc LB_9231
	btr r12,4
	jmp LB_9232
LB_9231:
	bts r12,4
LB_9232:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9233
	btr r12,2
	jmp LB_9234
LB_9233:
	bts r12,2
LB_9234:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_9235
	btr r12,8
	jmp LB_9236
LB_9235:
	bts r12,8
LB_9236:
	mov r14,r10
	bt r12,4
	jc LB_9237
	btr r12,1
	jmp LB_9238
LB_9237:
	bts r12,1
LB_9238:
	mov r10,r13
	bt r12,0
	jc LB_9239
	btr r12,4
	jmp LB_9240
LB_9239:
	bts r12,4
LB_9240:
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9241
	btr r12,0
	jmp LB_9242
LB_9241:
	bts r12,0
LB_9242:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,5
	bts r12,6
	bts r12,7
; _f1526 %_6749 ⊢ %_6751 : %_6751
 ; {>  %_6750~3':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_6749~2':(_p1505)◂(_stg) %_6747~0':(_p1487)◂((_p1500)◂(_stg)) %_6748~1':(_lst)◂((_p1509)◂(_stg)) }
; _f1526 2' ⊢ °2◂2'
; _f629 { { %_6747 %_6748 %_6751 } %_6750 } ⊢ %_6752 : %_6752
 ; {>  %_6751~°2◂2':(_p1508)◂(_stg) %_6750~3':(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) %_6747~0':(_p1487)◂((_p1500)◂(_stg)) %_6748~1':(_lst)◂((_p1509)◂(_stg)) }
; _f629 { { 0' 1' °2◂2' } 3' } ⊢ °0◂{ { 0' 1' °2◂2' } 3' }
; _some %_6752 ⊢ %_6753 : %_6753
 ; {>  %_6752~°0◂{ { 0' 1' °2◂2' } 3' }:(_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) }) }
; _some °0◂{ { 0' 1' °2◂2' } 3' } ⊢ °0◂°0◂{ { 0' 1' °2◂2' } 3' }
; ∎ %_6753
 ; {>  %_6753~°0◂°0◂{ { 0' 1' °2◂2' } 3' }:(_opn)◂((_p628)◂({ (_p1487)◂((_p1500)◂(_stg)) (_lst)◂((_p1509)◂(_stg)) (_p1508)◂(_stg) })) }
; 	∎ °0◂°0◂{ { 0' 1' °2◂2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' °2◂2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_9152
	btr r12,4
	jmp LB_9153
LB_9152:
	bts r12,4
LB_9153:
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
	jc LB_9160
	btr r12,6
	jmp LB_9161
LB_9160:
	bts r12,6
LB_9161:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9158
	btr QWORD [rdi],0
	jmp LB_9159
LB_9158:
	bts QWORD [rdi],0
LB_9159:
	mov rcx,r14
	bt r12,1
	jc LB_9164
	btr r12,6
	jmp LB_9165
LB_9164:
	bts r12,6
LB_9165:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9162
	btr QWORD [rdi],1
	jmp LB_9163
LB_9162:
	bts QWORD [rdi],1
LB_9163:
	mov rcx,r8
	bt r12,2
	jc LB_9170
	btr r12,6
	jmp LB_9171
LB_9170:
	bts r12,6
LB_9171:
	mov rsi,1
	bt r12,6
	jc LB_9168
	mov rsi,0
	bt rcx,0
	jc LB_9168
	jmp LB_9169
LB_9168:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_9169:
	mov rax,0x0200_0000_0000_0001
	or rcx,rax
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_9166
	btr QWORD [rdi],2
	jmp LB_9167
LB_9166:
	bts QWORD [rdi],2
LB_9167:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9156
	btr QWORD [rdi],0
	jmp LB_9157
LB_9156:
	bts QWORD [rdi],0
LB_9157:
	mov r11,r10
	bt r12,4
	jc LB_9174
	btr r12,5
	jmp LB_9175
LB_9174:
	bts r12,5
LB_9175:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9172
	btr QWORD [rdi],1
	jmp LB_9173
LB_9172:
	bts QWORD [rdi],1
LB_9173:
	mov rsi,1
	bt r12,3
	jc LB_9154
	mov rsi,0
	bt r9,0
	jc LB_9154
	jmp LB_9155
LB_9154:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9155:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9176:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9178
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9177
LB_9178:
	add rsp,8
	ret
LB_9179:
	add rsp,80
	pop r14
LB_9177:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6499:
NS_E_RDI_6499:
NS_E_6499_ETR_TBL:
NS_E_6499_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_9262
LB_9261:
	add r14,1
LB_9262:
	cmp r14,r10
	jge LB_9263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9261
	cmp al,10
	jz LB_9261
	cmp al,32
	jz LB_9261
LB_9263:
	push r10
	call NS_E_6500_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9264
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9256
LB_9264:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_9267
LB_9266:
	add r14,1
LB_9267:
	cmp r14,r10
	jge LB_9268
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9266
	cmp al,10
	jz LB_9266
	cmp al,32
	jz LB_9266
LB_9268:
	push r10
	call NS_E_6501_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9269
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9270
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9270:
	jmp LB_9256
LB_9269:
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
	jc LB_9259
	btr r12,1
	clc
	jmp LB_9260
LB_9259:
	bts r12,1
	stc
LB_9260:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9257
	btr r12,0
	clc
	jmp LB_9258
LB_9257:
	bts r12,0
	stc
LB_9258:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9253
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _cns { %_6754 %_6755 } ⊢ %_6756 : %_6756
 ; {>  %_6755~1':(_lst)◂((_p1509)◂(_stg)) %_6754~0':(_p1509)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6756 ⊢ %_6757 : %_6757
 ; {>  %_6756~°0◂{ 0' 1' }:(_lst)◂((_p1509)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6757
 ; {>  %_6757~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1509)◂(_stg))) }
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
	jc LB_9247
	btr r12,2
	jmp LB_9248
LB_9247:
	bts r12,2
LB_9248:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9245
	btr QWORD [rdi],0
	jmp LB_9246
LB_9245:
	bts QWORD [rdi],0
LB_9246:
	mov r8,r14
	bt r12,1
	jc LB_9251
	btr r12,2
	jmp LB_9252
LB_9251:
	bts r12,2
LB_9252:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9249
	btr QWORD [rdi],1
	jmp LB_9250
LB_9249:
	bts QWORD [rdi],1
LB_9250:
	mov rsi,1
	bt r12,3
	jc LB_9243
	mov rsi,0
	bt r9,0
	jc LB_9243
	jmp LB_9244
LB_9243:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9244:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9253:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9255
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9254
LB_9255:
	add rsp,8
	ret
LB_9256:
	add rsp,32
	pop r14
LB_9254:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_9283
LB_9282:
	add r14,1
LB_9283:
	cmp r14,r10
	jge LB_9284
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9282
	cmp al,32
	jz LB_9282
LB_9284:
	add r14,1
	cmp r14,r10
	jg LB_9287
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_9287
	jmp LB_9288
LB_9287:
	jmp LB_9277
LB_9288:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_9290
LB_9289:
	add r14,1
LB_9290:
	cmp r14,r10
	jge LB_9291
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9289
	cmp al,32
	jz LB_9289
LB_9291:
	add r14,1
	cmp r14,r10
	jg LB_9295
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_9295
	jmp LB_9296
LB_9295:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9293:
	jmp LB_9277
LB_9296:
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
	jc LB_9280
	btr r12,1
	clc
	jmp LB_9281
LB_9280:
	bts r12,1
	stc
LB_9281:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9278
	btr r12,0
	clc
	jmp LB_9279
LB_9278:
	bts r12,0
	stc
LB_9279:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9274
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
; _nil {  } ⊢ %_6758 : %_6758
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_6758 ⊢ %_6759 : %_6759
 ; {>  %_6758~°1◂{  }:(_lst)◂(t3102'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6759
 ; {>  %_6759~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3105'(0))) }
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
	jc LB_9272
	mov rsi,0
	bt r9,0
	jc LB_9272
	jmp LB_9273
LB_9272:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9273:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9274:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9276
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9275
LB_9276:
	add rsp,8
	ret
LB_9277:
	add rsp,32
	pop r14
LB_9275:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6500:
NS_E_RDI_6500:
NS_E_6500_ETR_TBL:
NS_E_6500_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_9359
LB_9358:
	add r14,1
LB_9359:
	cmp r14,r10
	jge LB_9360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9358
	cmp al,10
	jz LB_9358
	cmp al,32
	jz LB_9358
LB_9360:
	push r10
	call NS_E_5600_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9361
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9320
LB_9361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_9364
LB_9363:
	add r14,1
LB_9364:
	cmp r14,r10
	jge LB_9365
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9363
	cmp al,10
	jz LB_9363
	cmp al,32
	jz LB_9363
LB_9365:
	add r14,3
	cmp r14,r10
	jg LB_9369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_9369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_9369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_9369
	jmp LB_9370
LB_9369:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9367
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9367:
	jmp LB_9320
LB_9370:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_9333
LB_9332:
	add r14,1
LB_9333:
	cmp r14,r10
	jge LB_9334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9332
	cmp al,10
	jz LB_9332
	cmp al,32
	jz LB_9332
LB_9334:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9335
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9336
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9336:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9337:
	jmp LB_9321
LB_9335:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_9340
LB_9339:
	add r14,1
LB_9340:
	cmp r14,r10
	jge LB_9341
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9339
	cmp al,10
	jz LB_9339
	cmp al,32
	jz LB_9339
LB_9341:
	add r14,3
	cmp r14,r10
	jg LB_9347
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_9347
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_9347
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_9347
	jmp LB_9348
LB_9347:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9343
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9343:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9344
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9344:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9345
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9345:
	jmp LB_9321
LB_9348:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; mtc_ptn
	jmp LB_9350
LB_9349:
	add r14,1
LB_9350:
	cmp r14,r10
	jge LB_9351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9349
	cmp al,10
	jz LB_9349
	cmp al,32
	jz LB_9349
LB_9351:
	push r10
	call NS_E_5273_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9352
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9353
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9353:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9354
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9354:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9355
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9355:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9356
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9356:
	jmp LB_9321
LB_9352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9330
	btr r12,4
	clc
	jmp LB_9331
LB_9330:
	bts r12,4
	stc
LB_9331:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9328
	btr r12,3
	clc
	jmp LB_9329
LB_9328:
	bts r12,3
	stc
LB_9329:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9326
	btr r12,2
	clc
	jmp LB_9327
LB_9326:
	bts r12,2
	stc
LB_9327:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9324
	btr r12,1
	clc
	jmp LB_9325
LB_9324:
	bts r12,1
	stc
LB_9325:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9322
	btr r12,0
	clc
	jmp LB_9323
LB_9322:
	bts r12,0
	stc
LB_9323:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_9317
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_9371
	btr r12,5
	jmp LB_9372
LB_9371:
	bts r12,5
LB_9372:
	mov r8,r10
	bt r12,4
	jc LB_9373
	btr r12,2
	jmp LB_9374
LB_9373:
	bts r12,2
LB_9374:
	mov r10,r14
	bt r12,1
	jc LB_9375
	btr r12,4
	jmp LB_9376
LB_9375:
	bts r12,4
LB_9376:
	mov r14,r11
	bt r12,5
	jc LB_9377
	btr r12,1
	jmp LB_9378
LB_9377:
	bts r12,1
LB_9378:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1501 { %_6761 %_6762 } ⊢ %_6763 : %_6763
 ; {>  %_6762~2':(_p1487)◂((_p1500)◂(_stg)) %_6760~0':(_p1487)◂((_p1494)◂(_stg)) %_6761~1':_p1442 }
; _f1501 { 1' 2' } ⊢ °0◂{ 1' 2' }
; _f1489 %_6763 ⊢ %_6764 : %_6764
 ; {>  %_6763~°0◂{ 1' 2' }:(_p1500)◂(_stg) %_6760~0':(_p1487)◂((_p1494)◂(_stg)) }
; _f1489 °0◂{ 1' 2' } ⊢ °1◂°0◂{ 1' 2' }
; _f1527 { %_6760 %_6764 } ⊢ %_6765 : %_6765
 ; {>  %_6760~0':(_p1487)◂((_p1494)◂(_stg)) %_6764~°1◂°0◂{ 1' 2' }:(_p1487)◂((_p1500)◂(_stg)) }
; _f1527 { 0' °1◂°0◂{ 1' 2' } } ⊢ °0◂{ 0' °1◂°0◂{ 1' 2' } }
; _some %_6765 ⊢ %_6766 : %_6766
 ; {>  %_6765~°0◂{ 0' °1◂°0◂{ 1' 2' } }:(_p1509)◂(_stg) }
; _some °0◂{ 0' °1◂°0◂{ 1' 2' } } ⊢ °0◂°0◂{ 0' °1◂°0◂{ 1' 2' } }
; ∎ %_6766
 ; {>  %_6766~°0◂°0◂{ 0' °1◂°0◂{ 1' 2' } }:(_opn)◂((_p1509)◂(_stg)) }
; 	∎ °0◂°0◂{ 0' °1◂°0◂{ 1' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' °1◂°0◂{ 1' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_9301
	btr r12,4
	jmp LB_9302
LB_9301:
	bts r12,4
LB_9302:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9299
	btr QWORD [rdi],0
	jmp LB_9300
LB_9299:
	bts QWORD [rdi],0
LB_9300:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r13,r14
	bt r12,1
	jc LB_9311
	btr r12,0
	jmp LB_9312
LB_9311:
	bts r12,0
LB_9312:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_9309
	btr QWORD [rdi],0
	jmp LB_9310
LB_9309:
	bts QWORD [rdi],0
LB_9310:
	mov r13,r8
	bt r12,2
	jc LB_9315
	btr r12,0
	jmp LB_9316
LB_9315:
	bts r12,0
LB_9316:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_9313
	btr QWORD [rdi],1
	jmp LB_9314
LB_9313:
	bts QWORD [rdi],1
LB_9314:
	mov rsi,1
	bt r12,4
	jc LB_9307
	mov rsi,0
	bt r10,0
	jc LB_9307
	jmp LB_9308
LB_9307:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_9308:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_9305
	mov rsi,0
	bt r10,0
	jc LB_9305
	jmp LB_9306
LB_9305:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_9306:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9303
	btr QWORD [rdi],1
	jmp LB_9304
LB_9303:
	bts QWORD [rdi],1
LB_9304:
	mov rsi,1
	bt r12,3
	jc LB_9297
	mov rsi,0
	bt r9,0
	jc LB_9297
	jmp LB_9298
LB_9297:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9298:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9317:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9319
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9318
LB_9319:
	add rsp,8
	ret
LB_9321:
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
LB_9320:
	add rsp,80
	pop r14
LB_9318:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_9400
LB_9399:
	add r14,1
LB_9400:
	cmp r14,r10
	jge LB_9401
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9399
	cmp al,32
	jz LB_9399
LB_9401:
	push r10
	call NS_E_6502_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9402
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9392
LB_9402:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_9405
LB_9404:
	add r14,1
LB_9405:
	cmp r14,r10
	jge LB_9406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9404
	cmp al,32
	jz LB_9404
LB_9406:
	add r14,1
	cmp r14,r10
	jg LB_9410
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_9410
	jmp LB_9411
LB_9410:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9408
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9408:
	jmp LB_9392
LB_9411:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_9413
LB_9412:
	add r14,1
LB_9413:
	cmp r14,r10
	jge LB_9414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9412
	cmp al,32
	jz LB_9412
LB_9414:
	push r10
	call NS_E_6502_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9415
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9416
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9416:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9417
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9417:
	jmp LB_9392
LB_9415:
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
	jc LB_9397
	btr r12,2
	clc
	jmp LB_9398
LB_9397:
	bts r12,2
	stc
LB_9398:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9395
	btr r12,1
	clc
	jmp LB_9396
LB_9395:
	bts r12,1
	stc
LB_9396:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9393
	btr r12,0
	clc
	jmp LB_9394
LB_9393:
	bts r12,0
	stc
LB_9394:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_9389
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov rcx,r14
	bt r12,1
	jc LB_9419
	btr r12,6
	jmp LB_9420
LB_9419:
	bts r12,6
LB_9420:
	mov r14,r8
	bt r12,2
	jc LB_9421
	btr r12,1
	jmp LB_9422
LB_9421:
	bts r12,1
LB_9422:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,3
	bts r12,4
	bts r12,5
; _f1528 { %_6767 %_6768 } ⊢ %_6769 : %_6769
 ; {>  %_6767~0':(_p1510)◂(_stg) %_6768~1':(_p1510)◂(_stg) }
; _f1528 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_6769 ⊢ %_6770 : %_6770
 ; {>  %_6769~°1◂{ 0' 1' }:(_p1509)◂(_stg) }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_6770
 ; {>  %_6770~°0◂°1◂{ 0' 1' }:(_opn)◂((_p1509)◂(_stg)) }
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
	jc LB_9383
	btr r12,2
	jmp LB_9384
LB_9383:
	bts r12,2
LB_9384:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9381
	btr QWORD [rdi],0
	jmp LB_9382
LB_9381:
	bts QWORD [rdi],0
LB_9382:
	mov r8,r14
	bt r12,1
	jc LB_9387
	btr r12,2
	jmp LB_9388
LB_9387:
	bts r12,2
LB_9388:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9385
	btr QWORD [rdi],1
	jmp LB_9386
LB_9385:
	bts QWORD [rdi],1
LB_9386:
	mov rsi,1
	bt r12,3
	jc LB_9379
	mov rsi,0
	bt r9,0
	jc LB_9379
	jmp LB_9380
LB_9379:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9380:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9389:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9391
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9390
LB_9391:
	add rsp,8
	ret
LB_9392:
	add rsp,48
	pop r14
LB_9390:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6501:
NS_E_RDI_6501:
NS_E_6501_ETR_TBL:
NS_E_6501_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_9458
LB_9457:
	add r14,1
LB_9458:
	cmp r14,r10
	jge LB_9459
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9457
	cmp al,10
	jz LB_9457
	cmp al,32
	jz LB_9457
LB_9459:
	add r14,1
	cmp r14,r10
	jg LB_9462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_9462
	jmp LB_9463
LB_9462:
	jmp LB_9436
LB_9463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_9445
LB_9444:
	add r14,1
LB_9445:
	cmp r14,r10
	jge LB_9446
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9444
	cmp al,10
	jz LB_9444
	cmp al,32
	jz LB_9444
LB_9446:
	push r10
	call NS_E_6500_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9447
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9448
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9448:
	jmp LB_9437
LB_9447:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_9451
LB_9450:
	add r14,1
LB_9451:
	cmp r14,r10
	jge LB_9452
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9450
	cmp al,10
	jz LB_9450
	cmp al,32
	jz LB_9450
LB_9452:
	push r10
	call NS_E_6501_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9453
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9454
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9455:
	jmp LB_9437
LB_9453:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9442
	btr r12,2
	clc
	jmp LB_9443
LB_9442:
	bts r12,2
	stc
LB_9443:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9440
	btr r12,1
	clc
	jmp LB_9441
LB_9440:
	bts r12,1
	stc
LB_9441:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9438
	btr r12,0
	clc
	jmp LB_9439
LB_9438:
	bts r12,0
	stc
LB_9439:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_9433
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_9464
	btr r12,3
	jmp LB_9465
LB_9464:
	bts r12,3
LB_9465:
	mov r14,r8
	bt r12,2
	jc LB_9466
	btr r12,1
	jmp LB_9467
LB_9466:
	bts r12,1
LB_9467:
	mov r8,r13
	bt r12,0
	jc LB_9468
	btr r12,2
	jmp LB_9469
LB_9468:
	bts r12,2
LB_9469:
	mov r13,r9
	bt r12,3
	jc LB_9470
	btr r12,0
	jmp LB_9471
LB_9470:
	bts r12,0
LB_9471:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_6771 %_6772 } ⊢ %_6773 : %_6773
 ; {>  %_6772~1':(_lst)◂((_p1509)◂(_stg)) %_6771~0':(_p1509)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6773 ⊢ %_6774 : %_6774
 ; {>  %_6773~°0◂{ 0' 1' }:(_lst)◂((_p1509)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6774
 ; {>  %_6774~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1509)◂(_stg))) }
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
	jc LB_9427
	btr r12,2
	jmp LB_9428
LB_9427:
	bts r12,2
LB_9428:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9425
	btr QWORD [rdi],0
	jmp LB_9426
LB_9425:
	bts QWORD [rdi],0
LB_9426:
	mov r8,r14
	bt r12,1
	jc LB_9431
	btr r12,2
	jmp LB_9432
LB_9431:
	bts r12,2
LB_9432:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9429
	btr QWORD [rdi],1
	jmp LB_9430
LB_9429:
	bts QWORD [rdi],1
LB_9430:
	mov rsi,1
	bt r12,3
	jc LB_9423
	mov rsi,0
	bt r9,0
	jc LB_9423
	jmp LB_9424
LB_9423:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9424:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9433:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9435
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9434
LB_9435:
	add rsp,8
	ret
LB_9437:
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
LB_9436:
	add rsp,48
	pop r14
LB_9434:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_9483
LB_9482:
	add r14,1
LB_9483:
	cmp r14,r10
	jge LB_9484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9482
	cmp al,32
	jz LB_9482
LB_9484:
	add r14,1
	cmp r14,r10
	jg LB_9487
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_9487
	jmp LB_9488
LB_9487:
	jmp LB_9477
LB_9488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_9490
LB_9489:
	add r14,1
LB_9490:
	cmp r14,r10
	jge LB_9491
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9489
	cmp al,32
	jz LB_9489
LB_9491:
	add r14,1
	cmp r14,r10
	jg LB_9495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_9495
	jmp LB_9496
LB_9495:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9493
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9493:
	jmp LB_9477
LB_9496:
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
	jc LB_9480
	btr r12,1
	clc
	jmp LB_9481
LB_9480:
	bts r12,1
	stc
LB_9481:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9478
	btr r12,0
	clc
	jmp LB_9479
LB_9478:
	bts r12,0
	stc
LB_9479:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9474
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
; _nil {  } ⊢ %_6775 : %_6775
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_6775 ⊢ %_6776 : %_6776
 ; {>  %_6775~°1◂{  }:(_lst)◂(t3140'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6776
 ; {>  %_6776~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3143'(0))) }
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
	jc LB_9472
	mov rsi,0
	bt r9,0
	jc LB_9472
	jmp LB_9473
LB_9472:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9473:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9474:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9476
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9475
LB_9476:
	add rsp,8
	ret
LB_9477:
	add rsp,32
	pop r14
LB_9475:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6502:
NS_E_RDI_6502:
NS_E_6502_ETR_TBL:
NS_E_6502_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9512
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9504
LB_9512:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_9520
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_9520
	jmp LB_9521
LB_9520:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9518
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9518:
	jmp LB_9504
LB_9521:
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
	jc LB_9507
	btr r12,1
	clc
	jmp LB_9508
LB_9507:
	bts r12,1
	stc
LB_9508:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9505
	btr r12,0
	clc
	jmp LB_9506
LB_9505:
	bts r12,0
	stc
LB_9506:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9501
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _f1530 %_6777 ⊢ %_6778 : %_6778
 ; {>  %_6777~0':_stg }
; _f1530 0' ⊢ °1◂0'
; _some %_6778 ⊢ %_6779 : %_6779
 ; {>  %_6778~°1◂0':(_p1510)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6779
 ; {>  %_6779~°0◂°1◂0':(_opn)◂((_p1510)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9499
	btr r12,3
	jmp LB_9500
LB_9499:
	bts r12,3
LB_9500:
	mov rsi,1
	bt r12,3
	jc LB_9497
	mov rsi,0
	bt r9,0
	jc LB_9497
	jmp LB_9498
LB_9497:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9498:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9501:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9503
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9502
LB_9503:
	add rsp,8
	ret
LB_9504:
	add rsp,32
	pop r14
LB_9502:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_5144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9535
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9529
LB_9535:
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
	jc LB_9530
	btr r12,0
	clc
	jmp LB_9531
LB_9530:
	bts r12,0
	stc
LB_9531:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9526
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1529 %_6780 ⊢ %_6781 : %_6781
 ; {>  %_6780~0':_p1490 }
; _f1529 0' ⊢ °0◂0'
; _some %_6781 ⊢ %_6782 : %_6782
 ; {>  %_6781~°0◂0':(_p1510)◂(t3153'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6782
 ; {>  %_6782~°0◂°0◂0':(_opn)◂((_p1510)◂(t3156'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9524
	btr r12,3
	jmp LB_9525
LB_9524:
	bts r12,3
LB_9525:
	mov rsi,1
	bt r12,3
	jc LB_9522
	mov rsi,0
	bt r9,0
	jc LB_9522
	jmp LB_9523
LB_9522:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9523:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9526:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9528
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9527
LB_9528:
	add rsp,8
	ret
LB_9529:
	add rsp,16
	pop r14
LB_9527:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6503:
NS_E_RDI_6503:
NS_E_6503_ETR_TBL:
NS_E_6503_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_9558
LB_9557:
	add r14,1
LB_9558:
	cmp r14,r10
	jge LB_9559
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9557
	cmp al,10
	jz LB_9557
	cmp al,32
	jz LB_9557
LB_9559:
	add r14,1
	cmp r14,r10
	jg LB_9562
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_9562
	jmp LB_9563
LB_9562:
	jmp LB_9548
LB_9563:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_9565
LB_9564:
	add r14,1
LB_9565:
	cmp r14,r10
	jge LB_9566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9564
	cmp al,10
	jz LB_9564
	cmp al,32
	jz LB_9564
LB_9566:
	add r14,1
	cmp r14,r10
	jg LB_9570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_9570
	jmp LB_9571
LB_9570:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9568
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9568:
	jmp LB_9548
LB_9571:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_9573
LB_9572:
	add r14,1
LB_9573:
	cmp r14,r10
	jge LB_9574
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9572
	cmp al,10
	jz LB_9572
	cmp al,32
	jz LB_9572
LB_9574:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9575
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9576
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9576:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9577:
	jmp LB_9548
LB_9575:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_9580
LB_9579:
	add r14,1
LB_9580:
	cmp r14,r10
	jge LB_9581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9579
	cmp al,10
	jz LB_9579
	cmp al,32
	jz LB_9579
LB_9581:
	push r10
	call NS_E_6504_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9582
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9583
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9583:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9584
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9584:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9585
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9585:
	jmp LB_9548
LB_9582:
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
	jc LB_9555
	btr r12,3
	clc
	jmp LB_9556
LB_9555:
	bts r12,3
	stc
LB_9556:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9553
	btr r12,2
	clc
	jmp LB_9554
LB_9553:
	bts r12,2
	stc
LB_9554:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9551
	btr r12,1
	clc
	jmp LB_9552
LB_9551:
	bts r12,1
	stc
LB_9552:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9549
	btr r12,0
	clc
	jmp LB_9550
LB_9549:
	bts r12,0
	stc
LB_9550:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_9545
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov rdx,r14
	bt r12,1
	jc LB_9587
	btr r12,7
	jmp LB_9588
LB_9587:
	bts r12,7
LB_9588:
	mov r14,r9
	bt r12,3
	jc LB_9589
	btr r12,1
	jmp LB_9590
LB_9589:
	bts r12,1
LB_9590:
	mov r9,r13
	bt r12,0
	jc LB_9591
	btr r12,3
	jmp LB_9592
LB_9591:
	bts r12,3
LB_9592:
	mov r13,r8
	bt r12,2
	jc LB_9593
	btr r12,0
	jmp LB_9594
LB_9593:
	bts r12,0
LB_9594:
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
; _some { %_6783 %_6784 } ⊢ %_6785 : %_6785
 ; {>  %_6784~1':_p1543 %_6783~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_6785
 ; {>  %_6785~°0◂{ 0' 1' }:(_opn)◂({ _stg _p1543 }) }
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
	jc LB_9539
	btr r12,2
	jmp LB_9540
LB_9539:
	bts r12,2
LB_9540:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9537
	btr QWORD [rdi],0
	jmp LB_9538
LB_9537:
	bts QWORD [rdi],0
LB_9538:
	mov r8,r14
	bt r12,1
	jc LB_9543
	btr r12,2
	jmp LB_9544
LB_9543:
	bts r12,2
LB_9544:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9541
	btr QWORD [rdi],1
	jmp LB_9542
LB_9541:
	bts QWORD [rdi],1
LB_9542:
	mov r8,0
	bts r12,2
	ret
LB_9545:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9547
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9546
LB_9547:
	add rsp,8
	ret
LB_9548:
	add rsp,64
	pop r14
LB_9546:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6504:
NS_E_RDI_6504:
NS_E_6504_ETR_TBL:
NS_E_6504_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_9606
LB_9605:
	add r14,1
LB_9606:
	cmp r14,r10
	jge LB_9607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9605
	cmp al,10
	jz LB_9605
	cmp al,32
	jz LB_9605
LB_9607:
	push r10
	call NS_E_6505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9608
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9602
LB_9608:
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
	jc LB_9603
	btr r12,0
	clc
	jmp LB_9604
LB_9603:
	bts r12,0
	stc
LB_9604:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9599
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1566 %_6786 ⊢ %_6787 : %_6787
 ; {>  %_6786~0':_p1545 }
; _f1566 0' ⊢ °1◂0'
; _some %_6787 ⊢ %_6788 : %_6788
 ; {>  %_6787~°1◂0':_p1543 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6788
 ; {>  %_6788~°0◂°1◂0':(_opn)◂(_p1543) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9597
	btr r12,3
	jmp LB_9598
LB_9597:
	bts r12,3
LB_9598:
	mov rsi,1
	bt r12,3
	jc LB_9595
	mov rsi,0
	bt r9,0
	jc LB_9595
	jmp LB_9596
LB_9595:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9596:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9599:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9601
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9600
LB_9601:
	add rsp,8
	ret
LB_9602:
	add rsp,16
	pop r14
LB_9600:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_9621
LB_9620:
	add r14,1
LB_9621:
	cmp r14,r10
	jge LB_9622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9620
	cmp al,10
	jz LB_9620
	cmp al,32
	jz LB_9620
LB_9622:
	push r10
	call NS_E_6513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9623
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9617
LB_9623:
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
	jc LB_9618
	btr r12,0
	clc
	jmp LB_9619
LB_9618:
	bts r12,0
	stc
LB_9619:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9614
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1565 %_6789 ⊢ %_6790 : %_6790
 ; {>  %_6789~0':_p1544 }
; _f1565 0' ⊢ °0◂0'
; _some %_6790 ⊢ %_6791 : %_6791
 ; {>  %_6790~°0◂0':_p1543 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6791
 ; {>  %_6791~°0◂°0◂0':(_opn)◂(_p1543) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9612
	btr r12,3
	jmp LB_9613
LB_9612:
	bts r12,3
LB_9613:
	mov rsi,1
	bt r12,3
	jc LB_9610
	mov rsi,0
	bt r9,0
	jc LB_9610
	jmp LB_9611
LB_9610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9611:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9614:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9616
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9615
LB_9616:
	add rsp,8
	ret
LB_9617:
	add rsp,16
	pop r14
LB_9615:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6505:
NS_E_RDI_6505:
NS_E_6505_ETR_TBL:
NS_E_6505_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_9674
LB_9673:
	add r14,1
LB_9674:
	cmp r14,r10
	jge LB_9675
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9673
	cmp al,10
	jz LB_9673
	cmp al,32
	jz LB_9673
LB_9675:
	push r10
	call NS_E_6512_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9676
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9652
LB_9676:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_9661
LB_9660:
	add r14,1
LB_9661:
	cmp r14,r10
	jge LB_9662
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9660
	cmp al,10
	jz LB_9660
	cmp al,32
	jz LB_9660
LB_9662:
	push r10
	call NS_E_6507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9663
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9664
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9664:
	jmp LB_9653
LB_9663:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_9667
LB_9666:
	add r14,1
LB_9667:
	cmp r14,r10
	jge LB_9668
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9666
	cmp al,10
	jz LB_9666
	cmp al,32
	jz LB_9666
LB_9668:
	push r10
	call NS_E_6506_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9669
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9670
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9670:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9671
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9671:
	jmp LB_9653
LB_9669:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9658
	btr r12,2
	clc
	jmp LB_9659
LB_9658:
	bts r12,2
	stc
LB_9659:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9656
	btr r12,1
	clc
	jmp LB_9657
LB_9656:
	bts r12,1
	stc
LB_9657:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9654
	btr r12,0
	clc
	jmp LB_9655
LB_9654:
	bts r12,0
	stc
LB_9655:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_9649
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_9678
	btr r12,5
	jmp LB_9679
LB_9678:
	bts r12,5
LB_9679:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9682
	btr r12,6
	clc
	jmp LB_9683
LB_9682:
	bts r12,6
	stc
LB_9683:
	mov r8,rcx
	bt r12,6
	jc LB_9680
	btr r12,2
	jmp LB_9681
LB_9680:
	bts r12,2
LB_9681:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9686
	btr r12,6
	clc
	jmp LB_9687
LB_9686:
	bts r12,6
	stc
LB_9687:
	mov r9,rcx
	bt r12,6
	jc LB_9684
	btr r12,3
	jmp LB_9685
LB_9684:
	bts r12,3
LB_9685:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_9690
	btr r12,6
	clc
	jmp LB_9691
LB_9690:
	bts r12,6
	stc
LB_9691:
	mov r10,rcx
	bt r12,6
	jc LB_9688
	btr r12,4
	jmp LB_9689
LB_9688:
	bts r12,4
LB_9689:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f1570 { %_6794 %_6795 %_6792 %_6793 %_6796 } ⊢ %_6797 : %_6797
 ; {>  %_6795~3':(_p1505)◂(_stg) %_6793~1':_p1547 %_6796~4':(_opn)◂(_p1545) %_6792~0':_p1546 %_6794~2':(_p1487)◂((_p1495)◂(_stg)) }
; _f1570 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_6797 ⊢ %_6798 : %_6798
 ; {>  %_6797~°1◂{ 2' 3' 0' 1' 4' }:_p1545 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_6798
 ; {>  %_6798~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p1545) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_9625
	btr r12,5
	jmp LB_9626
LB_9625:
	bts r12,5
LB_9626:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_9631
	btr r12,6
	jmp LB_9632
LB_9631:
	bts r12,6
LB_9632:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9629
	btr QWORD [rdi],0
	jmp LB_9630
LB_9629:
	bts QWORD [rdi],0
LB_9630:
	mov rcx,r11
	bt r12,5
	jc LB_9635
	btr r12,6
	jmp LB_9636
LB_9635:
	bts r12,6
LB_9636:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9633
	btr QWORD [rdi],1
	jmp LB_9634
LB_9633:
	bts QWORD [rdi],1
LB_9634:
	mov rcx,r13
	bt r12,0
	jc LB_9639
	btr r12,6
	jmp LB_9640
LB_9639:
	bts r12,6
LB_9640:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_9637
	btr QWORD [rdi],2
	jmp LB_9638
LB_9637:
	bts QWORD [rdi],2
LB_9638:
	mov rcx,r14
	bt r12,1
	jc LB_9643
	btr r12,6
	jmp LB_9644
LB_9643:
	bts r12,6
LB_9644:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_9641
	btr QWORD [rdi],3
	jmp LB_9642
LB_9641:
	bts QWORD [rdi],3
LB_9642:
	mov rcx,r10
	bt r12,4
	jc LB_9647
	btr r12,6
	jmp LB_9648
LB_9647:
	bts r12,6
LB_9648:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_9645
	btr QWORD [rdi],4
	jmp LB_9646
LB_9645:
	bts QWORD [rdi],4
LB_9646:
	mov rsi,1
	bt r12,3
	jc LB_9627
	mov rsi,0
	bt r9,0
	jc LB_9627
	jmp LB_9628
LB_9627:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9628:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9649:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9651
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9650
LB_9651:
	add rsp,8
	ret
LB_9653:
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
LB_9652:
	add rsp,48
	pop r14
LB_9650:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_9733
LB_9732:
	add r14,1
LB_9733:
	cmp r14,r10
	jge LB_9734
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9732
	cmp al,10
	jz LB_9732
	cmp al,32
	jz LB_9732
LB_9734:
	push r10
	call NS_E_6511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9735
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9723
LB_9735:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_9738
LB_9737:
	add r14,1
LB_9738:
	cmp r14,r10
	jge LB_9739
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9737
	cmp al,10
	jz LB_9737
	cmp al,32
	jz LB_9737
LB_9739:
	push r10
	call NS_E_6507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9740
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9741
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9741:
	jmp LB_9723
LB_9740:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_9744
LB_9743:
	add r14,1
LB_9744:
	cmp r14,r10
	jge LB_9745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9743
	cmp al,10
	jz LB_9743
	cmp al,32
	jz LB_9743
LB_9745:
	push r10
	call NS_E_6506_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9746
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9747
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9747:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9748
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9748:
	jmp LB_9723
LB_9746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_9751
LB_9750:
	add r14,1
LB_9751:
	cmp r14,r10
	jge LB_9752
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9750
	cmp al,10
	jz LB_9750
	cmp al,32
	jz LB_9750
LB_9752:
	push r10
	call NS_E_6505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9753
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9754
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9754:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9755
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9755:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9756
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9756:
	jmp LB_9723
LB_9753:
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
	jc LB_9730
	btr r12,3
	clc
	jmp LB_9731
LB_9730:
	bts r12,3
	stc
LB_9731:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9728
	btr r12,2
	clc
	jmp LB_9729
LB_9728:
	bts r12,2
	stc
LB_9729:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9726
	btr r12,1
	clc
	jmp LB_9727
LB_9726:
	bts r12,1
	stc
LB_9727:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9724
	btr r12,0
	clc
	jmp LB_9725
LB_9724:
	bts r12,0
	stc
LB_9725:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_9720
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov rdx,r11
	bt r12,5
	jc LB_9758
	btr r12,7
	jmp LB_9759
LB_9758:
	bts r12,7
LB_9759:
	mov r11,r9
	bt r12,3
	jc LB_9760
	btr r12,5
	jmp LB_9761
LB_9760:
	bts r12,5
LB_9761:
	mov rdi,r10
	mov QWORD [st_vct+8*9],rdi
	bt r12,4
	jc LB_9762
	btr r12,9
	jmp LB_9763
LB_9762:
	bts r12,9
LB_9763:
	mov rdi,r8
	mov QWORD [st_vct+8*8],rdi
	bt r12,2
	jc LB_9764
	btr r12,8
	jmp LB_9765
LB_9764:
	bts r12,8
LB_9765:
; 8' ⊢ { 2' 3' 4' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],0
	jc LB_9768
	btr r12,10
	clc
	jmp LB_9769
LB_9768:
	bts r12,10
	stc
LB_9769:
	mov r8,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_9766
	btr r12,2
	jmp LB_9767
LB_9766:
	bts r12,2
LB_9767:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],1
	jc LB_9772
	btr r12,10
	clc
	jmp LB_9773
LB_9772:
	bts r12,10
	stc
LB_9773:
	mov r9,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_9770
	btr r12,3
	jmp LB_9771
LB_9770:
	bts r12,3
LB_9771:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*10],rax
	bt QWORD [rdi],2
	jc LB_9776
	btr r12,10
	clc
	jmp LB_9777
LB_9776:
	bts r12,10
	stc
LB_9777:
	mov r10,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_9774
	btr r12,4
	jmp LB_9775
LB_9774:
	bts r12,4
LB_9775:
	mov rdi,QWORD [st_vct+8*8]
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,4
	bts r12,5
	bts r12,6
; _f1569 { %_6801 %_6802 %_6799 %_6800 %_6803 %_6804 } ⊢ %_6805 : %_6805
 ; {>  %_6802~3':(_p1505)◂(_stg) %_6804~5':_p1545 %_6801~2':(_p1487)◂((_p1495)◂(_stg)) %_6799~0':_p1546 %_6803~4':(_opn)◂(_p1545) %_6800~1':_p1547 }
; _f1569 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_6805 ⊢ %_6806 : %_6806
 ; {>  %_6805~°0◂{ 2' 3' 0' 1' 4' 5' }:_p1545 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_6806
 ; {>  %_6806~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p1545) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_9692
	btr r12,6
	jmp LB_9693
LB_9692:
	bts r12,6
LB_9693:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_9698
	btr r12,7
	jmp LB_9699
LB_9698:
	bts r12,7
LB_9699:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_9696
	btr QWORD [rdi],0
	jmp LB_9697
LB_9696:
	bts QWORD [rdi],0
LB_9697:
	mov rdx,rcx
	bt r12,6
	jc LB_9702
	btr r12,7
	jmp LB_9703
LB_9702:
	bts r12,7
LB_9703:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_9700
	btr QWORD [rdi],1
	jmp LB_9701
LB_9700:
	bts QWORD [rdi],1
LB_9701:
	mov rdx,r13
	bt r12,0
	jc LB_9706
	btr r12,7
	jmp LB_9707
LB_9706:
	bts r12,7
LB_9707:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,7
	jc LB_9704
	btr QWORD [rdi],2
	jmp LB_9705
LB_9704:
	bts QWORD [rdi],2
LB_9705:
	mov rdx,r14
	bt r12,1
	jc LB_9710
	btr r12,7
	jmp LB_9711
LB_9710:
	bts r12,7
LB_9711:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,7
	jc LB_9708
	btr QWORD [rdi],3
	jmp LB_9709
LB_9708:
	bts QWORD [rdi],3
LB_9709:
	mov rdx,r10
	bt r12,4
	jc LB_9714
	btr r12,7
	jmp LB_9715
LB_9714:
	bts r12,7
LB_9715:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,7
	jc LB_9712
	btr QWORD [rdi],4
	jmp LB_9713
LB_9712:
	bts QWORD [rdi],4
LB_9713:
	mov rdx,r11
	bt r12,5
	jc LB_9718
	btr r12,7
	jmp LB_9719
LB_9718:
	bts r12,7
LB_9719:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*5],rsi
	bt r12,7
	jc LB_9716
	btr QWORD [rdi],5
	jmp LB_9717
LB_9716:
	bts QWORD [rdi],5
LB_9717:
	mov rsi,1
	bt r12,3
	jc LB_9694
	mov rsi,0
	bt r9,0
	jc LB_9694
	jmp LB_9695
LB_9694:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9695:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9720:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9722
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9721
LB_9722:
	add rsp,8
	ret
LB_9723:
	add rsp,64
	pop r14
LB_9721:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6506:
NS_E_RDI_6506:
NS_E_6506_ETR_TBL:
NS_E_6506_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_9832
LB_9831:
	add r14,1
LB_9832:
	cmp r14,r10
	jge LB_9833
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9831
	cmp al,10
	jz LB_9831
	cmp al,32
	jz LB_9831
LB_9833:
	add r14,1
	cmp r14,r10
	jg LB_9836
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_9836
	jmp LB_9837
LB_9836:
	jmp LB_9795
LB_9837:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_9839
LB_9838:
	add r14,1
LB_9839:
	cmp r14,r10
	jge LB_9840
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9838
	cmp al,10
	jz LB_9838
	cmp al,32
	jz LB_9838
LB_9840:
	add r14,3
	cmp r14,r10
	jg LB_9844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_9844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_9844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_9844
	jmp LB_9845
LB_9844:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9842
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9842:
	jmp LB_9795
LB_9845:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_9808
LB_9807:
	add r14,1
LB_9808:
	cmp r14,r10
	jge LB_9809
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9807
	cmp al,10
	jz LB_9807
	cmp al,32
	jz LB_9807
LB_9809:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9810
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9811
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9811:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9812
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9812:
	jmp LB_9796
LB_9810:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_9815
LB_9814:
	add r14,1
LB_9815:
	cmp r14,r10
	jge LB_9816
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9814
	cmp al,10
	jz LB_9814
	cmp al,32
	jz LB_9814
LB_9816:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9817
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9818
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9818:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9819
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9819:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9820
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9820:
	jmp LB_9796
LB_9817:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_9823
LB_9822:
	add r14,1
LB_9823:
	cmp r14,r10
	jge LB_9824
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9822
	cmp al,10
	jz LB_9822
	cmp al,32
	jz LB_9822
LB_9824:
	push r10
	call NS_E_6505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9825
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9826
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9826:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9827
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9827:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9828
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9828:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9829
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9829:
	jmp LB_9796
LB_9825:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9805
	btr r12,4
	clc
	jmp LB_9806
LB_9805:
	bts r12,4
	stc
LB_9806:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9803
	btr r12,3
	clc
	jmp LB_9804
LB_9803:
	bts r12,3
	stc
LB_9804:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9801
	btr r12,2
	clc
	jmp LB_9802
LB_9801:
	bts r12,2
	stc
LB_9802:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9799
	btr r12,1
	clc
	jmp LB_9800
LB_9799:
	bts r12,1
	stc
LB_9800:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9797
	btr r12,0
	clc
	jmp LB_9798
LB_9797:
	bts r12,0
	stc
LB_9798:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_9792
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_9846
	btr r12,5
	jmp LB_9847
LB_9846:
	bts r12,5
LB_9847:
	mov r8,r10
	bt r12,4
	jc LB_9848
	btr r12,2
	jmp LB_9849
LB_9848:
	bts r12,2
LB_9849:
	mov r10,r14
	bt r12,1
	jc LB_9850
	btr r12,4
	jmp LB_9851
LB_9850:
	bts r12,4
LB_9851:
	mov r14,r9
	bt r12,3
	jc LB_9852
	btr r12,1
	jmp LB_9853
LB_9852:
	bts r12,1
LB_9853:
	mov r9,r13
	bt r12,0
	jc LB_9854
	btr r12,3
	jmp LB_9855
LB_9854:
	bts r12,3
LB_9855:
	mov r13,r11
	bt r12,5
	jc LB_9856
	btr r12,0
	jmp LB_9857
LB_9856:
	bts r12,0
LB_9857:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_6809 ⊢ %_6810 : %_6810
 ; {>  %_6807~0':(_p1487)◂((_p1495)◂(_stg)) %_6809~2':_p1545 %_6808~1':(_p1505)◂(_stg) }
; _some 2' ⊢ °0◂2'
; _some { %_6807 %_6808 %_6810 } ⊢ %_6811 : %_6811
 ; {>  %_6807~0':(_p1487)◂((_p1495)◂(_stg)) %_6808~1':(_p1505)◂(_stg) %_6810~°0◂2':(_opn)◂(_p1545) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_6811
 ; {>  %_6811~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) (_opn)◂(_p1545) }) }
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
	jc LB_9780
	btr r12,4
	jmp LB_9781
LB_9780:
	bts r12,4
LB_9781:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9778
	btr QWORD [rdi],0
	jmp LB_9779
LB_9778:
	bts QWORD [rdi],0
LB_9779:
	mov r10,r14
	bt r12,1
	jc LB_9784
	btr r12,4
	jmp LB_9785
LB_9784:
	bts r12,4
LB_9785:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9782
	btr QWORD [rdi],1
	jmp LB_9783
LB_9782:
	bts QWORD [rdi],1
LB_9783:
	mov r10,r8
	bt r12,2
	jc LB_9790
	btr r12,4
	jmp LB_9791
LB_9790:
	bts r12,4
LB_9791:
	mov rsi,1
	bt r12,4
	jc LB_9788
	mov rsi,0
	bt r10,0
	jc LB_9788
	jmp LB_9789
LB_9788:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_9789:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_9786
	btr QWORD [rdi],2
	jmp LB_9787
LB_9786:
	bts QWORD [rdi],2
LB_9787:
	mov r8,0
	bts r12,2
	ret
LB_9792:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9794
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9793
LB_9794:
	add rsp,8
	ret
LB_9796:
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
LB_9795:
	add rsp,80
	pop r14
LB_9793:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_9895
LB_9894:
	add r14,1
LB_9895:
	cmp r14,r10
	jge LB_9896
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9894
	cmp al,10
	jz LB_9894
	cmp al,32
	jz LB_9894
LB_9896:
	add r14,3
	cmp r14,r10
	jg LB_9899
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_9899
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_9899
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_9899
	jmp LB_9900
LB_9899:
	jmp LB_9873
LB_9900:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_9882
LB_9881:
	add r14,1
LB_9882:
	cmp r14,r10
	jge LB_9883
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9881
	cmp al,10
	jz LB_9881
	cmp al,32
	jz LB_9881
LB_9883:
	push r10
	call NS_E_5861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9884
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9885
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9885:
	jmp LB_9874
LB_9884:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_9888
LB_9887:
	add r14,1
LB_9888:
	cmp r14,r10
	jge LB_9889
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9887
	cmp al,10
	jz LB_9887
	cmp al,32
	jz LB_9887
LB_9889:
	push r10
	call NS_E_6487_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9890
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9891
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9891:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9892
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9892:
	jmp LB_9874
LB_9890:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9879
	btr r12,2
	clc
	jmp LB_9880
LB_9879:
	bts r12,2
	stc
LB_9880:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9877
	btr r12,1
	clc
	jmp LB_9878
LB_9877:
	bts r12,1
	stc
LB_9878:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9875
	btr r12,0
	clc
	jmp LB_9876
LB_9875:
	bts r12,0
	stc
LB_9876:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_9870
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_9901
	btr r12,3
	jmp LB_9902
LB_9901:
	bts r12,3
LB_9902:
	mov r14,r8
	bt r12,2
	jc LB_9903
	btr r12,1
	jmp LB_9904
LB_9903:
	bts r12,1
LB_9904:
	mov r8,r13
	bt r12,0
	jc LB_9905
	btr r12,2
	jmp LB_9906
LB_9905:
	bts r12,2
LB_9906:
	mov r13,r9
	bt r12,3
	jc LB_9907
	btr r12,0
	jmp LB_9908
LB_9907:
	bts r12,0
LB_9908:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_6814 : %_6814
 ; {>  %_6813~1':(_p1505)◂(_stg) %_6812~0':(_p1487)◂((_p1495)◂(_stg)) }
; _none {  } ⊢ °1◂{  }
; _some { %_6812 %_6813 %_6814 } ⊢ %_6815 : %_6815
 ; {>  %_6814~°1◂{  }:(_opn)◂(t3206'(0)) %_6813~1':(_p1505)◂(_stg) %_6812~0':(_p1487)◂((_p1495)◂(_stg)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_6815
 ; {>  %_6815~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ (_p1487)◂((_p1495)◂(_stg)) (_p1505)◂(_stg) (_opn)◂(t3209'(0)) }) }
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
	jc LB_9860
	btr r12,2
	jmp LB_9861
LB_9860:
	bts r12,2
LB_9861:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9858
	btr QWORD [rdi],0
	jmp LB_9859
LB_9858:
	bts QWORD [rdi],0
LB_9859:
	mov r8,r14
	bt r12,1
	jc LB_9864
	btr r12,2
	jmp LB_9865
LB_9864:
	bts r12,2
LB_9865:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9862
	btr QWORD [rdi],1
	jmp LB_9863
LB_9862:
	bts QWORD [rdi],1
LB_9863:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_9868
	mov rsi,0
	bt r8,0
	jc LB_9868
	jmp LB_9869
LB_9868:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9869:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_9866
	btr QWORD [rdi],2
	jmp LB_9867
LB_9866:
	bts QWORD [rdi],2
LB_9867:
	mov r8,0
	bts r12,2
	ret
LB_9870:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9872
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9871
LB_9872:
	add rsp,8
	ret
LB_9874:
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
LB_9873:
	add rsp,48
	pop r14
LB_9871:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6507:
NS_E_RDI_6507:
NS_E_6507_ETR_TBL:
NS_E_6507_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_9929
LB_9928:
	add r14,1
LB_9929:
	cmp r14,r10
	jge LB_9930
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9928
	cmp al,10
	jz LB_9928
	cmp al,32
	jz LB_9928
LB_9930:
	add r14,2
	cmp r14,r10
	jg LB_9933
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_9933
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_9933
	jmp LB_9934
LB_9933:
	jmp LB_9916
LB_9934:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_9923
LB_9922:
	add r14,1
LB_9923:
	cmp r14,r10
	jge LB_9924
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9922
	cmp al,10
	jz LB_9922
	cmp al,32
	jz LB_9922
LB_9924:
	push r10
	call NS_E_6508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9925
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9926
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9926:
	jmp LB_9917
LB_9925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9920
	btr r12,1
	clc
	jmp LB_9921
LB_9920:
	bts r12,1
	stc
LB_9921:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9918
	btr r12,0
	clc
	jmp LB_9919
LB_9918:
	bts r12,0
	stc
LB_9919:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9913
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9935
	btr r12,2
	jmp LB_9936
LB_9935:
	bts r12,2
LB_9936:
	mov r13,r14
	bt r12,1
	jc LB_9937
	btr r12,0
	jmp LB_9938
LB_9937:
	bts r12,0
LB_9938:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1574 %_6816 ⊢ %_6817 : %_6817
 ; {>  %_6816~0':_p1548 }
; _f1574 0' ⊢ °0◂0'
; _some %_6817 ⊢ %_6818 : %_6818
 ; {>  %_6817~°0◂0':_p1547 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6818
 ; {>  %_6818~°0◂°0◂0':(_opn)◂(_p1547) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9911
	btr r12,3
	jmp LB_9912
LB_9911:
	bts r12,3
LB_9912:
	mov rsi,1
	bt r12,3
	jc LB_9909
	mov rsi,0
	bt r9,0
	jc LB_9909
	jmp LB_9910
LB_9909:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9910:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9913:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9915
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9914
LB_9915:
	add rsp,8
	ret
LB_9917:
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
LB_9916:
	add rsp,32
	pop r14
LB_9914:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_9958
LB_9957:
	add r14,1
LB_9958:
	cmp r14,r10
	jge LB_9959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9957
	cmp al,10
	jz LB_9957
	cmp al,32
	jz LB_9957
LB_9959:
	push r10
	call NS_E_6509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9960
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9952
LB_9960:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_9963
LB_9962:
	add r14,1
LB_9963:
	cmp r14,r10
	jge LB_9964
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9962
	cmp al,10
	jz LB_9962
	cmp al,32
	jz LB_9962
LB_9964:
	push r10
	call NS_E_6507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9965
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9966
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9966:
	jmp LB_9952
LB_9965:
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
	jc LB_9955
	btr r12,1
	clc
	jmp LB_9956
LB_9955:
	bts r12,1
	stc
LB_9956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9953
	btr r12,0
	clc
	jmp LB_9954
LB_9953:
	bts r12,0
	stc
LB_9954:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9949
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1575 { %_6819 %_6820 } ⊢ %_6821 : %_6821
 ; {>  %_6820~1':_p1547 %_6819~0':_p1549 }
; _f1575 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_6821 ⊢ %_6822 : %_6822
 ; {>  %_6821~°1◂{ 0' 1' }:_p1547 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_6822
 ; {>  %_6822~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1547) }
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
	jc LB_9943
	btr r12,2
	jmp LB_9944
LB_9943:
	bts r12,2
LB_9944:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9941
	btr QWORD [rdi],0
	jmp LB_9942
LB_9941:
	bts QWORD [rdi],0
LB_9942:
	mov r8,r14
	bt r12,1
	jc LB_9947
	btr r12,2
	jmp LB_9948
LB_9947:
	bts r12,2
LB_9948:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9945
	btr QWORD [rdi],1
	jmp LB_9946
LB_9945:
	bts QWORD [rdi],1
LB_9946:
	mov rsi,1
	bt r12,3
	jc LB_9939
	mov rsi,0
	bt r9,0
	jc LB_9939
	jmp LB_9940
LB_9939:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9940:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9949:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9951
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9950
LB_9951:
	add rsp,8
	ret
LB_9952:
	add rsp,32
	pop r14
LB_9950:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_9970
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _f1576 {  } ⊢ %_6823 : %_6823
 ; {>  }
; _f1576 {  } ⊢ °2◂{  }
; _some %_6823 ⊢ %_6824 : %_6824
 ; {>  %_6823~°2◂{  }:_p1547 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_6824
 ; {>  %_6824~°0◂°2◂{  }:(_opn)◂(_p1547) }
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
	jc LB_9968
	mov rsi,0
	bt r9,0
	jc LB_9968
	jmp LB_9969
LB_9968:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9969:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9970:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9972
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9971
LB_9972:
	add rsp,8
	ret
LB_9973:
	add rsp,0
	pop r14
LB_9971:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6508:
NS_E_RDI_6508:
NS_E_6508_ETR_TBL:
NS_E_6508_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_9993
LB_9992:
	add r14,1
LB_9993:
	cmp r14,r10
	jge LB_9994
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9992
	cmp al,10
	jz LB_9992
	cmp al,32
	jz LB_9992
LB_9994:
	push r10
	call NS_E_6509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9995
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9987
LB_9995:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_9998
LB_9997:
	add r14,1
LB_9998:
	cmp r14,r10
	jge LB_9999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9997
	cmp al,10
	jz LB_9997
	cmp al,32
	jz LB_9997
LB_9999:
	push r10
	call NS_E_6508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10000
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10001
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10001:
	jmp LB_9987
LB_10000:
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
	jc LB_9990
	btr r12,1
	clc
	jmp LB_9991
LB_9990:
	bts r12,1
	stc
LB_9991:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9988
	btr r12,0
	clc
	jmp LB_9989
LB_9988:
	bts r12,0
	stc
LB_9989:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9984
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' 1' }
	bts r12,2
	bts r12,3
	bts r12,4
; _f1577 { %_6825 %_6826 } ⊢ %_6827 : %_6827
 ; {>  %_6825~0':_p1549 %_6826~1':_p1548 }
; _f1577 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6827 ⊢ %_6828 : %_6828
 ; {>  %_6827~°0◂{ 0' 1' }:_p1548 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6828
 ; {>  %_6828~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1548) }
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
	jc LB_9978
	btr r12,2
	jmp LB_9979
LB_9978:
	bts r12,2
LB_9979:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9976
	btr QWORD [rdi],0
	jmp LB_9977
LB_9976:
	bts QWORD [rdi],0
LB_9977:
	mov r8,r14
	bt r12,1
	jc LB_9982
	btr r12,2
	jmp LB_9983
LB_9982:
	bts r12,2
LB_9983:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9980
	btr QWORD [rdi],1
	jmp LB_9981
LB_9980:
	bts QWORD [rdi],1
LB_9981:
	mov rsi,1
	bt r12,3
	jc LB_9974
	mov rsi,0
	bt r9,0
	jc LB_9974
	jmp LB_9975
LB_9974:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9975:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9984:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9986
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9985
LB_9986:
	add rsp,8
	ret
LB_9987:
	add rsp,32
	pop r14
LB_9985:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_10005
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _f1578 {  } ⊢ %_6829 : %_6829
 ; {>  }
; _f1578 {  } ⊢ °1◂{  }
; _some %_6829 ⊢ %_6830 : %_6830
 ; {>  %_6829~°1◂{  }:_p1548 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6830
 ; {>  %_6830~°0◂°1◂{  }:(_opn)◂(_p1548) }
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
	jc LB_10003
	mov rsi,0
	bt r9,0
	jc LB_10003
	jmp LB_10004
LB_10003:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10004:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10005:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10007
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10006
LB_10007:
	add rsp,8
	ret
LB_10008:
	add rsp,0
	pop r14
LB_10006:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6509:
NS_E_RDI_6509:
NS_E_6509_ETR_TBL:
NS_E_6509_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_10024
LB_10023:
	add r14,1
LB_10024:
	cmp r14,r10
	jge LB_10025
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10023
	cmp al,10
	jz LB_10023
	cmp al,32
	jz LB_10023
LB_10025:
	add r14,3
	cmp r14,r10
	jg LB_10028
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_10028
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_10028
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_10028
	jmp LB_10029
LB_10028:
	jmp LB_10016
LB_10029:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_10031
LB_10030:
	add r14,1
LB_10031:
	cmp r14,r10
	jge LB_10032
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10030
	cmp al,10
	jz LB_10030
	cmp al,32
	jz LB_10030
LB_10032:
	push r10
	call NS_E_6510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10033
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10034
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10034:
	jmp LB_10016
LB_10033:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_10037
LB_10036:
	add r14,1
LB_10037:
	cmp r14,r10
	jge LB_10038
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10036
	cmp al,10
	jz LB_10036
	cmp al,32
	jz LB_10036
LB_10038:
	add r14,3
	cmp r14,r10
	jg LB_10043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_10043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_10043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_10043
	jmp LB_10044
LB_10043:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10040
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10040:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10041
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10041:
	jmp LB_10016
LB_10044:
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
	jc LB_10021
	btr r12,2
	clc
	jmp LB_10022
LB_10021:
	bts r12,2
	stc
LB_10022:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10019
	btr r12,1
	clc
	jmp LB_10020
LB_10019:
	bts r12,1
	stc
LB_10020:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10017
	btr r12,0
	clc
	jmp LB_10018
LB_10017:
	bts r12,0
	stc
LB_10018:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_10013
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov rcx,r13
	bt r12,0
	jc LB_10045
	btr r12,6
	jmp LB_10046
LB_10045:
	bts r12,6
LB_10046:
	mov r13,r14
	bt r12,1
	jc LB_10047
	btr r12,0
	jmp LB_10048
LB_10047:
	bts r12,0
LB_10048:
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
; _f1579 %_6831 ⊢ %_6832 : %_6832
 ; {>  %_6831~0':_p1550 }
; _f1579 0' ⊢ °0◂0'
; _some %_6832 ⊢ %_6833 : %_6833
 ; {>  %_6832~°0◂0':_p1549 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6833
 ; {>  %_6833~°0◂°0◂0':(_opn)◂(_p1549) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10011
	btr r12,3
	jmp LB_10012
LB_10011:
	bts r12,3
LB_10012:
	mov rsi,1
	bt r12,3
	jc LB_10009
	mov rsi,0
	bt r9,0
	jc LB_10009
	jmp LB_10010
LB_10009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10010:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10013:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10015
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10014
LB_10015:
	add rsp,8
	ret
LB_10016:
	add rsp,48
	pop r14
LB_10014:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_10060
LB_10059:
	add r14,1
LB_10060:
	cmp r14,r10
	jge LB_10061
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10059
	cmp al,10
	jz LB_10059
	cmp al,32
	jz LB_10059
LB_10061:
	push r10
	call NS_E_6510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10062
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10056
LB_10062:
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
	jc LB_10057
	btr r12,0
	clc
	jmp LB_10058
LB_10057:
	bts r12,0
	stc
LB_10058:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10053
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1580 %_6834 ⊢ %_6835 : %_6835
 ; {>  %_6834~0':_p1550 }
; _f1580 0' ⊢ °1◂0'
; _some %_6835 ⊢ %_6836 : %_6836
 ; {>  %_6835~°1◂0':_p1549 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6836
 ; {>  %_6836~°0◂°1◂0':(_opn)◂(_p1549) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10051
	btr r12,3
	jmp LB_10052
LB_10051:
	bts r12,3
LB_10052:
	mov rsi,1
	bt r12,3
	jc LB_10049
	mov rsi,0
	bt r9,0
	jc LB_10049
	jmp LB_10050
LB_10049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10050:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10053:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10055
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10054
LB_10055:
	add rsp,8
	ret
LB_10056:
	add rsp,16
	pop r14
LB_10054:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6510:
NS_E_RDI_6510:
NS_E_6510_ETR_TBL:
NS_E_6510_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_10075
LB_10074:
	add r14,1
LB_10075:
	cmp r14,r10
	jge LB_10076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10074
	cmp al,10
	jz LB_10074
	cmp al,32
	jz LB_10074
LB_10076:
	push r10
	call NS_E_893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10077
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10071
LB_10077:
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
	jc LB_10072
	btr r12,0
	clc
	jmp LB_10073
LB_10072:
	bts r12,0
	stc
LB_10073:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10068
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1582 %_6837 ⊢ %_6838 : %_6838
 ; {>  %_6837~0':_stg }
; _f1582 0' ⊢ °1◂0'
; _some %_6838 ⊢ %_6839 : %_6839
 ; {>  %_6838~°1◂0':_p1550 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6839
 ; {>  %_6839~°0◂°1◂0':(_opn)◂(_p1550) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10066
	btr r12,3
	jmp LB_10067
LB_10066:
	bts r12,3
LB_10067:
	mov rsi,1
	bt r12,3
	jc LB_10064
	mov rsi,0
	bt r9,0
	jc LB_10064
	jmp LB_10065
LB_10064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10065:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10068:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10070
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10069
LB_10070:
	add rsp,8
	ret
LB_10071:
	add rsp,16
	pop r14
LB_10069:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_10090
LB_10089:
	add r14,1
LB_10090:
	cmp r14,r10
	jge LB_10091
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10089
	cmp al,10
	jz LB_10089
	cmp al,32
	jz LB_10089
LB_10091:
	push r10
	call NS_E_5077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10092
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10086
LB_10092:
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
	jc LB_10087
	btr r12,0
	clc
	jmp LB_10088
LB_10087:
	bts r12,0
	stc
LB_10088:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10083
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { 0' }
	bts r12,1
	bts r12,2
	bts r12,3
; _f1581 %_6840 ⊢ %_6841 : %_6841
 ; {>  %_6840~0':_p1442 }
; _f1581 0' ⊢ °0◂0'
; _some %_6841 ⊢ %_6842 : %_6842
 ; {>  %_6841~°0◂0':_p1550 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6842
 ; {>  %_6842~°0◂°0◂0':(_opn)◂(_p1550) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10081
	btr r12,3
	jmp LB_10082
LB_10081:
	bts r12,3
LB_10082:
	mov rsi,1
	bt r12,3
	jc LB_10079
	mov rsi,0
	bt r9,0
	jc LB_10079
	jmp LB_10080
LB_10079:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10080:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10083:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10085
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10084
LB_10085:
	add rsp,8
	ret
LB_10086:
	add rsp,16
	pop r14
LB_10084:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6511:
NS_E_RDI_6511:
NS_E_6511_ETR_TBL:
NS_E_6511_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_10103
LB_10102:
	add r14,1
LB_10103:
	cmp r14,r10
	jge LB_10104
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10102
	cmp al,10
	jz LB_10102
	cmp al,32
	jz LB_10102
LB_10104:
	add r14,4
	cmp r14,r10
	jg LB_10107
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_10107
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_10107
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_10107
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_10107
	jmp LB_10108
LB_10107:
	jmp LB_10099
LB_10108:
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
	jc LB_10100
	btr r12,0
	clc
	jmp LB_10101
LB_10100:
	bts r12,0
	stc
LB_10101:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10096
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1572 {  } ⊢ %_6843 : %_6843
 ; {>  }
; _f1572 {  } ⊢ °1◂{  }
; _some %_6843 ⊢ %_6844 : %_6844
 ; {>  %_6843~°1◂{  }:_p1546 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6844
 ; {>  %_6844~°0◂°1◂{  }:(_opn)◂(_p1546) }
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
	jc LB_10094
	mov rsi,0
	bt r9,0
	jc LB_10094
	jmp LB_10095
LB_10094:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10095:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10096:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10098
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10097
LB_10098:
	add rsp,8
	ret
LB_10099:
	add rsp,16
	pop r14
LB_10097:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_10118
LB_10117:
	add r14,1
LB_10118:
	cmp r14,r10
	jge LB_10119
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10117
	cmp al,10
	jz LB_10117
	cmp al,32
	jz LB_10117
LB_10119:
	add r14,4
	cmp r14,r10
	jg LB_10122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_10122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_10122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_10122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_10122
	jmp LB_10123
LB_10122:
	jmp LB_10114
LB_10123:
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
	jc LB_10115
	btr r12,0
	clc
	jmp LB_10116
LB_10115:
	bts r12,0
	stc
LB_10116:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10111
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1573 {  } ⊢ %_6845 : %_6845
 ; {>  }
; _f1573 {  } ⊢ °2◂{  }
; _some %_6845 ⊢ %_6846 : %_6846
 ; {>  %_6845~°2◂{  }:_p1546 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_6846
 ; {>  %_6846~°0◂°2◂{  }:(_opn)◂(_p1546) }
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
	jc LB_10109
	mov rsi,0
	bt r9,0
	jc LB_10109
	jmp LB_10110
LB_10109:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10110:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10111:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10113
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10112
LB_10113:
	add rsp,8
	ret
LB_10114:
	add rsp,16
	pop r14
LB_10112:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_10133
LB_10132:
	add r14,1
LB_10133:
	cmp r14,r10
	jge LB_10134
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10132
	cmp al,10
	jz LB_10132
	cmp al,32
	jz LB_10132
LB_10134:
	add r14,3
	cmp r14,r10
	jg LB_10137
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_10137
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_10137
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_10137
	jmp LB_10138
LB_10137:
	jmp LB_10129
LB_10138:
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
	jc LB_10130
	btr r12,0
	clc
	jmp LB_10131
LB_10130:
	bts r12,0
	stc
LB_10131:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10126
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1571 {  } ⊢ %_6847 : %_6847
 ; {>  }
; _f1571 {  } ⊢ °0◂{  }
; _some %_6847 ⊢ %_6848 : %_6848
 ; {>  %_6847~°0◂{  }:_p1546 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6848
 ; {>  %_6848~°0◂°0◂{  }:(_opn)◂(_p1546) }
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
	jc LB_10124
	mov rsi,0
	bt r9,0
	jc LB_10124
	jmp LB_10125
LB_10124:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10125:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10126:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10128
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10127
LB_10128:
	add rsp,8
	ret
LB_10129:
	add rsp,16
	pop r14
LB_10127:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6512:
NS_E_RDI_6512:
NS_E_6512_ETR_TBL:
NS_E_6512_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_10148
LB_10147:
	add r14,1
LB_10148:
	cmp r14,r10
	jge LB_10149
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10147
	cmp al,10
	jz LB_10147
	cmp al,32
	jz LB_10147
LB_10149:
	add r14,5
	cmp r14,r10
	jg LB_10152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_10152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_10152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_10152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_10152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_10152
	jmp LB_10153
LB_10152:
	jmp LB_10144
LB_10153:
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
	jc LB_10145
	btr r12,0
	clc
	jmp LB_10146
LB_10145:
	bts r12,0
	stc
LB_10146:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10141
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1572 {  } ⊢ %_6849 : %_6849
 ; {>  }
; _f1572 {  } ⊢ °1◂{  }
; _some %_6849 ⊢ %_6850 : %_6850
 ; {>  %_6849~°1◂{  }:_p1546 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6850
 ; {>  %_6850~°0◂°1◂{  }:(_opn)◂(_p1546) }
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
	jc LB_10139
	mov rsi,0
	bt r9,0
	jc LB_10139
	jmp LB_10140
LB_10139:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10140:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10141:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10143
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10142
LB_10143:
	add rsp,8
	ret
LB_10144:
	add rsp,16
	pop r14
LB_10142:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_10163
LB_10162:
	add r14,1
LB_10163:
	cmp r14,r10
	jge LB_10164
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10162
	cmp al,10
	jz LB_10162
	cmp al,32
	jz LB_10162
LB_10164:
	add r14,5
	cmp r14,r10
	jg LB_10167
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_10167
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_10167
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_10167
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_10167
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_10167
	jmp LB_10168
LB_10167:
	jmp LB_10159
LB_10168:
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
	jc LB_10160
	btr r12,0
	clc
	jmp LB_10161
LB_10160:
	bts r12,0
	stc
LB_10161:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10156
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1573 {  } ⊢ %_6851 : %_6851
 ; {>  }
; _f1573 {  } ⊢ °2◂{  }
; _some %_6851 ⊢ %_6852 : %_6852
 ; {>  %_6851~°2◂{  }:_p1546 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_6852
 ; {>  %_6852~°0◂°2◂{  }:(_opn)◂(_p1546) }
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
	jc LB_10154
	mov rsi,0
	bt r9,0
	jc LB_10154
	jmp LB_10155
LB_10154:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10155:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10156:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10158
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10157
LB_10158:
	add rsp,8
	ret
LB_10159:
	add rsp,16
	pop r14
LB_10157:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_10178
LB_10177:
	add r14,1
LB_10178:
	cmp r14,r10
	jge LB_10179
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10177
	cmp al,10
	jz LB_10177
	cmp al,32
	jz LB_10177
LB_10179:
	add r14,4
	cmp r14,r10
	jg LB_10182
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_10182
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_10182
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_10182
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_10182
	jmp LB_10183
LB_10182:
	jmp LB_10174
LB_10183:
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
	jc LB_10175
	btr r12,0
	clc
	jmp LB_10176
LB_10175:
	bts r12,0
	stc
LB_10176:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10171
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,1
	bts r12,2
	bts r12,3
; _f1571 {  } ⊢ %_6853 : %_6853
 ; {>  }
; _f1571 {  } ⊢ °0◂{  }
; _some %_6853 ⊢ %_6854 : %_6854
 ; {>  %_6853~°0◂{  }:_p1546 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6854
 ; {>  %_6854~°0◂°0◂{  }:(_opn)◂(_p1546) }
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
	jc LB_10169
	mov rsi,0
	bt r9,0
	jc LB_10169
	jmp LB_10170
LB_10169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10170:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10171:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10173
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10172
LB_10173:
	add rsp,8
	ret
LB_10174:
	add rsp,16
	pop r14
LB_10172:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6513:
NS_E_RDI_6513:
NS_E_6513_ETR_TBL:
NS_E_6513_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_10239
LB_10238:
	add r14,1
LB_10239:
	cmp r14,r10
	jge LB_10240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10238
	cmp al,10
	jz LB_10238
	cmp al,32
	jz LB_10238
LB_10240:
	push r10
	call NS_E_6512_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10241
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10207
LB_10241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_10218
LB_10217:
	add r14,1
LB_10218:
	cmp r14,r10
	jge LB_10219
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10217
	cmp al,10
	jz LB_10217
	cmp al,32
	jz LB_10217
LB_10219:
	push r10
	call NS_E_6515_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10220
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10221
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10221:
	jmp LB_10208
LB_10220:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_10224
LB_10223:
	add r14,1
LB_10224:
	cmp r14,r10
	jge LB_10225
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10223
	cmp al,10
	jz LB_10223
	cmp al,32
	jz LB_10223
LB_10225:
	push r10
	call NS_E_6507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10226
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10227
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10227:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10228
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10228:
	jmp LB_10208
LB_10226:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_10231
LB_10230:
	add r14,1
LB_10231:
	cmp r14,r10
	jge LB_10232
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10230
	cmp al,10
	jz LB_10230
	cmp al,32
	jz LB_10230
LB_10232:
	push r10
	call NS_E_6514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10233
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10234
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10234:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10235
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10235:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10236
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10236:
	jmp LB_10208
LB_10233:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10215
	btr r12,3
	clc
	jmp LB_10216
LB_10215:
	bts r12,3
	stc
LB_10216:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10213
	btr r12,2
	clc
	jmp LB_10214
LB_10213:
	bts r12,2
	stc
LB_10214:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10211
	btr r12,1
	clc
	jmp LB_10212
LB_10211:
	bts r12,1
	stc
LB_10212:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10209
	btr r12,0
	clc
	jmp LB_10210
LB_10209:
	bts r12,0
	stc
LB_10210:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_10204
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f1568 { %_6856 %_6855 %_6857 %_6858 } ⊢ %_6859 : %_6859
 ; {>  %_6858~3':(_opn)◂(_p1544) %_6857~2':_p1547 %_6856~1':(_opn)◂(_stg) %_6855~0':_p1546 }
; _f1568 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_6859 ⊢ %_6860 : %_6860
 ; {>  %_6859~°1◂{ 1' 0' 2' 3' }:_p1544 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_6860
 ; {>  %_6860~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p1544) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_10184
	btr r12,4
	jmp LB_10185
LB_10184:
	bts r12,4
LB_10185:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_10190
	btr r12,5
	jmp LB_10191
LB_10190:
	bts r12,5
LB_10191:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_10188
	btr QWORD [rdi],0
	jmp LB_10189
LB_10188:
	bts QWORD [rdi],0
LB_10189:
	mov r11,r13
	bt r12,0
	jc LB_10194
	btr r12,5
	jmp LB_10195
LB_10194:
	bts r12,5
LB_10195:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_10192
	btr QWORD [rdi],1
	jmp LB_10193
LB_10192:
	bts QWORD [rdi],1
LB_10193:
	mov r11,r8
	bt r12,2
	jc LB_10198
	btr r12,5
	jmp LB_10199
LB_10198:
	bts r12,5
LB_10199:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_10196
	btr QWORD [rdi],2
	jmp LB_10197
LB_10196:
	bts QWORD [rdi],2
LB_10197:
	mov r11,r10
	bt r12,4
	jc LB_10202
	btr r12,5
	jmp LB_10203
LB_10202:
	bts r12,5
LB_10203:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,5
	jc LB_10200
	btr QWORD [rdi],3
	jmp LB_10201
LB_10200:
	bts QWORD [rdi],3
LB_10201:
	mov rsi,1
	bt r12,3
	jc LB_10186
	mov rsi,0
	bt r9,0
	jc LB_10186
	jmp LB_10187
LB_10186:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10187:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10204:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10206
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10205
LB_10206:
	add rsp,8
	ret
LB_10208:
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
LB_10207:
	add rsp,64
	pop r14
LB_10205:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_10282
LB_10281:
	add r14,1
LB_10282:
	cmp r14,r10
	jge LB_10283
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10281
	cmp al,10
	jz LB_10281
	cmp al,32
	jz LB_10281
LB_10283:
	push r10
	call NS_E_6511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10284
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10270
LB_10284:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_10287
LB_10286:
	add r14,1
LB_10287:
	cmp r14,r10
	jge LB_10288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10286
	cmp al,10
	jz LB_10286
	cmp al,32
	jz LB_10286
LB_10288:
	push r10
	call NS_E_6515_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10289
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10290
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10290:
	jmp LB_10270
LB_10289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_10293
LB_10292:
	add r14,1
LB_10293:
	cmp r14,r10
	jge LB_10294
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10292
	cmp al,10
	jz LB_10292
	cmp al,32
	jz LB_10292
LB_10294:
	push r10
	call NS_E_6507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10295
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10296
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10296:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10297
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10297:
	jmp LB_10270
LB_10295:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_10300
LB_10299:
	add r14,1
LB_10300:
	cmp r14,r10
	jge LB_10301
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10299
	cmp al,10
	jz LB_10299
	cmp al,32
	jz LB_10299
LB_10301:
	push r10
	call NS_E_6514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10302
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10303
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10303:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10304
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10304:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10305
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10305:
	jmp LB_10270
LB_10302:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_10308
LB_10307:
	add r14,1
LB_10308:
	cmp r14,r10
	jge LB_10309
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10307
	cmp al,10
	jz LB_10307
	cmp al,32
	jz LB_10307
LB_10309:
	push r10
	call NS_E_6513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10310
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_10311
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_10311:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10312
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10312:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10313
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10313:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10314
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10314:
	jmp LB_10270
LB_10310:
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
	jc LB_10279
	btr r12,4
	clc
	jmp LB_10280
LB_10279:
	bts r12,4
	stc
LB_10280:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10277
	btr r12,3
	clc
	jmp LB_10278
LB_10277:
	bts r12,3
	stc
LB_10278:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10275
	btr r12,2
	clc
	jmp LB_10276
LB_10275:
	bts r12,2
	stc
LB_10276:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10273
	btr r12,1
	clc
	jmp LB_10274
LB_10273:
	bts r12,1
	stc
LB_10274:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10271
	btr r12,0
	clc
	jmp LB_10272
LB_10271:
	bts r12,0
	stc
LB_10272:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_10267
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
	bts r12,5
	bts r12,6
	bts r12,7
; _f1567 { %_6862 %_6861 %_6863 %_6864 %_6865 } ⊢ %_6866 : %_6866
 ; {>  %_6865~4':_p1544 %_6863~2':_p1547 %_6861~0':_p1546 %_6862~1':(_opn)◂(_stg) %_6864~3':(_opn)◂(_p1544) }
; _f1567 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_6866 ⊢ %_6867 : %_6867
 ; {>  %_6866~°0◂{ 1' 0' 2' 3' 4' }:_p1544 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_6867
 ; {>  %_6867~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p1544) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_10243
	btr r12,5
	jmp LB_10244
LB_10243:
	bts r12,5
LB_10244:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_10249
	btr r12,6
	jmp LB_10250
LB_10249:
	bts r12,6
LB_10250:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_10247
	btr QWORD [rdi],0
	jmp LB_10248
LB_10247:
	bts QWORD [rdi],0
LB_10248:
	mov rcx,r13
	bt r12,0
	jc LB_10253
	btr r12,6
	jmp LB_10254
LB_10253:
	bts r12,6
LB_10254:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_10251
	btr QWORD [rdi],1
	jmp LB_10252
LB_10251:
	bts QWORD [rdi],1
LB_10252:
	mov rcx,r8
	bt r12,2
	jc LB_10257
	btr r12,6
	jmp LB_10258
LB_10257:
	bts r12,6
LB_10258:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_10255
	btr QWORD [rdi],2
	jmp LB_10256
LB_10255:
	bts QWORD [rdi],2
LB_10256:
	mov rcx,r11
	bt r12,5
	jc LB_10261
	btr r12,6
	jmp LB_10262
LB_10261:
	bts r12,6
LB_10262:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_10259
	btr QWORD [rdi],3
	jmp LB_10260
LB_10259:
	bts QWORD [rdi],3
LB_10260:
	mov rcx,r10
	bt r12,4
	jc LB_10265
	btr r12,6
	jmp LB_10266
LB_10265:
	bts r12,6
LB_10266:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_10263
	btr QWORD [rdi],4
	jmp LB_10264
LB_10263:
	bts QWORD [rdi],4
LB_10264:
	mov rsi,1
	bt r12,3
	jc LB_10245
	mov rsi,0
	bt r9,0
	jc LB_10245
	jmp LB_10246
LB_10245:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10246:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10267:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10269
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10268
LB_10269:
	add rsp,8
	ret
LB_10270:
	add rsp,80
	pop r14
LB_10268:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6514:
NS_E_RDI_6514:
NS_E_6514_ETR_TBL:
NS_E_6514_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_10329
LB_10328:
	add r14,1
LB_10329:
	cmp r14,r10
	jge LB_10330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10328
	cmp al,10
	jz LB_10328
	cmp al,32
	jz LB_10328
LB_10330:
	add r14,1
	cmp r14,r10
	jg LB_10333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_10333
	jmp LB_10334
LB_10333:
	jmp LB_10323
LB_10334:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_10336
LB_10335:
	add r14,1
LB_10336:
	cmp r14,r10
	jge LB_10337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10335
	cmp al,10
	jz LB_10335
	cmp al,32
	jz LB_10335
LB_10337:
	push r10
	call NS_E_6513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10338
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10339
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10339:
	jmp LB_10323
LB_10338:
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
	jc LB_10326
	btr r12,1
	clc
	jmp LB_10327
LB_10326:
	bts r12,1
	stc
LB_10327:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10324
	btr r12,0
	clc
	jmp LB_10325
LB_10324:
	bts r12,0
	stc
LB_10325:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_10320
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r11,r13
	bt r12,0
	jc LB_10341
	btr r12,5
	jmp LB_10342
LB_10341:
	bts r12,5
LB_10342:
	mov r13,r14
	bt r12,1
	jc LB_10343
	btr r12,0
	jmp LB_10344
LB_10343:
	bts r12,0
LB_10344:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_6868 ⊢ %_6869 : %_6869
 ; {>  %_6868~0':_p1544 }
; _some 0' ⊢ °0◂0'
; _some %_6869 ⊢ %_6870 : %_6870
 ; {>  %_6869~°0◂0':(_opn)◂(_p1544) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6870
 ; {>  %_6870~°0◂°0◂0':(_opn)◂((_opn)◂(_p1544)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10318
	btr r12,3
	jmp LB_10319
LB_10318:
	bts r12,3
LB_10319:
	mov rsi,1
	bt r12,3
	jc LB_10316
	mov rsi,0
	bt r9,0
	jc LB_10316
	jmp LB_10317
LB_10316:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10317:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10320:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10322
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10321
LB_10322:
	add rsp,8
	ret
LB_10323:
	add rsp,32
	pop r14
LB_10321:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_10347
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_6871 : %_6871
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_6871 ⊢ %_6872 : %_6872
 ; {>  %_6871~°1◂{  }:(_opn)◂(t3287'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6872
 ; {>  %_6872~°0◂°1◂{  }:(_opn)◂((_opn)◂(t3290'(0))) }
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
	jc LB_10345
	mov rsi,0
	bt r9,0
	jc LB_10345
	jmp LB_10346
LB_10345:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10346:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10347:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10349
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10348
LB_10349:
	add rsp,8
	ret
LB_10350:
	add rsp,0
	pop r14
LB_10348:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6515:
NS_E_RDI_6515:
NS_E_6515_ETR_TBL:
NS_E_6515_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_10364
LB_10363:
	add r14,1
LB_10364:
	cmp r14,r10
	jge LB_10365
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10363
	cmp al,10
	jz LB_10363
	cmp al,32
	jz LB_10363
LB_10365:
	push r10
	call NS_E_1267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10366
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10358
LB_10366:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_10369
LB_10368:
	add r14,1
LB_10369:
	cmp r14,r10
	jge LB_10370
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10368
	cmp al,10
	jz LB_10368
	cmp al,32
	jz LB_10368
LB_10370:
	add r14,1
	cmp r14,r10
	jg LB_10374
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_10374
	jmp LB_10375
LB_10374:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10372
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10372:
	jmp LB_10358
LB_10375:
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
	jc LB_10361
	btr r12,1
	clc
	jmp LB_10362
LB_10361:
	bts r12,1
	stc
LB_10362:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10359
	btr r12,0
	clc
	jmp LB_10360
LB_10359:
	bts r12,0
	stc
LB_10360:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_10355
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	bts r12,2
	bts r12,3
	bts r12,4
; _some %_6873 ⊢ %_6874 : %_6874
 ; {>  %_6873~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_6874 ⊢ %_6875 : %_6875
 ; {>  %_6874~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6875
 ; {>  %_6875~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10353
	btr r12,3
	jmp LB_10354
LB_10353:
	bts r12,3
LB_10354:
	mov rsi,1
	bt r12,3
	jc LB_10351
	mov rsi,0
	bt r9,0
	jc LB_10351
	jmp LB_10352
LB_10351:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10352:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10355:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10357
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10356
LB_10357:
	add rsp,8
	ret
LB_10358:
	add rsp,32
	pop r14
LB_10356:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	mov r13,rsi
	add rsp,0
	push rdi
	push rsi
	push LB_10378
; _emt_mov_ptn_to_ptn:{| 1110.. |},{  } ⊢ {  }
	bts r12,0
	bts r12,1
	bts r12,2
; _none {  } ⊢ %_6876 : %_6876
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_6876 ⊢ %_6877 : %_6877
 ; {>  %_6876~°1◂{  }:(_opn)◂(t3299'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6877
 ; {>  %_6877~°0◂°1◂{  }:(_opn)◂((_opn)◂(t3302'(0))) }
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
	jc LB_10376
	mov rsi,0
	bt r9,0
	jc LB_10376
	jmp LB_10377
LB_10376:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10377:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10378:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10380
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10379
LB_10380:
	add rsp,8
	ret
LB_10381:
	add rsp,0
	pop r14
LB_10379:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_10440:
; 	|» { 0' 1' 2' }
NS_E_RDI_10440:
MTC_LB_10441:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10442
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
	jnc LB_10443
	bt QWORD [rdi],0
	jc LB_10444
	btr r12,5
	clc
	jmp LB_10445
LB_10444:
	bts r12,5
	stc
LB_10445:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10443:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10448
	btr r12,6
	clc
	jmp LB_10449
LB_10448:
	bts r12,6
	stc
LB_10449:
	mov r9,rcx
	bt r12,6
	jc LB_10446
	btr r12,3
	jmp LB_10447
LB_10446:
	bts r12,3
LB_10447:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10452
	btr r12,6
	clc
	jmp LB_10453
LB_10452:
	bts r12,6
	stc
LB_10453:
	mov r10,rcx
	bt r12,6
	jc LB_10450
	btr r12,4
	jmp LB_10451
LB_10450:
	bts r12,4
LB_10451:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10454:
	cmp r15,0
	jz LB_10455
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10454
LB_10455:
; _f10426 { %_10427 %_10428 %_10430 } ⊢ { %_10432 %_10433 %_10434 } : { %_10432 %_10433 %_10434 }
 ; {>  %_10427~0':_r64 %_10428~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10430~3':(_p1487)◂((_p1495)◂(t4008'(-1))) %_10431~4':(_lst)◂((_p1487)◂((_p1495)◂(t4008'(-1)))) }
; _f10426 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_10458
	btr r12,2
	jmp LB_10459
LB_10458:
	bts r12,2
LB_10459:
	call NS_E_10426
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_10456
	btr r12,4
	clc
	jmp LB_10457
LB_10456:
	bts r12,4
	stc
LB_10457:
	add rsp,16
; _f10440 { %_10432 %_10433 %_10431 } ⊢ { %_10435 %_10436 %_10437 } : { %_10435 %_10436 %_10437 }
 ; {>  %_10434~2':(_p1487)◂((_p1495)◂(_r64)) %_10432~0':_r64 %_10433~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10431~4':(_lst)◂((_p1487)◂((_p1495)◂(t4008'(-1)))) }
; _f10440 { 0' 1' 4' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110010.. |},{ 0' 1' 4' } ⊢ { 0' 1' 2' }
	mov r8,r10
	bt r12,4
	jc LB_10462
	btr r12,2
	jmp LB_10463
LB_10462:
	bts r12,2
LB_10463:
	call NS_E_10440
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 3' }
	mov r9,r8
	bt r12,2
	jc LB_10464
	btr r12,3
	jmp LB_10465
LB_10464:
	bts r12,3
LB_10465:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10460
	btr r12,2
	clc
	jmp LB_10461
LB_10460:
	bts r12,2
	stc
LB_10461:
	add rsp,16
; _cns { %_10434 %_10437 } ⊢ %_10438 : %_10438
 ; {>  %_10434~2':(_p1487)◂((_p1495)◂(_r64)) %_10437~3':(_lst)◂((_p1487)◂((_p1495)◂(_r64))) %_10436~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10435~0':_r64 }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; ∎ { %_10435 %_10436 %_10438 }
 ; {>  %_10438~°0◂{ 2' 3' }:(_lst)◂((_p1487)◂((_p1495)◂(_r64))) %_10436~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10435~0':_r64 }
; 	∎ { 0' 1' °0◂{ 2' 3' } }
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' °0◂{ 2' 3' } } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_10466
	btr r12,4
	jmp LB_10467
LB_10466:
	bts r12,4
LB_10467:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r10
	bt r12,4
	jc LB_10472
	btr r12,5
	jmp LB_10473
LB_10472:
	bts r12,5
LB_10473:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_10470
	btr QWORD [rdi],0
	jmp LB_10471
LB_10470:
	bts QWORD [rdi],0
LB_10471:
	mov r11,r9
	bt r12,3
	jc LB_10476
	btr r12,5
	jmp LB_10477
LB_10476:
	bts r12,5
LB_10477:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_10474
	btr QWORD [rdi],1
	jmp LB_10475
LB_10474:
	bts QWORD [rdi],1
LB_10475:
	mov rsi,1
	bt r12,2
	jc LB_10468
	mov rsi,0
	bt r8,0
	jc LB_10468
	jmp LB_10469
LB_10468:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10469:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_10442:
	mov r15,0
LB_10479:
	cmp r15,0
	jz LB_10480
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10479
LB_10480:
; _nil {  } ⊢ %_10439 : %_10439
 ; {>  %_10427~0':_r64 %_10428~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10429~2':(_lst)◂((_p1487)◂((_p1495)◂(t4008'(-1)))) }
; _nil {  } ⊢ °1◂{  }
; ∎ { %_10427 %_10428 %_10439 }
 ; {>  %_10439~°1◂{  }:(_lst)◂(t3985'(0)) %_10427~0':_r64 %_10428~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10429~2':(_lst)◂((_p1487)◂((_p1495)◂(t4008'(-1)))) }
; 	∎ { 0' 1' °1◂{  } }
	bt r12,2
	jc LB_10481
	mov rdi,r8
	call dlt
LB_10481:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_10482
	mov rsi,0
	bt r8,0
	jc LB_10482
	jmp LB_10483
LB_10482:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10483:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_10478:
NS_E_10426:
; 	|» { 0' 1' 2' }
NS_E_RDI_10426:
; _f38 { %_10397 %_10398 %_10399 } ⊢ { %_10400 %_10401 %_10402 } : { %_10400 %_10401 %_10402 }
 ; {>  %_10399~2':(_p1487)◂((_p1495)◂(t4008'(-1))) %_10397~0':_r64 %_10398~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) }
; _f38 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_10484
	btr r12,3
	jmp LB_10485
LB_10484:
	bts r12,3
LB_10485:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_10488
	btr r12,4
	jmp LB_10489
LB_10488:
	bts r12,4
LB_10489:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_10486
	btr QWORD [rdi],0
	jmp LB_10487
LB_10486:
	bts QWORD [rdi],0
LB_10487:
	mov r10,r14
	bt r12,1
	jc LB_10492
	btr r12,4
	jmp LB_10493
LB_10492:
	bts r12,4
LB_10493:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10490
	btr QWORD [rdi],1
	jmp LB_10491
LB_10490:
	bts QWORD [rdi],1
LB_10491:
	mov r10,r8
	bt r12,2
	jc LB_10496
	btr r12,4
	jmp LB_10497
LB_10496:
	bts r12,4
LB_10497:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_10494
	btr QWORD [rdi],2
	jmp LB_10495
LB_10494:
	bts QWORD [rdi],2
LB_10495:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_10498
	btr r12,3
	jmp LB_10499
LB_10498:
	bts r12,3
LB_10499:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10502
	btr r12,4
	clc
	jmp LB_10503
LB_10502:
	bts r12,4
	stc
LB_10503:
	mov r13,r10
	bt r12,4
	jc LB_10500
	btr r12,0
	jmp LB_10501
LB_10500:
	bts r12,0
LB_10501:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10506
	btr r12,4
	clc
	jmp LB_10507
LB_10506:
	bts r12,4
	stc
LB_10507:
	mov r14,r10
	bt r12,4
	jc LB_10504
	btr r12,1
	jmp LB_10505
LB_10504:
	bts r12,1
LB_10505:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_10510
	btr r12,4
	clc
	jmp LB_10511
LB_10510:
	bts r12,4
	stc
LB_10511:
	mov r8,r10
	bt r12,4
	jc LB_10508
	btr r12,2
	jmp LB_10509
LB_10508:
	bts r12,2
LB_10509:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_10512:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10513
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
	jnc LB_10514
	bt QWORD [rdi],0
	jc LB_10515
	btr r12,4
	clc
	jmp LB_10516
LB_10515:
	bts r12,4
	stc
LB_10516:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10514:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10517
	btr r12,3
	jmp LB_10518
LB_10517:
	bts r12,3
LB_10518:
LB_10519:
	cmp r15,0
	jz LB_10520
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10519
LB_10520:
; _f10440 { %_10400 %_10401 %_10403 } ⊢ { %_10404 %_10405 %_10406 } : { %_10404 %_10405 %_10406 }
 ; {>  %_10403~3':(_lst)◂((_p1487)◂((_p1495)◂(t4008'(-1)))) %_10401~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10400~0':_r64 }
; _f10440 { 0' 1' 3' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ 0' 1' 3' } ⊢ { 0' 1' 2' }
	mov r8,r9
	bt r12,3
	jc LB_10521
	btr r12,2
	jmp LB_10522
LB_10521:
	bts r12,2
LB_10522:
	call NS_E_10440
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1488 %_10406 ⊢ %_10407 : %_10407
 ; {>  %_10406~2':(_lst)◂((_p1487)◂((_p1495)◂(_r64))) %_10405~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10404~0':_r64 }
; _f1488 2' ⊢ °0◂2'
; ∎ { %_10404 %_10405 %_10407 }
 ; {>  %_10407~°0◂2':(_p1487)◂((_p1495)◂(_r64)) %_10405~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10404~0':_r64 }
; 	∎ { 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' °0◂2' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_10523
	btr r12,3
	jmp LB_10524
LB_10523:
	bts r12,3
LB_10524:
	mov r8,r9
	bt r12,3
	jc LB_10527
	btr r12,2
	jmp LB_10528
LB_10527:
	bts r12,2
LB_10528:
	mov rsi,1
	bt r12,2
	jc LB_10525
	mov rsi,0
	bt r8,0
	jc LB_10525
	jmp LB_10526
LB_10525:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10526:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_10513:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10529
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
	jnc LB_10530
	bt QWORD [rdi],0
	jc LB_10531
	btr r12,4
	clc
	jmp LB_10532
LB_10531:
	bts r12,4
	stc
LB_10532:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10530:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10533
	btr r12,3
	jmp LB_10534
LB_10533:
	bts r12,3
LB_10534:
LB_10535:
	cmp r15,0
	jz LB_10536
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10535
LB_10536:
MTC_LB_10537:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10538
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
	jnc LB_10539
	bt QWORD [rdi],0
	jc LB_10540
	btr r12,4
	clc
	jmp LB_10541
LB_10540:
	bts r12,4
	stc
LB_10541:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10539:
	mov r10,rdi
	mov r8,r10
	bt r12,4
	jc LB_10542
	btr r12,2
	jmp LB_10543
LB_10542:
	bts r12,2
LB_10543:
LB_10544:
	cmp r15,0
	jz LB_10545
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10544
LB_10545:
; _f38 { %_10409 %_10400 } ⊢ { %_10410 %_10411 } : { %_10410 %_10411 }
 ; {>  %_10401~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10400~0':_r64 %_10409~2':t4008'(-1) }
; _f38 { 2' 0' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 2' 0' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_10548
	btr r12,1
	jmp LB_10549
LB_10548:
	bts r12,1
LB_10549:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_10552
	btr r12,3
	jmp LB_10553
LB_10552:
	bts r12,3
LB_10553:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_10550
	btr QWORD [rdi],0
	jmp LB_10551
LB_10550:
	bts QWORD [rdi],0
LB_10551:
	mov r9,r14
	bt r12,1
	jc LB_10556
	btr r12,3
	jmp LB_10557
LB_10556:
	bts r12,3
LB_10557:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_10554
	btr QWORD [rdi],1
	jmp LB_10555
LB_10554:
	bts QWORD [rdi],1
LB_10555:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 2' }
	mov r14,r13
	bt r12,0
	jc LB_10558
	btr r12,1
	jmp LB_10559
LB_10558:
	bts r12,1
LB_10559:
; 1' ⊢ { 0' 2' }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_10562
	btr r12,3
	clc
	jmp LB_10563
LB_10562:
	bts r12,3
	stc
LB_10563:
	mov r13,r9
	bt r12,3
	jc LB_10560
	btr r12,0
	jmp LB_10561
LB_10560:
	bts r12,0
LB_10561:
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_10566
	btr r12,3
	clc
	jmp LB_10567
LB_10566:
	bts r12,3
	stc
LB_10567:
	mov r8,r9
	bt r12,3
	jc LB_10564
	btr r12,2
	jmp LB_10565
LB_10564:
	bts r12,2
LB_10565:
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10546
	btr r12,1
	clc
	jmp LB_10547
LB_10546:
	bts r12,1
	stc
LB_10547:
	add rsp,16
; _f765 { %_10401 %_10410 } ⊢ { %_10412 %_10413 %_10414 } : { %_10412 %_10413 %_10414 }
 ; {>  %_10411~2':_r64 %_10410~0':t4008'(-1) %_10401~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) }
; _f765 { 1' 0' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_10570
	btr r12,2
	jmp LB_10571
LB_10570:
	bts r12,2
LB_10571:
	mov r14,r13
	bt r12,0
	jc LB_10572
	btr r12,1
	jmp LB_10573
LB_10572:
	bts r12,1
LB_10573:
	mov r13,r8
	bt r12,2
	jc LB_10574
	btr r12,0
	jmp LB_10575
LB_10574:
	bts r12,0
LB_10575:
	call NS_E_765
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 3' }
	mov r9,r8
	bt r12,2
	jc LB_10576
	btr r12,3
	jmp LB_10577
LB_10576:
	bts r12,3
LB_10577:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10568
	btr r12,2
	clc
	jmp LB_10569
LB_10568:
	bts r12,2
	stc
LB_10569:
	add rsp,16
MTC_LB_10578:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10579
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
	jnc LB_10580
	bt QWORD [rdi],0
	jc LB_10581
	btr r12,4
	clc
	jmp LB_10582
LB_10581:
	bts r12,4
	stc
LB_10582:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10580:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10583:
	cmp r15,0
	jz LB_10584
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10583
LB_10584:
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ 3'
	mov r9,r8
	bt r12,2
	jc LB_10585
	btr r12,3
	jmp LB_10586
LB_10585:
	bts r12,3
LB_10586:
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_10593
	btr r12,4
	clc
	jmp LB_10594
LB_10593:
	bts r12,4
	stc
LB_10594:
	call dcp
	mov r10,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10591
	btr r12,3
	clc
	jmp LB_10592
LB_10591:
	bts r12,3
	stc
LB_10592:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10589
	btr r12,1
	clc
	jmp LB_10590
LB_10589:
	bts r12,1
	stc
LB_10590:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10587
	btr r12,0
	clc
	jmp LB_10588
LB_10587:
	bts r12,0
	stc
LB_10588:
	add rsp,32
; _some %_10416 ⊢ %_10417 : %_10417
 ; {>  %_10413~1':t4008'(-1) %_10416~4':_r64 %_10415~3':_r64 %_10412~0':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) }
; _some 4' ⊢ °0◂4'
; _cns { { %_10413 %_10417 } %_10412 } ⊢ %_10418 : %_10418
 ; {>  %_10413~1':t4008'(-1) %_10415~3':_r64 %_10417~°0◂4':(_opn)◂(_r64) %_10412~0':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) }
; _cns { { 1' °0◂4' } 0' } ⊢ °0◂{ { 1' °0◂4' } 0' }
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ 2'
	mov r8,r9
	bt r12,3
	jc LB_10595
	btr r12,2
	jmp LB_10596
LB_10595:
	bts r12,2
LB_10596:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r8
	bt r12,2
	jc LB_10605
	btr r12,5
	clc
	jmp LB_10606
LB_10605:
	bts r12,5
	stc
LB_10606:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_10603
	btr r12,4
	clc
	jmp LB_10604
LB_10603:
	bts r12,4
	stc
LB_10604:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10601
	btr r12,2
	clc
	jmp LB_10602
LB_10601:
	bts r12,2
	stc
LB_10602:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10599
	btr r12,1
	clc
	jmp LB_10600
LB_10599:
	bts r12,1
	stc
LB_10600:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10597
	btr r12,0
	clc
	jmp LB_10598
LB_10597:
	bts r12,0
	stc
LB_10598:
	add rsp,40
; _f1499 %_10420 ⊢ %_10421 : %_10421
 ; {>  %_10420~5':_r64 %_10418~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10419~2':_r64 }
; _f1499 5' ⊢ °1◂5'
; _f56 %_10419 ⊢ %_10422 : %_10422
 ; {>  %_10421~°1◂5':(_p1495)◂(_r64) %_10418~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10419~2':_r64 }
	add r8,1
; _f1489 %_10421 ⊢ %_10423 : %_10423
 ; {>  %_10421~°1◂5':(_p1495)◂(_r64) %_10422~2':_r64 %_10418~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) }
; _f1489 °1◂5' ⊢ °1◂°1◂5'
; ∎ { %_10422 %_10418 %_10423 }
 ; {>  %_10422~2':_r64 %_10418~°0◂{ { 1' °0◂4' } 0' }:(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10423~°1◂°1◂5':(_p1487)◂((_p1495)◂(_r64)) }
; 	∎ { 2' °0◂{ { 1' °0◂4' } 0' } °1◂°1◂5' }
; _emt_mov_ptn_to_ptn:{| 1110110.. |},{ 2' °0◂{ { 1' °0◂4' } 0' } °1◂°1◂5' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_10607
	btr r12,3
	jmp LB_10608
LB_10607:
	bts r12,3
LB_10608:
	mov r8,r11
	bt r12,5
	jc LB_10613
	btr r12,2
	jmp LB_10614
LB_10613:
	bts r12,2
LB_10614:
	mov rsi,1
	bt r12,2
	jc LB_10611
	mov rsi,0
	bt r8,0
	jc LB_10611
	jmp LB_10612
LB_10611:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10612:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_10609
	mov rsi,0
	bt r8,0
	jc LB_10609
	jmp LB_10610
LB_10609:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10610:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov r11,r14
	bt r12,1
	jc LB_10615
	btr r12,5
	jmp LB_10616
LB_10615:
	bts r12,5
LB_10616:
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
	jc LB_10623
	btr r12,7
	jmp LB_10624
LB_10623:
	bts r12,7
LB_10624:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_10621
	btr QWORD [rdi],0
	jmp LB_10622
LB_10621:
	bts QWORD [rdi],0
LB_10622:
	mov rdx,r10
	bt r12,4
	jc LB_10629
	btr r12,7
	jmp LB_10630
LB_10629:
	bts r12,7
LB_10630:
	mov rsi,1
	bt r12,7
	jc LB_10627
	mov rsi,0
	bt rdx,0
	jc LB_10627
	jmp LB_10628
LB_10627:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_10628:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_10625
	btr QWORD [rdi],1
	jmp LB_10626
LB_10625:
	bts QWORD [rdi],1
LB_10626:
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_10619
	btr QWORD [rdi],0
	jmp LB_10620
LB_10619:
	bts QWORD [rdi],0
LB_10620:
	mov rcx,r13
	bt r12,0
	jc LB_10633
	btr r12,6
	jmp LB_10634
LB_10633:
	bts r12,6
LB_10634:
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_10631
	btr QWORD [rdi],1
	jmp LB_10632
LB_10631:
	bts QWORD [rdi],1
LB_10632:
	mov rsi,1
	bt r12,1
	jc LB_10617
	mov rsi,0
	bt r14,0
	jc LB_10617
	jmp LB_10618
LB_10617:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10618:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r9
	bt r12,3
	jc LB_10635
	btr r12,0
	jmp LB_10636
LB_10635:
	bts r12,0
LB_10636:
	ret
MTC_LB_10579:
	mov r15,0
LB_10638:
	cmp r15,0
	jz LB_10639
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10638
LB_10639:
	jmp err
MTC_LB_10637:
MTC_LB_10538:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10640
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
	jnc LB_10641
	bt QWORD [rdi],0
	jc LB_10642
	btr r12,2
	clc
	jmp LB_10643
LB_10642:
	bts r12,2
	stc
LB_10643:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10641:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10644:
	cmp r15,0
	jz LB_10645
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10644
LB_10645:
; _f1498 {  } ⊢ %_10424 : %_10424
 ; {>  %_10401~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10400~0':_r64 }
; _f1498 {  } ⊢ °0◂{  }
; _f1489 %_10424 ⊢ %_10425 : %_10425
 ; {>  %_10424~°0◂{  }:(_p1495)◂(t4036'(0)) %_10401~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10400~0':_r64 }
; _f1489 °0◂{  } ⊢ °1◂°0◂{  }
; ∎ { %_10400 %_10401 %_10425 }
 ; {>  %_10425~°1◂°0◂{  }:(_p1487)◂((_p1495)◂(t4039'(0))) %_10401~1':(_lst)◂({ t4008'(-1) (_opn)◂(_r64) }) %_10400~0':_r64 }
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
	jc LB_10648
	mov rsi,0
	bt r8,0
	jc LB_10648
	jmp LB_10649
LB_10648:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10649:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_10646
	mov rsi,0
	bt r8,0
	jc LB_10646
	jmp LB_10647
LB_10646:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10647:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_10640:
MTC_LB_10529:
NS_E_10680:
; 	|» { 0' 1' }
NS_E_RDI_10680:
MTC_LB_10681:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10682
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
	jnc LB_10683
	bt QWORD [rdi],0
	jc LB_10684
	btr r12,4
	clc
	jmp LB_10685
LB_10684:
	bts r12,4
	stc
LB_10685:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10683:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10688
	btr r12,5
	clc
	jmp LB_10689
LB_10688:
	bts r12,5
	stc
LB_10689:
	mov r8,r11
	bt r12,5
	jc LB_10686
	btr r12,2
	jmp LB_10687
LB_10686:
	bts r12,2
LB_10687:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10692
	btr r12,5
	clc
	jmp LB_10693
LB_10692:
	bts r12,5
	stc
LB_10693:
	mov r9,r11
	bt r12,5
	jc LB_10690
	btr r12,3
	jmp LB_10691
LB_10690:
	bts r12,3
LB_10691:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10694:
	cmp r15,0
	jz LB_10695
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10694
LB_10695:
; _f10669 { %_10670 %_10672 } ⊢ { %_10674 %_10675 } : { %_10674 %_10675 }
 ; {>  %_10670~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10672~2':(_p1487)◂((_p1494)◂(t4144'(-1))) %_10673~3':(_lst)◂((_p1487)◂((_p1494)◂(t4144'(-1)))) }
; _f10669 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10698
	btr r12,1
	jmp LB_10699
LB_10698:
	bts r12,1
LB_10699:
	call NS_E_10669
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_10696
	btr r12,3
	clc
	jmp LB_10697
LB_10696:
	bts r12,3
	stc
LB_10697:
	add rsp,16
; _f10680 { %_10674 %_10673 } ⊢ { %_10676 %_10677 } : { %_10676 %_10677 }
 ; {>  %_10674~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10675~1':(_p1487)◂((_p1494)◂(t4173'(-1))) %_10673~3':(_lst)◂((_p1487)◂((_p1494)◂(t4144'(-1)))) }
; _f10680 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10702
	btr r12,1
	jmp LB_10703
LB_10702:
	bts r12,1
LB_10703:
	call NS_E_10680
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_10704
	btr r12,2
	jmp LB_10705
LB_10704:
	bts r12,2
LB_10705:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10700
	btr r12,1
	clc
	jmp LB_10701
LB_10700:
	bts r12,1
	stc
LB_10701:
	add rsp,16
; _cns { %_10675 %_10677 } ⊢ %_10678 : %_10678
 ; {>  %_10676~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10677~2':(_lst)◂((_p1487)◂((_p1494)◂(t4173'(-1)))) %_10675~1':(_p1487)◂((_p1494)◂(t4173'(-1))) }
; _cns { 1' 2' } ⊢ °0◂{ 1' 2' }
; ∎ { %_10676 %_10678 }
 ; {>  %_10676~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10678~°0◂{ 1' 2' }:(_lst)◂((_p1487)◂((_p1494)◂(t4173'(-1)))) }
; 	∎ { 0' °0◂{ 1' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' °0◂{ 1' 2' } } ⊢ { 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_10706
	btr r12,3
	jmp LB_10707
LB_10706:
	bts r12,3
LB_10707:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r10,r9
	bt r12,3
	jc LB_10712
	btr r12,4
	jmp LB_10713
LB_10712:
	bts r12,4
LB_10713:
	mov rdi,r14
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_10710
	btr QWORD [rdi],0
	jmp LB_10711
LB_10710:
	bts QWORD [rdi],0
LB_10711:
	mov r10,r8
	bt r12,2
	jc LB_10716
	btr r12,4
	jmp LB_10717
LB_10716:
	bts r12,4
LB_10717:
	mov rdi,r14
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10714
	btr QWORD [rdi],1
	jmp LB_10715
LB_10714:
	bts QWORD [rdi],1
LB_10715:
	mov rsi,1
	bt r12,1
	jc LB_10708
	mov rsi,0
	bt r14,0
	jc LB_10708
	jmp LB_10709
LB_10708:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10709:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_10682:
	mov r15,0
LB_10719:
	cmp r15,0
	jz LB_10720
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10719
LB_10720:
; _nil {  } ⊢ %_10679 : %_10679
 ; {>  %_10670~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10671~1':(_lst)◂((_p1487)◂((_p1494)◂(t4144'(-1)))) }
; _nil {  } ⊢ °1◂{  }
; ∎ { %_10670 %_10679 }
 ; {>  %_10679~°1◂{  }:(_lst)◂(t4126'(0)) %_10670~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10671~1':(_lst)◂((_p1487)◂((_p1494)◂(t4144'(-1)))) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_10721
	mov rdi,r14
	call dlt
LB_10721:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_10722
	mov rsi,0
	bt r14,0
	jc LB_10722
	jmp LB_10723
LB_10722:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10723:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_10718:
NS_E_10669:
; 	|» { 0' 1' }
NS_E_RDI_10669:
MTC_LB_10724:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10725
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
	jnc LB_10726
	bt QWORD [rdi],0
	jc LB_10727
	btr r12,3
	clc
	jmp LB_10728
LB_10727:
	bts r12,3
	stc
LB_10728:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10726:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10729
	btr r12,2
	jmp LB_10730
LB_10729:
	bts r12,2
LB_10730:
LB_10731:
	cmp r15,0
	jz LB_10732
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10731
LB_10732:
; _f10680 { %_10650 %_10652 } ⊢ { %_10653 %_10654 } : { %_10653 %_10654 }
 ; {>  %_10652~2':(_lst)◂((_p1487)◂((_p1494)◂(t4144'(-1)))) %_10650~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) }
; _f10680 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10733
	btr r12,1
	jmp LB_10734
LB_10733:
	bts r12,1
LB_10734:
	call NS_E_10680
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1488 %_10654 ⊢ %_10655 : %_10655
 ; {>  %_10654~1':(_lst)◂((_p1487)◂((_p1494)◂(t4173'(-1)))) %_10653~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) }
; _f1488 1' ⊢ °0◂1'
; ∎ { %_10653 %_10655 }
 ; {>  %_10655~°0◂1':(_p1487)◂((_p1494)◂(t4173'(-1))) %_10653~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) }
; 	∎ { 0' °0◂1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' °0◂1' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_10735
	btr r12,2
	jmp LB_10736
LB_10735:
	bts r12,2
LB_10736:
	mov r14,r8
	bt r12,2
	jc LB_10739
	btr r12,1
	jmp LB_10740
LB_10739:
	bts r12,1
LB_10740:
	mov rsi,1
	bt r12,1
	jc LB_10737
	mov rsi,0
	bt r14,0
	jc LB_10737
	jmp LB_10738
LB_10737:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10738:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_10725:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10741
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
	jnc LB_10742
	bt QWORD [rdi],0
	jc LB_10743
	btr r12,3
	clc
	jmp LB_10744
LB_10743:
	bts r12,3
	stc
LB_10744:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10742:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10745
	btr r12,2
	jmp LB_10746
LB_10745:
	bts r12,2
LB_10746:
LB_10747:
	cmp r15,0
	jz LB_10748
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10747
LB_10748:
MTC_LB_10749:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10750
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
	jnc LB_10751
	bt QWORD [rdi],0
	jc LB_10752
	btr r12,3
	clc
	jmp LB_10753
LB_10752:
	bts r12,3
	stc
LB_10753:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10751:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_10754
	btr r12,1
	jmp LB_10755
LB_10754:
	bts r12,1
LB_10755:
LB_10756:
	cmp r15,0
	jz LB_10757
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10756
LB_10757:
; _f765 { %_10650 %_10657 } ⊢ { %_10658 %_10659 %_10660 } : { %_10658 %_10659 %_10660 }
 ; {>  %_10650~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10657~1':t4144'(-1) }
; _f765 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_765
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_10758:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10759
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
	jnc LB_10760
	bt QWORD [rdi],0
	jc LB_10761
	btr r12,4
	clc
	jmp LB_10762
LB_10761:
	bts r12,4
	stc
LB_10762:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10760:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10763
	btr r12,3
	jmp LB_10764
LB_10763:
	bts r12,3
LB_10764:
LB_10765:
	cmp r15,0
	jz LB_10766
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10765
LB_10766:
; _f1497 %_10661 ⊢ %_10662 : %_10662
 ; {>  %_10658~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10659~1':t4144'(-1) %_10661~3':t4173'(-1) }
; _f1497 3' ⊢ °1◂3'
; _f1489 %_10662 ⊢ %_10663 : %_10663
 ; {>  %_10658~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10659~1':t4144'(-1) %_10662~°1◂3':(_p1494)◂(t4173'(-1)) }
; _f1489 °1◂3' ⊢ °1◂°1◂3'
; _none {  } ⊢ %_10664 : %_10664
 ; {>  %_10658~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10659~1':t4144'(-1) %_10663~°1◂°1◂3':(_p1487)◂((_p1494)◂(t4173'(-1))) }
; _none {  } ⊢ °1◂{  }
; _cns { { %_10659 %_10664 } %_10658 } ⊢ %_10665 : %_10665
 ; {>  %_10658~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10659~1':t4144'(-1) %_10663~°1◂°1◂3':(_p1487)◂((_p1494)◂(t4173'(-1))) %_10664~°1◂{  }:(_opn)◂(t4159'(0)) }
; _cns { { 1' °1◂{  } } 0' } ⊢ °0◂{ { 1' °1◂{  } } 0' }
; ∎ { %_10665 %_10663 }
 ; {>  %_10665~°0◂{ { 1' °1◂{  } } 0' }:(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10663~°1◂°1◂3':(_p1487)◂((_p1494)◂(t4173'(-1))) }
; 	∎ { °0◂{ { 1' °1◂{  } } 0' } °1◂°1◂3' }
; _emt_mov_ptn_to_ptn:{| 11010.. |},{ °0◂{ { 1' °1◂{  } } 0' } °1◂°1◂3' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_10767
	btr r12,2
	jmp LB_10768
LB_10767:
	bts r12,2
LB_10768:
	mov r14,r9
	bt r12,3
	jc LB_10773
	btr r12,1
	jmp LB_10774
LB_10773:
	bts r12,1
LB_10774:
	mov rsi,1
	bt r12,1
	jc LB_10771
	mov rsi,0
	bt r14,0
	jc LB_10771
	jmp LB_10772
LB_10771:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10772:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rsi,1
	bt r12,1
	jc LB_10769
	mov rsi,0
	bt r14,0
	jc LB_10769
	jmp LB_10770
LB_10769:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10770:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov r9,r13
	bt r12,0
	jc LB_10775
	btr r12,3
	jmp LB_10776
LB_10775:
	bts r12,3
LB_10776:
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
	jc LB_10783
	btr r12,5
	jmp LB_10784
LB_10783:
	bts r12,5
LB_10784:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_10781
	btr QWORD [rdi],0
	jmp LB_10782
LB_10781:
	bts QWORD [rdi],0
LB_10782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rsi,1
	bt r12,5
	jc LB_10787
	mov rsi,0
	bt r11,0
	jc LB_10787
	jmp LB_10788
LB_10787:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_10788:
	mov rax,0x0100_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_10785
	btr QWORD [rdi],1
	jmp LB_10786
LB_10785:
	bts QWORD [rdi],1
LB_10786:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_10779
	btr QWORD [rdi],0
	jmp LB_10780
LB_10779:
	bts QWORD [rdi],0
LB_10780:
	mov r10,r9
	bt r12,3
	jc LB_10791
	btr r12,4
	jmp LB_10792
LB_10791:
	bts r12,4
LB_10792:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10789
	btr QWORD [rdi],1
	jmp LB_10790
LB_10789:
	bts QWORD [rdi],1
LB_10790:
	mov rsi,1
	bt r12,0
	jc LB_10777
	mov rsi,0
	bt r13,0
	jc LB_10777
	jmp LB_10778
LB_10777:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_10778:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_10759:
	mov r15,0
LB_10794:
	cmp r15,0
	jz LB_10795
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10794
LB_10795:
	jmp err
MTC_LB_10793:
MTC_LB_10750:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10796
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
	jnc LB_10797
	bt QWORD [rdi],0
	jc LB_10798
	btr r12,3
	clc
	jmp LB_10799
LB_10798:
	bts r12,3
	stc
LB_10799:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10797:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_10800
	btr r12,1
	jmp LB_10801
LB_10800:
	bts r12,1
LB_10801:
LB_10802:
	cmp r15,0
	jz LB_10803
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10802
LB_10803:
; _f1496 %_10666 ⊢ %_10667 : %_10667
 ; {>  %_10666~1':_p1490 %_10650~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) }
; _f1496 1' ⊢ °0◂1'
; _f1489 %_10667 ⊢ %_10668 : %_10668
 ; {>  %_10650~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10667~°0◂1':(_p1494)◂(t4167'(0)) }
; _f1489 °0◂1' ⊢ °1◂°0◂1'
; ∎ { %_10650 %_10668 }
 ; {>  %_10650~0':(_lst)◂({ t4144'(-1) (_opn)◂(t4173'(-1)) }) %_10668~°1◂°0◂1':(_p1487)◂((_p1494)◂(t4170'(0))) }
; 	∎ { 0' °1◂°0◂1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' °1◂°0◂1' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_10804
	btr r12,2
	jmp LB_10805
LB_10804:
	bts r12,2
LB_10805:
	mov r14,r8
	bt r12,2
	jc LB_10810
	btr r12,1
	jmp LB_10811
LB_10810:
	bts r12,1
LB_10811:
	mov rsi,1
	bt r12,1
	jc LB_10808
	mov rsi,0
	bt r14,0
	jc LB_10808
	jmp LB_10809
LB_10808:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10809:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rsi,1
	bt r12,1
	jc LB_10806
	mov rsi,0
	bt r14,0
	jc LB_10806
	jmp LB_10807
LB_10806:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10807:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_10796:
MTC_LB_10741:
NS_E_10842:
; 	|» { 0' 1' 2' }
NS_E_RDI_10842:
MTC_LB_10843:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10844
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
	jnc LB_10845
	bt QWORD [rdi],0
	jc LB_10846
	btr r12,5
	clc
	jmp LB_10847
LB_10846:
	bts r12,5
	stc
LB_10847:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10845:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10850
	btr r12,6
	clc
	jmp LB_10851
LB_10850:
	bts r12,6
	stc
LB_10851:
	mov r9,rcx
	bt r12,6
	jc LB_10848
	btr r12,3
	jmp LB_10849
LB_10848:
	bts r12,3
LB_10849:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10854
	btr r12,6
	clc
	jmp LB_10855
LB_10854:
	bts r12,6
	stc
LB_10855:
	mov r10,rcx
	bt r12,6
	jc LB_10852
	btr r12,4
	jmp LB_10853
LB_10852:
	bts r12,4
LB_10853:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10856:
	cmp r15,0
	jz LB_10857
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10856
LB_10857:
MTC_LB_10858:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10859
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
	jnc LB_10860
	bt QWORD [rdi],0
	jc LB_10861
	btr r12,7
	clc
	jmp LB_10862
LB_10861:
	bts r12,7
	stc
LB_10862:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10860:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_10865
	btr r12,8
	clc
	jmp LB_10866
LB_10865:
	bts r12,8
	stc
LB_10866:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10863
	btr r12,2
	jmp LB_10864
LB_10863:
	bts r12,2
LB_10864:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_10869
	btr r12,8
	clc
	jmp LB_10870
LB_10869:
	bts r12,8
	stc
LB_10870:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10867
	btr r12,5
	jmp LB_10868
LB_10867:
	bts r12,5
LB_10868:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_10873
	btr r12,8
	clc
	jmp LB_10874
LB_10873:
	bts r12,8
	stc
LB_10874:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10871
	btr r12,6
	jmp LB_10872
LB_10871:
	bts r12,6
LB_10872:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10875:
	cmp r15,0
	jz LB_10876
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10875
LB_10876:
; _f10669 { %_10813 %_10818 } ⊢ { %_10820 %_10821 } : { %_10820 %_10821 }
 ; {>  %_10817~2':_p1442 %_10818~5':(_p1487)◂((_p1494)◂(t4311'(-1))) %_10813~1':(_lst)◂({ t4311'(-1) (_opn)◂(_r64) }) %_10812~0':_r64 %_10819~6':(_p1487)◂((_p1495)◂(t4311'(-1))) %_10816~4':(_p1505)◂(t4311'(-1)) }
; _f10669 { 1' 5' } ⊢ { 1' 3' }
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
	jc LB_10885
	btr r12,0
	jmp LB_10886
LB_10885:
	bts r12,0
LB_10886:
	mov r14,r11
	bt r12,5
	jc LB_10887
	btr r12,1
	jmp LB_10888
LB_10887:
	bts r12,1
LB_10888:
	call NS_E_10669
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_10889
	btr r12,3
	jmp LB_10890
LB_10889:
	bts r12,3
LB_10890:
	mov r14,r13
	bt r12,0
	jc LB_10891
	btr r12,1
	jmp LB_10892
LB_10891:
	bts r12,1
LB_10892:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_10883
	btr r12,6
	clc
	jmp LB_10884
LB_10883:
	bts r12,6
	stc
LB_10884:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10881
	btr r12,4
	clc
	jmp LB_10882
LB_10881:
	bts r12,4
	stc
LB_10882:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10879
	btr r12,2
	clc
	jmp LB_10880
LB_10879:
	bts r12,2
	stc
LB_10880:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10877
	btr r12,0
	clc
	jmp LB_10878
LB_10877:
	bts r12,0
	stc
LB_10878:
	add rsp,40
; _f10426 { %_10812 %_10820 %_10819 } ⊢ { %_10822 %_10823 %_10824 } : { %_10822 %_10823 %_10824 }
 ; {>  %_10821~3':(_p1487)◂((_p1494)◂(_r64)) %_10820~1':(_lst)◂({ t4311'(-1) (_opn)◂(_r64) }) %_10817~2':_p1442 %_10812~0':_r64 %_10819~6':(_p1487)◂((_p1495)◂(t4311'(-1))) %_10816~4':(_p1505)◂(t4311'(-1)) }
; _f10426 { 0' 1' 6' } ⊢ { 0' 1' 5' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11000010.. |},{ 0' 1' 6' } ⊢ { 0' 1' 2' }
	mov r8,rcx
	bt r12,6
	jc LB_10899
	btr r12,2
	jmp LB_10900
LB_10899:
	bts r12,2
LB_10900:
	call NS_E_10426
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 5' }
	mov r11,r8
	bt r12,2
	jc LB_10901
	btr r12,5
	jmp LB_10902
LB_10901:
	bts r12,5
LB_10902:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10897
	btr r12,4
	clc
	jmp LB_10898
LB_10897:
	bts r12,4
	stc
LB_10898:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10895
	btr r12,3
	clc
	jmp LB_10896
LB_10895:
	bts r12,3
	stc
LB_10896:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10893
	btr r12,2
	clc
	jmp LB_10894
LB_10893:
	bts r12,2
	stc
LB_10894:
	add rsp,32
; _f10842 { %_10822 %_10823 %_10816 } ⊢ { %_10825 %_10826 %_10827 } : { %_10825 %_10826 %_10827 }
 ; {>  %_10821~3':(_p1487)◂((_p1494)◂(_r64)) %_10824~5':(_p1487)◂((_p1495)◂(_r64)) %_10817~2':_p1442 %_10823~1':(_lst)◂({ t4311'(-1) (_opn)◂(_r64) }) %_10822~0':_r64 %_10816~4':(_p1505)◂(t4311'(-1)) }
; _f10842 { 0' 1' 4' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110010.. |},{ 0' 1' 4' } ⊢ { 0' 1' 2' }
	mov r8,r10
	bt r12,4
	jc LB_10909
	btr r12,2
	jmp LB_10910
LB_10909:
	bts r12,2
LB_10910:
	call NS_E_10842
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_10911
	btr r12,4
	jmp LB_10912
LB_10911:
	bts r12,4
LB_10912:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_10907
	btr r12,5
	clc
	jmp LB_10908
LB_10907:
	bts r12,5
	stc
LB_10908:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10905
	btr r12,3
	clc
	jmp LB_10906
LB_10905:
	bts r12,3
	stc
LB_10906:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10903
	btr r12,2
	clc
	jmp LB_10904
LB_10903:
	bts r12,2
	stc
LB_10904:
	add rsp,32
; _f1520 { %_10817 %_10821 %_10824 } ⊢ %_10828 : %_10828
 ; {>  %_10821~3':(_p1487)◂((_p1494)◂(_r64)) %_10827~4':(_p1505)◂(_r64) %_10824~5':(_p1487)◂((_p1495)◂(_r64)) %_10826~1':t4325'(-1) %_10817~2':_p1442 %_10825~0':t4324'(-1) }
; _f1520 { 2' 3' 5' } ⊢ °0◂{ 2' 3' 5' }
; _f1513 { %_10828 %_10827 } ⊢ %_10829 : %_10829
 ; {>  %_10827~4':(_p1505)◂(_r64) %_10826~1':t4325'(-1) %_10825~0':t4324'(-1) %_10828~°0◂{ 2' 3' 5' }:(_p1507)◂(_r64) }
; _f1513 { °0◂{ 2' 3' 5' } 4' } ⊢ °0◂{ °0◂{ 2' 3' 5' } 4' }
; ∎ { %_10825 %_10826 %_10829 }
 ; {>  %_10826~1':t4325'(-1) %_10829~°0◂{ °0◂{ 2' 3' 5' } 4' }:(_p1505)◂(_r64) %_10825~0':t4324'(-1) }
; 	∎ { 0' 1' °0◂{ °0◂{ 2' 3' 5' } 4' } }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' °0◂{ °0◂{ 2' 3' 5' } 4' } } ⊢ { 0' 1' 2' }
	mov rcx,r8
	bt r12,2
	jc LB_10913
	btr r12,6
	jmp LB_10914
LB_10913:
	bts r12,6
LB_10914:
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
	jc LB_10923
	btr r12,8
	jmp LB_10924
LB_10923:
	bts r12,8
LB_10924:
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,8
	jc LB_10921
	btr QWORD [rdi],0
	jmp LB_10922
LB_10921:
	bts QWORD [rdi],0
LB_10922:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_10927
	btr r12,8
	jmp LB_10928
LB_10927:
	bts r12,8
LB_10928:
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,8
	jc LB_10925
	btr QWORD [rdi],1
	jmp LB_10926
LB_10925:
	bts QWORD [rdi],1
LB_10926:
	mov rdi,r11
	mov QWORD [st_vct+8*8],rdi
	bt r12,5
	jc LB_10931
	btr r12,8
	jmp LB_10932
LB_10931:
	bts r12,8
LB_10932:
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,8
	jc LB_10929
	btr QWORD [rdi],2
	jmp LB_10930
LB_10929:
	bts QWORD [rdi],2
LB_10930:
	mov rsi,1
	bt r12,7
	jc LB_10919
	mov rsi,0
	bt rdx,0
	jc LB_10919
	jmp LB_10920
LB_10919:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_10920:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,r8
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_10917
	btr QWORD [rdi],0
	jmp LB_10918
LB_10917:
	bts QWORD [rdi],0
LB_10918:
	mov rdx,r10
	bt r12,4
	jc LB_10935
	btr r12,7
	jmp LB_10936
LB_10935:
	bts r12,7
LB_10936:
	mov rdi,r8
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_10933
	btr QWORD [rdi],1
	jmp LB_10934
LB_10933:
	bts QWORD [rdi],1
LB_10934:
	mov rsi,1
	bt r12,2
	jc LB_10915
	mov rsi,0
	bt r8,0
	jc LB_10915
	jmp LB_10916
LB_10915:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10916:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_10859:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10937
; _emt_mov_ptn_to_ptn:{| 110110.. |},3' ⊢ °1◂{ 2' 5' 6' }
; 3' ⊢ °1◂{ 2' 5' 6' }
	btr r12,7
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10938
	bt QWORD [rdi],0
	jc LB_10939
	btr r12,7
	clc
	jmp LB_10940
LB_10939:
	bts r12,7
	stc
LB_10940:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10938:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_10943
	btr r12,8
	clc
	jmp LB_10944
LB_10943:
	bts r12,8
	stc
LB_10944:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10941
	btr r12,2
	jmp LB_10942
LB_10941:
	bts r12,2
LB_10942:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_10947
	btr r12,8
	clc
	jmp LB_10948
LB_10947:
	bts r12,8
	stc
LB_10948:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10945
	btr r12,5
	jmp LB_10946
LB_10945:
	bts r12,5
LB_10946:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_10951
	btr r12,8
	clc
	jmp LB_10952
LB_10951:
	bts r12,8
	stc
LB_10952:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10949
	btr r12,6
	jmp LB_10950
LB_10949:
	bts r12,6
LB_10950:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10953:
	cmp r15,0
	jz LB_10954
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10953
LB_10954:
	jmp err
MTC_LB_10937:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10955
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
	jnc LB_10956
	bt QWORD [rdi],0
	jc LB_10957
	btr r12,7
	clc
	jmp LB_10958
LB_10957:
	bts r12,7
	stc
LB_10958:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10956:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_10961
	btr r12,8
	clc
	jmp LB_10962
LB_10961:
	bts r12,8
	stc
LB_10962:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10959
	btr r12,2
	jmp LB_10960
LB_10959:
	bts r12,2
LB_10960:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_10965
	btr r12,8
	clc
	jmp LB_10966
LB_10965:
	bts r12,8
	stc
LB_10966:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10963
	btr r12,5
	jmp LB_10964
LB_10963:
	bts r12,5
LB_10964:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_10969
	btr r12,8
	clc
	jmp LB_10970
LB_10969:
	bts r12,8
	stc
LB_10970:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10967
	btr r12,6
	jmp LB_10968
LB_10967:
	bts r12,6
LB_10968:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10971:
	cmp r15,0
	jz LB_10972
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10971
LB_10972:
	jmp err
MTC_LB_10955:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,3
	jnz MTC_LB_10973
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
	jnc LB_10974
	bt QWORD [rdi],0
	jc LB_10975
	btr r12,7
	clc
	jmp LB_10976
LB_10975:
	bts r12,7
	stc
LB_10976:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10974:
	mov rdx,rdi
; 7' ⊢ { 2' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_10979
	btr r12,8
	clc
	jmp LB_10980
LB_10979:
	bts r12,8
	stc
LB_10980:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10977
	btr r12,2
	jmp LB_10978
LB_10977:
	bts r12,2
LB_10978:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_10983
	btr r12,8
	clc
	jmp LB_10984
LB_10983:
	bts r12,8
	stc
LB_10984:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10981
	btr r12,5
	jmp LB_10982
LB_10981:
	bts r12,5
LB_10982:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_10987
	btr r12,8
	clc
	jmp LB_10988
LB_10987:
	bts r12,8
	stc
LB_10988:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10985
	btr r12,6
	jmp LB_10986
LB_10985:
	bts r12,6
LB_10986:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10989:
	cmp r15,0
	jz LB_10990
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10989
LB_10990:
	jmp err
MTC_LB_10973:
MTC_LB_10844:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10991
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
	jnc LB_10992
	bt QWORD [rdi],0
	jc LB_10993
	btr r12,4
	clc
	jmp LB_10994
LB_10993:
	bts r12,4
	stc
LB_10994:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10992:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_10995
	btr r12,3
	jmp LB_10996
LB_10995:
	bts r12,3
LB_10996:
LB_10997:
	cmp r15,0
	jz LB_10998
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10997
LB_10998:
	jmp err
MTC_LB_10991:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10999
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °2◂{ 3' 4' }
; 2' ⊢ °2◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11000
	bt QWORD [rdi],0
	jc LB_11001
	btr r12,5
	clc
	jmp LB_11002
LB_11001:
	bts r12,5
	stc
LB_11002:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11000:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11005
	btr r12,6
	clc
	jmp LB_11006
LB_11005:
	bts r12,6
	stc
LB_11006:
	mov r9,rcx
	bt r12,6
	jc LB_11003
	btr r12,3
	jmp LB_11004
LB_11003:
	bts r12,3
LB_11004:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11009
	btr r12,6
	clc
	jmp LB_11010
LB_11009:
	bts r12,6
	stc
LB_11010:
	mov r10,rcx
	bt r12,6
	jc LB_11007
	btr r12,4
	jmp LB_11008
LB_11007:
	bts r12,4
LB_11008:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11011:
	cmp r15,0
	jz LB_11012
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11011
LB_11012:
	jmp err
MTC_LB_10999:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,3
	jnz MTC_LB_11013
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °3◂3'
; 2' ⊢ °3◂3'
	btr r12,4
	mov rax,r8
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11014
	bt QWORD [rdi],0
	jc LB_11015
	btr r12,4
	clc
	jmp LB_11016
LB_11015:
	bts r12,4
	stc
LB_11016:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11014:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_11017
	btr r12,3
	jmp LB_11018
LB_11017:
	bts r12,3
LB_11018:
LB_11019:
	cmp r15,0
	jz LB_11020
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11019
LB_11020:
	jmp err
MTC_LB_11013:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,4
	jnz MTC_LB_11021
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °4◂{  }
; 2' ⊢ °4◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11022
	bt QWORD [rdi],0
	jc LB_11023
	btr r12,3
	clc
	jmp LB_11024
LB_11023:
	bts r12,3
	stc
LB_11024:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11022:
	mov r9,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11025:
	cmp r15,0
	jz LB_11026
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11025
LB_11026:
	jmp err
MTC_LB_11021:
NS_E_11059:
; 	|» { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
NS_E_RDI_11059:
; ∎ { %_11050 %_11051 %_11052 %_11053 %_11054 %_11055 %_11056 %_11057 }
 ; {>  %_11053~3':_r64 %_11054~4':(_p0)◂(t4432'(-1)) %_11050~0':(_p0)◂(t4430'(-1)) %_11055~5':_r64 %_11058~8':t4399'(-1) %_11052~2':(_p0)◂(t4431'(-1)) %_11051~1':_r64 %_11056~6':(_p0)◂(t4433'(-1)) %_11057~7':_r64 }
; 	∎ { 0' 1' 2' 3' 4' 5' 6' 7' }
	bt r12,8
	jc LB_11060
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_11060:
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	ret
NS_E_11049:
; 	|» 0'
NS_E_RDI_11049:
; » 0xrc8 |~ {  } ⊢ %_11028 : %_11028
 ; {>  %_11027~0':t4399'(-1) }
; 	» 0xrc8 _ ⊢ 1' : %_11028
	mov rdi,0xc8
	mov r14,rdi
	bts r12,1
; _f20 %_11028 ⊢ { %_11029 %_11030 } : { %_11029 %_11030 }
 ; {>  %_11028~1':_r64 %_11027~0':t4399'(-1) }
; _f20 1' ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11063
	btr r12,0
	jmp LB_11064
LB_11063:
	bts r12,0
LB_11064:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_11065
	btr r12,2
	jmp LB_11066
LB_11065:
	bts r12,2
LB_11066:
	mov r14,r13
	bt r12,0
	jc LB_11067
	btr r12,1
	jmp LB_11068
LB_11067:
	bts r12,1
LB_11068:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11061
	btr r12,0
	clc
	jmp LB_11062
LB_11061:
	bts r12,0
	stc
LB_11062:
	add rsp,16
; _f20 %_11029 ⊢ { %_11031 %_11032 } : { %_11031 %_11032 }
 ; {>  %_11029~1':_r64 %_11027~0':t4399'(-1) %_11030~2':(_p0)◂(t4414'(0)) }
; _f20 1' ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_11073
	btr r12,0
	jmp LB_11074
LB_11073:
	bts r12,0
LB_11074:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_11075
	btr r12,3
	jmp LB_11076
LB_11075:
	bts r12,3
LB_11076:
	mov r14,r13
	bt r12,0
	jc LB_11077
	btr r12,1
	jmp LB_11078
LB_11077:
	bts r12,1
LB_11078:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11071
	btr r12,2
	clc
	jmp LB_11072
LB_11071:
	bts r12,2
	stc
LB_11072:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11069
	btr r12,0
	clc
	jmp LB_11070
LB_11069:
	bts r12,0
	stc
LB_11070:
	add rsp,24
; _f20 %_11031 ⊢ { %_11033 %_11034 } : { %_11033 %_11034 }
 ; {>  %_11031~1':_r64 %_11032~3':(_p0)◂(t4417'(0)) %_11027~0':t4399'(-1) %_11030~2':(_p0)◂(t4414'(0)) }
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
	jc LB_11085
	btr r12,0
	jmp LB_11086
LB_11085:
	bts r12,0
LB_11086:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 4' }
	mov r10,r14
	bt r12,1
	jc LB_11087
	btr r12,4
	jmp LB_11088
LB_11087:
	bts r12,4
LB_11088:
	mov r14,r13
	bt r12,0
	jc LB_11089
	btr r12,1
	jmp LB_11090
LB_11089:
	bts r12,1
LB_11090:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11083
	btr r12,3
	clc
	jmp LB_11084
LB_11083:
	bts r12,3
	stc
LB_11084:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11081
	btr r12,2
	clc
	jmp LB_11082
LB_11081:
	bts r12,2
	stc
LB_11082:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11079
	btr r12,0
	clc
	jmp LB_11080
LB_11079:
	bts r12,0
	stc
LB_11080:
	add rsp,32
; _f20 %_11033 ⊢ { %_11035 %_11036 } : { %_11035 %_11036 }
 ; {>  %_11033~1':_r64 %_11034~4':(_p0)◂(t4420'(0)) %_11032~3':(_p0)◂(t4417'(0)) %_11027~0':t4399'(-1) %_11030~2':(_p0)◂(t4414'(0)) }
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
	jc LB_11099
	btr r12,0
	jmp LB_11100
LB_11099:
	bts r12,0
LB_11100:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_11101
	btr r12,5
	jmp LB_11102
LB_11101:
	bts r12,5
LB_11102:
	mov r14,r13
	bt r12,0
	jc LB_11103
	btr r12,1
	jmp LB_11104
LB_11103:
	bts r12,1
LB_11104:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_11097
	btr r12,4
	clc
	jmp LB_11098
LB_11097:
	bts r12,4
	stc
LB_11098:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11095
	btr r12,3
	clc
	jmp LB_11096
LB_11095:
	bts r12,3
	stc
LB_11096:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11093
	btr r12,2
	clc
	jmp LB_11094
LB_11093:
	bts r12,2
	stc
LB_11094:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11091
	btr r12,0
	clc
	jmp LB_11092
LB_11091:
	bts r12,0
	stc
LB_11092:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_11037 : %_11037
 ; {>  %_11035~1':_r64 %_11034~4':(_p0)◂(t4420'(0)) %_11032~3':(_p0)◂(t4417'(0)) %_11027~0':t4399'(-1) %_11036~5':(_p0)◂(t4423'(0)) %_11030~2':(_p0)◂(t4414'(0)) }
; 	» 0xr0 _ ⊢ 6' : %_11037
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; » 0xr0 |~ {  } ⊢ %_11038 : %_11038
 ; {>  %_11037~6':_r64 %_11035~1':_r64 %_11034~4':(_p0)◂(t4420'(0)) %_11032~3':(_p0)◂(t4417'(0)) %_11027~0':t4399'(-1) %_11036~5':(_p0)◂(t4423'(0)) %_11030~2':(_p0)◂(t4414'(0)) }
; 	» 0xr0 _ ⊢ 7' : %_11038
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; » 0xr0 |~ {  } ⊢ %_11039 : %_11039
 ; {>  %_11037~6':_r64 %_11035~1':_r64 %_11034~4':(_p0)◂(t4420'(0)) %_11032~3':(_p0)◂(t4417'(0)) %_11027~0':t4399'(-1) %_11038~7':_r64 %_11036~5':(_p0)◂(t4423'(0)) %_11030~2':(_p0)◂(t4414'(0)) }
; 	» 0xr0 _ ⊢ 8' : %_11039
	mov QWORD [st_vct+8*8],0x0
	bts r12,8
; » 0xr0 |~ {  } ⊢ %_11040 : %_11040
 ; {>  %_11037~6':_r64 %_11035~1':_r64 %_11039~8':_r64 %_11034~4':(_p0)◂(t4420'(0)) %_11032~3':(_p0)◂(t4417'(0)) %_11027~0':t4399'(-1) %_11038~7':_r64 %_11036~5':(_p0)◂(t4423'(0)) %_11030~2':(_p0)◂(t4414'(0)) }
; 	» 0xr0 _ ⊢ 9' : %_11040
	mov QWORD [st_vct+8*9],0x0
	bts r12,9
; _f11059 { %_11030 %_11037 %_11032 %_11038 %_11034 %_11039 %_11036 %_11040 %_11027 } ⊢ { %_11041 %_11042 %_11043 %_11044 %_11045 %_11046 %_11047 %_11048 } : { %_11041 %_11042 %_11043 %_11044 %_11045 %_11046 %_11047 %_11048 }
 ; {>  %_11037~6':_r64 %_11040~9':_r64 %_11035~1':_r64 %_11039~8':_r64 %_11034~4':(_p0)◂(t4420'(0)) %_11032~3':(_p0)◂(t4417'(0)) %_11027~0':t4399'(-1) %_11038~7':_r64 %_11036~5':(_p0)◂(t4423'(0)) %_11030~2':(_p0)◂(t4414'(0)) }
; _f11059 { 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10111111110.. |},{ 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
	mov r14,rcx
	bt r12,6
	jc LB_11107
	btr r12,1
	jmp LB_11108
LB_11107:
	bts r12,1
LB_11108:
	mov rcx,r11
	bt r12,5
	jc LB_11109
	btr r12,6
	jmp LB_11110
LB_11109:
	bts r12,6
LB_11110:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11111
	btr r12,5
	jmp LB_11112
LB_11111:
	bts r12,5
LB_11112:
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_11113
	btr r12,8
	jmp LB_11114
LB_11113:
	bts r12,8
LB_11114:
	mov r13,r8
	bt r12,2
	jc LB_11115
	btr r12,0
	jmp LB_11116
LB_11115:
	bts r12,0
LB_11116:
	mov r8,r9
	bt r12,3
	jc LB_11117
	btr r12,2
	jmp LB_11118
LB_11117:
	bts r12,2
LB_11118:
	mov r9,rdx
	bt r12,7
	jc LB_11119
	btr r12,3
	jmp LB_11120
LB_11119:
	bts r12,3
LB_11120:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_11121
	btr r12,7
	jmp LB_11122
LB_11121:
	bts r12,7
LB_11122:
	call NS_E_11059
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
	mov rdi,rdx
	mov QWORD [st_vct+8*8],rdi
	bt r12,7
	jc LB_11123
	btr r12,8
	jmp LB_11124
LB_11123:
	bts r12,8
LB_11124:
	mov rdx,rcx
	bt r12,6
	jc LB_11125
	btr r12,7
	jmp LB_11126
LB_11125:
	bts r12,7
LB_11126:
	mov rcx,r11
	bt r12,5
	jc LB_11127
	btr r12,6
	jmp LB_11128
LB_11127:
	bts r12,6
LB_11128:
	mov r11,r10
	bt r12,4
	jc LB_11129
	btr r12,5
	jmp LB_11130
LB_11129:
	bts r12,5
LB_11130:
	mov r10,r9
	bt r12,3
	jc LB_11131
	btr r12,4
	jmp LB_11132
LB_11131:
	bts r12,4
LB_11132:
	mov r9,r8
	bt r12,2
	jc LB_11133
	btr r12,3
	jmp LB_11134
LB_11133:
	bts r12,3
LB_11134:
	mov r8,r14
	bt r12,1
	jc LB_11135
	btr r12,2
	jmp LB_11136
LB_11135:
	bts r12,2
LB_11136:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11105
	btr r12,1
	clc
	jmp LB_11106
LB_11105:
	bts r12,1
	stc
LB_11106:
	add rsp,16
; ∎ { %_11041 %_11042 %_11043 %_11044 %_11045 %_11046 %_11047 %_11048 }
 ; {>  %_11044~4':t4437'(-1) %_11046~6':t4439'(-1) %_11047~7':t4440'(-1) %_11035~1':_r64 %_11045~5':t4438'(-1) %_11048~8':t4441'(-1) %_11042~2':t4435'(-1) %_11041~0':t4434'(-1) %_11043~3':t4436'(-1) }
; 	∎ { 0' 2' 3' 4' 5' 6' 7' 8' }
	bt r12,1
	jc LB_11137
	mov rdi,r14
	call dlt
LB_11137:
; _emt_mov_ptn_to_ptn:{| 1011111110.. |},{ 0' 2' 3' 4' 5' 6' 7' 8' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	mov r14,r8
	bt r12,2
	jc LB_11138
	btr r12,1
	jmp LB_11139
LB_11138:
	bts r12,1
LB_11139:
	mov r8,r9
	bt r12,3
	jc LB_11140
	btr r12,2
	jmp LB_11141
LB_11140:
	bts r12,2
LB_11141:
	mov r9,r10
	bt r12,4
	jc LB_11142
	btr r12,3
	jmp LB_11143
LB_11142:
	bts r12,3
LB_11143:
	mov r10,r11
	bt r12,5
	jc LB_11144
	btr r12,4
	jmp LB_11145
LB_11144:
	bts r12,4
LB_11145:
	mov r11,rcx
	bt r12,6
	jc LB_11146
	btr r12,5
	jmp LB_11147
LB_11146:
	bts r12,5
LB_11147:
	mov rcx,rdx
	bt r12,7
	jc LB_11148
	btr r12,6
	jmp LB_11149
LB_11148:
	bts r12,6
LB_11149:
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11150
	btr r12,7
	jmp LB_11151
LB_11150:
	bts r12,7
LB_11151:
	ret
NS_E_11197:
NS_E_RDI_11197:
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
; » 0xr0 |~ {  } ⊢ %_11153 : %_11153
 ; {>  %_11152~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_11153
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_11154 : %_11154
 ; {>  %_11152~0':_stg %_11153~1':_r64 }
; 	» _args _ ⊢ 2' : %_11154
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
MTC_LB_11198:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11199
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
	jnc LB_11200
	bt QWORD [rdi],0
	jc LB_11201
	btr r12,5
	clc
	jmp LB_11202
LB_11201:
	bts r12,5
	stc
LB_11202:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11200:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11205
	btr r12,6
	clc
	jmp LB_11206
LB_11205:
	bts r12,6
	stc
LB_11206:
	mov r9,rcx
	bt r12,6
	jc LB_11203
	btr r12,3
	jmp LB_11204
LB_11203:
	bts r12,3
LB_11204:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11209
	btr r12,6
	clc
	jmp LB_11210
LB_11209:
	bts r12,6
	stc
LB_11210:
	mov r10,rcx
	bt r12,6
	jc LB_11207
	btr r12,4
	jmp LB_11208
LB_11207:
	bts r12,4
LB_11208:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11199
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
	jnc LB_11211
	bt QWORD [rdi],0
	jc LB_11212
	btr r12,7
	clc
	jmp LB_11213
LB_11212:
	bts r12,7
	stc
LB_11213:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11211:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_11216
	btr r12,8
	clc
	jmp LB_11217
LB_11216:
	bts r12,8
	stc
LB_11217:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11214
	btr r12,5
	jmp LB_11215
LB_11214:
	bts r12,5
LB_11215:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_11220
	btr r12,8
	clc
	jmp LB_11221
LB_11220:
	bts r12,8
	stc
LB_11221:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11218
	btr r12,6
	jmp LB_11219
LB_11218:
	bts r12,6
LB_11219:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11199
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
	jnc LB_11222
	bt QWORD [rdi],0
	jc LB_11223
	btr r12,7
	clc
	jmp LB_11224
LB_11223:
	bts r12,7
	stc
LB_11224:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11222:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11225:
	cmp r15,0
	jz LB_11226
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11225
LB_11226:
; _f37 %_11157 ⊢ { %_11159 %_11160 } : { %_11159 %_11160 }
 ; {>  %_11152~0':_stg %_11153~1':_r64 %_11157~5':_stg %_11155~3':_stg }
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
	jc LB_11233
	btr r12,0
	jmp LB_11234
LB_11233:
	bts r12,0
LB_11234:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_11235
	btr r12,2
	jmp LB_11236
LB_11235:
	bts r12,2
LB_11236:
	mov r10,r14
	bt r12,1
	jc LB_11237
	btr r12,4
	jmp LB_11238
LB_11237:
	bts r12,4
LB_11238:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11231
	btr r12,3
	clc
	jmp LB_11232
LB_11231:
	bts r12,3
	stc
LB_11232:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11229
	btr r12,1
	clc
	jmp LB_11230
LB_11229:
	bts r12,1
	stc
LB_11230:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11227
	btr r12,0
	clc
	jmp LB_11228
LB_11227:
	bts r12,0
	stc
LB_11228:
	add rsp,32
; _f5018 %_11160 ⊢ { %_11161 %_11162 } : { %_11161 %_11162 }
 ; {>  %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11160~4':_stg %_11155~3':_stg }
; _f5018 4' ⊢ { 4' 5' }
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
	jc LB_11247
	btr r12,0
	jmp LB_11248
LB_11247:
	bts r12,0
LB_11248:
	call NS_E_5018
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_11249
	btr r12,4
	jmp LB_11250
LB_11249:
	bts r12,4
LB_11250:
	mov r11,r14
	bt r12,1
	jc LB_11251
	btr r12,5
	jmp LB_11252
LB_11251:
	bts r12,5
LB_11252:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11245
	btr r12,3
	clc
	jmp LB_11246
LB_11245:
	bts r12,3
	stc
LB_11246:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11243
	btr r12,2
	clc
	jmp LB_11244
LB_11243:
	bts r12,2
	stc
LB_11244:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11241
	btr r12,1
	clc
	jmp LB_11242
LB_11241:
	bts r12,1
	stc
LB_11242:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11239
	btr r12,0
	clc
	jmp LB_11240
LB_11239:
	bts r12,0
	stc
LB_11240:
	add rsp,40
MTC_LB_11253:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11254
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
	jnc LB_11255
	bt QWORD [rdi],0
	jc LB_11256
	btr r12,7
	clc
	jmp LB_11257
LB_11256:
	bts r12,7
	stc
LB_11257:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11255:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_11258
	btr r12,6
	jmp LB_11259
LB_11258:
	bts r12,6
LB_11259:
LB_11260:
	cmp r15,0
	jz LB_11261
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11260
LB_11261:
; » 0xr0 |~ {  } ⊢ %_11164 : %_11164
 ; {>  %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11161~4':_stg %_11163~6':_stg %_11155~3':_stg }
; 	» 0xr0 _ ⊢ 5' : %_11164
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f6473 { %_11163 %_11164 } ⊢ { %_11165 %_11166 %_11167 } : { %_11165 %_11166 %_11167 }
 ; {>  %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11161~4':_stg %_11164~5':_r64 %_11163~6':_stg %_11155~3':_stg }
; _f6473 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_11272
	btr r12,0
	jmp LB_11273
LB_11272:
	bts r12,0
LB_11273:
	mov r14,r11
	bt r12,5
	jc LB_11274
	btr r12,1
	jmp LB_11275
LB_11274:
	bts r12,1
LB_11275:
	call NS_E_6473
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_11276
	btr r12,5
	jmp LB_11277
LB_11276:
	bts r12,5
LB_11277:
	mov rcx,r14
	bt r12,1
	jc LB_11278
	btr r12,6
	jmp LB_11279
LB_11278:
	bts r12,6
LB_11279:
	mov rdx,r9
	bt r12,3
	jc LB_11282
	btr r12,7
	jmp LB_11283
LB_11282:
	bts r12,7
LB_11283:
	mov rsi,1
	bt r12,7
	jc LB_11280
	mov rsi,0
	bt rdx,0
	jc LB_11280
	jmp LB_11281
LB_11280:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_11281:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11270
	btr r12,4
	clc
	jmp LB_11271
LB_11270:
	bts r12,4
	stc
LB_11271:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11268
	btr r12,3
	clc
	jmp LB_11269
LB_11268:
	bts r12,3
	stc
LB_11269:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11266
	btr r12,2
	clc
	jmp LB_11267
LB_11266:
	bts r12,2
	stc
LB_11267:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11264
	btr r12,1
	clc
	jmp LB_11265
LB_11264:
	bts r12,1
	stc
LB_11265:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11262
	btr r12,0
	clc
	jmp LB_11263
LB_11262:
	bts r12,0
	stc
LB_11263:
	add rsp,48
MTC_LB_11284:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11285
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
	jnc LB_11286
	bt QWORD [rdi],0
	jc LB_11287
	btr r12,9
	clc
	jmp LB_11288
LB_11287:
	bts r12,9
	stc
LB_11288:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11286:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_11289
	btr r12,8
	jmp LB_11290
LB_11289:
	bts r12,8
LB_11290:
LB_11291:
	cmp r15,0
	jz LB_11292
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11291
LB_11292:
; » 0xr0 |~ {  } ⊢ %_11169 : %_11169
 ; {>  %_11165~5':_stg %_11168~8':(_lst)◂(_p1539) %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11161~4':_stg %_11166~6':_r64 %_11155~3':_stg }
; 	» 0xr0 _ ⊢ 7' : %_11169
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f2971 { %_11169 %_11168 } ⊢ { %_11170 %_11171 } : { %_11170 %_11171 }
 ; {>  %_11165~5':_stg %_11168~8':(_lst)◂(_p1539) %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11169~7':_r64 %_11161~4':_stg %_11166~6':_r64 %_11155~3':_stg }
; _f2971 { 7' 8' } ⊢ { 7' 8' }
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
	jc LB_11307
	btr r12,0
	jmp LB_11308
LB_11307:
	bts r12,0
LB_11308:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11309
	btr r12,1
	jmp LB_11310
LB_11309:
	bts r12,1
LB_11310:
	call NS_E_2971
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_11311
	btr r12,7
	jmp LB_11312
LB_11311:
	bts r12,7
LB_11312:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_11313
	btr r12,8
	jmp LB_11314
LB_11313:
	bts r12,8
LB_11314:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_11305
	btr r12,6
	clc
	jmp LB_11306
LB_11305:
	bts r12,6
	stc
LB_11306:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_11303
	btr r12,5
	clc
	jmp LB_11304
LB_11303:
	bts r12,5
	stc
LB_11304:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11301
	btr r12,4
	clc
	jmp LB_11302
LB_11301:
	bts r12,4
	stc
LB_11302:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11299
	btr r12,3
	clc
	jmp LB_11300
LB_11299:
	bts r12,3
	stc
LB_11300:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11297
	btr r12,2
	clc
	jmp LB_11298
LB_11297:
	bts r12,2
	stc
LB_11298:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11295
	btr r12,1
	clc
	jmp LB_11296
LB_11295:
	bts r12,1
	stc
LB_11296:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11293
	btr r12,0
	clc
	jmp LB_11294
LB_11293:
	bts r12,0
	stc
LB_11294:
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
; _f38 %_11173 ⊢ %_11174 : %_11174
 ; {>  %_11165~5':_stg %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11173~9':_stg %_11170~7':_r64 %_11172~8':_stg %_11161~4':_stg %_11166~6':_r64 %_11155~3':_stg }
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
	jc LB_11333
	btr r12,0
	jmp LB_11334
LB_11333:
	bts r12,0
LB_11334:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_11335
	btr r12,9
	jmp LB_11336
LB_11335:
	bts r12,9
LB_11336:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_11331
	btr r12,8
	clc
	jmp LB_11332
LB_11331:
	bts r12,8
	stc
LB_11332:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_11329
	btr r12,7
	clc
	jmp LB_11330
LB_11329:
	bts r12,7
	stc
LB_11330:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_11327
	btr r12,6
	clc
	jmp LB_11328
LB_11327:
	bts r12,6
	stc
LB_11328:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_11325
	btr r12,5
	clc
	jmp LB_11326
LB_11325:
	bts r12,5
	stc
LB_11326:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11323
	btr r12,4
	clc
	jmp LB_11324
LB_11323:
	bts r12,4
	stc
LB_11324:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11321
	btr r12,3
	clc
	jmp LB_11322
LB_11321:
	bts r12,3
	stc
LB_11322:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11319
	btr r12,2
	clc
	jmp LB_11320
LB_11319:
	bts r12,2
	stc
LB_11320:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11317
	btr r12,1
	clc
	jmp LB_11318
LB_11317:
	bts r12,1
	stc
LB_11318:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11315
	btr r12,0
	clc
	jmp LB_11316
LB_11315:
	bts r12,0
	stc
LB_11316:
	add rsp,80
; ∎ {  }
 ; {>  %_11165~5':_stg %_11159~2':_stg %_11152~0':_stg %_11174~9':_stg %_11153~1':_r64 %_11170~7':_r64 %_11172~8':_stg %_11161~4':_stg %_11166~6':_r64 %_11155~3':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_11337
	mov rdi,r11
	call dlt
LB_11337:
	bt r12,2
	jc LB_11338
	mov rdi,r8
	call dlt
LB_11338:
	bt r12,0
	jc LB_11339
	mov rdi,r13
	call dlt
LB_11339:
	bt r12,9
	jc LB_11340
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_11340:
	bt r12,1
	jc LB_11341
	mov rdi,r14
	call dlt
LB_11341:
	bt r12,7
	jc LB_11342
	mov rdi,rdx
	call dlt
LB_11342:
	bt r12,8
	jc LB_11343
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_11343:
	bt r12,4
	jc LB_11344
	mov rdi,r10
	call dlt
LB_11344:
	bt r12,6
	jc LB_11345
	mov rdi,rcx
	call dlt
LB_11345:
	bt r12,3
	jc LB_11346
	mov rdi,r9
	call dlt
LB_11346:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_11285:
	mov r15,0
LB_11348:
	cmp r15,0
	jz LB_11349
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11348
LB_11349:
; 	» "H0\n" _ ⊢ 8' : %_11175
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_11175 ⊢ %_11176 : %_11176
 ; {>  %_11165~5':_stg %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11167~7':(_opn)◂((_lst)◂(_p1539)) %_11161~4':_stg %_11175~8':_stg %_11166~6':_r64 %_11155~3':_stg }
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
	jc LB_11366
	btr r12,0
	jmp LB_11367
LB_11366:
	bts r12,0
LB_11367:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_11368
	btr r12,8
	jmp LB_11369
LB_11368:
	bts r12,8
LB_11369:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_11364
	btr r12,7
	clc
	jmp LB_11365
LB_11364:
	bts r12,7
	stc
LB_11365:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_11362
	btr r12,6
	clc
	jmp LB_11363
LB_11362:
	bts r12,6
	stc
LB_11363:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_11360
	btr r12,5
	clc
	jmp LB_11361
LB_11360:
	bts r12,5
	stc
LB_11361:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11358
	btr r12,4
	clc
	jmp LB_11359
LB_11358:
	bts r12,4
	stc
LB_11359:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11356
	btr r12,3
	clc
	jmp LB_11357
LB_11356:
	bts r12,3
	stc
LB_11357:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11354
	btr r12,2
	clc
	jmp LB_11355
LB_11354:
	bts r12,2
	stc
LB_11355:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11352
	btr r12,1
	clc
	jmp LB_11353
LB_11352:
	bts r12,1
	stc
LB_11353:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11350
	btr r12,0
	clc
	jmp LB_11351
LB_11350:
	bts r12,0
	stc
LB_11351:
	add rsp,72
; ∎ {  }
 ; {>  %_11176~8':_stg %_11165~5':_stg %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11167~7':(_opn)◂((_lst)◂(_p1539)) %_11161~4':_stg %_11166~6':_r64 %_11155~3':_stg }
; 	∎ {  }
	bt r12,8
	jc LB_11370
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_11370:
	bt r12,5
	jc LB_11371
	mov rdi,r11
	call dlt
LB_11371:
	bt r12,2
	jc LB_11372
	mov rdi,r8
	call dlt
LB_11372:
	bt r12,0
	jc LB_11373
	mov rdi,r13
	call dlt
LB_11373:
	bt r12,1
	jc LB_11374
	mov rdi,r14
	call dlt
LB_11374:
	bt r12,7
	jc LB_11375
	mov rdi,rdx
	call dlt
LB_11375:
	bt r12,4
	jc LB_11376
	mov rdi,r10
	call dlt
LB_11376:
	bt r12,6
	jc LB_11377
	mov rdi,rcx
	call dlt
LB_11377:
	bt r12,3
	jc LB_11378
	mov rdi,r9
	call dlt
LB_11378:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_11347:
MTC_LB_11254:
	mov r15,0
LB_11380:
	cmp r15,0
	jz LB_11381
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11380
LB_11381:
; 	» "H1\n" _ ⊢ 6' : %_11177
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_11177 ⊢ %_11178 : %_11178
 ; {>  %_11177~6':_stg %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11161~4':_stg %_11162~5':(_opn)◂(_stg) %_11155~3':_stg }
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
	jc LB_11394
	btr r12,0
	jmp LB_11395
LB_11394:
	bts r12,0
LB_11395:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_11396
	btr r12,6
	jmp LB_11397
LB_11396:
	bts r12,6
LB_11397:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_11392
	btr r12,5
	clc
	jmp LB_11393
LB_11392:
	bts r12,5
	stc
LB_11393:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11390
	btr r12,4
	clc
	jmp LB_11391
LB_11390:
	bts r12,4
	stc
LB_11391:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11388
	btr r12,3
	clc
	jmp LB_11389
LB_11388:
	bts r12,3
	stc
LB_11389:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11386
	btr r12,2
	clc
	jmp LB_11387
LB_11386:
	bts r12,2
	stc
LB_11387:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11384
	btr r12,1
	clc
	jmp LB_11385
LB_11384:
	bts r12,1
	stc
LB_11385:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11382
	btr r12,0
	clc
	jmp LB_11383
LB_11382:
	bts r12,0
	stc
LB_11383:
	add rsp,56
; ∎ {  }
 ; {>  %_11178~6':_stg %_11159~2':_stg %_11152~0':_stg %_11153~1':_r64 %_11161~4':_stg %_11162~5':(_opn)◂(_stg) %_11155~3':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_11398
	mov rdi,rcx
	call dlt
LB_11398:
	bt r12,2
	jc LB_11399
	mov rdi,r8
	call dlt
LB_11399:
	bt r12,0
	jc LB_11400
	mov rdi,r13
	call dlt
LB_11400:
	bt r12,1
	jc LB_11401
	mov rdi,r14
	call dlt
LB_11401:
	bt r12,4
	jc LB_11402
	mov rdi,r10
	call dlt
LB_11402:
	bt r12,5
	jc LB_11403
	mov rdi,r11
	call dlt
LB_11403:
	bt r12,3
	jc LB_11404
	mov rdi,r9
	call dlt
LB_11404:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_11379:
MTC_LB_11199:
	mov r15,0
LB_11406:
	cmp r15,0
	jz LB_11407
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11406
LB_11407:
; _f6473 { %_11152 %_11153 } ⊢ { %_11179 %_11180 %_11181 } : { %_11179 %_11180 %_11181 }
 ; {>  %_11152~0':_stg %_11153~1':_r64 %_11154~2':(_lst)◂(_stg) }
; _f6473 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_6473
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_11410
	btr r12,4
	jmp LB_11411
LB_11410:
	bts r12,4
LB_11411:
	mov r9,r10
	bt r12,4
	jc LB_11414
	btr r12,3
	jmp LB_11415
LB_11414:
	bts r12,3
LB_11415:
	mov rsi,1
	bt r12,3
	jc LB_11412
	mov rsi,0
	bt r9,0
	jc LB_11412
	jmp LB_11413
LB_11412:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11413:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_11408
	btr r12,2
	clc
	jmp LB_11409
LB_11408:
	bts r12,2
	stc
LB_11409:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_11182
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_11182 ⊢ { %_11183 %_11184 } : { %_11183 %_11184 }
 ; {>  %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11180~1':_r64 %_11182~4':_stg %_11154~2':(_lst)◂(_stg) %_11179~0':_stg }
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
	jc LB_11424
	btr r12,0
	jmp LB_11425
LB_11424:
	bts r12,0
LB_11425:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_11426
	btr r12,4
	jmp LB_11427
LB_11426:
	bts r12,4
LB_11427:
	mov r11,r14
	bt r12,1
	jc LB_11428
	btr r12,5
	jmp LB_11429
LB_11428:
	bts r12,5
LB_11429:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11422
	btr r12,3
	clc
	jmp LB_11423
LB_11422:
	bts r12,3
	stc
LB_11423:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11420
	btr r12,2
	clc
	jmp LB_11421
LB_11420:
	bts r12,2
	stc
LB_11421:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11418
	btr r12,1
	clc
	jmp LB_11419
LB_11418:
	bts r12,1
	stc
LB_11419:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11416
	btr r12,0
	clc
	jmp LB_11417
LB_11416:
	bts r12,0
	stc
LB_11417:
	add rsp,40
; _f38 { %_11183 %_11184 } ⊢ { %_11185 %_11186 } : { %_11185 %_11186 }
 ; {>  %_11184~5':_stg %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11180~1':_r64 %_11183~4':_stg %_11154~2':(_lst)◂(_stg) %_11179~0':_stg }
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
	jc LB_11440
	btr r12,1
	jmp LB_11441
LB_11440:
	bts r12,1
LB_11441:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_11438
	btr QWORD [rdi],0
	jmp LB_11439
LB_11438:
	bts QWORD [rdi],0
LB_11439:
	mov r14,r11
	bt r12,5
	jc LB_11444
	btr r12,1
	jmp LB_11445
LB_11444:
	bts r12,1
LB_11445:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_11442
	btr QWORD [rdi],1
	jmp LB_11443
LB_11442:
	bts QWORD [rdi],1
LB_11443:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_11448
	btr r12,1
	clc
	jmp LB_11449
LB_11448:
	bts r12,1
	stc
LB_11449:
	mov r10,r14
	bt r12,1
	jc LB_11446
	btr r12,4
	jmp LB_11447
LB_11446:
	bts r12,4
LB_11447:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_11452
	btr r12,1
	clc
	jmp LB_11453
LB_11452:
	bts r12,1
	stc
LB_11453:
	mov r11,r14
	bt r12,1
	jc LB_11450
	btr r12,5
	jmp LB_11451
LB_11450:
	bts r12,5
LB_11451:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11436
	btr r12,3
	clc
	jmp LB_11437
LB_11436:
	bts r12,3
	stc
LB_11437:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11434
	btr r12,2
	clc
	jmp LB_11435
LB_11434:
	bts r12,2
	stc
LB_11435:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11432
	btr r12,1
	clc
	jmp LB_11433
LB_11432:
	bts r12,1
	stc
LB_11433:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11430
	btr r12,0
	clc
	jmp LB_11431
LB_11430:
	bts r12,0
	stc
LB_11431:
	add rsp,40
; _f5018 %_11186 ⊢ { %_11187 %_11188 } : { %_11187 %_11188 }
 ; {>  %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11186~5':_stg %_11180~1':_r64 %_11154~2':(_lst)◂(_stg) %_11179~0':_stg %_11185~4':_stg }
; _f5018 5' ⊢ { 5' 6' }
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
	jc LB_11464
	btr r12,0
	jmp LB_11465
LB_11464:
	bts r12,0
LB_11465:
	call NS_E_5018
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_11466
	btr r12,5
	jmp LB_11467
LB_11466:
	bts r12,5
LB_11467:
	mov rcx,r14
	bt r12,1
	jc LB_11468
	btr r12,6
	jmp LB_11469
LB_11468:
	bts r12,6
LB_11469:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11462
	btr r12,4
	clc
	jmp LB_11463
LB_11462:
	bts r12,4
	stc
LB_11463:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11460
	btr r12,3
	clc
	jmp LB_11461
LB_11460:
	bts r12,3
	stc
LB_11461:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11458
	btr r12,2
	clc
	jmp LB_11459
LB_11458:
	bts r12,2
	stc
LB_11459:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11456
	btr r12,1
	clc
	jmp LB_11457
LB_11456:
	bts r12,1
	stc
LB_11457:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11454
	btr r12,0
	clc
	jmp LB_11455
LB_11454:
	bts r12,0
	stc
LB_11455:
	add rsp,48
MTC_LB_11470:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11471
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
	jnc LB_11472
	bt QWORD [rdi],0
	jc LB_11473
	btr r12,8
	clc
	jmp LB_11474
LB_11473:
	bts r12,8
	stc
LB_11474:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11472:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11475
	btr r12,7
	jmp LB_11476
LB_11475:
	bts r12,7
LB_11476:
LB_11477:
	cmp r15,0
	jz LB_11478
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11477
LB_11478:
; » 0xr0 |~ {  } ⊢ %_11190 : %_11190
 ; {>  %_11187~5':_stg %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11189~7':_stg %_11180~1':_r64 %_11154~2':(_lst)◂(_stg) %_11179~0':_stg %_11185~4':_stg }
; 	» 0xr0 _ ⊢ 6' : %_11190
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f6473 { %_11189 %_11190 } ⊢ { %_11191 %_11192 %_11193 } : { %_11191 %_11192 %_11193 }
 ; {>  %_11187~5':_stg %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11189~7':_stg %_11180~1':_r64 %_11154~2':(_lst)◂(_stg) %_11190~6':_r64 %_11179~0':_stg %_11185~4':_stg }
; _f6473 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_11491
	btr r12,0
	jmp LB_11492
LB_11491:
	bts r12,0
LB_11492:
	mov r14,rcx
	bt r12,6
	jc LB_11493
	btr r12,1
	jmp LB_11494
LB_11493:
	bts r12,1
LB_11494:
	call NS_E_6473
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_11495
	btr r12,6
	jmp LB_11496
LB_11495:
	bts r12,6
LB_11496:
	mov rdx,r14
	bt r12,1
	jc LB_11497
	btr r12,7
	jmp LB_11498
LB_11497:
	bts r12,7
LB_11498:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_11501
	btr r12,8
	jmp LB_11502
LB_11501:
	bts r12,8
LB_11502:
	mov rsi,1
	bt r12,8
	jc LB_11499
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_11499
	jmp LB_11500
LB_11499:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_11500:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_11489
	btr r12,5
	clc
	jmp LB_11490
LB_11489:
	bts r12,5
	stc
LB_11490:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11487
	btr r12,4
	clc
	jmp LB_11488
LB_11487:
	bts r12,4
	stc
LB_11488:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11485
	btr r12,3
	clc
	jmp LB_11486
LB_11485:
	bts r12,3
	stc
LB_11486:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11483
	btr r12,2
	clc
	jmp LB_11484
LB_11483:
	bts r12,2
	stc
LB_11484:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11481
	btr r12,1
	clc
	jmp LB_11482
LB_11481:
	bts r12,1
	stc
LB_11482:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11479
	btr r12,0
	clc
	jmp LB_11480
LB_11479:
	bts r12,0
	stc
LB_11480:
	add rsp,56
; _f38 { %_11191 %_11192 %_11193 } ⊢ { %_11194 %_11195 %_11196 } : { %_11194 %_11195 %_11196 }
 ; {>  %_11187~5':_stg %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11191~6':_stg %_11193~8':(_opn)◂((_lst)◂(_p1539)) %_11180~1':_r64 %_11192~7':_r64 %_11154~2':(_lst)◂(_stg) %_11179~0':_stg %_11185~4':_stg }
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
	jc LB_11517
	btr r12,1
	jmp LB_11518
LB_11517:
	bts r12,1
LB_11518:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_11515
	btr QWORD [rdi],0
	jmp LB_11516
LB_11515:
	bts QWORD [rdi],0
LB_11516:
	mov r14,rdx
	bt r12,7
	jc LB_11521
	btr r12,1
	jmp LB_11522
LB_11521:
	bts r12,1
LB_11522:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_11519
	btr QWORD [rdi],1
	jmp LB_11520
LB_11519:
	bts QWORD [rdi],1
LB_11520:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11525
	btr r12,1
	jmp LB_11526
LB_11525:
	bts r12,1
LB_11526:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,1
	jc LB_11523
	btr QWORD [rdi],2
	jmp LB_11524
LB_11523:
	bts QWORD [rdi],2
LB_11524:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_11529
	btr r12,1
	clc
	jmp LB_11530
LB_11529:
	bts r12,1
	stc
LB_11530:
	mov rcx,r14
	bt r12,1
	jc LB_11527
	btr r12,6
	jmp LB_11528
LB_11527:
	bts r12,6
LB_11528:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_11533
	btr r12,1
	clc
	jmp LB_11534
LB_11533:
	bts r12,1
	stc
LB_11534:
	mov rdx,r14
	bt r12,1
	jc LB_11531
	btr r12,7
	jmp LB_11532
LB_11531:
	bts r12,7
LB_11532:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_11537
	btr r12,1
	clc
	jmp LB_11538
LB_11537:
	bts r12,1
	stc
LB_11538:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_11535
	btr r12,8
	jmp LB_11536
LB_11535:
	bts r12,8
LB_11536:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_11513
	btr r12,5
	clc
	jmp LB_11514
LB_11513:
	bts r12,5
	stc
LB_11514:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11511
	btr r12,4
	clc
	jmp LB_11512
LB_11511:
	bts r12,4
	stc
LB_11512:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11509
	btr r12,3
	clc
	jmp LB_11510
LB_11509:
	bts r12,3
	stc
LB_11510:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11507
	btr r12,2
	clc
	jmp LB_11508
LB_11507:
	bts r12,2
	stc
LB_11508:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11505
	btr r12,1
	clc
	jmp LB_11506
LB_11505:
	bts r12,1
	stc
LB_11506:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11503
	btr r12,0
	clc
	jmp LB_11504
LB_11503:
	bts r12,0
	stc
LB_11504:
	add rsp,56
; ∎ {  }
 ; {>  %_11194~6':_stg %_11187~5':_stg %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11195~7':_r64 %_11180~1':_r64 %_11154~2':(_lst)◂(_stg) %_11196~8':(_opn)◂((_lst)◂(_p1539)) %_11179~0':_stg %_11185~4':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_11539
	mov rdi,rcx
	call dlt
LB_11539:
	bt r12,5
	jc LB_11540
	mov rdi,r11
	call dlt
LB_11540:
	bt r12,3
	jc LB_11541
	mov rdi,r9
	call dlt
LB_11541:
	bt r12,7
	jc LB_11542
	mov rdi,rdx
	call dlt
LB_11542:
	bt r12,1
	jc LB_11543
	mov rdi,r14
	call dlt
LB_11543:
	bt r12,2
	jc LB_11544
	mov rdi,r8
	call dlt
LB_11544:
	bt r12,8
	jc LB_11545
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_11545:
	bt r12,0
	jc LB_11546
	mov rdi,r13
	call dlt
LB_11546:
	bt r12,4
	jc LB_11547
	mov rdi,r10
	call dlt
LB_11547:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_11471:
	mov r15,0
LB_11549:
	cmp r15,0
	jz LB_11550
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11549
LB_11550:
; ∎ {  }
 ; {>  %_11187~5':_stg %_11181~3':(_opn)◂((_lst)◂(_p1539)) %_11188~6':(_opn)◂(_stg) %_11180~1':_r64 %_11154~2':(_lst)◂(_stg) %_11179~0':_stg %_11185~4':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_11551
	mov rdi,r11
	call dlt
LB_11551:
	bt r12,3
	jc LB_11552
	mov rdi,r9
	call dlt
LB_11552:
	bt r12,6
	jc LB_11553
	mov rdi,rcx
	call dlt
LB_11553:
	bt r12,1
	jc LB_11554
	mov rdi,r14
	call dlt
LB_11554:
	bt r12,2
	jc LB_11555
	mov rdi,r8
	call dlt
LB_11555:
	bt r12,0
	jc LB_11556
	mov rdi,r13
	call dlt
LB_11556:
	bt r12,4
	jc LB_11557
	mov rdi,r10
	call dlt
LB_11557:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_11548:
MTC_LB_11405:
NS_E_11579:
NS_E_RDI_11579:
; 	» "{ x   y z }" _ ⊢ 0' : %_11558
	mov rdi,11
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_79_20_20_20_78_20_7b
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_7d_20_7a
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_11559 : %_11559
 ; {>  %_11558~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_11559
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f5861 { %_11558 %_11559 } ⊢ { %_11560 %_11561 %_11562 } : { %_11560 %_11561 %_11562 }
 ; {>  %_11558~0':_stg %_11559~1':_r64 }
; _f5861 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_5861
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_11580
	btr r12,4
	jmp LB_11581
LB_11580:
	bts r12,4
LB_11581:
	mov r8,r9
	bt r12,3
	jc LB_11584
	btr r12,2
	jmp LB_11585
LB_11584:
	bts r12,2
LB_11585:
	mov rsi,1
	bt r12,2
	jc LB_11582
	mov rsi,0
	bt r8,0
	jc LB_11582
	jmp LB_11583
LB_11582:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_11583:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 %_11562 ⊢ %_11563 : %_11563
 ; {>  %_11560~0':_stg %_11561~1':_r64 %_11562~2':(_opn)◂((_p1487)◂((_p1495)◂(_stg))) }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_11590
	btr r12,0
	jmp LB_11591
LB_11590:
	bts r12,0
LB_11591:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_11592
	btr r12,2
	jmp LB_11593
LB_11592:
	bts r12,2
LB_11593:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11588
	btr r12,1
	clc
	jmp LB_11589
LB_11588:
	bts r12,1
	stc
LB_11589:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11586
	btr r12,0
	clc
	jmp LB_11587
LB_11586:
	bts r12,0
	stc
LB_11587:
	add rsp,24
MTC_LB_11594:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11595
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
	jnc LB_11596
	bt QWORD [rdi],0
	jc LB_11597
	btr r12,4
	clc
	jmp LB_11598
LB_11597:
	bts r12,4
	stc
LB_11598:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11596:
	mov r10,rdi
	mov r9,r10
	bt r12,4
	jc LB_11599
	btr r12,3
	jmp LB_11600
LB_11599:
	bts r12,3
LB_11600:
LB_11601:
	cmp r15,0
	jz LB_11602
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11601
LB_11602:
; » 0xr0 |~ {  } ⊢ %_11565 : %_11565
 ; {>  %_11560~0':_stg %_11561~1':_r64 %_11564~3':(_p1487)◂((_p1495)◂(_stg)) }
; 	» 0xr0 _ ⊢ 2' : %_11565
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _nil {  } ⊢ %_11566 : %_11566
 ; {>  %_11565~2':_r64 %_11560~0':_stg %_11561~1':_r64 %_11564~3':(_p1487)◂((_p1495)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _f10426 { %_11565 %_11566 %_11564 } ⊢ { %_11567 %_11568 %_11569 } : { %_11567 %_11568 %_11569 }
 ; {>  %_11565~2':_r64 %_11560~0':_stg %_11561~1':_r64 %_11566~°1◂{  }:(_lst)◂(t4597'(0)) %_11564~3':(_p1487)◂((_p1495)◂(_stg)) }
; _f10426 { 2' °1◂{  } 3' } ⊢ { 2' 3' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},{ 2' °1◂{  } 3' } ⊢ { 0' 1' 2' }
	mov r13,r8
	bt r12,2
	jc LB_11607
	btr r12,0
	jmp LB_11608
LB_11607:
	bts r12,0
LB_11608:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_11609
	mov rsi,0
	bt r14,0
	jc LB_11609
	jmp LB_11610
LB_11609:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11610:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov r8,r9
	bt r12,3
	jc LB_11611
	btr r12,2
	jmp LB_11612
LB_11611:
	bts r12,2
LB_11612:
	call NS_E_10426
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 3' 4' }
	mov r9,r14
	bt r12,1
	jc LB_11613
	btr r12,3
	jmp LB_11614
LB_11613:
	bts r12,3
LB_11614:
	mov r10,r8
	bt r12,2
	jc LB_11615
	btr r12,4
	jmp LB_11616
LB_11615:
	bts r12,4
LB_11616:
	mov r8,r13
	bt r12,0
	jc LB_11617
	btr r12,2
	jmp LB_11618
LB_11617:
	bts r12,2
LB_11618:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11605
	btr r12,1
	clc
	jmp LB_11606
LB_11605:
	bts r12,1
	stc
LB_11606:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11603
	btr r12,0
	clc
	jmp LB_11604
LB_11603:
	bts r12,0
	stc
LB_11604:
	add rsp,24
; _f38 %_11569 ⊢ %_11570 : %_11570
 ; {>  %_11567~2':_r64 %_11560~0':_stg %_11561~1':_r64 %_11569~4':(_p1487)◂((_p1495)◂(_r64)) %_11568~3':(_lst)◂({ _stg (_opn)◂(_r64) }) }
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
	jc LB_11627
	btr r12,0
	jmp LB_11628
LB_11627:
	bts r12,0
LB_11628:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_11629
	btr r12,4
	jmp LB_11630
LB_11629:
	bts r12,4
LB_11630:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11625
	btr r12,3
	clc
	jmp LB_11626
LB_11625:
	bts r12,3
	stc
LB_11626:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11623
	btr r12,2
	clc
	jmp LB_11624
LB_11623:
	bts r12,2
	stc
LB_11624:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11621
	btr r12,1
	clc
	jmp LB_11622
LB_11621:
	bts r12,1
	stc
LB_11622:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11619
	btr r12,0
	clc
	jmp LB_11620
LB_11619:
	bts r12,0
	stc
LB_11620:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_11571 : %_11571
 ; {>  %_11567~2':_r64 %_11570~4':(_p1487)◂((_p1495)◂(_r64)) %_11560~0':_stg %_11561~1':_r64 %_11568~3':(_lst)◂({ _stg (_opn)◂(_r64) }) }
; 	» 0xr0 _ ⊢ 5' : %_11571
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f5600 { %_11560 %_11571 } ⊢ { %_11572 %_11573 %_11574 } : { %_11572 %_11573 %_11574 }
 ; {>  %_11567~2':_r64 %_11571~5':_r64 %_11570~4':(_p1487)◂((_p1495)◂(_r64)) %_11560~0':_stg %_11561~1':_r64 %_11568~3':(_lst)◂({ _stg (_opn)◂(_r64) }) }
; _f5600 { 0' 5' } ⊢ { 0' 5' 6' }
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
	jc LB_11639
	btr r12,1
	jmp LB_11640
LB_11639:
	bts r12,1
LB_11640:
	call NS_E_5600
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 5' 6' }
	mov r11,r14
	bt r12,1
	jc LB_11641
	btr r12,5
	jmp LB_11642
LB_11641:
	bts r12,5
LB_11642:
	mov rcx,r9
	bt r12,3
	jc LB_11645
	btr r12,6
	jmp LB_11646
LB_11645:
	bts r12,6
LB_11646:
	mov rsi,1
	bt r12,6
	jc LB_11643
	mov rsi,0
	bt rcx,0
	jc LB_11643
	jmp LB_11644
LB_11643:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_11644:
	mov rax,r8
	shl rax,56
	or rax,1
	or rcx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_11637
	btr r12,4
	clc
	jmp LB_11638
LB_11637:
	bts r12,4
	stc
LB_11638:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_11635
	btr r12,3
	clc
	jmp LB_11636
LB_11635:
	bts r12,3
	stc
LB_11636:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11633
	btr r12,2
	clc
	jmp LB_11634
LB_11633:
	bts r12,2
	stc
LB_11634:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11631
	btr r12,1
	clc
	jmp LB_11632
LB_11631:
	bts r12,1
	stc
LB_11632:
	add rsp,40
MTC_LB_11647:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11648
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
	jnc LB_11649
	bt QWORD [rdi],0
	jc LB_11650
	btr r12,8
	clc
	jmp LB_11651
LB_11650:
	bts r12,8
	stc
LB_11651:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11649:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11652
	btr r12,7
	jmp LB_11653
LB_11652:
	bts r12,7
LB_11653:
LB_11654:
	cmp r15,0
	jz LB_11655
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11654
LB_11655:
; _f10669 { %_11568 %_11575 } ⊢ { %_11576 %_11577 } : { %_11576 %_11577 }
 ; {>  %_11567~2':_r64 %_11572~0':_stg %_11570~4':(_p1487)◂((_p1495)◂(_r64)) %_11561~1':_r64 %_11575~7':(_p1487)◂((_p1494)◂(_stg)) %_11573~5':_r64 %_11568~3':(_lst)◂({ _stg (_opn)◂(_r64) }) }
; _f10669 { 3' 7' } ⊢ { 3' 6' }
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
	jc LB_11666
	btr r12,0
	jmp LB_11667
LB_11666:
	bts r12,0
LB_11667:
	mov r14,rdx
	bt r12,7
	jc LB_11668
	btr r12,1
	jmp LB_11669
LB_11668:
	bts r12,1
LB_11669:
	call NS_E_10669
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 6' }
	mov r9,r13
	bt r12,0
	jc LB_11670
	btr r12,3
	jmp LB_11671
LB_11670:
	bts r12,3
LB_11671:
	mov rcx,r14
	bt r12,1
	jc LB_11672
	btr r12,6
	jmp LB_11673
LB_11672:
	bts r12,6
LB_11673:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_11664
	btr r12,5
	clc
	jmp LB_11665
LB_11664:
	bts r12,5
	stc
LB_11665:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_11662
	btr r12,4
	clc
	jmp LB_11663
LB_11662:
	bts r12,4
	stc
LB_11663:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11660
	btr r12,2
	clc
	jmp LB_11661
LB_11660:
	bts r12,2
	stc
LB_11661:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11658
	btr r12,1
	clc
	jmp LB_11659
LB_11658:
	bts r12,1
	stc
LB_11659:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11656
	btr r12,0
	clc
	jmp LB_11657
LB_11656:
	bts r12,0
	stc
LB_11657:
	add rsp,48
; _f38 %_11577 ⊢ %_11578 : %_11578
 ; {>  %_11567~2':_r64 %_11572~0':_stg %_11570~4':(_p1487)◂((_p1495)◂(_r64)) %_11576~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_11561~1':_r64 %_11573~5':_r64 %_11577~6':(_p1487)◂((_p1494)◂(_r64)) }
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
	jc LB_11686
	btr r12,0
	jmp LB_11687
LB_11686:
	bts r12,0
LB_11687:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_11688
	btr r12,6
	jmp LB_11689
LB_11688:
	bts r12,6
LB_11689:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_11684
	btr r12,5
	clc
	jmp LB_11685
LB_11684:
	bts r12,5
	stc
LB_11685:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_11682
	btr r12,4
	clc
	jmp LB_11683
LB_11682:
	bts r12,4
	stc
LB_11683:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_11680
	btr r12,3
	clc
	jmp LB_11681
LB_11680:
	bts r12,3
	stc
LB_11681:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_11678
	btr r12,2
	clc
	jmp LB_11679
LB_11678:
	bts r12,2
	stc
LB_11679:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11676
	btr r12,1
	clc
	jmp LB_11677
LB_11676:
	bts r12,1
	stc
LB_11677:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11674
	btr r12,0
	clc
	jmp LB_11675
LB_11674:
	bts r12,0
	stc
LB_11675:
	add rsp,56
; ∎ {  }
 ; {>  %_11567~2':_r64 %_11578~6':(_p1487)◂((_p1494)◂(_r64)) %_11572~0':_stg %_11570~4':(_p1487)◂((_p1495)◂(_r64)) %_11576~3':(_lst)◂({ _stg (_opn)◂(_r64) }) %_11561~1':_r64 %_11573~5':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_11690
	mov rdi,r8
	call dlt
LB_11690:
	bt r12,6
	jc LB_11691
	mov rdi,rcx
	call dlt
LB_11691:
	bt r12,0
	jc LB_11692
	mov rdi,r13
	call dlt
LB_11692:
	bt r12,4
	jc LB_11693
	mov rdi,r10
	call dlt
LB_11693:
	bt r12,3
	jc LB_11694
	mov rdi,r9
	call dlt
LB_11694:
	bt r12,1
	jc LB_11695
	mov rdi,r14
	call dlt
LB_11695:
	bt r12,5
	jc LB_11696
	mov rdi,r11
	call dlt
LB_11696:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_11648:
	mov r15,0
LB_11698:
	cmp r15,0
	jz LB_11699
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11698
LB_11699:
	jmp err
MTC_LB_11697:
MTC_LB_11595:
	mov r15,0
LB_11701:
	cmp r15,0
	jz LB_11702
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11701
LB_11702:
	jmp err
MTC_LB_11700:
section .data
	CST_DYN_11197:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_11579:
		dq 0x0000_0001_00_82_ffff
		dq 1
