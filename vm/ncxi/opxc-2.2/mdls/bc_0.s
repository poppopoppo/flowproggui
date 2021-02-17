%define N 1000000000 
section .text 
global main 
main: 
	mov rdi,0 
	mov rsi,0 
lp:
	cmp rdi,N
	jz end
	cmp rsi,0 
	jnz err 
	add rdi,1 
	jmp lp 
end: 
	ret 
err: 
	mov rax,QWORD [0] 

	
