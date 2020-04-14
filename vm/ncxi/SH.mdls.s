bits 64 
; macros 
%macro RT_ERR 1 
	mov rdi,rt_err0 
	call emt_stg 
	mov QWORD [err_n],%1 
	jmp err 
%endmacro

%macro C_PUSH_REGS 0 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
%endmacro

%macro C_POP_REGS 0 
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop rcx 
	pop rdx 
%endmacro

%macro C_CALL_SF 1 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call %1 
	mov rsp,QWORD [rsp_tmp]
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop rcx 
	pop rdx 
%endmacro 

%macro C_CALL 1 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call %1 
	mov rsp,QWORD [rsp_tmp]
%endmacro 

%macro JZ_SPC 2
	movzx MCR_REG,%1
	cmp MCR_REG,9 
	jz %2
	cmp MCR_REG,10 
	jz %2
	cmp MCR_REG,32 
	jz %2
%endmacro
 
%macro JZ_LINE_SPC 2
	movzx MCR_REG,%1 
	cmp MCR_REG,9 
	jz %2
	cmp MCR_REG,32 
	jz %2
%endmacro
 
%macro ALC_RCD 2 ; n,reg-name!=rbx 
	add QWORD [SS_RCD_C+8*%1],1
	add QWORD [SS_RCD_N+8*%1],1 
	mov %2,[SS_RCD_%1_TOP]
	mov MCR_REG,[%2]
	mov QWORD [SS_RCD_%1_TOP],MCR_REG
%endmacro 

%macro FREE_RCD 2 ; n,reg-name!=rbx 
	sub QWORD [SS_RCD_N+8*%1],1
	mov rbx,QWORD [SS_RCD_%1_TOP] 
	mov QWORD [%2],rbx
	mov QWORD [SS_RCD_%1_TOP],%2
%endmacro

%macro FREE_PT 1 
	mov rbx,[SS_PT_TOP]
	mov QWORD [%1],rbx
	mov [SS_PT_TOP],%1
%endmacro

%macro ALC_PT 1 
	mov %1,[SS_PT_TOP] 
	mov rbx,[%1]
	mov QWORD [SS_PT_TOP],rbx 
%endmacro
				
%macro FREE_LN 1 
	sub SS_LN_N,1 
	mov QWORD [%1],SS_LN_REG
	mov SS_LN_REG,%1
%endmacro

%macro ALC_LN 1 
	add QWORD [SS_LN_C],1 
	add SS_LN_N,1 
	mov %1,SS_LN_REG 
	mov SS_LN_REG,QWORD [SS_LN_REG]
%endmacro


%macro GET_LEN 2 
	mov %1,0x0000_ffff_ffff_ffff
	and %1,QWORD [%2]
%endmacro

%macro MOV_RAX 2 
	mov rax,%2 
	mov %1,rax
	%endmacro

%macro MOV_RDI 2 
	mov rdi,%2 
	mov %1,rdi
%endmacro

%macro MOV_RBX 2 
	mov rbx,%2
	mov %1,rbx
%endmacro

%macro BSS_SS_RCD 2 
	SS_RCD_%1_TOP: resq 1 
	SS_RCD_%1_VCT: resq (%1+1)*(%2+4)
	SS_RCD_%1_BTM: resq 1
%endmacro 

%define KB 1024
%define MB KB*KB 
%define GB MB*MB
%define SIG_INT 2
%define SIG_SEGV 11
%define SS_MAX 4000
%define SS_LN_MAX 1<<16
%define RCD_N 32
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)
%define SS_LN_REG r15
%define MCR_REG rbx
%define SS_LN_N r12
extern exit 
extern printf 
extern sprintf
extern malloc 
extern calloc
extern free 
extern isspace 
extern strtoul
extern strlen
extern getchar
extern set_handler
extern emt_s8_to
section .bss
	tmp: resq 64
	ret_vct: resq 64
 rsp_tmp: resq 1
	RB: resq 1 

; emt buffer 
	EMT_BUF_OFS: resq 1 
 EMT_BUF: resb EMT_BUF_MAX 
	EMT_BUF_END: resb 1
 
; garbage vector 
	GBG_VCT: resq 252

; exp_s8 
	EXP_S8_VCT: resb 2048

;rep_movsb 
	REP_MOVSB_VCT: resq 4

; SS segments 
	SS_TOP: resq 1
	SS_VCT: resq 16*SS_MAX
	SS_BTM: resq 1 

	SS_LN_TOP: resq 1
	SS_LN_VCT: resq 2*SS_LN_MAX
	SS_LN_BTM: resq 1  

	SS_PT_TOP: resq 1
	SS_PT_VCT: resq 3*SS_MAX
	SS_PT_BTM: resq 1 

	SS_RCD_N: resq (RCD_N+1) 
	SS_RCD_C: resq (RCD_N+1)

stat: resb 144
struc STAT
	.st_dev         resq 1
	.st_ino         resq 1
	.st_mode        resd 1
	.st_nlink       resd 1
	.st_uid         resd 1
	.st_gid         resd 1
	.st_rdev        resq 1
	.pad1           resq 1
	.st_size        resq 1
	.st_blksize     resd 1
	.pad2 resd 1
	.st_blocks      resq 1
	.st_atime       resq 1
	.st_atime_nsec  resq 1
	.st_mtime       resq 1
	.st_mtime_nsec  resq 1
	.st_ctime       resq 1
	.st_ctime_nsec  resq 1
	.__unused4  resd 1
	.__unused5  resd 1
endstruc

%define SS_RCD_1_MAX 800
	BSS_SS_RCD 1,SS_RCD_1_MAX
%define SS_RCD_2_MAX (1<<16)
	BSS_SS_RCD 2,SS_RCD_2_MAX
%define SS_RCD_3_MAX (1<<14)
	BSS_SS_RCD 3,SS_RCD_3_MAX
%define SS_RCD_4_MAX 800
	BSS_SS_RCD 4,SS_RCD_4_MAX
%define SS_RCD_5_MAX 800
	BSS_SS_RCD 5,SS_RCD_5_MAX
%define SS_RCD_6_MAX 800
	BSS_SS_RCD 6,SS_RCD_6_MAX
%define SS_RCD_7_MAX 800
	BSS_SS_RCD 7,SS_RCD_7_MAX
%define SS_RCD_8_MAX 800
	BSS_SS_RCD 8,SS_RCD_8_MAX
%define SS_RCD_9_MAX 800
	BSS_SS_RCD 9,SS_RCD_9_MAX
%define SS_RCD_10_MAX 800
	BSS_SS_RCD 10,SS_RCD_10_MAX
%define SS_RCD_11_MAX 800
	BSS_SS_RCD 11,SS_RCD_11_MAX
%define SS_RCD_12_MAX 800
	BSS_SS_RCD 12,SS_RCD_12_MAX
%define SS_RCD_13_MAX 800
	BSS_SS_RCD 13,SS_RCD_13_MAX
%define SS_RCD_14_MAX 800
	BSS_SS_RCD 14,SS_RCD_14_MAX
%define SS_RCD_15_MAX 800
	BSS_SS_RCD 15,SS_RCD_15_MAX
%define SS_RCD_16_MAX 800
	BSS_SS_RCD 16,SS_RCD_16_MAX
%define SS_RCD_17_MAX 800
	BSS_SS_RCD 17,SS_RCD_17_MAX
%define SS_RCD_18_MAX 800
	BSS_SS_RCD 18,SS_RCD_18_MAX
%define SS_RCD_19_MAX 800
	BSS_SS_RCD 19,SS_RCD_19_MAX
%define SS_RCD_20_MAX 800
	BSS_SS_RCD 20,SS_RCD_20_MAX
%define SS_RCD_21_MAX 800
	BSS_SS_RCD 21,SS_RCD_21_MAX
%define SS_RCD_22_MAX 800
	BSS_SS_RCD 22,SS_RCD_22_MAX
%define SS_RCD_23_MAX 800
	BSS_SS_RCD 23,SS_RCD_23_MAX
%define SS_RCD_24_MAX 800
	BSS_SS_RCD 24,SS_RCD_24_MAX
%define SS_RCD_25_MAX 800
	BSS_SS_RCD 25,SS_RCD_25_MAX
%define SS_RCD_26_MAX 800
	BSS_SS_RCD 26,SS_RCD_26_MAX
%define SS_RCD_27_MAX 800
	BSS_SS_RCD 27,SS_RCD_27_MAX
%define SS_RCD_28_MAX 800
	BSS_SS_RCD 28,SS_RCD_28_MAX
%define SS_RCD_29_MAX 800
	BSS_SS_RCD 29,SS_RCD_29_MAX
%define SS_RCD_30_MAX 800
	BSS_SS_RCD 30,SS_RCD_30_MAX
%define SS_RCD_31_MAX 800
	BSS_SS_RCD 31,SS_RCD_31_MAX
section .data
	GRM_DT: 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
	err_n: dq 0
 SS_LN_C: dq 0
	fmt_err_line: db "err:%x",10,0
	fmt_r64: db "%dr",0
	fmt_s8: db 34,"%s",34,0
	fmt_d: db "%d",0
	fmt_x: db "%x",0
	fmt_arr_l: db "{| ",0
	fmt_arr_r: db "|}",0
	fmt_rcd_l: db "{ ",0
	fmt_rcd_r: db "} ",0
	fmt_rcd_box_l: db "*{ "
	fmt_nl: db 10,0
	fmt_spc: db " ",0
	fmt_emt: db "_emt:",0
	fmt_getchar: db "_getchar:",0
	rt_err0: db "rt_err 0:",10,0 
 s8_e: dq 0,0

	fmt_info:
		db "info:",10
		db "SS_LN_C=%d",10
		db "SS_LN_N=%d",10
		db 0
	fmt_info_rcd:
		db "rcd %d",10
		db "SS_RCD_C=%d",10
		db "SS_RCD_N=%d",10
		db 0

fmt_sig_hdl:
	db "sig_hdl:",10
	db "signal number=%d",10
	db 0

LB_12: db 48,114,0
LB_14: db 48,114,0
LB_16: db 48,114,0
LB_18: db 10,0
LB_19: db 49,55,0
LB_20: db 75,75,0
LB_23: db 49,55,0
LB_86: db 39,48,226,151,130,0
LB_87: db 39,49,226,151,130,0
LB_88: db 39,50,226,151,130,0
LB_89: db 39,51,226,151,130,0
LB_199: db 39,48,226,151,130,0
LB_200: db 39,49,226,151,130,0
LB_374: db 39,48,226,151,130,0
LB_375: db 39,49,226,151,130,0
LB_385: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_387: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_394: db 34,100,108,116,32,97,114,114,97,121,34,0
LB_401: db 34,115,116,97,114,116,32,105,110,102,111,32,116,101,115,116,34,0
LB_407: db 59,32,226,136,142,124,10,101,120,110,32,49,49,51,54,51,58,10,0
LB_459: db 39,48,226,151,130,0
LB_461: db 39,49,226,151,130,0
LB_466: db 39,48,226,151,130,0
LB_468: db 39,49,226,151,130,0
LB_473: db 39,48,226,151,130,0
LB_475: db 39,49,226,151,130,0
LB_480: db 39,48,226,151,130,0
LB_481: db 39,49,226,151,130,0
LB_482: db 34,101,110,100,32,105,110,102,111,32,116,101,115,116,34,0
LB_491: db 39,48,226,151,130,0
LB_492: db 39,49,226,151,130,0
section .text
	unt: dq 0x0

	unt_0: dq 0x0 
	unt_1: dq 0x00_01_0000_0000_0000 
	unt_2: dq 0x00_02_0000_0000_0000 
	unt_3: dq 0x00_03_0000_0000_0000 
	unt_4: dq 0x00_04_0000_0000_0000 
	unt_5: dq 0x00_05_0000_0000_0000 
	unt_6: dq 0x00_06_0000_0000_0000 
	unt_7: dq 0x00_07_0000_0000_0000 
	unt_8: dq 0x00_08_0000_0000_0000 
	unt_9: dq 0x00_09_0000_0000_0000 
	unt_10: dq 0x00_0a_0000_0000_0000 
	unt_11: dq 0x00_0b_0000_0000_0000 
	unt_12: dq 0x00_0c_0000_0000_0000 

global _start

info:
	C_PUSH_REGS
	mov rdi,fmt_info 
	mov rsi,QWORD [SS_LN_C]
	mov rdx,SS_LN_N 
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

sig_hdl: ; rdi=sig_n rsi=siginfo_t* rdx=void*
	push rdi 
	push rsi 
	push rdx 
	xor rax,rax 
	mov rsi,rdi 
	mov rdi,fmt_sig_hdl
	C_CALL printf 
	call info 
	call exit 
	jmp err

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
	push rdi
	movzx rdi,BYTE [rdi]
	xor rax,rax 
	C_CALL isspace
	cmp rax,0
	jnz scf_d_err0 
	jmp scf_d_scf 
scf_d_err0: 
	add rsp,8
	mov rax,0
	ret
	scf_d_scf:
	mov rdi,QWORD [rsp]
	sub rsp,8
	mov rsi,rsp
	mov rdx,10
	mov rax,0
	C_CALL strtoul
	pop rsi
	pop rdi
	sub rsi,rdi
	jz scf_d_err1
 mov rdi,rax
	mov rax,1 
	ret
scf_d_err1:
	mov rax,0 
	ret

scf_x: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	push rdi
	movzx rdi,BYTE [rdi]
	xor rax,rax 
	C_CALL isspace
	cmp rax,0
	jnz scf_x_err0 
	jmp scf_x_scf 
scf_x_err0: 
	add rsp,8
	mov rax,0
	ret
	scf_x_scf:
	mov rdi,QWORD [rsp]
	sub rsp,8
	mov rsi,rsp
	mov rdx,16
	mov rax,0
	C_CALL strtoul
	pop rsi
	pop rdi
	sub rsi,rdi
	jz scf_x_err1
	mov rdi,rax
	mov rax,1 
	ret
