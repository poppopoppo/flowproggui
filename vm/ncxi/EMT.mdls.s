bits 64 
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
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc 
	mov rsp,QWORD [rsp_tmp]
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
	movzx rax,BYTE [rdi+6]
	cmp rax,1
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
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]
	pop rsi 
	mov QWORD [rax],rsi
	ret 

scf_d: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	push rdi
	movzx rdi,BYTE [rdi]
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call isspace
	mov rsp,QWORD [rsp_tmp]
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
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call strtoul
	mov rsp,QWORD [rsp_tmp]
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
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call isspace
	mov rsp,QWORD [rsp_tmp]
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
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call strtoul
	mov rsp,QWORD [rsp_tmp]
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
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc 
	mov rsp,QWORD [rsp_tmp]
	pop QWORD [rax] 
	ret

s8_of_c_stg: 
	push rdi
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	xor rax,rax
	call strlen
	mov rsp,QWORD [rsp_tmp]
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
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
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf 
	xor rax,rax 
	call calloc 
	mov rsp,QWORD [rsp_tmp]
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
ETR_30: ; f0 { } ⊢ { } : ({ }→{ })
;; rsp=0 , 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,16
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_0
	LB_1: db 10,0
LB_0:
	lea rsi,[LB_1+1-1]
	mov rcx,1
	rep movsb
	jmp LB_2
	LB_3: db 33,33,0
LB_2:
	lea rsi,[LB_3+2-1]
	mov rcx,2
	rep movsb
	jmp LB_4
	LB_5: db 32,87,111,114,108,100,32,0
LB_4:
	lea rsi,[LB_5+7-1]
	mov rcx,7
	rep movsb
	jmp LB_6
	LB_7: db 72,101,108,108,111,32,0
