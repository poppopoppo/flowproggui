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
ETR_30:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_30
	ret
GRM_30:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3
	jmp LB_4
LB_3:
	mov r8,unt_1
	jmp LB_1
LB_4:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_5
	jmp LB_6
LB_5:
	mov r8,unt_1
	jmp LB_1
LB_6:
	add r14,1
	jmp LB_2
LB_1:
	lea rsp,[rsp+8*0]
	jmp LB_0
LB_2:
	call GRM_30
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_9
	jmp LB_10
LB_9:
	jmp LB_7
LB_10:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_8
LB_7:
	lea rsp,[rsp+8*0]
	jmp LB_0
LB_8:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_12
LB_12
;; rsp=1 , %3~1'(= r ) %2~0'(= r ) %1~8'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=1 , %4~0(<2)◂%[ 0r ] %3~1'(= r ) %2~0'(= r ) %1~8'(= r ) 
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
	jmp LB_11
LB_11:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_0
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_0:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_16
	jmp LB_17
LB_16:
	mov r8,unt_1
	jmp LB_14
LB_17:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_18
	jmp LB_19
LB_18:
	mov r8,unt_1
	jmp LB_14
LB_19:
	add r14,1
	jmp LB_15
LB_14:
	lea rsp,[rsp+8*0]
	jmp LB_13
LB_15:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_21
LB_21
;; rsp=0 , %6~1'(= r ) %5~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %7~0(<2)◂%[ 1r ] %6~1'(= r ) %5~0'(= r ) 
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
	jmp LB_20
LB_20:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_13
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_13:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_31:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_31
	ret
GRM_31:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_25
	jmp LB_26
LB_25:
	mov r8,unt_1
	jmp LB_23
LB_26:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_27
	jmp LB_28
LB_27:
	mov r8,unt_1
	jmp LB_23
LB_28:
	add r14,1
	jmp LB_24
LB_23:
	lea rsp,[rsp+8*0]
	jmp LB_22
LB_24:
	call GRM_30
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_31
	jmp LB_32
LB_31:
	jmp LB_29
LB_32:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_30
LB_29:
	lea rsp,[rsp+8*0]
	jmp LB_22
LB_30:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_34
LB_34
;; rsp=1 , %10~1'(= r ) %9~0'(= r ) %8~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %11~0(<2)◂8'(= r ) %10~1'(= r ) %9~0'(= r ) 
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
	jmp LB_33
LB_33:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_22
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_22:
	call GRM_30
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_38
	jmp LB_39
LB_38:
	jmp LB_36
LB_39:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_37
LB_36:
	lea rsp,[rsp+8*0]
	jmp LB_35
LB_37:
	call GRM_30
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_42
	jmp LB_43
LB_42:
	jmp LB_40
LB_43:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_41
LB_40:
	lea rsp,[rsp+8*1]
	jmp LB_35
LB_41:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_45
LB_45
;; rsp=2 , %15~1'(= r ) %14~0'(= r ) %13~9'(= r ) %12~8'(= r ) 
; _#13 { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %17~9'(= r ) %16~8'(= r ) %15~1'(= r ) %14~0'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=2 , %18~0(<2)◂8'(= r ) %17~9'(= r ) %15~1'(= r ) %14~0'(= r ) 
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
	jmp LB_44
LB_44:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_35
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_35:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_32:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_32
	ret
GRM_32:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_49
	jmp LB_50
LB_49:
	mov r8,unt_1
	jmp LB_47
LB_50:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
	jnz LB_51
	jmp LB_52
LB_51:
	mov r8,unt_1
	jmp LB_47
LB_52:
	add r14,1
	jmp LB_48
LB_47:
	lea rsp,[rsp+8*0]
	jmp LB_46
LB_48:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_55
	jmp LB_56
LB_55:
	mov r8,unt_1
	jmp LB_53
LB_56:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
	jnz LB_57
	jmp LB_58
LB_57:
	mov r8,unt_1
	jmp LB_53
LB_58:
	add r14,1
	jmp LB_54
LB_53:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_54:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_60
LB_60
;; rsp=0 , %20~1'(= r ) %19~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %21~0(<2)◂%[ 0r ] %20~1'(= r ) %19~0'(= r ) 
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
	jmp LB_59
LB_59:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_46
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_46:
	cmp r14,r9
	jge LB_64
	jmp LB_65
LB_64:
	mov r8,unt_1 
	jmp LB_62
