%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 256
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

%define SS_RCD_1_MAX (1<<14)
	BSS_SS_RCD 1,SS_RCD_1_MAX
%define SS_RCD_2_MAX SS_RCD_2_MAX_P 
	BSS_SS_RCD 2,SS_RCD_2_MAX
%define SS_RCD_3_MAX SS_RCD_3_MAX_P 
	BSS_SS_RCD 3,SS_RCD_3_MAX
%define SS_RCD_4_MAX SS_RCD_4_MAX_P  
	BSS_SS_RCD 4,SS_RCD_4_MAX
%define SS_RCD_5_MAX SS_RCD_5_MAX_P
	BSS_SS_RCD 5,SS_RCD_5_MAX
%define SS_RCD_6_MAX SS_RCD_6_MAX_P
	BSS_SS_RCD 6,SS_RCD_6_MAX
%define SS_RCD_7_MAX SS_RCD_7_MAX_P
	BSS_SS_RCD 7,SS_RCD_7_MAX
%define SS_RCD_8_MAX SS_RCD_8_MAX_P
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
%include "DATA.s"
					
LB_37: db 39,48,226,151,130,0
LB_38: db 39,49,226,151,130,0
LB_39: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,97,114,114,226,151,130,95,108,115,116,226,151,130,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
LB_58: db 32,58,32,95,115,56,226,151,130,10,0
LB_60: db 32,58,32,95,115,56,226,151,130,10,0
LB_62: db 32,58,32,95,115,56,226,151,130,10,0
LB_64: db 32,58,32,95,115,56,226,151,130,10,0
LB_66: db 32,58,32,95,115,56,226,151,130,10,0
LB_71: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_73: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_89: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,97,114,114,226,151,130,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
LB_94: db 32,58,32,95,67,108,114,226,151,130,57,49,48,39,40,49,41,10,0
LB_97: db 32,58,32,95,67,108,114,226,151,130,95,114,54,52,226,151,130,10,0
LB_98: db 91,61,93,0
LB_99: db 32,58,32,95,112,116,226,151,130,95,114,54,52,226,151,130,10,0
LB_102: db 32,58,32,95,67,108,114,226,151,130,95,114,54,52,226,151,130,10,0
LB_105: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_108: db 32,58,32,95,67,108,114,226,151,130,95,114,54,52,226,151,130,10,0
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
;; rfb=f
LB_0: ;; #82◂◂(_none◂{}) 128'(= r ) ⊢ { 0'(= r ) 1'(= {| ? |} ) } : (_r64◂→{ _r64◂ _arr◂_lst◂546'(=547'(0))})
JMP_0:
	MOV_RBX GLX(129),GLX(128)
;; %0~129'(= r )
; #.#39 { %[ 1r ] 129'(= r ) } ⊢ { 130'(= r ) 129'(= r ) }
	mov rdi,1
	mov rax,GLX(129)
	push rcx 
	mov rcx,rax
	shl rdi,cl
	pop rcx 
	mov GLX(130),rdi
;; %1~130'(= r )%2~129'(= r )
; #.#0 { 130'(= r ) 1(<2)◂{ } } ⊢ { 130'(= r ) 1(<2)◂{ } 131'(= {| ? |} ) }
	mov rdi,GLX(130)
	push rdi 
	imul rdi,2
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov GLX(131),rax
	mov QWORD [rax],rdi 
	push DST_REG
	lea DST_REG,[rax+8] 
	mov rax,rdi 
	and rax,3  
	and rdi,~3
	mov GLX(132),rdi
	jmp QWORD [LB_4+8*rax]
LB_4: dq LB_1,LB_6,LB_7,LB_8
LB_8:
	call LB_3
LB_7:
	call LB_3
LB_6:
	call LB_3
	mov rdi,GLX(132)
LB_1:
	cmp rdi,0 
	jz LB_2
	mov GLX(132),rdi
	call LB_3
	call LB_3
	call LB_3
	call LB_3
	mov rdi,GLX(132)
	sub rdi,4
	jmp LB_1
LB_3:
	mov DX(0),1
	mov DX(1),unt
	lea DST_REG,[DST_REG+8*2]
	ret 
LB_2:
	pop DST_REG
; .dlt.ptn 1(<2)◂{ }
;; %2~129'(= r )%3~130'(= r )%5~131'(= {| ? |} )
; #.#10 130'(= r ) ⊢ 130'(= r )
	sub GLX(130),1
;; %2~129'(= r )%5~131'(= {| ? |} )%6~130'(= r )
; ∎ { 130'(= r ) 131'(= {| ? |} ) }
; .dlt.ptn 129'(= r )
	MOV_RBX GLX(0),GLX(130)
	MOV_RBX GLX(1),GLX(131)
	ret
;; rfb=t
LB_11: ;; #81◂◂(_none◂{}) { { 146'(= {| l |} ) 147'(= r ) } 148'(5)◂149' } ⊢ { { 0'(= {| l |} ) 1'(6)◂2' } 3'(5)◂4' } : ({ { _s8◂ _r64◂} _lst◂{ _s8◂ _r64◂}}→{ { _s8◂ _opn◂_r64◂} _lst◂{ _s8◂ _r64◂}})
JMP_11:
	MOV_RBX GLX(150),GLX(146)
	MOV_RBX GLX(151),GLX(147)
	MOV_RBX GLX(152),GLX(148)
	MOV_RBX GLX(153),GLX(149)
;; %0~150'(= {| l |} )%1~151'(= r )%2~152'(5)◂153'
	mov rdi,GLX(152)
	jmp QWORD [LB_14+8*rdi]
LB_14: dq LB_12,LB_13
LB_12:
	push SRC_REG 
	mov SRC_REG,GLX(153)
	add SRC_REG,8
	MOV_RDI GLX(154),SX(0)
	MOV_RDI GLX(155),SX(1)
	MOV_RDI GLX(156),SX(2)
	MOV_RDI GLX(157),SX(3)
	sub SRC_REG,8 
	mov rdi,SRC_REG 
	FREE_RCD 4,rdi
	pop SRC_REG 
;; %0~150'(= {| l |} )%1~151'(= r )%3~154'(= {| l |} )%4~155'(= r )%5~156'(5)◂157'
	mov rdi,GLX(154)
	mov rsi,GLX(150)
	call eq_s8_q  
	cmp rax,1
	jnz LB_16
	jmp LB_15
