%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 499
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

LB_0: db 100,65,66,67,105,101,105,0
LB_8: db 39,48,226,151,130,0
LB_9: db 39,49,226,151,130,0
LB_10: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,95,114,54,52,226,151,130,125,10,0
LB_11: db 100,65,66,67,105,101,105,0
LB_19: db 39,48,226,151,130,0
LB_20: db 39,49,226,151,130,0
LB_21: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_31: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_32: db 56,55,51,56,51,0
LB_35: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,95,114,54,52,226,151,130,125,10,0
LB_36: db 32,32,32,9,10,107,107,0
LB_40: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_41: db 32,32,32,9,10,107,107,0
LB_45: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_58: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_88: db 39,48,226,151,130,0
LB_89: db 39,49,226,151,130,0
LB_90: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
LB_100: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_116: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
LB_117: db 100,65,66,67,105,101,105,0
LB_120: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,95,114,54,52,226,151,130,125,10,0
LB_121: db 100,65,66,67,105,101,105,0
LB_124: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,95,114,54,52,226,151,130,125,10,0
LB_125: db 100,65,66,67,105,101,105,0
LB_129: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_130: db 100,65,66,67,105,101,105,0
LB_134: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_135: db 100,65,66,67,105,101,105,0
LB_139: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_140: db 100,65,66,67,105,101,105,0
LB_144: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_145: db 100,65,66,67,105,101,105,0
LB_149: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_150: db 100,65,66,67,105,101,105,32,32,32,0
LB_154: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_209: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
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
LB_3: ;; _r64◂
	jmp QWORD [LB_6+8*r10]
 ; _r64◂ { }
LB_6: dq LB_4,LB_5
LB_4:
	EMT_CST LB_8,5
	mov rdi,r8
	call emt_r64
	jmp LB_7
LB_5:
	EMT_CST LB_9,5
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_r,4
	pop r8 
	pop SRC_REG
	jmp LB_7
LB_7:
	ret
LB_14: ;; { }
	jmp QWORD [LB_17+8*r10]
 ; { } { }
LB_17: dq LB_15,LB_16
LB_15:
	EMT_CST LB_19,5
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_r,4
	pop r8 
	pop SRC_REG
	jmp LB_18
LB_16:
	EMT_CST LB_20,5
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_r,4
	pop r8 
	pop SRC_REG
	jmp LB_18
LB_18:
	ret
LB_26: ;; #61◂◂(_none◂{}) { { { } } { 144'(= r ) 145'(= r ) } } ⊢ 0'(3)◂1' : ({ { { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_26:
	MOV_RBX GLX(146),GLX(144)
	MOV_RBX GLX(147),GLX(145)
;; rsp=0 , %1~147'(= r )%0~146'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 147'(= r )
; .dlt.ptn 146'(= r )
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_29: ;; #60◂◂(_none◂{}) { 151'(= {| l |} ) 152'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_29:
	MOV_RBX GLX(153),GLX(151)
	MOV_RBX GLX(154),GLX(152)
;; rsp=0 , %1~154'(= r )%0~153'(= {| l |} )
; ∎ { 153'(= {| l |} ) 154'(= r ) 1(<2)◂{ } }
	MOV_RBX GLX(0),GLX(153)
	MOV_RBX GLX(1),GLX(154)
	mov GLX(2),1
	mov GLX(3),unt
	ret
LB_22: ;; #62◂◂(_none◂{}) { 134'(= {| l |} ) 135'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_22:
	MOV_RBX GLX(136),GLX(134)
	MOV_RBX GLX(137),GLX(135)
;; rsp=0 , %1~137'(= r )%0~136'(= {| l |} )
; ##37 137'(= r ) ⊢ { 137'(= r ) 138'(= r ) }
	mov rdi,GLX(137)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(138),rax
;; rsp=0 , %3~138'(= r )%2~137'(= r )%0~136'(= {| l |} )
; # ?  { 136'(= {| l |} ) 138'(= r ) } ⊢ { 136'(= {| l |} ) 139'(= r ) 141'(3)◂140' }
	mov rdi,GLX(136)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(138)
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_23
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],65
	jnz LB_23
	cmp BYTE [rdi+1],98
	jnz LB_23
	add rax,2
	mov rsi,unt
	mov r10,0
	jmp LB_24
LB_23:
	mov rsi,unt
	mov r10,1
LB_24:
	mov GLX(139),rax
	mov GLX(140),rsi
	mov GLX(141),r10
;; rsp=0 , %6~141'(3)◂140'%5~139'(= r )%4~136'(= {| l |} )%2~137'(= r )
;; ?; 141'(3)◂140' ⊢ 0(<2)◂{ }
	cmp GLX(141),0
	jnz LB_25
;; rsp=0 , %7~{ }%5~139'(= r )%4~136'(= {| l |} )%2~137'(= r )
; ##37 137'(= r ) ⊢ { 137'(= r ) 142'(= r ) }
	mov rdi,GLX(137)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(142),rax
;; rsp=0 , %9~142'(= r )%8~137'(= r )%7~{ }%5~139'(= r )%4~136'(= {| l |} )
; ##37 139'(= r ) ⊢ { 139'(= r ) 143'(= r ) }
	mov rdi,GLX(139)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(143),rax
;; rsp=0 , %11~143'(= r )%10~139'(= r )%9~142'(= r )%8~137'(= r )%7~{ }%4~136'(= {| l |} )
; ##61 { { { } } { 142'(= r ) 143'(= r ) } } ⊢ 148'(3)◂149'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(139)
	MOV_RDI QWORD [rsp+8*1],GLX(137)
	MOV_RDI QWORD [rsp+8*0],GLX(136)
	push EXH_27
	MOV_RBX GLX(144),GLX(142)
	MOV_RBX GLX(145),GLX(143)
	call LB_26
	add rsp,8
	MOV_RBX GLX(148),GLX(0)
	MOV_RBX GLX(149),GLX(1)
	pop GLX(136)
	pop GLX(137)
	pop GLX(139)
;; rsp=0 , %12~148'(3)◂149'%10~139'(= r )%8~137'(= r )%4~136'(= {| l |} )
;; ?; 148'(3)◂149' ⊢ 0(<2)◂{ }
	cmp GLX(148),0
	jnz LB_28
;; rsp=0 , %13~{ }%10~139'(= r )%8~137'(= r )%4~136'(= {| l |} )
; ∎ { 136'(= {| l |} ) 139'(= r ) 0(<2)◂{ } }
; .dlt.ptn 137'(= r )
	MOV_RBX GLX(0),GLX(136)
	MOV_RBX GLX(1),GLX(139)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_28:
;; ?; 148'(3)◂149' ⊢ 1(<2)◂{ }
;; rsp=0 , %10~139'(= r )%8~137'(= r )%4~136'(= {| l |} )
; ##51 139'(= r ) ⊢ { }
;; rsp=0 , %8~137'(= r )%4~136'(= {| l |} )
; ##37 137'(= r ) ⊢ { 137'(= r ) 150'(= r ) }
	mov rdi,GLX(137)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(150),rax
;; rsp=0 , %15~150'(= r )%14~137'(= r )%4~136'(= {| l |} )
; ##60 { 136'(= {| l |} ) 137'(= r ) } ⊢|
; .dlt.ptn 150'(= r )
	MOV_RBX GLX(151),GLX(136)
	MOV_RBX GLX(152),GLX(137)
	jmp JMP_29
LB_25:
;; ?; 141'(3)◂140' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~139'(= r )%4~136'(= {| l |} )%2~137'(= r )
; ##51 139'(= r ) ⊢ { }
;; rsp=0 , %4~136'(= {| l |} )%2~137'(= r )
; ##37 137'(= r ) ⊢ { 137'(= r ) 155'(= r ) }
	mov rdi,GLX(137)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(155),rax
;; rsp=0 , %17~155'(= r )%16~137'(= r )%4~136'(= {| l |} )
; ##60 { 136'(= {| l |} ) 137'(= r ) } ⊢|
; .dlt.ptn 155'(= r )
	MOV_RBX GLX(151),GLX(136)
	MOV_RBX GLX(152),GLX(137)
	jmp JMP_29
EXH_27:
	add rsp,8
	pop rax
	jmp rax
LB_53: ;; #72◂◂(_none◂{}) { { { } { } } { 182'(= r ) 183'(= r ) } } ⊢ 0'(3)◂1' : ({ { { } { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_53:
	MOV_RBX GLX(184),GLX(182)
	MOV_RBX GLX(185),GLX(183)
;; rsp=0 , %1~185'(= r )%0~184'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 185'(= r )
; .dlt.ptn 184'(= r )
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_56: ;; #71◂◂(_none◂{}) { 189'(= {| l |} ) 190'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_56:
	MOV_RBX GLX(191),GLX(189)
	MOV_RBX GLX(192),GLX(190)
;; rsp=0 , %1~192'(= r )%0~191'(= {| l |} )
; ∎ { 191'(= {| l |} ) 192'(= r ) 1(<2)◂{ } }
	MOV_RBX GLX(0),GLX(191)
	MOV_RBX GLX(1),GLX(192)
	mov GLX(2),1
	mov GLX(3),unt
	ret
LB_46: ;; #73◂◂(_none◂{}) { 169'(= {| l |} ) 170'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_46:
	MOV_RBX GLX(171),GLX(169)
	MOV_RBX GLX(172),GLX(170)
;; rsp=0 , %1~172'(= r )%0~171'(= {| l |} )
; ##37 172'(= r ) ⊢ { 172'(= r ) 173'(= r ) }
	mov rdi,GLX(172)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(173),rax
;; rsp=0 , %3~173'(= r )%2~172'(= r )%0~171'(= {| l |} )
; # ?  { 171'(= {| l |} ) 173'(= r ) } ⊢ { 171'(= {| l |} ) 174'(= r ) 176'(3)◂175' }
	mov rdi,GLX(171)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(173)
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_47
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],102
	jnz LB_47
	cmp BYTE [rdi+1],102
	jnz LB_47
	add rax,2
	mov rsi,unt
	mov r10,0
	jmp LB_48
LB_47:
	mov rsi,unt
	mov r10,1
LB_48:
	mov GLX(174),rax
	mov GLX(175),rsi
	mov GLX(176),r10
;; rsp=0 , %6~176'(3)◂175'%5~174'(= r )%4~171'(= {| l |} )%2~172'(= r )
;; ?; 176'(3)◂175' ⊢ 0(<2)◂{ }
	cmp GLX(176),0
	jnz LB_49
;; rsp=0 , %7~{ }%5~174'(= r )%4~171'(= {| l |} )%2~172'(= r )
; # ?  { 171'(= {| l |} ) 174'(= r ) } ⊢ { 171'(= {| l |} ) 177'(= r ) 179'(3)◂178' }
	mov rdi,GLX(171)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(174)
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_50
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],118
	jnz LB_50
	cmp BYTE [rdi+1],118
	jnz LB_50
	add rax,2
	mov rsi,unt
	mov r10,0
	jmp LB_51
LB_50:
	mov rsi,unt
	mov r10,1
LB_51:
	mov GLX(177),rax
	mov GLX(178),rsi
	mov GLX(179),r10
;; rsp=0 , %10~179'(3)◂178'%9~177'(= r )%8~171'(= {| l |} )%7~{ }%2~172'(= r )
;; ?; 179'(3)◂178' ⊢ 0(<2)◂{ }
	cmp GLX(179),0
	jnz LB_52
;; rsp=0 , %11~{ }%9~177'(= r )%8~171'(= {| l |} )%7~{ }%2~172'(= r )
; ##37 172'(= r ) ⊢ { 172'(= r ) 180'(= r ) }
	mov rdi,GLX(172)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(180),rax
;; rsp=0 , %13~180'(= r )%12~172'(= r )%11~{ }%9~177'(= r )%8~171'(= {| l |} )%7~{ }
; ##37 177'(= r ) ⊢ { 177'(= r ) 181'(= r ) }
	mov rdi,GLX(177)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(181),rax
;; rsp=0 , %15~181'(= r )%14~177'(= r )%13~180'(= r )%12~172'(= r )%11~{ }%8~171'(= {| l |} )%7~{ }
; ##72 { { { } { } } { 180'(= r ) 181'(= r ) } } ⊢ 186'(3)◂187'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(177)
	MOV_RDI QWORD [rsp+8*1],GLX(172)
	MOV_RDI QWORD [rsp+8*0],GLX(171)
	push EXH_54
	MOV_RBX GLX(182),GLX(180)
	MOV_RBX GLX(183),GLX(181)
	call LB_53
	add rsp,8
	MOV_RBX GLX(186),GLX(0)
	MOV_RBX GLX(187),GLX(1)
	pop GLX(171)
	pop GLX(172)
	pop GLX(177)
;; rsp=0 , %16~186'(3)◂187'%14~177'(= r )%12~172'(= r )%8~171'(= {| l |} )
;; ?; 186'(3)◂187' ⊢ 0(<2)◂{ }
	cmp GLX(186),0
	jnz LB_55
;; rsp=0 , %17~{ }%14~177'(= r )%12~172'(= r )%8~171'(= {| l |} )
; ∎ { 171'(= {| l |} ) 177'(= r ) 0(<2)◂{ } }
; .dlt.ptn 172'(= r )
	MOV_RBX GLX(0),GLX(171)
	MOV_RBX GLX(1),GLX(177)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_55:
;; ?; 186'(3)◂187' ⊢ 1(<2)◂{ }
;; rsp=0 , %14~177'(= r )%12~172'(= r )%8~171'(= {| l |} )
; ##51 177'(= r ) ⊢ { }
;; rsp=0 , %12~172'(= r )%8~171'(= {| l |} )
; ##37 172'(= r ) ⊢ { 172'(= r ) 188'(= r ) }
	mov rdi,GLX(172)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(188),rax
;; rsp=0 , %19~188'(= r )%18~172'(= r )%8~171'(= {| l |} )
; ##71 { 171'(= {| l |} ) 172'(= r ) } ⊢|
; .dlt.ptn 188'(= r )
	MOV_RBX GLX(189),GLX(171)
	MOV_RBX GLX(190),GLX(172)
	jmp JMP_56
LB_52:
;; ?; 179'(3)◂178' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~177'(= r )%8~171'(= {| l |} )%7~{ }%2~172'(= r )
; ##51 177'(= r ) ⊢ { }
;; rsp=0 , %8~171'(= {| l |} )%7~{ }%2~172'(= r )
; ##37 172'(= r ) ⊢ { 172'(= r ) 193'(= r ) }
	mov rdi,GLX(172)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(193),rax