LB_6:
	lea rsi,[LB_7+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1~0'(= {| l |} ) 
; _emt 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	jmp LB_9
LB_8: db 95,101,109,116,58,0
LB_9:
	mov rdi,LB_8
	call emt_stg
	mov rax,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
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
	jmp LB_11
LB_10: db 10,0
LB_11:
	mov rdi,LB_10
	call emt_stg
	jmp LB_12
LB_12:
;; rsp=0 , %2~0'(= {| l |} ) 
	jmp LB_13
LB_13:
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %3~%[ 3r ] %2~0'(= {| l |} ) 
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,77
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_14
	LB_15: db 104,0
LB_14:
	lea rsi,[LB_15+1-1]
	mov rcx,1
	rep movsb
	jmp LB_16
	LB_17: db 103,0
LB_16:
	mov rax,3
LB_18:
	lea rsi,[LB_17+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_18
	jmp LB_19
	LB_20: db 89,100,32,112,0
LB_19:
	mov rax,17
LB_21:
	lea rsi,[LB_20+4-1]
	mov rcx,4
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_21
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_22
	LB_23: db 49,55,0
LB_22:
	lea rsi,[LB_23+2-1]
	mov rcx,2
	rep movsb
	jmp LB_24
	LB_25: db 102,111,111,0
LB_24:
	lea rsi,[LB_25+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %7~1'(= {| l |} ) %6~%[ 17r ] %5~%[ 3r ] %4~0'(= {| l |} ) 
; _emt 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	jmp LB_27
LB_26: db 95,101,109,116,58,0
LB_27:
	mov rdi,LB_26
	call emt_stg
	mov rax,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
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
	jmp LB_29
LB_28: db 10,0
LB_29:
	mov rdi,LB_28
	call emt_stg
	jmp LB_30
LB_30:
;; rsp=0 , %8~1'(= {| l |} ) %6~%[ 17r ] %5~%[ 3r ] %4~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn %[ 17r ]
; .dlt.ptn %[ 3r ]
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { } ⊢ { }
	ret
ETR_31: ; f1 0'(= r ) ⊢ { 0'(= r ) 1'(= r ) } : (_r64→{ _r64 _r64 })
;; rsp=0 , %9~0'(= r ) 
; _add { 0'(= r ) %[ 3r ] } ⊢ { 0'(= r ) %[ 3r ] }
	add r13,3
; ∎ { 0'(= r ) %[ 3r ] }
; .mov_ptn2 { 0'(= r ) %[ 3r ] } ⊢ { 0'(= r ) 1'(= r ) }
; .mov_ptn %[ 3r ] ⊢ 1'(= r )
	mov rax,3
	mov r14,rax
	ret
RTM_0:
	push RTM_1
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
	mov rdi,7
	push rdi 
	lea rsi,[8+8*rdi]
	mov rdi,1 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rdi 
	mov r14,rax
	mov QWORD [rax],rdi 
	cmp rdi,0 
	jz LB_32
	mov r9,rdi
	jmp LB_33
LB_33:
; .mov_ptn2 %[ "Fu" ] ⊢ 2'(= {| {| l |}|} )
	mov r10,r8
; .mov_ptn %[ "Fu" ] ⊢ 2'(= {| {| l |}|} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],70
	mov BYTE [rax+8+1],117
	mov r8,rax
LB_31:
	mov rsi,r14
	mov rax,r8
	mov rdi,r9
	mov QWORD [rsi+8*rdi],rax 
	cmp rdi,1 
	jz LB_32
	sub rdi,1 
	mov r9,rdi
	mov rdi,rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	jmp LB_31
LB_32:
; .dlt.ptn %[ "Fu" ]
; .dlt.ptn %[ 7r ]
;; rsp=0 , %12~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; _emt 1'(= {| {| l |}|} ) ⊢ 1'(= {| {| l |}|} )
	jmp LB_35
LB_34: db 95,101,109,116,58,0
LB_35:
	mov rdi,LB_34
	call emt_stg
	mov rax,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	jmp LB_37
LB_36: db 123,124,32,0
LB_37:
	mov rdi,LB_36
	call emt_stg
	mov rsi,[r8]
	mov rax,0 
LB_38:
	cmp rsi,rax 
	jz LB_39
	push r8 
	push rax 
	push rsi 
	mov r8,QWORD [r8+8+8*rax]
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_41
LB_40: db 32,0
LB_41:
	mov rdi,LB_40
	call emt_stg
	pop rsi 
	pop rax 
	pop r8 
	add rax,1 
	jmp LB_38
LB_39:
	jmp LB_43
LB_42: db 124,125,0
LB_43:
	mov rdi,LB_42
	call emt_stg
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_45
LB_44: db 10,0
LB_45:
	mov rdi,LB_44
	call emt_stg
	jmp LB_46
LB_46:
;; rsp=0 , %13~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; .mov_ptn2 %[ "Xo" ] ⊢ 2'(= {| l |} )
	mov r9,r8
; .mov_ptn %[ "Xo" ] ⊢ 2'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn %[ 1r ]
;; rsp=0 , %14~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #31 %[ 8r ] ⊢ { 3'(= r ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 %[ 8r ] ⊢ 0'(= r )
; .mov_ptn %[ 8r ] ⊢ 0'(= r )
	mov rax,8
	mov r13,rax
	call ETR_31

	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,16
;; rsp=0 , %18~2'(= r ) %17~3'(= r ) %14~1'(= {| {| l |}|} ) %0~0'(= {| {| l |}|} ) 
	mov rax,3
	mov rdi,r14
	mov rdi,[rdi+8+8*rax]
	jmp LB_47
LB_47:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
; .mov_ptn2 4'(= {| l |} ) ⊢ 5'(= {| l |} )
	mov rcx,r11
; .mov_ptn 4'(= {| l |} ) ⊢ 5'(= {| l |} )
	mov rax,r10
	mov r11,rax
; .dlt.ptn %[ 3r ]
;; rsp=0 , %21~5'(= {| l |} ) %19~1'(= {| {| l |}|} ) %18~2'(= r ) %17~3'(= r ) %0~0'(= {| {| l |}|} ) 
; _emt { 1'(= {| {| l |}|} ) 5'(= {| l |} ) } ⊢ { 1'(= {| {| l |}|} ) 5'(= {| l |} ) }
	jmp LB_49
LB_48: db 95,101,109,116,58,0
LB_49:
	mov rdi,LB_48
	call emt_stg
	jmp LB_51
LB_50: db 123,32,0
LB_51:
	mov rdi,LB_50
	call emt_stg
	mov rax,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	jmp LB_53
LB_52: db 123,124,32,0
LB_53:
	mov rdi,LB_52
	call emt_stg
	mov rsi,[r8]
	mov rax,0 
LB_54:
	cmp rsi,rax 
	jz LB_55
	push r8 
	push rax 
	push rsi 
	mov r8,QWORD [r8+8+8*rax]
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_57
LB_56: db 32,0
LB_57:
	mov rdi,LB_56
	call emt_stg
	pop rsi 
	pop rax 
	pop r8 
	add rax,1 
	jmp LB_54
LB_55:
	jmp LB_59
LB_58: db 124,125,0
LB_59:
	mov rdi,LB_58
	call emt_stg
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_61
LB_60: db 32,0
LB_61:
	mov rdi,LB_60
	call emt_stg
	mov rax,r11
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
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
	jmp LB_63
LB_62: db 32,0
LB_63:
	mov rdi,LB_62
	call emt_stg
	jmp LB_65
LB_64: db 125,32,0
LB_65:
	mov rdi,LB_64
	call emt_stg
	jmp LB_67
LB_66: db 10,0
LB_67:
	mov rdi,LB_66
	call emt_stg
	jmp LB_68
LB_68:
; .dlt.ptn 5'(= {| l |} )
	mov rdi,r11
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=0 , %22~1'(= {| {| l |}|} ) %18~2'(= r ) %17~3'(= r ) %0~0'(= {| {| l |}|} ) 
; ∎
RTM_1:
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
