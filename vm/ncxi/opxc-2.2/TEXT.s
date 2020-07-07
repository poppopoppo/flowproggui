exn_grm: 
  mov rax,0xff01_0000_0000_0000
	mov QWORD [err_n],rax
	jmp err 
exn_dft: 
	mov rax,0xff00_0000_0000_0000
	mov QWORD [err_n],rax				
	jmp err 
err_lod_q:
	mov rbx,0xe0fe_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_exc_q: 
	mov rbx,0xe0ff_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_bc: 
	mov QWORD [err_n],0xff
err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	C_CALL printf
	mov rax,1
	mov rbx,0
	int 0x80