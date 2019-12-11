%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_65134
	call NS_E_67203
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
NS_E_63686:
NS_E_RDI_63686:
NS_E_63686_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_63687
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_63687:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_63689:
NS_E_RDI_63689:
NS_E_63689_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_63689_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_63689_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_63690:
NS_E_RDI_63690:
NS_E_63690_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_63690_LB_0
	cmp r11,57
	ja NS_E_63690_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_63690_LB_0:
	mov rax,0
	ret
NS_E_63692:
NS_E_RDI_63692:
NS_E_63692_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_63692_LB_0
	cmp r11,122
	ja NS_E_63692_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_63692_LB_0:
	mov rax,0
	ret
NS_E_63691:
NS_E_RDI_63691:
NS_E_63691_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_63691_LB_0
	cmp r11,90
	ja NS_E_63691_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_63691_LB_0:
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
NS_E_63688:
NS_E_RDI_63688:
NS_E_63688_ETR_TBL:
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
	jz NS_E_63688_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_63688_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_63706:
; 	|» { 0' 1' }
NS_E_RDI_63706:
MTC_LB_63707:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_63708
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
	jnc LB_63709
	bt QWORD [rax],0
	jc LB_63710
	btr r12,4
	jmp LB_63711
LB_63710:
	bts r12,4
LB_63711:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_63709:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_63714
	btr r12,5
	jmp LB_63715
LB_63714:
	bts r12,5
LB_63715:
	mov r8,r11
	bt r12,5
	jc LB_63712
	btr r12,2
	jmp LB_63713
LB_63712:
	bts r12,2
LB_63713:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_63718
	btr r12,5
	jmp LB_63719
LB_63718:
	bts r12,5
LB_63719:
	mov r9,r11
	bt r12,5
	jc LB_63716
	btr r12,3
	jmp LB_63717
LB_63716:
	bts r12,3
