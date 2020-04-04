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
 
%macro PUSH_GRM 0 
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
%endmacro

%macro POP_GRM_SCC 0
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp]
	mov r13,QWORD [rsp+24]
	add rsp,32 
%endmacro 

%macro POP_GRM_FAIL 0
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	add rsp,32 
%endmacro 

%macro RB_GRM 0
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
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
%define SS_LN_N rbp
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
	unt_9: dq 0x00_08_0000_0000_0000 
	unt_10: dq 0x00_08_0000_0000_0000 
	unt_11: dq 0x00_08_0000_0000_0000 
	unt_12: dq 0x00_08_0000_0000_0000 

LB_11: db 48,114,0
LB_13: db 48,114,0
LB_15: db 48,114,0
LB_17: db 10,0
LB_18: db 49,55,0
LB_19: db 75,75,0
LB_22: db 49,55,0
LB_91: db 39,48,226,151,130,0
LB_92: db 39,49,226,151,130,0
LB_93: db 39,50,226,151,130,0
LB_94: db 39,51,226,151,130,0
LB_223: db 39,48,226,151,130,0
LB_224: db 39,49,226,151,130,0
LB_450: db 39,48,226,151,130,0
LB_451: db 39,49,226,151,130,0
LB_461: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_463: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_470: db 34,100,108,116,32,97,114,114,97,121,34,0
LB_477: db 34,115,116,97,114,116,32,105,110,102,111,32,116,101,115,116,34,0
LB_483: db 59,32,226,136,142,124,10,101,120,110,32,49,49,51,54,51,58,10,0
LB_535: db 39,48,226,151,130,0
LB_537: db 39,49,226,151,130,0
LB_542: db 39,48,226,151,130,0
LB_544: db 39,49,226,151,130,0
LB_549: db 39,48,226,151,130,0
LB_551: db 39,49,226,151,130,0
LB_556: db 39,48,226,151,130,0
LB_557: db 39,49,226,151,130,0
LB_558: db 34,101,110,100,32,105,110,102,111,32,116,101,115,116,34,0
LB_567: db 39,48,226,151,130,0
LB_568: db 39,49,226,151,130,0
section .text
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
ETR_39: ;; f5 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %24~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %25~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
ETR_40: ;; fact 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %26~0'(= r ) 
	cmp r13,0
	jnz LB_2
	jmp LB_1
LB_2:
	jmp LB_0
LB_1:
;; rsp=0 , %26~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 10.. |}
	mov r13,1
	ret
LB_0:
	cmp r13,1
	jnz LB_5
	jmp LB_4
LB_5:
	jmp LB_3
LB_4:
;; rsp=0 , %26~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
LB_3:
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
	call ETR_40
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %30~0'(= r ) %28~1'(= r ) 
; #15 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
	imul r14,r13
;; rsp=0 , %32~0'(= r ) %31~1'(= r ) 
; ∎ 1'(= r )
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; {| 110.. |}
	mov r13,r14
	ret
LB_6: ;; #34 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %1~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %2~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
LB_8: ;; #35 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
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
	call LB_6
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_6
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_7
LB_7:
;; rsp=0 , %39~1'(= r ) %36~%[ 3r ] %0~0'(= {| {| l |}|} ) 
; #35 { 1'(= r ) %[ 3r ] } ⊢ { 2'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { 1'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; {| 1100000010.. |}
	mov r13,r14
	mov r14,3
	call LB_8
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %40~2'(= r ) %0~0'(= {| {| l |}|} ) 
; #40 2'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; {| 1010000010.. |}
	mov r13,r8
	call ETR_40
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
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
	jmp LB_9
LB_9:
;; rsp=0 , %43~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #40 1'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; {| 1100000010.. |}
	mov r13,r14
	call ETR_40
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
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
	jmp LB_10
LB_10:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	mov rdi,LB_11
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_12
LB_12:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %48~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_13
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_14
LB_14:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_15
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_16
LB_16:
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
; .. //
	mov rdi,0
	add rdi,39
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_17+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_18+2-1]
	mov rcx,2
	rep movsb
	mov rax,17
LB_20:
	cmp rax,0
	jz LB_21
	sub rax,1
	lea rsi,[LB_19+2-1]
	mov rcx,2
	rep movsb 
	jmp LB_20
LB_21:
	lea rsi,[LB_22+2-1]
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
	jmp LB_23
LB_23:
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
ETR_41: ;; fact 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %64~0'(= r ) 
	cmp r13,0
	jnz LB_26
	jmp LB_25
LB_26:
	jmp LB_24
LB_25:
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 10.. |}
	mov r13,1
	ret
LB_24:
	cmp r13,1
	jnz LB_29
	jmp LB_28
LB_29:
	jmp LB_27
LB_28:
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 10.. |}
	mov r13,1
	ret
LB_27:
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
	call ETR_41
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %68~0'(= r ) %66~1'(= r ) 
; #15 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
	imul r14,r13
;; rsp=0 , %70~0'(= r ) %69~1'(= r ) 
; ∎ 1'(= r )
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; {| 110.. |}
	mov r13,r14
	ret
ETR_42: ;; tak { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
;;0'(= r )=<1'(= r )
	cmp r13,r14
	jg LB_32
	jmp LB_31
LB_32:
	jmp LB_30
LB_31:
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
; ∎ 2'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; {| 1010.. |}
	mov r13,r8
	ret
LB_30:
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
	call ETR_42
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call ETR_42
	mov r9,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call ETR_42
	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %91~0'(= r ) %89~4'(= r ) %81~3'(= r ) 
; #42 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ 0'(= r )
; .mov_ptn2 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111110.. |}
	mov r8,r13
	mov r14,r10
	mov r13,r9
	call ETR_42
;; rsp=0 , %92~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
ETR_43: ;; tak_v { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 })
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
;;0'(= r )=<1'(= r )
	cmp r13,r14
	jg LB_35
	jmp LB_34
LB_35:
	jmp LB_33
LB_34:
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
	ret
LB_33:
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %98~0'(= r ) %95~2'(= r ) %94~1'(= r ) 
; #43 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	call ETR_43
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
	call ETR_43
	mov r10,r9
	mov r9,QWORD [rsp-8+8*1]
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
	call ETR_43
	mov r10,QWORD [rsp-8+8*2]
	mov r11,r9
	mov r9,QWORD [rsp-8+8*1]
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
	call ETR_43
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %119~3'(= r ) %118~4'(= r ) %117~5'(= r ) %116~6'(= r ) %115~0'(= r ) %113~2'(= r ) %112~1'(= r ) 
; ∎ { 1'(= r ) 2'(= r ) 0'(= r ) 3'(= r ) }
; .dlt.ptn 4'(= r )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 5'(= r )
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 6'(= r )
	mov rdi,rcx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) 3'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; {| 11110.. |}
	mov r10,r8
	mov r8,r13
	mov r13,r14
	mov r14,r10
	ret
RTM_3:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #41 %[ 5r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 %[ 5r ] ⊢ 0'(= r )
; {| 1000000010.. |}
	mov r13,5
	call ETR_41
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
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
	jmp LB_36