scf_x_err1:
	mov rax,0 
	ret

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

out_fn: ; rdi=fn,rsi=src
	push rsi 
	mov rax,2
	mov rsi,0x42
	syscall
	pop rsi 
	push rax
	mov rdi,rax
	mov rdx,QWORD [rsi]
	mov rax,0x0000_ffff_ffff_ffff
	and rdx,rax
	add rsi,8
	mov rax,1
	syscall
	pop rdi
	mov rax,3
	syscall
	ret

emt_stg: ; rdi=stg 
	xor rax,rax 
	C_CALL_SF printf
	ret

emt_r64: ;rdi=r64
	xor rax,rax 
	mov rsi,rdi
	mov rdi,fmt_r64
	C_CALL_SF printf
	ret

emt_s8: ;rdi=s8
	xor rax,rax 
	lea rsi,[rdi+8]
	mov rdi,fmt_s8
	C_CALL_SF printf
	ret

emt_add: ; rdi=len rsi=stg
	cld 
	push rcx 
	mov rcx,rdi 
	mov rax,QWORD [EMT_BUF_OFS]
	add rdi,rax
	cmp rdi,EMT_BUF_MAX 
	jge emt_add_buf 
	mov BYTE [EMT_BUF+rdi],0
	mov QWORD [EMT_BUF_OFS],rdi
	lea rdi,[EMT_BUF+rax]
	jmp emt_add_end 
emt_add_buf:
	push rsi 
	call emt_buf 
	pop rsi 
	cmp rcx,EMT_BUF_MAX
	jge emt_add_stg 
	mov BYTE [EMT_BUF+rcx],0
	mov QWORD [EMT_BUF_OFS],rcx 
	mov rdi,EMT_BUF
emt_add_end:
	rep movsb 
	pop rcx 
	ret 
emt_add_stg 
	mov QWORD [EMT_BUF],0
	mov QWORD [EMT_BUF_OFS],0
	mov rdi,rsi 
	call emt_stg 
	pop rcx 
	ret 

emt_buf:
	xor rax,rax 
	mov rdi,EMT_BUF 
	C_CALL printf 
	mov QWORD [EMT_BUF_OFS],0
	mov BYTE [EMT_BUF],0
	ret 
	 
_start:
; set signal handler 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 

SS_init:
	mov QWORD [SS_TOP],SS_VCT
	mov rdi,0 
	mov rax,SS_VCT 
SS_lp: 
	cmp rdi,SS_MAX 
	jz SS_end 
	add rdi,1 
	lea rsi,[rax+8*16] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_lp 
SS_end:
	mov rsi,SS_NULL 
	mov [rax],rsi

SS_LN_init:
	mov SS_LN_N,0
	mov QWORD [SS_LN_TOP],SS_LN_VCT
	mov r15,SS_LN_VCT 
	mov rdi,0 
	mov rax,SS_LN_VCT 
SS_LN_lp: 
	cmp rdi,SS_LN_MAX 
	jz SS_LN_end 
	add rdi,1 
	lea rsi,[rax+8*2] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_LN_lp 
SS_LN_end:
	mov rsi,0xffff_ffff_ffff_0100 
	mov [rax],rsi

SS_PT_init:
	mov QWORD [SS_PT_TOP],SS_PT_VCT
	mov rdi,0 
	mov rax,SS_PT_VCT 
SS_PT_lp: 
	cmp rdi,SS_MAX 
	jz SS_PT_end 
	add rdi,1 
	lea rsi,[rax+8*3] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_PT_lp 
SS_PT_end:
	mov rsi,0xffff_ffff_ffff_0200 
	mov [rax],rsi

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
	mov r13,rbx
	

init_ss_rcd_1:
	mov QWORD [SS_RCD_N+8*1],0
	mov QWORD [SS_RCD_C+8*1],0
	mov QWORD [SS_RCD_1_TOP],SS_RCD_1_VCT
	mov rdi,0 
	mov rax,SS_RCD_1_VCT
ss_lp_rcd_1:
	cmp rdi,SS_RCD_1_MAX
	jz ss_end_rcd_1
	add rdi,1 
	lea rsi,[rax+8*2]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_1
ss_end_rcd_1:
	mov rsi,-65535
	mov [rax],rsi 

init_ss_rcd_2:
	mov QWORD [SS_RCD_N+8*2],0
	mov QWORD [SS_RCD_C+8*2],0
	mov QWORD [SS_RCD_2_TOP],SS_RCD_2_VCT
	mov rdi,0 
	mov rax,SS_RCD_2_VCT
ss_lp_rcd_2:
	cmp rdi,SS_RCD_2_MAX
	jz ss_end_rcd_2
	add rdi,1 
	lea rsi,[rax+8*3]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_2
ss_end_rcd_2:
	mov rsi,-65534
	mov [rax],rsi 

init_ss_rcd_3:
	mov QWORD [SS_RCD_N+8*3],0
	mov QWORD [SS_RCD_C+8*3],0
	mov QWORD [SS_RCD_3_TOP],SS_RCD_3_VCT
	mov rdi,0 
	mov rax,SS_RCD_3_VCT
ss_lp_rcd_3:
	cmp rdi,SS_RCD_3_MAX
	jz ss_end_rcd_3
	add rdi,1 
	lea rsi,[rax+8*4]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_3
ss_end_rcd_3:
	mov rsi,-65533
	mov [rax],rsi 

init_ss_rcd_4:
	mov QWORD [SS_RCD_N+8*4],0
	mov QWORD [SS_RCD_C+8*4],0
	mov QWORD [SS_RCD_4_TOP],SS_RCD_4_VCT
	mov rdi,0 
	mov rax,SS_RCD_4_VCT
ss_lp_rcd_4:
	cmp rdi,SS_RCD_4_MAX
	jz ss_end_rcd_4
	add rdi,1 
	lea rsi,[rax+8*5]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_4
ss_end_rcd_4:
	mov rsi,-65532
	mov [rax],rsi 

init_ss_rcd_5:
	mov QWORD [SS_RCD_N+8*5],0
	mov QWORD [SS_RCD_C+8*5],0
	mov QWORD [SS_RCD_5_TOP],SS_RCD_5_VCT
	mov rdi,0 
	mov rax,SS_RCD_5_VCT
ss_lp_rcd_5:
	cmp rdi,SS_RCD_5_MAX
	jz ss_end_rcd_5
	add rdi,1 
	lea rsi,[rax+8*6]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_5
ss_end_rcd_5:
	mov rsi,-65531
	mov [rax],rsi 

init_ss_rcd_6:
	mov QWORD [SS_RCD_N+8*6],0
	mov QWORD [SS_RCD_C+8*6],0
	mov QWORD [SS_RCD_6_TOP],SS_RCD_6_VCT
	mov rdi,0 
	mov rax,SS_RCD_6_VCT
ss_lp_rcd_6:
	cmp rdi,SS_RCD_6_MAX
	jz ss_end_rcd_6
	add rdi,1 
	lea rsi,[rax+8*7]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_6
ss_end_rcd_6:
	mov rsi,-65530
	mov [rax],rsi 

init_ss_rcd_7:
	mov QWORD [SS_RCD_N+8*7],0
	mov QWORD [SS_RCD_C+8*7],0
	mov QWORD [SS_RCD_7_TOP],SS_RCD_7_VCT
	mov rdi,0 
	mov rax,SS_RCD_7_VCT
ss_lp_rcd_7:
	cmp rdi,SS_RCD_7_MAX
	jz ss_end_rcd_7
	add rdi,1 
	lea rsi,[rax+8*8]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_7
ss_end_rcd_7:
	mov rsi,-65529
	mov [rax],rsi 

init_ss_rcd_8:
	mov QWORD [SS_RCD_N+8*8],0
	mov QWORD [SS_RCD_C+8*8],0
	mov QWORD [SS_RCD_8_TOP],SS_RCD_8_VCT
	mov rdi,0 
	mov rax,SS_RCD_8_VCT
ss_lp_rcd_8:
	cmp rdi,SS_RCD_8_MAX
	jz ss_end_rcd_8
	add rdi,1 
	lea rsi,[rax+8*9]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_8
ss_end_rcd_8:
	mov rsi,-65528
	mov [rax],rsi 

init_ss_rcd_9:
	mov QWORD [SS_RCD_N+8*9],0
	mov QWORD [SS_RCD_C+8*9],0
	mov QWORD [SS_RCD_9_TOP],SS_RCD_9_VCT
	mov rdi,0 
	mov rax,SS_RCD_9_VCT
ss_lp_rcd_9:
	cmp rdi,SS_RCD_9_MAX
	jz ss_end_rcd_9
	add rdi,1 
	lea rsi,[rax+8*10]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_9
ss_end_rcd_9:
	mov rsi,-65527
	mov [rax],rsi 

init_ss_rcd_10:
	mov QWORD [SS_RCD_N+8*10],0
	mov QWORD [SS_RCD_C+8*10],0
	mov QWORD [SS_RCD_10_TOP],SS_RCD_10_VCT
	mov rdi,0 
	mov rax,SS_RCD_10_VCT
ss_lp_rcd_10:
	cmp rdi,SS_RCD_10_MAX
	jz ss_end_rcd_10
	add rdi,1 
	lea rsi,[rax+8*11]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_10
ss_end_rcd_10:
	mov rsi,-65526
	mov [rax],rsi 

init_ss_rcd_11:
	mov QWORD [SS_RCD_N+8*11],0
	mov QWORD [SS_RCD_C+8*11],0
	mov QWORD [SS_RCD_11_TOP],SS_RCD_11_VCT
	mov rdi,0 
	mov rax,SS_RCD_11_VCT
ss_lp_rcd_11:
	cmp rdi,SS_RCD_11_MAX
	jz ss_end_rcd_11
	add rdi,1 
	lea rsi,[rax+8*12]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_11
ss_end_rcd_11:
	mov rsi,-65525
	mov [rax],rsi 

init_ss_rcd_12:
	mov QWORD [SS_RCD_N+8*12],0
	mov QWORD [SS_RCD_C+8*12],0
	mov QWORD [SS_RCD_12_TOP],SS_RCD_12_VCT
	mov rdi,0 
	mov rax,SS_RCD_12_VCT
ss_lp_rcd_12:
	cmp rdi,SS_RCD_12_MAX
	jz ss_end_rcd_12
	add rdi,1 
	lea rsi,[rax+8*13]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_12
ss_end_rcd_12:
	mov rsi,-65524
	mov [rax],rsi 

init_ss_rcd_13:
	mov QWORD [SS_RCD_N+8*13],0
	mov QWORD [SS_RCD_C+8*13],0
	mov QWORD [SS_RCD_13_TOP],SS_RCD_13_VCT
	mov rdi,0 
	mov rax,SS_RCD_13_VCT
ss_lp_rcd_13:
	cmp rdi,SS_RCD_13_MAX
	jz ss_end_rcd_13
	add rdi,1 
	lea rsi,[rax+8*14]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_13
ss_end_rcd_13:
	mov rsi,-65523
	mov [rax],rsi 

init_ss_rcd_14:
	mov QWORD [SS_RCD_N+8*14],0
	mov QWORD [SS_RCD_C+8*14],0
	mov QWORD [SS_RCD_14_TOP],SS_RCD_14_VCT
	mov rdi,0 
	mov rax,SS_RCD_14_VCT
ss_lp_rcd_14:
	cmp rdi,SS_RCD_14_MAX
	jz ss_end_rcd_14
	add rdi,1 
	lea rsi,[rax+8*15]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_14
ss_end_rcd_14:
	mov rsi,-65522
	mov [rax],rsi 

init_ss_rcd_15:
	mov QWORD [SS_RCD_N+8*15],0
	mov QWORD [SS_RCD_C+8*15],0
	mov QWORD [SS_RCD_15_TOP],SS_RCD_15_VCT
	mov rdi,0 
	mov rax,SS_RCD_15_VCT
ss_lp_rcd_15:
	cmp rdi,SS_RCD_15_MAX
	jz ss_end_rcd_15
	add rdi,1 
	lea rsi,[rax+8*16]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_15
ss_end_rcd_15:
	mov rsi,-65521
	mov [rax],rsi 

init_ss_rcd_16:
	mov QWORD [SS_RCD_N+8*16],0
	mov QWORD [SS_RCD_C+8*16],0
	mov QWORD [SS_RCD_16_TOP],SS_RCD_16_VCT
	mov rdi,0 
	mov rax,SS_RCD_16_VCT
ss_lp_rcd_16:
	cmp rdi,SS_RCD_16_MAX
	jz ss_end_rcd_16
	add rdi,1 
	lea rsi,[rax+8*17]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_16
ss_end_rcd_16:
	mov rsi,-65520
	mov [rax],rsi 

init_ss_rcd_17:
	mov QWORD [SS_RCD_N+8*17],0
	mov QWORD [SS_RCD_C+8*17],0
	mov QWORD [SS_RCD_17_TOP],SS_RCD_17_VCT
	mov rdi,0 
	mov rax,SS_RCD_17_VCT
ss_lp_rcd_17:
	cmp rdi,SS_RCD_17_MAX
	jz ss_end_rcd_17
	add rdi,1 
	lea rsi,[rax+8*18]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_17
ss_end_rcd_17:
	mov rsi,-65519
	mov [rax],rsi 

init_ss_rcd_18:
	mov QWORD [SS_RCD_N+8*18],0
	mov QWORD [SS_RCD_C+8*18],0
	mov QWORD [SS_RCD_18_TOP],SS_RCD_18_VCT
	mov rdi,0 
	mov rax,SS_RCD_18_VCT
ss_lp_rcd_18:
	cmp rdi,SS_RCD_18_MAX
	jz ss_end_rcd_18
	add rdi,1 
	lea rsi,[rax+8*19]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_18
ss_end_rcd_18:
	mov rsi,-65518
	mov [rax],rsi 

