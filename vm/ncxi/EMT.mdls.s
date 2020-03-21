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

%define SS_MAX 2000
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX 2048
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

	SS_RCD_1_TOP: resq 1
	SS_RCD_1_VCT: resq 2*SS_MAX
	SS_RCD_1_BTM: resq 1

	SS_RCD_2_TOP: resq 1
	SS_RCD_2_VCT: resq 3*SS_MAX
	SS_RCD_2_BTM: resq 1

	SS_RCD_3_TOP: resq 1
	SS_RCD_3_VCT: resq 4*SS_MAX
	SS_RCD_3_BTM: resq 1

	SS_RCD_4_TOP: resq 1
	SS_RCD_4_VCT: resq 5*SS_MAX
	SS_RCD_4_BTM: resq 1

	SS_RCD_5_TOP: resq 1
	SS_RCD_5_VCT: resq 6*SS_MAX
	SS_RCD_5_BTM: resq 1

	SS_RCD_6_TOP: resq 1
	SS_RCD_6_VCT: resq 7*SS_MAX
	SS_RCD_6_BTM: resq 1

	SS_RCD_7_TOP: resq 1
	SS_RCD_7_VCT: resq 8*SS_MAX
	SS_RCD_7_BTM: resq 1

	SS_RCD_8_TOP: resq 1
	SS_RCD_8_VCT: resq 9*SS_MAX
	SS_RCD_8_BTM: resq 1

	SS_RCD_9_TOP: resq 1
	SS_RCD_9_VCT: resq 10*SS_MAX
	SS_RCD_9_BTM: resq 1

	SS_RCD_10_TOP: resq 1
	SS_RCD_10_VCT: resq 11*SS_MAX
	SS_RCD_10_BTM: resq 1

	SS_RCD_11_TOP: resq 1
	SS_RCD_11_VCT: resq 12*SS_MAX
	SS_RCD_11_BTM: resq 1

	SS_RCD_12_TOP: resq 1
	SS_RCD_12_VCT: resq 13*SS_MAX
	SS_RCD_12_BTM: resq 1

	SS_RCD_13_TOP: resq 1
	SS_RCD_13_VCT: resq 14*SS_MAX
	SS_RCD_13_BTM: resq 1

	SS_RCD_14_TOP: resq 1
	SS_RCD_14_VCT: resq 15*SS_MAX
	SS_RCD_14_BTM: resq 1

	SS_RCD_15_TOP: resq 1
	SS_RCD_15_VCT: resq 16*SS_MAX
	SS_RCD_15_BTM: resq 1

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
LB_300: db 39,48,226,151,130,0
LB_301: db 39,49,226,151,130,0
LB_308: db 39,48,226,151,130,0
LB_309: db 39,49,226,151,130,0
LB_316: db 39,48,226,151,130,0
LB_317: db 39,49,226,151,130,0
LB_324: db 39,48,226,151,130,0
LB_325: db 39,49,226,151,130,0
LB_332: db 39,48,226,151,130,0
LB_333: db 39,49,226,151,130,0
LB_334: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_336: db 10,0
LB_337: db 33,33,0
LB_338: db 32,87,111,114,108,100,32,0
LB_339: db 72,101,108,108,111,32,0
LB_342: db 10,0
LB_343: db 33,33,0
LB_344: db 32,87,111,114,108,100,32,0
LB_345: db 72,101,108,108,111,32,0
LB_348: db 104,0
LB_349: db 103,0
LB_352: db 89,100,32,112,0
LB_355: db 49,55,0
LB_356: db 102,111,111,0
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,EMT_BUF 
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
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
	mov r15,rax
args_lp:
	cmp r14,r13
	jz args_lp_end
	pop rdi
	call s8_of_c_stg 
	mov QWORD [r15+8+8*r14],rax
	add r14,1 
	jmp args_lp 
