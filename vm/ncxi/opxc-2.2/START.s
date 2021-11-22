	mov rdi,NULL 
 	C_CALL ini_prc 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	;C_CALL set_handler 
	mov QWORD [SIG_ETR],sig_dft 
	mov QWORD [SIG_FLG],0 
	mov rdi,0 
ini_ss_rcd:
	mov QWORD [SS_RCD_N+8*rdi],0 
	mov QWORD [SS_RCD_C+8*rdi],0
	mov QWORD [SS_RCD_TOP+8*rdi],0
	add rdi,1 
	cmp rdi,RCD_N
	jnz ini_ss_rcd  
; _args 
	mov rdi,QWORD [rsp]
	lea rdi,[rdi+1]
	mov rsi,8 
	xor rax,rax 
	C_CALL calloc
	pop r13
	mov rdi,0x0001_0000_0000_0000
	add rdi,r13
	mov QWORD [rax],rdi
	xor r14,r14
	mov rbx,rax
	args_lp:
	cmp r14,r13
	jz args_lp_end
	pop rdi
	call s8_of_c_stg 
	mov QWORD [rbx+8+8*r14],rax
	add r14,1 
	jmp args_lp 
	args_lp_end:
	mov QWORD [GLV_2],rbx
	push exn_dft 
	push exn_dft