LB_65:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_63
LB_62:
	lea rsp,[rsp+8*0]
	jmp LB_61
LB_63:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_68
	jmp LB_69
LB_68:
	mov r8,unt_1
	jmp LB_66
LB_69:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_70
	jmp LB_71
LB_70:
	mov r8,unt_1
	jmp LB_66
LB_71:
	add r14,1
	jmp LB_67
LB_66:
	lea rsp,[rsp+8*1]
	jmp LB_61
LB_67:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_73
LB_73
;; rsp=1 , %24~1'(= r ) %23~0'(= r ) %22~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %25~0(<2)◂8'(= r ) %24~1'(= r ) %23~0'(= r ) 
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
	jmp LB_72
LB_72:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_61
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_61:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_33:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_33
	ret
GRM_33:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_77
	jmp LB_78
LB_77:
	mov r8,unt_1
	jmp LB_75
LB_78:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_79
	jmp LB_80
LB_79:
	mov r8,unt_1
	jmp LB_75
LB_80:
	add r14,1
	jmp LB_76
LB_75:
	lea rsp,[rsp+8*0]
	jmp LB_74
LB_76:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_85
	jmp LB_86
LB_85:
	mov r8,unt_1
	jmp LB_83
LB_86:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_87
	jmp LB_88
LB_87:
	mov r8,unt_1
	jmp LB_83
LB_88:
	add r14,1
	jmp LB_84
LB_83:
	lea rsp,[rsp+8*0]
	jmp LB_82
LB_84:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_90
LB_90
;; rsp=0 , %29~1'(= r ) %28~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %30~0(<2)◂%[ 0r ] %29~1'(= r ) %28~0'(= r ) 
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
	jmp LB_89
LB_89:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_82
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_81
LB_82:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_94
	jmp LB_95
LB_94:
	mov r8,unt_1
	jmp LB_92
LB_95:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_96
	jmp LB_97
LB_96:
	mov r8,unt_1
	jmp LB_92
LB_97:
	add r14,1
	jmp LB_93
LB_92:
	lea rsp,[rsp+8*0]
	jmp LB_91
LB_93:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_102
	jmp LB_103
LB_102:
	mov r8,unt_1
	jmp LB_100
LB_103:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_104
	jmp LB_105
LB_104:
	mov r8,unt_1
	jmp LB_100
LB_105:
	add r14,1
	jmp LB_101
LB_100:
	lea rsp,[rsp+8*0]
	jmp LB_99
LB_101:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_107
LB_107
;; rsp=0 , %34~1'(= r ) %33~0'(= r ) 
; #22 %[ 3r ] ⊢ 0(<2)◂%[ 3r ]
;; rsp=0 , %35~0(<2)◂%[ 3r ] %34~1'(= r ) %33~0'(= r ) 
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
	jmp LB_106
LB_106:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_99
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_98
LB_99:
	call GRM_33
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_111
	jmp LB_112
LB_111:
	jmp LB_109
LB_112:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_110
LB_109:
	lea rsp,[rsp+8*0]
	jmp LB_108
LB_110:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_114
LB_114
;; rsp=1 , %38~1'(= r ) %37~0'(= r ) %36~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %39~0(<2)◂8'(= r ) %38~1'(= r ) %37~0'(= r ) 
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
	jmp LB_113
LB_113:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_108
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_98
LB_108:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_98
LB_98:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_115
	jmp LB_116
LB_115:
	lea rsp,[rsp+8*0]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	jmp LB_81
LB_116:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_118
LB_118
;; rsp=0 , %40~3'(= r ) %32~1'(= r ) %31~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %41~0(<2)◂%[ 1r ] %40~3'(= r ) %32~1'(= r ) %31~0'(= r ) 
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
	jmp LB_117
LB_117:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_91
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_81
LB_91:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_81
LB_81:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_119
	jmp LB_120
LB_119:
	lea rsp,[rsp+8*0]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_120:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 3'(= r )
	mov r10,r9
; .mov_ptn 2'(= r ) ⊢ 3'(= r )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_122
LB_122
;; rsp=0 , %42~3'(= r ) %27~1'(= r ) %26~0'(= r ) 
; #22 3'(= r ) ⊢ 0(<2)◂3'(= r )
;; rsp=0 , %43~0(<2)◂3'(= r ) %27~1'(= r ) %26~0'(= r ) 
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
	jmp LB_121
LB_121:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_74
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_74:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_126
	jmp LB_127
