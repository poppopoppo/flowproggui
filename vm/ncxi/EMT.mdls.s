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

%macro ALC_RCD 1 
	mov rax,[SS_RCD_%1_TOP]
	mov rsi,[rax]
	mov QWORD [SS_RCD_%1_TOP],rsi
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
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX 2048
%define SS_LN_REG r15
extern exit 
extern printf 
extern sprintf
extern malloc 
extern calloc
extern free 
extern isspace 
extern strtoul
extern strlen
section .bss
	tmp: resq 64
	ret_vct: resq 64
 rsp_tmp: resq 1

; emt buffer 
	EMT_BUF_OFS: resq 1 
 EMT_BUF: resb EMT_BUF_MAX 
	EMT_BUF_END: resb 1
 
; SS segments 
	SS_TOP: resq 1
	SS_VCT: resq 16*SS_MAX
	SS_BTM: resq 1 

	SS_LN_TOP: resq 1
	SS_LN_VCT: resq 2*SS_MAX
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
	rt_err0: db "rt_err 0:",10,0 
 s8_e: dq 0,0
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

LB_4: db 59,32,226,136,142,124,10,101,120,110,32,52,48,48,58,10,0
LB_16: db 48,114,0
LB_18: db 48,114,0
LB_20: db 48,114,0
LB_24: db 10,0
LB_25: db 49,55,0
LB_26: db 75,75,0
LB_29: db 49,55,0
LB_102: db 39,48,226,151,130,0
LB_103: db 39,49,226,151,130,0
LB_104: db 39,50,226,151,130,0
LB_105: db 39,51,226,151,130,0
LB_230: db 39,48,226,151,130,0
LB_231: db 39,49,226,151,130,0
LB_447: db 39,48,226,151,130,0
LB_448: db 39,49,226,151,130,0
LB_453: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_455: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_458: db 72,101,108,108,111,32,32,87,111,114,108,100,32,33,33,10,0
LB_461: db 104,0
LB_462: db 103,0
LB_465: db 89,100,32,112,0
LB_468: db 49,55,0
LB_469: db 102,111,111,0
section .text
global _start
rpc_s8: ; rdi ⊢ rax
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi]  
	push rdi 
	push rsi 
	and rsi,~111b
	lea rdi,[rsi+16]
	mov rsi,1 
	xor rax,rax 
	C_CALL calloc
	pop rcx 
	mov QWORD [rax],rcx
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
	mov QWORD [SS_LN_TOP],SS_LN_VCT
	mov r15,SS_LN_VCT 
	mov rdi,0 
	mov rax,SS_LN_VCT 
SS_LN_lp: 
	cmp rdi,SS_MAX 
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
	mov r8,rax
args_lp:
	cmp r14,r13
	jz args_lp_end
	pop rdi
	call s8_of_c_stg 
	mov QWORD [r8+8+8*r14],rax
	add r14,1 
	jmp args_lp 
args_lp_end:
	mov r13,r8
	

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
ETR_30: ; f0 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %1~0'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %2~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_31: ; f1 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %4~1'(= r ) %3~0'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %5~0'(= r ) %4~1'(= r ) 
; _#9 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %6~1'(= r ) %5~0'(= r ) 
; _#9 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %7~1'(= r ) %5~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_32: ; f2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %9~1'(= r ) %8~0'(= r ) 
; _#13 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %11~1'(= r ) %10~0'(= r ) 
; _#13 { %[ 4r ] 1'(= r ) } ⊢ { 1'(= r ) 1'(= r ) }
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
ETR_33: ; f3 0'(= r ) ⊢ { 0'(= r ) 1'(= r ) } : (_r64→{ _r64 _r64 })
;; rsp=0 , %14~0'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %15~0'(= r ) 
	jmp LB_0
LB_0:
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	mov rax,rdi
	mov r14,rax
;; rsp=0 , %17~1'(= r ) %16~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_34: ; f4 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %18~0'(= r ) 
	mov rdi,0
	cmp r13,rdi
	jnz LB_1
;; rsp=0 , %18~0'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %19~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
LB_1:
	mov rdi,1
	cmp r13,rdi
	jnz LB_2
;; rsp=0 , %18~0'(= r ) 
	jmp LB_3
LB_3:
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	mov rax,rdi
	mov r14,rax
;; rsp=0 , %21~1'(= r ) %20~0'(= r ) 
; _#13 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %23~1'(= r ) %22~0'(= r ) 
; ∎ 0'(= r )
; .dlt.ptn 1'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
LB_2:
;; rsp=0 , %18~0'(= r ) 
	mov rdi,LB_4
	call emt_stg 
	jmp err
ETR_35: ; f5 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %24~0'(= r ) 
; _#10 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %25~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_36: ; fact 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %26~0'(= r ) 
	mov rdi,0
	cmp r13,rdi
	jnz LB_5
;; rsp=0 , %26~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	ret
LB_5:
	mov rdi,1
	cmp r13,rdi
	jnz LB_6
;; rsp=0 , %26~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
LB_6:
;; rsp=0 , %26~0'(= r ) 
	jmp LB_7
LB_7:
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	mov rax,rdi
	mov r14,rax
;; rsp=0 , %28~1'(= r ) %27~0'(= r ) 
; _#10 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %29~0'(= r ) %28~1'(= r ) 
; rsp_d=0, #36 0'(= r ) ⊢ 0'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_36

	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %30~0'(= r ) %28~1'(= r ) 
; _#13 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
	imul r14,r13
;; rsp=0 , %32~0'(= r ) %31~1'(= r ) 
; ∎ 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
	jmp LB_8
LB_8:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %33~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; _#9 %[ 0r ] ⊢ %[ 1r ]
;; rsp=0 , %34~%[ 1r ] %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #30 %[ 1r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	call ETR_30

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
	jmp LB_9
LB_9:
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
	jmp LB_10
LB_10:
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %37~%[ 4r ] %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #30 %[ 4r ] ⊢ 2'(= r )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 %[ 4r ] ⊢ 0'(= r )
; .mov_ptn %[ 4r ] ⊢ 0'(= r )
	mov rax,4
	mov r13,rax
	call ETR_30

	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
; .dlt.ptn 2'(= r )
;; rsp=0 , %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_11
LB_11:
;; rsp=0 , %39~1'(= r ) %36~%[ 3r ] %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #31 { 1'(= r ) %[ 3r ] } ⊢ { 2'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
; .mov_ptn %[ 3r ] ⊢ 1'(= r )
	mov rax,3
	mov r14,rax
	call ETR_31

	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn 1'(= r )
;; rsp=0 , %40~2'(= r ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #36 2'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; .mov_ptn 2'(= r ) ⊢ 0'(= r )
	mov rax,r8
	mov r13,rax
	call ETR_36

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %42~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_12
LB_12:
;; rsp=0 , %43~1'(= r ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #36 1'(= r ) ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	call ETR_36

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %44~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_13
LB_13:
; .dlt.ptn 1'(= r )
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
RTM_1:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
	jmp LB_14
LB_14:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %46~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_15
LB_15:
; $ %[ 0r ] ⊢ %[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ],%[ 0r ]
;; rsp=0 , %55~%[ 0r ] %54~%[ 0r ] %53~%[ 0r ] %52~%[ 0r ] %51~%[ 0r ] %50~%[ 0r ] %49~%[ 0r ] %48~%[ 0r ] %47~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; _#8 %[ 0r ] ⊢ %[ 0r ]
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
; _#8 %[ 0r ] ⊢ %[ 0r ]
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
; _#8 %[ 0r ] ⊢ %[ 0r ]
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
	jmp LB_22
LB_22:
; $ { %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] }
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_2
RTM_2:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
	jmp LB_23
LB_23:
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
	lea rsi,[LB_24+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_25+2-1]
	mov rcx,2
	rep movsb
	mov rax,17
LB_27:
	cmp rax,0
	jz LB_28
	sub rax,1
	lea rsi,[LB_26+2-1]
	mov rcx,2
	rep movsb 
	jmp LB_27
