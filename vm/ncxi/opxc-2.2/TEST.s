
section .text 
global main 
main:
	mov rax,0x0000_8000_0000_0000
	push rax 
	bt QWORD [rsp],47
	jc .L0 
	pop rax
	mov QWORD [0],0
	ret 
.L0:
	pop rax 
	bt QWORD [LB0],47 
	jnc .Le 
	mov rax,LB0 
	bt QWORD [rax],47 
	jnc .Le
	ret	
.Le:
	mov QWORD [0],0

section .data 
LB0: dq 0x0000_8000_0000_0000,4,3
	ret