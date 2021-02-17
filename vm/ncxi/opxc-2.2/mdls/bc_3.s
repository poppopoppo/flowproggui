%define N 1000000000 
section .text 
global main 
main: 
	mov rdi,0 
	mov rsi,0 
lp:
	cmp rdi,N
	jnz nxt
end: 
	ret 
nxt: 
	cmp rsi,0 
	jnz err 
	add rdi,1 
	jmp lp 

err: 
	mov rax,QWORD [0] 

	