;; rsp=0 , %21~193'(= r )%20~172'(= r )%8~171'(= {| l |} )%7~{ }
; ##71 { 171'(= {| l |} ) 172'(= r ) } ⊢|
; .dlt.ptn 193'(= r )
; .dlt.ptn { }
	MOV_RBX GLX(189),GLX(171)
	MOV_RBX GLX(190),GLX(172)
	jmp JMP_56
LB_49:
;; ?; 176'(3)◂175' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~174'(= r )%4~171'(= {| l |} )%2~172'(= r )
; ##51 174'(= r ) ⊢ { }
;; rsp=0 , %4~171'(= {| l |} )%2~172'(= r )
; ##37 172'(= r ) ⊢ { 172'(= r ) 194'(= r ) }
	mov rdi,GLX(172)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(194),rax
;; rsp=0 , %23~194'(= r )%22~172'(= r )%4~171'(= {| l |} )
; ##71 { 171'(= {| l |} ) 172'(= r ) } ⊢|
; .dlt.ptn 194'(= r )
	MOV_RBX GLX(189),GLX(171)
	MOV_RBX GLX(190),GLX(172)
	jmp JMP_56
EXH_54:
	add rsp,8
	pop rax
	jmp rax
LB_65: ;; #78◂◂(_none◂{}) { { { } { 215'(= r ) 216'(= r ) } } { 217'(= r ) 218'(= r ) } } ⊢ 0'(3)◂1' : ({ { { } { _r64◂ _r64◂}} { _r64◂ _r64◂}}→_opn◂{ _r64◂ _r64◂})
JMP_65:
	MOV_RBX GLX(219),GLX(215)
	MOV_RBX GLX(220),GLX(216)
	MOV_RBX GLX(221),GLX(217)
	MOV_RBX GLX(222),GLX(218)
;; rsp=0 , %2~222'(= r )%1~221'(= r )%0~{ 219'(= r ) 220'(= r ) }
; ∎ 0(<2)◂{ 219'(= r ) 220'(= r ) }
; .dlt.ptn 222'(= r )
; .dlt.ptn 221'(= r )
	mov GLX(0),0
	ALC_RCD 2, rax
	mov GLX(1),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(219)
	MOV_RDI DX(1),GLX(220)
	pop DST_REG
	ret
LB_78: ;; #76◂◂(_none◂{}) { { 244'(= r ) { } 245'(= r ) } { 246'(= r ) 247'(= r ) } } ⊢ 0'(3)◂1' : ({ { _r64◂ { }_r64◂} { _r64◂ _r64◂}}→_opn◂{ _r64◂ _r64◂})
JMP_78:
	MOV_RBX GLX(248),GLX(244)
	MOV_RBX GLX(249),GLX(245)
	MOV_RBX GLX(250),GLX(246)
	MOV_RBX GLX(251),GLX(247)
;; rsp=0 , %3~251'(= r )%2~250'(= r )%1~249'(= r )%0~248'(= r )
; ∎ 0(<2)◂{ 248'(= r ) 249'(= r ) }
; .dlt.ptn 251'(= r )
; .dlt.ptn 250'(= r )
	mov GLX(0),0
	ALC_RCD 2, rax
	mov GLX(1),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(248)
	MOV_RDI DX(1),GLX(249)
	pop DST_REG
	ret
LB_81: ;; #75◂◂(_none◂{}) { 257'(= {| l |} ) 258'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
JMP_81:
	MOV_RBX GLX(259),GLX(257)
	MOV_RBX GLX(260),GLX(258)
;; rsp=0 , %1~260'(= r )%0~259'(= {| l |} )
; ∎ { 259'(= {| l |} ) 260'(= r ) 1(<2)◂{ } }
	MOV_RBX GLX(0),GLX(259)
	MOV_RBX GLX(1),GLX(260)
	mov GLX(2),1
	mov GLX(3),unt
	ret
LB_68: ;; #77◂◂(_none◂{}) { 228'(= {| l |} ) 229'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
JMP_68:
	MOV_RBX GLX(230),GLX(228)
	MOV_RBX GLX(231),GLX(229)
;; rsp=0 , %1~231'(= r )%0~230'(= {| l |} )
; ##37 231'(= r ) ⊢ { 231'(= r ) 232'(= r ) }
	mov rdi,GLX(231)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(232),rax
;; rsp=0 , %3~232'(= r )%2~231'(= r )%0~230'(= {| l |} )
; # ?  { 230'(= {| l |} ) 232'(= r ) } ⊢ { 230'(= {| l |} ) 233'(= r ) 235'(3)◂234' }
	mov rdi,GLX(230)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(232)
	cmp rax,rdi
	jge LB_69
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_69
	lea rax,[rbx+rsi]
	mov rsi,rdi
	mov r10,0	jmp LB_70
LB_69:
	mov rsi,unt
	mov r10,1 
LB_70:
	mov GLX(233),rax
	mov GLX(234),rsi
	mov GLX(235),r10
;; rsp=0 , %6~235'(3)◂234'%5~233'(= r )%4~230'(= {| l |} )%2~231'(= r )
;; ?; 235'(3)◂234' ⊢ 0(<2)◂234'(= r )
	cmp GLX(235),0
	jnz LB_71
;; rsp=0 , %7~234'(= r )%5~233'(= r )%4~230'(= {| l |} )%2~231'(= r )
; # ?  { 230'(= {| l |} ) 233'(= r ) } ⊢ { 230'(= {| l |} ) 236'(= r ) 238'(3)◂237' }
	mov rdi,GLX(230)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(233)
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_72
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],113
	jnz LB_72
	add rax,1
	mov rsi,unt
	mov r10,0
	jmp LB_73
LB_72:
	mov rsi,unt
	mov r10,1
LB_73:
	mov GLX(236),rax
	mov GLX(237),rsi
	mov GLX(238),r10
;; rsp=0 , %10~238'(3)◂237'%9~236'(= r )%8~230'(= {| l |} )%7~234'(= r )%2~231'(= r )
;; ?; 238'(3)◂237' ⊢ 0(<2)◂{ }
	cmp GLX(238),0
	jnz LB_74
;; rsp=0 , %11~{ }%9~236'(= r )%8~230'(= {| l |} )%7~234'(= r )%2~231'(= r )
; # ?  { 230'(= {| l |} ) 236'(= r ) } ⊢ { 230'(= {| l |} ) 239'(= r ) 241'(3)◂240' }
	mov rdi,GLX(230)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(236)
	cmp rax,rdi
	jge LB_75
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_75
	lea rax,[rbx+rsi]
	mov rsi,rdi
	mov r10,0	jmp LB_76
LB_75:
	mov rsi,unt
	mov r10,1 
LB_76:
	mov GLX(239),rax
	mov GLX(240),rsi
	mov GLX(241),r10
;; rsp=0 , %14~241'(3)◂240'%13~239'(= r )%12~230'(= {| l |} )%11~{ }%7~234'(= r )%2~231'(= r )
;; ?; 241'(3)◂240' ⊢ 0(<2)◂240'(= r )
	cmp GLX(241),0
	jnz LB_77
;; rsp=0 , %15~240'(= r )%13~239'(= r )%12~230'(= {| l |} )%11~{ }%7~234'(= r )%2~231'(= r )
; ##37 231'(= r ) ⊢ { 231'(= r ) 242'(= r ) }
	mov rdi,GLX(231)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(242),rax
;; rsp=0 , %17~242'(= r )%16~231'(= r )%15~240'(= r )%13~239'(= r )%12~230'(= {| l |} )%11~{ }%7~234'(= r )
; ##37 239'(= r ) ⊢ { 239'(= r ) 243'(= r ) }
	mov rdi,GLX(239)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(243),rax
;; rsp=0 , %19~243'(= r )%18~239'(= r )%17~242'(= r )%16~231'(= r )%15~240'(= r )%12~230'(= {| l |} )%11~{ }%7~234'(= r )
; ##76 { { 234'(= r ) { } 240'(= r ) } { 242'(= r ) 243'(= r ) } } ⊢ 252'(3)◂253'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(239)
	MOV_RDI QWORD [rsp+8*1],GLX(231)
	MOV_RDI QWORD [rsp+8*0],GLX(230)
	push EXH_79
	MOV_RBX GLX(244),GLX(234)
	MOV_RBX GLX(245),GLX(240)
	MOV_RBX GLX(246),GLX(242)
	MOV_RBX GLX(247),GLX(243)
	call LB_78
	add rsp,8
	MOV_RBX GLX(252),GLX(0)
	MOV_RBX GLX(253),GLX(1)
	pop GLX(230)
	pop GLX(231)
	pop GLX(239)
;; rsp=0 , %20~252'(3)◂253'%18~239'(= r )%16~231'(= r )%12~230'(= {| l |} )
;; ?; 252'(3)◂253' ⊢ 0(<2)◂{ 254'(= r ) 255'(= r ) }
	cmp GLX(252),0
	jnz LB_80
	push SRC_REG 
	mov SRC_REG,GLX(253)
	add SRC_REG,8
	MOV_RDI GLX(254),SX(0)
	MOV_RDI GLX(255),SX(1)
	pop SRC_REG
	MOV_RAX QWORD [GBG_VCT+8*0],GLX(253)
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %21~{ 254'(= r ) 255'(= r ) }%18~239'(= r )%16~231'(= r )%12~230'(= {| l |} )
; ∎ { 230'(= {| l |} ) 239'(= r ) 0(<2)◂{ 254'(= r ) 255'(= r ) } }
; .dlt.ptn 231'(= r )
	MOV_RBX GLX(0),GLX(230)
	MOV_RBX GLX(1),GLX(239)
	mov GLX(2),0
	ALC_RCD 2, rax
	mov GLX(3),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(254)
	MOV_RDI DX(1),GLX(255)
	pop DST_REG
	ret
LB_80:
;; ?; 252'(3)◂253' ⊢ 1(<2)◂{ }
;; rsp=0 , %18~239'(= r )%16~231'(= r )%12~230'(= {| l |} )
; ##51 239'(= r ) ⊢ { }
;; rsp=0 , %16~231'(= r )%12~230'(= {| l |} )
; ##37 231'(= r ) ⊢ { 231'(= r ) 256'(= r ) }
	mov rdi,GLX(231)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(256),rax
;; rsp=0 , %23~256'(= r )%22~231'(= r )%12~230'(= {| l |} )
; ##75 { 230'(= {| l |} ) 231'(= r ) } ⊢|
; .dlt.ptn 256'(= r )
	MOV_RBX GLX(257),GLX(230)
	MOV_RBX GLX(258),GLX(231)
	jmp JMP_81
LB_77:
;; ?; 241'(3)◂240' ⊢ 1(<2)◂{ }
;; rsp=0 , %13~239'(= r )%12~230'(= {| l |} )%11~{ }%7~234'(= r )%2~231'(= r )
; ##51 239'(= r ) ⊢ { }
;; rsp=0 , %12~230'(= {| l |} )%11~{ }%7~234'(= r )%2~231'(= r )
; ##37 231'(= r ) ⊢ { 231'(= r ) 261'(= r ) }
	mov rdi,GLX(231)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(261),rax
;; rsp=0 , %25~261'(= r )%24~231'(= r )%12~230'(= {| l |} )%11~{ }%7~234'(= r )
; ##75 { 230'(= {| l |} ) 231'(= r ) } ⊢|
; .dlt.ptn 261'(= r )
; .dlt.ptn { }
; .dlt.ptn 234'(= r )
	MOV_RBX GLX(257),GLX(230)
	MOV_RBX GLX(258),GLX(231)
	jmp JMP_81
LB_74:
;; ?; 238'(3)◂237' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~236'(= r )%8~230'(= {| l |} )%7~234'(= r )%2~231'(= r )
; ##51 236'(= r ) ⊢ { }
;; rsp=0 , %8~230'(= {| l |} )%7~234'(= r )%2~231'(= r )
; ##37 231'(= r ) ⊢ { 231'(= r ) 262'(= r ) }
	mov rdi,GLX(231)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(262),rax
;; rsp=0 , %27~262'(= r )%26~231'(= r )%8~230'(= {| l |} )%7~234'(= r )
; ##75 { 230'(= {| l |} ) 231'(= r ) } ⊢|
; .dlt.ptn 262'(= r )
; .dlt.ptn 234'(= r )
	MOV_RBX GLX(257),GLX(230)
	MOV_RBX GLX(258),GLX(231)
	jmp JMP_81
LB_71:
;; ?; 235'(3)◂234' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~233'(= r )%4~230'(= {| l |} )%2~231'(= r )
; ##51 233'(= r ) ⊢ { }
;; rsp=0 , %4~230'(= {| l |} )%2~231'(= r )
; ##37 231'(= r ) ⊢ { 231'(= r ) 263'(= r ) }
	mov rdi,GLX(231)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(263),rax
;; rsp=0 , %29~263'(= r )%28~231'(= r )%4~230'(= {| l |} )
; ##75 { 230'(= {| l |} ) 231'(= r ) } ⊢|
; .dlt.ptn 263'(= r )
	MOV_RBX GLX(257),GLX(230)
	MOV_RBX GLX(258),GLX(231)
	jmp JMP_81
EXH_79:
	add rsp,8
	pop rax
	jmp rax
LB_59: ;; #79◂◂(_none◂{}) { 199'(= {| l |} ) 200'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
JMP_59:
	MOV_RBX GLX(201),GLX(199)
	MOV_RBX GLX(202),GLX(200)
;; rsp=0 , %1~202'(= r )%0~201'(= {| l |} )
; ##37 202'(= r ) ⊢ { 202'(= r ) 203'(= r ) }
	mov rdi,GLX(202)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(203),rax
;; rsp=0 , %3~203'(= r )%2~202'(= r )%0~201'(= {| l |} )
; # ?  { 201'(= {| l |} ) 203'(= r ) } ⊢ { 201'(= {| l |} ) 204'(= r ) 206'(3)◂205' }
	mov rdi,GLX(201)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(203)
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_60
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],119
	jnz LB_60
	add rax,1
	mov rsi,unt
	mov r10,0
	jmp LB_61
LB_60:
	mov rsi,unt
	mov r10,1
LB_61:
	mov GLX(204),rax
	mov GLX(205),rsi
	mov GLX(206),r10
;; rsp=0 , %6~206'(3)◂205'%5~204'(= r )%4~201'(= {| l |} )%2~202'(= r )
;; ?; 206'(3)◂205' ⊢ 0(<2)◂{ }
	cmp GLX(206),0
	jnz LB_62
