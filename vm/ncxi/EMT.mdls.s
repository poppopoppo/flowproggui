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

LB_6: db 59,32,226,136,142,124,10,101,120,110,32,52,48,48,58,10,0
LB_16: db 48,114,0
LB_18: db 48,114,0
LB_20: db 48,114,0
LB_22: db 10,0
LB_23: db 49,55,0
LB_24: db 75,75,0
LB_27: db 49,55,0
LB_88: db 39,48,226,151,130,0
LB_89: db 39,49,226,151,130,0
LB_90: db 39,50,226,151,130,0
LB_91: db 39,51,226,151,130,0
LB_217: db 39,48,226,151,130,0
LB_218: db 39,49,226,151,130,0
LB_443: db 39,48,226,151,130,0
LB_444: db 39,49,226,151,130,0
LB_454: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_456: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_459: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_461: db 104,0
LB_462: db 103,0
LB_465: db 89,100,32,112,0
LB_468: db 49,55,0
LB_469: db 102,111,111,0
LB_474: db 34,100,108,116,32,97,114,114,97,121,34,0
LB_481: db 34,115,116,97,114,116,32,105,110,102,111,32,116,101,115,116,34,0
LB_487: db 59,32,226,136,142,124,10,101,120,110,32,49,49,51,54,51,58,10,0
LB_539: db 39,48,226,151,130,0
LB_541: db 39,49,226,151,130,0
LB_546: db 39,48,226,151,130,0
LB_548: db 39,49,226,151,130,0
LB_553: db 39,48,226,151,130,0
LB_555: db 39,49,226,151,130,0
LB_560: db 39,48,226,151,130,0
LB_561: db 39,49,226,151,130,0
LB_562: db 34,101,110,100,32,105,110,102,111,32,116,101,115,116,34,0
LB_571: db 39,48,226,151,130,0
LB_572: db 39,49,226,151,130,0
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
ETR_32: ;; f0 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %1~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %2~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
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
; {| 110.. |}
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
; {| 1110.. |}
	mov r8,r14
	mov r14,r13
	mov r13,r14
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
; {| 110.. |}
	ret
ETR_36: ;; f4 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %18~0'(= r ) 
	cmp r13,0
	jnz LB_2
	jmp LB_1
LB_2:
	jmp LB_0
LB_1:
;; rsp=0 , %18~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %19~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
LB_0:
	cmp r13,1
	jnz LB_5
	jmp LB_4
LB_5:
	jmp LB_3
LB_4:
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
; {| 10.. |}
	ret
LB_3:
;; rsp=0 , %18~0'(= r ) 
	mov rdi,LB_6
	call emt_stg 
	jmp err
ETR_37: ;; f5 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %24~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %25~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
ETR_38: ;; fact 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %26~0'(= r ) 
	cmp r13,0
	jnz LB_9
	jmp LB_8
LB_9:
	jmp LB_7
LB_8:
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
LB_7:
	cmp r13,1
	jnz LB_12
	jmp LB_11
LB_12:
	jmp LB_10
LB_11:
;; rsp=0 , %26~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
LB_10:
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
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 1000000010.. |}
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
; {| 110.. |}
	mov r13,r14
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %33~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #11 %[ 0r ] ⊢ %[ 1r ]
;; rsp=0 , %34~%[ 1r ] %0~0'(= {| {| l |}|} ) 
; #32 %[ 1r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; {| 1000000010.. |}
	mov r13,1
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
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 %[ 4r ] ⊢ 0'(= r )
; {| 10000000110.. |}
	mov r13,4
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
	jmp LB_13
LB_13:
;; rsp=0 , %39~1'(= r ) %36~%[ 3r ] %0~0'(= {| {| l |}|} ) 
; #33 { 1'(= r ) %[ 3r ] } ⊢ { 2'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { 1'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; {| 1100000010.. |}
	mov r13,r14
	mov r14,3
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
	mov QWORD [rsp+0],r13
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; {| 1010000010.. |}
	mov r13,r8
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
	jmp LB_14
LB_14:
;; rsp=0 , %43~1'(= r ) %0~0'(= {| {| l |}|} ) 
; #38 1'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; {| 1100000010.. |}
	mov r13,r14
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
	jmp LB_15
LB_15:
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
	mov rdi,LB_16
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_17
LB_17:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %48~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_18
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_19
LB_19:
; .dlt.ptn %[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; #10 %[ 0r ] ⊢ %[ 0r ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_20
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_21
LB_21:
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
	lea rsi,[LB_22+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_23+2-1]
	mov rcx,2
	rep movsb
	mov rax,17
LB_25:
	cmp rax,0
	jz LB_26
	sub rax,1
	lea rsi,[LB_24+2-1]
	mov rcx,2
	rep movsb 
	jmp LB_25
LB_26:
	lea rsi,[LB_27+2-1]
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
	jmp LB_28
LB_28:
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
	cmp r13,0
	jnz LB_31
	jmp LB_30
LB_31:
	jmp LB_29
LB_30:
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
LB_29:
	cmp r13,1
	jnz LB_34
	jmp LB_33
LB_34:
	jmp LB_32
LB_33:
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
LB_32:
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
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 1000000010.. |}
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
; {| 110.. |}
	mov r13,r14
	ret
ETR_40: ;; tak { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
;;0'(= r )=<1'(= r )
	cmp r13,r14
	jg LB_37
	jmp LB_36
LB_37:
	jmp LB_35
LB_36:
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
LB_35:
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
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111111001110.. |}
	mov r8,r11
	mov r14,r10
	mov r13,r9
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
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
; .mov_ptn2 { 5'(= r ) 6'(= r ) 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110111011110.. |}
	mov r8,r10
	mov r14,rcx
	mov r13,r11
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
	mov QWORD [rsp+0],r9
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 2'(= r ) 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 11100000110.. |}
	mov r9,r8
	mov r8,r14
	mov r14,r13
	mov r13,r9
	call ETR_40
	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %91~0'(= r ) %89~4'(= r ) %81~3'(= r ) 
; #40 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ 0'(= r )
; .mov_ptn2 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111110.. |}
	mov r8,r13
	mov r14,r10
	mov r13,r9
	call ETR_40
;; rsp=0 , %92~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
ETR_41: ;; tak_v { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 })
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
;;0'(= r )=<1'(= r )
	cmp r13,r14
	jg LB_40
	jmp LB_39
LB_40:
	jmp LB_38
