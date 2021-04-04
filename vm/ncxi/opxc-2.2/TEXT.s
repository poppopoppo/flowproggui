	
	unt: dq 0x0

	unt_0: dq 0x0 

thread_create: ; rdi=fn
	push rdi
	call stack_create
	lea rsi, [rax + STACK_SIZE - 8]
	pop qword [rsi]
	mov rdi, THREAD_FLAGS
	mov rax, SYS_clone
	syscall
	cmp rax,-1 
	jz err 
	ret

;; void *stack_create(void)
stack_create:
	mov rdi, 0
	mov rsi, STACK_SIZE
	mov rdx, PROT_WRITE | PROT_READ
	mov r10, MAP_ANONYMOUS | MAP_PRIVATE | MAP_GROWSDOWN
	mov r8, -1
	mov r9, 0
	mov rax, SYS_mmap
	syscall
	cmp rax,-1 
	jz err 
	ret

th0:
	mov QWORD [FLG1],0 
	mov rax,SYS_futex 
	mov rdi,FTX0 
	mov rsi,FUTEX_WAIT 
	mov rdx,0
	mov r10,0 
	syscall  
	cmp rax,-1 
	jz err_th0
th0_0:
	mov rdi,0
	lock xchg QWORD [BUF0],rdi
	cmp rdi,0 
	jnz th0_1 
	nop  
	nop 
	nop  
	nop 
	jmp th0_0
th0_1: 
	mov rsi,0
	lock xchg QWORD [FTX0],rsi
	mov QWORD [FLG1],1
	cmp rsi,0 
	jz err_th0 
	mov rax,QWORD [rdi] 
	xor rax,rax 
	;C_CALL_SF free 
	jmp th0

pf_x_tb: db "0123456789abcdef"
pf_x: ; rdi=buf rax=num ⊢ rdi=buf rax=add-n
	;lzcnt rcx,rax 
	mov rcx,rax 
	or rcx,1 
	bsr rsi,rcx 
	mov rcx,63 
	sub rcx,rsi 
	shr rcx,2
	mov rsi,16 
	sub rsi,rcx 
	mov r8,rsi 
	mov BYTE [rdi+rsi],0
pf_x_lp:
	mov rdx,rax 
	and rdx,0xf
	movzx rbx,BYTE [pf_x_tb+rdx] 
	mov BYTE [rdi+rsi-1],bl 
	shr rax,4  
	sub rsi,1 
	cmp rsi,0 
	jnz pf_x_lp 
	mov rax,r8 
	ret

pf_x_n: 
	or rax,1 
	bsr rsi,rax 
	mov rcx,63 
	sub rcx,rsi 
	shr rcx,2 
	mov rsi,16 
	sub rsi,rcx 
	add rdi,rsi 
	ret
pf_x_rv: 
pf_x_rv_lp:
	movzx rdx,al 
	and rdx,0xf
	movzx rbx,BYTE [pf_x_tb+rdx] 
	mov BYTE [rdi],bl 
	shr rax,4  
	sub rdi,1 
	cmp rax,0 
	jnz pf_x_rv_lp 
	ret  

pf_d: ; rdi=buf rax=num 
	mov r10,rdi
	sub rsp,128 
	mov r9,127
pf_d_lp0:
	DIV_MOD10 
	lea rsi,[rdi+48] 
	mov BYTE [rsp+r9],sil 
	sub r9,1 
	cmp rax,0 
	jnz pf_d_lp0 
	mov rcx,127
	sub rcx,r9 
	mov rax,rcx 
	lea rsi,[rsp+r9+1] 
	mov rdi,r10
	cld
	rep movsb  
	std 
	mov BYTE [rdi],0
	mov rdi,rsi
	add rsp,128 
	ret 


pf_d_rv: ; rdi=buf rax=num 
	mov r10,rdi
	mov r9,rdi
pf_d_rv_lp0:
	DIV_MOD10 
	lea rsi,[rdi+48] 
	mov BYTE [r9],sil 
	sub r9,1 
	cmp rax,0 
	jnz pf_d_rv_lp0 
	sub r10,r9 
	mov rax,r10
	ret 

pf_x_bc: 
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	lea rdi,[rax+7+rsi] 
	std
	ret

