%include "HD.s" 
%define RCD_N 32
%define GLV_N 149
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)
 
section .bss
	GLV: resq GLV_N
	SS_LN_N_PT: resq 1 
	PAGE_SIZE: resq 1
	tmp: resq 64
	ret_vct: resq 64
 rsp_tmp: resq 1
	RB: resq 1 

; emt buffer 
	GD_BUF_PT: resq 1 
	GD_BUF_IT: resq 1
	EMT_BUF_OFS: resq 1 
 EMT_BUF: resb EMT_BUF_MAX 
	EMT_BUF_END: resb 1
 
; garbage vector 
	GBG_VCT: resq 252

; exp_s8 
	EXP_S8_VCT: resb 2048

;rep_movsb 
	REP_MOVSB_VCT: resq 4

	SS_LN_TOP: resq 1
	SS_LN_VCT: resq 2*SS_LN_MAX
	SS_LN_BTM: resq 1  

	SS_PT_TOP: resq 1
	SS_PT_VCT: resq 3*SS_MAX
	SS_PT_BTM: resq 1 

	SS_RCD_N: resq (RCD_N+1) 
	SS_RCD_C: resq (RCD_N+1)

	CNC_TOP: resq 64 

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

%define SS_RCD_1_MAX (1<<14)
	BSS_SS_RCD 1,SS_RCD_1_MAX
%define SS_RCD_2_MAX SS_RCD_2_MAX_P 
	BSS_SS_RCD 2,SS_RCD_2_MAX
%define SS_RCD_3_MAX SS_RCD_3_MAX_P 
	BSS_SS_RCD 3,SS_RCD_3_MAX
%define SS_RCD_4_MAX SS_RCD_4_MAX_P  
	BSS_SS_RCD 4,SS_RCD_4_MAX
%define SS_RCD_5_MAX (1<<16)
	BSS_SS_RCD 5,SS_RCD_5_MAX
%define SS_RCD_6_MAX (1<<16)
	BSS_SS_RCD 6,SS_RCD_6_MAX
%define SS_RCD_7_MAX (1<<16)
	BSS_SS_RCD 7,SS_RCD_7_MAX
%define SS_RCD_8_MAX (1<<16)
	BSS_SS_RCD 8,SS_RCD_8_MAX
%define SS_RCD_9_MAX (1<<14)
	BSS_SS_RCD 9,SS_RCD_9_MAX
%define SS_RCD_10_MAX (1<<14)
	BSS_SS_RCD 10,SS_RCD_10_MAX
%define SS_RCD_11_MAX (1<<14)
	BSS_SS_RCD 11,SS_RCD_11_MAX
%define SS_RCD_12_MAX (1<<14)
	BSS_SS_RCD 12,SS_RCD_12_MAX
%define SS_RCD_13_MAX (1<<14)
	BSS_SS_RCD 13,SS_RCD_13_MAX
%define SS_RCD_14_MAX (1<<14)
	BSS_SS_RCD 14,SS_RCD_14_MAX
%define SS_RCD_15_MAX (1<<14)
	BSS_SS_RCD 15,SS_RCD_15_MAX
%define SS_RCD_16_MAX (1<<14)
	BSS_SS_RCD 16,SS_RCD_16_MAX
%define SS_RCD_17_MAX (1<<14)
	BSS_SS_RCD 17,SS_RCD_17_MAX
%define SS_RCD_18_MAX (1<<14)
	BSS_SS_RCD 18,SS_RCD_18_MAX
%define SS_RCD_19_MAX (1<<14)
	BSS_SS_RCD 19,SS_RCD_19_MAX
%define SS_RCD_20_MAX (1<<14)
	BSS_SS_RCD 20,SS_RCD_20_MAX
%define SS_RCD_21_MAX (1<<14)
	BSS_SS_RCD 21,SS_RCD_21_MAX
%define SS_RCD_22_MAX (1<<14)
	BSS_SS_RCD 22,SS_RCD_22_MAX
%define SS_RCD_23_MAX (1<<14)
	BSS_SS_RCD 23,SS_RCD_23_MAX
%define SS_RCD_24_MAX (1<<14)
	BSS_SS_RCD 24,SS_RCD_24_MAX
%define SS_RCD_25_MAX (1<<14)
	BSS_SS_RCD 25,SS_RCD_25_MAX
