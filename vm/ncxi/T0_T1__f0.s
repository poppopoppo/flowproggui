%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_61
	mov QWORD [CST_DYN_61+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_61],rbx
	call NS_E_90
	mov QWORD [CST_DYN_90+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_90],rbx
	call NS_E_118
	mov QWORD [CST_DYN_118+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_118],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_34
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_30:
NS_E_RDI_30:
NS_E_30_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_30_LB_0
	bt r11,7
	jc LB_31
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,1
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_31:
	add rsi,1
	bt r11,6
	jc LB_32
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,2
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_32:
	add rsi,1
	bt r11,5
	jc LB_33
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,3
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_33:
	add rsi,1
	bt r11,5
	jc LB_33
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,4
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11b,[rdi+rsi+8*1+3]
	mov BYTE [r10+8*1+3],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
	add rsi,1
	mov rax,1
	ret
NS_E_30_LB_0:
	mov rax,0
	ret
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_14:
	mov rdi,r8
	bt r12,0
NS_E_RDI_14:
	mov rsi,0
	setc sil
	push rsi
	call pnt_v
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
NS_E_34:
; 	|» {  }
	jz NS_E_RDI_34
	jc emt_etr_c_lb_35
	push rbx
	mov rbx,rdi
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_34
emt_etr_c_lb_35:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_34:
; 	» "Hello World!!\n" |~ 0' : _stg
;push_reg
	mov rdi,14
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Hello Wo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],114
	add rsi,1
	mov BYTE [rdi+8*1+rsi],108
	add rsi,1
	mov BYTE [rdi+8*1+rsi],100
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_36
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_37
emt_set_ptn_0_lb_36:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_37:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_38
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_38:
; 	» "Foo Baoo" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Foo Baoo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 0',s1
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_39
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_40
emt_set_ptn_0_lb_39:
	mov r10,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b100
emt_set_ptn_1_lb_40:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_41
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
emt_dec_ptn_0_lb_41:
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
LB_42:
	mov bl,[r15]
	cmp rbx,0
	jz LB_43
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_42
LB_43:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_44:
	mov bl,[r15]
	cmp rbx,0
	jz LB_45
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_44
LB_45:
; 1'
	mov r15,r10
	add r15,8
LB_46:
	mov bl,[r15]
	cmp rbx,0
	jz LB_47
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_46
LB_47:
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
	jc emt_get_ptn_0_lb_48
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_49
emt_get_ptn_0_lb_48:
; unboxed
	stc
emt_get_ptn_1_lb_49:
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
	jc emt_dec_ptn_0_lb_50
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
emt_dec_ptn_0_lb_50:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_51
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_51:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_lb_52
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_53
emt_get_ptn_0_lb_52:
; unboxed
	stc
emt_get_ptn_1_lb_53:
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
	jc emt_dec_ptn_0_lb_54
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_54:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_55
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_55:
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_56
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_57
emt_get_ptn_0_lb_56:
; unboxed
	stc
emt_get_ptn_1_lb_57:
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
	jc emt_dec_ptn_0_lb_58
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_58:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_59
;push_reg
	call exec_out
;pop_reg
LB_59:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_60
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_60:
;clear 
	mov rax,r8
	stc
	ret
NS_E_61:
NS_E_RDI_61:
; 	» "HOOO BOOO\n" |~ 0' : _stg
;push_reg
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`HOOO BOO`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_62
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_63
emt_set_ptn_0_lb_62:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_63:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_64
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_64:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_65
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_66
emt_get_ptn_0_lb_65:
; unboxed
	stc
emt_get_ptn_1_lb_66:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_67
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_67:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_68
;push_reg
	call exec_out
;pop_reg
LB_68:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_69
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_69:
;clear 
	mov rax,r8
	stc
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
	imul rcx,1
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
	call NS_E_30_ETR_TBL
	cmp rax,0
	jnz LB_77
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_71_MTC_0_failed
LB_77:
	mov QWORD [prs_vct+16*0],r11
	mov QWORD [prs_vct+8*1+16*0],r10
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,65
	jz LB_81
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rdi,0
	jc LB_82
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_82:
	pop rdx
	pop rdi
	jmp NS_E_71_MTC_0_failed
LB_81:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],unt
	call NS_E_30_ETR_TBL
	cmp rax,0
	jnz LB_86
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rdi,0
	jc LB_87
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_87:
	mov rsi,QWORD [prs_vct+16*0]
	bt rdi,0
	jc LB_88
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_88:
	pop rdx
	pop rdi
	jmp NS_E_71_MTC_0_failed
LB_86:
	mov QWORD [prs_vct+16*0],r11
	mov QWORD [prs_vct+8*1+16*0],r10
NS_E_71_MTC_0_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,3
	call mlc
	mov rdi,rax
	mov r10,rdi
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_71_succeed
NS_E_71_MTC_0_failed:
	pop rsi
	jmp NS_E_71_failed
NS_E_71_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_71_succeed_tbl
	push rsi
	push rdi
	push r10
	push r11
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	pop r11
	pop r8
	mov rsi,[rax]
	btr rsi,0
	bt r11,0
	jc LB_73
	btr rsi,2