LB_126:
	mov r8,unt_1
	jmp LB_124
LB_127:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
	jnz LB_128
	jmp LB_129
LB_128:
	mov r8,unt_1
	jmp LB_124
LB_129:
	add r14,1
	jmp LB_125
LB_124:
	lea rsp,[rsp+8*0]
	jmp LB_123
LB_125:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_131
LB_131
;; rsp=0 , %45~1'(= r ) %44~0'(= r ) 
; #22 %[ 2r ] ⊢ 0(<2)◂%[ 2r ]
;; rsp=0 , %46~0(<2)◂%[ 2r ] %45~1'(= r ) %44~0'(= r ) 
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
	jmp LB_130
LB_130:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_123
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_123:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_34:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_34
	ret
GRM_34:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_134
LB_133:
	add r14,1 
LB_134:
	cmp r14,r9
	jge LB_135
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_133
	cmp rax,32 
	jz LB_133
LB_135
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_138
	jmp LB_139
LB_138:
	mov r8,unt_1
	jmp LB_136
LB_139:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],97
	jnz LB_140
	jmp LB_141
LB_140:
	mov r8,unt_1
	jmp LB_136
LB_141:
	add r14,1
	jmp LB_137
LB_136:
	lea rsp,[rsp+8*0]
	jmp LB_132
LB_137:
	jmp LB_143
LB_142:
	add r14,1 
LB_143:
	cmp r14,r9
	jge LB_144
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_142
	cmp rax,32 
	jz LB_142
LB_144
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_147
	jmp LB_148
LB_147:
	mov r8,unt_1
	jmp LB_145
LB_148:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_149
	jmp LB_150
LB_149:
	mov r8,unt_1
	jmp LB_145
LB_150:
	add r14,1
	jmp LB_146
LB_145:
	lea rsp,[rsp+8*0]
	jmp LB_132
LB_146:
	jmp LB_152
LB_151:
	add r14,1 
LB_152:
	cmp r14,r9
	jge LB_153
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_151
	cmp rax,32 
	jz LB_151
LB_153
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_156
	jmp LB_157
LB_156:
	mov r8,unt_1
	jmp LB_154
LB_157:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_158
	jmp LB_159
LB_158:
	mov r8,unt_1
	jmp LB_154
LB_159:
	add r14,1
	jmp LB_155
LB_154:
	lea rsp,[rsp+8*0]
	jmp LB_132
LB_155:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_161
LB_161
;; rsp=0 , %48~1'(= r ) %47~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %49~0(<2)◂%[ 0r ] %48~1'(= r ) %47~0'(= r ) 
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
	jmp LB_160
LB_160:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_132
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_132:
	jmp LB_164
LB_163:
	add r14,1 
LB_164:
	cmp r14,r9
	jge LB_165
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_163
	cmp rax,10 
	jz LB_163
	cmp rax,32 
	jz LB_163
LB_165
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_168
	jmp LB_169
LB_168:
	mov r8,unt_1
	jmp LB_166
LB_169:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_170
	jmp LB_171
LB_170:
	mov r8,unt_1
	jmp LB_166
LB_171:
	add r14,1
	jmp LB_167
LB_166:
	lea rsp,[rsp+8*0]
	jmp LB_162
LB_167:
	jmp LB_173
LB_172:
	add r14,1 
LB_173:
	cmp r14,r9
	jge LB_174
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_172
	cmp rax,10 
	jz LB_172
	cmp rax,32 
	jz LB_172
LB_174
	call GRM_34
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_177
	jmp LB_178
LB_177:
	jmp LB_175
LB_178:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_176
LB_175:
	lea rsp,[rsp+8*0]
	jmp LB_162
LB_176:
	jmp LB_180
LB_179:
	add r14,1 
LB_180:
	cmp r14,r9
	jge LB_181
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_179
	cmp rax,10 
	jz LB_179
	cmp rax,32 
	jz LB_179
LB_181
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_184
	jmp LB_185
LB_184:
	mov r8,unt_1
	jmp LB_182
LB_185:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],122
	jnz LB_186
	jmp LB_187
LB_186:
	mov r8,unt_1
	jmp LB_182
LB_187:
	add r14,1
	jmp LB_183
LB_182:
	lea rsp,[rsp+8*1]
	jmp LB_162