init_ss_rcd_19:
	mov QWORD [SS_RCD_N+8*19],0
	mov QWORD [SS_RCD_C+8*19],0
	mov QWORD [SS_RCD_19_TOP],SS_RCD_19_VCT
	mov rdi,0 
	mov rax,SS_RCD_19_VCT
ss_lp_rcd_19:
	cmp rdi,SS_RCD_19_MAX
	jz ss_end_rcd_19
	add rdi,1 
	lea rsi,[rax+8*20]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_19
ss_end_rcd_19:
	mov rsi,-65517
	mov [rax],rsi 

init_ss_rcd_20:
	mov QWORD [SS_RCD_N+8*20],0
	mov QWORD [SS_RCD_C+8*20],0
	mov QWORD [SS_RCD_20_TOP],SS_RCD_20_VCT
	mov rdi,0 
	mov rax,SS_RCD_20_VCT
ss_lp_rcd_20:
	cmp rdi,SS_RCD_20_MAX
	jz ss_end_rcd_20
	add rdi,1 
	lea rsi,[rax+8*21]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_20
ss_end_rcd_20:
	mov rsi,-65516
	mov [rax],rsi 

init_ss_rcd_21:
	mov QWORD [SS_RCD_N+8*21],0
	mov QWORD [SS_RCD_C+8*21],0
	mov QWORD [SS_RCD_21_TOP],SS_RCD_21_VCT
	mov rdi,0 
	mov rax,SS_RCD_21_VCT
ss_lp_rcd_21:
	cmp rdi,SS_RCD_21_MAX
	jz ss_end_rcd_21
	add rdi,1 
	lea rsi,[rax+8*22]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_21
ss_end_rcd_21:
	mov rsi,-65515
	mov [rax],rsi 

init_ss_rcd_22:
	mov QWORD [SS_RCD_N+8*22],0
	mov QWORD [SS_RCD_C+8*22],0
	mov QWORD [SS_RCD_22_TOP],SS_RCD_22_VCT
	mov rdi,0 
	mov rax,SS_RCD_22_VCT
ss_lp_rcd_22:
	cmp rdi,SS_RCD_22_MAX
	jz ss_end_rcd_22
	add rdi,1 
	lea rsi,[rax+8*23]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_22
ss_end_rcd_22:
	mov rsi,-65514
	mov [rax],rsi 

init_ss_rcd_23:
	mov QWORD [SS_RCD_N+8*23],0
	mov QWORD [SS_RCD_C+8*23],0
	mov QWORD [SS_RCD_23_TOP],SS_RCD_23_VCT
	mov rdi,0 
	mov rax,SS_RCD_23_VCT
ss_lp_rcd_23:
	cmp rdi,SS_RCD_23_MAX
	jz ss_end_rcd_23
	add rdi,1 
	lea rsi,[rax+8*24]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_23
ss_end_rcd_23:
	mov rsi,-65513
	mov [rax],rsi 

init_ss_rcd_24:
	mov QWORD [SS_RCD_N+8*24],0
	mov QWORD [SS_RCD_C+8*24],0
	mov QWORD [SS_RCD_24_TOP],SS_RCD_24_VCT
	mov rdi,0 
	mov rax,SS_RCD_24_VCT
ss_lp_rcd_24:
	cmp rdi,SS_RCD_24_MAX
	jz ss_end_rcd_24
	add rdi,1 
	lea rsi,[rax+8*25]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_24
ss_end_rcd_24:
	mov rsi,-65512
	mov [rax],rsi 

init_ss_rcd_25:
	mov QWORD [SS_RCD_N+8*25],0
	mov QWORD [SS_RCD_C+8*25],0
	mov QWORD [SS_RCD_25_TOP],SS_RCD_25_VCT
	mov rdi,0 
	mov rax,SS_RCD_25_VCT
ss_lp_rcd_25:
	cmp rdi,SS_RCD_25_MAX
	jz ss_end_rcd_25
	add rdi,1 
	lea rsi,[rax+8*26]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_25
ss_end_rcd_25:
	mov rsi,-65511
	mov [rax],rsi 

init_ss_rcd_26:
	mov QWORD [SS_RCD_N+8*26],0
	mov QWORD [SS_RCD_C+8*26],0
	mov QWORD [SS_RCD_26_TOP],SS_RCD_26_VCT
	mov rdi,0 
	mov rax,SS_RCD_26_VCT
ss_lp_rcd_26:
	cmp rdi,SS_RCD_26_MAX
	jz ss_end_rcd_26
	add rdi,1 
	lea rsi,[rax+8*27]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_26
ss_end_rcd_26:
	mov rsi,-65510
	mov [rax],rsi 

init_ss_rcd_27:
	mov QWORD [SS_RCD_N+8*27],0
	mov QWORD [SS_RCD_C+8*27],0
	mov QWORD [SS_RCD_27_TOP],SS_RCD_27_VCT
	mov rdi,0 
	mov rax,SS_RCD_27_VCT
ss_lp_rcd_27:
	cmp rdi,SS_RCD_27_MAX
	jz ss_end_rcd_27
	add rdi,1 
	lea rsi,[rax+8*28]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_27
ss_end_rcd_27:
	mov rsi,-65509
	mov [rax],rsi 

init_ss_rcd_28:
	mov QWORD [SS_RCD_N+8*28],0
	mov QWORD [SS_RCD_C+8*28],0
	mov QWORD [SS_RCD_28_TOP],SS_RCD_28_VCT
	mov rdi,0 
	mov rax,SS_RCD_28_VCT
ss_lp_rcd_28:
	cmp rdi,SS_RCD_28_MAX
	jz ss_end_rcd_28
	add rdi,1 
	lea rsi,[rax+8*29]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_28
ss_end_rcd_28:
	mov rsi,-65508
	mov [rax],rsi 

init_ss_rcd_29:
	mov QWORD [SS_RCD_N+8*29],0
	mov QWORD [SS_RCD_C+8*29],0
	mov QWORD [SS_RCD_29_TOP],SS_RCD_29_VCT
	mov rdi,0 
	mov rax,SS_RCD_29_VCT
ss_lp_rcd_29:
	cmp rdi,SS_RCD_29_MAX
	jz ss_end_rcd_29
	add rdi,1 
	lea rsi,[rax+8*30]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_29
ss_end_rcd_29:
	mov rsi,-65507
	mov [rax],rsi 

init_ss_rcd_30:
	mov QWORD [SS_RCD_N+8*30],0
	mov QWORD [SS_RCD_C+8*30],0
	mov QWORD [SS_RCD_30_TOP],SS_RCD_30_VCT
	mov rdi,0 
	mov rax,SS_RCD_30_VCT
ss_lp_rcd_30:
	cmp rdi,SS_RCD_30_MAX
	jz ss_end_rcd_30
	add rdi,1 
	lea rsi,[rax+8*31]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_30
ss_end_rcd_30:
	mov rsi,-65506
	mov [rax],rsi 

init_ss_rcd_31:
	mov QWORD [SS_RCD_N+8*31],0
	mov QWORD [SS_RCD_C+8*31],0
	mov QWORD [SS_RCD_31_TOP],SS_RCD_31_VCT
	mov rdi,0 
	mov rax,SS_RCD_31_VCT
ss_lp_rcd_31:
	cmp rdi,SS_RCD_31_MAX
	jz ss_end_rcd_31
	add rdi,1 
	lea rsi,[rax+8*32]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_31
ss_end_rcd_31:
	mov rsi,-65505
	mov [rax],rsi 
	jmp RTM_0
LB_0: ;; #34 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
JMP_0:
;; rsp=0 , %1~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %2~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_2: ;; #35 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
JMP_2:
;; rsp=0 , %4~1'(= r ) %3~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %5~0'(= r ) %4~1'(= r ) 
; #11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %6~1'(= r ) %5~0'(= r ) 
; #11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %7~1'(= r ) %5~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
; {| 110.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_3: ;; #40 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
JMP_3:
;; rsp=0 , %26~0'(= r ) 
	cmp r13,0
	jnz LB_6
	jmp LB_5
LB_6:
	jmp LB_4
LB_5:
;; rsp=0 , %26~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 10.. |}
	mov r13,1
; mov_ptn2.
; .add_rsp 0
	ret
LB_4:
	cmp r13,1
	jnz LB_9
	jmp LB_8
LB_9:
	jmp LB_7
LB_8:
;; rsp=0 , %26~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_7:
;; rsp=0 , %26~0'(= r ) 
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r14,rax
;; rsp=0 , %28~1'(= r ) %27~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %29~0'(= r ) %28~1'(= r ) 
; #40 0'(= r ) ⊢ 0'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 1000000010.. |}
; mov_ptn2.
	call LB_3
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %30~0'(= r ) %28~1'(= r ) 
; #15 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
	imul r14,r13
;; rsp=0 , %32~0'(= r ) %31~1'(= r ) 
; ∎ 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; {| 110.. |}
	mov r13,r14
; mov_ptn2.
; .add_rsp 0
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %33~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #11 %[ 0r ] ⊢ %[ 1r ]
;; rsp=0 , %34~%[ 1r ] %0~0'(= {| {| l |}|} ) 
; #34 %[ 1r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 1000000010.. |}
	mov r13,1
; mov_ptn2.
	call LB_0
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %37~%[ 4r ] %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #34 %[ 4r ] ⊢ 2'(= r )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 %[ 4r ] ⊢ 0'(= r )
; {| 10000000110.. |}
	mov r13,4
; mov_ptn2.
	call LB_0
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
; .dlt.ptn 2'(= r )
;; rsp=0 , %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1
LB_1:
;; rsp=0 , %39~1'(= r ) %36~%[ 3r ] %0~0'(= {| {| l |}|} ) 
; #35 { 1'(= r ) %[ 3r ] } ⊢ { 2'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { 1'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; {| 1100000010.. |}
	mov r13,r14
	mov r14,3
; mov_ptn2.
	call LB_2
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
; .dlt.ptn 1'(= r )
;; rsp=0 , %40~2'(= r ) %0~0'(= {| {| l |}|} ) 
; #40 2'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; {| 1010000010.. |}
	mov r13,r8
; mov_ptn2.
	call LB_3
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %42~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_10
LB_10:
;; rsp=0 , %43~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #40 1'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; {| 1100000010.. |}
	mov r13,r14
; mov_ptn2.
	call LB_3
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %44~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_11
LB_11:
; .dlt.ptn 1'(= r )
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
RTM_1:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %46~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 0r ] ⊢ %[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %48~%[ 0r ] %47~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_12
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_13
LB_13:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %48~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_14
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_15
LB_15:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_16
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_17
LB_17:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ { %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] }
; .dlt.ptn { %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] }
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_2
RTM_2:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; $ %[ 17r ] ⊢ %[ 17r ]
;; rsp=0 , %60~%[ 17r ] %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; ^ ,%[ 17r ] ⊢ ..
	mov rdi,0
; 0'
; 0'*"KK"
; 0'
; "\n"
	add rdi,39
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_18+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_19+2-1]
	mov rcx,2
	rep movsb
	mov rax,17
LB_21:
	cmp rax,0
	jz LB_22
	sub rax,1
	lea rsi,[LB_20+2-1]
	mov rcx,2
	rep movsb 
	jmp LB_21
LB_22:
	lea rsi,[LB_23+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %62~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_24
LB_24:
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_3
LB_25: ;; #41 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
JMP_25:
;; rsp=0 , %64~0'(= r ) 
	cmp r13,0
	jnz LB_28
	jmp LB_27
LB_28:
	jmp LB_26
LB_27:
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 10.. |}
	mov r13,1
; mov_ptn2.
; .add_rsp 0
	ret
LB_26:
	cmp r13,1
	jnz LB_31
	jmp LB_30
LB_31:
	jmp LB_29
LB_30:
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 10.. |}
	mov r13,1
; mov_ptn2.
; .add_rsp 0
	ret
LB_29:
;; rsp=0 , %64~0'(= r ) 
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r14,rax
;; rsp=0 , %66~1'(= r ) %65~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %67~0'(= r ) %66~1'(= r ) 
; #41 0'(= r ) ⊢ 0'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 1000000010.. |}
; mov_ptn2.
	call LB_25
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %68~0'(= r ) %66~1'(= r ) 
; #15 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
	imul r14,r13
;; rsp=0 , %70~0'(= r ) %69~1'(= r ) 
; ∎ 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; {| 110.. |}
	mov r13,r14
; mov_ptn2.
; .add_rsp 0
	ret
LB_33: ;; #42 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
JMP_33:
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
;;0'(= r )=<1'(= r )
	cmp r13,r14
	jg LB_36
	jmp LB_35
LB_36:
	jmp LB_34
LB_35:
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
; ∎ 2'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; {| 1010.. |}
	mov r13,r8
; mov_ptn2.
; .add_rsp 0
	ret
LB_34:
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
; $ 0'(= r ) ⊢ 0'(= r ),3'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r9,rax
;; rsp=0 , %75~3'(= r ) %74~0'(= r ) %73~2'(= r ) %72~1'(= r ) 
; $ 1'(= r ) ⊢ 1'(= r ),4'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r10,rax
;; rsp=0 , %77~4'(= r ) %76~1'(= r ) %75~3'(= r ) %74~0'(= r ) %73~2'(= r ) 
; $ 2'(= r ) ⊢ 2'(= r ),5'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r11,rax
;; rsp=0 , %79~5'(= r ) %78~2'(= r ) %77~4'(= r ) %76~1'(= r ) %75~3'(= r ) %74~0'(= r ) 
; #12 3'(= r ) ⊢ 3'(= r )
	sub r9,1
;; rsp=0 , %80~3'(= r ) %79~5'(= r ) %78~2'(= r ) %77~4'(= r ) %76~1'(= r ) %74~0'(= r ) 
; #42 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ 3'(= r )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111111001110.. |}
	mov r8,r11
	mov r14,r10
	mov r13,r9