args_lp_end:
	mov r13,r15
	

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
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %2~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_31: ; f1 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %4~1'(= r ) %3~0'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %5~0'(= r ) %4~1'(= r ) 
; _#11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %6~1'(= r ) %5~0'(= r ) 
; _#11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %7~1'(= r ) %5~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	ret
ETR_32: ; f2 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %9~1'(= r ) %8~0'(= r ) 
; _#15 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
;; rsp=0 , %11~1'(= r ) %10~0'(= r ) 
; _#15 { %[ 4r ] 1'(= r ) } ⊢ { 1'(= r ) 1'(= r ) }
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
; _#11 0'(= r ) ⊢ 0'(= r )
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
; _#11 0'(= r ) ⊢ 0'(= r )
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
; _#15 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
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
; _#12 0'(= r ) ⊢ 0'(= r )
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
; _#12 0'(= r ) ⊢ 0'(= r )
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
; _#15 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
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
; _#11 %[ 0r ] ⊢ %[ 1r ]
;; rsp=0 , %34~%[ 1r ] %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #30 %[ 1r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ 1r ] ⊢ 0'(= r )
; .mov_ptn %[ 1r ] ⊢ 0'(= r )
	mov rax,1
	mov r13,rax
	call ETR_30

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
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
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	add rsp,16
; .dlt.ptn 2'(= r )
;; rsp=0 , %36~%[ 3r ] %35~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
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

	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
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

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %42~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
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

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %44~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
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
; _#10 %[ 0r ] ⊢ %[ 0r ]
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
; _#10 %[ 0r ] ⊢ %[ 0r ]
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
; _#10 %[ 0r ] ⊢ %[ 0r ]
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
; _#10 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
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
; _#12 0'(= r ) ⊢ 0'(= r )
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
; _#15 { 1'(= r ) 0'(= r ) } ⊢ { 1'(= r ) 0'(= r ) }
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
; _#12 3'(= r ) ⊢ 3'(= r )
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
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
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
; _#12 5'(= r ) ⊢ 5'(= r )
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
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r13
	mov r13,rax
	add rsp,32
;; rsp=0 , %89~4'(= r ) %86~2'(= r ) %84~1'(= r ) %82~0'(= r ) %81~3'(= r ) 
; _#12 2'(= r ) ⊢ 2'(= r )
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
; _#12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %98~0'(= r ) %95~2'(= r ) %94~1'(= r ) 
; rsp_d=0, #39 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
; .mov_ptn2 { 0'(= r ) 1'(= r ) 2'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
	call ETR_39

;; rsp=0 , %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) %99~0'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %103~0'(= r ) %102~3'(= r ) %101~2'(= r ) %100~1'(= r ) 
; _#12 1'(= r ) ⊢ 1'(= r )
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

	mov rax,QWORD [rsp-8+8*1]
	mov r10,r9
	mov r9,rax
	add rsp,8
;; rsp=0 , %108~4'(= r ) %107~2'(= r ) %106~1'(= r ) %105~0'(= r ) %102~3'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %109~0'(= r ) %108~4'(= r ) %107~2'(= r ) %106~1'(= r ) %102~3'(= r ) 
; _#12 1'(= r ) ⊢ 1'(= r )
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
	mov rax,QWORD [rsp-8+8*1]
	mov r11,r9
	mov r9,rax
	add rsp,16
