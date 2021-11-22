<<<<<<< HEAD
	mov rdi,NULL 
 	C_CALL ini_prc 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	;C_CALL set_handler 
=======
; ini_prc 
	mov rdi,NULL 
	C_CALL ini_prc 
; crt shreads 
	mov QWORD [EXIT],0 
	mov QWORD [FLG0],0 
	mov QWORD [FLG1],0 
	mov QWORD [FTX0],0
	mov rax,0
BUF0_ini: 	
	mov QWORD [BUF0+8*rax],0
	add rax,1 
	cmp rax,4 
	jnz BUF0_ini 
	
	mov rdi,th0 
	call thread_create 
	cmp rax,-1 
	jz err
; set signal handler 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 
>>>>>>> 1f3642be1c762b5911ea0a8b44ce1984b782c06c
	mov QWORD [SIG_ETR],sig_dft 
	mov QWORD [SIG_FLG],0 
	mov rdi,0 
ini_ss_rcd:
<<<<<<< HEAD
	mov QWORD [SS_RCD_N+8*rdi],0 
	mov QWORD [SS_RCD_C+8*rdi],0
	mov QWORD [SS_RCD_TOP+8*rdi],0
	add rdi,1 
	cmp rdi,RCD_N
	jnz ini_ss_rcd  
; _args 
	mov rdi,QWORD [rsp]
	lea rdi,[rdi+1]
=======
 mov QWORD [SS_RCD_N+8*rdi],0 
	mov QWORD [SS_RCD_C+8*rdi],0
	mov QWORD [SS_RCD_TOP+8*rdi],~0
	add rdi,1 
	cmp rdi,RCD_N
	jnz ini_ss_rcd  
	
; _args 
	mov rdi,QWORD [rsp]
 lea rdi,[rdi+1]
>>>>>>> 1f3642be1c762b5911ea0a8b44ce1984b782c06c
	mov rsi,8 
	xor rax,rax 
	C_CALL calloc
	pop r13
<<<<<<< HEAD
	mov rdi,0x0001_0000_0000_0000
	add rdi,r13
	mov QWORD [rax],rdi
	xor r14,r14
	mov rbx,rax
	args_lp:
=======
	mov QWORD [rax],r13
	xor r14,r14
	mov rbx,rax
args_lp:
>>>>>>> 1f3642be1c762b5911ea0a8b44ce1984b782c06c
	cmp r14,r13
	jz args_lp_end
	pop rdi
	call s8_of_c_stg 
	mov QWORD [rbx+8+8*r14],rax
	add r14,1 
	jmp args_lp 
<<<<<<< HEAD
	args_lp_end:
	mov QWORD [GLV_2],rbx
=======
args_lp_end:
	mov GLX(127),rbx
	;mov QWORD [GLV_2],rbx
 ; exn_root 
>>>>>>> 1f3642be1c762b5911ea0a8b44ce1984b782c06c
	push exn_dft 
	push exn_dft