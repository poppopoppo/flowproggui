%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_778
	call NS_E_882
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
NS_E_769:
NS_E_RDI_769:
NS_E_769_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_770
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_770:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_772:
NS_E_RDI_772:
NS_E_772_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_772_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_772_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_773:
NS_E_RDI_773:
NS_E_773_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_773_LB_0
	cmp r11,57
	ja NS_E_773_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_773_LB_0:
	mov rax,0
	ret
NS_E_775:
NS_E_RDI_775:
NS_E_775_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_775_LB_0
	cmp r11,122
	ja NS_E_775_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_775_LB_0:
	mov rax,0
	ret
NS_E_774:
NS_E_RDI_774:
NS_E_774_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_774_LB_0
	cmp r11,90
	ja NS_E_774_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_774_LB_0:
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
NS_E_771:
NS_E_RDI_771:
NS_E_771_ETR_TBL:
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
	jz NS_E_771_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_771_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_778:
NS_E_RDI_778:
; 	» "-27686gg" _ ⊢ 0' : %_776
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f21 %_776 ⊢ %_777 : %_777
 ; {>  %_776~0':_stg }
; _f21 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_777~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_779
	mov rdi,r13
	call dlt
LB_779:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_787:
; 	|» 0'
NS_E_RDI_787:
MTC_LB_788:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_789
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
	jnc LB_790
	bt QWORD [rax],0
	jc LB_791
	btr r12,3
	jmp LB_792
LB_791:
	bts r12,3
LB_792:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_790:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_795
	btr r12,4
	jmp LB_796
LB_795:
	bts r12,4
LB_796:
	mov r14,r10
	bt r12,4
	jc LB_793
	btr r12,1
	jmp LB_794
LB_793:
	bts r12,1
LB_794:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_799
	btr r12,4
	jmp LB_800
LB_799:
	bts r12,4
LB_800:
	mov r8,r10
	bt r12,4
	jc LB_797
	btr r12,2
	jmp LB_798
LB_797:
	bts r12,2
LB_798:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_789
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
	jnc LB_801
	bt QWORD [rax],0
	jc LB_802
	btr r12,5
	jmp LB_803
LB_802:
	bts r12,5
LB_803:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_801:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_806
	btr r12,6
	jmp LB_807
LB_806:
	bts r12,6
LB_807:
	mov r9,rcx
	bt r12,6
	jc LB_804
	btr r12,3
	jmp LB_805
LB_804:
	bts r12,3
LB_805:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_810
	btr r12,6
	jmp LB_811
LB_810:
	bts r12,6
LB_811:
	mov r10,rcx
	bt r12,6
	jc LB_808
	btr r12,4
	jmp LB_809
LB_808:
	bts r12,4
LB_809:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_812:
	cmp r15,0
	jz LB_813
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_812
LB_813:
; ∎ {  }
 ; {>  %_781~1':t277'(-1) %_784~4':(_lst)◂(t277'(-1)) %_783~3':t277'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_814
	mov rdi,r14
	call dlt
LB_814:
	bt r12,4
	jc LB_815
	mov rdi,r10
	call dlt
LB_815:
	bt r12,3
	jc LB_816
	mov rdi,r9
	call dlt
LB_816:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_789:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_817
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
	jnc LB_818
	bt QWORD [rax],0
	jc LB_819
	btr r12,3
	jmp LB_820
LB_819:
	bts r12,3
LB_820:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_818:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_823
	btr r12,4
	jmp LB_824
LB_823:
	bts r12,4
LB_824:
	mov r14,r10
	bt r12,4
	jc LB_821
	btr r12,1
	jmp LB_822
LB_821:
	bts r12,1
LB_822:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_827
	btr r12,4
	jmp LB_828
LB_827:
	bts r12,4
LB_828:
	mov r8,r10
	bt r12,4
	jc LB_825
	btr r12,2
	jmp LB_826
LB_825:
	bts r12,2
LB_826:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_817
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
	jnc LB_829
	bt QWORD [rax],0
	jc LB_830
	btr r12,3
	jmp LB_831
LB_830:
	bts r12,3
LB_831:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_829:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_832:
	cmp r15,0
	jz LB_833
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_832
LB_833:
; ∎ {  }
 ; {>  %_785~1':t277'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_834
	mov rdi,r14
	call dlt
LB_834:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_817:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_835
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
	jnc LB_836
	bt QWORD [rax],0
	jc LB_837
	btr r12,1
	jmp LB_838
LB_837:
	bts r12,1
LB_838:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_836:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_839:
	cmp r15,0
	jz LB_840
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_839
LB_840:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_835:
NS_E_842:
NS_E_RDI_842:
NS_E_842_ETR_TBL:
NS_E_842_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_864
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_864
	jmp LB_865
LB_864:
	jmp LB_845
LB_865:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "B"
	add r14,1
	cmp r14,r10
	jg LB_872
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,66
	jnz LB_872
	jmp LB_873
LB_872:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_870
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_870:
	jmp LB_845
LB_873:
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
	jc LB_856
	btr QWORD [rdi],1
LB_856:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_857
	btr QWORD [rdi],0
LB_857:
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
LB_845:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "AC"
	add r14,2
	cmp r14,r10
	jg LB_854
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,65
	jnz LB_854
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,67
	jnz LB_854
	jmp LB_855
LB_854:
	jmp LB_846
LB_855:
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
	jc LB_847
	btr QWORD [rdi],0
LB_847:
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
LB_846:
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
NS_E_882:
NS_E_RDI_882:
; 	» "AC" _ ⊢ 0' : %_874
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_43_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_875 : %_875
 ; {>  %_874~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_875
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f842 { %_874 %_875 } ⊢ { %_876 %_877 %_878 } : { %_876 %_877 %_878 }
 ; {>  %_874~0':_stg %_875~1':_r64 }
; _f842 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_842
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_883
	btr r12,4
	jmp LB_884
LB_883:
	bts r12,4
LB_884:
	mov r8,r9
	bt r12,3
	jc LB_887
	btr r12,2
	jmp LB_888
LB_887:
	bts r12,2
LB_888:
	mov rsi,1
	bt r12,2
	jc LB_885
	mov rsi,0
	bt r8,0
	jc LB_885
	jmp LB_886
LB_885:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_886:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_876 %_877 %_878 } ⊢ { %_879 %_880 %_881 } : { %_879 %_880 %_881 }
 ; {>  %_878~2':(_opn)◂(_p841) %_877~1':_r64 %_876~0':_stg }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_889
	btr r12,3
	jmp LB_890
LB_889:
	bts r12,3
LB_890:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_893
	btr r12,4
	jmp LB_894
LB_893:
	bts r12,4
LB_894:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_891
	btr QWORD [rdi],0
	jmp LB_892
LB_891:
	bts QWORD [rdi],0
LB_892:
	mov r10,r14
	bt r12,1
	jc LB_897
	btr r12,4
	jmp LB_898
LB_897:
	bts r12,4
LB_898:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_895
	btr QWORD [rdi],1
	jmp LB_896
LB_895:
	bts QWORD [rdi],1
LB_896:
	mov r10,r8
	bt r12,2
	jc LB_901
	btr r12,4
	jmp LB_902
LB_901:
	bts r12,4
LB_902:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_899
	btr QWORD [rdi],2
	jmp LB_900
LB_899:
	bts QWORD [rdi],2
LB_900:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_903
	btr r12,3
	jmp LB_904
LB_903:
	bts r12,3
LB_904:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_907
	btr r12,4
	jmp LB_908
LB_907:
	bts r12,4
LB_908:
	mov r13,r10
	bt r12,4
	jc LB_905
	btr r12,0
	jmp LB_906
LB_905:
	bts r12,0
LB_906:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_911
	btr r12,4
	jmp LB_912
LB_911:
	bts r12,4
LB_912:
	mov r14,r10
	bt r12,4
	jc LB_909
	btr r12,1
	jmp LB_910
LB_909:
	bts r12,1
LB_910:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_915
	btr r12,4
	jmp LB_916
LB_915:
	bts r12,4
LB_916:
	mov r8,r10
	bt r12,4
	jc LB_913
	btr r12,2
	jmp LB_914
LB_913:
	bts r12,2
LB_914:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_881~2':(_opn)◂(_p841) %_880~1':_r64 %_879~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_917
	mov rdi,r8
	call dlt
LB_917:
	bt r12,1
	jc LB_918
	mov rdi,r14
	call dlt
LB_918:
	bt r12,0
	jc LB_919
	mov rdi,r13
	call dlt
LB_919:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_769:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_769
	NS_E_DYN_772:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_772
	NS_E_DYN_773:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_773
	NS_E_DYN_774:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_774
	NS_E_DYN_775:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_775
	CST_DYN_778:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_787:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_787
	CST_DYN_882:
		dq 0x0000_0001_00_82_ffff
		dq 1