LB_183:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_189
LB_189
;; rsp=1 , %52~1'(= r ) %51~0'(= r ) %50~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %53~0(<2)◂8'(= r ) %52~1'(= r ) %51~0'(= r ) 
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
	jmp LB_188
LB_188:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_162
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_162:
	call GRM_34
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_193
	jmp LB_194
LB_193:
	jmp LB_191
LB_194:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_192
LB_191:
	lea rsp,[rsp+8*0]
	jmp LB_190
LB_192:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_197
	jmp LB_198
LB_197:
	mov r8,unt_1
	jmp LB_195
LB_198:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_199
	jmp LB_200
LB_199:
	mov r8,unt_1
	jmp LB_195
LB_200:
	add r14,1
	jmp LB_196
LB_195:
	lea rsp,[rsp+8*1]
	jmp LB_190
LB_196:
	call GRM_33
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_203
	jmp LB_204
LB_203:
	jmp LB_201
LB_204:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_202
LB_201:
	lea rsp,[rsp+8*1]
	jmp LB_190
LB_202:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_206
LB_206
;; rsp=2 , %57~1'(= r ) %56~0'(= r ) %55~9'(= r ) %54~8'(= r ) 
; #22 9'(= r ) ⊢ 0(<2)◂9'(= r )
;; rsp=2 , %58~0(<2)◂9'(= r ) %57~1'(= r ) %56~0'(= r ) %54~8'(= r ) 
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
	jmp LB_205
LB_205:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_190
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_190:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #31 { %[ "ABAB" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { %[ "ABAB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "ABAB" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov QWORD [rax],4
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],66
	mov r13,rax
	call ETR_31

	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	add rsp,8
;; rsp=0 , %61~2'(= a3◂ [ r] ) %60~1'(= r ) %59~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	jmp LB_208
LB_207: db 95,101,109,116,58,0
LB_208:
	mov rdi,LB_207
	call emt_stg
	jmp LB_210
LB_209: db 123,32,0
LB_210:
	mov rdi,LB_209
	call emt_stg
	mov rax,r9
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
	jmp LB_212
LB_211: db 32,0
LB_212:
	mov rdi,LB_211
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
	xor rax,rax  
	mov rdi,fmt_r64
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
	jmp LB_214
LB_213: db 32,0
LB_214:
	mov rdi,LB_213
	call emt_stg
	mov rax,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_215
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_217
LB_216: db 32,0
LB_217:
	mov rdi,LB_216
	call emt_stg
	jmp LB_219
LB_218: db 125,32,0
LB_219:
	mov rdi,LB_218
	call emt_stg
	jmp LB_221
LB_220: db 10,0
LB_221:
	mov rdi,LB_220
	call emt_stg
	jmp LB_222
LB_215:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_225+8*rax]
LB_225: dq LB_223,LB_224
LB_223:
	jmp LB_228
LB_227: db 39,48,226,151,130,0
LB_228:
	mov rdi,LB_227
	call emt_stg
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_226
LB_224:
	jmp LB_230
LB_229: db 39,49,226,151,130,0
LB_230:
	mov rdi,LB_229
	call emt_stg
	jmp LB_232
LB_231: db 42,123,32,0
LB_232:
	mov rdi,LB_231
	call emt_stg
	jmp LB_234
LB_233: db 125,32,0
LB_234:
	mov rdi,LB_233
	call emt_stg
	jmp LB_226
LB_226:
	ret
LB_222:
;; rsp=0 , %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #32 { %[ "sY" ] %[ 0r ] } ⊢ { 6'(= {| l |} ) 5'(= r ) 4'(= a3◂ [ r] ) }
	sub rsp,32
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
; .mov_ptn2 { %[ "sY" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "sY" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov QWORD [rax],2
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],115
	mov BYTE [rax+8+1],89
	mov r13,rax
	call ETR_32

	mov r9,QWORD [rsp-8+8*4]
	mov rax,QWORD [rsp-8+8*3]
	mov r10,r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov r11,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov rcx,r13
	mov r13,rax
	add rsp,32
;; rsp=0 , %67~4'(= a3◂ [ r] ) %66~5'(= r ) %65~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 6'(= {| l |} ) 5'(= r ) 4'(= a3◂ [ r] ) } ⊢ { 6'(= {| l |} ) 5'(= r ) 4'(= a3◂ [ r] ) }
	jmp LB_236
LB_235: db 95,101,109,116,58,0
LB_236:
	mov rdi,LB_235
	call emt_stg
	jmp LB_238
