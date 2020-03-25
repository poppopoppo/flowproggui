bits 64 
; macros 
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
	SS_RCD_%1_VCT: resq (%1+1)*%2
	SS_RCD_%1_BTM: resq 1
	SS_RCD_%1_C: resq 1 
	SS_RCD_%1_N: resq 1
%endmacro 

%define SIG_INT 2
%define SIG_SEGV 11
%define SS_MAX 2000
%define SS_LN_MAX 4000
%define RCD_N 16
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX 2048
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

	BSS_SS_RCD 1, SS_MAX
	BSS_SS_RCD 2, SS_MAX
	BSS_SS_RCD 3, SS_MAX
	BSS_SS_RCD 4, SS_MAX
	BSS_SS_RCD 5, SS_MAX
	BSS_SS_RCD 6, SS_MAX
	BSS_SS_RCD 7, SS_MAX
	BSS_SS_RCD 8, SS_MAX
	BSS_SS_RCD 9, SS_MAX
	BSS_SS_RCD 10, SS_MAX
	BSS_SS_RCD 11, SS_MAX
	BSS_SS_RCD 12, SS_MAX
	BSS_SS_RCD 13, SS_MAX
	BSS_SS_RCD 14, SS_MAX
	BSS_SS_RCD 15, SS_MAX
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

LB_2: db 59,32,226,136,142,124,10,101,120,110,32,52,48,48,58,10,0
LB_8: db 48,114,0
LB_10: db 48,114,0
LB_12: db 48,114,0
LB_14: db 10,0
LB_15: db 49,55,0
LB_16: db 75,75,0
LB_19: db 49,55,0
LB_60: db 39,48,226,151,130,0
LB_61: db 39,49,226,151,130,0
LB_62: db 39,50,226,151,130,0
LB_63: db 39,51,226,151,130,0
LB_189: db 39,48,226,151,130,0
LB_190: db 39,49,226,151,130,0
LB_413: db 39,48,226,151,130,0
LB_414: db 39,49,226,151,130,0
LB_424: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_426: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_429: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_431: db 104,0
LB_432: db 103,0
LB_435: db 89,100,32,112,0
LB_438: db 49,55,0
LB_439: db 102,111,111,0
LB_444: db 34,100,108,116,32,97,114,114,97,121,34,0
LB_451: db 34,115,116,97,114,116,32,105,110,102,111,32,116,101,115,116,34,0
LB_455: db 59,32,226,136,142,124,10,101,120,110,32,49,49,51,54,51,58,10,0
LB_507: db 39,48,226,151,130,0
LB_509: db 39,49,226,151,130,0
LB_514: db 39,48,226,151,130,0
LB_516: db 39,49,226,151,130,0
LB_521: db 39,48,226,151,130,0
LB_523: db 39,49,226,151,130,0
LB_528: db 39,48,226,151,130,0
LB_529: db 39,49,226,151,130,0
LB_530: db 34,101,110,100,32,105,110,102,111,32,116,101,115,116,34,0
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
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
	cmp rdi,SS_MAX
	jz ss_end_rcd_15
	add rdi,1 
	lea rsi,[rax+8*16]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_15
ss_end_rcd_15:
	mov rsi,-65521
	mov [rax],rsi 
	jmp RTM_0
ETR_32: ;; f0 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %1~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %2~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_33: ;; f1 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
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
	ret
ETR_34: ;; f2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %9~1'(= r ) %8~0'(= r ) 
; #15 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %11~1'(= r ) %10~0'(= r ) 
; #15 { %[ 4r ] 1'(= r ) } ⊢ { 1'(= r ) 1'(= r ) }
	mov r14,4
	imul r14,r14