LB_39:
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
LB_38:
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %98~0'(= r ) %95~2'(= r ) %94~1'(= r ) 
; #41 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
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
	mov QWORD [rsp+0],r9
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r9,r8
	mov r8,r13
	mov r13,r14
	mov r14,r9
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
	mov QWORD [rsp+0],r9
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 11100000110.. |}
	mov r9,r8
	mov r8,r13
	mov r13,r14
	mov r14,r9
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
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 111111001110.. |}
	mov r8,r11
	mov r14,r10
	mov r13,r9
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
; {| 11110.. |}
	mov r10,r8
	mov r8,r13
	mov r13,r14
	mov r14,r10
	ret
RTM_3:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #39 %[ 5r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 %[ 5r ] ⊢ 0'(= r )
; {| 1000000010.. |}
	mov r13,5
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
	jmp LB_41
LB_41:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #40 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r8,0
	mov r14,10
	mov r13,20
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
	jmp LB_42
LB_42:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #41 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110000010.. |}
	mov r8,0
	mov r14,10
	mov r13,20
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
	jmp LB_43
LB_43:
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
ETR_43: ;; f1 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %136~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
; {| 10.. |}
	ret
ETR_44: ;; f2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %139~2'(= r ) %138~1'(= r ) %137~0'(= r ) 
; ∎ { 1'(= r ) 2'(= r ) 0'(= r ) }
; .mov_ptn2 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r9,r8
	mov r8,r13
	mov r13,r14
	mov r14,r9
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
; {| 10.. |}
	add rsp,16
	ret
ETR_47: ;; f5 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
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
ETR_48: ;; f6 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %172~1'(= r ) %171~0'(= r ) 
; #15 { 0'(= r ) 1'(= r ) } ⊢|
	imul r13,r14
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
; {| 110.. |}
	ret
ETR_49: ;; f7 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %174~1'(= r ) %173~0'(= r ) 
; #15 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %176~1'(= r ) %175~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
; {| 110.. |}
	ret
ETR_50: ;; f8 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %179~2'(= r ) %178~1'(= r ) %177~0'(= r ) 
; #49 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r8
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
; {| 1100000010.. |}
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
; {| 110.. |}
	mov r13,r14
	ret
ETR_51: ;; f9 { } ⊢ 0'(= {| l |} ) : ({ }→_s8)
;; rsp=0 , 
; $ %[ "HELLO WORLD!!" ] ⊢ %[ "HELLO WORLD!!" ]
;; rsp=0 , %184~%[ "HELLO WORLD!!" ] 
; ∎ %[ "HELLO WORLD!!" ]
; .mov_ptn2 %[ "HELLO WORLD!!" ] ⊢ 0'(= {| l |} )
; {| 10.. |}
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
	call ETR_42
	mov rdx,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %202~6'(= r ) %201~5'(= r ) %200~4'(= r ) %199~3'(= r ) %198~2'(= r ) %197~1'(= r ) %196~7'(= r ) %195~%[ 10r ] %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %0~0'(= {| {| l |}|} ) 
; #44 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 10'(= r ) 9'(= r ) 8'(= r ) }
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
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
	mov QWORD [rsp+32],r10
	mov QWORD [rsp+40],r11
	mov QWORD [rsp+48],rcx
	mov QWORD [rsp+56],rdx
	push LB_44
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
	call ETR_46
LB_44:
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
	call ETR_47
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
ETR_56: ;; of_s8 0'(= {| l |} ) ⊢ 0'(= a13◂ [ ] ) : (_s8→_t13)
;; rsp=0 , %244~0'(= {| l |} ) 
; #54 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %245~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a13◂ [ ] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	mov BYTE [r13+6],1
	ret
ETR_57: ;; len 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) } : (_t13→{ _t13 _r64 })
;; rsp=0 , %246~0'(= a13◂ [ ] ) 
;; ? 0'(= a13◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_63
	jmp LB_64
LB_63:
	jmp LB_62
LB_64:
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
; #55 { 1'(= a13◂ [ ] ) 0'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a13◂ [ ] ) 0'(= r ) 3'(= a13◂ [ ] ) }
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
LB_62:
;; ? 0'(= a13◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
	mov rdi,r13
	cmp BYTE [rdi+6],1
	jnz LB_66
	jmp LB_67
LB_66:
	jmp LB_65
LB_67:
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
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r8,r13
	mov r13,r8
	mov BYTE [r13+6],1
	ret
LB_65:
;; ? 0'(= a13◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_69
	jmp LB_70
LB_69:
	jmp LB_68
LB_70:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %247~1'(= r ) 
; #52 1'(= r ) ⊢ 3(<4)◂1'(= r )
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
LB_68:
;; ?. 0'(= a13◂ [ ] ) ⊢ 2(<4)◂{ }
;; rsp=0 , 
; #53 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %259~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r14,0
	mov r13,unt_2
	ret
