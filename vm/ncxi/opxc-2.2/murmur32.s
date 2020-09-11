%define C1 0xcc9e2d51 
%define C2 0x1b873593 
%define R1 15 
%define R2 13 
%define M 5 
%define 0xe6546b64 
%define SEED 0x98483cbf  
mm32: rdi=s , rsi=len 
	mov rax,rsi 
	;and rax,~11b
	shr rax,2 
	mov rdx,rsi 
	and rdx,11b 
	mov rcx,SEED 
	mov r10d,DWORD [rdi+4*rax]
mm32_m:
	cmp rax,0 
	jz mm32_i 
	mov r8d,DWORD [rdi-4+4*rax]
	imul r8d,C1 
	rol r8d,R1 
	imul r8d,C2 
	xor ecx,r8d
	rol ecx,R2 
	imul ecx,M 
	add ecx,N 	
	sub rax,1 
	jmp mm32_m 
mm32_i:
	imul r10d,C1 
	rol r10d,R1 
	imul r10d,C2 
	
	xor ecx,r10d 
	xor ecx,rsi 
	mov eax,ecx
	shr eax,16 
	xor ecx,eax 
	mov eax,ecx
	imul ecx,0x85ebca6b 
	shr eax,13 
	xor ecx,eax 
	imul ecx,0xc2b2ae35 
	mov eax,ecx 
	shr eax,16 
	xor ecx,eax
	mov eax,ecx	
	ret
