%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_781
	call NS_E_1609
	call exec_out
	jmp _end
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,r13
	mov rsi,0
	bt r12,0
	setc sil
	call emt_q
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	ret
NS_E_731:
NS_E_RDI_731:
NS_E_731_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_732
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_732:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_734:
NS_E_RDI_734:
NS_E_734_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_734_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_734_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_735:
NS_E_RDI_735:
NS_E_735_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_735_LB_0
	cmp r11,57
	ja NS_E_735_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_735_LB_0:
	mov rax,0
	ret
NS_E_737:
NS_E_RDI_737:
NS_E_737_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_737_LB_0
	cmp r11,122
	ja NS_E_737_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_737_LB_0:
	mov rax,0
	ret
NS_E_736:
NS_E_RDI_736:
NS_E_736_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_736_LB_0
	cmp r11,90
	ja NS_E_736_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_736_LB_0:
	mov rax,0
	ret
NS_E_23:
NS_E_RDI_23:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_27:
	mov rdi,r13
	bt r12,0
NS_E_RDI_27:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
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
	jge err
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
	jge err
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_733:
NS_E_RDI_733:
NS_E_733_ETR_TBL:
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
	jz NS_E_733_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_733_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_738:
NS_E_RDI_738:
NS_E_738_ETR_TBL:
NS_E_738_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_755
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_738_MTC_0_failed
LB_755:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_750
	btr r12,0
	jmp LB_751
LB_750:
	bts r12,0