ETR_58: ;; add_s8 { 0'(= a13◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a13◂ [ ] ) : ({ _t13 _s8 }→_t13)
;; rsp=0 , %261~1'(= {| l |} ) %260~0'(= a13◂ [ ] ) 
; #9 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r8,rsi
;; rsp=0 , %263~2'(= r ) %262~1'(= {| l |} ) %260~0'(= a13◂ [ ] ) 
; #57 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 3'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r14
	mov QWORD [rsp+8],r8
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 10000000110.. |}
	call ETR_57
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %265~3'(= r ) %264~0'(= a13◂ [ ] ) %263~2'(= r ) %262~1'(= {| l |} ) 
; #13 { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %267~3'(= r ) %266~2'(= r ) %264~0'(= a13◂ [ ] ) %262~1'(= {| l |} ) 
; #54 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %268~1(<4)◂1'(= {| l |} ) %267~3'(= r ) %266~2'(= r ) %264~0'(= a13◂ [ ] ) 
; #55 { 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
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
ETR_59: ;; pfx_s8 { 0'(= {| l |} ) 1'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] ) : ({ _s8 _t13 }→_t13)
;; rsp=0 , %271~1'(= a13◂ [ ] ) %270~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r8,rsi
;; rsp=0 , %273~2'(= r ) %272~0'(= {| l |} ) %271~1'(= a13◂ [ ] ) 
; #57 1'(= a13◂ [ ] ) ⊢ { 3'(= a13◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r8
; .mov_ptn2 1'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 11000000110.. |}
	mov r13,r14
	call ETR_57
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %275~1'(= r ) %274~3'(= a13◂ [ ] ) %273~2'(= r ) %272~0'(= {| l |} ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %277~1'(= r ) %276~2'(= r ) %274~3'(= a13◂ [ ] ) %272~0'(= {| l |} ) 
; #54 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %278~1(<4)◂0'(= {| l |} ) %277~1'(= r ) %276~2'(= r ) %274~3'(= a13◂ [ ] ) 
; #55 { 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a13◂ [ ] ) }
;; rsp=0 , %279~0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a13◂ [ ] ) } %277~1'(= r ) 
; ∎ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a13◂ [ ] ) }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] )
; {| 10110.. |}
	mov r14,r13
	ALC_RCD 3, rax
	mov r13,rax
	mov r10,r14
	mov BYTE [r10+6],1
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
ETR_60: ;; add_chr { 0'(= a13◂ [ ] ) 1'(= r ) } ⊢ 0'(= a13◂ [ ] ) : ({ _t13 _r64 }→_t13)
;; rsp=0 , %281~1'(= r ) %280~0'(= a13◂ [ ] ) 
; #57 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 1000000010.. |}
	call ETR_57
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %283~2'(= r ) %282~0'(= a13◂ [ ] ) %281~1'(= r ) 
; #11 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %284~2'(= r ) %282~0'(= a13◂ [ ] ) %281~1'(= r ) 
; #52 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %285~3(<4)◂1'(= r ) %284~2'(= r ) %282~0'(= a13◂ [ ] ) 
; #55 { 0'(= a13◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
;; rsp=0 , %286~0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } 
; ∎ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
; .mov_ptn2 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a13◂ [ ] )
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
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r10
	mov r10,rax
	mov rax,r10
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	ret
ETR_61: ;; pfx_chr { 0'(= r ) 1'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] ) : ({ _r64 _t13 }→_t13)
;; rsp=0 , %288~1'(= a13◂ [ ] ) %287~0'(= r ) 
; #57 1'(= a13◂ [ ] ) ⊢ { 2'(= a13◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 1100000010.. |}
	mov r13,r14
	call ETR_57
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %290~1'(= r ) %289~2'(= a13◂ [ ] ) %287~0'(= r ) 
; #11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %291~1'(= r ) %289~2'(= a13◂ [ ] ) %287~0'(= r ) 
; #52 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %292~3(<4)◂0'(= r ) %291~1'(= r ) %289~2'(= a13◂ [ ] ) 
; #55 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a13◂ [ ] ) }
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
ETR_62: ;; cct { 0'(= a13◂ [ ] ) 1'(= a13◂ [ ] ) } ⊢ 0'(= a13◂ [ ] ) : ({ _t13 _t13 }→_t13)
;; rsp=0 , %295~1'(= a13◂ [ ] ) %294~0'(= a13◂ [ ] ) 
; #57 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 1000000010.. |}
	call ETR_57
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %297~2'(= r ) %296~0'(= a13◂ [ ] ) %295~1'(= a13◂ [ ] ) 
; #57 1'(= a13◂ [ ] ) ⊢ { 3'(= a13◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r8
; .mov_ptn2 1'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 11000000110.. |}
	mov r13,r14
	call ETR_57
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %299~1'(= r ) %298~3'(= a13◂ [ ] ) %297~2'(= r ) %296~0'(= a13◂ [ ] ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %301~1'(= r ) %300~2'(= r ) %298~3'(= a13◂ [ ] ) %296~0'(= a13◂ [ ] ) 
; #55 { 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 2'(= r ) 3'(= a13◂ [ ] ) }
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
ETR_63: ;; mk_s8_i { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t13 _s8 _r64 }→{ _t13 _s8 _r64 })
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) %303~0'(= a13◂ [ ] ) 
;; ? 0'(= a13◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a13◂ [ ] ) 4'(= r ) 5'(= a13◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_72
	jmp LB_73
LB_72:
	jmp LB_71
LB_73:
	mov r9, QWORD [r13+8]
	mov r10, QWORD [r13+16]
	mov r11, QWORD [r13+24]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=0 , %310~5'(= a13◂ [ ] ) %309~4'(= r ) %308~3'(= a13◂ [ ] ) %305~2'(= r ) %304~1'(= {| l |} ) 
; #63 { 3'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r10
	mov QWORD [rsp+8],r11
; .mov_ptn2 { 3'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11110000110.. |}
	mov r13,r9
	call ETR_63
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %313~2'(= r ) %312~1'(= {| l |} ) %311~0'(= a13◂ [ ] ) %310~5'(= a13◂ [ ] ) %309~4'(= r ) 
; #63 { 5'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 5'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11100100110.. |}
	mov r13,r11
	call ETR_63
	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %316~2'(= r ) %315~1'(= {| l |} ) %314~3'(= a13◂ [ ] ) %311~0'(= a13◂ [ ] ) %309~4'(= r ) 
; #55 { 0'(= a13◂ [ ] ) 4'(= r ) 3'(= a13◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a13◂ [ ] ) 4'(= r ) 3'(= a13◂ [ ] ) }
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
LB_71:
;; ? 0'(= a13◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_75
	jmp LB_76
LB_75:
	jmp LB_74
LB_76:
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) 
; #53 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %318~2(<4)◂{ } %305~2'(= r ) %304~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r13,unt_2
	ret
LB_74:
;; ? 0'(= a13◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_78
	jmp LB_79
LB_78:
	jmp LB_77
LB_79:
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
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11110.. |}
	mov r13,r9
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_77:
;; ?. 0'(= a13◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
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
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r9,r13
	mov r13,r9
	mov BYTE [r13+6],1
	ret
ETR_64: ;; mk_s8 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) } : (_t13→{ _t13 _s8 })
;; rsp=0 , %334~0'(= a13◂ [ ] ) 
; #57 0'(= a13◂ [ ] ) ⊢ { 0'(= a13◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 10.. |}
	call ETR_57
;; rsp=0 , %336~1'(= r ) %335~0'(= a13◂ [ ] ) 
; #8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %338~2'(= {| l |} ) %337~1'(= r ) %335~0'(= a13◂ [ ] ) 
; #63 { 0'(= a13◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a13◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 { 0'(= a13◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a13◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110000010.. |}
	mov r9,r8
	mov r8,0
	mov r14,r9
	call ETR_63
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
LB_80:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_86+8*rax]
LB_86: dq LB_82,LB_83,LB_84,LB_85
LB_82:
	mov rdi,LB_88
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_80
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
	call LB_80
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_87
LB_83:
	mov rdi,LB_89
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_87
LB_84:
	mov rdi,LB_90
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_87
LB_85:
	mov rdi,LB_91
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_87
LB_87:
	ret