LB_237: db 123,32,0
LB_238:
	mov rdi,LB_237
	call emt_stg
	mov rax,rcx
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
	jmp LB_240
LB_239: db 32,0
LB_240:
	mov rdi,LB_239
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
	xor rax,rax  
	mov rdi,fmt_r64
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
	jmp LB_242
LB_241: db 32,0
LB_242:
	mov rdi,LB_241
	call emt_stg
	mov rax,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_243
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_245
LB_244: db 32,0
LB_245:
	mov rdi,LB_244
	call emt_stg
	jmp LB_247
LB_246: db 125,32,0
LB_247:
	mov rdi,LB_246
	call emt_stg
	jmp LB_249
LB_248: db 10,0
LB_249:
	mov rdi,LB_248
	call emt_stg
	jmp LB_250
LB_243:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_253+8*rax]
LB_253: dq LB_251,LB_252
LB_251:
	jmp LB_256
LB_255: db 39,48,226,151,130,0
LB_256:
	mov rdi,LB_255
	call emt_stg
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_254
LB_252:
	jmp LB_258
LB_257: db 39,49,226,151,130,0
LB_258:
	mov rdi,LB_257
	call emt_stg
	jmp LB_260
LB_259: db 42,123,32,0
LB_260:
	mov rdi,LB_259
	call emt_stg
	jmp LB_262
LB_261: db 125,32,0
LB_262:
	mov rdi,LB_261
	call emt_stg
	jmp LB_254
LB_254:
	ret
LB_250:
;; rsp=0 , %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #33 { %[ "AB" ] %[ 0r ] } ⊢ { 9'(= {| l |} ) 8'(= r ) 7'(= a3◂ [ r] ) }
	sub rsp,56
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
; .mov_ptn2 { %[ "AB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "AB" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov QWORD [rax],2
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov r13,rax
	call ETR_33

	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov rax,QWORD [rsp-8+8*3]
	mov rdx,r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*7],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
	add rsp,40
;; rsp=2 , %73~7'(= a3◂ [ r] ) %72~8'(= r ) %71~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 9'(= {| l |} ) 8'(= r ) 7'(= a3◂ [ r] ) } ⊢ { 9'(= {| l |} ) 8'(= r ) 7'(= a3◂ [ r] ) }
	jmp LB_264
LB_263: db 95,101,109,116,58,0
LB_264:
	mov rdi,LB_263
	call emt_stg
	jmp LB_266
LB_265: db 123,32,0
LB_266:
	mov rdi,LB_265
	call emt_stg
	mov rax,QWORD [rsp-8+8*1]
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
	jmp LB_268
LB_267: db 32,0
LB_268:
	mov rdi,LB_267
	call emt_stg
	mov rax,QWORD [rsp-8+8*2]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
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
	jmp LB_270
LB_269: db 32,0
LB_270:
	mov rdi,LB_269
	call emt_stg
	mov rax,rdx
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_271
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_273
LB_272: db 32,0
LB_273:
	mov rdi,LB_272
	call emt_stg
	jmp LB_275
LB_274: db 125,32,0
LB_275:
	mov rdi,LB_274
	call emt_stg
	jmp LB_277
LB_276: db 10,0
LB_277:
	mov rdi,LB_276
	call emt_stg
	jmp LB_278
LB_271:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_281+8*rax]
LB_281: dq LB_279,LB_280
LB_279:
	jmp LB_284
LB_283: db 39,48,226,151,130,0
LB_284:
	mov rdi,LB_283
	call emt_stg
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_282
LB_280:
	jmp LB_286
LB_285: db 39,49,226,151,130,0
LB_286:
	mov rdi,LB_285
	call emt_stg
	jmp LB_288
LB_287: db 42,123,32,0
LB_288:
	mov rdi,LB_287
	call emt_stg
	jmp LB_290
LB_289: db 125,32,0
LB_290:
	mov rdi,LB_289
	call emt_stg
	jmp LB_282
LB_282:
	ret
LB_278:
;; rsp=2 , %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #33 { %[ "ACACe" ] %[ 0r ] } ⊢ { 12'(= {| l |} ) 11'(= r ) 10'(= a3◂ [ r] ) }
	sub rsp,64
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 { %[ "ACACe" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ "ACACe" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov QWORD [rax],5
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],67
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],67
	mov BYTE [rax+8+4],101
	mov r13,rax
	call ETR_33

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
;; rsp=5 , %79~10'(= a3◂ [ r] ) %78~11'(= r ) %77~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 12'(= {| l |} ) 11'(= r ) 10'(= a3◂ [ r] ) } ⊢ { 12'(= {| l |} ) 11'(= r ) 10'(= a3◂ [ r] ) }
	jmp LB_292