;; rsp=0 , %7~{ }%5~204'(= r )%4~201'(= {| l |} )%2~202'(= r )
; # ?  { 201'(= {| l |} ) 204'(= r ) } ⊢ { 207'(= {| l |} ) 208'(= r ) 209'(3)◂210' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(202)
	push EXH_63
	MOV_RBX GLX(199),GLX(201)
	MOV_RBX GLX(200),GLX(204)
	call LB_59
	add rsp,8
	MOV_RBX GLX(207),GLX(0)
	MOV_RBX GLX(208),GLX(1)
	MOV_RBX GLX(209),GLX(2)
	MOV_RBX GLX(210),GLX(3)
	pop GLX(202)
;; rsp=0 , %10~209'(3)◂210'%9~208'(= r )%8~207'(= {| l |} )%7~{ }%2~202'(= r )
;; ?; 209'(3)◂210' ⊢ 0(<2)◂{ 211'(= r ) 212'(= r ) }
	cmp GLX(209),0
	jnz LB_64
	push SRC_REG 
	mov SRC_REG,GLX(210)
	add SRC_REG,8
	MOV_RDI GLX(211),SX(0)
	MOV_RDI GLX(212),SX(1)
	pop SRC_REG
	MOV_RAX QWORD [GBG_VCT+8*0],GLX(210)
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %11~{ 211'(= r ) 212'(= r ) }%9~208'(= r )%8~207'(= {| l |} )%7~{ }%2~202'(= r )
; ##37 202'(= r ) ⊢ { 202'(= r ) 213'(= r ) }
	mov rdi,GLX(202)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(213),rax
;; rsp=0 , %13~213'(= r )%12~202'(= r )%11~{ 211'(= r ) 212'(= r ) }%9~208'(= r )%8~207'(= {| l |} )%7~{ }
; ##37 208'(= r ) ⊢ { 208'(= r ) 214'(= r ) }
	mov rdi,GLX(208)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(214),rax
;; rsp=0 , %15~214'(= r )%14~208'(= r )%13~213'(= r )%12~202'(= r )%11~{ 211'(= r ) 212'(= r ) }%8~207'(= {| l |} )%7~{ }
; ##78 { { { } { 211'(= r ) 212'(= r ) } } { 213'(= r ) 214'(= r ) } } ⊢ 223'(3)◂224'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(208)
	MOV_RDI QWORD [rsp+8*1],GLX(207)
	MOV_RDI QWORD [rsp+8*0],GLX(202)
	push EXH_66
	MOV_RBX GLX(215),GLX(211)
	MOV_RBX GLX(216),GLX(212)
	MOV_RBX GLX(217),GLX(213)
	MOV_RBX GLX(218),GLX(214)
	call LB_65
	add rsp,8
	MOV_RBX GLX(223),GLX(0)
	MOV_RBX GLX(224),GLX(1)
	pop GLX(202)
	pop GLX(207)
	pop GLX(208)
;; rsp=0 , %16~223'(3)◂224'%14~208'(= r )%12~202'(= r )%8~207'(= {| l |} )
;; ?; 223'(3)◂224' ⊢ 0(<2)◂{ 225'(= r ) 226'(= r ) }
	cmp GLX(223),0
	jnz LB_67
	push SRC_REG 
	mov SRC_REG,GLX(224)
	add SRC_REG,8
	MOV_RDI GLX(225),SX(0)
	MOV_RDI GLX(226),SX(1)
	pop SRC_REG
	MOV_RAX QWORD [GBG_VCT+8*0],GLX(224)
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %17~{ 225'(= r ) 226'(= r ) }%14~208'(= r )%12~202'(= r )%8~207'(= {| l |} )
; ∎ { 207'(= {| l |} ) 208'(= r ) 0(<2)◂{ 225'(= r ) 226'(= r ) } }
; .dlt.ptn 202'(= r )
	MOV_RBX GLX(0),GLX(207)
	MOV_RBX GLX(1),GLX(208)
	mov GLX(2),0
	ALC_RCD 2, rax
	mov GLX(3),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(225)
	MOV_RDI DX(1),GLX(226)
	pop DST_REG
	ret
LB_67:
;; ?; 223'(3)◂224' ⊢ 1(<2)◂{ }
;; rsp=0 , %14~208'(= r )%12~202'(= r )%8~207'(= {| l |} )
; ##51 208'(= r ) ⊢ { }
;; rsp=0 , %12~202'(= r )%8~207'(= {| l |} )
; ##37 202'(= r ) ⊢ { 202'(= r ) 227'(= r ) }
	mov rdi,GLX(202)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(227),rax
;; rsp=0 , %19~227'(= r )%18~202'(= r )%8~207'(= {| l |} )
; ##77 { 207'(= {| l |} ) 202'(= r ) } ⊢|
; .dlt.ptn 227'(= r )
	MOV_RBX GLX(228),GLX(207)
	MOV_RBX GLX(229),GLX(202)
	jmp JMP_68
LB_64:
;; ?; 209'(3)◂210' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~208'(= r )%8~207'(= {| l |} )%7~{ }%2~202'(= r )
; ##51 208'(= r ) ⊢ { }
;; rsp=0 , %8~207'(= {| l |} )%7~{ }%2~202'(= r )
; ##37 202'(= r ) ⊢ { 202'(= r ) 264'(= r ) }
	mov rdi,GLX(202)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(264),rax
;; rsp=0 , %21~264'(= r )%20~202'(= r )%8~207'(= {| l |} )%7~{ }
; ##77 { 207'(= {| l |} ) 202'(= r ) } ⊢|
; .dlt.ptn 264'(= r )
; .dlt.ptn { }
	MOV_RBX GLX(228),GLX(207)
	MOV_RBX GLX(229),GLX(202)
	jmp JMP_68
LB_62:
;; ?; 206'(3)◂205' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~204'(= r )%4~201'(= {| l |} )%2~202'(= r )
; ##51 204'(= r ) ⊢ { }
;; rsp=0 , %4~201'(= {| l |} )%2~202'(= r )
; ##37 202'(= r ) ⊢ { 202'(= r ) 265'(= r ) }
	mov rdi,GLX(202)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(265),rax
;; rsp=0 , %23~265'(= r )%22~202'(= r )%4~201'(= {| l |} )
; ##77 { 201'(= {| l |} ) 202'(= r ) } ⊢|
; .dlt.ptn 265'(= r )
	MOV_RBX GLX(228),GLX(201)
	MOV_RBX GLX(229),GLX(202)
	jmp JMP_68
EXH_63:
	add rsp,8
	pop rax
	jmp rax
EXH_66:
	add rsp,8
	pop rax
	jmp rax
LB_83: ;; { _r64◂ _r64◂}
	jmp QWORD [LB_86+8*r10]
 ; { _r64◂ _r64◂} { }
LB_86: dq LB_84,LB_85
LB_84:
	EMT_CST LB_88,5
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	EMT_CST fmt_rcd_l,4
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,SX(1)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	pop r8 
	pop SRC_REG
	jmp LB_87
LB_85:
	EMT_CST LB_89,5
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_r,4
	pop r8 
	pop SRC_REG
	jmp LB_87
LB_87:
	ret
LB_95: ;; #83◂◂(_some◂.#56) { { { } } { 280'(= r ) 281'(= r ) } } ⊢ 0'(3)◂1' : ({ { { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_95:
	MOV_RBX GLX(282),GLX(280)
	MOV_RBX GLX(283),GLX(281)
;; rsp=0 , %1~283'(= r )%0~282'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 283'(= r )
; .dlt.ptn 282'(= r )
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_98: ;; #82◂◂(_some◂.#56) { 287'(= {| l |} ) 288'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_98:
	MOV_RBX GLX(289),GLX(287)
	MOV_RBX GLX(290),GLX(288)
;; rsp=0 , %1~290'(= r )%0~289'(= {| l |} )
; ∎ { 289'(= {| l |} ) 290'(= r ) 1(<2)◂{ } }
	MOV_RBX GLX(0),GLX(289)
	MOV_RBX GLX(1),GLX(290)
	mov GLX(2),1
	mov GLX(3),unt
	ret
LB_91: ;; #84◂◂(_some◂.#56) { 270'(= {| l |} ) 271'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_91:
	MOV_RBX GLX(272),GLX(270)
	MOV_RBX GLX(273),GLX(271)
;; rsp=0 , %1~273'(= r )%0~272'(= {| l |} )
; #.#37 273'(= r ) ⊢ { 273'(= r ) 274'(= r ) }
	mov rdi,GLX(273)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(274),rax
;; rsp=0 , %3~274'(= r )%2~273'(= r )%0~272'(= {| l |} )
; #.#44 { 272'(= {| l |} ) 274'(= r ) } ⊢ { 272'(= {| l |} ) 275'(= r ) 277'(3)◂276' }
	mov rdi,GLX(272)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(274)
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_92
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],114
	jnz LB_92
	cmp BYTE [rdi+1],114
	jnz LB_92
	add rax,2
	mov rsi,unt
	mov r10,0
	jmp LB_93
LB_92:
	mov rsi,unt
	mov r10,1
LB_93:
	mov GLX(275),rax
	mov GLX(276),rsi
	mov GLX(277),r10
;; rsp=0 , %6~277'(3)◂276'%5~275'(= r )%4~272'(= {| l |} )%2~273'(= r )
;; ?; 277'(3)◂276' ⊢ 0(<2)◂{ }
	cmp GLX(277),0
	jnz LB_94
;; rsp=0 , %7~{ }%5~275'(= r )%4~272'(= {| l |} )%2~273'(= r )
; #.#37 273'(= r ) ⊢ { 273'(= r ) 278'(= r ) }
	mov rdi,GLX(273)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(278),rax
;; rsp=0 , %9~278'(= r )%8~273'(= r )%7~{ }%5~275'(= r )%4~272'(= {| l |} )
; #.#37 275'(= r ) ⊢ { 275'(= r ) 279'(= r ) }
	mov rdi,GLX(275)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(279),rax
;; rsp=0 , %11~279'(= r )%10~275'(= r )%9~278'(= r )%8~273'(= r )%7~{ }%4~272'(= {| l |} )
; #→[ 83] { { { } } { 278'(= r ) 279'(= r ) } } ⊢ 284'(3)◂285'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(275)
	MOV_RDI QWORD [rsp+8*1],GLX(273)
	MOV_RDI QWORD [rsp+8*0],GLX(272)
	push EXH_96
	MOV_RBX GLX(280),GLX(278)
	MOV_RBX GLX(281),GLX(279)
	call LB_95
	add rsp,8
	MOV_RBX GLX(284),GLX(0)
	MOV_RBX GLX(285),GLX(1)
	pop GLX(272)
	pop GLX(273)
	pop GLX(275)
;; rsp=0 , %12~284'(3)◂285'%10~275'(= r )%8~273'(= r )%4~272'(= {| l |} )
;; ?; 284'(3)◂285' ⊢ 0(<2)◂{ }
	cmp GLX(284),0
	jnz LB_97
;; rsp=0 , %13~{ }%10~275'(= r )%8~273'(= r )%4~272'(= {| l |} )
; ∎ { 272'(= {| l |} ) 275'(= r ) 0(<2)◂{ } }
; .dlt.ptn 273'(= r )
	MOV_RBX GLX(0),GLX(272)
	MOV_RBX GLX(1),GLX(275)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_97:
;; ?; 284'(3)◂285' ⊢ 1(<2)◂{ }
;; rsp=0 , %10~275'(= r )%8~273'(= r )%4~272'(= {| l |} )
; #.#51 275'(= r ) ⊢ { }
;; rsp=0 , %8~273'(= r )%4~272'(= {| l |} )
; #.#37 273'(= r ) ⊢ { 273'(= r ) 286'(= r ) }
	mov rdi,GLX(273)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(286),rax
;; rsp=0 , %15~286'(= r )%14~273'(= r )%4~272'(= {| l |} )
; # ?  { 272'(= {| l |} ) 273'(= r ) } ⊢|
; .dlt.ptn 286'(= r )
	MOV_RBX GLX(287),GLX(272)
	MOV_RBX GLX(288),GLX(273)
	jmp JMP_98
LB_94:
;; ?; 277'(3)◂276' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~275'(= r )%4~272'(= {| l |} )%2~273'(= r )
; #.#51 275'(= r ) ⊢ { }
;; rsp=0 , %4~272'(= {| l |} )%2~273'(= r )
; #.#37 273'(= r ) ⊢ { 273'(= r ) 291'(= r ) }
	mov rdi,GLX(273)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(291),rax
;; rsp=0 , %17~291'(= r )%16~273'(= r )%4~272'(= {| l |} )
; # ?  { 272'(= {| l |} ) 273'(= r ) } ⊢|
; .dlt.ptn 291'(= r )
	MOV_RBX GLX(287),GLX(272)
	MOV_RBX GLX(288),GLX(273)
	jmp JMP_98
EXH_96:
	add rsp,8
	pop rax
	jmp rax
LB_111: ;; #94◂◂(_some◂.#33) { { 312'(= r ) { } 313'(= r ) } { 314'(= r ) 315'(= r ) } } ⊢ 0'(3)◂1' : ({ { _r64◂ { }_r64◂} { _r64◂ _r64◂}}→_opn◂{ _r64◂ _r64◂})
JMP_111:
	MOV_RBX GLX(316),GLX(312)
	MOV_RBX GLX(317),GLX(313)
	MOV_RBX GLX(318),GLX(314)
	MOV_RBX GLX(319),GLX(315)
;; rsp=0 , %3~319'(= r )%2~318'(= r )%1~317'(= r )%0~316'(= r )
; ∎ 0(<2)◂{ 316'(= r ) 317'(= r ) }
; .dlt.ptn 319'(= r )
; .dlt.ptn 318'(= r )
	mov GLX(0),0
	ALC_RCD 2, rax
	mov GLX(1),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(316)
	MOV_RDI DX(1),GLX(317)
	pop DST_REG
	ret
LB_114: ;; #93◂◂(_some◂.#33) { 325'(= {| l |} ) 326'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
JMP_114:
	MOV_RBX GLX(327),GLX(325)
	MOV_RBX GLX(328),GLX(326)
;; rsp=0 , %1~328'(= r )%0~327'(= {| l |} )
; ∎ { 327'(= {| l |} ) 328'(= r ) 1(<2)◂{ } }
	MOV_RBX GLX(0),GLX(327)
	MOV_RBX GLX(1),GLX(328)
	mov GLX(2),1
	mov GLX(3),unt
	ret
LB_101: ;; #95◂◂(_some◂.#33) { 296'(= {| l |} ) 297'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
JMP_101:
	MOV_RBX GLX(298),GLX(296)
	MOV_RBX GLX(299),GLX(297)
;; rsp=0 , %1~299'(= r )%0~298'(= {| l |} )
; #.#37 299'(= r ) ⊢ { 299'(= r ) 300'(= r ) }
	mov rdi,GLX(299)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(300),rax