; mov_ptn2.
	call LB_33
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %81~3'(= r ) %78~2'(= r ) %76~1'(= r ) %74~0'(= r ) 
; $ 0'(= r ) ⊢ 0'(= r ),4'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r10,rax
;; rsp=0 , %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) %78~2'(= r ) %76~1'(= r ) 
; $ 1'(= r ) ⊢ 1'(= r ),5'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r11,rax
;; rsp=0 , %85~5'(= r ) %84~1'(= r ) %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) %78~2'(= r ) 
; $ 2'(= r ) ⊢ 2'(= r ),6'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov rcx,rax
;; rsp=0 , %87~6'(= r ) %86~2'(= r ) %85~5'(= r ) %84~1'(= r ) %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) 
; #12 5'(= r ) ⊢ 5'(= r )
	sub r11,1
;; rsp=0 , %88~5'(= r ) %87~6'(= r ) %86~2'(= r ) %84~1'(= r ) %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) 
; #42 { 5'(= r ) 6'(= r ) 4'(= r ) } ⊢ 4'(= r )
	sub rsp,32
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
; .mov_ptn2 { 5'(= r ) 6'(= r ) 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110111011110.. |}
	mov r8,r10
	mov r14,rcx
	mov r13,r11
; mov_ptn2.
	call LB_33
	mov r9,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %89~4'(= r ) %86~2'(= r ) %84~1'(= r ) %82~0'(= r ) %81~3'(= r ) 
; #12 2'(= r ) ⊢ 2'(= r )
	sub r8,1
;; rsp=0 , %90~2'(= r ) %89~4'(= r ) %84~1'(= r ) %82~0'(= r ) %81~3'(= r ) 
; #42 { 2'(= r ) 0'(= r ) 1'(= r ) } ⊢ 0'(= r )
	sub rsp,16
	mov QWORD [rsp+0],r9
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 2'(= r ) 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 11100000110.. |}
	mov r9,r8
	mov r8,r14
	mov r14,r13
	mov r13,r9
; mov_ptn2.
	call LB_33
	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %91~0'(= r ) %89~4'(= r ) %81~3'(= r ) 
; #42 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ 0'(= r )
; .mov_ptn2 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111110.. |}
	mov r8,r13
	mov r14,r10
	mov r13,r9
; mov_ptn2.
	call LB_33
; .add_rsp 0
;; rsp=0 , %92~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_38: ;; #43 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 })
JMP_38:
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
;;0'(= r )=<1'(= r )
	cmp r13,r14
	jg LB_41
	jmp LB_40
LB_41:
	jmp LB_39
LB_40:
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; $ 2'(= r ) ⊢ 2'(= r ),3'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r9,rax
;; rsp=0 , %97~3'(= r ) %96~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; {| 11110.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_39:
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %98~0'(= r ) %95~2'(= r ) %94~1'(= r ) 
; #43 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
; mov_ptn2.
	call LB_38
; .add_rsp 0
;; rsp=0 , %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) %99~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %103~0'(= r ) %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) 
; #12 1'(= r ) ⊢ 1'(= r )
	sub r14,1
;; rsp=0 , %104~1'(= r ) %103~0'(= r ) %102~3'(= r ) %101~2'(= r ) 
; #43 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 4'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r9
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r9,r8
	mov r8,r13
	mov r13,r14
	mov r14,r9
; mov_ptn2.
	call LB_38
	mov r10,r9
	mov r9,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %108~4'(= r ) %107~2'(= r ) %106~1'(= r ) %105~0'(= r ) %102~3'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %109~0'(= r ) %108~4'(= r ) %107~2'(= r ) %106~1'(= r ) %102~3'(= r ) 
; #12 1'(= r ) ⊢ 1'(= r )
	sub r14,1
;; rsp=0 , %110~1'(= r ) %109~0'(= r ) %108~4'(= r ) %107~2'(= r ) %102~3'(= r ) 
; #43 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 5'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r9
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 11100000110.. |}
	mov r9,r8
	mov r8,r13
	mov r13,r14
	mov r14,r9
; mov_ptn2.
	call LB_38
	mov r10,QWORD [rsp-8+8*2]
	mov r11,r9
	mov r9,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %114~5'(= r ) %113~2'(= r ) %112~1'(= r ) %111~0'(= r ) %108~4'(= r ) %102~3'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %115~0'(= r ) %114~5'(= r ) %113~2'(= r ) %112~1'(= r ) %108~4'(= r ) %102~3'(= r ) 
; #43 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 6'(= r ) 5'(= r ) 4'(= r ) 3'(= r ) }
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111111001110.. |}
	mov r8,r11
	mov r14,r10
	mov r13,r9
; mov_ptn2.
	call LB_38
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %119~3'(= r ) %118~4'(= r ) %117~5'(= r ) %116~6'(= r ) %115~0'(= r ) %113~2'(= r ) %112~1'(= r ) 
; ∎ { 1'(= r ) 2'(= r ) 0'(= r ) 3'(= r ) }
; .dlt.ptn 4'(= r )
; .dlt.ptn 5'(= r )
; .dlt.ptn 6'(= r )
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) 3'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; {| 11110.. |}
	mov r10,r8
	mov r8,r13
	mov r13,r14
	mov r14,r10
; mov_ptn2.
; .add_rsp 0
	ret
RTM_3:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #41 %[ 5r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 %[ 5r ] ⊢ 0'(= r )
; {| 1000000010.. |}
	mov r13,5
; mov_ptn2.
	call LB_25
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %120~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_32
LB_32:
; .dlt.ptn 1'(= r )
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #42 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r8,0
	mov r14,10
	mov r13,20
; mov_ptn2.
	call LB_33
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %122~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_37
LB_37:
; .dlt.ptn 1'(= r )
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #43 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r8,0
	mov r14,10
	mov r13,20
; mov_ptn2.
	call LB_38
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %127~3'(= r ) %126~2'(= r ) %125~1'(= r ) %124~4'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_42
LB_42:
; .dlt.ptn { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_4
LB_43: ;; #44 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
JMP_43:
;; rsp=0 , %135~6'(= r ) %134~5'(= r ) %133~4'(= r ) %132~3'(= r ) %131~2'(= r ) %130~1'(= r ) %129~0'(= r ) 
; ∎ { 5'(= r ) 3'(= r ) 6'(= r ) 2'(= r ) 0'(= r ) 1'(= r ) 4'(= r ) }
; .mov_ptn2 { 5'(= r ) 3'(= r ) 6'(= r ) 2'(= r ) 0'(= r ) 1'(= r ) 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
; {| 11111110.. |}
	mov rdx,rcx
	mov rcx,r10
	sub rsp,8
	mov QWORD [rsp-8+8*1],r11
	mov r11,r14
	mov r10,r13
	sub rsp,8
	mov QWORD [rsp-8+8*1],r9
	mov r9,r8
	mov r8,rdx
	mov r14,QWORD [rsp-8+8*1]
	mov r13,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_44: ;; #46 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 })
JMP_44:
;; rsp=0 , %139~2'(= r ) %138~1'(= r ) %137~0'(= r ) 
; ∎ { 1'(= r ) 2'(= r ) 0'(= r ) }
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r9,r8
	mov r8,r13
	mov r13,r14
	mov r14,r9
; mov_ptn2.
; .add_rsp 0
	ret
LB_45: ;; #47 { } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) } : ({ }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
JMP_45:
;; rsp=0 , 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %140~%[ 0r ] 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 2r ] ⊢ %[ 2r ]
;; rsp=0 , %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 5r ] ⊢ %[ 5r ]
;; rsp=0 , %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 6r ] ⊢ %[ 6r ]
;; rsp=0 , %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 7r ] ⊢ %[ 7r ]
;; rsp=0 , %147~%[ 7r ] %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 8r ] ⊢ %[ 8r ]
;; rsp=0 , %148~%[ 8r ] %147~%[ 7r ] %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %149~%[ 9r ] %148~%[ 8r ] %147~%[ 7r ] %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %150~%[ 10r ] %149~%[ 9r ] %148~%[ 8r ] %147~%[ 7r ] %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
; ∎ { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] %[ 7r ] %[ 8r ] }
; .dlt.ptn %[ 10r ]
; .dlt.ptn %[ 9r ]
; .mov_ptn2 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] %[ 7r ] %[ 8r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) }
; {| 1111111110.. |}
	sub rsp,8
	mov QWORD [rsp-8+8*1],8
	mov rdx,7
	mov rcx,6
	mov r11,5
	mov r10,4
	mov r9,3
	mov r8,2
	mov r14,1
	mov r13,0
; mov_ptn2.
	push QWORD [rsp+8*1]
	ret
LB_46: ;; #48 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ })
	add rsp,8
JMP_46:
;; rsp=2 , %160~9'(= r ) %159~8'(= r ) %158~7'(= r ) %157~6'(= r ) %156~5'(= r ) %155~4'(= r ) %154~3'(= r ) %153~2'(= r ) %152~1'(= r ) %151~0'(= r ) 
; ∎ { }
; .dlt.ptn 9'(= r )
; .dlt.ptn 8'(= r )
; .dlt.ptn 7'(= r )
; .dlt.ptn 6'(= r )
; .dlt.ptn 5'(= r )
; .dlt.ptn 4'(= r )
; .dlt.ptn 3'(= r )
; .dlt.ptn 2'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_48: ;; #49 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
	add rsp,8
JMP_48:
;; rsp=2 , %170~9'(= r ) %169~8'(= r ) %168~7'(= r ) %167~6'(= r ) %166~5'(= r ) %165~4'(= r ) %164~3'(= r ) %163~2'(= r ) %162~1'(= r ) %161~0'(= r ) 
; ∎ { 5'(= r ) 3'(= r ) 9'(= r ) 7'(= r ) 8'(= r ) 0'(= r ) 1'(= r ) 6'(= r ) 4'(= r ) 2'(= r ) }
; .mov_ptn2 { 5'(= r ) 3'(= r ) 9'(= r ) 7'(= r ) 8'(= r ) 0'(= r ) 1'(= r ) 6'(= r ) 4'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) }
; {| 11111111110.. |}
	sub rsp,8
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*2],r8
	sub rsp,8
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*4],r10
	sub rsp,8
	mov QWORD [rsp-8+8*1],rdx
	mov rdx,rcx
	mov rcx,r14
	sub rsp,8
	mov QWORD [rsp-8+8*1],r11
	mov r11,r13
	mov r10,QWORD [rsp-8+8*3]
	sub rsp,8
	mov QWORD [rsp-8+8*1],r9
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*5]
	mov r14,QWORD [rsp-8+8*1]
	mov r13,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	push QWORD [rsp+8*2]
	ret
RTM_4:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 2r ] ⊢ %[ 2r ]
;; rsp=0 , %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 5r ] ⊢ %[ 5r ]
;; rsp=0 , %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 6r ] ⊢ %[ 6r ]
;; rsp=0 , %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 7r ] ⊢ %[ 7r ]
;; rsp=0 , %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 8r ] ⊢ %[ 8r ]
;; rsp=0 , %193~%[ 8r ] %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %195~%[ 10r ] %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #44 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] } ⊢ { 7'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
; {| 1111111010.. |}
	mov rcx,6
	mov r11,5
	mov r10,4
	mov r9,3
	mov r8,2
	mov r14,1
	mov r13,0
; mov_ptn2.
	call LB_43
	mov rdx,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %202~6'(= r ) %201~5'(= r ) %200~4'(= r ) %199~3'(= r ) %198~2'(= r ) %197~1'(= r ) %196~7'(= r ) %195~%[ 10r ] %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %0~0'(= {| {| l |}|} ) 
; #46 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 10'(= r ) 9'(= r ) 8'(= r ) }
	sub rsp,64
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
	mov QWORD [rsp+32],r10
	mov QWORD [rsp+40],r11
	mov QWORD [rsp+48],rcx
	mov QWORD [rsp+56],rdx
; .mov_ptn2 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 11100000111111110.. |}
	mov r8,10
	mov r14,9
	mov r13,8
; mov_ptn2.
	call LB_44
	mov rdx,QWORD [rsp-8+8*8]
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*8],r8
	mov r8,QWORD [rsp-8+8*3]
	mov QWORD [rsp-8+8*7],r14
	mov r14,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*6],r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 5
	add rsp,40
;; rsp=3 , %205~8'(= r ) %204~9'(= r ) %203~10'(= r ) %202~6'(= r ) %201~5'(= r ) %200~4'(= r ) %199~3'(= r ) %198~2'(= r ) %197~1'(= r ) %196~7'(= r ) %192~%[ 7r ] %0~0'(= {| {| l |}|} ) 
; #46 { %[ 7r ] 4'(= r ) 2'(= r ) } ⊢ { 11'(= r ) 4'(= r ) 2'(= r ) }
	sub rsp,48
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r9
	mov QWORD [rsp+24],r11
	mov QWORD [rsp+32],rcx
	mov QWORD [rsp+40],rdx
; .mov_ptn2 { %[ 7r ] 4'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111010001111111110.. |}
	mov r14,r10
	mov r13,7
; mov_ptn2.
	call LB_44
	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*6],r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 5
	add rsp,40
;; rsp=4 , %208~2'(= r ) %207~4'(= r ) %206~11'(= r ) %205~8'(= r ) %204~9'(= r ) %203~10'(= r ) %202~6'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %196~7'(= r ) %0~0'(= {| {| l |}|} ) 
; #47 { } ⊢ { 19'(= r ) 18'(= r ) 17'(= r ) 16'(= r ) 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
	sub rsp,64
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
	mov QWORD [rsp+32],r10
	mov QWORD [rsp+40],r11
	mov QWORD [rsp+48],rcx
	mov QWORD [rsp+56],rdx
