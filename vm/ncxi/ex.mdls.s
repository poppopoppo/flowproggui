%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_847
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
NS_E_775:
NS_E_RDI_775:
NS_E_775_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_776
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_776:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_778:
NS_E_RDI_778:
NS_E_778_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_778_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_778_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_779:
NS_E_RDI_779:
NS_E_779_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_779_LB_0
	cmp r11,57
	ja NS_E_779_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_779_LB_0:
	mov rax,0
	ret
NS_E_781:
NS_E_RDI_781:
NS_E_781_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_781_LB_0
	cmp r11,122
	ja NS_E_781_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_781_LB_0:
	mov rax,0
	ret
NS_E_780:
NS_E_RDI_780:
NS_E_780_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_780_LB_0
	cmp r11,90
	ja NS_E_780_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_780_LB_0:
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
NS_E_777:
NS_E_RDI_777:
NS_E_777_ETR_TBL:
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
	jz NS_E_777_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_777_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_795:
; 	|» { 0' 1' }
NS_E_RDI_795:
MTC_LB_796:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_797
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_798
	bt QWORD [rax],0
	jc LB_799
	btr r12,1
	jmp LB_800
LB_799:
	bts r12,1
LB_800:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_798:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_803
	btr r12,4
	jmp LB_804
LB_803:
	bts r12,4
LB_804:
	mov r8,r10
	bt r12,4
	jc LB_801
	btr r12,2
	jmp LB_802
LB_801:
	bts r12,2
LB_802:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_807
	btr r12,4
	jmp LB_808
LB_807:
	bts r12,4
LB_808:
	mov r9,r10
	bt r12,4
	jc LB_805
	btr r12,3
	jmp LB_806
LB_805:
	bts r12,3
