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

LB_318: db 95,0
LB_1238: db 10,0
LB_1239: db 58,0
LB_1240: db 45,0
LB_1241: db 112,114,115,95,101,114,114,32,0
LB_1243: db 59,32,226,136,142,124,10,101,120,110,32,53,48,54,57,52,58,10,0
LB_1247: db 58,10,0
LB_1248: db 45,0
LB_1249: db 110,108,115,95,101,114,114,32,0
LB_1251: db 59,32,226,136,142,124,10,101,120,110,32,53,48,56,52,51,58,10,0
LB_1300: db 59,32,226,136,142,124,10,101,120,110,32,53,49,50,53,51,58,10,0
LB_1400: db 34,108,105,110,101,95,114,101,115,95,99,32,48,34,0
LB_1402: db 59,32,226,136,142,124,10,101,120,110,32,53,50,49,49,49,58,10,0
LB_3576: db 34,33,33,33,34,0
LB_3581: db 34,63,63,63,34,0
LB_4051: db 34,100,116,95,101,116,114,32,48,34,0
LB_4425: db 34,108,99,95,101,116,114,95,98,111,100,121,32,48,34,0
LB_4818: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,48,34,0
LB_4821: db 59,32,226,136,142,124,10,101,120,110,32,55,54,50,53,52,58,10,0
LB_4851: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,49,34,0
LB_4854: db 59,32,226,136,142,124,10,101,120,110,32,55,54,53,50,51,58,10,0
LB_5157: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,194,167,194,167,32,77,49,32,61,32,77,48,10,0
LB_5158: db 9,226,136,142,32,120,32,10,0
LB_5165: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,194,167,194,167,32,77,49,32,61,32,77,48,10,0
LB_5174: db 39,48,226,151,130,0
LB_5176: db 39,49,226,151,130,0
LB_5181: db 39,48,226,151,130,0
LB_5183: db 39,49,226,151,130,0
LB_5189: db 39,48,226,151,130,0
LB_5190: db 39,49,226,151,130,0
LB_5195: db 39,48,226,151,130,0
LB_5197: db 39,49,226,151,130,0
LB_5206: db 39,48,226,151,130,0
LB_5208: db 39,49,226,151,130,0
LB_5210: db 39,50,226,151,130,0
LB_5212: db 39,51,226,151,130,0
LB_5214: db 39,52,226,151,130,0
LB_5216: db 39,53,226,151,130,0
LB_5222: db 39,48,226,151,130,0
LB_5223: db 39,49,226,151,130,0
LB_5228: db 39,48,226,151,130,0
LB_5231: db 39,49,226,151,130,0
LB_5240: db 39,48,226,151,130,0
LB_5242: db 39,49,226,151,130,0
LB_5243: db 39,50,226,151,130,0
LB_5244: db 39,51,226,151,130,0
LB_5246: db 39,52,226,151,130,0
LB_5251: db 39,48,226,151,130,0
LB_5252: db 39,49,226,151,130,0
LB_5257: db 39,48,226,151,130,0
LB_5258: db 39,49,226,151,130,0
LB_5263: db 39,48,226,151,130,0
LB_5264: db 39,49,226,151,130,0
LB_5269: db 39,48,226,151,130,0
LB_5270: db 39,49,226,151,130,0
LB_5275: db 39,48,226,151,130,0
LB_5279: db 39,49,226,151,130,0
LB_5289: db 39,48,226,151,130,0
LB_5291: db 39,49,226,151,130,0
LB_5293: db 39,50,226,151,130,0
LB_5295: db 39,51,226,151,130,0
LB_5297: db 39,52,226,151,130,0
LB_5299: db 39,53,226,151,130,0
LB_5301: db 39,54,226,151,130,0
LB_5306: db 39,48,226,151,130,0
LB_5307: db 39,49,226,151,130,0
LB_5312: db 39,48,226,151,130,0
LB_5314: db 39,49,226,151,130,0
LB_5320: db 39,48,226,151,130,0
LB_5321: db 39,49,226,151,130,0
LB_5326: db 39,48,226,151,130,0
LB_5330: db 39,49,226,151,130,0
LB_5336: db 39,48,226,151,130,0
LB_5337: db 39,49,226,151,130,0
LB_5338: db 39,50,226,151,130,0
LB_5343: db 39,48,226,151,130,0
LB_5345: db 39,49,226,151,130,0
LB_5351: db 39,48,226,151,130,0
LB_5352: db 39,49,226,151,130,0
LB_5354: db 39,50,226,151,130,0
LB_5359: db 39,48,226,151,130,0
LB_5361: db 39,49,226,151,130,0
LB_5371: db 39,48,226,151,130,0
LB_5373: db 39,49,226,151,130,0
LB_5376: db 39,50,226,151,130,0
LB_5377: db 39,51,226,151,130,0
LB_5378: db 39,52,226,151,130,0
LB_5379: db 39,53,226,151,130,0
LB_5380: db 39,54,226,151,130,0
LB_5390: db 39,48,226,151,130,0
LB_5392: db 39,49,226,151,130,0
LB_5394: db 39,50,226,151,130,0
LB_5396: db 39,51,226,151,130,0
LB_5398: db 39,52,226,151,130,0
LB_5400: db 39,53,226,151,130,0
LB_5402: db 39,54,226,151,130,0
LB_5407: db 39,48,226,151,130,0
LB_5408: db 39,49,226,151,130,0
LB_5413: db 39,48,226,151,130,0
LB_5415: db 39,49,226,151,130,0
LB_5421: db 39,48,226,151,130,0
LB_5422: db 39,49,226,151,130,0
LB_5427: db 39,48,226,151,130,0
LB_5431: db 39,49,226,151,130,0
LB_5437: db 39,48,226,151,130,0
LB_5438: db 39,49,226,151,130,0
LB_5439: db 39,50,226,151,130,0
LB_5444: db 39,48,226,151,130,0
LB_5446: db 39,49,226,151,130,0
LB_5452: db 39,48,226,151,130,0
LB_5453: db 39,49,226,151,130,0
LB_5455: db 39,50,226,151,130,0
LB_5460: db 39,48,226,151,130,0
LB_5462: db 39,49,226,151,130,0
LB_5472: db 39,48,226,151,130,0
LB_5473: db 39,49,226,151,130,0
LB_5474: db 39,50,226,151,130,0
LB_5475: db 39,51,226,151,130,0
LB_5476: db 39,52,226,151,130,0
LB_5477: db 39,53,226,151,130,0
LB_5478: db 39,54,226,151,130,0
LB_5483: db 39,48,226,151,130,0
LB_5485: db 39,49,226,151,130,0
LB_5493: db 39,48,226,151,130,0
LB_5494: db 39,49,226,151,130,0
LB_5495: db 39,50,226,151,130,0
LB_5497: db 39,51,226,151,130,0
LB_5502: db 39,48,226,151,130,0
LB_5503: db 39,49,226,151,130,0
LB_5508: db 39,48,226,151,130,0
LB_5509: db 39,49,226,151,130,0
LB_5514: db 39,48,226,151,130,0
LB_5515: db 39,49,226,151,130,0
LB_5522: db 39,48,226,151,130,0
LB_5523: db 39,49,226,151,130,0
LB_5524: db 39,50,226,151,130,0
LB_5525: db 39,51,226,151,130,0
LB_5533: db 39,48,226,151,130,0
LB_5535: db 39,49,226,151,130,0
LB_5540: db 39,48,226,151,130,0
LB_5541: db 39,49,226,151,130,0
LB_5546: db 39,48,226,151,130,0
LB_5547: db 39,49,226,151,130,0
LB_5552: db 39,48,226,151,130,0
LB_5554: db 39,49,226,151,130,0
LB_5560: db 39,48,226,151,130,0
LB_5561: db 39,49,226,151,130,0
LB_5563: db 39,50,226,151,130,0
LB_5570: db 39,48,226,151,130,0
LB_5571: db 39,49,226,151,130,0
LB_5572: db 39,50,226,151,130,0
LB_5573: db 39,51,226,151,130,0
LB_5578: db 39,48,226,151,130,0
LB_5579: db 39,49,226,151,130,0
LB_5584: db 39,48,226,151,130,0
LB_5586: db 39,49,226,151,130,0
LB_5591: db 39,48,226,151,130,0
LB_5592: db 39,49,226,151,130,0
LB_5597: db 39,48,226,151,130,0
LB_5598: db 39,49,226,151,130,0
LB_5603: db 39,48,226,151,130,0
LB_5605: db 39,49,226,151,130,0
LB_5613: db 39,48,226,151,130,0
LB_5615: db 39,49,226,151,130,0
LB_5616: db 39,50,226,151,130,0
LB_5617: db 39,51,226,151,130,0
LB_5624: db 39,48,226,151,130,0
LB_5626: db 39,49,226,151,130,0
LB_5627: db 39,50,226,151,130,0
LB_5628: db 39,51,226,151,130,0
LB_5634: db 39,48,226,151,130,0
LB_5635: db 39,49,226,151,130,0
LB_5643: db 39,48,226,151,130,0
LB_5644: db 39,49,226,151,130,0
LB_5645: db 39,50,226,151,130,0
LB_5646: db 39,51,226,151,130,0
LB_5647: db 39,52,226,151,130,0
LB_5652: db 39,48,226,151,130,0
LB_5653: db 39,49,226,151,130,0
LB_5658: db 39,48,226,151,130,0
LB_5660: db 39,49,226,151,130,0
LB_5668: db 39,48,226,151,130,0
LB_5669: db 39,49,226,151,130,0
LB_5670: db 39,50,226,151,130,0
LB_5672: db 39,51,226,151,130,0
LB_5677: db 39,48,226,151,130,0
LB_5678: db 39,49,226,151,130,0
LB_5683: db 39,48,226,151,130,0
LB_5684: db 39,49,226,151,130,0
LB_5689: db 39,48,226,151,130,0
LB_5690: db 39,49,226,151,130,0
LB_5697: db 39,48,226,151,130,0
LB_5698: db 39,49,226,151,130,0
LB_5699: db 39,50,226,151,130,0
LB_5700: db 39,51,226,151,130,0
LB_5708: db 39,48,226,151,130,0
LB_5710: db 39,49,226,151,130,0
LB_5715: db 39,48,226,151,130,0
LB_5716: db 39,49,226,151,130,0
LB_5721: db 39,48,226,151,130,0
LB_5722: db 39,49,226,151,130,0
LB_5727: db 39,48,226,151,130,0
LB_5729: db 39,49,226,151,130,0
LB_5735: db 39,48,226,151,130,0
LB_5736: db 39,49,226,151,130,0
LB_5737: db 39,50,226,151,130,0
LB_5742: db 39,48,226,151,130,0
LB_5743: db 39,49,226,151,130,0
LB_5748: db 39,48,226,151,130,0
LB_5750: db 39,49,226,151,130,0
LB_5755: db 39,48,226,151,130,0
LB_5756: db 39,49,226,151,130,0
LB_5761: db 39,48,226,151,130,0
LB_5762: db 39,49,226,151,130,0
LB_5767: db 39,48,226,151,130,0
LB_5768: db 39,49,226,151,130,0
LB_5774: db 39,48,226,151,130,0
LB_5775: db 39,49,226,151,130,0
LB_5776: db 39,50,226,151,130,0
LB_5781: db 39,48,226,151,130,0
LB_5783: db 39,49,226,151,130,0
LB_5788: db 39,48,226,151,130,0
LB_5790: db 39,49,226,151,130,0
LB_5796: db 39,48,226,151,130,0
LB_5800: db 39,49,226,151,130,0
LB_5805: db 39,48,226,151,130,0
LB_5806: db 39,49,226,151,130,0
LB_5812: db 39,48,226,151,130,0
LB_5814: db 39,49,226,151,130,0
LB_5816: db 39,50,226,151,130,0
LB_5821: db 39,48,226,151,130,0
LB_5823: db 39,49,226,151,130,0
LB_5828: db 39,48,226,151,130,0
LB_5829: db 39,49,226,151,130,0
LB_5834: db 39,48,226,151,130,0
LB_5835: db 39,49,226,151,130,0
LB_5841: db 39,48,226,151,130,0
LB_5842: db 39,49,226,151,130,0
LB_5843: db 39,50,226,151,130,0
LB_5848: db 39,48,226,151,130,0
LB_5850: db 39,49,226,151,130,0
LB_5855: db 39,48,226,151,130,0
LB_5856: db 39,49,226,151,130,0
LB_5861: db 39,48,226,151,130,0
LB_5862: db 39,49,226,151,130,0
LB_5869: db 34,68,49,34,0
LB_5872: db 59,32,226,136,142,124,10,101,120,110,32,52,51,55,56,48,48,58,10,0
LB_5873: db 59,32,226,136,142,124,10,101,120,110,32,52,51,55,56,50,55,58,10,0
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
LB_14: ;; #67 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) } : (_t14→{ _t14 _r64 })
;; rsp=0 , %131~0'(= a14◂ [ ] ) 
;; ? 0'(= a14◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a14◂ [ ] ) 2'(= r ) 3'(= a14◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_16
	jmp LB_17
LB_16:
	jmp LB_15
LB_17:
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
	mov r9, QWORD [r13+24]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=0 , %136~3'(= a14◂ [ ] ) %135~2'(= r ) %134~1'(= a14◂ [ ] ) 
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov r13,rax
;; rsp=0 , %138~0'(= r ) %137~2'(= r ) %136~3'(= a14◂ [ ] ) %134~1'(= a14◂ [ ] ) 
; #65 { 1'(= a14◂ [ ] ) 0'(= r ) 3'(= a14◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a14◂ [ ] ) 0'(= r ) 3'(= a14◂ [ ] ) }
;; rsp=0 , %139~0(<4)◂{ 1'(= a14◂ [ ] ) 0'(= r ) 3'(= a14◂ [ ] ) } %137~2'(= r ) 
; ∎ { 0(<4)◂{ 1'(= a14◂ [ ] ) 0'(= r ) 3'(= a14◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 1'(= a14◂ [ ] ) 0'(= r ) 3'(= a14◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) }
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
LB_15:
;; ? 0'(= a14◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_19
	jmp LB_20
LB_19:
	jmp LB_18
LB_20:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %133~1'(= r ) 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %140~%[ 1r ] %133~1'(= r ) 
; #62 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %141~3(<4)◂1'(= r ) %140~%[ 1r ] 
; ∎ { 3(<4)◂1'(= r ) %[ 1r ] }
; .mov_ptn2 { 3(<4)◂1'(= r ) %[ 1r ] } ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r13
	mov r13,rax
	mov r14,1
	ret
LB_18:
;; ? 0'(= a14◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_22
	jmp LB_23
LB_22:
	jmp LB_21
LB_23:
;; rsp=0 , 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %142~2(<4)◂{ } 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %143~%[ 0r ] %142~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r14,0
	mov r13,unt_2
	ret
LB_21:
;; ?. 0'(= a14◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %132~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r14,rsi
;; rsp=0 , %145~1'(= r ) %144~0'(= {| l |} ) 
; #64 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %146~1(<4)◂0'(= {| l |} ) %145~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) }
; {| 110.. |}
	mov r8,r13
	mov r13,r8
	mov BYTE [r13+6],1
	ret
LB_13: ;; #69 { 0'(= {| l |} ) 1'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] ) : ({ _s8 _t14 }→_t14)
;; rsp=0 , %158~1'(= a14◂ [ ] ) %157~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r8,rsi
;; rsp=0 , %160~2'(= r ) %159~0'(= {| l |} ) %158~1'(= a14◂ [ ] ) 
; #67 1'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r8
; .mov_ptn2 1'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 11000000110.. |}
	mov r13,r14
	call LB_14
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %162~1'(= r ) %161~3'(= a14◂ [ ] ) %160~2'(= r ) %159~0'(= {| l |} ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %164~1'(= r ) %163~2'(= r ) %161~3'(= a14◂ [ ] ) %159~0'(= {| l |} ) 
; #64 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %165~1(<4)◂0'(= {| l |} ) %164~1'(= r ) %163~2'(= r ) %161~3'(= a14◂ [ ] ) 
; #65 { 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a14◂ [ ] ) } ⊢ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a14◂ [ ] ) }
;; rsp=0 , %166~0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a14◂ [ ] ) } %164~1'(= r ) 
; ∎ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a14◂ [ ] ) }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] )
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
LB_77: ;; #71 { 0'(= r ) 1'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] ) : ({ _r64 _t14 }→_t14)
;; rsp=0 , %175~1'(= a14◂ [ ] ) %174~0'(= r ) 
; #67 1'(= a14◂ [ ] ) ⊢ { 2'(= a14◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 1100000010.. |}
	mov r13,r14
	call LB_14
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %177~1'(= r ) %176~2'(= a14◂ [ ] ) %174~0'(= r ) 
; #11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %178~1'(= r ) %176~2'(= a14◂ [ ] ) %174~0'(= r ) 
; #62 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %179~3(<4)◂0'(= r ) %178~1'(= r ) %176~2'(= a14◂ [ ] ) 
; #65 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a14◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a14◂ [ ] ) }
;; rsp=0 , %180~0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a14◂ [ ] ) } 
; ∎ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a14◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] )
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
ETR_99:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_99
	ret
GRM_99:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3
	jmp LB_4
LB_3:
	mov r8,unt_1
	jmp LB_1
LB_4:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_5
	jmp LB_6
LB_5:
	mov r8,unt_1
	jmp LB_1
LB_6:
	add r14,1
	jmp LB_2
LB_1:
	add rsp,0
	jmp LB_0
LB_2:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_9
	jmp LB_10
LB_9:
	jmp LB_7
LB_10:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_8
LB_7:
	add rsp,0
	jmp LB_0
LB_8:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_11
LB_11
;; rsp=1 , %369~1'(= r ) %368~0'(= r ) %367~8'(= a14◂ [ ] ) 
; $ %[ "\\n" ] ⊢ %[ "\\n" ]
;; rsp=1 , %370~%[ "\\n" ] %369~1'(= r ) %368~0'(= r ) %367~8'(= a14◂ [ ] ) 
; #69 { %[ "\\n" ] 8'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "\\n" ] 8'(= a14◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a14◂ [ ] ) }
; {| 110000001110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],110
	mov r13,rax
	call LB_13
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %371~2'(= a14◂ [ ] ) %369~1'(= r ) %368~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %372~0(<2)◂2'(= a14◂ [ ] ) %369~1'(= r ) %368~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_12
LB_12:
	cmp BYTE [r8+6],0
	jnz LB_0
	POP_GRM_SCC
	ret
LB_0:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_27
	jmp LB_28
LB_27:
	mov r8,unt_1
	jmp LB_25
LB_28:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_29
	jmp LB_30
LB_29:
	mov r8,unt_1
	jmp LB_25
LB_30:
	add r14,1
	jmp LB_26
LB_25:
	add rsp,0
	jmp LB_24
LB_26:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_33
	jmp LB_34
LB_33:
	jmp LB_31
LB_34:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_32
LB_31:
	add rsp,0
	jmp LB_24
LB_32:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_35
LB_35
;; rsp=1 , %375~1'(= r ) %374~0'(= r ) %373~8'(= a14◂ [ ] ) 
; $ %[ "\\t" ] ⊢ %[ "\\t" ]
;; rsp=1 , %376~%[ "\\t" ] %375~1'(= r ) %374~0'(= r ) %373~8'(= a14◂ [ ] ) 
; #69 { %[ "\\t" ] 8'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "\\t" ] 8'(= a14◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a14◂ [ ] ) }
; {| 110000001110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],116
	mov r13,rax
	call LB_13
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %377~2'(= a14◂ [ ] ) %375~1'(= r ) %374~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %378~0(<2)◂2'(= a14◂ [ ] ) %375~1'(= r ) %374~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_36
LB_36:
	cmp BYTE [r8+6],0
	jnz LB_24
	POP_GRM_SCC
	ret
LB_24:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_40
	jmp LB_41
LB_40:
	mov r8,unt_1
	jmp LB_38
LB_41:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_42
	jmp LB_43
LB_42:
	mov r8,unt_1
	jmp LB_38
LB_43:
	add r14,1
	jmp LB_39
LB_38:
	add rsp,0
	jmp LB_37
LB_39:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_46
	jmp LB_47
LB_46:
	jmp LB_44
LB_47:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_45
LB_44:
	add rsp,0
	jmp LB_37
LB_45:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_48
LB_48
;; rsp=1 , %381~1'(= r ) %380~0'(= r ) %379~8'(= a14◂ [ ] ) 
; $ %[ "\\\\" ] ⊢ %[ "\\\\" ]
;; rsp=1 , %382~%[ "\\\\" ] %381~1'(= r ) %380~0'(= r ) %379~8'(= a14◂ [ ] ) 
; #69 { %[ "\\\\" ] 8'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "\\\\" ] 8'(= a14◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a14◂ [ ] ) }
; {| 110000001110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],92
	mov r13,rax
	call LB_13
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %383~2'(= a14◂ [ ] ) %381~1'(= r ) %380~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %384~0(<2)◂2'(= a14◂ [ ] ) %381~1'(= r ) %380~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_49
LB_49:
	cmp BYTE [r8+6],0
	jnz LB_37
	POP_GRM_SCC
	ret
LB_37:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_53
	jmp LB_54
LB_53:
	mov r8,unt_1
	jmp LB_51
LB_54:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_55
	jmp LB_56
LB_55:
	mov r8,unt_1
	jmp LB_51
LB_56:
	add r14,1
	jmp LB_52
LB_51:
	add rsp,0
	jmp LB_50
LB_52:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_59
	jmp LB_60
LB_59:
	jmp LB_57
LB_60:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_58
LB_57:
	add rsp,0
	jmp LB_50
LB_58:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_61
LB_61
;; rsp=1 , %387~1'(= r ) %386~0'(= r ) %385~8'(= a14◂ [ ] ) 
; $ %[ "\\\"" ] ⊢ %[ "\\\"" ]
;; rsp=1 , %388~%[ "\\\"" ] %387~1'(= r ) %386~0'(= r ) %385~8'(= a14◂ [ ] ) 
; #69 { %[ "\\\"" ] 8'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "\\\"" ] 8'(= a14◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a14◂ [ ] ) }
; {| 110000001110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],34
	mov r13,rax
	call LB_13
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %389~2'(= a14◂ [ ] ) %387~1'(= r ) %386~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %390~0(<2)◂2'(= a14◂ [ ] ) %387~1'(= r ) %386~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_62
LB_62:
	cmp BYTE [r8+6],0
	jnz LB_50
	POP_GRM_SCC
	ret
LB_50:
	RB_GRM
	cmp r14,r9
	jge LB_66
	jmp LB_67
LB_66:
	mov r8,unt_1 
	jmp LB_64
LB_67:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_65
LB_64:
	add rsp,0
	jmp LB_63
LB_65:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_70
	jmp LB_71
LB_70:
	jmp LB_68
LB_71:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_69
LB_68:
	add rsp,8
	jmp LB_63
LB_69:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_72
LB_72
;; rsp=2 , %394~1'(= r ) %393~0'(= r ) %392~9'(= a14◂ [ ] ) %391~8'(= r ) 
	cmp QWORD [rsp-8+8*2],0
	jnz LB_76
	jmp LB_75
LB_76:
	jmp LB_74
LB_75:
;; rsp=2 , %394~1'(= r ) %393~0'(= r ) %392~9'(= a14◂ [ ] ) %391~8'(= r ) 
; $ %[ "\\0" ] ⊢ %[ "\\0" ]
;; rsp=2 , %395~%[ "\\0" ] %394~1'(= r ) %393~0'(= r ) %392~9'(= a14◂ [ ] ) %391~8'(= r ) 
; #69 { %[ "\\0" ] 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ "\\0" ] 9'(= a14◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],48
	mov r13,rax
	call LB_13
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=1 , %396~2'(= a14◂ [ ] ) %394~1'(= r ) %393~0'(= r ) %391~8'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=1 , %397~0(<2)◂2'(= a14◂ [ ] ) %394~1'(= r ) %393~0'(= r ) %391~8'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_73
LB_74:
;; rsp=2 , %394~1'(= r ) %393~0'(= r ) %392~9'(= a14◂ [ ] ) %391~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_77
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %398~2'(= a14◂ [ ] ) %394~1'(= r ) %393~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %399~0(<2)◂2'(= a14◂ [ ] ) %394~1'(= r ) %393~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_73
LB_73:
	cmp BYTE [r8+6],0
	jnz LB_63
	POP_GRM_SCC
	ret
LB_63:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_79
LB_79
;; rsp=0 , %401~1'(= r ) %400~0'(= r ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %402~2(<4)◂{ } %401~1'(= r ) %400~0'(= r ) 
; #26 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %403~0(<2)◂2(<4)◂{ } %401~1'(= r ) %400~0'(= r ) 
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
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_80
LB_80:
	cmp BYTE [r8+6],0
	jnz LB_78
	POP_GRM_SCC
	ret
LB_78:
	POP_GRM_FAIL 
	ret
LB_95: ;; #73 { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t14 _s8 _r64 }→{ _t14 _s8 _r64 })
;; rsp=0 , %192~2'(= r ) %191~1'(= {| l |} ) %190~0'(= a14◂ [ ] ) 
;; ? 0'(= a14◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a14◂ [ ] ) 4'(= r ) 5'(= a14◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_97
	jmp LB_98
LB_97:
	jmp LB_96
LB_98:
	mov r9, QWORD [r13+8]
	mov r10, QWORD [r13+16]
	mov r11, QWORD [r13+24]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=0 , %197~5'(= a14◂ [ ] ) %196~4'(= r ) %195~3'(= a14◂ [ ] ) %192~2'(= r ) %191~1'(= {| l |} ) 
; #73 { 3'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r10
	mov QWORD [rsp+8],r11
; .mov_ptn2 { 3'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11110000110.. |}
	mov r13,r9
	call LB_95
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %200~2'(= r ) %199~1'(= {| l |} ) %198~0'(= a14◂ [ ] ) %197~5'(= a14◂ [ ] ) %196~4'(= r ) 
; #73 { 5'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 5'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11100100110.. |}
	mov r13,r11
	call LB_95
	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %203~2'(= r ) %202~1'(= {| l |} ) %201~3'(= a14◂ [ ] ) %198~0'(= a14◂ [ ] ) %196~4'(= r ) 
; #65 { 0'(= a14◂ [ ] ) 4'(= r ) 3'(= a14◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a14◂ [ ] ) 4'(= r ) 3'(= a14◂ [ ] ) }
;; rsp=0 , %204~0(<4)◂{ 0'(= a14◂ [ ] ) 4'(= r ) 3'(= a14◂ [ ] ) } %203~2'(= r ) %202~1'(= {| l |} ) 
; ∎ { 0(<4)◂{ 0'(= a14◂ [ ] ) 4'(= r ) 3'(= a14◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 0'(= a14◂ [ ] ) 4'(= r ) 3'(= a14◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
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
LB_96:
;; ? 0'(= a14◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_100
	jmp LB_101
LB_100:
	jmp LB_99
LB_101:
;; rsp=0 , %192~2'(= r ) %191~1'(= {| l |} ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %205~2(<4)◂{ } %192~2'(= r ) %191~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r13,unt_2
	ret
LB_99:
;; ? 0'(= a14◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_103
	jmp LB_104
LB_103:
	jmp LB_102
LB_104:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %194~3'(= r ) %192~2'(= r ) %191~1'(= {| l |} ) 
; #18 { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r8
	jle err
	mov rsi,r8
	mov rdi,r9
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %208~3'(= r ) %207~2'(= r ) %206~1'(= {| l |} ) 
; #11 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %209~2'(= r ) %208~3'(= r ) %206~1'(= {| l |} ) 
; #62 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %210~3(<4)◂3'(= r ) %209~2'(= r ) %206~1'(= {| l |} ) 
; ∎ { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11110.. |}
	mov r13,r9
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_102:
;; ?. 0'(= a14◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %193~0'(= {| l |} ) %192~2'(= r ) %191~1'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,[rdi] 
	mov r9,rsi
;; rsp=0 , %212~3'(= r ) %211~0'(= {| l |} ) %192~2'(= r ) %191~1'(= {| l |} ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %213~%[ 0r ] %212~3'(= r ) %211~0'(= {| l |} ) %192~2'(= r ) %191~1'(= {| l |} ) 
; #21 { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
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
;; rsp=0 , %218~2'(= r ) %217~1'(= {| l |} ) %216~%[ 0r ] %215~0'(= {| l |} ) %214~3'(= r ) 
; #64 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %219~1(<4)◂0'(= {| l |} ) %218~2'(= r ) %217~1'(= {| l |} ) %216~%[ 0r ] %214~3'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .dlt.ptn %[ 0r ]
; .dlt.ptn 3'(= r )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r9,r13
	mov r13,r9
	mov BYTE [r13+6],1
	ret
LB_94: ;; #74 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) } : (_t14→{ _t14 _s8 })
;; rsp=0 , %220~0'(= a14◂ [ ] ) 
; #67 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10.. |}
	call LB_14
;; rsp=0 , %222~1'(= r ) %221~0'(= a14◂ [ ] ) 
; #8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %224~2'(= {| l |} ) %223~1'(= r ) %221~0'(= a14◂ [ ] ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %225~%[ 0r ] %224~2'(= {| l |} ) %223~1'(= r ) %221~0'(= a14◂ [ ] ) 
; #73 { 0'(= a14◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a14◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 { 0'(= a14◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110000010.. |}
	mov r9,r8
	mov r8,0
	mov r14,r9
	call LB_95
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %228~2'(= r ) %227~3'(= {| l |} ) %226~0'(= a14◂ [ ] ) %223~1'(= r ) 
; ∎ { 0'(= a14◂ [ ] ) 3'(= {| l |} ) }
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
; .mov_ptn2 { 0'(= a14◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) }
; {| 11010.. |}
	mov r14,r9
	ret
LB_105:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_110+8*rax]
LB_110: dq LB_106,LB_107,LB_108,LB_109
LB_106:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_105
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_105
	pop r8 
	FREE_RCD 3, r8
	jmp LB_111
LB_107:
	mov rdi,r8
	call free_s8
	jmp LB_111
LB_108:
	jmp LB_111
LB_109:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_111
LB_111:
	ret
ETR_101:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_101
	ret
GRM_101:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_84
	jmp LB_85
LB_84:
	mov r8,unt_1
	jmp LB_82
LB_85:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_86
	jmp LB_87
LB_86:
	mov r8,unt_1
	jmp LB_82
LB_87:
	add r14,1
	jmp LB_83
LB_82:
	add rsp,0
	jmp LB_81
LB_83:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_90
	jmp LB_91
LB_90:
	jmp LB_88
LB_91:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_89
LB_88:
	add rsp,0
	jmp LB_81
LB_89:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_92
LB_92
;; rsp=1 , %416~1'(= r ) %415~0'(= r ) %414~8'(= a14◂ [ ] ) 
; #74 8'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 8'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 100000001110.. |}
	mov r13,QWORD [rsp-8+8*3]
	call LB_94
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %418~2'(= {| l |} ) %417~3'(= a14◂ [ ] ) %416~1'(= r ) %415~0'(= r ) 
; #26 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %419~0(<2)◂2'(= {| l |} ) %417~3'(= a14◂ [ ] ) %416~1'(= r ) %415~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_105
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
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	mov BYTE [r8+6],0
	jmp LB_93
LB_93:
	cmp BYTE [r8+6],0
	jnz LB_81
	POP_GRM_SCC
	ret
LB_81:
	POP_GRM_FAIL 
	ret
ETR_102:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_102
	ret
GRM_102:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_115
	jmp LB_116
LB_115:
	mov r8,unt_1
	jmp LB_113
LB_116:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_117
	jmp LB_118
LB_117:
	mov r8,unt_1
	jmp LB_113
LB_118:
	add r14,1
	jmp LB_114
LB_113:
	add rsp,0
	jmp LB_112
LB_114:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_119
LB_119
;; rsp=0 , %422~1'(= r ) %421~0'(= r ) %420~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %423~1(<2)◂{ } %422~1'(= r ) %421~0'(= r ) %420~{ } 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_120
LB_120:
	cmp BYTE [r8+6],0
	jnz LB_112
	POP_GRM_SCC
	ret
LB_112:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_124
	jmp LB_125
LB_124:
	mov r8,unt_1
	jmp LB_122
LB_125:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_126
	jmp LB_127
LB_126:
	mov r8,unt_1
	jmp LB_122
LB_127:
	add r14,1
	jmp LB_123
LB_122:
	add rsp,0
	jmp LB_121
LB_123:
	call GRM_103
	cmp BYTE [r8+6],0
	jnz LB_130
	jmp LB_131
LB_130:
	jmp LB_128
LB_131:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_129
LB_128:
	add rsp,0
	jmp LB_121
LB_129:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_134
	jmp LB_135
LB_134:
	jmp LB_132
LB_135:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_133
LB_132:
	add rsp,8
	jmp LB_121
LB_133:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_136
LB_136
;; rsp=2 , %427~1'(= r ) %426~0'(= r ) %425~9'(= a14◂ [ ] ) %424~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_77
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %428~2'(= a14◂ [ ] ) %427~1'(= r ) %426~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %429~0(<2)◂2'(= a14◂ [ ] ) %427~1'(= r ) %426~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_137
LB_137:
	cmp BYTE [r8+6],0
	jnz LB_121
	POP_GRM_SCC
	ret
LB_121:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_141
	jmp LB_142
LB_141:
	mov r8,unt_1
	jmp LB_139
LB_142:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_143
	jmp LB_144
LB_143:
	mov r8,unt_1
	jmp LB_139
LB_144:
	add r14,1
	jmp LB_140
LB_139:
	add rsp,0
	jmp LB_138
LB_140:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_145
LB_145
;; rsp=0 , %431~1'(= r ) %430~0'(= r ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %432~2(<4)◂{ } %431~1'(= r ) %430~0'(= r ) 
; #26 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %433~0(<2)◂2(<4)◂{ } %431~1'(= r ) %430~0'(= r ) 
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
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_146
LB_146:
	cmp BYTE [r8+6],0
	jnz LB_138
	POP_GRM_SCC
	ret
LB_138:
	RB_GRM
	cmp r14,r9
	jge LB_150
	jmp LB_151
LB_150:
	mov r8,unt_1 
	jmp LB_148
LB_151:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_149
LB_148:
	add rsp,0
	jmp LB_147
LB_149:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_154
	jmp LB_155
LB_154:
	jmp LB_152
LB_155:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_153
LB_152:
	add rsp,8
	jmp LB_147
LB_153:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_156
LB_156
;; rsp=2 , %437~1'(= r ) %436~0'(= r ) %435~9'(= a14◂ [ ] ) %434~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_77
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %438~2'(= a14◂ [ ] ) %437~1'(= r ) %436~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %439~0(<2)◂2'(= a14◂ [ ] ) %437~1'(= r ) %436~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_157
LB_157:
	cmp BYTE [r8+6],0
	jnz LB_147
	POP_GRM_SCC
	ret
LB_147:
	POP_GRM_FAIL 
	ret
ETR_103:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_103
	ret
GRM_103:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_161
	jmp LB_162
LB_161:
	mov r8,unt_1
	jmp LB_159
LB_162:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_163
	jmp LB_164
LB_163:
	mov r8,unt_1
	jmp LB_159
LB_164:
	add r14,1
	jmp LB_160
LB_159:
	add rsp,0
	jmp LB_158
LB_160:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_165
LB_165
;; rsp=0 , %441~1'(= r ) %440~0'(= r ) 
; $ %[ 92r ] ⊢ %[ 92r ]
;; rsp=0 , %442~%[ 92r ] %441~1'(= r ) %440~0'(= r ) 
; #26 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
;; rsp=0 , %443~0(<2)◂%[ 92r ] %441~1'(= r ) %440~0'(= r ) 
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
	jmp LB_166
LB_166:
	cmp BYTE [r8+6],0
	jnz LB_158
	POP_GRM_SCC
	ret
LB_158:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_170
	jmp LB_171
LB_170:
	mov r8,unt_1
	jmp LB_168
LB_171:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_172
	jmp LB_173
LB_172:
	mov r8,unt_1
	jmp LB_168
LB_173:
	add r14,1
	jmp LB_169
LB_168:
	add rsp,0
	jmp LB_167
LB_169:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_174
LB_174
;; rsp=0 , %445~1'(= r ) %444~0'(= r ) 
; $ %[ 34r ] ⊢ %[ 34r ]
;; rsp=0 , %446~%[ 34r ] %445~1'(= r ) %444~0'(= r ) 
; #26 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
;; rsp=0 , %447~0(<2)◂%[ 34r ] %445~1'(= r ) %444~0'(= r ) 
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
	jmp LB_175
LB_175:
	cmp BYTE [r8+6],0
	jnz LB_167
	POP_GRM_SCC
	ret
LB_167:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_179
	jmp LB_180
LB_179:
	mov r8,unt_1
	jmp LB_177
LB_180:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_181
	jmp LB_182
LB_181:
	mov r8,unt_1
	jmp LB_177
LB_182:
	add r14,1
	jmp LB_178
LB_177:
	add rsp,0
	jmp LB_176
LB_178:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_183
LB_183
;; rsp=0 , %449~1'(= r ) %448~0'(= r ) 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %450~%[ 10r ] %449~1'(= r ) %448~0'(= r ) 
; #26 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
;; rsp=0 , %451~0(<2)◂%[ 10r ] %449~1'(= r ) %448~0'(= r ) 
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
	jmp LB_184
LB_184:
	cmp BYTE [r8+6],0
	jnz LB_176
	POP_GRM_SCC
	ret
LB_176:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_188
	jmp LB_189
LB_188:
	mov r8,unt_1
	jmp LB_186
LB_189:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_190
	jmp LB_191
LB_190:
	mov r8,unt_1
	jmp LB_186
LB_191:
	add r14,1
	jmp LB_187
LB_186:
	add rsp,0
	jmp LB_185
LB_187:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_192
LB_192
;; rsp=0 , %453~1'(= r ) %452~0'(= r ) 
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %454~%[ 9r ] %453~1'(= r ) %452~0'(= r ) 
; #26 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
;; rsp=0 , %455~0(<2)◂%[ 9r ] %453~1'(= r ) %452~0'(= r ) 
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
	jmp LB_193
LB_193:
	cmp BYTE [r8+6],0
	jnz LB_185
	POP_GRM_SCC
	ret
LB_185:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_197
	jmp LB_198
LB_197:
	mov r8,unt_1
	jmp LB_195
LB_198:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_199
	jmp LB_200
LB_199:
	mov r8,unt_1
	jmp LB_195
LB_200:
	add r14,1
	jmp LB_196
LB_195:
	add rsp,0
	jmp LB_194
LB_196:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_201
LB_201
;; rsp=0 , %457~1'(= r ) %456~0'(= r ) 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %458~%[ 0r ] %457~1'(= r ) %456~0'(= r ) 
; #26 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %459~0(<2)◂%[ 0r ] %457~1'(= r ) %456~0'(= r ) 
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
	jmp LB_202
LB_202:
	cmp BYTE [r8+6],0
	jnz LB_194
	POP_GRM_SCC
	ret
LB_194:
	POP_GRM_FAIL 
	ret
LB_210: ;; #34 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
;;1'(= r )=<0'(= r )
	cmp r14,r13
	jg LB_213
	jmp LB_212
LB_213:
	jmp LB_211
LB_212:
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) %[ 1r ] }
; .mov_ptn2 { 0'(= r ) 1'(= r ) %[ 1r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r8,1
	ret
LB_211:
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) %[ 0r ] }
; .mov_ptn2 { 0'(= r ) 1'(= r ) %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r8,0
	ret
ETR_104:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_104
	ret
GRM_104:
	PUSH_GRM
	cmp r14,r9
	jge LB_206
	jmp LB_207
LB_206:
	mov r8,unt_1 
	jmp LB_204
LB_207:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_205
LB_204:
	add rsp,0
	jmp LB_203
LB_205:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_208
LB_208
;; rsp=1 , %462~1'(= r ) %461~0'(= r ) %460~8'(= r ) 
; $ %[ 48r ] ⊢ %[ 48r ]
;; rsp=1 , %463~%[ 48r ] %462~1'(= r ) %461~0'(= r ) %460~8'(= r ) 
; $ %[ 57r ] ⊢ %[ 57r ]
;; rsp=1 , %464~%[ 57r ] %463~%[ 48r ] %462~1'(= r ) %461~0'(= r ) %460~8'(= r ) 
; #34 { 8'(= r ) %[ 48r ] } ⊢ { 4'(= r ) 3'(= r ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) %[ 48r ] } ⊢ { 0'(= r ) 1'(= r ) }
; {| 110000001110.. |}
	mov r14,48
	mov r13,QWORD [rsp-8+8*3]
	call LB_210
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %467~2'(= r ) %466~3'(= r ) %465~4'(= r ) %464~%[ 57r ] %462~1'(= r ) %461~0'(= r ) 
; #34 { %[ 57r ] 4'(= r ) } ⊢ { 6'(= r ) 5'(= r ) 4'(= r ) }
	sub rsp,32
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
; .mov_ptn2 { %[ 57r ] 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
; {| 1100100011110.. |}
	mov r14,r10
	mov r13,57
	call LB_210
	mov r9,QWORD [rsp-8+8*4]
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %470~4'(= r ) %469~5'(= r ) %468~6'(= r ) %467~2'(= r ) %466~3'(= r ) %462~1'(= r ) %461~0'(= r ) 
	cmp r8,1
	jnz LB_216
	jmp LB_215
LB_216:
	jmp LB_214
LB_215:
	cmp r10,1
	jnz LB_218
	jmp LB_217
LB_218:
	jmp LB_214
LB_217:
;; rsp=0 , %470~4'(= r ) %469~5'(= r ) %468~6'(= r ) %467~2'(= r ) %466~3'(= r ) %462~1'(= r ) %461~0'(= r ) 
; #26 5'(= r ) ⊢ 0(<2)◂5'(= r )
;; rsp=0 , %471~0(<2)◂5'(= r ) %470~4'(= r ) %468~6'(= r ) %467~2'(= r ) %466~3'(= r ) %462~1'(= r ) %461~0'(= r ) 
; ∎ 0(<2)◂5'(= r )
; .dlt.ptn 4'(= r )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 6'(= r )
	mov rdi,rcx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
; .mov_ptn2 0(<2)◂5'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010010.. |}
	mov r8,r11
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_209
LB_214:
;; rsp=0 , %470~4'(= r ) %469~5'(= r ) %468~6'(= r ) %467~2'(= r ) %466~3'(= r ) %462~1'(= r ) %461~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %472~1(<2)◂{ } %470~4'(= r ) %469~5'(= r ) %468~6'(= r ) %467~2'(= r ) %466~3'(= r ) %462~1'(= r ) %461~0'(= r ) 
; ∎ 1(<2)◂{ }
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
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_209
LB_209:
	cmp BYTE [r8+6],0
	jnz LB_203
	POP_GRM_SCC
	ret
LB_203:
	POP_GRM_FAIL 
	ret
ETR_105:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_105
	ret
GRM_105:
	PUSH_GRM
	cmp r14,r9
	jge LB_222
	jmp LB_223
LB_222:
	mov r8,unt_1 
	jmp LB_220
LB_223:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_221
LB_220:
	add rsp,0
	jmp LB_219
LB_221:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_224
LB_224
;; rsp=1 , %475~1'(= r ) %474~0'(= r ) %473~8'(= r ) 
; $ %[ 97r ] ⊢ %[ 97r ]
;; rsp=1 , %476~%[ 97r ] %475~1'(= r ) %474~0'(= r ) %473~8'(= r ) 
; $ %[ 122r ] ⊢ %[ 122r ]
;; rsp=1 , %477~%[ 122r ] %476~%[ 97r ] %475~1'(= r ) %474~0'(= r ) %473~8'(= r ) 
; #34 { 8'(= r ) %[ 97r ] } ⊢ { 4'(= r ) 3'(= r ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) %[ 97r ] } ⊢ { 0'(= r ) 1'(= r ) }
; {| 110000001110.. |}
	mov r14,97
	mov r13,QWORD [rsp-8+8*3]
	call LB_210
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %480~2'(= r ) %479~3'(= r ) %478~4'(= r ) %477~%[ 122r ] %475~1'(= r ) %474~0'(= r ) 
; #34 { %[ 122r ] 4'(= r ) } ⊢ { 6'(= r ) 5'(= r ) 4'(= r ) }
	sub rsp,32
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
; .mov_ptn2 { %[ 122r ] 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
; {| 1100100011110.. |}
	mov r14,r10
	mov r13,122
	call LB_210
	mov r9,QWORD [rsp-8+8*4]
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %483~4'(= r ) %482~5'(= r ) %481~6'(= r ) %480~2'(= r ) %479~3'(= r ) %475~1'(= r ) %474~0'(= r ) 
	cmp r8,1
	jnz LB_228
	jmp LB_227
LB_228:
	jmp LB_226
LB_227:
	cmp r10,1
	jnz LB_230
	jmp LB_229
LB_230:
	jmp LB_226
LB_229:
;; rsp=0 , %483~4'(= r ) %482~5'(= r ) %481~6'(= r ) %480~2'(= r ) %479~3'(= r ) %475~1'(= r ) %474~0'(= r ) 
; #26 5'(= r ) ⊢ 0(<2)◂5'(= r )
;; rsp=0 , %484~0(<2)◂5'(= r ) %483~4'(= r ) %481~6'(= r ) %480~2'(= r ) %479~3'(= r ) %475~1'(= r ) %474~0'(= r ) 
; ∎ 0(<2)◂5'(= r )
; .dlt.ptn 4'(= r )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 6'(= r )
	mov rdi,rcx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
; .mov_ptn2 0(<2)◂5'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010010.. |}
	mov r8,r11
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_225
LB_226:
;; rsp=0 , %483~4'(= r ) %482~5'(= r ) %481~6'(= r ) %480~2'(= r ) %479~3'(= r ) %475~1'(= r ) %474~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %485~1(<2)◂{ } %483~4'(= r ) %482~5'(= r ) %481~6'(= r ) %480~2'(= r ) %479~3'(= r ) %475~1'(= r ) %474~0'(= r ) 
; ∎ 1(<2)◂{ }
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
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_225
LB_225:
	cmp BYTE [r8+6],0
	jnz LB_219
	POP_GRM_SCC
	ret
LB_219:
	POP_GRM_FAIL 
	ret
ETR_106:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_106
	ret
GRM_106:
	PUSH_GRM
	cmp r14,r9
	jge LB_234
	jmp LB_235
LB_234:
	mov r8,unt_1 
	jmp LB_232
LB_235:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_233
LB_232:
	add rsp,0
	jmp LB_231
LB_233:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_236
LB_236
;; rsp=1 , %488~1'(= r ) %487~0'(= r ) %486~8'(= r ) 
; $ %[ 65r ] ⊢ %[ 65r ]
;; rsp=1 , %489~%[ 65r ] %488~1'(= r ) %487~0'(= r ) %486~8'(= r ) 
; $ %[ 90r ] ⊢ %[ 90r ]
;; rsp=1 , %490~%[ 90r ] %489~%[ 65r ] %488~1'(= r ) %487~0'(= r ) %486~8'(= r ) 
; #34 { 8'(= r ) %[ 65r ] } ⊢ { 4'(= r ) 3'(= r ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) %[ 65r ] } ⊢ { 0'(= r ) 1'(= r ) }
; {| 110000001110.. |}
	mov r14,65
	mov r13,QWORD [rsp-8+8*3]
	call LB_210
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %493~2'(= r ) %492~3'(= r ) %491~4'(= r ) %490~%[ 90r ] %488~1'(= r ) %487~0'(= r ) 
; #34 { %[ 90r ] 4'(= r ) } ⊢ { 6'(= r ) 5'(= r ) 4'(= r ) }
	sub rsp,32
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
	mov QWORD [rsp+24],r9
; .mov_ptn2 { %[ 90r ] 4'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
; {| 1100100011110.. |}
	mov r14,r10
	mov r13,90
	call LB_210
	mov r9,QWORD [rsp-8+8*4]
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %496~4'(= r ) %495~5'(= r ) %494~6'(= r ) %493~2'(= r ) %492~3'(= r ) %488~1'(= r ) %487~0'(= r ) 
	cmp r8,1
	jnz LB_240
	jmp LB_239
LB_240:
	jmp LB_238
LB_239:
	cmp r10,1
	jnz LB_242
	jmp LB_241
LB_242:
	jmp LB_238
LB_241:
;; rsp=0 , %496~4'(= r ) %495~5'(= r ) %494~6'(= r ) %493~2'(= r ) %492~3'(= r ) %488~1'(= r ) %487~0'(= r ) 
; #26 5'(= r ) ⊢ 0(<2)◂5'(= r )
;; rsp=0 , %497~0(<2)◂5'(= r ) %496~4'(= r ) %494~6'(= r ) %493~2'(= r ) %492~3'(= r ) %488~1'(= r ) %487~0'(= r ) 
; ∎ 0(<2)◂5'(= r )
; .dlt.ptn 4'(= r )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 6'(= r )
	mov rdi,rcx
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
; .mov_ptn2 0(<2)◂5'(= r ) ⊢ 2'(= a3◂ [ r] )
; {| 0010010.. |}
	mov r8,r11
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_237
LB_238:
;; rsp=0 , %496~4'(= r ) %495~5'(= r ) %494~6'(= r ) %493~2'(= r ) %492~3'(= r ) %488~1'(= r ) %487~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %498~1(<2)◂{ } %496~4'(= r ) %495~5'(= r ) %494~6'(= r ) %493~2'(= r ) %492~3'(= r ) %488~1'(= r ) %487~0'(= r ) 
; ∎ 1(<2)◂{ }
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
; .dlt.ptn 2'(= r )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_237
LB_237:
	cmp BYTE [r8+6],0
	jnz LB_231
	POP_GRM_SCC
	ret
LB_231:
	POP_GRM_FAIL 
	ret
ETR_107:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_107
	ret
GRM_107:
	PUSH_GRM
	call GRM_106
	cmp BYTE [r8+6],0
	jnz LB_246
	jmp LB_247
LB_246:
	jmp LB_244
LB_247:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_245
LB_244:
	add rsp,0
	jmp LB_243
LB_245:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_248
LB_248
;; rsp=1 , %501~1'(= r ) %500~0'(= r ) %499~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %502~0(<2)◂8'(= r ) %501~1'(= r ) %500~0'(= r ) 
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
	jmp LB_249
LB_249:
	cmp BYTE [r8+6],0
	jnz LB_243
	POP_GRM_SCC
	ret
LB_243:
	RB_GRM
	call GRM_105
	cmp BYTE [r8+6],0
	jnz LB_253
	jmp LB_254
LB_253:
	jmp LB_251
LB_254:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_252
LB_251:
	add rsp,0
	jmp LB_250
LB_252:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_255
LB_255
;; rsp=1 , %505~1'(= r ) %504~0'(= r ) %503~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %506~0(<2)◂8'(= r ) %505~1'(= r ) %504~0'(= r ) 
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
	jmp LB_256
LB_256:
	cmp BYTE [r8+6],0
	jnz LB_250
	POP_GRM_SCC
	ret
LB_250:
	POP_GRM_FAIL 
	ret
ETR_108:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_108
	ret
GRM_108:
	PUSH_GRM
	call GRM_107
	cmp BYTE [r8+6],0
	jnz LB_260
	jmp LB_261
LB_260:
	jmp LB_258
LB_261:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_259
LB_258:
	add rsp,0
	jmp LB_257
LB_259:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_264
	jmp LB_265
LB_264:
	jmp LB_262
LB_265:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_263
LB_262:
	add rsp,8
	jmp LB_257
LB_263:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_266
LB_266
;; rsp=2 , %510~1'(= r ) %509~0'(= r ) %508~9'(= a14◂ [ ] ) %507~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_77
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %511~2'(= a14◂ [ ] ) %510~1'(= r ) %509~0'(= r ) 
; #74 2'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10100000110.. |}
	mov r13,r8
	call LB_94
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %513~2'(= {| l |} ) %512~3'(= a14◂ [ ] ) %510~1'(= r ) %509~0'(= r ) 
; #26 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %514~0(<2)◂2'(= {| l |} ) %512~3'(= a14◂ [ ] ) %510~1'(= r ) %509~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_105
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
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	mov BYTE [r8+6],0
	jmp LB_267
LB_267:
	cmp BYTE [r8+6],0
	jnz LB_257
	POP_GRM_SCC
	ret
LB_257:
	POP_GRM_FAIL 
	ret
ETR_109:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_109
	ret
GRM_109:
	PUSH_GRM
	call GRM_110
	cmp BYTE [r8+6],0
	jnz LB_271
	jmp LB_272
LB_271:
	jmp LB_269
LB_272:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_270
LB_269:
	add rsp,0
	jmp LB_268
LB_270:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_275
	jmp LB_276
LB_275:
	jmp LB_273
LB_276:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_274
LB_273:
	add rsp,8
	jmp LB_268
LB_274:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_277
LB_277
;; rsp=2 , %518~1'(= r ) %517~0'(= r ) %516~9'(= a14◂ [ ] ) %515~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_77
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %519~2'(= a14◂ [ ] ) %518~1'(= r ) %517~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %520~0(<2)◂2'(= a14◂ [ ] ) %518~1'(= r ) %517~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_278
LB_278:
	cmp BYTE [r8+6],0
	jnz LB_268
	POP_GRM_SCC
	ret
LB_268:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_280
LB_280
;; rsp=0 , %522~1'(= r ) %521~0'(= r ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %523~2(<4)◂{ } %522~1'(= r ) %521~0'(= r ) 
; #26 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %524~0(<2)◂2(<4)◂{ } %522~1'(= r ) %521~0'(= r ) 
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
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_281
LB_281:
	cmp BYTE [r8+6],0
	jnz LB_279
	POP_GRM_SCC
	ret
LB_279:
	POP_GRM_FAIL 
	ret
ETR_110:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_110
	ret
GRM_110:
	PUSH_GRM
	call GRM_107
	cmp BYTE [r8+6],0
	jnz LB_285
	jmp LB_286
LB_285:
	jmp LB_283
LB_286:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_284
LB_283:
	add rsp,0
	jmp LB_282
LB_284:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_287
LB_287
;; rsp=1 , %527~1'(= r ) %526~0'(= r ) %525~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %528~0(<2)◂8'(= r ) %527~1'(= r ) %526~0'(= r ) 
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
	jmp LB_288
LB_288:
	cmp BYTE [r8+6],0
	jnz LB_282
	POP_GRM_SCC
	ret
LB_282:
	RB_GRM
	call GRM_104
	cmp BYTE [r8+6],0
	jnz LB_292
	jmp LB_293
LB_292:
	jmp LB_290
LB_293:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_291
LB_290:
	add rsp,0
	jmp LB_289
LB_291:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_294
LB_294
;; rsp=1 , %531~1'(= r ) %530~0'(= r ) %529~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %532~0(<2)◂8'(= r ) %531~1'(= r ) %530~0'(= r ) 
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
	jmp LB_295
LB_295:
	cmp BYTE [r8+6],0
	jnz LB_289
	POP_GRM_SCC
	ret
LB_289:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_299
	jmp LB_300
LB_299:
	mov r8,unt_1
	jmp LB_297
LB_300:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_301
	jmp LB_302
LB_301:
	mov r8,unt_1
	jmp LB_297
LB_302:
	add r14,1
	jmp LB_298
LB_297:
	add rsp,0
	jmp LB_296
LB_298:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_303
LB_303
;; rsp=0 , %534~1'(= r ) %533~0'(= r ) 
; $ %[ 95r ] ⊢ %[ 95r ]
;; rsp=0 , %535~%[ 95r ] %534~1'(= r ) %533~0'(= r ) 
; #26 %[ 95r ] ⊢ 0(<2)◂%[ 95r ]
;; rsp=0 , %536~0(<2)◂%[ 95r ] %534~1'(= r ) %533~0'(= r ) 
; ∎ 0(<2)◂%[ 95r ]
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
; .mov_ptn2 0(<2)◂%[ 95r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov r8,95
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_304
LB_304:
	cmp BYTE [r8+6],0
	jnz LB_296
	POP_GRM_SCC
	ret
LB_296:
	POP_GRM_FAIL 
	ret
ETR_111:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_111
	ret
GRM_111:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_308
	jmp LB_309
LB_308:
	mov r8,unt_1
	jmp LB_306
LB_309:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_310
	jmp LB_311
LB_310:
	mov r8,unt_1
	jmp LB_306
LB_311:
	add r14,1
	jmp LB_307
LB_306:
	add rsp,0
	jmp LB_305
LB_307:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_314
	jmp LB_315
LB_314:
	jmp LB_312
LB_315:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_313
LB_312:
	add rsp,0
	jmp LB_305
LB_313:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_316
LB_316
;; rsp=1 , %539~1'(= r ) %538~0'(= r ) %537~8'(= a14◂ [ ] ) 
; #74 8'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 8'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 100000001110.. |}
	mov r13,QWORD [rsp-8+8*3]
	call LB_94
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %541~2'(= {| l |} ) %540~3'(= a14◂ [ ] ) %539~1'(= r ) %538~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_318+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %543~4'(= {| l |} ) %542~2'(= {| l |} ) %540~3'(= a14◂ [ ] ) %539~1'(= r ) %538~0'(= r ) 
; #26 4'(= {| l |} ) ⊢ 0(<2)◂4'(= {| l |} )
;; rsp=0 , %544~0(<2)◂4'(= {| l |} ) %542~2'(= {| l |} ) %540~3'(= a14◂ [ ] ) %539~1'(= r ) %538~0'(= r ) 
; ∎ 0(<2)◂4'(= {| l |} )
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_105
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
; .mov_ptn2 0(<2)◂4'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; {| 001010.. |}
	mov r8,r10
	mov BYTE [r8+6],0
	jmp LB_317
LB_317:
	cmp BYTE [r8+6],0
	jnz LB_305
	POP_GRM_SCC
	ret
LB_305:
	RB_GRM
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_322
	jmp LB_323
LB_322:
	jmp LB_320
LB_323:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_321
LB_320:
	add rsp,0
	jmp LB_319
LB_321:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_324
LB_324
;; rsp=1 , %547~1'(= r ) %546~0'(= r ) %545~8'(= {| l |} ) 
; #26 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %548~0(<2)◂8'(= {| l |} ) %547~1'(= r ) %546~0'(= r ) 
; ∎ 0(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],0
	add rsp,8
	jmp LB_325
LB_325:
	cmp BYTE [r8+6],0
	jnz LB_319
	POP_GRM_SCC
	ret
LB_319:
	POP_GRM_FAIL 
	ret
ETR_302:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_302
	ret
GRM_302:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_329
	jmp LB_330
LB_329:
	mov r8,unt_1
	jmp LB_327
LB_330:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_331
	jmp LB_332
LB_331:
	mov r8,unt_1
	jmp LB_327
LB_332:
	add r14,1
	jmp LB_328
LB_327:
	add rsp,0
	jmp LB_326
LB_328:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_337
	jmp LB_338
LB_337:
	mov r8,unt_1
	jmp LB_335
LB_338:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],32
	jnz LB_339
	jmp LB_340
LB_339:
	mov r8,unt_1
	jmp LB_335
LB_340:
	add r14,1
	jmp LB_336
LB_335:
	add rsp,0
	jmp LB_334
LB_336:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_341
LB_341
;; rsp=0 , %1736~1'(= r ) %1735~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1737~0(<2)◂{ } %1736~1'(= r ) %1735~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_342
LB_342:
	cmp BYTE [r8+6],0
	jnz LB_334
	POP_GRM_SCC
	jmp LB_333
LB_334:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_346
	jmp LB_347
LB_346:
	mov r8,unt_1
	jmp LB_344
LB_347:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_348
	jmp LB_349
LB_348:
	mov r8,unt_1
	jmp LB_344
LB_349:
	add r14,1
	jmp LB_345
LB_344:
	add rsp,0
	jmp LB_343
LB_345:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_350
LB_350
;; rsp=0 , %1739~1'(= r ) %1738~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1740~0(<2)◂{ } %1739~1'(= r ) %1738~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_351
LB_351:
	cmp BYTE [r8+6],0
	jnz LB_343
	POP_GRM_SCC
	jmp LB_333
LB_343:
	RB_GRM
	call GRM_303
	cmp BYTE [r8+6],0
	jnz LB_355
	jmp LB_356
LB_355:
	jmp LB_353
LB_356:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_354
LB_353:
	add rsp,0
	jmp LB_352
LB_354:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_357
LB_357
;; rsp=0 , %1743~1'(= r ) %1742~0'(= r ) %1741~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1744~1(<2)◂{ } %1743~1'(= r ) %1742~0'(= r ) %1741~{ } 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_358
LB_358:
	cmp BYTE [r8+6],0
	jnz LB_352
	POP_GRM_SCC
	jmp LB_333
LB_352:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_360
LB_360
;; rsp=0 , %1746~1'(= r ) %1745~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1747~0(<2)◂{ } %1746~1'(= r ) %1745~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_361
LB_361:
	cmp BYTE [r8+6],0
	jnz LB_359
	POP_GRM_SCC
	jmp LB_333
LB_359:
	POP_GRM_FAIL 
	jmp LB_333
LB_333:
	cmp BYTE [r8+6],0
	jnz LB_362
	jmp LB_363
LB_362:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_363:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_364
LB_364
;; rsp=0 , %1748~{ } %1734~1'(= r ) %1733~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1749~0(<2)◂{ } %1748~{ } %1734~1'(= r ) %1733~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn { }
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_365
LB_365:
	cmp BYTE [r8+6],0
	jnz LB_326
	POP_GRM_SCC
	ret
LB_326:
	POP_GRM_FAIL 
	ret
ETR_303:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_303
	ret
GRM_303:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_369
	jmp LB_370
LB_369:
	mov r8,unt_1
	jmp LB_367
LB_370:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_371
	jmp LB_372
LB_371:
	mov r8,unt_1
	jmp LB_367
LB_372:
	add r14,1
	jmp LB_368
LB_367:
	add rsp,0
	jmp LB_366
LB_368:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_373
LB_373
;; rsp=0 , %1751~1'(= r ) %1750~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1752~1(<2)◂{ } %1751~1'(= r ) %1750~0'(= r ) 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_374
LB_374:
	cmp BYTE [r8+6],0
	jnz LB_366
	POP_GRM_SCC
	ret
LB_366:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_376
LB_376
;; rsp=0 , %1754~1'(= r ) %1753~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1755~0(<2)◂{ } %1754~1'(= r ) %1753~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_377
LB_377:
	cmp BYTE [r8+6],0
	jnz LB_375
	POP_GRM_SCC
	ret
LB_375:
	POP_GRM_FAIL 
	ret
ETR_304:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_304
	ret
GRM_304:
	PUSH_GRM
	jmp LB_380
LB_379:
	add r14,1 
LB_380:
	cmp r14,r9
	jge LB_381
	JZ_LINE_SPC BYTE [r13+8+r14], LB_379
LB_381
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_384
	jmp LB_385
LB_384:
	jmp LB_382
LB_385:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_383
LB_382:
	add rsp,0
	jmp LB_378
LB_383:
	jmp LB_387
LB_386:
	add r14,1 
LB_387:
	cmp r14,r9
	jge LB_388
	JZ_LINE_SPC BYTE [r13+8+r14], LB_386
LB_388
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_391
	jmp LB_392
LB_391:
	mov r8,unt_1
	jmp LB_389
LB_392:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_393
	jmp LB_394
LB_393:
	mov r8,unt_1
	jmp LB_389
LB_394:
	add r14,1
	jmp LB_390
LB_389:
	add rsp,8
	jmp LB_378
LB_390:
	jmp LB_396
LB_395:
	add r14,1 
LB_396:
	cmp r14,r9
	jge LB_397
	JZ_LINE_SPC BYTE [r13+8+r14], LB_395
LB_397
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_400
	jmp LB_401
LB_400:
	jmp LB_398
LB_401:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_399
LB_398:
	add rsp,8
	jmp LB_378
LB_399:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_402
LB_402
;; rsp=2 , %1759~1'(= r ) %1758~0'(= r ) %1757~9'(= a18◂ [ ] ) %1756~8'(= {| l |} ) 
; #143 { 8'(= {| l |} ) 9'(= a18◂ [ ] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a18◂ [ ] ) }
;; rsp=2 , %1760~0(<2)◂{ 8'(= {| l |} ) 9'(= a18◂ [ ] ) } %1759~1'(= r ) %1758~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a18◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a18◂ [ ] ) }
;; rsp=2 , %1761~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a18◂ [ ] ) } %1759~1'(= r ) %1758~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a18◂ [ ] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a18◂ [ ] ) } ⊢ 2'(= a3◂ [ a18◂ [ ]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_403
LB_403:
	cmp BYTE [r8+6],0
	jnz LB_378
	POP_GRM_SCC
	ret
LB_378:
	RB_GRM
	jmp LB_406
LB_405:
	add r14,1 
LB_406:
	cmp r14,r9
	jge LB_407
	JZ_LINE_SPC BYTE [r13+8+r14], LB_405
LB_407
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_410
	jmp LB_411
LB_410:
	jmp LB_408
LB_411:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_409
LB_408:
	add rsp,0
	jmp LB_404
LB_409:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_412
LB_412
;; rsp=1 , %1764~1'(= r ) %1763~0'(= r ) %1762~8'(= {| l |} ) 
; #142 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1765~1(<2)◂8'(= {| l |} ) %1764~1'(= r ) %1763~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1766~0(<2)◂1(<2)◂8'(= {| l |} ) %1764~1'(= r ) %1763~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a18◂ [ ]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_413
LB_413:
	cmp BYTE [r8+6],0
	jnz LB_404
	POP_GRM_SCC
	ret
LB_404:
	POP_GRM_FAIL 
	ret
ETR_305:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_305
	ret
GRM_305:
	PUSH_GRM
	cmp r14,r9
	jge LB_417
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_417
	add r14,rsi
	push rdi
	jmp LB_418
LB_417:
	mov r8,unt_1
	jmp LB_415
LB_418:
	jmp LB_416
LB_415:
	add rsp,0
	jmp LB_414
LB_416:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_421
	jmp LB_422
LB_421:
	mov r8,unt_1
	jmp LB_419
LB_422:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_423
	jmp LB_424
LB_423:
	mov r8,unt_1
	jmp LB_419
LB_424:
	add r14,1
	jmp LB_420
LB_419:
	add rsp,8
	jmp LB_414
LB_420:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_425
LB_425
;; rsp=1 , %1769~1'(= r ) %1768~0'(= r ) %1767~8'(= r ) 
; #182 8'(= r ) ⊢ 3(<7)◂8'(= r )
;; rsp=1 , %1770~3(<7)◂8'(= r ) %1769~1'(= r ) %1768~0'(= r ) 
; #26 3(<7)◂8'(= r ) ⊢ 0(<2)◂3(<7)◂8'(= r )
;; rsp=1 , %1771~0(<2)◂3(<7)◂8'(= r ) %1769~1'(= r ) %1768~0'(= r ) 
; ∎ 0(<2)◂3(<7)◂8'(= r )
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
; .mov_ptn2 0(<2)◂3(<7)◂8'(= r ) ⊢ 2'(= a3◂ [ a27◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_426
LB_426:
	cmp BYTE [r8+6],0
	jnz LB_414
	POP_GRM_SCC
	ret
LB_414:
	RB_GRM
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_430
	jmp LB_431
LB_430:
	mov r8,unt_1
	jmp LB_428
LB_431:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_432
	cmp BYTE [rdi+1],120
	jnz LB_432
	jmp LB_433
LB_432:
	mov r8,unt_1
	jmp LB_428
LB_433:
	add r14,2
	jmp LB_429
LB_428:
	add rsp,0
	jmp LB_427
LB_429:
	cmp r14,r9
	jge LB_436
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_x
	C_POP_REGS
	cmp rax,0 
	jz LB_436
	add r14,rsi
	push rdi
	jmp LB_437
LB_436:
	mov r8,unt_1
	jmp LB_434
LB_437:
	jmp LB_435
LB_434:
	add rsp,0
	jmp LB_427
LB_435:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_440
	jmp LB_441
LB_440:
	mov r8,unt_1
	jmp LB_438
LB_441:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_442
	jmp LB_443
LB_442:
	mov r8,unt_1
	jmp LB_438
LB_443:
	add r14,1
	jmp LB_439
LB_438:
	add rsp,8
	jmp LB_427
LB_439:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_444
LB_444
;; rsp=1 , %1774~1'(= r ) %1773~0'(= r ) %1772~8'(= r ) 
; #182 8'(= r ) ⊢ 3(<7)◂8'(= r )
;; rsp=1 , %1775~3(<7)◂8'(= r ) %1774~1'(= r ) %1773~0'(= r ) 
; #26 3(<7)◂8'(= r ) ⊢ 0(<2)◂3(<7)◂8'(= r )
;; rsp=1 , %1776~0(<2)◂3(<7)◂8'(= r ) %1774~1'(= r ) %1773~0'(= r ) 
; ∎ 0(<2)◂3(<7)◂8'(= r )
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
; .mov_ptn2 0(<2)◂3(<7)◂8'(= r ) ⊢ 2'(= a3◂ [ a27◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_445
LB_445:
	cmp BYTE [r8+6],0
	jnz LB_427
	POP_GRM_SCC
	ret
LB_427:
	RB_GRM
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_449
	jmp LB_450
LB_449:
	jmp LB_447
LB_450:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_448
LB_447:
	add rsp,0
	jmp LB_446
LB_448:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_451
LB_451
;; rsp=1 , %1779~1'(= r ) %1778~0'(= r ) %1777~8'(= {| l |} ) 
; #181 8'(= {| l |} ) ⊢ 4(<7)◂8'(= {| l |} )
;; rsp=1 , %1780~4(<7)◂8'(= {| l |} ) %1779~1'(= r ) %1778~0'(= r ) 
; #26 4(<7)◂8'(= {| l |} ) ⊢ 0(<2)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %1781~0(<2)◂4(<7)◂8'(= {| l |} ) %1779~1'(= r ) %1778~0'(= r ) 
; ∎ 0(<2)◂4(<7)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂4(<7)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a27◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],4
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_452
LB_452:
	cmp BYTE [r8+6],0
	jnz LB_446
	POP_GRM_SCC
	ret
LB_446:
	RB_GRM
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_456
	jmp LB_457
LB_456:
	jmp LB_454
LB_457:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_455
LB_454:
	add rsp,0
	jmp LB_453
LB_455:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_458
LB_458
;; rsp=1 , %1784~1'(= r ) %1783~0'(= r ) %1782~8'(= a18◂ [ ] ) 
; #180 8'(= a18◂ [ ] ) ⊢ 5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %1785~5(<7)◂8'(= a18◂ [ ] ) %1784~1'(= r ) %1783~0'(= r ) 
; #26 5(<7)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %1786~0(<2)◂5(<7)◂8'(= a18◂ [ ] ) %1784~1'(= r ) %1783~0'(= r ) 
; ∎ 0(<2)◂5(<7)◂8'(= a18◂ [ ] )
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
; .mov_ptn2 0(<2)◂5(<7)◂8'(= a18◂ [ ] ) ⊢ 2'(= a3◂ [ a27◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],5
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_459
LB_459:
	cmp BYTE [r8+6],0
	jnz LB_453
	POP_GRM_SCC
	ret
LB_453:
	POP_GRM_FAIL 
	ret
ETR_313:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_313
	ret
GRM_313:
	PUSH_GRM
	jmp LB_462
LB_461:
	add r14,1 
LB_462:
	cmp r14,r9
	jge LB_463
	JZ_LINE_SPC BYTE [r13+8+r14], LB_461
LB_463
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_466
	jmp LB_467
LB_466:
	mov r8,unt_1
	jmp LB_464
LB_467:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_468
	jmp LB_469
LB_468:
	mov r8,unt_1
	jmp LB_464
LB_469:
	add r14,1
	jmp LB_465
LB_464:
	add rsp,0
	jmp LB_460
LB_465:
	jmp LB_471
LB_470:
	add r14,1 
LB_471:
	cmp r14,r9
	jge LB_472
	JZ_LINE_SPC BYTE [r13+8+r14], LB_470
LB_472
	call GRM_314
	cmp BYTE [r8+6],0
	jnz LB_475
	jmp LB_476
LB_475:
	jmp LB_473
LB_476:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_474
LB_473:
	add rsp,0
	jmp LB_460
LB_474:
	jmp LB_478
LB_477:
	add r14,1 
LB_478:
	cmp r14,r9
	jge LB_479
	JZ_LINE_SPC BYTE [r13+8+r14], LB_477
LB_479
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_482
	jmp LB_483
LB_482:
	mov r8,unt_1
	jmp LB_480
LB_483:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_484
	jmp LB_485
LB_484:
	mov r8,unt_1
	jmp LB_480
LB_485:
	add r14,1
	jmp LB_481
LB_480:
	add rsp,8
	jmp LB_460
LB_481:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_486
LB_486
;; rsp=1 , %1831~1'(= r ) %1830~0'(= r ) %1829~8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1832~0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1831~1'(= r ) %1830~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1833~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1831~1'(= r ) %1830~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_487
LB_487:
	cmp BYTE [r8+6],0
	jnz LB_460
	POP_GRM_SCC
	ret
LB_460:
	RB_GRM
	jmp LB_490
LB_489:
	add r14,1 
LB_490:
	cmp r14,r9
	jge LB_491
	JZ_LINE_SPC BYTE [r13+8+r14], LB_489
LB_491
	call GRM_316
	cmp BYTE [r8+6],0
	jnz LB_494
	jmp LB_495
LB_494:
	jmp LB_492
LB_495:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_493
LB_492:
	add rsp,0
	jmp LB_488
LB_493:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_496
LB_496
;; rsp=1 , %1836~1'(= r ) %1835~0'(= r ) %1834~8'(= a26◂ [ a18◂ [ ]{| l |}] ) 
; #112 8'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1837~1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) %1836~1'(= r ) %1835~0'(= r ) 
; #26 1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1838~0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) %1836~1'(= r ) %1835~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_497
LB_497:
	cmp BYTE [r8+6],0
	jnz LB_488
	POP_GRM_SCC
	ret
LB_488:
	POP_GRM_FAIL 
	ret
ETR_314:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_314
	ret
GRM_314:
	PUSH_GRM
	jmp LB_500
LB_499:
	add r14,1 
LB_500:
	cmp r14,r9
	jge LB_501
	JZ_LINE_SPC BYTE [r13+8+r14], LB_499
LB_501
	call GRM_313
	cmp BYTE [r8+6],0
	jnz LB_504
	jmp LB_505
LB_504:
	jmp LB_502
LB_505:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_503
LB_502:
	add rsp,0
	jmp LB_498
LB_503:
	jmp LB_507
LB_506:
	add r14,1 
LB_507:
	cmp r14,r9
	jge LB_508
	JZ_LINE_SPC BYTE [r13+8+r14], LB_506
LB_508
	call GRM_314
	cmp BYTE [r8+6],0
	jnz LB_511
	jmp LB_512
LB_511:
	jmp LB_509
LB_512:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_510
LB_509:
	add rsp,8
	jmp LB_498
LB_510:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_513
LB_513
;; rsp=2 , %1842~1'(= r ) %1841~0'(= r ) %1840~9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1839~8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 
; #25 { 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1843~0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } %1842~1'(= r ) %1841~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1844~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } %1842~1'(= r ) %1841~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_514
LB_514:
	cmp BYTE [r8+6],0
	jnz LB_498
	POP_GRM_SCC
	ret
LB_498:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_516
LB_516
;; rsp=0 , %1846~1'(= r ) %1845~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1847~1(<2)◂{ } %1846~1'(= r ) %1845~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1848~0(<2)◂1(<2)◂{ } %1846~1'(= r ) %1845~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_517
LB_517:
	cmp BYTE [r8+6],0
	jnz LB_515
	POP_GRM_SCC
	ret
LB_515:
	POP_GRM_FAIL 
	ret
ETR_315:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_315
	ret
GRM_315:
	PUSH_GRM
	jmp LB_520
LB_519:
	add r14,1 
LB_520:
	cmp r14,r9
	jge LB_521
	JZ_LINE_SPC BYTE [r13+8+r14], LB_519
LB_521
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_524
	jmp LB_525
LB_524:
	mov r8,unt_1
	jmp LB_522
LB_525:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_526
	jmp LB_527
LB_526:
	mov r8,unt_1
	jmp LB_522
LB_527:
	add r14,1
	jmp LB_523
LB_522:
	add rsp,0
	jmp LB_518
LB_523:
	jmp LB_529
LB_528:
	add r14,1 
LB_529:
	cmp r14,r9
	jge LB_530
	JZ_LINE_SPC BYTE [r13+8+r14], LB_528
LB_530
	call GRM_316
	cmp BYTE [r8+6],0
	jnz LB_533
	jmp LB_534
LB_533:
	jmp LB_531
LB_534:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_532
LB_531:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_532:
	jmp LB_536
LB_535:
	add r14,1 
LB_536:
	cmp r14,r9
	jge LB_537
	JZ_LINE_SPC BYTE [r13+8+r14], LB_535
LB_537
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_540
	jmp LB_541
LB_540:
	jmp LB_538
LB_541:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_539
LB_538:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_539:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_542
LB_542
;; rsp=2 , %1852~1'(= r ) %1851~0'(= r ) %1850~9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %1849~8'(= a26◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1853~0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1852~1'(= r ) %1851~0'(= r ) 
; #26 0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1854~0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1852~1'(= r ) %1851~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_543
LB_543:
	cmp BYTE [r8+6],0
	jnz LB_518
	POP_GRM_SCC
	ret
LB_518:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_545
LB_545
;; rsp=0 , %1856~1'(= r ) %1855~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1857~1(<2)◂{ } %1856~1'(= r ) %1855~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1858~0(<2)◂1(<2)◂{ } %1856~1'(= r ) %1855~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_546
LB_546:
	cmp BYTE [r8+6],0
	jnz LB_544
	POP_GRM_SCC
	ret
LB_544:
	POP_GRM_FAIL 
	ret
ETR_316:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_316
	ret
GRM_316:
	PUSH_GRM
	jmp LB_549
LB_548:
	add r14,1 
LB_549:
	cmp r14,r9
	jge LB_550
	JZ_LINE_SPC BYTE [r13+8+r14], LB_548
LB_550
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_553
	jmp LB_554
LB_553:
	jmp LB_551
LB_554:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_552
LB_551:
	add rsp,0
	jmp LB_547
LB_552:
	jmp LB_556
LB_555:
	add r14,1 
LB_556:
	cmp r14,r9
	jge LB_557
	JZ_LINE_SPC BYTE [r13+8+r14], LB_555
LB_557
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_560
	jmp LB_561
LB_560:
	mov r8,unt_1
	jmp LB_558
LB_561:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_562
	cmp BYTE [rdi+1],151
	jnz LB_562
	cmp BYTE [rdi+2],130
	jnz LB_562
	jmp LB_563
LB_562:
	mov r8,unt_1
	jmp LB_558
LB_563:
	add r14,3
	jmp LB_559
LB_558:
	add rsp,8
	jmp LB_547
LB_559:
	jmp LB_565
LB_564:
	add r14,1 
LB_565:
	cmp r14,r9
	jge LB_566
	JZ_LINE_SPC BYTE [r13+8+r14], LB_564
LB_566
	call GRM_313
	cmp BYTE [r8+6],0
	jnz LB_569
	jmp LB_570
LB_569:
	jmp LB_567
LB_570:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_568
LB_567:
	add rsp,8
	jmp LB_547
LB_568:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_571
LB_571
;; rsp=2 , %1862~1'(= r ) %1861~0'(= r ) %1860~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %1859~8'(= a18◂ [ ] ) 
; #189 { 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1863~0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1862~1'(= r ) %1861~0'(= r ) 
; #26 0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1864~0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1862~1'(= r ) %1861~0'(= r ) 
; ∎ 0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_572
LB_572:
	cmp BYTE [r8+6],0
	jnz LB_547
	POP_GRM_SCC
	ret
LB_547:
	RB_GRM
	jmp LB_575
LB_574:
	add r14,1 
LB_575:
	cmp r14,r9
	jge LB_576
	JZ_LINE_SPC BYTE [r13+8+r14], LB_574
LB_576
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_579
	jmp LB_580
LB_579:
	mov r8,unt_1
	jmp LB_577
LB_580:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_581
	cmp BYTE [rdi+1],91
	jnz LB_581
	jmp LB_582
LB_581:
	mov r8,unt_1
	jmp LB_577
LB_582:
	add r14,2
	jmp LB_578
LB_577:
	add rsp,0
	jmp LB_573
LB_578:
	jmp LB_584
LB_583:
	add r14,1 
LB_584:
	cmp r14,r9
	jge LB_585
	JZ_LINE_SPC BYTE [r13+8+r14], LB_583
LB_585
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_588
	jmp LB_589
LB_588:
	jmp LB_586
LB_589:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_587
LB_586:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_587:
	jmp LB_591
LB_590:
	add r14,1 
LB_591:
	cmp r14,r9
	jge LB_592
	JZ_LINE_SPC BYTE [r13+8+r14], LB_590
LB_592
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_595
	jmp LB_596
LB_595:
	mov r8,unt_1
	jmp LB_593
LB_596:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_597
	jmp LB_598
LB_597:
	mov r8,unt_1
	jmp LB_593
LB_598:
	add r14,1
	jmp LB_594
LB_593:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_594:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_599
LB_599
;; rsp=1 , %1867~1'(= r ) %1866~0'(= r ) %1865~8'(= a27◂ [ a18◂ [ ]] ) 
; #188 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<4)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1868~1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) %1867~1'(= r ) %1866~0'(= r ) 
; #26 1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1869~0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) %1867~1'(= r ) %1866~0'(= r ) 
; ∎ 0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] )
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
; .mov_ptn2 0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 2'(= a3◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_600
LB_600:
	cmp BYTE [r8+6],0
	jnz LB_573
	POP_GRM_SCC
	ret
LB_573:
	RB_GRM
	jmp LB_603
LB_602:
	add r14,1 
LB_603:
	cmp r14,r9
	jge LB_604
	JZ_LINE_SPC BYTE [r13+8+r14], LB_602
LB_604
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_607
	jmp LB_608
LB_607:
	mov r8,unt_1
	jmp LB_605
LB_608:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_609
	jmp LB_610
LB_609:
	mov r8,unt_1
	jmp LB_605
LB_610:
	add r14,1
	jmp LB_606
LB_605:
	add rsp,0
	jmp LB_601
LB_606:
	jmp LB_612
LB_611:
	add r14,1 
LB_612:
	cmp r14,r9
	jge LB_613
	JZ_LINE_SPC BYTE [r13+8+r14], LB_611
LB_613
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_616
	jmp LB_617
LB_616:
	jmp LB_614
LB_617:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_615
LB_614:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_615:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_618
LB_618
;; rsp=1 , %1872~1'(= r ) %1871~0'(= r ) %1870~8'(= {| l |} ) 
; #186 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1873~3(<4)◂8'(= {| l |} ) %1872~1'(= r ) %1871~0'(= r ) 
; #26 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1874~0(<2)◂3(<4)◂8'(= {| l |} ) %1872~1'(= r ) %1871~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],3
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_619
LB_619:
	cmp BYTE [r8+6],0
	jnz LB_601
	POP_GRM_SCC
	ret
LB_601:
	RB_GRM
	jmp LB_622
LB_621:
	add r14,1 
LB_622:
	cmp r14,r9
	jge LB_623
	JZ_LINE_SPC BYTE [r13+8+r14], LB_621
LB_623
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_626
	jmp LB_627
LB_626:
	jmp LB_624
LB_627:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_625
LB_624:
	add rsp,0
	jmp LB_620
LB_625:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_628
LB_628
;; rsp=1 , %1877~1'(= r ) %1876~0'(= r ) %1875~8'(= {| l |} ) 
; #186 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1878~3(<4)◂8'(= {| l |} ) %1877~1'(= r ) %1876~0'(= r ) 
; #26 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1879~0(<2)◂3(<4)◂8'(= {| l |} ) %1877~1'(= r ) %1876~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],3
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_629
LB_629:
	cmp BYTE [r8+6],0
	jnz LB_620
	POP_GRM_SCC
	ret
LB_620:
	RB_GRM
	jmp LB_632
LB_631:
	add r14,1 
LB_632:
	cmp r14,r9
	jge LB_633
	JZ_LINE_SPC BYTE [r13+8+r14], LB_631
LB_633
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_636
	jmp LB_637
LB_636:
	mov r8,unt_1
	jmp LB_634
LB_637:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_638
	jmp LB_639
LB_638:
	mov r8,unt_1
	jmp LB_634
LB_639:
	add r14,1
	jmp LB_635
LB_634:
	add rsp,0
	jmp LB_630
LB_635:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_640
LB_640
;; rsp=0 , %1881~1'(= r ) %1880~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1882~1(<2)◂{ } %1881~1'(= r ) %1880~0'(= r ) 
; #187 1(<2)◂{ } ⊢ 2(<4)◂1(<2)◂{ }
;; rsp=0 , %1883~2(<4)◂1(<2)◂{ } %1881~1'(= r ) %1880~0'(= r ) 
; #26 2(<4)◂1(<2)◂{ } ⊢ 0(<2)◂2(<4)◂1(<2)◂{ }
;; rsp=0 , %1884~0(<2)◂2(<4)◂1(<2)◂{ } %1881~1'(= r ) %1880~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂2(<4)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_641
LB_641:
	cmp BYTE [r8+6],0
	jnz LB_630
	POP_GRM_SCC
	ret
LB_630:
	POP_GRM_FAIL 
	ret
ETR_317:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_317
	ret
GRM_317:
	PUSH_GRM
	jmp LB_644
LB_643:
	add r14,1 
LB_644:
	cmp r14,r9
	jge LB_645
	JZ_LINE_SPC BYTE [r13+8+r14], LB_643
LB_645
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_648
	jmp LB_649
LB_648:
	mov r8,unt_1
	jmp LB_646
LB_649:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_650
	jmp LB_651
LB_650:
	mov r8,unt_1
	jmp LB_646
LB_651:
	add r14,1
	jmp LB_647
LB_646:
	add rsp,0
	jmp LB_642
LB_647:
	jmp LB_653
LB_652:
	add r14,1 
LB_653:
	cmp r14,r9
	jge LB_654
	JZ_LINE_SPC BYTE [r13+8+r14], LB_652
LB_654
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_657
	jmp LB_658
LB_657:
	jmp LB_655
LB_658:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_656
LB_655:
	add rsp,0
	jmp LB_642
LB_656:
	jmp LB_660
LB_659:
	add r14,1 
LB_660:
	cmp r14,r9
	jge LB_661
	JZ_LINE_SPC BYTE [r13+8+r14], LB_659
LB_661
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_664
	jmp LB_665
LB_664:
	mov r8,unt_1
	jmp LB_662
LB_665:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_666
	jmp LB_667
LB_666:
	mov r8,unt_1
	jmp LB_662
LB_667:
	add r14,1
	jmp LB_663
LB_662:
	add rsp,8
	jmp LB_642
LB_663:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_668
LB_668
;; rsp=1 , %1887~1'(= r ) %1886~0'(= r ) %1885~8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1888~0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1887~1'(= r ) %1886~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1889~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1887~1'(= r ) %1886~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_669
LB_669:
	cmp BYTE [r8+6],0
	jnz LB_642
	POP_GRM_SCC
	ret
LB_642:
	RB_GRM
	jmp LB_672
LB_671:
	add r14,1 
LB_672:
	cmp r14,r9
	jge LB_673
	JZ_LINE_SPC BYTE [r13+8+r14], LB_671
LB_673
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_676
	jmp LB_677
LB_676:
	jmp LB_674
LB_677:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_675
LB_674:
	add rsp,0
	jmp LB_670
LB_675:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_678
LB_678
;; rsp=1 , %1892~1'(= r ) %1891~0'(= r ) %1890~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #112 8'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1893~1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) %1892~1'(= r ) %1891~0'(= r ) 
; #26 1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1894~0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) %1892~1'(= r ) %1891~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_679
LB_679:
	cmp BYTE [r8+6],0
	jnz LB_670
	POP_GRM_SCC
	ret
LB_670:
	POP_GRM_FAIL 
	ret
ETR_318:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_318
	ret
GRM_318:
	PUSH_GRM
	jmp LB_682
LB_681:
	add r14,1 
LB_682:
	cmp r14,r9
	jge LB_683
	JZ_LINE_SPC BYTE [r13+8+r14], LB_681
LB_683
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_686
	jmp LB_687
LB_686:
	jmp LB_684
LB_687:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_685
LB_684:
	add rsp,0
	jmp LB_680
LB_685:
	jmp LB_689
LB_688:
	add r14,1 
LB_689:
	cmp r14,r9
	jge LB_690
	JZ_LINE_SPC BYTE [r13+8+r14], LB_688
LB_690
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_693
	jmp LB_694
LB_693:
	jmp LB_691
LB_694:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_692
LB_691:
	add rsp,8
	jmp LB_680
LB_692:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_695
LB_695
;; rsp=2 , %1898~1'(= r ) %1897~0'(= r ) %1896~9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1895~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #25 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1899~0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } %1898~1'(= r ) %1897~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1900~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } %1898~1'(= r ) %1897~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_696
LB_696:
	cmp BYTE [r8+6],0
	jnz LB_680
	POP_GRM_SCC
	ret
LB_680:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_698
LB_698
;; rsp=0 , %1902~1'(= r ) %1901~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1903~1(<2)◂{ } %1902~1'(= r ) %1901~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1904~0(<2)◂1(<2)◂{ } %1902~1'(= r ) %1901~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_699
LB_699:
	cmp BYTE [r8+6],0
	jnz LB_697
	POP_GRM_SCC
	ret
LB_697:
	POP_GRM_FAIL 
	ret
ETR_319:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_319
	ret
GRM_319:
	PUSH_GRM
	jmp LB_702
LB_701:
	add r14,1 
LB_702:
	cmp r14,r9
	jge LB_703
	JZ_LINE_SPC BYTE [r13+8+r14], LB_701
LB_703
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_706
	jmp LB_707
LB_706:
	mov r8,unt_1
	jmp LB_704
LB_707:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_708
	jmp LB_709
LB_708:
	mov r8,unt_1
	jmp LB_704
LB_709:
	add r14,1
	jmp LB_705
LB_704:
	add rsp,0
	jmp LB_700
LB_705:
	jmp LB_711
LB_710:
	add r14,1 
LB_711:
	cmp r14,r9
	jge LB_712
	JZ_LINE_SPC BYTE [r13+8+r14], LB_710
LB_712
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_715
	jmp LB_716
LB_715:
	jmp LB_713
LB_716:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_714
LB_713:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_714:
	jmp LB_718
LB_717:
	add r14,1 
LB_718:
	cmp r14,r9
	jge LB_719
	JZ_LINE_SPC BYTE [r13+8+r14], LB_717
LB_719
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_722
	jmp LB_723
LB_722:
	jmp LB_720
LB_723:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_721
LB_720:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_721:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_724
LB_724
;; rsp=2 , %1908~1'(= r ) %1907~0'(= r ) %1906~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %1905~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1909~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %1908~1'(= r ) %1907~0'(= r ) 
; #26 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1910~0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %1908~1'(= r ) %1907~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_725
LB_725:
	cmp BYTE [r8+6],0
	jnz LB_700
	POP_GRM_SCC
	ret
LB_700:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_727
LB_727
;; rsp=0 , %1912~1'(= r ) %1911~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1913~1(<2)◂{ } %1912~1'(= r ) %1911~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1914~0(<2)◂1(<2)◂{ } %1912~1'(= r ) %1911~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_728
LB_728:
	cmp BYTE [r8+6],0
	jnz LB_726
	POP_GRM_SCC
	ret
LB_726:
	POP_GRM_FAIL 
	ret
ETR_320:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_320
	ret
GRM_320:
	PUSH_GRM
	jmp LB_731
LB_730:
	add r14,1 
LB_731:
	cmp r14,r9
	jge LB_732
	JZ_LINE_SPC BYTE [r13+8+r14], LB_730
LB_732
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_735
	jmp LB_736
LB_735:
	mov r8,unt_1
	jmp LB_733
LB_736:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_737
	cmp BYTE [rdi+1],91
	jnz LB_737
	jmp LB_738
LB_737:
	mov r8,unt_1
	jmp LB_733
LB_738:
	add r14,2
	jmp LB_734
LB_733:
	add rsp,0
	jmp LB_729
LB_734:
	jmp LB_740
LB_739:
	add r14,1 
LB_740:
	cmp r14,r9
	jge LB_741
	JZ_LINE_SPC BYTE [r13+8+r14], LB_739
LB_741
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_744
	jmp LB_745
LB_744:
	jmp LB_742
LB_745:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_743
LB_742:
	add rsp,0
	jmp LB_729
LB_743:
	jmp LB_747
LB_746:
	add r14,1 
LB_747:
	cmp r14,r9
	jge LB_748
	JZ_LINE_SPC BYTE [r13+8+r14], LB_746
LB_748
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_751
	jmp LB_752
LB_751:
	mov r8,unt_1
	jmp LB_749
LB_752:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_753
	jmp LB_754
LB_753:
	mov r8,unt_1
	jmp LB_749
LB_754:
	add r14,1
	jmp LB_750
LB_749:
	add rsp,8
	jmp LB_729
LB_750:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_755
LB_755
;; rsp=1 , %1917~1'(= r ) %1916~0'(= r ) %1915~8'(= a27◂ [ a18◂ [ ]] ) 
; #193 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1918~0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %1917~1'(= r ) %1916~0'(= r ) 
; #26 0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1919~0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %1917~1'(= r ) %1916~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 2'(= a3◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_756
LB_756:
	cmp BYTE [r8+6],0
	jnz LB_729
	POP_GRM_SCC
	ret
LB_729:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_760
	jmp LB_761
LB_760:
	mov r8,unt_1
	jmp LB_758
LB_761:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_762
	jmp LB_763
LB_762:
	mov r8,unt_1
	jmp LB_758
LB_763:
	add r14,1
	jmp LB_759
LB_758:
	add rsp,0
	jmp LB_757
LB_759:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_766
	jmp LB_767
LB_766:
	jmp LB_764
LB_767:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_765
LB_764:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_765:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_768
LB_768
;; rsp=1 , %1922~1'(= r ) %1921~0'(= r ) %1920~8'(= {| l |} ) 
; #192 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1923~1(<2)◂8'(= {| l |} ) %1922~1'(= r ) %1921~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1924~0(<2)◂1(<2)◂8'(= {| l |} ) %1922~1'(= r ) %1921~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_769
LB_769:
	cmp BYTE [r8+6],0
	jnz LB_757
	POP_GRM_SCC
	ret
LB_757:
	RB_GRM
	jmp LB_772
LB_771:
	add r14,1 
LB_772:
	cmp r14,r9
	jge LB_773
	JZ_LINE_SPC BYTE [r13+8+r14], LB_771
LB_773
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_776
	jmp LB_777
LB_776:
	jmp LB_774
LB_777:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_775
LB_774:
	add rsp,0
	jmp LB_770
LB_775:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_778
LB_778
;; rsp=1 , %1927~1'(= r ) %1926~0'(= r ) %1925~8'(= {| l |} ) 
; #192 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1928~1(<2)◂8'(= {| l |} ) %1927~1'(= r ) %1926~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1929~0(<2)◂1(<2)◂8'(= {| l |} ) %1927~1'(= r ) %1926~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_779
LB_779:
	cmp BYTE [r8+6],0
	jnz LB_770
	POP_GRM_SCC
	ret
LB_770:
	POP_GRM_FAIL 
	ret
ETR_321:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_321
	ret
GRM_321:
	PUSH_GRM
	jmp LB_782
LB_781:
	add r14,1 
LB_782:
	cmp r14,r9
	jge LB_783
	JZ_LINE_SPC BYTE [r13+8+r14], LB_781
LB_783
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_786
	jmp LB_787
LB_786:
	mov r8,unt_1
	jmp LB_784
LB_787:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_788
	jmp LB_789
LB_788:
	mov r8,unt_1
	jmp LB_784
LB_789:
	add r14,1
	jmp LB_785
LB_784:
	add rsp,0
	jmp LB_780
LB_785:
	jmp LB_791
LB_790:
	add r14,1 
LB_791:
	cmp r14,r9
	jge LB_792
	JZ_LINE_SPC BYTE [r13+8+r14], LB_790
LB_792
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_795
	jmp LB_796
LB_795:
	jmp LB_793
LB_796:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_794
LB_793:
	add rsp,0
	jmp LB_780
LB_794:
	jmp LB_798
LB_797:
	add r14,1 
LB_798:
	cmp r14,r9
	jge LB_799
	JZ_LINE_SPC BYTE [r13+8+r14], LB_797
LB_799
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_802
	jmp LB_803
LB_802:
	mov r8,unt_1
	jmp LB_800
LB_803:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_804
	jmp LB_805
LB_804:
	mov r8,unt_1
	jmp LB_800
LB_805:
	add r14,1
	jmp LB_801
LB_800:
	add rsp,8
	jmp LB_780
LB_801:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_806
LB_806
;; rsp=1 , %1932~1'(= r ) %1931~0'(= r ) %1930~8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
;; rsp=1 , %1933~0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1932~1'(= r ) %1931~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
;; rsp=1 , %1934~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1932~1'(= r ) %1931~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 2'(= a3◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_807
LB_807:
	cmp BYTE [r8+6],0
	jnz LB_780
	POP_GRM_SCC
	ret
LB_780:
	RB_GRM
	jmp LB_810
LB_809:
	add r14,1 
LB_810:
	cmp r14,r9
	jge LB_811
	JZ_LINE_SPC BYTE [r13+8+r14], LB_809
LB_811
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_814
	jmp LB_815
LB_814:
	jmp LB_812
LB_815:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_813
LB_812:
	add rsp,0
	jmp LB_808
LB_813:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_816
LB_816
;; rsp=1 , %1937~1'(= r ) %1936~0'(= r ) %1935~8'(= a25◂ [ {| l |}] ) 
; #112 8'(= a25◂ [ {| l |}] ) ⊢ 1(<2)◂8'(= a25◂ [ {| l |}] )
;; rsp=1 , %1938~1(<2)◂8'(= a25◂ [ {| l |}] ) %1937~1'(= r ) %1936~0'(= r ) 
; #26 1(<2)◂8'(= a25◂ [ {| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] )
;; rsp=1 , %1939~0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] ) %1937~1'(= r ) %1936~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] ) ⊢ 2'(= a3◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_817
LB_817:
	cmp BYTE [r8+6],0
	jnz LB_808
	POP_GRM_SCC
	ret
LB_808:
	POP_GRM_FAIL 
	ret
ETR_322:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_322
	ret
GRM_322:
	PUSH_GRM
	jmp LB_820
LB_819:
	add r14,1 
LB_820:
	cmp r14,r9
	jge LB_821
	JZ_LINE_SPC BYTE [r13+8+r14], LB_819
LB_821
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_824
	jmp LB_825
LB_824:
	jmp LB_822
LB_825:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_823
LB_822:
	add rsp,0
	jmp LB_818
LB_823:
	jmp LB_827
LB_826:
	add r14,1 
LB_827:
	cmp r14,r9
	jge LB_828
	JZ_LINE_SPC BYTE [r13+8+r14], LB_826
LB_828
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_831
	jmp LB_832
LB_831:
	jmp LB_829
LB_832:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_830
LB_829:
	add rsp,8
	jmp LB_818
LB_830:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_833
LB_833
;; rsp=2 , %1943~1'(= r ) %1942~0'(= r ) %1941~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1940~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1944~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1943~1'(= r ) %1942~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1945~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1943~1'(= r ) %1942~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a25◂ [ {| l |}]]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_834
LB_834:
	cmp BYTE [r8+6],0
	jnz LB_818
	POP_GRM_SCC
	ret
LB_818:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_836
LB_836
;; rsp=0 , %1947~1'(= r ) %1946~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1948~1(<2)◂{ } %1947~1'(= r ) %1946~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1949~0(<2)◂1(<2)◂{ } %1947~1'(= r ) %1946~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a25◂ [ {| l |}]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_837
LB_837:
	cmp BYTE [r8+6],0
	jnz LB_835
	POP_GRM_SCC
	ret
LB_835:
	POP_GRM_FAIL 
	ret
ETR_323:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_323
	ret
GRM_323:
	PUSH_GRM
	jmp LB_840
LB_839:
	add r14,1 
LB_840:
	cmp r14,r9
	jge LB_841
	JZ_LINE_SPC BYTE [r13+8+r14], LB_839
LB_841
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_844
	jmp LB_845
LB_844:
	mov r8,unt_1
	jmp LB_842
LB_845:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_846
	jmp LB_847
LB_846:
	mov r8,unt_1
	jmp LB_842
LB_847:
	add r14,1
	jmp LB_843
LB_842:
	add rsp,0
	jmp LB_838
LB_843:
	jmp LB_849
LB_848:
	add r14,1 
LB_849:
	cmp r14,r9
	jge LB_850
	JZ_LINE_SPC BYTE [r13+8+r14], LB_848
LB_850
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_853
	jmp LB_854
LB_853:
	jmp LB_851
LB_854:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_852
LB_851:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_852:
	jmp LB_856
LB_855:
	add r14,1 
LB_856:
	cmp r14,r9
	jge LB_857
	JZ_LINE_SPC BYTE [r13+8+r14], LB_855
LB_857
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_860
	jmp LB_861
LB_860:
	jmp LB_858
LB_861:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_859
LB_858:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_859:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_862
LB_862
;; rsp=2 , %1953~1'(= r ) %1952~0'(= r ) %1951~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1950~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1954~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1953~1'(= r ) %1952~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1955~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1953~1'(= r ) %1952~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a25◂ [ {| l |}]]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_863
LB_863:
	cmp BYTE [r8+6],0
	jnz LB_838
	POP_GRM_SCC
	ret
LB_838:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_865
LB_865
;; rsp=0 , %1957~1'(= r ) %1956~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1958~1(<2)◂{ } %1957~1'(= r ) %1956~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1959~0(<2)◂1(<2)◂{ } %1957~1'(= r ) %1956~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a17◂ [ a25◂ [ {| l |}]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_866
LB_866:
	cmp BYTE [r8+6],0
	jnz LB_864
	POP_GRM_SCC
	ret
LB_864:
	POP_GRM_FAIL 
	ret
ETR_324:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_324
	ret
GRM_324:
	PUSH_GRM
	jmp LB_869
LB_868:
	add r14,1 
LB_869:
	cmp r14,r9
	jge LB_870
	JZ_LINE_SPC BYTE [r13+8+r14], LB_868
LB_870
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_873
	jmp LB_874
LB_873:
	mov r8,unt_1
	jmp LB_871
LB_874:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_875
	jmp LB_876
LB_875:
	mov r8,unt_1
	jmp LB_871
LB_876:
	add r14,1
	jmp LB_872
LB_871:
	add rsp,0
	jmp LB_867
LB_872:
	jmp LB_878
LB_877:
	add r14,1 
LB_878:
	cmp r14,r9
	jge LB_879
	JZ_LINE_SPC BYTE [r13+8+r14], LB_877
LB_879
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_882
	jmp LB_883
LB_882:
	jmp LB_880
LB_883:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_881
LB_880:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_881:
	jmp LB_885
LB_884:
	add r14,1 
LB_885:
	cmp r14,r9
	jge LB_886
	JZ_LINE_SPC BYTE [r13+8+r14], LB_884
LB_886
	call GRM_324
	cmp BYTE [r8+6],0
	jnz LB_889
	jmp LB_890
LB_889:
	jmp LB_887
LB_890:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a2◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_888
LB_887:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_888:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_891
LB_891
;; rsp=2 , %1963~1'(= r ) %1962~0'(= r ) %1961~9'(= a2◂ [ a25◂ [ {| l |}]] ) %1960~8'(= a25◂ [ {| l |}] ) 
; #25 { 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %1964~0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %1963~1'(= r ) %1962~0'(= r ) 
; #26 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %1965~0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %1963~1'(= r ) %1962~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a25◂ [ {| l |}]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_892
LB_892:
	cmp BYTE [r8+6],0
	jnz LB_867
	POP_GRM_SCC
	ret
LB_867:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_894
LB_894
;; rsp=0 , %1967~1'(= r ) %1966~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1968~1(<2)◂{ } %1967~1'(= r ) %1966~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1969~0(<2)◂1(<2)◂{ } %1967~1'(= r ) %1966~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a25◂ [ {| l |}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_895
LB_895:
	cmp BYTE [r8+6],0
	jnz LB_893
	POP_GRM_SCC
	ret
LB_893:
	POP_GRM_FAIL 
	ret
ETR_325:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_325
	ret
GRM_325:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_899
	jmp LB_900
LB_899:
	mov r8,unt_1
	jmp LB_897
LB_900:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_901
	jmp LB_902
LB_901:
	mov r8,unt_1
	jmp LB_897
LB_902:
	add r14,1
	jmp LB_898
LB_897:
	add rsp,0
	jmp LB_896
LB_898:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_905
	jmp LB_906
LB_905:
	jmp LB_903
LB_906:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_904
LB_903:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_904:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_907
LB_907
;; rsp=1 , %1972~1'(= r ) %1971~0'(= r ) %1970~8'(= {| l |} ) 
; #190 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1973~1(<2)◂8'(= {| l |} ) %1972~1'(= r ) %1971~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1974~0(<2)◂1(<2)◂8'(= {| l |} ) %1972~1'(= r ) %1971~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a25◂ [ {| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_908
LB_908:
	cmp BYTE [r8+6],0
	jnz LB_896
	POP_GRM_SCC
	ret
LB_896:
	RB_GRM
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_912
	jmp LB_913
LB_912:
	jmp LB_910
LB_913:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_911
LB_910:
	add rsp,0
	jmp LB_909
LB_911:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_914
LB_914
;; rsp=1 , %1977~1'(= r ) %1976~0'(= r ) %1975~8'(= {| l |} ) 
; #190 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1978~1(<2)◂8'(= {| l |} ) %1977~1'(= r ) %1976~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1979~0(<2)◂1(<2)◂8'(= {| l |} ) %1977~1'(= r ) %1976~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a25◂ [ {| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_915
LB_915:
	cmp BYTE [r8+6],0
	jnz LB_909
	POP_GRM_SCC
	ret
LB_909:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_919
	jmp LB_920
LB_919:
	mov r8,unt_1
	jmp LB_917
LB_920:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_921
	jmp LB_922
LB_921:
	mov r8,unt_1
	jmp LB_917
LB_922:
	add r14,1
	jmp LB_918
LB_917:
	add rsp,0
	jmp LB_916
LB_918:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_923
LB_923
;; rsp=0 , %1981~1'(= r ) %1980~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1982~1(<2)◂{ } %1981~1'(= r ) %1980~0'(= r ) 
; #191 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1983~0(<2)◂1(<2)◂{ } %1981~1'(= r ) %1980~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1984~0(<2)◂0(<2)◂1(<2)◂{ } %1981~1'(= r ) %1980~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a25◂ [ {| l |}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_924
LB_924:
	cmp BYTE [r8+6],0
	jnz LB_916
	POP_GRM_SCC
	ret
LB_916:
	POP_GRM_FAIL 
	ret
LB_949: ;; #301 { 0'(= a34◂ [ ] ) 1'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0'(= a34◂ [ ] ) : ({ _t34 _lst◂_t34 }→_t34)
;; rsp=0 , %1728~1'(= a2◂ [ a34◂ [ ]] ) %1727~0'(= a34◂ [ ] ) 
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a34◂ [ ] ) 3'(= a2◂ [ a34◂ [ ]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_951
	jmp LB_952
LB_951:
	jmp LB_950
LB_952:
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov QWORD [GBG_VCT+8*0],r14
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %1730~3'(= a2◂ [ a34◂ [ ]] ) %1729~2'(= a34◂ [ ] ) %1727~0'(= a34◂ [ ] ) 
; #227 { 0'(= a34◂ [ ] ) 2'(= a34◂ [ ] ) } ⊢ 2(<5)◂{ 0'(= a34◂ [ ] ) 2'(= a34◂ [ ] ) }
;; rsp=0 , %1731~2(<5)◂{ 0'(= a34◂ [ ] ) 2'(= a34◂ [ ] ) } %1730~3'(= a2◂ [ a34◂ [ ]] ) 
; #301 { 2(<5)◂{ 0'(= a34◂ [ ] ) 2'(= a34◂ [ ] ) } 3'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0'(= a34◂ [ ] )
; .mov_ptn2 { 2(<5)◂{ 0'(= a34◂ [ ] ) 2'(= a34◂ [ ] ) } 3'(= a2◂ [ a34◂ [ ]] ) } ⊢ { 0'(= a34◂ [ ] ) 1'(= a2◂ [ a34◂ [ ]] ) }
; {| 11110.. |}
	mov r14,r9
	mov r9,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r10,r9
	mov rax,r10
	mov QWORD [r13+8],rax
	mov r10,r8
	mov rax,r10
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],2
	call LB_949
;; rsp=0 , %1732~0'(= a34◂ [ ] ) 
; ∎ 0'(= a34◂ [ ] )
; .mov_ptn2 0'(= a34◂ [ ] ) ⊢ 0'(= a34◂ [ ] )
; {| 10.. |}
	ret
LB_950:
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1727~0'(= a34◂ [ ] ) 
; ∎ 0'(= a34◂ [ ] )
; .mov_ptn2 0'(= a34◂ [ ] ) ⊢ 0'(= a34◂ [ ] )
; {| 10.. |}
	ret
LB_1034: ;; #82 { 0'(= a2◂ [ a34◂ [ ]] ) 1'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0'(= a2◂ [ a34◂ [ ]] ) : ({ _lst◂4244'(=4245'(=_t34)) _lst◂_t34 }→_lst◂_t34)
;; rsp=0 , %241~1'(= a2◂ [ a34◂ [ ]] ) %240~0'(= a2◂ [ a34◂ [ ]] ) 
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_1036
	jmp LB_1037
LB_1036:
	jmp LB_1035
LB_1037:
;; rsp=0 , %240~0'(= a2◂ [ a34◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a34◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a34◂ [ ]] ) ⊢ 0'(= a2◂ [ a34◂ [ ]] )
; {| 10.. |}
	ret
LB_1035:
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a34◂ [ ] ) 3'(= a2◂ [ a34◂ [ ]] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov QWORD [GBG_VCT+8*0],r14
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %243~3'(= a2◂ [ a34◂ [ ]] ) %242~2'(= a34◂ [ ] ) %240~0'(= a2◂ [ a34◂ [ ]] ) 
; #25 { 2'(= a34◂ [ ] ) 0'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂{ 2'(= a34◂ [ ] ) 0'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=0 , %244~0(<2)◂{ 2'(= a34◂ [ ] ) 0'(= a2◂ [ a34◂ [ ]] ) } %243~3'(= a2◂ [ a34◂ [ ]] ) 
; #82 { 0(<2)◂{ 2'(= a34◂ [ ] ) 0'(= a2◂ [ a34◂ [ ]] ) } 3'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0'(= a2◂ [ a34◂ [ ]] )
; .mov_ptn2 { 0(<2)◂{ 2'(= a34◂ [ ] ) 0'(= a2◂ [ a34◂ [ ]] ) } 3'(= a2◂ [ a34◂ [ ]] ) } ⊢ { 0'(= a2◂ [ a34◂ [ ]] ) 1'(= a2◂ [ a34◂ [ ]] ) }
; {| 11110.. |}
	mov r14,r9
	mov r9,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r10,r8
	mov rax,r10
	mov QWORD [r13+8],rax
	mov r10,r9
	mov rax,r10
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	call LB_1034
;; rsp=0 , %245~0'(= a2◂ [ a34◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a34◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a34◂ [ ]] ) ⊢ 0'(= a2◂ [ a34◂ [ ]] )
; {| 10.. |}
	ret
LB_1033: ;; #83 0'(= a2◂ [ a34◂ [ ]] ) ⊢ 0'(= a2◂ [ a34◂ [ ]] ) : (_lst◂_t34→_lst◂_t34)
;; rsp=0 , %246~0'(= a2◂ [ a34◂ [ ]] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %247~1(<2)◂{ } %246~0'(= a2◂ [ a34◂ [ ]] ) 
; #82 { 1(<2)◂{ } 0'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0'(= a2◂ [ a34◂ [ ]] )
; .mov_ptn2 { 1(<2)◂{ } 0'(= a2◂ [ a34◂ [ ]] ) } ⊢ { 0'(= a2◂ [ a34◂ [ ]] ) 1'(= a2◂ [ a34◂ [ ]] ) }
; {| 110.. |}
	mov r14,r13
	mov r13,unt_1
	call LB_1034
;; rsp=0 , %248~0'(= a2◂ [ a34◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a34◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a34◂ [ ]] ) ⊢ 0'(= a2◂ [ a34◂ [ ]] )
; {| 10.. |}
	ret
ETR_326:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_326
	ret
GRM_326:
	PUSH_GRM
	jmp LB_927
LB_926:
	add r14,1 
LB_927:
	cmp r14,r9
	jge LB_928
	JZ_LINE_SPC BYTE [r13+8+r14], LB_926
LB_928
	call GRM_329
	cmp BYTE [r8+6],0
	jnz LB_931
	jmp LB_932
LB_931:
	jmp LB_929
LB_932:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_930
LB_929:
	add rsp,0
	jmp LB_925
LB_930:
	jmp LB_934
LB_933:
	add r14,1 
LB_934:
	cmp r14,r9
	jge LB_935
	JZ_LINE_SPC BYTE [r13+8+r14], LB_933
LB_935
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_938
	jmp LB_939
LB_938:
	jmp LB_936
LB_939:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_937
LB_936:
	add rsp,8
	jmp LB_925
LB_937:
	jmp LB_941
LB_940:
	add r14,1 
LB_941:
	cmp r14,r9
	jge LB_942
	JZ_LINE_SPC BYTE [r13+8+r14], LB_940
LB_942
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_945
	jmp LB_946
LB_945:
	jmp LB_943
LB_946:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 10'(= a3◂ [ a34◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_944
LB_943:
	add rsp,16
	jmp LB_925
LB_944:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_947
LB_947
;; rsp=3 , %1989~1'(= r ) %1988~0'(= r ) %1987~10'(= a3◂ [ a34◂ [ ]] ) %1986~9'(= a2◂ [ a34◂ [ ]] ) %1985~8'(= a34◂ [ ] ) 
; #301 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 2'(= a34◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ { 0'(= a34◂ [ ] ) 1'(= a2◂ [ a34◂ [ ]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*5]
	call LB_949
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=3 , %1990~2'(= a34◂ [ ] ) %1989~1'(= r ) %1988~0'(= r ) %1987~10'(= a3◂ [ a34◂ [ ]] ) 
;; ?; 10'(= a3◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂3'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_954
	jmp LB_955
LB_954:
	jmp LB_953
LB_955:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %1991~3'(= a34◂ [ ] ) %1990~2'(= a34◂ [ ] ) %1989~1'(= r ) %1988~0'(= r ) 
; #228 { 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } ⊢ 1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) }
;; rsp=3 , %1992~1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } %1989~1'(= r ) %1988~0'(= r ) 
; #26 1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } ⊢ 0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) }
;; rsp=3 , %1993~0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } %1989~1'(= r ) %1988~0'(= r ) 
; ∎ 0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) }
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
; .mov_ptn2 0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } ⊢ 2'(= a3◂ [ a34◂ [ ]] )
; {| 00110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_948
LB_953:
;; ?; 10'(= a3◂ [ a34◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %1990~2'(= a34◂ [ ] ) %1989~1'(= r ) %1988~0'(= r ) 
; #26 2'(= a34◂ [ ] ) ⊢ 0(<2)◂2'(= a34◂ [ ] )
;; rsp=3 , %1994~0(<2)◂2'(= a34◂ [ ] ) %1989~1'(= r ) %1988~0'(= r ) 
; ∎ 0(<2)◂2'(= a34◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a34◂ [ ] ) ⊢ 2'(= a3◂ [ a34◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_948
LB_948:
	cmp BYTE [r8+6],0
	jnz LB_925
	POP_GRM_SCC
	ret
LB_925:
	POP_GRM_FAIL 
	ret
ETR_327:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_327
	ret
GRM_327:
	PUSH_GRM
	jmp LB_958
LB_957:
	add r14,1 
LB_958:
	cmp r14,r9
	jge LB_959
	JZ_LINE_SPC BYTE [r13+8+r14], LB_957
LB_959
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_962
	jmp LB_963
LB_962:
	mov r8,unt_1
	jmp LB_960
LB_963:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_964
	cmp BYTE [rdi+1],134
	jnz LB_964
	cmp BYTE [rdi+2],146
	jnz LB_964
	jmp LB_965
LB_964:
	mov r8,unt_1
	jmp LB_960
LB_965:
	add r14,3
	jmp LB_961
LB_960:
	add rsp,0
	jmp LB_956
LB_961:
	jmp LB_967
LB_966:
	add r14,1 
LB_967:
	cmp r14,r9
	jge LB_968
	JZ_LINE_SPC BYTE [r13+8+r14], LB_966
LB_968
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_971
	jmp LB_972
LB_971:
	jmp LB_969
LB_972:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_970
LB_969:
	add rsp,0
	jmp LB_956
LB_970:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_973
LB_973
;; rsp=1 , %1997~1'(= r ) %1996~0'(= r ) %1995~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %1998~0(<2)◂8'(= a34◂ [ ] ) %1997~1'(= r ) %1996~0'(= r ) 
; #26 0(<2)◂8'(= a34◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %1999~0(<2)◂0(<2)◂8'(= a34◂ [ ] ) %1997~1'(= r ) %1996~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a34◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a34◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_974
LB_974:
	cmp BYTE [r8+6],0
	jnz LB_956
	POP_GRM_SCC
	ret
LB_956:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_976
LB_976
;; rsp=0 , %2001~1'(= r ) %2000~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2002~1(<2)◂{ } %2001~1'(= r ) %2000~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2003~0(<2)◂1(<2)◂{ } %2001~1'(= r ) %2000~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a34◂ [ ]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_977
LB_977:
	cmp BYTE [r8+6],0
	jnz LB_975
	POP_GRM_SCC
	ret
LB_975:
	POP_GRM_FAIL 
	ret
ETR_328:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_328
	ret
GRM_328:
	PUSH_GRM
	jmp LB_980
LB_979:
	add r14,1 
LB_980:
	cmp r14,r9
	jge LB_981
	JZ_LINE_SPC BYTE [r13+8+r14], LB_979
LB_981
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_984
	jmp LB_985
LB_984:
	mov r8,unt_1
	jmp LB_982
LB_985:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_986
	cmp BYTE [rdi+1],151
	jnz LB_986
	cmp BYTE [rdi+2],130
	jnz LB_986
	jmp LB_987
LB_986:
	mov r8,unt_1
	jmp LB_982
LB_987:
	add r14,3
	jmp LB_983
LB_982:
	add rsp,0
	jmp LB_978
LB_983:
	jmp LB_989
LB_988:
	add r14,1 
LB_989:
	cmp r14,r9
	jge LB_990
	JZ_LINE_SPC BYTE [r13+8+r14], LB_988
LB_990
	call GRM_329
	cmp BYTE [r8+6],0
	jnz LB_993
	jmp LB_994
LB_993:
	jmp LB_991
LB_994:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_992
LB_991:
	add rsp,0
	jmp LB_978
LB_992:
	jmp LB_996
LB_995:
	add r14,1 
LB_996:
	cmp r14,r9
	jge LB_997
	JZ_LINE_SPC BYTE [r13+8+r14], LB_995
LB_997
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_1000
	jmp LB_1001
LB_1000:
	jmp LB_998
LB_1001:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_999
LB_998:
	add rsp,8
	jmp LB_978
LB_999:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1002
LB_1002
;; rsp=2 , %2007~1'(= r ) %2006~0'(= r ) %2005~9'(= a2◂ [ a34◂ [ ]] ) %2004~8'(= a34◂ [ ] ) 
; #25 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2008~0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2007~1'(= r ) %2006~0'(= r ) 
; #26 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2009~0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2007~1'(= r ) %2006~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a34◂ [ ]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_1003
LB_1003:
	cmp BYTE [r8+6],0
	jnz LB_978
	POP_GRM_SCC
	ret
LB_978:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1005
LB_1005
;; rsp=0 , %2011~1'(= r ) %2010~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2012~1(<2)◂{ } %2011~1'(= r ) %2010~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2013~0(<2)◂1(<2)◂{ } %2011~1'(= r ) %2010~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a34◂ [ ]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1006
LB_1006:
	cmp BYTE [r8+6],0
	jnz LB_1004
	POP_GRM_SCC
	ret
LB_1004:
	POP_GRM_FAIL 
	ret
ETR_329:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_329
	ret
GRM_329:
	PUSH_GRM
	jmp LB_1009
LB_1008:
	add r14,1 
LB_1009:
	cmp r14,r9
	jge LB_1010
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1008
LB_1010
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1013
	jmp LB_1014
LB_1013:
	mov r8,unt_1
	jmp LB_1011
LB_1014:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1015
	jmp LB_1016
LB_1015:
	mov r8,unt_1
	jmp LB_1011
LB_1016:
	add r14,1
	jmp LB_1012
LB_1011:
	add rsp,0
	jmp LB_1007
LB_1012:
	jmp LB_1018
LB_1017:
	add r14,1 
LB_1018:
	cmp r14,r9
	jge LB_1019
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1017
LB_1019
	call GRM_326
	push r8
	jmp LB_1021
LB_1020:
	add rsp,0
	jmp LB_1007
LB_1021:
	jmp LB_1023
LB_1022:
	add r14,1 
LB_1023:
	cmp r14,r9
	jge LB_1024
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1022
LB_1024
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1027
	jmp LB_1028
LB_1027:
	mov r8,unt_1
	jmp LB_1025
LB_1028:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1029
	jmp LB_1030
LB_1029:
	mov r8,unt_1
	jmp LB_1025
LB_1030:
	add r14,1
	jmp LB_1026
LB_1025:
	add rsp,0
	jmp LB_1007
LB_1026:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1031
LB_1031
;; rsp=0 , %2016~1'(= r ) %2015~0'(= r ) %2014~9'(= a3◂ [ a34◂ [ ]] ) 
; #83 9'(= a3◂ [ a34◂ [ ]] ) ⊢ 2'(= a2◂ [ a34◂ [ ]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 9'(= a3◂ [ a34◂ [ ]] ) ⊢ 0'(= a2◂ [ a34◂ [ ]] )
; {| 10000000110.. |}
	mov r13,QWORD [rsp-8+8*1]
	call LB_1033
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %2017~2'(= a2◂ [ a34◂ [ ]] ) %2016~1'(= r ) %2015~0'(= r ) 
; #229 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<5)◂2'(= a2◂ [ a34◂ [ ]] )
;; rsp=0 , %2018~0(<5)◂2'(= a2◂ [ a34◂ [ ]] ) %2016~1'(= r ) %2015~0'(= r ) 
; #26 0(<5)◂2'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂0(<5)◂2'(= a2◂ [ a34◂ [ ]] )
;; rsp=0 , %2019~0(<2)◂0(<5)◂2'(= a2◂ [ a34◂ [ ]] ) %2016~1'(= r ) %2015~0'(= r ) 
; ∎ 0(<2)◂0(<5)◂2'(= a2◂ [ a34◂ [ ]] )
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
; .mov_ptn2 0(<2)◂0(<5)◂2'(= a2◂ [ a34◂ [ ]] ) ⊢ 2'(= a3◂ [ a34◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1032
LB_1032:
	cmp BYTE [r8+6],0
	jnz LB_1007
	POP_GRM_SCC
	ret
LB_1007:
	RB_GRM
	jmp LB_1040
LB_1039:
	add r14,1 
LB_1040:
	cmp r14,r9
	jge LB_1041
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1039
LB_1041
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1044
	jmp LB_1045
LB_1044:
	mov r8,unt_1
	jmp LB_1042
LB_1045:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],40
	jnz LB_1046
	jmp LB_1047
LB_1046:
	mov r8,unt_1
	jmp LB_1042
LB_1047:
	add r14,1
	jmp LB_1043
LB_1042:
	add rsp,0
	jmp LB_1038
LB_1043:
	jmp LB_1049
LB_1048:
	add r14,1 
LB_1049:
	cmp r14,r9
	jge LB_1050
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1048
LB_1050
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_1053
	jmp LB_1054
LB_1053:
	jmp LB_1051
LB_1054:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1052
LB_1051:
	add rsp,0
	jmp LB_1038
LB_1052:
	jmp LB_1056
LB_1055:
	add r14,1 
LB_1056:
	cmp r14,r9
	jge LB_1057
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1055
LB_1057
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1060
	jmp LB_1061
LB_1060:
	mov r8,unt_1
	jmp LB_1058
LB_1061:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],41
	jnz LB_1062
	jmp LB_1063
LB_1062:
	mov r8,unt_1
	jmp LB_1058
LB_1063:
	add r14,1
	jmp LB_1059
LB_1058:
	add rsp,8
	jmp LB_1038
LB_1059:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1064
LB_1064
;; rsp=1 , %2022~1'(= r ) %2021~0'(= r ) %2020~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %2023~0(<2)◂8'(= a34◂ [ ] ) %2022~1'(= r ) %2021~0'(= r ) 
; ∎ 0(<2)◂8'(= a34◂ [ ] )
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
; .mov_ptn2 0(<2)◂8'(= a34◂ [ ] ) ⊢ 2'(= a3◂ [ a34◂ [ ]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1065
LB_1065:
	cmp BYTE [r8+6],0
	jnz LB_1038
	POP_GRM_SCC
	ret
LB_1038:
	RB_GRM
	jmp LB_1068
LB_1067:
	add r14,1 
LB_1068:
	cmp r14,r9
	jge LB_1069
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1067
LB_1069
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_1072
	jmp LB_1073
LB_1072:
	jmp LB_1070
LB_1073:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1071
LB_1070:
	add rsp,0
	jmp LB_1066
LB_1071:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1074
LB_1074
;; rsp=1 , %2026~1'(= r ) %2025~0'(= r ) %2024~8'(= {| l |} ) 
; #225 8'(= {| l |} ) ⊢ 4(<5)◂8'(= {| l |} )
;; rsp=1 , %2027~4(<5)◂8'(= {| l |} ) %2026~1'(= r ) %2025~0'(= r ) 
; #26 4(<5)◂8'(= {| l |} ) ⊢ 0(<2)◂4(<5)◂8'(= {| l |} )
;; rsp=1 , %2028~0(<2)◂4(<5)◂8'(= {| l |} ) %2026~1'(= r ) %2025~0'(= r ) 
; ∎ 0(<2)◂4(<5)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂4(<5)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a34◂ [ ]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],4
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1075
LB_1075:
	cmp BYTE [r8+6],0
	jnz LB_1066
	POP_GRM_SCC
	ret
LB_1066:
	RB_GRM
	jmp LB_1078
LB_1077:
	add r14,1 
LB_1078:
	cmp r14,r9
	jge LB_1079
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1077
LB_1079
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_1082
	jmp LB_1083
LB_1082:
	jmp LB_1080
LB_1083:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1081
LB_1080:
	add rsp,0
	jmp LB_1076
LB_1081:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1084
LB_1084
;; rsp=1 , %2031~1'(= r ) %2030~0'(= r ) %2029~8'(= a18◂ [ ] ) 
; #226 8'(= a18◂ [ ] ) ⊢ 3(<5)◂8'(= a18◂ [ ] )
;; rsp=1 , %2032~3(<5)◂8'(= a18◂ [ ] ) %2031~1'(= r ) %2030~0'(= r ) 
; #26 3(<5)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂3(<5)◂8'(= a18◂ [ ] )
;; rsp=1 , %2033~0(<2)◂3(<5)◂8'(= a18◂ [ ] ) %2031~1'(= r ) %2030~0'(= r ) 
; ∎ 0(<2)◂3(<5)◂8'(= a18◂ [ ] )
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
; .mov_ptn2 0(<2)◂3(<5)◂8'(= a18◂ [ ] ) ⊢ 2'(= a3◂ [ a34◂ [ ]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1085
LB_1085:
	cmp BYTE [r8+6],0
	jnz LB_1076
	POP_GRM_SCC
	ret
LB_1076:
	POP_GRM_FAIL 
	ret
ETR_330:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_330
	ret
GRM_330:
	PUSH_GRM
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_1089
	jmp LB_1090
LB_1089:
	jmp LB_1087
LB_1090:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1088
LB_1087:
	add rsp,0
	jmp LB_1086
LB_1088:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1093
	jmp LB_1094
LB_1093:
	mov r8,unt_1
	jmp LB_1091
LB_1094:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1095
	jmp LB_1096
LB_1095:
	mov r8,unt_1
	jmp LB_1091
LB_1096:
	add r14,1
	jmp LB_1092
LB_1091:
	add rsp,8
	jmp LB_1086
LB_1092:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1097
LB_1097
;; rsp=1 , %2036~1'(= r ) %2035~0'(= r ) %2034~8'(= {| l |} ) 
; #26 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %2037~0(<2)◂8'(= {| l |} ) %2036~1'(= r ) %2035~0'(= r ) 
; ∎ 0(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],0
	add rsp,8
	jmp LB_1098
LB_1098:
	cmp BYTE [r8+6],0
	jnz LB_1086
	POP_GRM_SCC
	ret
LB_1086:
	POP_GRM_FAIL 
	ret
LB_1118:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1121+8*rax]
LB_1121: dq LB_1119,LB_1120
LB_1119:
	jmp LB_1122
LB_1120:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1123
	jmp LB_1122
LB_1122:
	ret
LB_1123:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1126+8*rax]
LB_1126: dq LB_1124,LB_1125
LB_1124:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	mov rdi,r8
	call free_s8
	pop r8 
	FREE_RCD 3, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1123
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1127
LB_1125:
	jmp LB_1127
LB_1127:
	ret
LB_1227: ;; #84 { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] ) : ({ _lst◂{ _r64 _r64 _s8 } _lst◂{ _r64 _r64 _s8 } }→_lst◂{ _r64 _r64 _s8 })
;; rsp=0 , %250~1'(= a2◂ [ *{ rr{| l |}}] ) %249~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 3'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1229
	jmp LB_1230
LB_1229:
	jmp LB_1228
LB_1230:
	mov r8, QWORD [r13+8]
	mov r9, QWORD [r13+16]
	mov QWORD [GBG_VCT+8*0],r13
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %252~3'(= a2◂ [ *{ rr{| l |}}] ) %251~2'(= *{ rr{| l |}} ) %250~1'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 3'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,8
	mov QWORD [rsp+0],r8
; .mov_ptn2 { 3'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1101000010.. |}
	mov r13,r9
	call LB_1227
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %253~0'(= a2◂ [ *{ rr{| l |}}] ) %251~2'(= *{ rr{| l |}} ) 
; #25 { 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %254~0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } 
; ∎ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 1010.. |}
	mov r14,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,r8
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	ret
LB_1228:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %250~1'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 110.. |}
	mov r13,r14
	ret
LB_1217: ;; #309 { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) } ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] ) : ({ _t47◂{ } _t47◂{ } }→_t47◂{ { } { } })
;; rsp=0 , %1788~1'(= a47◂ [ *{ }] ) %1787~0'(= a47◂ [ *{ }] ) 
;; ? 0'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂0'(= *{ } )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1219
	jmp LB_1220
LB_1219:
	jmp LB_1218
LB_1220:
;; rsp=0 , %1790~0'(= *{ } ) %1788~1'(= a47◂ [ *{ }] ) 
;; ? 1'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1222
	jmp LB_1223
LB_1222:
	jmp LB_1221
LB_1223:
;; rsp=0 , %1792~1'(= *{ } ) %1790~0'(= *{ } ) 
; #308 { 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
;; rsp=0 , %1793~0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } 
; ∎ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
; .mov_ptn2 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] )
; {| 110.. |}
	mov r8,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,r8
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	ret
LB_1221:
;; ?. 1'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1791~2'(= a2◂ [ *{ rr{| l |}}] ) %1790~0'(= *{ } ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1794~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1790~0'(= *{ } ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= *{ } )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_1218:
;; ?. 0'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1789~2'(= a2◂ [ *{ rr{| l |}}] ) %1788~1'(= a47◂ [ *{ }] ) 
;; ? 1'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1225
	jmp LB_1226
LB_1225:
	jmp LB_1224
LB_1226:
;; rsp=0 , %1796~1'(= *{ } ) %1789~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1797~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1796~1'(= *{ } ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 1'(= *{ } )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_1224:
;; ?. 1'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1795~0'(= a2◂ [ *{ rr{| l |}}] ) %1789~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
	call LB_1227
;; rsp=0 , %1798~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #307 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1799~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_1234: ;; #312 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} ) : (_lst◂{ _r64 _r64 _s8 }→_s8)
;; rsp=0 , %1817~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ { 2'(= r ) 3'(= r ) 4'(= {| l |} ) } 5'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1236
	jmp LB_1237
LB_1236:
	jmp LB_1235
LB_1237:
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
	mov QWORD [GBG_VCT+8*0],r14
	mov r11, QWORD [r13+16]
	mov QWORD [GBG_VCT+8*1],r13
	mov rdi,QWORD [GBG_VCT+8*1]
	FREE_RCD 2,rdi
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=0 , %1821~5'(= a2◂ [ *{ rr{| l |}}] ) %1820~4'(= {| l |} ) %1819~3'(= r ) %1818~2'(= r ) 
; #312 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+0],r8
	mov QWORD [rsp+8],r9
	mov QWORD [rsp+16],r10
; .mov_ptn2 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 100001001110.. |}
	mov r13,r11
	call LB_1234
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %1822~0'(= {| l |} ) %1820~4'(= {| l |} ) %1819~3'(= r ) %1818~2'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	sub rsp,128
	push rdi 
	lea rdi,[rsp+8]
	mov rdx,r8
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	sub rsp,128
	push rdi 
	lea rdi,[rsp+8]
	mov rdx,r9
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r10]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,11
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_1238+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_1239+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1240+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1241+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1827~1'(= {| l |} ) %1826~0'(= {| l |} ) %1825~4'(= {| l |} ) %1824~3'(= r ) %1823~2'(= r ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
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
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; {| 110.. |}
	mov r13,r14
	ret
LB_1235:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %1828~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; {| 10.. |}
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r13,rax
	ret
ETR_332:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_332
	ret
GRM_332:
	PUSH_GRM
	jmp LB_1101
LB_1100:
	add r14,1 
LB_1101:
	cmp r14,r9
	jge LB_1102
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1100
LB_1102
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1105
	jmp LB_1106
LB_1105:
	mov r8,unt_1
	jmp LB_1103
LB_1106:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1107
	jmp LB_1108
LB_1107:
	mov r8,unt_1
	jmp LB_1103
LB_1108:
	add r14,1
	jmp LB_1104
LB_1103:
	add rsp,0
	jmp LB_1099
LB_1104:
	jmp LB_1110
LB_1109:
	add r14,1 
LB_1110:
	cmp r14,r9
	jge LB_1111
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1109
LB_1111
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1114
	jmp LB_1115
LB_1114:
	jmp LB_1112
LB_1115:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1113
LB_1112:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1113:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1116
LB_1116
;; rsp=1 , %2040~1'(= r ) %2039~0'(= r ) %2038~8'(= a47◂ [ *{ }] ) 
; #308 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2041~0(<2)◂{ } %2040~1'(= r ) %2039~0'(= r ) %2038~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=1 , %2042~0(<2)◂0(<2)◂{ } %2040~1'(= r ) %2039~0'(= r ) %2038~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1117
LB_1117:
	cmp BYTE [r8+6],0
	jnz LB_1099
	POP_GRM_SCC
	ret
LB_1099:
	RB_GRM
	jmp LB_1130
LB_1129:
	add r14,1 
LB_1130:
	cmp r14,r9
	jge LB_1131
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1129
LB_1131
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1134
	jmp LB_1135
LB_1134:
	mov r8,unt_1
	jmp LB_1132
LB_1135:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],35
	jnz LB_1136
	cmp BYTE [rdi+1],35
	jnz LB_1136
	jmp LB_1137
LB_1136:
	mov r8,unt_1
	jmp LB_1132
LB_1137:
	add r14,2
	jmp LB_1133
LB_1132:
	add rsp,0
	jmp LB_1128
LB_1133:
	jmp LB_1139
LB_1138:
	add r14,1 
LB_1139:
	cmp r14,r9
	jge LB_1140
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1138
LB_1140
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1143
	jmp LB_1144
LB_1143:
	jmp LB_1141
LB_1144:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_1142
LB_1141:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1142:
	jmp LB_1146
LB_1145:
	add r14,1 
LB_1146:
	cmp r14,r9
	jge LB_1147
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1145
LB_1147
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1150
	jmp LB_1151
LB_1150:
	jmp LB_1148
LB_1151:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1149
LB_1148:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_1149:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1152
LB_1152
;; rsp=3 , %2046~1'(= r ) %2045~0'(= r ) %2044~10'(= a47◂ [ *{ }] ) %2043~{ 8'(= r ) 9'(= r ) } 
; #308 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %2047~0(<2)◂{ } %2046~1'(= r ) %2045~0'(= r ) %2044~10'(= a47◂ [ *{ }] ) %2043~{ 8'(= r ) 9'(= r ) } 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %2048~0(<2)◂0(<2)◂{ } %2046~1'(= r ) %2045~0'(= r ) %2044~10'(= a47◂ [ *{ }] ) %2043~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂0(<2)◂{ }
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
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_1153
LB_1153:
	cmp BYTE [r8+6],0
	jnz LB_1128
	POP_GRM_SCC
	ret
LB_1128:
	RB_GRM
	jmp LB_1156
LB_1155:
	add r14,1 
LB_1156:
	cmp r14,r9
	jge LB_1157
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1155
LB_1157
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1160
	jmp LB_1161
LB_1160:
	mov r8,unt_1
	jmp LB_1158
LB_1161:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1162
	cmp BYTE [rdi+1],92
	jnz LB_1162
	jmp LB_1163
LB_1162:
	mov r8,unt_1
	jmp LB_1158
LB_1163:
	add r14,2
	jmp LB_1159
LB_1158:
	add rsp,0
	jmp LB_1154
LB_1159:
	jmp LB_1165
LB_1164:
	add r14,1 
LB_1165:
	cmp r14,r9
	jge LB_1166
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1164
LB_1166
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1169
	jmp LB_1170
LB_1169:
	jmp LB_1167
LB_1170:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_1168
LB_1167:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1168:
	jmp LB_1172
LB_1171:
	add r14,1 
LB_1172:
	cmp r14,r9
	jge LB_1173
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1171
LB_1173
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1176
	jmp LB_1177
LB_1176:
	jmp LB_1174
LB_1177:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1175
LB_1174:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_1175:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1178
LB_1178
;; rsp=3 , %2052~1'(= r ) %2051~0'(= r ) %2050~10'(= a47◂ [ *{ }] ) %2049~{ 8'(= r ) 9'(= r ) } 
; #308 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %2053~0(<2)◂{ } %2052~1'(= r ) %2051~0'(= r ) %2050~10'(= a47◂ [ *{ }] ) %2049~{ 8'(= r ) 9'(= r ) } 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %2054~0(<2)◂0(<2)◂{ } %2052~1'(= r ) %2051~0'(= r ) %2050~10'(= a47◂ [ *{ }] ) %2049~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂0(<2)◂{ }
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
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_1179
LB_1179:
	cmp BYTE [r8+6],0
	jnz LB_1154
	POP_GRM_SCC
	ret
LB_1154:
	RB_GRM
	jmp LB_1182
LB_1181:
	add r14,1 
LB_1182:
	cmp r14,r9
	jge LB_1183
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1181
LB_1183
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1186
	jmp LB_1187
LB_1186:
	mov r8,unt_1
	jmp LB_1184
LB_1187:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1188
	cmp BYTE [rdi+1],91
	jnz LB_1188
	jmp LB_1189
LB_1188:
	mov r8,unt_1
	jmp LB_1184
LB_1189:
	add r14,2
	jmp LB_1185
LB_1184:
	add rsp,0
	jmp LB_1180
LB_1185:
	PUSH_GRM
	jmp LB_1193
LB_1192:
	add r14,1 
LB_1193:
	cmp r14,r9
	jge LB_1194
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1192
LB_1194
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1197
	jmp LB_1198
LB_1197:
	mov r8,unt_1
	jmp LB_1195
LB_1198:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1199
	jmp LB_1200
LB_1199:
	mov r8,unt_1
	jmp LB_1195
LB_1200:
	add r14,1
	jmp LB_1196
LB_1195:
	add rsp,0
	jmp LB_1191
LB_1196:
	jmp LB_1202
LB_1201:
	add r14,1 
LB_1202:
	cmp r14,r9
	jge LB_1203
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1201
LB_1203
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_1206
	jmp LB_1207
LB_1206:
	jmp LB_1204
LB_1207:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1205
LB_1204:
	add rsp,0
	jmp LB_1191
LB_1205:
	jmp LB_1209
LB_1208:
	add r14,1 
LB_1209:
	cmp r14,r9
	jge LB_1210
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1208
LB_1210
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1213
	jmp LB_1214
LB_1213:
	jmp LB_1211
LB_1214:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1212
LB_1211:
	add rsp,8
	jmp LB_1191
LB_1212:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1215
LB_1215
;; rsp=2 , %2060~1'(= r ) %2059~0'(= r ) %2058~9'(= a47◂ [ *{ }] ) %2057~8'(= a47◂ [ *{ }] ) 
; #309 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ 2'(= a47◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_1217
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %2061~2'(= a47◂ [ *{ *{ }*{ }}] ) %2060~1'(= r ) %2059~0'(= r ) 
;; ? 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1232
	jmp LB_1233
LB_1232:
	jmp LB_1231
LB_1233:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %2064~4'(= *{ } ) %2063~3'(= *{ } ) %2060~1'(= r ) %2059~0'(= r ) 
; #308 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2065~0(<2)◂{ } %2064~4'(= *{ } ) %2063~3'(= *{ } ) %2060~1'(= r ) %2059~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2066~0(<2)◂0(<2)◂{ } %2064~4'(= *{ } ) %2063~3'(= *{ } ) %2060~1'(= r ) %2059~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn 4'(= *{ } )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 3'(= *{ } )
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
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1216
LB_1231:
;; ?. 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2062~3'(= a2◂ [ *{ rr{| l |}}] ) %2060~1'(= r ) %2059~0'(= r ) 
; #312 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 10010000110.. |}
	mov r13,r9
	call LB_1234
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %2067~2'(= {| l |} ) %2060~1'(= r ) %2059~0'(= r ) 
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
	jmp LB_1242
LB_1242:
;; rsp=0 , %2068~2'(= {| l |} ) %2060~1'(= r ) %2059~0'(= r ) 
	mov rdi,LB_1243
	call emt_stg 
	jmp err
LB_1216:
	cmp BYTE [r8+6],0
	jnz LB_1191
	POP_GRM_SCC
	jmp LB_1190
LB_1191:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1245
LB_1245
;; rsp=0 , %2070~1'(= r ) %2069~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	sub rsp,128
	push rdi 
	lea rdi,[rsp+8]
	mov rdx,r13
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	sub rsp,128
	push rdi 
	lea rdi,[rsp+8]
	mov rdx,r14
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,11
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_1247+2-1]
	mov rcx,2
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1248+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1249+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %2073~2'(= {| l |} ) %2072~1'(= r ) %2071~0'(= r ) 
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
	jmp LB_1250
LB_1250:
;; rsp=0 , %2074~2'(= {| l |} ) %2072~1'(= r ) %2071~0'(= r ) 
	mov rdi,LB_1251
	call emt_stg 
	jmp err
LB_1246:
	cmp BYTE [r8+6],0
	jnz LB_1244
	POP_GRM_SCC
	jmp LB_1190
LB_1244:
	POP_GRM_FAIL 
	jmp LB_1190
LB_1190:
	cmp BYTE [r8+6],0
	jnz LB_1252
	jmp LB_1253
LB_1252:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1253:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 3'(= a47◂ [ *{ }] )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1254
LB_1254
;; rsp=0 , %2075~3'(= a47◂ [ *{ }] ) %2056~1'(= r ) %2055~0'(= r ) 
; #26 3'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a47◂ [ *{ }] )
;; rsp=0 , %2076~0(<2)◂3'(= a47◂ [ *{ }] ) %2056~1'(= r ) %2055~0'(= r ) 
; ∎ 0(<2)◂3'(= a47◂ [ *{ }] )
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
; .mov_ptn2 0(<2)◂3'(= a47◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1255
LB_1255:
	cmp BYTE [r8+6],0
	jnz LB_1180
	POP_GRM_SCC
	ret
LB_1180:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1257
LB_1257
;; rsp=0 , %2078~1'(= r ) %2077~0'(= r ) 
; #308 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2079~0(<2)◂{ } %2078~1'(= r ) %2077~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2080~0(<2)◂0(<2)◂{ } %2078~1'(= r ) %2077~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1258
LB_1258:
	cmp BYTE [r8+6],0
	jnz LB_1256
	POP_GRM_SCC
	ret
LB_1256:
	POP_GRM_FAIL 
	ret
ETR_333:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_333
	ret
GRM_333:
	PUSH_GRM
	jmp LB_1261
LB_1260:
	add r14,1 
LB_1261:
	cmp r14,r9
	jge LB_1262
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1260
LB_1262
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1265
	jmp LB_1266
LB_1265:
	mov r8,unt_1
	jmp LB_1263
LB_1266:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1267
	cmp BYTE [rdi+1],91
	jnz LB_1267
	jmp LB_1268
LB_1267:
	mov r8,unt_1
	jmp LB_1263
LB_1268:
	add r14,2
	jmp LB_1264
LB_1263:
	add rsp,0
	jmp LB_1259
LB_1264:
	PUSH_GRM
	jmp LB_1272
LB_1271:
	add r14,1 
LB_1272:
	cmp r14,r9
	jge LB_1273
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1271
LB_1273
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1276
	jmp LB_1277
LB_1276:
	mov r8,unt_1
	jmp LB_1274
LB_1277:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1278
	jmp LB_1279
LB_1278:
	mov r8,unt_1
	jmp LB_1274
LB_1279:
	add r14,1
	jmp LB_1275
LB_1274:
	add rsp,0
	jmp LB_1270
LB_1275:
	jmp LB_1281
LB_1280:
	add r14,1 
LB_1281:
	cmp r14,r9
	jge LB_1282
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1280
LB_1282
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_1285
	jmp LB_1286
LB_1285:
	jmp LB_1283
LB_1286:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1284
LB_1283:
	add rsp,0
	jmp LB_1270
LB_1284:
	jmp LB_1288
LB_1287:
	add r14,1 
LB_1288:
	cmp r14,r9
	jge LB_1289
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1287
LB_1289
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_1292
	jmp LB_1293
LB_1292:
	jmp LB_1290
LB_1293:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1291
LB_1290:
	add rsp,8
	jmp LB_1270
LB_1291:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1294
LB_1294
;; rsp=2 , %2086~1'(= r ) %2085~0'(= r ) %2084~9'(= a47◂ [ *{ }] ) %2083~8'(= a47◂ [ *{ }] ) 
; #309 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ 2'(= a47◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_1217
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %2087~2'(= a47◂ [ *{ *{ }*{ }}] ) %2086~1'(= r ) %2085~0'(= r ) 
;; ? 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1297
	jmp LB_1298
LB_1297:
	jmp LB_1296
LB_1298:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %2090~4'(= *{ } ) %2089~3'(= *{ } ) %2086~1'(= r ) %2085~0'(= r ) 
; #308 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2091~0(<2)◂{ } %2090~4'(= *{ } ) %2089~3'(= *{ } ) %2086~1'(= r ) %2085~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2092~0(<2)◂0(<2)◂{ } %2090~4'(= *{ } ) %2089~3'(= *{ } ) %2086~1'(= r ) %2085~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn 4'(= *{ } )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 3'(= *{ } )
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
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1295
LB_1296:
;; ?. 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2088~3'(= a2◂ [ *{ rr{| l |}}] ) %2086~1'(= r ) %2085~0'(= r ) 
; #312 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 10010000110.. |}
	mov r13,r9
	call LB_1234
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %2093~2'(= {| l |} ) %2086~1'(= r ) %2085~0'(= r ) 
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
	jmp LB_1299
LB_1299:
;; rsp=0 , %2094~2'(= {| l |} ) %2086~1'(= r ) %2085~0'(= r ) 
	mov rdi,LB_1300
	call emt_stg 
	jmp err
LB_1295:
	cmp BYTE [r8+6],0
	jnz LB_1270
	POP_GRM_SCC
	jmp LB_1269
LB_1270:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1302
LB_1302
;; rsp=0 , %2096~1'(= r ) %2095~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2097~1(<2)◂{ } %2096~1'(= r ) %2095~0'(= r ) 
; $ %[ "blk_cmt 0" ] ⊢ %[ "blk_cmt 0" ]
;; rsp=0 , %2098~%[ "blk_cmt 0" ] %2097~1(<2)◂{ } %2096~1'(= r ) %2095~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2099~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2100~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2101~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],9
	mov BYTE [rax+8+0],98
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],107
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],99
	mov BYTE [rax+8+5],109
	mov BYTE [rax+8+6],116
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],48
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1303
LB_1303:
	cmp BYTE [r8+6],0
	jnz LB_1301
	POP_GRM_SCC
	jmp LB_1269
LB_1301:
	POP_GRM_FAIL 
	jmp LB_1269
LB_1269:
	cmp BYTE [r8+6],0
	jnz LB_1304
	jmp LB_1305
LB_1304:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1305:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 3'(= a47◂ [ *{ }] )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1306
LB_1306
;; rsp=0 , %2102~3'(= a47◂ [ *{ }] ) %2082~1'(= r ) %2081~0'(= r ) 
; #26 3'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a47◂ [ *{ }] )
;; rsp=0 , %2103~0(<2)◂3'(= a47◂ [ *{ }] ) %2082~1'(= r ) %2081~0'(= r ) 
; ∎ 0(<2)◂3'(= a47◂ [ *{ }] )
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
; .mov_ptn2 0(<2)◂3'(= a47◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1307
LB_1307:
	cmp BYTE [r8+6],0
	jnz LB_1259
	POP_GRM_SCC
	ret
LB_1259:
	RB_GRM
	jmp LB_1310
LB_1309:
	add r14,1 
LB_1310:
	cmp r14,r9
	jge LB_1311
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1309
LB_1311
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1314
	jmp LB_1315
LB_1314:
	mov r8,unt_1
	jmp LB_1312
LB_1315:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1316
	cmp BYTE [rdi+1],93
	jnz LB_1316
	jmp LB_1317
LB_1316:
	mov r8,unt_1
	jmp LB_1312
LB_1317:
	add r14,2
	jmp LB_1313
LB_1312:
	add rsp,0
	jmp LB_1308
LB_1313:
	PUSH_GRM
	jmp LB_1321
LB_1320:
	add r14,1 
LB_1321:
	cmp r14,r9
	jge LB_1322
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1320
LB_1322
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1325
	jmp LB_1326
LB_1325:
	mov r8,unt_1
	jmp LB_1323
LB_1326:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1327
	jmp LB_1328
LB_1327:
	mov r8,unt_1
	jmp LB_1323
LB_1328:
	add r14,1
	jmp LB_1324
LB_1323:
	add rsp,0
	jmp LB_1319
LB_1324:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1329
LB_1329
;; rsp=0 , %2107~1'(= r ) %2106~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2108~0(<2)◂{ } %2107~1'(= r ) %2106~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1330
LB_1330:
	cmp BYTE [r8+6],0
	jnz LB_1319
	POP_GRM_SCC
	jmp LB_1318
LB_1319:
	RB_GRM
	jmp LB_1333
LB_1332:
	add r14,1 
LB_1333:
	cmp r14,r9
	jge LB_1334
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1332
LB_1334
	cmp r14,r9
	jge LB_1337
	jmp LB_1338
LB_1337:
	mov r8,unt_1 
	jmp LB_1335
LB_1338:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1336
LB_1335:
	add rsp,0
	POP_GRM_FAIL
	jmp LB_1318
LB_1336:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1339
LB_1339
;; rsp=1 , %2111~1'(= r ) %2110~0'(= r ) %2109~8'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2112~1(<2)◂{ } %2111~1'(= r ) %2110~0'(= r ) %2109~8'(= r ) 
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
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	add rsp,8
	jmp LB_1340
LB_1340:
	cmp BYTE [r8+6],0
	jnz LB_1331
	POP_GRM_SCC
	jmp LB_1318
LB_1331:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1342
LB_1342
;; rsp=0 , %2114~1'(= r ) %2113~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2115~0(<2)◂{ } %2114~1'(= r ) %2113~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1343
LB_1343:
	cmp BYTE [r8+6],0
	jnz LB_1341
	POP_GRM_SCC
	jmp LB_1318
LB_1341:
	POP_GRM_FAIL 
	jmp LB_1318
LB_1318:
	cmp BYTE [r8+6],0
	jnz LB_1344
	jmp LB_1345
LB_1344:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1345:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1346
LB_1346
;; rsp=0 , %2116~{ } %2105~1'(= r ) %2104~0'(= r ) 
; #308 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2117~0(<2)◂{ } %2116~{ } %2105~1'(= r ) %2104~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2118~0(<2)◂0(<2)◂{ } %2116~{ } %2105~1'(= r ) %2104~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn { }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1347
LB_1347:
	cmp BYTE [r8+6],0
	jnz LB_1308
	POP_GRM_SCC
	ret
LB_1308:
	RB_GRM
	jmp LB_1350
LB_1349:
	add r14,1 
LB_1350:
	cmp r14,r9
	jge LB_1351
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1349
LB_1351
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1354
	jmp LB_1355
LB_1354:
	jmp LB_1352
LB_1355:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1353
LB_1352:
	add rsp,0
	jmp LB_1348
LB_1353:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1356
LB_1356
;; rsp=1 , %2121~1'(= r ) %2120~0'(= r ) %2119~8'(= a47◂ [ *{ }] ) 
; #26 8'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a47◂ [ *{ }] )
;; rsp=1 , %2122~0(<2)◂8'(= a47◂ [ *{ }] ) %2121~1'(= r ) %2120~0'(= r ) 
; ∎ 0(<2)◂8'(= a47◂ [ *{ }] )
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
; .mov_ptn2 0(<2)◂8'(= a47◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1357
LB_1357:
	cmp BYTE [r8+6],0
	jnz LB_1348
	POP_GRM_SCC
	ret
LB_1348:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1359
LB_1359
;; rsp=0 , %2124~1'(= r ) %2123~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2125~1(<2)◂{ } %2124~1'(= r ) %2123~0'(= r ) 
; $ %[ "blk_cmt 1" ] ⊢ %[ "blk_cmt 1" ]
;; rsp=0 , %2126~%[ "blk_cmt 1" ] %2125~1(<2)◂{ } %2124~1'(= r ) %2123~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2127~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2128~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2129~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],9
	mov BYTE [rax+8+0],98
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],107
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],99
	mov BYTE [rax+8+5],109
	mov BYTE [rax+8+6],116
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],49
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1360
LB_1360:
	cmp BYTE [r8+6],0
	jnz LB_1358
	POP_GRM_SCC
	ret
LB_1358:
	POP_GRM_FAIL 
	ret
ETR_334:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_334
	ret
GRM_334:
	PUSH_GRM
	jmp LB_1363
LB_1362:
	add r14,1 
LB_1363:
	cmp r14,r9
	jge LB_1364
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1362
LB_1364
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1367
	jmp LB_1368
LB_1367:
	mov r8,unt_1
	jmp LB_1365
LB_1368:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1369
	jmp LB_1370
LB_1369:
	mov r8,unt_1
	jmp LB_1365
LB_1370:
	add r14,1
	jmp LB_1366
LB_1365:
	add rsp,0
	jmp LB_1361
LB_1366:
	jmp LB_1372
LB_1371:
	add r14,1 
LB_1372:
	cmp r14,r9
	jge LB_1373
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1371
LB_1373
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_1376
	jmp LB_1377
LB_1376:
	jmp LB_1374
LB_1377:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1375
LB_1374:
	add rsp,0
	jmp LB_1361
LB_1375:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1378
LB_1378
;; rsp=1 , %2132~1'(= r ) %2131~0'(= r ) %2130~8'(= a47◂ [ *{ }] ) 
; #26 8'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a47◂ [ *{ }] )
;; rsp=1 , %2133~0(<2)◂8'(= a47◂ [ *{ }] ) %2132~1'(= r ) %2131~0'(= r ) 
; ∎ 0(<2)◂8'(= a47◂ [ *{ }] )
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
; .mov_ptn2 0(<2)◂8'(= a47◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1379
LB_1379:
	cmp BYTE [r8+6],0
	jnz LB_1361
	POP_GRM_SCC
	ret
LB_1361:
	RB_GRM
	jmp LB_1382
LB_1381:
	add r14,1 
LB_1382:
	cmp r14,r9
	jge LB_1383
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1381
LB_1383
	cmp r14,r9
	jge LB_1386
	jmp LB_1387
LB_1386:
	mov r8,unt_1 
	jmp LB_1384
LB_1387:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1385
LB_1384:
	add rsp,0
	jmp LB_1380
LB_1385:
	jmp LB_1389
LB_1388:
	add r14,1 
LB_1389:
	cmp r14,r9
	jge LB_1390
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1388
LB_1390
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1393
	jmp LB_1394
LB_1393:
	jmp LB_1391
LB_1394:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1392
LB_1391:
	add rsp,8
	jmp LB_1380
LB_1392:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1395
LB_1395
;; rsp=2 , %2137~1'(= r ) %2136~0'(= r ) %2135~9'(= a47◂ [ *{ }] ) %2134~8'(= r ) 
; #26 9'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂9'(= a47◂ [ *{ }] )
;; rsp=2 , %2138~0(<2)◂9'(= a47◂ [ *{ }] ) %2137~1'(= r ) %2136~0'(= r ) %2134~8'(= r ) 
; ∎ 0(<2)◂9'(= a47◂ [ *{ }] )
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
; .mov_ptn2 0(<2)◂9'(= a47◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 00100000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_1396
LB_1396:
	cmp BYTE [r8+6],0
	jnz LB_1380
	POP_GRM_SCC
	ret
LB_1380:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1398
LB_1398
;; rsp=0 , %2140~1'(= r ) %2139~0'(= r ) 
; $ %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
;; rsp=0 , %2141~%[ "line_res_c 0" ] %2140~1'(= r ) %2139~0'(= r ) 
; #10 %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_1400
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1401
LB_1401:
;; rsp=0 , %2142~%[ "line_res_c 0" ] %2140~1'(= r ) %2139~0'(= r ) 
	mov rdi,LB_1402
	call emt_stg 
	jmp err
LB_1399:
	cmp BYTE [r8+6],0
	jnz LB_1397
	POP_GRM_SCC
	ret
LB_1397:
	POP_GRM_FAIL 
	ret
ETR_335:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_335
	ret
GRM_335:
	PUSH_GRM
	jmp LB_1405
LB_1404:
	add r14,1 
LB_1405:
	cmp r14,r9
	jge LB_1406
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1404
LB_1406
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1409
	jmp LB_1410
LB_1409:
	mov r8,unt_1
	jmp LB_1407
LB_1410:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1411
	jmp LB_1412
LB_1411:
	mov r8,unt_1
	jmp LB_1407
LB_1412:
	add r14,1
	jmp LB_1408
LB_1407:
	add rsp,0
	jmp LB_1403
LB_1408:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1413
LB_1413
;; rsp=0 , %2144~1'(= r ) %2143~0'(= r ) 
; #26 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %2145~0(<2)◂{ 0'(= r ) 1'(= r ) } 
; ∎ 0(<2)◂{ 0'(= r ) 1'(= r ) }
; .mov_ptn2 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r9,r13
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	jmp LB_1414
LB_1414:
	cmp BYTE [r8+6],0
	jnz LB_1403
	POP_GRM_SCC
	ret
LB_1403:
	RB_GRM
	jmp LB_1417
LB_1416:
	add r14,1 
LB_1417:
	cmp r14,r9
	jge LB_1418
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1416
LB_1418
	cmp r14,r9
	jge LB_1421
	jmp LB_1422
LB_1421:
	mov r8,unt_1 
	jmp LB_1419
LB_1422:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1420
LB_1419:
	add rsp,0
	jmp LB_1415
LB_1420:
	jmp LB_1424
LB_1423:
	add r14,1 
LB_1424:
	cmp r14,r9
	jge LB_1425
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1423
LB_1425
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1428
	jmp LB_1429
LB_1428:
	jmp LB_1426
LB_1429:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 9'(= r ) 10'(= r ) }
; {| 111100001110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_1427
LB_1426:
	add rsp,8
	jmp LB_1415
LB_1427:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1430
LB_1430
;; rsp=3 , %2150~1'(= r ) %2149~0'(= r ) %2148~10'(= r ) %2147~9'(= r ) %2146~8'(= r ) 
; #26 { 0'(= r ) 10'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 10'(= r ) }
;; rsp=3 , %2151~0(<2)◂{ 0'(= r ) 10'(= r ) } %2150~1'(= r ) %2147~9'(= r ) %2146~8'(= r ) 
; ∎ 0(<2)◂{ 0'(= r ) 10'(= r ) }
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 9'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ 0'(= r ) 10'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; {| 101000000010.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,24
	jmp LB_1431
LB_1431:
	cmp BYTE [r8+6],0
	jnz LB_1415
	POP_GRM_SCC
	ret
LB_1415:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1433
LB_1433
;; rsp=0 , %2153~1'(= r ) %2152~0'(= r ) 
; #26 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %2154~0(<2)◂{ 0'(= r ) 1'(= r ) } 
; ∎ 0(<2)◂{ 0'(= r ) 1'(= r ) }
; .mov_ptn2 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r9,r13
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	jmp LB_1434
LB_1434:
	cmp BYTE [r8+6],0
	jnz LB_1432
	POP_GRM_SCC
	ret
LB_1432:
	POP_GRM_FAIL 
	ret
ETR_336:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_336
	ret
GRM_336:
	PUSH_GRM
	jmp LB_1437
LB_1436:
	add r14,1 
LB_1437:
	cmp r14,r9
	jge LB_1438
	JZ_SPC BYTE [r13+8+r14], LB_1436
LB_1438
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_1441
	jmp LB_1442
LB_1441:
	mov r8,unt_1
	jmp LB_1439
LB_1442:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1443
	cmp BYTE [rdi+1],167
	jnz LB_1443
	cmp BYTE [rdi+2],194
	jnz LB_1443
	cmp BYTE [rdi+3],167
	jnz LB_1443
	cmp BYTE [rdi+4],43
	jnz LB_1443
	cmp BYTE [rdi+5],115
	jnz LB_1443
	cmp BYTE [rdi+6],56
	jnz LB_1443
	jmp LB_1444
LB_1443:
	mov r8,unt_1
	jmp LB_1439
LB_1444:
	add r14,7
	jmp LB_1440
LB_1439:
	add rsp,0
	jmp LB_1435
LB_1440:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1445
LB_1445
;; rsp=0 , %2156~1'(= r ) %2155~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2157~0(<2)◂{ } %2156~1'(= r ) %2155~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1446
LB_1446:
	cmp BYTE [r8+6],0
	jnz LB_1435
	POP_GRM_SCC
	ret
LB_1435:
	RB_GRM
	jmp LB_1449
LB_1448:
	add r14,1 
LB_1449:
	cmp r14,r9
	jge LB_1450
	JZ_SPC BYTE [r13+8+r14], LB_1448
LB_1450
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1453
	jmp LB_1454
LB_1453:
	mov r8,unt_1
	jmp LB_1451
LB_1454:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1455
	cmp BYTE [rdi+1],167
	jnz LB_1455
	cmp BYTE [rdi+2],194
	jnz LB_1455
	cmp BYTE [rdi+3],167
	jnz LB_1455
	jmp LB_1456
LB_1455:
	mov r8,unt_1
	jmp LB_1451
LB_1456:
	add r14,4
	jmp LB_1452
LB_1451:
	add rsp,0
	jmp LB_1447
LB_1452:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1457
LB_1457
;; rsp=0 , %2159~1'(= r ) %2158~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2160~0(<2)◂{ } %2159~1'(= r ) %2158~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1458
LB_1458:
	cmp BYTE [r8+6],0
	jnz LB_1447
	POP_GRM_SCC
	ret
LB_1447:
	RB_GRM
	jmp LB_1461
LB_1460:
	add r14,1 
LB_1461:
	cmp r14,r9
	jge LB_1462
	JZ_SPC BYTE [r13+8+r14], LB_1460
LB_1462
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1465
	jmp LB_1466
LB_1465:
	mov r8,unt_1
	jmp LB_1463
LB_1466:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1467
	cmp BYTE [rdi+1],167
	jnz LB_1467
	jmp LB_1468
LB_1467:
	mov r8,unt_1
	jmp LB_1463
LB_1468:
	add r14,2
	jmp LB_1464
LB_1463:
	add rsp,0
	jmp LB_1459
LB_1464:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1469
LB_1469
;; rsp=0 , %2162~1'(= r ) %2161~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2163~0(<2)◂{ } %2162~1'(= r ) %2161~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1470
LB_1470:
	cmp BYTE [r8+6],0
	jnz LB_1459
	POP_GRM_SCC
	ret
LB_1459:
	RB_GRM
	jmp LB_1473
LB_1472:
	add r14,1 
LB_1473:
	cmp r14,r9
	jge LB_1474
	JZ_SPC BYTE [r13+8+r14], LB_1472
LB_1474
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1477
	jmp LB_1478
LB_1477:
	mov r8,unt_1
	jmp LB_1475
LB_1478:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1479
	cmp BYTE [rdi+1],182
	jnz LB_1479
	jmp LB_1480
LB_1479:
	mov r8,unt_1
	jmp LB_1475
LB_1480:
	add r14,2
	jmp LB_1476
LB_1475:
	add rsp,0
	jmp LB_1471
LB_1476:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1481
LB_1481
;; rsp=0 , %2165~1'(= r ) %2164~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2166~0(<2)◂{ } %2165~1'(= r ) %2164~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1482
LB_1482:
	cmp BYTE [r8+6],0
	jnz LB_1471
	POP_GRM_SCC
	ret
LB_1471:
	RB_GRM
	jmp LB_1485
LB_1484:
	add r14,1 
LB_1485:
	cmp r14,r9
	jge LB_1486
	JZ_SPC BYTE [r13+8+r14], LB_1484
LB_1486
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_1489
	jmp LB_1490
LB_1489:
	mov r8,unt_1
	jmp LB_1487
LB_1490:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1491
	cmp BYTE [rdi+1],136
	jnz LB_1491
	cmp BYTE [rdi+2],142
	jnz LB_1491
	cmp BYTE [rdi+3],226
	jnz LB_1491
	cmp BYTE [rdi+4],136
	jnz LB_1491
	cmp BYTE [rdi+5],142
	jnz LB_1491
	jmp LB_1492
LB_1491:
	mov r8,unt_1
	jmp LB_1487
LB_1492:
	add r14,6
	jmp LB_1488
LB_1487:
	add rsp,0
	jmp LB_1483
LB_1488:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1493
LB_1493
;; rsp=0 , %2168~1'(= r ) %2167~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2169~0(<2)◂{ } %2168~1'(= r ) %2167~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1494
LB_1494:
	cmp BYTE [r8+6],0
	jnz LB_1483
	POP_GRM_SCC
	ret
LB_1483:
	POP_GRM_FAIL 
	ret
ETR_337:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_337
	ret
GRM_337:
	PUSH_GRM
	jmp LB_1497
LB_1496:
	add r14,1 
LB_1497:
	cmp r14,r9
	jge LB_1498
	JZ_SPC BYTE [r13+8+r14], LB_1496
LB_1498
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1501
	jmp LB_1502
LB_1501:
	jmp LB_1499
LB_1502:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_1500
LB_1499:
	add rsp,0
	jmp LB_1495
LB_1500:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1503
LB_1503
;; rsp=0 , %2172~1'(= r ) %2171~0'(= r ) %2170~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2173~1(<2)◂{ } %2172~1'(= r ) %2171~0'(= r ) %2170~{ } 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_1504
LB_1504:
	cmp BYTE [r8+6],0
	jnz LB_1495
	POP_GRM_SCC
	ret
LB_1495:
	RB_GRM
	jmp LB_1507
LB_1506:
	add r14,1 
LB_1507:
	cmp r14,r9
	jge LB_1508
	JZ_SPC BYTE [r13+8+r14], LB_1506
LB_1508
	cmp r14,r9
	jge LB_1511
	jmp LB_1512
LB_1511:
	mov r8,unt_1 
	jmp LB_1509
LB_1512:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1510
LB_1509:
	add rsp,0
	jmp LB_1505
LB_1510:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1513
LB_1513
;; rsp=1 , %2176~1'(= r ) %2175~0'(= r ) %2174~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2177~0(<2)◂{ } %2176~1'(= r ) %2175~0'(= r ) %2174~8'(= r ) 
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
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	add rsp,8
	jmp LB_1514
LB_1514:
	cmp BYTE [r8+6],0
	jnz LB_1505
	POP_GRM_SCC
	ret
LB_1505:
	POP_GRM_FAIL 
	ret
ETR_338:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_338
	ret
GRM_338:
	PUSH_GRM
	jmp LB_1517
LB_1516:
	add r14,1 
LB_1517:
	cmp r14,r9
	jge LB_1518
	JZ_SPC BYTE [r13+8+r14], LB_1516
LB_1518
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1521
	jmp LB_1522
LB_1521:
	mov r8,unt_1
	jmp LB_1519
LB_1522:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1523
	jmp LB_1524
LB_1523:
	mov r8,unt_1
	jmp LB_1519
LB_1524:
	add r14,1
	jmp LB_1520
LB_1519:
	add rsp,0
	jmp LB_1515
LB_1520:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1525
LB_1525
;; rsp=0 , %2180~1'(= r ) %2179~0'(= r ) %2178~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2181~1(<2)◂{ } %2180~1'(= r ) %2179~0'(= r ) %2178~{ } 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_1526
LB_1526:
	cmp BYTE [r8+6],0
	jnz LB_1515
	POP_GRM_SCC
	ret
LB_1515:
	RB_GRM
	jmp LB_1529
LB_1528:
	add r14,1 
LB_1529:
	cmp r14,r9
	jge LB_1530
	JZ_SPC BYTE [r13+8+r14], LB_1528
LB_1530
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1533
	jmp LB_1534
LB_1533:
	jmp LB_1531
LB_1534:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_1532
LB_1531:
	add rsp,0
	jmp LB_1527
LB_1532:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1535
LB_1535
;; rsp=0 , %2184~1'(= r ) %2183~0'(= r ) %2182~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2185~1(<2)◂{ } %2184~1'(= r ) %2183~0'(= r ) %2182~{ } 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_1536
LB_1536:
	cmp BYTE [r8+6],0
	jnz LB_1527
	POP_GRM_SCC
	ret
LB_1527:
	RB_GRM
	jmp LB_1539
LB_1538:
	add r14,1 
LB_1539:
	cmp r14,r9
	jge LB_1540
	JZ_SPC BYTE [r13+8+r14], LB_1538
LB_1540
	cmp r14,r9
	jge LB_1543
	jmp LB_1544
LB_1543:
	mov r8,unt_1 
	jmp LB_1541
LB_1544:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1542
LB_1541:
	add rsp,0
	jmp LB_1537
LB_1542:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1545
LB_1545
;; rsp=1 , %2188~1'(= r ) %2187~0'(= r ) %2186~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2189~0(<2)◂{ } %2188~1'(= r ) %2187~0'(= r ) %2186~8'(= r ) 
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
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	add rsp,8
	jmp LB_1546
LB_1546:
	cmp BYTE [r8+6],0
	jnz LB_1537
	POP_GRM_SCC
	ret
LB_1537:
	POP_GRM_FAIL 
	ret
ETR_339:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_339
	ret
GRM_339:
	PUSH_GRM
	jmp LB_1549
LB_1548:
	add r14,1 
LB_1549:
	cmp r14,r9
	jge LB_1550
	JZ_SPC BYTE [r13+8+r14], LB_1548
LB_1550
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_1553
	jmp LB_1554
LB_1553:
	jmp LB_1551
LB_1554:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_1552
LB_1551:
	add rsp,0
	jmp LB_1547
LB_1552:
	jmp LB_1556
LB_1555:
	add r14,1 
LB_1556:
	cmp r14,r9
	jge LB_1557
	JZ_SPC BYTE [r13+8+r14], LB_1555
LB_1557
	call GRM_339
	cmp BYTE [r8+6],0
	jnz LB_1560
	jmp LB_1561
LB_1560:
	jmp LB_1558
LB_1561:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_1559
LB_1558:
	add rsp,0
	jmp LB_1547
LB_1559:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1562
LB_1562
;; rsp=0 , %2193~1'(= r ) %2192~0'(= r ) %2191~{ } %2190~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2194~0(<2)◂{ } %2193~1'(= r ) %2192~0'(= r ) %2191~{ } %2190~{ } 
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
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1563
LB_1563:
	cmp BYTE [r8+6],0
	jnz LB_1547
	POP_GRM_SCC
	ret
LB_1547:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1565
LB_1565
;; rsp=0 , %2196~1'(= r ) %2195~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2197~0(<2)◂{ } %2196~1'(= r ) %2195~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1566
LB_1566:
	cmp BYTE [r8+6],0
	jnz LB_1564
	POP_GRM_SCC
	ret
LB_1564:
	POP_GRM_FAIL 
	ret
ETR_340:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_340
	ret
GRM_340:
	PUSH_GRM
	jmp LB_1569
LB_1568:
	add r14,1 
LB_1569:
	cmp r14,r9
	jge LB_1570
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1568
LB_1570
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1573
	jmp LB_1574
LB_1573:
	mov r8,unt_1
	jmp LB_1571
LB_1574:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1575
	jmp LB_1576
LB_1575:
	mov r8,unt_1
	jmp LB_1571
LB_1576:
	add r14,1
	jmp LB_1572
LB_1571:
	add rsp,0
	jmp LB_1567
LB_1572:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1577
LB_1577
;; rsp=0 , %2200~1'(= r ) %2199~0'(= r ) %2198~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2201~0(<2)◂{ } %2200~1'(= r ) %2199~0'(= r ) %2198~{ } 
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
	jmp LB_1578
LB_1578:
	cmp BYTE [r8+6],0
	jnz LB_1567
	POP_GRM_SCC
	ret
LB_1567:
	RB_GRM
	jmp LB_1581
LB_1580:
	add r14,1 
LB_1581:
	cmp r14,r9
	jge LB_1582
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1580
LB_1582
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1585
	jmp LB_1586
LB_1585:
	jmp LB_1583
LB_1586:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_1584
LB_1583:
	add rsp,0
	jmp LB_1579
LB_1584:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1587
LB_1587
;; rsp=0 , %2204~1'(= r ) %2203~0'(= r ) %2202~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2205~1(<2)◂{ } %2204~1'(= r ) %2203~0'(= r ) %2202~{ } 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_1588
LB_1588:
	cmp BYTE [r8+6],0
	jnz LB_1579
	POP_GRM_SCC
	ret
LB_1579:
	RB_GRM
	jmp LB_1591
LB_1590:
	add r14,1 
LB_1591:
	cmp r14,r9
	jge LB_1592
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1590
LB_1592
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1595
	jmp LB_1596
LB_1595:
	mov r8,unt_1
	jmp LB_1593
LB_1596:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1597
	jmp LB_1598
LB_1597:
	mov r8,unt_1
	jmp LB_1593
LB_1598:
	add r14,1
	jmp LB_1594
LB_1593:
	add rsp,0
	jmp LB_1589
LB_1594:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1599
LB_1599
;; rsp=0 , %2208~1'(= r ) %2207~0'(= r ) %2206~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2209~1(<2)◂{ } %2208~1'(= r ) %2207~0'(= r ) %2206~{ } 
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_1600
LB_1600:
	cmp BYTE [r8+6],0
	jnz LB_1589
	POP_GRM_SCC
	ret
LB_1589:
	RB_GRM
	jmp LB_1603
LB_1602:
	add r14,1 
LB_1603:
	cmp r14,r9
	jge LB_1604
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1602
LB_1604
	cmp r14,r9
	jge LB_1607
	jmp LB_1608
LB_1607:
	mov r8,unt_1 
	jmp LB_1605
LB_1608:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1606
LB_1605:
	add rsp,0
	jmp LB_1601
LB_1606:
	jmp LB_1610
LB_1609:
	add r14,1 
LB_1610:
	cmp r14,r9
	jge LB_1611
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1609
LB_1611
	call GRM_340
	cmp BYTE [r8+6],0
	jnz LB_1614
	jmp LB_1615
LB_1614:
	jmp LB_1612
LB_1615:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1111000010.. |}
	jmp LB_1613
LB_1612:
	add rsp,8
	jmp LB_1601
LB_1613:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1616
LB_1616
;; rsp=1 , %2213~1'(= r ) %2212~0'(= r ) %2211~{ } %2210~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2214~0(<2)◂{ } %2213~1'(= r ) %2212~0'(= r ) %2211~{ } %2210~8'(= r ) 
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
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	add rsp,8
	jmp LB_1617
LB_1617:
	cmp BYTE [r8+6],0
	jnz LB_1601
	POP_GRM_SCC
	ret
LB_1601:
	RB_GRM
	jmp LB_1620
LB_1619:
	add r14,1 
LB_1620:
	cmp r14,r9
	jge LB_1621
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1619
LB_1621
	cmp r14,r9
	jge LB_1624
	jmp LB_1625
LB_1624:
	mov r8,unt_1 
	jmp LB_1622
LB_1625:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1623
LB_1622:
	add rsp,0
	jmp LB_1618
LB_1623:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1626
LB_1626
;; rsp=1 , %2217~1'(= r ) %2216~0'(= r ) %2215~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2218~0(<2)◂{ } %2217~1'(= r ) %2216~0'(= r ) %2215~8'(= r ) 
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
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	add rsp,8
	jmp LB_1627
LB_1627:
	cmp BYTE [r8+6],0
	jnz LB_1618
	POP_GRM_SCC
	ret
LB_1618:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1629
LB_1629
;; rsp=0 , %2220~1'(= r ) %2219~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2221~0(<2)◂{ } %2220~1'(= r ) %2219~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1630
LB_1630:
	cmp BYTE [r8+6],0
	jnz LB_1628
	POP_GRM_SCC
	ret
LB_1628:
	POP_GRM_FAIL 
	ret
ETR_341:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_341
	ret
GRM_341:
	PUSH_GRM
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1634
	jmp LB_1635
LB_1634:
	mov r8,unt_1
	jmp LB_1632
LB_1635:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1636
	cmp BYTE [rdi+1],167
	jnz LB_1636
	cmp BYTE [rdi+2],126
	jnz LB_1636
	jmp LB_1637
LB_1636:
	mov r8,unt_1
	jmp LB_1632
LB_1637:
	add r14,3
	jmp LB_1633
LB_1632:
	add rsp,0
	jmp LB_1631
LB_1633:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1638
LB_1638
;; rsp=0 , %2223~1'(= r ) %2222~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2224~0(<2)◂{ } %2223~1'(= r ) %2222~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1639
LB_1639:
	cmp BYTE [r8+6],0
	jnz LB_1631
	POP_GRM_SCC
	ret
LB_1631:
	RB_GRM
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1643
	jmp LB_1644
LB_1643:
	mov r8,unt_1
	jmp LB_1641
LB_1644:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1645
	cmp BYTE [rdi+1],167
	jnz LB_1645
	cmp BYTE [rdi+2],37
	jnz LB_1645
	jmp LB_1646
LB_1645:
	mov r8,unt_1
	jmp LB_1641
LB_1646:
	add r14,3
	jmp LB_1642
LB_1641:
	add rsp,0
	jmp LB_1640
LB_1642:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1647
LB_1647
;; rsp=0 , %2226~1'(= r ) %2225~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2227~0(<2)◂{ } %2226~1'(= r ) %2225~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_1648
LB_1648:
	cmp BYTE [r8+6],0
	jnz LB_1640
	POP_GRM_SCC
	ret
LB_1640:
	POP_GRM_FAIL 
	ret
ETR_342:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_342
	ret
GRM_342:
	PUSH_GRM
	jmp LB_1651
LB_1650:
	add r14,1 
LB_1651:
	cmp r14,r9
	jge LB_1652
	JZ_SPC BYTE [r13+8+r14], LB_1650
LB_1652
	call GRM_343
	cmp BYTE [r8+6],0
	jnz LB_1655
	jmp LB_1656
LB_1655:
	jmp LB_1653
LB_1656:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1654
LB_1653:
	add rsp,0
	jmp LB_1649
LB_1654:
	jmp LB_1658
LB_1657:
	add r14,1 
LB_1658:
	cmp r14,r9
	jge LB_1659
	JZ_SPC BYTE [r13+8+r14], LB_1657
LB_1659
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1662
	jmp LB_1663
LB_1662:
	mov r8,unt_1
	jmp LB_1660
LB_1663:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],42
	jnz LB_1664
	jmp LB_1665
LB_1664:
	mov r8,unt_1
	jmp LB_1660
LB_1665:
	add r14,1
	jmp LB_1661
LB_1660:
	add rsp,8
	jmp LB_1649
LB_1661:
	jmp LB_1667
LB_1666:
	add r14,1 
LB_1667:
	cmp r14,r9
	jge LB_1668
	JZ_SPC BYTE [r13+8+r14], LB_1666
LB_1668
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_1671
	jmp LB_1672
LB_1671:
	jmp LB_1669
LB_1672:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1670
LB_1669:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_1670:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1673
LB_1673
;; rsp=2 , %2231~1'(= r ) %2230~0'(= r ) %2229~9'(= {| l |} ) %2228~8'(= r ) 
; #181 9'(= {| l |} ) ⊢ 4(<7)◂9'(= {| l |} )
;; rsp=2 , %2232~4(<7)◂9'(= {| l |} ) %2231~1'(= r ) %2230~0'(= r ) %2228~8'(= r ) 
; #194 { 8'(= r ) 4(<7)◂9'(= {| l |} ) } ⊢ 2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) }
;; rsp=2 , %2233~2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } %2231~1'(= r ) %2230~0'(= r ) 
; #26 2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } ⊢ 0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) }
;; rsp=2 , %2234~0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } %2231~1'(= r ) %2230~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) }
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
; .mov_ptn2 0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } ⊢ 2'(= a3◂ [ a23◂ [ a18◂ [ ]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov BYTE [r13+6],4
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_1674
LB_1674:
	cmp BYTE [r8+6],0
	jnz LB_1649
	POP_GRM_SCC
	ret
LB_1649:
	RB_GRM
	jmp LB_1677
LB_1676:
	add r14,1 
LB_1677:
	cmp r14,r9
	jge LB_1678
	JZ_SPC BYTE [r13+8+r14], LB_1676
LB_1678
	call GRM_345
	cmp BYTE [r8+6],0
	jnz LB_1681
	jmp LB_1682
LB_1681:
	jmp LB_1679
LB_1682:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1680
LB_1679:
	add rsp,0
	jmp LB_1675
LB_1680:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1683
LB_1683
;; rsp=1 , %2237~1'(= r ) %2236~0'(= r ) %2235~8'(= {| l |} ) 
; #181 8'(= {| l |} ) ⊢ 4(<7)◂8'(= {| l |} )
;; rsp=1 , %2238~4(<7)◂8'(= {| l |} ) %2237~1'(= r ) %2236~0'(= r ) 
; #196 4(<7)◂8'(= {| l |} ) ⊢ 0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2239~0(<3)◂4(<7)◂8'(= {| l |} ) %2237~1'(= r ) %2236~0'(= r ) 
; #26 0(<3)◂4(<7)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2240~0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} ) %2237~1'(= r ) %2236~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a23◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],4
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1684
LB_1684:
	cmp BYTE [r8+6],0
	jnz LB_1675
	POP_GRM_SCC
	ret
LB_1675:
	RB_GRM
	jmp LB_1687
LB_1686:
	add r14,1 
LB_1687:
	cmp r14,r9
	jge LB_1688
	JZ_SPC BYTE [r13+8+r14], LB_1686
LB_1688
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_1691
	jmp LB_1692
LB_1691:
	jmp LB_1689
LB_1692:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1690
LB_1689:
	add rsp,0
	jmp LB_1685
LB_1690:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1693
LB_1693
;; rsp=1 , %2243~1'(= r ) %2242~0'(= r ) %2241~8'(= {| l |} ) 
; #181 8'(= {| l |} ) ⊢ 4(<7)◂8'(= {| l |} )
;; rsp=1 , %2244~4(<7)◂8'(= {| l |} ) %2243~1'(= r ) %2242~0'(= r ) 
; #196 4(<7)◂8'(= {| l |} ) ⊢ 0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2245~0(<3)◂4(<7)◂8'(= {| l |} ) %2243~1'(= r ) %2242~0'(= r ) 
; #26 0(<3)◂4(<7)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2246~0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} ) %2243~1'(= r ) %2242~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a23◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],4
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1694
LB_1694:
	cmp BYTE [r8+6],0
	jnz LB_1685
	POP_GRM_SCC
	ret
LB_1685:
	RB_GRM
	jmp LB_1697
LB_1696:
	add r14,1 
LB_1697:
	cmp r14,r9
	jge LB_1698
	JZ_SPC BYTE [r13+8+r14], LB_1696
LB_1698
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_1701
	jmp LB_1702
LB_1701:
	jmp LB_1699
LB_1702:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1700
LB_1699:
	add rsp,0
	jmp LB_1695
LB_1700:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1703
LB_1703
;; rsp=1 , %2249~1'(= r ) %2248~0'(= r ) %2247~8'(= a18◂ [ ] ) 
; #180 8'(= a18◂ [ ] ) ⊢ 5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2250~5(<7)◂8'(= a18◂ [ ] ) %2249~1'(= r ) %2248~0'(= r ) 
; #196 5(<7)◂8'(= a18◂ [ ] ) ⊢ 0(<3)◂5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2251~0(<3)◂5(<7)◂8'(= a18◂ [ ] ) %2249~1'(= r ) %2248~0'(= r ) 
; #26 0(<3)◂5(<7)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2252~0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] ) %2249~1'(= r ) %2248~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] )
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
; .mov_ptn2 0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],5
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1704
LB_1704:
	cmp BYTE [r8+6],0
	jnz LB_1695
	POP_GRM_SCC
	ret
LB_1695:
	RB_GRM
	jmp LB_1707
LB_1706:
	add r14,1 
LB_1707:
	cmp r14,r9
	jge LB_1708
	JZ_SPC BYTE [r13+8+r14], LB_1706
LB_1708
	call GRM_344
	cmp BYTE [r8+6],0
	jnz LB_1711
	jmp LB_1712
LB_1711:
	jmp LB_1709
LB_1712:
	sub rsp,16
; .mov_ptn2 2'(= *{ a22◂ [ ]r} ) ⊢ { 8'(= a22◂ [ ] ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_1710
LB_1709:
	add rsp,0
	jmp LB_1705
LB_1710:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1713
LB_1713
;; rsp=2 , %2255~1'(= r ) %2254~0'(= r ) %2253~{ 8'(= a22◂ [ ] ) 9'(= r ) } 
; #195 { 8'(= a22◂ [ ] ) 9'(= r ) } ⊢ 1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) }
;; rsp=2 , %2256~1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } %2255~1'(= r ) %2254~0'(= r ) 
; #26 1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) }
;; rsp=2 , %2257~0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } %2255~1'(= r ) %2254~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) }
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
; .mov_ptn2 0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } ⊢ 2'(= a3◂ [ a23◂ [ a18◂ [ ]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_1714
LB_1714:
	cmp BYTE [r8+6],0
	jnz LB_1705
	POP_GRM_SCC
	ret
LB_1705:
	POP_GRM_FAIL 
	ret
ETR_343:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_343
	ret
GRM_343:
	PUSH_GRM
	cmp r14,r9
	jge LB_1718
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1718
	add r14,rsi
	push rdi
	jmp LB_1719
LB_1718:
	mov r8,unt_1
	jmp LB_1716
LB_1719:
	jmp LB_1717
LB_1716:
	add rsp,0
	jmp LB_1715
LB_1717:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1722
	jmp LB_1723
LB_1722:
	mov r8,unt_1
	jmp LB_1720
LB_1723:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1724
	jmp LB_1725
LB_1724:
	mov r8,unt_1
	jmp LB_1720
LB_1725:
	add r14,1
	jmp LB_1721
LB_1720:
	add rsp,8
	jmp LB_1715
LB_1721:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1726
LB_1726
;; rsp=1 , %2260~1'(= r ) %2259~0'(= r ) %2258~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %2261~0(<2)◂8'(= r ) %2260~1'(= r ) %2259~0'(= r ) 
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
	jmp LB_1727
LB_1727:
	cmp BYTE [r8+6],0
	jnz LB_1715
	POP_GRM_SCC
	ret
LB_1715:
	POP_GRM_FAIL 
	ret
ETR_344:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_344
	ret
GRM_344:
	PUSH_GRM
	cmp r14,r9
	jge LB_1731
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1731
	add r14,rsi
	push rdi
	jmp LB_1732
LB_1731:
	mov r8,unt_1
	jmp LB_1729
LB_1732:
	jmp LB_1730
LB_1729:
	add rsp,0
	jmp LB_1728
LB_1730:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1735
	jmp LB_1736
LB_1735:
	mov r8,unt_1
	jmp LB_1733
LB_1736:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],100
	jnz LB_1737
	cmp BYTE [rdi+1],39
	jnz LB_1737
	jmp LB_1738
LB_1737:
	mov r8,unt_1
	jmp LB_1733
LB_1738:
	add r14,2
	jmp LB_1734
LB_1733:
	add rsp,8
	jmp LB_1728
LB_1734:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1739
LB_1739
;; rsp=1 , %2264~1'(= r ) %2263~0'(= r ) %2262~8'(= r ) 
; #199 { } ⊢ 1(<4)◂{ }
;; rsp=1 , %2265~1(<4)◂{ } %2264~1'(= r ) %2263~0'(= r ) %2262~8'(= r ) 
; #26 { 1(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2266~0(<2)◂{ 1(<4)◂{ } 8'(= r ) } %2264~1'(= r ) %2263~0'(= r ) 
; ∎ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
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
; .mov_ptn2 0(<2)◂{ 1(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a22◂ [ ]r}] )
; {| 0010000010.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,unt_1
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,8
	jmp LB_1740
LB_1740:
	cmp BYTE [r8+6],0
	jnz LB_1728
	POP_GRM_SCC
	ret
LB_1728:
	RB_GRM
	cmp r14,r9
	jge LB_1744
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1744
	add r14,rsi
	push rdi
	jmp LB_1745
LB_1744:
	mov r8,unt_1
	jmp LB_1742
LB_1745:
	jmp LB_1743
LB_1742:
	add rsp,0
	jmp LB_1741
LB_1743:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1748
	jmp LB_1749
LB_1748:
	mov r8,unt_1
	jmp LB_1746
LB_1749:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_1750
	cmp BYTE [rdi+1],39
	jnz LB_1750
	jmp LB_1751
LB_1750:
	mov r8,unt_1
	jmp LB_1746
LB_1751:
	add r14,2
	jmp LB_1747
LB_1746:
	add rsp,8
	jmp LB_1741
LB_1747:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1752
LB_1752
;; rsp=1 , %2269~1'(= r ) %2268~0'(= r ) %2267~8'(= r ) 
; #198 { } ⊢ 2(<4)◂{ }
;; rsp=1 , %2270~2(<4)◂{ } %2269~1'(= r ) %2268~0'(= r ) %2267~8'(= r ) 
; #26 { 2(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2271~0(<2)◂{ 2(<4)◂{ } 8'(= r ) } %2269~1'(= r ) %2268~0'(= r ) 
; ∎ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
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
; .mov_ptn2 0(<2)◂{ 2(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a22◂ [ ]r}] )
; {| 0010000010.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,unt_2
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,8
	jmp LB_1753
LB_1753:
	cmp BYTE [r8+6],0
	jnz LB_1741
	POP_GRM_SCC
	ret
LB_1741:
	RB_GRM
	cmp r14,r9
	jge LB_1757
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1757
	add r14,rsi
	push rdi
	jmp LB_1758
LB_1757:
	mov r8,unt_1
	jmp LB_1755
LB_1758:
	jmp LB_1756
LB_1755:
	add rsp,0
	jmp LB_1754
LB_1756:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1761
	jmp LB_1762
LB_1761:
	mov r8,unt_1
	jmp LB_1759
LB_1762:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1763
	jmp LB_1764
LB_1763:
	mov r8,unt_1
	jmp LB_1759
LB_1764:
	add r14,1
	jmp LB_1760
LB_1759:
	add rsp,8
	jmp LB_1754
LB_1760:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1765
LB_1765
;; rsp=1 , %2274~1'(= r ) %2273~0'(= r ) %2272~8'(= r ) 
; #200 { } ⊢ 0(<4)◂{ }
;; rsp=1 , %2275~0(<4)◂{ } %2274~1'(= r ) %2273~0'(= r ) %2272~8'(= r ) 
; #26 { 0(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2276~0(<2)◂{ 0(<4)◂{ } 8'(= r ) } %2274~1'(= r ) %2273~0'(= r ) 
; ∎ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
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
; .mov_ptn2 0(<2)◂{ 0(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a22◂ [ ]r}] )
; {| 0010000010.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,unt_0
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,8
	jmp LB_1766
LB_1766:
	cmp BYTE [r8+6],0
	jnz LB_1754
	POP_GRM_SCC
	ret
LB_1754:
	POP_GRM_FAIL 
	ret
ETR_345:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_345
	ret
GRM_345:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1770
	jmp LB_1771
LB_1770:
	mov r8,unt_1
	jmp LB_1768
LB_1771:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],96
	jnz LB_1772
	jmp LB_1773
LB_1772:
	mov r8,unt_1
	jmp LB_1768
LB_1773:
	add r14,1
	jmp LB_1769
LB_1768:
	add rsp,0
	jmp LB_1767
LB_1769:
	call GRM_346
	cmp BYTE [r8+6],0
	jnz LB_1776
	jmp LB_1777
LB_1776:
	jmp LB_1774
LB_1777:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1775
LB_1774:
	add rsp,0
	jmp LB_1767
LB_1775:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1778
LB_1778
;; rsp=1 , %2279~1'(= r ) %2278~0'(= r ) %2277~8'(= a14◂ [ ] ) 
; #74 8'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 8'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 100000001110.. |}
	mov r13,QWORD [rsp-8+8*3]
	call LB_94
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %2281~2'(= {| l |} ) %2280~3'(= a14◂ [ ] ) %2279~1'(= r ) %2278~0'(= r ) 
; #26 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %2282~0(<2)◂2'(= {| l |} ) %2280~3'(= a14◂ [ ] ) %2279~1'(= r ) %2278~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_105
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
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	mov BYTE [r8+6],0
	jmp LB_1779
LB_1779:
	cmp BYTE [r8+6],0
	jnz LB_1767
	POP_GRM_SCC
	ret
LB_1767:
	POP_GRM_FAIL 
	ret
ETR_346:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_346
	ret
GRM_346:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1783
	jmp LB_1784
LB_1783:
	mov r8,unt_1
	jmp LB_1781
LB_1784:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1785
	jmp LB_1786
LB_1785:
	mov r8,unt_1
	jmp LB_1781
LB_1786:
	add r14,1
	jmp LB_1782
LB_1781:
	add rsp,0
	jmp LB_1780
LB_1782:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1787
LB_1787
;; rsp=0 , %2284~1'(= r ) %2283~0'(= r ) 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %2285~%[ 10r ] %2284~1'(= r ) %2283~0'(= r ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %2286~2(<4)◂{ } %2285~%[ 10r ] %2284~1'(= r ) %2283~0'(= r ) 
; #71 { %[ 10r ] 2(<4)◂{ } } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ 10r ] 2(<4)◂{ } } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 11000000110.. |}
	mov r14,unt_2
	mov r13,10
	call LB_77
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %2287~2'(= a14◂ [ ] ) %2284~1'(= r ) %2283~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %2288~0(<2)◂2'(= a14◂ [ ] ) %2284~1'(= r ) %2283~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1788
LB_1788:
	cmp BYTE [r8+6],0
	jnz LB_1780
	POP_GRM_SCC
	ret
LB_1780:
	RB_GRM
	cmp r14,r9
	jge LB_1792
	jmp LB_1793
LB_1792:
	mov r8,unt_1 
	jmp LB_1790
LB_1793:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1791
LB_1790:
	add rsp,0
	jmp LB_1789
LB_1791:
	call GRM_346
	cmp BYTE [r8+6],0
	jnz LB_1796
	jmp LB_1797
LB_1796:
	jmp LB_1794
LB_1797:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1795
LB_1794:
	add rsp,8
	jmp LB_1789
LB_1795:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1798
LB_1798
;; rsp=2 , %2292~1'(= r ) %2291~0'(= r ) %2290~9'(= a14◂ [ ] ) %2289~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_77
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %2293~2'(= a14◂ [ ] ) %2292~1'(= r ) %2291~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %2294~0(<2)◂2'(= a14◂ [ ] ) %2292~1'(= r ) %2291~0'(= r ) 
; ∎ 0(<2)◂2'(= a14◂ [ ] )
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
; .mov_ptn2 0(<2)◂2'(= a14◂ [ ] ) ⊢ 2'(= a3◂ [ a14◂ [ ]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1799
LB_1799:
	cmp BYTE [r8+6],0
	jnz LB_1789
	POP_GRM_SCC
	ret
LB_1789:
	POP_GRM_FAIL 
	ret
ETR_347:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_347
	ret
GRM_347:
	PUSH_GRM
	jmp LB_1802
LB_1801:
	add r14,1 
LB_1802:
	cmp r14,r9
	jge LB_1803
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1801
LB_1803
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1806
	jmp LB_1807
LB_1806:
	jmp LB_1804
LB_1807:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1805
LB_1804:
	add rsp,0
	jmp LB_1800
LB_1805:
	jmp LB_1809
LB_1808:
	add r14,1 
LB_1809:
	cmp r14,r9
	jge LB_1810
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1808
LB_1810
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1813
	jmp LB_1814
LB_1813:
	mov r8,unt_1
	jmp LB_1811
LB_1814:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],47
	jnz LB_1815
	cmp BYTE [rdi+1],47
	jnz LB_1815
	jmp LB_1816
LB_1815:
	mov r8,unt_1
	jmp LB_1811
LB_1816:
	add r14,2
	jmp LB_1812
LB_1811:
	add rsp,8
	jmp LB_1800
LB_1812:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1817
LB_1817
;; rsp=1 , %2297~1'(= r ) %2296~0'(= r ) %2295~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2298~1(<2)◂{ } %2297~1'(= r ) %2296~0'(= r ) %2295~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %2299~0(<2)◂1(<2)◂{ } %2297~1'(= r ) %2296~0'(= r ) %2295~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ a18◂ [ ]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1818
LB_1818:
	cmp BYTE [r8+6],0
	jnz LB_1800
	POP_GRM_SCC
	ret
LB_1800:
	RB_GRM
	jmp LB_1821
LB_1820:
	add r14,1 
LB_1821:
	cmp r14,r9
	jge LB_1822
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1820
LB_1822
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1825
	jmp LB_1826
LB_1825:
	jmp LB_1823
LB_1826:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1824
LB_1823:
	add rsp,0
	jmp LB_1819
LB_1824:
	jmp LB_1828
LB_1827:
	add r14,1 
LB_1828:
	cmp r14,r9
	jge LB_1829
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1827
LB_1829
	call GRM_342
	cmp BYTE [r8+6],0
	jnz LB_1832
	jmp LB_1833
LB_1832:
	jmp LB_1830
LB_1833:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a23◂ [ a18◂ [ ]] ) ⊢ 9'(= a23◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1831
LB_1830:
	add rsp,8
	jmp LB_1819
LB_1831:
	jmp LB_1835
LB_1834:
	add r14,1 
LB_1835:
	cmp r14,r9
	jge LB_1836
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1834
LB_1836
	call GRM_347
	cmp BYTE [r8+6],0
	jnz LB_1839
	jmp LB_1840
LB_1839:
	jmp LB_1837
LB_1840:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1838
LB_1837:
	add rsp,16
	jmp LB_1819
LB_1838:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1841
LB_1841
;; rsp=3 , %2304~1'(= r ) %2303~0'(= r ) %2302~10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2301~9'(= a23◂ [ a18◂ [ ]] ) %2300~8'(= a47◂ [ *{ }] ) 
; #25 { 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) }
;; rsp=3 , %2305~0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } %2304~1'(= r ) %2303~0'(= r ) %2300~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) }
;; rsp=3 , %2306~0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } %2304~1'(= r ) %2303~0'(= r ) %2300~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ a18◂ [ ]]]] )
; {| 001000000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_1842
LB_1842:
	cmp BYTE [r8+6],0
	jnz LB_1819
	POP_GRM_SCC
	ret
LB_1819:
	POP_GRM_FAIL 
	ret
LB_2033:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2036+8*rax]
LB_2036: dq LB_2034,LB_2035
LB_2034:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2032
	jmp LB_2037
LB_2035:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2038
	jmp LB_2037
LB_2037:
	ret
LB_2038:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2041+8*rax]
LB_2041: dq LB_2039,LB_2040
LB_2039:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2043
	jmp LB_2042
LB_2040:
	mov rdi,r8
	call free_s8
	jmp LB_2042
LB_2042:
	ret
LB_2043:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2046+8*rax]
LB_2046: dq LB_2044,LB_2045
LB_2044:
	mov rdi,r8
	call free_s8
	jmp LB_2047
LB_2045:
	jmp LB_2047
LB_2047:
	ret
LB_2032:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2050+8*rax]
LB_2050: dq LB_2048,LB_2049
LB_2048:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2033
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2032
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2051
LB_2049:
	jmp LB_2051
LB_2051:
	ret
LB_2076:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2079+8*rax]
LB_2079: dq LB_2077,LB_2078
LB_2077:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2081
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2082
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2083
	pop r8 
	FREE_RCD 3, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2076
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2080
LB_2078:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2081
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2082
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2083
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2080
LB_2080:
	ret
LB_2083:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2087+8*rax]
LB_2087: dq LB_2084,LB_2085,LB_2086
LB_2084:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2089
	jmp LB_2088
LB_2085:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2090
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2076
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2088
LB_2086:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2091
	jmp LB_2088
LB_2088:
	ret
LB_2091:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2099+8*rax]
LB_2099: dq LB_2092,LB_2093,LB_2094,LB_2095,LB_2096,LB_2097,LB_2098
LB_2092:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2090
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2100
LB_2093:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2102
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2090
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2100
LB_2094:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2103
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2091
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2100
LB_2095:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2089
	jmp LB_2100
LB_2096:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2090
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2104
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2100
LB_2097:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2105
	jmp LB_2100
LB_2098:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2100
LB_2100:
	ret
LB_2105:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2108+8*rax]
LB_2108: dq LB_2106,LB_2107
LB_2106:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2090
	jmp LB_2109
LB_2107:
	jmp LB_2109
LB_2109:
	ret
LB_2104:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2112+8*rax]
LB_2112: dq LB_2110,LB_2111
LB_2110:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2076
	jmp LB_2113
LB_2111:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2032
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2091
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2113
LB_2113:
	ret
LB_2103:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2118+8*rax]
LB_2118: dq LB_2114,LB_2115,LB_2116,LB_2117
LB_2114:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2090
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2033
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2119
LB_2115:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2102
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2090
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2033
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2119
LB_2116:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2120
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2090
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2033
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2119
LB_2117:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2121
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2122
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2123
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2119
LB_2119:
	ret
LB_2123:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2126+8*rax]
LB_2126: dq LB_2124,LB_2125
LB_2124:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2038
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2123
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2127
LB_2125:
	jmp LB_2127
LB_2127:
	ret
LB_2122:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2130+8*rax]
LB_2130: dq LB_2128,LB_2129
LB_2128:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2102
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2122
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2131
LB_2129:
	jmp LB_2131
LB_2131:
	ret
LB_2121:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2134+8*rax]
LB_2134: dq LB_2132,LB_2133
LB_2132:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2136
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2121
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2135
LB_2133:
	jmp LB_2135
LB_2135:
	ret
LB_2136:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2140+8*rax]
LB_2140: dq LB_2137,LB_2138,LB_2139
LB_2137:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2120
	jmp LB_2141
LB_2138:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2142
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2141
LB_2139:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2120
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2141
LB_2141:
	ret
LB_2142:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2147+8*rax]
LB_2147: dq LB_2143,LB_2144,LB_2145,LB_2146
LB_2143:
	jmp LB_2148
LB_2144:
	jmp LB_2148
LB_2145:
	jmp LB_2148
LB_2146:
	jmp LB_2148
LB_2148:
	ret
LB_2120:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2156+8*rax]
LB_2156: dq LB_2149,LB_2150,LB_2151,LB_2152,LB_2153,LB_2154,LB_2155
LB_2149:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2158
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2158
	pop r8 
	FREE_RCD 4, r8
	jmp LB_2157
LB_2150:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2159
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2160
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2157
LB_2151:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2157
LB_2152:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2157
LB_2153:
	mov rdi,r8
	call free_s8
	jmp LB_2157
LB_2154:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2101
	jmp LB_2157
LB_2155:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2157
LB_2157:
	ret
LB_2160:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2168+8*rax]
LB_2168: dq LB_2161,LB_2162,LB_2163,LB_2164,LB_2165,LB_2166,LB_2167
LB_2161:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2170
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2169
LB_2162:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2171
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2170
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2169
LB_2163:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2172
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2160
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2169
LB_2164:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2173
	jmp LB_2169
LB_2165:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2170
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2174
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2169
LB_2166:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2175
	jmp LB_2169
LB_2167:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2169
LB_2169:
	ret
LB_2175:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2178+8*rax]
LB_2178: dq LB_2176,LB_2177
LB_2176:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2170
	jmp LB_2179
LB_2177:
	jmp LB_2179
LB_2179:
	ret
LB_2174:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2182+8*rax]
LB_2182: dq LB_2180,LB_2181
LB_2180:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2184
	jmp LB_2183
LB_2181:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2185
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2160
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2183
LB_2183:
	ret
LB_2185:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2188+8*rax]
LB_2188: dq LB_2186,LB_2187
LB_2186:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2159
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2185
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2189
LB_2187:
	jmp LB_2189
LB_2189:
	ret
LB_2184:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2192+8*rax]
LB_2192: dq LB_2190,LB_2191
LB_2190:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2194
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2195
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2196
	pop r8 
	FREE_RCD 3, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2184
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2193
LB_2191:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2194
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2195
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2196
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2193
LB_2193:
	ret
LB_2196:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2200+8*rax]
LB_2200: dq LB_2197,LB_2198,LB_2199
LB_2197:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2173
	jmp LB_2201
LB_2198:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2170
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2184
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2201
LB_2199:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2160
	jmp LB_2201
LB_2201:
	ret
LB_2195:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2204+8*rax]
LB_2204: dq LB_2202,LB_2203
LB_2202:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2206
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2195
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2205
LB_2203:
	jmp LB_2205
LB_2205:
	ret
LB_2206:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2210+8*rax]
LB_2210: dq LB_2207,LB_2208,LB_2209
LB_2207:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2170
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2194
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2211
LB_2208:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2212
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2212
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2211
LB_2209:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2212
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2212
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2211
LB_2211:
	ret
LB_2212:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2215+8*rax]
LB_2215: dq LB_2213,LB_2214
LB_2213:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2217
	jmp LB_2216
LB_2214:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2216
LB_2216:
	ret
LB_2217:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2225+8*rax]
LB_2225: dq LB_2218,LB_2219,LB_2220,LB_2221,LB_2222,LB_2223,LB_2224
LB_2218:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2158
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2158
	pop r8 
	FREE_RCD 4, r8
	jmp LB_2226
LB_2219:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2159
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2160
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2226
LB_2220:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2226
LB_2221:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2226
LB_2222:
	mov rdi,r8
	call free_s8
	jmp LB_2226
LB_2223:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2226
LB_2224:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2226
LB_2226:
	ret
LB_2194:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2229+8*rax]
LB_2229: dq LB_2227,LB_2228
LB_2227:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2231
	jmp LB_2230
LB_2228:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2232
	jmp LB_2230
LB_2230:
	ret
LB_2232:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2237+8*rax]
LB_2237: dq LB_2233,LB_2234,LB_2235,LB_2236
LB_2233:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2194
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2238
LB_2234:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2217
	jmp LB_2238
LB_2235:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2239
	jmp LB_2238
LB_2236:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2238
LB_2238:
	ret
LB_2239:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2242+8*rax]
LB_2242: dq LB_2240,LB_2241
LB_2240:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2243
LB_2241:
	jmp LB_2243
LB_2243:
	ret
LB_2231:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2246+8*rax]
LB_2246: dq LB_2244,LB_2245
LB_2244:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2194
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2231
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2247
LB_2245:
	jmp LB_2247
LB_2247:
	ret
LB_2173:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2250+8*rax]
LB_2250: dq LB_2248,LB_2249
LB_2248:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2195
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2196
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2173
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2251
LB_2249:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2195
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2196
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2251
LB_2251:
	ret
LB_2172:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2256+8*rax]
LB_2256: dq LB_2252,LB_2253,LB_2254,LB_2255
LB_2252:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2170
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2159
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2257
LB_2253:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2171
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2170
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2159
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2257
LB_2254:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2217
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2170
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2159
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2257
LB_2255:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2258
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2259
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2260
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2257
LB_2257:
	ret
LB_2260:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2263+8*rax]
LB_2263: dq LB_2261,LB_2262
LB_2261:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2265
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2260
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2264
LB_2262:
	jmp LB_2264
LB_2264:
	ret
LB_2265:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2268+8*rax]
LB_2268: dq LB_2266,LB_2267
LB_2266:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2239
	jmp LB_2269
LB_2267:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2269
LB_2269:
	ret
LB_2259:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2272+8*rax]
LB_2272: dq LB_2270,LB_2271
LB_2270:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2171
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2259
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2273
LB_2271:
	jmp LB_2273
LB_2273:
	ret
LB_2258:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2276+8*rax]
LB_2276: dq LB_2274,LB_2275
LB_2274:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2278
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2258
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2277
LB_2275:
	jmp LB_2277
LB_2277:
	ret
LB_2278:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2282+8*rax]
LB_2282: dq LB_2279,LB_2280,LB_2281
LB_2279:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2217
	jmp LB_2283
LB_2280:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2142
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2283
LB_2281:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2217
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2283
LB_2283:
	ret
LB_2171:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2286+8*rax]
LB_2286: dq LB_2284,LB_2285
LB_2284:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2217
	jmp LB_2287
LB_2285:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2287
LB_2287:
	ret
LB_2170:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2290+8*rax]
LB_2290: dq LB_2288,LB_2289
LB_2288:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2292
	jmp LB_2291
LB_2289:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2171
	jmp LB_2291
LB_2291:
	ret
LB_2292:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2295+8*rax]
LB_2295: dq LB_2293,LB_2294
LB_2293:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2170
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2292
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2296
LB_2294:
	jmp LB_2296
LB_2296:
	ret
LB_2159:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2299+8*rax]
LB_2299: dq LB_2297,LB_2298
LB_2297:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2185
	jmp LB_2300
LB_2298:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2265
	jmp LB_2300
LB_2300:
	ret
LB_2158:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2303+8*rax]
LB_2303: dq LB_2301,LB_2302
LB_2301:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2305
	jmp LB_2304
LB_2302:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2306
	jmp LB_2304
LB_2304:
	ret
LB_2306:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2311+8*rax]
LB_2311: dq LB_2307,LB_2308,LB_2309,LB_2310
LB_2307:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2313
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2312
LB_2308:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2217
	jmp LB_2312
LB_2309:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2158
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2312
LB_2310:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2312
LB_2312:
	ret
LB_2313:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2318+8*rax]
LB_2318: dq LB_2314,LB_2315,LB_2316,LB_2317
LB_2314:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2320
	jmp LB_2319
LB_2315:
	jmp LB_2319
LB_2316:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2319
LB_2317:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2321
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2319
LB_2319:
	ret
LB_2321:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2324+8*rax]
LB_2324: dq LB_2322,LB_2323
LB_2322:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2313
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2321
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2325
LB_2323:
	jmp LB_2325
LB_2325:
	ret
LB_2320:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2331+8*rax]
LB_2331: dq LB_2326,LB_2327,LB_2328,LB_2329,LB_2330
LB_2326:
	jmp LB_2332
LB_2327:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2313
	jmp LB_2332
LB_2328:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2313
	jmp LB_2332
LB_2329:
	jmp LB_2332
LB_2330:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2321
	jmp LB_2332
LB_2332:
	ret
LB_2305:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2335+8*rax]
LB_2335: dq LB_2333,LB_2334
LB_2333:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2158
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2305
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2336
LB_2334:
	jmp LB_2336
LB_2336:
	ret
LB_2102:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2339+8*rax]
LB_2339: dq LB_2337,LB_2338
LB_2337:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2120
	jmp LB_2340
LB_2338:
	mov rdi,r8
	call free_s8
	jmp LB_2340
LB_2340:
	ret
LB_2101:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2343+8*rax]
LB_2343: dq LB_2341,LB_2342
LB_2341:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2101
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2344
LB_2342:
	mov rdi,r8
	call free_s8
	jmp LB_2344
LB_2344:
	ret
LB_2090:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2347+8*rax]
LB_2347: dq LB_2345,LB_2346
LB_2345:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2349
	jmp LB_2348
LB_2346:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2102
	jmp LB_2348
LB_2348:
	ret
LB_2349:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2352+8*rax]
LB_2352: dq LB_2350,LB_2351
LB_2350:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2090
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2349
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2353
LB_2351:
	jmp LB_2353
LB_2353:
	ret
LB_2089:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2356+8*rax]
LB_2356: dq LB_2354,LB_2355
LB_2354:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2082
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2083
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2089
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2357
LB_2355:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2082
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2083
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2357
LB_2357:
	ret
LB_2082:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2360+8*rax]
LB_2360: dq LB_2358,LB_2359
LB_2358:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2362
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2082
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2361
LB_2359:
	jmp LB_2361
LB_2361:
	ret
LB_2362:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2366+8*rax]
LB_2366: dq LB_2363,LB_2364,LB_2365
LB_2363:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2090
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2081
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2367
LB_2364:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2368
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2368
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2367
LB_2365:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2368
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2368
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2367
LB_2367:
	ret
LB_2368:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2371+8*rax]
LB_2371: dq LB_2369,LB_2370
LB_2369:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2120
	jmp LB_2372
LB_2370:
	mov rdi,r8
	call free_s8
	jmp LB_2372
LB_2372:
	ret
LB_2081:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2375+8*rax]
LB_2375: dq LB_2373,LB_2374
LB_2373:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2377
	jmp LB_2376
LB_2374:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2378
	jmp LB_2376
LB_2376:
	ret
LB_2378:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2383+8*rax]
LB_2383: dq LB_2379,LB_2380,LB_2381,LB_2382
LB_2379:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2081
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2384
LB_2380:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2120
	jmp LB_2384
LB_2381:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2043
	jmp LB_2384
LB_2382:
	mov rdi,r8
	call free_s8
	jmp LB_2384
LB_2384:
	ret
LB_2377:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2387+8*rax]
LB_2387: dq LB_2385,LB_2386
LB_2385:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2081
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2377
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2388
LB_2386:
	jmp LB_2388
LB_2388:
	ret
LB_2741: ;; #311 { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } ⊢ 0'(= a47◂ [ q0] ) : ({ _r64 _r64 _s8 }→_t47◂6360'(=6361'(1)))
;; rsp=0 , %1813~2'(= {| l |} ) %1812~1'(= r ) %1811~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1814~1(<2)◂{ } %1813~2'(= {| l |} ) %1812~1'(= r ) %1811~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1815~0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1816~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; ∎ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
; .mov_ptn2 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0'(= a47◂ [ q0] )
; {| 1110.. |}
	mov r9,r13
	ALC_RCD 2, rax
	mov r13,rax
	ALC_RCD 3, rax
	mov r10,rax
	mov r11,r9
	mov rax,r11
	mov QWORD [r10+8],rax
	mov r11,r14
	mov rax,r11
	mov QWORD [r10+16],rax
	mov r11,r8
	mov rax,r11
	mov QWORD [r10+24],rax
	mov rax,r10
	mov QWORD [r13+8],rax
	mov r10,unt_1
	mov rax,r10
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
ETR_348:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_348
	ret
GRM_348:
	PUSH_GRM
	jmp LB_1845
LB_1844:
	add r14,1 
LB_1845:
	cmp r14,r9
	jge LB_1846
	JZ_SPC BYTE [r13+8+r14], LB_1844
LB_1846
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1849
	jmp LB_1850
LB_1849:
	jmp LB_1847
LB_1850:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1848
LB_1847:
	add rsp,0
	jmp LB_1843
LB_1848:
	jmp LB_1852
LB_1851:
	add r14,1 
LB_1852:
	cmp r14,r9
	jge LB_1853
	JZ_SPC BYTE [r13+8+r14], LB_1851
LB_1853
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1856
	jmp LB_1857
LB_1856:
	mov r8,unt_1
	jmp LB_1854
LB_1857:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1858
	cmp BYTE [rdi+1],136
	jnz LB_1858
	cmp BYTE [rdi+2],142
	jnz LB_1858
	cmp BYTE [rdi+3],124
	jnz LB_1858
	jmp LB_1859
LB_1858:
	mov r8,unt_1
	jmp LB_1854
LB_1859:
	add r14,4
	jmp LB_1855
LB_1854:
	add rsp,8
	jmp LB_1843
LB_1855:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1860
LB_1860
;; rsp=1 , %2309~1'(= r ) %2308~0'(= r ) %2307~8'(= a47◂ [ *{ }] ) 
; #172 0'(= r ) ⊢ 6(<7)◂0'(= r )
;; rsp=1 , %2310~6(<7)◂0'(= r ) %2309~1'(= r ) %2307~8'(= a47◂ [ *{ }] ) 
; #308 6(<7)◂0'(= r ) ⊢ 0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %2311~0(<2)◂6(<7)◂0'(= r ) %2309~1'(= r ) %2307~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂6(<7)◂0'(= r ) ⊢ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %2312~0(<2)◂0(<2)◂6(<7)◂0'(= r ) %2309~1'(= r ) %2307~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂6(<7)◂0'(= r ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 1010.. |}
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],6
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1861
LB_1861:
	cmp BYTE [r8+6],0
	jnz LB_1843
	POP_GRM_SCC
	ret
LB_1843:
	RB_GRM
	jmp LB_1864
LB_1863:
	add r14,1 
LB_1864:
	cmp r14,r9
	jge LB_1865
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1863
LB_1865
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1868
	jmp LB_1869
LB_1868:
	jmp LB_1866
LB_1869:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1867
LB_1866:
	add rsp,0
	jmp LB_1862
LB_1867:
	jmp LB_1871
LB_1870:
	add r14,1 
LB_1871:
	cmp r14,r9
	jge LB_1872
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1870
LB_1872
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1875
	jmp LB_1876
LB_1875:
	mov r8,unt_1
	jmp LB_1873
LB_1876:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1877
	cmp BYTE [rdi+1],136
	jnz LB_1877
	cmp BYTE [rdi+2],142
	jnz LB_1877
	jmp LB_1878
LB_1877:
	mov r8,unt_1
	jmp LB_1873
LB_1878:
	add r14,3
	jmp LB_1874
LB_1873:
	add rsp,8
	jmp LB_1862
LB_1874:
	PUSH_GRM
	jmp LB_1882
LB_1881:
	add r14,1 
LB_1882:
	cmp r14,r9
	jge LB_1883
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1881
LB_1883
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1886
	jmp LB_1887
LB_1886:
	mov r8,unt_1
	jmp LB_1884
LB_1887:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1888
	jmp LB_1889
LB_1888:
	mov r8,unt_1
	jmp LB_1884
LB_1889:
	add r14,1
	jmp LB_1885
LB_1884:
	add rsp,0
	jmp LB_1880
LB_1885:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1890
LB_1890
;; rsp=0 , %2317~1'(= r ) %2316~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2318~1(<2)◂{ } %2317~1'(= r ) %2316~0'(= r ) 
; #173 1(<2)◂{ } ⊢ 5(<7)◂1(<2)◂{ }
;; rsp=0 , %2319~5(<7)◂1(<2)◂{ } %2317~1'(= r ) %2316~0'(= r ) 
; #308 5(<7)◂1(<2)◂{ } ⊢ 0(<2)◂5(<7)◂1(<2)◂{ }
;; rsp=0 , %2320~0(<2)◂5(<7)◂1(<2)◂{ } %2317~1'(= r ) %2316~0'(= r ) 
; #26 0(<2)◂5(<7)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ }
;; rsp=0 , %2321~0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ } %2317~1'(= r ) %2316~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],5
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_1891
LB_1891:
	cmp BYTE [r8+6],0
	jnz LB_1880
	POP_GRM_SCC
	jmp LB_1879
LB_1880:
	RB_GRM
	jmp LB_1894
LB_1893:
	add r14,1 
LB_1894:
	cmp r14,r9
	jge LB_1895
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1893
LB_1895
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_1898
	jmp LB_1899
LB_1898:
	jmp LB_1896
LB_1899:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1897
LB_1896:
	add rsp,0
	jmp LB_1892
LB_1897:
	jmp LB_1901
LB_1900:
	add r14,1 
LB_1901:
	cmp r14,r9
	jge LB_1902
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1900
LB_1902
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1905
	jmp LB_1906
LB_1905:
	mov r8,unt_1
	jmp LB_1903
LB_1906:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1907
	jmp LB_1908
LB_1907:
	mov r8,unt_1
	jmp LB_1903
LB_1908:
	add r14,1
	jmp LB_1904
LB_1903:
	add rsp,8
	jmp LB_1892
LB_1904:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1909
LB_1909
;; rsp=1 , %2324~1'(= r ) %2323~0'(= r ) %2322~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #26 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2325~0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2324~1'(= r ) %2323~0'(= r ) 
; #173 0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2326~5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2324~1'(= r ) %2323~0'(= r ) 
; #308 5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2327~0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2324~1'(= r ) %2323~0'(= r ) 
; #26 0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2328~0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2324~1'(= r ) %2323~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],5
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1910
LB_1910:
	cmp BYTE [r8+6],0
	jnz LB_1892
	POP_GRM_SCC
	jmp LB_1879
LB_1892:
	RB_GRM
	jmp LB_1913
LB_1912:
	add r14,1 
LB_1913:
	cmp r14,r9
	jge LB_1914
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1912
LB_1914
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1917
	jmp LB_1918
LB_1917:
	jmp LB_1915
LB_1918:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_1916
LB_1915:
	add rsp,0
	jmp LB_1911
LB_1916:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1919
LB_1919
;; rsp=2 , %2331~1'(= r ) %2330~0'(= r ) %2329~{ 8'(= r ) 9'(= r ) } 
; $ %[ "lc_code ∎ .. " ] ⊢ %[ "lc_code ∎ .. " ]
;; rsp=2 , %2332~%[ "lc_code ∎ .. " ] %2331~1'(= r ) %2330~0'(= r ) %2329~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2333~1(<2)◂{ } %2332~%[ "lc_code ∎ .. " ] %2331~1'(= r ) %2330~0'(= r ) %2329~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2334~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2329~{ 8'(= r ) 9'(= r ) } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2335~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2329~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2336~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2329~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],15
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],226
	mov BYTE [rax+8+9],136
	mov BYTE [rax+8+10],142
	mov BYTE [rax+8+11],32
	mov BYTE [rax+8+12],46
	mov BYTE [rax+8+13],46
	mov BYTE [rax+8+14],32
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_1920
LB_1920:
	cmp BYTE [r8+6],0
	jnz LB_1911
	POP_GRM_SCC
	jmp LB_1879
LB_1911:
	POP_GRM_FAIL 
	jmp LB_1879
LB_1879:
	cmp BYTE [r8+6],0
	jnz LB_1921
	jmp LB_1922
LB_1921:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_1922:
	mov QWORD [rsp+8*1],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1923
LB_1923
;; rsp=1 , %2337~3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2315~1'(= r ) %2314~0'(= r ) %2313~8'(= a47◂ [ *{ }] ) 
; #26 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2338~0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2315~1'(= r ) %2314~0'(= r ) %2313~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1924
LB_1924:
	cmp BYTE [r8+6],0
	jnz LB_1862
	POP_GRM_SCC
	ret
LB_1862:
	RB_GRM
	jmp LB_1927
LB_1926:
	add r14,1 
LB_1927:
	cmp r14,r9
	jge LB_1928
	JZ_SPC BYTE [r13+8+r14], LB_1926
LB_1928
	call GRM_352
	cmp BYTE [r8+6],0
	jnz LB_1931
	jmp LB_1932
LB_1931:
	jmp LB_1929
LB_1932:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1930
LB_1929:
	add rsp,0
	jmp LB_1925
LB_1930:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1933
LB_1933
;; rsp=1 , %2341~1'(= r ) %2340~0'(= r ) %2339~8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1936
	jmp LB_1937
LB_1936:
	jmp LB_1935
LB_1937:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2343~2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2341~1'(= r ) %2340~0'(= r ) 
; #175 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2344~3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2341~1'(= r ) %2340~0'(= r ) 
; #308 3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2345~0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2341~1'(= r ) %2340~0'(= r ) 
; #26 0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2346~0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2341~1'(= r ) %2340~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
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
; .mov_ptn2 0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1934
LB_1935:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2342~2'(= a2◂ [ *{ rr{| l |}}] ) %2341~1'(= r ) %2340~0'(= r ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2347~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2341~1'(= r ) %2340~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2348~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2341~1'(= r ) %2340~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1934
LB_1934:
	cmp BYTE [r8+6],0
	jnz LB_1925
	POP_GRM_SCC
	ret
LB_1925:
	RB_GRM
	jmp LB_1940
LB_1939:
	add r14,1 
LB_1940:
	cmp r14,r9
	jge LB_1941
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1939
LB_1941
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1944
	jmp LB_1945
LB_1944:
	jmp LB_1942
LB_1945:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1943
LB_1942:
	add rsp,0
	jmp LB_1938
LB_1943:
	jmp LB_1947
LB_1946:
	add r14,1 
LB_1947:
	cmp r14,r9
	jge LB_1948
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1946
LB_1948
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1951
	jmp LB_1952
LB_1951:
	mov r8,unt_1
	jmp LB_1949
LB_1952:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],36
	jnz LB_1953
	jmp LB_1954
LB_1953:
	mov r8,unt_1
	jmp LB_1949
LB_1954:
	add r14,1
	jmp LB_1950
LB_1949:
	add rsp,8
	jmp LB_1938
LB_1950:
	PUSH_GRM
	jmp LB_1958
LB_1957:
	add r14,1 
LB_1958:
	cmp r14,r9
	jge LB_1959
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1957
LB_1959
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_1962
	jmp LB_1963
LB_1962:
	jmp LB_1960
LB_1963:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1961
LB_1960:
	add rsp,0
	jmp LB_1956
LB_1961:
	jmp LB_1965
LB_1964:
	add r14,1 
LB_1965:
	cmp r14,r9
	jge LB_1966
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1964
LB_1966
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1969
	jmp LB_1970
LB_1969:
	mov r8,unt_1
	jmp LB_1967
LB_1970:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1971
	cmp BYTE [rdi+1],138
	jnz LB_1971
	cmp BYTE [rdi+2],162
	jnz LB_1971
	jmp LB_1972
LB_1971:
	mov r8,unt_1
	jmp LB_1967
LB_1972:
	add r14,3
	jmp LB_1968
LB_1967:
	add rsp,8
	jmp LB_1956
LB_1968:
	PUSH_GRM
	jmp LB_1976
LB_1975:
	add r14,1 
LB_1976:
	cmp r14,r9
	jge LB_1977
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1975
LB_1977
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1980
	jmp LB_1981
LB_1980:
	mov r8,unt_1
	jmp LB_1978
LB_1981:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1982
	jmp LB_1983
LB_1982:
	mov r8,unt_1
	jmp LB_1978
LB_1983:
	add r14,1
	jmp LB_1979
LB_1978:
	add rsp,0
	jmp LB_1974
LB_1979:
	jmp LB_1985
LB_1984:
	add r14,1 
LB_1985:
	cmp r14,r9
	jge LB_1986
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1984
LB_1986
	call GRM_353
	cmp BYTE [r8+6],0
	jnz LB_1989
	jmp LB_1990
LB_1989:
	jmp LB_1987
LB_1990:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_1988
LB_1987:
	add rsp,0
	jmp LB_1974
LB_1988:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1991
LB_1991
;; rsp=1 , %2357~1'(= r ) %2356~0'(= r ) %2355~8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1994
	jmp LB_1995
LB_1994:
	jmp LB_1993
LB_1995:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2359~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2357~1'(= r ) %2356~0'(= r ) 
; #171 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2360~0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2357~1'(= r ) %2356~0'(= r ) 
; #308 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2361~0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2357~1'(= r ) %2356~0'(= r ) 
; #26 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2362~0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2357~1'(= r ) %2356~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1992
LB_1993:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2358~2'(= a2◂ [ *{ rr{| l |}}] ) %2357~1'(= r ) %2356~0'(= r ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2363~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2357~1'(= r ) %2356~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2364~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2357~1'(= r ) %2356~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_1992
LB_1992:
	cmp BYTE [r8+6],0
	jnz LB_1974
	POP_GRM_SCC
	jmp LB_1973
LB_1974:
	RB_GRM
	jmp LB_1998
LB_1997:
	add r14,1 
LB_1998:
	cmp r14,r9
	jge LB_1999
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1997
LB_1999
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2002
	jmp LB_2003
LB_2002:
	jmp LB_2000
LB_2003:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2001
LB_2000:
	add rsp,0
	jmp LB_1996
LB_2001:
	jmp LB_2005
LB_2004:
	add r14,1 
LB_2005:
	cmp r14,r9
	jge LB_2006
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2004
LB_2006
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_2009
	jmp LB_2010
LB_2009:
	jmp LB_2007
LB_2010:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2008
LB_2007:
	add rsp,8
	jmp LB_1996
LB_2008:
	jmp LB_2012
LB_2011:
	add r14,1 
LB_2012:
	cmp r14,r9
	jge LB_2013
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2011
LB_2013
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2016
	jmp LB_2017
LB_2016:
	mov r8,unt_1
	jmp LB_2014
LB_2017:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2018
	jmp LB_2019
LB_2018:
	mov r8,unt_1
	jmp LB_2014
LB_2019:
	add r14,1
	jmp LB_2015
LB_2014:
	add rsp,16
	jmp LB_1996
LB_2015:
	jmp LB_2021
LB_2020:
	add r14,1 
LB_2021:
	cmp r14,r9
	jge LB_2022
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2020
LB_2022
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2025
	jmp LB_2026
LB_2025:
	jmp LB_2023
LB_2026:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2024
LB_2023:
	add rsp,16
	jmp LB_1996
LB_2024:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2027
LB_2027
;; rsp=3 , %2369~1'(= r ) %2368~0'(= r ) %2367~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2366~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2365~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2030
	jmp LB_2031
LB_2030:
	jmp LB_2029
LB_2031:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2371~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2369~1'(= r ) %2368~0'(= r ) %2366~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2365~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=3 , %2372~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %2371~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2369~1'(= r ) %2368~0'(= r ) 
; #170 { 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2373~1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2369~1'(= r ) %2368~0'(= r ) 
; #308 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2374~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2369~1'(= r ) %2368~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2375~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2369~1'(= r ) %2368~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 00100000110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r14,rax
	mov r9,QWORD [rsp-8+8*3]
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*2]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov BYTE [r14+6],0
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2028
LB_2029:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2370~2'(= a2◂ [ *{ rr{| l |}}] ) %2369~1'(= r ) %2368~0'(= r ) %2366~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2365~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2376~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2369~1'(= r ) %2368~0'(= r ) %2366~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2365~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2377~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2369~1'(= r ) %2368~0'(= r ) %2366~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2365~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2032
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2028
LB_2028:
	cmp BYTE [r8+6],0
	jnz LB_1996
	POP_GRM_SCC
	jmp LB_1973
LB_1996:
	POP_GRM_FAIL 
	jmp LB_1973
LB_1973:
	cmp BYTE [r8+6],0
	jnz LB_2052
	jmp LB_2053
LB_2052:
	add rsp,8
	POP_GRM_FAIL
	jmp LB_1955
LB_2053:
	mov QWORD [rsp+8*1],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2054
LB_2054
;; rsp=1 , %2378~3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) %2354~1'(= r ) %2353~0'(= r ) %2352~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #308 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=1 , %2379~0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } %2354~1'(= r ) %2353~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=1 , %2380~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } %2354~1'(= r ) %2353~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}]] )
; {| 0011000010.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r9
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2055
LB_2055:
	cmp BYTE [r8+6],0
	jnz LB_1956
	POP_GRM_SCC
	jmp LB_1955
LB_1956:
	RB_GRM
	jmp LB_2058
LB_2057:
	add r14,1 
LB_2058:
	cmp r14,r9
	jge LB_2059
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2057
LB_2059
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2062
	jmp LB_2063
LB_2062:
	jmp LB_2060
LB_2063:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_2061
LB_2060:
	add rsp,0
	jmp LB_2056
LB_2061:
	jmp LB_2065
LB_2064:
	add r14,1 
LB_2065:
	cmp r14,r9
	jge LB_2066
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2064
LB_2066
	call GRM_353
	cmp BYTE [r8+6],0
	jnz LB_2069
	jmp LB_2070
LB_2069:
	jmp LB_2067
LB_2070:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2068
LB_2067:
	add rsp,16
	jmp LB_2056
LB_2068:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2071
LB_2071
;; rsp=3 , %2385~1'(= r ) %2384~0'(= r ) %2383~10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2382~9'(= r ) %2381~8'(= r ) 
;; ? 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2074
	jmp LB_2075
LB_2074:
	jmp LB_2073
LB_2075:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2387~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2385~1'(= r ) %2384~0'(= r ) %2382~9'(= r ) %2381~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2388~1(<2)◂{ } %2387~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2385~1'(= r ) %2384~0'(= r ) %2382~9'(= r ) %2381~8'(= r ) 
; $ %[ "glb_etr id_line line_res 0" ] ⊢ %[ "glb_etr id_line line_res 0" ]
;; rsp=3 , %2389~%[ "glb_etr id_line line_res 0" ] %2388~1(<2)◂{ } %2387~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2385~1'(= r ) %2384~0'(= r ) %2382~9'(= r ) %2381~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2390~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2387~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2385~1'(= r ) %2384~0'(= r ) 
; #307 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2391~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2387~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2385~1'(= r ) %2384~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2392~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2387~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2385~1'(= r ) %2384~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2076
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rsi,1  
	mov rdi,40
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],26
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],105
	mov BYTE [rax+8+9],100
	mov BYTE [rax+8+10],95
	mov BYTE [rax+8+11],108
	mov BYTE [rax+8+12],105
	mov BYTE [rax+8+13],110
	mov BYTE [rax+8+14],101
	mov BYTE [rax+8+15],32
	mov BYTE [rax+8+16],108
	mov BYTE [rax+8+17],105
	mov BYTE [rax+8+18],110
	mov BYTE [rax+8+19],101
	mov BYTE [rax+8+20],95
	mov BYTE [rax+8+21],114
	mov BYTE [rax+8+22],101
	mov BYTE [rax+8+23],115
	mov BYTE [rax+8+24],32
	mov BYTE [rax+8+25],48
	mov r14,rax
	mov rax,r14
	mov QWORD [r13+24],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,unt_1
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2072
LB_2073:
;; ?. 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2386~2'(= a2◂ [ *{ rr{| l |}}] ) %2385~1'(= r ) %2384~0'(= r ) %2382~9'(= r ) %2381~8'(= r ) 
; $ %[ "glb_etr id_line line_res 1" ] ⊢ %[ "glb_etr id_line line_res 1" ]
;; rsp=3 , %2393~%[ "glb_etr id_line line_res 1" ] %2386~2'(= a2◂ [ *{ rr{| l |}}] ) %2385~1'(= r ) %2384~0'(= r ) %2382~9'(= r ) %2381~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2394~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2385~1'(= r ) %2384~0'(= r ) 
; #307 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2395~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2385~1'(= r ) %2384~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2396~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2385~1'(= r ) %2384~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}]] )
; {| 00100000110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r14,rax
	mov r9,QWORD [rsp-8+8*3]
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*2]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov rsi,1  
	mov rdi,40
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],26
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],105
	mov BYTE [rax+8+9],100
	mov BYTE [rax+8+10],95
	mov BYTE [rax+8+11],108
	mov BYTE [rax+8+12],105
	mov BYTE [rax+8+13],110
	mov BYTE [rax+8+14],101
	mov BYTE [rax+8+15],32
	mov BYTE [rax+8+16],108
	mov BYTE [rax+8+17],105
	mov BYTE [rax+8+18],110
	mov BYTE [rax+8+19],101
	mov BYTE [rax+8+20],95
	mov BYTE [rax+8+21],114
	mov BYTE [rax+8+22],101
	mov BYTE [rax+8+23],115
	mov BYTE [rax+8+24],32
	mov BYTE [rax+8+25],49
	mov r9,rax
	mov rax,r9
	mov QWORD [r14+24],rax
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2072
LB_2072:
	cmp BYTE [r8+6],0
	jnz LB_2056
	POP_GRM_SCC
	jmp LB_1955
LB_2056:
	RB_GRM
	jmp LB_2391
LB_2390:
	add r14,1 
LB_2391:
	cmp r14,r9
	jge LB_2392
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2390
LB_2392
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2395
	jmp LB_2396
LB_2395:
	jmp LB_2393
LB_2396:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_2394
LB_2393:
	add rsp,0
	jmp LB_2389
LB_2394:
	jmp LB_2398
LB_2397:
	add r14,1 
LB_2398:
	cmp r14,r9
	jge LB_2399
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2397
LB_2399
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2402
	jmp LB_2403
LB_2402:
	jmp LB_2400
LB_2403:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2401
LB_2400:
	add rsp,16
	jmp LB_2389
LB_2401:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2404
LB_2404
;; rsp=3 , %2401~1'(= r ) %2400~0'(= r ) %2399~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2398~9'(= r ) %2397~8'(= r ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2407
	jmp LB_2408
LB_2407:
	jmp LB_2406
LB_2408:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2403~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2401~1'(= r ) %2400~0'(= r ) %2398~9'(= r ) %2397~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2404~1(<2)◂{ } %2403~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2401~1'(= r ) %2400~0'(= r ) %2398~9'(= r ) %2397~8'(= r ) 
; $ %[ "glb_etr id_line line_res 2" ] ⊢ %[ "glb_etr id_line line_res 2" ]
;; rsp=3 , %2405~%[ "glb_etr id_line line_res 2" ] %2404~1(<2)◂{ } %2403~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2401~1'(= r ) %2400~0'(= r ) %2398~9'(= r ) %2397~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2406~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2403~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2401~1'(= r ) %2400~0'(= r ) 
; #307 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2407~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2403~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2401~1'(= r ) %2400~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2408~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2403~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2401~1'(= r ) %2400~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rsi,1  
	mov rdi,40
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],26
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],105
	mov BYTE [rax+8+9],100
	mov BYTE [rax+8+10],95
	mov BYTE [rax+8+11],108
	mov BYTE [rax+8+12],105
	mov BYTE [rax+8+13],110
	mov BYTE [rax+8+14],101
	mov BYTE [rax+8+15],32
	mov BYTE [rax+8+16],108
	mov BYTE [rax+8+17],105
	mov BYTE [rax+8+18],110
	mov BYTE [rax+8+19],101
	mov BYTE [rax+8+20],95
	mov BYTE [rax+8+21],114
	mov BYTE [rax+8+22],101
	mov BYTE [rax+8+23],115
	mov BYTE [rax+8+24],32
	mov BYTE [rax+8+25],50
	mov r14,rax
	mov rax,r14
	mov QWORD [r13+24],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,unt_1
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2405
LB_2406:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2402~2'(= a2◂ [ *{ rr{| l |}}] ) %2401~1'(= r ) %2400~0'(= r ) %2398~9'(= r ) %2397~8'(= r ) 
; $ %[ "glb_etr id_line line_res 3" ] ⊢ %[ "glb_etr id_line line_res 3" ]
;; rsp=3 , %2409~%[ "glb_etr id_line line_res 3" ] %2402~2'(= a2◂ [ *{ rr{| l |}}] ) %2401~1'(= r ) %2400~0'(= r ) %2398~9'(= r ) %2397~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2410~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2401~1'(= r ) %2400~0'(= r ) 
; #307 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2411~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2401~1'(= r ) %2400~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2412~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2401~1'(= r ) %2400~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}]] )
; {| 00100000110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r14,rax
	mov r9,QWORD [rsp-8+8*3]
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*2]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov rsi,1  
	mov rdi,40
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],26
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],105
	mov BYTE [rax+8+9],100
	mov BYTE [rax+8+10],95
	mov BYTE [rax+8+11],108
	mov BYTE [rax+8+12],105
	mov BYTE [rax+8+13],110
	mov BYTE [rax+8+14],101
	mov BYTE [rax+8+15],32
	mov BYTE [rax+8+16],108
	mov BYTE [rax+8+17],105
	mov BYTE [rax+8+18],110
	mov BYTE [rax+8+19],101
	mov BYTE [rax+8+20],95
	mov BYTE [rax+8+21],114
	mov BYTE [rax+8+22],101
	mov BYTE [rax+8+23],115
	mov BYTE [rax+8+24],32
	mov BYTE [rax+8+25],51
	mov r9,rax
	mov rax,r9
	mov QWORD [r14+24],rax
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2405
LB_2405:
	cmp BYTE [r8+6],0
	jnz LB_2389
	POP_GRM_SCC
	jmp LB_1955
LB_2389:
	POP_GRM_FAIL 
	jmp LB_1955
LB_1955:
	cmp BYTE [r8+6],0
	jnz LB_2409
	jmp LB_2410
LB_2409:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2410:
	mov QWORD [rsp+8*1],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) ⊢ 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] )
; {| 1111000010.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2411
LB_2411
;; rsp=1 , %2413~3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) ⊢ 0(<2)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2414
	jmp LB_2415
LB_2414:
	jmp LB_2413
LB_2415:
	mov r8, QWORD [r9+8]
	mov r10, QWORD [r9+16]
	mov QWORD [GBG_VCT+8*0],r9
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2416~4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) %2415~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
;; ? 4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a29◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r10
	cmp BYTE [rdi+6],0
	jnz LB_2417
	jmp LB_2418
LB_2417:
	jmp LB_2416
LB_2418:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2418~3'(= a29◂ [ a18◂ [ ]{| l |}] ) %2415~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; #174 { 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2419~4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; #308 4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2420~0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2421~0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 00110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],4
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2412
LB_2416:
;; ?. 4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2417~3'(= a2◂ [ *{ rr{| l |}}] ) %2415~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2422~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2415~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2423~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2415~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2090
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2412
LB_2413:
;; ?. 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2414~2'(= a2◂ [ *{ rr{| l |}}] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2424~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2425~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2351~1'(= r ) %2350~0'(= r ) %2349~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2412
LB_2412:
	cmp BYTE [r8+6],0
	jnz LB_1938
	POP_GRM_SCC
	ret
LB_1938:
	RB_GRM
	jmp LB_2421
LB_2420:
	add r14,1 
LB_2421:
	cmp r14,r9
	jge LB_2422
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2420
LB_2422
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_2425
	jmp LB_2426
LB_2425:
	jmp LB_2423
LB_2426:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2424
LB_2423:
	add rsp,0
	jmp LB_2419
LB_2424:
	jmp LB_2428
LB_2427:
	add r14,1 
LB_2428:
	cmp r14,r9
	jge LB_2429
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2427
LB_2429
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2432
	jmp LB_2433
LB_2432:
	mov r8,unt_1
	jmp LB_2430
LB_2433:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],94
	jnz LB_2434
	jmp LB_2435
LB_2434:
	mov r8,unt_1
	jmp LB_2430
LB_2435:
	add r14,1
	jmp LB_2431
LB_2430:
	add rsp,8
	jmp LB_2419
LB_2431:
	jmp LB_2437
LB_2436:
	add r14,1 
LB_2437:
	cmp r14,r9
	jge LB_2438
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2436
LB_2438
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2441
	jmp LB_2442
LB_2441:
	jmp LB_2439
LB_2442:
	sub rsp,16
; .mov_ptn2 2'(= *{ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]a2◂ [ a25◂ [ {| l |}]]} ) ⊢ { 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
; {| 111100001110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_2440
LB_2439:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2440:
	jmp LB_2444
LB_2443:
	add r14,1 
LB_2444:
	cmp r14,r9
	jge LB_2445
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2443
LB_2445
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2448
	jmp LB_2449
LB_2448:
	mov r8,unt_1
	jmp LB_2446
LB_2449:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2450
	jmp LB_2451
LB_2450:
	mov r8,unt_1
	jmp LB_2446
LB_2451:
	add r14,1
	jmp LB_2447
LB_2446:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2447:
	jmp LB_2453
LB_2452:
	add r14,1 
LB_2453:
	cmp r14,r9
	jge LB_2454
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2452
LB_2454
	call GRM_347
	cmp BYTE [r8+6],0
	jnz LB_2457
	jmp LB_2458
LB_2457:
	jmp LB_2455
LB_2458:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2456
LB_2455:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2456:
	jmp LB_2460
LB_2459:
	add r14,1 
LB_2460:
	cmp r14,r9
	jge LB_2461
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2459
LB_2461
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2464
	jmp LB_2465
LB_2464:
	jmp LB_2462
LB_2465:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2463
LB_2462:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_2463:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_2466
LB_2466
;; rsp=5 , %2432~1'(= r ) %2431~0'(= r ) %2430~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2429~11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2428~10'(= a2◂ [ a25◂ [ {| l |}]] ) %2427~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2426~8'(= a47◂ [ *{ }] ) 
; #166 { 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=5 , %2433~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2432~1'(= r ) %2431~0'(= r ) %2430~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2426~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2469
	jmp LB_2470
LB_2469:
	jmp LB_2468
LB_2470:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2435~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2433~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2432~1'(= r ) %2431~0'(= r ) %2426~8'(= a47◂ [ *{ }] ) 
; #176 { 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2436~2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2432~1'(= r ) %2431~0'(= r ) %2426~8'(= a47◂ [ *{ }] ) 
; #308 2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2437~0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2432~1'(= r ) %2431~0'(= r ) %2426~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2438~0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2432~1'(= r ) %2431~0'(= r ) %2426~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000001110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r14,rax
	mov r9,QWORD [rsp-8+8*2]
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*4]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov r9,QWORD [rsp-8+8*3]
	mov rax,r9
	mov QWORD [r14+24],rax
	mov BYTE [r14+6],3
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_2467
LB_2468:
;; ?. 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2434~2'(= a2◂ [ *{ rr{| l |}}] ) %2433~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2432~1'(= r ) %2431~0'(= r ) %2426~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2439~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2433~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2432~1'(= r ) %2431~0'(= r ) %2426~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2440~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2433~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2432~1'(= r ) %2431~0'(= r ) %2426~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2121
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2122
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2123
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_2467
LB_2467:
	cmp BYTE [r8+6],0
	jnz LB_2419
	POP_GRM_SCC
	ret
LB_2419:
	RB_GRM
	jmp LB_2473
LB_2472:
	add r14,1 
LB_2473:
	cmp r14,r9
	jge LB_2474
	JZ_SPC BYTE [r13+8+r14], LB_2472
LB_2474
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_2477
	jmp LB_2478
LB_2477:
	jmp LB_2475
LB_2478:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2476
LB_2475:
	add rsp,0
	jmp LB_2471
LB_2476:
	jmp LB_2480
LB_2479:
	add r14,1 
LB_2480:
	cmp r14,r9
	jge LB_2481
	JZ_SPC BYTE [r13+8+r14], LB_2479
LB_2481
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2484
	jmp LB_2485
LB_2484:
	mov r8,unt_1
	jmp LB_2482
LB_2485:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_2486
	cmp BYTE [rdi+1],187
	jnz LB_2486
	jmp LB_2487
LB_2486:
	mov r8,unt_1
	jmp LB_2482
LB_2487:
	add r14,2
	jmp LB_2483
LB_2482:
	add rsp,8
	jmp LB_2471
LB_2483:
	jmp LB_2489
LB_2488:
	add r14,1 
LB_2489:
	cmp r14,r9
	jge LB_2490
	JZ_SPC BYTE [r13+8+r14], LB_2488
LB_2490
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2493
	jmp LB_2494
LB_2493:
	jmp LB_2491
LB_2494:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a30◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a30◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2492
LB_2491:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2492:
	jmp LB_2496
LB_2495:
	add r14,1 
LB_2496:
	cmp r14,r9
	jge LB_2497
	JZ_SPC BYTE [r13+8+r14], LB_2495
LB_2497
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2500
	jmp LB_2501
LB_2500:
	jmp LB_2498
LB_2501:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2499
LB_2498:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2499:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2502
LB_2502
;; rsp=3 , %2445~1'(= r ) %2444~0'(= r ) %2443~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2442~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2441~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2505
	jmp LB_2506
LB_2505:
	jmp LB_2504
LB_2506:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2447~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2445~1'(= r ) %2444~0'(= r ) %2442~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2441~8'(= a47◂ [ *{ }] ) 
;; ?; 9'(= a30◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<4)◂{ 3'(= a27◂ [ a18◂ [ ]] ) 4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 5'(= a17◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],2
	jnz LB_2508
	jmp LB_2509
LB_2508:
	jmp LB_2507
LB_2509:
	mov rdi,QWORD [rsp-8+8*2]
	mov r9, QWORD [rdi+8]
	mov rdi,QWORD [rsp-8+8*2]
	mov r10, QWORD [rdi+16]
	mov rdi,QWORD [rsp-8+8*2]
	mov r11, QWORD [rdi+24]
	MOV_RAX QWORD [GBG_VCT+8*0],QWORD [rsp-8+8*2]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=3 , %2450~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2448~3'(= a27◂ [ a18◂ [ ]] ) %2447~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #193 3'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂3'(= a27◂ [ a18◂ [ ]] )
;; rsp=3 , %2451~0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2450~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2447~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #112 0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] )
;; rsp=3 , %2452~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2450~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2447~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2453~1(<2)◂{ } %2452~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2450~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2447~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #25 { 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } }
;; rsp=3 , %2454~0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } %2452~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2447~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #170 { 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2455~1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2452~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #174 { 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2456~4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #308 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2457~0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2458~0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2449~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
; .dlt.ptn 4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_2090
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0011010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r14
	mov r14,rax
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r14
	mov r14,rax
	mov rax,r14
	mov QWORD [r8+8],rax
	ALC_RCD 2, rax
	mov r14,rax
	ALC_RCD 2, rax
	mov r10,rax
	mov rcx,r11
	mov rax,rcx
	mov QWORD [r10+8],rax
	mov rcx,unt_1
	mov rax,rcx
	mov QWORD [r10+16],rax
	mov BYTE [r10+6],0
	mov rax,r10
	mov QWORD [r14+8],rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r14+16],rax
	mov BYTE [r14+6],1
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],4
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2503
LB_2507:
;; rsp=3 , %2447~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2445~1'(= r ) %2444~0'(= r ) %2442~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2441~8'(= a47◂ [ *{ }] ) 
; #176 { 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2459~2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #308 2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2460~0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2461~0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2445~1'(= r ) %2444~0'(= r ) %2441~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 00100000010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2503
LB_2504:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2446~2'(= a2◂ [ *{ rr{| l |}}] ) %2445~1'(= r ) %2444~0'(= r ) %2442~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2441~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2462~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2445~1'(= r ) %2444~0'(= r ) %2442~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2441~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2463~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2445~1'(= r ) %2444~0'(= r ) %2442~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2441~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 9'(= a30◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2103
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2503
LB_2503:
	cmp BYTE [r8+6],0
	jnz LB_2471
	POP_GRM_SCC
	ret
LB_2471:
	RB_GRM
	jmp LB_2512
LB_2511:
	add r14,1 
LB_2512:
	cmp r14,r9
	jge LB_2513
	JZ_SPC BYTE [r13+8+r14], LB_2511
LB_2513
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_2516
	jmp LB_2517
LB_2516:
	jmp LB_2514
LB_2517:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2515
LB_2514:
	add rsp,0
	jmp LB_2510
LB_2515:
	jmp LB_2519
LB_2518:
	add r14,1 
LB_2519:
	cmp r14,r9
	jge LB_2520
	JZ_SPC BYTE [r13+8+r14], LB_2518
LB_2520
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2523
	jmp LB_2524
LB_2523:
	mov r8,unt_1
	jmp LB_2521
LB_2524:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2525
	cmp BYTE [rdi+1],151
	jnz LB_2525
	cmp BYTE [rdi+2],130
	jnz LB_2525
	jmp LB_2526
LB_2525:
	mov r8,unt_1
	jmp LB_2521
LB_2526:
	add r14,3
	jmp LB_2522
LB_2521:
	add rsp,8
	jmp LB_2510
LB_2522:
	jmp LB_2528
LB_2527:
	add r14,1 
LB_2528:
	cmp r14,r9
	jge LB_2529
	JZ_SPC BYTE [r13+8+r14], LB_2527
LB_2529
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_2532
	jmp LB_2533
LB_2532:
	jmp LB_2530
LB_2533:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2531
LB_2530:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2531:
	jmp LB_2535
LB_2534:
	add r14,1 
LB_2535:
	cmp r14,r9
	jge LB_2536
	JZ_SPC BYTE [r13+8+r14], LB_2534
LB_2536
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2539
	jmp LB_2540
LB_2539:
	mov r8,unt_1
	jmp LB_2537
LB_2540:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_2541
	jmp LB_2542
LB_2541:
	mov r8,unt_1
	jmp LB_2537
LB_2542:
	add r14,1
	jmp LB_2538
LB_2537:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2538:
	jmp LB_2544
LB_2543:
	add r14,1 
LB_2544:
	cmp r14,r9
	jge LB_2545
	JZ_SPC BYTE [r13+8+r14], LB_2543
LB_2545
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_2548
	jmp LB_2549
LB_2548:
	jmp LB_2546
LB_2549:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2547
LB_2546:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2547:
	PUSH_GRM
	jmp LB_2553
LB_2552:
	add r14,1 
LB_2553:
	cmp r14,r9
	jge LB_2554
	JZ_SPC BYTE [r13+8+r14], LB_2552
LB_2554
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2557
	jmp LB_2558
LB_2557:
	mov r8,unt_1
	jmp LB_2555
LB_2558:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2559
	cmp BYTE [rdi+1],138
	jnz LB_2559
	cmp BYTE [rdi+2],162
	jnz LB_2559
	cmp BYTE [rdi+3],124
	jnz LB_2559
	jmp LB_2560
LB_2559:
	mov r8,unt_1
	jmp LB_2555
LB_2560:
	add r14,4
	jmp LB_2556
LB_2555:
	add rsp,0
	jmp LB_2551
LB_2556:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2561
LB_2561
;; rsp=0 , %2470~1'(= r ) %2469~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2471~1(<2)◂{ } %2470~1'(= r ) %2469~0'(= r ) 
; #308 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2472~0(<2)◂1(<2)◂{ } %2470~1'(= r ) %2469~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2473~0(<2)◂0(<2)◂1(<2)◂{ } %2470~1'(= r ) %2469~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_2562
LB_2562:
	cmp BYTE [r8+6],0
	jnz LB_2551
	POP_GRM_SCC
	jmp LB_2550
LB_2551:
	RB_GRM
	jmp LB_2565
LB_2564:
	add r14,1 
LB_2565:
	cmp r14,r9
	jge LB_2566
	JZ_SPC BYTE [r13+8+r14], LB_2564
LB_2566
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2569
	jmp LB_2570
LB_2569:
	mov r8,unt_1
	jmp LB_2567
LB_2570:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2571
	cmp BYTE [rdi+1],138
	jnz LB_2571
	cmp BYTE [rdi+2],162
	jnz LB_2571
	jmp LB_2572
LB_2571:
	mov r8,unt_1
	jmp LB_2567
LB_2572:
	add r14,3
	jmp LB_2568
LB_2567:
	add rsp,0
	jmp LB_2563
LB_2568:
	jmp LB_2574
LB_2573:
	add r14,1 
LB_2574:
	cmp r14,r9
	jge LB_2575
	JZ_SPC BYTE [r13+8+r14], LB_2573
LB_2575
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2578
	jmp LB_2579
LB_2578:
	jmp LB_2576
LB_2579:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2577
LB_2576:
	add rsp,0
	jmp LB_2563
LB_2577:
	jmp LB_2581
LB_2580:
	add r14,1 
LB_2581:
	cmp r14,r9
	jge LB_2582
	JZ_SPC BYTE [r13+8+r14], LB_2580
LB_2582
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2585
	jmp LB_2586
LB_2585:
	jmp LB_2583
LB_2586:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2584
LB_2583:
	add rsp,8
	jmp LB_2563
LB_2584:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2587
LB_2587
;; rsp=2 , %2477~1'(= r ) %2476~0'(= r ) %2475~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2474~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2590
	jmp LB_2591
LB_2590:
	jmp LB_2589
LB_2591:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2479~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2477~1'(= r ) %2476~0'(= r ) %2474~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2480~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2477~1'(= r ) %2476~0'(= r ) 
; #308 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2481~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2477~1'(= r ) %2476~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2482~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2477~1'(= r ) %2476~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010000010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_2588
LB_2589:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2478~2'(= a2◂ [ *{ rr{| l |}}] ) %2477~1'(= r ) %2476~0'(= r ) %2474~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2483~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2477~1'(= r ) %2476~0'(= r ) %2474~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2484~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2477~1'(= r ) %2476~0'(= r ) %2474~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_2588
LB_2588:
	cmp BYTE [r8+6],0
	jnz LB_2563
	POP_GRM_SCC
	jmp LB_2550
LB_2563:
	POP_GRM_FAIL 
	jmp LB_2550
LB_2550:
	cmp BYTE [r8+6],0
	jnz LB_2592
	jmp LB_2593
LB_2592:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2593:
	mov QWORD [rsp+8*3],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2594
LB_2594
;; rsp=3 , %2485~3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %2468~1'(= r ) %2467~0'(= r ) %2466~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2464~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2597
	jmp LB_2598
LB_2597:
	jmp LB_2596
LB_2598:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2487~2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2468~1'(= r ) %2467~0'(= r ) %2466~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2464~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a17◂ [ a25◂ [ {| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2600
	jmp LB_2601
LB_2600:
	jmp LB_2599
LB_2601:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=3 , %2489~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2488~3'(= a17◂ [ a25◂ [ {| l |}]] ) %2468~1'(= r ) %2467~0'(= r ) %2466~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2464~8'(= a47◂ [ *{ }] ) 
; #168 { 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2490~1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } %2489~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2468~1'(= r ) %2467~0'(= r ) %2464~8'(= a47◂ [ *{ }] ) 
; #176 { 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2491~2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2468~1'(= r ) %2467~0'(= r ) %2464~8'(= a47◂ [ *{ }] ) 
; #308 2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2492~0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2468~1'(= r ) %2467~0'(= r ) %2464~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2493~0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2468~1'(= r ) %2467~0'(= r ) %2464~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 001110000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],1
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r10
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2595
LB_2599:
;; ?. 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2468~1'(= r ) %2467~0'(= r ) %2466~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2464~8'(= a47◂ [ *{ }] ) 
; #177 { 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2494~1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2468~1'(= r ) %2467~0'(= r ) %2464~8'(= a47◂ [ *{ }] ) 
; #308 1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2495~0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2468~1'(= r ) %2467~0'(= r ) %2464~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2496~0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2468~1'(= r ) %2467~0'(= r ) %2464~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 001000000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2595
LB_2596:
;; ?. 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2486~2'(= a2◂ [ *{ rr{| l |}}] ) %2468~1'(= r ) %2467~0'(= r ) %2466~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2464~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2497~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2468~1'(= r ) %2467~0'(= r ) %2466~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2464~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2498~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2468~1'(= r ) %2467~0'(= r ) %2466~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2464~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2090
	C_POP_REGS
; .dlt.ptn 9'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2102
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2595
LB_2595:
	cmp BYTE [r8+6],0
	jnz LB_2510
	POP_GRM_SCC
	ret
LB_2510:
	RB_GRM
	jmp LB_2604
LB_2603:
	add r14,1 
LB_2604:
	cmp r14,r9
	jge LB_2605
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2603
LB_2605
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_2608
	jmp LB_2609
LB_2608:
	jmp LB_2606
LB_2609:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2607
LB_2606:
	add rsp,0
	jmp LB_2602
LB_2607:
	jmp LB_2611
LB_2610:
	add r14,1 
LB_2611:
	cmp r14,r9
	jge LB_2612
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2610
LB_2612
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_2615
	jmp LB_2616
LB_2615:
	jmp LB_2613
LB_2616:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2614
LB_2613:
	add rsp,8
	jmp LB_2602
LB_2614:
	jmp LB_2618
LB_2617:
	add r14,1 
LB_2618:
	cmp r14,r9
	jge LB_2619
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2617
LB_2619
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_2622
	jmp LB_2623
LB_2622:
	jmp LB_2620
LB_2623:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2621
LB_2620:
	add rsp,16
	jmp LB_2602
LB_2621:
	PUSH_GRM
	jmp LB_2627
LB_2626:
	add r14,1 
LB_2627:
	cmp r14,r9
	jge LB_2628
	JZ_SPC BYTE [r13+8+r14], LB_2626
LB_2628
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2631
	jmp LB_2632
LB_2631:
	mov r8,unt_1
	jmp LB_2629
LB_2632:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2633
	cmp BYTE [rdi+1],138
	jnz LB_2633
	cmp BYTE [rdi+2],162
	jnz LB_2633
	cmp BYTE [rdi+3],124
	jnz LB_2633
	jmp LB_2634
LB_2633:
	mov r8,unt_1
	jmp LB_2629
LB_2634:
	add r14,4
	jmp LB_2630
LB_2629:
	add rsp,0
	jmp LB_2625
LB_2630:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2635
LB_2635
;; rsp=0 , %2505~1'(= r ) %2504~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2506~1(<2)◂{ } %2505~1'(= r ) %2504~0'(= r ) 
; #308 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2507~0(<2)◂1(<2)◂{ } %2505~1'(= r ) %2504~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2508~0(<2)◂0(<2)◂1(<2)◂{ } %2505~1'(= r ) %2504~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_2636
LB_2636:
	cmp BYTE [r8+6],0
	jnz LB_2625
	POP_GRM_SCC
	jmp LB_2624
LB_2625:
	RB_GRM
	jmp LB_2639
LB_2638:
	add r14,1 
LB_2639:
	cmp r14,r9
	jge LB_2640
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2638
LB_2640
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2643
	jmp LB_2644
LB_2643:
	mov r8,unt_1
	jmp LB_2641
LB_2644:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2645
	cmp BYTE [rdi+1],138
	jnz LB_2645
	cmp BYTE [rdi+2],162
	jnz LB_2645
	jmp LB_2646
LB_2645:
	mov r8,unt_1
	jmp LB_2641
LB_2646:
	add r14,3
	jmp LB_2642
LB_2641:
	add rsp,0
	jmp LB_2637
LB_2642:
	jmp LB_2648
LB_2647:
	add r14,1 
LB_2648:
	cmp r14,r9
	jge LB_2649
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2647
LB_2649
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2652
	jmp LB_2653
LB_2652:
	jmp LB_2650
LB_2653:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2651
LB_2650:
	add rsp,0
	jmp LB_2637
LB_2651:
	jmp LB_2655
LB_2654:
	add r14,1 
LB_2655:
	cmp r14,r9
	jge LB_2656
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2654
LB_2656
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2659
	jmp LB_2660
LB_2659:
	mov r8,unt_1
	jmp LB_2657
LB_2660:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2661
	jmp LB_2662
LB_2661:
	mov r8,unt_1
	jmp LB_2657
LB_2662:
	add r14,1
	jmp LB_2658
LB_2657:
	add rsp,8
	jmp LB_2637
LB_2658:
	jmp LB_2664
LB_2663:
	add r14,1 
LB_2664:
	cmp r14,r9
	jge LB_2665
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2663
LB_2665
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2668
	jmp LB_2669
LB_2668:
	jmp LB_2666
LB_2669:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2667
LB_2666:
	add rsp,8
	POP_GRM_FAIL
	jmp LB_2624
LB_2667:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2670
LB_2670
;; rsp=2 , %2512~1'(= r ) %2511~0'(= r ) %2510~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2509~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2673
	jmp LB_2674
LB_2673:
	jmp LB_2672
LB_2674:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2514~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2512~1'(= r ) %2511~0'(= r ) %2509~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2515~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2512~1'(= r ) %2511~0'(= r ) 
; #308 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2516~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2512~1'(= r ) %2511~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2517~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2512~1'(= r ) %2511~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010000010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_2671
LB_2672:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2513~2'(= a2◂ [ *{ rr{| l |}}] ) %2512~1'(= r ) %2511~0'(= r ) %2509~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2518~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2512~1'(= r ) %2511~0'(= r ) %2509~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2519~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2512~1'(= r ) %2511~0'(= r ) %2509~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_2671
LB_2671:
	cmp BYTE [r8+6],0
	jnz LB_2637
	POP_GRM_SCC
	jmp LB_2624
LB_2637:
	RB_GRM
	jmp LB_2677
LB_2676:
	add r14,1 
LB_2677:
	cmp r14,r9
	jge LB_2678
	JZ_SPC BYTE [r13+8+r14], LB_2676
LB_2678
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2681
	jmp LB_2682
LB_2681:
	jmp LB_2679
LB_2682:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_2680
LB_2679:
	add rsp,0
	jmp LB_2675
LB_2680:
	jmp LB_2684
LB_2683:
	add r14,1 
LB_2684:
	cmp r14,r9
	jge LB_2685
	JZ_SPC BYTE [r13+8+r14], LB_2683
LB_2685
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2688
	jmp LB_2689
LB_2688:
	jmp LB_2686
LB_2689:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2687
LB_2686:
	add rsp,16
	jmp LB_2675
LB_2687:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2690
LB_2690
;; rsp=3 , %2524~1'(= r ) %2523~0'(= r ) %2522~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2521~9'(= r ) %2520~8'(= r ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2693
	jmp LB_2694
LB_2693:
	jmp LB_2692
LB_2694:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2526~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2524~1'(= r ) %2523~0'(= r ) %2521~9'(= r ) %2520~8'(= r ) 
; $ %[ "lc_code 20" ] ⊢ %[ "lc_code 20" ]
;; rsp=3 , %2527~%[ "lc_code 20" ] %2526~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2524~1'(= r ) %2523~0'(= r ) %2521~9'(= r ) %2520~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2528~1(<2)◂{ } %2527~%[ "lc_code 20" ] %2526~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2524~1'(= r ) %2523~0'(= r ) %2521~9'(= r ) %2520~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2529~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2526~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2524~1'(= r ) %2523~0'(= r ) 
; #307 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2530~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2526~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2524~1'(= r ) %2523~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2531~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2526~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2524~1'(= r ) %2523~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],10
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],50
	mov BYTE [rax+8+9],48
	mov r14,rax
	mov rax,r14
	mov QWORD [r13+24],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,unt_1
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2691
LB_2692:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2525~2'(= a2◂ [ *{ rr{| l |}}] ) %2524~1'(= r ) %2523~0'(= r ) %2521~9'(= r ) %2520~8'(= r ) 
; $ %[ "lc_code 21" ] ⊢ %[ "lc_code 21" ]
;; rsp=3 , %2532~%[ "lc_code 21" ] %2525~2'(= a2◂ [ *{ rr{| l |}}] ) %2524~1'(= r ) %2523~0'(= r ) %2521~9'(= r ) %2520~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2533~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2524~1'(= r ) %2523~0'(= r ) 
; #307 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2534~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2524~1'(= r ) %2523~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2535~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2524~1'(= r ) %2523~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00100000110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r14,rax
	mov r9,QWORD [rsp-8+8*3]
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*2]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],10
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],50
	mov BYTE [rax+8+9],49
	mov r9,rax
	mov rax,r9
	mov QWORD [r14+24],rax
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2691
LB_2691:
	cmp BYTE [r8+6],0
	jnz LB_2675
	POP_GRM_SCC
	jmp LB_2624
LB_2675:
	POP_GRM_FAIL 
	jmp LB_2624
LB_2624:
	cmp BYTE [r8+6],0
	jnz LB_2695
	jmp LB_2696
LB_2695:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2696:
	mov QWORD [rsp+8*3],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2697
LB_2697
;; rsp=3 , %2536~3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %2503~1'(= r ) %2502~0'(= r ) %2501~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2500~9'(= a18◂ [ ] ) %2499~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2700
	jmp LB_2701
LB_2700:
	jmp LB_2699
LB_2701:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2538~2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2503~1'(= r ) %2502~0'(= r ) %2501~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2500~9'(= a18◂ [ ] ) %2499~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a17◂ [ a25◂ [ {| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2703
	jmp LB_2704
LB_2703:
	jmp LB_2702
LB_2704:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=3 , %2540~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2539~3'(= a17◂ [ a25◂ [ {| l |}]] ) %2503~1'(= r ) %2502~0'(= r ) %2501~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2500~9'(= a18◂ [ ] ) %2499~8'(= a47◂ [ *{ }] ) 
; #169 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2541~0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } %2540~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2503~1'(= r ) %2502~0'(= r ) %2499~8'(= a47◂ [ *{ }] ) 
; #176 { 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2542~2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2503~1'(= r ) %2502~0'(= r ) %2499~8'(= a47◂ [ *{ }] ) 
; #308 2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2543~0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2503~1'(= r ) %2502~0'(= r ) %2499~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2544~0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2503~1'(= r ) %2502~0'(= r ) %2499~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 001110000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r10
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2698
LB_2702:
;; ?. 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2503~1'(= r ) %2502~0'(= r ) %2501~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2500~9'(= a18◂ [ ] ) %2499~8'(= a47◂ [ *{ }] ) 
; #178 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2545~0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2503~1'(= r ) %2502~0'(= r ) %2499~8'(= a47◂ [ *{ }] ) 
; #308 0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2546~0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2503~1'(= r ) %2502~0'(= r ) %2499~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2547~0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2503~1'(= r ) %2502~0'(= r ) %2499~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 001000000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2698
LB_2699:
;; ?. 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2537~2'(= a2◂ [ *{ rr{| l |}}] ) %2503~1'(= r ) %2502~0'(= r ) %2501~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2500~9'(= a18◂ [ ] ) %2499~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2548~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2503~1'(= r ) %2502~0'(= r ) %2501~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2500~9'(= a18◂ [ ] ) %2499~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2549~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2503~1'(= r ) %2502~0'(= r ) %2501~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2500~9'(= a18◂ [ ] ) %2499~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2090
	C_POP_REGS
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2698
LB_2698:
	cmp BYTE [r8+6],0
	jnz LB_2602
	POP_GRM_SCC
	ret
LB_2602:
	RB_GRM
	jmp LB_2707
LB_2706:
	add r14,1 
LB_2707:
	cmp r14,r9
	jge LB_2708
	JZ_SPC BYTE [r13+8+r14], LB_2706
LB_2708
	call GRM_340
	cmp BYTE [r8+6],0
	jnz LB_2711
	jmp LB_2712
LB_2711:
	jmp LB_2709
LB_2712:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_2710
LB_2709:
	add rsp,0
	jmp LB_2705
LB_2710:
	PUSH_GRM
	jmp LB_2716
LB_2715:
	add r14,1 
LB_2716:
	cmp r14,r9
	jge LB_2717
	JZ_SPC BYTE [r13+8+r14], LB_2715
LB_2717
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2720
	jmp LB_2721
LB_2720:
	jmp LB_2718
LB_2721:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2719
LB_2718:
	add rsp,0
	jmp LB_2714
LB_2719:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2722
LB_2722
;; rsp=1 , %2555~1'(= r ) %2554~0'(= r ) %2553~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
; #26 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2556~0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2555~1'(= r ) %2554~0'(= r ) 
; ∎ 0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
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
; .mov_ptn2 0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2723
LB_2723:
	cmp BYTE [r8+6],0
	jnz LB_2714
	POP_GRM_SCC
	jmp LB_2713
LB_2714:
	RB_GRM
	jmp LB_2726
LB_2725:
	add r14,1 
LB_2726:
	cmp r14,r9
	jge LB_2727
	JZ_SPC BYTE [r13+8+r14], LB_2725
LB_2727
	call GRM_339
	cmp BYTE [r8+6],0
	jnz LB_2730
	jmp LB_2731
LB_2730:
	jmp LB_2728
LB_2731:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_2729
LB_2728:
	add rsp,0
	jmp LB_2724
LB_2729:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2732
LB_2732
;; rsp=0 , %2559~1'(= r ) %2558~0'(= r ) %2557~{ } 
; $ %[ "lc_code 11" ] ⊢ %[ "lc_code 11" ]
;; rsp=0 , %2560~%[ "lc_code 11" ] %2559~1'(= r ) %2558~0'(= r ) %2557~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2561~1(<2)◂{ } %2560~%[ "lc_code 11" ] %2559~1'(= r ) %2558~0'(= r ) %2557~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2562~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2557~{ } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2563~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2557~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2564~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2557~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],10
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],49
	mov BYTE [rax+8+9],49
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_2733
LB_2733:
	cmp BYTE [r8+6],0
	jnz LB_2724
	POP_GRM_SCC
	jmp LB_2713
LB_2724:
	POP_GRM_FAIL 
	jmp LB_2713
LB_2713:
	cmp BYTE [r8+6],0
	jnz LB_2734
	jmp LB_2735
LB_2734:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_2735:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2736
LB_2736
;; rsp=0 , %2565~3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2552~1'(= r ) %2551~0'(= r ) %2550~{ } 
;; ? 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2739
	jmp LB_2740
LB_2739:
	jmp LB_2738
LB_2740:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2567~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2552~1'(= r ) %2551~0'(= r ) %2550~{ } 
; $ %[ "lc_code 9" ] ⊢ %[ "lc_code 9" ]
;; rsp=0 , %2568~%[ "lc_code 9" ] %2567~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2552~1'(= r ) %2551~0'(= r ) %2550~{ } 
; #311 { 0'(= r ) 1'(= r ) %[ "lc_code 9" ] } ⊢ 0'(= a47◂ [ q0] )
	sub rsp,8
	mov QWORD [rsp+0],r8
; .mov_ptn2 { 0'(= r ) 1'(= r ) %[ "lc_code 9" ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) }
; {| 1110000010.. |}
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],9
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],57
	mov r8,rax
	call LB_2741
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %2569~0'(= a47◂ [ q0] ) %2567~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2550~{ } 
; #26 0'(= a47◂ [ q0] ) ⊢ 0(<2)◂0'(= a47◂ [ q0] )
;; rsp=0 , %2570~0(<2)◂0'(= a47◂ [ q0] ) %2567~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2550~{ } 
; ∎ 0(<2)◂0'(= a47◂ [ q0] )
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
	C_POP_REGS
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂0'(= a47◂ [ q0] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 1010.. |}
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_2737
LB_2738:
;; ?. 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2566~2'(= a2◂ [ *{ rr{| l |}}] ) %2552~1'(= r ) %2551~0'(= r ) %2550~{ } 
; $ %[ "lc_code 10" ] ⊢ %[ "lc_code 10" ]
;; rsp=0 , %2571~%[ "lc_code 10" ] %2566~2'(= a2◂ [ *{ rr{| l |}}] ) %2552~1'(= r ) %2551~0'(= r ) %2550~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2572~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2550~{ } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2573~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2550~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2574~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2550~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 1110.. |}
	mov r9,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r10,rax
	mov r11,r13
	mov rax,r11
	mov QWORD [r10+8],rax
	mov r11,r14
	mov rax,r11
	mov QWORD [r10+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],10
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],49
	mov BYTE [rax+8+9],48
	mov r11,rax
	mov rax,r11
	mov QWORD [r10+24],rax
	mov rax,r10
	mov QWORD [r8+8],rax
	mov r10,r9
	mov rax,r10
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_2737
LB_2737:
	cmp BYTE [r8+6],0
	jnz LB_2705
	POP_GRM_SCC
	ret
LB_2705:
	POP_GRM_FAIL 
	ret
ETR_349:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_349
	ret
GRM_349:
	PUSH_GRM
	jmp LB_2744
LB_2743:
	add r14,1 
LB_2744:
	cmp r14,r9
	jge LB_2745
	JZ_SPC BYTE [r13+8+r14], LB_2743
LB_2745
	call GRM_353
	cmp BYTE [r8+6],0
	jnz LB_2748
	jmp LB_2749
LB_2748:
	jmp LB_2746
LB_2749:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2747
LB_2746:
	add rsp,0
	jmp LB_2742
LB_2747:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2750
LB_2750
;; rsp=1 , %2577~1'(= r ) %2576~0'(= r ) %2575~8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2753
	jmp LB_2754
LB_2753:
	jmp LB_2752
LB_2754:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2579~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2577~1'(= r ) %2576~0'(= r ) 
; #171 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2580~0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2577~1'(= r ) %2576~0'(= r ) 
; #308 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2581~0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2577~1'(= r ) %2576~0'(= r ) 
; #26 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2582~0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2577~1'(= r ) %2576~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2751
LB_2752:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2578~2'(= a2◂ [ *{ rr{| l |}}] ) %2577~1'(= r ) %2576~0'(= r ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2583~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2577~1'(= r ) %2576~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2584~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2577~1'(= r ) %2576~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2751
LB_2751:
	cmp BYTE [r8+6],0
	jnz LB_2742
	POP_GRM_SCC
	ret
LB_2742:
	RB_GRM
	jmp LB_2757
LB_2756:
	add r14,1 
LB_2757:
	cmp r14,r9
	jge LB_2758
	JZ_SPC BYTE [r13+8+r14], LB_2756
LB_2758
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2761
	jmp LB_2762
LB_2761:
	jmp LB_2759
LB_2762:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2760
LB_2759:
	add rsp,0
	jmp LB_2755
LB_2760:
	jmp LB_2764
LB_2763:
	add r14,1 
LB_2764:
	cmp r14,r9
	jge LB_2765
	JZ_SPC BYTE [r13+8+r14], LB_2763
LB_2765
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_2768
	jmp LB_2769
LB_2768:
	jmp LB_2766
LB_2769:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2767
LB_2766:
	add rsp,8
	jmp LB_2755
LB_2767:
	jmp LB_2771
LB_2770:
	add r14,1 
LB_2771:
	cmp r14,r9
	jge LB_2772
	JZ_SPC BYTE [r13+8+r14], LB_2770
LB_2772
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2775
	jmp LB_2776
LB_2775:
	jmp LB_2773
LB_2776:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2774
LB_2773:
	add rsp,16
	jmp LB_2755
LB_2774:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2777
LB_2777
;; rsp=3 , %2589~1'(= r ) %2588~0'(= r ) %2587~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2586~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2585~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2780
	jmp LB_2781
LB_2780:
	jmp LB_2779
LB_2781:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2591~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2589~1'(= r ) %2588~0'(= r ) %2586~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2585~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=3 , %2592~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %2591~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2589~1'(= r ) %2588~0'(= r ) 
; #170 { 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2593~1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2589~1'(= r ) %2588~0'(= r ) 
; #308 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2594~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2589~1'(= r ) %2588~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2595~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2589~1'(= r ) %2588~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 00100000110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r14,rax
	mov r9,QWORD [rsp-8+8*3]
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*2]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov BYTE [r14+6],0
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2778
LB_2779:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2590~2'(= a2◂ [ *{ rr{| l |}}] ) %2589~1'(= r ) %2588~0'(= r ) %2586~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2585~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2596~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2589~1'(= r ) %2588~0'(= r ) %2586~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2585~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2597~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2589~1'(= r ) %2588~0'(= r ) %2586~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2585~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2032
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2778
LB_2778:
	cmp BYTE [r8+6],0
	jnz LB_2755
	POP_GRM_SCC
	ret
LB_2755:
	POP_GRM_FAIL 
	ret
ETR_350:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_350
	ret
GRM_350:
	PUSH_GRM
	jmp LB_2784
LB_2783:
	add r14,1 
LB_2784:
	cmp r14,r9
	jge LB_2785
	JZ_SPC BYTE [r13+8+r14], LB_2783
LB_2785
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2788
	jmp LB_2789
LB_2788:
	mov r8,unt_1
	jmp LB_2786
LB_2789:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2790
	cmp BYTE [rdi+1],94
	jnz LB_2790
	jmp LB_2791
LB_2790:
	mov r8,unt_1
	jmp LB_2786
LB_2791:
	add r14,2
	jmp LB_2787
LB_2786:
	add rsp,0
	jmp LB_2782
LB_2787:
	jmp LB_2793
LB_2792:
	add r14,1 
LB_2793:
	cmp r14,r9
	jge LB_2794
	JZ_SPC BYTE [r13+8+r14], LB_2792
LB_2794
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2797
	jmp LB_2798
LB_2797:
	jmp LB_2795
LB_2798:
	sub rsp,16
; .mov_ptn2 2'(= *{ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]a2◂ [ a25◂ [ {| l |}]]} ) ⊢ { 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_2796
LB_2795:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_2796:
	jmp LB_2800
LB_2799:
	add r14,1 
LB_2800:
	cmp r14,r9
	jge LB_2801
	JZ_SPC BYTE [r13+8+r14], LB_2799
LB_2801
	call GRM_347
	cmp BYTE [r8+6],0
	jnz LB_2804
	jmp LB_2805
LB_2804:
	jmp LB_2802
LB_2805:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2803
LB_2802:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2803:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2806
LB_2806
;; rsp=3 , %2602~1'(= r ) %2601~0'(= r ) %2600~10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2599~9'(= a2◂ [ a25◂ [ {| l |}]] ) %2598~8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #166 { 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2603~3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %2602~1'(= r ) %2601~0'(= r ) 
; #26 3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2604~0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %2602~1'(= r ) %2601~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
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
; .mov_ptn2 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a30◂ [ a18◂ [ ]{| l |}]] )
; {| 001000001110.. |}
	ALC_RCD 3, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*3]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+24],rax
	mov BYTE [r8+6],3
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2807
LB_2807:
	cmp BYTE [r8+6],0
	jnz LB_2782
	POP_GRM_SCC
	ret
LB_2782:
	RB_GRM
	jmp LB_2810
LB_2809:
	add r14,1 
LB_2810:
	cmp r14,r9
	jge LB_2811
	JZ_SPC BYTE [r13+8+r14], LB_2809
LB_2811
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_2814
	jmp LB_2815
LB_2814:
	jmp LB_2812
LB_2815:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2813
LB_2812:
	add rsp,0
	jmp LB_2808
LB_2813:
	jmp LB_2817
LB_2816:
	add r14,1 
LB_2817:
	cmp r14,r9
	jge LB_2818
	JZ_SPC BYTE [r13+8+r14], LB_2816
LB_2818
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2821
	jmp LB_2822
LB_2821:
	mov r8,unt_1
	jmp LB_2819
LB_2822:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2823
	jmp LB_2824
LB_2823:
	mov r8,unt_1
	jmp LB_2819
LB_2824:
	add r14,1
	jmp LB_2820
LB_2819:
	add rsp,8
	jmp LB_2808
LB_2820:
	jmp LB_2826
LB_2825:
	add r14,1 
LB_2826:
	cmp r14,r9
	jge LB_2827
	JZ_SPC BYTE [r13+8+r14], LB_2825
LB_2827
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2830
	jmp LB_2831
LB_2830:
	mov r8,unt_1
	jmp LB_2828
LB_2831:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2832
	cmp BYTE [rdi+1],138
	jnz LB_2832
	cmp BYTE [rdi+2],162
	jnz LB_2832
	jmp LB_2833
LB_2832:
	mov r8,unt_1
	jmp LB_2828
LB_2833:
	add r14,3
	jmp LB_2829
LB_2828:
	add rsp,8
	jmp LB_2808
LB_2829:
	jmp LB_2835
LB_2834:
	add r14,1 
LB_2835:
	cmp r14,r9
	jge LB_2836
	JZ_SPC BYTE [r13+8+r14], LB_2834
LB_2836
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2839
	jmp LB_2840
LB_2839:
	jmp LB_2837
LB_2840:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2838
LB_2837:
	add rsp,8
	jmp LB_2808
LB_2838:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2841
LB_2841
;; rsp=2 , %2608~1'(= r ) %2607~0'(= r ) %2606~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2605~8'(= a27◂ [ a18◂ [ ]] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2609~1(<2)◂{ } %2608~1'(= r ) %2607~0'(= r ) %2606~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2605~8'(= a27◂ [ a18◂ [ ]] ) 
; #113 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %2610~0(<2)◂1(<2)◂{ } %2608~1'(= r ) %2607~0'(= r ) %2606~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2605~8'(= a27◂ [ a18◂ [ ]] ) 
; #167 { 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %2611~2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } %2608~1'(= r ) %2607~0'(= r ) 
; #26 2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %2612~0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } %2608~1'(= r ) %2607~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) }
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
; .mov_ptn2 0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a30◂ [ a18◂ [ ]{| l |}]] )
; {| 00100000110.. |}
	ALC_RCD 3, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r13
	mov r13,rax
	mov rax,r13
	mov QWORD [r8+16],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+24],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_2842
LB_2842:
	cmp BYTE [r8+6],0
	jnz LB_2808
	POP_GRM_SCC
	ret
LB_2808:
	POP_GRM_FAIL 
	ret
ETR_351:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_351
	ret
GRM_351:
	PUSH_GRM
	jmp LB_2845
LB_2844:
	add r14,1 
LB_2845:
	cmp r14,r9
	jge LB_2846
	JZ_SPC BYTE [r13+8+r14], LB_2844
LB_2846
	call GRM_302
	cmp BYTE [r8+6],0
	jnz LB_2849
	jmp LB_2850
LB_2849:
	jmp LB_2847
LB_2850:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_2848
LB_2847:
	add rsp,0
	jmp LB_2843
LB_2848:
	jmp LB_2852
LB_2851:
	add r14,1 
LB_2852:
	cmp r14,r9
	jge LB_2853
	JZ_SPC BYTE [r13+8+r14], LB_2851
LB_2853
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2856
	jmp LB_2857
LB_2856:
	mov r8,unt_1
	jmp LB_2854
LB_2857:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2858
	cmp BYTE [rdi+1],138
	jnz LB_2858
	cmp BYTE [rdi+2],162
	jnz LB_2858
	jmp LB_2859
LB_2858:
	mov r8,unt_1
	jmp LB_2854
LB_2859:
	add r14,3
	jmp LB_2855
LB_2854:
	add rsp,0
	jmp LB_2843
LB_2855:
	jmp LB_2861
LB_2860:
	add r14,1 
LB_2861:
	cmp r14,r9
	jge LB_2862
	JZ_SPC BYTE [r13+8+r14], LB_2860
LB_2862
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_2865
	jmp LB_2866
LB_2865:
	jmp LB_2863
LB_2866:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2864
LB_2863:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_2864:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2867
LB_2867
;; rsp=1 , %2616~1'(= r ) %2615~0'(= r ) %2614~8'(= a25◂ [ {| l |}] ) %2613~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2617~1(<2)◂{ } %2616~1'(= r ) %2615~0'(= r ) %2614~8'(= a25◂ [ {| l |}] ) %2613~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2618~1(<2)◂{ } %2617~1(<2)◂{ } %2616~1'(= r ) %2615~0'(= r ) %2614~8'(= a25◂ [ {| l |}] ) %2613~{ } 
; #25 { 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } }
;; rsp=1 , %2619~0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } %2617~1(<2)◂{ } %2616~1'(= r ) %2615~0'(= r ) %2613~{ } 
; #26 { 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } }
;; rsp=1 , %2620~0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } } %2616~1'(= r ) %2615~0'(= r ) %2613~{ } 
; ∎ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } }
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
; .mov_ptn2 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]a2◂ [ a25◂ [ {| l |}]]}] )
; {| 0010000010.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,unt_1
	mov rax,r13
	mov QWORD [r8+8],rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,unt_1
	mov rax,r14
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,8
	jmp LB_2868
LB_2868:
	cmp BYTE [r8+6],0
	jnz LB_2843
	POP_GRM_SCC
	ret
LB_2843:
	RB_GRM
	jmp LB_2871
LB_2870:
	add r14,1 
LB_2871:
	cmp r14,r9
	jge LB_2872
	JZ_SPC BYTE [r13+8+r14], LB_2870
LB_2872
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_2875
	jmp LB_2876
LB_2875:
	jmp LB_2873
LB_2876:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2874
LB_2873:
	add rsp,0
	jmp LB_2869
LB_2874:
	jmp LB_2878
LB_2877:
	add r14,1 
LB_2878:
	cmp r14,r9
	jge LB_2879
	JZ_SPC BYTE [r13+8+r14], LB_2877
LB_2879
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_2882
	jmp LB_2883
LB_2882:
	jmp LB_2880
LB_2883:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2881
LB_2880:
	add rsp,8
	jmp LB_2869
LB_2881:
	jmp LB_2885
LB_2884:
	add r14,1 
LB_2885:
	cmp r14,r9
	jge LB_2886
	JZ_SPC BYTE [r13+8+r14], LB_2884
LB_2886
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2889
	jmp LB_2890
LB_2889:
	mov r8,unt_1
	jmp LB_2887
LB_2890:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2891
	cmp BYTE [rdi+1],138
	jnz LB_2891
	cmp BYTE [rdi+2],162
	jnz LB_2891
	jmp LB_2892
LB_2891:
	mov r8,unt_1
	jmp LB_2887
LB_2892:
	add r14,3
	jmp LB_2888
LB_2887:
	add rsp,16
	jmp LB_2869
LB_2888:
	jmp LB_2894
LB_2893:
	add r14,1 
LB_2894:
	cmp r14,r9
	jge LB_2895
	JZ_SPC BYTE [r13+8+r14], LB_2893
LB_2895
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_2898
	jmp LB_2899
LB_2898:
	jmp LB_2896
LB_2899:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 10'(= a25◂ [ {| l |}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2897
LB_2896:
	add rsp,16
	jmp LB_2869
LB_2897:
	jmp LB_2901
LB_2900:
	add r14,1 
LB_2901:
	cmp r14,r9
	jge LB_2902
	JZ_SPC BYTE [r13+8+r14], LB_2900
LB_2902
	call GRM_324
	cmp BYTE [r8+6],0
	jnz LB_2905
	jmp LB_2906
LB_2905:
	jmp LB_2903
LB_2906:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a25◂ [ {| l |}]] ) ⊢ 11'(= a2◂ [ a25◂ [ {| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2904
LB_2903:
	add rsp,24
	jmp LB_2869
LB_2904:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_2907
LB_2907
;; rsp=4 , %2626~1'(= r ) %2625~0'(= r ) %2624~11'(= a2◂ [ a25◂ [ {| l |}]] ) %2623~10'(= a25◂ [ {| l |}] ) %2622~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2621~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %2627~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2626~1'(= r ) %2625~0'(= r ) %2624~11'(= a2◂ [ a25◂ [ {| l |}]] ) %2623~10'(= a25◂ [ {| l |}] ) 
; #25 { 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=4 , %2628~0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } %2627~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2626~1'(= r ) %2625~0'(= r ) 
; #26 { 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } } ⊢ 0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } }
;; rsp=4 , %2629~0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } } %2626~1'(= r ) %2625~0'(= r ) 
; ∎ 0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } }
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
; .mov_ptn2 0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]a2◂ [ a25◂ [ {| l |}]]}] )
; {| 0010000011110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*4]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	mov rax,r13
	mov QWORD [r8+8],rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,QWORD [rsp-8+8*2]
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,QWORD [rsp-8+8*1]
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,32
	jmp LB_2908
LB_2908:
	cmp BYTE [r8+6],0
	jnz LB_2869
	POP_GRM_SCC
	ret
LB_2869:
	POP_GRM_FAIL 
	ret
ETR_352:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_352
	ret
GRM_352:
	PUSH_GRM
	jmp LB_2911
LB_2910:
	add r14,1 
LB_2911:
	cmp r14,r9
	jge LB_2912
	JZ_SPC BYTE [r13+8+r14], LB_2910
LB_2912
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_2915
	jmp LB_2916
LB_2915:
	jmp LB_2913
LB_2916:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2914
LB_2913:
	add rsp,0
	jmp LB_2909
LB_2914:
	jmp LB_2918
LB_2917:
	add r14,1 
LB_2918:
	cmp r14,r9
	jge LB_2919
	JZ_SPC BYTE [r13+8+r14], LB_2917
LB_2919
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2922
	jmp LB_2923
LB_2922:
	mov r8,unt_1
	jmp LB_2920
LB_2923:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2924
	cmp BYTE [rdi+1],136
	jnz LB_2924
	cmp BYTE [rdi+2],144
	jnz LB_2924
	cmp BYTE [rdi+3],46
	jnz LB_2924
	jmp LB_2925
LB_2924:
	mov r8,unt_1
	jmp LB_2920
LB_2925:
	add r14,4
	jmp LB_2921
LB_2920:
	add rsp,8
	jmp LB_2909
LB_2921:
	jmp LB_2927
LB_2926:
	add r14,1 
LB_2927:
	cmp r14,r9
	jge LB_2928
	JZ_SPC BYTE [r13+8+r14], LB_2926
LB_2928
	call GRM_354
	cmp BYTE [r8+6],0
	jnz LB_2931
	jmp LB_2932
LB_2931:
	jmp LB_2929
LB_2932:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2930
LB_2929:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2930:
	jmp LB_2934
LB_2933:
	add r14,1 
LB_2934:
	cmp r14,r9
	jge LB_2935
	JZ_SPC BYTE [r13+8+r14], LB_2933
LB_2935
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2938
	jmp LB_2939
LB_2938:
	jmp LB_2936
LB_2939:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2937
LB_2936:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2937:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2940
LB_2940
;; rsp=3 , %2634~1'(= r ) %2633~0'(= r ) %2632~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2631~9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2630~8'(= a47◂ [ *{ }] ) 
;; ? 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2943
	jmp LB_2944
LB_2943:
	jmp LB_2942
LB_2944:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2636~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2634~1'(= r ) %2633~0'(= r ) %2632~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2630~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2946
	jmp LB_2947
LB_2946:
	jmp LB_2945
LB_2947:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2638~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2636~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=3 , %2639~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2636~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #80 { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2640~1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #308 1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2641~0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2642~0(<2)◂0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r9
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r14
	mov r14,rax
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2941
LB_2945:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2637~3'(= a2◂ [ *{ rr{| l |}}] ) %2636~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2643~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2636~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2644~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2636~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2941
LB_2942:
;; ?. 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2635~2'(= a2◂ [ *{ rr{| l |}}] ) %2634~1'(= r ) %2633~0'(= r ) %2632~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2630~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2949
	jmp LB_2950
LB_2949:
	jmp LB_2948
LB_2950:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2646~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2635~2'(= a2◂ [ *{ rr{| l |}}] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2647~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2646~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2648~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2646~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_2941
LB_2948:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2645~3'(= a2◂ [ *{ rr{| l |}}] ) %2635~2'(= a2◂ [ *{ rr{| l |}}] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000100110.. |}
	mov r14,r9
	mov r13,r8
	call LB_1227
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=1 , %2649~2'(= a2◂ [ *{ rr{| l |}}] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2650~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2651~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2634~1'(= r ) %2633~0'(= r ) %2630~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2941
LB_2941:
	cmp BYTE [r8+6],0
	jnz LB_2909
	POP_GRM_SCC
	ret
LB_2909:
	RB_GRM
	jmp LB_2953
LB_2952:
	add r14,1 
LB_2953:
	cmp r14,r9
	jge LB_2954
	JZ_SPC BYTE [r13+8+r14], LB_2952
LB_2954
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_2957
	jmp LB_2958
LB_2957:
	jmp LB_2955
LB_2958:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2956
LB_2955:
	add rsp,0
	jmp LB_2951
LB_2956:
	jmp LB_2960
LB_2959:
	add r14,1 
LB_2960:
	cmp r14,r9
	jge LB_2961
	JZ_SPC BYTE [r13+8+r14], LB_2959
LB_2961
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2964
	jmp LB_2965
LB_2964:
	mov r8,unt_1
	jmp LB_2962
LB_2965:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2966
	cmp BYTE [rdi+1],136
	jnz LB_2966
	cmp BYTE [rdi+2],144
	jnz LB_2966
	jmp LB_2967
LB_2966:
	mov r8,unt_1
	jmp LB_2962
LB_2967:
	add r14,3
	jmp LB_2963
LB_2962:
	add rsp,8
	jmp LB_2951
LB_2963:
	jmp LB_2969
LB_2968:
	add r14,1 
LB_2969:
	cmp r14,r9
	jge LB_2970
	JZ_SPC BYTE [r13+8+r14], LB_2968
LB_2970
	call GRM_354
	cmp BYTE [r8+6],0
	jnz LB_2973
	jmp LB_2974
LB_2973:
	jmp LB_2971
LB_2974:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2972
LB_2971:
	add rsp,8
	jmp LB_2951
LB_2972:
	jmp LB_2976
LB_2975:
	add r14,1 
LB_2976:
	cmp r14,r9
	jge LB_2977
	JZ_SPC BYTE [r13+8+r14], LB_2975
LB_2977
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_2980
	jmp LB_2981
LB_2980:
	jmp LB_2978
LB_2981:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2979
LB_2978:
	add rsp,16
	jmp LB_2951
LB_2979:
	jmp LB_2983
LB_2982:
	add r14,1 
LB_2983:
	cmp r14,r9
	jge LB_2984
	JZ_SPC BYTE [r13+8+r14], LB_2982
LB_2984
	call GRM_352
	cmp BYTE [r8+6],0
	jnz LB_2987
	jmp LB_2988
LB_2987:
	jmp LB_2985
LB_2988:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_2986
LB_2985:
	add rsp,24
	jmp LB_2951
LB_2986:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_2989
LB_2989
;; rsp=4 , %2657~1'(= r ) %2656~0'(= r ) %2655~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2654~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2653~9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	cmp BYTE [rdi+6],0
	jnz LB_2992
	jmp LB_2993
LB_2992:
	jmp LB_2991
LB_2993:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2655~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2654~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2995
	jmp LB_2996
LB_2995:
	jmp LB_2994
LB_2996:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2661~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2655~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2998
	jmp LB_2999
LB_2998:
	jmp LB_2997
LB_2999:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2663~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2661~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=4 , %2664~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2663~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #81 { { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2665~0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #308 0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2666~0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2667~0(<2)◂0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 001110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r14,rax
	mov r11,r13
	mov rax,r11
	mov QWORD [r14+8],rax
	mov r11,r9
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r11
	mov r11,rax
	mov rax,r11
	mov QWORD [r14+16],rax
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r10
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_2990
LB_2997:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2662~4'(= a2◂ [ *{ rr{| l |}}] ) %2661~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #307 4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2668~1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2661~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2669~0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2661~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 001010.. |}
	mov r8,r10
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_2990
LB_2994:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2660~3'(= a2◂ [ *{ rr{| l |}}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2655~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3001
	jmp LB_3002
LB_3001:
	jmp LB_3000
LB_3002:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2671~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2660~3'(= a2◂ [ *{ rr{| l |}}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2672~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2671~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2673~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2671~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_2089
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_2990
LB_3000:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2670~4'(= a2◂ [ *{ rr{| l |}}] ) %2660~3'(= a2◂ [ *{ rr{| l |}}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #84 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 3'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1101100010001110.. |}
	mov r14,r10
	mov r13,r9
	call LB_1227
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=1 , %2674~3'(= a2◂ [ *{ rr{| l |}}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2675~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2676~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2659~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2990
LB_2991:
;; ?. 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2658~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2655~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2654~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_3004
	jmp LB_3005
LB_3004:
	jmp LB_3003
LB_3005:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2658~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2655~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3007
	jmp LB_3008
LB_3007:
	jmp LB_3006
LB_3008:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2680~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2658~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2681~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2680~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2682~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2680~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_2089
	C_POP_REGS
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_2990
LB_3006:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2679~4'(= a2◂ [ *{ rr{| l |}}] ) %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2658~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r9
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110100010001110.. |}
	mov r14,r10
	mov r13,r8
	call LB_1227
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=1 , %2683~2'(= a2◂ [ *{ rr{| l |}}] ) %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2684~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2685~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2678~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2990
LB_3003:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2677~3'(= a2◂ [ *{ rr{| l |}}] ) %2658~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2655~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3010
	jmp LB_3011
LB_3010:
	jmp LB_3009
LB_3011:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2687~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2677~3'(= a2◂ [ *{ rr{| l |}}] ) %2658~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1111000010001110.. |}
	mov r14,r9
	mov r13,r8
	call LB_1227
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=1 , %2688~2'(= a2◂ [ *{ rr{| l |}}] ) %2687~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2689~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2687~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2690~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2687~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_2089
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2990
LB_3009:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2686~4'(= a2◂ [ *{ rr{| l |}}] ) %2677~3'(= a2◂ [ *{ rr{| l |}}] ) %2658~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1111000010001110.. |}
	mov r14,r9
	mov r13,r8
	call LB_1227
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=1 , %2691~2'(= a2◂ [ *{ rr{| l |}}] ) %2686~4'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 111010001110.. |}
	mov r14,r10
	mov r13,r8
	call LB_1227
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=1 , %2692~2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2693~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2694~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2657~1'(= r ) %2656~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_2990
LB_2990:
	cmp BYTE [r8+6],0
	jnz LB_2951
	POP_GRM_SCC
	ret
LB_2951:
	POP_GRM_FAIL 
	ret
ETR_353:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_353
	ret
GRM_353:
	PUSH_GRM
	jmp LB_3014
LB_3013:
	add r14,1 
LB_3014:
	cmp r14,r9
	jge LB_3015
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3013
LB_3015
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3018
	jmp LB_3019
LB_3018:
	jmp LB_3016
LB_3019:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3017
LB_3016:
	add rsp,0
	jmp LB_3012
LB_3017:
	jmp LB_3021
LB_3020:
	add r14,1 
LB_3021:
	cmp r14,r9
	jge LB_3022
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3020
LB_3022
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3025
	jmp LB_3026
LB_3025:
	mov r8,unt_1
	jmp LB_3023
LB_3026:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3027
	cmp BYTE [rdi+1],136
	jnz LB_3027
	cmp BYTE [rdi+2],144
	jnz LB_3027
	cmp BYTE [rdi+3],46
	jnz LB_3027
	jmp LB_3028
LB_3027:
	mov r8,unt_1
	jmp LB_3023
LB_3028:
	add r14,4
	jmp LB_3024
LB_3023:
	add rsp,8
	jmp LB_3012
LB_3024:
	jmp LB_3030
LB_3029:
	add r14,1 
LB_3030:
	cmp r14,r9
	jge LB_3031
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3029
LB_3031
	call GRM_313
	cmp BYTE [r8+6],0
	jnz LB_3034
	jmp LB_3035
LB_3034:
	jmp LB_3032
LB_3035:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3033
LB_3032:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3033:
	jmp LB_3037
LB_3036:
	add r14,1 
LB_3037:
	cmp r14,r9
	jge LB_3038
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3036
LB_3038
	call GRM_357
	cmp BYTE [r8+6],0
	jnz LB_3041
	jmp LB_3042
LB_3041:
	jmp LB_3039
LB_3042:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3040
LB_3039:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_3040:
	jmp LB_3044
LB_3043:
	add r14,1 
LB_3044:
	cmp r14,r9
	jge LB_3045
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3043
LB_3045
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_3048
	jmp LB_3049
LB_3048:
	jmp LB_3046
LB_3049:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3047
LB_3046:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_3047:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_3050
LB_3050
;; rsp=4 , %2700~1'(= r ) %2699~0'(= r ) %2698~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2697~10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_3053
	jmp LB_3054
LB_3053:
	jmp LB_3052
LB_3054:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2702~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2700~1'(= r ) %2699~0'(= r ) %2698~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3056
	jmp LB_3057
LB_3056:
	jmp LB_3055
LB_3057:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2704~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2702~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=4 , %2705~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2702~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #80 { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %2706~1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2700~1'(= r ) %2699~0'(= r ) %2695~8'(= a47◂ [ *{ }] ) 
; #308 1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %2707~0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2700~1'(= r ) %2699~0'(= r ) %2695~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %2708~0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2700~1'(= r ) %2699~0'(= r ) %2695~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110000010.. |}
	mov r13,r8
	ALC_RCD 3, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov r14,r9
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r14
	mov r14,rax
	mov rax,r14
	mov QWORD [r8+24],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_3051
LB_3055:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2703~3'(= a2◂ [ *{ rr{| l |}}] ) %2702~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2709~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2702~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2710~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2702~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_3051
LB_3052:
;; ?. 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2701~2'(= a2◂ [ *{ rr{| l |}}] ) %2700~1'(= r ) %2699~0'(= r ) %2698~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3059
	jmp LB_3060
LB_3059:
	jmp LB_3058
LB_3060:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2712~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2701~2'(= a2◂ [ *{ rr{| l |}}] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2713~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2712~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2714~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2712~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_3051
LB_3058:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2711~3'(= a2◂ [ *{ rr{| l |}}] ) %2701~2'(= a2◂ [ *{ rr{| l |}}] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 111100001100110.. |}
	mov r14,r9
	mov r13,r8
	call LB_1227
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=2 , %2715~2'(= a2◂ [ *{ rr{| l |}}] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2716~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2717~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2700~1'(= r ) %2699~0'(= r ) %2696~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2695~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3051
LB_3051:
	cmp BYTE [r8+6],0
	jnz LB_3012
	POP_GRM_SCC
	ret
LB_3012:
	RB_GRM
	jmp LB_3063
LB_3062:
	add r14,1 
LB_3063:
	cmp r14,r9
	jge LB_3064
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3062
LB_3064
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3067
	jmp LB_3068
LB_3067:
	jmp LB_3065
LB_3068:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3066
LB_3065:
	add rsp,0
	jmp LB_3061
LB_3066:
	jmp LB_3070
LB_3069:
	add r14,1 
LB_3070:
	cmp r14,r9
	jge LB_3071
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3069
LB_3071
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3074
	jmp LB_3075
LB_3074:
	mov r8,unt_1
	jmp LB_3072
LB_3075:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3076
	cmp BYTE [rdi+1],136
	jnz LB_3076
	cmp BYTE [rdi+2],144
	jnz LB_3076
	jmp LB_3077
LB_3076:
	mov r8,unt_1
	jmp LB_3072
LB_3077:
	add r14,3
	jmp LB_3073
LB_3072:
	add rsp,8
	jmp LB_3061
LB_3073:
	jmp LB_3079
LB_3078:
	add r14,1 
LB_3079:
	cmp r14,r9
	jge LB_3080
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3078
LB_3080
	call GRM_313
	cmp BYTE [r8+6],0
	jnz LB_3083
	jmp LB_3084
LB_3083:
	jmp LB_3081
LB_3084:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3082
LB_3081:
	add rsp,8
	jmp LB_3061
LB_3082:
	jmp LB_3086
LB_3085:
	add r14,1 
LB_3086:
	cmp r14,r9
	jge LB_3087
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3085
LB_3087
	call GRM_357
	cmp BYTE [r8+6],0
	jnz LB_3090
	jmp LB_3091
LB_3090:
	jmp LB_3088
LB_3091:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3089
LB_3088:
	add rsp,16
	jmp LB_3061
LB_3089:
	jmp LB_3093
LB_3092:
	add r14,1 
LB_3093:
	cmp r14,r9
	jge LB_3094
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3092
LB_3094
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_3097
	jmp LB_3098
LB_3097:
	jmp LB_3095
LB_3098:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3096
LB_3095:
	add rsp,24
	jmp LB_3061
LB_3096:
	jmp LB_3100
LB_3099:
	add r14,1 
LB_3100:
	cmp r14,r9
	jge LB_3101
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3099
LB_3101
	call GRM_353
	cmp BYTE [r8+6],0
	jnz LB_3104
	jmp LB_3105
LB_3104:
	jmp LB_3102
LB_3105:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3103
LB_3102:
	add rsp,32
	jmp LB_3061
LB_3103:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_3106
LB_3106
;; rsp=5 , %2724~1'(= r ) %2723~0'(= r ) %2722~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2721~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2720~10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	cmp BYTE [rdi+6],0
	jnz LB_3109
	jmp LB_3110
LB_3109:
	jmp LB_3108
LB_3110:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2722~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2721~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_3112
	jmp LB_3113
LB_3112:
	jmp LB_3111
LB_3113:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2728~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2722~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3115
	jmp LB_3116
LB_3115:
	jmp LB_3114
LB_3116:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2730~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2728~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=5 , %2731~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2730~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #81 { { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2732~0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2724~1'(= r ) %2723~0'(= r ) %2718~8'(= a47◂ [ *{ }] ) 
; #308 0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2733~0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2724~1'(= r ) %2723~0'(= r ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2734~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2724~1'(= r ) %2723~0'(= r ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00111000010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r14,rax
	mov r11,QWORD [rsp-8+8*4]
	mov rax,r11
	mov QWORD [r14+8],rax
	mov r11,r13
	mov rax,r11
	mov QWORD [r14+16],rax
	mov r11,r9
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r11
	mov r11,rax
	mov rax,r11
	mov QWORD [r14+24],rax
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r10
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_3107
LB_3114:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2729~4'(= a2◂ [ *{ rr{| l |}}] ) %2728~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #307 4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2735~1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2728~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2736~0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2728~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 001010.. |}
	mov r8,r10
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_3107
LB_3111:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2727~3'(= a2◂ [ *{ rr{| l |}}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2722~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3118
	jmp LB_3119
LB_3118:
	jmp LB_3117
LB_3119:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2738~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2727~3'(= a2◂ [ *{ rr{| l |}}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2739~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2738~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2740~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2738~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_2076
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_3107
LB_3117:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2737~4'(= a2◂ [ *{ rr{| l |}}] ) %2727~3'(= a2◂ [ *{ rr{| l |}}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #84 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 3'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11011000110001110.. |}
	mov r14,r10
	mov r13,r9
	call LB_1227
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=2 , %2741~3'(= a2◂ [ *{ rr{| l |}}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2742~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2743~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2726~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2082
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3107
LB_3108:
;; ?. 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2725~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2722~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2721~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_3121
	jmp LB_3122
LB_3121:
	jmp LB_3120
LB_3122:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2725~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2722~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3124
	jmp LB_3125
LB_3124:
	jmp LB_3123
LB_3125:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2747~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2725~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2748~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2747~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2749~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2747~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_2076
	C_POP_REGS
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_3107
LB_3123:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2746~4'(= a2◂ [ *{ rr{| l |}}] ) %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2725~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r9
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11101000110001110.. |}
	mov r14,r10
	mov r13,r8
	call LB_1227
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=2 , %2750~2'(= a2◂ [ *{ rr{| l |}}] ) %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2751~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2752~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2745~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3107
LB_3120:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2744~3'(= a2◂ [ *{ rr{| l |}}] ) %2725~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2722~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3127
	jmp LB_3128
LB_3127:
	jmp LB_3126
LB_3128:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2754~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2744~3'(= a2◂ [ *{ rr{| l |}}] ) %2725~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000110001110.. |}
	mov r14,r9
	mov r13,r8
	call LB_1227
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=2 , %2755~2'(= a2◂ [ *{ rr{| l |}}] ) %2754~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2756~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2754~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2757~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2754~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_2076
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3107
LB_3126:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2753~4'(= a2◂ [ *{ rr{| l |}}] ) %2744~3'(= a2◂ [ *{ rr{| l |}}] ) %2725~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000110001110.. |}
	mov r14,r9
	mov r13,r8
	call LB_1227
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=2 , %2758~2'(= a2◂ [ *{ rr{| l |}}] ) %2753~4'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110100011110.. |}
	mov r14,r10
	mov r13,r8
	call LB_1227
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=2 , %2759~2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2760~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2761~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2724~1'(= r ) %2723~0'(= r ) %2719~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2081
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3107
LB_3107:
	cmp BYTE [r8+6],0
	jnz LB_3061
	POP_GRM_SCC
	ret
LB_3061:
	POP_GRM_FAIL 
	ret
ETR_354:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_354
	ret
GRM_354:
	PUSH_GRM
	jmp LB_3131
LB_3130:
	add r14,1 
LB_3131:
	cmp r14,r9
	jge LB_3132
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3130
LB_3132
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_3135
	jmp LB_3136
LB_3135:
	jmp LB_3133
LB_3136:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3134
LB_3133:
	add rsp,0
	jmp LB_3129
LB_3134:
	jmp LB_3138
LB_3137:
	add r14,1 
LB_3138:
	cmp r14,r9
	jge LB_3139
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3137
LB_3139
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_3142
	jmp LB_3143
LB_3142:
	jmp LB_3140
LB_3143:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3141
LB_3140:
	add rsp,8
	jmp LB_3129
LB_3141:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3144
LB_3144
;; rsp=2 , %2765~1'(= r ) %2764~0'(= r ) %2763~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2762~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2766~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2765~1'(= r ) %2764~0'(= r ) 
; #308 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2767~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2765~1'(= r ) %2764~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2768~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2765~1'(= r ) %2764~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3145
LB_3145:
	cmp BYTE [r8+6],0
	jnz LB_3129
	POP_GRM_SCC
	ret
LB_3129:
	RB_GRM
	jmp LB_3148
LB_3147:
	add r14,1 
LB_3148:
	cmp r14,r9
	jge LB_3149
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3147
LB_3149
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3152
	jmp LB_3153
LB_3152:
	mov r8,unt_1
	jmp LB_3150
LB_3153:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3154
	jmp LB_3155
LB_3154:
	mov r8,unt_1
	jmp LB_3150
LB_3155:
	add r14,1
	jmp LB_3151
LB_3150:
	add rsp,0
	jmp LB_3146
LB_3151:
	jmp LB_3157
LB_3156:
	add r14,1 
LB_3157:
	cmp r14,r9
	jge LB_3158
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3156
LB_3158
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3161
	jmp LB_3162
LB_3161:
	mov r8,unt_1
	jmp LB_3159
LB_3162:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3163
	jmp LB_3164
LB_3163:
	mov r8,unt_1
	jmp LB_3159
LB_3164:
	add r14,1
	jmp LB_3160
LB_3159:
	add rsp,0
	jmp LB_3146
LB_3160:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3165
LB_3165
;; rsp=0 , %2770~1'(= r ) %2769~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2771~1(<2)◂{ } %2770~1'(= r ) %2769~0'(= r ) 
; #308 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2772~0(<2)◂1(<2)◂{ } %2770~1'(= r ) %2769~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2773~0(<2)◂0(<2)◂1(<2)◂{ } %2770~1'(= r ) %2769~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3166
LB_3166:
	cmp BYTE [r8+6],0
	jnz LB_3146
	POP_GRM_SCC
	ret
LB_3146:
	RB_GRM
	jmp LB_3169
LB_3168:
	add r14,1 
LB_3169:
	cmp r14,r9
	jge LB_3170
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3168
LB_3170
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3173
	jmp LB_3174
LB_3173:
	jmp LB_3171
LB_3174:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_3172
LB_3171:
	add rsp,0
	jmp LB_3167
LB_3172:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3175
LB_3175
;; rsp=2 , %2776~1'(= r ) %2775~0'(= r ) %2774~{ 8'(= r ) 9'(= r ) } 
; $ %[ "mtc_line 0" ] ⊢ %[ "mtc_line 0" ]
;; rsp=2 , %2777~%[ "mtc_line 0" ] %2776~1'(= r ) %2775~0'(= r ) %2774~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2778~1(<2)◂{ } %2777~%[ "mtc_line 0" ] %2776~1'(= r ) %2775~0'(= r ) %2774~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2779~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2774~{ 8'(= r ) 9'(= r ) } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2780~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2774~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2781~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2774~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],10
	mov BYTE [rax+8+0],109
	mov BYTE [rax+8+1],116
	mov BYTE [rax+8+2],99
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],108
	mov BYTE [rax+8+5],105
	mov BYTE [rax+8+6],110
	mov BYTE [rax+8+7],101
	mov BYTE [rax+8+8],32
	mov BYTE [rax+8+9],48
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3176
LB_3176:
	cmp BYTE [r8+6],0
	jnz LB_3167
	POP_GRM_SCC
	ret
LB_3167:
	POP_GRM_FAIL 
	ret
ETR_355:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_355
	ret
GRM_355:
	PUSH_GRM
	jmp LB_3179
LB_3178:
	add r14,1 
LB_3179:
	cmp r14,r9
	jge LB_3180
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3178
LB_3180
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_3183
	jmp LB_3184
LB_3183:
	jmp LB_3181
LB_3184:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3182
LB_3181:
	add rsp,0
	jmp LB_3177
LB_3182:
	jmp LB_3186
LB_3185:
	add r14,1 
LB_3186:
	cmp r14,r9
	jge LB_3187
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3185
LB_3187
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3190
	jmp LB_3191
LB_3190:
	mov r8,unt_1
	jmp LB_3188
LB_3191:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3192
	cmp BYTE [rdi+1],138
	jnz LB_3192
	cmp BYTE [rdi+2],162
	jnz LB_3192
	jmp LB_3193
LB_3192:
	mov r8,unt_1
	jmp LB_3188
LB_3193:
	add r14,3
	jmp LB_3189
LB_3188:
	add rsp,8
	jmp LB_3177
LB_3189:
	jmp LB_3195
LB_3194:
	add r14,1 
LB_3195:
	cmp r14,r9
	jge LB_3196
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3194
LB_3196
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_3199
	jmp LB_3200
LB_3199:
	jmp LB_3197
LB_3200:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3198
LB_3197:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3198:
	jmp LB_3202
LB_3201:
	add r14,1 
LB_3202:
	cmp r14,r9
	jge LB_3203
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3201
LB_3203
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3206
	jmp LB_3207
LB_3206:
	mov r8,unt_1
	jmp LB_3204
LB_3207:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3208
	cmp BYTE [rdi+1],151
	jnz LB_3208
	cmp BYTE [rdi+2],130
	jnz LB_3208
	jmp LB_3209
LB_3208:
	mov r8,unt_1
	jmp LB_3204
LB_3209:
	add r14,3
	jmp LB_3205
LB_3204:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_3205:
	jmp LB_3211
LB_3210:
	add r14,1 
LB_3211:
	cmp r14,r9
	jge LB_3212
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3210
LB_3212
	call GRM_313
	cmp BYTE [r8+6],0
	jnz LB_3215
	jmp LB_3216
LB_3215:
	jmp LB_3213
LB_3216:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3214
LB_3213:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_3214:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3217
LB_3217
;; rsp=3 , %2786~1'(= r ) %2785~0'(= r ) %2784~10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2783~9'(= a18◂ [ ] ) %2782~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #189 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2787~0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %2786~1'(= r ) %2785~0'(= r ) %2782~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #112 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2788~1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %2786~1'(= r ) %2785~0'(= r ) %2782~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #162 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } ⊢ 0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2789~0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } %2786~1'(= r ) %2785~0'(= r ) 
; #26 0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } ⊢ 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2790~0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } %2786~1'(= r ) %2785~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } }
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
; .mov_ptn2 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } ⊢ 2'(= a3◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 001000001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*3]
	mov rax,r13
	mov QWORD [r8+8],rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_3218
LB_3218:
	cmp BYTE [r8+6],0
	jnz LB_3177
	POP_GRM_SCC
	ret
LB_3177:
	RB_GRM
	jmp LB_3221
LB_3220:
	add r14,1 
LB_3221:
	cmp r14,r9
	jge LB_3222
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3220
LB_3222
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_3225
	jmp LB_3226
LB_3225:
	jmp LB_3223
LB_3226:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3224
LB_3223:
	add rsp,0
	jmp LB_3219
LB_3224:
	jmp LB_3228
LB_3227:
	add r14,1 
LB_3228:
	cmp r14,r9
	jge LB_3229
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3227
LB_3229
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3232
	jmp LB_3233
LB_3232:
	mov r8,unt_1
	jmp LB_3230
LB_3233:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3234
	cmp BYTE [rdi+1],60
	jnz LB_3234
	jmp LB_3235
LB_3234:
	mov r8,unt_1
	jmp LB_3230
LB_3235:
	add r14,2
	jmp LB_3231
LB_3230:
	add rsp,8
	jmp LB_3219
LB_3231:
	jmp LB_3237
LB_3236:
	add r14,1 
LB_3237:
	cmp r14,r9
	jge LB_3238
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3236
LB_3238
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_3241
	jmp LB_3242
LB_3241:
	jmp LB_3239
LB_3242:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3240
LB_3239:
	add rsp,8
	jmp LB_3219
LB_3240:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3243
LB_3243
;; rsp=2 , %2794~1'(= r ) %2793~0'(= r ) %2792~9'(= a33◂ [ a18◂ [ ]{| l |}] ) %2791~8'(= a33◂ [ a18◂ [ ]{| l |}] ) 
; #160 { 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2795~2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2794~1'(= r ) %2793~0'(= r ) 
; #26 2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2796~0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2794~1'(= r ) %2793~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3244
LB_3244:
	cmp BYTE [r8+6],0
	jnz LB_3219
	POP_GRM_SCC
	ret
LB_3219:
	RB_GRM
	jmp LB_3247
LB_3246:
	add r14,1 
LB_3247:
	cmp r14,r9
	jge LB_3248
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3246
LB_3248
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_3251
	jmp LB_3252
LB_3251:
	jmp LB_3249
LB_3252:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3250
LB_3249:
	add rsp,0
	jmp LB_3245
LB_3250:
	jmp LB_3254
LB_3253:
	add r14,1 
LB_3254:
	cmp r14,r9
	jge LB_3255
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3253
LB_3255
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3258
	jmp LB_3259
LB_3258:
	mov r8,unt_1
	jmp LB_3256
LB_3259:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3260
	jmp LB_3261
LB_3260:
	mov r8,unt_1
	jmp LB_3256
LB_3261:
	add r14,1
	jmp LB_3257
LB_3256:
	add rsp,8
	jmp LB_3245
LB_3257:
	jmp LB_3263
LB_3262:
	add r14,1 
LB_3263:
	cmp r14,r9
	jge LB_3264
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3262
LB_3264
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_3267
	jmp LB_3268
LB_3267:
	jmp LB_3265
LB_3268:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3266
LB_3265:
	add rsp,8
	jmp LB_3245
LB_3266:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3269
LB_3269
;; rsp=2 , %2800~1'(= r ) %2799~0'(= r ) %2798~9'(= a33◂ [ a18◂ [ ]{| l |}] ) %2797~8'(= a33◂ [ a18◂ [ ]{| l |}] ) 
; #161 { 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2801~1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2800~1'(= r ) %2799~0'(= r ) 
; #26 1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2802~0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2800~1'(= r ) %2799~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3270
LB_3270:
	cmp BYTE [r8+6],0
	jnz LB_3245
	POP_GRM_SCC
	ret
LB_3245:
	POP_GRM_FAIL 
	ret
ETR_356:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_356
	ret
GRM_356:
	PUSH_GRM
	jmp LB_3273
LB_3272:
	add r14,1 
LB_3273:
	cmp r14,r9
	jge LB_3274
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3272
LB_3274
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3277
	jmp LB_3278
LB_3277:
	mov r8,unt_1
	jmp LB_3275
LB_3278:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_3279
	jmp LB_3280
LB_3279:
	mov r8,unt_1
	jmp LB_3275
LB_3280:
	add r14,1
	jmp LB_3276
LB_3275:
	add rsp,0
	jmp LB_3271
LB_3276:
	jmp LB_3282
LB_3281:
	add r14,1 
LB_3282:
	cmp r14,r9
	jge LB_3283
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3281
LB_3283
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_3286
	jmp LB_3287
LB_3286:
	jmp LB_3284
LB_3287:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3285
LB_3284:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3285:
	jmp LB_3289
LB_3288:
	add r14,1 
LB_3289:
	cmp r14,r9
	jge LB_3290
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3288
LB_3290
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_3293
	jmp LB_3294
LB_3293:
	jmp LB_3291
LB_3294:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3292
LB_3291:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3292:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3295
LB_3295
;; rsp=2 , %2806~1'(= r ) %2805~0'(= r ) %2804~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2803~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2807~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2806~1'(= r ) %2805~0'(= r ) 
; #26 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2808~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2806~1'(= r ) %2805~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3296
LB_3296:
	cmp BYTE [r8+6],0
	jnz LB_3271
	POP_GRM_SCC
	ret
LB_3271:
	RB_GRM
	jmp LB_3299
LB_3298:
	add r14,1 
LB_3299:
	cmp r14,r9
	jge LB_3300
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3298
LB_3300
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3303
	jmp LB_3304
LB_3303:
	mov r8,unt_1
	jmp LB_3301
LB_3304:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3305
	jmp LB_3306
LB_3305:
	mov r8,unt_1
	jmp LB_3301
LB_3306:
	add r14,1
	jmp LB_3302
LB_3301:
	add rsp,0
	jmp LB_3297
LB_3302:
	jmp LB_3308
LB_3307:
	add r14,1 
LB_3308:
	cmp r14,r9
	jge LB_3309
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3307
LB_3309
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3312
	jmp LB_3313
LB_3312:
	mov r8,unt_1
	jmp LB_3310
LB_3313:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3314
	jmp LB_3315
LB_3314:
	mov r8,unt_1
	jmp LB_3310
LB_3315:
	add r14,1
	jmp LB_3311
LB_3310:
	add rsp,0
	jmp LB_3297
LB_3311:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3316
LB_3316
;; rsp=0 , %2810~1'(= r ) %2809~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2811~1(<2)◂{ } %2810~1'(= r ) %2809~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2812~0(<2)◂1(<2)◂{ } %2810~1'(= r ) %2809~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3317
LB_3317:
	cmp BYTE [r8+6],0
	jnz LB_3297
	POP_GRM_SCC
	ret
LB_3297:
	POP_GRM_FAIL 
	ret
ETR_357:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_357
	ret
GRM_357:
	PUSH_GRM
	jmp LB_3320
LB_3319:
	add r14,1 
LB_3320:
	cmp r14,r9
	jge LB_3321
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3319
LB_3321
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3324
	jmp LB_3325
LB_3324:
	mov r8,unt_1
	jmp LB_3322
LB_3325:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_3326
	jmp LB_3327
LB_3326:
	mov r8,unt_1
	jmp LB_3322
LB_3327:
	add r14,1
	jmp LB_3323
LB_3322:
	add rsp,0
	jmp LB_3318
LB_3323:
	jmp LB_3329
LB_3328:
	add r14,1 
LB_3329:
	cmp r14,r9
	jge LB_3330
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3328
LB_3330
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_3333
	jmp LB_3334
LB_3333:
	jmp LB_3331
LB_3334:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3332
LB_3331:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3332:
	jmp LB_3336
LB_3335:
	add r14,1 
LB_3336:
	cmp r14,r9
	jge LB_3337
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3335
LB_3337
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_3340
	jmp LB_3341
LB_3340:
	jmp LB_3338
LB_3341:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3339
LB_3338:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3339:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3342
LB_3342
;; rsp=2 , %2816~1'(= r ) %2815~0'(= r ) %2814~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2813~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2817~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2816~1'(= r ) %2815~0'(= r ) 
; #308 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2818~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2816~1'(= r ) %2815~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2819~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2816~1'(= r ) %2815~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3343
LB_3343:
	cmp BYTE [r8+6],0
	jnz LB_3318
	POP_GRM_SCC
	ret
LB_3318:
	RB_GRM
	jmp LB_3346
LB_3345:
	add r14,1 
LB_3346:
	cmp r14,r9
	jge LB_3347
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3345
LB_3347
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3350
	jmp LB_3351
LB_3350:
	mov r8,unt_1
	jmp LB_3348
LB_3351:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3352
	jmp LB_3353
LB_3352:
	mov r8,unt_1
	jmp LB_3348
LB_3353:
	add r14,1
	jmp LB_3349
LB_3348:
	add rsp,0
	jmp LB_3344
LB_3349:
	jmp LB_3355
LB_3354:
	add r14,1 
LB_3355:
	cmp r14,r9
	jge LB_3356
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3354
LB_3356
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3359
	jmp LB_3360
LB_3359:
	mov r8,unt_1
	jmp LB_3357
LB_3360:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3361
	jmp LB_3362
LB_3361:
	mov r8,unt_1
	jmp LB_3357
LB_3362:
	add r14,1
	jmp LB_3358
LB_3357:
	add rsp,0
	jmp LB_3344
LB_3358:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3363
LB_3363
;; rsp=0 , %2821~1'(= r ) %2820~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2822~1(<2)◂{ } %2821~1'(= r ) %2820~0'(= r ) 
; #308 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2823~0(<2)◂1(<2)◂{ } %2821~1'(= r ) %2820~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2824~0(<2)◂0(<2)◂1(<2)◂{ } %2821~1'(= r ) %2820~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3364
LB_3364:
	cmp BYTE [r8+6],0
	jnz LB_3344
	POP_GRM_SCC
	ret
LB_3344:
	RB_GRM
	jmp LB_3367
LB_3366:
	add r14,1 
LB_3367:
	cmp r14,r9
	jge LB_3368
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3366
LB_3368
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3371
	jmp LB_3372
LB_3371:
	jmp LB_3369
LB_3372:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_3370
LB_3369:
	add rsp,0
	jmp LB_3365
LB_3370:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3373
LB_3373
;; rsp=2 , %2827~1'(= r ) %2826~0'(= r ) %2825~{ 8'(= r ) 9'(= r ) } 
; $ %[ "mtc_line_tl 0" ] ⊢ %[ "mtc_line_tl 0" ]
;; rsp=2 , %2828~%[ "mtc_line_tl 0" ] %2827~1'(= r ) %2826~0'(= r ) %2825~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2829~1(<2)◂{ } %2828~%[ "mtc_line_tl 0" ] %2827~1'(= r ) %2826~0'(= r ) %2825~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2830~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2825~{ 8'(= r ) 9'(= r ) } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2831~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2825~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2832~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2825~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],13
	mov BYTE [rax+8+0],109
	mov BYTE [rax+8+1],116
	mov BYTE [rax+8+2],99
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],108
	mov BYTE [rax+8+5],105
	mov BYTE [rax+8+6],110
	mov BYTE [rax+8+7],101
	mov BYTE [rax+8+8],95
	mov BYTE [rax+8+9],116
	mov BYTE [rax+8+10],108
	mov BYTE [rax+8+11],32
	mov BYTE [rax+8+12],48
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3374
LB_3374:
	cmp BYTE [r8+6],0
	jnz LB_3365
	POP_GRM_SCC
	ret
LB_3365:
	POP_GRM_FAIL 
	ret
ETR_358:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_358
	ret
GRM_358:
	PUSH_GRM
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3378
	jmp LB_3379
LB_3378:
	jmp LB_3376
LB_3379:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3377
LB_3376:
	add rsp,0
	jmp LB_3375
LB_3377:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3382
	jmp LB_3383
LB_3382:
	mov r8,unt_1
	jmp LB_3380
LB_3383:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_3384
	jmp LB_3385
LB_3384:
	mov r8,unt_1
	jmp LB_3380
LB_3385:
	add r14,1
	jmp LB_3381
LB_3380:
	add rsp,8
	jmp LB_3375
LB_3381:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3386
LB_3386
;; rsp=1 , %2835~1'(= r ) %2834~0'(= r ) %2833~8'(= {| l |} ) 
; #158 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %2836~1(<2)◂8'(= {| l |} ) %2835~1'(= r ) %2834~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %2837~0(<2)◂1(<2)◂8'(= {| l |} ) %2835~1'(= r ) %2834~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a33◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3387
LB_3387:
	cmp BYTE [r8+6],0
	jnz LB_3375
	POP_GRM_SCC
	ret
LB_3375:
	RB_GRM
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_3391
	jmp LB_3392
LB_3391:
	jmp LB_3389
LB_3392:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3390
LB_3389:
	add rsp,0
	jmp LB_3388
LB_3390:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3393
LB_3393
;; rsp=1 , %2840~1'(= r ) %2839~0'(= r ) %2838~8'(= a27◂ [ a18◂ [ ]] ) 
; #159 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %2841~0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %2840~1'(= r ) %2839~0'(= r ) 
; #26 0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %2842~0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %2840~1'(= r ) %2839~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 2'(= a3◂ [ a33◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3394
LB_3394:
	cmp BYTE [r8+6],0
	jnz LB_3388
	POP_GRM_SCC
	ret
LB_3388:
	POP_GRM_FAIL 
	ret
LB_3426:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3433+8*rax]
LB_3433: dq LB_3427,LB_3428,LB_3429,LB_3430,LB_3431,LB_3432
LB_3427:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3435
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3434
LB_3428:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3436
	jmp LB_3434
LB_3429:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3437
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3434
LB_3430:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3438
	jmp LB_3434
LB_3431:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3439
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3434
LB_3432:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3440
	jmp LB_3434
LB_3434:
	ret
LB_3440:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3443+8*rax]
LB_3443: dq LB_3441,LB_3442
LB_3441:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3439
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3440
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3444
LB_3442:
	jmp LB_3444
LB_3444:
	ret
LB_3439:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3447+8*rax]
LB_3447: dq LB_3445,LB_3446
LB_3445:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3449
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3450
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3448
LB_3446:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3449
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3451
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3448
LB_3448:
	ret
LB_3451:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3457+8*rax]
LB_3457: dq LB_3452,LB_3453,LB_3454,LB_3455,LB_3456
LB_3452:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3459
	jmp LB_3458
LB_3453:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3451
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3451
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3458
LB_3454:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3451
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3451
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3458
LB_3455:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2101
	jmp LB_3458
LB_3456:
	mov rdi,r8
	call free_s8
	jmp LB_3458
LB_3458:
	ret
LB_3459:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3462+8*rax]
LB_3462: dq LB_3460,LB_3461
LB_3460:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3451
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3459
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3463
LB_3461:
	jmp LB_3463
LB_3463:
	ret
LB_3450:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3466+8*rax]
LB_3466: dq LB_3464,LB_3465
LB_3464:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3451
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3450
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3467
LB_3465:
	jmp LB_3467
LB_3467:
	ret
LB_3449:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3470+8*rax]
LB_3470: dq LB_3468,LB_3469
LB_3468:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3449
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3471
LB_3469:
	jmp LB_3471
LB_3471:
	ret
LB_3438:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3474+8*rax]
LB_3474: dq LB_3472,LB_3473
LB_3472:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2033
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_3476
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2091
	pop r8 
	FREE_RCD 4, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3438
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3475
LB_3473:
	jmp LB_3475
LB_3475:
	ret
LB_3476:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3479+8*rax]
LB_3479: dq LB_3477,LB_3478
LB_3477:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3451
	jmp LB_3480
LB_3478:
	jmp LB_3480
LB_3480:
	ret
LB_3437:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3484+8*rax]
LB_3484: dq LB_3481,LB_3482,LB_3483
LB_3481:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2033
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3476
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2091
	pop r8 
	FREE_RCD 3, r8
	jmp LB_3485
LB_3482:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2120
	jmp LB_3485
LB_3483:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2091
	jmp LB_3485
LB_3485:
	ret
LB_3436:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3488+8*rax]
LB_3488: dq LB_3486,LB_3487
LB_3486:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3490
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3436
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3489
LB_3487:
	jmp LB_3489
LB_3489:
	ret
LB_3490:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3493+8*rax]
LB_3493: dq LB_3491,LB_3492
LB_3491:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3495
	jmp LB_3494
LB_3492:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3496
	jmp LB_3494
LB_3494:
	ret
LB_3496:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3499+8*rax]
LB_3499: dq LB_3497,LB_3498
LB_3497:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2123
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2033
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2091
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3501
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_3502
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_3503
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*6]
	call LB_3496
	pop r8 
	FREE_RCD 7, r8
	jmp LB_3500
LB_3498:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2123
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2033
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2091
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3501
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_3502
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_3503
	pop r8 
	FREE_RCD 6, r8
	jmp LB_3500
LB_3500:
	ret
LB_3503:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3506+8*rax]
LB_3506: dq LB_3504,LB_3505
LB_3504:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2033
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3496
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3507
LB_3505:
	jmp LB_3507
LB_3507:
	ret
LB_3502:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3511+8*rax]
LB_3511: dq LB_3508,LB_3509,LB_3510
LB_3508:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3513
	jmp LB_3512
LB_3509:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3514
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3502
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3512
LB_3510:
	jmp LB_3512
LB_3512:
	ret
LB_3514:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3517+8*rax]
LB_3517: dq LB_3515,LB_3516
LB_3515:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3519
	jmp LB_3518
LB_3516:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3519
	jmp LB_3518
LB_3518:
	ret
LB_3519:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3522+8*rax]
LB_3522: dq LB_3520,LB_3521
LB_3520:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2101
	jmp LB_3523
LB_3521:
	mov rdi,r8
	call free_s8
	jmp LB_3523
LB_3523:
	ret
LB_3513:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3526+8*rax]
LB_3526: dq LB_3524,LB_3525
LB_3524:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3514
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3513
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3527
LB_3525:
	jmp LB_3527
LB_3527:
	ret
LB_3501:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3531+8*rax]
LB_3531: dq LB_3528,LB_3529,LB_3530
LB_3528:
	jmp LB_3532
LB_3529:
	jmp LB_3532
LB_3530:
	jmp LB_3532
LB_3532:
	ret
LB_3495:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3535+8*rax]
LB_3535: dq LB_3533,LB_3534
LB_3533:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2043
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3501
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_3502
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3537
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_3495
	pop r8 
	FREE_RCD 5, r8
	jmp LB_3536
LB_3534:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2043
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3501
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_3502
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3537
	pop r8 
	FREE_RCD 4, r8
	jmp LB_3536
LB_3536:
	ret
LB_3537:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3540+8*rax]
LB_3540: dq LB_3538,LB_3539
LB_3538:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3495
	jmp LB_3541
LB_3539:
	jmp LB_3541
LB_3541:
	ret
LB_3435:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3544+8*rax]
LB_3544: dq LB_3542,LB_3543
LB_3542:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3546
	jmp LB_3545
LB_3543:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2101
	jmp LB_3545
LB_3545:
	ret
LB_3546:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3549+8*rax]
LB_3549: dq LB_3547,LB_3548
LB_3547:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3426
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3546
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3550
LB_3548:
	jmp LB_3550
LB_3550:
	ret
LB_3419: ;; #309 { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) : ({ _t47◂_t42 _t47◂_lst◂_t42 }→_t47◂{ _t42 _lst◂_t42 })
;; rsp=0 , %1788~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %1787~0'(= a47◂ [ a42◂ [ ]] ) 
;; ? 0'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂2'(= a42◂ [ ] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_3421
	jmp LB_3422
LB_3421:
	jmp LB_3420
LB_3422:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1790~2'(= a42◂ [ ] ) %1788~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) 
;; ? 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3424
	jmp LB_3425
LB_3424:
	jmp LB_3423
LB_3425:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1792~0'(= a2◂ [ a42◂ [ ]] ) %1790~2'(= a42◂ [ ] ) 
; #308 { 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=0 , %1793~0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) } 
; ∎ 0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
; {| 1010.. |}
	mov r14,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,r8
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	ret
LB_3423:
;; ?. 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1791~0'(= a2◂ [ *{ rr{| l |}}] ) %1790~2'(= a42◂ [ ] ) 
; #307 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1794~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1790~2'(= a42◂ [ ] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a42◂ [ ] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_3426
	C_POP_REGS
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_3420:
;; ?. 0'(= a47◂ [ a42◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1789~2'(= a2◂ [ *{ rr{| l |}}] ) %1788~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) 
;; ? 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3552
	jmp LB_3553
LB_3552:
	jmp LB_3551
LB_3553:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1796~0'(= a2◂ [ a42◂ [ ]] ) %1789~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1797~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1796~0'(= a2◂ [ a42◂ [ ]] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_3546
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_3551:
;; ?. 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1795~0'(= a2◂ [ *{ rr{| l |}}] ) %1789~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
	call LB_1227
;; rsp=0 , %1798~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #307 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1799~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_4499: ;; #309 { 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) : ({ _t47◂_lst◂{ _s8 _t17◂_t25◂_s8 _opn◂_t34 _t28◂_s8◂_t18 } _t47◂_t28◂_s8◂_t18 }→_t47◂{ _lst◂{ _s8 _t17◂_t25◂_s8 _opn◂_t34 _t28◂_s8◂_t18 } _t28◂_s8◂_t18 })
;; rsp=0 , %1788~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %1787~0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_4501
	jmp LB_4502
LB_4501:
	jmp LB_4500
LB_4502:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1790~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %1788~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_4504
	jmp LB_4505
LB_4504:
	jmp LB_4503
LB_4505:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1792~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1790~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; #308 { 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=0 , %1793~0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } 
; ∎ 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 1010.. |}
	mov r14,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,r8
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	ret
LB_4503:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1791~0'(= a2◂ [ *{ rr{| l |}}] ) %1790~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; #307 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1794~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1790~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_3438
	C_POP_REGS
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_4500:
;; ?. 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1789~2'(= a2◂ [ *{ rr{| l |}}] ) %1788~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_4507
	jmp LB_4508
LB_4507:
	jmp LB_4506
LB_4508:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1796~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1789~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1797~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1796~0'(= a28◂ [ a18◂ [ ]{| l |}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_4506:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1795~0'(= a2◂ [ *{ rr{| l |}}] ) %1789~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
	call LB_1227
;; rsp=0 , %1798~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #307 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1799~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
	ret
LB_4725: ;; #254 { } ⊢ 0'(= a2◂ [ a25◂ [ {| l |}]] ) : ({ }→_lst◂_t25◂_s8)
;; rsp=0 , 
; $ %[ "_r" ] ⊢ %[ "_r" ]
;; rsp=0 , %1336~%[ "_r" ] 
; $ %[ "_n" ] ⊢ %[ "_n" ]
;; rsp=0 , %1337~%[ "_n" ] %1336~%[ "_r" ] 
; #190 %[ "_r" ] ⊢ 1(<2)◂%[ "_r" ]
;; rsp=0 , %1338~1(<2)◂%[ "_r" ] %1337~%[ "_n" ] 
; #190 %[ "_n" ] ⊢ 1(<2)◂%[ "_n" ]
;; rsp=0 , %1339~1(<2)◂%[ "_n" ] %1338~1(<2)◂%[ "_r" ] 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1340~1(<2)◂{ } %1339~1(<2)◂%[ "_n" ] %1338~1(<2)◂%[ "_r" ] 
; #25 { 1(<2)◂%[ "_r" ] 1(<2)◂{ } } ⊢ 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } }
;; rsp=0 , %1341~0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } %1339~1(<2)◂%[ "_n" ] 
; #25 { 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } }
;; rsp=0 , %1342~0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } 
; ∎ 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } }
; .mov_ptn2 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0'(= a2◂ [ a25◂ [ {| l |}]] )
; {| 10.. |}
	ALC_RCD 2, rax
	mov r13,rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],110
	mov r14,rax
	mov BYTE [r14+6],1
	mov rax,r14
	mov QWORD [r13+8],rax
	ALC_RCD 2, rax
	mov r14,rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],114
	mov r8,rax
	mov BYTE [r8+6],1
	mov rax,r8
	mov QWORD [r14+8],rax
	mov r8,unt_1
	mov rax,r8
	mov QWORD [r14+16],rax
	mov BYTE [r14+6],0
	mov rax,r14
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	ret
ETR_359:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_359
	ret
GRM_359:
	PUSH_GRM
	jmp LB_3397
LB_3396:
	add r14,1 
LB_3397:
	cmp r14,r9
	jge LB_3398
	JZ_SPC BYTE [r13+8+r14], LB_3396
LB_3398
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3401
	jmp LB_3402
LB_3401:
	jmp LB_3399
LB_3402:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3400
LB_3399:
	add rsp,0
	jmp LB_3395
LB_3400:
	jmp LB_3404
LB_3403:
	add r14,1 
LB_3404:
	cmp r14,r9
	jge LB_3405
	JZ_SPC BYTE [r13+8+r14], LB_3403
LB_3405
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_3408
	jmp LB_3409
LB_3408:
	jmp LB_3406
LB_3409:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 9'(= a47◂ [ a42◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3407
LB_3406:
	add rsp,8
	jmp LB_3395
LB_3407:
	jmp LB_3411
LB_3410:
	add r14,1 
LB_3411:
	cmp r14,r9
	jge LB_3412
	JZ_SPC BYTE [r13+8+r14], LB_3410
LB_3412
	call GRM_359
	cmp BYTE [r8+6],0
	jnz LB_3415
	jmp LB_3416
LB_3415:
	jmp LB_3413
LB_3416:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3414
LB_3413:
	add rsp,16
	jmp LB_3395
LB_3414:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3417
LB_3417
;; rsp=3 , %2847~1'(= r ) %2846~0'(= r ) %2845~10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %2844~9'(= a47◂ [ a42◂ [ ]] ) %2843~8'(= a47◂ [ *{ }] ) 
; #309 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_3419
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=1 , %2848~2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3555
	jmp LB_3556
LB_3555:
	jmp LB_3554
LB_3556:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2851~4'(= a2◂ [ a42◂ [ ]] ) %2850~3'(= a42◂ [ ] ) %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
; #25 { 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2852~0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
; #308 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2853~0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2854~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
; {| 001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,r9
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r10
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3418
LB_3554:
;; ?. 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2849~3'(= a2◂ [ *{ rr{| l |}}] ) %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2855~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2856~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2847~1'(= r ) %2846~0'(= r ) %2843~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3418
LB_3418:
	cmp BYTE [r8+6],0
	jnz LB_3395
	POP_GRM_SCC
	ret
LB_3395:
	RB_GRM
	jmp LB_3559
LB_3558:
	add r14,1 
LB_3559:
	cmp r14,r9
	jge LB_3560
	JZ_SPC BYTE [r13+8+r14], LB_3558
LB_3560
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3563
	jmp LB_3564
LB_3563:
	jmp LB_3561
LB_3564:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3562
LB_3561:
	add rsp,0
	jmp LB_3557
LB_3562:
	PUSH_GRM
	jmp LB_3568
LB_3567:
	add r14,1 
LB_3568:
	cmp r14,r9
	jge LB_3569
	JZ_SPC BYTE [r13+8+r14], LB_3567
LB_3569
	cmp r14,r9
	jge LB_3572
	jmp LB_3573
LB_3572:
	mov r8,unt_1 
	jmp LB_3570
LB_3573:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_3571
LB_3570:
	add rsp,0
	jmp LB_3566
LB_3571:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3574
LB_3574
;; rsp=1 , %2862~1'(= r ) %2861~0'(= r ) %2860~8'(= r ) 
; $ %[ "!!!" ] ⊢ %[ "!!!" ]
;; rsp=1 , %2863~%[ "!!!" ] %2862~1'(= r ) %2861~0'(= r ) %2860~8'(= r ) 
; #10 %[ "!!!" ] ⊢ %[ "!!!" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3576
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3577
LB_3577:
;; rsp=1 , %2864~%[ "!!!" ] %2862~1'(= r ) %2861~0'(= r ) %2860~8'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2865~1(<2)◂{ } %2864~%[ "!!!" ] %2862~1'(= r ) %2861~0'(= r ) %2860~8'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn %[ "!!!" ]
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_1
	add rsp,8
	jmp LB_3575
LB_3575:
	cmp BYTE [r8+6],0
	jnz LB_3566
	POP_GRM_SCC
	jmp LB_3565
LB_3566:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3579
LB_3579
;; rsp=0 , %2867~1'(= r ) %2866~0'(= r ) 
; $ %[ "???" ] ⊢ %[ "???" ]
;; rsp=0 , %2868~%[ "???" ] %2867~1'(= r ) %2866~0'(= r ) 
; #10 %[ "???" ] ⊢ %[ "???" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3581
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3582
LB_3582:
;; rsp=0 , %2869~%[ "???" ] %2867~1'(= r ) %2866~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2870~0(<2)◂{ } %2869~%[ "???" ] %2867~1'(= r ) %2866~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn %[ "???" ]
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_3580
LB_3580:
	cmp BYTE [r8+6],0
	jnz LB_3578
	POP_GRM_SCC
	jmp LB_3565
LB_3578:
	POP_GRM_FAIL 
	jmp LB_3565
LB_3565:
	cmp BYTE [r8+6],0
	jnz LB_3583
	jmp LB_3584
LB_3583:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3584:
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110000010.. |}
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3585
LB_3585
;; rsp=1 , %2871~{ } %2859~1'(= r ) %2858~0'(= r ) %2857~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2872~1(<2)◂{ } %2871~{ } %2859~1'(= r ) %2858~0'(= r ) %2857~8'(= a47◂ [ *{ }] ) 
; #308 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %2873~0(<2)◂1(<2)◂{ } %2871~{ } %2859~1'(= r ) %2858~0'(= r ) %2857~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=1 , %2874~0(<2)◂0(<2)◂1(<2)◂{ } %2871~{ } %2859~1'(= r ) %2858~0'(= r ) %2857~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .dlt.ptn { }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3586
LB_3586:
	cmp BYTE [r8+6],0
	jnz LB_3557
	POP_GRM_SCC
	ret
LB_3557:
	POP_GRM_FAIL 
	ret
ETR_360:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_360
	ret
GRM_360:
	PUSH_GRM
	jmp LB_3589
LB_3588:
	add r14,1 
LB_3589:
	cmp r14,r9
	jge LB_3590
	JZ_SPC BYTE [r13+8+r14], LB_3588
LB_3590
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_3593
	jmp LB_3594
LB_3593:
	mov r8,unt_1
	jmp LB_3591
LB_3594:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3595
	cmp BYTE [rdi+1],167
	jnz LB_3595
	cmp BYTE [rdi+2],194
	jnz LB_3595
	cmp BYTE [rdi+3],167
	jnz LB_3595
	cmp BYTE [rdi+4],43
	jnz LB_3595
	cmp BYTE [rdi+5],115
	jnz LB_3595
	cmp BYTE [rdi+6],56
	jnz LB_3595
	jmp LB_3596
LB_3595:
	mov r8,unt_1
	jmp LB_3591
LB_3596:
	add r14,7
	jmp LB_3592
LB_3591:
	add rsp,0
	jmp LB_3587
LB_3592:
	PUSH_GRM
	jmp LB_3600
LB_3599:
	add r14,1 
LB_3600:
	cmp r14,r9
	jge LB_3601
	JZ_SPC BYTE [r13+8+r14], LB_3599
LB_3601
	call GRM_375
	cmp BYTE [r8+6],0
	jnz LB_3604
	jmp LB_3605
LB_3604:
	jmp LB_3602
LB_3605:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_3603
LB_3602:
	add rsp,0
	jmp LB_3598
LB_3603:
	jmp LB_3607
LB_3606:
	add r14,1 
LB_3607:
	cmp r14,r9
	jge LB_3608
	JZ_SPC BYTE [r13+8+r14], LB_3606
LB_3608
	call GRM_376
	cmp BYTE [r8+6],0
	jnz LB_3611
	jmp LB_3612
LB_3611:
	jmp LB_3609
LB_3612:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3610
LB_3609:
	add rsp,16
	jmp LB_3598
LB_3610:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3613
LB_3613
;; rsp=3 , %2880~1'(= r ) %2879~0'(= r ) %2878~10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) %2877~{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2881~0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2880~1'(= r ) %2879~0'(= r ) 
; #266 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2882~1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2880~1'(= r ) %2879~0'(= r ) 
; #308 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2883~0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2880~1'(= r ) %2879~0'(= r ) 
; #26 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2884~0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2880~1'(= r ) %2879~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 001000001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_3614
LB_3614:
	cmp BYTE [r8+6],0
	jnz LB_3598
	POP_GRM_SCC
	jmp LB_3597
LB_3598:
	RB_GRM
	jmp LB_3617
LB_3616:
	add r14,1 
LB_3617:
	cmp r14,r9
	jge LB_3618
	JZ_SPC BYTE [r13+8+r14], LB_3616
LB_3618
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_3621
	jmp LB_3622
LB_3621:
	jmp LB_3619
LB_3622:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3620
LB_3619:
	add rsp,0
	jmp LB_3615
LB_3620:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3623
LB_3623
;; rsp=0 , %2887~1'(= r ) %2886~0'(= r ) %2885~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2888~1(<2)◂{ } %2887~1'(= r ) %2886~0'(= r ) %2885~{ } 
; $ %[ "grb_etr 1" ] ⊢ %[ "grb_etr 1" ]
;; rsp=0 , %2889~%[ "grb_etr 1" ] %2888~1(<2)◂{ } %2887~1'(= r ) %2886~0'(= r ) %2885~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2890~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2885~{ } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2891~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2885~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2892~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2885~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],9
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],114
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],49
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3624
LB_3624:
	cmp BYTE [r8+6],0
	jnz LB_3615
	POP_GRM_SCC
	jmp LB_3597
LB_3615:
	POP_GRM_FAIL 
	jmp LB_3597
LB_3597:
	cmp BYTE [r8+6],0
	jnz LB_3625
	jmp LB_3626
LB_3625:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3626:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3627
LB_3627
;; rsp=0 , %2893~3'(= a47◂ [ a42◂ [ ]] ) %2876~1'(= r ) %2875~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2894~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2876~1'(= r ) %2875~0'(= r ) 
; ∎ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
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
; .mov_ptn2 0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3628
LB_3628:
	cmp BYTE [r8+6],0
	jnz LB_3587
	POP_GRM_SCC
	ret
LB_3587:
	RB_GRM
	jmp LB_3631
LB_3630:
	add r14,1 
LB_3631:
	cmp r14,r9
	jge LB_3632
	JZ_SPC BYTE [r13+8+r14], LB_3630
LB_3632
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3635
	jmp LB_3636
LB_3635:
	jmp LB_3633
LB_3636:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3634
LB_3633:
	add rsp,0
	jmp LB_3629
LB_3634:
	jmp LB_3638
LB_3637:
	add r14,1 
LB_3638:
	cmp r14,r9
	jge LB_3639
	JZ_SPC BYTE [r13+8+r14], LB_3637
LB_3639
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3642
	jmp LB_3643
LB_3642:
	mov r8,unt_1
	jmp LB_3640
LB_3643:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3644
	cmp BYTE [rdi+1],167
	jnz LB_3644
	cmp BYTE [rdi+2],194
	jnz LB_3644
	cmp BYTE [rdi+3],167
	jnz LB_3644
	jmp LB_3645
LB_3644:
	mov r8,unt_1
	jmp LB_3640
LB_3645:
	add r14,4
	jmp LB_3641
LB_3640:
	add rsp,8
	jmp LB_3629
LB_3641:
	PUSH_GRM
	jmp LB_3649
LB_3648:
	add r14,1 
LB_3649:
	cmp r14,r9
	jge LB_3650
	JZ_SPC BYTE [r13+8+r14], LB_3648
LB_3650
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3653
	jmp LB_3654
LB_3653:
	jmp LB_3651
LB_3654:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3652
LB_3651:
	add rsp,0
	jmp LB_3647
LB_3652:
	jmp LB_3656
LB_3655:
	add r14,1 
LB_3656:
	cmp r14,r9
	jge LB_3657
	JZ_SPC BYTE [r13+8+r14], LB_3655
LB_3657
	call GRM_363
	cmp BYTE [r8+6],0
	jnz LB_3660
	jmp LB_3661
LB_3660:
	jmp LB_3658
LB_3661:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a43◂ [ ]] ) ⊢ 9'(= a47◂ [ a43◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3659
LB_3658:
	add rsp,8
	jmp LB_3647
LB_3659:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3662
LB_3662
;; rsp=2 , %2901~1'(= r ) %2900~0'(= r ) %2899~9'(= a47◂ [ a43◂ [ ]] ) %2898~8'(= {| l |} ) 
;; ? 9'(= a47◂ [ a43◂ [ ]] ) ⊢ 0(<2)◂2'(= a43◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3665
	jmp LB_3666
LB_3665:
	jmp LB_3664
LB_3666:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2903~2'(= a43◂ [ ] ) %2901~1'(= r ) %2900~0'(= r ) %2898~8'(= {| l |} ) 
; #267 { 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2904~0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2901~1'(= r ) %2900~0'(= r ) 
; #308 0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2905~0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2901~1'(= r ) %2900~0'(= r ) 
; #26 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2906~0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2901~1'(= r ) %2900~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010000010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3663
LB_3664:
;; ?. 9'(= a47◂ [ a43◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2902~2'(= a2◂ [ *{ rr{| l |}}] ) %2901~1'(= r ) %2900~0'(= r ) %2898~8'(= {| l |} ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2907~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2901~1'(= r ) %2900~0'(= r ) %2898~8'(= {| l |} ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2908~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2901~1'(= r ) %2900~0'(= r ) %2898~8'(= {| l |} ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3663
LB_3663:
	cmp BYTE [r8+6],0
	jnz LB_3647
	POP_GRM_SCC
	jmp LB_3646
LB_3647:
	RB_GRM
	jmp LB_3669
LB_3668:
	add r14,1 
LB_3669:
	cmp r14,r9
	jge LB_3670
	JZ_SPC BYTE [r13+8+r14], LB_3668
LB_3670
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3673
	jmp LB_3674
LB_3673:
	jmp LB_3671
LB_3674:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3672
LB_3671:
	add rsp,0
	jmp LB_3667
LB_3672:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3675
LB_3675
;; rsp=0 , %2911~1'(= r ) %2910~0'(= r ) %2909~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2912~1(<2)◂{ } %2911~1'(= r ) %2910~0'(= r ) %2909~{ } 
; $ %[ "glb_etr 0.1" ] ⊢ %[ "glb_etr 0.1" ]
;; rsp=0 , %2913~%[ "glb_etr 0.1" ] %2912~1(<2)◂{ } %2911~1'(= r ) %2910~0'(= r ) %2909~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2914~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2909~{ } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2915~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2909~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2916~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2909~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],11
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],48
	mov BYTE [rax+8+9],46
	mov BYTE [rax+8+10],49
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3676
LB_3676:
	cmp BYTE [r8+6],0
	jnz LB_3667
	POP_GRM_SCC
	jmp LB_3646
LB_3667:
	POP_GRM_FAIL 
	jmp LB_3646
LB_3646:
	cmp BYTE [r8+6],0
	jnz LB_3677
	jmp LB_3678
LB_3677:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3678:
	mov QWORD [rsp+8*1],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 1111000010.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3679
LB_3679
;; rsp=1 , %2917~3'(= a47◂ [ a42◂ [ ]] ) %2897~1'(= r ) %2896~0'(= r ) %2895~8'(= a47◂ [ *{ }] ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=1 , %2918~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2897~1'(= r ) %2896~0'(= r ) %2895~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3680
LB_3680:
	cmp BYTE [r8+6],0
	jnz LB_3629
	POP_GRM_SCC
	ret
LB_3629:
	RB_GRM
	jmp LB_3683
LB_3682:
	add r14,1 
LB_3683:
	cmp r14,r9
	jge LB_3684
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3682
LB_3684
	call GRM_341
	cmp BYTE [r8+6],0
	jnz LB_3687
	jmp LB_3688
LB_3687:
	jmp LB_3685
LB_3688:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3686
LB_3685:
	add rsp,0
	jmp LB_3681
LB_3686:
	jmp LB_3690
LB_3689:
	add r14,1 
LB_3690:
	cmp r14,r9
	jge LB_3691
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3689
LB_3691
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3694
	jmp LB_3695
LB_3694:
	mov r8,unt_1
	jmp LB_3692
LB_3695:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3696
	jmp LB_3697
LB_3696:
	mov r8,unt_1
	jmp LB_3692
LB_3697:
	add r14,1
	jmp LB_3693
LB_3692:
	add rsp,0
	jmp LB_3681
LB_3693:
	jmp LB_3699
LB_3698:
	add r14,1 
LB_3699:
	cmp r14,r9
	jge LB_3700
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3698
LB_3700
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_3703
	jmp LB_3704
LB_3703:
	jmp LB_3701
LB_3704:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3702
LB_3701:
	add rsp,0
	jmp LB_3681
LB_3702:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3705
LB_3705
;; rsp=1 , %2921~1'(= r ) %2920~0'(= r ) %2919~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3708
	jmp LB_3709
LB_3708:
	jmp LB_3707
LB_3709:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2923~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2921~1'(= r ) %2920~0'(= r ) 
; #257 2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %2924~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2921~1'(= r ) %2920~0'(= r ) 
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=1 , %2925~%[ "" ] %2924~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2921~1'(= r ) %2920~0'(= r ) 
; #265 { %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2926~2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2921~1'(= r ) %2920~0'(= r ) 
; #308 2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2927~0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2921~1'(= r ) %2920~0'(= r ) 
; #26 0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2928~0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2921~1'(= r ) %2920~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r14,rax
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r14
	mov r14,rax
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3706
LB_3707:
;; ?. 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2922~2'(= a2◂ [ *{ rr{| l |}}] ) %2921~1'(= r ) %2920~0'(= r ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2929~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2921~1'(= r ) %2920~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2930~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2921~1'(= r ) %2920~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3706
LB_3706:
	cmp BYTE [r8+6],0
	jnz LB_3681
	POP_GRM_SCC
	ret
LB_3681:
	RB_GRM
	jmp LB_3712
LB_3711:
	add r14,1 
LB_3712:
	cmp r14,r9
	jge LB_3713
	JZ_SPC BYTE [r13+8+r14], LB_3711
LB_3713
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3716
	jmp LB_3717
LB_3716:
	mov r8,unt_1
	jmp LB_3714
LB_3717:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3718
	cmp BYTE [rdi+1],167
	jnz LB_3718
	jmp LB_3719
LB_3718:
	mov r8,unt_1
	jmp LB_3714
LB_3719:
	add r14,2
	jmp LB_3715
LB_3714:
	add rsp,0
	jmp LB_3710
LB_3715:
	PUSH_GRM
	jmp LB_3723
LB_3722:
	add r14,1 
LB_3723:
	cmp r14,r9
	jge LB_3724
	JZ_SPC BYTE [r13+8+r14], LB_3722
LB_3724
	call GRM_371
	cmp BYTE [r8+6],0
	jnz LB_3727
	jmp LB_3728
LB_3727:
	jmp LB_3725
LB_3728:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 8'(= a47◂ [ a42◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3726
LB_3725:
	add rsp,0
	jmp LB_3721
LB_3726:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3729
LB_3729
;; rsp=1 , %2935~1'(= r ) %2934~0'(= r ) %2933~8'(= a47◂ [ a42◂ [ ]] ) 
; #26 8'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂8'(= a47◂ [ a42◂ [ ]] )
;; rsp=1 , %2936~0(<2)◂8'(= a47◂ [ a42◂ [ ]] ) %2935~1'(= r ) %2934~0'(= r ) 
; ∎ 0(<2)◂8'(= a47◂ [ a42◂ [ ]] )
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
; .mov_ptn2 0(<2)◂8'(= a47◂ [ a42◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3730
LB_3730:
	cmp BYTE [r8+6],0
	jnz LB_3721
	POP_GRM_SCC
	jmp LB_3720
LB_3721:
	RB_GRM
	jmp LB_3733
LB_3732:
	add r14,1 
LB_3733:
	cmp r14,r9
	jge LB_3734
	JZ_SPC BYTE [r13+8+r14], LB_3732
LB_3734
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_3737
	jmp LB_3738
LB_3737:
	jmp LB_3735
LB_3738:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3736
LB_3735:
	add rsp,0
	jmp LB_3731
LB_3736:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3739
LB_3739
;; rsp=0 , %2939~1'(= r ) %2938~0'(= r ) %2937~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2940~1(<2)◂{ } %2939~1'(= r ) %2938~0'(= r ) %2937~{ } 
; $ %[ "glb_etr 3" ] ⊢ %[ "glb_etr 3" ]
;; rsp=0 , %2941~%[ "glb_etr 3" ] %2940~1(<2)◂{ } %2939~1'(= r ) %2938~0'(= r ) %2937~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2942~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2937~{ } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2943~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2937~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2944~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2937~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],9
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],51
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3740
LB_3740:
	cmp BYTE [r8+6],0
	jnz LB_3731
	POP_GRM_SCC
	jmp LB_3720
LB_3731:
	POP_GRM_FAIL 
	jmp LB_3720
LB_3720:
	cmp BYTE [r8+6],0
	jnz LB_3741
	jmp LB_3742
LB_3741:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3742:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3743
LB_3743
;; rsp=0 , %2945~3'(= a47◂ [ a42◂ [ ]] ) %2932~1'(= r ) %2931~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2946~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2932~1'(= r ) %2931~0'(= r ) 
; ∎ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
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
; .mov_ptn2 0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3744
LB_3744:
	cmp BYTE [r8+6],0
	jnz LB_3710
	POP_GRM_SCC
	ret
LB_3710:
	RB_GRM
	jmp LB_3747
LB_3746:
	add r14,1 
LB_3747:
	cmp r14,r9
	jge LB_3748
	JZ_SPC BYTE [r13+8+r14], LB_3746
LB_3748
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3751
	jmp LB_3752
LB_3751:
	mov r8,unt_1
	jmp LB_3749
LB_3752:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3753
	cmp BYTE [rdi+1],182
	jnz LB_3753
	jmp LB_3754
LB_3753:
	mov r8,unt_1
	jmp LB_3749
LB_3754:
	add r14,2
	jmp LB_3750
LB_3749:
	add rsp,0
	jmp LB_3745
LB_3750:
	PUSH_GRM
	jmp LB_3758
LB_3757:
	add r14,1 
LB_3758:
	cmp r14,r9
	jge LB_3759
	JZ_SPC BYTE [r13+8+r14], LB_3757
LB_3759
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3762
	jmp LB_3763
LB_3762:
	jmp LB_3760
LB_3763:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a42◂ [ ] ) ⊢ 8'(= a42◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3761
LB_3760:
	add rsp,0
	jmp LB_3756
LB_3761:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3764
LB_3764
;; rsp=1 , %2951~1'(= r ) %2950~0'(= r ) %2949~8'(= a42◂ [ ] ) 
; #308 8'(= a42◂ [ ] ) ⊢ 0(<2)◂8'(= a42◂ [ ] )
;; rsp=1 , %2952~0(<2)◂8'(= a42◂ [ ] ) %2951~1'(= r ) %2950~0'(= r ) 
; #26 0(<2)◂8'(= a42◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a42◂ [ ] )
;; rsp=1 , %2953~0(<2)◂0(<2)◂8'(= a42◂ [ ] ) %2951~1'(= r ) %2950~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a42◂ [ ] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a42◂ [ ] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3765
LB_3765:
	cmp BYTE [r8+6],0
	jnz LB_3756
	POP_GRM_SCC
	jmp LB_3755
LB_3756:
	RB_GRM
	jmp LB_3768
LB_3767:
	add r14,1 
LB_3768:
	cmp r14,r9
	jge LB_3769
	JZ_SPC BYTE [r13+8+r14], LB_3767
LB_3769
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_3772
	jmp LB_3773
LB_3772:
	jmp LB_3770
LB_3773:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3771
LB_3770:
	add rsp,0
	jmp LB_3766
LB_3771:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3774
LB_3774
;; rsp=0 , %2956~1'(= r ) %2955~0'(= r ) %2954~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2957~1(<2)◂{ } %2956~1'(= r ) %2955~0'(= r ) %2954~{ } 
; $ %[ "glb_etr 4" ] ⊢ %[ "glb_etr 4" ]
;; rsp=0 , %2958~%[ "glb_etr 4" ] %2957~1(<2)◂{ } %2956~1'(= r ) %2955~0'(= r ) %2954~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2959~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2954~{ } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2960~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2954~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2961~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2954~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],9
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],52
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3775
LB_3775:
	cmp BYTE [r8+6],0
	jnz LB_3766
	POP_GRM_SCC
	jmp LB_3755
LB_3766:
	POP_GRM_FAIL 
	jmp LB_3755
LB_3755:
	cmp BYTE [r8+6],0
	jnz LB_3776
	jmp LB_3777
LB_3776:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3777:
	mov QWORD [rsp+8*0],r14
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3778
LB_3778
;; rsp=0 , %2962~3'(= a47◂ [ a42◂ [ ]] ) %2948~1'(= r ) %2947~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2963~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2948~1'(= r ) %2947~0'(= r ) 
; ∎ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
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
; .mov_ptn2 0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_3779
LB_3779:
	cmp BYTE [r8+6],0
	jnz LB_3745
	POP_GRM_SCC
	ret
LB_3745:
	POP_GRM_FAIL 
	ret
ETR_361:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_361
	ret
GRM_361:
	PUSH_GRM
	jmp LB_3782
LB_3781:
	add r14,1 
LB_3782:
	cmp r14,r9
	jge LB_3783
	JZ_SPC BYTE [r13+8+r14], LB_3781
LB_3783
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_3786
	jmp LB_3787
LB_3786:
	jmp LB_3784
LB_3787:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3785
LB_3784:
	add rsp,0
	jmp LB_3780
LB_3785:
	jmp LB_3789
LB_3788:
	add r14,1 
LB_3789:
	cmp r14,r9
	jge LB_3790
	JZ_SPC BYTE [r13+8+r14], LB_3788
LB_3790
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_3793
	jmp LB_3794
LB_3793:
	jmp LB_3791
LB_3794:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3792
LB_3791:
	add rsp,0
	jmp LB_3780
LB_3792:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3795
LB_3795
;; rsp=0 , %2967~1'(= r ) %2966~0'(= r ) %2965~{ } %2964~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2968~0(<2)◂{ } %2967~1'(= r ) %2966~0'(= r ) %2965~{ } %2964~{ } 
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
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_3796
LB_3796:
	cmp BYTE [r8+6],0
	jnz LB_3780
	POP_GRM_SCC
	ret
LB_3780:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3798
LB_3798
;; rsp=0 , %2970~1'(= r ) %2969~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2971~0(<2)◂{ } %2970~1'(= r ) %2969~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_3799
LB_3799:
	cmp BYTE [r8+6],0
	jnz LB_3797
	POP_GRM_SCC
	ret
LB_3797:
	POP_GRM_FAIL 
	ret
ETR_362:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_362
	ret
GRM_362:
	PUSH_GRM
	jmp LB_3802
LB_3801:
	add r14,1 
LB_3802:
	cmp r14,r9
	jge LB_3803
	JZ_SPC BYTE [r13+8+r14], LB_3801
LB_3803
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3806
	jmp LB_3807
LB_3806:
	mov r8,unt_1
	jmp LB_3804
LB_3807:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3808
	cmp BYTE [rdi+1],136
	jnz LB_3808
	cmp BYTE [rdi+2],142
	jnz LB_3808
	cmp BYTE [rdi+3],226
	jnz LB_3808
	cmp BYTE [rdi+4],136
	jnz LB_3808
	cmp BYTE [rdi+5],142
	jnz LB_3808
	jmp LB_3809
LB_3808:
	mov r8,unt_1
	jmp LB_3804
LB_3809:
	add r14,6
	jmp LB_3805
LB_3804:
	add rsp,0
	jmp LB_3800
LB_3805:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3810
LB_3810
;; rsp=0 , %2973~1'(= r ) %2972~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2974~0(<2)◂{ } %2973~1'(= r ) %2972~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_3811
LB_3811:
	cmp BYTE [r8+6],0
	jnz LB_3800
	POP_GRM_SCC
	ret
LB_3800:
	RB_GRM
	jmp LB_3814
LB_3813:
	add r14,1 
LB_3814:
	cmp r14,r9
	jge LB_3815
	JZ_SPC BYTE [r13+8+r14], LB_3813
LB_3815
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3818
	jmp LB_3819
LB_3818:
	mov r8,unt_1
	jmp LB_3816
LB_3819:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3820
	cmp BYTE [rdi+1],167
	jnz LB_3820
	cmp BYTE [rdi+2],194
	jnz LB_3820
	cmp BYTE [rdi+3],167
	jnz LB_3820
	jmp LB_3821
LB_3820:
	mov r8,unt_1
	jmp LB_3816
LB_3821:
	add r14,4
	jmp LB_3817
LB_3816:
	add rsp,0
	jmp LB_3812
LB_3817:
	PUSH_GRM
	jmp LB_3825
LB_3824:
	add r14,1 
LB_3825:
	cmp r14,r9
	jge LB_3826
	JZ_SPC BYTE [r13+8+r14], LB_3824
LB_3826
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3829
	jmp LB_3830
LB_3829:
	jmp LB_3827
LB_3830:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3828
LB_3827:
	add rsp,0
	jmp LB_3823
LB_3828:
	jmp LB_3832
LB_3831:
	add r14,1 
LB_3832:
	cmp r14,r9
	jge LB_3833
	JZ_SPC BYTE [r13+8+r14], LB_3831
LB_3833
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3836
	jmp LB_3837
LB_3836:
	mov r8,unt_1
	jmp LB_3834
LB_3837:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3838
	jmp LB_3839
LB_3838:
	mov r8,unt_1
	jmp LB_3834
LB_3839:
	add r14,1
	jmp LB_3835
LB_3834:
	add rsp,8
	jmp LB_3823
LB_3835:
	jmp LB_3841
LB_3840:
	add r14,1 
LB_3841:
	cmp r14,r9
	jge LB_3842
	JZ_SPC BYTE [r13+8+r14], LB_3840
LB_3842
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_3845
	jmp LB_3846
LB_3845:
	jmp LB_3843
LB_3846:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3844
LB_3843:
	add rsp,8
	jmp LB_3823
LB_3844:
	jmp LB_3848
LB_3847:
	add r14,1 
LB_3848:
	cmp r14,r9
	jge LB_3849
	JZ_SPC BYTE [r13+8+r14], LB_3847
LB_3849
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3852
	jmp LB_3853
LB_3852:
	jmp LB_3850
LB_3853:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110000110.. |}
	jmp LB_3851
LB_3850:
	add rsp,16
	jmp LB_3823
LB_3851:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3854
LB_3854
;; rsp=2 , %2981~1'(= r ) %2980~0'(= r ) %2979~{ } %2978~9'(= a18◂ [ ] ) %2977~8'(= {| l |} ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=2 , %2982~0(<2)◂{ } %2981~1'(= r ) %2980~0'(= r ) %2979~{ } %2978~9'(= a18◂ [ ] ) %2977~8'(= {| l |} ) 
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
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	add rsp,16
	jmp LB_3855
LB_3855:
	cmp BYTE [r8+6],0
	jnz LB_3823
	POP_GRM_SCC
	jmp LB_3822
LB_3823:
	RB_GRM
	jmp LB_3858
LB_3857:
	add r14,1 
LB_3858:
	cmp r14,r9
	jge LB_3859
	JZ_SPC BYTE [r13+8+r14], LB_3857
LB_3859
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3862
	jmp LB_3863
LB_3862:
	jmp LB_3860
LB_3863:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3861
LB_3860:
	add rsp,0
	jmp LB_3856
LB_3861:
	jmp LB_3865
LB_3864:
	add r14,1 
LB_3865:
	cmp r14,r9
	jge LB_3866
	JZ_SPC BYTE [r13+8+r14], LB_3864
LB_3866
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3869
	jmp LB_3870
LB_3869:
	jmp LB_3867
LB_3870:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3868
LB_3867:
	add rsp,0
	jmp LB_3856
LB_3868:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3871
LB_3871
;; rsp=0 , %2986~1'(= r ) %2985~0'(= r ) %2984~{ } %2983~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2987~0(<2)◂{ } %2986~1'(= r ) %2985~0'(= r ) %2984~{ } %2983~{ } 
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
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_3872
LB_3872:
	cmp BYTE [r8+6],0
	jnz LB_3856
	POP_GRM_SCC
	jmp LB_3822
LB_3856:
	POP_GRM_FAIL 
	jmp LB_3822
LB_3822:
	cmp BYTE [r8+6],0
	jnz LB_3873
	jmp LB_3874
LB_3873:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3874:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3875
LB_3875
;; rsp=0 , %2988~{ } %2976~1'(= r ) %2975~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2989~0(<2)◂{ } %2988~{ } %2976~1'(= r ) %2975~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn { }
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_3876
LB_3876:
	cmp BYTE [r8+6],0
	jnz LB_3812
	POP_GRM_SCC
	ret
LB_3812:
	RB_GRM
	jmp LB_3879
LB_3878:
	add r14,1 
LB_3879:
	cmp r14,r9
	jge LB_3880
	JZ_SPC BYTE [r13+8+r14], LB_3878
LB_3880
	cmp r14,r9
	jge LB_3883
	jmp LB_3884
LB_3883:
	mov r8,unt_1 
	jmp LB_3881
LB_3884:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_3882
LB_3881:
	add rsp,0
	jmp LB_3877
LB_3882:
	jmp LB_3886
LB_3885:
	add r14,1 
LB_3886:
	cmp r14,r9
	jge LB_3887
	JZ_SPC BYTE [r13+8+r14], LB_3885
LB_3887
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3890
	jmp LB_3891
LB_3890:
	jmp LB_3888
LB_3891:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1111000010.. |}
	jmp LB_3889
LB_3888:
	add rsp,8
	jmp LB_3877
LB_3889:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3892
LB_3892
;; rsp=1 , %2993~1'(= r ) %2992~0'(= r ) %2991~{ } %2990~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2994~0(<2)◂{ } %2993~1'(= r ) %2992~0'(= r ) %2991~{ } %2990~8'(= r ) 
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
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	add rsp,8
	jmp LB_3893
LB_3893:
	cmp BYTE [r8+6],0
	jnz LB_3877
	POP_GRM_SCC
	ret
LB_3877:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3895
LB_3895
;; rsp=0 , %2996~1'(= r ) %2995~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2997~0(<2)◂{ } %2996~1'(= r ) %2995~0'(= r ) 
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
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; {| 0010.. |}
	mov r8,unt_0
	jmp LB_3896
LB_3896:
	cmp BYTE [r8+6],0
	jnz LB_3894
	POP_GRM_SCC
	ret
LB_3894:
	POP_GRM_FAIL 
	ret
ETR_363:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_363
	ret
GRM_363:
	PUSH_GRM
	jmp LB_3899
LB_3898:
	add r14,1 
LB_3899:
	cmp r14,r9
	jge LB_3900
	JZ_SPC BYTE [r13+8+r14], LB_3898
LB_3900
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3903
	jmp LB_3904
LB_3903:
	mov r8,unt_1
	jmp LB_3901
LB_3904:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3905
	jmp LB_3906
LB_3905:
	mov r8,unt_1
	jmp LB_3901
LB_3906:
	add r14,1
	jmp LB_3902
LB_3901:
	add rsp,0
	jmp LB_3897
LB_3902:
	jmp LB_3908
LB_3907:
	add r14,1 
LB_3908:
	cmp r14,r9
	jge LB_3909
	JZ_SPC BYTE [r13+8+r14], LB_3907
LB_3909
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_3912
	jmp LB_3913
LB_3912:
	jmp LB_3910
LB_3913:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3911
LB_3910:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3911:
	jmp LB_3915
LB_3914:
	add r14,1 
LB_3915:
	cmp r14,r9
	jge LB_3916
	JZ_SPC BYTE [r13+8+r14], LB_3914
LB_3916
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3919
	jmp LB_3920
LB_3919:
	jmp LB_3917
LB_3920:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3918
LB_3917:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3918:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3921
LB_3921
;; rsp=2 , %3001~1'(= r ) %3000~0'(= r ) %2999~9'(= a47◂ [ *{ }] ) %2998~8'(= a18◂ [ ] ) 
; #260 8'(= a18◂ [ ] ) ⊢ 1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %3002~1(<2)◂8'(= a18◂ [ ] ) %3001~1'(= r ) %3000~0'(= r ) %2999~9'(= a47◂ [ *{ }] ) 
; #308 1(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %3003~0(<2)◂1(<2)◂8'(= a18◂ [ ] ) %3001~1'(= r ) %3000~0'(= r ) %2999~9'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %3004~0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] ) %3001~1'(= r ) %3000~0'(= r ) %2999~9'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] )
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
; .dlt.ptn 9'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] ) ⊢ 2'(= a3◂ [ a47◂ [ a43◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*2]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3922
LB_3922:
	cmp BYTE [r8+6],0
	jnz LB_3897
	POP_GRM_SCC
	ret
LB_3897:
	RB_GRM
	jmp LB_3925
LB_3924:
	add r14,1 
LB_3925:
	cmp r14,r9
	jge LB_3926
	JZ_SPC BYTE [r13+8+r14], LB_3924
LB_3926
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3929
	jmp LB_3930
LB_3929:
	jmp LB_3927
LB_3930:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3928
LB_3927:
	add rsp,0
	jmp LB_3923
LB_3928:
	jmp LB_3932
LB_3931:
	add r14,1 
LB_3932:
	cmp r14,r9
	jge LB_3933
	JZ_SPC BYTE [r13+8+r14], LB_3931
LB_3933
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3936
	jmp LB_3937
LB_3936:
	jmp LB_3934
LB_3937:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3935
LB_3934:
	add rsp,8
	jmp LB_3923
LB_3935:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3938
LB_3938
;; rsp=2 , %3008~1'(= r ) %3007~0'(= r ) %3006~9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %3005~8'(= a47◂ [ *{ }] ) 
;; ? 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3941
	jmp LB_3942
LB_3941:
	jmp LB_3940
LB_3942:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3010~2'(= a2◂ [ a42◂ [ ]] ) %3008~1'(= r ) %3007~0'(= r ) %3005~8'(= a47◂ [ *{ }] ) 
; #261 2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %3011~0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %3008~1'(= r ) %3007~0'(= r ) %3005~8'(= a47◂ [ *{ }] ) 
; #308 0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %3012~0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %3008~1'(= r ) %3007~0'(= r ) %3005~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %3013~0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %3008~1'(= r ) %3007~0'(= r ) %3005~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a43◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3939
LB_3940:
;; ?. 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3009~2'(= a2◂ [ *{ rr{| l |}}] ) %3008~1'(= r ) %3007~0'(= r ) %3005~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3014~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3008~1'(= r ) %3007~0'(= r ) %3005~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3015~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3008~1'(= r ) %3007~0'(= r ) %3005~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a43◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3939
LB_3939:
	cmp BYTE [r8+6],0
	jnz LB_3923
	POP_GRM_SCC
	ret
LB_3923:
	POP_GRM_FAIL 
	ret
ETR_364:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_364
	ret
GRM_364:
	PUSH_GRM
	jmp LB_3945
LB_3944:
	add r14,1 
LB_3945:
	cmp r14,r9
	jge LB_3946
	JZ_SPC BYTE [r13+8+r14], LB_3944
LB_3946
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3949
	jmp LB_3950
LB_3949:
	jmp LB_3947
LB_3950:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3948
LB_3947:
	add rsp,0
	jmp LB_3943
LB_3948:
	jmp LB_3952
LB_3951:
	add r14,1 
LB_3952:
	cmp r14,r9
	jge LB_3953
	JZ_SPC BYTE [r13+8+r14], LB_3951
LB_3953
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3956
	jmp LB_3957
LB_3956:
	mov r8,unt_1
	jmp LB_3954
LB_3957:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3958
	cmp BYTE [rdi+1],136
	jnz LB_3958
	cmp BYTE [rdi+2],142
	jnz LB_3958
	cmp BYTE [rdi+3],226
	jnz LB_3958
	cmp BYTE [rdi+4],136
	jnz LB_3958
	cmp BYTE [rdi+5],142
	jnz LB_3958
	jmp LB_3959
LB_3958:
	mov r8,unt_1
	jmp LB_3954
LB_3959:
	add r14,6
	jmp LB_3955
LB_3954:
	add rsp,8
	jmp LB_3943
LB_3955:
	jmp LB_3961
LB_3960:
	add r14,1 
LB_3961:
	cmp r14,r9
	jge LB_3962
	JZ_SPC BYTE [r13+8+r14], LB_3960
LB_3962
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3965
	jmp LB_3966
LB_3965:
	jmp LB_3963
LB_3966:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3964
LB_3963:
	add rsp,8
	jmp LB_3943
LB_3964:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3967
LB_3967
;; rsp=2 , %3019~1'(= r ) %3018~0'(= r ) %3017~9'(= a47◂ [ *{ }] ) %3016~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %3020~1(<2)◂{ } %3019~1'(= r ) %3018~0'(= r ) %3017~9'(= a47◂ [ *{ }] ) %3016~8'(= a47◂ [ *{ }] ) 
; #308 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %3021~0(<2)◂1(<2)◂{ } %3019~1'(= r ) %3018~0'(= r ) %3017~9'(= a47◂ [ *{ }] ) %3016~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=2 , %3022~0(<2)◂0(<2)◂1(<2)◂{ } %3019~1'(= r ) %3018~0'(= r ) %3017~9'(= a47◂ [ *{ }] ) %3016~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
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
; .dlt.ptn 9'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_3968
LB_3968:
	cmp BYTE [r8+6],0
	jnz LB_3943
	POP_GRM_SCC
	ret
LB_3943:
	RB_GRM
	jmp LB_3971
LB_3970:
	add r14,1 
LB_3971:
	cmp r14,r9
	jge LB_3972
	JZ_SPC BYTE [r13+8+r14], LB_3970
LB_3972
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3975
	jmp LB_3976
LB_3975:
	jmp LB_3973
LB_3976:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3974
LB_3973:
	add rsp,0
	jmp LB_3969
LB_3974:
	jmp LB_3978
LB_3977:
	add r14,1 
LB_3978:
	cmp r14,r9
	jge LB_3979
	JZ_SPC BYTE [r13+8+r14], LB_3977
LB_3979
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_3982
	jmp LB_3983
LB_3982:
	jmp LB_3980
LB_3983:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 9'(= a47◂ [ a42◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3981
LB_3980:
	add rsp,8
	jmp LB_3969
LB_3981:
	jmp LB_3985
LB_3984:
	add r14,1 
LB_3985:
	cmp r14,r9
	jge LB_3986
	JZ_SPC BYTE [r13+8+r14], LB_3984
LB_3986
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3989
	jmp LB_3990
LB_3989:
	jmp LB_3987
LB_3990:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_3988
LB_3987:
	add rsp,16
	jmp LB_3969
LB_3988:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3991
LB_3991
;; rsp=3 , %3027~1'(= r ) %3026~0'(= r ) %3025~10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %3024~9'(= a47◂ [ a42◂ [ ]] ) %3023~8'(= a47◂ [ *{ }] ) 
; #309 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
	call LB_3419
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=1 , %3028~2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3994
	jmp LB_3995
LB_3994:
	jmp LB_3993
LB_3995:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %3031~4'(= a2◂ [ a42◂ [ ]] ) %3030~3'(= a42◂ [ ] ) %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
; #25 { 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %3032~0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
; #308 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %3033~0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %3034~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
; {| 001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,r9
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r10
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3992
LB_3993:
;; ?. 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3029~3'(= a2◂ [ *{ rr{| l |}}] ) %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3035~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3036~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3027~1'(= r ) %3026~0'(= r ) %3023~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_3992
LB_3992:
	cmp BYTE [r8+6],0
	jnz LB_3969
	POP_GRM_SCC
	ret
LB_3969:
	RB_GRM
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3999
	jmp LB_4000
LB_3999:
	jmp LB_3997
LB_4000:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
	jmp LB_3998
LB_3997:
	add rsp,0
	jmp LB_3996
LB_3998:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4001
LB_4001
;; rsp=0 , %3039~1'(= r ) %3038~0'(= r ) %3037~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3040~1(<2)◂{ } %3039~1'(= r ) %3038~0'(= r ) %3037~{ } 
; $ %[ "glb_etr 7" ] ⊢ %[ "glb_etr 7" ]
;; rsp=0 , %3041~%[ "glb_etr 7" ] %3040~1(<2)◂{ } %3039~1'(= r ) %3038~0'(= r ) %3037~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %3042~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %3037~{ } 
; #307 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %3043~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %3037~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %3044~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %3037~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
; {| 1110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r9,rax
	mov r10,r13
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,r14
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],9
	mov BYTE [rax+8+0],103
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],98
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],101
	mov BYTE [rax+8+5],116
	mov BYTE [rax+8+6],114
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],55
	mov r10,rax
	mov rax,r10
	mov QWORD [r9+24],rax
	mov rax,r9
	mov QWORD [r8+8],rax
	mov r9,unt_1
	mov rax,r9
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4002
LB_4002:
	cmp BYTE [r8+6],0
	jnz LB_3996
	POP_GRM_SCC
	ret
LB_3996:
	POP_GRM_FAIL 
	ret
ETR_365:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_365
	ret
GRM_365:
	PUSH_GRM
	jmp LB_4005
LB_4004:
	add r14,1 
LB_4005:
	cmp r14,r9
	jge LB_4006
	JZ_SPC BYTE [r13+8+r14], LB_4004
LB_4006
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4009
	jmp LB_4010
LB_4009:
	mov r8,unt_1
	jmp LB_4007
LB_4010:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4011
	jmp LB_4012
LB_4011:
	mov r8,unt_1
	jmp LB_4007
LB_4012:
	add r14,1
	jmp LB_4008
LB_4007:
	add rsp,0
	jmp LB_4003
LB_4008:
	jmp LB_4014
LB_4013:
	add r14,1 
LB_4014:
	cmp r14,r9
	jge LB_4015
	JZ_SPC BYTE [r13+8+r14], LB_4013
LB_4015
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4018
	jmp LB_4019
LB_4018:
	mov r8,unt_1
	jmp LB_4016
LB_4019:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4020
	jmp LB_4021
LB_4020:
	mov r8,unt_1
	jmp LB_4016
LB_4021:
	add r14,1
	jmp LB_4017
LB_4016:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4017:
	jmp LB_4023
LB_4022:
	add r14,1 
LB_4023:
	cmp r14,r9
	jge LB_4024
	JZ_SPC BYTE [r13+8+r14], LB_4022
LB_4024
	call GRM_366
	cmp BYTE [r8+6],0
	jnz LB_4027
	jmp LB_4028
LB_4027:
	jmp LB_4025
LB_4028:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a45◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_4026
LB_4025:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4026:
	jmp LB_4030
LB_4029:
	add r14,1 
LB_4030:
	cmp r14,r9
	jge LB_4031
	JZ_SPC BYTE [r13+8+r14], LB_4029
LB_4031
	call GRM_369
	cmp BYTE [r8+6],0
	jnz LB_4034
	jmp LB_4035
LB_4034:
	jmp LB_4032
LB_4035:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4033
LB_4032:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4033:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_4036
LB_4036
;; rsp=3 , %3048~1'(= r ) %3047~0'(= r ) %3046~10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) %3045~{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3049~0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3048~1'(= r ) %3047~0'(= r ) 
; #262 0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3050~5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3048~1'(= r ) %3047~0'(= r ) 
; #26 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3051~0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3048~1'(= r ) %3047~0'(= r ) 
; ∎ 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
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
; .mov_ptn2 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a42◂ [ ]] )
; {| 001000001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],5
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_4037
LB_4037:
	cmp BYTE [r8+6],0
	jnz LB_4003
	POP_GRM_SCC
	ret
LB_4003:
	RB_GRM
	jmp LB_4040
LB_4039:
	add r14,1 
LB_4040:
	cmp r14,r9
	jge LB_4041
	JZ_SPC BYTE [r13+8+r14], LB_4039
LB_4041
	call GRM_366
	cmp BYTE [r8+6],0
	jnz LB_4044
	jmp LB_4045
LB_4044:
	jmp LB_4042
LB_4045:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a45◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_4043
LB_4042:
	add rsp,0
	jmp LB_4038
LB_4043:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4046
LB_4046
;; rsp=2 , %3054~1'(= r ) %3053~0'(= r ) %3052~{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 
; #263 { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } ⊢ 4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
;; rsp=2 , %3055~4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } %3054~1'(= r ) %3053~0'(= r ) 
; #26 4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } ⊢ 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
;; rsp=2 , %3056~0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } %3054~1'(= r ) %3053~0'(= r ) 
; ∎ 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
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
; .mov_ptn2 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } ⊢ 2'(= a3◂ [ a42◂ [ ]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],4
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4047
LB_4047:
	cmp BYTE [r8+6],0
	jnz LB_4038
	POP_GRM_SCC
	ret
LB_4038:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4049
LB_4049
;; rsp=0 , %3058~1'(= r ) %3057~0'(= r ) 
; $ %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
;; rsp=0 , %3059~%[ "dt_etr 0" ] %3058~1'(= r ) %3057~0'(= r ) 
; #10 %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4051
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4052
LB_4052:
;; rsp=0 , %3060~%[ "dt_etr 0" ] %3058~1'(= r ) %3057~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3061~1(<2)◂{ } %3060~%[ "dt_etr 0" ] %3058~1'(= r ) %3057~0'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn %[ "dt_etr 0" ]
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a42◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_4050
LB_4050:
	cmp BYTE [r8+6],0
	jnz LB_4048
	POP_GRM_SCC
	ret
LB_4048:
	POP_GRM_FAIL 
	ret
ETR_366:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_366
	ret
GRM_366:
	PUSH_GRM
	jmp LB_4055
LB_4054:
	add r14,1 
LB_4055:
	cmp r14,r9
	jge LB_4056
	JZ_SPC BYTE [r13+8+r14], LB_4054
LB_4056
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4059
	jmp LB_4060
LB_4059:
	jmp LB_4057
LB_4060:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4058
LB_4057:
	add rsp,0
	jmp LB_4053
LB_4058:
	jmp LB_4062
LB_4061:
	add r14,1 
LB_4062:
	cmp r14,r9
	jge LB_4063
	JZ_SPC BYTE [r13+8+r14], LB_4061
LB_4063
	call GRM_367
	cmp BYTE [r8+6],0
	jnz LB_4066
	jmp LB_4067
LB_4066:
	jmp LB_4064
LB_4067:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4065
LB_4064:
	add rsp,8
	jmp LB_4053
LB_4065:
	jmp LB_4069
LB_4068:
	add r14,1 
LB_4069:
	cmp r14,r9
	jge LB_4070
	JZ_SPC BYTE [r13+8+r14], LB_4068
LB_4070
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4073
	jmp LB_4074
LB_4073:
	mov r8,unt_1
	jmp LB_4071
LB_4074:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_4075
	jmp LB_4076
LB_4075:
	mov r8,unt_1
	jmp LB_4071
LB_4076:
	add r14,1
	jmp LB_4072
LB_4071:
	add rsp,16
	jmp LB_4053
LB_4072:
	jmp LB_4078
LB_4077:
	add r14,1 
LB_4078:
	cmp r14,r9
	jge LB_4079
	JZ_SPC BYTE [r13+8+r14], LB_4077
LB_4079
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_4082
	jmp LB_4083
LB_4082:
	jmp LB_4080
LB_4083:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 10'(= a34◂ [ ] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4081
LB_4080:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4081:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_4084
LB_4084
;; rsp=3 , %3066~1'(= r ) %3065~0'(= r ) %3064~10'(= a34◂ [ ] ) %3063~9'(= a2◂ [ {| l |}] ) %3062~8'(= {| l |} ) 
; #255 { 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } ⊢ 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) }
;; rsp=3 , %3067~1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } %3066~1'(= r ) %3065~0'(= r ) %3062~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } }
;; rsp=3 , %3068~0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } } %3066~1'(= r ) %3065~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } }
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
; .mov_ptn2 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } } ⊢ 2'(= a3◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 001000001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*3]
	mov rax,r13
	mov QWORD [r8+8],rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],1
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,24
	jmp LB_4085
LB_4085:
	cmp BYTE [r8+6],0
	jnz LB_4053
	POP_GRM_SCC
	ret
LB_4053:
	RB_GRM
	jmp LB_4088
LB_4087:
	add r14,1 
LB_4088:
	cmp r14,r9
	jge LB_4089
	JZ_SPC BYTE [r13+8+r14], LB_4087
LB_4089
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4092
	jmp LB_4093
LB_4092:
	jmp LB_4090
LB_4093:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4091
LB_4090:
	add rsp,0
	jmp LB_4086
LB_4091:
	jmp LB_4095
LB_4094:
	add r14,1 
LB_4095:
	cmp r14,r9
	jge LB_4096
	JZ_SPC BYTE [r13+8+r14], LB_4094
LB_4096
	call GRM_367
	cmp BYTE [r8+6],0
	jnz LB_4099
	jmp LB_4100
LB_4099:
	jmp LB_4097
LB_4100:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4098
LB_4097:
	add rsp,8
	jmp LB_4086
LB_4098:
	jmp LB_4102
LB_4101:
	add r14,1 
LB_4102:
	cmp r14,r9
	jge LB_4103
	JZ_SPC BYTE [r13+8+r14], LB_4101
LB_4103
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_4106
	jmp LB_4107
LB_4106:
	jmp LB_4104
LB_4107:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4105
LB_4104:
	add rsp,16
	jmp LB_4086
LB_4105:
	jmp LB_4109
LB_4108:
	add r14,1 
LB_4109:
	cmp r14,r9
	jge LB_4110
	JZ_SPC BYTE [r13+8+r14], LB_4108
LB_4110
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4113
	jmp LB_4114
LB_4113:
	mov r8,unt_1
	jmp LB_4111
LB_4114:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4115
	cmp BYTE [rdi+1],136
	jnz LB_4115
	cmp BYTE [rdi+2],144
	jnz LB_4115
	jmp LB_4116
LB_4115:
	mov r8,unt_1
	jmp LB_4111
LB_4116:
	add r14,3
	jmp LB_4112
LB_4111:
	add rsp,24
	jmp LB_4086
LB_4112:
	jmp LB_4118
LB_4117:
	add r14,1 
LB_4118:
	cmp r14,r9
	jge LB_4119
	JZ_SPC BYTE [r13+8+r14], LB_4117
LB_4119
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4122
	jmp LB_4123
LB_4122:
	jmp LB_4120
LB_4123:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 11'(= {| l |} )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4121
LB_4120:
	add rsp,24
	jmp LB_4086
LB_4121:
	jmp LB_4125
LB_4124:
	add r14,1 
LB_4125:
	cmp r14,r9
	jge LB_4126
	JZ_SPC BYTE [r13+8+r14], LB_4124
LB_4126
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4129
	jmp LB_4130
LB_4129:
	mov r8,unt_1
	jmp LB_4127
LB_4130:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4131
	jmp LB_4132
LB_4131:
	mov r8,unt_1
	jmp LB_4127
LB_4132:
	add r14,1
	jmp LB_4128
LB_4127:
	add rsp,32
	jmp LB_4086
LB_4128:
	jmp LB_4134
LB_4133:
	add r14,1 
LB_4134:
	cmp r14,r9
	jge LB_4135
	JZ_SPC BYTE [r13+8+r14], LB_4133
LB_4135
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_4138
	jmp LB_4139
LB_4138:
	jmp LB_4136
LB_4139:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 12'(= a34◂ [ ] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4137
LB_4136:
	add rsp,32
	jmp LB_4086
LB_4137:
	jmp LB_4141
LB_4140:
	add r14,1 
LB_4141:
	cmp r14,r9
	jge LB_4142
	JZ_SPC BYTE [r13+8+r14], LB_4140
LB_4142
	call GRM_370
	cmp BYTE [r8+6],0
	jnz LB_4145
	jmp LB_4146
LB_4145:
	jmp LB_4143
LB_4146:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4144
LB_4143:
	add rsp,40
	jmp LB_4086
LB_4144:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_4147
LB_4147
;; rsp=6 , %3076~1'(= r ) %3075~0'(= r ) %3074~13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %3073~12'(= a34◂ [ ] ) %3072~11'(= {| l |} ) %3071~10'(= a47◂ [ *{ }] ) %3070~9'(= a2◂ [ {| l |}] ) %3069~8'(= {| l |} ) 
; #25 { { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=6 , %3077~0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3076~1'(= r ) %3075~0'(= r ) %3071~10'(= a47◂ [ *{ }] ) %3070~9'(= a2◂ [ {| l |}] ) %3069~8'(= {| l |} ) 
; #256 { 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } ⊢ 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } }
;; rsp=6 , %3078~0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } %3076~1'(= r ) %3075~0'(= r ) %3071~10'(= a47◂ [ *{ }] ) %3069~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } }
;; rsp=6 , %3079~0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } } %3076~1'(= r ) %3075~0'(= r ) %3071~10'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } }
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
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } } ⊢ 2'(= a3◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 001000001101110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*6]
	mov rax,r13
	mov QWORD [r8+8],rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*5]
	mov rax,r14
	mov QWORD [r13+8],rax
	ALC_RCD 2, rax
	mov r14,rax
	ALC_RCD 2, rax
	mov r9,rax
	mov r10,QWORD [rsp-8+8*3]
	mov rax,r10
	mov QWORD [r9+8],rax
	mov r10,QWORD [rsp-8+8*2]
	mov rax,r10
	mov QWORD [r9+16],rax
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*1]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov BYTE [r14+6],0
	mov rax,r14
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,48
	jmp LB_4148
LB_4148:
	cmp BYTE [r8+6],0
	jnz LB_4086
	POP_GRM_SCC
	ret
LB_4086:
	POP_GRM_FAIL 
	ret
ETR_367:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_367
	ret
GRM_367:
	PUSH_GRM
	jmp LB_4151
LB_4150:
	add r14,1 
LB_4151:
	cmp r14,r9
	jge LB_4152
	JZ_SPC BYTE [r13+8+r14], LB_4150
LB_4152
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4155
	jmp LB_4156
LB_4155:
	mov r8,unt_1
	jmp LB_4153
LB_4156:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4157
	cmp BYTE [rdi+1],151
	jnz LB_4157
	cmp BYTE [rdi+2],130
	jnz LB_4157
	jmp LB_4158
LB_4157:
	mov r8,unt_1
	jmp LB_4153
LB_4158:
	add r14,3
	jmp LB_4154
LB_4153:
	add rsp,0
	jmp LB_4149
LB_4154:
	jmp LB_4160
LB_4159:
	add r14,1 
LB_4160:
	cmp r14,r9
	jge LB_4161
	JZ_SPC BYTE [r13+8+r14], LB_4159
LB_4161
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_4164
	jmp LB_4165
LB_4164:
	jmp LB_4162
LB_4165:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4163
LB_4162:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4163:
	jmp LB_4167
LB_4166:
	add r14,1 
LB_4167:
	cmp r14,r9
	jge LB_4168
	JZ_SPC BYTE [r13+8+r14], LB_4166
LB_4168
	call GRM_368
	cmp BYTE [r8+6],0
	jnz LB_4171
	jmp LB_4172
LB_4171:
	jmp LB_4169
LB_4172:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4170
LB_4169:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4170:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4173
LB_4173
;; rsp=2 , %3083~1'(= r ) %3082~0'(= r ) %3081~9'(= a2◂ [ {| l |}] ) %3080~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3084~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3083~1'(= r ) %3082~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3085~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3083~1'(= r ) %3082~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4174
LB_4174:
	cmp BYTE [r8+6],0
	jnz LB_4149
	POP_GRM_SCC
	ret
LB_4149:
	RB_GRM
	jmp LB_4177
LB_4176:
	add r14,1 
LB_4177:
	cmp r14,r9
	jge LB_4178
	JZ_SPC BYTE [r13+8+r14], LB_4176
LB_4178
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_4181
	jmp LB_4182
LB_4181:
	jmp LB_4179
LB_4182:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4180
LB_4179:
	add rsp,0
	jmp LB_4175
LB_4180:
	jmp LB_4184
LB_4183:
	add r14,1 
LB_4184:
	cmp r14,r9
	jge LB_4185
	JZ_SPC BYTE [r13+8+r14], LB_4183
LB_4185
	call GRM_368
	cmp BYTE [r8+6],0
	jnz LB_4188
	jmp LB_4189
LB_4188:
	jmp LB_4186
LB_4189:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4187
LB_4186:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4187:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4190
LB_4190
;; rsp=2 , %3089~1'(= r ) %3088~0'(= r ) %3087~9'(= a2◂ [ {| l |}] ) %3086~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3090~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3089~1'(= r ) %3088~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3091~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3089~1'(= r ) %3088~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4191
LB_4191:
	cmp BYTE [r8+6],0
	jnz LB_4175
	POP_GRM_SCC
	ret
LB_4175:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4193
LB_4193
;; rsp=0 , %3093~1'(= r ) %3092~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3094~1(<2)◂{ } %3093~1'(= r ) %3092~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3095~0(<2)◂1(<2)◂{ } %3093~1'(= r ) %3092~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4194
LB_4194:
	cmp BYTE [r8+6],0
	jnz LB_4192
	POP_GRM_SCC
	ret
LB_4192:
	POP_GRM_FAIL 
	ret
ETR_368:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_368
	ret
GRM_368:
	PUSH_GRM
	jmp LB_4197
LB_4196:
	add r14,1 
LB_4197:
	cmp r14,r9
	jge LB_4198
	JZ_SPC BYTE [r13+8+r14], LB_4196
LB_4198
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4201
	jmp LB_4202
LB_4201:
	mov r8,unt_1
	jmp LB_4199
LB_4202:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_4203
	jmp LB_4204
LB_4203:
	mov r8,unt_1
	jmp LB_4199
LB_4204:
	add r14,1
	jmp LB_4200
LB_4199:
	add rsp,0
	jmp LB_4195
LB_4200:
	jmp LB_4206
LB_4205:
	add r14,1 
LB_4206:
	cmp r14,r9
	jge LB_4207
	JZ_SPC BYTE [r13+8+r14], LB_4205
LB_4207
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_4210
	jmp LB_4211
LB_4210:
	jmp LB_4208
LB_4211:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4209
LB_4208:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4209:
	jmp LB_4213
LB_4212:
	add r14,1 
LB_4213:
	cmp r14,r9
	jge LB_4214
	JZ_SPC BYTE [r13+8+r14], LB_4212
LB_4214
	call GRM_368
	cmp BYTE [r8+6],0
	jnz LB_4217
	jmp LB_4218
LB_4217:
	jmp LB_4215
LB_4218:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4216
LB_4215:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4216:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4219
LB_4219
;; rsp=2 , %3099~1'(= r ) %3098~0'(= r ) %3097~9'(= a2◂ [ {| l |}] ) %3096~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3100~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3099~1'(= r ) %3098~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3101~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3099~1'(= r ) %3098~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4220
LB_4220:
	cmp BYTE [r8+6],0
	jnz LB_4195
	POP_GRM_SCC
	ret
LB_4195:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4222
LB_4222
;; rsp=0 , %3103~1'(= r ) %3102~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3104~1(<2)◂{ } %3103~1'(= r ) %3102~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3105~0(<2)◂1(<2)◂{ } %3103~1'(= r ) %3102~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4223
LB_4223:
	cmp BYTE [r8+6],0
	jnz LB_4221
	POP_GRM_SCC
	ret
LB_4221:
	POP_GRM_FAIL 
	ret
ETR_369:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_369
	ret
GRM_369:
	PUSH_GRM
	jmp LB_4226
LB_4225:
	add r14,1 
LB_4226:
	cmp r14,r9
	jge LB_4227
	JZ_SPC BYTE [r13+8+r14], LB_4225
LB_4227
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_4230
	jmp LB_4231
LB_4230:
	jmp LB_4228
LB_4231:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4229
LB_4228:
	add rsp,0
	jmp LB_4224
LB_4229:
	jmp LB_4233
LB_4232:
	add r14,1 
LB_4233:
	cmp r14,r9
	jge LB_4234
	JZ_SPC BYTE [r13+8+r14], LB_4232
LB_4234
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4237
	jmp LB_4238
LB_4237:
	mov r8,unt_1
	jmp LB_4235
LB_4238:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4239
	jmp LB_4240
LB_4239:
	mov r8,unt_1
	jmp LB_4235
LB_4240:
	add r14,1
	jmp LB_4236
LB_4235:
	add rsp,8
	jmp LB_4224
LB_4236:
	jmp LB_4242
LB_4241:
	add r14,1 
LB_4242:
	cmp r14,r9
	jge LB_4243
	JZ_SPC BYTE [r13+8+r14], LB_4241
LB_4243
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4246
	jmp LB_4247
LB_4246:
	mov r8,unt_1
	jmp LB_4244
LB_4247:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4248
	jmp LB_4249
LB_4248:
	mov r8,unt_1
	jmp LB_4244
LB_4249:
	add r14,1
	jmp LB_4245
LB_4244:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4245:
	jmp LB_4251
LB_4250:
	add r14,1 
LB_4251:
	cmp r14,r9
	jge LB_4252
	JZ_SPC BYTE [r13+8+r14], LB_4250
LB_4252
	call GRM_366
	cmp BYTE [r8+6],0
	jnz LB_4255
	jmp LB_4256
LB_4255:
	jmp LB_4253
LB_4256:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a45◂ [ ]} ) ⊢ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) }
; {| 111100001110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_4254
LB_4253:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4254:
	jmp LB_4258
LB_4257:
	add r14,1 
LB_4258:
	cmp r14,r9
	jge LB_4259
	JZ_SPC BYTE [r13+8+r14], LB_4257
LB_4259
	call GRM_369
	cmp BYTE [r8+6],0
	jnz LB_4262
	jmp LB_4263
LB_4262:
	jmp LB_4260
LB_4263:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4261
LB_4260:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4261:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_4264
LB_4264
;; rsp=4 , %3110~1'(= r ) %3109~0'(= r ) %3108~11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) %3107~{ 9'(= {| l |} ) 10'(= a45◂ [ ] ) } %3106~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=4 , %3111~0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3110~1'(= r ) %3109~0'(= r ) %3106~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=4 , %3112~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3110~1'(= r ) %3109~0'(= r ) %3106~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a45◂ [ ]}]] )
; {| 0010000001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_4265
LB_4265:
	cmp BYTE [r8+6],0
	jnz LB_4224
	POP_GRM_SCC
	ret
LB_4224:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4267
LB_4267
;; rsp=0 , %3114~1'(= r ) %3113~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3115~1(<2)◂{ } %3114~1'(= r ) %3113~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3116~0(<2)◂1(<2)◂{ } %3114~1'(= r ) %3113~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a45◂ [ ]}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4268
LB_4268:
	cmp BYTE [r8+6],0
	jnz LB_4266
	POP_GRM_SCC
	ret
LB_4266:
	POP_GRM_FAIL 
	ret
ETR_370:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_370
	ret
GRM_370:
	PUSH_GRM
	jmp LB_4271
LB_4270:
	add r14,1 
LB_4271:
	cmp r14,r9
	jge LB_4272
	JZ_SPC BYTE [r13+8+r14], LB_4270
LB_4272
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_4275
	jmp LB_4276
LB_4275:
	jmp LB_4273
LB_4276:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4274
LB_4273:
	add rsp,0
	jmp LB_4269
LB_4274:
	jmp LB_4278
LB_4277:
	add r14,1 
LB_4278:
	cmp r14,r9
	jge LB_4279
	JZ_SPC BYTE [r13+8+r14], LB_4277
LB_4279
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4282
	jmp LB_4283
LB_4282:
	mov r8,unt_1
	jmp LB_4280
LB_4283:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4284
	cmp BYTE [rdi+1],136
	jnz LB_4284
	cmp BYTE [rdi+2],144
	jnz LB_4284
	jmp LB_4285
LB_4284:
	mov r8,unt_1
	jmp LB_4280
LB_4285:
	add r14,3
	jmp LB_4281
LB_4280:
	add rsp,8
	jmp LB_4269
LB_4281:
	jmp LB_4287
LB_4286:
	add r14,1 
LB_4287:
	cmp r14,r9
	jge LB_4288
	JZ_SPC BYTE [r13+8+r14], LB_4286
LB_4288
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4291
	jmp LB_4292
LB_4291:
	jmp LB_4289
LB_4292:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4290
LB_4289:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4290:
	jmp LB_4294
LB_4293:
	add r14,1 
LB_4294:
	cmp r14,r9
	jge LB_4295
	JZ_SPC BYTE [r13+8+r14], LB_4293
LB_4295
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4298
	jmp LB_4299
LB_4298:
	mov r8,unt_1
	jmp LB_4296
LB_4299:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4300
	jmp LB_4301
LB_4300:
	mov r8,unt_1
	jmp LB_4296
LB_4301:
	add r14,1
	jmp LB_4297
LB_4296:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4297:
	jmp LB_4303
LB_4302:
	add r14,1 
LB_4303:
	cmp r14,r9
	jge LB_4304
	JZ_SPC BYTE [r13+8+r14], LB_4302
LB_4304
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_4307
	jmp LB_4308
LB_4307:
	jmp LB_4305
LB_4308:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 10'(= a34◂ [ ] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4306
LB_4305:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4306:
	jmp LB_4310
LB_4309:
	add r14,1 
LB_4310:
	cmp r14,r9
	jge LB_4311
	JZ_SPC BYTE [r13+8+r14], LB_4309
LB_4311
	call GRM_370
	cmp BYTE [r8+6],0
	jnz LB_4314
	jmp LB_4315
LB_4314:
	jmp LB_4312
LB_4315:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4313
LB_4312:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4313:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_4316
LB_4316
;; rsp=4 , %3122~1'(= r ) %3121~0'(= r ) %3120~11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %3119~10'(= a34◂ [ ] ) %3118~9'(= {| l |} ) %3117~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %3123~0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3122~1'(= r ) %3121~0'(= r ) %3117~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %3124~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3122~1'(= r ) %3121~0'(= r ) %3117~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a34◂ [ ]}]] )
; {| 0010000001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_4317
LB_4317:
	cmp BYTE [r8+6],0
	jnz LB_4269
	POP_GRM_SCC
	ret
LB_4269:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4319
LB_4319
;; rsp=0 , %3126~1'(= r ) %3125~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3127~1(<2)◂{ } %3126~1'(= r ) %3125~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3128~0(<2)◂1(<2)◂{ } %3126~1'(= r ) %3125~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a34◂ [ ]}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4320
LB_4320:
	cmp BYTE [r8+6],0
	jnz LB_4318
	POP_GRM_SCC
	ret
LB_4318:
	POP_GRM_FAIL 
	ret
ETR_371:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_371
	ret
GRM_371:
	PUSH_GRM
	jmp LB_4323
LB_4322:
	add r14,1 
LB_4323:
	cmp r14,r9
	jge LB_4324
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4322
LB_4324
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_4327
	jmp LB_4328
LB_4327:
	jmp LB_4325
LB_4328:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4326
LB_4325:
	add rsp,0
	jmp LB_4321
LB_4326:
	jmp LB_4330
LB_4329:
	add r14,1 
LB_4330:
	cmp r14,r9
	jge LB_4331
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4329
LB_4331
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4334
	jmp LB_4335
LB_4334:
	mov r8,unt_1
	jmp LB_4332
LB_4335:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4336
	jmp LB_4337
LB_4336:
	mov r8,unt_1
	jmp LB_4332
LB_4337:
	add r14,1
	jmp LB_4333
LB_4332:
	add rsp,8
	jmp LB_4321
LB_4333:
	jmp LB_4339
LB_4338:
	add r14,1 
LB_4339:
	cmp r14,r9
	jge LB_4340
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4338
LB_4340
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4343
	jmp LB_4344
LB_4343:
	mov r8,unt_1
	jmp LB_4341
LB_4344:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4345
	jmp LB_4346
LB_4345:
	mov r8,unt_1
	jmp LB_4341
LB_4346:
	add r14,1
	jmp LB_4342
LB_4341:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4342:
	jmp LB_4348
LB_4347:
	add r14,1 
LB_4348:
	cmp r14,r9
	jge LB_4349
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4347
LB_4349
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4352
	jmp LB_4353
LB_4352:
	jmp LB_4350
LB_4353:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4351
LB_4350:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4351:
	jmp LB_4355
LB_4354:
	add r14,1 
LB_4355:
	cmp r14,r9
	jge LB_4356
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4354
LB_4356
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_4359
	jmp LB_4360
LB_4359:
	jmp LB_4357
LB_4360:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 10'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4358
LB_4357:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4358:
	jmp LB_4362
LB_4361:
	add r14,1 
LB_4362:
	cmp r14,r9
	jge LB_4363
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4361
LB_4363
	call GRM_373
	cmp BYTE [r8+6],0
	jnz LB_4366
	jmp LB_4367
LB_4366:
	jmp LB_4364
LB_4367:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 11'(= a3◂ [ a34◂ [ ]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4365
LB_4364:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4365:
	jmp LB_4369
LB_4368:
	add r14,1 
LB_4369:
	cmp r14,r9
	jge LB_4370
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4368
LB_4370
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4373
	jmp LB_4374
LB_4373:
	mov r8,unt_1
	jmp LB_4371
LB_4374:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4375
	jmp LB_4376
LB_4375:
	mov r8,unt_1
	jmp LB_4371
LB_4376:
	add r14,1
	jmp LB_4372
LB_4371:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4372:
	jmp LB_4378
LB_4377:
	add r14,1 
LB_4378:
	cmp r14,r9
	jge LB_4379
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4377
LB_4379
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_4382
	jmp LB_4383
LB_4382:
	jmp LB_4380
LB_4383:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4381
LB_4380:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4381:
	jmp LB_4385
LB_4384:
	add r14,1 
LB_4385:
	cmp r14,r9
	jge LB_4386
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4384
LB_4386
	call GRM_372
	cmp BYTE [r8+6],0
	jnz LB_4389
	jmp LB_4390
LB_4389:
	jmp LB_4387
LB_4390:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4388
LB_4387:
	add rsp,40
	POP_GRM_FAIL
	ret
LB_4388:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_4391
LB_4391
;; rsp=6 , %3136~1'(= r ) %3135~0'(= r ) %3134~13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %3133~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
;; ? 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4394
	jmp LB_4395
LB_4394:
	jmp LB_4393
LB_4395:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3138~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3136~1'(= r ) %3135~0'(= r ) %3133~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_4397
	jmp LB_4398
LB_4397:
	jmp LB_4396
LB_4398:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3140~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3138~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3141~0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3136~1'(= r ) %3135~0'(= r ) %3129~8'(= a47◂ [ *{ }] ) 
; #264 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3142~3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3136~1'(= r ) %3135~0'(= r ) %3129~8'(= a47◂ [ *{ }] ) 
; #308 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3143~0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3136~1'(= r ) %3135~0'(= r ) %3129~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3144~0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3136~1'(= r ) %3135~0'(= r ) %3129~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*6]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0011000001110.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 4, rax
	mov r14,rax
	mov r10,QWORD [rsp-8+8*5]
	mov rax,r10
	mov QWORD [r14+8],rax
	mov r10,QWORD [rsp-8+8*4]
	mov rax,r10
	mov QWORD [r14+16],rax
	mov r10,QWORD [rsp-8+8*3]
	mov rax,r10
	mov QWORD [r14+24],rax
	mov r10,r9
	mov rax,r10
	mov QWORD [r14+32],rax
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],3
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,48
	jmp LB_4392
LB_4396:
;; ?. 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3139~3'(= a2◂ [ *{ rr{| l |}}] ) %3138~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3145~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3138~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3146~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3138~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_3438
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
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3476
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*6]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,48
	jmp LB_4392
LB_4393:
;; ?. 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3137~2'(= a2◂ [ *{ rr{| l |}}] ) %3136~1'(= r ) %3135~0'(= r ) %3133~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_4400
	jmp LB_4401
LB_4400:
	jmp LB_4399
LB_4401:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3148~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3137~2'(= a2◂ [ *{ rr{| l |}}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3149~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3148~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3150~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3148~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_2091
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
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3476
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*6]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,48
	jmp LB_4392
LB_4399:
;; ?. 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3147~3'(= a2◂ [ *{ rr{| l |}}] ) %3137~2'(= a2◂ [ *{ rr{| l |}}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000111100110.. |}
	mov r14,r9
	mov r13,r8
	call LB_1227
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=4 , %3151~2'(= a2◂ [ *{ rr{| l |}}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3152~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3153~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3136~1'(= r ) %3135~0'(= r ) %3132~11'(= a3◂ [ a34◂ [ ]] ) %3131~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3130~9'(= {| l |} ) %3129~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3476
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_4392
LB_4392:
	cmp BYTE [r8+6],0
	jnz LB_4321
	POP_GRM_SCC
	ret
LB_4321:
	RB_GRM
	jmp LB_4404
LB_4403:
	add r14,1 
LB_4404:
	cmp r14,r9
	jge LB_4405
	JZ_SPC BYTE [r13+8+r14], LB_4403
LB_4405
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4408
	jmp LB_4409
LB_4408:
	jmp LB_4406
LB_4409:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4407
LB_4406:
	add rsp,0
	jmp LB_4402
LB_4407:
	jmp LB_4411
LB_4410:
	add r14,1 
LB_4411:
	cmp r14,r9
	jge LB_4412
	JZ_SPC BYTE [r13+8+r14], LB_4410
LB_4412
	call GRM_374
	cmp BYTE [r8+6],0
	jnz LB_4415
	jmp LB_4416
LB_4415:
	jmp LB_4413
LB_4416:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a44◂ [ ]] ) ⊢ 9'(= a47◂ [ a44◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4414
LB_4413:
	add rsp,8
	jmp LB_4402
LB_4414:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4417
LB_4417
;; rsp=2 , %3157~1'(= r ) %3156~0'(= r ) %3155~9'(= a47◂ [ a44◂ [ ]] ) %3154~8'(= {| l |} ) 
;; ? 9'(= a47◂ [ a44◂ [ ]] ) ⊢ 0(<2)◂2'(= a44◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4420
	jmp LB_4421
LB_4420:
	jmp LB_4419
LB_4421:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3159~2'(= a44◂ [ ] ) %3157~1'(= r ) %3156~0'(= r ) %3154~8'(= {| l |} ) 
; #265 { 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3160~2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3157~1'(= r ) %3156~0'(= r ) 
; #308 2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3161~0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3157~1'(= r ) %3156~0'(= r ) 
; #26 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3162~0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3157~1'(= r ) %3156~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010000010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4418
LB_4419:
;; ?. 9'(= a47◂ [ a44◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3158~2'(= a2◂ [ *{ rr{| l |}}] ) %3157~1'(= r ) %3156~0'(= r ) %3154~8'(= {| l |} ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3163~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3157~1'(= r ) %3156~0'(= r ) %3154~8'(= {| l |} ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3164~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3157~1'(= r ) %3156~0'(= r ) %3154~8'(= {| l |} ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4418
LB_4418:
	cmp BYTE [r8+6],0
	jnz LB_4402
	POP_GRM_SCC
	ret
LB_4402:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4423
LB_4423
;; rsp=0 , %3166~1'(= r ) %3165~0'(= r ) 
; $ %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
;; rsp=0 , %3167~%[ "lc_etr_body 0" ] %3166~1'(= r ) %3165~0'(= r ) 
; #10 %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4425
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4426
LB_4426:
;; rsp=0 , %3168~%[ "lc_etr_body 0" ] %3166~1'(= r ) %3165~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3169~1(<2)◂{ } %3168~%[ "lc_etr_body 0" ] %3166~1'(= r ) %3165~0'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn %[ "lc_etr_body 0" ]
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
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 0010.. |}
	mov r8,unt_1
	jmp LB_4424
LB_4424:
	cmp BYTE [r8+6],0
	jnz LB_4422
	POP_GRM_SCC
	ret
LB_4422:
	POP_GRM_FAIL 
	ret
ETR_372:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_372
	ret
GRM_372:
	PUSH_GRM
	jmp LB_4429
LB_4428:
	add r14,1 
LB_4429:
	cmp r14,r9
	jge LB_4430
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4428
LB_4430
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_4433
	jmp LB_4434
LB_4433:
	jmp LB_4431
LB_4434:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4432
LB_4431:
	add rsp,0
	jmp LB_4427
LB_4432:
	jmp LB_4436
LB_4435:
	add r14,1 
LB_4436:
	cmp r14,r9
	jge LB_4437
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4435
LB_4437
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4440
	jmp LB_4441
LB_4440:
	mov r8,unt_1
	jmp LB_4438
LB_4441:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4442
	jmp LB_4443
LB_4442:
	mov r8,unt_1
	jmp LB_4438
LB_4443:
	add r14,1
	jmp LB_4439
LB_4438:
	add rsp,8
	jmp LB_4427
LB_4439:
	jmp LB_4445
LB_4444:
	add r14,1 
LB_4445:
	cmp r14,r9
	jge LB_4446
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4444
LB_4446
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4449
	jmp LB_4450
LB_4449:
	mov r8,unt_1
	jmp LB_4447
LB_4450:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4451
	jmp LB_4452
LB_4451:
	mov r8,unt_1
	jmp LB_4447
LB_4452:
	add r14,1
	jmp LB_4448
LB_4447:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4448:
	jmp LB_4454
LB_4453:
	add r14,1 
LB_4454:
	cmp r14,r9
	jge LB_4455
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4453
LB_4455
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4458
	jmp LB_4459
LB_4458:
	jmp LB_4456
LB_4459:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4457
LB_4456:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4457:
	jmp LB_4461
LB_4460:
	add r14,1 
LB_4461:
	cmp r14,r9
	jge LB_4462
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4460
LB_4462
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_4465
	jmp LB_4466
LB_4465:
	jmp LB_4463
LB_4466:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 10'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4464
LB_4463:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4464:
	jmp LB_4468
LB_4467:
	add r14,1 
LB_4468:
	cmp r14,r9
	jge LB_4469
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4467
LB_4469
	call GRM_373
	cmp BYTE [r8+6],0
	jnz LB_4472
	jmp LB_4473
LB_4472:
	jmp LB_4470
LB_4473:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 11'(= a3◂ [ a34◂ [ ]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4471
LB_4470:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4471:
	jmp LB_4475
LB_4474:
	add r14,1 
LB_4475:
	cmp r14,r9
	jge LB_4476
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4474
LB_4476
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4479
	jmp LB_4480
LB_4479:
	mov r8,unt_1
	jmp LB_4477
LB_4480:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4481
	jmp LB_4482
LB_4481:
	mov r8,unt_1
	jmp LB_4477
LB_4482:
	add r14,1
	jmp LB_4478
LB_4477:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4478:
	jmp LB_4484
LB_4483:
	add r14,1 
LB_4484:
	cmp r14,r9
	jge LB_4485
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4483
LB_4485
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_4488
	jmp LB_4489
LB_4488:
	jmp LB_4486
LB_4489:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4487
LB_4486:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4487:
	jmp LB_4491
LB_4490:
	add r14,1 
LB_4491:
	cmp r14,r9
	jge LB_4492
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4490
LB_4492
	call GRM_372
	cmp BYTE [r8+6],0
	jnz LB_4495
	jmp LB_4496
LB_4495:
	jmp LB_4493
LB_4496:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4494
LB_4493:
	add rsp,40
	POP_GRM_FAIL
	ret
LB_4494:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_4497
LB_4497
;; rsp=6 , %3177~1'(= r ) %3176~0'(= r ) %3175~13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %3174~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3173~11'(= a3◂ [ a34◂ [ ]] ) %3172~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3171~9'(= {| l |} ) %3170~8'(= a47◂ [ *{ }] ) 
; #309 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 11000000111111110.. |}
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*3]
	call LB_4499
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=4 , %3178~2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) %3177~1'(= r ) %3176~0'(= r ) %3173~11'(= a3◂ [ a34◂ [ ]] ) %3172~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3171~9'(= {| l |} ) %3170~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_4510
	jmp LB_4511
LB_4510:
	jmp LB_4509
LB_4511:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=4 , %3181~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %3180~3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3177~1'(= r ) %3176~0'(= r ) %3173~11'(= a3◂ [ a34◂ [ ]] ) %3172~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3171~9'(= {| l |} ) %3170~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3182~0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3177~1'(= r ) %3176~0'(= r ) %3170~8'(= a47◂ [ *{ }] ) 
; #308 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3183~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3177~1'(= r ) %3176~0'(= r ) %3170~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3184~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3177~1'(= r ) %3176~0'(= r ) %3170~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
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
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0011100001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 4, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r13+24],rax
	mov r14,r10
	mov rax,r14
	mov QWORD [r13+32],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r9
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_4498
LB_4509:
;; ?. 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3179~3'(= a2◂ [ *{ rr{| l |}}] ) %3177~1'(= r ) %3176~0'(= r ) %3173~11'(= a3◂ [ a34◂ [ ]] ) %3172~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3171~9'(= {| l |} ) %3170~8'(= a47◂ [ *{ }] ) 
; #307 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3185~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3177~1'(= r ) %3176~0'(= r ) %3173~11'(= a3◂ [ a34◂ [ ]] ) %3172~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3171~9'(= {| l |} ) %3170~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3186~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3177~1'(= r ) %3176~0'(= r ) %3173~11'(= a3◂ [ a34◂ [ ]] ) %3172~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3171~9'(= {| l |} ) %3170~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3476
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1118
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_4498
LB_4498:
	cmp BYTE [r8+6],0
	jnz LB_4427
	POP_GRM_SCC
	ret
LB_4427:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4513
LB_4513
;; rsp=0 , %3188~1'(= r ) %3187~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3189~1(<2)◂{ } %3188~1'(= r ) %3187~0'(= r ) 
; #308 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3190~0(<2)◂1(<2)◂{ } %3188~1'(= r ) %3187~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %3191~0(<2)◂0(<2)◂1(<2)◂{ } %3188~1'(= r ) %3187~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4514
LB_4514:
	cmp BYTE [r8+6],0
	jnz LB_4512
	POP_GRM_SCC
	ret
LB_4512:
	POP_GRM_FAIL 
	ret
ETR_373:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_373
	ret
GRM_373:
	PUSH_GRM
	jmp LB_4517
LB_4516:
	add r14,1 
LB_4517:
	cmp r14,r9
	jge LB_4518
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4516
LB_4518
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4521
	jmp LB_4522
LB_4521:
	mov r8,unt_1
	jmp LB_4519
LB_4522:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4523
	jmp LB_4524
LB_4523:
	mov r8,unt_1
	jmp LB_4519
LB_4524:
	add r14,1
	jmp LB_4520
LB_4519:
	add rsp,0
	jmp LB_4515
LB_4520:
	jmp LB_4526
LB_4525:
	add r14,1 
LB_4526:
	cmp r14,r9
	jge LB_4527
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4525
LB_4527
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_4530
	jmp LB_4531
LB_4530:
	jmp LB_4528
LB_4531:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4529
LB_4528:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4529:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4532
LB_4532
;; rsp=1 , %3194~1'(= r ) %3193~0'(= r ) %3192~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %3195~0(<2)◂8'(= a34◂ [ ] ) %3194~1'(= r ) %3193~0'(= r ) 
; #26 0(<2)◂8'(= a34◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %3196~0(<2)◂0(<2)◂8'(= a34◂ [ ] ) %3194~1'(= r ) %3193~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a34◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a34◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4533
LB_4533:
	cmp BYTE [r8+6],0
	jnz LB_4515
	POP_GRM_SCC
	ret
LB_4515:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4535
LB_4535
;; rsp=0 , %3198~1'(= r ) %3197~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3199~1(<2)◂{ } %3198~1'(= r ) %3197~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3200~0(<2)◂1(<2)◂{ } %3198~1'(= r ) %3197~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a34◂ [ ]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4536
LB_4536:
	cmp BYTE [r8+6],0
	jnz LB_4534
	POP_GRM_SCC
	ret
LB_4534:
	POP_GRM_FAIL 
	ret
ETR_374:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_374
	ret
GRM_374:
	PUSH_GRM
	jmp LB_4539
LB_4538:
	add r14,1 
LB_4539:
	cmp r14,r9
	jge LB_4540
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4538
LB_4540
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4543
	jmp LB_4544
LB_4543:
	mov r8,unt_1
	jmp LB_4541
LB_4544:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_4545
	jmp LB_4546
LB_4545:
	mov r8,unt_1
	jmp LB_4541
LB_4546:
	add r14,1
	jmp LB_4542
LB_4541:
	add rsp,0
	jmp LB_4537
LB_4542:
	jmp LB_4548
LB_4547:
	add r14,1 
LB_4548:
	cmp r14,r9
	jge LB_4549
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4547
LB_4549
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_4552
	jmp LB_4553
LB_4552:
	jmp LB_4550
LB_4553:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4551
LB_4550:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4551:
	jmp LB_4555
LB_4554:
	add r14,1 
LB_4555:
	cmp r14,r9
	jge LB_4556
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4554
LB_4556
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4559
	jmp LB_4560
LB_4559:
	mov r8,unt_1
	jmp LB_4557
LB_4560:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4561
	jmp LB_4562
LB_4561:
	mov r8,unt_1
	jmp LB_4557
LB_4562:
	add r14,1
	jmp LB_4558
LB_4557:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4558:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4563
LB_4563
;; rsp=1 , %3203~1'(= r ) %3202~0'(= r ) %3201~8'(= a27◂ [ a18◂ [ ]] ) 
; #258 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3204~1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3203~1'(= r ) %3202~0'(= r ) 
; #308 1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3205~0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3203~1'(= r ) %3202~0'(= r ) 
; #26 0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3206~0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3203~1'(= r ) %3202~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a44◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4564
LB_4564:
	cmp BYTE [r8+6],0
	jnz LB_4537
	POP_GRM_SCC
	ret
LB_4537:
	RB_GRM
	jmp LB_4567
LB_4566:
	add r14,1 
LB_4567:
	cmp r14,r9
	jge LB_4568
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4566
LB_4568
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_4571
	jmp LB_4572
LB_4571:
	mov r8,unt_1
	jmp LB_4569
LB_4572:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_4573
	cmp BYTE [rdi+1],171
	jnz LB_4573
	jmp LB_4574
LB_4573:
	mov r8,unt_1
	jmp LB_4569
LB_4574:
	add r14,2
	jmp LB_4570
LB_4569:
	add rsp,0
	jmp LB_4565
LB_4570:
	jmp LB_4576
LB_4575:
	add r14,1 
LB_4576:
	cmp r14,r9
	jge LB_4577
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4575
LB_4577
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4580
	jmp LB_4581
LB_4580:
	mov r8,unt_1
	jmp LB_4578
LB_4581:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4582
	jmp LB_4583
LB_4582:
	mov r8,unt_1
	jmp LB_4578
LB_4583:
	add r14,1
	jmp LB_4579
LB_4578:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4579:
	jmp LB_4585
LB_4584:
	add r14,1 
LB_4585:
	cmp r14,r9
	jge LB_4586
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4584
LB_4586
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_4589
	jmp LB_4590
LB_4589:
	jmp LB_4587
LB_4590:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4588
LB_4587:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4588:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4591
LB_4591
;; rsp=1 , %3209~1'(= r ) %3208~0'(= r ) %3207~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4594
	jmp LB_4595
LB_4594:
	jmp LB_4593
LB_4595:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3211~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3209~1'(= r ) %3208~0'(= r ) 
; #257 2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3212~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3209~1'(= r ) %3208~0'(= r ) 
; #308 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3213~0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3209~1'(= r ) %3208~0'(= r ) 
; #26 0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3214~0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3209~1'(= r ) %3208~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
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
; .mov_ptn2 0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a47◂ [ a44◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4592
LB_4593:
;; ?. 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3210~2'(= a2◂ [ *{ rr{| l |}}] ) %3209~1'(= r ) %3208~0'(= r ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3215~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3209~1'(= r ) %3208~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3216~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3209~1'(= r ) %3208~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a44◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4592
LB_4592:
	cmp BYTE [r8+6],0
	jnz LB_4565
	POP_GRM_SCC
	ret
LB_4565:
	RB_GRM
	jmp LB_4598
LB_4597:
	add r14,1 
LB_4598:
	cmp r14,r9
	jge LB_4599
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4597
LB_4599
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_4602
	jmp LB_4603
LB_4602:
	jmp LB_4600
LB_4603:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4601
LB_4600:
	add rsp,0
	jmp LB_4596
LB_4601:
	jmp LB_4605
LB_4604:
	add r14,1 
LB_4605:
	cmp r14,r9
	jge LB_4606
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4604
LB_4606
	call GRM_373
	cmp BYTE [r8+6],0
	jnz LB_4609
	jmp LB_4610
LB_4609:
	jmp LB_4607
LB_4610:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 9'(= a3◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4608
LB_4607:
	add rsp,8
	jmp LB_4596
LB_4608:
	jmp LB_4612
LB_4611:
	add r14,1 
LB_4612:
	cmp r14,r9
	jge LB_4613
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4611
LB_4613
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4616
	jmp LB_4617
LB_4616:
	mov r8,unt_1
	jmp LB_4614
LB_4617:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4618
	jmp LB_4619
LB_4618:
	mov r8,unt_1
	jmp LB_4614
LB_4619:
	add r14,1
	jmp LB_4615
LB_4614:
	add rsp,16
	jmp LB_4596
LB_4615:
	jmp LB_4621
LB_4620:
	add r14,1 
LB_4621:
	cmp r14,r9
	jge LB_4622
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4620
LB_4622
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_4625
	jmp LB_4626
LB_4625:
	jmp LB_4623
LB_4626:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4624
LB_4623:
	add rsp,16
	jmp LB_4596
LB_4624:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_4627
LB_4627
;; rsp=3 , %3221~1'(= r ) %3220~0'(= r ) %3219~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3218~9'(= a3◂ [ a34◂ [ ]] ) %3217~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4630
	jmp LB_4631
LB_4630:
	jmp LB_4629
LB_4631:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %3223~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3221~1'(= r ) %3220~0'(= r ) %3218~9'(= a3◂ [ a34◂ [ ]] ) %3217~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #259 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3224~0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3221~1'(= r ) %3220~0'(= r ) 
; #308 0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3225~0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3221~1'(= r ) %3220~0'(= r ) 
; #26 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3226~0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3221~1'(= r ) %3220~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a44◂ [ ]]] )
; {| 00100000110.. |}
	mov r13,r8
	ALC_RCD 3, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+16],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+24],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_4628
LB_4629:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %3222~2'(= a2◂ [ *{ rr{| l |}}] ) %3221~1'(= r ) %3220~0'(= r ) %3218~9'(= a3◂ [ a34◂ [ ]] ) %3217~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #307 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %3227~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3221~1'(= r ) %3220~0'(= r ) %3218~9'(= a3◂ [ a34◂ [ ]] ) %3217~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %3228~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3221~1'(= r ) %3220~0'(= r ) %3218~9'(= a3◂ [ a34◂ [ ]] ) %3217~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
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
; .dlt.ptn 9'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3476
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2033
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a47◂ [ a44◂ [ ]]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_4628
LB_4628:
	cmp BYTE [r8+6],0
	jnz LB_4596
	POP_GRM_SCC
	ret
LB_4596:
	POP_GRM_FAIL 
	ret
ETR_375:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_375
	ret
GRM_375:
	PUSH_GRM
	jmp LB_4634
LB_4633:
	add r14,1 
LB_4634:
	cmp r14,r9
	jge LB_4635
	JZ_SPC BYTE [r13+8+r14], LB_4633
LB_4635
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4638
	jmp LB_4639
LB_4638:
	mov r8,unt_1
	jmp LB_4636
LB_4639:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4640
	jmp LB_4641
LB_4640:
	mov r8,unt_1
	jmp LB_4636
LB_4641:
	add r14,1
	jmp LB_4637
LB_4636:
	add rsp,0
	jmp LB_4632
LB_4637:
	jmp LB_4643
LB_4642:
	add r14,1 
LB_4643:
	cmp r14,r9
	jge LB_4644
	JZ_SPC BYTE [r13+8+r14], LB_4642
LB_4644
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4647
	jmp LB_4648
LB_4647:
	mov r8,unt_1
	jmp LB_4645
LB_4648:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4649
	jmp LB_4650
LB_4649:
	mov r8,unt_1
	jmp LB_4645
LB_4650:
	add r14,1
	jmp LB_4646
LB_4645:
	add rsp,0
	jmp LB_4632
LB_4646:
	jmp LB_4652
LB_4651:
	add r14,1 
LB_4652:
	cmp r14,r9
	jge LB_4653
	JZ_SPC BYTE [r13+8+r14], LB_4651
LB_4653
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4656
	jmp LB_4657
LB_4656:
	jmp LB_4654
LB_4657:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4655
LB_4654:
	add rsp,0
	jmp LB_4632
LB_4655:
	jmp LB_4659
LB_4658:
	add r14,1 
LB_4659:
	cmp r14,r9
	jge LB_4660
	JZ_SPC BYTE [r13+8+r14], LB_4658
LB_4660
	call GRM_377
	cmp BYTE [r8+6],0
	jnz LB_4663
	jmp LB_4664
LB_4663:
	jmp LB_4661
LB_4664:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a35◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a35◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4662
LB_4661:
	add rsp,8
	jmp LB_4632
LB_4662:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4665
LB_4665
;; rsp=2 , %3232~1'(= r ) %3231~0'(= r ) %3230~9'(= a35◂ [ a18◂ [ ]{| l |}] ) %3229~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %3233~0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } %3232~1'(= r ) %3231~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	add rsp,16
	jmp LB_4666
LB_4666:
	cmp BYTE [r8+6],0
	jnz LB_4632
	POP_GRM_SCC
	ret
LB_4632:
	POP_GRM_FAIL 
	ret
ETR_376:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_376
	ret
GRM_376:
	PUSH_GRM
	call GRM_375
	cmp BYTE [r8+6],0
	jnz LB_4670
	jmp LB_4671
LB_4670:
	jmp LB_4668
LB_4671:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
	jmp LB_4669
LB_4668:
	add rsp,0
	jmp LB_4667
LB_4669:
	call GRM_376
	cmp BYTE [r8+6],0
	jnz LB_4674
	jmp LB_4675
LB_4674:
	jmp LB_4672
LB_4675:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4673
LB_4672:
	add rsp,16
	jmp LB_4667
LB_4673:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_4676
LB_4676
;; rsp=3 , %3237~1'(= r ) %3236~0'(= r ) %3235~10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) %3234~{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %3238~0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %3237~1'(= r ) %3236~0'(= r ) 
; #26 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %3239~0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %3237~1'(= r ) %3236~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}]] )
; {| 001000001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,24
	jmp LB_4677
LB_4677:
	cmp BYTE [r8+6],0
	jnz LB_4667
	POP_GRM_SCC
	ret
LB_4667:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4679
LB_4679
;; rsp=0 , %3241~1'(= r ) %3240~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3242~1(<2)◂{ } %3241~1'(= r ) %3240~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3243~0(<2)◂1(<2)◂{ } %3241~1'(= r ) %3240~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4680
LB_4680:
	cmp BYTE [r8+6],0
	jnz LB_4678
	POP_GRM_SCC
	ret
LB_4678:
	POP_GRM_FAIL 
	ret
ETR_377:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_377
	ret
GRM_377:
	PUSH_GRM
	jmp LB_4683
LB_4682:
	add r14,1 
LB_4683:
	cmp r14,r9
	jge LB_4684
	JZ_SPC BYTE [r13+8+r14], LB_4682
LB_4684
	call GRM_378
	cmp BYTE [r8+6],0
	jnz LB_4687
	jmp LB_4688
LB_4687:
	jmp LB_4685
LB_4688:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4686
LB_4685:
	add rsp,0
	jmp LB_4681
LB_4686:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4689
LB_4689
;; rsp=1 , %3246~1'(= r ) %3245~0'(= r ) %3244~8'(= a37◂ [ a18◂ [ ]{| l |}] ) 
; #244 8'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3247~1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) %3246~1'(= r ) %3245~0'(= r ) 
; #26 1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3248~0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) %3246~1'(= r ) %3245~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4690
LB_4690:
	cmp BYTE [r8+6],0
	jnz LB_4681
	POP_GRM_SCC
	ret
LB_4681:
	RB_GRM
	jmp LB_4693
LB_4692:
	add r14,1 
LB_4693:
	cmp r14,r9
	jge LB_4694
	JZ_SPC BYTE [r13+8+r14], LB_4692
LB_4694
	call GRM_386
	cmp BYTE [r8+6],0
	jnz LB_4697
	jmp LB_4698
LB_4697:
	jmp LB_4695
LB_4698:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4696
LB_4695:
	add rsp,0
	jmp LB_4691
LB_4696:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4699
LB_4699
;; rsp=1 , %3251~1'(= r ) %3250~0'(= r ) %3249~8'(= a36◂ [ a18◂ [ ]{| l |}] ) 
; #245 8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3252~0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3251~1'(= r ) %3250~0'(= r ) 
; #26 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3253~0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3251~1'(= r ) %3250~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4700
LB_4700:
	cmp BYTE [r8+6],0
	jnz LB_4691
	POP_GRM_SCC
	ret
LB_4691:
	POP_GRM_FAIL 
	ret
ETR_378:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_378
	ret
GRM_378:
	PUSH_GRM
	jmp LB_4703
LB_4702:
	add r14,1 
LB_4703:
	cmp r14,r9
	jge LB_4704
	JZ_SPC BYTE [r13+8+r14], LB_4702
LB_4704
	call GRM_385
	cmp BYTE [r8+6],0
	jnz LB_4707
	jmp LB_4708
LB_4707:
	jmp LB_4705
LB_4708:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4706
LB_4705:
	add rsp,0
	jmp LB_4701
LB_4706:
	jmp LB_4710
LB_4709:
	add r14,1 
LB_4710:
	cmp r14,r9
	jge LB_4711
	JZ_SPC BYTE [r13+8+r14], LB_4709
LB_4711
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_4714
	jmp LB_4715
LB_4714:
	jmp LB_4712
LB_4715:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4713
LB_4712:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4713:
	jmp LB_4717
LB_4716:
	add r14,1 
LB_4717:
	cmp r14,r9
	jge LB_4718
	JZ_SPC BYTE [r13+8+r14], LB_4716
LB_4718
	call GRM_379
	cmp BYTE [r8+6],0
	jnz LB_4721
	jmp LB_4722
LB_4721:
	jmp LB_4719
LB_4722:
	sub rsp,24
; .mov_ptn2 2'(= *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}]} ) ⊢ { 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
; {| 11110000111110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*3],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+24]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 3,rdi
	jmp LB_4720
LB_4719:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4720:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_4723
LB_4723
;; rsp=5 , %3260~1'(= r ) %3259~0'(= r ) %3258~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3257~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3256~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3255~9'(= a39◂ [ a18◂ [ ]] ) %3254~8'(= a38◂ [ ] ) 
; #254 { } ⊢ 2'(= a2◂ [ a25◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 0000000011111110.. |}
	call LB_4725
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=5 , %3261~2'(= a2◂ [ a25◂ [ {| l |}]] ) %3260~1'(= r ) %3259~0'(= r ) %3258~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3257~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3256~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3255~9'(= a39◂ [ a18◂ [ ]] ) %3254~8'(= a38◂ [ ] ) 
; #240 { 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %3262~1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } %3260~1'(= r ) %3259~0'(= r ) 
; #26 1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %3263~0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } %3260~1'(= r ) %3259~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a37◂ [ a18◂ [ ]{| l |}]] )
; {| 00100000111110.. |}
	mov r13,r8
	ALC_RCD 6, rax
	mov r8,rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r8+16],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+24],rax
	mov r14,QWORD [rsp-8+8*5]
	mov rax,r14
	mov QWORD [r8+32],rax
	mov r14,QWORD [rsp-8+8*4]
	mov rax,r14
	mov QWORD [r8+40],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r8+48],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_4724
LB_4724:
	cmp BYTE [r8+6],0
	jnz LB_4701
	POP_GRM_SCC
	ret
LB_4701:
	RB_GRM
	jmp LB_4728
LB_4727:
	add r14,1 
LB_4728:
	cmp r14,r9
	jge LB_4729
	JZ_SPC BYTE [r13+8+r14], LB_4727
LB_4729
	call GRM_384
	cmp BYTE [r8+6],0
	jnz LB_4732
	jmp LB_4733
LB_4732:
	jmp LB_4730
LB_4733:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4731
LB_4730:
	add rsp,0
	jmp LB_4726
LB_4731:
	jmp LB_4735
LB_4734:
	add r14,1 
LB_4735:
	cmp r14,r9
	jge LB_4736
	JZ_SPC BYTE [r13+8+r14], LB_4734
LB_4736
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_4739
	jmp LB_4740
LB_4739:
	jmp LB_4737
LB_4740:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4738
LB_4737:
	add rsp,8
	jmp LB_4726
LB_4738:
	jmp LB_4742
LB_4741:
	add r14,1 
LB_4742:
	cmp r14,r9
	jge LB_4743
	JZ_SPC BYTE [r13+8+r14], LB_4741
LB_4743
	call GRM_379
	cmp BYTE [r8+6],0
	jnz LB_4746
	jmp LB_4747
LB_4746:
	jmp LB_4744
LB_4747:
	sub rsp,24
; .mov_ptn2 2'(= *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}]} ) ⊢ { 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
; {| 11110000111110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*3],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+24]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 3,rdi
	jmp LB_4745
LB_4744:
	add rsp,16
	jmp LB_4726
LB_4745:
	jmp LB_4749
LB_4748:
	add r14,1 
LB_4749:
	cmp r14,r9
	jge LB_4750
	JZ_SPC BYTE [r13+8+r14], LB_4748
LB_4750
	call GRM_378
	cmp BYTE [r8+6],0
	jnz LB_4753
	jmp LB_4754
LB_4753:
	jmp LB_4751
LB_4754:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 13'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4752
LB_4751:
	add rsp,40
	jmp LB_4726
LB_4752:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_4755
LB_4755
;; rsp=6 , %3271~1'(= r ) %3270~0'(= r ) %3269~13'(= a37◂ [ a18◂ [ ]{| l |}] ) %3268~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3267~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3266~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3265~9'(= a39◂ [ a18◂ [ ]] ) %3264~8'(= a38◂ [ ] ) 
; #254 { } ⊢ 2'(= a2◂ [ a25◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 00000000111111110.. |}
	call LB_4725
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=6 , %3272~2'(= a2◂ [ a25◂ [ {| l |}]] ) %3271~1'(= r ) %3270~0'(= r ) %3269~13'(= a37◂ [ a18◂ [ ]{| l |}] ) %3268~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3267~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3266~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3265~9'(= a39◂ [ a18◂ [ ]] ) %3264~8'(= a38◂ [ ] ) 
; #241 { 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=6 , %3273~0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3271~1'(= r ) %3270~0'(= r ) 
; #26 0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=6 , %3274~0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3271~1'(= r ) %3270~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a37◂ [ a18◂ [ ]{| l |}]] )
; {| 001000001111110.. |}
	mov r13,r8
	ALC_RCD 7, rax
	mov r8,rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,QWORD [rsp-8+8*4]
	mov rax,r14
	mov QWORD [r8+16],rax
	mov r14,QWORD [rsp-8+8*3]
	mov rax,r14
	mov QWORD [r8+24],rax
	mov r14,QWORD [rsp-8+8*6]
	mov rax,r14
	mov QWORD [r8+32],rax
	mov r14,QWORD [rsp-8+8*5]
	mov rax,r14
	mov QWORD [r8+40],rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+48],rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r8+56],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,48
	jmp LB_4756
LB_4756:
	cmp BYTE [r8+6],0
	jnz LB_4726
	POP_GRM_SCC
	ret
LB_4726:
	POP_GRM_FAIL 
	ret
ETR_379:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_379
	ret
GRM_379:
	PUSH_GRM
	jmp LB_4759
LB_4758:
	add r14,1 
LB_4759:
	cmp r14,r9
	jge LB_4760
	JZ_SPC BYTE [r13+8+r14], LB_4758
LB_4760
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4763
	jmp LB_4764
LB_4763:
	mov r8,unt_1
	jmp LB_4761
LB_4764:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_4765
	jmp LB_4766
LB_4765:
	mov r8,unt_1
	jmp LB_4761
LB_4766:
	add r14,1
	jmp LB_4762
LB_4761:
	add rsp,0
	jmp LB_4757
LB_4762:
	jmp LB_4768
LB_4767:
	add r14,1 
LB_4768:
	cmp r14,r9
	jge LB_4769
	JZ_SPC BYTE [r13+8+r14], LB_4767
LB_4769
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4772
	jmp LB_4773
LB_4772:
	mov r8,unt_1
	jmp LB_4770
LB_4773:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4774
	cmp BYTE [rdi+1],138
	jnz LB_4774
	cmp BYTE [rdi+2],162
	jnz LB_4774
	jmp LB_4775
LB_4774:
	mov r8,unt_1
	jmp LB_4770
LB_4775:
	add r14,3
	jmp LB_4771
LB_4770:
	add rsp,0
	jmp LB_4757
LB_4771:
	jmp LB_4777
LB_4776:
	add r14,1 
LB_4777:
	cmp r14,r9
	jge LB_4778
	JZ_SPC BYTE [r13+8+r14], LB_4776
LB_4778
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_4781
	jmp LB_4782
LB_4781:
	jmp LB_4779
LB_4782:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4780
LB_4779:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4780:
	jmp LB_4784
LB_4783:
	add r14,1 
LB_4784:
	cmp r14,r9
	jge LB_4785
	JZ_SPC BYTE [r13+8+r14], LB_4783
LB_4785
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4788
	jmp LB_4789
LB_4788:
	mov r8,unt_1
	jmp LB_4786
LB_4789:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_4790
	jmp LB_4791
LB_4790:
	mov r8,unt_1
	jmp LB_4786
LB_4791:
	add r14,1
	jmp LB_4787
LB_4786:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4787:
	jmp LB_4793
LB_4792:
	add r14,1 
LB_4793:
	cmp r14,r9
	jge LB_4794
	JZ_SPC BYTE [r13+8+r14], LB_4792
LB_4794
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_4797
	jmp LB_4798
LB_4797:
	jmp LB_4795
LB_4798:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4796
LB_4795:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4796:
	jmp LB_4800
LB_4799:
	add r14,1 
LB_4800:
	cmp r14,r9
	jge LB_4801
	JZ_SPC BYTE [r13+8+r14], LB_4799
LB_4801
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_4804
	jmp LB_4805
LB_4804:
	jmp LB_4802
LB_4805:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4803
LB_4802:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4803:
	jmp LB_4807
LB_4806:
	add r14,1 
LB_4807:
	cmp r14,r9
	jge LB_4808
	JZ_SPC BYTE [r13+8+r14], LB_4806
LB_4808
	call GRM_378
	cmp BYTE [r8+6],0
	jnz LB_4811
	jmp LB_4812
LB_4811:
	jmp LB_4809
LB_4812:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 11'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4810
LB_4809:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4810:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_4813
LB_4813
;; rsp=4 , %3280~1'(= r ) %3279~0'(= r ) %3278~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3277~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3276~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_4816
	jmp LB_4817
LB_4816:
	jmp LB_4815
LB_4817:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3282~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3280~1'(= r ) %3279~0'(= r ) %3278~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3276~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %3283~0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3282~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3280~1'(= r ) %3279~0'(= r ) %3275~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=4 , %3284~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } } %3280~1'(= r ) %3279~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } }
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
; .mov_ptn2 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 0010000011010.. |}
	mov r13,r8
	ALC_RCD 3, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*4]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	ALC_RCD 2, rax
	mov r14,rax
	mov r9,QWORD [rsp-8+8*3]
	mov rax,r9
	mov QWORD [r14+8],rax
	mov r9,QWORD [rsp-8+8*1]
	mov rax,r9
	mov QWORD [r14+16],rax
	mov BYTE [r14+6],0
	mov rax,r14
	mov QWORD [r8+24],rax
	mov BYTE [r8+6],0
	add rsp,32
	jmp LB_4814
LB_4815:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3281~2'(= a2◂ [ *{ rr{| l |}}] ) %3280~1'(= r ) %3279~0'(= r ) %3278~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3276~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; $ %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
;; rsp=4 , %3285~%[ "grm_etr_act_act 0" ] %3281~2'(= a2◂ [ *{ rr{| l |}}] ) %3280~1'(= r ) %3279~0'(= r ) %3278~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3276~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4818
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4819
LB_4819:
;; rsp=4 , %3286~%[ "grm_etr_act_act 0" ] %3281~2'(= a2◂ [ *{ rr{| l |}}] ) %3280~1'(= r ) %3279~0'(= r ) %3278~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3276~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r13
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
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4820
LB_4820:
;; rsp=4 , %3287~{ 0'(= r ) 1'(= r ) } %3286~%[ "grm_etr_act_act 0" ] %3281~2'(= a2◂ [ *{ rr{| l |}}] ) %3278~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3276~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
	mov rdi,LB_4821
	call emt_stg 
	jmp err
LB_4814:
	cmp BYTE [r8+6],0
	jnz LB_4757
	POP_GRM_SCC
	ret
LB_4757:
	RB_GRM
	jmp LB_4824
LB_4823:
	add r14,1 
LB_4824:
	cmp r14,r9
	jge LB_4825
	JZ_SPC BYTE [r13+8+r14], LB_4823
LB_4825
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4828
	jmp LB_4829
LB_4828:
	mov r8,unt_1
	jmp LB_4826
LB_4829:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4830
	cmp BYTE [rdi+1],138
	jnz LB_4830
	cmp BYTE [rdi+2],162
	jnz LB_4830
	jmp LB_4831
LB_4830:
	mov r8,unt_1
	jmp LB_4826
LB_4831:
	add r14,3
	jmp LB_4827
LB_4826:
	add rsp,0
	jmp LB_4822
LB_4827:
	jmp LB_4833
LB_4832:
	add r14,1 
LB_4833:
	cmp r14,r9
	jge LB_4834
	JZ_SPC BYTE [r13+8+r14], LB_4832
LB_4834
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_4837
	jmp LB_4838
LB_4837:
	jmp LB_4835
LB_4838:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4836
LB_4835:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4836:
	jmp LB_4840
LB_4839:
	add r14,1 
LB_4840:
	cmp r14,r9
	jge LB_4841
	JZ_SPC BYTE [r13+8+r14], LB_4839
LB_4841
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_4844
	jmp LB_4845
LB_4844:
	jmp LB_4842
LB_4845:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4843
LB_4842:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4843:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4846
LB_4846
;; rsp=2 , %3291~1'(= r ) %3290~0'(= r ) %3289~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3288~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4849
	jmp LB_4850
LB_4849:
	jmp LB_4848
LB_4850:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3293~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3291~1'(= r ) %3290~0'(= r ) %3288~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %3294~1(<2)◂{ } %3293~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3291~1'(= r ) %3290~0'(= r ) %3288~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } }
;; rsp=2 , %3295~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } } %3291~1'(= r ) %3290~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } }
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
; .mov_ptn2 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } } ⊢ 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 0010000010.. |}
	mov r13,r8
	ALC_RCD 3, rax
	mov r8,rax
	mov r14,QWORD [rsp-8+8*2]
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+16],rax
	mov r14,unt_1
	mov rax,r14
	mov QWORD [r8+24],rax
	mov BYTE [r8+6],0
	add rsp,16
	jmp LB_4847
LB_4848:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3292~2'(= a2◂ [ *{ rr{| l |}}] ) %3291~1'(= r ) %3290~0'(= r ) %3288~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; $ %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
;; rsp=2 , %3296~%[ "grm_etr_act_act 1" ] %3292~2'(= a2◂ [ *{ rr{| l |}}] ) %3291~1'(= r ) %3290~0'(= r ) %3288~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4851
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4852
LB_4852:
;; rsp=2 , %3297~%[ "grm_etr_act_act 1" ] %3292~2'(= a2◂ [ *{ rr{| l |}}] ) %3291~1'(= r ) %3290~0'(= r ) %3288~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,r13
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
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4853
LB_4853:
;; rsp=2 , %3298~{ 0'(= r ) 1'(= r ) } %3297~%[ "grm_etr_act_act 1" ] %3292~2'(= a2◂ [ *{ rr{| l |}}] ) %3288~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
	mov rdi,LB_4854
	call emt_stg 
	jmp err
LB_4847:
	cmp BYTE [r8+6],0
	jnz LB_4822
	POP_GRM_SCC
	ret
LB_4822:
	POP_GRM_FAIL 
	ret
ETR_380:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_380
	ret
GRM_380:
	PUSH_GRM
	jmp LB_4857
LB_4856:
	add r14,1 
LB_4857:
	cmp r14,r9
	jge LB_4858
	JZ_SPC BYTE [r13+8+r14], LB_4856
LB_4858
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_4861
	jmp LB_4862
LB_4861:
	mov r8,unt_1
	jmp LB_4859
LB_4862:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],33
	jnz LB_4863
	cmp BYTE [rdi+1],124
	jnz LB_4863
	jmp LB_4864
LB_4863:
	mov r8,unt_1
	jmp LB_4859
LB_4864:
	add r14,2
	jmp LB_4860
LB_4859:
	add rsp,0
	jmp LB_4855
LB_4860:
	jmp LB_4866
LB_4865:
	add r14,1 
LB_4866:
	cmp r14,r9
	jge LB_4867
	JZ_SPC BYTE [r13+8+r14], LB_4865
LB_4867
	call GRM_381
	cmp BYTE [r8+6],0
	jnz LB_4870
	jmp LB_4871
LB_4870:
	jmp LB_4868
LB_4871:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4869
LB_4868:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4869:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4872
LB_4872
;; rsp=1 , %3301~1'(= r ) %3300~0'(= r ) %3299~8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) 
; #236 8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
;; rsp=1 , %3302~0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3301~1'(= r ) %3300~0'(= r ) 
; #26 0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
;; rsp=1 , %3303~0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3301~1'(= r ) %3300~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
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
; .mov_ptn2 0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 2'(= a3◂ [ a39◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4873
LB_4873:
	cmp BYTE [r8+6],0
	jnz LB_4855
	POP_GRM_SCC
	ret
LB_4855:
	RB_GRM
	jmp LB_4876
LB_4875:
	add r14,1 
LB_4876:
	cmp r14,r9
	jge LB_4877
	JZ_SPC BYTE [r13+8+r14], LB_4875
LB_4877
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_4880
	jmp LB_4881
LB_4880:
	jmp LB_4878
LB_4881:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a40◂ [ a18◂ [ ]] ) ⊢ 8'(= a40◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4879
LB_4878:
	add rsp,0
	jmp LB_4874
LB_4879:
	jmp LB_4883
LB_4882:
	add r14,1 
LB_4883:
	cmp r14,r9
	jge LB_4884
	JZ_SPC BYTE [r13+8+r14], LB_4882
LB_4884
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_4887
	jmp LB_4888
LB_4887:
	jmp LB_4885
LB_4888:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4886
LB_4885:
	add rsp,8
	jmp LB_4874
LB_4886:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4889
LB_4889
;; rsp=2 , %3307~1'(= r ) %3306~0'(= r ) %3305~9'(= a39◂ [ a18◂ [ ]] ) %3304~8'(= a40◂ [ a18◂ [ ]] ) 
; #235 { 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } ⊢ 1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) }
;; rsp=2 , %3308~1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } %3307~1'(= r ) %3306~0'(= r ) 
; #26 1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) }
;; rsp=2 , %3309~0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } %3307~1'(= r ) %3306~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) }
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
; .mov_ptn2 0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } ⊢ 2'(= a3◂ [ a39◂ [ a18◂ [ ]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4890
LB_4890:
	cmp BYTE [r8+6],0
	jnz LB_4874
	POP_GRM_SCC
	ret
LB_4874:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4892
LB_4892
;; rsp=0 , %3311~1'(= r ) %3310~0'(= r ) 
; #234 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3312~2(<3)◂{ } %3311~1'(= r ) %3310~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3313~0(<2)◂2(<3)◂{ } %3311~1'(= r ) %3310~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ }
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
; .mov_ptn2 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a39◂ [ a18◂ [ ]]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4893
LB_4893:
	cmp BYTE [r8+6],0
	jnz LB_4891
	POP_GRM_SCC
	ret
LB_4891:
	POP_GRM_FAIL 
	ret
ETR_381:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_381
	ret
GRM_381:
	PUSH_GRM
	jmp LB_4896
LB_4895:
	add r14,1 
LB_4896:
	cmp r14,r9
	jge LB_4897
	JZ_SPC BYTE [r13+8+r14], LB_4895
LB_4897
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_4900
	jmp LB_4901
LB_4900:
	jmp LB_4898
LB_4901:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a40◂ [ a18◂ [ ]] ) ⊢ 8'(= a40◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4899
LB_4898:
	add rsp,0
	jmp LB_4894
LB_4899:
	jmp LB_4903
LB_4902:
	add r14,1 
LB_4903:
	cmp r14,r9
	jge LB_4904
	JZ_SPC BYTE [r13+8+r14], LB_4902
LB_4904
	call GRM_381
	cmp BYTE [r8+6],0
	jnz LB_4907
	jmp LB_4908
LB_4907:
	jmp LB_4905
LB_4908:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4906
LB_4905:
	add rsp,8
	jmp LB_4894
LB_4906:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4909
LB_4909
;; rsp=2 , %3317~1'(= r ) %3316~0'(= r ) %3315~9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3314~8'(= a40◂ [ a18◂ [ ]] ) 
; #25 { 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) }
;; rsp=2 , %3318~0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } %3317~1'(= r ) %3316~0'(= r ) 
; #26 0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) }
;; rsp=2 , %3319~0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } %3317~1'(= r ) %3316~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a40◂ [ a18◂ [ ]]]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,16
	jmp LB_4910
LB_4910:
	cmp BYTE [r8+6],0
	jnz LB_4894
	POP_GRM_SCC
	ret
LB_4894:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4912
LB_4912
;; rsp=0 , %3321~1'(= r ) %3320~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3322~1(<2)◂{ } %3321~1'(= r ) %3320~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3323~0(<2)◂1(<2)◂{ } %3321~1'(= r ) %3320~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a40◂ [ a18◂ [ ]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4913
LB_4913:
	cmp BYTE [r8+6],0
	jnz LB_4911
	POP_GRM_SCC
	ret
LB_4911:
	POP_GRM_FAIL 
	ret
ETR_382:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_382
	ret
GRM_382:
	PUSH_GRM
	jmp LB_4916
LB_4915:
	add r14,1 
LB_4916:
	cmp r14,r9
	jge LB_4917
	JZ_SPC BYTE [r13+8+r14], LB_4915
LB_4917
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4920
	jmp LB_4921
LB_4920:
	mov r8,unt_1
	jmp LB_4918
LB_4921:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4922
	cmp BYTE [rdi+1],159
	jnz LB_4922
	cmp BYTE [rdi+2],166
	jnz LB_4922
	jmp LB_4923
LB_4922:
	mov r8,unt_1
	jmp LB_4918
LB_4923:
	add r14,3
	jmp LB_4919
LB_4918:
	add rsp,0
	jmp LB_4914
LB_4919:
	jmp LB_4925
LB_4924:
	add r14,1 
LB_4925:
	cmp r14,r9
	jge LB_4926
	JZ_SPC BYTE [r13+8+r14], LB_4924
LB_4926
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4929
	jmp LB_4930
LB_4929:
	jmp LB_4927
LB_4930:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a41◂ [ a18◂ [ ]] ) ⊢ 8'(= a41◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4928
LB_4927:
	add rsp,0
	jmp LB_4914
LB_4928:
	jmp LB_4932
LB_4931:
	add r14,1 
LB_4932:
	cmp r14,r9
	jge LB_4933
	JZ_SPC BYTE [r13+8+r14], LB_4931
LB_4933
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4936
	jmp LB_4937
LB_4936:
	mov r8,unt_1
	jmp LB_4934
LB_4937:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4938
	cmp BYTE [rdi+1],159
	jnz LB_4938
	cmp BYTE [rdi+2],167
	jnz LB_4938
	jmp LB_4939
LB_4938:
	mov r8,unt_1
	jmp LB_4934
LB_4939:
	add r14,3
	jmp LB_4935
LB_4934:
	add rsp,8
	jmp LB_4914
LB_4935:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4940
LB_4940
;; rsp=1 , %3326~1'(= r ) %3325~0'(= r ) %3324~8'(= a41◂ [ a18◂ [ ]] ) 
; #233 8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3327~0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3326~1'(= r ) %3325~0'(= r ) 
; #26 0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3328~0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3326~1'(= r ) %3325~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 2'(= a3◂ [ a40◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4941
LB_4941:
	cmp BYTE [r8+6],0
	jnz LB_4914
	POP_GRM_SCC
	ret
LB_4914:
	RB_GRM
	jmp LB_4944
LB_4943:
	add r14,1 
LB_4944:
	cmp r14,r9
	jge LB_4945
	JZ_SPC BYTE [r13+8+r14], LB_4943
LB_4945
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4948
	jmp LB_4949
LB_4948:
	jmp LB_4946
LB_4949:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a41◂ [ a18◂ [ ]] ) ⊢ 8'(= a41◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4947
LB_4946:
	add rsp,0
	jmp LB_4942
LB_4947:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4950
LB_4950
;; rsp=1 , %3331~1'(= r ) %3330~0'(= r ) %3329~8'(= a41◂ [ a18◂ [ ]] ) 
; #232 8'(= a41◂ [ a18◂ [ ]] ) ⊢ 1(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3332~1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3331~1'(= r ) %3330~0'(= r ) 
; #26 1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3333~0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3331~1'(= r ) %3330~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 2'(= a3◂ [ a40◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4951
LB_4951:
	cmp BYTE [r8+6],0
	jnz LB_4942
	POP_GRM_SCC
	ret
LB_4942:
	POP_GRM_FAIL 
	ret
ETR_383:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_383
	ret
GRM_383:
	PUSH_GRM
	jmp LB_4954
LB_4953:
	add r14,1 
LB_4954:
	cmp r14,r9
	jge LB_4955
	JZ_SPC BYTE [r13+8+r14], LB_4953
LB_4955
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_4958
	jmp LB_4959
LB_4958:
	jmp LB_4956
LB_4959:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4957
LB_4956:
	add rsp,0
	jmp LB_4952
LB_4957:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4960
LB_4960
;; rsp=1 , %3336~1'(= r ) %3335~0'(= r ) %3334~8'(= {| l |} ) 
; #230 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %3337~1(<2)◂8'(= {| l |} ) %3336~1'(= r ) %3335~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %3338~0(<2)◂1(<2)◂8'(= {| l |} ) %3336~1'(= r ) %3335~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a41◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4961
LB_4961:
	cmp BYTE [r8+6],0
	jnz LB_4952
	POP_GRM_SCC
	ret
LB_4952:
	RB_GRM
	jmp LB_4964
LB_4963:
	add r14,1 
LB_4964:
	cmp r14,r9
	jge LB_4965
	JZ_SPC BYTE [r13+8+r14], LB_4963
LB_4965
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_4968
	jmp LB_4969
LB_4968:
	jmp LB_4966
LB_4969:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_4967
LB_4966:
	add rsp,0
	jmp LB_4962
LB_4967:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4970
LB_4970
;; rsp=1 , %3341~1'(= r ) %3340~0'(= r ) %3339~8'(= a18◂ [ ] ) 
; #231 8'(= a18◂ [ ] ) ⊢ 0(<2)◂8'(= a18◂ [ ] )
;; rsp=1 , %3342~0(<2)◂8'(= a18◂ [ ] ) %3341~1'(= r ) %3340~0'(= r ) 
; #26 0(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a18◂ [ ] )
;; rsp=1 , %3343~0(<2)◂0(<2)◂8'(= a18◂ [ ] ) %3341~1'(= r ) %3340~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a18◂ [ ] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a18◂ [ ] ) ⊢ 2'(= a3◂ [ a41◂ [ a18◂ [ ]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_4971
LB_4971:
	cmp BYTE [r8+6],0
	jnz LB_4962
	POP_GRM_SCC
	ret
LB_4962:
	POP_GRM_FAIL 
	ret
ETR_384:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_384
	ret
GRM_384:
	PUSH_GRM
	jmp LB_4974
LB_4973:
	add r14,1 
LB_4974:
	cmp r14,r9
	jge LB_4975
	JZ_SPC BYTE [r13+8+r14], LB_4973
LB_4975
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4978
	jmp LB_4979
LB_4978:
	mov r8,unt_1
	jmp LB_4976
LB_4979:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4980
	cmp BYTE [rdi+1],136
	jnz LB_4980
	cmp BYTE [rdi+2],144
	jnz LB_4980
	cmp BYTE [rdi+3],42
	jnz LB_4980
	jmp LB_4981
LB_4980:
	mov r8,unt_1
	jmp LB_4976
LB_4981:
	add r14,4
	jmp LB_4977
LB_4976:
	add rsp,0
	jmp LB_4972
LB_4977:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4982
LB_4982
;; rsp=0 , %3345~1'(= r ) %3344~0'(= r ) 
; #238 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %3346~1(<3)◂{ } %3345~1'(= r ) %3344~0'(= r ) 
; #26 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %3347~0(<2)◂1(<3)◂{ } %3345~1'(= r ) %3344~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ }
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
; .mov_ptn2 0(<2)◂1(<3)◂{ } ⊢ 2'(= a3◂ [ a38◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4983
LB_4983:
	cmp BYTE [r8+6],0
	jnz LB_4972
	POP_GRM_SCC
	ret
LB_4972:
	RB_GRM
	jmp LB_4986
LB_4985:
	add r14,1 
LB_4986:
	cmp r14,r9
	jge LB_4987
	JZ_SPC BYTE [r13+8+r14], LB_4985
LB_4987
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4990
	jmp LB_4991
LB_4990:
	mov r8,unt_1
	jmp LB_4988
LB_4991:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4992
	cmp BYTE [rdi+1],136
	jnz LB_4992
	cmp BYTE [rdi+2],144
	jnz LB_4992
	cmp BYTE [rdi+3],35
	jnz LB_4992
	jmp LB_4993
LB_4992:
	mov r8,unt_1
	jmp LB_4988
LB_4993:
	add r14,4
	jmp LB_4989
LB_4988:
	add rsp,0
	jmp LB_4984
LB_4989:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4994
LB_4994
;; rsp=0 , %3349~1'(= r ) %3348~0'(= r ) 
; #237 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3350~2(<3)◂{ } %3349~1'(= r ) %3348~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3351~0(<2)◂2(<3)◂{ } %3349~1'(= r ) %3348~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ }
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
; .mov_ptn2 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a38◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_4995
LB_4995:
	cmp BYTE [r8+6],0
	jnz LB_4984
	POP_GRM_SCC
	ret
LB_4984:
	RB_GRM
	jmp LB_4998
LB_4997:
	add r14,1 
LB_4998:
	cmp r14,r9
	jge LB_4999
	JZ_SPC BYTE [r13+8+r14], LB_4997
LB_4999
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_5002
	jmp LB_5003
LB_5002:
	mov r8,unt_1
	jmp LB_5000
LB_5003:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_5004
	cmp BYTE [rdi+1],136
	jnz LB_5004
	cmp BYTE [rdi+2],144
	jnz LB_5004
	jmp LB_5005
LB_5004:
	mov r8,unt_1
	jmp LB_5000
LB_5005:
	add r14,3
	jmp LB_5001
LB_5000:
	add rsp,0
	jmp LB_4996
LB_5001:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_5006
LB_5006
;; rsp=0 , %3353~1'(= r ) %3352~0'(= r ) 
; #239 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %3354~0(<3)◂{ } %3353~1'(= r ) %3352~0'(= r ) 
; #26 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %3355~0(<2)◂0(<3)◂{ } %3353~1'(= r ) %3352~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂{ }
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
; .mov_ptn2 0(<2)◂0(<3)◂{ } ⊢ 2'(= a3◂ [ a38◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_5007
LB_5007:
	cmp BYTE [r8+6],0
	jnz LB_4996
	POP_GRM_SCC
	ret
LB_4996:
	POP_GRM_FAIL 
	ret
ETR_385:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_385
	ret
GRM_385:
	PUSH_GRM
	jmp LB_5010
LB_5009:
	add r14,1 
LB_5010:
	cmp r14,r9
	jge LB_5011
	JZ_SPC BYTE [r13+8+r14], LB_5009
LB_5011
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_5014
	jmp LB_5015
LB_5014:
	mov r8,unt_1
	jmp LB_5012
LB_5015:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_5016
	cmp BYTE [rdi+1],136
	jnz LB_5016
	cmp BYTE [rdi+2],144
	jnz LB_5016
	cmp BYTE [rdi+3],46
	jnz LB_5016
	cmp BYTE [rdi+4],42
	jnz LB_5016
	jmp LB_5017
LB_5016:
	mov r8,unt_1
	jmp LB_5012
LB_5017:
	add r14,5
	jmp LB_5013
LB_5012:
	add rsp,0
	jmp LB_5008
LB_5013:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_5018
LB_5018
;; rsp=0 , %3357~1'(= r ) %3356~0'(= r ) 
; #238 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %3358~1(<3)◂{ } %3357~1'(= r ) %3356~0'(= r ) 
; #26 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %3359~0(<2)◂1(<3)◂{ } %3357~1'(= r ) %3356~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ }
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
; .mov_ptn2 0(<2)◂1(<3)◂{ } ⊢ 2'(= a3◂ [ a38◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_5019
LB_5019:
	cmp BYTE [r8+6],0
	jnz LB_5008
	POP_GRM_SCC
	ret
LB_5008:
	RB_GRM
	jmp LB_5022
LB_5021:
	add r14,1 
LB_5022:
	cmp r14,r9
	jge LB_5023
	JZ_SPC BYTE [r13+8+r14], LB_5021
LB_5023
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_5026
	jmp LB_5027
LB_5026:
	mov r8,unt_1
	jmp LB_5024
LB_5027:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_5028
	cmp BYTE [rdi+1],136
	jnz LB_5028
	cmp BYTE [rdi+2],144
	jnz LB_5028
	cmp BYTE [rdi+3],46
	jnz LB_5028
	cmp BYTE [rdi+4],35
	jnz LB_5028
	jmp LB_5029
LB_5028:
	mov r8,unt_1
	jmp LB_5024
LB_5029:
	add r14,5
	jmp LB_5025
LB_5024:
	add rsp,0
	jmp LB_5020
LB_5025:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_5030
LB_5030
;; rsp=0 , %3361~1'(= r ) %3360~0'(= r ) 
; #237 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3362~2(<3)◂{ } %3361~1'(= r ) %3360~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3363~0(<2)◂2(<3)◂{ } %3361~1'(= r ) %3360~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ }
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
; .mov_ptn2 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a38◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_5031
LB_5031:
	cmp BYTE [r8+6],0
	jnz LB_5020
	POP_GRM_SCC
	ret
LB_5020:
	RB_GRM
	jmp LB_5034
LB_5033:
	add r14,1 
LB_5034:
	cmp r14,r9
	jge LB_5035
	JZ_SPC BYTE [r13+8+r14], LB_5033
LB_5035
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_5038
	jmp LB_5039
LB_5038:
	mov r8,unt_1
	jmp LB_5036
LB_5039:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_5040
	cmp BYTE [rdi+1],136
	jnz LB_5040
	cmp BYTE [rdi+2],144
	jnz LB_5040
	cmp BYTE [rdi+3],46
	jnz LB_5040
	jmp LB_5041
LB_5040:
	mov r8,unt_1
	jmp LB_5036
LB_5041:
	add r14,4
	jmp LB_5037
LB_5036:
	add rsp,0
	jmp LB_5032
LB_5037:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_5042
LB_5042
;; rsp=0 , %3365~1'(= r ) %3364~0'(= r ) 
; #239 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %3366~0(<3)◂{ } %3365~1'(= r ) %3364~0'(= r ) 
; #26 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %3367~0(<2)◂0(<3)◂{ } %3365~1'(= r ) %3364~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂{ }
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
; .mov_ptn2 0(<2)◂0(<3)◂{ } ⊢ 2'(= a3◂ [ a38◂ [ ]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_5043
LB_5043:
	cmp BYTE [r8+6],0
	jnz LB_5032
	POP_GRM_SCC
	ret
LB_5032:
	POP_GRM_FAIL 
	ret
ETR_386:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_386
	ret
GRM_386:
	PUSH_GRM
	jmp LB_5046
LB_5045:
	add r14,1 
LB_5046:
	cmp r14,r9
	jge LB_5047
	JZ_SPC BYTE [r13+8+r14], LB_5045
LB_5047
	call GRM_385
	cmp BYTE [r8+6],0
	jnz LB_5050
	jmp LB_5051
LB_5050:
	jmp LB_5048
LB_5051:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5049
LB_5048:
	add rsp,0
	jmp LB_5044
LB_5049:
	jmp LB_5053
LB_5052:
	add r14,1 
LB_5053:
	cmp r14,r9
	jge LB_5054
	JZ_SPC BYTE [r13+8+r14], LB_5052
LB_5054
	call GRM_388
	cmp BYTE [r8+6],0
	jnz LB_5057
	jmp LB_5058
LB_5057:
	jmp LB_5055
LB_5058:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5056
LB_5055:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_5056:
	jmp LB_5060
LB_5059:
	add r14,1 
LB_5060:
	cmp r14,r9
	jge LB_5061
	JZ_SPC BYTE [r13+8+r14], LB_5059
LB_5061
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_5064
	jmp LB_5065
LB_5064:
	jmp LB_5062
LB_5065:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 10'(= a39◂ [ a18◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5063
LB_5062:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_5063:
	jmp LB_5067
LB_5066:
	add r14,1 
LB_5067:
	cmp r14,r9
	jge LB_5068
	JZ_SPC BYTE [r13+8+r14], LB_5066
LB_5068
	call GRM_387
	cmp BYTE [r8+6],0
	jnz LB_5071
	jmp LB_5072
LB_5071:
	jmp LB_5069
LB_5072:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5070
LB_5069:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_5070:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_5073
LB_5073
;; rsp=4 , %3373~1'(= r ) %3372~0'(= r ) %3371~11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) %3370~10'(= a39◂ [ a18◂ [ ]] ) %3369~9'(= a3◂ [ {| l |}] ) %3368~8'(= a38◂ [ ] ) 
; #242 { 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %3374~1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } %3373~1'(= r ) %3372~0'(= r ) 
; #26 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %3375~0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } %3373~1'(= r ) %3372~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 0010000011110.. |}
	ALC_RCD 4, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*3]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*4]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+24],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+32],rax
	mov BYTE [r8+6],1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,32
	jmp LB_5074
LB_5074:
	cmp BYTE [r8+6],0
	jnz LB_5044
	POP_GRM_SCC
	ret
LB_5044:
	RB_GRM
	jmp LB_5077
LB_5076:
	add r14,1 
LB_5077:
	cmp r14,r9
	jge LB_5078
	JZ_SPC BYTE [r13+8+r14], LB_5076
LB_5078
	call GRM_384
	cmp BYTE [r8+6],0
	jnz LB_5081
	jmp LB_5082
LB_5081:
	jmp LB_5079
LB_5082:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5080
LB_5079:
	add rsp,0
	jmp LB_5075
LB_5080:
	jmp LB_5084
LB_5083:
	add r14,1 
LB_5084:
	cmp r14,r9
	jge LB_5085
	JZ_SPC BYTE [r13+8+r14], LB_5083
LB_5085
	call GRM_388
	cmp BYTE [r8+6],0
	jnz LB_5088
	jmp LB_5089
LB_5088:
	jmp LB_5086
LB_5089:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5087
LB_5086:
	add rsp,8
	jmp LB_5075
LB_5087:
	jmp LB_5091
LB_5090:
	add r14,1 
LB_5091:
	cmp r14,r9
	jge LB_5092
	JZ_SPC BYTE [r13+8+r14], LB_5090
LB_5092
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_5095
	jmp LB_5096
LB_5095:
	jmp LB_5093
LB_5096:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 10'(= a39◂ [ a18◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5094
LB_5093:
	add rsp,16
	jmp LB_5075
LB_5094:
	jmp LB_5098
LB_5097:
	add r14,1 
LB_5098:
	cmp r14,r9
	jge LB_5099
	JZ_SPC BYTE [r13+8+r14], LB_5097
LB_5099
	call GRM_387
	cmp BYTE [r8+6],0
	jnz LB_5102
	jmp LB_5103
LB_5102:
	jmp LB_5100
LB_5103:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5101
LB_5100:
	add rsp,24
	jmp LB_5075
LB_5101:
	jmp LB_5105
LB_5104:
	add r14,1 
LB_5105:
	cmp r14,r9
	jge LB_5106
	JZ_SPC BYTE [r13+8+r14], LB_5104
LB_5106
	call GRM_386
	cmp BYTE [r8+6],0
	jnz LB_5109
	jmp LB_5110
LB_5109:
	jmp LB_5107
LB_5110:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 12'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5108
LB_5107:
	add rsp,32
	jmp LB_5075
LB_5108:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_5111
LB_5111
;; rsp=5 , %3382~1'(= r ) %3381~0'(= r ) %3380~12'(= a36◂ [ a18◂ [ ]{| l |}] ) %3379~11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) %3378~10'(= a39◂ [ a18◂ [ ]] ) %3377~9'(= a3◂ [ {| l |}] ) %3376~8'(= a38◂ [ ] ) 
; #243 { 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %3383~0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } %3382~1'(= r ) %3381~0'(= r ) 
; #26 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %3384~0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } %3382~1'(= r ) %3381~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) }
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
; .mov_ptn2 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 00100000111110.. |}
	ALC_RCD 5, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*4]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,QWORD [rsp-8+8*5]
	mov rax,r13
	mov QWORD [r8+16],rax
	mov r13,QWORD [rsp-8+8*3]
	mov rax,r13
	mov QWORD [r8+24],rax
	mov r13,QWORD [rsp-8+8*2]
	mov rax,r13
	mov QWORD [r8+32],rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+40],rax
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,40
	jmp LB_5112
LB_5112:
	cmp BYTE [r8+6],0
	jnz LB_5075
	POP_GRM_SCC
	ret
LB_5075:
	POP_GRM_FAIL 
	ret
ETR_387:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_387
	ret
GRM_387:
	PUSH_GRM
	jmp LB_5115
LB_5114:
	add r14,1 
LB_5115:
	cmp r14,r9
	jge LB_5116
	JZ_SPC BYTE [r13+8+r14], LB_5114
LB_5116
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_5119
	jmp LB_5120
LB_5119:
	mov r8,unt_1
	jmp LB_5117
LB_5120:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_5121
	jmp LB_5122
LB_5121:
	mov r8,unt_1
	jmp LB_5117
LB_5122:
	add r14,1
	jmp LB_5118
LB_5117:
	add rsp,0
	jmp LB_5113
LB_5118:
	jmp LB_5124
LB_5123:
	add r14,1 
LB_5124:
	cmp r14,r9
	jge LB_5125
	JZ_SPC BYTE [r13+8+r14], LB_5123
LB_5125
	call GRM_386
	cmp BYTE [r8+6],0
	jnz LB_5128
	jmp LB_5129
LB_5128:
	jmp LB_5126
LB_5129:
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5127
LB_5126:
	add rsp,0
	jmp LB_5113
LB_5127:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_5130
LB_5130
;; rsp=1 , %3387~1'(= r ) %3386~0'(= r ) %3385~8'(= a36◂ [ a18◂ [ ]{| l |}] ) 
; #26 8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3388~0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3387~1'(= r ) %3386~0'(= r ) 
; #26 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3389~0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3387~1'(= r ) %3386~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a3◂ [ a36◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_5131
LB_5131:
	cmp BYTE [r8+6],0
	jnz LB_5113
	POP_GRM_SCC
	ret
LB_5113:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_5133
LB_5133
;; rsp=0 , %3391~1'(= r ) %3390~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3392~1(<2)◂{ } %3391~1'(= r ) %3390~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3393~0(<2)◂1(<2)◂{ } %3391~1'(= r ) %3390~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a36◂ [ a18◂ [ ]{| l |}]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_5134
LB_5134:
	cmp BYTE [r8+6],0
	jnz LB_5132
	POP_GRM_SCC
	ret
LB_5132:
	POP_GRM_FAIL 
	ret
ETR_388:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_388
	ret
GRM_388:
	PUSH_GRM
	jmp LB_5137
LB_5136:
	add r14,1 
LB_5137:
	cmp r14,r9
	jge LB_5138
	JZ_SPC BYTE [r13+8+r14], LB_5136
LB_5138
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_5141
	jmp LB_5142
LB_5141:
	jmp LB_5139
LB_5142:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
	jmp LB_5140
LB_5139:
	add rsp,0
	jmp LB_5135
LB_5140:
	jmp LB_5144
LB_5143:
	add r14,1 
LB_5144:
	cmp r14,r9
	jge LB_5145
	JZ_SPC BYTE [r13+8+r14], LB_5143
LB_5145
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_5148
	jmp LB_5149
LB_5148:
	mov r8,unt_1
	jmp LB_5146
LB_5149:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_5150
	jmp LB_5151
LB_5150:
	mov r8,unt_1
	jmp LB_5146
LB_5151:
	add r14,1
	jmp LB_5147
LB_5146:
	add rsp,8
	jmp LB_5135
LB_5147:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_5152
LB_5152
;; rsp=1 , %3396~1'(= r ) %3395~0'(= r ) %3394~8'(= {| l |} ) 
; #26 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %3397~0(<2)◂8'(= {| l |} ) %3396~1'(= r ) %3395~0'(= r ) 
; #26 0(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<2)◂8'(= {| l |} )
;; rsp=1 , %3398~0(<2)◂0(<2)◂8'(= {| l |} ) %3396~1'(= r ) %3395~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= {| l |} )
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
; .mov_ptn2 0(<2)◂0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a3◂ [ {| l |}]] )
; {| 0010000010.. |}
	mov r8,QWORD [rsp-8+8*1]
	mov BYTE [r8+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	add rsp,8
	jmp LB_5153
LB_5153:
	cmp BYTE [r8+6],0
	jnz LB_5135
	POP_GRM_SCC
	ret
LB_5135:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_5155
LB_5155
;; rsp=0 , %3400~1'(= r ) %3399~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3401~1(<2)◂{ } %3400~1'(= r ) %3399~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3402~0(<2)◂1(<2)◂{ } %3400~1'(= r ) %3399~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
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
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ {| l |}]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
	jmp LB_5156
LB_5156:
	cmp BYTE [r8+6],0
	jnz LB_5154
	POP_GRM_SCC
	ret
LB_5154:
	POP_GRM_FAIL 
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,30
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_5157+30-1]
	mov rcx,30
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18634~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
LB_5168:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5172+8*rax]
LB_5172: dq LB_5170,LB_5171
LB_5170:
	mov rdi,LB_5174
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5175
	jmp LB_5173
LB_5171:
	mov rdi,LB_5176
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5173
LB_5173:
	ret
LB_5175:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5179+8*rax]
LB_5179: dq LB_5177,LB_5178
LB_5177:
	mov rdi,LB_5181
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5182
	jmp LB_5180
LB_5178:
	mov rdi,LB_5183
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5184
	jmp LB_5180
LB_5180:
	ret
LB_5184:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5187+8*rax]
LB_5187: dq LB_5185,LB_5186
LB_5185:
	mov rdi,LB_5189
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
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
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5184
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5188
LB_5186:
	mov rdi,LB_5190
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5188
LB_5188:
	ret
LB_5182:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5193+8*rax]
LB_5193: dq LB_5191,LB_5192
LB_5191:
	mov rdi,LB_5195
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5196
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5182
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5194
LB_5192:
	mov rdi,LB_5197
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5194
LB_5194:
	ret
LB_5196:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5204+8*rax]
LB_5204: dq LB_5198,LB_5199,LB_5200,LB_5201,LB_5202,LB_5203
LB_5198:
	mov rdi,LB_5206
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5207
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5205
LB_5199:
	mov rdi,LB_5208
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5209
	jmp LB_5205
LB_5200:
	mov rdi,LB_5210
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5211
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5205
LB_5201:
	mov rdi,LB_5212
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5213
	jmp LB_5205
LB_5202:
	mov rdi,LB_5214
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5215
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5205
LB_5203:
	mov rdi,LB_5216
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5217
	jmp LB_5205
LB_5205:
	ret
LB_5217:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5220+8*rax]
LB_5220: dq LB_5218,LB_5219
LB_5218:
	mov rdi,LB_5222
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5215
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5217
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5221
LB_5219:
	mov rdi,LB_5223
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5221
LB_5221:
	ret
LB_5215:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5226+8*rax]
LB_5226: dq LB_5224,LB_5225
LB_5224:
	mov rdi,LB_5228
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5229
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5230
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5227
LB_5225:
	mov rdi,LB_5231
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5229
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5232
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5227
LB_5227:
	ret
LB_5232:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5238+8*rax]
LB_5238: dq LB_5233,LB_5234,LB_5235,LB_5236,LB_5237
LB_5233:
	mov rdi,LB_5240
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5241
	jmp LB_5239
LB_5234:
	mov rdi,LB_5242
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5232
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5232
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5239
LB_5235:
	mov rdi,LB_5243
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5232
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5232
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5239
LB_5236:
	mov rdi,LB_5244
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5245
	jmp LB_5239
LB_5237:
	mov rdi,LB_5246
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5239
LB_5239:
	ret
LB_5245:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5249+8*rax]
LB_5249: dq LB_5247,LB_5248
LB_5247:
	mov rdi,LB_5251
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5245
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5250
LB_5248:
	mov rdi,LB_5252
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5250
LB_5250:
	ret
LB_5241:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5255+8*rax]
LB_5255: dq LB_5253,LB_5254
LB_5253:
	mov rdi,LB_5257
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5232
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5241
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5256
LB_5254:
	mov rdi,LB_5258
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5256
LB_5256:
	ret
LB_5230:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5261+8*rax]
LB_5261: dq LB_5259,LB_5260
LB_5259:
	mov rdi,LB_5263
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5232
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5230
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5262
LB_5260:
	mov rdi,LB_5264
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5262
LB_5262:
	ret
LB_5229:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5267+8*rax]
LB_5267: dq LB_5265,LB_5266
LB_5265:
	mov rdi,LB_5269
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5229
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5268
LB_5266:
	mov rdi,LB_5270
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5268
LB_5268:
	ret
LB_5213:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5273+8*rax]
LB_5273: dq LB_5271,LB_5272
LB_5271:
	mov rdi,LB_5275
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5277
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5278
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5213
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5274
LB_5272:
	mov rdi,LB_5279
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5274
LB_5274:
	ret
LB_5278:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5287+8*rax]
LB_5287: dq LB_5280,LB_5281,LB_5282,LB_5283,LB_5284,LB_5285,LB_5286
LB_5280:
	mov rdi,LB_5289
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5245
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5288
LB_5281:
	mov rdi,LB_5291
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5292
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5288
LB_5282:
	mov rdi,LB_5293
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5294
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5278
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5288
LB_5283:
	mov rdi,LB_5295
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5296
	jmp LB_5288
LB_5284:
	mov rdi,LB_5297
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5298
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5288
LB_5285:
	mov rdi,LB_5299
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5300
	jmp LB_5288
LB_5286:
	mov rdi,LB_5301
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5288
LB_5288:
	ret
LB_5300:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5304+8*rax]
LB_5304: dq LB_5302,LB_5303
LB_5302:
	mov rdi,LB_5306
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5290
	jmp LB_5305
LB_5303:
	mov rdi,LB_5307
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5305
LB_5305:
	ret
LB_5298:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5310+8*rax]
LB_5310: dq LB_5308,LB_5309
LB_5308:
	mov rdi,LB_5312
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5313
	jmp LB_5311
LB_5309:
	mov rdi,LB_5314
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5315
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5278
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5311
LB_5311:
	ret
LB_5315:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5318+8*rax]
LB_5318: dq LB_5316,LB_5317
LB_5316:
	mov rdi,LB_5320
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5315
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5319
LB_5317:
	mov rdi,LB_5321
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5319
LB_5319:
	ret
LB_5313:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5324+8*rax]
LB_5324: dq LB_5322,LB_5323
LB_5322:
	mov rdi,LB_5326
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5327
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5328
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5329
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5313
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5325
LB_5323:
	mov rdi,LB_5330
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5327
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5328
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5329
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5325
LB_5325:
	ret
LB_5329:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5334+8*rax]
LB_5334: dq LB_5331,LB_5332,LB_5333
LB_5331:
	mov rdi,LB_5336
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5296
	jmp LB_5335
LB_5332:
	mov rdi,LB_5337
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5313
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5335
LB_5333:
	mov rdi,LB_5338
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5278
	jmp LB_5335
LB_5335:
	ret
LB_5328:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5341+8*rax]
LB_5341: dq LB_5339,LB_5340
LB_5339:
	mov rdi,LB_5343
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5344
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5328
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5342
LB_5340:
	mov rdi,LB_5345
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5342
LB_5342:
	ret
LB_5344:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5349+8*rax]
LB_5349: dq LB_5346,LB_5347,LB_5348
LB_5346:
	mov rdi,LB_5351
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5327
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5350
LB_5347:
	mov rdi,LB_5352
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5353
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5353
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5350
LB_5348:
	mov rdi,LB_5354
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5353
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5353
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5350
LB_5350:
	ret
LB_5353:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5357+8*rax]
LB_5357: dq LB_5355,LB_5356
LB_5355:
	mov rdi,LB_5359
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5360
	jmp LB_5358
LB_5356:
	mov rdi,LB_5361
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5358
LB_5358:
	ret
LB_5360:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5369+8*rax]
LB_5369: dq LB_5362,LB_5363,LB_5364,LB_5365,LB_5366,LB_5367,LB_5368
LB_5362:
	mov rdi,LB_5371
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5372
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5372
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5370
LB_5363:
	mov rdi,LB_5373
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5375
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5370
LB_5364:
	mov rdi,LB_5376
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5370
LB_5365:
	mov rdi,LB_5377
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5370
LB_5366:
	mov rdi,LB_5378
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5370
LB_5367:
	mov rdi,LB_5379
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5245
	jmp LB_5370
LB_5368:
	mov rdi,LB_5380
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
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
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5370
LB_5370:
	ret
LB_5375:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5388+8*rax]
LB_5388: dq LB_5381,LB_5382,LB_5383,LB_5384,LB_5385,LB_5386,LB_5387
LB_5381:
	mov rdi,LB_5390
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5389
LB_5382:
	mov rdi,LB_5392
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5393
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5389
LB_5383:
	mov rdi,LB_5394
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5395
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5375
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5389
LB_5384:
	mov rdi,LB_5396
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5397
	jmp LB_5389
LB_5385:
	mov rdi,LB_5398
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5399
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5389
LB_5386:
	mov rdi,LB_5400
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5401
	jmp LB_5389
LB_5387:
	mov rdi,LB_5402
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5389
LB_5389:
	ret
LB_5401:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5405+8*rax]
LB_5405: dq LB_5403,LB_5404
LB_5403:
	mov rdi,LB_5407
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5391
	jmp LB_5406
LB_5404:
	mov rdi,LB_5408
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5406
LB_5406:
	ret
LB_5399:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5411+8*rax]
LB_5411: dq LB_5409,LB_5410
LB_5409:
	mov rdi,LB_5413
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5414
	jmp LB_5412
LB_5410:
	mov rdi,LB_5415
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5416
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5375
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5412
LB_5412:
	ret
LB_5416:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5419+8*rax]
LB_5419: dq LB_5417,LB_5418
LB_5417:
	mov rdi,LB_5421
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5416
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5420
LB_5418:
	mov rdi,LB_5422
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5420
LB_5420:
	ret
LB_5414:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5425+8*rax]
LB_5425: dq LB_5423,LB_5424
LB_5423:
	mov rdi,LB_5427
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5428
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5429
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5430
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5414
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5426
LB_5424:
	mov rdi,LB_5431
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5428
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5429
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5430
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5426
LB_5426:
	ret
LB_5430:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5435+8*rax]
LB_5435: dq LB_5432,LB_5433,LB_5434
LB_5432:
	mov rdi,LB_5437
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5397
	jmp LB_5436
LB_5433:
	mov rdi,LB_5438
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5414
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5436
LB_5434:
	mov rdi,LB_5439
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5375
	jmp LB_5436
LB_5436:
	ret
LB_5429:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5442+8*rax]
LB_5442: dq LB_5440,LB_5441
LB_5440:
	mov rdi,LB_5444
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5445
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5429
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5443
LB_5441:
	mov rdi,LB_5446
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5443
LB_5443:
	ret
LB_5445:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5450+8*rax]
LB_5450: dq LB_5447,LB_5448,LB_5449
LB_5447:
	mov rdi,LB_5452
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5428
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5451
LB_5448:
	mov rdi,LB_5453
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5454
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5454
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5451
LB_5449:
	mov rdi,LB_5455
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5454
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5454
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5451
LB_5451:
	ret
LB_5454:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5458+8*rax]
LB_5458: dq LB_5456,LB_5457
LB_5456:
	mov rdi,LB_5460
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5461
	jmp LB_5459
LB_5457:
	mov rdi,LB_5462
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5459
LB_5459:
	ret
LB_5461:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5470+8*rax]
LB_5470: dq LB_5463,LB_5464,LB_5465,LB_5466,LB_5467,LB_5468,LB_5469
LB_5463:
	mov rdi,LB_5472
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5372
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5372
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5471
LB_5464:
	mov rdi,LB_5473
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5375
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5471
LB_5465:
	mov rdi,LB_5474
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5471
LB_5466:
	mov rdi,LB_5475
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5471
LB_5467:
	mov rdi,LB_5476
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5471
LB_5468:
	mov rdi,LB_5477
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5471
LB_5469:
	mov rdi,LB_5478
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
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
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5471
LB_5471:
	ret
LB_5428:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5481+8*rax]
LB_5481: dq LB_5479,LB_5480
LB_5479:
	mov rdi,LB_5483
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5484
	jmp LB_5482
LB_5480:
	mov rdi,LB_5485
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5486
	jmp LB_5482
LB_5482:
	ret
LB_5486:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5491+8*rax]
LB_5491: dq LB_5487,LB_5488,LB_5489,LB_5490
LB_5487:
	mov rdi,LB_5493
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5428
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5492
LB_5488:
	mov rdi,LB_5494
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5461
	jmp LB_5492
LB_5489:
	mov rdi,LB_5495
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5496
	jmp LB_5492
LB_5490:
	mov rdi,LB_5497
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5492
LB_5492:
	ret
LB_5496:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5500+8*rax]
LB_5500: dq LB_5498,LB_5499
LB_5498:
	mov rdi,LB_5502
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5501
LB_5499:
	mov rdi,LB_5503
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5501
LB_5501:
	ret
LB_5484:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5506+8*rax]
LB_5506: dq LB_5504,LB_5505
LB_5504:
	mov rdi,LB_5508
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5428
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5484
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5507
LB_5505:
	mov rdi,LB_5509
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5507
LB_5507:
	ret
LB_5397:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5512+8*rax]
LB_5512: dq LB_5510,LB_5511
LB_5510:
	mov rdi,LB_5514
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5429
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5430
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5397
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5513
LB_5511:
	mov rdi,LB_5515
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5429
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5430
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5513
LB_5513:
	ret
LB_5395:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5520+8*rax]
LB_5520: dq LB_5516,LB_5517,LB_5518,LB_5519
LB_5516:
	mov rdi,LB_5522
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5521
LB_5517:
	mov rdi,LB_5523
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5393
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5521
LB_5518:
	mov rdi,LB_5524
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5461
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5521
LB_5519:
	mov rdi,LB_5525
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5526
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5527
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5528
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5521
LB_5521:
	ret
LB_5528:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5531+8*rax]
LB_5531: dq LB_5529,LB_5530
LB_5529:
	mov rdi,LB_5533
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5534
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5528
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5532
LB_5530:
	mov rdi,LB_5535
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5532
LB_5532:
	ret
LB_5534:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5538+8*rax]
LB_5538: dq LB_5536,LB_5537
LB_5536:
	mov rdi,LB_5540
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5496
	jmp LB_5539
LB_5537:
	mov rdi,LB_5541
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5539
LB_5539:
	ret
LB_5527:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5544+8*rax]
LB_5544: dq LB_5542,LB_5543
LB_5542:
	mov rdi,LB_5546
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5393
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5527
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5545
LB_5543:
	mov rdi,LB_5547
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5545
LB_5545:
	ret
LB_5526:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5550+8*rax]
LB_5550: dq LB_5548,LB_5549
LB_5548:
	mov rdi,LB_5552
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5553
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5526
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5551
LB_5549:
	mov rdi,LB_5554
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5551
LB_5551:
	ret
LB_5553:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5558+8*rax]
LB_5558: dq LB_5555,LB_5556,LB_5557
LB_5555:
	mov rdi,LB_5560
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5461
	jmp LB_5559
LB_5556:
	mov rdi,LB_5561
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5562
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
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5559
LB_5557:
	mov rdi,LB_5563
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5461
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5559
LB_5559:
	ret
LB_5562:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5568+8*rax]
LB_5568: dq LB_5564,LB_5565,LB_5566,LB_5567
LB_5564:
	mov rdi,LB_5570
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5569
LB_5565:
	mov rdi,LB_5571
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5569
LB_5566:
	mov rdi,LB_5572
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5569
LB_5567:
	mov rdi,LB_5573
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5569
LB_5569:
	ret
LB_5393:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5576+8*rax]
LB_5576: dq LB_5574,LB_5575
LB_5574:
	mov rdi,LB_5578
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5461
	jmp LB_5577
LB_5575:
	mov rdi,LB_5579
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5577
LB_5577:
	ret
LB_5391:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5582+8*rax]
LB_5582: dq LB_5580,LB_5581
LB_5580:
	mov rdi,LB_5584
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5585
	jmp LB_5583
LB_5581:
	mov rdi,LB_5586
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5393
	jmp LB_5583
LB_5583:
	ret
LB_5585:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5589+8*rax]
LB_5589: dq LB_5587,LB_5588
LB_5587:
	mov rdi,LB_5591
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5391
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5585
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5590
LB_5588:
	mov rdi,LB_5592
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5590
LB_5590:
	ret
LB_5374:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5595+8*rax]
LB_5595: dq LB_5593,LB_5594
LB_5593:
	mov rdi,LB_5597
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5416
	jmp LB_5596
LB_5594:
	mov rdi,LB_5598
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5534
	jmp LB_5596
LB_5596:
	ret
LB_5372:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5601+8*rax]
LB_5601: dq LB_5599,LB_5600
LB_5599:
	mov rdi,LB_5603
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5604
	jmp LB_5602
LB_5600:
	mov rdi,LB_5605
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5606
	jmp LB_5602
LB_5602:
	ret
LB_5606:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5611+8*rax]
LB_5611: dq LB_5607,LB_5608,LB_5609,LB_5610
LB_5607:
	mov rdi,LB_5613
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5614
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5612
LB_5608:
	mov rdi,LB_5615
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5461
	jmp LB_5612
LB_5609:
	mov rdi,LB_5616
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
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
	call LB_5372
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5612
LB_5610:
	mov rdi,LB_5617
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
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
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5612
LB_5612:
	ret
LB_5614:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5622+8*rax]
LB_5622: dq LB_5618,LB_5619,LB_5620,LB_5621
LB_5618:
	mov rdi,LB_5624
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5625
	jmp LB_5623
LB_5619:
	mov rdi,LB_5626
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5623
LB_5620:
	mov rdi,LB_5627
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5623
LB_5621:
	mov rdi,LB_5628
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5629
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5623
LB_5623:
	ret
LB_5629:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5632+8*rax]
LB_5632: dq LB_5630,LB_5631
LB_5630:
	mov rdi,LB_5634
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5614
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5629
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5633
LB_5631:
	mov rdi,LB_5635
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5633
LB_5633:
	ret
LB_5625:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5641+8*rax]
LB_5641: dq LB_5636,LB_5637,LB_5638,LB_5639,LB_5640
LB_5636:
	mov rdi,LB_5643
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5642
LB_5637:
	mov rdi,LB_5644
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5614
	jmp LB_5642
LB_5638:
	mov rdi,LB_5645
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5614
	jmp LB_5642
LB_5639:
	mov rdi,LB_5646
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5642
LB_5640:
	mov rdi,LB_5647
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5629
	jmp LB_5642
LB_5642:
	ret
LB_5604:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5650+8*rax]
LB_5650: dq LB_5648,LB_5649
LB_5648:
	mov rdi,LB_5652
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5372
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5604
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5651
LB_5649:
	mov rdi,LB_5653
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5651
LB_5651:
	ret
LB_5327:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5656+8*rax]
LB_5656: dq LB_5654,LB_5655
LB_5654:
	mov rdi,LB_5658
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5659
	jmp LB_5657
LB_5655:
	mov rdi,LB_5660
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5661
	jmp LB_5657
LB_5657:
	ret
LB_5661:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5666+8*rax]
LB_5666: dq LB_5662,LB_5663,LB_5664,LB_5665
LB_5662:
	mov rdi,LB_5668
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5245
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5327
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5667
LB_5663:
	mov rdi,LB_5669
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5360
	jmp LB_5667
LB_5664:
	mov rdi,LB_5670
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5671
	jmp LB_5667
LB_5665:
	mov rdi,LB_5672
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5667
LB_5667:
	ret
LB_5671:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5675+8*rax]
LB_5675: dq LB_5673,LB_5674
LB_5673:
	mov rdi,LB_5677
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5676
LB_5674:
	mov rdi,LB_5678
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5676
LB_5676:
	ret
LB_5659:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5681+8*rax]
LB_5681: dq LB_5679,LB_5680
LB_5679:
	mov rdi,LB_5683
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5327
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5659
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5682
LB_5680:
	mov rdi,LB_5684
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5682
LB_5682:
	ret
LB_5296:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5687+8*rax]
LB_5687: dq LB_5685,LB_5686
LB_5685:
	mov rdi,LB_5689
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5328
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5329
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5296
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5688
LB_5686:
	mov rdi,LB_5690
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5328
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5329
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5688
LB_5688:
	ret
LB_5294:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5695+8*rax]
LB_5695: dq LB_5691,LB_5692,LB_5693,LB_5694
LB_5691:
	mov rdi,LB_5697
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5245
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5696
LB_5692:
	mov rdi,LB_5698
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5292
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5696
LB_5693:
	mov rdi,LB_5699
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5360
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5696
LB_5694:
	mov rdi,LB_5700
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5701
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5702
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5703
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5696
LB_5696:
	ret
LB_5703:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5706+8*rax]
LB_5706: dq LB_5704,LB_5705
LB_5704:
	mov rdi,LB_5708
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5709
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5703
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5707
LB_5705:
	mov rdi,LB_5710
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5707
LB_5707:
	ret
LB_5709:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5713+8*rax]
LB_5713: dq LB_5711,LB_5712
LB_5711:
	mov rdi,LB_5715
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5671
	jmp LB_5714
LB_5712:
	mov rdi,LB_5716
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5714
LB_5714:
	ret
LB_5702:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5719+8*rax]
LB_5719: dq LB_5717,LB_5718
LB_5717:
	mov rdi,LB_5721
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5292
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5702
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5720
LB_5718:
	mov rdi,LB_5722
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5720
LB_5720:
	ret
LB_5701:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5725+8*rax]
LB_5725: dq LB_5723,LB_5724
LB_5723:
	mov rdi,LB_5727
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5728
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5701
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5726
LB_5724:
	mov rdi,LB_5729
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5726
LB_5726:
	ret
LB_5728:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5733+8*rax]
LB_5733: dq LB_5730,LB_5731,LB_5732
LB_5730:
	mov rdi,LB_5735
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5360
	jmp LB_5734
LB_5731:
	mov rdi,LB_5736
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5562
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
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5734
LB_5732:
	mov rdi,LB_5737
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8 
	call emt_r64 
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5360
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5734
LB_5734:
	ret
LB_5292:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5740+8*rax]
LB_5740: dq LB_5738,LB_5739
LB_5738:
	mov rdi,LB_5742
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5360
	jmp LB_5741
LB_5739:
	mov rdi,LB_5743
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5741
LB_5741:
	ret
LB_5290:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5746+8*rax]
LB_5746: dq LB_5744,LB_5745
LB_5744:
	mov rdi,LB_5748
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5749
	jmp LB_5747
LB_5745:
	mov rdi,LB_5750
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5292
	jmp LB_5747
LB_5747:
	ret
LB_5749:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5753+8*rax]
LB_5753: dq LB_5751,LB_5752
LB_5751:
	mov rdi,LB_5755
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5749
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5754
LB_5752:
	mov rdi,LB_5756
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5754
LB_5754:
	ret
LB_5277:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5759+8*rax]
LB_5759: dq LB_5757,LB_5758
LB_5757:
	mov rdi,LB_5761
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5232
	jmp LB_5760
LB_5758:
	mov rdi,LB_5762
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5760
LB_5760:
	ret
LB_5276:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5765+8*rax]
LB_5765: dq LB_5763,LB_5764
LB_5763:
	mov rdi,LB_5767
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5315
	jmp LB_5766
LB_5764:
	mov rdi,LB_5768
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5709
	jmp LB_5766
LB_5766:
	ret
LB_5211:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5772+8*rax]
LB_5772: dq LB_5769,LB_5770,LB_5771
LB_5769:
	mov rdi,LB_5774
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5277
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5278
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5773
LB_5770:
	mov rdi,LB_5775
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5360
	jmp LB_5773
LB_5771:
	mov rdi,LB_5776
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5278
	jmp LB_5773
LB_5773:
	ret
LB_5209:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5779+8*rax]
LB_5779: dq LB_5777,LB_5778
LB_5777:
	mov rdi,LB_5781
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5782
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5209
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5780
LB_5778:
	mov rdi,LB_5783
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5780
LB_5780:
	ret
LB_5782:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5786+8*rax]
LB_5786: dq LB_5784,LB_5785
LB_5784:
	mov rdi,LB_5788
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5789
	jmp LB_5787
LB_5785:
	mov rdi,LB_5790
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5791
	jmp LB_5787
LB_5787:
	ret
LB_5791:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5794+8*rax]
LB_5794: dq LB_5792,LB_5793
LB_5792:
	mov rdi,LB_5796
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5703
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5278
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5797
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5798
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_5799
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*6]
	call LB_5791
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5795
LB_5793:
	mov rdi,LB_5800
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5703
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5278
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5797
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5798
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_5799
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5795
LB_5795:
	ret
LB_5799:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5803+8*rax]
LB_5803: dq LB_5801,LB_5802
LB_5801:
	mov rdi,LB_5805
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5791
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5804
LB_5802:
	mov rdi,LB_5806
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5804
LB_5804:
	ret
LB_5798:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5810+8*rax]
LB_5810: dq LB_5807,LB_5808,LB_5809
LB_5807:
	mov rdi,LB_5812
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5813
	jmp LB_5811
LB_5808:
	mov rdi,LB_5814
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5815
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5798
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5811
LB_5809:
	mov rdi,LB_5816
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5811
LB_5811:
	ret
LB_5815:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5819+8*rax]
LB_5819: dq LB_5817,LB_5818
LB_5817:
	mov rdi,LB_5821
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5822
	jmp LB_5820
LB_5818:
	mov rdi,LB_5823
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5822
	jmp LB_5820
LB_5820:
	ret
LB_5822:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5826+8*rax]
LB_5826: dq LB_5824,LB_5825
LB_5824:
	mov rdi,LB_5828
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5245
	jmp LB_5827
LB_5825:
	mov rdi,LB_5829
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5827
LB_5827:
	ret
LB_5813:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5832+8*rax]
LB_5832: dq LB_5830,LB_5831
LB_5830:
	mov rdi,LB_5834
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5815
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5813
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5833
LB_5831:
	mov rdi,LB_5835
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5833
LB_5833:
	ret
LB_5797:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5839+8*rax]
LB_5839: dq LB_5836,LB_5837,LB_5838
LB_5836:
	mov rdi,LB_5841
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5840
LB_5837:
	mov rdi,LB_5842
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5840
LB_5838:
	mov rdi,LB_5843
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5840
LB_5840:
	ret
LB_5789:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5846+8*rax]
LB_5846: dq LB_5844,LB_5845
LB_5844:
	mov rdi,LB_5848
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5671
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5797
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5798
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5849
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5789
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5847
LB_5845:
	mov rdi,LB_5850
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5671
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5797
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5798
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5849
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5847
LB_5847:
	ret
LB_5849:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5853+8*rax]
LB_5853: dq LB_5851,LB_5852
LB_5851:
	mov rdi,LB_5855
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5789
	jmp LB_5854
LB_5852:
	mov rdi,LB_5856
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5854
LB_5854:
	ret
LB_5207:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5859+8*rax]
LB_5859: dq LB_5857,LB_5858
LB_5857:
	mov rdi,LB_5861
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5182
	jmp LB_5860
LB_5858:
	mov rdi,LB_5862
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5245
	jmp LB_5860
LB_5860:
	ret
LB_5164: ;; #818 0'(= {| l |} ) ⊢ { } : (_s8→{ })
;; rsp=0 , %18619~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,30
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_5165+30-1]
	mov rcx,30
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18620~1'(= {| l |} ) %18619~0'(= {| l |} ) 
; #28 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= {| l |} ) }
	mov rdi,r13
	C_PUSH_REGS
	add rdi,8
	call in_fn
	C_POP_REGS
	mov r8,rax
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %18622~2'(= {| l |} ) %18620~1'(= {| l |} ) 
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
	jmp LB_5166
LB_5166:
;; rsp=0 , %18623~2'(= {| l |} ) %18620~1'(= {| l |} ) 
; #359 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) }
	sub rsp,8
	mov QWORD [rsp+0],r8
; .mov_ptn2 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 1100000010.. |}
	mov r13,r14
	mov r14,0
	call ETR_359
	mov r9,r8
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %18626~3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18625~1'(= r ) %18623~2'(= {| l |} ) 
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
	jmp LB_5167
LB_5167:
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %18626~3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18623~2'(= {| l |} ) 
; #10 3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_5168
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5169
LB_5169:
;; rsp=0 , %18628~3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18623~2'(= {| l |} ) 
;; ? 3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 0(<2)◂0'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_5864
	jmp LB_5865
LB_5864:
	jmp LB_5863
LB_5865:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18629~0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %18623~2'(= {| l |} ) 
;; ? 0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂1'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_5867
	jmp LB_5868
LB_5867:
	jmp LB_5866
LB_5868:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18631~1'(= a2◂ [ a42◂ [ ]] ) %18623~2'(= {| l |} ) 
; #10 %[ "D1" ] ⊢ %[ "D1" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_5869
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5870
LB_5870:
; .dlt.ptn %[ "D1" ]
;; rsp=0 , %18631~1'(= a2◂ [ a42◂ [ ]] ) %18623~2'(= {| l |} ) 
; #10 1'(= a2◂ [ a42◂ [ ]] ) ⊢ 1'(= a2◂ [ a42◂ [ ]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_5182
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5871
LB_5871:
;; rsp=0 , %18633~1'(= a2◂ [ a42◂ [ ]] ) %18623~2'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	call LB_3546
	C_POP_REGS
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
	ret
LB_5866:
;; ?. 0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18630~1'(= a2◂ [ *{ rr{| l |}}] ) %18623~2'(= {| l |} ) 
	mov rdi,LB_5872
	call emt_stg 
	jmp err
LB_5863:
;; ?. 3'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %18623~2'(= {| l |} ) 
	mov rdi,LB_5873
	call emt_stg 
	jmp err
RTM_1:
;; rsp=0 , %18634~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,8
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_5158+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18635~2'(= {| l |} ) %18634~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; #10 0'(= {| {| l |}|} ) ⊢ 0'(= {| {| l |}|} )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,[r8]
	mov rax,0 
LB_5159:
	cmp rsi,rax 
	jz LB_5160
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
	jmp LB_5159
LB_5160:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5161
LB_5161:
;; rsp=0 , %18636~0'(= {| {| l |}|} ) %18635~2'(= {| l |} ) %18634~1'(= {| l |} ) 
; #4 { 0'(= {| {| l |}|} ) %[ 1r ] } ⊢ { 0'(= {| {| l |}|} ) %[ 1r ] 4'(= {| l |} ) }
	mov rax,1
	mov rdi,r13
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
; .dlt.ptn %[ 1r ]
; .dlt.ptn 0'(= {| {| l |}|} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
LB_5162:
	cmp rsi,rax 
	jz LB_5163
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
	jmp LB_5162
LB_5163:
	C_POP_REGS
;; rsp=0 , %18639~4'(= {| l |} ) %18635~2'(= {| l |} ) %18634~1'(= {| l |} ) 
; #818 4'(= {| l |} ) ⊢ { }
	sub rsp,16
	mov QWORD [rsp+0],r14
	mov QWORD [rsp+8],r8
; .mov_ptn2 4'(= {| l |} ) ⊢ 0'(= {| l |} )
; {| 10001000110.. |}
	mov r13,r10
	call LB_5164
	mov r8,QWORD [rsp-8+8*2]
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
; .dlt.ptn { }
;; rsp=0 , %18635~2'(= {| l |} ) %18634~1'(= {| l |} ) 
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
	C_CALL printf
	mov rax,1
	mov rbx,0
	int 0x80