; .mov_ptn2 { } ⊢ { }
; {| 000000001111111111110.. |}
; mov_ptn2.
	call LB_45
	mov rax,QWORD [rsp-8+8*10]
	mov QWORD [rsp-8+8*10],rdx
	mov rdx,rax
	mov rax,QWORD [rsp-8+8*9]
	mov QWORD [rsp-8+8*9],rcx
	mov rcx,rax
	mov rax,QWORD [rsp-8+8*8]
	mov QWORD [rsp-8+8*8],r11
	mov r11,rax
	mov rax,QWORD [rsp-8+8*7]
	mov QWORD [rsp-8+8*7],r10
	mov r10,rax
	mov rax,QWORD [rsp-8+8*6]
	mov QWORD [rsp-8+8*6],r9
	mov r9,rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [rsp-8+8*5],r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*4],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [rsp-8+8*3],r13
	mov r13,rax
;; rsp=14 , %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %212~16'(= r ) %211~17'(= r ) %210~18'(= r ) %209~19'(= r ) %208~2'(= r ) %207~4'(= r ) %206~11'(= r ) %205~8'(= r ) %204~9'(= r ) %203~10'(= r ) %202~6'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %196~7'(= r ) %0~0'(= {| {| l |}|} ) 
; #48 { %[ 1r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { }
	sub rsp,64
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
	mov QWORD [rsp+32],r10
	mov QWORD [rsp+40],r11
	mov QWORD [rsp+48],rcx
	mov QWORD [rsp+56],rdx
	push LB_47
	sub rsp,16
; .mov_ptn2 { %[ 1r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 31'(= r ) 32'(= r ) }
; {| 1111111111111111111101111111111110.. |}
	mov QWORD [rsp-8+8*1],0
	mov QWORD [rsp-8+8*2],0
	mov rdx,0
	mov rcx,0
	mov r11,0
	mov r10,0
	mov r9,0
	mov r8,0
	mov r14,0
	mov r13,1
; mov_ptn2.
	call LB_46
LB_47:
	mov rdx,QWORD [rsp-8+8*8]
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 8
	add rsp,64
;; rsp=14 , %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %212~16'(= r ) %211~17'(= r ) %210~18'(= r ) %209~19'(= r ) %208~2'(= r ) %207~4'(= r ) %206~11'(= r ) %205~8'(= r ) %204~9'(= r ) %203~10'(= r ) %202~6'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %196~7'(= r ) %0~0'(= {| {| l |}|} ) 
; #49 { 19'(= r ) 11'(= r ) 16'(= r ) 10'(= r ) 6'(= r ) 2'(= r ) 18'(= r ) 17'(= r ) 9'(= r ) 8'(= r ) } ⊢ { 17'(= r ) 16'(= r ) 2'(= r ) 11'(= r ) 10'(= r ) 9'(= r ) 6'(= r ) 8'(= r ) 29'(= r ) 30'(= r ) }
	sub rsp,48
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r9
	mov QWORD [rsp+24],r10
	mov QWORD [rsp+32],r11
	mov QWORD [rsp+40],rdx
	push LB_49
	sub rsp,16
; .mov_ptn2 { 19'(= r ) 11'(= r ) 16'(= r ) 10'(= r ) 6'(= r ) 2'(= r ) 18'(= r ) 17'(= r ) 9'(= r ) 8'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 29'(= r ) 30'(= r ) }
; {| 11111111111111111111011111111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*23]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*22]
	mov rdx,QWORD [rsp-8+8*14]
	mov QWORD [rsp-8+8*11],rcx
	mov rcx,QWORD [rsp-8+8*13]
	mov r11,r8
	mov r10,QWORD [rsp-8+8*11]
	mov r9,QWORD [rsp-8+8*21]
	mov r8,QWORD [rsp-8+8*15]
	mov r14,QWORD [rsp-8+8*20]
	mov r13,QWORD [rsp-8+8*12]
; mov_ptn2.
	call LB_48
LB_49:
	mov QWORD [rsp-8+8*23],rdx
	mov rdx,QWORD [rsp-8+8*9]
	mov QWORD [rsp-8+8*22],r11
	mov r11,QWORD [rsp-8+8*8]
	mov QWORD [rsp-8+8*21],r10
	mov r10,QWORD [rsp-8+8*7]
	mov QWORD [rsp-8+8*20],r9
	mov r9,QWORD [rsp-8+8*6]
	mov QWORD [rsp-8+8*15],r14
	mov r14,QWORD [rsp-8+8*5]
	mov QWORD [rsp-8+8*14],r13
	mov r13,QWORD [rsp-8+8*4]
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %196~7'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 7'(= r ) ⊢ 7'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,rdx
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_50
LB_50:
; .dlt.ptn 7'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_51
LB_51:
; .dlt.ptn 1'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 9'(= r ) ⊢ 9'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*22]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_52
LB_52:
; .dlt.ptn 9'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 3'(= r ) ⊢ 3'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_53
LB_53:
; .dlt.ptn 3'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 4'(= r ) ⊢ 4'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_54
LB_54:
; .dlt.ptn 4'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %201~5'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 5'(= r ) ⊢ 5'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_55
LB_55:
; .dlt.ptn 5'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 10'(= r ) ⊢ 10'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*21]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_56
LB_56:
; .dlt.ptn 10'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 16'(= r ) ⊢ 16'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*15]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_57
LB_57:
; .dlt.ptn 16'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %221~11'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 11'(= r ) ⊢ 11'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*20]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_58
LB_58:
; .dlt.ptn 11'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 29'(= r ) ⊢ 29'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_59
LB_59:
; .dlt.ptn 29'(= r )
;; rsp=23 , %227~30'(= r ) %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 30'(= r ) ⊢ 30'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_60
LB_60:
; .dlt.ptn 30'(= r )
;; rsp=23 , %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 17'(= r ) ⊢ 17'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*14]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_61
LB_61:
; .dlt.ptn 17'(= r )
;; rsp=23 , %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 6'(= r ) ⊢ 6'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,rcx
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_62
LB_62:
; .dlt.ptn 6'(= r )
;; rsp=23 , %225~8'(= r ) %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 8'(= r ) ⊢ 8'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,QWORD [rsp-8+8*23]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_63
LB_63:
; .dlt.ptn 8'(= r )
;; rsp=23 , %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= r ) ⊢ 2'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_64
LB_64:
; .dlt.ptn 2'(= r )
;; rsp=23 , %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; #10 { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) } ⊢ { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,QWORD [rsp-8+8*16]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,QWORD [rsp-8+8*17]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,QWORD [rsp-8+8*18]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,QWORD [rsp-8+8*19]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,QWORD [rsp-8+8*10]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_65
LB_65:
; .dlt.ptn { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_5
LB_66: ;; #58 0'(= {| l |} ) ⊢ 0'(= a13◂ [ ] ) : (_s8→_t13)
JMP_66:
;; rsp=0 , %244~0'(= {| l |} ) 
; #56 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %245~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a13◂ [ ] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	mov BYTE [r13+6],1
; mov_ptn2.
; .add_rsp 0
	ret
LB_68: ;; #59 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) } : (_t13→{ _t13 _r64 })
JMP_68:
;; rsp=0 , %246~0'(= a13◂ [ ] ) 
;; ? 0'(= a13◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_70
	jmp LB_71
LB_70:
	jmp LB_69
LB_71:
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
	mov r9, QWORD [r13+24]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=0 , %251~3'(= a13◂ [ ] ) %250~2'(= r ) %249~1'(= a13◂ [ ] ) 
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r13,rax
;; rsp=0 , %253~0'(= r ) %252~2'(= r ) %251~3'(= a13◂ [ ] ) %249~1'(= a13◂ [ ] ) 
; #57 { 1'(= a13◂ [ ] ) 0'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a13◂ [ ] ) 0'(= r ) 3'(= a13◂ [ ] ) }
;; rsp=0 , %254~0(<4)◂{ 1'(= a13◂ [ ] ) 0'(= r ) 3'(= a13◂ [ ] ) } %252~2'(= r ) 
; ∎ { 0(<4)◂{ 1'(= a13◂ [ ] ) 0'(= r ) 3'(= a13◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 1'(= a13◂ [ ] ) 0'(= r ) 3'(= a13◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; {| 11110.. |}
	mov r10,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r11,r14
	mov QWORD [r13+8],r11 
	mov r11,r10
	mov QWORD [r13+16],r11 
	mov r11,r9
	mov QWORD [r13+24],r11 
	mov BYTE [r13+6],0
	mov r14,r8
; mov_ptn2.
; .add_rsp 0
	ret
LB_69:
;; ? 0'(= a13◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
	mov rdi,r13
	cmp BYTE [rdi+6],1
	jnz LB_73
	jmp LB_74
LB_73:
	jmp LB_72
LB_74:
;; rsp=0 , %248~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r14,rsi
;; rsp=0 , %256~1'(= r ) %255~0'(= {| l |} ) 
; #56 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %257~1(<4)◂0'(= {| l |} ) %256~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r8,r13
	mov r13,r8
	mov BYTE [r13+6],1
; mov_ptn2.
; .add_rsp 0
	ret
LB_72:
;; ? 0'(= a13◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_76
	jmp LB_77
LB_76:
	jmp LB_75
LB_77:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %247~1'(= r ) 
; #54 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %258~3(<4)◂1'(= r ) 
; ∎ { 3(<4)◂1'(= r ) %[ 1r ] }
; .mov_ptn2 { 3(<4)◂1'(= r ) %[ 1r ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r13
	mov r13,rax
	mov r14,1
; mov_ptn2.
; .add_rsp 0
	ret
LB_75:
;; ?. 0'(= a13◂ [ ] ) ⊢ 2(<4)◂{ }
;; rsp=0 , 
; #55 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %259~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r14,0
	mov r13,unt_2
; mov_ptn2.
; .add_rsp 0
	ret
LB_67: ;; #64 { 0'(= a13◂ [ ] ) 1'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] ) : ({ _t13 _t13 }→_t13)
JMP_67:
;; rsp=0 , %295~1'(= a13◂ [ ] ) %294~0'(= a13◂ [ ] ) 
; #59 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 1000000010.. |}
; mov_ptn2.
	call LB_68
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %297~2'(= r ) %296~0'(= a13◂ [ ] ) %295~1'(= a13◂ [ ] ) 
; #59 1'(= a13◂ [ ] ) ⊢ { 3'(= a13◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r8
; .mov_ptn2 1'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 11000000110.. |}
	mov r13,r14
; mov_ptn2.
	call LB_68
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %299~1'(= r ) %298~3'(= a13◂ [ ] ) %297~2'(= r ) %296~0'(= a13◂ [ ] ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %301~1'(= r ) %300~2'(= r ) %298~3'(= a13◂ [ ] ) %296~0'(= a13◂ [ ] ) 
; #57 { 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
;; rsp=0 , %302~0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) } %301~1'(= r ) 
; ∎ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] )
; {| 10110.. |}
	mov r14,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r10,r14
	mov QWORD [r13+8],r10 
	mov r10,r8
	mov QWORD [r13+16],r10 
	mov r10,r9
	mov QWORD [r13+24],r10 
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
LB_78:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_84+8*rax]
LB_84: dq LB_80,LB_81,LB_82,LB_83
LB_80:
	mov rdi,LB_86
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_78
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_78
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_85
LB_81:
	mov rdi,LB_87
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_85
LB_82:
	mov rdi,LB_88
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_85
LB_83:
	mov rdi,LB_89
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_85
LB_85:
	ret
LB_90: ;; #60 { 0'(= a13◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a13◂ [ ] ) : ({ _t13 _s8 }→_t13)
JMP_90:
;; rsp=0 , %261~1'(= {| l |} ) %260~0'(= a13◂ [ ] ) 
; #9 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r8,rsi
;; rsp=0 , %263~2'(= r ) %262~1'(= {| l |} ) %260~0'(= a13◂ [ ] ) 
; #59 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 3'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r14
	mov QWORD [rsp+8],r8
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 10000000110.. |}
; mov_ptn2.
	call LB_68
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %265~3'(= r ) %264~0'(= a13◂ [ ] ) %263~2'(= r ) %262~1'(= {| l |} ) 
; #13 { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %267~3'(= r ) %266~2'(= r ) %264~0'(= a13◂ [ ] ) %262~1'(= {| l |} ) 
; #56 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %268~1(<4)◂1'(= {| l |} ) %267~3'(= r ) %266~2'(= r ) %264~0'(= a13◂ [ ] ) 
; #57 { 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
;; rsp=0 , %269~0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } %267~3'(= r ) 
; ∎ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
; .dlt.ptn 3'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a13◂ [ ] )
; {| 1110.. |}
	mov r9,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r10,r9
	mov QWORD [r13+8],r10 
	mov r10,r8
	mov QWORD [r13+16],r10 
	mov r10,r14
	mov BYTE [r10+6],1
	mov QWORD [r13+24],r10 
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
RTM_5:
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; #56 %[ "Hello" ] ⊢ 1(<4)◂%[ "Hello" ]
;; rsp=23 , %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #58 %[ "World" ] ⊢ 1'(= a13◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 %[ "World" ] ⊢ 0'(= {| l |} )
; {| 100000000000000000000000000000010.. |}
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],5
	mov BYTE [rax+8+0],87
	mov BYTE [rax+8+1],111
	mov BYTE [rax+8+2],114
	mov BYTE [rax+8+3],108
	mov BYTE [rax+8+4],100
	mov r13,rax
; mov_ptn2.
	call LB_66
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 24
	add rsp,192
;; rsp=0 , %343~1'(= a13◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #23 { } ⊢ 2'(= r )
	mov rdi,fmt_getchar 
	call emt_stg 
	xor rax,rax 
	C_CALL_SF getchar 
	mov r8,rax
; .dlt.ptn 2'(= r )
;; rsp=0 , %343~1'(= a13◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #64 { 1(<4)◂%[ "Hello" ] 1'(= a13◂ [ ] ) } ⊢ 1'(= a13◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { 1(<4)◂%[ "Hello" ] 1'(= a13◂ [ ] ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= a13◂ [ ] ) }
; {| 1100000010.. |}
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],5
	mov BYTE [rax+8+0],72
	mov BYTE [rax+8+1],101
	mov BYTE [rax+8+2],108
	mov BYTE [rax+8+3],108
	mov BYTE [rax+8+4],111
	mov r13,rax
	mov BYTE [r13+6],1