RTM_5:
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; #54 %[ "Hello" ] ⊢ 1(<4)◂%[ "Hello" ]
;; rsp=23 , %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #56 %[ "World" ] ⊢ 1'(= a13◂ [ ] )
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
	call ETR_56
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,192
;; rsp=0 , %343~1'(= a13◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
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
;; rsp=0 , %343~1'(= a13◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; #62 { 1(<4)◂%[ "Hello" ] 1'(= a13◂ [ ] ) } ⊢ 1'(= a13◂ [ ] )
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
	call ETR_62
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %345~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %345~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a13◂ [ ] ) ⊢ 1'(= a13◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_80
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_81
LB_81:
;; rsp=0 , %346~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
;; rsp=0 , %346~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #58 { 1'(= a13◂ [ ] ) %[ "!!" ] } ⊢ 1'(= a13◂ [ ] )
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
	call ETR_58
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
	call LB_80
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_92
LB_92:
;; rsp=0 , %349~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #52 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %350~3(<4)◂%[ 44r ] %349~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #62 { 1'(= a13◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ 1'(= a13◂ [ ] )
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
	call ETR_62
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
	call LB_80
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_93
LB_93:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	jg LB_97
	jmp LB_98
LB_97:
	mov r8,unt_1
	jmp LB_95
LB_98:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_99
	jmp LB_100
LB_99:
	mov r8,unt_1
	jmp LB_95
LB_100:
	add r14,1
	jmp LB_96
LB_95:
	add rsp,0
	jmp LB_94
LB_96:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_103
	jmp LB_104
LB_103:
	jmp LB_101
LB_104:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_102
LB_101:
	add rsp,0
	jmp LB_94
LB_102:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_105
LB_105
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
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_106
LB_106:
	cmp BYTE [r8+6],0
	jnz LB_94
	POP_GRM_SCC
	ret
LB_94:
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
	jg LB_110
	jmp LB_111
LB_110:
	mov r8,unt_1
	jmp LB_108
LB_111:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_112
	jmp LB_113
LB_112:
	mov r8,unt_1
	jmp LB_108
LB_113:
	add r14,1
	jmp LB_109
LB_108:
	add rsp,0
	jmp LB_107
LB_109:
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_116
	jmp LB_117
LB_116:
	jmp LB_114
LB_117:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 8'(= a13◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_115
LB_114:
	add rsp,0
	jmp LB_107
LB_115:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_118
LB_118
;; rsp=1 , %359~1'(= r ) %358~0'(= r ) %357~8'(= a13◂ [ ] ) 
; #24 8'(= a13◂ [ ] ) ⊢ 0(<2)◂8'(= a13◂ [ ] )
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
	jmp LB_119
LB_119:
	cmp BYTE [r8+6],0
	jnz LB_107
	POP_GRM_SCC
	ret
LB_107:
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
	jg LB_123
	jmp LB_124
LB_123:
	mov r8,unt_1
	jmp LB_121
LB_124:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_125
	jmp LB_126
LB_125:
	mov r8,unt_1
	jmp LB_121
LB_126:
	add r14,1
	jmp LB_122
LB_121:
	add rsp,0
	jmp LB_120
LB_122:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_127
LB_127
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_128
LB_128:
	cmp BYTE [r8+6],0
	jnz LB_120
	POP_GRM_SCC
	ret
LB_120:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_132
	jmp LB_133
LB_132:
	mov r8,unt_1
	jmp LB_130
LB_133:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_134
	jmp LB_135
LB_134:
	mov r8,unt_1
	jmp LB_130
LB_135:
	add r14,1
	jmp LB_131
LB_130:
	add rsp,0
	jmp LB_129
LB_131:
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_138
	jmp LB_139
LB_138:
	jmp LB_136
LB_139:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_137
LB_136:
	add rsp,0
	jmp LB_129
LB_137:
	call GRM_67
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
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 9'(= a13◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_141
LB_140:
	add rsp,8
	jmp LB_129
LB_141:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_144
LB_144
;; rsp=2 , %368~1'(= r ) %367~0'(= r ) %366~9'(= a13◂ [ ] ) %365~8'(= r ) 
; #61 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ 2'(= a13◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a13◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call ETR_61
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %369~2'(= a13◂ [ ] ) %368~1'(= r ) %367~0'(= r ) 
; #24 2'(= a13◂ [ ] ) ⊢ 0(<2)◂2'(= a13◂ [ ] )
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
	jmp LB_145
LB_145:
	cmp BYTE [r8+6],0
	jnz LB_129
	POP_GRM_SCC
	ret
LB_129:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_149
	jmp LB_150
LB_149:
	mov r8,unt_1
	jmp LB_147
LB_150:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_151
	jmp LB_152
LB_151:
	mov r8,unt_1
	jmp LB_147
LB_152:
	add r14,1
	jmp LB_148
LB_147:
	add rsp,0
	jmp LB_146
LB_148:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_153
LB_153
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
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_154
LB_154:
	cmp BYTE [r8+6],0
	jnz LB_146
	POP_GRM_SCC
	ret
LB_146:
	RB_GRM
	cmp r14,r9
	jge LB_158
	jmp LB_159
LB_158:
	mov r8,unt_1 
	jmp LB_156
LB_159:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_157
LB_156:
	add rsp,0
	jmp LB_155
LB_157:
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_162
	jmp LB_163
LB_162:
	jmp LB_160
LB_163:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a13◂ [ ] ) ⊢ 9'(= a13◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_161
LB_160:
	add rsp,8
	jmp LB_155
LB_161:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_164
LB_164
;; rsp=2 , %378~1'(= r ) %377~0'(= r ) %376~9'(= a13◂ [ ] ) %375~8'(= r ) 
; #61 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ 2'(= a13◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a13◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a13◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call ETR_61
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %379~2'(= a13◂ [ ] ) %378~1'(= r ) %377~0'(= r ) 
; #24 2'(= a13◂ [ ] ) ⊢ 0(<2)◂2'(= a13◂ [ ] )
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
	jmp LB_165
LB_165:
	cmp BYTE [r8+6],0
	jnz LB_155
	POP_GRM_SCC
	ret
LB_155:
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
	jg LB_169
	jmp LB_170
LB_169:
	mov r8,unt_1
	jmp LB_167