LB_36:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #42 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r8,0
	mov r14,10
	mov r13,20
	call ETR_42
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
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
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #43 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r8,0
	mov r14,10
	mov r13,20
	call ETR_43
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
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
	jmp LB_38
LB_38:
; .dlt.ptn { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_4
LB_39: ;; #44 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
;; rsp=0 , %135~6'(= r ) %134~5'(= r ) %133~4'(= r ) %132~3'(= r ) %131~2'(= r ) %130~1'(= r ) %129~0'(= r ) 
; ∎ { 5'(= r ) 3'(= r ) 6'(= r ) 2'(= r ) 0'(= r ) 1'(= r ) 4'(= r ) }
; .mov_ptn2 { 5'(= r ) 3'(= r ) 6'(= r ) 2'(= r ) 0'(= r ) 1'(= r ) 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
; {| 11111110.. |}
	mov rdx,rcx
	mov rcx,r10
	mov r10,r11
	mov r11,r14
	mov r14,r10
	mov r10,r13
	mov r13,r9
	mov r9,r8
	mov r8,rdx
	mov rdx,r14
	mov r14,r13
	mov r13,r14
	ret
LB_40: ;; #46 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %139~2'(= r ) %138~1'(= r ) %137~0'(= r ) 
; ∎ { 1'(= r ) 2'(= r ) 0'(= r ) }
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r9,r8
	mov r8,r13
	mov r13,r14
	mov r14,r9
	ret
LB_41: ;; #47 { } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) } : ({ }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
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
	push QWORD [rsp+8*1]
	ret
LB_42: ;; #48 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ })
	add rsp,8
;; rsp=2 , %160~9'(= r ) %159~8'(= r ) %158~7'(= r ) %157~6'(= r ) %156~5'(= r ) %155~4'(= r ) %154~3'(= r ) %153~2'(= r ) %152~1'(= r ) %151~0'(= r ) 
; ∎ { }
; .dlt.ptn 9'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 7'(= r )
	mov rdi,rdx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 6'(= r )
	mov rdi,rcx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 5'(= r )
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 4'(= r )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 3'(= r )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
	add rsp,16
	ret
LB_44: ;; #49 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
	add rsp,8
;; rsp=2 , %170~9'(= r ) %169~8'(= r ) %168~7'(= r ) %167~6'(= r ) %166~5'(= r ) %165~4'(= r ) %164~3'(= r ) %163~2'(= r ) %162~1'(= r ) %161~0'(= r ) 
; ∎ { 5'(= r ) 3'(= r ) 9'(= r ) 7'(= r ) 8'(= r ) 0'(= r ) 1'(= r ) 6'(= r ) 4'(= r ) 2'(= r ) }
; .mov_ptn2 { 5'(= r ) 3'(= r ) 9'(= r ) 7'(= r ) 8'(= r ) 0'(= r ) 1'(= r ) 6'(= r ) 4'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) }
; {| 11111111110.. |}
	sub rsp,8
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*2],r8
	mov r8,QWORD [rsp-8+8*3]
	mov QWORD [rsp-8+8*3],r10
	mov r10,rdx
	mov rdx,rcx
	mov rcx,r14
	mov r14,r11
	mov r11,r13
	mov r13,r10
	mov r10,r8
	mov r8,r9
	mov r9,r13
	mov r13,r8
	mov r8,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*1],r14
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
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
	call LB_39
	mov rdx,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_40
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
	call LB_40
	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*6],r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_41
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
	push LB_43
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
	call LB_42
LB_43:
	mov rdx,QWORD [rsp-8+8*8]
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r13,QWORD [rsp-8+8*1]
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
	push LB_45
	sub rsp,16
; .mov_ptn2 { 19'(= r ) 11'(= r ) 16'(= r ) 10'(= r ) 6'(= r ) 2'(= r ) 18'(= r ) 17'(= r ) 9'(= r ) 8'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 29'(= r ) 30'(= r ) }
; {| 11111111111111111111011111111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*23]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*22]
	mov rdx,QWORD [rsp-8+8*14]
	mov QWORD [rsp-8+8*23],rcx
	mov rcx,QWORD [rsp-8+8*13]
	mov r11,r8
	mov r10,QWORD [rsp-8+8*23]
	mov r9,QWORD [rsp-8+8*21]
	mov r8,QWORD [rsp-8+8*15]
	mov r14,QWORD [rsp-8+8*20]
	mov r13,QWORD [rsp-8+8*12]
	call LB_44
LB_45:
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
	jmp LB_46
LB_46:
; .dlt.ptn 7'(= r )
	mov rdi,rdx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_47
LB_47:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_48
LB_48:
; .dlt.ptn 9'(= r )
	mov rdi,QWORD [rsp-8+8*22]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_49
LB_49:
; .dlt.ptn 3'(= r )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_50
LB_50:
; .dlt.ptn 4'(= r )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_51
LB_51:
; .dlt.ptn 5'(= r )
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_52
LB_52:
; .dlt.ptn 10'(= r )
	mov rdi,QWORD [rsp-8+8*21]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_53
LB_53:
; .dlt.ptn 16'(= r )
	mov rdi,QWORD [rsp-8+8*15]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_54
LB_54:
; .dlt.ptn 11'(= r )
	mov rdi,QWORD [rsp-8+8*20]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_55
LB_55:
; .dlt.ptn 29'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_56
LB_56:
; .dlt.ptn 30'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_57
LB_57:
; .dlt.ptn 17'(= r )
	mov rdi,QWORD [rsp-8+8*14]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_58
LB_58:
; .dlt.ptn 6'(= r )
	mov rdi,rcx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_59
LB_59:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*23]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_60
LB_60:
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	jmp LB_61
LB_61:
; .dlt.ptn { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
	mov rdi,QWORD [rsp-8+8*16]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*17]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*18]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*19]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*10]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_5
ETR_65: ;; mk_s8_i { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t13 _s8 _r64 }→{ _t13 _s8 _r64 })
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) %303~0'(= a13◂ [ ] ) 
;; ? 0'(= a13◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a13◂ [ ] ) 4'(= r ) 5'(= a13◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_63
	jmp LB_64
LB_63:
	jmp LB_62
LB_64:
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
	call ETR_65
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %313~2'(= r ) %312~1'(= {| l |} ) %311~0'(= a13◂ [ ] ) %310~5'(= a13◂ [ ] ) %309~4'(= r ) 
; #65 { 5'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 5'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11100100110.. |}
	mov r13,r11
	call ETR_65
	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
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
	mov rax,rcx
	mov QWORD [r13+8],rax
	mov rcx,r10
	mov rax,rcx
	mov QWORD [r13+16],rax
	mov rcx,r9
	mov rax,rcx
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	ret
LB_62:
;; ? 0'(= a13◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_66
	jmp LB_67
LB_66:
	jmp LB_65
LB_67:
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) 
; #55 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %318~2(<4)◂{ } %305~2'(= r ) %304~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r13,unt_2
	ret
