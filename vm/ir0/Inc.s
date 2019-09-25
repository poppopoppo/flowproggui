%include "mem.s"
main:
	mov r12,rsp
	lea rsp,[rsp-8*200]
	xor rax,rax
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	call test0
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test0:
; 	|» {  }
; emt_set_ptn {  }
	mov r9,[rdi]
	ror r9,48
	sub r9,1
	mov r10,r9
	shl r10,48
	rol r9,48
	mov [rdi],r9
	cmp r10,0
	jne emt_set_ptn_end_0
	call free
emt_set_ptn_end_0:
; 	$ { {  } {  } } ⊢ ,0',1',2' : ,{ { } { } },{ { } { } },{ { } { } }
; emt_get_ptn { {  } {  } }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
	xor rax,rax
	rcl r9,1
	mov rax,r9
	rcr r9,1
	jc lb_1
	push rdi
	push rax
	mov rsi,3
	call inc_r_p_n
	clc
	pop rax
	pop rdi
lb_1:
	push rdi
	push rax
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	xor r9,r9
	rcl r9,1
	mov r10,[r12]
	btr r10,0
	or r10,r9
	mov [r12],r10
	mov rax,rdi
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	xor r9,r9
	rcl r9,2
	mov r10,[r12]
	btr r10,1
	or r10,r9
	mov [r12],r10
	mov rax,rdi
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	xor r9,r9
	rcl r9,3
	mov r10,[r12]
	btr r10,2
	or r10,r9
	mov [r12],r10
	mov rax,rdi
	pop rax
	pop rdi
	bt rax,0
	jc lb_2
	push rdi
	call dec_r_p
	pop rdi
	clc
lb_2:
; 	∎ 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
;clear  2'~r2 0'~r0
	mov r9,[r12]
	bt r9,2
	jc lb_3
	mov rdi,[r12-8*3]
	call dec_r_p
lb_3:
	mov r9,[r12]
	bt r9,0
	jc lb_4
	mov rdi,[r12-8*1]
	call dec_r_p
lb_4:
	ret