;; rsp=0 , %13~1'(= r ) %12~1'(= r ) %10~0'(= r ) 
; ∎ { 1'(= r ) 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 1'(= r ) 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn 1'(= r ) ⊢ 2'(= r )
	mov rax,r14
	mov r8,rax
	mov r9,r13
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
; .mov_ptn 3'(= r ) ⊢ 1'(= r )
	mov rax,r9
	mov r14,rax
	ret
ETR_35: ;; f3 0'(= r ) ⊢ { 0'(= r ) 1'(= r ) } : (_r64→{ _r64 _r64 })
;; rsp=0 , %14~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %15~0'(= r ) 
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r14,rax
;; rsp=0 , %17~1'(= r ) %16~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_36: ;; f4 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %18~0'(= r ) 
	mov rdi,0
	cmp r13,rdi
	jnz LB_0
;; rsp=0 , %18~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %19~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
LB_0:
	mov rdi,1
	cmp r13,rdi
	jnz LB_1
;; rsp=0 , %18~0'(= r ) 
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r14,rax
;; rsp=0 , %21~1'(= r ) %20~0'(= r ) 
; #15 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %23~1'(= r ) %22~0'(= r ) 
; ∎ 0'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
LB_1:
;; rsp=0 , %18~0'(= r ) 
	mov rdi,LB_2
	call emt_stg 
	jmp err
ETR_37: ;; f5 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %24~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %25~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_38: ;; fact 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %26~0'(= r ) 
	mov rdi,0
	cmp r13,rdi
	jnz LB_3
;; rsp=0 , %26~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	ret
LB_3:
	mov rdi,1
	cmp r13,rdi
	jnz LB_4
;; rsp=0 , %26~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
LB_4:
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
; #38 0'(= r ) ⊢ 0'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_38
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
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %33~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #11 %[ 0r ] ⊢ %[ 1r ]
;; rsp=0 , %34~%[ 1r ] %0~0'(= {| {| l |}|} ) 
; #32 %[ 1r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	call ETR_32
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %37~%[ 4r ] %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #32 %[ 4r ] ⊢ 2'(= r )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 %[ 4r ] ⊢ 0'(= r )
; .mov_ptn %[ 4r ] ⊢ 0'(= r )
	mov rax,4
	mov r13,rax
	call ETR_32
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
	jmp LB_5
LB_5:
;; rsp=0 , %39~1'(= r ) %36~%[ 3r ] %0~0'(= {| {| l |}|} ) 
; #33 { 1'(= r ) %[ 3r ] } ⊢ { 2'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
; .mov_ptn %[ 3r ] ⊢ 1'(= r )
	mov rax,3
	mov r14,rax
	call ETR_33
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %40~2'(= r ) %0~0'(= {| {| l |}|} ) 
; #38 2'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; .mov_ptn 2'(= r ) ⊢ 0'(= r )
	mov rax,r8
	mov r13,rax
	call ETR_38
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
	jmp LB_6
LB_6:
;; rsp=0 , %43~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #38 1'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	call ETR_38
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
	jmp LB_7
LB_7:
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
	mov rdi,LB_8
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_9
LB_9:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %48~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_10
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_11
LB_11:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %0~0'(= {| {| l |}|} ) 
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
	lea rsi,[LB_14+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_15+2-1]
	mov rcx,2
	rep movsb
	mov rax,17
LB_17:
	cmp rax,0
	jz LB_18
	sub rax,1
	lea rsi,[LB_16+2-1]
	mov rcx,2
	rep movsb 
	jmp LB_17
LB_18:
	lea rsi,[LB_19+2-1]
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
	jmp LB_20
LB_20:
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
ETR_39: ;; fact 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %64~0'(= r ) 
	mov rdi,0
	cmp r13,rdi
	jnz LB_21
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	ret
LB_21:
	mov rdi,1
	cmp r13,rdi
	jnz LB_22
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	ret
LB_22:
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
; #39 0'(= r ) ⊢ 0'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_39
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
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	ret
ETR_40: ;; tak { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
;;0'(= r )=<1'(= r )
	mov rdi,r14
	cmp r13,rdi
	jg LB_23
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
; .mov_ptn 2'(= r ) ⊢ 0'(= r )
	mov rax,r8
	mov r13,rax
	ret
LB_23:
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
; #40 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ 3'(= r )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn 5'(= r ) ⊢ 2'(= r )
	mov rax,r11
	mov r8,rax
; .mov_ptn 4'(= r ) ⊢ 1'(= r )
	mov rax,r10
	mov r14,rax
; .mov_ptn 3'(= r ) ⊢ 0'(= r )
	mov rax,r9
	mov r13,rax
	call ETR_40
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
; #40 { 5'(= r ) 6'(= r ) 4'(= r ) } ⊢ 4'(= r )
	sub rsp,32
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
; .mov_ptn2 { 5'(= r ) 6'(= r ) 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn 4'(= r ) ⊢ 2'(= r )
	mov rax,r10
	mov r8,rax
; .mov_ptn 6'(= r ) ⊢ 1'(= r )
	mov rax,rcx
	mov r14,rax
; .mov_ptn 5'(= r ) ⊢ 0'(= r )
	mov rax,r11
	mov r13,rax
	call ETR_40
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
; #40 { 2'(= r ) 0'(= r ) 1'(= r ) } ⊢ 0'(= r )
	sub rsp,16
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 2'(= r ) 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
	mov r9,r8
; .mov_ptn 1'(= r ) ⊢ 2'(= r )
	mov rax,r14
	mov r8,rax
; .mov_ptn 0'(= r ) ⊢ 1'(= r )
	mov rax,r13
	mov r14,rax
; .mov_ptn 3'(= r ) ⊢ 0'(= r )
	mov rax,r9
	mov r13,rax
	call ETR_40
	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %91~0'(= r ) %89~4'(= r ) %81~3'(= r ) 
; #40 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ 0'(= r )
; .mov_ptn2 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn 0'(= r ) ⊢ 2'(= r )
	mov rax,r13
	mov r8,rax
; .mov_ptn 4'(= r ) ⊢ 1'(= r )
	mov rax,r10
	mov r14,rax
; .mov_ptn 3'(= r ) ⊢ 0'(= r )
	mov rax,r9
	mov r13,rax
	call ETR_40
;; rsp=0 , %92~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_41: ;; tak_v { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 })
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
;;0'(= r )=<1'(= r )
	mov rdi,r14
	cmp r13,rdi
	jg LB_24
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
	ret
LB_24:
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %98~0'(= r ) %95~2'(= r ) %94~1'(= r ) 
; #41 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
	call ETR_41
;; rsp=0 , %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) %99~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %103~0'(= r ) %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) 
; #12 1'(= r ) ⊢ 1'(= r )
	sub r14,1
;; rsp=0 , %104~1'(= r ) %103~0'(= r ) %102~3'(= r ) %101~2'(= r ) 
; #41 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 4'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r9
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
	mov r9,r8
; .mov_ptn 0'(= r ) ⊢ 2'(= r )
	mov rax,r13
	mov r8,rax
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
; .mov_ptn 3'(= r ) ⊢ 1'(= r )
	mov rax,r9
	mov r14,rax
	call ETR_41
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
; #41 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 5'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
	mov r9,r8
; .mov_ptn 0'(= r ) ⊢ 2'(= r )
	mov rax,r13
	mov r8,rax
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
; .mov_ptn 3'(= r ) ⊢ 1'(= r )
	mov rax,r9
	mov r14,rax
	call ETR_41
	mov r10,QWORD [rsp-8+8*2]
	mov r11,r9
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %114~5'(= r ) %113~2'(= r ) %112~1'(= r ) %111~0'(= r ) %108~4'(= r ) %102~3'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %115~0'(= r ) %114~5'(= r ) %113~2'(= r ) %112~1'(= r ) %108~4'(= r ) %102~3'(= r ) 
; #41 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 6'(= r ) 5'(= r ) 4'(= r ) 3'(= r ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn 5'(= r ) ⊢ 2'(= r )
	mov rax,r11
	mov r8,rax
; .mov_ptn 4'(= r ) ⊢ 1'(= r )
	mov rax,r10
	mov r14,rax
; .mov_ptn 3'(= r ) ⊢ 0'(= r )
	mov rax,r9
	mov r13,rax
	call ETR_41
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
	mov r10,r8
; .mov_ptn 0'(= r ) ⊢ 2'(= r )
	mov rax,r13
	mov r8,rax
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
; .mov_ptn 4'(= r ) ⊢ 1'(= r )
	mov rax,r10
	mov r14,rax
	ret
RTM_3:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #39 %[ 5r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ 5r ] ⊢ 0'(= r )
; .mov_ptn %[ 5r ] ⊢ 0'(= r )
	mov rax,5
	mov r13,rax
	call ETR_39
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
	jmp LB_25
LB_25:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #40 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov rax,0
	mov r8,rax
; .mov_ptn %[ 10r ] ⊢ 1'(= r )
	mov rax,10
	mov r14,rax
; .mov_ptn %[ 20r ] ⊢ 0'(= r )
	mov rax,20
	mov r13,rax
	call ETR_40
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
	jmp LB_26
LB_26:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #41 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov rax,0
	mov r8,rax
; .mov_ptn %[ 10r ] ⊢ 1'(= r )
	mov rax,10
	mov r14,rax
; .mov_ptn %[ 20r ] ⊢ 0'(= r )
	mov rax,20
	mov r13,rax
	call ETR_41
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
	jmp LB_27
LB_27:
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
ETR_42: ;; f0 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
;; rsp=0 , %135~6'(= r ) %134~5'(= r ) %133~4'(= r ) %132~3'(= r ) %131~2'(= r ) %130~1'(= r ) %129~0'(= r ) 
; ∎ { 5'(= r ) 3'(= r ) 6'(= r ) 2'(= r ) 0'(= r ) 1'(= r ) 4'(= r ) }
; .mov_ptn2 { 5'(= r ) 3'(= r ) 6'(= r ) 2'(= r ) 0'(= r ) 1'(= r ) 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
	mov rdx,rcx
; .mov_ptn 4'(= r ) ⊢ 6'(= r )
	mov rax,r10
	mov rcx,rax
	sub rsp,8
	mov QWORD [rsp-8+8*1],r11
; .mov_ptn 1'(= r ) ⊢ 5'(= r )
	mov rax,r14
	mov r11,rax
; .mov_ptn 0'(= r ) ⊢ 4'(= r )
	mov rax,r13
	mov r10,rax
	sub rsp,8
	mov QWORD [rsp-8+8*1],r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
; .mov_ptn 7'(= r ) ⊢ 2'(= r )
	mov rax,rdx
	mov r8,rax
; .mov_ptn 9'(= r ) ⊢ 1'(= r )
	mov rax,QWORD [rsp-8+8*1]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*2]
	mov r13,rax
	add rsp,16
	ret
ETR_43: ;; f1 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %136~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_44: ;; f2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %139~2'(= r ) %138~1'(= r ) %137~0'(= r ) 
; ∎ { 1'(= r ) 2'(= r ) 0'(= r ) }
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
	mov r9,r8
; .mov_ptn 0'(= r ) ⊢ 2'(= r )
	mov rax,r13
	mov r8,rax
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
; .mov_ptn 3'(= r ) ⊢ 1'(= r )
	mov rax,r9
	mov r14,rax
	ret
ETR_45: ;; f3 { } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) } : ({ }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
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
; .mov_ptn %[ 8r ] ⊢ 8'(= r )
	sub rsp,8
	mov rax,8
	mov QWORD [rsp-8+8*1],rax
; .mov_ptn %[ 7r ] ⊢ 7'(= r )
	mov rax,7
	mov rdx,rax
; .mov_ptn %[ 6r ] ⊢ 6'(= r )
	mov rax,6
	mov rcx,rax
; .mov_ptn %[ 5r ] ⊢ 5'(= r )
	mov rax,5
	mov r11,rax
; .mov_ptn %[ 4r ] ⊢ 4'(= r )
	mov rax,4
	mov r10,rax
; .mov_ptn %[ 3r ] ⊢ 3'(= r )
	mov rax,3
	mov r9,rax
; .mov_ptn %[ 2r ] ⊢ 2'(= r )
	mov rax,2
	mov r8,rax
; .mov_ptn %[ 1r ] ⊢ 1'(= r )
	mov rax,1
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov rax,0
	mov r13,rax
	push QWORD [rsp+8*1]
	ret
ETR_46: ;; f4 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ })
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
	add rsp,16
	ret
ETR_47: ;; f5 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
	add rsp,8
;; rsp=2 , %170~9'(= r ) %169~8'(= r ) %168~7'(= r ) %167~6'(= r ) %166~5'(= r ) %165~4'(= r ) %164~3'(= r ) %163~2'(= r ) %162~1'(= r ) %161~0'(= r ) 
; ∎ { 5'(= r ) 3'(= r ) 9'(= r ) 7'(= r ) 8'(= r ) 0'(= r ) 1'(= r ) 6'(= r ) 4'(= r ) 2'(= r ) }
; .mov_ptn2 { 5'(= r ) 3'(= r ) 9'(= r ) 7'(= r ) 8'(= r ) 0'(= r ) 1'(= r ) 6'(= r ) 4'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) }
	sub rsp,8
	MOV_RAX QWORD [rsp-8+8*1],QWORD [rsp-8+8*2]
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*2],rax
	sub rsp,8
	MOV_RAX QWORD [rsp-8+8*1],QWORD [rsp-8+8*4]
; .mov_ptn 4'(= r ) ⊢ 8'(= r )
	mov rax,r10
	mov QWORD [rsp-8+8*4],rax
	sub rsp,8
	mov QWORD [rsp-8+8*1],rdx
; .mov_ptn 6'(= r ) ⊢ 7'(= r )
	mov rax,rcx
	mov rdx,rax
; .mov_ptn 1'(= r ) ⊢ 6'(= r )
	mov rax,r14
	mov rcx,rax
	sub rsp,8
	mov QWORD [rsp-8+8*1],r11
; .mov_ptn 0'(= r ) ⊢ 5'(= r )
	mov rax,r13
	mov r11,rax
; .mov_ptn 11'(= r ) ⊢ 4'(= r )
	mov rax,QWORD [rsp-8+8*3]
	mov r10,rax
	sub rsp,8
	mov QWORD [rsp-8+8*1],r9
; .mov_ptn 12'(= r ) ⊢ 3'(= r )
	mov rax,QWORD [rsp-8+8*3]
	mov r9,rax
; .mov_ptn 10'(= r ) ⊢ 2'(= r )
	mov rax,QWORD [rsp-8+8*5]
	mov r8,rax
; .mov_ptn 14'(= r ) ⊢ 1'(= r )
	mov rax,QWORD [rsp-8+8*1]
	mov r14,rax
; .mov_ptn 13'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*2]
	mov r13,rax
	add rsp,40
	push QWORD [rsp+8*2]
	ret