LB_65:
;; ? 0'(= a13◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_69
	jmp LB_70
LB_69:
	jmp LB_68
LB_70:
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
	ret
LB_68:
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
	lea rsi,[rsi+8]
	cmp rdi,0
	jl err
	lea rsi,[rsi+0]
	push rsi 
	mov rsi,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,r8
	jl err
	add rsi,r8
	mov rdi,rsi 
	pop rsi 
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
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn %[ 0r ]
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r9,r13
	mov r13,r9
	mov BYTE [r13+6],1
	ret
LB_71: ;; #58 0'(= {| l |} ) ⊢ 0'(= a13◂ [ ] ) : (_s8→_t13)
;; rsp=0 , %244~0'(= {| l |} ) 
; #56 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %245~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a13◂ [ ] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	mov BYTE [r13+6],1
	ret
LB_73: ;; #59 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) } : (_t13→{ _t13 _r64 })
;; rsp=0 , %246~0'(= a13◂ [ ] ) 
;; ? 0'(= a13◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_75
	jmp LB_76
LB_75:
	jmp LB_74
LB_76:
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
	mov rax,r11
	mov QWORD [r13+8],rax
	mov r11,r10
	mov rax,r11
	mov QWORD [r13+16],rax
	mov r11,r9
	mov rax,r11
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	mov r14,r8
	ret
LB_74:
;; ? 0'(= a13◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
	mov rdi,r13
	cmp BYTE [rdi+6],1
	jnz LB_78
	jmp LB_79
LB_78:
	jmp LB_77
LB_79:
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
	ret
LB_77:
;; ? 0'(= a13◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_81
	jmp LB_82
LB_81:
	jmp LB_80
LB_82:
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
	ret
LB_80:
;; ?. 0'(= a13◂ [ ] ) ⊢ 2(<4)◂{ }
;; rsp=0 , 
; #55 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %259~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r14,0
	mov r13,unt_2
	ret
LB_72: ;; #64 { 0'(= a13◂ [ ] ) 1'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] ) : ({ _t13 _t13 }→_t13)
;; rsp=0 , %295~1'(= a13◂ [ ] ) %294~0'(= a13◂ [ ] ) 
; #59 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 1000000010.. |}
	call LB_73
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %297~2'(= r ) %296~0'(= a13◂ [ ] ) %295~1'(= a13◂ [ ] ) 
; #59 1'(= a13◂ [ ] ) ⊢ { 3'(= a13◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r8
; .mov_ptn2 1'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 11000000110.. |}
	mov r13,r14
	call LB_73
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %299~1'(= r ) %298~3'(= a13◂ [ ] ) %297~2'(= r ) %296~0'(= a13◂ [ ] ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %301~1'(= r ) %300~2'(= r ) %298~3'(= a13◂ [ ] ) %296~0'(= a13◂ [ ] ) 
; #57 { 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
;; rsp=0 , %302~0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) } %301~1'(= r ) 
; ∎ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] )
; {| 10110.. |}
	mov r14,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r13+8],rax
	mov r10,r8
	mov rax,r10
	mov QWORD [r13+16],rax
	mov r10,r9
	mov rax,r10
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	ret
LB_83:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_89+8*rax]
LB_89: dq LB_85,LB_86,LB_87,LB_88
LB_85:
	mov rdi,LB_91
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_83
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
	call LB_83
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_90
LB_86:
	mov rdi,LB_92
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_90
LB_87:
	mov rdi,LB_93
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_90
LB_88:
	mov rdi,LB_94
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_90
LB_90:
	ret
LB_95: ;; #60 { 0'(= a13◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a13◂ [ ] ) : ({ _t13 _s8 }→_t13)
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
	call LB_73
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
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
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a13◂ [ ] )
; {| 1110.. |}
	mov r9,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r10,r9
	mov rax,r10
	mov QWORD [r13+8],rax
	mov r10,r8
	mov rax,r10
	mov QWORD [r13+16],rax
	mov r10,r14
	mov BYTE [r10+6],1
	mov rax,r10
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
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
	call LB_71
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,192
;; rsp=0 , %343~1'(= a13◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #23 { } ⊢ 2'(= r )
	mov rdi,fmt_getchar 
	call emt_stg 
	xor rax,rax 
	C_CALL_SF getchar 
	mov r8,rax
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	call LB_72
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_83
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_84
LB_84:
;; rsp=0 , %346~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #23 { } ⊢ 2'(= r )
	mov rdi,fmt_getchar 
	call emt_stg 
	xor rax,rax 
	C_CALL_SF getchar 
	mov r8,rax
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
	call LB_95
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %348~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a13◂ [ ] ) ⊢ 1'(= a13◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_83
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_96
LB_96:
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
	call LB_72
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %351~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a13◂ [ ] ) ⊢ 1'(= a13◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_83
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_97
LB_97:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_6
ETR_67:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_67
	ret
GRM_67:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_101
	jmp LB_102
LB_101:
	mov r8,unt_1
	jmp LB_99
LB_102:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_103
	jmp LB_104
LB_103:
	mov r8,unt_1
	jmp LB_99
LB_104:
	add r14,1
	jmp LB_100
LB_99:
	add rsp,0
	jmp LB_98
LB_100:
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_107
	jmp LB_108
LB_107:
	jmp LB_105
LB_108:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_106
LB_105:
	add rsp,0
	jmp LB_98
LB_106:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_109
LB_109
;; rsp=0 , %355~1'(= r ) %354~0'(= r ) %353~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %356~0(<2)◂{ } %355~1'(= r ) %354~0'(= r ) %353~{ } 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_110
LB_110:
	cmp BYTE [r8+6],0
	jnz LB_98
	POP_GRM_SCC
	ret
LB_98:
	POP_GRM_FAIL 
	ret
LB_150: ;; #63 { 0'(= r ) 1'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] ) : ({ _r64 _t13 }→_t13)
;; rsp=0 , %288~1'(= a13◂ [ ] ) %287~0'(= r ) 
; #59 1'(= a13◂ [ ] ) ⊢ { 2'(= a13◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 1100000010.. |}
	mov r13,r14
	call LB_73
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
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
	mov rax,r10
	mov QWORD [r13+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r13+16],rax
	mov r10,r8
	mov rax,r10
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	ret
ETR_68:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_68
	ret
GRM_68:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_114
	jmp LB_115
LB_114:
	mov r8,unt_1
	jmp LB_112
LB_115:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_116
	jmp LB_117
LB_116:
	mov r8,unt_1
	jmp LB_112
LB_117:
	add r14,1
	jmp LB_113
LB_112:
	add rsp,0
	jmp LB_111
LB_113:
	call GRM_69
	cmp BYTE [r8+6],0
	jnz LB_120
	jmp LB_121
LB_120:
	jmp LB_118
LB_121:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 8'(= a13◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_119
LB_118:
	add rsp,0
	jmp LB_111