sig_alc_rcd: ; rbx=n 
	C_PUSH_REGS 
	push rdi 
	push rsi 
	push rax
	mov rdi,rbx 
	xor rax,rax
	add rdi,1 
	shl rdi,10 
	mov rsi,rdi 
	xor rdi,rdi 
	mov rdi,8
	CALLOC_SF
	mov rdx,rbx 
	mov rbx,rax 
	mov rdi,1000 
	call ss_lp
	pop rax 
	pop rsi 
	pop rdi 
	C_POP_REGS 
	jmp QWORD [SIG_RIP]

ss_lp: 
	cmp rdi,0 
	jz ss_end
	sub rdi,1 
	lea rsi,[rax+8+8*rdx] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp
ss_end:
	mov rsi,0xffff_ffff_ffff_0000 
	add rsi,rdx
	mov [rax],rsi 
	ret
	
init_ss: ; rdi=sgm rsi=size rax=n
	mov rdi,0 
init_ss_lp:
	cmp rax,0
	jz init_ss_end 
	sub rax,1 
	lea rdx,[rdi+8*rsi]
	mov QWORD [rdi],rdx 
	mov rdi,rdx 
	jmp init_ss_lp
init_ss_end: 
	mov rsi,-65522
	mov [rdi],rsi 
	ret 

info:
	C_PUSH_REGS
	;mov rdi,fmt_info 
	;mov rsi,QWORD [S8_N]
	;mov rdx,QWORD [SS_LN_C]
	;mov rcx,SS_LN_N 
	;xor rax,rax 
	;C_CALL printf
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

sig_hdl: ; rdi=sig_n rsi=siginfo_t* rdx=void* context
	mov rdi,QWORD [SIG_ETR]
	mov rsi,rdx 
	C_CALL set_usr_hdl 
	mov QWORD [SIG_RIP],rax
	ret 
sig_dft_alc_rcd: 
	mov rbx,QWORD [SIG_FLG]
	and rbx,0xffff 
	;mov rdi,rbx 
	jmp sig_alc_rcd
sig_dft: 
	;mov rbx,QWORD [SIG_FLG] 
	;and rbx,0xffff_0000 
	;cmp rbx,0xf00f_0000 
	;je sig_dft_alc_rcd
	push rdi 
	push rsi 
	push rdx 
	xor rax,rax 
	mov rsi,rdi 
	mov rdi,fmt_sig_hdl
	mov rdx,QWORD [SIG_FLG]
	C_CALL printf 
	call exit 
	mov QWORD [err_n],0xfff
	jmp err


%define C1 0xcc9e_2d51 
%define C2 0x1b87_3593 
%define R1 15 
%define R2 13 
%define M 5 
%define N 0xe654_6b64 
%define SEED 0x9848_3cbf  

free_opq: 
	bt QWORD [rdi],63 
	jc free_opq_stk
	C_CALL_SF free 
	ret
free_opq_stk:
	mov QWORD [rdi],rdi
	ret

mm32: ; rdi=s  
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	add rdi,8	
	mov r8,rsi 
	shr r8,2 
	;mov rdx,rsi 
	;and rdx,11b 
	mov rax,SEED 
	mov r10d,DWORD [rdi+4*r8]
mm32_m:
	cmp r8,0 
	jz mm32_i 
	mov ebx,DWORD [rdi-4+4*r8]
	mov edx,C1 
	imul ebx,edx 
	rol ebx,R1 
	imul ebx,C2 
	xor eax,ebx
	rol eax,R2 
	imul eax,M 
	add eax,N 	
	sub r8,1 
	jmp mm32_m 
mm32_i:
	mov edx,C1 
	imul r10d,edx
	rol r10d,R1 
	imul r10d,C2 
	
	xor eax,r10d 
	
	xor eax,esi 

	mov ebx,eax
	shr ebx,16 
	xor eax,ebx 
	mov rdx,0x85eb_ca6b 
	imul eax,edx
	mov ebx,ecx
	shr ebx,13 
	xor eax,ebx 
	mov edx,0xc2b2_ae35 
	imul eax,edx
	mov ebx,eax 
	shr ebx,16 
	xor eax,ebx
	ret