LB_806:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_809:
	cmp r15,0
	jz LB_810
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_809
LB_810:
; _f38 %_782 ⊢ %_786 : %_786
 ; {>  %_785~3':(_lst)◂(_r64) %_782~0':_r64 %_784~2':_r64 }
	add r13,1
; _f795 { %_786 %_785 } ⊢ { %_787 %_788 } : { %_787 %_788 }
 ; {>  %_786~0':_r64 %_785~3':(_lst)◂(_r64) %_784~2':_r64 }
; _f795 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_813
	btr r12,1
	jmp LB_814
LB_813:
	bts r12,1
LB_814:
	call NS_E_795
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_811
	btr r12,2
	jmp LB_812
LB_811:
	bts r12,2
LB_812:
	add rsp,16
; _f37 %_787 ⊢ %_789 : %_789
 ; {>  %_784~2':_r64 %_787~0':_r64 %_788~1':_stg }
	sub r13,1
; _f16 { %_788 %_789 %_784 } ⊢ { %_790 %_791 %_792 } : { %_790 %_791 %_792 }
 ; {>  %_789~0':_r64 %_784~2':_r64 %_788~1':_stg }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_815
	btr r12,3
	jmp LB_816
LB_815:
	bts r12,3
LB_816:
	mov r14,r13
	bt r12,0
	jc LB_817
	btr r12,1
	jmp LB_818
LB_817:
	bts r12,1
LB_818:
	mov r13,r9
	bt r12,3
	jc LB_819
	btr r12,0
	jmp LB_820
LB_819:
	bts r12,0
LB_820:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_791 %_790 }
 ; {>  %_792~2':_r64 %_791~1':_r64 %_790~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_821
	mov rdi,r8
	call dlt
LB_821:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_822
	btr r12,2
	jmp LB_823
LB_822:
	bts r12,2
LB_823:
	mov r14,r13
	bt r12,0
	jc LB_824
	btr r12,1
	jmp LB_825
LB_824:
	bts r12,1
LB_825:
	mov r13,r8
	bt r12,2
	jc LB_826
	btr r12,0
	jmp LB_827
LB_826:
	bts r12,0
LB_827:
	ret
MTC_LB_797:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_828
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_829
	bt QWORD [rax],0
	jc LB_830
	btr r12,1
	jmp LB_831
LB_830:
	bts r12,1
LB_831:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_829:
	push r14
	mov r14,rax
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_832:
	cmp r15,0
	jz LB_833
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_832
LB_833:
; _f14 %_782 ⊢ { %_793 %_794 } : { %_793 %_794 }
 ; {>  %_782~0':_r64 }
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
; ∎ { %_793 %_794 }
 ; {>  %_793~0':_r64 %_794~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_828:
NS_E_847:
NS_E_RDI_847:
; » 0xr41 |~ {  } ⊢ %_834 : %_834
 ; {>  }
; 	» 0xr41 _ ⊢ 0' : %_834
	mov rdi,0x41
	mov r13,rdi
	bts r12,0
; » 0xr42 |~ {  } ⊢ %_835 : %_835
 ; {>  %_834~0':_r64 }
; 	» 0xr42 _ ⊢ 1' : %_835
	mov rdi,0x42
	mov r14,rdi
	bts r12,1
; » 0xr43 |~ {  } ⊢ %_836 : %_836
 ; {>  %_834~0':_r64 %_835~1':_r64 }
; 	» 0xr43 _ ⊢ 2' : %_836
	mov rdi,0x43
	mov r8,rdi
	bts r12,2
; » 0xr44 |~ {  } ⊢ %_837 : %_837
 ; {>  %_834~0':_r64 %_836~2':_r64 %_835~1':_r64 }
; 	» 0xr44 _ ⊢ 3' : %_837
	mov rdi,0x44
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_838 : %_838
 ; {>  %_834~0':_r64 %_836~2':_r64 %_837~3':_r64 %_835~1':_r64 }
; 	» 0xr0 _ ⊢ 4' : %_838
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _nil {  } ⊢ %_839 : %_839
 ; {>  %_834~0':_r64 %_838~4':_r64 %_836~2':_r64 %_837~3':_r64 %_835~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_834 %_839 } ⊢ %_840 : %_840
 ; {>  %_839~°1◂{  }:(_lst)◂(t493'(0)) %_834~0':_r64 %_838~4':_r64 %_836~2':_r64 %_837~3':_r64 %_835~1':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _cns { %_835 %_840 } ⊢ %_841 : %_841
 ; {>  %_838~4':_r64 %_836~2':_r64 %_837~3':_r64 %_840~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) %_835~1':_r64 }
; _cns { 1' °0◂{ 0' °1◂{  } } } ⊢ °0◂{ 1' °0◂{ 0' °1◂{  } } }
; _cns { %_836 %_841 } ⊢ %_842 : %_842
 ; {>  %_838~4':_r64 %_836~2':_r64 %_841~°0◂{ 1' °0◂{ 0' °1◂{  } } }:(_lst)◂(_r64) %_837~3':_r64 }
; _cns { 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } ⊢ °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }
; _cns { %_837 %_842 } ⊢ %_843 : %_843
 ; {>  %_838~4':_r64 %_842~°0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }:(_lst)◂(_r64) %_837~3':_r64 }
; _cns { 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } ⊢ °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }
; _f795 { %_838 %_843 } ⊢ { %_844 %_845 } : { %_844 %_845 }
 ; {>  %_843~°0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }:(_lst)◂(_r64) %_838~4':_r64 }
; _f795 { 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
	mov r11,r14
	bt r12,1
	jc LB_848
	btr r12,5
	jmp LB_849
LB_848:
	bts r12,5
LB_849:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rcx,r9
	bt r12,3
	jc LB_854
	btr r12,6
	jmp LB_855
LB_854:
	bts r12,6
LB_855:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_852
	btr QWORD [rdi],0
	jmp LB_853
LB_852:
	bts QWORD [rdi],0
LB_853:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r9,r8
	bt r12,2
	jc LB_862
	btr r12,3
	jmp LB_863
LB_862:
	bts r12,3
LB_863:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_860
	btr QWORD [rdi],0
	jmp LB_861
LB_860:
	bts QWORD [rdi],0
LB_861:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r11
	bt r12,5
	jc LB_870
	btr r12,2
	jmp LB_871
LB_870:
	bts r12,2
LB_871:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_868
	btr QWORD [rdi],0
	jmp LB_869
LB_868:
	bts QWORD [rdi],0
LB_869:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r13
	bt r12,0
	jc LB_878
	btr r12,5
	jmp LB_879
LB_878:
	bts r12,5
LB_879:
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_876
	btr QWORD [rdi],0
	jmp LB_877
LB_876:
	bts QWORD [rdi],0
LB_877:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rsi,1
	bt r12,5
	jc LB_882
	mov rsi,0
	bt r11,0
	jc LB_882
	jmp LB_883
LB_882:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r11
	mov r11,rax
	btr r12,5
LB_883:
	mov rax,0x0100_0000_0000_0001
	or r11,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_880
	btr QWORD [rdi],1
	jmp LB_881
LB_880:
	bts QWORD [rdi],1
LB_881:
	mov rsi,1
	bt r12,2
	jc LB_874
	mov rsi,0
	bt r8,0
	jc LB_874
	jmp LB_875
LB_874:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_875:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_872
	btr QWORD [rdi],1
	jmp LB_873
LB_872:
	bts QWORD [rdi],1
LB_873:
	mov rsi,1
	bt r12,3
	jc LB_866
	mov rsi,0
	bt r9,0
	jc LB_866
	jmp LB_867
LB_866:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_867:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_864
	btr QWORD [rdi],1
	jmp LB_865
LB_864:
	bts QWORD [rdi],1
LB_865:
	mov rsi,1
	bt r12,6
	jc LB_858
	mov rsi,0
	bt rcx,0
	jc LB_858
	jmp LB_859
LB_858:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rcx
	mov rcx,rax
	btr r12,6
LB_859:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_856
	btr QWORD [rdi],1
	jmp LB_857
LB_856:
	bts QWORD [rdi],1
LB_857:
	mov rsi,1
	bt r12,1
	jc LB_850
	mov rsi,0
	bt r14,0
	jc LB_850
	jmp LB_851
LB_850:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_851:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r10
	bt r12,4
	jc LB_884
	btr r12,0
	jmp LB_885
LB_884:
	bts r12,0
LB_885:
	call NS_E_795
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 %_845 ⊢ %_846 : %_846
 ; {>  %_844~0':_r64 %_845~1':_stg }
; _f20 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_888
	btr r12,0
	jmp LB_889
LB_888:
	bts r12,0
LB_889:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_890
	btr r12,1
	jmp LB_891
LB_890:
	bts r12,1
LB_891:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_886
	btr r12,0
	jmp LB_887
LB_886:
	bts r12,0
LB_887:
	add rsp,16
; ∎ {  }
 ; {>  %_846~1':_stg %_844~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_892
	mov rdi,r14
	call dlt
LB_892:
	bt r12,0
	jc LB_893
	mov rdi,r13
	call dlt
LB_893:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_775:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_775
	NS_E_DYN_778:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_778
	NS_E_DYN_779:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_779
	NS_E_DYN_780:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_780
	NS_E_DYN_781:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_781
	NS_E_DYN_795:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_795
	CST_DYN_847:
		dq 0x0000_0001_00_82_ffff
		dq 1