LB_170:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_171
	jmp LB_172
LB_171:
	mov r8,unt_1
	jmp LB_167
LB_172:
	add r14,1
	jmp LB_168
LB_167:
	add rsp,0
	jmp LB_166
LB_168:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_173
LB_173
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
; {| 0010.. |}
	mov r8,92
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_174
LB_174:
	cmp BYTE [r8+6],0
	jnz LB_166
	POP_GRM_SCC
	ret
LB_166:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_178
	jmp LB_179
LB_178:
	mov r8,unt_1
	jmp LB_176
LB_179:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_180
	jmp LB_181
LB_180:
	mov r8,unt_1
	jmp LB_176
LB_181:
	add r14,1
	jmp LB_177
LB_176:
	add rsp,0
	jmp LB_175
LB_177:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_182
LB_182
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
; {| 0010.. |}
	mov r8,34
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_183
LB_183:
	cmp BYTE [r8+6],0
	jnz LB_175
	POP_GRM_SCC
	ret
LB_175:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_187
	jmp LB_188
LB_187:
	mov r8,unt_1
	jmp LB_185
LB_188:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_189
	jmp LB_190
LB_189:
	mov r8,unt_1
	jmp LB_185
LB_190:
	add r14,1
	jmp LB_186
LB_185:
	add rsp,0
	jmp LB_184
LB_186:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_191
LB_191
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
; {| 0010.. |}
	mov r8,10
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_192
LB_192:
	cmp BYTE [r8+6],0
	jnz LB_184
	POP_GRM_SCC
	ret
LB_184:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_196
	jmp LB_197
LB_196:
	mov r8,unt_1
	jmp LB_194
LB_197:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_198
	jmp LB_199
LB_198:
	mov r8,unt_1
	jmp LB_194
LB_199:
	add r14,1
	jmp LB_195
LB_194:
	add rsp,0
	jmp LB_193
LB_195:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_200
LB_200
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
; {| 0010.. |}
	mov r8,9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_201
LB_201:
	cmp BYTE [r8+6],0
	jnz LB_193
	POP_GRM_SCC
	ret
LB_193:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_205
	jmp LB_206
LB_205:
	mov r8,unt_1
	jmp LB_203
LB_206:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_207
	jmp LB_208
LB_207:
	mov r8,unt_1
	jmp LB_203
LB_208:
	add r14,1
	jmp LB_204
LB_203:
	add rsp,0
	jmp LB_202
LB_204:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_209
LB_209
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
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_210
LB_210:
	cmp BYTE [r8+6],0
	jnz LB_202
	POP_GRM_SCC
	ret
LB_202:
	POP_GRM_FAIL 
	ret
LB_211:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_215+8*rax]
LB_215: dq LB_213,LB_214
LB_213:
	mov rdi,LB_217
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_80
	jmp LB_216
LB_214:
	mov rdi,LB_218
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_216
LB_216:
	ret
LB_223:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_228+8*rax]
LB_228: dq LB_224,LB_225,LB_226,LB_227
LB_224:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_223
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_223
	pop r8 
	FREE_RCD 3, r8
	jmp LB_229
LB_225:
	mov rdi,r8
	call free_s8
	jmp LB_229
LB_226:
	jmp LB_229
LB_227:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_229
LB_229:
	ret
ETR_69: ;; E1 { } ⊢ { } : ({ }→{ })
;; rsp=0 , 
; #66 { %[ "\"Ho\\\"o\"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a13◂ [ ]] ) }
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
	call ETR_66
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
	call LB_211
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_212
LB_212:
;; rsp=0 , %401~2'(= a3◂ [ a13◂ [ ]] ) %400~1'(= r ) %399~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a13◂ [ ]] ) ⊢ 0(<2)◂3'(= a13◂ [ ] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_220
	jmp LB_221
LB_220:
	jmp LB_219
LB_221:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %402~3'(= a13◂ [ ] ) %400~1'(= r ) %399~0'(= {| l |} ) 
; #64 3'(= a13◂ [ ] ) ⊢ { 3'(= a13◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a13◂ [ ] ) ⊢ 0'(= a13◂ [ ] )
; {| 10010000110.. |}
	mov r13,r9
	call ETR_64
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
	jmp LB_222
LB_222:
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
	call LB_223
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
LB_219:
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
; #69 { } ⊢ { }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 00000000110.. |}
	call ETR_69
	mov r14,QWORD [rsp-8+8*2]
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
; .dlt.ptn { }
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	jg LB_233
	jmp LB_234
LB_233:
	mov r8,unt_1
	jmp LB_231
LB_234:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_235
	jmp LB_236
LB_235:
	mov r8,unt_1
	jmp LB_231
LB_236:
	add r14,1
	jmp LB_232
LB_231:
	add rsp,0
	jmp LB_230
LB_232:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_239
	jmp LB_240
LB_239:
	jmp LB_237
LB_240:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_238
LB_237:
	add rsp,0
	jmp LB_230
LB_238:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_241
LB_241
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
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_242
LB_242:
	cmp BYTE [r8+6],0
	jnz LB_230
	POP_GRM_SCC
	ret
LB_230:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_246
	jmp LB_247
LB_246:
	mov r8,unt_1
	jmp LB_244
LB_247:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_248
	jmp LB_249
LB_248:
	mov r8,unt_1
	jmp LB_244
LB_249:
	add r14,1
	jmp LB_245
LB_244:
	add rsp,0
	jmp LB_243
LB_245:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_250
LB_250
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
; {| 0010.. |}
	mov r8,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_251
LB_251:
	cmp BYTE [r8+6],0
	jnz LB_243
	POP_GRM_SCC
	ret
LB_243:
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
	jg LB_255
	jmp LB_256
LB_255:
	mov r8,unt_1
	jmp LB_253
LB_256:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
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
	jmp LB_252
LB_254:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_261
	jmp LB_262
LB_261:
	jmp LB_259
LB_262:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_260
LB_259:
	add rsp,0
	jmp LB_252
LB_260:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_263
LB_263
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
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_264
LB_264:
	cmp BYTE [r8+6],0
	jnz LB_252
	POP_GRM_SCC
	ret
LB_252:
	RB_GRM
	call GRM_70
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
	jmp LB_265
LB_267:
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_272
	jmp LB_273
LB_272:
	jmp LB_270
LB_273:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_271
LB_270:
	add rsp,8
	jmp LB_265