LB_119:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_122
LB_122
;; rsp=1 , %359~1'(= r ) %358~0'(= r ) %357~8'(= a13◂ [ ] ) 
; #26 8'(= a13◂ [ ] ) ⊢ 0(<2)◂8'(= a13◂ [ ] )
;; rsp=1 , %360~0(<2)◂8'(= a13◂ [ ] ) %359~1'(= r ) %358~0'(= r ) 
; ∎ 0(<2)◂8'(= a13◂ [ ] )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂8'(= a13◂ [ ] ) ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_123
LB_123:
	cmp BYTE [r8+6],0
	jnz LB_111
	POP_GRM_SCC
	ret
LB_111:
	POP_GRM_FAIL 
	ret
ETR_69:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_69
	ret
GRM_69:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_127
	jmp LB_128
LB_127:
	mov r8,unt_1
	jmp LB_125
LB_128:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_129
	jmp LB_130
LB_129:
	mov r8,unt_1
	jmp LB_125
LB_130:
	add r14,1
	jmp LB_126
LB_125:
	add rsp,0
	jmp LB_124
LB_126:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_131
LB_131
;; rsp=0 , %363~1'(= r ) %362~0'(= r ) %361~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %364~1(<2)◂{ } %363~1'(= r ) %362~0'(= r ) %361~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_132
LB_132:
	cmp BYTE [r8+6],0
	jnz LB_124
	POP_GRM_SCC
	ret
LB_124:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_136
	jmp LB_137
LB_136:
	mov r8,unt_1
	jmp LB_134
LB_137:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_138
	jmp LB_139
LB_138:
	mov r8,unt_1
	jmp LB_134
LB_139:
	add r14,1
	jmp LB_135
LB_134:
	add rsp,0
	jmp LB_133
LB_135:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_142
	jmp LB_143
LB_142:
	jmp LB_140
LB_143:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_141
LB_140:
	add rsp,0
	jmp LB_133
LB_141:
	call GRM_69
	cmp BYTE [r8+6],0
	jnz LB_146
	jmp LB_147
LB_146:
	jmp LB_144
LB_147:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 9'(= a13◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_145
LB_144:
	add rsp,8
	jmp LB_133
LB_145:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_148
LB_148
;; rsp=2 , %368~1'(= r ) %367~0'(= r ) %366~9'(= a13◂ [ ] ) %365~8'(= r ) 
; #63 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ 2'(= a13◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a13◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_150
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %369~2'(= a13◂ [ ] ) %368~1'(= r ) %367~0'(= r ) 
; #26 2'(= a13◂ [ ] ) ⊢ 0(<2)◂2'(= a13◂ [ ] )
;; rsp=0 , %370~0(<2)◂2'(= a13◂ [ ] ) %368~1'(= r ) %367~0'(= r ) 
; ∎ 0(<2)◂2'(= a13◂ [ ] )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂2'(= a13◂ [ ] ) ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_149
LB_149:
	cmp BYTE [r8+6],0
	jnz LB_133
	POP_GRM_SCC
	ret
LB_133:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_154
	jmp LB_155
LB_154:
	mov r8,unt_1
	jmp LB_152
LB_155:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_156
	jmp LB_157
LB_156:
	mov r8,unt_1
	jmp LB_152
LB_157:
	add r14,1
	jmp LB_153
LB_152:
	add rsp,0
	jmp LB_151
LB_153:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_158
LB_158
;; rsp=0 , %372~1'(= r ) %371~0'(= r ) 
; #55 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %373~2(<4)◂{ } %372~1'(= r ) %371~0'(= r ) 
; #26 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %374~0(<2)◂2(<4)◂{ } %372~1'(= r ) %371~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_159
LB_159:
	cmp BYTE [r8+6],0
	jnz LB_151
	POP_GRM_SCC
	ret
LB_151:
	RB_GRM
	cmp r14,r9
	jge LB_163
	jmp LB_164
LB_163:
	mov r8,unt_1 
	jmp LB_161
LB_164:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_162
LB_161:
	add rsp,0
	jmp LB_160
LB_162:
	call GRM_69
	cmp BYTE [r8+6],0
	jnz LB_167
	jmp LB_168
LB_167:
	jmp LB_165
LB_168:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 9'(= a13◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_166
LB_165:
	add rsp,8
	jmp LB_160
LB_166:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_169
LB_169
;; rsp=2 , %378~1'(= r ) %377~0'(= r ) %376~9'(= a13◂ [ ] ) %375~8'(= r ) 
; #63 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ 2'(= a13◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a13◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_150
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %379~2'(= a13◂ [ ] ) %378~1'(= r ) %377~0'(= r ) 
; #26 2'(= a13◂ [ ] ) ⊢ 0(<2)◂2'(= a13◂ [ ] )
;; rsp=0 , %380~0(<2)◂2'(= a13◂ [ ] ) %378~1'(= r ) %377~0'(= r ) 
; ∎ 0(<2)◂2'(= a13◂ [ ] )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂2'(= a13◂ [ ] ) ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_170
LB_170:
	cmp BYTE [r8+6],0
	jnz LB_160
	POP_GRM_SCC
	ret
LB_160:
	POP_GRM_FAIL 
	ret
ETR_70:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_70
	ret
GRM_70:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_174
	jmp LB_175
LB_174:
	mov r8,unt_1
	jmp LB_172
LB_175:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_176
	jmp LB_177
LB_176:
	mov r8,unt_1
	jmp LB_172
LB_177:
	add r14,1
	jmp LB_173
LB_172:
	add rsp,0
	jmp LB_171
