%include "cmu.s"
main:
	mov r15,0
	mov r14,0
	mov r13,0
	mov r12,0
	not r12
	xor rax,rax
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_78
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
	NS_E_DYN_16:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_16
	NS_E_DYN_18:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_18
	NS_E_DYN_20:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20
	NS_E_DYN_22:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22
	NS_E_DYN_26:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_27:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_34:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_35:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_33:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_33
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41
	NS_E_DYN_51:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_52:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_53:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_43:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43
	NS_E_DYN_62:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_61:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_61
NS_E_75:
; 	|» {  }
	jz NS_E_RDI_75
	jc emt_etr_c_lb_76
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_75
emt_etr_c_lb_76:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_75:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_77
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_77:
;clear 
	mov rax,r8
	stc
	ret
NS_E_78:
; 	|» {  }
	jz NS_E_RDI_78
	jc emt_etr_c_lb_79
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_78
emt_etr_c_lb_79:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_78:
; 	g0 {  } ⊢ -2' : { }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_75
	mov QWORD [tmp],rax
	jc call_c_lb_80
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn -2'
; ; emt_dec 
; boxed
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	jmp call_nc_lb_81
call_c_lb_80:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn -2'
call_nc_lb_81:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_83
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_83:
;clear 
	mov rax,r8
	stc
	ret
NS_E_84:
; 	|» {  }
	jz NS_E_RDI_84
	jc emt_etr_c_lb_85
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_84
emt_etr_c_lb_85:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_84:
; 	T1.f0 {  } ⊢ {  } : {  }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_78
	mov QWORD [tmp],rax
	jc call_c_lb_86
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn {  }
; ; emt_dec 
; boxed
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	jmp call_nc_lb_87
call_c_lb_86:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn {  }
call_nc_lb_87:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_89
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_89:
;clear 
	mov rax,r8
	stc
	ret
NS_E_20:
NS_E_RDI_20:
NS_E_20_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_20_LB_0
	cmp r11,57
	ja NS_E_20_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_20_LB_0:
	mov rax,0
	ret
NS_E_18:
NS_E_RDI_18:
NS_E_18_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_18_LB_0
	cmp r11,90
	ja NS_E_18_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_18_LB_0:
	mov rax,0
	ret
NS_E_16:
NS_E_RDI_16:
NS_E_16_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_16_LB_0
	cmp r11,122
	ja NS_E_16_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_16_LB_0:
	mov rax,0
	ret
NS_E_22:
NS_E_RDI_22:
NS_E_22_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc NS_E_22_LB_0
	add rsi,1
	bt r11,6
	jnc NS_E_22_LB_0
	add rsi,1
	bt r11,5
	jnc NS_E_22_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_22_LB_0:
	mov rax,0
	ret
section .data
NS_E_33:
NS_E_RDI_33:
	mov rdi,r8
	mov rsi,r9
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_33_TBL
NS_E_33_ETR_TBL:
	push QWORD 1
NS_E_33_TBL:
	push rsi
	call NS_E_16_ETR_TBL
	cmp rax,0
	jz NS_E_33_MTC_c_al_0_failed
NS_E_33_MTC_c_al_0_succeed:
	pop r8
	jmp NS_E_33_succeed
NS_E_33_MTC_c_al_0_failed:
	pop rsi
	push rsi
	call NS_E_18_ETR_TBL
	cmp rax,0
	jz NS_E_33_MTC_c_al_1_failed
NS_E_33_MTC_c_al_1_succeed:
	pop r8
	jmp NS_E_33_succeed
NS_E_33_MTC_c_al_1_failed:
	pop rsi
	jmp NS_E_33_failed
NS_E_33_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_33_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_33_succeed_tbl:
	mov rax,1
	ret
NS_E_33_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_33_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_33_failed_tbl:
	mov rax,0
	ret
NS_E_41:
NS_E_RDI_41:
	mov rdi,r8
	mov rsi,r9
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_41_TBL
NS_E_41_ETR_TBL:
	push QWORD 1
NS_E_41_TBL:
	push rsi
	call NS_E_33_ETR_TBL
	cmp rax,0
	jz NS_E_41_MTC_name_0_failed
_grm_lst_49:
	call NS_E_43_ETR_TBL
	cmp rax,0
	jz _grm_lst_50
	jmp _grm_lst_49
_grm_lst_50:
	mov rax,1
NS_E_41_MTC_name_0_succeed:
	pop r8
	jmp NS_E_41_succeed
NS_E_41_MTC_name_0_failed:
	pop rsi
	jmp NS_E_41_failed
NS_E_41_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_41_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_41_succeed_tbl:
	mov rax,1
	ret
NS_E_41_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_41_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_41_failed_tbl:
	mov rax,0
	ret
NS_E_43:
NS_E_RDI_43:
	mov rdi,r8
	mov rsi,r9
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_43_TBL
NS_E_43_ETR_TBL:
	push QWORD 1
NS_E_43_TBL:
	push rsi
	call NS_E_33_ETR_TBL
	cmp rax,0
	jz NS_E_43_MTC_name_tl_0_failed
NS_E_43_MTC_name_tl_0_succeed:
	pop r8
	jmp NS_E_43_succeed
NS_E_43_MTC_name_tl_0_failed:
	pop rsi
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_43_MTC_name_tl_1_failed
	add rsi,1
NS_E_43_MTC_name_tl_1_succeed:
	pop r8
	jmp NS_E_43_succeed
NS_E_43_MTC_name_tl_1_failed:
	pop rsi
	push rsi
	call NS_E_20_ETR_TBL
	cmp rax,0
	jz NS_E_43_MTC_name_tl_2_failed
NS_E_43_MTC_name_tl_2_succeed:
	pop r8
	jmp NS_E_43_succeed
NS_E_43_MTC_name_tl_2_failed:
	pop rsi
	jmp NS_E_43_failed
NS_E_43_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_43_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_43_succeed_tbl:
	mov rax,1
	ret
NS_E_43_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_43_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_43_failed_tbl:
	mov rax,0
	ret
NS_E_61:
NS_E_RDI_61:
	mov rdi,r8
	mov rsi,r9
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,1
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_61_TBL
NS_E_61_ETR_TBL:
	push QWORD 1
NS_E_61_TBL:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_61_MTC_prm_name_0_failed
	add rsi,1
	call NS_E_41_ETR_TBL
	cmp rax,0
	jz NS_E_61_MTC_prm_name_0_failed
NS_E_61_MTC_prm_name_0_succeed:
	pop r8
	jmp NS_E_61_succeed
NS_E_61_MTC_prm_name_0_failed:
	pop rsi
	jmp NS_E_61_failed
NS_E_61_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_61_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_61_succeed_tbl:
	mov rax,1
	ret
NS_E_61_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_61_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_61_failed_tbl:
	mov rax,0
	ret
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	NS_E_DYN_78:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_78
	NS_E_DYN_84:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_84