cmp_s8: ; rdi,rsi
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	mov rdx,0x0000_ffff_ffff_ffff
	and rdx,QWORD [rsi]
	add rdi,8
	add rsi,8
cmp_stg: ;s0=rdi l0=rax s1=rsi l1=rdx
	cmp rax,rdx
	jg cmp_s8_g 
	jl cmp_s8_l 
	shr rax,3 
	xor rbx,rbx
cmp_s8_lp:
	mov rdx,QWORD [rsi+8*rbx]
	cmp QWORD [rdi+8*rbx],rdx 
	jg cmp_s8_g 
	jl cmp_s8_l  
	cmp rbx,rax
	jz cmp_s8_e
	add rbx,1 
	jmp cmp_s8_lp 
cmp_s8_l:
	mov rax,0 
	ret 
cmp_s8_e:
	mov rax,1 
	ret
cmp_s8_g: 
	mov rax,2
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
	CALLOC_SF
	pop rsi 
	mov QWORD [rax],rsi
	ret 


is_spc: 
	cmp rdi,32
	jz is_spc_1 
	mov rsi,rdi 
	sub rsi,9 
	cmp rsi,4 
	jle is_spc_1 
	mov rax,0 
	ret 
is_spc_1: 
	mov rax,1 
	ret  

scf_d_F: 
	lea rsi,[rdi+8]
  mov rdi,QWORD [rdi]
  mov rdx,0x0000_ffff_ffff_ffff 
  and rdi,rdx 
  mov r8,10 
  call scf_F
  mov rdi,r10
	ret

scf_x_F:  
	lea rsi,[rdi+8]
  mov rdi,QWORD [rdi]
  mov rdx,0x0000_ffff_ffff_ffff 
  and rdi,rdx 
  mov r8,16 
  call scf_F
  mov rdi,r10
	ret

scf_F:
	cmp rax,rdi
	jge scf_F_0
	lea rdi,[rsi+rax] 
	push rax 
scf_T: 
	push rdi
	movzx rdi,BYTE [rdi]
	call is_spc
	cmp rax,0
	jnz scf_T_err0 
	mov rdi,QWORD [rsp]
	sub rsp,8
	mov rsi,rsp
	mov rdx,r8
	mov rax,0
	C_CALL strtoul
	pop rsi
	pop rdi
	sub rsi,rdi
	jz scf_T_err1
	mov rdi,rax
	mov rax,1 
	jmp scf_T_end
scf_T_err1:
	mov rax,0 
scf_T_end: 
	pop rbx 
	cmp rax,0 
	jz scf_F_0 
	lea rax,[rbx+rsi]
	mov rsi,rdi
	mov r10,0
	ret 
scf_T_err0: 
	add rsp,8
	mov rax,0
	ret

scf_F_0:
	;mov rsi,unt
	mov r10,1 
	ret
 
mlc_s8: ; rdi=len  
	push rdi  
	mov rsi,~7
	and rdi,rsi
	lea rdi,[rdi+16] 
	mov rsi,1 
	xor rax,rax 
	CALLOC_SF
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

in_fn: 
	sub rsp,144 
	mov rbx,rsp 
	mov rax,2
	mov rsi,2
	syscall
	push rax ; [rsp]=fd
	mov rdi,rax
	mov rax,5
	mov rsi,rbx
	syscall
	mov rdi,[rbx+STAT.st_size]
	push rbx 
	call mlc_s8
	pop rbx 
	mov rdi,QWORD [rsp]
	push rax ; [rsp]=buf
	mov rsi,rax
	add rsi,8
	mov rax,0
	mov rdx,[rbx+STAT.st_size]
	syscall
	mov rax,3
	mov rdi,QWORD [rsp+8]
	syscall
	mov rax,QWORD [rsp]	
	add rsp,16
	add rsp,144
	ret 

emt_stg: ; rdi=stg 
	xor rax,rax 
	C_CALL_SF printf
	ret

emt_cst: ; rdi=stg,rax=len 
	mov rdx,rdi 
	jmp emt_s8_stg 
emt_s8: ; rdi=s8 
	mov rax,0x0000_ffff_ffff_ffff
	and rax,QWORD [rdi] 
	lea rdx,[rdi+8]