;; rsp=0 , %114~5'(= r ) %113~2'(= r ) %112~1'(= r ) %111~0'(= r ) %108~4'(= r ) %102~3'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
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

	mov rax,QWORD [rsp-8+8*3]
	mov r10,r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov r11,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov rcx,r13
	mov r13,rax
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

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %120~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
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

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %122~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
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

	mov rax,QWORD [rsp-8+8*1]
	mov r10,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %127~3'(= r ) %126~2'(= r ) %125~1'(= r ) %124~4'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) } ⊢ { 4'(= r ) 1'(= r ) 2'(= r ) 3'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r10
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r9
	C_PUSH_REGS
	mov r8,rax
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
	mov rdi,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*1],rdi
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*2],rax
	sub rsp,8
	mov rdi,QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*1],rdi
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
; _#15 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
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
; _#15 { 1'(= r ) 2'(= r ) } ⊢ { 1'(= r ) 2'(= r ) }
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

	mov rax,QWORD [rsp-8+8*1]
	mov rdx,r13
	mov r13,rax
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
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [rsp-8+8*8],r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*7],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
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
	mov rax,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
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
	mov rax,QWORD [rsp-8+8*9]
	mov QWORD [rsp-8+8*23],rdx
	mov rdx,rax
	mov rax,QWORD [rsp-8+8*8]
	mov QWORD [rsp-8+8*22],r11
	mov r11,rax
	mov rax,QWORD [rsp-8+8*7]
	mov QWORD [rsp-8+8*21],r10
	mov r10,rax
	mov rax,QWORD [rsp-8+8*6]
	mov QWORD [rsp-8+8*20],r9
	mov r9,rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [rsp-8+8*15],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*14],r13
	mov r13,rax
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %196~7'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 7'(= r ) ⊢ 7'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,rdx
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_71
LB_71:
; .dlt.ptn 7'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %197~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_72
LB_72:
; .dlt.ptn 1'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %223~9'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 9'(= r ) ⊢ 9'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*22]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_73
LB_73:
; .dlt.ptn 9'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %199~3'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 3'(= r ) ⊢ 3'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r9
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_74
LB_74:
; .dlt.ptn 3'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %207~4'(= r ) %201~5'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 4'(= r ) ⊢ 4'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r10
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_75
LB_75:
; .dlt.ptn 4'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %201~5'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 5'(= r ) ⊢ 5'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r11
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_76
LB_76:
; .dlt.ptn 5'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %222~10'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 10'(= r ) ⊢ 10'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*21]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_77
LB_77:
; .dlt.ptn 10'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %221~11'(= r ) %220~2'(= r ) %219~16'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 16'(= r ) ⊢ 16'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*15]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_78
LB_78:
; .dlt.ptn 16'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %221~11'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 11'(= r ) ⊢ 11'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*20]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_79
LB_79:
; .dlt.ptn 11'(= r )
;; rsp=23 , %227~30'(= r ) %226~29'(= r ) %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 29'(= r ) ⊢ 29'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_80
LB_80:
; .dlt.ptn 29'(= r )
;; rsp=23 , %227~30'(= r ) %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 30'(= r ) ⊢ 30'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_81
LB_81:
; .dlt.ptn 30'(= r )
;; rsp=23 , %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %218~17'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 17'(= r ) ⊢ 17'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*14]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_82
LB_82:
; .dlt.ptn 17'(= r )
;; rsp=23 , %225~8'(= r ) %224~6'(= r ) %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 6'(= r ) ⊢ 6'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,rcx
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_83
LB_83:
; .dlt.ptn 6'(= r )
;; rsp=23 , %225~8'(= r ) %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 8'(= r ) ⊢ 8'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,QWORD [rsp-8+8*23]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_84
LB_84:
; .dlt.ptn 8'(= r )
;; rsp=23 , %220~2'(= r ) %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 2'(= r ) ⊢ 2'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_85
LB_85:
; .dlt.ptn 2'(= r )
;; rsp=23 , %217~21'(= r ) %216~12'(= r ) %215~13'(= r ) %214~14'(= r ) %213~15'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) } ⊢ { 15'(= r ) 14'(= r ) 13'(= r ) 12'(= r ) 21'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,QWORD [rsp-8+8*16]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,QWORD [rsp-8+8*17]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,QWORD [rsp-8+8*18]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,QWORD [rsp-8+8*19]
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,QWORD [rsp-8+8*10]
	C_PUSH_REGS
	mov r8,rax
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
ETR_50:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_50
	ret
GRM_50:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_90
	jmp LB_91
LB_90:
	mov r8,unt_1
	jmp LB_88
LB_91:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_92
	jmp LB_93
LB_92:
	mov r8,unt_1
	jmp LB_88
LB_93:
	add r14,1
	jmp LB_89
LB_88:
	add rsp,0
	jmp LB_87
LB_89:
	call GRM_50
	cmp BYTE [r8+6],0
	jnz LB_96
	jmp LB_97
LB_96:
	jmp LB_94
LB_97:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_95
LB_94:
	add rsp,0
	jmp LB_87
LB_95:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_99
LB_99
;; rsp=1 , %246~1'(= r ) %245~0'(= r ) %244~8'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=1 , %247~0(<2)◂%[ 0r ] %246~1'(= r ) %245~0'(= r ) %244~8'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_98
LB_98:
	cmp BYTE [r8+6],0
	jnz LB_87
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_87:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_103
	jmp LB_104
LB_103:
	mov r8,unt_1
	jmp LB_101
LB_104:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_105
	jmp LB_106
LB_105:
	mov r8,unt_1
	jmp LB_101
LB_106:
	add r14,1
	jmp LB_102