LB_291: db 95,101,109,116,58,0
LB_292:
	mov rdi,LB_291
	call emt_stg
	jmp LB_294
LB_293: db 123,32,0
LB_294:
	mov rdi,LB_293
	call emt_stg
	mov rax,QWORD [rsp-8+8*1]
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
	jmp LB_296
LB_295: db 32,0
LB_296:
	mov rdi,LB_295
	call emt_stg
	mov rax,QWORD [rsp-8+8*2]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
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
	jmp LB_298
LB_297: db 32,0
LB_298:
	mov rdi,LB_297
	call emt_stg
	mov rax,QWORD [rsp-8+8*3]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_299
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_301
LB_300: db 32,0
LB_301:
	mov rdi,LB_300
	call emt_stg
	jmp LB_303
LB_302: db 125,32,0
LB_303:
	mov rdi,LB_302
	call emt_stg
	jmp LB_305
LB_304: db 10,0
LB_305:
	mov rdi,LB_304
	call emt_stg
	jmp LB_306
LB_299:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_309+8*rax]
LB_309: dq LB_307,LB_308
LB_307:
	jmp LB_312
LB_311: db 39,48,226,151,130,0
LB_312:
	mov rdi,LB_311
	call emt_stg
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_310
LB_308:
	jmp LB_314
LB_313: db 39,49,226,151,130,0
LB_314:
	mov rdi,LB_313
	call emt_stg
	jmp LB_316
LB_315: db 42,123,32,0
LB_316:
	mov rdi,LB_315
	call emt_stg
	jmp LB_318
LB_317: db 125,32,0
LB_318:
	mov rdi,LB_317
	call emt_stg
	jmp LB_310
LB_310:
	ret