LB_28:
	lea rsi,[LB_29+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %62~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_30
LB_30:
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	call free_s8 
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_3
ETR_37: ; fact 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %64~0'(= r ) 
	mov rdi,0
	cmp r13,rdi
	jnz LB_31
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	ret
LB_31:
	mov rdi,1
	cmp r13,rdi
	jnz LB_32
;; rsp=0 , %64~0'(= r ) 
; ∎ %[ 1r ]
; .dlt.ptn 0'(= r )
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	ret
LB_32:
;; rsp=0 , %64~0'(= r ) 
	jmp LB_33
LB_33:
; $ 0'(= r ) ⊢ 0'(= r ),1'(= r )
	mov rdi,r13
	mov rax,rdi
	mov r14,rax
;; rsp=0 , %66~1'(= r ) %65~0'(= r ) 
; _#10 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %67~0'(= r ) %66~1'(= r ) 
; rsp_d=0, #37 0'(= r ) ⊢ 0'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_37

	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %68~0'(= r ) %66~1'(= r ) 
; _#13 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
	imul r14,r13
;; rsp=0 , %70~0'(= r ) %69~1'(= r ) 
; ∎ 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	ret
ETR_38: ; tak { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
;;0'(= r )=<1'(= r )
	mov rdi,r14
	cmp r13,rdi
	jg LB_34
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
; ∎ 2'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
; .mov_ptn 2'(= r ) ⊢ 0'(= r )
	mov rax,r8
	mov r13,rax
	ret
LB_34:
;; rsp=0 , %73~2'(= r ) %72~1'(= r ) %71~0'(= r ) 
	jmp LB_35
LB_35:
; $ 0'(= r ) ⊢ 0'(= r ),3'(= r )
	mov rdi,r13
	mov rax,rdi
	mov r9,rax
;; rsp=0 , %75~3'(= r ) %74~0'(= r ) %73~2'(= r ) %72~1'(= r ) 
	jmp LB_36
LB_36:
; $ 1'(= r ) ⊢ 1'(= r ),4'(= r )
	mov rdi,r14
	mov rax,rdi
	mov r10,rax
;; rsp=0 , %77~4'(= r ) %76~1'(= r ) %75~3'(= r ) %74~0'(= r ) %73~2'(= r ) 
	jmp LB_37
LB_37:
; $ 2'(= r ) ⊢ 2'(= r ),5'(= r )
	mov rdi,r8
	mov rax,rdi
	mov r11,rax
;; rsp=0 , %79~5'(= r ) %78~2'(= r ) %77~4'(= r ) %76~1'(= r ) %75~3'(= r ) %74~0'(= r ) 
; _#10 3'(= r ) ⊢ 3'(= r )
	sub r9,1
;; rsp=0 , %80~3'(= r ) %79~5'(= r ) %78~2'(= r ) %77~4'(= r ) %76~1'(= r ) %74~0'(= r ) 
; rsp_d=0, #38 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ 3'(= r )
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
	call ETR_38

	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %81~3'(= r ) %78~2'(= r ) %76~1'(= r ) %74~0'(= r ) 
	jmp LB_38
LB_38:
; $ 0'(= r ) ⊢ 0'(= r ),4'(= r )
	mov rdi,r13
	mov rax,rdi
	mov r10,rax
;; rsp=0 , %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) %78~2'(= r ) %76~1'(= r ) 
	jmp LB_39
LB_39:
; $ 1'(= r ) ⊢ 1'(= r ),5'(= r )
	mov rdi,r14
	mov rax,rdi
	mov r11,rax
;; rsp=0 , %85~5'(= r ) %84~1'(= r ) %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) %78~2'(= r ) 
	jmp LB_40
LB_40:
; $ 2'(= r ) ⊢ 2'(= r ),6'(= r )
	mov rdi,r8
	mov rax,rdi
	mov rcx,rax
;; rsp=0 , %87~6'(= r ) %86~2'(= r ) %85~5'(= r ) %84~1'(= r ) %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) 
; _#10 5'(= r ) ⊢ 5'(= r )
	sub r11,1
;; rsp=0 , %88~5'(= r ) %87~6'(= r ) %86~2'(= r ) %84~1'(= r ) %83~4'(= r ) %82~0'(= r ) %81~3'(= r ) 
; rsp_d=0, #38 { 5'(= r ) 6'(= r ) 4'(= r ) } ⊢ 4'(= r )
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
	call ETR_38

	mov r9,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %89~4'(= r ) %86~2'(= r ) %84~1'(= r ) %82~0'(= r ) %81~3'(= r ) 
; _#10 2'(= r ) ⊢ 2'(= r )
	sub r8,1
;; rsp=0 , %90~2'(= r ) %89~4'(= r ) %84~1'(= r ) %82~0'(= r ) %81~3'(= r ) 
; rsp_d=0, #38 { 2'(= r ) 0'(= r ) 1'(= r ) } ⊢ 0'(= r )
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
	call ETR_38

	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %91~0'(= r ) %89~4'(= r ) %81~3'(= r ) 
; rsp_d=0, #38 { 3'(= r ) 4'(= r ) 0'(= r ) } ⊢ 0'(= r )
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
	call ETR_38

;; rsp=0 , %92~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_39: ; tak_v { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 })
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
;;0'(= r )=<1'(= r )
	mov rdi,r14
	cmp r13,rdi
	jg LB_41
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
	jmp LB_42
LB_42:
; $ 2'(= r ) ⊢ 2'(= r ),3'(= r )
	mov rdi,r8
	mov rax,rdi
	mov r9,rax
;; rsp=0 , %97~3'(= r ) %96~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	ret
LB_41:
;; rsp=0 , %95~2'(= r ) %94~1'(= r ) %93~0'(= r ) 
; _#10 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %98~0'(= r ) %95~2'(= r ) %94~1'(= r ) 
; rsp_d=0, #39 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
	call ETR_39

;; rsp=0 , %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) %99~0'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %103~0'(= r ) %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	sub r14,1
;; rsp=0 , %104~1'(= r ) %103~0'(= r ) %102~3'(= r ) %101~2'(= r ) 
; rsp_d=0, #39 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 4'(= r ) }
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
	call ETR_39

	mov r10,r9
	mov r9,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %108~4'(= r ) %107~2'(= r ) %106~1'(= r ) %105~0'(= r ) %102~3'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %109~0'(= r ) %108~4'(= r ) %107~2'(= r ) %106~1'(= r ) %102~3'(= r ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	sub r14,1
;; rsp=0 , %110~1'(= r ) %109~0'(= r ) %108~4'(= r ) %107~2'(= r ) %102~3'(= r ) 
; rsp_d=0, #39 { 1'(= r ) 2'(= r ) 0'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 5'(= r ) }
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
	call ETR_39

	mov r10,QWORD [rsp-8+8*2]
	mov r11,r9
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %114~5'(= r ) %113~2'(= r ) %112~1'(= r ) %111~0'(= r ) %108~4'(= r ) %102~3'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %115~0'(= r ) %114~5'(= r ) %113~2'(= r ) %112~1'(= r ) %108~4'(= r ) %102~3'(= r ) 
; rsp_d=0, #39 { 3'(= r ) 4'(= r ) 5'(= r ) } ⊢ { 6'(= r ) 5'(= r ) 4'(= r ) 3'(= r ) }
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
	call ETR_39

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
; .dlt.ptn 5'(= r )
; .dlt.ptn 6'(= r )
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
; rsp_d=0, #37 %[ 5r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ 5r ] ⊢ 0'(= r )
; .mov_ptn %[ 5r ] ⊢ 0'(= r )
	mov rax,5
	mov r13,rax
	call ETR_37

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %120~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_43
LB_43:
; .dlt.ptn 1'(= r )
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #38 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ 1'(= r )
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
	call ETR_38

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %122~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_44
LB_44:
; .dlt.ptn 1'(= r )
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #39 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
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
	call ETR_39

	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %127~3'(= r ) %126~2'(= r ) %125~1'(= r ) %124~4'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r10
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r9
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
; .dlt.ptn { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_4
ETR_40: ; f0 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
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
ETR_41: ; f1 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %136~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_42: ; f2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 })
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
ETR_43: ; f3 { } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) } : ({ }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
;; rsp=0 , 
	jmp LB_46
LB_46:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %140~%[ 0r ] 
	jmp LB_47
LB_47:
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_48
LB_48:
; $ %[ 2r ] ⊢ %[ 2r ]
;; rsp=0 , %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_49
LB_49:
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_50
LB_50:
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_51
LB_51:
; $ %[ 5r ] ⊢ %[ 5r ]
;; rsp=0 , %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_52
LB_52:
; $ %[ 6r ] ⊢ %[ 6r ]
;; rsp=0 , %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_53
LB_53:
; $ %[ 7r ] ⊢ %[ 7r ]
;; rsp=0 , %147~%[ 7r ] %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_54
LB_54:
; $ %[ 8r ] ⊢ %[ 8r ]
;; rsp=0 , %148~%[ 8r ] %147~%[ 7r ] %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_55
LB_55:
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %149~%[ 9r ] %148~%[ 8r ] %147~%[ 7r ] %146~%[ 6r ] %145~%[ 5r ] %144~%[ 4r ] %143~%[ 3r ] %142~%[ 2r ] %141~%[ 1r ] %140~%[ 0r ] 
	jmp LB_56
LB_56:
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
ETR_44: ; f4 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ })
	add rsp,8
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
	add rsp,16
	ret