LB_101:
	add rsp,0
	jmp LB_100
LB_102:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_108
LB_108
;; rsp=0 , %249~1'(= r ) %248~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %250~0(<2)◂%[ 1r ] %249~1'(= r ) %248~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_107
LB_107:
	cmp BYTE [r8+6],0
	jnz LB_100
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_100:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_51:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_51
	ret
GRM_51:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_112
	jmp LB_113
LB_112:
	mov r8,unt_1
	jmp LB_110
LB_113:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_114
	jmp LB_115
LB_114:
	mov r8,unt_1
	jmp LB_110
LB_115:
	add r14,1
	jmp LB_111
LB_110:
	add rsp,0
	jmp LB_109
LB_111:
	call GRM_50
	cmp BYTE [r8+6],0
	jnz LB_118
	jmp LB_119
LB_118:
	jmp LB_116
LB_119:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_117
LB_116:
	add rsp,0
	jmp LB_109
LB_117:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_121
LB_121
;; rsp=1 , %253~1'(= r ) %252~0'(= r ) %251~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %254~0(<2)◂8'(= r ) %253~1'(= r ) %252~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_120
LB_120:
	cmp BYTE [r8+6],0
	jnz LB_109
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_109:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	call GRM_50
	cmp BYTE [r8+6],0
	jnz LB_125
	jmp LB_126
LB_125:
	jmp LB_123
LB_126:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_124
LB_123:
	add rsp,0
	jmp LB_122
LB_124:
	call GRM_50
	cmp BYTE [r8+6],0
	jnz LB_129
	jmp LB_130
LB_129:
	jmp LB_127
LB_130:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_128
LB_127:
	add rsp,8
	jmp LB_122
LB_128:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_132
LB_132
;; rsp=2 , %258~1'(= r ) %257~0'(= r ) %256~9'(= r ) %255~8'(= r ) 
; _#13 { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %260~9'(= r ) %259~8'(= r ) %258~1'(= r ) %257~0'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=2 , %261~0(<2)◂8'(= r ) %260~9'(= r ) %258~1'(= r ) %257~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 9'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_131
LB_131:
	cmp BYTE [r8+6],0
	jnz LB_122
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_122:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_52:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_52
	ret
GRM_52:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_136
	jmp LB_137
LB_136:
	mov r8,unt_1
	jmp LB_134
LB_137:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
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
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_142
	jmp LB_143
LB_142:
	mov r8,unt_1
	jmp LB_140
LB_143:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
	jnz LB_144
	jmp LB_145
LB_144:
	mov r8,unt_1
	jmp LB_140
LB_145:
	add r14,1
	jmp LB_141
LB_140:
	add rsp,0
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_141:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_147
LB_147
;; rsp=0 , %263~1'(= r ) %262~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %264~0(<2)◂%[ 0r ] %263~1'(= r ) %262~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_146
LB_146:
	cmp BYTE [r8+6],0
	jnz LB_133
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_133:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	cmp r14,r9
	jge LB_151
	jmp LB_152
LB_151:
	mov r8,unt_1 
	jmp LB_149
LB_152:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_150
LB_149:
	add rsp,0
	jmp LB_148
LB_150:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_155
	jmp LB_156
LB_155:
	mov r8,unt_1
	jmp LB_153
LB_156:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_157
	jmp LB_158
LB_157:
	mov r8,unt_1
	jmp LB_153
LB_158:
	add r14,1
	jmp LB_154
LB_153:
	add rsp,8
	jmp LB_148
LB_154:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_160
LB_160
;; rsp=1 , %267~1'(= r ) %266~0'(= r ) %265~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %268~0(<2)◂8'(= r ) %267~1'(= r ) %266~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_159
LB_159:
	cmp BYTE [r8+6],0
	jnz LB_148
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_148:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_53:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_53
	ret
GRM_53:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_164
	jmp LB_165
LB_164:
	mov r8,unt_1
	jmp LB_162
LB_165:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_166
	jmp LB_167
LB_166:
	mov r8,unt_1
	jmp LB_162
LB_167:
	add r14,1
	jmp LB_163
LB_162:
	add rsp,0
	jmp LB_161
LB_163:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_172
	jmp LB_173
LB_172:
	mov r8,unt_1
	jmp LB_170