;; rsp=0 , %3~300'(= r )%2~299'(= r )%0~298'(= {| l |} )
; #.#44 { 298'(= {| l |} ) 300'(= r ) } ⊢ { 298'(= {| l |} ) 301'(= r ) 303'(3)◂302' }
	mov rdi,GLX(298)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(300)
	cmp rax,rdi
	jge LB_102
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_102
	lea rax,[rbx+rsi]
	mov rsi,rdi
	mov r10,0	jmp LB_103
LB_102:
	mov rsi,unt
	mov r10,1 
LB_103:
	mov GLX(301),rax
	mov GLX(302),rsi
	mov GLX(303),r10
;; rsp=0 , %6~303'(3)◂302'%5~301'(= r )%4~298'(= {| l |} )%2~299'(= r )
;; ?; 303'(3)◂302' ⊢ 0(<2)◂302'(= r )
	cmp GLX(303),0
	jnz LB_104
;; rsp=0 , %7~302'(= r )%5~301'(= r )%4~298'(= {| l |} )%2~299'(= r )
; #.#44 { 298'(= {| l |} ) 301'(= r ) } ⊢ { 298'(= {| l |} ) 304'(= r ) 306'(3)◂305' }
	mov rdi,GLX(298)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(301)
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_105
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],116
	jnz LB_105
	add rax,1
	mov rsi,unt
	mov r10,0
	jmp LB_106
LB_105:
	mov rsi,unt
	mov r10,1
LB_106:
	mov GLX(304),rax
	mov GLX(305),rsi
	mov GLX(306),r10
;; rsp=0 , %10~306'(3)◂305'%9~304'(= r )%8~298'(= {| l |} )%7~302'(= r )%2~299'(= r )
;; ?; 306'(3)◂305' ⊢ 0(<2)◂{ }
	cmp GLX(306),0
	jnz LB_107
;; rsp=0 , %11~{ }%9~304'(= r )%8~298'(= {| l |} )%7~302'(= r )%2~299'(= r )
; #.#44 { 298'(= {| l |} ) 304'(= r ) } ⊢ { 298'(= {| l |} ) 307'(= r ) 309'(3)◂308' }
	mov rdi,GLX(298)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(304)
	cmp rax,rdi
	jge LB_108
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_108
	lea rax,[rbx+rsi]
	mov rsi,rdi
	mov r10,0	jmp LB_109
LB_108:
	mov rsi,unt
	mov r10,1 
LB_109:
	mov GLX(307),rax
	mov GLX(308),rsi
	mov GLX(309),r10
;; rsp=0 , %14~309'(3)◂308'%13~307'(= r )%12~298'(= {| l |} )%11~{ }%7~302'(= r )%2~299'(= r )
;; ?; 309'(3)◂308' ⊢ 0(<2)◂308'(= r )
	cmp GLX(309),0
	jnz LB_110
;; rsp=0 , %15~308'(= r )%13~307'(= r )%12~298'(= {| l |} )%11~{ }%7~302'(= r )%2~299'(= r )
; #.#37 299'(= r ) ⊢ { 299'(= r ) 310'(= r ) }
	mov rdi,GLX(299)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(310),rax
;; rsp=0 , %17~310'(= r )%16~299'(= r )%15~308'(= r )%13~307'(= r )%12~298'(= {| l |} )%11~{ }%7~302'(= r )
; #.#37 307'(= r ) ⊢ { 307'(= r ) 311'(= r ) }
	mov rdi,GLX(307)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(311),rax
;; rsp=0 , %19~311'(= r )%18~307'(= r )%17~310'(= r )%16~299'(= r )%15~308'(= r )%12~298'(= {| l |} )%11~{ }%7~302'(= r )
; #→[ 94] { { 302'(= r ) { } 308'(= r ) } { 310'(= r ) 311'(= r ) } } ⊢ 320'(3)◂321'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(307)
	MOV_RDI QWORD [rsp+8*1],GLX(299)
	MOV_RDI QWORD [rsp+8*0],GLX(298)
	push EXH_112
	MOV_RBX GLX(312),GLX(302)
	MOV_RBX GLX(313),GLX(308)
	MOV_RBX GLX(314),GLX(310)
	MOV_RBX GLX(315),GLX(311)
	call LB_111
	add rsp,8
	MOV_RBX GLX(320),GLX(0)
	MOV_RBX GLX(321),GLX(1)
	pop GLX(298)
	pop GLX(299)
	pop GLX(307)
;; rsp=0 , %20~320'(3)◂321'%18~307'(= r )%16~299'(= r )%12~298'(= {| l |} )
;; ?; 320'(3)◂321' ⊢ 0(<2)◂{ 322'(= r ) 323'(= r ) }
	cmp GLX(320),0
	jnz LB_113
	push SRC_REG 
	mov SRC_REG,GLX(321)
	add SRC_REG,8
	MOV_RDI GLX(322),SX(0)
	MOV_RDI GLX(323),SX(1)
	pop SRC_REG
	MOV_RAX QWORD [GBG_VCT+8*0],GLX(321)
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %21~{ 322'(= r ) 323'(= r ) }%18~307'(= r )%16~299'(= r )%12~298'(= {| l |} )
; ∎ { 298'(= {| l |} ) 307'(= r ) 0(<2)◂{ 322'(= r ) 323'(= r ) } }
; .dlt.ptn 299'(= r )
	MOV_RBX GLX(0),GLX(298)
	MOV_RBX GLX(1),GLX(307)
	mov GLX(2),0
	ALC_RCD 2, rax
	mov GLX(3),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(322)
	MOV_RDI DX(1),GLX(323)
	pop DST_REG
	ret
LB_113:
;; ?; 320'(3)◂321' ⊢ 1(<2)◂{ }
;; rsp=0 , %18~307'(= r )%16~299'(= r )%12~298'(= {| l |} )
; #.#51 307'(= r ) ⊢ { }
;; rsp=0 , %16~299'(= r )%12~298'(= {| l |} )
; #.#37 299'(= r ) ⊢ { 299'(= r ) 324'(= r ) }
	mov rdi,GLX(299)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(324),rax
;; rsp=0 , %23~324'(= r )%22~299'(= r )%12~298'(= {| l |} )
; # ?  { 298'(= {| l |} ) 299'(= r ) } ⊢|
; .dlt.ptn 324'(= r )
	MOV_RBX GLX(325),GLX(298)
	MOV_RBX GLX(326),GLX(299)
	jmp JMP_114
LB_110:
;; ?; 309'(3)◂308' ⊢ 1(<2)◂{ }
;; rsp=0 , %13~307'(= r )%12~298'(= {| l |} )%11~{ }%7~302'(= r )%2~299'(= r )
; #.#51 307'(= r ) ⊢ { }
;; rsp=0 , %12~298'(= {| l |} )%11~{ }%7~302'(= r )%2~299'(= r )
; #.#37 299'(= r ) ⊢ { 299'(= r ) 329'(= r ) }
	mov rdi,GLX(299)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(329),rax
;; rsp=0 , %25~329'(= r )%24~299'(= r )%12~298'(= {| l |} )%11~{ }%7~302'(= r )
; # ?  { 298'(= {| l |} ) 299'(= r ) } ⊢|
; .dlt.ptn 329'(= r )
; .dlt.ptn { }
; .dlt.ptn 302'(= r )
	MOV_RBX GLX(325),GLX(298)
	MOV_RBX GLX(326),GLX(299)
	jmp JMP_114
LB_107:
;; ?; 306'(3)◂305' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~304'(= r )%8~298'(= {| l |} )%7~302'(= r )%2~299'(= r )
; #.#51 304'(= r ) ⊢ { }
;; rsp=0 , %8~298'(= {| l |} )%7~302'(= r )%2~299'(= r )
; #.#37 299'(= r ) ⊢ { 299'(= r ) 330'(= r ) }
	mov rdi,GLX(299)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(330),rax
;; rsp=0 , %27~330'(= r )%26~299'(= r )%8~298'(= {| l |} )%7~302'(= r )
; # ?  { 298'(= {| l |} ) 299'(= r ) } ⊢|
; .dlt.ptn 330'(= r )
; .dlt.ptn 302'(= r )
	MOV_RBX GLX(325),GLX(298)
	MOV_RBX GLX(326),GLX(299)
	jmp JMP_114
LB_104:
;; ?; 303'(3)◂302' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~301'(= r )%4~298'(= {| l |} )%2~299'(= r )
; #.#51 301'(= r ) ⊢ { }
;; rsp=0 , %4~298'(= {| l |} )%2~299'(= r )
; #.#37 299'(= r ) ⊢ { 299'(= r ) 331'(= r ) }
	mov rdi,GLX(299)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(331),rax
;; rsp=0 , %29~331'(= r )%28~299'(= r )%4~298'(= {| l |} )
; # ?  { 298'(= {| l |} ) 299'(= r ) } ⊢|
; .dlt.ptn 331'(= r )
	MOV_RBX GLX(325),GLX(298)
	MOV_RBX GLX(326),GLX(299)
	jmp JMP_114
EXH_112:
	add rsp,8
	pop rax
	jmp rax
RTM_0:
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 17r ] } ⊢ { %[ "dABCiei" ] 128'(= r ) 130'(3)◂129' }
	mov rdi,7
	lea rsi,[LB_0]
	mov rax,17
	cmp rax,rdi
	jge LB_1
	movzx rsi,BYTE [rsi+rax]
	add rax,1 
	mov r10,0 
	jmp LB_2
LB_1:
	mov rsi,unt
	mov r10,1
LB_2:
	mov GLX(128),rax
	mov GLX(129),rsi
	mov GLX(130),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %3~130'(3)◂129'%2~128'(= r )%0~127'(= {| ? |} )
; ##8 { 128'(= r ) 130'(3)◂129' } ⊢ { 128'(= r ) 130'(3)◂129' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(128)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(130)
	mov r8,GLX(129)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_10,29
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 128'(= r ) 130'(3)◂129' }
	C_PUSH_REGS
	mov r10,GLX(130)
	mov r8,GLX(129)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 1r ] } ⊢ { %[ "dABCiei" ] 131'(= r ) 133'(3)◂132' }
	mov rdi,7
	lea rsi,[LB_11]
	mov rax,1
	lea rdi,[rdi-3]
	cmp rax,rdi
	jg LB_12
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],65
	jnz LB_12
	cmp BYTE [rdi+1],66
	jnz LB_12
	cmp BYTE [rdi+2],67
	jnz LB_12
	add rax,3
	mov rsi,unt
	mov r10,0
	jmp LB_13
LB_12:
	mov rsi,unt
	mov r10,1
LB_13:
	mov GLX(131),rax
	mov GLX(132),rsi
	mov GLX(133),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %7~133'(3)◂132'%6~131'(= r )%0~127'(= {| ? |} )
; ##8 { 131'(= r ) 133'(3)◂132' } ⊢ { 131'(= r ) 133'(3)◂132' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(131)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(133)
	mov r8,GLX(132)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_21,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 131'(= r ) 133'(3)◂132' }
	C_PUSH_REGS
	mov r10,GLX(133)
	mov r8,GLX(132)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "Abd" ] %[ 0r ] } ⊢ { 156'(= {| l |} ) 157'(= r ) 158'(3)◂159' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_30
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],3
	C_CALL_SF calloc
	mov QWORD [rax],3
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],98
	mov BYTE [rax+8+2],100
	mov GLX(134),rax
	mov rax,0
	mov GLX(135),rax
	call LB_22
	add rsp,8
	MOV_RBX GLX(156),GLX(0)
	MOV_RBX GLX(157),GLX(1)
	MOV_RBX GLX(158),GLX(2)
	MOV_RBX GLX(159),GLX(3)
	pop GLX(127)
; .dlt.ptn 156'(= {| l |} )
	mov rdi,GLX(156)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %11~158'(3)◂159'%10~157'(= r )%0~127'(= {| ? |} )
; ##8 { 157'(= r ) 158'(3)◂159' } ⊢ { 157'(= r ) 158'(3)◂159' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(157)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(158)
	mov r8,GLX(159)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_31,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 157'(= r ) 158'(3)◂159' }
	C_PUSH_REGS
	mov r10,GLX(158)
	mov r8,GLX(159)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "87383" ] %[ 0r ] } ⊢ { %[ "87383" ] 160'(= r ) 162'(3)◂161' }
	mov rdi,5
	lea rsi,[LB_32]
	mov rax,0
	cmp rax,rdi
	jge LB_33
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_33
	lea rax,[rbx+rsi]
	mov rsi,rdi
	mov r10,0	jmp LB_34
LB_33:
	mov rsi,unt
	mov r10,1 
LB_34:
	mov GLX(160),rax
	mov GLX(161),rsi
	mov GLX(162),r10
; .dlt.ptn %[ "87383" ]
;; rsp=0 , %15~162'(3)◂161'%14~160'(= r )%0~127'(= {| ? |} )
; ##8 { 160'(= r ) 162'(3)◂161' } ⊢ { 160'(= r ) 162'(3)◂161' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(160)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(162)
	mov r8,GLX(161)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_35,29
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 160'(= r ) 162'(3)◂161' }
	C_PUSH_REGS
	mov r10,GLX(162)
	mov r8,GLX(161)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "   \t\nkk" ] %[ 0r ] } ⊢ { %[ "   \t\nkk" ] 163'(= r ) 165'(3)◂164' }
	mov rdi,7
	lea rsi,[LB_36]
	mov rax,0
	jmp LB_38
LB_37:
	add rax,1 
LB_38:
	cmp rax,rdi
	jge LB_39
	JZ_LINE_SPC BYTE [rsi+rax], LB_37
LB_39:
	mov rsi,unt
	mov r10,0
	mov GLX(163),rax
	mov GLX(164),rsi
	mov GLX(165),r10
; .dlt.ptn %[ "   \t\nkk" ]
;; rsp=0 , %19~165'(3)◂164'%18~163'(= r )%0~127'(= {| ? |} )
; ##8 { 163'(= r ) 165'(3)◂164' } ⊢ { 163'(= r ) 165'(3)◂164' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(163)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(165)
	mov r8,GLX(164)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_40,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 163'(= r ) 165'(3)◂164' }
	C_PUSH_REGS
	mov r10,GLX(165)
	mov r8,GLX(164)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "   \t\nkk" ] %[ 0r ] } ⊢ { %[ "   \t\nkk" ] 166'(= r ) 168'(3)◂167' }
	mov rdi,7
	lea rsi,[LB_41]
	mov rax,0
	jmp LB_43
LB_42:
	add rax,1 
LB_43:
	cmp rax,rdi
	jge LB_44
	JZ_SPC BYTE [rsi+rax], LB_42
LB_44:
	mov rsi,unt
	mov r10,0
	mov GLX(166),rax
	mov GLX(167),rsi
	mov GLX(168),r10
; .dlt.ptn %[ "   \t\nkk" ]
;; rsp=0 , %23~168'(3)◂167'%22~166'(= r )%0~127'(= {| ? |} )
; ##8 { 166'(= r ) 168'(3)◂167' } ⊢ { 166'(= r ) 168'(3)◂167' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(166)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(168)
	mov r8,GLX(167)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_45,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 166'(= r ) 168'(3)◂167' }
	C_PUSH_REGS
	mov r10,GLX(168)
	mov r8,GLX(167)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "ffvv" ] %[ 0r ] } ⊢ { 195'(= {| l |} ) 196'(= r ) 197'(3)◂198' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_57
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],4
	C_CALL_SF calloc
	mov QWORD [rax],4
	mov BYTE [rax+8+0],102
	mov BYTE [rax+8+1],102
	mov BYTE [rax+8+2],118
	mov BYTE [rax+8+3],118
	mov GLX(169),rax
	mov rax,0
	mov GLX(170),rax
	call LB_46
	add rsp,8
	MOV_RBX GLX(195),GLX(0)
	MOV_RBX GLX(196),GLX(1)
	MOV_RBX GLX(197),GLX(2)
	MOV_RBX GLX(198),GLX(3)
	pop GLX(127)
