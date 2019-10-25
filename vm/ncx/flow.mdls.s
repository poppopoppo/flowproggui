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
	call f0
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f0:
; 	|» {  }
	jz _f0
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
jmp _f0
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
	mov QWORD r8,1
	bts r12,0
; emt_ptn_crt_ptn { 0' {  } },a0
; emt_get_crt_ptn { 0' {  } }
;push_reg
	push QWORD r8
	mov rdi,2
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_1
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_2
emt_get_crt_ptn_0_lb_1:
; unboxed
	stc
emt_get_crt_ptn_1_lb_2:
	mov QWORD r10,r8
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,0
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,0
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,1
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xrf378a |~ 0' : r64
	mov QWORD r10,0xf378a
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,r64
; emt_ptn_crt_ptn 0',r0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
	mov QWORD r8,0
	bts r12,0
; emt_ptn_crt_ptn { 0' 2' },a1
; emt_get_crt_ptn { 0' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
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
	jc emt_get_crt_ptn_0_lb_6
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_7
emt_get_crt_ptn_0_lb_6:
; unboxed
	stc
emt_get_crt_ptn_1_lb_7:
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
; emt_get_crt_ptn 2'
	mov QWORD rcx,r10
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
	clc
	and r12,~0b1000
; ; emt_dec_ptn 2'
; unboxed
	mov QWORD r8,0
	bts r12,0
; emt_ptn_crt_ptn { 0' 3' },a2
; emt_get_crt_ptn { 0' 3' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD r10
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_9
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_10
emt_get_crt_ptn_0_lb_9:
; unboxed
	stc
emt_get_crt_ptn_1_lb_10:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD r10
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_11
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_12
emt_get_crt_ptn_0_lb_11:
; unboxed
	stc
emt_get_crt_ptn_1_lb_12:
	mov QWORD rcx,r11
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_13
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_13:
; 	∎ { 1' 2' }
; emt_get_crt_ptn { 1' 2' }
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_16
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_17
emt_get_crt_ptn_0_lb_16:
; unboxed
	stc
emt_get_crt_ptn_1_lb_17:
	mov QWORD r11,r9
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_18
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_19
emt_get_crt_ptn_0_lb_18:
; unboxed
	stc
emt_get_crt_ptn_1_lb_19:
	mov QWORD r11,r10
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	clc
	jc ret_lb_20
	push r8
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_14
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_14:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_15
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_15:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_20:
;clear 
	mov rax,r8
	stc
	ret
section .data