LB_173:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_174
	jmp LB_175
LB_174:
	mov r8,unt_1
	jmp LB_170
LB_175:
	add r14,1
	jmp LB_171
LB_170:
	add rsp,0
	jmp LB_169
LB_171:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_177
LB_177
;; rsp=0 , %272~1'(= r ) %271~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %273~0(<2)◂%[ 0r ] %272~1'(= r ) %271~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_176
LB_176:
	cmp BYTE [r8+6],0
	jnz LB_169
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_168
LB_169:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_181
	jmp LB_182
LB_181:
	mov r8,unt_1
	jmp LB_179
LB_182:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_183
	jmp LB_184
LB_183:
	mov r8,unt_1
	jmp LB_179
LB_184:
	add r14,1
	jmp LB_180
LB_179:
	add rsp,0
	jmp LB_178
LB_180:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_189
	jmp LB_190
LB_189:
	mov r8,unt_1
	jmp LB_187
LB_190:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_191
	jmp LB_192
LB_191:
	mov r8,unt_1
	jmp LB_187
LB_192:
	add r14,1
	jmp LB_188
LB_187:
	add rsp,0
	jmp LB_186
LB_188:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_194
LB_194
;; rsp=0 , %277~1'(= r ) %276~0'(= r ) 
; #22 %[ 3r ] ⊢ 0(<2)◂%[ 3r ]
;; rsp=0 , %278~0(<2)◂%[ 3r ] %277~1'(= r ) %276~0'(= r ) 
; ∎ 0(<2)◂%[ 3r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,3
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_193
LB_193:
	cmp BYTE [r8+6],0
	jnz LB_186
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_185
LB_186:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	call GRM_53
	cmp BYTE [r8+6],0
	jnz LB_198
	jmp LB_199
LB_198:
	jmp LB_196
LB_199:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_197
LB_196:
	add rsp,0
	jmp LB_195
LB_197:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_201
LB_201
;; rsp=1 , %281~1'(= r ) %280~0'(= r ) %279~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %282~0(<2)◂8'(= r ) %281~1'(= r ) %280~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_200
LB_200:
	cmp BYTE [r8+6],0
	jnz LB_195
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_185
LB_195:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_185
LB_185:
	cmp BYTE [r8+6],0
	jnz LB_202
	jmp LB_203
LB_202:
	add rsp,0
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	jmp LB_168
LB_203:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_205
LB_205
;; rsp=0 , %283~3'(= r ) %275~1'(= r ) %274~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %284~0(<2)◂%[ 1r ] %283~3'(= r ) %275~1'(= r ) %274~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 3'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_204
LB_204:
	cmp BYTE [r8+6],0
	jnz LB_178
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_168
LB_178:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_168
LB_168:
	cmp BYTE [r8+6],0
	jnz LB_206
	jmp LB_207
LB_206:
	add rsp,0
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_207:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_209
LB_209
;; rsp=0 , %285~3'(= r ) %270~1'(= r ) %269~0'(= r ) 
; #22 3'(= r ) ⊢ 0(<2)◂3'(= r )
;; rsp=0 , %286~0(<2)◂3'(= r ) %270~1'(= r ) %269~0'(= r ) 
; ∎ 0(<2)◂3'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂3'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_208
LB_208:
	cmp BYTE [r8+6],0
	jnz LB_161
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_161:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_213
	jmp LB_214
LB_213:
	mov r8,unt_1
	jmp LB_211
LB_214:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
	jnz LB_215
	jmp LB_216
LB_215:
	mov r8,unt_1
	jmp LB_211
LB_216:
	add r14,1
	jmp LB_212
LB_211:
	add rsp,0
	jmp LB_210
LB_212:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_218
LB_218
;; rsp=0 , %288~1'(= r ) %287~0'(= r ) 
; #22 %[ 2r ] ⊢ 0(<2)◂%[ 2r ]
;; rsp=0 , %289~0(<2)◂%[ 2r ] %288~1'(= r ) %287~0'(= r ) 
; ∎ 0(<2)◂%[ 2r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_217
LB_217:
	cmp BYTE [r8+6],0
	jnz LB_210
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_210:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_54:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_54
	ret
GRM_54:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_221
LB_220:
	add r14,1 
LB_221:
	cmp r14,r9
	jge LB_222
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_220
	cmp rax,32 
	jz LB_220
LB_222
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_225
	jmp LB_226
LB_225:
	mov r8,unt_1
	jmp LB_223
LB_226:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],97
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
	jmp LB_219
LB_224:
	jmp LB_230
LB_229:
	add r14,1 
LB_230:
	cmp r14,r9
	jge LB_231
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_229
	cmp rax,32 
	jz LB_229
LB_231
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_234
	jmp LB_235
LB_234:
	mov r8,unt_1
	jmp LB_232
LB_235:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_236
	jmp LB_237
LB_236:
	mov r8,unt_1
	jmp LB_232
LB_237:
	add r14,1
	jmp LB_233
LB_232:
	add rsp,0
	jmp LB_219
LB_233:
	jmp LB_239
LB_238:
	add r14,1 
LB_239:
	cmp r14,r9
	jge LB_240
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_238
	cmp rax,32 
	jz LB_238
LB_240
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_243
	jmp LB_244
LB_243:
	mov r8,unt_1
	jmp LB_241
LB_244:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_245
	jmp LB_246
LB_245:
	mov r8,unt_1
	jmp LB_241
LB_246:
	add r14,1
	jmp LB_242
LB_241:
	add rsp,0
	jmp LB_219
LB_242:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_248
LB_248
;; rsp=0 , %291~1'(= r ) %290~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %292~0(<2)◂%[ 0r ] %291~1'(= r ) %290~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_247
LB_247:
	cmp BYTE [r8+6],0
	jnz LB_219
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_219:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	jmp LB_251
LB_250:
	add r14,1 
LB_251:
	cmp r14,r9
	jge LB_252
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_250
	cmp rax,10 
	jz LB_250
	cmp rax,32 
	jz LB_250
LB_252
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_255
	jmp LB_256
LB_255:
	mov r8,unt_1
	jmp LB_253
LB_256:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
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
	jmp LB_249
LB_254:
	jmp LB_260
LB_259:
	add r14,1 
LB_260:
	cmp r14,r9
	jge LB_261
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_259
	cmp rax,10 
	jz LB_259
	cmp rax,32 
	jz LB_259
LB_261
	call GRM_54
	cmp BYTE [r8+6],0
	jnz LB_264
	jmp LB_265
LB_264:
	jmp LB_262
LB_265:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_263
LB_262:
	add rsp,0
	jmp LB_249
LB_263:
	jmp LB_267
LB_266:
	add r14,1 
LB_267:
	cmp r14,r9
	jge LB_268
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_266
	cmp rax,10 
	jz LB_266
	cmp rax,32 
	jz LB_266
LB_268
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_271
	jmp LB_272
LB_271:
	mov r8,unt_1
	jmp LB_269
LB_272:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],122
	jnz LB_273
	jmp LB_274