LB_306:
;; rsp=5 , %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #34 { %[ " a bc d" ] %[ 0r ] } ⊢ { 15'(= {| l |} ) 14'(= r ) 13'(= a3◂ [ r] ) }
	sub rsp,64
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 { %[ " a bc d" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn %[ " a bc d" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov QWORD [rax],7
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],32
	mov BYTE [rax+8+1],97
	mov BYTE [rax+8+2],32
	mov BYTE [rax+8+3],98
	mov BYTE [rax+8+4],99
	mov BYTE [rax+8+5],32
	mov BYTE [rax+8+6],100
	mov r13,rax
	call ETR_34

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
;; rsp=8 , %85~13'(= a3◂ [ r] ) %84~14'(= r ) %83~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 { 15'(= {| l |} ) 14'(= r ) 13'(= a3◂ [ r] ) } ⊢ { 15'(= {| l |} ) 14'(= r ) 13'(= a3◂ [ r] ) }
	jmp LB_320
LB_319: db 95,101,109,116,58,0
LB_320:
	mov rdi,LB_319
	call emt_stg
	jmp LB_322
LB_321: db 123,32,0
LB_322:
	mov rdi,LB_321
	call emt_stg
	mov rax,QWORD [rsp-8+8*1]
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
	jmp LB_324
LB_323: db 32,0
LB_324:
	mov rdi,LB_323
	call emt_stg
	mov rax,QWORD [rsp-8+8*2]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
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
	jmp LB_326
LB_325: db 32,0
LB_326:
	mov rdi,LB_325
	call emt_stg
	mov rax,QWORD [rsp-8+8*3]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_327
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_329
LB_328: db 32,0
LB_329:
	mov rdi,LB_328
	call emt_stg
	jmp LB_331
LB_330: db 125,32,0
LB_331:
	mov rdi,LB_330
	call emt_stg
	jmp LB_333
LB_332: db 10,0
LB_333:
	mov rdi,LB_332
	call emt_stg
	jmp LB_334
LB_327:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_337+8*rax]
LB_337: dq LB_335,LB_336
LB_335:
	jmp LB_340
LB_339: db 39,48,226,151,130,0
LB_340:
	mov rdi,LB_339
	call emt_stg
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_338
LB_336:
	jmp LB_342
LB_341: db 39,49,226,151,130,0
LB_342:
	mov rdi,LB_341
	call emt_stg
	jmp LB_344
LB_343: db 42,123,32,0
LB_344:
	mov rdi,LB_343
	call emt_stg
	jmp LB_346
LB_345: db 125,32,0
LB_346:
	mov rdi,LB_345
	call emt_stg
	jmp LB_338
LB_338:
	ret
LB_334:
;; rsp=8 , %88~13'(= a3◂ [ r] ) %87~14'(= r ) %86~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	jmp LB_348
LB_347: db 95,101,109,116,58,0
LB_348:
	mov rdi,LB_347
	call emt_stg
	jmp LB_350
LB_349: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_350:
	mov rdi,LB_349
	call emt_stg
	jmp LB_352
LB_351: db 10,0
LB_352:
	mov rdi,LB_351
	call emt_stg
	jmp LB_353
LB_353:
;; rsp=8 , %89~%[ "dd\t\n\"J  " ] %88~13'(= a3◂ [ r] ) %87~14'(= r ) %86~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
ETR_35: ; f2 0'(= r ) ⊢ 0'(= r ) : (_r64→_r64)
	add rsp,8
;; rsp=0 , %90~0'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %91~0'(= r ) 
; _#11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %92~0'(= r ) 
; ∎ 0'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
RTM_1:
;; rsp=8 , %89~%[ "dd\t\n\"J  " ] %88~13'(= a3◂ [ r] ) %87~14'(= r ) %86~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; .. //
	sub rsp,8
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
	mov QWORD [rsp-8+8*1],rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_354
	LB_355: db 10,0
LB_354:
	lea rsi,[LB_355+1-1]
	mov rcx,1
	rep movsb
	jmp LB_356
	LB_357: db 33,33,0
LB_356:
	lea rsi,[LB_357+2-1]
	mov rcx,2
	rep movsb
	jmp LB_358
	LB_359: db 32,87,111,114,108,100,32,0
LB_358:
	lea rsi,[LB_359+7-1]
	mov rcx,7
	rep movsb
	jmp LB_360
	LB_361: db 72,101,108,108,111,32,0
LB_360:
	lea rsi,[LB_361+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=9 , %93~16'(= {| l |} ) %89~%[ "dd\t\n\"J  " ] %88~13'(= a3◂ [ r] ) %87~14'(= r ) %86~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#10 16'(= {| l |} ) ⊢ 16'(= {| l |} )
	jmp LB_363
LB_362: db 95,101,109,116,58,0
LB_363:
	mov rdi,LB_362
	call emt_stg
	mov rax,QWORD [rsp-8+8*1]
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
	jmp LB_365
LB_364: db 10,0
LB_365:
	mov rdi,LB_364
	call emt_stg
	jmp LB_366
LB_366:
;; rsp=9 , %94~16'(= {| l |} ) %89~%[ "dd\t\n\"J  " ] %88~13'(= a3◂ [ r] ) %87~14'(= r ) %86~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #35 %[ 3r ] ⊢ 17'(= r )
	sub rsp,64
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 %[ 3r ] ⊢ 0'(= r )
; .mov_ptn %[ 3r ] ⊢ 0'(= r )
	mov rax,3
	mov r13,rax
	call ETR_35

	mov rdx,QWORD [rsp-8+8*8]
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*8],r13
	mov r13,rax
	add rsp,56
;; rsp=10 , %95~17'(= r ) %94~16'(= {| l |} ) %89~%[ "dd\t\n\"J  " ] %88~13'(= a3◂ [ r] ) %87~14'(= r ) %86~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; _#8 17'(= r ) ⊢ { 17'(= r ) 18'(= {| l |} ) }
	sub rsp,8
	mov rdi,QWORD [rsp-8+8*2]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call mlc_s8
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov QWORD [rsp-8+8*1],rax
;; rsp=11 , %97~18'(= {| l |} ) %96~17'(= r ) %94~16'(= {| l |} ) %89~%[ "dd\t\n\"J  " ] %88~13'(= a3◂ [ r] ) %87~14'(= r ) %86~15'(= {| l |} ) %82~10'(= a3◂ [ r] ) %81~11'(= r ) %80~12'(= {| l |} ) %76~7'(= a3◂ [ r] ) %75~8'(= r ) %74~9'(= {| l |} ) %70~4'(= a3◂ [ r] ) %69~5'(= r ) %68~6'(= {| l |} ) %64~2'(= a3◂ [ r] ) %63~1'(= r ) %62~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_2
RTM_2:
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
