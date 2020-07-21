%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 179
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

LB_4: db 32,58,32,95,97,114,114,226,151,130,95,114,54,52,226,151,130,10,0
LB_9: db 32,58,32,95,97,114,114,226,151,130,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,10,0
LB_12: db 32,58,32,123,32,95,97,114,114,226,151,130,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,10,0
LB_17: db 32,58,32,123,32,95,97,114,114,226,151,130,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,32,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
LB_20: db 32,58,32,123,32,95,97,114,114,226,151,130,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,32,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
LB_25: db 32,58,32,95,97,114,114,226,151,130,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,10,0
LB_30: db 32,58,32,95,97,114,114,226,151,130,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,10,0
LB_43: db 39,48,226,151,130,0
LB_44: db 39,49,226,151,130,0
LB_49: db 39,48,226,151,130,0
LB_51: db 39,49,226,151,130,0
LB_56: db 39,48,226,151,130,0
LB_57: db 39,49,226,151,130,0
LB_58: db 32,58,32,95,97,114,114,226,151,130,123,32,95,111,112,110,226,151,130,95,111,112,110,226,151,130,95,114,54,52,226,151,130,32,95,108,115,116,226,151,130,95,115,56,226,151,130,125,10,0
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
LB_38: ;; _s8◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_41+8*rax]
 ; { _s8◂ _lst◂_s8◂} { }
LB_41: dq LB_39,LB_40
LB_39:
	EMT_CST LB_43,5
	EMT_CST fmt_rcd_box_l,4
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	EMT_CST fmt_spc,4 
	push r8
	mov r8,QWORD [r8+8+8*1]
; .adt_call t2 : _s8◂
	call LB_38
	pop r8 
	EMT_CST fmt_spc,4 
	EMT_CST fmt_rcd_r,4
	jmp LB_42
LB_40:
	EMT_CST LB_44,5
	EMT_CST fmt_rcd_box_l,4
	EMT_CST fmt_rcd_r,4
	jmp LB_42
LB_42:
	ret
LB_37: ;; _opn◂_r64◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_47+8*rax]
 ; _opn◂_r64◂ { }
LB_47: dq LB_45,LB_46
LB_45:
	EMT_CST LB_49,5
	mov r8,QWORD [r8+8]
; .adt_call t3 : _r64◂
	call LB_50
	jmp LB_48
LB_46:
	EMT_CST LB_51,5
	EMT_CST fmt_rcd_box_l,4
	EMT_CST fmt_rcd_r,4
	jmp LB_48
LB_48:
	ret
LB_50: ;; _r64◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_54+8*rax]
 ; _r64◂ { }
LB_54: dq LB_52,LB_53
LB_52:
	EMT_CST LB_56,5
	mov r8,QWORD [r8+8]
	mov rdi,r8
	call emt_r64
	jmp LB_55
LB_53:
	EMT_CST LB_57,5
	EMT_CST fmt_rcd_box_l,4
	EMT_CST fmt_rcd_r,4
	jmp LB_55
LB_55:
	ret
LB_62: ;; _s8◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_65+8*rax]
 ; { _s8◂ _lst◂_s8◂} { }
LB_65: dq LB_63,LB_64
LB_63:
	push r8
	mov r8,QWORD [r8+8+8*0]
	FREE_S8 r8
	pop r8
	push r8
	mov r8,QWORD [r8+8+8*1]
; .adt_call t2 : _s8◂
	call LB_62
	pop r8
	FREE_RCD 2, r8
	jmp LB_66
LB_64:
	jmp LB_66
LB_66:
	ret
LB_61: ;; _opn◂_r64◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_69+8*rax]
 ; _opn◂_r64◂ { }
LB_69: dq LB_67,LB_68
LB_67:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
; .adt_call t3 : _r64◂
	call LB_71
	jmp LB_70
LB_68:
	jmp LB_70
LB_70:
	ret
LB_71: ;; _r64◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_74+8*rax]
 ; _r64◂ { }
LB_74: dq LB_72,LB_73
LB_72:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_75
LB_73:
	jmp LB_75
LB_75:
	ret
RTM_0:
;; rsp=0 , %0~127'(= {| ? |} )
; ##0 { %[ 3r ] %[ 4r ] } ⊢ { %[ 3r ] %[ 4r ] 128'(= {| ? |} ) }
	mov rdi,3
	push rdi 
	imul rdi,1
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov GLX(128),rax
	mov QWORD [rax],rdi 
	lea DST_REG,[rax+8] 
LB_0:
	cmp rdi,0 
	jz LB_1
	sub rdi,1
	mov GLX(129),rdi
	mov GLX(130),4
	MOV_RDI QWORD [DST_REG+8*0],GLX(130)
	mov rdi,GLX(129)
	lea DST_REG,[DST_REG+8*1]
	jmp LB_0