LB_273:
	mov r8,unt_1
	jmp LB_269
LB_274:
	add r14,1
	jmp LB_270
LB_269:
	add rsp,8
	jmp LB_249
LB_270:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_276
LB_276
;; rsp=1 , %295~1'(= r ) %294~0'(= r ) %293~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %296~0(<2)◂8'(= r ) %295~1'(= r ) %294~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_275
LB_275:
	cmp BYTE [r8+6],0
	jnz LB_249
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_249:
	mov r9,QWORD [rsp+8]
	mov r14,QWORD [rsp+16]
	mov r13,QWORD [rsp+24]
	call GRM_54
	cmp BYTE [r8+6],0
	jnz LB_280
	jmp LB_281
LB_280:
	jmp LB_278
LB_281:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_279
LB_278:
	add rsp,0
	jmp LB_277
LB_279:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_284
	jmp LB_285
LB_284:
	mov r8,unt_1
	jmp LB_282
LB_285:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_286
	jmp LB_287
LB_286:
	mov r8,unt_1
	jmp LB_282
LB_287:
	add r14,1
	jmp LB_283
LB_282:
	add rsp,8
	jmp LB_277
LB_283:
	call GRM_53
	cmp BYTE [r8+6],0
	jnz LB_290
	jmp LB_291
LB_290:
	jmp LB_288
LB_291:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_289
LB_288:
	add rsp,8
	jmp LB_277