; mov_ptn2.
	call LB_67
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %345~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %345~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a13◂ [ ] ) ⊢ 1'(= a13◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_78
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_79
LB_79:
;; rsp=0 , %346~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #23 { } ⊢ 2'(= r )
	mov rdi,fmt_getchar 
	call emt_stg 
	xor rax,rax 
	C_CALL_SF getchar 
	mov r8,rax
; .dlt.ptn 2'(= r )
;; rsp=0 , %346~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #60 { 1'(= a13◂ [ ] ) %[ "!!" ] } ⊢ 1'(= a13◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { 1'(= a13◂ [ ] ) %[ "!!" ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) }
; {| 1100000010.. |}
	mov r13,r14
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],33
	mov BYTE [rax+8+1],33
	mov r14,rax
; mov_ptn2.
	call LB_90
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %348~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a13◂ [ ] ) ⊢ 1'(= a13◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_78
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_91
LB_91:
;; rsp=0 , %349~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #54 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %350~3(<4)◂%[ 44r ] %349~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #64 { 1'(= a13◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ 1'(= a13◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { 1'(= a13◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= a13◂ [ ] ) }
; {| 1100000010.. |}
	mov r13,r14
	mov r14,44
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r14
	mov r14,rax
; mov_ptn2.
	call LB_67
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %351~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a13◂ [ ] ) ⊢ 1'(= a13◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_78
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_92
LB_92:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_6
ETR_67:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_67
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_67:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_96
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_96
	add r14,1
	jmp LB_95
LB_96:
	jmp LB_94
LB_95:
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_98
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_97
LB_98:
; .dlt.ptn { }
	jmp LB_94
LB_97:
	jmp LB_100
LB_99:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_94
LB_100:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %355~1'(= r ) %354~0'(= r ) %353~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %356~0(<2)◂{ } %355~1'(= r ) %354~0'(= r ) %353~{ } 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
; mov_ptn2.
	jmp LB_101
LB_101:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_93
LB_94:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_93:
; discard r14
	add rsp,8
	ret
LB_111:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_116+8*rax]
LB_116: dq LB_112,LB_113,LB_114,LB_115
LB_112:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_111
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_111
	pop r8 
	FREE_RCD 3, r8
	jmp LB_117
LB_113:
	mov rdi,r8
	call free_s8
	jmp LB_117
LB_114:
	jmp LB_117
LB_115:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_117
LB_117:
	ret
LB_139: ;; #63 { 0'(= r ) 1'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] ) : ({ _r64 _t13 }→_t13)
JMP_139:
;; rsp=0 , %288~1'(= a13◂ [ ] ) %287~0'(= r ) 
; #59 1'(= a13◂ [ ] ) ⊢ { 2'(= a13◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 1100000010.. |}
	mov r13,r14
; mov_ptn2.
	call LB_68
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %290~1'(= r ) %289~2'(= a13◂ [ ] ) %287~0'(= r ) 
; #11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %291~1'(= r ) %289~2'(= a13◂ [ ] ) %287~0'(= r ) 
; #54 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %292~3(<4)◂0'(= r ) %291~1'(= r ) %289~2'(= a13◂ [ ] ) 
; #57 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a13◂ [ ] ) }
;; rsp=0 , %293~0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a13◂ [ ] ) } 
; ∎ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a13◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] )
; {| 1110.. |}
	mov r9,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r10,r9
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r10
	mov r10,rax
	mov QWORD [r13+8],r10 
	mov r10,r14
	mov QWORD [r13+16],r10 
	mov r10,r8
	mov QWORD [r13+24],r10 
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
ETR_68:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_68
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_68:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_106
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_106
	add r14,1
	jmp LB_105
LB_106:
	jmp LB_104
LB_105:
	call GRM_69
	cmp BYTE [r8+6],0
	jnz LB_108
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 8'(= a13◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_107
LB_108:
; .dlt.ptn { }
	jmp LB_104
LB_107:
	jmp LB_110
LB_109:
; .dlt.ptn 8'(= a13◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_111
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_104
LB_110:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %359~1'(= r ) %358~0'(= r ) %357~8'(= a13◂ [ ] ) 
; #26 8'(= a13◂ [ ] ) ⊢ 0(<2)◂8'(= a13◂ [ ] )
;; rsp=1 , %360~0(<2)◂8'(= a13◂ [ ] ) %359~1'(= r ) %358~0'(= r ) 
; ∎ 0(<2)◂8'(= a13◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= a13◂ [ ] ) ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_118
LB_118:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_103
LB_104:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_103:
; discard r14
	add rsp,8
	ret
ETR_69:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_69
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_69:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_123
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_123
	add r14,1
	jmp LB_122
LB_123:
	jmp LB_121
LB_122:
	jmp LB_125
LB_124:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_120
LB_125:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %363~1'(= r ) %362~0'(= r ) %361~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %364~1(<2)◂{ } %363~1'(= r ) %362~0'(= r ) %361~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_1
; mov_ptn2.
	jmp LB_126
LB_126:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_120
LB_121:
	mov r14,QWORD [rsp] 
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_130
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_130
	add r14,1
	jmp LB_129
LB_130:
	jmp LB_128
LB_129:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_132
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_131
LB_132:
; .dlt.ptn { }
	jmp LB_128
LB_131:
	call GRM_69
	cmp BYTE [r8+6],0
	jnz LB_134
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 9'(= a13◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_133
LB_134:
; .dlt.ptn 8'(= r )
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_128
LB_133:
	jmp LB_136
LB_135:
; .dlt.ptn 9'(= a13◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_111
	C_POP_REGS
; .dlt.ptn 8'(= r )
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	jmp LB_128
LB_136:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %368~1'(= r ) %367~0'(= r ) %366~9'(= a13◂ [ ] ) %365~8'(= r ) 
; #63 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ 2'(= a13◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a13◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_139
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %369~2'(= a13◂ [ ] ) %368~1'(= r ) %367~0'(= r ) 
; #26 2'(= a13◂ [ ] ) ⊢ 0(<2)◂2'(= a13◂ [ ] )
;; rsp=0 , %370~0(<2)◂2'(= a13◂ [ ] ) %368~1'(= r ) %367~0'(= r ) 
; ∎ 0(<2)◂2'(= a13◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a13◂ [ ] ) ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_137
LB_137:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_120
LB_128:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_142
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_142
	add r14,1
	jmp LB_141
LB_142:
	jmp LB_140
LB_141:
	jmp LB_144
LB_143:
; .dlt.ptn { }
	jmp LB_140
LB_144:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %372~1'(= r ) %371~0'(= r ) 
; #55 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %373~2(<4)◂{ } %372~1'(= r ) %371~0'(= r ) 
; #26 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %374~0(<2)◂2(<4)◂{ } %372~1'(= r ) %371~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_145
LB_145:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_120
LB_140:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_149
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_148
LB_149:
	jmp LB_147
LB_148:
	call GRM_69
	cmp BYTE [r8+6],0
	jnz LB_151
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 9'(= a13◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_150
LB_151:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_147
LB_150:
	jmp LB_153
LB_152:
; .dlt.ptn 9'(= a13◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_111
	C_POP_REGS
; .dlt.ptn 8'(= r )
; .add_rsp 2
	add rsp,16
	jmp LB_147
LB_153:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %378~1'(= r ) %377~0'(= r ) %376~9'(= a13◂ [ ] ) %375~8'(= r ) 
; #63 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ 2'(= a13◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a13◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_139
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %379~2'(= a13◂ [ ] ) %378~1'(= r ) %377~0'(= r ) 
; #26 2'(= a13◂ [ ] ) ⊢ 0(<2)◂2'(= a13◂ [ ] )
;; rsp=0 , %380~0(<2)◂2'(= a13◂ [ ] ) %378~1'(= r ) %377~0'(= r ) 
; ∎ 0(<2)◂2'(= a13◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a13◂ [ ] ) ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_154
LB_154:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_120
LB_147:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_120:
; discard r14
	add rsp,8
	ret
ETR_70:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_70
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_70:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_159
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_159
	add r14,1
	jmp LB_158
LB_159:
	jmp LB_157
LB_158:
	jmp LB_161
LB_160:
; .dlt.ptn { }
	jmp LB_157
