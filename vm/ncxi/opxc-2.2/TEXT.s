	
	unt: dq 0x0

	unt_0: dq 0x0 
info:
	C_PUSH_REGS
	mov rdi,fmt_info 
	mov rsi,QWORD [S8_N]
	mov rdx,QWORD [SS_LN_C]
	mov rcx,SS_LN_N 
	xor rax,rax 
	C_CALL printf
	mov rax,0
info_rcd:
	push rax 
	mov rdi,fmt_info_rcd
	mov rsi,rax 
	mov rdx,QWORD [SS_RCD_C+8*rax]
	mov rcx,QWORD [SS_RCD_N+8*rax]
	xor rax,rax
	C_CALL printf 
	pop rax 
	cmp rax,RCD_N 
	jz info_rcd_end 
	add rax,1 
	jmp info_rcd 
info_rcd_end:
	C_POP_REGS 
	ret
;getchar:
;	xor rax,rax 
;	C_CALL_SF getchar 
;	ret

sig_hdl: ; rdi=sig_n rsi=siginfo_t* rdx=void* context
	cmp QWORD [SIG_FLG],0
	jnz sig_hdl_usr
	push rdi 
	push rsi 
	push rdx 
	xor rax,rax 
	mov rsi,rdi 
	mov rdi,fmt_sig_hdl
	C_CALL printf 
	call info 
	call exit 
	mov QWORD [err_n],0xfff
	jmp err
sig_hdl_usr:
	mov rdi,QWORD [SIG_ETR]
	mov rsi,rdx 
	C_CALL set_usr_hdl 
	mov QWORD [SIG_RIP],rax
	ret 

eq_s8_q: ; rdi,rsi
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	mov rdx,0x0000_ffff_ffff_ffff
	and rdx,QWORD [rsi]
	cmp rax,rdx
	jnz eq_s8_q_f
	;mov rcx,rax 
	;and rcx,0b111 
	shr rax,3 
	add rax,1
eq_s8_q_lp:
	cmp rax,0
	jz eq_s8_q_t
	mov rdx,QWORD [rdi+8*rax]
	cmp QWORD [rsi+8*rax],rdx 
	jnz eq_s8_q_f 
	sub rax,1 
	jmp eq_s8_q_lp 
eq_s8_q_f:
	mov rax,0 
	;stz
	ret 
eq_s8_q_t:
	mov rax,1 
	ret
eq_s8: ;rdi,rsi
	push rdx
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	mov rdx,0x0000_ffff_ffff_ffff
	and rdx,QWORD [rsi]
	cmp rax,rdx
	jnz eq_s8_f 
eq_s8_lp:
	cmp rax,0
	jz eq_s8_t
	movzx rdx,BYTE [rdi+7+rax]
	cmp BYTE [rsi+7+rax],dl 
	jnz eq_s8_f 
	sub rax,1 
	jmp eq_s8_lp 
eq_s8_f:
	pop rdx 
	mov rax,0 
	stz
	ret 
eq_s8_t:
	pop rdx 
	mov rax,1 
	ret

rpc_s8: ; rdi ⊢ rax
	push rdi 
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi]  
	push rsi
	mov rdi,rsi 
	call mlc_s8
	pop rcx 
	pop rsi 
	add rsi,8
	lea rdi,[rax+8]
	cld 
	rep movsb
	ret
     
esc_s8: ; rdi ⊢ rax 
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi] 
	mov rax,rsi 
	shl rax,1 
	sub rsp,rax 
esc_s8_lp0: 

arr_of_lst: 
	mov rsi,0 
arr_of_lst_r:
	cmp BYTE [rdi+6],1
	jz arr_of_lst_end 
	push QWORD [rdi+8]
	mov rax,rdi
	FREE_RCD 2,rax 
	mov rdi,QWORD [rdi+16]
	add rsi,1 
	call arr_of_lst_r
	sub rsi,1 
	pop QWORD [rax+8+8*rsi]
	ret 
arr_of_lst_end: 
	push rsi 
	xor rax,rax
	mov rdi,8
	add rsi,1 
	C_CALL calloc
	pop rsi 
	mov QWORD [rax],rsi
	ret 

scf_d: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	scf_F 10
scf_x: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	scf_F 16

mlc_s8: ; rdi=len  
	push rdi 
	and rdi,~111b
	lea rdi,[rdi+16] 
	mov rsi,1 
	xor rax,rax 
	C_CALL_SF calloc
	pop QWORD [rax] 
	ret

s8_of_c_stg: 
	push rdi
	xor rax,rax
	C_CALL strlen
	push rax
	mov rdi,rax
	call mlc_s8
	pop rcx
	pop rsi
	mov rdi,rax
	add rdi,8
	cld
	rep movsb
	ret

free_s8: ;rdi=ptr
	C_CALL_SF free
	ret 

in_fn: 
	mov rax,2
	mov rsi,2
	syscall
	push rax ; [rsp]=fd
	mov rdi,rax
	mov rax,5
	mov rsi,stat
	syscall
	mov rdi,[stat + STAT.st_size]
	call mlc_s8
	mov rdi,QWORD [rsp]
	push rax ; [rsp]=buf
	mov rsi,rax
	add rsi,8
	mov rax,0
	mov rdx,[stat+STAT.st_size]
	syscall
	mov rax,3
	mov rdi,QWORD [rsp+8]
	syscall
	mov rax,QWORD [rsp]	
	add rsp,16
	ret 

emt_stg: ; rdi=stg 
	xor rax,rax 
	C_CALL_SF printf
	ret

emt_cst: ; rdi=stg,rax=len 
	C_PUSH_REGS 
	mov rdx,rdi 
	jmp emt_s8_stg 
emt_s8: ; rdi=s8
	C_PUSH_REGS 
	mov rax,0x0000_ffff_ffff_ffff
	and rax,QWORD [rdi] 
	lea rdx,[rdi+8]
emt_s8_stg: ; rax=len,rdx=stg-ptr
	mov r9,QWORD [GD_BUF_PT] 
	mov r10,QWORD [GD_BUF_N]
 cmp rax,2048 
	jge emt_s8_flsh 
	lea rsi,[r10+rax+16] 
	cmp rsi,4096 
	jl emt_s8_add
	EMT_FLSH
	mov r10,0
emt_s8_add:
	xor rax,rax
	mov rsi,fmt_s8
	lea rdi,[r9+r10] 
	C_CALL_SF sprintf 
	add QWORD [GD_BUF_N],rax
	C_POP_REGS 
	ret
emt_s8_flsh:
	EMT_FLSH 
	xor rax,rax 
	mov rsi,rdx
	mov rdi,fmt_s8 
	C_CALL_SF printf 
	C_POP_REGS
	ret 

emt_bof_hdl: 
	EMT_FLSH
	mov rdi,QWORD [GD_BUF_PT]
	jmp QWORD [SIG_RIP] 

emt_r64: ;rdi=r64
	C_PUSH_REGS 
	mov rdx,rdi
	mov r9,QWORD [GD_BUF_PT] 
	mov r10,QWORD [GD_BUF_N]
	cmp r10,3940
	jl emt_r64_add
	EMT_FLSH 
	mov r10,0 
emt_r64_add:
	xor rax,rax 
	mov rsi,fmt_r64
	lea rdi,[r9+r10]
	C_CALL_SF sprintf
	add QWORD [GD_BUF_N],rax 
	C_POP_REGS
	ret

					

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