%define SS_RCD_26_MAX (1<<14)
	BSS_SS_RCD 26,SS_RCD_26_MAX
%define SS_RCD_27_MAX (1<<14)
	BSS_SS_RCD 27,SS_RCD_27_MAX
%define SS_RCD_28_MAX (1<<14)
	BSS_SS_RCD 28,SS_RCD_28_MAX
%define SS_RCD_29_MAX (1<<14)
	BSS_SS_RCD 29,SS_RCD_29_MAX
%define SS_RCD_30_MAX (1<<14)
	BSS_SS_RCD 30,SS_RCD_30_MAX
%define SS_RCD_31_MAX (1<<14)
	BSS_SS_RCD 31,SS_RCD_31_MAX
section .data
	SIG_FLG: dq 0 
	SIG_ETR: dq 0 
	SIG_RIP: dq 0
	GD_BUF_N: dq 0 
	EMT_FLG: dq 0 
	GRM_DT: 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
	err_n: dq 0
 SS_LN_C: dq 0
	S8_N: dq 0 
	
	fmt_err_line: db "err:%llx",10,0
	fmt_r64: db "%dr",0
	fmt_s8: db 34,"%s",34,0
	fmt_d: db "%d",0
	fmt_d_nl: db "%d",10,0
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
	fmt_test0: db "sig segv handled!!:",0
	rt_err0: db "rt_err 0:",10,0 
	emt_bof_msg: db "EMT_BOF:",10,0 
 s8_e: dq 0,0

	fmt_info:
		db "info:",10
		db "S8_N=%d",10
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

LB_2: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_5: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_8: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_11: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_16: db 59,32,226,136,142,124,10,101,120,110,32,52,56,52,58,10,0
LB_18: db 32,58,32,123,32,95,114,54,52,226,151,130,32,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
section .text
	unt_1: dq (1<<48)
	unt_2: dq (2<<48)
	unt_3: dq (3<<48)
	unt_4: dq (4<<48)
	unt_5: dq (5<<48)
	unt_6: dq (6<<48)
	unt_7: dq (7<<48)
	unt_8: dq (8<<48)
	unt_9: dq (9<<48)
	unt_10: dq (10<<48)
	unt_11: dq (11<<48)
	unt_12: dq (12<<48)

global _start
	 
_start:
; set signal handler 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 

; init emt buffer 
	mov rdi,PAGE_SIZE
	C_CALL alc_gd_buf
	mov QWORD [GD_BUF_PT],rax
	mov QWORD [GD_BUF_IT],rax
	mov rax,0 
	mov rdi,fmt_d 
	mov rsi,QWORD [PAGE_SIZE]
	C_CALL printf
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
	mov GLX(127),rbx
 ; exn_root 
	push exn_dft 
	push exn_dft	

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
LB_0: ;; #60◂◂(_some◂.#10) 128'(= r ) ⊢ 0'(= r ) : (_r64◂→_r64◂)
JMP_0:
;; rsp=0 , %0~128'(= r )
; #.#10 128'(= r ) ⊢ 128'(= r )
	sub GLX(128),1
;; rsp=0 , %1~128'(= r )
; #.#9 128'(= r ) ⊢ 128'(= r )
	add GLX(128),1
;; rsp=0 , %2~128'(= r )
; ∎ 128'(= r )
	MOV_RBX GLX(0),GLX(128)
	sub rsp,8
	push QWORD [rsp+8*1]
	ret
LB_3: ;; #62◂◂(_some◂9r) 130'(= r ) ⊢ 0'(= r ) : (_r64◂→_r64◂)
JMP_3:
;; rsp=0 , %0~130'(= r )
; #.#11 { %[ 9r ] 130'(= r ) } ⊢ { 131'(= r ) 130'(= r ) }
	mov rdi,9
	add rdi,GLX(130)
	mov GLX(131),rdi
;; rsp=0 , %2~130'(= r )%1~131'(= r )
; ∎ 131'(= r )
; .dlt.ptn 130'(= r )
	MOV_RBX GLX(0),GLX(131)
	sub rsp,8
	push QWORD [rsp+8*1]
	ret
