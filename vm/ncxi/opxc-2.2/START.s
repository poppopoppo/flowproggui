; ini_prc 
	mov rdi,NULL 
	C_CALL ini_prc 
; crt shreads 
	mov QWORD [EXIT],0 
	mov QWORD [FLG0],0 
	mov QWORD [FLG1],0 
	mov QWORD [FTX0],0
	mov rdi,th0 
	call thread_create 
	cmp rax,-1 
	jz err
; set signal handler 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 
	mov QWORD [SIG_ETR],sig_dft 
	mov QWORD [SIG_FLG],0 
	mov rdi,0 
ini_ss_rcd:
 mov QWORD [SS_RCD_N+8*rdi],0 
	mov QWORD [SS_RCD_C+8*rdi],0
	mov QWORD [SS_RCD_TOP+8*rdi],~0
	add rdi,1 
	cmp rdi,RCD_N
	jnz ini_ss_rcd  
	
	 

; init emt buffer 
	mov rdi,PAGE_SIZE
	C_CALL alc_gd_buf
	mov QWORD [GD_BUF_PT],rax
	mov QWORD [GD_BUF_IT],rax
	mov rax,0 
	mov rdi,fmt_d 
	mov rsi,QWORD [PAGE_SIZE]
	C_CALL printf

	mov rdi,0
	mov QWORD [EMT_BUF],0
	mov QWORD [EMT_BUF_OFS],0

; _args 
	mov rdi,QWORD [rsp]
 lea rdi,[rdi+1]
	mov rsi,8 
	xor rax,rax 
	C_CALL calloc
	pop r13
	mov QWORD [rax],r13
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
	mov GLX(127),rbx
 ; exn_root 
	push exn_dft 
	push exn_dft