LB_1:
; .dlt.ptn %[ 4r ]
; .dlt.ptn %[ 3r ]
;; rsp=0 , %3~128'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 128'(= {| ? |} ) ⊢ 128'(= {| ? |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(128)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_2:
	cmp rsi,rax 
	jz LB_3
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(131),QWORD [SRC_REG+8*0]
	mov rdi,GLX(131)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	lea SRC_REG,[SRC_REG+8*1]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_2
LB_3:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_4,18
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; rsp=0 , %4~128'(= {| ? |} )%0~127'(= {| ? |} )
; ##0 { %[ 4r ] { %[ "aa" ] %[ 567r ] } } ⊢ { %[ 4r ] { %[ "aa" ] %[ 567r ] } 132'(= {| ? |} ) }
	mov rdi,4
	push rdi 
	imul rdi,2
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov GLX(132),rax
	mov QWORD [rax],rdi 
	lea DST_REG,[rax+8] 
LB_5:
	cmp rdi,0 
	jz LB_6
	sub rdi,1
	mov GLX(133),rdi
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],2
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],97
	mov BYTE [rax+8+1],97
	mov GLX(134),rax
	MOV_RDI QWORD [DST_REG+8*0],GLX(134)
	mov GLX(135),567
	MOV_RDI QWORD [DST_REG+8*1],GLX(135)
	mov rdi,GLX(133)
	lea DST_REG,[DST_REG+8*2]
	jmp LB_5
LB_6:
; .dlt.ptn { %[ "aa" ] %[ 567r ] }
; .dlt.ptn %[ 4r ]
;; rsp=0 , %7~132'(= {| ? |} )%4~128'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 132'(= {| ? |} ) ⊢ 132'(= {| ? |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_7:
	cmp rsi,rax 
	jz LB_8
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(136),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(137),QWORD [SRC_REG+8*1]
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(136)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(137)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_7
LB_8:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_9,28
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; rsp=0 , %8~132'(= {| ? |} )%4~128'(= {| ? |} )%0~127'(= {| ? |} )
; ##1 { 128'(= {| ? |} ) %[ 1r ] %[ 4095r ] } ⊢ { 128'(= {| ? |} ) %[ 1r ] 138'(= r ) }
	mov rax,1
	mov rdi,GLX(128)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_exc_q
	 imul rax,1
	lea rdi,[rdi+8+8*rax]
	mov DST_REG,rdi 
	mov SRC_REG,rdi
	MOV_RDI GLX(138),QWORD [SRC_REG+8*0]
	mov GLX(139),4095
	MOV_RDI QWORD [DST_REG+8*0],GLX(139)
; .dlt.ptn %[ 1r ]
;; rsp=0 , %11~138'(= r )%9~128'(= {| ? |} )%8~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 { 128'(= {| ? |} ) 138'(= r ) } ⊢ { 128'(= {| ? |} ) 138'(= r ) }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(128)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_10:
	cmp rsi,rax 
	jz LB_11
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(140),QWORD [SRC_REG+8*0]
	mov rdi,GLX(140)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	lea SRC_REG,[SRC_REG+8*1]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_10
LB_11:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(138)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_12,29
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 138'(= r )
; .dlt.ptn 128'(= {| ? |} )
	mov rdi,GLX(128)
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_13:
	cmp rsi,0
	jz LB_14
	push r8 
	push rsi 
	MOV_RDI GLX(141),QWORD [SRC_REG+8*0]
	pop rsi 
	pop r8 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_13
LB_14:
	mov rdi,r8
	C_CALL_SF free 
	C_POP_REGS
;; rsp=0 , %8~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##1 { 132'(= {| ? |} ) %[ 2r ] { %[ "hello" ] %[ 99r ] } } ⊢ { 132'(= {| ? |} ) %[ 2r ] { 142'(= {| l |} ) 143'(= r ) } }
	mov rax,2
	mov rdi,GLX(132)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_exc_q
	 imul rax,2
	lea rdi,[rdi+8+8*rax]
	mov DST_REG,rdi 
	mov SRC_REG,rdi
	MOV_RDI GLX(142),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(143),QWORD [SRC_REG+8*1]
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],5
	C_CALL_SF calloc
	mov QWORD [rax],5
	mov BYTE [rax+8+0],104
	mov BYTE [rax+8+1],101
	mov BYTE [rax+8+2],108
	mov BYTE [rax+8+3],108
	mov BYTE [rax+8+4],111
	mov GLX(144),rax
	MOV_RDI QWORD [DST_REG+8*0],GLX(144)
	mov GLX(145),99
	MOV_RDI QWORD [DST_REG+8*1],GLX(145)
; .dlt.ptn %[ 2r ]
;; rsp=0 , %16~{ 142'(= {| l |} ) 143'(= r ) }%14~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 { 132'(= {| ? |} ) { 142'(= {| l |} ) 143'(= r ) } } ⊢ { 132'(= {| ? |} ) { 142'(= {| l |} ) 143'(= r ) } }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_15:
	cmp rsi,rax 
	jz LB_16
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(146),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(147),QWORD [SRC_REG+8*1]
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(146)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(147)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_15
LB_16:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(142)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(143)
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
	EMT_CST LB_17,49
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 142'(= {| l |} ) 143'(= r ) }
	mov rdi,GLX(142)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %17~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##4 { 132'(= {| ? |} ) %[ 0r ] } ⊢ { 132'(= {| ? |} ) %[ 0r ] { 150'(= {| l |} ) 151'(= r ) } }
	mov rax,0
	mov rdi,GLX(132)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_lod_q
	imul rax,2
	lea rdi,[rdi+8+8*rax]
	mov SRC_REG,rdi
	MOV_RDI GLX(148),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(149),QWORD [SRC_REG+8*1]
	mov rdi,GLX(148)
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	CALL_SF rpc_s8
	C_POP_REGS
	mov GLX(150),rax
	mov rdi,GLX(149)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(151),rax