LB_15:
;; %0~150'(= {| l |} )%1~151'(= r )%3~154'(= {| l |} )%4~155'(= r )%5~156'(5)◂157'
; ∎ { { 150'(= {| l |} ) 0(<2)◂155'(= r ) } 0(<2)◂{ { 154'(= {| l |} ) 151'(= r ) } 156'(5)◂157' } }
	MOV_RBX GLX(0),GLX(150)
	mov GLX(1),0
	mov rax,GLX(155)
	mov GLX(2),rax
	mov GLX(3),0
	ALC_RCD 4, rax
	mov GLX(4),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(154)
	MOV_RDI DX(1),GLX(151)
	MOV_RDI DX(2),GLX(156)
	MOV_RDI DX(3),GLX(157)
	pop DST_REG
	ret
LB_16:
;; %0~150'(= {| l |} )%1~151'(= r )%3~154'(= {| l |} )%4~155'(= r )%5~156'(5)◂157'
; ##81 { { 150'(= {| l |} ) 151'(= r ) } 156'(5)◂157' } ⊢ { { 158'(= {| l |} ) 159'(6)◂160' } 161'(5)◂162' }
	lea rsp,[rsp-8*2]
	MOV_RDI QWORD [rsp+8*1],GLX(154)
	MOV_RDI QWORD [rsp+8*0],GLX(155)
	push EXH_17
	MOV_RBX GLX(146),GLX(150)
	MOV_RBX GLX(147),GLX(151)
	MOV_RBX GLX(148),GLX(156)
	MOV_RBX GLX(149),GLX(157)
	call LB_11
	add rsp,8
	MOV_RBX GLX(158),GLX(0)
	MOV_RBX GLX(159),GLX(1)
	MOV_RBX GLX(160),GLX(2)
	MOV_RBX GLX(161),GLX(3)
	MOV_RBX GLX(162),GLX(4)
	pop GLX(155)
	pop GLX(154)
