
%define S8_HSH_SEED 0xf7f765d79dabbace
%define S8_HSH_M 0xc6a4a7935bd1e995
%define S8_HSH_R 47 
s8_hsh: ; rdi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	mov rsi,rdi 
	mov rdx,rdi 
	and rsi,7 
	and rdx,~111b
	mov rcx,rax
	mov r8,S8_HSH_M 
	imul rcx,r8
	mov r8,S8_HSH_SEED
	xor rcx,r8
	mov r10,0
s8_hsh_i:
	cmp r10,rdx
	jz s8_hsh_i_end  
	mov rbx,QWORD [rdi+8+8*r10] 
	add r10,8 
	mov r8,S8_HSH_M 
	imul rbx,r8 
	mov r8,r10
	mov r9,S8_HSH_R 
	shr r8,r9
	xor r10,r8
	mov r9,S8_HSH_M  
	imul r10,r9
	xor rcx,r10 
	mov r9,S8_HSH_M 
	imul rcx,r9
	jmp s8_hsh_i 
s8_hsh_i_end:
	add rdx,rsi
	mov r10b,48
s8_hsh_m: 
	cmp r10,0 
	jz s8_hsh_m_end 
	sub rdx,1 
	movzx r8,BYTE [rdi+8+rdx]
	push rcx 
	mov rcx,r10 
	shl r8,cl 
	pop rcx  
	sub r10,8 
	xor rcx,r8 
	jmp s8_hsh_m 
s8_hsh_m_end:
	mov rbx,rcx
	mov r9,S8_HSH_R 
	shr rbx,r9 
	xor rcx,rbx 
	mov r9,S8_HSH_M 
	imul rcx,r9 
	mov rbx,rcx
	mov r9,S8_HSH_R 	 
	shr rbx,r9 
	xor rcx,rbx 
	mov rax,rcx 
	ret 