LB_289:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_293
LB_293
;; rsp=2 , %300~1'(= r ) %299~0'(= r ) %298~9'(= r ) %297~8'(= r ) 
; #22 9'(= r ) ⊢ 0(<2)◂9'(= r )
;; rsp=2 , %301~0(<2)◂9'(= r ) %300~1'(= r ) %299~0'(= r ) %297~8'(= r ) 
; ∎ 0(<2)◂9'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_292
LB_292:
	cmp BYTE [r8+6],0
	jnz LB_277
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_277:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
RTM_5:
;; rsp=23 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #51 { %[ "ABAB" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_51

	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,192
;; rsp=0 , %304~2'(= a3◂ [ r] ) %303~1'(= r ) %302~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r9
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	call LB_294
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_295
LB_294:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_298+8*rax]
LB_298: dq LB_296,LB_297
LB_296:
	mov rdi,LB_300
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_299
LB_297:
	mov rdi,LB_301
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_299
LB_299:
	ret
LB_295:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #52 { %[ "sY" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_52

	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %308~2'(= a3◂ [ r] ) %307~1'(= r ) %306~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r9
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	call LB_302
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_303
LB_302:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_306+8*rax]
LB_306: dq LB_304,LB_305
LB_304:
	mov rdi,LB_308
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_307
LB_305:
	mov rdi,LB_309
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_307
LB_307:
	ret
LB_303:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #53 { %[ "AB" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_53

	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %312~2'(= a3◂ [ r] ) %311~1'(= r ) %310~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r9
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	call LB_310
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_311
LB_310:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_314+8*rax]
LB_314: dq LB_312,LB_313
LB_312:
	mov rdi,LB_316
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_315
LB_313:
	mov rdi,LB_317
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_315
LB_315:
	ret
LB_311:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #53 { %[ "ACACe" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_53

	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %316~2'(= a3◂ [ r] ) %315~1'(= r ) %314~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r9
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	call LB_318
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_319
LB_318:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_322+8*rax]
LB_322: dq LB_320,LB_321
LB_320:
	mov rdi,LB_324
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_323
LB_321:
	mov rdi,LB_325
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_323
LB_323:
	ret
LB_319:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #54 { %[ " a bc d" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
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
	call ETR_54

	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %320~2'(= a3◂ [ r] ) %319~1'(= r ) %318~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r9
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	call LB_326
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_327
LB_326:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_330+8*rax]
LB_330: dq LB_328,LB_329
LB_328:
	mov rdi,LB_332
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_331
LB_329:
	mov rdi,LB_333
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_331
LB_331:
	ret