; .dlt.ptn 195'(= {| l |} )
	mov rdi,GLX(195)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %27~197'(3)◂198'%26~196'(= r )%0~127'(= {| ? |} )
; ##8 { 196'(= r ) 197'(3)◂198' } ⊢ { 196'(= r ) 197'(3)◂198' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(196)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(197)
	mov r8,GLX(198)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_58,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 196'(= r ) 197'(3)◂198' }
	C_PUSH_REGS
	mov r10,GLX(197)
	mov r8,GLX(198)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "97898723q928ffe" ] %[ 0r ] } ⊢ { 266'(= {| l |} ) 267'(= r ) 268'(3)◂269' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_82
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	add QWORD [S8_N],15
	C_CALL_SF calloc
	mov QWORD [rax],15
	mov BYTE [rax+8+0],57
	mov BYTE [rax+8+1],55
	mov BYTE [rax+8+2],56
	mov BYTE [rax+8+3],57
	mov BYTE [rax+8+4],56
	mov BYTE [rax+8+5],55
	mov BYTE [rax+8+6],50
	mov BYTE [rax+8+7],51
	mov BYTE [rax+8+8],113
	mov BYTE [rax+8+9],57
	mov BYTE [rax+8+10],50
	mov BYTE [rax+8+11],56
	mov BYTE [rax+8+12],102
	mov BYTE [rax+8+13],102
	mov BYTE [rax+8+14],101
	mov GLX(199),rax
	mov rax,0
	mov GLX(200),rax
	call LB_59
	add rsp,8
	MOV_RBX GLX(266),GLX(0)
	MOV_RBX GLX(267),GLX(1)
	MOV_RBX GLX(268),GLX(2)
	MOV_RBX GLX(269),GLX(3)
	pop GLX(127)
; .dlt.ptn 266'(= {| l |} )
	mov rdi,GLX(266)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %31~268'(3)◂269'%30~267'(= r )%0~127'(= {| ? |} )
; ##8 { 267'(= r ) 268'(3)◂269' } ⊢ { 267'(= r ) 268'(3)◂269' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(267)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(268)
	mov r8,GLX(269)
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_83
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_90,40
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 267'(= r ) 268'(3)◂269' }
	C_PUSH_REGS
	mov r10,GLX(268)
	mov r8,GLX(269)
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_83
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "rr97898723q928ffe" ] %[ 0r ] } ⊢ { 292'(= {| l |} ) 293'(= r ) 294'(3)◂295' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_99
	mov rsi,1  
	mov rdi,32
	xor rax,rax 
	add QWORD [S8_N],17
	C_CALL_SF calloc
	mov QWORD [rax],17
	mov BYTE [rax+8+0],114
	mov BYTE [rax+8+1],114
	mov BYTE [rax+8+2],57
	mov BYTE [rax+8+3],55
	mov BYTE [rax+8+4],56
	mov BYTE [rax+8+5],57
	mov BYTE [rax+8+6],56
	mov BYTE [rax+8+7],55
	mov BYTE [rax+8+8],50
	mov BYTE [rax+8+9],51
	mov BYTE [rax+8+10],113
	mov BYTE [rax+8+11],57
	mov BYTE [rax+8+12],50
	mov BYTE [rax+8+13],56
	mov BYTE [rax+8+14],102
	mov BYTE [rax+8+15],102
	mov BYTE [rax+8+16],101
	mov GLX(270),rax
	mov rax,0
	mov GLX(271),rax
	call LB_91
	add rsp,8
	MOV_RBX GLX(292),GLX(0)
	MOV_RBX GLX(293),GLX(1)
	MOV_RBX GLX(294),GLX(2)
	MOV_RBX GLX(295),GLX(3)
	pop GLX(127)
; .dlt.ptn 292'(= {| l |} )
	mov rdi,GLX(292)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %35~294'(3)◂295'%34~293'(= r )%0~127'(= {| ? |} )
; ##8 { 293'(= r ) 294'(3)◂295' } ⊢ { 293'(= r ) 294'(3)◂295' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(293)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(294)
	mov r8,GLX(295)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_100,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 293'(= r ) 294'(3)◂295' }
	C_PUSH_REGS
	mov r10,GLX(294)
	mov r8,GLX(295)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "97898723t928ffe" ] %[ 0r ] } ⊢ { 332'(= {| l |} ) 333'(= r ) 334'(3)◂335' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_115
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	add QWORD [S8_N],15
	C_CALL_SF calloc
	mov QWORD [rax],15
	mov BYTE [rax+8+0],57
	mov BYTE [rax+8+1],55
	mov BYTE [rax+8+2],56
	mov BYTE [rax+8+3],57
	mov BYTE [rax+8+4],56
	mov BYTE [rax+8+5],55
	mov BYTE [rax+8+6],50
	mov BYTE [rax+8+7],51
	mov BYTE [rax+8+8],116
	mov BYTE [rax+8+9],57
	mov BYTE [rax+8+10],50
	mov BYTE [rax+8+11],56
	mov BYTE [rax+8+12],102
	mov BYTE [rax+8+13],102
	mov BYTE [rax+8+14],101
	mov GLX(296),rax
	mov rax,0
	mov GLX(297),rax
	call LB_101
	add rsp,8
	MOV_RBX GLX(332),GLX(0)
	MOV_RBX GLX(333),GLX(1)
	MOV_RBX GLX(334),GLX(2)
	MOV_RBX GLX(335),GLX(3)
	pop GLX(127)
; .dlt.ptn 332'(= {| l |} )
	mov rdi,GLX(332)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %39~334'(3)◂335'%38~333'(= r )%0~127'(= {| ? |} )
; ##8 { 333'(= r ) 334'(3)◂335' } ⊢ { 333'(= r ) 334'(3)◂335' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(333)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(334)
	mov r8,GLX(335)
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_83
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_116,40
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 333'(= r ) 334'(3)◂335' }
	C_PUSH_REGS
	mov r10,GLX(334)
	mov r8,GLX(335)
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_83
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 7r ] } ⊢ { %[ "dABCiei" ] 336'(= r ) 338'(3)◂337' }
	mov rdi,7
	lea rsi,[LB_117]
	mov rax,7
	cmp rax,rdi
	jge LB_118
	movzx rsi,BYTE [rsi+rax]
	add rax,1 
	mov r10,0 
	jmp LB_119
LB_118:
	mov rsi,unt
	mov r10,1
LB_119:
	mov GLX(336),rax
	mov GLX(337),rsi
	mov GLX(338),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %43~338'(3)◂337'%42~336'(= r )%0~127'(= {| ? |} )
; ##8 { 336'(= r ) 338'(3)◂337' } ⊢ { 336'(= r ) 338'(3)◂337' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(336)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(338)
	mov r8,GLX(337)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_120,29
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 336'(= r ) 338'(3)◂337' }
	C_PUSH_REGS
	mov r10,GLX(338)
	mov r8,GLX(337)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 6r ] } ⊢ { %[ "dABCiei" ] 339'(= r ) 341'(3)◂340' }
	mov rdi,7
	lea rsi,[LB_121]
	mov rax,6
	cmp rax,rdi
	jge LB_122
	movzx rsi,BYTE [rsi+rax]
	add rax,1 
	mov r10,0 
	jmp LB_123
LB_122:
	mov rsi,unt
	mov r10,1
LB_123:
	mov GLX(339),rax
	mov GLX(340),rsi
	mov GLX(341),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %47~341'(3)◂340'%46~339'(= r )%0~127'(= {| ? |} )
; ##8 { 339'(= r ) 341'(3)◂340' } ⊢ { 339'(= r ) 341'(3)◂340' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(339)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(341)
	mov r8,GLX(340)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_124,29
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 339'(= r ) 341'(3)◂340' }
	C_PUSH_REGS
	mov r10,GLX(341)
	mov r8,GLX(340)
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 7r ] } ⊢ { %[ "dABCiei" ] 342'(= r ) 344'(3)◂343' }
	mov rdi,7
	lea rsi,[LB_125]
	mov rax,7
	jmp LB_127
LB_126:
	add rax,1 
LB_127:
	cmp rax,rdi
	jge LB_128
	JZ_SPC BYTE [rsi+rax], LB_126
LB_128:
	mov rsi,unt
	mov r10,0
	mov GLX(342),rax
	mov GLX(343),rsi
	mov GLX(344),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %51~344'(3)◂343'%50~342'(= r )%0~127'(= {| ? |} )
; ##8 { 342'(= r ) 344'(3)◂343' } ⊢ { 342'(= r ) 344'(3)◂343' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(342)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(344)
	mov r8,GLX(343)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_129,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 342'(= r ) 344'(3)◂343' }
	C_PUSH_REGS
	mov r10,GLX(344)
	mov r8,GLX(343)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 6r ] } ⊢ { %[ "dABCiei" ] 345'(= r ) 347'(3)◂346' }
	mov rdi,7
	lea rsi,[LB_130]
	mov rax,6
	jmp LB_132
LB_131:
	add rax,1 
LB_132:
	cmp rax,rdi
	jge LB_133
	JZ_SPC BYTE [rsi+rax], LB_131
LB_133:
	mov rsi,unt
	mov r10,0
	mov GLX(345),rax
	mov GLX(346),rsi
	mov GLX(347),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %55~347'(3)◂346'%54~345'(= r )%0~127'(= {| ? |} )
; ##8 { 345'(= r ) 347'(3)◂346' } ⊢ { 345'(= r ) 347'(3)◂346' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(345)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(347)
	mov r8,GLX(346)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_134,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 345'(= r ) 347'(3)◂346' }
	C_PUSH_REGS
	mov r10,GLX(347)
	mov r8,GLX(346)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 7r ] } ⊢ { %[ "dABCiei" ] 348'(= r ) 350'(3)◂349' }
	mov rdi,7
	lea rsi,[LB_135]
	mov rax,7
	jmp LB_137
LB_136:
	add rax,1 
LB_137:
	cmp rax,rdi
	jge LB_138
	JZ_LINE_SPC BYTE [rsi+rax], LB_136
LB_138:
	mov rsi,unt
	mov r10,0
	mov GLX(348),rax
	mov GLX(349),rsi
	mov GLX(350),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %59~350'(3)◂349'%58~348'(= r )%0~127'(= {| ? |} )
; ##8 { 348'(= r ) 350'(3)◂349' } ⊢ { 348'(= r ) 350'(3)◂349' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(348)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(350)
	mov r8,GLX(349)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_139,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 348'(= r ) 350'(3)◂349' }
	C_PUSH_REGS
	mov r10,GLX(350)
	mov r8,GLX(349)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 6r ] } ⊢ { %[ "dABCiei" ] 351'(= r ) 353'(3)◂352' }
	mov rdi,7
	lea rsi,[LB_140]
	mov rax,6
	jmp LB_142
LB_141:
	add rax,1 
LB_142:
	cmp rax,rdi
	jge LB_143
	JZ_LINE_SPC BYTE [rsi+rax], LB_141
LB_143:
	mov rsi,unt
	mov r10,0
	mov GLX(351),rax
	mov GLX(352),rsi
	mov GLX(353),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %63~353'(3)◂352'%62~351'(= r )%0~127'(= {| ? |} )
; ##8 { 351'(= r ) 353'(3)◂352' } ⊢ { 351'(= r ) 353'(3)◂352' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(351)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(353)
	mov r8,GLX(352)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_144,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 351'(= r ) 353'(3)◂352' }
	C_PUSH_REGS
	mov r10,GLX(353)
	mov r8,GLX(352)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 8r ] } ⊢ { %[ "dABCiei" ] 354'(= r ) 356'(3)◂355' }
	mov rdi,7
	lea rsi,[LB_145]
	mov rax,8
	jmp LB_147
LB_146:
	add rax,1 
LB_147:
	cmp rax,rdi
	jge LB_148
	JZ_LINE_SPC BYTE [rsi+rax], LB_146
LB_148:
	mov rsi,unt
	mov r10,0
	mov GLX(354),rax
	mov GLX(355),rsi
	mov GLX(356),r10
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %67~356'(3)◂355'%66~354'(= r )%0~127'(= {| ? |} )
; ##8 { 354'(= r ) 356'(3)◂355' } ⊢ { 354'(= r ) 356'(3)◂355' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(354)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(356)
	mov r8,GLX(355)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_149,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 354'(= r ) 356'(3)◂355' }
	C_PUSH_REGS
	mov r10,GLX(356)
	mov r8,GLX(355)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei   " ] %[ 7r ] } ⊢ { %[ "dABCiei   " ] 357'(= r ) 359'(3)◂358' }
	mov rdi,10
	lea rsi,[LB_150]
	mov rax,7
	jmp LB_152
LB_151:
	add rax,1 
LB_152:
	cmp rax,rdi
	jge LB_153
	JZ_LINE_SPC BYTE [rsi+rax], LB_151
LB_153:
	mov rsi,unt
	mov r10,0
	mov GLX(357),rax
	mov GLX(358),rsi
	mov GLX(359),r10
; .dlt.ptn %[ "dABCiei   " ]
;; rsp=0 , %71~359'(3)◂358'%70~357'(= r )%0~127'(= {| ? |} )
; ##8 { 357'(= r ) 359'(3)◂358' } ⊢ { 357'(= r ) 359'(3)◂358' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(357)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(359)
	mov r8,GLX(358)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_154,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 357'(= r ) 359'(3)◂358' }
	C_PUSH_REGS
	mov r10,GLX(359)
	mov r8,GLX(358)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; ∎
	jmp RTM_1
EXH_30:
	add rsp,8
	pop rax
	jmp rax
EXH_57:
	add rsp,8
	pop rax
	jmp rax
EXH_82:
	add rsp,8
	pop rax
	jmp rax
EXH_99:
	add rsp,8
	pop rax
	jmp rax
EXH_115:
	add rsp,8
	pop rax
	jmp rax
LB_161: ;; #130◂◂(_none◂{}) { { { } { } } { 374'(= r ) 375'(= r ) } } ⊢ 0'(3)◂1' : ({ { { } { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_161:
	MOV_RBX GLX(376),GLX(374)
	MOV_RBX GLX(377),GLX(375)
;; rsp=0 , %2~377'(= r )%1~376'(= r )%0~{ }
; ∎ 0(<2)◂{ }
; .dlt.ptn 377'(= r )
; .dlt.ptn 376'(= r )
; .dlt.ptn { }
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_170: ;; #128◂◂(_none◂{}) { { { } { } } { 395'(= r ) 396'(= r ) } } ⊢ 0'(3)◂1' : ({ { { } { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_170:
	MOV_RBX GLX(397),GLX(395)
	MOV_RBX GLX(398),GLX(396)
;; rsp=0 , %2~398'(= r )%1~397'(= r )%0~{ }
; ∎ 0(<2)◂{ }
; .dlt.ptn 398'(= r )
; .dlt.ptn 397'(= r )
; .dlt.ptn { }
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_179: ;; #126◂◂(_none◂{}) { { { } { } } { 416'(= r ) 417'(= r ) } } ⊢ 0'(3)◂1' : ({ { { } { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_179:
	MOV_RBX GLX(418),GLX(416)
	MOV_RBX GLX(419),GLX(417)
;; rsp=0 , %2~419'(= r )%1~418'(= r )%0~{ }
; ∎ 0(<2)◂{ }
; .dlt.ptn 419'(= r )
; .dlt.ptn 418'(= r )
; .dlt.ptn { }
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_188: ;; #124◂◂(_none◂{}) { { { } { } } { 437'(= r ) 438'(= r ) } } ⊢ 0'(3)◂1' : ({ { { } { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_188:
	MOV_RBX GLX(439),GLX(437)
	MOV_RBX GLX(440),GLX(438)
;; rsp=0 , %2~440'(= r )%1~439'(= r )%0~{ }
; ∎ 0(<2)◂{ }
; .dlt.ptn 440'(= r )
; .dlt.ptn 439'(= r )
; .dlt.ptn { }
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_197: ;; #122◂◂(_none◂{}) { { 458'(= r ) { } } { 459'(= r ) 460'(= r ) } } ⊢ 0'(3)◂1' : ({ { _r64◂ { }} { _r64◂ _r64◂}}→_opn◂{ })
JMP_197:
	MOV_RBX GLX(461),GLX(458)
	MOV_RBX GLX(462),GLX(459)
	MOV_RBX GLX(463),GLX(460)
;; rsp=0 , %3~463'(= r )%2~462'(= r )%1~{ }%0~461'(= r )
	cmp GLX(461),0
	jnz LB_200
	jmp LB_199
LB_200:
	jmp LB_198
LB_199:
;; rsp=0 , %3~463'(= r )%2~462'(= r )%1~{ }%0~461'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 463'(= r )
; .dlt.ptn 462'(= r )
; .dlt.ptn { }
; .dlt.ptn 461'(= r )
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_198:
;; rsp=0 , %3~463'(= r )%2~462'(= r )%1~{ }%0~461'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 463'(= r )
; .dlt.ptn 462'(= r )
; .dlt.ptn { }
; .dlt.ptn 461'(= r )
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_204: ;; #120◂◂(_none◂{}) { { } { 474'(= r ) 475'(= r ) } } ⊢ 0'(3)◂1' : ({ { } { _r64◂ _r64◂}}→_opn◂{ })
JMP_204:
	MOV_RBX GLX(476),GLX(474)
	MOV_RBX GLX(477),GLX(475)
;; rsp=0 , %1~477'(= r )%0~476'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 477'(= r )
; .dlt.ptn 476'(= r )
	mov GLX(0),0
	mov GLX(1),unt
	ret
LB_207: ;; #119◂◂(_none◂{}) { 481'(= {| l |} ) 482'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_207:
	MOV_RBX GLX(483),GLX(481)
	MOV_RBX GLX(484),GLX(482)
;; rsp=0 , %1~484'(= r )%0~483'(= {| l |} )
; ∎ { 483'(= {| l |} ) 484'(= r ) 1(<2)◂{ } }
	MOV_RBX GLX(0),GLX(483)
	MOV_RBX GLX(1),GLX(484)
	mov GLX(2),1
	mov GLX(3),unt
	ret
LB_203: ;; #121◂◂(_none◂{}) { 467'(= {| l |} ) 468'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_203:
	MOV_RBX GLX(469),GLX(467)
	MOV_RBX GLX(470),GLX(468)
;; rsp=0 , %1~470'(= r )%0~469'(= {| l |} )
; ##37 470'(= r ) ⊢ { 470'(= r ) 471'(= r ) }
	mov rdi,GLX(470)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(471),rax
;; rsp=0 , %3~471'(= r )%2~470'(= r )%0~469'(= {| l |} )
; ##37 470'(= r ) ⊢ { 470'(= r ) 472'(= r ) }
	mov rdi,GLX(470)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(472),rax
;; rsp=0 , %5~472'(= r )%4~470'(= r )%3~471'(= r )%0~469'(= {| l |} )
; ##37 471'(= r ) ⊢ { 471'(= r ) 473'(= r ) }
	mov rdi,GLX(471)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(473),rax
;; rsp=0 , %7~473'(= r )%6~471'(= r )%5~472'(= r )%4~470'(= r )%0~469'(= {| l |} )
; ##120 { { } { 472'(= r ) 473'(= r ) } } ⊢ 478'(3)◂479'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(471)
	MOV_RDI QWORD [rsp+8*1],GLX(470)
	MOV_RDI QWORD [rsp+8*0],GLX(469)
	push EXH_205
	MOV_RBX GLX(474),GLX(472)
	MOV_RBX GLX(475),GLX(473)
	call LB_204
	add rsp,8
	MOV_RBX GLX(478),GLX(0)
	MOV_RBX GLX(479),GLX(1)
	pop GLX(469)
	pop GLX(470)
	pop GLX(471)
;; rsp=0 , %8~478'(3)◂479'%6~471'(= r )%4~470'(= r )%0~469'(= {| l |} )
;; ?; 478'(3)◂479' ⊢ 0(<2)◂{ }
	cmp GLX(478),0
	jnz LB_206
;; rsp=0 , %9~{ }%6~471'(= r )%4~470'(= r )%0~469'(= {| l |} )
; ∎ { 469'(= {| l |} ) 471'(= r ) 0(<2)◂{ } }
; .dlt.ptn 470'(= r )
	MOV_RBX GLX(0),GLX(469)
	MOV_RBX GLX(1),GLX(471)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_206:
;; ?; 478'(3)◂479' ⊢ 1(<2)◂{ }
;; rsp=0 , %6~471'(= r )%4~470'(= r )%0~469'(= {| l |} )
; ##51 471'(= r ) ⊢ { }
;; rsp=0 , %4~470'(= r )%0~469'(= {| l |} )
; ##37 470'(= r ) ⊢ { 470'(= r ) 480'(= r ) }
	mov rdi,GLX(470)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(480),rax
;; rsp=0 , %11~480'(= r )%10~470'(= r )%0~469'(= {| l |} )
; ##119 { 469'(= {| l |} ) 470'(= r ) } ⊢|
; .dlt.ptn 480'(= r )
	MOV_RBX GLX(481),GLX(469)
	MOV_RBX GLX(482),GLX(470)
	jmp JMP_207
EXH_205:
	add rsp,8
	pop rax
	jmp rax
LB_191: ;; #123◂◂(_none◂{}) { 444'(= {| l |} ) 445'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_191:
	MOV_RBX GLX(446),GLX(444)
	MOV_RBX GLX(447),GLX(445)
;; rsp=0 , %1~447'(= r )%0~446'(= {| l |} )
; ##37 447'(= r ) ⊢ { 447'(= r ) 448'(= r ) }
	mov rdi,GLX(447)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(448),rax
;; rsp=0 , %3~448'(= r )%2~447'(= r )%0~446'(= {| l |} )
; # ?  { 446'(= {| l |} ) 448'(= r ) } ⊢ { 446'(= {| l |} ) 449'(= r ) 451'(3)◂450' }
	mov rdi,GLX(446)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(448)
	cmp rax,rdi
	jge LB_192
	movzx rsi,BYTE [rsi+rax]
	add rax,1 
	mov r10,0 
	jmp LB_193
LB_192:
	mov rsi,unt
	mov r10,1
LB_193:
	mov GLX(449),rax
	mov GLX(450),rsi
	mov GLX(451),r10
;; rsp=0 , %6~451'(3)◂450'%5~449'(= r )%4~446'(= {| l |} )%2~447'(= r )
;; ?; 451'(3)◂450' ⊢ 0(<2)◂450'(= r )
	cmp GLX(451),0
	jnz LB_194
;; rsp=0 , %7~450'(= r )%5~449'(= r )%4~446'(= {| l |} )%2~447'(= r )
; # ?  { 446'(= {| l |} ) 449'(= r ) } ⊢ { 452'(= {| l |} ) 453'(= r ) 454'(3)◂455' }
	lea rsp,[rsp-8*2]
	MOV_RDI QWORD [rsp+8*1],GLX(450)
	MOV_RDI QWORD [rsp+8*0],GLX(447)
	push EXH_195
	MOV_RBX GLX(360),GLX(446)
	MOV_RBX GLX(361),GLX(449)
	call LB_155
	add rsp,8
	MOV_RBX GLX(452),GLX(0)
	MOV_RBX GLX(453),GLX(1)
	MOV_RBX GLX(454),GLX(2)
	MOV_RBX GLX(455),GLX(3)
	pop GLX(447)
	pop GLX(450)
;; rsp=0 , %10~454'(3)◂455'%9~453'(= r )%8~452'(= {| l |} )%7~450'(= r )%2~447'(= r )
;; ?; 454'(3)◂455' ⊢ 0(<2)◂{ }
	cmp GLX(454),0
	jnz LB_196
;; rsp=0 , %11~{ }%9~453'(= r )%8~452'(= {| l |} )%7~450'(= r )%2~447'(= r )
; ##37 447'(= r ) ⊢ { 447'(= r ) 456'(= r ) }
	mov rdi,GLX(447)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(456),rax
;; rsp=0 , %13~456'(= r )%12~447'(= r )%11~{ }%9~453'(= r )%8~452'(= {| l |} )%7~450'(= r )
; ##37 453'(= r ) ⊢ { 453'(= r ) 457'(= r ) }
	mov rdi,GLX(453)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(457),rax
;; rsp=0 , %15~457'(= r )%14~453'(= r )%13~456'(= r )%12~447'(= r )%11~{ }%8~452'(= {| l |} )%7~450'(= r )
; ##122 { { 450'(= r ) { } } { 456'(= r ) 457'(= r ) } } ⊢ 464'(3)◂465'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(453)
	MOV_RDI QWORD [rsp+8*1],GLX(452)
	MOV_RDI QWORD [rsp+8*0],GLX(447)
	push EXH_201
	MOV_RBX GLX(458),GLX(450)
	MOV_RBX GLX(459),GLX(456)
	MOV_RBX GLX(460),GLX(457)
	call LB_197
	add rsp,8
	MOV_RBX GLX(464),GLX(0)
	MOV_RBX GLX(465),GLX(1)
	pop GLX(447)
	pop GLX(452)
	pop GLX(453)
;; rsp=0 , %16~464'(3)◂465'%14~453'(= r )%12~447'(= r )%8~452'(= {| l |} )
;; ?; 464'(3)◂465' ⊢ 0(<2)◂{ }
	cmp GLX(464),0
	jnz LB_202
;; rsp=0 , %17~{ }%14~453'(= r )%12~447'(= r )%8~452'(= {| l |} )
; ∎ { 452'(= {| l |} ) 453'(= r ) 0(<2)◂{ } }
; .dlt.ptn 447'(= r )
	MOV_RBX GLX(0),GLX(452)
	MOV_RBX GLX(1),GLX(453)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_202:
;; ?; 464'(3)◂465' ⊢ 1(<2)◂{ }
;; rsp=0 , %14~453'(= r )%12~447'(= r )%8~452'(= {| l |} )
; ##51 453'(= r ) ⊢ { }
;; rsp=0 , %12~447'(= r )%8~452'(= {| l |} )
; ##37 447'(= r ) ⊢ { 447'(= r ) 466'(= r ) }
	mov rdi,GLX(447)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(466),rax
;; rsp=0 , %19~466'(= r )%18~447'(= r )%8~452'(= {| l |} )
; ##121 { 452'(= {| l |} ) 447'(= r ) } ⊢|
; .dlt.ptn 466'(= r )
	MOV_RBX GLX(467),GLX(452)
	MOV_RBX GLX(468),GLX(447)
	jmp JMP_203
LB_196:
;; ?; 454'(3)◂455' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~453'(= r )%8~452'(= {| l |} )%7~450'(= r )%2~447'(= r )
; ##51 453'(= r ) ⊢ { }
;; rsp=0 , %8~452'(= {| l |} )%7~450'(= r )%2~447'(= r )
; ##37 447'(= r ) ⊢ { 447'(= r ) 485'(= r ) }
	mov rdi,GLX(447)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(485),rax
;; rsp=0 , %21~485'(= r )%20~447'(= r )%8~452'(= {| l |} )%7~450'(= r )
; ##121 { 452'(= {| l |} ) 447'(= r ) } ⊢|
; .dlt.ptn 485'(= r )
; .dlt.ptn 450'(= r )
	MOV_RBX GLX(467),GLX(452)
	MOV_RBX GLX(468),GLX(447)
	jmp JMP_203
LB_194:
;; ?; 451'(3)◂450' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~449'(= r )%4~446'(= {| l |} )%2~447'(= r )
; ##51 449'(= r ) ⊢ { }
;; rsp=0 , %4~446'(= {| l |} )%2~447'(= r )
; ##37 447'(= r ) ⊢ { 447'(= r ) 486'(= r ) }
	mov rdi,GLX(447)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(486),rax
;; rsp=0 , %23~486'(= r )%22~447'(= r )%4~446'(= {| l |} )
; ##121 { 446'(= {| l |} ) 447'(= r ) } ⊢|
; .dlt.ptn 486'(= r )
	MOV_RBX GLX(467),GLX(446)
	MOV_RBX GLX(468),GLX(447)
	jmp JMP_203
EXH_195:
	add rsp,8
	pop rax
	jmp rax
EXH_201:
	add rsp,8
	pop rax
	jmp rax
LB_182: ;; #125◂◂(_none◂{}) { 423'(= {| l |} ) 424'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_182:
	MOV_RBX GLX(425),GLX(423)
	MOV_RBX GLX(426),GLX(424)
;; rsp=0 , %1~426'(= r )%0~425'(= {| l |} )
; ##37 426'(= r ) ⊢ { 426'(= r ) 427'(= r ) }
	mov rdi,GLX(426)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(427),rax
;; rsp=0 , %3~427'(= r )%2~426'(= r )%0~425'(= {| l |} )
; # ?  { 425'(= {| l |} ) 427'(= r ) } ⊢ { 425'(= {| l |} ) 428'(= r ) 430'(3)◂429' }
	mov rdi,GLX(425)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(427)
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_183
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],34
	jnz LB_183
	add rax,1
	mov rsi,unt
	mov r10,0
	jmp LB_184