LB_161:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %382~1'(= r ) %381~0'(= r ) 
; #26 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
;; rsp=0 , %383~0(<2)◂%[ 92r ] %382~1'(= r ) %381~0'(= r ) 
; ∎ 0(<2)◂%[ 92r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,92
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_162
LB_162:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_156
LB_157:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_166
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_166
	add r14,1
	jmp LB_165
LB_166:
	jmp LB_164
LB_165:
	jmp LB_168
LB_167:
; .dlt.ptn { }
	jmp LB_164
LB_168:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %385~1'(= r ) %384~0'(= r ) 
; #26 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
;; rsp=0 , %386~0(<2)◂%[ 34r ] %385~1'(= r ) %384~0'(= r ) 
; ∎ 0(<2)◂%[ 34r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,34
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_169
LB_169:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_156
LB_164:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_173
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_173
	add r14,1
	jmp LB_172
LB_173:
	jmp LB_171
LB_172:
	jmp LB_175
LB_174:
; .dlt.ptn { }
	jmp LB_171
LB_175:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %388~1'(= r ) %387~0'(= r ) 
; #26 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
;; rsp=0 , %389~0(<2)◂%[ 10r ] %388~1'(= r ) %387~0'(= r ) 
; ∎ 0(<2)◂%[ 10r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,10
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_176
LB_176:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_156
LB_171:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_180
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_180
	add r14,1
	jmp LB_179
LB_180:
	jmp LB_178
LB_179:
	jmp LB_182
LB_181:
; .dlt.ptn { }
	jmp LB_178
LB_182:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %391~1'(= r ) %390~0'(= r ) 
; #26 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
;; rsp=0 , %392~0(<2)◂%[ 9r ] %391~1'(= r ) %390~0'(= r ) 
; ∎ 0(<2)◂%[ 9r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_183
LB_183:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_156
LB_178:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_187
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_187
	add r14,1
	jmp LB_186
LB_187:
	jmp LB_185
LB_186:
	jmp LB_189
LB_188:
; .dlt.ptn { }
	jmp LB_185
LB_189:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %394~1'(= r ) %393~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %395~0(<2)◂%[ 0r ] %394~1'(= r ) %393~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_190
LB_190:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_156
LB_185:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_156:
; discard r14
	add rsp,8
	ret
LB_193:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_197+8*rax]
LB_197: dq LB_195,LB_196
LB_195:
	mov rdi,LB_199
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_78
	jmp LB_198
LB_196:
	mov rdi,LB_200
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_198
LB_198:
	ret
LB_205: ;; #65 { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t13 _s8 _r64 }→{ _t13 _s8 _r64 })
JMP_205:
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) %303~0'(= a13◂ [ ] ) 
;; ? 0'(= a13◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a13◂ [ ] ) 4'(= r ) 5'(= a13◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_207
	jmp LB_208
LB_207:
	jmp LB_206
LB_208:
	mov r9, QWORD [r13+8]
	mov r10, QWORD [r13+16]
	mov r11, QWORD [r13+24]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=0 , %310~5'(= a13◂ [ ] ) %309~4'(= r ) %308~3'(= a13◂ [ ] ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #65 { 3'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r10
	mov QWORD [rsp+8],r11
; .mov_ptn2 { 3'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11110000110.. |}
	mov r13,r9
; mov_ptn2.
	call LB_205
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %313~2'(= r ) %312~1'(= {| l |} ) %311~0'(= a13◂ [ ] ) %310~5'(= a13◂ [ ] ) %309~4'(= r ) 
; #65 { 5'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 5'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11100100110.. |}
	mov r13,r11
; mov_ptn2.
	call LB_205
	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %316~2'(= r ) %315~1'(= {| l |} ) %314~3'(= a13◂ [ ] ) %311~0'(= a13◂ [ ] ) %309~4'(= r ) 
; #57 { 0'(= a13◂ [ ] ) 4'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 4'(= r ) 3'(= a13◂ [ ] ) }
;; rsp=0 , %317~0(<4)◂{ 0'(= a13◂ [ ] ) 4'(= r ) 3'(= a13◂ [ ] ) } %316~2'(= r ) %315~1'(= {| l |} ) 
; ∎ { 0(<4)◂{ 0'(= a13◂ [ ] ) 4'(= r ) 3'(= a13◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 0'(= a13◂ [ ] ) 4'(= r ) 3'(= a13◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 111110.. |}
	mov r11,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov rcx,r11
	mov QWORD [r13+8],rcx 
	mov rcx,r10
	mov QWORD [r13+16],rcx 
	mov rcx,r9
	mov QWORD [r13+24],rcx 
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
LB_206:
;; ? 0'(= a13◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_210
	jmp LB_211
LB_210:
	jmp LB_209
LB_211:
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) 
; #55 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %318~2(<4)◂{ } %305~2'(= r ) %304~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r13,unt_2
; mov_ptn2.
; .add_rsp 0
	ret
LB_209:
;; ? 0'(= a13◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_213
	jmp LB_214
LB_213:
	jmp LB_212
LB_214:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %307~3'(= r ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #18 { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r8
	jle err
	mov rsi,r8
	mov rdi,r9
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %321~3'(= r ) %320~2'(= r ) %319~1'(= {| l |} ) 
; #11 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %322~2'(= r ) %321~3'(= r ) %319~1'(= {| l |} ) 
; #54 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %323~3(<4)◂3'(= r ) %322~2'(= r ) %319~1'(= {| l |} ) 
; ∎ { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11110.. |}
	mov r13,r9
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_212:
;; ?. 0'(= a13◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %306~0'(= {| l |} ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r9,rsi
;; rsp=0 , %325~3'(= r ) %324~0'(= {| l |} ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #21 { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
	mov rax,r9
	mov rsi,r13
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	add rsi,8
	cmp rdi,0
	jl err
	add rsi,0
	mov QWORD [REP_MOVSB_VCT],rsi 
	mov rsi,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	add rsi,8 
	sub rdi,rax 
	cmp rdi,r8
	jl err
	add rsi,r8
	mov rdi,rsi 
	mov rsi,QWORD [REP_MOVSB_VCT]
	push rcx 
	mov rcx,rax 
	cld 
	rep movsb
	pop rcx 
;; rsp=0 , %330~2'(= r ) %329~1'(= {| l |} ) %328~%[ 0r ] %327~0'(= {| l |} ) %326~3'(= r ) 
; #56 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %331~1(<4)◂0'(= {| l |} ) %330~2'(= r ) %329~1'(= {| l |} ) %328~%[ 0r ] %326~3'(= r ) 
; #13 { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %333~3'(= r ) %332~2'(= r ) %331~1(<4)◂0'(= {| l |} ) %329~1'(= {| l |} ) %328~%[ 0r ] 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .dlt.ptn 3'(= r )
; .dlt.ptn %[ 0r ]
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r9,r13
	mov r13,r9
	mov BYTE [r13+6],1
; mov_ptn2.
; .add_rsp 0
	ret
LB_204: ;; #66 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) } : (_t13→{ _t13 _s8 })
JMP_204:
;; rsp=0 , %334~0'(= a13◂ [ ] ) 
; #59 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 10.. |}
; mov_ptn2.
	call LB_68
; .add_rsp 0
;; rsp=0 , %336~1'(= r ) %335~0'(= a13◂ [ ] ) 
; #8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %338~2'(= {| l |} ) %337~1'(= r ) %335~0'(= a13◂ [ ] ) 
; #65 { 0'(= a13◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a13◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 { 0'(= a13◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110000010.. |}
	mov r9,r8
	mov r8,0
	mov r14,r9
; mov_ptn2.
	call LB_205
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %341~2'(= r ) %340~3'(= {| l |} ) %339~0'(= a13◂ [ ] ) %337~1'(= r ) 
; ∎ { 0'(= a13◂ [ ] ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= r )
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= a13◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) }
; {| 11010.. |}
	mov r14,r9
; mov_ptn2.
; .add_rsp 0
	ret
LB_192: ;; #71 { } ⊢ { } : ({ }→{ })
JMP_192:
;; rsp=0 , 
; #68 { %[ "\"Ho\\\"o\"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a13◂ [ ]] ) }
; .mov_ptn2 { %[ "\"Ho\\\"o\"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 110.. |}
	mov r14,0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],7
	mov BYTE [rax+8+0],34
	mov BYTE [rax+8+1],72
	mov BYTE [rax+8+2],111
	mov BYTE [rax+8+3],92
	mov BYTE [rax+8+4],34
	mov BYTE [rax+8+5],111
	mov BYTE [rax+8+6],34
	mov r13,rax
; mov_ptn2.
	call ETR_68
; .add_rsp 0
;; rsp=0 , %398~2'(= a3◂ [ a13◂ [ ]] ) %397~1'(= r ) %396~0'(= {| l |} ) 
; #10 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a13◂ [ ]] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a13◂ [ ]] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_193
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_194
LB_194:
;; rsp=0 , %401~2'(= a3◂ [ a13◂ [ ]] ) %400~1'(= r ) %399~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a13◂ [ ]] ) ⊢ 0(<2)◂3'(= a13◂ [ ] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_202
	jmp LB_203
LB_202:
	jmp LB_201
LB_203:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %402~3'(= a13◂ [ ] ) %400~1'(= r ) %399~0'(= {| l |} ) 
; #66 3'(= a13◂ [ ] ) ⊢ { 3'(= a13◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 10010000110.. |}
	mov r13,r9
; mov_ptn2.
	call LB_204
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %404~2'(= {| l |} ) %403~3'(= a13◂ [ ] ) %400~1'(= r ) %399~0'(= {| l |} ) 
; #10 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_215
LB_215:
;; rsp=0 , %405~2'(= {| l |} ) %403~3'(= a13◂ [ ] ) %400~1'(= r ) %399~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 3'(= a13◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_111
	C_POP_REGS
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_201:
;; ?. 2'(= a3◂ [ a13◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %400~1'(= r ) %399~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
RTM_6:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #71 { } ⊢ { }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 00000000110.. |}
; mov_ptn2.
	call LB_192
	mov r14,QWORD [rsp-8+8*2]
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
; .dlt.ptn { }
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_7
ETR_72:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_72
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_72:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_219
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_219
	add r14,1
	jmp LB_218
LB_219:
	jmp LB_217
LB_218:
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_221
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_220
LB_221:
; .dlt.ptn { }
	jmp LB_217
LB_220:
	jmp LB_223
LB_222:
; .dlt.ptn 8'(= r )
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_217
LB_223:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %409~1'(= r ) %408~0'(= r ) %407~8'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=1 , %410~0(<2)◂%[ 0r ] %409~1'(= r ) %408~0'(= r ) %407~8'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_224
LB_224:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_216
LB_217:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_228
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_228
	add r14,1
	jmp LB_227
LB_228:
	jmp LB_226
LB_227:
	jmp LB_230
LB_229:
; .dlt.ptn { }
	jmp LB_226
LB_230:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %412~1'(= r ) %411~0'(= r ) 
; #26 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %413~0(<2)◂%[ 1r ] %412~1'(= r ) %411~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_231
LB_231:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_216
LB_226:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_216:
; discard r14
	add rsp,8
	ret
ETR_73:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_73
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_73:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_236
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_236
	add r14,1
	jmp LB_235
LB_236:
	jmp LB_234
LB_235:
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_238
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_237
LB_238:
; .dlt.ptn { }
	jmp LB_234
LB_237:
	jmp LB_240
LB_239:
; .dlt.ptn 8'(= r )
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_234
LB_240:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %416~1'(= r ) %415~0'(= r ) %414~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %417~0(<2)◂8'(= r ) %416~1'(= r ) %415~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_241
LB_241:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_233
LB_234:
	mov r14,QWORD [rsp]
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_245
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_244
LB_245:
	jmp LB_243
LB_244:
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_247
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_246
LB_247:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_243
LB_246:
	jmp LB_249
LB_248:
; .dlt.ptn 9'(= r )
; .dlt.ptn 8'(= r )
; .add_rsp 2
	add rsp,16
	jmp LB_243
LB_249:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %421~1'(= r ) %420~0'(= r ) %419~9'(= r ) %418~8'(= r ) 
; #13 { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %423~9'(= r ) %422~8'(= r ) %421~1'(= r ) %420~0'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=2 , %424~0(<2)◂8'(= r ) %423~9'(= r ) %421~1'(= r ) %420~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 9'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*2]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_250
LB_250:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_233
LB_243:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_233:
; discard r14
	add rsp,8
	ret
ETR_74:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_74
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_74:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_255
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
	jnz LB_255
	add r14,1
	jmp LB_254
LB_255:
	jmp LB_253
LB_254:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_257
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
	jnz LB_257
	add r14,1
	jmp LB_256
LB_257:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_252
LB_256:
	jmp LB_259
LB_258:
; .dlt.ptn { }
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_252
LB_259:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %426~1'(= r ) %425~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %427~0(<2)◂%[ 0r ] %426~1'(= r ) %425~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_260
LB_260:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_252
LB_253:
	mov r14,QWORD [rsp] 
	cmp r14,r9
	jge LB_264
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_263
LB_264:
	jmp LB_262
LB_263:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_266
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_266
	add r14,1
	jmp LB_265
LB_266:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_262
LB_265:
	jmp LB_268
LB_267:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_262
LB_268:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %430~1'(= r ) %429~0'(= r ) %428~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %431~0(<2)◂8'(= r ) %430~1'(= r ) %429~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_269
LB_269:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_252
LB_262:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_252:
; discard r14
	add rsp,8
	ret
ETR_75:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_75
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_75:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_274
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_274
	add r14,1
	jmp LB_273
LB_274:
	jmp LB_272
LB_273:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_280
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_280
	add r14,1
	jmp LB_279
LB_280:
	jmp LB_278
LB_279:
	jmp LB_282
LB_281:
; .dlt.ptn { }
	jmp LB_278
LB_282:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %435~1'(= r ) %434~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %436~0(<2)◂%[ 0r ] %435~1'(= r ) %434~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_283
LB_283:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_277
LB_278:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_287
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_287
	add r14,1
	jmp LB_286
LB_287:
	jmp LB_285
LB_286:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_293
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_293
	add r14,1
	jmp LB_292
LB_293:
	jmp LB_291
LB_292:
	jmp LB_295
LB_294:
; .dlt.ptn { }
	jmp LB_291
LB_295:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %440~1'(= r ) %439~0'(= r ) 
; #26 %[ 3r ] ⊢ 0(<2)◂%[ 3r ]
;; rsp=0 , %441~0(<2)◂%[ 3r ] %440~1'(= r ) %439~0'(= r ) 
; ∎ 0(<2)◂%[ 3r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,3
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_296
LB_296:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_290
LB_291:
	mov r14,QWORD [rsp]
	call GRM_75
	cmp BYTE [r8+6],0
	jnz LB_300
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_299
LB_300:
	jmp LB_298
LB_299:
	jmp LB_302
LB_301:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_298
LB_302:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %444~1'(= r ) %443~0'(= r ) %442~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %445~0(<2)◂8'(= r ) %444~1'(= r ) %443~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_303
LB_303:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_290
LB_298:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_290:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_288
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_289
LB_288:
; .dlt.ptn { }
	jmp LB_285
LB_289:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %446~3'(= r ) %438~1'(= r ) %437~0'(= r ) 
; #26 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %447~0(<2)◂%[ 1r ] %446~3'(= r ) %438~1'(= r ) %437~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 3'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_305
LB_305:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_277
LB_285:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_277:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_275
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_276
LB_275:
; .dlt.ptn { }
	jmp LB_272
LB_276:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %448~3'(= r ) %433~1'(= r ) %432~0'(= r ) 
; #26 3'(= r ) ⊢ 0(<2)◂3'(= r )
;; rsp=0 , %449~0(<2)◂3'(= r ) %433~1'(= r ) %432~0'(= r ) 
; ∎ 0(<2)◂3'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_307
LB_307:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_271
LB_272:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_311
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
	jnz LB_311
	add r14,1
	jmp LB_310
LB_311:
	jmp LB_309
LB_310:
	jmp LB_313
LB_312:
; .dlt.ptn { }
	jmp LB_309
LB_313:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %451~1'(= r ) %450~0'(= r ) 
; #26 %[ 2r ] ⊢ 0(<2)◂%[ 2r ]
;; rsp=0 , %452~0(<2)◂%[ 2r ] %451~1'(= r ) %450~0'(= r ) 
; ∎ 0(<2)◂%[ 2r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_314
LB_314:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_271
LB_309:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_271:
; discard r14
	add rsp,8
	ret
ETR_76:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_76
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_76:
	push r14
	jmp LB_319
LB_318:
	add r14,1 
LB_319:
	cmp r14,r9
	jge LB_320
	JZ_LINE_SPC BYTE [r13+8+r14], LB_318
LB_320:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_322
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],97
	jnz LB_322
	add r14,1
	jmp LB_321
LB_322:
	jmp LB_317
LB_321:
	jmp LB_324
LB_323:
	add r14,1 
LB_324:
	cmp r14,r9
	jge LB_325
	JZ_LINE_SPC BYTE [r13+8+r14], LB_323
LB_325:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_327
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_327
	add r14,1
	jmp LB_326
LB_327:
; .dlt.ptn { }
	jmp LB_317
LB_326:
	jmp LB_329
LB_328:
	add r14,1 
LB_329:
	cmp r14,r9
	jge LB_330
	JZ_LINE_SPC BYTE [r13+8+r14], LB_328
LB_330:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_332
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_332
	add r14,1
	jmp LB_331
LB_332:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_317
LB_331:
	jmp LB_334
LB_333:
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_317
LB_334:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %454~1'(= r ) %453~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %455~0(<2)◂%[ 0r ] %454~1'(= r ) %453~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_335
LB_335:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_316
LB_317:
	mov r14,QWORD [rsp]
	jmp LB_339
LB_338:
	add r14,1 
LB_339:
	cmp r14,r9
	jge LB_340
	JZ_SPC BYTE [r13+8+r14], LB_338
LB_340:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_342
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_342
	add r14,1
	jmp LB_341
LB_342:
	jmp LB_337
LB_341:
	jmp LB_344
LB_343:
	add r14,1 
LB_344:
	cmp r14,r9
	jge LB_345
	JZ_SPC BYTE [r13+8+r14], LB_343
LB_345:
	call GRM_76
	cmp BYTE [r8+6],0
	jnz LB_347
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_346
LB_347:
; .dlt.ptn { }
	jmp LB_337
LB_346:
	jmp LB_349
LB_348:
	add r14,1 
LB_349:
	cmp r14,r9
	jge LB_350
	JZ_SPC BYTE [r13+8+r14], LB_348
LB_350:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_352
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],122
	jnz LB_352
	add r14,1
	jmp LB_351
LB_352:
; .dlt.ptn 8'(= r )
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_337
LB_351:
	jmp LB_354
LB_353:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_337
LB_354:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %458~1'(= r ) %457~0'(= r ) %456~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %459~0(<2)◂8'(= r ) %458~1'(= r ) %457~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_355
LB_355:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_316
LB_337:
	mov r14,QWORD [rsp]
	call GRM_76
	cmp BYTE [r8+6],0
	jnz LB_359
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_358
LB_359:
	jmp LB_357
LB_358:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_361
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_361
	add r14,1
	jmp LB_360
LB_361:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_357
LB_360:
	call GRM_75
	cmp BYTE [r8+6],0
	jnz LB_363
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_362
LB_363:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_357
LB_362:
	jmp LB_365
LB_364:
; .dlt.ptn 9'(= r )
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
; .add_rsp 2
	add rsp,16
	jmp LB_357
LB_365:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %463~1'(= r ) %462~0'(= r ) %461~9'(= r ) %460~8'(= r ) 
; #26 9'(= r ) ⊢ 0(<2)◂9'(= r )
;; rsp=2 , %464~0(<2)◂9'(= r ) %463~1'(= r ) %462~0'(= r ) %460~8'(= r ) 
; ∎ 0(<2)◂9'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 00100000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_366
LB_366:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_316
LB_357:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_316:
; discard r14
	add rsp,8
	ret
LB_368:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_372+8*rax]
LB_372: dq LB_370,LB_371
LB_370:
	mov rdi,LB_374
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_373
LB_371:
	mov rdi,LB_375
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_373
LB_373:
	ret
LB_376:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_379+8*rax]
LB_379: dq LB_377,LB_378
LB_377:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_380
LB_378:
	jmp LB_380
LB_380:
	ret
RTM_7:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #73 { %[ "ABAB" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "ABAB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 11000000110.. |}
	mov r14,0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],4
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],66
	mov r13,rax
; mov_ptn2.
	call ETR_73
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %467~2'(= a3◂ [ r] ) %466~3'(= r ) %465~4'(= {| l |} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_368
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_369
LB_369:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_376
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #74 { %[ "sY" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "sY" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 11000000110.. |}
	mov r14,0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],115
	mov BYTE [rax+8+1],89
	mov r13,rax
; mov_ptn2.
	call ETR_74
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %471~2'(= a3◂ [ r] ) %470~3'(= r ) %469~4'(= {| l |} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_368
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_381
LB_381:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_376
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #75 { %[ "AB" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "AB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 11000000110.. |}
	mov r14,0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov r13,rax
; mov_ptn2.
	call ETR_75
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %475~2'(= a3◂ [ r] ) %474~3'(= r ) %473~4'(= {| l |} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_368
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_382
LB_382:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_376
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #75 { %[ "ACACe" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "ACACe" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 11000000110.. |}
	mov r14,0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],5
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],67
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],67
	mov BYTE [rax+8+4],101
	mov r13,rax