LB_327:
; .dlt.ptn { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	mov rdi,r9
	call free_s8 
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; _#10 %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_334
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_335
LB_335:
; .dlt.ptn %[ "dd\t\n\"J  " ]
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_6
ETR_55: ; f2 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
;; rsp=0 , %323~0'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %324~0'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %325~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
RTM_6:
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
	lea rsi,[LB_336+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_337+2-1]
	mov rcx,2
	rep movsb
	lea rsi,[LB_338+7-1]
	mov rcx,7
	rep movsb
	lea rsi,[LB_339+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %326~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_340
LB_340:
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	call free_s8 
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #55 %[ 3r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 %[ 3r ] ⊢ 0'(= r )
; .mov_ptn %[ 3r ] ⊢ 0'(= r )
	mov rax,3
	mov r13,rax
	call ETR_55

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %328~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %330~2'(= {| l |} ) %329~1'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 { 1'(= r ) 2'(= {| l |} ) } ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r8
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_341
LB_341:
; .dlt.ptn { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r8
	call free_s8 
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_7
ETR_56: ; f0 { } ⊢ { } : ({ }→{ })
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
	lea rsi,[LB_342+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_343+2-1]
	mov rcx,2
	rep movsb
	lea rsi,[LB_344+7-1]
	mov rcx,7
	rep movsb
	lea rsi,[LB_345+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %332~0'(= {| l |} ) 
; _#10 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r13
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_346
LB_346:
;; rsp=0 , %333~0'(= {| l |} ) 
	jmp LB_347
LB_347:
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %334~%[ 3r ] %333~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	add rdi,77
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_348+1-1]
	mov rcx,1
	rep movsb
	mov rax,3
LB_350:
	cmp rax,0
	jz LB_351
	sub rax,1
	lea rsi,[LB_349+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_350
LB_351:
	mov rax,17
LB_353:
	cmp rax,0
	jz LB_354
	sub rax,1
	lea rsi,[LB_352+4-1]
	mov rcx,4
	rep movsb 
	jmp LB_353
LB_354:
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	lea rsi,[LB_355+2-1]
	mov rcx,2
	rep movsb
	lea rsi,[LB_356+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %338~1'(= {| l |} ) %337~%[ 17r ] %336~%[ 3r ] %335~0'(= {| l |} ) 
; _#10 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_357
LB_357:
;; rsp=0 , %339~1'(= {| l |} ) %337~%[ 17r ] %336~%[ 3r ] %335~0'(= {| l |} ) 
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
ETR_57: ; f1 0'(= r ) ⊢ { 0'(= r ) 1'(= r ) } : (_r64→{ _r64 _r64 })
;; rsp=0 , %340~0'(= r ) 
; #13 { 0'(= r ) %[ 3r ] } ⊢|
	add r13,3
; .mov_ptn2 { 0'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; .mov_ptn %[ 3r ] ⊢ 1'(= r )
	mov rax,3
	mov r14,rax
	ret
RTM_7:
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
	jz LB_359
	mov r9,rdi
	jmp LB_360
LB_360:
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
LB_358:
	mov rsi,r14
	mov rax,r8
	mov rdi,r9
	mov QWORD [rsi+8*rdi],rax 
	cmp rdi,1 
	jz LB_359
	sub rdi,1 
	mov r9,rdi
	mov rdi,rax
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov r8,rax
	jmp LB_358
LB_359:
; .dlt.ptn %[ "Fu" ]
; .dlt.ptn %[ 7r ]
;; rsp=0 , %343~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; _#10 1'(= {| {| l |}|} ) ⊢ 1'(= {| {| l |}|} )
	mov rdi,fmt_emt
	call emt_stg
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,[r8]
	mov rax,0 
LB_361:
	cmp rsi,rax 
	jz LB_362
	push r8 
	push rax 
	push rsi 
	mov r8,QWORD [r8+8+8*rax]
	mov rdi,r8
	call emt_s8
	mov rdi,fmt_spc 
	call emt_stg 
	pop rsi 
	pop rax 
	pop r8 
	add rax,1 
	jmp LB_361
LB_362:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_363
LB_363:
;; rsp=0 , %344~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
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
;; rsp=0 , %345~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #57 %[ 8r ] ⊢ { 3'(= r ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 %[ 8r ] ⊢ 0'(= r )
; .mov_ptn %[ 8r ] ⊢ 0'(= r )
	mov rax,8
	mov r13,rax
	call ETR_57

	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,16
;; rsp=0 , %349~2'(= r ) %348~3'(= r ) %345~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; _#4 { 1'(= {| {| l |}|} ) %[ 3r ] } ⊢ { 1'(= {| {| l |}|} ) %[ 3r ] 5'(= {| l |} ) }
	mov rax,3
	mov rdi,r14
	mov rdi,[rdi+8+8*rax]
	jmp LB_364
LB_364:
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
;; rsp=0 , %352~5'(= {| l |} ) %350~1'(= {| {| l |}|} ) %349~2'(= r ) %348~3'(= r ) %0~0'(= {| {| l |}|} ) 
; _#10 { 1'(= {| {| l |}|} ) 5'(= {| l |} ) } ⊢ { 1'(= {| {| l |}|} ) 5'(= {| l |} ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rax,r14
	C_PUSH_REGS
	mov r8,rax
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,[r8]
	mov rax,0 
LB_365:
	cmp rsi,rax 
	jz LB_366
	push r8 
	push rax 
	push rsi 
	mov r8,QWORD [r8+8+8*rax]
	mov rdi,r8
	call emt_s8
	mov rdi,fmt_spc 
	call emt_stg 
	pop rsi 
	pop rax 
	pop r8 
	add rax,1 
	jmp LB_365
LB_366:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rax,r11
	C_PUSH_REGS
	mov r8,rax
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_367
LB_367:
; .dlt.ptn 5'(= {| l |} )
	mov rdi,r11
	call free_s8 
;; rsp=0 , %353~1'(= {| {| l |}|} ) %349~2'(= r ) %348~3'(= r ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_8
RTM_8:
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
