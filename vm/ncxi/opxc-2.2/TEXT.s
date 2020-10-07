	
	unt: dq 0x0

	unt_0: dq 0x0 

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
	C_CALL calloc_sf
	mov rdx,rbx 
	mov rbx,rax 
	;mov QWORD [SS_RCD_TOP+8*rbx],rax 
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
	imul rcx,S8_HSH_M
	xor rcx,S8_HSH_SEED
	mov r10,0
s8_hsh_i:
	cmp r10,rdx
	jz s8_hsh_i_end  
	mov rbx,QWORD [rdi+8+8*r10] 
	add r10,8 
	imul rbx,S8_HSH_M 
	mov r8,r10 
	shr r8,S8_HSH_R 
	xor r10,r8 
	imul r10,S8_HSH_M 
	xor rcx,r10 
	imul rcx,S8_HSH_M 
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
	shr rbx,S8_HSH_R 
	xor rcx,rbx 
	imul rcx,S8_HSH_M 
	mov rbx,rcx 
	shr rbx,S8_HSH_R 
	xor rcx,rbx 
	mov rax,rcx 
	ret 

%define C1 0xcc9e_2d51 
%define C2 0x1b87_3593 
%define R1 15 
%define R2 13 
%define M 5 
%define N 0xe654_6b64 
%define SEED 0x9848_3cbf  

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