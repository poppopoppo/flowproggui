%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_40
	mov QWORD [CST_DYN_40+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_40],rbx
	call NS_E_81
	mov QWORD [CST_DYN_81+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_81],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call exec_out
	jmp _end
NS_E_34:
NS_E_RDI_34:
NS_E_34_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_34_LB_0
	bt r11,7
	jc LB_35
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
LB_35:
	add rsi,1
	bt r11,6
	jc LB_36
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
LB_36:
	add rsi,1
	bt r11,5
	jc LB_37
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
LB_37:
	add rsi,1
	bt r11,5
	jc LB_37
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
NS_E_34_LB_0:
	mov rax,0
	ret
NS_E_14:
NS_E_RDI_14:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_18:
	mov rdi,r8
	bt r12,0
NS_E_RDI_18:
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
NS_E_40:
NS_E_RDI_40:
	btr r12,0
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	lea QWORD rbx,[unt]
	mov r8,rbx
	mov rbx,0x0100_0000_0000_0001
	add r8,rbx
	btr r12,0
	mov rbx,r8
	bt r12,0
	jc LB_41
	bt rbx,0
	jc LB_42
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r8,rbx
	jmp LB_43
LB_41:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
	jmp LB_43
LB_42:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
LB_43:
	btr r12,0
	mov rbx,r8
	bt r12,0
	jc LB_44
	bt rbx,0
	jc LB_45
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r8,rbx
	jmp LB_46
LB_44:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
	jmp LB_46
LB_45:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
LB_46:
; 	? 0'
; 	∐\ o0 ,,o0=_some◂o2,o2=_some◂o3
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_47
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_48
LB_47:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_48:
; o0=_some◂o2
	mov rbx,QWORD [mtc_vct_0+8*1+16*0]
	mov r13,rbx
	shr r13,56
	cmp r13,0
	jnz LB_49
	mov r13,rbx
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
	bt QWORD [r13],16
	jc LB_50
	bt QWORD [r13],17
	jnc LB_50
	mov r13,QWORD [r13+8*1]
LB_50:
	mov QWORD [set_ptn_vct],0
	mov QWORD [set_ptn_vct+8*1],r13
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_51
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_52
LB_51:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_52:
; o2=_some◂o3
	mov rbx,QWORD [mtc_vct_0+8*1+16*0]
	mov r13,rbx
	shr r13,56
	cmp r13,0
	jnz LB_49
	mov r13,rbx
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
	bt QWORD [r13],16
	jc LB_53
	bt QWORD [r13],17
	jnc LB_53
	mov r13,QWORD [r13+8*1]
LB_53:
	mov QWORD [set_ptn_vct],0
	mov QWORD [set_ptn_vct+8*1],r13
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_54
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_55
LB_54:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_55:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r9,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_56
	btr r12,1
	bt r13,0
	jnc LB_58
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
LB_58:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_57
LB_56:
	bts r12,1
LB_57:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_59
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_59:
	mov r9,QWORD [regs_vct+8*1]
; 	» "thhhh\n" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,0x_00_00_0a_68_68_68_68_74
	mov QWORD [rdi+8*1+8*0],rbx
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_60
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_61
emt_set_ptn_0_LB_60:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_61:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_62
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
emt_dec_ptn_0_LB_62:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_63
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_64
emt_get_ptn_0_LB_63:
; unboxed
	stc
emt_get_ptn_1_LB_64:
	mov QWORD r8,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_65
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_LB_65:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_66
;push_reg
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
LB_66:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_67
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_67:
;clear  1'~o3
	bt r12,1
	jc clear_LB_68
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_68:
	mov rax,r8
	stc
	ret
LB_49:
; 	∐\ o0 ,
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_69
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_70
LB_69:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_70:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r9,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_72
	btr r12,1
	bt r13,0
	jnc LB_74
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
LB_74:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_73
LB_72:
	bts r12,1
LB_73:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_75
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_75:
	mov r9,QWORD [regs_vct+8*1]
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_76
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_76:
;clear  1'~o0
	bt r12,1
	jc clear_LB_77
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_77:
	mov rax,r8
	stc
	ret
LB_71:
	jmp err
NS_E_78:
; 	|» {  }
	jz NS_E_RDI_78
	jc emt_etr_c_LB_79
	push rbx
	push rdi
	mov rbx,rdi
	mov QWORD [set_ptn_vct+8*1],rbx
	mov QWORD [set_ptn_vct],0
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_78
emt_etr_c_LB_79:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_78:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_80
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_80:
;clear 
	mov rax,r8
	stc
	ret
NS_E_81:
NS_E_RDI_81:
; 	» "A" |~ 0' : _stg
;push_reg
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,0x_00_00_00_00_00_00_00_41
	mov QWORD [rdi+8*1+8*0],rbx
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_82
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_83
emt_set_ptn_0_LB_82:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_83:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_84
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_84:
; » _^ ..
;push_reg
	push QWORD r9
	mov rbx,45
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
; "S0"
	mov rbx,0x_48
	mov BYTE [r13+8*1+8*0+0],bl
	mov rbx,0x_45
	mov BYTE [r13+8*1+8*0+1],bl
	mov rbx,0x_4c
	mov BYTE [r13+8*1+8*0+2],bl
	mov rbx,0x_4c
	mov BYTE [r13+8*1+8*0+3],bl
	mov rbx,0x_4f
	mov BYTE [r13+8*1+8*0+4],bl
	add r14,5
; " FOO "
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],70
	add r14,1
	mov BYTE [r13+8*1+r14],79
	add r14,1
	mov BYTE [r13+8*1+r14],79
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
; "S0"
	mov rbx,0x_48
	mov BYTE [r13+8*1+8*0+0],bl
	mov rbx,0x_45
	mov BYTE [r13+8*1+8*0+1],bl
	mov rbx,0x_4c
	mov BYTE [r13+8*1+8*0+2],bl
	mov rbx,0x_4c
	mov BYTE [r13+8*1+8*0+3],bl
	mov rbx,0x_4f
	mov BYTE [r13+8*1+8*0+4],bl
	add r14,5
; "S1"
	mov rbx,0x_6a_6a_0a_46_4a_46_4a_46
	mov QWORD [r13+8*1+8*0],rbx
	mov rbx,0x_6f_20_6d_76_6d_20_0a_6a
	mov QWORD [r13+8*1+8*1],rbx
	mov rbx,0x_0a_4c_20_4c_20_4c_0a_20
	mov QWORD [r13+8*1+8*2],rbx
	add r14,24
; "END \n"
	mov BYTE [r13+8*1+r14],69
	add r14,1
	mov BYTE [r13+8*1+r14],78
	add r14,1
	mov BYTE [r13+8*1+r14],68
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov r15,QWORD [r13]
	and r15,0b111
	mov rbx,0b1000
	sub rbx,r15
LB_85:
	mov BYTE [r13+8*1+r14],0
	sub rbx,1
	add r14,1
	cmp rbx,0
	jnz LB_85
	mov r8,r13
	btr r12,0
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_LB_86
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_87
emt_get_ptn_0_LB_86:
; unboxed
	stc
emt_get_ptn_1_LB_87:
	mov QWORD r10,r8
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r10
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_88
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_88:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_89
;push_reg
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
LB_89:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_90
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_90:
;clear  1'~s0
	bt r12,1
	jc clear_LB_91
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_91:
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_34:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_34
	CST_DYN_40:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_78:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_78
	CST_DYN_81:
		dq 0x0001_0001_00_82_ffff
		dq 1