LB_183:
	mov rsi,unt
	mov r10,1
LB_184:
	mov GLX(428),rax
	mov GLX(429),rsi
	mov GLX(430),r10
;; rsp=0 , %6~430'(3)◂429'%5~428'(= r )%4~425'(= {| l |} )%2~426'(= r )
;; ?; 430'(3)◂429' ⊢ 0(<2)◂{ }
	cmp GLX(430),0
	jnz LB_185
;; rsp=0 , %7~{ }%5~428'(= r )%4~425'(= {| l |} )%2~426'(= r )
; # ?  { 425'(= {| l |} ) 428'(= r ) } ⊢ { 431'(= {| l |} ) 432'(= r ) 433'(3)◂434' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(426)
	push EXH_186
	MOV_RBX GLX(360),GLX(425)
	MOV_RBX GLX(361),GLX(428)
	call LB_155
	add rsp,8
	MOV_RBX GLX(431),GLX(0)
	MOV_RBX GLX(432),GLX(1)
	MOV_RBX GLX(433),GLX(2)
	MOV_RBX GLX(434),GLX(3)
	pop GLX(426)
;; rsp=0 , %10~433'(3)◂434'%9~432'(= r )%8~431'(= {| l |} )%7~{ }%2~426'(= r )
;; ?; 433'(3)◂434' ⊢ 0(<2)◂{ }
	cmp GLX(433),0
	jnz LB_187