LB_73:
	mov [rax],rsi
	mov QWORD [rax+8*3],r8
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_71_succeed_tbl:
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
NS_E_90:
NS_E_RDI_90:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r9,0xff
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn 0'
; unboxed
; 	» "ABC" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],65
	add rsi,1
	mov BYTE [rdi+8*1+rsi],66
	add rsi,1
	mov BYTE [rdi+8*1+rsi],67
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_94
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_95
emt_set_ptn_0_lb_94:
	mov r10,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b100
emt_set_ptn_1_lb_95:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_96
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
emt_dec_ptn_0_lb_96:
; 	_pp_v 1' ⊢ { 0' 1' } : { _r64 _stg }
; push_s_ex  2'~s0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_97
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_98
emt_set_ptn_0_lb_97:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_98:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_lb_100
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_109
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_110
emt_set_ptn_0_lb_109:
	mov r9,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b10
emt_set_ptn_1_lb_110:
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_101
call_c_lb_100:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_104
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_105
emt_set_ptn_0_lb_104:
	mov r9,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b10
emt_set_ptn_1_lb_105:
call_nc_lb_101:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_111
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_112
emt_get_ptn_0_lb_111:
; unboxed
	stc
emt_get_ptn_1_lb_112:
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
	jc emt_dec_ptn_0_lb_113
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
emt_dec_ptn_0_lb_113:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_114
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_114:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
	clc
	jc ret_lb_115
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_115:
;clear  2'~s0 0'~x0
	bt r12,2
	jc clear_lb_116
;push_reg
	push QWORD r8
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_116:
	bt r12,0
	jc clear_lb_117
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_117:
	mov rax,r9
	stc
	ret
NS_E_118:
NS_E_RDI_118:
; 	» "xAw" |~ 0' : _stg
;push_reg
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],65
	add rsi,1
	mov BYTE [rdi+8*1+rsi],119
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_119
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_120
emt_set_ptn_0_lb_119:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_120:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_121
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_121:
; 	» 0xr0 |~ 0' : _r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,_r64
; emt_ptn_crt_ptn 0',r0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	bts r12,2
; ; emt_dec_ptn 0'
; unboxed
; 	g0.prs { 1' 2' } ⊢ { 0' 1' 2' } : { _stg _r64 _p70 }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r9,1
	jc lb_125
	and r12,~0b1000
lb_125:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
	mov rbx,r11
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_126
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_127
emt_set_ptn_0_lb_126:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_127:
; emt_ptn_set_ptn 2',1'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn { 3' 2' }
; unboxed
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_131
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_131:
	call NS_E_71
	mov QWORD [tmp],rax
	jc call_c_lb_132
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_141
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_142
emt_set_ptn_0_lb_141:
	mov r8,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1
emt_set_ptn_1_lb_142:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_145
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_146
emt_set_ptn_0_lb_145:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_146:
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_133
call_c_lb_132:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_134
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_135
emt_set_ptn_0_lb_134:
	mov r8,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1
emt_set_ptn_1_lb_135:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_138
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_139
emt_set_ptn_0_lb_138:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_139:
call_nc_lb_133:
; 	_pp_v 2' ⊢ { 2' 3' } : { _p70 _stg }
; push_s_ex  0'~s0 1'~r1
	sub rsp,24
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_147
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_148
emt_set_ptn_0_lb_147:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_148:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_149
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_149:
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_lb_150
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_157
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_158
emt_set_ptn_0_lb_157:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_158:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_159
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_160
emt_set_ptn_0_lb_159:
	mov r11,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1000
emt_set_ptn_1_lb_160:
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_151
call_c_lb_150:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_152
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_153
emt_set_ptn_0_lb_152:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_153:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_154
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_155
emt_set_ptn_0_lb_154:
	mov r11,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1000
emt_set_ptn_1_lb_155:
call_nc_lb_151:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_lb_161
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_162
emt_get_ptn_0_lb_161:
; unboxed
	stc
emt_get_ptn_1_lb_162:
	mov QWORD rcx,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,rcx
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_163
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_163:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_164
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
LB_164:
; 	∎ { 0' 1' 2' }
; emt_get_crt_ptn { 0' 1' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,3
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_168
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_169
emt_get_crt_ptn_0_lb_168:
; unboxed
	stc
emt_get_crt_ptn_1_lb_169:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 1'
	mov QWORD rcx,r9
	stc
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_170
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_171
emt_get_crt_ptn_0_lb_170:
; unboxed
	stc
emt_get_crt_ptn_1_lb_171:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,2
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_172
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_165
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_165:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_167
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
emt_dec_ptn_0_lb_167:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_172:
;clear 
	mov rax,r11
	stc
	ret
section .data
	NS_E_DYN_30:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30
	NS_E_DYN_34:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_34
	CST_DYN_61:
		dq 1
		dq 1
	NS_E_DYN_72:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_71:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_71
	CST_DYN_90:
		dq 1
		dq 1
	CST_DYN_118:
		dq 1
		dq 1