;; %3~154'(= {| l |} )%4~155'(= r )%6~158'(= {| l |} )%7~159'(6)◂160'%8~161'(5)◂162'
; ∎ { { 158'(= {| l |} ) 159'(6)◂160' } 0(<2)◂{ { 154'(= {| l |} ) 155'(= r ) } 161'(5)◂162' } }
	MOV_RBX GLX(0),GLX(158)
	MOV_RBX GLX(1),GLX(159)
	MOV_RBX GLX(2),GLX(160)
	mov GLX(3),0
	ALC_RCD 4, rax
	mov GLX(4),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(154)
	MOV_RDI DX(1),GLX(155)
	MOV_RDI DX(2),GLX(161)
	MOV_RDI DX(3),GLX(162)
	pop DST_REG
	ret
LB_13:
;; %0~150'(= {| l |} )%1~151'(= r )
; ##46 150'(= {| l |} ) ⊢ 150'(= {| l |} )
;; %1~151'(= r )%9~150'(= {| l |} )
; ##37 150'(= {| l |} ) ⊢ { 150'(= {| l |} ) 163'(= {| l |} ) }
	mov r8,GLX(150)
	mov rdi,r8
	CALL_SF rpc_s8
	mov GLX(163),rax
;; %1~151'(= r )%10~150'(= {| l |} )%11~163'(= {| l |} )
; ##46 150'(= {| l |} ) ⊢ 150'(= {| l |} )
;; %1~151'(= r )%11~163'(= {| l |} )%12~150'(= {| l |} )
; ∎ { { 150'(= {| l |} ) 1(<2)◂{ } } 0(<2)◂{ { 163'(= {| l |} ) 151'(= r ) } 1(<2)◂{ } } }
	MOV_RBX GLX(0),GLX(150)
	mov GLX(1),1
	mov GLX(2),unt
	mov GLX(3),0
	ALC_RCD 4, rax
	mov GLX(4),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(163)
	MOV_RDI DX(1),GLX(151)
	mov DX(2),1
	mov DX(3),unt
	pop DST_REG
	ret
EXH_17:
	add rsp,8
	pop rax
	jmp rax
LB_19: ;; { _s8◂ _r64◂}
	jmp QWORD [LB_22+8*r10]
 ; { { _s8◂ _r64◂} _lst◂{ _s8◂ _r64◂}} { }
LB_22: dq LB_20,LB_21
LB_20:
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	mov r8,SX(0)
	FREE_S8 r8
	mov r10,SX(2)
	mov r8,SX(3)
; .adt_call t5 : { _s8◂ _r64◂}
	call LB_19
	pop r8 
	FREE_RCD 4,r8
	pop SRC_REG 
	jmp LB_23
LB_21:
	jmp LB_23
LB_23:
	ret
;; rfb=f
LB_10: ;; #84◂◂(_some◂→[ 81]) { { 135'(= r ) 136'(= {| ? |} ) } { 137'(= {| l |} ) 138'(= r ) } } ⊢ { { 0'(= r ) 1'(= {| ? |} ) } { 2'(= {| l |} ) 3'(6)◂4' } } : ({ { _r64◂ _arr◂_lst◂{ _s8◂ _r64◂}} { _s8◂ _r64◂}}→{ { _r64◂ _arr◂_lst◂{ _s8◂ _r64◂}} { _s8◂ _opn◂_r64◂}})
JMP_10:
	MOV_RBX GLX(139),GLX(135)
	MOV_RBX GLX(140),GLX(136)
	MOV_RBX GLX(141),GLX(137)
	MOV_RBX GLX(142),GLX(138)
;; %0~139'(= r )%1~140'(= {| ? |} )%2~141'(= {| l |} )%3~142'(= r )
; #.#46 141'(= {| l |} ) ⊢ 141'(= {| l |} )
;; %0~139'(= r )%1~140'(= {| ? |} )%3~142'(= r )%17~141'(= {| l |} )
; #.#7 141'(= {| l |} ) ⊢ { 141'(= {| l |} ) 143'(= r ) }
	mov rdi,GLX(141)
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov GLX(143),rsi
;; %0~139'(= r )%1~140'(= {| ? |} )%3~142'(= r )%18~141'(= {| l |} )%19~143'(= r )
; #.#46 143'(= r ) ⊢ 143'(= r )
;; %0~139'(= r )%1~140'(= {| ? |} )%3~142'(= r )%18~141'(= {| l |} )%20~143'(= r )
; #.#46 { 141'(= {| l |} ) 143'(= r ) } ⊢ { 141'(= {| l |} ) 143'(= r ) }
;; %0~139'(= r )%1~140'(= {| ? |} )%3~142'(= r )%4~141'(= {| l |} )%5~143'(= r )
; #.#42 { 143'(= r ) 139'(= r ) } ⊢ { 143'(= r ) 139'(= r ) }
	mov rdi,GLX(139)
	and GLX(143),rdi
;; %1~140'(= {| ? |} )%3~142'(= r )%4~141'(= {| l |} )%6~143'(= r )%7~139'(= r )
; #.#1 { 140'(= {| ? |} ) 143'(= r ) 1(<2)◂{ } } ⊢ { 140'(= {| ? |} ) 143'(= r ) 144'(5)◂145' }
	mov rax,GLX(143)
	mov rdi,GLX(140)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_exc_q
	 imul rax,2
	lea rdi,[rdi+8+8*rax]
	mov DST_REG,rdi 
	mov SRC_REG,rdi
	MOV_RDI GLX(144),SX(0)
	MOV_RDI GLX(145),SX(1)
	mov DX(0),1
	mov DX(1),unt
;; %3~142'(= r )%4~141'(= {| l |} )%7~139'(= r )%8~140'(= {| ? |} )%9~143'(= r )%10~144'(5)◂145'
; #→[ 81] { { 141'(= {| l |} ) 142'(= r ) } 144'(5)◂145' } ⊢ { { 164'(= {| l |} ) 165'(6)◂166' } 167'(5)◂168' }
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(139)
	MOV_RDI QWORD [rsp+8*1],GLX(140)
	MOV_RDI QWORD [rsp+8*0],GLX(143)
	push EXH_18
	MOV_RBX GLX(146),GLX(141)
	MOV_RBX GLX(147),GLX(142)
	MOV_RBX GLX(148),GLX(144)
	MOV_RBX GLX(149),GLX(145)
	call LB_11
	add rsp,8
	MOV_RBX GLX(164),GLX(0)
	MOV_RBX GLX(165),GLX(1)
	MOV_RBX GLX(166),GLX(2)
	MOV_RBX GLX(167),GLX(3)
	MOV_RBX GLX(168),GLX(4)
	pop GLX(143)
	pop GLX(140)
	pop GLX(139)
;; %7~139'(= r )%8~140'(= {| ? |} )%9~143'(= r )%11~164'(= {| l |} )%12~165'(6)◂166'%13~167'(5)◂168'
; #.#1 { 140'(= {| ? |} ) 143'(= r ) 167'(5)◂168' } ⊢ { 140'(= {| ? |} ) 143'(= r ) 169'(5)◂170' }
	mov rax,GLX(143)
	mov rdi,GLX(140)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_exc_q
	 imul rax,2
	lea rdi,[rdi+8+8*rax]
	mov DST_REG,rdi 
	mov SRC_REG,rdi
	MOV_RDI GLX(169),SX(0)
	MOV_RDI GLX(170),SX(1)
	MOV_RDI DX(0),GLX(167)
	MOV_RDI DX(1),GLX(168)
; .dlt.ptn 169'(5)◂170'
	mov r10,GLX(169)
	mov r8,GLX(170)
; .adt_call t5 : { _s8◂ _r64◂}
	call LB_19
;; %7~139'(= r )%11~164'(= {| l |} )%12~165'(6)◂166'%14~140'(= {| ? |} )%15~143'(= r )
; ∎ { { 139'(= r ) 140'(= {| ? |} ) } { 164'(= {| l |} ) 165'(6)◂166' } }
; .dlt.ptn 143'(= r )
	MOV_RBX GLX(0),GLX(139)
	MOV_RBX GLX(1),GLX(140)
	MOV_RBX GLX(2),GLX(164)
	MOV_RBX GLX(3),GLX(165)
	MOV_RBX GLX(4),GLX(166)
	ret
EXH_18:
	add rsp,8
	pop rax
	jmp rax
LB_25: ;; _r64◂
	jmp QWORD [LB_28+8*r10]
 ; _r64◂ { }
LB_28: dq LB_26,LB_27
LB_26:
	jmp LB_29
LB_27:
	jmp LB_29
LB_29:
	ret
LB_32: ;; { _s8◂ _r64◂}
	jmp QWORD [LB_35+8*r10]
 ; { { _s8◂ _r64◂} _lst◂{ _s8◂ _r64◂}} { }
LB_35: dq LB_33,LB_34
LB_33:
	EMT_CST LB_37,5
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_l,4
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
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
	EMT_CST fmt_spc,4
	C_PUSH_REGS
	mov r10,SX(2)
	mov r8,SX(3)
; .adt_call t5 : { _s8◂ _r64◂}
	call LB_32
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	pop r8 
	pop SRC_REG
	jmp LB_36
LB_34:
	EMT_CST LB_38,5
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_r,4
	pop r8 
	pop SRC_REG
	jmp LB_36
LB_36:
	ret
;; rfb=t
LB_41: ;; #80◂◂(_none◂{}) { { 185'(= {| l |} ) { } } 186'(5)◂187' } ⊢ { { 0'(= {| l |} ) 1'(6)◂2' } 3'(5)◂4' } : ({ { _s8◂ { }} _lst◂{ _s8◂ _r64◂}}→{ { _s8◂ _opn◂_r64◂} _lst◂{ _s8◂ _r64◂}})
JMP_41:
	MOV_RBX GLX(188),GLX(185)
	MOV_RBX GLX(189),GLX(186)
	MOV_RBX GLX(190),GLX(187)
;; %0~188'(= {| l |} )%1~189'(5)◂190'
	mov rdi,GLX(189)
	jmp QWORD [LB_44+8*rdi]
LB_44: dq LB_42,LB_43
LB_42:
	push SRC_REG 
	mov SRC_REG,GLX(190)
	add SRC_REG,8
	MOV_RDI GLX(191),SX(0)
	MOV_RDI GLX(192),SX(1)
	MOV_RDI GLX(193),SX(2)
	MOV_RDI GLX(194),SX(3)
	sub SRC_REG,8 
	mov rdi,SRC_REG 
	FREE_RCD 4,rdi
	pop SRC_REG 
;; %0~188'(= {| l |} )%2~191'(= {| l |} )%3~192'(= r )%4~193'(5)◂194'
	mov rdi,GLX(191)
	mov rsi,GLX(188)
	call eq_s8_q  
	cmp rax,1
	jnz LB_46
	jmp LB_45
LB_45:
;; %0~188'(= {| l |} )%2~191'(= {| l |} )%3~192'(= r )%4~193'(5)◂194'
; ∎ { { 188'(= {| l |} ) 0(<2)◂192'(= r ) } 193'(5)◂194' }
; .dlt.ptn 191'(= {| l |} )
	mov r8,GLX(191)
	FREE_S8 r8
	MOV_RBX GLX(0),GLX(188)
	mov GLX(1),0
	mov rax,GLX(192)
	mov GLX(2),rax
	MOV_RBX GLX(3),GLX(193)
	MOV_RBX GLX(4),GLX(194)
	ret
LB_46:
;; %0~188'(= {| l |} )%2~191'(= {| l |} )%3~192'(= r )%4~193'(5)◂194'
; ##80 { { 188'(= {| l |} ) { } } 193'(5)◂194' } ⊢ { { 195'(= {| l |} ) 196'(6)◂197' } 198'(5)◂199' }
	lea rsp,[rsp-8*2]
	MOV_RDI QWORD [rsp+8*1],GLX(191)
	MOV_RDI QWORD [rsp+8*0],GLX(192)
	push EXH_47
	MOV_RBX GLX(185),GLX(188)
	MOV_RBX GLX(186),GLX(193)
	MOV_RBX GLX(187),GLX(194)
	call LB_41
	add rsp,8
	MOV_RBX GLX(195),GLX(0)
	MOV_RBX GLX(196),GLX(1)
	MOV_RBX GLX(197),GLX(2)
	MOV_RBX GLX(198),GLX(3)
	MOV_RBX GLX(199),GLX(4)
	pop GLX(192)
	pop GLX(191)
;; %2~191'(= {| l |} )%3~192'(= r )%5~195'(= {| l |} )%6~196'(6)◂197'%7~198'(5)◂199'
; ∎ { { 195'(= {| l |} ) 196'(6)◂197' } 0(<2)◂{ { 191'(= {| l |} ) 192'(= r ) } 198'(5)◂199' } }
	MOV_RBX GLX(0),GLX(195)
	MOV_RBX GLX(1),GLX(196)
	MOV_RBX GLX(2),GLX(197)
	mov GLX(3),0
	ALC_RCD 4, rax
	mov GLX(4),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(191)
	MOV_RDI DX(1),GLX(192)
	MOV_RDI DX(2),GLX(198)
	MOV_RDI DX(3),GLX(199)
	pop DST_REG
	ret
LB_43:
;; %0~188'(= {| l |} )
; ∎ { { 188'(= {| l |} ) 1(<2)◂{ } } 1(<2)◂{ } }
	MOV_RBX GLX(0),GLX(188)
	mov GLX(1),1
	mov GLX(2),unt
	mov GLX(3),1
	mov GLX(4),unt
	ret
EXH_47:
	add rsp,8
	pop rax
	jmp rax
;; rfb=f
LB_40: ;; #86◂◂(_none◂{}) { { 176'(= r ) 177'(= {| ? |} ) } 178'(= {| l |} ) } ⊢ { { 0'(= r ) 1'(= {| ? |} ) } { 2'(= {| l |} ) 3'(6)◂4' } } : ({ { _r64◂ _arr◂_lst◂{ _s8◂ _r64◂}} _s8◂}→{ { _r64◂ _arr◂_lst◂{ _s8◂ _r64◂}} { _s8◂ _opn◂_r64◂}})
JMP_40:
	MOV_RBX GLX(179),GLX(176)
	MOV_RBX GLX(180),GLX(177)
	MOV_RBX GLX(181),GLX(178)
;; %0~{ 179'(= r ) 180'(= {| ? |} ) }%1~181'(= {| l |} )
; #.#46 { { 179'(= r ) 180'(= {| ? |} ) } { 181'(= {| l |} ) { } } } ⊢ { { 179'(= r ) 180'(= {| ? |} ) } { 181'(= {| l |} ) { } } }
;; %5~179'(= r )%6~180'(= {| ? |} )%7~181'(= {| l |} )%8~{ }
; #.#46 181'(= {| l |} ) ⊢ 181'(= {| l |} )
;; %5~179'(= r )%6~180'(= {| ? |} )%8~{ }%9~181'(= {| l |} )
; #.#7 181'(= {| l |} ) ⊢ { 181'(= {| l |} ) 182'(= r ) }
	mov rdi,GLX(181)
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov GLX(182),rsi
;; %5~179'(= r )%6~180'(= {| ? |} )%8~{ }%10~181'(= {| l |} )%11~182'(= r )
; #.#46 182'(= r ) ⊢ 182'(= r )
;; %5~179'(= r )%6~180'(= {| ? |} )%8~{ }%10~181'(= {| l |} )%12~182'(= r )
; #.#46 { 181'(= {| l |} ) 182'(= r ) } ⊢ { 181'(= {| l |} ) 182'(= r ) }
;; %5~179'(= r )%6~180'(= {| ? |} )%8~{ }%13~181'(= {| l |} )%14~182'(= r )
; #.#42 { 182'(= r ) 179'(= r ) } ⊢ { 182'(= r ) 179'(= r ) }
	mov rdi,GLX(179)
	and GLX(182),rdi
;; %6~180'(= {| ? |} )%8~{ }%13~181'(= {| l |} )%15~182'(= r )%16~179'(= r )
; #.#1 { 180'(= {| ? |} ) 182'(= r ) 1(<2)◂{ } } ⊢ { 180'(= {| ? |} ) 182'(= r ) 183'(5)◂184' }
	mov rax,GLX(182)
	mov rdi,GLX(180)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_exc_q
	 imul rax,2
	lea rdi,[rdi+8+8*rax]
	mov DST_REG,rdi 
	mov SRC_REG,rdi
	MOV_RDI GLX(183),SX(0)
	MOV_RDI GLX(184),SX(1)
	mov DX(0),1
	mov DX(1),unt
;; %8~{ }%13~181'(= {| l |} )%16~179'(= r )%17~180'(= {| ? |} )%18~182'(= r )%19~183'(5)◂184'
; #→[ 80] { { 181'(= {| l |} ) { } } 183'(5)◂184' } ⊢ { { 200'(= {| l |} ) 201'(6)◂202' } 203'(5)◂204' }
	lea rsp,[rsp-8*3]
	MOV_RDI QWORD [rsp+8*2],GLX(179)
	MOV_RDI QWORD [rsp+8*1],GLX(180)
	MOV_RDI QWORD [rsp+8*0],GLX(182)
	push EXH_48
	MOV_RBX GLX(185),GLX(181)
	MOV_RBX GLX(186),GLX(183)
	MOV_RBX GLX(187),GLX(184)
	call LB_41
	add rsp,8
	MOV_RBX GLX(200),GLX(0)
	MOV_RBX GLX(201),GLX(1)
	MOV_RBX GLX(202),GLX(2)
	MOV_RBX GLX(203),GLX(3)
	MOV_RBX GLX(204),GLX(4)
	pop GLX(182)
	pop GLX(180)
	pop GLX(179)
;; %16~179'(= r )%17~180'(= {| ? |} )%18~182'(= r )%20~200'(= {| l |} )%21~201'(6)◂202'%22~203'(5)◂204'
; #.#1 { 180'(= {| ? |} ) 182'(= r ) 203'(5)◂204' } ⊢ { 180'(= {| ? |} ) 182'(= r ) 205'(5)◂206' }
	mov rax,GLX(182)
	mov rdi,GLX(180)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_exc_q
	 imul rax,2
	lea rdi,[rdi+8+8*rax]
	mov DST_REG,rdi 
	mov SRC_REG,rdi
	MOV_RDI GLX(205),SX(0)
	MOV_RDI GLX(206),SX(1)
	MOV_RDI DX(0),GLX(203)
	MOV_RDI DX(1),GLX(204)
; .dlt.ptn 205'(5)◂206'
	mov r10,GLX(205)
	mov r8,GLX(206)
; .adt_call t5 : { _s8◂ _r64◂}
	call LB_19
;; %16~179'(= r )%20~200'(= {| l |} )%21~201'(6)◂202'%23~180'(= {| ? |} )%24~182'(= r )
; #.#51 182'(= r ) ⊢ { }
;; %16~179'(= r )%20~200'(= {| l |} )%21~201'(6)◂202'%23~180'(= {| ? |} )
; #.#46 { { 179'(= r ) 180'(= {| ? |} ) } { 200'(= {| l |} ) 201'(6)◂202' } } ⊢ { { 179'(= r ) 180'(= {| ? |} ) } { 200'(= {| l |} ) 201'(6)◂202' } }
;; %2~{ 179'(= r ) 180'(= {| ? |} ) }%3~200'(= {| l |} )%4~201'(6)◂202'
; ∎ { { 179'(= r ) 180'(= {| ? |} ) } { 200'(= {| l |} ) 201'(6)◂202' } }
	MOV_RBX GLX(0),GLX(179)
	MOV_RBX GLX(1),GLX(180)
	MOV_RBX GLX(2),GLX(200)
	MOV_RBX GLX(3),GLX(201)
	MOV_RBX GLX(4),GLX(202)
	ret
EXH_48:
	add rsp,8
	pop rax
	jmp rax
RTM_0:
;; %0~127'(= {| ? |} )
; ##82 %[ 2r ] ⊢ { 133'(= r ) 134'(= {| ? |} ) }
	push EXH_9
	mov rax,2
	mov GLX(128),rax
	call LB_0
	add rsp,8
	MOV_RBX GLX(133),GLX(0)
	MOV_RBX GLX(134),GLX(1)
;; %0~127'(= {| ? |} )%1~{ 133'(= r ) 134'(= {| ? |} ) }
; ##87 { { 133'(= r ) 134'(= {| ? |} ) } { %[ "ywww" ] %[ 5r ] } } ⊢ { { 171'(= r ) 172'(= {| ? |} ) } { 173'(= {| l |} ) 174'(6)◂175' } }
	push EXH_24
	MOV_RBX GLX(135),GLX(133)
	MOV_RBX GLX(136),GLX(134)
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],4
	C_CALL_SF calloc
	mov QWORD [rax],4
	mov BYTE [rax+8+0],121
	mov BYTE [rax+8+1],119
	mov BYTE [rax+8+2],119
	mov BYTE [rax+8+3],119
	mov GLX(137),rax
	mov rax,5
	mov GLX(138),rax
	call LB_10
	add rsp,8
	MOV_RBX GLX(171),GLX(0)
	MOV_RBX GLX(172),GLX(1)
	MOV_RBX GLX(173),GLX(2)
	MOV_RBX GLX(174),GLX(3)
	MOV_RBX GLX(175),GLX(4)
; .dlt.ptn 173'(= {| l |} )
	mov r8,GLX(173)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%2~{ 171'(= r ) 172'(= {| ? |} ) }%4~174'(6)◂175'
; ##46 174'(6)◂175' ⊢ 174'(6)◂175'
; .dlt.ptn 174'(6)◂175'
	mov r10,GLX(174)
	mov r8,GLX(175)
; .adt_call t6 : _r64◂
	call LB_25
;; %0~127'(= {| ? |} )%2~{ 171'(= r ) 172'(= {| ? |} ) }
; ##8 { 171'(= r ) 172'(= {| ? |} ) } ⊢ { 171'(= r ) 172'(= {| ? |} ) }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(171)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(172)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_30:
	cmp rsi,rax 
	jz LB_31
	push rsi 
	push rax 
	C_PUSH_REGS
	mov r10,SX(0)
	mov r8,SX(1)
; .adt_call t5 : { _s8◂ _r64◂}
	call LB_32
	C_POP_REGS
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	add rax,1 
	jmp LB_30
LB_31:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_39,46
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; %0~127'(= {| ? |} )%6~{ 171'(= r ) 172'(= {| ? |} ) }
; ##86 { { 171'(= r ) 172'(= {| ? |} ) } %[ "ywww" ] } ⊢ { { 207'(= r ) 208'(= {| ? |} ) } { 209'(= {| l |} ) 210'(6)◂211' } }
	push EXH_49
	MOV_RBX GLX(176),GLX(171)
	MOV_RBX GLX(177),GLX(172)
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],4
	C_CALL_SF calloc
	mov QWORD [rax],4
	mov BYTE [rax+8+0],121
	mov BYTE [rax+8+1],119
	mov BYTE [rax+8+2],119
	mov BYTE [rax+8+3],119
	mov GLX(178),rax
	call LB_40
	add rsp,8
	MOV_RBX GLX(207),GLX(0)
	MOV_RBX GLX(208),GLX(1)
	MOV_RBX GLX(209),GLX(2)
	MOV_RBX GLX(210),GLX(3)
	MOV_RBX GLX(211),GLX(4)
; .dlt.ptn 209'(= {| l |} )
	mov r8,GLX(209)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ∎
	jmp RTM_1
EXH_9:
	add rsp,8
	pop rax
	jmp rax
EXH_24:
	add rsp,8
	pop rax
	jmp rax
EXH_49:
	add rsp,8
	pop rax
	jmp rax
;; rfb=f
LB_50: ;; #88◂◂(_none◂{}) 212'(= r ) ⊢ 0'(= {| l |} ) : (_r64◂→_s8◂)
JMP_50:
	MOV_RBX GLX(213),GLX(212)
;; %0~213'(= r )
	mov rax,GLX(213)
	cmp rax,4
	jge LB_56
	jmp QWORD [LB_55+8*rax]
LB_55: dq LB_51,LB_52,LB_53,LB_54,0
LB_51:
;; %0~213'(= r )
; ∎ %[ "ee" ]
; .dlt.ptn 213'(= r )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],2
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],101
	mov BYTE [rax+8+1],101
	mov GLX(0),rax
	ret
LB_52:
;; %0~213'(= r )
; ∎ %[ "f90" ]
; .dlt.ptn 213'(= r )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],3
	C_CALL_SF calloc
	mov QWORD [rax],3
	mov BYTE [rax+8+0],102
	mov BYTE [rax+8+1],57
	mov BYTE [rax+8+2],48
	mov GLX(0),rax
	ret
LB_53:
;; %0~213'(= r )
; ∎ %[ "eee" ]
; .dlt.ptn 213'(= r )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],3
	C_CALL_SF calloc
	mov QWORD [rax],3
	mov BYTE [rax+8+0],101
	mov BYTE [rax+8+1],101
	mov BYTE [rax+8+2],101
	mov GLX(0),rax
	ret
LB_54:
;; %0~213'(= r )
; ∎ %[ "f90" ]
; .dlt.ptn 213'(= r )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],3
	C_CALL_SF calloc
	mov QWORD [rax],3
	mov BYTE [rax+8+0],102
	mov BYTE [rax+8+1],57
	mov BYTE [rax+8+2],48
	mov GLX(0),rax
	ret
LB_56:
;; %0~213'(= r )
; ∎ %[ "2" ]
; .dlt.ptn 213'(= r )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],1
	C_CALL_SF calloc
	mov QWORD [rax],1
	mov BYTE [rax+8+0],50
	mov GLX(0),rax
	ret
RTM_1:
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##88 %[ 0r ] ⊢ 214'(= {| l |} )
	push EXH_57
	mov rax,0
	mov GLX(212),rax
	call LB_50
	add rsp,8
	MOV_RBX GLX(214),GLX(0)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%10~214'(= {| l |} )
; ##8 214'(= {| l |} ) ⊢ 214'(= {| l |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(214)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_58,10
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 214'(= {| l |} )
	mov r8,GLX(214)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##88 %[ 1r ] ⊢ 215'(= {| l |} )
	push EXH_59
	mov rax,1
	mov GLX(212),rax
	call LB_50
	add rsp,8
	MOV_RBX GLX(215),GLX(0)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%12~215'(= {| l |} )
; ##8 215'(= {| l |} ) ⊢ 215'(= {| l |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(215)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_60,10
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 215'(= {| l |} )
	mov r8,GLX(215)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##88 %[ 2r ] ⊢ 216'(= {| l |} )
	push EXH_61
	mov rax,2
	mov GLX(212),rax
	call LB_50
	add rsp,8
	MOV_RBX GLX(216),GLX(0)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%14~216'(= {| l |} )
; ##8 216'(= {| l |} ) ⊢ 216'(= {| l |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(216)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_62,10
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 216'(= {| l |} )
	mov r8,GLX(216)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##88 %[ 4r ] ⊢ 217'(= {| l |} )
	push EXH_63
	mov rax,4
	mov GLX(212),rax
	call LB_50
	add rsp,8
	MOV_RBX GLX(217),GLX(0)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%16~217'(= {| l |} )
; ##8 217'(= {| l |} ) ⊢ 217'(= {| l |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(217)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_64,10
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 217'(= {| l |} )
	mov r8,GLX(217)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##88 %[ 20r ] ⊢ 218'(= {| l |} )
	push EXH_65
	mov rax,20
	mov GLX(212),rax
	call LB_50
	add rsp,8
	MOV_RBX GLX(218),GLX(0)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%18~218'(= {| l |} )
; ##8 218'(= {| l |} ) ⊢ 218'(= {| l |} )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(218)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_66,10
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 218'(= {| l |} )
	mov r8,GLX(218)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ∎
	jmp RTM_2
EXH_57:
	add rsp,8
	pop rax
	jmp rax
EXH_59:
	add rsp,8
	pop rax
	jmp rax
EXH_61:
	add rsp,8
	pop rax
	jmp rax
EXH_63:
	add rsp,8
	pop rax
	jmp rax
EXH_65:
	add rsp,8
	pop rax
	jmp rax
;; rfb=f
LB_67: ;; #89◂◂(_none◂{}) 219'(= r ) ⊢ 0'(= r ) : (_r64◂→_r64◂)
JMP_67:
	MOV_RBX GLX(220),GLX(219)
;; %0~220'(= r )
	cmp GLX(220),0
	jz LB_69
	jmp LB_68
LB_68:
;; %0~220'(= r )
; ∎ %[ 3r ]
; .dlt.ptn 220'(= r )
	mov rax,3
	mov GLX(0),rax
	ret
LB_69:
;; %0~220'(= r )
; ∎ %[ 5r ]
; .dlt.ptn 220'(= r )
	mov rax,5
	mov GLX(0),rax
	ret
RTM_2:
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##89 %[ 2r ] ⊢ 221'(= r )
	push EXH_70
	mov rax,2
	mov GLX(219),rax
	call LB_67
	add rsp,8
	MOV_RBX GLX(221),GLX(0)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%20~221'(= r )
; ##8 221'(= r ) ⊢ 221'(= r )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(221)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_71,11
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 221'(= r )
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ∎
	jmp RTM_3
EXH_70:
	add rsp,8
	pop rax
	jmp rax
;; rfb=f
LB_72: ;; #90◂◂(_none◂{}) 222'(= {| l |} ) ⊢ 0'(= {| l |} ) : (_s8◂→_s8◂)
JMP_72:
	MOV_RBX GLX(223),GLX(222)
;; %0~223'(= {| l |} )
; #.#50 223'(= {| l |} ) ⊢ { 223'(= {| l |} ) 224'(= r ) }
	mov rdi,GLX(223)
	call mm32 
	mov GLX(224),rax
;; %1~223'(= {| l |} )%2~224'(= r )
; #.#8 224'(= r ) ⊢ 224'(= r )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(224)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_73,11
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 224'(= r )
;; %1~223'(= {| l |} )
; ∎ 223'(= {| l |} )
	MOV_RBX GLX(0),GLX(223)
	ret
RTM_3:
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##90 %[ "hello" ] ⊢ 225'(= {| l |} )
	push EXH_74
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
	mov GLX(222),rax
	call LB_72
	add rsp,8
	MOV_RBX GLX(225),GLX(0)
; .dlt.ptn 225'(= {| l |} )
	mov r8,GLX(225)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##90 %[ "of002390jf" ] ⊢ 226'(= {| l |} )
	push EXH_75
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	add QWORD [S8_N],10
	C_CALL_SF calloc
	mov QWORD [rax],10
	mov BYTE [rax+8+0],111
	mov BYTE [rax+8+1],102
	mov BYTE [rax+8+2],48
	mov BYTE [rax+8+3],48
	mov BYTE [rax+8+4],50
	mov BYTE [rax+8+5],51
	mov BYTE [rax+8+6],57
	mov BYTE [rax+8+7],48
	mov BYTE [rax+8+8],106
	mov BYTE [rax+8+9],102
	mov GLX(222),rax
	call LB_72
	add rsp,8
	MOV_RBX GLX(226),GLX(0)
; .dlt.ptn 226'(= {| l |} )
	mov r8,GLX(226)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##90 %[ "jj" ] ⊢ 227'(= {| l |} )
	push EXH_76
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],2
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],106
	mov BYTE [rax+8+1],106
	mov GLX(222),rax
	call LB_72
	add rsp,8
	MOV_RBX GLX(227),GLX(0)
; .dlt.ptn 227'(= {| l |} )
	mov r8,GLX(227)
	FREE_S8 r8
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ∎
	jmp RTM_4
EXH_74:
	add rsp,8
	pop rax
	jmp rax
EXH_75:
	add rsp,8
	pop rax
	jmp rax
EXH_76:
	add rsp,8
	pop rax
	jmp rax
;; rfb=f
LB_85: ;; #91◂◂(_none◂{}) { 232'(= r ) 233'(= r ) { 234'(= r ) 235'(= r ) } } ⊢ { 0'(= r ) { 1'(= r ) 2'(= r ) } } : ({ _r64◂ _r64◂{ _r64◂ _r64◂}}→{ _r64◂ { _r64◂ _r64◂}})
JMP_85:
	MOV_RBX GLX(236),GLX(232)
	MOV_RBX GLX(237),GLX(233)
	MOV_RBX GLX(238),GLX(234)
	MOV_RBX GLX(239),GLX(235)
;; %0~236'(= r )%1~237'(= r )%2~238'(= r )%3~239'(= r )
; #.#11 { 236'(= r ) 238'(= r ) } ⊢ { 236'(= r ) 238'(= r ) }
	mov rdi,GLX(238)
	add GLX(236),rdi
;; %1~237'(= r )%3~239'(= r )%4~236'(= r )%5~238'(= r )
; #.#9 238'(= r ) ⊢ 238'(= r )
	add GLX(238),1
;; %1~237'(= r )%3~239'(= r )%4~236'(= r )%6~238'(= r )
; ∎ { 236'(= r ) { 239'(= r ) 238'(= r ) } }
; .dlt.ptn 237'(= r )
	MOV_RBX GLX(0),GLX(236)
	MOV_RBX GLX(1),GLX(239)
	MOV_RBX GLX(2),GLX(238)
	ret
RTM_4:
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##0 { %[ 6r ] { %[ 0r ] %[ 4r ] } } ⊢ { %[ 6r ] { %[ 0r ] %[ 4r ] } 228'(= {| ? |} ) }
	mov rdi,6
	push rdi 
	imul rdi,2
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc
	pop rdi 
	mov GLX(228),rax
	mov QWORD [rax],rdi 
	push DST_REG
	lea DST_REG,[rax+8] 
	mov rax,rdi 
	and rax,3  
	and rdi,~3
	mov GLX(229),rdi
	jmp QWORD [LB_80+8*rax]
LB_80: dq LB_77,LB_82,LB_83,LB_84
LB_84:
	call LB_79
LB_83:
	call LB_79
LB_82:
	call LB_79
	mov rdi,GLX(229)
LB_77:
	cmp rdi,0 
	jz LB_78
	mov GLX(229),rdi
	call LB_79
	call LB_79
	call LB_79
	call LB_79
	mov rdi,GLX(229)
	sub rdi,4
	jmp LB_77
LB_79:
	mov rax,0
	mov DX(0),rax
	mov rax,4
	mov DX(1),rax
	lea DST_REG,[DST_REG+8*2]
	ret 
LB_78:
	pop DST_REG
; .dlt.ptn { %[ 0r ] %[ 4r ] }
; .dlt.ptn %[ 6r ]
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%27~228'(= {| ? |} )
; # ?  { %[ 2r ] %[ 3r ] 228'(= {| ? |} ) } ⊢ { 243'(= r ) 228'(= {| ? |} ) }
	mov rax,3
	mov rdi,GLX(228)
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [rdi]
	cmp rax,rsi 
	jge err_exc_q
	 imul rax,2
	push rdi 
	lea SRC_REG,[rdi+8+8*rax]
	push SRC_REG
	MOV_RDI GLX(230),SX(0)
	MOV_RDI GLX(231),SX(1)
	push EXH_86
	mov rax,2
	mov GLX(232),rax
	mov rax,3
	mov GLX(233),rax
	MOV_RBX GLX(234),GLX(230)
	MOV_RBX GLX(235),GLX(231)
	call LB_85
	add rsp,8
	MOV_RBX GLX(240),GLX(0)
	MOV_RBX GLX(241),GLX(1)
	MOV_RBX GLX(242),GLX(2)
	pop DST_REG
	pop GLX(228)
	MOV_RDI DX(0),GLX(241)
	MOV_RDI DX(1),GLX(242)
	MOV_RBX GLX(243),GLX(240)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%28~243'(= r )%29~228'(= {| ? |} )
; ##8 { 243'(= r ) 228'(= {| ? |} ) } ⊢ { 243'(= r ) 228'(= {| ? |} ) }
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(243)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(228)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,[r8]
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_87:
	cmp rsi,rax 
	jz LB_88
	push rsi 
	push rax 
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
	lea SRC_REG,[SRC_REG+8*2]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	add rax,1 
	jmp LB_87
LB_88:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_89,40
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 243'(= r ) 228'(= {| ? |} ) }
	mov r8,GLX(228)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_90:
	cmp rsi,0
	jz LB_91
	push rsi 
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*2]
	jmp LB_90
LB_91:
	pop rdi
	pop SRC_REG 
	C_CALL_SF free 
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ∎
	jmp RTM_5
EXH_86:
	add rsp,8
	pop rax
	jmp rax
;; rfb=f
LB_103: ;; #92◂◂(_none◂{}) { 249'(= r ) 250'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64◂ _r64◂}→{ _r64◂ _r64◂})
JMP_103:
	MOV_RBX GLX(251),GLX(249)
	MOV_RBX GLX(252),GLX(250)
;; %0~251'(= r )%1~252'(= r )
; ∎ { 252'(= r ) 251'(= r ) }
	MOV_RBX GLX(0),GLX(252)
	MOV_RBX GLX(1),GLX(251)
	ret
RTM_5:
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'
; ##62 { } ⊢ 244'(= [| _ |] )
	mov rdi,QWORD [CLR_N]
	add QWORD [CLR_N],1 
	ALC_RCD 3,rax
	mov GLX(244),rax
	mov QWORD [rax+8],rdi
	mov QWORD [rax+16],0 
	mov QWORD [rax+24],~0
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%31~244'(= [| _ |] )
; ##8 244'(= [| _ |] ) ⊢ 244'(= [| _ |] )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(244)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_Clr_l,8
	mov rsi,QWORD [r8+16]
	mov rax,QWORD [r8+24]
	push SRC_REG 
	push r8 
LB_92:
	cmp rsi,0 
	jz LB_93
	lea SRC_REG,QWORD [rax+24]
	mov rax,QWORD [rax] 
	sub rsi,1 
	push rsi 
	push rax 
	RT_ERR 0xffff_0047
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	jmp LB_92
LB_93:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_rcd_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_94,18
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%32~244'(= [| _ |] )
; ##63 { 244'(= [| _ |] ) %[ 0r ] } ⊢ { 244'(= [| _ |] ) 245'(= [| _ |] ) }
	ALC_RCD 3,rax
	mov GLX(245),rax
	mov rdi,GLX(244)
	add QWORD [rdi+16],1 
	mov rsi,QWORD [rdi+8]
	mov QWORD [rax+8],rsi 
	mov rsi,QWORD [rdi+24]
	mov QWORD [rax],rsi 
	mov QWORD [rdi+24],rax 
	mov QWORD [rax+16],2 
	lea DST_REG,[rax+24]
	mov rax,0
	mov DX(0),rax
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%33~244'(= [| _ |] )%34~245'(= [| _ |] )
; ##8 244'(= [| _ |] ) ⊢ 244'(= [| _ |] )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(244)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_Clr_l,8
	mov rsi,QWORD [r8+16]
	mov rax,QWORD [r8+24]
	push SRC_REG 
	push r8 
LB_95:
	cmp rsi,0 
	jz LB_96
	lea SRC_REG,QWORD [rax+24]
	mov rax,QWORD [rax] 
	sub rsi,1 
	push rsi 
	push rax 
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	jmp LB_95
LB_96:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_rcd_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_97,18
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%34~245'(= [| _ |] )%35~244'(= [| _ |] )
; ##8 245'(= [| _ |] ) ⊢ 245'(= [| _ |] )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(245)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST LB_98,3
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_99,17
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%35~244'(= [| _ |] )%36~245'(= [| _ |] )
; ##63 { 244'(= [| _ |] ) %[ 2r ] } ⊢ { 244'(= [| _ |] ) 246'(= [| _ |] ) }
	ALC_RCD 3,rax
	mov GLX(246),rax
	mov rdi,GLX(244)
	add QWORD [rdi+16],1 
	mov rsi,QWORD [rdi+8]
	mov QWORD [rax+8],rsi 
	mov rsi,QWORD [rdi+24]
	mov QWORD [rax],rsi 
	mov QWORD [rdi+24],rax 
	mov QWORD [rax+16],2 
	lea DST_REG,[rax+24]
	mov rax,2
	mov DX(0),rax
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%36~245'(= [| _ |] )%37~244'(= [| _ |] )%38~246'(= [| _ |] )
; ##63 { 244'(= [| _ |] ) %[ 3r ] } ⊢ { 244'(= [| _ |] ) 247'(= [| _ |] ) }
	ALC_RCD 3,rax
	mov GLX(247),rax
	mov rdi,GLX(244)
	add QWORD [rdi+16],1 
	mov rsi,QWORD [rdi+8]
	mov QWORD [rax+8],rsi 
	mov rsi,QWORD [rdi+24]
	mov QWORD [rax],rsi 
	mov QWORD [rdi+24],rax 
	mov QWORD [rax+16],2 
	lea DST_REG,[rax+24]
	mov rax,3
	mov DX(0),rax
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%36~245'(= [| _ |] )%38~246'(= [| _ |] )%39~244'(= [| _ |] )%40~247'(= [| _ |] )
; ##8 244'(= [| _ |] ) ⊢ 244'(= [| _ |] )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(244)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_Clr_l,8
	mov rsi,QWORD [r8+16]
	mov rax,QWORD [r8+24]
	push SRC_REG 
	push r8 
LB_100:
	cmp rsi,0 
	jz LB_101
	lea SRC_REG,QWORD [rax+24]
	mov rax,QWORD [rax] 
	sub rsi,1 
	push rsi 
	push rax 
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	jmp LB_100
LB_101:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_rcd_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_102,18
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%36~245'(= [| _ |] )%38~246'(= [| _ |] )%40~247'(= [| _ |] )%41~244'(= [| _ |] )
; # ?  { %[ 5r ] 247'(= [| _ |] ) 244'(= [| _ |] ) } ⊢ { 255'(= r ) 247'(= [| _ |] ) 244'(= [| _ |] ) }
	mov rax,GLX(247)
	mov rdi,GLX(244)
	mov rsi,QWORD [rax+8] 
	cmp QWORD [rdi+8],rsi 
	jnz err_exc_q
	push rdi 
	push rax 
	lea SRC_REG,[rax+24]
	push SRC_REG 
	MOV_RDI GLX(248),SX(0)
	push EXH_104
	mov rax,5
	mov GLX(249),rax
	MOV_RBX GLX(250),GLX(248)
	call LB_103
	add rsp,8
	MOV_RBX GLX(253),GLX(0)
	MOV_RBX GLX(254),GLX(1)
	pop DST_REG
	pop GLX(247)
	pop GLX(244)
	MOV_RDI DX(0),GLX(254)
	MOV_RBX GLX(255),GLX(253)
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%36~245'(= [| _ |] )%38~246'(= [| _ |] )%42~255'(= r )%43~247'(= [| _ |] )%44~244'(= [| _ |] )
; ##8 255'(= r ) ⊢ 255'(= r )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(255)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_105,11
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn 255'(= r )
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%36~245'(= [| _ |] )%38~246'(= [| _ |] )%43~247'(= [| _ |] )%44~244'(= [| _ |] )
; ##8 244'(= [| _ |] ) ⊢ 244'(= [| _ |] )
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(244)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_Clr_l,8
	mov rsi,QWORD [r8+16]
	mov rax,QWORD [r8+24]
	push SRC_REG 
	push r8 
LB_106:
	cmp rsi,0 
	jz LB_107
	lea SRC_REG,QWORD [rax+24]
	mov rax,QWORD [rax] 
	sub rsi,1 
	push rsi 
	push rax 
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	jmp LB_106
LB_107:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_rcd_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_108,18
	EMT_FLSH
	mov QWORD [SIG_FLG],0
;; %0~127'(= {| ? |} )%7~{ 207'(= r ) 208'(= {| ? |} ) }%9~210'(6)◂211'%36~245'(= [| _ |] )%38~246'(= [| _ |] )%43~247'(= [| _ |] )%46~244'(= [| _ |] )
; ∎
	jmp RTM_6
EXH_104:
	add rsp,8
	pop rax
	jmp rax
RTM_6:
	C_CALL exit

%include "TEXT.s"
