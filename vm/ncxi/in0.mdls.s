%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_2966
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
	push r14
	push r15
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
	call pp_v
	push rax
	mov rdi,rax
	mov rax,0
	add rdi,8
	mov rsi,rdi
	mov rdi,fmt_emt_q
	call printf
	pop rdi
	mov rax,0
	call free
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	ret
NS_E_2951:
NS_E_RDI_2951:
NS_E_2951_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_2952
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_2952:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2954:
NS_E_RDI_2954:
NS_E_2954_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_2954_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_2954_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2955:
NS_E_RDI_2955:
NS_E_2955_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_2955_LB_0
	cmp r11,57
	ja NS_E_2955_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2955_LB_0:
	mov rax,0
	ret
NS_E_2957:
NS_E_RDI_2957:
NS_E_2957_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_2957_LB_0
	cmp r11,122
	ja NS_E_2957_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2957_LB_0:
	mov rax,0
	ret
NS_E_2956:
NS_E_RDI_2956:
NS_E_2956_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_2956_LB_0
	cmp r11,90
	ja NS_E_2956_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2956_LB_0:
	mov rax,0
	ret
NS_E_19:
NS_E_RDI_19:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_23:
	mov rdi,r8
	bt r12,0
NS_E_RDI_23:
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
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_2953:
NS_E_RDI_2953:
NS_E_2953_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
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
	pop r15
	pop r14
	cmp rsi,r14
	jz NS_E_2953_LB_0
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_2953_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2966:
NS_E_RDI_2966:
; 	» "90" _ ⊢ 0' : %_2958
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_39
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_2959 : %_2959
 ; {>  %_2958~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_2959
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f2953 { %_2958 %_2959 } ⊢ { %_2960 %_2961 %_2962 } : { %_2960 %_2961 %_2962 }
 ; {>  %_2959~1':_r64 %_2958~0':_stg }
; _f2953 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_2953
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_2967
	btr r12,4
	jmp LB_2968
LB_2967:
	bts r12,4
LB_2968:
	mov r15,r8
	bt r12,3
	jc LB_2971
	btr r12,2
	jmp LB_2972
LB_2971:
	bts r12,2
LB_2972:
	mov rsi,0
	bt r12,2
	jc LB_2969
	bts rsi,17
	bt r15,0
	jc LB_2969
	jmp LB_2970
LB_2969:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_2970:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,9
; _f16 { %_2960 %_2961 %_2962 } ⊢ { %_2963 %_2964 %_2965 } : { %_2963 %_2964 %_2965 }
 ; {>  %_2961~1':_r64 %_2962~2':(_opn)◂(_r64) %_2960~0':_stg }
; _f16 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_2973
	btr r12,3
	jmp LB_2974
LB_2973:
	bts r12,3
LB_2974:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,3
	jc LB_2977
	btr r12,4
	jmp LB_2978
LB_2977:
	bts r12,4
LB_2978:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_2975
	btr QWORD [rdi],0
	jmp LB_2976
LB_2975:
	bts QWORD [rdi],0
LB_2976:
	mov r9,r14
	bt r12,1
	jc LB_2981
	btr r12,4
	jmp LB_2982
LB_2981:
	bts r12,4
LB_2982:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_2979
	btr QWORD [rdi],1
	jmp LB_2980
LB_2979:
	bts QWORD [rdi],1
LB_2980:
	mov r9,r15
	bt r12,2
	jc LB_2985
	btr r12,4
	jmp LB_2986
LB_2985:
	bts r12,4
LB_2986:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_2983
	btr QWORD [rdi],2
	jmp LB_2984
LB_2983:
	bts QWORD [rdi],2
LB_2984:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 2' }
	mov r8,r13
	bt r12,0
	jc LB_2987
	btr r12,3
	jmp LB_2988
LB_2987:
	bts r12,3
LB_2988:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_2991
	btr r12,4
	jmp LB_2992
LB_2991:
	bts r12,4
LB_2992:
	mov r13,r9
	bt r12,4
	jc LB_2989
	btr r12,0
	jmp LB_2990
LB_2989:
	bts r12,0
LB_2990:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_2995
	btr r12,4
	jmp LB_2996
LB_2995:
	bts r12,4
LB_2996:
	mov r14,r9
	bt r12,4
	jc LB_2993
	btr r12,1
	jmp LB_2994
LB_2993:
	bts r12,1
LB_2994:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_2999
	btr r12,4
	jmp LB_3000
LB_2999:
	bts r12,4
LB_3000:
	mov r15,r9
	bt r12,4
	jc LB_2997
	btr r12,2
	jmp LB_2998
LB_2997:
	bts r12,2
LB_2998:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,9
; ∎ {  }
 ; {>  %_2963~0':_stg %_2964~1':_r64 %_2965~2':(_opn)◂(_r64) }
; 	∎ {  }
	bt r12,0
	jc LB_3001
	mov rdi,r13
	call dlt
LB_3001:
	bt r12,1
	jc LB_3002
	mov rdi,r14
	call dlt
LB_3002:
	bt r12,2
	jc LB_3003
	mov rdi,r15
	call dlt
LB_3003:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_2951:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2951
	NS_E_DYN_2954:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2954
	NS_E_DYN_2955:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2955
	NS_E_DYN_2956:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2956
	NS_E_DYN_2957:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2957
	CST_DYN_2966:
		dq 0x0001_0001_00_82_ffff
		dq 1
