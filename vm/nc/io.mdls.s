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
	call f2
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f3:
; 	|» {  }
	jz _f3
	jc emt_etr_c_lb_0
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
jmp _f3
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f3:
; 	» "Test xxx" |~ 0' : ℙ
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_13+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_13+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,8
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_14
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_15
emt_set_ptn_0_lb_14:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_15:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_16
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_16:
;push_reg
	mov rbx,r9
	mov rdi,2
	call mlc
	mov rdx,0x0001000200000001
	mov [rax],rdx
	mov QWORD [rax+8*1],0
	mov [rax+8*2],rbx
	btr r12,0
	mov r8,rax
;pop_reg
	mov rbx,r8
	bt r12,0
	jmp err
f2:
; 	|» {  }
	jz _f2
	jc emt_etr_c_lb_1
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
jmp _f2
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	» "\194\187\194\187 Foo \226\136\128 Baa \194\167\194\182 \t \t \n" |~ 0' : ℙ
;push_reg
	mov rdi,4
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_8+8*3]
	mov [rdi+8*4],rsi
	mov rsi,[cst_stg_8+8*2]
	mov [rdi+8*3],rsi
	mov rsi,[cst_stg_8+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_8+8*0]
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
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_9
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_10
emt_set_ptn_0_lb_9:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_10:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_11
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_11:
;push_reg
	mov rbx,r9
	mov rdi,rbx
	call emt
	mov rdi,rbx
	call dec_r
;pop_reg
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_12
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_12:
;clear 
	mov rax,r8
	stc
	ret
f1:
; 	|» {  }
	jz _f1
	jc emt_etr_c_lb_2
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
jmp _f1
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f1:
; 	» "Hello World!!\n" |~ 0' : ℙ
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_3+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_3+8*0]
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
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_4
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_5
emt_set_ptn_0_lb_4:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_5:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_6
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_6:
;push_reg
	mov rbx,r9
	mov rdi,rbx
	call emt
	mov rdi,rbx
	call dec_r
;pop_reg
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_7
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_7:
;clear 
	mov rax,r8
	stc
	ret
section .data
	_dyn_f1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f1
	_dyn_f2:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f2
	_dyn_f3:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f3
	_dyn_err:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_emt:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cmp:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_mul:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_sub:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_add:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_pnt:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_read:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_scc:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cns:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_nil:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	cst_stg_13: db 84,101,115,116,32,120,120,120,0,0,0,0,0,0,0,0
	cst_stg_8: db 194,187,194,187,32,70,111,111,32,226,136,128,32,66,97,97,32,194,167,194,182,32,9,32,9,32,10,0,0,0,0,0
	cst_stg_3: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