LB_271:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_274
LB_274
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
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*2]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_275
LB_275:
	cmp BYTE [r8+6],0
	jnz LB_265
	POP_GRM_SCC
	ret
LB_265:
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
	jg LB_279
	jmp LB_280
LB_279:
	mov r8,unt_1
	jmp LB_277
LB_280:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
	jnz LB_281
	jmp LB_282
LB_281:
	mov r8,unt_1
	jmp LB_277
LB_282:
	add r14,1
	jmp LB_278
LB_277:
	add rsp,0
	jmp LB_276
LB_278:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_285
	jmp LB_286
LB_285:
	mov r8,unt_1
	jmp LB_283
LB_286:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
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
	POP_GRM_FAIL
	ret
LB_284:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_289
LB_289
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
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_290
LB_290:
	cmp BYTE [r8+6],0
	jnz LB_276
	POP_GRM_SCC
	ret
LB_276:
	RB_GRM
	cmp r14,r9
	jge LB_294
	jmp LB_295
LB_294:
	mov r8,unt_1 
	jmp LB_292
LB_295:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_293
LB_292:
	add rsp,0
	jmp LB_291
LB_293:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_298
	jmp LB_299
LB_298:
	mov r8,unt_1
	jmp LB_296
LB_299:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_300
	jmp LB_301
LB_300:
	mov r8,unt_1
	jmp LB_296
LB_301:
	add r14,1
	jmp LB_297
LB_296:
	add rsp,8
	jmp LB_291
LB_297:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_302
LB_302
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
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_303
LB_303:
	cmp BYTE [r8+6],0
	jnz LB_291
	POP_GRM_SCC
	ret
LB_291:
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
	jg LB_307
	jmp LB_308
LB_307:
	mov r8,unt_1
	jmp LB_305
LB_308:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_309
	jmp LB_310
LB_309:
	mov r8,unt_1
	jmp LB_305
LB_310:
	add r14,1
	jmp LB_306
LB_305:
	add rsp,0
	jmp LB_304
LB_306:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_315
	jmp LB_316
LB_315:
	mov r8,unt_1
	jmp LB_313
LB_316:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_317
	jmp LB_318
LB_317:
	mov r8,unt_1
	jmp LB_313
LB_318:
	add r14,1
	jmp LB_314
LB_313:
	add rsp,0
	jmp LB_312
LB_314:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_319
LB_319
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
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_320
LB_320:
	cmp BYTE [r8+6],0
	jnz LB_312
	POP_GRM_SCC
	jmp LB_311
LB_312:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_324
	jmp LB_325
LB_324:
	mov r8,unt_1
	jmp LB_322
LB_325:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_326
	jmp LB_327
LB_326:
	mov r8,unt_1
	jmp LB_322
LB_327:
	add r14,1
	jmp LB_323
LB_322:
	add rsp,0
	jmp LB_321
LB_323:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_332
	jmp LB_333
LB_332:
	mov r8,unt_1
	jmp LB_330
LB_333:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_334
	jmp LB_335
LB_334:
	mov r8,unt_1
	jmp LB_330
LB_335:
	add r14,1
	jmp LB_331
LB_330:
	add rsp,0
	jmp LB_329
LB_331:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_336
LB_336
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
; {| 0010.. |}
	mov r8,3
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_337
LB_337:
	cmp BYTE [r8+6],0
	jnz LB_329
	POP_GRM_SCC
	jmp LB_328
LB_329:
	RB_GRM
	call GRM_73
	cmp BYTE [r8+6],0
	jnz LB_341
	jmp LB_342
LB_341:
	jmp LB_339
LB_342:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_340
LB_339:
	add rsp,0
	jmp LB_338
LB_340:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_343
LB_343
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
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_344
LB_344:
	cmp BYTE [r8+6],0
	jnz LB_338
	POP_GRM_SCC
	jmp LB_328
LB_338:
	POP_GRM_FAIL 
	jmp LB_328
LB_328:
	cmp BYTE [r8+6],0
	jnz LB_345
	jmp LB_346
LB_345:
	add rsp,0
	POP_GRM_FAIL
	jmp LB_311
LB_346:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_347
LB_347
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
; {| 0010.. |}
	mov r8,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_348
LB_348:
	cmp BYTE [r8+6],0
	jnz LB_321
	POP_GRM_SCC
	jmp LB_311
LB_321:
	POP_GRM_FAIL 
	jmp LB_311
LB_311:
	cmp BYTE [r8+6],0
	jnz LB_349
	jmp LB_350
LB_349:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_350:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_351
LB_351
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
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_352
LB_352:
	cmp BYTE [r8+6],0
	jnz LB_304
	POP_GRM_SCC
	ret
LB_304:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_356
	jmp LB_357
LB_356:
	mov r8,unt_1
	jmp LB_354
LB_357:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
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
	jmp LB_353
LB_355:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_360
LB_360
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
; {| 0010.. |}
	mov r8,2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_361
LB_361:
	cmp BYTE [r8+6],0
	jnz LB_353
	POP_GRM_SCC
	ret
LB_353:
	POP_GRM_FAIL 
	ret
ETR_74:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_74
	ret
GRM_74:
	PUSH_GRM
	jmp LB_364
LB_363:
	add r14,1 
LB_364:
	cmp r14,r9
	jge LB_365
	JZ_LINE_SPC BYTE [r13+8+r14], LB_363
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
	cmp BYTE [rdi+0],97
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
	JZ_LINE_SPC BYTE [r13+8+r14], LB_372
LB_374
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_377
	jmp LB_378
LB_377:
	mov r8,unt_1
	jmp LB_375
LB_378:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_379
	jmp LB_380
LB_379:
	mov r8,unt_1
	jmp LB_375
LB_380:
	add r14,1
	jmp LB_376
LB_375:
	add rsp,0
	jmp LB_362
LB_376:
	jmp LB_382
LB_381:
	add r14,1 
LB_382:
	cmp r14,r9
	jge LB_383
	JZ_LINE_SPC BYTE [r13+8+r14], LB_381
LB_383
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_386
	jmp LB_387
LB_386:
	mov r8,unt_1
	jmp LB_384
LB_387:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_388
	jmp LB_389
LB_388:
	mov r8,unt_1
	jmp LB_384
LB_389:
	add r14,1
	jmp LB_385
LB_384:
	add rsp,0
	jmp LB_362
LB_385:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_390
LB_390
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
; {| 0010.. |}
	mov r8,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_391