ETR_48: ;; f6 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %172~1'(= r ) %171~0'(= r ) 
; #15 { 0'(= r ) 1'(= r ) } ⊢|
	imul r13,r14
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_49: ;; f7 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %174~1'(= r ) %173~0'(= r ) 
; #15 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %176~1'(= r ) %175~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_50: ;; f8 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %179~2'(= r ) %178~1'(= r ) %177~0'(= r ) 
; #49 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	call ETR_49
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %181~1'(= r ) %179~2'(= r ) 
; #15 { 1'(= r ) 2'(= r ) } ⊢ { 1'(= r ) 2'(= r ) }
	imul r14,r8
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %182~1'(= r ) 
; ∎ 1'(= r )
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	ret
ETR_51: ;; f9 { } ⊢ 0'(= {| l |} ) : ({ }→_s8)
;; rsp=0 , 
; $ %[ "HELLO WORLD!!" ] ⊢ %[ "HELLO WORLD!!" ]
;; rsp=0 , %184~%[ "HELLO WORLD!!" ] 
; ∎ %[ "HELLO WORLD!!" ]
; .mov_ptn2 %[ "HELLO WORLD!!" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "HELLO WORLD!!" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],13
	mov BYTE [rax+8+0],72
	mov BYTE [rax+8+1],69
	mov BYTE [rax+8+2],76
	mov BYTE [rax+8+3],76
	mov BYTE [rax+8+4],79
	mov BYTE [rax+8+5],32
	mov BYTE [rax+8+6],87
	mov BYTE [rax+8+7],79
	mov BYTE [rax+8+8],82
	mov BYTE [rax+8+9],76
	mov BYTE [rax+8+10],68
	mov BYTE [rax+8+11],33
	mov BYTE [rax+8+12],33
	mov r13,rax
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
; #42 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] } ⊢ { 7'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
; .mov_ptn %[ 6r ] ⊢ 6'(= r )
	mov rax,6
	mov rcx,rax
; .mov_ptn %[ 5r ] ⊢ 5'(= r )
	mov rax,5
	mov r11,rax
; .mov_ptn %[ 4r ] ⊢ 4'(= r )
	mov rax,4
	mov r10,rax
; .mov_ptn %[ 3r ] ⊢ 3'(= r )
	mov rax,3
	mov r9,rax
; .mov_ptn %[ 2r ] ⊢ 2'(= r )
	mov rax,2
	mov r8,rax
; .mov_ptn %[ 1r ] ⊢ 1'(= r )
	mov rax,1
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov rax,0
	mov r13,rax
	call ETR_42
	mov rdx,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %202~6'(= r ) %201~5'(= r ) %200~4'(= r ) %199~3'(= r ) %198~2'(= r ) %197~1'(= r ) %196~7'(= r ) %195~%[ 10r ] %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %0~0'(= {| {| l |}|} ) 
; #44 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 10'(= r ) 9'(= r ) 8'(= r ) }
	sub rsp,64
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn %[ 10r ] ⊢ 2'(= r )
	mov rax,10
	mov r8,rax
; .mov_ptn %[ 9r ] ⊢ 1'(= r )
	mov rax,9
	mov r14,rax
; .mov_ptn %[ 8r ] ⊢ 0'(= r )
	mov rax,8
	mov r13,rax
	call ETR_44
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
; #44 { %[ 7r ] 4'(= r ) 2'(= r ) } ⊢ { 11'(= r ) 4'(= r ) 2'(= r ) }
	sub rsp,48
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 { %[ 7r ] 4'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; .mov_ptn 4'(= r ) ⊢ 1'(= r )
	mov rax,r10
	mov r14,rax
; .mov_ptn %[ 7r ] ⊢ 0'(= r )
	mov rax,7
	mov r13,rax
	call ETR_44
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
; #45 { } ⊢ { 19'(= r ) 18'(= r ) 17'(= r ) 16'(= r ) 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
	sub rsp,64
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 { } ⊢ { }
	call ETR_45
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
; #46 { %[ 1r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { }
	sub rsp,64
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
	push LB_28
	sub rsp,16
; .mov_ptn2 { %[ 1r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 31'(= r ) 32'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 32'(= r )
	mov rax,0
	mov QWORD [rsp-8+8*1],rax
; .mov_ptn %[ 0r ] ⊢ 31'(= r )
	mov rax,0
	mov QWORD [rsp-8+8*2],rax
; .mov_ptn %[ 0r ] ⊢ 7'(= r )
	mov rax,0
	mov rdx,rax
; .mov_ptn %[ 0r ] ⊢ 6'(= r )
	mov rax,0
	mov rcx,rax
; .mov_ptn %[ 0r ] ⊢ 5'(= r )
	mov rax,0
	mov r11,rax
; .mov_ptn %[ 0r ] ⊢ 4'(= r )
	mov rax,0
	mov r10,rax
; .mov_ptn %[ 0r ] ⊢ 3'(= r )
	mov rax,0
	mov r9,rax
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov rax,0
	mov r8,rax
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	call ETR_46
LB_28:
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
; #47 { 19'(= r ) 11'(= r ) 16'(= r ) 10'(= r ) 6'(= r ) 2'(= r ) 18'(= r ) 17'(= r ) 9'(= r ) 8'(= r ) } ⊢ { 17'(= r ) 16'(= r ) 2'(= r ) 11'(= r ) 10'(= r ) 9'(= r ) 6'(= r ) 8'(= r ) 29'(= r ) 30'(= r ) }
	sub rsp,48
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*4],r11
	mov QWORD [rsp+8*5],rdx
	push LB_29
	sub rsp,16
; .mov_ptn2 { 19'(= r ) 11'(= r ) 16'(= r ) 10'(= r ) 6'(= r ) 2'(= r ) 18'(= r ) 17'(= r ) 9'(= r ) 8'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 29'(= r ) 30'(= r ) }
; .mov_ptn 8'(= r ) ⊢ 30'(= r )
	mov rax,QWORD [rsp-8+8*23]
	mov QWORD [rsp-8+8*1],rax
; .mov_ptn 9'(= r ) ⊢ 29'(= r )
	mov rax,QWORD [rsp-8+8*22]
	mov QWORD [rsp-8+8*2],rax
; .mov_ptn 17'(= r ) ⊢ 7'(= r )
	mov rax,QWORD [rsp-8+8*14]
	mov rdx,rax
	mov QWORD [rsp-8+8*19],rcx
; .mov_ptn 18'(= r ) ⊢ 6'(= r )
	mov rax,QWORD [rsp-8+8*13]
	mov rcx,rax
; .mov_ptn 2'(= r ) ⊢ 5'(= r )
	mov rax,r8
	mov r11,rax
; .mov_ptn 12'(= r ) ⊢ 4'(= r )
	mov rax,QWORD [rsp-8+8*19]
	mov r10,rax
; .mov_ptn 10'(= r ) ⊢ 3'(= r )
	mov rax,QWORD [rsp-8+8*21]
	mov r9,rax
; .mov_ptn 16'(= r ) ⊢ 2'(= r )
	mov rax,QWORD [rsp-8+8*15]
	mov r8,rax
; .mov_ptn 11'(= r ) ⊢ 1'(= r )
	mov rax,QWORD [rsp-8+8*20]
	mov r14,rax
; .mov_ptn 19'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*12]
	mov r13,rax
	call ETR_47
LB_29:
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
	jmp LB_30
LB_30:
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
	jmp LB_31
LB_31:
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
	jmp LB_32
LB_32:
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
	jmp LB_33
LB_33:
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
	jmp LB_34
LB_34:
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
	jmp LB_35
LB_35:
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
	jmp LB_36
LB_36:
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
	jmp LB_37
LB_37:
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
	jmp LB_38
LB_38:
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
	jmp LB_39
LB_39:
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
	jmp LB_40
LB_40:
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
	jmp LB_41
LB_41:
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
	jmp LB_42
LB_42:
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
	jmp LB_43
LB_43:
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
	jmp LB_44
LB_44:
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
	jmp LB_45
LB_45:
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
ETR_56: ;; of_s8 0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] ) : (_s8→_t5)
;; rsp=0 , %244~0'(= {| l |} ) 
; #54 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %245~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<4)◂1'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_57: ;; len 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) } : (_t5→{ _t5 _r64 })
;; rsp=0 , %246~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_46
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
	mov r9, QWORD [r13+24]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	mov rax,[SS_RCD_3_TOP]
	mov QWORD [rdi],rax 
	mov QWORD [SS_RCD_3_TOP],rdi