LB_63717:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_63720:
	cmp r15,0
	jz LB_63721
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_63720
LB_63721:
; _f39 %_63693 ⊢ %_63697 : %_63697
 ; {>  %_63695~2':_r64 %_63693~0':_r64 %_63696~3':(_lst)◂(_r64) }
	add r13,1
; _f63706 { %_63697 %_63696 } ⊢ { %_63698 %_63699 } : { %_63698 %_63699 }
 ; {>  %_63697~0':_r64 %_63695~2':_r64 %_63696~3':(_lst)◂(_r64) }
; _f63706 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_63724
	btr r12,1
	jmp LB_63725
LB_63724:
	bts r12,1
LB_63725:
	call NS_E_63706
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_63722
	btr r12,2
	jmp LB_63723
LB_63722:
	bts r12,2
LB_63723:
	add rsp,16
; _f38 %_63698 ⊢ %_63700 : %_63700
 ; {>  %_63699~1':_stg %_63695~2':_r64 %_63698~0':_r64 }
	sub r13,1
; _f16 { %_63699 %_63700 %_63695 } ⊢ { %_63701 %_63702 %_63703 } : { %_63701 %_63702 %_63703 }
 ; {>  %_63699~1':_stg %_63695~2':_r64 %_63700~0':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_63726
	btr r12,3
	jmp LB_63727
LB_63726:
	bts r12,3
LB_63727:
	mov r14,r13
	bt r12,0
	jc LB_63728
	btr r12,1
	jmp LB_63729
LB_63728:
	bts r12,1
LB_63729:
	mov r13,r9
	bt r12,3
	jc LB_63730
	btr r12,0
	jmp LB_63731
LB_63730:
	bts r12,0
LB_63731:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_63702 %_63701 }
 ; {>  %_63702~1':_r64 %_63701~0':_stg %_63703~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_63732
	mov rdi,r8
	call dlt
LB_63732:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_63733
	btr r12,2
	jmp LB_63734
LB_63733:
	bts r12,2
LB_63734:
	mov r14,r13
	bt r12,0
	jc LB_63735
	btr r12,1
	jmp LB_63736
LB_63735:
	bts r12,1
LB_63736:
	mov r13,r8
	bt r12,2
	jc LB_63737
	btr r12,0
	jmp LB_63738
LB_63737:
	bts r12,0
LB_63738:
	ret
MTC_LB_63708:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_63739
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
	jnc LB_63740
	bt QWORD [rax],0
	jc LB_63741
	btr r12,2
	jmp LB_63742
LB_63741:
	bts r12,2
LB_63742:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_63740:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_63743:
	cmp r15,0
	jz LB_63744
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_63743
LB_63744:
; _f14 %_63693 ⊢ { %_63704 %_63705 } : { %_63704 %_63705 }
 ; {>  %_63693~0':_r64 }
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
; ∎ { %_63704 %_63705 }
 ; {>  %_63705~1':_stg %_63704~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_63739:
NS_E_63749:
; 	|» 0'
NS_E_RDI_63749:
; » 0xr0 |~ {  } ⊢ %_63746 : %_63746
 ; {>  %_63745~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_63746
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f63706 { %_63746 %_63745 } ⊢ { %_63747 %_63748 } : { %_63747 %_63748 }
 ; {>  %_63745~0':(_lst)◂(_r64) %_63746~1':_r64 }
; _f63706 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_63750
	btr r12,2
	jmp LB_63751
LB_63750:
	bts r12,2
LB_63751:
	mov r14,r13
	bt r12,0
	jc LB_63752
	btr r12,1
	jmp LB_63753
LB_63752:
	bts r12,1
LB_63753:
	mov r13,r8
	bt r12,2
	jc LB_63754
	btr r12,0
	jmp LB_63755
LB_63754:
	bts r12,0
LB_63755:
	call NS_E_63706
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_63748
 ; {>  %_63747~0':_r64 %_63748~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_63756
	mov rdi,r13
	call dlt
LB_63756:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_63757
	btr r12,0
	jmp LB_63758
LB_63757:
	bts r12,0
LB_63758:
	ret
NS_E_63759:
NS_E_RDI_63759:
NS_E_63759_ETR_TBL:
NS_E_63759_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_63800
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_63800
	jmp LB_63801
LB_63800:
	jmp LB_63790
LB_63801:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_63760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_63805
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_63806
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_63806:
	jmp LB_63790
LB_63805:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_63793
	btr r12,1
	jmp LB_63794
LB_63793:
	bts r12,1
LB_63794:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_63791
	btr r12,0
	jmp LB_63792
LB_63791:
	bts r12,0
LB_63792:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_63787
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_63808
	btr r12,2
	jmp LB_63809
LB_63808:
	bts r12,2
LB_63809:
	mov r13,r14
	bt r12,1
	jc LB_63810
	btr r12,0
	jmp LB_63811
LB_63810:
	bts r12,0
LB_63811:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f63749 %_63762 ⊢ %_63763 : %_63763
 ; {>  %_63762~0':(_lst)◂(_r64) }
; _f63749 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_63749
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_63763 ⊢ %_63764 : %_63764
 ; {>  %_63763~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_63764
 ; {>  %_63764~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_63785
	btr r12,3
	jmp LB_63786
LB_63785:
	bts r12,3
LB_63786:
	mov r8,0
	bts r12,2
	ret
LB_63787:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63789
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63788
LB_63789:
	add rsp,8
	ret
LB_63790:
	add rsp,32
	pop r14
LB_63788:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_63760:
NS_E_RDI_63760:
NS_E_63760_ETR_TBL:
NS_E_63760_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_63837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_63837
	jmp LB_63838
LB_63837:
	jmp LB_63825
LB_63838:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_63761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_63842
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_63843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_63843:
	jmp LB_63825
LB_63842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_63760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_63848
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_63849
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_63849:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_63850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_63850:
	jmp LB_63825
LB_63848:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_63830
	btr r12,2
	jmp LB_63831
LB_63830:
	bts r12,2
LB_63831:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_63828
	btr r12,1
	jmp LB_63829
LB_63828:
	bts r12,1
LB_63829:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_63826
	btr r12,0
	jmp LB_63827
LB_63826:
	bts r12,0
LB_63827:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_63822
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_63852
	btr r12,3
	jmp LB_63853
LB_63852:
	bts r12,3
LB_63853:
	mov r14,r8
	bt r12,2
	jc LB_63854
	btr r12,1
	jmp LB_63855
LB_63854:
	bts r12,1
LB_63855:
	mov r8,r13
	bt r12,0
	jc LB_63856
	btr r12,2
	jmp LB_63857
LB_63856:
	bts r12,2
LB_63857:
	mov r13,r9
	bt r12,3
	jc LB_63858
	btr r12,0
	jmp LB_63859
LB_63858:
	bts r12,0
LB_63859:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_63765 %_63766 } ⊢ %_63767 : %_63767
 ; {>  %_63766~1':(_lst)◂(_r64) %_63765~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_63767 ⊢ %_63768 : %_63768
 ; {>  %_63767~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_63768
 ; {>  %_63768~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_63816
	btr r12,2
	jmp LB_63817
LB_63816:
	bts r12,2
LB_63817:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_63814
	btr QWORD [rdi],0
	jmp LB_63815
LB_63814:
	bts QWORD [rdi],0
LB_63815:
	mov r8,r14
	bt r12,1
	jc LB_63820
	btr r12,2
	jmp LB_63821
LB_63820:
	bts r12,2
LB_63821:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_63818
	btr QWORD [rdi],1
	jmp LB_63819
LB_63818:
	bts QWORD [rdi],1
LB_63819:
	mov rsi,1
	bt r12,3
	jc LB_63812
	mov rsi,0
	bt r9,0
	jc LB_63812
	jmp LB_63813
LB_63812:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_63813:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_63822:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63824
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63823
LB_63824:
	add rsp,8
	ret
LB_63825:
	add rsp,48
	pop r14
LB_63823:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_63873
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_63873
	jmp LB_63874
LB_63873:
	jmp LB_63865
LB_63874:
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
	jc LB_63866
	btr r12,0
	jmp LB_63867
LB_63866:
	bts r12,0
LB_63867:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_63862
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_63769 : %_63769
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_63769 ⊢ %_63770 : %_63770
 ; {>  %_63769~°1◂{  }:(_lst)◂(t13483'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_63770
 ; {>  %_63770~°0◂°1◂{  }:(_opn)◂((_lst)◂(t13486'(0))) }
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
	jc LB_63860
	mov rsi,0
	bt r9,0
	jc LB_63860
	jmp LB_63861
LB_63860:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_63861:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_63862:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63864
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63863
LB_63864:
	add rsp,8
	ret
LB_63865:
	add rsp,16
	pop r14
LB_63863:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_63686_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_63896
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63888
LB_63896:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_63760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_63901
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_63902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_63902:
	jmp LB_63888
LB_63901:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_63891
	btr r12,1
	jmp LB_63892
LB_63891:
	bts r12,1
LB_63892:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_63889
	btr r12,0
	jmp LB_63890
LB_63889:
	bts r12,0
LB_63890:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_63885
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_63771 %_63772 } ⊢ %_63773 : %_63773
 ; {>  %_63772~1':(_lst)◂(_r64) %_63771~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_63773 ⊢ %_63774 : %_63774
 ; {>  %_63773~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_63774
 ; {>  %_63774~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_63879
	btr r12,2
	jmp LB_63880
LB_63879:
	bts r12,2
LB_63880:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_63877
	btr QWORD [rdi],0
	jmp LB_63878
LB_63877:
	bts QWORD [rdi],0
LB_63878:
	mov r8,r14
	bt r12,1
	jc LB_63883
	btr r12,2
	jmp LB_63884
LB_63883:
	bts r12,2
LB_63884:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_63881
	btr QWORD [rdi],1
	jmp LB_63882
LB_63881:
	bts QWORD [rdi],1
LB_63882:
	mov rsi,1
	bt r12,3
	jc LB_63875
	mov rsi,0
	bt r9,0
	jc LB_63875
	jmp LB_63876
LB_63875:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_63876:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_63885:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63887
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63886
LB_63887:
	add rsp,8
	ret
LB_63888:
	add rsp,32
	pop r14
LB_63886:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_63761:
NS_E_RDI_63761:
NS_E_63761_ETR_TBL:
NS_E_63761_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_63917
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_63917
	jmp LB_63918
LB_63917:
	jmp LB_63909
LB_63918:
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
	jc LB_63910
	btr r12,0
	jmp LB_63911
LB_63910:
	bts r12,0
LB_63911:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_63906
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_63775 : %_63775
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_63775
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_63775 ⊢ %_63776 : %_63776
 ; {>  %_63775~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_63776
 ; {>  %_63776~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_63904
	btr r12,3
	jmp LB_63905
LB_63904:
	bts r12,3
LB_63905:
	mov r8,0
	bts r12,2
	ret
LB_63906:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63908
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63907
LB_63908:
	add rsp,8
	ret
LB_63909:
	add rsp,16
	pop r14
LB_63907:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_63932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_63932
	jmp LB_63933
LB_63932:
	jmp LB_63924
LB_63933:
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
	jc LB_63925
	btr r12,0
	jmp LB_63926
LB_63925:
	bts r12,0
LB_63926:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_63921
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_63777 : %_63777
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_63777
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_63777 ⊢ %_63778 : %_63778
 ; {>  %_63777~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_63778
 ; {>  %_63778~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_63919
	btr r12,3
	jmp LB_63920
LB_63919:
	bts r12,3
LB_63920:
	mov r8,0
	bts r12,2
	ret
LB_63921:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63923
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63922
LB_63923:
	add rsp,8
	ret
LB_63924:
	add rsp,16
	pop r14
LB_63922:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_63947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_63947
	jmp LB_63948
LB_63947:
	jmp LB_63939
LB_63948:
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
	jc LB_63940
	btr r12,0
	jmp LB_63941
LB_63940:
	bts r12,0
LB_63941:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_63936
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_63779 : %_63779
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_63779
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_63779 ⊢ %_63780 : %_63780
 ; {>  %_63779~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_63780
 ; {>  %_63780~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_63934
	btr r12,3
	jmp LB_63935
LB_63934:
	bts r12,3
LB_63935:
	mov r8,0
	bts r12,2
	ret
LB_63936:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63938
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63937
LB_63938:
	add rsp,8
	ret
LB_63939:
	add rsp,16
	pop r14
LB_63937:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_63962
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_63962
	jmp LB_63963
LB_63962:
	jmp LB_63954
LB_63963:
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
	jc LB_63955
	btr r12,0
	jmp LB_63956
LB_63955:
	bts r12,0
LB_63956:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_63951
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_63781 : %_63781
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_63781
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_63781 ⊢ %_63782 : %_63782
 ; {>  %_63781~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_63782
 ; {>  %_63782~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_63949
	btr r12,3
	jmp LB_63950
LB_63949:
	bts r12,3
LB_63950:
	mov r8,0
	bts r12,2
	ret
LB_63951:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63953
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63952
LB_63953:
	add rsp,8
	ret
LB_63954:
	add rsp,16
	pop r14
LB_63952:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_63977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_63977
	jmp LB_63978
LB_63977:
	jmp LB_63969
LB_63978:
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
	jc LB_63970
	btr r12,0
	jmp LB_63971
LB_63970:
	bts r12,0
LB_63971:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_63966
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_63783 : %_63783
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_63783
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_63783 ⊢ %_63784 : %_63784
 ; {>  %_63783~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_63784
 ; {>  %_63784~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_63964
	btr r12,3
	jmp LB_63965
LB_63964:
	bts r12,3
LB_63965:
	mov r8,0
	bts r12,2
	ret
LB_63966:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_63968
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_63967
LB_63968:
	add rsp,8
	ret
LB_63969:
	add rsp,16
	pop r14
LB_63967:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_63979:
NS_E_RDI_63979:
NS_E_63979_ETR_TBL:
NS_E_63979_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_63686_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64016
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64010
LB_64016:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64011
	btr r12,0
	jmp LB_64012
LB_64011:
	bts r12,0
LB_64012:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64007
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_63981 : %_63981
 ; {>  %_63980~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_63981
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_63982 : %_63982
 ; {>  %_63981~1':_r64 %_63980~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_63982
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_63980 %_63981 } ⊢ { %_63983 %_63984 %_63985 } : { %_63983 %_63984 %_63985 }
 ; {>  %_63981~1':_r64 %_63982~2':_r64 %_63980~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_63982 %_63983 } ⊢ { %_63986 %_63987 %_63988 } : { %_63986 %_63987 %_63988 }
 ; {>  %_63985~3':_r64 %_63983~0':_r64 %_63982~2':_r64 %_63984~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_63991:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_63992
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_63992
LB_63993:
	cmp r15,0
	jz LB_63994
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_63993
LB_63994:
; _some %_63987 ⊢ %_63989 : %_63989
 ; {>  %_63986~2':_r64 %_63984~1':_r64 %_63987~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_63989
 ; {>  %_63986~2':_r64 %_63989~°0◂0':(_opn)◂(_r64) %_63984~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_63995
	mov rdi,r8
	call dlt
LB_63995:
	bt r12,1
	jc LB_63996
	mov rdi,r14
	call dlt
LB_63996:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_63997
	btr r12,3
	jmp LB_63998
LB_63997:
	bts r12,3
LB_63998:
	mov r8,0
	bts r12,2
	ret
MTC_LB_63992:
	mov r15,0
LB_64000:
	cmp r15,0
	jz LB_64001
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64000
LB_64001:
; _none {  } ⊢ %_63990 : %_63990
 ; {>  %_63988~4':_r64 %_63985~3':_r64 %_63986~2':_r64 %_63984~1':_r64 %_63987~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_63990
 ; {>  %_63990~°1◂{  }:(_opn)◂(t13561'(0)) %_63988~4':_r64 %_63985~3':_r64 %_63986~2':_r64 %_63984~1':_r64 %_63987~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_64002
	mov rdi,r10
	call dlt
LB_64002:
	bt r12,3
	jc LB_64003
	mov rdi,r9
	call dlt
LB_64003:
	bt r12,2
	jc LB_64004
	mov rdi,r8
	call dlt
LB_64004:
	bt r12,1
	jc LB_64005
	mov rdi,r14
	call dlt
LB_64005:
	bt r12,0
	jc LB_64006
	mov rdi,r13
	call dlt
LB_64006:
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
MTC_LB_63999:
LB_64007:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64009
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64008
LB_64009:
	add rsp,8
	ret
LB_64010:
	add rsp,16
	pop r14
LB_64008:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64018:
NS_E_RDI_64018:
NS_E_64018_ETR_TBL:
NS_E_64018_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_63686_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64055
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64049
LB_64055:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64050
	btr r12,0
	jmp LB_64051
LB_64050:
	bts r12,0
LB_64051:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64046
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_64020 : %_64020
 ; {>  %_64019~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_64020
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_64021 : %_64021
 ; {>  %_64020~1':_r64 %_64019~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_64021
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_64019 %_64020 } ⊢ { %_64022 %_64023 %_64024 } : { %_64022 %_64023 %_64024 }
 ; {>  %_64020~1':_r64 %_64019~0':_r64 %_64021~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_64021 %_64022 } ⊢ { %_64025 %_64026 %_64027 } : { %_64025 %_64026 %_64027 }
 ; {>  %_64023~1':_r64 %_64024~3':_r64 %_64021~2':_r64 %_64022~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_64030:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_64031
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_64031
LB_64032:
	cmp r15,0
	jz LB_64033
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64032
LB_64033:
; _some %_64026 ⊢ %_64028 : %_64028
 ; {>  %_64023~1':_r64 %_64025~2':_r64 %_64026~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64028
 ; {>  %_64028~°0◂0':(_opn)◂(_r64) %_64023~1':_r64 %_64025~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_64034
	mov rdi,r14
	call dlt
LB_64034:
	bt r12,2
	jc LB_64035
	mov rdi,r8
	call dlt
LB_64035:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64036
	btr r12,3
	jmp LB_64037
LB_64036:
	bts r12,3
LB_64037:
	mov r8,0
	bts r12,2
	ret
MTC_LB_64031:
	mov r15,0
LB_64039:
	cmp r15,0
	jz LB_64040
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64039
LB_64040:
; _none {  } ⊢ %_64029 : %_64029
 ; {>  %_64023~1':_r64 %_64025~2':_r64 %_64024~3':_r64 %_64027~4':_r64 %_64026~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_64029
 ; {>  %_64023~1':_r64 %_64025~2':_r64 %_64024~3':_r64 %_64027~4':_r64 %_64029~°1◂{  }:(_opn)◂(t13588'(0)) %_64026~0':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_64041
	mov rdi,r14
	call dlt
LB_64041:
	bt r12,2
	jc LB_64042
	mov rdi,r8
	call dlt
LB_64042:
	bt r12,3
	jc LB_64043
	mov rdi,r9
	call dlt
LB_64043:
	bt r12,4
	jc LB_64044
	mov rdi,r10
	call dlt
LB_64044:
	bt r12,0
	jc LB_64045
	mov rdi,r13
	call dlt
LB_64045:
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
MTC_LB_64038:
LB_64046:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64048
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64047
LB_64048:
	add rsp,8
	ret
LB_64049:
	add rsp,16
	pop r14
LB_64047:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64057:
NS_E_RDI_64057:
NS_E_64057_ETR_TBL:
NS_E_64057_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_63686_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64094
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64088
LB_64094:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64089
	btr r12,0
	jmp LB_64090
LB_64089:
	bts r12,0
LB_64090:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64085
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_64059 : %_64059
 ; {>  %_64058~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_64059
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_64060 : %_64060
 ; {>  %_64058~0':_r64 %_64059~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_64060
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_64058 %_64059 } ⊢ { %_64061 %_64062 %_64063 } : { %_64061 %_64062 %_64063 }
 ; {>  %_64060~2':_r64 %_64058~0':_r64 %_64059~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_64060 %_64061 } ⊢ { %_64064 %_64065 %_64066 } : { %_64064 %_64065 %_64066 }
 ; {>  %_64060~2':_r64 %_64062~1':_r64 %_64063~3':_r64 %_64061~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_64069:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_64070
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_64070
LB_64071:
	cmp r15,0
	jz LB_64072
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64071
LB_64072:
; _some %_64065 ⊢ %_64067 : %_64067
 ; {>  %_64065~0':_r64 %_64064~2':_r64 %_64062~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64067
 ; {>  %_64067~°0◂0':(_opn)◂(_r64) %_64064~2':_r64 %_64062~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_64073
	mov rdi,r8
	call dlt
LB_64073:
	bt r12,1
	jc LB_64074
	mov rdi,r14
	call dlt
LB_64074:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64075
	btr r12,3
	jmp LB_64076
LB_64075:
	bts r12,3
LB_64076:
	mov r8,0
	bts r12,2
	ret
MTC_LB_64070:
	mov r15,0
LB_64078:
	cmp r15,0
	jz LB_64079
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64078
LB_64079:
; _none {  } ⊢ %_64068 : %_64068
 ; {>  %_64066~4':_r64 %_64065~0':_r64 %_64064~2':_r64 %_64062~1':_r64 %_64063~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_64068
 ; {>  %_64066~4':_r64 %_64065~0':_r64 %_64064~2':_r64 %_64062~1':_r64 %_64063~3':_r64 %_64068~°1◂{  }:(_opn)◂(t13615'(0)) }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_64080
	mov rdi,r10
	call dlt
LB_64080:
	bt r12,0
	jc LB_64081
	mov rdi,r13
	call dlt
LB_64081:
	bt r12,2
	jc LB_64082
	mov rdi,r8
	call dlt
LB_64082:
	bt r12,1
	jc LB_64083
	mov rdi,r14
	call dlt
LB_64083:
	bt r12,3
	jc LB_64084
	mov rdi,r9
	call dlt
LB_64084:
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
MTC_LB_64077:
LB_64085:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64087
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64086
LB_64087:
	add rsp,8
	ret
LB_64088:
	add rsp,16
	pop r14
LB_64086:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64096:
NS_E_RDI_64096:
NS_E_64096_ETR_TBL:
NS_E_64096_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_64057_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64112
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64106
LB_64112:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64107
	btr r12,0
	jmp LB_64108
LB_64107:
	bts r12,0
LB_64108:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64103
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_64097 ⊢ %_64098 : %_64098
 ; {>  %_64097~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64098
 ; {>  %_64098~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64101
	btr r12,3
	jmp LB_64102
LB_64101:
	bts r12,3
LB_64102:
	mov r8,0
	bts r12,2
	ret
LB_64103:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64105
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64104
LB_64105:
	add rsp,8
	ret
LB_64106:
	add rsp,16
	pop r14
LB_64104:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_64018_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64125
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64119
LB_64125:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64120
	btr r12,0
	jmp LB_64121
LB_64120:
	bts r12,0
LB_64121:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64116
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_64099 ⊢ %_64100 : %_64100
 ; {>  %_64099~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64100
 ; {>  %_64100~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64114
	btr r12,3
	jmp LB_64115
LB_64114:
	bts r12,3
LB_64115:
	mov r8,0
	bts r12,2
	ret
LB_64116:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64118
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64117
LB_64118:
	add rsp,8
	ret
LB_64119:
	add rsp,16
	pop r14
LB_64117:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64127:
NS_E_RDI_64127:
NS_E_64127_ETR_TBL:
NS_E_64127_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_64096_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64172
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64164
LB_64172:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_64128_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64177
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64178
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64178:
	jmp LB_64164
LB_64177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64167
	btr r12,1
	jmp LB_64168
LB_64167:
	bts r12,1
LB_64168:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64165
	btr r12,0
	jmp LB_64166
LB_64165:
	bts r12,0
LB_64166:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_64161
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_64130 %_64131 } ⊢ %_64132 : %_64132
 ; {>  %_64131~1':(_lst)◂(_r64) %_64130~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f63749 %_64132 ⊢ %_64133 : %_64133
 ; {>  %_64132~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f63749 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_64147
	btr r12,2
	jmp LB_64148
LB_64147:
	bts r12,2
LB_64148:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_64153
	btr r12,3
	jmp LB_64154
LB_64153:
	bts r12,3
LB_64154:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_64151
	btr QWORD [rdi],0
	jmp LB_64152
LB_64151:
	bts QWORD [rdi],0
LB_64152:
	mov r9,r14
	bt r12,1
	jc LB_64157
	btr r12,3
	jmp LB_64158
LB_64157:
	bts r12,3
LB_64158:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_64155
	btr QWORD [rdi],1
	jmp LB_64156
LB_64155:
	bts QWORD [rdi],1
LB_64156:
	mov rsi,1
	bt r12,0
	jc LB_64149
	mov rsi,0
	bt r13,0
	jc LB_64149
	jmp LB_64150
LB_64149:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_64150:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_63749
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_64133 ⊢ %_64134 : %_64134
 ; {>  %_64133~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_64134
 ; {>  %_64134~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64159
	btr r12,3
	jmp LB_64160
LB_64159:
	bts r12,3
LB_64160:
	mov r8,0
	bts r12,2
	ret
LB_64161:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64163
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64162
LB_64163:
	add rsp,8
	ret
LB_64164:
	add rsp,32
	pop r14
LB_64162:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64128:
NS_E_RDI_64128:
NS_E_64128_ETR_TBL:
NS_E_64128_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_64129_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64201
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64193
LB_64201:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_64128_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64206
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64207:
	jmp LB_64193
LB_64206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64196
	btr r12,1
	jmp LB_64197
LB_64196:
	bts r12,1
LB_64197:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64194
	btr r12,0
	jmp LB_64195
LB_64194:
	bts r12,0
LB_64195:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_64190
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_64135 %_64136 } ⊢ %_64137 : %_64137
 ; {>  %_64135~0':_r64 %_64136~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_64137 ⊢ %_64138 : %_64138
 ; {>  %_64137~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_64138
 ; {>  %_64138~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_64184
	btr r12,2
	jmp LB_64185
LB_64184:
	bts r12,2
LB_64185:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_64182
	btr QWORD [rdi],0
	jmp LB_64183
LB_64182:
	bts QWORD [rdi],0
LB_64183:
	mov r8,r14
	bt r12,1
	jc LB_64188
	btr r12,2
	jmp LB_64189
LB_64188:
	bts r12,2
LB_64189:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_64186
	btr QWORD [rdi],1
	jmp LB_64187
LB_64186:
	bts QWORD [rdi],1
LB_64187:
	mov rsi,1
	bt r12,3
	jc LB_64180
	mov rsi,0
	bt r9,0
	jc LB_64180
	jmp LB_64181
LB_64180:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_64181:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_64190:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64192
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64191
LB_64192:
	add rsp,8
	ret
LB_64193:
	add rsp,32
	pop r14
LB_64191:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_64211
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_64139 : %_64139
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_64139 ⊢ %_64140 : %_64140
 ; {>  %_64139~°1◂{  }:(_lst)◂(t13659'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_64140
 ; {>  %_64140~°0◂°1◂{  }:(_opn)◂((_lst)◂(t13662'(0))) }
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
	jc LB_64209
	mov rsi,0
	bt r9,0
	jc LB_64209
	jmp LB_64210
LB_64209:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_64210:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_64211:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64213
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64212
LB_64213:
	add rsp,8
	ret
LB_64214:
	add rsp,0
	pop r14
LB_64212:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64129:
NS_E_RDI_64129:
NS_E_64129_ETR_TBL:
NS_E_64129_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_64096_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64226
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64220
LB_64226:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64221
	btr r12,0
	jmp LB_64222
LB_64221:
	bts r12,0
LB_64222:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64217
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_64141 ⊢ %_64142 : %_64142
 ; {>  %_64141~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64142
 ; {>  %_64142~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64215
	btr r12,3
	jmp LB_64216
LB_64215:
	bts r12,3
LB_64216:
	mov r8,0
	bts r12,2
	ret
LB_64217:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64219
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64218
LB_64219:
	add rsp,8
	ret
LB_64220:
	add rsp,16
	pop r14
LB_64218:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_63979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64239
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64233
LB_64239:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64234
	btr r12,0
	jmp LB_64235
LB_64234:
	bts r12,0
LB_64235:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64230
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_64143 ⊢ %_64144 : %_64144
 ; {>  %_64143~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64144
 ; {>  %_64144~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64228
	btr r12,3
	jmp LB_64229
LB_64228:
	bts r12,3
LB_64229:
	mov r8,0
	bts r12,2
	ret
LB_64230:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64232
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64231
LB_64232:
	add rsp,8
	ret
LB_64233:
	add rsp,16
	pop r14
LB_64231:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_64254
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_64254
	jmp LB_64255
LB_64254:
	jmp LB_64246
LB_64255:
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
	jc LB_64247
	btr r12,0
	jmp LB_64248
LB_64247:
	bts r12,0
LB_64248:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64243
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_64145 : %_64145
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_64145
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_64145 ⊢ %_64146 : %_64146
 ; {>  %_64145~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64146
 ; {>  %_64146~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64241
	btr r12,3
	jmp LB_64242
LB_64241:
	bts r12,3
LB_64242:
	mov r8,0
	bts r12,2
	ret
LB_64243:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64245
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64244
LB_64245:
	add rsp,8
	ret
LB_64246:
	add rsp,16
	pop r14
LB_64244:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64256:
NS_E_RDI_64256:
NS_E_64256_ETR_TBL:
NS_E_64256_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_64277
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_64277
	jmp LB_64278
LB_64277:
	jmp LB_64267
LB_64278:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_64128_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64282
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64283
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64283:
	jmp LB_64267
LB_64282:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64270
	btr r12,1
	jmp LB_64271
LB_64270:
	bts r12,1
LB_64271:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64268
	btr r12,0
	jmp LB_64269
LB_64268:
	bts r12,0
LB_64269:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_64264
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_64285
	btr r12,2
	jmp LB_64286
LB_64285:
	bts r12,2
LB_64286:
	mov r13,r14
	bt r12,1
	jc LB_64287
	btr r12,0
	jmp LB_64288
LB_64287:
	bts r12,0
LB_64288:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f63749 %_64257 ⊢ %_64258 : %_64258
 ; {>  %_64257~0':(_lst)◂(_r64) }
; _f63749 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_63749
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_64258 ⊢ %_64259 : %_64259
 ; {>  %_64258~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_64259
 ; {>  %_64259~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64262
	btr r12,3
	jmp LB_64263
LB_64262:
	bts r12,3
LB_64263:
	mov r8,0
	bts r12,2
	ret
LB_64264:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64266
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64265
LB_64266:
	add rsp,8
	ret
LB_64267:
	add rsp,32
	pop r14
LB_64265:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64300
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64294
LB_64300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64295
	btr r12,0
	jmp LB_64296
LB_64295:
	bts r12,0
LB_64296:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64291
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_64260 ⊢ %_64261 : %_64261
 ; {>  %_64260~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_64261
 ; {>  %_64261~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64289
	btr r12,3
	jmp LB_64290
LB_64289:
	bts r12,3
LB_64290:
	mov r8,0
	bts r12,2
	ret
LB_64291:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64293
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64292
LB_64293:
	add rsp,8
	ret
LB_64294:
	add rsp,16
	pop r14
LB_64292:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64303:
NS_E_RDI_64303:
NS_E_64303_ETR_TBL:
NS_E_64303_TBL:
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
LB_64312:
	jmp LB_64309
LB_64308:
	add r14,1
LB_64309:
	cmp r14,r10
	jge LB_64310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_64308
	cmp al,10
	jz LB_64308
	cmp al,32
	jz LB_64308
LB_64310:
	push r10
	push rsi
	call NS_E_64127_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_64311
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_64313
	bts QWORD [rax],0
LB_64313:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_64312
LB_64311:
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
	jc LB_64306
	btr QWORD [rdi],0
LB_64306:
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
LB_64305:
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
NS_E_64323:
NS_E_RDI_64323:
NS_E_64323_ETR_TBL:
NS_E_64323_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_64425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_64425
	jmp LB_64426
LB_64425:
	jmp LB_64417
LB_64426:
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
	jc LB_64418
	btr r12,0
	jmp LB_64419
LB_64418:
	bts r12,0
LB_64419:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64414
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_64327 : %_64327
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_64327
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_64327 ⊢ %_64328 : %_64328
 ; {>  %_64327~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64328
 ; {>  %_64328~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64412
	btr r12,3
	jmp LB_64413
LB_64412:
	bts r12,3
LB_64413:
	mov r8,0
	bts r12,2
	ret
LB_64414:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64416
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64415
LB_64416:
	add rsp,8
	ret
LB_64417:
	add rsp,16
	pop r14
LB_64415:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_63686_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64441
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64433
LB_64441:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_64323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64446
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64447
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64447:
	jmp LB_64433
LB_64446:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64436
	btr r12,1
	jmp LB_64437
LB_64436:
	bts r12,1
LB_64437:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64434
	btr r12,0
	jmp LB_64435
LB_64434:
	bts r12,0
LB_64435:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_64430
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 %_64330 ⊢ %_64331 : %_64331
 ; {>  %_64329~0':_r64 %_64330~1':_r64 }
	add r14,1
; _some %_64331 ⊢ %_64332 : %_64332
 ; {>  %_64331~1':_r64 %_64329~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_64332
 ; {>  %_64332~°0◂1':(_opn)◂(_r64) %_64329~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_64427
	mov rdi,r13
	call dlt
LB_64427:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_64428
	btr r12,3
	jmp LB_64429
LB_64428:
	bts r12,3
LB_64429:
	mov r8,0
	bts r12,2
	ret
LB_64430:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64432
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64431
LB_64432:
	add rsp,8
	ret
LB_64433:
	add rsp,32
	pop r14
LB_64431:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64324:
NS_E_RDI_64324:
NS_E_64324_ETR_TBL:
NS_E_64324_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_64462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_64462
	jmp LB_64463
LB_64462:
	jmp LB_64454
LB_64463:
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
	jc LB_64455
	btr r12,0
	jmp LB_64456
LB_64455:
	bts r12,0
LB_64456:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64451
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_64333 : %_64333
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_64333
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_64333 ⊢ %_64334 : %_64334
 ; {>  %_64333~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64334
 ; {>  %_64334~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64449
	btr r12,3
	jmp LB_64450
LB_64449:
	bts r12,3
LB_64450:
	mov r8,0
	bts r12,2
	ret
LB_64451:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64453
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64452
LB_64453:
	add rsp,8
	ret
LB_64454:
	add rsp,16
	pop r14
LB_64452:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_64477
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_64477
	jmp LB_64478
LB_64477:
	jmp LB_64469
LB_64478:
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
	jc LB_64470
	btr r12,0
	jmp LB_64471
LB_64470:
	bts r12,0
LB_64471:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_64466
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_64335 : %_64335
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_64335
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_64335 ⊢ %_64336 : %_64336
 ; {>  %_64335~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64336
 ; {>  %_64336~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64464
	btr r12,3
	jmp LB_64465
LB_64464:
	bts r12,3
LB_64465:
	mov r8,0
	bts r12,2
	ret
LB_64466:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64468
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64467
LB_64468:
	add rsp,8
	ret
LB_64469:
	add rsp,16
	pop r14
LB_64467:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_64481
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_64337 : %_64337
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_64337
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_64337 ⊢ %_64338 : %_64338
 ; {>  %_64337~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64338
 ; {>  %_64338~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64479
	btr r12,3
	jmp LB_64480
LB_64479:
	bts r12,3
LB_64480:
	mov r8,0
	bts r12,2
	ret
LB_64481:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64483
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64482
LB_64483:
	add rsp,8
	ret
LB_64484:
	add rsp,0
	pop r14
LB_64482:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64325:
NS_E_RDI_64325:
NS_E_64325_ETR_TBL:
NS_E_64325_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_64324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64527
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64511
LB_64527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_64535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_64535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_64535
	jmp LB_64536
LB_64535:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64533
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64533:
	jmp LB_64511
LB_64536:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_64324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64540
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64541
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64541:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64542
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64542:
	jmp LB_64511
LB_64540:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_64552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_64552
	jmp LB_64553
LB_64552:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64548
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64548:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64549
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64549:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64550
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64550:
	jmp LB_64511
LB_64553:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_64326_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64557
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_64558
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_64558:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64559
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64559:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64560
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64560:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64561
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64561:
	jmp LB_64511
LB_64557:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_64325_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64566
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_64567
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_64567:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_64568
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_64568:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64569
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64569:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64570
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64570:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64571:
	jmp LB_64511
LB_64566:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_64522
	btr r12,5
	jmp LB_64523
LB_64522:
	bts r12,5
LB_64523:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_64520
	btr r12,4
	jmp LB_64521
LB_64520:
	bts r12,4
LB_64521:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_64518
	btr r12,3
	jmp LB_64519
LB_64518:
	bts r12,3
LB_64519:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_64516
	btr r12,2
	jmp LB_64517
LB_64516:
	bts r12,2
LB_64517:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64514
	btr r12,1
	jmp LB_64515
LB_64514:
	bts r12,1
LB_64515:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64512
	btr r12,0
	jmp LB_64513
LB_64512:
	bts r12,0
LB_64513:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_64508
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_64573
	btr r12,6
	jmp LB_64574
LB_64573:
	bts r12,6
LB_64574:
	mov r8,r10
	bt r12,4
	jc LB_64575
	btr r12,2
	jmp LB_64576
LB_64575:
	bts r12,2
LB_64576:
	mov rdx,r14
	bt r12,1
	jc LB_64577
	btr r12,7
	jmp LB_64578
LB_64577:
	bts r12,7
LB_64578:
	mov r14,rcx
	bt r12,6
	jc LB_64579
	btr r12,1
	jmp LB_64580
LB_64579:
	bts r12,1
LB_64580:
	mov rcx,r9
	bt r12,3
	jc LB_64581
	btr r12,6
	jmp LB_64582
LB_64581:
	bts r12,6
LB_64582:
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_64585
	btr r12,8
	jmp LB_64586
LB_64585:
	bts r12,8
LB_64586:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_64583
	btr r12,3
	jmp LB_64584
LB_64583:
	bts r12,3
LB_64584:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_64589
	btr r12,8
	jmp LB_64590
LB_64589:
	bts r12,8
LB_64590:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_64587
	btr r12,4
	jmp LB_64588
LB_64587:
	bts r12,4
LB_64588:
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
; » 0xr3 |~ {  } ⊢ %_64344 : %_64344
 ; {>  %_64340~1':_r64 %_64341~2':_r64 %_64343~4':(_lst)◂(_p64320) %_64342~3':_r64 %_64339~0':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_64344
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f34 { %_64344 %_64339 } ⊢ { %_64345 %_64346 } : { %_64345 %_64346 }
 ; {>  %_64340~1':_r64 %_64341~2':_r64 %_64343~4':(_lst)◂(_p64320) %_64344~5':_r64 %_64342~3':_r64 %_64339~0':_r64 }
	add r11,r13
; _f34 { %_64345 %_64340 } ⊢ { %_64347 %_64348 } : { %_64347 %_64348 }
 ; {>  %_64340~1':_r64 %_64345~5':_r64 %_64341~2':_r64 %_64343~4':(_lst)◂(_p64320) %_64342~3':_r64 %_64346~0':_r64 }
	add r11,r14
; _f34 { %_64347 %_64341 } ⊢ { %_64349 %_64350 } : { %_64349 %_64350 }
 ; {>  %_64341~2':_r64 %_64343~4':(_lst)◂(_p64320) %_64348~1':_r64 %_64347~5':_r64 %_64342~3':_r64 %_64346~0':_r64 }
	add r11,r8
; _f64321 %_64349 ⊢ %_64351 : %_64351
 ; {>  %_64349~5':_r64 %_64343~4':(_lst)◂(_p64320) %_64348~1':_r64 %_64342~3':_r64 %_64350~2':_r64 %_64346~0':_r64 }
; _f64321 5' ⊢ °0◂5'
; _cns { %_64351 %_64343 } ⊢ %_64352 : %_64352
 ; {>  %_64351~°0◂5':_p64320 %_64343~4':(_lst)◂(_p64320) %_64348~1':_r64 %_64342~3':_r64 %_64350~2':_r64 %_64346~0':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_64342 %_64352 } ⊢ %_64353 : %_64353
 ; {>  %_64348~1':_r64 %_64352~°0◂{ °0◂5' 4' }:(_lst)◂(_p64320) %_64342~3':_r64 %_64350~2':_r64 %_64346~0':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_64353
 ; {>  %_64353~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p64320) }) %_64348~1':_r64 %_64350~2':_r64 %_64346~0':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_64485
	mov rdi,r14
	call dlt
LB_64485:
	bt r12,2
	jc LB_64486
	mov rdi,r8
	call dlt
LB_64486:
	bt r12,0
	jc LB_64487
	mov rdi,r13
	call dlt
LB_64487:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_64488
	btr r12,0
	jmp LB_64489
LB_64488:
	bts r12,0
LB_64489:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_64492
	btr r12,1
	jmp LB_64493
LB_64492:
	bts r12,1
LB_64493:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_64490
	btr QWORD [rdi],0
	jmp LB_64491
LB_64490:
	bts QWORD [rdi],0
LB_64491:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_64502
	btr r12,0
	jmp LB_64503
LB_64502:
	bts r12,0
LB_64503:
	mov rsi,1
	bt r12,0
	jc LB_64500
	mov rsi,0
	bt r13,0
	jc LB_64500
	jmp LB_64501
LB_64500:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_64501:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_64498
	btr QWORD [rdi],0
	jmp LB_64499
LB_64498:
	bts QWORD [rdi],0
LB_64499:
	mov r13,r10
	bt r12,4
	jc LB_64506
	btr r12,0
	jmp LB_64507
LB_64506:
	bts r12,0
LB_64507:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_64504
	btr QWORD [rdi],1
	jmp LB_64505
LB_64504:
	bts QWORD [rdi],1
LB_64505:
	mov rsi,1
	bt r12,1
	jc LB_64496
	mov rsi,0
	bt r14,0
	jc LB_64496
	jmp LB_64497
LB_64496:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_64497:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_64494
	btr QWORD [rdi],1
	jmp LB_64495
LB_64494:
	bts QWORD [rdi],1
LB_64495:
	mov r8,0
	bts r12,2
	ret
LB_64508:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64510
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64509
LB_64510:
	add rsp,8
	ret
LB_64511:
	add rsp,96
	pop r14
LB_64509:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_64324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64628
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64616
LB_64628:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_64636
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_64636
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_64636
	jmp LB_64637
LB_64636:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64634
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64634:
	jmp LB_64616
LB_64637:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_64323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64641
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64642
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64642:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64643
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64643:
	jmp LB_64616
LB_64641:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_64325_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64648
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64649
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64649:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64650
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64650:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64651
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64651:
	jmp LB_64616
LB_64648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_64623
	btr r12,3
	jmp LB_64624
LB_64623:
	bts r12,3
LB_64624:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_64621
	btr r12,2
	jmp LB_64622
LB_64621:
	bts r12,2
LB_64622:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64619
	btr r12,1
	jmp LB_64620
LB_64619:
	bts r12,1
LB_64620:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64617
	btr r12,0
	jmp LB_64618
LB_64617:
	bts r12,0
LB_64618:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_64613
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_64653
	btr r12,4
	jmp LB_64654
LB_64653:
	bts r12,4
LB_64654:
	mov r14,r8
	bt r12,2
	jc LB_64655
	btr r12,1
	jmp LB_64656
LB_64655:
	bts r12,1
LB_64656:
	mov r11,r9
	bt r12,3
	jc LB_64657
	btr r12,5
	jmp LB_64658
LB_64657:
	bts r12,5
LB_64658:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_64661
	btr r12,6
	jmp LB_64662
LB_64661:
	bts r12,6
LB_64662:
	mov r8,rcx
	bt r12,6
	jc LB_64659
	btr r12,2
	jmp LB_64660
LB_64659:
	bts r12,2
LB_64660:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_64665
	btr r12,6
	jmp LB_64666
LB_64665:
	bts r12,6
LB_64666:
	mov r9,rcx
	bt r12,6
	jc LB_64663
	btr r12,3
	jmp LB_64664
LB_64663:
	bts r12,3
LB_64664:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_64358 : %_64358
 ; {>  %_64355~1':_r64 %_64356~2':_r64 %_64357~3':(_lst)◂(_p64320) %_64354~0':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_64358
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f34 { %_64358 %_64354 } ⊢ { %_64359 %_64360 } : { %_64359 %_64360 }
 ; {>  %_64355~1':_r64 %_64358~4':_r64 %_64356~2':_r64 %_64357~3':(_lst)◂(_p64320) %_64354~0':_r64 }
	add r10,r13
; _f34 { %_64359 %_64355 } ⊢ { %_64361 %_64362 } : { %_64361 %_64362 }
 ; {>  %_64355~1':_r64 %_64359~4':_r64 %_64356~2':_r64 %_64357~3':(_lst)◂(_p64320) %_64360~0':_r64 }
	add r10,r14
; _f64321 %_64361 ⊢ %_64363 : %_64363
 ; {>  %_64362~1':_r64 %_64361~4':_r64 %_64356~2':_r64 %_64357~3':(_lst)◂(_p64320) %_64360~0':_r64 }
; _f64321 4' ⊢ °0◂4'
; _cns { %_64363 %_64357 } ⊢ %_64364 : %_64364
 ; {>  %_64363~°0◂4':_p64320 %_64362~1':_r64 %_64356~2':_r64 %_64357~3':(_lst)◂(_p64320) %_64360~0':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_64356 %_64364 } ⊢ %_64365 : %_64365
 ; {>  %_64362~1':_r64 %_64356~2':_r64 %_64360~0':_r64 %_64364~°0◂{ °0◂4' 3' }:(_lst)◂(_p64320) }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_64365
 ; {>  %_64365~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p64320) }) %_64362~1':_r64 %_64360~0':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_64591
	mov rdi,r14
	call dlt
LB_64591:
	bt r12,0
	jc LB_64592
	mov rdi,r13
	call dlt
LB_64592:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_64593
	btr r12,0
	jmp LB_64594
LB_64593:
	bts r12,0
LB_64594:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_64597
	btr r12,1
	jmp LB_64598
LB_64597:
	bts r12,1
LB_64598:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_64595
	btr QWORD [rdi],0
	jmp LB_64596
LB_64595:
	bts QWORD [rdi],0
LB_64596:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_64607
	btr r12,2
	jmp LB_64608
LB_64607:
	bts r12,2
LB_64608:
	mov rsi,1
	bt r12,2
	jc LB_64605
	mov rsi,0
	bt r8,0
	jc LB_64605
	jmp LB_64606
LB_64605:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_64606:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_64603
	btr QWORD [rdi],0
	jmp LB_64604
LB_64603:
	bts QWORD [rdi],0
LB_64604:
	mov r8,r13
	bt r12,0
	jc LB_64611
	btr r12,2
	jmp LB_64612
LB_64611:
	bts r12,2
LB_64612:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_64609
	btr QWORD [rdi],1
	jmp LB_64610
LB_64609:
	bts QWORD [rdi],1
LB_64610:
	mov rsi,1
	bt r12,1
	jc LB_64601
	mov rsi,0
	bt r14,0
	jc LB_64601
	jmp LB_64602
LB_64601:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_64602:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_64599
	btr QWORD [rdi],1
	jmp LB_64600
LB_64599:
	bts QWORD [rdi],1
LB_64600:
	mov r8,0
	bts r12,2
	ret
LB_64613:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64615
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64614
LB_64615:
	add rsp,8
	ret
LB_64616:
	add rsp,64
	pop r14
LB_64614:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_64323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64738
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64730
LB_64738:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_64325_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64743
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64744
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64744:
	jmp LB_64730
LB_64743:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64733
	btr r12,1
	jmp LB_64734
LB_64733:
	bts r12,1
LB_64734:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64731
	btr r12,0
	jmp LB_64732
LB_64731:
	bts r12,0
LB_64732:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_64727
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_64746
	btr r12,3
	jmp LB_64747
LB_64746:
	bts r12,3
LB_64747:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_64750
	btr r12,4
	jmp LB_64751
LB_64750:
	bts r12,4
LB_64751:
	mov r14,r10
	bt r12,4
	jc LB_64748
	btr r12,1
	jmp LB_64749
LB_64748:
	bts r12,1
LB_64749:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_64754
	btr r12,4
	jmp LB_64755
LB_64754:
	bts r12,4
LB_64755:
	mov r8,r10
	bt r12,4
	jc LB_64752
	btr r12,2
	jmp LB_64753
LB_64752:
	bts r12,2
LB_64753:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f34 { %_64367 %_64366 } ⊢ { %_64369 %_64370 } : { %_64369 %_64370 }
 ; {>  %_64368~2':(_lst)◂(_p64320) %_64366~0':_r64 %_64367~1':_r64 }
	add r14,r13
MTC_LB_64667:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_64668
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
	jnc LB_64669
	bt QWORD [rax],0
	jc LB_64670
	btr r12,5
	jmp LB_64671
LB_64670:
	bts r12,5
LB_64671:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_64669:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_64674
	btr r12,6
	jmp LB_64675
LB_64674:
	bts r12,6
LB_64675:
	mov r9,rcx
	bt r12,6
	jc LB_64672
	btr r12,3
	jmp LB_64673
LB_64672:
	bts r12,3
LB_64673:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_64678
	btr r12,6
	jmp LB_64679
LB_64678:
	bts r12,6
LB_64679:
	mov r10,rcx
	bt r12,6
	jc LB_64676
	btr r12,4
	jmp LB_64677
LB_64676:
	bts r12,4
LB_64677:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_64668
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
	jnc LB_64680
	bt QWORD [rax],0
	jc LB_64681
	btr r12,6
	jmp LB_64682
LB_64681:
	bts r12,6
LB_64682:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_64680:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_64683
	btr r12,5
	jmp LB_64684
LB_64683:
	bts r12,5
LB_64684:
LB_64685:
	cmp r15,0
	jz LB_64686
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64685
LB_64686:
; _f34 { %_64373 %_64370 } ⊢ { %_64374 %_64375 } : { %_64374 %_64375 }
 ; {>  %_64373~5':_r64 %_64370~0':_r64 %_64372~4':(_lst)◂(_p64320) %_64369~1':_r64 }
	add r11,r13
; _f64322 %_64374 ⊢ %_64376 : %_64376
 ; {>  %_64374~5':_r64 %_64372~4':(_lst)◂(_p64320) %_64375~0':_r64 %_64369~1':_r64 }
; _f64322 5' ⊢ °1◂5'
; _cns { %_64376 %_64372 } ⊢ %_64377 : %_64377
 ; {>  %_64372~4':(_lst)◂(_p64320) %_64376~°1◂5':_p64320 %_64375~0':_r64 %_64369~1':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_64369 %_64377 } ⊢ %_64378 : %_64378
 ; {>  %_64377~°0◂{ °1◂5' 4' }:(_lst)◂(_p64320) %_64375~0':_r64 %_64369~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_64378
 ; {>  %_64378~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p64320) }) %_64375~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_64687
	mov rdi,r13
	call dlt
LB_64687:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_64690
	btr r12,0
	jmp LB_64691
LB_64690:
	bts r12,0
LB_64691:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_64688
	btr QWORD [rdi],0
	jmp LB_64689
LB_64688:
	bts QWORD [rdi],0
LB_64689:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_64700
	btr r12,1
	jmp LB_64701
LB_64700:
	bts r12,1
LB_64701:
	mov rsi,1
	bt r12,1
	jc LB_64698
	mov rsi,0
	bt r14,0
	jc LB_64698
	jmp LB_64699
LB_64698:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_64699:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_64696
	btr QWORD [rdi],0
	jmp LB_64697
LB_64696:
	bts QWORD [rdi],0
LB_64697:
	mov r14,r10
	bt r12,4
	jc LB_64704
	btr r12,1
	jmp LB_64705
LB_64704:
	bts r12,1
LB_64705:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_64702
	btr QWORD [rdi],1
	jmp LB_64703
LB_64702:
	bts QWORD [rdi],1
LB_64703:
	mov rsi,1
	bt r12,0
	jc LB_64694
	mov rsi,0
	bt r13,0
	jc LB_64694
	jmp LB_64695
LB_64694:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_64695:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_64692
	btr QWORD [rdi],1
	jmp LB_64693
LB_64692:
	bts QWORD [rdi],1
LB_64693:
	mov r8,0
	bts r12,2
	ret
MTC_LB_64668:
	mov r15,0
LB_64707:
	cmp r15,0
	jz LB_64708
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64707
LB_64708:
; _f64322 %_64370 ⊢ %_64379 : %_64379
 ; {>  %_64370~0':_r64 %_64368~2':(_lst)◂(_p64320) %_64369~1':_r64 }
; _f64322 0' ⊢ °1◂0'
; _cns { %_64379 %_64368 } ⊢ %_64380 : %_64380
 ; {>  %_64368~2':(_lst)◂(_p64320) %_64379~°1◂0':_p64320 %_64369~1':_r64 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_64369 %_64380 } ⊢ %_64381 : %_64381
 ; {>  %_64380~°0◂{ °1◂0' 2' }:(_lst)◂(_p64320) %_64369~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_64381
 ; {>  %_64381~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p64320) }) }
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
	jc LB_64711
	btr r12,4
	jmp LB_64712
LB_64711:
	bts r12,4
LB_64712:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_64709
	btr QWORD [rdi],0
	jmp LB_64710
LB_64709:
	bts QWORD [rdi],0
LB_64710:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_64721
	btr r12,1
	jmp LB_64722
LB_64721:
	bts r12,1
LB_64722:
	mov rsi,1
	bt r12,1
	jc LB_64719
	mov rsi,0
	bt r14,0
	jc LB_64719
	jmp LB_64720
LB_64719:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_64720:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_64717
	btr QWORD [rdi],0
	jmp LB_64718
LB_64717:
	bts QWORD [rdi],0
LB_64718:
	mov r14,r8
	bt r12,2
	jc LB_64725
	btr r12,1
	jmp LB_64726
LB_64725:
	bts r12,1
LB_64726:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_64723
	btr QWORD [rdi],1
	jmp LB_64724
LB_64723:
	bts QWORD [rdi],1
LB_64724:
	mov rsi,1
	bt r12,4
	jc LB_64715
	mov rsi,0
	bt r10,0
	jc LB_64715
	jmp LB_64716
LB_64715:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_64716:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_64713
	btr QWORD [rdi],1
	jmp LB_64714
LB_64713:
	bts QWORD [rdi],1
LB_64714:
	mov r8,0
	bts r12,2
	ret
MTC_LB_64706:
LB_64727:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64729
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64728
LB_64729:
	add rsp,8
	ret
LB_64730:
	add rsp,32
	pop r14
LB_64728:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_64764
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_64382 : %_64382
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_64383 : %_64383
 ; {>  %_64382~°1◂{  }:(_lst)◂(t13800'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_64383
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_64383 %_64382 } ⊢ %_64384 : %_64384
 ; {>  %_64383~0':_r64 %_64382~°1◂{  }:(_lst)◂(t13800'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_64384
 ; {>  %_64384~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t13804'(0)) }) }
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
	jc LB_64758
	btr r12,1
	jmp LB_64759
LB_64758:
	bts r12,1
LB_64759:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_64756
	btr QWORD [rdi],0
	jmp LB_64757
LB_64756:
	bts QWORD [rdi],0
LB_64757:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_64762
	mov rsi,0
	bt r14,0
	jc LB_64762
	jmp LB_64763
LB_64762:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_64763:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_64760
	btr QWORD [rdi],1
	jmp LB_64761
LB_64760:
	bts QWORD [rdi],1
LB_64761:
	mov r8,0
	bts r12,2
	ret
LB_64764:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64766
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64765
LB_64766:
	add rsp,8
	ret
LB_64767:
	add rsp,0
	pop r14
LB_64765:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64326:
NS_E_RDI_64326:
NS_E_64326_ETR_TBL:
NS_E_64326_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_64324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64787
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64775
LB_64787:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_64795
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_64795
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_64795
	jmp LB_64796
LB_64795:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64793
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64793:
	jmp LB_64775
LB_64796:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_64324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64800
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64801
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64801:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64802
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64802:
	jmp LB_64775
LB_64800:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_64812
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_64812
	jmp LB_64813
LB_64812:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64808
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64808:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64809
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64809:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64810
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64810:
	jmp LB_64775
LB_64813:
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
	jc LB_64782
	btr r12,3
	jmp LB_64783
LB_64782:
	bts r12,3
LB_64783:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_64780
	btr r12,2
	jmp LB_64781
LB_64780:
	bts r12,2
LB_64781:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64778
	btr r12,1
	jmp LB_64779
LB_64778:
	bts r12,1
LB_64779:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64776
	btr r12,0
	jmp LB_64777
LB_64776:
	bts r12,0
LB_64777:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_64772
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_64814
	btr r12,4
	jmp LB_64815
LB_64814:
	bts r12,4
LB_64815:
	mov r14,r8
	bt r12,2
	jc LB_64816
	btr r12,1
	jmp LB_64817
LB_64816:
	bts r12,1
LB_64817:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_64387 : %_64387
 ; {>  %_64385~0':_r64 %_64386~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_64387
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f34 { %_64387 %_64385 } ⊢ { %_64388 %_64389 } : { %_64388 %_64389 }
 ; {>  %_64385~0':_r64 %_64387~2':_r64 %_64386~1':_r64 }
	add r8,r13
; _f34 { %_64388 %_64386 } ⊢ { %_64390 %_64391 } : { %_64390 %_64391 }
 ; {>  %_64388~2':_r64 %_64389~0':_r64 %_64386~1':_r64 }
	add r8,r14
; _some %_64390 ⊢ %_64392 : %_64392
 ; {>  %_64391~1':_r64 %_64390~2':_r64 %_64389~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_64392
 ; {>  %_64391~1':_r64 %_64392~°0◂2':(_opn)◂(_r64) %_64389~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_64768
	mov rdi,r14
	call dlt
LB_64768:
	bt r12,0
	jc LB_64769
	mov rdi,r13
	call dlt
LB_64769:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_64770
	btr r12,3
	jmp LB_64771
LB_64770:
	bts r12,3
LB_64771:
	mov r8,0
	bts r12,2
	ret
LB_64772:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64774
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64773
LB_64774:
	add rsp,8
	ret
LB_64775:
	add rsp,64
	pop r14
LB_64773:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_64324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64843
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64827
LB_64843:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_64851
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_64851
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_64851
	jmp LB_64852
LB_64851:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64849
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64849:
	jmp LB_64827
LB_64852:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_64324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64856
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64857
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64857:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64858
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64858:
	jmp LB_64827
LB_64856:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_64868
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_64868
	jmp LB_64869
LB_64868:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64864
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64864:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64865
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64865:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64866
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64866:
	jmp LB_64827
LB_64869:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_64326_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64873
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_64874
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_64874:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64875
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64875:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64876
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64876:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64877
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64877:
	jmp LB_64827
LB_64873:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_64326_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64882
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_64883
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_64883:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_64884
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_64884:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_64885
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_64885:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_64886
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_64886:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64887
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64887:
	jmp LB_64827
LB_64882:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_64838
	btr r12,5
	jmp LB_64839
LB_64838:
	bts r12,5
LB_64839:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_64836
	btr r12,4
	jmp LB_64837
LB_64836:
	bts r12,4
LB_64837:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_64834
	btr r12,3
	jmp LB_64835
LB_64834:
	bts r12,3
LB_64835:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_64832
	btr r12,2
	jmp LB_64833
LB_64832:
	bts r12,2
LB_64833:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64830
	btr r12,1
	jmp LB_64831
LB_64830:
	bts r12,1
LB_64831:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64828
	btr r12,0
	jmp LB_64829
LB_64828:
	bts r12,0
LB_64829:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_64824
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_64889
	btr r12,6
	jmp LB_64890
LB_64889:
	bts r12,6
LB_64890:
	mov r9,r11
	bt r12,5
	jc LB_64891
	btr r12,3
	jmp LB_64892
LB_64891:
	bts r12,3
LB_64892:
	mov r11,r8
	bt r12,2
	jc LB_64893
	btr r12,5
	jmp LB_64894
LB_64893:
	bts r12,5
LB_64894:
	mov r8,r10
	bt r12,4
	jc LB_64895
	btr r12,2
	jmp LB_64896
LB_64895:
	bts r12,2
LB_64896:
	mov r10,r14
	bt r12,1
	jc LB_64897
	btr r12,4
	jmp LB_64898
LB_64897:
	bts r12,4
LB_64898:
	mov r14,r11
	bt r12,5
	jc LB_64899
	btr r12,1
	jmp LB_64900
LB_64899:
	bts r12,1
LB_64900:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_64397 : %_64397
 ; {>  %_64393~0':_r64 %_64394~1':_r64 %_64396~3':_r64 %_64395~2':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_64397
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f34 { %_64397 %_64393 } ⊢ { %_64398 %_64399 } : { %_64398 %_64399 }
 ; {>  %_64393~0':_r64 %_64394~1':_r64 %_64396~3':_r64 %_64397~4':_r64 %_64395~2':_r64 }
	add r10,r13
; _f34 { %_64398 %_64394 } ⊢ { %_64400 %_64401 } : { %_64400 %_64401 }
 ; {>  %_64394~1':_r64 %_64396~3':_r64 %_64399~0':_r64 %_64395~2':_r64 %_64398~4':_r64 }
	add r10,r14
; _f34 { %_64400 %_64395 } ⊢ { %_64402 %_64403 } : { %_64402 %_64403 }
 ; {>  %_64400~4':_r64 %_64396~3':_r64 %_64401~1':_r64 %_64399~0':_r64 %_64395~2':_r64 }
	add r10,r8
; _f34 { %_64402 %_64396 } ⊢ { %_64404 %_64405 } : { %_64404 %_64405 }
 ; {>  %_64403~2':_r64 %_64402~4':_r64 %_64396~3':_r64 %_64401~1':_r64 %_64399~0':_r64 }
	add r10,r9
; _some %_64404 ⊢ %_64406 : %_64406
 ; {>  %_64403~2':_r64 %_64404~4':_r64 %_64405~3':_r64 %_64401~1':_r64 %_64399~0':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_64406
 ; {>  %_64403~2':_r64 %_64405~3':_r64 %_64401~1':_r64 %_64399~0':_r64 %_64406~°0◂4':(_opn)◂(_r64) }
; 	∎ °0◂4'
	bt r12,2
	jc LB_64818
	mov rdi,r8
	call dlt
LB_64818:
	bt r12,3
	jc LB_64819
	mov rdi,r9
	call dlt
LB_64819:
	bt r12,1
	jc LB_64820
	mov rdi,r14
	call dlt
LB_64820:
	bt r12,0
	jc LB_64821
	mov rdi,r13
	call dlt
LB_64821:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_64822
	btr r12,3
	jmp LB_64823
LB_64822:
	bts r12,3
LB_64823:
	mov r8,0
	bts r12,2
	ret
LB_64824:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64826
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64825
LB_64826:
	add rsp,8
	ret
LB_64827:
	add rsp,96
	pop r14
LB_64825:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_64323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64915
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64907
LB_64915:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_64326_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_64920
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_64921
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_64921:
	jmp LB_64907
LB_64920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_64910
	btr r12,1
	jmp LB_64911
LB_64910:
	bts r12,1
LB_64911:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_64908
	btr r12,0
	jmp LB_64909
LB_64908:
	bts r12,0
LB_64909:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_64904
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f34 { %_64407 %_64408 } ⊢ { %_64409 %_64410 } : { %_64409 %_64410 }
 ; {>  %_64408~1':_r64 %_64407~0':_r64 }
	add r13,r14
; _some %_64409 ⊢ %_64411 : %_64411
 ; {>  %_64409~0':_r64 %_64410~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_64411
 ; {>  %_64410~1':_r64 %_64411~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_64901
	mov rdi,r14
	call dlt
LB_64901:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_64902
	btr r12,3
	jmp LB_64903
LB_64902:
	bts r12,3
LB_64903:
	mov r8,0
	bts r12,2
	ret
LB_64904:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_64906
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_64905
LB_64906:
	add rsp,8
	ret
LB_64907:
	add rsp,32
	pop r14
LB_64905:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_64945:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_64945:
MTC_LB_64946:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_64947
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
	jnc LB_64948
	bt QWORD [rax],0
	jc LB_64949
	btr r12,7
	jmp LB_64950
LB_64949:
	bts r12,7
LB_64950:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_64948:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_64953
	btr r12,8
	jmp LB_64954
LB_64953:
	bts r12,8
LB_64954:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_64951
	btr r12,5
	jmp LB_64952
LB_64951:
	bts r12,5
LB_64952:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_64957
	btr r12,8
	jmp LB_64958
LB_64957:
	bts r12,8
LB_64958:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_64955
	btr r12,6
	jmp LB_64956
LB_64955:
	bts r12,6
LB_64956:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_64959:
	cmp r15,0
	jz LB_64960
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64959
LB_64960:
MTC_LB_64961:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_64962
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
	jnc LB_64963
	bt QWORD [rax],0
	jc LB_64964
	btr r12,7
	jmp LB_64965
LB_64964:
	bts r12,7
LB_64965:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_64963:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_64966
	btr r12,4
	jmp LB_64967
LB_64966:
	bts r12,4
LB_64967:
LB_64968:
	cmp r15,0
	jz LB_64969
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_64968
LB_64969:
; _f36 %_64930 ⊢ { %_64931 %_64932 } : { %_64931 %_64932 }
 ; {>  %_64924~1':_r64 %_64926~3':_r64 %_64925~2':_stg %_64923~0':_stg %_64929~6':(_lst)◂(_p64320) %_64930~4':_r64 }
	mov r11,r10
	bts r12,5
; _f18 { %_64932 %_64923 %_64924 %_64925 %_64926 } ⊢ { %_64933 %_64934 %_64935 %_64936 %_64937 } : { %_64933 %_64934 %_64935 %_64936 %_64937 }
 ; {>  %_64932~5':_r64 %_64924~1':_r64 %_64926~3':_r64 %_64925~2':_stg %_64923~0':_stg %_64929~6':(_lst)◂(_p64320) %_64931~4':_r64 }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_64974
	btr r12,4
	jmp LB_64975
LB_64974:
	bts r12,4
LB_64975:
	mov r9,r8
	bt r12,2
	jc LB_64976
	btr r12,3
	jmp LB_64977
LB_64976:
	bts r12,3
LB_64977:
	mov r8,r14
	bt r12,1
	jc LB_64978
	btr r12,2
	jmp LB_64979
LB_64978:
	bts r12,2
LB_64979:
	mov r14,r13
	bt r12,0
	jc LB_64980
	btr r12,1
	jmp LB_64981
LB_64980:
	bts r12,1
LB_64981:
	mov r13,r11
	bt r12,5
	jc LB_64982
	btr r12,0
	jmp LB_64983
LB_64982:
	bts r12,0
LB_64983:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_64984
	btr r12,5
	jmp LB_64985
LB_64984:
	bts r12,5
LB_64985:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_64972
	btr r12,6
	jmp LB_64973
LB_64972:
	bts r12,6
LB_64973:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_64970
	btr r12,4
	jmp LB_64971
LB_64970:
	bts r12,4
LB_64971:
	add rsp,24
; _f64945 { %_64934 %_64935 %_64936 %_64937 %_64929 } ⊢ { %_64938 %_64939 } : { %_64938 %_64939 }
 ; {>  %_64936~3':_stg %_64935~2':_r64 %_64934~1':_stg %_64933~0':_r64 %_64937~5':_r64 %_64929~6':(_lst)◂(_p64320) %_64931~4':_r64 }
; _f64945 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_64990
	btr r12,0
	jmp LB_64991
LB_64990:
	bts r12,0
LB_64991:
	mov r14,r8
	bt r12,2
	jc LB_64992
	btr r12,1
	jmp LB_64993
LB_64992:
	bts r12,1
LB_64993:
	mov r8,r9
	bt r12,3
	jc LB_64994
	btr r12,2
	jmp LB_64995
LB_64994:
	bts r12,2
LB_64995:
	mov r9,r11
	bt r12,5
	jc LB_64996
	btr r12,3
	jmp LB_64997
LB_64996:
	bts r12,3
LB_64997:
	mov r10,rcx
	bt r12,6
	jc LB_64998
	btr r12,4
	jmp LB_64999
LB_64998:
	bts r12,4
LB_64999:
	call NS_E_64945
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_65000
	btr r12,2
	jmp LB_65001
LB_65000:
	bts r12,2
LB_65001:
	mov r14,r13
	bt r12,0
	jc LB_65002
	btr r12,1
	jmp LB_65003
LB_65002:
	bts r12,1
LB_65003:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_64988
	btr r12,4
	jmp LB_64989
LB_64988:
	bts r12,4
LB_64989:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_64986
	btr r12,0
	jmp LB_64987
LB_64986:
	bts r12,0
LB_64987:
	add rsp,24
; ∎ { %_64938 %_64939 }
 ; {>  %_64933~0':_r64 %_64938~1':_stg %_64939~2':_stg %_64931~4':_r64 }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_65004
	mov rdi,r13
	call dlt
LB_65004:
	bt r12,4
	jc LB_65005
	mov rdi,r10
	call dlt
LB_65005:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_65006
	btr r12,0
	jmp LB_65007
LB_65006:
	bts r12,0
LB_65007:
	mov r14,r8
	bt r12,2
	jc LB_65008
	btr r12,1
	jmp LB_65009
LB_65008:
	bts r12,1
LB_65009:
	ret
MTC_LB_64962:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_65010
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
	jnc LB_65011
	bt QWORD [rax],0
	jc LB_65012
	btr r12,7
	jmp LB_65013
LB_65012:
	bts r12,7
LB_65013:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_65011:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_65014
	btr r12,4
	jmp LB_65015
LB_65014:
	bts r12,4
LB_65015:
LB_65016:
	cmp r15,0
	jz LB_65017
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_65016
LB_65017:
; _f34 { %_64924 %_64940 } ⊢ { %_64941 %_64942 } : { %_64941 %_64942 }
 ; {>  %_64924~1':_r64 %_64926~3':_r64 %_64925~2':_stg %_64923~0':_stg %_64929~6':(_lst)◂(_p64320) %_64940~4':_r64 }
	add r14,r10
; _f64945 { %_64923 %_64941 %_64925 %_64926 %_64929 } ⊢ { %_64943 %_64944 } : { %_64943 %_64944 }
 ; {>  %_64926~3':_r64 %_64925~2':_stg %_64923~0':_stg %_64942~4':_r64 %_64929~6':(_lst)◂(_p64320) %_64941~1':_r64 }
; _f64945 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_65020
	btr r12,4
	jmp LB_65021
LB_65020:
	bts r12,4
LB_65021:
	call NS_E_64945
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_65018
	btr r12,4
	jmp LB_65019
LB_65018:
	bts r12,4
LB_65019:
	add rsp,16
; ∎ { %_64943 %_64944 }
 ; {>  %_64942~4':_r64 %_64943~0':_stg %_64944~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_65022
	mov rdi,r10
	call dlt
LB_65022:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_65010:
MTC_LB_64947:
	mov r15,0
LB_65024:
	cmp r15,0
	jz LB_65025
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_65024
LB_65025:
; ∎ { %_64923 %_64925 }
 ; {>  %_64924~1':_r64 %_64926~3':_r64 %_64925~2':_stg %_64923~0':_stg %_64927~4':(_lst)◂(_p64320) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_65026
	mov rdi,r14
	call dlt
LB_65026:
	bt r12,3
	jc LB_65027
	mov rdi,r9
	call dlt
LB_65027:
	bt r12,4
	jc LB_65028
	mov rdi,r10
	call dlt
LB_65028:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_65029
	btr r12,1
	jmp LB_65030
LB_65029:
	bts r12,1
LB_65030:
	ret
MTC_LB_65023:
NS_E_65048:
; 	|» 0'
NS_E_RDI_65048:
; » 0xr0 |~ {  } ⊢ %_65032 : %_65032
 ; {>  %_65031~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_65032
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f64325 { %_65031 %_65032 } ⊢ { %_65033 %_65034 %_65035 } : { %_65033 %_65034 %_65035 }
 ; {>  %_65032~1':_r64 %_65031~0':_stg }
; _f64325 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_64325
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_65049
	btr r12,4
	jmp LB_65050
LB_65049:
	bts r12,4
LB_65050:
	mov r8,r9
	bt r12,3
	jc LB_65053
	btr r12,2
	jmp LB_65054
LB_65053:
	bts r12,2
LB_65054:
	mov rsi,1
	bt r12,2
	jc LB_65051
	mov rsi,0
	bt r8,0
	jc LB_65051
	jmp LB_65052
LB_65051:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_65052:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_65055:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_65056
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
	jnc LB_65057
	bt QWORD [rax],0
	jc LB_65058
	btr r12,5
	jmp LB_65059
LB_65058:
	bts r12,5
LB_65059:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_65057:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_65062
	btr r12,6
	jmp LB_65063
LB_65062:
	bts r12,6
LB_65063:
	mov r9,rcx
	bt r12,6
	jc LB_65060
	btr r12,3
	jmp LB_65061
LB_65060:
	bts r12,3
LB_65061:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_65066
	btr r12,6
	jmp LB_65067
LB_65066:
	bts r12,6
LB_65067:
	mov r10,rcx
	bt r12,6
	jc LB_65064
	btr r12,4
	jmp LB_65065
LB_65064:
	bts r12,4
LB_65065:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_65068:
	cmp r15,0
	jz LB_65069
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_65068
LB_65069:
; _f21 { %_65036 %_65037 } ⊢ { %_65038 %_65039 } : { %_65038 %_65039 }
 ; {>  %_65037~4':(_lst)◂(_p64320) %_65033~0':_stg %_65036~3':_r64 %_65034~1':_r64 }
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
	jc LB_65076
	btr r12,1
	jmp LB_65077
LB_65076:
	bts r12,1
LB_65077:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_65074
	btr QWORD [rdi],0
	jmp LB_65075
LB_65074:
	bts QWORD [rdi],0
LB_65075:
	mov r14,r10
	bt r12,4
	jc LB_65080
	btr r12,1
	jmp LB_65081
LB_65080:
	bts r12,1
LB_65081:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_65078
	btr QWORD [rdi],1
	jmp LB_65079
LB_65078:
	bts QWORD [rdi],1
LB_65079:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 2' 3' }
; 0' ⊢ { 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_65084
	btr r12,1
	jmp LB_65085
LB_65084:
	bts r12,1
LB_65085:
	mov r8,r14
	bt r12,1
	jc LB_65082
	btr r12,2
	jmp LB_65083
LB_65082:
	bts r12,2
LB_65083:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_65088
	btr r12,1
	jmp LB_65089
LB_65088:
	bts r12,1
LB_65089:
	mov r9,r14
	bt r12,1
	jc LB_65086
	btr r12,3
	jmp LB_65087
LB_65086:
	bts r12,3
LB_65087:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_65072
	btr r12,1
	jmp LB_65073
LB_65072:
	bts r12,1
LB_65073:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_65070
	btr r12,0
	jmp LB_65071
LB_65070:
	bts r12,0
LB_65071:
	add rsp,24
; _f14 %_65038 ⊢ { %_65040 %_65041 } : { %_65040 %_65041 }
 ; {>  %_65038~2':_r64 %_65033~0':_stg %_65039~3':(_lst)◂(_p64320) %_65034~1':_r64 }
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
	jc LB_65096
	btr r12,0
	jmp LB_65097
LB_65096:
	bts r12,0
LB_65097:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_65098
	btr r12,2
	jmp LB_65099
LB_65098:
	bts r12,2
LB_65099:
	mov r10,r14
	bt r12,1
	jc LB_65100
	btr r12,4
	jmp LB_65101
LB_65100:
	bts r12,4
LB_65101:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_65094
	btr r12,3
	jmp LB_65095
LB_65094:
	bts r12,3
LB_65095:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_65092
	btr r12,1
	jmp LB_65093
LB_65092:
	bts r12,1
LB_65093:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_65090
	btr r12,0
	jmp LB_65091
LB_65090:
	bts r12,0
LB_65091:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_65042 : %_65042
 ; {>  %_65033~0':_stg %_65040~2':_r64 %_65039~3':(_lst)◂(_p64320) %_65041~4':_stg %_65034~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_65042
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_65043 : %_65043
 ; {>  %_65033~0':_stg %_65040~2':_r64 %_65039~3':(_lst)◂(_p64320) %_65041~4':_stg %_65042~5':_r64 %_65034~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_65043
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f64945 { %_65033 %_65042 %_65041 %_65043 %_65039 } ⊢ { %_65044 %_65045 } : { %_65044 %_65045 }
 ; {>  %_65033~0':_stg %_65040~2':_r64 %_65039~3':(_lst)◂(_p64320) %_65043~6':_r64 %_65041~4':_stg %_65042~5':_r64 %_65034~1':_r64 }
; _f64945 { 0' 5' 4' 6' 3' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 4' 6' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_65106
	btr r12,1
	jmp LB_65107
LB_65106:
	bts r12,1
LB_65107:
	mov r8,r10
	bt r12,4
	jc LB_65108
	btr r12,2
	jmp LB_65109
LB_65108:
	bts r12,2
LB_65109:
	mov r10,r9
	bt r12,3
	jc LB_65110
	btr r12,4
	jmp LB_65111
LB_65110:
	bts r12,4
LB_65111:
	mov r9,rcx
	bt r12,6
	jc LB_65112
	btr r12,3
	jmp LB_65113
LB_65112:
	bts r12,3
LB_65113:
	call NS_E_64945
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_65114
	btr r12,3
	jmp LB_65115
LB_65114:
	bts r12,3
LB_65115:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_65104
	btr r12,2
	jmp LB_65105
LB_65104:
	bts r12,2
LB_65105:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_65102
	btr r12,1
	jmp LB_65103
LB_65102:
	bts r12,1
LB_65103:
	add rsp,24
; _some %_65045 ⊢ %_65046 : %_65046
 ; {>  %_65044~0':_stg %_65045~3':_stg %_65040~2':_r64 %_65034~1':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_65044 %_65046 }
 ; {>  %_65046~°0◂3':(_opn)◂(_stg) %_65044~0':_stg %_65040~2':_r64 %_65034~1':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_65116
	mov rdi,r8
	call dlt
LB_65116:
	bt r12,1
	jc LB_65117
	mov rdi,r14
	call dlt
LB_65117:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_65120
	btr r12,1
	jmp LB_65121
LB_65120:
	bts r12,1
LB_65121:
	mov rsi,1
	bt r12,1
	jc LB_65118
	mov rsi,0
	bt r14,0
	jc LB_65118
	jmp LB_65119
LB_65118:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_65119:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_65056:
	mov r15,0
LB_65123:
	cmp r15,0
	jz LB_65124
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_65123
LB_65124:
; _none {  } ⊢ %_65047 : %_65047
 ; {>  %_65033~0':_stg %_65035~2':(_opn)◂({ _r64 (_lst)◂(_p64320) }) %_65034~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_65033 %_65047 }
 ; {>  %_65047~°1◂{  }:(_opn)◂(t13989'(0)) %_65033~0':_stg %_65035~2':(_opn)◂({ _r64 (_lst)◂(_p64320) }) %_65034~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_65125
	mov rdi,r8
	call dlt
LB_65125:
	bt r12,1
	jc LB_65126
	mov rdi,r14
	call dlt
LB_65126:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_65127
	mov rsi,0
	bt r14,0
	jc LB_65127
	jmp LB_65128
LB_65127:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_65128:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_65122:
NS_E_65134:
NS_E_RDI_65134:
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
; _f65048 %_65129 ⊢ { %_65130 %_65131 } : { %_65130 %_65131 }
 ; {>  %_65129~0':_stg }
; _f65048 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_65048
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_65130 %_65131 } ⊢ { %_65132 %_65133 } : { %_65132 %_65133 }
 ; {>  %_65131~1':(_opn)◂(_stg) %_65130~0':_stg }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_65135
	btr r12,2
	jmp LB_65136
LB_65135:
	bts r12,2
LB_65136:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_65139
	btr r12,3
	jmp LB_65140
LB_65139:
	bts r12,3
LB_65140:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_65137
	btr QWORD [rdi],0
	jmp LB_65138
LB_65137:
	bts QWORD [rdi],0
LB_65138:
	mov r9,r14
	bt r12,1
	jc LB_65143
	btr r12,3
	jmp LB_65144
LB_65143:
	bts r12,3
LB_65144:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_65141
	btr QWORD [rdi],1
	jmp LB_65142
LB_65141:
	bts QWORD [rdi],1
LB_65142:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_65145
	btr r12,2
	jmp LB_65146
LB_65145:
	bts r12,2
LB_65146:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_65149
	btr r12,3
	jmp LB_65150
LB_65149:
	bts r12,3
LB_65150:
	mov r13,r9
	bt r12,3
	jc LB_65147
	btr r12,0
	jmp LB_65148
LB_65147:
	bts r12,0
LB_65148:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_65153
	btr r12,3
	jmp LB_65154
LB_65153:
	bts r12,3
LB_65154:
	mov r14,r9
	bt r12,3
	jc LB_65151
	btr r12,1
	jmp LB_65152
LB_65151:
	bts r12,1
LB_65152:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_65133~1':(_opn)◂(_stg) %_65132~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_65155
	mov rdi,r14
	call dlt
LB_65155:
	bt r12,0
	jc LB_65156
	mov rdi,r13
	call dlt
LB_65156:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_65158:
NS_E_RDI_65158:
NS_E_65158_ETR_TBL:
NS_E_65158_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_65175
LB_65174:
	add r14,1
LB_65175:
	cmp r14,r10
	jge LB_65176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65174
	cmp al,10
	jz LB_65174
	cmp al,32
	jz LB_65174
LB_65176:
	push r10
	call NS_E_64256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65177
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65161
LB_65177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_65180
LB_65179:
	add r14,1
LB_65180:
	cmp r14,r10
	jge LB_65181
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65179
	cmp al,10
	jz LB_65179
	cmp al,32
	jz LB_65179
LB_65181:
	add r14,1
	cmp r14,r10
	jg LB_65185
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_65185
	jmp LB_65186
LB_65185:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65183
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65183:
	jmp LB_65161
LB_65186:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_65188
LB_65187:
	add r14,1
LB_65188:
	cmp r14,r10
	jge LB_65189
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65187
	cmp al,10
	jz LB_65187
	cmp al,32
	jz LB_65187
LB_65189:
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65190
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65191
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65191:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65192:
	jmp LB_65161
LB_65190:
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
	jc LB_65170
	btr QWORD [rdi],2
LB_65170:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65171
	btr QWORD [rdi],1
LB_65171:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65172
	btr QWORD [rdi],0
LB_65172:
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
LB_65161:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_65166
LB_65165:
	add r14,1
LB_65166:
	cmp r14,r10
	jge LB_65167
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65165
	cmp al,32
	jz LB_65165
LB_65167:
	push r10
	call NS_E_64256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65168
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65162
LB_65168:
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
	jc LB_65163
	btr QWORD [rdi],0
LB_65163:
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
LB_65162:
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
NS_E_65195:
NS_E_RDI_65195:
NS_E_65195_ETR_TBL:
NS_E_65195_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_63688_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65222
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65199
LB_65222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_65230
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_65230
	jmp LB_65231
LB_65230:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65228
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65228:
	jmp LB_65199
LB_65231:
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
	jc LB_65216
	btr QWORD [rdi],1
LB_65216:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65217
	btr QWORD [rdi],0
LB_65217:
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
LB_65199:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_63759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65214
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65200
LB_65214:
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
	jc LB_65209
	btr QWORD [rdi],0
LB_65209:
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
LB_65200:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65207
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65201
LB_65207:
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
	jc LB_65202
	btr QWORD [rdi],0
LB_65202:
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
LB_65201:
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
NS_E_65233:
NS_E_RDI_65233:
NS_E_65233_ETR_TBL:
NS_E_65233_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_65240
LB_65239:
	add r14,1
LB_65240:
	cmp r14,r10
	jge LB_65241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65239
	cmp al,32
	jz LB_65239
LB_65241:
	add r14,1
	cmp r14,r10
	jg LB_65244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_65244
	jmp LB_65245
LB_65244:
	jmp LB_65235
LB_65245:
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
LB_65250:
	jmp LB_65247
LB_65246:
	add r14,1
LB_65247:
	cmp r14,r10
	jge LB_65248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65246
	cmp al,32
	jz LB_65246
LB_65248:
	add r14,1
	cmp r14,r10
	jg LB_65249
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_65249
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
	jmp LB_65250
LB_65249:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65236
	btr QWORD [rdi],1
LB_65236:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65237
	btr QWORD [rdi],0
LB_65237:
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
LB_65235:
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
NS_E_65252:
NS_E_RDI_65252:
NS_E_65252_ETR_TBL:
NS_E_65252_TBL:
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
LB_65428:
	jmp LB_65425
LB_65424:
	add r14,1
LB_65425:
	cmp r14,r10
	jge LB_65426
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65424
	cmp al,10
	jz LB_65424
	cmp al,32
	jz LB_65424
LB_65426:
	push r10
	push rsi
	call NS_E_65254_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_65427
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_65429
	bts QWORD [rax],0
LB_65429:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_65428
LB_65427:
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
	jc LB_65422
	btr QWORD [rdi],0
LB_65422:
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
LB_65421:
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
NS_E_65254:
NS_E_RDI_65254:
NS_E_65254_ETR_TBL:
NS_E_65254_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_65700
LB_65699:
	add r14,1
LB_65700:
	cmp r14,r10
	jge LB_65701
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65699
	cmp al,10
	jz LB_65699
	cmp al,32
	jz LB_65699
LB_65701:
	add r14,7
	cmp r14,r10
	jg LB_65704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_65704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_65704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_65704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_65704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_65704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_65704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_65704
	jmp LB_65705
LB_65704:
	jmp LB_65430
LB_65705:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_65707
LB_65706:
	add r14,1
LB_65707:
	cmp r14,r10
	jge LB_65708
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65706
	cmp al,10
	jz LB_65706
	cmp al,32
	jz LB_65706
LB_65708:
	push r10
	call NS_E_65304_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65709
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65710
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65710:
	jmp LB_65430
LB_65709:
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
	jc LB_65696
	btr QWORD [rdi],1
LB_65696:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65697
	btr QWORD [rdi],0
LB_65697:
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
LB_65430:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_65684
LB_65683:
	add r14,1
LB_65684:
	cmp r14,r10
	jge LB_65685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65683
	cmp al,10
	jz LB_65683
	cmp al,32
	jz LB_65683
LB_65685:
	add r14,4
	cmp r14,r10
	jg LB_65688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_65688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_65688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_65688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_65688
	jmp LB_65689
LB_65688:
	jmp LB_65431
LB_65689:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_65691
LB_65690:
	add r14,1
LB_65691:
	cmp r14,r10
	jge LB_65692
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65690
	cmp al,10
	jz LB_65690
	cmp al,32
	jz LB_65690
LB_65692:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65693
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65694
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65694:
	jmp LB_65431
LB_65693:
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
	jmp LB_65451
LB_65450:
	add r14,1
LB_65451:
	cmp r14,r10
	jge LB_65452
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65450
	cmp al,10
	jz LB_65450
	cmp al,32
	jz LB_65450
LB_65452:
	add r14,1
	cmp r14,r10
	jg LB_65455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_65455
	jmp LB_65456
LB_65455:
	jmp LB_65432
LB_65456:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_65458
LB_65457:
	add r14,1
LB_65458:
	cmp r14,r10
	jge LB_65459
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65457
	cmp al,10
	jz LB_65457
	cmp al,32
	jz LB_65457
LB_65459:
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65460
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65461
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65461:
	jmp LB_65432
LB_65460:
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
	jc LB_65444
	btr QWORD [rdi],1
LB_65444:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65445
	btr QWORD [rdi],0
LB_65445:
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
	jc LB_65447
	btr QWORD [rdi],1
LB_65447:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65448
	btr QWORD [rdi],0
LB_65448:
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
LB_65432:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_65440
LB_65439:
	add r14,1
LB_65440:
	cmp r14,r10
	jge LB_65441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65439
	cmp al,10
	jz LB_65439
	cmp al,32
	jz LB_65439
LB_65441:
	push r10
	call NS_E_65256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65442
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65433
LB_65442:
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
	jc LB_65434
	btr QWORD [rdi],0
LB_65434:
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
	jc LB_65436
	btr QWORD [rdi],1
LB_65436:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65437
	btr QWORD [rdi],0
LB_65437:
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
LB_65433:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65680
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65680:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65681
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65681:
LB_65431:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_65674
LB_65673:
	add r14,1
LB_65674:
	cmp r14,r10
	jge LB_65675
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65673
	cmp al,10
	jz LB_65673
	cmp al,32
	jz LB_65673
LB_65675:
	add r14,2
	cmp r14,r10
	jg LB_65678
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_65678
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_65678
	jmp LB_65679
LB_65678:
	jmp LB_65463
LB_65679:
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
	jmp LB_65544
LB_65543:
	add r14,1
LB_65544:
	cmp r14,r10
	jge LB_65545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65543
	cmp al,10
	jz LB_65543
	cmp al,32
	jz LB_65543
LB_65545:
	add r14,1
	cmp r14,r10
	jg LB_65548
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_65548
	jmp LB_65549
LB_65548:
	jmp LB_65464
LB_65549:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_65551
LB_65550:
	add r14,1
LB_65551:
	cmp r14,r10
	jge LB_65552
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65550
	cmp al,10
	jz LB_65550
	cmp al,32
	jz LB_65550
LB_65552:
	add r14,1
	cmp r14,r10
	jg LB_65556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_65556
	jmp LB_65557
LB_65556:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65554
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65554:
	jmp LB_65464
LB_65557:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_65559
LB_65558:
	add r14,1
LB_65559:
	cmp r14,r10
	jge LB_65560
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65558
	cmp al,10
	jz LB_65558
	cmp al,32
	jz LB_65558
LB_65560:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65561
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65562
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65562:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65563
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65563:
	jmp LB_65464
LB_65561:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_65566
LB_65565:
	add r14,1
LB_65566:
	cmp r14,r10
	jge LB_65567
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65565
	cmp al,10
	jz LB_65565
	cmp al,32
	jz LB_65565
LB_65567:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65568
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_65569
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_65569:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65570
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65570:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65571:
	jmp LB_65464
LB_65568:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_65574
LB_65573:
	add r14,1
LB_65574:
	cmp r14,r10
	jge LB_65575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65573
	cmp al,10
	jz LB_65573
	cmp al,32
	jz LB_65573
LB_65575:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65576
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_65577
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_65577:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_65578
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_65578:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65579
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65579:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65580
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65580:
	jmp LB_65464
LB_65576:
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
LB_65586:
	jmp LB_65583
LB_65582:
	add r14,1
LB_65583:
	cmp r14,r10
	jge LB_65584
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65582
	cmp al,10
	jz LB_65582
	cmp al,32
	jz LB_65582
LB_65584:
	push r10
	push rsi
	call NS_E_65258_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_65585
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_65587
	bts QWORD [rax],0
LB_65587:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_65586
LB_65585:
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
	jc LB_65534
	btr QWORD [rdi],5
LB_65534:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_65535
	btr QWORD [rdi],4
LB_65535:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_65536
	btr QWORD [rdi],3
LB_65536:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_65537
	btr QWORD [rdi],2
LB_65537:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65538
	btr QWORD [rdi],1
LB_65538:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65539
	btr QWORD [rdi],0
LB_65539:
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
	jc LB_65541
	btr QWORD [rdi],0
LB_65541:
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
LB_65464:
	add rsp,96
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_65530
LB_65529:
	add r14,1
LB_65530:
	cmp r14,r10
	jge LB_65531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65529
	cmp al,10
	jz LB_65529
	cmp al,32
	jz LB_65529
LB_65531:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65532
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65465
LB_65532:
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
	jmp LB_65515
LB_65514:
	add r14,1
LB_65515:
	cmp r14,r10
	jge LB_65516
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65514
	cmp al,10
	jz LB_65514
	cmp al,32
	jz LB_65514
LB_65516:
	add r14,1
	cmp r14,r10
	jg LB_65519
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_65519
	jmp LB_65520
LB_65519:
	jmp LB_65466
LB_65520:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_65522
LB_65521:
	add r14,1
LB_65522:
	cmp r14,r10
	jge LB_65523
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65521
	cmp al,10
	jz LB_65521
	cmp al,32
	jz LB_65521
LB_65523:
	push r10
	call NS_E_65195_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65524
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65525:
	jmp LB_65466
LB_65524:
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
	jc LB_65507
	btr QWORD [rdi],1
LB_65507:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65508
	btr QWORD [rdi],0
LB_65508:
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
	jc LB_65512
	btr QWORD [rdi],0
LB_65512:
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
	jc LB_65510
	btr QWORD [rdi],0
LB_65510:
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
LB_65466:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_65495
LB_65494:
	add r14,1
LB_65495:
	cmp r14,r10
	jge LB_65496
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65494
	cmp al,10
	jz LB_65494
	cmp al,32
	jz LB_65494
LB_65496:
	add r14,2
	cmp r14,r10
	jg LB_65499
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_65499
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_65499
	jmp LB_65500
LB_65499:
	jmp LB_65467
LB_65500:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_65502
LB_65501:
	add r14,1
LB_65502:
	cmp r14,r10
	jge LB_65503
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65501
	cmp al,10
	jz LB_65501
	cmp al,32
	jz LB_65501
LB_65503:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65504
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65505
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65505:
	jmp LB_65467
LB_65504:
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
	jc LB_65487
	btr QWORD [rdi],1
LB_65487:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65488
	btr QWORD [rdi],0
LB_65488:
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
	jc LB_65492
	btr QWORD [rdi],0
LB_65492:
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
	jc LB_65490
	btr QWORD [rdi],0
LB_65490:
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
LB_65467:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg_ptn
	jmp LB_65477
LB_65476:
	add r14,1
LB_65477:
	cmp r14,r10
	jge LB_65478
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65476
	cmp al,10
	jz LB_65476
	cmp al,32
	jz LB_65476
LB_65478:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65479
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65468
LB_65479:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_65482
LB_65481:
	add r14,1
LB_65482:
	cmp r14,r10
	jge LB_65483
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65481
	cmp al,10
	jz LB_65481
	cmp al,32
	jz LB_65481
LB_65483:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65484
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65485
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65485:
	jmp LB_65468
LB_65484:
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
	jc LB_65469
	btr QWORD [rdi],1
LB_65469:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65470
	btr QWORD [rdi],0
LB_65470:
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
	jc LB_65474
	btr QWORD [rdi],0
LB_65474:
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
	jc LB_65472
	btr QWORD [rdi],0
LB_65472:
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
LB_65468:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65527
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65527:
LB_65465:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65671
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65671:
LB_65463:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_65665
LB_65664:
	add r14,1
LB_65665:
	cmp r14,r10
	jge LB_65666
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65664
	cmp al,10
	jz LB_65664
	cmp al,32
	jz LB_65664
LB_65666:
	add r14,2
	cmp r14,r10
	jg LB_65669
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_65669
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_65669
	jmp LB_65670
LB_65669:
	jmp LB_65588
LB_65670:
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
	jmp LB_65635
LB_65634:
	add r14,1
LB_65635:
	cmp r14,r10
	jge LB_65636
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65634
	cmp al,10
	jz LB_65634
	cmp al,32
	jz LB_65634
LB_65636:
	add r14,1
	cmp r14,r10
	jg LB_65639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_65639
	jmp LB_65640
LB_65639:
	jmp LB_65589
LB_65640:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_65642
LB_65641:
	add r14,1
LB_65642:
	cmp r14,r10
	jge LB_65643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65641
	cmp al,10
	jz LB_65641
	cmp al,32
	jz LB_65641
LB_65643:
	add r14,1
	cmp r14,r10
	jg LB_65647
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_65647
	jmp LB_65648
LB_65647:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65645
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65645:
	jmp LB_65589
LB_65648:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_65650
LB_65649:
	add r14,1
LB_65650:
	cmp r14,r10
	jge LB_65651
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65649
	cmp al,10
	jz LB_65649
	cmp al,32
	jz LB_65649
LB_65651:
	push r10
	call NS_E_65290_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65652
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65653
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65653:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65654
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65654:
	jmp LB_65589
LB_65652:
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
LB_65660:
	jmp LB_65657
LB_65656:
	add r14,1
LB_65657:
	cmp r14,r10
	jge LB_65658
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65656
	cmp al,10
	jz LB_65656
	cmp al,32
	jz LB_65656
LB_65658:
	push r10
	push rsi
	call NS_E_65292_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_65659
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_65661
	bts QWORD [rax],0
LB_65661:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_65660
LB_65659:
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
	jc LB_65627
	btr QWORD [rdi],3
LB_65627:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_65628
	btr QWORD [rdi],2
LB_65628:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65629
	btr QWORD [rdi],1
LB_65629:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65630
	btr QWORD [rdi],0
LB_65630:
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
	jc LB_65632
	btr QWORD [rdi],0
LB_65632:
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
LB_65589:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_65608
LB_65607:
	add r14,1
LB_65608:
	cmp r14,r10
	jge LB_65609
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65607
	cmp al,10
	jz LB_65607
	cmp al,32
	jz LB_65607
LB_65609:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65610
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65590
LB_65610:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_65613
LB_65612:
	add r14,1
LB_65613:
	cmp r14,r10
	jge LB_65614
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65612
	cmp al,10
	jz LB_65612
	cmp al,32
	jz LB_65612
LB_65614:
	add r14,1
	cmp r14,r10
	jg LB_65618
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_65618
	jmp LB_65619
LB_65618:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65616
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65616:
	jmp LB_65590
LB_65619:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_65621
LB_65620:
	add r14,1
LB_65621:
	cmp r14,r10
	jge LB_65622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65620
	cmp al,10
	jz LB_65620
	cmp al,32
	jz LB_65620
LB_65622:
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65623
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65624
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65624:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65625
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65625:
	jmp LB_65590
LB_65623:
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
	jc LB_65601
	btr QWORD [rdi],2
LB_65601:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65602
	btr QWORD [rdi],1
LB_65602:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65603
	btr QWORD [rdi],0
LB_65603:
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
	jc LB_65605
	btr QWORD [rdi],0
LB_65605:
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
LB_65590:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_65597
LB_65596:
	add r14,1
LB_65597:
	cmp r14,r10
	jge LB_65598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65596
	cmp al,10
	jz LB_65596
	cmp al,32
	jz LB_65596
LB_65598:
	push r10
	call NS_E_65290_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65599
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65591
LB_65599:
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
	jc LB_65592
	btr QWORD [rdi],0
LB_65592:
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
	jc LB_65594
	btr QWORD [rdi],0
LB_65594:
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
LB_65591:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65662
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65662:
LB_65588:
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
NS_E_65256:
NS_E_RDI_65256:
NS_E_65256_ETR_TBL:
NS_E_65256_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_65731
LB_65730:
	add r14,1
LB_65731:
	cmp r14,r10
	jge LB_65732
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65730
	cmp al,10
	jz LB_65730
	cmp al,32
	jz LB_65730
LB_65732:
	add r14,6
	cmp r14,r10
	jg LB_65735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_65735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_65735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_65735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_65735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_65735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_65735
	jmp LB_65736
LB_65735:
	jmp LB_65712
LB_65736:
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
	jc LB_65728
	btr QWORD [rdi],0
LB_65728:
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
LB_65712:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_65718
LB_65717:
	add r14,1
LB_65718:
	cmp r14,r10
	jge LB_65719
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65717
	cmp al,10
	jz LB_65717
	cmp al,32
	jz LB_65717
LB_65719:
	push r10
	call NS_E_65254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65720
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65713
LB_65720:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_65723
LB_65722:
	add r14,1
LB_65723:
	cmp r14,r10
	jge LB_65724
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65722
	cmp al,10
	jz LB_65722
	cmp al,32
	jz LB_65722
LB_65724:
	push r10
	call NS_E_65256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65725
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65726
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65726:
	jmp LB_65713
LB_65725:
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
	jc LB_65714
	btr QWORD [rdi],1
LB_65714:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65715
	btr QWORD [rdi],0
LB_65715:
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
LB_65713:
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
NS_E_65258:
NS_E_RDI_65258:
NS_E_65258_ETR_TBL:
NS_E_65258_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_65745
LB_65744:
	add r14,1
LB_65745:
	cmp r14,r10
	jge LB_65746
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65744
	cmp al,10
	jz LB_65744
	cmp al,32
	jz LB_65744
LB_65746:
	add r14,1
	cmp r14,r10
	jg LB_65749
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_65749
	jmp LB_65750
LB_65749:
	jmp LB_65737
LB_65750:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_65752
LB_65751:
	add r14,1
LB_65752:
	cmp r14,r10
	jge LB_65753
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65751
	cmp al,10
	jz LB_65751
	cmp al,32
	jz LB_65751
LB_65753:
	add r14,1
	cmp r14,r10
	jg LB_65757
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_65757
	jmp LB_65758
LB_65757:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65755
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65755:
	jmp LB_65737
LB_65758:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_65760
LB_65759:
	add r14,1
LB_65760:
	cmp r14,r10
	jge LB_65761
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65759
	cmp al,10
	jz LB_65759
	cmp al,32
	jz LB_65759
LB_65761:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65762
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65763
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65763:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65764
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65764:
	jmp LB_65737
LB_65762:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_65767
LB_65766:
	add r14,1
LB_65767:
	cmp r14,r10
	jge LB_65768
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65766
	cmp al,10
	jz LB_65766
	cmp al,32
	jz LB_65766
LB_65768:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65769
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_65770
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_65770:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65771
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65771:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65772
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65772:
	jmp LB_65737
LB_65769:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_65775
LB_65774:
	add r14,1
LB_65775:
	cmp r14,r10
	jge LB_65776
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65774
	cmp al,10
	jz LB_65774
	cmp al,32
	jz LB_65774
LB_65776:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65777
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_65778
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_65778:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_65779
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_65779:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65780
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65780:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65781
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65781:
	jmp LB_65737
LB_65777:
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
	jc LB_65738
	btr QWORD [rdi],4
LB_65738:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_65739
	btr QWORD [rdi],3
LB_65739:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_65740
	btr QWORD [rdi],2
LB_65740:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65741
	btr QWORD [rdi],1
LB_65741:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65742
	btr QWORD [rdi],0
LB_65742:
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
LB_65737:
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
NS_E_65260:
NS_E_RDI_65260:
NS_E_65260_ETR_TBL:
NS_E_65260_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_65789
LB_65788:
	add r14,1
LB_65789:
	cmp r14,r10
	jge LB_65790
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65788
	cmp al,10
	jz LB_65788
	cmp al,32
	jz LB_65788
LB_65790:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65791
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65783
LB_65791:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_65794
LB_65793:
	add r14,1
LB_65794:
	cmp r14,r10
	jge LB_65795
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65793
	cmp al,10
	jz LB_65793
	cmp al,32
	jz LB_65793
LB_65795:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65796
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65797
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65797:
	jmp LB_65783
LB_65796:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_65800
LB_65799:
	add r14,1
LB_65800:
	cmp r14,r10
	jge LB_65801
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65799
	cmp al,10
	jz LB_65799
	cmp al,32
	jz LB_65799
LB_65801:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65802
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65803
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65803:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65804
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65804:
	jmp LB_65783
LB_65802:
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
	jc LB_65784
	btr QWORD [rdi],2
LB_65784:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65785
	btr QWORD [rdi],1
LB_65785:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65786
	btr QWORD [rdi],0
LB_65786:
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
LB_65783:
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
NS_E_65262:
NS_E_RDI_65262:
NS_E_65262_ETR_TBL:
NS_E_65262_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_65834
LB_65833:
	add r14,1
LB_65834:
	cmp r14,r10
	jge LB_65835
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65833
	cmp al,10
	jz LB_65833
	cmp al,32
	jz LB_65833
LB_65835:
	add r14,3
	cmp r14,r10
	jg LB_65838
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_65838
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_65838
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_65838
	jmp LB_65839
LB_65838:
	jmp LB_65806
LB_65839:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_65841
LB_65840:
	add r14,1
LB_65841:
	cmp r14,r10
	jge LB_65842
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65840
	cmp al,10
	jz LB_65840
	cmp al,32
	jz LB_65840
LB_65842:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65843
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65844
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65844:
	jmp LB_65806
LB_65843:
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
	jc LB_65830
	btr QWORD [rdi],1
LB_65830:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65831
	btr QWORD [rdi],0
LB_65831:
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
LB_65806:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_65826
LB_65825:
	add r14,1
LB_65826:
	cmp r14,r10
	jge LB_65827
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65825
	cmp al,10
	jz LB_65825
	cmp al,32
	jz LB_65825
LB_65827:
	push r10
	call NS_E_65274_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65828
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65807
LB_65828:
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
	jc LB_65823
	btr QWORD [rdi],0
LB_65823:
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
LB_65807:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_65813
LB_65812:
	add r14,1
LB_65813:
	cmp r14,r10
	jge LB_65814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65812
	cmp al,10
	jz LB_65812
	cmp al,32
	jz LB_65812
LB_65814:
	push r10
	call NS_E_65264_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65815
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65808
LB_65815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_65818
LB_65817:
	add r14,1
LB_65818:
	cmp r14,r10
	jge LB_65819
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65817
	cmp al,10
	jz LB_65817
	cmp al,32
	jz LB_65817
LB_65819:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65820
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65821:
	jmp LB_65808
LB_65820:
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
	jc LB_65809
	btr QWORD [rdi],1
LB_65809:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65810
	btr QWORD [rdi],0
LB_65810:
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
LB_65808:
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
NS_E_65264:
NS_E_RDI_65264:
NS_E_65264_ETR_TBL:
NS_E_65264_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "$"
	jmp LB_66097
LB_66096:
	add r14,1
LB_66097:
	cmp r14,r10
	jge LB_66098
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66096
	cmp al,10
	jz LB_66096
	cmp al,32
	jz LB_66096
LB_66098:
	add r14,1
	cmp r14,r10
	jg LB_66101
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_66101
	jmp LB_66102
LB_66101:
	jmp LB_65846
LB_66102:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_66104
LB_66103:
	add r14,1
LB_66104:
	cmp r14,r10
	jge LB_66105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66103
	cmp al,10
	jz LB_66103
	cmp al,32
	jz LB_66103
LB_66105:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66106
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66107
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66107:
	jmp LB_65846
LB_66106:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_66110
LB_66109:
	add r14,1
LB_66110:
	cmp r14,r10
	jge LB_66111
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66109
	cmp al,10
	jz LB_66109
	cmp al,32
	jz LB_66109
LB_66111:
	add r14,3
	cmp r14,r10
	jg LB_66116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66116
	jmp LB_66117
LB_66116:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66113
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66113:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66114:
	jmp LB_65846
LB_66117:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_66119
LB_66118:
	add r14,1
LB_66119:
	cmp r14,r10
	jge LB_66120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66118
	cmp al,10
	jz LB_66118
	cmp al,32
	jz LB_66118
LB_66120:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66121
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66122
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66122:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66123
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66123:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66124
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66124:
	jmp LB_65846
LB_66121:
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
	jc LB_66091
	btr QWORD [rdi],3
LB_66091:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66092
	btr QWORD [rdi],2
LB_66092:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66093
	btr QWORD [rdi],1
LB_66093:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66094
	btr QWORD [rdi],0
LB_66094:
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
LB_65846:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\151\130"
	jmp LB_66062
LB_66061:
	add r14,1
LB_66062:
	cmp r14,r10
	jge LB_66063
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66061
	cmp al,10
	jz LB_66061
	cmp al,32
	jz LB_66061
LB_66063:
	add r14,3
	cmp r14,r10
	jg LB_66066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_66066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_66066
	jmp LB_66067
LB_66066:
	jmp LB_65847
LB_66067:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_66069
LB_66068:
	add r14,1
LB_66069:
	cmp r14,r10
	jge LB_66070
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66068
	cmp al,10
	jz LB_66068
	cmp al,32
	jz LB_66068
LB_66070:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66071
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66072
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66072:
	jmp LB_65847
LB_66071:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_66075
LB_66074:
	add r14,1
LB_66075:
	cmp r14,r10
	jge LB_66076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66074
	cmp al,10
	jz LB_66074
	cmp al,32
	jz LB_66074
LB_66076:
	add r14,3
	cmp r14,r10
	jg LB_66081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66081
	jmp LB_66082
LB_66081:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66078
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66078:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66079:
	jmp LB_65847
LB_66082:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_66084
LB_66083:
	add r14,1
LB_66084:
	cmp r14,r10
	jge LB_66085
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66083
	cmp al,10
	jz LB_66083
	cmp al,32
	jz LB_66083
LB_66085:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66086
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66087
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66087:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66088
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66088:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66089
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66089:
	jmp LB_65847
LB_66086:
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
	jc LB_66056
	btr QWORD [rdi],3
LB_66056:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66057
	btr QWORD [rdi],2
LB_66057:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66058
	btr QWORD [rdi],1
LB_66058:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66059
	btr QWORD [rdi],0
LB_66059:
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
LB_65847:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\187"
	jmp LB_66050
LB_66049:
	add r14,1
LB_66050:
	cmp r14,r10
	jge LB_66051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66049
	cmp al,10
	jz LB_66049
	cmp al,32
	jz LB_66049
LB_66051:
	add r14,2
	cmp r14,r10
	jg LB_66054
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_66054
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_66054
	jmp LB_66055
LB_66054:
	jmp LB_65848
LB_66055:
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
	jmp LB_66007
LB_66006:
	add r14,1
LB_66007:
	cmp r14,r10
	jge LB_66008
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66006
	cmp al,10
	jz LB_66006
	cmp al,32
	jz LB_66006
LB_66008:
	add r14,2
	cmp r14,r10
	jg LB_66011
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_66011
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_66011
	jmp LB_66012
LB_66011:
	jmp LB_65849
LB_66012:
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
	jmp LB_65928
LB_65927:
	add r14,1
LB_65928:
	cmp r14,r10
	jge LB_65929
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65927
	cmp al,10
	jz LB_65927
	cmp al,32
	jz LB_65927
LB_65929:
	add r14,1
	cmp r14,r10
	jg LB_65932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_65932
	jmp LB_65933
LB_65932:
	jmp LB_65850
LB_65933:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_65935
LB_65934:
	add r14,1
LB_65935:
	cmp r14,r10
	jge LB_65936
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65934
	cmp al,10
	jz LB_65934
	cmp al,32
	jz LB_65934
LB_65936:
	add r14,3
	cmp r14,r10
	jg LB_65940
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_65940
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_65940
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_65940
	jmp LB_65941
LB_65940:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65938
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65938:
	jmp LB_65850
LB_65941:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg
	jmp LB_65943
LB_65942:
	add r14,1
LB_65943:
	cmp r14,r10
	jge LB_65944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65942
	cmp al,10
	jz LB_65942
	cmp al,32
	jz LB_65942
LB_65944:
	push r10
	call NS_E_65288_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65946
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65947:
	jmp LB_65850
LB_65945:
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
LB_65953:
	jmp LB_65950
LB_65949:
	add r14,1
LB_65950:
	cmp r14,r10
	jge LB_65951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65949
	cmp al,10
	jz LB_65949
	cmp al,32
	jz LB_65949
LB_65951:
	push r10
	push rsi
	call NS_E_65266_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_65952
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_65954
	bts QWORD [rax],0
LB_65954:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_65953
LB_65952:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
; "//"
	jmp LB_65956
LB_65955:
	add r14,1
LB_65956:
	cmp r14,r10
	jge LB_65957
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65955
	cmp al,10
	jz LB_65955
	cmp al,32
	jz LB_65955
LB_65957:
	add r14,2
	cmp r14,r10
	jg LB_65964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_65964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_65964
	jmp LB_65965
LB_65964:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_65959
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_65959:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_65960
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_65960:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65961
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65961:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65962
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65962:
	jmp LB_65850
LB_65965:
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
	jc LB_65917
	btr QWORD [rdi],4
LB_65917:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_65918
	btr QWORD [rdi],3
LB_65918:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_65919
	btr QWORD [rdi],2
LB_65919:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65920
	btr QWORD [rdi],1
LB_65920:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65921
	btr QWORD [rdi],0
LB_65921:
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
	jc LB_65925
	btr QWORD [rdi],0
LB_65925:
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
	jc LB_65923
	btr QWORD [rdi],0
LB_65923:
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
LB_65850:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; reg
	jmp LB_65865
LB_65864:
	add r14,1
LB_65865:
	cmp r14,r10
	jge LB_65866
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65864
	cmp al,10
	jz LB_65864
	cmp al,32
	jz LB_65864
LB_65866:
	push r10
	call NS_E_65288_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65867
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65851
LB_65867:
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
LB_65873:
	jmp LB_65870
LB_65869:
	add r14,1
LB_65870:
	cmp r14,r10
	jge LB_65871
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65869
	cmp al,10
	jz LB_65869
	cmp al,32
	jz LB_65869
LB_65871:
	push r10
	push rsi
	call NS_E_65272_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_65872
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_65874
	bts QWORD [rax],0
LB_65874:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_65873
LB_65872:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "\226\138\162"
	jmp LB_65876
LB_65875:
	add r14,1
LB_65876:
	cmp r14,r10
	jge LB_65877
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65875
	cmp al,10
	jz LB_65875
	cmp al,32
	jz LB_65875
LB_65877:
	add r14,3
	cmp r14,r10
	jg LB_65882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_65882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_65882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_65882
	jmp LB_65883
LB_65882:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65879
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65879:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65880:
	jmp LB_65851
LB_65883:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg
	jmp LB_65885
LB_65884:
	add r14,1
LB_65885:
	cmp r14,r10
	jge LB_65886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65884
	cmp al,10
	jz LB_65884
	cmp al,32
	jz LB_65884
LB_65886:
	push r10
	call NS_E_65288_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65887
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_65888
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_65888:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65889
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65889:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65890
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65890:
	jmp LB_65851
LB_65887:
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
LB_65896:
	jmp LB_65893
LB_65892:
	add r14,1
LB_65893:
	cmp r14,r10
	jge LB_65894
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65892
	cmp al,10
	jz LB_65892
	cmp al,32
	jz LB_65892
LB_65894:
	push r10
	push rsi
	call NS_E_65272_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_65895
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_65897
	bts QWORD [rax],0
LB_65897:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_65896
LB_65895:
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
LB_65902:
	jmp LB_65899
LB_65898:
	add r14,1
LB_65899:
	cmp r14,r10
	jge LB_65900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65898
	cmp al,10
	jz LB_65898
	cmp al,32
	jz LB_65898
LB_65900:
	push r10
	push rsi
	call NS_E_65266_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_65901
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_65903
	bts QWORD [rax],0
LB_65903:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_65902
LB_65901:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
; "//"
	jmp LB_65905
LB_65904:
	add r14,1
LB_65905:
	cmp r14,r10
	jge LB_65906
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65904
	cmp al,10
	jz LB_65904
	cmp al,32
	jz LB_65904
LB_65906:
	add r14,2
	cmp r14,r10
	jg LB_65915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_65915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_65915
	jmp LB_65916
LB_65915:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_65908
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_65908:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_65909
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_65909:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_65910
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_65910:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_65911
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_65911:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65912
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65912:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65913
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65913:
	jmp LB_65851
LB_65916:
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
	jc LB_65852
	btr QWORD [rdi],6
LB_65852:
	mov rax,QWORD [rsp+16*6+8*1]
	mov [rdi+8*1+8*6],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_65853
	btr QWORD [rdi],5
LB_65853:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_65854
	btr QWORD [rdi],4
LB_65854:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_65855
	btr QWORD [rdi],3
LB_65855:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_65856
	btr QWORD [rdi],2
LB_65856:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65857
	btr QWORD [rdi],1
LB_65857:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65858
	btr QWORD [rdi],0
LB_65858:
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
	jc LB_65862
	btr QWORD [rdi],0
LB_65862:
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
	jc LB_65860
	btr QWORD [rdi],0
LB_65860:
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
LB_65851:
	add rsp,112
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66004:
LB_65849:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_65975
LB_65974:
	add r14,1
LB_65975:
	cmp r14,r10
	jge LB_65976
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65974
	cmp al,10
	jz LB_65974
	cmp al,32
	jz LB_65974
LB_65976:
	push r10
	call NS_E_65195_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65977
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_65966
LB_65977:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_65980
LB_65979:
	add r14,1
LB_65980:
	cmp r14,r10
	jge LB_65981
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65979
	cmp al,10
	jz LB_65979
	cmp al,32
	jz LB_65979
LB_65981:
	add r14,1
	cmp r14,r10
	jg LB_65985
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_65985
	jmp LB_65986
LB_65985:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65983
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65983:
	jmp LB_65966
LB_65986:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_65988
LB_65987:
	add r14,1
LB_65988:
	cmp r14,r10
	jge LB_65989
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65987
	cmp al,10
	jz LB_65987
	cmp al,32
	jz LB_65987
LB_65989:
	add r14,3
	cmp r14,r10
	jg LB_65994
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_65994
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_65994
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_65994
	jmp LB_65995
LB_65994:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_65991
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_65991:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_65992
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_65992:
	jmp LB_65966
LB_65995:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_65997
LB_65996:
	add r14,1
LB_65997:
	cmp r14,r10
	jge LB_65998
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_65996
	cmp al,10
	jz LB_65996
	cmp al,32
	jz LB_65996
LB_65998:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_65999
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66000
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66000:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66001
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66001:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66002
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66002:
	jmp LB_65966
LB_65999:
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
	jc LB_65967
	btr QWORD [rdi],3
LB_65967:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_65968
	btr QWORD [rdi],2
LB_65968:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_65969
	btr QWORD [rdi],1
LB_65969:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_65970
	btr QWORD [rdi],0
LB_65970:
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
	jc LB_65972
	btr QWORD [rdi],0
LB_65972:
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
LB_65966:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66047:
LB_65848:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_66020
LB_66019:
	add r14,1
LB_66020:
	cmp r14,r10
	jge LB_66021
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66019
	cmp al,10
	jz LB_66019
	cmp al,32
	jz LB_66019
LB_66021:
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66022
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66013
LB_66022:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_66025
LB_66024:
	add r14,1
LB_66025:
	cmp r14,r10
	jge LB_66026
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66024
	cmp al,10
	jz LB_66024
	cmp al,32
	jz LB_66024
LB_66026:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66027
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66028
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66028:
	jmp LB_66013
LB_66027:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_66031
LB_66030:
	add r14,1
LB_66031:
	cmp r14,r10
	jge LB_66032
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66030
	cmp al,10
	jz LB_66030
	cmp al,32
	jz LB_66030
LB_66032:
	add r14,3
	cmp r14,r10
	jg LB_66037
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66037
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66037
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66037
	jmp LB_66038
LB_66037:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66034
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66034:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66035:
	jmp LB_66013
LB_66038:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_66040
LB_66039:
	add r14,1
LB_66040:
	cmp r14,r10
	jge LB_66041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66039
	cmp al,10
	jz LB_66039
	cmp al,32
	jz LB_66039
LB_66041:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66042
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66043
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66043:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66044
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66044:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66045:
	jmp LB_66013
LB_66042:
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
	jc LB_66014
	btr QWORD [rdi],3
LB_66014:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66015
	btr QWORD [rdi],2
LB_66015:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66016
	btr QWORD [rdi],1
LB_66016:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66017
	btr QWORD [rdi],0
LB_66017:
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
LB_66013:
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
NS_E_65266:
NS_E_RDI_65266:
NS_E_65266_ETR_TBL:
NS_E_65266_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_66163
LB_66162:
	add r14,1
LB_66163:
	cmp r14,r10
	jge LB_66164
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66162
	cmp al,10
	jz LB_66162
	cmp al,32
	jz LB_66162
LB_66164:
	push r10
	call NS_E_65268_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66165
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66126
LB_66165:
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
	jc LB_66160
	btr QWORD [rdi],0
LB_66160:
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
LB_66126:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_66156
LB_66155:
	add r14,1
LB_66156:
	cmp r14,r10
	jge LB_66157
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66155
	cmp al,10
	jz LB_66155
	cmp al,32
	jz LB_66155
LB_66157:
	push r10
	call NS_E_63759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66158
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66127
LB_66158:
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
	jc LB_66153
	btr QWORD [rdi],0
LB_66153:
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
LB_66127:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_66149
LB_66148:
	add r14,1
LB_66149:
	cmp r14,r10
	jge LB_66150
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66148
	cmp al,10
	jz LB_66148
	cmp al,32
	jz LB_66148
LB_66150:
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66151
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66128
LB_66151:
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
	jc LB_66146
	btr QWORD [rdi],0
LB_66146:
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
LB_66128:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	jmp LB_66134
LB_66133:
	add r14,1
LB_66134:
	cmp r14,r10
	jge LB_66135
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66133
	cmp al,10
	jz LB_66133
	cmp al,32
	jz LB_66133
LB_66135:
	push r10
	call NS_E_63688_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66136
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66129
LB_66136:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_66139
LB_66138:
	add r14,1
LB_66139:
	cmp r14,r10
	jge LB_66140
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66138
	cmp al,10
	jz LB_66138
	cmp al,32
	jz LB_66138
LB_66140:
	add r14,1
	cmp r14,r10
	jg LB_66144
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_66144
	jmp LB_66145
LB_66144:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66142
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66142:
	jmp LB_66129
LB_66145:
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
	jc LB_66130
	btr QWORD [rdi],1
LB_66130:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66131
	btr QWORD [rdi],0
LB_66131:
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
LB_66129:
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
NS_E_65268:
NS_E_RDI_65268:
NS_E_65268_ETR_TBL:
NS_E_65268_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_66176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_66176
	jmp LB_66177
LB_66176:
	jmp LB_66167
LB_66177:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_65270_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66181
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66182
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66182:
	jmp LB_66167
LB_66181:
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
	jc LB_66168
	btr QWORD [rdi],1
LB_66168:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66169
	btr QWORD [rdi],0
LB_66169:
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
LB_66167:
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
NS_E_65270:
NS_E_RDI_65270:
NS_E_65270_ETR_TBL:
NS_E_65270_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_66207
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_66207
	jmp LB_66208
LB_66207:
	jmp LB_66184
LB_66208:
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
	jc LB_66200
	btr QWORD [rdi],0
LB_66200:
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
LB_66184:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_63686_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66192
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66185
LB_66192:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_65270_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66197
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66198
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66198:
	jmp LB_66185
LB_66197:
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
	jc LB_66186
	btr QWORD [rdi],1
LB_66186:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66187
	btr QWORD [rdi],0
LB_66187:
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
LB_66185:
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
NS_E_65272:
NS_E_RDI_65272:
NS_E_65272_ETR_TBL:
NS_E_65272_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	add r14,1
	cmp r14,r10
	jg LB_66218
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_66218
	jmp LB_66219
LB_66218:
	jmp LB_66209
LB_66219:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg
	push r10
	call NS_E_65288_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66223
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66224:
	jmp LB_66209
LB_66223:
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
	jc LB_66210
	btr QWORD [rdi],1
LB_66210:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66211
	btr QWORD [rdi],0
LB_66211:
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
LB_66209:
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
NS_E_65274:
NS_E_RDI_65274:
NS_E_65274_ETR_TBL:
NS_E_65274_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_66268
LB_66267:
	add r14,1
LB_66268:
	cmp r14,r10
	jge LB_66269
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66267
	cmp al,10
	jz LB_66267
	cmp al,32
	jz LB_66267
LB_66269:
	add r14,3
	cmp r14,r10
	jg LB_66272
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66272
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_66272
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_66272
	jmp LB_66273
LB_66272:
	jmp LB_66226
LB_66273:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_66275
LB_66274:
	add r14,1
LB_66275:
	cmp r14,r10
	jge LB_66276
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66274
	cmp al,10
	jz LB_66274
	cmp al,32
	jz LB_66274
LB_66276:
	push r10
	call NS_E_65278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66277
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66278
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66278:
	jmp LB_66226
LB_66277:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_66281
LB_66280:
	add r14,1
LB_66281:
	cmp r14,r10
	jge LB_66282
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66280
	cmp al,10
	jz LB_66280
	cmp al,32
	jz LB_66280
LB_66282:
	push r10
	call NS_E_65276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66283
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66284
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66284:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66285
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66285:
	jmp LB_66226
LB_66283:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_66288
LB_66287:
	add r14,1
LB_66288:
	cmp r14,r10
	jge LB_66289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66287
	cmp al,10
	jz LB_66287
	cmp al,32
	jz LB_66287
LB_66289:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66290
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66291
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66291:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66292
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66293:
	jmp LB_66226
LB_66290:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_mtc
	jmp LB_66296
LB_66295:
	add r14,1
LB_66296:
	cmp r14,r10
	jge LB_66297
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66295
	cmp al,10
	jz LB_66295
	cmp al,32
	jz LB_66295
LB_66297:
	push r10
	call NS_E_65274_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66298
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_66299
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_66299:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66300
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66300:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66301
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66301:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66302
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66302:
	jmp LB_66226
LB_66298:
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
	jc LB_66261
	btr QWORD [rdi],4
LB_66261:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_66262
	btr QWORD [rdi],3
LB_66262:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66263
	btr QWORD [rdi],2
LB_66263:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66264
	btr QWORD [rdi],1
LB_66264:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66265
	btr QWORD [rdi],0
LB_66265:
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
LB_66226:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_66234
LB_66233:
	add r14,1
LB_66234:
	cmp r14,r10
	jge LB_66235
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66233
	cmp al,10
	jz LB_66233
	cmp al,32
	jz LB_66233
LB_66235:
	add r14,4
	cmp r14,r10
	jg LB_66238
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_66238
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_66238
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_66238
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_66238
	jmp LB_66239
LB_66238:
	jmp LB_66227
LB_66239:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_66241
LB_66240:
	add r14,1
LB_66241:
	cmp r14,r10
	jge LB_66242
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66240
	cmp al,10
	jz LB_66240
	cmp al,32
	jz LB_66240
LB_66242:
	push r10
	call NS_E_65278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66243
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66244
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66244:
	jmp LB_66227
LB_66243:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_66247
LB_66246:
	add r14,1
LB_66247:
	cmp r14,r10
	jge LB_66248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66246
	cmp al,10
	jz LB_66246
	cmp al,32
	jz LB_66246
LB_66248:
	push r10
	call NS_E_65276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66249
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66250
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66250:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66251
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66251:
	jmp LB_66227
LB_66249:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_66254
LB_66253:
	add r14,1
LB_66254:
	cmp r14,r10
	jge LB_66255
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66253
	cmp al,10
	jz LB_66253
	cmp al,32
	jz LB_66253
LB_66255:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66256
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66257
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66257:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66258
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66258:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66259:
	jmp LB_66227
LB_66256:
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
	jc LB_66228
	btr QWORD [rdi],3
LB_66228:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66229
	btr QWORD [rdi],2
LB_66229:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66230
	btr QWORD [rdi],1
LB_66230:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66231
	btr QWORD [rdi],0
LB_66231:
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
LB_66227:
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
NS_E_65276:
NS_E_RDI_65276:
NS_E_65276_ETR_TBL:
NS_E_65276_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_66309
LB_66308:
	add r14,1
LB_66309:
	cmp r14,r10
	jge LB_66310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66308
	cmp al,32
	jz LB_66308
LB_66310:
	add r14,1
	cmp r14,r10
	jg LB_66313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_66313
	jmp LB_66314
LB_66313:
	jmp LB_66304
LB_66314:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_66316
LB_66315:
	add r14,1
LB_66316:
	cmp r14,r10
	jge LB_66317
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66315
	cmp al,32
	jz LB_66315
LB_66317:
	add r14,1
	cmp r14,r10
	jg LB_66321
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_66321
	jmp LB_66322
LB_66321:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66319
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66319:
	jmp LB_66304
LB_66322:
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
	jc LB_66305
	btr QWORD [rdi],1
LB_66305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66306
	btr QWORD [rdi],0
LB_66306:
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
LB_66304:
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
NS_E_65278:
NS_E_RDI_65278:
NS_E_65278_ETR_TBL:
NS_E_65278_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_66330
LB_66329:
	add r14,1
LB_66330:
	cmp r14,r10
	jge LB_66331
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66329
	cmp al,10
	jz LB_66329
	cmp al,32
	jz LB_66329
LB_66331:
	push r10
	call NS_E_65280_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66332
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66323
LB_66332:
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
LB_66338:
	jmp LB_66335
LB_66334:
	add r14,1
LB_66335:
	cmp r14,r10
	jge LB_66336
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66334
	cmp al,10
	jz LB_66334
	cmp al,32
	jz LB_66334
LB_66336:
	push r10
	push rsi
	call NS_E_65282_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_66337
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_66339
	bts QWORD [rax],0
LB_66339:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_66338
LB_66337:
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
	jc LB_66326
	btr QWORD [rdi],1
LB_66326:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66327
	btr QWORD [rdi],0
LB_66327:
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
LB_66323:
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
LB_66324:
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
NS_E_65280:
NS_E_RDI_65280:
NS_E_65280_ETR_TBL:
NS_E_65280_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; reg_ptn
	jmp LB_66373
LB_66372:
	add r14,1
LB_66373:
	cmp r14,r10
	jge LB_66374
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66372
	cmp al,10
	jz LB_66372
	cmp al,32
	jz LB_66372
LB_66374:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66375
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66340
LB_66375:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_66378
LB_66377:
	add r14,1
LB_66378:
	cmp r14,r10
	jge LB_66379
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66377
	cmp al,10
	jz LB_66377
	cmp al,32
	jz LB_66377
LB_66379:
	add r14,3
	cmp r14,r10
	jg LB_66383
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66383
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66383
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66383
	jmp LB_66384
LB_66383:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66381
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66381:
	jmp LB_66340
LB_66384:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_66386
LB_66385:
	add r14,1
LB_66386:
	cmp r14,r10
	jge LB_66387
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66385
	cmp al,10
	jz LB_66385
	cmp al,32
	jz LB_66385
LB_66387:
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66388
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66389
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66389:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66390
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66390:
	jmp LB_66340
LB_66388:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_66393
LB_66392:
	add r14,1
LB_66393:
	cmp r14,r10
	jge LB_66394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66392
	cmp al,10
	jz LB_66392
	cmp al,32
	jz LB_66392
LB_66394:
	add r14,3
	cmp r14,r10
	jg LB_66400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_66400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_66400
	jmp LB_66401
LB_66400:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66396
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66396:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66397
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66397:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66398
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66398:
	jmp LB_66340
LB_66401:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; reg_ptn
	jmp LB_66403
LB_66402:
	add r14,1
LB_66403:
	cmp r14,r10
	jge LB_66404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66402
	cmp al,10
	jz LB_66402
	cmp al,32
	jz LB_66402
LB_66404:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66405
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_66406
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_66406:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66407
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66407:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66408
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66409:
	jmp LB_66340
LB_66405:
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
	jc LB_66366
	btr QWORD [rdi],4
LB_66366:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_66367
	btr QWORD [rdi],3
LB_66367:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66368
	btr QWORD [rdi],2
LB_66368:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66369
	btr QWORD [rdi],1
LB_66369:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66370
	btr QWORD [rdi],0
LB_66370:
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
LB_66340:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_66347
LB_66346:
	add r14,1
LB_66347:
	cmp r14,r10
	jge LB_66348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66346
	cmp al,10
	jz LB_66346
	cmp al,32
	jz LB_66346
LB_66348:
	push r10
	call NS_E_65284_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66349
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66341
LB_66349:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_66352
LB_66351:
	add r14,1
LB_66352:
	cmp r14,r10
	jge LB_66353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66351
	cmp al,10
	jz LB_66351
	cmp al,32
	jz LB_66351
LB_66353:
	add r14,1
	cmp r14,r10
	jg LB_66357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_66357
	jmp LB_66358
LB_66357:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66355
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66355:
	jmp LB_66341
LB_66358:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_66360
LB_66359:
	add r14,1
LB_66360:
	cmp r14,r10
	jge LB_66361
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66359
	cmp al,10
	jz LB_66359
	cmp al,32
	jz LB_66359
LB_66361:
	push r10
	call NS_E_65284_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66362
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66363
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66363:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66364
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66364:
	jmp LB_66341
LB_66362:
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
	jc LB_66342
	btr QWORD [rdi],2
LB_66342:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66343
	btr QWORD [rdi],1
LB_66343:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66344
	btr QWORD [rdi],0
LB_66344:
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
LB_66341:
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
NS_E_65282:
NS_E_RDI_65282:
NS_E_65282_ETR_TBL:
NS_E_65282_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_66416
LB_66415:
	add r14,1
LB_66416:
	cmp r14,r10
	jge LB_66417
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66415
	cmp al,10
	jz LB_66415
	cmp al,32
	jz LB_66415
LB_66417:
	add r14,1
	cmp r14,r10
	jg LB_66420
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_66420
	jmp LB_66421
LB_66420:
	jmp LB_66411
LB_66421:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_66423
LB_66422:
	add r14,1
LB_66423:
	cmp r14,r10
	jge LB_66424
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66422
	cmp al,10
	jz LB_66422
	cmp al,32
	jz LB_66422
LB_66424:
	push r10
	call NS_E_65280_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66425
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66426
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66426:
	jmp LB_66411
LB_66425:
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
	jc LB_66412
	btr QWORD [rdi],1
LB_66412:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66413
	btr QWORD [rdi],0
LB_66413:
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
LB_66411:
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
NS_E_65284:
NS_E_RDI_65284:
NS_E_65284_ETR_TBL:
NS_E_65284_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_66441
LB_66440:
	add r14,1
LB_66441:
	cmp r14,r10
	jge LB_66442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66440
	cmp al,10
	jz LB_66440
	cmp al,32
	jz LB_66440
LB_66442:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66443
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66428
LB_66443:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_66446
LB_66445:
	add r14,1
LB_66446:
	cmp r14,r10
	jge LB_66447
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66445
	cmp al,10
	jz LB_66445
	cmp al,32
	jz LB_66445
LB_66447:
	add r14,1
	cmp r14,r10
	jg LB_66451
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_66451
	jmp LB_66452
LB_66451:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66449
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66449:
	jmp LB_66428
LB_66452:
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
	jc LB_66437
	btr QWORD [rdi],1
LB_66437:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66438
	btr QWORD [rdi],0
LB_66438:
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
LB_66428:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	jmp LB_66433
LB_66432:
	add r14,1
LB_66433:
	cmp r14,r10
	jge LB_66434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66432
	cmp al,10
	jz LB_66432
	cmp al,32
	jz LB_66432
LB_66434:
	push r10
	call NS_E_65195_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66435
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66429
LB_66435:
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
	jc LB_66430
	btr QWORD [rdi],0
LB_66430:
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
LB_66429:
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
NS_E_65286:
NS_E_RDI_65286:
NS_E_65286_ETR_TBL:
NS_E_65286_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_66467
LB_66466:
	add r14,1
LB_66467:
	cmp r14,r10
	jge LB_66468
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66466
	cmp al,10
	jz LB_66466
	cmp al,32
	jz LB_66466
LB_66468:
	add r14,1
	cmp r14,r10
	jg LB_66471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_66471
	jmp LB_66472
LB_66471:
	jmp LB_66453
LB_66472:
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
LB_66477:
	jmp LB_66474
LB_66473:
	add r14,1
LB_66474:
	cmp r14,r10
	jge LB_66475
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66473
	cmp al,10
	jz LB_66473
	cmp al,32
	jz LB_66473
LB_66475:
	push r10
	push rsi
	call NS_E_65286_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_66476
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_66478
	bts QWORD [rax],0
LB_66478:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_66477
LB_66476:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_66480
LB_66479:
	add r14,1
LB_66480:
	cmp r14,r10
	jge LB_66481
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66479
	cmp al,10
	jz LB_66479
	cmp al,32
	jz LB_66479
LB_66481:
	add r14,1
	cmp r14,r10
	jg LB_66486
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_66486
	jmp LB_66487
LB_66486:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66483
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66483:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66484
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66484:
	jmp LB_66453
LB_66487:
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
	jc LB_66462
	btr QWORD [rdi],2
LB_66462:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66463
	btr QWORD [rdi],1
LB_66463:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66464
	btr QWORD [rdi],0
LB_66464:
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
LB_66453:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_66458
LB_66457:
	add r14,1
LB_66458:
	cmp r14,r10
	jge LB_66459
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66457
	cmp al,10
	jz LB_66457
	cmp al,32
	jz LB_66457
LB_66459:
	push r10
	call NS_E_65288_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66460
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66454
LB_66460:
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
	jc LB_66455
	btr QWORD [rdi],0
LB_66455:
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
LB_66454:
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
NS_E_65288:
NS_E_RDI_65288:
NS_E_65288_ETR_TBL:
NS_E_65288_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_66515
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_66515
	jmp LB_66516
LB_66515:
	jmp LB_66488
LB_66516:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66520
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66521
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66521:
	jmp LB_66488
LB_66520:
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
	jc LB_66507
	btr QWORD [rdi],1
LB_66507:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66508
	btr QWORD [rdi],0
LB_66508:
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
LB_66488:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66505
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66489
LB_66505:
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
	jc LB_66500
	btr QWORD [rdi],0
LB_66500:
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
LB_66489:
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
	jg LB_66498
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_66498
	jmp LB_66499
LB_66498:
	jmp LB_66490
LB_66499:
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
	jc LB_66491
	btr QWORD [rdi],0
LB_66491:
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
LB_66490:
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
NS_E_65290:
NS_E_RDI_65290:
NS_E_65290_ETR_TBL:
NS_E_65290_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_66529
LB_66528:
	add r14,1
LB_66529:
	cmp r14,r10
	jge LB_66530
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66528
	cmp al,10
	jz LB_66528
	cmp al,32
	jz LB_66528
LB_66530:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66531
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66523
LB_66531:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_etr_coprd
	jmp LB_66534
LB_66533:
	add r14,1
LB_66534:
	cmp r14,r10
	jge LB_66535
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66533
	cmp al,10
	jz LB_66533
	cmp al,32
	jz LB_66533
LB_66535:
	push r10
	call NS_E_65294_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66536
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66537
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66537:
	jmp LB_66523
LB_66536:
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
LB_66543:
	jmp LB_66540
LB_66539:
	add r14,1
LB_66540:
	cmp r14,r10
	jge LB_66541
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66539
	cmp al,10
	jz LB_66539
	cmp al,32
	jz LB_66539
LB_66541:
	push r10
	push rsi
	call NS_E_65294_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_66542
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_66544
	bts QWORD [rax],0
LB_66544:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_66543
LB_66542:
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
	jc LB_66524
	btr QWORD [rdi],2
LB_66524:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66525
	btr QWORD [rdi],1
LB_66525:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66526
	btr QWORD [rdi],0
LB_66526:
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
LB_66523:
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
NS_E_65292:
NS_E_RDI_65292:
NS_E_65292_ETR_TBL:
NS_E_65292_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_66552
LB_66551:
	add r14,1
LB_66552:
	cmp r14,r10
	jge LB_66553
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66551
	cmp al,10
	jz LB_66551
	cmp al,32
	jz LB_66551
LB_66553:
	add r14,1
	cmp r14,r10
	jg LB_66556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_66556
	jmp LB_66557
LB_66556:
	jmp LB_66545
LB_66557:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_66559
LB_66558:
	add r14,1
LB_66559:
	cmp r14,r10
	jge LB_66560
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66558
	cmp al,10
	jz LB_66558
	cmp al,32
	jz LB_66558
LB_66560:
	add r14,1
	cmp r14,r10
	jg LB_66564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_66564
	jmp LB_66565
LB_66564:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66562
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66562:
	jmp LB_66545
LB_66565:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_66567
LB_66566:
	add r14,1
LB_66567:
	cmp r14,r10
	jge LB_66568
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66566
	cmp al,10
	jz LB_66566
	cmp al,32
	jz LB_66566
LB_66568:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66569
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66570
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66570:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66571:
	jmp LB_66545
LB_66569:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dt_etr_coprd
	jmp LB_66574
LB_66573:
	add r14,1
LB_66574:
	cmp r14,r10
	jge LB_66575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66573
	cmp al,10
	jz LB_66573
	cmp al,32
	jz LB_66573
LB_66575:
	push r10
	call NS_E_65294_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66576
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66577
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66577:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66578
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66578:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66579
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66579:
	jmp LB_66545
LB_66576:
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
	jc LB_66546
	btr QWORD [rdi],3
LB_66546:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66547
	btr QWORD [rdi],2
LB_66547:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66548
	btr QWORD [rdi],1
LB_66548:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66549
	btr QWORD [rdi],0
LB_66549:
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
LB_66545:
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
NS_E_65294:
NS_E_RDI_65294:
NS_E_65294_ETR_TBL:
NS_E_65294_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_66588
LB_66587:
	add r14,1
LB_66588:
	cmp r14,r10
	jge LB_66589
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66587
	cmp al,10
	jz LB_66587
	cmp al,32
	jz LB_66587
LB_66589:
	add r14,3
	cmp r14,r10
	jg LB_66592
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66592
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_66592
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_66592
	jmp LB_66593
LB_66592:
	jmp LB_66581
LB_66593:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_66595
LB_66594:
	add r14,1
LB_66595:
	cmp r14,r10
	jge LB_66596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66594
	cmp al,10
	jz LB_66594
	cmp al,32
	jz LB_66594
LB_66596:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66597
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66598
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66598:
	jmp LB_66581
LB_66597:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_66601
LB_66600:
	add r14,1
LB_66601:
	cmp r14,r10
	jge LB_66602
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66600
	cmp al,10
	jz LB_66600
	cmp al,32
	jz LB_66600
LB_66602:
	add r14,1
	cmp r14,r10
	jg LB_66607
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_66607
	jmp LB_66608
LB_66607:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66604
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66604:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66605
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66605:
	jmp LB_66581
LB_66608:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_66610
LB_66609:
	add r14,1
LB_66610:
	cmp r14,r10
	jge LB_66611
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66609
	cmp al,10
	jz LB_66609
	cmp al,32
	jz LB_66609
LB_66611:
	push r10
	call NS_E_65296_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66612
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66613
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66613:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66614
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66614:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66615
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66615:
	jmp LB_66581
LB_66612:
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
	jc LB_66582
	btr QWORD [rdi],3
LB_66582:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66583
	btr QWORD [rdi],2
LB_66583:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66584
	btr QWORD [rdi],1
LB_66584:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66585
	btr QWORD [rdi],0
LB_66585:
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
LB_66581:
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
NS_E_65296:
NS_E_RDI_65296:
NS_E_65296_ETR_TBL:
NS_E_65296_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_66644
LB_66643:
	add r14,1
LB_66644:
	cmp r14,r10
	jge LB_66645
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66643
	cmp al,10
	jz LB_66643
	cmp al,32
	jz LB_66643
LB_66645:
	push r10
	call NS_E_65298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66646
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66617
LB_66646:
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
	jmp LB_66629
LB_66628:
	add r14,1
LB_66629:
	cmp r14,r10
	jge LB_66630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66628
	cmp al,10
	jz LB_66628
	cmp al,32
	jz LB_66628
LB_66630:
	add r14,3
	cmp r14,r10
	jg LB_66633
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66633
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_66633
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_66633
	jmp LB_66634
LB_66633:
	jmp LB_66618
LB_66634:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_66636
LB_66635:
	add r14,1
LB_66636:
	cmp r14,r10
	jge LB_66637
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66635
	cmp al,10
	jz LB_66635
	cmp al,32
	jz LB_66635
LB_66637:
	push r10
	call NS_E_65296_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66638
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66639
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66639:
	jmp LB_66618
LB_66638:
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
	jc LB_66623
	btr QWORD [rdi],1
LB_66623:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66624
	btr QWORD [rdi],0
LB_66624:
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
	jc LB_66626
	btr QWORD [rdi],0
LB_66626:
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
LB_66618:
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
	jc LB_66621
	btr QWORD [rdi],0
LB_66621:
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
LB_66619:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66641
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66641:
LB_66617:
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
NS_E_65298:
NS_E_RDI_65298:
NS_E_65298_ETR_TBL:
NS_E_65298_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_66675
LB_66674:
	add r14,1
LB_66675:
	cmp r14,r10
	jge LB_66676
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66674
	cmp al,10
	jz LB_66674
	cmp al,32
	jz LB_66674
LB_66676:
	push r10
	call NS_E_65300_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66677
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66648
LB_66677:
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
	jmp LB_66660
LB_66659:
	add r14,1
LB_66660:
	cmp r14,r10
	jge LB_66661
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66659
	cmp al,10
	jz LB_66659
	cmp al,32
	jz LB_66659
LB_66661:
	add r14,3
	cmp r14,r10
	jg LB_66664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_66664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_66664
	jmp LB_66665
LB_66664:
	jmp LB_66649
LB_66665:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_66667
LB_66666:
	add r14,1
LB_66667:
	cmp r14,r10
	jge LB_66668
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66666
	cmp al,10
	jz LB_66666
	cmp al,32
	jz LB_66666
LB_66668:
	push r10
	call NS_E_65300_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66669
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66670
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66670:
	jmp LB_66649
LB_66669:
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
	jc LB_66654
	btr QWORD [rdi],1
LB_66654:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66655
	btr QWORD [rdi],0
LB_66655:
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
	jc LB_66657
	btr QWORD [rdi],0
LB_66657:
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
LB_66649:
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
	jc LB_66652
	btr QWORD [rdi],0
LB_66652:
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
LB_66650:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66672
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66672:
LB_66648:
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
NS_E_65300:
NS_E_RDI_65300:
NS_E_65300_ETR_TBL:
NS_E_65300_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_66691
LB_66690:
	add r14,1
LB_66691:
	cmp r14,r10
	jge LB_66692
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66690
	cmp al,10
	jz LB_66690
	cmp al,32
	jz LB_66690
LB_66692:
	push r10
	call NS_E_65302_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66693
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66679
LB_66693:
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
	jc LB_66688
	btr QWORD [rdi],0
LB_66688:
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
LB_66679:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_66684
LB_66683:
	add r14,1
LB_66684:
	cmp r14,r10
	jge LB_66685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66683
	cmp al,10
	jz LB_66683
	cmp al,32
	jz LB_66683
LB_66685:
	push r10
	call NS_E_64256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66686
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66680
LB_66686:
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
	jc LB_66681
	btr QWORD [rdi],0
LB_66681:
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
LB_66680:
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
NS_E_65302:
NS_E_RDI_65302:
NS_E_65302_ETR_TBL:
NS_E_65302_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66702
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66695
LB_66702:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_66710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_66710
	jmp LB_66711
LB_66710:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66708:
	jmp LB_66695
LB_66711:
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
	jc LB_66696
	btr QWORD [rdi],1
LB_66696:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66697
	btr QWORD [rdi],0
LB_66697:
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
LB_66695:
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
NS_E_65304:
NS_E_RDI_65304:
NS_E_65304_ETR_TBL:
NS_E_65304_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "@"
	jmp LB_66742
LB_66741:
	add r14,1
LB_66742:
	cmp r14,r10
	jge LB_66743
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66741
	cmp al,10
	jz LB_66741
	cmp al,32
	jz LB_66741
LB_66743:
	add r14,1
	cmp r14,r10
	jg LB_66746
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_66746
	jmp LB_66747
LB_66746:
	jmp LB_66712
LB_66747:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_66749
LB_66748:
	add r14,1
LB_66749:
	cmp r14,r10
	jge LB_66750
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66748
	cmp al,10
	jz LB_66748
	cmp al,32
	jz LB_66748
LB_66750:
	add r14,1
	cmp r14,r10
	jg LB_66754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_66754
	jmp LB_66755
LB_66754:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66752
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66752:
	jmp LB_66712
LB_66755:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_66757
LB_66756:
	add r14,1
LB_66757:
	cmp r14,r10
	jge LB_66758
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66756
	cmp al,10
	jz LB_66756
	cmp al,32
	jz LB_66756
LB_66758:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66759
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66760
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66760:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66761
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66761:
	jmp LB_66712
LB_66759:
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
	jmp LB_66733
LB_66732:
	add r14,1
LB_66733:
	cmp r14,r10
	jge LB_66734
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66732
	cmp al,10
	jz LB_66732
	cmp al,32
	jz LB_66732
LB_66734:
	push r10
	call NS_E_65306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66735
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66713
LB_66735:
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
	jc LB_66726
	btr QWORD [rdi],0
LB_66726:
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
	jc LB_66728
	btr QWORD [rdi],2
LB_66728:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66729
	btr QWORD [rdi],1
LB_66729:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66730
	btr QWORD [rdi],0
LB_66730:
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
LB_66713:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_66722
LB_66721:
	add r14,1
LB_66722:
	cmp r14,r10
	jge LB_66723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66721
	cmp al,10
	jz LB_66721
	cmp al,32
	jz LB_66721
LB_66723:
	push r10
	call NS_E_65314_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66724
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66714
LB_66724:
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
	jc LB_66715
	btr QWORD [rdi],0
LB_66715:
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
	jc LB_66717
	btr QWORD [rdi],2
LB_66717:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66718
	btr QWORD [rdi],1
LB_66718:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66719
	btr QWORD [rdi],0
LB_66719:
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
LB_66714:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66737
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66737:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66738
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66738:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66739
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66739:
LB_66712:
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
NS_E_65306:
NS_E_RDI_65306:
NS_E_65306_ETR_TBL:
NS_E_65306_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord_end
	jmp LB_66936
LB_66935:
	add r14,1
LB_66936:
	cmp r14,r10
	jge LB_66937
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66935
	cmp al,10
	jz LB_66935
	cmp al,32
	jz LB_66935
LB_66937:
	push r10
	call NS_E_65312_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66938
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66763
LB_66938:
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
LB_66944:
	jmp LB_66941
LB_66940:
	add r14,1
LB_66941:
	cmp r14,r10
	jge LB_66942
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66940
	cmp al,10
	jz LB_66940
	cmp al,32
	jz LB_66940
LB_66942:
	push r10
	push rsi
	call NS_E_65308_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_66943
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_66945
	bts QWORD [rax],0
LB_66945:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_66944
LB_66943:
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
	jmp LB_66802
LB_66801:
	add r14,1
LB_66802:
	cmp r14,r10
	jge LB_66803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66801
	cmp al,10
	jz LB_66801
	cmp al,32
	jz LB_66801
LB_66803:
	add r14,1
	cmp r14,r10
	jg LB_66806
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_66806
	jmp LB_66807
LB_66806:
	jmp LB_66764
LB_66807:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_66809
LB_66808:
	add r14,1
LB_66809:
	cmp r14,r10
	jge LB_66810
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66808
	cmp al,10
	jz LB_66808
	cmp al,32
	jz LB_66808
LB_66810:
	add r14,3
	cmp r14,r10
	jg LB_66814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66814
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66814
	jmp LB_66815
LB_66814:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66812
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66812:
	jmp LB_66764
LB_66815:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_66817
LB_66816:
	add r14,1
LB_66817:
	cmp r14,r10
	jge LB_66818
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66816
	cmp al,10
	jz LB_66816
	cmp al,32
	jz LB_66816
LB_66818:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66819
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66820
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66820:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66821:
	jmp LB_66764
LB_66819:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_66824
LB_66823:
	add r14,1
LB_66824:
	cmp r14,r10
	jge LB_66825
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66823
	cmp al,10
	jz LB_66823
	cmp al,32
	jz LB_66823
LB_66825:
	push r10
	call NS_E_65306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66826
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66827
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66827:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66828
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66828:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66829
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66829:
	jmp LB_66764
LB_66826:
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
	jc LB_66793
	btr QWORD [rdi],3
LB_66793:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66794
	btr QWORD [rdi],2
LB_66794:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66795
	btr QWORD [rdi],1
LB_66795:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66796
	btr QWORD [rdi],0
LB_66796:
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
	jc LB_66798
	btr QWORD [rdi],1
LB_66798:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66799
	btr QWORD [rdi],0
LB_66799:
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
LB_66764:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_66774
LB_66773:
	add r14,1
LB_66774:
	cmp r14,r10
	jge LB_66775
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66773
	cmp al,10
	jz LB_66773
	cmp al,32
	jz LB_66773
LB_66775:
	add r14,3
	cmp r14,r10
	jg LB_66778
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66778
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66778
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66778
	jmp LB_66779
LB_66778:
	jmp LB_66765
LB_66779:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_66781
LB_66780:
	add r14,1
LB_66781:
	cmp r14,r10
	jge LB_66782
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66780
	cmp al,10
	jz LB_66780
	cmp al,32
	jz LB_66780
LB_66782:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66783
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66784
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66784:
	jmp LB_66765
LB_66783:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_66787
LB_66786:
	add r14,1
LB_66787:
	cmp r14,r10
	jge LB_66788
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66786
	cmp al,10
	jz LB_66786
	cmp al,32
	jz LB_66786
LB_66788:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66789
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66790
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66790:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66791
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66791:
	jmp LB_66765
LB_66789:
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
	jc LB_66766
	btr QWORD [rdi],2
LB_66766:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66767
	btr QWORD [rdi],1
LB_66767:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66768
	btr QWORD [rdi],0
LB_66768:
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
	jc LB_66770
	btr QWORD [rdi],1
LB_66770:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66771
	btr QWORD [rdi],0
LB_66771:
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
LB_66765:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66932
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66932:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66933
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66933:
LB_66763:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord
	jmp LB_66922
LB_66921:
	add r14,1
LB_66922:
	cmp r14,r10
	jge LB_66923
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66921
	cmp al,10
	jz LB_66921
	cmp al,32
	jz LB_66921
LB_66923:
	push r10
	call NS_E_65310_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66924
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66831
LB_66924:
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
LB_66930:
	jmp LB_66927
LB_66926:
	add r14,1
LB_66927:
	cmp r14,r10
	jge LB_66928
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66926
	cmp al,10
	jz LB_66926
	cmp al,32
	jz LB_66926
LB_66928:
	push r10
	push rsi
	call NS_E_65308_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_66929
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_66931
	bts QWORD [rax],0
LB_66931:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_66930
LB_66929:
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
	jmp LB_66880
LB_66879:
	add r14,1
LB_66880:
	cmp r14,r10
	jge LB_66881
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66879
	cmp al,10
	jz LB_66879
	cmp al,32
	jz LB_66879
LB_66881:
	add r14,1
	cmp r14,r10
	jg LB_66884
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_66884
	jmp LB_66885
LB_66884:
	jmp LB_66832
LB_66885:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_66887
LB_66886:
	add r14,1
LB_66887:
	cmp r14,r10
	jge LB_66888
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66886
	cmp al,10
	jz LB_66886
	cmp al,32
	jz LB_66886
LB_66888:
	add r14,3
	cmp r14,r10
	jg LB_66892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66892
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66892
	jmp LB_66893
LB_66892:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66890
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66890:
	jmp LB_66832
LB_66893:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_66895
LB_66894:
	add r14,1
LB_66895:
	cmp r14,r10
	jge LB_66896
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66894
	cmp al,10
	jz LB_66894
	cmp al,32
	jz LB_66894
LB_66896:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66897
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66898
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66898:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66899
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66899:
	jmp LB_66832
LB_66897:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_66902
LB_66901:
	add r14,1
LB_66902:
	cmp r14,r10
	jge LB_66903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66901
	cmp al,10
	jz LB_66901
	cmp al,32
	jz LB_66901
LB_66903:
	push r10
	call NS_E_65306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66904
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66905
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66905:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66906
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66906:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66907
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66907:
	jmp LB_66832
LB_66904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_66910
LB_66909:
	add r14,1
LB_66910:
	cmp r14,r10
	jge LB_66911
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66909
	cmp al,10
	jz LB_66909
	cmp al,32
	jz LB_66909
LB_66911:
	push r10
	call NS_E_65306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66912
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_66913
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_66913:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66914
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66914:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66915
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66915:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66916:
	jmp LB_66832
LB_66912:
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
	jc LB_66870
	btr QWORD [rdi],4
LB_66870:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_66871
	btr QWORD [rdi],3
LB_66871:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66872
	btr QWORD [rdi],2
LB_66872:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66873
	btr QWORD [rdi],1
LB_66873:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66874
	btr QWORD [rdi],0
LB_66874:
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
	jc LB_66876
	btr QWORD [rdi],1
LB_66876:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66877
	btr QWORD [rdi],0
LB_66877:
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
LB_66832:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\138\162"
	jmp LB_66843
LB_66842:
	add r14,1
LB_66843:
	cmp r14,r10
	jge LB_66844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66842
	cmp al,10
	jz LB_66842
	cmp al,32
	jz LB_66842
LB_66844:
	add r14,3
	cmp r14,r10
	jg LB_66847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_66847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_66847
	jmp LB_66848
LB_66847:
	jmp LB_66833
LB_66848:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_66850
LB_66849:
	add r14,1
LB_66850:
	cmp r14,r10
	jge LB_66851
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66849
	cmp al,10
	jz LB_66849
	cmp al,32
	jz LB_66849
LB_66851:
	push r10
	call NS_E_65286_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66852
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66853
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66853:
	jmp LB_66833
LB_66852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_66856
LB_66855:
	add r14,1
LB_66856:
	cmp r14,r10
	jge LB_66857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66855
	cmp al,10
	jz LB_66855
	cmp al,32
	jz LB_66855
LB_66857:
	push r10
	call NS_E_65262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66858
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66859
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66859:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66860
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66860:
	jmp LB_66833
LB_66858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_66863
LB_66862:
	add r14,1
LB_66863:
	cmp r14,r10
	jge LB_66864
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66862
	cmp al,10
	jz LB_66862
	cmp al,32
	jz LB_66862
LB_66864:
	push r10
	call NS_E_65306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66865
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_66866
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_66866:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66867
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66867:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66868
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66868:
	jmp LB_66833
LB_66865:
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
	jc LB_66834
	btr QWORD [rdi],3
LB_66834:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_66835
	btr QWORD [rdi],2
LB_66835:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66836
	btr QWORD [rdi],1
LB_66836:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66837
	btr QWORD [rdi],0
LB_66837:
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
	jc LB_66839
	btr QWORD [rdi],1
LB_66839:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66840
	btr QWORD [rdi],0
LB_66840:
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
LB_66833:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66918
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66918:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66919
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66919:
LB_66831:
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
NS_E_65308:
NS_E_RDI_65308:
NS_E_65308_ETR_TBL:
NS_E_65308_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_66968
LB_66967:
	add r14,1
LB_66968:
	cmp r14,r10
	jge LB_66969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66967
	cmp al,10
	jz LB_66967
	cmp al,32
	jz LB_66967
LB_66969:
	add r14,3
	cmp r14,r10
	jg LB_66972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_66972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_66972
	jmp LB_66973
LB_66972:
	jmp LB_66946
LB_66973:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn
	jmp LB_66975
LB_66974:
	add r14,1
LB_66975:
	cmp r14,r10
	jge LB_66976
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66974
	cmp al,10
	jz LB_66974
	cmp al,32
	jz LB_66974
LB_66976:
	push r10
	call NS_E_65308_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66977
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66978
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66978:
	jmp LB_66946
LB_66977:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_66981
LB_66980:
	add r14,1
LB_66981:
	cmp r14,r10
	jge LB_66982
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66980
	cmp al,10
	jz LB_66980
	cmp al,32
	jz LB_66980
LB_66982:
	add r14,3
	cmp r14,r10
	jg LB_66987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_66987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_66987
	jmp LB_66988
LB_66987:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_66984
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_66984:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_66985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_66985:
	jmp LB_66946
LB_66988:
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
	jc LB_66963
	btr QWORD [rdi],2
LB_66963:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_66964
	btr QWORD [rdi],1
LB_66964:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_66965
	btr QWORD [rdi],0
LB_66965:
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
LB_66946:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_66959
LB_66958:
	add r14,1
LB_66959:
	cmp r14,r10
	jge LB_66960
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66958
	cmp al,10
	jz LB_66958
	cmp al,32
	jz LB_66958
LB_66960:
	push r10
	call NS_E_63759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66961
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66947
LB_66961:
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
	jc LB_66956
	btr QWORD [rdi],0
LB_66956:
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
LB_66947:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_66952
LB_66951:
	add r14,1
LB_66952:
	cmp r14,r10
	jge LB_66953
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66951
	cmp al,10
	jz LB_66951
	cmp al,32
	jz LB_66951
LB_66953:
	push r10
	call NS_E_65158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_66954
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_66948
LB_66954:
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
	jc LB_66949
	btr QWORD [rdi],0
LB_66949:
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
LB_66948:
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
NS_E_65310:
NS_E_RDI_65310:
NS_E_65310_ETR_TBL:
NS_E_65310_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_67013
LB_67012:
	add r14,1
LB_67013:
	cmp r14,r10
	jge LB_67014
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67012
	cmp al,10
	jz LB_67012
	cmp al,32
	jz LB_67012
LB_67014:
	add r14,4
	cmp r14,r10
	jg LB_67017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_67017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_67017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_67017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_67017
	jmp LB_67018
LB_67017:
	jmp LB_66989
LB_67018:
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
	jc LB_67010
	btr QWORD [rdi],0
LB_67010:
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
LB_66989:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_67004
LB_67003:
	add r14,1
LB_67004:
	cmp r14,r10
	jge LB_67005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67003
	cmp al,10
	jz LB_67003
	cmp al,32
	jz LB_67003
LB_67005:
	add r14,4
	cmp r14,r10
	jg LB_67008
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_67008
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_67008
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_67008
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_67008
	jmp LB_67009
LB_67008:
	jmp LB_66990
LB_67009:
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
	jc LB_67001
	btr QWORD [rdi],0
LB_67001:
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
LB_66990:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_66995
LB_66994:
	add r14,1
LB_66995:
	cmp r14,r10
	jge LB_66996
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_66994
	cmp al,10
	jz LB_66994
	cmp al,32
	jz LB_66994
LB_66996:
	add r14,3
	cmp r14,r10
	jg LB_66999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_66999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_66999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_66999
	jmp LB_67000
LB_66999:
	jmp LB_66991
LB_67000:
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
	jc LB_66992
	btr QWORD [rdi],0
LB_66992:
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
LB_66991:
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
NS_E_65312:
NS_E_RDI_65312:
NS_E_65312_ETR_TBL:
NS_E_65312_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_67043
LB_67042:
	add r14,1
LB_67043:
	cmp r14,r10
	jge LB_67044
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67042
	cmp al,10
	jz LB_67042
	cmp al,32
	jz LB_67042
LB_67044:
	add r14,5
	cmp r14,r10
	jg LB_67047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_67047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_67047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_67047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_67047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_67047
	jmp LB_67048
LB_67047:
	jmp LB_67019
LB_67048:
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
	jc LB_67040
	btr QWORD [rdi],0
LB_67040:
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
LB_67019:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_67034
LB_67033:
	add r14,1
LB_67034:
	cmp r14,r10
	jge LB_67035
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67033
	cmp al,10
	jz LB_67033
	cmp al,32
	jz LB_67033
LB_67035:
	add r14,5
	cmp r14,r10
	jg LB_67038
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_67038
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_67038
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_67038
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_67038
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_67038
	jmp LB_67039
LB_67038:
	jmp LB_67020
LB_67039:
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
	jc LB_67031
	btr QWORD [rdi],0
LB_67031:
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
LB_67020:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_67025
LB_67024:
	add r14,1
LB_67025:
	cmp r14,r10
	jge LB_67026
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67024
	cmp al,10
	jz LB_67024
	cmp al,32
	jz LB_67024
LB_67026:
	add r14,4
	cmp r14,r10
	jg LB_67029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_67029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_67029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_67029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_67029
	jmp LB_67030
LB_67029:
	jmp LB_67021
LB_67030:
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
	jc LB_67022
	btr QWORD [rdi],0
LB_67022:
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
LB_67021:
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
NS_E_65314:
NS_E_RDI_65314:
NS_E_65314_ETR_TBL:
NS_E_65314_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_67145
LB_67144:
	add r14,1
LB_67145:
	cmp r14,r10
	jge LB_67146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67144
	cmp al,10
	jz LB_67144
	cmp al,32
	jz LB_67144
LB_67146:
	push r10
	call NS_E_65312_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_67049
LB_67147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_67150
LB_67149:
	add r14,1
LB_67150:
	cmp r14,r10
	jge LB_67151
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67149
	cmp al,10
	jz LB_67149
	cmp al,32
	jz LB_67149
LB_67151:
	push r10
	call NS_E_65316_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67152
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67153
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67153:
	jmp LB_67049
LB_67152:
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
LB_67159:
	jmp LB_67156
LB_67155:
	add r14,1
LB_67156:
	cmp r14,r10
	jge LB_67157
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67155
	cmp al,10
	jz LB_67155
	cmp al,32
	jz LB_67155
LB_67157:
	push r10
	push rsi
	call NS_E_65308_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_67158
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_67160
	bts QWORD [rax],0
LB_67160:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_67159
LB_67158:
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
	jmp LB_67065
LB_67064:
	add r14,1
LB_67065:
	cmp r14,r10
	jge LB_67066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67064
	cmp al,10
	jz LB_67064
	cmp al,32
	jz LB_67064
LB_67066:
	add r14,1
	cmp r14,r10
	jg LB_67069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_67069
	jmp LB_67070
LB_67069:
	jmp LB_67050
LB_67070:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_67072
LB_67071:
	add r14,1
LB_67072:
	cmp r14,r10
	jge LB_67073
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67071
	cmp al,10
	jz LB_67071
	cmp al,32
	jz LB_67071
LB_67073:
	push r10
	call NS_E_65314_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67074
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67075
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67075:
	jmp LB_67050
LB_67074:
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
	jc LB_67057
	btr QWORD [rdi],1
LB_67057:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_67058
	btr QWORD [rdi],0
LB_67058:
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
	jc LB_67060
	btr QWORD [rdi],2
LB_67060:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_67061
	btr QWORD [rdi],1
LB_67061:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_67062
	btr QWORD [rdi],0
LB_67062:
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
LB_67050:
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
	jc LB_67053
	btr QWORD [rdi],2
LB_67053:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_67054
	btr QWORD [rdi],1
LB_67054:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_67055
	btr QWORD [rdi],0
LB_67055:
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
LB_67051:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_67140
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_67140:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_67141
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_67141:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67142
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67142:
LB_67049:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord
	jmp LB_67124
LB_67123:
	add r14,1
LB_67124:
	cmp r14,r10
	jge LB_67125
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67123
	cmp al,10
	jz LB_67123
	cmp al,32
	jz LB_67123
LB_67125:
	push r10
	call NS_E_65310_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67126
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_67077
LB_67126:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_67129
LB_67128:
	add r14,1
LB_67129:
	cmp r14,r10
	jge LB_67130
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67128
	cmp al,10
	jz LB_67128
	cmp al,32
	jz LB_67128
LB_67130:
	push r10
	call NS_E_65316_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67131
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67132
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67132:
	jmp LB_67077
LB_67131:
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
LB_67138:
	jmp LB_67135
LB_67134:
	add r14,1
LB_67135:
	cmp r14,r10
	jge LB_67136
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67134
	cmp al,10
	jz LB_67134
	cmp al,32
	jz LB_67134
LB_67136:
	push r10
	push rsi
	call NS_E_65308_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_67137
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_67139
	bts QWORD [rax],0
LB_67139:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_67138
LB_67137:
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
	jmp LB_67100
LB_67099:
	add r14,1
LB_67100:
	cmp r14,r10
	jge LB_67101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67099
	cmp al,10
	jz LB_67099
	cmp al,32
	jz LB_67099
LB_67101:
	add r14,1
	cmp r14,r10
	jg LB_67104
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_67104
	jmp LB_67105
LB_67104:
	jmp LB_67078
LB_67105:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_67107
LB_67106:
	add r14,1
LB_67107:
	cmp r14,r10
	jge LB_67108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67106
	cmp al,10
	jz LB_67106
	cmp al,32
	jz LB_67106
LB_67108:
	push r10
	call NS_E_65314_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67109
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67110
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67110:
	jmp LB_67078
LB_67109:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_cnc
	jmp LB_67113
LB_67112:
	add r14,1
LB_67113:
	cmp r14,r10
	jge LB_67114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67112
	cmp al,10
	jz LB_67112
	cmp al,32
	jz LB_67112
LB_67114:
	push r10
	call NS_E_65314_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67115
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_67116
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_67116:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67117
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67117:
	jmp LB_67078
LB_67115:
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
	jc LB_67091
	btr QWORD [rdi],2
LB_67091:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_67092
	btr QWORD [rdi],1
LB_67092:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_67093
	btr QWORD [rdi],0
LB_67093:
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
	jc LB_67095
	btr QWORD [rdi],2
LB_67095:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_67096
	btr QWORD [rdi],1
LB_67096:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_67097
	btr QWORD [rdi],0
LB_67097:
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
LB_67078:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_67087
LB_67086:
	add r14,1
LB_67087:
	cmp r14,r10
	jge LB_67088
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67086
	cmp al,10
	jz LB_67086
	cmp al,32
	jz LB_67086
LB_67088:
	push r10
	call NS_E_65314_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67089
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_67079
LB_67089:
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
	jc LB_67080
	btr QWORD [rdi],0
LB_67080:
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
	jc LB_67082
	btr QWORD [rdi],2
LB_67082:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_67083
	btr QWORD [rdi],1
LB_67083:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_67084
	btr QWORD [rdi],0
LB_67084:
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
LB_67079:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_67119
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_67119:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_67120
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_67120:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67121
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67121:
LB_67077:
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
NS_E_65316:
NS_E_RDI_65316:
NS_E_65316_ETR_TBL:
NS_E_65316_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_67168
LB_67167:
	add r14,1
LB_67168:
	cmp r14,r10
	jge LB_67169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67167
	cmp al,10
	jz LB_67167
	cmp al,32
	jz LB_67167
LB_67169:
	push r10
	call NS_E_64127_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_67170
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_67161
LB_67170:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_67173
LB_67172:
	add r14,1
LB_67173:
	cmp r14,r10
	jge LB_67174
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_67172
	cmp al,10
	jz LB_67172
	cmp al,32
	jz LB_67172
LB_67174:
	add r14,1
	cmp r14,r10
	jg LB_67178
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_67178
	jmp LB_67179
LB_67178:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_67176
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_67176:
	jmp LB_67161
LB_67179:
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
	jc LB_67164
	btr QWORD [rdi],1
LB_67164:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_67165
	btr QWORD [rdi],0
LB_67165:
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
LB_67161:
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
LB_67162:
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
NS_E_67203:
NS_E_RDI_67203:
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
; » 0xr0 |~ {  } ⊢ %_67181 : %_67181
 ; {>  %_67180~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_67181
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f65252 { %_67180 %_67181 } ⊢ { %_67182 %_67183 %_67184 } : { %_67182 %_67183 %_67184 }
 ; {>  %_67181~1':_r64 %_67180~0':_stg }
; _f65252 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_65252
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_67204
	btr r12,4
	jmp LB_67205
LB_67204:
	bts r12,4
LB_67205:
	mov r8,r9
	bt r12,3
	jc LB_67208
	btr r12,2
	jmp LB_67209
LB_67208:
	bts r12,2
LB_67209:
	mov rsi,1
	bt r12,2
	jc LB_67206
	mov rsi,0
	bt r8,0
	jc LB_67206
	jmp LB_67207
LB_67206:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_67207:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_67182 %_67183 %_67184 } ⊢ { %_67185 %_67186 %_67187 } : { %_67185 %_67186 %_67187 }
 ; {>  %_67184~2':(_opn)◂(_p65251) %_67182~0':_stg %_67183~1':_r64 }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_67210
	btr r12,3
	jmp LB_67211
LB_67210:
	bts r12,3
LB_67211:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_67214
	btr r12,4
	jmp LB_67215
LB_67214:
	bts r12,4
LB_67215:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_67212
	btr QWORD [rdi],0
	jmp LB_67213
LB_67212:
	bts QWORD [rdi],0
LB_67213:
	mov r10,r14
	bt r12,1
	jc LB_67218
	btr r12,4
	jmp LB_67219
LB_67218:
	bts r12,4
LB_67219:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_67216
	btr QWORD [rdi],1
	jmp LB_67217
LB_67216:
	bts QWORD [rdi],1
LB_67217:
	mov r10,r8
	bt r12,2
	jc LB_67222
	btr r12,4
	jmp LB_67223
LB_67222:
	bts r12,4
LB_67223:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_67220
	btr QWORD [rdi],2
	jmp LB_67221
LB_67220:
	bts QWORD [rdi],2
LB_67221:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_67224
	btr r12,3
	jmp LB_67225
LB_67224:
	bts r12,3
LB_67225:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_67228
	btr r12,4
	jmp LB_67229
LB_67228:
	bts r12,4
LB_67229:
	mov r13,r10
	bt r12,4
	jc LB_67226
	btr r12,0
	jmp LB_67227
LB_67226:
	bts r12,0
LB_67227:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_67232
	btr r12,4
	jmp LB_67233
LB_67232:
	bts r12,4
LB_67233:
	mov r14,r10
	bt r12,4
	jc LB_67230
	btr r12,1
	jmp LB_67231
LB_67230:
	bts r12,1
LB_67231:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_67236
	btr r12,4
	jmp LB_67237
LB_67236:
	bts r12,4
LB_67237:
	mov r8,r10
	bt r12,4
	jc LB_67234
	btr r12,2
	jmp LB_67235
LB_67234:
	bts r12,2
LB_67235:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; 	» "OpADL.mdls" _ ⊢ 3' : %_67188
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,3
; _f20 %_67188 ⊢ { %_67189 %_67190 } : { %_67189 %_67190 }
 ; {>  %_67188~3':_stg %_67186~1':_r64 %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) }
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
	jc LB_67244
	btr r12,0
	jmp LB_67245
LB_67244:
	bts r12,0
LB_67245:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 4' }
	mov r9,r13
	bt r12,0
	jc LB_67246
	btr r12,3
	jmp LB_67247
LB_67246:
	bts r12,3
LB_67247:
	mov r10,r14
	bt r12,1
	jc LB_67248
	btr r12,4
	jmp LB_67249
LB_67248:
	bts r12,4
LB_67249:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_67242
	btr r12,2
	jmp LB_67243
LB_67242:
	bts r12,2
LB_67243:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_67240
	btr r12,1
	jmp LB_67241
LB_67240:
	bts r12,1
LB_67241:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_67238
	btr r12,0
	jmp LB_67239
LB_67238:
	bts r12,0
LB_67239:
	add rsp,32
; _f21 { %_67189 %_67190 } ⊢ { %_67191 %_67192 } : { %_67191 %_67192 }
 ; {>  %_67186~1':_r64 %_67189~3':_stg %_67190~4':_stg %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) }
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
	jc LB_67258
	btr r12,1
	jmp LB_67259
LB_67258:
	bts r12,1
LB_67259:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_67256
	btr QWORD [rdi],0
	jmp LB_67257
LB_67256:
	bts QWORD [rdi],0
LB_67257:
	mov r14,r10
	bt r12,4
	jc LB_67262
	btr r12,1
	jmp LB_67263
LB_67262:
	bts r12,1
LB_67263:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_67260
	btr QWORD [rdi],1
	jmp LB_67261
LB_67260:
	bts QWORD [rdi],1
LB_67261:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 3' 4' }
; 0' ⊢ { 3' 4' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_67266
	btr r12,1
	jmp LB_67267
LB_67266:
	bts r12,1
LB_67267:
	mov r9,r14
	bt r12,1
	jc LB_67264
	btr r12,3
	jmp LB_67265
LB_67264:
	bts r12,3
LB_67265:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_67270
	btr r12,1
	jmp LB_67271
LB_67270:
	bts r12,1
LB_67271:
	mov r10,r14
	bt r12,1
	jc LB_67268
	btr r12,4
	jmp LB_67269
LB_67268:
	bts r12,4
LB_67269:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_67254
	btr r12,2
	jmp LB_67255
LB_67254:
	bts r12,2
LB_67255:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_67252
	btr r12,1
	jmp LB_67253
LB_67252:
	bts r12,1
LB_67253:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_67250
	btr r12,0
	jmp LB_67251
LB_67250:
	bts r12,0
LB_67251:
	add rsp,32
; _f65048 %_67192 ⊢ { %_67193 %_67194 } : { %_67193 %_67194 }
 ; {>  %_67191~3':_stg %_67186~1':_r64 %_67192~4':_stg %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) }
; _f65048 4' ⊢ { 4' 5' }
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
	jc LB_67280
	btr r12,0
	jmp LB_67281
LB_67280:
	bts r12,0
LB_67281:
	call NS_E_65048
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_67282
	btr r12,4
	jmp LB_67283
LB_67282:
	bts r12,4
LB_67283:
	mov r11,r14
	bt r12,1
	jc LB_67284
	btr r12,5
	jmp LB_67285
LB_67284:
	bts r12,5
LB_67285:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_67278
	btr r12,3
	jmp LB_67279
LB_67278:
	bts r12,3
LB_67279:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_67276
	btr r12,2
	jmp LB_67277
LB_67276:
	bts r12,2
LB_67277:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_67274
	btr r12,1
	jmp LB_67275
LB_67274:
	bts r12,1
LB_67275:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_67272
	btr r12,0
	jmp LB_67273
LB_67272:
	bts r12,0
LB_67273:
	add rsp,40
MTC_LB_67286:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_67287
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
	jnc LB_67288
	bt QWORD [rax],0
	jc LB_67289
	btr r12,7
	jmp LB_67290
LB_67289:
	bts r12,7
LB_67290:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_67288:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_67291
	btr r12,6
	jmp LB_67292
LB_67291:
	bts r12,6
LB_67292:
LB_67293:
	cmp r15,0
	jz LB_67294
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_67293
LB_67294:
; » 0xr0 |~ {  } ⊢ %_67196 : %_67196
 ; {>  %_67191~3':_stg %_67193~4':_stg %_67186~1':_r64 %_67195~6':_stg %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) }
; 	» 0xr0 _ ⊢ 5' : %_67196
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f65252 { %_67195 %_67196 } ⊢ { %_67197 %_67198 %_67199 } : { %_67197 %_67198 %_67199 }
 ; {>  %_67191~3':_stg %_67193~4':_stg %_67196~5':_r64 %_67186~1':_r64 %_67195~6':_stg %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) }
; _f65252 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_67305
	btr r12,0
	jmp LB_67306
LB_67305:
	bts r12,0
LB_67306:
	mov r14,r11
	bt r12,5
	jc LB_67307
	btr r12,1
	jmp LB_67308
LB_67307:
	bts r12,1
LB_67308:
	call NS_E_65252
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_67309
	btr r12,5
	jmp LB_67310
LB_67309:
	bts r12,5
LB_67310:
	mov rcx,r14
	bt r12,1
	jc LB_67311
	btr r12,6
	jmp LB_67312
LB_67311:
	bts r12,6
LB_67312:
	mov rdx,r9
	bt r12,3
	jc LB_67315
	btr r12,7
	jmp LB_67316
LB_67315:
	bts r12,7
LB_67316:
	mov rsi,1
	bt r12,7
	jc LB_67313
	mov rsi,0
	bt rdx,0
	jc LB_67313
	jmp LB_67314
LB_67313:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rdx
	mov rdx,rax
	btr r12,7
LB_67314:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_67303
	btr r12,4
	jmp LB_67304
LB_67303:
	bts r12,4
LB_67304:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_67301
	btr r12,3
	jmp LB_67302
LB_67301:
	bts r12,3
LB_67302:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_67299
	btr r12,2
	jmp LB_67300
LB_67299:
	bts r12,2
LB_67300:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_67297
	btr r12,1
	jmp LB_67298
LB_67297:
	bts r12,1
LB_67298:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_67295
	btr r12,0
	jmp LB_67296
LB_67295:
	bts r12,0
LB_67296:
	add rsp,48
; _f21 { %_67197 %_67198 %_67199 } ⊢ { %_67200 %_67201 %_67202 } : { %_67200 %_67201 %_67202 }
 ; {>  %_67191~3':_stg %_67193~4':_stg %_67198~6':_r64 %_67186~1':_r64 %_67197~5':_stg %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) %_67199~7':(_opn)◂(_p65251) }
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
	jc LB_67329
	btr r12,1
	jmp LB_67330
LB_67329:
	bts r12,1
LB_67330:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_67327
	btr QWORD [rdi],0
	jmp LB_67328
LB_67327:
	bts QWORD [rdi],0
LB_67328:
	mov r14,rcx
	bt r12,6
	jc LB_67333
	btr r12,1
	jmp LB_67334
LB_67333:
	bts r12,1
LB_67334:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_67331
	btr QWORD [rdi],1
	jmp LB_67332
LB_67331:
	bts QWORD [rdi],1
LB_67332:
	mov r14,rdx
	bt r12,7
	jc LB_67337
	btr r12,1
	jmp LB_67338
LB_67337:
	bts r12,1
LB_67338:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_67335
	btr QWORD [rdi],2
	jmp LB_67336
LB_67335:
	bts QWORD [rdi],2
LB_67336:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_67341
	btr r12,1
	jmp LB_67342
LB_67341:
	bts r12,1
LB_67342:
	mov r11,r14
	bt r12,1
	jc LB_67339
	btr r12,5
	jmp LB_67340
LB_67339:
	bts r12,5
LB_67340:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_67345
	btr r12,1
	jmp LB_67346
LB_67345:
	bts r12,1
LB_67346:
	mov rcx,r14
	bt r12,1
	jc LB_67343
	btr r12,6
	jmp LB_67344
LB_67343:
	bts r12,6
LB_67344:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_67349
	btr r12,1
	jmp LB_67350
LB_67349:
	bts r12,1
LB_67350:
	mov rdx,r14
	bt r12,1
	jc LB_67347
	btr r12,7
	jmp LB_67348
LB_67347:
	bts r12,7
LB_67348:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_67325
	btr r12,4
	jmp LB_67326
LB_67325:
	bts r12,4
LB_67326:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_67323
	btr r12,3
	jmp LB_67324
LB_67323:
	bts r12,3
LB_67324:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_67321
	btr r12,2
	jmp LB_67322
LB_67321:
	bts r12,2
LB_67322:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_67319
	btr r12,1
	jmp LB_67320
LB_67319:
	bts r12,1
LB_67320:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_67317
	btr r12,0
	jmp LB_67318
LB_67317:
	bts r12,0
LB_67318:
	add rsp,48
; ∎ {  }
 ; {>  %_67191~3':_stg %_67193~4':_stg %_67200~5':_stg %_67186~1':_r64 %_67201~6':_r64 %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) %_67202~7':(_opn)◂(_p65251) }
; 	∎ {  }
	bt r12,3
	jc LB_67351
	mov rdi,r9
	call dlt
LB_67351:
	bt r12,4
	jc LB_67352
	mov rdi,r10
	call dlt
LB_67352:
	bt r12,5
	jc LB_67353
	mov rdi,r11
	call dlt
LB_67353:
	bt r12,1
	jc LB_67354
	mov rdi,r14
	call dlt
LB_67354:
	bt r12,6
	jc LB_67355
	mov rdi,rcx
	call dlt
LB_67355:
	bt r12,0
	jc LB_67356
	mov rdi,r13
	call dlt
LB_67356:
	bt r12,2
	jc LB_67357
	mov rdi,r8
	call dlt
LB_67357:
	bt r12,7
	jc LB_67358
	mov rdi,rdx
	call dlt
LB_67358:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_67287:
	mov r15,0
LB_67360:
	cmp r15,0
	jz LB_67361
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_67360
LB_67361:
; ∎ {  }
 ; {>  %_67191~3':_stg %_67193~4':_stg %_67186~1':_r64 %_67185~0':_stg %_67187~2':(_opn)◂(_p65251) %_67194~5':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,3
	jc LB_67362
	mov rdi,r9
	call dlt
LB_67362:
	bt r12,4
	jc LB_67363
	mov rdi,r10
	call dlt
LB_67363:
	bt r12,1
	jc LB_67364
	mov rdi,r14
	call dlt
LB_67364:
	bt r12,0
	jc LB_67365
	mov rdi,r13
	call dlt
LB_67365:
	bt r12,2
	jc LB_67366
	mov rdi,r8
	call dlt
LB_67366:
	bt r12,5
	jc LB_67367
	mov rdi,r11
	call dlt
LB_67367:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_67359:
section .data
	NS_E_DYN_63686:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63686
	NS_E_DYN_63689:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63689
	NS_E_DYN_63690:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63690
	NS_E_DYN_63691:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63691
	NS_E_DYN_63692:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63692
	NS_E_DYN_63706:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63706
	NS_E_DYN_63749:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63749
	NS_E_DYN_63759:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63759
	NS_E_DYN_63760:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63760
	NS_E_DYN_63761:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63761
	NS_E_DYN_63979:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63979
	NS_E_DYN_64018:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64018
	NS_E_DYN_64057:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64057
	NS_E_DYN_64096:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64096
	NS_E_DYN_64127:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64127
	NS_E_DYN_64128:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64128
	NS_E_DYN_64129:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64129
	NS_E_DYN_64256:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64256
	NS_E_DYN_64315:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_64316:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_64318:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_64319:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_64321:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_64322:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_64323:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64323
	NS_E_DYN_64324:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64324
	NS_E_DYN_64325:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64325
	NS_E_DYN_64326:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64326
	NS_E_DYN_64945:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_64945
	NS_E_DYN_65048:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_65048
	CST_DYN_65134:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_67203:
		dq 0x0000_0001_00_82_ffff
		dq 1