; mov_ptn2.
	call ETR_75
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %479~2'(= a3◂ [ r] ) %478~3'(= r ) %477~4'(= {| l |} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_368
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_383
LB_383:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_376
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #76 { %[ " a bc d" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ " a bc d" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 11000000110.. |}
	mov r14,0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],7
	mov BYTE [rax+8+0],32
	mov BYTE [rax+8+1],97
	mov BYTE [rax+8+2],32
	mov BYTE [rax+8+3],98
	mov BYTE [rax+8+4],99
	mov BYTE [rax+8+5],32
	mov BYTE [rax+8+6],100
	mov r13,rax
; mov_ptn2.
	call ETR_76
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %483~2'(= a3◂ [ r] ) %482~3'(= r ) %481~4'(= {| l |} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_368
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_384
LB_384:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_376
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_385
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_386
LB_386:
; .dlt.ptn %[ "dd\t\n\"J  " ]
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_8
LB_389: ;; #77 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
JMP_389:
;; rsp=0 , %486~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %487~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %488~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
RTM_8:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; ^  ⊢ ..
	mov rdi,0
; "Hello  World !!\n"
	add rdi,16
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_387+16-1]
	mov rcx,16
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %489~2'(= {| l |} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_388
LB_388:
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #77 %[ 3r ] ⊢ 2'(= r )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 %[ 3r ] ⊢ 0'(= r )
; {| 10000000110.. |}
	mov r13,3
; mov_ptn2.
	call LB_389
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %491~2'(= r ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #8 2'(= r ) ⊢ { 2'(= r ) 3'(= {| l |} ) }
	mov rdi,r8
	call mlc_s8
	mov r9,rax
;; rsp=0 , %493~3'(= {| l |} ) %492~2'(= r ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 { 2'(= r ) 3'(= {| l |} ) } ⊢ { 2'(= r ) 3'(= {| l |} ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_390
LB_390:
; .dlt.ptn { 2'(= r ) 3'(= {| l |} ) }
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_9
RTM_9:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #0 { %[ 7r ] %[ "Fu" ] } ⊢ { %[ 7r ] %[ "Fu" ] 2'(= {| {| l |}|} ) }
	mov rdi,7
	push rdi 
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov r8,rax
	mov QWORD [rax],rdi 
LB_391:
	cmp rdi,0 
	jz LB_392
	sub rdi,1
	mov r10,rdi
; .mov_ptn2 %[ "Fu" ] ⊢ 3'(= {| l |} )
; {| 111110.. |}
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],70
	mov BYTE [rax+8+1],117
	mov r9,rax
; mov_ptn2.
	mov rsi,r8
	mov rax,r9
	mov rdi,r10
	mov QWORD [rsi+8+8*rdi],rax 
	jmp LB_391
LB_392:
; .dlt.ptn %[ "Fu" ]
; .dlt.ptn %[ 7r ]
;; rsp=0 , %506~2'(= {| {| l |}|} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #1 { 2'(= {| {| l |}|} ) %[ 1r ] %[ "Xo" ] } ⊢ { 2'(= {| {| l |}|} ) %[ 1r ] 4'(= {| l |} ) }
; .mov_ptn2 %[ "Xo" ] ⊢ 3'(= {| l |} )
; {| 11110.. |}
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],88
	mov BYTE [rax+8+1],111
	mov r9,rax
; mov_ptn2.
	mov rax,1
	mov rdi,r8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err
	lea rdi,[rdi+8+8*rax]
	mov rax,QWORD [rdi]
	mov rsi,r9
	mov QWORD [rdi],rsi 
	mov r9,rax
; .mov_ptn2 3'(= {| l |} ) ⊢ 4'(= {| l |} )
; {| 111110.. |}
	mov r10,r9
; mov_ptn2.
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn %[ 1r ]
;; rsp=0 , %507~2'(= {| {| l |}|} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #4 { 2'(= {| {| l |}|} ) %[ 3r ] } ⊢ { 2'(= {| {| l |}|} ) %[ 3r ] 4'(= {| l |} ) }
	mov rax,3
	mov rdi,r8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err 
	mov rdi,[rdi+8+8*rax]
	C_PUSH_REGS
	mov r8,rdi
	C_PUSH_REGS
	mov rdi,r8  
	call rpc_s8  
	C_POP_REGS
	C_POP_REGS
	mov r9,rax
; .mov_ptn2 3'(= {| l |} ) ⊢ 4'(= {| l |} )
; {| 111110.. |}
	mov r10,r9
; mov_ptn2.
; .dlt.ptn %[ 3r ]
;; rsp=0 , %512~4'(= {| l |} ) %510~2'(= {| {| l |}|} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 4'(= {| l |} ) ⊢ 4'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_393
LB_393:
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %510~2'(= {| {| l |}|} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "dlt array" ] ⊢ %[ "dlt array" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_394
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_395
LB_395:
; .dlt.ptn %[ "dlt array" ]
;; rsp=0 , %510~2'(= {| {| l |}|} ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= {| {| l |}|} ) ⊢ 2'(= {| {| l |}|} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
LB_396:
	cmp rsi,rax 
	jz LB_397
	push r8 
	push rsi 
	push rax 
	mov r8,QWORD [r8+8+8*rax]
	mov rdi,r8
	call emt_s8
	mov rdi,fmt_spc 
	call emt_stg 
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_396
LB_397:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_398
LB_398:
; .dlt.ptn 2'(= {| {| l |}|} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
LB_399:
	cmp rsi,0
	jz LB_400
	push r8 
	push rsi 
	mov r8,QWORD [r8+8*rsi]
	mov rdi,r8
	call free_s8
	pop rsi 
	pop r8 
	sub rsi,1 
	jmp LB_399
LB_400:
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_10
LB_403: ;; #80 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) : (_opn◂_opn◂_opn◂_opn◂_opn◂_r64→_opn◂_opn◂_opn◂_opn◂_opn◂_r64)
JMP_403:
;; rsp=0 , %516~0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) 
;; ? 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_405
	jmp LB_406
LB_405:
	jmp LB_404
LB_406:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %517~1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) 
; #26 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
;; rsp=0 , %518~0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) 
; ∎ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
; .mov_ptn2 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
; {| 110.. |}
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_404:
;; ?. 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	mov rdi,LB_407
	call emt_stg 
	jmp err
LB_409:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_412+8*rax]
LB_412: dq LB_410,LB_411
LB_410:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_414
	jmp LB_413
LB_411:
	jmp LB_413
LB_413:
	ret
LB_414:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_417+8*rax]
LB_417: dq LB_415,LB_416
LB_415:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_419
	jmp LB_418
LB_416:
	jmp LB_418
LB_418:
	ret
LB_419:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_422+8*rax]
LB_422: dq LB_420,LB_421
LB_420:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_424
	jmp LB_423
LB_421:
	jmp LB_423
LB_423:
	ret
LB_424:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_427+8*rax]
LB_427: dq LB_425,LB_426
LB_425:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_376
	jmp LB_428
LB_426:
	jmp LB_428
LB_428:
	ret
LB_408:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_431+8*rax]
LB_431: dq LB_429,LB_430
LB_429:
	mov r8,QWORD [r8+8]
	call LB_433
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_432
LB_430:
	mov rax,unt_1
	jmp LB_432
LB_432:
	ret
LB_433:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_436+8*rax]
LB_436: dq LB_434,LB_435
LB_434:
	mov r8,QWORD [r8+8]
	call LB_438
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_437
LB_435:
	mov rax,unt_1
	jmp LB_437
LB_437:
	ret
LB_438:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_441+8*rax]
LB_441: dq LB_439,LB_440
LB_439:
	mov r8,QWORD [r8+8]
	call LB_443
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_442
LB_440:
	mov rax,unt_1
	jmp LB_442
LB_442:
	ret
LB_443:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_446+8*rax]
LB_446: dq LB_444,LB_445
LB_444:
	mov r8,QWORD [r8+8]
	call LB_448
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_447
LB_445:
	mov rax,unt_1
	jmp LB_447
LB_447:
	ret
LB_448:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_451+8*rax]
LB_451: dq LB_449,LB_450
LB_449:
	mov r8,QWORD [r8+8]
	mov rax,r8
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_452
LB_450:
	mov rax,unt_1
	jmp LB_452
LB_452:
	ret
LB_453:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_457+8*rax]
LB_457: dq LB_455,LB_456
LB_455:
	mov rdi,LB_459
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_460
	jmp LB_458
LB_456:
	mov rdi,LB_461
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_458
LB_458:
	ret
LB_460:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_464+8*rax]
LB_464: dq LB_462,LB_463
LB_462:
	mov rdi,LB_466
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_467
	jmp LB_465
LB_463:
	mov rdi,LB_468
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_465
LB_465:
	ret
LB_467:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_471+8*rax]
LB_471: dq LB_469,LB_470
LB_469:
	mov rdi,LB_473
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_474
	jmp LB_472
LB_470:
	mov rdi,LB_475
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_472
LB_472:
	ret
LB_474:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_478+8*rax]
LB_478: dq LB_476,LB_477
LB_476:
	mov rdi,LB_480
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_368
	jmp LB_479
LB_477:
	mov rdi,LB_481
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_479
LB_479:
	ret
RTM_10:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "start info test" ] ⊢ %[ "start info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_401
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_402
LB_402:
; .dlt.ptn %[ "start info test" ]
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #26 %[ 8r ] ⊢ 0(<2)◂%[ 8r ]
;; rsp=0 , %520~0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #26 0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %521~0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #26 0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %522~0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #26 0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %523~0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #26 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %524~0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #80 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
; {| 10000000110.. |}
	mov r13,8
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
	call LB_403
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; $ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_408
	C_POP_REGS
	mov r9,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_408
	C_POP_REGS
	mov r10,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_408
	C_POP_REGS
	mov r11,rax
; .dlt.ptn 5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	call LB_409
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %526~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %526~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_453
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_454
LB_454:
; .dlt.ptn 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_409
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "end info test" ] ⊢ %[ "end info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_482
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_483
LB_483:
; .dlt.ptn %[ "end info test" ]
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_11
LB_484: ;; #85 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] ) : (_t14→_t14)
JMP_484:
;; rsp=0 , %532~0'(= a14◂ [ ] ) 
; ∎ 0'(= a14◂ [ ] )
; .mov_ptn2 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_485:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_489+8*rax]
LB_489: dq LB_487,LB_488
LB_487:
	mov rdi,LB_491
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_485
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_485
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_490
LB_488:
	mov rdi,LB_492
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_490
LB_490:
	ret
LB_493:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_496+8*rax]
LB_496: dq LB_494,LB_495
LB_494:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_493
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_493
	pop r8 
	FREE_RCD 3, r8
	jmp LB_497
LB_495:
	jmp LB_497
LB_497:
	ret
RTM_11:
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #81 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %538~1(<2)◂{ } %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #81 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %539~1(<2)◂{ } %538~1(<2)◂{ } %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #82 { 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %540~0(<2)◂{ 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } } %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #85 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } } ⊢ 2'(= a14◂ [ ] )
	sub rsp,32
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r9
	mov QWORD [rsp+24],r10
; .mov_ptn2 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } } ⊢ 0'(= a14◂ [ ] )
; {| 1000000011110.. |}
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,unt_1
	mov QWORD [r13+8],r14 
	mov r14,0
	mov QWORD [r13+16],r14 
	mov r14,unt_1
	mov QWORD [r13+24],r14 
	mov BYTE [r13+6],0
; mov_ptn2.
	call LB_484
	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %541~2'(= a14◂ [ ] ) %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %541~2'(= a14◂ [ ] ) %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= a14◂ [ ] ) ⊢ 2'(= a14◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_485
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_486
LB_486:
; .dlt.ptn 2'(= a14◂ [ ] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_493
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #83 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %543~1(<2)◂{ } %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_12
RTM_12:
	C_CALL exit

err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	C_CALL printf
	mov rax,1
	mov rbx,0
	int 0x80