;; rsp=0 , %251~3'(= a5◂ [ ] ) %250~2'(= r ) %249~1'(= a5◂ [ ] ) 
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r13,rax
;; rsp=0 , %253~0'(= r ) %252~2'(= r ) %251~3'(= a5◂ [ ] ) %249~1'(= a5◂ [ ] ) 
; #55 { 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %254~0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } %252~2'(= r ) 
; ∎ { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r10,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3, rax
	mov r11,rax
	mov rax,r14
	mov QWORD [r11+8+8*0],rax
	mov rax,r10
	mov QWORD [r11+8+8*1],rax
	mov rax,r9
	mov QWORD [r11+8+8*2],rax
	mov rax,r11
	mov BYTE [rax+6],0
	mov r13,rax
; .mov_ptn 2'(= r ) ⊢ 1'(= r )
	mov rax,r8
	mov r14,rax
	ret
LB_46:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
	mov rdi,r13
	cmp BYTE [rdi+6],1
	jnz LB_47
;; rsp=0 , %248~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r14,rsi
;; rsp=0 , %256~1'(= r ) %255~0'(= {| l |} ) 
; #54 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %257~1(<4)◂0'(= {| l |} ) %256~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1(<4)◂2'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r8
	mov BYTE [rax+6],1
	mov r13,rax
	ret
LB_47:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_48
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %247~1'(= r ) 
; #52 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %258~3(<4)◂1'(= r ) 
; ∎ { 3(<4)◂1'(= r ) %[ 1r ] }
; .mov_ptn2 { 3(<4)◂1'(= r ) %[ 1r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn 3(<4)◂1'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
; .mov_ptn %[ 1r ] ⊢ 1'(= r )
	mov rax,1
	mov r14,rax
	ret
LB_48:
;; ?. 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
;; rsp=0 , 
; #53 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %259~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r13,rax
	ret
ETR_58: ;; add_s8 { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _s8 }→_t5)
;; rsp=0 , %261~1'(= {| l |} ) %260~0'(= a5◂ [ ] ) 
; #9 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r8,rsi
;; rsp=0 , %263~2'(= r ) %262~1'(= {| l |} ) %260~0'(= a5◂ [ ] ) 
; #57 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 3'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_57
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %265~3'(= r ) %264~0'(= a5◂ [ ] ) %263~2'(= r ) %262~1'(= {| l |} ) 
; #13 { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %267~3'(= r ) %266~2'(= r ) %264~0'(= a5◂ [ ] ) %262~1'(= {| l |} ) 
; #54 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %268~1(<4)◂1'(= {| l |} ) %267~3'(= r ) %266~2'(= r ) %264~0'(= a5◂ [ ] ) 
; #55 { 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
;; rsp=0 , %269~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } %267~3'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
; .dlt.ptn 3'(= r )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3, rax
	mov r10,rax
	mov rax,r9
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_59: ;; pfx_s8 { 0'(= {| l |} ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _s8 _t5 }→_t5)
;; rsp=0 , %271~1'(= a5◂ [ ] ) %270~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r8,rsi
;; rsp=0 , %273~2'(= r ) %272~0'(= {| l |} ) %271~1'(= a5◂ [ ] ) 
; #57 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_57
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %275~1'(= r ) %274~3'(= a5◂ [ ] ) %273~2'(= r ) %272~0'(= {| l |} ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %277~1'(= r ) %276~2'(= r ) %274~3'(= a5◂ [ ] ) %272~0'(= {| l |} ) 
; #54 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %278~1(<4)◂0'(= {| l |} ) %277~1'(= r ) %276~2'(= r ) %274~3'(= a5◂ [ ] ) 
; #55 { 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %279~0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } %277~1'(= r ) 
; ∎ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1(<4)◂1'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3, rax
	mov r10,rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r9
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_60: ;; add_chr { 0'(= a5◂ [ ] ) 1'(= r ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _r64 }→_t5)
;; rsp=0 , %281~1'(= r ) %280~0'(= a5◂ [ ] ) 
; #57 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_57
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %283~2'(= r ) %282~0'(= a5◂ [ ] ) %281~1'(= r ) 
; #11 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %284~2'(= r ) %282~0'(= a5◂ [ ] ) %281~1'(= r ) 
; #52 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %285~3(<4)◂1'(= r ) %284~2'(= r ) %282~0'(= a5◂ [ ] ) 
; #55 { 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
;; rsp=0 , %286~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3, rax
	mov r10,rax
	mov rax,r9
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r14
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_61: ;; pfx_chr { 0'(= r ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _r64 _t5 }→_t5)
;; rsp=0 , %288~1'(= a5◂ [ ] ) %287~0'(= r ) 
; #57 1'(= a5◂ [ ] ) ⊢ { 2'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_57
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %290~1'(= r ) %289~2'(= a5◂ [ ] ) %287~0'(= r ) 
; #11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %291~1'(= r ) %289~2'(= a5◂ [ ] ) %287~0'(= r ) 
; #52 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %292~3(<4)◂0'(= r ) %291~1'(= r ) %289~2'(= a5◂ [ ] ) 
; #55 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
;; rsp=0 , %293~0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } 
; ∎ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3(<4)◂3'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3, rax
	mov r10,rax
	mov rax,r9
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
	mov rax,r8
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_62: ;; cct { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _t5 }→_t5)
;; rsp=0 , %295~1'(= a5◂ [ ] ) %294~0'(= a5◂ [ ] ) 
; #57 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_57
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %297~2'(= r ) %296~0'(= a5◂ [ ] ) %295~1'(= a5◂ [ ] ) 
; #57 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_57
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %299~1'(= r ) %298~3'(= a5◂ [ ] ) %297~2'(= r ) %296~0'(= a5◂ [ ] ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %301~1'(= r ) %300~2'(= r ) %298~3'(= a5◂ [ ] ) %296~0'(= a5◂ [ ] ) 
; #55 { 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %302~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } %301~1'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3, rax
	mov r10,rax
	mov rax,r14
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r9
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_63: ;; mk_s8_i { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t5 _s8 _r64 }→{ _t5 _s8 _r64 })
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) %303~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a5◂ [ ] ) 4'(= r ) 5'(= a5◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_49
	mov r9, QWORD [r13+8]
	mov r10, QWORD [r13+16]
	mov r11, QWORD [r13+24]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	mov rax,[SS_RCD_3_TOP]
	mov QWORD [rdi],rax 
	mov QWORD [SS_RCD_3_TOP],rdi
;; rsp=0 , %310~5'(= a5◂ [ ] ) %309~4'(= r ) %308~3'(= a5◂ [ ] ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #63 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r10
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_63
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %313~2'(= r ) %312~1'(= {| l |} ) %311~0'(= a5◂ [ ] ) %310~5'(= a5◂ [ ] ) %309~4'(= r ) 
; #63 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 5'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r11
	mov r13,rax
	call ETR_63
	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %316~2'(= r ) %315~1'(= {| l |} ) %314~3'(= a5◂ [ ] ) %311~0'(= a5◂ [ ] ) %309~4'(= r ) 
; #55 { 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %317~0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } %316~2'(= r ) %315~1'(= {| l |} ) 
; ∎ { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r11,r13
; .mov_ptn 0(<4)◂{ 5'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3, rax
	mov rcx,rax
	mov rax,r11
	mov QWORD [rcx+8+8*0],rax
	mov rax,r10
	mov QWORD [rcx+8+8*1],rax
	mov rax,r9
	mov QWORD [rcx+8+8*2],rax
	mov rax,rcx
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_49:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_50
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) 
; #53 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %318~2(<4)◂{ } %305~2'(= r ) %304~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r13,rax
	ret
LB_50:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_51
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %307~3'(= r ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #16 { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
; _sts { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
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
; #52 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %323~3(<4)◂3'(= r ) %322~2'(= r ) %319~1'(= {| l |} ) 
; ∎ { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3(<4)◂3'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_51:
;; ?. 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %306~0'(= {| l |} ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r9,rsi
;; rsp=0 , %325~3'(= r ) %324~0'(= {| l |} ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #19 { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
; _rep_movsb { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
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
; #54 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
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
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r13
; .mov_ptn 1(<4)◂3'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_64: ;; mk_s8 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } : (_t5→{ _t5 _s8 })
;; rsp=0 , %334~0'(= a5◂ [ ] ) 
; #57 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_57
;; rsp=0 , %336~1'(= r ) %335~0'(= a5◂ [ ] ) 
; #8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %338~2'(= {| l |} ) %337~1'(= r ) %335~0'(= a5◂ [ ] ) 
; #63 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r8
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov rax,0
	mov r8,rax
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	call ETR_63
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %341~2'(= r ) %340~3'(= {| l |} ) %339~0'(= a5◂ [ ] ) %337~1'(= r ) 
; ∎ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) }
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
; .mov_ptn2 { 0'(= a5◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_52:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_58+8*rax]
LB_58: dq LB_54,LB_55,LB_56,LB_57
LB_54:
	mov rdi,LB_60
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_52
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
	call LB_52
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_59
LB_55:
	mov rdi,LB_61
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_59
LB_56:
	mov rdi,LB_62
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_59
LB_57:
	mov rdi,LB_63
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_59
LB_59:
	ret
RTM_5:
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; #54 %[ "Hello" ] ⊢ 1(<4)◂%[ "Hello" ]
;; rsp=23 , %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #56 %[ "World" ] ⊢ 1'(= a5◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ "World" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "World" ] ⊢ 0'(= {| l |} )
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
	call ETR_56
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,192
;; rsp=0 , %343~1'(= a5◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #21 { } ⊢ 2'(= r )
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
;; rsp=0 , %343~1'(= a5◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #62 { 1(<4)◂%[ "Hello" ] 1'(= a5◂ [ ] ) } ⊢ 1'(= a5◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1(<4)◂%[ "Hello" ] 1'(= a5◂ [ ] ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) }
; .mov_ptn 1(<4)◂%[ "Hello" ] ⊢ 0'(= a5◂ [ ] )
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
	mov BYTE [rax+6],1
	mov r13,rax
	call ETR_62
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %345~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %345~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_52
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_53
LB_53:
;; rsp=0 , %346~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #21 { } ⊢ 2'(= r )
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
;; rsp=0 , %346~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #58 { 1'(= a5◂ [ ] ) %[ "!!" ] } ⊢ 1'(= a5◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1'(= a5◂ [ ] ) %[ "!!" ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
; .mov_ptn %[ "!!" ] ⊢ 1'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],33
	mov BYTE [rax+8+1],33
	mov r14,rax
	call ETR_58
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %348~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_52
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_64
LB_64:
;; rsp=0 , %349~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #52 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %350~3(<4)◂%[ 44r ] %349~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #62 { 1'(= a5◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ 1'(= a5◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1'(= a5◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) }
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
; .mov_ptn 3(<4)◂%[ 44r ] ⊢ 1'(= a5◂ [ ] )
	mov rax,44
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r14,rax
	call ETR_62
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %351~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_52
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_65
LB_65:
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_6
ETR_65:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_65
	ret
GRM_65:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_69
	jmp LB_70
LB_69:
	mov r8,unt_1
	jmp LB_67
LB_70:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_71
	jmp LB_72
LB_71:
	mov r8,unt_1
	jmp LB_67
LB_72:
	add r14,1
	jmp LB_68
LB_67:
	add rsp,0
	jmp LB_66
LB_68:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_75
	jmp LB_76
LB_75:
	jmp LB_73
LB_76:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_74
LB_73:
	add rsp,0
	jmp LB_66
LB_74:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_77
LB_77
;; rsp=0 , %355~1'(= r ) %354~0'(= r ) %353~{ } 
; #24 { } ⊢ 0(<2)◂{ }
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
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_78
LB_78:
	cmp BYTE [r8+6],0
	jnz LB_66
	POP_GRM_SCC
	ret
LB_66:
	POP_GRM_FAIL 
	ret
ETR_66:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_66
	ret
GRM_66:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_82
	jmp LB_83
LB_82:
	mov r8,unt_1
	jmp LB_80
LB_83:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_84
	jmp LB_85
LB_84:
	mov r8,unt_1
	jmp LB_80
LB_85:
	add r14,1
	jmp LB_81
LB_80:
	add rsp,0
	jmp LB_79
LB_81:
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_88
	jmp LB_89
LB_88:
	jmp LB_86
LB_89:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_87
LB_86:
	add rsp,0
	jmp LB_79
LB_87:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_90
LB_90
;; rsp=1 , %359~1'(= r ) %358~0'(= r ) %357~8'(= a5◂ [ ] ) 
; #24 8'(= a5◂ [ ] ) ⊢ 0(<2)◂8'(= a5◂ [ ] )
;; rsp=1 , %360~0(<2)◂8'(= a5◂ [ ] ) %359~1'(= r ) %358~0'(= r ) 
; ∎ 0(<2)◂8'(= a5◂ [ ] )
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
; .mov_ptn2 0(<2)◂8'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂8'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_91
LB_91:
	cmp BYTE [r8+6],0
	jnz LB_79
	POP_GRM_SCC
	ret
LB_79:
	POP_GRM_FAIL 
	ret
ETR_67:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_67
	ret
GRM_67:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_95
	jmp LB_96
LB_95:
	mov r8,unt_1
	jmp LB_93
LB_96:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_97
	jmp LB_98
LB_97:
	mov r8,unt_1
	jmp LB_93
LB_98:
	add r14,1
	jmp LB_94
LB_93:
	add rsp,0
	jmp LB_92
LB_94:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_99
LB_99
;; rsp=0 , %363~1'(= r ) %362~0'(= r ) %361~{ } 
; #25 { } ⊢ 1(<2)◂{ }
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_100
LB_100:
	cmp BYTE [r8+6],0
	jnz LB_92
	POP_GRM_SCC
	ret
LB_92:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_104
	jmp LB_105
LB_104:
	mov r8,unt_1
	jmp LB_102
LB_105:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_106
	jmp LB_107
LB_106:
	mov r8,unt_1
	jmp LB_102
LB_107:
	add r14,1
	jmp LB_103
LB_102:
	add rsp,0
	jmp LB_101
LB_103:
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_110
	jmp LB_111
LB_110:
	jmp LB_108
LB_111:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_109
LB_108:
	add rsp,0
	jmp LB_101
LB_109:
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_114
	jmp LB_115
LB_114:
	jmp LB_112
LB_115:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_113
LB_112:
	add rsp,8
	jmp LB_101
LB_113:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_116
LB_116
;; rsp=2 , %368~1'(= r ) %367~0'(= r ) %366~9'(= a5◂ [ ] ) %365~8'(= r ) 
; #61 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_61
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %369~2'(= a5◂ [ ] ) %368~1'(= r ) %367~0'(= r ) 
; #24 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %370~0(<2)◂2'(= a5◂ [ ] ) %368~1'(= r ) %367~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_117
LB_117:
	cmp BYTE [r8+6],0
	jnz LB_101
	POP_GRM_SCC
	ret
LB_101:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_121
	jmp LB_122
LB_121:
	mov r8,unt_1
	jmp LB_119
LB_122:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_123
	jmp LB_124
LB_123:
	mov r8,unt_1
	jmp LB_119
LB_124:
	add r14,1
	jmp LB_120
LB_119:
	add rsp,0
	jmp LB_118
LB_120:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_125
LB_125
;; rsp=0 , %372~1'(= r ) %371~0'(= r ) 
; #53 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %373~2(<4)◂{ } %372~1'(= r ) %371~0'(= r ) 
; #24 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
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
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_126
LB_126:
	cmp BYTE [r8+6],0
	jnz LB_118
	POP_GRM_SCC
	ret
LB_118:
	RB_GRM
	cmp r14,r9
	jge LB_130
	jmp LB_131
LB_130:
	mov r8,unt_1 
	jmp LB_128
LB_131:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_129
LB_128:
	add rsp,0
	jmp LB_127
LB_129:
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_134
	jmp LB_135
LB_134:
	jmp LB_132
LB_135:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_133
LB_132:
	add rsp,8
	jmp LB_127
LB_133:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_136
LB_136
;; rsp=2 , %378~1'(= r ) %377~0'(= r ) %376~9'(= a5◂ [ ] ) %375~8'(= r ) 
; #61 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_61
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %379~2'(= a5◂ [ ] ) %378~1'(= r ) %377~0'(= r ) 
; #24 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %380~0(<2)◂2'(= a5◂ [ ] ) %378~1'(= r ) %377~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_137
LB_137:
	cmp BYTE [r8+6],0
	jnz LB_127
	POP_GRM_SCC
	ret
LB_127:
	POP_GRM_FAIL 
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
	jg LB_141
	jmp LB_142
LB_141:
	mov r8,unt_1
	jmp LB_139
LB_142:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_143
	jmp LB_144
LB_143:
	mov r8,unt_1
	jmp LB_139
LB_144:
	add r14,1
	jmp LB_140
LB_139:
	add rsp,0
	jmp LB_138
LB_140:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_145
LB_145
;; rsp=0 , %382~1'(= r ) %381~0'(= r ) 
; #24 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
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
; .mov_ptn 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,92
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_146
LB_146:
	cmp BYTE [r8+6],0
	jnz LB_138
	POP_GRM_SCC
	ret
LB_138:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_150
	jmp LB_151
LB_150:
	mov r8,unt_1
	jmp LB_148
LB_151:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_152
	jmp LB_153
LB_152:
	mov r8,unt_1
	jmp LB_148
LB_153:
	add r14,1
	jmp LB_149
LB_148:
	add rsp,0
	jmp LB_147
LB_149:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_154
LB_154
;; rsp=0 , %385~1'(= r ) %384~0'(= r ) 
; #24 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
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
; .mov_ptn 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,34
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_155
LB_155:
	cmp BYTE [r8+6],0
	jnz LB_147
	POP_GRM_SCC
	ret
LB_147:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_159
	jmp LB_160
LB_159:
	mov r8,unt_1
	jmp LB_157
LB_160:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_161
	jmp LB_162
LB_161:
	mov r8,unt_1
	jmp LB_157
LB_162:
	add r14,1
	jmp LB_158
LB_157:
	add rsp,0
	jmp LB_156
LB_158:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_163
LB_163
;; rsp=0 , %388~1'(= r ) %387~0'(= r ) 
; #24 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
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
; .mov_ptn 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,10
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_164
LB_164:
	cmp BYTE [r8+6],0
	jnz LB_156
	POP_GRM_SCC
	ret
LB_156:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_168
	jmp LB_169
LB_168:
	mov r8,unt_1
	jmp LB_166
LB_169:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_170
	jmp LB_171
LB_170:
	mov r8,unt_1
	jmp LB_166
LB_171:
	add r14,1
	jmp LB_167
LB_166:
	add rsp,0
	jmp LB_165
LB_167:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_172
LB_172
;; rsp=0 , %391~1'(= r ) %390~0'(= r ) 
; #24 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
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
; .mov_ptn 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,9
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_173
LB_173:
	cmp BYTE [r8+6],0
	jnz LB_165
	POP_GRM_SCC
	ret
LB_165:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_177
	jmp LB_178
LB_177:
	mov r8,unt_1
	jmp LB_175
LB_178:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_179
	jmp LB_180
LB_179:
	mov r8,unt_1
	jmp LB_175
LB_180:
	add r14,1
	jmp LB_176
LB_175:
	add rsp,0
	jmp LB_174
LB_176:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_181
LB_181
;; rsp=0 , %394~1'(= r ) %393~0'(= r ) 
; #24 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
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
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_182
LB_182:
	cmp BYTE [r8+6],0
	jnz LB_174
	POP_GRM_SCC
	ret
LB_174:
	POP_GRM_FAIL 
	ret
LB_183:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_187+8*rax]
LB_187: dq LB_185,LB_186
LB_185:
	mov rdi,LB_189
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_52
	jmp LB_188
LB_186:
	mov rdi,LB_190
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_188
LB_188:
	ret
LB_193:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_198+8*rax]
LB_198: dq LB_194,LB_195,LB_196,LB_197
LB_194:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_193
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_193
	pop r8 
	jmp LB_199
LB_195:
	mov rdi,r8
	call free_s8
	jmp LB_199
LB_196:
	jmp LB_199
LB_197:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_199
LB_199:
	ret
ETR_69: ;; E1 { } ⊢ { } : ({ }→{ })
;; rsp=0 , 
; #66 { %[ "\"Ho\\\"o\"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
; .mov_ptn2 { %[ "\"Ho\\\"o\"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "\"Ho\\\"o\"" ] ⊢ 0'(= {| l |} )
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
	call ETR_66
;; rsp=0 , %398~2'(= a3◂ [ a5◂ [ ]] ) %397~1'(= r ) %396~0'(= {| l |} ) 
; #10 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
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
	call LB_183
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_184
LB_184:
;; rsp=0 , %401~2'(= a3◂ [ a5◂ [ ]] ) %400~1'(= r ) %399~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 0(<2)◂3'(= a5◂ [ ] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_191
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %402~3'(= a5◂ [ ] ) %400~1'(= r ) %399~0'(= {| l |} ) 
; #64 3'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_64
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %404~2'(= {| l |} ) %403~3'(= a5◂ [ ] ) %400~1'(= r ) %399~0'(= {| l |} ) 
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
	jmp LB_192
LB_192:
;; rsp=0 , %405~2'(= {| l |} ) %403~3'(= a5◂ [ ] ) %400~1'(= r ) %399~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 3'(= a5◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_193
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
	ret
LB_191:
;; ?. 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 1(<2)◂{ }
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
	ret
RTM_6:
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #69 { } ⊢ { }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { } ⊢ { }
	call ETR_69
	mov r14,QWORD [rsp-8+8*2]
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
; .dlt.ptn { }
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_7
ETR_70:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_70
	ret
GRM_70:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_203
	jmp LB_204
LB_203:
	mov r8,unt_1
	jmp LB_201
LB_204:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_205
	jmp LB_206
LB_205:
	mov r8,unt_1
	jmp LB_201
LB_206:
	add r14,1
	jmp LB_202
LB_201:
	add rsp,0
	jmp LB_200
LB_202:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_209
	jmp LB_210
LB_209:
	jmp LB_207
LB_210:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_208
LB_207:
	add rsp,0
	jmp LB_200
LB_208:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_211
LB_211
;; rsp=1 , %409~1'(= r ) %408~0'(= r ) %407~8'(= r ) 
; #24 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
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
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_212
LB_212:
	cmp BYTE [r8+6],0
	jnz LB_200
	POP_GRM_SCC
	ret
LB_200:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_216
	jmp LB_217
LB_216:
	mov r8,unt_1
	jmp LB_214
LB_217:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_218
	jmp LB_219
LB_218:
	mov r8,unt_1
	jmp LB_214
LB_219:
	add r14,1
	jmp LB_215
LB_214:
	add rsp,0
	jmp LB_213
LB_215:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_220
LB_220
;; rsp=0 , %412~1'(= r ) %411~0'(= r ) 
; #24 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
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
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_221
LB_221:
	cmp BYTE [r8+6],0
	jnz LB_213
	POP_GRM_SCC
	ret
LB_213:
	POP_GRM_FAIL 
	ret
ETR_71:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_71
	ret
GRM_71:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_225
	jmp LB_226
LB_225:
	mov r8,unt_1
	jmp LB_223
LB_226:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_227
	jmp LB_228
LB_227:
	mov r8,unt_1
	jmp LB_223
LB_228:
	add r14,1
	jmp LB_224
LB_223:
	add rsp,0
	jmp LB_222
LB_224:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_231
	jmp LB_232
LB_231:
	jmp LB_229
LB_232:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_230
LB_229:
	add rsp,0
	jmp LB_222
LB_230:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_233
LB_233
;; rsp=1 , %416~1'(= r ) %415~0'(= r ) %414~8'(= r ) 
; #24 8'(= r ) ⊢ 0(<2)◂8'(= r )
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
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_234
LB_234:
	cmp BYTE [r8+6],0
	jnz LB_222
	POP_GRM_SCC
	ret
LB_222:
	RB_GRM
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_238
	jmp LB_239
LB_238:
	jmp LB_236
LB_239:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_237
LB_236:
	add rsp,0
	jmp LB_235
LB_237:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_242
	jmp LB_243
LB_242:
	jmp LB_240
LB_243:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_241
LB_240:
	add rsp,8
	jmp LB_235
LB_241:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_244
LB_244
;; rsp=2 , %421~1'(= r ) %420~0'(= r ) %419~9'(= r ) %418~8'(= r ) 
; #13 { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %423~9'(= r ) %422~8'(= r ) %421~1'(= r ) %420~0'(= r ) 
; #24 8'(= r ) ⊢ 0(<2)◂8'(= r )
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
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_245
LB_245:
	cmp BYTE [r8+6],0
	jnz LB_235
	POP_GRM_SCC
	ret
LB_235:
	POP_GRM_FAIL 
	ret
ETR_72:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_72
	ret
GRM_72:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_249
	jmp LB_250
LB_249:
	mov r8,unt_1
	jmp LB_247
LB_250:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
	jnz LB_251
	jmp LB_252
LB_251:
	mov r8,unt_1
	jmp LB_247
LB_252:
	add r14,1
	jmp LB_248
LB_247:
	add rsp,0
	jmp LB_246
LB_248:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_255
	jmp LB_256
LB_255:
	mov r8,unt_1
	jmp LB_253
LB_256:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
	jnz LB_257
	jmp LB_258
LB_257:
	mov r8,unt_1
	jmp LB_253
LB_258:
	add r14,1
	jmp LB_254
LB_253:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_254:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_259
LB_259
;; rsp=0 , %426~1'(= r ) %425~0'(= r ) 
; #24 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
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
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_260
LB_260:
	cmp BYTE [r8+6],0
	jnz LB_246
	POP_GRM_SCC
	ret
LB_246:
	RB_GRM
	cmp r14,r9
	jge LB_264
	jmp LB_265
LB_264:
	mov r8,unt_1 
	jmp LB_262
LB_265:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_263
LB_262:
	add rsp,0
	jmp LB_261
LB_263:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_268
	jmp LB_269
LB_268:
	mov r8,unt_1
	jmp LB_266
LB_269:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_270
	jmp LB_271
LB_270:
	mov r8,unt_1
	jmp LB_266
LB_271:
	add r14,1
	jmp LB_267
LB_266:
	add rsp,8
	jmp LB_261
LB_267:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_272
LB_272
;; rsp=1 , %430~1'(= r ) %429~0'(= r ) %428~8'(= r ) 
; #24 8'(= r ) ⊢ 0(<2)◂8'(= r )
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
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_273
LB_273:
	cmp BYTE [r8+6],0
	jnz LB_261
	POP_GRM_SCC
	ret
LB_261:
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
	jg LB_277
	jmp LB_278
LB_277:
	mov r8,unt_1
	jmp LB_275
LB_278:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_279
	jmp LB_280
LB_279:
	mov r8,unt_1
	jmp LB_275
LB_280:
	add r14,1
	jmp LB_276
LB_275:
	add rsp,0
	jmp LB_274
LB_276:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_285
	jmp LB_286
LB_285:
	mov r8,unt_1
	jmp LB_283
LB_286:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_287
	jmp LB_288
LB_287:
	mov r8,unt_1
	jmp LB_283
LB_288:
	add r14,1
	jmp LB_284
LB_283:
	add rsp,0
	jmp LB_282
LB_284:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_289
LB_289
;; rsp=0 , %435~1'(= r ) %434~0'(= r ) 
; #24 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
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
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_290
LB_290:
	cmp BYTE [r8+6],0
	jnz LB_282
	POP_GRM_SCC
	jmp LB_281
LB_282:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_294
	jmp LB_295
LB_294:
	mov r8,unt_1
	jmp LB_292
LB_295:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_296
	jmp LB_297
LB_296:
	mov r8,unt_1
	jmp LB_292
LB_297:
	add r14,1
	jmp LB_293
LB_292:
	add rsp,0
	jmp LB_291
LB_293:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_302
	jmp LB_303
LB_302:
	mov r8,unt_1
	jmp LB_300
LB_303:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_304
	jmp LB_305
LB_304:
	mov r8,unt_1
	jmp LB_300
LB_305:
	add r14,1
	jmp LB_301
LB_300:
	add rsp,0
	jmp LB_299
LB_301:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_306
LB_306
;; rsp=0 , %440~1'(= r ) %439~0'(= r ) 
; #24 %[ 3r ] ⊢ 0(<2)◂%[ 3r ]
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
; .mov_ptn 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,3
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_307
LB_307:
	cmp BYTE [r8+6],0
	jnz LB_299
	POP_GRM_SCC
	jmp LB_298
LB_299:
	RB_GRM
	call GRM_73
	cmp BYTE [r8+6],0
	jnz LB_311
	jmp LB_312
LB_311:
	jmp LB_309
LB_312:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_310
LB_309:
	add rsp,0
	jmp LB_308
LB_310:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_313
LB_313
;; rsp=1 , %444~1'(= r ) %443~0'(= r ) %442~8'(= r ) 
; #24 8'(= r ) ⊢ 0(<2)◂8'(= r )
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
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_314
LB_314:
	cmp BYTE [r8+6],0
	jnz LB_308
	POP_GRM_SCC
	jmp LB_298
LB_308:
	POP_GRM_FAIL 
	jmp LB_298
LB_298:
	cmp BYTE [r8+6],0
	jnz LB_315
	jmp LB_316
LB_315:
	add rsp,0
	POP_GRM_FAIL
	jmp LB_281
LB_316:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_317
LB_317
;; rsp=0 , %446~3'(= r ) %438~1'(= r ) %437~0'(= r ) 
; #24 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
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
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_318
LB_318:
	cmp BYTE [r8+6],0
	jnz LB_291
	POP_GRM_SCC
	jmp LB_281
LB_291:
	POP_GRM_FAIL 
	jmp LB_281
LB_281:
	cmp BYTE [r8+6],0
	jnz LB_319
	jmp LB_320
LB_319:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_320:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_321
LB_321
;; rsp=0 , %448~3'(= r ) %433~1'(= r ) %432~0'(= r ) 
; #24 3'(= r ) ⊢ 0(<2)◂3'(= r )
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
; .mov_ptn 0(<2)◂3'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,r9
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_322
LB_322:
	cmp BYTE [r8+6],0
	jnz LB_274
	POP_GRM_SCC
	ret
LB_274:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_326
	jmp LB_327
LB_326:
	mov r8,unt_1
	jmp LB_324
LB_327:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
	jnz LB_328
	jmp LB_329
LB_328:
	mov r8,unt_1
	jmp LB_324
LB_329:
	add r14,1
	jmp LB_325
LB_324:
	add rsp,0
	jmp LB_323
LB_325:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_330
LB_330
;; rsp=0 , %451~1'(= r ) %450~0'(= r ) 
; #24 %[ 2r ] ⊢ 0(<2)◂%[ 2r ]
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
; .mov_ptn 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,2
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_331
LB_331:
	cmp BYTE [r8+6],0
	jnz LB_323
	POP_GRM_SCC
	ret
LB_323:
	POP_GRM_FAIL 
	ret
ETR_74:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_74
	ret
GRM_74:
	PUSH_GRM
	jmp LB_334
LB_333:
	add r14,1 
LB_334:
	cmp r14,r9
	jge LB_335
	JZ_LINE_SPC BYTE [r13+8+r14], LB_333
LB_335
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_338
	jmp LB_339
LB_338:
	mov r8,unt_1
	jmp LB_336
LB_339:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],97
	jnz LB_340
	jmp LB_341
LB_340:
	mov r8,unt_1
	jmp LB_336
LB_341:
	add r14,1
	jmp LB_337
LB_336:
	add rsp,0
	jmp LB_332
LB_337:
	jmp LB_343
LB_342:
	add r14,1 
LB_343:
	cmp r14,r9
	jge LB_344
	JZ_LINE_SPC BYTE [r13+8+r14], LB_342
LB_344
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_347
	jmp LB_348
LB_347:
	mov r8,unt_1
	jmp LB_345
LB_348:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_349
	jmp LB_350
LB_349:
	mov r8,unt_1
	jmp LB_345
LB_350:
	add r14,1
	jmp LB_346
LB_345:
	add rsp,0
	jmp LB_332
LB_346:
	jmp LB_352
LB_351:
	add r14,1 
LB_352:
	cmp r14,r9
	jge LB_353
	JZ_LINE_SPC BYTE [r13+8+r14], LB_351
LB_353
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_356
	jmp LB_357
LB_356:
	mov r8,unt_1
	jmp LB_354
LB_357:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_358
	jmp LB_359
LB_358:
	mov r8,unt_1
	jmp LB_354
LB_359:
	add r14,1
	jmp LB_355
LB_354:
	add rsp,0
	jmp LB_332
LB_355:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_360
LB_360
;; rsp=0 , %454~1'(= r ) %453~0'(= r ) 
; #24 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
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
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_361
LB_361:
	cmp BYTE [r8+6],0
	jnz LB_332
	POP_GRM_SCC
	ret
LB_332:
	RB_GRM
	jmp LB_364
LB_363:
	add r14,1 
LB_364:
	cmp r14,r9
	jge LB_365
	JZ_SPC BYTE [r13+8+r14], LB_363
LB_365
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_368
	jmp LB_369
LB_368:
	mov r8,unt_1
	jmp LB_366
LB_369:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_370
	jmp LB_371
LB_370:
	mov r8,unt_1
	jmp LB_366
LB_371:
	add r14,1
	jmp LB_367
LB_366:
	add rsp,0
	jmp LB_362
LB_367:
	jmp LB_373
LB_372:
	add r14,1 
LB_373:
	cmp r14,r9
	jge LB_374
	JZ_SPC BYTE [r13+8+r14], LB_372
LB_374
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_377
	jmp LB_378
LB_377:
	jmp LB_375
LB_378:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_376
LB_375:
	add rsp,0
	jmp LB_362
LB_376:
	jmp LB_380
LB_379:
	add r14,1 
LB_380:
	cmp r14,r9
	jge LB_381
	JZ_SPC BYTE [r13+8+r14], LB_379
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
	cmp BYTE [rdi+0],122
	jnz LB_386
	jmp LB_387
LB_386:
	mov r8,unt_1
	jmp LB_382
LB_387:
	add r14,1
	jmp LB_383
LB_382:
	add rsp,8
	jmp LB_362
LB_383:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_388
LB_388
;; rsp=1 , %458~1'(= r ) %457~0'(= r ) %456~8'(= r ) 
; #24 8'(= r ) ⊢ 0(<2)◂8'(= r )
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
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_389
LB_389:
	cmp BYTE [r8+6],0
	jnz LB_362
	POP_GRM_SCC
	ret
LB_362:
	RB_GRM
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_393
	jmp LB_394
LB_393:
	jmp LB_391
LB_394:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_392
LB_391:
	add rsp,0
	jmp LB_390
LB_392:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_397
	jmp LB_398
LB_397:
	mov r8,unt_1
	jmp LB_395
LB_398:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_399
	jmp LB_400
LB_399:
	mov r8,unt_1
	jmp LB_395
LB_400:
	add r14,1
	jmp LB_396
LB_395:
	add rsp,8
	jmp LB_390
LB_396:
	call GRM_73
	cmp BYTE [r8+6],0
	jnz LB_403
	jmp LB_404
LB_403:
	jmp LB_401
LB_404:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_402
LB_401:
	add rsp,8
	jmp LB_390
LB_402:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_405
LB_405
;; rsp=2 , %463~1'(= r ) %462~0'(= r ) %461~9'(= r ) %460~8'(= r ) 
; #24 9'(= r ) ⊢ 0(<2)◂9'(= r )
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
; .mov_ptn 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_406
LB_406:
	cmp BYTE [r8+6],0
	jnz LB_390
	POP_GRM_SCC
	ret
LB_390:
	POP_GRM_FAIL 
	ret
LB_407:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_411+8*rax]
LB_411: dq LB_409,LB_410
LB_409:
	mov rdi,LB_413
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_412
LB_410:
	mov rdi,LB_414
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_412
LB_412:
	ret
LB_415:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_418+8*rax]
LB_418: dq LB_416,LB_417
LB_416:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_419
LB_417:
	jmp LB_419
