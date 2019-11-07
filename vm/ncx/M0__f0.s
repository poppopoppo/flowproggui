%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_1049
	mov QWORD [CST_DYN_1049+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_1049],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_1083
	call exec_out
	jmp _end
NS_E_1045:
NS_E_RDI_1045:
NS_E_1045_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_1045_LB_0
	bt r11,7
	jc LB_1046
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
LB_1046:
	add rsi,1
	bt r11,6
	jc LB_1047
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
LB_1047:
	add rsi,1
	bt r11,5
	jc LB_1048
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
LB_1048:
	add rsi,1
	bt r11,5
	jc LB_1048
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
NS_E_1045_LB_0:
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
NS_E_1049:
NS_E_RDI_1049:
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
	jc LB_1050
	bt rbx,0
	jc LB_1051
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r8,rbx
	jmp LB_1052
LB_1050:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
	jmp LB_1052
LB_1051:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
LB_1052:
	btr r12,0
	mov rbx,r8
	bt r12,0
	jc LB_1053
	bt rbx,0
	jc LB_1054
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r8,rbx
	jmp LB_1055
LB_1053:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
	jmp LB_1055
LB_1054:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
LB_1055:
; 	_pp_v 0' ⊢ { 0' 1' } : { (_opn)◂((_opn)◂((_opn)◂(t672'(0)))) _stg }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,1
	mov r9,r8
	bt r12,0
	jc LB_1056
	and r12,~0b10
LB_1056:
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_1057
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_1058
emt_set_ptn_0_LB_1057:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_1058:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_1059
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_1059:
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_1060
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_1066
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_1067
emt_set_ptn_0_LB_1066:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_1067:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_1068
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_1069
emt_set_ptn_0_LB_1068:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_1069:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_1061
call_c_LB_1060:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_1062
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_1063
emt_set_ptn_0_LB_1062:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_1063:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_1064
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_1065
emt_set_ptn_0_LB_1064:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_1065:
call_nc_LB_1061:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_1070
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_1071
emt_get_ptn_0_LB_1070:
; unboxed
	stc
emt_get_ptn_1_LB_1071:
	mov QWORD r10,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r10
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_1072
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_1072:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_1073
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_1073:
; 	» "\n" |~ 1' : _stg
;push_reg
	push QWORD r8
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r8
	mov r9,rbx
	and r12,~0b10
; 	$ 1' ⊢ ,s_nl : ,_stg
; emt_ptn_crt_ptn 1',s_nl
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_1074
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
	jmp emt_set_ptn_1_LB_1075
emt_set_ptn_0_LB_1074:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_1075:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_1076
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
emt_dec_ptn_0_LB_1076:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_1077
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_1078
emt_get_ptn_0_LB_1077:
; unboxed
	stc
emt_get_ptn_1_LB_1078:
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
	jc emt_dec_ptn_0_LB_1079
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_1079:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_1080
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_1080:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	jc ret_LB_1081
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_1081:
;clear  0'~o1
	bt r12,0
	jc clear_LB_1082
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_1082:
	mov rax,r9
	stc
	ret
NS_E_1083:
; 	|» {  }
	jz NS_E_RDI_1083
	jc emt_etr_c_LB_1084
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
jmp NS_E_RDI_1083
emt_etr_c_LB_1084:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_1083:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_1085
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_1085:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_1045:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1045
	CST_DYN_1049:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_1083:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1083