LB_173:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_178
LB_178
;; rsp=0 , %382~1'(= r ) %381~0'(= r ) 
; #26 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
;; rsp=0 , %383~0(<2)◂%[ 92r ] %382~1'(= r ) %381~0'(= r ) 
; ∎ 0(<2)◂%[ 92r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,92
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_179
LB_179:
	cmp BYTE [r8+6],0
	jnz LB_171
	POP_GRM_SCC
	ret
LB_171:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_183
	jmp LB_184
LB_183:
	mov r8,unt_1
	jmp LB_181
LB_184:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_185
	jmp LB_186
LB_185:
	mov r8,unt_1
	jmp LB_181
LB_186:
	add r14,1
	jmp LB_182
LB_181:
	add rsp,0
	jmp LB_180
LB_182:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_187
LB_187
;; rsp=0 , %385~1'(= r ) %384~0'(= r ) 
; #26 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
;; rsp=0 , %386~0(<2)◂%[ 34r ] %385~1'(= r ) %384~0'(= r ) 
; ∎ 0(<2)◂%[ 34r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,34
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_188
LB_188:
	cmp BYTE [r8+6],0
	jnz LB_180
	POP_GRM_SCC
	ret
LB_180:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_192
	jmp LB_193
LB_192:
	mov r8,unt_1
	jmp LB_190
LB_193:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_194
	jmp LB_195
LB_194:
	mov r8,unt_1
	jmp LB_190
LB_195:
	add r14,1
	jmp LB_191
LB_190:
	add rsp,0
	jmp LB_189
LB_191:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_196
LB_196
;; rsp=0 , %388~1'(= r ) %387~0'(= r ) 
; #26 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
;; rsp=0 , %389~0(<2)◂%[ 10r ] %388~1'(= r ) %387~0'(= r ) 
; ∎ 0(<2)◂%[ 10r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,10
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_197
LB_197:
	cmp BYTE [r8+6],0
	jnz LB_189
	POP_GRM_SCC
	ret
LB_189:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_201
	jmp LB_202
LB_201:
	mov r8,unt_1
	jmp LB_199
LB_202:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_203
	jmp LB_204
LB_203:
	mov r8,unt_1
	jmp LB_199
LB_204:
	add r14,1
	jmp LB_200
LB_199:
	add rsp,0
	jmp LB_198
LB_200:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_205
LB_205
;; rsp=0 , %391~1'(= r ) %390~0'(= r ) 
; #26 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
;; rsp=0 , %392~0(<2)◂%[ 9r ] %391~1'(= r ) %390~0'(= r ) 
; ∎ 0(<2)◂%[ 9r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_206
LB_206:
	cmp BYTE [r8+6],0
	jnz LB_198
	POP_GRM_SCC
	ret
LB_198:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_210
	jmp LB_211
LB_210:
	mov r8,unt_1
	jmp LB_208
LB_211:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_212
	jmp LB_213
LB_212:
	mov r8,unt_1
	jmp LB_208
LB_213:
	add r14,1
	jmp LB_209
LB_208:
	add rsp,0
	jmp LB_207
LB_209:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_214
LB_214
;; rsp=0 , %394~1'(= r ) %393~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %395~0(<2)◂%[ 0r ] %394~1'(= r ) %393~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_215
LB_215:
	cmp BYTE [r8+6],0
	jnz LB_207
	POP_GRM_SCC
	ret
LB_207:
	POP_GRM_FAIL 
	ret
LB_217:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_221+8*rax]
LB_221: dq LB_219,LB_220
LB_219:
	mov rdi,LB_223
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_83
	jmp LB_222
LB_220:
	mov rdi,LB_224
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_222
LB_222:
	ret
LB_228: ;; #66 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) } : (_t13→{ _t13 _s8 })
;; rsp=0 , %334~0'(= a13◂ [ ] ) 
; #59 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 10.. |}
	call LB_73
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
	call ETR_65
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %341~2'(= r ) %340~3'(= {| l |} ) %339~0'(= a13◂ [ ] ) %337~1'(= r ) 
; ∎ { 0'(= a13◂ [ ] ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 { 0'(= a13◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) }
; {| 11010.. |}
	mov r14,r9
	ret
LB_230:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_235+8*rax]
LB_235: dq LB_231,LB_232,LB_233,LB_234
LB_231:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_230
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_230
	pop r8 
	FREE_RCD 3, r8
	jmp LB_236
LB_232:
	mov rdi,r8
	call free_s8
	jmp LB_236
LB_233:
	jmp LB_236
LB_234:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_236
LB_236:
	ret
LB_216: ;; #71 { } ⊢ { } : ({ }→{ })
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
	call ETR_68
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
	call LB_217
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_218
LB_218:
;; rsp=0 , %401~2'(= a3◂ [ a13◂ [ ]] ) %400~1'(= r ) %399~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a13◂ [ ]] ) ⊢ 0(<2)◂3'(= a13◂ [ ] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_226
	jmp LB_227
LB_226:
	jmp LB_225
LB_227:
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
	call LB_228
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
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
	jmp LB_229
LB_229:
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
	call LB_230
	C_POP_REGS
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
	ret
LB_225:
;; ?. 2'(= a3◂ [ a13◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %400~1'(= r ) %399~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
	ret
RTM_6:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #71 { } ⊢ { }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 00000000110.. |}
	call LB_216
	mov r14,QWORD [rsp-8+8*2]
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
; .dlt.ptn { }
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_7
ETR_72:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_72
	ret
GRM_72:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_240
	jmp LB_241
LB_240:
	mov r8,unt_1
	jmp LB_238
LB_241:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_242
	jmp LB_243
LB_242:
	mov r8,unt_1
	jmp LB_238
LB_243:
	add r14,1
	jmp LB_239
LB_238:
	add rsp,0
	jmp LB_237
LB_239:
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_246
	jmp LB_247
LB_246:
	jmp LB_244
LB_247:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_245
LB_244:
	add rsp,0
	jmp LB_237
LB_245:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_248
LB_248
;; rsp=1 , %409~1'(= r ) %408~0'(= r ) %407~8'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=1 , %410~0(<2)◂%[ 0r ] %409~1'(= r ) %408~0'(= r ) %407~8'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_249
LB_249:
	cmp BYTE [r8+6],0
	jnz LB_237
	POP_GRM_SCC
	ret
LB_237:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_253
	jmp LB_254
LB_253:
	mov r8,unt_1
	jmp LB_251
LB_254:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_255
	jmp LB_256
LB_255:
	mov r8,unt_1
	jmp LB_251
LB_256:
	add r14,1
	jmp LB_252
LB_251:
	add rsp,0
	jmp LB_250
LB_252:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_257
LB_257
;; rsp=0 , %412~1'(= r ) %411~0'(= r ) 
; #26 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %413~0(<2)◂%[ 1r ] %412~1'(= r ) %411~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_258
LB_258:
	cmp BYTE [r8+6],0
	jnz LB_250
	POP_GRM_SCC
	ret
LB_250:
	POP_GRM_FAIL 
	ret
ETR_73:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_73
	ret
GRM_73:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_262
	jmp LB_263
LB_262:
	mov r8,unt_1
	jmp LB_260
LB_263:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_264
	jmp LB_265
LB_264:
	mov r8,unt_1
	jmp LB_260
LB_265:
	add r14,1
	jmp LB_261
LB_260:
	add rsp,0
	jmp LB_259
LB_261:
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_268
	jmp LB_269
LB_268:
	jmp LB_266
LB_269:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_267
LB_266:
	add rsp,0
	jmp LB_259
LB_267:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_270
LB_270
;; rsp=1 , %416~1'(= r ) %415~0'(= r ) %414~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %417~0(<2)◂8'(= r ) %416~1'(= r ) %415~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_271
LB_271:
	cmp BYTE [r8+6],0
	jnz LB_259
	POP_GRM_SCC
	ret
LB_259:
	RB_GRM
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_275
	jmp LB_276
LB_275:
	jmp LB_273
LB_276:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_274
LB_273:
	add rsp,0
	jmp LB_272
LB_274:
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_279
	jmp LB_280
LB_279:
	jmp LB_277
LB_280:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_278
LB_277:
	add rsp,8
	jmp LB_272
LB_278:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_281
LB_281
;; rsp=2 , %421~1'(= r ) %420~0'(= r ) %419~9'(= r ) %418~8'(= r ) 
; #13 { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %423~9'(= r ) %422~8'(= r ) %421~1'(= r ) %420~0'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=2 , %424~0(<2)◂8'(= r ) %423~9'(= r ) %421~1'(= r ) %420~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 9'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*2]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_282
LB_282:
	cmp BYTE [r8+6],0
	jnz LB_272
	POP_GRM_SCC
	ret