LB_419:
	ret
RTM_7:
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #71 { %[ "ABAB" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "ABAB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "ABAB" ] ⊢ 0'(= {| l |} )
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
	call ETR_71
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %467~2'(= a3◂ [ r] ) %466~3'(= r ) %465~4'(= {| l |} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	call LB_407
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_408
LB_408:
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
	call LB_415
	C_POP_REGS
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #72 { %[ "sY" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "sY" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "sY" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],115
	mov BYTE [rax+8+1],89
	mov r13,rax
	call ETR_72
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %471~2'(= a3◂ [ r] ) %470~3'(= r ) %469~4'(= {| l |} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	call LB_407
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_420
LB_420:
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
	call LB_415
	C_POP_REGS
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #73 { %[ "AB" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "AB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "AB" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov r13,rax
	call ETR_73
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %475~2'(= a3◂ [ r] ) %474~3'(= r ) %473~4'(= {| l |} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	call LB_407
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_421
LB_421:
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
	call LB_415
	C_POP_REGS
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #73 { %[ "ACACe" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "ACACe" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "ACACe" ] ⊢ 0'(= {| l |} )
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
	call ETR_73
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %479~2'(= a3◂ [ r] ) %478~3'(= r ) %477~4'(= {| l |} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	call LB_407
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_422
LB_422:
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
	call LB_415
	C_POP_REGS
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #74 { %[ " a bc d" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ " a bc d" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ " a bc d" ] ⊢ 0'(= {| l |} )
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
	call ETR_74
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %483~2'(= a3◂ [ r] ) %482~3'(= r ) %481~4'(= {| l |} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	call LB_407
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_423
LB_423:
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
	call LB_415
	C_POP_REGS
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_424
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_425
LB_425:
; .dlt.ptn %[ "dd\t\n\"J  " ]
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_8
ETR_75: ;; f2 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %486~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %487~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %488~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
RTM_8:
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	lea rsi,[LB_426+16-1]
	mov rcx,16
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %489~2'(= {| l |} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	jmp LB_427
LB_427:
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #75 %[ 3r ] ⊢ 2'(= r )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 %[ 3r ] ⊢ 0'(= r )
; .mov_ptn %[ 3r ] ⊢ 0'(= r )
	mov rax,3
	mov r13,rax
	call ETR_75
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %491~2'(= r ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #8 2'(= r ) ⊢ { 2'(= r ) 3'(= {| l |} ) }
	mov rdi,r8
	call mlc_s8
	mov r9,rax