LB_751:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_747
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_740 ⊢ %_741 : %_741
 ; {>  %_740~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_741
 ; {>  %_741~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_745
	btr r12,3
	jmp LB_746
LB_745:
	bts r12,3
LB_746:
	mov r8,0
	bts r12,2
	ret
LB_747:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_749
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_748
LB_749:
	add rsp,8
	ret
NS_E_738_MTC_0_failed:
	add rsp,16
	pop r14
LB_748:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_739:
NS_E_RDI_739:
NS_E_739_ETR_TBL:
NS_E_739_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "J"
	add r14,1
	cmp r14,r10
	jge LB_767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,74
	jnz LB_767
	jmp LB_768
LB_767:
	jmp NS_E_739_MTC_0_failed
LB_768:
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
	jc LB_760
	btr r12,0
	jmp LB_761
LB_760:
	bts r12,0
LB_761:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_757
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_743 : %_743
 ; {>  %_742~{  }:{ } }
; _none {  } ⊢ °1◂{  }
; ∎ %_743
 ; {>  %_743~°1◂{  }:(_opn)◂(t332'(0)) %_742~{  }:{ } }
; 	∎ °1◂{  }
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
LB_757:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_759
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_758
LB_759:
	add rsp,8
	ret
NS_E_739_MTC_0_failed:
	add rsp,16
	pop r14
LB_758:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_769
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_744 : %_744
 ; {>  }
; _none {  } ⊢ °1◂{  }
; ∎ %_744
 ; {>  %_744~°1◂{  }:(_opn)◂(t335'(0)) }
; 	∎ °1◂{  }
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
LB_769:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_771
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_770
LB_771:
	add rsp,8
	ret
NS_E_739_MTC_1_failed:
	add rsp,0
	pop r14
LB_770:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_781:
NS_E_RDI_781:
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "JJ"
	mov rsi,0x_00_00_00_00_00_00_4a_4a
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_774 : %_774
 ; {>  %_773~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_774
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f739 { %_773 %_774 } ⊢ { %_775 %_776 %_777 } : { %_775 %_776 %_777 }
 ; {>  %_773~0':_stg %_774~1':_r64 }
; _f739 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_739
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_782
	btr r12,4
	jmp LB_783
LB_782:
	bts r12,4
LB_783:
	mov r8,r9
	bt r12,3
	jc LB_786
	btr r12,2
	jmp LB_787
LB_786:
	bts r12,2
LB_787:
	mov rsi,1
	bt r12,2
	jc LB_784
	mov rsi,0
	bt r8,0
	jc LB_784
	jmp LB_785
LB_784:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_785:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_775 %_776 %_777 } ⊢ { %_778 %_779 %_780 } : { %_778 %_779 %_780 }
 ; {>  %_775~0':_stg %_776~1':_r64 %_777~2':(_opn)◂(t349'(0)) }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_788
	btr r12,3
	jmp LB_789
LB_788:
	bts r12,3
LB_789:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_792
	btr r12,4
	jmp LB_793
LB_792:
	bts r12,4
LB_793:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_790
	btr QWORD [rdi],0
	jmp LB_791
LB_790:
	bts QWORD [rdi],0
LB_791:
	mov r10,r14
	bt r12,1
	jc LB_796
	btr r12,4
	jmp LB_797
LB_796:
	bts r12,4
LB_797:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_794
	btr QWORD [rdi],1
	jmp LB_795
LB_794:
	bts QWORD [rdi],1
LB_795:
	mov r10,r8
	bt r12,2
	jc LB_800
	btr r12,4
	jmp LB_801
LB_800:
	bts r12,4
LB_801:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_798
	btr QWORD [rdi],2
	jmp LB_799
LB_798:
	bts QWORD [rdi],2
LB_799:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_802
	btr r12,3
	jmp LB_803
LB_802:
	bts r12,3
LB_803:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_806
	btr r12,4
	jmp LB_807
LB_806:
	bts r12,4
LB_807:
	mov r13,r10
	bt r12,4
	jc LB_804
	btr r12,0
	jmp LB_805
LB_804:
	bts r12,0
LB_805:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_810
	btr r12,4
	jmp LB_811
LB_810:
	bts r12,4
LB_811:
	mov r14,r10
	bt r12,4
	jc LB_808
	btr r12,1
	jmp LB_809
LB_808:
	bts r12,1
LB_809:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_814
	btr r12,4
	jmp LB_815
LB_814:
	bts r12,4
LB_815:
	mov r8,r10
	bt r12,4
	jc LB_812
	btr r12,2
	jmp LB_813
LB_812:
	bts r12,2
LB_813:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_780~2':(_opn)◂(t354'(0)) %_778~0':_stg %_779~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_816
	mov rdi,r8
	call dlt
LB_816:
	bt r12,0
	jc LB_817
	mov rdi,r13
	call dlt
LB_817:
	bt r12,1
	jc LB_818
	mov rdi,r14
	call dlt
LB_818:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_820:
NS_E_RDI_820:
NS_E_820_ETR_TBL:
NS_E_820_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_822_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_910
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_820_MTC_0_failed
LB_910:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_820_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_915
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_916:
	jmp NS_E_820_MTC_0_failed
LB_915:
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
	jc LB_904
	btr QWORD [rdi],1
LB_904:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_905
	btr QWORD [rdi],0
LB_905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_820_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_820_MTC_1_failed:
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
NS_E_822:
NS_E_RDI_822:
NS_E_822_ETR_TBL:
NS_E_822_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_etr
	push r10
	call NS_E_824_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_944
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_822_MTC_0_failed
LB_944:
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
	jc LB_939
	btr QWORD [rdi],0
LB_939:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_822_MTC_0_failed:
	add rsp,16
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst_etr
	push r10
	call NS_E_826_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_937
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_822_MTC_1_failed
LB_937:
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
	jc LB_932
	btr QWORD [rdi],0
LB_932:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_822_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; op_etr
	push r10
	call NS_E_828_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_930
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_822_MTC_2_failed
LB_930:
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
	jc LB_925
	btr QWORD [rdi],0
LB_925:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_822_MTC_2_failed:
	add rsp,16
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dta_etr
	push r10
	call NS_E_830_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_923
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_822_MTC_3_failed
LB_923:
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
	jc LB_918
	btr QWORD [rdi],0
LB_918:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_822_MTC_3_failed:
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
NS_E_824:
NS_E_RDI_824:
NS_E_824_ETR_TBL:
NS_E_824_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_987
LB_986:
	add r14,1
LB_987:
	cmp r14,r10
	jge LB_988
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_986
	cmp rax,10
	jz LB_986
	cmp rax,32
	jz LB_986
LB_988:
	add r14,4
	cmp r14,r10
	jge LB_991
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_991
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_991
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_991
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_991
	jmp LB_992
LB_991:
	jmp NS_E_824_MTC_0_failed
LB_992:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_994
LB_993:
	add r14,1
LB_994:
	cmp r14,r10
	jge LB_995
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_993
	cmp rax,10
	jz LB_993
	cmp rax,32
	jz LB_993
LB_995:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_996
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_997:
	jmp NS_E_824_MTC_0_failed
LB_996:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_1000
LB_999:
	add r14,1
LB_1000:
	cmp r14,r10
	jge LB_1001
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_999
	cmp rax,10
	jz LB_999
	cmp rax,32
	jz LB_999
LB_1001:
	push r10
	call NS_E_820_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1002
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1003
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1003:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1004:
	jmp NS_E_824_MTC_0_failed
LB_1002:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_1007
LB_1006:
	add r14,1
LB_1007:
	cmp r14,r10
	jge LB_1008
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1006
	cmp rax,10
	jz LB_1006
	cmp rax,32
	jz LB_1006
LB_1008:
	add r14,6
	cmp r14,r10
	jge LB_1014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_1014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_1014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_1014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_1014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_1014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_1014
	jmp LB_1015
LB_1014:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1010
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1010:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1011
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1011:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1012
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1012:
	jmp NS_E_824_MTC_0_failed
LB_1015:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_981
	btr QWORD [rdi],3
LB_981:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_982
	btr QWORD [rdi],2
LB_982:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_983
	btr QWORD [rdi],1
LB_983:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_984
	btr QWORD [rdi],0
LB_984:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_824_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_952
LB_951:
	add r14,1
LB_952:
	cmp r14,r10
	jge LB_953
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_951
	cmp rax,10
	jz LB_951
	cmp rax,32
	jz LB_951
LB_953:
	add r14,4
	cmp r14,r10
	jge LB_956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_956
	jmp LB_957
LB_956:
	jmp NS_E_824_MTC_1_failed
LB_957:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_959
LB_958:
	add r14,1
LB_959:
	cmp r14,r10
	jge LB_960
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_958
	cmp rax,10
	jz LB_958
	cmp rax,32
	jz LB_958
LB_960:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_961
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_962
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_962:
	jmp NS_E_824_MTC_1_failed
LB_961:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_965
LB_964:
	add r14,1
LB_965:
	cmp r14,r10
	jge LB_966
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_964
	cmp rax,10
	jz LB_964
	cmp rax,32
	jz LB_964
LB_966:
	add r14,1
	cmp r14,r10
	jge LB_971
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_971
	jmp LB_972
LB_971:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_968
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_968:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_969
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_969:
	jmp NS_E_824_MTC_1_failed
LB_972:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_974
LB_973:
	add r14,1
LB_974:
	cmp r14,r10
	jge LB_975
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_973
	cmp rax,10
	jz LB_973
	cmp rax,32
	jz LB_973
LB_975:
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_976
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_977
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_977:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_978
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_978:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_979
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_979:
	jmp NS_E_824_MTC_1_failed
LB_976:
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
	jc LB_946
	btr QWORD [rdi],3
LB_946:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_947
	btr QWORD [rdi],2
LB_947:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_948
	btr QWORD [rdi],1
LB_948:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_949
	btr QWORD [rdi],0
LB_949:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_824_MTC_1_failed:
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
NS_E_826:
NS_E_RDI_826:
NS_E_826_ETR_TBL:
NS_E_826_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1057
LB_1056:
	add r14,1
LB_1057:
	cmp r14,r10
	jge LB_1058
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1056
	cmp rax,10
	jz LB_1056
	cmp rax,32
	jz LB_1056
LB_1058:
	add r14,2
	cmp r14,r10
	jge LB_1061
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1061
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1061
	jmp LB_1062
LB_1061:
	jmp NS_E_826_MTC_0_failed
LB_1062:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1064
LB_1063:
	add r14,1
LB_1064:
	cmp r14,r10
	jge LB_1065
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1063
	cmp rax,10
	jz LB_1063
	cmp rax,32
	jz LB_1063
LB_1065:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1066
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1067
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1067:
	jmp NS_E_826_MTC_0_failed
LB_1066:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_1070
LB_1069:
	add r14,1
LB_1070:
	cmp r14,r10
	jge LB_1071
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1069
	cmp rax,10
	jz LB_1069
	cmp rax,32
	jz LB_1069
LB_1071:
	add r14,2
	cmp r14,r10
	jge LB_1076
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1076
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_1076
	jmp LB_1077
LB_1076:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1073
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1073:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1074
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1074:
	jmp NS_E_826_MTC_0_failed
LB_1077:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_1079
LB_1078:
	add r14,1
LB_1079:
	cmp r14,r10
	jge LB_1080
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1078
	cmp rax,10
	jz LB_1078
	cmp rax,32
	jz LB_1078
LB_1080:
	push r10
	call NS_E_844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1081
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1082
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1082:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1083
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1083:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1084
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1084:
	jmp NS_E_826_MTC_0_failed
LB_1081:
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
	jc LB_1051
	btr QWORD [rdi],3
LB_1051:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1052
	btr QWORD [rdi],2
LB_1052:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1053
	btr QWORD [rdi],1
LB_1053:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1054
	btr QWORD [rdi],0
LB_1054:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_826_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1022
LB_1021:
	add r14,1
LB_1022:
	cmp r14,r10
	jge LB_1023
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1021
	cmp rax,10
	jz LB_1021
	cmp rax,32
	jz LB_1021
LB_1023:
	add r14,2
	cmp r14,r10
	jge LB_1026
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1026
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1026
	jmp LB_1027
LB_1026:
	jmp NS_E_826_MTC_1_failed
LB_1027:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1029
LB_1028:
	add r14,1
LB_1029:
	cmp r14,r10
	jge LB_1030
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1028
	cmp rax,10
	jz LB_1028
	cmp rax,32
	jz LB_1028
LB_1030:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1031
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1032
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1032:
	jmp NS_E_826_MTC_1_failed
LB_1031:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1035
LB_1034:
	add r14,1
LB_1035:
	cmp r14,r10
	jge LB_1036
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1034
	cmp rax,10
	jz LB_1034
	cmp rax,32
	jz LB_1034
LB_1036:
	add r14,1
	cmp r14,r10
	jge LB_1041
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1041
	jmp LB_1042
LB_1041:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1038
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1038:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1039
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1039:
	jmp NS_E_826_MTC_1_failed
LB_1042:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_1044
LB_1043:
	add r14,1
LB_1044:
	cmp r14,r10
	jge LB_1045
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1043
	cmp rax,10
	jz LB_1043
	cmp rax,32
	jz LB_1043
LB_1045:
	push r10
	call NS_E_832_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1046
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1047
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1047:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1048
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1048:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1049
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1049:
	jmp NS_E_826_MTC_1_failed
LB_1046:
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
	jc LB_1016
	btr QWORD [rdi],3
LB_1016:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1017
	btr QWORD [rdi],2
LB_1017:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1018
	btr QWORD [rdi],1
LB_1018:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1019
	btr QWORD [rdi],0
LB_1019:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_826_MTC_1_failed:
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
NS_E_828:
NS_E_RDI_828:
NS_E_828_ETR_TBL:
NS_E_828_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1127
LB_1126:
	add r14,1
LB_1127:
	cmp r14,r10
	jge LB_1128
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1126
	cmp rax,10
	jz LB_1126
	cmp rax,32
	jz LB_1126
LB_1128:
	add r14,2
	cmp r14,r10
	jge LB_1131
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1131
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1131
	jmp LB_1132
LB_1131:
	jmp NS_E_828_MTC_0_failed
LB_1132:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1134
LB_1133:
	add r14,1
LB_1134:
	cmp r14,r10
	jge LB_1135
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1133
	cmp rax,10
	jz LB_1133
	cmp rax,32
	jz LB_1133
LB_1135:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1136
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1137
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1137:
	jmp NS_E_828_MTC_0_failed
LB_1136:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_1140
LB_1139:
	add r14,1
LB_1140:
	cmp r14,r10
	jge LB_1141
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1139
	cmp rax,10
	jz LB_1139
	cmp rax,32
	jz LB_1139
LB_1141:
	push r10
	call NS_E_856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1142
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1143
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1143:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1144
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1144:
	jmp NS_E_828_MTC_0_failed
LB_1142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_1147
LB_1146:
	add r14,1
LB_1147:
	cmp r14,r10
	jge LB_1148
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1146
	cmp rax,10
	jz LB_1146
	cmp rax,32
	jz LB_1146
LB_1148:
	push r10
	call NS_E_844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1149
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1150
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1150:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1151
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1151:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1152
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1152:
	jmp NS_E_828_MTC_0_failed
LB_1149:
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
	jc LB_1121
	btr QWORD [rdi],3
LB_1121:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1122
	btr QWORD [rdi],2
LB_1122:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1123
	btr QWORD [rdi],1
LB_1123:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1124
	btr QWORD [rdi],0
LB_1124:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_828_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1092
LB_1091:
	add r14,1
LB_1092:
	cmp r14,r10
	jge LB_1093
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1091
	cmp rax,10
	jz LB_1091
	cmp rax,32
	jz LB_1091
LB_1093:
	add r14,2
	cmp r14,r10
	jge LB_1096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1096
	jmp LB_1097
LB_1096:
	jmp NS_E_828_MTC_1_failed
LB_1097:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1099
LB_1098:
	add r14,1
LB_1099:
	cmp r14,r10
	jge LB_1100
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1098
	cmp rax,10
	jz LB_1098
	cmp rax,32
	jz LB_1098
LB_1100:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1101
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1102
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1102:
	jmp NS_E_828_MTC_1_failed
LB_1101:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1105
LB_1104:
	add r14,1
LB_1105:
	cmp r14,r10
	jge LB_1106
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1104
	cmp rax,10
	jz LB_1104
	cmp rax,32
	jz LB_1104
LB_1106:
	add r14,1
	cmp r14,r10
	jge LB_1111
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1111
	jmp LB_1112
LB_1111:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1108
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1108:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1109:
	jmp NS_E_828_MTC_1_failed
LB_1112:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1114
LB_1113:
	add r14,1
LB_1114:
	cmp r14,r10
	jge LB_1115
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1113
	cmp rax,10
	jz LB_1113
	cmp rax,32
	jz LB_1113
LB_1115:
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1116
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1117
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1117:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1118
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1118:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1119
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1119:
	jmp NS_E_828_MTC_1_failed
LB_1116:
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
	jc LB_1086
	btr QWORD [rdi],3
LB_1086:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1087
	btr QWORD [rdi],2
LB_1087:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1088
	btr QWORD [rdi],1
LB_1088:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1089
	btr QWORD [rdi],0
LB_1089:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_828_MTC_1_failed:
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
NS_E_830:
NS_E_RDI_830:
NS_E_830_ETR_TBL:
NS_E_830_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_1194
LB_1193:
	add r14,1
LB_1194:
	cmp r14,r10
	jge LB_1195
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1193
	cmp rax,10
	jz LB_1193
	cmp rax,32
	jz LB_1193
LB_1195:
	add r14,2
	cmp r14,r10
	jge LB_1198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1198
	jmp LB_1199
LB_1198:
	jmp NS_E_830_MTC_0_failed
LB_1199:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1201
LB_1200:
	add r14,1
LB_1201:
	cmp r14,r10
	jge LB_1202
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1200
	cmp rax,10
	jz LB_1200
	cmp rax,32
	jz LB_1200
LB_1202:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1203
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1204
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1204:
	jmp NS_E_830_MTC_0_failed
LB_1203:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_1207
LB_1206:
	add r14,1
LB_1207:
	cmp r14,r10
	jge LB_1208
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1206
	cmp rax,10
	jz LB_1206
	cmp rax,32
	jz LB_1206
LB_1208:
	push r10
	call NS_E_840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1209
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1210
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1210:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1211
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1211:
	jmp NS_E_830_MTC_0_failed
LB_1209:
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
	jc LB_1189
	btr QWORD [rdi],2
LB_1189:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1190
	btr QWORD [rdi],1
LB_1190:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1191
	btr QWORD [rdi],0
LB_1191:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_830_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_1160
LB_1159:
	add r14,1
LB_1160:
	cmp r14,r10
	jge LB_1161
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1159
	cmp rax,10
	jz LB_1159
	cmp rax,32
	jz LB_1159
LB_1161:
	add r14,2
	cmp r14,r10
	jge LB_1164
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1164
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1164
	jmp LB_1165
LB_1164:
	jmp NS_E_830_MTC_1_failed
LB_1165:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1167
LB_1166:
	add r14,1
LB_1167:
	cmp r14,r10
	jge LB_1168
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1166
	cmp rax,10
	jz LB_1166
	cmp rax,32
	jz LB_1166
LB_1168:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1169
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1170
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1170:
	jmp NS_E_830_MTC_1_failed
LB_1169:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1173
LB_1172:
	add r14,1
LB_1173:
	cmp r14,r10
	jge LB_1174
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1172
	cmp rax,10
	jz LB_1172
	cmp rax,32
	jz LB_1172
LB_1174:
	add r14,1
	cmp r14,r10
	jge LB_1179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1179
	jmp LB_1180
LB_1179:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1176
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1176:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1177
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1177:
	jmp NS_E_830_MTC_1_failed
LB_1180:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1182
LB_1181:
	add r14,1
LB_1182:
	cmp r14,r10
	jge LB_1183
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1181
	cmp rax,10
	jz LB_1181
	cmp rax,32
	jz LB_1181
LB_1183:
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1184
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1185
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1185:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1186
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1186:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1187
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1187:
	jmp NS_E_830_MTC_1_failed
LB_1184:
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
	jc LB_1154
	btr QWORD [rdi],3
LB_1154:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1155
	btr QWORD [rdi],2
LB_1155:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1156
	btr QWORD [rdi],1
LB_1156:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1157
	btr QWORD [rdi],0
LB_1157:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_830_MTC_1_failed:
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
NS_E_832:
NS_E_RDI_832:
NS_E_832_ETR_TBL:
NS_E_832_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0xr0"
	add r14,4
	cmp r14,r10
	jge LB_1220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,48
	jnz LB_1220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,120
	jnz LB_1220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,114
	jnz LB_1220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,48
	jnz LB_1220
	jmp LB_1221
LB_1220:
	jmp NS_E_832_MTC_0_failed
LB_1221:
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
	jc LB_1213
	btr QWORD [rdi],0
LB_1213:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_832_MTC_0_failed:
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
NS_E_834:
NS_E_RDI_834:
NS_E_834_ETR_TBL:
NS_E_834_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; cha
	push r10
	call NS_E_836_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1229
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_834_MTC_0_failed
LB_1229:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1234
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1235
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1235:
	jmp NS_E_834_MTC_0_failed
LB_1234:
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
	jc LB_1223
	btr QWORD [rdi],1
LB_1223:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1224
	btr QWORD [rdi],0
LB_1224:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_834_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_834_MTC_1_failed:
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
NS_E_836:
NS_E_RDI_836:
NS_E_836_ETR_TBL:
NS_E_836_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "a"
	add r14,1
	cmp r14,r10
	jge LB_1262
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,97
	jnz LB_1262
	jmp LB_1263
LB_1262:
	jmp NS_E_836_MTC_0_failed
LB_1263:
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
	jc LB_1255
	btr QWORD [rdi],0
LB_1255:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_836_MTC_0_failed:
	add rsp,16
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "b"
	add r14,1
	cmp r14,r10
	jge LB_1253
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,98
	jnz LB_1253
	jmp LB_1254
LB_1253:
	jmp NS_E_836_MTC_1_failed
LB_1254:
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
	jc LB_1246
	btr QWORD [rdi],0
LB_1246:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_836_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "c"
	add r14,1
	cmp r14,r10
	jge LB_1244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,99
	jnz LB_1244
	jmp LB_1245
LB_1244:
	jmp NS_E_836_MTC_2_failed
LB_1245:
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
	jc LB_1237
	btr QWORD [rdi],0
LB_1237:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_836_MTC_2_failed:
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
NS_E_838:
NS_E_RDI_838:
NS_E_838_ETR_TBL:
NS_E_838_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1278
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_838_MTC_0_failed
LB_1278:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jge LB_1286
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1286
	jmp LB_1287
LB_1286:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1284
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1284:
	jmp NS_E_838_MTC_0_failed
LB_1287:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1291
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1292
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1293:
	jmp NS_E_838_MTC_0_failed
LB_1291:
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
	jc LB_1271
	btr QWORD [rdi],2
LB_1271:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1272
	btr QWORD [rdi],1
LB_1272:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1273
	btr QWORD [rdi],0
LB_1273:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_838_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1269
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_838_MTC_1_failed
LB_1269:
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
	jc LB_1264
	btr QWORD [rdi],0
LB_1264:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_838_MTC_1_failed:
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
NS_E_840:
NS_E_RDI_840:
NS_E_840_ETR_TBL:
NS_E_840_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dta_def_coprd
	push r10
	call NS_E_842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1300
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_840_MTC_0_failed
LB_1300:
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
	jc LB_1295
	btr QWORD [rdi],0
LB_1295:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_840_MTC_0_failed:
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
NS_E_842:
NS_E_RDI_842:
NS_E_842_ETR_TBL:
NS_E_842_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_1343
LB_1342:
	add r14,1
LB_1343:
	cmp r14,r10
	jge LB_1344
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1342
	cmp rax,10
	jz LB_1342
	cmp rax,32
	jz LB_1342
LB_1344:
	add r14,3
	cmp r14,r10
	jge LB_1347
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1347
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1347
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1347
	jmp LB_1348
LB_1347:
	jmp NS_E_842_MTC_0_failed
LB_1348:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1350
LB_1349:
	add r14,1
LB_1350:
	cmp r14,r10
	jge LB_1351
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1349
	cmp rax,10
	jz LB_1349
	cmp rax,32
	jz LB_1349
LB_1351:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1352
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1353
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1353:
	jmp NS_E_842_MTC_0_failed
LB_1352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_1356
LB_1355:
	add r14,1
LB_1356:
	cmp r14,r10
	jge LB_1357
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1355
	cmp rax,10
	jz LB_1355
	cmp rax,32
	jz LB_1355
LB_1357:
	add r14,1
	cmp r14,r10
	jge LB_1362
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1362
	jmp LB_1363
LB_1362:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1359
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1359:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1360:
	jmp NS_E_842_MTC_0_failed
LB_1363:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_1365
LB_1364:
	add r14,1
LB_1365:
	cmp r14,r10
	jge LB_1366
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1364
	cmp rax,10
	jz LB_1364
	cmp rax,32
	jz LB_1364
LB_1366:
	push r10
	call NS_E_848_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1367
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1368
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1368:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1369
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1369:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1370
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1370:
	jmp NS_E_842_MTC_0_failed
LB_1367:
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
	jc LB_1337
	btr QWORD [rdi],3
LB_1337:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1338
	btr QWORD [rdi],2
LB_1338:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1339
	btr QWORD [rdi],1
LB_1339:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1340
	btr QWORD [rdi],0
LB_1340:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_842_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_1308
LB_1307:
	add r14,1
LB_1308:
	cmp r14,r10
	jge LB_1309
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1307
	cmp rax,10
	jz LB_1307
	cmp rax,32
	jz LB_1307
LB_1309:
	add r14,3
	cmp r14,r10
	jge LB_1312
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1312
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1312
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1312
	jmp LB_1313
LB_1312:
	jmp NS_E_842_MTC_1_failed
LB_1313:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1315
LB_1314:
	add r14,1
LB_1315:
	cmp r14,r10
	jge LB_1316
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1314
	cmp rax,10
	jz LB_1314
	cmp rax,32
	jz LB_1314
LB_1316:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1317
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1318:
	jmp NS_E_842_MTC_1_failed
LB_1317:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_1321
LB_1320:
	add r14,1
LB_1321:
	cmp r14,r10
	jge LB_1322
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1320
	cmp rax,10
	jz LB_1320
	cmp rax,32
	jz LB_1320
LB_1322:
	add r14,1
	cmp r14,r10
	jge LB_1327
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1327
	jmp LB_1328
LB_1327:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1324
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1324:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1325
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1325:
	jmp NS_E_842_MTC_1_failed
LB_1328:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_1330
LB_1329:
	add r14,1
LB_1330:
	cmp r14,r10
	jge LB_1331
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1329
	cmp rax,10
	jz LB_1329
	cmp rax,32
	jz LB_1329
LB_1331:
	push r10
	call NS_E_848_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1332
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1333
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1333:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1334
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1335:
	jmp NS_E_842_MTC_1_failed
LB_1332:
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
	jc LB_1302
	btr QWORD [rdi],3
LB_1302:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1303
	btr QWORD [rdi],2
LB_1303:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1304
	btr QWORD [rdi],1
LB_1304:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1305
	btr QWORD [rdi],0
LB_1305:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_842_MTC_1_failed:
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
NS_E_844:
NS_E_RDI_844:
NS_E_844_ETR_TBL:
NS_E_844_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; op
	jmp LB_1394
LB_1393:
	add r14,1
LB_1394:
	cmp r14,r10
	jge LB_1395
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1393
	cmp rax,10
	jz LB_1393
	cmp rax,32
	jz LB_1393
LB_1395:
	push r10
	call NS_E_846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1396
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_844_MTC_0_failed
LB_1396:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_1399
LB_1398:
	add r14,1
LB_1399:
	cmp r14,r10
	jge LB_1400
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1398
	cmp rax,10
	jz LB_1398
	cmp rax,32
	jz LB_1398
LB_1400:
	push r10
	call NS_E_856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1401
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1402
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1402:
	jmp NS_E_844_MTC_0_failed
LB_1401:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_1405
LB_1404:
	add r14,1
LB_1405:
	cmp r14,r10
	jge LB_1406
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1404
	cmp rax,10
	jz LB_1404
	cmp rax,32
	jz LB_1404
LB_1406:
	add r14,3
	cmp r14,r10
	jge LB_1411
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1411
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_1411
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_1411
	jmp LB_1412
LB_1411:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1408
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1409:
	jmp NS_E_844_MTC_0_failed
LB_1412:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_1414
LB_1413:
	add r14,1
LB_1414:
	cmp r14,r10
	jge LB_1415
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1413
	cmp rax,10
	jz LB_1413
	cmp rax,32
	jz LB_1413
LB_1415:
	push r10
	call NS_E_856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1416
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1417
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1417:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1418
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1418:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1419
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1419:
	jmp NS_E_844_MTC_0_failed
LB_1416:
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
	jc LB_1388
	btr QWORD [rdi],3
LB_1388:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1389
	btr QWORD [rdi],2
LB_1389:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1390
	btr QWORD [rdi],1
LB_1390:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1391
	btr QWORD [rdi],0
LB_1391:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_844_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_1376
LB_1375:
	add r14,1
LB_1376:
	cmp r14,r10
	jge LB_1377
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1375
	cmp rax,10
	jz LB_1375
	cmp rax,32
	jz LB_1375
LB_1377:
	add r14,3
	cmp r14,r10
	jge LB_1380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_1380
	jmp LB_1381
LB_1380:
	jmp NS_E_844_MTC_1_failed
LB_1381:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_1383
LB_1382:
	add r14,1
LB_1383:
	cmp r14,r10
	jge LB_1384
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1382
	cmp rax,10
	jz LB_1382
	cmp rax,32
	jz LB_1382
LB_1384:
	push r10
	call NS_E_856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1385
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1386
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1386:
	jmp NS_E_844_MTC_1_failed
LB_1385:
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
	jc LB_1372
	btr QWORD [rdi],1
LB_1372:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1373
	btr QWORD [rdi],0
LB_1373:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_844_MTC_1_failed:
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
NS_E_846:
NS_E_RDI_846:
NS_E_846_ETR_TBL:
NS_E_846_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_1440
LB_1439:
	add r14,1
LB_1440:
	cmp r14,r10
	jge LB_1441
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1439
	cmp rax,10
	jz LB_1439
	cmp rax,32
	jz LB_1439
LB_1441:
	push r10
	call NS_E_838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1442
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_846_MTC_0_failed
LB_1442:
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
	jc LB_1437
	btr QWORD [rdi],0
LB_1437:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_846_MTC_0_failed:
	add rsp,16
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_1425
LB_1424:
	add r14,1
LB_1425:
	cmp r14,r10
	jge LB_1426
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1424
	cmp rax,10
	jz LB_1424
	cmp rax,32
	jz LB_1424
LB_1426:
	add r14,2
	cmp r14,r10
	jge LB_1429
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1429
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_1429
	jmp LB_1430
LB_1429:
	jmp NS_E_846_MTC_1_failed
LB_1430:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_1432
LB_1431:
	add r14,1
LB_1432:
	cmp r14,r10
	jge LB_1433
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1431
	cmp rax,10
	jz LB_1431
	cmp rax,32
	jz LB_1431
LB_1433:
	push r10
	call NS_E_832_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1434
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1435
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1435:
	jmp NS_E_846_MTC_1_failed
LB_1434:
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
	jc LB_1421
	btr QWORD [rdi],1
LB_1421:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1422
	btr QWORD [rdi],0
LB_1422:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_846_MTC_1_failed:
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
NS_E_848:
NS_E_RDI_848:
NS_E_848_ETR_TBL:
NS_E_848_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_850_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1449
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_848_MTC_0_failed
LB_1449:
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
	jc LB_1444
	btr QWORD [rdi],0
LB_1444:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_848_MTC_0_failed:
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
NS_E_850:
NS_E_RDI_850:
NS_E_850_ETR_TBL:
NS_E_850_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_1463
LB_1462:
	add r14,1
LB_1463:
	cmp r14,r10
	jge LB_1464
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1462
	cmp rax,10
	jz LB_1462
	cmp rax,32
	jz LB_1462
LB_1464:
	push r10
	call NS_E_852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1465
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_850_MTC_0_failed
LB_1465:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_1468
LB_1467:
	add r14,1
LB_1468:
	cmp r14,r10
	jge LB_1469
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1467
	cmp rax,10
	jz LB_1467
	cmp rax,32
	jz LB_1467
LB_1469:
	add r14,3
	cmp r14,r10
	jge LB_1473
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1473
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_1473
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_1473
	jmp LB_1474
LB_1473:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1471:
	jmp NS_E_850_MTC_0_failed
LB_1474:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_1476
LB_1475:
	add r14,1
LB_1476:
	cmp r14,r10
	jge LB_1477
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1475
	cmp rax,10
	jz LB_1475
	cmp rax,32
	jz LB_1475
LB_1477:
	push r10
	call NS_E_850_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1478
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1479
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1479:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1480
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1480:
	jmp NS_E_850_MTC_0_failed
LB_1478:
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
	jc LB_1458
	btr QWORD [rdi],2
LB_1458:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1459
	btr QWORD [rdi],1
LB_1459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1460
	btr QWORD [rdi],0
LB_1460:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_850_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_1454
LB_1453:
	add r14,1
LB_1454:
	cmp r14,r10
	jge LB_1455
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1453
	cmp rax,10
	jz LB_1453
	cmp rax,32
	jz LB_1453
LB_1455:
	push r10
	call NS_E_852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1456
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_850_MTC_1_failed
LB_1456:
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
	jc LB_1451
	btr QWORD [rdi],0
LB_1451:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_850_MTC_1_failed:
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
NS_E_852:
NS_E_RDI_852:
NS_E_852_ETR_TBL:
NS_E_852_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_1494
LB_1493:
	add r14,1
LB_1494:
	cmp r14,r10
	jge LB_1495
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1493
	cmp rax,10
	jz LB_1493
	cmp rax,32
	jz LB_1493
LB_1495:
	push r10
	call NS_E_854_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1496
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_852_MTC_0_failed
LB_1496:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_1499
LB_1498:
	add r14,1
LB_1499:
	cmp r14,r10
	jge LB_1500
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1498
	cmp rax,10
	jz LB_1498
	cmp rax,32
	jz LB_1498
LB_1500:
	add r14,3
	cmp r14,r10
	jge LB_1504
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1504
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_1504
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_1504
	jmp LB_1505
LB_1504:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1502
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1502:
	jmp NS_E_852_MTC_0_failed
LB_1505:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_1507
LB_1506:
	add r14,1
LB_1507:
	cmp r14,r10
	jge LB_1508
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1506
	cmp rax,10
	jz LB_1506
	cmp rax,32
	jz LB_1506
LB_1508:
	push r10
	call NS_E_854_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1509
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1510
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1510:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1511
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1511:
	jmp NS_E_852_MTC_0_failed
LB_1509:
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
	jc LB_1489
	btr QWORD [rdi],2
LB_1489:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1490
	btr QWORD [rdi],1
LB_1490:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1491
	btr QWORD [rdi],0
LB_1491:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_852_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_1485
LB_1484:
	add r14,1
LB_1485:
	cmp r14,r10
	jge LB_1486
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1484
	cmp rax,10
	jz LB_1484
	cmp rax,32
	jz LB_1484
LB_1486:
	push r10
	call NS_E_854_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1487
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_852_MTC_1_failed
LB_1487:
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
	jc LB_1482
	btr QWORD [rdi],0
LB_1482:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_852_MTC_1_failed:
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
NS_E_854:
NS_E_RDI_854:
NS_E_854_ETR_TBL:
NS_E_854_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1518
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_854_MTC_0_failed
LB_1518:
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
	jc LB_1513
	btr QWORD [rdi],0
LB_1513:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_854_MTC_0_failed:
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
NS_E_856:
NS_E_RDI_856:
NS_E_856_ETR_TBL:
NS_E_856_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_1532
LB_1531:
	add r14,1
LB_1532:
	cmp r14,r10
	jge LB_1533
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1531
	cmp rax,10
	jz LB_1531
	cmp rax,32
	jz LB_1531
LB_1533:
	add r14,1
	cmp r14,r10
	jge LB_1536
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_1536
	jmp LB_1537
LB_1536:
	jmp NS_E_856_MTC_0_failed
LB_1537:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_1539
LB_1538:
	add r14,1
LB_1539:
	cmp r14,r10
	jge LB_1540
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1538
	cmp rax,10
	jz LB_1538
	cmp rax,32
	jz LB_1538
LB_1540:
	push r10
	call NS_E_858_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1542
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1542:
	jmp NS_E_856_MTC_0_failed
LB_1541:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_1545
LB_1544:
	add r14,1
LB_1545:
	cmp r14,r10
	jge LB_1546
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1544
	cmp rax,10
	jz LB_1544
	cmp rax,32
	jz LB_1544
LB_1546:
	add r14,1
	cmp r14,r10
	jge LB_1551
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_1551
	jmp LB_1552
LB_1551:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1548
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1548:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1549
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1549:
	jmp NS_E_856_MTC_0_failed
LB_1552:
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
	jc LB_1527
	btr QWORD [rdi],2
LB_1527:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1528
	btr QWORD [rdi],1
LB_1528:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1529
	btr QWORD [rdi],0
LB_1529:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_856_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_1523
LB_1522:
	add r14,1
LB_1523:
	cmp r14,r10
	jge LB_1524
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1522
	cmp rax,10
	jz LB_1522
	cmp rax,32
	jz LB_1522
LB_1524:
	push r10
	call NS_E_860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1525
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_856_MTC_1_failed
LB_1525:
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
	jc LB_1520
	btr QWORD [rdi],0
LB_1520:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_856_MTC_1_failed:
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
NS_E_858:
NS_E_RDI_858:
NS_E_858_ETR_TBL:
NS_E_858_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_1558
LB_1557:
	add r14,1
LB_1558:
	cmp r14,r10
	jge LB_1559
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1557
	cmp rax,10
	jz LB_1557
	cmp rax,32
	jz LB_1557
LB_1559:
	push r10
	call NS_E_860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1560
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_858_MTC_0_failed
LB_1560:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_1563
LB_1562:
	add r14,1
LB_1563:
	cmp r14,r10
	jge LB_1564
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1562
	cmp rax,10
	jz LB_1562
	cmp rax,32
	jz LB_1562
LB_1564:
	push r10
	call NS_E_858_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1565
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1566
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1566:
	jmp NS_E_858_MTC_0_failed
LB_1565:
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
	jc LB_1554
	btr QWORD [rdi],1
LB_1554:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1555
	btr QWORD [rdi],0
LB_1555:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_858_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_858_MTC_1_failed:
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
NS_E_860:
NS_E_RDI_860:
NS_E_860_ETR_TBL:
NS_E_860_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jge LB_1592
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_1592
	jmp LB_1593
LB_1592:
	jmp NS_E_860_MTC_0_failed
LB_1593:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1597
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1598
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1598:
	jmp NS_E_860_MTC_0_failed
LB_1597:
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
	jc LB_1584
	btr QWORD [rdi],1
LB_1584:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1585
	btr QWORD [rdi],0
LB_1585:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_860_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_1580
LB_1579:
	add r14,1
LB_1580:
	cmp r14,r10
	jge LB_1581
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1579
	cmp rax,10
	jz LB_1579
	cmp rax,32
	jz LB_1579
LB_1581:
	push r10
	call NS_E_834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1582
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_860_MTC_1_failed
LB_1582:
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
	jc LB_1577
	btr QWORD [rdi],0
LB_1577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_860_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jge LB_1575
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1575
	jmp LB_1576
LB_1575:
	jmp NS_E_860_MTC_2_failed
LB_1576:
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
	jc LB_1568
	btr QWORD [rdi],0
LB_1568:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_860_MTC_2_failed:
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
NS_E_1609:
NS_E_RDI_1609:
; » _^ ..
	mov rax,16
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 a \n"
	mov rsi,0x_0a_20_61_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; 	» "a" _ ⊢ 1' : %_1601
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_1602 : %_1602
 ; {>  %_1600~0':_stg %_1601~1':_stg }
; 	» 0xr0 _ ⊢ 2' : %_1602
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f824 { %_1600 %_1602 } ⊢ { %_1603 %_1604 %_1605 } : { %_1603 %_1604 %_1605 }
 ; {>  %_1602~2':_r64 %_1600~0':_stg %_1601~1':_stg }
; _f824 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1612
	btr r12,1
	jmp LB_1613
LB_1612:
	bts r12,1
LB_1613:
	call NS_E_824
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r10,r9
	bt r12,3
	jc LB_1614
	btr r12,4
	jmp LB_1615
LB_1614:
	bts r12,4
LB_1615:
	mov r9,r10
	bt r12,4
	jc LB_1618
	btr r12,3
	jmp LB_1619
LB_1618:
	bts r12,3
LB_1619:
	mov rsi,1
	bt r12,3
	jc LB_1616
	mov rsi,0
	bt r9,0
	jc LB_1616
	jmp LB_1617
LB_1616:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_1617:
	mov rax,r8
	shl rax,56
	or rax,1
	mov rdi,rax
	or r9,rdi
	mov r8,r14
	bt r12,1
	jc LB_1620
	btr r12,2
	jmp LB_1621
LB_1620:
	bts r12,2
LB_1621:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1610
	btr r12,1
	jmp LB_1611
LB_1610:
	bts r12,1
LB_1611:
	add rsp,16
; _f20 { %_1603 %_1604 %_1605 } ⊢ { %_1606 %_1607 %_1608 } : { %_1606 %_1607 %_1608 }
 ; {>  %_1605~3':(_opn)◂(_p823) %_1603~0':_stg %_1604~2':_r64 %_1601~1':_stg }
; _f20 { 0' 2' 3' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ 0' 2' 3' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_1624
	btr r12,1
	jmp LB_1625
LB_1624:
	bts r12,1
LB_1625:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r14
	bt r12,1
	jc LB_1628
	btr r12,4
	jmp LB_1629
LB_1628:
	bts r12,4
LB_1629:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_1626
	btr QWORD [rdi],0
	jmp LB_1627
LB_1626:
	bts QWORD [rdi],0
LB_1627:
	mov r10,r8
	bt r12,2
	jc LB_1632
	btr r12,4
	jmp LB_1633
LB_1632:
	bts r12,4
LB_1633:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_1630
	btr QWORD [rdi],1
	jmp LB_1631
LB_1630:
	bts QWORD [rdi],1
LB_1631:
	mov r10,r9
	bt r12,3
	jc LB_1636
	btr r12,4
	jmp LB_1637
LB_1636:
	bts r12,4
LB_1637:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_1634
	btr QWORD [rdi],2
	jmp LB_1635
LB_1634:
	bts QWORD [rdi],2
LB_1635:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 2' 3' }
	mov r14,r13
	bt r12,0
	jc LB_1638
	btr r12,1
	jmp LB_1639
LB_1638:
	bts r12,1
LB_1639:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1642
	btr r12,4
	jmp LB_1643
LB_1642:
	bts r12,4
LB_1643:
	mov r13,r10
	bt r12,4
	jc LB_1640
	btr r12,0
	jmp LB_1641
LB_1640:
	bts r12,0
LB_1641:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1646
	btr r12,4
	jmp LB_1647
LB_1646:
	bts r12,4
LB_1647:
	mov r8,r10
	bt r12,4
	jc LB_1644
	btr r12,2
	jmp LB_1645
LB_1644:
	bts r12,2
LB_1645:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_1650
	btr r12,4
	jmp LB_1651
LB_1650:
	bts r12,4
LB_1651:
	mov r9,r10
	bt r12,4
	jc LB_1648
	btr r12,3
	jmp LB_1649
LB_1648:
	bts r12,3
LB_1649:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1622
	btr r12,1
	jmp LB_1623
LB_1622:
	bts r12,1
LB_1623:
	add rsp,16
; ∎ {  }
 ; {>  %_1606~0':_stg %_1607~2':_r64 %_1601~1':_stg %_1608~3':(_opn)◂(_p823) }
; 	∎ {  }
	bt r12,0
	jc LB_1652
	mov rdi,r13
	call dlt
LB_1652:
	bt r12,2
	jc LB_1653
	mov rdi,r8
	call dlt
LB_1653:
	bt r12,1
	jc LB_1654
	mov rdi,r14
	call dlt
LB_1654:
	bt r12,3
	jc LB_1655
	mov rdi,r9
	call dlt
LB_1655:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_731:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_731
	NS_E_DYN_734:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_734
	NS_E_DYN_735:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_735
	NS_E_DYN_736:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_736
	NS_E_DYN_737:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_737
	NS_E_DYN_738:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_738
	NS_E_DYN_739:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_739
	CST_DYN_781:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_861:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_862:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_820:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_820
	NS_E_DYN_863:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_864:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_865:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_866:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_822:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_822
	NS_E_DYN_867:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_868:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_824:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_824
	NS_E_DYN_869:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_870:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_826:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_826
	NS_E_DYN_871:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_872:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_828:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_828
	NS_E_DYN_873:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_874:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_830:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_830
	NS_E_DYN_875:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_832:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_832
	NS_E_DYN_876:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_877:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_834:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_834
	NS_E_DYN_878:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_879:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_880:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_836:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_836
	NS_E_DYN_881:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_882:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_838:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_838
	NS_E_DYN_883:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_840:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_840
	NS_E_DYN_884:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_885:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_842:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_842
	NS_E_DYN_886:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_887:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_844:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_844
	NS_E_DYN_888:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_889:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_846:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_846
	NS_E_DYN_890:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_848:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_848
	NS_E_DYN_891:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_892:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_850:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_850
	NS_E_DYN_893:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_894:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_852:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_852
	NS_E_DYN_895:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_854:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_854
	NS_E_DYN_896:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_897:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_856:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_856
	NS_E_DYN_898:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_899:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_858:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_858
	NS_E_DYN_900:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_901:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_902:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_860:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_860
	CST_DYN_1609:
		dq 0x0000_0001_00_82_ffff
		dq 1