LB_272:
	POP_GRM_FAIL 
	ret
ETR_74:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_74
	ret
GRM_74:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_286
	jmp LB_287
LB_286:
	mov r8,unt_1
	jmp LB_284
LB_287:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
	jnz LB_288
	jmp LB_289
LB_288:
	mov r8,unt_1
	jmp LB_284
LB_289:
	add r14,1
	jmp LB_285
LB_284:
	add rsp,0
	jmp LB_283
LB_285:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_292
	jmp LB_293
LB_292:
	mov r8,unt_1
	jmp LB_290
LB_293:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
	jnz LB_294
	jmp LB_295
LB_294:
	mov r8,unt_1
	jmp LB_290
LB_295:
	add r14,1
	jmp LB_291
LB_290:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_291:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_296
LB_296
;; rsp=0 , %426~1'(= r ) %425~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %427~0(<2)◂%[ 0r ] %426~1'(= r ) %425~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_297
LB_297:
	cmp BYTE [r8+6],0
	jnz LB_283
	POP_GRM_SCC
	ret
LB_283:
	RB_GRM
	cmp r14,r9
	jge LB_301
	jmp LB_302
LB_301:
	mov r8,unt_1 
	jmp LB_299
LB_302:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_300
LB_299:
	add rsp,0
	jmp LB_298
LB_300:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_305
	jmp LB_306
LB_305:
	mov r8,unt_1
	jmp LB_303
LB_306:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_307
	jmp LB_308
LB_307:
	mov r8,unt_1
	jmp LB_303
LB_308:
	add r14,1
	jmp LB_304
LB_303:
	add rsp,8
	jmp LB_298
LB_304:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_309
LB_309
;; rsp=1 , %430~1'(= r ) %429~0'(= r ) %428~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %431~0(<2)◂8'(= r ) %430~1'(= r ) %429~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_310
LB_310:
	cmp BYTE [r8+6],0
	jnz LB_298
	POP_GRM_SCC
	ret
LB_298:
	POP_GRM_FAIL 
	ret
ETR_75:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_75
	ret
GRM_75:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_314
	jmp LB_315
LB_314:
	mov r8,unt_1
	jmp LB_312
LB_315:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_316
	jmp LB_317
LB_316:
	mov r8,unt_1
	jmp LB_312
LB_317:
	add r14,1
	jmp LB_313
LB_312:
	add rsp,0
	jmp LB_311
LB_313:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_322
	jmp LB_323
LB_322:
	mov r8,unt_1
	jmp LB_320
LB_323:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_324
	jmp LB_325
LB_324:
	mov r8,unt_1
	jmp LB_320
LB_325:
	add r14,1
	jmp LB_321
LB_320:
	add rsp,0
	jmp LB_319
LB_321:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_326
LB_326
;; rsp=0 , %435~1'(= r ) %434~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %436~0(<2)◂%[ 0r ] %435~1'(= r ) %434~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_327
LB_327:
	cmp BYTE [r8+6],0
	jnz LB_319
	POP_GRM_SCC
	jmp LB_318
LB_319:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_331
	jmp LB_332
LB_331:
	mov r8,unt_1
	jmp LB_329
LB_332:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_333
	jmp LB_334
LB_333:
	mov r8,unt_1
	jmp LB_329
LB_334:
	add r14,1
	jmp LB_330
LB_329:
	add rsp,0
	jmp LB_328
LB_330:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_339
	jmp LB_340
LB_339:
	mov r8,unt_1
	jmp LB_337
LB_340:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_341
	jmp LB_342
LB_341:
	mov r8,unt_1
	jmp LB_337
LB_342:
	add r14,1
	jmp LB_338
LB_337:
	add rsp,0
	jmp LB_336
