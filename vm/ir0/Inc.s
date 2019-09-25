%include "mem.s"
main:
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
; clear
	ret
