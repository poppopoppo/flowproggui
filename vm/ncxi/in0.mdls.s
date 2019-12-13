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
	call NS_E_853
	call NS_E_991
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
NS_E_838:
NS_E_RDI_838:
NS_E_838_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_839
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_839:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_841:
NS_E_RDI_841:
NS_E_841_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_841_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_841_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_842:
NS_E_RDI_842:
NS_E_842_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_842_LB_0
	cmp r11,57
	ja NS_E_842_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_842_LB_0:
	mov rax,0
	ret
NS_E_844:
NS_E_RDI_844:
NS_E_844_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_844_LB_0
	cmp r11,122
	ja NS_E_844_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_844_LB_0:
	mov rax,0
	ret
NS_E_843:
NS_E_RDI_843:
NS_E_843_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_843_LB_0
	cmp r11,90
	ja NS_E_843_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_843_LB_0:
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
NS_E_840:
NS_E_RDI_840:
NS_E_840_ETR_TBL:
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
	jz NS_E_840_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_840_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_853:
NS_E_RDI_853:
; 	» "-27686gg" _ ⊢ 0' : %_845
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » _f14 |~ {  } ⊢ %_846 : %_846
 ; {>  %_845~0':_stg }
; 	» _args _ ⊢ 1' : %_846
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
; » _f14 |~ {  } ⊢ %_847 : %_847
 ; {>  %_846~1':(_lst)◂(_stg) %_845~0':_stg }
; 	» _args _ ⊢ 2' : %_847
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
; » _f14 |~ {  } ⊢ %_848 : %_848
 ; {>  %_846~1':(_lst)◂(_stg) %_845~0':_stg %_847~2':(_lst)◂(_stg) }
; 	» _args _ ⊢ 3' : %_848
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
; _f24 { %_846 %_847 %_848 } ⊢ { %_849 %_850 %_851 } : { %_849 %_850 %_851 }
 ; {>  %_846~1':(_lst)◂(_stg) %_848~3':(_lst)◂(_stg) %_845~0':_stg %_847~2':(_lst)◂(_stg) }
; _f24 { 1' 2' 3' } ⊢ { 1' 2' 3' }
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
	jc LB_858
	btr r12,4
	jmp LB_859
LB_858:
	bts r12,4
LB_859:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_856
	btr QWORD [rdi],0
	jmp LB_857
LB_856:
	bts QWORD [rdi],0
LB_857:
	mov r10,r8
	bt r12,2
	jc LB_862
	btr r12,4
	jmp LB_863
LB_862:
	bts r12,4
LB_863:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_860
	btr QWORD [rdi],1
	jmp LB_861
LB_860:
	bts QWORD [rdi],1
LB_861:
	mov r10,r9
	bt r12,3
	jc LB_866
	btr r12,4
	jmp LB_867
LB_866:
	bts r12,4
LB_867:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_864
	btr QWORD [rdi],2
	jmp LB_865
LB_864:
	bts QWORD [rdi],2
LB_865:
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' 3' }
; 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_870
	btr r12,4
	jmp LB_871
LB_870:
	bts r12,4
LB_871:
	mov r14,r10
	bt r12,4
	jc LB_868
	btr r12,1
	jmp LB_869
LB_868:
	bts r12,1
LB_869:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_874
	btr r12,4
	jmp LB_875
LB_874:
	bts r12,4
LB_875:
	mov r8,r10
	bt r12,4
	jc LB_872
	btr r12,2
	jmp LB_873
LB_872:
	bts r12,2
LB_873:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_878
	btr r12,4
	jmp LB_879
LB_878:
	bts r12,4
LB_879:
	mov r9,r10
	bt r12,4
	jc LB_876
	btr r12,3
	jmp LB_877
LB_876:
	bts r12,3
LB_877:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_854
	btr r12,0
	jmp LB_855
LB_854:
	bts r12,0
LB_855:
	add rsp,16
; _f24 %_845 ⊢ %_852 : %_852
 ; {>  %_850~2':(_lst)◂(_stg) %_845~0':_stg %_849~1':(_lst)◂(_stg) %_851~3':(_lst)◂(_stg) }
; _f24 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_884
	btr r12,3
	jmp LB_885
LB_884:
	bts r12,3
LB_885:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_882
	btr r12,2
	jmp LB_883
LB_882:
	bts r12,2
LB_883:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_880
	btr r12,1
	jmp LB_881
LB_880:
	bts r12,1
LB_881:
	add rsp,32
; ∎ {  }
 ; {>  %_850~2':(_lst)◂(_stg) %_852~0':_stg %_849~1':(_lst)◂(_stg) %_851~3':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,2
	jc LB_886
	mov rdi,r8
	call dlt
LB_886:
	bt r12,0
	jc LB_887
	mov rdi,r13
	call dlt
LB_887:
	bt r12,1
	jc LB_888
	mov rdi,r14
	call dlt
LB_888:
	bt r12,3
	jc LB_889
	mov rdi,r9
	call dlt
LB_889:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_897:
; 	|» 0'
NS_E_RDI_897:
MTC_LB_898:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_899
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
	jnc LB_900
	bt QWORD [rax],0
	jc LB_901
	btr r12,3
	jmp LB_902
LB_901:
	bts r12,3
LB_902:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_900:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_905
	btr r12,4
	jmp LB_906
LB_905:
	bts r12,4
LB_906:
	mov r14,r10
	bt r12,4
	jc LB_903
	btr r12,1
	jmp LB_904
LB_903:
	bts r12,1
LB_904:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_909
	btr r12,4
	jmp LB_910
LB_909:
	bts r12,4
LB_910:
	mov r8,r10
	bt r12,4
	jc LB_907
	btr r12,2
	jmp LB_908
LB_907:
	bts r12,2
LB_908:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_899
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
	jnc LB_911
	bt QWORD [rax],0
	jc LB_912
	btr r12,5
	jmp LB_913
LB_912:
	bts r12,5
LB_913:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_911:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_916
	btr r12,6
	jmp LB_917
LB_916:
	bts r12,6
LB_917:
	mov r9,rcx
	bt r12,6
	jc LB_914
	btr r12,3
	jmp LB_915
LB_914:
	bts r12,3
LB_915:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_920
	btr r12,6
	jmp LB_921
LB_920:
	bts r12,6
LB_921:
	mov r10,rcx
	bt r12,6
	jc LB_918
	btr r12,4
	jmp LB_919
LB_918:
	bts r12,4
LB_919:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_922:
	cmp r15,0
	jz LB_923
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_922
LB_923:
; ∎ {  }
 ; {>  %_893~3':t312'(-1) %_894~4':(_lst)◂(t312'(-1)) %_891~1':t312'(-1) }
; 	∎ {  }
	bt r12,3
	jc LB_924
	mov rdi,r9
	call dlt
LB_924:
	bt r12,4
	jc LB_925
	mov rdi,r10
	call dlt
LB_925:
	bt r12,1
	jc LB_926
	mov rdi,r14
	call dlt
LB_926:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_899:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_927
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
	jnc LB_928
	bt QWORD [rax],0
	jc LB_929
	btr r12,3
	jmp LB_930
LB_929:
	bts r12,3
LB_930:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_928:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_933
	btr r12,4
	jmp LB_934
LB_933:
	bts r12,4
LB_934:
	mov r14,r10
	bt r12,4
	jc LB_931
	btr r12,1
	jmp LB_932
LB_931:
	bts r12,1
LB_932:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_937
	btr r12,4
	jmp LB_938
LB_937:
	bts r12,4
LB_938:
	mov r8,r10
	bt r12,4
	jc LB_935
	btr r12,2
	jmp LB_936
LB_935:
	bts r12,2
LB_936:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_927
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
	jnc LB_939
	bt QWORD [rax],0
	jc LB_940
	btr r12,3
	jmp LB_941
LB_940:
	bts r12,3
LB_941:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_939:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_942:
	cmp r15,0
	jz LB_943
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_942
LB_943:
; ∎ {  }
 ; {>  %_895~1':t312'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_944
	mov rdi,r14
	call dlt
LB_944:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_927:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_945
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
	jnc LB_946
	bt QWORD [rax],0
	jc LB_947
	btr r12,1
	jmp LB_948
LB_947:
	bts r12,1
LB_948:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_946:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_949:
	cmp r15,0
	jz LB_950
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_949
LB_950:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_945:
NS_E_952:
NS_E_RDI_952:
NS_E_952_ETR_TBL:
NS_E_952_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_981
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_981
	jmp LB_982
LB_981:
	jmp LB_955
LB_982:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; g0
	push r10
	call NS_E_952_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_973
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_974
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_974:
	jmp LB_956
LB_973:
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
	jc LB_967
	btr QWORD [rdi],1
LB_967:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_968
	btr QWORD [rdi],0
LB_968:
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
LB_956:
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
LB_955:
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
	jg LB_965
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_965
	jmp LB_966
LB_965:
	jmp LB_957
LB_966:
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
	jc LB_958
	btr QWORD [rdi],0
LB_958:
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
LB_957:
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
NS_E_991:
NS_E_RDI_991:
; 	» "AC" _ ⊢ 0' : %_983
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_43_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_984 : %_984
 ; {>  %_983~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_984
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f952 { %_983 %_984 } ⊢ { %_985 %_986 %_987 } : { %_985 %_986 %_987 }
 ; {>  %_983~0':_stg %_984~1':_r64 }
; _f952 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_952
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_992
	btr r12,4
	jmp LB_993
LB_992:
	bts r12,4
LB_993:
	mov r8,r9
	bt r12,3
	jc LB_996
	btr r12,2
	jmp LB_997
LB_996:
	bts r12,2
LB_997:
	mov rsi,1
	bt r12,2
	jc LB_994
	mov rsi,0
	bt r8,0
	jc LB_994
	jmp LB_995
LB_994:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_995:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f24 { %_985 %_986 %_987 } ⊢ { %_988 %_989 %_990 } : { %_988 %_989 %_990 }
 ; {>  %_987~2':(_opn)◂(_p951) %_985~0':_stg %_986~1':_r64 }
; _f24 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_998
	btr r12,3
	jmp LB_999
LB_998:
	bts r12,3
LB_999:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_1002
	btr r12,4
	jmp LB_1003
LB_1002:
	bts r12,4
LB_1003:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_1000
	btr QWORD [rdi],0
	jmp LB_1001
LB_1000:
	bts QWORD [rdi],0
LB_1001:
	mov r10,r14
	bt r12,1
	jc LB_1006
	btr r12,4
	jmp LB_1007
LB_1006:
	bts r12,4
LB_1007:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_1004
	btr QWORD [rdi],1
	jmp LB_1005
LB_1004:
	bts QWORD [rdi],1
LB_1005:
	mov r10,r8
	bt r12,2
	jc LB_1010
	btr r12,4
	jmp LB_1011
LB_1010:
	bts r12,4
LB_1011:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_1008
	btr QWORD [rdi],2
	jmp LB_1009
LB_1008:
	bts QWORD [rdi],2
LB_1009:
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_1012
	btr r12,3
	jmp LB_1013
LB_1012:
	bts r12,3
LB_1013:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1016
	btr r12,4
	jmp LB_1017
LB_1016:
	bts r12,4
LB_1017:
	mov r13,r10
	bt r12,4
	jc LB_1014
	btr r12,0
	jmp LB_1015
LB_1014:
	bts r12,0
LB_1015:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1020
	btr r12,4
	jmp LB_1021
LB_1020:
	bts r12,4
LB_1021:
	mov r14,r10
	bt r12,4
	jc LB_1018
	btr r12,1
	jmp LB_1019
LB_1018:
	bts r12,1
LB_1019:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_1024
	btr r12,4
	jmp LB_1025
LB_1024:
	bts r12,4
LB_1025:
	mov r8,r10
	bt r12,4
	jc LB_1022
	btr r12,2
	jmp LB_1023
LB_1022:
	bts r12,2
LB_1023:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_990~2':(_opn)◂(_p951) %_988~0':_stg %_989~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1026
	mov rdi,r8
	call dlt
LB_1026:
	bt r12,0
	jc LB_1027
	mov rdi,r13
	call dlt
LB_1027:
	bt r12,1
	jc LB_1028
	mov rdi,r14
	call dlt
LB_1028:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_838:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_838
	NS_E_DYN_841:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_841
	NS_E_DYN_842:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_842
	NS_E_DYN_843:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_843
	NS_E_DYN_844:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_844
	CST_DYN_853:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_897:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_897
	CST_DYN_991:
		dq 0x0000_0001_00_82_ffff
		dq 1
