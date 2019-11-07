%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_38
	mov QWORD [CST_DYN_38+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_38],rbx
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
NS_E_38:
NS_E_RDI_38:
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_39
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_40
emt_set_ptn_0_LB_39:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_40:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_41
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_41:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_42
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_43
emt_get_ptn_0_LB_42:
; unboxed
	stc
emt_get_ptn_1_LB_43:
	mov QWORD r8,r9
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
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_44
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_44:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_45
;push_reg
	call exec_out
;pop_reg
LB_45:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_46
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_46:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_34:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_34
	CST_DYN_38:
		dq 0x0001_0001_00_82_ffff
		dq 1