LB_338:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_343
LB_343
;; rsp=0 , %440~1'(= r ) %439~0'(= r ) 
; #26 %[ 3r ] ⊢ 0(<2)◂%[ 3r ]
;; rsp=0 , %441~0(<2)◂%[ 3r ] %440~1'(= r ) %439~0'(= r ) 
; ∎ 0(<2)◂%[ 3r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,3
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_344
LB_344:
	cmp BYTE [r8+6],0
	jnz LB_336
	POP_GRM_SCC
	jmp LB_335
LB_336:
	RB_GRM
	call GRM_75
	cmp BYTE [r8+6],0
	jnz LB_348
	jmp LB_349
LB_348:
	jmp LB_346
LB_349:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_347
LB_346:
	add rsp,0
	jmp LB_345
LB_347:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_350
LB_350
;; rsp=1 , %444~1'(= r ) %443~0'(= r ) %442~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %445~0(<2)◂8'(= r ) %444~1'(= r ) %443~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_351
LB_351:
	cmp BYTE [r8+6],0
	jnz LB_345
	POP_GRM_SCC
	jmp LB_335
LB_345:
	POP_GRM_FAIL 
	jmp LB_335
LB_335:
	cmp BYTE [r8+6],0
	jnz LB_352
	jmp LB_353
LB_352:
	add rsp,0
	POP_GRM_FAIL
	jmp LB_318
LB_353:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_354
LB_354
;; rsp=0 , %446~3'(= r ) %438~1'(= r ) %437~0'(= r ) 
; #26 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %447~0(<2)◂%[ 1r ] %446~3'(= r ) %438~1'(= r ) %437~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 3'(= r )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_355
LB_355:
	cmp BYTE [r8+6],0
	jnz LB_328
	POP_GRM_SCC
	jmp LB_318
LB_328:
	POP_GRM_FAIL 
	jmp LB_318
LB_318:
	cmp BYTE [r8+6],0
	jnz LB_356
	jmp LB_357
LB_356:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_357:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_358
LB_358
;; rsp=0 , %448~3'(= r ) %433~1'(= r ) %432~0'(= r ) 
; #26 3'(= r ) ⊢ 0(<2)◂3'(= r )
;; rsp=0 , %449~0(<2)◂3'(= r ) %433~1'(= r ) %432~0'(= r ) 
; ∎ 0(<2)◂3'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂3'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_359
LB_359:
	cmp BYTE [r8+6],0
	jnz LB_311
	POP_GRM_SCC
	ret
LB_311:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_363
	jmp LB_364
LB_363:
	mov r8,unt_1
	jmp LB_361
LB_364:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
	jnz LB_365
	jmp LB_366
LB_365:
	mov r8,unt_1
	jmp LB_361
LB_366:
	add r14,1
	jmp LB_362
LB_361:
	add rsp,0
	jmp LB_360
LB_362:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_367
LB_367
;; rsp=0 , %451~1'(= r ) %450~0'(= r ) 
; #26 %[ 2r ] ⊢ 0(<2)◂%[ 2r ]
;; rsp=0 , %452~0(<2)◂%[ 2r ] %451~1'(= r ) %450~0'(= r ) 
; ∎ 0(<2)◂%[ 2r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_368
LB_368:
	cmp BYTE [r8+6],0
	jnz LB_360
	POP_GRM_SCC
	ret
LB_360:
	POP_GRM_FAIL 
	ret
ETR_76:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_76
	ret
GRM_76:
	PUSH_GRM
	jmp LB_371
LB_370:
	add r14,1 
LB_371:
	cmp r14,r9
	jge LB_372
	JZ_LINE_SPC BYTE [r13+8+r14], LB_370
LB_372
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_375
	jmp LB_376
LB_375:
	mov r8,unt_1
	jmp LB_373
LB_376:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],97
	jnz LB_377
	jmp LB_378
LB_377:
	mov r8,unt_1
	jmp LB_373
LB_378:
	add r14,1
	jmp LB_374
LB_373:
	add rsp,0
	jmp LB_369
LB_374:
	jmp LB_380
LB_379:
	add r14,1 
LB_380:
	cmp r14,r9
	jge LB_381
	JZ_LINE_SPC BYTE [r13+8+r14], LB_379
LB_381
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_384
	jmp LB_385
LB_384:
	mov r8,unt_1
	jmp LB_382
LB_385:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_386
	jmp LB_387
LB_386:
	mov r8,unt_1
	jmp LB_382
LB_387:
	add r14,1
	jmp LB_383
LB_382:
	add rsp,0
	jmp LB_369
LB_383:
	jmp LB_389
LB_388:
	add r14,1 
LB_389:
	cmp r14,r9
	jge LB_390
	JZ_LINE_SPC BYTE [r13+8+r14], LB_388
LB_390
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_393
	jmp LB_394
LB_393:
	mov r8,unt_1
	jmp LB_391
LB_394:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_395
	jmp LB_396
LB_395:
	mov r8,unt_1
	jmp LB_391
LB_396:
	add r14,1
	jmp LB_392
LB_391:
	add rsp,0
	jmp LB_369
LB_392:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_397
LB_397
;; rsp=0 , %454~1'(= r ) %453~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %455~0(<2)◂%[ 0r ] %454~1'(= r ) %453~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_398
LB_398:
	cmp BYTE [r8+6],0
	jnz LB_369
	POP_GRM_SCC
	ret
LB_369:
	RB_GRM
	jmp LB_401
LB_400:
	add r14,1 
LB_401:
	cmp r14,r9
	jge LB_402
	JZ_SPC BYTE [r13+8+r14], LB_400
LB_402
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_405
	jmp LB_406
LB_405:
	mov r8,unt_1
	jmp LB_403
LB_406:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_407
	jmp LB_408
LB_407:
	mov r8,unt_1
	jmp LB_403
LB_408:
	add r14,1
	jmp LB_404
LB_403:
	add rsp,0
	jmp LB_399
LB_404:
	jmp LB_410
LB_409:
	add r14,1 
LB_410:
	cmp r14,r9
	jge LB_411
	JZ_SPC BYTE [r13+8+r14], LB_409
LB_411
	call GRM_76
	cmp BYTE [r8+6],0
	jnz LB_414
	jmp LB_415
LB_414:
	jmp LB_412
LB_415:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_413
LB_412:
	add rsp,0
	jmp LB_399
LB_413:
	jmp LB_417
LB_416:
	add r14,1 
LB_417:
	cmp r14,r9
	jge LB_418
	JZ_SPC BYTE [r13+8+r14], LB_416
LB_418
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_421
	jmp LB_422
LB_421:
	mov r8,unt_1
	jmp LB_419
LB_422:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],122
	jnz LB_423
	jmp LB_424
LB_423:
	mov r8,unt_1
	jmp LB_419
LB_424:
	add r14,1
	jmp LB_420
LB_419:
	add rsp,8
	jmp LB_399
LB_420:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_425
LB_425
;; rsp=1 , %458~1'(= r ) %457~0'(= r ) %456~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %459~0(<2)◂8'(= r ) %458~1'(= r ) %457~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_426
LB_426:
	cmp BYTE [r8+6],0
	jnz LB_399
	POP_GRM_SCC
	ret
LB_399:
	RB_GRM
	call GRM_76
	cmp BYTE [r8+6],0
	jnz LB_430
	jmp LB_431
LB_430:
	jmp LB_428
LB_431:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_429
LB_428:
	add rsp,0
	jmp LB_427
LB_429:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_434
	jmp LB_435
LB_434:
	mov r8,unt_1
	jmp LB_432
LB_435:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_436
	jmp LB_437
LB_436:
	mov r8,unt_1
	jmp LB_432
LB_437:
	add r14,1
	jmp LB_433
LB_432:
	add rsp,8
	jmp LB_427
LB_433:
	call GRM_75
	cmp BYTE [r8+6],0
	jnz LB_440
	jmp LB_441
LB_440:
	jmp LB_438
LB_441:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_439
LB_438:
	add rsp,8
	jmp LB_427
LB_439:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_442
LB_442
;; rsp=2 , %463~1'(= r ) %462~0'(= r ) %461~9'(= r ) %460~8'(= r ) 
; #26 9'(= r ) ⊢ 0(<2)◂9'(= r )
;; rsp=2 , %464~0(<2)◂9'(= r ) %463~1'(= r ) %462~0'(= r ) %460~8'(= r ) 
; ∎ 0(<2)◂9'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 00100000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_443
LB_443:
	cmp BYTE [r8+6],0
	jnz LB_427
	POP_GRM_SCC
	ret
LB_427:
	POP_GRM_FAIL 
	ret
LB_444:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_448+8*rax]
LB_448: dq LB_446,LB_447
LB_446:
	mov rdi,LB_450
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_449
LB_447:
	mov rdi,LB_451
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_449
LB_449:
	ret
LB_452:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_455+8*rax]
LB_455: dq LB_453,LB_454
LB_453:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_456
LB_454:
	jmp LB_456
LB_456:
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
	call ETR_73
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_444
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_445
LB_445:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_452
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
	call ETR_74
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_444
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_457
LB_457:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_452
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
	call ETR_75
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_444
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_458
LB_458:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_452
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
	call ETR_75
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_444
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_459
LB_459:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_452
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
	call ETR_76
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_444
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_460
LB_460:
; .dlt.ptn { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_452
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_461
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_462
LB_462:
; .dlt.ptn %[ "dd\t\n\"J  " ]
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_8
LB_465: ;; #77 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
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
	ret
RTM_8:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,16
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_463+16-1]
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
	jmp LB_464
LB_464:
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
	call LB_465
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
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
	jmp LB_466
LB_466:
; .dlt.ptn { 2'(= r ) 3'(= {| l |} ) }
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
LB_467:
	cmp rdi,0 
	jz LB_468
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
	mov rsi,r8
	mov rax,r9
	mov rdi,r10
	mov QWORD [rsi+8+8*rdi],rax 
	jmp LB_467
LB_468:
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
	jmp LB_469
LB_469:
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
	mov rdi,LB_470
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_471
LB_471:
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
	mov rsi,[r8]
	mov rax,0 
LB_472:
	cmp rsi,rax 
	jz LB_473
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
	jmp LB_472