LB_391:
	cmp BYTE [r8+6],0
	jnz LB_362
	POP_GRM_SCC
	ret
LB_362:
	RB_GRM
	jmp LB_394
LB_393:
	add r14,1 
LB_394:
	cmp r14,r9
	jge LB_395
	JZ_SPC BYTE [r13+8+r14], LB_393
LB_395
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_398
	jmp LB_399
LB_398:
	mov r8,unt_1
	jmp LB_396
LB_399:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_400
	jmp LB_401
LB_400:
	mov r8,unt_1
	jmp LB_396
LB_401:
	add r14,1
	jmp LB_397
LB_396:
	add rsp,0
	jmp LB_392
LB_397:
	jmp LB_403
LB_402:
	add r14,1 
LB_403:
	cmp r14,r9
	jge LB_404
	JZ_SPC BYTE [r13+8+r14], LB_402
LB_404
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_407
	jmp LB_408
LB_407:
	jmp LB_405
LB_408:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_406
LB_405:
	add rsp,0
	jmp LB_392
LB_406:
	jmp LB_410
LB_409:
	add r14,1 
LB_410:
	cmp r14,r9
	jge LB_411
	JZ_SPC BYTE [r13+8+r14], LB_409
LB_411
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_414
	jmp LB_415
LB_414:
	mov r8,unt_1
	jmp LB_412
LB_415:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],122
	jnz LB_416
	jmp LB_417
LB_416:
	mov r8,unt_1
	jmp LB_412
LB_417:
	add r14,1
	jmp LB_413
LB_412:
	add rsp,8
	jmp LB_392
LB_413:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_418
LB_418
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
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_419
LB_419:
	cmp BYTE [r8+6],0
	jnz LB_392
	POP_GRM_SCC
	ret
LB_392:
	RB_GRM
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_423
	jmp LB_424
LB_423:
	jmp LB_421
LB_424:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_422
LB_421:
	add rsp,0
	jmp LB_420
LB_422:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_427
	jmp LB_428
LB_427:
	mov r8,unt_1
	jmp LB_425
LB_428:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_429
	jmp LB_430
LB_429:
	mov r8,unt_1
	jmp LB_425
LB_430:
	add r14,1
	jmp LB_426
LB_425:
	add rsp,8
	jmp LB_420
LB_426:
	call GRM_73
	cmp BYTE [r8+6],0
	jnz LB_433
	jmp LB_434
LB_433:
	jmp LB_431
LB_434:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_432
LB_431:
	add rsp,8
	jmp LB_420
LB_432:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_435
LB_435
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
; {| 00100000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_436
LB_436:
	cmp BYTE [r8+6],0
	jnz LB_420
	POP_GRM_SCC
	ret
LB_420:
	POP_GRM_FAIL 
	ret
LB_437:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_441+8*rax]
LB_441: dq LB_439,LB_440
LB_439:
	mov rdi,LB_443
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_442
LB_440:
	mov rdi,LB_444
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_442
LB_442:
	ret
LB_445:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_448+8*rax]
LB_448: dq LB_446,LB_447
LB_446:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_449
LB_447:
	jmp LB_449
LB_449:
	ret
RTM_7:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #71 { %[ "ABAB" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_71
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
	call LB_437
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_438
LB_438:
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
	call LB_445
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #72 { %[ "sY" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_72
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
	call LB_437
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_450
LB_450:
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
	call LB_445
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #73 { %[ "AB" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_73
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
	call LB_437
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_451
LB_451:
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
	call LB_445
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #73 { %[ "ACACe" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_73
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
	call LB_437
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_452
LB_452:
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
	call LB_445
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #74 { %[ " a bc d" ] %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_74
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
	call LB_437
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_453
LB_453:
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
	call LB_445
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_454
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_455
LB_455:
; .dlt.ptn %[ "dd\t\n\"J  " ]
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
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
	lea rsi,[LB_456+16-1]
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
	jmp LB_457
LB_457:
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #75 %[ 3r ] ⊢ 2'(= r )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 %[ 3r ] ⊢ 0'(= r )
; {| 10000000110.. |}
	mov r13,3
	call ETR_75
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
	jmp LB_458
LB_458:
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
	lea rsi,[LB_459+16-1]
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
	jmp LB_460
LB_460:
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
	lea rsi,[LB_461+1-1]
	mov rcx,1
	rep movsb
	mov rax,3
LB_463:
	cmp rax,0
	jz LB_464
	sub rax,1
	lea rsi,[LB_462+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_463
LB_464:
	mov rax,17
LB_466:
	cmp rax,0
	jz LB_467
	sub rax,1
	lea rsi,[LB_465+4-1]
	mov rcx,4
	rep movsb 
	jmp LB_466
LB_467:
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_468+2-1]
	mov rcx,2
	rep movsb
	lea rsi,[LB_469+3-1]
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
	jmp LB_470
LB_470:
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
; {| 10.. |}
	ret
ETR_77: ;; f1 0'(= r ) ⊢ { 0'(= r ) 1'(= r ) } : (_r64→{ _r64 _r64 })
;; rsp=0 , %503~0'(= r ) 
; #13 { 0'(= r ) %[ 3r ] } ⊢|
	add r13,3
; .mov_ptn2 { 0'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; {| 110.. |}
	mov r14,3
	ret
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
LB_471:
	cmp rdi,0 
	jz LB_472
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
	jmp LB_471
LB_472:
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
	jmp LB_473
LB_473:
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
	mov rdi,LB_474
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_475
LB_475:
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
LB_476:
	cmp rsi,rax 
	jz LB_477
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
	jmp LB_476
LB_477:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_478
LB_478:
; .dlt.ptn 2'(= {| {| l |}|} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
LB_479:
	cmp rsi,rax 
	jz LB_480
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
	jmp LB_479
LB_480:
	C_POP_REGS
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_10
LB_483: ;; #78 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) : (_opn◂_opn◂_opn◂_opn◂_opn◂_r64→_opn◂_opn◂_opn◂_opn◂_opn◂_r64)
;; rsp=0 , %516~0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) 
;; ? 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_485
	jmp LB_486
LB_485:
	jmp LB_484
LB_486:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %517~1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) 
; #24 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
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
LB_484:
;; ?. 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	mov rdi,LB_487
	call emt_stg 
	jmp err
LB_489:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_492+8*rax]
LB_492: dq LB_490,LB_491
LB_490:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_494
	jmp LB_493
LB_491:
	jmp LB_493
LB_493:
	ret