ETR_45: ; f5 { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 8'(= r ) 9'(= r ) } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
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
ETR_46: ; f6 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %172~1'(= r ) %171~0'(= r ) 
; #15 { 0'(= r ) 1'(= r ) } ⊢|
	imul r13,r14
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_47: ; f7 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %174~1'(= r ) %173~0'(= r ) 
; _#13 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %176~1'(= r ) %175~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_48: ; f8 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %179~2'(= r ) %178~1'(= r ) %177~0'(= r ) 
; rsp_d=0, #47 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	call ETR_47

	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn 0'(= r )
;; rsp=0 , %181~1'(= r ) %179~2'(= r ) 
; _#13 { 1'(= r ) 2'(= r ) } ⊢ { 1'(= r ) 2'(= r ) }
	imul r14,r8
; .dlt.ptn 2'(= r )
;; rsp=0 , %182~1'(= r ) 
; ∎ 1'(= r )
; .mov_ptn2 1'(= r ) ⊢ 0'(= r )
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov rax,r14
	mov r13,rax
	ret
ETR_49: ; f9 { } ⊢ 0'(= {| l |} ) : ({ }→_s8)
;; rsp=0 , 
	jmp LB_57
LB_57:
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
	jmp LB_58
LB_58:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_59
LB_59:
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_60
LB_60:
; $ %[ 2r ] ⊢ %[ 2r ]
;; rsp=0 , %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_61
LB_61:
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_62
LB_62:
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_63
LB_63:
; $ %[ 5r ] ⊢ %[ 5r ]
;; rsp=0 , %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_64
LB_64:
; $ %[ 6r ] ⊢ %[ 6r ]
;; rsp=0 , %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_65
LB_65:
; $ %[ 7r ] ⊢ %[ 7r ]
;; rsp=0 , %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_66
LB_66:
; $ %[ 8r ] ⊢ %[ 8r ]
;; rsp=0 , %193~%[ 8r ] %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_67
LB_67:
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
	jmp LB_68
LB_68:
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %195~%[ 10r ] %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %191~%[ 6r ] %190~%[ 5r ] %189~%[ 4r ] %188~%[ 3r ] %187~%[ 2r ] %186~%[ 1r ] %185~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #40 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] } ⊢ { 7'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) }
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
	call ETR_40

	mov rdx,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %202~6'(= r ) %201~5'(= r ) %200~4'(= r ) %199~3'(= r ) %198~2'(= r ) %197~1'(= r ) %196~7'(= r ) %195~%[ 10r ] %194~%[ 9r ] %193~%[ 8r ] %192~%[ 7r ] %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #42 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 10'(= r ) 9'(= r ) 8'(= r ) }
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
	call ETR_42

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
; rsp_d=0, #42 { %[ 7r ] 4'(= r ) 2'(= r ) } ⊢ { 11'(= r ) 4'(= r ) 2'(= r ) }
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
	call ETR_42

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
; #43 { } ⊢ { 19'(= r ) 18'(= r ) 17'(= r ) 16'(= r ) 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) } / { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 21'(= r ) }
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
	call ETR_43

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
; rsp_d=0, #44 { %[ 1r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { }
	sub rsp,64
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
	push LB_69
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
	call ETR_44

LB_69:
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
; #45 { 19'(= r ) 11'(= r ) 16'(= r ) 10'(= r ) 6'(= r ) 2'(= r ) 18'(= r ) 17'(= r ) 9'(= r ) 8'(= r ) } ⊢ { 17'(= r ) 16'(= r ) 2'(= r ) 11'(= r ) 10'(= r ) 9'(= r ) 6'(= r ) 8'(= r ) 29'(= r ) 30'(= r ) } / { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) 4'(= r ) 5'(= r ) 6'(= r ) 7'(= r ) 29'(= r ) 30'(= r ) }
	sub rsp,48
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*4],r11
	mov QWORD [rsp+8*5],rdx
	push LB_70
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
	call ETR_45

LB_70:
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
; _#8 7'(= r ) ⊢ 7'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,rdx
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_71
LB_71:
; .dlt.ptn 7'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_72
LB_72:
; .dlt.ptn 1'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 9'(= r ) ⊢ 9'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*22]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_73
LB_73:
; .dlt.ptn 9'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 3'(= r ) ⊢ 3'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_74
LB_74:
; .dlt.ptn 3'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 4'(= r ) ⊢ 4'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r10
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_75
LB_75:
; .dlt.ptn 4'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %201~5'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 5'(= r ) ⊢ 5'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r11
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_76
LB_76:
; .dlt.ptn 5'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 10'(= r ) ⊢ 10'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*21]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_77
LB_77:
; .dlt.ptn 10'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 16'(= r ) ⊢ 16'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*15]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_78
LB_78:
; .dlt.ptn 16'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %221~11'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 11'(= r ) ⊢ 11'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*20]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_79
LB_79:
; .dlt.ptn 11'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 29'(= r ) ⊢ 29'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*2]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_80
LB_80:
; .dlt.ptn 29'(= r )
;; rsp=23 , %227~30'(= r ) %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 30'(= r ) ⊢ 30'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*1]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_81
LB_81:
; .dlt.ptn 30'(= r )
;; rsp=23 , %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 17'(= r ) ⊢ 17'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*14]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_82
LB_82:
; .dlt.ptn 17'(= r )
;; rsp=23 , %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 6'(= r ) ⊢ 6'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,rcx
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_83
LB_83:
; .dlt.ptn 6'(= r )
;; rsp=23 , %225~8'(= r ) %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 8'(= r ) ⊢ 8'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*23]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_84
LB_84:
; .dlt.ptn 8'(= r )
;; rsp=23 , %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 2'(= r ) ⊢ 2'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_85
LB_85:
; .dlt.ptn 2'(= r )
;; rsp=23 , %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) } ⊢ { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*16]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*17]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*18]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*19]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,QWORD [rsp-8+8*10]
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_86
LB_86:
; .dlt.ptn { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_5
ETR_54: ; of_s8 0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] ) : (_s8→_t5)
;; rsp=0 , %244~0'(= {| l |} ) 
; #52 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %245~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<4)◂1'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_55: ; len 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) } : (_t5→{ _t5 _r64 })
;; rsp=0 , %246~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_87
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
	mov r9, QWORD [r13+24]
;; rsp=0 , %251~3'(= a5◂ [ ] ) %250~2'(= r ) %249~1'(= a5◂ [ ] ) 
	jmp LB_88
LB_88:
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov rdi,r8
	mov rax,rdi
	mov r13,rax
