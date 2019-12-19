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
	call NS_E_4320
	call NS_E_9192
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
NS_E_764:
NS_E_RDI_764:
NS_E_764_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_765
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_765:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_767:
NS_E_RDI_767:
NS_E_767_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_767_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_767_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_768:
NS_E_RDI_768:
NS_E_768_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_768_LB_0
	cmp r11,57
	ja NS_E_768_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_768_LB_0:
	mov rax,0
	ret
NS_E_770:
NS_E_RDI_770:
NS_E_770_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_770_LB_0
	cmp r11,122
	ja NS_E_770_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_770_LB_0:
	mov rax,0
	ret
NS_E_769:
NS_E_RDI_769:
NS_E_769_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_769_LB_0
	cmp r11,90
	ja NS_E_769_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_769_LB_0:
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
	jc LB_772
	bt QWORD [rdi],17
	jnc LB_772
	bt QWORD [rdi],0
	jc LB_774
	btr r12,2
	clc
	jmp LB_775
LB_774:
	bts r12,2
	stc
LB_775:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_773
LB_772:
	btr r12,2
	clc
	call dcp
LB_773:
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
	jc LB_771
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_771:
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
NS_E_766:
NS_E_RDI_766:
NS_E_766_ETR_TBL:
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
	jz NS_E_766_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_766_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_782:
; 	|» { 0' 1' }
NS_E_RDI_782:
MTC_LB_783:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_784
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
	jnc LB_785
	bt QWORD [rdi],0
	jc LB_786
	btr r12,2
	clc
	jmp LB_787
LB_786:
	bts r12,2
	stc
LB_787:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_785:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_788:
	cmp r15,0
	jz LB_789
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_788
LB_789:
; ∎ %_776
 ; {>  %_776~0':(_lst)◂(t385'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_784:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_790
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
	jnc LB_791
	bt QWORD [rdi],0
	jc LB_792
	btr r12,4
	clc
	jmp LB_793
LB_792:
	bts r12,4
	stc
LB_793:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_791:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_796
	btr r12,5
	clc
	jmp LB_797
LB_796:
	bts r12,5
	stc
LB_797:
	mov r8,r11
	bt r12,5
	jc LB_794
	btr r12,2
	jmp LB_795
LB_794:
	bts r12,2
LB_795:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_800
	btr r12,5
	clc
	jmp LB_801
LB_800:
	bts r12,5
	stc
LB_801:
	mov r9,r11
	bt r12,5
	jc LB_798
	btr r12,3
	jmp LB_799
LB_798:
	bts r12,3
LB_799:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_802:
	cmp r15,0
	jz LB_803
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_802
LB_803:
; _cns { %_778 %_776 } ⊢ %_780 : %_780
 ; {>  %_778~2':t385'(-1) %_776~0':(_lst)◂(t385'(-1)) %_779~3':(_lst)◂(t385'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f782 { %_780 %_779 } ⊢ %_781 : %_781
 ; {>  %_780~°0◂{ 2' 0' }:(_lst)◂(t385'(-1)) %_779~3':(_lst)◂(t385'(-1)) }
; _f782 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_804
	btr r12,1
	jmp LB_805
LB_804:
	bts r12,1
LB_805:
	mov r9,r13
	bt r12,0
	jc LB_806
	btr r12,3
	jmp LB_807
LB_806:
	bts r12,3
LB_807:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_812
	btr r12,4
	jmp LB_813
LB_812:
	bts r12,4
LB_813:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_810
	btr QWORD [rdi],0
	jmp LB_811
LB_810:
	bts QWORD [rdi],0
LB_811:
	mov r10,r9
	bt r12,3
	jc LB_816
	btr r12,4
	jmp LB_817
LB_816:
	bts r12,4
LB_817:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_814
	btr QWORD [rdi],1
	jmp LB_815
LB_814:
	bts QWORD [rdi],1
LB_815:
	mov rsi,1
	bt r12,0
	jc LB_808
	mov rsi,0
	bt r13,0
	jc LB_808
	jmp LB_809
LB_808:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_809:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_782
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_781
 ; {>  %_781~0':(_lst)◂(t385'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_790:
NS_E_821:
; 	|» 0'
NS_E_RDI_821:
; _nil {  } ⊢ %_819 : %_819
 ; {>  %_818~0':(_lst)◂(t406'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f782 { %_819 %_818 } ⊢ %_820 : %_820
 ; {>  %_818~0':(_lst)◂(t406'(-1)) %_819~°1◂{  }:(_lst)◂(t403'(0)) }
; _f782 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_822
	btr r12,1
	jmp LB_823
LB_822:
	bts r12,1
LB_823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
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
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_782
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_820
 ; {>  %_820~0':(_lst)◂(t406'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_839:
; 	|» { 0' 1' }
NS_E_RDI_839:
MTC_LB_840:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_841
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
	jnc LB_842
	bt QWORD [rdi],0
	jc LB_843
	btr r12,4
	clc
	jmp LB_844
LB_843:
	bts r12,4
	stc
LB_844:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_842:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_847
	btr r12,5
	clc
	jmp LB_848
LB_847:
	bts r12,5
	stc
LB_848:
	mov r8,r11
	bt r12,5
	jc LB_845
	btr r12,2
	jmp LB_846
LB_845:
	bts r12,2
LB_846:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_851
	btr r12,5
	clc
	jmp LB_852
LB_851:
	bts r12,5
	stc
LB_852:
	mov r9,r11
	bt r12,5
	jc LB_849
	btr r12,3
	jmp LB_850
LB_849:
	bts r12,3
LB_850:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_853:
	cmp r15,0
	jz LB_854
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_853
LB_854:
; _f56 %_826 ⊢ %_830 : %_830
 ; {>  %_828~2':_r64 %_829~3':(_lst)◂(_r64) %_826~0':_r64 }
	add r13,1
; _f839 { %_830 %_829 } ⊢ { %_831 %_832 } : { %_831 %_832 }
 ; {>  %_828~2':_r64 %_830~0':_r64 %_829~3':(_lst)◂(_r64) }
; _f839 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_857
	btr r12,1
	jmp LB_858
LB_857:
	bts r12,1
LB_858:
	call NS_E_839
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_855
	btr r12,2
	clc
	jmp LB_856
LB_855:
	bts r12,2
	stc
LB_856:
	add rsp,16
; _f55 %_831 ⊢ %_833 : %_833
 ; {>  %_828~2':_r64 %_831~0':_r64 %_832~1':_stg }
	sub r13,1
; _f33 { %_832 %_833 %_828 } ⊢ { %_834 %_835 %_836 } : { %_834 %_835 %_836 }
 ; {>  %_828~2':_r64 %_832~1':_stg %_833~0':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_859
	btr r12,3
	jmp LB_860
LB_859:
	bts r12,3
LB_860:
	mov r14,r13
	bt r12,0
	jc LB_861
	btr r12,1
	jmp LB_862
LB_861:
	bts r12,1
LB_862:
	mov r13,r9
	bt r12,3
	jc LB_863
	btr r12,0
	jmp LB_864
LB_863:
	bts r12,0
LB_864:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_835 %_834 }
 ; {>  %_834~0':_stg %_836~2':_r64 %_835~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_865
	mov rdi,r8
	call dlt
LB_865:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_866
	btr r12,2
	jmp LB_867
LB_866:
	bts r12,2
LB_867:
	mov r14,r13
	bt r12,0
	jc LB_868
	btr r12,1
	jmp LB_869
LB_868:
	bts r12,1
LB_869:
	mov r13,r8
	bt r12,2
	jc LB_870
	btr r12,0
	jmp LB_871
LB_870:
	bts r12,0
LB_871:
	ret
MTC_LB_841:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_872
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
	jnc LB_873
	bt QWORD [rdi],0
	jc LB_874
	btr r12,2
	clc
	jmp LB_875
LB_874:
	bts r12,2
	stc
LB_875:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_873:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_876:
	cmp r15,0
	jz LB_877
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_876
LB_877:
; _f31 %_826 ⊢ { %_837 %_838 } : { %_837 %_838 }
 ; {>  %_826~0':_r64 }
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
; ∎ { %_837 %_838 }
 ; {>  %_838~1':_stg %_837~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_872:
NS_E_882:
; 	|» 0'
NS_E_RDI_882:
; » 0xr0 |~ {  } ⊢ %_879 : %_879
 ; {>  %_878~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_879
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f839 { %_879 %_878 } ⊢ { %_880 %_881 } : { %_880 %_881 }
 ; {>  %_878~0':(_lst)◂(_r64) %_879~1':_r64 }
; _f839 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_883
	btr r12,2
	jmp LB_884
LB_883:
	bts r12,2
LB_884:
	mov r14,r13
	bt r12,0
	jc LB_885
	btr r12,1
	jmp LB_886
LB_885:
	bts r12,1
LB_886:
	mov r13,r8
	bt r12,2
	jc LB_887
	btr r12,0
	jmp LB_888
LB_887:
	bts r12,0
LB_888:
	call NS_E_839
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_881
 ; {>  %_881~1':_stg %_880~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_889
	mov rdi,r13
	call dlt
LB_889:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_890
	btr r12,0
	jmp LB_891
LB_890:
	bts r12,0
LB_891:
	ret
NS_E_892:
NS_E_RDI_892:
NS_E_892_ETR_TBL:
NS_E_892_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_933
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_933
	jmp LB_934
LB_933:
	jmp LB_923
LB_934:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_938
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_939
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_939:
	jmp LB_923
LB_938:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_926
	btr r12,1
	clc
	jmp LB_927
LB_926:
	bts r12,1
	stc
LB_927:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_924
	btr r12,0
	clc
	jmp LB_925
LB_924:
	bts r12,0
	stc
LB_925:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_920
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_941
	btr r12,2
	jmp LB_942
LB_941:
	bts r12,2
LB_942:
	mov r13,r14
	bt r12,1
	jc LB_943
	btr r12,0
	jmp LB_944
LB_943:
	bts r12,0
LB_944:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f882 %_895 ⊢ %_896 : %_896
 ; {>  %_895~0':(_lst)◂(_r64) }
; _f882 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_882
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_896 ⊢ %_897 : %_897
 ; {>  %_896~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_897
 ; {>  %_897~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_918
	btr r12,3
	jmp LB_919
LB_918:
	bts r12,3
LB_919:
	mov r8,0
	bts r12,2
	ret
LB_920:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_922
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_921
LB_922:
	add rsp,8
	ret
LB_923:
	add rsp,32
	pop r14
LB_921:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_893:
NS_E_RDI_893:
NS_E_893_ETR_TBL:
NS_E_893_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_970
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_970
	jmp LB_971
LB_970:
	jmp LB_958
LB_971:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_894_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_975
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_976
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_976:
	jmp LB_958
LB_975:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_981
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_982
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_982:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_983
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_983:
	jmp LB_958
LB_981:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_963
	btr r12,2
	clc
	jmp LB_964
LB_963:
	bts r12,2
	stc
LB_964:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_961
	btr r12,1
	clc
	jmp LB_962
LB_961:
	bts r12,1
	stc
LB_962:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_959
	btr r12,0
	clc
	jmp LB_960
LB_959:
	bts r12,0
	stc
LB_960:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_955
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_985
	btr r12,3
	jmp LB_986
LB_985:
	bts r12,3
LB_986:
	mov r14,r8
	bt r12,2
	jc LB_987
	btr r12,1
	jmp LB_988
LB_987:
	bts r12,1
LB_988:
	mov r8,r13
	bt r12,0
	jc LB_989
	btr r12,2
	jmp LB_990
LB_989:
	bts r12,2
LB_990:
	mov r13,r9
	bt r12,3
	jc LB_991
	btr r12,0
	jmp LB_992
LB_991:
	bts r12,0
LB_992:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_898 %_899 } ⊢ %_900 : %_900
 ; {>  %_898~0':_r64 %_899~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_900 ⊢ %_901 : %_901
 ; {>  %_900~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_901
 ; {>  %_901~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_949
	btr r12,2
	jmp LB_950
LB_949:
	bts r12,2
LB_950:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_947
	btr QWORD [rdi],0
	jmp LB_948
LB_947:
	bts QWORD [rdi],0
LB_948:
	mov r8,r14
	bt r12,1
	jc LB_953
	btr r12,2
	jmp LB_954
LB_953:
	bts r12,2
LB_954:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_951
	btr QWORD [rdi],1
	jmp LB_952
LB_951:
	bts QWORD [rdi],1
LB_952:
	mov rsi,1
	bt r12,3
	jc LB_945
	mov rsi,0
	bt r9,0
	jc LB_945
	jmp LB_946
LB_945:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_946:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_955:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_957
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_956
LB_957:
	add rsp,8
	ret
LB_958:
	add rsp,48
	pop r14
LB_956:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1006
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_1006
	jmp LB_1007
LB_1006:
	jmp LB_998
LB_1007:
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
	jc LB_999
	btr r12,0
	clc
	jmp LB_1000
LB_999:
	bts r12,0
	stc
LB_1000:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_995
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_902 : %_902
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_902 ⊢ %_903 : %_903
 ; {>  %_902~°1◂{  }:(_lst)◂(t464'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_903
 ; {>  %_903~°0◂°1◂{  }:(_opn)◂((_lst)◂(t467'(0))) }
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
	jc LB_993
	mov rsi,0
	bt r9,0
	jc LB_993
	jmp LB_994
LB_993:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_994:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_995:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_997
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_996
LB_997:
	add rsp,8
	ret
LB_998:
	add rsp,16
	pop r14
LB_996:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1029
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1021
LB_1029:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_893_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1034
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1035:
	jmp LB_1021
LB_1034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1024
	btr r12,1
	clc
	jmp LB_1025
LB_1024:
	bts r12,1
	stc
LB_1025:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1022
	btr r12,0
	clc
	jmp LB_1023
LB_1022:
	bts r12,0
	stc
LB_1023:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1018
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_904 %_905 } ⊢ %_906 : %_906
 ; {>  %_905~1':(_lst)◂(_r64) %_904~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_906 ⊢ %_907 : %_907
 ; {>  %_906~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_907
 ; {>  %_907~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_1012
	btr r12,2
	jmp LB_1013
LB_1012:
	bts r12,2
LB_1013:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_1010
	btr QWORD [rdi],0
	jmp LB_1011
LB_1010:
	bts QWORD [rdi],0
LB_1011:
	mov r8,r14
	bt r12,1
	jc LB_1016
	btr r12,2
	jmp LB_1017
LB_1016:
	bts r12,2
LB_1017:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_1014
	btr QWORD [rdi],1
	jmp LB_1015
LB_1014:
	bts QWORD [rdi],1
LB_1015:
	mov rsi,1
	bt r12,3
	jc LB_1008
	mov rsi,0
	bt r9,0
	jc LB_1008
	jmp LB_1009
LB_1008:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1009:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1018:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1020
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1019
LB_1020:
	add rsp,8
	ret
LB_1021:
	add rsp,32
	pop r14
LB_1019:
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
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_1050
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_1050
	jmp LB_1051
LB_1050:
	jmp LB_1042
LB_1051:
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
	jc LB_1043
	btr r12,0
	clc
	jmp LB_1044
LB_1043:
	bts r12,0
	stc
LB_1044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1039
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_908 : %_908
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_908
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_908 ⊢ %_909 : %_909
 ; {>  %_908~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_909
 ; {>  %_909~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1037
	btr r12,3
	jmp LB_1038
LB_1037:
	bts r12,3
LB_1038:
	mov r8,0
	bts r12,2
	ret
LB_1039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1040
LB_1041:
	add rsp,8
	ret
LB_1042:
	add rsp,16
	pop r14
LB_1040:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_1065
	jmp LB_1066
LB_1065:
	jmp LB_1057
LB_1066:
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
	jc LB_1058
	btr r12,0
	clc
	jmp LB_1059
LB_1058:
	bts r12,0
	stc
LB_1059:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1054
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_910 : %_910
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_910
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_910 ⊢ %_911 : %_911
 ; {>  %_910~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_911
 ; {>  %_911~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1052
	btr r12,3
	jmp LB_1053
LB_1052:
	bts r12,3
LB_1053:
	mov r8,0
	bts r12,2
	ret
LB_1054:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1056
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1055
LB_1056:
	add rsp,8
	ret
LB_1057:
	add rsp,16
	pop r14
LB_1055:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_1080
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_1080
	jmp LB_1081
LB_1080:
	jmp LB_1072
LB_1081:
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
	jc LB_1073
	btr r12,0
	clc
	jmp LB_1074
LB_1073:
	bts r12,0
	stc
LB_1074:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1069
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_912 : %_912
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_912
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_912 ⊢ %_913 : %_913
 ; {>  %_912~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_913
 ; {>  %_913~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1067
	btr r12,3
	jmp LB_1068
LB_1067:
	bts r12,3
LB_1068:
	mov r8,0
	bts r12,2
	ret
LB_1069:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1071
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1070
LB_1071:
	add rsp,8
	ret
LB_1072:
	add rsp,16
	pop r14
LB_1070:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_1095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_1095
	jmp LB_1096
LB_1095:
	jmp LB_1087
LB_1096:
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
	jc LB_1088
	btr r12,0
	clc
	jmp LB_1089
LB_1088:
	bts r12,0
	stc
LB_1089:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1084
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_914 : %_914
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_914
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_914 ⊢ %_915 : %_915
 ; {>  %_914~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_915
 ; {>  %_915~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1082
	btr r12,3
	jmp LB_1083
LB_1082:
	bts r12,3
LB_1083:
	mov r8,0
	bts r12,2
	ret
LB_1084:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1086
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1085
LB_1086:
	add rsp,8
	ret
LB_1087:
	add rsp,16
	pop r14
LB_1085:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_1110
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_1110
	jmp LB_1111
LB_1110:
	jmp LB_1102
LB_1111:
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
	jc LB_1103
	btr r12,0
	clc
	jmp LB_1104
LB_1103:
	bts r12,0
	stc
LB_1104:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1099
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_916 : %_916
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_916
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_916 ⊢ %_917 : %_917
 ; {>  %_916~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_917
 ; {>  %_917~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1097
	btr r12,3
	jmp LB_1098
LB_1097:
	bts r12,3
LB_1098:
	mov r8,0
	bts r12,2
	ret
LB_1099:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1101
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1100
LB_1101:
	add rsp,8
	ret
LB_1102:
	add rsp,16
	pop r14
LB_1100:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1112:
NS_E_RDI_1112:
NS_E_1112_ETR_TBL:
NS_E_1112_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1149
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1143
LB_1149:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1144
	btr r12,0
	clc
	jmp LB_1145
LB_1144:
	bts r12,0
	stc
LB_1145:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1140
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_1114 : %_1114
 ; {>  %_1113~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_1114
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_1115 : %_1115
 ; {>  %_1114~1':_r64 %_1113~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_1115
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_1113 %_1114 } ⊢ { %_1116 %_1117 %_1118 } : { %_1116 %_1117 %_1118 }
 ; {>  %_1115~2':_r64 %_1114~1':_r64 %_1113~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1115 %_1116 } ⊢ { %_1119 %_1120 %_1121 } : { %_1119 %_1120 %_1121 }
 ; {>  %_1116~0':_r64 %_1118~3':_r64 %_1117~1':_r64 %_1115~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1124:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1125
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1125
LB_1126:
	cmp r15,0
	jz LB_1127
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1126
LB_1127:
; _some %_1120 ⊢ %_1122 : %_1122
 ; {>  %_1119~2':_r64 %_1120~0':_r64 %_1117~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1122
 ; {>  %_1119~2':_r64 %_1117~1':_r64 %_1122~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1128
	mov rdi,r8
	call dlt
LB_1128:
	bt r12,1
	jc LB_1129
	mov rdi,r14
	call dlt
LB_1129:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1130
	btr r12,3
	jmp LB_1131
LB_1130:
	bts r12,3
LB_1131:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1125:
	mov r15,0
LB_1133:
	cmp r15,0
	jz LB_1134
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1133
LB_1134:
; _none {  } ⊢ %_1123 : %_1123
 ; {>  %_1119~2':_r64 %_1118~3':_r64 %_1120~0':_r64 %_1117~1':_r64 %_1121~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1123
 ; {>  %_1123~°1◂{  }:(_opn)◂(t543'(0)) %_1119~2':_r64 %_1118~3':_r64 %_1120~0':_r64 %_1117~1':_r64 %_1121~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_1135
	mov rdi,r8
	call dlt
LB_1135:
	bt r12,3
	jc LB_1136
	mov rdi,r9
	call dlt
LB_1136:
	bt r12,0
	jc LB_1137
	mov rdi,r13
	call dlt
LB_1137:
	bt r12,1
	jc LB_1138
	mov rdi,r14
	call dlt
LB_1138:
	bt r12,4
	jc LB_1139
	mov rdi,r10
	call dlt
LB_1139:
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
MTC_LB_1132:
LB_1140:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1142
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1141
LB_1142:
	add rsp,8
	ret
LB_1143:
	add rsp,16
	pop r14
LB_1141:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1151:
NS_E_RDI_1151:
NS_E_1151_ETR_TBL:
NS_E_1151_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1188
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1182
LB_1188:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1183
	btr r12,0
	clc
	jmp LB_1184
LB_1183:
	bts r12,0
	stc
LB_1184:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1179
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_1153 : %_1153
 ; {>  %_1152~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_1153
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_1154 : %_1154
 ; {>  %_1152~0':_r64 %_1153~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_1154
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_1152 %_1153 } ⊢ { %_1155 %_1156 %_1157 } : { %_1155 %_1156 %_1157 }
 ; {>  %_1154~2':_r64 %_1152~0':_r64 %_1153~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1154 %_1155 } ⊢ { %_1158 %_1159 %_1160 } : { %_1158 %_1159 %_1160 }
 ; {>  %_1154~2':_r64 %_1156~1':_r64 %_1155~0':_r64 %_1157~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1163:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1164
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1164
LB_1165:
	cmp r15,0
	jz LB_1166
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1165
LB_1166:
; _some %_1159 ⊢ %_1161 : %_1161
 ; {>  %_1158~2':_r64 %_1156~1':_r64 %_1159~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1161
 ; {>  %_1158~2':_r64 %_1156~1':_r64 %_1161~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1167
	mov rdi,r8
	call dlt
LB_1167:
	bt r12,1
	jc LB_1168
	mov rdi,r14
	call dlt
LB_1168:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1169
	btr r12,3
	jmp LB_1170
LB_1169:
	bts r12,3
LB_1170:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1164:
	mov r15,0
LB_1172:
	cmp r15,0
	jz LB_1173
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1172
LB_1173:
; _none {  } ⊢ %_1162 : %_1162
 ; {>  %_1158~2':_r64 %_1156~1':_r64 %_1160~4':_r64 %_1159~0':_r64 %_1157~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1162
 ; {>  %_1158~2':_r64 %_1162~°1◂{  }:(_opn)◂(t570'(0)) %_1156~1':_r64 %_1160~4':_r64 %_1159~0':_r64 %_1157~3':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_1174
	mov rdi,r8
	call dlt
LB_1174:
	bt r12,1
	jc LB_1175
	mov rdi,r14
	call dlt
LB_1175:
	bt r12,4
	jc LB_1176
	mov rdi,r10
	call dlt
LB_1176:
	bt r12,0
	jc LB_1177
	mov rdi,r13
	call dlt
LB_1177:
	bt r12,3
	jc LB_1178
	mov rdi,r9
	call dlt
LB_1178:
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
MTC_LB_1171:
LB_1179:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1181
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1180
LB_1181:
	add rsp,8
	ret
LB_1182:
	add rsp,16
	pop r14
LB_1180:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1190:
NS_E_RDI_1190:
NS_E_1190_ETR_TBL:
NS_E_1190_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1227
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1221
LB_1227:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1222
	btr r12,0
	clc
	jmp LB_1223
LB_1222:
	bts r12,0
	stc
LB_1223:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1218
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_1192 : %_1192
 ; {>  %_1191~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_1192
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_1193 : %_1193
 ; {>  %_1191~0':_r64 %_1192~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_1193
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_1191 %_1192 } ⊢ { %_1194 %_1195 %_1196 } : { %_1194 %_1195 %_1196 }
 ; {>  %_1191~0':_r64 %_1192~1':_r64 %_1193~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_1193 %_1194 } ⊢ { %_1197 %_1198 %_1199 } : { %_1197 %_1198 %_1199 }
 ; {>  %_1196~3':_r64 %_1194~0':_r64 %_1195~1':_r64 %_1193~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_1202:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_1203
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_1203
LB_1204:
	cmp r15,0
	jz LB_1205
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1204
LB_1205:
; _some %_1198 ⊢ %_1200 : %_1200
 ; {>  %_1197~2':_r64 %_1195~1':_r64 %_1198~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1200
 ; {>  %_1197~2':_r64 %_1195~1':_r64 %_1200~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1206
	mov rdi,r8
	call dlt
LB_1206:
	bt r12,1
	jc LB_1207
	mov rdi,r14
	call dlt
LB_1207:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1208
	btr r12,3
	jmp LB_1209
LB_1208:
	bts r12,3
LB_1209:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1203:
	mov r15,0
LB_1211:
	cmp r15,0
	jz LB_1212
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1211
LB_1212:
; _none {  } ⊢ %_1201 : %_1201
 ; {>  %_1199~4':_r64 %_1196~3':_r64 %_1197~2':_r64 %_1195~1':_r64 %_1198~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1201
 ; {>  %_1199~4':_r64 %_1196~3':_r64 %_1197~2':_r64 %_1195~1':_r64 %_1198~0':_r64 %_1201~°1◂{  }:(_opn)◂(t597'(0)) }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_1213
	mov rdi,r10
	call dlt
LB_1213:
	bt r12,3
	jc LB_1214
	mov rdi,r9
	call dlt
LB_1214:
	bt r12,2
	jc LB_1215
	mov rdi,r8
	call dlt
LB_1215:
	bt r12,1
	jc LB_1216
	mov rdi,r14
	call dlt
LB_1216:
	bt r12,0
	jc LB_1217
	mov rdi,r13
	call dlt
LB_1217:
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
MTC_LB_1210:
LB_1218:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1220
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1219
LB_1220:
	add rsp,8
	ret
LB_1221:
	add rsp,16
	pop r14
LB_1219:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1229:
NS_E_RDI_1229:
NS_E_1229_ETR_TBL:
NS_E_1229_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_1190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1245
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1239
LB_1245:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1240
	btr r12,0
	clc
	jmp LB_1241
LB_1240:
	bts r12,0
	stc
LB_1241:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1236
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_1230 ⊢ %_1231 : %_1231
 ; {>  %_1230~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1231
 ; {>  %_1231~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1234
	btr r12,3
	jmp LB_1235
LB_1234:
	bts r12,3
LB_1235:
	mov r8,0
	bts r12,2
	ret
LB_1236:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1238
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1237
LB_1238:
	add rsp,8
	ret
LB_1239:
	add rsp,16
	pop r14
LB_1237:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_1151_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1258
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1252
LB_1258:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1253
	btr r12,0
	clc
	jmp LB_1254
LB_1253:
	bts r12,0
	stc
LB_1254:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1249
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_1232 ⊢ %_1233 : %_1233
 ; {>  %_1232~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1233
 ; {>  %_1233~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1247
	btr r12,3
	jmp LB_1248
LB_1247:
	bts r12,3
LB_1248:
	mov r8,0
	bts r12,2
	ret
LB_1249:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1251
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1250
LB_1251:
	add rsp,8
	ret
LB_1252:
	add rsp,16
	pop r14
LB_1250:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1260:
NS_E_RDI_1260:
NS_E_1260_ETR_TBL:
NS_E_1260_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_1229_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1305
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1297
LB_1305:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1261_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1310
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1311
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1311:
	jmp LB_1297
LB_1310:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1300
	btr r12,1
	clc
	jmp LB_1301
LB_1300:
	bts r12,1
	stc
LB_1301:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1298
	btr r12,0
	clc
	jmp LB_1299
LB_1298:
	bts r12,0
	stc
LB_1299:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1294
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_1263 %_1264 } ⊢ %_1265 : %_1265
 ; {>  %_1263~0':_r64 %_1264~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f882 %_1265 ⊢ %_1266 : %_1266
 ; {>  %_1265~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f882 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1280
	btr r12,2
	jmp LB_1281
LB_1280:
	bts r12,2
LB_1281:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1286
	btr r12,3
	jmp LB_1287
LB_1286:
	bts r12,3
LB_1287:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_1284
	btr QWORD [rdi],0
	jmp LB_1285
LB_1284:
	bts QWORD [rdi],0
LB_1285:
	mov r9,r14
	bt r12,1
	jc LB_1290
	btr r12,3
	jmp LB_1291
LB_1290:
	bts r12,3
LB_1291:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_1288
	btr QWORD [rdi],1
	jmp LB_1289
LB_1288:
	bts QWORD [rdi],1
LB_1289:
	mov rsi,1
	bt r12,0
	jc LB_1282
	mov rsi,0
	bt r13,0
	jc LB_1282
	jmp LB_1283
LB_1282:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1283:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_882
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1266 ⊢ %_1267 : %_1267
 ; {>  %_1266~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1267
 ; {>  %_1267~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1292
	btr r12,3
	jmp LB_1293
LB_1292:
	bts r12,3
LB_1293:
	mov r8,0
	bts r12,2
	ret
LB_1294:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1296
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1295
LB_1296:
	add rsp,8
	ret
LB_1297:
	add rsp,32
	pop r14
LB_1295:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1261:
NS_E_RDI_1261:
NS_E_1261_ETR_TBL:
NS_E_1261_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_1262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1334
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1326
LB_1334:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1261_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1339
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1340
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1340:
	jmp LB_1326
LB_1339:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1329
	btr r12,1
	clc
	jmp LB_1330
LB_1329:
	bts r12,1
	stc
LB_1330:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1327
	btr r12,0
	clc
	jmp LB_1328
LB_1327:
	bts r12,0
	stc
LB_1328:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1323
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_1268 %_1269 } ⊢ %_1270 : %_1270
 ; {>  %_1268~0':_r64 %_1269~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_1270 ⊢ %_1271 : %_1271
 ; {>  %_1270~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_1271
 ; {>  %_1271~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_1317
	btr r12,2
	jmp LB_1318
LB_1317:
	bts r12,2
LB_1318:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_1315
	btr QWORD [rdi],0
	jmp LB_1316
LB_1315:
	bts QWORD [rdi],0
LB_1316:
	mov r8,r14
	bt r12,1
	jc LB_1321
	btr r12,2
	jmp LB_1322
LB_1321:
	bts r12,2
LB_1322:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_1319
	btr QWORD [rdi],1
	jmp LB_1320
LB_1319:
	bts QWORD [rdi],1
LB_1320:
	mov rsi,1
	bt r12,3
	jc LB_1313
	mov rsi,0
	bt r9,0
	jc LB_1313
	jmp LB_1314
LB_1313:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1314:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1323:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1325
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1324
LB_1325:
	add rsp,8
	ret
LB_1326:
	add rsp,32
	pop r14
LB_1324:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_1344
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_1272 : %_1272
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_1272 ⊢ %_1273 : %_1273
 ; {>  %_1272~°1◂{  }:(_lst)◂(t641'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_1273
 ; {>  %_1273~°0◂°1◂{  }:(_opn)◂((_lst)◂(t644'(0))) }
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
	jc LB_1342
	mov rsi,0
	bt r9,0
	jc LB_1342
	jmp LB_1343
LB_1342:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1343:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1344:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1346
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1345
LB_1346:
	add rsp,8
	ret
LB_1347:
	add rsp,0
	pop r14
LB_1345:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1262:
NS_E_RDI_1262:
NS_E_1262_ETR_TBL:
NS_E_1262_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_1229_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1359
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1353
LB_1359:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1354
	btr r12,0
	clc
	jmp LB_1355
LB_1354:
	bts r12,0
	stc
LB_1355:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1350
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_1274 ⊢ %_1275 : %_1275
 ; {>  %_1274~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1275
 ; {>  %_1275~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1348
	btr r12,3
	jmp LB_1349
LB_1348:
	bts r12,3
LB_1349:
	mov r8,0
	bts r12,2
	ret
LB_1350:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1352
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1351
LB_1352:
	add rsp,8
	ret
LB_1353:
	add rsp,16
	pop r14
LB_1351:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_1112_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1372
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1366
LB_1372:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1367
	btr r12,0
	clc
	jmp LB_1368
LB_1367:
	bts r12,0
	stc
LB_1368:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1363
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_1276 ⊢ %_1277 : %_1277
 ; {>  %_1276~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1277
 ; {>  %_1277~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1361
	btr r12,3
	jmp LB_1362
LB_1361:
	bts r12,3
LB_1362:
	mov r8,0
	bts r12,2
	ret
LB_1363:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1365
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1364
LB_1365:
	add rsp,8
	ret
LB_1366:
	add rsp,16
	pop r14
LB_1364:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1387
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1387
	jmp LB_1388
LB_1387:
	jmp LB_1379
LB_1388:
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
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_1278 : %_1278
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_1278
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_1278 ⊢ %_1279 : %_1279
 ; {>  %_1278~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1279
 ; {>  %_1279~°0◂0':(_opn)◂(_r64) }
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
NS_E_1389:
NS_E_RDI_1389:
NS_E_1389_ETR_TBL:
NS_E_1389_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1410
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1410
	jmp LB_1411
LB_1410:
	jmp LB_1400
LB_1411:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_1261_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1415
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1416:
	jmp LB_1400
LB_1415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1403
	btr r12,1
	clc
	jmp LB_1404
LB_1403:
	bts r12,1
	stc
LB_1404:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1401
	btr r12,0
	clc
	jmp LB_1402
LB_1401:
	bts r12,0
	stc
LB_1402:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1397
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1418
	btr r12,2
	jmp LB_1419
LB_1418:
	bts r12,2
LB_1419:
	mov r13,r14
	bt r12,1
	jc LB_1420
	btr r12,0
	jmp LB_1421
LB_1420:
	bts r12,0
LB_1421:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f882 %_1390 ⊢ %_1391 : %_1391
 ; {>  %_1390~0':(_lst)◂(_r64) }
; _f882 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_882
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_1391 ⊢ %_1392 : %_1392
 ; {>  %_1391~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1392
 ; {>  %_1392~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1395
	btr r12,3
	jmp LB_1396
LB_1395:
	bts r12,3
LB_1396:
	mov r8,0
	bts r12,2
	ret
LB_1397:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1399
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1398
LB_1399:
	add rsp,8
	ret
LB_1400:
	add rsp,32
	pop r14
LB_1398:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1433
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1427
LB_1433:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1428
	btr r12,0
	clc
	jmp LB_1429
LB_1428:
	bts r12,0
	stc
LB_1429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1424
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_1393 ⊢ %_1394 : %_1394
 ; {>  %_1393~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1394
 ; {>  %_1394~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1422
	btr r12,3
	jmp LB_1423
LB_1422:
	bts r12,3
LB_1423:
	mov r8,0
	bts r12,2
	ret
LB_1424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1426
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1425
LB_1426:
	add rsp,8
	ret
LB_1427:
	add rsp,16
	pop r14
LB_1425:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1446:
; 	|» 0'
NS_E_RDI_1446:
MTC_LB_1447:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1448
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
	jnc LB_1449
	bt QWORD [rdi],0
	jc LB_1450
	btr r12,3
	clc
	jmp LB_1451
LB_1450:
	bts r12,3
	stc
LB_1451:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1449:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1454
	btr r12,4
	clc
	jmp LB_1455
LB_1454:
	bts r12,4
	stc
LB_1455:
	mov r14,r10
	bt r12,4
	jc LB_1452
	btr r12,1
	jmp LB_1453
LB_1452:
	bts r12,1
LB_1453:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1458
	btr r12,4
	clc
	jmp LB_1459
LB_1458:
	bts r12,4
	stc
LB_1459:
	mov r8,r10
	bt r12,4
	jc LB_1456
	btr r12,2
	jmp LB_1457
LB_1456:
	bts r12,2
LB_1457:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1460:
	cmp r15,0
	jz LB_1461
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1460
LB_1461:
; _f1446 %_1440 ⊢ %_1441 : %_1441
 ; {>  %_1440~2':_p1435 %_1439~1':_stg }
; _f1446 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1464
	btr r12,0
	jmp LB_1465
LB_1464:
	bts r12,0
LB_1465:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1462
	btr r12,1
	clc
	jmp LB_1463
LB_1462:
	bts r12,1
	stc
LB_1463:
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
; ∎ %_1444
 ; {>  %_1442~1':_stg %_1443~0':_stg %_1444~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1466
	mov rdi,r14
	call dlt
LB_1466:
	bt r12,0
	jc LB_1467
	mov rdi,r13
	call dlt
LB_1467:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1468
	btr r12,0
	jmp LB_1469
LB_1468:
	bts r12,0
LB_1469:
	ret
MTC_LB_1448:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1470
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
	jnc LB_1471
	bt QWORD [rdi],0
	jc LB_1472
	btr r12,2
	clc
	jmp LB_1473
LB_1472:
	bts r12,2
	stc
LB_1473:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1471:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1474
	btr r12,1
	jmp LB_1475
LB_1474:
	bts r12,1
LB_1475:
LB_1476:
	cmp r15,0
	jz LB_1477
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1476
LB_1477:
; ∎ %_1445
 ; {>  %_1445~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1478
	btr r12,0
	jmp LB_1479
LB_1478:
	bts r12,0
LB_1479:
	ret
MTC_LB_1470:
NS_E_1590:
; 	|» 0'
NS_E_RDI_1590:
MTC_LB_1591:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1592
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
	jnc LB_1593
	bt QWORD [rdi],0
	jc LB_1594
	btr r12,2
	clc
	jmp LB_1595
LB_1594:
	bts r12,2
	stc
LB_1595:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1593:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1596
	btr r12,1
	jmp LB_1597
LB_1596:
	bts r12,1
LB_1597:
LB_1598:
	cmp r15,0
	jz LB_1599
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1598
LB_1599:
; 	» "??r" _ ⊢ 0' : %_1585
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1585
 ; {>  %_1584~1':_r64 %_1585~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1600
	mov rdi,r14
	call dlt
LB_1600:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1592:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1601
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
	jnc LB_1602
	bt QWORD [rdi],0
	jc LB_1603
	btr r12,2
	clc
	jmp LB_1604
LB_1603:
	bts r12,2
	stc
LB_1604:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1602:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1605
	btr r12,1
	jmp LB_1606
LB_1605:
	bts r12,1
LB_1606:
LB_1607:
	cmp r15,0
	jz LB_1608
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1607
LB_1608:
; 	» ".." _ ⊢ 0' : %_1587
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1587
 ; {>  %_1586~1':_stg %_1587~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1609
	mov rdi,r14
	call dlt
LB_1609:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1601:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1610
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
	jnc LB_1611
	bt QWORD [rdi],0
	jc LB_1612
	btr r12,2
	clc
	jmp LB_1613
LB_1612:
	bts r12,2
	stc
LB_1613:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1611:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1614
	btr r12,1
	jmp LB_1615
LB_1614:
	bts r12,1
LB_1615:
LB_1616:
	cmp r15,0
	jz LB_1617
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1616
LB_1617:
; _f1446 %_1588 ⊢ %_1589 : %_1589
 ; {>  %_1588~1':_p1435 }
; _f1446 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1618
	btr r12,0
	jmp LB_1619
LB_1618:
	bts r12,0
LB_1619:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1589
 ; {>  %_1589~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1610:
NS_E_1660:
; 	|» 0'
NS_E_RDI_1660:
MTC_LB_1661:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1662
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
	jnc LB_1663
	bt QWORD [rdi],0
	jc LB_1664
	btr r12,3
	clc
	jmp LB_1665
LB_1664:
	bts r12,3
	stc
LB_1665:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1663:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1668
	btr r12,4
	clc
	jmp LB_1669
LB_1668:
	bts r12,4
	stc
LB_1669:
	mov r14,r10
	bt r12,4
	jc LB_1666
	btr r12,1
	jmp LB_1667
LB_1666:
	bts r12,1
LB_1667:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1672
	btr r12,4
	clc
	jmp LB_1673
LB_1672:
	bts r12,4
	stc
LB_1673:
	mov r8,r10
	bt r12,4
	jc LB_1670
	btr r12,2
	jmp LB_1671
LB_1670:
	bts r12,2
LB_1671:
	mov rdi,r9
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
; _f1650 %_1652 ⊢ %_1654 : %_1654
 ; {>  %_1652~1':_p1499 %_1653~2':(_lst)◂(_p1499) }
; _f1650 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1678
	btr r12,0
	jmp LB_1679
LB_1678:
	bts r12,0
LB_1679:
	call NS_E_1650
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1676
	btr r12,2
	clc
	jmp LB_1677
LB_1676:
	bts r12,2
	stc
LB_1677:
	add rsp,16
; _f1660 %_1653 ⊢ %_1655 : %_1655
 ; {>  %_1654~0':_stg %_1653~2':(_lst)◂(_p1499) }
; _f1660 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1682
	btr r12,0
	jmp LB_1683
LB_1682:
	bts r12,0
LB_1683:
	call NS_E_1660
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1684
	btr r12,1
	jmp LB_1685
LB_1684:
	bts r12,1
LB_1685:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1680
	btr r12,0
	clc
	jmp LB_1681
LB_1680:
	bts r12,0
	stc
LB_1681:
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
; ∎ %_1658
 ; {>  %_1658~2':_stg %_1657~1':_stg %_1656~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1686
	mov rdi,r14
	call dlt
LB_1686:
	bt r12,0
	jc LB_1687
	mov rdi,r13
	call dlt
LB_1687:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1688
	btr r12,0
	jmp LB_1689
LB_1688:
	bts r12,0
LB_1689:
	ret
MTC_LB_1662:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1690
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
	jnc LB_1691
	bt QWORD [rdi],0
	jc LB_1692
	btr r12,1
	clc
	jmp LB_1693
LB_1692:
	bts r12,1
	stc
LB_1693:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1691:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1694:
	cmp r15,0
	jz LB_1695
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1694
LB_1695:
; 	» "" _ ⊢ 0' : %_1659
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1659
 ; {>  %_1659~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1690:
NS_E_1650:
; 	|» 0'
NS_E_RDI_1650:
MTC_LB_1696:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1697
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
	jnc LB_1698
	bt QWORD [rdi],0
	jc LB_1699
	btr r12,2
	clc
	jmp LB_1700
LB_1699:
	bts r12,2
	stc
LB_1700:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1698:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1701
	btr r12,1
	jmp LB_1702
LB_1701:
	bts r12,1
LB_1702:
LB_1703:
	cmp r15,0
	jz LB_1704
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1703
LB_1704:
; _f1660 %_1643 ⊢ %_1644 : %_1644
 ; {>  %_1643~1':(_lst)◂(_p1499) }
; _f1660 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1705
	btr r12,0
	jmp LB_1706
LB_1705:
	bts r12,0
LB_1706:
	call NS_E_1660
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
; ∎ %_1646
 ; {>  %_1646~1':_stg %_1645~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1707
	mov rdi,r13
	call dlt
LB_1707:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1708
	btr r12,0
	jmp LB_1709
LB_1708:
	bts r12,0
LB_1709:
	ret
MTC_LB_1697:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1710
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
	jnc LB_1711
	bt QWORD [rdi],0
	jc LB_1712
	btr r12,2
	clc
	jmp LB_1713
LB_1712:
	bts r12,2
	stc
LB_1713:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1711:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1714
	btr r12,1
	jmp LB_1715
LB_1714:
	bts r12,1
LB_1715:
LB_1716:
	cmp r15,0
	jz LB_1717
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1716
LB_1717:
MTC_LB_1718:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1719
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
	jnc LB_1720
	bt QWORD [rdi],0
	jc LB_1721
	btr r12,0
	clc
	jmp LB_1722
LB_1721:
	bts r12,0
	stc
LB_1722:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1720:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1723:
	cmp r15,0
	jz LB_1724
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1723
LB_1724:
; 	» "_ " _ ⊢ 0' : %_1648
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1648
 ; {>  %_1648~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1719:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1725
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
	jnc LB_1726
	bt QWORD [rdi],0
	jc LB_1727
	btr r12,2
	clc
	jmp LB_1728
LB_1727:
	bts r12,2
	stc
LB_1728:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1726:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1729
	btr r12,0
	jmp LB_1730
LB_1729:
	bts r12,0
LB_1730:
LB_1731:
	cmp r15,0
	jz LB_1732
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1731
LB_1732:
; ∎ %_1649
 ; {>  %_1649~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1725:
MTC_LB_1710:
NS_E_1641:
; 	|» 0'
NS_E_RDI_1641:
MTC_LB_1733:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1734
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
	jnc LB_1735
	bt QWORD [rdi],0
	jc LB_1736
	btr r12,3
	clc
	jmp LB_1737
LB_1736:
	bts r12,3
	stc
LB_1737:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1735:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1740
	btr r12,4
	clc
	jmp LB_1741
LB_1740:
	bts r12,4
	stc
LB_1741:
	mov r14,r10
	bt r12,4
	jc LB_1738
	btr r12,1
	jmp LB_1739
LB_1738:
	bts r12,1
LB_1739:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1744
	btr r12,4
	clc
	jmp LB_1745
LB_1744:
	bts r12,4
	stc
LB_1745:
	mov r8,r10
	bt r12,4
	jc LB_1742
	btr r12,2
	jmp LB_1743
LB_1742:
	bts r12,2
LB_1743:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1746:
	cmp r15,0
	jz LB_1747
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1746
LB_1747:
; _f1631 %_1633 ⊢ %_1635 : %_1635
 ; {>  %_1634~2':(_lst)◂(_p1498) %_1633~1':_p1498 }
; _f1631 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1750
	btr r12,0
	jmp LB_1751
LB_1750:
	bts r12,0
LB_1751:
	call NS_E_1631
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1748
	btr r12,2
	clc
	jmp LB_1749
LB_1748:
	bts r12,2
	stc
LB_1749:
	add rsp,16
; _f1641 %_1634 ⊢ %_1636 : %_1636
 ; {>  %_1634~2':(_lst)◂(_p1498) %_1635~0':_stg }
; _f1641 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1754
	btr r12,0
	jmp LB_1755
LB_1754:
	bts r12,0
LB_1755:
	call NS_E_1641
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1756
	btr r12,1
	jmp LB_1757
LB_1756:
	bts r12,1
LB_1757:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1752
	btr r12,0
	clc
	jmp LB_1753
LB_1752:
	bts r12,0
	stc
LB_1753:
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
; ∎ %_1639
 ; {>  %_1638~1':_stg %_1637~0':_stg %_1639~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1758
	mov rdi,r14
	call dlt
LB_1758:
	bt r12,0
	jc LB_1759
	mov rdi,r13
	call dlt
LB_1759:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1760
	btr r12,0
	jmp LB_1761
LB_1760:
	bts r12,0
LB_1761:
	ret
MTC_LB_1734:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1762
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
	jnc LB_1763
	bt QWORD [rdi],0
	jc LB_1764
	btr r12,1
	clc
	jmp LB_1765
LB_1764:
	bts r12,1
	stc
LB_1765:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1763:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1766:
	cmp r15,0
	jz LB_1767
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1766
LB_1767:
; 	» "" _ ⊢ 0' : %_1640
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1640
 ; {>  %_1640~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1762:
NS_E_1631:
; 	|» 0'
NS_E_RDI_1631:
MTC_LB_1768:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1769
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
	jnc LB_1770
	bt QWORD [rdi],0
	jc LB_1771
	btr r12,2
	clc
	jmp LB_1772
LB_1771:
	bts r12,2
	stc
LB_1772:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1770:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1773
	btr r12,1
	jmp LB_1774
LB_1773:
	bts r12,1
LB_1774:
LB_1775:
	cmp r15,0
	jz LB_1776
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1775
LB_1776:
; _f1641 %_1621 ⊢ %_1622 : %_1622
 ; {>  %_1621~1':(_lst)◂(_p1498) }
; _f1641 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1777
	btr r12,0
	jmp LB_1778
LB_1777:
	bts r12,0
LB_1778:
	call NS_E_1641
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
; ∎ %_1624
 ; {>  %_1623~0':_stg %_1624~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1779
	mov rdi,r13
	call dlt
LB_1779:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1780
	btr r12,0
	jmp LB_1781
LB_1780:
	bts r12,0
LB_1781:
	ret
MTC_LB_1769:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1782
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
	jnc LB_1783
	bt QWORD [rdi],0
	jc LB_1784
	btr r12,2
	clc
	jmp LB_1785
LB_1784:
	bts r12,2
	stc
LB_1785:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1783:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1786
	btr r12,1
	jmp LB_1787
LB_1786:
	bts r12,1
LB_1787:
LB_1788:
	cmp r15,0
	jz LB_1789
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1788
LB_1789:
MTC_LB_1790:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1791
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
	jnc LB_1792
	bt QWORD [rdi],0
	jc LB_1793
	btr r12,2
	clc
	jmp LB_1794
LB_1793:
	bts r12,2
	stc
LB_1794:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1792:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1795
	btr r12,0
	jmp LB_1796
LB_1795:
	bts r12,0
LB_1796:
LB_1797:
	cmp r15,0
	jz LB_1798
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1797
LB_1798:
; _f1590 %_1626 ⊢ %_1627 : %_1627
 ; {>  %_1626~0':_p1501 }
; _f1590 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1590
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
; ∎ %_1629
 ; {>  %_1628~0':_stg %_1629~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1799
	mov rdi,r13
	call dlt
LB_1799:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1800
	btr r12,0
	jmp LB_1801
LB_1800:
	bts r12,0
LB_1801:
	ret
MTC_LB_1791:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1802
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
	jnc LB_1803
	bt QWORD [rdi],0
	jc LB_1804
	btr r12,2
	clc
	jmp LB_1805
LB_1804:
	bts r12,2
	stc
LB_1805:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1803:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1806
	btr r12,0
	jmp LB_1807
LB_1806:
	bts r12,0
LB_1807:
LB_1808:
	cmp r15,0
	jz LB_1809
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1808
LB_1809:
; ∎ %_1630
 ; {>  %_1630~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1802:
MTC_LB_1782:
NS_E_2222:
; 	|» { 0' 1' }
NS_E_RDI_2222:
MTC_LB_2223:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2224
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
	jnc LB_2225
	bt QWORD [rdi],0
	jc LB_2226
	btr r12,5
	clc
	jmp LB_2227
LB_2226:
	bts r12,5
	stc
LB_2227:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2225:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2230
	btr r12,6
	clc
	jmp LB_2231
LB_2230:
	bts r12,6
	stc
LB_2231:
	mov r8,rcx
	bt r12,6
	jc LB_2228
	btr r12,2
	jmp LB_2229
LB_2228:
	bts r12,2
LB_2229:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2234
	btr r12,6
	clc
	jmp LB_2235
LB_2234:
	bts r12,6
	stc
LB_2235:
	mov r9,rcx
	bt r12,6
	jc LB_2232
	btr r12,3
	jmp LB_2233
LB_2232:
	bts r12,3
LB_2233:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2238
	btr r12,6
	clc
	jmp LB_2239
LB_2238:
	bts r12,6
	stc
LB_2239:
	mov r10,rcx
	bt r12,6
	jc LB_2236
	btr r12,4
	jmp LB_2237
LB_2236:
	bts r12,4
LB_2237:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2240:
	cmp r15,0
	jz LB_2241
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2240
LB_2241:
; _f2222 { %_2183 %_2187 } ⊢ { %_2188 %_2189 } : { %_2188 %_2189 }
 ; {>  %_2187~4':_p1503 %_2186~3':_p1504 %_2183~0':_r64 %_2185~2':(_lst)◂(_p1505) }
; _f2222 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2246
	btr r12,1
	jmp LB_2247
LB_2246:
	bts r12,1
LB_2247:
	call NS_E_2222
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2244
	btr r12,3
	clc
	jmp LB_2245
LB_2244:
	bts r12,3
	stc
LB_2245:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2242
	btr r12,2
	clc
	jmp LB_2243
LB_2242:
	bts r12,2
	stc
LB_2243:
	add rsp,24
MTC_LB_2248:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2249
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
	jnc LB_2250
	bt QWORD [rdi],0
	jc LB_2251
	btr r12,5
	clc
	jmp LB_2252
LB_2251:
	bts r12,5
	stc
LB_2252:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2250:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2253
	btr r12,4
	jmp LB_2254
LB_2253:
	bts r12,4
LB_2254:
LB_2255:
	cmp r15,0
	jz LB_2256
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2255
LB_2256:
; _f2222 { %_2188 %_2190 } ⊢ { %_2191 %_2192 } : { %_2191 %_2192 }
 ; {>  %_2189~1':_stg %_2190~4':_p1503 %_2188~0':_r64 %_2185~2':(_lst)◂(_p1505) }
; _f2222 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2261
	btr r12,1
	jmp LB_2262
LB_2261:
	bts r12,1
LB_2262:
	call NS_E_2222
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2263
	btr r12,3
	jmp LB_2264
LB_2263:
	bts r12,3
LB_2264:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2259
	btr r12,2
	clc
	jmp LB_2260
LB_2259:
	bts r12,2
	stc
LB_2260:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2257
	btr r12,1
	clc
	jmp LB_2258
LB_2257:
	bts r12,1
	stc
LB_2258:
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
LB_2265:
	cmp rax,0
	jz LB_2266
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2265
LB_2266:
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
; ∎ { %_2193 %_2196 }
 ; {>  %_2196~4':_stg %_2193~0':_r64 %_2195~3':_stg %_2194~1':_stg %_2185~2':(_lst)◂(_p1505) }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2267
	mov rdi,r9
	call dlt
LB_2267:
	bt r12,1
	jc LB_2268
	mov rdi,r14
	call dlt
LB_2268:
	bt r12,2
	jc LB_2269
	mov rdi,r8
	call dlt
LB_2269:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2270
	btr r12,1
	jmp LB_2271
LB_2270:
	bts r12,1
LB_2271:
	ret
MTC_LB_2249:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2272
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
	jnc LB_2273
	bt QWORD [rdi],0
	jc LB_2274
	btr r12,5
	clc
	jmp LB_2275
LB_2274:
	bts r12,5
	stc
LB_2275:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2273:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2276
	btr r12,4
	jmp LB_2277
LB_2276:
	bts r12,4
LB_2277:
LB_2278:
	cmp r15,0
	jz LB_2279
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2278
LB_2279:
; _f56 %_2188 ⊢ %_2198 : %_2198
 ; {>  %_2189~1':_stg %_2197~4':_p1502 %_2188~0':_r64 %_2185~2':(_lst)◂(_p1505) }
	add r13,1
; _f2146 { %_2198 %_2197 } ⊢ { %_2199 %_2200 } : { %_2199 %_2200 }
 ; {>  %_2189~1':_stg %_2197~4':_p1502 %_2198~0':_r64 %_2185~2':(_lst)◂(_p1505) }
; _f2146 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2284
	btr r12,1
	jmp LB_2285
LB_2284:
	bts r12,1
LB_2285:
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2286
	btr r12,3
	jmp LB_2287
LB_2286:
	bts r12,3
LB_2287:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2282
	btr r12,2
	clc
	jmp LB_2283
LB_2282:
	bts r12,2
	stc
LB_2283:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2280
	btr r12,1
	clc
	jmp LB_2281
LB_2280:
	bts r12,1
	stc
LB_2281:
	add rsp,24
; _f55 %_2199 ⊢ %_2201 : %_2201
 ; {>  %_2200~3':_stg %_2199~0':_r64 %_2189~1':_stg %_2185~2':(_lst)◂(_p1505) }
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
LB_2288:
	cmp rax,0
	jz LB_2289
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2288
LB_2289:
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
; ∎ { %_2202 %_2205 }
 ; {>  %_2202~0':_r64 %_2205~4':_stg %_2185~2':(_lst)◂(_p1505) %_2204~3':_stg %_2203~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2290
	mov rdi,r8
	call dlt
LB_2290:
	bt r12,3
	jc LB_2291
	mov rdi,r9
	call dlt
LB_2291:
	bt r12,1
	jc LB_2292
	mov rdi,r14
	call dlt
LB_2292:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2293
	btr r12,1
	jmp LB_2294
LB_2293:
	bts r12,1
LB_2294:
	ret
MTC_LB_2272:
MTC_LB_2224:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2295
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
	jnc LB_2296
	bt QWORD [rdi],0
	jc LB_2297
	btr r12,4
	clc
	jmp LB_2298
LB_2297:
	bts r12,4
	stc
LB_2298:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2296:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2301
	btr r12,5
	clc
	jmp LB_2302
LB_2301:
	bts r12,5
	stc
LB_2302:
	mov r8,r11
	bt r12,5
	jc LB_2299
	btr r12,2
	jmp LB_2300
LB_2299:
	bts r12,2
LB_2300:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2305
	btr r12,5
	clc
	jmp LB_2306
LB_2305:
	bts r12,5
	stc
LB_2306:
	mov r9,r11
	bt r12,5
	jc LB_2303
	btr r12,3
	jmp LB_2304
LB_2303:
	bts r12,3
LB_2304:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2307:
	cmp r15,0
	jz LB_2308
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2307
LB_2308:
MTC_LB_2309:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2310
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
	jnc LB_2311
	bt QWORD [rdi],0
	jc LB_2312
	btr r12,4
	clc
	jmp LB_2313
LB_2312:
	bts r12,4
	stc
LB_2313:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2311:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2314
	btr r12,1
	jmp LB_2315
LB_2314:
	bts r12,1
LB_2315:
LB_2316:
	cmp r15,0
	jz LB_2317
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2316
LB_2317:
; _f2222 { %_2183 %_2208 } ⊢ { %_2209 %_2210 } : { %_2209 %_2210 }
 ; {>  %_2206~2':(_lst)◂(_p1505) %_2208~1':_p1503 %_2183~0':_r64 }
; _f2222 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2222
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2318
	btr r12,2
	clc
	jmp LB_2319
LB_2318:
	bts r12,2
	stc
LB_2319:
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
LB_2320:
	cmp rax,0
	jz LB_2321
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2320
LB_2321:
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
; ∎ { %_2211 %_2213 }
 ; {>  %_2206~2':(_lst)◂(_p1505) %_2213~3':_stg %_2211~0':_r64 %_2212~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2322
	mov rdi,r8
	call dlt
LB_2322:
	bt r12,1
	jc LB_2323
	mov rdi,r14
	call dlt
LB_2323:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2324
	btr r12,1
	jmp LB_2325
LB_2324:
	bts r12,1
LB_2325:
	ret
MTC_LB_2310:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2326
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
	jnc LB_2327
	bt QWORD [rdi],0
	jc LB_2328
	btr r12,4
	clc
	jmp LB_2329
LB_2328:
	bts r12,4
	stc
LB_2329:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2327:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2330
	btr r12,1
	jmp LB_2331
LB_2330:
	bts r12,1
LB_2331:
LB_2332:
	cmp r15,0
	jz LB_2333
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2332
LB_2333:
; _f56 %_2183 ⊢ %_2215 : %_2215
 ; {>  %_2206~2':(_lst)◂(_p1505) %_2214~1':_p1502 %_2183~0':_r64 }
	add r13,1
; _f2146 { %_2215 %_2214 } ⊢ { %_2216 %_2217 } : { %_2216 %_2217 }
 ; {>  %_2206~2':(_lst)◂(_p1505) %_2214~1':_p1502 %_2215~0':_r64 }
; _f2146 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2334
	btr r12,2
	clc
	jmp LB_2335
LB_2334:
	bts r12,2
	stc
LB_2335:
	add rsp,16
; _f55 %_2216 ⊢ %_2218 : %_2218
 ; {>  %_2206~2':(_lst)◂(_p1505) %_2217~1':_stg %_2216~0':_r64 }
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
LB_2336:
	cmp rax,0
	jz LB_2337
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2336
LB_2337:
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
; ∎ { %_2219 %_2221 }
 ; {>  %_2206~2':(_lst)◂(_p1505) %_2219~0':_r64 %_2221~3':_stg %_2220~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2338
	mov rdi,r8
	call dlt
LB_2338:
	bt r12,1
	jc LB_2339
	mov rdi,r14
	call dlt
LB_2339:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2340
	btr r12,1
	jmp LB_2341
LB_2340:
	bts r12,1
LB_2341:
	ret
MTC_LB_2326:
MTC_LB_2295:
NS_E_2182:
; 	|» { 0' { 1' 2' 3' } }
NS_E_RDI_2182:
; _f1631 %_2149 ⊢ %_2151 : %_2151
 ; {>  %_2149~2':_p1498 %_2150~3':_p1499 %_2147~0':_r64 %_2148~1':_p1507 }
; _f1631 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2348
	btr r12,0
	jmp LB_2349
LB_2348:
	bts r12,0
LB_2349:
	call NS_E_1631
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2350
	btr r12,2
	jmp LB_2351
LB_2350:
	bts r12,2
LB_2351:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2346
	btr r12,3
	clc
	jmp LB_2347
LB_2346:
	bts r12,3
	stc
LB_2347:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2344
	btr r12,1
	clc
	jmp LB_2345
LB_2344:
	bts r12,1
	stc
LB_2345:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2342
	btr r12,0
	clc
	jmp LB_2343
LB_2342:
	bts r12,0
	stc
LB_2343:
	add rsp,32
; _f1650 %_2150 ⊢ %_2152 : %_2152
 ; {>  %_2151~2':_stg %_2150~3':_p1499 %_2147~0':_r64 %_2148~1':_p1507 }
; _f1650 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2358
	btr r12,0
	jmp LB_2359
LB_2358:
	bts r12,0
LB_2359:
	call NS_E_1650
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2360
	btr r12,3
	jmp LB_2361
LB_2360:
	bts r12,3
LB_2361:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2356
	btr r12,2
	clc
	jmp LB_2357
LB_2356:
	bts r12,2
	stc
LB_2357:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2354
	btr r12,1
	clc
	jmp LB_2355
LB_2354:
	bts r12,1
	stc
LB_2355:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2352
	btr r12,0
	clc
	jmp LB_2353
LB_2352:
	bts r12,0
	stc
LB_2353:
	add rsp,32
MTC_LB_2362:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2363
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2364
	bt QWORD [rdi],0
	jc LB_2365
	btr r12,5
	clc
	jmp LB_2366
LB_2365:
	bts r12,5
	stc
LB_2366:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2364:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2367
	btr r12,4
	jmp LB_2368
LB_2367:
	bts r12,4
LB_2368:
LB_2369:
	cmp r15,0
	jz LB_2370
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2369
LB_2370:
; _f1446 %_2153 ⊢ %_2154 : %_2154
 ; {>  %_2153~4':_p1435 %_2151~2':_stg %_2147~0':_r64 %_2152~3':_stg }
; _f1446 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2377
	btr r12,0
	jmp LB_2378
LB_2377:
	bts r12,0
LB_2378:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2379
	btr r12,1
	jmp LB_2380
LB_2379:
	bts r12,1
LB_2380:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2375
	btr r12,3
	clc
	jmp LB_2376
LB_2375:
	bts r12,3
	stc
LB_2376:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2373
	btr r12,2
	clc
	jmp LB_2374
LB_2373:
	bts r12,2
	stc
LB_2374:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2371
	btr r12,0
	clc
	jmp LB_2372
LB_2371:
	bts r12,0
	stc
LB_2372:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
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
LB_2381:
	cmp rax,0
	jz LB_2382
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2381
LB_2382:
; 1'
	push rcx
	mov rsi,r14
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
; ∎ { %_2155 %_2159 }
 ; {>  %_2156~1':_stg %_2159~4':_stg %_2158~3':_stg %_2155~0':_r64 %_2157~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2383
	mov rdi,r14
	call dlt
LB_2383:
	bt r12,3
	jc LB_2384
	mov rdi,r9
	call dlt
LB_2384:
	bt r12,2
	jc LB_2385
	mov rdi,r8
	call dlt
LB_2385:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2386
	btr r12,1
	jmp LB_2387
LB_2386:
	bts r12,1
LB_2387:
	ret
MTC_LB_2363:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2388
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2389
	bt QWORD [rdi],0
	jc LB_2390
	btr r12,5
	clc
	jmp LB_2391
LB_2390:
	bts r12,5
	stc
LB_2391:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2389:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2392
	btr r12,4
	jmp LB_2393
LB_2392:
	bts r12,4
LB_2393:
LB_2394:
	cmp r15,0
	jz LB_2395
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2394
LB_2395:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
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
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2396:
	cmp rax,0
	jz LB_2397
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2396
LB_2397:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
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
; ∎ { %_2161 %_2164 }
 ; {>  %_2163~3':_stg %_2162~2':_stg %_2160~4':_r64 %_2161~0':_r64 %_2164~1':_stg }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_2398
	mov rdi,r9
	call dlt
LB_2398:
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
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2388:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2401
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2402
	bt QWORD [rdi],0
	jc LB_2403
	btr r12,4
	clc
	jmp LB_2404
LB_2403:
	bts r12,4
	stc
LB_2404:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2402:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2405:
	cmp r15,0
	jz LB_2406
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2405
LB_2406:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
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
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2407:
	cmp rax,0
	jz LB_2408
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2407
LB_2408:
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
; ∎ { %_2165 %_2168 }
 ; {>  %_2165~0':_r64 %_2167~3':_stg %_2166~2':_stg %_2168~1':_stg }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_2409
	mov rdi,r9
	call dlt
LB_2409:
	bt r12,2
	jc LB_2410
	mov rdi,r8
	call dlt
LB_2410:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2401:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2411
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °3◂4'
; 1' ⊢ °3◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2412
	bt QWORD [rdi],0
	jc LB_2413
	btr r12,5
	clc
	jmp LB_2414
LB_2413:
	bts r12,5
	stc
LB_2414:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2412:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2415
	btr r12,4
	jmp LB_2416
LB_2415:
	bts r12,4
LB_2416:
LB_2417:
	cmp r15,0
	jz LB_2418
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2417
LB_2418:
; _f1590 %_2169 ⊢ %_2170 : %_2170
 ; {>  %_2151~2':_stg %_2147~0':_r64 %_2169~4':_p1501 %_2152~3':_stg }
; _f1590 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2425
	btr r12,0
	jmp LB_2426
LB_2425:
	bts r12,0
LB_2426:
	call NS_E_1590
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2427
	btr r12,1
	jmp LB_2428
LB_2427:
	bts r12,1
LB_2428:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2423
	btr r12,3
	clc
	jmp LB_2424
LB_2423:
	bts r12,3
	stc
LB_2424:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2421
	btr r12,2
	clc
	jmp LB_2422
LB_2421:
	bts r12,2
	stc
LB_2422:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2419
	btr r12,0
	clc
	jmp LB_2420
LB_2419:
	bts r12,0
	stc
LB_2420:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
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
LB_2429:
	cmp rax,0
	jz LB_2430
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2429
LB_2430:
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
	mov rsi,r14
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
; ∎ { %_2171 %_2175 }
 ; {>  %_2174~3':_stg %_2173~2':_stg %_2172~1':_stg %_2175~4':_stg %_2171~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2431
	mov rdi,r9
	call dlt
LB_2431:
	bt r12,2
	jc LB_2432
	mov rdi,r8
	call dlt
LB_2432:
	bt r12,1
	jc LB_2433
	mov rdi,r14
	call dlt
LB_2433:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2434
	btr r12,1
	jmp LB_2435
LB_2434:
	bts r12,1
LB_2435:
	ret
MTC_LB_2411:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2436
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °4◂{ 4' 5' }
; 1' ⊢ °4◂{ 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2437
	bt QWORD [rdi],0
	jc LB_2438
	btr r12,6
	clc
	jmp LB_2439
LB_2438:
	bts r12,6
	stc
LB_2439:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2437:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2442
	btr r12,7
	clc
	jmp LB_2443
LB_2442:
	bts r12,7
	stc
LB_2443:
	mov r10,rdx
	bt r12,7
	jc LB_2440
	btr r12,4
	jmp LB_2441
LB_2440:
	bts r12,4
LB_2441:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2446
	btr r12,7
	clc
	jmp LB_2447
LB_2446:
	bts r12,7
	stc
LB_2447:
	mov r11,rdx
	bt r12,7
	jc LB_2444
	btr r12,5
	jmp LB_2445
LB_2444:
	bts r12,5
LB_2445:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2448:
	cmp r15,0
	jz LB_2449
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2448
LB_2449:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,6
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
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
LB_2450:
	cmp rax,0
	jz LB_2451
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2450
LB_2451:
; "\194\187 _^ "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5f
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_5e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 1'
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
; ∎ { %_2178 %_2181 }
 ; {>  %_2179~2':_stg %_2178~0':_r64 %_2177~5':(_lst)◂(_p1508) %_2176~4':_r64 %_2181~1':_stg %_2180~3':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2452
	mov rdi,r8
	call dlt
LB_2452:
	bt r12,5
	jc LB_2453
	mov rdi,r11
	call dlt
LB_2453:
	bt r12,4
	jc LB_2454
	mov rdi,r10
	call dlt
LB_2454:
	bt r12,3
	jc LB_2455
	mov rdi,r9
	call dlt
LB_2455:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2436:
NS_E_2146:
; 	|» { 0' 1' }
NS_E_RDI_2146:
MTC_LB_2456:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2457
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
	jnc LB_2458
	bt QWORD [rdi],0
	jc LB_2459
	btr r12,6
	clc
	jmp LB_2460
LB_2459:
	bts r12,6
	stc
LB_2460:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2458:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2473
	btr r12,7
	clc
	jmp LB_2474
LB_2473:
	bts r12,7
	stc
LB_2474:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2463
	btr r12,5
	clc
	jmp LB_2464
LB_2463:
	bts r12,5
	stc
LB_2464:
	mov r8,r11
	bt r12,5
	jc LB_2461
	btr r12,2
	jmp LB_2462
LB_2461:
	bts r12,2
LB_2462:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2467
	btr r12,5
	clc
	jmp LB_2468
LB_2467:
	bts r12,5
	stc
LB_2468:
	mov r9,r11
	bt r12,5
	jc LB_2465
	btr r12,3
	jmp LB_2466
LB_2465:
	bts r12,3
LB_2466:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_2471
	btr r12,5
	clc
	jmp LB_2472
LB_2471:
	bts r12,5
	stc
LB_2472:
	mov r10,r11
	bt r12,5
	jc LB_2469
	btr r12,4
	jmp LB_2470
LB_2469:
	bts r12,4
LB_2470:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2477
	btr r12,7
	clc
	jmp LB_2478
LB_2477:
	bts r12,7
	stc
LB_2478:
	mov r11,rdx
	bt r12,7
	jc LB_2475
	btr r12,5
	jmp LB_2476
LB_2475:
	bts r12,5
LB_2476:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2479:
	cmp r15,0
	jz LB_2480
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2479
LB_2480:
; _f2182 { %_2129 %_2131 } ⊢ { %_2133 %_2134 } : { %_2133 %_2134 }
 ; {>  %_2131~{ 2' 3' 4' }:{ _p1507 _p1498 _p1499 } %_2132~5':_p1502 %_2129~0':_r64 }
; _f2182 { 0' { 2' 3' 4' } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 101110.. |},{ 0' { 2' 3' 4' } } ⊢ { 0' { 1' 2' 3' } }
	mov r14,r8
	bt r12,2
	jc LB_2483
	btr r12,1
	jmp LB_2484
LB_2483:
	bts r12,1
LB_2484:
	mov r8,r9
	bt r12,3
	jc LB_2485
	btr r12,2
	jmp LB_2486
LB_2485:
	bts r12,2
LB_2486:
	mov r9,r10
	bt r12,4
	jc LB_2487
	btr r12,3
	jmp LB_2488
LB_2487:
	bts r12,3
LB_2488:
	call NS_E_2182
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*0]
	bt QWORD rax,5
	jc LB_2481
	btr r12,5
	clc
	jmp LB_2482
LB_2481:
	bts r12,5
	stc
LB_2482:
	add rsp,16
; _f2146 { %_2133 %_2132 } ⊢ { %_2135 %_2136 } : { %_2135 %_2136 }
 ; {>  %_2132~5':_p1502 %_2133~0':_r64 %_2134~1':_stg }
; _f2146 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2491
	btr r12,1
	jmp LB_2492
LB_2491:
	bts r12,1
LB_2492:
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2493
	btr r12,2
	jmp LB_2494
LB_2493:
	bts r12,2
LB_2494:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2489
	btr r12,1
	clc
	jmp LB_2490
LB_2489:
	bts r12,1
	stc
LB_2490:
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
; ∎ { %_2135 %_2139 }
 ; {>  %_2138~2':_stg %_2137~1':_stg %_2135~0':_r64 %_2139~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2495
	mov rdi,r8
	call dlt
LB_2495:
	bt r12,1
	jc LB_2496
	mov rdi,r14
	call dlt
LB_2496:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2497
	btr r12,1
	jmp LB_2498
LB_2497:
	bts r12,1
LB_2498:
	ret
MTC_LB_2457:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2499
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
	jnc LB_2500
	bt QWORD [rdi],0
	jc LB_2501
	btr r12,3
	clc
	jmp LB_2502
LB_2501:
	bts r12,3
	stc
LB_2502:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2500:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2503
	btr r12,2
	jmp LB_2504
LB_2503:
	bts r12,2
LB_2504:
LB_2505:
	cmp r15,0
	jz LB_2506
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2505
LB_2506:
; _f2222 { %_2129 %_2140 } ⊢ { %_2141 %_2142 } : { %_2141 %_2142 }
 ; {>  %_2140~2':_p1503 %_2129~0':_r64 }
; _f2222 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2507
	btr r12,1
	jmp LB_2508
LB_2507:
	bts r12,1
LB_2508:
	call NS_E_2222
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2141 %_2142 }
 ; {>  %_2142~1':_stg %_2141~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2499:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2509
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
	jnc LB_2510
	bt QWORD [rdi],0
	jc LB_2511
	btr r12,3
	clc
	jmp LB_2512
LB_2511:
	bts r12,3
	stc
LB_2512:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2510:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2513
	btr r12,2
	jmp LB_2514
LB_2513:
	bts r12,2
LB_2514:
LB_2515:
	cmp r15,0
	jz LB_2516
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2515
LB_2516:
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
LB_2517:
	cmp rax,0
	jz LB_2518
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2517
LB_2518:
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
; ∎ { %_2144 %_2145 }
 ; {>  %_2145~1':_stg %_2144~0':_r64 %_2143~2':_p1498 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2519
	mov rdi,r8
	call dlt
LB_2519:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2509:
NS_E_2128:
; 	|» { 0' 1' }
NS_E_RDI_2128:
MTC_LB_2520:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2521
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
	jnc LB_2522
	bt QWORD [rdi],0
	jc LB_2523
	btr r12,6
	clc
	jmp LB_2524
LB_2523:
	bts r12,6
	stc
LB_2524:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2522:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2537
	btr r12,7
	clc
	jmp LB_2538
LB_2537:
	bts r12,7
	stc
LB_2538:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2527
	btr r12,5
	clc
	jmp LB_2528
LB_2527:
	bts r12,5
	stc
LB_2528:
	mov r8,r11
	bt r12,5
	jc LB_2525
	btr r12,2
	jmp LB_2526
LB_2525:
	bts r12,2
LB_2526:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2531
	btr r12,5
	clc
	jmp LB_2532
LB_2531:
	bts r12,5
	stc
LB_2532:
	mov r9,r11
	bt r12,5
	jc LB_2529
	btr r12,3
	jmp LB_2530
LB_2529:
	bts r12,3
LB_2530:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_2535
	btr r12,5
	clc
	jmp LB_2536
LB_2535:
	bts r12,5
	stc
LB_2536:
	mov r10,r11
	bt r12,5
	jc LB_2533
	btr r12,4
	jmp LB_2534
LB_2533:
	bts r12,4
LB_2534:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2541
	btr r12,7
	clc
	jmp LB_2542
LB_2541:
	bts r12,7
	stc
LB_2542:
	mov r11,rdx
	bt r12,7
	jc LB_2539
	btr r12,5
	jmp LB_2540
LB_2539:
	bts r12,5
LB_2540:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2543:
	cmp r15,0
	jz LB_2544
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2543
LB_2544:
; _f1650 %_2111 ⊢ %_2114 : %_2114
 ; {>  %_2111~3':_p1499 %_2110~2':_stg %_2113~5':(_lst)◂({ _stg _p1499 _p1502 }) %_2108~0':_r64 %_2112~4':_p1502 }
; _f1650 3' ⊢ 1'
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
	jc LB_2553
	btr r12,0
	jmp LB_2554
LB_2553:
	bts r12,0
LB_2554:
	call NS_E_1650
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2555
	btr r12,1
	jmp LB_2556
LB_2555:
	bts r12,1
LB_2556:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2551
	btr r12,5
	clc
	jmp LB_2552
LB_2551:
	bts r12,5
	stc
LB_2552:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2549
	btr r12,4
	clc
	jmp LB_2550
LB_2549:
	bts r12,4
	stc
LB_2550:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2547
	btr r12,2
	clc
	jmp LB_2548
LB_2547:
	bts r12,2
	stc
LB_2548:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2545
	btr r12,0
	clc
	jmp LB_2546
LB_2545:
	bts r12,0
	stc
LB_2546:
	add rsp,40
; _f2128 { %_2108 %_2113 } ⊢ { %_2115 %_2116 } : { %_2115 %_2116 }
 ; {>  %_2114~1':_stg %_2110~2':_stg %_2113~5':(_lst)◂({ _stg _p1499 _p1502 }) %_2108~0':_r64 %_2112~4':_p1502 }
; _f2128 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2563
	btr r12,1
	jmp LB_2564
LB_2563:
	bts r12,1
LB_2564:
	call NS_E_2128
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2565
	btr r12,3
	jmp LB_2566
LB_2565:
	bts r12,3
LB_2566:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2561
	btr r12,4
	clc
	jmp LB_2562
LB_2561:
	bts r12,4
	stc
LB_2562:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2559
	btr r12,2
	clc
	jmp LB_2560
LB_2559:
	bts r12,2
	stc
LB_2560:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2557
	btr r12,1
	clc
	jmp LB_2558
LB_2557:
	bts r12,1
	stc
LB_2558:
	add rsp,32
; _f56 %_2115 ⊢ %_2117 : %_2117
 ; {>  %_2116~3':_stg %_2114~1':_stg %_2110~2':_stg %_2115~0':_r64 %_2112~4':_p1502 }
	add r13,1
; _f2146 { %_2117 %_2112 } ⊢ { %_2118 %_2119 } : { %_2118 %_2119 }
 ; {>  %_2116~3':_stg %_2114~1':_stg %_2110~2':_stg %_2117~0':_r64 %_2112~4':_p1502 }
; _f2146 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2573
	btr r12,1
	jmp LB_2574
LB_2573:
	bts r12,1
LB_2574:
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2575
	btr r12,4
	jmp LB_2576
LB_2575:
	bts r12,4
LB_2576:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2571
	btr r12,3
	clc
	jmp LB_2572
LB_2571:
	bts r12,3
	stc
LB_2572:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2569
	btr r12,2
	clc
	jmp LB_2570
LB_2569:
	bts r12,2
	stc
LB_2570:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2567
	btr r12,1
	clc
	jmp LB_2568
LB_2567:
	bts r12,1
	stc
LB_2568:
	add rsp,32
; _f55 %_2118 ⊢ %_2120 : %_2120
 ; {>  %_2119~4':_stg %_2118~0':_r64 %_2116~3':_stg %_2114~1':_stg %_2110~2':_stg }
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
LB_2577:
	cmp rax,0
	jz LB_2578
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2577
LB_2578:
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
; ∎ { %_2121 %_2126 }
 ; {>  %_2122~2':_stg %_2121~0':_r64 %_2124~4':_stg %_2123~1':_stg %_2126~5':_stg %_2125~3':_stg }
; 	∎ { 0' 5' }
	bt r12,2
	jc LB_2579
	mov rdi,r8
	call dlt
LB_2579:
	bt r12,4
	jc LB_2580
	mov rdi,r10
	call dlt
LB_2580:
	bt r12,1
	jc LB_2581
	mov rdi,r14
	call dlt
LB_2581:
	bt r12,3
	jc LB_2582
	mov rdi,r9
	call dlt
LB_2582:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2583
	btr r12,1
	jmp LB_2584
LB_2583:
	bts r12,1
LB_2584:
	ret
MTC_LB_2521:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2585
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
	jnc LB_2586
	bt QWORD [rdi],0
	jc LB_2587
	btr r12,2
	clc
	jmp LB_2588
LB_2587:
	bts r12,2
	stc
LB_2588:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2586:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2589:
	cmp r15,0
	jz LB_2590
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2589
LB_2590:
; 	» "" _ ⊢ 1' : %_2127
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2108 %_2127 }
 ; {>  %_2127~1':_stg %_2108~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2585:
NS_E_2107:
; 	|» { 0' 1' }
NS_E_RDI_2107:
MTC_LB_2591:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2592
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
	jnc LB_2593
	bt QWORD [rdi],0
	jc LB_2594
	btr r12,4
	clc
	jmp LB_2595
LB_2594:
	bts r12,4
	stc
LB_2595:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2593:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2598
	btr r12,5
	clc
	jmp LB_2599
LB_2598:
	bts r12,5
	stc
LB_2599:
	mov r8,r11
	bt r12,5
	jc LB_2596
	btr r12,2
	jmp LB_2597
LB_2596:
	bts r12,2
LB_2597:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2602
	btr r12,5
	clc
	jmp LB_2603
LB_2602:
	bts r12,5
	stc
LB_2603:
	mov r9,r11
	bt r12,5
	jc LB_2600
	btr r12,3
	jmp LB_2601
LB_2600:
	bts r12,3
LB_2601:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2604:
	cmp r15,0
	jz LB_2605
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2604
LB_2605:
; _f1650 %_2086 ⊢ %_2088 : %_2088
 ; {>  %_2084~0':_r64 %_2086~2':_p1499 %_2087~3':_p1502 }
; _f1650 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2610
	btr r12,0
	jmp LB_2611
LB_2610:
	bts r12,0
LB_2611:
	call NS_E_1650
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
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2608
	btr r12,3
	clc
	jmp LB_2609
LB_2608:
	bts r12,3
	stc
LB_2609:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2606
	btr r12,0
	clc
	jmp LB_2607
LB_2606:
	bts r12,0
	stc
LB_2607:
	add rsp,24
; _f56 %_2084 ⊢ %_2089 : %_2089
 ; {>  %_2084~0':_r64 %_2088~1':_stg %_2087~3':_p1502 }
	add r13,1
; _f2146 { %_2089 %_2087 } ⊢ { %_2090 %_2091 } : { %_2090 %_2091 }
 ; {>  %_2089~0':_r64 %_2088~1':_stg %_2087~3':_p1502 }
; _f2146 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2616
	btr r12,1
	jmp LB_2617
LB_2616:
	bts r12,1
LB_2617:
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2618
	btr r12,2
	jmp LB_2619
LB_2618:
	bts r12,2
LB_2619:
; pop_iv
	mov rax,QWORD [rsp]
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
	add rsp,16
; _f55 %_2090 ⊢ %_2092 : %_2092
 ; {>  %_2091~2':_stg %_2090~0':_r64 %_2088~1':_stg }
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
; ∎ { %_2092 %_2095 }
 ; {>  %_2094~2':_stg %_2092~0':_r64 %_2093~1':_stg %_2095~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2620
	mov rdi,r8
	call dlt
LB_2620:
	bt r12,1
	jc LB_2621
	mov rdi,r14
	call dlt
LB_2621:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2622
	btr r12,1
	jmp LB_2623
LB_2622:
	bts r12,1
LB_2623:
	ret
MTC_LB_2592:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2624
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
	jnc LB_2625
	bt QWORD [rdi],0
	jc LB_2626
	btr r12,3
	clc
	jmp LB_2627
LB_2626:
	bts r12,3
	stc
LB_2627:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2625:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2628
	btr r12,2
	jmp LB_2629
LB_2628:
	bts r12,2
LB_2629:
LB_2630:
	cmp r15,0
	jz LB_2631
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2630
LB_2631:
; _f1590 %_2096 ⊢ %_2097 : %_2097
 ; {>  %_2084~0':_r64 %_2096~2':_p1501 }
; _f1590 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2634
	btr r12,0
	jmp LB_2635
LB_2634:
	bts r12,0
LB_2635:
	call NS_E_1590
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2636
	btr r12,1
	jmp LB_2637
LB_2636:
	bts r12,1
LB_2637:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2632
	btr r12,0
	clc
	jmp LB_2633
LB_2632:
	bts r12,0
	stc
LB_2633:
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
; ∎ { %_2084 %_2099 }
 ; {>  %_2084~0':_r64 %_2098~1':_stg %_2099~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2638
	mov rdi,r14
	call dlt
LB_2638:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2639
	btr r12,1
	jmp LB_2640
LB_2639:
	bts r12,1
LB_2640:
	ret
MTC_LB_2624:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2641
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
	jnc LB_2642
	bt QWORD [rdi],0
	jc LB_2643
	btr r12,3
	clc
	jmp LB_2644
LB_2643:
	bts r12,3
	stc
LB_2644:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2642:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2645
	btr r12,2
	jmp LB_2646
LB_2645:
	bts r12,2
LB_2646:
LB_2647:
	cmp r15,0
	jz LB_2648
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2647
LB_2648:
; _f56 %_2084 ⊢ %_2101 : %_2101
 ; {>  %_2084~0':_r64 %_2100~2':_p1502 }
	add r13,1
; _f2146 { %_2101 %_2100 } ⊢ { %_2102 %_2103 } : { %_2102 %_2103 }
 ; {>  %_2101~0':_r64 %_2100~2':_p1502 }
; _f2146 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2649
	btr r12,1
	jmp LB_2650
LB_2649:
	bts r12,1
LB_2650:
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2102 ⊢ %_2104 : %_2104
 ; {>  %_2103~1':_stg %_2102~0':_r64 }
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
; ∎ { %_2104 %_2106 }
 ; {>  %_2104~0':_r64 %_2105~1':_stg %_2106~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2651
	mov rdi,r14
	call dlt
LB_2651:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2652
	btr r12,1
	jmp LB_2653
LB_2652:
	bts r12,1
LB_2653:
	ret
MTC_LB_2641:
NS_E_2083:
; 	|» 0'
NS_E_RDI_2083:
MTC_LB_2654:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2655
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
	jnc LB_2656
	bt QWORD [rdi],0
	jc LB_2657
	btr r12,3
	clc
	jmp LB_2658
LB_2657:
	bts r12,3
	stc
LB_2658:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2656:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2661
	btr r12,4
	clc
	jmp LB_2662
LB_2661:
	bts r12,4
	stc
LB_2662:
	mov r14,r10
	bt r12,4
	jc LB_2659
	btr r12,1
	jmp LB_2660
LB_2659:
	bts r12,1
LB_2660:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2665
	btr r12,4
	clc
	jmp LB_2666
LB_2665:
	bts r12,4
	stc
LB_2666:
	mov r8,r10
	bt r12,4
	jc LB_2663
	btr r12,2
	jmp LB_2664
LB_2663:
	bts r12,2
LB_2664:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2667:
	cmp r15,0
	jz LB_2668
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2667
LB_2668:
; _f2073 %_2075 ⊢ %_2077 : %_2077
 ; {>  %_2076~2':(_lst)◂(_p1500) %_2075~1':_p1500 }
; _f2073 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2671
	btr r12,0
	jmp LB_2672
LB_2671:
	bts r12,0
LB_2672:
	call NS_E_2073
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2669
	btr r12,2
	clc
	jmp LB_2670
LB_2669:
	bts r12,2
	stc
LB_2670:
	add rsp,16
; _f2083 %_2076 ⊢ %_2078 : %_2078
 ; {>  %_2077~0':_stg %_2076~2':(_lst)◂(_p1500) }
; _f2083 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2675
	btr r12,0
	jmp LB_2676
LB_2675:
	bts r12,0
LB_2676:
	call NS_E_2083
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2677
	btr r12,1
	jmp LB_2678
LB_2677:
	bts r12,1
LB_2678:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2673
	btr r12,0
	clc
	jmp LB_2674
LB_2673:
	bts r12,0
	stc
LB_2674:
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
; ∎ %_2081
 ; {>  %_2079~0':_stg %_2081~2':_stg %_2080~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2679
	mov rdi,r13
	call dlt
LB_2679:
	bt r12,1
	jc LB_2680
	mov rdi,r14
	call dlt
LB_2680:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2681
	btr r12,0
	jmp LB_2682
LB_2681:
	bts r12,0
LB_2682:
	ret
MTC_LB_2655:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2683
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
	jnc LB_2684
	bt QWORD [rdi],0
	jc LB_2685
	btr r12,1
	clc
	jmp LB_2686
LB_2685:
	bts r12,1
	stc
LB_2686:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2684:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2687:
	cmp r15,0
	jz LB_2688
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2687
LB_2688:
; 	» "" _ ⊢ 0' : %_2082
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2082
 ; {>  %_2082~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2683:
NS_E_2073:
; 	|» 0'
NS_E_RDI_2073:
MTC_LB_2689:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2690
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
	jnc LB_2691
	bt QWORD [rdi],0
	jc LB_2692
	btr r12,2
	clc
	jmp LB_2693
LB_2692:
	bts r12,2
	stc
LB_2693:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2691:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2694
	btr r12,1
	jmp LB_2695
LB_2694:
	bts r12,1
LB_2695:
LB_2696:
	cmp r15,0
	jz LB_2697
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2696
LB_2697:
; _f2083 %_2050 ⊢ %_2051 : %_2051
 ; {>  %_2050~1':(_lst)◂(_p1500) }
; _f2083 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2698
	btr r12,0
	jmp LB_2699
LB_2698:
	bts r12,0
LB_2699:
	call NS_E_2083
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
; ∎ %_2053
 ; {>  %_2053~1':_stg %_2052~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2700
	mov rdi,r13
	call dlt
LB_2700:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2701
	btr r12,0
	jmp LB_2702
LB_2701:
	bts r12,0
LB_2702:
	ret
MTC_LB_2690:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2703
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
	jnc LB_2704
	bt QWORD [rdi],0
	jc LB_2705
	btr r12,3
	clc
	jmp LB_2706
LB_2705:
	bts r12,3
	stc
LB_2706:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2704:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2709
	btr r12,4
	clc
	jmp LB_2710
LB_2709:
	bts r12,4
	stc
LB_2710:
	mov r14,r10
	bt r12,4
	jc LB_2707
	btr r12,1
	jmp LB_2708
LB_2707:
	bts r12,1
LB_2708:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2713
	btr r12,4
	clc
	jmp LB_2714
LB_2713:
	bts r12,4
	stc
LB_2714:
	mov r8,r10
	bt r12,4
	jc LB_2711
	btr r12,2
	jmp LB_2712
LB_2711:
	bts r12,2
LB_2712:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2715:
	cmp r15,0
	jz LB_2716
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2715
LB_2716:
; _f2073 %_2054 ⊢ %_2056 : %_2056
 ; {>  %_2055~2':_p1500 %_2054~1':_p1500 }
; _f2073 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2719
	btr r12,0
	jmp LB_2720
LB_2719:
	bts r12,0
LB_2720:
	call NS_E_2073
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2717
	btr r12,2
	clc
	jmp LB_2718
LB_2717:
	bts r12,2
	stc
LB_2718:
	add rsp,16
; _f2073 %_2055 ⊢ %_2057 : %_2057
 ; {>  %_2055~2':_p1500 %_2056~0':_stg }
; _f2073 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2723
	btr r12,0
	jmp LB_2724
LB_2723:
	bts r12,0
LB_2724:
	call NS_E_2073
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2725
	btr r12,1
	jmp LB_2726
LB_2725:
	bts r12,1
LB_2726:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2721
	btr r12,0
	clc
	jmp LB_2722
LB_2721:
	bts r12,0
	stc
LB_2722:
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
; ∎ %_2060
 ; {>  %_2059~1':_stg %_2058~0':_stg %_2060~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_2727
	mov rdi,r14
	call dlt
LB_2727:
	bt r12,0
	jc LB_2728
	mov rdi,r13
	call dlt
LB_2728:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2729
	btr r12,0
	jmp LB_2730
LB_2729:
	bts r12,0
LB_2730:
	ret
MTC_LB_2703:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2731
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
	jnc LB_2732
	bt QWORD [rdi],0
	jc LB_2733
	btr r12,3
	clc
	jmp LB_2734
LB_2733:
	bts r12,3
	stc
LB_2734:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2732:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2737
	btr r12,4
	clc
	jmp LB_2738
LB_2737:
	bts r12,4
	stc
LB_2738:
	mov r14,r10
	bt r12,4
	jc LB_2735
	btr r12,1
	jmp LB_2736
LB_2735:
	bts r12,1
LB_2736:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2741
	btr r12,4
	clc
	jmp LB_2742
LB_2741:
	bts r12,4
	stc
LB_2742:
	mov r8,r10
	bt r12,4
	jc LB_2739
	btr r12,2
	jmp LB_2740
LB_2739:
	bts r12,2
LB_2740:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2743:
	cmp r15,0
	jz LB_2744
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2743
LB_2744:
; _f2073 %_2061 ⊢ %_2063 : %_2063
 ; {>  %_2062~2':_p1500 %_2061~1':_p1500 }
; _f2073 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2747
	btr r12,0
	jmp LB_2748
LB_2747:
	bts r12,0
LB_2748:
	call NS_E_2073
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2745
	btr r12,2
	clc
	jmp LB_2746
LB_2745:
	bts r12,2
	stc
LB_2746:
	add rsp,16
; _f2073 %_2062 ⊢ %_2064 : %_2064
 ; {>  %_2062~2':_p1500 %_2063~0':_stg }
; _f2073 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2751
	btr r12,0
	jmp LB_2752
LB_2751:
	bts r12,0
LB_2752:
	call NS_E_2073
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2753
	btr r12,1
	jmp LB_2754
LB_2753:
	bts r12,1
LB_2754:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2749
	btr r12,0
	clc
	jmp LB_2750
LB_2749:
	bts r12,0
	stc
LB_2750:
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
; ∎ %_2067
 ; {>  %_2065~0':_stg %_2067~2':_stg %_2066~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2755
	mov rdi,r13
	call dlt
LB_2755:
	bt r12,1
	jc LB_2756
	mov rdi,r14
	call dlt
LB_2756:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2757
	btr r12,0
	jmp LB_2758
LB_2757:
	bts r12,0
LB_2758:
	ret
MTC_LB_2731:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2759
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
	jnc LB_2760
	bt QWORD [rdi],0
	jc LB_2761
	btr r12,2
	clc
	jmp LB_2762
LB_2761:
	bts r12,2
	stc
LB_2762:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2760:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2763
	btr r12,1
	jmp LB_2764
LB_2763:
	bts r12,1
LB_2764:
LB_2765:
	cmp r15,0
	jz LB_2766
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2765
LB_2766:
; _f1446 %_2068 ⊢ %_2069 : %_2069
 ; {>  %_2068~1':_p1435 }
; _f1446 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2767
	btr r12,0
	jmp LB_2768
LB_2767:
	bts r12,0
LB_2768:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2069
 ; {>  %_2069~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2759:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2769
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
	jnc LB_2770
	bt QWORD [rdi],0
	jc LB_2771
	btr r12,2
	clc
	jmp LB_2772
LB_2771:
	bts r12,2
	stc
LB_2772:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2770:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2773
	btr r12,1
	jmp LB_2774
LB_2773:
	bts r12,1
LB_2774:
LB_2775:
	cmp r15,0
	jz LB_2776
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2775
LB_2776:
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
; ∎ %_2072
 ; {>  %_2071~1':_stg %_2072~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_2777
	mov rdi,r14
	call dlt
LB_2777:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2769:
NS_E_2048:
; 	|» { 0' 1' }
NS_E_RDI_2048:
MTC_LB_2778:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2779
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
	jnc LB_2780
	bt QWORD [rdi],0
	jc LB_2781
	btr r12,5
	clc
	jmp LB_2782
LB_2781:
	bts r12,5
	stc
LB_2782:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2780:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2791
	btr r12,6
	clc
	jmp LB_2792
LB_2791:
	bts r12,6
	stc
LB_2792:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2785
	btr r12,4
	clc
	jmp LB_2786
LB_2785:
	bts r12,4
	stc
LB_2786:
	mov r8,r10
	bt r12,4
	jc LB_2783
	btr r12,2
	jmp LB_2784
LB_2783:
	bts r12,2
LB_2784:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2789
	btr r12,4
	clc
	jmp LB_2790
LB_2789:
	bts r12,4
	stc
LB_2790:
	mov r9,r10
	bt r12,4
	jc LB_2787
	btr r12,3
	jmp LB_2788
LB_2787:
	bts r12,3
LB_2788:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2795
	btr r12,6
	clc
	jmp LB_2796
LB_2795:
	bts r12,6
	stc
LB_2796:
	mov r10,rcx
	bt r12,6
	jc LB_2793
	btr r12,4
	jmp LB_2794
LB_2793:
	bts r12,4
LB_2794:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2797:
	cmp r15,0
	jz LB_2798
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2797
LB_2798:
; _f2048 { %_2034 %_2038 } ⊢ { %_2039 %_2040 } : { %_2039 %_2040 }
 ; {>  %_2038~4':(_lst)◂({ _stg _p1500 }) %_2036~2':_stg %_2037~3':_p1500 %_2034~0':_r64 }
; _f2048 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2803
	btr r12,1
	jmp LB_2804
LB_2803:
	bts r12,1
LB_2804:
	call NS_E_2048
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2801
	btr r12,3
	clc
	jmp LB_2802
LB_2801:
	bts r12,3
	stc
LB_2802:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2799
	btr r12,2
	clc
	jmp LB_2800
LB_2799:
	bts r12,2
	stc
LB_2800:
	add rsp,24
; _f2073 %_2037 ⊢ %_2041 : %_2041
 ; {>  %_2040~1':_stg %_2036~2':_stg %_2039~0':_r64 %_2037~3':_p1500 }
; _f2073 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2811
	btr r12,0
	jmp LB_2812
LB_2811:
	bts r12,0
LB_2812:
	call NS_E_2073
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2813
	btr r12,3
	jmp LB_2814
LB_2813:
	bts r12,3
LB_2814:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2809
	btr r12,2
	clc
	jmp LB_2810
LB_2809:
	bts r12,2
	stc
LB_2810:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2807
	btr r12,1
	clc
	jmp LB_2808
LB_2807:
	bts r12,1
	stc
LB_2808:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2805
	btr r12,0
	clc
	jmp LB_2806
LB_2805:
	bts r12,0
	stc
LB_2806:
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
LB_2815:
	cmp rax,0
	jz LB_2816
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2815
LB_2816:
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
; ∎ { %_2042 %_2046 }
 ; {>  %_2046~4':_stg %_2044~3':_stg %_2043~2':_stg %_2045~1':_stg %_2042~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2817
	mov rdi,r9
	call dlt
LB_2817:
	bt r12,2
	jc LB_2818
	mov rdi,r8
	call dlt
LB_2818:
	bt r12,1
	jc LB_2819
	mov rdi,r14
	call dlt
LB_2819:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2820
	btr r12,1
	jmp LB_2821
LB_2820:
	bts r12,1
LB_2821:
	ret
MTC_LB_2779:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2822
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
	jnc LB_2823
	bt QWORD [rdi],0
	jc LB_2824
	btr r12,2
	clc
	jmp LB_2825
LB_2824:
	bts r12,2
	stc
LB_2825:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2823:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2826:
	cmp r15,0
	jz LB_2827
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2826
LB_2827:
; 	» "" _ ⊢ 1' : %_2047
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_2034 %_2047 }
 ; {>  %_2047~1':_stg %_2034~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2822:
NS_E_2033:
; 	|» { 0' 1' }
NS_E_RDI_2033:
MTC_LB_2828:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2829
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
	jnc LB_2830
	bt QWORD [rdi],0
	jc LB_2831
	btr r12,3
	clc
	jmp LB_2832
LB_2831:
	bts r12,3
	stc
LB_2832:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2830:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2833
	btr r12,2
	jmp LB_2834
LB_2833:
	bts r12,2
LB_2834:
LB_2835:
	cmp r15,0
	jz LB_2836
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2835
LB_2836:
; _f56 %_2020 ⊢ %_2023 : %_2023
 ; {>  %_2020~0':_r64 %_2022~2':(_lst)◂({ _stg _p1500 }) }
	add r13,1
; _f2048 { %_2023 %_2022 } ⊢ { %_2024 %_2025 } : { %_2024 %_2025 }
 ; {>  %_2022~2':(_lst)◂({ _stg _p1500 }) %_2023~0':_r64 }
; _f2048 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2837
	btr r12,1
	jmp LB_2838
LB_2837:
	bts r12,1
LB_2838:
	call NS_E_2048
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_2024 ⊢ %_2026 : %_2026
 ; {>  %_2024~0':_r64 %_2025~1':_stg }
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
; ∎ { %_2026 %_2027 }
 ; {>  %_2028~2':_stg %_2027~1':_stg %_2026~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2839
	mov rdi,r8
	call dlt
LB_2839:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2829:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2840
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
	jnc LB_2841
	bt QWORD [rdi],0
	jc LB_2842
	btr r12,3
	clc
	jmp LB_2843
LB_2842:
	bts r12,3
	stc
LB_2843:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2841:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2844
	btr r12,2
	jmp LB_2845
LB_2844:
	bts r12,2
LB_2845:
LB_2846:
	cmp r15,0
	jz LB_2847
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2846
LB_2847:
; _f2073 %_2029 ⊢ %_2030 : %_2030
 ; {>  %_2029~2':_p1500 %_2020~0':_r64 }
; _f2073 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2850
	btr r12,0
	jmp LB_2851
LB_2850:
	bts r12,0
LB_2851:
	call NS_E_2073
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2852
	btr r12,1
	jmp LB_2853
LB_2852:
	bts r12,1
LB_2853:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2848
	btr r12,0
	clc
	jmp LB_2849
LB_2848:
	bts r12,0
	stc
LB_2849:
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
; ∎ { %_2020 %_2032 }
 ; {>  %_2020~0':_r64 %_2032~2':_stg %_2031~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2854
	mov rdi,r14
	call dlt
LB_2854:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2855
	btr r12,1
	jmp LB_2856
LB_2855:
	bts r12,1
LB_2856:
	ret
MTC_LB_2840:
NS_E_2019:
; 	|» 0'
NS_E_RDI_2019:
MTC_LB_2857:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2858
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
	jnc LB_2859
	bt QWORD [rdi],0
	jc LB_2860
	btr r12,3
	clc
	jmp LB_2861
LB_2860:
	bts r12,3
	stc
LB_2861:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2859:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2864
	btr r12,4
	clc
	jmp LB_2865
LB_2864:
	bts r12,4
	stc
LB_2865:
	mov r14,r10
	bt r12,4
	jc LB_2862
	btr r12,1
	jmp LB_2863
LB_2862:
	bts r12,1
LB_2863:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2868
	btr r12,4
	clc
	jmp LB_2869
LB_2868:
	bts r12,4
	stc
LB_2869:
	mov r8,r10
	bt r12,4
	jc LB_2866
	btr r12,2
	jmp LB_2867
LB_2866:
	bts r12,2
LB_2867:
	mov rdi,r9
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
; _f2019 %_2014 ⊢ %_2015 : %_2015
 ; {>  %_2014~2':_p1492 %_2013~1':_p1493 }
; _f2019 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2874
	btr r12,0
	jmp LB_2875
LB_2874:
	bts r12,0
LB_2875:
	call NS_E_2019
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2872
	btr r12,1
	clc
	jmp LB_2873
LB_2872:
	bts r12,1
	stc
LB_2873:
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
; ∎ %_2017
 ; {>  %_2016~0':_stg %_2017~2':_stg %_2013~1':_p1493 }
; 	∎ 2'
	bt r12,0
	jc LB_2876
	mov rdi,r13
	call dlt
LB_2876:
	bt r12,1
	jc LB_2877
	mov rdi,r14
	call dlt
LB_2877:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2878
	btr r12,0
	jmp LB_2879
LB_2878:
	bts r12,0
LB_2879:
	ret
MTC_LB_2858:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2880
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
	jnc LB_2881
	bt QWORD [rdi],0
	jc LB_2882
	btr r12,1
	clc
	jmp LB_2883
LB_2882:
	bts r12,1
	stc
LB_2883:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2881:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2884:
	cmp r15,0
	jz LB_2885
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2884
LB_2885:
; 	» "" _ ⊢ 0' : %_2018
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2018
 ; {>  %_2018~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2880:
NS_E_2011:
; 	|» { 0' 1' }
NS_E_RDI_2011:
MTC_LB_2886:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2887
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
	jnc LB_2888
	bt QWORD [rdi],0
	jc LB_2889
	btr r12,3
	clc
	jmp LB_2890
LB_2889:
	bts r12,3
	stc
LB_2890:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2888:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2891
	btr r12,2
	jmp LB_2892
LB_2891:
	bts r12,2
LB_2892:
LB_2893:
	cmp r15,0
	jz LB_2894
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2893
LB_2894:
; _f2019 %_2000 ⊢ %_2001 : %_2001
 ; {>  %_2000~2':_p1492 %_1998~0':t1157'(-1) }
; _f2019 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2897
	btr r12,0
	jmp LB_2898
LB_2897:
	bts r12,0
LB_2898:
	call NS_E_2019
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2899
	btr r12,1
	jmp LB_2900
LB_2899:
	bts r12,1
LB_2900:
; pop_iv
	mov rax,QWORD [rsp]
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
; ∎ { %_1998 %_2003 }
 ; {>  %_2003~2':_stg %_1998~0':t1157'(-1) %_2002~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2901
	mov rdi,r14
	call dlt
LB_2901:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2902
	btr r12,1
	jmp LB_2903
LB_2902:
	bts r12,1
LB_2903:
	ret
MTC_LB_2887:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2904
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
	jnc LB_2905
	bt QWORD [rdi],0
	jc LB_2906
	btr r12,4
	clc
	jmp LB_2907
LB_2906:
	bts r12,4
	stc
LB_2907:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2905:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2910
	btr r12,5
	clc
	jmp LB_2911
LB_2910:
	bts r12,5
	stc
LB_2911:
	mov r8,r11
	bt r12,5
	jc LB_2908
	btr r12,2
	jmp LB_2909
LB_2908:
	bts r12,2
LB_2909:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2914
	btr r12,5
	clc
	jmp LB_2915
LB_2914:
	bts r12,5
	stc
LB_2915:
	mov r9,r11
	bt r12,5
	jc LB_2912
	btr r12,3
	jmp LB_2913
LB_2912:
	bts r12,3
LB_2913:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2916:
	cmp r15,0
	jz LB_2917
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2916
LB_2917:
; _f2011 { %_1998 %_2005 } ⊢ { %_2006 %_2007 } : { %_2006 %_2007 }
 ; {>  %_2004~2':_p1493 %_2005~3':_p1491 %_1998~0':t1157'(-1) }
; _f2011 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2920
	btr r12,1
	jmp LB_2921
LB_2920:
	bts r12,1
LB_2921:
	call NS_E_2011
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2918
	btr r12,2
	clc
	jmp LB_2919
LB_2918:
	bts r12,2
	stc
LB_2919:
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
; ∎ { %_2006 %_2009 }
 ; {>  %_2009~3':_stg %_2004~2':_p1493 %_2008~1':_stg %_2006~0':t1157'(-1) }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2922
	mov rdi,r8
	call dlt
LB_2922:
	bt r12,1
	jc LB_2923
	mov rdi,r14
	call dlt
LB_2923:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2924
	btr r12,1
	jmp LB_2925
LB_2924:
	bts r12,1
LB_2925:
	ret
MTC_LB_2904:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2926
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
	jnc LB_2927
	bt QWORD [rdi],0
	jc LB_2928
	btr r12,2
	clc
	jmp LB_2929
LB_2928:
	bts r12,2
	stc
LB_2929:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2927:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2930:
	cmp r15,0
	jz LB_2931
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2930
LB_2931:
; 	» "" _ ⊢ 1' : %_2010
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1998 %_2010 }
 ; {>  %_2010~1':_stg %_1998~0':t1157'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2926:
NS_E_1997:
; 	|» { 0' 1' }
NS_E_RDI_1997:
MTC_LB_2932:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2933
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
	jnc LB_2934
	bt QWORD [rdi],0
	jc LB_2935
	btr r12,8
	clc
	jmp LB_2936
LB_2935:
	bts r12,8
	stc
LB_2936:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2934:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_2939
	btr r12,9
	clc
	jmp LB_2940
LB_2939:
	bts r12,9
	stc
LB_2940:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2937
	btr r12,2
	jmp LB_2938
LB_2937:
	bts r12,2
LB_2938:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_2943
	btr r12,9
	clc
	jmp LB_2944
LB_2943:
	bts r12,9
	stc
LB_2944:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2941
	btr r12,3
	jmp LB_2942
LB_2941:
	bts r12,3
LB_2942:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_2947
	btr r12,9
	clc
	jmp LB_2948
LB_2947:
	bts r12,9
	stc
LB_2948:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2945
	btr r12,4
	jmp LB_2946
LB_2945:
	bts r12,4
LB_2946:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_2951
	btr r12,9
	clc
	jmp LB_2952
LB_2951:
	bts r12,9
	stc
LB_2952:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2949
	btr r12,5
	jmp LB_2950
LB_2949:
	bts r12,5
LB_2950:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_2955
	btr r12,9
	clc
	jmp LB_2956
LB_2955:
	bts r12,9
	stc
LB_2956:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2953
	btr r12,6
	jmp LB_2954
LB_2953:
	bts r12,6
LB_2954:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_2959
	btr r12,9
	clc
	jmp LB_2960
LB_2959:
	bts r12,9
	stc
LB_2960:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2957
	btr r12,7
	jmp LB_2958
LB_2957:
	bts r12,7
LB_2958:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2961:
	cmp r15,0
	jz LB_2962
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2961
LB_2962:
; _f1650 %_1965 ⊢ %_1971 : %_1971
 ; {>  %_1969~6':(_opn)◂(_p1489) %_1966~3':_p1502 %_1970~7':_p1489 %_1967~4':_p1490 %_1968~5':_p1491 %_1965~2':_p1499 %_1963~0':_r64 }
; _f1650 2' ⊢ 1'
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
	jc LB_2975
	btr r12,0
	jmp LB_2976
LB_2975:
	bts r12,0
LB_2976:
	call NS_E_1650
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2977
	btr r12,1
	jmp LB_2978
LB_2977:
	bts r12,1
LB_2978:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_2973
	btr r12,7
	clc
	jmp LB_2974
LB_2973:
	bts r12,7
	stc
LB_2974:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_2971
	btr r12,6
	clc
	jmp LB_2972
LB_2971:
	bts r12,6
	stc
LB_2972:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2969
	btr r12,5
	clc
	jmp LB_2970
LB_2969:
	bts r12,5
	stc
LB_2970:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2967
	btr r12,4
	clc
	jmp LB_2968
LB_2967:
	bts r12,4
	stc
LB_2968:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2965
	btr r12,3
	clc
	jmp LB_2966
LB_2965:
	bts r12,3
	stc
LB_2966:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2963
	btr r12,0
	clc
	jmp LB_2964
LB_2963:
	bts r12,0
	stc
LB_2964:
	add rsp,56
; _f56 %_1963 ⊢ %_1972 : %_1972
 ; {>  %_1969~6':(_opn)◂(_p1489) %_1971~1':_stg %_1966~3':_p1502 %_1970~7':_p1489 %_1967~4':_p1490 %_1968~5':_p1491 %_1963~0':_r64 }
	add r13,1
; _f2146 { %_1972 %_1966 } ⊢ { %_1973 %_1974 } : { %_1973 %_1974 }
 ; {>  %_1972~0':_r64 %_1969~6':(_opn)◂(_p1489) %_1971~1':_stg %_1966~3':_p1502 %_1970~7':_p1489 %_1967~4':_p1490 %_1968~5':_p1491 }
; _f2146 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_2989
	btr r12,1
	jmp LB_2990
LB_2989:
	bts r12,1
LB_2990:
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2991
	btr r12,2
	jmp LB_2992
LB_2991:
	bts r12,2
LB_2992:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_2987
	btr r12,7
	clc
	jmp LB_2988
LB_2987:
	bts r12,7
	stc
LB_2988:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_2985
	btr r12,6
	clc
	jmp LB_2986
LB_2985:
	bts r12,6
	stc
LB_2986:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_2983
	btr r12,5
	clc
	jmp LB_2984
LB_2983:
	bts r12,5
	stc
LB_2984:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_2981
	btr r12,4
	clc
	jmp LB_2982
LB_2981:
	bts r12,4
	stc
LB_2982:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2979
	btr r12,1
	clc
	jmp LB_2980
LB_2979:
	bts r12,1
	stc
LB_2980:
	add rsp,48
; _f55 %_1973 ⊢ %_1975 : %_1975
 ; {>  %_1974~2':_stg %_1969~6':(_opn)◂(_p1489) %_1971~1':_stg %_1970~7':_p1489 %_1967~4':_p1490 %_1968~5':_p1491 %_1973~0':_r64 }
	sub r13,1
; _f1997 { %_1975 %_1970 } ⊢ { %_1976 %_1977 } : { %_1976 %_1977 }
 ; {>  %_1974~2':_stg %_1969~6':(_opn)◂(_p1489) %_1971~1':_stg %_1970~7':_p1489 %_1975~0':_r64 %_1967~4':_p1490 %_1968~5':_p1491 }
; _f1997 { 0' 7' } ⊢ { 0' 3' }
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
	jc LB_3003
	btr r12,1
	jmp LB_3004
LB_3003:
	bts r12,1
LB_3004:
	call NS_E_1997
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3005
	btr r12,3
	jmp LB_3006
LB_3005:
	bts r12,3
LB_3006:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3001
	btr r12,6
	clc
	jmp LB_3002
LB_3001:
	bts r12,6
	stc
LB_3002:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2999
	btr r12,5
	clc
	jmp LB_3000
LB_2999:
	bts r12,5
	stc
LB_3000:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2997
	btr r12,4
	clc
	jmp LB_2998
LB_2997:
	bts r12,4
	stc
LB_2998:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2995
	btr r12,2
	clc
	jmp LB_2996
LB_2995:
	bts r12,2
	stc
LB_2996:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2993
	btr r12,1
	clc
	jmp LB_2994
LB_2993:
	bts r12,1
	stc
LB_2994:
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
LB_3007:
	cmp rax,0
	jz LB_3008
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3007
LB_3008:
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
; ∎ { %_1978 %_1982 }
 ; {>  %_1981~3':_stg %_1969~6':(_opn)◂(_p1489) %_1982~7':_stg %_1979~1':_stg %_1967~4':_p1490 %_1968~5':_p1491 %_1978~0':_r64 %_1980~2':_stg }
; 	∎ { 0' 7' }
	bt r12,3
	jc LB_3009
	mov rdi,r9
	call dlt
LB_3009:
	bt r12,6
	jc LB_3010
	mov rdi,rcx
	call dlt
LB_3010:
	bt r12,1
	jc LB_3011
	mov rdi,r14
	call dlt
LB_3011:
	bt r12,4
	jc LB_3012
	mov rdi,r10
	call dlt
LB_3012:
	bt r12,5
	jc LB_3013
	mov rdi,r11
	call dlt
LB_3013:
	bt r12,2
	jc LB_3014
	mov rdi,r8
	call dlt
LB_3014:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_3015
	btr r12,1
	jmp LB_3016
LB_3015:
	bts r12,1
LB_3016:
	ret
MTC_LB_2933:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3017
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
	jnc LB_3018
	bt QWORD [rdi],0
	jc LB_3019
	btr r12,7
	clc
	jmp LB_3020
LB_3019:
	bts r12,7
	stc
LB_3020:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3018:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3023
	btr r12,8
	clc
	jmp LB_3024
LB_3023:
	bts r12,8
	stc
LB_3024:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3021
	btr r12,2
	jmp LB_3022
LB_3021:
	bts r12,2
LB_3022:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3027
	btr r12,8
	clc
	jmp LB_3028
LB_3027:
	bts r12,8
	stc
LB_3028:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3025
	btr r12,3
	jmp LB_3026
LB_3025:
	bts r12,3
LB_3026:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3031
	btr r12,8
	clc
	jmp LB_3032
LB_3031:
	bts r12,8
	stc
LB_3032:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3029
	btr r12,4
	jmp LB_3030
LB_3029:
	bts r12,4
LB_3030:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3035
	btr r12,8
	clc
	jmp LB_3036
LB_3035:
	bts r12,8
	stc
LB_3036:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3033
	btr r12,5
	jmp LB_3034
LB_3033:
	bts r12,5
LB_3034:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3039
	btr r12,8
	clc
	jmp LB_3040
LB_3039:
	bts r12,8
	stc
LB_3040:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3037
	btr r12,6
	jmp LB_3038
LB_3037:
	bts r12,6
LB_3038:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3041:
	cmp r15,0
	jz LB_3042
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3041
LB_3042:
; _f1650 %_1983 ⊢ %_1988 : %_1988
 ; {>  %_1986~5':_p1491 %_1984~3':_p1502 %_1983~2':_p1499 %_1987~6':(_opn)◂(_p1489) %_1963~0':_r64 %_1985~4':_p1490 }
; _f1650 2' ⊢ 1'
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
	jc LB_3053
	btr r12,0
	jmp LB_3054
LB_3053:
	bts r12,0
LB_3054:
	call NS_E_1650
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3055
	btr r12,1
	jmp LB_3056
LB_3055:
	bts r12,1
LB_3056:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_3051
	btr r12,6
	clc
	jmp LB_3052
LB_3051:
	bts r12,6
	stc
LB_3052:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3049
	btr r12,5
	clc
	jmp LB_3050
LB_3049:
	bts r12,5
	stc
LB_3050:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3047
	btr r12,4
	clc
	jmp LB_3048
LB_3047:
	bts r12,4
	stc
LB_3048:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3045
	btr r12,3
	clc
	jmp LB_3046
LB_3045:
	bts r12,3
	stc
LB_3046:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3043
	btr r12,0
	clc
	jmp LB_3044
LB_3043:
	bts r12,0
	stc
LB_3044:
	add rsp,48
; _f56 %_1963 ⊢ %_1989 : %_1989
 ; {>  %_1986~5':_p1491 %_1984~3':_p1502 %_1988~1':_stg %_1987~6':(_opn)◂(_p1489) %_1963~0':_r64 %_1985~4':_p1490 }
	add r13,1
; _f2146 { %_1989 %_1984 } ⊢ { %_1990 %_1991 } : { %_1990 %_1991 }
 ; {>  %_1986~5':_p1491 %_1984~3':_p1502 %_1989~0':_r64 %_1988~1':_stg %_1987~6':(_opn)◂(_p1489) %_1985~4':_p1490 }
; _f2146 { 0' 3' } ⊢ { 0' 2' }
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
	jc LB_3065
	btr r12,1
	jmp LB_3066
LB_3065:
	bts r12,1
LB_3066:
	call NS_E_2146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3067
	btr r12,2
	jmp LB_3068
LB_3067:
	bts r12,2
LB_3068:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_3063
	btr r12,6
	clc
	jmp LB_3064
LB_3063:
	bts r12,6
	stc
LB_3064:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_3061
	btr r12,5
	clc
	jmp LB_3062
LB_3061:
	bts r12,5
	stc
LB_3062:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3059
	btr r12,4
	clc
	jmp LB_3060
LB_3059:
	bts r12,4
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
	add rsp,40
; _f55 %_1990 ⊢ %_1992 : %_1992
 ; {>  %_1991~2':_stg %_1986~5':_p1491 %_1990~0':_r64 %_1988~1':_stg %_1987~6':(_opn)◂(_p1489) %_1985~4':_p1490 }
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
LB_3069:
	cmp rax,0
	jz LB_3070
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3069
LB_3070:
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
; ∎ { %_1993 %_1996 }
 ; {>  %_1993~0':_r64 %_1986~5':_p1491 %_1994~1':_stg %_1995~2':_stg %_1987~6':(_opn)◂(_p1489) %_1996~3':_stg %_1985~4':_p1490 }
; 	∎ { 0' 3' }
	bt r12,5
	jc LB_3071
	mov rdi,r11
	call dlt
LB_3071:
	bt r12,1
	jc LB_3072
	mov rdi,r14
	call dlt
LB_3072:
	bt r12,2
	jc LB_3073
	mov rdi,r8
	call dlt
LB_3073:
	bt r12,6
	jc LB_3074
	mov rdi,rcx
	call dlt
LB_3074:
	bt r12,4
	jc LB_3075
	mov rdi,r10
	call dlt
LB_3075:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3076
	btr r12,1
	jmp LB_3077
LB_3076:
	bts r12,1
LB_3077:
	ret
MTC_LB_3017:
NS_E_1962:
; 	|» { 0' 1' }
NS_E_RDI_1962:
MTC_LB_3078:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3079
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
	jnc LB_3080
	bt QWORD [rdi],0
	jc LB_3081
	btr r12,7
	clc
	jmp LB_3082
LB_3081:
	bts r12,7
	stc
LB_3082:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3080:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3085
	btr r12,8
	clc
	jmp LB_3086
LB_3085:
	bts r12,8
	stc
LB_3086:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3083
	btr r12,2
	jmp LB_3084
LB_3083:
	bts r12,2
LB_3084:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3089
	btr r12,8
	clc
	jmp LB_3090
LB_3089:
	bts r12,8
	stc
LB_3090:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3087
	btr r12,3
	jmp LB_3088
LB_3087:
	bts r12,3
LB_3088:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_3093
	btr r12,8
	clc
	jmp LB_3094
LB_3093:
	bts r12,8
	stc
LB_3094:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3091
	btr r12,4
	jmp LB_3092
LB_3091:
	bts r12,4
LB_3092:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_3097
	btr r12,8
	clc
	jmp LB_3098
LB_3097:
	bts r12,8
	stc
LB_3098:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3095
	btr r12,5
	jmp LB_3096
LB_3095:
	bts r12,5
LB_3096:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_3101
	btr r12,8
	clc
	jmp LB_3102
LB_3101:
	bts r12,8
	stc
LB_3102:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3099
	btr r12,6
	jmp LB_3100
LB_3099:
	bts r12,6
LB_3100:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3103:
	cmp r15,0
	jz LB_3104
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3103
LB_3104:
; _f1962 { %_1944 %_1950 } ⊢ { %_1951 %_1952 } : { %_1951 %_1952 }
 ; {>  %_1949~5':(_opn)◂(_p1488) %_1946~2':(_opn)◂(_stg) %_1950~6':_p1488 %_1944~0':_r64 %_1947~3':_p1490 %_1948~4':_p1491 }
; _f1962 { 0' 6' } ⊢ { 0' 1' }
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
	jc LB_3113
	btr r12,1
	jmp LB_3114
LB_3113:
	bts r12,1
LB_3114:
	call NS_E_1962
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3111
	btr r12,5
	clc
	jmp LB_3112
LB_3111:
	bts r12,5
	stc
LB_3112:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3109
	btr r12,4
	clc
	jmp LB_3110
LB_3109:
	bts r12,4
	stc
LB_3110:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3107
	btr r12,3
	clc
	jmp LB_3108
LB_3107:
	bts r12,3
	stc
LB_3108:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3105
	btr r12,2
	clc
	jmp LB_3106
LB_3105:
	bts r12,2
	stc
LB_3106:
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
LB_3115:
	cmp rax,0
	jz LB_3116
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3115
LB_3116:
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
; ∎ { %_1953 %_1955 }
 ; {>  %_1949~5':(_opn)◂(_p1488) %_1946~2':(_opn)◂(_stg) %_1954~1':_stg %_1955~6':_stg %_1953~0':_r64 %_1947~3':_p1490 %_1948~4':_p1491 }
; 	∎ { 0' 6' }
	bt r12,5
	jc LB_3117
	mov rdi,r11
	call dlt
LB_3117:
	bt r12,2
	jc LB_3118
	mov rdi,r8
	call dlt
LB_3118:
	bt r12,1
	jc LB_3119
	mov rdi,r14
	call dlt
LB_3119:
	bt r12,3
	jc LB_3120
	mov rdi,r9
	call dlt
LB_3120:
	bt r12,4
	jc LB_3121
	mov rdi,r10
	call dlt
LB_3121:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_3122
	btr r12,1
	jmp LB_3123
LB_3122:
	bts r12,1
LB_3123:
	ret
MTC_LB_3079:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3124
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
	jnc LB_3125
	bt QWORD [rdi],0
	jc LB_3126
	btr r12,6
	clc
	jmp LB_3127
LB_3126:
	bts r12,6
	stc
LB_3127:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3125:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_3130
	btr r12,7
	clc
	jmp LB_3131
LB_3130:
	bts r12,7
	stc
LB_3131:
	mov r8,rdx
	bt r12,7
	jc LB_3128
	btr r12,2
	jmp LB_3129
LB_3128:
	bts r12,2
LB_3129:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_3134
	btr r12,7
	clc
	jmp LB_3135
LB_3134:
	bts r12,7
	stc
LB_3135:
	mov r9,rdx
	bt r12,7
	jc LB_3132
	btr r12,3
	jmp LB_3133
LB_3132:
	bts r12,3
LB_3133:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_3138
	btr r12,7
	clc
	jmp LB_3139
LB_3138:
	bts r12,7
	stc
LB_3139:
	mov r10,rdx
	bt r12,7
	jc LB_3136
	btr r12,4
	jmp LB_3137
LB_3136:
	bts r12,4
LB_3137:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_3142
	btr r12,7
	clc
	jmp LB_3143
LB_3142:
	bts r12,7
	stc
LB_3143:
	mov r11,rdx
	bt r12,7
	jc LB_3140
	btr r12,5
	jmp LB_3141
LB_3140:
	bts r12,5
LB_3141:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3144:
	cmp r15,0
	jz LB_3145
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3144
LB_3145:
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
LB_3146:
	cmp rax,0
	jz LB_3147
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3146
LB_3147:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_1960 %_1961 }
 ; {>  %_1957~3':_p1490 %_1958~4':_p1491 %_1959~5':(_opn)◂(_p1488) %_1961~1':_stg %_1956~2':(_opn)◂(_stg) %_1960~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_3148
	mov rdi,r9
	call dlt
LB_3148:
	bt r12,4
	jc LB_3149
	mov rdi,r10
	call dlt
LB_3149:
	bt r12,5
	jc LB_3150
	mov rdi,r11
	call dlt
LB_3150:
	bt r12,2
	jc LB_3151
	mov rdi,r8
	call dlt
LB_3151:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3124:
NS_E_1943:
; 	|» { 0' 1' }
NS_E_RDI_1943:
MTC_LB_3152:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3153
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
	jnc LB_3154
	bt QWORD [rdi],0
	jc LB_3155
	btr r12,3
	clc
	jmp LB_3156
LB_3155:
	bts r12,3
	stc
LB_3156:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3154:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3157
	btr r12,2
	jmp LB_3158
LB_3157:
	bts r12,2
LB_3158:
LB_3159:
	cmp r15,0
	jz LB_3160
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3159
LB_3160:
; _f1962 { %_1935 %_1937 } ⊢ { %_1938 %_1939 } : { %_1938 %_1939 }
 ; {>  %_1935~0':_r64 %_1937~2':_p1488 }
; _f1962 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3161
	btr r12,1
	jmp LB_3162
LB_3161:
	bts r12,1
LB_3162:
	call NS_E_1962
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1938 %_1939 }
 ; {>  %_1938~0':_r64 %_1939~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3153:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3163
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
	jnc LB_3164
	bt QWORD [rdi],0
	jc LB_3165
	btr r12,3
	clc
	jmp LB_3166
LB_3165:
	bts r12,3
	stc
LB_3166:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3164:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3167
	btr r12,2
	jmp LB_3168
LB_3167:
	bts r12,2
LB_3168:
LB_3169:
	cmp r15,0
	jz LB_3170
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3169
LB_3170:
; _f1997 { %_1935 %_1940 } ⊢ { %_1941 %_1942 } : { %_1941 %_1942 }
 ; {>  %_1935~0':_r64 %_1940~2':_p1489 }
; _f1997 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3171
	btr r12,1
	jmp LB_3172
LB_3171:
	bts r12,1
LB_3172:
	call NS_E_1997
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1941 %_1942 }
 ; {>  %_1942~1':_stg %_1941~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3163:
NS_E_1934:
; 	|» { 0' 1' }
NS_E_RDI_1934:
MTC_LB_3173:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3174
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
	jnc LB_3175
	bt QWORD [rdi],0
	jc LB_3176
	btr r12,5
	clc
	jmp LB_3177
LB_3176:
	bts r12,5
	stc
LB_3177:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3175:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3186
	btr r12,6
	clc
	jmp LB_3187
LB_3186:
	bts r12,6
	stc
LB_3187:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3180
	btr r12,4
	clc
	jmp LB_3181
LB_3180:
	bts r12,4
	stc
LB_3181:
	mov r8,r10
	bt r12,4
	jc LB_3178
	btr r12,2
	jmp LB_3179
LB_3178:
	bts r12,2
LB_3179:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3184
	btr r12,4
	clc
	jmp LB_3185
LB_3184:
	bts r12,4
	stc
LB_3185:
	mov r9,r10
	bt r12,4
	jc LB_3182
	btr r12,3
	jmp LB_3183
LB_3182:
	bts r12,3
LB_3183:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3190
	btr r12,6
	clc
	jmp LB_3191
LB_3190:
	bts r12,6
	stc
LB_3191:
	mov r10,rcx
	bt r12,6
	jc LB_3188
	btr r12,4
	jmp LB_3189
LB_3188:
	bts r12,4
LB_3189:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3192:
	cmp r15,0
	jz LB_3193
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3192
LB_3193:
; _f56 %_1917 ⊢ %_1922 : %_1922
 ; {>  %_1917~0':_r64 %_1921~4':(_lst)◂({ _stg _p1487 }) %_1919~2':_stg %_1920~3':_p1487 }
	add r13,1
; _f1943 { %_1922 %_1920 } ⊢ { %_1923 %_1924 } : { %_1923 %_1924 }
 ; {>  %_1921~4':(_lst)◂({ _stg _p1487 }) %_1919~2':_stg %_1922~0':_r64 %_1920~3':_p1487 }
; _f1943 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3198
	btr r12,1
	jmp LB_3199
LB_3198:
	bts r12,1
LB_3199:
	call NS_E_1943
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3196
	btr r12,4
	clc
	jmp LB_3197
LB_3196:
	bts r12,4
	stc
LB_3197:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3194
	btr r12,2
	clc
	jmp LB_3195
LB_3194:
	bts r12,2
	stc
LB_3195:
	add rsp,24
; _f55 %_1923 ⊢ %_1925 : %_1925
 ; {>  %_1921~4':(_lst)◂({ _stg _p1487 }) %_1919~2':_stg %_1923~0':_r64 %_1924~1':_stg }
	sub r13,1
; _f1934 { %_1925 %_1921 } ⊢ { %_1926 %_1927 } : { %_1926 %_1927 }
 ; {>  %_1921~4':(_lst)◂({ _stg _p1487 }) %_1919~2':_stg %_1925~0':_r64 %_1924~1':_stg }
; _f1934 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3204
	btr r12,1
	jmp LB_3205
LB_3204:
	bts r12,1
LB_3205:
	call NS_E_1934
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3206
	btr r12,3
	jmp LB_3207
LB_3206:
	bts r12,3
LB_3207:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3202
	btr r12,2
	clc
	jmp LB_3203
LB_3202:
	bts r12,2
	stc
LB_3203:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3200
	btr r12,1
	clc
	jmp LB_3201
LB_3200:
	bts r12,1
	stc
LB_3201:
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
LB_3208:
	cmp rax,0
	jz LB_3209
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3208
LB_3209:
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
; ∎ { %_1928 %_1932 }
 ; {>  %_1928~0':_r64 %_1931~3':_stg %_1932~4':_stg %_1929~2':_stg %_1930~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_3210
	mov rdi,r9
	call dlt
LB_3210:
	bt r12,2
	jc LB_3211
	mov rdi,r8
	call dlt
LB_3211:
	bt r12,1
	jc LB_3212
	mov rdi,r14
	call dlt
LB_3212:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3213
	btr r12,1
	jmp LB_3214
LB_3213:
	bts r12,1
LB_3214:
	ret
MTC_LB_3174:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3215
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
	jnc LB_3216
	bt QWORD [rdi],0
	jc LB_3217
	btr r12,2
	clc
	jmp LB_3218
LB_3217:
	bts r12,2
	stc
LB_3218:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3216:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3219:
	cmp r15,0
	jz LB_3220
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3219
LB_3220:
; 	» "" _ ⊢ 1' : %_1933
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1917 %_1933 }
 ; {>  %_1917~0':_r64 %_1933~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3215:
NS_E_1916:
; 	|» { 0' 1' }
NS_E_RDI_1916:
MTC_LB_3221:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3222
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
	jnc LB_3223
	bt QWORD [rdi],0
	jc LB_3224
	btr r12,5
	clc
	jmp LB_3225
LB_3224:
	bts r12,5
	stc
LB_3225:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3223:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3234
	btr r12,6
	clc
	jmp LB_3235
LB_3234:
	bts r12,6
	stc
LB_3235:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3228
	btr r12,4
	clc
	jmp LB_3229
LB_3228:
	bts r12,4
	stc
LB_3229:
	mov r8,r10
	bt r12,4
	jc LB_3226
	btr r12,2
	jmp LB_3227
LB_3226:
	bts r12,2
LB_3227:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3232
	btr r12,4
	clc
	jmp LB_3233
LB_3232:
	bts r12,4
	stc
LB_3233:
	mov r9,r10
	bt r12,4
	jc LB_3230
	btr r12,3
	jmp LB_3231
LB_3230:
	bts r12,3
LB_3231:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3238
	btr r12,6
	clc
	jmp LB_3239
LB_3238:
	bts r12,6
	stc
LB_3239:
	mov r10,rcx
	bt r12,6
	jc LB_3236
	btr r12,4
	jmp LB_3237
LB_3236:
	bts r12,4
LB_3237:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3240:
	cmp r15,0
	jz LB_3241
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3240
LB_3241:
; _f38 %_1892 ⊢ %_1897 : %_1897
 ; {>  %_1896~4':(_lst)◂({ _stg _p1486 }) %_1892~0':_r64 %_1895~3':_p1486 %_1894~2':_stg }
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
	jc LB_3246
	btr r12,4
	clc
	jmp LB_3247
LB_3246:
	bts r12,4
	stc
LB_3247:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3244
	btr r12,3
	clc
	jmp LB_3245
LB_3244:
	bts r12,3
	stc
LB_3245:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3242
	btr r12,2
	clc
	jmp LB_3243
LB_3242:
	bts r12,2
	stc
LB_3243:
	add rsp,32
; _f1916 { %_1897 %_1896 } ⊢ { %_1898 %_1899 } : { %_1898 %_1899 }
 ; {>  %_1896~4':(_lst)◂({ _stg _p1486 }) %_1897~0':_r64 %_1895~3':_p1486 %_1894~2':_stg }
; _f1916 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3252
	btr r12,1
	jmp LB_3253
LB_3252:
	bts r12,1
LB_3253:
	call NS_E_1916
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3250
	btr r12,3
	clc
	jmp LB_3251
LB_3250:
	bts r12,3
	stc
LB_3251:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3248
	btr r12,2
	clc
	jmp LB_3249
LB_3248:
	bts r12,2
	stc
LB_3249:
	add rsp,24
MTC_LB_3254:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3255
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
	jnc LB_3256
	bt QWORD [rdi],0
	jc LB_3257
	btr r12,5
	clc
	jmp LB_3258
LB_3257:
	bts r12,5
	stc
LB_3258:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3256:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_3259
	btr r12,4
	jmp LB_3260
LB_3259:
	bts r12,4
LB_3260:
LB_3261:
	cmp r15,0
	jz LB_3262
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3261
LB_3262:
; _f56 %_1898 ⊢ %_1901 : %_1901
 ; {>  %_1899~1':_stg %_1898~0':_r64 %_1900~4':(_lst)◂({ _stg _p1500 }) %_1894~2':_stg }
	add r13,1
; _f2048 { %_1901 %_1900 } ⊢ { %_1902 %_1903 } : { %_1902 %_1903 }
 ; {>  %_1899~1':_stg %_1900~4':(_lst)◂({ _stg _p1500 }) %_1894~2':_stg %_1901~0':_r64 }
; _f2048 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3267
	btr r12,1
	jmp LB_3268
LB_3267:
	bts r12,1
LB_3268:
	call NS_E_2048
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3269
	btr r12,3
	jmp LB_3270
LB_3269:
	bts r12,3
LB_3270:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3265
	btr r12,2
	clc
	jmp LB_3266
LB_3265:
	bts r12,2
	stc
LB_3266:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3263
	btr r12,1
	clc
	jmp LB_3264
LB_3263:
	bts r12,1
	stc
LB_3264:
	add rsp,24
; _f55 %_1902 ⊢ %_1904 : %_1904
 ; {>  %_1899~1':_stg %_1902~0':_r64 %_1903~3':_stg %_1894~2':_stg }
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
LB_3271:
	cmp rax,0
	jz LB_3272
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3271
LB_3272:
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
; ∎ { %_1905 %_1909 }
 ; {>  %_1909~4':_stg %_1908~1':_stg %_1907~3':_stg %_1906~2':_stg %_1905~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_3273
	mov rdi,r14
	call dlt
LB_3273:
	bt r12,3
	jc LB_3274
	mov rdi,r9
	call dlt
LB_3274:
	bt r12,2
	jc LB_3275
	mov rdi,r8
	call dlt
LB_3275:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3276
	btr r12,1
	jmp LB_3277
LB_3276:
	bts r12,1
LB_3277:
	ret
MTC_LB_3255:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3278
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
	jnc LB_3279
	bt QWORD [rdi],0
	jc LB_3280
	btr r12,5
	clc
	jmp LB_3281
LB_3280:
	bts r12,5
	stc
LB_3281:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3279:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_3282
	btr r12,4
	jmp LB_3283
LB_3282:
	bts r12,4
LB_3283:
LB_3284:
	cmp r15,0
	jz LB_3285
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3284
LB_3285:
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
LB_3286:
	cmp rax,0
	jz LB_3287
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3286
LB_3287:
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
; ∎ { %_1911 %_1914 }
 ; {>  %_1913~1':_stg %_1910~4':_p1500 %_1912~2':_stg %_1911~0':_r64 %_1914~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3288
	mov rdi,r14
	call dlt
LB_3288:
	bt r12,4
	jc LB_3289
	mov rdi,r10
	call dlt
LB_3289:
	bt r12,2
	jc LB_3290
	mov rdi,r8
	call dlt
LB_3290:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3291
	btr r12,1
	jmp LB_3292
LB_3291:
	bts r12,1
LB_3292:
	ret
MTC_LB_3278:
MTC_LB_3222:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3293
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
	jnc LB_3294
	bt QWORD [rdi],0
	jc LB_3295
	btr r12,2
	clc
	jmp LB_3296
LB_3295:
	bts r12,2
	stc
LB_3296:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3294:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
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
; 	» "" _ ⊢ 1' : %_1915
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1892 %_1915 }
 ; {>  %_1915~1':_stg %_1892~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3293:
NS_E_1891:
; 	|» { 0' 1' }
NS_E_RDI_1891:
MTC_LB_3299:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3300
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
	jnc LB_3301
	bt QWORD [rdi],0
	jc LB_3302
	btr r12,4
	clc
	jmp LB_3303
LB_3302:
	bts r12,4
	stc
LB_3303:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3301:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3306
	btr r12,5
	clc
	jmp LB_3307
LB_3306:
	bts r12,5
	stc
LB_3307:
	mov r8,r11
	bt r12,5
	jc LB_3304
	btr r12,2
	jmp LB_3305
LB_3304:
	bts r12,2
LB_3305:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3310
	btr r12,5
	clc
	jmp LB_3311
LB_3310:
	bts r12,5
	stc
LB_3311:
	mov r9,r11
	bt r12,5
	jc LB_3308
	btr r12,3
	jmp LB_3309
LB_3308:
	bts r12,3
LB_3309:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3312:
	cmp r15,0
	jz LB_3313
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3312
LB_3313:
MTC_LB_3314:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3315
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
	jnc LB_3316
	bt QWORD [rdi],0
	jc LB_3317
	btr r12,4
	clc
	jmp LB_3318
LB_3317:
	bts r12,4
	stc
LB_3318:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3316:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3319
	btr r12,1
	jmp LB_3320
LB_3319:
	bts r12,1
LB_3320:
LB_3321:
	cmp r15,0
	jz LB_3322
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3321
LB_3322:
; _f56 %_1823 ⊢ %_1828 : %_1828
 ; {>  %_1825~2':_stg %_1823~0':_r64 %_1827~1':(_lst)◂(_p1483) }
	add r13,1
; _f1822 { %_1828 %_1827 } ⊢ { %_1829 %_1830 } : { %_1829 %_1830 }
 ; {>  %_1825~2':_stg %_1827~1':(_lst)◂(_p1483) %_1828~0':_r64 }
; _f1822 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1822
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3323
	btr r12,2
	clc
	jmp LB_3324
LB_3323:
	bts r12,2
	stc
LB_3324:
	add rsp,16
; _f55 %_1829 ⊢ %_1831 : %_1831
 ; {>  %_1829~0':_r64 %_1825~2':_stg %_1830~1':_stg }
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
LB_3325:
	cmp rax,0
	jz LB_3326
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3325
LB_3326:
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
LB_3327:
	cmp rax,0
	jz LB_3328
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3327
LB_3328:
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
; ∎ { %_1832 %_1835 }
 ; {>  %_1832~0':_r64 %_1835~3':_stg %_1833~2':_stg %_1834~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3329
	mov rdi,r8
	call dlt
LB_3329:
	bt r12,1
	jc LB_3330
	mov rdi,r14
	call dlt
LB_3330:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3331
	btr r12,1
	jmp LB_3332
LB_3331:
	bts r12,1
LB_3332:
	ret
MTC_LB_3315:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3333
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
	jnc LB_3334
	bt QWORD [rdi],0
	jc LB_3335
	btr r12,4
	clc
	jmp LB_3336
LB_3335:
	bts r12,4
	stc
LB_3336:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3334:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3337
	btr r12,1
	jmp LB_3338
LB_3337:
	bts r12,1
LB_3338:
LB_3339:
	cmp r15,0
	jz LB_3340
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3339
LB_3340:
; _f1446 %_1836 ⊢ %_1837 : %_1837
 ; {>  %_1836~1':_p1435 %_1825~2':_stg %_1823~0':_r64 }
; _f1446 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3345
	btr r12,0
	jmp LB_3346
LB_3345:
	bts r12,0
LB_3346:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3347
	btr r12,1
	jmp LB_3348
LB_3347:
	bts r12,1
LB_3348:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3343
	btr r12,2
	clc
	jmp LB_3344
LB_3343:
	bts r12,2
	stc
LB_3344:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3341
	btr r12,0
	clc
	jmp LB_3342
LB_3341:
	bts r12,0
	stc
LB_3342:
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
LB_3349:
	cmp rax,0
	jz LB_3350
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3349
LB_3350:
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
; ∎ { %_1838 %_1841 }
 ; {>  %_1841~3':_stg %_1838~0':_r64 %_1840~1':_stg %_1839~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3351
	mov rdi,r14
	call dlt
LB_3351:
	bt r12,2
	jc LB_3352
	mov rdi,r8
	call dlt
LB_3352:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3353
	btr r12,1
	jmp LB_3354
LB_3353:
	bts r12,1
LB_3354:
	ret
MTC_LB_3333:
MTC_LB_3300:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3355
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
	jnc LB_3356
	bt QWORD [rdi],0
	jc LB_3357
	btr r12,3
	clc
	jmp LB_3358
LB_3357:
	bts r12,3
	stc
LB_3358:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3356:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3359
	btr r12,2
	jmp LB_3360
LB_3359:
	bts r12,2
LB_3360:
LB_3361:
	cmp r15,0
	jz LB_3362
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3361
LB_3362:
; _f56 %_1823 ⊢ %_1843 : %_1843
 ; {>  %_1823~0':_r64 %_1842~2':(_lst)◂({ _stg _p1487 }) }
	add r13,1
; _f1934 { %_1843 %_1842 } ⊢ { %_1844 %_1845 } : { %_1844 %_1845 }
 ; {>  %_1843~0':_r64 %_1842~2':(_lst)◂({ _stg _p1487 }) }
; _f1934 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3363
	btr r12,1
	jmp LB_3364
LB_3363:
	bts r12,1
LB_3364:
	call NS_E_1934
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1844 ⊢ %_1846 : %_1846
 ; {>  %_1845~1':_stg %_1844~0':_r64 }
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
LB_3365:
	cmp rax,0
	jz LB_3366
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3365
LB_3366:
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
; ∎ { %_1847 %_1849 }
 ; {>  %_1849~2':_stg %_1847~0':_r64 %_1848~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3367
	mov rdi,r14
	call dlt
LB_3367:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3368
	btr r12,1
	jmp LB_3369
LB_3368:
	bts r12,1
LB_3369:
	ret
MTC_LB_3355:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3370
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
	jnc LB_3371
	bt QWORD [rdi],0
	jc LB_3372
	btr r12,4
	clc
	jmp LB_3373
LB_3372:
	bts r12,4
	stc
LB_3373:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3371:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3376
	btr r12,5
	clc
	jmp LB_3377
LB_3376:
	bts r12,5
	stc
LB_3377:
	mov r8,r11
	bt r12,5
	jc LB_3374
	btr r12,2
	jmp LB_3375
LB_3374:
	bts r12,2
LB_3375:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3380
	btr r12,5
	clc
	jmp LB_3381
LB_3380:
	bts r12,5
	stc
LB_3381:
	mov r9,r11
	bt r12,5
	jc LB_3378
	btr r12,3
	jmp LB_3379
LB_3378:
	bts r12,3
LB_3379:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3382:
	cmp r15,0
	jz LB_3383
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3382
LB_3383:
; _f56 %_1823 ⊢ %_1852 : %_1852
 ; {>  %_1823~0':_r64 %_1850~2':_stg %_1851~3':_p1485 }
	add r13,1
; _f2107 { %_1852 %_1851 } ⊢ { %_1853 %_1854 } : { %_1853 %_1854 }
 ; {>  %_1850~2':_stg %_1852~0':_r64 %_1851~3':_p1485 }
; _f2107 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3386
	btr r12,1
	jmp LB_3387
LB_3386:
	bts r12,1
LB_3387:
	call NS_E_2107
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3384
	btr r12,2
	clc
	jmp LB_3385
LB_3384:
	bts r12,2
	stc
LB_3385:
	add rsp,16
; _f55 %_1853 ⊢ %_1855 : %_1855
 ; {>  %_1854~1':_stg %_1853~0':_r64 %_1850~2':_stg }
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
LB_3388:
	cmp rax,0
	jz LB_3389
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3388
LB_3389:
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
; ∎ { %_1856 %_1859 }
 ; {>  %_1859~3':_stg %_1858~1':_stg %_1856~0':_r64 %_1857~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3390
	mov rdi,r14
	call dlt
LB_3390:
	bt r12,2
	jc LB_3391
	mov rdi,r8
	call dlt
LB_3391:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3392
	btr r12,1
	jmp LB_3393
LB_3392:
	bts r12,1
LB_3393:
	ret
MTC_LB_3370:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_3394
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
	jnc LB_3395
	bt QWORD [rdi],0
	jc LB_3396
	btr r12,3
	clc
	jmp LB_3397
LB_3396:
	bts r12,3
	stc
LB_3397:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3395:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3398
	btr r12,2
	jmp LB_3399
LB_3398:
	bts r12,2
LB_3399:
LB_3400:
	cmp r15,0
	jz LB_3401
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3400
LB_3401:
; _f56 %_1823 ⊢ %_1861 : %_1861
 ; {>  %_1823~0':_r64 %_1860~2':(_lst)◂({ _stg _p1499 _p1502 }) }
	add r13,1
; _f2128 { %_1861 %_1860 } ⊢ { %_1862 %_1863 } : { %_1862 %_1863 }
 ; {>  %_1860~2':(_lst)◂({ _stg _p1499 _p1502 }) %_1861~0':_r64 }
; _f2128 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3402
	btr r12,1
	jmp LB_3403
LB_3402:
	bts r12,1
LB_3403:
	call NS_E_2128
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1862 ⊢ %_1864 : %_1864
 ; {>  %_1863~1':_stg %_1862~0':_r64 }
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
LB_3404:
	cmp rax,0
	jz LB_3405
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3404
LB_3405:
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
; ∎ { %_1865 %_1867 }
 ; {>  %_1866~1':_stg %_1867~2':_stg %_1865~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3406
	mov rdi,r14
	call dlt
LB_3406:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3407
	btr r12,1
	jmp LB_3408
LB_3407:
	bts r12,1
LB_3408:
	ret
MTC_LB_3394:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_3409
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
	jnc LB_3410
	bt QWORD [rdi],0
	jc LB_3411
	btr r12,4
	clc
	jmp LB_3412
LB_3411:
	bts r12,4
	stc
LB_3412:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3410:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3415
	btr r12,5
	clc
	jmp LB_3416
LB_3415:
	bts r12,5
	stc
LB_3416:
	mov r8,r11
	bt r12,5
	jc LB_3413
	btr r12,2
	jmp LB_3414
LB_3413:
	bts r12,2
LB_3414:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3419
	btr r12,5
	clc
	jmp LB_3420
LB_3419:
	bts r12,5
	stc
LB_3420:
	mov r9,r11
	bt r12,5
	jc LB_3417
	btr r12,3
	jmp LB_3418
LB_3417:
	bts r12,3
LB_3418:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3421:
	cmp r15,0
	jz LB_3422
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3421
LB_3422:
MTC_LB_3423:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3424
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
	jnc LB_3425
	bt QWORD [rdi],0
	jc LB_3426
	btr r12,4
	clc
	jmp LB_3427
LB_3426:
	bts r12,4
	stc
LB_3427:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3425:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3428
	btr r12,1
	jmp LB_3429
LB_3428:
	bts r12,1
LB_3429:
LB_3430:
	cmp r15,0
	jz LB_3431
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3430
LB_3431:
; _f56 %_1823 ⊢ %_1871 : %_1871
 ; {>  %_1868~2':_stg %_1870~1':(_lst)◂({ _stg _p1500 }) %_1823~0':_r64 }
	add r13,1
; _f2048 { %_1871 %_1870 } ⊢ { %_1872 %_1873 } : { %_1872 %_1873 }
 ; {>  %_1868~2':_stg %_1870~1':(_lst)◂({ _stg _p1500 }) %_1871~0':_r64 }
; _f2048 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2048
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3432
	btr r12,2
	clc
	jmp LB_3433
LB_3432:
	bts r12,2
	stc
LB_3433:
	add rsp,16
; _f55 %_1872 ⊢ %_1874 : %_1874
 ; {>  %_1868~2':_stg %_1873~1':_stg %_1872~0':_r64 }
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
LB_3434:
	cmp rax,0
	jz LB_3435
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3434
LB_3435:
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
; ∎ { %_1875 %_1878 }
 ; {>  %_1877~1':_stg %_1878~3':_stg %_1876~2':_stg %_1875~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3436
	mov rdi,r14
	call dlt
LB_3436:
	bt r12,2
	jc LB_3437
	mov rdi,r8
	call dlt
LB_3437:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3438
	btr r12,1
	jmp LB_3439
LB_3438:
	bts r12,1
LB_3439:
	ret
MTC_LB_3424:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3440
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
	jnc LB_3441
	bt QWORD [rdi],0
	jc LB_3442
	btr r12,4
	clc
	jmp LB_3443
LB_3442:
	bts r12,4
	stc
LB_3443:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3441:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3444
	btr r12,1
	jmp LB_3445
LB_3444:
	bts r12,1
LB_3445:
LB_3446:
	cmp r15,0
	jz LB_3447
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3446
LB_3447:
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
LB_3448:
	cmp rax,0
	jz LB_3449
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3448
LB_3449:
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
; ∎ { %_1880 %_1882 }
 ; {>  %_1882~3':_stg %_1879~1':_p1500 %_1881~2':_stg %_1880~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3450
	mov rdi,r14
	call dlt
LB_3450:
	bt r12,2
	jc LB_3451
	mov rdi,r8
	call dlt
LB_3451:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3452
	btr r12,1
	jmp LB_3453
LB_3452:
	bts r12,1
LB_3453:
	ret
MTC_LB_3440:
MTC_LB_3409:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_3454
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
	jnc LB_3455
	bt QWORD [rdi],0
	jc LB_3456
	btr r12,3
	clc
	jmp LB_3457
LB_3456:
	bts r12,3
	stc
LB_3457:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3455:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3458
	btr r12,2
	jmp LB_3459
LB_3458:
	bts r12,2
LB_3459:
LB_3460:
	cmp r15,0
	jz LB_3461
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3460
LB_3461:
; _f56 %_1823 ⊢ %_1884 : %_1884
 ; {>  %_1823~0':_r64 %_1883~2':(_lst)◂({ _stg _p1486 }) }
	add r13,1
; _f1916 { %_1884 %_1883 } ⊢ { %_1885 %_1886 } : { %_1885 %_1886 }
 ; {>  %_1884~0':_r64 %_1883~2':(_lst)◂({ _stg _p1486 }) }
; _f1916 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3462
	btr r12,1
	jmp LB_3463
LB_3462:
	bts r12,1
LB_3463:
	call NS_E_1916
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1885 ⊢ %_1887 : %_1887
 ; {>  %_1886~1':_stg %_1885~0':_r64 }
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
LB_3464:
	cmp rax,0
	jz LB_3465
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3464
LB_3465:
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
; ∎ { %_1888 %_1890 }
 ; {>  %_1888~0':_r64 %_1890~2':_stg %_1889~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3466
	mov rdi,r14
	call dlt
LB_3466:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3467
	btr r12,1
	jmp LB_3468
LB_3467:
	bts r12,1
LB_3468:
	ret
MTC_LB_3454:
NS_E_1822:
; 	|» { 0' 1' }
NS_E_RDI_1822:
MTC_LB_3469:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3470
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
	jnc LB_3471
	bt QWORD [rdi],0
	jc LB_3472
	btr r12,2
	clc
	jmp LB_3473
LB_3472:
	bts r12,2
	stc
LB_3473:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3471:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3474:
	cmp r15,0
	jz LB_3475
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3474
LB_3475:
; 	» "" _ ⊢ 1' : %_1812
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1810 %_1812 }
 ; {>  %_1812~1':_stg %_1810~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3470:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3476
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
	jnc LB_3477
	bt QWORD [rdi],0
	jc LB_3478
	btr r12,4
	clc
	jmp LB_3479
LB_3478:
	bts r12,4
	stc
LB_3479:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3477:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3482
	btr r12,5
	clc
	jmp LB_3483
LB_3482:
	bts r12,5
	stc
LB_3483:
	mov r8,r11
	bt r12,5
	jc LB_3480
	btr r12,2
	jmp LB_3481
LB_3480:
	bts r12,2
LB_3481:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3486
	btr r12,5
	clc
	jmp LB_3487
LB_3486:
	bts r12,5
	stc
LB_3487:
	mov r9,r11
	bt r12,5
	jc LB_3484
	btr r12,3
	jmp LB_3485
LB_3484:
	bts r12,3
LB_3485:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3488:
	cmp r15,0
	jz LB_3489
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3488
LB_3489:
; _f1891 { %_1810 %_1813 } ⊢ { %_1815 %_1816 } : { %_1815 %_1816 }
 ; {>  %_1814~3':(_lst)◂(_p1483) %_1813~2':_p1483 %_1810~0':_r64 }
; _f1891 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3492
	btr r12,1
	jmp LB_3493
LB_3492:
	bts r12,1
LB_3493:
	call NS_E_1891
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_3490
	btr r12,3
	clc
	jmp LB_3491
LB_3490:
	bts r12,3
	stc
LB_3491:
	add rsp,16
; _f1822 { %_1815 %_1814 } ⊢ { %_1817 %_1818 } : { %_1817 %_1818 }
 ; {>  %_1814~3':(_lst)◂(_p1483) %_1815~0':_r64 %_1816~1':_stg }
; _f1822 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3496
	btr r12,1
	jmp LB_3497
LB_3496:
	bts r12,1
LB_3497:
	call NS_E_1822
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3498
	btr r12,2
	jmp LB_3499
LB_3498:
	bts r12,2
LB_3499:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3494
	btr r12,1
	clc
	jmp LB_3495
LB_3494:
	bts r12,1
	stc
LB_3495:
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
; ∎ { %_1817 %_1821 }
 ; {>  %_1819~1':_stg %_1817~0':_r64 %_1820~2':_stg %_1821~3':_stg }
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
MTC_LB_3476:
NS_E_3507:
NS_E_RDI_3507:
NS_E_3507_ETR_TBL:
NS_E_3507_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3611
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3611
	jmp LB_3612
LB_3611:
	jmp LB_3603
LB_3612:
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
	jc LB_3604
	btr r12,0
	clc
	jmp LB_3605
LB_3604:
	bts r12,0
	stc
LB_3605:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3600
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_3511 : %_3511
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_3511
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_3511 ⊢ %_3512 : %_3512
 ; {>  %_3511~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3512
 ; {>  %_3512~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3598
	btr r12,3
	jmp LB_3599
LB_3598:
	bts r12,3
LB_3599:
	mov r8,0
	bts r12,2
	ret
LB_3600:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3602
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3601
LB_3602:
	add rsp,8
	ret
LB_3603:
	add rsp,16
	pop r14
LB_3601:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3627
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3619
LB_3627:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_3507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3632
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3633:
	jmp LB_3619
LB_3632:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3622
	btr r12,1
	clc
	jmp LB_3623
LB_3622:
	bts r12,1
	stc
LB_3623:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3620
	btr r12,0
	clc
	jmp LB_3621
LB_3620:
	bts r12,0
	stc
LB_3621:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3616
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56 %_3514 ⊢ %_3515 : %_3515
 ; {>  %_3513~0':_r64 %_3514~1':_r64 }
	add r14,1
; _some %_3515 ⊢ %_3516 : %_3516
 ; {>  %_3513~0':_r64 %_3515~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_3516
 ; {>  %_3513~0':_r64 %_3516~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_3613
	mov rdi,r13
	call dlt
LB_3613:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_3614
	btr r12,3
	jmp LB_3615
LB_3614:
	bts r12,3
LB_3615:
	mov r8,0
	bts r12,2
	ret
LB_3616:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3618
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3617
LB_3618:
	add rsp,8
	ret
LB_3619:
	add rsp,32
	pop r14
LB_3617:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3508:
NS_E_RDI_3508:
NS_E_3508_ETR_TBL:
NS_E_3508_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_3650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_3650
	jmp LB_3651
LB_3650:
	jmp LB_3640
LB_3651:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3655
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3656
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3656:
	jmp LB_3640
LB_3655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3643
	btr r12,1
	clc
	jmp LB_3644
LB_3643:
	bts r12,1
	stc
LB_3644:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3641
	btr r12,0
	clc
	jmp LB_3642
LB_3641:
	bts r12,0
	stc
LB_3642:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3637
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3658
	btr r12,2
	jmp LB_3659
LB_3658:
	bts r12,2
LB_3659:
	mov r13,r14
	bt r12,1
	jc LB_3660
	btr r12,0
	jmp LB_3661
LB_3660:
	bts r12,0
LB_3661:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_3517 ⊢ %_3518 : %_3518
 ; {>  %_3517~0':_r64 }
	add r13,1
; _some %_3518 ⊢ %_3519 : %_3519
 ; {>  %_3518~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3519
 ; {>  %_3519~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3635
	btr r12,3
	jmp LB_3636
LB_3635:
	bts r12,3
LB_3636:
	mov r8,0
	bts r12,2
	ret
LB_3637:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3639
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3638
LB_3639:
	add rsp,8
	ret
LB_3640:
	add rsp,32
	pop r14
LB_3638:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_3677
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_3677
	jmp LB_3678
LB_3677:
	jmp LB_3667
LB_3678:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3682
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3683
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3683:
	jmp LB_3667
LB_3682:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3670
	btr r12,1
	clc
	jmp LB_3671
LB_3670:
	bts r12,1
	stc
LB_3671:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,32
	push rdi
	push rsi
	push LB_3664
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3685
	btr r12,2
	jmp LB_3686
LB_3685:
	bts r12,2
LB_3686:
	mov r13,r14
	bt r12,1
	jc LB_3687
	btr r12,0
	jmp LB_3688
LB_3687:
	bts r12,0
LB_3688:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_3520 ⊢ %_3521 : %_3521
 ; {>  %_3520~0':_r64 }
	add r13,1
; _some %_3521 ⊢ %_3522 : %_3522
 ; {>  %_3521~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3522
 ; {>  %_3522~°0◂0':(_opn)◂(_r64) }
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
	add rsp,32
	pop r14
LB_3665:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3691
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_3523 : %_3523
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_3523
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_3523 ⊢ %_3524 : %_3524
 ; {>  %_3523~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3524
 ; {>  %_3524~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3689
	btr r12,3
	jmp LB_3690
LB_3689:
	bts r12,3
LB_3690:
	mov r8,0
	bts r12,2
	ret
LB_3691:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3693
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3692
LB_3693:
	add rsp,8
	ret
LB_3694:
	add rsp,0
	pop r14
LB_3692:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3509:
NS_E_RDI_3509:
NS_E_3509_ETR_TBL:
NS_E_3509_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3774
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3721
LB_3774:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_3782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_3782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_3782
	jmp LB_3783
LB_3782:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3780:
	jmp LB_3721
LB_3783:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3738
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3739
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3739:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3740:
	jmp LB_3722
LB_3738:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3750
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3750
	jmp LB_3751
LB_3750:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3746
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3746:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3747
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3747:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3748
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3748:
	jmp LB_3722
LB_3751:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_3510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3755
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3756
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3756:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3757
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3757:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3758
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3758:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3759
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3759:
	jmp LB_3722
LB_3755:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_3509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3764
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_3765
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_3765:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3766
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3766:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3767
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3767:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3768
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3768:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3769
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3769:
	jmp LB_3722
LB_3764:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_3733
	btr r12,5
	clc
	jmp LB_3734
LB_3733:
	bts r12,5
	stc
LB_3734:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3731
	btr r12,4
	clc
	jmp LB_3732
LB_3731:
	bts r12,4
	stc
LB_3732:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3729
	btr r12,3
	clc
	jmp LB_3730
LB_3729:
	bts r12,3
	stc
LB_3730:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3727
	btr r12,2
	clc
	jmp LB_3728
LB_3727:
	bts r12,2
	stc
LB_3728:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3725
	btr r12,1
	clc
	jmp LB_3726
LB_3725:
	bts r12,1
	stc
LB_3726:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3723
	btr r12,0
	clc
	jmp LB_3724
LB_3723:
	bts r12,0
	stc
LB_3724:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_3718
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_3784
	btr r12,6
	jmp LB_3785
LB_3784:
	bts r12,6
LB_3785:
	mov r8,r10
	bt r12,4
	jc LB_3786
	btr r12,2
	jmp LB_3787
LB_3786:
	bts r12,2
LB_3787:
	mov rdx,r14
	bt r12,1
	jc LB_3788
	btr r12,7
	jmp LB_3789
LB_3788:
	bts r12,7
LB_3789:
	mov r14,rcx
	bt r12,6
	jc LB_3790
	btr r12,1
	jmp LB_3791
LB_3790:
	bts r12,1
LB_3791:
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
	jc LB_3794
	btr r12,6
	clc
	jmp LB_3795
LB_3794:
	bts r12,6
	stc
LB_3795:
	mov r9,rcx
	bt r12,6
	jc LB_3792
	btr r12,3
	jmp LB_3793
LB_3792:
	bts r12,3
LB_3793:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3798
	btr r12,6
	clc
	jmp LB_3799
LB_3798:
	bts r12,6
	stc
LB_3799:
	mov r10,rcx
	bt r12,6
	jc LB_3796
	btr r12,4
	jmp LB_3797
LB_3796:
	bts r12,4
LB_3797:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3530 : %_3530
 ; {>  %_3528~3':_r64 %_3527~2':_r64 %_3525~0':_r64 %_3529~4':(_lst)◂(_p3504) %_3526~1':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_3530
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_3530 %_3525 } ⊢ { %_3531 %_3532 } : { %_3531 %_3532 }
 ; {>  %_3530~5':_r64 %_3528~3':_r64 %_3527~2':_r64 %_3525~0':_r64 %_3529~4':(_lst)◂(_p3504) %_3526~1':_r64 }
	add r11,r13
; _f51 { %_3531 %_3526 } ⊢ { %_3533 %_3534 } : { %_3533 %_3534 }
 ; {>  %_3528~3':_r64 %_3527~2':_r64 %_3531~5':_r64 %_3532~0':_r64 %_3529~4':(_lst)◂(_p3504) %_3526~1':_r64 }
	add r11,r14
; _f51 { %_3533 %_3527 } ⊢ { %_3535 %_3536 } : { %_3535 %_3536 }
 ; {>  %_3528~3':_r64 %_3534~1':_r64 %_3533~5':_r64 %_3527~2':_r64 %_3532~0':_r64 %_3529~4':(_lst)◂(_p3504) }
	add r11,r8
; _f3505 %_3535 ⊢ %_3537 : %_3537
 ; {>  %_3535~5':_r64 %_3528~3':_r64 %_3534~1':_r64 %_3536~2':_r64 %_3532~0':_r64 %_3529~4':(_lst)◂(_p3504) }
; _f3505 5' ⊢ °0◂5'
; _cns { %_3537 %_3529 } ⊢ %_3538 : %_3538
 ; {>  %_3528~3':_r64 %_3537~°0◂5':_p3504 %_3534~1':_r64 %_3536~2':_r64 %_3532~0':_r64 %_3529~4':(_lst)◂(_p3504) }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_3528 %_3538 } ⊢ %_3539 : %_3539
 ; {>  %_3528~3':_r64 %_3534~1':_r64 %_3538~°0◂{ °0◂5' 4' }:(_lst)◂(_p3504) %_3536~2':_r64 %_3532~0':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_3539
 ; {>  %_3534~1':_r64 %_3539~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p3504) }) %_3536~2':_r64 %_3532~0':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_3695
	mov rdi,r14
	call dlt
LB_3695:
	bt r12,2
	jc LB_3696
	mov rdi,r8
	call dlt
LB_3696:
	bt r12,0
	jc LB_3697
	mov rdi,r13
	call dlt
LB_3697:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3698
	btr r12,0
	jmp LB_3699
LB_3698:
	bts r12,0
LB_3699:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_3702
	btr r12,1
	jmp LB_3703
LB_3702:
	bts r12,1
LB_3703:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3700
	btr QWORD [rdi],0
	jmp LB_3701
LB_3700:
	bts QWORD [rdi],0
LB_3701:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_3712
	btr r12,0
	jmp LB_3713
LB_3712:
	bts r12,0
LB_3713:
	mov rsi,1
	bt r12,0
	jc LB_3710
	mov rsi,0
	bt r13,0
	jc LB_3710
	jmp LB_3711
LB_3710:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3711:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_3708
	btr QWORD [rdi],0
	jmp LB_3709
LB_3708:
	bts QWORD [rdi],0
LB_3709:
	mov r13,r10
	bt r12,4
	jc LB_3716
	btr r12,0
	jmp LB_3717
LB_3716:
	bts r12,0
LB_3717:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_3714
	btr QWORD [rdi],1
	jmp LB_3715
LB_3714:
	bts QWORD [rdi],1
LB_3715:
	mov rsi,1
	bt r12,1
	jc LB_3706
	mov rsi,0
	bt r14,0
	jc LB_3706
	jmp LB_3707
LB_3706:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3707:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3704
	btr QWORD [rdi],1
	jmp LB_3705
LB_3704:
	bts QWORD [rdi],1
LB_3705:
	mov r8,0
	bts r12,2
	ret
LB_3718:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3720
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3719
LB_3720:
	add rsp,8
	ret
LB_3722:
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
LB_3721:
	add rsp,96
	pop r14
LB_3719:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3853
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3825
LB_3853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_3861
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_3861
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_3861
	jmp LB_3862
LB_3861:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3859
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3859:
	jmp LB_3825
LB_3862:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_3507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3838
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3839
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3839:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3840
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3840:
	jmp LB_3826
LB_3838:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_3509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3845
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3846
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3846:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3847
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3847:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3848:
	jmp LB_3826
LB_3845:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3833
	btr r12,3
	clc
	jmp LB_3834
LB_3833:
	bts r12,3
	stc
LB_3834:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3831
	btr r12,2
	clc
	jmp LB_3832
LB_3831:
	bts r12,2
	stc
LB_3832:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3829
	btr r12,1
	clc
	jmp LB_3830
LB_3829:
	bts r12,1
	stc
LB_3830:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3827
	btr r12,0
	clc
	jmp LB_3828
LB_3827:
	bts r12,0
	stc
LB_3828:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_3822
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_3863
	btr r12,4
	jmp LB_3864
LB_3863:
	bts r12,4
LB_3864:
	mov r14,r8
	bt r12,2
	jc LB_3865
	btr r12,1
	jmp LB_3866
LB_3865:
	bts r12,1
LB_3866:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_3867
	btr r12,4
	jmp LB_3868
LB_3867:
	bts r12,4
LB_3868:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3871
	btr r12,5
	clc
	jmp LB_3872
LB_3871:
	bts r12,5
	stc
LB_3872:
	mov r8,r11
	bt r12,5
	jc LB_3869
	btr r12,2
	jmp LB_3870
LB_3869:
	bts r12,2
LB_3870:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3875
	btr r12,5
	clc
	jmp LB_3876
LB_3875:
	bts r12,5
	stc
LB_3876:
	mov r9,r11
	bt r12,5
	jc LB_3873
	btr r12,3
	jmp LB_3874
LB_3873:
	bts r12,3
LB_3874:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_3544 : %_3544
 ; {>  %_3543~3':(_lst)◂(_p3504) %_3540~0':_r64 %_3542~2':_r64 %_3541~1':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_3544
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_3544 %_3540 } ⊢ { %_3545 %_3546 } : { %_3545 %_3546 }
 ; {>  %_3543~3':(_lst)◂(_p3504) %_3540~0':_r64 %_3542~2':_r64 %_3541~1':_r64 %_3544~4':_r64 }
	add r10,r13
; _f51 { %_3545 %_3541 } ⊢ { %_3547 %_3548 } : { %_3547 %_3548 }
 ; {>  %_3543~3':(_lst)◂(_p3504) %_3542~2':_r64 %_3545~4':_r64 %_3541~1':_r64 %_3546~0':_r64 }
	add r10,r14
; _f3505 %_3547 ⊢ %_3549 : %_3549
 ; {>  %_3543~3':(_lst)◂(_p3504) %_3542~2':_r64 %_3548~1':_r64 %_3547~4':_r64 %_3546~0':_r64 }
; _f3505 4' ⊢ °0◂4'
; _cns { %_3549 %_3543 } ⊢ %_3550 : %_3550
 ; {>  %_3543~3':(_lst)◂(_p3504) %_3549~°0◂4':_p3504 %_3542~2':_r64 %_3548~1':_r64 %_3546~0':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_3542 %_3550 } ⊢ %_3551 : %_3551
 ; {>  %_3542~2':_r64 %_3548~1':_r64 %_3550~°0◂{ °0◂4' 3' }:(_lst)◂(_p3504) %_3546~0':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_3551
 ; {>  %_3548~1':_r64 %_3551~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p3504) }) %_3546~0':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_3800
	mov rdi,r14
	call dlt
LB_3800:
	bt r12,0
	jc LB_3801
	mov rdi,r13
	call dlt
LB_3801:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3802
	btr r12,0
	jmp LB_3803
LB_3802:
	bts r12,0
LB_3803:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_3806
	btr r12,1
	jmp LB_3807
LB_3806:
	bts r12,1
LB_3807:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3804
	btr QWORD [rdi],0
	jmp LB_3805
LB_3804:
	bts QWORD [rdi],0
LB_3805:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_3816
	btr r12,2
	jmp LB_3817
LB_3816:
	bts r12,2
LB_3817:
	mov rsi,1
	bt r12,2
	jc LB_3814
	mov rsi,0
	bt r8,0
	jc LB_3814
	jmp LB_3815
LB_3814:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_3815:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3812
	btr QWORD [rdi],0
	jmp LB_3813
LB_3812:
	bts QWORD [rdi],0
LB_3813:
	mov r8,r13
	bt r12,0
	jc LB_3820
	btr r12,2
	jmp LB_3821
LB_3820:
	bts r12,2
LB_3821:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3818
	btr QWORD [rdi],1
	jmp LB_3819
LB_3818:
	bts QWORD [rdi],1
LB_3819:
	mov rsi,1
	bt r12,1
	jc LB_3810
	mov rsi,0
	bt r14,0
	jc LB_3810
	jmp LB_3811
LB_3810:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3811:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3808
	btr QWORD [rdi],1
	jmp LB_3809
LB_3808:
	bts QWORD [rdi],1
LB_3809:
	mov r8,0
	bts r12,2
	ret
LB_3822:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3824
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3823
LB_3824:
	add rsp,8
	ret
LB_3826:
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
LB_3825:
	add rsp,64
	pop r14
LB_3823:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_3507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3948
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3940
LB_3948:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_3509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3953
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3954
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3954:
	jmp LB_3940
LB_3953:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3943
	btr r12,1
	clc
	jmp LB_3944
LB_3943:
	bts r12,1
	stc
LB_3944:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3941
	btr r12,0
	clc
	jmp LB_3942
LB_3941:
	bts r12,0
	stc
LB_3942:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3937
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_3956
	btr r12,3
	jmp LB_3957
LB_3956:
	bts r12,3
LB_3957:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3960
	btr r12,4
	clc
	jmp LB_3961
LB_3960:
	bts r12,4
	stc
LB_3961:
	mov r14,r10
	bt r12,4
	jc LB_3958
	btr r12,1
	jmp LB_3959
LB_3958:
	bts r12,1
LB_3959:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3964
	btr r12,4
	clc
	jmp LB_3965
LB_3964:
	bts r12,4
	stc
LB_3965:
	mov r8,r10
	bt r12,4
	jc LB_3962
	btr r12,2
	jmp LB_3963
LB_3962:
	bts r12,2
LB_3963:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f51 { %_3553 %_3552 } ⊢ { %_3555 %_3556 } : { %_3555 %_3556 }
 ; {>  %_3554~2':(_lst)◂(_p3504) %_3553~1':_r64 %_3552~0':_r64 }
	add r14,r13
MTC_LB_3877:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3878
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
	jnc LB_3879
	bt QWORD [rdi],0
	jc LB_3880
	btr r12,5
	clc
	jmp LB_3881
LB_3880:
	bts r12,5
	stc
LB_3881:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3879:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3884
	btr r12,6
	clc
	jmp LB_3885
LB_3884:
	bts r12,6
	stc
LB_3885:
	mov r9,rcx
	bt r12,6
	jc LB_3882
	btr r12,3
	jmp LB_3883
LB_3882:
	bts r12,3
LB_3883:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3888
	btr r12,6
	clc
	jmp LB_3889
LB_3888:
	bts r12,6
	stc
LB_3889:
	mov r10,rcx
	bt r12,6
	jc LB_3886
	btr r12,4
	jmp LB_3887
LB_3886:
	bts r12,4
LB_3887:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3878
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
	jnc LB_3890
	bt QWORD [rdi],0
	jc LB_3891
	btr r12,6
	clc
	jmp LB_3892
LB_3891:
	bts r12,6
	stc
LB_3892:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3890:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_3893
	btr r12,5
	jmp LB_3894
LB_3893:
	bts r12,5
LB_3894:
LB_3895:
	cmp r15,0
	jz LB_3896
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3895
LB_3896:
; _f51 { %_3559 %_3556 } ⊢ { %_3560 %_3561 } : { %_3560 %_3561 }
 ; {>  %_3558~4':(_lst)◂(_p3504) %_3559~5':_r64 %_3555~1':_r64 %_3556~0':_r64 }
	add r11,r13
; _f3506 %_3560 ⊢ %_3562 : %_3562
 ; {>  %_3560~5':_r64 %_3561~0':_r64 %_3558~4':(_lst)◂(_p3504) %_3555~1':_r64 }
; _f3506 5' ⊢ °1◂5'
; _cns { %_3562 %_3558 } ⊢ %_3563 : %_3563
 ; {>  %_3561~0':_r64 %_3558~4':(_lst)◂(_p3504) %_3555~1':_r64 %_3562~°1◂5':_p3504 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_3555 %_3563 } ⊢ %_3564 : %_3564
 ; {>  %_3563~°0◂{ °1◂5' 4' }:(_lst)◂(_p3504) %_3561~0':_r64 %_3555~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_3564
 ; {>  %_3561~0':_r64 %_3564~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p3504) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_3897
	mov rdi,r13
	call dlt
LB_3897:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_3900
	btr r12,0
	jmp LB_3901
LB_3900:
	bts r12,0
LB_3901:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_3898
	btr QWORD [rdi],0
	jmp LB_3899
LB_3898:
	bts QWORD [rdi],0
LB_3899:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_3910
	btr r12,1
	jmp LB_3911
LB_3910:
	bts r12,1
LB_3911:
	mov rsi,1
	bt r12,1
	jc LB_3908
	mov rsi,0
	bt r14,0
	jc LB_3908
	jmp LB_3909
LB_3908:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3909:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3906
	btr QWORD [rdi],0
	jmp LB_3907
LB_3906:
	bts QWORD [rdi],0
LB_3907:
	mov r14,r10
	bt r12,4
	jc LB_3914
	btr r12,1
	jmp LB_3915
LB_3914:
	bts r12,1
LB_3915:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3912
	btr QWORD [rdi],1
	jmp LB_3913
LB_3912:
	bts QWORD [rdi],1
LB_3913:
	mov rsi,1
	bt r12,0
	jc LB_3904
	mov rsi,0
	bt r13,0
	jc LB_3904
	jmp LB_3905
LB_3904:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3905:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_3902
	btr QWORD [rdi],1
	jmp LB_3903
LB_3902:
	bts QWORD [rdi],1
LB_3903:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3878:
	mov r15,0
LB_3917:
	cmp r15,0
	jz LB_3918
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3917
LB_3918:
; _f3506 %_3556 ⊢ %_3565 : %_3565
 ; {>  %_3555~1':_r64 %_3554~2':(_lst)◂(_p3504) %_3556~0':_r64 }
; _f3506 0' ⊢ °1◂0'
; _cns { %_3565 %_3554 } ⊢ %_3566 : %_3566
 ; {>  %_3555~1':_r64 %_3554~2':(_lst)◂(_p3504) %_3565~°1◂0':_p3504 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_3555 %_3566 } ⊢ %_3567 : %_3567
 ; {>  %_3566~°0◂{ °1◂0' 2' }:(_lst)◂(_p3504) %_3555~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_3567
 ; {>  %_3567~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p3504) }) }
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
	jc LB_3921
	btr r12,4
	jmp LB_3922
LB_3921:
	bts r12,4
LB_3922:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3919
	btr QWORD [rdi],0
	jmp LB_3920
LB_3919:
	bts QWORD [rdi],0
LB_3920:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_3931
	btr r12,1
	jmp LB_3932
LB_3931:
	bts r12,1
LB_3932:
	mov rsi,1
	bt r12,1
	jc LB_3929
	mov rsi,0
	bt r14,0
	jc LB_3929
	jmp LB_3930
LB_3929:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3930:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3927
	btr QWORD [rdi],0
	jmp LB_3928
LB_3927:
	bts QWORD [rdi],0
LB_3928:
	mov r14,r8
	bt r12,2
	jc LB_3935
	btr r12,1
	jmp LB_3936
LB_3935:
	bts r12,1
LB_3936:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3933
	btr QWORD [rdi],1
	jmp LB_3934
LB_3933:
	bts QWORD [rdi],1
LB_3934:
	mov rsi,1
	bt r12,4
	jc LB_3925
	mov rsi,0
	bt r10,0
	jc LB_3925
	jmp LB_3926
LB_3925:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_3926:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3923
	btr QWORD [rdi],1
	jmp LB_3924
LB_3923:
	bts QWORD [rdi],1
LB_3924:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3916:
LB_3937:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3939
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3938
LB_3939:
	add rsp,8
	ret
LB_3940:
	add rsp,32
	pop r14
LB_3938:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3974
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3568 : %_3568
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_3569 : %_3569
 ; {>  %_3568~°1◂{  }:(_lst)◂(t1628'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_3569
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_3569 %_3568 } ⊢ %_3570 : %_3570
 ; {>  %_3569~0':_r64 %_3568~°1◂{  }:(_lst)◂(t1628'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_3570
 ; {>  %_3570~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t1632'(0)) }) }
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
	jc LB_3968
	btr r12,1
	jmp LB_3969
LB_3968:
	bts r12,1
LB_3969:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3966
	btr QWORD [rdi],0
	jmp LB_3967
LB_3966:
	bts QWORD [rdi],0
LB_3967:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
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
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3970
	btr QWORD [rdi],1
	jmp LB_3971
LB_3970:
	bts QWORD [rdi],1
LB_3971:
	mov r8,0
	bts r12,2
	ret
LB_3974:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3976
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3975
LB_3976:
	add rsp,8
	ret
LB_3977:
	add rsp,0
	pop r14
LB_3975:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3510:
NS_E_RDI_3510:
NS_E_3510_ETR_TBL:
NS_E_3510_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4015
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3985
LB_4015:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_4023
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4023
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_4023
	jmp LB_4024
LB_4023:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4021
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4021:
	jmp LB_3985
LB_4024:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3998
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3999
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3999:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4000
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4000:
	jmp LB_3986
LB_3998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4010
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4010
	jmp LB_4011
LB_4010:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4006
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4006:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4007
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4007:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4008
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4008:
	jmp LB_3986
LB_4011:
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
	jc LB_3993
	btr r12,3
	clc
	jmp LB_3994
LB_3993:
	bts r12,3
	stc
LB_3994:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3991
	btr r12,2
	clc
	jmp LB_3992
LB_3991:
	bts r12,2
	stc
LB_3992:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3989
	btr r12,1
	clc
	jmp LB_3990
LB_3989:
	bts r12,1
	stc
LB_3990:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3987
	btr r12,0
	clc
	jmp LB_3988
LB_3987:
	bts r12,0
	stc
LB_3988:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_3982
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_4025
	btr r12,4
	jmp LB_4026
LB_4025:
	bts r12,4
LB_4026:
	mov r14,r8
	bt r12,2
	jc LB_4027
	btr r12,1
	jmp LB_4028
LB_4027:
	bts r12,1
LB_4028:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3573 : %_3573
 ; {>  %_3571~0':_r64 %_3572~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_3573
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_3573 %_3571 } ⊢ { %_3574 %_3575 } : { %_3574 %_3575 }
 ; {>  %_3571~0':_r64 %_3573~2':_r64 %_3572~1':_r64 }
	add r8,r13
; _f51 { %_3574 %_3572 } ⊢ { %_3576 %_3577 } : { %_3576 %_3577 }
 ; {>  %_3575~0':_r64 %_3574~2':_r64 %_3572~1':_r64 }
	add r8,r14
; _some %_3576 ⊢ %_3578 : %_3578
 ; {>  %_3576~2':_r64 %_3575~0':_r64 %_3577~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_3578
 ; {>  %_3578~°0◂2':(_opn)◂(_r64) %_3575~0':_r64 %_3577~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_3978
	mov rdi,r13
	call dlt
LB_3978:
	bt r12,1
	jc LB_3979
	mov rdi,r14
	call dlt
LB_3979:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_3980
	btr r12,3
	jmp LB_3981
LB_3980:
	bts r12,3
LB_3981:
	mov r8,0
	bts r12,2
	ret
LB_3982:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3984
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3983
LB_3984:
	add rsp,8
	ret
LB_3986:
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
LB_3985:
	add rsp,64
	pop r14
LB_3983:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4091
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4038
LB_4091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_4099
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_4099
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4099
	jmp LB_4100
LB_4099:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4097
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4097:
	jmp LB_4038
LB_4100:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_3508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4055
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4056
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4056:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4057
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4057:
	jmp LB_4039
LB_4055:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4067
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4067
	jmp LB_4068
LB_4067:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4063
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4063:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4064
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4064:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4065
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4065:
	jmp LB_4039
LB_4068:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_3510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4072
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4073
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4073:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4074
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4074:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4075
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4075:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4076
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4076:
	jmp LB_4039
LB_4072:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_3510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4081
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_4082
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_4082:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4083
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4083:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4084
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4084:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4085
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4085:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4086
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4086:
	jmp LB_4039
LB_4081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_4050
	btr r12,5
	clc
	jmp LB_4051
LB_4050:
	bts r12,5
	stc
LB_4051:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4048
	btr r12,4
	clc
	jmp LB_4049
LB_4048:
	bts r12,4
	stc
LB_4049:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4046
	btr r12,3
	clc
	jmp LB_4047
LB_4046:
	bts r12,3
	stc
LB_4047:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4044
	btr r12,2
	clc
	jmp LB_4045
LB_4044:
	bts r12,2
	stc
LB_4045:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4042
	btr r12,1
	clc
	jmp LB_4043
LB_4042:
	bts r12,1
	stc
LB_4043:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4040
	btr r12,0
	clc
	jmp LB_4041
LB_4040:
	bts r12,0
	stc
LB_4041:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_4035
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_4101
	btr r12,6
	jmp LB_4102
LB_4101:
	bts r12,6
LB_4102:
	mov r9,r11
	bt r12,5
	jc LB_4103
	btr r12,3
	jmp LB_4104
LB_4103:
	bts r12,3
LB_4104:
	mov r11,r8
	bt r12,2
	jc LB_4105
	btr r12,5
	jmp LB_4106
LB_4105:
	bts r12,5
LB_4106:
	mov r8,r10
	bt r12,4
	jc LB_4107
	btr r12,2
	jmp LB_4108
LB_4107:
	bts r12,2
LB_4108:
	mov r10,r14
	bt r12,1
	jc LB_4109
	btr r12,4
	jmp LB_4110
LB_4109:
	bts r12,4
LB_4110:
	mov r14,r11
	bt r12,5
	jc LB_4111
	btr r12,1
	jmp LB_4112
LB_4111:
	bts r12,1
LB_4112:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_3583 : %_3583
 ; {>  %_3582~3':_r64 %_3581~2':_r64 %_3579~0':_r64 %_3580~1':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_3583
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_3583 %_3579 } ⊢ { %_3584 %_3585 } : { %_3584 %_3585 }
 ; {>  %_3582~3':_r64 %_3581~2':_r64 %_3579~0':_r64 %_3580~1':_r64 %_3583~4':_r64 }
	add r10,r13
; _f51 { %_3584 %_3580 } ⊢ { %_3586 %_3587 } : { %_3586 %_3587 }
 ; {>  %_3582~3':_r64 %_3581~2':_r64 %_3584~4':_r64 %_3585~0':_r64 %_3580~1':_r64 }
	add r10,r14
; _f51 { %_3586 %_3581 } ⊢ { %_3588 %_3589 } : { %_3588 %_3589 }
 ; {>  %_3582~3':_r64 %_3587~1':_r64 %_3586~4':_r64 %_3581~2':_r64 %_3585~0':_r64 }
	add r10,r8
; _f51 { %_3588 %_3582 } ⊢ { %_3590 %_3591 } : { %_3590 %_3591 }
 ; {>  %_3588~4':_r64 %_3582~3':_r64 %_3587~1':_r64 %_3585~0':_r64 %_3589~2':_r64 }
	add r10,r9
; _some %_3590 ⊢ %_3592 : %_3592
 ; {>  %_3590~4':_r64 %_3587~1':_r64 %_3585~0':_r64 %_3591~3':_r64 %_3589~2':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_3592
 ; {>  %_3592~°0◂4':(_opn)◂(_r64) %_3587~1':_r64 %_3585~0':_r64 %_3591~3':_r64 %_3589~2':_r64 }
; 	∎ °0◂4'
	bt r12,1
	jc LB_4029
	mov rdi,r14
	call dlt
LB_4029:
	bt r12,0
	jc LB_4030
	mov rdi,r13
	call dlt
LB_4030:
	bt r12,3
	jc LB_4031
	mov rdi,r9
	call dlt
LB_4031:
	bt r12,2
	jc LB_4032
	mov rdi,r8
	call dlt
LB_4032:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_4033
	btr r12,3
	jmp LB_4034
LB_4033:
	bts r12,3
LB_4034:
	mov r8,0
	bts r12,2
	ret
LB_4035:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4037
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4036
LB_4037:
	add rsp,8
	ret
LB_4039:
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
LB_4038:
	add rsp,96
	pop r14
LB_4036:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_3507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4127
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4119
LB_4127:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_3510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4132
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4133
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4133:
	jmp LB_4119
LB_4132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4122
	btr r12,1
	clc
	jmp LB_4123
LB_4122:
	bts r12,1
	stc
LB_4123:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4120
	btr r12,0
	clc
	jmp LB_4121
LB_4120:
	bts r12,0
	stc
LB_4121:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4116
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f51 { %_3593 %_3594 } ⊢ { %_3595 %_3596 } : { %_3595 %_3596 }
 ; {>  %_3593~0':_r64 %_3594~1':_r64 }
	add r13,r14
; _some %_3595 ⊢ %_3597 : %_3597
 ; {>  %_3596~1':_r64 %_3595~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3597
 ; {>  %_3596~1':_r64 %_3597~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_4113
	mov rdi,r14
	call dlt
LB_4113:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4114
	btr r12,3
	jmp LB_4115
LB_4114:
	bts r12,3
LB_4115:
	mov r8,0
	bts r12,2
	ret
LB_4116:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4118
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4117
LB_4118:
	add rsp,8
	ret
LB_4119:
	add rsp,32
	pop r14
LB_4117:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4157:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_4157:
MTC_LB_4158:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4159
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
	jnc LB_4160
	bt QWORD [rdi],0
	jc LB_4161
	btr r12,7
	clc
	jmp LB_4162
LB_4161:
	bts r12,7
	stc
LB_4162:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4160:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_4165
	btr r12,8
	clc
	jmp LB_4166
LB_4165:
	bts r12,8
	stc
LB_4166:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4163
	btr r12,5
	jmp LB_4164
LB_4163:
	bts r12,5
LB_4164:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_4169
	btr r12,8
	clc
	jmp LB_4170
LB_4169:
	bts r12,8
	stc
LB_4170:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4167
	btr r12,6
	jmp LB_4168
LB_4167:
	bts r12,6
LB_4168:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4171:
	cmp r15,0
	jz LB_4172
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4171
LB_4172:
MTC_LB_4173:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4174
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
	jnc LB_4175
	bt QWORD [rdi],0
	jc LB_4176
	btr r12,7
	clc
	jmp LB_4177
LB_4176:
	bts r12,7
	stc
LB_4177:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4175:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4178
	btr r12,4
	jmp LB_4179
LB_4178:
	bts r12,4
LB_4179:
LB_4180:
	cmp r15,0
	jz LB_4181
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4180
LB_4181:
; _f53 %_4142 ⊢ { %_4143 %_4144 } : { %_4143 %_4144 }
 ; {>  %_4137~2':_stg %_4135~0':_stg %_4142~4':_r64 %_4136~1':_r64 %_4138~3':_r64 %_4141~6':(_lst)◂(_p3504) }
	mov r11,r10
	bts r12,5
; _f35 { %_4144 %_4135 %_4136 %_4137 %_4138 } ⊢ { %_4145 %_4146 %_4147 %_4148 %_4149 } : { %_4145 %_4146 %_4147 %_4148 %_4149 }
 ; {>  %_4137~2':_stg %_4135~0':_stg %_4144~5':_r64 %_4136~1':_r64 %_4138~3':_r64 %_4143~4':_r64 %_4141~6':(_lst)◂(_p3504) }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_4186
	btr r12,4
	jmp LB_4187
LB_4186:
	bts r12,4
LB_4187:
	mov r9,r8
	bt r12,2
	jc LB_4188
	btr r12,3
	jmp LB_4189
LB_4188:
	bts r12,3
LB_4189:
	mov r8,r14
	bt r12,1
	jc LB_4190
	btr r12,2
	jmp LB_4191
LB_4190:
	bts r12,2
LB_4191:
	mov r14,r13
	bt r12,0
	jc LB_4192
	btr r12,1
	jmp LB_4193
LB_4192:
	bts r12,1
LB_4193:
	mov r13,r11
	bt r12,5
	jc LB_4194
	btr r12,0
	jmp LB_4195
LB_4194:
	bts r12,0
LB_4195:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_4196
	btr r12,5
	jmp LB_4197
LB_4196:
	bts r12,5
LB_4197:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_4184
	btr r12,6
	clc
	jmp LB_4185
LB_4184:
	bts r12,6
	stc
LB_4185:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4182
	btr r12,4
	clc
	jmp LB_4183
LB_4182:
	bts r12,4
	stc
LB_4183:
	add rsp,24
; _f4157 { %_4146 %_4147 %_4148 %_4149 %_4141 } ⊢ { %_4150 %_4151 } : { %_4150 %_4151 }
 ; {>  %_4148~3':_stg %_4149~5':_r64 %_4145~0':_r64 %_4143~4':_r64 %_4141~6':(_lst)◂(_p3504) %_4147~2':_r64 %_4146~1':_stg }
; _f4157 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_4202
	btr r12,0
	jmp LB_4203
LB_4202:
	bts r12,0
LB_4203:
	mov r14,r8
	bt r12,2
	jc LB_4204
	btr r12,1
	jmp LB_4205
LB_4204:
	bts r12,1
LB_4205:
	mov r8,r9
	bt r12,3
	jc LB_4206
	btr r12,2
	jmp LB_4207
LB_4206:
	bts r12,2
LB_4207:
	mov r9,r11
	bt r12,5
	jc LB_4208
	btr r12,3
	jmp LB_4209
LB_4208:
	bts r12,3
LB_4209:
	mov r10,rcx
	bt r12,6
	jc LB_4210
	btr r12,4
	jmp LB_4211
LB_4210:
	bts r12,4
LB_4211:
	call NS_E_4157
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4212
	btr r12,2
	jmp LB_4213
LB_4212:
	bts r12,2
LB_4213:
	mov r14,r13
	bt r12,0
	jc LB_4214
	btr r12,1
	jmp LB_4215
LB_4214:
	bts r12,1
LB_4215:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4200
	btr r12,4
	clc
	jmp LB_4201
LB_4200:
	bts r12,4
	stc
LB_4201:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4198
	btr r12,0
	clc
	jmp LB_4199
LB_4198:
	bts r12,0
	stc
LB_4199:
	add rsp,24
; ∎ { %_4150 %_4151 }
 ; {>  %_4145~0':_r64 %_4151~2':_stg %_4143~4':_r64 %_4150~1':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_4216
	mov rdi,r13
	call dlt
LB_4216:
	bt r12,4
	jc LB_4217
	mov rdi,r10
	call dlt
LB_4217:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_4218
	btr r12,0
	jmp LB_4219
LB_4218:
	bts r12,0
LB_4219:
	mov r14,r8
	bt r12,2
	jc LB_4220
	btr r12,1
	jmp LB_4221
LB_4220:
	bts r12,1
LB_4221:
	ret
MTC_LB_4174:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4222
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
	jnc LB_4223
	bt QWORD [rdi],0
	jc LB_4224
	btr r12,7
	clc
	jmp LB_4225
LB_4224:
	bts r12,7
	stc
LB_4225:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4223:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_4226
	btr r12,4
	jmp LB_4227
LB_4226:
	bts r12,4
LB_4227:
LB_4228:
	cmp r15,0
	jz LB_4229
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4228
LB_4229:
; _f51 { %_4136 %_4152 } ⊢ { %_4153 %_4154 } : { %_4153 %_4154 }
 ; {>  %_4137~2':_stg %_4135~0':_stg %_4136~1':_r64 %_4138~3':_r64 %_4152~4':_r64 %_4141~6':(_lst)◂(_p3504) }
	add r14,r10
; _f4157 { %_4135 %_4153 %_4137 %_4138 %_4141 } ⊢ { %_4155 %_4156 } : { %_4155 %_4156 }
 ; {>  %_4137~2':_stg %_4135~0':_stg %_4153~1':_r64 %_4138~3':_r64 %_4141~6':(_lst)◂(_p3504) %_4154~4':_r64 }
; _f4157 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_4232
	btr r12,4
	jmp LB_4233
LB_4232:
	bts r12,4
LB_4233:
	call NS_E_4157
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4230
	btr r12,4
	clc
	jmp LB_4231
LB_4230:
	bts r12,4
	stc
LB_4231:
	add rsp,16
; ∎ { %_4155 %_4156 }
 ; {>  %_4156~1':_stg %_4155~0':_stg %_4154~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_4234
	mov rdi,r10
	call dlt
LB_4234:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4222:
MTC_LB_4159:
	mov r15,0
LB_4236:
	cmp r15,0
	jz LB_4237
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4236
LB_4237:
; ∎ { %_4135 %_4137 }
 ; {>  %_4137~2':_stg %_4135~0':_stg %_4139~4':(_lst)◂(_p3504) %_4136~1':_r64 %_4138~3':_r64 }
; 	∎ { 0' 2' }
	bt r12,4
	jc LB_4238
	mov rdi,r10
	call dlt
LB_4238:
	bt r12,1
	jc LB_4239
	mov rdi,r14
	call dlt
LB_4239:
	bt r12,3
	jc LB_4240
	mov rdi,r9
	call dlt
LB_4240:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4241
	btr r12,1
	jmp LB_4242
LB_4241:
	bts r12,1
LB_4242:
	ret
MTC_LB_4235:
NS_E_4258:
; 	|» 0'
NS_E_RDI_4258:
; » 0xr0 |~ {  } ⊢ %_4244 : %_4244
 ; {>  %_4243~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_4244
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3509 { %_4243 %_4244 } ⊢ { %_4245 %_4246 %_4247 } : { %_4245 %_4246 %_4247 }
 ; {>  %_4243~0':_stg %_4244~1':_r64 }
; _f3509 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3509
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_4259
	btr r12,4
	jmp LB_4260
LB_4259:
	bts r12,4
LB_4260:
	mov r8,r9
	bt r12,3
	jc LB_4263
	btr r12,2
	jmp LB_4264
LB_4263:
	bts r12,2
LB_4264:
	mov rsi,1
	bt r12,2
	jc LB_4261
	mov rsi,0
	bt r8,0
	jc LB_4261
	jmp LB_4262
LB_4261:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_4262:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_4265:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4266
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
	jnc LB_4267
	bt QWORD [rdi],0
	jc LB_4268
	btr r12,5
	clc
	jmp LB_4269
LB_4268:
	bts r12,5
	stc
LB_4269:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4267:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4272
	btr r12,6
	clc
	jmp LB_4273
LB_4272:
	bts r12,6
	stc
LB_4273:
	mov r9,rcx
	bt r12,6
	jc LB_4270
	btr r12,3
	jmp LB_4271
LB_4270:
	bts r12,3
LB_4271:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4276
	btr r12,6
	clc
	jmp LB_4277
LB_4276:
	bts r12,6
	stc
LB_4277:
	mov r10,rcx
	bt r12,6
	jc LB_4274
	btr r12,4
	jmp LB_4275
LB_4274:
	bts r12,4
LB_4275:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4278:
	cmp r15,0
	jz LB_4279
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4278
LB_4279:
; _f31 %_4248 ⊢ { %_4250 %_4251 } : { %_4250 %_4251 }
 ; {>  %_4248~3':_r64 %_4246~1':_r64 %_4245~0':_stg %_4249~4':(_lst)◂(_p3504) }
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
	jc LB_4286
	btr r12,0
	jmp LB_4287
LB_4286:
	bts r12,0
LB_4287:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_4288
	btr r12,2
	jmp LB_4289
LB_4288:
	bts r12,2
LB_4289:
	mov r9,r14
	bt r12,1
	jc LB_4290
	btr r12,3
	jmp LB_4291
LB_4290:
	bts r12,3
LB_4291:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4284
	btr r12,4
	clc
	jmp LB_4285
LB_4284:
	bts r12,4
	stc
LB_4285:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4282
	btr r12,1
	clc
	jmp LB_4283
LB_4282:
	bts r12,1
	stc
LB_4283:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4280
	btr r12,0
	clc
	jmp LB_4281
LB_4280:
	bts r12,0
	stc
LB_4281:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_4252 : %_4252
 ; {>  %_4251~3':_stg %_4246~1':_r64 %_4245~0':_stg %_4249~4':(_lst)◂(_p3504) %_4250~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_4252
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_4253 : %_4253
 ; {>  %_4251~3':_stg %_4246~1':_r64 %_4245~0':_stg %_4249~4':(_lst)◂(_p3504) %_4252~5':_r64 %_4250~2':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_4253
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f4157 { %_4245 %_4252 %_4251 %_4253 %_4249 } ⊢ { %_4254 %_4255 } : { %_4254 %_4255 }
 ; {>  %_4251~3':_stg %_4246~1':_r64 %_4245~0':_stg %_4249~4':(_lst)◂(_p3504) %_4253~6':_r64 %_4252~5':_r64 %_4250~2':_r64 }
; _f4157 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_4296
	btr r12,1
	jmp LB_4297
LB_4296:
	bts r12,1
LB_4297:
	mov r8,r9
	bt r12,3
	jc LB_4298
	btr r12,2
	jmp LB_4299
LB_4298:
	bts r12,2
LB_4299:
	mov r9,rcx
	bt r12,6
	jc LB_4300
	btr r12,3
	jmp LB_4301
LB_4300:
	bts r12,3
LB_4301:
	call NS_E_4157
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4302
	btr r12,3
	jmp LB_4303
LB_4302:
	bts r12,3
LB_4303:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4294
	btr r12,2
	clc
	jmp LB_4295
LB_4294:
	bts r12,2
	stc
LB_4295:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4292
	btr r12,1
	clc
	jmp LB_4293
LB_4292:
	bts r12,1
	stc
LB_4293:
	add rsp,24
; _some %_4255 ⊢ %_4256 : %_4256
 ; {>  %_4246~1':_r64 %_4255~3':_stg %_4254~0':_stg %_4250~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_4254 %_4256 }
 ; {>  %_4256~°0◂3':(_opn)◂(_stg) %_4246~1':_r64 %_4254~0':_stg %_4250~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_4304
	mov rdi,r14
	call dlt
LB_4304:
	bt r12,2
	jc LB_4305
	mov rdi,r8
	call dlt
LB_4305:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4308
	btr r12,1
	jmp LB_4309
LB_4308:
	bts r12,1
LB_4309:
	mov rsi,1
	bt r12,1
	jc LB_4306
	mov rsi,0
	bt r14,0
	jc LB_4306
	jmp LB_4307
LB_4306:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4307:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4266:
	mov r15,0
LB_4311:
	cmp r15,0
	jz LB_4312
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4311
LB_4312:
; _none {  } ⊢ %_4257 : %_4257
 ; {>  %_4247~2':(_opn)◂({ _r64 (_lst)◂(_p3504) }) %_4246~1':_r64 %_4245~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_4245 %_4257 }
 ; {>  %_4247~2':(_opn)◂({ _r64 (_lst)◂(_p3504) }) %_4246~1':_r64 %_4245~0':_stg %_4257~°1◂{  }:(_opn)◂(t1819'(0)) }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_4313
	mov rdi,r8
	call dlt
LB_4313:
	bt r12,1
	jc LB_4314
	mov rdi,r14
	call dlt
LB_4314:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_4315
	mov rsi,0
	bt r14,0
	jc LB_4315
	jmp LB_4316
LB_4315:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4316:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4310:
NS_E_4320:
NS_E_RDI_4320:
; » _^ ..
	xor rax,rax
	add rax,10
	add rax,7
	add rax,4
	add rax,6
	add rax,4
	add rax,6
	add rax,4
	add rax,3
	add rax,7
	add rax,19
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; _f4258 %_4317 ⊢ { %_4318 %_4319 } : { %_4318 %_4319 }
 ; {>  %_4317~0':_stg }
; _f4258 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_4258
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_4319~1':(_opn)◂(_stg) %_4318~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_4321
	mov rdi,r14
	call dlt
LB_4321:
	bt r12,0
	jc LB_4322
	mov rdi,r13
	call dlt
LB_4322:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4323:
NS_E_RDI_4323:
NS_E_4323_ETR_TBL:
NS_E_4323_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_4352
LB_4351:
	add r14,1
LB_4352:
	cmp r14,r10
	jge LB_4353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4351
	cmp al,10
	jz LB_4351
	cmp al,32
	jz LB_4351
LB_4353:
	push r10
	call NS_E_1389_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4354
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4344
LB_4354:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_4357
LB_4356:
	add r14,1
LB_4357:
	cmp r14,r10
	jge LB_4358
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4356
	cmp al,10
	jz LB_4356
	cmp al,32
	jz LB_4356
LB_4358:
	add r14,1
	cmp r14,r10
	jg LB_4362
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4362
	jmp LB_4363
LB_4362:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4360:
	jmp LB_4344
LB_4363:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_4365
LB_4364:
	add r14,1
LB_4365:
	cmp r14,r10
	jge LB_4366
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4364
	cmp al,10
	jz LB_4364
	cmp al,32
	jz LB_4364
LB_4366:
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4367
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4368
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4368:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4369
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4369:
	jmp LB_4344
LB_4367:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4349
	btr r12,2
	clc
	jmp LB_4350
LB_4349:
	bts r12,2
	stc
LB_4350:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4347
	btr r12,1
	clc
	jmp LB_4348
LB_4347:
	bts r12,1
	stc
LB_4348:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4345
	btr r12,0
	clc
	jmp LB_4346
LB_4345:
	bts r12,0
	stc
LB_4346:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4341
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_4371
	btr r12,3
	jmp LB_4372
LB_4371:
	bts r12,3
LB_4372:
	mov r14,r8
	bt r12,2
	jc LB_4373
	btr r12,1
	jmp LB_4374
LB_4373:
	bts r12,1
LB_4374:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1436 { %_4324 %_4325 } ⊢ %_4326 : %_4326
 ; {>  %_4325~1':_p1435 %_4324~0':_stg }
; _f1436 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4326 ⊢ %_4327 : %_4327
 ; {>  %_4326~°0◂{ 0' 1' }:_p1435 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4327
 ; {>  %_4327~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1435) }
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
	jc LB_4335
	btr r12,2
	jmp LB_4336
LB_4335:
	bts r12,2
LB_4336:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4333
	btr QWORD [rdi],0
	jmp LB_4334
LB_4333:
	bts QWORD [rdi],0
LB_4334:
	mov r8,r14
	bt r12,1
	jc LB_4339
	btr r12,2
	jmp LB_4340
LB_4339:
	bts r12,2
LB_4340:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4337
	btr QWORD [rdi],1
	jmp LB_4338
LB_4337:
	bts QWORD [rdi],1
LB_4338:
	mov rsi,1
	bt r12,3
	jc LB_4331
	mov rsi,0
	bt r9,0
	jc LB_4331
	jmp LB_4332
LB_4331:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4332:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4341:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4343
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4342
LB_4343:
	add rsp,8
	ret
LB_4344:
	add rsp,48
	pop r14
LB_4342:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4386
LB_4385:
	add r14,1
LB_4386:
	cmp r14,r10
	jge LB_4387
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4385
	cmp al,32
	jz LB_4385
LB_4387:
	push r10
	call NS_E_1389_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4388
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4382
LB_4388:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4383
	btr r12,0
	clc
	jmp LB_4384
LB_4383:
	bts r12,0
	stc
LB_4384:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4379
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1437 %_4328 ⊢ %_4329 : %_4329
 ; {>  %_4328~0':_stg }
; _f1437 0' ⊢ °1◂0'
; _some %_4329 ⊢ %_4330 : %_4330
 ; {>  %_4329~°1◂0':_p1435 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4330
 ; {>  %_4330~°0◂°1◂0':(_opn)◂(_p1435) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4377
	btr r12,3
	jmp LB_4378
LB_4377:
	bts r12,3
LB_4378:
	mov rsi,1
	bt r12,3
	jc LB_4375
	mov rsi,0
	bt r9,0
	jc LB_4375
	jmp LB_4376
LB_4375:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4376:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4379:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4381
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4380
LB_4381:
	add rsp,8
	ret
LB_4382:
	add rsp,16
	pop r14
LB_4380:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4390:
NS_E_RDI_4390:
NS_E_4390_ETR_TBL:
NS_E_4390_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4415
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4407
LB_4415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_4423
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_4423
	jmp LB_4424
LB_4423:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4421
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4421:
	jmp LB_4407
LB_4424:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4410
	btr r12,1
	clc
	jmp LB_4411
LB_4410:
	bts r12,1
	stc
LB_4411:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4408
	btr r12,0
	clc
	jmp LB_4409
LB_4408:
	bts r12,0
	stc
LB_4409:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4404
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f1556 %_4391 ⊢ %_4392 : %_4392
 ; {>  %_4391~0':_r64 }
; _f1556 0' ⊢ °0◂0'
; _some %_4392 ⊢ %_4393 : %_4393
 ; {>  %_4392~°0◂0':_p1501 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4393
 ; {>  %_4393~°0◂°0◂0':(_opn)◂(_p1501) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4402
	btr r12,3
	jmp LB_4403
LB_4402:
	bts r12,3
LB_4403:
	mov rsi,1
	bt r12,3
	jc LB_4400
	mov rsi,0
	bt r9,0
	jc LB_4400
	jmp LB_4401
LB_4400:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4401:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4404:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4406
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4405
LB_4406:
	add rsp,8
	ret
LB_4407:
	add rsp,32
	pop r14
LB_4405:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4438
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4432
LB_4438:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4433
	btr r12,0
	clc
	jmp LB_4434
LB_4433:
	bts r12,0
	stc
LB_4434:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4429
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1557 %_4394 ⊢ %_4395 : %_4395
 ; {>  %_4394~0':_stg }
; _f1557 0' ⊢ °1◂0'
; _some %_4395 ⊢ %_4396 : %_4396
 ; {>  %_4395~°1◂0':_p1501 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4396
 ; {>  %_4396~°0◂°1◂0':(_opn)◂(_p1501) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4427
	btr r12,3
	jmp LB_4428
LB_4427:
	bts r12,3
LB_4428:
	mov rsi,1
	bt r12,3
	jc LB_4425
	mov rsi,0
	bt r9,0
	jc LB_4425
	jmp LB_4426
LB_4425:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4426:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4429:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4431
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4430
LB_4431:
	add rsp,8
	ret
LB_4432:
	add rsp,16
	pop r14
LB_4430:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4453
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4447
LB_4453:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4448
	btr r12,0
	clc
	jmp LB_4449
LB_4448:
	bts r12,0
	stc
LB_4449:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4444
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1558 %_4397 ⊢ %_4398 : %_4398
 ; {>  %_4397~0':_p1435 }
; _f1558 0' ⊢ °2◂0'
; _some %_4398 ⊢ %_4399 : %_4399
 ; {>  %_4398~°2◂0':_p1501 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_4399
 ; {>  %_4399~°0◂°2◂0':(_opn)◂(_p1501) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4442
	btr r12,3
	jmp LB_4443
LB_4442:
	bts r12,3
LB_4443:
	mov rsi,1
	bt r12,3
	jc LB_4440
	mov rsi,0
	bt r9,0
	jc LB_4440
	jmp LB_4441
LB_4440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4441:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4444:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4446
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4445
LB_4446:
	add rsp,8
	ret
LB_4447:
	add rsp,16
	pop r14
LB_4445:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4456:
NS_E_RDI_4456:
NS_E_4456_ETR_TBL:
NS_E_4456_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_4463
LB_4462:
	add r14,1
LB_4463:
	cmp r14,r10
	jge LB_4464
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4462
	cmp al,32
	jz LB_4462
LB_4464:
	add r14,1
	cmp r14,r10
	jg LB_4467
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4467
	jmp LB_4468
LB_4467:
	jmp LB_4458
LB_4468:
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
LB_4473:
	jmp LB_4470
LB_4469:
	add r14,1
LB_4470:
	cmp r14,r10
	jge LB_4471
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4469
	cmp al,32
	jz LB_4469
LB_4471:
	add r14,1
	cmp r14,r10
	jg LB_4472
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4472
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
	jmp LB_4473
LB_4472:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4459
	btr QWORD [rdi],1
LB_4459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4460
	btr QWORD [rdi],0
LB_4460:
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
LB_4458:
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
NS_E_4483:
; 	|» { 0' 1' }
NS_E_RDI_4483:
MTC_LB_4484:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4485
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
	jnc LB_4486
	bt QWORD [rdi],0
	jc LB_4487
	btr r12,4
	clc
	jmp LB_4488
LB_4487:
	bts r12,4
	stc
LB_4488:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4486:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4491
	btr r12,5
	clc
	jmp LB_4492
LB_4491:
	bts r12,5
	stc
LB_4492:
	mov r8,r11
	bt r12,5
	jc LB_4489
	btr r12,2
	jmp LB_4490
LB_4489:
	bts r12,2
LB_4490:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4495
	btr r12,5
	clc
	jmp LB_4496
LB_4495:
	bts r12,5
	stc
LB_4496:
	mov r9,r11
	bt r12,5
	jc LB_4493
	btr r12,3
	jmp LB_4494
LB_4493:
	bts r12,3
LB_4494:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4497:
	cmp r15,0
	jz LB_4498
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4497
LB_4498:
; _f1553 { %_4477 %_4479 } ⊢ %_4481 : %_4481
 ; {>  %_4480~3':(_lst)◂(_p1500) %_4479~2':_p1500 %_4477~0':_p1500 }
; _f1553 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f4483 { %_4481 %_4480 } ⊢ %_4482 : %_4482
 ; {>  %_4481~°2◂{ 0' 2' }:_p1500 %_4480~3':(_lst)◂(_p1500) }
; _f4483 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4499
	btr r12,1
	jmp LB_4500
LB_4499:
	bts r12,1
LB_4500:
	mov r9,r13
	bt r12,0
	jc LB_4501
	btr r12,3
	jmp LB_4502
LB_4501:
	bts r12,3
LB_4502:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_4507
	btr r12,4
	jmp LB_4508
LB_4507:
	bts r12,4
LB_4508:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4505
	btr QWORD [rdi],0
	jmp LB_4506
LB_4505:
	bts QWORD [rdi],0
LB_4506:
	mov r10,r8
	bt r12,2
	jc LB_4511
	btr r12,4
	jmp LB_4512
LB_4511:
	bts r12,4
LB_4512:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4509
	btr QWORD [rdi],1
	jmp LB_4510
LB_4509:
	bts QWORD [rdi],1
LB_4510:
	mov rsi,1
	bt r12,0
	jc LB_4503
	mov rsi,0
	bt r13,0
	jc LB_4503
	jmp LB_4504
LB_4503:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_4504:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_4483
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_4482
 ; {>  %_4482~0':_p1500 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4485:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4513
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
	jnc LB_4514
	bt QWORD [rdi],0
	jc LB_4515
	btr r12,2
	clc
	jmp LB_4516
LB_4515:
	bts r12,2
	stc
LB_4516:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4514:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4517:
	cmp r15,0
	jz LB_4518
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4517
LB_4518:
; ∎ %_4477
 ; {>  %_4477~0':_p1500 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4513:
NS_E_4519:
NS_E_RDI_4519:
NS_E_4519_ETR_TBL:
NS_E_4519_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4566
LB_4565:
	add r14,1
LB_4566:
	cmp r14,r10
	jge LB_4567
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4565
	cmp al,10
	jz LB_4565
	cmp al,32
	jz LB_4565
LB_4567:
	add r14,1
	cmp r14,r10
	jg LB_4570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4570
	jmp LB_4571
LB_4570:
	jmp LB_4558
LB_4571:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_4573
LB_4572:
	add r14,1
LB_4573:
	cmp r14,r10
	jge LB_4574
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4572
	cmp al,10
	jz LB_4572
	cmp al,32
	jz LB_4572
LB_4574:
	push r10
	call NS_E_4520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4575
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4576
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4576:
	jmp LB_4558
LB_4575:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4579
LB_4578:
	add r14,1
LB_4579:
	cmp r14,r10
	jge LB_4580
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4578
	cmp al,10
	jz LB_4578
	cmp al,32
	jz LB_4578
LB_4580:
	add r14,1
	cmp r14,r10
	jg LB_4585
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4585
	jmp LB_4586
LB_4585:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4582
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4582:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4583
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4583:
	jmp LB_4558
LB_4586:
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
	jc LB_4563
	btr r12,2
	clc
	jmp LB_4564
LB_4563:
	bts r12,2
	stc
LB_4564:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4561
	btr r12,1
	clc
	jmp LB_4562
LB_4561:
	bts r12,1
	stc
LB_4562:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4559
	btr r12,0
	clc
	jmp LB_4560
LB_4559:
	bts r12,0
	stc
LB_4560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4555
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_4587
	btr r12,3
	jmp LB_4588
LB_4587:
	bts r12,3
LB_4588:
	mov r13,r14
	bt r12,1
	jc LB_4589
	btr r12,0
	jmp LB_4590
LB_4589:
	bts r12,0
LB_4590:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1547 %_4523 ⊢ %_4524 : %_4524
 ; {>  %_4523~0':(_lst)◂(_p1498) }
; _f1547 0' ⊢ °0◂0'
; _some %_4524 ⊢ %_4525 : %_4525
 ; {>  %_4524~°0◂0':_p1498 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4525
 ; {>  %_4525~°0◂°0◂0':(_opn)◂(_p1498) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4553
	btr r12,3
	jmp LB_4554
LB_4553:
	bts r12,3
LB_4554:
	mov rsi,1
	bt r12,3
	jc LB_4551
	mov rsi,0
	bt r9,0
	jc LB_4551
	jmp LB_4552
LB_4551:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4552:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4555:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4557
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4556
LB_4557:
	add rsp,8
	ret
LB_4558:
	add rsp,48
	pop r14
LB_4556:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_4602
LB_4601:
	add r14,1
LB_4602:
	cmp r14,r10
	jge LB_4603
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4601
	cmp al,10
	jz LB_4601
	cmp al,32
	jz LB_4601
LB_4603:
	push r10
	call NS_E_4522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4604
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4598
LB_4604:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4599
	btr r12,0
	clc
	jmp LB_4600
LB_4599:
	bts r12,0
	stc
LB_4600:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4595
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1548 %_4526 ⊢ %_4527 : %_4527
 ; {>  %_4526~0':_p1496 }
; _f1548 0' ⊢ °1◂0'
; _some %_4527 ⊢ %_4528 : %_4528
 ; {>  %_4527~°1◂0':_p1498 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4528
 ; {>  %_4528~°0◂°1◂0':(_opn)◂(_p1498) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4593
	btr r12,3
	jmp LB_4594
LB_4593:
	bts r12,3
LB_4594:
	mov rsi,1
	bt r12,3
	jc LB_4591
	mov rsi,0
	bt r9,0
	jc LB_4591
	jmp LB_4592
LB_4591:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4592:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4595:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4597
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4596
LB_4597:
	add rsp,8
	ret
LB_4598:
	add rsp,16
	pop r14
LB_4596:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4520:
NS_E_RDI_4520:
NS_E_4520_ETR_TBL:
NS_E_4520_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
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
	call NS_E_4519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4627
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4619
LB_4627:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_4630
LB_4629:
	add r14,1
LB_4630:
	cmp r14,r10
	jge LB_4631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4629
	cmp al,10
	jz LB_4629
	cmp al,32
	jz LB_4629
LB_4631:
	push r10
	call NS_E_4520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4632
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4633:
	jmp LB_4619
LB_4632:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4622
	btr r12,1
	clc
	jmp LB_4623
LB_4622:
	bts r12,1
	stc
LB_4623:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4620
	btr r12,0
	clc
	jmp LB_4621
LB_4620:
	bts r12,0
	stc
LB_4621:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4616
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4529 %_4530 } ⊢ %_4531 : %_4531
 ; {>  %_4530~1':(_lst)◂(_p1498) %_4529~0':_p1498 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4531 ⊢ %_4532 : %_4532
 ; {>  %_4531~°0◂{ 0' 1' }:(_lst)◂(_p1498) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4532
 ; {>  %_4532~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1498)) }
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
	jc LB_4610
	btr r12,2
	jmp LB_4611
LB_4610:
	bts r12,2
LB_4611:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4608
	btr QWORD [rdi],0
	jmp LB_4609
LB_4608:
	bts QWORD [rdi],0
LB_4609:
	mov r8,r14
	bt r12,1
	jc LB_4614
	btr r12,2
	jmp LB_4615
LB_4614:
	bts r12,2
LB_4615:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4612
	btr QWORD [rdi],1
	jmp LB_4613
LB_4612:
	bts QWORD [rdi],1
LB_4613:
	mov rsi,1
	bt r12,3
	jc LB_4606
	mov rsi,0
	bt r9,0
	jc LB_4606
	jmp LB_4607
LB_4606:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4607:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4616:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4618
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4617
LB_4618:
	add rsp,8
	ret
LB_4619:
	add rsp,32
	pop r14
LB_4617:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4637
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4533 : %_4533
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4533 ⊢ %_4534 : %_4534
 ; {>  %_4533~°1◂{  }:(_lst)◂(t1925'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4534
 ; {>  %_4534~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1928'(0))) }
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
	jc LB_4635
	mov rsi,0
	bt r9,0
	jc LB_4635
	jmp LB_4636
LB_4635:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4636:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4637:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4639
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4638
LB_4639:
	add rsp,8
	ret
LB_4640:
	add rsp,0
	pop r14
LB_4638:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4521:
NS_E_RDI_4521:
NS_E_4521_ETR_TBL:
NS_E_4521_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_4678
LB_4677:
	add r14,1
LB_4678:
	cmp r14,r10
	jge LB_4679
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4677
	cmp al,10
	jz LB_4677
	cmp al,32
	jz LB_4677
LB_4679:
	add r14,1
	cmp r14,r10
	jg LB_4682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4682
	jmp LB_4683
LB_4682:
	jmp LB_4656
LB_4683:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_4665
LB_4664:
	add r14,1
LB_4665:
	cmp r14,r10
	jge LB_4666
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4664
	cmp al,10
	jz LB_4664
	cmp al,32
	jz LB_4664
LB_4666:
	push r10
	call NS_E_4522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4667
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4668
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4668:
	jmp LB_4657
LB_4667:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_4671
LB_4670:
	add r14,1
LB_4671:
	cmp r14,r10
	jge LB_4672
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4670
	cmp al,10
	jz LB_4670
	cmp al,32
	jz LB_4670
LB_4672:
	push r10
	call NS_E_4521_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4673
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4674
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4674:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4675
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4675:
	jmp LB_4657
LB_4673:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4662
	btr r12,2
	clc
	jmp LB_4663
LB_4662:
	bts r12,2
	stc
LB_4663:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4660
	btr r12,1
	clc
	jmp LB_4661
LB_4660:
	bts r12,1
	stc
LB_4661:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,48
	push rdi
	push rsi
	push LB_4653
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4684
	btr r12,3
	jmp LB_4685
LB_4684:
	bts r12,3
LB_4685:
	mov r14,r8
	bt r12,2
	jc LB_4686
	btr r12,1
	jmp LB_4687
LB_4686:
	bts r12,1
LB_4687:
	mov r8,r13
	bt r12,0
	jc LB_4688
	btr r12,2
	jmp LB_4689
LB_4688:
	bts r12,2
LB_4689:
	mov r13,r9
	bt r12,3
	jc LB_4690
	btr r12,0
	jmp LB_4691
LB_4690:
	bts r12,0
LB_4691:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1548 %_4535 ⊢ %_4537 : %_4537
 ; {>  %_4535~0':_p1496 %_4536~1':(_lst)◂(_p1498) }
; _f1548 0' ⊢ °1◂0'
; _cns { %_4537 %_4536 } ⊢ %_4538 : %_4538
 ; {>  %_4536~1':(_lst)◂(_p1498) %_4537~°1◂0':_p1498 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_4538 ⊢ %_4539 : %_4539
 ; {>  %_4538~°0◂{ °1◂0' 1' }:(_lst)◂(_p1498) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_4539
 ; {>  %_4539~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p1498)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4647
	btr r12,2
	jmp LB_4648
LB_4647:
	bts r12,2
LB_4648:
	mov rsi,1
	bt r12,2
	jc LB_4645
	mov rsi,0
	bt r8,0
	jc LB_4645
	jmp LB_4646
LB_4645:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_4646:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4643
	btr QWORD [rdi],0
	jmp LB_4644
LB_4643:
	bts QWORD [rdi],0
LB_4644:
	mov r8,r14
	bt r12,1
	jc LB_4651
	btr r12,2
	jmp LB_4652
LB_4651:
	bts r12,2
LB_4652:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4649
	btr QWORD [rdi],1
	jmp LB_4650
LB_4649:
	bts QWORD [rdi],1
LB_4650:
	mov rsi,1
	bt r12,3
	jc LB_4641
	mov rsi,0
	bt r9,0
	jc LB_4641
	jmp LB_4642
LB_4641:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4642:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4653:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4655
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4654
LB_4655:
	add rsp,8
	ret
LB_4657:
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
LB_4656:
	add rsp,48
	pop r14
LB_4654:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4694
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4540 : %_4540
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4540 ⊢ %_4541 : %_4541
 ; {>  %_4540~°1◂{  }:(_lst)◂(t1939'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4541
 ; {>  %_4541~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1942'(0))) }
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
	jc LB_4692
	mov rsi,0
	bt r9,0
	jc LB_4692
	jmp LB_4693
LB_4692:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4693:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4694:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4696
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4695
LB_4696:
	add rsp,8
	ret
LB_4697:
	add rsp,0
	pop r14
LB_4695:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4522:
NS_E_RDI_4522:
NS_E_4522_ETR_TBL:
NS_E_4522_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_4713
LB_4712:
	add r14,1
LB_4713:
	cmp r14,r10
	jge LB_4714
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4712
	cmp al,10
	jz LB_4712
	cmp al,32
	jz LB_4712
LB_4714:
	add r14,2
	cmp r14,r10
	jg LB_4717
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_4717
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4717
	jmp LB_4718
LB_4717:
	jmp LB_4705
LB_4718:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_4720
LB_4719:
	add r14,1
LB_4720:
	cmp r14,r10
	jge LB_4721
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4719
	cmp al,10
	jz LB_4719
	cmp al,32
	jz LB_4719
LB_4721:
	push r10
	call NS_E_4390_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4722
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4723
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4723:
	jmp LB_4705
LB_4722:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_4726
LB_4725:
	add r14,1
LB_4726:
	cmp r14,r10
	jge LB_4727
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4725
	cmp al,10
	jz LB_4725
	cmp al,32
	jz LB_4725
LB_4727:
	add r14,1
	cmp r14,r10
	jg LB_4732
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_4732
	jmp LB_4733
LB_4732:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4729
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4729:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4730
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4730:
	jmp LB_4705
LB_4733:
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
	jc LB_4710
	btr r12,2
	clc
	jmp LB_4711
LB_4710:
	bts r12,2
	stc
LB_4711:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4708
	btr r12,1
	clc
	jmp LB_4709
LB_4708:
	bts r12,1
	stc
LB_4709:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4706
	btr r12,0
	clc
	jmp LB_4707
LB_4706:
	bts r12,0
	stc
LB_4707:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4702
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_4734
	btr r12,3
	jmp LB_4735
LB_4734:
	bts r12,3
LB_4735:
	mov r13,r14
	bt r12,1
	jc LB_4736
	btr r12,0
	jmp LB_4737
LB_4736:
	bts r12,0
LB_4737:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1543 %_4542 ⊢ %_4543 : %_4543
 ; {>  %_4542~0':_p1501 }
; _f1543 0' ⊢ °0◂0'
; _some %_4543 ⊢ %_4544 : %_4544
 ; {>  %_4543~°0◂0':_p1496 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4544
 ; {>  %_4544~°0◂°0◂0':(_opn)◂(_p1496) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4700
	btr r12,3
	jmp LB_4701
LB_4700:
	bts r12,3
LB_4701:
	mov rsi,1
	bt r12,3
	jc LB_4698
	mov rsi,0
	bt r9,0
	jc LB_4698
	jmp LB_4699
LB_4698:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4699:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4702:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4704
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4703
LB_4704:
	add rsp,8
	ret
LB_4705:
	add rsp,48
	pop r14
LB_4703:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_4762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_4762
	jmp LB_4763
LB_4762:
	jmp LB_4745
LB_4763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_1389_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4754
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4755
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4755:
	jmp LB_4746
LB_4754:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
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
	add rsp,32
	push rdi
	push rsi
	push LB_4742
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4764
	btr r12,2
	jmp LB_4765
LB_4764:
	bts r12,2
LB_4765:
	mov r13,r14
	bt r12,1
	jc LB_4766
	btr r12,0
	jmp LB_4767
LB_4766:
	bts r12,0
LB_4767:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1544 %_4545 ⊢ %_4546 : %_4546
 ; {>  %_4545~0':_stg }
; _f1544 0' ⊢ °1◂0'
; _some %_4546 ⊢ %_4547 : %_4547
 ; {>  %_4546~°1◂0':_p1496 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4547
 ; {>  %_4547~°0◂°1◂0':(_opn)◂(_p1496) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4740
	btr r12,3
	jmp LB_4741
LB_4740:
	bts r12,3
LB_4741:
	mov rsi,1
	bt r12,3
	jc LB_4738
	mov rsi,0
	bt r9,0
	jc LB_4738
	jmp LB_4739
LB_4738:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4739:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
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
LB_4745:
	add rsp,32
	pop r14
LB_4743:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4779
LB_4778:
	add r14,1
LB_4779:
	cmp r14,r10
	jge LB_4780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4778
	cmp al,10
	jz LB_4778
	cmp al,32
	jz LB_4778
LB_4780:
	push r10
	call NS_E_1389_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4781
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4775
LB_4781:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4776
	btr r12,0
	clc
	jmp LB_4777
LB_4776:
	bts r12,0
	stc
LB_4777:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4772
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1544 %_4548 ⊢ %_4549 : %_4549
 ; {>  %_4548~0':_stg }
; _f1544 0' ⊢ °1◂0'
; _some %_4549 ⊢ %_4550 : %_4550
 ; {>  %_4549~°1◂0':_p1496 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4550
 ; {>  %_4550~°0◂°1◂0':(_opn)◂(_p1496) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4770
	btr r12,3
	jmp LB_4771
LB_4770:
	bts r12,3
LB_4771:
	mov rsi,1
	bt r12,3
	jc LB_4768
	mov rsi,0
	bt r9,0
	jc LB_4768
	jmp LB_4769
LB_4768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4769:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4772:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4774
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4773
LB_4774:
	add rsp,8
	ret
LB_4775:
	add rsp,16
	pop r14
LB_4773:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4783:
NS_E_RDI_4783:
NS_E_4783_ETR_TBL:
NS_E_4783_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4833
LB_4832:
	add r14,1
LB_4833:
	cmp r14,r10
	jge LB_4834
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4832
	cmp al,10
	jz LB_4832
	cmp al,32
	jz LB_4832
LB_4834:
	add r14,1
	cmp r14,r10
	jg LB_4837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4837
	jmp LB_4838
LB_4837:
	jmp LB_4825
LB_4838:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_4840
LB_4839:
	add r14,1
LB_4840:
	cmp r14,r10
	jge LB_4841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4839
	cmp al,10
	jz LB_4839
	cmp al,32
	jz LB_4839
LB_4841:
	push r10
	call NS_E_4784_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4842
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4843:
	jmp LB_4825
LB_4842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4846
LB_4845:
	add r14,1
LB_4846:
	cmp r14,r10
	jge LB_4847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4845
	cmp al,10
	jz LB_4845
	cmp al,32
	jz LB_4845
LB_4847:
	add r14,1
	cmp r14,r10
	jg LB_4852
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4852
	jmp LB_4853
LB_4852:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4849
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4849:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4850:
	jmp LB_4825
LB_4853:
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
	jc LB_4830
	btr r12,2
	clc
	jmp LB_4831
LB_4830:
	bts r12,2
	stc
LB_4831:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4828
	btr r12,1
	clc
	jmp LB_4829
LB_4828:
	bts r12,1
	stc
LB_4829:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,48
	push rdi
	push rsi
	push LB_4822
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_4854
	btr r12,3
	jmp LB_4855
LB_4854:
	bts r12,3
LB_4855:
	mov r13,r14
	bt r12,1
	jc LB_4856
	btr r12,0
	jmp LB_4857
LB_4856:
	bts r12,0
LB_4857:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1549 %_4789 ⊢ %_4790 : %_4790
 ; {>  %_4789~0':(_lst)◂(_p1499) }
; _f1549 0' ⊢ °0◂0'
; _some %_4790 ⊢ %_4791 : %_4791
 ; {>  %_4790~°0◂0':_p1499 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4791
 ; {>  %_4791~°0◂°0◂0':(_opn)◂(_p1499) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
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
	mov rax,0x0000_0000_0000_0001
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
	add rsp,48
	pop r14
LB_4823:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_4869
LB_4868:
	add r14,1
LB_4869:
	cmp r14,r10
	jge LB_4870
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4868
	cmp al,10
	jz LB_4868
	cmp al,32
	jz LB_4868
LB_4870:
	push r10
	call NS_E_4788_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4871
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4865
LB_4871:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4866
	btr r12,0
	clc
	jmp LB_4867
LB_4866:
	bts r12,0
	stc
LB_4867:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4862
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1550 %_4792 ⊢ %_4793 : %_4793
 ; {>  %_4792~0':_p1497 }
; _f1550 0' ⊢ °1◂0'
; _some %_4793 ⊢ %_4794 : %_4794
 ; {>  %_4793~°1◂0':_p1499 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4794
 ; {>  %_4794~°0◂°1◂0':(_opn)◂(_p1499) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4860
	btr r12,3
	jmp LB_4861
LB_4860:
	bts r12,3
LB_4861:
	mov rsi,1
	bt r12,3
	jc LB_4858
	mov rsi,0
	bt r9,0
	jc LB_4858
	jmp LB_4859
LB_4858:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4859:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4862:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4864
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4863
LB_4864:
	add rsp,8
	ret
LB_4865:
	add rsp,16
	pop r14
LB_4863:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4784:
NS_E_RDI_4784:
NS_E_4784_ETR_TBL:
NS_E_4784_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
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
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4894
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4886
LB_4894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_4897
LB_4896:
	add r14,1
LB_4897:
	cmp r14,r10
	jge LB_4898
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4896
	cmp al,10
	jz LB_4896
	cmp al,32
	jz LB_4896
LB_4898:
	push r10
	call NS_E_4784_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4899
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4900
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4900:
	jmp LB_4886
LB_4899:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4889
	btr r12,1
	clc
	jmp LB_4890
LB_4889:
	bts r12,1
	stc
LB_4890:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4887
	btr r12,0
	clc
	jmp LB_4888
LB_4887:
	bts r12,0
	stc
LB_4888:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4883
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4795 %_4796 } ⊢ %_4797 : %_4797
 ; {>  %_4796~1':(_lst)◂(_p1499) %_4795~0':_p1499 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4797 ⊢ %_4798 : %_4798
 ; {>  %_4797~°0◂{ 0' 1' }:(_lst)◂(_p1499) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4798
 ; {>  %_4798~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1499)) }
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
	jc LB_4877
	btr r12,2
	jmp LB_4878
LB_4877:
	bts r12,2
LB_4878:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4875
	btr QWORD [rdi],0
	jmp LB_4876
LB_4875:
	bts QWORD [rdi],0
LB_4876:
	mov r8,r14
	bt r12,1
	jc LB_4881
	btr r12,2
	jmp LB_4882
LB_4881:
	bts r12,2
LB_4882:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4879
	btr QWORD [rdi],1
	jmp LB_4880
LB_4879:
	bts QWORD [rdi],1
LB_4880:
	mov rsi,1
	bt r12,3
	jc LB_4873
	mov rsi,0
	bt r9,0
	jc LB_4873
	jmp LB_4874
LB_4873:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4874:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4883:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4885
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4884
LB_4885:
	add rsp,8
	ret
LB_4886:
	add rsp,32
	pop r14
LB_4884:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4904
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4799 : %_4799
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4799 ⊢ %_4800 : %_4800
 ; {>  %_4799~°1◂{  }:(_lst)◂(t2027'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4800
 ; {>  %_4800~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2030'(0))) }
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
	jc LB_4902
	mov rsi,0
	bt r9,0
	jc LB_4902
	jmp LB_4903
LB_4902:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4903:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4904:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4906
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4905
LB_4906:
	add rsp,8
	ret
LB_4907:
	add rsp,0
	pop r14
LB_4905:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4786:
NS_E_RDI_4786:
NS_E_4786_ETR_TBL:
NS_E_4786_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_4930
LB_4929:
	add r14,1
LB_4930:
	cmp r14,r10
	jge LB_4931
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4929
	cmp al,10
	jz LB_4929
	cmp al,32
	jz LB_4929
LB_4931:
	add r14,1
	cmp r14,r10
	jg LB_4934
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4934
	jmp LB_4935
LB_4934:
	jmp LB_4908
LB_4935:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_4917
LB_4916:
	add r14,1
LB_4917:
	cmp r14,r10
	jge LB_4918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4916
	cmp al,10
	jz LB_4916
	cmp al,32
	jz LB_4916
LB_4918:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4919
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4920
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4920:
	jmp LB_4909
LB_4919:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_4923
LB_4922:
	add r14,1
LB_4923:
	cmp r14,r10
	jge LB_4924
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4922
	cmp al,10
	jz LB_4922
	cmp al,32
	jz LB_4922
LB_4924:
	push r10
	call NS_E_4786_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4925
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4926
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4926:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4927
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4927:
	jmp LB_4909
LB_4925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4912
	btr QWORD [rdi],2
LB_4912:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4913
	btr QWORD [rdi],1
LB_4913:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4914
	btr QWORD [rdi],0
LB_4914:
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
LB_4909:
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
LB_4908:
	add rsp,48
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
LB_4910:
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
NS_E_4787:
NS_E_RDI_4787:
NS_E_4787_ETR_TBL:
NS_E_4787_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_4973
LB_4972:
	add r14,1
LB_4973:
	cmp r14,r10
	jge LB_4974
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4972
	cmp al,10
	jz LB_4972
	cmp al,32
	jz LB_4972
LB_4974:
	add r14,1
	cmp r14,r10
	jg LB_4977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4977
	jmp LB_4978
LB_4977:
	jmp LB_4951
LB_4978:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_4960
LB_4959:
	add r14,1
LB_4960:
	cmp r14,r10
	jge LB_4961
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4959
	cmp al,10
	jz LB_4959
	cmp al,32
	jz LB_4959
LB_4961:
	push r10
	call NS_E_4788_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4962
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4963
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4963:
	jmp LB_4952
LB_4962:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_4966
LB_4965:
	add r14,1
LB_4966:
	cmp r14,r10
	jge LB_4967
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4965
	cmp al,10
	jz LB_4965
	cmp al,32
	jz LB_4965
LB_4967:
	push r10
	call NS_E_4787_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4968
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4969
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4969:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4970
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4970:
	jmp LB_4952
LB_4968:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4957
	btr r12,2
	clc
	jmp LB_4958
LB_4957:
	bts r12,2
	stc
LB_4958:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4955
	btr r12,1
	clc
	jmp LB_4956
LB_4955:
	bts r12,1
	stc
LB_4956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4953
	btr r12,0
	clc
	jmp LB_4954
LB_4953:
	bts r12,0
	stc
LB_4954:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4948
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4979
	btr r12,3
	jmp LB_4980
LB_4979:
	bts r12,3
LB_4980:
	mov r14,r8
	bt r12,2
	jc LB_4981
	btr r12,1
	jmp LB_4982
LB_4981:
	bts r12,1
LB_4982:
	mov r8,r13
	bt r12,0
	jc LB_4983
	btr r12,2
	jmp LB_4984
LB_4983:
	bts r12,2
LB_4984:
	mov r13,r9
	bt r12,3
	jc LB_4985
	btr r12,0
	jmp LB_4986
LB_4985:
	bts r12,0
LB_4986:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1550 %_4803 ⊢ %_4805 : %_4805
 ; {>  %_4804~1':(_lst)◂(_p1499) %_4803~0':_p1497 }
; _f1550 0' ⊢ °1◂0'
; _cns { %_4805 %_4804 } ⊢ %_4806 : %_4806
 ; {>  %_4804~1':(_lst)◂(_p1499) %_4805~°1◂0':_p1499 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_4806 ⊢ %_4807 : %_4807
 ; {>  %_4806~°0◂{ °1◂0' 1' }:(_lst)◂(_p1499) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_4807
 ; {>  %_4807~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p1499)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4942
	btr r12,2
	jmp LB_4943
LB_4942:
	bts r12,2
LB_4943:
	mov rsi,1
	bt r12,2
	jc LB_4940
	mov rsi,0
	bt r8,0
	jc LB_4940
	jmp LB_4941
LB_4940:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_4941:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4938
	btr QWORD [rdi],0
	jmp LB_4939
LB_4938:
	bts QWORD [rdi],0
LB_4939:
	mov r8,r14
	bt r12,1
	jc LB_4946
	btr r12,2
	jmp LB_4947
LB_4946:
	bts r12,2
LB_4947:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4944
	btr QWORD [rdi],1
	jmp LB_4945
LB_4944:
	bts QWORD [rdi],1
LB_4945:
	mov rsi,1
	bt r12,3
	jc LB_4936
	mov rsi,0
	bt r9,0
	jc LB_4936
	jmp LB_4937
LB_4936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4937:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4948:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4950
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4949
LB_4950:
	add rsp,8
	ret
LB_4952:
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
LB_4951:
	add rsp,48
	pop r14
LB_4949:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4989
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4808 : %_4808
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4808 ⊢ %_4809 : %_4809
 ; {>  %_4808~°1◂{  }:(_lst)◂(t2041'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4809
 ; {>  %_4809~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2044'(0))) }
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
	jc LB_4987
	mov rsi,0
	bt r9,0
	jc LB_4987
	jmp LB_4988
LB_4987:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4988:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4989:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4991
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4990
LB_4991:
	add rsp,8
	ret
LB_4992:
	add rsp,0
	pop r14
LB_4990:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4788:
NS_E_RDI_4788:
NS_E_4788_ETR_TBL:
NS_E_4788_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_5017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_5017
	jmp LB_5018
LB_5017:
	jmp LB_5000
LB_5018:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5009
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5010
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5010:
	jmp LB_5001
LB_5009:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5004
	btr r12,1
	clc
	jmp LB_5005
LB_5004:
	bts r12,1
	stc
LB_5005:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5002
	btr r12,0
	clc
	jmp LB_5003
LB_5002:
	bts r12,0
	stc
LB_5003:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4997
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5019
	btr r12,2
	jmp LB_5020
LB_5019:
	bts r12,2
LB_5020:
	mov r13,r14
	bt r12,1
	jc LB_5021
	btr r12,0
	jmp LB_5022
LB_5021:
	bts r12,0
LB_5022:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1546 %_4810 ⊢ %_4811 : %_4811
 ; {>  %_4810~0':_stg }
; _f1546 0' ⊢ °1◂0'
; _some %_4811 ⊢ %_4812 : %_4812
 ; {>  %_4811~°1◂0':_p1497 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4812
 ; {>  %_4812~°0◂°1◂0':(_opn)◂(_p1497) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4995
	btr r12,3
	jmp LB_4996
LB_4995:
	bts r12,3
LB_4996:
	mov rsi,1
	bt r12,3
	jc LB_4993
	mov rsi,0
	bt r9,0
	jc LB_4993
	jmp LB_4994
LB_4993:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4994:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4997:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4999
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4998
LB_4999:
	add rsp,8
	ret
LB_5001:
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
LB_5000:
	add rsp,32
	pop r14
LB_4998:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5036
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5030
LB_5036:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5031
	btr r12,0
	clc
	jmp LB_5032
LB_5031:
	bts r12,0
	stc
LB_5032:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5027
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1546 %_4813 ⊢ %_4814 : %_4814
 ; {>  %_4813~0':_stg }
; _f1546 0' ⊢ °1◂0'
; _some %_4814 ⊢ %_4815 : %_4815
 ; {>  %_4814~°1◂0':_p1497 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4815
 ; {>  %_4815~°0◂°1◂0':(_opn)◂(_p1497) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5025
	btr r12,3
	jmp LB_5026
LB_5025:
	bts r12,3
LB_5026:
	mov rsi,1
	bt r12,3
	jc LB_5023
	mov rsi,0
	bt r9,0
	jc LB_5023
	jmp LB_5024
LB_5023:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5024:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5027:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5029
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5028
LB_5029:
	add rsp,8
	ret
LB_5030:
	add rsp,16
	pop r14
LB_5028:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_5051
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5051
	jmp LB_5052
LB_5051:
	jmp LB_5043
LB_5052:
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
	jc LB_5044
	btr r12,0
	clc
	jmp LB_5045
LB_5044:
	bts r12,0
	stc
LB_5045:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5040
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f1545 {  } ⊢ %_4816 : %_4816
 ; {>  }
; _f1545 {  } ⊢ °0◂{  }
; _some %_4816 ⊢ %_4817 : %_4817
 ; {>  %_4816~°0◂{  }:_p1497 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_4817
 ; {>  %_4817~°0◂°0◂{  }:(_opn)◂(_p1497) }
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
	jc LB_5038
	mov rsi,0
	bt r9,0
	jc LB_5038
	jmp LB_5039
LB_5038:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5039:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5040:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5042
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5041
LB_5042:
	add rsp,8
	ret
LB_5043:
	add rsp,16
	pop r14
LB_5041:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5053:
NS_E_RDI_5053:
NS_E_5053_ETR_TBL:
NS_E_5053_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_5131
LB_5130:
	add r14,1
LB_5131:
	cmp r14,r10
	jge LB_5132
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5130
	cmp al,10
	jz LB_5130
	cmp al,32
	jz LB_5130
LB_5132:
	push r10
	call NS_E_5056_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5133
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5123
LB_5133:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_5136
LB_5135:
	add r14,1
LB_5136:
	cmp r14,r10
	jge LB_5137
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5135
	cmp al,10
	jz LB_5135
	cmp al,32
	jz LB_5135
LB_5137:
	push r10
	call NS_E_5055_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5138
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5139
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5139:
	jmp LB_5123
LB_5138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_5142
LB_5141:
	add r14,1
LB_5142:
	cmp r14,r10
	jge LB_5143
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5141
	cmp al,10
	jz LB_5141
	cmp al,32
	jz LB_5141
LB_5143:
	push r10
	call NS_E_5054_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5144
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5145
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5145:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5146
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5146:
	jmp LB_5123
LB_5144:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5128
	btr r12,2
	clc
	jmp LB_5129
LB_5128:
	bts r12,2
	stc
LB_5129:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5126
	btr r12,1
	clc
	jmp LB_5127
LB_5126:
	bts r12,1
	stc
LB_5127:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5124
	btr r12,0
	clc
	jmp LB_5125
LB_5124:
	bts r12,0
	stc
LB_5125:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5120
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f4483 { %_5058 %_5059 } ⊢ %_5061 : %_5061
 ; {>  %_5058~0':_p1500 %_5060~2':(_opn)◂(_p1500) %_5059~1':(_lst)◂(_p1500) }
; _f4483 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4483
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_5091
	btr r12,2
	clc
	jmp LB_5092
LB_5091:
	bts r12,2
	stc
LB_5092:
	add rsp,16
MTC_LB_5093:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5094
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
	jnc LB_5095
	bt QWORD [rdi],0
	jc LB_5096
	btr r12,3
	clc
	jmp LB_5097
LB_5096:
	bts r12,3
	stc
LB_5097:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5095:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_5098
	btr r12,1
	jmp LB_5099
LB_5098:
	bts r12,1
LB_5099:
LB_5100:
	cmp r15,0
	jz LB_5101
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5100
LB_5101:
; _f1552 { %_5061 %_5062 } ⊢ %_5063 : %_5063
 ; {>  %_5061~0':_p1500 %_5062~1':_p1500 }
; _f1552 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5063 ⊢ %_5064 : %_5064
 ; {>  %_5063~°1◂{ 0' 1' }:_p1500 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5064
 ; {>  %_5064~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1500) }
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
	jc LB_5106
	btr r12,2
	jmp LB_5107
LB_5106:
	bts r12,2
LB_5107:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5104
	btr QWORD [rdi],0
	jmp LB_5105
LB_5104:
	bts QWORD [rdi],0
LB_5105:
	mov r8,r14
	bt r12,1
	jc LB_5110
	btr r12,2
	jmp LB_5111
LB_5110:
	bts r12,2
LB_5111:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5108
	btr QWORD [rdi],1
	jmp LB_5109
LB_5108:
	bts QWORD [rdi],1
LB_5109:
	mov rsi,1
	bt r12,3
	jc LB_5102
	mov rsi,0
	bt r9,0
	jc LB_5102
	jmp LB_5103
LB_5102:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5103:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_5094:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_5112
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
	jnc LB_5113
	bt QWORD [rdi],0
	jc LB_5114
	btr r12,1
	clc
	jmp LB_5115
LB_5114:
	bts r12,1
	stc
LB_5115:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5113:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5116:
	cmp r15,0
	jz LB_5117
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5116
LB_5117:
; _some %_5061 ⊢ %_5065 : %_5065
 ; {>  %_5061~0':_p1500 }
; _some 0' ⊢ °0◂0'
; ∎ %_5065
 ; {>  %_5065~°0◂0':(_opn)◂(_p1500) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5118
	btr r12,3
	jmp LB_5119
LB_5118:
	bts r12,3
LB_5119:
	mov r8,0
	bts r12,2
	ret
MTC_LB_5112:
LB_5120:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5122
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5121
LB_5122:
	add rsp,8
	ret
LB_5123:
	add rsp,48
	pop r14
LB_5121:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5054:
NS_E_RDI_5054:
NS_E_5054_ETR_TBL:
NS_E_5054_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_5161
LB_5160:
	add r14,1
LB_5161:
	cmp r14,r10
	jge LB_5162
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5160
	cmp al,10
	jz LB_5160
	cmp al,32
	jz LB_5160
LB_5162:
	add r14,3
	cmp r14,r10
	jg LB_5165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_5165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_5165
	jmp LB_5166
LB_5165:
	jmp LB_5155
LB_5166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_5168
LB_5167:
	add r14,1
LB_5168:
	cmp r14,r10
	jge LB_5169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5167
	cmp al,10
	jz LB_5167
	cmp al,32
	jz LB_5167
LB_5169:
	push r10
	call NS_E_5053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5170
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5171
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5171:
	jmp LB_5155
LB_5170:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5158
	btr r12,1
	clc
	jmp LB_5159
LB_5158:
	bts r12,1
	stc
LB_5159:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5156
	btr r12,0
	clc
	jmp LB_5157
LB_5156:
	bts r12,0
	stc
LB_5157:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5152
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5173
	btr r12,2
	jmp LB_5174
LB_5173:
	bts r12,2
LB_5174:
	mov r13,r14
	bt r12,1
	jc LB_5175
	btr r12,0
	jmp LB_5176
LB_5175:
	bts r12,0
LB_5176:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5066 ⊢ %_5067 : %_5067
 ; {>  %_5066~0':_p1500 }
; _some 0' ⊢ °0◂0'
; _some %_5067 ⊢ %_5068 : %_5068
 ; {>  %_5067~°0◂0':(_opn)◂(_p1500) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5068
 ; {>  %_5068~°0◂°0◂0':(_opn)◂((_opn)◂(_p1500)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5150
	btr r12,3
	jmp LB_5151
LB_5150:
	bts r12,3
LB_5151:
	mov rsi,1
	bt r12,3
	jc LB_5148
	mov rsi,0
	bt r9,0
	jc LB_5148
	jmp LB_5149
LB_5148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5149:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5152:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5154
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5153
LB_5154:
	add rsp,8
	ret
LB_5155:
	add rsp,32
	pop r14
LB_5153:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5179
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_5069 : %_5069
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5069 ⊢ %_5070 : %_5070
 ; {>  %_5069~°1◂{  }:(_opn)◂(t2135'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5070
 ; {>  %_5070~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2138'(0))) }
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
	jc LB_5177
	mov rsi,0
	bt r9,0
	jc LB_5177
	jmp LB_5178
LB_5177:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5178:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5179:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5181
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5180
LB_5181:
	add rsp,8
	ret
LB_5182:
	add rsp,0
	pop r14
LB_5180:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5055:
NS_E_RDI_5055:
NS_E_5055_ETR_TBL:
NS_E_5055_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_5204
LB_5203:
	add r14,1
LB_5204:
	cmp r14,r10
	jge LB_5205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5203
	cmp al,10
	jz LB_5203
	cmp al,32
	jz LB_5203
LB_5205:
	add r14,3
	cmp r14,r10
	jg LB_5208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_5208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_5208
	jmp LB_5209
LB_5208:
	jmp LB_5196
LB_5209:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_5211
LB_5210:
	add r14,1
LB_5211:
	cmp r14,r10
	jge LB_5212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5210
	cmp al,10
	jz LB_5210
	cmp al,32
	jz LB_5210
LB_5212:
	push r10
	call NS_E_5056_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5213
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5214
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5214:
	jmp LB_5196
LB_5213:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_5217
LB_5216:
	add r14,1
LB_5217:
	cmp r14,r10
	jge LB_5218
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5216
	cmp al,10
	jz LB_5216
	cmp al,32
	jz LB_5216
LB_5218:
	push r10
	call NS_E_5055_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5219
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5220
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5220:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5221
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5221:
	jmp LB_5196
LB_5219:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5201
	btr r12,2
	clc
	jmp LB_5202
LB_5201:
	bts r12,2
	stc
LB_5202:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5199
	btr r12,1
	clc
	jmp LB_5200
LB_5199:
	bts r12,1
	stc
LB_5200:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5197
	btr r12,0
	clc
	jmp LB_5198
LB_5197:
	bts r12,0
	stc
LB_5198:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5193
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5223
	btr r12,3
	jmp LB_5224
LB_5223:
	bts r12,3
LB_5224:
	mov r14,r8
	bt r12,2
	jc LB_5225
	btr r12,1
	jmp LB_5226
LB_5225:
	bts r12,1
LB_5226:
	mov r8,r13
	bt r12,0
	jc LB_5227
	btr r12,2
	jmp LB_5228
LB_5227:
	bts r12,2
LB_5228:
	mov r13,r9
	bt r12,3
	jc LB_5229
	btr r12,0
	jmp LB_5230
LB_5229:
	bts r12,0
LB_5230:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5071 %_5072 } ⊢ %_5073 : %_5073
 ; {>  %_5071~0':_p1500 %_5072~1':(_lst)◂(_p1500) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5073 ⊢ %_5074 : %_5074
 ; {>  %_5073~°0◂{ 0' 1' }:(_lst)◂(_p1500) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5074
 ; {>  %_5074~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1500)) }
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
	jc LB_5187
	btr r12,2
	jmp LB_5188
LB_5187:
	bts r12,2
LB_5188:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5185
	btr QWORD [rdi],0
	jmp LB_5186
LB_5185:
	bts QWORD [rdi],0
LB_5186:
	mov r8,r14
	bt r12,1
	jc LB_5191
	btr r12,2
	jmp LB_5192
LB_5191:
	bts r12,2
LB_5192:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5189
	btr QWORD [rdi],1
	jmp LB_5190
LB_5189:
	bts QWORD [rdi],1
LB_5190:
	mov rsi,1
	bt r12,3
	jc LB_5183
	mov rsi,0
	bt r9,0
	jc LB_5183
	jmp LB_5184
LB_5183:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5184:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5193:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5195
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5194
LB_5195:
	add rsp,8
	ret
LB_5196:
	add rsp,48
	pop r14
LB_5194:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5233
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_5075 : %_5075
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5075 ⊢ %_5076 : %_5076
 ; {>  %_5075~°1◂{  }:(_lst)◂(t2148'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5076
 ; {>  %_5076~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2151'(0))) }
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
	jc LB_5231
	mov rsi,0
	bt r9,0
	jc LB_5231
	jmp LB_5232
LB_5231:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5232:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5233:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5235
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5234
LB_5235:
	add rsp,8
	ret
LB_5236:
	add rsp,0
	pop r14
LB_5234:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5056:
NS_E_RDI_5056:
NS_E_5056_ETR_TBL:
NS_E_5056_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
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
	add r14,1
	cmp r14,r10
	jg LB_5256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_5256
	jmp LB_5257
LB_5256:
	jmp LB_5244
LB_5257:
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
LB_5262:
	jmp LB_5259
LB_5258:
	add r14,1
LB_5259:
	cmp r14,r10
	jge LB_5260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5258
	cmp al,10
	jz LB_5258
	cmp al,32
	jz LB_5258
LB_5260:
	push r10
	push rsi
	call NS_E_5053_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5261
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5263
	bts QWORD [rax],0
LB_5263:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5262
LB_5261:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_5265
LB_5264:
	add r14,1
LB_5265:
	cmp r14,r10
	jge LB_5266
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5264
	cmp al,10
	jz LB_5264
	cmp al,32
	jz LB_5264
LB_5266:
	add r14,1
	cmp r14,r10
	jg LB_5271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_5271
	jmp LB_5272
LB_5271:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5268
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5268:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5269
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5269:
	jmp LB_5244
LB_5272:
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
	jc LB_5249
	btr r12,2
	clc
	jmp LB_5250
LB_5249:
	bts r12,2
	stc
LB_5250:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5247
	btr r12,1
	clc
	jmp LB_5248
LB_5247:
	bts r12,1
	stc
LB_5248:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5245
	btr r12,0
	clc
	jmp LB_5246
LB_5245:
	bts r12,0
	stc
LB_5246:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5241
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5273
	btr r12,3
	jmp LB_5274
LB_5273:
	bts r12,3
LB_5274:
	mov r13,r14
	bt r12,1
	jc LB_5275
	btr r12,0
	jmp LB_5276
LB_5275:
	bts r12,0
LB_5276:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f821 %_5077 ⊢ %_5078 : %_5078
 ; {>  %_5077~0':(_lst)◂(_p1500) }
; _f821 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_821
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f1551 %_5078 ⊢ %_5079 : %_5079
 ; {>  %_5078~0':(_lst)◂(_p1500) }
; _f1551 0' ⊢ °0◂0'
; _some %_5079 ⊢ %_5080 : %_5080
 ; {>  %_5079~°0◂0':_p1500 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5080
 ; {>  %_5080~°0◂°0◂0':(_opn)◂(_p1500) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5239
	btr r12,3
	jmp LB_5240
LB_5239:
	bts r12,3
LB_5240:
	mov rsi,1
	bt r12,3
	jc LB_5237
	mov rsi,0
	bt r9,0
	jc LB_5237
	jmp LB_5238
LB_5237:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5238:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5241:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5243
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5242
LB_5243:
	add rsp,8
	ret
LB_5244:
	add rsp,48
	pop r14
LB_5242:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_5290
LB_5289:
	add r14,1
LB_5290:
	cmp r14,r10
	jge LB_5291
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5289
	cmp al,10
	jz LB_5289
	cmp al,32
	jz LB_5289
LB_5291:
	add r14,1
	cmp r14,r10
	jg LB_5294
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_5294
	jmp LB_5295
LB_5294:
	jmp LB_5282
LB_5295:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_5297
LB_5296:
	add r14,1
LB_5297:
	cmp r14,r10
	jge LB_5298
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5296
	cmp al,10
	jz LB_5296
	cmp al,32
	jz LB_5296
LB_5298:
	push r10
	call NS_E_5053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5299
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5300
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5300:
	jmp LB_5282
LB_5299:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_5303
LB_5302:
	add r14,1
LB_5303:
	cmp r14,r10
	jge LB_5304
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5302
	cmp al,10
	jz LB_5302
	cmp al,32
	jz LB_5302
LB_5304:
	add r14,1
	cmp r14,r10
	jg LB_5309
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_5309
	jmp LB_5310
LB_5309:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5306
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5306:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5307
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5307:
	jmp LB_5282
LB_5310:
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
	jc LB_5287
	btr r12,2
	clc
	jmp LB_5288
LB_5287:
	bts r12,2
	stc
LB_5288:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5285
	btr r12,1
	clc
	jmp LB_5286
LB_5285:
	bts r12,1
	stc
LB_5286:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5283
	btr r12,0
	clc
	jmp LB_5284
LB_5283:
	bts r12,0
	stc
LB_5284:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5279
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5311
	btr r12,3
	jmp LB_5312
LB_5311:
	bts r12,3
LB_5312:
	mov r13,r14
	bt r12,1
	jc LB_5313
	btr r12,0
	jmp LB_5314
LB_5313:
	bts r12,0
LB_5314:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5081 ⊢ %_5082 : %_5082
 ; {>  %_5081~0':_p1500 }
; _some 0' ⊢ °0◂0'
; ∎ %_5082
 ; {>  %_5082~°0◂0':(_opn)◂(_p1500) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5277
	btr r12,3
	jmp LB_5278
LB_5277:
	bts r12,3
LB_5278:
	mov r8,0
	bts r12,2
	ret
LB_5279:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5281
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5280
LB_5281:
	add rsp,8
	ret
LB_5282:
	add rsp,48
	pop r14
LB_5280:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_5326
LB_5325:
	add r14,1
LB_5326:
	cmp r14,r10
	jge LB_5327
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5325
	cmp al,10
	jz LB_5325
	cmp al,32
	jz LB_5325
LB_5327:
	push r10
	call NS_E_5057_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5328
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5322
LB_5328:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5323
	btr r12,0
	clc
	jmp LB_5324
LB_5323:
	bts r12,0
	stc
LB_5324:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5319
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1555 %_5083 ⊢ %_5084 : %_5084
 ; {>  %_5083~0':_stg }
; _f1555 0' ⊢ °4◂0'
; _some %_5084 ⊢ %_5085 : %_5085
 ; {>  %_5084~°4◂0':_p1500 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_5085
 ; {>  %_5085~°0◂°4◂0':(_opn)◂(_p1500) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5317
	btr r12,3
	jmp LB_5318
LB_5317:
	bts r12,3
LB_5318:
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
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5319:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5321
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5320
LB_5321:
	add rsp,8
	ret
LB_5322:
	add rsp,16
	pop r14
LB_5320:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_5341
LB_5340:
	add r14,1
LB_5341:
	cmp r14,r10
	jge LB_5342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5340
	cmp al,10
	jz LB_5340
	cmp al,32
	jz LB_5340
LB_5342:
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5343
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5337
LB_5343:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5338
	btr r12,0
	clc
	jmp LB_5339
LB_5338:
	bts r12,0
	stc
LB_5339:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5334
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1554 %_5086 ⊢ %_5087 : %_5087
 ; {>  %_5086~0':_p1435 }
; _f1554 0' ⊢ °3◂0'
; _some %_5087 ⊢ %_5088 : %_5088
 ; {>  %_5087~°3◂0':_p1500 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_5088
 ; {>  %_5088~°0◂°3◂0':(_opn)◂(_p1500) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5332
	btr r12,3
	jmp LB_5333
LB_5332:
	bts r12,3
LB_5333:
	mov rsi,1
	bt r12,3
	jc LB_5330
	mov rsi,0
	bt r9,0
	jc LB_5330
	jmp LB_5331
LB_5330:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5331:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5334:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5336
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5335
LB_5336:
	add rsp,8
	ret
LB_5337:
	add rsp,16
	pop r14
LB_5335:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5057:
NS_E_RDI_5057:
NS_E_5057_ETR_TBL:
NS_E_5057_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5358
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5350
LB_5358:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_5366
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_5366
	jmp LB_5367
LB_5366:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5364
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5364:
	jmp LB_5350
LB_5367:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5353
	btr r12,1
	clc
	jmp LB_5354
LB_5353:
	bts r12,1
	stc
LB_5354:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5351
	btr r12,0
	clc
	jmp LB_5352
LB_5351:
	bts r12,0
	stc
LB_5352:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5347
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5089 ⊢ %_5090 : %_5090
 ; {>  %_5089~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5090
 ; {>  %_5090~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5345
	btr r12,3
	jmp LB_5346
LB_5345:
	bts r12,3
LB_5346:
	mov r8,0
	bts r12,2
	ret
LB_5347:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5349
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5348
LB_5349:
	add rsp,8
	ret
LB_5350:
	add rsp,32
	pop r14
LB_5348:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5368:
NS_E_RDI_5368:
NS_E_5368_ETR_TBL:
NS_E_5368_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_5783
LB_5782:
	add r14,1
LB_5783:
	cmp r14,r10
	jge LB_5784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5782
	cmp al,10
	jz LB_5782
	cmp al,32
	jz LB_5782
LB_5784:
	push r10
	call NS_E_5369_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5785
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5777
LB_5785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_5788
LB_5787:
	add r14,1
LB_5788:
	cmp r14,r10
	jge LB_5789
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5787
	cmp al,10
	jz LB_5787
	cmp al,32
	jz LB_5787
LB_5789:
	push r10
	call NS_E_5368_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5790
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5791
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5791:
	jmp LB_5777
LB_5790:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5780
	btr r12,1
	clc
	jmp LB_5781
LB_5780:
	bts r12,1
	stc
LB_5781:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5778
	btr r12,0
	clc
	jmp LB_5779
LB_5778:
	bts r12,0
	stc
LB_5779:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5774
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_5409 %_5410 } ⊢ %_5411 : %_5411
 ; {>  %_5410~1':(_lst)◂(_p1483) %_5409~0':_p1483 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5411 ⊢ %_5412 : %_5412
 ; {>  %_5411~°0◂{ 0' 1' }:(_lst)◂(_p1483) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5412
 ; {>  %_5412~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1483)) }
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
	jc LB_5768
	btr r12,2
	jmp LB_5769
LB_5768:
	bts r12,2
LB_5769:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5766
	btr QWORD [rdi],0
	jmp LB_5767
LB_5766:
	bts QWORD [rdi],0
LB_5767:
	mov r8,r14
	bt r12,1
	jc LB_5772
	btr r12,2
	jmp LB_5773
LB_5772:
	bts r12,2
LB_5773:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5770
	btr QWORD [rdi],1
	jmp LB_5771
LB_5770:
	bts QWORD [rdi],1
LB_5771:
	mov rsi,1
	bt r12,3
	jc LB_5764
	mov rsi,0
	bt r9,0
	jc LB_5764
	jmp LB_5765
LB_5764:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5765:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5774:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5776
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5775
LB_5776:
	add rsp,8
	ret
LB_5777:
	add rsp,32
	pop r14
LB_5775:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5795
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_5413 : %_5413
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5413 ⊢ %_5414 : %_5414
 ; {>  %_5413~°1◂{  }:(_lst)◂(t2278'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5414
 ; {>  %_5414~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2281'(0))) }
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
	jc LB_5793
	mov rsi,0
	bt r9,0
	jc LB_5793
	jmp LB_5794
LB_5793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5794:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5795:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5797
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5796
LB_5797:
	add rsp,8
	ret
LB_5798:
	add rsp,0
	pop r14
LB_5796:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5369:
NS_E_RDI_5369:
NS_E_5369_ETR_TBL:
NS_E_5369_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_5817
LB_5816:
	add r14,1
LB_5817:
	cmp r14,r10
	jge LB_5818
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5816
	cmp al,10
	jz LB_5816
	cmp al,32
	jz LB_5816
LB_5818:
	add r14,7
	cmp r14,r10
	jg LB_5821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_5821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_5821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_5821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_5821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_5821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_5821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_5821
	jmp LB_5822
LB_5821:
	jmp LB_5804
LB_5822:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_5811
LB_5810:
	add r14,1
LB_5811:
	cmp r14,r10
	jge LB_5812
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5810
	cmp al,10
	jz LB_5810
	cmp al,32
	jz LB_5810
LB_5812:
	push r10
	call NS_E_5370_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5813
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5814
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5814:
	jmp LB_5805
LB_5813:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5808
	btr r12,1
	clc
	jmp LB_5809
LB_5808:
	bts r12,1
	stc
LB_5809:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5806
	btr r12,0
	clc
	jmp LB_5807
LB_5806:
	bts r12,0
	stc
LB_5807:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5801
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5823
	btr r12,2
	jmp LB_5824
LB_5823:
	bts r12,2
LB_5824:
	mov r13,r14
	bt r12,1
	jc LB_5825
	btr r12,0
	jmp LB_5826
LB_5825:
	bts r12,0
LB_5826:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5415 ⊢ %_5416 : %_5416
 ; {>  %_5415~0':_p1483 }
; _some 0' ⊢ °0◂0'
; ∎ %_5416
 ; {>  %_5416~°0◂0':(_opn)◂(_p1483) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5799
	btr r12,3
	jmp LB_5800
LB_5799:
	bts r12,3
LB_5800:
	mov r8,0
	bts r12,2
	ret
LB_5801:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5803
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5802
LB_5803:
	add rsp,8
	ret
LB_5805:
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
LB_5804:
	add rsp,32
	pop r14
LB_5802:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5828
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_5417
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5417 ⊢ %_5418 : %_5418
 ; {>  %_5417~0':_stg }
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
; _none {  } ⊢ %_5419 : %_5419
 ; {>  %_5418~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5419
 ; {>  %_5419~°1◂{  }:(_opn)◂(t2291'(0)) %_5418~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5827
	mov rdi,r13
	call dlt
LB_5827:
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
LB_5828:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5830
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5829
LB_5830:
	add rsp,8
	ret
LB_5831:
	add rsp,0
	pop r14
LB_5829:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_5867
LB_5866:
	add r14,1
LB_5867:
	cmp r14,r10
	jge LB_5868
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5866
	cmp al,10
	jz LB_5866
	cmp al,32
	jz LB_5866
LB_5868:
	add r14,4
	cmp r14,r10
	jg LB_5871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_5871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_5871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_5871
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_5871
	jmp LB_5872
LB_5871:
	jmp LB_5845
LB_5872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
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
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5856
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5857
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5857:
	jmp LB_5846
LB_5856:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_5860
LB_5859:
	add r14,1
LB_5860:
	cmp r14,r10
	jge LB_5861
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5859
	cmp al,10
	jz LB_5859
	cmp al,32
	jz LB_5859
LB_5861:
	push r10
	call NS_E_5371_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5862
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5863
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5863:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5864
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5864:
	jmp LB_5846
LB_5862:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5851
	btr r12,2
	clc
	jmp LB_5852
LB_5851:
	bts r12,2
	stc
LB_5852:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5849
	btr r12,1
	clc
	jmp LB_5850
LB_5849:
	bts r12,1
	stc
LB_5850:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5847
	btr r12,0
	clc
	jmp LB_5848
LB_5847:
	bts r12,0
	stc
LB_5848:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5842
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5873
	btr r12,3
	jmp LB_5874
LB_5873:
	bts r12,3
LB_5874:
	mov r14,r8
	bt r12,2
	jc LB_5875
	btr r12,1
	jmp LB_5876
LB_5875:
	bts r12,1
LB_5876:
	mov r8,r13
	bt r12,0
	jc LB_5877
	btr r12,2
	jmp LB_5878
LB_5877:
	bts r12,2
LB_5878:
	mov r13,r9
	bt r12,3
	jc LB_5879
	btr r12,0
	jmp LB_5880
LB_5879:
	bts r12,0
LB_5880:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1510 { %_5420 %_5421 } ⊢ %_5422 : %_5422
 ; {>  %_5421~1':_p1484 %_5420~0':_stg }
; _f1510 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5422 ⊢ %_5423 : %_5423
 ; {>  %_5422~°0◂{ 0' 1' }:_p1483 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5423
 ; {>  %_5423~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1483) }
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
	jc LB_5836
	btr r12,2
	jmp LB_5837
LB_5836:
	bts r12,2
LB_5837:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5834
	btr QWORD [rdi],0
	jmp LB_5835
LB_5834:
	bts QWORD [rdi],0
LB_5835:
	mov r8,r14
	bt r12,1
	jc LB_5840
	btr r12,2
	jmp LB_5841
LB_5840:
	bts r12,2
LB_5841:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5838
	btr QWORD [rdi],1
	jmp LB_5839
LB_5838:
	bts QWORD [rdi],1
LB_5839:
	mov rsi,1
	bt r12,3
	jc LB_5832
	mov rsi,0
	bt r9,0
	jc LB_5832
	jmp LB_5833
LB_5832:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5833:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5842:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5844
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5843
LB_5844:
	add rsp,8
	ret
LB_5846:
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
LB_5845:
	add rsp,48
	pop r14
LB_5843:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5882
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_5424
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5424 ⊢ %_5425 : %_5425
 ; {>  %_5424~0':_stg }
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
; _none {  } ⊢ %_5426 : %_5426
 ; {>  %_5425~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5426
 ; {>  %_5425~0':_stg %_5426~°1◂{  }:(_opn)◂(t2303'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5881
	mov rdi,r13
	call dlt
LB_5881:
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
LB_5882:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5884
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5883
LB_5884:
	add rsp,8
	ret
LB_5885:
	add rsp,0
	pop r14
LB_5883:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_5904
LB_5903:
	add r14,1
LB_5904:
	cmp r14,r10
	jge LB_5905
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5903
	cmp al,10
	jz LB_5903
	cmp al,32
	jz LB_5903
LB_5905:
	add r14,2
	cmp r14,r10
	jg LB_5908
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5908
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_5908
	jmp LB_5909
LB_5908:
	jmp LB_5891
LB_5909:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_5898
LB_5897:
	add r14,1
LB_5898:
	cmp r14,r10
	jge LB_5899
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5897
	cmp al,10
	jz LB_5897
	cmp al,32
	jz LB_5897
LB_5899:
	push r10
	call NS_E_5379_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5900
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5901
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5901:
	jmp LB_5892
LB_5900:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5895
	btr r12,1
	clc
	jmp LB_5896
LB_5895:
	bts r12,1
	stc
LB_5896:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5893
	btr r12,0
	clc
	jmp LB_5894
LB_5893:
	bts r12,0
	stc
LB_5894:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5888
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5910
	btr r12,2
	jmp LB_5911
LB_5910:
	bts r12,2
LB_5911:
	mov r13,r14
	bt r12,1
	jc LB_5912
	btr r12,0
	jmp LB_5913
LB_5912:
	bts r12,0
LB_5913:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5427 ⊢ %_5428 : %_5428
 ; {>  %_5427~0':_p1483 }
; _some 0' ⊢ °0◂0'
; ∎ %_5428
 ; {>  %_5428~°0◂0':(_opn)◂(_p1483) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5886
	btr r12,3
	jmp LB_5887
LB_5886:
	bts r12,3
LB_5887:
	mov r8,0
	bts r12,2
	ret
LB_5888:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5890
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5889
LB_5890:
	add rsp,8
	ret
LB_5892:
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
LB_5891:
	add rsp,32
	pop r14
LB_5889:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5915
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_5429
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5429 ⊢ %_5430 : %_5430
 ; {>  %_5429~0':_stg }
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
; _none {  } ⊢ %_5431 : %_5431
 ; {>  %_5430~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5431
 ; {>  %_5431~°1◂{  }:(_opn)◂(t2313'(0)) %_5430~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5914
	mov rdi,r13
	call dlt
LB_5914:
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
LB_5915:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5917
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5916
LB_5917:
	add rsp,8
	ret
LB_5918:
	add rsp,0
	pop r14
LB_5916:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_5937
LB_5936:
	add r14,1
LB_5937:
	cmp r14,r10
	jge LB_5938
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5936
	cmp al,10
	jz LB_5936
	cmp al,32
	jz LB_5936
LB_5938:
	add r14,2
	cmp r14,r10
	jg LB_5941
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5941
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_5941
	jmp LB_5942
LB_5941:
	jmp LB_5924
LB_5942:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
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
	call NS_E_5373_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5933
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5934
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5934:
	jmp LB_5925
LB_5933:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5928
	btr r12,1
	clc
	jmp LB_5929
LB_5928:
	bts r12,1
	stc
LB_5929:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5926
	btr r12,0
	clc
	jmp LB_5927
LB_5926:
	bts r12,0
	stc
LB_5927:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5921
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5943
	btr r12,2
	jmp LB_5944
LB_5943:
	bts r12,2
LB_5944:
	mov r13,r14
	bt r12,1
	jc LB_5945
	btr r12,0
	jmp LB_5946
LB_5945:
	bts r12,0
LB_5946:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5432 ⊢ %_5433 : %_5433
 ; {>  %_5432~0':_p1483 }
; _some 0' ⊢ °0◂0'
; ∎ %_5433
 ; {>  %_5433~°0◂0':(_opn)◂(_p1483) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5919
	btr r12,3
	jmp LB_5920
LB_5919:
	bts r12,3
LB_5920:
	mov r8,0
	bts r12,2
	ret
LB_5921:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5923
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5922
LB_5923:
	add rsp,8
	ret
LB_5925:
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
LB_5924:
	add rsp,32
	pop r14
LB_5922:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5370:
NS_E_RDI_5370:
NS_E_5370_ETR_TBL:
NS_E_5370_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_5982
LB_5981:
	add r14,1
LB_5982:
	cmp r14,r10
	jge LB_5983
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5981
	cmp al,10
	jz LB_5981
	cmp al,32
	jz LB_5981
LB_5983:
	push r10
	call NS_E_5396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5984
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5976
LB_5984:
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
LB_5990:
	jmp LB_5987
LB_5986:
	add r14,1
LB_5987:
	cmp r14,r10
	jge LB_5988
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5986
	cmp al,10
	jz LB_5986
	cmp al,32
	jz LB_5986
LB_5988:
	push r10
	push rsi
	call NS_E_5396_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5989
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5991
	bts QWORD [rax],0
LB_5991:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5990
LB_5989:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5979
	btr r12,1
	clc
	jmp LB_5980
LB_5979:
	bts r12,1
	stc
LB_5980:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5977
	btr r12,0
	clc
	jmp LB_5978
LB_5977:
	bts r12,0
	stc
LB_5978:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5973
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_5992
	btr r12,2
	jmp LB_5993
LB_5992:
	bts r12,2
LB_5993:
	mov r9,r13
	bt r12,0
	jc LB_5994
	btr r12,3
	jmp LB_5995
LB_5994:
	bts r12,3
LB_5995:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_5998
	btr r12,4
	clc
	jmp LB_5999
LB_5998:
	bts r12,4
	stc
LB_5999:
	mov r13,r10
	bt r12,4
	jc LB_5996
	btr r12,0
	jmp LB_5997
LB_5996:
	bts r12,0
LB_5997:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_6002
	btr r12,4
	clc
	jmp LB_6003
LB_6002:
	bts r12,4
	stc
LB_6003:
	mov r14,r10
	bt r12,4
	jc LB_6000
	btr r12,1
	jmp LB_6001
LB_6000:
	bts r12,1
LB_6001:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f821 %_5435 ⊢ %_5436 : %_5436
 ; {>  %_5434~{ 0' 1' }:{ _stg _p1487 } %_5435~2':(_lst)◂({ _stg _p1487 }) }
; _f821 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_5951
	btr r12,0
	jmp LB_5952
LB_5951:
	bts r12,0
LB_5952:
	call NS_E_821
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_5953
	btr r12,2
	jmp LB_5954
LB_5953:
	bts r12,2
LB_5954:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_5949
	btr r12,1
	clc
	jmp LB_5950
LB_5949:
	bts r12,1
	stc
LB_5950:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_5947
	btr r12,0
	clc
	jmp LB_5948
LB_5947:
	bts r12,0
	stc
LB_5948:
	add rsp,24
; _cns { %_5434 %_5436 } ⊢ %_5437 : %_5437
 ; {>  %_5436~2':(_lst)◂({ _stg _p1487 }) %_5434~{ 0' 1' }:{ _stg _p1487 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1511 %_5437 ⊢ %_5438 : %_5438
 ; {>  %_5437~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1487 }) }
; _f1511 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_5438 ⊢ %_5439 : %_5439
 ; {>  %_5438~°1◂°0◂{ { 0' 1' } 2' }:_p1483 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_5439
 ; {>  %_5439~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1483) }
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
	jc LB_5963
	btr r12,5
	jmp LB_5964
LB_5963:
	bts r12,5
LB_5964:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5961
	btr QWORD [rdi],0
	jmp LB_5962
LB_5961:
	bts QWORD [rdi],0
LB_5962:
	mov r11,r14
	bt r12,1
	jc LB_5967
	btr r12,5
	jmp LB_5968
LB_5967:
	bts r12,5
LB_5968:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5965
	btr QWORD [rdi],1
	jmp LB_5966
LB_5965:
	bts QWORD [rdi],1
LB_5966:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5959
	btr QWORD [rdi],0
	jmp LB_5960
LB_5959:
	bts QWORD [rdi],0
LB_5960:
	mov r10,r8
	bt r12,2
	jc LB_5971
	btr r12,4
	jmp LB_5972
LB_5971:
	bts r12,4
LB_5972:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5969
	btr QWORD [rdi],1
	jmp LB_5970
LB_5969:
	bts QWORD [rdi],1
LB_5970:
	mov rsi,1
	bt r12,3
	jc LB_5957
	mov rsi,0
	bt r9,0
	jc LB_5957
	jmp LB_5958
LB_5957:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5958:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_5955
	mov rsi,0
	bt r9,0
	jc LB_5955
	jmp LB_5956
LB_5955:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5956:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5973:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5975
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5974
LB_5975:
	add rsp,8
	ret
LB_5976:
	add rsp,32
	pop r14
LB_5974:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6005
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_5440
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5440 ⊢ %_5441 : %_5441
 ; {>  %_5440~0':_stg }
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
; _none {  } ⊢ %_5442 : %_5442
 ; {>  %_5441~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5442
 ; {>  %_5442~°1◂{  }:(_opn)◂(t2332'(0)) %_5441~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6004
	mov rdi,r13
	call dlt
LB_6004:
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
LB_6005:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6007
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6006
LB_6007:
	add rsp,8
	ret
LB_6008:
	add rsp,0
	pop r14
LB_6006:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5371:
NS_E_RDI_5371:
NS_E_5371_ETR_TBL:
NS_E_5371_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_6029
LB_6028:
	add r14,1
LB_6029:
	cmp r14,r10
	jge LB_6030
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6028
	cmp al,10
	jz LB_6028
	cmp al,32
	jz LB_6028
LB_6030:
	add r14,1
	cmp r14,r10
	jg LB_6033
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6033
	jmp LB_6034
LB_6033:
	jmp LB_6016
LB_6034:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
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
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6025
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6026
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6026:
	jmp LB_6017
LB_6025:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6020
	btr r12,1
	clc
	jmp LB_6021
LB_6020:
	bts r12,1
	stc
LB_6021:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6018
	btr r12,0
	clc
	jmp LB_6019
LB_6018:
	bts r12,0
	stc
LB_6019:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6013
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6035
	btr r12,2
	jmp LB_6036
LB_6035:
	bts r12,2
LB_6036:
	mov r13,r14
	bt r12,1
	jc LB_6037
	btr r12,0
	jmp LB_6038
LB_6037:
	bts r12,0
LB_6038:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1517 %_5443 ⊢ %_5444 : %_5444
 ; {>  %_5443~0':_p1435 }
; _f1517 0' ⊢ °1◂0'
; _some %_5444 ⊢ %_5445 : %_5445
 ; {>  %_5444~°1◂0':_p1484 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5445
 ; {>  %_5445~°0◂°1◂0':(_opn)◂(_p1484) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6011
	btr r12,3
	jmp LB_6012
LB_6011:
	bts r12,3
LB_6012:
	mov rsi,1
	bt r12,3
	jc LB_6009
	mov rsi,0
	bt r9,0
	jc LB_6009
	jmp LB_6010
LB_6009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6010:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6013:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6015
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6014
LB_6015:
	add rsp,8
	ret
LB_6017:
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
LB_6016:
	add rsp,32
	pop r14
LB_6014:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_6050
LB_6049:
	add r14,1
LB_6050:
	cmp r14,r10
	jge LB_6051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6049
	cmp al,10
	jz LB_6049
	cmp al,32
	jz LB_6049
LB_6051:
	push r10
	call NS_E_5372_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6052
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6046
LB_6052:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6047
	btr r12,0
	clc
	jmp LB_6048
LB_6047:
	bts r12,0
	stc
LB_6048:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6043
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1516 %_5446 ⊢ %_5447 : %_5447
 ; {>  %_5446~0':(_lst)◂(_p1483) }
; _f1516 0' ⊢ °0◂0'
; _some %_5447 ⊢ %_5448 : %_5448
 ; {>  %_5447~°0◂0':_p1484 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5448
 ; {>  %_5448~°0◂°0◂0':(_opn)◂(_p1484) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6041
	btr r12,3
	jmp LB_6042
LB_6041:
	bts r12,3
LB_6042:
	mov rsi,1
	bt r12,3
	jc LB_6039
	mov rsi,0
	bt r9,0
	jc LB_6039
	jmp LB_6040
LB_6039:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6040:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6043:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6045
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6044
LB_6045:
	add rsp,8
	ret
LB_6046:
	add rsp,16
	pop r14
LB_6044:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6055
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_5449
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5449 ⊢ %_5450 : %_5450
 ; {>  %_5449~0':_stg }
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
; _none {  } ⊢ %_5451 : %_5451
 ; {>  %_5450~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5451
 ; {>  %_5450~0':_stg %_5451~°1◂{  }:(_opn)◂(t2347'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6054
	mov rdi,r13
	call dlt
LB_6054:
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
LB_6055:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6057
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6056
LB_6057:
	add rsp,8
	ret
LB_6058:
	add rsp,0
	pop r14
LB_6056:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5372:
NS_E_RDI_5372:
NS_E_5372_ETR_TBL:
NS_E_5372_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_6068
LB_6067:
	add r14,1
LB_6068:
	cmp r14,r10
	jge LB_6069
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6067
	cmp al,10
	jz LB_6067
	cmp al,32
	jz LB_6067
LB_6069:
	add r14,6
	cmp r14,r10
	jg LB_6072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_6072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_6072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_6072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_6072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_6072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_6072
	jmp LB_6073
LB_6072:
	jmp LB_6064
LB_6073:
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
	jc LB_6065
	btr r12,0
	clc
	jmp LB_6066
LB_6065:
	bts r12,0
	stc
LB_6066:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6061
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5452 : %_5452
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5452 ⊢ %_5453 : %_5453
 ; {>  %_5452~°1◂{  }:(_lst)◂(t2351'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5453
 ; {>  %_5453~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2354'(0))) }
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
	jc LB_6059
	mov rsi,0
	bt r9,0
	jc LB_6059
	jmp LB_6060
LB_6059:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6060:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6061:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6063
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6062
LB_6063:
	add rsp,8
	ret
LB_6064:
	add rsp,16
	pop r14
LB_6062:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_6093
LB_6092:
	add r14,1
LB_6093:
	cmp r14,r10
	jge LB_6094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6092
	cmp al,10
	jz LB_6092
	cmp al,32
	jz LB_6092
LB_6094:
	push r10
	call NS_E_5369_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6095
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6087
LB_6095:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_6098
LB_6097:
	add r14,1
LB_6098:
	cmp r14,r10
	jge LB_6099
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6097
	cmp al,10
	jz LB_6097
	cmp al,32
	jz LB_6097
LB_6099:
	push r10
	call NS_E_5372_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6100
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6101
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6101:
	jmp LB_6087
LB_6100:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6090
	btr r12,1
	clc
	jmp LB_6091
LB_6090:
	bts r12,1
	stc
LB_6091:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6088
	btr r12,0
	clc
	jmp LB_6089
LB_6088:
	bts r12,0
	stc
LB_6089:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6084
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_5454 %_5455 } ⊢ %_5456 : %_5456
 ; {>  %_5455~1':(_lst)◂(_p1483) %_5454~0':_p1483 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5456 ⊢ %_5457 : %_5457
 ; {>  %_5456~°0◂{ 0' 1' }:(_lst)◂(_p1483) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5457
 ; {>  %_5457~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1483)) }
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
	jc LB_6078
	btr r12,2
	jmp LB_6079
LB_6078:
	bts r12,2
LB_6079:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6076
	btr QWORD [rdi],0
	jmp LB_6077
LB_6076:
	bts QWORD [rdi],0
LB_6077:
	mov r8,r14
	bt r12,1
	jc LB_6082
	btr r12,2
	jmp LB_6083
LB_6082:
	bts r12,2
LB_6083:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6080
	btr QWORD [rdi],1
	jmp LB_6081
LB_6080:
	bts QWORD [rdi],1
LB_6081:
	mov rsi,1
	bt r12,3
	jc LB_6074
	mov rsi,0
	bt r9,0
	jc LB_6074
	jmp LB_6075
LB_6074:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6075:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6084:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6086
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6085
LB_6086:
	add rsp,8
	ret
LB_6087:
	add rsp,32
	pop r14
LB_6085:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5373:
NS_E_RDI_5373:
NS_E_5373_ETR_TBL:
NS_E_5373_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_6158
LB_6157:
	add r14,1
LB_6158:
	cmp r14,r10
	jge LB_6159
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6157
	cmp al,10
	jz LB_6157
	cmp al,32
	jz LB_6157
LB_6159:
	add r14,1
	cmp r14,r10
	jg LB_6162
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6162
	jmp LB_6163
LB_6162:
	jmp LB_6124
LB_6163:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6135
LB_6134:
	add r14,1
LB_6135:
	cmp r14,r10
	jge LB_6136
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6134
	cmp al,10
	jz LB_6134
	cmp al,32
	jz LB_6134
LB_6136:
	add r14,1
	cmp r14,r10
	jg LB_6140
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6140
	jmp LB_6141
LB_6140:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6138
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6138:
	jmp LB_6125
LB_6141:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_6143
LB_6142:
	add r14,1
LB_6143:
	cmp r14,r10
	jge LB_6144
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6142
	cmp al,10
	jz LB_6142
	cmp al,32
	jz LB_6142
LB_6144:
	push r10
	call NS_E_5374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6145
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6146
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6146:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6147
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6147:
	jmp LB_6125
LB_6145:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_6150
LB_6149:
	add r14,1
LB_6150:
	cmp r14,r10
	jge LB_6151
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6149
	cmp al,10
	jz LB_6149
	cmp al,32
	jz LB_6149
LB_6151:
	push r10
	call NS_E_5377_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6152
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6153
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6153:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6154
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6154:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6155
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6155:
	jmp LB_6125
LB_6152:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6132
	btr r12,3
	clc
	jmp LB_6133
LB_6132:
	bts r12,3
	stc
LB_6133:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6130
	btr r12,2
	clc
	jmp LB_6131
LB_6130:
	bts r12,2
	stc
LB_6131:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6128
	btr r12,1
	clc
	jmp LB_6129
LB_6128:
	bts r12,1
	stc
LB_6129:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6126
	btr r12,0
	clc
	jmp LB_6127
LB_6126:
	bts r12,0
	stc
LB_6127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6121
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6164
	btr r12,4
	jmp LB_6165
LB_6164:
	bts r12,4
LB_6165:
	mov r8,r9
	bt r12,3
	jc LB_6166
	btr r12,2
	jmp LB_6167
LB_6166:
	bts r12,2
LB_6167:
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
	jc LB_6170
	btr r12,3
	clc
	jmp LB_6171
LB_6170:
	bts r12,3
	stc
LB_6171:
	mov r13,r9
	bt r12,3
	jc LB_6168
	btr r12,0
	jmp LB_6169
LB_6168:
	bts r12,0
LB_6169:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6174
	btr r12,3
	clc
	jmp LB_6175
LB_6174:
	bts r12,3
	stc
LB_6175:
	mov r14,r9
	bt r12,3
	jc LB_6172
	btr r12,1
	jmp LB_6173
LB_6172:
	bts r12,1
LB_6173:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5458 %_5459 } ⊢ %_5460 : %_5460
 ; {>  %_5459~2':(_lst)◂({ _stg _p1486 }) %_5458~{ 0' 1' }:{ _stg _p1486 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1515 %_5460 ⊢ %_5461 : %_5461
 ; {>  %_5460~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1486 }) }
; _f1515 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_5461 ⊢ %_5462 : %_5462
 ; {>  %_5461~°5◂°0◂{ { 0' 1' } 2' }:_p1483 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_5462
 ; {>  %_5462~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1483) }
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
	jc LB_6111
	btr r12,5
	jmp LB_6112
LB_6111:
	bts r12,5
LB_6112:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6109
	btr QWORD [rdi],0
	jmp LB_6110
LB_6109:
	bts QWORD [rdi],0
LB_6110:
	mov r11,r14
	bt r12,1
	jc LB_6115
	btr r12,5
	jmp LB_6116
LB_6115:
	bts r12,5
LB_6116:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6113
	btr QWORD [rdi],1
	jmp LB_6114
LB_6113:
	bts QWORD [rdi],1
LB_6114:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6107
	btr QWORD [rdi],0
	jmp LB_6108
LB_6107:
	bts QWORD [rdi],0
LB_6108:
	mov r10,r8
	bt r12,2
	jc LB_6119
	btr r12,4
	jmp LB_6120
LB_6119:
	bts r12,4
LB_6120:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6117
	btr QWORD [rdi],1
	jmp LB_6118
LB_6117:
	bts QWORD [rdi],1
LB_6118:
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
	mov rsi,1
	bt r12,3
	jc LB_6103
	mov rsi,0
	bt r9,0
	jc LB_6103
	jmp LB_6104
LB_6103:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6104:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
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
LB_6125:
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
LB_6124:
	add rsp,64
	pop r14
LB_6122:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_6193
LB_6192:
	add r14,1
LB_6193:
	cmp r14,r10
	jge LB_6194
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6192
	cmp al,10
	jz LB_6192
	cmp al,32
	jz LB_6192
LB_6194:
	push r10
	call NS_E_5374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6195
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6189
LB_6195:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6190
	btr r12,0
	clc
	jmp LB_6191
LB_6190:
	bts r12,0
	stc
LB_6191:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6186
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_6197
	btr r12,2
	jmp LB_6198
LB_6197:
	bts r12,2
LB_6198:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_6201
	btr r12,3
	clc
	jmp LB_6202
LB_6201:
	bts r12,3
	stc
LB_6202:
	mov r13,r9
	bt r12,3
	jc LB_6199
	btr r12,0
	jmp LB_6200
LB_6199:
	bts r12,0
LB_6200:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6205
	btr r12,3
	clc
	jmp LB_6206
LB_6205:
	bts r12,3
	stc
LB_6206:
	mov r14,r9
	bt r12,3
	jc LB_6203
	btr r12,1
	jmp LB_6204
LB_6203:
	bts r12,1
LB_6204:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1514 %_5463 ⊢ %_5464 : %_5464
 ; {>  %_5463~{ 0' 1' }:{ _stg _p1486 } }
; _f1514 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_5464 ⊢ %_5465 : %_5465
 ; {>  %_5464~°4◂{ 0' 1' }:_p1483 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_5465
 ; {>  %_5465~°0◂°4◂{ 0' 1' }:(_opn)◂(_p1483) }
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
	jc LB_6180
	btr r12,2
	jmp LB_6181
LB_6180:
	bts r12,2
LB_6181:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6178
	btr QWORD [rdi],0
	jmp LB_6179
LB_6178:
	bts QWORD [rdi],0
LB_6179:
	mov r8,r14
	bt r12,1
	jc LB_6184
	btr r12,2
	jmp LB_6185
LB_6184:
	bts r12,2
LB_6185:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6182
	btr QWORD [rdi],1
	jmp LB_6183
LB_6182:
	bts QWORD [rdi],1
LB_6183:
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
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6186:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6188
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6187
LB_6188:
	add rsp,8
	ret
LB_6189:
	add rsp,16
	pop r14
LB_6187:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6208
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_5466
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5466 ⊢ %_5467 : %_5467
 ; {>  %_5466~0':_stg }
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
; _none {  } ⊢ %_5468 : %_5468
 ; {>  %_5467~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5468
 ; {>  %_5467~0':_stg %_5468~°1◂{  }:(_opn)◂(t2378'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6207
	mov rdi,r13
	call dlt
LB_6207:
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
LB_6208:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6210
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6209
LB_6210:
	add rsp,8
	ret
LB_6211:
	add rsp,0
	pop r14
LB_6209:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5374:
NS_E_RDI_5374:
NS_E_5374_ETR_TBL:
NS_E_5374_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_6245
LB_6244:
	add r14,1
LB_6245:
	cmp r14,r10
	jge LB_6246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6244
	cmp al,10
	jz LB_6244
	cmp al,32
	jz LB_6244
LB_6246:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6247
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6226
LB_6247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_6250
LB_6249:
	add r14,1
LB_6250:
	cmp r14,r10
	jge LB_6251
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6249
	cmp al,10
	jz LB_6249
	cmp al,32
	jz LB_6249
LB_6251:
	push r10
	call NS_E_5376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6252
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6253:
	jmp LB_6226
LB_6252:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_6256
LB_6255:
	add r14,1
LB_6256:
	cmp r14,r10
	jge LB_6257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6255
	cmp al,10
	jz LB_6255
	cmp al,32
	jz LB_6255
LB_6257:
	add r14,1
	cmp r14,r10
	jg LB_6262
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6262
	jmp LB_6263
LB_6262:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6259
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6259:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6260
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6260:
	jmp LB_6226
LB_6263:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_6237
LB_6236:
	add r14,1
LB_6237:
	cmp r14,r10
	jge LB_6238
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6236
	cmp al,10
	jz LB_6236
	cmp al,32
	jz LB_6236
LB_6238:
	push r10
	call NS_E_5053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6239
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6240
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6240:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6241
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6241:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6242:
	jmp LB_6227
LB_6239:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6234
	btr r12,3
	clc
	jmp LB_6235
LB_6234:
	bts r12,3
	stc
LB_6235:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6232
	btr r12,2
	clc
	jmp LB_6233
LB_6232:
	bts r12,2
	stc
LB_6233:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6230
	btr r12,1
	clc
	jmp LB_6231
LB_6230:
	bts r12,1
	stc
LB_6231:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6228
	btr r12,0
	clc
	jmp LB_6229
LB_6228:
	bts r12,0
	stc
LB_6229:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6223
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6264
	btr r12,4
	jmp LB_6265
LB_6264:
	bts r12,4
LB_6265:
	mov r8,r9
	bt r12,3
	jc LB_6266
	btr r12,2
	jmp LB_6267
LB_6266:
	bts r12,2
LB_6267:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1522 %_5471 ⊢ %_5472 : %_5472
 ; {>  %_5471~2':_p1500 %_5469~0':_stg %_5470~1':_p5375 }
; _f1522 2' ⊢ °1◂2'
; _some { %_5469 %_5472 } ⊢ %_5473 : %_5473
 ; {>  %_5469~0':_stg %_5472~°1◂2':_p1486 %_5470~1':_p5375 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_5473
 ; {>  %_5473~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p1486 }) %_5470~1':_p5375 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_6212
	mov rdi,r14
	call dlt
LB_6212:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_6215
	btr r12,1
	jmp LB_6216
LB_6215:
	bts r12,1
LB_6216:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_6213
	btr QWORD [rdi],0
	jmp LB_6214
LB_6213:
	bts QWORD [rdi],0
LB_6214:
	mov r14,r8
	bt r12,2
	jc LB_6221
	btr r12,1
	jmp LB_6222
LB_6221:
	bts r12,1
LB_6222:
	mov rsi,1
	bt r12,1
	jc LB_6219
	mov rsi,0
	bt r14,0
	jc LB_6219
	jmp LB_6220
LB_6219:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_6220:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_6217
	btr QWORD [rdi],1
	jmp LB_6218
LB_6217:
	bts QWORD [rdi],1
LB_6218:
	mov r8,0
	bts r12,2
	ret
LB_6223:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6225
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6224
LB_6225:
	add rsp,8
	ret
LB_6227:
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
LB_6226:
	add rsp,64
	pop r14
LB_6224:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_6314
LB_6313:
	add r14,1
LB_6314:
	cmp r14,r10
	jge LB_6315
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6313
	cmp al,10
	jz LB_6313
	cmp al,32
	jz LB_6313
LB_6315:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6316
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6298
LB_6316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_6319
LB_6318:
	add r14,1
LB_6319:
	cmp r14,r10
	jge LB_6320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6318
	cmp al,10
	jz LB_6318
	cmp al,32
	jz LB_6318
LB_6320:
	push r10
	call NS_E_5376_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6321
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6322
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6322:
	jmp LB_6298
LB_6321:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
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
	add r14,3
	cmp r14,r10
	jg LB_6331
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6331
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6331
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6331
	jmp LB_6332
LB_6331:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6328
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6328:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6329
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6329:
	jmp LB_6298
LB_6332:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_6334
LB_6333:
	add r14,1
LB_6334:
	cmp r14,r10
	jge LB_6335
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6333
	cmp al,10
	jz LB_6333
	cmp al,32
	jz LB_6333
LB_6335:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6336
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6337
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6337:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6338
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6338:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6339
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6339:
	jmp LB_6298
LB_6336:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_6342
LB_6341:
	add r14,1
LB_6342:
	cmp r14,r10
	jge LB_6343
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6341
	cmp al,10
	jz LB_6341
	cmp al,32
	jz LB_6341
LB_6343:
	add r14,1
	cmp r14,r10
	jg LB_6350
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6350
	jmp LB_6351
LB_6350:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6345
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6345:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6346
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6346:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6347
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6347:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6348:
	jmp LB_6298
LB_6351:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_6353
LB_6352:
	add r14,1
LB_6353:
	cmp r14,r10
	jge LB_6354
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6352
	cmp al,10
	jz LB_6352
	cmp al,32
	jz LB_6352
LB_6354:
	push r10
	call NS_E_5053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6355
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_6356
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_6356:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6357
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6357:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6358
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6358:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6359
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6359:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6360:
	jmp LB_6298
LB_6355:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_6363
LB_6362:
	add r14,1
LB_6363:
	cmp r14,r10
	jge LB_6364
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6362
	cmp al,10
	jz LB_6362
	cmp al,32
	jz LB_6362
LB_6364:
	push r10
	call NS_E_5378_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6365
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_6366
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_6366:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_6367
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_6367:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6368
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6368:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6369
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6369:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6370
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6370:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6371:
	jmp LB_6298
LB_6365:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_6311
	btr r12,6
	clc
	jmp LB_6312
LB_6311:
	bts r12,6
	stc
LB_6312:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6309
	btr r12,5
	clc
	jmp LB_6310
LB_6309:
	bts r12,5
	stc
LB_6310:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6307
	btr r12,4
	clc
	jmp LB_6308
LB_6307:
	bts r12,4
	stc
LB_6308:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6305
	btr r12,3
	clc
	jmp LB_6306
LB_6305:
	bts r12,3
	stc
LB_6306:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6303
	btr r12,2
	clc
	jmp LB_6304
LB_6303:
	bts r12,2
	stc
LB_6304:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6301
	btr r12,1
	clc
	jmp LB_6302
LB_6301:
	bts r12,1
	stc
LB_6302:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6299
	btr r12,0
	clc
	jmp LB_6300
LB_6299:
	bts r12,0
	stc
LB_6300:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_6295
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_6373
	btr r12,7
	jmp LB_6374
LB_6373:
	bts r12,7
LB_6374:
	mov r10,rcx
	bt r12,6
	jc LB_6375
	btr r12,4
	jmp LB_6376
LB_6375:
	bts r12,4
LB_6376:
	mov rcx,r9
	bt r12,3
	jc LB_6377
	btr r12,6
	jmp LB_6378
LB_6377:
	bts r12,6
LB_6378:
	mov r9,r11
	bt r12,5
	jc LB_6379
	btr r12,3
	jmp LB_6380
LB_6379:
	bts r12,3
LB_6380:
	mov r11,r8
	bt r12,2
	jc LB_6381
	btr r12,5
	jmp LB_6382
LB_6381:
	bts r12,5
LB_6382:
	mov r8,rcx
	bt r12,6
	jc LB_6383
	btr r12,2
	jmp LB_6384
LB_6383:
	bts r12,2
LB_6384:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_5476 %_5477 } %_5478 } ⊢ %_5479 : %_5479
 ; {>  %_5478~4':(_lst)◂({ _stg _p1500 }) %_5476~2':_stg %_5477~3':_p1500 %_5475~1':_p5375 %_5474~0':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f1521 %_5479 ⊢ %_5480 : %_5480
 ; {>  %_5479~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p1500 }) %_5475~1':_p5375 %_5474~0':_stg }
; _f1521 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_5474 %_5480 } ⊢ %_5481 : %_5481
 ; {>  %_5480~°0◂°0◂{ { 2' 3' } 4' }:_p1486 %_5475~1':_p5375 %_5474~0':_stg }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_5481
 ; {>  %_5481~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p1486 }) %_5475~1':_p5375 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_6268
	mov rdi,r14
	call dlt
LB_6268:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_6269
	btr r12,1
	jmp LB_6270
LB_6269:
	bts r12,1
LB_6270:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_6273
	btr r12,5
	jmp LB_6274
LB_6273:
	bts r12,5
LB_6274:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6271
	btr QWORD [rdi],0
	jmp LB_6272
LB_6271:
	bts QWORD [rdi],0
LB_6272:
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
	jc LB_6285
	btr r12,6
	jmp LB_6286
LB_6285:
	bts r12,6
LB_6286:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_6283
	btr QWORD [rdi],0
	jmp LB_6284
LB_6283:
	bts QWORD [rdi],0
LB_6284:
	mov rcx,r14
	bt r12,1
	jc LB_6289
	btr r12,6
	jmp LB_6290
LB_6289:
	bts r12,6
LB_6290:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_6287
	btr QWORD [rdi],1
	jmp LB_6288
LB_6287:
	bts QWORD [rdi],1
LB_6288:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_6281
	btr QWORD [rdi],0
	jmp LB_6282
LB_6281:
	bts QWORD [rdi],0
LB_6282:
	mov r13,r10
	bt r12,4
	jc LB_6293
	btr r12,0
	jmp LB_6294
LB_6293:
	bts r12,0
LB_6294:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_6291
	btr QWORD [rdi],1
	jmp LB_6292
LB_6291:
	bts QWORD [rdi],1
LB_6292:
	mov rsi,1
	bt r12,5
	jc LB_6279
	mov rsi,0
	bt r11,0
	jc LB_6279
	jmp LB_6280
LB_6279:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6280:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_6277
	mov rsi,0
	bt r11,0
	jc LB_6277
	jmp LB_6278
LB_6277:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6278:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6275
	btr QWORD [rdi],1
	jmp LB_6276
LB_6275:
	bts QWORD [rdi],1
LB_6276:
	mov r8,0
	bts r12,2
	ret
LB_6295:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6297
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6296
LB_6297:
	add rsp,8
	ret
LB_6298:
	add rsp,112
	pop r14
LB_6296:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5376:
NS_E_RDI_5376:
NS_E_5376_ETR_TBL:
NS_E_5376_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_6399
LB_6398:
	add r14,1
LB_6399:
	cmp r14,r10
	jge LB_6400
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6398
	cmp al,10
	jz LB_6398
	cmp al,32
	jz LB_6398
LB_6400:
	add r14,3
	cmp r14,r10
	jg LB_6403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6403
	jmp LB_6404
LB_6403:
	jmp LB_6385
LB_6404:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
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
	push r10
	call NS_E_5057_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6395
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6396
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6396:
	jmp LB_6386
LB_6395:
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
	jc LB_6389
	btr QWORD [rdi],1
LB_6389:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6390
	btr QWORD [rdi],0
LB_6390:
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
LB_6386:
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
LB_6385:
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
LB_6387:
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
NS_E_5377:
NS_E_RDI_5377:
NS_E_5377_ETR_TBL:
NS_E_5377_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_6458
LB_6457:
	add r14,1
LB_6458:
	cmp r14,r10
	jge LB_6459
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6457
	cmp al,10
	jz LB_6457
	cmp al,32
	jz LB_6457
LB_6459:
	add r14,1
	cmp r14,r10
	jg LB_6462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6462
	jmp LB_6463
LB_6462:
	jmp LB_6424
LB_6463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6435
LB_6434:
	add r14,1
LB_6435:
	cmp r14,r10
	jge LB_6436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6434
	cmp al,10
	jz LB_6434
	cmp al,32
	jz LB_6434
LB_6436:
	add r14,1
	cmp r14,r10
	jg LB_6440
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6440
	jmp LB_6441
LB_6440:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6438:
	jmp LB_6425
LB_6441:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_6443
LB_6442:
	add r14,1
LB_6443:
	cmp r14,r10
	jge LB_6444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6442
	cmp al,10
	jz LB_6442
	cmp al,32
	jz LB_6442
LB_6444:
	push r10
	call NS_E_5374_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6445
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6446
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6446:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6447
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6447:
	jmp LB_6425
LB_6445:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_6450
LB_6449:
	add r14,1
LB_6450:
	cmp r14,r10
	jge LB_6451
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6449
	cmp al,10
	jz LB_6449
	cmp al,32
	jz LB_6449
LB_6451:
	push r10
	call NS_E_5377_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6452
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6453
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6453:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6454
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6455:
	jmp LB_6425
LB_6452:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6432
	btr r12,3
	clc
	jmp LB_6433
LB_6432:
	bts r12,3
	stc
LB_6433:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6430
	btr r12,2
	clc
	jmp LB_6431
LB_6430:
	bts r12,2
	stc
LB_6431:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6428
	btr r12,1
	clc
	jmp LB_6429
LB_6428:
	bts r12,1
	stc
LB_6429:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6426
	btr r12,0
	clc
	jmp LB_6427
LB_6426:
	bts r12,0
	stc
LB_6427:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6421
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6464
	btr r12,4
	jmp LB_6465
LB_6464:
	bts r12,4
LB_6465:
	mov r8,r9
	bt r12,3
	jc LB_6466
	btr r12,2
	jmp LB_6467
LB_6466:
	bts r12,2
LB_6467:
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
	jc LB_6470
	btr r12,3
	clc
	jmp LB_6471
LB_6470:
	bts r12,3
	stc
LB_6471:
	mov r13,r9
	bt r12,3
	jc LB_6468
	btr r12,0
	jmp LB_6469
LB_6468:
	bts r12,0
LB_6469:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_6474
	btr r12,3
	clc
	jmp LB_6475
LB_6474:
	bts r12,3
	stc
LB_6475:
	mov r14,r9
	bt r12,3
	jc LB_6472
	btr r12,1
	jmp LB_6473
LB_6472:
	bts r12,1
LB_6473:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5484 %_5485 } ⊢ %_5486 : %_5486
 ; {>  %_5485~2':(_lst)◂({ _stg _p1486 }) %_5484~{ 0' 1' }:{ _stg _p1486 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_5486 ⊢ %_5487 : %_5487
 ; {>  %_5486~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1486 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_5487
 ; {>  %_5487~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1486 })) }
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
	jc LB_6411
	btr r12,5
	jmp LB_6412
LB_6411:
	bts r12,5
LB_6412:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6409
	btr QWORD [rdi],0
	jmp LB_6410
LB_6409:
	bts QWORD [rdi],0
LB_6410:
	mov r11,r14
	bt r12,1
	jc LB_6415
	btr r12,5
	jmp LB_6416
LB_6415:
	bts r12,5
LB_6416:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6413
	btr QWORD [rdi],1
	jmp LB_6414
LB_6413:
	bts QWORD [rdi],1
LB_6414:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6407
	btr QWORD [rdi],0
	jmp LB_6408
LB_6407:
	bts QWORD [rdi],0
LB_6408:
	mov r10,r8
	bt r12,2
	jc LB_6419
	btr r12,4
	jmp LB_6420
LB_6419:
	bts r12,4
LB_6420:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6417
	btr QWORD [rdi],1
	jmp LB_6418
LB_6417:
	bts QWORD [rdi],1
LB_6418:
	mov rsi,1
	bt r12,3
	jc LB_6405
	mov rsi,0
	bt r9,0
	jc LB_6405
	jmp LB_6406
LB_6405:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6406:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6421:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6423
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6422
LB_6423:
	add rsp,8
	ret
LB_6425:
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
LB_6424:
	add rsp,64
	pop r14
LB_6422:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6478
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_5488 : %_5488
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5488 ⊢ %_5489 : %_5489
 ; {>  %_5488~°1◂{  }:(_lst)◂(t2405'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5489
 ; {>  %_5489~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2408'(0))) }
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
	jc LB_6476
	mov rsi,0
	bt r9,0
	jc LB_6476
	jmp LB_6477
LB_6476:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6477:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6478:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6480
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6479
LB_6480:
	add rsp,8
	ret
LB_6481:
	add rsp,0
	pop r14
LB_6479:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5378:
NS_E_RDI_5378:
NS_E_5378_ETR_TBL:
NS_E_5378_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_6546
LB_6545:
	add r14,1
LB_6546:
	cmp r14,r10
	jge LB_6547
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6545
	cmp al,10
	jz LB_6545
	cmp al,32
	jz LB_6545
LB_6547:
	add r14,3
	cmp r14,r10
	jg LB_6550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6550
	jmp LB_6551
LB_6550:
	jmp LB_6501
LB_6551:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6514
LB_6513:
	add r14,1
LB_6514:
	cmp r14,r10
	jge LB_6515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6513
	cmp al,10
	jz LB_6513
	cmp al,32
	jz LB_6513
LB_6515:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6516
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6517
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6517:
	jmp LB_6502
LB_6516:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_6520
LB_6519:
	add r14,1
LB_6520:
	cmp r14,r10
	jge LB_6521
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6519
	cmp al,10
	jz LB_6519
	cmp al,32
	jz LB_6519
LB_6521:
	add r14,1
	cmp r14,r10
	jg LB_6526
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6526
	jmp LB_6527
LB_6526:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6523
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6523:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6524:
	jmp LB_6502
LB_6527:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_6529
LB_6528:
	add r14,1
LB_6529:
	cmp r14,r10
	jge LB_6530
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6528
	cmp al,10
	jz LB_6528
	cmp al,32
	jz LB_6528
LB_6530:
	push r10
	call NS_E_5053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6531
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6532
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6532:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6533
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6533:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6534
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6534:
	jmp LB_6502
LB_6531:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_6537
LB_6536:
	add r14,1
LB_6537:
	cmp r14,r10
	jge LB_6538
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6536
	cmp al,10
	jz LB_6536
	cmp al,32
	jz LB_6536
LB_6538:
	push r10
	call NS_E_5378_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6539
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6540
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6540:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6541
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6541:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6542
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6542:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6543
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6543:
	jmp LB_6502
LB_6539:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6511
	btr r12,4
	clc
	jmp LB_6512
LB_6511:
	bts r12,4
	stc
LB_6512:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6509
	btr r12,3
	clc
	jmp LB_6510
LB_6509:
	bts r12,3
	stc
LB_6510:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6507
	btr r12,2
	clc
	jmp LB_6508
LB_6507:
	bts r12,2
	stc
LB_6508:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6505
	btr r12,1
	clc
	jmp LB_6506
LB_6505:
	bts r12,1
	stc
LB_6506:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6503
	btr r12,0
	clc
	jmp LB_6504
LB_6503:
	bts r12,0
	stc
LB_6504:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6498
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_6552
	btr r12,5
	jmp LB_6553
LB_6552:
	bts r12,5
LB_6553:
	mov r8,r10
	bt r12,4
	jc LB_6554
	btr r12,2
	jmp LB_6555
LB_6554:
	bts r12,2
LB_6555:
	mov r10,r14
	bt r12,1
	jc LB_6556
	btr r12,4
	jmp LB_6557
LB_6556:
	bts r12,4
LB_6557:
	mov r14,r9
	bt r12,3
	jc LB_6558
	btr r12,1
	jmp LB_6559
LB_6558:
	bts r12,1
LB_6559:
	mov r9,r13
	bt r12,0
	jc LB_6560
	btr r12,3
	jmp LB_6561
LB_6560:
	bts r12,3
LB_6561:
	mov r13,r10
	bt r12,4
	jc LB_6562
	btr r12,0
	jmp LB_6563
LB_6562:
	bts r12,0
LB_6563:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_5490 %_5491 } %_5492 } ⊢ %_5493 : %_5493
 ; {>  %_5490~0':_stg %_5492~2':(_lst)◂({ _stg _p1500 }) %_5491~1':_p1500 }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_5493 ⊢ %_5494 : %_5494
 ; {>  %_5493~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1500 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_5494
 ; {>  %_5494~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p1500 })) }
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
	jc LB_6488
	btr r12,5
	jmp LB_6489
LB_6488:
	bts r12,5
LB_6489:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6486
	btr QWORD [rdi],0
	jmp LB_6487
LB_6486:
	bts QWORD [rdi],0
LB_6487:
	mov r11,r14
	bt r12,1
	jc LB_6492
	btr r12,5
	jmp LB_6493
LB_6492:
	bts r12,5
LB_6493:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6490
	btr QWORD [rdi],1
	jmp LB_6491
LB_6490:
	bts QWORD [rdi],1
LB_6491:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6484
	btr QWORD [rdi],0
	jmp LB_6485
LB_6484:
	bts QWORD [rdi],0
LB_6485:
	mov r10,r8
	bt r12,2
	jc LB_6496
	btr r12,4
	jmp LB_6497
LB_6496:
	bts r12,4
LB_6497:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6494
	btr QWORD [rdi],1
	jmp LB_6495
LB_6494:
	bts QWORD [rdi],1
LB_6495:
	mov rsi,1
	bt r12,3
	jc LB_6482
	mov rsi,0
	bt r9,0
	jc LB_6482
	jmp LB_6483
LB_6482:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6483:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6498:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6500
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6499
LB_6500:
	add rsp,8
	ret
LB_6502:
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
LB_6501:
	add rsp,80
	pop r14
LB_6499:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6566
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_5495 : %_5495
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5495 ⊢ %_5496 : %_5496
 ; {>  %_5495~°1◂{  }:(_lst)◂(t2419'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5496
 ; {>  %_5496~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2422'(0))) }
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
	jc LB_6564
	mov rsi,0
	bt r9,0
	jc LB_6564
	jmp LB_6565
LB_6564:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6565:
	mov rax,0x0100_0000_0000_0001
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
LB_6569:
	add rsp,0
	pop r14
LB_6567:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5379:
NS_E_RDI_5379:
NS_E_5379_ETR_TBL:
NS_E_5379_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_6660
LB_6659:
	add r14,1
LB_6660:
	cmp r14,r10
	jge LB_6661
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6659
	cmp al,10
	jz LB_6659
	cmp al,32
	jz LB_6659
LB_6661:
	add r14,1
	cmp r14,r10
	jg LB_6664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6664
	jmp LB_6665
LB_6664:
	jmp LB_6607
LB_6665:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6622
LB_6621:
	add r14,1
LB_6622:
	cmp r14,r10
	jge LB_6623
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6621
	cmp al,10
	jz LB_6621
	cmp al,32
	jz LB_6621
LB_6623:
	add r14,1
	cmp r14,r10
	jg LB_6627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6627
	jmp LB_6628
LB_6627:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6625
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6625:
	jmp LB_6608
LB_6628:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6630
LB_6629:
	add r14,1
LB_6630:
	cmp r14,r10
	jge LB_6631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6629
	cmp al,10
	jz LB_6629
	cmp al,32
	jz LB_6629
LB_6631:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6632
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6633
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6633:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6634
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6634:
	jmp LB_6608
LB_6632:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_6637
LB_6636:
	add r14,1
LB_6637:
	cmp r14,r10
	jge LB_6638
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6636
	cmp al,10
	jz LB_6636
	cmp al,32
	jz LB_6636
LB_6638:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6639
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6640
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6640:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6641
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6641:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6642
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6642:
	jmp LB_6608
LB_6639:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_6645
LB_6644:
	add r14,1
LB_6645:
	cmp r14,r10
	jge LB_6646
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6644
	cmp al,10
	jz LB_6644
	cmp al,32
	jz LB_6644
LB_6646:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6647
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6648
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6648:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6649
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6649:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6650
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6650:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6651
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6651:
	jmp LB_6608
LB_6647:
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
LB_6657:
	jmp LB_6654
LB_6653:
	add r14,1
LB_6654:
	cmp r14,r10
	jge LB_6655
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6653
	cmp al,10
	jz LB_6653
	cmp al,32
	jz LB_6653
LB_6655:
	push r10
	push rsi
	call NS_E_5380_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6656
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6658
	bts QWORD [rax],0
LB_6658:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6657
LB_6656:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6619
	btr r12,5
	clc
	jmp LB_6620
LB_6619:
	bts r12,5
	stc
LB_6620:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6617
	btr r12,4
	clc
	jmp LB_6618
LB_6617:
	bts r12,4
	stc
LB_6618:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6615
	btr r12,3
	clc
	jmp LB_6616
LB_6615:
	bts r12,3
	stc
LB_6616:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6613
	btr r12,2
	clc
	jmp LB_6614
LB_6613:
	bts r12,2
	stc
LB_6614:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6611
	btr r12,1
	clc
	jmp LB_6612
LB_6611:
	bts r12,1
	stc
LB_6612:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6609
	btr r12,0
	clc
	jmp LB_6610
LB_6609:
	bts r12,0
	stc
LB_6610:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_6604
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_6666
	btr r12,6
	jmp LB_6667
LB_6666:
	bts r12,6
LB_6667:
	mov r9,r11
	bt r12,5
	jc LB_6668
	btr r12,3
	jmp LB_6669
LB_6668:
	bts r12,3
LB_6669:
	mov r11,r8
	bt r12,2
	jc LB_6670
	btr r12,5
	jmp LB_6671
LB_6670:
	bts r12,5
LB_6671:
	mov r8,r10
	bt r12,4
	jc LB_6672
	btr r12,2
	jmp LB_6673
LB_6672:
	bts r12,2
LB_6673:
	mov r10,r14
	bt r12,1
	jc LB_6674
	btr r12,4
	jmp LB_6675
LB_6674:
	bts r12,4
LB_6675:
	mov r14,rcx
	bt r12,6
	jc LB_6676
	btr r12,1
	jmp LB_6677
LB_6676:
	bts r12,1
LB_6677:
	mov rcx,r13
	bt r12,0
	jc LB_6678
	btr r12,6
	jmp LB_6679
LB_6678:
	bts r12,6
LB_6679:
	mov r13,r11
	bt r12,5
	jc LB_6680
	btr r12,0
	jmp LB_6681
LB_6680:
	bts r12,0
LB_6681:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f821 %_5500 ⊢ %_5501 : %_5501
 ; {>  %_5498~1':_p1499 %_5500~3':(_lst)◂({ _stg _p1499 _p1502 }) %_5499~2':_p1502 %_5497~0':_stg }
; _f821 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_6576
	btr r12,0
	jmp LB_6577
LB_6576:
	bts r12,0
LB_6577:
	call NS_E_821
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_6578
	btr r12,3
	jmp LB_6579
LB_6578:
	bts r12,3
LB_6579:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_6574
	btr r12,2
	clc
	jmp LB_6575
LB_6574:
	bts r12,2
	stc
LB_6575:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6572
	btr r12,1
	clc
	jmp LB_6573
LB_6572:
	bts r12,1
	stc
LB_6573:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6570
	btr r12,0
	clc
	jmp LB_6571
LB_6570:
	bts r12,0
	stc
LB_6571:
	add rsp,32
; _cns { { %_5497 %_5498 %_5499 } %_5501 } ⊢ %_5502 : %_5502
 ; {>  %_5498~1':_p1499 %_5501~3':(_lst)◂({ _stg _p1499 _p1502 }) %_5499~2':_p1502 %_5497~0':_stg }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f1513 %_5502 ⊢ %_5503 : %_5503
 ; {>  %_5502~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg _p1499 _p1502 }) }
; _f1513 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_5503 ⊢ %_5504 : %_5504
 ; {>  %_5503~°3◂°0◂{ { 0' 1' 2' } 3' }:_p1483 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_5504
 ; {>  %_5504~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p1483) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6580
	btr r12,4
	jmp LB_6581
LB_6580:
	bts r12,4
LB_6581:
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
	jc LB_6590
	btr r12,6
	jmp LB_6591
LB_6590:
	bts r12,6
LB_6591:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_6588
	btr QWORD [rdi],0
	jmp LB_6589
LB_6588:
	bts QWORD [rdi],0
LB_6589:
	mov rcx,r14
	bt r12,1
	jc LB_6594
	btr r12,6
	jmp LB_6595
LB_6594:
	bts r12,6
LB_6595:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_6592
	btr QWORD [rdi],1
	jmp LB_6593
LB_6592:
	bts QWORD [rdi],1
LB_6593:
	mov rcx,r8
	bt r12,2
	jc LB_6598
	btr r12,6
	jmp LB_6599
LB_6598:
	bts r12,6
LB_6599:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_6596
	btr QWORD [rdi],2
	jmp LB_6597
LB_6596:
	bts QWORD [rdi],2
LB_6597:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6586
	btr QWORD [rdi],0
	jmp LB_6587
LB_6586:
	bts QWORD [rdi],0
LB_6587:
	mov r11,r10
	bt r12,4
	jc LB_6602
	btr r12,5
	jmp LB_6603
LB_6602:
	bts r12,5
LB_6603:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6600
	btr QWORD [rdi],1
	jmp LB_6601
LB_6600:
	bts QWORD [rdi],1
LB_6601:
	mov rsi,1
	bt r12,3
	jc LB_6584
	mov rsi,0
	bt r9,0
	jc LB_6584
	jmp LB_6585
LB_6584:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6585:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6582
	mov rsi,0
	bt r9,0
	jc LB_6582
	jmp LB_6583
LB_6582:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6583:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6604:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6606
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6605
LB_6606:
	add rsp,8
	ret
LB_6608:
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
LB_6607:
	add rsp,96
	pop r14
LB_6605:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_6701
LB_6700:
	add r14,1
LB_6701:
	cmp r14,r10
	jge LB_6702
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6700
	cmp al,10
	jz LB_6700
	cmp al,32
	jz LB_6700
LB_6702:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6703
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6695
LB_6703:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_6706
LB_6705:
	add r14,1
LB_6706:
	cmp r14,r10
	jge LB_6707
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6705
	cmp al,10
	jz LB_6705
	cmp al,32
	jz LB_6705
LB_6707:
	push r10
	call NS_E_5381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6708
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6709
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6709:
	jmp LB_6695
LB_6708:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6698
	btr r12,1
	clc
	jmp LB_6699
LB_6698:
	bts r12,1
	stc
LB_6699:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6696
	btr r12,0
	clc
	jmp LB_6697
LB_6696:
	bts r12,0
	stc
LB_6697:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6692
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f1512 { %_5505 %_5506 } ⊢ %_5507 : %_5507
 ; {>  %_5505~0':_stg %_5506~1':_p1485 }
; _f1512 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_5507 ⊢ %_5508 : %_5508
 ; {>  %_5507~°2◂{ 0' 1' }:_p1483 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_5508
 ; {>  %_5508~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1483) }
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
	jc LB_6686
	btr r12,2
	jmp LB_6687
LB_6686:
	bts r12,2
LB_6687:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6684
	btr QWORD [rdi],0
	jmp LB_6685
LB_6684:
	bts QWORD [rdi],0
LB_6685:
	mov r8,r14
	bt r12,1
	jc LB_6690
	btr r12,2
	jmp LB_6691
LB_6690:
	bts r12,2
LB_6691:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6688
	btr QWORD [rdi],1
	jmp LB_6689
LB_6688:
	bts QWORD [rdi],1
LB_6689:
	mov rsi,1
	bt r12,3
	jc LB_6682
	mov rsi,0
	bt r9,0
	jc LB_6682
	jmp LB_6683
LB_6682:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6683:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6692:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6694
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6693
LB_6694:
	add rsp,8
	ret
LB_6695:
	add rsp,32
	pop r14
LB_6693:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6712
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_5509
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_5509 ⊢ %_5510 : %_5510
 ; {>  %_5509~0':_stg }
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
; _none {  } ⊢ %_5511 : %_5511
 ; {>  %_5510~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_5511
 ; {>  %_5511~°1◂{  }:(_opn)◂(t2445'(0)) %_5510~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6711
	mov rdi,r13
	call dlt
LB_6711:
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
LB_6712:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6714
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6713
LB_6714:
	add rsp,8
	ret
LB_6715:
	add rsp,0
	pop r14
LB_6713:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5380:
NS_E_RDI_5380:
NS_E_5380_ETR_TBL:
NS_E_5380_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_6743
LB_6742:
	add r14,1
LB_6743:
	cmp r14,r10
	jge LB_6744
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6742
	cmp al,10
	jz LB_6742
	cmp al,32
	jz LB_6742
LB_6744:
	add r14,1
	cmp r14,r10
	jg LB_6747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6747
	jmp LB_6748
LB_6747:
	jmp LB_6731
LB_6748:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6750
LB_6749:
	add r14,1
LB_6750:
	cmp r14,r10
	jge LB_6751
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6749
	cmp al,10
	jz LB_6749
	cmp al,32
	jz LB_6749
LB_6751:
	add r14,1
	cmp r14,r10
	jg LB_6755
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6755
	jmp LB_6756
LB_6755:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6753
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6753:
	jmp LB_6731
LB_6756:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6758
LB_6757:
	add r14,1
LB_6758:
	cmp r14,r10
	jge LB_6759
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6757
	cmp al,10
	jz LB_6757
	cmp al,32
	jz LB_6757
LB_6759:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6760
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6761
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6761:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6762
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6762:
	jmp LB_6731
LB_6760:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_6765
LB_6764:
	add r14,1
LB_6765:
	cmp r14,r10
	jge LB_6766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6764
	cmp al,10
	jz LB_6764
	cmp al,32
	jz LB_6764
LB_6766:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6767
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6768
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6768:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6769
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6769:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6770
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6770:
	jmp LB_6731
LB_6767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_6773
LB_6772:
	add r14,1
LB_6773:
	cmp r14,r10
	jge LB_6774
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6772
	cmp al,10
	jz LB_6772
	cmp al,32
	jz LB_6772
LB_6774:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6775
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6776
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6776:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6777
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6777:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6778
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6778:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6779
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6779:
	jmp LB_6731
LB_6775:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6740
	btr r12,4
	clc
	jmp LB_6741
LB_6740:
	bts r12,4
	stc
LB_6741:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6738
	btr r12,3
	clc
	jmp LB_6739
LB_6738:
	bts r12,3
	stc
LB_6739:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6736
	btr r12,2
	clc
	jmp LB_6737
LB_6736:
	bts r12,2
	stc
LB_6737:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6734
	btr r12,1
	clc
	jmp LB_6735
LB_6734:
	bts r12,1
	stc
LB_6735:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6732
	btr r12,0
	clc
	jmp LB_6733
LB_6732:
	bts r12,0
	stc
LB_6733:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6728
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_6781
	btr r12,5
	jmp LB_6782
LB_6781:
	bts r12,5
LB_6782:
	mov r8,r10
	bt r12,4
	jc LB_6783
	btr r12,2
	jmp LB_6784
LB_6783:
	bts r12,2
LB_6784:
	mov r10,r14
	bt r12,1
	jc LB_6785
	btr r12,4
	jmp LB_6786
LB_6785:
	bts r12,4
LB_6786:
	mov r14,r9
	bt r12,3
	jc LB_6787
	btr r12,1
	jmp LB_6788
LB_6787:
	bts r12,1
LB_6788:
	mov r9,r13
	bt r12,0
	jc LB_6789
	btr r12,3
	jmp LB_6790
LB_6789:
	bts r12,3
LB_6790:
	mov r13,r11
	bt r12,5
	jc LB_6791
	btr r12,0
	jmp LB_6792
LB_6791:
	bts r12,0
LB_6792:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_5512 %_5513 %_5514 } ⊢ %_5515 : %_5515
 ; {>  %_5514~2':_p1502 %_5512~0':_stg %_5513~1':_p1499 }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_5515
 ; {>  %_5515~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg _p1499 _p1502 }) }
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
	jc LB_6718
	btr r12,4
	jmp LB_6719
LB_6718:
	bts r12,4
LB_6719:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6716
	btr QWORD [rdi],0
	jmp LB_6717
LB_6716:
	bts QWORD [rdi],0
LB_6717:
	mov r10,r14
	bt r12,1
	jc LB_6722
	btr r12,4
	jmp LB_6723
LB_6722:
	bts r12,4
LB_6723:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6720
	btr QWORD [rdi],1
	jmp LB_6721
LB_6720:
	bts QWORD [rdi],1
LB_6721:
	mov r10,r8
	bt r12,2
	jc LB_6726
	btr r12,4
	jmp LB_6727
LB_6726:
	bts r12,4
LB_6727:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6724
	btr QWORD [rdi],2
	jmp LB_6725
LB_6724:
	bts QWORD [rdi],2
LB_6725:
	mov r8,0
	bts r12,2
	ret
LB_6728:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6730
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6729
LB_6730:
	add rsp,8
	ret
LB_6731:
	add rsp,80
	pop r14
LB_6729:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5381:
NS_E_RDI_5381:
NS_E_5381_ETR_TBL:
NS_E_5381_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_6813
LB_6812:
	add r14,1
LB_6813:
	cmp r14,r10
	jge LB_6814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6812
	cmp al,10
	jz LB_6812
	cmp al,32
	jz LB_6812
LB_6814:
	add r14,1
	cmp r14,r10
	jg LB_6817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6817
	jmp LB_6818
LB_6817:
	jmp LB_6800
LB_6818:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_6807
LB_6806:
	add r14,1
LB_6807:
	cmp r14,r10
	jge LB_6808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6806
	cmp al,10
	jz LB_6806
	cmp al,32
	jz LB_6806
LB_6808:
	push r10
	call NS_E_4390_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6809
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6810
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6810:
	jmp LB_6801
LB_6809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6804
	btr r12,1
	clc
	jmp LB_6805
LB_6804:
	bts r12,1
	stc
LB_6805:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6802
	btr r12,0
	clc
	jmp LB_6803
LB_6802:
	bts r12,0
	stc
LB_6803:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6797
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6819
	btr r12,2
	jmp LB_6820
LB_6819:
	bts r12,2
LB_6820:
	mov r13,r14
	bt r12,1
	jc LB_6821
	btr r12,0
	jmp LB_6822
LB_6821:
	bts r12,0
LB_6822:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1519 %_5516 ⊢ %_5517 : %_5517
 ; {>  %_5516~0':_p1501 }
; _f1519 0' ⊢ °1◂0'
; _some %_5517 ⊢ %_5518 : %_5518
 ; {>  %_5517~°1◂0':_p1485 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5518
 ; {>  %_5518~°0◂°1◂0':(_opn)◂(_p1485) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6795
	btr r12,3
	jmp LB_6796
LB_6795:
	bts r12,3
LB_6796:
	mov rsi,1
	bt r12,3
	jc LB_6793
	mov rsi,0
	bt r9,0
	jc LB_6793
	jmp LB_6794
LB_6793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6794:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6797:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6799
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6798
LB_6799:
	add rsp,8
	ret
LB_6801:
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
LB_6800:
	add rsp,32
	pop r14
LB_6798:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_6843
LB_6842:
	add r14,1
LB_6843:
	cmp r14,r10
	jge LB_6844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6842
	cmp al,10
	jz LB_6842
	cmp al,32
	jz LB_6842
LB_6844:
	add r14,2
	cmp r14,r10
	jg LB_6847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_6847
	jmp LB_6848
LB_6847:
	jmp LB_6830
LB_6848:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_6837
LB_6836:
	add r14,1
LB_6837:
	cmp r14,r10
	jge LB_6838
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6836
	cmp al,10
	jz LB_6836
	cmp al,32
	jz LB_6836
LB_6838:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6839
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6840
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6840:
	jmp LB_6831
LB_6839:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6834
	btr r12,1
	clc
	jmp LB_6835
LB_6834:
	bts r12,1
	stc
LB_6835:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6832
	btr r12,0
	clc
	jmp LB_6833
LB_6832:
	bts r12,0
	stc
LB_6833:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6827
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6849
	btr r12,2
	jmp LB_6850
LB_6849:
	bts r12,2
LB_6850:
	mov r13,r14
	bt r12,1
	jc LB_6851
	btr r12,0
	jmp LB_6852
LB_6851:
	bts r12,0
LB_6852:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1520 %_5519 ⊢ %_5520 : %_5520
 ; {>  %_5519~0':_p1502 }
; _f1520 0' ⊢ °2◂0'
; _some %_5520 ⊢ %_5521 : %_5521
 ; {>  %_5520~°2◂0':_p1485 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_5521
 ; {>  %_5521~°0◂°2◂0':(_opn)◂(_p1485) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6825
	btr r12,3
	jmp LB_6826
LB_6825:
	bts r12,3
LB_6826:
	mov rsi,1
	bt r12,3
	jc LB_6823
	mov rsi,0
	bt r9,0
	jc LB_6823
	jmp LB_6824
LB_6823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6824:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6827:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6829
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6828
LB_6829:
	add rsp,8
	ret
LB_6831:
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
LB_6830:
	add rsp,32
	pop r14
LB_6828:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_6872
LB_6871:
	add r14,1
LB_6872:
	cmp r14,r10
	jge LB_6873
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6871
	cmp al,10
	jz LB_6871
	cmp al,32
	jz LB_6871
LB_6873:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6874
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6866
LB_6874:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_6877
LB_6876:
	add r14,1
LB_6877:
	cmp r14,r10
	jge LB_6878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6876
	cmp al,10
	jz LB_6876
	cmp al,32
	jz LB_6876
LB_6878:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6879
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6880:
	jmp LB_6866
LB_6879:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6869
	btr r12,1
	clc
	jmp LB_6870
LB_6869:
	bts r12,1
	stc
LB_6870:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6867
	btr r12,0
	clc
	jmp LB_6868
LB_6867:
	bts r12,0
	stc
LB_6868:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6863
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f1518 { %_5522 %_5523 } ⊢ %_5524 : %_5524
 ; {>  %_5523~1':_p1502 %_5522~0':_p1499 }
; _f1518 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5524 ⊢ %_5525 : %_5525
 ; {>  %_5524~°0◂{ 0' 1' }:_p1485 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5525
 ; {>  %_5525~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1485) }
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
	jc LB_6857
	btr r12,2
	jmp LB_6858
LB_6857:
	bts r12,2
LB_6858:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6855
	btr QWORD [rdi],0
	jmp LB_6856
LB_6855:
	bts QWORD [rdi],0
LB_6856:
	mov r8,r14
	bt r12,1
	jc LB_6861
	btr r12,2
	jmp LB_6862
LB_6861:
	bts r12,2
LB_6862:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6859
	btr QWORD [rdi],1
	jmp LB_6860
LB_6859:
	bts QWORD [rdi],1
LB_6860:
	mov rsi,1
	bt r12,3
	jc LB_6853
	mov rsi,0
	bt r9,0
	jc LB_6853
	jmp LB_6854
LB_6853:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6854:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6863:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6865
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6864
LB_6865:
	add rsp,8
	ret
LB_6866:
	add rsp,32
	pop r14
LB_6864:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5382:
NS_E_RDI_5382:
NS_E_5382_ETR_TBL:
NS_E_5382_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
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
	add r14,3
	cmp r14,r10
	jg LB_6906
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6906
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6906
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_6906
	jmp LB_6907
LB_6906:
	jmp LB_6889
LB_6907:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_6896
LB_6895:
	add r14,1
LB_6896:
	cmp r14,r10
	jge LB_6897
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6895
	cmp al,10
	jz LB_6895
	cmp al,32
	jz LB_6895
LB_6897:
	push r10
	call NS_E_4519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6898
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6899
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6899:
	jmp LB_6890
LB_6898:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6893
	btr r12,1
	clc
	jmp LB_6894
LB_6893:
	bts r12,1
	stc
LB_6894:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6891
	btr r12,0
	clc
	jmp LB_6892
LB_6891:
	bts r12,0
	stc
LB_6892:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6886
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6908
	btr r12,2
	jmp LB_6909
LB_6908:
	bts r12,2
LB_6909:
	mov r13,r14
	bt r12,1
	jc LB_6910
	btr r12,0
	jmp LB_6911
LB_6910:
	bts r12,0
LB_6911:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1561 %_5526 ⊢ %_5527 : %_5527
 ; {>  %_5526~0':_p1498 }
; _f1561 0' ⊢ °2◂0'
; _some %_5527 ⊢ %_5528 : %_5528
 ; {>  %_5527~°2◂0':_p1502 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_5528
 ; {>  %_5528~°0◂°2◂0':(_opn)◂(_p1502) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6884
	btr r12,3
	jmp LB_6885
LB_6884:
	bts r12,3
LB_6885:
	mov rsi,1
	bt r12,3
	jc LB_6882
	mov rsi,0
	bt r9,0
	jc LB_6882
	jmp LB_6883
LB_6882:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6883:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6886:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6888
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6887
LB_6888:
	add rsp,8
	ret
LB_6890:
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
LB_6889:
	add rsp,32
	pop r14
LB_6887:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_6923
LB_6922:
	add r14,1
LB_6923:
	cmp r14,r10
	jge LB_6924
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6922
	cmp al,10
	jz LB_6922
	cmp al,32
	jz LB_6922
LB_6924:
	push r10
	call NS_E_5391_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6925
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6919
LB_6925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
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
	add rsp,16
	push rdi
	push rsi
	push LB_6916
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1560 %_5529 ⊢ %_5530 : %_5530
 ; {>  %_5529~0':_p1503 }
; _f1560 0' ⊢ °1◂0'
; _some %_5530 ⊢ %_5531 : %_5531
 ; {>  %_5530~°1◂0':_p1502 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5531
 ; {>  %_5531~°0◂°1◂0':(_opn)◂(_p1502) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6914
	btr r12,3
	jmp LB_6915
LB_6914:
	bts r12,3
LB_6915:
	mov rsi,1
	bt r12,3
	jc LB_6912
	mov rsi,0
	bt r9,0
	jc LB_6912
	jmp LB_6913
LB_6912:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6913:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6916:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6918
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6917
LB_6918:
	add rsp,8
	ret
LB_6919:
	add rsp,16
	pop r14
LB_6917:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_6958
LB_6957:
	add r14,1
LB_6958:
	cmp r14,r10
	jge LB_6959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6957
	cmp al,10
	jz LB_6957
	cmp al,32
	jz LB_6957
LB_6959:
	push r10
	call NS_E_5383_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6960
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6952
LB_6960:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_6963
LB_6962:
	add r14,1
LB_6963:
	cmp r14,r10
	jge LB_6964
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6962
	cmp al,10
	jz LB_6962
	cmp al,32
	jz LB_6962
LB_6964:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6965
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6966
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6966:
	jmp LB_6952
LB_6965:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6955
	btr r12,1
	clc
	jmp LB_6956
LB_6955:
	bts r12,1
	stc
LB_6956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6953
	btr r12,0
	clc
	jmp LB_6954
LB_6953:
	bts r12,0
	stc
LB_6954:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6949
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_6968
	btr r12,3
	jmp LB_6969
LB_6968:
	bts r12,3
LB_6969:
	mov r10,r13
	bt r12,0
	jc LB_6970
	btr r12,4
	jmp LB_6971
LB_6970:
	bts r12,4
LB_6971:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_6974
	btr r12,5
	clc
	jmp LB_6975
LB_6974:
	bts r12,5
	stc
LB_6975:
	mov r13,r11
	bt r12,5
	jc LB_6972
	btr r12,0
	jmp LB_6973
LB_6972:
	bts r12,0
LB_6973:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_6978
	btr r12,5
	clc
	jmp LB_6979
LB_6978:
	bts r12,5
	stc
LB_6979:
	mov r14,r11
	bt r12,5
	jc LB_6976
	btr r12,1
	jmp LB_6977
LB_6976:
	bts r12,1
LB_6977:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_6982
	btr r12,5
	clc
	jmp LB_6983
LB_6982:
	bts r12,5
	stc
LB_6983:
	mov r8,r11
	bt r12,5
	jc LB_6980
	btr r12,2
	jmp LB_6981
LB_6980:
	bts r12,2
LB_6981:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1559 { %_5532 %_5533 } ⊢ %_5534 : %_5534
 ; {>  %_5532~{ 0' 1' 2' }:{ _p1507 _p1498 _p1499 } %_5533~3':_p1502 }
; _f1559 { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _some %_5534 ⊢ %_5535 : %_5535
 ; {>  %_5534~°0◂{ { 0' 1' 2' } 3' }:_p1502 }
; _some °0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_5535
 ; {>  %_5535~°0◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p1502) }
; 	∎ °0◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6927
	btr r12,4
	jmp LB_6928
LB_6927:
	bts r12,4
LB_6928:
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
	jc LB_6935
	btr r12,6
	jmp LB_6936
LB_6935:
	bts r12,6
LB_6936:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_6933
	btr QWORD [rdi],0
	jmp LB_6934
LB_6933:
	bts QWORD [rdi],0
LB_6934:
	mov rcx,r14
	bt r12,1
	jc LB_6939
	btr r12,6
	jmp LB_6940
LB_6939:
	bts r12,6
LB_6940:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_6937
	btr QWORD [rdi],1
	jmp LB_6938
LB_6937:
	bts QWORD [rdi],1
LB_6938:
	mov rcx,r8
	bt r12,2
	jc LB_6943
	btr r12,6
	jmp LB_6944
LB_6943:
	bts r12,6
LB_6944:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_6941
	btr QWORD [rdi],2
	jmp LB_6942
LB_6941:
	bts QWORD [rdi],2
LB_6942:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6931
	btr QWORD [rdi],0
	jmp LB_6932
LB_6931:
	bts QWORD [rdi],0
LB_6932:
	mov r11,r10
	bt r12,4
	jc LB_6947
	btr r12,5
	jmp LB_6948
LB_6947:
	bts r12,5
LB_6948:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6945
	btr QWORD [rdi],1
	jmp LB_6946
LB_6945:
	bts QWORD [rdi],1
LB_6946:
	mov rsi,1
	bt r12,3
	jc LB_6929
	mov rsi,0
	bt r9,0
	jc LB_6929
	jmp LB_6930
LB_6929:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6930:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6949:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6951
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6950
LB_6951:
	add rsp,8
	ret
LB_6952:
	add rsp,32
	pop r14
LB_6950:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5383:
NS_E_RDI_5383:
NS_E_5383_ETR_TBL:
NS_E_5383_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_7049
LB_7048:
	add r14,1
LB_7049:
	cmp r14,r10
	jge LB_7050
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7048
	cmp al,10
	jz LB_7048
	cmp al,32
	jz LB_7048
LB_7050:
	add r14,1
	cmp r14,r10
	jg LB_7053
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_7053
	jmp LB_7054
LB_7053:
	jmp LB_7004
LB_7054:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_7017
LB_7016:
	add r14,1
LB_7017:
	cmp r14,r10
	jge LB_7018
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7016
	cmp al,10
	jz LB_7016
	cmp al,32
	jz LB_7016
LB_7018:
	push r10
	call NS_E_4519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7019
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7020
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7020:
	jmp LB_7005
LB_7019:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7023
LB_7022:
	add r14,1
LB_7023:
	cmp r14,r10
	jge LB_7024
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7022
	cmp al,10
	jz LB_7022
	cmp al,32
	jz LB_7022
LB_7024:
	add r14,3
	cmp r14,r10
	jg LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7029
	jmp LB_7030
LB_7029:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7026
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7026:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7027
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7027:
	jmp LB_7005
LB_7030:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7032
LB_7031:
	add r14,1
LB_7032:
	cmp r14,r10
	jge LB_7033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7031
	cmp al,10
	jz LB_7031
	cmp al,32
	jz LB_7031
LB_7033:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7034
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7035
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7035:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7036
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7036:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7037
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7037:
	jmp LB_7005
LB_7034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_7040
LB_7039:
	add r14,1
LB_7040:
	cmp r14,r10
	jge LB_7041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7039
	cmp al,10
	jz LB_7039
	cmp al,32
	jz LB_7039
LB_7041:
	push r10
	call NS_E_4786_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7042
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7043
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7043:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7044
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7044:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7045
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7045:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7046
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7046:
	jmp LB_7005
LB_7042:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7014
	btr r12,4
	clc
	jmp LB_7015
LB_7014:
	bts r12,4
	stc
LB_7015:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7012
	btr r12,3
	clc
	jmp LB_7013
LB_7012:
	bts r12,3
	stc
LB_7013:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7010
	btr r12,2
	clc
	jmp LB_7011
LB_7010:
	bts r12,2
	stc
LB_7011:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7008
	btr r12,1
	clc
	jmp LB_7009
LB_7008:
	bts r12,1
	stc
LB_7009:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7006
	btr r12,0
	clc
	jmp LB_7007
LB_7006:
	bts r12,0
	stc
LB_7007:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7001
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_7055
	btr r12,5
	jmp LB_7056
LB_7055:
	bts r12,5
LB_7056:
	mov r8,r10
	bt r12,4
	jc LB_7057
	btr r12,2
	jmp LB_7058
LB_7057:
	bts r12,2
LB_7058:
	mov r10,r14
	bt r12,1
	jc LB_7059
	btr r12,4
	jmp LB_7060
LB_7059:
	bts r12,4
LB_7060:
	mov r14,r9
	bt r12,3
	jc LB_7061
	btr r12,1
	jmp LB_7062
LB_7061:
	bts r12,1
LB_7062:
	mov r9,r13
	bt r12,0
	jc LB_7063
	btr r12,3
	jmp LB_7064
LB_7063:
	bts r12,3
LB_7064:
	mov r13,r10
	bt r12,4
	jc LB_7065
	btr r12,0
	jmp LB_7066
LB_7065:
	bts r12,0
LB_7066:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_5539 : %_5539
 ; {>  %_5536~0':_p1498 %_5538~2':_p4785 %_5537~1':_p1499 }
; 	» 0xr1 _ ⊢ 3' : %_5539
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f1571 %_5539 ⊢ %_5540 : %_5540
 ; {>  %_5536~0':_p1498 %_5539~3':_r64 %_5538~2':_p4785 %_5537~1':_p1499 }
; _f1571 3' ⊢ °1◂3'
; _some { %_5540 %_5536 %_5537 } ⊢ %_5541 : %_5541
 ; {>  %_5536~0':_p1498 %_5540~°1◂3':_p1507 %_5538~2':_p4785 %_5537~1':_p1499 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_5541
 ; {>  %_5538~2':_p4785 %_5541~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p1507 _p1498 _p1499 }) }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_6984
	mov rdi,r8
	call dlt
LB_6984:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6985
	btr r12,4
	jmp LB_6986
LB_6985:
	bts r12,4
LB_6986:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_6991
	btr r12,2
	jmp LB_6992
LB_6991:
	bts r12,2
LB_6992:
	mov rsi,1
	bt r12,2
	jc LB_6989
	mov rsi,0
	bt r8,0
	jc LB_6989
	jmp LB_6990
LB_6989:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6990:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6987
	btr QWORD [rdi],0
	jmp LB_6988
LB_6987:
	bts QWORD [rdi],0
LB_6988:
	mov r8,r13
	bt r12,0
	jc LB_6995
	btr r12,2
	jmp LB_6996
LB_6995:
	bts r12,2
LB_6996:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6993
	btr QWORD [rdi],1
	jmp LB_6994
LB_6993:
	bts QWORD [rdi],1
LB_6994:
	mov r8,r14
	bt r12,1
	jc LB_6999
	btr r12,2
	jmp LB_7000
LB_6999:
	bts r12,2
LB_7000:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_6997
	btr QWORD [rdi],2
	jmp LB_6998
LB_6997:
	bts QWORD [rdi],2
LB_6998:
	mov r8,0
	bts r12,2
	ret
LB_7001:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7003
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7002
LB_7003:
	add rsp,8
	ret
LB_7005:
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
LB_7004:
	add rsp,80
	pop r14
LB_7002:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_7159
LB_7158:
	add r14,1
LB_7159:
	cmp r14,r10
	jge LB_7160
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7158
	cmp al,10
	jz LB_7158
	cmp al,32
	jz LB_7158
LB_7160:
	add r14,3
	cmp r14,r10
	jg LB_7163
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7163
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_7163
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_7163
	jmp LB_7164
LB_7163:
	jmp LB_7100
LB_7164:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_7115
LB_7114:
	add r14,1
LB_7115:
	cmp r14,r10
	jge LB_7116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7114
	cmp al,10
	jz LB_7114
	cmp al,32
	jz LB_7114
LB_7116:
	push r10
	call NS_E_4519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7117
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7118
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7118:
	jmp LB_7101
LB_7117:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_7121
LB_7120:
	add r14,1
LB_7121:
	cmp r14,r10
	jge LB_7122
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7120
	cmp al,10
	jz LB_7120
	cmp al,32
	jz LB_7120
LB_7122:
	add r14,1
	cmp r14,r10
	jg LB_7127
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_7127
	jmp LB_7128
LB_7127:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7124
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7124:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7125
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7125:
	jmp LB_7101
LB_7128:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_7130
LB_7129:
	add r14,1
LB_7130:
	cmp r14,r10
	jge LB_7131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7129
	cmp al,10
	jz LB_7129
	cmp al,32
	jz LB_7129
LB_7131:
	push r10
	call NS_E_4519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7132
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7133
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7133:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7134
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7134:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7135
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7135:
	jmp LB_7101
LB_7132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_7138
LB_7137:
	add r14,1
LB_7138:
	cmp r14,r10
	jge LB_7139
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7137
	cmp al,10
	jz LB_7137
	cmp al,32
	jz LB_7137
LB_7139:
	add r14,3
	cmp r14,r10
	jg LB_7146
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7146
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7146
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7146
	jmp LB_7147
LB_7146:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7141
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7141:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7142
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7142:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7143
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7143:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7144
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7144:
	jmp LB_7101
LB_7147:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_7149
LB_7148:
	add r14,1
LB_7149:
	cmp r14,r10
	jge LB_7150
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7148
	cmp al,10
	jz LB_7148
	cmp al,32
	jz LB_7148
LB_7150:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7151
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_7152
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_7152:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7153
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7153:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7154
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7154:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7155
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7155:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7156
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7156:
	jmp LB_7101
LB_7151:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_7112
	btr r12,5
	clc
	jmp LB_7113
LB_7112:
	bts r12,5
	stc
LB_7113:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7110
	btr r12,4
	clc
	jmp LB_7111
LB_7110:
	bts r12,4
	stc
LB_7111:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7108
	btr r12,3
	clc
	jmp LB_7109
LB_7108:
	bts r12,3
	stc
LB_7109:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7106
	btr r12,2
	clc
	jmp LB_7107
LB_7106:
	bts r12,2
	stc
LB_7107:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7104
	btr r12,1
	clc
	jmp LB_7105
LB_7104:
	bts r12,1
	stc
LB_7105:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7102
	btr r12,0
	clc
	jmp LB_7103
LB_7102:
	bts r12,0
	stc
LB_7103:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_7097
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_7165
	btr r12,6
	jmp LB_7166
LB_7165:
	bts r12,6
LB_7166:
	mov r8,r11
	bt r12,5
	jc LB_7167
	btr r12,2
	jmp LB_7168
LB_7167:
	bts r12,2
LB_7168:
	mov r11,r14
	bt r12,1
	jc LB_7169
	btr r12,5
	jmp LB_7170
LB_7169:
	bts r12,5
LB_7170:
	mov r14,r9
	bt r12,3
	jc LB_7171
	btr r12,1
	jmp LB_7172
LB_7171:
	bts r12,1
LB_7172:
	mov r9,r13
	bt r12,0
	jc LB_7173
	btr r12,3
	jmp LB_7174
LB_7173:
	bts r12,3
LB_7174:
	mov r13,r11
	bt r12,5
	jc LB_7175
	btr r12,0
	jmp LB_7176
LB_7175:
	bts r12,0
LB_7176:
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
; _f1572 {  } ⊢ %_5545 : %_5545
 ; {>  %_5543~1':_p1498 %_5542~0':_p1498 %_5544~2':_p1499 }
; _f1572 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_5546 : %_5546
 ; {>  %_5543~1':_p1498 %_5545~°2◂{  }:_p1507 %_5542~0':_p1498 %_5544~2':_p1499 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_5543 %_5546 } ⊢ %_5547 : %_5547
 ; {>  %_5543~1':_p1498 %_5545~°2◂{  }:_p1507 %_5542~0':_p1498 %_5546~°1◂{  }:(_lst)◂(t2492'(0)) %_5544~2':_p1499 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_5542 %_5547 } ⊢ %_5548 : %_5548
 ; {>  %_5545~°2◂{  }:_p1507 %_5542~0':_p1498 %_5544~2':_p1499 %_5547~°0◂{ 1' °1◂{  } }:(_lst)◂(_p1498) }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f1547 %_5548 ⊢ %_5549 : %_5549
 ; {>  %_5548~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p1498) %_5545~°2◂{  }:_p1507 %_5544~2':_p1499 }
; _f1547 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_5545 %_5549 %_5544 } ⊢ %_5550 : %_5550
 ; {>  %_5545~°2◂{  }:_p1507 %_5544~2':_p1499 %_5549~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p1498 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_5550
 ; {>  %_5550~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p1507 _p1498 _p1499 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
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
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_7069
	mov rsi,0
	bt r10,0
	jc LB_7069
	jmp LB_7070
LB_7069:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7070:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_7067
	btr QWORD [rdi],0
	jmp LB_7068
LB_7067:
	bts QWORD [rdi],0
LB_7068:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_7079
	btr r12,5
	jmp LB_7080
LB_7079:
	bts r12,5
LB_7080:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_7077
	btr QWORD [rdi],0
	jmp LB_7078
LB_7077:
	bts QWORD [rdi],0
LB_7078:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_7087
	btr r12,0
	jmp LB_7088
LB_7087:
	bts r12,0
LB_7088:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_7085
	btr QWORD [rdi],0
	jmp LB_7086
LB_7085:
	bts QWORD [rdi],0
LB_7086:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_7091
	mov rsi,0
	bt r13,0
	jc LB_7091
	jmp LB_7092
LB_7091:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7092:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_7089
	btr QWORD [rdi],1
	jmp LB_7090
LB_7089:
	bts QWORD [rdi],1
LB_7090:
	mov rsi,1
	bt r12,5
	jc LB_7083
	mov rsi,0
	bt r11,0
	jc LB_7083
	jmp LB_7084
LB_7083:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7084:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_7081
	btr QWORD [rdi],1
	jmp LB_7082
LB_7081:
	bts QWORD [rdi],1
LB_7082:
	mov rsi,1
	bt r12,4
	jc LB_7075
	mov rsi,0
	bt r10,0
	jc LB_7075
	jmp LB_7076
LB_7075:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7076:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_7073
	mov rsi,0
	bt r10,0
	jc LB_7073
	jmp LB_7074
LB_7073:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7074:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_7071
	btr QWORD [rdi],1
	jmp LB_7072
LB_7071:
	bts QWORD [rdi],1
LB_7072:
	mov r10,r8
	bt r12,2
	jc LB_7095
	btr r12,4
	jmp LB_7096
LB_7095:
	bts r12,4
LB_7096:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_7093
	btr QWORD [rdi],2
	jmp LB_7094
LB_7093:
	bts QWORD [rdi],2
LB_7094:
	mov r8,0
	bts r12,2
	ret
LB_7097:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7099
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7098
LB_7099:
	add rsp,8
	ret
LB_7101:
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
LB_7100:
	add rsp,96
	pop r14
LB_7098:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_7205
LB_7204:
	add r14,1
LB_7205:
	cmp r14,r10
	jge LB_7206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7204
	cmp al,10
	jz LB_7204
	cmp al,32
	jz LB_7204
LB_7206:
	add r14,2
	cmp r14,r10
	jg LB_7209
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_7209
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_7209
	jmp LB_7210
LB_7209:
	jmp LB_7192
LB_7210:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
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
	push r10
	call NS_E_5384_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7201
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7202
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7202:
	jmp LB_7193
LB_7201:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7196
	btr r12,1
	clc
	jmp LB_7197
LB_7196:
	bts r12,1
	stc
LB_7197:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7194
	btr r12,0
	clc
	jmp LB_7195
LB_7194:
	bts r12,0
	stc
LB_7195:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7189
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_7211
	btr r12,3
	jmp LB_7212
LB_7211:
	bts r12,3
LB_7212:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_7215
	btr r12,4
	clc
	jmp LB_7216
LB_7215:
	bts r12,4
	stc
LB_7216:
	mov r13,r10
	bt r12,4
	jc LB_7213
	btr r12,0
	jmp LB_7214
LB_7213:
	bts r12,0
LB_7214:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_7219
	btr r12,4
	clc
	jmp LB_7220
LB_7219:
	bts r12,4
	stc
LB_7220:
	mov r14,r10
	bt r12,4
	jc LB_7217
	btr r12,1
	jmp LB_7218
LB_7217:
	bts r12,1
LB_7218:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_7223
	btr r12,4
	clc
	jmp LB_7224
LB_7223:
	bts r12,4
	stc
LB_7224:
	mov r8,r10
	bt r12,4
	jc LB_7221
	btr r12,2
	jmp LB_7222
LB_7221:
	bts r12,2
LB_7222:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5551 ⊢ %_5552 : %_5552
 ; {>  %_5551~{ 0' 1' 2' }:{ _p1507 _p1498 _p1499 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_5552
 ; {>  %_5552~°0◂{ 0' 1' 2' }:(_opn)◂({ _p1507 _p1498 _p1499 }) }
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
	jc LB_7179
	btr r12,4
	jmp LB_7180
LB_7179:
	bts r12,4
LB_7180:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_7177
	btr QWORD [rdi],0
	jmp LB_7178
LB_7177:
	bts QWORD [rdi],0
LB_7178:
	mov r10,r14
	bt r12,1
	jc LB_7183
	btr r12,4
	jmp LB_7184
LB_7183:
	bts r12,4
LB_7184:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_7181
	btr QWORD [rdi],1
	jmp LB_7182
LB_7181:
	bts QWORD [rdi],1
LB_7182:
	mov r10,r8
	bt r12,2
	jc LB_7187
	btr r12,4
	jmp LB_7188
LB_7187:
	bts r12,4
LB_7188:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_7185
	btr QWORD [rdi],2
	jmp LB_7186
LB_7185:
	bts QWORD [rdi],2
LB_7186:
	mov r8,0
	bts r12,2
	ret
LB_7189:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7191
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7190
LB_7191:
	add rsp,8
	ret
LB_7193:
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
LB_7192:
	add rsp,32
	pop r14
LB_7190:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_7252
LB_7251:
	add r14,1
LB_7252:
	cmp r14,r10
	jge LB_7253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7251
	cmp al,10
	jz LB_7251
	cmp al,32
	jz LB_7251
LB_7253:
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7254
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7242
LB_7254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_7257
LB_7256:
	add r14,1
LB_7257:
	cmp r14,r10
	jge LB_7258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7256
	cmp al,10
	jz LB_7256
	cmp al,32
	jz LB_7256
LB_7258:
	push r10
	call NS_E_4519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7259
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7260
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7260:
	jmp LB_7242
LB_7259:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7263
LB_7262:
	add r14,1
LB_7263:
	cmp r14,r10
	jge LB_7264
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7262
	cmp al,10
	jz LB_7262
	cmp al,32
	jz LB_7262
LB_7264:
	add r14,3
	cmp r14,r10
	jg LB_7269
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7269
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7269
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7269
	jmp LB_7270
LB_7269:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7266
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7266:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7267
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7267:
	jmp LB_7242
LB_7270:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
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
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7274
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7275
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7275:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7276
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7276:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7277
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7277:
	jmp LB_7242
LB_7274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7249
	btr r12,3
	clc
	jmp LB_7250
LB_7249:
	bts r12,3
	stc
LB_7250:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7247
	btr r12,2
	clc
	jmp LB_7248
LB_7247:
	bts r12,2
	stc
LB_7248:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7245
	btr r12,1
	clc
	jmp LB_7246
LB_7245:
	bts r12,1
	stc
LB_7246:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7243
	btr r12,0
	clc
	jmp LB_7244
LB_7243:
	bts r12,0
	stc
LB_7244:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7239
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_7279
	btr r12,4
	jmp LB_7280
LB_7279:
	bts r12,4
LB_7280:
	mov r8,r9
	bt r12,3
	jc LB_7281
	btr r12,2
	jmp LB_7282
LB_7281:
	bts r12,2
LB_7282:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1570 %_5553 ⊢ %_5556 : %_5556
 ; {>  %_5555~2':_p1499 %_5554~1':_p1498 %_5553~0':_p1435 }
; _f1570 0' ⊢ °0◂0'
; _some { %_5556 %_5554 %_5555 } ⊢ %_5557 : %_5557
 ; {>  %_5555~2':_p1499 %_5554~1':_p1498 %_5556~°0◂0':_p1507 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_5557
 ; {>  %_5557~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p1507 _p1498 _p1499 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_7229
	btr r12,4
	jmp LB_7230
LB_7229:
	bts r12,4
LB_7230:
	mov rsi,1
	bt r12,4
	jc LB_7227
	mov rsi,0
	bt r10,0
	jc LB_7227
	jmp LB_7228
LB_7227:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7228:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_7225
	btr QWORD [rdi],0
	jmp LB_7226
LB_7225:
	bts QWORD [rdi],0
LB_7226:
	mov r10,r14
	bt r12,1
	jc LB_7233
	btr r12,4
	jmp LB_7234
LB_7233:
	bts r12,4
LB_7234:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_7231
	btr QWORD [rdi],1
	jmp LB_7232
LB_7231:
	bts QWORD [rdi],1
LB_7232:
	mov r10,r8
	bt r12,2
	jc LB_7237
	btr r12,4
	jmp LB_7238
LB_7237:
	bts r12,4
LB_7238:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_7235
	btr QWORD [rdi],2
	jmp LB_7236
LB_7235:
	bts QWORD [rdi],2
LB_7236:
	mov r8,0
	bts r12,2
	ret
LB_7239:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7241
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7240
LB_7241:
	add rsp,8
	ret
LB_7242:
	add rsp,64
	pop r14
LB_7240:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5384:
NS_E_RDI_5384:
NS_E_5384_ETR_TBL:
NS_E_5384_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_7341
LB_7340:
	add r14,1
LB_7341:
	cmp r14,r10
	jge LB_7342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7340
	cmp al,10
	jz LB_7340
	cmp al,32
	jz LB_7340
LB_7342:
	add r14,2
	cmp r14,r10
	jg LB_7345
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_7345
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_7345
	jmp LB_7346
LB_7345:
	jmp LB_7308
LB_7346:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_7319
LB_7318:
	add r14,1
LB_7319:
	cmp r14,r10
	jge LB_7320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7318
	cmp al,10
	jz LB_7318
	cmp al,32
	jz LB_7318
LB_7320:
	push r10
	call NS_E_5385_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7321
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7322
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7322:
	jmp LB_7309
LB_7321:
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
LB_7328:
	jmp LB_7325
LB_7324:
	add r14,1
LB_7325:
	cmp r14,r10
	jge LB_7326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7324
	cmp al,10
	jz LB_7324
	cmp al,32
	jz LB_7324
LB_7326:
	push r10
	push rsi
	call NS_E_5386_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_7327
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_7329
	bts QWORD [rax],0
LB_7329:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_7328
LB_7327:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
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
	add r14,2
	cmp r14,r10
	jg LB_7338
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_7338
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_7338
	jmp LB_7339
LB_7338:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7334
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7334:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7335
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7335:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7336
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7336:
	jmp LB_7309
LB_7339:
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
	jc LB_7316
	btr r12,3
	clc
	jmp LB_7317
LB_7316:
	bts r12,3
	stc
LB_7317:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7314
	btr r12,2
	clc
	jmp LB_7315
LB_7314:
	bts r12,2
	stc
LB_7315:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7312
	btr r12,1
	clc
	jmp LB_7313
LB_7312:
	bts r12,1
	stc
LB_7313:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7310
	btr r12,0
	clc
	jmp LB_7311
LB_7310:
	bts r12,0
	stc
LB_7311:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7305
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_7347
	btr r12,4
	jmp LB_7348
LB_7347:
	bts r12,4
LB_7348:
	mov r9,r8
	bt r12,2
	jc LB_7349
	btr r12,3
	jmp LB_7350
LB_7349:
	bts r12,3
LB_7350:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_7351
	btr r12,4
	jmp LB_7352
LB_7351:
	bts r12,4
LB_7352:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_7355
	btr r12,5
	clc
	jmp LB_7356
LB_7355:
	bts r12,5
	stc
LB_7356:
	mov r13,r11
	bt r12,5
	jc LB_7353
	btr r12,0
	jmp LB_7354
LB_7353:
	bts r12,0
LB_7354:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_7359
	btr r12,5
	clc
	jmp LB_7360
LB_7359:
	bts r12,5
	stc
LB_7360:
	mov r14,r11
	bt r12,5
	jc LB_7357
	btr r12,1
	jmp LB_7358
LB_7357:
	bts r12,1
LB_7358:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_7363
	btr r12,5
	clc
	jmp LB_7364
LB_7363:
	bts r12,5
	stc
LB_7364:
	mov r8,r11
	bt r12,5
	jc LB_7361
	btr r12,2
	jmp LB_7362
LB_7361:
	bts r12,2
LB_7362:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1574 { %_5558 %_5561 } ⊢ %_5562 : %_5562
 ; {>  %_5559~1':_p1498 %_5560~2':_p1499 %_5558~0':_r64 %_5561~3':(_lst)◂(_p1508) }
; _f1574 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_5562 %_5559 %_5560 } ⊢ %_5563 : %_5563
 ; {>  %_5559~1':_p1498 %_5560~2':_p1499 %_5562~°4◂{ 0' 3' }:_p1507 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_5563
 ; {>  %_5563~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p1507 _p1498 _p1499 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_7283
	btr r12,4
	jmp LB_7284
LB_7283:
	bts r12,4
LB_7284:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
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
	jc LB_7291
	btr r12,6
	jmp LB_7292
LB_7291:
	bts r12,6
LB_7292:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_7289
	btr QWORD [rdi],0
	jmp LB_7290
LB_7289:
	bts QWORD [rdi],0
LB_7290:
	mov rcx,r10
	bt r12,4
	jc LB_7295
	btr r12,6
	jmp LB_7296
LB_7295:
	bts r12,6
LB_7296:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_7293
	btr QWORD [rdi],1
	jmp LB_7294
LB_7293:
	bts QWORD [rdi],1
LB_7294:
	mov rsi,1
	bt r12,5
	jc LB_7287
	mov rsi,0
	bt r11,0
	jc LB_7287
	jmp LB_7288
LB_7287:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_7288:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_7285
	btr QWORD [rdi],0
	jmp LB_7286
LB_7285:
	bts QWORD [rdi],0
LB_7286:
	mov r11,r14
	bt r12,1
	jc LB_7299
	btr r12,5
	jmp LB_7300
LB_7299:
	bts r12,5
LB_7300:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_7297
	btr QWORD [rdi],1
	jmp LB_7298
LB_7297:
	bts QWORD [rdi],1
LB_7298:
	mov r11,r8
	bt r12,2
	jc LB_7303
	btr r12,5
	jmp LB_7304
LB_7303:
	bts r12,5
LB_7304:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_7301
	btr QWORD [rdi],2
	jmp LB_7302
LB_7301:
	bts QWORD [rdi],2
LB_7302:
	mov r8,0
	bts r12,2
	ret
LB_7305:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7307
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7306
LB_7307:
	add rsp,8
	ret
LB_7309:
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
LB_7308:
	add rsp,64
	pop r14
LB_7306:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_7394
LB_7393:
	add r14,1
LB_7394:
	cmp r14,r10
	jge LB_7395
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7393
	cmp al,10
	jz LB_7393
	cmp al,32
	jz LB_7393
LB_7395:
	push r10
	call NS_E_4390_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7396
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7384
LB_7396:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_7399
LB_7398:
	add r14,1
LB_7399:
	cmp r14,r10
	jge LB_7400
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7398
	cmp al,10
	jz LB_7398
	cmp al,32
	jz LB_7398
LB_7400:
	add r14,1
	cmp r14,r10
	jg LB_7404
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_7404
	jmp LB_7405
LB_7404:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7402
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7402:
	jmp LB_7384
LB_7405:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_7407
LB_7406:
	add r14,1
LB_7407:
	cmp r14,r10
	jge LB_7408
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7406
	cmp al,10
	jz LB_7406
	cmp al,32
	jz LB_7406
LB_7408:
	add r14,3
	cmp r14,r10
	jg LB_7413
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7413
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7413
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7413
	jmp LB_7414
LB_7413:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7410
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7410:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7411
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7411:
	jmp LB_7384
LB_7414:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_7416
LB_7415:
	add r14,1
LB_7416:
	cmp r14,r10
	jge LB_7417
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7415
	cmp al,10
	jz LB_7415
	cmp al,32
	jz LB_7415
LB_7417:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7418
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7419
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7419:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7420
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7420:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7421
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7421:
	jmp LB_7384
LB_7418:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7391
	btr r12,3
	clc
	jmp LB_7392
LB_7391:
	bts r12,3
	stc
LB_7392:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7389
	btr r12,2
	clc
	jmp LB_7390
LB_7389:
	bts r12,2
	stc
LB_7390:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7387
	btr r12,1
	clc
	jmp LB_7388
LB_7387:
	bts r12,1
	stc
LB_7388:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7385
	btr r12,0
	clc
	jmp LB_7386
LB_7385:
	bts r12,0
	stc
LB_7386:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7381
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_7423
	btr r12,4
	jmp LB_7424
LB_7423:
	bts r12,4
LB_7424:
	mov r14,r9
	bt r12,3
	jc LB_7425
	btr r12,1
	jmp LB_7426
LB_7425:
	bts r12,1
LB_7426:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1573 %_5564 ⊢ %_5566 : %_5566
 ; {>  %_5565~1':_p1499 %_5564~0':_p1501 }
; _f1573 0' ⊢ °3◂0'
; _nil {  } ⊢ %_5567 : %_5567
 ; {>  %_5566~°3◂0':_p1507 %_5565~1':_p1499 }
; _nil {  } ⊢ °1◂{  }
; _f1547 %_5567 ⊢ %_5568 : %_5568
 ; {>  %_5567~°1◂{  }:(_lst)◂(t2521'(0)) %_5566~°3◂0':_p1507 %_5565~1':_p1499 }
; _f1547 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_5566 %_5568 %_5565 } ⊢ %_5569 : %_5569
 ; {>  %_5566~°3◂0':_p1507 %_5565~1':_p1499 %_5568~°0◂°1◂{  }:_p1498 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_5569
 ; {>  %_5569~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p1507 _p1498 _p1499 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_7369
	btr r12,2
	jmp LB_7370
LB_7369:
	bts r12,2
LB_7370:
	mov rsi,1
	bt r12,2
	jc LB_7367
	mov rsi,0
	bt r8,0
	jc LB_7367
	jmp LB_7368
LB_7367:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7368:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7365
	btr QWORD [rdi],0
	jmp LB_7366
LB_7365:
	bts QWORD [rdi],0
LB_7366:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_7375
	mov rsi,0
	bt r8,0
	jc LB_7375
	jmp LB_7376
LB_7375:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7376:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_7373
	mov rsi,0
	bt r8,0
	jc LB_7373
	jmp LB_7374
LB_7373:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7374:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7371
	btr QWORD [rdi],1
	jmp LB_7372
LB_7371:
	bts QWORD [rdi],1
LB_7372:
	mov r8,r14
	bt r12,1
	jc LB_7379
	btr r12,2
	jmp LB_7380
LB_7379:
	bts r12,2
LB_7380:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_7377
	btr QWORD [rdi],2
	jmp LB_7378
LB_7377:
	bts QWORD [rdi],2
LB_7378:
	mov r8,0
	bts r12,2
	ret
LB_7381:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7383
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7382
LB_7383:
	add rsp,8
	ret
LB_7384:
	add rsp,64
	pop r14
LB_7382:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5385:
NS_E_RDI_5385:
NS_E_5385_ETR_TBL:
NS_E_5385_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_7480
LB_7479:
	add r14,1
LB_7480:
	cmp r14,r10
	jge LB_7481
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7479
	cmp al,10
	jz LB_7479
	cmp al,32
	jz LB_7479
LB_7481:
	add r14,1
	cmp r14,r10
	jg LB_7484
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_7484
	jmp LB_7485
LB_7484:
	jmp LB_7456
LB_7485:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_7465
LB_7464:
	add r14,1
LB_7465:
	cmp r14,r10
	jge LB_7466
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7464
	cmp al,10
	jz LB_7464
	cmp al,32
	jz LB_7464
LB_7466:
	add r14,3
	cmp r14,r10
	jg LB_7470
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7470
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7470
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7470
	jmp LB_7471
LB_7470:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7468
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7468:
	jmp LB_7457
LB_7471:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_7473
LB_7472:
	add r14,1
LB_7473:
	cmp r14,r10
	jge LB_7474
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7472
	cmp al,10
	jz LB_7472
	cmp al,32
	jz LB_7472
LB_7474:
	push r10
	call NS_E_4788_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7475
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7476
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7476:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7477
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7477:
	jmp LB_7457
LB_7475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7462
	btr r12,2
	clc
	jmp LB_7463
LB_7462:
	bts r12,2
	stc
LB_7463:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7460
	btr r12,1
	clc
	jmp LB_7461
LB_7460:
	bts r12,1
	stc
LB_7461:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7458
	btr r12,0
	clc
	jmp LB_7459
LB_7458:
	bts r12,0
	stc
LB_7459:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7453
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_7486
	btr r12,3
	jmp LB_7487
LB_7486:
	bts r12,3
LB_7487:
	mov r13,r8
	bt r12,2
	jc LB_7488
	btr r12,0
	jmp LB_7489
LB_7488:
	bts r12,0
LB_7489:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_5571 : %_5571
 ; {>  %_5570~0':_p1497 }
; 	» 0xr0 _ ⊢ 1' : %_5571
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_5572 : %_5572
 ; {>  %_5571~1':_r64 %_5570~0':_p1497 }
; _nil {  } ⊢ °1◂{  }
; _f1547 %_5572 ⊢ %_5573 : %_5573
 ; {>  %_5572~°1◂{  }:(_lst)◂(t2529'(0)) %_5571~1':_r64 %_5570~0':_p1497 }
; _f1547 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_5574 : %_5574
 ; {>  %_5573~°0◂°1◂{  }:_p1498 %_5571~1':_r64 %_5570~0':_p1497 }
; _nil {  } ⊢ °1◂{  }
; _f1550 %_5570 ⊢ %_5575 : %_5575
 ; {>  %_5574~°1◂{  }:(_lst)◂(t2533'(0)) %_5573~°0◂°1◂{  }:_p1498 %_5571~1':_r64 %_5570~0':_p1497 }
; _f1550 0' ⊢ °1◂0'
; _cns { %_5575 %_5574 } ⊢ %_5576 : %_5576
 ; {>  %_5575~°1◂0':_p1499 %_5574~°1◂{  }:(_lst)◂(t2533'(0)) %_5573~°0◂°1◂{  }:_p1498 %_5571~1':_r64 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f1549 %_5576 ⊢ %_5577 : %_5577
 ; {>  %_5573~°0◂°1◂{  }:_p1498 %_5576~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p1499) %_5571~1':_r64 }
; _f1549 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_5571 %_5573 %_5577 } ⊢ %_5578 : %_5578
 ; {>  %_5573~°0◂°1◂{  }:_p1498 %_5571~1':_r64 %_5577~°0◂°0◂{ °1◂0' °1◂{  } }:_p1499 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_5578
 ; {>  %_5578~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p1498 _p1499 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_7429
	btr r12,2
	jmp LB_7430
LB_7429:
	bts r12,2
LB_7430:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7427
	btr QWORD [rdi],0
	jmp LB_7428
LB_7427:
	bts QWORD [rdi],0
LB_7428:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_7435
	mov rsi,0
	bt r8,0
	jc LB_7435
	jmp LB_7436
LB_7435:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7436:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_7433
	mov rsi,0
	bt r8,0
	jc LB_7433
	jmp LB_7434
LB_7433:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7434:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7431
	btr QWORD [rdi],1
	jmp LB_7432
LB_7431:
	bts QWORD [rdi],1
LB_7432:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_7447
	btr r12,1
	jmp LB_7448
LB_7447:
	bts r12,1
LB_7448:
	mov rsi,1
	bt r12,1
	jc LB_7445
	mov rsi,0
	bt r14,0
	jc LB_7445
	jmp LB_7446
LB_7445:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7446:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7443
	btr QWORD [rdi],0
	jmp LB_7444
LB_7443:
	bts QWORD [rdi],0
LB_7444:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7451
	mov rsi,0
	bt r14,0
	jc LB_7451
	jmp LB_7452
LB_7451:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7452:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7449
	btr QWORD [rdi],1
	jmp LB_7450
LB_7449:
	bts QWORD [rdi],1
LB_7450:
	mov rsi,1
	bt r12,2
	jc LB_7441
	mov rsi,0
	bt r8,0
	jc LB_7441
	jmp LB_7442
LB_7441:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7442:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_7439
	mov rsi,0
	bt r8,0
	jc LB_7439
	jmp LB_7440
LB_7439:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7440:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_7437
	btr QWORD [rdi],2
	jmp LB_7438
LB_7437:
	bts QWORD [rdi],2
LB_7438:
	mov r8,0
	bts r12,2
	ret
LB_7453:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7455
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7454
LB_7455:
	add rsp,8
	ret
LB_7457:
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
LB_7456:
	add rsp,48
	pop r14
LB_7454:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_7543
LB_7542:
	add r14,1
LB_7543:
	cmp r14,r10
	jge LB_7544
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7542
	cmp al,10
	jz LB_7542
	cmp al,32
	jz LB_7542
LB_7544:
	push r10
	call NS_E_4522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7545
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7531
LB_7545:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_7548
LB_7547:
	add r14,1
LB_7548:
	cmp r14,r10
	jge LB_7549
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7547
	cmp al,10
	jz LB_7547
	cmp al,32
	jz LB_7547
LB_7549:
	push r10
	call NS_E_4521_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7550
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7551
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7551:
	jmp LB_7531
LB_7550:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_7554
LB_7553:
	add r14,1
LB_7554:
	cmp r14,r10
	jge LB_7555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7553
	cmp al,10
	jz LB_7553
	cmp al,32
	jz LB_7553
LB_7555:
	add r14,3
	cmp r14,r10
	jg LB_7560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7560
	jmp LB_7561
LB_7560:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7557
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7557:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7558
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7558:
	jmp LB_7531
LB_7561:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_7563
LB_7562:
	add r14,1
LB_7563:
	cmp r14,r10
	jge LB_7564
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7562
	cmp al,10
	jz LB_7562
	cmp al,32
	jz LB_7562
LB_7564:
	push r10
	call NS_E_4788_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7565
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7566
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7566:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7567
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7567:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7568
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7568:
	jmp LB_7531
LB_7565:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_7571
LB_7570:
	add r14,1
LB_7571:
	cmp r14,r10
	jge LB_7572
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7570
	cmp al,10
	jz LB_7570
	cmp al,32
	jz LB_7570
LB_7572:
	push r10
	call NS_E_4787_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7573
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7574
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7574:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7575
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7575:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7576
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7576:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7577:
	jmp LB_7531
LB_7573:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7540
	btr r12,4
	clc
	jmp LB_7541
LB_7540:
	bts r12,4
	stc
LB_7541:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7538
	btr r12,3
	clc
	jmp LB_7539
LB_7538:
	bts r12,3
	stc
LB_7539:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7536
	btr r12,2
	clc
	jmp LB_7537
LB_7536:
	bts r12,2
	stc
LB_7537:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7534
	btr r12,1
	clc
	jmp LB_7535
LB_7534:
	bts r12,1
	stc
LB_7535:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7532
	btr r12,0
	clc
	jmp LB_7533
LB_7532:
	bts r12,0
	stc
LB_7533:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7528
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_7579
	btr r12,5
	jmp LB_7580
LB_7579:
	bts r12,5
LB_7580:
	mov r9,r10
	bt r12,4
	jc LB_7581
	btr r12,3
	jmp LB_7582
LB_7581:
	bts r12,3
LB_7582:
	mov r10,r8
	bt r12,2
	jc LB_7583
	btr r12,4
	jmp LB_7584
LB_7583:
	bts r12,4
LB_7584:
	mov r8,r11
	bt r12,5
	jc LB_7585
	btr r12,2
	jmp LB_7586
LB_7585:
	bts r12,2
LB_7586:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f1548 %_5579 ⊢ %_5583 : %_5583
 ; {>  %_5579~0':_p1496 %_5582~3':(_lst)◂(_p1499) %_5581~2':_p1497 %_5580~1':(_lst)◂(_p1498) }
; _f1548 0' ⊢ °1◂0'
; _f1550 %_5581 ⊢ %_5584 : %_5584
 ; {>  %_5583~°1◂0':_p1498 %_5582~3':(_lst)◂(_p1499) %_5581~2':_p1497 %_5580~1':(_lst)◂(_p1498) }
; _f1550 2' ⊢ °1◂2'
; _cns { %_5583 %_5580 } ⊢ %_5585 : %_5585
 ; {>  %_5583~°1◂0':_p1498 %_5584~°1◂2':_p1499 %_5582~3':(_lst)◂(_p1499) %_5580~1':(_lst)◂(_p1498) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_5584 %_5582 } ⊢ %_5586 : %_5586
 ; {>  %_5585~°0◂{ °1◂0' 1' }:(_lst)◂(_p1498) %_5584~°1◂2':_p1499 %_5582~3':(_lst)◂(_p1499) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f1547 %_5585 ⊢ %_5587 : %_5587
 ; {>  %_5585~°0◂{ °1◂0' 1' }:(_lst)◂(_p1498) %_5586~°0◂{ °1◂2' 3' }:(_lst)◂(_p1499) }
; _f1547 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f1549 %_5586 ⊢ %_5588 : %_5588
 ; {>  %_5587~°0◂°0◂{ °1◂0' 1' }:_p1498 %_5586~°0◂{ °1◂2' 3' }:(_lst)◂(_p1499) }
; _f1549 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_5589 : %_5589
 ; {>  %_5587~°0◂°0◂{ °1◂0' 1' }:_p1498 %_5588~°0◂°0◂{ °1◂2' 3' }:_p1499 }
; 	» 0xr1 _ ⊢ 4' : %_5589
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_5589 %_5587 %_5588 } ⊢ %_5590 : %_5590
 ; {>  %_5587~°0◂°0◂{ °1◂0' 1' }:_p1498 %_5589~4':_r64 %_5588~°0◂°0◂{ °1◂2' 3' }:_p1499 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_5590
 ; {>  %_5590~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p1498 _p1499 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_7490
	btr r12,5
	jmp LB_7491
LB_7490:
	bts r12,5
LB_7491:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_7494
	btr r12,6
	jmp LB_7495
LB_7494:
	bts r12,6
LB_7495:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_7492
	btr QWORD [rdi],0
	jmp LB_7493
LB_7492:
	bts QWORD [rdi],0
LB_7493:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_7506
	btr r12,4
	jmp LB_7507
LB_7506:
	bts r12,4
LB_7507:
	mov rsi,1
	bt r12,4
	jc LB_7504
	mov rsi,0
	bt r10,0
	jc LB_7504
	jmp LB_7505
LB_7504:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7505:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_7502
	btr QWORD [rdi],0
	jmp LB_7503
LB_7502:
	bts QWORD [rdi],0
LB_7503:
	mov r10,r14
	bt r12,1
	jc LB_7510
	btr r12,4
	jmp LB_7511
LB_7510:
	bts r12,4
LB_7511:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_7508
	btr QWORD [rdi],1
	jmp LB_7509
LB_7508:
	bts QWORD [rdi],1
LB_7509:
	mov rsi,1
	bt r12,6
	jc LB_7500
	mov rsi,0
	bt rcx,0
	jc LB_7500
	jmp LB_7501
LB_7500:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_7501:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_7498
	mov rsi,0
	bt rcx,0
	jc LB_7498
	jmp LB_7499
LB_7498:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_7499:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_7496
	btr QWORD [rdi],1
	jmp LB_7497
LB_7496:
	bts QWORD [rdi],1
LB_7497:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_7522
	btr r12,0
	jmp LB_7523
LB_7522:
	bts r12,0
LB_7523:
	mov rsi,1
	bt r12,0
	jc LB_7520
	mov rsi,0
	bt r13,0
	jc LB_7520
	jmp LB_7521
LB_7520:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7521:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_7518
	btr QWORD [rdi],0
	jmp LB_7519
LB_7518:
	bts QWORD [rdi],0
LB_7519:
	mov r13,r11
	bt r12,5
	jc LB_7526
	btr r12,0
	jmp LB_7527
LB_7526:
	bts r12,0
LB_7527:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_7524
	btr QWORD [rdi],1
	jmp LB_7525
LB_7524:
	bts QWORD [rdi],1
LB_7525:
	mov rsi,1
	bt r12,6
	jc LB_7516
	mov rsi,0
	bt rcx,0
	jc LB_7516
	jmp LB_7517
LB_7516:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_7517:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_7514
	mov rsi,0
	bt rcx,0
	jc LB_7514
	jmp LB_7515
LB_7514:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_7515:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_7512
	btr QWORD [rdi],2
	jmp LB_7513
LB_7512:
	bts QWORD [rdi],2
LB_7513:
	mov r8,0
	bts r12,2
	ret
LB_7528:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7530
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7529
LB_7530:
	add rsp,8
	ret
LB_7531:
	add rsp,80
	pop r14
LB_7529:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5386:
NS_E_RDI_5386:
NS_E_5386_ETR_TBL:
NS_E_5386_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_7616
LB_7615:
	add r14,1
LB_7616:
	cmp r14,r10
	jge LB_7617
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7615
	cmp al,10
	jz LB_7615
	cmp al,32
	jz LB_7615
LB_7617:
	push r10
	call NS_E_5387_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7618
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7600
LB_7618:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_7621
LB_7620:
	add r14,1
LB_7621:
	cmp r14,r10
	jge LB_7622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7620
	cmp al,10
	jz LB_7620
	cmp al,32
	jz LB_7620
LB_7622:
	add r14,1
	cmp r14,r10
	jg LB_7626
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_7626
	jmp LB_7627
LB_7626:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7624
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7624:
	jmp LB_7600
LB_7627:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_7609
LB_7608:
	add r14,1
LB_7609:
	cmp r14,r10
	jge LB_7610
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7608
	cmp al,10
	jz LB_7608
	cmp al,32
	jz LB_7608
LB_7610:
	push r10
	call NS_E_892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7611
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7612
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7612:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7613
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7613:
	jmp LB_7601
LB_7611:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7606
	btr r12,2
	clc
	jmp LB_7607
LB_7606:
	bts r12,2
	stc
LB_7607:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7604
	btr r12,1
	clc
	jmp LB_7605
LB_7604:
	bts r12,1
	stc
LB_7605:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7602
	btr r12,0
	clc
	jmp LB_7603
LB_7602:
	bts r12,0
	stc
LB_7603:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7597
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_7628
	btr r12,3
	jmp LB_7629
LB_7628:
	bts r12,3
LB_7629:
	mov r14,r8
	bt r12,2
	jc LB_7630
	btr r12,1
	jmp LB_7631
LB_7630:
	bts r12,1
LB_7631:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1578 { %_5591 %_5592 } ⊢ %_5593 : %_5593
 ; {>  %_5591~0':_r64 %_5592~1':_stg }
; _f1578 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_5593 ⊢ %_5594 : %_5594
 ; {>  %_5593~°3◂{ 0' 1' }:_p1508 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_5594
 ; {>  %_5594~°0◂°3◂{ 0' 1' }:(_opn)◂(_p1508) }
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
	jc LB_7591
	btr r12,2
	jmp LB_7592
LB_7591:
	bts r12,2
LB_7592:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7589
	btr QWORD [rdi],0
	jmp LB_7590
LB_7589:
	bts QWORD [rdi],0
LB_7590:
	mov r8,r14
	bt r12,1
	jc LB_7595
	btr r12,2
	jmp LB_7596
LB_7595:
	bts r12,2
LB_7596:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7593
	btr QWORD [rdi],1
	jmp LB_7594
LB_7593:
	bts QWORD [rdi],1
LB_7594:
	mov rsi,1
	bt r12,3
	jc LB_7587
	mov rsi,0
	bt r9,0
	jc LB_7587
	jmp LB_7588
LB_7587:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7588:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7597:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7599
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7598
LB_7599:
	add rsp,8
	ret
LB_7601:
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
LB_7600:
	add rsp,48
	pop r14
LB_7598:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_7643
LB_7642:
	add r14,1
LB_7643:
	cmp r14,r10
	jge LB_7644
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7642
	cmp al,10
	jz LB_7642
	cmp al,32
	jz LB_7642
LB_7644:
	push r10
	call NS_E_5389_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7645
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7639
LB_7645:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7640
	btr r12,0
	clc
	jmp LB_7641
LB_7640:
	bts r12,0
	stc
LB_7641:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7636
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1575 %_5595 ⊢ %_5596 : %_5596
 ; {>  %_5595~0':_stg }
; _f1575 0' ⊢ °0◂0'
; _some %_5596 ⊢ %_5597 : %_5597
 ; {>  %_5596~°0◂0':_p1508 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5597
 ; {>  %_5597~°0◂°0◂0':(_opn)◂(_p1508) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7634
	btr r12,3
	jmp LB_7635
LB_7634:
	bts r12,3
LB_7635:
	mov rsi,1
	bt r12,3
	jc LB_7632
	mov rsi,0
	bt r9,0
	jc LB_7632
	jmp LB_7633
LB_7632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7633:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7636:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7638
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7637
LB_7638:
	add rsp,8
	ret
LB_7639:
	add rsp,16
	pop r14
LB_7637:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_7658
LB_7657:
	add r14,1
LB_7658:
	cmp r14,r10
	jge LB_7659
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7657
	cmp al,10
	jz LB_7657
	cmp al,32
	jz LB_7657
LB_7659:
	push r10
	call NS_E_892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7660
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7654
LB_7660:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7655
	btr r12,0
	clc
	jmp LB_7656
LB_7655:
	bts r12,0
	stc
LB_7656:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7651
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1575 %_5598 ⊢ %_5599 : %_5599
 ; {>  %_5598~0':_stg }
; _f1575 0' ⊢ °0◂0'
; _some %_5599 ⊢ %_5600 : %_5600
 ; {>  %_5599~°0◂0':_p1508 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5600
 ; {>  %_5600~°0◂°0◂0':(_opn)◂(_p1508) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7649
	btr r12,3
	jmp LB_7650
LB_7649:
	bts r12,3
LB_7650:
	mov rsi,1
	bt r12,3
	jc LB_7647
	mov rsi,0
	bt r9,0
	jc LB_7647
	jmp LB_7648
LB_7647:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7648:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7651:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7653
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7652
LB_7653:
	add rsp,8
	ret
LB_7654:
	add rsp,16
	pop r14
LB_7652:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_7673
LB_7672:
	add r14,1
LB_7673:
	cmp r14,r10
	jge LB_7674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7672
	cmp al,10
	jz LB_7672
	cmp al,32
	jz LB_7672
LB_7674:
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7675
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7669
LB_7675:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7670
	btr r12,0
	clc
	jmp LB_7671
LB_7670:
	bts r12,0
	stc
LB_7671:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7666
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1576 %_5601 ⊢ %_5602 : %_5602
 ; {>  %_5601~0':_p1435 }
; _f1576 0' ⊢ °1◂0'
; _some %_5602 ⊢ %_5603 : %_5603
 ; {>  %_5602~°1◂0':_p1508 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5603
 ; {>  %_5603~°0◂°1◂0':(_opn)◂(_p1508) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7664
	btr r12,3
	jmp LB_7665
LB_7664:
	bts r12,3
LB_7665:
	mov rsi,1
	bt r12,3
	jc LB_7662
	mov rsi,0
	bt r9,0
	jc LB_7662
	jmp LB_7663
LB_7662:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7663:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7666:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7668
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7667
LB_7668:
	add rsp,8
	ret
LB_7669:
	add rsp,16
	pop r14
LB_7667:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_7694
LB_7693:
	add r14,1
LB_7694:
	cmp r14,r10
	jge LB_7695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7693
	cmp al,10
	jz LB_7693
	cmp al,32
	jz LB_7693
LB_7695:
	push r10
	call NS_E_5388_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7696
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7690
LB_7696:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
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
	add rsp,16
	push rdi
	push rsi
	push LB_7687
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_7698
	btr r12,2
	jmp LB_7699
LB_7698:
	bts r12,2
LB_7699:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_7702
	btr r12,3
	clc
	jmp LB_7703
LB_7702:
	bts r12,3
	stc
LB_7703:
	mov r13,r9
	bt r12,3
	jc LB_7700
	btr r12,0
	jmp LB_7701
LB_7700:
	bts r12,0
LB_7701:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_7706
	btr r12,3
	clc
	jmp LB_7707
LB_7706:
	bts r12,3
	stc
LB_7707:
	mov r14,r9
	bt r12,3
	jc LB_7704
	btr r12,1
	jmp LB_7705
LB_7704:
	bts r12,1
LB_7705:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1577 %_5604 ⊢ %_5605 : %_5605
 ; {>  %_5604~{ 0' 1' }:{ _p1509 _r64 } }
; _f1577 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_5605 ⊢ %_5606 : %_5606
 ; {>  %_5605~°2◂{ 0' 1' }:_p1508 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_5606
 ; {>  %_5606~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1508) }
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
	jc LB_7681
	btr r12,2
	jmp LB_7682
LB_7681:
	bts r12,2
LB_7682:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7679
	btr QWORD [rdi],0
	jmp LB_7680
LB_7679:
	bts QWORD [rdi],0
LB_7680:
	mov r8,r14
	bt r12,1
	jc LB_7685
	btr r12,2
	jmp LB_7686
LB_7685:
	bts r12,2
LB_7686:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7683
	btr QWORD [rdi],1
	jmp LB_7684
LB_7683:
	bts QWORD [rdi],1
LB_7684:
	mov rsi,1
	bt r12,3
	jc LB_7677
	mov rsi,0
	bt r9,0
	jc LB_7677
	jmp LB_7678
LB_7677:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7678:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
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
	add rsp,16
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
NS_E_5387:
NS_E_RDI_5387:
NS_E_5387_ETR_TBL:
NS_E_5387_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7721
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7713
LB_7721:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7729
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7729
	jmp LB_7730
LB_7729:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7727
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7727:
	jmp LB_7713
LB_7730:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7716
	btr r12,1
	clc
	jmp LB_7717
LB_7716:
	bts r12,1
	stc
LB_7717:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7714
	btr r12,0
	clc
	jmp LB_7715
LB_7714:
	bts r12,0
	stc
LB_7715:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7710
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5607 ⊢ %_5608 : %_5608
 ; {>  %_5607~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_5608
 ; {>  %_5608~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7708
	btr r12,3
	jmp LB_7709
LB_7708:
	bts r12,3
LB_7709:
	mov r8,0
	bts r12,2
	ret
LB_7710:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7712
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7711
LB_7712:
	add rsp,8
	ret
LB_7713:
	add rsp,32
	pop r14
LB_7711:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5388:
NS_E_RDI_5388:
NS_E_5388_ETR_TBL:
NS_E_5388_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7750
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7742
LB_7750:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_7758
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_7758
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7758
	jmp LB_7759
LB_7758:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7756
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7756:
	jmp LB_7742
LB_7759:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7745
	btr r12,1
	clc
	jmp LB_7746
LB_7745:
	bts r12,1
	stc
LB_7746:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7743
	btr r12,0
	clc
	jmp LB_7744
LB_7743:
	bts r12,0
	stc
LB_7744:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7739
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f1580 {  } ⊢ %_5610 : %_5610
 ; {>  %_5609~0':_r64 }
; _f1580 {  } ⊢ °1◂{  }
; _some { %_5610 %_5609 } ⊢ %_5611 : %_5611
 ; {>  %_5609~0':_r64 %_5610~°1◂{  }:_p1509 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_5611
 ; {>  %_5611~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p1509 _r64 }) }
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
	jc LB_7733
	mov rsi,0
	bt r14,0
	jc LB_7733
	jmp LB_7734
LB_7733:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7734:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7731
	btr QWORD [rdi],0
	jmp LB_7732
LB_7731:
	bts QWORD [rdi],0
LB_7732:
	mov r14,r13
	bt r12,0
	jc LB_7737
	btr r12,1
	jmp LB_7738
LB_7737:
	bts r12,1
LB_7738:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7735
	btr QWORD [rdi],1
	jmp LB_7736
LB_7735:
	bts QWORD [rdi],1
LB_7736:
	mov r8,0
	bts r12,2
	ret
LB_7739:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7741
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7740
LB_7741:
	add rsp,8
	ret
LB_7742:
	add rsp,32
	pop r14
LB_7740:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7779
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7771
LB_7779:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_7787
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_7787
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7787
	jmp LB_7788
LB_7787:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7785
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7785:
	jmp LB_7771
LB_7788:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7774
	btr r12,1
	clc
	jmp LB_7775
LB_7774:
	bts r12,1
	stc
LB_7775:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7772
	btr r12,0
	clc
	jmp LB_7773
LB_7772:
	bts r12,0
	stc
LB_7773:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7768
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f1581 {  } ⊢ %_5613 : %_5613
 ; {>  %_5612~0':_r64 }
; _f1581 {  } ⊢ °2◂{  }
; _some { %_5613 %_5612 } ⊢ %_5614 : %_5614
 ; {>  %_5612~0':_r64 %_5613~°2◂{  }:_p1509 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_5614
 ; {>  %_5614~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p1509 _r64 }) }
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
	jc LB_7762
	mov rsi,0
	bt r14,0
	jc LB_7762
	jmp LB_7763
LB_7762:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7763:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7760
	btr QWORD [rdi],0
	jmp LB_7761
LB_7760:
	bts QWORD [rdi],0
LB_7761:
	mov r14,r13
	bt r12,0
	jc LB_7766
	btr r12,1
	jmp LB_7767
LB_7766:
	bts r12,1
LB_7767:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7764
	btr QWORD [rdi],1
	jmp LB_7765
LB_7764:
	bts QWORD [rdi],1
LB_7765:
	mov r8,0
	bts r12,2
	ret
LB_7768:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7770
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7769
LB_7770:
	add rsp,8
	ret
LB_7771:
	add rsp,32
	pop r14
LB_7769:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7808
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7800
LB_7808:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7816
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7816
	jmp LB_7817
LB_7816:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7814
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7814:
	jmp LB_7800
LB_7817:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
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
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f1579 {  } ⊢ %_5616 : %_5616
 ; {>  %_5615~0':_r64 }
; _f1579 {  } ⊢ °0◂{  }
; _some { %_5616 %_5615 } ⊢ %_5617 : %_5617
 ; {>  %_5616~°0◂{  }:_p1509 %_5615~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_5617
 ; {>  %_5617~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p1509 _r64 }) }
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
	jc LB_7791
	mov rsi,0
	bt r14,0
	jc LB_7791
	jmp LB_7792
LB_7791:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7792:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7789
	btr QWORD [rdi],0
	jmp LB_7790
LB_7789:
	bts QWORD [rdi],0
LB_7790:
	mov r14,r13
	bt r12,0
	jc LB_7795
	btr r12,1
	jmp LB_7796
LB_7795:
	bts r12,1
LB_7796:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7793
	btr QWORD [rdi],1
	jmp LB_7794
LB_7793:
	bts QWORD [rdi],1
LB_7794:
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
NS_E_5389:
NS_E_RDI_5389:
NS_E_5389_ETR_TBL:
NS_E_5389_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_7833
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_7833
	jmp LB_7834
LB_7833:
	jmp LB_7823
LB_7834:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_5390_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7838
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7839
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7839:
	jmp LB_7823
LB_7838:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7826
	btr r12,1
	clc
	jmp LB_7827
LB_7826:
	bts r12,1
	stc
LB_7827:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7824
	btr r12,0
	clc
	jmp LB_7825
LB_7824:
	bts r12,0
	stc
LB_7825:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7820
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7841
	btr r12,2
	jmp LB_7842
LB_7841:
	bts r12,2
LB_7842:
	mov r13,r14
	bt r12,1
	jc LB_7843
	btr r12,0
	jmp LB_7844
LB_7843:
	bts r12,0
LB_7844:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f882 %_5618 ⊢ %_5619 : %_5619
 ; {>  %_5618~0':(_lst)◂(_r64) }
; _f882 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_882
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_5619 ⊢ %_5620 : %_5620
 ; {>  %_5619~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_5620
 ; {>  %_5620~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7818
	btr r12,3
	jmp LB_7819
LB_7818:
	bts r12,3
LB_7819:
	mov r8,0
	bts r12,2
	ret
LB_7820:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7822
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7821
LB_7822:
	add rsp,8
	ret
LB_7823:
	add rsp,32
	pop r14
LB_7821:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5390:
NS_E_RDI_5390:
NS_E_5390_ETR_TBL:
NS_E_5390_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_7866
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_7866
	jmp LB_7867
LB_7866:
	jmp LB_7858
LB_7867:
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
	add rsp,16
	push rdi
	push rsi
	push LB_7855
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_5621 : %_5621
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_5621
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_5622 : %_5622
 ; {>  %_5621~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_5621 %_5622 } ⊢ %_5623 : %_5623
 ; {>  %_5621~0':_r64 %_5622~°1◂{  }:(_lst)◂(t2598'(0)) }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_5623 ⊢ %_5624 : %_5624
 ; {>  %_5623~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_5624
 ; {>  %_5624~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_7849
	btr r12,1
	jmp LB_7850
LB_7849:
	bts r12,1
LB_7850:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7847
	btr QWORD [rdi],0
	jmp LB_7848
LB_7847:
	bts QWORD [rdi],0
LB_7848:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7853
	mov rsi,0
	bt r14,0
	jc LB_7853
	jmp LB_7854
LB_7853:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7854:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
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
	add rsp,16
	pop r14
LB_7856:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7889
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7881
LB_7889:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_5390_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7894
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7895
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7895:
	jmp LB_7881
LB_7894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7884
	btr r12,1
	clc
	jmp LB_7885
LB_7884:
	bts r12,1
	stc
LB_7885:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7882
	btr r12,0
	clc
	jmp LB_7883
LB_7882:
	bts r12,0
	stc
LB_7883:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7878
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_5625 %_5626 } ⊢ %_5627 : %_5627
 ; {>  %_5626~1':(_lst)◂(_r64) %_5625~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5627 ⊢ %_5628 : %_5628
 ; {>  %_5627~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5628
 ; {>  %_5628~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_7872
	btr r12,2
	jmp LB_7873
LB_7872:
	bts r12,2
LB_7873:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7870
	btr QWORD [rdi],0
	jmp LB_7871
LB_7870:
	bts QWORD [rdi],0
LB_7871:
	mov r8,r14
	bt r12,1
	jc LB_7876
	btr r12,2
	jmp LB_7877
LB_7876:
	bts r12,2
LB_7877:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7874
	btr QWORD [rdi],1
	jmp LB_7875
LB_7874:
	bts QWORD [rdi],1
LB_7875:
	mov rsi,1
	bt r12,3
	jc LB_7868
	mov rsi,0
	bt r9,0
	jc LB_7868
	jmp LB_7869
LB_7868:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7869:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7878:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7880
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7879
LB_7880:
	add rsp,8
	ret
LB_7881:
	add rsp,32
	pop r14
LB_7879:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5391:
NS_E_RDI_5391:
NS_E_5391_ETR_TBL:
NS_E_5391_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_7935
LB_7934:
	add r14,1
LB_7935:
	cmp r14,r10
	jge LB_7936
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7934
	cmp al,10
	jz LB_7934
	cmp al,32
	jz LB_7934
LB_7936:
	add r14,4
	cmp r14,r10
	jg LB_7939
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_7939
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_7939
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_7939
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_7939
	jmp LB_7940
LB_7939:
	jmp LB_7913
LB_7940:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_7922
LB_7921:
	add r14,1
LB_7922:
	cmp r14,r10
	jge LB_7923
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7921
	cmp al,10
	jz LB_7921
	cmp al,32
	jz LB_7921
LB_7923:
	push r10
	call NS_E_5392_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7924
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7925
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7925:
	jmp LB_7914
LB_7924:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7928
LB_7927:
	add r14,1
LB_7928:
	cmp r14,r10
	jge LB_7929
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7927
	cmp al,10
	jz LB_7927
	cmp al,32
	jz LB_7927
LB_7929:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7930
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7931
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7931:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7932
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7932:
	jmp LB_7914
LB_7930:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7919
	btr r12,2
	clc
	jmp LB_7920
LB_7919:
	bts r12,2
	stc
LB_7920:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7917
	btr r12,1
	clc
	jmp LB_7918
LB_7917:
	bts r12,1
	stc
LB_7918:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7915
	btr r12,0
	clc
	jmp LB_7916
LB_7915:
	bts r12,0
	stc
LB_7916:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7910
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_7941
	btr r12,3
	jmp LB_7942
LB_7941:
	bts r12,3
LB_7942:
	mov r14,r8
	bt r12,2
	jc LB_7943
	btr r12,1
	jmp LB_7944
LB_7943:
	bts r12,1
LB_7944:
	mov r8,r13
	bt r12,0
	jc LB_7945
	btr r12,2
	jmp LB_7946
LB_7945:
	bts r12,2
LB_7946:
	mov r13,r9
	bt r12,3
	jc LB_7947
	btr r12,0
	jmp LB_7948
LB_7947:
	bts r12,0
LB_7948:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5631 : %_5631
 ; {>  %_5630~1':_p1502 %_5629~0':(_lst)◂(_p1505) }
; _nil {  } ⊢ °1◂{  }
; _f1565 %_5630 ⊢ %_5632 : %_5632
 ; {>  %_5631~°1◂{  }:(_lst)◂(t2613'(0)) %_5630~1':_p1502 %_5629~0':(_lst)◂(_p1505) }
; _f1565 1' ⊢ °1◂1'
; _f1563 { %_5631 %_5632 } ⊢ %_5633 : %_5633
 ; {>  %_5631~°1◂{  }:(_lst)◂(t2613'(0)) %_5632~°1◂1':_p1504 %_5629~0':(_lst)◂(_p1505) }
; _f1563 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_5633 ⊢ %_5634 : %_5634
 ; {>  %_5629~0':(_lst)◂(_p1505) %_5633~°1◂{ °1◂{  } °1◂1' }:_p1503 }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_5634
 ; {>  %_5634~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p1503) %_5629~0':(_lst)◂(_p1505) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_7897
	mov rdi,r13
	call dlt
LB_7897:
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
	jc LB_7902
	mov rsi,0
	bt r13,0
	jc LB_7902
	jmp LB_7903
LB_7902:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7903:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_7900
	btr QWORD [rdi],0
	jmp LB_7901
LB_7900:
	bts QWORD [rdi],0
LB_7901:
	mov r13,r14
	bt r12,1
	jc LB_7908
	btr r12,0
	jmp LB_7909
LB_7908:
	bts r12,0
LB_7909:
	mov rsi,1
	bt r12,0
	jc LB_7906
	mov rsi,0
	bt r13,0
	jc LB_7906
	jmp LB_7907
LB_7906:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7907:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_7904
	btr QWORD [rdi],1
	jmp LB_7905
LB_7904:
	bts QWORD [rdi],1
LB_7905:
	mov rsi,1
	bt r12,3
	jc LB_7898
	mov rsi,0
	bt r9,0
	jc LB_7898
	jmp LB_7899
LB_7898:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7899:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7910:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7912
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7911
LB_7912:
	add rsp,8
	ret
LB_7914:
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
LB_7913:
	add rsp,48
	pop r14
LB_7911:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_7979
LB_7978:
	add r14,1
LB_7979:
	cmp r14,r10
	jge LB_7980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7978
	cmp al,10
	jz LB_7978
	cmp al,32
	jz LB_7978
LB_7980:
	add r14,3
	cmp r14,r10
	jg LB_7983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_7983
	jmp LB_7984
LB_7983:
	jmp LB_7969
LB_7984:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_7986
LB_7985:
	add r14,1
LB_7986:
	cmp r14,r10
	jge LB_7987
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7985
	cmp al,10
	jz LB_7985
	cmp al,32
	jz LB_7985
LB_7987:
	push r10
	call NS_E_5392_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7988
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7989:
	jmp LB_7969
LB_7988:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7992
LB_7991:
	add r14,1
LB_7992:
	cmp r14,r10
	jge LB_7993
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7991
	cmp al,10
	jz LB_7991
	cmp al,32
	jz LB_7991
LB_7993:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7994
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7995
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7995:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7996
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7996:
	jmp LB_7969
LB_7994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_7999
LB_7998:
	add r14,1
LB_7999:
	cmp r14,r10
	jge LB_8000
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7998
	cmp al,10
	jz LB_7998
	cmp al,32
	jz LB_7998
LB_8000:
	push r10
	call NS_E_5391_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8001
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8002
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8002:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8003
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8003:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8004:
	jmp LB_7969
LB_8001:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7976
	btr r12,3
	clc
	jmp LB_7977
LB_7976:
	bts r12,3
	stc
LB_7977:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7974
	btr r12,2
	clc
	jmp LB_7975
LB_7974:
	bts r12,2
	stc
LB_7975:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7972
	btr r12,1
	clc
	jmp LB_7973
LB_7972:
	bts r12,1
	stc
LB_7973:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7970
	btr r12,0
	clc
	jmp LB_7971
LB_7970:
	bts r12,0
	stc
LB_7971:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7966
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_8006
	btr r12,4
	jmp LB_8007
LB_8006:
	bts r12,4
LB_8007:
	mov r8,r9
	bt r12,3
	jc LB_8008
	btr r12,2
	jmp LB_8009
LB_8008:
	bts r12,2
LB_8009:
	mov r9,r14
	bt r12,1
	jc LB_8010
	btr r12,3
	jmp LB_8011
LB_8010:
	bts r12,3
LB_8011:
	mov r14,r10
	bt r12,4
	jc LB_8012
	btr r12,1
	jmp LB_8013
LB_8012:
	bts r12,1
LB_8013:
	mov r10,r13
	bt r12,0
	jc LB_8014
	btr r12,4
	jmp LB_8015
LB_8014:
	bts r12,4
LB_8015:
	mov r13,r9
	bt r12,3
	jc LB_8016
	btr r12,0
	jmp LB_8017
LB_8016:
	bts r12,0
LB_8017:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5638 : %_5638
 ; {>  %_5637~2':_p1503 %_5636~1':_p1502 %_5635~0':(_lst)◂(_p1505) }
; _nil {  } ⊢ °1◂{  }
; _f1565 %_5636 ⊢ %_5639 : %_5639
 ; {>  %_5638~°1◂{  }:(_lst)◂(t2623'(0)) %_5637~2':_p1503 %_5636~1':_p1502 %_5635~0':(_lst)◂(_p1505) }
; _f1565 1' ⊢ °1◂1'
; _f1562 { %_5638 %_5639 %_5637 } ⊢ %_5640 : %_5640
 ; {>  %_5639~°1◂1':_p1504 %_5638~°1◂{  }:(_lst)◂(t2623'(0)) %_5637~2':_p1503 %_5635~0':(_lst)◂(_p1505) }
; _f1562 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_5640 ⊢ %_5641 : %_5641
 ; {>  %_5640~°0◂{ °1◂{  } °1◂1' 2' }:_p1503 %_5635~0':(_lst)◂(_p1505) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_5641
 ; {>  %_5641~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p1503) %_5635~0':(_lst)◂(_p1505) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_7949
	mov rdi,r13
	call dlt
LB_7949:
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
	jc LB_7954
	mov rsi,0
	bt r13,0
	jc LB_7954
	jmp LB_7955
LB_7954:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7955:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_7952
	btr QWORD [rdi],0
	jmp LB_7953
LB_7952:
	bts QWORD [rdi],0
LB_7953:
	mov r13,r14
	bt r12,1
	jc LB_7960
	btr r12,0
	jmp LB_7961
LB_7960:
	bts r12,0
LB_7961:
	mov rsi,1
	bt r12,0
	jc LB_7958
	mov rsi,0
	bt r13,0
	jc LB_7958
	jmp LB_7959
LB_7958:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7959:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_7956
	btr QWORD [rdi],1
	jmp LB_7957
LB_7956:
	bts QWORD [rdi],1
LB_7957:
	mov r13,r8
	bt r12,2
	jc LB_7964
	btr r12,0
	jmp LB_7965
LB_7964:
	bts r12,0
LB_7965:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_7962
	btr QWORD [rdi],2
	jmp LB_7963
LB_7962:
	bts QWORD [rdi],2
LB_7963:
	mov rsi,1
	bt r12,3
	jc LB_7950
	mov rsi,0
	bt r9,0
	jc LB_7950
	jmp LB_7951
LB_7950:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7951:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7966:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7968
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7967
LB_7968:
	add rsp,8
	ret
LB_7969:
	add rsp,64
	pop r14
LB_7967:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5392:
NS_E_RDI_5392:
NS_E_5392_ETR_TBL:
NS_E_5392_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_8037
LB_8036:
	add r14,1
LB_8037:
	cmp r14,r10
	jge LB_8038
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8036
	cmp al,10
	jz LB_8036
	cmp al,32
	jz LB_8036
LB_8038:
	push r10
	call NS_E_5393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8039
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8031
LB_8039:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_8042
LB_8041:
	add r14,1
LB_8042:
	cmp r14,r10
	jge LB_8043
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8041
	cmp al,10
	jz LB_8041
	cmp al,32
	jz LB_8041
LB_8043:
	push r10
	call NS_E_5394_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8044
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8045:
	jmp LB_8031
LB_8044:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8034
	btr r12,1
	clc
	jmp LB_8035
LB_8034:
	bts r12,1
	stc
LB_8035:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8032
	btr r12,0
	clc
	jmp LB_8033
LB_8032:
	bts r12,0
	stc
LB_8033:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8028
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_5642 %_5643 } ⊢ %_5644 : %_5644
 ; {>  %_5642~0':_p1505 %_5643~1':(_lst)◂(_p1505) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5644 ⊢ %_5645 : %_5645
 ; {>  %_5644~°0◂{ 0' 1' }:(_lst)◂(_p1505) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5645
 ; {>  %_5645~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1505)) }
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
	jc LB_8022
	btr r12,2
	jmp LB_8023
LB_8022:
	bts r12,2
LB_8023:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8020
	btr QWORD [rdi],0
	jmp LB_8021
LB_8020:
	bts QWORD [rdi],0
LB_8021:
	mov r8,r14
	bt r12,1
	jc LB_8026
	btr r12,2
	jmp LB_8027
LB_8026:
	bts r12,2
LB_8027:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8024
	btr QWORD [rdi],1
	jmp LB_8025
LB_8024:
	bts QWORD [rdi],1
LB_8025:
	mov rsi,1
	bt r12,3
	jc LB_8018
	mov rsi,0
	bt r9,0
	jc LB_8018
	jmp LB_8019
LB_8018:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8019:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8028:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8030
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8029
LB_8030:
	add rsp,8
	ret
LB_8031:
	add rsp,32
	pop r14
LB_8029:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_8058
LB_8057:
	add r14,1
LB_8058:
	cmp r14,r10
	jge LB_8059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8057
	cmp al,32
	jz LB_8057
LB_8059:
	add r14,1
	cmp r14,r10
	jg LB_8062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8062
	jmp LB_8063
LB_8062:
	jmp LB_8052
LB_8063:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_8065
LB_8064:
	add r14,1
LB_8065:
	cmp r14,r10
	jge LB_8066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8064
	cmp al,32
	jz LB_8064
LB_8066:
	add r14,1
	cmp r14,r10
	jg LB_8070
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_8070
	jmp LB_8071
LB_8070:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8068
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8068:
	jmp LB_8052
LB_8071:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8055
	btr r12,1
	clc
	jmp LB_8056
LB_8055:
	bts r12,1
	stc
LB_8056:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,32
	push rdi
	push rsi
	push LB_8049
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5646 : %_5646
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5646 ⊢ %_5647 : %_5647
 ; {>  %_5646~°1◂{  }:(_lst)◂(t2636'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5647
 ; {>  %_5647~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2639'(0))) }
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
	jc LB_8047
	mov rsi,0
	bt r9,0
	jc LB_8047
	jmp LB_8048
LB_8047:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8048:
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
	add rsp,32
	pop r14
LB_8050:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5393:
NS_E_RDI_5393:
NS_E_5393_ETR_TBL:
NS_E_5393_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_8128
LB_8127:
	add r14,1
LB_8128:
	cmp r14,r10
	jge LB_8129
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8127
	cmp al,10
	jz LB_8127
	cmp al,32
	jz LB_8127
LB_8129:
	push r10
	call NS_E_4519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8130
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8089
LB_8130:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_8133
LB_8132:
	add r14,1
LB_8133:
	cmp r14,r10
	jge LB_8134
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8132
	cmp al,10
	jz LB_8132
	cmp al,32
	jz LB_8132
LB_8134:
	add r14,3
	cmp r14,r10
	jg LB_8138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8138
	jmp LB_8139
LB_8138:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8136
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8136:
	jmp LB_8089
LB_8139:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_8102
LB_8101:
	add r14,1
LB_8102:
	cmp r14,r10
	jge LB_8103
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8101
	cmp al,10
	jz LB_8101
	cmp al,32
	jz LB_8101
LB_8103:
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8104
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8105
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8105:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8106
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8106:
	jmp LB_8090
LB_8104:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_8109
LB_8108:
	add r14,1
LB_8109:
	cmp r14,r10
	jge LB_8110
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8108
	cmp al,10
	jz LB_8108
	cmp al,32
	jz LB_8108
LB_8110:
	add r14,3
	cmp r14,r10
	jg LB_8116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_8116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_8116
	jmp LB_8117
LB_8116:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8112
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8112:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8113
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8113:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8114:
	jmp LB_8090
LB_8117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_8119
LB_8118:
	add r14,1
LB_8119:
	cmp r14,r10
	jge LB_8120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8118
	cmp al,10
	jz LB_8118
	cmp al,32
	jz LB_8118
LB_8120:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8121
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8122
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8122:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8123
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8123:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8124
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8124:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8125
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8125:
	jmp LB_8090
LB_8121:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8099
	btr r12,4
	clc
	jmp LB_8100
LB_8099:
	bts r12,4
	stc
LB_8100:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8097
	btr r12,3
	clc
	jmp LB_8098
LB_8097:
	bts r12,3
	stc
LB_8098:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8095
	btr r12,2
	clc
	jmp LB_8096
LB_8095:
	bts r12,2
	stc
LB_8096:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8093
	btr r12,1
	clc
	jmp LB_8094
LB_8093:
	bts r12,1
	stc
LB_8094:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8091
	btr r12,0
	clc
	jmp LB_8092
LB_8091:
	bts r12,0
	stc
LB_8092:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8086
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_8140
	btr r12,5
	jmp LB_8141
LB_8140:
	bts r12,5
LB_8141:
	mov r8,r10
	bt r12,4
	jc LB_8142
	btr r12,2
	jmp LB_8143
LB_8142:
	bts r12,2
LB_8143:
	mov r10,r14
	bt r12,1
	jc LB_8144
	btr r12,4
	jmp LB_8145
LB_8144:
	bts r12,4
LB_8145:
	mov r14,r11
	bt r12,5
	jc LB_8146
	btr r12,1
	jmp LB_8147
LB_8146:
	bts r12,1
LB_8147:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1566 { %_5648 %_5649 %_5650 } ⊢ %_5651 : %_5651
 ; {>  %_5650~2':_p1499 %_5649~1':_p1435 %_5648~0':_p1498 }
; _f1566 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_5651 ⊢ %_5652 : %_5652
 ; {>  %_5651~°0◂{ 0' 1' 2' }:_p1505 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_5652
 ; {>  %_5652~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p1505) }
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
	jc LB_8076
	btr r12,4
	jmp LB_8077
LB_8076:
	bts r12,4
LB_8077:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_8074
	btr QWORD [rdi],0
	jmp LB_8075
LB_8074:
	bts QWORD [rdi],0
LB_8075:
	mov r10,r14
	bt r12,1
	jc LB_8080
	btr r12,4
	jmp LB_8081
LB_8080:
	bts r12,4
LB_8081:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_8078
	btr QWORD [rdi],1
	jmp LB_8079
LB_8078:
	bts QWORD [rdi],1
LB_8079:
	mov r10,r8
	bt r12,2
	jc LB_8084
	btr r12,4
	jmp LB_8085
LB_8084:
	bts r12,4
LB_8085:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_8082
	btr QWORD [rdi],2
	jmp LB_8083
LB_8082:
	bts QWORD [rdi],2
LB_8083:
	mov rsi,1
	bt r12,3
	jc LB_8072
	mov rsi,0
	bt r9,0
	jc LB_8072
	jmp LB_8073
LB_8072:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8073:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8086:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8088
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8087
LB_8088:
	add rsp,8
	ret
LB_8090:
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
LB_8089:
	add rsp,80
	pop r14
LB_8087:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_8169
LB_8168:
	add r14,1
LB_8169:
	cmp r14,r10
	jge LB_8170
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8168
	cmp al,32
	jz LB_8168
LB_8170:
	push r10
	call NS_E_5395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8171
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8161
LB_8171:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_8174
LB_8173:
	add r14,1
LB_8174:
	cmp r14,r10
	jge LB_8175
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8173
	cmp al,32
	jz LB_8173
LB_8175:
	add r14,1
	cmp r14,r10
	jg LB_8179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_8179
	jmp LB_8180
LB_8179:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8177
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8177:
	jmp LB_8161
LB_8180:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_8182
LB_8181:
	add r14,1
LB_8182:
	cmp r14,r10
	jge LB_8183
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8181
	cmp al,32
	jz LB_8181
LB_8183:
	push r10
	call NS_E_5395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8184
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8185
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8185:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8186:
	jmp LB_8161
LB_8184:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8166
	btr r12,2
	clc
	jmp LB_8167
LB_8166:
	bts r12,2
	stc
LB_8167:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8164
	btr r12,1
	clc
	jmp LB_8165
LB_8164:
	bts r12,1
	stc
LB_8165:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8162
	btr r12,0
	clc
	jmp LB_8163
LB_8162:
	bts r12,0
	stc
LB_8163:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8158
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_8188
	btr r12,3
	jmp LB_8189
LB_8188:
	bts r12,3
LB_8189:
	mov r14,r8
	bt r12,2
	jc LB_8190
	btr r12,1
	jmp LB_8191
LB_8190:
	bts r12,1
LB_8191:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f1567 { %_5653 %_5654 } ⊢ %_5655 : %_5655
 ; {>  %_5654~1':_p1506 %_5653~0':_p1506 }
; _f1567 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5655 ⊢ %_5656 : %_5656
 ; {>  %_5655~°1◂{ 0' 1' }:_p1505 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5656
 ; {>  %_5656~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1505) }
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
	jc LB_8152
	btr r12,2
	jmp LB_8153
LB_8152:
	bts r12,2
LB_8153:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8150
	btr QWORD [rdi],0
	jmp LB_8151
LB_8150:
	bts QWORD [rdi],0
LB_8151:
	mov r8,r14
	bt r12,1
	jc LB_8156
	btr r12,2
	jmp LB_8157
LB_8156:
	bts r12,2
LB_8157:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8154
	btr QWORD [rdi],1
	jmp LB_8155
LB_8154:
	bts QWORD [rdi],1
LB_8155:
	mov rsi,1
	bt r12,3
	jc LB_8148
	mov rsi,0
	bt r9,0
	jc LB_8148
	jmp LB_8149
LB_8148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8149:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8158:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8160
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8159
LB_8160:
	add rsp,8
	ret
LB_8161:
	add rsp,48
	pop r14
LB_8159:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5394:
NS_E_RDI_5394:
NS_E_5394_ETR_TBL:
NS_E_5394_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_8227
LB_8226:
	add r14,1
LB_8227:
	cmp r14,r10
	jge LB_8228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8226
	cmp al,10
	jz LB_8226
	cmp al,32
	jz LB_8226
LB_8228:
	add r14,1
	cmp r14,r10
	jg LB_8231
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_8231
	jmp LB_8232
LB_8231:
	jmp LB_8205
LB_8232:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_8214
LB_8213:
	add r14,1
LB_8214:
	cmp r14,r10
	jge LB_8215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8213
	cmp al,10
	jz LB_8213
	cmp al,32
	jz LB_8213
LB_8215:
	push r10
	call NS_E_5393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8216
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8217
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8217:
	jmp LB_8206
LB_8216:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_8220
LB_8219:
	add r14,1
LB_8220:
	cmp r14,r10
	jge LB_8221
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8219
	cmp al,10
	jz LB_8219
	cmp al,32
	jz LB_8219
LB_8221:
	push r10
	call NS_E_5394_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8222
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8223
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8223:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8224:
	jmp LB_8206
LB_8222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8211
	btr r12,2
	clc
	jmp LB_8212
LB_8211:
	bts r12,2
	stc
LB_8212:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8209
	btr r12,1
	clc
	jmp LB_8210
LB_8209:
	bts r12,1
	stc
LB_8210:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8207
	btr r12,0
	clc
	jmp LB_8208
LB_8207:
	bts r12,0
	stc
LB_8208:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8202
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8233
	btr r12,3
	jmp LB_8234
LB_8233:
	bts r12,3
LB_8234:
	mov r14,r8
	bt r12,2
	jc LB_8235
	btr r12,1
	jmp LB_8236
LB_8235:
	bts r12,1
LB_8236:
	mov r8,r13
	bt r12,0
	jc LB_8237
	btr r12,2
	jmp LB_8238
LB_8237:
	bts r12,2
LB_8238:
	mov r13,r9
	bt r12,3
	jc LB_8239
	btr r12,0
	jmp LB_8240
LB_8239:
	bts r12,0
LB_8240:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_5657 %_5658 } ⊢ %_5659 : %_5659
 ; {>  %_5657~0':_p1505 %_5658~1':(_lst)◂(_p1505) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5659 ⊢ %_5660 : %_5660
 ; {>  %_5659~°0◂{ 0' 1' }:(_lst)◂(_p1505) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5660
 ; {>  %_5660~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1505)) }
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
	jc LB_8196
	btr r12,2
	jmp LB_8197
LB_8196:
	bts r12,2
LB_8197:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8194
	btr QWORD [rdi],0
	jmp LB_8195
LB_8194:
	bts QWORD [rdi],0
LB_8195:
	mov r8,r14
	bt r12,1
	jc LB_8200
	btr r12,2
	jmp LB_8201
LB_8200:
	bts r12,2
LB_8201:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8198
	btr QWORD [rdi],1
	jmp LB_8199
LB_8198:
	bts QWORD [rdi],1
LB_8199:
	mov rsi,1
	bt r12,3
	jc LB_8192
	mov rsi,0
	bt r9,0
	jc LB_8192
	jmp LB_8193
LB_8192:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8193:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8202:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8204
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8203
LB_8204:
	add rsp,8
	ret
LB_8206:
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
LB_8205:
	add rsp,48
	pop r14
LB_8203:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_8252
LB_8251:
	add r14,1
LB_8252:
	cmp r14,r10
	jge LB_8253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8251
	cmp al,32
	jz LB_8251
LB_8253:
	add r14,1
	cmp r14,r10
	jg LB_8256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8256
	jmp LB_8257
LB_8256:
	jmp LB_8246
LB_8257:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_8259
LB_8258:
	add r14,1
LB_8259:
	cmp r14,r10
	jge LB_8260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8258
	cmp al,32
	jz LB_8258
LB_8260:
	add r14,1
	cmp r14,r10
	jg LB_8264
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_8264
	jmp LB_8265
LB_8264:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8262
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8262:
	jmp LB_8246
LB_8265:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8249
	btr r12,1
	clc
	jmp LB_8250
LB_8249:
	bts r12,1
	stc
LB_8250:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8247
	btr r12,0
	clc
	jmp LB_8248
LB_8247:
	bts r12,0
	stc
LB_8248:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8243
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_5661 : %_5661
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_5661 ⊢ %_5662 : %_5662
 ; {>  %_5661~°1◂{  }:(_lst)◂(t2660'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5662
 ; {>  %_5662~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2663'(0))) }
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
	jc LB_8241
	mov rsi,0
	bt r9,0
	jc LB_8241
	jmp LB_8242
LB_8241:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8242:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8243:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8245
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8244
LB_8245:
	add rsp,8
	ret
LB_8246:
	add rsp,32
	pop r14
LB_8244:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5395:
NS_E_RDI_5395:
NS_E_5395_ETR_TBL:
NS_E_5395_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8281
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8273
LB_8281:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_8289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_8289
	jmp LB_8290
LB_8289:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8287
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8287:
	jmp LB_8273
LB_8290:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8276
	btr r12,1
	clc
	jmp LB_8277
LB_8276:
	bts r12,1
	stc
LB_8277:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8274
	btr r12,0
	clc
	jmp LB_8275
LB_8274:
	bts r12,0
	stc
LB_8275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8270
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f1569 %_5663 ⊢ %_5664 : %_5664
 ; {>  %_5663~0':_stg }
; _f1569 0' ⊢ °1◂0'
; _some %_5664 ⊢ %_5665 : %_5665
 ; {>  %_5664~°1◂0':_p1506 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5665
 ; {>  %_5665~°0◂°1◂0':(_opn)◂(_p1506) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8268
	btr r12,3
	jmp LB_8269
LB_8268:
	bts r12,3
LB_8269:
	mov rsi,1
	bt r12,3
	jc LB_8266
	mov rsi,0
	bt r9,0
	jc LB_8266
	jmp LB_8267
LB_8266:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8267:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8270:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8272
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8271
LB_8272:
	add rsp,8
	ret
LB_8273:
	add rsp,32
	pop r14
LB_8271:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_4390_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8304
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8298
LB_8304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8299
	btr r12,0
	clc
	jmp LB_8300
LB_8299:
	bts r12,0
	stc
LB_8300:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8295
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1568 %_5666 ⊢ %_5667 : %_5667
 ; {>  %_5666~0':_p1501 }
; _f1568 0' ⊢ °0◂0'
; _some %_5667 ⊢ %_5668 : %_5668
 ; {>  %_5667~°0◂0':_p1506 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5668
 ; {>  %_5668~°0◂°0◂0':(_opn)◂(_p1506) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8293
	btr r12,3
	jmp LB_8294
LB_8293:
	bts r12,3
LB_8294:
	mov rsi,1
	bt r12,3
	jc LB_8291
	mov rsi,0
	bt r9,0
	jc LB_8291
	jmp LB_8292
LB_8291:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8292:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8295:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8297
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8296
LB_8297:
	add rsp,8
	ret
LB_8298:
	add rsp,16
	pop r14
LB_8296:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5396:
NS_E_RDI_5396:
NS_E_5396_ETR_TBL:
NS_E_5396_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_8327
LB_8326:
	add r14,1
LB_8327:
	cmp r14,r10
	jge LB_8328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8326
	cmp al,10
	jz LB_8326
	cmp al,32
	jz LB_8326
LB_8328:
	add r14,1
	cmp r14,r10
	jg LB_8331
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_8331
	jmp LB_8332
LB_8331:
	jmp LB_8317
LB_8332:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_8334
LB_8333:
	add r14,1
LB_8334:
	cmp r14,r10
	jge LB_8335
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8333
	cmp al,10
	jz LB_8333
	cmp al,32
	jz LB_8333
LB_8335:
	add r14,1
	cmp r14,r10
	jg LB_8339
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_8339
	jmp LB_8340
LB_8339:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8337:
	jmp LB_8317
LB_8340:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_8342
LB_8341:
	add r14,1
LB_8342:
	cmp r14,r10
	jge LB_8343
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8341
	cmp al,10
	jz LB_8341
	cmp al,32
	jz LB_8341
LB_8343:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8344
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8345
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8345:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8346
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8346:
	jmp LB_8317
LB_8344:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_8349
LB_8348:
	add r14,1
LB_8349:
	cmp r14,r10
	jge LB_8350
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8348
	cmp al,10
	jz LB_8348
	cmp al,32
	jz LB_8348
LB_8350:
	push r10
	call NS_E_5397_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8351
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8352
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8352:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8353
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8353:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8354
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8354:
	jmp LB_8317
LB_8351:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8324
	btr r12,3
	clc
	jmp LB_8325
LB_8324:
	bts r12,3
	stc
LB_8325:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8322
	btr r12,2
	clc
	jmp LB_8323
LB_8322:
	bts r12,2
	stc
LB_8323:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8320
	btr r12,1
	clc
	jmp LB_8321
LB_8320:
	bts r12,1
	stc
LB_8321:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8318
	btr r12,0
	clc
	jmp LB_8319
LB_8318:
	bts r12,0
	stc
LB_8319:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8314
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_8356
	btr r12,4
	jmp LB_8357
LB_8356:
	bts r12,4
LB_8357:
	mov r14,r9
	bt r12,3
	jc LB_8358
	btr r12,1
	jmp LB_8359
LB_8358:
	bts r12,1
LB_8359:
	mov r9,r13
	bt r12,0
	jc LB_8360
	btr r12,3
	jmp LB_8361
LB_8360:
	bts r12,3
LB_8361:
	mov r13,r8
	bt r12,2
	jc LB_8362
	btr r12,0
	jmp LB_8363
LB_8362:
	bts r12,0
LB_8363:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_5669 %_5670 } ⊢ %_5671 : %_5671
 ; {>  %_5670~1':_p1487 %_5669~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_5671
 ; {>  %_5671~°0◂{ 0' 1' }:(_opn)◂({ _stg _p1487 }) }
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
	jc LB_8308
	btr r12,2
	jmp LB_8309
LB_8308:
	bts r12,2
LB_8309:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8306
	btr QWORD [rdi],0
	jmp LB_8307
LB_8306:
	bts QWORD [rdi],0
LB_8307:
	mov r8,r14
	bt r12,1
	jc LB_8312
	btr r12,2
	jmp LB_8313
LB_8312:
	bts r12,2
LB_8313:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8310
	btr QWORD [rdi],1
	jmp LB_8311
LB_8310:
	bts QWORD [rdi],1
LB_8311:
	mov r8,0
	bts r12,2
	ret
LB_8314:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8316
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8315
LB_8316:
	add rsp,8
	ret
LB_8317:
	add rsp,64
	pop r14
LB_8315:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5397:
NS_E_RDI_5397:
NS_E_5397_ETR_TBL:
NS_E_5397_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_8375
LB_8374:
	add r14,1
LB_8375:
	cmp r14,r10
	jge LB_8376
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8374
	cmp al,10
	jz LB_8374
	cmp al,32
	jz LB_8374
LB_8376:
	push r10
	call NS_E_5398_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8377
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8371
LB_8377:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8372
	btr r12,0
	clc
	jmp LB_8373
LB_8372:
	bts r12,0
	stc
LB_8373:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8368
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1524 %_5672 ⊢ %_5673 : %_5673
 ; {>  %_5672~0':_p1489 }
; _f1524 0' ⊢ °1◂0'
; _some %_5673 ⊢ %_5674 : %_5674
 ; {>  %_5673~°1◂0':_p1487 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5674
 ; {>  %_5674~°0◂°1◂0':(_opn)◂(_p1487) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8366
	btr r12,3
	jmp LB_8367
LB_8366:
	bts r12,3
LB_8367:
	mov rsi,1
	bt r12,3
	jc LB_8364
	mov rsi,0
	bt r9,0
	jc LB_8364
	jmp LB_8365
LB_8364:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8365:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8368:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8370
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8369
LB_8370:
	add rsp,8
	ret
LB_8371:
	add rsp,16
	pop r14
LB_8369:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_8390
LB_8389:
	add r14,1
LB_8390:
	cmp r14,r10
	jge LB_8391
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8389
	cmp al,10
	jz LB_8389
	cmp al,32
	jz LB_8389
LB_8391:
	push r10
	call NS_E_5406_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8392
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8386
LB_8392:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8387
	btr r12,0
	clc
	jmp LB_8388
LB_8387:
	bts r12,0
	stc
LB_8388:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8383
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1523 %_5675 ⊢ %_5676 : %_5676
 ; {>  %_5675~0':_p1488 }
; _f1523 0' ⊢ °0◂0'
; _some %_5676 ⊢ %_5677 : %_5677
 ; {>  %_5676~°0◂0':_p1487 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5677
 ; {>  %_5677~°0◂°0◂0':(_opn)◂(_p1487) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8381
	btr r12,3
	jmp LB_8382
LB_8381:
	bts r12,3
LB_8382:
	mov rsi,1
	bt r12,3
	jc LB_8379
	mov rsi,0
	bt r9,0
	jc LB_8379
	jmp LB_8380
LB_8379:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8380:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8383:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8385
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8384
LB_8385:
	add rsp,8
	ret
LB_8386:
	add rsp,16
	pop r14
LB_8384:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5398:
NS_E_RDI_5398:
NS_E_5398_ETR_TBL:
NS_E_5398_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_8443
LB_8442:
	add r14,1
LB_8443:
	cmp r14,r10
	jge LB_8444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8442
	cmp al,10
	jz LB_8442
	cmp al,32
	jz LB_8442
LB_8444:
	push r10
	call NS_E_5405_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8445
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8421
LB_8445:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8430
LB_8429:
	add r14,1
LB_8430:
	cmp r14,r10
	jge LB_8431
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8429
	cmp al,10
	jz LB_8429
	cmp al,32
	jz LB_8429
LB_8431:
	push r10
	call NS_E_5400_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8432
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8433
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8433:
	jmp LB_8422
LB_8432:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_8436
LB_8435:
	add r14,1
LB_8436:
	cmp r14,r10
	jge LB_8437
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8435
	cmp al,10
	jz LB_8435
	cmp al,32
	jz LB_8435
LB_8437:
	push r10
	call NS_E_5399_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8438
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8439
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8439:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8440
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8440:
	jmp LB_8422
LB_8438:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8427
	btr r12,2
	clc
	jmp LB_8428
LB_8427:
	bts r12,2
	stc
LB_8428:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8425
	btr r12,1
	clc
	jmp LB_8426
LB_8425:
	bts r12,1
	stc
LB_8426:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8423
	btr r12,0
	clc
	jmp LB_8424
LB_8423:
	bts r12,0
	stc
LB_8424:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8418
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_8447
	btr r12,5
	jmp LB_8448
LB_8447:
	bts r12,5
LB_8448:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_8451
	btr r12,6
	clc
	jmp LB_8452
LB_8451:
	bts r12,6
	stc
LB_8452:
	mov r8,rcx
	bt r12,6
	jc LB_8449
	btr r12,2
	jmp LB_8450
LB_8449:
	bts r12,2
LB_8450:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_8455
	btr r12,6
	clc
	jmp LB_8456
LB_8455:
	bts r12,6
	stc
LB_8456:
	mov r9,rcx
	bt r12,6
	jc LB_8453
	btr r12,3
	jmp LB_8454
LB_8453:
	bts r12,3
LB_8454:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_8459
	btr r12,6
	clc
	jmp LB_8460
LB_8459:
	bts r12,6
	stc
LB_8460:
	mov r10,rcx
	bt r12,6
	jc LB_8457
	btr r12,4
	jmp LB_8458
LB_8457:
	bts r12,4
LB_8458:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f1528 { %_5680 %_5681 %_5678 %_5679 %_5682 } ⊢ %_5683 : %_5683
 ; {>  %_5680~2':_p1499 %_5682~4':(_opn)◂(_p1489) %_5678~0':_p1490 %_5679~1':_p1491 %_5681~3':_p1502 }
; _f1528 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_5683 ⊢ %_5684 : %_5684
 ; {>  %_5683~°1◂{ 2' 3' 0' 1' 4' }:_p1489 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_5684
 ; {>  %_5684~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p1489) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_8394
	btr r12,5
	jmp LB_8395
LB_8394:
	bts r12,5
LB_8395:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_8400
	btr r12,6
	jmp LB_8401
LB_8400:
	bts r12,6
LB_8401:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_8398
	btr QWORD [rdi],0
	jmp LB_8399
LB_8398:
	bts QWORD [rdi],0
LB_8399:
	mov rcx,r11
	bt r12,5
	jc LB_8404
	btr r12,6
	jmp LB_8405
LB_8404:
	bts r12,6
LB_8405:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_8402
	btr QWORD [rdi],1
	jmp LB_8403
LB_8402:
	bts QWORD [rdi],1
LB_8403:
	mov rcx,r13
	bt r12,0
	jc LB_8408
	btr r12,6
	jmp LB_8409
LB_8408:
	bts r12,6
LB_8409:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_8406
	btr QWORD [rdi],2
	jmp LB_8407
LB_8406:
	bts QWORD [rdi],2
LB_8407:
	mov rcx,r14
	bt r12,1
	jc LB_8412
	btr r12,6
	jmp LB_8413
LB_8412:
	bts r12,6
LB_8413:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_8410
	btr QWORD [rdi],3
	jmp LB_8411
LB_8410:
	bts QWORD [rdi],3
LB_8411:
	mov rcx,r10
	bt r12,4
	jc LB_8416
	btr r12,6
	jmp LB_8417
LB_8416:
	bts r12,6
LB_8417:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_8414
	btr QWORD [rdi],4
	jmp LB_8415
LB_8414:
	bts QWORD [rdi],4
LB_8415:
	mov rsi,1
	bt r12,3
	jc LB_8396
	mov rsi,0
	bt r9,0
	jc LB_8396
	jmp LB_8397
LB_8396:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8397:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8418:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8420
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8419
LB_8420:
	add rsp,8
	ret
LB_8422:
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
LB_8421:
	add rsp,48
	pop r14
LB_8419:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_8502
LB_8501:
	add r14,1
LB_8502:
	cmp r14,r10
	jge LB_8503
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8501
	cmp al,10
	jz LB_8501
	cmp al,32
	jz LB_8501
LB_8503:
	push r10
	call NS_E_5404_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8504
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8492
LB_8504:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8507
LB_8506:
	add r14,1
LB_8507:
	cmp r14,r10
	jge LB_8508
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8506
	cmp al,10
	jz LB_8506
	cmp al,32
	jz LB_8506
LB_8508:
	push r10
	call NS_E_5400_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8509
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8510
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8510:
	jmp LB_8492
LB_8509:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_8513
LB_8512:
	add r14,1
LB_8513:
	cmp r14,r10
	jge LB_8514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8512
	cmp al,10
	jz LB_8512
	cmp al,32
	jz LB_8512
LB_8514:
	push r10
	call NS_E_5399_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8515
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8516
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8516:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8517
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8517:
	jmp LB_8492
LB_8515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_8520
LB_8519:
	add r14,1
LB_8520:
	cmp r14,r10
	jge LB_8521
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8519
	cmp al,10
	jz LB_8519
	cmp al,32
	jz LB_8519
LB_8521:
	push r10
	call NS_E_5398_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8522
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8523
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8523:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8524
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8524:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8525:
	jmp LB_8492
LB_8522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8499
	btr r12,3
	clc
	jmp LB_8500
LB_8499:
	bts r12,3
	stc
LB_8500:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8497
	btr r12,2
	clc
	jmp LB_8498
LB_8497:
	bts r12,2
	stc
LB_8498:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8495
	btr r12,1
	clc
	jmp LB_8496
LB_8495:
	bts r12,1
	stc
LB_8496:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8493
	btr r12,0
	clc
	jmp LB_8494
LB_8493:
	bts r12,0
	stc
LB_8494:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8489
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_8527
	btr r12,5
	jmp LB_8528
LB_8527:
	bts r12,5
LB_8528:
	mov rcx,r8
	bt r12,2
	jc LB_8529
	btr r12,6
	jmp LB_8530
LB_8529:
	bts r12,6
LB_8530:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_8533
	btr r12,7
	clc
	jmp LB_8534
LB_8533:
	bts r12,7
	stc
LB_8534:
	mov r8,rdx
	bt r12,7
	jc LB_8531
	btr r12,2
	jmp LB_8532
LB_8531:
	bts r12,2
LB_8532:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_8537
	btr r12,7
	clc
	jmp LB_8538
LB_8537:
	bts r12,7
	stc
LB_8538:
	mov r9,rdx
	bt r12,7
	jc LB_8535
	btr r12,3
	jmp LB_8536
LB_8535:
	bts r12,3
LB_8536:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_8541
	btr r12,7
	clc
	jmp LB_8542
LB_8541:
	bts r12,7
	stc
LB_8542:
	mov r10,rdx
	bt r12,7
	jc LB_8539
	btr r12,4
	jmp LB_8540
LB_8539:
	bts r12,4
LB_8540:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f1527 { %_5687 %_5688 %_5685 %_5686 %_5689 %_5690 } ⊢ %_5691 : %_5691
 ; {>  %_5688~3':_p1502 %_5689~4':(_opn)◂(_p1489) %_5687~2':_p1499 %_5686~1':_p1491 %_5690~5':_p1489 %_5685~0':_p1490 }
; _f1527 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_5691 ⊢ %_5692 : %_5692
 ; {>  %_5691~°0◂{ 2' 3' 0' 1' 4' 5' }:_p1489 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_5692
 ; {>  %_5692~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p1489) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_8461
	btr r12,6
	jmp LB_8462
LB_8461:
	bts r12,6
LB_8462:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_8467
	btr r12,7
	jmp LB_8468
LB_8467:
	bts r12,7
LB_8468:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_8465
	btr QWORD [rdi],0
	jmp LB_8466
LB_8465:
	bts QWORD [rdi],0
LB_8466:
	mov rdx,rcx
	bt r12,6
	jc LB_8471
	btr r12,7
	jmp LB_8472
LB_8471:
	bts r12,7
LB_8472:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_8469
	btr QWORD [rdi],1
	jmp LB_8470
LB_8469:
	bts QWORD [rdi],1
LB_8470:
	mov rdx,r13
	bt r12,0
	jc LB_8475
	btr r12,7
	jmp LB_8476
LB_8475:
	bts r12,7
LB_8476:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_8473
	btr QWORD [rdi],2
	jmp LB_8474
LB_8473:
	bts QWORD [rdi],2
LB_8474:
	mov rdx,r14
	bt r12,1
	jc LB_8479
	btr r12,7
	jmp LB_8480
LB_8479:
	bts r12,7
LB_8480:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_8477
	btr QWORD [rdi],3
	jmp LB_8478
LB_8477:
	bts QWORD [rdi],3
LB_8478:
	mov rdx,r10
	bt r12,4
	jc LB_8483
	btr r12,7
	jmp LB_8484
LB_8483:
	bts r12,7
LB_8484:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_8481
	btr QWORD [rdi],4
	jmp LB_8482
LB_8481:
	bts QWORD [rdi],4
LB_8482:
	mov rdx,r11
	bt r12,5
	jc LB_8487
	btr r12,7
	jmp LB_8488
LB_8487:
	bts r12,7
LB_8488:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_8485
	btr QWORD [rdi],5
	jmp LB_8486
LB_8485:
	bts QWORD [rdi],5
LB_8486:
	mov rsi,1
	bt r12,3
	jc LB_8463
	mov rsi,0
	bt r9,0
	jc LB_8463
	jmp LB_8464
LB_8463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8464:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8489:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8491
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8490
LB_8491:
	add rsp,8
	ret
LB_8492:
	add rsp,64
	pop r14
LB_8490:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5399:
NS_E_RDI_5399:
NS_E_5399_ETR_TBL:
NS_E_5399_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_8597
LB_8596:
	add r14,1
LB_8597:
	cmp r14,r10
	jge LB_8598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8596
	cmp al,10
	jz LB_8596
	cmp al,32
	jz LB_8596
LB_8598:
	add r14,1
	cmp r14,r10
	jg LB_8601
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_8601
	jmp LB_8602
LB_8601:
	jmp LB_8560
LB_8602:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_8604
LB_8603:
	add r14,1
LB_8604:
	cmp r14,r10
	jge LB_8605
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8603
	cmp al,10
	jz LB_8603
	cmp al,32
	jz LB_8603
LB_8605:
	add r14,3
	cmp r14,r10
	jg LB_8609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8609
	jmp LB_8610
LB_8609:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8607
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8607:
	jmp LB_8560
LB_8610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_8573
LB_8572:
	add r14,1
LB_8573:
	cmp r14,r10
	jge LB_8574
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8572
	cmp al,10
	jz LB_8572
	cmp al,32
	jz LB_8572
LB_8574:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8575
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8576
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8576:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8577:
	jmp LB_8561
LB_8575:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_8580
LB_8579:
	add r14,1
LB_8580:
	cmp r14,r10
	jge LB_8581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8579
	cmp al,10
	jz LB_8579
	cmp al,32
	jz LB_8579
LB_8581:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8582
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8583
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8583:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8584
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8584:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8585
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8585:
	jmp LB_8561
LB_8582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_8588
LB_8587:
	add r14,1
LB_8588:
	cmp r14,r10
	jge LB_8589
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8587
	cmp al,10
	jz LB_8587
	cmp al,32
	jz LB_8587
LB_8589:
	push r10
	call NS_E_5398_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8590
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8591
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8591:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8592
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8592:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8593
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8593:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8594
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8594:
	jmp LB_8561
LB_8590:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8570
	btr r12,4
	clc
	jmp LB_8571
LB_8570:
	bts r12,4
	stc
LB_8571:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8568
	btr r12,3
	clc
	jmp LB_8569
LB_8568:
	bts r12,3
	stc
LB_8569:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8566
	btr r12,2
	clc
	jmp LB_8567
LB_8566:
	bts r12,2
	stc
LB_8567:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8564
	btr r12,1
	clc
	jmp LB_8565
LB_8564:
	bts r12,1
	stc
LB_8565:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8562
	btr r12,0
	clc
	jmp LB_8563
LB_8562:
	bts r12,0
	stc
LB_8563:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8557
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_8611
	btr r12,5
	jmp LB_8612
LB_8611:
	bts r12,5
LB_8612:
	mov r8,r10
	bt r12,4
	jc LB_8613
	btr r12,2
	jmp LB_8614
LB_8613:
	bts r12,2
LB_8614:
	mov r10,r14
	bt r12,1
	jc LB_8615
	btr r12,4
	jmp LB_8616
LB_8615:
	bts r12,4
LB_8616:
	mov r14,r9
	bt r12,3
	jc LB_8617
	btr r12,1
	jmp LB_8618
LB_8617:
	bts r12,1
LB_8618:
	mov r9,r13
	bt r12,0
	jc LB_8619
	btr r12,3
	jmp LB_8620
LB_8619:
	bts r12,3
LB_8620:
	mov r13,r11
	bt r12,5
	jc LB_8621
	btr r12,0
	jmp LB_8622
LB_8621:
	bts r12,0
LB_8622:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5695 ⊢ %_5696 : %_5696
 ; {>  %_5693~0':_p1499 %_5695~2':_p1489 %_5694~1':_p1502 }
; _some 2' ⊢ °0◂2'
; _some { %_5693 %_5694 %_5696 } ⊢ %_5697 : %_5697
 ; {>  %_5693~0':_p1499 %_5696~°0◂2':(_opn)◂(_p1489) %_5694~1':_p1502 }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_5697
 ; {>  %_5697~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p1499 _p1502 (_opn)◂(_p1489) }) }
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
	jc LB_8545
	btr r12,4
	jmp LB_8546
LB_8545:
	bts r12,4
LB_8546:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_8543
	btr QWORD [rdi],0
	jmp LB_8544
LB_8543:
	bts QWORD [rdi],0
LB_8544:
	mov r10,r14
	bt r12,1
	jc LB_8549
	btr r12,4
	jmp LB_8550
LB_8549:
	bts r12,4
LB_8550:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_8547
	btr QWORD [rdi],1
	jmp LB_8548
LB_8547:
	bts QWORD [rdi],1
LB_8548:
	mov r10,r8
	bt r12,2
	jc LB_8555
	btr r12,4
	jmp LB_8556
LB_8555:
	bts r12,4
LB_8556:
	mov rsi,1
	bt r12,4
	jc LB_8553
	mov rsi,0
	bt r10,0
	jc LB_8553
	jmp LB_8554
LB_8553:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_8554:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_8551
	btr QWORD [rdi],2
	jmp LB_8552
LB_8551:
	bts QWORD [rdi],2
LB_8552:
	mov r8,0
	bts r12,2
	ret
LB_8557:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8559
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8558
LB_8559:
	add rsp,8
	ret
LB_8561:
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
LB_8560:
	add rsp,80
	pop r14
LB_8558:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_8660
LB_8659:
	add r14,1
LB_8660:
	cmp r14,r10
	jge LB_8661
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8659
	cmp al,10
	jz LB_8659
	cmp al,32
	jz LB_8659
LB_8661:
	add r14,3
	cmp r14,r10
	jg LB_8664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_8664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_8664
	jmp LB_8665
LB_8664:
	jmp LB_8638
LB_8665:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_8647
LB_8646:
	add r14,1
LB_8647:
	cmp r14,r10
	jge LB_8648
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8646
	cmp al,10
	jz LB_8646
	cmp al,32
	jz LB_8646
LB_8648:
	push r10
	call NS_E_4783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8649
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8650
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8650:
	jmp LB_8639
LB_8649:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_8653
LB_8652:
	add r14,1
LB_8653:
	cmp r14,r10
	jge LB_8654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8652
	cmp al,10
	jz LB_8652
	cmp al,32
	jz LB_8652
LB_8654:
	push r10
	call NS_E_5382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8655
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8656
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8656:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8657
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8657:
	jmp LB_8639
LB_8655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8644
	btr r12,2
	clc
	jmp LB_8645
LB_8644:
	bts r12,2
	stc
LB_8645:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8642
	btr r12,1
	clc
	jmp LB_8643
LB_8642:
	bts r12,1
	stc
LB_8643:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8640
	btr r12,0
	clc
	jmp LB_8641
LB_8640:
	bts r12,0
	stc
LB_8641:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8635
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8666
	btr r12,3
	jmp LB_8667
LB_8666:
	bts r12,3
LB_8667:
	mov r14,r8
	bt r12,2
	jc LB_8668
	btr r12,1
	jmp LB_8669
LB_8668:
	bts r12,1
LB_8669:
	mov r8,r13
	bt r12,0
	jc LB_8670
	btr r12,2
	jmp LB_8671
LB_8670:
	bts r12,2
LB_8671:
	mov r13,r9
	bt r12,3
	jc LB_8672
	btr r12,0
	jmp LB_8673
LB_8672:
	bts r12,0
LB_8673:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_5700 : %_5700
 ; {>  %_5698~0':_p1499 %_5699~1':_p1502 }
; _none {  } ⊢ °1◂{  }
; _some { %_5698 %_5699 %_5700 } ⊢ %_5701 : %_5701
 ; {>  %_5698~0':_p1499 %_5700~°1◂{  }:(_opn)◂(t2713'(0)) %_5699~1':_p1502 }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_5701
 ; {>  %_5701~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p1499 _p1502 (_opn)◂(t2716'(0)) }) }
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
	jc LB_8625
	btr r12,2
	jmp LB_8626
LB_8625:
	bts r12,2
LB_8626:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8623
	btr QWORD [rdi],0
	jmp LB_8624
LB_8623:
	bts QWORD [rdi],0
LB_8624:
	mov r8,r14
	bt r12,1
	jc LB_8629
	btr r12,2
	jmp LB_8630
LB_8629:
	bts r12,2
LB_8630:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8627
	btr QWORD [rdi],1
	jmp LB_8628
LB_8627:
	bts QWORD [rdi],1
LB_8628:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_8633
	mov rsi,0
	bt r8,0
	jc LB_8633
	jmp LB_8634
LB_8633:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_8634:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_8631
	btr QWORD [rdi],2
	jmp LB_8632
LB_8631:
	bts QWORD [rdi],2
LB_8632:
	mov r8,0
	bts r12,2
	ret
LB_8635:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8637
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8636
LB_8637:
	add rsp,8
	ret
LB_8639:
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
LB_8638:
	add rsp,48
	pop r14
LB_8636:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5400:
NS_E_RDI_5400:
NS_E_5400_ETR_TBL:
NS_E_5400_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_8694
LB_8693:
	add r14,1
LB_8694:
	cmp r14,r10
	jge LB_8695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8693
	cmp al,10
	jz LB_8693
	cmp al,32
	jz LB_8693
LB_8695:
	add r14,2
	cmp r14,r10
	jg LB_8698
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_8698
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_8698
	jmp LB_8699
LB_8698:
	jmp LB_8681
LB_8699:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_8688
LB_8687:
	add r14,1
LB_8688:
	cmp r14,r10
	jge LB_8689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8687
	cmp al,10
	jz LB_8687
	cmp al,32
	jz LB_8687
LB_8689:
	push r10
	call NS_E_5401_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8690
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8691
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8691:
	jmp LB_8682
LB_8690:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8685
	btr r12,1
	clc
	jmp LB_8686
LB_8685:
	bts r12,1
	stc
LB_8686:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8683
	btr r12,0
	clc
	jmp LB_8684
LB_8683:
	bts r12,0
	stc
LB_8684:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8678
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8700
	btr r12,2
	jmp LB_8701
LB_8700:
	bts r12,2
LB_8701:
	mov r13,r14
	bt r12,1
	jc LB_8702
	btr r12,0
	jmp LB_8703
LB_8702:
	bts r12,0
LB_8703:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1532 %_5702 ⊢ %_5703 : %_5703
 ; {>  %_5702~0':_p1492 }
; _f1532 0' ⊢ °0◂0'
; _some %_5703 ⊢ %_5704 : %_5704
 ; {>  %_5703~°0◂0':_p1491 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5704
 ; {>  %_5704~°0◂°0◂0':(_opn)◂(_p1491) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8676
	btr r12,3
	jmp LB_8677
LB_8676:
	bts r12,3
LB_8677:
	mov rsi,1
	bt r12,3
	jc LB_8674
	mov rsi,0
	bt r9,0
	jc LB_8674
	jmp LB_8675
LB_8674:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8675:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8678:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8680
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8679
LB_8680:
	add rsp,8
	ret
LB_8682:
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
LB_8681:
	add rsp,32
	pop r14
LB_8679:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_8723
LB_8722:
	add r14,1
LB_8723:
	cmp r14,r10
	jge LB_8724
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8722
	cmp al,10
	jz LB_8722
	cmp al,32
	jz LB_8722
LB_8724:
	push r10
	call NS_E_5402_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8725
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8717
LB_8725:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8728
LB_8727:
	add r14,1
LB_8728:
	cmp r14,r10
	jge LB_8729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8727
	cmp al,10
	jz LB_8727
	cmp al,32
	jz LB_8727
LB_8729:
	push r10
	call NS_E_5400_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8730
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8731
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8731:
	jmp LB_8717
LB_8730:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8720
	btr r12,1
	clc
	jmp LB_8721
LB_8720:
	bts r12,1
	stc
LB_8721:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,32
	push rdi
	push rsi
	push LB_8714
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f1533 { %_5705 %_5706 } ⊢ %_5707 : %_5707
 ; {>  %_5706~1':_p1491 %_5705~0':_p1493 }
; _f1533 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5707 ⊢ %_5708 : %_5708
 ; {>  %_5707~°1◂{ 0' 1' }:_p1491 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5708
 ; {>  %_5708~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1491) }
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
	jc LB_8708
	btr r12,2
	jmp LB_8709
LB_8708:
	bts r12,2
LB_8709:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8706
	btr QWORD [rdi],0
	jmp LB_8707
LB_8706:
	bts QWORD [rdi],0
LB_8707:
	mov r8,r14
	bt r12,1
	jc LB_8712
	btr r12,2
	jmp LB_8713
LB_8712:
	bts r12,2
LB_8713:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8710
	btr QWORD [rdi],1
	jmp LB_8711
LB_8710:
	bts QWORD [rdi],1
LB_8711:
	mov rsi,1
	bt r12,3
	jc LB_8704
	mov rsi,0
	bt r9,0
	jc LB_8704
	jmp LB_8705
LB_8704:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8705:
	mov rax,0x0100_0000_0000_0001
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
	add rsp,32
	pop r14
LB_8715:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_8735
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f1534 {  } ⊢ %_5709 : %_5709
 ; {>  }
; _f1534 {  } ⊢ °2◂{  }
; _some %_5709 ⊢ %_5710 : %_5710
 ; {>  %_5709~°2◂{  }:_p1491 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5710
 ; {>  %_5710~°0◂°2◂{  }:(_opn)◂(_p1491) }
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
	jc LB_8733
	mov rsi,0
	bt r9,0
	jc LB_8733
	jmp LB_8734
LB_8733:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8734:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8735:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8737
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8736
LB_8737:
	add rsp,8
	ret
LB_8738:
	add rsp,0
	pop r14
LB_8736:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5401:
NS_E_RDI_5401:
NS_E_5401_ETR_TBL:
NS_E_5401_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_8758
LB_8757:
	add r14,1
LB_8758:
	cmp r14,r10
	jge LB_8759
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8757
	cmp al,10
	jz LB_8757
	cmp al,32
	jz LB_8757
LB_8759:
	push r10
	call NS_E_5402_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8760
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8752
LB_8760:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_8763
LB_8762:
	add r14,1
LB_8763:
	cmp r14,r10
	jge LB_8764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8762
	cmp al,10
	jz LB_8762
	cmp al,32
	jz LB_8762
LB_8764:
	push r10
	call NS_E_5401_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8765
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8766
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8766:
	jmp LB_8752
LB_8765:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8755
	btr r12,1
	clc
	jmp LB_8756
LB_8755:
	bts r12,1
	stc
LB_8756:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8753
	btr r12,0
	clc
	jmp LB_8754
LB_8753:
	bts r12,0
	stc
LB_8754:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8749
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f1535 { %_5711 %_5712 } ⊢ %_5713 : %_5713
 ; {>  %_5712~1':_p1492 %_5711~0':_p1493 }
; _f1535 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5713 ⊢ %_5714 : %_5714
 ; {>  %_5713~°0◂{ 0' 1' }:_p1492 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5714
 ; {>  %_5714~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1492) }
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
	jc LB_8743
	btr r12,2
	jmp LB_8744
LB_8743:
	bts r12,2
LB_8744:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8741
	btr QWORD [rdi],0
	jmp LB_8742
LB_8741:
	bts QWORD [rdi],0
LB_8742:
	mov r8,r14
	bt r12,1
	jc LB_8747
	btr r12,2
	jmp LB_8748
LB_8747:
	bts r12,2
LB_8748:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8745
	btr QWORD [rdi],1
	jmp LB_8746
LB_8745:
	bts QWORD [rdi],1
LB_8746:
	mov rsi,1
	bt r12,3
	jc LB_8739
	mov rsi,0
	bt r9,0
	jc LB_8739
	jmp LB_8740
LB_8739:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8740:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8749:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8751
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8750
LB_8751:
	add rsp,8
	ret
LB_8752:
	add rsp,32
	pop r14
LB_8750:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_8770
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f1536 {  } ⊢ %_5715 : %_5715
 ; {>  }
; _f1536 {  } ⊢ °1◂{  }
; _some %_5715 ⊢ %_5716 : %_5716
 ; {>  %_5715~°1◂{  }:_p1492 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5716
 ; {>  %_5716~°0◂°1◂{  }:(_opn)◂(_p1492) }
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
	jc LB_8768
	mov rsi,0
	bt r9,0
	jc LB_8768
	jmp LB_8769
LB_8768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8769:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8770:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8772
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8771
LB_8772:
	add rsp,8
	ret
LB_8773:
	add rsp,0
	pop r14
LB_8771:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5402:
NS_E_RDI_5402:
NS_E_5402_ETR_TBL:
NS_E_5402_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_8789
LB_8788:
	add r14,1
LB_8789:
	cmp r14,r10
	jge LB_8790
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8788
	cmp al,10
	jz LB_8788
	cmp al,32
	jz LB_8788
LB_8790:
	add r14,3
	cmp r14,r10
	jg LB_8793
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8793
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8793
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_8793
	jmp LB_8794
LB_8793:
	jmp LB_8781
LB_8794:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_8796
LB_8795:
	add r14,1
LB_8796:
	cmp r14,r10
	jge LB_8797
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8795
	cmp al,10
	jz LB_8795
	cmp al,32
	jz LB_8795
LB_8797:
	push r10
	call NS_E_5403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8798
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8799:
	jmp LB_8781
LB_8798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_8802
LB_8801:
	add r14,1
LB_8802:
	cmp r14,r10
	jge LB_8803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8801
	cmp al,10
	jz LB_8801
	cmp al,32
	jz LB_8801
LB_8803:
	add r14,3
	cmp r14,r10
	jg LB_8808
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8808
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8808
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_8808
	jmp LB_8809
LB_8808:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8805
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8805:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8806
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8806:
	jmp LB_8781
LB_8809:
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
	jc LB_8786
	btr r12,2
	clc
	jmp LB_8787
LB_8786:
	bts r12,2
	stc
LB_8787:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8784
	btr r12,1
	clc
	jmp LB_8785
LB_8784:
	bts r12,1
	stc
LB_8785:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8782
	btr r12,0
	clc
	jmp LB_8783
LB_8782:
	bts r12,0
	stc
LB_8783:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8778
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_8810
	btr r12,3
	jmp LB_8811
LB_8810:
	bts r12,3
LB_8811:
	mov r13,r14
	bt r12,1
	jc LB_8812
	btr r12,0
	jmp LB_8813
LB_8812:
	bts r12,0
LB_8813:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f1537 %_5717 ⊢ %_5718 : %_5718
 ; {>  %_5717~0':_p1494 }
; _f1537 0' ⊢ °0◂0'
; _some %_5718 ⊢ %_5719 : %_5719
 ; {>  %_5718~°0◂0':_p1493 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5719
 ; {>  %_5719~°0◂°0◂0':(_opn)◂(_p1493) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8776
	btr r12,3
	jmp LB_8777
LB_8776:
	bts r12,3
LB_8777:
	mov rsi,1
	bt r12,3
	jc LB_8774
	mov rsi,0
	bt r9,0
	jc LB_8774
	jmp LB_8775
LB_8774:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8775:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8778:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8780
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8779
LB_8780:
	add rsp,8
	ret
LB_8781:
	add rsp,48
	pop r14
LB_8779:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_8825
LB_8824:
	add r14,1
LB_8825:
	cmp r14,r10
	jge LB_8826
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8824
	cmp al,10
	jz LB_8824
	cmp al,32
	jz LB_8824
LB_8826:
	push r10
	call NS_E_5403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8827
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8821
LB_8827:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8822
	btr r12,0
	clc
	jmp LB_8823
LB_8822:
	bts r12,0
	stc
LB_8823:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8818
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1538 %_5720 ⊢ %_5721 : %_5721
 ; {>  %_5720~0':_p1494 }
; _f1538 0' ⊢ °1◂0'
; _some %_5721 ⊢ %_5722 : %_5722
 ; {>  %_5721~°1◂0':_p1493 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5722
 ; {>  %_5722~°0◂°1◂0':(_opn)◂(_p1493) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8816
	btr r12,3
	jmp LB_8817
LB_8816:
	bts r12,3
LB_8817:
	mov rsi,1
	bt r12,3
	jc LB_8814
	mov rsi,0
	bt r9,0
	jc LB_8814
	jmp LB_8815
LB_8814:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8815:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8818:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8820
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8819
LB_8820:
	add rsp,8
	ret
LB_8821:
	add rsp,16
	pop r14
LB_8819:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5403:
NS_E_RDI_5403:
NS_E_5403_ETR_TBL:
NS_E_5403_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_8840
LB_8839:
	add r14,1
LB_8840:
	cmp r14,r10
	jge LB_8841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8839
	cmp al,10
	jz LB_8839
	cmp al,32
	jz LB_8839
LB_8841:
	push r10
	call NS_E_892_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8842
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8836
LB_8842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
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
	add rsp,16
	push rdi
	push rsi
	push LB_8833
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1540 %_5723 ⊢ %_5724 : %_5724
 ; {>  %_5723~0':_stg }
; _f1540 0' ⊢ °1◂0'
; _some %_5724 ⊢ %_5725 : %_5725
 ; {>  %_5724~°1◂0':_p1494 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5725
 ; {>  %_5725~°0◂°1◂0':(_opn)◂(_p1494) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8831
	btr r12,3
	jmp LB_8832
LB_8831:
	bts r12,3
LB_8832:
	mov rsi,1
	bt r12,3
	jc LB_8829
	mov rsi,0
	bt r9,0
	jc LB_8829
	jmp LB_8830
LB_8829:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8830:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
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
	add rsp,16
	pop r14
LB_8834:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_8855
LB_8854:
	add r14,1
LB_8855:
	cmp r14,r10
	jge LB_8856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8854
	cmp al,10
	jz LB_8854
	cmp al,32
	jz LB_8854
LB_8856:
	push r10
	call NS_E_4323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8857
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8851
LB_8857:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8852
	btr r12,0
	clc
	jmp LB_8853
LB_8852:
	bts r12,0
	stc
LB_8853:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8848
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f1539 %_5726 ⊢ %_5727 : %_5727
 ; {>  %_5726~0':_p1435 }
; _f1539 0' ⊢ °0◂0'
; _some %_5727 ⊢ %_5728 : %_5728
 ; {>  %_5727~°0◂0':_p1494 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5728
 ; {>  %_5728~°0◂°0◂0':(_opn)◂(_p1494) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8846
	btr r12,3
	jmp LB_8847
LB_8846:
	bts r12,3
LB_8847:
	mov rsi,1
	bt r12,3
	jc LB_8844
	mov rsi,0
	bt r9,0
	jc LB_8844
	jmp LB_8845
LB_8844:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8845:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8848:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8850
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8849
LB_8850:
	add rsp,8
	ret
LB_8851:
	add rsp,16
	pop r14
LB_8849:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5404:
NS_E_RDI_5404:
NS_E_5404_ETR_TBL:
NS_E_5404_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_8868
LB_8867:
	add r14,1
LB_8868:
	cmp r14,r10
	jge LB_8869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8867
	cmp al,10
	jz LB_8867
	cmp al,32
	jz LB_8867
LB_8869:
	add r14,4
	cmp r14,r10
	jg LB_8872
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8872
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8872
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8872
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_8872
	jmp LB_8873
LB_8872:
	jmp LB_8864
LB_8873:
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
	jc LB_8865
	btr r12,0
	clc
	jmp LB_8866
LB_8865:
	bts r12,0
	stc
LB_8866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8861
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f1530 {  } ⊢ %_5729 : %_5729
 ; {>  }
; _f1530 {  } ⊢ °1◂{  }
; _some %_5729 ⊢ %_5730 : %_5730
 ; {>  %_5729~°1◂{  }:_p1490 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5730
 ; {>  %_5730~°0◂°1◂{  }:(_opn)◂(_p1490) }
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
	jc LB_8859
	mov rsi,0
	bt r9,0
	jc LB_8859
	jmp LB_8860
LB_8859:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8860:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8863
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8862
LB_8863:
	add rsp,8
	ret
LB_8864:
	add rsp,16
	pop r14
LB_8862:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_8883
LB_8882:
	add r14,1
LB_8883:
	cmp r14,r10
	jge LB_8884
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8882
	cmp al,10
	jz LB_8882
	cmp al,32
	jz LB_8882
LB_8884:
	add r14,4
	cmp r14,r10
	jg LB_8887
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8887
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8887
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8887
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_8887
	jmp LB_8888
LB_8887:
	jmp LB_8879
LB_8888:
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
	jc LB_8880
	btr r12,0
	clc
	jmp LB_8881
LB_8880:
	bts r12,0
	stc
LB_8881:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8876
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f1531 {  } ⊢ %_5731 : %_5731
 ; {>  }
; _f1531 {  } ⊢ °2◂{  }
; _some %_5731 ⊢ %_5732 : %_5732
 ; {>  %_5731~°2◂{  }:_p1490 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5732
 ; {>  %_5732~°0◂°2◂{  }:(_opn)◂(_p1490) }
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
	jc LB_8874
	mov rsi,0
	bt r9,0
	jc LB_8874
	jmp LB_8875
LB_8874:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8875:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8876:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8878
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8877
LB_8878:
	add rsp,8
	ret
LB_8879:
	add rsp,16
	pop r14
LB_8877:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_8898
LB_8897:
	add r14,1
LB_8898:
	cmp r14,r10
	jge LB_8899
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8897
	cmp al,10
	jz LB_8897
	cmp al,32
	jz LB_8897
LB_8899:
	add r14,3
	cmp r14,r10
	jg LB_8902
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8902
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_8902
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_8902
	jmp LB_8903
LB_8902:
	jmp LB_8894
LB_8903:
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
	jc LB_8895
	btr r12,0
	clc
	jmp LB_8896
LB_8895:
	bts r12,0
	stc
LB_8896:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8891
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f1529 {  } ⊢ %_5733 : %_5733
 ; {>  }
; _f1529 {  } ⊢ °0◂{  }
; _some %_5733 ⊢ %_5734 : %_5734
 ; {>  %_5733~°0◂{  }:_p1490 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5734
 ; {>  %_5734~°0◂°0◂{  }:(_opn)◂(_p1490) }
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
	jc LB_8889
	mov rsi,0
	bt r9,0
	jc LB_8889
	jmp LB_8890
LB_8889:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8890:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8891:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8893
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8892
LB_8893:
	add rsp,8
	ret
LB_8894:
	add rsp,16
	pop r14
LB_8892:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5405:
NS_E_RDI_5405:
NS_E_5405_ETR_TBL:
NS_E_5405_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_8913
LB_8912:
	add r14,1
LB_8913:
	cmp r14,r10
	jge LB_8914
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8912
	cmp al,10
	jz LB_8912
	cmp al,32
	jz LB_8912
LB_8914:
	add r14,5
	cmp r14,r10
	jg LB_8917
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8917
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8917
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8917
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8917
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_8917
	jmp LB_8918
LB_8917:
	jmp LB_8909
LB_8918:
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
	jc LB_8910
	btr r12,0
	clc
	jmp LB_8911
LB_8910:
	bts r12,0
	stc
LB_8911:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8906
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f1530 {  } ⊢ %_5735 : %_5735
 ; {>  }
; _f1530 {  } ⊢ °1◂{  }
; _some %_5735 ⊢ %_5736 : %_5736
 ; {>  %_5735~°1◂{  }:_p1490 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5736
 ; {>  %_5736~°0◂°1◂{  }:(_opn)◂(_p1490) }
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
	jc LB_8904
	mov rsi,0
	bt r9,0
	jc LB_8904
	jmp LB_8905
LB_8904:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8905:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8906:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8908
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8907
LB_8908:
	add rsp,8
	ret
LB_8909:
	add rsp,16
	pop r14
LB_8907:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_8928
LB_8927:
	add r14,1
LB_8928:
	cmp r14,r10
	jge LB_8929
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8927
	cmp al,10
	jz LB_8927
	cmp al,32
	jz LB_8927
LB_8929:
	add r14,5
	cmp r14,r10
	jg LB_8932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_8932
	jmp LB_8933
LB_8932:
	jmp LB_8924
LB_8933:
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
	jc LB_8925
	btr r12,0
	clc
	jmp LB_8926
LB_8925:
	bts r12,0
	stc
LB_8926:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8921
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f1531 {  } ⊢ %_5737 : %_5737
 ; {>  }
; _f1531 {  } ⊢ °2◂{  }
; _some %_5737 ⊢ %_5738 : %_5738
 ; {>  %_5737~°2◂{  }:_p1490 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5738
 ; {>  %_5738~°0◂°2◂{  }:(_opn)◂(_p1490) }
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
	jc LB_8919
	mov rsi,0
	bt r9,0
	jc LB_8919
	jmp LB_8920
LB_8919:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8920:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8921:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8923
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8922
LB_8923:
	add rsp,8
	ret
LB_8924:
	add rsp,16
	pop r14
LB_8922:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_8943
LB_8942:
	add r14,1
LB_8943:
	cmp r14,r10
	jge LB_8944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8942
	cmp al,10
	jz LB_8942
	cmp al,32
	jz LB_8942
LB_8944:
	add r14,4
	cmp r14,r10
	jg LB_8947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_8947
	jmp LB_8948
LB_8947:
	jmp LB_8939
LB_8948:
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
	jc LB_8940
	btr r12,0
	clc
	jmp LB_8941
LB_8940:
	bts r12,0
	stc
LB_8941:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8936
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f1529 {  } ⊢ %_5739 : %_5739
 ; {>  }
; _f1529 {  } ⊢ °0◂{  }
; _some %_5739 ⊢ %_5740 : %_5740
 ; {>  %_5739~°0◂{  }:_p1490 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5740
 ; {>  %_5740~°0◂°0◂{  }:(_opn)◂(_p1490) }
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
	jc LB_8934
	mov rsi,0
	bt r9,0
	jc LB_8934
	jmp LB_8935
LB_8934:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8935:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8936:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8938
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8937
LB_8938:
	add rsp,8
	ret
LB_8939:
	add rsp,16
	pop r14
LB_8937:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5406:
NS_E_RDI_5406:
NS_E_5406_ETR_TBL:
NS_E_5406_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_9004
LB_9003:
	add r14,1
LB_9004:
	cmp r14,r10
	jge LB_9005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9003
	cmp al,10
	jz LB_9003
	cmp al,32
	jz LB_9003
LB_9005:
	push r10
	call NS_E_5405_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9006
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8972
LB_9006:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_8983
LB_8982:
	add r14,1
LB_8983:
	cmp r14,r10
	jge LB_8984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8982
	cmp al,10
	jz LB_8982
	cmp al,32
	jz LB_8982
LB_8984:
	push r10
	call NS_E_5408_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8985
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8986
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8986:
	jmp LB_8973
LB_8985:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_8989
LB_8988:
	add r14,1
LB_8989:
	cmp r14,r10
	jge LB_8990
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8988
	cmp al,10
	jz LB_8988
	cmp al,32
	jz LB_8988
LB_8990:
	push r10
	call NS_E_5400_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8991
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8992
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8992:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8993:
	jmp LB_8973
LB_8991:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_8996
LB_8995:
	add r14,1
LB_8996:
	cmp r14,r10
	jge LB_8997
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8995
	cmp al,10
	jz LB_8995
	cmp al,32
	jz LB_8995
LB_8997:
	push r10
	call NS_E_5407_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8998
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8999
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8999:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9000
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9000:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9001
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9001:
	jmp LB_8973
LB_8998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8980
	btr r12,3
	clc
	jmp LB_8981
LB_8980:
	bts r12,3
	stc
LB_8981:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8978
	btr r12,2
	clc
	jmp LB_8979
LB_8978:
	bts r12,2
	stc
LB_8979:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8976
	btr r12,1
	clc
	jmp LB_8977
LB_8976:
	bts r12,1
	stc
LB_8977:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8974
	btr r12,0
	clc
	jmp LB_8975
LB_8974:
	bts r12,0
	stc
LB_8975:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8969
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f1526 { %_5742 %_5741 %_5743 %_5744 } ⊢ %_5745 : %_5745
 ; {>  %_5743~2':_p1491 %_5741~0':_p1490 %_5742~1':(_opn)◂(_stg) %_5744~3':(_opn)◂(_p1488) }
; _f1526 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_5745 ⊢ %_5746 : %_5746
 ; {>  %_5745~°1◂{ 1' 0' 2' 3' }:_p1488 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_5746
 ; {>  %_5746~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p1488) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_8949
	btr r12,4
	jmp LB_8950
LB_8949:
	bts r12,4
LB_8950:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_8955
	btr r12,5
	jmp LB_8956
LB_8955:
	bts r12,5
LB_8956:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_8953
	btr QWORD [rdi],0
	jmp LB_8954
LB_8953:
	bts QWORD [rdi],0
LB_8954:
	mov r11,r13
	bt r12,0
	jc LB_8959
	btr r12,5
	jmp LB_8960
LB_8959:
	bts r12,5
LB_8960:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_8957
	btr QWORD [rdi],1
	jmp LB_8958
LB_8957:
	bts QWORD [rdi],1
LB_8958:
	mov r11,r8
	bt r12,2
	jc LB_8963
	btr r12,5
	jmp LB_8964
LB_8963:
	bts r12,5
LB_8964:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_8961
	btr QWORD [rdi],2
	jmp LB_8962
LB_8961:
	bts QWORD [rdi],2
LB_8962:
	mov r11,r10
	bt r12,4
	jc LB_8967
	btr r12,5
	jmp LB_8968
LB_8967:
	bts r12,5
LB_8968:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_8965
	btr QWORD [rdi],3
	jmp LB_8966
LB_8965:
	bts QWORD [rdi],3
LB_8966:
	mov rsi,1
	bt r12,3
	jc LB_8951
	mov rsi,0
	bt r9,0
	jc LB_8951
	jmp LB_8952
LB_8951:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8952:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8969:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8971
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8970
LB_8971:
	add rsp,8
	ret
LB_8973:
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
LB_8972:
	add rsp,64
	pop r14
LB_8970:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_9047
LB_9046:
	add r14,1
LB_9047:
	cmp r14,r10
	jge LB_9048
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9046
	cmp al,10
	jz LB_9046
	cmp al,32
	jz LB_9046
LB_9048:
	push r10
	call NS_E_5404_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9049
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9035
LB_9049:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_9052
LB_9051:
	add r14,1
LB_9052:
	cmp r14,r10
	jge LB_9053
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9051
	cmp al,10
	jz LB_9051
	cmp al,32
	jz LB_9051
LB_9053:
	push r10
	call NS_E_5408_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9054
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9055
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9055:
	jmp LB_9035
LB_9054:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_9058
LB_9057:
	add r14,1
LB_9058:
	cmp r14,r10
	jge LB_9059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9057
	cmp al,10
	jz LB_9057
	cmp al,32
	jz LB_9057
LB_9059:
	push r10
	call NS_E_5400_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9060
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9061
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9061:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9062:
	jmp LB_9035
LB_9060:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_9065
LB_9064:
	add r14,1
LB_9065:
	cmp r14,r10
	jge LB_9066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9064
	cmp al,10
	jz LB_9064
	cmp al,32
	jz LB_9064
LB_9066:
	push r10
	call NS_E_5407_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9067
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9068
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9068:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9069
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9069:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9070:
	jmp LB_9035
LB_9067:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_9073
LB_9072:
	add r14,1
LB_9073:
	cmp r14,r10
	jge LB_9074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9072
	cmp al,10
	jz LB_9072
	cmp al,32
	jz LB_9072
LB_9074:
	push r10
	call NS_E_5406_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9075
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9076
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9076:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9077
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9077:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9078
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9078:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9079:
	jmp LB_9035
LB_9075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9044
	btr r12,4
	clc
	jmp LB_9045
LB_9044:
	bts r12,4
	stc
LB_9045:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9042
	btr r12,3
	clc
	jmp LB_9043
LB_9042:
	bts r12,3
	stc
LB_9043:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9040
	btr r12,2
	clc
	jmp LB_9041
LB_9040:
	bts r12,2
	stc
LB_9041:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9038
	btr r12,1
	clc
	jmp LB_9039
LB_9038:
	bts r12,1
	stc
LB_9039:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9036
	btr r12,0
	clc
	jmp LB_9037
LB_9036:
	bts r12,0
	stc
LB_9037:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_9032
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f1525 { %_5748 %_5747 %_5749 %_5750 %_5751 } ⊢ %_5752 : %_5752
 ; {>  %_5751~4':_p1488 %_5750~3':(_opn)◂(_p1488) %_5748~1':(_opn)◂(_stg) %_5749~2':_p1491 %_5747~0':_p1490 }
; _f1525 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_5752 ⊢ %_5753 : %_5753
 ; {>  %_5752~°0◂{ 1' 0' 2' 3' 4' }:_p1488 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_5753
 ; {>  %_5753~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p1488) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_9008
	btr r12,5
	jmp LB_9009
LB_9008:
	bts r12,5
LB_9009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_9014
	btr r12,6
	jmp LB_9015
LB_9014:
	bts r12,6
LB_9015:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_9012
	btr QWORD [rdi],0
	jmp LB_9013
LB_9012:
	bts QWORD [rdi],0
LB_9013:
	mov rcx,r13
	bt r12,0
	jc LB_9018
	btr r12,6
	jmp LB_9019
LB_9018:
	bts r12,6
LB_9019:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_9016
	btr QWORD [rdi],1
	jmp LB_9017
LB_9016:
	bts QWORD [rdi],1
LB_9017:
	mov rcx,r8
	bt r12,2
	jc LB_9022
	btr r12,6
	jmp LB_9023
LB_9022:
	bts r12,6
LB_9023:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_9020
	btr QWORD [rdi],2
	jmp LB_9021
LB_9020:
	bts QWORD [rdi],2
LB_9021:
	mov rcx,r11
	bt r12,5
	jc LB_9026
	btr r12,6
	jmp LB_9027
LB_9026:
	bts r12,6
LB_9027:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_9024
	btr QWORD [rdi],3
	jmp LB_9025
LB_9024:
	bts QWORD [rdi],3
LB_9025:
	mov rcx,r10
	bt r12,4
	jc LB_9030
	btr r12,6
	jmp LB_9031
LB_9030:
	bts r12,6
LB_9031:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_9028
	btr QWORD [rdi],4
	jmp LB_9029
LB_9028:
	bts QWORD [rdi],4
LB_9029:
	mov rsi,1
	bt r12,3
	jc LB_9010
	mov rsi,0
	bt r9,0
	jc LB_9010
	jmp LB_9011
LB_9010:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9011:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9032:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9034
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9033
LB_9034:
	add rsp,8
	ret
LB_9035:
	add rsp,80
	pop r14
LB_9033:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5407:
NS_E_RDI_5407:
NS_E_5407_ETR_TBL:
NS_E_5407_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_9094
LB_9093:
	add r14,1
LB_9094:
	cmp r14,r10
	jge LB_9095
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9093
	cmp al,10
	jz LB_9093
	cmp al,32
	jz LB_9093
LB_9095:
	add r14,1
	cmp r14,r10
	jg LB_9098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_9098
	jmp LB_9099
LB_9098:
	jmp LB_9088
LB_9099:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_9101
LB_9100:
	add r14,1
LB_9101:
	cmp r14,r10
	jge LB_9102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9100
	cmp al,10
	jz LB_9100
	cmp al,32
	jz LB_9100
LB_9102:
	push r10
	call NS_E_5406_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9103
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9104
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9104:
	jmp LB_9088
LB_9103:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9091
	btr r12,1
	clc
	jmp LB_9092
LB_9091:
	bts r12,1
	stc
LB_9092:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9089
	btr r12,0
	clc
	jmp LB_9090
LB_9089:
	bts r12,0
	stc
LB_9090:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9085
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9106
	btr r12,2
	jmp LB_9107
LB_9106:
	bts r12,2
LB_9107:
	mov r13,r14
	bt r12,1
	jc LB_9108
	btr r12,0
	jmp LB_9109
LB_9108:
	bts r12,0
LB_9109:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5754 ⊢ %_5755 : %_5755
 ; {>  %_5754~0':_p1488 }
; _some 0' ⊢ °0◂0'
; _some %_5755 ⊢ %_5756 : %_5756
 ; {>  %_5755~°0◂0':(_opn)◂(_p1488) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5756
 ; {>  %_5756~°0◂°0◂0':(_opn)◂((_opn)◂(_p1488)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9083
	btr r12,3
	jmp LB_9084
LB_9083:
	bts r12,3
LB_9084:
	mov rsi,1
	bt r12,3
	jc LB_9081
	mov rsi,0
	bt r9,0
	jc LB_9081
	jmp LB_9082
LB_9081:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9082:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9085:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9087
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9086
LB_9087:
	add rsp,8
	ret
LB_9088:
	add rsp,32
	pop r14
LB_9086:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_9112
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_5757 : %_5757
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5757 ⊢ %_5758 : %_5758
 ; {>  %_5757~°1◂{  }:(_opn)◂(t2794'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5758
 ; {>  %_5758~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2797'(0))) }
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
	jc LB_9110
	mov rsi,0
	bt r9,0
	jc LB_9110
	jmp LB_9111
LB_9110:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9111:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9112:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9114
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9113
LB_9114:
	add rsp,8
	ret
LB_9115:
	add rsp,0
	pop r14
LB_9113:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5408:
NS_E_RDI_5408:
NS_E_5408_ETR_TBL:
NS_E_5408_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_9129
LB_9128:
	add r14,1
LB_9129:
	cmp r14,r10
	jge LB_9130
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9128
	cmp al,10
	jz LB_9128
	cmp al,32
	jz LB_9128
LB_9130:
	push r10
	call NS_E_1260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9131
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9123
LB_9131:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
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
	add r14,1
	cmp r14,r10
	jg LB_9139
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_9139
	jmp LB_9140
LB_9139:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9137
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9137:
	jmp LB_9123
LB_9140:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9126
	btr r12,1
	clc
	jmp LB_9127
LB_9126:
	bts r12,1
	stc
LB_9127:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9124
	btr r12,0
	clc
	jmp LB_9125
LB_9124:
	bts r12,0
	stc
LB_9125:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9120
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5759 ⊢ %_5760 : %_5760
 ; {>  %_5759~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_5760 ⊢ %_5761 : %_5761
 ; {>  %_5760~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5761
 ; {>  %_5761~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9118
	btr r12,3
	jmp LB_9119
LB_9118:
	bts r12,3
LB_9119:
	mov rsi,1
	bt r12,3
	jc LB_9116
	mov rsi,0
	bt r9,0
	jc LB_9116
	jmp LB_9117
LB_9116:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9117:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9120:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9122
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9121
LB_9122:
	add rsp,8
	ret
LB_9123:
	add rsp,32
	pop r14
LB_9121:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_9143
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_5762 : %_5762
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5762 ⊢ %_5763 : %_5763
 ; {>  %_5762~°1◂{  }:(_opn)◂(t2806'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5763
 ; {>  %_5763~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2809'(0))) }
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
	jc LB_9141
	mov rsi,0
	bt r9,0
	jc LB_9141
	jmp LB_9142
LB_9141:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9142:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9143:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9145
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9144
LB_9145:
	add rsp,8
	ret
LB_9146:
	add rsp,0
	pop r14
LB_9144:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9192:
NS_E_RDI_9192:
; » _^ ..
	xor rax,rax
	add rax,9
	add rax,15
	add rax,13
	add rax,10
	add rax,9
	add rax,7
	add rax,10
	add rax,11
	add rax,10
	add rax,10
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; » 0xr0 |~ {  } ⊢ %_9148 : %_9148
 ; {>  %_9147~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_9148
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_9149 : %_9149
 ; {>  %_9147~0':_stg %_9148~1':_r64 }
; 	» _args _ ⊢ 2' : %_9149
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
MTC_LB_9193:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9194
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
	jnc LB_9195
	bt QWORD [rdi],0
	jc LB_9196
	btr r12,5
	clc
	jmp LB_9197
LB_9196:
	bts r12,5
	stc
LB_9197:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9195:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_9200
	btr r12,6
	clc
	jmp LB_9201
LB_9200:
	bts r12,6
	stc
LB_9201:
	mov r9,rcx
	bt r12,6
	jc LB_9198
	btr r12,3
	jmp LB_9199
LB_9198:
	bts r12,3
LB_9199:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_9204
	btr r12,6
	clc
	jmp LB_9205
LB_9204:
	bts r12,6
	stc
LB_9205:
	mov r10,rcx
	bt r12,6
	jc LB_9202
	btr r12,4
	jmp LB_9203
LB_9202:
	bts r12,4
LB_9203:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9194
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
	jnc LB_9206
	bt QWORD [rdi],0
	jc LB_9207
	btr r12,7
	clc
	jmp LB_9208
LB_9207:
	bts r12,7
	stc
LB_9208:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9206:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_9211
	btr r12,8
	clc
	jmp LB_9212
LB_9211:
	bts r12,8
	stc
LB_9212:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9209
	btr r12,5
	jmp LB_9210
LB_9209:
	bts r12,5
LB_9210:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_9215
	btr r12,8
	clc
	jmp LB_9216
LB_9215:
	bts r12,8
	stc
LB_9216:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9213
	btr r12,6
	jmp LB_9214
LB_9213:
	bts r12,6
LB_9214:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9194
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
	jnc LB_9217
	bt QWORD [rdi],0
	jc LB_9218
	btr r12,7
	clc
	jmp LB_9219
LB_9218:
	bts r12,7
	stc
LB_9219:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9217:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9220:
	cmp r15,0
	jz LB_9221
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9220
LB_9221:
; _f37 %_9152 ⊢ { %_9154 %_9155 } : { %_9154 %_9155 }
 ; {>  %_9152~5':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
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
	jc LB_9228
	btr r12,0
	jmp LB_9229
LB_9228:
	bts r12,0
LB_9229:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_9230
	btr r12,2
	jmp LB_9231
LB_9230:
	bts r12,2
LB_9231:
	mov r10,r14
	bt r12,1
	jc LB_9232
	btr r12,4
	jmp LB_9233
LB_9232:
	bts r12,4
LB_9233:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9226
	btr r12,3
	clc
	jmp LB_9227
LB_9226:
	bts r12,3
	stc
LB_9227:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9224
	btr r12,1
	clc
	jmp LB_9225
LB_9224:
	bts r12,1
	stc
LB_9225:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9222
	btr r12,0
	clc
	jmp LB_9223
LB_9222:
	bts r12,0
	stc
LB_9223:
	add rsp,32
; _f4258 %_9155 ⊢ { %_9156 %_9157 } : { %_9156 %_9157 }
 ; {>  %_9154~2':_stg %_9155~4':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
; _f4258 4' ⊢ { 4' 5' }
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
	jc LB_9242
	btr r12,0
	jmp LB_9243
LB_9242:
	bts r12,0
LB_9243:
	call NS_E_4258
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_9244
	btr r12,4
	jmp LB_9245
LB_9244:
	bts r12,4
LB_9245:
	mov r11,r14
	bt r12,1
	jc LB_9246
	btr r12,5
	jmp LB_9247
LB_9246:
	bts r12,5
LB_9247:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9240
	btr r12,3
	clc
	jmp LB_9241
LB_9240:
	bts r12,3
	stc
LB_9241:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9238
	btr r12,2
	clc
	jmp LB_9239
LB_9238:
	bts r12,2
	stc
LB_9239:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9236
	btr r12,1
	clc
	jmp LB_9237
LB_9236:
	bts r12,1
	stc
LB_9237:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9234
	btr r12,0
	clc
	jmp LB_9235
LB_9234:
	bts r12,0
	stc
LB_9235:
	add rsp,40
MTC_LB_9248:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9249
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
	jnc LB_9250
	bt QWORD [rdi],0
	jc LB_9251
	btr r12,7
	clc
	jmp LB_9252
LB_9251:
	bts r12,7
	stc
LB_9252:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9250:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_9253
	btr r12,6
	jmp LB_9254
LB_9253:
	bts r12,6
LB_9254:
LB_9255:
	cmp r15,0
	jz LB_9256
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9255
LB_9256:
; » 0xr0 |~ {  } ⊢ %_9159 : %_9159
 ; {>  %_9154~2':_stg %_9156~4':_stg %_9158~6':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_9159
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f5368 { %_9158 %_9159 } ⊢ { %_9160 %_9161 %_9162 } : { %_9160 %_9161 %_9162 }
 ; {>  %_9154~2':_stg %_9156~4':_stg %_9159~5':_r64 %_9158~6':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
; _f5368 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_9267
	btr r12,0
	jmp LB_9268
LB_9267:
	bts r12,0
LB_9268:
	mov r14,r11
	bt r12,5
	jc LB_9269
	btr r12,1
	jmp LB_9270
LB_9269:
	bts r12,1
LB_9270:
	call NS_E_5368
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_9271
	btr r12,5
	jmp LB_9272
LB_9271:
	bts r12,5
LB_9272:
	mov rcx,r14
	bt r12,1
	jc LB_9273
	btr r12,6
	jmp LB_9274
LB_9273:
	bts r12,6
LB_9274:
	mov rdx,r9
	bt r12,3
	jc LB_9277
	btr r12,7
	jmp LB_9278
LB_9277:
	bts r12,7
LB_9278:
	mov rsi,1
	bt r12,7
	jc LB_9275
	mov rsi,0
	bt rdx,0
	jc LB_9275
	jmp LB_9276
LB_9275:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_9276:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9265
	btr r12,4
	clc
	jmp LB_9266
LB_9265:
	bts r12,4
	stc
LB_9266:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9263
	btr r12,3
	clc
	jmp LB_9264
LB_9263:
	bts r12,3
	stc
LB_9264:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9261
	btr r12,2
	clc
	jmp LB_9262
LB_9261:
	bts r12,2
	stc
LB_9262:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9259
	btr r12,1
	clc
	jmp LB_9260
LB_9259:
	bts r12,1
	stc
LB_9260:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9257
	btr r12,0
	clc
	jmp LB_9258
LB_9257:
	bts r12,0
	stc
LB_9258:
	add rsp,48
MTC_LB_9279:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9280
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
	jnc LB_9281
	bt QWORD [rdi],0
	jc LB_9282
	btr r12,9
	clc
	jmp LB_9283
LB_9282:
	bts r12,9
	stc
LB_9283:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9281:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_9284
	btr r12,8
	jmp LB_9285
LB_9284:
	bts r12,8
LB_9285:
LB_9286:
	cmp r15,0
	jz LB_9287
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9286
LB_9287:
; » 0xr0 |~ {  } ⊢ %_9164 : %_9164
 ; {>  %_9161~6':_r64 %_9154~2':_stg %_9156~4':_stg %_9163~8':(_lst)◂(_p1483) %_9160~5':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
; 	» 0xr0 _ ⊢ 7' : %_9164
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f1822 { %_9164 %_9163 } ⊢ { %_9165 %_9166 } : { %_9165 %_9166 }
 ; {>  %_9161~6':_r64 %_9154~2':_stg %_9156~4':_stg %_9163~8':(_lst)◂(_p1483) %_9160~5':_stg %_9164~7':_r64 %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
; _f1822 { 7' 8' } ⊢ { 7' 8' }
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
	jc LB_9302
	btr r12,0
	jmp LB_9303
LB_9302:
	bts r12,0
LB_9303:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9304
	btr r12,1
	jmp LB_9305
LB_9304:
	bts r12,1
LB_9305:
	call NS_E_1822
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_9306
	btr r12,7
	jmp LB_9307
LB_9306:
	bts r12,7
LB_9307:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_9308
	btr r12,8
	jmp LB_9309
LB_9308:
	bts r12,8
LB_9309:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_9300
	btr r12,6
	clc
	jmp LB_9301
LB_9300:
	bts r12,6
	stc
LB_9301:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9298
	btr r12,5
	clc
	jmp LB_9299
LB_9298:
	bts r12,5
	stc
LB_9299:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9296
	btr r12,4
	clc
	jmp LB_9297
LB_9296:
	bts r12,4
	stc
LB_9297:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9294
	btr r12,3
	clc
	jmp LB_9295
LB_9294:
	bts r12,3
	stc
LB_9295:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9292
	btr r12,2
	clc
	jmp LB_9293
LB_9292:
	bts r12,2
	stc
LB_9293:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9290
	btr r12,1
	clc
	jmp LB_9291
LB_9290:
	bts r12,1
	stc
LB_9291:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9288
	btr r12,0
	clc
	jmp LB_9289
LB_9288:
	bts r12,0
	stc
LB_9289:
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
; _f38 %_9168 ⊢ %_9169 : %_9169
 ; {>  %_9161~6':_r64 %_9154~2':_stg %_9156~4':_stg %_9165~7':_r64 %_9168~9':_stg %_9160~5':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 %_9167~8':_stg }
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
	jc LB_9328
	btr r12,0
	jmp LB_9329
LB_9328:
	bts r12,0
LB_9329:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_9330
	btr r12,9
	jmp LB_9331
LB_9330:
	bts r12,9
LB_9331:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_9326
	btr r12,8
	clc
	jmp LB_9327
LB_9326:
	bts r12,8
	stc
LB_9327:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_9324
	btr r12,7
	clc
	jmp LB_9325
LB_9324:
	bts r12,7
	stc
LB_9325:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_9322
	btr r12,6
	clc
	jmp LB_9323
LB_9322:
	bts r12,6
	stc
LB_9323:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9320
	btr r12,5
	clc
	jmp LB_9321
LB_9320:
	bts r12,5
	stc
LB_9321:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9318
	btr r12,4
	clc
	jmp LB_9319
LB_9318:
	bts r12,4
	stc
LB_9319:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9316
	btr r12,3
	clc
	jmp LB_9317
LB_9316:
	bts r12,3
	stc
LB_9317:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9314
	btr r12,2
	clc
	jmp LB_9315
LB_9314:
	bts r12,2
	stc
LB_9315:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9312
	btr r12,1
	clc
	jmp LB_9313
LB_9312:
	bts r12,1
	stc
LB_9313:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9310
	btr r12,0
	clc
	jmp LB_9311
LB_9310:
	bts r12,0
	stc
LB_9311:
	add rsp,80
; ∎ {  }
 ; {>  %_9161~6':_r64 %_9154~2':_stg %_9156~4':_stg %_9165~7':_r64 %_9160~5':_stg %_9169~9':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 %_9167~8':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_9332
	mov rdi,rcx
	call dlt
LB_9332:
	bt r12,2
	jc LB_9333
	mov rdi,r8
	call dlt
LB_9333:
	bt r12,4
	jc LB_9334
	mov rdi,r10
	call dlt
LB_9334:
	bt r12,7
	jc LB_9335
	mov rdi,rdx
	call dlt
LB_9335:
	bt r12,5
	jc LB_9336
	mov rdi,r11
	call dlt
LB_9336:
	bt r12,9
	jc LB_9337
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_9337:
	bt r12,0
	jc LB_9338
	mov rdi,r13
	call dlt
LB_9338:
	bt r12,3
	jc LB_9339
	mov rdi,r9
	call dlt
LB_9339:
	bt r12,1
	jc LB_9340
	mov rdi,r14
	call dlt
LB_9340:
	bt r12,8
	jc LB_9341
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_9341:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9280:
	mov r15,0
LB_9343:
	cmp r15,0
	jz LB_9344
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9343
LB_9344:
; 	» "H0\n" _ ⊢ 8' : %_9170
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_9170 ⊢ %_9171 : %_9171
 ; {>  %_9170~8':_stg %_9161~6':_r64 %_9154~2':_stg %_9156~4':_stg %_9160~5':_stg %_9162~7':(_opn)◂((_lst)◂(_p1483)) %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
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
	jc LB_9361
	btr r12,0
	jmp LB_9362
LB_9361:
	bts r12,0
LB_9362:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_9363
	btr r12,8
	jmp LB_9364
LB_9363:
	bts r12,8
LB_9364:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_9359
	btr r12,7
	clc
	jmp LB_9360
LB_9359:
	bts r12,7
	stc
LB_9360:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_9357
	btr r12,6
	clc
	jmp LB_9358
LB_9357:
	bts r12,6
	stc
LB_9358:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9355
	btr r12,5
	clc
	jmp LB_9356
LB_9355:
	bts r12,5
	stc
LB_9356:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9353
	btr r12,4
	clc
	jmp LB_9354
LB_9353:
	bts r12,4
	stc
LB_9354:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9351
	btr r12,3
	clc
	jmp LB_9352
LB_9351:
	bts r12,3
	stc
LB_9352:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9349
	btr r12,2
	clc
	jmp LB_9350
LB_9349:
	bts r12,2
	stc
LB_9350:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9347
	btr r12,1
	clc
	jmp LB_9348
LB_9347:
	bts r12,1
	stc
LB_9348:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9345
	btr r12,0
	clc
	jmp LB_9346
LB_9345:
	bts r12,0
	stc
LB_9346:
	add rsp,72
; ∎ {  }
 ; {>  %_9161~6':_r64 %_9154~2':_stg %_9156~4':_stg %_9160~5':_stg %_9162~7':(_opn)◂((_lst)◂(_p1483)) %_9171~8':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 }
; 	∎ {  }
	bt r12,6
	jc LB_9365
	mov rdi,rcx
	call dlt
LB_9365:
	bt r12,2
	jc LB_9366
	mov rdi,r8
	call dlt
LB_9366:
	bt r12,4
	jc LB_9367
	mov rdi,r10
	call dlt
LB_9367:
	bt r12,5
	jc LB_9368
	mov rdi,r11
	call dlt
LB_9368:
	bt r12,7
	jc LB_9369
	mov rdi,rdx
	call dlt
LB_9369:
	bt r12,8
	jc LB_9370
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_9370:
	bt r12,0
	jc LB_9371
	mov rdi,r13
	call dlt
LB_9371:
	bt r12,3
	jc LB_9372
	mov rdi,r9
	call dlt
LB_9372:
	bt r12,1
	jc LB_9373
	mov rdi,r14
	call dlt
LB_9373:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9342:
MTC_LB_9249:
	mov r15,0
LB_9375:
	cmp r15,0
	jz LB_9376
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9375
LB_9376:
; 	» "H1\n" _ ⊢ 6' : %_9172
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_9172 ⊢ %_9173 : %_9173
 ; {>  %_9154~2':_stg %_9156~4':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 %_9157~5':(_opn)◂(_stg) %_9172~6':_stg }
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
	jc LB_9389
	btr r12,0
	jmp LB_9390
LB_9389:
	bts r12,0
LB_9390:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_9391
	btr r12,6
	jmp LB_9392
LB_9391:
	bts r12,6
LB_9392:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9387
	btr r12,5
	clc
	jmp LB_9388
LB_9387:
	bts r12,5
	stc
LB_9388:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9385
	btr r12,4
	clc
	jmp LB_9386
LB_9385:
	bts r12,4
	stc
LB_9386:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9383
	btr r12,3
	clc
	jmp LB_9384
LB_9383:
	bts r12,3
	stc
LB_9384:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9381
	btr r12,2
	clc
	jmp LB_9382
LB_9381:
	bts r12,2
	stc
LB_9382:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9379
	btr r12,1
	clc
	jmp LB_9380
LB_9379:
	bts r12,1
	stc
LB_9380:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9377
	btr r12,0
	clc
	jmp LB_9378
LB_9377:
	bts r12,0
	stc
LB_9378:
	add rsp,56
; ∎ {  }
 ; {>  %_9154~2':_stg %_9156~4':_stg %_9173~6':_stg %_9147~0':_stg %_9150~3':_stg %_9148~1':_r64 %_9157~5':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,2
	jc LB_9393
	mov rdi,r8
	call dlt
LB_9393:
	bt r12,4
	jc LB_9394
	mov rdi,r10
	call dlt
LB_9394:
	bt r12,6
	jc LB_9395
	mov rdi,rcx
	call dlt
LB_9395:
	bt r12,0
	jc LB_9396
	mov rdi,r13
	call dlt
LB_9396:
	bt r12,3
	jc LB_9397
	mov rdi,r9
	call dlt
LB_9397:
	bt r12,1
	jc LB_9398
	mov rdi,r14
	call dlt
LB_9398:
	bt r12,5
	jc LB_9399
	mov rdi,r11
	call dlt
LB_9399:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9374:
MTC_LB_9194:
	mov r15,0
LB_9401:
	cmp r15,0
	jz LB_9402
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9401
LB_9402:
; _f5368 { %_9147 %_9148 } ⊢ { %_9174 %_9175 %_9176 } : { %_9174 %_9175 %_9176 }
 ; {>  %_9147~0':_stg %_9149~2':(_lst)◂(_stg) %_9148~1':_r64 }
; _f5368 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_5368
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_9405
	btr r12,4
	jmp LB_9406
LB_9405:
	bts r12,4
LB_9406:
	mov r9,r10
	bt r12,4
	jc LB_9409
	btr r12,3
	jmp LB_9410
LB_9409:
	bts r12,3
LB_9410:
	mov rsi,1
	bt r12,3
	jc LB_9407
	mov rsi,0
	bt r9,0
	jc LB_9407
	jmp LB_9408
LB_9407:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9408:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9403
	btr r12,2
	clc
	jmp LB_9404
LB_9403:
	bts r12,2
	stc
LB_9404:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_9177
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_9177 ⊢ { %_9178 %_9179 } : { %_9178 %_9179 }
 ; {>  %_9175~1':_r64 %_9177~4':_stg %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9174~0':_stg %_9149~2':(_lst)◂(_stg) }
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
	jc LB_9419
	btr r12,0
	jmp LB_9420
LB_9419:
	bts r12,0
LB_9420:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_9421
	btr r12,4
	jmp LB_9422
LB_9421:
	bts r12,4
LB_9422:
	mov r11,r14
	bt r12,1
	jc LB_9423
	btr r12,5
	jmp LB_9424
LB_9423:
	bts r12,5
LB_9424:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9417
	btr r12,3
	clc
	jmp LB_9418
LB_9417:
	bts r12,3
	stc
LB_9418:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9415
	btr r12,2
	clc
	jmp LB_9416
LB_9415:
	bts r12,2
	stc
LB_9416:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9413
	btr r12,1
	clc
	jmp LB_9414
LB_9413:
	bts r12,1
	stc
LB_9414:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9411
	btr r12,0
	clc
	jmp LB_9412
LB_9411:
	bts r12,0
	stc
LB_9412:
	add rsp,40
; _f38 { %_9178 %_9179 } ⊢ { %_9180 %_9181 } : { %_9180 %_9181 }
 ; {>  %_9178~4':_stg %_9175~1':_r64 %_9179~5':_stg %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9174~0':_stg %_9149~2':(_lst)◂(_stg) }
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
	jc LB_9435
	btr r12,1
	jmp LB_9436
LB_9435:
	bts r12,1
LB_9436:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_9433
	btr QWORD [rdi],0
	jmp LB_9434
LB_9433:
	bts QWORD [rdi],0
LB_9434:
	mov r14,r11
	bt r12,5
	jc LB_9439
	btr r12,1
	jmp LB_9440
LB_9439:
	bts r12,1
LB_9440:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_9437
	btr QWORD [rdi],1
	jmp LB_9438
LB_9437:
	bts QWORD [rdi],1
LB_9438:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_9443
	btr r12,1
	clc
	jmp LB_9444
LB_9443:
	bts r12,1
	stc
LB_9444:
	mov r10,r14
	bt r12,1
	jc LB_9441
	btr r12,4
	jmp LB_9442
LB_9441:
	bts r12,4
LB_9442:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_9447
	btr r12,1
	clc
	jmp LB_9448
LB_9447:
	bts r12,1
	stc
LB_9448:
	mov r11,r14
	bt r12,1
	jc LB_9445
	btr r12,5
	jmp LB_9446
LB_9445:
	bts r12,5
LB_9446:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9431
	btr r12,3
	clc
	jmp LB_9432
LB_9431:
	bts r12,3
	stc
LB_9432:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9429
	btr r12,2
	clc
	jmp LB_9430
LB_9429:
	bts r12,2
	stc
LB_9430:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9427
	btr r12,1
	clc
	jmp LB_9428
LB_9427:
	bts r12,1
	stc
LB_9428:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9425
	btr r12,0
	clc
	jmp LB_9426
LB_9425:
	bts r12,0
	stc
LB_9426:
	add rsp,40
; _f4258 %_9181 ⊢ { %_9182 %_9183 } : { %_9182 %_9183 }
 ; {>  %_9181~5':_stg %_9175~1':_r64 %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9180~4':_stg %_9174~0':_stg %_9149~2':(_lst)◂(_stg) }
; _f4258 5' ⊢ { 5' 6' }
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
	jc LB_9459
	btr r12,0
	jmp LB_9460
LB_9459:
	bts r12,0
LB_9460:
	call NS_E_4258
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_9461
	btr r12,5
	jmp LB_9462
LB_9461:
	bts r12,5
LB_9462:
	mov rcx,r14
	bt r12,1
	jc LB_9463
	btr r12,6
	jmp LB_9464
LB_9463:
	bts r12,6
LB_9464:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9457
	btr r12,4
	clc
	jmp LB_9458
LB_9457:
	bts r12,4
	stc
LB_9458:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9455
	btr r12,3
	clc
	jmp LB_9456
LB_9455:
	bts r12,3
	stc
LB_9456:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9453
	btr r12,2
	clc
	jmp LB_9454
LB_9453:
	bts r12,2
	stc
LB_9454:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9451
	btr r12,1
	clc
	jmp LB_9452
LB_9451:
	bts r12,1
	stc
LB_9452:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9449
	btr r12,0
	clc
	jmp LB_9450
LB_9449:
	bts r12,0
	stc
LB_9450:
	add rsp,48
MTC_LB_9465:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9466
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
	jnc LB_9467
	bt QWORD [rdi],0
	jc LB_9468
	btr r12,8
	clc
	jmp LB_9469
LB_9468:
	bts r12,8
	stc
LB_9469:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9467:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9470
	btr r12,7
	jmp LB_9471
LB_9470:
	bts r12,7
LB_9471:
LB_9472:
	cmp r15,0
	jz LB_9473
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9472
LB_9473:
; » 0xr0 |~ {  } ⊢ %_9185 : %_9185
 ; {>  %_9175~1':_r64 %_9182~5':_stg %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9180~4':_stg %_9184~7':_stg %_9174~0':_stg %_9149~2':(_lst)◂(_stg) }
; 	» 0xr0 _ ⊢ 6' : %_9185
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f5368 { %_9184 %_9185 } ⊢ { %_9186 %_9187 %_9188 } : { %_9186 %_9187 %_9188 }
 ; {>  %_9175~1':_r64 %_9182~5':_stg %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9180~4':_stg %_9184~7':_stg %_9185~6':_r64 %_9174~0':_stg %_9149~2':(_lst)◂(_stg) }
; _f5368 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_9486
	btr r12,0
	jmp LB_9487
LB_9486:
	bts r12,0
LB_9487:
	mov r14,rcx
	bt r12,6
	jc LB_9488
	btr r12,1
	jmp LB_9489
LB_9488:
	bts r12,1
LB_9489:
	call NS_E_5368
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_9490
	btr r12,6
	jmp LB_9491
LB_9490:
	bts r12,6
LB_9491:
	mov rdx,r14
	bt r12,1
	jc LB_9492
	btr r12,7
	jmp LB_9493
LB_9492:
	bts r12,7
LB_9493:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_9496
	btr r12,8
	jmp LB_9497
LB_9496:
	bts r12,8
LB_9497:
	mov rsi,1
	bt r12,8
	jc LB_9494
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_9494
	jmp LB_9495
LB_9494:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_9495:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9484
	btr r12,5
	clc
	jmp LB_9485
LB_9484:
	bts r12,5
	stc
LB_9485:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9482
	btr r12,4
	clc
	jmp LB_9483
LB_9482:
	bts r12,4
	stc
LB_9483:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9480
	btr r12,3
	clc
	jmp LB_9481
LB_9480:
	bts r12,3
	stc
LB_9481:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9478
	btr r12,2
	clc
	jmp LB_9479
LB_9478:
	bts r12,2
	stc
LB_9479:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9476
	btr r12,1
	clc
	jmp LB_9477
LB_9476:
	bts r12,1
	stc
LB_9477:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9474
	btr r12,0
	clc
	jmp LB_9475
LB_9474:
	bts r12,0
	stc
LB_9475:
	add rsp,56
; _f38 { %_9186 %_9187 %_9188 } ⊢ { %_9189 %_9190 %_9191 } : { %_9189 %_9190 %_9191 }
 ; {>  %_9175~1':_r64 %_9182~5':_stg %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9187~7':_r64 %_9180~4':_stg %_9174~0':_stg %_9149~2':(_lst)◂(_stg) %_9188~8':(_opn)◂((_lst)◂(_p1483)) %_9186~6':_stg }
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
	jc LB_9512
	btr r12,1
	jmp LB_9513
LB_9512:
	bts r12,1
LB_9513:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_9510
	btr QWORD [rdi],0
	jmp LB_9511
LB_9510:
	bts QWORD [rdi],0
LB_9511:
	mov r14,rdx
	bt r12,7
	jc LB_9516
	btr r12,1
	jmp LB_9517
LB_9516:
	bts r12,1
LB_9517:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_9514
	btr QWORD [rdi],1
	jmp LB_9515
LB_9514:
	bts QWORD [rdi],1
LB_9515:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_9520
	btr r12,1
	jmp LB_9521
LB_9520:
	bts r12,1
LB_9521:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_9518
	btr QWORD [rdi],2
	jmp LB_9519
LB_9518:
	bts QWORD [rdi],2
LB_9519:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_9524
	btr r12,1
	clc
	jmp LB_9525
LB_9524:
	bts r12,1
	stc
LB_9525:
	mov rcx,r14
	bt r12,1
	jc LB_9522
	btr r12,6
	jmp LB_9523
LB_9522:
	bts r12,6
LB_9523:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_9528
	btr r12,1
	clc
	jmp LB_9529
LB_9528:
	bts r12,1
	stc
LB_9529:
	mov rdx,r14
	bt r12,1
	jc LB_9526
	btr r12,7
	jmp LB_9527
LB_9526:
	bts r12,7
LB_9527:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_9532
	btr r12,1
	clc
	jmp LB_9533
LB_9532:
	bts r12,1
	stc
LB_9533:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_9530
	btr r12,8
	jmp LB_9531
LB_9530:
	bts r12,8
LB_9531:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_9508
	btr r12,5
	clc
	jmp LB_9509
LB_9508:
	bts r12,5
	stc
LB_9509:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9506
	btr r12,4
	clc
	jmp LB_9507
LB_9506:
	bts r12,4
	stc
LB_9507:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9504
	btr r12,3
	clc
	jmp LB_9505
LB_9504:
	bts r12,3
	stc
LB_9505:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9502
	btr r12,2
	clc
	jmp LB_9503
LB_9502:
	bts r12,2
	stc
LB_9503:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9500
	btr r12,1
	clc
	jmp LB_9501
LB_9500:
	bts r12,1
	stc
LB_9501:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9498
	btr r12,0
	clc
	jmp LB_9499
LB_9498:
	bts r12,0
	stc
LB_9499:
	add rsp,56
; ∎ {  }
 ; {>  %_9175~1':_r64 %_9190~7':_r64 %_9189~6':_stg %_9182~5':_stg %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9180~4':_stg %_9191~8':(_opn)◂((_lst)◂(_p1483)) %_9174~0':_stg %_9149~2':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_9534
	mov rdi,r14
	call dlt
LB_9534:
	bt r12,7
	jc LB_9535
	mov rdi,rdx
	call dlt
LB_9535:
	bt r12,6
	jc LB_9536
	mov rdi,rcx
	call dlt
LB_9536:
	bt r12,5
	jc LB_9537
	mov rdi,r11
	call dlt
LB_9537:
	bt r12,3
	jc LB_9538
	mov rdi,r9
	call dlt
LB_9538:
	bt r12,4
	jc LB_9539
	mov rdi,r10
	call dlt
LB_9539:
	bt r12,8
	jc LB_9540
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_9540:
	bt r12,0
	jc LB_9541
	mov rdi,r13
	call dlt
LB_9541:
	bt r12,2
	jc LB_9542
	mov rdi,r8
	call dlt
LB_9542:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9466:
	mov r15,0
LB_9544:
	cmp r15,0
	jz LB_9545
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9544
LB_9545:
; ∎ {  }
 ; {>  %_9175~1':_r64 %_9182~5':_stg %_9176~3':(_opn)◂((_lst)◂(_p1483)) %_9183~6':(_opn)◂(_stg) %_9180~4':_stg %_9174~0':_stg %_9149~2':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_9546
	mov rdi,r14
	call dlt
LB_9546:
	bt r12,5
	jc LB_9547
	mov rdi,r11
	call dlt
LB_9547:
	bt r12,3
	jc LB_9548
	mov rdi,r9
	call dlt
LB_9548:
	bt r12,6
	jc LB_9549
	mov rdi,rcx
	call dlt
LB_9549:
	bt r12,4
	jc LB_9550
	mov rdi,r10
	call dlt
LB_9550:
	bt r12,0
	jc LB_9551
	mov rdi,r13
	call dlt
LB_9551:
	bt r12,2
	jc LB_9552
	mov rdi,r8
	call dlt
LB_9552:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_9543:
MTC_LB_9400:
section .data
	CST_DYN_4320:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_9192:
		dq 0x0000_0001_00_82_ffff
		dq 1