LB_6: ;; #63◂◂(_none◂{}) 133'(= r ) ⊢ 0'(= r ) : (_r64◂→_r64◂)
JMP_6:
;; rsp=0 , %0~133'(= r )
; #.#13 { 133'(= r ) %[ 9r ] } ⊢ { 133'(= r ) %[ 9r ] }
	mov rdi,GLX(133)
	imul rdi,9
	mov GLX(133),rdi
; .dlt.ptn %[ 9r ]
;; rsp=0 , %1~133'(= r )
; ∎ 133'(= r )
	MOV_RBX GLX(0),GLX(133)
	sub rsp,8
	push QWORD [rsp+8*1]
	ret
LB_9: ;; #64◂◂(_none◂{}) 135'(= r ) ⊢ 0'(= r ) : (_r64◂→_r64◂)
JMP_9:
;; rsp=0 , %0~135'(= r )
; #.#46 135'(= r ) ⊢ 135'(= r )
;; rsp=0 , %6~135'(= r )
; #.#11 { %[ 3r ] 135'(= r ) } ⊢ { 136'(= r ) 135'(= r ) }
	mov rdi,3
	add rdi,GLX(135)
	mov GLX(136),rdi
;; rsp=0 , %8~135'(= r )%7~136'(= r )
; #.#51 135'(= r ) ⊢ { }
;; rsp=0 , %7~136'(= r )
; #.#46 136'(= r ) ⊢ 136'(= r )
;; rsp=0 , %1~136'(= r )
; #.#46 136'(= r ) ⊢ 136'(= r )
;; rsp=0 , %3~136'(= r )
; #.#13 { 136'(= r ) %[ 9r ] } ⊢ { 136'(= r ) %[ 9r ] }
	mov rdi,GLX(136)
	imul rdi,9
	mov GLX(136),rdi
; .dlt.ptn %[ 9r ]
;; rsp=0 , %4~136'(= r )
; #.#46 136'(= r ) ⊢ 136'(= r )
;; rsp=0 , %2~136'(= r )
; ∎ 136'(= r )
	MOV_RBX GLX(0),GLX(136)
	sub rsp,8
	push QWORD [rsp+8*1]
	ret
LB_12: ;; #70◂◂(_some◂→[ 68]) 138'(= a14◂ [..] ) ⊢ { 0'(= r ) { 1'(= {| l |} ) 2'(= r ) } } : (_t14◂{ _r64◂ { _s8◂ _r64◂}}→{ _r64◂ { _s8◂ _r64◂}})
JMP_12:
;; rsp=0 , %0~138'(= a14◂ [..] )
;; ?; 138'(= a14◂ [..] ) ⊢ 0(<2)◂{ 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } }
	mov rdi,GLX(138)
	cmp BYTE [rdi+6],0
	jnz LB_14
	jmp LB_15
LB_14:
	jmp LB_13