; .dlt.ptn %[ 0r ]
;; rsp=0 , %21~{ 150'(= {| l |} ) 151'(= r ) }%19~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 { 132'(= {| ? |} ) { 150'(= {| l |} ) 151'(= r ) } } ⊢ { 132'(= {| ? |} ) { 150'(= {| l |} ) 151'(= r ) } }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_18:
	cmp rsi,rax 
	jz LB_19
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(152),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(153),QWORD [SRC_REG+8*1]
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(152)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(153)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_18
LB_19:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(150)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(151)
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
	EMT_CST LB_20,49
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 150'(= {| l |} ) 151'(= r ) }
	mov rdi,GLX(150)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %22~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##46 132'(= {| ? |} ) ⊢ 132'(= {| ? |} )
;; rsp=0 , %24~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##37 132'(= {| ? |} ) ⊢ { 132'(= {| ? |} ) 154'(= {| ? |} ) }
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi
	mov r9,0x0000_ffff_ffff_ffff 
	and r9,QWORD [r8] 
	mov rdi,r9 
	imul rdi,2
	lea rdi,[8+8*rdi] 
	mov rsi,1 
	xor rax,rax
	C_CALL_SF calloc
	mov QWORD [rax],r9
	mov r10,rax 
	lea DST_REG,[rax+8]
	lea SRC_REG,[r8+8]
LB_21:
	cmp r9,0 
	jz LB_22
	push r8 
	push r9
	push r10
	mov r8,QWORD [r8+8*r9]
	MOV_RDI GLX(155),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(156),QWORD [SRC_REG+8*1]
	mov rdi,GLX(155)
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	CALL_SF rpc_s8
	C_POP_REGS
	mov GLX(157),rax
	mov rdi,GLX(156)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(158),rax
	MOV_RBX GLX(159),GLX(157)
	MOV_RDI QWORD [DST_REG+8*0],GLX(159)
	MOV_RBX GLX(160),GLX(158)
	MOV_RDI QWORD [DST_REG+8*1],GLX(160)
	pop r10 
	pop r9  
	pop r8 
	sub r9,1 
	lea SRC_REG,[SRC_REG+8*2]
	lea DST_REG,[DST_REG+8*2]
	jmp LB_21
LB_22:
	mov rax,r10
	C_POP_REGS
	mov GLX(154),rax
;; rsp=0 , %26~154'(= {| ? |} )%25~132'(= {| ? |} )%0~127'(= {| ? |} )
; ##46 132'(= {| ? |} ) ⊢ 132'(= {| ? |} )
;; rsp=0 , %27~132'(= {| ? |} )%26~154'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 132'(= {| ? |} ) ⊢ 132'(= {| ? |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_23:
	cmp rsi,rax 
	jz LB_24
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(161),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(162),QWORD [SRC_REG+8*1]
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(161)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(162)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_23
LB_24:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_25,28
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 132'(= {| ? |} )
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_26:
	cmp rsi,0
	jz LB_27
	push r8 
	push rsi 
	MOV_RDI GLX(163),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(164),QWORD [SRC_REG+8*1]
	mov rdi,GLX(163)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
	pop rsi 
	pop r8 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*2]
	jmp LB_26
LB_27:
	mov rdi,r8
	C_CALL_SF free 
	C_POP_REGS
;; rsp=0 , %26~154'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 154'(= {| ? |} ) ⊢ 154'(= {| ? |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(154)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_28:
	cmp rsi,rax 
	jz LB_29
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(165),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(166),QWORD [SRC_REG+8*1]
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(165)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(166)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_28
LB_29:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_30,28
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 154'(= {| ? |} )
	mov rdi,GLX(154)
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_31:
	cmp rsi,0
	jz LB_32
	push r8 
	push rsi 
	MOV_RDI GLX(167),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(168),QWORD [SRC_REG+8*1]
	mov rdi,GLX(167)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
	pop rsi 
	pop r8 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*2]
	jmp LB_31