LB_494:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_497+8*rax]
LB_497: dq LB_495,LB_496
LB_495:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_499
	jmp LB_498
LB_496:
	jmp LB_498
LB_498:
	ret
LB_499:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_502+8*rax]
LB_502: dq LB_500,LB_501
LB_500:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_504
	jmp LB_503
LB_501:
	jmp LB_503
LB_503:
	ret
LB_504:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_507+8*rax]
LB_507: dq LB_505,LB_506
LB_505:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_445
	jmp LB_508
LB_506:
	jmp LB_508
LB_508:
	ret
LB_488:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_511+8*rax]
LB_511: dq LB_509,LB_510
LB_509:
	mov r8,QWORD [r8+8]
	call LB_513
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_512
LB_510:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_512
LB_512:
	ret
LB_513:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_516+8*rax]
LB_516: dq LB_514,LB_515
LB_514:
	mov r8,QWORD [r8+8]
	call LB_518
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_517
LB_515:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_517
LB_517:
	ret
LB_518:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_521+8*rax]
LB_521: dq LB_519,LB_520
LB_519:
	mov r8,QWORD [r8+8]
	call LB_523
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_522
LB_520:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_522
LB_522:
	ret
LB_523:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_526+8*rax]
LB_526: dq LB_524,LB_525
LB_524:
	mov r8,QWORD [r8+8]
	call LB_528
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_527
LB_525:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_527
LB_527:
	ret
LB_528:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_531+8*rax]
LB_531: dq LB_529,LB_530
LB_529:
	mov r8,QWORD [r8+8]
	mov rax,r8
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rax
	mov rax,rsi
	jmp LB_532
LB_530:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_532
LB_532:
	ret
LB_533:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_537+8*rax]
LB_537: dq LB_535,LB_536
LB_535:
	mov rdi,LB_539
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_540
	jmp LB_538
LB_536:
	mov rdi,LB_541
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_538
LB_538:
	ret
LB_540:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_544+8*rax]
LB_544: dq LB_542,LB_543
LB_542:
	mov rdi,LB_546
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_547
	jmp LB_545
LB_543:
	mov rdi,LB_548
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_545
LB_545:
	ret
LB_547:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_551+8*rax]
LB_551: dq LB_549,LB_550
LB_549:
	mov rdi,LB_553
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_554
	jmp LB_552
LB_550:
	mov rdi,LB_555
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_552
LB_552:
	ret
LB_554:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_558+8*rax]
LB_558: dq LB_556,LB_557
LB_556:
	mov rdi,LB_560
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_437
	jmp LB_559
LB_557:
	mov rdi,LB_561
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_559
LB_559:
	ret
RTM_10:
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "start info test" ] ⊢ %[ "start info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_481
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_482
LB_482:
; .dlt.ptn %[ "start info test" ]
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 %[ 8r ] ⊢ 0(<2)◂%[ 8r ]
;; rsp=0 , %520~0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %521~0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %522~0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %523~0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %524~0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #78 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
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
	call LB_483
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %525~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; $ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ),5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_488
	C_POP_REGS
	mov r9,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_488
	C_POP_REGS
	mov r10,rax
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_488
	C_POP_REGS
	mov r11,rax
; .dlt.ptn 5'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r11
	C_PUSH_REGS
	mov r8,rdi
	call LB_489
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %526~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %526~2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_533
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_534
LB_534:
; .dlt.ptn 2'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_489
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "end info test" ] ⊢ %[ "end info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_562
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_563
LB_563:
; .dlt.ptn %[ "end info test" ]
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_11
ETR_84: ;; f1 0'(= a14◂ [ ] ) ⊢ 0'(= q0 ) : (_t14→886'(0))
;; rsp=0 , %533~0'(= a14◂ [ ] ) 
; #79 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %534~1(<2)◂{ } %533~0'(= a14◂ [ ] ) 
; #80 { 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) } ⊢ 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) }
;; rsp=0 , %535~0(<2)◂{ 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) } 
; #84 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 0'(= a14◂ [ ] ) } ⊢|
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
	call ETR_84
; .mov_ptn2 0'(= q0 ) ⊢ 0'(= q0 )
; {| 10.. |}
	ret
ETR_85: ;; f2 0'(= a15◂ [ ] ) ⊢ 0'(= q0 ) : (_t15→893'(0))
;; rsp=0 , %536~0'(= a15◂ [ ] ) 
; #82 0'(= a15◂ [ ] ) ⊢ 0(<2)◂0'(= a15◂ [ ] )
;; rsp=0 , %537~0(<2)◂0'(= a15◂ [ ] ) 
; #85 0(<2)◂0'(= a15◂ [ ] ) ⊢|
; .mov_ptn2 0(<2)◂0'(= a15◂ [ ] ) ⊢ 0'(= a15◂ [ ] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
	call ETR_85
; .mov_ptn2 0'(= q0 ) ⊢ 0'(= q0 )
; {| 10.. |}
	ret
LB_564: ;; #83 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] ) : (_t14→_t14)
;; rsp=0 , %532~0'(= a14◂ [ ] ) 
; ∎ 0'(= a14◂ [ ] )
; .mov_ptn2 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10.. |}
	ret
LB_565:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_569+8*rax]
LB_569: dq LB_567,LB_568
LB_567:
	mov rdi,LB_571
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_565
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
	call LB_565
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_570
LB_568:
	mov rdi,LB_572
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_570
LB_570:
	ret
LB_573:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_576+8*rax]
LB_576: dq LB_574,LB_575
LB_574:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_573
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_573
	pop r8 
	FREE_RCD 3, r8
	jmp LB_577
LB_575:
	jmp LB_577
LB_577:
	ret
RTM_11:
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #79 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %538~1(<2)◂{ } %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #79 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %539~1(<2)◂{ } %538~1(<2)◂{ } %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #80 { 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %540~0(<2)◂{ 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } } %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #83 0(<2)◂{ 1(<2)◂{ } %[ 0r ] 1(<2)◂{ } } ⊢ 2'(= a14◂ [ ] )
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
	call LB_564
	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %541~2'(= a14◂ [ ] ) %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %541~2'(= a14◂ [ ] ) %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #10 2'(= a14◂ [ ] ) ⊢ 2'(= a14◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_565
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_566
LB_566:
; .dlt.ptn 2'(= a14◂ [ ] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_573
	C_POP_REGS
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %528~4'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %527~3'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %352~1'(= a13◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #81 { } ⊢ 1(<2)◂{ }
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