LB_15:
	mov rdi,GLX(138)
	MOV_RDI GLX(139), QWORD [rdi+8]
	mov rdi,GLX(138)
	MOV_RDI GLX(140), QWORD [rdi+16]
	mov rdi,GLX(140)
	MOV_RDI GLX(141), QWORD [rdi+8]
	mov rdi,GLX(140)
	MOV_RDI GLX(142), QWORD [rdi+16]
	MOV_RAX QWORD [GBG_VCT+8*0],GLX(138)
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %1~{ 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } }
; #.#46 { 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } } ⊢ { 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } }
;; rsp=0 , %5~{ 141'(= {| l |} ) 142'(= r ) }%4~139'(= r )
; #.#46 { 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } } ⊢ { 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } }
;; rsp=0 , %2~{ 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } }
; ∎ { 139'(= r ) { 141'(= {| l |} ) 142'(= r ) } }
	MOV_RBX GLX(0),GLX(139)
	MOV_RBX GLX(1),GLX(141)
	MOV_RBX GLX(2),GLX(142)
	sub rsp,24
	push QWORD [rsp+8*3]
	ret
LB_13:
;; ?; 138'(= a14◂ [..] ) ⊢ 1(<2)◂143'(= a2◂ [..] )
	mov QWORD [GBG_VCT+8*0],rdi
	MOV_RAX GLX(143),QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , 
	mov rdi,LB_16
	call emt_stg 
	add rsp,8
	pop rdi
	jmp rdi
RTM_0:
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  %[ 0r ] ⊢ 129'(= r )
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_1
	mov GLX(128),0
	call LB_0
	pop rax
	MOV_RBX GLX(129),GLX(0)
	pop rdi
	mov GLX(127),rdi
;; rsp=0 , %1~129'(= r )%0~127'(= {| ? |} )
; ##8 129'(= r ) ⊢ 129'(= r )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(129)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_2,11
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 129'(= r )
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  %[ 2r ] ⊢ 132'(= r )
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_4
	mov GLX(130),2
	call LB_3
	pop rax
	MOV_RBX GLX(132),GLX(0)
	pop rdi
	mov GLX(127),rdi
;; rsp=0 , %3~132'(= r )%0~127'(= {| ? |} )
; ##8 132'(= r ) ⊢ 132'(= r )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_5,11
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 132'(= r )
;; rsp=0 , %0~127'(= {| ? |} )
; ##63 %[ 4r ] ⊢ 134'(= r )
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_7
	mov GLX(133),4
	call LB_6
	pop rax
	MOV_RBX GLX(134),GLX(0)
	pop rdi
	mov GLX(127),rdi
;; rsp=0 , %5~134'(= r )%0~127'(= {| ? |} )
; ##8 134'(= r ) ⊢ 134'(= r )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(134)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_8,11
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 134'(= r )
;; rsp=0 , %0~127'(= {| ? |} )
; ##64 %[ 3r ] ⊢ 137'(= r )
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_10
	mov GLX(135),3
	call LB_9
	pop rax
	MOV_RBX GLX(137),GLX(0)
	pop rdi
	mov GLX(127),rdi
;; rsp=0 , %7~137'(= r )%0~127'(= {| ? |} )
; ##8 137'(= r ) ⊢ 137'(= r )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(137)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_11,11
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; rsp=0 , %8~137'(= r )%0~127'(= {| ? |} )
; # ?  0(<2)◂{ %[ 4r ] { %[ "FEF" ] %[ 99r ] } } ⊢ { 146'(= r ) { 147'(= {| l |} ) 148'(= r ) } }
	lea rsp,[rsp-8*2]
	MOV_RDI QWORD [rsp+8*1],GLX(137)
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_17
	ALC_RCD 2, rax
	mov GLX(138),rax
	mov GLX(144),4
	mov rax,GLX(138)
	MOV_RDI QWORD [rax+8],GLX(144)
	ALC_RCD 2, rax
	mov GLX(144),rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],3
	C_CALL_SF calloc
	mov QWORD [rax],3
	mov BYTE [rax+8+0],70
	mov BYTE [rax+8+1],69
	mov BYTE [rax+8+2],70
	mov GLX(145),rax
	mov rax,GLX(144)
	MOV_RDI QWORD [rax+8],GLX(145)
	mov GLX(145),99
	mov rax,GLX(144)
	MOV_RDI QWORD [rax+16],GLX(145)
	mov rax,GLX(138)
	MOV_RDI QWORD [rax+16],GLX(144)
	mov rax,GLX(138)
	mov BYTE [rax+6],0
	call LB_12
	pop rax
	MOV_RBX GLX(146),GLX(0)
	MOV_RBX GLX(147),GLX(1)
	MOV_RBX GLX(148),GLX(2)
	pop rdi
	mov GLX(127),rdi
	pop rdi
	mov GLX(137),rdi
;; rsp=0 , %9~{ 146'(= r ) { 147'(= {| l |} ) 148'(= r ) } }%8~137'(= r )%0~127'(= {| ? |} )
; ##8 { 146'(= r ) { 147'(= {| l |} ) 148'(= r ) } } ⊢ { 146'(= r ) { 147'(= {| l |} ) 148'(= r ) } }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(146)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(147)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(148)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_18,32
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 146'(= r ) { 147'(= {| l |} ) 148'(= r ) } }
	mov rdi,GLX(147)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %8~137'(= r )%0~127'(= {| ? |} )
; ∎
	jmp RTM_1
EXH_1:
	add rsp,8
	pop rax
	jmp rax
EXH_4:
	add rsp,8
	pop rax
	jmp rax
EXH_7:
	add rsp,8
	pop rax
	jmp rax
EXH_10:
	add rsp,8
	pop rax
	jmp rax
EXH_17:
	add rsp,8
	pop rax
	jmp rax
RTM_1:
	C_CALL exit

%include "TEXT.s"