;; rsp=0 , %493~3'(= {| l |} ) %492~2'(= r ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	jmp LB_428
LB_428:
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
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_9
ETR_76: ;; f0 { } ⊢ { } : ({ }→{ })
;; rsp=0 , 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,16
	push rdi 
	call mlc_s8
	pop rdi
	mov r13,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_429+16-1]
	mov rcx,16
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %495~0'(= {| l |} ) 
; #10 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_430
LB_430:
;; rsp=0 , %496~0'(= {| l |} ) 
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %497~%[ 3r ] %496~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,77
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_431+1-1]
	mov rcx,1
	rep movsb
	mov rax,3
LB_433:
	cmp rax,0
	jz LB_434
	sub rax,1
	lea rsi,[LB_432+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_433
LB_434:
	mov rax,17
LB_436:
	cmp rax,0
	jz LB_437
	sub rax,1
	lea rsi,[LB_435+4-1]
	mov rcx,4
	rep movsb 
	jmp LB_436
LB_437:
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_438+2-1]
	mov rcx,2
	rep movsb
	lea rsi,[LB_439+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %501~1'(= {| l |} ) %500~%[ 17r ] %499~%[ 3r ] %498~0'(= {| l |} ) 
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
	jmp LB_440
LB_440:
;; rsp=0 , %502~1'(= {| l |} ) %500~%[ 17r ] %499~%[ 3r ] %498~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn %[ 17r ]
; .dlt.ptn %[ 3r ]
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
	ret
ETR_77: ;; f1 0'(= r ) ⊢ { 0'(= r ) 1'(= r ) } : (_r64→{ _r64 _r64 })
;; rsp=0 , %503~0'(= r ) 
; #13 { 0'(= r ) %[ 3r ] } ⊢|
	add r13,3
; .mov_ptn2 { 0'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; .mov_ptn %[ 3r ] ⊢ 1'(= r )
	mov rax,3
	mov r14,rax
	ret
RTM_9:
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #0 { %[ 7r ] %[ "Fu" ] } ⊢ { %[ 7r ] %[ "Fu" ] 2'(= {| {| l |}|} ) }
	mov rdi,7
	push rdi 
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov r8,rax
	mov QWORD [rax],rdi 
LB_441:
	cmp rdi,0 
	jz LB_442
	sub rdi,1
	mov r10,rdi
; .mov_ptn2 %[ "Fu" ] ⊢ 3'(= {| {| l |}|} )
	mov r11,r9
; .mov_ptn %[ "Fu" ] ⊢ 3'(= {| {| l |}|} )
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
	jmp LB_441
LB_442:
; .dlt.ptn %[ "Fu" ]
; .dlt.ptn %[ 7r ]
;; rsp=0 , %506~2'(= {| {| l |}|} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #1 { 2'(= {| {| l |}|} ) %[ 1r ] %[ "Xo" ] } ⊢ { 2'(= {| {| l |}|} ) %[ 1r ] 4'(= {| l |} ) }
; .mov_ptn2 %[ "Xo" ] ⊢ 3'(= {| l |} )
	mov r10,r9
; .mov_ptn %[ "Xo" ] ⊢ 3'(= {| l |} )
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
	mov r11,r10
; .mov_ptn 3'(= {| l |} ) ⊢ 4'(= {| l |} )
	mov rax,r9
	mov r10,rax
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn %[ 1r ]
;; rsp=0 , %507~2'(= {| {| l |}|} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	mov r11,r10
; .mov_ptn 3'(= {| l |} ) ⊢ 4'(= {| l |} )
	mov rax,r9
	mov r10,rax
; .dlt.ptn %[ 3r ]
;; rsp=0 , %512~4'(= {| l |} ) %510~2'(= {| {| l |}|} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	jmp LB_443
LB_443:
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %510~2'(= {| {| l |}|} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "dlt array" ] ⊢ %[ "dlt array" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_444
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_445
LB_445:
; .dlt.ptn %[ "dlt array" ]
;; rsp=0 , %510~2'(= {| {| l |}|} ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
LB_446:
	cmp rsi,rax 
	jz LB_447
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
	jmp LB_446
LB_447:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_448
LB_448:
; .dlt.ptn 2'(= {| {| l |}|} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
LB_449:
	cmp rsi,rax 
	jz LB_450
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
	jmp LB_449
LB_450:
	C_POP_REGS
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_10
LB_453: ;; #78 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) : (_opn◂_opn◂_opn◂_opn◂_opn◂_r64→_opn◂_opn◂_opn◂_opn◂_opn◂_r64)
;; rsp=0 , %516~0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) 
;; ? 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_454
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %517~1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) 
; #24 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
;; rsp=0 , %518~0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) 
; ∎ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
; .mov_ptn2 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
; .mov_ptn 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rax,r14
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_454:
;; ?. 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	mov rdi,LB_455
	call emt_stg 
	jmp err