LB_473:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_474
LB_474:
; .dlt.ptn 2'(= {| {| l |}|} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
LB_475:
	cmp rsi,rax 
	jz LB_476
	push r8 
	push rsi 
	push rax 
	mov r8,QWORD [r8+8+8*rax]
	mov rdi,r8
	call free_s8
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_475
LB_476:
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_10
LB_479: ;; #80 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) : (_opn◂_opn◂_opn◂_opn◂_opn◂_r64→_opn◂_opn◂_opn◂_opn◂_opn◂_r64)
;; rsp=0 , %516~0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) 
;; ? 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_481
	jmp LB_482
LB_481:
	jmp LB_480
LB_482:
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
	ret
LB_480:
;; ?. 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	mov rdi,LB_483
	call emt_stg 
	jmp err
LB_485:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_488+8*rax]
LB_488: dq LB_486,LB_487
LB_486:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_490
	jmp LB_489
LB_487:
	jmp LB_489
LB_489:
	ret
LB_490:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_493+8*rax]
LB_493: dq LB_491,LB_492
LB_491:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_495
	jmp LB_494
LB_492:
	jmp LB_494
LB_494:
	ret
LB_495:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_498+8*rax]
LB_498: dq LB_496,LB_497
LB_496:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_500
	jmp LB_499
LB_497:
	jmp LB_499
LB_499:
	ret
LB_500:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_503+8*rax]
LB_503: dq LB_501,LB_502
LB_501:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_452
	jmp LB_504
LB_502:
	jmp LB_504
LB_504:
	ret
LB_484:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_507+8*rax]
LB_507: dq LB_505,LB_506
LB_505:
	mov r8,QWORD [r8+8]
	call LB_509
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_508
LB_506:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_508
LB_508:
	ret
LB_509:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_512+8*rax]
LB_512: dq LB_510,LB_511
LB_510:
	mov r8,QWORD [r8+8]
	call LB_514
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_513
LB_511:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_513
LB_513:
	ret
LB_514:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_517+8*rax]
LB_517: dq LB_515,LB_516
LB_515:
	mov r8,QWORD [r8+8]
	call LB_519
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_518
LB_516:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_518
LB_518:
	ret
LB_519:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_522+8*rax]
LB_522: dq LB_520,LB_521
LB_520:
	mov r8,QWORD [r8+8]
	call LB_524
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_523
LB_521:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_523
LB_523:
	ret
LB_524:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_527+8*rax]
LB_527: dq LB_525,LB_526
LB_525:
	mov r8,QWORD [r8+8]
	mov rax,r8
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_528
LB_526:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_528
LB_528:
	ret
LB_529:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_533+8*rax]
LB_533: dq LB_531,LB_532
LB_531:
	mov rdi,LB_535
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_536
	jmp LB_534
LB_532:
	mov rdi,LB_537
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_534
LB_534:
	ret
LB_536:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_540+8*rax]
LB_540: dq LB_538,LB_539
LB_538:
	mov rdi,LB_542
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_543
	jmp LB_541
LB_539:
	mov rdi,LB_544
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_541
LB_541:
	ret
LB_543:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_547+8*rax]
LB_547: dq LB_545,LB_546
LB_545:
	mov rdi,LB_549
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_550
	jmp LB_548
LB_546:
	mov rdi,LB_551
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_548
LB_548:
	ret
LB_550:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_554+8*rax]
LB_554: dq LB_552,LB_553
LB_552:
	mov rdi,LB_556
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_444
	jmp LB_555
LB_553:
	mov rdi,LB_557
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_555
LB_555:
	ret
RTM_10:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "start info test" ] ⊢ %[ "start info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_477
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_478
LB_478:
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
	call LB_479
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; $ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_484
	C_POP_REGS
	mov r9,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_484
	C_POP_REGS
	mov r10,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_484
	C_POP_REGS
	mov r11,rax
; .dlt.ptn 5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	call LB_485
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
	call LB_529
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_530
LB_530:
; .dlt.ptn 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_485
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #22 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "end info test" ] ⊢ %[ "end info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_558
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_559
LB_559:
; .dlt.ptn %[ "end info test" ]
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_11
ETR_86: ;; f1 0'(= a14◂ [ ] ) ⊢ 0'(= q0 ) : (_t14→886'(0))
;; rsp=0 , %533~0'(= a14◂ [ ] ) 
; #81 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %534~1(<2)◂{ } %533~0'(= a14◂ [ ] ) 
; #82 { 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) } ⊢ 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) }
;; rsp=0 , %535~0(<2)◂{ 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) } 
; #86 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) } ⊢|
; .mov_ptn2 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] )
; {| 10.. |}
	mov r14,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r8,unt_1
	mov rax,r8
	mov QWORD [r13+8],rax
	mov r8,0
	mov rax,r8
	mov QWORD [r13+16],rax
	mov r8,r14
	mov rax,r8
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	call ETR_86
; .mov_ptn2 0'(= q0 ) ⊢ 0'(= q0 )
; {| 10.. |}
	ret
ETR_87: ;; f2 0'(= a15◂ [ ] ) ⊢ 0'(= q0 ) : (_t15→893'(0))
;; rsp=0 , %536~0'(= a15◂ [ ] ) 
; #84 0'(= a15◂ [ ] ) ⊢ 0(<2)◂0'(= a15◂ [ ] )
;; rsp=0 , %537~0(<2)◂0'(= a15◂ [ ] ) 
; #87 0(<2)◂0'(= a15◂ [ ] ) ⊢|
; .mov_ptn2 0(<2)◂0'(= a15◂ [ ] ) ⊢ 0'(= a15◂ [ ] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
	call ETR_87
; .mov_ptn2 0'(= q0 ) ⊢ 0'(= q0 )
; {| 10.. |}
	ret
LB_560: ;; #85 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] ) : (_t14→_t14)
;; rsp=0 , %532~0'(= a14◂ [ ] ) 
; ∎ 0'(= a14◂ [ ] )
; .mov_ptn2 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10.. |}
	ret
LB_561:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_565+8*rax]
LB_565: dq LB_563,LB_564
LB_563:
	mov rdi,LB_567
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_561
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
	call LB_561
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_566
LB_564:
	mov rdi,LB_568
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_566
LB_566:
	ret
LB_569:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_572+8*rax]
LB_572: dq LB_570,LB_571
LB_570:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_569
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_569
	pop r8 
	FREE_RCD 3, r8
	jmp LB_573
LB_571:
	jmp LB_573
LB_573:
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
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,0
	mov rax,r14
	mov QWORD [r13+16],rax
	mov r14,unt_1
	mov rax,r14
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	call LB_560
	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
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
	call LB_561
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_562
LB_562:
; .dlt.ptn 2'(= a14◂ [ ] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_569
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
	mov rdi,0
	mov QWORD rdi,rsp
	and rsp,~0xf
	push rdi
	call exit
	pop rdi
	mov rsp,rdi

err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	C_CALL printf
	mov rax,1
	mov rbx,0
	int 0x80
