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
	movzx rax,%1
	cmp rax,9 
	jz %2
	cmp rax,10 
	jz %2
	cmp rax,32 
	jz %2
%endmacro
 
%macro JZ_LINE_SPC 2
	movzx rax,%1 
	cmp rax,9 
	jz %2
	cmp rax,32 
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

%macro ALC_RCD 2 
	mov %2,[SS_RCD_%1_TOP]
	mov rax,[%2]
	mov QWORD [SS_RCD_%1_TOP],rax
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

%macro BSS_SS_RCD 2 
	SS_RCD_%1_TOP: resq 1 
	SS_RCD_%1_VCT: resq (%1+1)*%2
	Ss_RCD_%1_BTM: resq 1 
%endmacro 

%define SS_MAX 2000
%define SS_LN_MAX 4000
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX 2048
%define SS_LN_REG r15
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

LB_3: db 34,100,108,116,32,97,114,114,97,121,34,0
LB_10: db 34,115,116,97,114,116,32,105,110,102,111,32,116,101,115,116,34,0
LB_14: db 59,32,226,136,142,124,10,101,120,110,32,51,54,55,58,10,0
LB_21: db 39,48,226,151,130,0
LB_23: db 39,49,226,151,130,0
LB_28: db 39,48,226,151,130,0
LB_30: db 39,49,226,151,130,0
LB_35: db 39,48,226,151,130,0
LB_37: db 39,49,226,151,130,0
LB_42: db 39,48,226,151,130,0
LB_44: db 39,49,226,151,130,0
LB_49: db 39,48,226,151,130,0
LB_50: db 39,49,226,151,130,0
LB_76: db 34,101,110,100,32,105,110,102,111,32,116,101,115,116,34,0
section .text
global _start

info:
	C_PUSH_REGS
	mov rdi,fmt_info 
	mov rsi,QWORD [SS_LN_C]
	mov rdx,SS_LN_N 
	xor rax,rax 
	C_CALL printf 
	C_POP_REGS 
	ret
;getchar:
;	xor rax,rax 
;	C_CALL_SF getchar 
;	ret

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
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #0 { %[ 7r ] %[ "Fu" ] } ⊢ { %[ 7r ] %[ "Fu" ] 1'(= {| {| l |}|} ) }
	mov rdi,7
	push rdi 
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov r14,rax
	mov QWORD [rax],rdi 
LB_0:
	cmp rdi,0 
	jz LB_1
	sub rdi,1
	mov r9,rdi
; .mov_ptn2 %[ "Fu" ] ⊢ 2'(= {| {| l |}|} )
	mov r10,r8
; .mov_ptn %[ "Fu" ] ⊢ 2'(= {| {| l |}|} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],70
	mov BYTE [rax+8+1],117
	mov r8,rax
	mov rsi,r14
	mov rax,r8
	mov rdi,r9
	mov QWORD [rsi+8+8*rdi],rax 
	jmp LB_0
LB_1:
; .dlt.ptn %[ "Fu" ]
; .dlt.ptn %[ 7r ]
;; rsp=0 , %3~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; #1 { 1'(= {| {| l |}|} ) %[ 1r ] %[ "Xo" ] } ⊢ { 1'(= {| {| l |}|} ) %[ 1r ] 3'(= {| l |} ) }
; .mov_ptn2 %[ "Xo" ] ⊢ 2'(= {| l |} )
	mov r9,r8
; .mov_ptn %[ "Xo" ] ⊢ 2'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],88
	mov BYTE [rax+8+1],111
	mov r8,rax
	mov rax,1
	mov rdi,r14
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err
	lea rdi,[rdi+8+8*rax]
	mov rax,QWORD [rdi]
	mov rsi,r8
	mov QWORD [rdi],rsi 
	mov r8,rax
; .mov_ptn2 2'(= {| l |} ) ⊢ 3'(= {| l |} )
	mov r10,r9
; .mov_ptn 2'(= {| l |} ) ⊢ 3'(= {| l |} )
	mov rax,r8
	mov r9,rax
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn %[ 1r ]
;; rsp=0 , %4~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; #4 { 1'(= {| {| l |}|} ) %[ 3r ] } ⊢ { 1'(= {| {| l |}|} ) %[ 3r ] 3'(= {| l |} ) }
	mov rax,3
	mov rdi,r14
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
	mov r8,rax
; .mov_ptn2 2'(= {| l |} ) ⊢ 3'(= {| l |} )
	mov r10,r9
; .mov_ptn 2'(= {| l |} ) ⊢ 3'(= {| l |} )
	mov rax,r8
	mov r9,rax
; .dlt.ptn %[ 3r ]
;; rsp=0 , %9~3'(= {| l |} ) %7~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; #10 3'(= {| l |} ) ⊢ 3'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_2
LB_2:
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %7~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; #10 %[ "dlt array" ] ⊢ %[ "dlt array" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4
LB_4:
; .dlt.ptn %[ "dlt array" ]
;; rsp=0 , %7~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= {| {| l |}|} ) ⊢ 1'(= {| {| l |}|} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,[r8]
	mov rax,0 