;; rsp=0 , %11~{ }%9~432'(= r )%8~431'(= {| l |} )%7~{ }%2~426'(= r )
; ##37 426'(= r ) ⊢ { 426'(= r ) 435'(= r ) }
	mov rdi,GLX(426)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(435),rax
;; rsp=0 , %13~435'(= r )%12~426'(= r )%11~{ }%9~432'(= r )%8~431'(= {| l |} )%7~{ }
; ##37 432'(= r ) ⊢ { 432'(= r ) 436'(= r ) }
	mov rdi,GLX(432)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(436),rax
;; rsp=0 , %15~436'(= r )%14~432'(= r )%13~435'(= r )%12~426'(= r )%11~{ }%8~431'(= {| l |} )%7~{ }
; ##124 { { { } { } } { 435'(= r ) 436'(= r ) } } ⊢ 441'(3)◂442'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(432)
	MOV_RDI QWORD [rsp+8*1],GLX(431)
	MOV_RDI QWORD [rsp+8*0],GLX(426)
	push EXH_189
	MOV_RBX GLX(437),GLX(435)
	MOV_RBX GLX(438),GLX(436)
	call LB_188
	add rsp,8
	MOV_RBX GLX(441),GLX(0)
	MOV_RBX GLX(442),GLX(1)
	pop GLX(426)
	pop GLX(431)
	pop GLX(432)
;; rsp=0 , %16~441'(3)◂442'%14~432'(= r )%12~426'(= r )%8~431'(= {| l |} )
;; ?; 441'(3)◂442' ⊢ 0(<2)◂{ }
	cmp GLX(441),0
	jnz LB_190
;; rsp=0 , %17~{ }%14~432'(= r )%12~426'(= r )%8~431'(= {| l |} )
; ∎ { 431'(= {| l |} ) 432'(= r ) 0(<2)◂{ } }
; .dlt.ptn 426'(= r )
	MOV_RBX GLX(0),GLX(431)
	MOV_RBX GLX(1),GLX(432)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_190:
;; ?; 441'(3)◂442' ⊢ 1(<2)◂{ }
;; rsp=0 , %14~432'(= r )%12~426'(= r )%8~431'(= {| l |} )
; ##51 432'(= r ) ⊢ { }
;; rsp=0 , %12~426'(= r )%8~431'(= {| l |} )
; ##37 426'(= r ) ⊢ { 426'(= r ) 443'(= r ) }
	mov rdi,GLX(426)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(443),rax
;; rsp=0 , %19~443'(= r )%18~426'(= r )%8~431'(= {| l |} )
; ##123 { 431'(= {| l |} ) 426'(= r ) } ⊢|
; .dlt.ptn 443'(= r )
	MOV_RBX GLX(444),GLX(431)
	MOV_RBX GLX(445),GLX(426)
	jmp JMP_191
LB_187:
;; ?; 433'(3)◂434' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~432'(= r )%8~431'(= {| l |} )%7~{ }%2~426'(= r )
; ##51 432'(= r ) ⊢ { }
;; rsp=0 , %8~431'(= {| l |} )%7~{ }%2~426'(= r )
; ##37 426'(= r ) ⊢ { 426'(= r ) 487'(= r ) }
	mov rdi,GLX(426)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(487),rax
;; rsp=0 , %21~487'(= r )%20~426'(= r )%8~431'(= {| l |} )%7~{ }
; ##123 { 431'(= {| l |} ) 426'(= r ) } ⊢|
; .dlt.ptn 487'(= r )
; .dlt.ptn { }
	MOV_RBX GLX(444),GLX(431)
	MOV_RBX GLX(445),GLX(426)
	jmp JMP_191
LB_185:
;; ?; 430'(3)◂429' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~428'(= r )%4~425'(= {| l |} )%2~426'(= r )
; ##51 428'(= r ) ⊢ { }
;; rsp=0 , %4~425'(= {| l |} )%2~426'(= r )
; ##37 426'(= r ) ⊢ { 426'(= r ) 488'(= r ) }
	mov rdi,GLX(426)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(488),rax
;; rsp=0 , %23~488'(= r )%22~426'(= r )%4~425'(= {| l |} )
; ##123 { 425'(= {| l |} ) 426'(= r ) } ⊢|
; .dlt.ptn 488'(= r )
	MOV_RBX GLX(444),GLX(425)
	MOV_RBX GLX(445),GLX(426)
	jmp JMP_191
EXH_186:
	add rsp,8
	pop rax
	jmp rax
EXH_189:
	add rsp,8
	pop rax
	jmp rax
LB_173: ;; #127◂◂(_none◂{}) { 402'(= {| l |} ) 403'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_173:
	MOV_RBX GLX(404),GLX(402)
	MOV_RBX GLX(405),GLX(403)
;; rsp=0 , %1~405'(= r )%0~404'(= {| l |} )
; ##37 405'(= r ) ⊢ { 405'(= r ) 406'(= r ) }
	mov rdi,GLX(405)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(406),rax
;; rsp=0 , %3~406'(= r )%2~405'(= r )%0~404'(= {| l |} )
; # ?  { 404'(= {| l |} ) 406'(= r ) } ⊢ { 404'(= {| l |} ) 407'(= r ) 409'(3)◂408' }
	mov rdi,GLX(404)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(406)
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_174
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],92
	jnz LB_174
	add rax,1
	mov rsi,unt
	mov r10,0
	jmp LB_175
LB_174:
	mov rsi,unt
	mov r10,1
LB_175:
	mov GLX(407),rax
	mov GLX(408),rsi
	mov GLX(409),r10
;; rsp=0 , %6~409'(3)◂408'%5~407'(= r )%4~404'(= {| l |} )%2~405'(= r )
;; ?; 409'(3)◂408' ⊢ 0(<2)◂{ }
	cmp GLX(409),0
	jnz LB_176
;; rsp=0 , %7~{ }%5~407'(= r )%4~404'(= {| l |} )%2~405'(= r )
; # ?  { 404'(= {| l |} ) 407'(= r ) } ⊢ { 410'(= {| l |} ) 411'(= r ) 412'(3)◂413' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(405)
	push EXH_177
	MOV_RBX GLX(360),GLX(404)
	MOV_RBX GLX(361),GLX(407)
	call LB_155
	add rsp,8
	MOV_RBX GLX(410),GLX(0)
	MOV_RBX GLX(411),GLX(1)
	MOV_RBX GLX(412),GLX(2)
	MOV_RBX GLX(413),GLX(3)
	pop GLX(405)
;; rsp=0 , %10~412'(3)◂413'%9~411'(= r )%8~410'(= {| l |} )%7~{ }%2~405'(= r )
;; ?; 412'(3)◂413' ⊢ 0(<2)◂{ }
	cmp GLX(412),0
	jnz LB_178
;; rsp=0 , %11~{ }%9~411'(= r )%8~410'(= {| l |} )%7~{ }%2~405'(= r )
; ##37 405'(= r ) ⊢ { 405'(= r ) 414'(= r ) }
	mov rdi,GLX(405)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(414),rax
;; rsp=0 , %13~414'(= r )%12~405'(= r )%11~{ }%9~411'(= r )%8~410'(= {| l |} )%7~{ }
; ##37 411'(= r ) ⊢ { 411'(= r ) 415'(= r ) }
	mov rdi,GLX(411)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(415),rax
;; rsp=0 , %15~415'(= r )%14~411'(= r )%13~414'(= r )%12~405'(= r )%11~{ }%8~410'(= {| l |} )%7~{ }
; ##126 { { { } { } } { 414'(= r ) 415'(= r ) } } ⊢ 420'(3)◂421'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(411)
	MOV_RDI QWORD [rsp+8*1],GLX(410)
	MOV_RDI QWORD [rsp+8*0],GLX(405)
	push EXH_180
	MOV_RBX GLX(416),GLX(414)
	MOV_RBX GLX(417),GLX(415)
	call LB_179
	add rsp,8
	MOV_RBX GLX(420),GLX(0)
	MOV_RBX GLX(421),GLX(1)
	pop GLX(405)
	pop GLX(410)
	pop GLX(411)
;; rsp=0 , %16~420'(3)◂421'%14~411'(= r )%12~405'(= r )%8~410'(= {| l |} )
;; ?; 420'(3)◂421' ⊢ 0(<2)◂{ }
	cmp GLX(420),0
	jnz LB_181
;; rsp=0 , %17~{ }%14~411'(= r )%12~405'(= r )%8~410'(= {| l |} )
; ∎ { 410'(= {| l |} ) 411'(= r ) 0(<2)◂{ } }
; .dlt.ptn 405'(= r )
	MOV_RBX GLX(0),GLX(410)
	MOV_RBX GLX(1),GLX(411)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_181:
;; ?; 420'(3)◂421' ⊢ 1(<2)◂{ }
;; rsp=0 , %14~411'(= r )%12~405'(= r )%8~410'(= {| l |} )
; ##51 411'(= r ) ⊢ { }
;; rsp=0 , %12~405'(= r )%8~410'(= {| l |} )
; ##37 405'(= r ) ⊢ { 405'(= r ) 422'(= r ) }
	mov rdi,GLX(405)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(422),rax
;; rsp=0 , %19~422'(= r )%18~405'(= r )%8~410'(= {| l |} )
; ##125 { 410'(= {| l |} ) 405'(= r ) } ⊢|
; .dlt.ptn 422'(= r )
	MOV_RBX GLX(423),GLX(410)
	MOV_RBX GLX(424),GLX(405)
	jmp JMP_182
LB_178:
;; ?; 412'(3)◂413' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~411'(= r )%8~410'(= {| l |} )%7~{ }%2~405'(= r )
; ##51 411'(= r ) ⊢ { }
;; rsp=0 , %8~410'(= {| l |} )%7~{ }%2~405'(= r )
; ##37 405'(= r ) ⊢ { 405'(= r ) 489'(= r ) }
	mov rdi,GLX(405)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(489),rax
;; rsp=0 , %21~489'(= r )%20~405'(= r )%8~410'(= {| l |} )%7~{ }
; ##125 { 410'(= {| l |} ) 405'(= r ) } ⊢|
; .dlt.ptn 489'(= r )
; .dlt.ptn { }
	MOV_RBX GLX(423),GLX(410)
	MOV_RBX GLX(424),GLX(405)
	jmp JMP_182
LB_176:
;; ?; 409'(3)◂408' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~407'(= r )%4~404'(= {| l |} )%2~405'(= r )
; ##51 407'(= r ) ⊢ { }
;; rsp=0 , %4~404'(= {| l |} )%2~405'(= r )
; ##37 405'(= r ) ⊢ { 405'(= r ) 490'(= r ) }
	mov rdi,GLX(405)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(490),rax
;; rsp=0 , %23~490'(= r )%22~405'(= r )%4~404'(= {| l |} )
; ##125 { 404'(= {| l |} ) 405'(= r ) } ⊢|
; .dlt.ptn 490'(= r )
	MOV_RBX GLX(423),GLX(404)
	MOV_RBX GLX(424),GLX(405)
	jmp JMP_182
EXH_177:
	add rsp,8
	pop rax
	jmp rax
EXH_180:
	add rsp,8
	pop rax
	jmp rax
LB_164: ;; #129◂◂(_none◂{}) { 381'(= {| l |} ) 382'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_164:
	MOV_RBX GLX(383),GLX(381)
	MOV_RBX GLX(384),GLX(382)
;; rsp=0 , %1~384'(= r )%0~383'(= {| l |} )
; ##37 384'(= r ) ⊢ { 384'(= r ) 385'(= r ) }
	mov rdi,GLX(384)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(385),rax
;; rsp=0 , %3~385'(= r )%2~384'(= r )%0~383'(= {| l |} )
; # ?  { 383'(= {| l |} ) 385'(= r ) } ⊢ { 383'(= {| l |} ) 386'(= r ) 388'(3)◂387' }
	mov rdi,GLX(383)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(385)
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_165
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],9
	jnz LB_165
	add rax,1
	mov rsi,unt
	mov r10,0
	jmp LB_166
