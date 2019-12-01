%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call in0_init
	call NS_E_2954
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
NS_E_2944:
NS_E_RDI_2944:
NS_E_2944_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_2945
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_2945:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2946:
NS_E_RDI_2946:
NS_E_2946_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_2946_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_2946_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2947:
NS_E_RDI_2947:
NS_E_2947_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_2947_LB_0
	cmp r11,57
	ja NS_E_2947_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2947_LB_0:
	mov rax,0
	ret
NS_E_2949:
NS_E_RDI_2949:
NS_E_2949_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_2949_LB_0
	cmp r11,122
	ja NS_E_2949_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2949_LB_0:
	mov rax,0
	ret
NS_E_2948:
NS_E_RDI_2948:
NS_E_2948_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_2948_LB_0
	cmp r11,90
	ja NS_E_2948_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2948_LB_0:
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
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call in_fn
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	mov r14,rax
	btr r12,1
	ret
NS_E_2954:
NS_E_RDI_2954:
; 	» "OpADL.mdls" _ ⊢ 0' : %_2950
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f15 %_2950 ⊢ { %_2951 %_2952 } : { %_2951 %_2952 }
 ; {>  %_2950~0':_stg }
; _f15 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_15
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
; pop_iv
	add rsp,8
; _f16 %_2952 ⊢ %_2953 : %_2953
 ; {>  %_2952~1':_stg %_2951~0':_stg }
; _f16 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2957
	btr r12,0
	jmp LB_2958
LB_2957:
	bts r12,0
LB_2958:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2959
	btr r12,1
	jmp LB_2960
LB_2959:
	bts r12,1
LB_2960:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2955
	btr r12,0
	jmp LB_2956
LB_2955:
	bts r12,0
LB_2956:
	add rsp,16
; ∎ {  }
 ; {>  %_2953~1':_stg %_2951~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_2961
	mov rdi,r14
	call dlt
LB_2961:
	bt r12,0
	jc LB_2962
	mov rdi,r13
	call dlt
LB_2962:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_2944:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2944
	NS_E_DYN_2946:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2946
	NS_E_DYN_2947:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2947
	NS_E_DYN_2948:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2948
	NS_E_DYN_2949:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2949
	CST_DYN_2954:
		dq 0x0001_0001_00_82_ffff
		dq 1