LB_5:
	cmp rsi,rax 
	jz LB_6
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
	jmp LB_5
LB_6:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_7
LB_7:
; .dlt.ptn 1'(= {| {| l |}|} )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
LB_8:
	cmp rsi,rax 
	jz LB_9
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
	jmp LB_8
LB_9:
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
LB_12: ;; #32 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) : (_opn◂_opn◂_opn◂_opn◂_opn◂_r64→_opn◂_opn◂_opn◂_opn◂_opn◂_r64)
;; rsp=0 , %13~0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) 
;; ? 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_13
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %14~1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) 
; #24 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) ⊢ 0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] )
;; rsp=0 , %15~0(<2)◂1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]] ) 
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
LB_13:
;; ?. 0'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	mov rdi,LB_14
	call emt_stg 
	jmp err
LB_15:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_19+8*rax]
LB_19: dq LB_17,LB_18
LB_17:
	mov rdi,LB_21
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_22
	jmp LB_20
LB_18:
	mov rdi,LB_23
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_20
LB_20:
	ret
LB_22:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_26+8*rax]
LB_26: dq LB_24,LB_25
LB_24:
	mov rdi,LB_28
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_29
	jmp LB_27
LB_25:
	mov rdi,LB_30
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_27
LB_27:
	ret
LB_29:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_33+8*rax]
LB_33: dq LB_31,LB_32
LB_31:
	mov rdi,LB_35
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_36
	jmp LB_34
LB_32:
	mov rdi,LB_37
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_34
LB_34:
	ret
LB_36:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_40+8*rax]
LB_40: dq LB_38,LB_39
LB_38:
	mov rdi,LB_42
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_43
	jmp LB_41
LB_39:
	mov rdi,LB_44
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_41
LB_41:
	ret
LB_43:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_47+8*rax]
LB_47: dq LB_45,LB_46
LB_45:
	mov rdi,LB_49
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_48
LB_46:
	mov rdi,LB_50
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_48
LB_48:
	ret
LB_51:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_54+8*rax]
LB_54: dq LB_52,LB_53
LB_52:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_56
	jmp LB_55
LB_53:
	jmp LB_55
LB_55:
	ret
LB_56:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_59+8*rax]
LB_59: dq LB_57,LB_58
LB_57:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_61
	jmp LB_60
LB_58:
	jmp LB_60
LB_60:
	ret
LB_61:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_64+8*rax]
LB_64: dq LB_62,LB_63
LB_62:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_66
	jmp LB_65
LB_63:
	jmp LB_65
LB_65:
	ret
LB_66:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_69+8*rax]
LB_69: dq LB_67,LB_68
LB_67:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_71
	jmp LB_70
LB_68:
	jmp LB_70
LB_70:
	ret
LB_71:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_74+8*rax]
LB_74: dq LB_72,LB_73
LB_72:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_75
LB_73:
	jmp LB_75
LB_75:
	ret
RTM_1:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #10 %[ "start info test" ] ⊢ %[ "start info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_10
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_11
LB_11:
; .dlt.ptn %[ "start info test" ]
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #24 %[ 8r ] ⊢ 0(<2)◂%[ 8r ]
;; rsp=0 , %17~0(<2)◂%[ 8r ] %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %18~0(<2)◂0(<2)◂%[ 8r ] %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %19~0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %20~0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %0~0'(= {| {| l |}|} ) 
; #24 0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ]
;; rsp=0 , %21~0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] %0~0'(= {| {| l |}|} ) 
; #32 0(<2)◂0(<2)◂0(<2)◂0(<2)◂0(<2)◂%[ 8r ] ⊢ 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
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
	call LB_12
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %22~1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %22~1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] ) ⊢ 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_15
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_16
LB_16:
; .dlt.ptn 1'(= a3◂ [ a3◂ [ a3◂ [ a3◂ [ a3◂ [ r]]]]] )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_51
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ { }
	call info
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #10 %[ "end info test" ] ⊢ %[ "end info test" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_76
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_77
LB_77:
; .dlt.ptn %[ "end info test" ]
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_2
RTM_2:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #21 { } ⊢ 1'(= r )
	mov rdi,fmt_getchar 
	call emt_stg 
	xor rax,rax 
	C_CALL_SF getchar 
	mov r14,rax
;; rsp=0 , %25~1'(= r ) %0~0'(= {| {| l |}|} ) 
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
	jmp LB_78
LB_78:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #21 { } ⊢ 1'(= r )
	mov rdi,fmt_getchar 
	call emt_stg 
	xor rax,rax 
	C_CALL_SF getchar 
	mov r14,rax
;; rsp=0 , %27~1'(= r ) %0~0'(= {| {| l |}|} ) 
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
	jmp LB_79
LB_79:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_3
RTM_3:
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