LB_165:
	mov rsi,unt
	mov r10,1
LB_166:
	mov GLX(386),rax
	mov GLX(387),rsi
	mov GLX(388),r10
;; rsp=0 , %6~388'(3)◂387'%5~386'(= r )%4~383'(= {| l |} )%2~384'(= r )
;; ?; 388'(3)◂387' ⊢ 0(<2)◂{ }
	cmp GLX(388),0
	jnz LB_167
;; rsp=0 , %7~{ }%5~386'(= r )%4~383'(= {| l |} )%2~384'(= r )
; # ?  { 383'(= {| l |} ) 386'(= r ) } ⊢ { 389'(= {| l |} ) 390'(= r ) 391'(3)◂392' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(384)
	push EXH_168
	MOV_RBX GLX(360),GLX(383)
	MOV_RBX GLX(361),GLX(386)
	call LB_155
	add rsp,8
	MOV_RBX GLX(389),GLX(0)
	MOV_RBX GLX(390),GLX(1)
	MOV_RBX GLX(391),GLX(2)
	MOV_RBX GLX(392),GLX(3)
	pop GLX(384)
;; rsp=0 , %10~391'(3)◂392'%9~390'(= r )%8~389'(= {| l |} )%7~{ }%2~384'(= r )
;; ?; 391'(3)◂392' ⊢ 0(<2)◂{ }
	cmp GLX(391),0
	jnz LB_169
;; rsp=0 , %11~{ }%9~390'(= r )%8~389'(= {| l |} )%7~{ }%2~384'(= r )
; ##37 384'(= r ) ⊢ { 384'(= r ) 393'(= r ) }
	mov rdi,GLX(384)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(393),rax
;; rsp=0 , %13~393'(= r )%12~384'(= r )%11~{ }%9~390'(= r )%8~389'(= {| l |} )%7~{ }
; ##37 390'(= r ) ⊢ { 390'(= r ) 394'(= r ) }
	mov rdi,GLX(390)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(394),rax
;; rsp=0 , %15~394'(= r )%14~390'(= r )%13~393'(= r )%12~384'(= r )%11~{ }%8~389'(= {| l |} )%7~{ }
; ##128 { { { } { } } { 393'(= r ) 394'(= r ) } } ⊢ 399'(3)◂400'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(390)
	MOV_RDI QWORD [rsp+8*1],GLX(389)
	MOV_RDI QWORD [rsp+8*0],GLX(384)
	push EXH_171
	MOV_RBX GLX(395),GLX(393)
	MOV_RBX GLX(396),GLX(394)
	call LB_170
	add rsp,8
	MOV_RBX GLX(399),GLX(0)
	MOV_RBX GLX(400),GLX(1)
	pop GLX(384)
	pop GLX(389)
	pop GLX(390)
;; rsp=0 , %16~399'(3)◂400'%14~390'(= r )%12~384'(= r )%8~389'(= {| l |} )
;; ?; 399'(3)◂400' ⊢ 0(<2)◂{ }
	cmp GLX(399),0
	jnz LB_172
;; rsp=0 , %17~{ }%14~390'(= r )%12~384'(= r )%8~389'(= {| l |} )
; ∎ { 389'(= {| l |} ) 390'(= r ) 0(<2)◂{ } }
; .dlt.ptn 384'(= r )
	MOV_RBX GLX(0),GLX(389)
	MOV_RBX GLX(1),GLX(390)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_172:
;; ?; 399'(3)◂400' ⊢ 1(<2)◂{ }
;; rsp=0 , %14~390'(= r )%12~384'(= r )%8~389'(= {| l |} )
; ##51 390'(= r ) ⊢ { }
;; rsp=0 , %12~384'(= r )%8~389'(= {| l |} )
; ##37 384'(= r ) ⊢ { 384'(= r ) 401'(= r ) }
	mov rdi,GLX(384)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(401),rax
;; rsp=0 , %19~401'(= r )%18~384'(= r )%8~389'(= {| l |} )
; ##127 { 389'(= {| l |} ) 384'(= r ) } ⊢|
; .dlt.ptn 401'(= r )
	MOV_RBX GLX(402),GLX(389)
	MOV_RBX GLX(403),GLX(384)
	jmp JMP_173
LB_169:
;; ?; 391'(3)◂392' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~390'(= r )%8~389'(= {| l |} )%7~{ }%2~384'(= r )
; ##51 390'(= r ) ⊢ { }
;; rsp=0 , %8~389'(= {| l |} )%7~{ }%2~384'(= r )
; ##37 384'(= r ) ⊢ { 384'(= r ) 491'(= r ) }
	mov rdi,GLX(384)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(491),rax
;; rsp=0 , %21~491'(= r )%20~384'(= r )%8~389'(= {| l |} )%7~{ }
; ##127 { 389'(= {| l |} ) 384'(= r ) } ⊢|
; .dlt.ptn 491'(= r )
; .dlt.ptn { }
	MOV_RBX GLX(402),GLX(389)
	MOV_RBX GLX(403),GLX(384)
	jmp JMP_173
LB_167:
;; ?; 388'(3)◂387' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~386'(= r )%4~383'(= {| l |} )%2~384'(= r )
; ##51 386'(= r ) ⊢ { }
;; rsp=0 , %4~383'(= {| l |} )%2~384'(= r )
; ##37 384'(= r ) ⊢ { 384'(= r ) 492'(= r ) }
	mov rdi,GLX(384)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(492),rax
;; rsp=0 , %23~492'(= r )%22~384'(= r )%4~383'(= {| l |} )
; ##127 { 383'(= {| l |} ) 384'(= r ) } ⊢|
; .dlt.ptn 492'(= r )
	MOV_RBX GLX(402),GLX(383)
	MOV_RBX GLX(403),GLX(384)
	jmp JMP_173
EXH_168:
	add rsp,8
	pop rax
	jmp rax
EXH_171:
	add rsp,8
	pop rax
	jmp rax
LB_155: ;; #131◂◂(_none◂{}) { 360'(= {| l |} ) 361'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(3)◂3' } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
JMP_155:
	MOV_RBX GLX(362),GLX(360)
	MOV_RBX GLX(363),GLX(361)
;; rsp=0 , %1~363'(= r )%0~362'(= {| l |} )
; ##37 363'(= r ) ⊢ { 363'(= r ) 364'(= r ) }
	mov rdi,GLX(363)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(364),rax
;; rsp=0 , %3~364'(= r )%2~363'(= r )%0~362'(= {| l |} )
; # ?  { 362'(= {| l |} ) 364'(= r ) } ⊢ { 362'(= {| l |} ) 365'(= r ) 367'(3)◂366' }
	mov rdi,GLX(362)
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,GLX(364)
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_156
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],10
	jnz LB_156
	add rax,1
	mov rsi,unt
	mov r10,0
	jmp LB_157
LB_156:
	mov rsi,unt
	mov r10,1
LB_157:
	mov GLX(365),rax
	mov GLX(366),rsi
	mov GLX(367),r10
;; rsp=0 , %6~367'(3)◂366'%5~365'(= r )%4~362'(= {| l |} )%2~363'(= r )
;; ?; 367'(3)◂366' ⊢ 0(<2)◂{ }
	cmp GLX(367),0
	jnz LB_158
;; rsp=0 , %7~{ }%5~365'(= r )%4~362'(= {| l |} )%2~363'(= r )
; # ?  { 362'(= {| l |} ) 365'(= r ) } ⊢ { 368'(= {| l |} ) 369'(= r ) 370'(3)◂371' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(363)
	push EXH_159
	MOV_RBX GLX(360),GLX(362)
	MOV_RBX GLX(361),GLX(365)
	call LB_155
	add rsp,8
	MOV_RBX GLX(368),GLX(0)
	MOV_RBX GLX(369),GLX(1)
	MOV_RBX GLX(370),GLX(2)
	MOV_RBX GLX(371),GLX(3)
	pop GLX(363)
;; rsp=0 , %10~370'(3)◂371'%9~369'(= r )%8~368'(= {| l |} )%7~{ }%2~363'(= r )
;; ?; 370'(3)◂371' ⊢ 0(<2)◂{ }
	cmp GLX(370),0
	jnz LB_160
;; rsp=0 , %11~{ }%9~369'(= r )%8~368'(= {| l |} )%7~{ }%2~363'(= r )
; ##37 363'(= r ) ⊢ { 363'(= r ) 372'(= r ) }
	mov rdi,GLX(363)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(372),rax
;; rsp=0 , %13~372'(= r )%12~363'(= r )%11~{ }%9~369'(= r )%8~368'(= {| l |} )%7~{ }
; ##37 369'(= r ) ⊢ { 369'(= r ) 373'(= r ) }
	mov rdi,GLX(369)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(373),rax
;; rsp=0 , %15~373'(= r )%14~369'(= r )%13~372'(= r )%12~363'(= r )%11~{ }%8~368'(= {| l |} )%7~{ }
; ##130 { { { } { } } { 372'(= r ) 373'(= r ) } } ⊢ 378'(3)◂379'
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(369)
	MOV_RDI QWORD [rsp+8*1],GLX(368)
	MOV_RDI QWORD [rsp+8*0],GLX(363)
	push EXH_162
	MOV_RBX GLX(374),GLX(372)
	MOV_RBX GLX(375),GLX(373)
	call LB_161
	add rsp,8
	MOV_RBX GLX(378),GLX(0)
	MOV_RBX GLX(379),GLX(1)
	pop GLX(363)
	pop GLX(368)
	pop GLX(369)
;; rsp=0 , %16~378'(3)◂379'%14~369'(= r )%12~363'(= r )%8~368'(= {| l |} )
;; ?; 378'(3)◂379' ⊢ 0(<2)◂{ }
	cmp GLX(378),0
	jnz LB_163
;; rsp=0 , %17~{ }%14~369'(= r )%12~363'(= r )%8~368'(= {| l |} )
; ∎ { 368'(= {| l |} ) 369'(= r ) 0(<2)◂{ } }
; .dlt.ptn 363'(= r )
	MOV_RBX GLX(0),GLX(368)
	MOV_RBX GLX(1),GLX(369)
	mov GLX(2),0
	mov GLX(3),unt
	ret
LB_163:
;; ?; 378'(3)◂379' ⊢ 1(<2)◂{ }
;; rsp=0 , %14~369'(= r )%12~363'(= r )%8~368'(= {| l |} )
; ##51 369'(= r ) ⊢ { }
;; rsp=0 , %12~363'(= r )%8~368'(= {| l |} )
; ##37 363'(= r ) ⊢ { 363'(= r ) 380'(= r ) }
	mov rdi,GLX(363)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(380),rax
;; rsp=0 , %19~380'(= r )%18~363'(= r )%8~368'(= {| l |} )
; ##129 { 368'(= {| l |} ) 363'(= r ) } ⊢|
; .dlt.ptn 380'(= r )
	MOV_RBX GLX(381),GLX(368)
	MOV_RBX GLX(382),GLX(363)
	jmp JMP_164
LB_160:
;; ?; 370'(3)◂371' ⊢ 1(<2)◂{ }
;; rsp=0 , %9~369'(= r )%8~368'(= {| l |} )%7~{ }%2~363'(= r )
; ##51 369'(= r ) ⊢ { }
;; rsp=0 , %8~368'(= {| l |} )%7~{ }%2~363'(= r )
; ##37 363'(= r ) ⊢ { 363'(= r ) 493'(= r ) }
	mov rdi,GLX(363)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(493),rax
;; rsp=0 , %21~493'(= r )%20~363'(= r )%8~368'(= {| l |} )%7~{ }
; ##129 { 368'(= {| l |} ) 363'(= r ) } ⊢|
; .dlt.ptn 493'(= r )
; .dlt.ptn { }
	MOV_RBX GLX(381),GLX(368)
	MOV_RBX GLX(382),GLX(363)
	jmp JMP_164
LB_158:
;; ?; 367'(3)◂366' ⊢ 1(<2)◂{ }
;; rsp=0 , %5~365'(= r )%4~362'(= {| l |} )%2~363'(= r )
; ##51 365'(= r ) ⊢ { }
;; rsp=0 , %4~362'(= {| l |} )%2~363'(= r )
; ##37 363'(= r ) ⊢ { 363'(= r ) 494'(= r ) }
	mov rdi,GLX(363)
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov GLX(494),rax
;; rsp=0 , %23~494'(= r )%22~363'(= r )%4~362'(= {| l |} )
; ##129 { 362'(= {| l |} ) 363'(= r ) } ⊢|
; .dlt.ptn 494'(= r )
	MOV_RBX GLX(381),GLX(362)
	MOV_RBX GLX(382),GLX(363)
	jmp JMP_164
EXH_159:
	add rsp,8
	pop rax
	jmp rax
EXH_162:
	add rsp,8
	pop rax
	jmp rax
RTM_1:
;; rsp=0 , %0~127'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 0r ] } ⊢ { 495'(= {| l |} ) 496'(= r ) 497'(3)◂498' }
	lea rsp,[rsp-8*1]
	MOV_RDI QWORD [rsp+8*0],GLX(127)
	push EXH_208
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],7
	C_CALL_SF calloc
	mov QWORD [rax],7
	mov BYTE [rax+8+0],100
	mov BYTE [rax+8+1],65
	mov BYTE [rax+8+2],66
	mov BYTE [rax+8+3],67
	mov BYTE [rax+8+4],105
	mov BYTE [rax+8+5],101
	mov BYTE [rax+8+6],105
	mov GLX(360),rax
	mov rax,0
	mov GLX(361),rax
	call LB_155
	add rsp,8
	MOV_RBX GLX(495),GLX(0)
	MOV_RBX GLX(496),GLX(1)
	MOV_RBX GLX(497),GLX(2)
	MOV_RBX GLX(498),GLX(3)
	pop GLX(127)
; .dlt.ptn 495'(= {| l |} )
	mov rdi,GLX(495)
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %75~497'(3)◂498'%74~496'(= r )%0~127'(= {| ? |} )
; ##8 { 496'(= r ) 497'(3)◂498' } ⊢ { 496'(= r ) 497'(3)◂498' }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(496)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,GLX(497)
	mov r8,GLX(498)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_209,25
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 496'(= r ) 497'(3)◂498' }
	C_PUSH_REGS
	mov r10,GLX(497)
	mov r8,GLX(498)
; .adt_call t3 : { }
	call LB_14
	C_POP_REGS
;; rsp=0 , %0~127'(= {| ? |} )
; ∎
	jmp RTM_2
EXH_208:
	add rsp,8
	pop rax
	jmp rax
RTM_2:
	C_CALL exit

%include "TEXT.s"
