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
	call NS_E_687
	call NS_E_799
	call exec_out
	jmp _end
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
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
NS_E_676:
NS_E_RDI_676:
NS_E_676_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_677
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_677:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_679:
NS_E_RDI_679:
NS_E_679_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_679_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_679_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_680:
NS_E_RDI_680:
NS_E_680_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_680_LB_0
	cmp r11,57
	ja NS_E_680_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_680_LB_0:
	mov rax,0
	ret
NS_E_682:
NS_E_RDI_682:
NS_E_682_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_682_LB_0
	cmp r11,122
	ja NS_E_682_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_682_LB_0:
	mov rax,0
	ret
NS_E_681:
NS_E_RDI_681:
NS_E_681_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_681_LB_0
	cmp r11,90
	ja NS_E_681_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_681_LB_0:
	mov rax,0
	ret
NS_E_31:
	mov rdi,r13
	bt r12,0
NS_E_RDI_31:
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
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_678:
NS_E_RDI_678:
NS_E_678_ETR_TBL:
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
	jz NS_E_678_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_678_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_687:
NS_E_RDI_687:
; 	» "-27686gg" _ ⊢ 0' : %_683
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » _f14 |~ {  } ⊢ %_684 : %_684
 ; {>  %_683~0':_stg }
; 	» _args _ ⊢ 1' : %_684
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
; _f24 %_684 ⊢ %_685 : %_685
 ; {>  %_684~1':(_lst)◂(_stg) %_683~0':_stg }
; _f24 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_690
	btr r12,0
	jmp LB_691
LB_690:
	bts r12,0
LB_691:
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_692
	btr r12,1
	jmp LB_693
LB_692:
	bts r12,1
LB_693:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_688
	btr r12,0
	jmp LB_689
LB_688:
	bts r12,0
LB_689:
	add rsp,16
; _f24 %_683 ⊢ %_686 : %_686
 ; {>  %_683~0':_stg %_685~1':(_lst)◂(_stg) }
; _f24 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_694
	btr r12,1
	jmp LB_695
LB_694:
	bts r12,1
LB_695:
	add rsp,16
; ∎ {  }
 ; {>  %_686~0':_stg %_685~1':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_696
	mov rdi,r13
	call dlt
LB_696:
	bt r12,1
	jc LB_697
	mov rdi,r14
	call dlt
LB_697:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_705:
; 	|» 0'
NS_E_RDI_705:
MTC_LB_706:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_707
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
	jnc LB_708
	bt QWORD [rax],0
	jc LB_709
	btr r12,3
	jmp LB_710
LB_709:
	bts r12,3
LB_710:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_708:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_713
	btr r12,4
	jmp LB_714
LB_713:
	bts r12,4
LB_714:
	mov r14,r10
	bt r12,4
	jc LB_711
	btr r12,1
	jmp LB_712
LB_711:
	bts r12,1
LB_712:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_717
	btr r12,4
	jmp LB_718
LB_717:
	bts r12,4
LB_718:
	mov r8,r10
	bt r12,4
	jc LB_715
	btr r12,2
	jmp LB_716
LB_715:
	bts r12,2
LB_716:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_707
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
	jnc LB_719
	bt QWORD [rax],0
	jc LB_720
	btr r12,5
	jmp LB_721
LB_720:
	bts r12,5
LB_721:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_719:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_724
	btr r12,6
	jmp LB_725
LB_724:
	bts r12,6
LB_725:
	mov r9,rcx
	bt r12,6
	jc LB_722
	btr r12,3
	jmp LB_723
LB_722:
	bts r12,3
LB_723:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_728
	btr r12,6
	jmp LB_729
LB_728:
	bts r12,6
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
; ∎ {  }
 ; {>  %_701~3':t250'(-1) %_702~4':(_lst)◂(t250'(-1)) %_699~1':t250'(-1) }
; 	∎ {  }
	bt r12,3
	jc LB_732
	mov rdi,r9
	call dlt
LB_732:
	bt r12,4
	jc LB_733
	mov rdi,r10
	call dlt
LB_733:
	bt r12,1
	jc LB_734
	mov rdi,r14
	call dlt
LB_734:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_707:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_735
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
	jnc LB_736
	bt QWORD [rax],0
	jc LB_737
	btr r12,3
	jmp LB_738
LB_737:
	bts r12,3
LB_738:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_736:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
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
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
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
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_735
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
	jnc LB_747
	bt QWORD [rax],0
	jc LB_748
	btr r12,3
	jmp LB_749
LB_748:
	bts r12,3
LB_749:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_747:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_750:
	cmp r15,0
	jz LB_751
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_750
LB_751:
; ∎ {  }
 ; {>  %_703~1':t250'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_752
	mov rdi,r14
	call dlt
LB_752:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_735:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_753
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
	jnc LB_754
	bt QWORD [rax],0
	jc LB_755
	btr r12,1
	jmp LB_756
LB_755:
	bts r12,1
LB_756:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_754:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_757:
	cmp r15,0
	jz LB_758
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_757
LB_758:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_753:
NS_E_760:
NS_E_RDI_760:
NS_E_760_ETR_TBL:
NS_E_760_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_789
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_789
	jmp LB_790
LB_789:
	jmp LB_763
LB_790:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; g0
	push r10
	call NS_E_760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_781
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_782
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_782:
	jmp LB_764
LB_781:
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
	jc LB_775
	btr QWORD [rdi],1
LB_775:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_776
	btr QWORD [rdi],0
LB_776:
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
LB_764:
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
LB_763:
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
	jg LB_773
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_773
	jmp LB_774
LB_773:
	jmp LB_765
LB_774:
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
	jc LB_766
	btr QWORD [rdi],0
LB_766:
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
LB_765:
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
NS_E_799:
NS_E_RDI_799:
; 	» "AC" _ ⊢ 0' : %_791
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_43_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_792 : %_792
 ; {>  %_791~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_792
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f760 { %_791 %_792 } ⊢ { %_793 %_794 %_795 } : { %_793 %_794 %_795 }
 ; {>  %_792~1':_r64 %_791~0':_stg }
; _f760 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_760
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_800
	btr r12,4
	jmp LB_801
LB_800:
	bts r12,4
LB_801:
	mov r8,r9
	bt r12,3
	jc LB_804
	btr r12,2
	jmp LB_805
LB_804:
	bts r12,2
LB_805:
	mov rsi,1
	bt r12,2
	jc LB_802
	mov rsi,0
	bt r8,0
	jc LB_802
	jmp LB_803
LB_802:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_803:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f24 { %_793 %_794 %_795 } ⊢ { %_796 %_797 %_798 } : { %_796 %_797 %_798 }
 ; {>  %_795~2':(_opn)◂(_p759) %_793~0':_stg %_794~1':_r64 }
; _f24 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_806
	btr r12,3
	jmp LB_807
LB_806:
	bts r12,3
LB_807:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_810
	btr r12,4
	jmp LB_811
LB_810:
	bts r12,4
LB_811:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_808
	btr QWORD [rdi],0
	jmp LB_809
LB_808:
	bts QWORD [rdi],0
LB_809:
	mov r10,r14
	bt r12,1
	jc LB_814
	btr r12,4
	jmp LB_815
LB_814:
	bts r12,4
LB_815:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_812
	btr QWORD [rdi],1
	jmp LB_813
LB_812:
	bts QWORD [rdi],1
LB_813:
	mov r10,r8
	bt r12,2
	jc LB_818
	btr r12,4
	jmp LB_819
LB_818:
	bts r12,4
LB_819:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_816
	btr QWORD [rdi],2
	jmp LB_817
LB_816:
	bts QWORD [rdi],2
LB_817:
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_820
	btr r12,3
	jmp LB_821
LB_820:
	bts r12,3
LB_821:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_824
	btr r12,4
	jmp LB_825
LB_824:
	bts r12,4
LB_825:
	mov r13,r10
	bt r12,4
	jc LB_822
	btr r12,0
	jmp LB_823
LB_822:
	bts r12,0
LB_823:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_828
	btr r12,4
	jmp LB_829
LB_828:
	bts r12,4
LB_829:
	mov r14,r10
	bt r12,4
	jc LB_826
	btr r12,1
	jmp LB_827
LB_826:
	bts r12,1
LB_827:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_832
	btr r12,4
	jmp LB_833
LB_832:
	bts r12,4
LB_833:
	mov r8,r10
	bt r12,4
	jc LB_830
	btr r12,2
	jmp LB_831
LB_830:
	bts r12,2
LB_831:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_798~2':(_opn)◂(_p759) %_796~0':_stg %_797~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_834
	mov rdi,r8
	call dlt
LB_834:
	bt r12,0
	jc LB_835
	mov rdi,r13
	call dlt
LB_835:
	bt r12,1
	jc LB_836
	mov rdi,r14
	call dlt
LB_836:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_676:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_676
	NS_E_DYN_679:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_679
	NS_E_DYN_680:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_680
	NS_E_DYN_681:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_681
	NS_E_DYN_682:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_682
	CST_DYN_687:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_705:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_705
	CST_DYN_799:
		dq 0x0000_0001_00_82_ffff
		dq 1
