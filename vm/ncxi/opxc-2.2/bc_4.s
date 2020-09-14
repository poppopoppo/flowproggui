%define N 1000000000 
%define X 0x89acf3 
section .data 
	D: dq X
	V: dq 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
section .text 
global main 
main: 
	mov rdi,0 
	mov rsi,X
	mov rcx,X 
	mov rdx,N 
	mov r8,0
lp:
	cmp rdi,rdx
	jz end
	;cmp rsi,rcx 
	;jnz err  
	;cmp rsi,rcx 
	;jnz err  
	;cmp rsi,rcx 
	;jnz err  
	;cmp rsi,rcx 
	;jnz err  
	;cmp rsi,rcx 
	;jnz err  

	movq xmm0, rsi      
	movq xmm1, rcx 
	punpcklqdq xmm0, xmm1    ;
	movq xmm0, rsi      
	movq xmm1, rcx 
	punpcklqdq xmm0, xmm1    ;
	movq xmm0, rsi      
	movq xmm1, rcx 
	punpcklqdq xmm0, xmm1    ;
	movq xmm0, rsi      
	movq xmm1, rcx 
	punpcklqdq xmm0, xmm1    ;
	movq xmm0, rsi      
	movq xmm1, rcx 
	punpcklqdq xmm0, xmm1    ;

	;mov QWORD [V],rsi 
	;mov QWORD [V+8+1],rcx
	;mov QWORD [V+8*2],rsi 
	;mov QWORD [V+8+3],rcx
	;mov QWORD [V+8*4],rsi 
	;mov QWORD [V+8+5],rcx
	;mov QWORD [V+8*6],rsi 
	;mov QWORD [V+8+7],rcx
	;mov QWORD [V+8*8],rsi 
	;mov QWORD [V+8+9],rcx

	add rdi,5 
	jmp lp 
end: 
	ret 

err: 
	mov rax,QWORD [0] 

	