LB_457:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_460+8*rax]
LB_460: dq LB_458,LB_459
LB_458:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_462
	jmp LB_461
LB_459:
	jmp LB_461
LB_461:
	ret
LB_462:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_465+8*rax]
LB_465: dq LB_463,LB_464
LB_463:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_467
	jmp LB_466
LB_464:
	jmp LB_466
LB_466:
	ret
LB_467:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_470+8*rax]
LB_470: dq LB_468,LB_469
LB_468:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_472
	jmp LB_471
LB_469:
	jmp LB_471
LB_471:
	ret
LB_472:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_475+8*rax]
LB_475: dq LB_473,LB_474
LB_473:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_415
	jmp LB_476
LB_474:
	jmp LB_476
LB_476:
	ret
LB_456:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_479+8*rax]
LB_479: dq LB_477,LB_478
LB_477:
	mov r8,QWORD [r8+8]
	call LB_481
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_480
LB_478:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_480
LB_480:
	ret
LB_481:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_484+8*rax]
LB_484: dq LB_482,LB_483
LB_482:
	mov r8,QWORD [r8+8]
	call LB_486
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_485
LB_483:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_485
LB_485:
	ret
LB_486:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_489+8*rax]
LB_489: dq LB_487,LB_488
LB_487:
	mov r8,QWORD [r8+8]
	call LB_491
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_490
LB_488:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_490
LB_490:
	ret
