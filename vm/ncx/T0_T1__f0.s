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
	call NS_E_RDI_107
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
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
NS_E_104:
; 	|» {  }
	jz NS_E_RDI_104
	jc emt_etr_c_lb_105
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
jmp NS_E_RDI_104
emt_etr_c_lb_105:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_104:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_106
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_106:
;clear 
	mov rax,r8
	stc
	ret
NS_E_107:
; 	|» {  }
	jz NS_E_RDI_107
	jc emt_etr_c_lb_108
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
jmp NS_E_RDI_107
emt_etr_c_lb_108:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_107:
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
	call NS_E_104
	mov QWORD [tmp],rax
	jc call_c_lb_109
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
	jmp call_nc_lb_110
call_c_lb_109:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn -2'
call_nc_lb_110:
; 	» "Hello World!!\n" |~ 0' : _p10
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_112+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_112+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,2
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_p10
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_113
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_114
emt_set_ptn_0_lb_113:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_114:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_115
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_115:
; 	» "Foo Baoo" |~ 0' : _p10
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_116+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_116+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,8
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,_p10
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_117
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_118
emt_set_ptn_0_lb_117:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_118:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_119
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_119:
; » _^ ..
;push_reg
	push QWORD r9
	push QWORD r10
	mov rbx,26
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,r10
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,2
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	mov r14,0
; "Ab"
	mov BYTE [r13+8*1+r14],65
	add r14,1
	mov BYTE [r13+8*1+r14],98
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_120:
	mov bl,[r15]
	cmp rbx,0
	jz LB_121
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_120
LB_121:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_122:
	mov bl,[r15]
	cmp rbx,0
	jz LB_123
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_122
LB_123:
; 1'
	mov r15,r10
	add r15,8
LB_124:
	mov bl,[r15]
	cmp rbx,0
	jz LB_125
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_124
LB_125:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\tmov r0,r1\n"
	mov BYTE [r13+8*1+r14],9
	add r14,1
	mov BYTE [r13+8*1+r14],109
	add r14,1
	mov BYTE [r13+8*1+r14],111
	add r14,1
	mov BYTE [r13+8*1+r14],118
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],49
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\tadd r3,r5\n"
	mov BYTE [r13+8*1+r14],9
	add r14,1
	mov BYTE [r13+8*1+r14],97
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],51
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],53
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_126
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_127
emt_get_ptn_0_lb_126:
; unboxed
	stc
emt_get_ptn_1_lb_127:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_128
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_128:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_129
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_129:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_lb_130
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_131
emt_get_ptn_0_lb_130:
; unboxed
	stc
emt_get_ptn_1_lb_131:
	mov QWORD r9,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_132
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_132:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_133
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_133:
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_134
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_135
emt_get_ptn_0_lb_134:
; unboxed
	stc
emt_get_ptn_1_lb_135:
	mov QWORD r9,r8
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_136
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_136:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_137
;push_reg
	call exec_out
;pop_reg
LB_137:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_138
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_138:
;clear 
	mov rax,r8
	stc
	ret
NS_E_139:
; 	|» {  }
	jz NS_E_RDI_139
	jc emt_etr_c_lb_140
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
jmp NS_E_RDI_139
emt_etr_c_lb_140:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_139:
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
	call NS_E_107
	mov QWORD [tmp],rax
	jc call_c_lb_141
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
	jmp call_nc_lb_142
call_c_lb_141:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn {  }
call_nc_lb_142:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_144
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_144:
;clear 
	mov rax,r8
	stc
	ret
NS_E_145:
; 	|» {  }
	jz NS_E_RDI_145
	jc emt_etr_c_lb_146
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
jmp NS_E_RDI_145
emt_etr_c_lb_146:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_145:
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
	jc emt_set_ptn_0_lb_147
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_148
emt_set_ptn_0_lb_147:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_148:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_149
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_149:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_151
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_152
emt_get_crt_ptn_0_lb_151:
; unboxed
	stc
emt_get_crt_ptn_1_lb_152:
	mov QWORD r8,r9
	jc ret_lb_153
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_150
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_150:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_153:
;clear 
	mov rax,r8
	stc
	ret
NS_E_154:
; 	|» {  }
	jz NS_E_RDI_154
	jc emt_etr_c_lb_155
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
jmp NS_E_RDI_154
emt_etr_c_lb_155:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_154:
; 	» "FOO" |~ 0' : _p10
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_156+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,5
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_p10
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_157
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_158
emt_set_ptn_0_lb_157:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_158:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_159
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_159:
; » _^ ..
;push_reg
	push QWORD r9
	mov rbx,0
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,0
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r9
	mov r14,0
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; 	∎ 0'
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_161
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_162
emt_get_crt_ptn_0_lb_161:
; unboxed
	stc
emt_get_crt_ptn_1_lb_162:
	mov QWORD r10,r8
	jc ret_lb_163
	push r10
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_160
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_160:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_163:
;clear  1'~s0
	bt r12,1
	jc clear_lb_164
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_164:
	mov rax,r10
	stc
	ret
section .data
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
	NS_E_DYN_55:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_58:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_59:
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
	NS_E_DYN_104:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_104
	NS_E_DYN_107:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_107
	NS_E_DYN_139:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_139
	NS_E_DYN_145:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_145
	NS_E_DYN_154:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_154
	cst_stg_156: db 70,79,79,0,0,0,0,0
	cst_stg_116: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_112: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