emt_s8_stg: ; rax=len,rdx=stg-ptr
	mov rcx,rax 
	mov r9,QWORD [GD_BUF_PT] 
	mov r10,QWORD [GD_BUF_N]
	cmp rax,2048 
	jge emt_s8_flsh 
	lea rsi,[r10+rax+16] 
	cmp rsi,4096 
	jl emt_s8_add
	push rcx 
	push rdx 
	call flsh
	pop rdx 
	pop rcx 
	mov r10,0
emt_s8_add:
	lea rdi,[r9+r10] 
	mov BYTE [rdi],34 
	add rdi,1 
	lea rax,[rcx+2]
	add QWORD [GD_BUF_N],rax
	mov rsi,rdx 
	cld  
	rep movsb 
	mov BYTE [rdi],34 
	ret
emt_s8_flsh:
	push rdx 
	call flsh 
	pop rsi 
	mov rdi,fmt_s8 
	C_CALL_SF printf 
	ret 

flsh: 
	mov rax,SYS_write 
	mov rdi,STDOUT 
	mov rsi,QWORD [GD_BUF_PT] 
	mov rdx,QWORD [GD_BUF_N] 
	mov rbx,rsi 
	syscall 
	cmp rax,-1 
	jz err  
	mov QWORD [GD_BUF_N],0
	mov QWORD [rbx],0
	ret
emt_bof_hdl: 
	call flsh
	mov rdi,QWORD [GD_BUF_PT]
	jmp QWORD [SIG_RIP] 

emt_r64: ;rdi=r64
	mov rdx,rdi
	mov r9,QWORD [GD_BUF_PT] 
	mov r10,QWORD [GD_BUF_N]
	cmp r10,3940
	jl emt_r64_add
	call flsh 
	mov r10,0 
emt_r64_add:
	mov rax,rdx 
	lea rdi,[r9+r10]
	push rdi 
	call pf_d 
	pop rdi 
	mov BYTE [rdi+rax],'r'
	mov BYTE [rdi+rax+1],0
	add rax,2 
	add QWORD [GD_BUF_N],rax 
	ret

					

exn_grm: 
  mov rax,0xff01_0000_0000_0000
	mov QWORD [err_n],rax
	jmp err 
exn_dft: 
	mov rax,0xeeee_0000_0000_0000
	or rax,rsi 
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
err_clc_o: 
	mov rbx,0xe0e2_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_ref_o:
	mov rbx,0xe0cd_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_ref_f:
	mov rbx,0xefcd_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_alc_o: 
	mov rbx,0xe0e1_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_cls: 
	mov rbx,0xe0e0_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_NULL: 
	mov rax,0xffff_ffff_0000_0000
	mov QWORD [err_n],rax				
	jmp err
err_bc: 
	mov QWORD [err_n],0xff
err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	C_CALL printf
	mov rax,SYS_exit
	syscall
err_th0: 
	mov rax,SYS_exit 
	syscall 
exn:
	mov rdi,fmt_exn
	;mov rsi,QWORD [err_n]
	xor rax,rax
	C_CALL printf
	mov rax,SYS_exit
	syscall

synt:
	jmp synt_1 
synt_0:
	add rax,1 
synt_1:						
	cmp rax,rdi
	jge synt_2
	movzx MCR_REG,BYTE [rsi+rax]
	cmp MCR_REG,9 
	jz synt_0
	cmp MCR_REG,10 
	jz synt_0
	cmp MCR_REG,32 
	jz synt_0
synt_2:
	mov r10,0
	ret

line:
	jmp line_1 
line_0:
	add rax,1 
line_1:						
	cmp rax,rdi
	jge line_2
	movzx MCR_REG,BYTE [rsi+rax]
	cmp MCR_REG,9 
	jz line_0
	cmp MCR_REG,32 
	jz line_0
line_2:
	mov r10,0
	ret

byt_F:
	lea rsi,[rdi+8]
  mov rdx,0x0000_ffff_ffff_ffff 
  and rdx,QWORD [rdi] 
  mov rcx,1 
  cmp rax,rdx 
  jge byt_F_0 
  mov rcx,0 
  movzx rsi,BYTE [rdi+8+rax]
  add rax,1 
byt_F_0:
  mov rdi,rcx
	ret