LB_491:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_494+8*rax]
LB_494: dq LB_492,LB_493
LB_492:
	mov r8,QWORD [r8+8]
	call LB_496
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_495
LB_493:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_495
LB_495:
	ret
LB_496:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_499+8*rax]
LB_499: dq LB_497,LB_498
LB_497:
	mov r8,QWORD [r8+8]
	mov rax,r8
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_500
LB_498:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_500
LB_500:
	ret
LB_501:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_505+8*rax]
LB_505: dq LB_503,LB_504
LB_503:
	mov rdi,LB_507
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_508
	jmp LB_506
LB_504:
	mov rdi,LB_509
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_506
LB_506:
	ret
LB_508:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_512+8*rax]
LB_512: dq LB_510,LB_511
LB_510:
	mov rdi,LB_514
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_515
	jmp LB_513
LB_511:
	mov rdi,LB_516
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_513
LB_513:
	ret
LB_515:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_519+8*rax]
LB_519: dq LB_517,LB_518
LB_517:
	mov rdi,LB_521
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_522
	jmp LB_520
LB_518:
	mov rdi,LB_523
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_520
LB_520:
	ret
LB_522:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_526+8*rax]
LB_526: dq LB_524,LB_525
LB_524:
	mov rdi,LB_528
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_407
	jmp LB_527
LB_525:
	mov rdi,LB_529
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_527
LB_527:
	ret
RTM_10:
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "start info test" ] ⊢ %[ "start info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_451
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_452
LB_452:
; .dlt.ptn %[ "start info test" ]
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 %[ 8r ] ⊢ 0(<2)◂%[ 8r ]
;; rsp=0 , %520~0(<2)◂%[ 8r ] %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %521~0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %522~0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %523~0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %524~0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #78 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rax,8
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r13,rax
	call LB_453
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; $ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_456
	C_POP_REGS
	mov r9,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_456
	C_POP_REGS
	mov r10,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_456
	C_POP_REGS
	mov r11,rax
; .dlt.ptn 5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	call LB_457
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %526~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %526~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_501
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_502
LB_502:
; .dlt.ptn 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_457
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "end info test" ] ⊢ %[ "end info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_530
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_531
LB_531:
; .dlt.ptn %[ "end info test" ]
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_11
RTM_11:
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
