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
	call NS_E_RDI_106
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
	NS_E_DYN_42:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_42
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44
	NS_E_DYN_46:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_46
	NS_E_DYN_48:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48
	NS_E_DYN_52:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_53:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_62:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_63:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_61:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_61
	NS_E_DYN_72:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_69:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_69
	NS_E_DYN_79:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_80:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_81:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_71:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_71
	NS_E_DYN_90:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_89:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_89
NS_E_103:
; 	|» {  }
	jz NS_E_RDI_103
	jc emt_etr_c_lb_104
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
jmp NS_E_RDI_103
emt_etr_c_lb_104:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_103:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_105
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_105:
;clear 
	mov rax,r8
	stc
	ret
NS_E_106:
; 	|» {  }
	jz NS_E_RDI_106
	jc emt_etr_c_lb_107
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
jmp NS_E_RDI_106
emt_etr_c_lb_107:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_106:
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
	call NS_E_103
	mov QWORD [tmp],rax
	jc call_c_lb_108
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
	jmp call_nc_lb_109
call_c_lb_108:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn -2'
call_nc_lb_109:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_111
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_111:
;clear 
	mov rax,r8
	stc
	ret
NS_E_112:
; 	|» {  }
	jz NS_E_RDI_112
	jc emt_etr_c_lb_113
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
jmp NS_E_RDI_112
emt_etr_c_lb_113:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_112:
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
	call NS_E_106
	mov QWORD [tmp],rax
	jc call_c_lb_114
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
	jmp call_nc_lb_115
call_c_lb_114:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn {  }
call_nc_lb_115:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_117
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_117:
;clear 
	mov rax,r8
	stc
	ret
NS_E_118:
; 	|» {  }
	jz NS_E_RDI_118
	jc emt_etr_c_lb_119
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
jmp NS_E_RDI_118
emt_etr_c_lb_119:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_118:
; 	» prm.name.prs _ ⊢ 0' : { _p10 _p4 }→{ _p10 _p4 _p68 }
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [NS_E_DYN_69],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,NS_E_DYN_69
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p : ,{ _p10 _p4 }→{ _p10 _p4 _p68 }
; emt_ptn_crt_ptn 0',p
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_120
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_121
emt_set_ptn_0_lb_120:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_121:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_122
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_122:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_124
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_125
emt_get_crt_ptn_0_lb_124:
; unboxed
	stc
emt_get_crt_ptn_1_lb_125:
	mov QWORD r8,r9
	jc ret_lb_126
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_123
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_123:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_126:
;clear 
	mov rax,r8
	stc
	ret
section .data
NS_E_42:
NS_E_RDI_42:
NS_E_42_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_42_LB_0
	cmp r11,122
	ja NS_E_42_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_42_LB_0:
	mov rax,0
	ret
NS_E_44:
NS_E_RDI_44:
NS_E_44_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_44_LB_0
	cmp r11,90
	ja NS_E_44_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_44_LB_0:
	mov rax,0
	ret
NS_E_46:
NS_E_RDI_46:
NS_E_46_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_46_LB_0
	cmp r11,57
	ja NS_E_46_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_46_LB_0:
	mov rax,0
	ret
NS_E_48:
NS_E_RDI_48:
NS_E_48_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc NS_E_48_LB_0
	add rsi,1
	bt r11,6
	jnc NS_E_48_LB_0
	add rsi,1
	bt r11,5
	jnc NS_E_48_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_48_LB_0:
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
	imul rcx,2
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
	call NS_E_42_ETR_TBL
	cmp rax,0
	jz NS_E_61_MTC_c_al_0_failed
NS_E_61_MTC_c_al_0_succeed:
	pop r8
	jmp NS_E_61_succeed
NS_E_61_MTC_c_al_0_failed:
	pop rsi
	push rsi
	call NS_E_44_ETR_TBL
	cmp rax,0
	jz NS_E_61_MTC_c_al_1_failed
NS_E_61_MTC_c_al_1_succeed:
	pop r8
	jmp NS_E_61_succeed
NS_E_61_MTC_c_al_1_failed:
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
NS_E_69:
NS_E_RDI_69:
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
	jmp NS_E_69_TBL
NS_E_69_ETR_TBL:
	push QWORD 1
NS_E_69_TBL:
	push rsi
	call NS_E_61_ETR_TBL
	cmp rax,0
	jz NS_E_69_MTC_name_0_failed
_grm_lst_77:
	call NS_E_71_ETR_TBL
	cmp rax,0
	jz _grm_lst_78
	jmp _grm_lst_77
_grm_lst_78:
	mov rax,1
NS_E_69_MTC_name_0_succeed:
	pop r8
	jmp NS_E_69_succeed
NS_E_69_MTC_name_0_failed:
	pop rsi
	jmp NS_E_69_failed
NS_E_69_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_69_succeed_tbl
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
NS_E_69_succeed_tbl:
	mov rax,1
	ret
NS_E_69_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_69_failed_tbl
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
NS_E_69_failed_tbl:
	mov rax,0
	ret
NS_E_71:
NS_E_RDI_71:
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
	jmp NS_E_71_TBL
NS_E_71_ETR_TBL:
	push QWORD 1
NS_E_71_TBL:
	push rsi
	call NS_E_61_ETR_TBL
	cmp rax,0
	jz NS_E_71_MTC_name_tl_0_failed
NS_E_71_MTC_name_tl_0_succeed:
	pop r8
	jmp NS_E_71_succeed
NS_E_71_MTC_name_tl_0_failed:
	pop rsi
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_71_MTC_name_tl_1_failed
	add rsi,1
NS_E_71_MTC_name_tl_1_succeed:
	pop r8
	jmp NS_E_71_succeed
NS_E_71_MTC_name_tl_1_failed:
	pop rsi
	push rsi
	call NS_E_46_ETR_TBL
	cmp rax,0
	jz NS_E_71_MTC_name_tl_2_failed
NS_E_71_MTC_name_tl_2_succeed:
	pop r8
	jmp NS_E_71_succeed
NS_E_71_MTC_name_tl_2_failed:
	pop rsi
	jmp NS_E_71_failed
NS_E_71_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_71_succeed_tbl
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
NS_E_71_succeed_tbl:
	mov rax,1
	ret
NS_E_71_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_71_failed_tbl
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
NS_E_71_failed_tbl:
	mov rax,0
	ret
NS_E_89:
NS_E_RDI_89:
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
	jmp NS_E_89_TBL
NS_E_89_ETR_TBL:
	push QWORD 1
NS_E_89_TBL:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_89_MTC_prm_name_0_failed
	add rsi,1
	call NS_E_69_ETR_TBL
	cmp rax,0
	jz NS_E_89_MTC_prm_name_0_failed
NS_E_89_MTC_prm_name_0_succeed:
	pop r8
	jmp NS_E_89_succeed
NS_E_89_MTC_prm_name_0_failed:
	pop rsi
	jmp NS_E_89_failed
NS_E_89_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_89_succeed_tbl
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
NS_E_89_succeed_tbl:
	mov rax,1
	ret
NS_E_89_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_89_failed_tbl
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
NS_E_89_failed_tbl:
	mov rax,0
	ret
	NS_E_DYN_103:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_103
	NS_E_DYN_106:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_106
	NS_E_DYN_112:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_112
	NS_E_DYN_118:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_118