LB_32:
	mov rdi,r8
	C_CALL_SF free 
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; ##0 { %[ 3r ] { 0(<2)◂0(<2)◂%[ 0r ] 0(<2)◂{ %[ "ff" ] 0(<2)◂{ %[ "bc" ] 1(<2)◂{ } } } } } ⊢ { %[ 3r ] { 0(<2)◂0(<2)◂%[ 0r ] 0(<2)◂{ %[ "ff" ] 0(<2)◂{ %[ "bc" ] 1(<2)◂{ } } } } 169'(= {| ? |} ) }
	mov rdi,3
	push rdi 
	imul rdi,2
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov GLX(169),rax
	mov QWORD [rax],rdi 
	lea DST_REG,[rax+8] 
LB_33:
	cmp rdi,0 
	jz LB_34
	sub rdi,1
	mov GLX(170),rdi
	mov GLX(171),0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov rdi,GLX(171)
	mov QWORD [rax+8],rdi
	mov GLX(171),rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov rdi,GLX(171)
	mov QWORD [rax+8],rdi
	mov GLX(171),rax
	MOV_RDI QWORD [DST_REG+8*0],GLX(171)
	ALC_RCD 2, rax
	mov GLX(172),rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],2
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],102
	mov BYTE [rax+8+1],102
	mov GLX(173),rax
	mov rax,GLX(172)
	MOV_RDI QWORD [rax+8],GLX(173)
	ALC_RCD 2, rax
	mov GLX(173),rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],2
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],98
	mov BYTE [rax+8+1],99
	mov GLX(174),rax
	mov rax,GLX(173)
	MOV_RDI QWORD [rax+8],GLX(174)
	mov GLX(174),unt_1
	mov rax,GLX(173)
	MOV_RDI QWORD [rax+16],GLX(174)
	mov rax,GLX(173)
	mov BYTE [rax+6],0
	mov rax,GLX(172)
	MOV_RDI QWORD [rax+16],GLX(173)
	mov rax,GLX(172)
	mov BYTE [rax+6],0
	MOV_RDI QWORD [DST_REG+8*1],GLX(172)
	mov rdi,GLX(170)
	lea DST_REG,[DST_REG+8*2]
	jmp LB_33
LB_34:
; .dlt.ptn { 0(<2)◂0(<2)◂%[ 0r ] 0(<2)◂{ %[ "ff" ] 0(<2)◂{ %[ "bc" ] 1(<2)◂{ } } } }
; .dlt.ptn %[ 3r ]
;; rsp=0 , %32~169'(= {| ? |} )%0~127'(= {| ? |} )
; ##8 169'(= {| ? |} ) ⊢ 169'(= {| ? |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(169)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_35:
	cmp rsi,rax 
	jz LB_36
	push r8 
	push rsi 
	push rax 
	MOV_RDI GLX(175),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(176),QWORD [SRC_REG+8*1]
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(175)
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : _opn◂_r64◂
	call LB_37
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(176)
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t2 : _s8◂
	call LB_38
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	pop r8 
	add rax,1 
	jmp LB_35
LB_36:
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_58,49
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 169'(= {| ? |} )
	mov rdi,GLX(169)
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
	lea SRC_REG,[r8+8]
LB_59:
	cmp rsi,0
	jz LB_60
	push r8 
	push rsi 
	MOV_RDI GLX(177),QWORD [SRC_REG+8*0]
	MOV_RDI GLX(178),QWORD [SRC_REG+8*1]
	mov rdi,GLX(177)
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : _opn◂_r64◂
	call LB_61
	C_POP_REGS
	mov rdi,GLX(178)
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t2 : _s8◂
	call LB_62
	C_POP_REGS
	pop rsi 
	pop r8 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*2]
	jmp LB_59
LB_60:
	mov rdi,r8
	C_CALL_SF free 
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; ∎
	jmp RTM_1
RTM_1:
	C_CALL exit

%include "TEXT.s"