;; rsp=0 , %253~0'(= r ) %252~2'(= r ) %251~3'(= a5◂ [ ] ) %249~1'(= a5◂ [ ] ) 
; #53 { 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %254~0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } %252~2'(= r ) 
; ∎ { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r10,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
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
LB_87:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
	mov rdi,r13
	cmp BYTE [rdi+6],1
	jnz LB_89
;; rsp=0 , %248~0'(= {| l |} ) 
; _#7 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r14,rdi
;; rsp=0 , %256~1'(= r ) %255~0'(= {| l |} ) 
; #52 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %257~1(<4)◂0'(= {| l |} ) %256~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1(<4)◂2'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r8
	mov BYTE [rax+6],1
	mov r13,rax
	ret
LB_89:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_90
	mov r14,QWORD [rdi+8]
;; rsp=0 , %247~1'(= r ) 
; #50 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %258~3(<4)◂1'(= r ) 
; ∎ { 3(<4)◂1'(= r ) %[ 1r ] }
; .mov_ptn2 { 3(<4)◂1'(= r ) %[ 1r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn 3(<4)◂1'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
; .mov_ptn %[ 1r ] ⊢ 1'(= r )
	mov rax,1
	mov r14,rax
	ret
LB_90:
;; ?. 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
;; rsp=0 , 
; #51 { } ⊢ 2(<4)◂{ }
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
ETR_56: ; add_s8 { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _s8 }→_t5)
;; rsp=0 , %261~1'(= {| l |} ) %260~0'(= a5◂ [ ] ) 
; _#7 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r8,rdi
;; rsp=0 , %263~2'(= r ) %262~1'(= {| l |} ) %260~0'(= a5◂ [ ] ) 
; rsp_d=0, #55 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 3'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_55

	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %265~3'(= r ) %264~0'(= a5◂ [ ] ) %263~2'(= r ) %262~1'(= {| l |} ) 
; _#11 { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %267~3'(= r ) %266~2'(= r ) %264~0'(= a5◂ [ ] ) %262~1'(= {| l |} ) 
; #52 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %268~1(<4)◂1'(= {| l |} ) %267~3'(= r ) %266~2'(= r ) %264~0'(= a5◂ [ ] ) 
; #53 { 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
;; rsp=0 , %269~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } %267~3'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
; .dlt.ptn 3'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
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
ETR_57: ; pfx_s8 { 0'(= {| l |} ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _s8 _t5 }→_t5)
;; rsp=0 , %271~1'(= a5◂ [ ] ) %270~0'(= {| l |} ) 
; _#7 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r8,rdi
;; rsp=0 , %273~2'(= r ) %272~0'(= {| l |} ) %271~1'(= a5◂ [ ] ) 
; rsp_d=0, #55 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_55

	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %275~1'(= r ) %274~3'(= a5◂ [ ] ) %273~2'(= r ) %272~0'(= {| l |} ) 
; _#11 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %277~1'(= r ) %276~2'(= r ) %274~3'(= a5◂ [ ] ) %272~0'(= {| l |} ) 
; #52 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %278~1(<4)◂0'(= {| l |} ) %277~1'(= r ) %276~2'(= r ) %274~3'(= a5◂ [ ] ) 
; #53 { 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %279~0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } %277~1'(= r ) 
; ∎ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1(<4)◂1'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
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
ETR_58: ; add_chr { 0'(= a5◂ [ ] ) 1'(= r ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _r64 }→_t5)
;; rsp=0 , %281~1'(= r ) %280~0'(= a5◂ [ ] ) 
; rsp_d=0, #55 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_55

	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %283~2'(= r ) %282~0'(= a5◂ [ ] ) %281~1'(= r ) 
; _#9 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %284~2'(= r ) %282~0'(= a5◂ [ ] ) %281~1'(= r ) 
; #50 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %285~3(<4)◂1'(= r ) %284~2'(= r ) %282~0'(= a5◂ [ ] ) 
; #53 { 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
;; rsp=0 , %286~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r10,rax
	mov rax,r9
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_59: ; pfx_chr { 0'(= r ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _r64 _t5 }→_t5)
;; rsp=0 , %288~1'(= a5◂ [ ] ) %287~0'(= r ) 
; rsp_d=0, #55 1'(= a5◂ [ ] ) ⊢ { 2'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_55

	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %290~1'(= r ) %289~2'(= a5◂ [ ] ) %287~0'(= r ) 
; _#9 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %291~1'(= r ) %289~2'(= a5◂ [ ] ) %287~0'(= r ) 
; #50 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %292~3(<4)◂0'(= r ) %291~1'(= r ) %289~2'(= a5◂ [ ] ) 
; #53 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
;; rsp=0 , %293~0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } 
; ∎ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3(<4)◂3'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r10,rax
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
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
ETR_60: ; cct { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _t5 }→_t5)
;; rsp=0 , %295~1'(= a5◂ [ ] ) %294~0'(= a5◂ [ ] ) 
; rsp_d=0, #55 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_55

	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %297~2'(= r ) %296~0'(= a5◂ [ ] ) %295~1'(= a5◂ [ ] ) 
; rsp_d=0, #55 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_55

	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %299~1'(= r ) %298~3'(= a5◂ [ ] ) %297~2'(= r ) %296~0'(= a5◂ [ ] ) 
; _#11 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %301~1'(= r ) %300~2'(= r ) %298~3'(= a5◂ [ ] ) %296~0'(= a5◂ [ ] ) 
; #53 { 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %302~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } %301~1'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
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
ETR_61: ; mk_s8_i { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t5 _s8 _r64 }→{ _t5 _s8 _r64 })
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) %303~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a5◂ [ ] ) 4'(= r ) 5'(= a5◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_91
	mov r9, QWORD [r13+8]
	mov r10, QWORD [r13+16]
	mov r11, QWORD [r13+24]
;; rsp=0 , %310~5'(= a5◂ [ ] ) %309~4'(= r ) %308~3'(= a5◂ [ ] ) %305~2'(= r ) %304~1'(= {| l |} ) 
; rsp_d=0, #61 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r10
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_61

	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %313~2'(= r ) %312~1'(= {| l |} ) %311~0'(= a5◂ [ ] ) %310~5'(= a5◂ [ ] ) %309~4'(= r ) 
; rsp_d=0, #61 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 5'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r11
	mov r13,rax
	call ETR_61

	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %316~2'(= r ) %315~1'(= {| l |} ) %314~3'(= a5◂ [ ] ) %311~0'(= a5◂ [ ] ) %309~4'(= r ) 
; #53 { 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %317~0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } %316~2'(= r ) %315~1'(= {| l |} ) 
; ∎ { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r11,r13
; .mov_ptn 0(<4)◂{ 5'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
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
LB_91:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_92
;; rsp=0 , %305~2'(= r ) %304~1'(= {| l |} ) 
; #51 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %318~2(<4)◂{ } %305~2'(= r ) %304~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r13,rax
	ret
LB_92:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_93
	mov r9,QWORD [rdi+8]
;; rsp=0 , %307~3'(= r ) %305~2'(= r ) %304~1'(= {| l |} ) 
; _#14 { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
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
; _#9 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %322~2'(= r ) %321~3'(= r ) %319~1'(= {| l |} ) 
; #50 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %323~3(<4)◂3'(= r ) %322~2'(= r ) %319~1'(= {| l |} ) 
; ∎ { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3(<4)◂3'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_93:
;; ?. 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %306~0'(= {| l |} ) %305~2'(= r ) %304~1'(= {| l |} ) 
; _#7 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r9,rdi
;; rsp=0 , %325~3'(= r ) %324~0'(= {| l |} ) %305~2'(= r ) %304~1'(= {| l |} ) 
; _#17 { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
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
; #52 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %331~1(<4)◂0'(= {| l |} ) %330~2'(= r ) %329~1'(= {| l |} ) %328~%[ 0r ] %326~3'(= r ) 
; _#11 { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %333~3'(= r ) %332~2'(= r ) %331~1(<4)◂0'(= {| l |} ) %329~1'(= {| l |} ) %328~%[ 0r ] 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .dlt.ptn 3'(= r )
; .dlt.ptn %[ 0r ]
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r13
; .mov_ptn 1(<4)◂3'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_62: ; mk_s8 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } : (_t5→{ _t5 _s8 })
;; rsp=0 , %334~0'(= a5◂ [ ] ) 
; rsp_d=0, #55 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_55

;; rsp=0 , %336~1'(= r ) %335~0'(= a5◂ [ ] ) 
; _#6 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %338~2'(= {| l |} ) %337~1'(= r ) %335~0'(= a5◂ [ ] ) 
; rsp_d=0, #61 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
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
	call ETR_61

	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %341~2'(= r ) %340~3'(= {| l |} ) %339~0'(= a5◂ [ ] ) %337~1'(= r ) 
; ∎ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= r )
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= a5◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
RTM_5:
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; #52 %[ "Hello" ] ⊢ 1(<4)◂%[ "Hello" ]
;; rsp=23 , %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #54 %[ "World" ] ⊢ 1'(= a5◂ [ ] )
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
	call ETR_54

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,192
;; rsp=0 , %343~1'(= a5◂ [ ] ) %342~1(<4)◂%[ "Hello" ] %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #60 { 1(<4)◂%[ "Hello" ] 1'(= a5◂ [ ] ) } ⊢ 1'(= a5◂ [ ] )
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
	call ETR_60

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %344~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #56 { 1'(= a5◂ [ ] ) %[ "!!" ] } ⊢ 1'(= a5◂ [ ] )
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
	call ETR_56

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %345~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; #50 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %346~3(<4)◂%[ 44r ] %345~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #60 { 1'(= a5◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ 1'(= a5◂ [ ] )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1'(= a5◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) }
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
; .mov_ptn 3(<4)◂%[ 44r ] ⊢ 1'(= a5◂ [ ] )
	mov rax,44
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r14,rax
	call ETR_60

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %347~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	call LB_94
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_95
LB_94:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_100+8*rax]
LB_100: dq LB_96,LB_97,LB_98,LB_99
LB_96:
	mov rdi,LB_102
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_94
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
	call LB_94
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_101
LB_97:
	mov rdi,LB_103
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_101
LB_98:
	mov rdi,LB_104
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_101
LB_99:
	mov rdi,LB_105
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_101
LB_101:
	ret
LB_95:
;; rsp=0 , %348~1'(= a5◂ [ ] ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #62 1'(= a5◂ [ ] ) ⊢ { 2'(= a5◂ [ ] ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_62

	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn 2'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
;; rsp=0 , %350~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_106
LB_106:
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	call free_s8 
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_6
ETR_63:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_63
	ret
GRM_63:
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
	cmp BYTE [rdi+0],65
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
	call GRM_63
	cmp BYTE [r8+6],0
	jnz LB_116
	jmp LB_117
LB_116:
	jmp LB_114
LB_117:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_115
LB_114:
	add rsp,0
	jmp LB_107
LB_115:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_119
LB_119
;; rsp=0 , %354~1'(= r ) %353~0'(= r ) %352~{ } 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %355~0(<2)◂{ } %354~1'(= r ) %353~0'(= r ) %352~{ } 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_118
LB_118:
	cmp BYTE [r8+6],0
	jnz LB_107
	POP_GRM_SCC
	ret
LB_107:
	POP_GRM_FAIL 
	ret
ETR_64:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_64
	ret
GRM_64:
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
	cmp BYTE [rdi+0],34
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
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_129
	jmp LB_130
LB_129:
	jmp LB_127
LB_130:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_128
LB_127:
	add rsp,0
	jmp LB_120
LB_128:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_132
LB_132
;; rsp=1 , %358~1'(= r ) %357~0'(= r ) %356~8'(= a5◂ [ ] ) 
; #22 8'(= a5◂ [ ] ) ⊢ 0(<2)◂8'(= a5◂ [ ] )
;; rsp=1 , %359~0(<2)◂8'(= a5◂ [ ] ) %358~1'(= r ) %357~0'(= r ) 
; ∎ 0(<2)◂8'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂8'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_131
LB_131:
	cmp BYTE [r8+6],0
	jnz LB_120
	POP_GRM_SCC
	ret
LB_120:
	POP_GRM_FAIL 
	ret
ETR_65:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_65
	ret
GRM_65:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_136
	jmp LB_137
LB_136:
	mov r8,unt_1
	jmp LB_134
LB_137:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
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
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_141
LB_141
;; rsp=0 , %362~1'(= r ) %361~0'(= r ) %360~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %363~1(<2)◂{ } %362~1'(= r ) %361~0'(= r ) %360~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_140
LB_140:
	cmp BYTE [r8+6],0
	jnz LB_133
	POP_GRM_SCC
	ret
LB_133:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_145
	jmp LB_146
LB_145:
	mov r8,unt_1
	jmp LB_143
LB_146:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_147
	jmp LB_148
LB_147:
	mov r8,unt_1
	jmp LB_143
LB_148:
	add r14,1
	jmp LB_144
LB_143:
	add rsp,0
	jmp LB_142
LB_144:
	call GRM_66
	cmp BYTE [r8+6],0
	jnz LB_151
	jmp LB_152
LB_151:
	jmp LB_149
LB_152:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_150
LB_149:
	add rsp,0
	jmp LB_142
LB_150:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_155
	jmp LB_156
LB_155:
	jmp LB_153
LB_156:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_154
LB_153:
	add rsp,8
	jmp LB_142
LB_154:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_158
LB_158
;; rsp=2 , %367~1'(= r ) %366~0'(= r ) %365~9'(= a5◂ [ ] ) %364~8'(= r ) 
; rsp_d=0, #59 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
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
	call ETR_59

	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %368~2'(= a5◂ [ ] ) %367~1'(= r ) %366~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %369~0(<2)◂2'(= a5◂ [ ] ) %367~1'(= r ) %366~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_157
LB_157:
	cmp BYTE [r8+6],0
	jnz LB_142
	POP_GRM_SCC
	ret
LB_142:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_162
	jmp LB_163
LB_162:
	mov r8,unt_1
	jmp LB_160
LB_163:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_164
	jmp LB_165
LB_164:
	mov r8,unt_1
	jmp LB_160
LB_165:
	add r14,1
	jmp LB_161
LB_160:
	add rsp,0
	jmp LB_159
LB_161:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_167
LB_167
;; rsp=0 , %371~1'(= r ) %370~0'(= r ) 
; #51 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %372~2(<4)◂{ } %371~1'(= r ) %370~0'(= r ) 
; #22 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %373~0(<2)◂2(<4)◂{ } %371~1'(= r ) %370~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_166
LB_166:
	cmp BYTE [r8+6],0
	jnz LB_159
	POP_GRM_SCC
	ret
LB_159:
	RB_GRM
	cmp r14,r9
	jge LB_171
	jmp LB_172
LB_171:
	mov r8,unt_1 
	jmp LB_169
LB_172:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_170
LB_169:
	add rsp,0
	jmp LB_168
LB_170:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_175
	jmp LB_176
LB_175:
	jmp LB_173
LB_176:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_174
LB_173:
	add rsp,8
	jmp LB_168
LB_174:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_178
LB_178
;; rsp=2 , %377~1'(= r ) %376~0'(= r ) %375~9'(= a5◂ [ ] ) %374~8'(= r ) 
; rsp_d=0, #59 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
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
	call ETR_59

	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %378~2'(= a5◂ [ ] ) %377~1'(= r ) %376~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %379~0(<2)◂2'(= a5◂ [ ] ) %377~1'(= r ) %376~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_177
LB_177:
	cmp BYTE [r8+6],0
	jnz LB_168
	POP_GRM_SCC
	ret
LB_168:
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
	jg LB_182
	jmp LB_183
LB_182:
	mov r8,unt_1
	jmp LB_180
LB_183:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_184
	jmp LB_185
LB_184:
	mov r8,unt_1
	jmp LB_180
LB_185:
	add r14,1
	jmp LB_181
LB_180:
	add rsp,0
	jmp LB_179
LB_181:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_187
LB_187
;; rsp=0 , %381~1'(= r ) %380~0'(= r ) 
; #22 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
;; rsp=0 , %382~0(<2)◂%[ 92r ] %381~1'(= r ) %380~0'(= r ) 
; ∎ 0(<2)◂%[ 92r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,92
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_186
LB_186:
	cmp BYTE [r8+6],0
	jnz LB_179
	POP_GRM_SCC
	ret
LB_179:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_191
	jmp LB_192
LB_191:
	mov r8,unt_1
	jmp LB_189
LB_192:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_193
	jmp LB_194
LB_193:
	mov r8,unt_1
	jmp LB_189
LB_194:
	add r14,1
	jmp LB_190
LB_189:
	add rsp,0
	jmp LB_188
LB_190:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_196
LB_196
;; rsp=0 , %384~1'(= r ) %383~0'(= r ) 
; #22 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
;; rsp=0 , %385~0(<2)◂%[ 34r ] %384~1'(= r ) %383~0'(= r ) 
; ∎ 0(<2)◂%[ 34r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,34
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_195
LB_195:
	cmp BYTE [r8+6],0
	jnz LB_188
	POP_GRM_SCC
	ret
LB_188:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_200
	jmp LB_201
LB_200:
	mov r8,unt_1
	jmp LB_198
LB_201:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_202
	jmp LB_203
LB_202:
	mov r8,unt_1
	jmp LB_198
LB_203:
	add r14,1
	jmp LB_199
LB_198:
	add rsp,0
	jmp LB_197
LB_199:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_205
LB_205
;; rsp=0 , %387~1'(= r ) %386~0'(= r ) 
; #22 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
;; rsp=0 , %388~0(<2)◂%[ 10r ] %387~1'(= r ) %386~0'(= r ) 
; ∎ 0(<2)◂%[ 10r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,10
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_204
LB_204:
	cmp BYTE [r8+6],0
	jnz LB_197
	POP_GRM_SCC
	ret
LB_197:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_209
	jmp LB_210
LB_209:
	mov r8,unt_1
	jmp LB_207
LB_210:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_211
	jmp LB_212
LB_211:
	mov r8,unt_1
	jmp LB_207
LB_212:
	add r14,1
	jmp LB_208
LB_207:
	add rsp,0
	jmp LB_206
LB_208:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_214
LB_214
;; rsp=0 , %390~1'(= r ) %389~0'(= r ) 
; #22 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
;; rsp=0 , %391~0(<2)◂%[ 9r ] %390~1'(= r ) %389~0'(= r ) 
; ∎ 0(<2)◂%[ 9r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_213
LB_213:
	cmp BYTE [r8+6],0
	jnz LB_206
	POP_GRM_SCC
	ret
LB_206:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_218
	jmp LB_219
LB_218:
	mov r8,unt_1
	jmp LB_216
LB_219:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_220
	jmp LB_221
LB_220:
	mov r8,unt_1
	jmp LB_216
LB_221:
	add r14,1
	jmp LB_217
LB_216:
	add rsp,0
	jmp LB_215
LB_217:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_223
LB_223
;; rsp=0 , %393~1'(= r ) %392~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %394~0(<2)◂%[ 0r ] %393~1'(= r ) %392~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_222
LB_222:
	cmp BYTE [r8+6],0
	jnz LB_215
	POP_GRM_SCC
	ret
LB_215:
	POP_GRM_FAIL 
	ret
ETR_67: ; E1 { } ⊢ { } : ({ }→{ })
;; rsp=0 , 
; rsp_d=0, #64 { %[ "\"Ho\\\"o\"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
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
	call ETR_64

;; rsp=0 , %397~2'(= a3◂ [ a5◂ [ ]] ) %396~1'(= r ) %395~0'(= {| l |} ) 
; _#8 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r13
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	call LB_224
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_225
LB_224:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_228+8*rax]
LB_228: dq LB_226,LB_227
LB_226:
	mov rdi,LB_230
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_94
	jmp LB_229
LB_227:
	mov rdi,LB_231
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_229
LB_229:
	ret
LB_225:
;; rsp=0 , %400~2'(= a3◂ [ a5◂ [ ]] ) %399~1'(= r ) %398~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 0(<2)◂3'(= a5◂ [ ] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_232
	mov r9,QWORD [rdi+8]
;; rsp=0 , %401~3'(= a5◂ [ ] ) %399~1'(= r ) %398~0'(= {| l |} ) 
; rsp_d=0, #62 3'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_62

	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %403~2'(= {| l |} ) %402~3'(= a5◂ [ ] ) %399~1'(= r ) %398~0'(= {| l |} ) 
; _#8 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_233
LB_233:
;; rsp=0 , %404~2'(= {| l |} ) %402~3'(= a5◂ [ ] ) %399~1'(= r ) %398~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	call free_s8 
; .dlt.ptn 3'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	call free_s8 
; .mov_ptn2 { } ⊢ { }
	ret
LB_232:
;; ?. 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %399~1'(= r ) %398~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	call free_s8 
; .mov_ptn2 { } ⊢ { }
	ret
RTM_6:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #67 { } ⊢ { }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { } ⊢ { }
	call ETR_67

	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn { }
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_7
ETR_68:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_68
	ret
GRM_68:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_237
	jmp LB_238
LB_237:
	mov r8,unt_1
	jmp LB_235
LB_238:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_239
	jmp LB_240
LB_239:
	mov r8,unt_1
	jmp LB_235
LB_240:
	add r14,1
	jmp LB_236
LB_235:
	add rsp,0
	jmp LB_234
LB_236:
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_243
	jmp LB_244
LB_243:
	jmp LB_241
LB_244:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_242
LB_241:
	add rsp,0
	jmp LB_234
LB_242:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_246
LB_246
;; rsp=1 , %408~1'(= r ) %407~0'(= r ) %406~8'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=1 , %409~0(<2)◂%[ 0r ] %408~1'(= r ) %407~0'(= r ) %406~8'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_245
LB_245:
	cmp BYTE [r8+6],0
	jnz LB_234
	POP_GRM_SCC
	ret
LB_234:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_250
	jmp LB_251
LB_250:
	mov r8,unt_1
	jmp LB_248
LB_251:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_252
	jmp LB_253
LB_252:
	mov r8,unt_1
	jmp LB_248
LB_253:
	add r14,1
	jmp LB_249
LB_248:
	add rsp,0
	jmp LB_247
LB_249:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_255
LB_255
;; rsp=0 , %411~1'(= r ) %410~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %412~0(<2)◂%[ 1r ] %411~1'(= r ) %410~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_254
LB_254:
	cmp BYTE [r8+6],0
	jnz LB_247
	POP_GRM_SCC
	ret
LB_247:
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
	jg LB_259
	jmp LB_260
LB_259:
	mov r8,unt_1
	jmp LB_257
LB_260:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_261
	jmp LB_262
LB_261:
	mov r8,unt_1
	jmp LB_257
LB_262:
	add r14,1
	jmp LB_258
LB_257:
	add rsp,0
	jmp LB_256
LB_258:
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_265
	jmp LB_266
LB_265:
	jmp LB_263
LB_266:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_264
LB_263:
	add rsp,0
	jmp LB_256
LB_264:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_268
LB_268
;; rsp=1 , %415~1'(= r ) %414~0'(= r ) %413~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %416~0(<2)◂8'(= r ) %415~1'(= r ) %414~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_267
LB_267:
	cmp BYTE [r8+6],0
	jnz LB_256
	POP_GRM_SCC
	ret
LB_256:
	RB_GRM
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_272
	jmp LB_273
LB_272:
	jmp LB_270
LB_273:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_271
LB_270:
	add rsp,0
	jmp LB_269
LB_271:
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_276
	jmp LB_277
LB_276:
	jmp LB_274
LB_277:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_275
LB_274:
	add rsp,8
	jmp LB_269
LB_275:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_279
LB_279
;; rsp=2 , %420~1'(= r ) %419~0'(= r ) %418~9'(= r ) %417~8'(= r ) 
; _#11 { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %422~9'(= r ) %421~8'(= r ) %420~1'(= r ) %419~0'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=2 , %423~0(<2)◂8'(= r ) %422~9'(= r ) %420~1'(= r ) %419~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 9'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_278
LB_278:
	cmp BYTE [r8+6],0
	jnz LB_269
	POP_GRM_SCC
	ret
LB_269:
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
	jg LB_283
	jmp LB_284
LB_283:
	mov r8,unt_1
	jmp LB_281
LB_284:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
	jnz LB_285
	jmp LB_286
LB_285:
	mov r8,unt_1
	jmp LB_281
LB_286:
	add r14,1
	jmp LB_282
LB_281:
	add rsp,0
	jmp LB_280
LB_282:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_289
	jmp LB_290
LB_289:
	mov r8,unt_1
	jmp LB_287
LB_290:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
	jnz LB_291
	jmp LB_292
LB_291:
	mov r8,unt_1
	jmp LB_287
LB_292:
	add r14,1
	jmp LB_288
LB_287:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_288:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_294
LB_294
;; rsp=0 , %425~1'(= r ) %424~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %426~0(<2)◂%[ 0r ] %425~1'(= r ) %424~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_293
LB_293:
	cmp BYTE [r8+6],0
	jnz LB_280
	POP_GRM_SCC
	ret
LB_280:
	RB_GRM
	cmp r14,r9
	jge LB_298
	jmp LB_299
LB_298:
	mov r8,unt_1 
	jmp LB_296
LB_299:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_297
LB_296:
	add rsp,0
	jmp LB_295
LB_297:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_302
	jmp LB_303
LB_302:
	mov r8,unt_1
	jmp LB_300
LB_303:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_304
	jmp LB_305
LB_304:
	mov r8,unt_1
	jmp LB_300
LB_305:
	add r14,1
	jmp LB_301
LB_300:
	add rsp,8
	jmp LB_295
LB_301:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_307
LB_307
;; rsp=1 , %429~1'(= r ) %428~0'(= r ) %427~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %430~0(<2)◂8'(= r ) %429~1'(= r ) %428~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_306
LB_306:
	cmp BYTE [r8+6],0
	jnz LB_295
	POP_GRM_SCC
	ret
LB_295:
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
	jg LB_311
	jmp LB_312
LB_311:
	mov r8,unt_1
	jmp LB_309
LB_312:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_313
	jmp LB_314
LB_313:
	mov r8,unt_1
	jmp LB_309
LB_314:
	add r14,1
	jmp LB_310
LB_309:
	add rsp,0
	jmp LB_308
LB_310:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_319
	jmp LB_320
LB_319:
	mov r8,unt_1
	jmp LB_317
LB_320:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_321
	jmp LB_322
LB_321:
	mov r8,unt_1
	jmp LB_317
LB_322:
	add r14,1
	jmp LB_318
LB_317:
	add rsp,0
	jmp LB_316
LB_318:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_324
LB_324
;; rsp=0 , %434~1'(= r ) %433~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %435~0(<2)◂%[ 0r ] %434~1'(= r ) %433~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_323
LB_323:
	cmp BYTE [r8+6],0
	jnz LB_316
	POP_GRM_SCC
	jmp LB_315
LB_316:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_328
	jmp LB_329
LB_328:
	mov r8,unt_1
	jmp LB_326
LB_329:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_330
	jmp LB_331
LB_330:
	mov r8,unt_1
	jmp LB_326
LB_331:
	add r14,1
	jmp LB_327
LB_326:
	add rsp,0
	jmp LB_325
LB_327:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_336
	jmp LB_337
LB_336:
	mov r8,unt_1
	jmp LB_334
LB_337:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_338
	jmp LB_339
LB_338:
	mov r8,unt_1
	jmp LB_334
LB_339:
	add r14,1
	jmp LB_335
LB_334:
	add rsp,0
	jmp LB_333
LB_335:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_341
LB_341
;; rsp=0 , %439~1'(= r ) %438~0'(= r ) 
; #22 %[ 3r ] ⊢ 0(<2)◂%[ 3r ]
;; rsp=0 , %440~0(<2)◂%[ 3r ] %439~1'(= r ) %438~0'(= r ) 
; ∎ 0(<2)◂%[ 3r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,3
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_340
LB_340:
	cmp BYTE [r8+6],0
	jnz LB_333
	POP_GRM_SCC
	jmp LB_332
LB_333:
	RB_GRM
	call GRM_71
	cmp BYTE [r8+6],0
	jnz LB_345
	jmp LB_346
LB_345:
	jmp LB_343
LB_346:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_344
LB_343:
	add rsp,0
	jmp LB_342
LB_344:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_348
LB_348
;; rsp=1 , %443~1'(= r ) %442~0'(= r ) %441~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %444~0(<2)◂8'(= r ) %443~1'(= r ) %442~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_347
LB_347:
	cmp BYTE [r8+6],0
	jnz LB_342
	POP_GRM_SCC
	jmp LB_332
LB_342:
	POP_GRM_FAIL 
	jmp LB_332
LB_332:
	cmp BYTE [r8+6],0
	jnz LB_349
	jmp LB_350
LB_349:
	add rsp,0
	POP_GRM_FAIL
	jmp LB_315
LB_350:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_352
LB_352
;; rsp=0 , %445~3'(= r ) %437~1'(= r ) %436~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %446~0(<2)◂%[ 1r ] %445~3'(= r ) %437~1'(= r ) %436~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 3'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_351
LB_351:
	cmp BYTE [r8+6],0
	jnz LB_325
	POP_GRM_SCC
	jmp LB_315
LB_325:
	POP_GRM_FAIL 
	jmp LB_315
LB_315:
	cmp BYTE [r8+6],0
	jnz LB_353
	jmp LB_354
LB_353:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_354:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_356
LB_356
;; rsp=0 , %447~3'(= r ) %432~1'(= r ) %431~0'(= r ) 
; #22 3'(= r ) ⊢ 0(<2)◂3'(= r )
;; rsp=0 , %448~0(<2)◂3'(= r ) %432~1'(= r ) %431~0'(= r ) 
; ∎ 0(<2)◂3'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂3'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_355
LB_355:
	cmp BYTE [r8+6],0
	jnz LB_308
	POP_GRM_SCC
	ret
LB_308:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_360
	jmp LB_361
LB_360:
	mov r8,unt_1
	jmp LB_358
LB_361:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
	jnz LB_362
	jmp LB_363
LB_362:
	mov r8,unt_1
	jmp LB_358
LB_363:
	add r14,1
	jmp LB_359
LB_358:
	add rsp,0
	jmp LB_357
LB_359:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_365
LB_365
;; rsp=0 , %450~1'(= r ) %449~0'(= r ) 
; #22 %[ 2r ] ⊢ 0(<2)◂%[ 2r ]
;; rsp=0 , %451~0(<2)◂%[ 2r ] %450~1'(= r ) %449~0'(= r ) 
; ∎ 0(<2)◂%[ 2r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_364
LB_364:
	cmp BYTE [r8+6],0
	jnz LB_357
	POP_GRM_SCC
	ret
LB_357:
	POP_GRM_FAIL 
	ret
ETR_72:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_72
	ret
GRM_72:
	PUSH_GRM
	jmp LB_368
LB_367:
	add r14,1 
LB_368:
	cmp r14,r9
	jge LB_369
	JZ_LINE_SPC BYTE [r13+8+r14], LB_367
LB_369
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_372
	jmp LB_373
LB_372:
	mov r8,unt_1
	jmp LB_370
LB_373:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],97
	jnz LB_374
	jmp LB_375
LB_374:
	mov r8,unt_1
	jmp LB_370
LB_375:
	add r14,1
	jmp LB_371
LB_370:
	add rsp,0
	jmp LB_366
LB_371:
	jmp LB_377
LB_376:
	add r14,1 
LB_377:
	cmp r14,r9
	jge LB_378
	JZ_LINE_SPC BYTE [r13+8+r14], LB_376
LB_378
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_381
	jmp LB_382
LB_381:
	mov r8,unt_1
	jmp LB_379
LB_382:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_383
	jmp LB_384
LB_383:
	mov r8,unt_1
	jmp LB_379
LB_384:
	add r14,1
	jmp LB_380
LB_379:
	add rsp,0
	jmp LB_366
LB_380:
	jmp LB_386
LB_385:
	add r14,1 
LB_386:
	cmp r14,r9
	jge LB_387
	JZ_LINE_SPC BYTE [r13+8+r14], LB_385
LB_387
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_390
	jmp LB_391
LB_390:
	mov r8,unt_1
	jmp LB_388
LB_391:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_392
	jmp LB_393
LB_392:
	mov r8,unt_1
	jmp LB_388
LB_393:
	add r14,1
	jmp LB_389
LB_388:
	add rsp,0
	jmp LB_366
LB_389:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_395
LB_395
;; rsp=0 , %453~1'(= r ) %452~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %454~0(<2)◂%[ 0r ] %453~1'(= r ) %452~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_394
LB_394:
	cmp BYTE [r8+6],0
	jnz LB_366
	POP_GRM_SCC
	ret
LB_366:
	RB_GRM
	jmp LB_398
LB_397:
	add r14,1 
LB_398:
	cmp r14,r9
	jge LB_399
	JZ_SPC BYTE [r13+8+r14], LB_397
LB_399
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_402
	jmp LB_403
LB_402:
	mov r8,unt_1
	jmp LB_400
LB_403:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_404
	jmp LB_405
LB_404:
	mov r8,unt_1
	jmp LB_400
LB_405:
	add r14,1
	jmp LB_401
LB_400:
	add rsp,0
	jmp LB_396
LB_401:
	jmp LB_407
LB_406:
	add r14,1 
LB_407:
	cmp r14,r9
	jge LB_408
	JZ_SPC BYTE [r13+8+r14], LB_406
LB_408
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_411
	jmp LB_412
LB_411:
	jmp LB_409
LB_412:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_410
LB_409:
	add rsp,0
	jmp LB_396
LB_410:
	jmp LB_414
LB_413:
	add r14,1 
LB_414:
	cmp r14,r9
	jge LB_415
	JZ_SPC BYTE [r13+8+r14], LB_413
LB_415
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_418
	jmp LB_419
LB_418:
	mov r8,unt_1
	jmp LB_416
LB_419:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],122
	jnz LB_420
	jmp LB_421
LB_420:
	mov r8,unt_1
	jmp LB_416
LB_421:
	add r14,1
	jmp LB_417
LB_416:
	add rsp,8
	jmp LB_396
LB_417:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_423
LB_423
;; rsp=1 , %457~1'(= r ) %456~0'(= r ) %455~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %458~0(<2)◂8'(= r ) %457~1'(= r ) %456~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_422
LB_422:
	cmp BYTE [r8+6],0
	jnz LB_396
	POP_GRM_SCC
	ret
LB_396:
	RB_GRM
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_427
	jmp LB_428
LB_427:
	jmp LB_425
LB_428:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_426
LB_425:
	add rsp,0
	jmp LB_424
LB_426:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_431
	jmp LB_432
LB_431:
	mov r8,unt_1
	jmp LB_429
LB_432:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_433
	jmp LB_434
LB_433:
	mov r8,unt_1
	jmp LB_429
LB_434:
	add r14,1
	jmp LB_430
LB_429:
	add rsp,8
	jmp LB_424
LB_430:
	call GRM_71
	cmp BYTE [r8+6],0
	jnz LB_437
	jmp LB_438
LB_437:
	jmp LB_435
LB_438:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_436
LB_435:
	add rsp,8
	jmp LB_424
LB_436:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_440
LB_440
;; rsp=2 , %462~1'(= r ) %461~0'(= r ) %460~9'(= r ) %459~8'(= r ) 
; #22 9'(= r ) ⊢ 0(<2)◂9'(= r )
;; rsp=2 , %463~0(<2)◂9'(= r ) %462~1'(= r ) %461~0'(= r ) %459~8'(= r ) 
; ∎ 0(<2)◂9'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_439
LB_439:
	cmp BYTE [r8+6],0
	jnz LB_424
	POP_GRM_SCC
	ret
LB_424:
	POP_GRM_FAIL 
	ret
RTM_7:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #69 { %[ "ABAB" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
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
	call ETR_69

	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %466~2'(= a3◂ [ r] ) %465~1'(= r ) %464~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	call LB_441
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_442
LB_441:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_445+8*rax]
LB_445: dq LB_443,LB_444
LB_443:
	mov rdi,LB_447
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_446
LB_444:
	mov rdi,LB_448
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_446
LB_446:
	ret
LB_442:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #70 { %[ "sY" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
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
	call ETR_70

	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %470~2'(= a3◂ [ r] ) %469~1'(= r ) %468~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	call LB_441
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_449
LB_449:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #71 { %[ "AB" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
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
	call ETR_71

	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %474~2'(= a3◂ [ r] ) %473~1'(= r ) %472~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	call LB_441
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_450
LB_450:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #71 { %[ "ACACe" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
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
	call ETR_71

	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %478~2'(= a3◂ [ r] ) %477~1'(= r ) %476~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	call LB_441
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_451
LB_451:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #72 { %[ " a bc d" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
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
	call ETR_72

	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %482~2'(= a3◂ [ r] ) %481~1'(= r ) %480~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	call LB_441
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_452
LB_452:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; _#8 %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_453
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_454
LB_454:
; .dlt.ptn %[ "dd\t\n\"J  " ]
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_8
ETR_73: ; f2 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %485~0'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %486~0'(= r ) 
; _#9 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %487~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
RTM_8:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,16
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_455+16-1]
	mov rcx,16
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %488~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_456
LB_456:
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	call free_s8 
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #73 %[ 3r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ 3r ] ⊢ 0'(= r )
; .mov_ptn %[ 3r ] ⊢ 0'(= r )
	mov rax,3
	mov r13,rax
	call ETR_73

	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %490~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#6 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %492~2'(= {| l |} ) %491~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 { 1'(= r ) 2'(= {| l |} ) } ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_457
LB_457:
; .dlt.ptn { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r8
	call free_s8 
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_9
ETR_74: ; f0 { } ⊢ { } : ({ }→{ })
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
	lea rsi,[LB_458+16-1]
	mov rcx,16
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %494~0'(= {| l |} ) 
; _#8 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r13
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_459
LB_459:
;; rsp=0 , %495~0'(= {| l |} ) 
	jmp LB_460
LB_460:
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %496~%[ 3r ] %495~0'(= {| l |} ) 
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
;; rsp=0 , %500~1'(= {| l |} ) %499~%[ 17r ] %498~%[ 3r ] %497~0'(= {| l |} ) 
; _#8 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_470
LB_470:
;; rsp=0 , %501~1'(= {| l |} ) %499~%[ 17r ] %498~%[ 3r ] %497~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	call free_s8 
; .dlt.ptn %[ 17r ]
; .dlt.ptn %[ 3r ]
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	call free_s8 
; .mov_ptn2 { } ⊢ { }
	ret
ETR_75: ; f1 0'(= r ) ⊢ { 0'(= r ) 1'(= r ) } : (_r64→{ _r64 _r64 })
;; rsp=0 , %502~0'(= r ) 
; #13 { 0'(= r ) %[ 3r ] } ⊢|
	add r13,3
; .mov_ptn2 { 0'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; .mov_ptn %[ 3r ] ⊢ 1'(= r )
	mov rax,3
	mov r14,rax
	ret
RTM_9:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; _#0 { %[ 7r ] %[ "Fu" ] } ⊢ { %[ 7r ] %[ "Fu" ] 1'(= {| {| l |}|} ) }
	mov rdi,7
	push rdi 
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov r14,rax
	mov QWORD [rax],rdi 
	cmp rdi,0 
	jz LB_472
	mov r9,rdi
	jmp LB_473
LB_473:
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
LB_471:
	mov rsi,r14
	mov rax,r8
	mov rdi,r9
	mov QWORD [rsi+8*rdi],rax 
	cmp rdi,1 
	jz LB_472
	sub rdi,1 
	mov r9,rdi
	mov rdi,rax
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov r8,rax
	jmp LB_471
LB_472:
; .dlt.ptn %[ "Fu" ]
; .dlt.ptn %[ 7r ]
;; rsp=0 , %505~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= {| {| l |}|} ) ⊢ 1'(= {| {| l |}|} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,[r8]
	mov rax,0 
LB_474:
	cmp rsi,rax 
	jz LB_475
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
	jmp LB_474
LB_475:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_476
LB_476:
;; rsp=0 , %506~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; _#1 { 1'(= {| {| l |}|} ) %[ 1r ] %[ "Xo" ] } ⊢ { 1'(= {| {| l |}|} ) %[ 1r ] 3'(= {| l |} ) }
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
	lea rdi,[rdi+8+8*rax]
	mov rax,QWORD [rdi]
	mov rsi,r8
	mov QWORD [rdi],rsi 
	mov r8,rax
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	call free_s8 
; .dlt.ptn %[ 1r ]
;; rsp=0 , %507~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #75 %[ 8r ] ⊢ { 3'(= r ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 %[ 8r ] ⊢ 0'(= r )
; .mov_ptn %[ 8r ] ⊢ 0'(= r )
	mov rax,8
	mov r13,rax
	call ETR_75

	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %511~2'(= r ) %510~3'(= r ) %507~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; _#4 { 1'(= {| {| l |}|} ) %[ 3r ] } ⊢ { 1'(= {| {| l |}|} ) %[ 3r ] 5'(= {| l |} ) }
	mov rax,3
	mov rdi,r14
	mov rdi,[rdi+8+8*rax]
	jmp LB_477
LB_477:
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov r10,rax
; .mov_ptn2 4'(= {| l |} ) ⊢ 5'(= {| l |} )
	mov rcx,r11
; .mov_ptn 4'(= {| l |} ) ⊢ 5'(= {| l |} )
	mov rax,r10
	mov r11,rax
; .dlt.ptn %[ 3r ]
;; rsp=0 , %514~5'(= {| l |} ) %512~1'(= {| {| l |}|} ) %511~2'(= r ) %510~3'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 { 1'(= {| {| l |}|} ) 5'(= {| l |} ) } ⊢ { 1'(= {| {| l |}|} ) 5'(= {| l |} ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,[r8]
	mov rax,0 
LB_478:
	cmp rsi,rax 
	jz LB_479
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
	jmp LB_478
LB_479:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r11
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_480
LB_480:
; .dlt.ptn 5'(= {| l |} )
	mov rdi,r11
	call free_s8 
;; rsp=0 , %515~1'(= {| {| l |}|} ) %511~2'(= r ) %510~3'(= r ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_10
RTM_10:
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
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rax,1
	mov rbx,0
	int 0x80
